"
******************************************************************************
Application : WindowBuilder Pro/V Windows 1.0.6 Runtime
Date        : Sep 17, 1996
Time        : 17:30:58

Introduction
============

This file contains the source code for the Smalltalk/V Windows runtime
filein of WindowBuilder Pro/V.  It provides the supporting portability
code necessary to run ViewManager classes that were generated with
WindowBuilder Pro/V.  Before filing in WindowBuilder classes into a
Smalltalk/V Windows image, install this file first.

To install this file into a clean Smalltalk/V Windows image, select
the Install... command from the File menu, select this file in the
Choose File dialog that appears, then press the OK button.

Alternatively, you can execute the following code, with this file in the
current directory:

    (File pathName: 'runtime.st') fileIn; close.

(c) ParcPlace-Digitalk, Inc. 1996
(c) Objectshare Systems, Inc. 1993-1996

For more information contact:

    ObjectShare, a division of ParcPlace-Digitalk
    3160 De La Cruz Blvd, Suite 205
    Santa Clara, CA 95054-2408
    (408) 970-7280 Phone
    (408) 970-7282 Fax
    http://www.objectshare.com




Description
===========

Classes : 
    WBEntryField ActionButton WBCompositePaneTester 
    LinkButton RadioButtonGroup WBDialogTopPane 
    EnhancedEntryField WinMinMaxInfo CheckBoxGroup 
    WBAction SexPane WBToolBar WBWindowDialog 
    WBComboBox WBTool CompositePane WBToolPalette 
    CPBitmapDict WBListBox FramingParameters 
    CPStaticGraphic EntryFieldGroup 

Methods : 
Object>>isMDIFrame
Object>>isWBWindow
NotificationManager>>activeWindow
ViewManager>>wbCreated
Window>>wmGetminmaxinfo:with:
Window>>addSubpane:
Window>>topParent
Window>>dialogTemplate:
Window>>addSubpaneDynamically:
Window>>notebookParent
Window>>modifiedBy
Window>>modifiedBy:
Window>>paneName
Window>>createdBy
Window>>dialogTemplate
Window>>createdBy:
Window>>add:interestIn:
Window>>getSubpaneOrder
Window>>getContentsHandler
Window>>redraw
Window>>addToSubpaneOrder:
Window>>windowText
Window>>iconFile
Window>>paneNamed:
Window>>allChildren
Window>>paneName:
Window>>accel:afBits:
Window>>wmCommand:with:
Window>>iconFile:
Window>>helpManager
Integer>>bitIsOn:
ViewManager>>centeredOnMouse
ViewManager>>openWithMyParent:
ViewManager>>createViews
ViewManager>>open
ViewManager>>openAsMDIParent
ViewManager>>dialogTemplate:
ViewManager>>openWithOwnerParent:
ViewManager>>positionRelativeTo:offset:
ViewManager>>openRelativeTo:offset:
ViewManager>>dialogTemplate
ViewManager>>isModal
ViewManager>>openWithParent:
ViewManager>>isWBWindow
ViewManager>>removeView:
ViewManager>>maxWindowSize
ViewManager>>minWindowSize
ViewManager>>openWithMDIParent:
ViewManager>>createViewsFor:owner:
ViewManager>>openCenteredOnMouse
ViewManager>>openWithOwner:
ViewManager>>openViews
ViewManager>>openWindow
ViewManager>>viewNamed:
ViewManager>>centeredOnScreen
ViewManager>>closeWindow
ViewManager>>paneNamed:
ViewManager>>execute:withTopPane:
ViewManager>>views
String>>stripMnemonic
String>>asProperNoun
String>>asByteArray
String>>beginsWith:
RadioButton>>isRadio
StaticText>>isWsTabstop
StaticText>>tabStop
GraphPane>>noScrollBars
GraphPane>>noBorders
TextEdit>>noBorders
TextEdit>>noScrollBars
TextEdit>>wordWrap
TextEdit>>wmGetdlgcode:with:
TextEdit>>scrollBars
Toggle>>setDefault
Toggle>>isButton
Toggle>>unsetDefault
EntryField>>maxSize
EntryField>>setReadOnly:
EntryField>>selectAll
EntryField>>readonly
EntryField>>contents
EntryField>>maxSize:
EntryField>>password
DrawnButton>>cpSize
DrawnButton>>setDefault
DrawnButton>>unsetDefault
DrawnButton>>cpContents
DrawnButton>>cpStyle
DrawnButton>>stretchToFit
DrawnButton>>cpContents:
DrawnButton>>fixedSize
DrawnButton>>fileExists:
DrawnButton>>invisible
GDIDLL>>createPatternBrush:
UndefinedObject>>ifNil:
UndefinedObject>>displayHelp:
Message>>isMessage
SubPane>>isSubPane
SubPane>>accel:afBits:
SubPane>>isWsTabstop
SubPane>>isButton
SubPane>>getPopupMenu
SubPane>>isGroupable
SubPane>>isWsGroup
SubPane>>dependents
SubPane>>wmSetfocus:with:
SubPane>>wmKillfocus:with:
SubPane>>addStyle:
SubPane>>removeDynamically
SubPane>>extraDialogItemData
SubPane>>removeSubpaneDynamically:
SubPane>>tabStop
SubPane>>startGroup
SubPane>>aboutToSaveImage
SubPane>>handlers
Object>>minWindowSize
Object>>modifiedByOSI
Object>>isSubPane
Object>>isWBAction
Object>>isWBWindow
Object>>isMDIFrame
Object>>preInitWindow
Object>>isRadio
Object>>ifNil:
Object>>isMessage
Object>>openWindow
Object>>addedByOSI
Object>>isDictionary
Object>>isCompositePane
Object>>isRectangle
Object>>initWindow
Object>>asString
Rectangle>>isRectangle
DialogTopPane>>buildItems
DialogTopPane>>wmCreate:with:
DialogTopPane>>mainWindow
DialogTopPane>>sizeWindow
DialogTopPane>>cachedBuildItems
DialogTopPane>>defaultFrameStyle
DialogTopPane>>frameStyleFromPStyle
DialogTopPane>>buildWindow:
DialogTopPane>>close
TopPane>>pushMnemonic:
TopPane>>accel:afBits:
TopPane>>pStyle
TopPane>>frameStyleFromPStyle
TopPane>>pStyle:
TopPane>>close:
WindowDialog>>openWindow
WindowDialog>>openViews
WindowDialog>>openModeless
WindowDialog>>isModal
Font>>fixedWidth
Font>>stringExtent:
Font>>fromByteArray:
Font>>wbStringWidth:
Font>>fromBytes:
KernelDLL>>getVersion
UserDLL>>drawText:text:length:rect:format:
UserDLL>>getWindowTextW:text:maxLength:
UserDLL>>createDialogIndirect:dialogTemplate:parent:dialogFunction:
UserDLL>>getDlgItemTextW:item:text:maxCount:
ListBox>>indexOf:
GraphicsTool>>fill:bitmap:
GraphicsTool>>fill:color:
Array>>convertBytesToString
Array>>asByteArray
GroupPane>>syncControlEvent:
ApplicationWindow>>setBackColor:
ApplicationWindow>>wmSize:with:
ApplicationWindow>>defaultFrameStyle
ApplicationWindow>>closeView
ApplicationWindow>>activate
ApplicationWindow>>validate
ApplicationWindow>>viewName:
ApplicationWindow>>wmGetminmaxinfo:with:
ApplicationWindow>>frameStyleFromPStyle
TextTool>>winDrawText:at:
TextTool>>centerWinText:at:
TextTool>>centerText:at:
TextTool>>winDrawText:in:format:
NotificationManager>>readWinQueue
NotificationManager>>activeWindow
NotificationManager>>translateAccelerator:
NotificationManager>>isCtrlDown
NotificationManager>>isAltDown
ControlPane>>contents:
ControlPane>>basicStyle
GroupBox>>isWsTabstop
GroupBox>>tabStop
Dictionary>>isDictionary
Pen>>draw3DButton:rect:font:foreColor:backColor:
Pen>>drawFocusRect:
Pen>>lineFrom:to:
Pen>>draw3DButton:rect:font:
Pen>>drawRectangle:
Pen>>quickLineFrom:to:using:
Pen>>drawRect3D:depth:style:
Icon>>createIcon
TextPane>>noBorders
TextPane>>contents:
TextPane>>noScrollBars
TextPane>>wmGetdlgcode:with:
Button>>wmKillfocus:with:
Button>>isButton
Button>>setDefault
Button>>setDefault:
Button>>unsetDefault
Button>>initialize
Button>>isGroupable
Button>>cancelPushButton
Button>>setFocus
Menu>>buildItem:menu:menuBar:
Menu>>appendItem:action:
Menu>>appendItem:selector:acceleratorString:
Menu>>appendItem:action:acceleratorString:
Menu>>disableAll
Menu>>wbAction
Menu>>enableAll
Menu>>clearPopup
Menu>>appendItem:link:type:
Menu>>appendItem:link:type:acceleratorString:
DialogBox>>queryItemText:
ViewManager class>>wbCreated
ViewManager class>>open
ViewManager class>>openAsMDIParent
ViewManager class>>openWithMyParent:
ViewManager class>>openWithParent:
ViewManager class>>openCenteredOnMouse
ViewManager class>>openWithMDIParent:
Date class>>monthStrings
Date class>>validateString:
Date class>>dateArray:
Date class>>validateDay:month:year:
WinDialogInfo class>>itemTemplateStyle:x:y:cx:cy:id:className:text:extraData:
Bitmap class>>fromStream:
Font class>>face:size:fixedWidth:attributes:
Float class>>exit

******************************************************************************
"!

"Initialize"

    Transcript cr; show: 'Installing WindowBuilder Pro/V Windows 1.0.6 Runtime...'.!

  
    (Smalltalk product = 'Smalltalk/V Windows' and: [Smalltalk version = '2.0']) ifFalse: [
        MessageBox message: 'This version of WindowBuilder Pro requires Smalltalk/V for Windows version 2.0.
A walkback follows.'.
        self error: 'Wrong Smalltalk/V Platform/Version'
    ].

    Smalltalk at: #WBConstants put: WinConstants.
    Smalltalk at: #PMToWinKeyMap put: Dictionary new.
    Smalltalk at: #WinToPMKeyMap put: Dictionary new.
    ColorConstants at: 'ClrChiseledgray' put: -1.

!

WinStructure subclass: #WinMinMaxInfo
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

ComboBox subclass: #WBComboBox
  instanceVariableNames: 
    'fullList disabled '
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

Object subclass: #WBAction
  instanceVariableNames: 
    'receiver originator script '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

Dictionary subclass: #CPBitmapDict
  instanceVariableNames: ''
  classVariableNames: 
    'WBSystem TheDict '
  poolDictionaries: ''!

Object subclass: #WBTool
  instanceVariableNames: 
    'file bitmap pen bitmapSelector selector rbSelector state numSpaces rectangle boundingBox '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

ViewManager subclass: #WBCompositePaneTester
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

Object subclass: #FramingParameters
  instanceVariableNames: 
    'initialExtent bottom top right left bottomRel topRel rightRel leftRel centerX centerY indent clientRect '
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

ViewManager subclass: #WBWindowDialog
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants '!

ListBox subclass: #WBListBox
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

TopPane subclass: #WBDialogTopPane
  instanceVariableNames: 
    'sem '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants '!

SubPane subclass: #WBToolPalette
  instanceVariableNames: 
    'selection size cellSize tpStyle elements cacheRedraw cachedElements useSystem '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

EntryField subclass: #WBEntryField
  instanceVariableNames: 
    'justSet '
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

EntryField subclass: #EnhancedEntryField
  instanceVariableNames: 
    'justSet case justification character field getFocus '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants VirtualKeyConstants '!

WBToolPalette subclass: #WBToolBar
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

GroupPane subclass: #CompositePane
  instanceVariableNames: 
    'initialSize '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WinConstants CharacterConstants VirtualKeyConstants '!

DrawnButton subclass: #CPStaticGraphic
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

CompositePane subclass: #EntryFieldGroup
  instanceVariableNames: 
    'label dictionary '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants '!

DrawnButton subclass: #ActionButton
  instanceVariableNames: 
    'action '
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

DrawnButton subclass: #LinkButton
  instanceVariableNames: 
    'link type '
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

CompositePane subclass: #RadioButtonGroup
  instanceVariableNames: 
    'label list numColumns selection '
  classVariableNames: ''
  poolDictionaries: ''!

RadioButtonGroup subclass: #CheckBoxGroup
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

CompositePane subclass: #SexPane
  instanceVariableNames: 
    'sex '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!


!Object methods ! 
isMDIFrame

    "Added by OSI - Added to eliminate the isKindOf: in
      NotificationManager>>activeWindow to improve performance."
    #addedByOSI.
    ^false!  !

!Object methods !
isWBWindow

    "Added by OSI- Added to eliminate the respondsTo: in
      NotificationManager>>readWinQueue to improve performance."
    #addedByOSI.
    ^false! !

!NotificationManager methods !   
activeWindow

    "Added by OSI to support keyboard translation for MDI windows"
        "Answer the active toppane."

    | win newWin |
    #addedByOSI.
    ((win := self findWindow: WindowHandle queryActive) isMDIFrame) ifTrue: [
        (newWin := win mdiGetActive) notNil ifTrue: [
            ^newWin
        ].
    ].

    ^win!    !

!ViewManager class methods ! 
wbCreated

    "Added by OSI - answer whether this
     viewmanager is WindowBuilder generated."
    #addedByOSI.
    ^false!  !



!WBEntryField class methods ! !



!WBEntryField methods !
 
asyncControlEvent: msgId

        "Added to prevent the textChanged message from
         happening when the contents is set, as well as to
         select all when getting focus."

    msgId = EnChange  ifTrue: [
        justSet ifTrue: [
            justSet := false.
        ]  ifFalse: [
            justSet := false.
            self sendInputEvent: #event: with: #textChanged.
            ^nil
        ].
    ].
    msgId = EnSetfocus ifTrue: [ self sendInputEvent: #selectAll. ^nil ].!
 
initialize

    justSet := false.
    super initialize!
  
modified

    "Added to avoid the isTextModified message from returning
     true in WindowBuilder.  Believe it or not, this is checked for
     EntryFields..."

    ^false!
 
setContents: aString

        "Added to prevent the textChanged message from
         happening when the contents is set"

    justSet := true.
    super contents: aString.!
 
wmKillfocus: wParam with: lParam
        "Private - Validate Input before loosing focus"
    |newValue|

    newValue := self windowText.
    self losingFocus.
    self event: #losingFocus.
    value := newValue.
    self setSelectionFrom: 0 to: 0.

    ^nil! !



!ActionButton class methods !

supportedEvents
        "Private - Answer the Set of events that ActionButtons can notify
         their owners about."
    ^super supportedEvents
        remove: #clicked;
        yourself! !



!ActionButton methods !

action

    ^action!
  
action: aSymbol

    action := aSymbol!
   
asyncControlEvent: msg
        "Private - Deferred control message handling routine."
    | linkClass |
    (msg = BnClicked) | (msg = BnDoubleclicked) ifTrue: [
        self action notNil ifTrue: [
            WBAction perform: self action on: self topParent owner with: self
        ]
    ]! !



!WBCompositePaneTester class methods !

isWBInternalClass

    ^true! !



!WBCompositePaneTester methods !
   
isWBWindow

    ^true!

openOn: aCompositePaneClass

    self openOn: aCompositePaneClass parent: nil!

openOn: aCompositePaneClass parent: aViewManager
    | composite iDUE |
    composite := (aCompositePaneClass new)
        addSubpanes;
        yourself.
    iDUE := composite framingBlock iDUE.
    composite
        framingBlock: nil;
        children: nil;
        propertyAt: #subpaneOrder put: nil.
    self addView: (
        self topPaneClass new
            owner: self;
            labelWithoutPrefix: aCompositePaneClass name,' Tester';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: (iDUE + (15@54)); xC; yC; cRDU: (0@0 rightBottom: iDUE));
            pStyle: #(sysmenu titlebar sizable);
            addSubpane: (
                composite
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: iDUE; lDU: 0 r: #left; rDU: 0 r: #right; tDU: 0 r: #top; bDU: 0 r: #bottom);
                    addSubpanes;
                    scrollbars;
                    startGroup;
                    yourself
            );
        yourself
    ).
    aViewManager isNil ifFalse: [ self parent: aViewManager ].
    self openWindow.
    self mainView resize: self mainView rectangle repaint: true.! !



!LinkButton class methods !
 
supportedEvents
        "Private - Answer the Set of events that LinkButtons can notify
         their owners about."
    ^super supportedEvents
        remove: #clicked;
        yourself! !



!LinkButton methods !

asyncControlEvent: msg
        "Private - Deferred control message handling routine."
    | linkClass |
    (msg = BnClicked) | (msg = BnDoubleclicked) ifTrue: [
        (self link notNil and: [ Smalltalk includesKey: self link ]) ifTrue: [
            linkClass := Smalltalk at: self link.
            self type == #Independent ifTrue: [
                linkClass new open
            ] ifFalse: [ self type == #Child ifTrue: [
                linkClass new openWithParent: self owner
            ] ifFalse: [ self type == #Sibling ifTrue: [
                linkClass new openWithMyParent: self owner
            ] ifFalse: [ self type == #MDIChild ifTrue: [
                linkClass new openWithMDIParent: self owner
            ] ifFalse: [
                MessageBox message: 'Invalid link type [',self type asString,']!!!!'
            ]]]].
        ] ifFalse: [
            MessageBox message: 'Missing Link [',self link asString,']!!'
        ].
    ]!

link

    ^link!
  
link: aSymbol

    link := aSymbol!
   
type

    ^type!
  
type: aSymbol

    type := aSymbol! !



!RadioButtonGroup class methods !

supportedEvents
        "Private - Answer the events supported by this subpane."
    ^super supportedEvents
        add: #select;
        yourself! !



!RadioButtonGroup methods !

