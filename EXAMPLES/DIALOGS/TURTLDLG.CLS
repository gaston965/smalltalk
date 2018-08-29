
WindowDialog subclass: #TurtleDialog
  instanceVariableNames: 
    'pen '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants '  !


!TurtleDialog class methods ! !



!TurtleDialog methods !
   
circle: aButton
        "Private - Circle button pushed."
    |value|

    value := (self paneAt: 'circleEntry')contents asInteger.
    pen circle: value.!

clear: aButton
        "Private - clear button pushed."
    pen erase!

close: aButton
        "Private - Close button pushed, close the window."
    Smalltalk isRunTime
        ifTrue: [
            (MessageBox confirm: 'Are you sure you want to exit?')
                ifTrue: [self close. ^Smalltalk exit] ifFalse: [^self]]
        ifFalse:[^self close].!

dir: aButton
        "Private - dir button pushed."
    |value|

    value := (self paneAt: 'dirEntry')contents asInteger.
    pen direction: value.!
  
go: aButton
        "Private - Go button pushed."
    |value|

    value := (self paneAt: 'goEntry') contents asInteger.
    pen go: value.!
   
home: aButton
        "Private - Home button pushed."

    pen home.!

initWindowSize
        "Private - Answer the window size."
    ^(67 @ 21) * WindowDialog unitMultiplier!
  
mandala: aButton
        "Private - mandala button pushed."
    |value|

    value := (self paneAt: 'mandalaEntry')contents asInteger.
    pen mandala: 15 diameter: value.!
   
open
        "Open a Turtle Dialog box"
    | lineHeight charWidth charHeight graphPane|

    self
        labelWithoutPrefix: 'Turtle Graphics Dialog';
        when: #close perform: #close:;
        style:
            WsOverlappedwindow |
            WsVisible |
            DsNoidlemsg.

    lineHeight := WindowDialog entryHeight.
    charHeight := WindowDialog charHeight.
    charWidth := WindowDialog charWidth.


    self addSubpane:
        (graphPane :=GraphPane new
            style:
                WsBorder |
                WsChild   |
                WsVisible |
                WsClipsiblings;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth *1) @ (lineHeight *1) asInteger
                    extent: (charWidth * 40) @ (lineHeight * 10) ] ).

    self addSubpane:
        (Button new
            contents: 'Home';
            pushButton;
            when: #clicked perform: #home:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 44) @ (lineHeight *1)
                    extent: (charWidth * 8) @ lineHeight ] ).

    self addSubpane:
        (Button new
            contents: 'Clear';
            pushButton;
            when: #clicked perform: #clear:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 56) @ (lineHeight *1)
                    extent: (charWidth * 8) @ lineHeight ] ).

    self addSubpane:
        (FormattedEntryField new
            acceptInteger;
            setName: 'goEntry';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 44) @ (lineHeight *2.5)
                    extent: (charWidth * 10) @ (lineHeight) ] ).

    self addSubpane:
        (Button new
            contents: 'Go';
            pushButton;
            when: #clicked perform: #go:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 56) @ (lineHeight *2.5)
                    extent: (charWidth * 8) @ lineHeight ] ).


    self addSubpane:
        (FormattedEntryField new
            setName: 'circleEntry';
            acceptInteger;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 44) @ (lineHeight *4)
                    extent: (charWidth * 10) @ (lineHeight) ] ).

    self addSubpane:
        (Button new
            contents: 'Circle';
            pushButton;
            when: #clicked perform: #circle:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 56) @ (lineHeight *4)
                    extent: (charWidth * 8) @ lineHeight ] ).


    self addSubpane:
        (FormattedEntryField new
            setName: 'turnEntry';
            acceptInteger;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 44) @ (lineHeight *5.5)
                    extent: (charWidth * 10) @ (lineHeight) ] ).

    self addSubpane:
        (Button new
            contents: 'Turn';
            pushButton;
            when: #clicked perform: #turn:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 56) @ (lineHeight *5.5)
                    extent: (charWidth * 8) @ lineHeight ] ).

    self addSubpane:
        (FormattedEntryField new
            setName: 'dirEntry';
            acceptInteger;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 44) @ (lineHeight *7)
                    extent: (charWidth * 10) @ (lineHeight) ] ).

    self addSubpane:
        (Button new
            contents: 'Dir';
            pushButton;
            when: #clicked perform: #dir:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 56) @ (lineHeight *7)
                    extent: (charWidth * 8) @ lineHeight ] ).

    self addSubpane:
        (FormattedEntryField new
            setName: 'mandalaEntry';
            acceptInteger;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 44) @ (lineHeight *8.5)
                    extent: (charWidth * 10) @ (lineHeight) ] ).

    self addSubpane:
        (Button new
            contents: 'Mandala';
            pushButton;
            when: #clicked perform: #mandala:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 56) @ (lineHeight *8.5)
                    extent: (charWidth * 10) @ lineHeight ] ).

    self addSubpane:
        (Button new
            contents: 'Pen Down';
            pushButton;
            when: #clicked perform: #penDown:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 44) @ (lineHeight *10)
                    extent: (charWidth * 10) @ lineHeight ] ).

    self addSubpane:
        (Button new
            contents: 'Pen Up';
            pushButton;
            when: #clicked perform: #penUp:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 56) @ (lineHeight *10)
                    extent: (charWidth * 8) @ lineHeight ] ).

    self addSubpane:
        (Button new
            contents: 'Close';
            defaultPushButton;
            when: #clicked perform: #close:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 30) @ (lineHeight *12)
                    extent: (charWidth * 8) @ lineHeight ] ).

    "Open a modeless DialogBox"
    self openModeless.
    pen := graphPane pen.
    self home: nil!
  
penDown: aButton
        "Private - Pen Down button pushed."
    pen down!

penUp: aButton
        "Private - Pen Up button pushed."
    pen up!
  
turn: aButton
        "Private - Go button pushed."
    |value|

    value := (self paneAt: 'turnEntry')contents asInteger.
    pen turn: value.! !
