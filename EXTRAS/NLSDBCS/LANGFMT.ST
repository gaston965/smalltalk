"                                           
Language specific formatting changes to
    o Time
    o Directory
    o Number
    o Float 

"!

!Time class methods !

fromString: aString
        " Answer a Time for the value given by aString.
          aString must be in the form specified by the
          current system time format."
    | aStream hh mm ss timeSeparator timeId|
    aStream := ReadStream on: aString.
    timeSeparator := NationalLanguage timeSeparator at: 1.
    hh := (aStream upTo: timeSeparator) asInteger.       " hours "
    ((NationalLanguage isTimeFormat12Hour and: [hh = 0 or: [hh > 12]])
     or: [(NationalLanguage isTimeFormat12Hour = false) and: [hh > 23]])
        ifTrue: [^self error: 'error in hours'].
    mm := (aStream upTo: timeSeparator) asInteger.    " minutes "
    (mm > 59) ifTrue: [^self error: 'error in minutes'].
    ss := (aStream upTo: $ ) asInteger.                            " seconds "
    (ss > 59) ifTrue: [^self error: 'error in seconds'].
    timeId := aStream next: ((aStream readLimit) - (aStream position)).
    timeId := timeId trimBlanks.
    (NationalLanguage isTimeFormat12Hour)
        ifTrue: [                "12 hours"
            (hh = 12) ifTrue: [hh := 0].
            (timeId = NationalLanguage time1159)
                ifFalse: [
                    (timeId = NationalLanguage time2359)
                        ifTrue: [ hh := hh + 12]
                        ifFalse: [^self error: 'error in time string']]]
        ifFalse: [                "24 hours"
            (timeId size > 0) ifTrue: [^self error: 'invalid time string format']].
    ^self fromSeconds: ( hh * 60 + mm * 60 + ss)! !


!Time methods !

printOn: aStream
        "Append a string representing the receiver time
         to aStream in the form specified by the current
         system time format."
    | time am|
    am := true.
    time := self hours.
    NationalLanguage isTimeFormat12Hour ifTrue: [
        time > 12
            ifTrue: [
                time := time - 12.
                am := false]
            ifFalse: [
                (time = 12)
                    ifTrue: [am := false]
                    ifFalse: [ time = 0 ifTrue: [time := 12]]]].
    (time < 10) ifTrue: [aStream nextPut: $0 ].
    time printOn: aStream.
    aStream nextPutAll: NationalLanguage timeSeparator.
    time := self minutes.
    (time < 10) ifTrue: [aStream nextPut: $0 ].
    time printOn: aStream.
    aStream nextPutAll: NationalLanguage timeSeparator.
    time := self seconds.
    (time < 10) ifTrue: [aStream nextPut: $0 ].
    time printOn: aStream.
    (NationalLanguage isTimeFormat12Hour)
        ifTrue: [
            aStream nextPutAll: ' '.
            am
                ifTrue: [aStream nextPutAll: NationalLanguage time1159]
                ifFalse: [aStream nextPutAll: NationalLanguage time2359]].! !



!String methods !

asTime
        "Answer a Time representing the receiver."
    ^Time fromString: self! !



!Directory class methods !

extractDateTimeFrom: aString
        "Answer a String in form 'yy-mm-dd hh:mm:ss'
         describing date and time from DOS directory
         entry aString."
    | answer byte1 byte2 field1 field2 field3 aStream |
    answer := String new: 18.
    aStream := WriteStream on: answer.
        "computing the yy-mm-dd part"
    byte1 := (aString at: 25) asciiValue.
    byte2 := (aString at: 26) asciiValue.
    field1 := (byte2 bitShift: -1) + 80.
    field2 := (byte1 bitShift: -5)
        + ((byte2 bitAnd: 1) * 8).
    field3 := byte1 bitAnd: 31.
    (Date newDay: field3
        month: (Date nameOfMonth: field2)
        year: field1) printOn: aStream.
    aStream space; space.
        "computing the hh:mm:ss part"
    byte1 := (aString at: 23) asciiValue.
    byte2 := (aString at: 24) asciiValue.
    field1 := byte2 bitShift: -3.
    field2 := (byte1 bitShift: -5)
        + ((byte2 bitAnd: 7) * 8).
    field3 := (byte1 bitAnd: 31) * 2.
    (Time hours: field1 minutes: field2 seconds: field3) printOn: aStream.
    ^answer! !


!Number methods !

printFraction: numberFractionDigits
        "Answer a string, the ASCII representation
         of the receiver truncated to numberFractionDigits
         decimal places."
   | stream fraction integer |
    numberFractionDigits < 0
        ifTrue: [self error: 'Negative digit count'].
    stream := WriteStream on: (String new: 16).
    integer := self truncated.
    (self > -1) & (self < 0)
        ifTrue: [stream show: '-0']
        ifFalse: [integer printOn: stream].
    stream nextPutAll: NationalLanguage decimalSeparator.
    fraction := (self - integer) abs.
    integer := 0.
    numberFractionDigits timesRepeat: [
        fraction := (fraction - integer) * 10.
        (integer := fraction // 1) printOn: stream].
    ^stream contents! !





!Float class methods !

fromString: aString
        "Answer the floating point conversion of the receiver;
         the receiver is expected to be a sequence of
         the form [(+|-)] [digits] [decSep [digits] ] [(E|e) [(+|-) digits]]."
    | string integer fraction exponent char index decSep |
    aString size = 0 ifTrue: [^0.0].
    (char := aString at: 1) = $-
        ifTrue: [ ^(aString copyFrom: 2 to: aString size) asFloat negated].
    decSep := NationalLanguage decimalSeparator.
    string := aString, decSep, 'Ez'.
    integer := index := 0.
    char = $+
        ifTrue: [index := 1].
    [(char := string at: (index := index + 1)) isDigit]
        whileTrue: [integer := integer * 10 + char digitValue].
    fraction := 1.
    char = (decSep at: 1)
        ifTrue: [
            [(char := string at: (index := index + 1)) isDigit]
                whileTrue: [
                    integer := integer * 10 + char digitValue.
                    fraction := fraction * 10]].
    (char = $E or: [char = $e])
        ifTrue: [exponent := (string copyFrom: index+1 to: string size) asInteger]
        ifFalse: [
            integer = 0 ifTrue: [^0.0].
            exponent := 0].
    integer = 0 ifTrue: [^0.0].
    exponent := 10 raisedToInteger: exponent.
    ^((integer / fraction) * exponent) asFloat! !


!Float methods !

printOn: aStream
        "Append the ASCII representation
         (maximum of 8 digits) of
         the receiver to aStream."
    self printOn: aStream
        decimalSeparator: NationalLanguage decimalSeparator! !


