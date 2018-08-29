Dictionary subclass: #ClassCompareDictionary
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''   !


ClassComparisonTool subclass: #ClassComparator
  instanceVariableNames:
    'differencesDictionary currentClass '
  classVariableNames: ''
  poolDictionaries:
    'CharacterConstants '  !


ClassComparisonTool subclass: #ClassComparison
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''   !


ClassComparisonTool subclass: #ClassDescription
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''  !


ClassComparisonTool subclass: #ClassDictionary
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries:
    'CharacterConstants '  !


ClassComparisonTool subclass: #DifferencesDumper
  instanceVariableNames:
    'differencesFile reportLevel '
  classVariableNames: ''
  poolDictionaries: ''    !


!FileStream methods !

nextBlock: aDelimiter

        "Private - this method was added by the ClassComparisonTool.
        Answer with the next piece of information in the source image
        file, up to the next instance of aDelimiter."

    | temp |

    self atEnd
        ifFalse: [
            [ self peek = $  ] whileTrue: [
                self next.                               " trim blanks"
            ].
            temp := self upTo: aDelimiter.
            ( temp size = 0 ) ifTrue: [ temp := nil ].
        ].
    ^temp                                                                     " return nil if eof "! !




!IndexedCollection methods !

findNext: aBlock startingFrom: anIndex

        "Private - This method was added by the ClassComparisonTool.
        Answer the index of the next element of the
        receiver that causes aBlock to evaluate to true
        with that element as the argument).  Start looking
        at anIndex.  If no such element is found, answer 0."

    | index size |
    size := self size.
    index := anIndex.
    [index <= size]
        whileTrue: [
            (aBlock value: (self at: index) )
                ifTrue: [^index].
            index := index + 1].
    ^0! !




!ClassCompareDictionary class methods ! !



!ClassCompareDictionary methods !

