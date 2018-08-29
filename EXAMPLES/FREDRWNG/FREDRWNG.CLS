
ViewManager subclass: #FreeDrawing
  instanceVariableNames: 
    'pen state start previous penSize penColor pane '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants ColorConstants '  !


!FreeDrawing class methods ! !



!FreeDrawing methods !
 
activate: aPane
        "Private - The receiver was activated."
    pane setFocus!

backupRelative: aPoint
        "Private - Answer a point relative to the pane's backup
         from aPoint."
    ^aPoint + (pane rectangle extent // 2)!

bitEdit
        "Prompt the user for a rectangle and open a BitEditor
         on the bitmap associated with the rectangle."
    | aRect |
    aRect := Display rectangleFromUser mapToWindow: pane.
    BitEditor new openOn: pane backup
        clipRect: (Rectangle origin: (self backupRelative: aRect origin)
                            corner: (self backupRelative: aRect corner))!

changeFont
        "Change the font."
    | font |
    font := Font chooseAFont: 'Select a font please.'.
    font isNil ifTrue: [^self].
    pane font: font.
    pane backup pen font: font!

changeSize
        "Change the pen size."
    | rect |
    rect := Display rectangleFromUser.
    rect isNil ifTrue: [rect := 0 @ 0 extent: 1  @ 1].
    penSize := rect width max: rect height.
    pen setLineWidth: penSize .
    pane backup pen setLineWidth: penSize!
  
circle: aPoint
    | radius newRadius center |
    pen
        setLineWidth: 1;
        setRop2: R2Notxorpen.
    self place: (center := aPoint).
    radius := 0.
    Notifier consumeInputUntil: [: event |
        newRadius := (center - self mouseLocation) abs.
        newRadius := (newRadius x * newRadius x + (
            newRadius y * newRadius y)) intSqrt.
        newRadius = radius
            ifFalse: [
                pen
                    place: center;
                    circle: radius;
                    circle: newRadius.
                radius := newRadius].
        event selector = #button1Up:].
    self reset.
    pen circle: radius.
    pane backup pen circle: radius!

clear
    pen erase.
    pane backup pen erase!
   
colorSelected: aColor
    pen foreColor: aColor.
    pane backup pen foreColor: aColor!
   
copyGraph
        "Copy a portion of the receiver's contents
          to the clipboard."
    | bitmap |
    bitmap := Bitmap fromUser.
    Clipboard setBitmap: bitmap!
   
curve: aPoint
        "Draw a straight line from the position where the left
         mouse button is pressed to where it is releases. Then
         draw a curve to the new location using the straight line
         as the base."
    | point newPoint origin dest |
    pen
        setLineWidth: 1;
        setRop2: R2Notxorpen.
    self place: (point := origin := aPoint).
    Notifier consumeInputUntil: [: event |
        newPoint := self mouseLocation.
        point = newPoint
            ifFalse: [
                pen
                    place: origin;
                    goto: point;
                    place: origin;
                    goto: newPoint.
                point := newPoint].
        event selector = #button1Up:].
    Notifier consumeInputUntil: [: event |
        event selector = #button1Down:].
    pen place: origin; goto: (dest := point).

    pen curveFrom: origin to: dest towards: (
        point := self mouseLocation).
    Notifier consumeInputUntil: [: event |
        newPoint := self mouseLocation.
        point = newPoint
            ifFalse: [
                pen curveFrom: origin to: dest towards: point.
                point := newPoint.
                pen curveFrom: origin to: dest towards: newPoint].
        event selector = #button1Up:].
    self reset.
    pen curveFrom: origin to: dest towards: point.
    pane backup pen
        curveFrom: (self backupRelative: origin)
        to: (self backupRelative: dest)
        towards: (self backupRelative: point)!
   
drawingMode: aSymbol
        "Set the state to aSymbol and have the menu
          reflect it."
    (self menuWindow menus at: 2)
        uncheckItem: state.
    (self menuWindow menus at: 2)
        checkItem: aSymbol.
    state := aSymbol!

ellipse: aPoint
    | major minor newMajor newMinor center newPoint oldPoint|
    pen
        setLineWidth: 1;
        setRop2: R2Notxorpen.
    self place: (center := aPoint).
    major := minor  := 0.
    Notifier consumeInputUntil: [: event |
        newPoint := self mouseLocation.
        newMajor := (newPoint x - center x) abs.
        newMinor := (newPoint y - center y) abs.
        newPoint = oldPoint
            ifFalse: [
                pen
                    place: center;
                    ellipse: major minor: minor;
                    ellipse: newMajor minor: newMinor.
                major := (newPoint x - center x) abs.
                minor := (newPoint y - center y) abs.
                oldPoint  := newPoint].
        event selector = #button1Up:].
    self reset.
    pen ellipse: major minor: minor.
    pane backup pen ellipse: major minor: minor!
   
erase: aPoint
    | hEraser hOldPen |
    hEraser :=
        GDILibrary createPen: PsSolid
            width: 8
            color: ClrWhite.
    self place: aPoint.
    hOldPen := pen selectObject: hEraser.
    pane backup pen selectObject: hEraser.
    Notifier consumeInputUntil: [: event |
        self goto: self mouseLocation.
        event selector = #button1Up:].
    pane backup pen selectObject: hOldPen.
    pen deleteObject: (pen selectObject: hOldPen).!
  
freeDraw: aPoint
    self place: aPoint.
    Notifier consumeInputUntil: [: event |
        self goto: self mouseLocation.
        event selector = #button1Up:]!
   
goto: aPoint
        "Private - Draw a line to aPoint."
    pen goto: aPoint.
    pane backup pen goto: (self backupRelative: aPoint)!
   
initPen: aPane
    pen := aPane pen.
    state := #freeDraw:.
    penSize := 1.
    penColor := ClrBlack!
   
initWindowSize
    ^Display extent * 8 // 10!
  
line: aPoint
    | newPoint origin point |
    pen
        setRop2: R2Notxorpen;
        setLineWidth: 1.
    self place: (point := origin := aPoint).
    Notifier consumeInputUntil: [: event |
        newPoint := self mouseLocation.
        point = newPoint
            ifFalse: [
                pen
                    place: origin;
                    goto: point.
                pen
                    place: origin;
                    goto: newPoint.
                point := newPoint].
        event selector = #button1Up:].
    self reset.
    self
        place: origin;
        goto: point!
   
modeMenu: aPane
        "Answer a menu with a list of drawing modes."
    aPane setMenu: (
        (Menu
            labels: ('draw\line\rectangle\circle\ellipse\curve\text\erase') withCrs
            lines: #()
            selectors: #(freeDraw: line: rectangle: circle: ellipse: curve: text: erase:))
        selector: #drawingMode:;
        owner: self;
        title: '&Mode';
        checkItem: #freeDraw:;
        yourself)!
   
mouseDown: aPane
        "The user has pressed the left mouse button.
          Begin tracking the mouse as per the current state."
    pane clearMouseCapture.
    self perform: state with: aPane mouseLocation!
  
mouseLocation
        "Private - Answer the current mouse location inside
         the receiver's pane."
    ^(Cursor sense mapScreenToClient: pane)
        dpToLp: pen handle!

open
        "Open a Free Drawing window."
    self label: 'FreeDrawing';
        when: #activate perform: #activate:;
        style: WsMaximizebox |
                         WsMinimizebox |
                        WsThickframe |
                        WsSysmenu |
                        WsCaption |
                        WsOverlapped |
                        WsClipsiblings |
                        WsClipchildren;
        addSubpane: (
            pane := FreeDrawPane new
                owner: self;
                when: #getMenu perform: #modeMenu:;
                when: #getContents perform: #initPen:;
                when: #button1Down perform: #mouseDown:;
                yourself).
    self openWindow.
    self menuWindow addMenu: self optionsMenu.
    self menuWindow addMenu: (
        Menu colorMenu: self selector: #colorSelected:)!
  
optionsMenu
        "Answer a menu with a list of miscellaneous operations."
    ^(Menu
        labels: 'Clear\Copy\Paste\Fonts...\Pen size\BitEdit' withCrs
        lines: #(4)
        selectors: #(clear copyGraph pasteGraph changeFont changeSize bitEdit))
        owner: self;
        title: '&Options';
        yourself!
  
pasteGraph
        "Paste the graphics from the clipboard
         to the receiver."
    | bitmap aPoint |
    (bitmap := Clipboard getBitmap) isNil
        ifTrue: [^self].
    aPoint := (Display
        pointFromUser: bitmap boundingBox
        offset: (bitmap extent // 2)) mapScreenToClient: pane.
    aPoint := aPoint dpToLp: pen handle.
    bitmap displayAt: aPoint with: pen.
    bitmap displayAt: (self backupRelative: aPoint)
         with: pane backup pen!
  
place: aPoint
        "Private - Place the pen at aPoint."
    pen place: aPoint.
    pane backup pen place: (self backupRelative: aPoint)!
  
rectangle: aPoint
    | origin corner newPoint |
    pen
        setLineWidth: 1;
        setRop2: R2Notxorpen.
    self place: (origin := corner := aPoint).
    Notifier consumeInputUntil: [: event |
        newPoint := self mouseLocation.
        newPoint = corner
            ifFalse: [
                pen
                    place: origin;
                    box: corner;
                    box: newPoint.
                corner := newPoint].
        event selector = #button1Up:].
    self reset.
    self place: origin.
    pen box: corner.
    pane backup pen box: (self backupRelative: corner)!

reset
        "Reset the attributes of the pen."
    pen
        setLineWidth: penSize;
        setRop2: R2Copypen.
    pane backup pen setLineWidth: penSize!
 
text: aPoint
    pen setTextAlign: TaTop.
    pane backup pen setTextAlign: TaTop.
    self place: aPoint.
    UserLibrary
        setCaretPos: aPoint x
        y: aPoint y.
    UserLibrary showCaret: pane asParameter!
   
undo
        "Undo the last operation."! !
