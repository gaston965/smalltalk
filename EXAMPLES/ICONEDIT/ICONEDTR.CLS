
BitEditor subclass: #IconEditor
  instanceVariableNames: 
    'andMask xorMask icon mode fileName changeFlag exeFile iconResource '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants ColorConstants ' !


!IconEditor class methods !
  
new
    ^super new initialize! !



!IconEditor methods !
  
addFileMenuItem: aPane
        "Private - Add items to the file menu."
         (self menuWindow menuTitled: '&File')
            appendSeparator ;
            appendItem: 'Open Icon ...' selector:
                (Message new receiver: self;
                    selector: #openIcon);
            appendItem: 'Save Icon' selector:
                (Message new receiver: self;
                    selector: #saveIcon);
            appendItem: 'Save Icon As ...' selector:
                (Message new receiver: self;
                    selector: #saveIconAs);
            appendItem: 'Write Icon To Module' selector:
                (Message new receiver: self;
                    selector: #writeToImage).!
 
changeBit: aPane
        "Private - Change the bit at the user-selected location."
    | aPoint  changePoint imagePoint color |
    changeFlag := true.
    aPoint := aPane mouseLocation.
    (self isInGrid: aPoint)
        ifFalse: [^self].
    self changeBitAt: aPoint!
   
changeBitAt: aPoint
        "Private - Change the bit at aPoint."
    | scaledPoint imagePoint color |
    imagePoint := aPoint // scale.
    scaledPoint := imagePoint * scale.
    mode = #color
        ifTrue: [color := bitColor]
        ifFalse: [mode = #screen
            ifTrue: [color := ClrCyan]
            ifFalse: [color := ClrDarkred]].
    bitPen fill: ((scaledPoint + 2) extent: (scale @ scale) - 3)
        color: color.
    imagePen fill: (imagePoint extent: 1 @ 1)
        color: color.
    mode = #color
        ifTrue: [
            andMask pen fill: (imagePoint extent: 1 @ 1)
                rule: Blackness.
            xorMask pen fill: (imagePoint extent: 1 @ 1)
                color: color].
    mode = #screen
        ifTrue: [
            andMask pen fill: (imagePoint extent: 1 @ 1)
                rule: Whiteness.
            xorMask pen fill: (imagePoint extent: 1 @ 1)
                rule: Blackness].
    mode = #inverse
        ifTrue: [
            andMask pen fill: (imagePoint extent: 1 @ 1)
                rule: Whiteness.
            xorMask pen fill: (imagePoint extent: 1 @ 1)
                rule: Whiteness]!

clear
    "Private - Blank out icon."
    xorMask pen fill: xorMask boundingBox
        rule: Blackness.
    andMask pen fill: andMask boundingBox
        rule: Whiteness.
    self displayImage: imagePen graphicsMedium.
    self displayBits: bitPen graphicsMedium.!

close: aPane
        "Private - Prompt the user to save work."
    | answer |

    self save.
    changeFlag ifTrue:[
       answer := MessageBox
            titled: 'Exiting IconEditor'
            withText: 'Save changes to file?'
            style: MbYesnocancel | MbIconquestion | MbDefbutton3.
        answer = Idno ifTrue: [^self exit].
        answer = Idyes
            ifTrue: [
                self saveIcon.
                ^self exit]]
        ifFalse:[
            ^self exit].!
 
colorButton: aButtonPane
        "Private - The color button has been selected. "
    mode := #color!
 
copyIcon
        "Private - Copy the graphics from the clipboard
         to the receiver."
    Clipboard setBitmap: xorMask.!
   
createMasks
        "Private - Create the AND and XOR masks for Icon."
    | iconExtent |
    iconExtent := icon extent.
    icon xorMask isNil ifTrue: [icon createMasks].
    andMask := Bitmap extent: iconExtent.
    icon xorMask isColor
        ifTrue: [xorMask := Bitmap width: iconExtent x height: iconExtent y planes: 1 bitCount: 4]
        ifFalse: [xorMask := Bitmap extent: iconExtent].
    xorMask pen copyBitmap: icon xorMask
        from: xorMask boundingBox
        at: 0 @ 0.
    andMask pen copyBitmap: icon andMask
        from: xorMask boundingBox
        at: 0 @ 0.!
   
displayBits: graphPane
    "Private - Display icon image in bits graphics pane"
    bitPen := graphPane pen.
    bitPen erase.
    bitPen fill: (0 @ 0 extent: (
        (andMask width * scale) @  (andMask height * scale)))
        color: ClrCyan.
    bitPen copyBitmap: andMask
        from: andMask boundingBox
        to: (andMask boundingBox scaleBy: scale)
        rule: Srcand.
    bitPen copyBitmap: xorMask
        from: xorMask boundingBox
        to: (xorMask boundingBox scaleBy: scale)
        rule: Srcinvert.
   self grid: scale!
   
displayImage: graphPane
    "Private - Display icon image in image graphics pane"
    imagePen := graphPane pen.
    imagePen erase.
    imagePen fill: (0 @ 0 extent: icon extent)
        color: ClrCyan.
    imagePen copyBitmap: andMask
        from: andMask boundingBox
        at: 0 @ 0
        rule: Srcand.
    imagePen copyBitmap: xorMask
        from: xorMask boundingBox
        at: 0 @ 0
        rule: Srcinvert!
   
editHotSpot
"Private - Edit Hot Spot"
    | hotSpot |
    CursorManager crossHair change.
    Notifier consumeInputUntil: [: event |
        event selector = #button1Up:].
    hotSpot := Cursor sense mapFromWindow: UserLibrary getDesktopWindow to:  bitPen graphicsMedium.
    hotSpot := hotSpot // scale.
    icon hotSpot: hotSpot!
 
editMenu: aPane
    "Private - Add edit menu"
    aPane setMenu: (
        (Menu
            labels: 'Clear\Fill\Copy\Paste' withCrs
            lines: #()
            selectors: #(clear fill copyIcon pasteIcon))
            owner: self;
            title: '&Edit';
            yourself)!
   
exit
        "Private - Exit the IconEditor."
    andMask release.
    xorMask release.
    exeFile notNil ifTrue:[exeFile release. exeFile:=nil].
    super close!

fillAt: aPoint
        "Private - Fill aPoint and points adjacent to aPoint with bitColor.
         The adjacent points' color must be the same as
         aPoint's color."

    |originalColor imagePoint color|
    imagePoint := aPoint // scale.

    originalColor := GDILibrary getPixel: xorMask pen handle
        x: imagePoint x
        y: imagePoint y.

    mode = #color
        ifTrue: [color := bitColor]
        ifFalse: [mode = #screen
            ifTrue: [color := ClrCyan]
            ifFalse: [color := ClrDarkred]].
    xorMask pen backColor: color.
    GDILibrary extFloodFill: xorMask pen handle
        x: imagePoint x
        y: imagePoint y
        color: originalColor
        fillType: Floodfillsurface.
    andMask pen backColor: ClrBlack.
    originalColor := GDILibrary getPixel: andMask pen handle
        x: imagePoint x
        y: imagePoint y.
    GDILibrary extFloodFill: andMask pen handle
        x: imagePoint x
        y: imagePoint y
        color: originalColor
        fillType: Floodfillsurface.


    self displayImage: imagePen graphicsMedium.
    self displayBits: bitPen graphicsMedium.
    changeFlag := true!
  
fromExeFile: aFileName
        "Private - Answer an icon from aFileName icon file or nil."
    |iconDialog anExeFile|

    anExeFile:=ExeFile openOn:aFileName.
    anExeFile icons isEmpty ifTrue:[^self].
    iconDialog:=IconDialog new openOn: anExeFile.
    iconDialog icon isNil ifTrue:[^nil].
    iconResource := iconDialog icon.
    exeFile:=anExeFile.
    icon:= Icon readFromExeFile: exeFile id: iconResource.
    andMask := icon andMask.
    xorMask := icon xorMask.
    self displayImage: imagePen graphicsMedium.
    self displayBits: bitPen graphicsMedium.
    changeFlag := false.
    ^ icon!
  
fromFile: aFileName
        "Private - Answer an icon from aFileName icon file."

    icon := Icon fromFile: aFileName.
    andMask := icon andMask.
    xorMask := icon xorMask.
    self displayImage: imagePen graphicsMedium.
    self displayBits: bitPen graphicsMedium.
    changeFlag := false.
    ^ icon!

grid: anInteger
        "Private - Draw grid lines with anInteger spacing
         on the receiver medium."
    | i len end width height |
    width := xorMask width * scale.
    height := xorMask height * scale.
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
   
initialize
    "Private - Initialize IconEditor"
    super initialize.
    scale := 8.
    bitColor := ClrDefault.
    mode := #color!
 
inverseButton: aButtonPane
        "Private - The inverse button has been selected. "
    mode := #inverse!
   
isInGrid: aPoint
        "Private - Answer true if aPoint is in the grid."
    | gridRectangle |
    gridRectangle := 0 @ 0 extent: (xorMask extent * scale).
    (gridRectangle containsPoint: aPoint)
        ifTrue: [^true]
        ifFalse: [^false]!

open
        "Open an IconEditor window with a new Icon."
    |aIcon|

    aIcon := Icon fromBitmap: (Bitmap width: 32 height: 32 planes: 1 bitCount: 4)
                          andMask: (Bitmap width: 32 height: 32).
    aIcon createMasks.
    self openOn: aIcon.
    andMask := aIcon andMask.
    xorMask := aIcon xorMask.!
 
openIcon
        "Private - User selected Open... from the File menu."
    | dialog file |
    exeFile notNil ifTrue:[exeFile release. exeFile:=nil].
    dialog := FileDialog new.
    dialog title: 'Open Icon';
        addFilter: '*.ico;*.exe;*.dll' description: 'Icon Files (*.ico *.exe *.dll)';
        addFilter: '*.*' description: 'All Files (*.*)';
        open.
    file := dialog file.
    file isNil ifTrue: [^self].
    file fileExtension asUpperCase = 'ICO'
        ifTrue:[self fromFile: file.^self].
    self fromExeFile:file.!

openOn: aWinIcon
        "Open an IconEditor window for aWinIcon object."
    | groupPane size imageSize|
    changeFlag := false.
    icon := aWinIcon.
    self createMasks.
    imageSize := icon extent min: (Display width - 80 // scale @
        (Display height - 20 // scale)).
    imageSize := imageSize * scale + ( 5 @ 5).
    size := 76 @ (300 max: imageSize y).
    self label: 'Icon Editor' ;
        when: #menuBuilt perform: #addFileMenuItem:;
        when: #close perform: #close:;
        owner: self.
    self addSubpane:
        (GraphPane new
            owner: self;
            when: #display perform: #displayImage:;
            style: GraphPane noScrollBarsFrameStyle;
            framingBlock: [: box |
                box origin extent:  (size x @ (box height // 2))]).
    self addSubpane:
        (groupPane := GroupPane new
            framingBlock: [: box |
                box origin x @ (box origin y + (box height // 2))
                    extent:  (size x @ (box height // 2))]).
    groupPane addSubpane:
        (RadioButton new
            owner: self;
            contents: 'Color';
            selection: true;
            when: #clicked perform: #colorButton:;
            framingBlock: [: box |
                (box leftTop rightAndDown: 5 @ 10)
                    extent: (box width @ (box height // 5))]).
   groupPane addSubpane:
        (RadioButton new
            owner: self;
            contents: 'Screen';
            when: #clicked perform: #screenButton:;
            framingBlock: [: box |
                (box leftTop rightAndDown: 5 @ ((box height // 3) + 10))
                    extent: (box width @ (box height // 5))]).
    groupPane addSubpane:
        (RadioButton new
            owner: self;
            contents: 'Inverse';
            when: #clicked perform: #inverseButton:;
            framingBlock: [: box |
                (box leftTop rightAndDown: 5 @ ((box height * 2 // 3) + 10))
                    extent: (box width @ (box height // 5))]).
    self addSubpane:
         (GraphPane new
            owner: self;
            when: #display perform: #displayBits:;
            when: #button1Down perform: #changeBit:;
            when: #button1Move perform: #changeBit:;
            style: GraphPane noScrollBarsFrameStyle;
            when: #getMenu perform: #editMenu:;
            framingBlock: [: box |
                box origin x + (size x @ 0)  extent: (
                    (box width - size x) @ box height)]).
    windowSize := 76 + imageSize x + 2 @
        (( 300 max: imageSize y) + SysFont height + 6).
    self openWindow.
    self menuWindow addMenu: (
        Menu colorMenu: self selector: #colorSelected:)!

openOnFile: aFileName
        "Open an IconEditor window for aFileName icon file ."

    fileName := aFileName.
    icon := Icon fromFile: aFileName.
    andMask := icon andMask.
    xorMask := icon xorMask.
    self openOn: icon.!
  
pasteIcon
        "Private - Paste the graphics from the clipboard
         to the receiver."
    |bitmap aByteArray|
    (bitmap := Clipboard getBitmapWidth: 32 height: 32 ) isNil
        ifTrue: [^self].
    xorMask := bitmap.
    aByteArray := ByteArray new: 128.
    1 to: 128 do:[ :index |
        aByteArray at: index put: 0].

    andMask := Bitmap new width: 32 height: 32 bits: aByteArray.
    self displayImage: imagePen graphicsMedium.
    self displayBits: bitPen graphicsMedium.
    changeFlag := true.!
  
save
        "Private - Save changes to icon object."
   icon xorMask pen copyBitmap: xorMask
        from: xorMask boundingBox
        at: 0 @ 0.
    icon andMask pen copyBitmap: andMask
        from: andMask boundingBox
        at: 0 @ 0!
 
saveIcon
        "Private - User selected Save Icon  from the File menu."
    | dialog file |

    fileName isNil ifTrue:[
        ^ self saveIconAs].
    (Icon fromBitmap: xorMask andMask:andMask) outputToFile: fileName.
    changeFlag := false.!
  
saveIconAs
        "Private - User selected Save Icon As... from the File menu."
    | dialog file |
    dialog := FileDialog new
                        saveTitle: 'Save Icon'
                        fileName: '*.ico'.
    file := dialog file.
    file isNil ifTrue: [^self].
    (Icon fromBitmap: xorMask andMask:andMask) outputToFile: file.
    changeFlag := false!
   
screenButton: aButtonPane
        "Private - The screen button has been selected. "
    mode := #screen!
  
writeToImage
        "Private - User selected Write To Image...
            Write icon to an image selected by the user."
    |anIcon|
    exeFile isNil ifTrue:[^self].
    anIcon:= Icon fromBitmap: xorMask andMask:andMask.
    Icon writeToExeFile: exeFile icon: anIcon
        iconResource:iconResource.
    anIcon release.! !
