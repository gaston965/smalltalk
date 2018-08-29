"Please read 'dashbord.txt' file in this same directory
 about how to install this application.
"!

ViewManager subclass: #Dashboard
  instanceVariableNames: 
    'dials idleSpeed rpmToOil gearRatios accToRpm rpmToFuel timeToTemp clockOn clockString pen dde poked '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants DrawingModeConstants ' !


!Dashboard class methods ! !



!Dashboard methods !
 
accelerator
        "Change accelerator."
    (dials at: #accelerator) changeReading:
        ((dials at: #rpm) reading - idleSpeed
        * (1 / accToRpm)) rounded!
  
changed: aSymbol
        "The dial denoted by aSymbol has been changed,
         notify the other dials then check the temp
         and fuel dials."
    | dial |
    dial := dials at: aSymbol.
    dial lastChange = 0
        ifTrue: [
            self perform: aSymbol.
            dial lastChange = 0
                ifTrue: [^self]].
    dial dependentArray do: [:bSymbol |
        (dials at: bSymbol) lastChange = 0
            ifTrue: [self changed: bSymbol]].
    (dials at: aSymbol) lastChange = 0
        ifFalse: [
            self
                checkFuel;
                checkOverheat]!
   
checkFuel
        "Check whether the fuel is out."
    | aString aDial |
    aDial := dials at: #fuel.
    aDial reading > 0
        ifTrue: [^self].
    aString := 'I''m out of fuel'.
   " (GraphPane notifier: 'W A R N I N G !!'
        content: aString
        at: aDial frame center x - (aString size * SysFontWidth
            * 3 // 2) @ aDial frame bottom
        menu: (Menu labels: 'continue\fillup' withCrs
            lines: #()
            selectors: #(continue fillup))) == #fillup
        ifTrue: [
            (dials at: #fuel) changeReading: 20] "!
  
checkOverheat
        "Check whether it's overheated when
         the temperature dial is changed."
    | aString aDial |
    aDial := dials at: #temp.
    aDial reading > 211
        ifFalse: [^self].
    aString := 'I''m overheating'.
   " (GraphPane notifier: 'W A R N I N G !!'
        content: aString
        at: aDial frame center x - (aString size * SysFontWidth
            * 3 // 2) @ aDial frame bottom
        menu: (Menu labels: 'continue\cool down' withCrs
            lines: #()
            selectors: #(continue cool))) == #cool
        ifTrue: [
            (dials at: #temp) changeReading: 150] "!

clock
        "Toggle the dashboard clock on or off."
        | dial |
    clockOn ifTrue: [
        Time stopTimer: 1 forWindow: self mainView.
        (self menuTitled: '&Clock')
            changeItem: #clock label: 'Off -> On'.
        dial := dials at: #temp.
        pen
            "setBackMix: FmDefault ; "
            blank: (
                (dial frame center x - 24)
                    @ (dial frame bottom + 16) extent: (SysFont width * 8
                     @ (SysFontHeight))).
        clockOn := false]
    ifFalse: [
        Time startTimer: 1 period: 1000 forWindow: self mainView.
        (self menuTitled: '&Clock')
            changeItem: #clock label: 'On -> Off'.
        clockOn := true]!
  
clock: aPane
        "Toggle the dashboard clock on or off."
        | dial |
    clockOn ifTrue: [
        Time stopTimer: 1 forWindow: self mainView.
        (self menuTitled: '&Clock')
            changeItem: #clock label: 'Off -> On'.
        dial := dials at: #temp.
        aPane pen
            "setBackMix: FmDefault ; "
            blank: (
                (dial frame center x - 24)
                    @ (dial frame bottom + 16) extent: 100 @ SysFontHeight).
        clockOn := false]
    ifFalse: [
        Time startTimer: 1 period: 1000 forWindow: self mainView.
        (self menuTitled: '&Clock')
            changeItem: #clock label: 'On -> Off'.
        clockOn := true]!
 
clockEvent: aPane
        "Clock interrupt sensed, update
         time related apparatus."
    | dial aStream |
    dials do: [ :aDial |
        aDial lastChange: 0].
    (dials at: #fuel) increment:
        0 - ((dials at: #rpm) reading * rpmToFuel
        / 60).
    (dial := dials at: #temp) reading <= 150 ifTrue: [
        dial increment: timeToTemp].
    aStream := WriteStream on: (clockString := String new: 8).
    Time now printOn: aStream.
    pen
        setTextAlign: TaTop;
        displayText: aStream contents at:
            dial frame center x - 24 @ (dial frame bottom + 16).
    self checkFuel.
    self checkOverheat!
   
close: aPane
        "Close the model. Turn
         off the clock interrupt."
    clockOn ifTrue: [self clock].
    dde notNil ifTrue: [dde terminate].
    super close!
  
ddeExportItem: item
    "a Client is asking for this item.
     if the server knows about this item then it should export it
         and return true.
     else it should return false."



    ^ false.!
  
display: aPane
    pen erase.
    pen setTextAlign: TaTop.
    self drawPanel: (0 @ 0 extent: pen extent).
    self showReadings!
   
dragAt: point
    self panelChange: point!
 
drawDial: aSymbol
    in: aRectangle
    labeled: aString
    marks: markArray
    scales: scaleInteger
        "Draw dial named aSymbol within
         aRectangle on Display as specified."
    | center font |
    font := SysFont.
    center := aRectangle center "+
        (0 @ 16 (font height) truncated) ".
    (dials at: aSymbol)
        drawDial: aRectangle
            center: center
            radius: (aRectangle width // 2
                    min: aRectangle height // 2)
                    - (font height * 2)
           scales: scaleInteger
           marks: markArray;
        paintLabel: aString
                labelLoc: center x - (aString size / 2 * font width)
                     rounded @ (center y + (font height) - 2)!
 
drawGauge: aSymbol
    in: aRectangle
    labeled: aString
    marks: markArray
    scales: scaleInteger
        "draw the gauge aSymbol within
         aRectangle on Display as specified."
    | center height font |
    font := SysFont.
    height := aRectangle height - (font height) - 4.
    center := (aRectangle width // 2 @ height)
        + aRectangle origin.
    (dials at: aSymbol)
        drawDial: (aRectangle origin
            corner: aRectangle corner x @ center y)
            center: center
            radius: (aRectangle width // 2
                min: height) - 20
            scales: scaleInteger
            marks: markArray;
         paintLabel: aString
             labelLoc: center x - (2 * font width) @
                    (center y + 4 "- font height")!
  
drawGear: aRectangle
        "Draw gear buttons within aRectangle."
    | center font aButton locArray labLocArray labPoint exPoint|
    font := SysFont.
    center := aRectangle width - (font width * 2 * 6) // 2
        @ (aRectangle height // 2 - font height - 4).
    aButton := dials at: #gear.
    exPoint := font width * 2 @ (font height * 2).
    locArray := Array new: 6.
    labLocArray := Array new: 6.
    labPoint := center + (font width // 2 @ (font height // 2)).
    1 to: 6 do: [ :i |
        locArray at: i put:
            center + ((i - 1 * exPoint x) @ 0).
        labLocArray at: i put:
            labPoint + ((i - 1 * exPoint x) @ 0)].
   aButton
        loc: locArray
        size: exPoint
        label: #('P' 'R' 'N' '3' '2' '1')
        labelLoc: labLocArray;
        paintLabel: 'Gear'
           labelLoc: center + aRectangle origin + (exPoint x * 2
                    @ (exPoint y + (font height  // 2)))!
 
drawPanel: box
        "Draw all of the dials and gauges of the dashboard."
    self
        drawGauge: #fuel
            in: (box scaleTo: (0@ 0 extent: 1/3 @ (1/4)))
            labeled: 'Fuel'
            marks: #('E' '1/2' 'F')
            scales: 20/16;
        drawGauge: #temp
            in: (box scaleTo: (1/3 @ 0 extent: 1/3 @ (1/4)))
            labeled: 'Temp'
            marks: #('C' 'N' 'H')
            scales: 300/8;
        drawGauge: #oil
            in: (box scaleTo: (2/3 @ 0 extent: 1/3 @ (1/4)))
            labeled: 'Oil'
            marks: #('0' '30' '60' '90')
            scales: 10;
        drawDial: #mph
            in: (box scaleTo: (0 @ (1/4) extent: 1/2 @ (1/2)))
            labeled: 'mph'
            marks: #('0' '20' '40' '60' '80' '100')
            scales: 140/50;
        drawDial: #rpm
            in: (box scaleTo: (1/2 @ (1/4) extent: 1/2 @ (1/2)))
            labeled: 'rpm/1K'
            marks: #('0' '2' '4' '6' '8' '10')
            scales: 4;
        drawPedal: #accelerator
            in: (box scaleTo: (0 @ (3/4) extent: 1/3 @ (1/4)))
            labeled: 'Accelerator';
        drawPedal: #brake
            in: (box scaleTo: (1/3 @  (3/4) extent: 1/3 @ (1/4)))
            labeled: 'Brake';
        drawGear: (box scaleTo: (2/3 @ (3/4) extent: 1/3 @ (1/4)))!
  
drawPedal: aSymbol
    in: aRectangle
    labeled: aString
        "Draw the pedal named aSymbol as specified."
    | center r font rect |
    font := SysFont.
    rect := aRectangle origin extent:
        aRectangle width @
        (aRectangle height - (font height * 2)).
    r := (rect width min:
        rect height) - 4.
    center := rect left + (rect width - r // 2)
        @ rect bottom.
    (dials at: aSymbol)
        framelessDial: aRectangle
            center: center
            radius: r
            scales: 30/9
            marks: #('0' '1' '2' '3');
        paintLabel: aString
           labelLoc: center x - 4 + ((r - (11 * font width) max: 0)
              // 2) @ (center y + (font height) - 2)!
  
fuel
        "Change fuel reading."!
   
gearReading
        "Answer current gear."
    ^#(0 1 4 3 2 1) at: (dials at: #gear) selection!
   
initDde
        "Private - Initiate a DDE conversation with Excel."
  "  dde := DynamicDataExchange new: self.
    (dde
        initiate: 'Excel'
        topic: 'Sheet1')
            ifFalse: [dde := nil. ^false].
    dde server notNil ifTrue: [
        (dde
            adviseItem: 'R1C1'
            format: DdefmtText) ifFalse: [self halt].
        poked := false.
        ^true].
    dde := nil.
    ^false"

    dde := DDEServer newServer: self application:'Dashboard' topic:'Chevy'.
    dde notNil ifTrue:
    [
        dde addExportedItem: 'rpm' object:0.
        dde addExportedItem: 'mph' object:0.
        dde addExportedItem: 'oil' object:0.
    ]!

initDial: aSymbol
    in: aRectangle
    scaled: anInterval
    lowDegree: lowDegree
    highDegree: highDegree
    dependents: anArray
        "Initialize dial named aSymbol within
         aRectangle on Display as specified."
    dials at: aSymbol put:
        (Dial new
            pen: pen
                frame: aRectangle;
            initDial: anInterval first
                highReading: anInterval last
                lowDegree: lowDegree
                highDegree: highDegree;
            dependentArray: anArray;
            yourself)!
  
initGear: aRectangle
        "Initialize gear buttons within
         aRectangle."
    dials at: #gear put: (
        SwitchButton new
            pen: pen
                frame: aRectangle;
            setSelection: 1;
            dependentArray: #(mph);
            yourself)!
 
initPanel: box
        "Initialize all controls in the dashboard."
    self
        initDial: #fuel
            in: (box scaleTo: (0@ 0 extent: 1/3 @ (1/4)))
            scaled: (0 to: 20 by: 20/16)
            lowDegree: 200
            highDegree: 340
            dependents: #();
        initDial: #temp
            in: (box scaleTo: (1/3 @ 0 extent: 1/3 @ (1/4)))
            scaled:  (0 to: 300 by: 300/8)
            lowDegree: 200
            highDegree: 340
            dependents: #();
        initDial: #oil
            in: (box scaleTo: (2/3 @ 0 extent: 1/3 @ (1/4)))
            scaled: (0 to: 90 by: 10)
            lowDegree: 200
            highDegree: 340
            dependents: #();
        initDial: #mph
            in: (box scaleTo: (0 @ (1/4) extent: 1/2 @ (1/2)))
            scaled: (0 to: 140 by: 140/50)
            lowDegree: 140
            highDegree: 40
            dependents: #(rpm);
        initDial: #rpm
            in: (box scaleTo: (1/2 @ (1/4) extent: 1/2 @ (1/2)))
            scaled: (0 to: 100 by: 4)
            lowDegree: 140
            highDegree: 40
            dependents: #(mph oil accelerator);
        initDial: #accelerator
            in: (box scaleTo: (0 @ (3/4) extent: 1/3 @ (1/4)))
            scaled: (0 to: 30 by: 30/9)
            lowDegree: 315
            highDegree: 360
            dependents: #(rpm);
        initDial: #brake
            in: (box scaleTo: (1/3 @  (3/4) extent: 1/3 @ (1/4)))
            scaled: (0 to: 30 by: 30/9)
            lowDegree: 315
            highDegree: 360
            dependents: #(rpm);
        initGear: (box scaleTo: (2/3 @ (3/4) extent: 1/3 @ (1/4)))!
 
initWindowSize
        "Private - Answer the initial
         window extent."
    ^Display width * 4 // 5 @ Display height * 7 // 8!
 
menu: graphPane
        "Private - Set the graphics pane menu."
        | aString |
     clockOn
        ifTrue: [aString := 'On -> Off']
        ifFalse: [aString := 'Off -> On'].
    graphPane setMenu: ((Menu
        labels: aString
        lines: #()
        selectors: #(clock))
                title: '&Clock';
                owner: self;
                yourself)!
 
mph
        "Change mph reading."
    | dial gear |
    gear := self gearReading.
    dial := dials at: #mph.
    gear == 4            "neutral"
        ifTrue: [^self].
    gear = 0             "park"
        ifTrue: [^dial changeReading: 0].
    dial changeReading:
        ((dials at: #rpm) reading *
        (gearRatios at: gear)) rounded.
        dde updateExportedItem: 'mph' object: dial reading * 100 // 140.!
   
oil
        "Change oil reading."
    (dials at: #oil) changeReading:
        ((dials at: #rpm) reading *
            rpmToOil) rounded.
        dde updateExportedItem: 'oil' object: (dials at: #oil) reading!
   
open
        "Open a dashboard for Chevrolet
         and initialize coefficients."
    idleSpeed := 10.
    accToRpm := 80 / 30.
    rpmToOil := 110 / 90.
    gearRatios := Array
        with: 40/90 with: 60/90 with: 100/90.
    rpmToFuel := 1 / 20.
    timeToTemp := 40 / 60.
    clockOn := false.
    self open: 'Chevrolet'.
    self initDde!
   
open: aString
        "Open a control panel with the
         label aString."
    self
        label: aString;
        owner: self.
    self mainView
       " foreColor: ClrBlack;
        backColor: ClrWhite;  "
        when: #timer perform: #clockEvent:;
        when: #close perform: #close:.
    self addSubpane:
        (GraphPane new
            owner: self;
            when: #getContents perform: #panel: ;
            when: #getMenu perform: #menu: ;
            when: #display perform: #display: ;
            stretch: 1;
            when: #button1Down perform: #panelChange: ;
            when: #button1Move perform: #panelChange: ;
            when: #button1Up perform: #panelChange: ;
            when: #resize perform: #resizePanel:;
            framingBlock: [:box| box]).
    self openWindow!
  
panel: graphPane
        "Initialize and draw all of the dials and
         gauges of the dashboard."
    | box |
    pen := graphPane pen.
    pen setDrawingMode: DmDraw.
    box := 0 @ 0 extent: pen extent.
    dials := Dictionary new: 7.
    self initPanel: box.
    (dials at: #fuel) setReading: 20.
    self display: graphPane.
    clockOn isNil
        ifTrue: [clockOn := false]!
  
panelChange: graphPane
        "Find the apparatus containing the current mouse location
         and change its reading."
    | dial point int |
    point := graphPane mouseLocation.
    dials associationsDo: [ :assoc |
        ((dial := assoc value) contains: point)
            ifTrue: [
                int := Process enableInterrupts: false.   "needed so
                    wmPaint msg won't interfere"
                dials do: [ :aDial |
                    aDial lastChange: 0].
                dial setToPoint: point.
                assoc key = #mph ifTrue: [
                    dde updateExportedItem: 'mph' object: (dial reading * 100 // 140) rounded].
                assoc key = #rpm ifTrue: [
                    dde updateExportedItem: 'rpm' object: (dial reading "* 100") rounded].
                assoc key = #oil ifTrue: [
                    dde updateExportedItem: 'oil' object: (dial reading) rounded].
                dial lastChange = 0 ifFalse: [
                    self changed: assoc key].
                Process enableInterrupts: int.
                ^self]]!
   
reframe: aRect with: aPane
    aPane form: nil!

resizePanel: aPane
        "The receiver has just been resized, resize all the
           controls accordingly."
    | box |
    dials isNil ifTrue: [^nil].
    box := aPane rectangle.
    (dials at: #fuel)
        reframe: (box scaleTo: (0@ 0 extent: 1/3 @ (1/4))).
    (dials at: #temp)
        reframe: (box scaleTo: (1/3 @ 0 extent: 1/3 @ (1/4))).
    (dials at: #oil)
        reframe: (box scaleTo: (2/3 @ 0 extent: 1/3 @ (1/4))).
    (dials at: #mph)
        reframe: (box scaleTo: (0 @ (1/4) extent: 1/2 @ (1/2))).
    (dials at: #rpm)
        reframe: (box scaleTo: (1/2 @ (1/4) extent: 1/2 @ (1/2))).
    (dials at: #accelerator)
         reframe: (box scaleTo: (0 @ (3/4) extent: 1/3 @ (1/4))) .
    (dials at: #brake)
        reframe: (box scaleTo: (1/3 @  (3/4) extent: 1/3 @ (1/4))).
    (dials at: #gear)
        reframe: (box scaleTo: (2/3 @ (3/4) extent: 1/3 @ (1/4)))!
  
rpm
        "Change rpm reading."
    | dial gear |
    gear := self gearReading.
    dial := dials at: #rpm.
    (gear == 0 or: [gear == 4 or: [(dials at: #mph) lastChange = 0]])
        ifTrue: [     "park/neutral"
            dial changeReading:
                ((dials at: #accelerator) reading
                - (dials at: #brake) reading
                * accToRpm) rounded + idleSpeed]
        ifFalse: [
            dial changeReading:
                ((dials at: #mph) reading *
                (1 / (gearRatios at: gear))) rounded].
        dde updateExportedItem: 'rpm' object: dial reading" * 100".!
  
showReadings
    dials do: [:each |
        (each isKindOf: Scale)
            ifTrue: [each drawNeedle]
            ifFalse: [each reverseSelection]]! !