addSubpanes
    | extent numRows index rb fontHeight inset inner |
    fontHeight := (SysFont height + 6) / (SysFont height / 32).
    self cpStyle isNil ifTrue: [
        self addSubpane: (
            GroupBox new
                owner: self;
                framingBlock: ( FramingParameters new iDUE: initialSize; lP: 0; rP: 1; tP: 0; bP: 1);
                paneName: 'group';
                startGroup;
                contents: self label;
                yourself).
        inset := 8 @ fontHeight.
    ] ifFalse: [
        inset := 0 @ 0
    ].
    inner := initialSize - inset.
    numRows := ((self contents size +  self numColumns - 1) // self numColumns) max: 1.
    extent := (inner x // numColumns) @ fontHeight.
    1 to: self numColumns do: [ :column |
        1 to: numRows do: [ :row |
            index := (column - 1) * numRows + row.
            index > self contents size ifFalse: [
                self addSubpane: (
                   rb := self buttonClass new
                        owner: self;
                        propertyAt: #index put: index;
                        framingBlock: ( FramingParameters new
                            iDUE: extent;
                            lP: ((column - 1) / self numColumns) * 0.9 + (((self numColumns - column + 1) / self numColumns) * 0.1);
                            rP: (column / self numColumns) * 0.9 + (((self numColumns - column) / self numColumns) * 0.1);
                            tDU: inset y + ((row - 1) * extent y) r: #top;
                            bDU: inset y + (row * extent y) r: #top);
                        when: #clicked perform: #setRadio:;
                        contents: (self contents at: index);
                        paneName: (self contents at: index);
                        yourself).
                index == 1 ifTrue: [ rb startGroup; tabStop ].
           ].
        ].
    ].!
   
backColor: aColor

    super backColor: aColor.
    self children do: [ :child | child backColor: aColor ].!
 
buttonClass

    ^RadioButton!

contents

    ^list ifNil: [ list := #() ].!
  
contents: aCollection

    handle = NullHandle ifFalse: [^self].
    list := aCollection.
    children := nil.
    self addSubpanes.!
  
cpStyle

    ^self propertyAt: #cpStyle!
  
foreColor: aColor

    super foreColor: aColor.
    self children do: [ :child | child foreColor: aColor ].!
 
indexOf: aString

    "Answer the index of the item aString."

    list isNil ifTrue: [ ^nil ].
    ^list indexOf: aString!

label

    ^label ifNil: [ label := '' ]!
 
label: aString

    | gb |
    label := aString.
    ((gb := self paneNamed: 'group') notNil and: [ gb handle isValid ]) ifTrue: [ gb contents: aString ].!
 
noGroupBox

    self propertyAt: #cpStyle put: #noGroupBox!
   
numColumns

    ^numColumns ifNil: [ numColumns := 1 ].!
  
numColumns: anInteger

    numColumns := anInteger!
   
selectedIndex
        "Private - Answer the currently selected item index."
    ^self selection!
  
selectedItem
        "Answer the item selected in the RadioButtonGroup."
    ( self selection ) isNil
        ifTrue: [ ^nil ]
        ifFalse: [ ^list at: ( self selection ) ]!
   
selectIndex: itemIndex
    | radioButton |
    radioButton := self children detect: [ :child | child isRadio and: [(child propertyAt: #index) == itemIndex ]].
    self children do: [ :child |
        child isRadio ifTrue: [
            child == radioButton ifTrue: [
                child selection: true.
            ] ifFalse: [
                child selection: false
            ].
        ].
    ].
    selection := itemIndex.!
 
selection

    ^selection!

selection: anObject

    ( anObject isInteger )
        ifTrue: [ self selectIndex: anObject ]
        ifFalse: [ self selectItem: anObject ]!
  
selectItem: aString
        "Private - Select the item aString"
    self selectIndex: (self indexOf: aString)!

setRadio: aPane

    selection := aPane propertyAt: #index.
    self event: #select!
 
verticalScrollBar

    super verticalScrollBar.
    self propertyAt: #cpStyle put: #verticalScrollBar! !



!WBDialogTopPane class methods ! !



!WBDialogTopPane methods !
 
closeView

    parent isWindow
        ifTrue: [
            parent enable.
            parent makeActive ].
    super closeView.
    Processor currentProcessIsRecursive ifTrue: [
        ^self].   "no semaphore wait"
   sem notNil ifTrue: [
        sem signal.
        sem := nil.
        Processor suspendActive.]!

frameStyleFromPStyle

    "Added by OSI"

    | s pStyle |

    (pStyle := self pStyle) isNil ifTrue: [
        #addedByOSI.
        ^nil
    ].

    s := WsOverlapped | WsClipsiblings | WsDlgframe.

   (pStyle includes: #maximize) ifTrue: [
        s := s | WsMaximizebox.
    ].
    (pStyle includes: #minimize) ifTrue: [
        s := s | WsMinimizebox.
    ].

    (pStyle includes: #sysmenu) ifTrue: [
        s := s | WsSysmenu.
    ].
    (pStyle includes: #titlebar) ifTrue: [
        s := s | WsCaption.
    ].

    ^s!
  
initSize
        "Private - Answer the initial size of the receiver."
    | size |
    size := self initWindowSize.
    ^(size isRectangle
            ifTrue: [size]
            ifFalse: [
                size isPoint
                    ifTrue: [self boxOfSize: size]
                    ifFalse: [0 @ 0 extent: 100@100]]).!
  
open
    "Open the dialog box modal to the
     current active window."
    ^ self openModal: nil!
   
openModal: aParent
        "Open the dialog box modal to the
         current active window."
    | cursor |
    cursor := Cursor.
    CursorManager execute change.
    aParent isNil ifTrue: [
            parent := WindowHandle queryActive.
            parent := Notifier findWindow: parent]
        ifFalse:[ parent := aParent].
    "Disable parent now to ensure that there are no further
     activities at parent."
    parent notNil ifTrue:[ parent disable].
    super openWindow.
    self event: #opened.
    CursorManager normal change.
    Processor currentProcessIsRecursive ifFalse: [
        self processInput].
    cursor change.!
  
openWindow
    "Open the dialog box modal to the
     current active window."
    ^ self openModal: nil!
 
processInput
        "Private - Make the receiver modal to its owner window.
         This method doesn't return until close has been
         sent to the receiver.  parent should be disabled before
         calling this method."
    sem := Semaphore new.
    [CurrentProcess makeUserIF. Notifier run] fork.
    sem notNil ifTrue: [sem wait].  "diag may be closed before
        getting here"
    CurrentProcess makeUserIF!

pStyle

    | pStyle |
    pStyle := super pStyle.
    (pStyle includes: #modal) ifFalse: [
        pStyle := (pStyle asSet add: #modal; yourself) asArray.
    ].
    ^pStyle! !



!EnhancedEntryField class methods !
 
okCharacterMethods
    ^((self methodDictionary keys select: [ :selector |
        (selector at: 1) = $o and: [
        (selector at: 2) = $k and: [
        (selector at: selector size) = $:]]])
            collect: [ :selector |
            selector asString copyFrom: 3 to: selector size - 1])  asSortedCollection!
  
okFieldMethods
    ^((self methodDictionary keys select: [ :selector |
        (selector at: 1) = $o and: [
        (selector at: 2) = $k and: [
        (selector at: selector size) ~= $:]]])
            collect: [ :selector |
            selector asString copyFrom: 3 to: selector size ]) asSortedCollection!
 
phoneConversionDict
    "Return a dictionary mapping letters to digit for
     phone numbers"

    ^Dictionary new
        at: $A put: $2;
        at: $B put: $2;
        at: $C put: $2;
        at: $D put: $3;
        at: $E put: $3;
        at: $F put: $3;
        at: $G put: $4;
        at: $H put: $4;
        at: $I put: $4;
        at: $J put: $5;
        at: $K put: $5;
        at: $L put: $5;
        at: $M put: $6;
        at: $N put: $6;
        at: $O put: $6;
        at: $P put: $7;
        at: $Q put: $7;
        at: $R put: $7;
        at: $S put: $7;
        at: $T put: $8;
        at: $U put: $8;
        at: $V put: $8;
        at: $W put: $9;
        at: $X put: $9;
        at: $Y put: $9;
        at: $Z put: $9;
        yourself.! !



!EnhancedEntryField methods !
 
adjustCase: aString

    self case notNil ifTrue: [
        self case = #UPPER ifTrue: [ ^aString asUpperCase ].
        self case = #lower ifTrue: [ ^aString asLowerCase ].
        self case = #Proper ifTrue: [ ^aString asProperNoun ]
    ].
    ^aString!
 
asyncControlEvent: msgId

        "Added to prevent the textChanged message from
         happening when the contents is set, as well as to
         select all when getting focus."

    msgId = EnChange  ifTrue: [
        justSet ifTrue: [
            justSet := false.
        ]  ifFalse: [
            justSet := false.
            self sendInputEvent: #event: with: #textChanged.
            ^nil
        ].
    ].
    msgId = EnKillfocus
        ifTrue: [ self loseFocus. ^nil ].
    msgId = EnSetfocus
        ifTrue: [ self perform: self getFocus. ^nil ].!

autoTab
    "Not supported under Windows"!
 
case

    ^case!
  
case: aSymbol

    case := aSymbol!
   
centered

    self justification: #centered.
    self addStyle: EsCenter.

    ^self style.!
   
character

    ^character!

character: aSymbol

    character := aSymbol!
 
contents: aString

    "Prevent the textChanged message from
     happening when the contents is set and
     fix the case"

    | string |
    string := self adjustCase: aString.
    self contents = string ifTrue: [ ^self ].
    justSet := true.
    super contents: string.
    Notifier cleanUpAllMessages.!
 
errorMessage

    ^MessageBox confirm: 'Invalid Input. Retry?'!
   
field

    ^field!

field: aSymbol

    field := aSymbol!
 
getFocus

    ^getFocus!
  
getFocus: aSymbol

    getFocus := aSymbol!
   
initialize

    justSet := false.
    self
        getFocus: #selectAll;
        left.
    super initialize!
  
isAutoTab
    "Not supported under Windows"
    ^false!
   
justification

    ^justification!

justification: aSymbol

    justification := aSymbol!
 
left

    self justification: #left!
  
loseFocus
    "Private - Validate the input prior to losing focus. Reset
     focus if input is invalid."
    (self frameWindow propertyAt: #ignoreLoseFocus) == true ifTrue: [ ^nil ].
    self contents: self contents.
    self validateField ifFalse: [
        self frameWindow propertyAt: #ignoreLoseFocus put: true.
        self errorMessage ifTrue: [ self setFocus ].
        self sendInputEvent: #resetLoseFocus.
   ].!
 
okAlpha: aChar
    "Validates whether aChar is a acceptable alpha character
     ( $A - $Z, $a - $z or space)"

    ^aChar isLetter or: [ aChar asciiValue = SpaceKey ]!

okAlphaNoSpace: aChar
    "Validates whether aChar is a acceptable alpha character
     ( $A - $Z, $a - $z)"

    ^aChar isLetter!
  
okAlphaNumeric:  aChar
    "Validates whether aChar is a acceptable alpha-numeric character
     ( $A - $Z, $a - $z, $0 - $9, or space)"

    ^aChar isDigit or: [ self okAlpha: aChar ]!
   
okAlphaNumericNoSpace: aChar
    "Validates whether aChar is a acceptable alpha character
     ( $A - $Z, $a - $z, $0 - $9)"

    ^aChar isLetter or: [ aChar isDigit ]!

okAny: aChar

    ^true!
  
okBoolean: aChar
    "Answer true if aChar is one of 'TtFfYyNn'."

    ^'TtFfYyNn' includes: aChar!
  
okDate
    "Answer true if contents is a valid date else false."
    | aString answer |
    aString := self contents.
    aString size = 0 ifTrue: [^true].
    answer := Date validateString: aString.
    answer ifTrue: [ self contents: (Date fromString: aString) asString ].
    ^answer.!
 
okInteger: aChar
    "Validates whether aChar is a acceptable character for a
     Integer in input string at position pos"
    | pos |
    pos := self getSelection leftTop x.
    ((aChar == $- or: [ aChar == $+ ]) and: [ pos == 1 ]) ifTrue: [ ^true ].
    ^self okPositiveInteger: aChar!
  
okNumeric: aChar
    "Validates whether aChar is a acceptable character for a
     Number in input string at position pos"
    | pos |
    pos := self getSelection leftTop x.
    ((aChar == $- or: [ aChar == $+ ]) and: [ pos == 1 ]) ifTrue: [ ^true ].
    (aChar == $. and: [ (self contents select: [ :c | c == $. ]) size < 1 ]) ifTrue: [ ^true ].
    ^self okPositiveInteger: aChar!
  
okPhoneNumberExtUS
    "Answer the input as a formated phone number.
     Format is: (999) 999-9999, 999-9999, x999, (999) 999-9999 x999."
    | input dict |
    dict := self class phoneConversionDict.
    input := (self contents collect: [ :aChar |
        dict at: aChar asUpperCase ifAbsent: [ aChar ]]) select: [ :aChar | aChar isDigit ].
    input size >= 10 ifTrue:[
        input size = 10 ifTrue: [
            self contents:
                '(', (input copyFrom: 1 to: 3),
                ') ', (input copyFrom: 4 to: 6),
                '-', (input copyFrom: 7 to: 10)
        ] ifFalse: [
            self contents:
                '(', (input copyFrom: 1 to: 3),
                ') ', (input copyFrom: 4 to: 6),
                '-', (input copyFrom: 7 to: 10),
                ' x', (input copyFrom: 11 to: input size)
        ].
        ^true
    ] ifFalse:[ input size >= 7 ifTrue:[
        self contents:
            (input copyFrom: 1 to: 3), '-',
            (input copyFrom: 4 to: 7).
            ^true
    ] ifFalse: [ input size >= 3 ifTrue:[
        self contents: 'x',input.
        ^true
    ] ifFalse: [ input size = 0 ifTrue:[
        ^true
    ] ifFalse:[
        ^false
    ]]]].!

okPhoneNumberUS
    "Answer the input as a formated phone number.
     Format is: (999) 999-9999, 999-9999, x999, (999) 999-9999 x999."
    | input dict |
    dict := self class phoneConversionDict.
    input := (self contents collect: [ :aChar |
        dict at: aChar asUpperCase ifAbsent: [ aChar ]]) select: [ :aChar | aChar isDigit ].
    input size >= 10 ifTrue:[
        self contents:
            '(', (input copyFrom: 1 to: 3),
            ') ', (input copyFrom: 4 to: 6),
            '-', (input copyFrom: 7 to: 10).
        ^true
    ] ifFalse: [ input size >= 7 ifTrue: [
        self contents:
            (input copyFrom: 1 to: 3), '-',
            (input copyFrom: 4 to: 7).
        ^true
    ] ifFalse: [ input size = 0 ifTrue:[
        ^true
    ] ifFalse:[
        ^false
    ]]].!
   
okPositiveInteger: aChar
    "Validates whether aChar is a acceptable character for a
    Positive Integer"

    ^aChar isDigit!

okRound2
    "Answer the input rounded to 2 decimal places"

    self contents: ((Float fromString: self contents) roundTo: 0.01) asString.
    ^true.!
 
okRound3
    "Answer the input rounded to 3 decimal places"

    self contents: ((Float fromString: self contents) roundTo: 0.001) asString.
    ^true.!

okSSN
    "Answer the input as a social security number.
    Format is: 999-99-9999."
    | input answer |
    input := self contents select: [ :aChar | aChar isDigit ].
    (answer := input size = 9) ifTrue:[
        self contents:
            (input copyFrom: 1 to: 3), '-',
            (input copyFrom: 4 to: 5), '-',
            (input copyFrom: 6 to: 9).
    ] ifFalse: [ input size = 0 ifTrue:[
        ^true
    ]].
    ^answer!

okZipCodeUS
    "Answer the input as a zip code.
    Format is: 99999 or 99999-9999."
    | input |
    input := self contents select: [ :aChar | aChar isDigit ].
    input size = 5 ifTrue:[
        self contents: input.
        ^true
    ] ifFalse: [ input size = 9 ifTrue: [
        self contents:
            (input copyFrom: 1 to: 5), '-',
            (input copyFrom: 6 to: 9).
        ^true
    ] ifFalse: [ input size = 0 ifTrue:[
        ^true
    ] ifFalse:[
        ^false
    ]]].!
   
resetLoseFocus

    self frameWindow propertyAt: #ignoreLoseFocus put: false!
 
right

    self justification: #right.
    self addStyle: EsRight.

    ^self style.!
  
selectFirst
    "Place cursor at beginning of the text."
    self setSelectionFrom: 0 to: 0!
  
selectLast
    "Place cursor at end of the text."
    self setSelectionFrom: self contents size to: self contents size!
   
validateCharacter: char
    "Private - Validate the character by applying char to
     the character validation function. Returns true if the
     character char is accepted. Returns false if not."

    (char isNil or: [ char asciiValue =  BackspaceKey ]) ifTrue: [ ^ true].

    self character notNil ifTrue: [
        (self perform: self character with: char) ifTrue:[
            ^ true
        ] ifFalse:[
            UserLibrary messageBeep: 0.
            ^ false
        ].
    ] ifFalse:[
        ^true
    ].!
  
validateField
    "Private - Validate the input. Answer true if the input is
     acceptable else answer false."
    self field notNil ifTrue: [
        ^self perform: self field
    ] ifFalse: [
        ^true
    ].!

wmChar: wParam with: lParam
    "Private - Only accept valid characters."
    (self validateCharacter: wParam asCharacter) ifTrue: [
        value := self windowText.
        ^ nil
    ] ifFalse: [
        ^ false
    ].! !



!WinMinMaxInfo class methods !

sizeInBytes

    ^20! !



!WinMinMaxInfo methods !
   
printOn: aStream

    aStream
    nextPutAll: 'ptReservedX: ', self ptReservedX printString; cr;
    nextPutAll: 'ptReservedY: ', self ptReservedY printString; cr;
    nextPutAll: 'ptMaxSizeX: ', self ptMaxSizeX printString; cr;
    nextPutAll: 'ptMaxSizeY: ', self ptMaxSizeY printString; cr;
    nextPutAll: 'ptMaxPositionX: ', self ptMaxPositionX printString; cr;
    nextPutAll: 'ptMaxPositionY: ', self ptMaxPositionY printString; cr;
    nextPutAll: 'ptMinTrackSizeX: ', self ptMinTrackSizeX printString; cr;
    nextPutAll: 'ptMinTrackSizeY: ', self ptMinTrackSizeY printString; cr;
    nextPutAll: 'ptMaxTrackSizeX: ', self ptMaxTrackSizeX printString; cr;
    nextPutAll: 'ptMaxTrackSizeY: ', self ptMaxTrackSizeY printString; cr;
    yourself.!
 
ptMaxPositionX

    ^(self uShortAtOffset: 8)!

ptMaxPositionX: aValue

    ^self uShortAtOffset: 8 put: aValue!
  
ptMaxPositionY

    ^(self uShortAtOffset: 10)!
   
ptMaxPositionY: aValue

    ^self uShortAtOffset: 10 put: aValue!
 
ptMaxSizeX

    ^(self uShortAtOffset: 4)!

ptMaxSizeX: aValue

    ^self uShortAtOffset: 4 put: aValue!
  
ptMaxSizeY

    ^(self uShortAtOffset: 6)!

ptMaxSizeY: aValue

    ^self uShortAtOffset: 6 put: aValue!
  
ptMaxTrackSizeX

    ^(self uShortAtOffset: 16)!
  
ptMaxTrackSizeX: aValue

    ^self uShortAtOffset: 16 put: aValue!

ptMaxTrackSizeY

    ^(self uShortAtOffset: 18)!
  
ptMaxTrackSizeY: aValue

    ^self uShortAtOffset: 18 put: aValue!

ptMinTrackSizeX

    ^(self uShortAtOffset: 12)!
  
ptMinTrackSizeX: aValue

    ^self uShortAtOffset: 12 put: aValue!

ptMinTrackSizeY

    ^(self uShortAtOffset: 14)!
  
ptMinTrackSizeY: aValue

    ^self uShortAtOffset: 14 put: aValue!

ptReservedX

    ^(self uShortAtOffset: 0)!
   
ptReservedX: aValue

    ^self uShortAtOffset: 0 put: aValue!
 
ptReservedY

    ^(self uShortAtOffset: 2)!
   
ptReservedY: aValue

    ^self uShortAtOffset: 2 put: aValue! !



!CheckBoxGroup class methods ! !



!CheckBoxGroup methods !
   
buttonClass

    ^CheckBox!
   
lastSelection

    ^selection!

selectedItems
    "Answer a collection of the selected items."
    | sel |
    (sel := self selections) isNil
        ifTrue: [^nil]
        ifFalse: [^self selections collect: [:each | list at: each]]!
 
selectIndex: index

    (self children detect: [ :child | index = (child propertyAt: #index)]) selection: true.
    selection := index.!
 
selection
    "Answer the index of the first item selected. Index starts at 1."
    | values |
    values := self selections.
    values size = 0 ifTrue: [^nil].
    ^values first!
   
selection: anObj
        "If anObj is a collection then select items whose indices
         are in anObj.
         If anObj is Integer then select the item indexed by anObj.
         Otherwise, select anObj in the list."
    anObj size > 0
        ifTrue: [ anObj do: [ :i | super selection: i ]]
        ifFalse: [super selection: anObj]!
  
selections

    ^(self children asOrderedCollection select: [ :child |
        child class == self buttonClass and: [ child selection ]]) collect: [ :child |
            child propertyAt: #index ]!
   
unSelectIndex: index

    (self children detect: [ :child | index = (child propertyAt: #index)]) selection: false! !



!WBAction class methods !
 
listActions
    | list class stream |
    list := OrderedCollection new.
    class := self.
    [ class name = 'Object' ] whileFalse: [
        list addAll:
            ((class methodDictionary keys asSortedCollection select: [ :selector |
                selector beginsWith: 'action' ]) collect: [ :method |
                    method copyFrom: 7 to: method size ]).
        class := class superclass
    ].
    ^list!
 
perform: aSymbol on: aViewManager

    ^(self window: aViewManager action: aSymbol) perform!
  
perform: aSymbol on: aViewManager with: anActionButton

    ^(self window: aViewManager button: anActionButton action: aSymbol) perform!
  
performAction: aSymbol

    ^(self new script: aSymbol) perform!
  
receiver: anObject

    ^self new receiver: anObject!
 
receiver: firstObject originator: secondObject

    ^(self new)
        receiver: firstObject;
        originator: secondObject!

receiver: firstObject originator: secondObject script: aCollection

    ^(self new)
        receiver: firstObject;
        originator: secondObject;
        script: aCollection!
  
window: aViewManager

    ^self new receiver: aViewManager!
   
window: aViewManager action: aSymbol

    ^(self new)
        receiver: aViewManager;
        script: aSymbol!
  
window: aViewManager button: anActionButton

    ^(self new)
        receiver: aViewManager;
        originator: anActionButton!

window: aViewManager button: anActionButton action: aSymbol

    ^(self new)
        receiver: aViewManager;
        originator: anActionButton;
        script: aSymbol! !



!WBAction methods !
 
actionCancel
"
Created by OSI - Jan 26, 1993
"
"Close the window"
    ^self window close!
  
actionInspect
"
Created by OSI - Jan 26, 1993
"
"Inspect the window"
    ^self window inspect!
 
button

    ^originator!
  
isWBAction

    ^true!

menuItem

    ^originator!

missingAction
    ^MessageBox message: 'Missing action: ',self script!
 
missingAction: aSymbol
    ^MessageBox message: 'Missing action: ',aSymbol,'!!'!
   
originator

    ^originator!
  
originator: anObject

    originator := anObject.
    ^self!
 
perform

    self receiver isNil ifTrue: [ self halt.
        ^MessageBox message: 'Receiver not defined!!'
    ] ifFalse: [self script isString ifTrue: [
        (self class listActions includes: self script asString) ifTrue: [
            ^self perform: ('action',self script) asSymbol
        ] ifFalse: [
            ^self missingAction: self script
        ]
    ] ifFalse: [ self script isCollection ifTrue: [
        self script do: [ :action |
            (self class listActions includes: action asString) ifTrue: [
                self perform: ('action',action) asSymbol
            ] ifFalse: [
                ^self missingAction: action
            ]
        ].
    ]]].!
 
receiver

    ^receiver!
  
receiver: anObject

    receiver := anObject.
    ^self!
 
script

    ^script!
  
script: aCollection

    script := aCollection.
    ^self!
   
target

    ^receiver!

window

    ^receiver! !



!SexPane class methods !
  
supportedEvents
        "Private - Answer the events supported by this subpane."
    ^super supportedEvents
        add: #sexChanged;
        add: #setToMale;
        add: #setToFemale;
        yourself!
   
wbCreated

    ^true! !



!SexPane methods !
 
addSubpanes
    (self
        yourself;
            framingBlock: ( FramingParameters new iDUE: 210 @ 136; xC; yC; cRDU: (2 @ 134 rightBottom: 208 @ 2));
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 201 @ 128; lDU: 0 r: #left; rDU: 5 r: #right; tDU: 0 r: #top; bDU: 4 r: #bottom);
                    startGroup;
                    contents: 'Sex';
                    yourself
            );
            addSubpane: (
                RadioButton new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 119 @ 40; lDU: 27 r: #left; rDU: 146 r: #left; tDU: 32 r: #top; bDU: 72 r: #top);
                    paneName: 'male';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #setMale:;
                    contents: 'Male';
                    yourself
            );
            addSubpane: (
                RadioButton new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 155 @ 40; lDU: 27 r: #left; rDU: 183 r: #left; tDU: 72 r: #top; bDU: 112 r: #top);
                    paneName: 'female';
                    when: #clicked perform: #setFemale:;
                    contents: 'Female';
                    yourself
            );
        yourself
    ).!
  
contents

    ^self sex!
  
contents: aSymbol

    self sex: aSymbol!
 
setFemale: aPane

    self sex: #female.
    self event: #setToFemale.!
  
setMale: aPane

    self sex: #male.
    self event: #setToMale.!

sex

    ^sex!

sex: aSymbol
    | list newSex |
    aSymbol isSymbol ifTrue: [
        newSex := aSymbol
    ] ifFalse: [
        newSex := aSymbol asString asLowerCase asSymbol
    ].
    ((list := #(male female)) includes: newSex) ifFalse: [
        ^self error: 'Unknown sex (',newSex asString,') - only #male and #female are allowed.'
    ].
    sex := newSex.
    (self paneNamed: newSex asString) selection: true.
    (list reject: [ :s | s == newSex ]) do: [ :s | (self paneNamed: s asString) selection: false ].
    self event: #sexChanged.! !



!WBToolBar class methods ! !



!WBToolBar methods !
   
add: aSelector

    self add: aSelector spaces: 0!

add: aSelector rbSelector: rbSelector

    ^self add: nil selector: aSelector rbSelector: rbSelector!
 
add: bitmapSelector selector: aSelector

    self add: bitmapSelector selector: aSelector spaces: 0!
  
add: bitmapSelector selector: aSelector rbSelector: rbSelector

    ^self add: bitmapSelector selector: aSelector spaces: 0 rbSelector: rbSelector!
   
add: bitmapSelector selector: aSelector spaces: numSpaces

    ^self add: bitmapSelector selector: aSelector spaces: numSpaces rbSelector: nil!
   
add: bitmapSelector selector: aSelector spaces: numSpaces rbSelector: rbSelector
    | key element rect |
    key := self elements size + 1.
    self elements add: nil.
    element := self at: key put: bitmapSelector selector: aSelector.
    element isNil ifTrue: [ ^nil ].
    element numSpaces: numSpaces.
    rect := self rectForKey: key - 1.
    element rectangle:
        (Rectangle
            leftTop: (rect rightTop right: numSpaces - 1)
            extent: self cellSize).
    element rbSelector: rbSelector.
    ^element!

add: aSelector spaces: numSpaces

    ^self add: nil selector: aSelector spaces: numSpaces!
   
add: aSelector spaces: numSpaces rbSelector: rbSelector

    ^self add: nil selector: aSelector spaces: numSpaces rbSelector: rbSelector!
 
button2Down: aPoint

    | index |

    index := self currentIndex.

    (self isEnabled: index) ifTrue: [
        self rbEventFor: index.
    ].!
  
collectionType

    ^OrderedCollection!
   
currentIndex
    | point |
    point := Cursor offset mapToWindow: self.
    1 to: self elements size do: [ :i |
        (((self elementAt: i) rectangle) containsPoint: point)
            ifTrue: [ ^i ]].
    ^nil.!
   
defaultCellSize

    ^25@22!
  
defaultSelection
    ^1!
   
disableElements
    1 to: self elements size do: [ :key |
        self disable: key ].!
   
display

    1 to: self elements size do: [ :i | self display: i ]!
   
elementAt: key

    ^(key isInteger and: [ key > 0 and: [ key <= self elements size ]])
        ifTrue: [ self elements at: key ]
        ifFalse: [ nil ]!
 
elementAtSelector: aSelector
    ^(1 to: self elements size) detect: [ :key |
        (self selectorAt: key) = aSelector ] ifNone: [ nil ]!
   
enableElements
    1 to: self elements size do: [ :key |
        self enable: key ].!
 
freeClientArea: box
    "Private - Set the client area left over."
    self tpStyle == #mdiToolBar ifFalse: [ ^self ].
    self visible ifFalse: [ ^self ].
    box leftTop: (box leftTop rightAndDown: (0 @ self height))!
 
generateEventFor: aSelection
    ^nil!
 
height
    "Answer the receiver's height."

    ^self cellSize y!

isPreAutomatic

    ^super isPreAutomatic or: [ tpStyle = #mdiToolBar ]!
  
mdiToolBar

    tpStyle := #mdiToolBar.
    self framingBlock: [:box |
        Rectangle leftTopUnit rightBottom: (box width @ self height) ].!
 
rbEventFor: key

    | selector |

    selector := self rbSelectorAt: key.

    (selector notNil and: [ selector isSymbol ])
        ifTrue: [
            (self owner class canUnderstand: selector)
                ifTrue: [
                    (selector includes: $:)
                        ifTrue: [self owner perform: selector with: self]
                        ifFalse: [self owner perform: selector]]].!
   
rbSelectorAt: key
    | element |
    (self validSelection: key) ifFalse: [ ^nil ].

    ^(element := self elementAt: key) isNil
            ifTrue: [ nil ]
            ifFalse: [ element rbSelector ]!
 
rectForKey: key
    | element |
    key ifNil: [ ^0@0 extent: 0@0 ].
    element := self elementAt: key.
    ^element isNil
        ifTrue: [ 0@0 extent: 1@1 ]
        ifFalse: [ element rectangle ]! !



!WBWindowDialog class methods ! !



!WBWindowDialog methods !
   
close
        "Close all the views."
    views do: [:v | v close]!

openModalTo: aWindow
    "Open the dialog box modal to ownerTopPane."
    self createViews.
    self mainView openModal: aWindow mainView!
   
topPaneClass
    "Private - Answer the defalut top pane class."
    ^WBDialogTopPane! !



!WBComboBox class methods ! !



!WBComboBox methods !
 
asyncControlEvent: anInteger
        "Private - Process the delayed Win event anInteger produced
         for the receiver's window."

   anInteger = CbnKillfocus ifTrue: [ self losingFocus. ^nil ].
    ^super asyncControlEvent: anInteger!

buildList

    super contents: (fullList select: [ :el | (disabled includes: el) not ]).
    self selectIndex: value.!
   
contents

    ^fullList!
  
contents: aCollection

    disabled := Set new.
    fullList := aCollection.

    ^super contents: aCollection!

disableItem: anItem

    self getSelection.
    ((fullList indexOf: anItem) = value) ifTrue: [
        value := value + 1.
        (value > list size) ifTrue: [
            value := 1.
        ].
        self selectIndex: value.
    ].

    disabled add: anItem.

    self buildList.!
   
enableItem: anItem

    disabled remove: anItem ifAbsent: [].

    self buildList.!
 
initialize

    super initialize.
    disabled := Set new.
    fullList := list.!
   
selectedItem
        "Answer the item selected in the receiver."
    ( self getSelection ) isNil
        ifTrue: [ ^nil ]
        ifFalse: [ ^list at: value ]!
 
selectItem: anObject

        "Avoid the Combobox version, since it sets the text, and
         loses the selection"

        "Private - Select the item anObject. anObject can
         be an index or a string."

    anObject isInteger
        ifTrue: [ self selectIndex: anObject ]
        ifFalse: [ self selectIndex: (self indexOf: anObject) ]! !



!WBTool class methods !
   
bitmap: aBitmap selector: aSymbol

    ^(self new)
        state: #up;
        selector: aSymbol;
        bitmap: aBitmap;
        yourself! !



!WBTool methods !
   
bitmap

    ^bitmap!
  
bitmap: aBitmap

    bitmap := aBitmap!
   
bitmapSelector

    ^bitmapSelector!
  
bitmapSelector: aSymbol

    bitmapSelector := aSymbol!
   
boundingBox

    boundingBox ifNil: [
        boundingBox := IdentityDictionary new.
        boundingBox
            at: #up put: self upBoundingBox;
            at: #down put: self downBoundingBox;
            at: #disabled put: self disabledBoundingBox.
    ].
    ^boundingBox at: self state ifAbsent: [ 0@0 extent: 0@0 ].!
 
boundingBox: aRectangle

    boundingBox := aRectangle!
   
disabled

    self state: #disabled!
  
disabledBoundingBox

    ^self upBoundingBox!
 
down

    self state: #down!
  
downBoundingBox

    ^((self bitmap width // self numImages) @ 0 extent: (self bitmap width // self numImages @ self bitmap height))!
 
file

    ^file ifNil: [ file := '' ]!

file: aString

    file := aString!
   
isDisabled

    ^self state == #disabled!
 
isDown

    ^self state == #down!
 
isEnabled

    ^self isDisabled not!
  
isUp

    ^self state == #up!
 
newBlankBitmap: aBitmap

    ^Bitmap
            width: aBitmap width // self numImages
            height: aBitmap height
            planes: aBitmap planes
            bitCount: aBitmap bitCount.!

numImages

    ^2!

numSpaces

    ^numSpaces ifNil: [ numSpaces := 0 ]!
  
numSpaces: anInteger

    numSpaces := anInteger!
 
pen

    ^pen ifNil: [ pen := self bitmap pen ].!
 
pen: aPen

    pen := aPen!
   
printOn: aStream

    super printOn: aStream.
    aStream nextPut: $>; nextPutAll: self selector asString!
   
rbSelector

    ^rbSelector!
  
rbSelector: aSymbol

    rbSelector := aSymbol!
   
rectangle

    ^rectangle!

rectangle: aRectangle

    rectangle := aRectangle!
   
releaseBitmaps

    self file isEmpty ifFalse: [
        self bitmap release.
        self bitmap: nil
    ].!
 
selector

    ^selector!
  
selector: aSymbol

    selector := aSymbol.
    bitmapSelector ifNil: [ bitmapSelector := selector ].!
   
state

    ^state!

state: aSymbol

    state := aSymbol!
 
up

    self state: #up!
  
upBoundingBox

    ^(0 @ 0 extent: (self bitmap width // self numImages @ self bitmap height))! !



!CompositePane class methods !
   
isScratchWindow

    ^false!
  
open

    self openWithParent: nil!
   
openWithParent: aViewManager

    WBCompositePaneTester new openOn: self parent: aViewManager!

supportedEvents

    ^Set with: #getContents.!

wbCreated

    ^false!

wbCreatedClasses

    ^self allSubclasses select: [ :c |
        c wbCreated
    ].! !



!CompositePane methods !
  
addSubpane: aWindow
        "Add aWindow as the child of the receiver."
    |id|

    self
        children;
        addToSubpaneOrder: aWindow.

    id := aWindow propertyAt:#id.
    id isNil ifTrue:[ aWindow propertyAt:#id put: self getNextChildId].
    "Check if duplicate 'idCancel' or 'idOK' message might have been sent to the childs of this window."
    self children at: self getNextChildSlot put: aWindow.
    aWindow parent: self.
    aWindow owner isNil ifTrue: [
        aWindow owner: self owner].

    (self mainWindow propertyAt: #focusWindow) isNil & aWindow isWsTabstop ifTrue: [
        self mainWindow propertyAt: #focusWindow put: aWindow.
    ].

    self mainWindow add: aWindow interestIn: aWindow name.!
 
addSubpanes
    "Does nothing - overriden by subclasses"!
  
amountToPageLeft
        "Private - Answer the number of pixels for
         horizontal page scrolling."
    ^64!

amountToPageUp
        "Private - Answer the number of pixels for
         vertical page scrolling."
    ^64!

amountToScrollLeft
        "Private - Answer the number of pixels
         for horizontal scrolling."
    ^8!

amountToScrollUp
        "Private - Answer the number of pixels
         for vertical scrolling."
    ^8!

basicStyle
        "Private - Answer an Integer with appropriate styles in it."
    ^WsChild |
     WsVisible "|
     WsClipsiblings"!
  
borders

    ^style := self basicStyle | WsBorder!

changed: aFacet

    (self children select: [ :child |
        (child handlers at: #getContents ifAbsent: [ nil ]) == aFacet ]) do: [ :child |
        child update ].!
 
charsInColumn
        "Private - Answer the receiver frame height."
    ^rectangle height!

charsInRow
        "Private - Answer the receiver frame width."
    ^rectangle width!
 
children

    children isNil ifTrue: [ children := IdentityDictionary new].
    ^children!
   
children: aCollection

    children := aCollection!
   
clearFocus
    self setFocus: nil.!

cpBackColor: aColor

    self backColor isNil ifTrue: [
        self backColor: aColor
    ]!
   
cpForeColor: aColor

    self foreColor isNil ifTrue: [
        self foreColor: aColor
    ]!
   
cpStyle

    ^self propertyAt: #cpStyle!
  
defaultStyle
        "Private - Answer an Integer with appropriate styles in it."
    ^self basicStyle.!
  
disable

    super disable.
    self children do: [ :child | child disable ]!

display

    self doGraphics: [
        self pen fill: self rectangle color: self backColor
    ].
    super display.!
 
enable

    super enable.
    self children do: [ :child | child enable ]!
   
frameStyle
        "Private - Answer an Integer with appropriate styles in it."
    ^self basicStyle.!

framingBlock: aBlock

    (self framingBlock isNil or: [self framingBlock isContext]) ifTrue: [
        super framingBlock: aBlock
    ].
    aBlock isNil ifTrue: [
        super framingBlock: aBlock
    ] ifFalse: [
        initialSize := (aBlock value: Display boundingBox) extent
    ]!
  
freeClientArea: box
    "Private - Set the client area left over."
    | cpStyle |
    cpStyle := self cpStyle.
    (cpStyle == #mdiToolBar or: [cpStyle == #mdiToolBarBordered])  ifFalse: [ ^self ].
    self visible ifFalse: [ ^self ].
    cpStyle == #mdiToolBar ifTrue: [
        box leftTop: (box leftTop rightAndDown: (0 @ self height))
    ] ifFalse: [
        box leftTop: (box leftTop rightAndDown: (-2 @ self height + 2))
    ].!
  
getFocus
    ^self propertyAt: #focus.!

getGroupFor: aPane
    | order first last index |
    index := (order := self getSubpaneOrder) indexOf: aPane.
    first := (1 to: index) asArray reversed detect: [ :i | (order at: i) isWsGroup] ifNone: [index].
    last := ((index + 1 to: order size) detect: [ :i | (order at: i) isWsGroup] ifNone: [order size + 1]) - 1.
    first == last ifTrue: [ ^Array with: aPane ].
    ^order copyFrom: first to: last!
 
getNextFocus: aPane
    | order |
    ((order := self getSubpaneOrder) notEmpty and: [ aPane ~= (order at: order size)]) ifTrue: [
        1 to: order size do: [ :i |
            (order at: i) = aPane ifTrue: [
                i + 1 to: order size do: [ :j |
                    (order at: j) isWsTabstop ifTrue: [
                        (order at: j) setFocus.
                        self clearFocus.
                        ^true
                    ].
                ].
            ].
        ].
    ].
    self parent isCompositePane ifTrue: [
        (self parent getNextFocus: self) ifTrue: [^true]
    ].
    self clearFocus.
    ^false!
  
getNextFocusInGroup: aPane
    | order index next |
    (order := self getGroupFor: aPane) notEmpty ifTrue: [
        (index := order indexOf: aPane) == order size ifTrue: [
            (next := order at: 1) setFocus
        ] ifFalse: [
            (next := order at: index + 1) setFocus
        ].
    ].
    next isRadio ifTrue: [
        order do: [ :pane |
            pane == next ifTrue: [
                next selection: true
            ] ifFalse: [ pane isRadio ifTrue: [
                pane selection: false
            ]].
        ].
    ].
    self clearFocus.!
   
getPreviousFocus: aPane
    | order |
    ((order := self getSubpaneOrder) notEmpty and: [ aPane ~= (order at: 1)]) ifTrue: [
        1 to: order size do: [ :i |
            (order at: i) = aPane ifTrue: [
                (1 to: i - 1) reverseDo: [ :j |
                    (order at: j) isWsTabstop ifTrue: [
                        (order at: j) setFocus.
                        self clearFocus.
                        ^true
                    ].
                ].
            ].
        ].
    ].
    self parent isCompositePane ifTrue: [
        (self parent getPreviousFocus: self) ifTrue: [^true]
    ].
    self clearFocus.
    ^false!
   
getPreviousFocusInGroup: aPane
    | order index next |
    (order := self getGroupFor: aPane) notEmpty ifTrue: [
        (index := order indexOf: aPane) == 1 ifTrue: [
            (next := order at: order size) setFocus
        ] ifFalse: [
            (next := order at: index - 1) setFocus.
        ].
    ].
    next isRadio ifTrue: [
        order do: [ :pane |
            pane == next ifTrue: [
                next selection: true
            ] ifFalse: [ pane isRadio ifTrue: [
                pane selection: false
            ]].
        ].
    ].
    self clearFocus.!
  
gettingFocus
    | pane |
    "Set the focus to the appropriate child"
    pane := self getFocus.
    pane isNil ifTrue: [
        (Notifier isKeyDown: VkShift) ifTrue: [
            pane := self getSubpaneOrder reversed detect: [ :c | c isWsTabstop ] ifNone: [ nil ]
        ] ifFalse: [
            pane := self getSubpaneOrder detect: [ :c | c isWsTabstop ] ifNone: [ nil ]
        ].
    ].
    pane isNil ifFalse: [
        pane isCompositePane ifTrue: [
            pane gettingFocus
        ] ifFalse: [ pane isRadio ifTrue: [
            pane := (self getGroupFor: pane) detect: [ :p | p selection ] ifNone: [ pane ]
        ]].
        pane setFocus
    ].!

horizontalScrollMaxRange
        "Private - Answer the horizontal scrollbar's max range"
|maxPos|

    UserLibrary getScrollRange: self handle asParameter
                bar: SbHorz
                lpMinPos: (WinStructure new: 2) asParameter
                lpMaxPos: (maxPos := WinStructure new: 2) asParameter.

    ^ maxPos shortAtOffset:0!
   
horizontalScrollMinRange
        "Private - Answer the horizontal scrollbar's max range"
|minPos|

    UserLibrary getScrollRange: self handle asParameter
                bar: SbHorz
                lpMinPos: (minPos := WinStructure new: 2) asParameter
                lpMaxPos: (WinStructure new: 2) asParameter.

    ^ minPos shortAtOffset:0!
   
horizontalScrollPos
        "Private - Answer the horizontal scrollbar's position"

    ^UserLibrary getScrollPos: self handle asParameter bar: SbHorz!
  
isCompositePane

    ^true!
   
label
    ^''!
 
mdiToolBar

    self propertyAt: #cpStyle put: #mdiToolBar.
    self framingBlock: nil.
    self framingBlock: [ :box |
        Rectangle leftTopUnit rightBottom: (box width @ initialSize y) ].!
 
mdiToolBarBordered

    style := self basicStyle | WsBorder.
    self propertyAt: #cpStyle put: #mdiToolBarBordered.
    self framingBlock: nil.
    self framingBlock: [ :box |
        Rectangle leftTopUnit rightBottom: (box width @ initialSize y) ].!
   
menuWindow

    ^MenuWindow new!
  
open

    self preInitWindow.
    graphicsTool notNil
        ifTrue: [graphicsTool release].
    super open.
    self event: #getContents.!
  
pStyle

    ^#(composite)!

resize: aRectangle deferInfo: winPosInfo
    | posInfo |
    posInfo := super resize: aRectangle deferInfo: winPosInfo.
    self setScrollRanges.
    self scrollTopCornerTo: 0@0.
    self updateSliders.
    ^posInfo!
  
scrollbars

    ^style := self basicStyle | WsBorder | WsVscroll | WsHscroll!
 
scrollHorizontal: anInteger
        "Private - Scroll the pane right by anInteger
         number of pixels (if positive) or left by
         the absolute value of anInteger (if negative)."
    self scrollTopCorner: anInteger  @ 0!
 
scrollingRectangle

    (initialSize isNil or: [initialSize <= rectangle extent]) ifTrue: [
        ^0@0 extent: 0@0
    ] ifFalse: [
        ^0@0 extent: ((initialSize x - rectangle width) @ (initialSize y - rectangle height))
    ].!
   
scrollTopCorner: aPoint
        "Private - Move the contents of the receiver
         pane by extent aPoint."
    | oldCorner |
    oldCorner := topCorner deepCopy.
    topCorner := topCorner - aPoint.
    oldCorner = topCorner ifTrue: [^self].
    UserLibrary scrollWindow: handle
        xAmount: aPoint x
        yAmount: aPoint y
        lpRect: nil
        clipRect: nil.
    self doGraphics: [
        GDILibrary offsetViewportOrg: graphicsTool handle
            x: aPoint x
            y: aPoint y
    ].
    UserLibrary updateWindow: self handle.!
   
scrollTopCornerTo: aNewCorner
        "Private - Scroll topCorner to aNewCorner"
    self scrollTopCorner: self topCorner - aNewCorner + 1!
   
setFocus: aPane
    self propertyAt: #focus put: aPane.!
   
setPopupMenu: aMenu
    super setPopupMenu: aMenu.
    self children do: [ :child |
        child getPopupMenu isNil ifTrue: [
            child setPopupMenu: aMenu
        ].
    ].!
   
setScrollRanges
        "Private - Set the ranges for the horizontal and vertical
          scroll bars."
    | rangeRect minHorz maxHorz minVert maxVert |

    rangeRect := self scrollingRectangle.
    minHorz := rangeRect left.
    maxHorz := rangeRect right.
    minVert := rangeRect top.
    maxVert := rangeRect bottom.
    (self style bitAnd: WsHscroll) = 0
        ifTrue: [minHorz := maxHorz := 0].
    (self style bitAnd: WsVscroll) = 0
        ifTrue: [minVert := maxVert := 0].
    UserLibrary
        setScrollRange: self asParameter
        bar: SbHorz
        min: minHorz
        max: maxHorz
        redraw: false.
    UserLibrary
        setScrollRange: self asParameter
        bar: SbVert
        min: minVert
        max: maxVert
        redraw: false!
   
topPaneClass

    ^self class!

totalWidth

    ^rectangle width!
 
update

    (self handlesEvent: #getContents)
        ifTrue: [ super update ]
        ifFalse: [
            self children do: [ :child | child update ]].!
   
updateHorizontalSlider
        "Private - Update the horizontal slider position."
   UserLibrary
        setScrollPos: self asParameter
        bar: SbHorz
        position: self topCorner x
        redraw: true.!
 
updateSliders

        "Private - Update the slider boxes in the scrollbars."

    handle = NullHandle ifTrue: [^self].
    self updateVerticalSlider.
    self updateHorizontalSlider!
   
updateVerticalSlider
        "Private - Update the vertical slider position."
   UserLibrary
        setScrollPos: self asParameter
        bar: SbVert
        position: self topCorner y
        redraw: true.!
 
validate

    self children do: [ :child |
        child isButton ifTrue: [ child receiveAllWindowMessages ]
    ].
    self setScrollRanges.
    super validate.
    self sendInputEvent: #updateRectangle.
    self initWindow.!
  
verticalScrollBar

    ^style := self basicStyle | WsBorder | WsVscroll!
  
verticalScrollbar

    ^self verticalScrollBar!
   
verticalScrollMaxRange
        "Private - Answer the vertical scrollbar's max range"
|maxPos|

    UserLibrary getScrollRange: self handle asParameter
                bar: SbVert
                lpMinPos: (WinStructure new: 2) asParameter
                lpMaxPos: (maxPos := WinStructure new: 2) asParameter.

    ^ maxPos shortAtOffset:0!
   
verticalScrollMinRange
        "Private - Answer the vertical scrollbar's min range"
|minPos|

    UserLibrary getScrollRange: self handle asParameter
                bar: SbVert
                lpMinPos: (minPos := WinStructure new: 2) asParameter
                lpMaxPos: (WinStructure new: 2) asParameter.

    ^ minPos shortAtOffset:0!
   
verticalScrollPos
        "Private - Answer the vertical scrollbar's position"

    ^UserLibrary getScrollPos: self handle asParameter bar: SbVert!
  
views

    ^Array with: self.!

wmErasebkgnd: wordInteger with: longInteger
        "Private - Process the erase background message."
    | backColor aColor oldDC |
    (backColor := self backColor) notNil
        ifTrue: [aColor := backColor]
        ifFalse: [aColor := ClrBackground].
    oldDC := graphicsTool privateHandle.
    graphicsTool handle: wordInteger.
    graphicsTool fill: (0 @ 0 extent: self extent)
                color: aColor.
    graphicsTool handle: oldDC.
    ^1!
 
wmHScroll: wordInteger with: longInteger
        "Private - Process a WM_HSCROLL message."
    | type sb slider pos |
    type := wordInteger.

    type = SbLineup ifTrue: [
            (self horizontalScrollPos > self horizontalScrollMinRange) ifTrue:[
                 self scrollHorizontal: self amountToScrollLeft]].
    type = SbLinedown ifTrue: [
            (self horizontalScrollPos < self horizontalScrollMaxRange) ifTrue:[
                self scrollHorizontal: self amountToScrollLeft negated]].
    type = SbPageup ifTrue: [
            self scrollHorizontal: (self amountToPageLeft
                min: (self horizontalScrollPos - self horizontalScrollMinRange)) ].
    type = SbPagedown ifTrue: [
            self scrollHorizontal: (self amountToPageLeft
                min: (self horizontalScrollMaxRange - self horizontalScrollPos)) negated].
    type = SbThumbposition
        ifTrue: ["end of tracking"
            pos := WinStructure new: 4.
            pos uLongAtOffset: 0 put: longInteger.
            pos := pos shortAtOffset: 0.
            self updateHorizontalSliderTo: pos.
            self scrollHorizontal: self topCorner x - pos.
            ^nil].
    type = SbThumbtrack
        ifTrue: [^nil]
        ifFalse: [self updateHorizontalSlider].
    ^nil!

wmNchittest: wParam with: lParam

    ^nil!
   
wmVScroll: aWordInteger with: aLongInteger
        "Private - Process a WM_VSCROLL message."
    | type pos |
    type := aWordInteger.
    type = SbLineup ifTrue: [
            (self verticalScrollPos > self verticalScrollMinRange) ifTrue:[
                 self scrollVertical: self amountToScrollUp]].
    type = SbLinedown ifTrue: [
            (self verticalScrollPos < self verticalScrollMaxRange) ifTrue:[
                self scrollVertical: self amountToScrollUp negated]].
    type = SbPageup ifTrue: [
            self scrollVertical: (self amountToPageUp
                min: (self verticalScrollPos - self verticalScrollMinRange)) ].
    type = SbPagedown ifTrue: [
            self scrollVertical: (self amountToPageUp
                min: (self verticalScrollMaxRange - self verticalScrollPos)) negated].
    type = SbThumbposition
        ifTrue: ["end of tracking"
            pos := WinStructure new: 4.
            pos uLongAtOffset: 0 put: aLongInteger.
            pos := pos shortAtOffset: 0.
            self scrollVertical: self topCorner y - pos.
            self updateVerticalSliderTo: pos.
            ^nil].
    type = SbThumbtrack
        ifTrue: [^nil]
        ifFalse: [self updateVerticalSlider].
   ^nil! !



!WBToolPalette class methods !
   
isWBInternalClass

    ^true!
 
supportedEvents

    ^super supportedEvents
        add: #select;
        add: #selecting;
        add: #doubleClick;
        add: #gettingFocus;
        add: #showHelp;
        yourself! !



!WBToolPalette methods !
   
aboutToSaveImage

    self elements do: [ :tool | tool pen: nil ].!
   
add: aSelector

    ^self add: nil selector: aSelector!
   
add: bitmapSelector selector: aSelector
    | key point |
    key := self elements size + 1.
    point := ((key - 1)\\(self size x)+1) @ ((key + (self size x - 1))//(self size x )).
    ^self at: point put: bitmapSelector selector: aSelector.!
 
at: key put: bitmapSelector

    ^self at: key put: bitmapSelector selector: nil!
 
at: key put: bitmapSelector selector: aSelector

    | selector bitmap file element |

    selector := bitmapSelector isString ifTrue: [ bitmapSelector ] ifFalse: [ aSelector ].
    self useSystem ifTrue: [
        bitmap := CPBitmapDict sysAt: selector asString ifAbsent: [ nil ].
    ] ifFalse: [
        bitmap := CPBitmapDict at: selector asString ifAbsent: [ nil ].
    ].
    bitmap ifNil: [ ^nil ].
    cellSize isNil ifTrue: [ self cellSize: (bitmap width // 2) @ bitmap height ].

    self elements at: key put: (element := self wbToolClass bitmap: bitmap selector: aSelector).
    bitmapSelector isNil ifFalse: [ element bitmapSelector: bitmapSelector ].

    ^element!
 
at: key selector: aSelector

    ^self at: key put: nil selector: aSelector!
  
bitmapFileAt: key
    | element |
    (self validSelection: key) ifFalse: [ ^nil ].

    ^(element := self elementAt: key) isNil
            ifTrue: [ nil ]
            ifFalse: [ element file ]!
   
button1DoubleClick: aPane

    self event: #doubleClick!
  
button1Down: aPoint

    | index |

    index := self highlight: selection.
    self event: #gettingFocus.

    self captureMouseInput.
    Notifier consumeInputUntil: [:event |
        index := self highlight: index.
        (event notNil and: [ event selector == #button1Up: ])
    ].
    self clearMouseCapture.

    (self isEnabled: index) ifTrue: [
        selection := index.
        self isPreAutomatic ifTrue: [self unHighlightBitmap: selection].
        self generateEventFor: selection.
        self eventFor: selection.
        self event: #select.
        self isPostAutomatic ifTrue: [self unHighlightBitmap: selection].
        self isAutomatic ifTrue: [ selection := nil ].
    ] ifFalse: [
        self highlightBitmap: selection.
    ].!
  
buttonFrom: anBitmapFile size: aPoint
    | aBitmap |
    anBitmapFile isNil
        ifTrue: [
            aBitmap := Bitmap extent: aPoint.
            aBitmap pen centerText: '?' at: aBitmap boundingBox center.
            ^aBitmap ].
    ^((anBitmapFile includes: $*) not and: [File exists: anBitmapFile])
        ifTrue: [ Bitmap fromFile: anBitmapFile ]
        ifFalse: [
            aBitmap := Bitmap screenExtent: aPoint.
            aBitmap pen
                draw3DButton: (self justFileName: anBitmapFile)
                rect: aBitmap boundingBox
                font: self font.
            aBitmap]!
   
cachedElements

    ^cachedElements ifNil: [ cachedElements := Set new ]!
 
cachedElements: aCollection

    cachedElements := aCollection!
   
cacheRedraw

    ^cacheRedraw ifNil: [ cacheRedraw := false ].!
   
cacheRedraw: aBoolean

    cacheRedraw := aBoolean!
   
cacheRedrawOff

    self cacheRedraw: false.
    self cachedElements do: [ :element |
        self display: element
    ].
    self cachedElements: nil.!
 
cacheRedrawOn

    self cacheRedraw: true.!
   
cellHeight
    ^self cellSize y!
   
cellSize

    ^cellSize ifNil: [ cellSize := self defaultCellSize ].!
 
cellSize: aPoint

    cellSize := aPoint!
 
cellWidth
    ^self cellSize x!

close
        "Private - Close the receiver."
    self releaseBitmaps.
    ^super close!
 
collectionType

    ^Dictionary!
  
currentIndex
    | point |
    point := Cursor offset mapToWindow: self.
    ^((point x - self leftTop x) // self cellWidth + 1) @
        ((point y - self leftTop y) // self cellHeight + 1).!

defaultCellSize

    ^28@28!
  
defaultSelection
    ^1@1!
 
defaultStyle
        "Private - Answer an Integer with appropriate styles in it."
    ^WsChild   |
    WsVisible!

disable
    super disable.
    self disableElements.!
 
disable: key
    | element |
    (element := self elementAt: key) isNil ifFalse: [
        element isEnabled ifTrue: [
            element disabled.
            self handle isValid ifTrue: [ self display: key ]
        ]
    ].!
 
disableElements
    self elements keysDo: [ :key |
        self disable: key ].!
  
disableItem: aSelector
    self disable: (self elementAtSelector: aSelector)!
  
display

    1 to: self width do: [ :x |
        1 to: self height do: [ :y |
            self display: x@y
        ]
    ]!
  
display: key

    self cacheRedraw ifTrue: [
        self cachedElements add: key
    ] ifFalse: [
        self displayBitmap: key
    ].!

displayBitmap: key

    | element rect |

    element := self elementAt: key.
    element isNil ifTrue: [ ^nil ].

    self doGraphics: [
        self pen
            copy: element pen
            from: element boundingBox
            to: (rect := self rectForKey: key).
        element isDisabled ifTrue: [ self drawDisabledWith: self pen in: rect ].
    ].!

drawDisabledWith: aPen in: aRect

    aPen
        setLineWidth: 1;
        foreColor: ClrPalegray;
        backColor: ClrPalegray;
        drawRectangle: (aRect insetBy: 1);
        lineFrom: (aRect leftBottom rightAndUp: 2@3) to: (aRect rightBottom leftAndUp: 2@3);
        lineFrom: (aRect rightTop leftAndDown: 3@2) to: (aRect rightBottom leftAndUp: 3@2).!

elementAt: key

    ^self elements at: key ifAbsent: [ nil ]!
 
elementAt: key put: anElementArray

    self elements at: key put: anElementArray!

elementAtSelector: aSelector
    ^self elements keys detect: [ :key |
        (self selectorAt: key) = aSelector ] ifNone: [ nil ]!
   
elements

    ^elements!
  
elements: aCollection

    elements := aCollection!
   
enable
    super enable.
    self enableElements.!

enable: key
    | element |
    (element := self elementAt: key) isNil ifFalse: [
        element isEnabled ifFalse: [
            element up.
            self handle isValid ifTrue: [ self display: key ]
        ]
    ].!
   
enableElements
    self elements keysDo: [ :key |
        self enable: key ].!

enableItem: aSelector
    self enable: (self elementAtSelector: aSelector)!

eventFor: key

    | selector |

    selector := self selectorAt: key.

    (selector notNil and: [ selector isSymbol ])
        ifTrue: [
            (self owner class canUnderstand: selector)
                ifTrue: [
                    (selector includes: $:)
                        ifTrue: [self owner perform: selector with: self]
                        ifFalse: [self owner perform: selector]]].!
   
generateEventFor: aSelection

    self event: (
        'R', aSelection y asString,
        'C', aSelection x asString) asSymbol.!
  
getGraphicsTool
        "Private - Initialize an empty pen tool."
    ^Pen forDC: nil medium: self!
   
height

    ^self size y!
 
highlight: currentSelection
    | index element |
    index := self currentIndex.
    currentSelection = index ifFalse: [ self event: #showHelp ].
    (self isEnabled: index) ifTrue: [
        (currentSelection = index)
            ifFalse: [
                self unHighlightBitmap: currentSelection.
                self highlightBitmap: index.
                self event: #selecting.
            ].
    ] ifFalse: [
        self unHighlightBitmap: currentSelection.
        index := nil
    ].
    ^index!
  
highlightBitmap: key

    | element |
    element := self elementAt: key.
    (element isNil or: [ element isDisabled ]) ifTrue: [ ^nil ].
    element down.
    self display: key.!
  
initialize

    super initialize.
    self elements: self newPage.!
  
isAutomatic
    ^(self isPostAutomatic) | (self isPreAutomatic)!
   
isEnabled: key
    | element |
    ^(element := self elementAt: key) isNil
            ifTrue: [ false ]
            ifFalse: [ element isEnabled ]!

isPostAutomatic
    ^tpStyle = #postAutomatic!
 
isPreAutomatic
    ^tpStyle = #preAutomatic!
   
justFileName: fileName
    ^((File splitPath: fileName in: Disk) at: 3) upTo: $.!
  
leftTop

    ^(0@0 extent: self extent) leftTop!
  
newPage

    ^self collectionType new!

postAutomatic
    tpStyle := #postAutomatic!
   
preAutomatic
    tpStyle := #preAutomatic!
 
rectForKey: key

    | element |
    element := self elementAt: key.
    element ifNil: [ ^0@0 extent: 0@0 ].
    element rectangle ifNil: [
        element rectangle:
            ((self leftTop x right: (key x - 1) * (self cellWidth - 1)) @
            (self leftTop y down: (key y - 1) * (self cellHeight - 1))
            extentFromLeftTop: cellSize).
    ].
    ^element rectangle!

releaseBitmaps
        "Private - Release all bitmaps."
    | aBitmap |
    self elements do: [ :element | element isNil ifFalse: [ element releaseBitmaps ]].
    self elements: nil.!
 
selectedItem

    ^selection!
 
selectItem: key

    self unHighlightBitmap: selection.
    selection := key.
    self highlightBitmap: key.!
   
selector

    ^self selectorAt: selection!

selectorAt: key
    | element |
    (self validSelection: key) ifFalse: [ ^nil ].

    ^(element := self elementAt: key) isNil
            ifTrue: [ nil ]
            ifFalse: [ element selector ]!
 
size

    size isNil ifTrue: [ size := 0@0 ].
    ^size!
 
size: aPoint

    size := aPoint.!

stateAt: key
    | element |
    (self validSelection: key) ifFalse: [ ^nil ].

    ^(element := self elementAt: key) isNil
            ifTrue: [ nil ]
            ifFalse: [ element state ]!
   
stateAt: key put: aSymbol
    | element |
    (element := self elementAt: key) isNil ifFalse: [
        element state: aSymbol.
    ].!
 
toggle
    tpStyle := #toggle!
 
toggleWhite
    tpStyle := #toggleWhite!
   
tpStyle
    ^tpStyle!
  
tpStyle: aSymbol
    tpStyle := aSymbol!
   
unHighlightBitmap: key

    | element |
    element := self elementAt: key.
    (element isNil or: [ element isDisabled ]) ifTrue: [ ^nil ].
    element up.
    self display: key.!
  
unHighlightSelection
    self unHighlightBitmap: selection.
    selection := nil.!

updateSliders!
  
useSystem

    ^useSystem ifNil: [ useSystem := false ].!
 
useSystem: aBoolean

    useSystem := aBoolean!
   
validSelection: key

    ^(self elementAt: key) notNil!
   
virtualKeyInput: anInt!
 
wbToolClass

    ^WBTool!
 
when: anEvent perform: aMessage
        "Notify the owner whenever anEvent occurs by
         performing aMessage.  For compatibility,
         aMessage can be a one argument selector."
    | m |
    m := aMessage.
    "aMessage isSymbol ifTrue: [m := Message new
        receiver: (self owner notNil ifTrue: [self owner] 
            ifFalse: [self sender])
        selector: aMessage
        arguments: (Array with: self)]."
    handlers at: anEvent put: m.!
 
width

    ^self size x! !



!CPBitmapDict class methods !
   
addBitmaps: aFileName

    | theDict |
    (Smalltalk includesKey: #CPSrcDir) ifTrue: [
        theDict := self fromFile: (Smalltalk at: #CPSrcDir), aFileName.
    ] ifFalse: [
        theDict := self fromFile: aFileName.
    ].
    theDict isNil ifTrue: [ ^nil ].
    TheDict isNil ifTrue: [
        self defaultBitmapDictionary: theDict
    ] ifFalse: [
        theDict associationsDo: [ :assoc | self defaultBitmapDictionary add: assoc ].
    ].!
  
addSystemBitmaps: aFileName

    | theDict |
    (Smalltalk includesKey: #CPSrcDir) ifTrue: [
        theDict := self fromFile: (Smalltalk at: #CPSrcDir), aFileName.
    ] ifFalse: [
        theDict := self fromFile: aFileName.
    ].
    theDict isNil ifTrue: [ ^nil ].
    WBSystem isNil ifTrue: [
        self systemBitmapDictionary: theDict
    ] ifFalse: [
        theDict associationsDo: [ :assoc | self systemBitmapDictionary add: assoc ].
    ].!
 
at: key

    ^self defaultBitmapDictionary at: key!
   
at: key ifAbsent: block

    ^self defaultBitmapDictionary at: key ifAbsent: block!
   
at: key put: value

    self defaultBitmapDictionary at: key put: value!
  
defaultBitmapDictionary

    ^TheDict!

defaultBitmapDictionary: aDict

    TheDict := aDict!
 
fromFile: fileName

    | file aDict |

    file := File pathName: fileName.
    file nextLine = 'BITMAPS' ifFalse: [
        file close.
        MessageBox message: 'This file is not a valid bitmap dictionary.'.
        ^nil
    ] ifTrue: [
        aDict := self new.
        [ file atEnd ] whileFalse: [
            aDict at: file nextLine put: (Bitmap fromStream: file).
        ].
    ].
    file close.

    ^aDict!
   
keyAtValue: v

    ^self defaultBitmapDictionary keyAtValue: v!
   
keyAtValue: v ifAbsent: block

    ^self defaultBitmapDictionary keyAtValue: v ifAbsent: block!
   
keys

    ^self defaultBitmapDictionary keys!
 
loadBitmaps

    self loadBitmaps: 'bitmaps.bdt'!
 
loadBitmaps: aFileName

    | dict |
    (Smalltalk includesKey: #CPSrcDir) ifTrue: [
        self defaultBitmapDictionary: (self fromFile: (Smalltalk at: #CPSrcDir), aFileName)
    ] ifFalse: [
        dict := self fromFile: aFileName.
        dict isNil ifFalse: [ self defaultBitmapDictionary: dict ]
    ].!
 
loadSystemBitmaps: aFileName

    | dict |
    (Smalltalk includesKey: #CPSrcDir) ifTrue: [
        self systemBitmapDictionary: (self fromFile: (Smalltalk at: #CPSrcDir), aFileName)
    ] ifFalse: [
        dict := self fromFile: aFileName.
        dict isNil ifFalse: [ self systemBitmapDictionary: dict ]
    ].!
 
saveBitmaps

    self defaultBitmapDictionary saveOn: 'bitmaps'!
  
sysAt: key

    ^self systemBitmapDictionary at: key!
 
sysAt: key ifAbsent: block

    ^self systemBitmapDictionary at: key ifAbsent: block!
 
sysAt: key put: value

    self systemBitmapDictionary at: key put: value!

sysKeys

    ^self systemBitmapDictionary keys!
   
systemBitmapDictionary

    ^WBSystem!

systemBitmapDictionary: aDict

    WBSystem := aDict!
 
values

    ^self defaultBitmapDictionary values! !



!CPBitmapDict methods !

readConversionsFrom: fileName

    | file bitmapFile key |

    self isEmpty ifFalse: [
        self values do: [ :bitmap | bitmap release ].
        self keys do: [ :k | self removeKey: k ].
    ].
    file := File pathName: fileName.
    [ file atEnd ] whileFalse: [
        key := file nextLine asSymbol.
        bitmapFile := file nextLine.
        self at: key put: (Bitmap fromFile: bitmapFile).
    ].
    file close.!
 
saveConversionsOn: fileName in: dir

    | file bitmapFile count |

    file := File newFile: dir, fileName.
    count := 0.
    self keysDo: [:k |
        count := count + 1.
        bitmapFile := 'B', count asString, '.BMP'.
        file nextPutAll: k; cr; nextPutAll: dir, bitmapFile; cr.
        (self at: k) outputToFile: dir, bitmapFile.
    ].
    file close.!
 
saveOn: fileName

    | file |

    file := File newFile: fileName.
    file nextPutAll: 'BITMAPS'; cr.
    self keysDo: [:k |
        file nextPutAll: k; cr.
        (self at: k) storeOnStream: file.
    ].
    file close.! !



!WBListBox class methods !
  
supportedEvents
        "Answer the Set of events that ListBoxes can notify
         their owners about."
    ^super supportedEvents
        add: #commitSelection;
        add: #highlightItem;
        yourself! !



!WBListBox methods !
  
commitSelection

    ^(self event: #commitSelection) ~= false!

highlight: aDrawStruct

    | answer |

    userDrawn := aDrawStruct.
    (answer := self event: #highlightItem) notNil ifTrue: [
        ^self
    ].
    graphicsTool setHandle: ( aDrawStruct hDC );
        reverse: ( aDrawStruct boundingBox )!
  
selectIndex: anIndex

    "Digitalk ListBox didn't set tempSelection when selection
     manually set"

    tempSelection := anIndex.
    super selectIndex: anIndex.! !



!FramingParameters class methods !

dialogUnit

    ^(SysFont width  / 16)  @  (SysFont height / 32)!
 
new

    ^super new initialize! !



!FramingParameters methods !
 
bDU: y r: aSymbol

    bottom := (y * FramingParameters dialogUnit y) rounded.
    aSymbol == #center ifFalse: [ bottom := bottom abs ].
    bottomRel := aSymbol.!
 
bottom

    ^bottom!
  
bottom: y relativeTo: aSymbol

    aSymbol == #center
        ifTrue: [ bottom := y ] ifFalse: [ bottom := y abs ].
    bottomRel := aSymbol.!
  
bottomDialogUnits

    ^(bottom / FramingParameters dialogUnit y) rounded!

bottomProportional: y

    self bP: y!

bottomRel

    ^bottomRel!

bP: y

    y = 0  ifTrue: [
        bottom := 0.
        bottomRel := #top.
    ] ifFalse: [
        y = 1 ifTrue: [
            bottom := 0.
            bottomRel := #bottom.
        ] ifFalse: [
            bottom := y.
            bottomRel := #top.
        ].
    ].!

centerX

    ^centerX!

centerX: aBoolean

    centerX := aBoolean!
   
centerY

    ^centerY!

centerY: aBoolean

    centerY := aBoolean!
   
clientRect

    ^clientRect!
  
clientRect: e

    clientRect :=  e!
  
cRDU

        ^(self clientRect leftBottom / FramingParameters dialogUnit) rounded rightBottom: (self clientRect rightTop / FramingParameters dialogUnit) rounded.!
   
cRDU: aRect

        | newRect |

        newRect := (aRect leftBottom * FramingParameters dialogUnit) rounded rightBottom: (aRect rightTop * FramingParameters dialogUnit) rounded.

        self clientRect: newRect.!
  
fromRect: aRect inRect: parentRect

    self left: aRect left relativeTo: #left.
    self right: aRect right relativeTo: #left.
    self top: parentRect top - aRect top relativeTo: #top.
    self bottom: parentRect top - aRect bottom relativeTo: #top.
    initialExtent := aRect extent.!
   
iDUE

    ^(initialExtent / self class dialogUnit ) rounded!
  
iDUE: e

    initialExtent := (e * self class dialogUnit) rounded.!
   
indent

    ^indent!
  
indent: anIndent

    indent := anIndent.!

initialExtent

    ^initialExtent!

initialExtent: e

    initialExtent := e!
 
initialize

    centerX := false.
    centerY := false.
    indent := 0@0.
    initialExtent := 0@0.!
  
lDU: x r: aSymbol

    left := (x * FramingParameters dialogUnit x) rounded.
    aSymbol == #center ifFalse: [ left := left abs ].
    leftRel  := aSymbol.!

left

    ^left!
  
left: x relativeTo: aSymbol

    aSymbol == #center
        ifTrue: [ left := x ] ifFalse: [ left := x abs ].
    leftRel  := aSymbol.!
 
leftDialogUnits

    ^(left / FramingParameters dialogUnit x) rounded!

leftProportional: x

    self lP: x!
  
leftRel

    ^leftRel!

lP: x

    left := x.
    leftRel := #left.!
 
newFramerFromNewRect: newRect parentRect: containerRect

    "Create a new framing parameters for this pane, based on the
     values of self (i.e. update the relative values). "

    | newFramer |

    "Easy cases are left and bottom, vs. left and top for windows."

    newFramer := FramingParameters new.

    centerX ifTrue: [
        newFramer xCentered.
    ] ifFalse: [
        left notNil ifTrue: [
           left isInteger ifTrue: [
                (leftRel = #left) ifTrue: [
                    newFramer left: newRect left relativeTo: #left.
                ] ifFalse: [ (leftRel = #center) ifTrue: [
                    newFramer left: newRect left - (containerRect width // 2) relativeTo: #center.
                ] ifFalse: [
                    newFramer left: containerRect width - newRect left relativeTo: #right.
                ]].
            ] ifFalse: [
                newFramer leftProportional: (newRect left / containerRect width).
            ].
        ].

        right notNil ifTrue: [
           right isInteger ifTrue: [
                (rightRel = #left) ifTrue: [
                    newFramer right: newRect right relativeTo: #left.
                ] ifFalse: [ (rightRel = #center) ifTrue: [
                    newFramer right: newRect right - (containerRect width // 2) relativeTo: #center.
                ] ifFalse: [
                    newFramer right: containerRect width - newRect right relativeTo: #right.
                ]].
            ] ifFalse: [
                newFramer rightProportional: (newRect right / containerRect width).
            ].
        ].
    ].

    centerY ifTrue: [
        newFramer yCentered.
    ] ifFalse: [
        top notNil ifTrue: [
           top isInteger ifTrue: [
                (topRel = #top) ifTrue: [
                    newFramer top: newRect top relativeTo: #top.
                ] ifFalse: [ (topRel = #center) ifTrue: [
                    newFramer top: newRect top - (containerRect height // 2) relativeTo: #center.
                ] ifFalse: [
                    newFramer top: containerRect height - newRect top relativeTo: #bottom.
                ]].
            ] ifFalse: [
                newFramer topProportional: (newRect top / containerRect height).
            ].
        ].

        bottom notNil ifTrue: [
           bottom isInteger ifTrue: [
                (bottomRel = #top) ifTrue: [
                    newFramer bottom: newRect bottom relativeTo: #top.
                ] ifFalse: [ (bottomRel = #center) ifTrue: [
                    newFramer bottom: newRect bottom - (containerRect height // 2) relativeTo: #center.
                ] ifFalse: [
                    newFramer bottom: containerRect height - newRect bottom relativeTo: #bottom.
                ]].
            ] ifFalse: [
                newFramer bottomProportional: (newRect bottom / containerRect height).
            ].
        ].
    ].

    newFramer initialExtent: newRect extent.

    ^newFramer!
   
printOn: aStream

    centerX ifTrue: [
        aStream nextPutAll: '<xCentered>'; cr.
    ] ifFalse: [
        aStream nextPutAll: 'L:  <', left asString, ',', leftRel asString, '>'; cr.
        aStream nextPutAll: 'R: <', right asString, ',', rightRel asString, '>'; cr.
    ].

    centerY ifTrue: [
        aStream nextPutAll: '<yCentered>'; cr.
    ] ifFalse: [
        aStream nextPutAll: 'T: <', top asString, ',', topRel asString, '>'; cr.
        aStream nextPutAll: 'B: <', bottom asString, ',', bottomRel asString, '>'; cr.
    ].

    aStream nextPutAll: 'indent: ', indent asString; cr.
    aStream nextPutAll: 'clientRect: ', clientRect asString; cr.
    aStream nextPutAll: 'initialExtent: ', initialExtent asString; cr.!
  
rDU: x r: aSymbol

    right := (x * FramingParameters dialogUnit x) rounded.
    aSymbol == #center ifFalse: [ right := right abs ].
    rightRel := aSymbol.!
 
right

    ^right!

right: x relativeTo: aSymbol

    aSymbol == #center
        ifTrue: [ right := x ] ifFalse: [ right := x abs ].
    rightRel := aSymbol.!
  
rightDialogUnits

    ^(right / FramingParameters dialogUnit x) rounded!
  
rightProportional: x

    self rP: x!
 
rightRel

    ^rightRel!
  
rP: x

    x = 1 ifTrue: [
        right := 0.
        rightRel := #right.
    ] ifFalse: [
        x = 0 ifTrue: [
            right := 0.
            rightRel := #left.
        ] ifFalse: [
            right := x.
            rightRel := #left.
        ].
    ].!
  
storeOn: aStream indentString: indentString

    aStream nextPutAll: 'FramingParameters new iDUE: ', (initialExtent / self class dialogUnit ) rounded asString.

    centerX ifTrue: [
        aStream nextPutAll: '; xC'.
    ] ifFalse: [
        left notNil ifTrue: [
            left isFraction ifTrue: [
                aStream nextPutAll: '; lP: ', left asString.
            ] ifFalse: [
                aStream nextPutAll: '; lDU: ', self leftDialogUnits asString, ' '.
                aStream nextPutAll: 'r: #',leftRel asString.
            ].
        ].

        right notNil ifTrue: [
            right isFraction ifTrue: [
                aStream nextPutAll: '; rP: ', right asString.
            ] ifFalse: [
                aStream nextPutAll: '; rDU: ', self rightDialogUnits asString, ' '.
                aStream nextPutAll: 'r: #',rightRel asString.
            ].
        ].
    ].


    centerY ifTrue: [
        aStream nextPutAll: '; yC'.
    ] ifFalse: [
        top notNil ifTrue: [
            top isFraction ifTrue: [
                aStream nextPutAll: '; tP: ', top asString.
            ] ifFalse: [
                aStream nextPutAll: '; tDU: ', self topDialogUnits asString, ' '.
                aStream nextPutAll: 'r: #',topRel asString.
            ].
        ].

        bottom notNil ifTrue: [
            bottom isFraction ifTrue: [
                aStream nextPutAll: '; bP: ', bottom asString.
            ] ifFalse: [
                aStream nextPutAll: '; bDU: ', self bottomDialogUnits asString, ' '.
                aStream nextPutAll: 'r: #',bottomRel asString.
            ].
        ].
    ].

        clientRect notNil ifTrue: [
                aStream nextPutAll: '; cRDU: (',  self cRDU asString, ')'.
        ].

        indent = (0@0) ifFalse: [
                aStream nextPutAll: '; indent: ', indent asString.
        ].!
  
tDU: y r: aSymbol

    top := (y * FramingParameters dialogUnit y) rounded.
    aSymbol == #center ifFalse: [ top := top abs ].
    topRel := aSymbol.!
 
top

    ^top!

top: y relativeTo: aSymbol

    aSymbol == #center
        ifTrue: [ top := y ] ifFalse: [ top := y abs ].
    topRel := aSymbol.!
  
topDialogUnits

    ^(top / FramingParameters dialogUnit y) rounded!
  
topProportional: y

    self tP: y!
   
topRel

    ^topRel!
  
tP: y

    y = 1 ifTrue: [
        top := 0.
        topRel := #bottom.
    ] ifFalse: [
        top := y.
        topRel := #top.
    ].!
  
value: containerRect

    "Answer a rectangle based on self's framing parameters
     with a parent rectangle containerRect."

    | realTop realBottom realRight realLeft distance |

    centerX ifTrue: [
        distance := (containerRect extent x - initialExtent x) // 2.
        realLeft := containerRect left right: distance.
        realRight := containerRect right left: distance.
    ] ifFalse: [
        left isNil ifFalse: [
            left isInteger ifFalse: [
                realLeft := containerRect left right: (containerRect width * left) rounded.
            ] ifTrue: [
                (leftRel = #left) ifTrue: [
                    realLeft  := containerRect left right: left.
                ] ifFalse: [ (leftRel = #center) ifTrue: [
                    realLeft  := containerRect center x right: left.
                ] ifFalse: [
                    realLeft := containerRect right left: left.
                ]].
            ].
        ].

        right isNil ifFalse: [
            right isInteger ifFalse: [
                realRight := containerRect left right: (containerRect width * right) rounded.
            ] ifTrue: [
                (rightRel = #left) ifTrue: [
                    realRight  := containerRect left right: right.
                ] ifFalse: [ (rightRel = #center) ifTrue: [
                    realRight  := containerRect center x right: right.
                ] ifFalse: [
                    realRight := containerRect right left: right.
                ]].
            ].
        ] ifTrue: [
            realRight := realLeft right: initialExtent x.
        ].

        left isNil ifTrue: [
            realLeft := realRight left: initialExtent x.
        ].

    ].

    centerY ifTrue: [
        distance := (containerRect extent y - initialExtent y) // 2.
        realTop := containerRect top down: distance.
        realBottom := containerRect bottom up: distance.
    ] ifFalse: [

        top isNil ifFalse: [
            top isInteger ifFalse: [
                realTop := containerRect top down: (containerRect height * top) rounded.
            ] ifTrue: [
                (topRel = #top) ifTrue: [
                    realTop  := containerRect top down: top.
                ] ifFalse: [ (topRel = #center) ifTrue: [
                    realTop  := containerRect center y down: top.
                ] ifFalse: [
                    realTop := containerRect bottom up: top.
                ]].
            ].
        ].

        bottom isNil ifFalse: [
            bottom isInteger ifFalse: [
                realBottom := containerRect top down: (containerRect height * bottom) rounded.
            ] ifTrue: [
                (bottomRel = #top) ifTrue: [
                    realBottom  := containerRect top down: bottom.
                ] ifFalse: [ (bottomRel = #center) ifTrue: [
                    realBottom  := containerRect center y down: bottom.
                ] ifFalse: [
                    realBottom := containerRect bottom up: bottom.
                ]].
            ].
        ] ifTrue: [
            realBottom := realTop down: initialExtent y.
        ].

        top isNil ifTrue: [
            realTop := realBottom up: initialExtent y.
        ].
    ].

    ^(realLeft @ realTop rightBottom: realRight @ realBottom)!
   
xC

    centerX := true.!
 
xCentered

    self xC!
   
yC

    centerY := true.!
 
yCentered

    self yC! !



!CPStaticGraphic class methods ! !



!CPStaticGraphic methods !
 
createBitmap: aString
    "Added by OSI"
    | aPoint aBitmap |
    aPoint := self cpSize.
    aBitmap := Bitmap
        screenWidth: aPoint x
        height: aPoint y.
    aBitmap pen
        fill: self backColor;
        foreColor: self foreColor;
        backColor: self backColor;
        setBackMode: Transparent;
        setTextAlign: TaTop;
        font: (self font isNil ifTrue: [ self defaultFont ] ifFalse: [ self font ]);
        centerWinText: aString at: aBitmap boundingBox center.
   self contents: aBitmap!
   
disable

    self noRedraw: true.
    super disable.
    self noRedraw: false.!
 
initialize
    "Added by OSI"
    super initialize.
    self sendInputEvent: #disable.! !



!EntryFieldGroup class methods !

supportedEvents
        "Private - Answer the events supported by this subpane."
    ^super supportedEvents
        add: #textChanged;
        yourself! !



!EntryFieldGroup methods !

addSubpanes

    | numRows contents labelWidth fieldHeight scrollWidth vertOffset lowest |

    contents := self list.
    self font isNil ifTrue: [ self font: self defaultFont ].
    labelWidth := (contents inject: 0 into: [ :max :item | max max: (self font wbStringWidth: item) ]) + 8.
    fieldHeight := self font height + 8.
    scrollWidth := 0.
    self cpStyle isNil ifTrue: [
        vertOffset := self font height + 2.
        self addSubpane: (
            GroupBox new
                owner: self;
                framingBlock: ( FramingParameters new iDUE: initialSize; lP: 0; rP: 1; tP: 0; bP: 1);
                paneName: 'group';
                startGroup;
                contents: self label;
                yourself).
    ] ifFalse: [
        vertOffset := 0.
    ].
    numRows := contents size max: 1.
    1 to: numRows do: [ :row |
            row > self contents size ifFalse: [
                self addSubpane: (
                   StaticText new
                        owner: self;
                        propertyAt: #index put: row;
                        framingBlock: ( FramingParameters new
                            left: 2 relativeTo: #left;
                            right: 2 + labelWidth relativeTo: #left;
                            top: 10 + vertOffset + ((fieldHeight + 4) * (row - 1)) relativeTo: #top;
                            bottom: 2 + vertOffset + ((fieldHeight + 4) * row) relativeTo: #top);
                        rightJustified;
                        contents: (contents at: row),':';
                        yourself).
                self addSubpane: (
                   self fieldClass new
                        owner: self;
                        propertyAt: #index put: row;
                        framingBlock: ( FramingParameters new
                            left: 6 + labelWidth relativeTo: #left;
                            right: 4 + scrollWidth relativeTo: #right;
                            top: 6 + vertOffset + ((fieldHeight + 4) * (row - 1)) relativeTo: #top;
                            bottom: (lowest := 2 + vertOffset + ((fieldHeight + 4) * row)) relativeTo: #top;
                            indent: 3 @ 4);
                        when: #textChanged perform: #textChanged:;
                        contents: (self contents at: (contents at: row));
                        paneName: (contents at: row);
                        startGroup;
                        tabStop;
                        yourself).
           ].
    ].
    initialSize y: lowest + 4.!
   
backColor: aColor

    super backColor: aColor.
    self children do: [ :child | child backColor: aColor ].!
 
contents

    ^dictionary ifNil: [ dictionary := Dictionary new ].!
   
contents: aDictionaryOfStrings

    handle = NullHandle ifFalse: [^self].
    aDictionaryOfStrings isDictionary ifTrue: [
        self list: aDictionaryOfStrings keys asArray.
        dictionary := aDictionaryOfStrings
    ] ifFalse: [ aDictionaryOfStrings size > 0 ifTrue: [
        self list: aDictionaryOfStrings.
        dictionary := Dictionary new.
        aDictionaryOfStrings do: [ :item | dictionary at: item put: '' ].
    ] ifFalse: [
        self list: #().
        dictionary := Dictionary new
    ]].
    children := nil.
    self addSubpanes.!
   
cpStyle

    ^self propertyAt: #cpStyle!
  
fieldClass

    ^WBEntryField!

foreColor: aColor

    super foreColor: aColor.
    self children do: [ :child | child foreColor: aColor ].!
 
label

    ^label ifNil: [ label := '' ]!
 
label: aString

    | gb |
    label := aString.
    ((gb := self paneNamed: 'group') notNil and: [ gb handle isValid ]) ifTrue: [ gb contents: aString ].!
 
list

    ^self propertyAt: #list!

list: aCollection

    self propertyAt: #list put: aCollection!
   
noGroupBox

    self propertyAt: #cpStyle put: #noGroupBox!
   
setLabelFont: aFont

    (self children select: [:pane | pane class == StaticText ]) do: [:field | field font: aFont].
    self update!
  
setValueFont: aFont

    (self children select: [:pane | pane class == self fieldClass ]) do: [:field | field font: aFont].
    self update!
 
textChanged: aPane

    self contents at: aPane paneName put: aPane contents.
    self event: #textChanged.!
 
verticalScrollBar

    super verticalScrollBar.
    self propertyAt: #cpStyle put: #verticalScrollBar! !


!Window methods !
wmGetminmaxinfo: arg1 with: arg2

    "Added by OSI"
    #addedByOSI.
    ^nil! !

!Window methods !
addSubpane: aWindow

    "Modified by OSI to support CUA keyboard input"
        "Add aWindow as the child of the receiver."
    | id name getContentsHandler |
    #modifiedByOSI.
    children isNil ifTrue: [
        children := IdentityDictionary new].

    "OSI - Needed to have children represented as OrderedCollection,
      since ordering relevant.  Digitalk stores them as an identity dictionary,
      which loses ordering.  Previous method of sorting on id fails for buttons
      with idOk and idCancel"
    self addToSubpaneOrder: aWindow.

    id := aWindow propertyAt:#id.
    id isNil ifTrue:[ aWindow propertyAt:#id put: self getNextChildId].
    "Check if duplicate 'idCancel' or 'idOK' message might have been sent to the childs of this window."
    children at: self getNextChildSlot put: aWindow.
    aWindow parent: self.
    aWindow owner isNil ifTrue: [
        aWindow owner: self owner].

    (self mainWindow propertyAt: #focusWindow) isNil & aWindow isWsTabstop ifTrue: [
        (aWindow isRadio not or:  [ aWindow selection ]) ifTrue: [
            self mainWindow propertyAt: #focusWindow put: aWindow.
        ].
    ].

    name := aWindow name.
    getContentsHandler := aWindow getContentsHandler.
    self mainWindow add: aWindow interestIn: name.
    name ~= getContentsHandler ifTrue: [
        self mainWindow add: aWindow interestIn: getContentsHandler
    ].!    !

!Window methods !
topParent
    "Added by OSI"
    #addedByOSI.
    (parent isApplicationWindow)
        ifTrue: [^parent]
        ifFalse: [^parent topParent]! !

!Window methods !
dialogTemplate: ignore
    "Added by OSI"
    #addedByOSI.
    ^self!    !

!Window methods !
addSubpaneDynamically: aSubPane
    "Added by OSI - Add a subpane to a window dynamically"
    #addedByOSI.
    self addSubpane: aSubPane.
    aSubPane open;
        initSize: self rectangle;
        buildWindow: self;
        resize: self rectangle;
        updateRectangle;
        validate.! !

!Window methods !
notebookParent
    "Added by OSI"
    #addedByOSI.
    ^nil.!    !

!Window methods !
modifiedBy
    "Added by OSI - reports modification information"
    #addedByOSI.
    ^self propertyAt: #modifiedBy! !

!Window methods !
modifiedBy: aString
    "Added by OSI - records modification information"
    self addedByOSI.
    self propertyAt: #modifiedBy put: aString.!   !

!Window methods !
paneName

    "Added by OSI"
    #addedByOSI.
    ^self propertyAt: #paneName!  !

!Window methods !
createdBy
    "Added by OSI - reports creation information"
    #addedByOSI.
    ^self propertyAt: #createdBy!   !

!Window methods !
dialogTemplate
    "Added by OSI"
    #addedByOSI.
    ^nil! !

!Window methods !
createdBy: aString
    "Added by OSI - records creation information"
    #addedByOSI.
    self propertyAt: #createdBy put: aString.! !

!Window methods !
add: aWindow interestIn: name
    #addedByOSI! !

!Window methods !
getSubpaneOrder

    "Added by OSI - Needed to have children represented as OrderedCollection,
      since ordering relevant.  Digitalk stores them as an identity dictionary,
      which loses ordering.  Previous method of sorting on id fails for buttons
      with idOk and idCancel"
    | order |

    #addedByOSI.
    (order := self propertyAt: #subpaneOrder) isNil ifTrue: [
        ^OrderedCollection new
    ].

    ^order!  !

!Window methods !
getContentsHandler
    "Added by OSI"
    #addedByOSI.
    ^self handlers at: #getContents ifAbsent: [nil].! !

!Window methods !
redraw
    "Added by OSI. Redraw the entire window."
    #addedByOSI.
    self invalidateRect: nil!  !

!Window methods !
addToSubpaneOrder: aWindow

    "Added by OSI - Needed to have children represented as OrderedCollection,
      since ordering relevant.  Digitalk stores them as an identity dictionary,
      which loses ordering.  Previous method of sorting on id fails for buttons
      with idOk and idCancel"
    (self propertyAt: #subpaneOrder) notNil ifFalse: [
        #addedByOSI.
        self propertyAt: #subpaneOrder put: OrderedCollection new.
    ].

    (self propertyAt: #subpaneOrder) addLast: aWindow.!   !

!Window methods !
windowText
   "Modified by OSI to fix intermittent failures. Thanks to Tom Lipkis"
   "Answer the receiver's window text."
    | length string size winAdr |
    #modifiedByOSI.
     handle isValid
        ifTrue:[
            length := self windowTextLength.
            length < 0 ifTrue: [ ^String new ].
            winAdr := WinAddress allocateMemory: length + 1.
            winAdr isNil ifTrue: [ ^String new ].
            size := UserLibrary
                getWindowTextW: self handle
                text: winAdr asParameter
                maxLength: length + 1.
            string := String new: size.
            WinAddress copyFrom: winAdr to: string count: size. winAdr unlockAndFree.
            ^string asNormalizedString ]
        ifFalse:[^ String new]!  !

!Window methods !
iconFile
    "Added by OSI - supports attatching icons to windows"
    #addedByOSI.
    ^self propertyAt: #iconFile! !

!Window methods !
paneNamed: aString

    "Added by OSI"

    | aName result |

    aName := aString asString.
    self paneName = aName ifTrue: [
        #addedByOSI.
        ^self
    ].

    children notNil ifTrue: [
        children do: [ :c |
            (result := c paneNamed: aName) notNil ifTrue: [
                ^result
            ].
        ].

    ].

    ^nil! !

!Window methods !
allChildren
    "Added by OSI - Answer a collection containing the
     receiver's children, and any nested children
     (children of children, etc.)"
    | collection |
    #addedByOSI.
    collection := OrderedCollection new.
    children notNil ifTrue: [
        children do: [ :child |
            collection add: child.
            collection addAll: child allChildren ] ].
    ^collection! !

!Window methods !
paneName: aName

    "Added by OSI"
    #addedByOSI.
    ^self propertyAt: #paneName  put: aName!   !

!Window methods !
accel: aChar  afBits: theAfBits

    "Modified by OSI to check for <theAfBits> = 0"
    "Private - Allows a window to intercept character input
     before it is processed either by the menu or the child window.  Returning
     true will cause the character input to be ignored from here on."

    #modifiedByOSI.
    (aChar = VkF1 and: [theAfBits isNil or: [theAfBits = 0]]) ifTrue:[
        self helpManager notNil ifTrue:[self helpRequest.^true]].!    !

!Window methods !
wmCommand: wordInteger with: longInteger
        "Modified by OSI to return a value other than nil if desired."
        "Private - Process the command message."
    | control answer |
    (self helpModeCommand: wordInteger) notNil ifTrue:[^0].

    (( longInteger \\ 65536 ) > 0 or: [self isKindOf: DialogTopPane])
        ifTrue: [                    "= 0 for 'enter' key"
            #modifiedByOSI.
            ( control :=  self childAtId: wordInteger
            ) notNil ifTrue: [
                "If the control returns an integer.... otherwise return nil."
                ( answer := control syncControlEvent: ( longInteger // 65536 )
                ) isInteger ifFalse: [ answer := nil ] ] ]
        ifFalse: [
            self sendInputEvent: #performMenuItem:
                with: wordInteger ].

    ^answer!   !

!Window methods !
iconFile: aString
    "Added by OSI - supports attatching icons to windows"
    | file |
    self propertyAt: #iconFile put: aString.
    #addedByOSI.
    (File exists: aString) ifTrue: [
        self icon: (Icon fromFile: aString)
    ] ifFalse: [
        file := (File splitPath: aString in: Disk) at: 3.
        (File exists: file) ifTrue: [
            self icon: (Icon fromFile: file)
        ].
    ].!    !

!Window methods !
helpManager
    "Added by OSI to fix Digitalk bug"
        "Private - Answer the HelpManager for the receiver."
    #addedByOSI.
    ^self propertyAt: #helpManager!    !

!Integer methods !   
bitIsOn: n

    "Added by OSI"

    #addedByOSI.
    ^(self bitAnd: n) = n!    !

!ViewManager methods !   
centeredOnMouse
    "Added by OSI - Open the receiver centered over the mouse.
     Call this method from within #preInitWindow"
    | framingBlock mousePos initialExtent |
    #addedByOSI.
    mousePos := CursorManager cursorPosition.
    framingBlock := self mainView framingBlock.
    initialExtent := framingBlock initialExtent.
    framingBlock
        centerX: false; centerY: false;
        left: (((mousePos x left: framingBlock initialExtent x // 2) max: 0) min: (Display width - initialExtent x))
        relativeTo: #left;
        top: (((mousePos y up: framingBlock initialExtent y // 2) max: 0) min: (Display height - initialExtent y))
        relativeTo: #top.!    !

!ViewManager methods !   
openWithMyParent: aViewManager
    "Added by OSI - Open a the receiver as a child of
     aViewManager's parent (a sibling)."
    aViewManager mainView parent isNil ifTrue: [
        #addedByOSI.
        ^self open
    ] ifFalse: [
        ^self openWithParent: aViewManager mainView parent
    ]!   !

!ViewManager methods !   
createViews
    "Added by OSI - Default #createViews method."
    #addedByOSI.
    ^self createViewsFor: self owner: self!   !

!ViewManager methods !   
open
    "Added by OSI - Open the receiver."
    | newInstance |
    newInstance := self createViews.
    newInstance notNil ifTrue: [
        newInstance openViews.
    ] ifFalse: [
        #addedByOSI.
        MessageBox message:
            self class name,' does not have a #createViews method or its own #open method.'
    ].
    ^newInstance! !

!ViewManager methods !   
openAsMDIParent
    "Added by OSI - Open the receiver as an
     MDI parent window."
    | newInstance |
    (Smalltalk includesKey: #MDISystem) ifFalse: [
        MessageBox message: 'Cannot open ',self class name,
            ' because the MDI support is not installed.'.
        ^nil
    ].
    newInstance := self
        execute: [ self createViews ]
        withTopPane: (Smalltalk at: #MDIFrame).
    newInstance notNil ifTrue: [
        (newInstance menuWindow menus isEmpty and: [
        (newInstance mainView handlesEvent: #menuBuilt) not ]) ifTrue: [
            newInstance menuWindow addMenu:
                (Menu new title: '&MDI'; owner: self; yourself)
        ].
        newInstance openViews.
    ] ifFalse: [
        #addedByOSI.
        MessageBox message:
            self class name,' does not have a #createViews method or its own #open method.'
    ].
    ^newInstance! !

!ViewManager methods !   
dialogTemplate: ignore
    "Added by OSI"
    #addedByOSI.
    ^self!    !

!ViewManager methods !   
openWithOwnerParent: aViewManager
    "Added by OSI - Open the receiver with aViewManager as Parent
    and owner of all the subpanes. This method can only be used in
    conjunction with the 'Power Views' Add-In."
    | newInstance |
    newInstance := self createViewsFor: self owner: aViewManager.
    newInstance notNil ifTrue: [
        newInstance
            parent: aViewManager;
            openViews.
    ] ifFalse: [
        #addedByOSI.
        MessageBox message:
            self class name,' does not have a #createViewsFor:owner: method.'
    ].
    ^newInstance!  !

!ViewManager methods !   
positionRelativeTo: aViewManager offset: aPoint
    "Added by OSI - Open the receiver relative to <aViewmanager>.
     Call this method from within #preInitWindow"
    | framingBlock leftTop initialExtent |
    #addedByOSI.
    leftTop := aViewManager mainView frameRectangle leftTop.
    framingBlock := self mainView framingBlock.
    initialExtent := framingBlock initialExtent.
    framingBlock
        centerX: false; centerY: false;
        left: (((leftTop x right: aPoint x) max: 0) min: (Display width - initialExtent x))
        relativeTo: #left;
        top: (((leftTop y down: aPoint y) max: 0) min: (Display height - initialExtent y))
        relativeTo: #top.!    !

!ViewManager methods !   
openRelativeTo: aViewManager offset: aPoint
    "Added by OSI - Open the receiver relative to <aViewManager>."
    | newInstance framingBlock mousePos |
    newInstance := self createViews.
    newInstance notNil ifTrue: [
        newInstance
            positionRelativeTo: aViewManager offset: aPoint;
            openViews.
    ] ifFalse: [
        #addedByOSI.
        MessageBox message:
            self class name,' does not have a #createViews method or its own #open method.'
    ].
    ^newInstance!  !

!ViewManager methods !   
dialogTemplate
    "Added by OSI"
    #addedByOSI.
    ^nil! !

!ViewManager methods !   
isModal

    "Added by OSI"
    #addedByOSI.
    ^false!    !

!ViewManager methods !   
openWithParent: aViewManager
    "Added by OSI - Open the receiver with aViewManager as Parent."
    | newInstance |
    newInstance := self createViews.
    newInstance notNil ifTrue: [
        newInstance parent: aViewManager; openViews.
    ] ifFalse: [
        #addedByOSI.
        MessageBox message:
            self class name,' does not have a #createViews method.'
    ].
    ^newInstance!   !

!ViewManager methods !   
isWBWindow

    "Added by OSI"
    #addedByOSI.
    ^self class wbCreated!  !

!ViewManager methods !   
removeView: aView
        "Remove aView from the view manager."
    views remove: aView!  !

!ViewManager methods !   
maxWindowSize
    "Added by OSI"
    #addedByOSI.
    ^nil!  !

!ViewManager methods !   
minWindowSize
    "Added by OSI"
    #addedByOSI.
    ^nil!  !

!ViewManager methods !   
openWithMDIParent: aViewManager
    "Added by OSI - Open the receiver with aViewManager as an MDI Parent."
    | newInstance frame |
    (Smalltalk includesKey: #MDISystem) ifFalse: [
        MessageBox message: 'Cannot open ',self class name,
            ' because the MDI support is not installed.'.
        ^nil
    ].
    frame := aViewManager frame.
    frame isNil ifTrue: [
        MessageBox message: 'Cannot open ',self class name,
            ' because the parent window does not have an MDI Frame.'.
        ^nil
    ].
    newInstance := self
        execute: [ self createViews ]
        withTopPane: (Smalltalk at: #MDIChild).
    newInstance notNil ifTrue: [
        self views do: [ :view |
            view frame: frame.
        ].
        newInstance openViews.
    ] ifFalse: [
        #addedByOSI.
        MessageBox message:
            self class name,' does not have a #createViews method.'
    ].
    ^newInstance!   !

!ViewManager methods !   
createViewsFor: target owner: owner
    "Added by OSI - Dummy method that returns nil."
    #addedByOSI.
    ^nil!   !

!ViewManager methods !   
openCenteredOnMouse
    "Added by OSI - Open the receiver centered over the mouse."
    | newInstance framingBlock mousePos |
    newInstance := self createViews.
    newInstance notNil ifTrue: [
        newInstance
            centeredOnMouse;
            openViews.
    ] ifFalse: [
        #addedByOSI.
        MessageBox message:
            self class name,' does not have a #createViews method or its own #open method.'
    ].
    ^newInstance! !

!ViewManager methods !   
openWithOwner: aViewManager
    "Added by OSI - Open the receiver with aViewManager as owner of
    all the subpanes (the target of the #when:perform: messages). This
    method can only be used in conjunction with the 'Power Views' Add-In."
    | newInstance |
    newInstance := self createViewsFor: self owner: aViewManager.
    newInstance notNil ifTrue: [
        newInstance openViews.
    ] ifFalse: [
        #addedByOSI.
        MessageBox message:
            self class name,' does not have a #createViewsFor:owner: method.'
    ].
    ^newInstance!   !

!ViewManager methods !   
openViews
    "Added by OSI"
    #addedByOSI.
    ^self openWindow!  !

!ViewManager methods !   
openWindow

    "Modified by OSI to support preInitWindow and
      remove #respondsTo: message"

    "Open all the views."

    #modifiedByOSI.
    self preInitWindow.

    views do: [:each | each openWindow ]!   !

!ViewManager methods !   
viewNamed: aSymbol

    "Added by OSI"

    | string |

    #addedByOSI.
    string := aSymbol asString.

    views do: [ :v |
        v paneName = string ifTrue: [
            ^v
        ].
    ].

    ^nil! !

!ViewManager methods !   
centeredOnScreen
    "Added by OSI - Open the receiver centered on the screen.
     Call this method from within #preInitWindow"
    | framingBlock center initialExtent |
    #addedByOSI.
    center := Display extent // 2.
    framingBlock := self mainView framingBlock.
    initialExtent := framingBlock initialExtent.
    framingBlock
        centerX: false; centerY: false;
        left: (((center x left: framingBlock initialExtent x // 2) max: 0) min: (Display width - initialExtent x))
        relativeTo: #left;
        top: (((center y up: framingBlock initialExtent y // 2) max: 0) min: (Display height - initialExtent y))
        relativeTo: #top.! !

!ViewManager methods !   
closeWindow

    "Added by OSI for backward compatibility with
     WB Windows 1.x"
    #addedByOSI.
    ^self close!  !

!ViewManager methods !   
paneNamed: aSymbol

    "Added by OSI"

    | string pane |

    #addedByOSI.
    string := aSymbol asString.

    views do: [ :v |
        v children do: [ :c |
            c paneName = string ifTrue:[ ^c ].
        ].
    ].
    views do: [ :v |
        v children do: [ :c |
            (pane := c paneNamed: string) notNil ifTrue: [
                ^pane
            ].
        ].
    ].

    ^nil!    !

!ViewManager methods !   
execute: aBlock withTopPane: aTopPaneClass
    "Added by OSI to support openning windows as MDI
     parents and children. MDI support must be loaded."
    | result |
    #addedByOSI.
    Smalltalk at: #TopPaneClass put: aTopPaneClass.
    result := aBlock value.
    Smalltalk removeKey: #TopPaneClass.
    ^result!    !

!ViewManager methods !   
views

    "Added by OSI"
    #addedByOSI.
    ^views!  !

!String methods !
stripMnemonic

    "Added by OSI"
    #addedByOSI.
    ^self select: [ :c | (c = $~) not & (c = $&) not ]!  !

!String methods !
asProperNoun
    "Added by OSI. Answer a String containing the receiver
     with alphabetic characters in mixed proper case."
    | answer size index aCharacter |
    #addedByOSI.
    size := self size.
    answer := String new: size.
    index := 1.
    [index <= size]
        whileTrue: [
            aCharacter := self at: index.
            (index == 1 or: [
            (self at: index - 1) isWhitespace and: [
            aCharacter isLowerCase ]])
                ifTrue: [aCharacter := aCharacter asUpperCase].
            answer at: index put: aCharacter.
            index := index + 1].
    ^answer!   !

!String methods !
asByteArray
        "Added by OSI - Answer a ByteArray whose contents are the
         bytes of the receiver."
    #addedByOSI.
    ^(ByteArray new: self size) replace: self size with: self.! !

!String methods !
beginsWith: aString

    "Added by OSI"
    #addedByOSI.
    ^(self size >= aString size) and: [
        (1 to: aString size)
            detect: [:i | (self at: i) ~~ (aString at: i)]
            ifNone: [^true].
        false]!   !

!RadioButton methods !   
isRadio

    "Added by OSI"
    #addedByOSI.
    ^true! !

!StaticText methods !
isWsTabstop

    "Added by OSI - Allows static text and Groupboxes to
     be in tab order for WB, without adding to style bits."
    #addedByOSI.
    ^(self propertyAt: #tabStop) notNil!    !

!StaticText methods !
tabStop

    "Added by OSI - Allows static text and Groupboxes to
     be in tab order for WB, without adding to style bits."
    #addedByOSI.
    self propertyAt: #tabStop put: true!    !

!GraphPane methods ! 
noScrollBars

    "Added by OSI"

    #addedByOSI.
    ^style := self basicStyle |
        WsChild   |
        WsVisible |
        WsBorder!    !

!GraphPane methods ! 
noBorders

    "Added by OSI"

    #addedByOSI.
    ^style := self basicStyle |
        WsChild   |
        WsVisible!   !

!TextEdit methods !  
noBorders

    "Added by OSI"
    #addedByOSI.
    style := self defaultStyle - WsBorder!   !

!TextEdit methods !  
noScrollBars

    "Added by OSI runtime.  Does nothing.
     Default for TextEdit is no scroll bars."
    #addedByOSI.! !

!TextEdit methods !  
wordWrap

    "Added by OSI"
    #addedByOSI.
    style := self defaultStyle + WsVscroll - EsAutohscroll!   !

!TextEdit methods !  
wmGetdlgcode: wParam with: lParam

    "Added by OSI"
    #addedByOSI.
    ^DlgcWantallkeys!    !

!TextEdit methods !  
scrollBars

    "Added by OSI"
    #addedByOSI.
    style := self defaultStyle + WsHscroll + WsVscroll! !

!Toggle methods !
setDefault
    "Added by OSI"
    #addedByOSI.!   !

!Toggle methods !
isButton
    "Added by OSI"
    #addedByOSI.
    ^false! !

!Toggle methods !
unsetDefault
    "Added by OSI"
    #addedByOSI.! !

!EntryField methods !
maxSize

    "Added by OSI - Return the maximum number of
     characters allowed in the receiver"
    #addedByOSI.
    ^self propertyAt: #maxSize.!   !

!EntryField methods !
setReadOnly: aBoolean

    "Added by OSI - Toggle the entry field's readonly state"
    #addedByOSI.
    self isHandleOk ifFalse: [ ^nil ].
    UserLibrary
        sendMessage: self handle
        msg: 1055
        wparam: aBoolean asParameter
        lparam: 0.!    !

!EntryField methods !
selectAll

    "Added by OSI"
    #addedByOSI.
    self setSelectionFrom: 0 to: self contents size! !

!EntryField methods !
readonly

    "Added by OSI - Set the entry field to be readonly"
    #addedByOSI.
    self propertyAt: #readonly put: true.
    self sendInputEvent: #setReadOnly: with: true.!   !

!EntryField methods !
contents
    "Modified by OSI to fix intermittent failures. Thanks to Tom Lipkis"
    "Answer a string containing the text of the item."
    | length answer struct winAdr |
    #modifiedByOSI.
    self isHandleOk
        ifFalse: [^value].
    struct :=
        WinStructure fromBytes:
                (UserLibrary
                    sendMessage: self asParameter
                    msg: WmGettextlength
                    wparam: nil
                    lparam: nil).
    length := struct shortAtOffset: 0.
    length = 0 ifTrue: [ ^String new ].
    winAdr := WinAddress allocateMemory: length + 1.
    winAdr isNil ifTrue: [ ^String new ].
    UserLibrary
        sendMessage: self asParameter
        msg: WmGettext
        wparam: length + 1
        lparam: winAdr asParameter.
    answer := String new: length.
    WinAddress copyFrom: winAdr to: answer count: length. winAdr unlockAndFree.
    ^answer asNormalizedString!    !

!EntryField methods !
maxSize: anInteger

    "Added by OSI - Set the maximum number of
     characters allowed in the receiver"
    #addedByOSI.
    self propertyAt: #maxSize put: anInteger.
    self setTextLimit: anInteger.!  !

!EntryField methods !
password

    "Added by OSI - Answer the style for a password protected field"
    #addedByOSI.
    self addStyle: EsPassword.

    ^self style.! !

!DrawnButton methods !   
cpSize
    "Added by OSI"
    | rect |
    #addedByOSI.
    rectangle isNil
        ifTrue: [
            ^(framingBlock value: self parent rectangle) extent ]
        ifFalse: [ ^self extent ]!   !

!DrawnButton methods !   
setDefault
    "Added by OSI"
    #addedByOSI.
    label isNil ifFalse: [ super setDefault ].!   !

!DrawnButton methods !   
unsetDefault
    "Added by OSI"
    #addedByOSI.
    label isNil ifFalse: [ super unsetDefault ].!   !

!DrawnButton methods !   
cpContents
    "Added by OSI"
    | contents |
    #addedByOSI.
    contents := self propertyAt: #fileName.
    ^contents isNil
        ifTrue: [ self contents ]
        ifFalse: [ contents ]! !

!DrawnButton methods !   
cpStyle
    "Added by OSI"
    #addedByOSI.
    ^self propertyAt: #cpStyle!  !

!DrawnButton methods !   
stretchToFit
        "Modified by OSI to record style information"
        "If the receiver has a bitmap for its
         label (contents), stretch or shrink the bitmap
         so it fills the receiver."

    #modifiedByOSI.
    self drawAnisotropic.
    self propertyAt: #cpStyle put: #stretchToFit.!  !

!DrawnButton methods !   
cpContents: labelOrFileName
    "Added by OSI"
    #addedByOSI.
    labelOrFileName isString ifTrue: [
        self propertyAt: #fileName put: labelOrFileName.
        (self fileExists: labelOrFileName)
            ifTrue: [ bitmap := Bitmap fromFile: labelOrFileName ]
            ifFalse: [
                self pushButton.
                super contents: labelOrFileName.
            ]
    ] ifFalse: [
        self contents: labelOrFileName
    ].!   !

!DrawnButton methods !   
fixedSize
        "Modified by OSI to record style information"
        "If the receiver has a bitmap for its
         label (contents), draw the bitmap
         at its fixed size."

    #modifiedByOSI.
    self drawIsotropic.
    self propertyAt: #cpStyle put: #fixedSize.!  !

!DrawnButton methods !   
fileExists: fileName
    "Added by OSI - Only valid .BMP files should be allowed"
    | array file exists extension |
    #addedByOSI.
    (fileName includes: $*) ifTrue: [ ^false ].
    array := File splitPath: fileName in: Disk.
    ((file := array at: 3) includes: $.) ifFalse: [ ^false ].
    exists := ((file ~= '.') and: [ (file ~= '..') and: [ File exists: fileName ]]).
    exists ifTrue: [
        file := file asStream.
        extension := (file skipTo: $.; upTo: $.) asUpperCase.
        extension = 'BMP' ifTrue: [ ^true ]].
    ^false!   !

!DrawnButton methods !   
invisible
    "Added by OSI - Make the button invisible"

    #addedByOSI.
    drawBlock := [ :ignore | nil ].
    self propertyAt: #cpStyle put: #invisible.! !

!GDIDLL methods !
createPatternBrush: aBitmapHandle
    "Added by OSI"
    <api: CreatePatternBrush ushort ushort>
    #addedByOSI.
    ^self invalidArgument!    !

!UndefinedObject methods !   
ifNil: aBlock

    "Added by OSI. This replaces the construct 'isNil ifTrue: []'.
     In the case self IS nil"

    #addedByOSI.
    ^aBlock value!  !

!UndefinedObject methods !   
displayHelp: ignore
    #addedByOSI.!  !

!Message methods !   
isMessage

    "Added by OSI"
    #addedByOSI.
    ^true!   !

!SubPane methods !   
isSubPane

    "Added by OSI"
    #addedByOSI.
    ^true!   !

!SubPane methods !   
accel: aChar  afBits: theAfBits
    "Added by OSI - Intercepts the Tab key within CompositePanes"
    | notebook |
    self parent isCompositePane ifTrue: [
        aChar = 9 "Tab" ifTrue: [
            theAfBits = 4 "AfShift" ifTrue: [
                (self parent getPreviousFocus: self) ifTrue: [^true ]
            ] ifFalse: [
                (self parent getNextFocus: self) ifTrue: [^true ]
            ].
        ].
        self isGroupable ifTrue: [
            (aChar = 40 "DownKey" or: [aChar = 39 "RightKey"]) ifTrue: [
                self parent getNextFocusInGroup: self. ^true
            ].
            (aChar = 38 "UpKey" or: [aChar = 37 "LeftKey"]) ifTrue: [
                self parent getPreviousFocusInGroup: self. ^true
            ].
        ].
        "Added to support CUA Notebooks"
        (notebook := self notebookParent) isNil ifFalse: [
            aChar = 33 "PageUpKey" ifTrue: [ notebook previousPage. ^true ].
            aChar = 34 "PageDownKey" ifTrue: [ notebook nextPage. ^true ].
            theAfBits = 1 "AfAlt" ifTrue: [
                (notebook pushMnemonic: aChar asCharacter) notNil ifTrue: [ ^true ].
            ]
        ].
    ].
    ^super accel: aChar  afBits: theAfBits!   !

!SubPane methods !   
isWsTabstop

    "Added by OSI"
    #addedByOSI.
    ^self style notNil and: [ self style bitIsOn: WsTabstop ].!    !

!SubPane methods !   
isButton
    "Added by OSI"
    #addedByOSI.
    ^false! !

!SubPane methods !   
getPopupMenu

    "Added by OSI"
    #addedByOSI.
    ^popup!   !

!SubPane methods !   
isGroupable
    "Added by OSI"
    #addedByOSI.
    ^false!  !

!SubPane methods !   
isWsGroup

    "Added by OSI"
    #addedByOSI.
    ^self style notNil and: [ self style bitIsOn: WsGroup ].!    !

!SubPane methods !   
dependents
    "Added by OSI - Return a dummy dependents list"
    #addedByOSI.
    ^Dictionary new! !

!SubPane methods !   
wmSetfocus: wordInteger with: longInteger
        "Private - Process the set focus message."

    "Added by OSI"
    #addedByOSI.
    self mainWindow propertyAt: #focusWindow put: self.
    self parent isCompositePane ifTrue: [ self parent setFocus: self ].
    super wmSetfocus: wordInteger with: longInteger.
    self event: #gettingFocus.
    ^nil!    !

!SubPane methods !   
wmKillfocus: wordInteger with: longInteger
    "Modified by OSI to correct the spelling of #losingFocus"
        "Private - Process the kill focus message."
    #modifiedByOSI.
    super wmKillfocus: wordInteger with: longInteger.
    self event: #losingFocus.
    ^nil!    !

!SubPane methods !   
addStyle: i

    "Added by OSI"

    #addedByOSI.
    ^style := i | (style notNil ifTrue: [ style ]
        ifFalse: [ self defaultStyle ])!  !

!SubPane methods !   
removeDynamically
    "Added by OSI - Remove a subpane from a window dynamically"
    | dict |
    #addedByOSI.
    self close.
    (dict := self parent children) removeKey: (dict keyAtValue: self) ifAbsent: [ nil ].
    self parent getSubpaneOrder remove: self.
    self parent dependents
        removeKey: self name ifAbsent: [ nil ];
        removeKey: self getContentsHandler ifAbsent: [ nil ].
    owner := parent := handlers := properties := nil.!    !

!SubPane methods !   
extraDialogItemData
    "Answer the extra dialog item data as a WinStructure or nil if there is none."
    #addedyOSI.
    ^nil! !

!SubPane methods !   
removeSubpaneDynamically: aSubPane
    "Added by OSI - Remove a subpane from a window dynamically"
    #addedByOSI.
    aSubPane removeDynamically!  !

!SubPane methods !   
tabStop

    "Added by OSI"
    #addedByOSI.
    self addStyle: WsTabstop!  !

!SubPane methods !   
startGroup

    "Added by OSI"
    #addedByOSI.
    self addStyle: WsGroup! !

!SubPane methods !   
aboutToSaveImage

    "Modified by OSI to support setting menus in line"

        "Private - Pass this event on to the receiver's children."
    #modifiedByOSI.
    popup notNil ifTrue: [
        popup clearPopup.
    ].
    children size ~= 0
        ifTrue: [
            children do: [:each |
                each aboutToSaveImage]]!    !

!SubPane methods !   
handlers

    "Added by OSI"
    #addedByOSI.
    ^handlers!    !

!Object methods !
minWindowSize
    "Added by OSI"
    #addedByOSI.
    ^nil!  !

!Object methods !
modifiedByOSI
    "Added by OSI. Execute the following to get a list
     of all base class methods modified by WindowBuilder.

        Smalltalk sendersOf: #modifiedByOSI.

    "
    #addedByOSI.!    !

!Object methods !
isSubPane

    "Added by OSI"
    #addedByOSI.
    ^false!  !

!Object methods !
isWBAction

    "Added by OSI"
    #addedByOSI.
    ^false! !

!Object methods !
isWBWindow

    "Added by OSI- Added to eliminate the respondsTo: in
      NotificationManager>>readWinQueue to improve performance."
    #addedByOSI.
    ^false! !

!Object methods !
isMDIFrame

    "Added by OSI - Added to eliminate the isKindOf: in
      NotificationManager>>activeWindow to improve performance."
    #addedByOSI.
    ^false!  !

!Object methods !
preInitWindow
    "Added by OSI"
    #addedByOSI.!    !

!Object methods !
isRadio

    "Added by OSI"
    #addedByOSI.
    ^false!    !

!Object methods !
ifNil: aBlock

    "Added by OSI. This replaces the construct 'isNil ifTrue: []'.
     In this case self is NOT nil"

    #addedByOSI.
    ^self! !

!Object methods !
isMessage

    "Added by OSI"
    #addedByOSI.
    ^false!  !

!Object methods !
openWindow
    "Added by OSI"
    #addedByOSI.!   !

!Object methods !
addedByOSI
    "Added by OSI. Execute the following to get a list
     of all methods added to base classes by WindowBuilder.

        Smalltalk sendersOf: #addedByOSI.

    "
    #addedByOSI! !

!Object methods !
isDictionary

    "Added by OSI"
    #addedByOSI.
    ^false!   !

!Object methods !
isCompositePane

    "Added by OSI"
    #addedByOSI.
    ^false!    !

!Object methods !
isRectangle

    "Added by OSI"
    #addedByOSI.
    ^false!    !

!Object methods !
initWindow
    "Added by OSI"
    #addedByOSI.!   !

!Object methods !
asString

    "Added by OSI - Answer the receiver's string representation"

    | stream |

    #addedByOSI.
    stream := WriteStream on: String new.
    self printOn: stream.
    ^stream contents.!    !

!Rectangle methods ! 
isRectangle

    "Added by OSI"
    #addedByOSI.
    ^true! !

!DialogTopPane methods ! 
buildItems
    "Modified by OSI to support framing parameters
        and support extra dialog item template data."
        "Private - Build the control items within
         the dialog box.  Answer an array of item
         templates."
    | answer rect text extraData |
    #modifiedByOSI.
    answer := OrderedCollection new.
    children do: [ :subpane |
        "OSI - replaced #isKindOf: tests for SubPane and Rectangle"
        (subpane isSubPane) ifTrue: [
            (rect := subpane framingBlock) isRectangle not
                ifTrue: [rect := rect value: (0@0 extent: rectangle extent)].
            text := subpane initialText.
            text isString ifFalse:[
                text := nil].
            answer add: (
                (extraData := subpane extraDialogItemData) isNil
                    ifTrue: [
                        WinDialogInfo
                            itemTemplateStyle: subpane frameStyle
                            x: rect left
                            y: rect top
                            cx: rect extent x
                            cy: rect extent y
                            id: subpane id
                            className: subpane winClass
                            text: text ]
                    ifFalse: [
                        WinDialogInfo
                            itemTemplateStyle: subpane frameStyle
                            x: rect left
                            y: rect top
                            cx: rect extent x
                            cy: rect extent y
                            id: subpane id
                            className: subpane winClass
                            text: text
                            extraData: extraData ] ).
            subpane style: subpane frameStyle.
            subpane initSize: rect ]].
    ^answer! !

!DialogTopPane methods ! 
wmCreate: wordInteger with: longInteger

    "Added by OSI - fix in buildWindow: causes this to get processed
     when it wasn't before.  We don't want to do anything for
     DialogTopPanes."
    #addedByOSI.
    ^nil!  !

!DialogTopPane methods ! 
mainWindow

    "Altered by OSI to avoid asking for a view that hasn't been created."

        "Answer the receiver's main window.  If the DialogTopPane's
          parent is kind of Window then it returns its parent's main
          window else it returns self. (Needed for cases where
          DialogTopPane is a subpane of TopPane.)"

    #modifiedByOSI.
    ^(owner notNil)
        ifTrue: [
            (owner views size < 1) ifTrue: [
                ^self
            ] ifFalse: [ owner mainView ]
        ] ifFalse: [self]! !

!DialogTopPane methods ! 
sizeWindow

    "Added by OSI.  Sent by buildWindow: to handle framing params."

    | displayRect clientRect winPosInfo |

    (framingBlock isRectangle) ifTrue: [
        #addedByOSI.
        ^self
    ].

    displayRect := 0@0 extent: Display extent.

    self handle setWindowPos: nil
        rectangle: (framingBlock value: displayRect)
        fs: SwpNozorder.

    clientRect := framingBlock clientRect.

    children size >= 20 ifTrue: [
        children do: [ :subpane |
            subpane resize: (0@0 extent: clientRect extent).
        ].
    ] ifFalse: [
        children do: [ :subpane |
            winPosInfo := UserLibrary beginDeferWindowPos: children size.
            children do: [ :subpane |
                subpane isHandleOk ifTrue: [
                    winPosInfo := subpane
                        resize: (0@0 extent: clientRect extent)
                        deferInfo: winPosInfo
                ].
            ].
            UserLibrary endDeferWindowPos: winPosInfo.
        ].
    ].
    children do: [ :c | c updateRectangle ].!   !

!DialogTopPane methods ! 
cachedBuildItems

    "Added by OSI to support dialog caching"

    | rect  |
    #addedByOSI.
    children do: [ :subpane |
        subpane isSubPane ifTrue: [
            (rect := subpane framingBlock) isRectangle not
                ifTrue: [rect := rect value: (0@0 extent: rectangle extent)].
            subpane style: subpane frameStyle.
            subpane initSize: rect
        ]
    ].!  !

!DialogTopPane methods ! 
defaultFrameStyle

    "Altered by OSI to allow for setting a specific style from a ViewManager"

        "Private - Answer the default frame style for the receiver."
    | s |

    (s := self frameStyleFromPStyle) isNil ifFalse: [
        #modifiedByOSI.
        ^s
    ].

    ^DsModalframe |
        WsCaption |
        WsSysmenu |
        DsNoidlemsg |
        WsPopup!   !

!DialogTopPane methods ! 
frameStyleFromPStyle

    "Added by OSI."

    | s pStyle |

    (pStyle := self pStyle) isNil ifTrue: [
        #addedByOSI.
        ^nil
    ].
    s := DsNoidlemsg  | WsPopup.

    (pStyle includes: #sysmenu) ifTrue: [
        s := s | WsSysmenu.
    ].
    (pStyle includes: #titlebar) ifTrue: [
        s := s | WsCaption.
    ].
    (pStyle includes: #sysmodal) ifTrue: [
        s := s | DsSysmodal | DsModalframe.
    ].
    (pStyle includes: #modal) ifTrue: [
        s := s | DsModalframe.
    ] ifFalse: [
        s := s | WsBorder.
    ].

    ^s!  !

!DialogTopPane methods ! 
buildWindow: aParentWindow

    "Modified by OSI to add #initWindow code, to
     provide dialog caching, to avoid parent being
     nil for framingblock, and to add #sizeWindow call."

        "Private - Create the dialog window for the receiver."
    | winDlgTemplate items winDlgFontInfo tempByteArray m pDlgTemplate|

    #modifiedByOSI.
    "OSI - Fixed Digitalk bug by adding the following two lines.
     Dialogs were never receiving wm_measureitem messages, since these
     messages are sent as soon as the subpanes are created (which is
     before the dialog is created).  Since the dialog wasn't yet created
     and added to the notifier, the notifier had no way of knowing the
     dialog wanted the message."
    NewWindow notNil ifTrue:[NewWindow := nil.  Terminal bell.^self].
    NewWindow := self.

    style isNil ifTrue: [style := self defaultFrameStyle].
    framingBlock isNil
        ifTrue: [
            rectangle := self initSize.
            framingBlock := rectangle]
        ifFalse: [rectangle := framingBlock value: (parent isNil ifFalse: [ parent rectangle] ifTrue: [ Display boundingBox ]) ].

    "Added by OSI to handle potential dialog caching."
    winDlgTemplate := owner dialogTemplate.

    winDlgTemplate isNil ifTrue: [
        winDlgTemplate := WinDialogInfo
            dialogTemplateStyle: style
            itemCount: 0
            x: rectangle origin x
            y: rectangle origin y
            cx: rectangle extent x
            cy: rectangle extent y
            menuName: nil
            className: nil
            text: label.

        winDlgFontInfo := WinDialogInfo         "not used yet"
            fontPointSize: 0 typeFaceName: nil.

        items := self buildItems.
        winDlgTemplate byteAtOffset: 4 put: items size.

        tempByteArray := winDlgTemplate contents.
        items do: [:i |
            tempByteArray := tempByteArray, i contents].
        winDlgTemplate contents: tempByteArray.
    ] ifFalse: [
        self cachedBuildItems.
    ].
    "Added by OSI to handle potential dialog caching."
    owner dialogTemplate: winDlgTemplate.

    "OSI - Folded in fix made by Digitalk"
    pDlgTemplate := WinAddress copyToNonSmalltalkMemory: winDlgTemplate contents.
    handle := WindowHandle fromInteger: (
        UserLibrary
            createDialogIndirect: WIN hInstanceExe
            dialogTemplate: pDlgTemplate asParameter
            parent: parent asParameter
            dialogFunction:
                (WinLong fromBytes: DialogProcInstance) asParameter).
    pDlgTemplate free.

    handle = NullHandle ifTrue: [^self error: 'Dialog creation error'].
    self initGraphics.
    self receiveMessages.

    "OSI - Fixed Digitalk bug. See above."
    NewWindow := nil.

    self buildDialogItems.
    children do: [:subpane | subpane validate].

    owner initWindow.

    self sizeWindow.

    m := UserLibrary
            getSystemMenu: self asParameter
            revert: 0.
    self propertyAt: #sysMenu put: m.
    PoppedModelessWindows add: handle.
    self showWindow.!   !

!DialogTopPane methods ! 
close
        "Private - Close the dialog box."

    "Modified by OSI - This was missing"
    #modifiedByOSI.
    (self event: #close) notNil ifTrue: [ ^self ].

    parent notNil ifTrue:[ parent enable].
    self hideWindow.
    children size > 0 ifTrue: [
        children do: [:subpane | subpane close]].
    self stopReceivingMessages.

    PoppedModelessWindows remove: handle
        ifAbsent: [].
    self destroy.

    Processor currentProcessIsRecursive ifTrue: [
        ^self].   "no semaphore wait"

   sem notNil ifTrue: [
        sem signal.
        sem := nil.
        Processor suspendActive.]!   !

!TopPane methods !   
pushMnemonic: aChar
    "Added by OSI to handle mnemonics in nested controls"
    #addedByOSI.
    self allChildren do: [ :s |
        s isButton & s disabled not ifTrue: [
            (s contents isString and: [ s contents mnemonicChar notNil ]) ifTrue: [
                (s contents mnemonicChar asUpperCase = aChar asUpperCase) ifTrue: [
                    ^s sendInputEvent: #asyncControlEvent: with: 0
                ].
            ].
        ].
    ].
    ^nil!   !

!TopPane methods !   
accel: aChar afBits: theAfBits
    "Added by OSI to handle mnemonics in nested controls"
    #addedByOSI.
    theAfBits = 1
        ifTrue: [(self pushMnemonic: aChar asCharacter) notNil ifTrue: [ ^true ]].
    ^super accel: aChar afBits: theAfBits!  !

!TopPane methods !   
pStyle

    "Added by OSI"
    #addedByOSI.
    ^self propertyAt: #pStyle!  !

!TopPane methods !   
frameStyleFromPStyle

    "Added by OSI"

    | s pStyle |

    (pStyle := self pStyle) isNil ifTrue: [
        #addedByOSI.
        ^nil
    ].

    s := WsOverlapped | WsClipsiblings.

    (pStyle includes: #maximize) ifTrue: [
        s := s | WsMaximizebox.
    ].
    (pStyle includes: #minimize) ifTrue: [
        s := s | WsMinimizebox.
    ].
    (pStyle includes: #sizable) ifTrue: [
        s := s | WsThickframe.
    ] ifFalse: [
        s := s | WsBorder.
    ].
    (pStyle includes: #sysmenu) ifTrue: [
        s := s | WsSysmenu.
    ].
    (pStyle includes: #titlebar) ifTrue: [
        s := s | WsCaption.
    ] ifFalse: [
        s := s | WsPopup
    ].
    "Support for secondary views as children"
    (self == self owner mainView) ifFalse: [
        (pStyle includes: #mainViewChild) ifTrue: [
            self parent: self owner mainView
        ].
    ].

    ^s!   !

!TopPane methods !   
pStyle: s

    "Added by OSI"
    #addedByOSI.
    self propertyAt: #pStyle put: s.!    !

!TopPane methods !   
close: aPane
    #addedByOSI.
    ^nil!   !

!WindowDialog methods !  
openWindow

    "Modified by OSI to support preInitWindow"

        "Open the dialog box modal to the
         current active window."

    #modifiedByOSI.
    self preInitWindow.

    self mainView open!  !

!WindowDialog methods !  
openViews
    "Added by OSI"
    #addedByOSI.
    ^ self isModal
        ifTrue: [ self openWindow ]
        ifFalse: [ self openModeless ].!  !

!WindowDialog methods !  
openModeless

    "Modified by OSI to support preInitWindow"

        "Open the dialog box as a modeless window."

    #modifiedByOSI.
    self preInitWindow.

    self mainView openModeless!    !

!WindowDialog methods !  
isModal
    "Added by OSI - is the receiver modal or not"
    #addedByOSI.
    ^(self mainView pStyle includes: #modal) | (self mainView pStyle includes: #sysmodal)!    !

!Font methods !  
fixedWidth
        "Answer true if the font is of fixed
         width, else answer false."
     ^( textMetrics tmPitchAndFamily & 16r01 ) =  0  "Fixed pitch = 0"!  !

!Font methods !  
stringExtent: aString

    "Added by OSI to fix stringwidth bug."

    | answer hold |

    #addedByOSI.
    hold := Display pen font.
    Display pen font: self.
    aString isNil ifTrue: [
        answer := 0
    ] ifFalse: [
        answer := self stringWidth: (aString reject: [:c | c == $~ ]).
    ].
    Display pen font: hold.
    ^answer @ self height! !

!Font methods !  
fromByteArray: aLogFontByteArray

    "Added by OSI - Logical fonts from V/Win32 do not translate.
     Use the System font instead. V/Win uses #fromBytes:
     instead."

    #addedByOSI.
    ^SysFont!   !

!Font methods !  
wbStringWidth: aString

    "Added by OSI"
    | answer hold found |
    #addedByOSI.
    hold := Display pen font.
    Display pen font: self.
    found := false.
    answer := self stringWidth: (aString reject: [:c | found := ((c == $~) | (c == $&) & found not) ]) .
    Display pen font: hold.
    ^answer! !

!Font methods !  
fromBytes: aLogFontByteArray

    "Added by OSI - Create a font from the bytes of a logical font"
    | contents |

    #addedByOSI.
    contents := ByteArray new: aLogFontByteArray size.
    1 to: aLogFontByteArray size do: [ :i |
        contents at: i put: (aLogFontByteArray at: i).
    ].

    logFont := WinLogFont fromBytes: contents.
    changed := true.
    self makeFont.! !

!KernelDLL methods ! 
getVersion
    "Added by OSI"
    <api: GetVersion ulong>
    #addedByOSI.
    ^self invalidArgument!   !

!UserDLL methods !   
drawText: hDC text: t length: l rect: r format: f
    "Added by OSI"
    <api: DrawText ushort struct short struct ushort short>
    #addedByOSI.
    ^self invalidArgument!    !

!UserDLL methods !   
getWindowTextW: aWindowHandle text: winAdr maxLength: anInteger
   "Added by OSI to fix intermittent failures. Thanks to Tom Lipkis"
    <api: GetWindowText ushort ulong short short>
     #addedByOSI.
   ^self invalidArgument!  !

!UserDLL methods !   
createDialogIndirect: hInstance dialogTemplate: lpDialogTemplate parent: hWndParent dialogFunction: lpDialogFunc
    "Added by OSI - Folded in fix made by Digitalk"
    <api: CreateDialogIndirect ushort ulong ushort ulong ushort>
    #addedByOSI.
    ^self invalidArgument!   !

!UserDLL methods !   
getDlgItemTextW: hDlg item: nIDDlgItem text: winAdr maxCount: nMaxCount
   "Added by OSI to fix intermittent failures. Thanks to Tom Lipkis"
    <api: getDlgItemText ushort ushort ulong short short>
    #addedByOSI.
    ^self invalidArgument!  !

!ListBox methods !   
indexOf: aString

    "Modified by OSI to allow for nil lists."

    "Answer the index of the item aString."

    #modifiedByOSI.
    list isNil ifTrue: [ ^nil ].

    ^list indexOf: aString!    !

!GraphicsTool methods !  
fill: aRectangle bitmap: aBitmap

    "Added by OSI"

    | oldBrush newBrush |
    #addedByOSI.
    newBrush := GDILibrary createPatternBrush: aBitmap handle.

    oldBrush := self selectObject: newBrush.
    self patternFill: aRectangle
        rule: Patcopy.
    self selectObject: oldBrush.
    self deleteObject: newBrush! !

!GraphicsTool methods !  
fill: aRectangle color: aColor

    "Modified by OSI - if aColor is the index for the steelpattern,
     fill in its bitmap instead"

         "Fill aRectangle with aColor. aColor can be an RGB
           value or an index to the color palette."
    | oldBrush newBrush color |

    aColor = ClrChiseledgray ifTrue: [
        #modifiedByOSI.
        ^self fill: aRectangle bitmap: (CPBitmapDict sysAt: 'steelPattern')
    ].

    aColor isNil
        ifTrue: [color := ClrBackground]
        ifFalse: [color := aColor].
    newBrush :=  GDILibrary createSolidBrush: color.
    oldBrush := self selectObject: newBrush.
    self patternFill: aRectangle
        rule: Patcopy.
    self selectObject: oldBrush.
    self deleteObject: newBrush!   !

!Array methods ! 
convertBytesToString
        "Added by OSI - Answer a String whose contents are the
         bytes of the receiver."
    #addedByOSI.
    ^self asByteArray asString!   !

!Array methods ! 
asByteArray
        "Added by OSI - Answer a ByteArray whose contents are the
         bytes of the receiver."
    | byteArray |
    #addedByOSI.
    byteArray := ByteArray new: self size.
    1 to: self size do: [ :i | byteArray at: i put: (self at: i) ].
    ^byteArray! !

!GroupPane methods ! 
syncControlEvent: anEvent
        "Private - Process anEvent produced
         by the host system. The default is to
         requeue the operation for deferred handling."
    | child |
    (child := Notifier getFocusWindow) isNil ifTrue: [^nil].
    child
        sendInputEvent: #asyncControlEvent:
        with: anEvent! !

!ApplicationWindow methods ! 
setBackColor: c

    "Added by OSI for PM portability"

    #addedByOSI.
    self backColor: c!    !

!ApplicationWindow methods ! 
wmSize: wordInteger with: longInteger
    "Modified by OSI to incorporate Digitalk bug fix"
        "Private - Process the window resizing message."
    | extent |
    #modifiedByOSI.
    "do nothing if being minimized"
    wordInteger = Sizeiconic ifTrue: [ ^nil ].
    extent := ( ( WinPoint new:4 ) uLongAtOffset: 0 put: longInteger ) asPoint.
    ( extent x = 0 or: [ extent y = 0 ] )
        ifFalse: [ self resize: ( 0 @ 0 extent: extent ) ].
    ^nil!    !

!ApplicationWindow methods ! 
defaultFrameStyle

    "Modified by OSI to allow for setting a specific style from a
     ViewManager"

    "Private - Answer the default frame style for the receiver."
    | fs |

    (fs := self frameStyleFromPStyle) notNil ifTrue: [
        #modifiedByOSI.
        ^fs
    ].

    ^WsMaximizebox |
        WsMinimizebox |
        WsThickframe |
        WsSysmenu |
        WsCaption |
        WsOverlapped |
        WsClipsiblings!   !

!ApplicationWindow methods ! 
closeView
    "Modified by OSI to fix problem with closing children"
        "Close the receiver and all its children."
    | inner |
    #modifiedByOSI.
    handle = NullHandle ifTrue: [^self]. "already closed"
    inner := OrderedCollection new.
    Notifier windows do: [:w|
        ((w == self) not and: [
        (w isKindOf: ApplicationWindow) and: [
            w isHandleOk and:[
                (UserLibrary isChild:  handle child: w handle) or: [
                (self owner == w parent)]]]])
                    ifTrue: [inner add: w]].
    inner do: [:w| w textModified ifTrue: [^nil] ifFalse: [w clearTextModified]].
    inner do: [:w| w close].
    self textModified ifTrue: [^nil].
    self helpManager notNil
        ifTrue: [self helpManager closeHelpWindow].
    self hideWindow.
    menuWindow close.
    super close.
    self icon notNil ifTrue:[self icon release].
    super initialize.! !

!ApplicationWindow methods ! 
activate

    "Modified by OSI to avoid automatically setting
      the focus to a text pane."

        "Private - The receiver was activated."

    | focusWindow |

    self owner isWBWindow ifTrue: [
        focusWindow := self propertyAt: #focusWindow.

        "OSI - Added tests for isActive and
        minimized not; prevent oscillating window effect"
        ((focusWindow notNil and: [ self isActive ]) and:
            [ self minimized not ]) ifTrue: [
            #modifiedByOSI.
            focusWindow setFocus.
            ^super activate
        ].
    ].

    "OSI - Changed activeTextPane to self activeTextPane -
     we had been overriding Digitalk's changes"
    ((self activeTextPane notNil
        and: [self isActive] )
        and: [self minimized not])
            ifTrue: [self activeTextPane setFocus].

    "OSI - Added to prevent mouse capture from staying
    on when halts, etc. occur"
    self clearMouseCapture.

    super activate.! !

!ApplicationWindow methods ! 
validate

    "Altered by OSI to support initWindow method, and to
     set input focus on initialization based on focus order."

    "Private - Create or recreate the window for the receiver."
    self validateBuild isNil ifTrue: [
        ^nil
    ].

    "OSI - Some people still place their window behavior under ApplicationWindow, not ViewManager,
      and ApplicationWindow doesn't respond to mainView"
    (self owner respondsTo: #mainView) ifFalse: [
        #modifiedByOSI.
        self owner initWindow.
    ] ifTrue: [
        (self owner mainView propertyAt: #windowBuilt) isNil ifTrue: [
            self owner mainView propertyAt: #windowBuilt put: true.
            self owner initWindow.
        ].
    ].

    self zoomed ifTrue:[
        self children do:[ :each | each zoomed ifFalse:[each hideWindow]]].

    "OSI - replaced #isKindOf: message"
    (collapsed isRectangle)
        ifTrue:[self showMaximizedWindow]
        ifFalse:[ collapsed < 0
            ifTrue:[self showIconicWindow]
            ifFalse:[self showWindow] ].!  !

!ApplicationWindow methods ! 
viewName: aName

    "Added by OSI"

    #addedByOSI.
    self paneName: aName!    !

!ApplicationWindow methods ! 
wmGetminmaxinfo: wparam with: lparam

    "Added by OSI"

    | info minSize maxSize address |

    minSize := self owner minWindowSize.
    maxSize := self owner maxWindowSize.
    (minSize notNil or: [ maxSize notNil ]) notNil ifTrue: [
        #addedByOSI.
        info := WinMinMaxInfo fromAddress: (
            ( address := WinAddress new )
                highHalf: ( lparam // 65536 );
                lowHalf: ( lparam \\ 65536 );
                yourself
        ).

        minSize notNil ifTrue: [
            info ptMinTrackSizeX: minSize x.
            info ptMinTrackSizeY: minSize y.
        ].
        maxSize notNil ifTrue: [
            info ptMaxTrackSizeX: maxSize x.
            info ptMaxTrackSizeY: maxSize y.
        ].
        info copyToAddress: address.
    ].

    ^nil! !

!ApplicationWindow methods ! 
frameStyleFromPStyle
    "Added by OSI - Reimplemented by subclasses"
    #addedByOSI.
    ^nil! !

!TextTool methods !  
winDrawText: str at: aPoint

    "Added by OSI"
    #addedByOSI.
    self winDrawText: str in: (aPoint extentFromLeftTop: 30000@30000) format: 0.!  !

!TextTool methods !  
centerWinText: aString at: aPoint

    "Added by OSI"
    #addedByOSI.
    self winDrawText: aString
        at: aPoint -
            ((font wbStringWidth: aString)
                @ font height // 2)!    !

!TextTool methods !  
centerText: aString at: aPoint

    "Added by OSI - Display aString centered at aPoint."
    #addedByOSI.
    self displayText: aString
        at: aPoint -
            ((font stringWidth: aString)
                @ font height // 2)!   !

!TextTool methods !  
winDrawText: str in: aRect format: f

    "Added by OSI"
    #addedByOSI.
    self allHandles do: [:h |
        UserLibrary
            drawText: h
            text: str asParameter
            length: str size
            rect: (WinRectangle fromRectangle: aRect) asParameter
            format: f asParameter
    ].!   !

!NotificationManager methods !   
readWinQueue

    "Modified by OSI to support dialog keys in regular windows"

        "Private - Read a message from host system's event queue."
    | old  hWnd  activeWindow winMessage |
    old :=  Process enableInterrupts: false.
    (UserLibrary peekMessage: (WinMsgNS asParameter)
        hwnd: nil
        min: 0
        max: 0
        remove: true)
           ifFalse: [Process enableInterrupts: old. ^self].

    PoppedModelessWindows size > 0
        ifTrue: ["There are popped up modeless windows"
            PoppedModelessWindows do: [:each |
                 (UserLibrary
                    isDialogMessage: each
                    lpmsg: WinMsgNS asParameter)
                        = 0 ifFalse: [Process enableInterrupts: old.
                                            ^self]]].

    WinMsg  replaceFrom: 1 to: 2 with: WinMsgNS startingAt: 3.
    ((WinMsg = WmKeyDownString) or: [WinMsg = WmSysKeyDownString])
        ifTrue: [
            (self translateAccelerator: WinMsgNS)
                ifTrue: [
                    Process enableInterrupts: old.
                    ^self]].

    "Added by OSI to provide dialog key support in titled windows"
    #modifiedByOSI.
    activeWindow := self activeWindow.

    activeWindow notNil ifTrue: [
      (activeWindow owner isWBWindow)  ifTrue: [
        "Copy the WinMsgNS structure from OS memory to ST memory..."
        winMessage := WinMessage fromAddress:
            (WinAddress fromString: WinMsgNS contents).
        "Place messages to ignore inside array"
        (#(262) includes: winMessage msg) ifFalse: [
            (UserLibrary
                isDialogMessage: activeWindow handle
                lpmsg: WinMsgNS asParameter) = 0 ifFalse: [
                    Process enableInterrupts: old.
                    ^self]]]].

    UserLibrary
        translateMessage: (WinMsgNS asParameter).
    UserLibrary
        dispatchMessage: (WinMsgNS asParameter).
    Process enableInterrupts: old!  !

!NotificationManager methods !   
activeWindow

    "Added by OSI to support keyboard translation for MDI windows"
        "Answer the active toppane."

    | win newWin |
    #addedByOSI.
    ((win := self findWindow: WindowHandle queryActive) isMDIFrame) ifTrue: [
        (newWin := win mdiGetActive) notNil ifTrue: [
            ^newWin
        ].
    ].

    ^win!    !

!NotificationManager methods !   
translateAccelerator: winMsgNS
        "Private -  Translates a system message into accelerator key stroke.
         Answer true if it is an accelerator key stroke, else answer false."
    | aWindow afBits aMenuWindow accelTable
      index hWnd hWndString char childWindow|

    char :=KeyboardLibrary
        mapVirtualKey:
            (((ByteArray new: 1)
                replaceFrom:1
                to: 1
                with: winMsgNS
                startingAt: 9) at: 1)
        mapType: 1.
    hWndString := ((ByteArray new: 2)
        replaceFrom:1
        to: 2
        with: winMsgNS
        startingAt: 1).
    hWnd := ((hWndString at: 2) * 256)
                    + (hWndString at: 1).

    "Is hWnd a Smalltalk window"
    (aWindow := Notifier findRealWindow: hWnd)  notNil ifTrue: [
        childWindow := aWindow.
        aWindow mainWindow isMDIChild | aWindow isMDIClient ifTrue:[(self translateMDISysAccel:winMsgNS) ifTrue:[^true]].
        aWindow := aWindow mainWindow.
        (aMenuWindow := aWindow menuWindow) notNil ifTrue: [
            afBits := 0.
            (UserLibrary getKeyState: VkControl) < 0 ifTrue:
                [afBits := afBits + AfControl].
            (UserLibrary getKeyState: VkShift) < 0 ifTrue:
                [afBits := afBits + AfShift].
            (UserLibrary getKeyState: VkMenu) < 0 ifTrue:
                [afBits := afBits + AfAlt].
            "afBits = 0 ifTrue:
                [afBits := nil]."

            ((childWindow accel: char afBits: afBits) = true) ifTrue: [
                ^true
            ].
            ((aWindow accel: char afBits: afBits) = true) ifTrue: [
                ^true
            ].

            "If Control-Break then halt."
            afBits = AfControl ifTrue: [
                char = 145  ifTrue: [
                    Process interrupt: 2.
                    ^true]].

    "OSI - We changed AfVirtualkey to have a nonzero value to differentiate it
     from AfChar (for use in the menueditor), and as a result lost some accelerators."
            #modifiedByOSI.
            (accelTable := aMenuWindow accelTable) notNil ifTrue: [
                (index := accelTable at: (Array with: char with: afBits) ifAbsent:[
                    afBits notNil ifTrue: [
                        accelTable at: (Array with: char with: (afBits bitOr: AfVirtualkey)) ifAbsent: [ nil ].
                    ] ifFalse: [
                        nil
                    ].
                ] )
                    notNil ifTrue: [
                         aMenuWindow sendInputEvent: #performMenuItem: with: index.
                         ^true]]]].
    ^false!  !

!NotificationManager methods !   
isCtrlDown
        "Added by OSI - Answer true if a control key is down."
    #addedByOSI.
    ^self isKeyDown: ControlKey!  !

!NotificationManager methods !   
isAltDown
        "Added by OSI - Answer true if a alt key is down."
    #addedByOSI.
    ^self isKeyDown: AltKey!   !

!ControlPane methods !   
contents: aString

    "Altered by OSI to allow ~ mnemonics from PM"

        "Set the String associated with this control."

    #modifiedByOSI.
    (aString isString) ifTrue: [
        label := aString collect: [:c | (c = $~) ifTrue: [ $& ] ifFalse: [ c ]].
    ] ifFalse: [
        label := aString.
    ].

    (self isHandleOk and: [
        self windowText ~= aString]) ifTrue: [
            self setWindowText: aString asParameter ]! !

!ControlPane methods !   
basicStyle

    "Altered by OSI, to allow external tabstop setting."

        "Private - Answer an Integer with appropriate
         constants combination for basic control style."
    #modifiedByOSI.
    ^WsChild   |
    WsVisible!    !

!GroupBox methods !  
isWsTabstop

    "Added by OSI - Allows static text and Groupboxes to
     be in tab order for WB, without adding to style bits."
    #addedByOSI.
    ^(self propertyAt: #tabStop) notNil!    !

!GroupBox methods !  
tabStop

    "Added by OSI - Allows static text and Groupboxes to
     be in tab order for WB, without adding to style bits."
    #addedByOSI.
    self propertyAt: #tabStop put: true!    !

!Dictionary methods !
isDictionary

    "Added by OSI"
    #addedByOSI.
    ^true!    !

!Pen methods !   
draw3DButton: aString rect: aRect font: aFont foreColor: fore backColor: back
    "Added by OSI - draw a 3D button"
    | theFont bottom right region |
    #addedByOSI.
    theFont := aFont isNil ifTrue: [ Font fromFont: ButtonFont ] ifFalse: [ aFont ].
    bottom := aRect bottom up: 1.
    right := aRect right left: 1.
    self
        setBackMode: Opaque;
        fill: (aRect insetBy: 3) color: back;
        drawRect3D: aRect;
        foreColor: ClrBlack;
        lineFrom: aRect left @ (aRect top down: 1) to: aRect left @ bottom;
        lineFrom: right @ (aRect top down: 1) to: right @ bottom;
        lineFrom: (aRect left right: 1) @ aRect top to: right @  aRect top;
        lineFrom: (aRect left right: 1) @ bottom to: right @ bottom.
    region := self setClipRect: (aRect insetBy: 4).
    self
        setBackMode: Transparent;
        font: theFont;
        setTextAlign: TaTop.
    "(back = (UserLibrary getSysColor: ColorBtnface))
        ifTrue: [ self
            foreColor: ClrWhite;
            centerWinText: aString at: aRect center + 1]."
    self
        foreColor: fore;
        centerWinText: aString at: aRect center;
       setBackMode: Opaque.
    self destroyRegion: region.!   !

!Pen methods !   
drawFocusRect: aRect

    "Added by OSI"
    #addedByOSI.
    self allHandles do: [: h |
        UserLibrary
            drawFocusRect: h
            rectangle: aRect asParameter
    ].!  !

!Pen methods !   
lineFrom: p1 to: p2

    "Added by OSI"
    #addedByOSI.
    self place: p1;
        line: p2.!    !

!Pen methods !   
draw3DButton: aString rect: aRect font: aFont
    "Added by OSI - draw a 3D button"
    #addedByOSI.
    self draw3DButton: aString rect: aRect font: aFont
        foreColor: ClrBlack
        backColor: (UserLibrary getSysColor: ColorBtnface)!    !

!Pen methods !   
drawRectangle: aRectangle

    "Added by OSI since rectangle: fills."

    #addedByOSI.
    self place: aRectangle origin.
    self box: aRectangle corner.!  !

!Pen methods !   
quickLineFrom: p1 to: p2 using: aHandle

    "Added by OSI for 3D rects."
    #addedByOSI.
    GDILibrary moveTo: aHandle x: p1 x y: p1 y.
    GDILibrary lineTo: aHandle x: p2 x y: p2 y.!    !

!Pen methods !   
drawRect3D: aRect depth: d style: style

    "Added by OSI"

    | back fore |

    #addedByOSI.
    style == #outline ifTrue: [
        ^self
            foreColor: ClrWhite;
            drawRectangle: (aRect leftTop + 1 corner: aRect corner);
            foreColor: (UserLibrary getSysColor: ColorBtnshadow);
            lineFrom: aRect leftTop to: aRect leftBottom;
            lineFrom: aRect leftTop to: aRect rightTop;
            lineFrom: aRect rightBottom - 2 to: (aRect left + 2)@(aRect bottom - 2);
            lineFrom: aRect rightBottom - 2 to: (aRect right - 2)@(aRect top + 2)
    ].

    style = #in ifTrue: [
        fore := ClrWhite.
        back := (UserLibrary getSysColor: ColorBtnshadow).
    ] ifFalse: [
        back := ClrWhite.
        fore := (UserLibrary getSysColor: ColorBtnshadow).
    ].

    1 to: d do: [:i |
        self
            foreColor: fore;
            lineFrom: (aRect left right: i) @ (aRect bottom up: i + 1) to: (aRect rightBottom leftAndUp: i @ (i + 1));
            lineFrom: (aRect right left: i + 1) @ (aRect top down: i) to: (aRect rightBottom leftAndUp: (i+1)@i);
            foreColor: back;
            lineFrom: (aRect leftTop + i) to: (aRect left + i) @ (aRect bottom - i);
            lineFrom: (aRect leftTop + i) to: (aRect right - i) @ (aRect top + i)
    ].! !

!Icon methods !  
createIcon
    "Modified by OSI - Included Digitalk's changes"
        "Private - Create a WINDOWS icon from the receiver."
    | temp bitCount |
    #modifiedByOSI.
    readOnly ifTrue:[^self].
    bitCount := GDILibrary getDeviceCaps: Display pen handle
        index: Bitspixel.
    bitCount = xorMask bitCount
        ifTrue: [temp := xorMask]
        ifFalse: [                "create a bitmap compatible with the device."
            temp := Bitmap screenExtent: xorMask extent.
            temp pen copyBitmap: xorMask
                from: xorMask boundingBox
                at: 0@ 0].

    hIcon := UserLibrary createIcon: WIN hInstance
        width: self extent x
        height: self extent y
        planes: temp planes
        bitsPixel: temp bitCount
        andBits: andMask getDDBits
        xorBits: temp getDDBits.
    IconHandleTable at: hIcon put: self.
    bitCount = xorMask bitCount ifFalse: [temp release]!    !

!TextPane methods !  
noBorders

    "Added by OSI"
    #addedByOSI.
    ^style := self basicStyle |
        WsChild   |
        WsVisible! !

!TextPane methods !  
contents: aString
        "Set the contents of the receiver to aString."

    textHolder string: aString.
    (self isHandleOk and:[self graphicsTool isNil or: [self graphicsTool privateHandle isNil]])
        ifTrue:[self invalidateRect:nil erase:false].
    ^aString! !

!TextPane methods !  
noScrollBars

    "Added by OSI"
    #addedByOSI.
    ^style := self basicStyle |
        WsBorder |
        WsChild   |
        WsVisible!  !

!TextPane methods !  
wmGetdlgcode: wparam with: lparam

    "Modified by OSI.  Changed DlgcWantchars to DlgcWantallKeys
      so a TextPane would work (cr works) in a dialog."

        "Private - process WM_GETDLGCODE message."
    #modifiedByOSI.
     ^DlgcWantallkeys
"   ^ DlgcWantchars  "!    !

!Button methods !
wmKillfocus: wParam with: lParam
    "Added by OSI"
    #addedByOSI.
    self parent isCompositePane ifTrue: [ self unsetDefault ].
    ^super wmKillfocus: wParam with: lParam.!   !

!Button methods !
isButton
    "Added by OSI"
    #addedByOSI.
    ^true!  !

!Button methods !
setDefault
    "Added by OSI"
    #addedByOSI.
    self isHandleOk ifFalse: [^self].
    UserLibrary sendMessage: handle
            msg: BmSetstyle
            wparam: 1
            lparam: self style asParameter!   !

!Button methods !
setDefault: aBoolean
    "Added by OSI"
    #addedByOSI.
    aBoolean
        ifTrue: [ self setDefault ]
        ifFalse: [ self unsetDefault ]!  !

!Button methods !
unsetDefault
    "Added by OSI"
    #addedByOSI.
    self isHandleOk ifFalse: [^self].
    UserLibrary sendMessage: handle
            msg: BmSetstyle
            wparam: 0
            lparam: self style asParameter! !

!Button methods !
initialize
    "Added by OSI"
    #addedByOSI.
    super initialize.
    self receiveAllWindowMessages! !

!Button methods !
isGroupable
    "Added by OSI"
    #addedByOSI.
    ^true!   !

!Button methods !
cancelPushButton
    "Added by OSI to set the cancel push button style"
    #addedByOSI.
    self propertyAt: #cancelPushButton put: true.
    self idCancel!   !

!Button methods !
setFocus
    "Added by OSI"
    #addedByOSI.
    super setFocus.
    self parent isCompositePane ifTrue: [ self setDefault ].!  !

!Menu methods !  
buildItem: i menu: menuNumber menuBar: menuBar

    "Modified by OSI"

        "Private - Build the i'th item in the menu indexed by
         the menuNumber of the menuBar."
    | a item afBits |
    #modifiedByOSI.
    item := (items at: i).
    item id: (menuNumber * 256 + i).
    (item submenu notNil)
        ifTrue:  [item submenu buildWindow: menuBar].
    accel size >= i ifTrue: [
        (accel at: i) notNil ifTrue: [
            a := accel at: i.
            1 to: a size // 2 do:[:index|
                afBits := a at: index * 2.
                afBits notNil ifTrue: [
                    afBits := afBits bitAnd: 7.  "AfAlt | AfShift | AfControl"
                ].
                menuBar accelTable
                    at: (Array with: (a at:index * 2 - 1) with: afBits )
                    put: (menuNumber * 256 + i)]]].
    window insertItem: item label: item contents.! !

!Menu methods !  
appendItem: aLabelString action: aSymbol
    "Added by OSI - create a menu item that performs an action"
    #addedByOSI.
    ^self appendItem: aLabelString action: aSymbol acceleratorString: ''!  !

!Menu methods !  
appendItem: aLabelString selector: aSelector acceleratorString: aString

    "Added by OSI for PM portability"

        "Append an item with label aLabelString and
         selector aSelector to the receiver menu.  Parse the
         accelerator info from aString.  aString has the following
         syntax:
            One or more of 'Ctrl', 'Alt', or 'Shift'.
            A plus sign (+).
            A single character (indicating Ctrl+S for example)
                or an integer (indicating Ctrl+Del for example).
            Examples:
                'Ctrl+S' means Control key and the S key.
                'AltShift+C' means Alt and Shift keys and the C key.
                'Ctrl+27' means Control and the Del key (VkDelete = 27)."
    | s bits bitsString key keyString |
    #addedByOSI.
    aString isEmpty ifTrue: [
        ^self appendItem: aLabelString selector: aSelector
            accelKey: nil accelBits: nil ].
    s := aString asStream.
    bitsString := s upTo: $+.
    keyString := s upTo: $+.
    keyString first isDigit
        ifTrue: [
            key := 0.
            1 to: keyString size do: [:i |
                key := key * 10 + ( keyString at: i ) digitValue ].
            key := PMToWinKeyMap at: key.
            bits := 8 "AfVirtualkey" ]
        ifFalse: [
            key := keyString first.
            bits := 0 ].
    ( bitsString includes: $C ) ifTrue: [ bits := bits | 2 ]. "AfControl"
    ( bitsString includes: $A ) ifTrue: [ bits := bits | 1 ]. "AfAlt"
    ( bitsString includes: $S ) ifTrue: [ bits := bits | 4 ]. "AfShift"
    ^self appendItem: aLabelString selector: aSelector
           accelKey: key accelBits: bits!   !

!Menu methods !  
appendItem: aLabelString action: aSymbol acceleratorString: aString
    "Added by OSI - create a menu item that performs an action"
    | aMessage |
    #addedByOSI.
    aMessage := (Message new)
            receiver: (self wbAction window: self owner action: aSymbol)
            selector: #perform
            arguments: #()
            yourself.

    self appendItem: aLabelString selector: aMessage acceleratorString: aString!    !

!Menu methods !  
disableAll
        "Disable all items for the receiver."
    items do: [:mi |
        mi isMenu ifTrue: [ mi disableAll ].
        self disableItem: mi selector ]! !

!Menu methods !  
wbAction
    "Added by OSI"
    #addedByOSI.
    ^WBAction!  !

!Menu methods !  
enableAll
        "Enable all items for the receiver."
    items do: [:mi |
        mi isMenu ifTrue: [ mi enableAll ].
        self enableItem: mi selector ]! !

!Menu methods !  
clearPopup
    "Added by OSI"
    #addedByOSI.
    popup := nil.!    !

!Menu methods !  
appendItem: aLabelString link: aViewManagerClassName type: linkType
    "Added by OSI - create a menu item that links to another window"
    #addedByOSI.
    ^self appendItem: aLabelString link: aViewManagerClassName type: linkType acceleratorString: ''!   !

!Menu methods !  
appendItem: aLabelString link: aViewManagerClassName type: linkType acceleratorString: aString
    "Added by OSI - create a menu item that links to another window"
    | aMessage |
    #addedByOSI.
    (Smalltalk includesKey: aViewManagerClassName asSymbol) ifFalse: [
        aMessage := (Message new)
            receiver: MessageBox selector: #message:
                arguments: #('Link Menu Error!!');
            yourself.
    ] ifTrue: [
        aMessage := Message new.
        aMessage receiver: (Smalltalk at: aViewManagerClassName asSymbol).
        linkType asSymbol == #Child ifTrue: [
            aMessage selector: #openWithParent:; arguments: (Array with: self owner).
        ] ifFalse: [ linkType asSymbol == #Sibling ifTrue: [
            aMessage selector: #openWithMyParent:; arguments: (Array with: self owner).
        ] ifFalse: [ linkType asSymbol == #MDIChild ifTrue: [
            aMessage selector: #openWithMDIParent:; arguments: (Array with: self owner).
        ] ifFalse: [
            aMessage selector: #open; arguments: #().
        ]]].
    ].
    self appendItem: aLabelString selector: aMessage acceleratorString: aString!  !

!DialogBox methods ! 
queryItemText: itemId
    "Modified by OSI to fix intermittent failures. Thanks to Tom Lipkis"
    "Answer a string containing the text of the
    item whose id is itemId."
    | length answer winAdr |
    #modifiedByOSI.
    handle isValid
        ifFalse:[^ String new].
    winAdr := WinAddress allocateMemory: 256.
    winAdr isNil
        ifTrue: [ ^String new ].
    length := UserLibrary
        getDlgItemTextW: handle
        item: itemId
        text: winAdr asParameter
        maxCount: 256.
    answer := String new: length.
    WinAddress copyFrom: winAdr to: answer count: length. winAdr unlockAndFree.
    ^answer asNormalizedString! !

!ViewManager class methods ! 
wbCreated

    "Added by OSI - answer whether this
     viewmanager is WindowBuilder generated."
    #addedByOSI.
    ^false!  !

!ViewManager class methods ! 
open
    "Added by OSI - Open a new instance of the receiver."
    #addedByOSI.
    ^self new open!  !

!ViewManager class methods ! 
openAsMDIParent
    "Added by OSI - Open a new instance of the receiver
     as an MDI parent."
    #addedByOSI.
    ^self new openAsMDIParent! !

!ViewManager class methods ! 
openWithMyParent: aViewManager
    "Added by OSI - Open a new instance of the receiver
     as a child of aViewManager's parent (a sibling)."
    #addedByOSI.
    ^self new openWithMyParent: aViewManager!    !

!ViewManager class methods ! 
openWithParent: aViewManager
    "Added by OSI - Open a new instance of the receiver
     as a child of aViewManager."
    #addedByOSI.
    ^self new openWithParent: aViewManager! !

!ViewManager class methods ! 
openCenteredOnMouse
    "Added by OSI - Open a new instance of the receiver centered over the mouse."
    #addedByOSI.
    ^self new openCenteredOnMouse!    !

!ViewManager class methods ! 
openWithMDIParent: aViewManager
    "Added by OSI - Open a new instance of the receiver
     as an MDI child of aViewManager."
    #addedByOSI.
    ^self new openWithMDIParent: aViewManager!  !

!Date class methods !
monthStrings
    "Added by OSI"
    | dict |
    ^Smalltalk at: #WBMonthString ifAbsent: [
        Smalltalk at: #WBMonthString put:
            (dict := Dictionary new
                at: 'jan' put: #Jan;
                at: 'january' put: #Jan;
                at: 'feb' put: #Feb;
                at: 'february' put: #Feb;
                at: 'mar' put: #Mar;
                at: 'march' put: #Mar;
                at: 'apr' put: #Apr;
                at: 'april' put: #Apr;
                at: 'may' put: #May;
                at: 'jun' put: #Jun;
                at: 'june' put: #Jun;
                at: 'jul' put: #Jul;
                at: 'july' put: #Jul;
                at: 'aug' put: #Aug;
                at: 'august' put: #Aug;
                at: 'sep' put: #Sep;
                at: 'september' put: #Sep;
                at: 'oct' put: #Oct;
                at: 'october' put: #Oct;
                at: 'nov' put: #Nov;
                at: 'november' put: #Nov;
                at: 'dec' put: #Dec;
                at: 'december' put: #Dec;
                yourself).
        dict.
    ].!   !

!Date class methods !
validateString: aString
    "Added by OSI - Validate whether aString represents
     a valid date"

    | array |
    #addedByOSI.
    array := self dateArray: aString.
    ^self validateDay: (array at: 1) month: (array at: 2) year: (array at: 3)!  !

!Date class methods !
dateArray: aString
        "Added by OSI - Answer an array containg the
         the elements of Date specified by aString.  aString
         must represent a date in one of three formats:
         'Dec 31, 1989' or '31 Dec 1989' or '12/31/89'
         but the delimiters between the month, day and
         year can be any sequence of non-alphanumeric
         characters. The array is ordered #( day Month Year )"
    | aStream word1 word2 month year |
    aStream := aString asStream.
    word1 := aStream nextWord.
    word1 isNil ifTrue: [ ^#(0 0 0)].
    word1 := word1 asLowerCase.
    word2 := aStream nextWord.
    word2 isNil ifTrue: [ ^#(0 0 0)].
    word2 := word2 asLowerCase.
    year := aStream nextWord.
    year isNil ifTrue: [ ^#(0 0 0)].
    year := year asLowerCase asInteger.
    year < 100 ifTrue: [
        year < 60 ifTrue: [
            year := year + 2000
        ] ifFalse: [
            year := year + 1900
        ].
    ].

    word1 first isLetter ifTrue: [ " 'jan 1 1990' style"
        month := MonthNames at: (self monthStrings at: word1 ifAbsent: [ 0 ]) ifAbsent: [ 0 ].
        ^Array
            with: word2 asInteger
            with: month
            with: year
    ].

    word2 first isLetter ifTrue: [ " '1 jan 1990' style"
        month := MonthNames at: (self monthStrings at: word2 ifAbsent: [ 0 ]) ifAbsent: [ 0 ].
        ^Array
            with: word1 asInteger
            with: month
            with: year
    ].

    " must be '1/20/90' or 1/20/1990' style"
    ^Array
        with: word2 asInteger
        with: word1 asInteger
        with: year!    !

!Date class methods !
validateDay: dInteger month: mInteger year: yInteger
    "Added by OSI - Check the validity of the day number
     dInteger for the month aSymbol in the year yInteger.
     If the date is invalid, report the error."

    #addedByOSI.
    ^(mInteger < 1 or: [
        mInteger > 12 or: [
        dInteger < 1 or: [
        dInteger > (self
            daysInMonth: (self nameOfMonth: mInteger)
            forYear: yInteger)]]]) not! !

!WinDialogInfo class methods !   
itemTemplateStyle: style x: x y: y cx: cx cy: cy id: id
className: className text: text extraData: extraData
    "Added by OSI - Calculate the size of a dialog item template
     and answer a new item template with attributes
     set from the arguments.  Append the information from aWinStructure
     to the item template as the extra data."
    |size dlgItemTemplate extraDataSizeOffset textOffset|

    #addedByOSI.
    size := 14.         "Base DLGITEMTEMPLATE size"
    textOffset := size := size + className size + 1.
    extraDataSizeOffset := size := size + text size +1.
    size := size + extraData size + 1.

    dlgItemTemplate := self new: size.
    dlgItemTemplate uShortAtOffset: 0 put: x.
    dlgItemTemplate uShortAtOffset: 2 put: y.
    dlgItemTemplate uShortAtOffset: 4 put: cx.
    dlgItemTemplate uShortAtOffset: 6 put: cy.
    dlgItemTemplate uShortAtOffset: 8 put: id.
    dlgItemTemplate uLongAtOffset: 10 put: style.

    className isInteger ifTrue: [
        dlgItemTemplate byteAtOffset: 14 put: className asParameter.
    ] ifFalse: [
        dlgItemTemplate bytesAtOffset: 14 put: className asParameter.
    ].
    dlgItemTemplate bytesAtOffset: textOffset put: text asParameter.
    dlgItemTemplate byteAtOffset: extraDataSizeOffset put: extraData size.
    dlgItemTemplate bytesAtOffset: extraDataSizeOffset + 1 put: extraData contents.

    ^dlgItemTemplate!  !

!Bitmap class methods !  
fromStream: s

    "Added by OSI."

    | bfh bih bi bits rgbColor bytes bitmap |

    #addedByOSI.
    bfh := self readFileHeader: s.
    bih := self readBitmapHeader: s.
    bih bitCount = 24 ifFalse: [
        rgbColor := ByteArray new: ((1 bitShift: bih bitCount) * 4).
        1 to: rgbColor size do: [: i |
            rgbColor at: i put: s nextByte
        ]
    ].
    bih sizeImage = 0 ifTrue: [
        bytes := (((
            bih width * bih bitCount) + 31) // 32 * 4) * bih height
    ] ifFalse: [
        bytes := bih sizeImage.
    ].
    bits := ByteArray new:  bytes.
    s getBytesFor: bits.

    bitmap := self new.
    bitmap bitmapInfo: (
        rgbColor isNil
            ifTrue: [WinBitmapInfo new contents: bih contents]
             ifFalse: [
                WinBitmapInfo new contents: bih contents, rgbColor]).
    bitmap createBitmap: bits.
    bitmap
        deviceContext: MemoryContext;
        graphicsTool: (
            Pen forDC: MemoryContext medium: bitmap).
    ^bitmap!   !

!Font class methods !
face: aString
    size: aPoint
    fixedWidth: fixedWidth
    attributes: a

    "Added by OSI"

    #addedByOSI.
    ^self face: aString size: aPoint fixedWidth: fixedWidth!  !

!Float class methods !   
exit
        "Free the emulator DLL."
    FloatEmulator notNil
        ifTrue: [FloatEmulator free].!    !
"construct application"
((Smalltalk at: #CPApplication ifAbsent: [])
    isKindOf: Class) ifTrue: [
        ((Smalltalk at: #CPApplication) for:'WindowBuilder Pro/V Windows 1.0.6 Runtime')
            addClass: WBEntryField;
            addClass: ActionButton;
            addClass: WBCompositePaneTester;
            addClass: LinkButton;
            addClass: RadioButtonGroup;
            addClass: WBDialogTopPane;
            addClass: EnhancedEntryField;
            addClass: WinMinMaxInfo;
            addClass: CheckBoxGroup;
            addClass: WBAction;
            addClass: SexPane;
            addClass: WBToolBar;
            addClass: WBWindowDialog;
            addClass: WBComboBox;
            addClass: WBTool;
            addClass: CompositePane;
            addClass: WBToolPalette;
            addClass: CPBitmapDict;
            addClass: WBListBox;
            addClass: FramingParameters;
            addClass: CPStaticGraphic;
            addClass: EntryFieldGroup;
            addMethod: #wbCreated forClass: ViewManager class;
            addMethod: #open forClass: ViewManager class;
            addMethod: #openAsMDIParent forClass: ViewManager class;
            addMethod: #openWithMyParent: forClass: ViewManager class;
            addMethod: #openWithParent: forClass: ViewManager class;
            addMethod: #openCenteredOnMouse forClass: ViewManager class;
            addMethod: #openWithMDIParent: forClass: ViewManager class;
            addMethod: #monthStrings forClass: Date class;
            addMethod: #validateString: forClass: Date class;
            addMethod: #dateArray: forClass: Date class;
            addMethod: #validateDay:month:year: forClass: Date class;
            addMethod: #itemTemplateStyle:x:y:cx:cy:id:className:text:extraData: forClass: WinDialogInfo class;
            addMethod: #fromStream: forClass: Bitmap class;
            addMethod: #face:size:fixedWidth:attributes: forClass: Font class;
            addMethod: #exit forClass: Float class;
            addMethod: #wmGetminmaxinfo:with: forClass: Window;
            addMethod: #addSubpane: forClass: Window;
            addMethod: #topParent forClass: Window;
            addMethod: #dialogTemplate: forClass: Window;
            addMethod: #addSubpaneDynamically: forClass: Window;
            addMethod: #notebookParent forClass: Window;
            addMethod: #modifiedBy forClass: Window;
            addMethod: #modifiedBy: forClass: Window;
            addMethod: #paneName forClass: Window;
            addMethod: #createdBy forClass: Window;
            addMethod: #dialogTemplate forClass: Window;
            addMethod: #createdBy: forClass: Window;
            addMethod: #add:interestIn: forClass: Window;
            addMethod: #getSubpaneOrder forClass: Window;
            addMethod: #getContentsHandler forClass: Window;
            addMethod: #redraw forClass: Window;
            addMethod: #addToSubpaneOrder: forClass: Window;
            addMethod: #windowText forClass: Window;
            addMethod: #iconFile forClass: Window;
            addMethod: #paneNamed: forClass: Window;
            addMethod: #allChildren forClass: Window;
            addMethod: #paneName: forClass: Window;
            addMethod: #accel:afBits: forClass: Window;
            addMethod: #wmCommand:with: forClass: Window;
            addMethod: #iconFile: forClass: Window;
            addMethod: #helpManager forClass: Window;
            addMethod: #bitIsOn: forClass: Integer;
            addMethod: #centeredOnMouse forClass: ViewManager;
            addMethod: #openWithMyParent: forClass: ViewManager;
            addMethod: #createViews forClass: ViewManager;
            addMethod: #open forClass: ViewManager;
            addMethod: #openAsMDIParent forClass: ViewManager;
            addMethod: #dialogTemplate: forClass: ViewManager;
            addMethod: #openWithOwnerParent: forClass: ViewManager;
            addMethod: #positionRelativeTo:offset: forClass: ViewManager;
            addMethod: #openRelativeTo:offset: forClass: ViewManager;
            addMethod: #dialogTemplate forClass: ViewManager;
            addMethod: #isModal forClass: ViewManager;
            addMethod: #openWithParent: forClass: ViewManager;
            addMethod: #isWBWindow forClass: ViewManager;
            addMethod: #removeView: forClass: ViewManager;
            addMethod: #maxWindowSize forClass: ViewManager;
            addMethod: #minWindowSize forClass: ViewManager;
            addMethod: #openWithMDIParent: forClass: ViewManager;
            addMethod: #createViewsFor:owner: forClass: ViewManager;
            addMethod: #openCenteredOnMouse forClass: ViewManager;
            addMethod: #openWithOwner: forClass: ViewManager;
            addMethod: #openViews forClass: ViewManager;
            addMethod: #openWindow forClass: ViewManager;
            addMethod: #viewNamed: forClass: ViewManager;
            addMethod: #centeredOnScreen forClass: ViewManager;
            addMethod: #closeWindow forClass: ViewManager;
            addMethod: #paneNamed: forClass: ViewManager;
            addMethod: #execute:withTopPane: forClass: ViewManager;
            addMethod: #views forClass: ViewManager;
            addMethod: #stripMnemonic forClass: String;
            addMethod: #asProperNoun forClass: String;
            addMethod: #asByteArray forClass: String;
            addMethod: #beginsWith: forClass: String;
            addMethod: #isRadio forClass: RadioButton;
            addMethod: #isWsTabstop forClass: StaticText;
            addMethod: #tabStop forClass: StaticText;
            addMethod: #noScrollBars forClass: GraphPane;
            addMethod: #noBorders forClass: GraphPane;
            addMethod: #noBorders forClass: TextEdit;
            addMethod: #noScrollBars forClass: TextEdit;
            addMethod: #wordWrap forClass: TextEdit;
            addMethod: #wmGetdlgcode:with: forClass: TextEdit;
            addMethod: #scrollBars forClass: TextEdit;
            addMethod: #setDefault forClass: Toggle;
            addMethod: #isButton forClass: Toggle;
            addMethod: #unsetDefault forClass: Toggle;
            addMethod: #maxSize forClass: EntryField;
            addMethod: #setReadOnly: forClass: EntryField;
            addMethod: #selectAll forClass: EntryField;
            addMethod: #readonly forClass: EntryField;
            addMethod: #contents forClass: EntryField;
            addMethod: #maxSize: forClass: EntryField;
            addMethod: #password forClass: EntryField;
            addMethod: #cpSize forClass: DrawnButton;
            addMethod: #setDefault forClass: DrawnButton;
            addMethod: #unsetDefault forClass: DrawnButton;
            addMethod: #cpContents forClass: DrawnButton;
            addMethod: #cpStyle forClass: DrawnButton;
            addMethod: #stretchToFit forClass: DrawnButton;
            addMethod: #cpContents: forClass: DrawnButton;
            addMethod: #fixedSize forClass: DrawnButton;
            addMethod: #fileExists: forClass: DrawnButton;
            addMethod: #invisible forClass: DrawnButton;
            addMethod: #createPatternBrush: forClass: GDIDLL;
            addMethod: #ifNil: forClass: UndefinedObject;
            addMethod: #displayHelp: forClass: UndefinedObject;
            addMethod: #isMessage forClass: Message;
            addMethod: #isSubPane forClass: SubPane;
            addMethod: #accel:afBits: forClass: SubPane;
            addMethod: #isWsTabstop forClass: SubPane;
            addMethod: #isButton forClass: SubPane;
            addMethod: #getPopupMenu forClass: SubPane;
            addMethod: #isGroupable forClass: SubPane;
            addMethod: #isWsGroup forClass: SubPane;
            addMethod: #dependents forClass: SubPane;
            addMethod: #wmSetfocus:with: forClass: SubPane;
            addMethod: #wmKillfocus:with: forClass: SubPane;
            addMethod: #addStyle: forClass: SubPane;
            addMethod: #removeDynamically forClass: SubPane;
            addMethod: #extraDialogItemData forClass: SubPane;
            addMethod: #removeSubpaneDynamically: forClass: SubPane;
            addMethod: #tabStop forClass: SubPane;
            addMethod: #startGroup forClass: SubPane;
            addMethod: #aboutToSaveImage forClass: SubPane;
            addMethod: #handlers forClass: SubPane;
            addMethod: #minWindowSize forClass: Object;
            addMethod: #modifiedByOSI forClass: Object;
            addMethod: #isSubPane forClass: Object;
            addMethod: #isWBAction forClass: Object;
            addMethod: #isWBWindow forClass: Object;
            addMethod: #isMDIFrame forClass: Object;
            addMethod: #preInitWindow forClass: Object;
            addMethod: #isRadio forClass: Object;
            addMethod: #ifNil: forClass: Object;
            addMethod: #isMessage forClass: Object;
            addMethod: #openWindow forClass: Object;
            addMethod: #addedByOSI forClass: Object;
            addMethod: #isDictionary forClass: Object;
            addMethod: #isCompositePane forClass: Object;
            addMethod: #isRectangle forClass: Object;
            addMethod: #initWindow forClass: Object;
            addMethod: #asString forClass: Object;
            addMethod: #isRectangle forClass: Rectangle;
            addMethod: #buildItems forClass: DialogTopPane;
            addMethod: #wmCreate:with: forClass: DialogTopPane;
            addMethod: #mainWindow forClass: DialogTopPane;
            addMethod: #sizeWindow forClass: DialogTopPane;
            addMethod: #cachedBuildItems forClass: DialogTopPane;
            addMethod: #defaultFrameStyle forClass: DialogTopPane;
            addMethod: #frameStyleFromPStyle forClass: DialogTopPane;
            addMethod: #buildWindow: forClass: DialogTopPane;
            addMethod: #close forClass: DialogTopPane;
            addMethod: #pushMnemonic: forClass: TopPane;
            addMethod: #accel:afBits: forClass: TopPane;
            addMethod: #pStyle forClass: TopPane;
            addMethod: #frameStyleFromPStyle forClass: TopPane;
            addMethod: #pStyle: forClass: TopPane;
            addMethod: #close: forClass: TopPane;
            addMethod: #openWindow forClass: WindowDialog;
            addMethod: #openViews forClass: WindowDialog;
            addMethod: #openModeless forClass: WindowDialog;
            addMethod: #isModal forClass: WindowDialog;
            addMethod: #fixedWidth forClass: Font;
            addMethod: #stringExtent: forClass: Font;
            addMethod: #fromByteArray: forClass: Font;
            addMethod: #wbStringWidth: forClass: Font;
            addMethod: #fromBytes: forClass: Font;
            addMethod: #getVersion forClass: KernelDLL;
            addMethod: #drawText:text:length:rect:format: forClass: UserDLL;
            addMethod: #getWindowTextW:text:maxLength: forClass: UserDLL;
            addMethod: #createDialogIndirect:dialogTemplate:parent:dialogFunction: forClass: UserDLL;
            addMethod: #getDlgItemTextW:item:text:maxCount: forClass: UserDLL;
            addMethod: #indexOf: forClass: ListBox;
            addMethod: #fill:bitmap: forClass: GraphicsTool;
            addMethod: #fill:color: forClass: GraphicsTool;
            addMethod: #convertBytesToString forClass: Array;
            addMethod: #asByteArray forClass: Array;
            addMethod: #syncControlEvent: forClass: GroupPane;
            addMethod: #setBackColor: forClass: ApplicationWindow;
            addMethod: #wmSize:with: forClass: ApplicationWindow;
            addMethod: #defaultFrameStyle forClass: ApplicationWindow;
            addMethod: #closeView forClass: ApplicationWindow;
            addMethod: #activate forClass: ApplicationWindow;
            addMethod: #validate forClass: ApplicationWindow;
            addMethod: #viewName: forClass: ApplicationWindow;
            addMethod: #wmGetminmaxinfo:with: forClass: ApplicationWindow;
            addMethod: #frameStyleFromPStyle forClass: ApplicationWindow;
            addMethod: #winDrawText:at: forClass: TextTool;
            addMethod: #centerWinText:at: forClass: TextTool;
            addMethod: #centerText:at: forClass: TextTool;
            addMethod: #winDrawText:in:format: forClass: TextTool;
            addMethod: #readWinQueue forClass: NotificationManager;
            addMethod: #activeWindow forClass: NotificationManager;
            addMethod: #translateAccelerator: forClass: NotificationManager;
            addMethod: #isCtrlDown forClass: NotificationManager;
            addMethod: #isAltDown forClass: NotificationManager;
            addMethod: #contents: forClass: ControlPane;
            addMethod: #basicStyle forClass: ControlPane;
            addMethod: #isWsTabstop forClass: GroupBox;
            addMethod: #tabStop forClass: GroupBox;
            addMethod: #isDictionary forClass: Dictionary;
            addMethod: #draw3DButton:rect:font:foreColor:backColor: forClass: Pen;
            addMethod: #drawFocusRect: forClass: Pen;
            addMethod: #lineFrom:to: forClass: Pen;
            addMethod: #draw3DButton:rect:font: forClass: Pen;
            addMethod: #drawRectangle: forClass: Pen;
            addMethod: #quickLineFrom:to:using: forClass: Pen;
            addMethod: #drawRect3D:depth:style: forClass: Pen;
            addMethod: #createIcon forClass: Icon;
            addMethod: #noBorders forClass: TextPane;
            addMethod: #contents: forClass: TextPane;
            addMethod: #noScrollBars forClass: TextPane;
            addMethod: #wmGetdlgcode:with: forClass: TextPane;
            addMethod: #wmKillfocus:with: forClass: Button;
            addMethod: #isButton forClass: Button;
            addMethod: #setDefault forClass: Button;
            addMethod: #setDefault: forClass: Button;
            addMethod: #unsetDefault forClass: Button;
            addMethod: #initialize forClass: Button;
            addMethod: #isGroupable forClass: Button;
            addMethod: #cancelPushButton forClass: Button;
            addMethod: #setFocus forClass: Button;
            addMethod: #buildItem:menu:menuBar: forClass: Menu;
            addMethod: #appendItem:action: forClass: Menu;
            addMethod: #appendItem:selector:acceleratorString: forClass: Menu;
            addMethod: #appendItem:action:acceleratorString: forClass: Menu;
            addMethod: #disableAll forClass: Menu;
            addMethod: #wbAction forClass: Menu;
            addMethod: #enableAll forClass: Menu;
            addMethod: #clearPopup forClass: Menu;
            addMethod: #appendItem:link:type: forClass: Menu;
            addMethod: #appendItem:link:type:acceleratorString: forClass: Menu;
            addMethod: #queryItemText: forClass: DialogBox;
            addCriticalMethod: #wbCreated forClass: ViewManager class;
            addCriticalMethod: #isMDIFrame forClass: Object;
            addCriticalMethod: #isWBWindow forClass: Object;
            addCriticalMethod: #activeWindow forClass: NotificationManager;
            comments: 'This file contains the source code for the Smalltalk/V Windows runtime
filein of WindowBuilder Pro/V.  It provides the supporting portability
code necessary to run ViewManager classes that were generated with
WindowBuilder Pro/V.  Before filing in WindowBuilder classes into a
Smalltalk/V Windows image, install this file first.

To install this file into a clean Smalltalk/V Windows image, select
the Install... command from the File menu, select this file in the
Choose File dialog that appears, then press the OK button.

Alternatively, you can execute the following code, with this file in the
current directory:

    (File pathName: ''runtime.st'') fileIn; close.

(c) ParcPlace-Digitalk, Inc. 1996
(c) Objectshare Systems, Inc. 1993-1996

For more information contact:

    ObjectShare, a division of ParcPlace-Digitalk
    3160 De La Cruz Blvd, Suite 205
    Santa Clara, CA 95054-2408
    (408) 970-7280 Phone
    (408) 970-7282 Fax
    http://www.objectshare.com

';
            initCode: '    (Smalltalk product = ''Smalltalk/V Windows'' and: [Smalltalk version = ''2.0'']) ifFalse: [
        MessageBox message: ''This version of WindowBuilder Pro requires Smalltalk/V for Windows version 2.0.
A walkback follows.''.
        self error: ''Wrong Smalltalk/V Platform/Version''
    ].

    Smalltalk at: #WBConstants put: WinConstants.
    Smalltalk at: #PMToWinKeyMap put: Dictionary new.
    Smalltalk at: #WinToPMKeyMap put: Dictionary new.
    ColorConstants at: ''ClrChiseledgray'' put: -1.

';
            finalizeCode: '

PMToWinKeyMap
    at: 17 put: 33;      "VkPageup"
    at: 38 put: 118;    "VkF7"
    at: 15 put: 27;      "VkEscape"
    at: 26 put: 45;      "VkInsert"
    at: 47 put: 127;    "VkF16"
    at: 36 put: 116;    "VkF5"
    at: 43 put: 123;    "VkF12"
    at: 5 put: 8;         "VkBack"
    at: 18 put: 34;      "VkPagedown"
    at: 34 put: 114;    "VkF3"
    at: 41 put: 18;      "VkMenu"
    at: 46 put: 126;    "VkF15"
    at: 13 put: 19;      "VkPause"
    at: 39 put: 119;    "VkF8"
    at: 42 put: 122;    "VkF11"
    at: 32 put: 112;    "VkF1"
    at: 27 put: 46;      "VkDelete"
    at: 37 put: 117;    "VkF6"
    at: 23 put: 39;      "VkRight"
    at: 29 put: 144;    "VkNumlock"
    at: 45 put: 125;    "VkF14"
    at: 44 put: 124;    "VkF13"
    at: 41 put: 121;    "VkF10"
    at: 9 put: 16;       "VkShift"
    at: 6 put: 9;         "VkTab"
    at: 35 put: 115;    "VkF4"
    at: 19 put: 35;      "VkEnd"
    at: 16 put: 32;      "VkSpace"
    at: 20 put: 36;      "VkHome"
    at: 40 put: 120;    "VkF9"
    at: 33 put: 113;    "VkF2"
    at: 21 put: 37;      "VkLeft"
    at: 22 put: 38;      "VkUp"
    at: 24 put: 40.      "VkDown"
    PMToWinKeyMap keys do: [ :k |
        WinToPMKeyMap at: (PMToWinKeyMap at: k) put: k.
    ].

    VirtualKeyConstants at: ''AfVirtualkey'' put: 8.

    WinEvents at: 36  put: #wmGetminmaxinfo:with:.

';
            fileName: 'runtime.st';
            startUpCode: nil]!

"Finalize"
  


PMToWinKeyMap
    at: 17 put: 33;      "VkPageup"
    at: 38 put: 118;    "VkF7"
    at: 15 put: 27;      "VkEscape"
    at: 26 put: 45;      "VkInsert"
    at: 47 put: 127;    "VkF16"
    at: 36 put: 116;    "VkF5"
    at: 43 put: 123;    "VkF12"
    at: 5 put: 8;         "VkBack"
    at: 18 put: 34;      "VkPagedown"
    at: 34 put: 114;    "VkF3"
    at: 41 put: 18;      "VkMenu"
    at: 46 put: 126;    "VkF15"
    at: 13 put: 19;      "VkPause"
    at: 39 put: 119;    "VkF8"
    at: 42 put: 122;    "VkF11"
    at: 32 put: 112;    "VkF1"
    at: 27 put: 46;      "VkDelete"
    at: 37 put: 117;    "VkF6"
    at: 23 put: 39;      "VkRight"
    at: 29 put: 144;    "VkNumlock"
    at: 45 put: 125;    "VkF14"
    at: 44 put: 124;    "VkF13"
    at: 41 put: 121;    "VkF10"
    at: 9 put: 16;       "VkShift"
    at: 6 put: 9;         "VkTab"
    at: 35 put: 115;    "VkF4"
    at: 19 put: 35;      "VkEnd"
    at: 16 put: 32;      "VkSpace"
    at: 20 put: 36;      "VkHome"
    at: 40 put: 120;    "VkF9"
    at: 33 put: 113;    "VkF2"
    at: 21 put: 37;      "VkLeft"
    at: 22 put: 38;      "VkUp"
    at: 24 put: 40.      "VkDown"
    PMToWinKeyMap keys do: [ :k |
        WinToPMKeyMap at: (PMToWinKeyMap at: k) put: k.
    ].

    VirtualKeyConstants at: 'AfVirtualkey' put: 8.

    WinEvents at: 36  put: #wmGetminmaxinfo:with:.

!

   
    Transcript cr; show: 'WindowBuilder Pro/V Windows 1.0.6 Runtime installed.'!
