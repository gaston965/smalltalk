
Object subclass: #NationalLanguageSupport
  instanceVariableNames: 
    'allUpperCase allLowerCase collateTable country codePage dateFormat dateSeparator timeFormat timeSeparator currencyFormat currency thousandsSeparator decimalPlace decimalSeparator dataSeparator time1159 time2359 leadBytes isDoubleByteCp countryName language measurementSystem timeLeadZero shortDateFormat longDateFormat currencyDigits negativeCurrencyFormat decimalLeadZero isDigit isLetter '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants CharacterConstants'   !


!NationalLanguageSupport class methods !
 
new
    ^super new initialize! !



!NationalLanguageSupport methods !
 
asLowerCase: aCharacter
        "Answer the lower-case value of aCharacter
         if it is a letter, else answer aCharacter."
    | anInteger |
    anInteger := aCharacter asInteger.
    ((anInteger > 0) and: [anInteger < 256])
        ifTrue: [^allLowerCase at: anInteger].
    ^aCharacter!

asUpperCase: aCharacter
        "Answer the upper-case value of the aCharacter
         if it is a letter, else answer the aCharacter."
    | anInteger |
    anInteger := aCharacter asInteger.
    ((anInteger > 0) and: [anInteger < 256])
        ifTrue: [^allUpperCase at: anInteger].
    ^aCharacter!

character: aCharacter1 isGreaterThan: aCharacter2
        "Answer true if aCharacter1 is greater
         than aCharacter2, else answer false."
    ^(collateTable at: (aCharacter1 asInteger + 1)) >
            (collateTable at: (aCharacter2 asInteger + 1))!
   
character: aCharacter1 isGreaterThanOrEqualTo: aCharacter2
        "Answer true if aCharacter1 is greater than
         or equal to aCharacter2, else answer false."
    ^(collateTable at: (aCharacter1 asInteger + 1)) >=
            (collateTable at: (aCharacter2 asInteger + 1))!
   
character: aCharacter1 isLessThan: aCharacter2
        "Answer true if aCharacter1 is less than
         aCharacter2, else answer false."
    ^(collateTable at: (aCharacter1 asInteger + 1)) <
            (collateTable at: (aCharacter2 asInteger + 1))!
 
character: aCharacter1 isLessThanOrEqualTo: aCharacter2
        "Answer true if aCharacter1 is less than
         or equal to aCharacter2, else answer false."
    ^(collateTable at: (aCharacter1 asInteger + 1)) <=
            (collateTable at: (aCharacter2 asInteger + 1))!
   
collateTable
        "Answer the current collate-sequence (sorting weight) table."
    ^collateTable!

collateTable: aCollateTable
        "Replace the current collate-sequence (sorting weight) table."
    ^collateTable := aCollateTable.!

compareString: aString1 withString: aString2
        "The comparison is case-sensitive.
         Answer < 0 if aString1 is less than aString2
                      = 0 if aString1 is identical to aString2
                      > 0 if aString1 is greater than aString2."
    ^UserLibrary
        lStrCmp: aString1 asParameter
        withString: aString2 asParameter!
   
compareStringi: aString1 withString: aString2
        "The comparison is case-insensitive.
         Answer < 0 if aString1 is less than aString2
                      = 0 if aString1 is identical to aString2
                      > 0 if aString1 is greater than aString2."
    ^UserLibrary
        lStrCmpi: aString1 asParameter
        withString: aString2 asParameter!
   
country
        "Answer the current system value for country identifier."
    ^country!
   
countryName
        "Answer the current system value for country name."
    ^countryName!
   
currency
        "Answer the current system value for currency symbol."
    ^currency!
  
currencyDigits
        "Answer the current system value for the number of digits
         following the decimal point in a currency amount."
    ^currencyDigits!

currencyFormat
        "Answer the current system value for currency format.
         Answer 0 = Currency symbol prefix, no separation ($1)
                      1 = Currency symbol suffix, no separation (1$)
                      2 = Currency symbol prefix, one char separation ($ 1)
                      3 = Currency symbol suffix, one char separation (1 $)."
    ^currencyFormat!
 
