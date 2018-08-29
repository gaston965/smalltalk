
TextWindow subclass: #DDETestClient
  instanceVariableNames: 
    'dde poked '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants ' !


!DDETestClient class methods ! !



!DDETestClient methods !
 
close
    dde notNil ifTrue:
        [dde terminate].
    super close.!
  
close: aPane
    "Close the window and terminate DDE"

    dde notNil ifTrue:
        [dde terminate].
    super close.!
   
dde

    "Answers the current DDE instance variable."

    ^dde.!
   
initiate: application topic: topic

    "Initiate DDE session"

    (dde := DDEClient newClient: self
                   application: application
                   topic: topic) isNil ifTrue:
    [
        MessageBox titled: 'warning'  withText: 'Couldn''t Initiate with server' style: MbOk|MbIconexclamation.
        ^false
    ]!
  
item: item

    "The server has updated a warm linked item"

    self show: 'data: ';show: item; cr.!
   
item: item integer: integer

    "The server has updated a hot linked item."

    self show: 'data: ';show: item; show: '    '; show: integer printString; cr.!
 
item: item string: string

    "The server has updated a hot linked item."

    self show: 'data: ';show: item; show: '    '; show: string; cr.!

open
        "comment"
    super openOn: 'DDETestClient'.

    self initiate: 'Dashboard' topic:'Chevy'.
    dde notNil ifTrue:
    [

        dde hotLinkItem: 'mph' class: String selector:#item:string:.
        dde hotLinkItem: 'rpm' class: String selector:#item:string:.
        dde hotLinkItem: 'oil' class: String selector:#item:string:.


    ].!

openDashboard

        "Open a DDE Dashboard client"

    super openOn: 'DDETestClient'.
    self mainView when:#close perform:#close:.

    self initiate: 'Dashboard' topic:'Chevy'.
    dde notNil ifTrue:
    [

        dde hotLinkItem: 'mph' class: String selector:#item:string:.
        dde hotLinkItem: 'rpm' class: String selector:#item:string:.
        dde hotLinkItem: 'oil' class: String selector:#item:string:.


    ].!
   
openExcel

        "Open a DDE Excel client"


    super openOn: 'DDETestClient'.
    self mainView when:#close perform:#close:.

    self initiate: 'Excel' topic:'Sheet1'.
    dde notNil ifTrue:
    [

        dde hotLinkItem: 'R1C1' class: String selector:#item:string:.
        dde hotLinkItem: 'R1C2' class: Integer selector:#item:integer:.
        dde warmLinkItem: 'R1C3' class: String selector:#item:

    ].!

openTestServer

        "Open a DDE TestServer client"


    super openOn: 'DDETestClient'.
    self mainView when:#close perform:#close:.

    self initiate: 'DDETestServer' topic:'Test'.
    dde notNil ifTrue:
    [

        dde hotLinkItem: 'A' class: String selector:#item:string:.
        dde hotLinkItem: 'B' class: String selector:#item:string:.
        dde hotLinkItem: 'C' class: String selector:#item:string:.
        dde executeCommand: 'test'.
        dde pokeItem: 'X' object:'An object from a client'.
    ].! !
