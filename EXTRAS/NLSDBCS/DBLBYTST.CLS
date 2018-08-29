
String variableByteSubclass: #DoubleByteString
  classVariableNames: ''
  poolDictionaries: '' !


!DoubleByteString class methods !

fromAddress: aWinAddress
        "Answer a DoubleByteString whose bytes are copied
        from memory at aWinAddress."
    | s charIndex byteIndex |
    s := self new: 1.
    charIndex := 1.
    byteIndex := 1.
    [s replaceBytesFrom: 1
          to: 2
          with: aWinAddress
          startingAt: byteIndex.
    (s at: 1) asciiValue = 0] whileFalse: [
        charIndex := charIndex + 1.
        byteIndex := byteIndex + 2].
    ^self fromAddress: aWinAddress length: charIndex - 1.!

fromAddress: aWinAddress length: anInteger
        "Answer a DoubleByteString of size anInteger characters
         whose bytes are copied from memory at aWinAddress."
    | t |
    t := self new: anInteger.
    t replaceFrom: 1
          to: anInteger
          withAddress: aWinAddress
          startingAt: 1.
   ^t!

fromMixedString: aString
        " Answer a DoubleByteString representing aString.  The
        single-byte characters of aString are interpreted as a
        mixed-string encoding in the current national language."
    ^(NationalLanguage isDoubleByteCp)
        ifTrue: [self fromMixedString: aString leadBytes: NationalLanguage leadBytes]
        ifFalse: [self fromString: aString].!

