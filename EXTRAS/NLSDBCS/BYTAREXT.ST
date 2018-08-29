

!ByteArray methods !

 
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
                    put: (aByteObject basicAt: index2) asInteger.
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
                put: (aByteObject basicAt: index2) asInteger.
            index1 := index1 + 1.
            index2 := index2 + 1]!

replaceFrom: start to: stop withAddress: aWinAddress startingAt: int
        "Replace the elements of the receiver at index
         positions start through stop with consecutive
         elements at aWinAddress beginning at 
         position int.  Answer the receiver."
    ^self replaceFrom: start to: stop with: aWinAddress startingAt: int! !






