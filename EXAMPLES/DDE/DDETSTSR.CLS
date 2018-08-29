
TextWindow subclass: #DDETestServer
  instanceVariableNames: 
    'dde '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants '   !


!DDETestServer class methods ! !



!DDETestServer methods !
 
close
    dde terminate.
    super close.!

close: aPane

    "Close the window and terminate DDE session"

    dde terminate.
    super close.!
   
dde

    "Answer current DDE session"

    ^dde!

ddeExecuteCommand: command

    "A client has requested to execute a command"

    self show:'Execute command '; show: command; cr.
    ^ true!

ddeExportItem: item

    "a Client is asking for this item.
     if the server knows about this item then it should export it
         and return true.
     else it should return false."

    self show:'ExportItem '; show: item; cr.

"    dde addExportedItem: item object: 'object'."

    ^ false.!
   
ddePokeItem: item object: object

    "A client has submitted an item"

    (object class ~= String) ifTrue:
    [
        self show:'PokeItem '; show: item; show: '   '; show: object printString; cr.
    ]
    ifFalse:
    [
        self show:'PokeItem '; show: item; show: '   '; show: object; show:'*size:'; show: object size printString; cr.
    ].
    ^ true!

initDde

    "Start a DDE server and export items"

    dde := DDEServer newServer: self application:'DDETestServer' topic:'Test'.
    dde notNil ifTrue:
    [
        dde addExportedItem: 'A' object:'Here is A'.
        dde addExportedItem: 'B' object:'Here is B'.
        dde addExportedItem: 'C' object:'Here is C'.
    ]!
 
open

        "Open DDETestServer"

    super openOn: 'DDETestServer'.
    self mainView when:#close perform:#close:.

    self initDde.! !
