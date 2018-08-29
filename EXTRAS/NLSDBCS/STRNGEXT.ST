


!String methods !
, aString
        "Answer a new string containing the characters
         of the receiver followed by the the characters of
         aString."
    ((self isDoubleByteString xor: aString isDoubleByteString)
        and: [ aString isString ])
        ifFalse: [ ^super , aString ].
    ^(DoubleByteString fromString: self) , (DoubleByteString fromString: aString)!


<= aString
        "Answer true if the receiver is before or equal to
         aString in the current sort sequence, else answer false.
         The comparison is not case sensitive."
    <primitive: 131>
    (self isSymbol or: [aString isSymbol])
        ifTrue: [
            aString isDoubleByteSymbol
                ifTrue: [
                    self  isDoubleByteSymbol
                        ifFalse: [^(DoubleByteSymbol intern: self) <= aString ]]
                ifFalse: [
                    self isDoubleByteSymbol
                        ifTrue: [^self <= (DoubleByteSymbol intern: aString) ]]]
        ifFalse: [
            aString isDoubleByteString
                ifTrue: [
                    self  isDoubleByteString
                        ifFalse: [^(DoubleByteString fromString: self) <= aString ]]
                ifFalse: [
                    self isDoubleByteString
                        ifTrue: [^self <= (DoubleByteString fromString: aString) ]]].
    ^self primitiveFailed!

= aString
        "Answer true if the receiver is equal to
         aString, else answer false.  The comparison
         is case sensitive."
    | sbs dbs i |
    <primitive: 132>
    " fails when self class ~= aString class "
    aString isSymbol ifTrue: [^false].
    (aString isString) ifTrue: [  " comparing String and DoubleByteString "
        (self size = aString size) ifFalse: [^false].
        self isDoubleByteString
            ifTrue: [dbs := self. sbs := aString]
            ifFalse: [sbs := self. dbs := aString].
        i := 1.
        dbs do: [ :aChar |
            ((sbs at: i) = aChar) ifFalse: [^false].
            i := i + 1].
        ^true].
    ^false!


asByteArray
        "Answer a ByteArray whose contents are the
         bytes of the receiver."
    ^(ByteArray new: self size) replace: self size with: self.!

asNormalizedString
        "Interpret the receiver as a mixed string encoding
         using the lead byte flags of the current code page.
         Answer the equivalent DoubleByteString if the receiver
         contains any double-byte characters.  Answer the
         receiver if it only contains single byte characters."
    (NationalLanguage isDoubleByteCp) ifFalse: [^self].
    ^self asNormalizedString: NationalLanguage leadBytes!

asNormalizedString: leadByteFlags
        "Interpret the receiver as a mixed string encoding
         based on the given array of leadByteFlags.
         Answer the equivalent DoubleByteString if the receiver
         contains any double-byte characters.  Answer the
         receiver if it only contains single byte characters."
    | aFlag |
    (aFlag := VWVMLibrary mixedString: self
      containsLeadByte: leadByteFlags ) < 0 ifFalse: [
            (aFlag asBoolean) ifFalse: [ ^self ]
                ifTrue: [ ^DoubleByteString fromMixedString: self
                     leadBytes: leadByteFlags ]].  
    "This code gets execute only when the above fails."
    self do: [ :aChar |
        (aChar isLeadByte: leadByteFlags) ifTrue: [
            ^DoubleByteString
                fromMixedString: self
                leadBytes: leadByteFlags]].
    ^self!

at: anInteger put: aCharacter
        "Answer aCharacter.  At index position
         anInteger in the receiver put the
         character aCharacter.  Mutate the receiver
         into a DoubleByteString if aCharacter
         is a double-byte character."
    | dbString |
    <primitive: 64>
    self checkIndex: anInteger.
    self checkCharacter: aCharacter.
    aCharacter isDoubleByte
        ifTrue: [
            dbString := DoubleByteString fromString: self.
            dbString at: anInteger put: aCharacter.
            self become: dbString.
            ^aCharacter].
    ^self primitiveFailed!

