
MDIViewManager subclass: #MDIDemo
  instanceVariableNames: 
    'foreColors '
  classVariableNames: 
    'MapDictionary MDIDemoDirectory '
  poolDictionaries: 
    'ColorConstants WinConstants VirtualKeyConstants '  !


!MDIDemo class methods !
 
buildMapDictionary
        "Private - Build map dictionary"

    MapDictionary :=
        StringDictionaryReader createIdDictionary:MDIDemoDirectory,'mdidemo.h'.
    (StringDictionaryReader createIdDictionary:MDIDemoDirectory,'vwhelp.h')
        associationsDo:[:each |
            MapDictionary add: each].!
 
directory: aPath
        "Set the MDIDemoDirectory class variable to aPath.
        This path is used to find the help files and the bitmap
        files. The MDIDemo directory must have a subdirectory HELP
        where mdidemo.hlp and vwhelp.hlp are"
        "Example : extras\mdi\mdidemo\"
    MDIDemoDirectory := aPath!
   
mapDictionary

    ^MapDictionary!

mdiMenu
        "Private - Answer the standard MDI Window menu "
    ^MDIMenu new
        appendItem: '&New Window' selector:#mdiNewWindow accelKey:$n accelBits:AfControl;
        appendItem: '&Cascade	Shift+F5' selector: #mdiCascade accelKey: VkF5 accelBits: AfVirtualkey|AfShift ;
        appendItem: '&Tile	Shift+F4' selector: #mdiTile accelKey: VkF4 accelBits: AfVirtualkey|AfShift ;
        appendItem: 'Arrange &Icons' selector: #mdiArrange;
        appendItem: 'Close &All' selector: #mdiCloseAll;
        title: '&Window'.!
 
optionMenu
        "Private - Answer the option menu"
    ^Menu new
        appendItem: '&StatusPane' selector:#toggleStatusPane;
        appendItem: '&ToolPane' selector:#toggleToolPane;
        title: '&View'.! !



!MDIDemo methods !
   
