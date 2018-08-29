
WindowDialog subclass: #TaxFilingDialog
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants ' !


!TaxFilingDialog class methods ! !



!TaxFilingDialog methods !
 
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
                        fixedWidth: false.
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


    " 'Filing Status"
    self addSubpane:
        (StaticText new
            leftJustified;
            font: helv924;
            contents: 'Filing Status';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 2) @ (lineHeight *1)
                    extent: (charWidth * 15) @ (lineHeight*1) ] ).


   " Single RadioButton"
    self addSubpane:
        (RadioButton new
            font: helv513;
            contents: 'Single';
            selection: true;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 16) @ (lineHeight *2)
                    extent: (charWidth * 30) @ (charHeight*1) ] ).

   " Married joint RadioButton"
    self addSubpane:
        (RadioButton new
            font: helv513;
            contents: 'Married filing joint return';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 16) @ (lineHeight *3)
                    extent: (charWidth * 30) @ (charHeight*1) ] ).

   "Married seperate RadioButton"
    self addSubpane:
        (RadioButton new
            font: helv513;
            contents: 'Married filing sperate return.';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 16) @ (lineHeight *4)
                    extent: (charWidth * 30) @ (charHeight*1) ] ).

   "Head of household RadioButton"
    self addSubpane:
        (RadioButton new
            font: helv513;
            contents: 'Head of household (with qualifying persion).';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 16) @ (lineHeight *5)
                    extent: (charWidth * 30) @ (charHeight*1) ] ).

   "Qualifying widow(er)"
    self addSubpane:
        (RadioButton new
            font: helv513;
            contents: 'Qualifying widow(er) with dependent child.';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 16) @ (lineHeight *6)
                    extent: (charWidth * 30) @ (charHeight*1) ] ).

    self addSubpane:
        (Button new
            contents: 'Prev';
            font: helv716;
            owner: aOwner;
            when: #clicked perform: #prev:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 12) @ (lineHeight *12)
                    extent: (charWidth * 8) @ lineHeight ] ).

    self addSubpane:
        (Button new
            contents: 'Next';
            font: helv716;
            owner: aOwner;
            defaultPushButton;
            when: #clicked perform: #next:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 34) @ (lineHeight *12)
                    extent: (charWidth * 8) @ lineHeight ] ).

    self addSubpane:
        (Button new
            contents: 'Cancel';
            owner: aOwner;
            font: helv716;
            when: #clicked perform: #cancel:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 53) @ (lineHeight *12)
                    extent: (charWidth * 8) @ lineHeight ] ).

    self openModeless.

    ^ self! !