dataSeparator
        "Answer the current system value for data/list separator."
    ^dataSeparator!
 
dateFormat
        "Answer the current system value for date format.
         Answer 0 = Month-Day-Year (DfMDY)
                      1 = Day-Month-Year (DfDMY)
                      2 = Year-Month-Day (DfYMD)."
    ^dateFormat!
 
dateSeparator
        "Answer the current system value for date separator."
    ^dateSeparator!
 
decimalLeadZero
        "Answer the current system value for decimal lead zero.
         Answer 0 = no leading zero (.7)
                      1 = leading zero (0.7)."
    ^decimalLeadZero!
 
decimalPlace
        "Answer the current system value for the number of digits
         following the decimal point in a number."
    ^decimalPlace!
 
decimalSeparator
        "Answer the current system value for decimal separator."
    ^decimalSeparator!
  
initCharacterPredicates
        "Private - Initialize the receiver's isLetter, isDigit
          allLowerCase, and allUpperCase collection for
          the system current country and language settings."
    | upper aString |
    allUpperCase := Array new: 255.
    allLowerCase := Array new: 255.
    isLetter := Array new: 255.
    isDigit := Array new: 255.
    aString := String new: 2.
    1 to: 255 do: [:cp |
        aString at: 1 put: (cp asCharacter).
        UserLibrary ansiUpperBuff: aString length: 1.
        allUpperCase at: cp put: (aString at: 1).

        aString at: 1 put: (cp asCharacter).
        UserLibrary ansiLowerBuff: aString length: 1.
        allLowerCase at: cp put: (aString at: 1).

       (isLetter at: cp put: (UserLibrary isCharAlpha: cp))
            ifTrue: [isDigit at: cp put: false]
            ifFalse: [isDigit at: cp put: (UserLibrary isCharAlphaNumeric: cp)].
    ].!
 
initCollateTable
        "Private - Initialize the receiver's collateTablewith
          the collating-sequence table for the current country
          and language settings. The table is a character
          array of 256 elements in which each element in
          the table specifies the sorting weight of the
          corresponding character. The sorting weight is the
          value used to determine if a character appears
          before or after another character in a sorted list."
    | collection aString bString|
