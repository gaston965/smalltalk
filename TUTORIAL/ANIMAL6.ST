"Smalltalk code from Chapter 6 of the Smalltalk/V Tutorial"!

Object subclass: #Animal
  instanceVariableNames: 
    'name knowledge habitat topSpeed color picture '
  classVariableNames: ''
  poolDictionaries: '' !

!Animal methods !

answer: aString
        "Display a message for the receiver animal
         on the Transcript window, consisting
         of the animal's class name and name preceding
         aString."
    Transcript nextPutAll:
        self class name, ' ', name, ': ', aString;
        cr!
 
name: aString
        "Change the receiver animal's name to aString."
    name := aString!

talk
        "Display a message that the receiver can't talk."
    self answer: 'I can''t talk'! !

Animal subclass: #Bird
  instanceVariableNames: 'flying '
  classVariableNames: ''
  poolDictionaries: '' !

Bird subclass: #Parrot
  instanceVariableNames: 'vocabulary '
  classVariableNames: ''
  poolDictionaries: '' !

!Parrot methods !

talk
        "Display a message containing the receiver
         parrot's vocabulary."
    self answer: vocabulary!

vocabulary: aString
        "Change the receiver parrot's vocabulary
         to aString."
    vocabulary := aString! !

Bird subclass: #Penguin
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: '' !

Animal subclass: #Mammal
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: '' !

Mammal subclass: #Dog
  instanceVariableNames: 'barksAlot '
  classVariableNames: ''
  poolDictionaries: '' !

!Dog methods !

bark
        "Have the receiver dog bark by ringing the bell
         and displaying a bark message."
    Terminal bell.
    barksAlot
        ifTrue: [self answer: 'Bow Wow, Bow Wow, Bow Wow!!']
        ifFalse: [self answer: 'Woof']!
         
beNoisy
        "Change the status of the receiver dog to noisy."
    barksAlot := true.
    self answer: 'I''ll bark a lot'!

beQuiet
        "Change the status of the receiver dog to quiet."
    barksAlot := false.
    self answer: 'I won''t bark much'!

talk
        "Have the receiver dog talk by barking unless
         barksAlot is nil, in which case the superclass
         can decide how to talk."
    barksAlot isNil
        ifTrue: [super talk]
        ifFalse: [self bark]! !

Mammal subclass: #Whale
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: '' !


