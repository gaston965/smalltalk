


!Character class methods !

leadByte: aCharacter1 trailByte: aCharacter2
        "Answer the character whose high-order byte
         is the code point value of aCharacter1 and
         whose low-order byte is the code point value
         of aCharacter2."
    ^self value:
        ((aCharacter1 asInteger bitShift: 8) + aCharacter2 asInteger)!

value: anInteger
        "Answer the character whose code point
         value is anInteger."
    (0 > anInteger or: [65535 < anInteger])
        ifTrue: [self error: 'Character value out of range 0..65535'].
    (255 < anInteger)
        ifTrue: [  " double-byte characters may not be unique "
            ^(self basicNew) instVarAt: 1 put: anInteger; yourself].
    "The following takes advantage of the fact that in our system
        consecutive characters in the ASCII sequence [0..255] have
        consecutive object pointer numbers"
    ^AllCharacters at: (anInteger + 1)! !

!Character methods !

= aCharacter
        "Answer true if the receiver code point value
         is equal to the code point value of aCharacter,
         else answer false."
    ^(aCharacter isCharacter)
        ifTrue: [asciiInteger = aCharacter asciiValue]
        ifFalse: [false]!


isDoubleByte
        "Answer whether the receiver is a double-byte character."
    ^asciiInteger > 255!


isLeadByte
        " Answer whether the receiver is a lead byte code
        in the current national language. "
    ^self isLeadByte: (NationalLanguage leadBytes)!

isLeadByte: leadByteFlags
        " Answer whether the receiver is the lead byte of a DBC
        encoding.  The leadByteFlags is an array [1..255] of Booleans,
        indexed by the receiver's code point value. "
    (asciiInteger = 0) ifTrue: [^false].
    (asciiInteger > 255)
        ifTrue: [^self error: 'Character out of byte range [1..255]'].
    ^leadByteFlags at: asciiInteger!

isSeparator
        "Answer true if the receiver character is either a
         space, tab, carriage-return, line-feed, form-feed
         character, or double-byte space, else answer false."
    ^self == Space
        or: [self == Tab
            or: [self == Cr
                or: [self == Lf
                    or: [self == Ff
                        or: [self = DoubleByteSpace]]]]]!

isSingleByte
        "Answer whether the receiver is a single-byte character."
    ^asciiInteger < 256!

leadByte
        "Answer the character corresponding to the receiver's lead byte."
    ^(asciiInteger bitShift: -8) asCharacter!

printOn: aStream
        "Append the character representation of
         the receiver to aStream."
    aStream nextPut: $$.
    (NationalLanguage isDoubleByteCp not and: [self isDoubleByte])
        ifTrue: [aStream nextPut: self leadByte; nextPut: self trailByte]
        ifFalse: [aStream nextPut: self]!
 

trailByte
        "Answer the character corresponding to the receiver's trail byte."
    ^(asciiInteger \\ 256) asCharacter! 

isWhitespace
        "Answer true if the receiver is white space,
        else answer false."
    ^self asInteger <= Space asInteger
        or: [ self = DoubleByteSpace ]! !


