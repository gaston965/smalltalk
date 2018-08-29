
StaticText subclass: #FormattedStaticText
  instanceVariableNames: 
    'acceptBlock formatedOutput '
  classVariableNames: ''
  poolDictionaries: '' !


!FormattedStaticText class methods ! !



!FormattedStaticText methods !
 
acceptBlock: aBlock
        "Set accept block to aBlock.  When FormattedStaticText
            gets a new value, aBlock is evaluated with the new
            value as the argument.  If the new value is accepted,
            aBlock should return the new value as formated output.
            If the new value is not accepted, aBlock should inform
            the user of the problem and just return the new value."

    acceptBlock := aBlock.!
  
contents: newValue
        "Set the String associated with this control."
    |aOutput|

    aOutput := self formatOutput: newValue.
    super contents: aOutput.

    "Must reset the value with newValue
      Because value was set with aOutput in superClass"
    label := newValue.!
 
formatAsDate
        "Sets the FormattedStaticText to format its contents
        as date."

    self acceptBlock:[ :input|
            FormattedEntryField
                formatDate: input].!
  
formatAsDollar
        "Sets the FormattedStaticText to format its contents
        as dollar currency."

    self acceptBlock:[ :input|
            FormattedEntryField
                formatDollar: input].!
   
formatAsPhoneNumber
        "Sets the FormattedStaticText to format its contents
        as phone number."

    self acceptBlock:[ :input|
            FormattedEntryField
                formatPhoneNumber: input].!

formatedOutput
        "Answers formated output string of the FormattedStaticText."

    formatedOutput notNil
        ifTrue:[ ^ formatedOutput].
    ^ label!

formatOutput: newValue
        "Private - Answers the formated output of newValue."
    |result|

    formatedOutput := newValue.
    acceptBlock notNil
        ifTrue: [formatedOutput := acceptBlock value: newValue].
    ^ formatedOutput! !
