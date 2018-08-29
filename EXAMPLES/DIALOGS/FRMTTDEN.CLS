
EntryField subclass: #FormattedEntryField
  instanceVariableNames: 
    'strokeBlock acceptBlock formatedOutput '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants VirtualKeyConstants '  !


!FormattedEntryField class methods !
 
formatDate: input
        "Answer the input as a formated date.
            Format is: MM/DD/YY"
    | formatedOutput |

    formatedOutput := input.
    input size =6
        ifTrue:[
            formatedOutput := (input copyFrom: 1 to: 2) ,
                                        '/', (input copyFrom: 3 to: 4),
                                        '/', (input copyFrom: 5 to: 6).
            "Check if the date is a valid date"
            Date fromString: formatedOutput]
        ifFalse:[input size = 0
            ifTrue:[]
            ifFalse:[
                    MessageBox message: 'Invalid Date']].
    ^ formatedOutput!

formatDollar: input
        "Answer the input as a formated dollar currency.
            Format is: $ 999,999.99"
    | formatedOutput pos bNeg|

    input class = String ifFalse:[
        ^ String new].
    formatedOutput := (input asFloat roundTo: 0.01) printString.

    (formatedOutput at: 1) = $- ifTrue:[
        bNeg := true.
        formatedOutput :=
            formatedOutput copyFrom: 2 to: formatedOutput size]
    ifFalse:[
        bNeg := false].

    pos := (formatedOutput findFirst:[:ch| ch = $. ]) - 3.

    pos > 1 ifTrue:[
        pos to: 2 by: -3 do:[:i|
            formatedOutput := (formatedOutput copyFrom: 1 to: i - 1),
                                          ',', (formatedOutput copyFrom: i  to:
                                                        formatedOutput size)]].
    bNeg ifTrue:[
        formatedOutput := '- $ ', formatedOutput]
    ifFalse:[
        formatedOutput := '$ ', formatedOutput].

    "If required, add an extra .00"
    (formatedOutput findFirst:[:ch| ch = $. ])
        = (formatedOutput size - 1) ifTrue:[
            formatedOutput := formatedOutput, '0'].
    ^ formatedOutput!
 
formatPhoneNumber: input
        "Answer the input as a formated phone number.
            Format is: (999) 999-9999 or 999-9999."
    | formatedOutput focusedWindow|

    formatedOutput := input.
    input size = 7
        ifTrue:[
            formatedOutput := (input copyFrom: 1 to: 3) ,
                                        '-', (input copyFrom: 4 to: 7)]
        ifFalse:[
            input size = 10
                ifTrue:[
                    formatedOutput := '(', (input copyFrom: 1 to: 3),
                            ') ', (input copyFrom: 4 to: 6),
                            '-', (input copyFrom: 7 to: 10)]
                ifFalse:[ input size = 0
                    ifTrue:[]
                    ifFalse:[
                        focusedWindow:= UserLibrary getFocus.
                        MessageBox message: 'Invalid Phone Number'.
                        UserLibrary showCaret: focusedWindow]]].
    ^ formatedOutput!
   
validateAlpha: input withChar: ch position: pos
        "Validates whether ch is a acceptable alpha character
            ( $A - $Z, $a - $z or space) in input string at positon
            pos.  Answers true if it is acceptable
            else false."

    (ch isLetter
            or: [ ch asciiValue = SpaceKey] )
        ifTrue:[
            ^true].
    ^ false!
   
validateDollar: input withChar: ch position: pos
        "Validates whether ch is a acceptable character for a
            dollar currency in input string at position pos.
            Answers true if it is acceptable
            else false."
    |decimalPos|

    (self
        validateFloat: input
        withChar: ch
        position: pos)
        ifTrue:[
            decimalPos := input indexOf: $. ifAbsent:[ input size].
            (pos > (decimalPos + 2))
                ifTrue:[
                    ^ false]]
        ifFalse:[
            ^ false].
    ^ true!
   
validateFloat: input withChar: ch position: pos
        "Validates whether ch is a acceptable character for a
            Float in input string at position pos.
            Answers true if it is acceptable
            else false."

    (ch = $. and: [(input includes: $.) not] )
        ifTrue:[ ^ true].

    ^self
        validateInteger: input
        withChar: ch
        position: pos!
  
validateInteger: input withChar: ch position: pos
        "Validates whether ch is a acceptable character for a
            Integer in input string at position pos.
            Answers true if it is acceptable
            else false."

    ((ch = $- or: [ch = $+]) and:[ pos = 1])
       ifTrue:[^true].

    ^self
        validatePositiveInteger: input
        withChar: ch
        position: pos!
   
validatePositiveInteger: input withChar: ch position: pos
        "Validates whether ch is a acceptable character for a
            Positive Integer in input string at position pos.
            Answers true if it is acceptable
            else false."

    ch isDigit
         ifTrue:[^true].
    ^ false! !



