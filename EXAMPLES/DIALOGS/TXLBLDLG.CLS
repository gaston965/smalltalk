
WindowDialog subclass: #TaxLabelDialog
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants '  !


!TaxLabelDialog class methods ! !



!TaxLabelDialog methods !
   
formatSocSecNum: input
        "Answer Formatted social security number"
    | formatedOutput |

    formatedOutput := input.
    input size = 9
        ifTrue:[
            formatedOutput := (input copyFrom: 1 to: 3) ,
                                        '-', (input copyFrom: 4 to: 5),
                                        '-', (input copyFrom: 6 to: 9)]
        ifFalse:[ input size = 0
            ifTrue:[]
            ifFalse:[
                     MessageBox message: 'Invalid Social Security Number']].
    ^ formatedOutput!
   
initWindowSize
        "Private - Answer the window size."
    ^(67 @ 26) * WindowDialog unitMultiplier!
  
open: aOwner
        "Build customer controls"
    | lineHeight charWidth charHeight helv513 helv716 helv820 helv924 helv1229|

    lineHeight := WindowDialog entryHeight.
    charHeight := WindowDialog charHeight.
    charWidth := WindowDialog charWidth.
    helv513 := Font face: 'Helv'
                        size: 5 @ 13
                        fixedWidth: false.
    helv716 := Font face: 'Helv'
                        size: 7 @ 16
                        fixedWidth: false.
    helv820 := Font face: 'Helv'
                        size: 8 @ 20
                        fixedWidth: false
                        bold: true
                        hollow: false
                        italic: false
                        negative: false
                        strikeOut: false
                        underscore: false.
    helv924 := Font face: 'Helv'
                        size: 9 @ 24
                        fixedWidth: false.
    helv1229 := Font face: 'Helv'
                        size: 12 @ 29
                        fixedWidth: false
                        bold: true
                        hollow: false
                        italic: false
                        negative: false
                        strikeOut: false
                        underscore: false.

    self
        style:
            DsNoidlemsg |
            WsChild;
        parent: aOwner mainView;
        owner: aOwner.

    lineHeight := WindowDialog entryHeight.
    charHeight := WindowDialog charHeight.
    charWidth := WindowDialog charWidth.


    " '1040' Static Field"
    self addSubpane:
        (StaticText new
            leftJustified;
            contents: '1040';
            font: helv1229;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 2) @ (lineHeight * 0.5)
                    extent: (charWidth * 8) @ (lineHeight * 1.5) ] ).

    " 'Department' Static Field"
    self addSubpane:
        (StaticText new
            leftJustified;
            font: helv513;
            contents: 'Department of the Treasury - Internal Revenue Service';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 11) @ (lineHeight * 0.5)
                    extent: (charWidth * 40) @ (charHeight) ] ).

    " 'U.S. Individual Income Tax Return' Static Field"
    self addSubpane:
        (StaticText new
            leftJustified;
            font: helv820;
            contents: 'U.S. Individual Income Tax Return';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 11) @ (lineHeight *1)
                    extent: (charWidth * 40) @ (lineHeight) ] ).

    " '1991"
    self addSubpane:
        (StaticText new
            leftJustified;
            font: helv1229;
            contents: '1991';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 52) @ (lineHeight *0.5)
                    extent: (charWidth * 9) @ (lineHeight*1.5) ] ).

    " 'Label"
    self addSubpane:
        (StaticText new
            leftJustified;
            font: helv924;
            contents: 'Label';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 2) @ (lineHeight *2.5)
                    extent: (charWidth * 8) @ (lineHeight*1) ] ).

   " 'Your first name and initial"
    self addSubpane:
        (StaticText new
            leftJustified;
            font: helv513;
            contents: 'Your first name and initial';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 13) @ (lineHeight *2.5)
                    extent: (charWidth * 20) @ (charHeight*1) ] ).

   " 'Last name"
    self addSubpane:
        (StaticText new
            leftJustified;
            font: helv513;
            contents: 'Last name';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 34) @ (lineHeight *2.5)
                    extent: (charWidth * 15) @ (charHeight*1) ] ).

   " 'social security number"
    self addSubpane:
        (StaticText new
            leftJustified;
            font: helv513;
            contents: 'Your social security number';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 55) @ (lineHeight *2.5)
                    extent: (charWidth * 22) @ (charHeight*1) ] ).

    "First Name Entry Field"
    self addSubpane:
        (FormattedEntryField new
            font: helv513;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 13) @ (lineHeight *3.3)
                    extent: (charWidth * 20) @ (charHeight*1.3) ] ).

    "Last Name Entry Field"
    self addSubpane:
        (FormattedEntryField new
            font: helv513;
            acceptAlpha;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 34) @ (lineHeight *3.3)
                    extent: (charWidth * 15) @ (charHeight*1.3) ] ).

    "Soc Sec Entry Field.
    Here is an example of a defining a formatting block without
    using ones defined in FormattedEntryField."
    self addSubpane:
        (FormattedEntryField new
            font: helv513;
            setTextLimit: 9;
            acceptBlock:[ :input| self formatSocSecNum: input];
            acceptPositiveInteger;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 55) @ (lineHeight *3.3)
                    extent: (charWidth * 15) @ (charHeight*1.3) ] ).

   " 'Home address'"
    self addSubpane:
        (StaticText new
            leftJustified;
            font: helv513;
            contents: 'Home address (number and street). ';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 13) @ (lineHeight *4.5)
                    extent: (charWidth * 35) @ (charHeight*1) ] ).

   " 'Apt. no.'"
    self addSubpane:
        (StaticText new
            leftJustified;
            font: helv513;
            contents: 'Apt. no.';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 50) @ (lineHeight *4.5)
                    extent: (charWidth * 8) @ (charHeight*1) ] ).

    "Home Address Entry Field"
    self addSubpane:
        (FormattedEntryField new
            font: helv513;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 13) @ (lineHeight *5.3)
                    extent: (charWidth * 35) @ (charHeight*1.3) ] ).

    "Apt. No. Entry Field"
    self addSubpane:
        (FormattedEntryField new
            font: helv513;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 50) @ (lineHeight *5.3)
                    extent: (charWidth * 8) @ (charHeight*1.3) ] ).

   " 'City Static Field.'"
    self addSubpane:
        (StaticText new
            font: helv513;
            contents: 'City, town or post office, state and ZIP code. ';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 13) @ (lineHeight *6.5)
                    extent: (charWidth * 40) @ (charHeight*1) ] ).

   " 'City Entry Field.'"
    self addSubpane:
        (FormattedEntryField new
            font: helv513;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 13) @ (lineHeight *7.3)
                    extent: (charWidth * 40) @ (charHeight*1.3) ] ).


    self addSubpane:
        (Button new
            contents: 'Next';
            font: helv716;
            when: #clicked perform: #next:;
            owner: aOwner;
            defaultPushButton;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 20) @ (lineHeight *12)
                    extent: (charWidth * 8) @ lineHeight ] ).

    self addSubpane:
        (Button new
            contents: 'Cancel';
            font: helv716;
            owner: aOwner;
            when: #clicked perform: #cancel:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 40) @ (lineHeight *12)
                    extent: (charWidth * 8) @ lineHeight ] ).

    self openModeless.

    ^ self! !
