
DoubleByteString variableByteSubclass: #DoubleByteSymbol
  classVariableNames: ''
  poolDictionaries: ''    !

!DoubleByteSymbol methods !

initContents: aDBString
        "Private - initialize the receiver to contain
         the character sequence in aDBString."
    super
        replaceBytesFrom: 1 to: aDBString basicSize
        with: aDBString
        startingAt: 1! !

!DoubleByteSymbol class methods !

intern: aDBString
        "Private - Answer a DoubleByteSymbol whose character
         sequence is the same as that of aDBString."
    | answer symbol |
    symbol := (super new: aDBString size) initContents: aDBString.
    (answer := SymbolTable symbolAt: symbol) == nil
        ifTrue: [
            answer := symbol.
            SymbolTable add: symbol].
    ^answer!

mustBeSymbol: aSymbol
        "Report an error if aSymbol is not a Symbol."
    aSymbol isSymbol
        ifFalse: [^self error: 'Must be a Symbol']!
 
new: ignoreArgument
        "Private - Answer an instance of the receiver.
         This method reports an error."
    ^self invalidMessage! !



!DoubleByteSymbol methods !

= aSymbol
        "Answer true if the receiver object is the
         the argument aSymbol, else answer false."
    <primitive: 110>!

asCompactString
        " Answer the most compact string containing the
         characters of the receiver. "
    ^self asString!
   
asString
        "Answer a String of the characters
         contained by the receiver."
    ^(DoubleByteString new: self size)
        replaceFrom: 1
        to: self size
        with: self!
  
asSymbol
        "Answer a Symbol for the receiver.  The receiver
         itself is answered since it is a Symbol."
    ^self!
  
at: anInteger put: aCharacter
        "Replace the character in the receiver indexed by
         anInteger with the argument aCharacter.  This
         message is not valid for symbols, since they
         are not allowed to change."
    ^self invalidMessage!

basicHash
        "Answer the integer hash
         of the receiver."
    ^self hash!

containsDBCharacter
        " Answer whether the receiver contains any double-byte characters. "
    ^true!
   
deepCopy
        "Answer a copy of the receiver with shallow
         copies of each instance variable.  Because
         symbols are unique (cannot be copied),
         answer the receiver."
     ^self!

equals: aSymbol
        "Answer true if the receiver is equal to
         the argument aSymbol, else answer false.
         Note that the comparison is case sensitive."
    <primitive: 132>
    ^false!
  
hash
        "Answer the integer hash
         of the receiver."
    <primitive: 93>!

id
        "Private - Answer the integer id
         of the receiver."
    <primitive: 75>!
   
id: anInteger
        "Private - Set the id of the
         receiver to anInteger."
    <primitive: 76>!
 
initContents: aDBString
        "Private - initialize the receiver to contain
         the character sequence in aDBString."
    super
        replaceBytesFrom: 1 to: aDBString basicSize
        with: aDBString
        startingAt: 1!

isDoubleByteSymbol
        "Answer true if receiver is an instance of class
         DoubleByteSymbol, else answer false."
    ^true!
 
isSymbol
        "Private - Answer true if receiver is an instance of class
         Symbol or one of its subclasses, else answer false."
    ^true!
 
printOn: aStream
        "Append the ASCII representation of
         the receiver to aStream."
    aStream nextPutAll: self!

replace: count with: aCollection
        "Replace count elements of the receiver
         with elements of aCollection.  This
         message is not valid for symbols, since they
         are not allowed to change."
    ^self invalidMessage!
 
replaceBytes: count with: aCollection
        "Private - replace count bytes of the receiver
         with bytes of aCollection.  aCollection
         may be either a Smalltalk byte object or
         an instance of WinAddress.  This
         message is not valid for symbols, since they
         are not allowed to change."
    ^self invalidMessage!

replaceBytesFrom: byteStart
    to: byteStop
    with: aVariableByteObject
    startingAt: byteRepStart
        "Private - replace the bytes of the receiver at index
         positions start through stop with consecutive
         bytes of aVariableByteObject beginning at index
         position repStart.  This message is not valid
         for symbols, since they are not allowed to change."
    ^self invalidMessage!

replaceFrom: start
    to: stop
    with: aString
    startingAt: repStart
        "Replace the characters of the receiver at index
         positions start through stop with consecutive
         characters of aString beginning at index
         position repStart.  This message is not valid
         for symbols, since they are not allowed to change."
    ^self invalidMessage!
 
replaceFrom: start to: stop withObject: aCharacter
        "Replace the characters of the receiver
         at index positions start through stop
         with aCharacter.  This message is not valid
         for symbols, since they are not allowed to change."
    ^self invalidMessage!
  
shallowCopy
        "Answer a shallow copy of the receiver.
         Because symbols are unique (cannot be
         copied), answer the receiver."
    ^self!
   
species
        "Answer class DoubleByteString as the
         species of double-byte symbols."
    ^DoubleByteString!
   
storeOn: aStream
        "Append the text representation of the
         receiver to aStream from which the
         receiver can be reconstructed."
    aStream
        nextPut: $#;
        nextPutAll: self! !
