
WindowDialog subclass: #Puzzle15Colors
  instanceVariableNames: 
    'borderColor borderColorComboBox faceColor faceColorComboBox '
  classVariableNames: 
    'ColorNames '
  poolDictionaries: 
    'ColorConstants PuzzleText '  !


!Puzzle15Colors class methods !
  
initialize
        "Private - Initialize ColorNames class variable dictionary."
    ColorNames := Dictionary new.
    ColorNames
        at: ColorBlack put: ClrBlack;
        at: ColorDarkred put: ClrDarkred;
        at: ColorBlue put: ClrBlue;
        at: ColorPink put: ClrPink;
        at: ColorDefault put: ClrDefault;
        at: ColorDarkgray put: ClrDarkgray;
        at: ColorBrown put: ClrBrown;
        at: ColorGreen put: ClrGreen;
        at: ColorYellow put: ClrYellow;
        at: ColorCyan put: ClrCyan;
        at: ColorDarkblue put: ClrDarkblue;
        at: ColorWhite put: ClrWhite;
        at: ColorDarkcyan put: ClrDarkcyan;
        at: ColorBackground put: ClrBackground;
        at: ColorDarkgreen put: ClrDarkgreen;
        at: ColorNeutral put: ClrNeutral;
        at: ColorRed put: ClrRed;
        at: ColorPalegray put: ClrPalegray;
        at: ColorDarkpink put: ClrDarkpink;
        at: ColorLightgray put: ClrLightgray.! !



!Puzzle15Colors methods !
 
borderColor
        "Private - Answer borderColor."
    ^borderColor.!

cancel: aButton
        "Private - Cancel button pushed, close the window,
    ignoring the colors."
    self mainView close!

faceColor
        "Private - Answer the faceColor."
    ^faceColor.!
  
faceColorComboBox: aComboBox
        "Private - Answer nil.
    when: #getContents perform: #faceColorComboBox
    was sent to name the faceColorComboBox to
    identify its help panel."
    ^nil.!
  
initWindowSize
        "Private - Answer the window size."
    ^(50 @ 10) * WindowDialog unitMultiplier!
  
ok: aButton
        "Private - Ok button pushed, get the colors from
    the dialog window and closeit."
    borderColor := ColorNames at: borderColorComboBox selectedItem.
    faceColor := ColorNames at: faceColorComboBox selectedItem.
    self mainView close!
  
opened: topPane
        "Private - Dialog is opened, select the text
         and set the initial focus."
    (self paneAt: #faceColorComboBox:)  setFocusOnControl!
 
openOn: colorArray
        "Private - Open the color selection dialog"
    | lineHeight charWidth charHeight |
    faceColor := colorArray at: 1.
    borderColor := colorArray at: 2.
    lineHeight := WindowDialog entryHeight.
    charHeight := WindowDialog charHeight.
    charWidth := WindowDialog charWidth.
    " 'The Face Color' Static Field"
    self addSubpane:
        (StaticText new
            contents: FaceColorText;
           framingBlock: [:box |
            (box leftTop rightAndDown: (charWidth * 2) @ (lineHeight))
                extentFromLeftTop: (charWidth * 20) @ lineHeight ]).

    self addSubpane:
        (StaticText new
            contents: BorderColorText;
           framingBlock: [:box |
                (box leftTop rightAndDown: (charWidth * 25) @ (lineHeight))
                    extentFromLeftTop: (charWidth * 20) @ lineHeight ]).

    self addSubpane:
        (faceColorComboBox := ComboBox new
        contents: (ColorNames keys asArray);
        selection: (ColorNames keyAtValue: faceColor);
        when: #getContents perform: #faceColorComboBox:;
        framingBlock: [:box |
            (box leftTop rightAndDown: (charWidth * 2) @ (lineHeight * 2))
                extentFromLeftTop: (charWidth * 20 ) @ (charHeight *7) ]).

    self addSubpane:
        (borderColorComboBox := ComboBox new
            contents: (ColorNames keys asArray);
            selection: (ColorNames keyAtValue: borderColor);
            framingBlock: [:box |
                (box leftTop rightAndDown: (charWidth * 25) @ (lineHeight * 2))
                    extentFromLeftTop: (charWidth * 20) @ (charHeight * 7) ]).

    self addSubpane:
        (Button new
            contents: OkButtonText;
            defaultPushButton;
            when: #clicked perform: #ok:;
            framingBlock: [:box |
                (box leftTop rightAndDown: (charWidth * 10) @ (lineHeight * 5))
                    extent: (charWidth * 9) @ lineHeight ] ).

    self addSubpane:
        (Button new
            contents: CancelButtonText;
            owner: self;
            when: #clicked perform: #cancel:;
            framingBlock: [:box |
                (box leftTop rightAndDown: (charWidth * 25) @ (lineHeight * 5))
                    extent: (charWidth * 9) @ lineHeight ] ).
    self labelWithoutPrefix: ColorDialogTitle.
    self
        when: #opened perform: #opened:.
    self openWindow.! !
