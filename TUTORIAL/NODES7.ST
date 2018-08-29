"Smalltalk code from Chapter 7 of the Smalltalk/V Tutorial"!
                          

! NetworkNode methods !

<= aNode
        "Answer true if receiver name less or equal to
         aNode name."
    ^name <= aNode name!

hash
        "Answer receiver's hash."
    ^name hash!

name
        "Answer receiver's name."
    ^name!

name: aString position: aPoint
        "Set the receiver's name and position."
    name := aString.
    position := aPoint!

printOn: aStream
        "Print a description of the receiver on aStream."
    aStream
        nextPutAll: 'Node(', name;
        space;
        nextPutAll: position printString;
        nextPut: $)! !

