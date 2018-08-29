
Magnitude subclass: #Date
  instanceVariableNames:
    'day '
  classVariableNames:
    'MonthStrings MonthNames DayNames '
  poolDictionaries:
    'WinConstants '   !


!Date class methods !


calendarForMonth: aSymbol year: anInteger
        "Answer a String containing the formatted calendar
         for the month name aSymbol in the year anInteger."
    | aStream index daysInMonth firstDayIndex daysBlank |
    firstDayIndex := (self newDay: 1 month: aSymbol
        year: anInteger) dayIndex.
    aStream := WriteStream on: (String new: 200).
    daysInMonth := self daysInMonth: aSymbol
        forYear: anInteger.
"    aStream nextPutAll: 'Su Mo Tu We Th Fr Sa'; cr."
    #(7 1 2 3 4 5 6) do: [ :i |
        aStream nextPutAll: (((self nameOfDay: i) asString) copyFrom: 1 to: 2).
        aStream nextPut: $ ].
    aStream cr.
    daysBlank := firstDayIndex \\ 7.
    index := 1.
    [index <= daysBlank ]
        whileTrue: [
            aStream nextPutAll: '   '.
            index := index + 1].
    1 to: 9 do: [ :i |
        index > 7
            ifTrue: [
                index := 1.
                aStream cr].
        aStream space.
        i printOn: aStream.
        aStream space.
        index := index + 1].
    10 to: daysInMonth do: [ :i |
        index > 7
            ifTrue: [
                index := 1.
                aStream cr].
        i printOn: aStream.
        aStream space.
        index := index + 1].
    ^aStream contents!

dayNames
        "Answer the class variable that contain
         the associations between the day name
         as symbols and the day indices."
    ^DayNames.!

dayOfWeek: aSymbol
        "Answer a number from 1 to 7 indicating the
         weekday number for aSymbol (1 meaning Monday,
         to 7 meaning Sunday)."
    ^DayNames at: aSymbol
        ifAbsent: [ self errorInDay ]!

fromString: aString
        "Answer a Date specified by aString.  aString
         must represent a date in one of three formats:
         'Jan 2, 1990'  or '2 Jan, 1990' or '02-01-90'
         but the delimiters between the month, day and
         year can be any sequence of non-alphanumeric
         characters."
    | aStream field1 field2 field3 month year |
    aStream := aString asStream.
    field1 := aStream nextWord.
    (DayNames includesKey: field1 asSymbol)
        ifTrue: [field1 := aStream nextWord].
    field2 := aStream nextWord.
    (field2 equalsIgnoreCase:  'of')
        ifTrue: [field2 := aStream nextWord].
    field3 := aStream nextWord.
    year := field3 asInteger.
    year < 100 ifTrue: [year := year + 1900].

    field1 first isLetter                            " 'Jan 2, 1990' format"
        ifTrue: [
            month := self monthNameFromString: field1.
            ^self
                newDay: field2 asInteger
                month: month
                year: year].

    field2 first isLetter                             " '2 Jan, 1990' format"
        ifTrue: [
            month := self monthNameFromString: field2.
            ^self
                newDay: field1 asInteger
                month: month
                year: year].

        "Must be '02-01-90' or 02-01-1990' style"
    (NationalLanguage dateFormat) = DfMDY                      "mm-dd--yy"
        ifTrue: [
            ^self
                newDay: field2 asInteger
                month: (self nameOfMonth: field1 asInteger)
                year: year]
        ifFalse: [
            (NationalLanguage dateFormat) = DfDMY              "dd-mm-yy"
                ifTrue: [
                    ^self
                        newDay: field1 asInteger
                        month: (self nameOfMonth: field2 asInteger)
                        year: year]
                ifFalse: [                                          "yy-mm-dd"
                    year := field1 asInteger.
                    year < 100 ifTrue: [year := year + 1900].
                    ^self
                        newDay: field3 asInteger
                        month: (self nameOfMonth: field2 asInteger)
                        year: year]].!

indexOfMonth: aSymbol
        "Answer a number from 1 to 12 indicating
         the month index for the aSymbol."
    ^MonthNames at: aSymbol
        ifAbsent: [self errorInMonth]!

