


!String methods !
   
<= aString
        "Answer true if the receiver is before or equal to
         aString in the current sort sequence, else answer false.
         The comparison is not case sensitive."
"    <primitive: 56>
"    (self class = aString class) ifTrue: [
        ^(NationalLanguage string: self isLessThanOrEqualTo: aString)].
    ^self primitiveFailed! !