childActivate:aPane
        "Private - Update the StatusPane. Shows
        the label of the active MDI document"
    |mdiActive|
    (mdiActive := self frame mdiGetActive) notNil ifTrue:[
        (self statusPane statusBoxAt: #status) contents: mdiActive label].!
   
childClose:aPane
        "Private - Update the StatusPane.
        If there is no more document, erase the StatusBox #status"

    self frame mdiGetActive isNil ifTrue: [
        (self statusPane statusBoxAt: #status) contents: ''].!
  
close:aPane
        "Private - Close the receiver application"
    Smalltalk isRunTime
        ifTrue: [
            (MessageBox confirm: 'Are you sure you want to exit?')
                ifTrue: [
                    self close.
                    ^Smalltalk exit]
                ifFalse: [
                    ^self]]
        ifFalse: [
            ^self close].!
  
comboBox: aComboBox
        "Private - Set the combobox contents"

    aComboBox contents:#('Black' 'Dark Green' 'Yellow' 'Red' 'Blue').
    aComboBox selection: 1.
    foreColors := (Array new: 5)
                            at: 1 put: ClrBlack;
                            at: 2 put: ClrDarkgreen;
                            at: 3 put: ClrYellow;
                            at: 4 put: ClrRed;
                            at: 5 put: ClrBlue;
                            yourself.!
  
doc1
        "Private - Open an MDI Child document1"

    |child|
    self addView: (child :=
        MDIChild new
            frame:self frame;
            owner:self;
            label:'Green Document').

    child  addSubpane:(
        TextPane new
            owner:self;
            backColor: ClrDarkgreen;
            foreColor: (foreColors at: (self paneAt: #comboBox:) selection)).
    child openWindow.!

doc2
        "Private - Open an MDI Child document2"

    |child|
    self addView: (child :=
        MDIChild new
            frame:self frame;
            owner:self;
            label:'Yellow document').

    child  addSubpane:(
        TextPane new
            owner:self;
            backColor: ClrYellow;
            foreColor: (foreColors at: (self paneAt: #comboBox:) selection)).
    child openWindow.!
  
drawButtonDownAt: aPoint with: aPen
        "Private - Draw a push button in down state"

    aPen roundRect: (aPoint extent: 37 @ 37) corner: 2 @ 2.

    aPen fill: ((aPoint rightAndDown: 1 @ 1) extent: 1 @ 35) color: WinInfo colorButtonShadow.
    aPen fill: ((aPoint rightAndDown: 1 @ 1) extent: 35 @ 1) color: WinInfo colorButtonShadow.!
 
drawButtonUpAt: aPoint with: aPen
        "Private - Draw a push button in up state"

    aPen roundRect: (aPoint extent: 37 @ 37) corner: 2 @ 2.

    aPen fill: ((aPoint rightAndDown: 1 @ 1) extent: 1 @ 35) color: WinInfo colorButtonHighlight.
    aPen fill: ((aPoint rightAndDown: 2 @ 2) extent: 1 @ 34) color: WinInfo colorButtonHighlight.
    aPen fill: ((aPoint rightAndDown: 1 @ 1) extent: 35 @ 1) color: WinInfo colorButtonHighlight.
    aPen fill: ((aPoint rightAndDown: 2 @ 2) extent: 34 @ 1) color: WinInfo colorButtonHighlight.
    aPen fill: ((aPoint rightAndDown: 35 @ 1) extent: 1 @ 35) color: WinInfo colorButtonShadow.
    aPen fill: ((aPoint rightAndDown: 34 @ 2) extent: 1 @ 34) color: WinInfo colorButtonShadow.
    aPen fill: ((aPoint rightAndDown: 2 @ 34) extent: 34 @ 1) color: WinInfo colorButtonShadow.
    aPen fill: ((aPoint rightAndDown: 1 @ 35) extent: 35 @ 1) color: WinInfo colorButtonShadow.!
 
exit
        "Private - Close all the documents and close the frame"

    self close: self mainView.!

fileMenu
        "Private - Answer the receiver's fileMenu"
    ^Menu new
        appendItem: '&Green document' selector: #doc1 ;
        appendItem: '&Yellow document' selector: #doc2;
        appendSeparator ;
        appendItem: '&Exit' selector: #exit ;
        title: '&Demo'.!
   
mdiMenu:anMDIFrame
        "Private - Create the menuBar for the frame"

    anMDIFrame mdiMenuWindow addMenu:self class optionMenu owner:self.
    anMDIFrame mdiMenuWindow addMenu:self class mdiMenu owner:self.!

menu: anMDIFrame
        "Private - Build the file menu"

    anMDIFrame menuWindow addMenu: self  fileMenu owner:self.!
 
open
        "Create an MDIDemo application."
    |hm toolPane|
    self
        addView: (self frame:(
            MDIFrame new
                owner: self;
                when: #mdiMenuBuilt perform: #mdiMenu:;
                when: #childActivate perform: #childActivate:;
                when: #childClose perform: #childClose:;
                when: #close perform: #close:;
                label: 'MDIDemo';
                when: #menuBuilt perform: #menu:)).
    self
        addSubpane:(
            StatusPane new
                owner: self;
                fixedSize;
                leftJustified;
                height: 45;
                inset: 6;
                when: #doubleClicked perform: #statusPaneDoubleClicked:;
                when: #getContents perform: #statusPane:).
    self
        addSubpane:(toolPane :=
            (ToolPane new
                owner: self;
                height: 45;
                when: #doubleClicked perform: #toolPaneDoubleClicked:;
                when: #getContents perform:#toolPane:)).
    toolPane
        addSubpane:(
            ComboBox new
            font: (Font face:'Helv' size:0 @ 8 fixedWidth:false);
            dropDownList;
            when: #select perform: #selectColor:;
            when: #getContents perform: #comboBox:;
            framingBlock:[:box | 2 @ 8 extent: 100 @ 200]).

    hm := HelpManager
        for: self mainView
        title: nil
        file:MDIDemoDirectory,'mdidemo.hlp'.
    hm map: MapDictionary.
    self openWindow.
    self toggleMenu:'&View' item:#toggleStatusPane.
    self toggleMenu:'&View' item:#toggleToolPane.!

selectColor: aComboBox
        "Private - A Color has been selected"
    |mdiChild|
    mdiChild := self frame mdiGetActive.
    mdiChild isNil ifTrue: [^self].

    mdiChild searchForDefaultTextPane foreColor: (foreColors at: (self paneAt: #comboBox:) selection).
    mdiChild searchForDefaultTextPane invalidateRect: nil.!
 
statusPane: aStatusPane
        "Private - Set the StatusPane contents"

    | statusBoxes |
    statusBoxes := OrderedCollection new
                                    add: ( StatusBox new
                                        space: aStatusPane font width;
                                        width: Display width // 3;
                                        name: #status);
                                    add: ( StatusBox new
                                        space: aStatusPane font width * 2;
                                        width: Display width // 3;
                                        name: #mdidemo);
                                    yourself.

    aStatusPane contents: statusBoxes.!
  
statusPaneDoubleClicked: aStatusPane
        "Private - The user has double-clicked on the StatusPane"

    MessageBox message: 'This is a StatusPane Demonstration'!

statusPaneHelp:aKey
    "Private - Answer the hint text to the StatusPane"

    ^HelpMDIDemo at:aKey ifAbsent:[^super statusPaneHelp:aKey].!
 
toggleMenu: menuName item: itemName
    "Private - Toggle the selected menu item"

    | theMenu aBoolean|

    theMenu := self frame menuWindow menuTitled: menuName.
    (aBoolean:=theMenu isChecked:itemName)
        ifTrue: [self frame uncheckItem:itemName forAllMDIChildMenus:menuName]
        ifFalse: [self frame checkItem:itemName forAllMDIChildMenus:menuName].

    ^aBoolean!
   
toggleStatusPane
        "Private - Show/Hide the StatusPane."

        self toggleMenu:'&View' item:#toggleStatusPane.
        self statusPane show.
        self mdiArrange.!

toggleToolPane
        "Private - Show/Hide the ToolPane"

        self toggleMenu:'&View' item:#toggleToolPane.
        self toolPane show.
        self mdiArrange.!
 
toolPane:aPane
        "Private - Set the ToolPane contents"
    |aToolCollection aTool bmp rect|

    aToolCollection:=OrderedCollection new.

    bmp := Bitmap screenExtent: 76 @ 38.
    bmp pen backColor: WinInfo colorButtonFace.
    bmp pen erase.

    self drawButtonUpAt: 0 @ 0 with: bmp pen.
    self drawButtonDownAt: 38 @ 0 with: bmp pen.
    bmp pen place: 19 @ 19.
    bmp pen backColor: ClrDarkgreen.
    bmp pen circleFilled: 15.
    bmp pen place: 57 @ 19.
    bmp pen backColor: ClrRed.
    bmp pen circleFilled: 15.

    aTool:=Tool fromBitmap: bmp.
    aTool selector:#doc1;owner:self;extent: 38 @ 38;space: 110.
    aToolCollection add:aTool.

    bmp := Bitmap screenExtent: 76 @ 38.
    bmp pen backColor: WinInfo colorButtonFace.
    bmp pen erase.
    self drawButtonUpAt: 0 @ 0 with: bmp pen.
    self drawButtonDownAt: 38 @ 0 with: bmp pen.
    bmp pen place: 19 @ 19.
    bmp pen backColor: ClrYellow.
    bmp pen circleFilled: 15.
    bmp pen place: 57 @ 19.
    bmp pen backColor: ClrRed.
    bmp pen circleFilled: 15.

    aTool:=Tool fromBitmap: bmp.
    aTool selector:#doc2;owner:self;extent: 38 @ 38;space: 11.
    aToolCollection add:aTool.

    aPane contents: aToolCollection.!
 
toolPaneDoubleClicked: aStatusPane
        "Private - The user has double-clicked on the ToolPane"

    MessageBox message: 'This is a ToolPane Demonstration'! !
