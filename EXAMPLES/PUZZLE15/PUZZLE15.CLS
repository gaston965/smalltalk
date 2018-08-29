
ViewManager subclass: #Puzzle15
  instanceVariableNames: 
    'numbers puzzlePane randomInt size solvedPuzzle faceColor borderColor hm '
  classVariableNames: 
    'MapDictionary '
  poolDictionaries: 
    'ColorConstants WinConstants PuzzleText ' !


!Puzzle15 class methods !

buildMapDictionary
        "Build the help panel mapping id dictionary"
    MapDictionary :=
        StringDictionaryReader createIdDictionary: HelpMapFileName.
    (StringDictionaryReader createIdDictionary: VwHelpMapFileName)
        associationsDo:[:each | MapDictionary add: each].!
 
mapDictionary
        "Answers the help mapping id dictionary"
    ^MapDictionary! !



!Puzzle15 methods !
   
changeMenuBar: aTopPane

    | menuBar |
    (menuBar := aTopPane menuWindow)
        removeMenu: (aTopPane menuWindow menuTitled: '~File');
        removeMenu: (aTopPane menuWindow menuTitled: '~Edit').
    (aTopPane menuWindow menuTitled: '&Help')
       title: HelpMenuTitle;
       changeItem: #displayHelpIndex label: HelpContents;
       changeItem: #searchHelpOn label: HelpOn;
       changeItem: #displayHelpForHelp label: HelpForHelp.!
  
close:topPane
    Smalltalk isRunTime
        ifTrue: [
            (MessageBox confirm: CloseConfirm)
                ifTrue: [
                    self close.
                    ^Smalltalk exit]
                ifFalse: [
                    ^self]]
        ifFalse: [
            ^super close].!
   
