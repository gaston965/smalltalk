

!Symbol methods !

initContents: aString
        "Private - initialize the receiver to contain
         the character sequence in aString."
    super
        replaceFrom: 1 to: aString size
        with: aString
        startingAt: 1! !


!Symbol class methods !
  
intern: aString
        "Private - Answer a Symbol whose character sequence
         is the same as that of aString."
    | answer symbol |
    symbol := (super new: aString size) initContents: aString.
    (answer := SymbolTable symbolAt: symbol) == nil
        ifTrue: [
            answer := symbol.
            SymbolTable add: symbol].
    ^answer!



purgeUnusedSymbols
        "Purge unused symbols from symbol table."
    | aBag newSymbolTable newHashArray prev i intState |
"permanent symbols"
    i := #(mustBeBoolean cantReturn doesNotUnderstand: stackOverflow).
    intState := Process enableInterrupts: false.
"get a set of method selectors"
    newHashArray := Array new: SymbolHashArray size.
    CompiledMethod allInstances do: [:i |
        newHashArray
            at: i selector id + 1
            put: i selector].
"purge SymbolTable and SymbolHashArray so that
 gc will collect all symbols not used."
    SymbolHashArray := newHashArray.
"rebuild SymbolTable and SymbolHashArray
 using all instances of Symbol."
    newSymbolTable := SymbolSet new: SymbolTable size.
    SymbolTable do: [:sym|
        (sym isInDLL) ifTrue: [
            newSymbolTable add: sym.
            SymbolHashArray
                at: sym id + 1
                put: sym]].
    SymbolTable instVarAt: 2 put: nil.
    SymbolTable := nil.
    (Array with: Symbol with: DoubleByteSymbol) do: [ :aSymbolClass |
        aSymbolClass allInstances do: [:sym |
        newSymbolTable add: sym.
        SymbolHashArray
            at: sym id + 1
            put: sym]].
    SymbolTable := newSymbolTable.
"shrink hash array"
    "find last symbol"
    i := SymbolHashArray size.
    [(SymbolHashArray at: i) isSymbol]
        whileFalse: [i := i - 1].
    newHashArray := Array new: (i + 1000
        min: SymbolHashArray size).
    newHashArray
        replaceFrom: 1
        to: newHashArray size
        with: SymbolHashArray
        startingAt: 1.
"rebuild hash array"
    "find first free slot"
    i := 1.
    [((newHashArray at: i) isSymbol)]
        whileTrue: [i := i + 1].
    SymbolHashArrayFreeListHead := i.

    prev := SymbolHashArrayFreeListHead.
    i to: newHashArray size do: [:j |
        ((newHashArray at: j) isSymbol)
            ifFalse: [
                newHashArray at: prev put: j.
                prev := j]].
    SymbolHashArray := newHashArray.
    Process enableInterrupts: intState.! !


!Symbol methods !

asCompactString
        " Answer the most compact string containing the
         characters of the receiver. "
    ^self asString!

asMixedString
        "Answer the reciever as a String in mixed-encoding."
    ^self asString!

asNormalizedString
    ^self invalidMessage!
   
asNormalizedString: leadByteFlags
    ^self invalidMessage!


equals: aSymbol
        "Answer true if the receiver is equal to
         the argument aSymbol, else answer false.
         Note that the comparison is case sensitive."
    <primitive: 132>
    ^false!
   
replace: count with: aCollection
        "Replace count elements of the receiver
         with elements of aCollection.  This
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
    ^self invalidMessage! !
