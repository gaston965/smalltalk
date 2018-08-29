"Smalltalk code from Chapter 7 of the Smalltalk/V Tutorial"!

"Check if Animal classes are installed"!
(Smalltalk includesKey: #Animal)
    ifFalse: [
        (File pathName: 'tutorial\animal6.st') fileIn; close]!

! Animal methods !
habitat: aHabitat
         "Change habitat to aHabitat"
     habitat := aHabitat!

learn: aString action: aBlock
         "Add a pattern of the words in aString to the
         receiver's knowledge.  The action to perform
         when the pattern is matched is aBlock."
     | words pattern |
     knowledge isNil
         ifTrue: [knowledge := Dictionary new].
     words := aString asLowerCase asArrayOfSubstrings.
     pattern := Pattern new:
         (Array with: name asLowerCase), words.
     pattern matchBlock: aBlock.
     knowledge at: words put: pattern!

reactTo: aWord
         "Send a word to every pattern in knowledge."
     knowledge isNil
         ifTrue: [^self].
     knowledge do: [:pattern | pattern match: aWord]!

reset
         "Reset all patterns in knowledge"
     knowledge isNil
         ifTrue: [^self].
     knowledge do: [:pattern | pattern reset]! !