initialize
        "Private - Initialize the class dictionary variables
         DayNames that contain the associations between
         the day name as symbols and the day indices.
         MonthNames that contain the associations between
         the month names as symbols and the month indices."
        "This is one time code so it is commented --"
    DayNames := Dictionary new.
    DayNames
        at: #Mon put: 1;
        at: #Monday put: 1;
        at: #Tue put: 2;
        at: #Tuesday put: 2;
        at: #Wed put: 3;
        at: #Wednesday put: 3;
        at: #Thr put: 4;
        at: #Thursday put: 4;
        at: #Fri put: 5;
        at: #Friday put: 5;
        at: #Sat put: 6;
        at: #Saturday put: 6;
        at: #Sun put: 7;
        at: #Sunday put: 7.
    MonthNames := Dictionary new.
    MonthNames
        at: #Jan put: 1;
        at: #January put: 1;
        at: #Feb put: 2;
        at: #February put: 2;
        at: #Mar put: 3;
        at: #March put: 3;
        at: #Apr put: 4;
        at: #April put: 4;
        at: #May put: 5;
        at: #Jun put: 6;
        at: #June put: 6;
        at: #Jul put: 7;
        at: #July put: 7;
        at: #Aug put: 8;
        at: #August put: 8;
        at: #Sep put: 9;
        at: #September put: 9;
        at: #Oct put: 10;
        at: #October put: 10;
        at: #Nov put: 11;
        at: #November put: 11;
        at: #Dec put: 12;
        at: #December put: 12."--"!


monthNameFromString: aString
        "Answer a Symbol for a month name corresponding
         to the month name in aString."
    | aName |
    aName := aString trimBlanks asSymbol.
    MonthNames associationsDo: [ :assoc |
        (assoc key equalsIgnoreCase: aName)
            ifTrue: [ ^assoc key ]].
    ^self errorInMonth!

monthNames
        "Answer the class variable that contain
         the associations between the month name
         as symbols and the month indices."
    ^MonthNames.!

nameOfDay: anInteger
        "Answer the weekday name as a Symbol corresponding
         to the weekday index anInteger (Monday for
         index 1, to Sunday for index 7)."
    | aName |
    (anInteger > 7 or: [anInteger < 1])
        ifTrue: [self errorInDay].
    DayNames associationsDo: [ :assoc |
        (anInteger = assoc value) ifTrue: [
            aName isNil
                ifTrue: [ aName := assoc key ]
                ifFalse: [
                    ^(aName size > assoc key size)     "answer long name"
                        ifTrue: [ aName ]
                        ifFalse: [ assoc key]]]].
    aName isNil
        ifTrue: [ self errorInDay ]
        ifFalse: [ ^aName ].!

nameOfMonth: anInteger
        "Answer the month name as a Symbol corresponding
         to the month index anInteger (January for index
         1, to December for index 12)."
    | aName |
    (anInteger > 12 or: [anInteger < 1])
        ifTrue: [self errorInMonth].
    MonthNames associationsDo: [ :assoc |
        (anInteger = assoc value) ifTrue: [
            aName isNil
                ifTrue: [ aName := assoc key ]
                ifFalse: [
                    ^(aName size > assoc key size)     "answer long name"
                        ifTrue: [ aName ]
                        ifFalse: [ assoc key]]]].
    aName isNil
        ifTrue: [ self errorInMonth]
        ifFalse: [ ^aName ].!

replaceDayNames: aDictionary
        "Attempt to replace the class variable that contain
         the associations between the day name and the
         day index. The day name must be a symbol
         and the day index must be between 1 and 7.
         Answer whether successful. "
    aDictionary associationsDo: [ :assoc |
        (assoc key isSymbol and: [assoc value >= 1 and: [assoc value <= 7]])
            ifFalse: [^false]].
    DayNames := aDictionary.
    ^true.!

replaceMonthNames: aDictionary
        "Attempt to replace the class variable that contain
         the associations between the month name and the
         month index. The month name must be a symbol
         and the month index must be between 1 and 12.
         Answer whether successful. "
    aDictionary associationsDo: [ :assoc |
        (assoc key isSymbol and: [assoc value >= 1 and: [assoc value <= 12]])
            ifFalse: [^false]].
    MonthNames := aDictionary.
    ^true.! !

!Date methods !

printOn: aStream
        "Append a string representing the receiver date
         to aStream in the form specified by the current
         system date format."
    | field1 field2 field3 |
    (NationalLanguage dateFormat) = DfMDY              "mm-dd-yy"
        ifTrue: [
            field1 := self monthIndex.
            field2 := self dayOfMonth.
            field3 := self year \\ 100]
        ifFalse: [
            (NationalLanguage dateFormat) = DfDMY      "dd-mm-yy"
                ifTrue: [
                    field1 := self dayOfMonth.
                    field2 := self monthIndex.
                    field3 := self year \\ 100 ]
                ifFalse: [                                      "yy-mm-dd"
                    field1 := self year \\ 100.
                    field2 := self monthIndex.
                    field3 := self dayOfMonth ]].
    field1 <= 9 ifTrue: [ aStream nextPut: $0 ].
    field1 printOn: aStream.
    aStream nextPutAll: NationalLanguage dateSeparator.
    field2 <= 9 ifTrue: [ aStream nextPut: $0 ].
    field2 printOn: aStream.
    aStream nextPutAll: NationalLanguage dateSeparator.
    field3 <= 9 ifTrue: [ aStream nextPut: $0 ].
    field3 printOn: aStream.!

