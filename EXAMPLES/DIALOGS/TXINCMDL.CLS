
WindowDialog subclass: #TaxIncomeDialog
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants ' !


!TaxIncomeDialog class methods ! !



!TaxIncomeDialog methods !
 
calculate
        "calculate new total sale price"
    |total|

    total := (self owner paneAt: 'wage') contents asFloat
                    + (self owner paneAt: 'interest') contents asFloat
                    + (self owner paneAt: 'dividend') contents asFloat
                    + (self owner paneAt: 'refund') contents asFloat
                    + (self owner paneAt: 'businessIncome') contents asFloat
                    + (self owner paneAt: 'capitalGain') contents asFloat
                    + (self owner paneAt: 'otherGain') contents asFloat
                    + (self owner paneAt: 'rent') contents asFloat.
    (self owner paneAt: 'totalStatic') contents: total printString.!

initWindowSize
        "Private - Answer the window size."
    ^(67 @ 26) * WindowDialog unitMultiplier!
  
newValue: aPriceEntry
        "User has entered a vehicle price"
    self calculate.!
 
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


    " Income"
    self addSubpane:
        (StaticText new
            leftJustified;
            font: helv924;
            contents: 'Income';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 2) @ (lineHeight *1)
                    extent: (charWidth * 15) @ (lineHeight*1) ] ).


   " Wages Static Field"
    self addSubpane:
        (StaticText new
            font: helv513;
            contents: 'Wages, salaries, tips, etc.';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 16) @ (lineHeight *2)
                    extent: (charWidth * 30) @ (charHeight*1) ] ).

   " Wages Entry Field"
    self addSubpane:
        (FormattedEntryField new
            font: helv513;
            acceptDollar;
            setName: 'wage';
            when: #textChanged perform: #newValue:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 48) @ (lineHeight *2)
                    extent: (charWidth * 12) @ (charHeight*1.3) ] ).

   " Taxable interest income"
    self addSubpane:
        (StaticText new
            font: helv513;
            contents: 'Taxable interest income.';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 16) @ (lineHeight *3)
                    extent: (charWidth * 30) @ (charHeight*1) ] ).

   " Taxable interest income"
    self addSubpane:
        (FormattedEntryField new
            font: helv513;
            acceptDollar;
            setName: 'interest';
            when: #textChanged perform: #newValue:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 48) @ (lineHeight *3)
                    extent: (charWidth * 12) @ (charHeight*1.3) ] ).

   " Dividend income Static Field"
    self addSubpane:
        (StaticText new
            font: helv513;
            contents: 'Dividend income.';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 16) @ (lineHeight *4)
                    extent: (charWidth * 30) @ (charHeight*1) ] ).

   " Dividend income Entry Field"
    self addSubpane:
        (FormattedEntryField new
            font: helv513;
            acceptDollar;
            setName: 'dividend';
            when: #textChanged perform: #newValue:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 48) @ (lineHeight *4)
                    extent: (charWidth * 12) @ (charHeight*1.3) ] ).

   " Taxable refunds Static field"
    self addSubpane:
        (StaticText new
            font: helv513;
            contents: 'Taxable refunds of state and local income taxes.';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 16) @ (lineHeight *5)
                    extent: (charWidth * 30) @ (charHeight*1) ] ).

   "Taxable refund Entry Field"
    self addSubpane:
        (FormattedEntryField new
            font: helv513;
            acceptDollar;
            setName: 'refund';
            when: #textChanged perform: #newValue:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 48) @ (lineHeight *5)
                    extent: (charWidth * 12) @ (charHeight*1.3) ] ).

   " Business income Static Field"
    self addSubpane:
        (StaticText new
            font: helv513;
            contents: 'Business income or (loss)';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 16) @ (lineHeight *6)
                    extent: (charWidth * 30) @ (charHeight*1) ] ).

   "Business income Entry Field"
    self addSubpane:
        (FormattedEntryField new
            font: helv513;
            acceptDollar;
            setName: 'businessIncome';
            when: #textChanged perform: #newValue:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 48) @ (lineHeight *6)
                    extent: (charWidth * 12) @ (charHeight*1.3) ] ).

   " Capital gain or (loss) Static Field"
    self addSubpane:
        (StaticText new
            font: helv513;
            contents: 'Capital gain or (loss).';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 16) @ (lineHeight *7)
                    extent: (charWidth * 30) @ (charHeight*1) ] ).

   " Capital gain Entry Field"
    self addSubpane:
        (FormattedEntryField new
            font: helv513;
            acceptDollar;
            setName: 'capitalGain';
            when: #textChanged perform: #newValue:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 48) @ (lineHeight *7)
                    extent: (charWidth * 12) @ (charHeight*1.3) ] ).

   " Other gain or (losses) Static Field"
    self addSubpane:
        (StaticText new
            font: helv513;
            contents: 'Other gain or (losses).';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 16) @ (lineHeight *8)
                    extent: (charWidth * 30) @ (charHeight*1) ] ).

   " Other gain or losses Entry Field"
    self addSubpane:
        (FormattedEntryField new
            font: helv513;
            acceptDollar;
            setName: 'otherGain';
            when: #textChanged perform: #newValue:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 48) @ (lineHeight *8)
                    extent: (charWidth * 12) @ (charHeight*1.3) ] ).

   " Rent Static Field"
    self addSubpane:
        (StaticText new
            font: helv513;
            contents: 'Rents, royalties, partnership, estates, trusts, etc..';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 16) @ (lineHeight *9)
                    extent: (charWidth * 30) @ (charHeight*1) ] ).

   " Rent Entry Field"
    self addSubpane:
        (FormattedEntryField new
            font: helv513;
            acceptDollar;
            setName: 'rent';
            when: #textChanged perform: #newValue:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 48) @ (lineHeight *9)
                    extent: (charWidth * 12) @ (charHeight*1.3) ] ).

   " Total Static Field"
    self addSubpane:
        (StaticText new
            font: helv513;
            contents: 'Total income.';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 16) @ (lineHeight *10)
                    extent: (charWidth * 30) @ (charHeight*1) ] ).

   " Total Formatted Static Field"
    self addSubpane:
        (FormattedStaticText new
            formatAsDollar;
            setName: 'totalStatic';
            font: helv513;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 48) @ (lineHeight *10)
                    extent: (charWidth * 12) @ (charHeight*1) ] ).


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
            contents: 'Ok';
            font: helv716;
            owner: aOwner;
            defaultPushButton;
            when: #clicked perform: #ok:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 30) @ (lineHeight *12)
                    extent: (charWidth * 8) @ lineHeight ] ).

    self addSubpane:
        (Button new
            contents: 'Cancel';
            font: helv716;
            owner: aOwner;
            when: #clicked perform: #cancel:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 47) @ (lineHeight *12)
                    extent: (charWidth * 8) @ lineHeight ] ).

    self openModeless.

    ^ self! !
