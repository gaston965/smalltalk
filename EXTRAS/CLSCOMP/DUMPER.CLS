Object subclass: #ClassComparisonTool
  instanceVariableNames:
    'imageFile firstImage secondImage delim nativeClassList '
  classVariableNames: ''
  poolDictionaries: '' !


ClassComparisonTool subclass: #ClassDumper
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''   !


String variableByteSubclass: #ClassCompareSourceString
  classVariableNames: ''
  poolDictionaries:
    'CharacterConstants ' !


!ClassComparisonTool class methods ! !



!ClassComparisonTool methods !

initialize

    "Private - initialize instance variable"

    | toolClasses |

    delim := 0 asCharacter.
    toolClasses := Set new.
    toolClasses
        add: #ClassComparisonTool;
        add: #ClassComparator;
        add: #ClassComparison;
        add: #ClassDescription;
        add: #ClassDictionary;
        add: #ClassDumper;
        add: #DifferencesDumper;
        add: #ClassCompareSourceString;
        add: #ClassCompareDictionary;
        add: #ClassComparisonDialog;
        add: #ClassSelectionDialog.

    nativeClassList := SortedCollection sortBlock: [ :c1 :c2 | c1 symbol < c2 symbol ].
    Smalltalk do: [ :global |
        ( ((global class class == MetaClass)
            and: [ global symbol first ~= $  ])
            and: [ (toolClasses includes: global symbol) not] )
            ifTrue: [
                nativeClassList add: global
            ]
    ].! !



!ClassCompareSourceString class methods !

from: aString

    "Convert the given string into a ClassCompareSourceString"

    ^(super new: aString size) replace: aString size with: aString! !



!ClassCompareSourceString methods !

asArrayOfLines

        "Private - Answer an array of lines from the receiver.  Remove trailing blank lines."

    | aStream tempIndex lineArray answer |

    answer := OrderedCollection new.
    aStream := ReadStream on: self.
    [ aStream atEnd ] whileFalse: [
        answer add: aStream nextLine.
    ].

    lineArray := answer asArray.
    tempIndex := lineArray size.
    [ ( ( lineArray at: tempIndex ) trimBlanks size ) = 0 ] whileTrue: [
        tempIndex := tempIndex - 1.
    ].

    ^( lineArray copyFrom: 1 to: tempIndex ).!

compareLinesTo: stringB

        "Private - Take two strings: stringA and stringB.  Divide them into arrays of single lines,
        and compare them line by line"

    | arrayA arrayB indexA indexB tempA tempB sizeOfA sizeOfB atEnd offset answerStream |

    answerStream := WriteStream on: (String new: 16).

    arrayA := self asArrayOfLines.
    arrayB := stringB asArrayOfLines.
    "Note:  asArrayOfLines removes trailing blank lines.  The compare algorithm
    below assumes that neither line ends in a blank line."

    atEnd := false.
    indexA := 1.
    indexB := 1.
    sizeOfA := arrayA size.
    sizeOfB := arrayB size.

    answerStream
        nextPutAll: 'Native   Source     Code'; nextPut: Cr; nextPut: Lf;
        nextPutAll: '------------------------'; nextPut: Cr; nextPut: Lf.

    [ atEnd ] whileFalse: [
        [ ( ((arrayA at: indexA) trimBlanks) size ) = 0 ] whileTrue: [ indexA := indexA + 1. ].
        [ ( ((arrayB at: indexB) trimBlanks) size ) = 0 ] whileTrue: [ indexB := indexB + 1. ].

        "Now indexA and indexB point to the next non-blank lines to be compared."
        ( ((arrayA at: indexA) trimBlanks) = ((arrayB at: indexB) trimBlanks) ) ifFalse: [

            tempB := arrayB findNext: [ :line | line = ( arrayA at: indexA ) ] startingFrom: indexB.
            ( tempB = 0 ) ifFalse: [    "arrayB has some additional lines"
                [ indexB < tempB ] whileTrue: [
                    answerStream                                                      "additional line from B"
                        nextPutAll: '         ', indexB printString, '*         ', ( arrayB at: indexB );
                        nextPut: Cr; nextPut: Lf.
                    indexB := indexB + 1.
                ].
                answerStream                                                          "back in sync here -- print one line of context"
                    nextPutAll: indexA printString, '        ', indexB printString, '          ', ( arrayA at: indexA );
                    nextPut: Cr; nextPut: Lf.
            ]

            ifTrue: [  "lineA did not appear anywhere in B"
                tempA := arrayA findNext: [ :line | line = ( arrayB at: indexB ) ] startingFrom: indexA.
                ( tempA = 0 ) ifFalse: [    "arrayA has some additional lines"
                    [ indexA < tempA ] whileTrue: [
                        answerStream                                                  "additional line from A"
                            nextPutAll: indexA printString, '*                  ', ( arrayA at: indexA );
                            nextPut: Cr; nextPut: Lf.
                        indexA := indexA + 1.
                    ].
                    answerStream                                                      "back in sync here -- print one line of context"
                        nextPutAll: indexA printString, '        ', indexB printString, '          ', ( arrayB at: indexB );
                        nextPut: Cr; nextPut: Lf.
                ]

                ifTrue: [ "lineB didn't appear anywhere in A -- both lines are just plain different"
                    answerStream
                        nextPutAll: indexA printString, '                   ', ( arrayA at: indexA ); nextPut: Cr; nextPut: Lf;
                        nextPutAll: '         ', indexB printString, '          ', ( arrayB at: indexB ); nextPut: Cr; nextPut: Lf.
                ].
            ]
        ].
        indexA := indexA + 1.
        indexB := indexB + 1.

        ( indexA > sizeOfA ) ifTrue: [  "no more A to compare"
            ( indexB <= sizeOfB ) ifTrue: [  "dump the rest of B"
                ( arrayB copyFrom: indexB to: sizeOfB ) do:  [ :line |
                    answerStream
                        nextPutAll: '         ', indexB printString, '*         ', line;
                        nextPut: Cr; nextPut: Lf.
                    indexB := indexB + 1.
                ].
            ].
            atEnd := true.
        ].
        ( indexB > sizeOfB ) ifTrue: [  "no more B to compare"
            ( indexA <= sizeOfA ) ifTrue: [  "dump the rest of A"
                ( arrayA copyFrom: indexA to: sizeOfA ) do:  [ :line |
                    answerStream
                        nextPutAll: indexA printString, '*                  ', line;
                        nextPut: Cr; nextPut: Lf.
                    indexA := indexA + 1.
                ].
            ].
            atEnd := true.
        ].
    ].

    ^answerStream contents!

