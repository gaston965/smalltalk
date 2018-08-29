"Smalltalk code from Chapter 9 of the Smalltalk/V Tutorial"!


!Network methods !

connect: nodeA to: nodeB
        "Add a connection from nodeA to nodeB."
    (connections
        at: nodeA
        ifAbsent: [connections at: nodeA put: Set new] )
            add: nodeB.
    (connections
        at: nodeB
        ifAbsent: [connections at: nodeB put: Set new] )
            add: nodeA!

draw
        "Draw the network.  For each node, it draws
         all the arcs and then the node.  All the
         nodes visited are remembered to avoid double
         drawing."
    | visited pen |
    pen := (Window turtleWindow: 'Net') pen.
    pen erase.
    visited := Set new.
    pen drawRetainPicture: [
        connections keys do: [ :nodeA |
            visited add: nodeA.
            (connections at: nodeA) do: [ :nodeB |
                (visited includes: nodeB)
                      ifFalse: [
                        pen place: nodeA position;
                            goto: nodeB position] ].
             nodeA drawWith: pen] ]!

initialize
        "Initialize the connections to be empty."
    connections := Dictionary new!

pathFrom: nodeA to: nodeB avoiding: nodeSet
        "Answer a path of connections that connect nodeA
         to nodeB without going through the nodes in
         nodeSet.  This result is returned as a new
         network.  Answer nil if there is no path"
    | answer |
    nodeSet add: nodeA.
        (connections at: nodeA ifAbsent: [^nil]) do:
    [ :node |
        node = nodeB
            ifTrue: [
                ^Network new initialize
                     connect: nodeA to: node].
        (nodeSet includes: node)
            ifFalse: [
                answer := self
                    pathFrom: node
                    to: nodeB
                    avoiding: nodeSet.
                answer isNil
                    ifFalse: [
                        ^answer connect: nodeA to: node]]].
    ^nil!

printOn: aStream
        "Print a description of the receiver on aStream."
    connections keys asSortedCollection do: [ :node |
        node printOn: aStream.
        (connections at: node) asSortedCollection do:
            [ :neighbor |
            aStream
                cr;
                nextPutAll: ' >> '.
            neighbor printOn: aStream].
        aStream cr]! !
