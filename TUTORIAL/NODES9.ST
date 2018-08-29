"Smalltalk code from Chapter 9 of the Smalltalk/V Tutorial"!


!NetworkNode methods !

<= aNode
        "Answer true if receiver name less or equal to
         aNode name."
    ^name <= aNode name!

drawWith: aPen
        "Draw the receiver node with a
         circle around its name."
    | major minor |
    major := (SysFont stringWidth: name) + 16 // 2.
    minor := SysFont height + 16 // 2.
    aPen
        setTextAlign: TaTop;
        place: position;
        ellipseFilled: major minor: minor;
        centerText: name!

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

position
        "Answer the position of
         the receiver node."
    ^position!

printOn: aStream
        "Print a description of the receiver on aStream."
    aStream
        nextPutAll: 'Node(', name;
        space;
        nextPutAll: position printString;
        nextPut: $)! !
