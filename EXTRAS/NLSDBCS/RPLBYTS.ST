


!Float methods !

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
            index2 := index2 + 1]! !



!WinHandle methods !

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
    aVariableByteObject class isBytes
        ifFalse: [self error: 'source must be a byte object'].
    (self == aVariableByteObject and: [byteRepStart < byteStart])
        ifTrue: [ "do backward move for same object"
            index2 := byteRepStart + byteStop - byteStart.
            index1 := byteStop.
            [byteStart <= index1]
                whileTrue: [
                self
                    at: index1
                    put: (aVariableByteObject basicAt: index2) asInteger.
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
                put: (aVariableByteObject basicAt: index2) asInteger.
            index1 := index1 + 1.
            index2 := index2 + 1]!


replaceFrom: start
    to: stop
    with: aVariableByteObject
    startingAt: repStart
        "Replace the bytes of the receiver at index
         positions start through stop with consecutive
         bytes of aVariableByteObject beginning at index
         position repStart.  Answer the receiver."
    | index1 index2 |
    <primitive: 105>
    (aVariableByteObject isDoubleByteString)
        ifTrue: [
           ^self
                replaceBytesFrom: start to: stop
                with: aVariableByteObject
                startingAt: (aVariableByteObject byteIndexOfCharAt: repStart)].
    (aVariableByteObject class isBytes)
        ifFalse: [
            ^super
                replaceFrom: start
                to: stop
                with: aVariableByteObject
                startingAt: repStart].
    (self == aVariableByteObject and: [repStart < start])
        ifTrue: [ "do backward move for same object"
            index2 := repStart + stop - start.
            index1 := stop.
            [start <= index1]
                whileTrue: [
                self
                    at: index1
                    put: (aVariableByteObject at: index2) asInteger.
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
                put: (aVariableByteObject at: index2) asInteger.
            index1 := index1 + 1.
            index2 := index2 + 1]! !
