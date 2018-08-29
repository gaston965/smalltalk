"
Changes to allow double-byte characters in
class names, selectors, local and global 
variable names, etc....

NationalLanguageSupport>>isUpperCase - let char value > 255 be upper-case
NationalLanguageSupport>>isLetter  - let char value > 255 be letters

Others:
NationalLanguageSupport>>character:isGreaterThan: - allow db characters
NationalLanguageSupport>>character:isGreaterThanOrEqualTo: - allow db characters
NationalLanguageSupport>>character:isLessThan: - allow db characters
NationalLanguageSupport>>character:isLessThanOrEqualTo: - allow db characters
"!


!NationalLanguageSupport methods !

isUpperCase: aCharacter
        "Answer true if aCharacter is a
         upper-case letter, else answer false."
    | anInteger |
    anInteger := aCharacter asInteger.
    (anInteger > 0 and: [aCharacter ~= DoubleByteSpace])
        ifFalse: [^false].
    (anInteger < 256)
        ifTrue: [^(allLowerCase at: anInteger) ~= aCharacter].
    ^true  "All double-byte characters are upper-case letters."!

isLetter: aCharacter
        "Answer true if aCharacter is a
         a letter, else answer false."
    | anInteger |
    anInteger := aCharacter asInteger.
    (anInteger > 0 and: [aCharacter ~= DoubleByteSpace])
        ifFalse: [^false].
    (anInteger < 256)
        ifTrue: [ ^isLetter at: anInteger].
    ^true  "All double-byte characters are upper-case letters."! 

character: aCharacter1 isGreaterThan: aCharacter2
        "Answer true if the aCharacter1 is greater
         than aCharacter2, else answer false."
    (aCharacter1 isDoubleByte or: [aCharacter2 isDoubleByte])
        ifTrue: [
            ^self string: (String with: aCharacter1)
            isGreaterThan: (String with: aCharacter2)]
        ifFalse: [
            ^(collateTable at: (aCharacter1 asInteger + 1)) >
            (collateTable at: (aCharacter2 asInteger + 1))]!

character: aCharacter1 isGreaterThanOrEqualTo: aCharacter2
        "Answer true if the aCharacter1 is greater than
         or equal to aCharacter2, else answer false."
    (aCharacter1 isDoubleByte or: [aCharacter2 isDoubleByte])
        ifTrue: [
            ^self string: (String with: aCharacter1)
            isGreaterThanOrEqualTo: (String with: aCharacter2)]
        ifFalse: [
            ^(collateTable at: (aCharacter1 asInteger + 1)) >=
            (collateTable at: (aCharacter2 asInteger + 1))]!

character: aCharacter1 isLessThan: aCharacter2
        "Answer true if the aCharacter1 is less than
         aCharacter2, else answer false."
    (aCharacter1 isDoubleByte or: [aCharacter2 isDoubleByte])
        ifTrue: [
            ^self string: (String with: aCharacter1)
            isLessThan: (String with: aCharacter2)]
        ifFalse: [
            ^(collateTable at: (aCharacter1 asInteger + 1)) <
            (collateTable at: (aCharacter2 asInteger + 1))]!

character: aCharacter1 isLessThanOrEqualTo: aCharacter2
        "Answer true if the aCharacter1 is less than
         or equal to aCharacter2, else answer false."
    (aCharacter1 isDoubleByte or: [aCharacter2 isDoubleByte])
        ifTrue: [
            ^self string: (String with: aCharacter1)
            isGreaterThanOrEqualTo: (String with: aCharacter2)]
        ifFalse: [
            ^(collateTable at: (aCharacter1 asInteger + 1)) <=
            (collateTable at: (aCharacter2 asInteger + 1))]! !



