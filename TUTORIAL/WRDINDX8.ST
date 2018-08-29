"Smalltalk code from Chapter 8 of the Smalltalk/V Tutorial"!


Object subclass: #WordIndex
  instanceVariableNames: 
    'documents words '
  classVariableNames: ''
  poolDictionaries: '' !

!WordIndex class methods ! !


!WordIndex methods !

addDocument: pathName
       "Add all words in document described by
         pathName string to the words dictionary."
    | word wordStream |
    (documents includes: pathName)
        ifTrue: [self removeDocument: pathName].
    wordStream := File pathName: pathName.
    documents add: pathName.
    [ (word := wordStream nextWord) == nil]
        whileFalse: [
            self addWord: word asLowerCase to: pathName].
    wordStream close!

addWord: wordString for: pathName
        "Add wordString to words dictionary for
        document described by pathName."
    (words at: wordString) add: pathName!

initialize
        "Initialize a new empty WordIndex."
    documents := Set new.
    words := Dictionary new!

locateDocuments: queryWords
        "Answer an array of the pathNames for
        all documents which contain all words
        in queryWords."
    | answer bag |
    bag := Bag new.
    answer := Set new.
    queryWords do: [ :word |
        bag addAll:
             (documents at: word ifAbsent: [ #( ) ] ) ].
    bag asSet do: [ :document |
        queryWords size =
            (bag occurrencesOf: document)
                ifTrue: [ answer add: document ] ].
    ^answer asSortedCollection asArray!

removeDocument: pathName
        "Remove pathName string describing a
        document from the words dictionary."
    words do: [ :docs | docs remove: pathName].
    self removeUnusedWords!

removeUnusedWords
        "Remove all words which have empty
        document collection."
    | newWords |
    newWords := Dictionary new.
    words associationsDo: [ :anAssoc |
        anAssoc value isEmpty
            ifFalse: [ newWords add: anAssoc ] ].
    words := newWords! !
