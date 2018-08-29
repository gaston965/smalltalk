
Object subclass: #Resource
  instanceVariableNames: 
    'type offset id '
  classVariableNames: ''
  poolDictionaries: ''    !


!Resource class methods ! !



!Resource methods !
   
id
        "Answer  the receiver' id - Can be anInteger or a string"

    ^id!
   
id:anId
        "Set the receiver' id - Can be anInteger or a string"
    id:=anId!
   
offset
        "Answer the receiver's offset"

    ^offset!
  
offset:anInteger
        "Set the receiver's offset"

    offset:=anInteger!
 
type
        "Answer the receiver's type"

    ^type!

type:anInteger
        "Set the receiver's type"

    type:=anInteger! !

Resource subclass: #IconGroup
  instanceVariableNames: 
    'iconDir iconEntries '
  classVariableNames: ''
  poolDictionaries: ''   !


!IconGroup class methods ! !



!IconGroup methods !
 
iconDir
        "Answer the receiver's icon directory"

    ^iconDir!

iconDir:aSelfDefinedStructure
        "Set the receiver's icon directory"

    iconDir:=aSelfDefinedStructure!
   
iconEntries
        "Answer the receiver's iconEntries"

    ^iconEntries!
   
iconEntries:aSelfDefinedStructure
        "Set the receiver's icon entries"

    iconEntries:=aSelfDefinedStructure! !

Resource subclass: #IconResource
  instanceVariableNames: 
    'iconType name icon '
  classVariableNames: ''
  poolDictionaries: ''   !


!IconResource class methods ! !



!IconResource methods !
   
icon
        "Answer the receiver's icon"

    ^icon!

icon:anIcon
        "Set the receiver's icon"

    icon:=anIcon!
 
iconType
        "Answer the receiver's icon type"

    ^iconType!
   
iconType:aSymbol
        "Set the receiver's icon type"

    iconType:=aSymbol!
  
name
        "Answer the receiver's name"

    ^name!

name:aName
        "Set the receiver's name"

    name:=aName! !
