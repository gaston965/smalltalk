
IdentityDictionary subclass: #LargeIdentityDictionary
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''  !


!LargeIdentityDictionary class methods !
 
initialSize
        "Private - Answer the initial number of elements
         that a new instance of LargeIdentityDictionary
         contains."
    ^1021!
 
new: anInteger
        "Private - Answer an IdentityDictionary
         capable of containing anInteger
         number of elements."
    ^(self basicNew initialize: anInteger * 2)! !



!LargeIdentityDictionary methods !
   
findKeyIndex: key
        "Private - Answer the index position of the
         key/value pair in the receiver whose key equals
         aKey or the index of the first empty position
         where such an pair would be stored."
    | index lastIndex |
    lastIndex := contents size.
    index := self indexForKey: key.
    [key == (contents at: index)]
        whileFalse: [
            (contents at: index) isNil
                ifTrue: [^index].
            (index := index + 2) > lastIndex
                ifTrue: [ "index wraparound"
                    index := 1]].
    ^index!
 
indexForKey: key
        " Private - hash key to index. "
    ^((key basicHash) \\ (contents size // 2)) * 2 + 1! !
