NetworkNode variableSubclass: #ComEvent
  instanceVariableNames:
    'info active'
  classVariableNames: ''
  poolDictionaries: 'SalesStrategy WinConstants ColorConstants' !

!ComEvent class methods !

connect: nodeName to: anotherNodeName
        "Connect the two nodes in StratNodes within the
         network in StratNet."
    StratNet
        connect: (StratNodes at: nodeName)
        to: (StratNodes at: anotherNodeName)! !

!ComEvent methods !

active: aBoolean
        "Indicate whether the event is active or not.
         An active event is drawn highlighted."
    active := aBoolean!

drawWith: pen
        "Draw the receiver node with a
         circle around its name."
    active ifFalse: [^super drawWith: pen].
    pen
        foreColor: ClrRed;
        backColor: ClrLightgray.
    super drawWith: pen.
    pen
        foreColor: ClrNeutral;
        backColor: ClrBackground!

info
        "Return the info instance variable for the receiver."
    ^info!

initialize
        "Initialize the dictionary data record of information about the
        communication events to be empty."   
    active := false.
    info := Dictionary new.
    info
        at: '1.Strategy' put: 'NYS';                     "not yet specified"
        at: '2.Type' put: 'L, P or F ';
        at: '3.Message' put: 'Type your message here.';
        at: '4.Next Step' put: 'NYS';
        at: '5.Days Til NS' put: 'NYS';
        at: '6.MTD' put: 0;
        at: '7.YTD' put: 0!

message
        "Receiver Event node returns 3rd array element, message field."
    ^info at: '3.Message'!

nameAndDateToday
        "Receiver Event node returns its name and today's date."
    ^(name, ': ', (Date today printString))!

name: aString position: aPoint
        "Set the receivers name and position."
    super
        name: aString
        position: aPoint x @ (aPoint y) truncated.
    StratNodes at: aString put: self! !

