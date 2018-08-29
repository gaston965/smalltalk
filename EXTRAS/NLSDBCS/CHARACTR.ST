
!Character methods !
  
< aCharacter
        "Answer true if the receiver occurs before aCharacter
         in the current sort sequence, else answer false."
    ^NationalLanguage character: self  isLessThan: aCharacter!
 
<= aCharacter
        "Answer true if the receiver occurs before or at the same
         position as aCharacter in the current sort sequence,
         else answer false."
    ^NationalLanguage character: self  isLessThanOrEqualTo: aCharacter!
  
> aCharacter
        "Answer true if the receiver occurs after aCharacter
         in the current sort sequence, else answer false."
    ^NationalLanguage character: self  isGreaterThan: aCharacter!
   
>= aCharacter
        "Answer true if the receiver occurs at the same position
         or after aCharacter in the current sort sequence,
         else answer false."
    ^NationalLanguage character: self  isGreaterThanOrEqualTo: aCharacter!
  

asLowerCase
        "Answer the lower case value of the receiver
         if it is a letter, else answer the receiver."
    ^NationalLanguage asLowerCase: self!
 
asUpperCase
        "Answer the upper case value of the receiver
         if it is a letter, else answer the receiver."
    ^NationalLanguage asUpperCase: self!
    
isDigit
        "Answer true if the receiver is in the range
         of characters from 0 to 9 or any other character
         as defined by the current system language, 
         else answer false."
    ^(asciiInteger > 47 and: [asciiInteger < 58])
        ifTrue: [true]
        ifFalse: [NationalLanguage isDigit: self].!

isLetter
        "Answer true if the receiver is in the range of
         of characters from a and z or in the range from
         A and Z or a letter as defined by the current
         system language, else answer false."
    ^((asciiInteger > 64 and: [asciiInteger < 91])
        or: [asciiInteger > 96 and: [asciiInteger < 123]])
        ifTrue: [true]
        ifFalse: [NationalLanguage isLetter: self].!
   
isLowerCase
        "Answer true if the receiver is a lower-case letter,
         else answer false."
    ^NationalLanguage isLowerCase: self!
   
isUpperCase
        "Answer true if the receiver is an upper-case letter,
         else answer false."
    ^NationalLanguage isUpperCase: self! !