fromMixedString: aString leadBytes: leadByteFlags
        " Answer a DoubleByteString representing aString.  The
        single-byte characters of aString are interpreted as a
        mixed-string encoding, based on the given leadByteFlags
        array of Booleans. "
    | stringSize stringIndex dbString dbStringSize dbByteIndex
        leadByte trailByte nullByte |
    stringSize := aString size.
    (stringSize = 0) ifTrue: [^self new].
    (dbStringSize := VWVMLibrary doubleByteStringSizeFrom: aString
      leadBytes: leadByteFlags) < 0 ifFalse: [
        dbString := self new: dbStringSize.
        (VWVMLibrary mixedString: aString
               toDoubleByteString: dbString
            leadBytes: leadByteFlags) < 0 ifFalse: [^dbString]].
    "The following is executed only when the VWVMLibrary APIs fail."
    nullByte := 0 asCharacter.
    dbString := self new: stringSize.  " worst case is all SBC's "
    dbByteIndex := 0.
    stringIndex := 0.
    [stringIndex < stringSize] whileTrue: [
        stringIndex := stringIndex + 1.
        leadByte := aString at: stringIndex.
        (leadByte isLeadByte: leadByteFlags)
            ifTrue: [  " double-byte character "
                stringIndex := stringIndex + 1.
                (stringIndex > stringSize)
                    ifTrue: [ trailByte := nullByte]     "String with missing trail byte"
                    ifFalse: [ trailByte := aString at: stringIndex]]
         ifFalse: [   " single-byte character "
                trailByte := leadByte.
                leadByte := nullByte].
        dbByteIndex := dbByteIndex + 1.
        dbString basicAt: dbByteIndex put: leadByte.
        dbByteIndex := dbByteIndex + 1.
        dbString basicAt: dbByteIndex put: trailByte.
        ].
    ^dbString copyFrom: 1 to: (dbByteIndex // 2)!

fromString: aString
        " Answer a DoubleByteString containing the characters
        of aString. "
    | stringSize dbString dbByteIndex aChar |
    aString isDoubleByteString ifTrue: [ ^aString ].
    stringSize := aString size.
    (stringSize = 0) ifTrue: [^self new].  " degenerate case "
    dbString := self new: stringSize.
    dbByteIndex := 0.
    aString do: [ :trailByte |
        dbByteIndex := dbByteIndex + 2.  " lead byte is already 0 "
        dbString basicAt: dbByteIndex put: trailByte].
    ^dbString! 

new: anInteger
        " Answer a new DoubleByteString containing anInteger characters. "
    ^super new: (anInteger * 2)! !



!DoubleByteString methods !

asAsciiZ
        "Answer a new String containing the characters
         of the receiver in mixed-string encoding, followed
         by one character of code point value zero. "
    ^self asMixedStringWithNull: true!

asByteArray
        "Answer a ByteArray whose contents are the
         bytes of the receiver.  Each character in the
         receiver is represented by two bytes in the
         ByteArray, where the first byte of each pair
         is the high-order lead byte of the character
         and the second byte is the low-order trail
         byte of the character."
    | b |
    b := ByteArray new: self basicSize.
    ^b replaceFrom: 1 to: b size with: self startingAt: 1.!

asCompactString
        " Answer the most compact string containing the
         characters of the receiver. "
    ^self containsDBCharacter
        ifTrue: [self]
        ifFalse: [self asMixedString]   " produces a single-byte String "!

asMixedString
        "Answer a new String containing the characters
         of the receiver in mixed-string encoding. "
    ^self asMixedStringWithNull: false!

asMixedStringWithNull: appendNull
        " Private - answer a new String containing
        all the characters of the receiver in 
        mixed-length encoding.  Optionally append
        a null-terminator byte."
    | sizeInBytes mixedString stringIndex byteIndex aChar |
    (sizeInBytes := VWVMLibrary mixedStringSizeFrom: self) < 0
        ifFalse: [
            mixedString := String new:
                (sizeInBytes + (appendNull ifTrue: [1] ifFalse: [0])).
            (stringIndex := VWVMLibrary doubleByteString: self toMixedString: mixedString) < 0
                ifFalse: [
                    appendNull ifTrue: [
                        stringIndex := stringIndex + 1.
                        mixedString at: stringIndex put: 0 asCharacter].
                    ^mixedString]].
    "The following is executed only when the VWVMLibrary APIs fail."
    sizeInBytes := self basicSize.
    mixedString := String new:
        (sizeInBytes + (appendNull ifTrue: [1] ifFalse: [0])).
    stringIndex := 1.
    byteIndex := 1.
    [byteIndex <= sizeInBytes]
        whileTrue: [
            aChar := self basicAt: byteIndex.
            (aChar asInteger = 0) ifFalse: [       " lead byte of DBC "
                mixedString at: stringIndex put: aChar.
                stringIndex := stringIndex + 1].
            mixedString at: stringIndex put: (self basicAt: (byteIndex + 1)).
            stringIndex := stringIndex + 1.
            byteIndex := byteIndex + 2].
    appendNull
         ifTrue: [mixedString at: stringIndex put: 0 asCharacter]
         ifFalse: [stringIndex := stringIndex - 1].
    ^mixedString copyFrom: 1 to: stringIndex!

asNormalizedString
    ^self invalidMessage!

asNormalizedString: leadByteFlags
    ^self invalidMessage!

asSymbol
        "Answer a symbol whose characters
         are the same as the receiver string."
    ^self containsDBCharacter
        ifTrue: [DoubleByteSymbol intern: self]
        ifFalse: [Symbol intern: self asMixedString]!

at: anInteger
        "Answer the character at position
         anInteger in the receiver string."
    | byteIndex |
    self checkIndex: anInteger.
    byteIndex := self byteIndexOfCharAt: anInteger.
    ^Character
        leadByte: (self basicAt: byteIndex)
        trailByte: (self basicAt: (byteIndex + 1))!

at: anInteger put: aCharacter
        "Answer aCharacter.  At index position
         anInteger in the receiver put the
         character aCharacter."
    | byteIndex |
    self checkIndex: anInteger.
    self checkCharacter: aCharacter.
    byteIndex := self byteIndexOfCharAt: anInteger.
    self
        basicAt: byteIndex put: aCharacter leadByte;
        basicAt: (byteIndex + 1) put: aCharacter trailByte.
    ^aCharacter!

byteIndexOfCharAt: anInteger
        "Private - answer the index of the lead byte of
          the character at anInteger in the receiver. "
    ^(anInteger * 2) - 1!

charIndexOfByteAt: anInteger
        " Private - answer the index of the character containing
          the byte anInteger in the receiver. "
    ^(anInteger + 1) // 2!

containsDBCharacter
        " Answer whether the receiver contains any double-byte characters. "
    | byteIndex lastCharByteIndex sbcLeadByte answer|
    (answer := VWVMLibrary containsDoubleByteCharacter: self) < 0
        ifFalse: [^answer asBoolean].
    "This code gets execute only when the above fails."
    byteIndex := 1.
    lastCharByteIndex := self basicSize - 1.
    sbcLeadByte := 0 asCharacter.
    [byteIndex > lastCharByteIndex]
        whileFalse: [
            ((self basicAt: byteIndex) ~= sbcLeadByte) ifTrue: [^true].
            byteIndex := byteIndex + 2].
    ^false!

do: aBlock
        "Answer the receiver.  For each character in the receiver,
         evaluate aBlock with that character as the argument."
    | byteIndex lastCharByteIndex |
    byteIndex := 1.
    lastCharByteIndex := self basicSize - 1.
    [byteIndex > lastCharByteIndex]
        whileFalse: [
            aBlock value: (Character
                leadByte: (self basicAt: byteIndex)
                trailByte: (self basicAt: (byteIndex + 1))).
            byteIndex := byteIndex + 2]!

inspect
        "Open an inspector window on the receiver."
    DoubleByteStringInspector new openOn: self!

isDoubleByteString
        "Answer true if receiver is an instance of class
         DoubleByteString, else answer false."
    ^true!

replace: count with: aCollection
        "Replace count characters of the receiver
         with characters of aCollection.  aCollection
         may be either a Smalltalk byte object or
         an instance of WinAddress.  Answer the receiver."
    | sourceClass sourceBytes |
    sourceClass := aCollection class.
    sourceBytes :=
        ((sourceClass == String) or: [sourceClass == Symbol])
             ifTrue: [DoubleByteString fromString: aCollection]
            ifFalse: [aCollection].
    self replaceBytes: (count * 2) with: sourceBytes!

replaceBytes: count with: aCollection
        "Private - replace count bytes of the receiver
         with bytes of aCollection.  aCollection
         may be either a Smalltalk byte object or
         an instance of WinAddress.  Answer the receiver."
    WinAddress
        copyFromDBS: aCollection
        to: self
        count: count!

replaceBytesFrom: byteStart
    to: byteStop
    with: aCollection
    startingAt: byteRepStart
        "Private - replace the bytes of the receiver at index
         positions start through stop with consecutive
         bytes of aCollection beginning at index
         position repStart.  Answer the receiver."
    | index1 index2 stop |
    <primitive: 129>
    (aCollection class isBytes)
        ifFalse: [
            ^super
                replaceFrom: (self charIndexOfByteAt: byteStart)
                to: (self charIndexOfByteAt: byteStop)
                with: aCollection
                startingAt: byteRepStart].
    " primitive failure on large byte objects "
    (self == aCollection and: [byteRepStart < byteStart])
        ifTrue: [ "do backward move for same object"
            index2 := byteRepStart + byteStop - byteStart.
            index1 := byteStop.
            [byteStart <= index1]
                whileTrue: [
                self
                    basicAt: index1
                    put: (aCollection basicAt: index2) asCharacter.
                index1 := index1 - 1.
                index2 := index2 - 1].
            ^self].
    "do forward move"
    index2 := byteRepStart.
      index1 := byteStart.
      [index1 <= byteStop]
           whileTrue: [
              self
                   basicAt: index1
                put: (aCollection basicAt: index2) asCharacter.
               index1 := index1 + 1.
              index2 := index2 + 1].!

replaceFrom: start
    to: stop
    with: aCollection
    startingAt: repStart
        "Replace the characters of the receiver at index
         positions start through stop with consecutive
         characters of aCollection beginning at index
         position repStart.  Answer the receiver."
    | byteStart byteStop sourceBytes byteRepStart |
    " replace 16-bit characters [start..stop] in the receiver "
    byteStart := self byteIndexOfCharAt: start.
    byteStop := (self byteIndexOfCharAt: stop) + 1.
    aCollection isDoubleByteString ifTrue: [
        sourceBytes := aCollection.
        byteRepStart := self byteIndexOfCharAt: repStart]
     ifFalse: [
        (aCollection isString) ifTrue: [
            sourceBytes := DoubleByteString fromString: aCollection.  "fromMixed??"
            byteRepStart := sourceBytes byteIndexOfCharAt: repStart]
        ifFalse: [   " could be ByteArray or WinAddress... "
            sourceBytes := aCollection.
            byteRepStart := repStart]].
    self
        replaceBytesFrom: byteStart
        to: byteStop
        with: sourceBytes
        startingAt: byteRepStart!

replaceFrom: start to: stop withObject: aCharacter
        "Replace the characters of the receiver
         at index positions start through stop
         with aCharacter.  Answer aCharacter."
    | index |
    index := start.
    [index <= stop]
        whileTrue: [
            self at: index put: aCharacter.
            index := index + 1].
    ^aCharacter!

size
        " Answer the number of characters in the receiver string. "
    ^super size // 2! !

