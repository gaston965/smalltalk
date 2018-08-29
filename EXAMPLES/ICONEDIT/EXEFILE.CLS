
Object subclass: #ExeFile
  instanceVariableNames: 
    'exeHeader newExeHeader shiftCount resources posResourceTable fileName '
  classVariableNames: ''
  poolDictionaries: 
    'ExecutableFileFormatConstants '  !


!ExeFile class methods !
 
openOn:aFileName
        "Create an ExeFile object"

    ^self new
        initialize;
        openOn:aFileName.! !



!ExeFile methods !
  
fileName
        "Answer the receiver's fileName"

    ^fileName!

getIconsType:aGroupIcon
        "Private - Set the icon types. It can be CGA, EGA/VGA or
        high - resolution"

    |iconEntries iconTypes|
    iconTypes:=(Array new:5)
                            at:1 put: #(32 16 1 CGA);
                            at:2 put: #(32 32 1 MONO);
                            at:3 put: #(32 32 4 EGA);
                            at:4 put: #(32 32 4 VGA);
                            at:5 put: #(64 64 4 HIRES);
                            yourself.
    iconEntries:=aGroupIcon iconEntries.
    iconEntries do:[:each |
            (self icons at: (each wOrdinalNumber)) iconType:#unknown.
            iconTypes do:[:type |
                    (((each width = (type at: 1))
                    and:[each height = (type at: 2)])
                    and:[each wBitsPerPel = (type at:3)]) ifTrue:[
                    ((self icons at: (each wOrdinalNumber))) iconType: (type at: 4).
                    ((self icons at: (each wOrdinalNumber))) name: aGroupIcon id]]].!
 
groupIcons
        "Answer resources of type GroupIcon"

    ^self resources select:[:each | each type = GroupIconResType ].!

icons
        "Answer resources of type Icon"

    ^self resources select:[:each | each type = IconResourceType ].!
  
initialize
        "Private - Initialize receiver's instance variable"

    resources:=Array new.!
   
makeIcons
        "Make the icons object"

    CursorManager execute change.

    self icons do:[:each |
        each iconType = #VGA ifTrue:[
            each icon: (Icon fromExeFile:self id:each)]
        ifFalse:[each icon: nil]].

    CursorManager normal change.!
  
openOn:aFileName
        "Private - initialize the ExeFile object"
    |file bytes loop resourceTypeInfo resourceNameInfo nextEntry|
    CursorManager execute change.
    fileName:=aFileName.
    file := File pathNameReadOnly: aFileName.

    exeHeader:=SelfDefinedStructure named:'EXEHDR'.
    bytes:=ByteArray new:exeHeader sizeInBytes.
    file getBytesFor:bytes.
    exeHeader contents:bytes.

    file position: exeHeader lNewExeOffset.

    newExeHeader:=SelfDefinedStructure named:'NEWEXEHDR'.
    bytes:=ByteArray new:newExeHeader sizeInBytes.
    file getBytesFor:bytes.
    newExeHeader contents:bytes.

    posResourceTable:=exeHeader lNewExeOffset + newExeHeader wResourceOffset.
    file position:posResourceTable.
    shiftCount:=file nextUShort.
    nextEntry:=file position.
    resourceTypeInfo:=SelfDefinedStructure named:'RESTYPEINFO'.
    resourceNameInfo:=SelfDefinedStructure named:'RESNAMEINFO'.
    loop:=true.
    [loop] whileTrue:[
        file position:nextEntry.
        bytes:=ByteArray new:resourceTypeInfo sizeInBytes.
        file getBytesFor:bytes.
        resourceTypeInfo contents:bytes.
        resourceTypeInfo wType = 0 ifTrue:[loop:=false].
        self readResources:resourceTypeInfo with:file.
        nextEntry:=nextEntry + resourceTypeInfo sizeInBytes + (resourceTypeInfo wCount * resourceNameInfo sizeInBytes)].

    self readIconGroupsOn:file.
    file close.

    CursorManager normal change.!
   
readIconGroupsOn:aFile
        "Private - Read the icon groups"
    |iconGroups bytes iconDir iconEntry iconEntries i|

    iconGroups:=self groupIcons.
    iconGroups do:[:each |
        iconDir:=SelfDefinedStructure named:'ICONDIR'.
        bytes:=ByteArray new:iconDir sizeInBytes.
        aFile position: each offset.
        aFile getBytesFor:bytes.
        iconDir contents: bytes.
        iconEntries:=Array new:iconDir wCount.
        i :=0.
        iconDir wCount timesRepeat:[
            i := i + 1.
            iconEntry:=SelfDefinedStructure named:'ICONENTRY'.
            bytes:=ByteArray new:iconEntry sizeInBytes.
            aFile getBytesFor:bytes.
            iconEntry contents: bytes.
            iconEntries at: i put: iconEntry].
        each iconDir: iconDir.
        each iconEntries: iconEntries.
        self getIconsType:each.
        ].!
   
readResources:aResourceType with:file
        "Private - Save the icons' offset"
    |resourceNameInfo bytes resource name current|
    (aResourceType wType bitAnd: OrdinalFlag )= 0
        ifTrue:[^self].
    resources:=resources asOrderedCollection.
    resourceNameInfo:=SelfDefinedStructure named:'RESNAMEINFO'.
    bytes:=ByteArray new:resourceNameInfo sizeInBytes.
    aResourceType wCount timesRepeat:[
        resource:=nil.
        (aResourceType wType bitXor: OrdinalFlag) = GroupIconResType ifTrue:[
            resource:= IconGroup new].
        (aResourceType wType bitXor: OrdinalFlag) = IconResourceType ifTrue:[
            resource:= IconResource new].
        resource isNil ifTrue:[
            resource :=Resource new].
        resource  type: (aResourceType wType bitXor: OrdinalFlag).
        file getBytesFor:bytes.
        resourceNameInfo contents:bytes.
        resource  offset:(resourceNameInfo wOffset bitShift:shiftCount).
        (resourceNameInfo wID & OrdinalFlag) = OrdinalFlag
            ifTrue:[resource  id: (resourceNameInfo wID bitXor: OrdinalFlag)]
            ifFalse:[
                current:=file position.
                file position: posResourceTable + resourceNameInfo wID.
                name:=String new:file nextByte.
                file getBytesFor: name.
                resource  id: name.
                file position:current].
        resources add:resource ].
    resources:=resources asArray.!
  
release
        "Private - Release resources"

    self icons do:[:each | each icon notNil ifTrue:[each icon release]].!
 
resources
        "Answer the resources of the module"

    ^resources!
  
shiftCount
        "Answer the receiver's shiftcount"

    ^shiftCount! !