equals: aString
        "Answer true if the receiver is equal to
         the argument aString, else answer false.
         Note that the comparison is case sensitive."
    | sbs dbs i |
    <primitive: 132>
    " fails when self class ~= aString class "
    aString isSymbol ifTrue: [^false].
    (aString isString) ifTrue: [  " comparing String and DoubleByteString "
        (self size = aString size) ifFalse: [^false].
        self isDoubleByteString
            ifTrue: [dbs := self. sbs := aString]
            ifFalse: [sbs := self. dbs := aString].
        i := 1.
        dbs do: [ :aChar |
            ((sbs at: i) = aChar) ifFalse: [^false].
            i := i + 1].
        ^true].
    ^false!

replace: count with: aCollection
        "Answer the receiver.  Replace count number of
         characters in the beginning of the receiver
         from the same number of characters in the
         beginning of aCollection.  aCollection can
         be a WinAddress and count can be a large 
         integer. Mutate the receiver into a DoubleByteString
         if aCollection is a DoubleByteString."
    | dbString |
    (aCollection isDoubleByteString)
        ifTrue: [
            dbString := DoubleByteString fromString: self.
            dbString replace: count with: aCollection.
            self become: dbString]
        ifFalse: [ 
            WinAddress
                copyFrom: aCollection
                to: self
                count: count].!

replaceBytesFrom: byteStart
    to: byteStop
    with: aByteObject
    startingAt: byteRepStart
        "Private - replace the bytes of the receiver at index
         positions start through stop with consecutive
         bytes of aByteObject beginning at index
         position repStart.  Answer the receiver."
    | index1 index2 |
    <primitive: 129>
    aByteObject class isBytes
        ifFalse: [self error: 'source must be a byte object'].
    (self == aByteObject and: [byteRepStart < byteStart])
        ifTrue: [ "do backward move for same object"
            index2 := byteRepStart + byteStop - byteStart.
            index1 := byteStop.
            [byteStart <= index1]
                whileTrue: [
                self
                    at: index1
                    put: (aByteObject basicAt: index2) asCharacter.
                index1 := index1 - 1.
                index2 := index2 - 1].
            ^self].
    "do forward move"
    index2 := byteRepStart.
    index1 := byteStart.
    [index1 <= byteStop]
        whileTrue: [
            self
                at: index1
                put: (aByteObject basicAt: index2) asCharacter.
            index1 := index1 + 1.
            index2 := index2 + 1]!

replaceFrom: start
    to: stop
    with: aString
    startingAt: repStart
        "Replace the characters of the receiver at index
         positions start through stop with consecutive
         characters of aString beginning at index
         position repStart.  Mutate the receiver into a
         DoubleByteString if aString is a DoubleByteString.
         Answer the receiver."
    | dbString index1 index2 |
    <primitive: 105>
    (aString isDoubleByteString)
        ifTrue: [
            dbString := DoubleByteString fromString: self.
            dbString
                replaceFrom: start to: stop
                with: aString startingAt: repStart.
            self become: dbString.
            ^dbString].
    (aString class isBytes)
        ifFalse: [
            ^super
                replaceFrom: start
                to: stop
                with: aString
                startingAt: repStart].
    (self == aString and: [repStart < start])
        ifTrue: [ "do backward move for same object"
            index2 := repStart + stop - start.
            index1 := stop.
            [start <= index1]
                whileTrue: [
                self
                    at: index1
                    put: (aString at: index2) asCharacter.
                index1 := index1 - 1.
                index2 := index2 - 1].
            ^self].
    "do forward move"
    index2 := repStart.
    index1 := start.
    [index1 <= stop]
        whileTrue: [
            self
                at: index1
                put: (aString at: index2) asCharacter.
            index1 := index1 + 1.
            index2 := index2 + 1]!

replaceFrom: start to: stop withObject: aCharacter
        "Replace the characters of the receiver
         at index positions start through stop
         with aCharacter.  Mutate the receiver
         into a DoubleByteString if aCharacter
         is a double-byte character.  Answer aCharacter."
    | dbString |
    <primitive: 106>
    self checkCharacter: aCharacter.
    aCharacter isDoubleByte
        ifTrue: [
            dbString := DoubleByteString fromString: self.
            dbString
                replaceFrom: start to: stop
                withObject: aCharacter.
            self become: dbString.
            ^aCharacter].
    ^super
        replaceFrom: start
        to: stop
        withObject: aCharacter! !
