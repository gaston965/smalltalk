


!WinAddress class methods !


copyFromDBS: srcObject to: destObject count: bytes
        "Private - Copy bytes from double-byte srcObject to
         destObject. srcObject and destObject must be either
         aVariableByteObject or aWinAddress."
    <primitive: 130>
    ^self primitiveFailed! !






!WinAddress methods !
  
   
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
    with: aVariableByteObject
    startingAt: byteRepStart
        "Private - replace the bytes of the receiver at index
         positions start through stop with consecutive
         bytes of aVariableByteObject beginning at index
         position repStart.  Answer the receiver."
    | index1 index2 |
    <primitive: 129>
    index2 := byteRepStart.
    index1 := byteStart.
    [index1 <= byteStop]
        whileTrue: [
            self   " must use basicAt: so DoubleByteString parm handled properly "
                at: index1
                put: (aVariableByteObject basicAt: index2) asInteger.
            index1 := index1 + 1.
            index2 := index2 + 1]!

replaceFrom: start
    to: stop
    with: aCollection
    startingAt: repStart
        "Private - Replace the bytes of the receiver at index
         positions start through stop with consecutive
         element of aCollection beginning at index
         position repStart.  Answer the receiver."
    | index1 index2 |
    <primitive: 105>
    (aCollection isDoubleByteString)
        ifTrue: [
            ^self
                replaceBytesFrom: start to: stop
                with: aCollection
                startingAt: (aCollection byteIndexOfCharAt: repStart)].
    index2 := repStart.
    index1 := start.
    [index1 <= stop]
        whileTrue: [
            self
                at: index1
                put: (aCollection at: index2) asInteger.
            index1 := index1 + 1.
            index2 := index2 + 1]! !