drawCell: i in: pane
    | pen cellSize |

    pen := pane pen.
    faceColor notNil ifTrue: [pen foreColor: faceColor].
    cellSize := pen extent // size.
    (numbers at: i + 1) = ( size squared )
        ifTrue: [pen fill: (
            ((i \\ size) @ ("(size - 1) -" (i // size)) * cellSize + 1) extent: cellSize - 1)
            color: pen backColor]
        ifFalse: [
            pen place: (i \\ size) @ ("size -" (i // size)) * cellSize
                    + ((cellSize // 2) "* (1 @ 0)");
                centerText: (numbers at: i + 1) printString].!
 
initPuzzle
    size := 4.
    randomInt := Time now seconds.
    numbers := Array new: ( size squared ).
    solvedPuzzle := Array new: ( size squared ).
    borderColor := ClrBlack.
    faceColor := ClrBlack.
    "Load default language text"
    StringDictionaryReader fill: PuzzleText
        fromStringTable: 'examples\puzzle15\Puzzle15.rc'.
    self class buildMapDictionary.
    Puzzle15Colors initialize.!
  
mouseUp: pane
    | p square index blank b |
    p := pane mouseLocation.
    b := (numbers indexOf: (size squared)) - 1.
    blank := (b \\ size) @ ("(size - 1) -" (b // size)).
    square := p // (pane extent // size).
    (((square - blank) abs = (0 @ 1)) or: [
        (square - blank) abs = (1 @ 0)]) ifFalse: [^Terminal bell].
    index := square x + (size * ("(size - 1) -" square y)) + 1.
    numbers at: (b + 1) put: (numbers at: index).
    numbers at: index put: (size squared).
    self drawCell: b in: pane; drawCell: index - 1 in: pane.
    numbers =solvedPuzzle
        ifTrue: [
            Menu message: SolvedMessage ]!
 
newSize
        "Change the size of the puzzle"
    | tempstring tempint defaultTopic|
    defaultTopic := hm extendedHelpPanelId.
    hm extendedHelpPanelId: 'Prompter'.
    tempstring := Prompter
        prompt: SizeQueryMessage
        default: DefaultSize.
    hm extendedHelpPanelId: defaultTopic.
    tempstring isNil
        ifFalse: [
            tempint := tempstring asInteger.
            ( tempint <= 1 or: [ tempint >= 11 ] )
                ifTrue: [ size := 4. ]
                ifFalse: [ size := tempint ].
            numbers := Array new: ( size squared ).
            solvedPuzzle := Array new: ( size squared ).
            1 to: ( size squared ) do: [ :i |
                numbers at: i put: i.
                solvedPuzzle at: i put: i ].
            self redraw: puzzlePane ].!
   
open
        "Initialize and open the puzzle."
    self initPuzzle.
    1 to: ( size squared ) do:    [ :i |
        numbers at: i put: i.
        solvedPuzzle at: i put: i ].
    self
        labelWithoutPrefix: ApplicationTitle;
        owner: self;
        when: #close perform: #close:;
        when: #menuBuilt perform: #changeMenuBar:.
    self addSubpane:
        (puzzlePane := GraphPane new
            owner: self;
            when: #getContents perform: #redraw:;
            when: #display perform: #redraw:;
            style: GraphPane noScrollBarsFrameStyle;
            when: #button1Up perform: #mouseUp:;
            when: #getMenu perform: #puzzleMenu:;
            framingRatio: (
                0@0 extent: 1 @ 1)).
    hm := HelpManager
        for: self mainView
        title: HelpManagerTitle
        file: HelpFileName
        dialogs: nil.
    hm map: MapDictionary.
    self openWindow.!
 
puzzleMenu: aGraphPane
        "Answer a Menu for the Puzzle window"
    aGraphPane setMenu: ((Menu
        labels: PuzzleMenu withCrs
        lines: #()
        selectors: #(scramble unscramble newSize setColors))
            title: PuzzleMenuTitle).!
  
redraw: pane
    | pen cellSize |
    pen := pane pen.
    pen setTextAlign: TaTop.
    pen erase.
    cellSize := pen extent // size.
    pen font: (Font face:FontFaceName size: cellSize * (size - 1) // (size * 2 ) fixedWidth:false).
    0 to: ( size squared - 1) do: [:i | self drawCell: i in: pane].
    borderColor notNil ifTrue: [pen foreColor: borderColor].
    1 to: (size - 1) do: [:i |
        pen place: i * (pen width // size) @ 0;
            goto: i * (pen width // size) @ (pen height);
            place: 0 @ (i * (pen height // size));
            goto: (pen width) @ (i * (pen height // size))].!
  
scramble
        "Mess up the tiles."
    | position temppos direction tempint |
    "position holds the current position of the blank token.
     temppos holds the position where the blank token will be moved.
     direction holds 0,1,2,3 for down, up, right, left.
     tempint is a temporary integer for swapping. "
    "For some large number of times, move the blank token around."
    CursorManager execute change.
    1 to: ( size squared * 64 ) do:  [ :i |                                                "64 chosen empirically."
        position := numbers indexOf: ( size squared ).                         " Find blank token."
        direction := randomInt \\ 4.                                                         " Which way to move. "
        randomInt := ( randomInt * Time now seconds ) \\ 32767 + 1.  " Reseed. "
        direction = 0       " down "
            ifTrue: [
                position >= (size * (size - 1) + 1)
                    ifTrue: [ temppos := position. ]      " Can't go further down."
                    ifFalse: [
                        temppos := position + size. ]].
        direction = 1       " up "
            ifTrue: [
                position <= size
                    ifTrue: [ temppos := position. ]       " Can't go further up."
                    ifFalse: [ temppos := position - size. ]].
        direction = 2       " right "
            ifTrue: [
                ( position \\ size ) = 0
                    ifTrue: [ temppos := position. ]         " Can't go further right."
                    ifFalse: [ temppos := position + 1. ]].
        direction = 3       " left "
            ifTrue: [
                ( position \\ size ) = 1
                    ifTrue: [ temppos := position. ]         " Can't go further left."
                    ifFalse: [ temppos := position - 1 ]].
        " Now swap the space with the token just picked. "
        tempint := numbers at: temppos.
        numbers at: temppos put: ( numbers at: position ).
        numbers at: position put: tempint].
    self redraw: puzzlePane.
    CursorManager normal change.!
   
setColors
        "Private - Set the color of the numeric faces
        and the borders from a dialog box."
    |colorDlg defaultTopic|
    defaultTopic := hm extendedHelpPanelId.
    hm extendedHelpPanelId: 'puzzle15Colors'.
    colorDlg := Puzzle15Colors new
        openOn: (Array with: faceColor with: borderColor).
    hm extendedHelpPanelId: defaultTopic.
    faceColor := colorDlg faceColor.
    borderColor := colorDlg borderColor.
    (faceColor notNil or: [borderColor notNil])
        ifTrue: [self redraw: puzzlePane].!
 
topPaneClass
        "Private - Answer the default top pane class."
    ^TopPane!
 
unscramble
    " Return the tiles to normal "
    1 to: (size squared) do: [ :i | numbers at: i put: i].
    self redraw: puzzlePane.! !
