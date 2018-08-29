"Smalltalk code from Chapter 7 of the Smalltalk/V Tutorial"!


! AnimalHabitat methods !
add: anAnimal
         "Add anAnimal as an inhabitant of the receiver.
         Notify anAnimal of its new habitat."
     animals isNil
         ifTrue: [animals := Set new].
     animals add: anAnimal.
     anAnimal habitat: self! 

play
         "Play the Script to all of the animals."
     | word |
     Script reset.
     animals do: [ :animal | animal reset ].
     [Script atEnd]
         whileFalse: [
             word := Script next asLowerCase.
             animals do: [ :animal | animal reactTo: word ] ]!

script: aString
         "Change Script to a stream on the
         words in aString."
    | stream word |      
    stream := ReadStream on: aString.
    Script := ReadWriteStream on: Array new.
    [(word := stream nextWord) isNil]
        whileFalse: [
            Script nextPut: word]! !  
