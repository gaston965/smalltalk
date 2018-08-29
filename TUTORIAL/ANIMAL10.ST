"Smalltalk code from Chapter 10 of the Smalltalk/V Tutorial"  !

!Animal methods !

answer: aString
        "Display a message for the receiver animal, consisting
        of the animal's class name and name preceding
         aString."
    habitat browser answer:  self class name, ' ', name, ': ', aString ! 

color
        "Answer the receiver's color."
    ^color!

habitat: aHabitat
         "Change habitat to aHabitat"
     habitat := aHabitat!

learn: aString action: aBlock
         "Add a pattern of the words in aString to the
         receivers knowledge.  The action to perform
         when the pattern is matched is aBlock."
     | words pattern |
     knowledge isNil
         ifTrue: [knowledge := Dictionary new].
     words := aString asLowerCase asArrayOfSubstrings.
     pattern := Pattern new:
         (Array with: name asLowerCase), words.
     pattern matchBlock: aBlock.
     knowledge at: words put: pattern!

name
        "Answer name."
    ^name!

name: aString
        "Change the receiver animal's name to aString."
    name := aString!

name: aString picture: images color: aColor
        "Initialize the receiver's name, pictures,
         and color."
    name := aString.
    color := aColor.
    picture :=AnimatedObject frames: images.
    picture color: aColor!

picture
        "Answer the receiver's array of pictures."
    ^picture!

reactTo: aWord
         "Send a word to every pattern in knowledge."
     knowledge isNil
         ifTrue: [^self].
     knowledge do: [:pattern | pattern match: aWord]!

reset
         "Reset all patterns in knowledge"
     knowledge isNil
         ifTrue: [^self].
     knowledge do: [:pattern | pattern reset]!

talk
        "Display a message that the receiver can't talk."
    self answer: 'I can''t talk'! !

!Parrot methods !

talk
        "Display a message containing the receiver
         parrot's vocabulary."
    self answer: vocabulary!

vocabulary: aString
        "Change the receiver parrot's vocabulary
         to aString."
    vocabulary := aString! !

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

bounce
        "bounce for distance." 
    | distance |
    distance := habitat script peek asInteger.
    self answer: 'I am bouncing ',
        distance printString,
        ' feet'.
    picture
        speed: topSpeed;
        bouncer;
        go: distance!

direction
    | anAngle |
    anAngle := habitat script peek asInteger.
    self answer: 'My direction is now ',
        anAngle printString,
        ' degrees'.
    picture
        direction: anAngle!

home
    self answer: 'I am coming home'.
    picture
       position: 0@0!

run
        "Run for distance."  
    | distance |
    distance := habitat script peek asInteger.
    self answer: 'I am running ',
        distance printString,
        ' feet'.
    picture
        speed: topSpeed;
        go: distance // 10!

talk
        "Have the receiver dog talk by barking; unless
         barksAlot is nil, in which case the superclass
         can decide how to talk."
    barksAlot isNil
        ifTrue: [super talk]
        ifFalse: [self bark]!

topSpeed
        "Set speed at miles per hour."
    | speed |
    speed := habitat script peek asInteger.
    topSpeed := speed.
    self answer: 'My top speed is now ', speed printString!

turn
        "Turn direction with anAngle." 
    | anAngle|
    anAngle := habitat script peek asInteger.   
    self answer: 'I am turning ',
        anAngle printString,
        ' degrees'.
    picture turn: anAngle!

walk
        "Walk for distance." 
    | distance |
    distance := habitat script peek asInteger.
    self answer: 'I am walking ',
        distance printString ,
        ' feet'.
    picture
        speed:  topSpeed // 2;
        go: distance // 10! !
                                                

!AnimalHabitat methods!

add: anAnimal
         "Add anAnimal as an inhabitant of the receiver.
         Notify anAnimal of its new habitat."
     animals isNil
         ifTrue: [animals := Set new].
     animals add: anAnimal.
     anAnimal habitat: self!

animals
        "Return animals in habitat"
    ^animals!

play
         "Play the script to all of the animals."
     | word |
     script reset.
     animals do: [ :animal | animal reset ].
     [script atEnd]
         whileFalse: [
             word := script next asLowerCase.
             animals do: [ :animal | animal reactTo: word ] ]!

script
        "Return the script for the habitat"
    ^script ! 

script: aString
         "Change script to a stream on the
         words in aString."
    | stream word |
    scriptString := aString.
    stream := ReadStream on: aString.
    script := ReadWriteStream on: Array new.
    [ ( word := stream nextWord) isNil ]
        whileFalse: [
            script nextPut: word ]!

scriptString
         "Answer the script for the habitat window."
    ^scriptString! !   
                
                                                                         
