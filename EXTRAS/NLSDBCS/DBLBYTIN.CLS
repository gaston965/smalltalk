
Inspector subclass: #DoubleByteStringInspector
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: '' !


!DoubleByteStringInspector class methods ! !



!DoubleByteStringInspector methods !
 
setInstList
        "Private - Initialize an OrderedCollection of
         instance variable names and/or numbers for
         the list pane."
    instList := OrderedCollection new: (self size + 1).
    instList add: 'self'.
    1 to: object size do: [ :index |
        instList add: index printString]! !
