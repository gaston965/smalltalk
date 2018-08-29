
Inspector subclass: #SelfDefinedStructureInspector
  instanceVariableNames:
    'fieldSelected '
  classVariableNames: ''
  poolDictionaries:
    'CharacterConstants '    !


!SelfDefinedStructureInspector class methods ! !



!SelfDefinedStructureInspector methods !

accept: textPane
        "Private - Replace the selected instance
         variable with the result of evaluating
         the contents of textPane."
    | result aString |
    aString := textPane contents.
    result := Compiler
        evaluate: aString
        in: object class
        to: object
        notifying: textPane
        ifFail: [^textPane modified: true].
    Smalltalk logEvaluate: aString.
    fieldSelected notNil ifTrue: [
        object perform: (fieldSelected , ':') asSymbol with: result.
        textPane modified: false.
        ^self].
    instIndex = 1
        ifFalse: [
            object class isBytes
                ifTrue: [
                    object
                        at: (instIndex - 1)
                        put: result]
                ifFalse: [
                    object
                        instVarAt: self getInstVarIndex
                        put: result]].
    self changed: #instance:.
    textPane modified: false.!

fieldList: aListBox
        "Show the structure fields."
    aListBox contents:
        (object definition keys select: [ :k | k last ~= $:])
            asSortedCollection.!

inspectField: aListBox
        "Inspect the field selected."
    ( object perform: aListBox selectedItem ) inspect .!

inspectSelection
        "Private - Open an Inspector on the
         selected instance variable."
    fieldSelected isNil
        ifTrue: [^super inspectSelection]
        ifFalse: [ (object perform: fieldSelected ) inspect ].!

instance: textPane
        "Private - Set the ASCII representation
         of the selected instance variable."
    fieldSelected isNil
        ifTrue: [
            instIndex = 1 ifFalse: [ ^super instance: textPane ].
            textPane contents:
                object printString,
                (String with: Lf),
                object contents printString ]
        ifFalse: [
            ^textPane contents:
                (object perform: fieldSelected ) printString].!

instVarList: pane
        "Private - Set an OrderedCollection of
         instance variable names and/or numbers for
         the list pane."
    pane contents: instList.
    instIndex := pane selection.
    self changed: #instance:.!

openOn: aStruct
        "Open an inspector window on aStruct.  Define
         the pane sizes and behavior, and shedule the
         window."
    object := aStruct.
    instPane :=TextPane new
        owner: self;
        when: #getContents perform: #instance: ;
        when: #save perform: #accept: ;
        framingBlock: [ :blk |
            blk width // 3 @ blk top
                rightBottom: blk rightBottom].
    self
        label: 'Inspecting: ', object class printString;
        owner: self.
    self addSubpane:
        (ListBox new
            owner: self;
            when: #getContents perform: #instVarList: ;
            when: #select perform: #selectInstance: ;
            when: #doubleClickSelect perform: #inspectSelection: ;
            framingBlock: [ :blk |
                blk leftTop
                    extentFromLeftTop: blk width // 3 @ (blk height // 4 )]).
    self addSubpane:
        (ListBox new
            owner: self;
            when: #getContents perform: #fieldList: ;
            when: #select perform: #selectField: ;
            when: #doubleClickSelect perform: #inspectField: ;
            when: #getMenu perform: #inspectMenu: ;
            framingRatio:
                ( Rectangle leftBottomUnit
                    extentFromLeftBottom:
                        ( 1/3 ) @ ( 3/4) ) ).

    self addSubpane: instPane.
    self setInstList.
    self openWindow!

selectField: aListBox
        "Private - Select the field."
    self enableInspectItem.
    self changed: #instVarList: with: #selectItem: with: 0.
    instIndex := nil.
    fieldSelected  := aListBox selectedItem.
    self changed: #instance: .!

selectInstance: aListPane
        "Private - Select the instance variable at
         index position anInteger in the list."
    self changed: #fieldList: with: #selectItem: with: 0.
    instIndex := aListPane selection.
    fieldSelected := nil.
    self enableInspectItem.
    self changed: #instance:! !

!SelfDefinedStructure methods !

inspect
        "Open a dictionary inspector window
         on the receiver."
    SelfDefinedStructureInspector new openOn: self! !

!SelfDefinedStructure methods !  
printOn: aStream
        "Append the ASCII representation of the receiver
         to aStream.  This is the default implementation which
         prints 'a' ('an') followed by the receiver class name."
    | aString |
    aString := self class nameOf: self.
    (aString at: 1) isVowel
        ifTrue: [aStream nextPutAll: 'an ']
        ifFalse: [aStream nextPutAll: 'a '].
    aStream nextPutAll: aString!    !

!SelfDefinedStructure class methods !
nameOf: aSelfDefinedStructure
        "Answer the name aSelfDefinedStructure."
    ^Definitions 
        keyAtValue: aSelfDefinedStructure definition
        ifAbsent: [ 'UNKNOWN' ]!  !
