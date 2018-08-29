
WindowDialog subclass: #ObjectLoadDialog
  instanceVariableNames: 
    'description sourceTitle sourceList destTitle destList showCancel loadMap finalLoadMap clientExtentDlg listRect listColumns lineHeight '
  classVariableNames: 
    'Platform ChildFrameStyle '
  poolDictionaries: 
    'ColorConstants GraphicsConstants ' !


!ObjectLoadDialog class methods !

availableListHeight
        " Private - answer the height in screen points that
        is available for use by the variable lists and their
        titles in order to ensure that the Ok/Cancel buttons
        are visible.  Estimate size of caption, borders, and
        description text at 7 lines. "
    ^Display height - (7 * SysFont height)!
 
initialize
        " Private - initialize platform-dependent constants.
        (Portability workaround due to lack to common
        system constants dictionary that maps to platform.
        Objective here is source-code portability.) "
    | product hostConstants |

    Platform := nil.
    product := Smalltalk product.
    (product = 'Smalltalk/V Windows')
        ifTrue: [
            Platform := 'VW'.
            hostConstants := Smalltalk at: #WinConstants].
    (product = 'Smalltalk/V PM')
        ifTrue: [
            Platform := 'VPM'.
            hostConstants := Smalltalk at: #PMConstants].
    Platform isNil ifTrue: [self error: 'unknown Smalltalk/V product'].

    " instance method childFrameStyle "
    Platform = 'VW'
        ifTrue: [ChildFrameStyle :=
            (hostConstants at: 'WsChild')   |
            (hostConstants at: 'WsVisible') |
            (hostConstants at: 'WsClipsiblings') |
            (hostConstants at: 'WsClipchildren')].
    Platform = 'VPM'
        ifTrue: [ChildFrameStyle :=
            (hostConstants at: 'FcfNobytealign')].!
   
maximumListSize
        " Answer the maximum number of source or
        destination variables that can be displayed
        in an ObjectLoadDialog on this system. "
    ^(self availableListHeight // self basicNew labelFont height)
        - 1  " exclude title line "!
   
new
    ^super new initialize! !



!ObjectLoadDialog methods !

cancel: aPane
        " Private - user pressed Cancel button "
    loadMap := nil.
    self close.!
  
childFrameStyle
        " Private - my child windows have no scrollbars, no border "
    ^ChildFrameStyle  " factored to class var for portability "!
 
computeExtentOf: anArrayOfStrings title: title
        " Private - Answer the extent of a bounding box
        which contains a vertical list of anArrayOfStrings
        under the title. "
    | font width |
    font := self labelFont.
    width := font stringWidth: title.
    anArrayOfStrings do: [ :aString |
        width := width max: (font stringWidth: aString)].
    ^width @ ((1 + anArrayOfStrings size) * font height)!

createClientArea
        " Private - compute client area layout and create windows.
        Answer whether successful (need enough screen space).
        The graph pane layout for the instance variable load map
        is computed in screen points.  However, all the window
        sizing has to be done in dialog box units.  So
        normalize everything into character box units and do
        lots of ugly conversions from points to dialog box units. "
    | windowLabel charWidthDlg lineHeightDlg
      margin marginDlg gutter
      sourceListExtent destListExtent
      descrWidthDlg descrExtentDlg
      oneButtonExtentDlg buttonsExtentDlg
      topPane |

    windowLabel := 'Object Load Map'.

    charWidthDlg := WindowDialog charWidth.
    lineHeightDlg := WindowDialog charHeight.

    margin := WindowDialog dialogUnit x.
    marginDlg := WindowDialog charWidth.
    gutter := margin * 4.
    lineHeight := WindowDialog dialogUnit y.

    " compute the internal load map pane layout in points "
    sourceListExtent := self extentRounded:
        (self computeExtentOf: sourceList title: sourceTitle).
    destListExtent := self extentRounded:
        (self computeExtentOf: destList title: destTitle).
    listColumns := Array new: 4.
    listColumns   " ASSERT [Rectangle leftTopUnit x = 0] "
        at: 1 put: margin;  " left margin of source var list "
        at: 2 put: ((listColumns at: 1) right: sourceListExtent x);  " source var plugs "
        at: 3 put: ((listColumns at: 2)
                    right: (self plugExtent x + gutter));   " dest var sockets "
        at: 4 put: ((listColumns at: 3)
                    right: self socketExtent x).  " dest vars "
    listRect :=
        0 @ 0
        extent: (self extentRounded:
            (((listColumns at: 4) right: (destListExtent x + margin))
            @ (sourceListExtent y max: destListExtent y))).

    " make sure there's enough screen real estate to see buttons "
    (listRect height > self class availableListHeight)
        ifTrue: [
            MessageBox
                notify: windowLabel
                withText: 'Not enough screen space: ', description.
            ^false].

    " compute overall window layout in dialog box units "
    descrWidthDlg := description size * charWidthDlg.
    descrExtentDlg :=
        (descrWidthDlg @ lineHeightDlg) + (2 * marginDlg).
    oneButtonExtentDlg :=
        (('Cancel' size * charWidthDlg) @ lineHeightDlg)
        + marginDlg.
    buttonsExtentDlg :=
        ((3 * marginDlg) + (2 * oneButtonExtentDlg x))
        @ ((2 * marginDlg) + oneButtonExtentDlg y).
    clientExtentDlg :=
        (((((windowLabel size * charWidthDlg)
            max: descrExtentDlg x)
            max: (self widthInDialogUnits: listRect width))
            max: buttonsExtentDlg x) + marginDlg) " PM width fudge "
        @ (descrExtentDlg y + 2  " need top fudge factor for list??"
                + (self heightInDialogUnits: listRect height)
                + buttonsExtentDlg y).

    self addView:
        (topPane := self topPaneClass new
            owner: self;
            labelWithoutPrefix: windowLabel
            "Disable, not yet supported (VW 1.1/VPM 1.3 bug):
            when: #close perform: #close:
            "
            ).

    topPane addSubpane:
        (StaticText new
            contents: description;
            framingBlock: [ :box |
                (box leftTop rightAndDown: marginDlg)
                extentFromLeftTop: (descrWidthDlg @ lineHeightDlg)]).

    topPane addSubpane:
        (GraphPane new
            owner: self;
            style: self childFrameStyle;
            when: #getContents perform: #display:;
            when: #display perform: #display:;
            when: #button1Up perform: #select:;
            framingBlock: [ :box |
                 Rectangle
                    leftTop: (box leftTop down: descrExtentDlg y)
                    rightBottom: (box rightBottom up: buttonsExtentDlg y)]).

    topPane addSubpane:
        (Button new
            defaultPushButton;
            owner: self;
            contents: 'OK';
            when: #clicked perform: #ok:;
            framingBlock: [ :box |
                (box leftBottom rightAndUp: marginDlg)
                extentFromLeftBottom: oneButtonExtentDlg]).
    showCancel ifTrue: [topPane addSubpane:
        (Button new
            pushButton;
            owner: self;
            contents: 'Cancel';
            when: #clicked perform: #cancel:;
            framingBlock: [ :box |
                (box leftBottom rightAndUp:
                    (2 * marginDlg + oneButtonExtentDlg x) @ marginDlg)
                extentFromLeftBottom: oneButtonExtentDlg])].
    ^true!

display: graphPane
        "Private - Display source and dest instance variable lists. "
    | pen |
    pen := graphPane pen.
    pen foreColor: ClrBlack.
    self
        displayList: sourceList
            title: sourceTitle
            at: ((listColumns at: 1) @ listRect top)
            with: pen;
        displayList: destList
            title: destTitle
            at: ((listColumns at: 4) @ listRect top)
            with: pen;
        displayLoadMap: graphPane.!

displayConnectorFrom: leftTopPlug to: leftTopSocket with: pen color: color
        " Private - display connector from plug to socket "
    | halfHeight start end |
    halfHeight := lineHeight // 2.
    start := leftTopPlug
        rightAndDown: ((self plugExtent x + 1) @ halfHeight).
    end := leftTopSocket
        rightAndDown: ((halfHeight - 4) @ halfHeight).
    pen
        setLineWidth: 3;
        foreColor: color;
        place: start; 
        goto: end.!
 
displayList: list title: titleString at: leftTop with: pen
        " Private - display list of strings "
    | loc |
    loc := leftTop down: (lineHeight - self labelFont descender).
    pen displayText: titleString at: loc.
    loc := loc down: lineHeight.
    list do: [ :aString |
        pen displayText: aString at: loc.
        loc := loc down: lineHeight].!

displayLoadMap: graphPane
        "Private - Display plugs and sockets for inst var wiring."
    | pen top leftTopPlug leftTopSocket color sourceIndex |

    pen := graphPane pen.
    top := listRect top down: lineHeight.

    leftTopPlug := (listColumns at: 2) @ nil.  " y is set below "
    leftTopSocket := (listColumns at: 3) @ top.
    1 to: loadMap size do: [ :i |
        sourceIndex := loadMap at: i.
        color := (sourceIndex isNil ifTrue: [ClrRed] ifFalse: [ClrGreen]).
        self displaySocketAt: leftTopSocket with: pen color: color.
        sourceIndex notNil ifTrue: [
            leftTopPlug y: (top down: ((sourceIndex - 1) * lineHeight)).
            self
                displayPlugAt: leftTopPlug
                with: pen color: color.
            self
                displayConnectorFrom: leftTopPlug to: leftTopSocket
                with: pen color: color].
        leftTopSocket := leftTopSocket down: lineHeight].

    leftTopPlug := (listColumns at: 2) @ top.
    1 to: sourceList size do: [ :i |
        (loadMap includes: i)
            ifFalse: [self displayPlugAt: leftTopPlug with: pen color: ClrRed].
        leftTopPlug := leftTopPlug down: lineHeight].!
   
displayPlugAt: leftTop with: pen color: color
        " Private - display source variable plug "
    | rect points |
    rect := leftTop extentFromLeftTop: self plugExtent.
    points := Array
        with: (rect leftTop rightAndDown: 2)
        with: (rect leftBottom rightAndUp: 2)
        with: (rect rightTop down: (rect height // 2)).
    self displayPolygon: points with: pen color: color.!

displayPolygon: points with: pen color: color
        " Private - display filled polygon with pen. "
    "DISABLE: border painting looks tacky on VPM [DJL 20-Feb-92]
    self platform = 'VPM'
        ifTrue: [  
            pen
                setLineWidth: 5;
                foreColor: ClrDarkgray;
                setLineEnd: LineEndRound;  // kludge for setLineJoin: LinejoinRound//
                polygon: points;
                setLineEnd: LineEndDefault;
                foreColor: color].
    self platform = 'VW'
        ifTrue: [pen foreColor: ClrDarkgray].
    "
    pen
        setLineWidth: 1;
        foreColor: color;
        setFillColor: color;
        polygonFilled: points.!
  
displaySocketAt: leftTop with: pen color: color
        " Private - display destination variable socket "
    |  rect halfHeight points |
    rect := leftTop extentFromLeftTop: self socketExtent.
    halfHeight := rect height // 2.
    points := Array new: 5.
    points
        at: 1 put: (rect leftTop down: 2);
        at: 2 put: (rect rightTop leftAndDown: (3 @ 2));
        at: 3 put: (rect rightBottom leftAndUp: (3 @ 2));
        at: 4 put: (rect leftBottom up: 2);
        at: 5 put: (rect leftTop rightAndDown:
                            ((halfHeight - 2) @ halfHeight)).
    self displayPolygon: points with: pen color: color.!
 
eraseLoadMap: graphPane
        "Private - Erase loadMap area of graphPane."
    graphPane pen
        fill: (Rectangle
            leftTop: ((listColumns at: 2) @ listRect top)
           rightBottom: ((listColumns at: 4) @ listRect bottom))
        color: ClrBackground!
  
extentRounded: extentInPoints
        " Private - answer extentInPoints rounded up to the
        next character boundary. "
    | charBoxPts nCharsWide nLines |
    charBoxPts := WindowDialog dialogUnit.
    nCharsWide := extentInPoints x // charBoxPts x.
    (extentInPoints x \\ charBoxPts x) > 0
        ifTrue: [nCharsWide := nCharsWide + 1].
    nLines := extentInPoints y // charBoxPts y.
    (extentInPoints y \\ charBoxPts y) > 0
        ifTrue: [nLines := nLines + 1].
    ^(nCharsWide @ nLines) * WindowDialog dialogUnit!
 
heightInDialogUnits: heightInPoints
        " Private - answer heightInPoints as a height in
        in dialog box units, rounded up to the next
        character box boundary. "
    | charHeightPts nLines |
    charHeightPts := WindowDialog dialogUnit y.
    nLines := heightInPoints // charHeightPts.
    (heightInPoints \\ charHeightPts) > 0
        ifTrue: [nLines := nLines + 1].
    ^nLines * WindowDialog charHeight!

indexOfPlug: aPoint
        " Private - answer the source list index corresponding
        to the plug at aPoint. "
    ^self
        indexOfShapeAt: aPoint
        numShapes: sourceList size
        left: (listColumns at: 2)
        width: self plugExtent x!
  
indexOfShapeAt: aPoint
    numShapes: numShapes
    left: left
    width: width
        " Private - answer the index corresponding
        to the plug or socket shape at aPoint.
        There are numShapes stacked vertically
        in listRect starting at left border."
    | top rect |
    top := listRect top down: lineHeight.
    rect := left @ top
        extentFromLeftTop: (width @ (numShapes * lineHeight - 1)).
    (rect containsPoint: aPoint)
        ifFalse: [^nil].
    ^((top - aPoint y) abs // lineHeight) + 1!
  
indexOfSocket: aPoint
        " Private - answer the dest list index corresponding
        to the socket at aPoint "
    ^self
        indexOfShapeAt: aPoint
        numShapes: destList size
        left: (listColumns at: 3)
        width: self socketExtent x!
 
initialize
        " Private - initialize new instance"
    super initialize.
    showCancel := true.!
   
initLoadMap
        " Private - install a default load map based on names. "
    | sourceSlots destSize |
    destSize := destList size.
    sourceSlots := Dictionary new.
    1 to: sourceList size do: [ :i |
        sourceSlots at: (sourceList at: i) put: i].
    loadMap := Array new: destSize.
    1 to: destSize do: [ :i |
        loadMap at: i
            put: (sourceSlots at: (destList at: i) ifAbsent: [nil])].!
   
initWindowSize
        " Answer the initial window extent of the client
        area in dialog box units. "
    ^clientExtentDlg!

labelFont
        " Private - answer font for displaying my labels "
    ^SysFont!

ok: aPane
        " Private - user pressed OK button. "
    finalLoadMap := loadMap.  " workaround for missing close event "
    self close.!

openFor: descriptionString
    sourceTitle: sourceTitleString
    sourceVars: sourceArrayOfStrings
    destTitle: destTitleString
    destVars: destArrayOfStrings
        " Open an ObjectLoadDialog.  The descriptionString
        is an information line at the top of the dialog.
        There are two stacks of zero or more instance variable
        names, source and dest, in a column under a title.
        Answer a load map for the destination variables.
        The load map is an array indexed by a destination
        instance variable index (slot index) containing
        a source instance variable index (slot number) or nil
        to load into that destination instance variable. "

    description := descriptionString.
    sourceTitle := sourceTitleString.
    sourceList := sourceArrayOfStrings.
    destTitle := destTitleString.
    destList := destArrayOfStrings.

    self initLoadMap.
    showCancel ifFalse: [finalLoadMap := loadMap].
            " workaround for not being able to catch/disable close "
    (self createClientArea)
        ifFalse: [^loadMap := nil].
    self openWindow.
    "Disable (close event not yet supported): ^loadMap"
    ^finalLoadMap!
  
platform
        " Private - answer whether running on VPM or VW.
        Used to implement platform compatibility workarounds. "
    ^Platform!
 
plugExtent
        " Private - answer the area within which a plug shape
        is drawn. "
    ^WindowDialog dialogUnit x @ lineHeight!

select: graphPane
        " Private - handle button1Up in inst var lists "
    | startPoint endPoint sourceIndex destIndex |
    startPoint := graphPane mouseLocation.
    sourceIndex := self indexOfPlug: startPoint.
    sourceIndex notNil ifTrue: [
        endPoint := self trackToDestFrom: startPoint in: graphPane.
        endPoint isNil ifTrue: [^self].  " ignore buttonup outside pane "
        destIndex := self indexOfSocket: endPoint.
        destIndex isNil ifTrue: [
            destIndex := loadMap indexOf: sourceIndex.
            (destIndex ~= 0)
                ifTrue: [loadMap at: destIndex put: nil]]
        ifFalse: [
            loadMap at: destIndex put: sourceIndex]]
    ifFalse: [
        destIndex := self indexOfSocket: startPoint.
        destIndex isNil ifTrue: [^self].
        endPoint := self trackToDestFrom: startPoint in: graphPane.
        endPoint isNil ifTrue: [^self].
        sourceIndex := self indexOfPlug: endPoint.
        loadMap at: destIndex put: sourceIndex].
    self
        eraseLoadMap: graphPane;
        displayLoadMap: graphPane.!
   
showCancel: aBoolean
    showCancel := aBoolean!
   
socketExtent
        " Private - answer the area within which a plug shape
        is drawn. "
    ^(WindowDialog dialogUnit x * 2) @ lineHeight!

trackClipCursor: aPen to: aWindow
        " Private - restrict the cursor to aWindow.
         Specifying nil clears clipping. 
        This is only supported properly on Windows.
        On VPM, we clip display, but can't restrict the
        actual cursor movement. "
    | clippingRegion |
    self platform = 'VW'
        ifTrue: [
            clippingRegion := (aWindow isNil
                ifTrue: [nil]
                ifFalse: [
                    (Smalltalk at: #WinRectangle) fromRectangle:
                        (aWindow rectangle mapClientToScreen: aWindow)]).
            (Smalltalk at: #UserLibrary) 
                clipCursor: clippingRegion asParameter.
            ^self].
    "VPM implementation"
    self platform = 'VPM'
        ifTrue: [
            clippingRegion := (aWindow isNil
                ifTrue: [nil]
                ifFalse: [aPen createRegion: 
                        ((0@0 extent: aWindow extent) 
                              mapClientToScreen: aWindow)]).
            aPen setClipRegion: clippingRegion].!
 
trackToDestFrom: aPoint in: graphPane
        " Private - track mouse until a buttonUp occurs and
        answer the point at which buttonUp occurred.
        Answer nil if buttonUp was outside graphPane.
        Tracking is done in desktop coordinates. "
    | origin dest nextDest pen targetWindow |

    graphPane captureMouseInput.
    pen := Display pen.
    pen
        setLineWidth: 1;
        foreColor: ClrBlack;
        setLineType: LineTypeSolid;     
        setForegroundMode: MixRuleInvertSurface.  " MixRuleNotXor?? "
    self trackClipCursor: pen to: graphPane parent.

    origin := aPoint mapClientToScreen: graphPane.
    dest := origin.
    pen place: origin; goto: dest.
    Notifier consumeInputUntil: [ :event |
        nextDest := Cursor sense.
        (dest = nextDest)
            ifFalse: [
                pen
                    place: origin; goto: dest;
                    place: origin; goto: nextDest.
                dest := nextDest].
        event selector = #button1Down:].
    targetWindow := CursorManager windowUnderCursor.
    Notifier consumeInputUntil: [ :event |
        event selector = #button1Up:].
    pen place: origin; goto: dest.

    pen
        setLineType: LineTypeDefault;
        setForegroundMode: MixRuleDefault.
    self trackClipCursor: pen to: nil. 
    graphPane clearMouseCapture.
   CurrentEvents := OrderedCollection new.

    dest := dest mapScreenToClient: graphPane.
    ^((0 @0 extent: graphPane rectangle extent)  " PM wierdness "
            containsPoint: dest)
        ifTrue: [dest]
        ifFalse: [nil]!
   
widthInDialogUnits: widthInPoints
        " Private - answer widthInPoints as a width in
        in dialog box units, rounded up to the next
        character box boundary. "
    | charWidthPts nChars |
    charWidthPts := WindowDialog dialogUnit x.
    nChars := widthInPoints // charWidthPts.
    (widthInPoints \\ charWidthPts) > 0
        ifTrue: [nChars := nChars + 1].
    ^nChars * WindowDialog charWidth! !