"    ((NationalLanguage collateTable) notNil
        and: [(self country = NationalLanguage country)
        and: [self language = NationalLanguage language]])
        ifTrue: [self collateTable: (NationalLanguage collateTable)]
        ifFalse: [
"           aString := String new: 2.
           bString := String new: 2.
           collection := SortedCollection sortBlock: [ :a :b |
               aString at: 1 put: a.
               bString at: 1 put: b.
               (UserLibrary lStrCmpi: aString withString: bString) <= 0 ].
           0 to: 255 do: [ :i | collection add: (i asCharacter)].
           collateTable := ByteArray new: 256.
           1 to: 256 do: [ :i |
               collateTable at: ((collection at: i) asInteger + 1) put: (i - 1)] "]".
    "Load table used by String primitive <= "
    VWVMLibrary loadCollateTable: collateTable.!

initCountryInfo
        "Private - Initialize the receiver with the
          country-dependent formatting information.
          These are setting from WIN.INI initialization
          file under [INTL] application heading.
          The default values are of United States."
    country := self queryNationalProfileInt: 'iCountry'.
    dateFormat := self queryNationalProfileInt: 'iDate'.
    dateFormat = nil
        ifTrue: [dateFormat := 0].
    dateSeparator := self queryNationalProfileString: 'sDate'.
    dateSeparator = nil
        ifTrue: [dateSeparator := '/'].
    timeFormat := self queryNationalProfileInt: 'iTime'.
    timeFormat = nil
        ifTrue: [timeFormat := 0].
    timeSeparator := self queryNationalProfileString: 'sTime'.
    timeSeparator = nil
        ifTrue: [timeSeparator := ':'].
    time1159 := self queryNationalProfileString: 's1159'.
    time1159 = nil
        ifTrue: [time1159 := 'AM'].
    time2359 := self queryNationalProfileString: 's2359'.
    time2359 = nil
        ifTrue: [time2359 := 'PM'].
    currencyFormat := self queryNationalProfileInt: 'iCurrency'.
    currencyFormat = nil
        ifTrue: [currencyFormat := 0].
    currency := self queryNationalProfileString: 'sCurrency'.
    currency = nil
        ifTrue: [currency := '$'].
    thousandsSeparator := self queryNationalProfileString: 'sThousand'.
    thousandsSeparator = nil
        ifTrue: [thousandsSeparator := ','].
    decimalPlace := self queryNationalProfileInt: 'iDigits'.
    decimalPlace = nil
        ifTrue: [decimalPlace := 2].
    decimalSeparator := self queryNationalProfileString: 'sDecimal'.
    decimalSeparator = nil
        ifTrue: [decimalSeparator := '.'].
    dataSeparator := self queryNationalProfileString: 'sList'.
    dataSeparator = nil
        ifTrue: [dataSeparator := ','].
"New ones unique to Windows"
    language := self queryNationalProfileString: 'sLanguage'.
    countryName := self queryNationalProfileString: 'sCountry'.
    countryName = nil
        ifTrue: [countryName := 'United States'].
    shortDateFormat := self queryNationalProfileString: 'sShortDate'.
    shortDateFormat = nil
        ifTrue: [shortDateFormat := 'M/d/yy'].
    longDateFormat := self queryNationalProfileString: 'sLongDate'.
    longDateFormat = nil
        ifTrue: [longDateFormat := 'dddd, MMMM dd, yyyy'].
    measurementSystem := self queryNationalProfileInt: 'iMeasure'.
    measurementSystem = nil
        ifTrue: [measurementSystem := 1].
    timeLeadZero := self queryNationalProfileInt: 'iTLZero'.
    timeLeadZero = nil
        ifTrue: [timeLeadZero := 0].
    currencyDigits := self queryNationalProfileInt: 'iCurrDigits'.
    currencyDigits = nil
        ifTrue: [currencyDigits := 2].
    negativeCurrencyFormat := self queryNationalProfileInt: 'iNegCurr'.
    negativeCurrencyFormat = nil
        ifTrue: [negativeCurrencyFormat := 0].
    decimalLeadZero := self queryNationalProfileInt: 'iLZero'.
    decimalLeadZero = nil
        ifTrue: [decimalLeadZero := 1].!
 
initialize
        "Private - Initialize the receiver."
    self initCountryInfo.
    self initCollateTable.
    self initCharacterPredicates.
    self setDBCSInfo.!
   
isAlphaNumeric: aCharacter
        "Answer true if aCharacter is a
         letter or digit, else answer false."
    ^((self isLetter: aCharacter) or: [self isDigit: aCharacter])!
  
isDigit: aCharacter
        "Answer true if aCharacter is a
         digit, else answer false."
    | anInteger |
    anInteger := aCharacter asInteger.
    ((anInteger > 0) and: [anInteger < 256])
        ifTrue: [ ^isDigit at: anInteger].
    ^false!
  
isDoubleByteCp
        "Answer whether the current national language is double-byte."
    ^isDoubleByteCp!

isLetter: aCharacter
        "Answer true if aCharacter is
         a letter, else answer false."
    | anInteger |
    anInteger := aCharacter asInteger.
    ((anInteger > 0) and: [anInteger < 256])
        ifTrue: [ ^isLetter at: anInteger].
    ^false!
 
isLowerCase: aCharacter
        "Answer true if aCharacter is a
         lower-case letter, else answer false."
    | anInteger |
    anInteger := aCharacter asInteger.
    ((anInteger > 0) and: [anInteger < 256])
        ifTrue: [^(allUpperCase at: anInteger) ~= aCharacter].
    ^false!

isUpperCase: aCharacter
        "Answer true if the receiver is a
         upper-case letter, else answer false."
    | anInteger |
    anInteger := aCharacter asInteger.
    ((anInteger > 0) and: [anInteger < 256])
        ifTrue: [^(allLowerCase at: anInteger) ~= aCharacter].
    ^false!
 
isTimeFormat12Hour
        "Answer whether the current system time format is 12-hour."
    ^timeFormat = 0!
   
language
        "Answer the current system value for language."
    ^language!
 
leadBytes
        " Answer the current leadBytes flag array."
    ^leadBytes!
 
longDateFormat
        "Answer the current system value for long date format."
    ^longDateFormat!
 
measurementSystem
        "Answer the current system value for measurement system.
         Answer 0 = metric
                      1 = english."
    ^measurementSystem!
 
negativeCurrencyFormat
        "Answer the current system value for negative currency format.
         Answer 0 = ($1)
                      1 = -$1
                      2 = $-1
                      3 = $1-
                      4 = (1$)
                      5 = -1$
                      6 = 1-$
                      7 = 1$-."
    ^negativeCurrencyFormat!

queryNationalProfileInt: aKeyName
        "Answer the integer value of key aKeyName in
        the [Intl] application section of the WIN.INI profile file.
        Answer nil if aKeyName cannot be found."
    | answer |
    answer := KernelLibrary getProfileInt: 'Intl' asParameter
        keyName: aKeyName asParameter
        default: -1.
    answer = -1
        ifTrue: [^nil]
        ifFalse: [^answer].!
   
queryNationalProfileString: aKeyName
        "Answer the string value of key aKeyName in
        the [Intl] application section of the WIN.INI profile file.
        Answer nil if aKeyName cannot be found."
    | aString result |
    result := KernelLibrary getProfileString: 'Intl' asParameter
        keyName: aKeyName asParameter
        default: '' asParameter
        returnedString: (aString := String new: 80)
        size: 80.
    result > 0
        ifTrue: [^(aString copyFrom: 1 to: result) asNormalizedString]
        ifFalse: [^nil].!
 
setDBCSInfo
        "Private - set DBCS state for current national language. "
    | flag |
    leadBytes := Array new: 255.  " indexed by code point value [1..255] "
    isDoubleByteCp := false.
    1 to: 255 do: [ :cp |
        flag := KernelLibrary isDBCSLeadByte: cp.
        flag ifTrue: [ isDoubleByteCp := true ].
        leadBytes at: cp put: flag].!
   
shortDateFormat
        "Answer the current system value for short date format."
    ^shortDateFormat!
  
string: aString1 isGreaterThan: aString2
         "Answer true if aString1 is after aString2
         in the current sort sequence, else answer false.
         The comparison is not case sensitive."
    ^(self compareStringi: aString1 withString: aString2) > 0!

string: aString1 isGreaterThanOrEqualTo: aString2
        "Answer true if aString1 is after or equal to aString2 
         in the current sort sequence, else answer false.
         The comparison is not case sensitive."
    ^(self compareStringi: aString1 withString: aString2) >= 0!
  
string: aString1 isLessThan: aString2
        "Answer true if aString1 is before aString2
        in the current sort sequence, else answer false.
        The comparison is not case sensitive."
    ^(self compareStringi: aString1 withString: aString2) < 0!
   
string: aString1 isLessThanOrEqualTo: aString2
        "Answer true if aString1 is before or equal to aString2
         in the current sort sequence, else answer false.
         The comparison is not case sensitive."
    ^(self compareStringi: aString1 withString: aString2) <= 0!
 
thousandsSeparator
        "Answer the current system value
        of the thousands separator."
    ^thousandsSeparator!
 
time1159
        "Answer the current system value 
        for time string describing AM."
    ^time1159!
   
time2359
        "Answer the current system value for 
        time string describing PM."
    ^time2359!
   
timeFormat
        "Answer the current system value for time format.
         Answer 0 = 12-hour clock
                      1 = 24-hour clock."
    ^timeFormat!
 
timeLeadZero
        "Answer the current system value for time lead zero.
         Answer 0 = no leading zero (9:15:24)
                      1 = leading zero (09:15:24)."
    ^timeLeadZero!

timeSeparator
        "Answer the current system value for time separator."
    ^timeSeparator! !