formPrint
        "Answer a string representing the receiver date in
         the form specified by the current system date format."
    | aStream |
    aStream := WriteStream on: (String new: 8).
    self printOn: aStream.
    ^aStream contents! !


Magnitude subclass: #Date
  instanceVariableNames:
    'day '
  classVariableNames:
    'MonthNames DayNames '
  poolDictionaries:
    'WinConstants '   !  


!Date class methods !

shortNameOfDay: anInteger
        "Answer the short weekday name as a Symbol
         corresponding to the weekday index anInteger
         (Mon for index 1, to Sun for index 7)."
    | aName |
    (anInteger > 7 or: [anInteger < 1])
        ifTrue: [self errorInDay].
    DayNames associationsDo: [ :assoc |
        (anInteger = assoc value) ifTrue: [
            aName isNil
                ifTrue: [ aName := assoc key ]
                ifFalse: [
                    ^(aName size < assoc key size)     "answer short name"
                        ifTrue: [ aName ]
                        ifFalse: [ assoc key]]]].
    aName isNil
        ifTrue: [ self errorInDay ]
        ifFalse: [ ^aName ].!

shortNameOfMonth: anInteger
        "Answer the short month name as a Symbol corresponding
         to the month index anInteger (Jan for index 1, 
         to Dec for index 12)."
    | aName |
    (anInteger > 12 or: [anInteger < 1])
        ifTrue: [self errorInMonth].
    MonthNames associationsDo: [ :assoc |
        (anInteger = assoc value) ifTrue: [
            aName isNil
                ifTrue: [ aName := assoc key ]
                ifFalse: [
                    ^(aName size < assoc key size)     "answer short name"
                        ifTrue: [ aName ]
                        ifFalse: [ assoc key]]]].
    aName isNil
        ifTrue: [ self errorInMonth]
        ifFalse: [ ^aName ].! !


!Date methods !

printOn: aStream withPicture: aString
        "Private - Append a string representing the receiver date
         to aStream in the form specified by the aString
         date format picture."
    | m d y value length pictureStream |
    m := self monthIndex.
    d := self dayOfMonth.
    y := self year.
    pictureStream := aString asStream.

    [ pictureStream atEnd ] whileFalse: [
        value := pictureStream next.
        (value = $M or: [value = $d or: [value = $y]])
            ifFalse: [ aStream nextPut: value ]
            ifTrue: [
                pictureStream backupOver: value.
                value := pictureStream nextWord.
                length := value size.
                (value at: 1) = $M ifTrue: [
                    length = 1 ifTrue: [ m printOn: aStream ].
                    length = 2 ifTrue: [
                        m <= 9 ifTrue: [ aStream nextPut: $0 ].
                        m printOn: aStream ].
                    length = 3 ifTrue: [
                        (self  class shortNameOfMonth: m) printOn: aStream ].
                    length = 4 ifTrue: [
                        (self  class nameOfMonth: m) printOn: aStream ] ]
                ifFalse: [
                    (value at: 1) = $d ifTrue: [
                        length = 1 ifTrue: [ d printOn: aStream ].
                        length = 2 ifTrue: [
                            d <= 9 ifTrue: [ aStream nextPut: $0 ].
                            d printOn: aStream ].
                        length = 3 ifTrue: [
                            (self  class shortNameOfDay: self dayIndex) printOn: aStream ].
                        length = 4 ifTrue: [
                            (self  class nameOfDay: self dayIndex) printOn: aStream ] ]
                    ifFalse: [
                        (value at: 1) = $y ifTrue: [
                            length = 2
                                ifTrue: [ y \\ 100 printOn: aStream ]
                                ifFalse: [ y printOn: aStream ] ] ].
                ].
            ].
        ].! 


printLongOn: aStream
        "Append a string representing the receiver date
         to aStream in the form specified by the current
         system long date format."
    self printOn: aStream
        withPicture: (NationalLanguage longDateFormat)!

printShortOn: aStream
        "Append a string representing the receiver date
         to aStream in the form specified by the current
         system short date format."
    self printOn: aStream
        withPicture: (NationalLanguage shortDateFormat)! !