!FormattedEntryField methods !
   
acceptAlpha
        "Sets the FormattedEntryField to only accept alpha
            characters (A - Z, a- z)."

    self strokeBlock: [:ch|
        self class
            validateAlpha: self windowText
            withChar: ch
            position: self getSelection left].!
   
acceptBlock: aBlock
        "Set accept block to aBlock.  When FormattedEntryField
            get a new value, aBlock is evaluated with the new
            value as the argument.  If the new value is accepted,
            aBlock should return the new value as formated output.
            If the new value is not accepted, aBlock should inform
            the user of the problem and just return the new value."

    acceptBlock := aBlock.!
   
acceptDate
        "Sets the FormattedEntryField to only accept date.
            (6 digit positive integer.)
            The entered value will be shown in date format."

    self strokeBlock: [:ch|
        self class
            validatePositiveInteger: self windowText
            withChar: ch
            position: self getSelection left].
    self acceptBlock:[ :input|
            self class
                formatDate: input].
    self setTextLimit: 6.!
   
acceptDollar
        "Sets the FormattedEntryField to only accept dollar currency.
            (a floating point number with two decimal places.)
            The entered value will be shown in dollar currency format."

    self strokeBlock: [:ch|
        self class
            validateDollar: self windowText
            withChar: ch
            position: self getSelection left].
    self acceptBlock:[ :input|
        self class formatDollar: input].!
   
acceptFloat
        "Sets the FormattedEntryField to only accept floating point
            number."

    self strokeBlock: [:ch|
        self class
            validateFloat: self windowText
            withChar: ch
            position: self getSelection left].!

acceptInteger
        "Sets the FormattedEntryField to only accept integer."

    self strokeBlock: [:ch|
        self class
            validateInteger: self windowText
            withChar: ch
            position: self getSelection left].!
   
acceptPhoneNumber
        "Sets the FormattedEntryField to only accept phone number.
           (either a 7 or 10 digit number.)
            The entered value will be shown in phone number format. "

    self strokeBlock: [:ch|
        self class
            validatePositiveInteger: self windowText
            withChar: ch
            position: self getSelection left].
    self acceptBlock:[ :input|
        self class formatPhoneNumber: input].
    self setTextLimit: 10.!

acceptPositiveInteger
        "Sets the FormattedEntryField to only accept positive integer."

    self strokeBlock: [:ch|
        self class
            validatePositiveInteger: self windowText
            withChar: ch
            position: self getSelection left].!
  
contents
        "Answer a string containing the text of the item."

         "Note: Don't want to get string from entry field
         because it might contain formated output."

    ^ value!
  
contents: input
        "Set the String associated with this control."
    |aOutput|

    aOutput := self formatOutput: input.
    super contents: aOutput.

    "Must reset the value with input
      Because value was set with aOutput in superClass"
    value := input.!
 
formatedOutput
        "Answers formated output string of the FormattedEntryField."

    formatedOutput notNil
        ifTrue:[ ^ formatedOutput].
    ^ value.!
   
formatOutput: input
        "Private - Answers the formated output of input."
    |result|

    formatedOutput := input.
    acceptBlock notNil
        ifTrue: [formatedOutput := acceptBlock value: input].
    ^ formatedOutput!
  
strokeBlock: aBlock
        "Set stroke block to aBlock.  For each key stroke entered,
            aBlock is evaluated with a Character as the argument.
            If the character is accepted aBlock should return true,
            other wise it should return false."

    strokeBlock := aBlock.!
 
validateCharacter: char
        "Private - Validate the character by applying char to
            acceptBlock.
            Returns true if the character char is accepted.
            Returns false if not."

    (char asciiValue =  BackspaceKey)
        ifTrue:[ ^ true].

    strokeBlock notNil
        ifTrue: [(strokeBlock value: char)
                ifTrue:[ ^ true]
                ifFalse:[
                    UserLibrary messageBeep: 0.
                    ^ false]]
        ifFalse:[ ^true]!
 
wmChar: wParam with: lParam
        "Private - Only allow valid characters to get through."
    (self validateCharacter: wParam asCharacter)
        ifTrue:[
            value := self windowText.
            ^ nil].
    ^ false!
  
wmKillfocus: wParam with: lParam
        "Private - format the output before loosing focus"
    super wmKillfocus: wParam with: lParam.
    self contents: self windowText.
    ^ nil!
  
wmLbuttondown: wParam with: lParam
        "Private - Set the field with input value instead of
                    formatedOutput"

    super wmLbuttondown: wParam with: lParam.
    self setWindowText: value.
    ^ nil!
  
wmSetfocus: wParam with: lParam
        "Private - Set the field with input string instead of
            formated output."

    super wmSetfocus: wParam with: lParam.
    self windowText ~= value ifTrue:[
        self setWindowText: value.
        self setSelectionFrom:0 to: 16r8000].
    ^ nil! !