compareSourceTo: stringB

    "Private - self and stringB contain source code.  Strip out the comments and the white
    spaces, and compare the result.  If it's the same, return nil, otherwise return the
    differences."

    | strippedA strippedB |

    strippedA := ( self strippedOfComments ) asArrayOfSubstrings.
    strippedB := ( stringB strippedOfComments ) asArrayOfSubstrings.
    ^(strippedA = strippedB )
        ifTrue: [ nil ]
        ifFalse: [ self compareLinesTo: stringB ]!

isAPrivateMethod

    "Private - answer 0 if the word Private is the first word in the
    comment of a method string.  Otherwise answer 1."

    | tempStream ignore privateString |

    privateString := ClassCompareSourceString from: 'Private'.
    tempStream := ReadStream on: self.
    ignore := tempStream upTo: $".
    ( tempStream nextWord = privateString ) ifTrue: [  ^0 ].

    ^1!

strippedOfComments

    "Private - self contains source code.  strip the comments and return the resulting string
    Known problem: This doesn't work if there are non-comment quotes in the source (e.g. it won't
    work on this method)."

    | tempStream result ignore |
    tempStream := ReadStream on: self.
    result := WriteStream on: ( String new: ( self size ) ).
    [tempStream atEnd] whileFalse: [
        "assume it does not start with a comment"
        result nextPutAll: ( tempStream upTo: $" ).
        ignore := tempStream upTo: $".
    ].
    ^result contents! !


!ClassDumper class methods !

new

    ^super new initialize.! !



!ClassDumper methods !

dumpClass: aClass

    "Private - dump a description of the specified class to imageFile."

    imageFile
        nextPutAll: aClass name;
        nextPut: delim.

    ( aClass superclass isNil ) ifTrue: [
        imageFile nextPutAll: aClass superclass.
    ]
    ifFalse: [
        imageFile nextPutAll: aClass superclass name.
    ].

    imageFile
        nextPut: delim;
        nextPutAll: aClass instanceVariableString;
        nextPut: delim;
        nextPutAll: aClass classVariableString;
        nextPut: delim;
        nextPutAll: aClass sharedVariableString;
        nextPut: delim;
        putInteger: aClass structure.

    imageFile
        putInteger: aClass methodDictionary keys size.
    aClass methodDictionary keys asSortedCollection do: [ :selector |
        self dumpSelector: selector forClass: aClass].

    imageFile
        putInteger: aClass class methodDictionary keys size.
    aClass class methodDictionary keys asSortedCollection do: [ :selector |
        self dumpSelector: selector forClass: aClass class].!

dumpSelector: aSelector
    forClass: aClass

    "Private - dump the specified selector to imageFile.  This includes source if
    available."

    | compiledMethod source tempStream privateFlag |

    compiledMethod := aClass compiledMethodAt: aSelector.
    source := ClassCompareSourceString from: compiledMethod sourceString.
    ( source isNil ) ifTrue: [  "source is unavailable"
        privateFlag := 0.
    ] ifFalse: [
        privateFlag := source isAPrivateMethod.
    ].

    imageFile
        nextPutAll: aSelector;
        nextPut: delim;
        nextPutAll: source;
        nextPut: delim;
        putInteger: source hash;
        putInteger: privateFlag.!

dumpSelfToFile: aFileName
    imageString: aString

    "Private - Dump a snapshot of the current image to the specified file.  "

    Transcript
        cr; show: 'Dumping classes for ', aString, '...'.
    CursorManager execute change.

    File remove: aFileName ifAbsent: [].
    imageFile := File pathName: aFileName .
    imageFile
        nextPutAll: aString, (String with: delim).
    nativeClassList do: [ :class | self dumpClass: class ].

    imageFile close.
    CursorManager normal change.
    Transcript
        show: ' Done.'; cr.!

startDumping

    "Prompt the user for a descriptive string and a results filename, then
    begin dumping to the specified file"

    | s1 s2 |

    super initialize.
    (Smalltalk respondsTo: #version) ifTrue: [
        s1 := Smalltalk product, ' ', Smalltalk version
    ] ifFalse: [
        s1 := 'Dumped image'.
    ].
    s1 := Prompter prompt: 'Enter image description' default: s1.
    s1 isNil ifTrue: [ ^nil ].

    s2 := Prompter prompt: 'Enter snapshot file name' default: 'clsdump.vw'.
    s2 isNil ifTrue: [ ^nil ].

    ^self dumpSelfToFile: s2 imageString: s1.! !
