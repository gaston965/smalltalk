
ViewManager subclass: #BitEditor
  instanceVariableNames: 
    'bitPen bitColor bitPoint scale copy imagePen imageForm imageRect windowSize '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants ColorConstants '   !


!BitEditor class methods ! !



!BitEditor methods !
 
changeBits: aPane
    | aPoint  changePoint imagePoint |
    aPoint := aPane mouseLocation.
    (self isInGrid: aPoint)
        ifFalse: [^self].
    imagePoint := aPoint // scale.
    changePoint := imagePoint * scale.
    changePoint printString.
    bitPen fill: ((changePoint + 2) extent: (scale @ scale) - 3)
        color: bitColor.
    imagePen fill: (imagePoint extent: 1 @ 1)
        color: bitColor.
    copy pen fill: (imagePoint extent: 1 @ 1)
        color: bitColor!
   
clear
    imagePen erase.
    bitPen erase.
    copy pen blank: copy boundingBox.
    self grid: scale!
 
close
    super close.
    copy release!
  
colorSelected: aColor
    bitColor := aColor!
  
displayBits: aPane
    bitPen := aPane pen.
    bitPen
        copyBitmap: copy
        from: copy boundingBox
        to: (0 @ 0 extent: copy extent * scale).
    self grid: scale!
 
displayImage: aPane
    imagePen := aPane pen.
    copy displayAt: 0 @ 0
        with: imagePen!
 
editMenu: aPane
    aPane setMenu: (
        (Menu
            labels: 'Clear\Fill' withCrs
            lines: #()
            selectors: #(clear fill))
            owner: self;
            title: '&Edit';
            yourself)!

exit: aButton
    self close!
  
fill
    | aPoint |
    Notifier consumeInputUntil: [: event |
        event selector = #button1Up: ].
    aPoint := Cursor sense mapScreenToClient: bitPen graphicsMedium.
    ((0 @ 0 extent: bitPen graphicsMedium rectangle extent)
        containsPoint: aPoint)
            ifTrue: [self fillAt: aPoint]!

fillAt: aPoint
    | cells originalColor adjColor cell imagePoint cellMatrix |
    imagePoint := aPoint // scale.
    originalColor := GDILibrary getPixel: copy pen handle
        x: imagePoint x
        y: imagePoint y.
    copy pen backColor: bitColor.
    GDILibrary extFloodFill: copy pen handle
        x: imagePoint x
        y: imagePoint y
        color: originalColor
        fillType: Floodfillsurface.

    self displayImage: imagePen graphicsMedium.
    self displayBits: bitPen graphicsMedium.!
   
grid: anInteger
        "Draw grid lines with anInteger spacing
         on the receiver medium."
    | i len end width height |
    width := copy width * scale.
    height := copy height * scale.
    bitPen foreColor: ClrWhite.
    i := 0.
    [i < width]
        whileTrue: [
            bitPen place: (i + 1)@ 0;
                goto: (i + 1) @ height;
                place: (i + anInteger - 1) @ 0;
                goto: (i + anInteger - 1) @ height.
            i := i + anInteger].
    i := 0.
    [i < height]
        whileTrue: [
            bitPen place: 0 @ (i + 1);
                goto: width @ (i + 1);
                place: 0 @ (i + anInteger - 1);
                goto: width @ (i + anInteger - 1).
            i := i + anInteger].
    bitPen foreColor: ClrBlack.
    i := 0.
    [i < width]
        whileTrue: [
            bitPen place: i @ 0;
                goto: i @ height.
            i := i + anInteger].
    i := 0.
    [i < height]
        whileTrue: [
            bitPen place: 0 @ i;
                goto: width @ i.
            i := i + anInteger]!
   
initBitPen: aPane
    bitPen := aPane pen!
 
initialize
        "Private - Initialize the receiver."
    bitColor := ClrDefault.
    super initialize!

initImagePen: aPane
    imagePen := aPane pen!
 
initWindowSize
        "Private - Answer the initial window extent."
    | size |
    size := 10 @ 10 min: (Display extent - windowSize).
    size :=  size extent: windowSize.
    ^size!
 
isInGrid: aPoint
        "Private - Answer true if aPoint is in the grid."
    | gridRectangle |
    gridRectangle := 0 @ 0 extent: (copy extent * scale).
    (gridRectangle containsPoint: aPoint)
        ifTrue: [^true]
        ifFalse: [^false]!
   
openOn: aBitmap
        "Open a BitEditor on aBitmap."
   self openOn: aBitmap clipRect: (0 @ 0 extent: aBitmap extent)!
  
openOn: aBitmap clipRect: aRect
        "Open a BitEditor on aBitmap."
    | groupPane size imageSize |
    scale := 8.
    imageForm := aBitmap.
    imageSize := (aRect extent min: imageForm extent) min:
        (Display width - 80 // scale @
            (Display height - 20 // scale)).
    imageRect := aRect origin extent:
        (aRect extent min: imageSize).
    imageSize := imageSize * scale + (5 @ 5).
    size := 76 @ (300 max: imageSize y).
    copy := Bitmap screenExtent: aRect extent.
    copy pen copyBitmap: aBitmap
        from: aRect
        at: 0 @ 0.
    self label: 'BitEditor'.
    self addSubpane: (
        GraphPane new
            model: self;
            when: #display perform: #displayImage:;
            style: GraphPane noScrollBarsFrameStyle;
            framingBlock: [: box |
                box origin extent: (size x @ (box height // 2))]).
    self addSubpane:
        (groupPane := GroupPane new
            framingBlock: [: box |
                box origin x @ (box origin y + (box height // 2))
                    extent: (size x @ (box height // 2))]).
    groupPane addSubpane:
        (Button new
            model: self;
            contents: 'Save';
            pushButton;
            when: #clicked perform: #save:;
            framingBlock: [: box |
                (box origin x + (box width // 6)) @ (box origin y + (box height // 6))
                    extent: (box width * 2 // 3) @ (box height // 3)]).
   groupPane addSubpane:
        (Button new
            model: self;
            contents: 'Exit';
            pushButton;
            when: #clicked perform: #exit:;
            framingBlock: [: box |
                (box origin x + (box width // 6)) @ (box origin y + (box height // 2))
                    extent: (box width * 2 // 3) @ (box height  // 3)]).
    self addSubpane:
        (GraphPane new
            owner: self;
            when: #getMenu perform: #editMenu:;
            when: #display perform: #displayBits:;
            when: #button1Down perform: #changeBits:;
            when: #button1Move perform: #changeBits:;
            style: GraphPane noScrollBarsFrameStyle;
            framingBlock: [: box |
                box origin x + (size x @ 0)  extent: (
                    (box width - size x) @ box height)]).
    windowSize := 76 + imageSize x + 2 @
        (( 300 max: imageSize y) + SysFont height + 6).
    self openWindow.
    self menuWindow addMenu: (
        Menu colorMenu: self selector: #colorSelected:)!
  
save: aButtton
    imageForm pen copyBitmap: copy
        from: copy boundingBox
        at: imageRect origin! !