findMethod: methodName
    aboveClass: aClass
    ofMethodType: aSymbol

    "Private - This is a companion method to the ClassComparison tool.  Self is a dictionary
    whose keys are fullDump, sourceString, and imageDictionary.  imageDictionary is a
    dictionary whose keys are classnames.  This method is called when a given method
    doesn't exist in a given class.  I need to look through this dictionary to find out if the
    given method exists in a superclass of the given class."

    | superClass root methodGroup classDesc answer |

    root := self at: #imageDictionary.
    superClass := ( root at: aClass ) at: #superclass.
    [ superClass isNil ] whileFalse: [
        classDesc := ( root at: (superClass asSymbol) ).
        methodGroup := ( (classDesc at: #methods) at: aSymbol ).
        ( methodGroup includesKey: (methodName asSymbol) ) ifTrue: [
            answer := Array with: superClass
                                     with: ( ((methodGroup at: (methodName asSymbol)) at: 2) isAPrivateMethod ).
            superClass := nil.
        ] ifFalse: [
            superClass := ( root at: ( superClass asSymbol ) ) at: #superclass.
        ].
    ].
    ^answer! !


!ClassComparator class methods ! !



!ClassComparator methods !

compareClass: firstClassDescriptor
    toClass: secondClassDescriptor

    "Private - compare methods and variables in the specified class descriptions"

    | answer variableComparison methodComparison |

    variableComparison := self variableComparison: ( firstClassDescriptor at: #variables)
                                                 with: ( secondClassDescriptor at: #variables ).

    methodComparison := self methodComparison: ( firstClassDescriptor at: #methods )
                                                with: ( secondClassDescriptor at: #methods ).

    answer := Dictionary new.
    ( variableComparison isNil ) ifFalse: [
        answer at: #variables put: variableComparison.
    ].
    ( methodComparison isNil ) ifFalse: [
        answer at: #methods put: methodComparison.
    ].

    ( (firstClassDescriptor at: #superclass) = (secondClassDescriptor at: #superclass) ) ifFalse: [
        answer at: #superclass put: ( Array with: (firstClassDescriptor at: #superclass)
                                                                with: (secondClassDescriptor at: #superclass) ).
    ].

    ( answer isEmpty ) ifTrue: [ answer := nil. ].
    ^answer.!

compareClassDict: first
    toClassDict: second
    usingClasses: classGroup

    "Private - both parameters contain a dictionary whose keys are classnames, and whose
    values are (methods, variables, superclass) dictionaries.  classGroup must be a collection
    of symbols."

    | commonClasses firstAdditional secondAdditional tempClass answer |

    "do all the ones they have in common"
    commonClasses := Dictionary new.
    ( classGroup select: [ :class | (first includesKey: class) & (second includesKey: class) ] )
    do: [ :commonClass |
        currentClass := commonClass.
        tempClass := self compareClass: (first at: commonClass) toClass: (second at: commonClass).
        ( tempClass isNil ) ifFalse: [
            commonClasses at: commonClass put: tempClass.
        ].
        classGroup remove: commonClass.
    ].


    "now do the rest"
    currentClass := nil.
    firstAdditional := Dictionary new.
    secondAdditional := Dictionary new.
    ( classGroup isEmpty ) ifFalse: [
        ( classGroup reject: [ :className | second includesKey: className ] ) do: [ :className |
            firstAdditional at: className put: ( first at: className ).
            classGroup remove: className.
        ].
    ].
    ( classGroup isEmpty ) ifFalse: [
        classGroup do: [ :className |
            secondAdditional at: className put: ( second at: className ).
        ].
    ].

    answer := Dictionary new.
    ( commonClasses isEmpty ) ifFalse: [
        answer at: #common put: commonClasses.
    ].
    ( firstAdditional isEmpty ) ifFalse: [
        answer at: #firstAdditional put: firstAdditional.
    ].
    ( secondAdditional isEmpty ) ifFalse: [
        answer at: #secondAdditional put: secondAdditional.
    ].

    ^answer!

compareMethodsIn: firstMethodGroup
    with: secondMethodGroup
    ofMethodType: aSymbol

    "Private - called with either class or instance methods.  Find the methods the two
    groups have in common, and whether or not they are identical.  Then specify
    the methods that either class lacks.  All entries returned will have a source
    string -- this string will either contain direct source code, or the result of the
    comparison."

    | firstMethodNames secondMethodNames lackingMethods
    firstString secondString resultString
    firstFlag secondFlag combinedFlag
    commonDiff commonSame
    tempStream tempClass tempDict answer |

    firstMethodNames := firstMethodGroup keys.
    secondMethodNames := secondMethodGroup keys.

    answer := Dictionary new.
    commonDiff := Dictionary new.
    commonSame := Dictionary new.

        "Look at the source for the ones they have in common."

    ( firstMethodNames select: [ :sel | secondMethodNames includes: sel ] ) do: [ :key |
        firstString := ClassCompareSourceString from: ( ( firstMethodGroup at: key ) at: 2).
        firstFlag := ( firstMethodGroup at: key ) at: 3.
        secondString := ClassCompareSourceString from: ( ( secondMethodGroup at: key ) at: 2).
        secondFlag := ( secondMethodGroup at: key ) at: 3.
        combinedFlag := firstFlag * 2 + secondFlag.  "used in dumping the results later"
        tempDict := Dictionary new.

        ( firstString isEmpty ) | ( secondString isEmpty ) ifTrue: [ "one or the other source is unavailable"
            tempStream := WriteStream on: ( String new: 16 ).
            tempStream nextPutAll: 'Source unavailable for comparison.'; cr.
            tempDict
                at: #string put: tempStream contents;
                at: #private put: combinedFlag.
        ] ifFalse: [
            resultString := firstString compareSourceTo: secondString.
            tempDict
                at: #string put: resultString;
                at: #private put: combinedFlag.
            resultString isNil ifTrue: [ "they were identical"
                commonSame at: key put: tempDict
            ] ifFalse: [
                commonDiff at: key put: tempDict
            ]
        ].
        "bookkeeping..."
        firstMethodNames remove: key.
        secondMethodNames remove: key.
    ].

    ( commonDiff isEmpty ) ifFalse: [
        answer at: #differences put: commonDiff.
    ].

"    ( commonSame isEmpty ) ifFalse: [
        answer at: #identical put: commonSame.
    ].
"

        "Collect all method names which appear in one methodGroup and not the other.
          Iterate over these, stuffing the original values into a new dictionary.  Then stuff
          this dictionary into answer.  "

    ( firstMethodNames isEmpty ) ifFalse: [
        lackingMethods := Dictionary new.
        firstMethodNames do: [ :key |
            "first find if it's missing because it's missing, or because it inherits it from a superclass"
            tempDict := Dictionary new.
            tempClass := secondImage findMethod: key aboveClass: currentClass ofMethodType: aSymbol.
            ( tempClass isNil ) ifTrue: [
                tempDict
                    at: #string put: ( (firstMethodGroup at: key) at: 2 );
                    at: #private put: ( (firstMethodGroup at: key) at: 3 ) * 2.
                lackingMethods at: key put: tempDict.
            ] ifFalse: [
                tempStream := WriteStream on: (String new: 16).
                tempStream nextPutAll: '<', (tempClass at: 1), '>'.
                tempDict
                    at: #inherited put: true;
                    at: #string put: ( tempStream contents );
                    at: #private put: ( tempClass at: 2 ) * 2.
                lackingMethods at: key put: tempDict.
            ].
        ].
        answer at: #firstAdditional put: lackingMethods.
    ].
    ( secondMethodNames isEmpty ) ifFalse: [
        lackingMethods := Dictionary new.
        secondMethodNames do: [ :key |
            tempDict := Dictionary new.
            tempClass := firstImage findMethod: key aboveClass: currentClass ofMethodType: aSymbol.
            ( tempClass isNil ) ifTrue: [
                tempDict
                    at: #string put: ( (secondMethodGroup at: key) at: 2 );
                    at: #private put: ( (secondMethodGroup at: key) at: 3 ).
                lackingMethods at: key put: tempDict.
            ] ifFalse: [
                tempStream := WriteStream on: (String new: 16).
                tempStream nextPutAll: '<', (tempClass at: 1), '>'.
                tempDict
                    at: #inherited put: true;
                    at: #string put: ( tempStream contents );
                    at: #private put: ( tempClass at: 2 ).
                lackingMethods at: key put: tempDict.
            ].
        ].
        answer at: #secondAdditional put: lackingMethods.
    ].

    ( answer isEmpty ) ifTrue:  [ answer := nil. ].
    ^answer.!

compareVariablesIn: firstVariableList
    with: secondVariableList

    "Private -- called with either a list of class variables or a list of instance variables"

    | firstString secondString secondAdditional firstAdditional answer |

    answer := Dictionary new.
    ( firstVariableList isNil ) ifTrue: [
        firstString := String new.
    ] ifFalse: [
        firstString := firstVariableList asArrayOfSubstrings.
    ].
    ( secondVariableList isNil ) ifTrue: [
        secondString := String new.
    ] ifFalse: [
        secondString := secondVariableList asArrayOfSubstrings.
    ].

    ( firstString = secondString ) ifFalse: [
        firstAdditional := ( firstString reject: [ :var | secondString includes: var ] ).
        secondAdditional := ( secondString reject: [ :var | firstString includes: var ] ).
    ].

    ( firstAdditional size = 0 ) ifFalse: [
        answer at: #firstAdditional put: firstAdditional.
    ].
    ( secondAdditional size = 0 ) ifFalse: [
        answer at: #secondAdditional put: secondAdditional.
    ].

    ( answer isEmpty ) ifTrue: [ answer := nil. ].
    ^answer!

differencesDictionary

    ^differencesDictionary!

fullComparisonOf: first
    with: second

    "Perform a full comparison of the first image with the second.  This includes noting
    which classes exist in either image which don't exist in the other."

    | classGroup |

    CursorManager execute change.
    firstImage := first.
    secondImage := second.
    classGroup := (firstImage at: #imageDictionary) keys asSet.
    (secondImage at: #imageDictionary) keysDo: [ :key | classGroup add: key ].

    Transcript
        cr;
        show: 'Comparing ', ( firstImage at: #sourceString ), ' with ', ( secondImage at: #sourceString ), '...'.

    differencesDictionary := Dictionary new.
    differencesDictionary
        at: #firstImage put: ( firstImage at: #sourceString );
        at: #secondImage put: ( secondImage at: #sourceString );
        at: #comparison put: ( self compareClassDict: ( firstImage at: #imageDictionary )
                                                  toClassDict: ( secondImage at: #imageDictionary )
                                                  usingClasses: (classGroup asOrderedCollection) ).

    Transcript
        show: ' Done.'; cr.
    CursorManager normal change.
    ^self!

methodComparison: firstMethodDict
    with: secondMethodDict

    "Private - compare method list between image dictionaries"

    | answer classDifferences instanceDifferences tempDictionary |

    answer := Dictionary new.

    classDifferences := self compareMethodsIn: ( firstMethodDict at: #class )
                                          with: ( secondMethodDict at: #class )
                                          ofMethodType: #class.
    instanceDifferences := self compareMethodsIn: ( firstMethodDict at: #instance )
                                          with: ( secondMethodDict at: #instance )
                                          ofMethodType: #instance.

    ( classDifferences isNil ) ifFalse: [
        answer at: #class put: classDifferences.
    ].

    ( instanceDifferences isNil ) ifFalse: [
        answer at: #instance put: instanceDifferences.
    ].

    ( answer isEmpty ) ifTrue: [ answer := nil. ].
    ^answer!

partialComparisonOf: first
    with: second
    usingClasses: classGroup

    "Perform a comparison of just the classes specified.
    classGroup needs to be an OrderedCollection of classes."

    | classNames |

    CursorManager execute change.

    classNames := OrderedCollection new.
    classGroup do: [ :class | classNames add: class asSymbol. ].
    firstImage := first.
    secondImage := second.

    Transcript
        cr;
        show: 'Comparing ', ( firstImage at: #sourceString ), ' with ', ( secondImage at: #sourceString ), '...'.

    differencesDictionary := Dictionary new.
    differencesDictionary
        at: #firstImage put: ( firstImage at: #sourceString );
        at: #secondImage put: ( secondImage at: #sourceString );
        at: #comparison put: ( self compareClassDict: ( firstImage at: #imageDictionary )
                                                  toClassDict: ( secondImage at: #imageDictionary )
                                                  usingClasses: classNames ).

    Transcript
        show: ' Done.'; cr.
    CursorManager normal change.
    ^self!

variableComparison: firstVariables
    with: secondVariables

    "Private - compare variable sets between two classes"

    | answer classDifferences instanceDifferences sharedDifferences |

    classDifferences := self compareVariablesIn: ( firstVariables at: #class )
                                          with: ( secondVariables at: #class ).
    instanceDifferences := self compareVariablesIn: ( firstVariables at: #instance )
                                          with: ( secondVariables at: #instance ).
    sharedDifferences := self compareVariablesIn: ( firstVariables at: #shared )
                                          with: ( secondVariables at: #shared ).

    answer := Dictionary new.

    ( classDifferences isNil ) ifFalse: [
        answer at: #class put: classDifferences.
    ].
    ( instanceDifferences isNil ) ifFalse: [
        answer at: #instance put: instanceDifferences.
    ].
    ( sharedDifferences isNil ) ifFalse: [
        answer at: #shared put: sharedDifferences.
    ].

    ( answer isEmpty ) ifTrue: [ answer := nil. ].
    ^answer! !

!ClassComparison class methods ! !



!ClassComparison methods !

compareClasses

    "Prompt user for information about first and second image.  Then perform a comparison,
    and dump the results to the specified file."

    | baseFileName imageString resultsFile classGroup userDialog first second comparison |

    self initialize.
    userDialog := ClassComparisonDialog new initialize openOn: nativeClassList.
    imageString := userDialog descriptiveString.
    imageString isNil ifTrue: [ ^nil ].
    resultsFile := userDialog resultsFile.
    baseFileName := userDialog snapshotFile.
    classGroup := userDialog selectedClasses.

    first := ClassDictionary new openOnFile: baseFileName.
    first isNil ifTrue: [ ^nil ].
    second := ClassDictionary new openOnNativeClasses: imageString.
    classGroup isNil ifTrue: [
        comparison := ClassComparator new fullComparisonOf: first with: second.
    ] ifFalse: [
        comparison := ClassComparator new partialComparisonOf: first with: second usingClasses: classGroup.
    ].
    ^DifferencesDumper new dump: (comparison differencesDictionary) toFile: resultsFile! !


!ClassDescription class methods ! !



!ClassDescription methods !

describe: methodType
    methodsIn: aClass

    "Private - answer a dictionary which describes the class or instance methods in
    native image"

    | answer methodList compiledMethod source tempStream ignore privateFlag hash |

    answer := Dictionary new.
    ( methodType = #class )  ifTrue: [
        methodList := aClass  class methodDictionary keys.
    ]  ifFalse: [
        methodList := aClass methodDictionary keys.
    ].

    methodList do:  [ :selector |
        ( methodType = #class ) ifTrue: [
            compiledMethod := aClass class compiledMethodAt: selector.
        ]  ifFalse: [
            compiledMethod := aClass compiledMethodAt: selector.
        ].

        source := ClassCompareSourceString from: compiledMethod sourceString.
        hash := source hash.
        ( source isNil ) ifTrue: [
            privateFlag := 0.
        ] ifFalse: [
            privateFlag := source isAPrivateMethod.
        ].

        answer at: ( selector asSymbol )
                     put: ( Array with: hash
                                       with: source
                                       with: privateFlag ).
    ].

    ^answer!

describeClass: aClass

    "Private - answer a dictionary which describes a class in the native image"

    | answer |

    answer := Dictionary new.
    answer
        at: #variables put: ( self describeVariablesInClass: aClass );
        at: #methods put: ( self describeMethodsInClass: aClass ).

    ( aClass superclass isNil ) ifTrue: [
        answer at: #superclass put: nil.
    ] ifFalse: [
        answer at: #superclass put: ( aClass superclass name).
    ].

    ^answer!

describeMethodsInClass: aClass

    "Private - answer a dictionary which describes all methods in the class"

    | answer |

    answer := Dictionary new.
    answer
        at: #class put: ( self describe: #class methodsIn: aClass );
        at: #instance put: ( self describe: #instance methodsIn: aClass ).

    ^answer!

describeVariablesInClass: aClass

    "Private - answer a dictionary which describes all variables in a class"

    | answer |

    answer := Dictionary new.
    answer
        at: #class put: aClass classVariableString;
        at: #instance put: aClass instanceVariableString;
        at: #shared put: aClass sharedVariableString;
        at: #structure put: aClass structure.

    ^answer! !

!ClassDictionary class methods !

new

    ^super new initialize! !



!ClassDictionary methods !

getClass

    "Private - answer the next class description in the file"

    | answer |

    answer := Dictionary new.

    answer
        at: #superclass put: ( imageFile nextBlock: delim );
        at: #variables put: ( self getVariables );
        at: #methods put: ( self getMethods ).

    ^answer.!

getMethodGroup

    "Private - parse the method group which is next in the file"

    | methodListSize selector hash source privateFlag answer |

    methodListSize := imageFile getInteger.
    answer := Dictionary new.

    methodListSize timesRepeat: [
        selector := imageFile nextBlock: delim.
        source := ClassCompareSourceString from: (imageFile nextBlock: delim).
        hash := imageFile getInteger.
        privateFlag := imageFile getInteger.
        answer at: selector asSymbol
            put: ( Array with: hash with: source with: privateFlag ).
    ].
    ^answer!

getMethods

    "Private - answer a dictionary describing the upcoming methods in the file"

    | answer |

    answer := Dictionary new.
    answer
        at: #instance put: ( self getMethodGroup );
        at: #class put: ( self getMethodGroup ).

    ^answer.!

getVariables

    "Private - answer a dictionary with the upcoming variable description"

    | answer |

    answer := Dictionary new.
    answer
        at: #instance put: ( imageFile nextBlock: delim );
        at: #class put: ( imageFile nextBlock: delim );
        at: #shared put: ( imageFile nextBlock: delim );
        at: #structure put: imageFile getInteger.

    ^answer.!

openOnClassGroup: aClassGroup
    imageString: aString

    "Private - Fill up a dictionary with a description of the specified classes in the
    native image"

    | builtClassDictionary sourceClassInfo |

    CursorManager execute change.
    builtClassDictionary := ClassCompareDictionary new.
    Transcript
        cr;
        show: 'Scanning classes for: ', aString, '...'.

    aClassGroup do: [ :class |
        builtClassDictionary at: (class name asSymbol)
            put: ( ClassDescription new describeClass: class ).
    ].
    CursorManager normal change.

    sourceClassInfo := ClassCompareDictionary new.
    sourceClassInfo
        at: #sourceString put: aString;
        at: #imageDictionary put: builtClassDictionary.

    Transcript
        show: ' Done.'; cr.

    ^sourceClassInfo!

openOnFile: aFileName

    "Answer a dictionary which describes the image stored in the imagefile"

    | className builtClassDictionary sourceString sourceClassInfo |

    imageFile := File pathName: aFileName.
    imageFile atEnd ifTrue:  [
        Transcript
            cr;
            nextPutAll: 'Error!!!!!!  Snapshot file empty'; cr.
    ^nil
    ]

    ifFalse: [
        CursorManager execute change.
        builtClassDictionary := ClassCompareDictionary new.
        sourceString := imageFile nextBlock: delim.
        Transcript
            cr;
            show: 'Scanning classes for: ', sourceString, '...'.

        [ imageFile atEnd ] whileFalse: [
            className := imageFile nextBlock: delim.
            builtClassDictionary at: className asSymbol
                                        put: (self getClass).
        ].
        CursorManager normal change.
    ].
    imageFile close.

    sourceClassInfo := ClassCompareDictionary new.
    sourceClassInfo
        at: #sourceString put: sourceString;
        at: #imageDictionary put: builtClassDictionary.

    Transcript
        show: ' Done.'; cr.
    ^sourceClassInfo!

openOnNativeClasses: aString

    "Answer a dictionary with a description of the native image"

    ^self openOnClassGroup: nativeClassList imageString: aString! !

!DifferencesDumper class methods ! !



!DifferencesDumper methods !

dump: differencesDictionary
    toFile: aFileName

    "Report the results of the comparison to the specified file.  Note classes which
    are missing from one image or the other, and for common classes, note methods
    which are missing or changed"

    | comparison |

    CursorManager execute change.
    comparison := differencesDictionary at: #comparison.
    firstImage := differencesDictionary at: #firstImage.
    secondImage := differencesDictionary at: #secondImage.
    Transcript
        cr;
        show: 'Dumping differences...'.

    File remove: aFileName ifAbsent: [].
    differencesFile := File pathName: aFileName.
     differencesFile
        nextPutAll: 'Comparison of ', firstImage, ' with ', secondImage;
        cr; cr.

    ( comparison includesKey: #common ) ifTrue: [
        self dumpSharedClasses: ( comparison at: #common ).
    ].

        ( comparison includesKey: #secondAdditional ) ifTrue: [
            differencesFile
                cr; cr; cr; cr;
                nextPutAll: 'The following classes only appear in ', secondImage; cr; cr.
            self dumpLackingClasses: ( comparison at: #secondAdditional ).
        ].

        ( comparison includesKey: #firstAdditional ) ifTrue: [
            differencesFile
                cr; cr; cr; cr;
                nextPutAll: 'The following classes only appear in ', firstImage; cr; cr.
            self dumpLackingClasses: ( comparison at: #firstAdditional ).
        ].

    differencesFile
        truncate;
        close.
    Transcript show: ' Done.'; cr.
    CursorManager normal change.!

dumpAMethodDictionary: aDictionary
    whoHasWhat: aBitMap

    "Private - report the differences in methods for this class.  The report will be in 3
    clumps: the methods they have in common but which were different, the methods
    the first image lacks, the methods which the second image lacks.

    aBitMap is an integer 0 through 3.  If the high bit is set, these methods exist in the
    1st image.  If the low bit is set, these methods exist in the 2nd image."

    | outbuf tempMethod |

    outbuf := WriteStream on: ( String new: 80 ).

    ( aDictionary keys asSortedCollection ) do: [ :methodName |
        outbuf
            reset; next: 80 put: $ ; reset.
        tempMethod := aDictionary at: methodName.
        outbuf
            nextPutAll: '  ', methodName asString;
            position: 43;  next: 37 put: $ ; position: 45.
        ( ((tempMethod at: #private) // 2) = 1 ) ifTrue:  [  "my private flag is 1"
            outbuf nextPutAll: 'present'.
        ] ifFalse: [
            ( (aBitMap // 2) = 1 ) ifTrue: [
                outbuf nextPutAll: 'present'.
            ] ifFalse: [
                (tempMethod includesKey: #inherited) ifFalse: [
                    outbuf nextPutAll: '  ---  '.
                ] ifTrue: [
                    outbuf nextPutAll: (tempMethod at: #string).
                ].
            ].
        ].
        outbuf position: 60; nextPutAll: '  '; position: 62.
        ( (((aDictionary at: methodName) at: #private) \\ 2) = 1 ) ifTrue: [  "his private flag is 1"
            outbuf nextPutAll: 'present'.
        ] ifFalse: [
            ( (aBitMap \\ 2) = 1 ) ifTrue: [
                outbuf nextPutAll: 'present'.
            ] ifFalse: [
                (tempMethod includesKey: #inherited) ifFalse: [
                    outbuf nextPutAll: '  ---  '.
                ] ifTrue: [
                    outbuf nextPutAll: (tempMethod at: #string).
                ].
            ].
        ].
"        outbuf position: 77; nextPutAll: '   '."

        differencesFile
            nextPutAll: outbuf contents; cr.
    ].!

dumpLackingClasses: aClassDictionary

    "Private - just list the classes which one image did not have"

    aClassDictionary keysDo: [ :className |
        differencesFile nextPutAll: className; cr.
    ]!

dumpMethodDifferences: aMethodDictionary

    "Private - show the methods which differed in this class"

    | tempDictionary |

    ( aMethodDictionary includesKey: #class ) ifTrue: [
        self dumpMethodDifferences: ( aMethodDictionary at: #class ) ofMethodType: #class.
    ].

    ( aMethodDictionary includesKey: #instance ) ifTrue: [
        self dumpMethodDifferences: ( aMethodDictionary at: #instance ) ofMethodType: #instance.
    ].!

dumpMethodDifferences: aDictionary
    ofMethodType: aSymbol

    "Private - produce a formatted report of the method differences for this class"

    | tempDictionary outbuf |

    (aDictionary keys detect: [ :key | (key=#differences) | (key=#firstAdditional) | (key=#secondAdditional) ] ifNone: [nil] ) isNil ifFalse: [
        differencesFile cr.
        outbuf := WriteStream on: ( String new: 80 ).
        outbuf
            next: 80 put: $ ; reset;
            nextPutAll: aSymbol printString, ' methods '.

            outbuf
                position: 45; nextPutAll: firstImage;
                position: 62; nextPutAll: secondImage.
            differencesFile nextPutAll: outbuf contents; cr.
    ].

    ( aDictionary includesKey: #differences ) ifTrue: [
        self dumpAMethodDictionary: ( aDictionary at: #differences )  whoHasWhat: 3.
        differencesFile  cr.
    ].

    ( aDictionary includesKey: #firstAdditional ) ifTrue: [
        self dumpAMethodDictionary: ( aDictionary at: #firstAdditional )  whoHasWhat: 2.
        differencesFile  cr.
    ].

    ( aDictionary includesKey: #secondAdditional ) ifTrue: [
        self dumpAMethodDictionary: ( aDictionary at: #secondAdditional )  whoHasWhat: 1.
        differencesFile  cr.
    ].!

dumpSharedClasses: aClassDictionary

    "Private - show which classes the two images had in common, but with different methods"

    | tempClass |

    ( aClassDictionary keys asSortedCollection ) do:  [ :classname |
        tempClass := aClassDictionary at: classname.
"        (aClassDictionary keys detect: [ :key |
            (key=#superclass) | (key=#variables) | (key=#methods) ] ifNone: [nil] ) isNil ifFalse: ["
                    differencesFile
                        cr; cr;
                        nextPutAll: '---------- Class name: ', ( classname asString ), ' ----------'; cr.
"            ]."

        ( tempClass includesKey: #superclass ) ifTrue: [
            differencesFile
                nextPutAll: 'Subclass of ', ( (tempClass at: #superclass) at: 1 ) asString, ' in ', firstImage; cr;
                nextPutAll: 'Subclass of ', ( (tempClass at: #superclass) at: 2 ) asString, ' in ', secondImage; cr.
        ].

        ( tempClass includesKey: #variables ) ifTrue: [
            self dumpVariableDifferences: ( tempClass at: #variables ).
        ].
        ( tempClass includesKey: #methods ) ifTrue: [
            self dumpMethodDifferences: ( tempClass at: #methods ).
        ].
    ].!

dumpVariableDifferences: aVariableDictionary

    "Private - show variable differences"

    ( aVariableDictionary includesKey: #class ) ifTrue: [
        self dumpVariableDifferences: ( aVariableDictionary at: #class )
               ofVariableType: #class.
    ].
    ( aVariableDictionary includesKey: #instance ) ifTrue: [
        self dumpVariableDifferences: ( aVariableDictionary at: #instance )
               ofVariableType: #instance.
    ].
    ( aVariableDictionary includesKey: #shared ) ifTrue: [
        self dumpVariableDifferences: ( aVariableDictionary at: #shared )
               ofVariableType: #shared.
    ].!

dumpVariableDifferences: aVariableDictionary
    ofVariableType: aSymbol

    "Private - show either class, instance, or pool variable differences"

    | tempString |

    tempString := aSymbol asString.
    ( aVariableDictionary includesKey: #secondAdditional ) ifTrue: [
        differencesFile
            nextPutAll: secondImage, ' has these additional ', tempString, ' variables: '.
        ( aVariableDictionary at: #secondAdditional ) do: [ :var |
            differencesFile nextPutAll: var, ' '.
        ].
        differencesFile cr.
    ].

    ( aVariableDictionary includesKey: #firstAdditional ) ifTrue: [
        differencesFile
            nextPutAll: firstImage, ' has these additional ', tempString, ' variables: '.
        ( aVariableDictionary at: #firstAdditional ) do: [ :var |
            differencesFile nextPutAll: var, ' '.
        ].
        differencesFile cr.
    ].! !
