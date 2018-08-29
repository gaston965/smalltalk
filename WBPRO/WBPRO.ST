"
******************************************************************************
Application : WindowBuilder Pro/V Windows 1.0.6
Date        : Sep 17, 1996
Time        : 17:31:15

Introduction
============

This file contains the source code for WindowBuilder Pro/V Windows 1.0.6.
Use the 'File | Install..' command to install this product.

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
    CPBitmapManager WBFileSelectorEditor PStaticGraphic 
    PGroupBox PGroupbox WBTabEditor PFormattedEntryField 
    WBFramingEditor WBChoosePaneDialog PWBInvisibleGroupPane 
    CPCreateButton WBGroupBox WBTopPane WBFramingParameters 
    PRadioButtonGroup WBActionEditor WBInvisibleGroupPane 
    PWBVerticalScrollBar WBFramerExample 
    WBCompositePaneScratchWindow PCompositePane 
    WBDefaultDialogScratchWindow WBStatusPaneEditor WB3DFrame 
    PGenericSubpane PEnhancedEntryField ButtonEditor 
    GraphicObject PStaticBox WBVerticalScrollBar 
    FrameObject WindowFrameObject PTextEdit WBPMenubar 
    PDrawnButton InterfaceObject WBMDIAttributesEditor 
    WBTabPosition PEntryField WBMenuTester 
    WBDefaultScratchWindow WBLayoutPane WBScrapbookRetrieve 
    PCheckBox WBScratchWindow WBListEntryField 
    BitEditor PToggle PEntryFieldGroup PAnimationPane 
    WBMultiListChooser PButton WBKeyEntryField 
    WBDefaultCompositePaneScratchWindow PComboBox PCPStaticGraphic 
    PCheckBoxGroup PMultipleSelectListBox WBScrollingPane 
    WBToolBarEditor WBMenubarEditor TextEditWindow 
    WBDialogEditor PScrollBar CompositeFrameObject 
    WBPMenu PThreeStateButton WBTreeNode WBMenuEditor 
    PListBox PLinkButton PRadioButton PWBToolBar 
    WBListEditor WBTreeListBox WBChooseClassDialog 
    WBDialogScratchWindow WBCreateClassDialog 
    WBTabOrderLayoutPane WBAddInManager WBEnhancedEntryFieldEditor 
    CPCreateBitmap WBHorizontalScrollBar WBStaticTextEditor 
    WBScrapbookStore WBRealLayoutPane WBPMenuItem 
    WBAboutDialog PWBHorizontalScrollBar PGraphPane 
    WBColorDialog WBAttributeEditor PActionButton 
    WBKeyAccel PStatusPane WBLinkEditor WBWindowEditor 
    WBScrollBarEditor WBTextPane PListPane PStaticText 
    WindowBuilder PTextPane WBMultiToolPalette 
    WBMDIAttributes WBListChooser 

Methods : 
Window>>tabPosition:
Window>>setStyle:
Window>>getId
Window>>nameForInstVar:
Window>>extent:
WinDialogInfo>>numberOfItems
WinDialogInfo>>readFrom:
WinDialogInfo>>items
WinDialogInfo>>extent
WinDialogInfo>>style
WinDialogInfo>>text
WinDialogInfo>>origin
ComboBox>>text
String>>asQuotedString
String>>asMessage
String>>hasContent
String>>upTo:
String>>mnemonicChar
ViewManager>>menuWindow
StaticText>>showHelp:
Class>>setSharedPools:
Symbol>>asPresentableString
Symbol>>asCUAPresentableString
Point>>extentFromRightTop:
Point>>extentFromCenterTop:
ReadWriteStream>>nextFourBytes
ReadWriteStream>>nextTwoBytes
ClassHierarchyBrowser>>isWBClassBrowser
ClassHierarchyBrowser>>openSelecting:
ClassHierarchyBrowser>>selectedMethod
ClassHierarchyBrowser>>selectedClass
Stream>>nextString:
Screen>>pointFromUser:offset:
Object>>isWBClassBrowser
Object>>isInterfaceObject
Object>>isWBInternalClass
Rectangle>>localizeRect:
Rectangle>>centerTop
Rectangle>>offsetFromLeftTop:
Rectangle>>unLocalizeRect:
Rectangle>>moveToLeftTop:
Font>>logicalBytes
Font>>italic
Font>>wbEquals:
Font>>bold:
Font>>portableStoreOn:indentString:
Font>>nonPortableStoreOn:indentString:
Font>>underscore
Font>>storeOn:indentString:
Font>>strikeOut
TopPane>>handlers
SubPane>>realHandlers
SubPane>>handlers:
Bitmap>>storeOnStream:
Bitmap>>fromSysID:
Bitmap>>cpCopy
TextWindow>>addMenuItem:
UserDLL>>openIcon:
UserDLL>>drawFocusRect:rectangle:
Array>>asOrderedCollectionRecursively
MenuWindow>>performMenuItem:
MenuWindow>>asWBPMenuBar
MenuWindow>>asWBPMenu
MenuWindow>>wbMenuTitled:
WinTextMetrics>>tmUnderline
WinTextMetrics>>tmStrikeOut
ByteArray>>asString
ApplicationWindow>>menuWindow:
ApplicationWindow>>label
Number>>isFraction
TextPane>>realHandlers
Pen>>drawRect3DLight:
Pen>>buttonHighlight
Pen>>drawRect3D:
AboutDialog>>open
Menu>>insertItemDynamically:selector:atIndex:
Menu>>asWBPMenu
Menu>>removeItemDynamically:
Menu>>removeAllItemsDynamically
Menu>>asPMenuItem
CursorManager class>>leftRight
CursorManager class>>corner
CursorManager class>>initialize
CursorManager class>>upDown
ViewManager class>>wbCreatedClasses
ViewManager class>>isScratchWindow
Bitmap class>>fromStream:
Bitmap class>>buttonWidth:height:
MessageBox class>>yesNoCancelTitled:text:
MessageBox class>>messageNote:
WinDialogInfo class>>itemTemplateStyle:x:y:cx:cy:id:className:text:

******************************************************************************
"!

"Initialize"
   
    Transcript cr; show: 'Installing WindowBuilder Pro/V Windows 1.0.6...'.!

  

    | srcDir path class |

    ((Smalltalk product = 'Smalltalk/V Windows' or: [Smalltalk product = 'Smalltalk Express']) and: [Smalltalk version = '2.0']) ifFalse: [
        MessageBox message: 'This version of WindowBuilder Pro requires Smalltalk Express.
A walkback follows.'.
        self error: 'Wrong Smalltalk/V Platform/Version'
    ].

    Transcript cr; show: 'This will take awhile. Please do not interrupt the installation.'.
    (Smalltalk includesKey: #IconEditor) ifFalse: [
        Transcript cr; show: '*** In order to edit icons for windows you must install the IconEditor.'.
        Transcript cr; show: '*** It can be found in EXAMPLES\ICONEDIT (ICONEDIT.ST).'.
    ].
    (Smalltalk includesKey: #ObjectFiler) ifFalse: [
        Transcript cr; show: '*** In order to load and save scrapbooks you must install ObjectFiler.'.
        Transcript cr; show: '*** It can be found in EXTRAS\OBJFILER (VWOBJFLR.ST).'.
    ].

    File allInstances do: [ :f |
        (f name notNil and: [ f name asLowerCase = 'wbpro.st' ]) ifTrue: [
            srcDir := f directory drivePathName, '\'.
        ].
    ].
    srcDir isNil ifTrue: [
        srcDir := Directory current drivePathName, '\'.
    ].
    (Smalltalk includesKey: #MDISystem) ifFalse: [
        Transcript cr; show: '*** In order to use MDI you must install MDI support.'.
        Transcript cr; show: '*** It can be found in EXTRAS\MDI (MDI.ST).'.
        Transcript cr; show: '*** Also load MDIPATCH.ST from ',srcDir.
    ].

    #('WBBMP.DCT' 'BITMAPS.BDT' 'SCRAP.SBK') do: [ :file |
        (File exists: srcDir, file) ifFalse: [
            MessageBox message: 'Cannot find the file: ',file,'. The installation will be aborted.
A walkback follows.'.
            self error: 'Cannot find the file: ',file
       ].
    ].

    Smalltalk at: #CPSrcDir put: srcDir.

    Smalltalk at: #PWindowBuilder put: nil.

    Smalltalk at: #WindowBuilderVersion put:  'Version 1.0.6\Smalltalk Express' withCrs.
    Smalltalk at: #WindowLabelPrefix put: 'Smalltalk Express'.
    Smalltalk at: #AcuFont put: nil.
    Smalltalk at: #WBConstants put: WinConstants.
    Smalltalk at: #PMToWinKeyMap put: Dictionary new.
    Smalltalk at: #WinToPMKeyMap put: Dictionary new.
    WinConstants at: 'ColorBtnhighlight' put: 20.
    ColorConstants at: 'ClrChiseledgray' put: -1.

    (Smalltalk includesKey: #WindowBuilder) ifTrue: [
        (Smalltalk at: #WindowBuilder)
            removeSelector: #pane:;
            removeSelector: #initInstVars.
    ].

    Smalltalk at: #WindowBuilderUser put: ''.
    Smalltalk at: #WindowBuilderCompany put: ''.
    Smalltalk at: #WindowBuilderSerialNumber put: ''.

    (File pathName: srcDir, 'runtime.st') fileIn; close.

    Transcript cr; show: 'Loading WindowBuilder Pro Bitmaps...'.
    (Smalltalk at: #CPBitmapDict) loadSystemBitmaps: 'wbbmp.dct'.
    (Smalltalk at: #CPBitmapDict) addBitmaps: 'bitmaps.bdt'.
    Transcript cr; show: 'WindowBuilder Pro Bitmaps Loaded.'.

    Transcript cr; show: 'Installing WindowBuilder Pro Classes...'.




!

WindowDialog subclass: #WBTabEditor
  instanceVariableNames: 
    'result statusLine layoutPane editedPane panes setTabbingButton addGroupButton removeGroupButton okButton '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

WindowDialog subclass: #WBFramingEditor
  instanceVariableNames: 
    'result beforeScaleFactor hasFramed currentRect currentRectList parentRect largeParentRect framingParameters originXAnchor originYAnchor cornerXAnchor cornerYAnchor originYStyleFixed originYStyleScaled originXStyleFixed originXStyleScaled cornerXStyleFixed cornerXStyleScaled cornerYStyleFixed cornerYStyleScaled xCenteredCheckBox yCenteredCheckBox beforeRect afterRect leftRelative rightRelative topRelative bottomRelative '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

GroupBox subclass: #WBGroupBox
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

FramingParameters subclass: #WBFramingParameters
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

CompositePane subclass: #WBCompositePaneScratchWindow
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

WindowDialog subclass: #WBDefaultDialogScratchWindow
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

Object subclass: #GraphicObject
  instanceVariableNames: 
    'rect '
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

ScrollBar subclass: #WBVerticalScrollBar
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

GraphicObject subclass: #InterfaceObject
  instanceVariableNames: 
    'foreColor backColor handlers contents style font menu framingBlock name tabPosition realClass resID parentWindow '
  classVariableNames: 
    'Up Right Left Down ClassAndStyleDict '
  poolDictionaries: 
    'ColorConstants WBConstants '!

Object subclass: #WBTabPosition
  instanceVariableNames: 
    'basicTabPosition groupPosition '
  classVariableNames: ''
  poolDictionaries: ''!

WindowDialog subclass: #WBMDIAttributesEditor
  instanceVariableNames: 
    'result attributes who when eventDict '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

GroupPane subclass: #WBLayoutPane
  instanceVariableNames: 
    'editedPane rubberBandSelected panes selectedPanes loadedPanes lastOperation undoInfo selectionHasChanged inTabEdit '
  classVariableNames: 
    'Clipboard KeepDotsHidden GridSize DrawGrid '
  poolDictionaries: 
    'ColorConstants WBConstants CharacterConstants '!

WindowDialog subclass: #WBScrapbookRetrieve
  instanceVariableNames: 
    'layoutPane removedQuick chapter page scrapbook '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

EntryField subclass: #WBListEntryField
  instanceVariableNames: 
    'owningListBox justSetContents '
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants VirtualKeyConstants CharacterConstants '!

InterfaceObject subclass: #PButton
  instanceVariableNames: 
    'specialId '
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

InterfaceObject subclass: #PToggle
  instanceVariableNames: ''
  classVariableNames: 
    'RadioBitmap '
  poolDictionaries: 
    'WBConstants '!

InterfaceObject subclass: #PEntryFieldGroup
  instanceVariableNames: 
    'label children bestSize '
  classVariableNames: ''
  poolDictionaries: ''!

CompositePane subclass: #WBDefaultCompositePaneScratchWindow
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

EntryField subclass: #WBKeyEntryField
  instanceVariableNames: 
    'accelerator '
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants VirtualKeyConstants CharacterConstants '!

InterfaceObject subclass: #PComboBox
  instanceVariableNames: ''
  classVariableNames: 
    'DownArrow '
  poolDictionaries: 
    'ColorConstants WBConstants '!

InterfaceObject subclass: #PScrollBar
  instanceVariableNames: 
    'minimum maximum lineIncrement pageIncrement '
  classVariableNames: ''
  poolDictionaries: ''!

PToggle subclass: #PThreeStateButton
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

Object subclass: #WBTreeNode
  instanceVariableNames: 
    'listString parent currentString children '
  classVariableNames: ''
  poolDictionaries: ''!

PToggle subclass: #PRadioButton
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

WindowDialog subclass: #WBMenuEditor
  instanceVariableNames: 
    'warnedAboutAccelerators editedMenu shiftLeftButton shiftUpButton shiftDownButton shiftRightButton result hasAccelCheckBox keyShortCutEditor menuItemsEditor testItButton selectorEditor dividerState isAlt isShift isCtrl '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants CharacterConstants '!

InterfaceObject subclass: #PListBox
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

InterfaceObject subclass: #PWBToolBar
  instanceVariableNames: 
    'cellSize elements useSystem '
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

ListBox subclass: #WBTreeListBox
  instanceVariableNames: 
    'noSelect owningEditBox previousSelection cachedFlatList '
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

WindowDialog subclass: #WBScrapbookStore
  instanceVariableNames: 
    'layoutPane isQuick '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

WBLayoutPane subclass: #WBTabOrderLayoutPane
  instanceVariableNames: 
    'modalState tabCount groups nonGroupedPanes isEditingTabs '
  classVariableNames: 
    'LargeNumberFont SmallNumberFont '
  poolDictionaries: 
    'ColorConstants WBConstants '!

WindowDialog subclass: #WBCreateClassDialog
  instanceVariableNames: 
    'newClass limitTo '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

WindowDialog subclass: #WBDialogScratchWindow
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

WindowDialog subclass: #WBChooseClassDialog
  instanceVariableNames: 
    'result classList classListBox default allowOthers '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

ScrollBar subclass: #WBHorizontalScrollBar
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

WindowDialog subclass: #CPCreateBitmap
  instanceVariableNames: 
    'b mono width height '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

WindowDialog subclass: #WBAddInManager
  instanceVariableNames: 
    'changed selection '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

WBLayoutPane subclass: #WBRealLayoutPane
  instanceVariableNames: 
    'views mdiAttributes '
  classVariableNames: 
    'DrawingBitmap '
  poolDictionaries: 
    'CharacterConstants WBConstants '!

WindowDialog subclass: #WBAboutDialog
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

WBTreeNode subclass: #WBPMenuItem
  instanceVariableNames: 
    'isDivider keyAccel selector submenu '
  classVariableNames: ''
  poolDictionaries: 
    'CharacterConstants '!

Object subclass: #WBKeyAccel
  instanceVariableNames: 
    'keyCode text isControl isShift isAlt '
  classVariableNames: 
    'KeyConstantsDict '
  poolDictionaries: 
    'WBConstants VirtualKeyConstants '!

PScrollBar subclass: #PWBHorizontalScrollBar
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

WindowDialog subclass: #WBColorDialog
  instanceVariableNames: 
    'result foreColor backColor thePane colors '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

InterfaceObject subclass: #PGraphPane
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

WindowDialog subclass: #WBAttributeEditor
  instanceVariableNames: 
    'thePane '
  classVariableNames: ''
  poolDictionaries: ''!

InterfaceObject subclass: #PStatusPane
  instanceVariableNames: 
    'statusBoxes '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants ColorConstants '!

WBAttributeEditor subclass: #WBLinkEditor
  instanceVariableNames: 
    'link type '
  classVariableNames: 
    'Descriptions '
  poolDictionaries: 
    'ColorConstants WBConstants '!

WBAttributeEditor subclass: #WBScrollBarEditor
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

PListBox subclass: #PListPane
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

Object subclass: #WBMDIAttributes
  instanceVariableNames: 
    'toolPaneEvents statusPaneEvents frameEvents label hasStatusPane hasToolPane '
  classVariableNames: ''
  poolDictionaries: ''!

InterfaceObject subclass: #PStaticText
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'CharacterConstants WBConstants '!

ViewManager subclass: #WindowBuilder
  instanceVariableNames: 
    'name toolPalette toolBar attributePalette editPalette groupPalette cleanedOutCode mainPane customSubMenu editedClass autoSave changed titleText styleText titleEditor when perform styleEditor thePane currentWhen sizePane positionPane statusPane '
  classVariableNames: 
    'Properties ToolbarTool HelpDict CustomPanes Scrapbook WBClasses WBIcon Extras '
  poolDictionaries: 
    'ColorConstants CharacterConstants VirtualKeyConstants WBConstants CommonDialogConstants '!

PGraphPane subclass: #PTextPane
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

WBToolPalette subclass: #WBMultiToolPalette
  instanceVariableNames: 
    'pages '
  classVariableNames: ''
  poolDictionaries: ''!

WindowDialog subclass: #WBListChooser
  instanceVariableNames: 
    'reply sel '
  classVariableNames: ''
  poolDictionaries: ''!

InterfaceObject subclass: #FrameObject
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

PScrollBar subclass: #PWBVerticalScrollBar
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

WBChooseClassDialog subclass: #WBChoosePaneDialog
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

ViewManager subclass: #BitEditor
  instanceVariableNames: 
    'bitPen bitColor bitPoint scale copy imagePen imageForm imageRect windowSize '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants ColorConstants '!

InterfaceObject subclass: #PTextEdit
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

WBTreeNode subclass: #WBPMenu
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

WBAttributeEditor subclass: #WBActionEditor
  instanceVariableNames: 
    'action method changed author history '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

InterfaceObject subclass: #PGenericSubpane
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

ViewManager subclass: #WBScratchWindow
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

PGraphPane subclass: #PAnimationPane
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

InterfaceObject subclass: #PWBInvisibleGroupPane
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

InterfaceObject subclass: #PStaticGraphic
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

WBAttributeEditor subclass: #WBStatusPaneEditor
  instanceVariableNames: 
    'boxes list clipboard '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

InterfaceObject subclass: #PStaticBox
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

WBAttributeEditor subclass: #WBStaticTextEditor
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

InterfaceObject subclass: #PDrawnButton
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

WBAttributeEditor subclass: #WBDialogEditor
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

TextWindow subclass: #TextEditWindow
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

InterfaceObject subclass: #PEntryField
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

ViewManager subclass: #CPBitmapManager
  instanceVariableNames: 
    'bitmapDictionary bitmapName myFile myEdit list '
  classVariableNames: 
    'ToolbarTool HelpDict BMIcon '
  poolDictionaries: 
    'ColorConstants WinConstants VirtualKeyConstants '!

PListBox subclass: #PMultipleSelectListBox
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

PDrawnButton subclass: #PActionButton
  instanceVariableNames: 
    'action '
  classVariableNames: ''
  poolDictionaries: ''!

WBAttributeEditor subclass: #WBEnhancedEntryFieldEditor
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

InterfaceObject subclass: #PCompositePane
  instanceVariableNames: 
    'initialFraming children defaultBackColor '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants '!

ViewManager subclass: #WBDefaultScratchWindow
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

FrameObject subclass: #WindowFrameObject
  instanceVariableNames: 
    'children iconFile createdBy modifiedBy '
  classVariableNames: 
    'Minimize Maximize SysMenu '
  poolDictionaries: 
    'ColorConstants WBConstants '!

PEntryField subclass: #PEnhancedEntryField
  instanceVariableNames: 
    'case character field getFocus justification maxSize autoTab '
  classVariableNames: ''
  poolDictionaries: ''!

WBAttributeEditor subclass: #WBFileSelectorEditor
  instanceVariableNames: 
    'title filters descriptions fileDialog '
  classVariableNames: ''
  poolDictionaries: ''!

PToggle subclass: #PCheckBox
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

CPCreateBitmap subclass: #CPCreateButton
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants ColorConstants '!

BitEditor subclass: #ButtonEditor
  instanceVariableNames: 
    'fileName '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants ColorConstants '!

PDrawnButton subclass: #PLinkButton
  instanceVariableNames: 
    'link type '
  classVariableNames: ''
  poolDictionaries: ''!

InterfaceObject subclass: #PRadioButtonGroup
  instanceVariableNames: 
    'label numColumns children '
  classVariableNames: ''
  poolDictionaries: ''!

WBListChooser subclass: #WBMultiListChooser
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

WBAttributeEditor subclass: #WBWindowEditor
  instanceVariableNames: 
    'iconFile iconEditor '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

WindowFrameObject subclass: #CompositeFrameObject
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

WBAttributeEditor subclass: #WBToolBarEditor
  instanceVariableNames: 
    'elements list useSystem clipboard '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

WBMenuEditor subclass: #WBMenubarEditor
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

WBAttributeEditor subclass: #WBListEditor
  instanceVariableNames: 
    'list listBox item '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

InterfaceObject subclass: #PGroupbox
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

ViewManager subclass: #WBMenuTester
  instanceVariableNames: 
    'menus '
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

PRadioButtonGroup subclass: #PCheckBoxGroup
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

SubPane subclass: #WBInvisibleGroupPane
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

WBPMenu subclass: #WBPMenubar
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

SubPane subclass: #WBFramerExample
  instanceVariableNames: 
    'frameRect paneRect extent '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

PGroupbox subclass: #PGroupBox
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

SubPane subclass: #WB3DFrame
  instanceVariableNames: 
    'style3D depth '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

TextPane subclass: #WBTextPane
  instanceVariableNames: 
    'offset '
  classVariableNames: ''
  poolDictionaries: ''!

PDrawnButton subclass: #PCPStaticGraphic
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

PEntryField subclass: #PFormattedEntryField
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

SubPane subclass: #WBScrollingPane
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!

TopPane subclass: #WBTopPane
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!




!CPBitmapManager class methods !
   
addToolbarTool

    | class |

    class := Smalltalk at: #MDISystem ifAbsent: [ nil ].

    class notNil ifTrue: [
        class addExtraTool: self toolBarTool.
    ].!
   
clearBMIcon

    "  CPBitmapManager clearBMIcon   "

    BMIcon := nil.!

clearToolbarTool

    "      CPBitmapManager clearToolbarTool      "

    ToolbarTool := nil.!
  
createToolbarBitmapFrom: bitmapName newName: newName innerRect: innerRect

    | newBitmap  bitmap singleBitmapExtent |

    bitmapName isString ifFalse: [
        bitmap := bitmapName
    ] ifTrue: [
        bitmap := CPBitmapDict at: bitmapName ifAbsent: [ Terminal bell. ^self ].
    ].

    newBitmap := (CPBitmapDict at: 'toolPaneExample') cpCopy.
    singleBitmapExtent := (Smalltalk at: #Tool) basicNew defaultExtent.

    newBitmap pen
        copyBitmap: bitmap
        from: bitmap boundingBox
        to: innerRect.

    newBitmap pen
        copyBitmap: bitmap
        from: bitmap boundingBox
        to: (innerRect leftTop + ((1 + singleBitmapExtent x)@1) extentFromLeftTop: innerRect extent).

    CPBitmapDict at: newName put: newBitmap.!
   
helpDict

    HelpDict isNil ifTrue: [
        HelpDict := Dictionary new.
        HelpDict
            at: 'File' put: 'Create, retrieve, and savebitmaps.';
            at: 'create' put: 'Create a new bitmap.';
            at: 'fromScreen' put: 'Capture a bitmap from the screen.';
            at: 'fromFile' put: 'Import a .ico or .bmp file as a bitmap.';
            at: 'load' put: 'Import a bitmap dictionary (.bdt) file';
            at: 'save' put: 'Save the list of bitmaps to a dictionary (.bdt) file';
            at: 'exit' put: 'Close the bitmap manager.';

            at: 'Edit' put: 'Bitmap copying, pasting, duplicating, and editing';
            at: 'copyToClipboard' put: 'Copy the currently selected bitmap to the clipboard.';
            at: 'fromClipboard' put: 'Paste the bitmap on the clipboard into the bitmap manager.';
            at: 'delete' put: 'Delete the currently selected bitmap from the bitmap manager.';
            at: 'duplicate' put: 'Create a copy of the currently selected bitmap.';
            at: 'rename' put: 'Change the name of the currently selected bitmap.';
            at: 'edit'  put: 'Launch the Digitalk bit editor on the currently selected bitmap.'
    ].

    ^HelpDict!
 
launchBitmapManager

    self new open!
   
screenIcon

    | dir |

    BMIcon isNil ifTrue: [
        (Smalltalk includesKey: #CPSrcDir) ifTrue: [
            dir := (Smalltalk at: #CPSrcDir).
        ] ifFalse: [
            dir := ''.
        ].
        BMIcon := Icon fromFile: dir, 'bitmgr.ico'.
    ].

    ^BMIcon!
 
toolBarTool

    ToolbarTool isNil ifTrue: [
        ToolbarTool :=  (Smalltalk at: #Tool) new fromBitmap: (CPBitmapDict sysAt: 'bitmapManagerToolbarBitmap').
        ToolbarTool
            selector: #launchBitmapManager;
            owner: CPBitmapManager;
            name: 'BitmapManager Tool';
            space: 1
    ].

    ^ToolbarTool! !



!CPBitmapManager methods !

addBitmap: b

    | name |

    b isNil ifFalse: [
        ((name := Prompter prompt: 'Name for new bitmap: ' default: '') notNil and: [ name isEmpty not ]) ifTrue: [
            bitmapDictionary at: name put: b.
            bitmapName := name.
            bitmapDictionary size = 1 ifTrue: [
                self updateMenus.
            ].
            self
                changed: #listContents:;
                changed: #graphContents:.
        ].
    ].!
 
bitmap

    ^bitmapDictionary at: bitmapName!
 
bitmapDictionary: dict

    bitmapDictionary := dict.
    bitmapDictionary isEmpty ifFalse: [
        bitmapName := dict keys asSortedCollection first.
    ].!

bitmapSelected: aPane

    bitmapName := aPane selectedItem.
    self changed: #graphContents:!
  
copyToClipboard

    bitmapName notNil ifTrue: [
        Clipboard setBitmap: self bitmap.
        (self menuWindow menuTitled: 'Edit')
            enableItem: #fromClipboard.
    ].!
   
copyToDefault

    bitmapName notNil ifTrue: [
        CPBitmapDict defaultBitmapDictionary at: bitmapName put: self bitmap cpCopy.
    ].!
 
create

    self addBitmap: CPCreateBitmap new open result!
   
createNewButton

    self addBitmap: CPCreateButton new open result.!
 
delete

    (MessageBox confirm: 'Delete bitmap: "', bitmapName, '"?') ifTrue: [
        bitmapDictionary removeKey: bitmapName.
        bitmapDictionary isEmpty ifTrue: [
            bitmapName := nil.
            self updateMenus.
        ] ifFalse: [
            bitmapName := bitmapDictionary keys asSortedCollection first.
        ].
        self
            changed: #listContents:;
            changed: #graphContents:.

        list setFocus.
    ].!
   
duplicate

    bitmapName notNil ifTrue: [
        self addBitmap: self bitmap cpCopy.
    ].!
  
edit

    bitmapName notNil & (Smalltalk includesKey: #BitEditor) ifTrue: [
        (Smalltalk at: #BitEditor) new openOn: self bitmap.
    ] ifFalse: [
        MessageBox message: 'The BitEditor class from the FreeDraw example must be installed to bit edit bitmaps.'
    ].!
   
edit: aPane

    self edit.!
  
editButton

    bitmapName notNil & (Smalltalk includesKey: #ButtonEditor) ifTrue: [
        (Smalltalk at: #ButtonEditor) new openOn: self bitmap.
    ] ifFalse: [
        MessageBox message: 'The file BUTTONED.ST must be installed to edit buttons.'
    ].!

exit

    self close!
 
fromClipboard

    | b |

    (b := Clipboard getBitmap) notNil ifTrue: [
        self addBitmap: b.
    ] ifFalse: [
        MessageBox message: 'The Windows Clipboard does not contain a bitmap.'
    ].!

fromFile

    | file bitmap icon stream extension |

    file := self getFile: 'Load Bitmap From:'
        fileSpec: '*.bmp'
        type: #file.

    file isNil ifTrue: [
        ^self
    ].

    stream := ReadStream on: file.
    stream upTo: $..
    extension := stream nextLine.
    extension = 'ICO' ifTrue: [
        icon := Icon fromFile: file.
        bitmap := Bitmap screenWidth: 32 height: 32.
        icon displayWith: bitmap pen.
    ] ifFalse: [
        bitmap := Bitmap fromFile: file.
    ].

    self addBitmap: bitmap!

fromScreen

    | bitmap button extent inset |
    bitmap := Bitmap fromUser.
    Notifier isAltDown ifFalse: [
        self addBitmap: bitmap
    ] ifTrue: [
        "Place the bitmap into the currently selected button bitmap"
        inset := 1.
        button := self bitmap.
        extent := ((button width // 2) - 5 - (inset * 2)) @ (button height - 5 - (inset * 2)).
        bitmap extent < extent ifTrue: [
            Notifier isCtrlDown ifFalse: [
                button pen
                    copyBitmap: bitmap
                    from: bitmap boundingBox
                    to: (((2@2 + inset) + ((extent - bitmap extent) // 2))extent: bitmap extent)
                    rule: Srccopy.
            ].
            button pen
                copyBitmap: bitmap
                from: bitmap boundingBox
                to: (((button width // 2 + 4 + inset)@(4 + inset) + ((extent - bitmap extent) // 2))extent: bitmap extent)
                rule: Srccopy.
        ] ifFalse: [
            Notifier isCtrlDown ifFalse: [
                button pen
                    copyBitmap: bitmap
                    from: bitmap boundingBox
                    to: ((2@2 + inset) extent: extent)
                    rule: Srccopy.
            ].
            button pen
                copyBitmap: bitmap
                from: bitmap boundingBox
                to: ((button width // 2 + 4 + inset)@(4 + inset) extent: extent)
                rule: Srccopy.
        ].
        self changed: #graphContents:.
    ].!

getFile: title fileSpec: fileSpec type: type

    | d |

    (Smalltalk version = '1.1') ifFalse: [
        d := FileDialog new
            title: title;
            fileSpec: fileSpec;
            hideReadonly.
        type == #library ifTrue: [
            d
                addFilter: '*.bdt' description: 'Bitmap dictionaries (*.BDT)';
                defFilter: '*.bdt'
        ] ifFalse: [
            d
                addFilter: '*.bmp' description: 'Bitmap file (*.BMP)';
                addFilter: '*.ico' description: 'Icon file (*.ICO)';
                defFilter: '*.bmp'.
        ].
        ^d
            open;
            file
    ] ifTrue: [
        ^(FileDialog new
            openTitle: title
            fileSpec: fileSpec
            showFileInButton: false) file
    ].!

graphContents: aPane

    | b o |

    aPane pen erase.
    bitmapName notNil ifTrue: [
        b := self bitmap.
        b displayAt: (o := aPane extent - b extent // 2) with: aPane pen.
    ].!
 
listContents: aPane

    | keys |

    bitmapDictionary isEmpty ifTrue: [
        keys := #().
    ] ifFalse: [
        keys := bitmapDictionary keys asSortedCollection.
    ].

    aPane
        contents: keys;
        selection: bitmapName!
  
load

    | file aDict add |

    add := Notifier isAltDown.

    file := self getFile: 'Load Bitmaps From:'
        fileSpec: '*.bdt'
        type: #library.

    file notNil ifTrue: [
        CursorManager execute change.
        (aDict := CPBitmapDict fromFile: file) notNil ifTrue: [
            (bitmapDictionary == CPBitmapDict defaultBitmapDictionary) ifTrue: [
                add ifTrue: [
                    aDict associationsDo: [ :assoc | CPBitmapDict defaultBitmapDictionary add: assoc ].
                    aDict := CPBitmapDict defaultBitmapDictionary.
                ] ifFalse: [
                    CPBitmapDict defaultBitmapDictionary: aDict
                ].
            ] ifFalse: [ (bitmapDictionary == CPBitmapDict systemBitmapDictionary) ifTrue: [
                add ifTrue: [
                    aDict associationsDo: [ :assoc | CPBitmapDict systemBitmapDictionary add: assoc ].
                    aDict := CPBitmapDict systemBitmapDictionary.
                ] ifFalse: [
                    CPBitmapDict systemBitmapDictionary: aDict
                ].
            ]].
            self bitmapDictionary: aDict.

            self
                changed: #listContents:;
                changed: #graphContents:.
        ].
        CursorManager normal change.
    ].!
  
loadBitmapDictionaryFrom: fileName

    | file aDict |

    file := File pathName: fileName.
    file nextLine = 'BITMAPS' ifFalse: [
        file close.
        ^MessageBox message: 'This file is not a valid bitmap dictionary.'
    ] ifTrue: [
        aDict := Dictionary new.
        [ file atEnd ] whileFalse: [
            aDict at: file nextLine put: (Bitmap fromStream: file).
            self bitmapDictionary: aDict.
        ].
    ].
    file close.!
  
open

    | system |

    bitmapDictionary isNil ifTrue: [
        self bitmapDictionary: ((system := Notifier isAltDown)
            ifTrue: [ CPBitmapDict systemBitmapDictionary ]
            ifFalse: [ CPBitmapDict defaultBitmapDictionary ])
    ].

    self
            owner: self;
            labelWithoutPrefix:  (system
                ifTrue: ['System Bitmap Manager']
                ifFalse: ['Bitmap Manager']);
            when: #activate perform: #updateKeys:;
            addSubpane: (
                GraphPane new
                    owner: self;
                    framingRatio: ((Rectangle leftTopUnit rightAndDown: (1/3 @ 0))
                        extentFromLeftTop: 2/3 @ 1);
                    style: GraphPane noScrollBarsFrameStyle;
                    when: #getContents perform: #graphContents:;
                    when: #button1DoubleClick perform: #edit:;
                    yourself
            );
            addSubpane: (
                list := ListBox new
                    owner: self;
                    framingRatio:
                        (Rectangle leftTopUnit
                            extentFromLeftTop: 1/3 @ 1);
                    when: #getContents perform: #listContents:;
                    when: #select perform: #bitmapSelected:;
                    when: #doubleClickSelect perform: #edit:;
                    yourself
            ).

    self menuWindow
        addMenu: (
            Menu new
                title: '&File';
                owner: self;
                appendItem: '&New...	Ctrl+N' selector: #create accelKey: $n accelBits: AfControl | AfChar;
                appendItem: 'New Button...' selector: #createNewButton;
                appendItem: 'From &Screen...' selector: #fromScreen;
                appendItem: 'From &File...' selector: #fromFile;
                appendItem: 'Save &To File...' selector: #saveToFile;
                appendSeparator;
                appendItem: '&Open Bitmap File...	Ctrl+O' selector: #load accelKey: $o accelBits: AfControl | AfChar;
                appendItem: 'Save Bitmaps &As...	Ctrl+S' selector: #save accelKey: $s accelBits: AfControl | AfChar;
                appendSeparator;
                appendItem: 'E&xit' selector: #exit
        );
        addMenu: (
            myEdit := Menu new
                title: '&Edit';
                owner: self;
                appendItem: '&Copy To Clipboard	Ctrl+C' selector: #copyToClipboard accelKey: $c accelBits: AfChar | AfControl;
                appendItem: '&Paste From &Clipboard...	Ctrl+V' selector: #fromClipboard accelKey: $v accelBits: AfChar | AfControl;
                appendItem: 'De&lete	Ctrl+Delete' selector: #delete accelKey: VkDelete accelBits:  AfVirtualkey | AfControl;
                appendItem: '&Duplicate' selector: #duplicate;
                appendItem: '&Rename...' selector: #rename;
                appendSeparator;
                appendItem: '&Bit Edit...	Ctrl+E' selector: #edit accelKey: $e accelBits: AfControl | AfChar;
                appendItem: '~Button Edit...	Ctrl+B' selector: #editButton accelKey: $b accelBits: AfControl | AfChar;
                appendItem: '~Resize Button...	Ctrl+R' selector: #resizeButton accelKey: $r accelBits: AfControl | AfChar
        ).
        system ifTrue: [
            myEdit
                appendSeparator;
                appendItem: 'Copy to Default Dictionary' selector: #copyToDefault
        ].

    self icon: self class screenIcon.

    self mainView noSmalltalkMenuBar.
    self openWindow.

    bitmapName notNil ifTrue: [
        list selection: bitmapName.
    ].!
   
openOn: dict

    self bitmapDictionary: dict.

    ^self open!
 
rename

    | b n |

    (n := Prompter prompt: 'Name for bitmap:' default: bitmapName) notNil ifTrue: [
        n notEmpty ifTrue: [
            b := bitmapDictionary at: bitmapName.
            bitmapDictionary
                removeKey: bitmapName;
                at: n put: b.
            bitmapName := n.
            self
                changed: #listContents:.
        ].
    ].!
   
resizeButton

    | extent current button changeList newSize |

    button := self bitmap.
    Notifier isAltDown ifTrue: [
        extent := button extent.
        changeList := bitmapDictionary select: [ :bitmap |
            bitmap extent = extent ].
    ] ifFalse: [
        changeList := bitmapDictionary select: [ :bitmap |
            bitmap == button ].
    ].
    extent := button width // 2 @ button height.
    newSize := Prompter prompt: 'Enter new button size:' default: extent asString.
    newSize isNil ifTrue: [ ^nil ].

    newSize := ((newSize upTo: $@) trimBlanks asInteger) @
        ((newSize reversed upTo: $@) reversed trimBlanks asInteger).

    changeList keysDo: [ :name |
        current := changeList at: name.
        button := Bitmap buttonWidth: newSize x height: newSize y.

        (newSize x < extent x or: [ newSize y < extent y or: [ Notifier isCtrlDown ]]) ifTrue: [
            button pen
                copyBitmap: current
                from: (2@2 extent: (extent - 5))
                to: (2@2 extent: (newSize - 5))
                rule: Srccopy.
            button pen
                copyBitmap: current
                from: ((current width // 2 + 4) @ 4 extent: (extent - 5))
                to: ((button width // 2 + 4) @ 4 extent: (newSize - 5))
                rule: Srccopy.
        ] ifFalse: [
           button pen
                copyBitmap: current
                from: (2@2 extent: (extent - 5))
                to: ((2@2 + ((newSize - extent) // 2)) extent: (extent - 5))
                rule: Srccopy.
            button pen
                copyBitmap: current
                from: ((current width // 2 + 4) @ 4 extent: (extent - 5))
                to: (((button width // 2 + 4) @ 4 + ((newSize - extent) // 2)) extent: (extent - 5))
                rule: Srccopy.
        ].
        bitmapDictionary at: name put: button.
    ].
    self changed: #graphContents:.!
  
save

    | file s dict keys |

    Notifier isAltDown ifTrue: [
        keys := (Smalltalk at: #WBMultiListChooser ifAbsent: [ ^nil ])
            fromList: bitmapDictionary keys asSortedCollection
            prompt: 'Select bitmaps to store:'.
        (keys isNil or: [ keys isEmpty ]) ifTrue: [ ^nil ].
        dict := bitmapDictionary associationsSelect: [ :bitmap |
            keys includes: bitmap key ].
    ] ifFalse: [
        dict := bitmapDictionary
    ].

    file := self getFile: 'Save Bitmaps To:'
        fileSpec: 'bitmaps.bdt'
        type: #library.

    file notNil ifTrue: [
        CursorManager execute change.
        dict saveOn: file.
        CursorManager normal change.
    ].!
 
saveToFile

    | file s |

    bitmapName isNil ifTrue: [ ^nil ].

    file := self getFile: 'Save Bitmap To:'
        fileSpec: '*.bmp'
        type: #file.

    file notNil ifTrue: [
        CursorManager execute change.
        self bitmap outputToFile: file.
        CursorManager normal change.
    ].!
  
statusPaneHelp:aKey
    "Answer the default dictionary used by
    the status bar for help support"

    ^self class helpDict at:aKey ifAbsent:[]!
  
updateKeys: aPane

    "On Window Activation."

    | keys |

    Clipboard getBitmap isNil ifTrue: [
        (self menuWindow menuTitled: 'Edit')
            disableItem: #fromClipboard.
    ] ifFalse: [
        (self menuWindow menuTitled: 'Edit')
            enableItem: #fromClipboard.
    ].

    list contents = (keys := bitmapDictionary keys asSortedCollection) ifFalse: [
        bitmapDictionary isEmpty ifTrue: [
            bitmapName := nil.
        ] ifFalse: [
            (keys includes: bitmapName) ifFalse: [
                bitmapName := keys first.
            ].
        ].
        self updateMenus.
        self changed: #listContents:.
    ].

    self changed: #graphContents:.!
 
updateMenus

    | sel |

    bitmapName isNil ifTrue: [
        sel := #disableItem:.
    ] ifFalse: [
        sel := #enableItem:.
    ].

    (self menuTitled: 'File') perform: sel with: #save.

    #(edit delete duplicate copyToClipboard) do: [:i |
        (self menuTitled: 'Edit') perform: sel with: i.
    ].! !



!WBFileSelectorEditor class methods !
   
titled: titleString filters: filterCollection descriptions: descCollection
    | new |
    new := super new.
    new
        title: titleString;
        filters: filterCollection;
        descriptions: descCollection.
    ^new! !



!WBFileSelectorEditor methods !
 
descriptions: aCollection

    descriptions := aCollection!
   
filters: aCollection

    filters := aCollection!
 
initialize

    title := 'Select File'.
    filters := OrderedCollection with: '*.*'.
    descriptions := OrderedCollection with: 'All Files (*.*)'.!
   
open

    | file contents |

    contents := thePane contents.
    ((contents includes: $*) not and: [ File exists: contents ])
        ifTrue: [ contents := (File splitPath: contents in: Disk) at: 3 ]
        ifFalse: [ contents := filters first ].
    fileDialog := FileDialog new.
    fileDialog
            title: title;
            fileSpec: contents;
            hideReadonly.
    1 to: filters size do: [ :i |
        fileDialog addFilter: (filters at: i) description: (descriptions at: i) ].

    fileDialog open.

    file := fileDialog file.
    file isNil
        ifFalse: [ thePane contents: file ].!

title: anObject

    title := anObject! !



!PStaticGraphic class methods ! !



!PStaticGraphic methods !
   
defaultSize

    ^32@32!
  
displayWith: aPen clipRect: r

    self displayGenericWith: aPen clipRect: r!
 
suggestedSize

    ^32@32!

usesFocus

    ^false!

usesMenu

    ^false! !



!PGroupBox class methods ! !



!PGroupBox methods ! !



!PGroupbox class methods ! !



!PGroupbox methods !
 
contents
    contents isNil ifTrue: [ contents := '' ].
    ^contents!

displayWith: aPen

    | top textRect bottom |

    top := rect top down: self font height // 2.
    bottom := rect bottom up: 1.
    aPen font: font.
    textRect := (rect leftTop rightAndDown: 7 @ 3) extent: (font wbStringWidth: self contents) @ self font height.

    aPen
        lineFrom: rect left @ top to: rect left @ bottom;
        lineFrom: (rect right left: 1) @ top to: (rect right left: 1) @ bottom;
        lineFrom: rect left @ bottom to: rect right @ bottom;
        lineFrom: rect left @ top to: (rect left right: 5) @ top;
        lineFrom: (rect left right: ((aPen stringWidthOf: self contents) + 12)) @ top to: rect right @ top.

    aPen
        foreColor: foreColor;
        backColor: self backColor;
        setTextAlign: TaTop;
        winDrawText: self contents at: textRect leftTop.!
 
mutationTypes

    ^#(GroupBox CP3DFrame StaticBox)!
  
staysToBack

    ^true!
   
staysWayBack

    ^true!
  
usesMenu

    ^false!
 
usesTitle

    ^true!
 
winClassStyle

    ^BsGroupbox! !



!WBTabEditor class methods !
 
isWBInternalClass

    ^true! !



!WBTabEditor methods !
 
addLayoutPane

    | scroller layout rect|

    scroller := WBScrollingPane new
        owner: self;
        paneName: 'scrollingPane';
        framingBlock: ( FramingParameters new initialExtent: 310 @ 120; lDU: 10 r: #left; rDU: 0 r: #right; tDU: 0 r: #top; bDU: 170 r: #bottom);
        yourself.

    self addSubpane: scroller.
    layout := self newLayoutPane.

    scroller addSubpane: layout.


    rect := self mainView framingBlock clientRect.
    scroller initSize: rect.
    scroller open.
    scroller buildWindow: self mainView.
    scroller resize: rect.
    layoutPane editedPane: editedPane subpanes: panes.
    scroller scrollIfNecessaryRedraw: false.
    scroller setScrollRanges.
    scroller  showWindow.
    layout  showWindow.!
  
addTabGroup: aPane

    self disableButtons.
    statusLine contents: 'Click and drag to select.'.
    layoutPane mode: #settingTabGroup.!
  
cancel: aPane

    result := nil.
    self close!

deletedGroup: ignore

    statusLine contents: ''.
    self enableButtons.!
  
disableButtons

    addGroupButton disable.
    removeGroupButton disable.!
  
enableButtons

    addGroupButton enable.
    removeGroupButton enable.!
 
initInstVars

    statusLine := (self paneNamed: 'statusLine').
    setTabbingButton := (self paneNamed: 'setTabbingButton').
    addGroupButton := (self paneNamed: 'addGroupButton').
    removeGroupButton := (self paneNamed: 'removeGroupButton').
    okButton := (self paneNamed: 'okButton').!

initWindow

    self initInstVars.
    self addLayoutPane.


    statusLine contents: ''.

    panes isEmpty ifTrue: [
        setTabbingButton disable.
        addGroupButton sendInputEvent: #setFocus.
    ] ifFalse: [
        setTabbingButton sendInputEvent: #setFocus.
    ].!

newLayoutPane

    ^layoutPane := WBTabOrderLayoutPane new
        owner: self owner;
        paneName: 'layoutPane';
        when: #gettingFocus perform: #resetFocus:;
        when: #setTabPosition perform: #tabPlaced:;
        when: #setGroup perform: #setGroup:;
        when: #deletedGroup perform: #deletedGroup:;
        framingBlock: [:b | (b leftTop rightAndDown: -2@-2) extentFromLeftTop: 10000@10000 ];
        yourself!

ok: aPane

    result := layoutPane exportedPanes.
    self close!
   
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'Tab Order Editor';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 1335 @ 800; xC; yC; cRDU: (11 @ 790 rightBottom: 1323 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 841 @ 48; lDU: 448 r: #left; rDU: 1289 r: #left; tDU: 62 r: #bottom; bDU: 14 r: #bottom);
                    paneName: 'statusLine';
                    startGroup;
                    contents: 'StaticText';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 414 @ 68; lDU: 18 r: #left; rDU: 432 r: #left; tDU: 158 r: #bottom; bDU: 90 r: #bottom);
                    paneName: 'setTabbingButton';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #setTabbingOrder:;
                    contents: '&Set tabbing order';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 414 @ 68; lDU: 448 r: #left; rDU: 862 r: #left; tDU: 158 r: #bottom; bDU: 90 r: #bottom);
                    paneName: 'addGroupButton';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #addTabGroup:;
                    contents: '&Add group';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 414 @ 68; lDU: 878 r: #left; rDU: 1291 r: #left; tDU: 158 r: #bottom; bDU: 90 r: #bottom);
                    paneName: 'removeGroupButton';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #removeTabGroup:;
                    contents: '&Remove group';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 201 @ 56; lDU: 18 r: #left; rDU: 219 r: #left; tDU: 70 r: #bottom; bDU: 14 r: #bottom);
                    paneName: 'okButton';
                    idOK;
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 201 @ 56; lDU: 229 r: #left; rDU: 430 r: #left; tDU: 70 r: #bottom; bDU: 14 r: #bottom);
                    idCancel;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: '&Cancel';
                    yourself
            );
        yourself
    ).

    self openWindow!
   
openOn: aPTopPane subpanes: aChildList

    editedPane := aPTopPane.
    panes :=  aChildList.

    ^self open.!
   
removeTabGroup: aPane

    self disableButtons.
    statusLine contents: 'Click to delete a group.'.
    layoutPane mode: #removeTabGroup!
  
resetFocus: ignore

    "Sent by the tab order layout pane;  it should never get the
      input focus, so we give it to someone else"

    setTabbingButton setFocus.!

result

    ^result!
  
setGroup: ignore

    self enableButtons.
    statusLine contents: ''.!
  
setTabbingOrder: aPane

    layoutPane isEditingTabs ifTrue: [
        statusLine contents: ''.
        self enableButtons.
        layoutPane stopEditingTabs.
        ^setTabbingButton contents: '&Set Tabbing Order'
    ].

    setTabbingButton contents: '&Done'.
    self disableButtons.
    statusLine contents: 'Click to set tab order.'.
    layoutPane setTabOrder.!
  
tabPlaced: ignore

    (layoutPane totalTabCount >  layoutPane tabCount) ifTrue: [
        statusLine contents:
            'Placed ',
            layoutPane tabCount asString,
            ' of ',
            layoutPane totalTabCount asString
    ] ifFalse: [
        statusLine contents: ''.
        (self paneNamed: 'setTabbingButton')
            contents: '&Set tabbing order'.
        self enableButtons.
        layoutPane stopEditingTabs.
    ].! !



!PFormattedEntryField class methods ! !



!PFormattedEntryField methods !
 
styles

    ^#( acceptAlpha acceptDate acceptDollar acceptFloat acceptInteger acceptPhoneNumber acceptPositiveInteger )! !



!WBFramingEditor class methods !

isWBInternalClass

    ^true! !



!WBFramingEditor methods !
 
cancel: ignore

    result := nil.
    self close!
   
cornerXAnchorChanged:  newAnchor

    (newAnchor selectedItem = 'Pane left') ifTrue: [
        originXAnchor disableItem: 'Pane right'.
    ] ifFalse: [
        originXAnchor enableItem: 'Pane right'.
    ].

    self setExampleRects.!
 
cornerXStyleChanged: styleRadio

    (styleRadio contents = 'Scaled') & (styleRadio selection) ifTrue: [
        cornerXAnchor selection: 'Window left'.
        cornerXAnchor disable.
        rightRelative disable.
    ] ifFalse: [
        rightRelative enable.
        cornerXAnchor enable.
    ].

    self setExampleRects.!
   
cornerYAnchorChanged:  newAnchor

    (newAnchor selectedItem = 'Pane top') ifTrue: [
        originYAnchor disableItem: 'Pane bottom'.
    ] ifFalse: [
        originYAnchor enableItem: 'Pane bottom'.
    ].

    self setExampleRects.!

cornerYStyleChanged: styleRadio


    (styleRadio contents = 'Scaled') & (styleRadio selection)  ifTrue: [
        cornerYAnchor selection: 'Window top'.
        cornerYAnchor disable.
        bottomRelative disable.
    ] ifFalse: [
        bottomRelative enable.
        cornerYAnchor enable.
    ].

    self setExampleRects.!
   
initializeExampleRects

    (parentRect width > parentRect height) ifTrue: [
        beforeScaleFactor :=  (beforeRect extent x * WBFramingParameters dialogUnit x) / parentRect width.
    ] ifFalse: [
        beforeScaleFactor := (beforeRect extent y * WBFramingParameters dialogUnit y) / parentRect height.
    ].

    beforeRect frameRect: (
        0@0 extent: (parentRect extent * beforeScaleFactor) rounded
    ).

    afterRect frameRect: (
        0@0 extent: (afterRect extent * WBFramingParameters dialogUnit) rounded
    ).

    largeParentRect := parentRect leftBottom extentFromLeftBottom: ((afterRect frameRect extent / beforeRect frameRect extent) * parentRect extent) rounded.!

initializeOnFramer:  aFramer rects: thePanesRects parentRect: theParentsRect

    framingParameters := aFramer.
    currentRectList := thePanesRects.
    parentRect := theParentsRect.
    hasFramed := false.


    "Initialize all uninitialized combo boxes"
    originXAnchor contents: #(
            'Window left'
            'Window right'
            'Window center'
            'Pane right'
    ); enable.
    originYAnchor contents: #(
            'Window top'
            'Window bottom'
            'Window center'
            'Pane bottom'
    ); enable.
    cornerXAnchor contents: #(
            'Window left'
            'Window right'
            'Window center'
            'Pane left'
    ); enable.
    cornerYAnchor contents: #(
            'Window top'
            'Window bottom'
            'Window center'
            'Pane top'
    ); enable.

    originXAnchor selectIndex: 1.
    originYAnchor selectIndex: 1.
    cornerXAnchor selectIndex: 1.

    cornerYAnchor selectIndex: 1.

    originXStyleFixed selection: false; enable.
    originXStyleScaled selection: false; enable.
    originYStyleFixed selection: false; enable.
    originYStyleScaled selection: false; enable.
    cornerXStyleFixed selection: false; enable.
    cornerXStyleScaled selection: false; enable.
    cornerYStyleFixed selection: false; enable.
    cornerYStyleScaled selection: false; enable.

    bottomRelative enable.
    topRelative enable.
    rightRelative enable.
    leftRelative enable.

    "For initialization only - the y coordinate needs to be configured
     to a legal value for setExampleRects to work"
    yCenteredCheckBox selection: true.

    framingParameters isNil ifTrue: [
        originXStyleFixed selection: true.
        originXAnchor selectItem: 'Window left'.
        originXAnchor disableItem: 'Pane right'.

        originYStyleFixed selection: true.
        originYAnchor selectItem: 'Window top'.
        originYAnchor disableItem: 'Pane bottom'.

        cornerXStyleFixed selection: true.
        cornerXAnchor selectItem: 'Pane left'.

        cornerYStyleFixed selection: true.
        cornerYAnchor selectItem: 'Pane top'.

        xCenteredCheckBox selection: false.
        yCenteredCheckBox selection: false.

    ] ifFalse: [

        framingParameters centerX  ifTrue: [
            xCenteredCheckBox selection: true.
            self xCenteredToggled: xCenteredCheckBox.
        ] ifFalse: [
            xCenteredCheckBox selection: false.

            framingParameters left isNil ifTrue: [
                originXStyleFixed selection: true.
                originXAnchor selectItem: 'Pane right'.
                cornerXAnchor disableItem: 'Pane left'.
            ] ifFalse: [

                framingParameters left isInteger ifFalse: [
                    originXStyleScaled selection: true.
                    self originXStyleChanged: originXStyleScaled.
                ] ifTrue: [
                    originXStyleFixed selection: true.
                    originXAnchor selectItem: 'Window ', framingParameters leftRel asCUAPresentableString.
                    self originXStyleChanged: originXStyleScaled.
                ].

            ].

            framingParameters right isNil ifTrue: [
                cornerXStyleFixed selection: true.
                cornerXAnchor selectItem: 'Pane left'.
                originXAnchor disableItem: 'Pane right'.
            ] ifFalse: [

                framingParameters right isInteger ifFalse: [
                    cornerXStyleScaled selection: true.
                    self cornerXStyleChanged: cornerXStyleScaled.
                ] ifTrue: [
                    cornerXStyleFixed selection: true.
                    cornerXAnchor selectItem: 'Window ', framingParameters rightRel asCUAPresentableString.
                    self cornerXStyleChanged: cornerXStyleFixed.
                ].
            ].
        ].

        framingParameters centerY ifTrue: [
            yCenteredCheckBox selection: true.
            self yCenteredToggled: yCenteredCheckBox.
        ] ifFalse: [
            yCenteredCheckBox selection: false.

            framingParameters top isNil ifTrue: [
                originYStyleFixed selection: true.
                originYAnchor selectItem: 'Pane bottom'.

                cornerYAnchor disableItem: 'Pane top'.
            ] ifFalse: [

                framingParameters top isInteger ifFalse: [
                    originYStyleScaled selection: true.
                    self originYStyleChanged: originYStyleScaled.
                ] ifTrue: [
                    originYStyleFixed selection: true.
                    originYAnchor selectItem: 'Window ', framingParameters topRel asCUAPresentableString.
                    self originYStyleChanged: originYStyleFixed.
                ].
            ].

            framingParameters bottom isNil ifTrue: [
                cornerYStyleFixed selection: true.
                cornerYAnchor selectItem: 'Pane top'.
                originYAnchor disableItem: 'Pane bottom'.
            ] ifFalse: [

                framingParameters bottom isInteger ifFalse: [
                    cornerYStyleScaled selection: true.
                    self cornerYStyleChanged: cornerYStyleScaled.
                ] ifTrue: [
                    cornerYStyleFixed selection: true.

                    cornerYAnchor selectItem: 'Window ',framingParameters bottomRel asCUAPresentableString.
                    self cornerYStyleChanged: cornerYStyleFixed.
                ].
            ].
        ].
    ].

    hasFramed := true.

    self initializeExampleRects.
    self setExampleRects.!
   
initInstVars

    xCenteredCheckBox := (self paneNamed: 'xCenteredCheckBox').
    yCenteredCheckBox := (self paneNamed: 'yCenteredCheckBox').
    originXStyleFixed := (self paneNamed: 'originXStyleFixed').
    originXStyleScaled := (self paneNamed: 'originXStyleScaled').
    originXAnchor := (self paneNamed: 'originXAnchor').
    cornerXStyleFixed := (self paneNamed: 'cornerXStyleFixed').
    cornerXStyleScaled := (self paneNamed: 'cornerXStyleScaled').
    cornerXAnchor := (self paneNamed: 'cornerXAnchor').
    originYStyleFixed := (self paneNamed: 'originYStyleFixed').
    originYStyleScaled := (self paneNamed: 'originYStyleScaled').
    originYAnchor := (self paneNamed: 'originYAnchor').
    cornerYStyleFixed := (self paneNamed: 'cornerYStyleFixed').
    cornerYStyleScaled := (self paneNamed: 'cornerYStyleScaled').
    cornerYAnchor := (self paneNamed: 'cornerYAnchor').
    afterRect := (self paneNamed: 'afterRect').
    beforeRect := (self paneNamed: 'beforeRect').
    bottomRelative := (self paneNamed: 'bottomRelative').
    rightRelative := (self paneNamed: 'rightRelative').
    leftRelative := (self paneNamed: 'leftRelative').
    topRelative := (self paneNamed: 'topRelative').!
   
initWindow

    self initInstVars.

    self initializeOnFramer: framingParameters
            rects:               currentRectList
            parentRect:     parentRect.

    afterRect bringToTop.!
 
isWBWindow

    ^true!

newFramerForRect: aRect parentRect: parentsRect

    | anchor coord framer |

    framer := FramingParameters new.
    framer initialExtent: framingParameters initialExtent.

    (xCenteredCheckBox selection) ifTrue: [
        framer xCentered.
    ] ifFalse: [

        anchor := originXAnchor selectedItem.
        coord := aRect left.

        (originXStyleFixed selection) & (anchor ~= 'Pane right') ifTrue: [
            (anchor = 'Window right') ifTrue: [
                coord := parentsRect width - coord.
                framer left: coord relativeTo: #right.
            ] ifFalse: [ (anchor = 'Window center') ifTrue: [
                coord := coord - (parentsRect width // 2).
                framer left: coord relativeTo: #center.
            ] ifFalse: [
                framer left: coord relativeTo: #left.
            ]].
        ].

        (originXStyleScaled selection) ifTrue: [
            coord := coord/parentsRect extent x.
            framer leftProportional: coord.
        ].
        anchor := cornerXAnchor selectedItem.
        coord := aRect right.

        (cornerXStyleFixed selection) & (anchor ~=  'Pane left') ifTrue: [
            (anchor = 'Window right') ifTrue: [
                coord := parentsRect width - coord.
                framer right: coord relativeTo: #right.
            ] ifFalse: [ (anchor = 'Window center') ifTrue: [
                coord := coord - (parentsRect width // 2).
                framer right: coord relativeTo: #center.
            ] ifFalse: [
                framer right: coord relativeTo: #left.
            ]].
        ].

        (cornerXStyleScaled selection) ifTrue: [
            coord := coord/parentsRect extent x.
            framer rightProportional: coord.
        ].
    ].

    (yCenteredCheckBox selection) ifTrue: [
        framer yCentered.
    ] ifFalse: [

        anchor := originYAnchor selectedItem.
        coord := aRect top.

        (originYStyleFixed selection) & (anchor ~= 'Pane bottom') ifTrue: [
            (anchor = 'Window top') ifTrue: [
                framer top: coord relativeTo: #top.
            ] ifFalse: [ (anchor = 'Window center') ifTrue: [
                framer top: coord - (parentsRect height // 2) relativeTo: #center.
            ] ifFalse: [
                framer top: parentsRect height - coord relativeTo: #bottom.
            ]].
        ].

        (originYStyleScaled selection) ifTrue: [
            coord := coord/parentsRect extent y.
            framer topProportional: coord.
        ].

        anchor := cornerYAnchor selectedItem.
        coord := aRect bottom.

        (cornerYStyleFixed selection) & (anchor ~= 'Pane top') ifTrue: [
            (anchor = 'Window top') ifTrue: [
                framer bottom: coord relativeTo: #top.
            ] ifFalse: [ (anchor = 'Window center') ifTrue: [
                framer bottom: coord - (parentsRect height // 2) relativeTo: #center.
            ] ifFalse: [
                framer bottom: parentsRect height - coord relativeTo: #bottom.
            ]].
        ].

        (cornerYStyleScaled selection) ifTrue: [
            coord := coord/parentsRect extent y.
            framer bottomProportional: coord.
        ].
    ].

    framer left isNil & framer right isNil ifTrue: [
        framer left: aRect left relativeTo: #left.
    ].
    framer top isNil & framer bottom isNil ifTrue: [
        framer bottom: aRect bottom relativeTo: #bottom.
    ].

    ^framer!
   
ok: ignored

    result := currentRectList collect: [ :r|
        framingParameters initialExtent: r extent.
        self newFramerForRect: r parentRect: parentRect.
    ].
    self close!
  
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'Set Framing Parameters';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 1298 @ 712; xC; yC; cRDU: (11 @ 702 rightBottom: 1287 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 878 @ 104; lDU: 18 r: #left; rDU: 896 r: #left; tDU: 16 r: #top; bDU: 120 r: #top);
                    startGroup;
                    contents: 'Centering';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 267 @ 32; lDU: 923 r: #left; rDU: 1191 r: #left; tDU: 296 r: #top; bDU: 328 r: #top);
                    paneName: 'pane1';
                    startGroup;
                    contents: 'After resizing:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 137 @ 32; lDU: 18 r: #left; rDU: 155 r: #left; tDU: 496 r: #top; bDU: 528 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Bottom:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 304 @ 32; lDU: 923 r: #left; rDU: 1227 r: #left; tDU: 16 r: #top; bDU: 48 r: #top);
                    paneName: 'pane2';
                    startGroup;
                    contents: 'Before resizing:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 110 @ 32; lDU: 46 r: #left; rDU: 155 r: #left; tDU: 256 r: #top; bDU: 288 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Right:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 192 @ 32; lDU: 347 r: #left; rDU: 539 r: #left; tDU: 384 r: #top; bDU: 416 r: #top);
                    paneName: 'topRelative';
                    rightJustified;
                    startGroup;
                    contents: 'relative to:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 192 @ 32; lDU: 347 r: #left; rDU: 539 r: #left; tDU: 256 r: #top; bDU: 288 r: #top);
                    paneName: 'rightRelative';
                    rightJustified;
                    startGroup;
                    contents: 'relative to:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 192 @ 32; lDU: 347 r: #left; rDU: 539 r: #left; tDU: 152 r: #top; bDU: 184 r: #top);
                    paneName: 'leftRelative';
                    rightJustified;
                    startGroup;
                    contents: 'relative to:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 82 @ 32; lDU: 73 r: #left; rDU: 155 r: #left; tDU: 384 r: #top; bDU: 416 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Top:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 82 @ 32; lDU: 73 r: #left; rDU: 155 r: #left; tDU: 152 r: #top; bDU: 184 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Left:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 192 @ 32; lDU: 347 r: #left; rDU: 539 r: #left; tDU: 496 r: #top; bDU: 528 r: #top);
                    paneName: 'bottomRelative';
                    rightJustified;
                    startGroup;
                    contents: 'relative to:';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 389 @ 40; lDU: 46 r: #left; rDU: 434 r: #left; tDU: 56 r: #top; bDU: 96 r: #top);
                    paneName: 'xCenteredCheckBox';
                    startGroup;
                    tabStop;
                    contents: 'Center &horizontally';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 341 @ 40; lDU: 503 r: #left; rDU: 843 r: #left; tDU: 56 r: #top; bDU: 96 r: #top);
                    paneName: 'yCenteredCheckBox';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #yCenteredToggled:;
                    contents: 'Center &vertically';
                    yourself
            );
            addSubpane: (
                RadioButton new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 146 @ 40; lDU: 174 r: #left; rDU: 320 r: #left; tDU: 144 r: #top; bDU: 184 r: #top);
                    paneName: 'originXStyleFixed';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #originXStyleChanged:;
                    contents: 'Fixed';
                    yourself
            );
            addSubpane: (
                RadioButton new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 174 @ 40; lDU: 174 r: #left; rDU: 347 r: #left; tDU: 184 r: #top; bDU: 224 r: #top);
                    paneName: 'originXStyleScaled';
                    when: #clicked perform: #originXStyleChanged:;
                    contents: 'Scaled';
                    yourself
            );
            addSubpane: (
                WBFramerExample new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 336 @ 200; lDU: 923 r: #left; rDU: 1259 r: #left; tDU: 336 r: #top; bDU: 536 r: #top);
                    paneName: 'afterRect';
                    yourself
            );
            addSubpane: (
                WBFramerExample new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 251 @ 196; lDU: 923 r: #left; rDU: 1175 r: #left; tDU: 52 r: #top; bDU: 248 r: #top);
                    paneName: 'beforeRect';
                    yourself
            );
            addSubpane: (
                WBComboBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 352 @ 190; lDU: 549 r: #left; rDU: 901 r: #left; tDU: 144 r: #top; bDU: 334 r: #top);
                    paneName: 'originXAnchor';
                    dropDownList;
                    startGroup;
                    tabStop;
                    when: #select perform: #originXAnchorChanged:;
                    yourself
            );
            addSubpane: (
                RadioButton new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 149 @ 40; lDU: 174 r: #left; rDU: 322 r: #left; tDU: 248 r: #top; bDU: 288 r: #top);
                    paneName: 'cornerXStyleFixed';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cornerXStyleChanged:;
                    contents: 'Fixed';
                    yourself
            );
            addSubpane: (
                RadioButton new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 174 @ 40; lDU: 174 r: #left; rDU: 347 r: #left; tDU: 288 r: #top; bDU: 328 r: #top);
                    paneName: 'cornerXStyleScaled';
                    when: #clicked perform: #cornerXStyleChanged:;
                    contents: 'Scaled';
                    yourself
            );
            addSubpane: (
                WBComboBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 352 @ 190; lDU: 553 r: #left; rDU: 905 r: #left; tDU: 252 r: #top; bDU: 442 r: #top);
                    paneName: 'cornerXAnchor';
                    dropDownList;
                    startGroup;
                    tabStop;
                    when: #select perform: #cornerXAnchorChanged:;
                    yourself
            );
            addSubpane: (
                RadioButton new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 149 @ 40; lDU: 174 r: #left; rDU: 322 r: #left; tDU: 376 r: #top; bDU: 416 r: #top);
                    paneName: 'originYStyleFixed';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #originYStyleChanged:;
                    contents: 'Fixed';
                    yourself
            );
            addSubpane: (
                RadioButton new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 174 @ 40; lDU: 174 r: #left; rDU: 347 r: #left; tDU: 416 r: #top; bDU: 456 r: #top);
                    paneName: 'originYStyleScaled';
                    when: #clicked perform: #originYStyleChanged:;
                    contents: 'Scaled';
                    yourself
            );
            addSubpane: (
                WBComboBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 352 @ 190; lDU: 549 r: #left; rDU: 901 r: #left; tDU: 376 r: #top; bDU: 566 r: #top);
                    paneName: 'originYAnchor';
                    dropDownList;
                    startGroup;
                    tabStop;
                    when: #select perform: #originYAnchorChanged:;
                    yourself
            );
            addSubpane: (
                RadioButton new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 149 @ 40; lDU: 174 r: #left; rDU: 322 r: #left; tDU: 488 r: #top; bDU: 528 r: #top);
                    paneName: 'cornerYStyleFixed';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cornerYStyleChanged:;
                    contents: 'Fixed';
                    yourself
            );
            addSubpane: (
                RadioButton new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 174 @ 40; lDU: 174 r: #left; rDU: 347 r: #left; tDU: 528 r: #top; bDU: 568 r: #top);
                    paneName: 'cornerYStyleScaled';
                    when: #clicked perform: #cornerYStyleChanged:;
                    contents: 'Scaled';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 158 @ 52; lDU: 27 r: #left; rDU: 185 r: #left; tDU: 592 r: #top; bDU: 644 r: #top);
                    idOK;
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 158 @ 52; lDU: 201 r: #left; rDU: 359 r: #left; tDU: 592 r: #top; bDU: 644 r: #top);
                    idCancel;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: '&Cancel';
                    yourself
            );
            addSubpane: (
                WBComboBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 352 @ 190; lDU: 549 r: #left; rDU: 901 r: #left; tDU: 488 r: #top; bDU: 678 r: #top);
                    paneName: 'cornerYAnchor';
                    dropDownList;
                    startGroup;
                    tabStop;
                    when: #select perform: #cornerYAnchorChanged:;
                    yourself
            );
        yourself
    ).

    self openWindow!
   
openOnFramer: framer rects: rectList parentRect: aParentRect

    framingParameters := framer.
    currentRectList := rectList.
    parentRect := aParentRect.

    ^self open.!
  
originXAnchorChanged:  newAnchor

    (newAnchor selectedItem = 'Pane right') ifTrue: [
        cornerXAnchor disableItem: 'Pane left'.
    ] ifFalse: [
        cornerXAnchor enableItem: 'Pane left'.
    ].

    self setExampleRects.!
  
originXStyleChanged: styleRadio

    (styleRadio contents = 'Scaled') & (styleRadio selection)  ifTrue: [
        originXAnchor selection: 'Window left'.
        originXAnchor disable.
        leftRelative disable.
    ] ifFalse: [
        leftRelative enable.
        originXAnchor enable.
    ].

    self setExampleRects.!

originYAnchorChanged:  newAnchor

    (newAnchor selectedItem = 'Pane bottom') ifTrue: [
        cornerYAnchor disableItem: 'Pane top'.
    ] ifFalse: [
        cornerYAnchor enableItem: 'Pane top'.
    ].

    self setExampleRects.!
   
originYStyleChanged: styleRadio

    (styleRadio contents = 'Scaled') & (styleRadio selection)  ifTrue: [
        originYAnchor selection: 'Window top'.
        originYAnchor disable.
        topRelative disable.
    ] ifFalse: [
        topRelative enable.
        originYAnchor enable.
    ].

    self setExampleRects.!
   
result

    ^result!
  
setExampleRects

    | pRect framer  |

    hasFramed ifFalse: [ ^self ].

    framer :=self newFramerForRect: currentRectList first parentRect: parentRect.

    pRect := framer value: parentRect.
    pRect := ((parentRect offsetFromLeftTop: pRect) * beforeScaleFactor) rounded + (1@1) extentFromLeftTop:  (pRect extent * beforeScaleFactor) rounded.

    beforeRect paneRect: pRect.

    pRect := framer value: largeParentRect.
    pRect := ((largeParentRect offsetFromLeftTop: pRect) * beforeScaleFactor) rounded + (1@1) extentFromLeftTop:  (pRect extent * beforeScaleFactor) rounded.

    afterRect paneRect: pRect.!
  
xCenteredToggled: centerCheckBox

    | isCentered |



    isCentered := centerCheckBox selection.

    isCentered  ifTrue: [

        originXStyleFixed selection: true.
        originXStyleScaled selection: false.
        cornerXStyleFixed selection: true.
        cornerXStyleScaled selection: false.

        originXAnchor selection: 'Window left'.
        cornerXAnchor selection: 'Window left'.

        originXStyleFixed disable.
        originXStyleScaled disable.
        cornerXStyleFixed disable.
        cornerXStyleScaled disable.
        originXAnchor disable.
        cornerXAnchor disable.
        leftRelative disable.
        rightRelative disable.
    ] ifFalse: [
        originXStyleFixed enable.
        originXStyleScaled enable.
        cornerXStyleFixed enable.
        cornerXStyleScaled enable.
        originXAnchor enable.
        cornerXAnchor enable.
        leftRelative enable.
        rightRelative enable.
    ].

    self setExampleRects.!

yCenteredToggled: centerCheckBox

    | isCentered |

    isCentered := centerCheckBox selection.

    isCentered  ifTrue: [

        originYStyleFixed selection: true.
        originYStyleScaled selection: false.
        cornerYStyleFixed selection: true.
        cornerYStyleScaled selection: false.

        originYAnchor selection: 'Window top'.
        cornerYAnchor selection: 'Window top'.

        originYStyleFixed disable.
        originYStyleScaled disable.
        cornerYStyleFixed disable.
        cornerYStyleScaled disable.
        originYAnchor disable.
        cornerYAnchor disable.
        topRelative disable.
        bottomRelative disable.
    ] ifFalse: [
        originYStyleFixed enable.
        originYStyleScaled enable.
        cornerYStyleFixed enable.
        cornerYStyleScaled enable.
        originYAnchor enable.
        cornerYAnchor enable.
        topRelative enable.
        bottomRelative enable.
    ].

    self setExampleRects.! !



!WBChoosePaneDialog class methods ! !



!WBChoosePaneDialog methods !
  
abstractPaneList
    ^#(
        ControlPane
        Toggle
        CPChildEntryField
        StaticPane
        CPSubPane
        CPScrollingPane
        CPSpinEditor
        CPValuator
        CPGuage
        CPSlider
        ).!
 
classList: listOfClasses

    self abstractPaneList do: [ :cn |
        (Smalltalk includesKey: cn) ifTrue: [
            listOfClasses remove: (Smalltalk at: cn) ifAbsent: [ nil ]
        ].
    ].
    (listOfClasses includes: ScrollBar) ifTrue: [
        listOfClasses
            remove: ScrollBar;
            add: WBHorizontalScrollBar;
            add: WBVerticalScrollBar.
    ].
    ^self classList: listOfClasses default: listOfClasses first!

initWindow

    classListBox := self paneNamed: 'classListBox'.

    classListBox
            contents: (classList collect: [ :aClass |
                aClass name
            ]) asSortedCollection asOrderedCollection;
            selection: 1.!
   
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'Choose a class:';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 622 @ 520; xC; yC; cRDU: (11 @ 510 rightBottom: 610 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                ListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 567 @ 368; lDU: 18 r: #left; rDU: 585 r: #left; tDU: 16 r: #top; bDU: 384 r: #top);
                    paneName: 'classListBox';
                    startGroup;
                    tabStop;
                    when: #doubleClickSelect perform: #selectedClass:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 146 @ 56; lDU: 18 r: #left; rDU: 165 r: #left; tDU: 392 r: #top; bDU: 448 r: #top);
                    idOK;
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 146 @ 56; lDU: 183 r: #left; rDU: 329 r: #left; tDU: 392 r: #top; bDU: 448 r: #top);
                    idCancel;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: '&Cancel';
                    yourself
            );
        yourself
    ).

    self openWindow!
   
preInitWindow

    | cancel |

    (cancel := self paneNamed: 'cancel') notNil ifTrue: [
        cancel idCancel.
    ].

    self labelWithoutPrefix: 'Choose a subpane type:'.! !



!PWBInvisibleGroupPane class methods !
   
defaultRealClassName

    "Never really used;  just a placeholder."

    ^'Object'! !



!PWBInvisibleGroupPane methods !
   
displayWith: aPen

    aPen
        drawFocusRect: self rect.!
   
isGrouper

    ^true! !



!CPCreateButton class methods ! !



!CPCreateButton methods !
 
initWindow

    super initWindow.
    self mainView labelWithoutPrefix:  'Create Button'.
    mono disable.
    width contents: '25'.
    height contents: '22'.!
 
ok: aPane

    | w h |

    w := width contents asInteger.
    h := height contents asInteger.
    b := Bitmap buttonWidth: w height: h.

    self close.! !



!WBGroupBox class methods !
 
isWBInternalClass

    ^true! !



!WBGroupBox methods ! !



!WBTopPane class methods ! !



!WBTopPane methods !

statusPane

    ^self owner realStatusPane!
   
wmMouseactivate: wParam with: lParam
        "Private - If mouse has been clicked on an inactive
         window, select it."
    self mainWindow mdiSelected: true.
    ^MaActivate! !



!WBFramingParameters class methods ! !



!WBFramingParameters methods ! !



!PRadioButtonGroup class methods ! !



!PRadioButtonGroup methods !
   
addSubpanes
    | extent numRows index rb fontHeight inset inner |
    fontHeight := (SysFont height + 6) / (SysFont height / 32).
    self children: nil.
    self children add: (
        PGroupBox new
            framingBlock: ( FramingParameters new iDUE: self rect extent; lP: 0; rP: 1; tP: 0; bP: 1);
            paneName: 'group';
            contents: self label;
            realClass: GroupBox;
            yourself).
    inset := 8 @ fontHeight.
    inner := self rect extent - inset.
    numRows := ((self contents size +  self numColumns - 1) // self numColumns) max: 1.
    extent := (inner x // numColumns) @ fontHeight.
    1 to: self numColumns do: [ :column |
        1 to: numRows do: [ :row |
            index := (column - 1) * numRows + row.
            index > self contents size ifFalse: [
                self children add: (
                   rb := self buttonPClass new
                        framingBlock: ( FramingParameters new
                            iDUE: extent;
                            lP: ((column - 1) / self numColumns) * 0.9 + (((self numColumns - column + 1) / self numColumns) * 0.1);
                            rP: (column / self numColumns) * 0.9 + (((self numColumns - column) / self numColumns) * 0.1);
                            tDU: inset y + ((row - 1) * extent y) r: #top;
                            bDU: inset y + (row * extent y) r: #top);
                        when: #clicked perform: #setRadio:;
                        contents: (self contents at: index);
                        paneName: (self contents at: index);
                        realClass: self buttonClass;
                        yourself).
           ].
        ].
    ].
    self foreColor: self foreColor.
    self backColor: self realBackColor.!
 
attributeEditor

    ^WBListEditor new!
   
backColor: aColor

    super backColor: aColor.
    aColor = self defaultForeColor ifTrue: [
        self children do: [ :child | child foreColor: child defaultForeColor ]
    ] ifFalse: [
        self children do: [ :child | child backColor: aColor ]
    ].!
  
buttonClass

    ^RadioButton!

buttonPClass

    ^PRadioButton!
  
children

    ^children ifNil: [ children := OrderedCollection new ].!

children: aCollection

    children := aCollection!
   
contents: aCollection

    super contents: aCollection.

    numColumns isNil ifTrue: [ ^nil ].
    self addSubpanes.!
 
copySpecificsTo: aPane

    aPane
        label: self label;
        contents: self contents.!
  
defaultFont

    ^PWindowBuilder wbDefaultFont!
   
displayWith: aPen clipRect: inRect
    | region r clipRect |
    r := inRect.
    aPen fill: self rect color: self backColor.

    self style == #verticalScrollBar ifTrue: [
        self displayWithLeftScrollBar: aPen.
        r := inRect insetBy: 1.
        r := Rectangle
            leftTop: r leftTop
            extent: ((r extent x - self scrollBarWidth + 1)@(r extent y)).
        r := r intersect: inRect.
    ].

    self children do: [ :child |
        child reframe: self rect.
        region := aPen setClipRect: (clipRect := r intersect: child rect).
        child displayWith: aPen clipRect: clipRect.
        aPen destroyRegion: region.
    ].!
  
foreColor: aColor

    super foreColor: aColor.
    aColor = self defaultForeColor ifTrue: [
        self children do: [ :child | child foreColor: child defaultForeColor ]
    ] ifFalse: [
        self children do: [ :child | child foreColor: aColor ]
    ].!
  
initialize

    super initialize.
    self
        numColumns: 1.!
  
isComposite

    ^true!
   
label

    ^label ifNil: [ label := 'RadioButtonGroup' ]!
 
label: aString

    label := aString.

    self children isEmpty ifFalse: [
        self children first contents: aString
    ]!
  
mutateSpecificsFrom: aPane
    | list |
    ((list := aPane contents) notNil and: [ list isArray ]) ifTrue: [
        self contents: list deepCopy
    ].
    (aPane respondsTo: #label) ifTrue: [
        self label: aPane label
    ].!
   
mutationExceptions

    ^#(CPScrollingPane)!
  
mutationTypes

    ^#(ListBox CPScrollingPane RadioButtonGroup EntryFieldGroup)!
  
numColumns

    ^numColumns ifNil: [ numColumns := 1 ]!
   
numColumns: anInteger

    numColumns := anInteger.

    style := anInteger asString, ' Column'.

    numColumns isNil ifTrue: [ ^nil ].
    self addSubpanes.!
  
readSpecificsFrom: c

    self
        label: c label;
        numColumns: c numColumns;
        contents: c contents.!

reframe: parentRect

    super reframe: parentRect.

    self addSubpanes.!
 
setStyleFrom: aRealStyle!
   
storeContentsOn: aStream indentString: spaceString!
 
storeSpecificsOn: aStream indentString: indentString
    "Write out the list"
    self label isEmpty ifFalse: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'label: ',self label asQuotedString
    ].
    self numColumns > 1 ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'numColumns: ',self numColumns asString
    ].
    self contents isNil ifFalse: [
        (self contents isArray and: [ self contents notEmpty ]) ifTrue: [
            aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'contents: #( '.
                self contents do:[ :item | aStream nextPutAll: item asQuotedString,' ' ].
                aStream nextPutAll: ')'
        ]
    ].!

storeStyleOn: aStream indentString: spaceString!

style: s

    super style: s.
    self numColumns: s first asString asInteger.!
  
styles

    ^(1 to: 9) collect: [ :int | int asString,' Column' ].!
   
suggestedSize

    ^150@100!
  
text

    ^self label!

text: aString

    ^self label: aString!
  
usesFont

     ^false!

usesMenu

     ^false!

usesTitle

    ^true! !



!WBActionEditor class methods ! !



!WBActionEditor methods !
 
add: aPane

    | methodString answer methodPane |
    methodPane := self paneNamed: 'method'.
    methodPane evaluate: false.
    author := (self paneNamed: 'author') contents.
    action := (self paneNamed: 'name') contents.
    methodString := WriteStream on: String new.
    aPane contents = '&Add' ifTrue: [
        methodString
            nextPutAll: 'action',action;
            cr; nextPut: $";
            cr; nextPutAll: 'Created by ',author,' - ',Date today asString;
            cr; nextPut: $"; cr.
        methodPane offset: methodString position.
        methodString nextPutAll: methodPane contents.
    ] ifFalse: [
        methodString
            nextPutAll: 'action',action;
            cr; nextPut: $";
            nextPutAll: history;
            nextPutAll: 'Modified by ',author,' - ',Date today asString;
            cr; nextPut: $"; cr.
        methodPane offset: methodString position.
        methodString nextPutAll: methodPane contents.
    ].
    answer := Compiler
        compile: methodString contents
        in: WBAction
        notifying: methodPane
        ifFail: [ ^methodPane setFocus ].

    PWindowBuilder
        createMethod: methodString contents
        in: WBAction
        loggingSource: true.

    changed := false.
    self updateList.!
  
cancel: aPane

    | answer |
    changed ifTrue: [
        answer := MessageBox yesNoCancelTitled: 'Please Confirm' text: 'Save action?'.
        answer isNil ifTrue: [
            ^nil
        ] ifFalse: [ answer == #yes ifTrue: [
            self add: (self paneNamed: 'add').
            changed := false.
        ]].
    ].
    super cancel: aPane!
   
fileIn: aPane

    | dialog file |
    dialog := FileDialog new.
    dialog title: 'File In Actions';
        defFilter: '*.ACT';
        addFilter: '*.ACT' description: 'Action Lists';
        hideReadonly;
        open.

    file := dialog file.
    file isNil ifTrue: [^self].
    file := File pathNameReadOnly: file.
    CursorManager execute change.
    file fileIn.
    CursorManager normal change.
    file close.

    self updateList!

fileOut: aPane

    | file classReader |

    file := (FileDialog new
        saveTitle: 'File out Actions'
        fileName: (
            File
                fileName: 'ACTIONS'
                extension: 'ACT')) file.
    file isNil ifTrue: [^self].
    file := File newFile: file.
    classReader := ClassReader forClass: (Smalltalk at: #WBAction).
    WBAction listActions do: [ :act |
        classReader fileOutMethod: ('action',act) asSymbol on: file].
    file close.!
   
getAuthor: aPane

     aPane setContents: (Smalltalk at: #WindowBuilderUser ifAbsent: [ nil ])!
   
help: aPane

    MessageBox notify: 'Action Attributes Help' withText:
'Enter the text for your action in the ''Method
Text'' box. The window may be referred to as
''self window''. The button or menuItem can be
refered to as ''self button'' or ''self menuItem''.'!
  
initWindow

    | listPane |
    changed := false.
    action := thePane action.
    self updateList.!
 
loadList: aPane

    aPane contents: WBAction listActions!

methodChanged: aPane

    aPane contents trimBlanks = method ifTrue: [
        (self paneNamed: 'add')
            contents: '&Change';
            disable.
        (self paneNamed: 'author') setContents: author.
    ] ifFalse: [
        (self paneNamed: 'author') setContents:
            (Smalltalk at: #WindowBuilderUser ifAbsent: [ author ]).
        (WBAction listActions includes: (self paneNamed: 'name') contents) ifTrue: [
            (self paneNamed: 'add')
                contents: '&Change';
                enable.
        ] ifFalse: [
            (self paneNamed: 'add')
                contents: '&Add';
                enable.
        ].
    ].
    changed := true.!
 
newAuthor: aPane

    (self paneNamed: 'add')
        contents: '&Change';
        enable.
    author := aPane contents.
    changed := true.!

newName: aPane

    aPane contents isEmpty ifTrue: [
        self getAuthor: (self paneNamed: 'author').
        (self paneNamed: 'add')
            contents: '&Add';
            disable
    ] ifFalse: [(WBAction listActions includes: aPane contents) ifTrue: [
        changed ifTrue: [
            self getAuthor: (self paneNamed: 'author').
            (self paneNamed: 'add')
                contents: '&Change';
                enable
        ] ifFalse: [
            (self paneNamed: 'author') setContents: author.
            (self paneNamed: 'add')
                contents: '&Change';
                disable
        ].
    ] ifFalse: [
        self getAuthor: (self paneNamed: 'author').
        (self paneNamed: 'add')
            contents: '&Add';
            enable
    ]].!
  
ok: aPane

    | answer |
    changed ifTrue: [
        answer := MessageBox yesNoCancelTitled: 'Please Confirm' text: 'Save action?'.
        answer isNil ifTrue: [
            ^nil
        ] ifFalse: [ answer == #yes ifTrue: [
            self add: (self paneNamed: 'add').
            changed := false.
        ]].
    ].
    thePane action: (self paneNamed: 'list') selectedItem.
    thePane isInterfaceObject ifTrue: [
        thePane contents: thePane action
    ].

    self close!
   
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'Action Attributes';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 1061 @ 528; lDU: 197 r: #left; tDU: 242 r: #top; cRDU: (11 @ 518 rightBottom: 1049 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 631 @ 384; lDU: 393 r: #left; rDU: 1024 r: #left; tDU: 8 r: #top; bDU: 392 r: #top);
                    startGroup;
                    contents: 'Action Definition';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 256 @ 32; lDU: 18 r: #left; rDU: 274 r: #left; tDU: 8 r: #top; bDU: 40 r: #top);
                    startGroup;
                    contents: 'Select an Action:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 101 @ 32; lDU: 411 r: #left; rDU: 512 r: #left; tDU: 56 r: #top; bDU: 88 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Name:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 110 @ 32; lDU: 402 r: #left; rDU: 512 r: #left; tDU: 112 r: #top; bDU: 144 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Author:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 192 @ 32; lDU: 411 r: #left; rDU: 603 r: #left; tDU: 160 r: #top; bDU: 192 r: #top);
                    startGroup;
                    contents: 'Method Text';
                    yourself
            );
            addSubpane: (
                ListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 357 @ 352; lDU: 18 r: #left; rDU: 375 r: #left; tDU: 40 r: #top; bDU: 392 r: #top);
                    paneName: 'list';
                    startGroup;
                    tabStop;
                    when: #select perform: #select:;
                    when: #doubleClickSelect perform: #ok:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 169 @ 56; lDU: 18 r: #left; rDU: 187 r: #left; tDU: 400 r: #top; bDU: 456 r: #top);
                    paneName: 'ok';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 169 @ 56; lDU: 201 r: #left; rDU: 370 r: #left; tDU: 400 r: #top; bDU: 456 r: #top);
                    paneName: 'cancel';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: 'Cancel';
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 320 @ 48; lDU: 521 r: #left; rDU: 841 r: #left; tDU: 48 r: #top; bDU: 96 r: #top; indent: 3 @ 4);
                    paneName: 'name';
                    startGroup;
                    tabStop;
                    when: #textChanged perform: #newName:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 155 @ 48; lDU: 850 r: #left; rDU: 1006 r: #left; tDU: 48 r: #top; bDU: 96 r: #top);
                    paneName: 'add';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #add:;
                    contents: '&Add';
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 485 @ 48; lDU: 521 r: #left; rDU: 1006 r: #left; tDU: 104 r: #top; bDU: 152 r: #top; indent: 3 @ 4);
                    paneName: 'author';
                    startGroup;
                    tabStop;
                    when: #textChanged perform: #newAuthor:;
                    yourself
            );
            addSubpane: (
                WBTextPane new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 594 @ 184; lDU: 411 r: #left; rDU: 1006 r: #left; tDU: 192 r: #top; bDU: 376 r: #top);
                    paneName: 'method';
                    noScrollBars;
                    startGroup;
                    tabStop;
                    when: #textChanged perform: #methodChanged:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 165 @ 56; lDU: 393 r: #left; rDU: 558 r: #left; tDU: 400 r: #top; bDU: 456 r: #top);
                    paneName: 'help';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #help:;
                    contents: '&Help';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 649 r: #left; rDU: 832 r: #left; tDU: 400 r: #top; bDU: 456 r: #top);
                    paneName: 'fileOut';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #fileOut:;
                    contents: '&File Out...';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 841 r: #left; rDU: 1024 r: #left; tDU: 400 r: #top; bDU: 456 r: #top);
                    paneName: 'fileIn';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #fileIn:;
                    contents: 'File &In...';
                    yourself
            );
        yourself
    ).

    self openWindow!
 
select: aPane
    | stream pos |
    changed ifTrue: [
        (MessageBox confirm: 'Save action?') ifTrue: [
            self add: (self paneNamed: 'add').
            changed := false.
        ].
    ].
    action := aPane selectedItem.
    action isNil ifTrue: [ ^nil ].
    (self paneNamed: 'name') setContents: action.
    method := WBAction sourceCodeAt: ('action',action) asSymbol.
    stream := method asStream.
    stream skipTo: $".
    history := stream upTo: $".
    author := ((history asStream) skipTo: $y; skip: 1; upTo: $-) trimBlanks.
    (self paneNamed: 'author') setContents: author.
    pos := stream position.
    stream skipTo: $".
    stream position = stream size ifTrue: [ stream position: (stream size min: pos + 3)].
    method := stream copyFrom: stream position to: stream size.
    (self paneNamed: 'method')
        contents: method;
        selectAll;
        selectBefore: 1@1.
    (self paneNamed: 'add')
        contents: '&Change';
        disable.
    changed := false.!

updateList
    | listPane |
    self loadList: (listPane := self paneNamed: 'list').
    action isNil ifFalse: [
        listPane selectItem: action.
        self select: listPane
    ].
    (self paneNamed: 'add') disable! !



!WBInvisibleGroupPane class methods !
   
isWBInternalClass

    ^true! !



!WBInvisibleGroupPane methods !

addSubpane: aPane

    | id |

    children isNil ifTrue: [
        children := IdentityDictionary new].
    children at: (id := self getNextChildId) put: aPane.
    aPane propertyAt: #id put: id.! !



!PWBVerticalScrollBar class methods ! !



!PWBVerticalScrollBar methods !

defaultSize

    ^self suggestedSize x@100!
   
displayWith: aPen

    self drawVScrollBarWith: aPen at: rect.!
   
mutationRotationList

    ^#(WBHorizontalScrollBar CPHorizontalBarGauge CPHorizontalSlider)!
  
storeSpecificsOn: aStream indentString: indentString

    super storeSpecificsOn: aStream indentString: indentString.

    aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'vertical'.!
  
suggestedSize

    ^17@self extent y!
 
winClassStyle

    ^SbsVert! !



!WBFramerExample class methods !

isWBInternalClass

    ^true! !



!WBFramerExample methods !
 
defaultStyle
        "Private - Answer an Integer with appropriate styles in it."
    ^WsChild   |
    WsVisible!

display

    frameRect notNil ifTrue: [
        self pen
            drawRectangle: frameRect;
            fill: (frameRect insetBy: 1) color: ClrWhite.
    ].
    paneRect notNil ifTrue: [
        self pen fill: (paneRect leftTop corner: (paneRect corner min: frameRect corner - 1)) color: ClrBlue.
    ].!

frameRect

    ^frameRect!

frameRect: aRect

    frameRect := aRect.!

getGraphicsTool
        "We use a pen here, not a textTool"
    | dc |

    dc := self getDC.
    ^graphicsTool := Pen forDC: dc medium: self!
 
paneRect: aRect

    paneRect := aRect.
    self display.!
   
updateSliders!
  
wmErasebkgnd: wordInteger with: longInteger

    | oldDC |
    oldDC := graphicsTool privateHandle.
    graphicsTool handle: wordInteger.
    graphicsTool fill: (0@0 extent: self extent) color:  (UserLibrary getSysColor: ColorWindow).
    graphicsTool handle: oldDC.
    ^1! !



!WBCompositePaneScratchWindow class methods !

defaultClass

    ^WBDefaultCompositePaneScratchWindow!
   
isScratchWindow

    ^true!
   
isWBInternalClass

    ^true!
 
resetToDefault

    | fileInStream methodString |

    methodString := WBDefaultCompositePaneScratchWindow sourceCodeAt: #addSubpanes.
    fileInStream := ReadWriteStream on: (String new: methodString size).
    fileInStream
        nextPutAll: '!! WBCompositePaneScratchWindow methods !!';
        nextChunkPut: methodString;
        nextChunkPut: String new.
    fileInStream reset; fileIn.! !



!WBCompositePaneScratchWindow methods !

perform: selector
    "Scratch windows should not perform any events"
    ^MessageBox messageNote: 'Scratch windows cannot do anything. You must first create a new view manager class with the "Save As..." command in order to add behavior.'!
  
perform: selector with: arg
    "Scratch windows should not perform any events"
    ^self perform: selector!
  
when: anEvent perform: aSelector
    "Scratch windows should not perform any events"! !



!PCompositePane class methods !
 
styleFrom: s

    (s bitIsOn: WsBorder) ifFalse: [
        ^#defaultStyle
    ] ifTrue: [
        (s bitIsOn: WsVscroll) ifFalse: [
            ^#borders
        ] ifTrue: [(s bitIsOn: WsHscroll) ifFalse: [
            ^#verticalScrollBar
        ] ifTrue: [
            ^#scrollbars
        ]].
    ].! !



!PCompositePane methods !
  
backColor

    self parent isCompositePane ifTrue: [
        ^super backColor
    ] ifFalse: [
        backColor = super defaultBackColor ifTrue: [
            ^super backColor
        ] ifFalse: [
            ^backColor
        ].
    ].!
   
children

    children isNil ifTrue: [ children := #() ].
    ^children!
 
children: aCollection

    children := aCollection!
   
copySpecificsTo: aPane

    aPane
        initialFraming: self initialFraming.!
  
defaultBackColor
    self parent isCompositePane ifTrue: [
        ^self parent defaultBackColor
    ] ifFalse: [ defaultBackColor isNil ifTrue: [
        ^super defaultBackColor
    ] ifFalse: [
        ^defaultBackColor
    ]].!
   
defaultBackColor: aColor

    defaultBackColor := aColor!
 
displayWith: aPen clipRect: inRect
    | region r clipRect |
    r := inRect.
    aPen fill: self rect color: self backColor.
    self style == #scrollbars ifTrue: [
        self displayWithBothScrollBars: aPen.
        r := inRect insetBy: 1.
        r := Rectangle
            leftTop: r leftTop
            extent: ((r extent x - self scrollBarWidth + 1)@(r extent y - self scrollBarHeight + 1)).
        r := r intersect: inRect.
     ] ifFalse: [ self style == #verticalScrollBar ifTrue: [
        self displayWithLeftScrollBar: aPen.
        r := inRect insetBy: 1.
        r := Rectangle
            leftTop: r leftTop
            extent: ((r extent x - self scrollBarWidth + 1)@(r extent y)).
        r := r intersect: inRect.
    ] ifFalse: [ (self style == #borders or: [self style == #mdiToolBarBordered])  ifTrue: [
        self displayWith: aPen.
        r := inRect insetBy: 1.
    ]]].
    self children reverseDo: [ :child |
        child reframe: self rect.
        (r intersects: child rect) ifTrue: [
            region := aPen setClipRect: (clipRect := r intersect: child rect).
            child displayWith: aPen clipRect: clipRect.
            aPen destroyRegion: region.
        ].
    ].!
  
framingBlock: f
    | width |
    (self style == #mdiToolBar or: [self style == #mdiToolBarBordered]) ifFalse: [
        ^super framingBlock: f
    ].
    parentWindow isNil ifTrue: [
        width := 300
    ] ifFalse: [
        width := parentWindow rect width
    ].
    framingBlock := FramingParameters new
        iDUE: width @ (self suggestedSize y / (SysFont height / 32));
        lDU: 0 r: #left;
        rDU: 0 r: #right;
        tDU: 0 r: #top;
        bDU: self suggestedSize y / (SysFont height / 32) r: #top!
  
initialFraming

    ^initialFraming!
  
initialFraming: aFramingParameter

    initialFraming := aFramingParameter!
   
isCompositePane

    ^true!
   
readSpecificsFrom: c

    c cpStyle isNil ifFalse: [
        self style: c cpStyle
    ]!
   
realClass: aClass
    | temp convertor |
    super realClass: aClass.
    temp := aClass new.
    temp addSubpanes.
    self initialFraming: temp framingBlock deepCopy.
    temp backColor notNil ifTrue: [
        (self backColor = self defaultBackColor) ifTrue: [
            self backColor: temp backColor.
        ].
        self defaultBackColor: temp backColor.
    ] ifFalse: [
        self defaultBackColor: (self getSysColor: ColorWindow).
        self backColor: (self getSysColor: ColorWindow)
    ].
    self extent: self defaultSize.

    convertor := WBRealLayoutPane basicNew.
    self children: (convertor convertView: temp realClass: aClass) children.
    self children do: [ :child | child parent: self ].!
   
storeColorOn: aStream indentString: indentString!
   
storeSpecificsOn: aStream indentString: indentString

    super storeColorOn: aStream indentString: indentString.
    aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'addSubpanes'!
  
style: aStyle

    super style: aStyle.
    (aStyle == #mdiToolBar or: [aStyle == #mdiToolBarBordered])  ifTrue: [
        framingBlock := FramingParameters new
            lDU: 0 r: #left;
            rDU: 0 r: #right;
            tDU: 0 r: #top;
            bDU: self rect height / (SysFont height / 32) r: #top.
        self parent notNil ifTrue: [ self reframe: self parent rect ].
        ^nil
    ].!
   
styles

    ^#(defaultStyle borders scrollbars verticalScrollBar mdiToolBar mdiToolBarBordered)!
  
suggestedSize

    self initialFraming isNil ifTrue: [
        ^100@100
    ] ifFalse: [
        ^(self initialFraming value: Display boundingBox) extent
    ].!
 
usesFont

    ^false!
 
usesForeColor

    ^false!

usesMenu

    ^true! !



!WBDefaultDialogScratchWindow class methods !
   
isWBInternalClass

    ^true! !



!WBDefaultDialogScratchWindow methods !

createViews

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'New Dialog';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 686 @ 400; xC; yC; cRDU: (11 @ 390 rightBottom: 674 @ 48));
            pStyle: #(sysmenu modal titlebar);
        yourself
    ).!
  
isWBWindow

    ^true! !



!WBStatusPaneEditor class methods ! !



!WBStatusPaneEditor methods !

copy: aPane

    | index |
    index := list selection.
    index isNil ifTrue: [ ^nil ].
    clipboard := boxes at: index .
    (self paneNamed: 'paste') enable.!
   
down: aPane

    | box index |
    index := list selection.
    index isNil ifTrue: [ ^nil ].
    box := boxes at: index.
    index == boxes size ifTrue: [ ^nil ].
    boxes removeIndex: index.
    boxes add: box afterIndex: index.
    list
        contents: (boxes collect: [ :box | box name asString ]);
        selection: index + 1.

    self updateBoxes.!

initWindow

    list contents: (boxes collect: [ :box | box name asString ]).

    (self paneNamed: 'paste') disable.
    (self paneNamed: 'auto') selection: true.

    boxes isEmpty ifFalse: [
        list selection: 1.
        self selectBox: list
    ] ifTrue: [
        self updateBoxes.
    ].!
 
insert: aPane

    | index |
    index := list selection.

    box := (Smalltalk at: #StatusBox) new
        name: '';
        width: 10;
        space: 7;
        contents: '';
        yourself.

    index isNil ifTrue: [
        boxes add: box.
        index := boxes size.
    ] ifFalse: [
        boxes add: box afterIndex: index.
        index := index + 1.
    ].
    list
        contents: (boxes collect: [ :box | box name asString ]);
        selection: index.

    (self paneNamed: 'name') contents: ''.
    (self paneNamed: 'width') contents: '10'.
    (self paneNamed: 'space') contents: '7'.
    (self paneNamed: 'contents') setContents: ''.

    self updateBoxes.!
  
ok: aPane

    thePane statusBoxes: boxes.

    self close!
 
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'StatusPane Attributes';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 1097 @ 432; xC; yC; cRDU: (11 @ 422 rightBottom: 1086 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 576 @ 352; lDU: 9 r: #left; rDU: 585 r: #left; tDU: 8 r: #top; bDU: 360 r: #top);
                    startGroup;
                    contents: 'Status Boxes';
                    yourself
            );
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 457 @ 272; lDU: 603 r: #left; rDU: 1061 r: #left; tDU: 8 r: #top; bDU: 280 r: #top);
                    startGroup;
                    contents: 'StatusBox';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 110 @ 32; lDU: 658 r: #left; rDU: 768 r: #left; tDU: 56 r: #top; bDU: 88 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Name:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 110 @ 32; lDU: 658 r: #left; rDU: 768 r: #left; tDU: 168 r: #top; bDU: 200 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Width:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 110 @ 32; lDU: 658 r: #left; rDU: 768 r: #left; tDU: 224 r: #top; bDU: 256 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Space:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 155 @ 32; lDU: 613 r: #left; rDU: 768 r: #left; tDU: 112 r: #top; bDU: 144 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Contents:';
                    yourself
            );
            addSubpane: (
                WBListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 357 @ 216; lDU: 27 r: #left; rDU: 384 r: #left; tDU: 48 r: #top; bDU: 264 r: #top);
                    paneName: 'boxes';
                    startGroup;
                    tabStop;
                    when: #select perform: #selectBox:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 174 @ 64; lDU: 393 r: #left; rDU: 567 r: #left; tDU: 48 r: #top; bDU: 112 r: #top);
                    paneName: 'insert';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #insert:;
                    contents: '&Insert';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 174 @ 64; lDU: 393 r: #left; rDU: 567 r: #left; tDU: 128 r: #top; bDU: 192 r: #top);
                    paneName: 'copy';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #copy:;
                    contents: '&Copy';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 174 @ 64; lDU: 393 r: #left; rDU: 567 r: #left; tDU: 200 r: #top; bDU: 264 r: #top);
                    paneName: 'paste';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #paste:;
                    contents: '&Paste';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 174 @ 64; lDU: 27 r: #left; rDU: 201 r: #left; tDU: 280 r: #top; bDU: 344 r: #top);
                    paneName: 'up';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #up:;
                    contents: '&Up';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 174 @ 64; lDU: 210 r: #left; rDU: 384 r: #left; tDU: 280 r: #top; bDU: 344 r: #top);
                    paneName: 'down';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #down:;
                    contents: '&Down';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 174 @ 64; lDU: 393 r: #left; rDU: 567 r: #left; tDU: 280 r: #top; bDU: 344 r: #top);
                    paneName: 'remove';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #remove:;
                    contents: '&Remove';
                    yourself
            );
            addSubpane: (
                EnhancedEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 265 @ 48; lDU: 777 r: #left; rDU: 1042 r: #left; tDU: 48 r: #top; bDU: 96 r: #top; indent: 3 @ 4);
                    paneName: 'name';
                    character: #okAlphaNumericNoSpace:;
                    startGroup;
                    tabStop;
                    when: #textChanged perform: #setName:;
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 265 @ 48; lDU: 777 r: #left; rDU: 1042 r: #left; tDU: 104 r: #top; bDU: 152 r: #top; indent: 3 @ 4);
                    paneName: 'contents';
                    startGroup;
                    tabStop;
                    when: #textChanged perform: #setContents:;
                    yourself
            );
            addSubpane: (
                EnhancedEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 146 @ 48; lDU: 777 r: #left; rDU: 923 r: #left; tDU: 160 r: #top; bDU: 208 r: #top; indent: 3 @ 4);
                    paneName: 'width';
                    maxSize: 4;
                    character: #okInteger:;
                    startGroup;
                    tabStop;
                    when: #textChanged perform: #setWidth:;
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 110 @ 40; lDU: 933 r: #left; rDU: 1042 r: #left; tDU: 168 r: #top; bDU: 208 r: #top);
                    paneName: 'auto';
                    startGroup;
                    tabStop;
                    contents: 'Auto';
                    yourself
            );
            addSubpane: (
                EnhancedEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 146 @ 48; lDU: 777 r: #left; rDU: 923 r: #left; tDU: 216 r: #top; bDU: 264 r: #top; indent: 3 @ 4);
                    paneName: 'space';
                    maxSize: 4;
                    character: #okInteger:;
                    startGroup;
                    tabStop;
                    when: #textChanged perform: #setSpace:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 146 @ 64; lDU: 759 r: #left; rDU: 905 r: #left; tDU: 296 r: #top; bDU: 360 r: #top);
                    paneName: 'ok';
                    idOK;
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 146 @ 64; lDU: 914 r: #left; rDU: 1061 r: #left; tDU: 296 r: #top; bDU: 360 r: #top);
                    paneName: 'cancel';
                    idCancel;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: 'Cancel';
                    yourself
            );
        yourself
    ).

    self openWindow!
 
paste: aPane

    | index |
    index := list selection.
    index isNil ifTrue: [
        boxes add: clipboard deepCopy.
        index := boxes size.
    ] ifFalse: [
        boxes add: clipboard deepCopy beforeIndex: index
    ].
    list
        contents: (boxes collect: [ :box | box name asString ]);
        selection: index.

    self updateBoxes.!
   
preInitWindow

    boxes := thePane statusBoxes deepCopy.
    list := self paneNamed: 'boxes'.!
  
remove: aPane

    | index |
    index := list selection.
    index isNil ifTrue: [ ^nil ].
    boxes removeIndex: index.
    list
        contents: (boxes collect: [ :box | box name asString ]);
        selection: (index min: boxes size).

    self updateBoxes.!
   
selectBox: aPane

    | box |
    box := boxes at: aPane selection.
    (self paneNamed: 'name') contents: box name asString.
    (self paneNamed: 'width') contents: box width asString.
    (self paneNamed: 'space') contents: box space asString.
    (self paneNamed: 'contents') setContents: box contents.

    self updateBoxes.!
  
setContents: aPane

    | box width |
    list selection isNil ifTrue: [ ^nil ].
    box := boxes at: list selection.
    box contents: aPane contents.

    (self paneNamed: 'auto') selection ifTrue: [
        (self paneNamed: 'width') contents:
            (width := thePane font wbStringWidth: aPane contents) asString.
        box width: width
    ].!
   
setName: aPane

    | box index |
    list selection isNil ifTrue: [ ^nil ].
    box :=boxes at: list selection.
    box name: aPane contents.

    index := list selection.
    list
        contents: (boxes collect: [ :box | box name asString ]);
        selection: index.!
 
setSpace: aPane

    | box |
    list selection isNil ifTrue: [ ^nil ].
    box := boxes at: list selection.
    box space: aPane contents asInteger.!
 
setWidth: aPane

    | box |
    list selection isNil ifTrue: [ ^nil ].
    box :=boxes at: list selection.
    box width: aPane contents asInteger.!
  
up: aPane

    | box index |
    index := list selection.
    index isNil ifTrue: [ ^nil ].
    box := boxes at: index.
    index == 1 ifTrue: [ ^nil ].
    boxes removeIndex: index.
    boxes add: box beforeIndex: index - 1.
    list
        contents: (boxes collect: [ :box | box name asString ]);
        selection: index - 1.

    self updateBoxes.!
  
updateBoxes

    boxes isEmpty ifTrue: [
        (self paneNamed: 'remove') disable.
        (self paneNamed: 'copy') disable.
        (self paneNamed: 'up') disable.
        (self paneNamed: 'down') disable.
        ^nil
    ] ifFalse: [
        (self paneNamed: 'remove') enable.
        (self paneNamed: 'copy') enable.
    ].
    list selection == boxes size ifTrue: [
        (self paneNamed: 'down') disable
    ] ifFalse: [
        (self paneNamed: 'down') enable
    ].
    list selection == 1 ifTrue: [
        (self paneNamed: 'up') disable
    ] ifFalse: [
        (self paneNamed: 'up') enable
    ].! !



!WB3DFrame class methods !
  
isWBInternalClass

    ^true! !



!WB3DFrame methods !
   
defaultStyle
        "Private - Answer an Integer with appropriate styles in it."
    ^WsChild   |
    WsVisible!

depth

    ^depth!

depth: anInteger

    depth := anInteger!
 
display

    self doGraphics: [
        self displayWith: self pen inRect: self rect
    ]!
 
displayWith: pen inRect: r

    | rect inRect |

    rect := r leftTop extent: self extent.
    pen
        drawRect3D: (rect expandBy: 1) depth: depth style: style3D;
        foreColor: self foreColor.!
  
getGraphicsTool
        "We use a pen here, not a textTool"

    ^graphicsTool := Pen forDC: nil medium: self.!
  
in

    style3D := #in.!
  
initialize

    super initialize.
    style3D := #in.
    depth := 1.!
  
out

    style3D := #out.!

rect

    ^0@0 extent: self extent!
   
style3D

    ^style3D!

style3D: s

    style3D := s!
 
updateSliders!
  
wmGetdlgcode: wParam with: lParam

    ^DlgcStatic!
   
wmNchittest: wParam with: lParam
        "Private - allow overlapping panes to get mouse input"
  ^  -1  "HtTransparent"! !



!PGenericSubpane class methods ! !



!PGenericSubpane methods !
   
displayWith: aPen clipRect: r

    self displayGenericWith: aPen clipRect: r!
 
realClass: aClass

    realClass := aClass.
    self style: self defaultStyle.!
  
usesFocus

   ^false! !



!PEnhancedEntryField class methods ! !



!PEnhancedEntryField methods !
   
attributeEditor

    ^WBEnhancedEntryFieldEditor new!
 
autoTab

    ^autoTab ifNil: [ autoTab := false ].!
   
autoTab: aBoolean

    autoTab := aBoolean!
   
case

    ^case!
  
case: aSymbol

    case := aSymbol!
   
character

    ^character!

character: aSymbol

    character := aSymbol!
 
copySpecificsTo: aPane

    aPane
        autoTab: self autoTab;
        maximumSize: self maximumSize;
        getFocus: self getFocus;
        case: self case;
        justification: self justification;
        character: self character;
        field: self field.!

field

    ^field!

field: aSymbol

    field := aSymbol!
 
getFocus

    getFocus isNil ifTrue: [ getFocus := #selectAll ].
    ^getFocus!
  
getFocus: aSymbol

    getFocus := aSymbol!
   
justification

    justification isNil ifTrue: [ justification := #left ].
    ^justification!
   
justification: aSymbol

    justification := aSymbol!
 
maximumSize

    maxSize isNil ifTrue: [ maxSize := 0 ].
    ^maxSize!
   
maximumSize: anInteger

    maxSize := anInteger!
 
readSpecificsFrom: c

    super readSpecificsFrom: c.
    self
        autoTab: c isAutoTab;
        maximumSize: c maxSize;
        getFocus: c getFocus;
        case: c case;
        justification: c justification;
        character: c character;
        field: c field.!
 
storeSpecificsOn: aStream indentString: indentString

    self maximumSize == 0 ifFalse: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'maxSize: ', self maximumSize asString ].
    self getFocus == #selectAll ifFalse: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'getFocus: #', self getFocus asString ].
    self case notNil ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'case: #', self case asString ].
    self character notNil ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'character: #', self character asString ].
    self field notNil ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'field: #', self field asString ].
    self justification == #left ifFalse: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, self justification asString ].
    self autoTab ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'autoTab' ].! !



!ButtonEditor class methods ! !



!ButtonEditor methods !
   
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
        color: bitColor.
    (imagePoint x > (imageForm extent x / 2)) ifTrue: [ ^nil ].
    imagePoint := imagePoint + self offset.
    changePoint := imagePoint * scale.
    (self isInGrid: changePoint) ifFalse: [ ^self ].
    changePoint printString.
    bitPen fill: ((changePoint + 2) extent: (scale @ scale) - 3)
        color: bitColor.
    imagePen fill: (imagePoint extent: 1 @ 1)
        color: bitColor.
    copy pen fill: (imagePoint extent: 1 @ 1)
        color: bitColor!
   
offset
    ^(imageForm width // 2)+2@2!

open
    self openOn: 'TEMP2522.BMP'!
  
openOn: file
    file isString ifTrue: [
        fileName := file.
        self label: 'ButtonEditor [',file,']'.
        super openOn: (Bitmap fromFile: file)
    ] ifFalse: [
        self label: 'ButtonEditor [Untitled]'.
        super openOn: file
    ]!
   
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
    windowSize := 80 + imageSize x + 4 @
        (( 200 max: imageSize y) + SysFont height + 12).
    self openWindow.
    self menuWindow addMenu: (
        Menu colorMenu: self selector: #colorSelected:)!
   
save: aPane
    | dialog file |
    super save: aPane.
    fileName isNil ifTrue: [ ^self ].
    dialog := FileDialog new
                        saveTitle: 'Save Bitmap'
                        fileName: fileName.
    file := dialog file.
    file isNil ifTrue: [^self].
    imageForm outputToFile: file.! !



!GraphicObject class methods !
 
example

    | e |

    e := self new.
    e rect: (0@0 extent: 300@200).

    ^e!
   
new

    ^super new initialize! !



!GraphicObject methods !
 
containsPoint: p

    ^rect containsPoint: p!
 
displayWith: aPen

    aPen
        foreColor: (self getSysColor: ColorWindowframe);
        place: rect origin;
        box: rect corner.!

displayWith: aPen clipRect: r

    self displayWith: aPen.!
   
extent

    ^rect extent!
 
extent: e

    rect extent: e!

fullCopy

    | copy |

    copy := self class new.

    self fullCopyTo: copy.

    ^copy!
 
fullCopyTo: c!
  
initialize

    rect := 0@0 extent: 0@0!
  
maxSize

    ^32000@32000!

minSize

    ^1@1!

rect

    ^rect!
  
rect: aRect

    rect := aRect!
   
suggestedSize

    ^nil! !



!PStaticBox class methods !
 
exampleFrom: aClassName

    | e |

    e := super exampleFrom: aClassName.
    e style: #grayRectangle;
        font: e defaultFont;
        extent: e suggestedSize.

    ^e!

styleFrom: s

    | symbolStyles frameStyle |

    frameStyle := s bitAnd: 15.
    symbolStyles := Dictionary new.
    symbolStyles
        at: SsWhiterect put: #whiteRect;
        at: SsWhiteframe put: #whiteFrame;
        at: SsBlackframe put: #blackFrame;
        at: SsBlackrect put: #blackRectangle;
        at: SsGrayrect put: #grayRectangle;
        at: SsGrayframe put: #grayFrame.

    ^symbolStyles at: frameStyle ifAbsent: [ #blackFrame ].! !



!PStaticBox methods !

defaultForeColor

    ^nil!
   
defaultStyle

    ^#whiteRectangle!
   
displayWith: aPen

    | c |


    style first = $w ifTrue: [
        c := (self getSysColor: ColorWindow).
    ] ifFalse: [
        style first = $b ifTrue: [
            c := (self getSysColor: ColorWindowframe).
        ] ifFalse: [
            c := (self getSysColor: ColorBackground)
        ].
    ].


    (style at: style size - 1) = $m ifTrue: [
        aPen
            foreColor: c;
            drawRectangle: rect.
    ] ifFalse: [
        aPen fill: rect color: c.
    ].!
 
mutationTypes

    ^#(GroupBox CP3DFrame StaticBox)!
  
staysToBack

    ^true!
   
styles

    ^#(whiteRect whiteFrame blackFrame blackRectangle grayFrame grayRectangle)!
   
suggestedSize

    ^100@100!
  
usesColor

    ^false!

usesFocus

    ^false!

usesMenu

    ^false!
 
winUserStyle

    ^((OrderedCollection new
            add: SsWhiterect;
            add: SsWhiteframe;
            add: SsBlackframe;
            add: SsBlackrect;
            add: SsGrayframe;
            add: SsGrayrect;
            yourself) asArray
        at: (#(whiteRect whiteFrame blackFrame
                blackRectangle grayFrame grayRectangle) indexOf: style))! !



!WBVerticalScrollBar class methods !
 
isWBInternalClass

    ^true! !



!WBVerticalScrollBar methods ! !



!FrameObject class methods ! !



!FrameObject methods !
   
contentRect

    ^(rect insetBy: 1)!
  
drawFrameWith: aPen at: aPoint

    | theRect |
    theRect := (aPoint extentFromLeftTop: rect extent).
    aPen place: aPoint;
        box: theRect corner.!
  
frameExtent

    ^rect extent!

importantEvents

    ^OrderedCollection new.!
 
isFrameObject

    ^true! !



!WindowFrameObject class methods !
 
indent

    ^UserLibrary getSystemMetrics: SmCxsize!
  
newForClass: c

    (c inheritsFrom: CompositePane) ifTrue: [
        ^CompositeFrameObject new
    ].

    ^self new!

purgeCache

    Minimize notNil ifTrue: [
        Minimize release.
    ].
    Maximize notNil ifTrue: [
        Maximize release.
    ].

    SysMenu notNil ifTrue: [
        SysMenu release.
    ].
    Minimize := Maximize := SysMenu := nil!
 
styleFrom: winStyle

    | s |

    s := Set new.

    (winStyle bitIsOn: WsSysmenu) ifTrue: [
        s add: #sysmenu.
    ].

    (winStyle bitIsOn: WsCaption) ifTrue: [
        s add: #titlebar.
    ].
    (winStyle bitIsOn: DsModalframe) ifTrue: [
        s add: #modal.
    ].
    (winStyle bitIsOn: DsSysmodal) ifTrue: [
        s add: #sysmodal.
    ].

    ^s! !



!WindowFrameObject methods !
  
addSubpane: c

    "Windows import."

    children add: c.!
 
attributeEditor

    self isDialog ifTrue: [
        ^WBDialogEditor new
    ] ifFalse: [
        ^WBWindowEditor new
    ].!
 
backColor

    ^backColor.!
   
borderWidth

    (self isModal) ifTrue: [
        ^(UserLibrary getSystemMetrics: SmCxdlgframe) + 1
    ] ifFalse: [
        (self style includes: #sizable) ifTrue: [
            ^UserLibrary getSystemMetrics: SmCxframe
        ] ifFalse: [
            ^UserLibrary getSystemMetrics: SmCxborder
        ].
    ].!
 
children

    ^children!
  
children: c

    children := c.!
  
contentRect

    | contentRect |

    contentRect := rect left @ (rect top down: self titleHeight + self menuHeight) rightBottom: rect right @ rect bottom.

    ^contentRect insetBy: self borderWidth!
  
copySpecificsTo: aPane

    aPane
        iconFile: self iconFile.!
  
createdBy

    ^createdBy!

createdBy: aString

    createdBy := aString!
 
defaultBackColor

    ^self getSysColor: ColorWindow!
 
defaultStyle

    (self realClass notNil and: [ self isDialog ]) ifTrue: [
        ^#( sysmenu modal titlebar )
    ] ifFalse: [
        ^#( sysmenu minimize maximize sizable titlebar )
    ].!
 
drawBorderWith: aPen in: windowRect

    | r borderWidth borderColor topRect bottomRect leftRect rightRect linePos |

    r := windowRect.
    (self style includes: #sizable) ifFalse: [
        borderWidth := self borderWidth - 1.
    ] ifTrue: [
        borderWidth := self borderWidth - 2.
    ].
    linePos := borderWidth + self sysMenuBitmap extent + 1.

    aPen
        foreColor: (self getSysColor: ColorWindowframe);
        drawRectangle: r.

    (self style includes: #sizable) | self isModal ifTrue: [

        r := r insetBy: 1.

        topRect := r leftTop rightBottom: r right @ (r top down: borderWidth).
        leftRect := r leftTop rightBottom: (r left right: borderWidth) @ r bottom.
        bottomRect := r left @ (r bottom up: borderWidth) rightBottom: r rightBottom.
        rightRect := ((r right left: borderWidth) @ r top rightBottom: r rightBottom).

    (self style includes: #sizable) ifTrue: [
        borderColor := self getSysColor: ColorActiveborder.
    ] ifFalse: [
        borderColor := self getSysColor: ColorActivecaption.
    ].

    aPen
        fill: topRect color: borderColor;
        fill: leftRect color: borderColor;
        fill: bottomRect color: borderColor;
        fill: rightRect color: borderColor;
        foreColor: (self getSysColor: ColorWindowframe).

    (self style includes: #sizable) ifTrue: [
        aPen
            drawRectangle: (topRect insetBy: (linePos x @ -1));
            drawRectangle: (leftRect insetBy: (-1@ linePos y));
            drawRectangle: (rightRect insetBy: (-1@ linePos y));
            drawRectangle: (bottomRect insetBy: (linePos x @ -1));
            drawRectangle: (r insetBy: borderWidth).
        ].

    ].!
  
drawFrameWith: aPen at: aPoint

    | r region |

    region := aPen setClipRect: (r := aPoint extentFromLeftTop: rect extent).
    self drawBorderWith: aPen in: r.
    aPen destroyRegion: region.

    r extent > ((self borderWidth @ self borderWidth) * 2) ifTrue: [
        region := aPen setClipRect: (r := r insetBy: self borderWidth).
        self drawTitleWith: aPen in: r.
        aPen destroyRegion: region.
    ].!
  
drawTitleTextWith: aPen in: r

    | titleRect |

     titleRect := r leftTop extentFromLeftTop: r width @ self titleHeight.

    self isDialog ifTrue: [
        titleRect := (titleRect leftTop rightAndDown: 1@1) extentFromLeftTop: titleRect extent - (2@0).
    ].
    self hasTitleBar ifTrue: [
        aPen
            fill: titleRect color: (self getSysColor: ColorActivecaption);
            font: SysFont;
            setTextAlign: TaTop;
            foreColor: (self getSysColor: ColorCaptiontext);
            setBackMode: Transparent;
            centerWinText: contents at: titleRect center;
            setBackMode: Opaque.
    ].!
 
drawTitleWith: aPen in: r

    | titleRect b menuRect xPos yPos space |

     titleRect := r leftTop extentFromLeftTop: r width @ self titleHeight.

    self isDialog ifTrue: [
        titleRect := (titleRect leftTop rightAndDown: 1@1) extentFromLeftTop: titleRect extent - (2@0).
    ].
    self hasTitleBar ifTrue: [
        aPen
            fill: titleRect color: (self getSysColor: ColorActivecaption);
            font: SysFont;
            setTextAlign: TaTop;
            foreColor: (self getSysColor: ColorCaptiontext);
            setBackMode: Transparent;
            centerWinText: contents at: titleRect center;
            setBackMode: Opaque;
            foreColor: (self getSysColor: ColorWindowframe);
            lineFrom: titleRect left @ (titleRect bottom up: 1) to: titleRect right @ (titleRect bottom up: 1).
    ].

    (self style includes: #sysmenu) ifTrue: [
        (b := self sysMenuBitmap) displayAt: (titleRect leftTop) with: aPen.
        aPen lineFrom: (titleRect left right: b width) @ titleRect top
            to: (titleRect left right: b width) @ titleRect bottom.
    ].

    (self style includes: #maximize) ifTrue: [
        (b := self maximizeBitmap) displayAt: (titleRect rightTop left: b width) with: aPen.
    ].

    (self style includes: #minimize) ifTrue: [
        (self style includes: #maximize) ifTrue: [
            (b := self minimizeBitmap) displayAt: (titleRect rightTop left: (b width * 2)) with: aPen.
        ] ifFalse: [
            (b := self minimizeBitmap) displayAt: (titleRect rightTop left: b width) with: aPen.
        ].
    ].

    menu notNil ifTrue: [
        menuRect := r left @ titleRect bottom extentFromLeftTop: r width @ self menuHeight.
        aPen
            fill: menuRect color: (self getSysColor: ColorMenu);
            foreColor: (self getSysColor: ColorWindowframe);
            lineFrom: menuRect left @ (menuRect bottom up: 1) to: menuRect right @ (menuRect bottom up: 1);
            foreColor: ColorMenutext.
            xPos := menuRect left right: 6.
            yPos := menuRect top.
            space := aPen stringWidthOf: '  '.

        aPen
            foreColor: (self getSysColor: ColorMenutext);
            setBackMode: Transparent.

        menu allTitles do: [ :t |
            aPen winDrawText: t at: xPos@yPos.
            xPos := xPos right: (aPen stringWidthOf: t) + space.
        ].
        aPen setBackMode: Opaque.
    ].!
 
hasTitleBar

    ^self style includes: #titlebar!
 
iconFile

    ^iconFile!
  
iconFile: aString

    iconFile := aString.!
  
initialize

    super initialize.

    style := #().
    children := OrderedCollection new.!
   
isCompositePane

    ^self realClass inheritsFrom: CompositePane.!

isDialog

    ^self realClass inheritsFrom: WindowDialog!
 
isModal

    ^(self style includes: #modal) | (self style includes: #sysmodal)!
   
isNonWindowParent

    ^self isDialog!

maximizeBitmap

    Maximize isNil ifTrue: [
        Maximize := (Bitmap new fromSysID: ObmZoom).
    ].

    ^Maximize!
  
menuEditor

    ^WBMenubarEditor new!
 
menuHeight

    menu isNil ifTrue: [
        ^0
    ].

    ^(UserLibrary getSystemMetrics: SmCymenu) + 1.!
   
minimizeBitmap

    Minimize isNil ifTrue: [
        Minimize := (Bitmap new fromSysID: ObmReduce).
    ].

    ^Minimize!

modifiedBy

    ^modifiedBy!
  
modifiedBy: aString

    modifiedBy := aString!
   
owner: ignore

    "For Windows Conversion"!
  
realClass: aClass
    super realClass: aClass.
    self children do: [ :child |
        child setWindowClass: aClass
    ].!

storeOn: aStream indentString: indentString

    framingBlock isNil ifTrue: [
        framingBlock := FramingParameters new.
        rect origin = (0@0) ifTrue: [
            framingBlock xC; yC.
        ] ifFalse: [
            framingBlock left: rect left relativeTo: #left; top: rect top relativeTo: #top.
        ].
    ].

    aStream nextPutAll: 'self topPaneClass new'; cr.

    aStream nextPutAll: indentString, 'owner: ',PWindowBuilder secondArg,';'; cr.
    aStream nextPutAll: indentString, 'labelWithoutPrefix:  ', self contents asQuotedString, ';'; cr.
    aStream nextPutAll: indentString, 'noSmalltalkMenuBar'.
    self iconFile notNil ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll:  indentString, 'iconFile: ', self iconFile asQuotedString.
    ].
    self paneName notNil ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll:  indentString, 'viewName: ', self paneName asQuotedString.
    ].
    self storeRectOn: aStream indentString: indentString.
    aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'pStyle: #', self  style asArray asString.
    self createdBy isNil ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll:  indentString, 'createdBy: ',
            ((Smalltalk at: #WindowBuilderUser ifAbsent: [ '' ]), ', ',
            (Smalltalk at: #WindowBuilderCompany ifAbsent: [ '' ]), ' - ',
            Date today asString,' ',Time now asString) asQuotedString
    ] ifFalse: [
        aStream nextPutAll: ';'; cr; nextPutAll:  indentString, 'createdBy: ', self createdBy asQuotedString.
        aStream nextPutAll: ';'; cr; nextPutAll:  indentString, 'modifiedBy: ',
            ((Smalltalk at: #WindowBuilderUser ifAbsent: [ '' ]), ', ',
            (Smalltalk at: #WindowBuilderCompany ifAbsent: [ '' ]), ' - ',
            Date today asString,' ',Time now asString) asQuotedString
    ].
    self handlers keysDo: [ :symbol |
        (self handlers at: symbol) isSymbol ifTrue: [
            aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'when: #', symbol,' perform: #', (self handlers at: symbol).
            ].
    ].

        (self foreColor  ~= self defaultForeColor ) ifTrue: [
            aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'foreColor: ', (ColorConstants keyAtValue: foreColor).
        ].

        ( self realBackColor  ~= self defaultBackColor ) ifTrue: [
            aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'backColor: ', (ColorConstants keyAtValue: backColor).
        ].!
 
storeOn: aStream indentString: indentString mdi: mdi

    framingBlock isNil ifTrue: [
        framingBlock := FramingParameters new.
        rect origin = (0@0) ifTrue: [
            framingBlock xC; yC.
        ] ifFalse: [
            framingBlock left: rect left relativeTo: #left; top: rect top relativeTo: #top.
        ].
    ].

    mdi ifTrue: [
        aStream nextPutAll: 'MDIChild new'; cr;
            nextPutAll: indentString, 'frame: self frame;'; cr.
    ] ifFalse: [
        aStream nextPutAll: 'self topPaneClass new'; cr.
    ].

    aStream nextPutAll: indentString, 'owner: ',PWindowBuilder secondArg,';'; cr.
    aStream nextPutAll: indentString, 'labelWithoutPrefix:  ', self contents asQuotedString, ';'; cr.
    aStream nextPutAll: indentString, 'noSmalltalkMenuBar'.
    self iconFile notNil ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll:  indentString, 'iconFile: ', self iconFile asQuotedString.
    ].
    self paneName notNil ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll:  indentString, 'viewName: ', self paneName asQuotedString.
    ].
    self storeRectOn: aStream indentString: indentString.
    aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'pStyle: #', self  style asArray asString.
    PWindowBuilder recordCreatorInformation ifTrue: [
        self createdBy isNil ifTrue: [
            aStream nextPutAll: ';'; cr; nextPutAll:  indentString, 'createdBy: ',
                ((Smalltalk at: #WindowBuilderUser ifAbsent: [ '' ]), ', ',
                (Smalltalk at: #WindowBuilderCompany ifAbsent: [ '' ]), ' - ',
                Date today asString,' ',Time now asString) asQuotedString
        ] ifFalse: [
            aStream nextPutAll: ';'; cr; nextPutAll:  indentString, 'createdBy: ', self createdBy asQuotedString.
            aStream nextPutAll: ';'; cr; nextPutAll:  indentString, 'modifiedBy: ',
                ((Smalltalk at: #WindowBuilderUser ifAbsent: [ '' ]), ', ',
                (Smalltalk at: #WindowBuilderCompany ifAbsent: [ '' ]), ' - ',
                Date today asString,' ',Time now asString) asQuotedString
        ].
    ].
    self handlers keysDo: [ :symbol |
        (self handlers at: symbol) isSymbol ifTrue: [
            aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'when: #', symbol,' perform: #', (self handlers at: symbol).
            ].
    ].

        (self foreColor  ~= self defaultForeColor ) ifTrue: [
            aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'foreColor: ', (ColorConstants keyAtValue: foreColor).
        ].

        ( self realBackColor  ~= self defaultBackColor ) ifTrue: [
            aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'backColor: ', (ColorConstants keyAtValue: backColor).
        ].!
  
storeRectOn: aStream indentString: indentString

    framingBlock clientRect: self contentRect.

    super storeRectOn: aStream indentString: indentString.!

supportedEvents

     ^self realClass basicNew topPaneClass supportedEvents asSortedCollection!
   
sysMenuBitmap

    | temp w |

    SysMenu isNil ifTrue: [
        temp := (Bitmap new fromSysID: ObmClose).
        w := (UserLibrary getSystemMetrics: SmCxsize).
        SysMenu := Bitmap new ownDCScreenWidth: w height: temp height.
        SysMenu pen
            copyBitmap: temp
            from: (temp boundingBox leftTop extent: ( w @ temp boundingBox height))
            at: 0@0.
    ].

    ^SysMenu!

titleHeight

    self hasTitleBar | (style includes: #minimize) | (style includes: #sysmenu) | (style includes: #maximize) ifTrue: [
        ^(UserLibrary getSystemMetrics: SmCysize) + 1
    ].

    ^0!

titleRectFrom: aPoint

    | titleRect leftIndent rightIndent |

    titleRect := (aPoint extentFromLeftTop: rect extent) insetBy: self borderWidth.
    titleRect := titleRect leftTop extentFromLeftTop: titleRect width @ self titleHeight.

    leftIndent := rightIndent := 0.
    (self style includes: #sysmenu) ifTrue: [
        leftIndent := self sysMenuBitmap width.
    ].

    (self style includes: #maximize) ifTrue: [
        rightIndent := self maximizeBitmap width
    ].
    (self style includes: #minimize) ifTrue: [
        rightIndent := rightIndent + self maximizeBitmap width
    ].

    ^(titleRect left right: leftIndent) @ titleRect top extentFromLeftTop: (titleRect width - rightIndent - leftIndent) @ titleRect height.!
  
usesFont

     ^false!

usesForeColor

    ^false!

usesMenu

    ^self isDialog not!
 
usesTitle

    ^self hasTitleBar! !



!PTextEdit class methods !
 
styleFrom: s

    (s bitIsOn: WsBorder) ifFalse: [
        ^#noBorders
    ] ifTrue: [
        (s bitIsOn: WsHscroll) ifTrue: [
            ^#scrollBars
        ] ifFalse: [ (s bitIsOn: WsVscroll) ifTrue: [
            ^#wordWrap
        ] ifFalse: [
            ^#defaultStyle
        ]].
    ].! !



!PTextEdit methods !
 
defaultFont

    ^PWindowBuilder wbDefaultFont
    "^TextFont"!
  
displayWith: aPen

    aPen fill: self backColor.
    (style == #noBorders) ifTrue: [
        ^self
    ].
    super displayWith: aPen.

    (style == #scrollBars) ifTrue: [
        self displayWithBothScrollBars: aPen.
    ].
    (style == #wordWrap) ifTrue: [
        self displayWithLeftScrollBar: aPen.
    ].!
 
importantEvents

    ^super importantEvents
        addFirst: #textChanged;
        yourself!
   
mutationExceptions

    ^#(CPChildEntryField Toggle CPSpinEditor)!

mutationTypes

    ^#(EntryField StaticText Toggle CPSpinEditor)!
 
styles

    ^#(defaultStyle scrollBars noBorders wordWrap)!
   
winClassStyle

    ^EsAutovscroll | EsMultiline! !



!WBPMenubar class methods ! !



!WBPMenubar methods !
  
allTitles

    ^children collect: [ :n | n title ].!
  
asMenu

    | realMenus |

    realMenus := OrderedCollection new: children size.
    children do: [ :n | realMenus addLast: n asMenu ].

    ^realMenus!

storeOn: aStream indentString: indentString

    children do: [ :m |
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, '    addMenu: ('; cr.
        m storeOn: aStream indentString: indentString, '        '.
        aStream cr; nextPutAll: indentString, '    )'.
    ].! !



!PDrawnButton class methods ! !



!PDrawnButton methods !
   
attributeEditor
    "OSI 12/31/92"
    ^WBFileSelectorEditor
        titled: 'Select Bitmap File'
        filters: #('*.BMP')
        descriptions: #('Bitmap Files (*.BMP)')!
 
bitmapExtent
    "OSI 12/31/92"
    | bitmap extent |
    bitmap := Bitmap fromFile: self contents.
    extent := bitmap extent.
    bitmap release.
    ^extent!
 
changesSize

    ^true!
   
changesTitle

    ^true!
  
defaultBackColor

    ^self getSysColor: ColorBtnface!

defaultFont

    ^PWindowBuilder wbDefaultFont!
   
defaultForeColor

    ^self getSysColor: ColorBtntext!

displayWith: aPen clipRect: r

    | labelOrFileName bitmap |
    labelOrFileName := self contents.
    (self style == #invisible or: [
        labelOrFileName isNil or: [
        labelOrFileName isEmpty ]]) ifTrue: [
        ^self displayGenericWith: aPen clipRect: r
    ].
    (self fileExists: labelOrFileName)
        ifTrue: [ bitmap := Bitmap fromFile: labelOrFileName ]
        ifFalse: [
            bitmap := Bitmap
                screenWidth: self extent x
                height: self extent y.
            bitmap pen
                draw3DButton: (self justFileName: labelOrFileName)
                rect: bitmap boundingBox
                font: (self font isNil ifTrue: [ self defaultFont ] ifFalse: [ self font ])
                foreColor: self foreColor
                backColor: self realBackColor ].
    (style == #fixedSize)
        ifTrue: [
            aPen
                copyBitmap: bitmap
                    from: bitmap boundingBox
                    at: rect origin
                    rule: Srccopy]
        ifFalse: [
            aPen
                copyBitmap: bitmap
                    from: bitmap boundingBox
                    to: rect
                    rule: Srccopy].
    bitmap release.!
   
fileExists: fileName

    | array file exists extension |
    (fileName includes: $*) ifTrue: [ ^false ].
    array := File splitPath: fileName in: Disk.
    ((file := array at: 3) includes: $.) ifFalse: [ ^false ].
    exists := ((file ~= '.') and: [ (file ~= '..') and: [ File exists: fileName ]]).
    exists ifTrue: [
        file := file asStream.
        extension := (file skipTo: $.; upTo: $.) asUpperCase.
        extension = 'BMP' ifTrue: [ ^true ]].
    ^false!
 
importantEvents

    ^super importantEvents
        addFirst: #clicked;
        yourself!
   
isGroupable

    ^true!
   
justFileName: pathName
    | fileName |
    fileName := (File splitPath: pathName in: Disk) at: 3.
    (fileName occurrencesOf: $.) = 1 ifTrue: [
        ^fileName upTo: $.
    ] ifFalse: [
        ^fileName
    ]!
   
minSize
    "OSI 12/31/92"
    ^((style == #fixedSize) and: [ self fileExists: self contents ])
        ifTrue: [ self bitmapExtent ]
        ifFalse: [ 16@16 ]!
   
mutationExceptions

    ^#(Toggle CPHorizontalPictureButton)!
 
mutationTypes

    ^#(Button CPBitmapButton CPBitmapPane)!

readSpecificsFrom: c
    "OSI 12/31/92"
    contents := c cpContents.
    contents isString ifFalse: [ contents := '' ].
    style := c cpStyle.
    style isNil ifTrue: [
        style := self styles first.
    ].!
   
storeContentsOn: aStream indentString: spaceString

    (self usesTitle and: [ self contents notNil and: [ self contents notEmpty ]]) ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'cpContents: '.
        self contents printOn: aStream.
    ].!
  
styles
    ^#(fixedSize stretchToFit invisible)!
   
suggestedSize

    ^(self fileExists: self contents)
        ifTrue: [ self bitmapExtent ]
        ifFalse: [ ((self font wbStringWidth: (self justFileName: self contents)) + 20) @(self font height + 14) ]!
  
usesColor

    ^false!

usesTitle

    ^self style ~= #invisible!
 
winClassStyle

    ^BsOwnerdraw! !



!InterfaceObject class methods !

classAndStyleDict

    ClassAndStyleDict isNil ifTrue: [
        ClassAndStyleDict := Dictionary new.
        ClassAndStyleDict
            at: 128 put: (
                OrderedCollection new
                    add: (Array with: 15 with: BsPushbutton with: Button);
                    add: (Array with: 15 with: BsDefpushbutton with: Button);
                    add: (Array with: 15 with: BsOwnerdraw with: DrawnButton);
                    add: (Array with: 15 with: BsCheckbox with: CheckBox);
                    add: (Array with: 15 with: BsAutocheckbox with: CheckBox);
                    add: (Array with: 15 with: Bs3state with: ThreeStateButton);
                    add: (Array with: 15 with: BsAuto3state with: ThreeStateButton);
                    add: (Array with: 15 with: BsRadiobutton with: RadioButton);
                    add: (Array with: 15 with: BsAutoradiobutton with: RadioButton);
                    add: (Array with: 15 with: BsGroupbox with: GroupBox);
                    yourself
            );
            at: 129 put: (
                OrderedCollection new
                    add: EntryField;
                    add: (Array with: 4 with: EsMultiline with: TextEdit);
                    yourself
            );
            at: 131 put: (
                OrderedCollection new
                    add: ListBox;
                    add: (Array with: 8 with: LbsMultiplesel with: MultipleSelectListBox);
                    yourself
            );
            at: 133 put: ComboBox;
            at: 132 put: (
                OrderedCollection new
                    add: (Array with: 1with: SbsVert with: WBVerticalScrollBar);
                    add: (Array with: 1 with: SbsHorz with: WBHorizontalScrollBar);
                    yourself
            );
            at: 130 put: (
                OrderedCollection new
                    add: (Array with: 15 with:  SsIcon with: StaticGraphic);
                    add: (Array with: 15 with: SsBlackrect with: StaticBox);
                    add: (Array with: 15 with: SsBlackframe with: StaticBox);
                    add: (Array with: 15 with: SsWhiterect with: StaticBox);
                    add: (Array with: 15 with: SsWhiteframe with: StaticBox);
                    add: (Array with: 15 with: SsGrayrect with: StaticBox);
                    add: (Array with: 15 with: SsGrayframe with: StaticBox);
                    add: (Array with: 15 with: SsCenter with: StaticText);
                    add: (Array with: 15 with: SsLeft with: StaticText);
                    add: (Array with: 15 with: SsRight with: StaticText);
                    add: (Array with: 15 with: SsSimple with: StaticText);
                    yourself
            ).
    ].

    ^ClassAndStyleDict!
  
classFrom: c and: s

    | theClass styleList winClass |

    winClass := c.
    winClass isString ifTrue: [
        winClass := (#('BUTTON' 'EDIT' 'STATIC' 'LISTBOX' 'SCROLLBAR' 'COMBOBOX') indexOf: winClass) + 127.
    ].
    theClass := self classAndStyleDict at: winClass ifAbsent: [ PGenericSubpane ].
    theClass isClass ifFalse: [
        styleList := theClass.
        (styleList at: 1) isClass ifTrue: [
            theClass := styleList at: 1.
            styleList := styleList copyFrom: 2 to: styleList size.
        ].
        styleList do: [:a |
            (s bitAnd: (a at: 1)) = (a at: 2) ifTrue: [
                theClass := a at: 3
            ].
        ].
    ].

    ^theClass!
 
clearClassAndStyleDict

    "    InterfaceObject clearClassAndStyleDict     "

    ClassAndStyleDict := nil.!
   
defaultRealClassName

    ^self name copyFrom: 2 to: self name size.!
 
example

    | e n |

    e := super example.
    n:= self defaultRealClassName.
    e style: e defaultStyle;
        contents: n;
        font: e defaultFont;
        extent: e defaultSize;
        realClass:  (Smalltalk at: n asSymbol ifAbsent: [ SubPane ] ).

    ^e!
  
exampleFrom: aClassName

    | e  |

    e := super example.

    e usesTitle ifTrue: [
        e text: aClassName.
    ].

    e style: e defaultStyle;
        font: e defaultFont;
        extent: e defaultSize;
        realClass:  (Smalltalk at: aClassName asSymbol ifAbsent: [ SubPane ] ).

    ^e!

newFromStyle: s classID: classID rect: r text: t resID: id

    | i smalltalkClass theStyle |

    smalltalkClass := self classFrom: classID and: s.

    smalltalkClass = PGenericSubpane ifTrue: [
        i := PGenericSubpane new realClass: SubPane.
    ] ifFalse: [
        i := (WBRealLayoutPane basicNew pseudoClassFor: smalltalkClass name).
        theStyle := i styleFrom: s.
        i := i new.
        i realClass: smalltalkClass.
    ].


    i contents: t;
        rect: r;
        resID: id;
        style: theStyle;
        framingBlock: (
            WBFramingParameters new
                left: r origin x relativeTo: #left;
                right: (r origin x + r extent y ) relativeTo: #left;
                top: r origin y relativeTo: #top;
                bottom: (r origin y + r extent y) relativeTo: #top
        ).

    i font isNil ifTrue: [
        i font: i defaultFont.
    ].

    ^i!
  
purgeCache

    Down notNil ifTrue: [
        Down release.
    ].
    Up notNil ifTrue: [
        Up release.
    ].
    Right notNil ifTrue: [
        Right release.
    ].
    Left notNil ifTrue: [
        Left release.
    ].

    Down := Up := Right := Left := nil.
    self allSubclasses do: [ :c |
        c purgeCache
    ].!
 
styleFrom: s

    ^nil! !



!InterfaceObject methods !
   
autoSizeFrom

    ^#leftJustified!

backColor

    backColor = self defaultBackColor ifTrue: [
        (self parent notNil and: [ self parent backColor ~= ClrChiseledgray ]) ifTrue: [
            ^self parent backColor
        ] ifFalse: [
            ^backColor
        ].
    ] ifFalse: [
        ^backColor
    ].!
 
backColor: c

    backColor := c!
 
changesSize

    ^false!
  
changesTitle

    ^false!
 
contents

    ^contents!
  
contents: c

    c isNil ifFalse: [
        contents := c
    ].!
   
copySpecificsTo: aCopy!
 
cpBackColor

    "Provided for ST/V 1.1 compatibility in Subpanes"

    ^self backColor!

defaultBackColor

    ^self getSysColor: ColorWindow!
 
defaultFont

    ^PWindowBuilder wbDefaultFont!
   
defaultForeColor

    ^self getSysColor: ColorWindowtext!
 
defaultSize

    | s |

    (s := self suggestedSize) notNil ifTrue: [
        ^s
    ].

    ^100@100!
 
defaultStyle

    | s |

    (s := self styles) isNil ifTrue: [
        ^nil
    ] ifFalse: [
        ^s first
    ]!
   
displayGenericWith: aPen clipRect: clipRect

    | aName region  |

    ('AEIOU' includes: self realClass name first) ifTrue: [
        aName := 'An ', self realClass name.
    ] ifFalse: [
        aName := 'A ', self realClass name.
    ].

    aPen
        place: rect origin;
        box: rect corner.

    region := aPen setClipRect: ((rect insetBy: 1) intersect: clipRect).
    aPen
        centerWinText:  aName
        at:  rect center;
        destroyRegion: region.!
   
displayWithBothScrollBars: aPen

    super displayWith: aPen.

    aPen
        fill: ((rect leftTop rightBottom: (rect rightBottom leftAndUp: (self scrollBarWidth @ self scrollBarHeight) - 1)) insetBy: 1)
            color: self backColor.

    self drawVScrollBarWith: aPen
     at: ((rect rightTop left: self scrollBarWidth)
            rightBottom: (rect rightBottom up: self scrollBarHeight - 1)).

    self drawHScrollBarWith: aPen
     at: ((rect leftBottom up: self scrollBarHeight)
            rightBottom: (rect rightBottom left: self scrollBarWidth - 1)).

    aPen
        fill: (((rect rightBottom leftAndUp: (self scrollBarWidth @ self scrollBarHeight)) rightBottom: rect rightBottom) insetBy: 1)
        color: (self getSysColor: ColorScrollbar)!
 
displayWithLeftScrollBar: aPen

    super displayWith: aPen.

    aPen
        fill: ((rect leftTop rightBottom: (rect right left: self scrollBarWidth - 1) @ rect bottom)  insetBy: 1)
            color: self backColor.

    self drawVScrollBarWith: aPen
     at: ((rect rightTop left: self scrollBarWidth)
            rightBottom: (rect rightBottom)).!
  
downArrow

    Down isNil ifTrue: [
        Down := Bitmap new fromSysID: ObmDnarrow.
    ].

    ^Down!
  
drawHScrollBarWith: aPen at: aRect

    | thumbRect nonThumbRect leftArrowRect rightArrowRect arrowWidth |

    arrowWidth := self scrollBarArrowWidth - 1.
    leftArrowRect := (aRect leftTop rightBottom: (aRect left right: arrowWidth) @ aRect bottom).
    rightArrowRect := ((aRect right left: arrowWidth + 1) @ aRect top rightBottom: aRect rightBottom).
    thumbRect := (aRect left right: arrowWidth) @ aRect top rightBottom: (aRect left right: self scrollBarThumbWidth + arrowWidth) @ aRect bottom.
    nonThumbRect := (((aRect left right: arrowWidth + self scrollBarThumbWidth) @ aRect top) rightBottom: (aRect right left: arrowWidth + 1)@ aRect bottom) insetBy: (0@1).
    aPen
        foreColor: ClrBlack;
        fill: (thumbRect insetBy: 2) color: (self getSysColor: ColorBtnface);
        drawRect3DLight: thumbRect;
        fill: nonThumbRect color: self scrollBarColor;
        foreColor: (self getSysColor: ColorWindowframe);
        lineFrom: aRect left @ (aRect bottom up: 1) to: aRect right @ (aRect bottom up: 1);
        lineFrom: aRect leftTop to: aRect rightTop;
        drawRectangle: thumbRect;
        copyBitmap: self leftArrow from: self leftArrow boundingBox to: leftArrowRect;
        copyBitmap: self rightArrow from: self rightArrow boundingBox to: rightArrowRect.!
   
drawVScrollBarWith: aPen at: aRect

    | thumbRect nonThumbRect upArrowRect downArrowRect arrowHeight |

    arrowHeight := self scrollBarArrowHeight - 1.
    upArrowRect := (aRect leftTop rightBottom: aRect right @ (aRect top down: arrowHeight)).
    downArrowRect := (aRect left @ (aRect bottom up: arrowHeight + 1) rightBottom: aRect rightBottom).
    thumbRect := aRect left @ (aRect top down: arrowHeight) rightBottom: aRect right @ (aRect top down: self scrollBarThumbHeight + arrowHeight).
    nonThumbRect := (aRect left @ (aRect top down: arrowHeight + self scrollBarThumbHeight) rightBottom: aRect right @ (aRect bottom up: arrowHeight + 1)) insetBy: (1@0).
    aPen
        foreColor: ClrBlack;
        fill: (thumbRect insetBy: 2) color: (self getSysColor: ColorBtnface);
        drawRect3DLight: thumbRect;
        fill: nonThumbRect color: self scrollBarColor;
        foreColor: (self getSysColor: ColorWindowframe);
        lineFrom: (aRect right left: 1) @ aRect top to: (aRect right left: 1) @ aRect bottom;
        lineFrom: aRect leftTop to: aRect leftBottom;
        drawRectangle: thumbRect;
        copyBitmap: self upArrow from: self upArrow boundingBox to: upArrowRect;
        copyBitmap: self downArrow from: self downArrow boundingBox to: downArrowRect.!
  
extraHandlers

    ^#()!
  
font

    ^font!
  
font: f

    font := f!
   
foreColor

    ^foreColor!

foreColor: c

    foreColor := c!
 
framingBlock

    ^framingBlock!
  
framingBlock: f

    framingBlock := f!
   
fullCopyTo: copy


    copy realClass: self realClass.

    self == copy ifFalse: [
        copy handlers: IdentityDictionary new.
        handlers keysDo: [:k |
            copy handlers at: k put: (handlers at: k).
        ].
    ].

    copy
        paneName: self paneName;
        style: self style;
        font: self font;
        menu: (self menu notNil ifTrue: [ self menu fullCopy ] ifFalse: [ nil ]);
        framingBlock: self framingBlock;
        tabPosition: self tabPosition;
        foreColor: self foreColor;
        backColor: self realBackColor;
        rect: self rect deepCopy.

    copy usesTitle ifTrue: [
        copy contents: self contents.
    ].
    self copySpecificsTo: copy.!
   
generateAllStyles

    ^false!

generateTabStopsAndGroups

    ^self tabPosition isNil or: [ self tabPosition firstInGroup ]!
 
genReceiveWindowMessagesOn: aStream indentString: spaceString

    (self realClass canUnderstand: #receiveAllWindowMessages) ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'receiveAllWindowMessages'.
    ].!

getColors: aWindowBuilder

    ^WBColorDialog new
        foreColor: self foreColor
        backColor: self realBackColor
        paneEdited: self.!
   
getFont: aWindowBuilder
    | fd |
    ^(fd := FontDialog new)
        flags:  fd flags - 256;
        defaultFont: self font;
        open;
        chosen!
  
getSysColor: c

    ^UserLibrary
        getSysColor: c!
 
handlers

    ^handlers!
  
handlers: h

    handlers := Dictionary new.
    h keysDo: [ :key |
        (h at: key) isMessage ifTrue: [
            handlers at: key put: (h at: key) selector.
        ] ifFalse: [ (h at: key) isSymbol ifTrue: [
            handlers at: key put: (h at: key).
        ]].
    ].!
 
hasOtherEditor

    ^(self respondsTo: #attributeEditor)!
 
hitRect

    ^rect!
   
importantEvents

    ^OrderedCollection with: #getContents.!
  
initialize

    super initialize.
    handlers := IdentityDictionary new.

    framingBlock := FramingParameters new
        left: 0 relativeTo: #left;
        right: 0 relativeTo: #left;
        top: 0 relativeTo: #top;
        bottom: 0 relativeTo: #top.

    font := self defaultFont.
    foreColor := self defaultForeColor.
    backColor := self defaultBackColor.!
   
isButton

    ^false!
 
isComposite

    ^self isCompositePane!
   
isCompositePane

    ^false!
  
isFrameObject

    ^false!

isGroupable

    ^false!
  
isGrouper

    ^false!

isInterfaceObject

    ^true!
 
isNonWindowParent

    ^self isComposite!
 
leftArrow

    Left isNil ifTrue: [
        Left := Bitmap new  fromSysID: ObmLfarrow.
    ].

    ^Left!
 
menu

    ^menu!
  
menu: m

    menu := m!
   
menuEditor

    ^WBMenuEditor new!

mutateSpecificsFrom: aPane!
 
mutateTo: aClassName
    "Mutate a pane into another type"
    | class mutation supportedEvents size |
    (Smalltalk includesKey: aClassName asSymbol) ifTrue: [
        class := WBRealLayoutPane basicNew pseudoClassFor: aClassName.
        mutation := class new.
        mutation
            initialize;
            realClass: (Smalltalk at: aClassName asSymbol);
            handlers: IdentityDictionary new.
        supportedEvents := mutation supportedEvents.
        handlers keysDo: [:k |
            (supportedEvents includes: k) ifTrue: [
                mutation handlers at: k put: (handlers at: k)
            ].
        ].
        (mutation styles notNil and: [mutation styles includes: self style]) ifTrue: [
            mutation style: self style
        ] ifFalse: [
            mutation style: mutation defaultStyle
        ].
        mutation usesMenu & self usesMenu ifTrue: [
            mutation menu: (self menu notNil ifTrue: [ self menu fullCopy ] ifFalse: [ nil ])
        ].
        mutation usesColor & self usesColor ifTrue: [
            (self foreColor = self defaultForeColor) ifFalse: [
                mutation foreColor: self foreColor
            ] ifTrue: [
                mutation foreColor: mutation defaultForeColor
            ].
            (self realBackColor = self defaultBackColor) ifFalse: [
                mutation backColor: self realBackColor
            ] ifTrue: [
                mutation backColor: mutation defaultBackColor
            ].
        ].
        mutation usesFont & self usesFont ifTrue: [
            mutation font: self font
        ].
        mutation usesTitle & self usesTitle ifTrue: [
            self contents isNil ifTrue: [
                mutation text: ''
            ] ifFalse: [
                mutation text: self text
            ].
        ].
        mutation
            paneName: self paneName;
            framingBlock: self framingBlock;
            tabPosition: self tabPosition;
            rect: self rect deepCopy.
        (mutation changesSize and: [ (size := mutation suggestedSize) notNil]) ifTrue: [
            mutation rect: (mutation rect extent: size)
        ].
        self mutationRotationList isEmpty ifFalse: [
            (self mutationRotationList includes: aClassName asSymbol) ifTrue: [
                mutation rect: (mutation rect extent: mutation rect extent transpose)
            ].
        ].
        mutation mutateSpecificsFrom: self.
        ^mutation
    ] ifFalse: [
        ^nil
    ].!
  
mutationExceptions

    ^#()!
 
mutationList
    | list |
    self realClass isNil ifTrue: [ ^nil ].
    list := Set new.
    list addAll: self realClass withAllSubclasses.
    self mutationTypes do: [ :className |
        (Smalltalk includesKey: className asSymbol) ifTrue: [
            list addAll: (Smalltalk at: className asSymbol) withAllSubclasses
        ].
    ].
    self mutationExceptions do: [ :className |
        (Smalltalk includesKey: className asSymbol) ifTrue: [
            list remove: (Smalltalk at: className asSymbol)
        ].
    ].
    list remove: self realClass.
    list := (list reject: [ :class | class isWBInternalClass ]) collect: [ :class | class name ].
    (list includes: 'ScrollBar') ifTrue: [
        list
            remove: 'ScrollBar';
            add: 'WBVerticalScrollBar';
            add: 'WBHorizontalScrollBar'.
    ].
    ^list asSortedCollection!
   
mutationRotationList

    ^#()!
   
mutationTypes

    ^#()!
  
paneName

    ^name!
  
paneName: n

    name := n!
   
parent

    ^parentWindow!

parent: anInterfaceObject

    parentWindow := anInterfaceObject.!

preEdit: ignore

    ^true!
   
printOn: aStream

    aStream cr.
    self storeOn: aStream indentString: '    '!

readSpecificsFrom: c!
   
realBackColor

    ^backColor!

realClass

    ^realClass!

realClass: aClass

    realClass := aClass.!
  
realClassName

    ^realClass name!
   
reframe: parentRect

    self rect: (parentRect unLocalizeRect: (framingBlock value: (0@0 extent: parentRect extent)))!
   
removeEvents

    ^#( display ).!
 
requiredPoolDictionaries

    ^#()!
   
resetColors

    "Deal with color changes from the control panel"

    backColor isInteger ifFalse: [
        self backColor: self defaultBackColor.
    ].
    self foreColor isInteger ifFalse: [
        self foreColor: self defaultForeColor.
    ].!
 
resetPen: aPen

    aPen
        down;
        font: SysFont;
        backColor: (self getSysColor: ColorWindow);
        foreColor: (self getSysColor: ColorWindowframe);
        setTextAlign: TaTop!
  
resID

    ^resID!

resID: i

    resID := i!
 
rightArrow

    Right isNil ifTrue: [
        Right := Bitmap new  fromSysID: ObmRgarrow
    ].

    ^Right!
  
scrollBarArrowHeight

    ^UserLibrary
        getSystemMetrics: SmCyvscroll!

scrollBarArrowWidth

    ^UserLibrary
        getSystemMetrics: SmCxhscroll!
 
scrollBarColor

    ^(self getSysColor: ColorScrollbar)!
  
scrollBarHeight

    ^UserLibrary
        getSystemMetrics: SmCyhscroll!
 
scrollBarThumbHeight

    ^UserLibrary
        getSystemMetrics: SmCyvthumb!
 
scrollBarThumbWidth

    ^UserLibrary
        getSystemMetrics: SmCxhthumb!
  
scrollBarWidth

    ^UserLibrary
        getSystemMetrics: SmCxvscroll!
  
setPopupMenu: aRealMenu

    menu := aRealMenu asWBPMenu!
 
setStyleFrom: aRealStyle

    aRealStyle isNil ifTrue: [
        ^self style: self defaultStyle
    ].

    self style: (self class styleFrom: aRealStyle).!
  
setWindowClass: aClass!
 
staysToBack

    ^false!
  
staysWayBack

    ^false!
 
storeColorOn: aStream indentString: indentString
    | colorString |
    (self foreColor  ~= self defaultForeColor ) ifTrue: [
        colorString := ColorConstants keyAtValue: foreColor.
        colorString isNil ifFalse: [
            aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'foreColor: ', colorString.
        ].
    ].

    (self realBackColor notNil and: [ self realBackColor  ~= self defaultBackColor ]) ifTrue: [
        colorString := ColorConstants keyAtValue: self realBackColor.
        colorString isNil ifFalse: [
            aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'backColor: ', colorString.
        ].
    ].!
   
storeContentsOn: aStream indentString: spaceString

    (self usesTitle and: [ self contents notNil]) ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'contents: '.
        self contents printOn: aStream.
    ].!

storeOn: aStream indentString: indentString

    | spaceString |

    spaceString := indentString.

    aStream nextPutAll: spaceString, self realClassName, ' new'; cr.

    spaceString := spaceString, '    '.

    aStream nextPutAll: spaceString, 'owner: ',PWindowBuilder secondArg.

    self storeRectOn: aStream indentString: spaceString.
    self paneName isNil ifFalse: [
        aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'paneName: ''', self paneName asString, ''''.
    ].

    self storeSpecificsOn: aStream indentString: spaceString.

    self storeStyleOn: aStream indentString: spaceString.

    self generateTabStopsAndGroups ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'startGroup'.
        (self usesFocus & self tabPosition notNil)  ifTrue: [
            aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'tabStop'.
        ].
    ].

    self handlers keysDo: [ :symbol |
        (self handlers at: symbol) isSymbol ifTrue: [
            aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'when: #', symbol,' perform: #', (self handlers at: symbol).
            ].
    ].

    self storeContentsOn: aStream indentString: spaceString.

    self menu notNil ifTrue: [
        self genReceiveWindowMessagesOn: aStream indentString: spaceString.
        aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'setPopupMenu: ('; cr.
        self menu storeOn: aStream indentString: spaceString, '    '.
        aStream cr; nextPutAll: spaceString, ')'.
    ].

    (self font wbEquals: self defaultFont) ifFalse: [
        aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'font: ('; cr.
        self font storeOn: aStream indentString: spaceString, '    '.
        aStream cr; nextPutAll: spaceString, ')'.
    ].

    self storeColorOn: aStream indentString: spaceString.


    aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'yourself'.!
 
storeRectOn: aStream indentString: spaceString

        framingBlock initialExtent: self extent.

        aStream nextPutAll: ';'; cr;  nextPutAll: spaceString,'framingBlock: ( '.
        self framingBlock storeOn: aStream indentString: spaceString,'    '.
        aStream nextPutAll: ')'.!

storeSpecificsOn: aStream indentString: aString

    "Subpanes subclass this to write out specific information about themselves
     as source code."!
   
storeStyleOn: aStream indentString: spaceString

    (self style notNil and: [ self generateAllStyles | (self style ~= self defaultStyle) ]) ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: spaceString.
        self style printOn: aStream.
    ].!
  
style

    ^style!

style: s

    style := s!
 
styles

    ^nil!
 
supportedEvents
    | list |
    list := self importantEvents asOrderedCollection.
    list addAll:
        ((self realClass supportedEvents reject: [ :sym |
            (list includes: sym) or: [ self removeEvents includes: sym ]])
            asSortedCollection asArray).
    ^list!
 
tabPosition

    ^tabPosition!

tabPosition: p

    tabPosition := p!
 
text

    ^self contents!
 
text: aString

    self contents: aString!

upArrow

    Up isNil ifTrue: [
        Up := Bitmap new  fromSysID: ObmUparrow
    ].

    ^Up!
  
usesColor

    ^true!
 
usesFocus

    ^true!
 
usesFont

     ^true!
 
usesForeColor

    ^true!
 
usesFraming

    ^true!
   
usesMenu

    ^true!
  
usesTitle

    ^false!

when: e perform: m

    handlers at: e put: m!

winClass

    | c i  |

    "8/2/92 TAP - For default controls we needed to use a numeric value, not a string,
     since Borland's Resource Workshop doesn't honor string class names for built-in
     controls."
    c := self realClass basicNew winClass.
    i := #( 'BUTTON' 'EDIT' 'STATIC' 'LISTBOX' 'SCROLLBAR' 'COMBOBOX') indexOf: c.

    i = 0 ifTrue: [
        ^c
    ] ifFalse: [
        ^127 + i
    ].!
   
winClassStyle

    ^0!

winStyle

    | theStyle |

    theStyle :=
        WsChild   |
        WsVisible |
        WsClipsiblings |
        self winClassStyle |
        self winUserStyle.

    (self tabPosition isNil or: [ self tabPosition firstInGroup ]) ifTrue: [
        theStyle := theStyle | WsGroup.
        (self usesFocus & self tabPosition notNil) ifTrue: [
            theStyle := theStyle | WsTabstop.
        ].
    ].

    ^theStyle!
   
winUserStyle

    ^0! !



!WBMDIAttributesEditor class methods !
 
isWBInternalClass

    ^true! !



!WBMDIAttributesEditor methods !
   
cancel: aPane

    result := nil.
    self close!

currentEvent

    | event |

    event := when.
    (event at: 1) = $* ifTrue: [
        event := event copyFrom: 2 to: event size.
    ].

    ^event asSymbol!
   
events

    ^who supportedEvents asSortedCollection!
  
getValidMethodName: string

    | newString |

    newString := (string select: [ :c | c isAlphaNumeric ]).

    (newString notEmpty and: [ newString first isDigit ]) ifTrue: [
        ^nil
    ].

    ^newString!
 
initWindow

    (self paneNamed: 'toolPane') selection: attributes hasToolPane.
    (self paneNamed: 'statusPane') selection: attributes hasStatusPane.
    (self paneNamed: 'titleText') contents: attributes label.!
  
isWBWindow

    ^true!

ok: aPane

    attributes toolPane: (self paneNamed: 'toolPane') selection.
    attributes statusPane: (self paneNamed: 'statusPane') selection.
    attributes label: (self paneNamed: 'titleText') contents.

    result := attributes.

    self close!
  
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'MDI Attributes';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 576 @ 520; xC; yC; cRDU: (11 @ 510 rightBottom: 565 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 521 @ 168; lDU: 18 r: #left; rDU: 539 r: #left; tDU: 216 r: #top; bDU: 384 r: #top);
                    startGroup;
                    contents: 'Events For:';
                    yourself
            );
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 521 @ 168; lDU: 18 r: #left; rDU: 539 r: #left; tDU: 24 r: #top; bDU: 192 r: #top);
                    startGroup;
                    contents: 'MDI Frame';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 85 @ 32; lDU: 37 r: #left; rDU: 121 r: #left; tDU: 80 r: #top; bDU: 112 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Title:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 110 @ 32; lDU: 89 r: #left; rDU: 199 r: #left; tDU: 272 r: #top; bDU: 304 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'When:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 137 @ 32; lDU: 64 r: #left; rDU: 201 r: #left; tDU: 328 r: #top; bDU: 360 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Perform:';
                    yourself
            );
            addSubpane: (
                StaticBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 311 @ 152; lDU: 210 r: #left; rDU: 521 r: #left; tDU: 216 r: #top; bDU: 368 r: #top);
                    whiteRect;
                    startGroup;
                    yourself
            );
            addSubpane: (
                EntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 393 @ 48; lDU: 128 r: #left; rDU: 521 r: #left; tDU: 72 r: #top; bDU: 120 r: #top; indent: 3 @ 4);
                    paneName: 'titleText';
                    startGroup;
                    tabStop;
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 171 @ 40; lDU: 46 r: #left; rDU: 217 r: #left; tDU: 136 r: #top; bDU: 176 r: #top);
                    paneName: 'toolPane';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #toolPaneChecked:;
                    contents: '&Tool Bar';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 224 @ 40; lDU: 293 r: #left; rDU: 517 r: #left; tDU: 136 r: #top; bDU: 176 r: #top);
                    paneName: 'statusPane';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #statusPaneChecked:;
                    contents: '&Status Pane';
                    yourself
            );
            addSubpane: (
                ComboBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 311 @ 198; lDU: 210 r: #left; rDU: 521 r: #left; tDU: 208 r: #top; bDU: 406 r: #top);
                    dropDownList;
                    startGroup;
                    tabStop;
                    when: #getContents perform: #whoContents:;
                    when: #select perform: #whoSelected:;
                    yourself
            );
            addSubpane: (
                ComboBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 313 @ 200; lDU: 210 r: #left; rDU: 523 r: #left; tDU: 264 r: #top; bDU: 464 r: #top);
                    paneName: 'when';
                    dropDownList;
                    startGroup;
                    tabStop;
                    when: #getContents perform: #whenContents:;
                    when: #select perform: #whenSelected:;
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 311 @ 48; lDU: 210 r: #left; rDU: 521 r: #left; tDU: 320 r: #top; bDU: 368 r: #top; indent: 3 @ 4);
                    paneName: 'perform';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #performContents:;
                    when: #textChanged perform: #performChanged:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 165 @ 56; lDU: 18 r: #left; rDU: 183 r: #left; tDU: 392 r: #top; bDU: 448 r: #top);
                    idOK;
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 165 @ 56; lDU: 201 r: #left; rDU: 366 r: #left; tDU: 392 r: #top; bDU: 448 r: #top);
                    idCancel;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: '&Cancel';
                    yourself
            );
        yourself
    ).

    self openWindow!
 
openOn: a

    result := a.
    attributes := a deepCopy.
    eventDict := attributes frameEvents.

    who := Smalltalk at: #MDIFrame ifAbsent: [ self error: 'MDI not installed' ].
    when := self events first.

    self open.!
  
performChanged: aPane

    (self getValidMethodName: aPane contents) = (eventDict at: self currentEvent ifAbsent: ['']) asString ifTrue: [
        ^self
    ].

    self saveWhenPerform.!
   
performContents: aPane

    self updateWhoEvents.

    eventDict isNil ifTrue: [
        aPane contents: ''.
    ] ifFalse: [
        aPane contents: (eventDict at: self currentEvent ifAbsent: [ '' ]).
    ].!
   
result

    ^result!
  
saveWhenPerform

    | methodName savedSelection perform |

    perform := self paneNamed: #perform.


    perform contents hasContent ifTrue: [

        methodName := self getValidMethodName: perform contents.
        (perform contents = methodName) ifFalse: [
            savedSelection := perform getSelection.
            perform contents: methodName.
            perform setSelectionFrom: savedSelection origin x - 1 to: savedSelection corner x - 1.
        ].
        methodName isNil ifFalse: [
            eventDict at: self currentEvent put: (methodName, ':') asSymbol.
        ].
    ] ifFalse: [
        eventDict removeKey: self currentEvent ifAbsent: [].
    ].

    self updateEvents: true.!
 
statusPaneChecked: aPane

    attributes hasStatusPane: aPane selection.
    self updateWho.!

toolPaneChecked: aPane

    attributes hasToolPane: aPane selection.
    self updateWho.!

updateEvents: refresh

    | oldEvents theEvents sel whenCombo perform |


    whenCombo := self paneNamed: #when.
    perform := self paneNamed: #perform.

    oldEvents := whenCombo contents.
    theEvents := who supportedEvents asArray.

    eventDict isNil ifTrue: [
        theEvents := #().
    ] ifFalse: [
        theEvents := theEvents collect: [:e |
            (eventDict at: e ifAbsent: [ nil ]) isSymbol ifTrue: [ '*', e ] ifFalse: [ e asString ].
        ].
    ].

    theEvents := theEvents asSortedCollection asOrderedCollection.
    theEvents = oldEvents ifTrue: [
        ^self
    ].

    refresh ifTrue: [
        sel := whenCombo selectedItem.
        (sel notNil and: [ sel notEmpty ]) ifTrue: [
            sel first = $* ifTrue: [
                sel := sel copyFrom: 2 to: sel size.
            ].
            perform contents notEmpty ifTrue: [
                sel := '*', sel.
            ].
        ].

        whenCombo
            contents: theEvents;
            selectItem: sel;
            invalidateRect: whenCombo rectangle.
    ] ifFalse: [
        whenCombo
            contents: theEvents;
            selection: 1.
    ].

    when := whenCombo selectedItem.!

updateWho

    self changed: #whoContents:.!
  
updateWhoEvents

    who == (Smalltalk at: #MDIFrame ifAbsent: [ nil ]) ifTrue: [
        eventDict := attributes frameEvents.
    ] ifFalse: [
        who == (Smalltalk at: #ToolPane ifAbsent: [ nil ]) ifTrue: [
            eventDict := attributes toolPaneEvents
        ] ifFalse: [
            eventDict := attributes statusPaneEvents.
        ].
    ].!
 
whenContents: aPane

    self updateEvents: false.!
   
whenSelected: aPane

    when := aPane selectedItem.
    self changed: #performContents:.!
   
whoContents: aPane

    | strings |

    strings := OrderedCollection with: 'MDIFrame'.

    attributes hasToolPane  ifTrue: [
        strings add: 'ToolPane'
    ].

    attributes hasStatusPane ifTrue: [
        strings add: 'StatusPane'
    ].

    aPane
        contents: strings;
        selection: strings first.

    self whoSelected: aPane!
  
whoSelected: aPane

    aPane selectedItem isNil ifTrue: [ ^nil ].
    who := Smalltalk at: aPane selectedItem asSymbol.
    self updateWhoEvents.
    when := self events first.
    self
        changed: #whenContents:;
        changed: #performContents:.! !



!WBTabPosition class methods !

fromTabPosition: anInteger

    ^WBTabPosition new
        basicTabPosition: anInteger!
  
new

    ^super new initialize.! !



!WBTabPosition methods !

<= aTabPosition

    (aTabPosition basicTabPosition > basicTabPosition) ifTrue: [
        ^true
    ].

    (aTabPosition basicTabPosition = basicTabPosition) &
    (aTabPosition groupPosition notNil & groupPosition notNil and: [
        (aTabPosition groupPosition > groupPosition)
    ]) ifTrue: [
        ^true
    ].

    ^false!
  
>= aTabPosition

    (aTabPosition basicTabPosition < basicTabPosition) ifTrue: [
        ^true
    ].

    (aTabPosition basicTabPosition = basicTabPosition) &
    (aTabPosition groupPosition notNil & groupPosition notNil and: [
        aTabPosition groupPosition < groupPosition
    ]) ifTrue: [
        ^true
    ].

    ^false!

basicTabPosition

    ^basicTabPosition!
  
basicTabPosition: anObject

    basicTabPosition := anObject!
 
firstInGroup

    ^groupPosition isNil | (groupPosition = 1)!
 
groupPosition

    ^groupPosition!

groupPosition: anObject

    groupPosition := anObject!
   
inGroup

    ^groupPosition notNil!
   
initialize

    basicTabPosition := 0!

makeFirstInGroup

    groupPosition := 1.!

nextBasicTabPosition

    ^WBTabPosition new
            basicTabPosition: basicTabPosition + 1!
 
nextTabPosition

    groupPosition notNil ifTrue: [
        ^WBTabPosition new
            basicTabPosition: basicTabPosition;
            groupPosition: groupPosition + 1
    ] ifFalse: [
        ^WBTabPosition new
            basicTabPosition: basicTabPosition + 1
    ].!
 
printOn: aStream

    aStream nextPutAll: basicTabPosition asString.
    groupPosition notNil ifTrue: [
        aStream nextPutAll: '.', groupPosition asString.
    ].!
   
withinGroup

    ^self inGroup & self firstInGroup not! !



!PEntryField class methods !
 
exampleFrom: aClass

    | e |

    e := super exampleFrom: aClass.
    e contents: ''.

    ^e!
 
styleFrom: s

    (s bitIsOn: EsPassword) ifTrue: [
        ^#password
    ].
    ^#defaultStyle! !



!PEntryField methods !
  
changesSize

    ^true!
   
contents: c
    (c notNil and: [ c isEmpty ])
        ifTrue: [ contents := nil ]
        ifFalse: [ super contents: c ]!

defaultSize

    ^100 @ self suggestedSize y!
 
displayWith: aPen

    | region displayContents |

    aPen
        fill: (rect insetBy: 1) color: self backColor;
        foreColor: (self getSysColor: ColorWindowframe);
        place: rect origin;
        box: rect corner.

    "Draw the initialization text"
    self contents isNil
        ifFalse: [
            displayContents := (style == #password)
                ifTrue: [ self contents copy atAllPut: $* ]
                ifFalse: [ self contents ].
            region := aPen setClipRect: (rect insetBy: 3).
            aPen
                font: self font;
                foreColor: self foreColor;
                backColor: self backColor.
            self justification == #left ifTrue: [
                aPen
                    displayText: displayContents at: (rect insetBy: 4@4) leftTop
            ] ifFalse: [ self justification == #right ifTrue: [
                aPen
                    displayText: displayContents
                    at: ((rect insetBy: 4@4) rightTop left: (aPen stringWidthOf: displayContents))
            ] ifFalse: [
                aPen centerText: displayContents at: rect center
            ]].
            aPen destroyRegion: region.
        ].!
  
framingBlock: f

    f indent: 0@0.
    super framingBlock: f.!
  
genReceiveWindowMessagesOn: aStream indentString: spaceString

    "Don't generate method for EntryField or ListBox - they already have it"!
  
importantEvents

    ^super importantEvents
        addFirst: #textChanged;
        yourself!
   
justification

    ^#left!

maxSize

    ^32000@(self suggestedSize y)!
   
minSize

    ^1@ self suggestedSize y!

mutationExceptions

    ^#(CPChildEntryField Toggle CPSpinEditor)!

mutationTypes

    ^#(EntryField StaticText Toggle CPSpinEditor)!
 
readSpecificsFrom: c

    (c propertyAt: #readonly) isNil ifFalse: [ self style: #readonly ]!
 
reframe: parentRect

    super reframe: parentRect.

    rect extent: ((rect extent max: self minSize) min: self maxSize)!
  
storeRectOn: aStream indentString: indentString

        framingBlock indent: 3@4.
        super storeRectOn: aStream indentString: indentString.!
   
styles

    ^#(defaultStyle password readonly)!
   
suggestedSize

    ^rect width @ (self font height + 8).!
 
usesTitle

    ^true!
 
winClassStyle

    ^EsAutohscroll | EsNohidesel | WsBorder! !



!WBMenuTester class methods !

isWBInternalClass

    ^true! !



!WBMenuTester methods !

isWBWindow

    ^true!

menubar: aMenuList

    menus := aMenuList.!
  
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := TopPane new
            owner: self;
            labelWithoutPrefix:  'Testing Menubar...';
            noSmalltalkMenuBar;
            framingBlock: ( FramingParameters new iDUE: 800 @ 208; xC; yC; cRDU: (3 @ 168 rightBottom: 797 @ 2));
            pStyle: #(sysmenu titlebar);
        yourself
    ).

    self openWindow!
   
perform: selector
    "Scratch windows should not perform any events"
    ^MessageBox messageNote: 'Menu item selector: #',selector!
  
preInitWindow

    | mw |

    mw := MenuWindow new.
    menus notNil ifTrue: [
        menus do: [ :m |
            m allOwners: self.
            mw addMenu: m.
        ].
    ].

    mw owner: self.

    self mainView menuWindow: mw.! !



!WBDefaultScratchWindow class methods !

isWBInternalClass

    ^true! !



!WBDefaultScratchWindow methods !
  
createViews

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'New Window';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 686 @ 400; xC; yC; cRDU: (9 @ 392 rightBottom: 677 @ 46));
            pStyle: #(sysmenu sizable titlebar minimize maximize);
        yourself
    ).!
   
isWBWindow

    ^true! !



!WBLayoutPane class methods !
 
isWBInternalClass

    ^true!
 
supportedEvents

    ^super supportedEvents
        add: #cursorUnloaded;
        add: #selectionChanged;
        add: #operationOccurred;
        add: #changed;
        add: #editPane;
        add: #gettingFocus;
        add: #rightButtonDown;
        yourself! !



!WBLayoutPane methods !
   
aboutToSaveImage

    graphicsTool release.
    super aboutToSaveImage.!
 
alignAll: alignBlock

    | deltaList |

    deltaList := OrderedCollection new.
    selectedPanes do: [ :p |
        deltaList addLast:  (alignBlock value: p)
    ].


    self doAlign: deltaList.!

alignBottom

    | alignAgainst  |

    rubberBandSelected ifTrue: [
        "Ambiguous selection - choose bottom most pane"
        alignAgainst := self topMostCoord.
        selectedPanes do: [ :p |
            alignAgainst := alignAgainst lowerOf:  p rect bottom.
        ].
    ] ifFalse: [
        alignAgainst := selectedPanes first rect bottom.
    ].


    self alignAll: [:pane | 0 @ (alignAgainst - pane rect bottom) ].!
   
alignCenterHorizontal

    | leftMost rightMost fullWidth |

    leftMost := 32000.
    rightMost := 0.
    selectedPanes do: [ :p |
        rightMost := p rect right rightMost: rightMost.
        leftMost := p rect left leftMost: leftMost.
    ].

    fullWidth := rightMost - leftMost.

    self alignAll: [:p | (leftMost + ((fullWidth - p rect width) // 2) - p rect left) @ 0 ].!
 
alignCenterVertical

    | topMost bottomMost fullHeight |

    topMost         := self bottomMostCoord.
    bottomMost   := self topMostCoord.
    selectedPanes do: [ :p |
        bottomMost := p rect bottom lowerOf: bottomMost.
        topMost := p rect top higherOf: topMost.
    ].

    fullHeight := (bottomMost - topMost) abs.

    self alignAll: [:p | 0@(((topMost down: ((fullHeight - p rect height)// 2))) - p rect top)].!

alignDistributeHorizontal

    | leftMost rightMost totalPaneWidth previousPos space deltaList first |

    first := selectedPanes first.
    leftMost := 32000.
    rightMost := 0.
    totalPaneWidth := 0.
    selectedPanes do: [ :p |
        rightMost := p rect right rightMost: rightMost.
        leftMost := p rect left leftMost: leftMost.
        totalPaneWidth := totalPaneWidth + p rect width.
    ].

    space := (rightMost - leftMost - totalPaneWidth) // (selectedPanes size - 1).

    selectedPanes := (selectedPanes asSortedCollection: [ :a :b |
        a rect left isLeftOf: b rect left
    ]) asOrderedCollection.

    previousPos := selectedPanes first rect left.

    deltaList := OrderedCollection new.
    selectedPanes do: [ :p |
        deltaList addLast:  (previousPos - p rect left)@0.
        previousPos := previousPos + space + p rect width.
    ].

    self doAlign: deltaList.
    selectedPanes
        remove: first;
        addFirst: first.!

alignDistributeVertical

    |  topMost bottomMost totalPaneHeight previousPos space deltaList first |

    first := selectedPanes first.
    topMost := self bottomMostCoord.
    bottomMost := self topMostCoord.
    totalPaneHeight := 0.
    selectedPanes do: [ :p |
        bottomMost := p rect bottom lowerOf: bottomMost.
        topMost := p rect top higherOf: topMost.
        totalPaneHeight := totalPaneHeight + p rect height.
    ].

    space := ((bottomMost - topMost) abs - totalPaneHeight) // (selectedPanes size - 1).

    deltaList := OrderedCollection new.

    selectedPanes := (selectedPanes asSortedCollection: [ :a :b |
        a rect top isAbove: b rect top
    ]) asOrderedCollection.

    previousPos := selectedPanes first rect top.
    selectedPanes do: [ :p |
        deltaList addLast:  0@(previousPos - p rect top).
        previousPos := (previousPos down: space) down: p rect height.
    ].

    self doAlign: deltaList.
    selectedPanes
        remove: first;
        addFirst: first.!
  
alignLeft

    | alignAgainst |

    rubberBandSelected ifTrue: [
        "Ambiguous selection - align against leftmost pane in selection"
        alignAgainst := 32000.
        selectedPanes do: [ :p |
            alignAgainst := p rect left leftMost: alignAgainst.
        ].
    ] ifFalse: [
        alignAgainst := selectedPanes first rect left.
    ].

    self alignAll: [:p | (alignAgainst - p rect left)@0 ].!
 
alignRight

    | alignAgainst |

    rubberBandSelected ifTrue: [
        "Ambiguous selection - align against rightmost pane in selection"
        alignAgainst := 0.
        selectedPanes do: [ :p |
            alignAgainst := p rect right rightMost: alignAgainst.
        ].
    ] ifFalse: [
        alignAgainst := selectedPanes first rect right.
    ].



    self alignAll: [:p | (alignAgainst - p rect right)@0 ].!
   
alignTop

    | alignAgainst |

    rubberBandSelected ifTrue: [

        "Ambiguous selection - align against topmost pane in selection"
        alignAgainst := self bottomMostCoord.
        selectedPanes do: [ :p |
            alignAgainst := p rect top higherOf: alignAgainst.
        ].
    ] ifFalse: [
        alignAgainst := selectedPanes first rect top.
    ].
    self alignAll: [:p | 0@(alignAgainst - p rect top) ].!
   
autosizeSelection

    | deltaList s gridSize |

    deltaList := OrderedCollection new.
    gridSize := self gridSize.

    selectedPanes do: [ :p |
        (s := p suggestedSize) isNil ifTrue: [
            deltaList addLast:  0.
        ] ifFalse: [
            "Grid the autosize"
            s := ((s x roundTo: gridSize x) @ (s y roundTo: gridSize y)).
            deltaList addLast: s - p extent
        ].
    ].

    self doAutosize: deltaList.!
 
bottomMostCoord

    self isPM ifTrue: [
        ^0
    ] ifFalse: [
        ^30000
    ].!
   
bringPaneToFront: c

    | firstBackPane |
    panes remove: c.

    firstBackPane := panes detect: [ :pane | pane staysToBack ] ifNone: [ nil ].
    c staysToBack ifTrue: [
        firstBackPane isNil ifTrue: [
            panes addLast: c
        ] ifFalse: [
            panes add: c before: firstBackPane
        ].
    ] ifFalse: [
        panes addFirst: c
    ].

    self updateRect: c rect.!

bringToFront

    self
        event: #changed;
        hideSelectionDots;
        bringPaneToFront: selectedPanes first;
        showSelectionDots.!
 
buildWindow: arg

    InterfaceObject purgeCache.
    super buildWindow: arg!

button1DoubleClick: aPoint

    self event: #editPane.!
   
button1Down: aPoint

    self button1Down: aPoint shifted: (Notifier isKeyDown: VkControl)!
   
button1Down: aPoint shifted: isShifted

    | child |


    self event: #gettingFocus.

    "Are they sizing the edited pane?"
    ((self sizeDotRect expandBy: 2) containsPoint: aPoint) ifTrue: [
        ^self sizeWindowFrom: aPoint
    ].

    "The cursor is loaded, place some panes"
    loadedPanes notNil ifTrue: [
        self placeLoadedPanesAt: aPoint resetCursor: true.
        self event: #cursorUnloaded.
        self checkSelectionChanged.
        ^loadedPanes := nil
    ].

    "Check if they're sizing a child pane"
    selectedPanes do: [:w |
        (self sizePane: w from: aPoint) ifTrue: [
            self checkSelectionChanged.
            ^self
        ].
    ].

    child := self paneHitBy: aPoint.

    isShifted ifTrue: [
        self toggleSelect: child.
    ] ifFalse: [
        child == editedPane ifFalse: [
            self dragSelectedPanesFrom: aPoint childHit: child.
        ] ifTrue: [
            self dragSelectFrom: aPoint.
        ].
    ].

    selectionHasChanged ifTrue: [
            (selectedPanes size > 0 and: [ self referencePane ~= selectedPanes first ]) ifTrue: [
                self referenceClear
            ]].
    self checkSelectionChanged.!
   
button1DownShift: aPoint

    self button1Down: aPoint shifted: true!
 
button2Down: aPoint

    self event: #gettingFocus.

    loadedPanes isNil ifTrue: [
        ^self event: #rightButtonDown

    ] ifFalse: [
        self placeLoadedPanesAt: aPoint resetCursor: false.

        "They may place again, so copy the loaded subpanes."
        loadedPanes := Array
            with: ((loadedPanes at: 1) collect: [ :aPane | aPane fullCopy ])
            with: (loadedPanes at: 2).
    ].

    self checkSelectionChanged.!

checkSelectionChanged

    selectionHasChanged ifTrue: [
        self event: #selectionChanged.
        selectionHasChanged := false.
    ].!
  
clear

    self event: #clear.
    self doClear: nil.!
   
clipboard

    ^Clipboard!

clipboard: anObject

    Clipboard := anObject!
   
clipRect

    ^0@0 extent: 10000@10000!
   
colorChange
        "Private - Window's color has changed."
    editedPane notNil ifTrue: [
        editedPane resetColors.
        panes do: [ :p |
            p resetColors.
        ].
        self invalidateRect: self rectangle.
    ].!
 
copy

    self clipboard:
        ((self getCopyStructure: [ :aPane | aPane fullCopy. ]) at: 1)!
 
currentClipRect

    | clipbox |
    clipbox := WinRectangle new.
    (GDILibrary
        getClipBox: self pen handle
        rectangle: clipbox asParameter).
    clipbox := clipbox asRectangle.

    ^clipbox!
  
cut

    self copy.
    self clear.!
 
defaultCursor

    loadedPanes notNil ifTrue: [
        ^CursorManager crossHair
    ] ifFalse: [
        ^CursorManager arrow
    ].!

disableSelectionDots

    KeepDotsHidden := true.!

display

     | region aRect |

    region := self pen setClipRect: (aRect := self currentClipRect).
    editedPane drawFrameWith: self pen at: self editedPaneFrameLeftTop.
    self updateRect: aRect.
    self pen destroyRegion: region.

    "Since we may end up displaying as the result of a arrow key
     move, we don't want to show the selection dots."

    KeepDotsHidden | self drawToBitmap ifFalse: [
        self showSelectionDots.
        self showSizeDot.
   ].!
 
displayPane: p clipRect: r

    | region clipRect |

    p resetPen: self pen.

    region := self pen setClipRect: (clipRect := r intersect: p rect).
    p displayWith: self pen clipRect: clipRect.
    self pen destroyRegion: region.!
 
doAlign: aDeltaList

    self hideSelectionDots.
    self moveSelectionByDeltaList: aDeltaList.
    self showSelectionDots.!

doAutosize: aDeltaList

    self doDeltaSize: aDeltaList op: #autosize.!
  
doByPixel: selector

    "Private - Process an arrow (cursor movement) key."

    self hideSelectionDots.
    self perform: selector.
    self showSelectionDots.!

doClear: ignore

    | selectedRect savedInfo |

    selectedRect := self selectedRect.

    self hideSelectionDots.
    savedInfo := self getCopyStructure: [:p | p ].

    selectedPanes do: [ :aPane |
        panes remove: aPane.
    ].
    selectedPanes := OrderedCollection new.
    selectionHasChanged := true.

    self updateRect: selectedRect.
    self showSelectionDots.

    self lastOperation: #clear savedInfo: savedInfo.
    self checkSelectionChanged.
    self event: #changed.

    self referenceClear.!
 
doDeltaSize: aDeltaList op: anOp

    self hideSelectionDots.
    self sizeSelectionByDeltaList: aDeltaList op: anOp.
    self showSelectionDots.!
  
doMove: aDelta

    self hideSelectionDots.
    self moveSelectionByDelta: aDelta.
    self showSelectionDots.!
 
doReplicateSize: aDeltaList

    self doDeltaSize: aDeltaList op: #replicateSize.!

doSize: newRect

    self hideSelectionDots.
    self sizeSelectionToRect: newRect.
    self showSelectionDots.!

doSizeWindow: newExtent

    self lastOperation: #sizeWindow savedInfo: self editedPaneFrameRect extent.

    editedPane extent: newExtent.

    self scrollPane windowHasSized.

    panes do: [:p |
        p reframe: self editedPaneContentRect.
    ].

    self invalidateRect: nil; updateWindow.
    self setFocus.!
   
dragRect: aRect from: aPoint constrainedBy: constrainRect gridSize: aGridSize withMethod: method

    | mouseLoc  moveRect  newPoint delta region minMove movedEnough |

    minMove := 3@3.
    movedEnough := false.

    self captureMouseInput.
    moveRect := aRect.

    mouseLoc := aPoint.

    delta := aPoint - moveRect leftTop.
    region := self pen setClipRect: self clipRect.

    self pen drawFocusRect: moveRect.

    Notifier consumeInputUntil: [ :e |
        (e selector = #button1Move:) | (e selector = #button2Move:)  ifTrue: [
            mouseLoc := e arguments first.
         ].

        newPoint := (mouseLoc leftAndUp: constrainRect leftTop) - delta.

        newPoint := (newPoint // aGridSize * aGridSize) rightAndDown: constrainRect leftTop.

        newPoint x: ((newPoint x rightMost: constrainRect left) leftMost: (constrainRect right left: moveRect width)).
        newPoint y: ((newPoint y lowerOf: constrainRect top) higherOf: (constrainRect bottom up: moveRect height)).

        (movedEnough or: [ (newPoint + delta - aPoint) x abs > minMove x or: [ (newPoint + delta - aPoint) y abs > minMove y ]]) ifTrue: [
            movedEnough := true.
            (newPoint = moveRect leftTop) ifFalse: [
                self pen drawFocusRect: moveRect.
                moveRect moveToLeftTop: newPoint.
                method isNil ifFalse: [
                    self perform: method withArguments: (Array with: moveRect).
                ].
                self pen drawFocusRect: moveRect.
            ].
        ].
        (e selector = #button1Up:) | (e selector = #button2Up:)
    ].

    self pen drawFocusRect: moveRect.
    self clearMouseCapture.

    self pen destroyRegion: region.

     ^moveRect leftTop!
   
dragSelectedPanesFrom: aPoint childHit: aChild

    | delta selectedRect oldOrigin |

    self hideSelectionDots.

    (selectedPanes includes: aChild) ifFalse: [
        selectedPanes := OrderedCollection with: aChild.
        selectionHasChanged := true.
    ].

    selectedRect := self selectedRect.
    oldOrigin := selectedRect leftTop.

    CursorManager crossHair changeFor: [
        delta := (      self
            dragRect: selectedRect
            from: aPoint
            constrainedBy: ( self editedPaneContentLeftTop extentFromLeftTop: editedPane contentRect extent)
            gridSize: self gridSize
            withMethod: #updatePosition:) - oldOrigin.
    ].

    self moveSelectionByDelta: delta.

    self showSelectionDots.!
  
dragSelectFrom: aPoint

    | selectedRect containedPanesHit |

    self unselectAll.
    selectedRect := self
            rubberBandRect:    (aPoint rightBottom: aPoint)
            from:               aPoint
            inDirection:        #downRight
            constrainedBy:    self editedPaneFrameRect
            minimumSize:        nil
            maximumSize:        nil
            foldOver:           true
            gridSize:          1@1
            withMethod:         nil.

    (containedPanesHit := panes select: [:c | c hitRect intersects: selectedRect ]) isEmpty ifFalse: [
        self select: containedPanesHit.
    ].!
  
drawGrid
    ^self owner drawGrid!
 
drawGrid: bool
    self owner drawGrid: bool!
  
drawGridWithin: aRect

        | contentRect left right top bottom p gridSize |

        gridSize := self gridSize.
        self drawGrid ifFalse: [ ^self ].

        contentRect := self editedPaneContentRect.

        left := ((aRect left - contentRect left) truncateTo: gridSize x) + contentRect left.
        right := aRect right.
        top := ((aRect top - contentRect top) truncateTo: gridSize y) + contentRect top.
        bottom := aRect bottom.

        editedPane backColor == ClrPalegray ifTrue: [
            self pen foreColor: ClrDarkgray
        ] ifFalse: [
             self pen foreColor: ClrPalegray
       ].

        p := self pen.
        left to: right by: gridSize x do: [ :curX |
            p lineFrom: curX @ top to: curX @ bottom.
        ].
        top to: bottom by: gridSize y do: [:curY |
            p lineFrom: left @ curY to: right @ curY.
        ].!
   
drawToBitmap

    ^false!
 
duplicate

    self referencePoint isNil ifTrue: [
        self referencePoint: self paneToReplicate rect leftTop.
    ].
    self referencePane: self paneToReplicate.

    self copy.
    self paste.
    self placeDuplicatePane.!
  
duplicateOffset
    | grid |
    grid := self gridSize.
    ^self paneToReplicate rect leftTop rightAndDown:
            ((10 roundTo: grid x) @ (10 roundTo: grid y))!
 
editedPane

    ^editedPane!
  
editedPaneContentLeftTop

    ^self editedPaneFrameLeftTop + (editedPane contentRect leftTop - editedPane rect leftTop)!
  
editedPaneContentRect

    ^self editedPaneContentLeftTop extentFromLeftTop: editedPane contentRect extent!
   
editedPaneFrameLeftTop

    ^self margin@self margin!
 
editedPaneFrameRect

    ^self editedPaneFrameLeftTop extentFromLeftTop: editedPane frameExtent!
  
enableSelectionDots

    KeepDotsHidden := false.!

exportedPanes

    "Pass out the list of panes, setting up their rects to be
     relative to the edited pane's bottom left, not the layout pane's."

    | newPanes thePane|

    newPanes := panes collect: [ :p |
        thePane := p fullCopy.
        thePane rect: ((thePane rect leftTop leftAndUp:  self editedPaneContentRect leftBottom negated) extentFromLeftTop: thePane rect extent).
        thePane
    ].

    ^newPanes!

fullRectForPanes: paneList

    | left right top bottom rect |

    right  := 0.
    bottom := self topMostCoord.
    left  := 30000.
    top := self bottomMostCoord.

    paneList do: [:p |
        left    := p rect leftTop x leftMost: left.
        right   := p rect rightBottom x rightMost: right.
        top     := p rect leftTop y higherOf: top.
        bottom  := p rect rightBottom y lowerOf: bottom.
    ].

    ^left@top rightBottom: right@bottom.!
  
getCopyStructure: copyBlock

    "This routine saves 3 pieces of information:
      A) an ordered collection of the panes that were removed
      B) an ordered collection of the relative positions of each of these
         panes to the upper left corner of the rectangle containing them all.
      C) the origin of that rectangle

    The structure for this is:
        Array [1]  =   Array [1] : A
                       Array [2] : B
        Array [2] : C "

    | topLeft savedPanes |

    savedPanes := Array new: 2.

    savedPanes at: 1 put: (
        selectedPanes collect: copyBlock
    ).

    "Collect the origins of the panes to copy, relative to
     each other (thus upleftmost panes will be at 0@0)."

    topLeft := self selectedRect leftTop.
    savedPanes at: 2 put: (selectedPanes collect: [ :aPane |
        aPane rect leftTop - topLeft
    ]).

    ^Array with: savedPanes with: topLeft.!
   
getGraphicsTool
        "Private - Answer a graphics tool for the receiver."
    | dc |

    dc := self getDC.
    ^graphicsTool := Pen forDC: dc medium: self!

gridSize
    ^self owner gridSize!
 
gridSize: newSize
    self owner gridSize: newSize!

hideSelectionDots

    selectedPanes do: [:p |
        self hideSelectionDotsOn: p.
    ].!
 
hideSelectionDotsOn: p

    self showSelectionDotsOn: p.!
 
hideSizeDot

    self pen execute: [
        self pen
            fill: self sizeDotRect color: ClrWhite
    ] clipRect: self clipRect.!
   
importPanes: paneList

   ^paneList collect: [ :s |
        s rect: ((s rect leftTop leftAndUp: self editedPaneContentRect leftBottom) extentFromLeftTop: s rect extent).
    ].!
   
initialize

    super initialize.
    panes := OrderedCollection new.
    selectedPanes   := OrderedCollection new.
    KeepDotsHidden := false.
    selectionHasChanged := false.
    inTabEdit := false.
    rubberBandSelected := false.!

isPM

    ^false!
 
lastOperation: aSymbol savedInfo: savedInfo

    lastOperation := aSymbol.
    undoInfo := savedInfo.
    self checkSelectionChanged.
    self event: #operationOccurred.!
 
lastOpSymbol

    ^lastOperation!
 
loadCursor: aTool

    aTool isNil ifTrue: [
        loadedPanes := nil.
        CursorManager normal change.
    ] ifFalse: [
        loadedPanes := Array with: (Array with: aTool) with: (Array with: 0@0).
    ].!
   
margin

    ^8!
   
moveSelectionByDelta: aDelta

    | oldSelectedRect  |

    selectedPanes isEmpty | (aDelta = (0@0)) ifTrue: [ ^nil ].

    self event: #changed.

    oldSelectedRect := self selectedRect.
    selectedPanes do: [ :aPane |
        aPane rect moveBy: aDelta.
        self recalcFramerFor: aPane.
    ].

    self updateRects: oldSelectedRect and: self selectedRect.

    self updatePosition: selectedPanes first rect.

    self lastOperation: #move savedInfo: aDelta negated.!

moveSelectionByDeltaList: aDeltaList

    | oldSelectedRect curPane newDeltaList |

    selectedPanes isEmpty ifTrue: [ ^nil ].

    self event: #changed.

    oldSelectedRect := self selectedRect.
    1 to: selectedPanes size do: [ :i |
        curPane := selectedPanes at: i.
        curPane rect moveBy: (aDeltaList at: i).
        self recalcFramerFor: curPane.
    ].
    self updateRects: oldSelectedRect and: self selectedRect.

    newDeltaList := aDeltaList collect: [ :d | d negated ].

    self lastOperation: #align savedInfo: newDeltaList.!
 
moveSelectionDown

    self moveSelectionByDelta: 0@(self isPM ifTrue: [ -1 ] ifFalse: [ 1 ]).!
   
moveSelectionLeft

    self moveSelectionByDelta: -1@0.!
  
moveSelectionRight

    self moveSelectionByDelta: 1@0.!
  
moveSelectionUp

    self moveSelectionByDelta: 0@(self isPM ifTrue: [ 1 ] ifFalse: [ -1 ]).!
 
outmostWindow

    ^parent!
   
paneHitBy: aPoint

    | panesHit |

    panesHit := panes select: [:p | p containsPoint: aPoint ].

    panesHit isEmpty ifTrue: [
        ^editedPane
    ] ifFalse: [
        ^panesHit first
    ].!
  
panes

    ^panes!

paneToReplicate

    | minTop maxTop minLeft maxLeft minTopPane minLeftPane position |

    rubberBandSelected ifFalse: [
        ^selectedPanes first
    ].

    "Ambiguous selection - choose an appropriate pane (leftmost for
     vertically aligned panes, topmost for horizontally aligned panes)"

    minTop  := self bottomMostCoord.
    maxTop := self topMostCoord.
    minLeft := 30000.
    maxLeft := 0.

    selectedPanes do: [ :p |
        position := p rect leftTop.
        (position x isLeftOf: minLeft) ifTrue: [
            minLeft := position x.
            minLeftPane := p.
        ].
        (position x isRightOf: maxLeft) ifTrue: [
            maxLeft := position x.
        ].
        (position y isAbove: minTop) ifTrue: [
            minTop := position y.
            minTopPane := p.
        ].
        (position y isBelow: maxTop) ifTrue: [
            maxTop := position y.
        ].
    ].

    (maxTop - minTop)abs > (maxLeft - minLeft) abs ifTrue: [
        ^minTopPane
    ] ifFalse: [
        ^minLeftPane
    ].!
  
paste

    Clipboard isNil ifTrue: [
        ^self
    ].

    CursorManager crossHair change.

    loadedPanes := Array new: 2.
    loadedPanes
        at: 1 put: ((Clipboard at: 1) collect: [ :aPane | aPane fullCopy ]) reversed;
        at: 2 put: ( Clipboard at: 2) reversed.

    self checkSelectionChanged.
    self event: #operationOccurred:.!
 
placeDeletedPanesAt: p resetCursor: resetCursor

    | aPane paneList paneOrigins  |

    self unselectAll.

    paneList      := loadedPanes at: 1.
    paneOrigins   := loadedPanes at: 2.

    1 to: paneList size do: [ :paneIndex |
        aPane := paneList at: paneIndex.
        aPane rect moveToLeftTop: (p + (paneOrigins at: paneIndex)).
        panes addFirst: aPane.
    ].

    panes do: [ :aPane |
        self recalcFramerFor: aPane.
    ].

    self event: #changed.

    selectedPanes := paneList asOrderedCollection.
    self updateRect: self selectedRect.
    self select: paneList.

    self showSelectionDots.!
 
placeDuplicatePane

    "Place loaded duplicate panes at an offsets to their originals"

    | newPane loc |

    loadedPanes isNil ifTrue: [
        ^self
    ].
    newPane := loadedPanes first first.
    (self referencePoint notNil and: [ self referencePane notNil ]) ifTrue: [
        loc := self referencePane rect leftTop +
            (self referencePane rect leftTop - self referencePoint).
        loc = self referencePoint ifTrue: [ loc := self duplicateOffset ].
        self referencePoint: self referencePane rect leftTop.
        self referencePane: newPane.
    ] ifFalse: [
        loc := self duplicateOffset
    ].

    self placeLoadedPanesAt: loc resetCursor: true interactive: false.
    self event: #cursorUnloaded.
    self checkSelectionChanged.
    loadedPanes := nil!

placeLoadedPane

    "Place loaded panes in the center of the visible layout,
     or window, whichever is better"

    | newPane loc frameRect |

    loadedPanes isNil ifTrue: [
        ^self
    ].
    newPane := loadedPanes first first.
    frameRect := self visibleFrameRect.
    loc := frameRect leftTop rightAndDown: ((frameRect extent - newPane extent) // 2).

    self placeLoadedPanesAt: loc resetCursor: true interactive: false.
    self event: #cursorUnloaded.
    self checkSelectionChanged.
    loadedPanes := nil!

placeLoadedPanesAt: aPoint

    self
        disableSelectionDots;
        placeLoadedPanesAt: aPoint resetCursor: true interactive: false;
        event: #cursorUnloaded;
        checkSelectionChanged;
        enableSelectionDots.
    loadedPanes := nil!
 
placeLoadedPanesAt: p resetCursor: resetCursor

    self
        placeLoadedPanesAt: p
        resetCursor: resetCursor
        interactive: true.!

placeLoadedPanesAt: p resetCursor: resetCursor  interactive: isInteractive

    | aPane paneList paneOrigins aPoint mouseStillDown e topStaysToBack gridSize |

    gridSize := self gridSize.
    self unselectAll.

    paneList      := loadedPanes at: 1.
    paneOrigins   := loadedPanes at: 2.

    aPoint := self roundPointToGrid: p.

    "If there's more than one pane, we can't set the size by dragging."
    paneList size = 1 & isInteractive ifTrue: [
        mouseStillDown := true.
        Notifier consumeInputUntil: [ :event |
            (event selector = #button1Up:) | (event selector = #button2Up:)  ifTrue: [
                mouseStillDown := false.
            ].
            (event selector = #button1Move:) |  (event selector = #button2Move:) |
            (event selector = #button1Up:) | (event selector = #button2Up:)
        ].
        mouseStillDown ifTrue: [
            e := (self
                rubberBandRect:    (aPoint extent: 1@1)
                from:               aPoint
                inDirection:        #downRight
                constrainedBy:      (self editedPaneContentLeftTop extentFromLeftTop: editedPane contentRect extent)
                minimumSize:        paneList first minSize
                maximumSize:        paneList first maxSize
                foldOver:           false
                gridSize:           gridSize
                withMethod:         nil) extent.
        ].
    ].

    resetCursor ifTrue: [
        CursorManager normal change.
    ].

    paneList := paneList collect: [:w | w fullCopy ].

    (e notNil and: [ (e y > 3) & (e x > 3) ]) ifTrue: [
        paneList first rect extent: e.
    ].

    panes reverseDo: [ :pane |
        pane staysToBack ifTrue: [
            topStaysToBack  := pane.
        ].
    ].

    1 to: paneList size do: [ :paneIndex |
        aPane := paneList at: paneIndex.
        aPane rect moveToLeftTop: (aPoint + (paneOrigins at: paneIndex)).
        aPane parent: editedPane.
        aPane staysToBack ifTrue: [
            topStaysToBack notNil ifTrue: [
                panes add: aPane before: topStaysToBack.
            ] ifFalse: [
                panes addLast: aPane.
            ].
            topStaysToBack := aPane.
        ] ifFalse: [
            panes addFirst: aPane.
        ].
        aPane tabPosition: nil.
    ].

    panes do: [ :aPane |
        self recalcFramerFor: aPane.
    ].

    self event: #changed.

    selectedPanes := paneList asOrderedCollection.
    self updateRect: self selectedRect.
    self select: paneList.

    self showSelectionDots.
    self lastOperation: #place savedInfo: #notUndoable.!
  
placeLoadedPanesAtLeftTop

    self
        paste;
        disableSelectionDots;
        sizeWindowExternal: (self rectForPanes: (loadedPanes at: 1)) extent;
        placeLoadedPanesAt: self visibleFrameRect leftTop resetCursor: true interactive: false;
        event: #cursorUnloaded;
        checkSelectionChanged;
        unselectAll;
        enableSelectionDots.
    loadedPanes := nil!
   
previousOpSymbol

    ^undoInfo at: 1.!
   
recalcFramerFor: aPane

    | windowRect |

    windowRect := self editedPaneContentRect.

    aPane framingBlock isNil ifFalse: [
        aPane framingBlock: (aPane framingBlock newFramerFromNewRect: (windowRect localizeRect: aPane rect) parentRect: (0@0 extent: windowRect extent)).
        aPane reframe: windowRect.
    ].!

rectForPanes: paneList

    | left right top bottom rect |

    right  := 0.
    bottom := self topMostCoord.
    left  := 30000.
    top := self bottomMostCoord.

    paneList do: [:p |
        left    := p hitRect leftTop x leftMost: left.
        right   := p hitRect rightBottom x rightMost: right.
        top     := p hitRect leftTop y higherOf: top.
        bottom  := p hitRect rightBottom y lowerOf: bottom.
    ].

    ^left@top rightBottom: right@bottom.!
  
redisplaySelection

    | rect |

    rect := self fullRectForPanes: selectedPanes.
    self updateRect: rect.!

referenceClear

    self referencePane: nil.
    self referencePoint: nil.!
  
referencePane

    ^self propertyAt: #referencePane!
  
referencePane: aPane

    self propertyAt: #referencePane put: aPane!
 
referencePoint

    ^self propertyAt: #referencePoint!

referencePoint: aPoint

    self propertyAt: #referencePoint put: aPoint deepCopy!

reframeAll

    panes do: [:aPane |
        aPane reframe: self editedPaneContentRect.
    ].!
  
reframePane: aPane

    | oldRect |

    oldRect := aPane rect deepCopy.

    aPane reframe: self editedPaneContentRect.

    self updateRects: oldRect and: aPane rect.!
   
replicateHeight

    | deltaList height |

    height := self paneToReplicate rect height.

    deltaList := OrderedCollection new.

    selectedPanes do: [ :p |
        deltaList addLast:  0@(height - p rect height).
    ].

    self doReplicateSize: deltaList.!
 
replicateWidth

    | deltaList width |

    width := self paneToReplicate rect width.

    deltaList := OrderedCollection new.

    selectedPanes do: [ :p |
        deltaList addLast:  (width - p rect width)@0.
    ].

    self doReplicateSize: deltaList.!
   
roundPointToGrid: p

    | aPoint offset gridSize |

    gridSize := self gridSize.
    offset := self editedPaneContentLeftTop .

    aPoint := p - offset.
    aPoint := ((aPoint x roundTo: gridSize x) @ (aPoint y roundTo: gridSize y)).
    aPoint := (aPoint + offset) max: 0@0.


    ^aPoint!
  
rubberBandRect: aRect from: aPoint inDirection: direction constrainedBy: constrainer minimumSize: minSize maximumSize:  maxSize  foldOver: foldOver gridSize: aGridSize withMethod: method

    | region mouseLoc sizeRect constrainRect delta anchor sizer minExtent maxExtent xPositive yPositive  |

    mouseLoc := aPoint.

    minExtent := minSize.
    minSize isNil ifTrue: [
        minExtent := 1@1.
    ].

    maxExtent := maxSize.
    maxSize isNil ifTrue: [
        maxExtent := 30000@30000.
    ].

    sizeRect := aRect.
    constrainRect := constrainer.

    "------- Set up anchor and sizer -------"

    ( #( upLeft up left ) includes: direction) ifTrue: [
        anchor := sizeRect rightBottom.
        sizer := sizeRect leftTop.
    ].

    (#( downRight down right) includes: direction) ifTrue: [
        anchor := sizeRect leftTop.
        sizer := sizeRect rightBottom.
    ].

    (direction == #upRight) ifTrue: [
        anchor := sizeRect left @ sizeRect bottom.
        sizer := sizeRect right @ sizeRect top
    ].

    (direction == #downLeft) ifTrue: [
        anchor := sizeRect right @ sizeRect top.
        sizer := sizeRect left @ sizeRect bottom
    ].

    "------- Set up constrain rect and min extent -------"

    (direction == #up) | (direction == #down) ifTrue: [
        constrainRect := sizeRect left @ constrainRect top rightBottom: sizeRect right @ constrainRect bottom.
        minExtent := sizeRect width @ minExtent y.
    ].
    (direction = #right) | (direction = #left) ifTrue: [
        constrainRect := constrainRect left @ sizeRect top rightBottom: constrainRect right @ sizeRect bottom.
        minExtent := minExtent x @ sizeRect height.
    ].
    constrainRect extent: (constrainRect extent min: maxExtent).

    delta   := aPoint - sizer.
    xPositive := (sizer x isRightOf: anchor x).
    yPositive := (sizer y isBelow: anchor y).

    self captureMouseInput.

    region := self pen setClipRect: self clipRect.
    self pen  drawFocusRect: sizeRect.

    KeepDotsHidden := true. "avoid redraw on drag scroll"
    Notifier consumeInputUntil: [ :e |

        (e selector = #button1Move:) | (e selector = #button2Move:)  ifTrue: [
            mouseLoc :=  e arguments first.
         ] ifFalse: [
            e perform.
        ].

        sizer := ((mouseLoc - delta) leftAndUp:  constrainRect leftTop) // aGridSize * aGridSize rightAndDown: constrainRect leftTop.

        (sizer x isLeftOf: constrainRect left) ifTrue: [ sizer x: constrainRect left ].
        (sizer x isRightOf: constrainRect right) ifTrue: [ sizer x: constrainRect right ].
        (sizer y isAbove: constrainRect top) ifTrue: [ sizer y: constrainRect top ].
        (sizer y isBelow: constrainRect bottom) ifTrue: [ sizer y: constrainRect bottom ].

        xPositive ifTrue: [
            foldOver ifFalse: [
                ((sizer x left: anchor x) isLeftOf: minExtent x) ifTrue: [ sizer x: (anchor x right: minExtent x) ].
            ].
            ((sizer x left: anchor x) isRightOf: constrainRect width) ifTrue: [ sizer x: (anchor x right: constrainRect width) ].
        ] ifFalse: [
            foldOver ifFalse: [
                ((anchor x left: sizer x) isLeftOf: minExtent x) ifTrue: [ sizer x: (anchor x left: minExtent x) ].
            ].
            ((anchor x left: sizer x) isRightOf: constrainRect width) ifTrue: [ sizer x: (anchor x left: constrainRect width) ].
        ].

        yPositive ifTrue: [
            foldOver ifFalse: [
                ((sizer y - anchor y) < minExtent y) ifTrue: [ sizer y: (anchor y + minExtent y) ].
            ].
            ((sizer y - anchor y) > constrainRect height) ifTrue: [ sizer y: (anchor y + constrainRect height) ].
        ] ifFalse: [
            foldOver ifFalse: [
                ((anchor y - sizer y) < minExtent y) ifTrue: [  sizer y: (anchor y - minExtent y) ].
            ].
            ((anchor y - sizer y) > constrainRect height) ifTrue: [ sizer y: (anchor y - constrainRect height) ].
        ].

        (sizer = sizeRect leftTop) | (sizer = sizeRect rightBottom)
         | (sizer = (sizeRect left @ sizeRect bottom))
         | (sizer = (sizeRect right @ sizeRect top)) ifFalse: [

            self pen drawFocusRect: sizeRect.
            (anchor x < sizer x)  ifTrue:  [
                (anchor y < sizer y) ifTrue:  [
                    sizeRect := anchor corner: sizer
                ] ifFalse: [
                    sizeRect := (anchor x)@(sizer y) corner: (sizer x)@(anchor y)
                ]
            ] ifFalse: [
                (anchor y < sizer y) ifTrue: [
                    sizeRect := (sizer x)@(anchor y) corner: (anchor x)@(sizer y)
                ] ifFalse: [
                    sizeRect := sizer corner: anchor
                ]
            ].
            method isNil ifFalse: [
                self perform: method withArguments: (Array with: sizeRect)
            ].
            self pen drawFocusRect: sizeRect.
        ].

         (e selector = #button1Up:) | (e selector = #button2Up:)
    ].

    self pen drawFocusRect: sizeRect.

    KeepDotsHidden := false.
    self clearMouseCapture.
    self pen destroyRegion: region.

     ^sizeRect!
   
scrollPane

    ^parent!
  
select: paneList

    rubberBandSelected := paneList size > 1.

    paneList do: [ :aPane |
        (selectedPanes includes: aPane) ifFalse: [
            self showSelectionDotsOn: aPane.
            selectedPanes := selectedPanes asOrderedCollection.
            selectedPanes add: aPane.
        ].
    ].

    selectionHasChanged := true.!
  
selectAll

    self unselectAll.
    self select: panes.

    self checkSelectionChanged.!
 
selectDots: w

    | rectSize halfRectSize rect |

    rectSize     := 8 @ 8.
    halfRectSize := 4 @ 4.

    rect := w rect.

    ^Array with: ((rect leftTop leftAndUp: halfRectSize) extentFromLeftTop: rectSize)
          with: ((rect rightBottom leftAndUp: halfRectSize) extentFromLeftTop: rectSize)
          with: (((rect right @ rect top) leftAndUp: halfRectSize) extentFromLeftTop: rectSize)
          with: (((rect left  @ rect bottom) leftAndUp: halfRectSize) extentFromLeftTop: rectSize)!
   
selectedRect

    ^self rectForPanes: selectedPanes!
  
selection

    ^selectedPanes!

selectionOrigin

    "Answer the origin, in local coordinates, of the selected pane.  Assumes
     one pane is selected."

    ^ selectedPanes first rect leftTop - self editedPaneContentRect leftTop.!
   
selectionOrigin: aPoint

    "Set the origin, in local coordinates, of the selected pane.  Assumes
     one pane is selected."

    self moveSelectionByDelta: aPoint - self selectionOrigin!
  
sendToBack

    | firstBackPane |
    self
        event: #changed;
        hideSelectionDots.

    panes remove: selectedPanes first.

    firstBackPane := panes detect: [ :pane | pane staysToBack ] ifNone: [ nil ].
    (selectedPanes first staysToBack or: [ firstBackPane isNil ]) ifTrue: [
        panes addLast: selectedPanes first
    ] ifFalse: [
        panes add: selectedPanes first before: firstBackPane
    ].

    self
        updateRect: selectedPanes first rect;
        showSelectionDots.!
  
setPanes:  paneList

    panes := self importPanes: paneList.

    panes do: [ :p |
        p parent: editedPane.
    ].!
 
showSelectionDots

    selectedPanes do: [:w |
        self showSelectionDotsOn: w.
    ].!
 
showSelectionDotsOn: w

    |  region |

    region := self pen setClipRect: self editedPaneFrameRect.

    self pen foreColor: ClrBlack; backColor: ClrWhite.
    (self selectDots: w) do: [:r |
        self pen reverse: r.
    ].

    self pen destroyRegion: region.!
  
showSizeDot

    self pen execute: [
        self pen fill: self sizeDotRect color: ClrBlack.
    ] clipRect: self clipRect.!
   
sizeDotRect

    ^(self editedPaneFrameRect rightBottom rightAndDown: 1@1)
        extentFromLeftTop: self margin@self margin!
   
sizePane: aPane direction: direction  from: aPoint

     | newRect cursor gridSize |

    gridSize := self gridSize.
    self unselectAllExcept: aPane.
    self hideSelectionDots.

    (#( downRight upLeft) includes: direction) ifTrue: [
        cursor := CursorManager corner.  "Different names would be better"
    ].
    (#( up down) includes: direction) ifTrue: [
        cursor := CursorManager upDown.
    ].
    (#( downLeft upRight) includes: direction) ifTrue: [
        cursor := CursorManager origin.   "Ack!!  Should be neCorner..."
    ].
    (#( left right) includes: direction) ifTrue: [
        cursor := CursorManager leftRight.
    ].

    cursor changeFor: [
        newRect := self rubberBandRect: aPane rect
            from:           aPoint
            inDirection:      direction
            constrainedBy:  (self editedPaneContentLeftTop extentFromLeftTop: editedPane contentRect extent)
            minimumSize:    nil
            maximumSize:    nil
            foldOver:       false
            gridSize:       gridSize
            withMethod:     #updateSize:.
    ].

    self sizeSelectionToRect: newRect.

    self showSelectionDots.

    ^true!
  
sizePane: aPane from: aPoint

    | lastEvent newPoint direction selectDots |

    selectDots := self selectDots: aPane.
    newPoint := aPoint.

    1 to: selectDots size do: [ :i |
        (((selectDots at: i) expandBy: 2) containsPoint: aPoint) ifTrue: [

            direction := #( upLeft downRight upRight downLeft ) at: i.

            (Notifier isKeyDown: VkShift)  ifTrue: [
                Notifier consumeInputUntil: [ :e |
                    lastEvent := e.
                    (e selector = #button1Move:) | (e selector = #button2Move:) |
                    (e selector = #button1Up:) | (e selector = #button2Up:) and: [ (e arguments first = aPoint) not ]
                ].

                newPoint := lastEvent arguments first.
                (aPoint y - newPoint y) abs > (aPoint x - newPoint x) abs ifTrue: [
                    (direction == #upLeft ) | (direction == #upRight) ifTrue: [
                        direction := #up.
                    ] ifFalse: [
                        direction := #down.
                    ].
                ] ifFalse: [
                    (direction == #upLeft ) | (direction == #downLeft) ifTrue: [
                        direction := #left
                    ] ifFalse: [
                        direction := #right
                    ].
                ].
            ].
            ^self sizePane: aPane direction: direction from: newPoint
         ].
    ].

    ^false!
  
sizeSelectionByDelta: sizeDelta

    | aPane |

    selectedPanes isEmpty ifTrue: [ ^self ].

    aPane := selectedPanes first.

    ^self sizeSelectionToRect: (aPane rect leftTop extentFromLeftTop: (aPane rect extent + sizeDelta))!

sizeSelectionByDeltaList: sizeDeltaList op: op

    | oldSelectedRect size newDeltaList curPane |

    selectedPanes isEmpty ifTrue: [ ^nil ].

    self event: #changed.

    oldSelectedRect := self selectedRect.
    1 to: selectedPanes size do: [ :i |
        curPane := selectedPanes at: i.
        size := curPane rect extent + (sizeDeltaList at: i).
        size := ((size max: curPane minSize) min: curPane maxSize).
        curPane autoSizeFrom == #rightJustified ifTrue: [
            curPane rect: (curPane rect rightTop extentFromRightTop: size)
        ] ifFalse: [ curPane autoSizeFrom == #centered ifTrue: [
            curPane rect: (curPane rect centerTop extentFromCenterTop: size)
        ] ifFalse: [
            curPane rect: (curPane rect leftTop extentFromLeftTop: size)
        ]].
        self recalcFramerFor: curPane.
    ].
    newDeltaList := sizeDeltaList collect: [ :s | s negated ].

    self updateRects: oldSelectedRect and: self selectedRect.

    self lastOperation: op savedInfo: newDeltaList.

    ^true!
 
sizeSelectionDown

    self sizeSelectionByDelta: 0@1.!
   
sizeSelectionLeft

    self sizeSelectionByDelta: -1@0.!
  
sizeSelectionRight

    self sizeSelectionByDelta: 1@0.!
  
sizeSelectionToRect: newRect

    | aPane oldRect  |

    self event: #changed.

    aPane := selectedPanes first.
    oldRect := aPane rect deepCopy.

    aPane rect: (newRect leftTop extentFromLeftTop: ((newRect extent max: aPane minSize) min: aPane maxSize)).
    self recalcFramerFor: aPane.

    self updateRects: oldRect and: aPane rect.

    self updateSize: aPane rect.

    self lastOperation: #size savedInfo: oldRect.

    ^true!
  
sizeSelectionUp

    self sizeSelectionByDelta: 0@-1.!

sizeWindowExternal: aPoint

    self event: #changed.
    self hideSelectionDots.
    self hideSizeDot.
    self doSizeWindow: aPoint.!

sizeWindowFrom: aPoint

     | newRect gridSize |

    gridSize := self gridSize.
    self event: #changed.

    self hideSelectionDots.
    self hideSizeDot.

    CursorManager corner changeFor: [
        newRect := (self rubberBandRect: self editedPaneFrameRect
            from:           aPoint
            inDirection:    #downRight
            constrainedBy:  (0@0 extent: 10000@10000)
            minimumSize:    editedPane minSize
            maximumSize:    editedPane maxSize
            foldOver:       false
            gridSize:       gridSize
            withMethod:     #sizingWindow: ).

        self doSizeWindow: newRect extent.
    ].!

sizingWindow: aRectangle

    self scrollPane sizingWindow: aRectangle.

    self updateSize: aRectangle.!
  
sortInZorder: paneList

    | nonTabbed tabbed |

    nonTabbed := OrderedCollection new.
    tabbed := OrderedCollection new.

    paneList do: [ :p |
        p tabPosition isNil ifTrue: [
            nonTabbed addLast: p.
        ] ifFalse: [
            tabbed addLast: p.
        ].
    ].

    tabbed := (tabbed asSortedCollection:  [:a :b |
        a tabPosition >= b tabPosition
    ]) asOrderedCollection.


    nonTabbed do: [ :p |
        tabbed addLast: p.
    ].

    ^tabbed!

toggleSelect: w

    (selectedPanes includes: w) | (w == editedPane) ifFalse: [
        self select: (OrderedCollection with: w).
    ] ifTrue: [
        self hideSelectionDotsOn: w.
        selectedPanes remove: w ifAbsent: [].
        selectionHasChanged := true.
    ].!
   
topMostCoord

    (self isPM) ifTrue: [
        ^30000
    ] ifFalse: [
        ^0
    ].!

totalLength

    editedPane isNil ifTrue: [
        ^self margin * 2
    ].

    ^(self margin*2) + editedPane frameExtent y!
 
totalWidth

    editedPane isNil ifTrue: [
        ^self margin * 2
    ].

    ^self margin*2 + editedPane frameExtent x!

undo

    | lastDoneOperation lastDoneInfo capLastDoneOp |

    "A might tricky..."
    (lastOperation == #undo) ifTrue: [
        lastDoneOperation := undoInfo at: 1.
        capLastDoneOp := lastDoneOperation asString.
        capLastDoneOp at: 1 put: (capLastDoneOp at: 1) asUpperCase.
        lastDoneInfo := undoInfo at: 2.
        self perform: ('do',capLastDoneOp, ':') asSymbol withArguments: (Array with: lastDoneInfo)
    ] ifFalse: [
        capLastDoneOp := lastOperation asString.
        capLastDoneOp at: 1 put: (capLastDoneOp at: 1) asUpperCase.
        self perform: ('undo', capLastDoneOp, ':') asSymbol withArguments: (Array with: undoInfo).
        self lastOperation: #undo savedInfo: (Array with: lastOperation with: undoInfo).
    ].!
   
undoAlign: aDeltaList

    self hideSelectionDots.
    self moveSelectionByDeltaList: aDeltaList.
    self showSelectionDots.!
  
undoAutosize: aDeltaList

    self doAutosize: aDeltaList.!
   
undoClear: savedClearInfo

    loadedPanes := savedClearInfo at: 1.
    self placeDeletedPanesAt: (savedClearInfo at: 2) resetCursor: false.
    loadedPanes := nil.

    self checkSelectionChanged.!

undoMove: aDelta

    self hideSelectionDots.
    self moveSelectionByDelta: aDelta.
    self showSelectionDots.!
   
undoReplicateSize: aDeltaList

    self doReplicateSize: aDeltaList.!
 
undoSize: aRect

    self doSize: aRect!
  
undoSizeWindow: windowSize

    self doSizeWindow: windowSize!

ungroupComposite

    "Ungroup a CompositePane"

    |  loc newPanes composite |

    self cut.
    self paste.
    loadedPanes isNil ifTrue: [
        ^self
    ].
    composite := loadedPanes first first.
    loc := composite rect leftTop.
    newPanes := composite children.
    loadedPanes at: 1 put: OrderedCollection new.
    loadedPanes at: 2 put: OrderedCollection new.
    newPanes do: [ :pane |
        pane reframe: composite rect.
        (loadedPanes at: 1) add: pane.
        (loadedPanes at: 2) add: (pane rect leftTop - composite rect leftTop).
    ].
    self placeLoadedPanesAt: loc resetCursor: true interactive: false.
    self event: #cursorUnloaded.
    self checkSelectionChanged.
    loadedPanes := nil!
 
unselectAll

    self hideSelectionDots.
    selectedPanes := OrderedCollection new.

    selectionHasChanged := true.!

unselectAllExcept: aPane

    selectedPanes do: [:w |
        (w == aPane) ifFalse: [ self hideSelectionDotsOn: w ].
    ].

    (aPane == editedPane) ifTrue: [
        selectedPanes := OrderedCollection new.
        ^selectionHasChanged := true
    ].


    (selectedPanes includes: aPane) ifFalse:  [
        self showSelectionDotsOn: aPane
    ].

    selectedPanes := OrderedCollection with: aPane.

    selectionHasChanged := true.!
 
updatePosition: aRect

    self owner updatePosition: (aRect leftTop - self editedPaneContentRect leftTop).!
  
updateRect: r

    | clipRect region rect |

    (r intersects: self editedPaneContentRect) ifFalse: [
        ^self
    ] ifTrue: [
        clipRect :=  r intersect: self editedPaneContentRect.
    ].

    region := self pen setClipRect: clipRect.
    self pen fill: r color: editedPane backColor.
    self drawGridWithin: clipRect.
    self pen destroyRegion: region.

    panes reverseDo: [ :p |

        (p rect intersects: r) ifTrue: [
            self displayPane: p clipRect: clipRect.
        ].
    ].!
 
updateRects: oldSelectedRect and: newSelectedRect

    (oldSelectedRect intersects: newSelectedRect) ifFalse: [
        self
            updateRect: oldSelectedRect;
            updateRect: newSelectedRect.
    ] ifTrue: [
        self updateRect: ((oldSelectedRect leftTop leftMostAndHighest: newSelectedRect leftTop)
            rightBottom: (oldSelectedRect rightBottom rightMostAndLowest: newSelectedRect rightBottom)).
    ].!

updateSize: aRect

    self owner updateSize: aRect.!
 
updateTitle: aPane

    aPane == editedPane ifTrue: [
        ^aPane drawTitleTextWith: self pen in: (aPane titleRectFrom: self editedPaneFrameLeftTop)
    ].

    self
        hideSelectionDots;
        updateRect: aPane rect;
        showSelectionDots.!

usesFocus

    ^true!
 
visibleFrameRect

    "Answer the client rectangle of the edited window
    that is currently visible in the scrolling pane (i.e.
    the client rectangle intersected with the visible region)"

    | visRect |

    visRect := (self rectangle leftTop + self scrollPane topCorner) extentFromLeftTop: self scrollPane visibleExtent.

    ^(self editedPaneContentRect intersect: visRect).!
  
winClass
        "Private - Answer the window class of GraphPane."
    | className wndClass lptr answer |
    className := 'WBLayout'.
    wndClass := WinWindowClass new.
    answer := UserLibrary getClassInfo: WIN hInstanceExe
        className: className asParameter
        wndClass: wndClass asParameter.
    answer ifTrue:[^className].
    UserLibrary getClassInfo: WIN hInstanceExe
        className: 'VWIN' asParameter
        wndClass: wndClass asParameter.
    wndClass style: (CsOwndc | CsDblclks | CsVredraw | CsHredraw);
        className: (lptr := WinAddress
            copyToNonSmalltalkMemory: className asAsciiZ) asParameter.
    UserLibrary registerClass: wndClass asParameter.
    lptr unlock; free.
   ^className!
  
wmNchittest: wParam with: lParam

    ^nil! !



!WBScrapbookRetrieve class methods !
 
isWBInternalClass

    ^true! !



!WBScrapbookRetrieve methods !
 
cancel: aPane

    Notifier isAltDown ifTrue: [ ^scrapbook inspect ].

    self close!
  
changeName: aPane
    | newName pageList |
    page isNil | chapter isNil ifTrue: [ ^nil ].
    newName := aPane contents.
    newName = page ifTrue: [ ^nil ].
    ((scrapbook at: chapter) includesKey: newName) ifTrue: [
        (MessageBox confirm: '''',newName,''' already exists. Do you want to replace it?') ifFalse: [
            aPane contents: page.
            ^nil
        ].
    ].
    (scrapbook at: chapter) at: newName put:
        ((scrapbook at: chapter) at: page).
    (scrapbook at: chapter) removeKey: page.
    self loadPages: (pageList := self paneNamed: 'pages').
    pageList selectItem: newName.
    self getPage: pageList.
    (self paneNamed: 'ok') enable.
    chapter = 'Quick Reference' ifTrue: [ removedQuick := true ].!
  
chapter
    ^chapter!
  
chapters

    ^scrapbook keys asSortedCollection!
 
displayImage: aPane

    | aPen aPage mergeRect centerPoint offset |

    aPane doGraphics: [
        aPane
            backColor: aPane class defaultBackColor;
            erase.
    ].
    chapter isNil | page isNil ifTrue: [ ^nil ].

    aPage := (scrapbook at: self owner chapter) at: page.
    centerPoint := aPane rectangle center.
    mergeRect := aPage first first rect.
    aPage first do: [ :pObject | mergeRect := mergeRect merge: pObject rect ].
    offset := centerPoint -  mergeRect center.
    aPage first do: [ :pObject | pObject rect moveBy: offset ].

    aPane doGraphics: [
        aPage first do: [ :pObject |
            aPane
                backColor: aPane class defaultBackColor;
                foreColor: aPane class defaultForeColor.
            pObject isNil ifFalse: [
                pObject isCompositePane ifTrue: [ pObject realClass: pObject realClass ].
                pObject displayWith: aPane pen clipRect: aPane rectangle.
            ].
        ].
        aPane display.
    ]!

getChapter: aPane
    | pageList |
    chapter := aPane selectedItem.
    chapter isNil ifFalse: [
        self loadPages: (pageList := self paneNamed: 'pages').
        self pages isEmpty ifFalse: [
            page := self pages first.
            pageList selectItem: page.
            self getPage: pageList.
        ] ifTrue: [
            self displayImage: (self paneNamed: 'graphic').
             (self paneNamed: 'name') contents: ''.
            self updateScrollBar.
        ].
    ].
    chapter = 'Quick Reference' ifTrue: [
        (self paneNamed: 'remove') disable
    ] ifFalse: [
        (self paneNamed: 'remove') enable
    ].!
 
getPage: aPane

    page := aPane selectedItem.
    (self paneNamed: 'name') contents: page.
    (self paneNamed: 'ok') enable.
    (self paneNamed: 'remove') enable.
    self displayImage: (self paneNamed: 'graphic').
    self updateScrollBar.!

getScrollImage: aPane
    | pageList |
    (pageList := self paneNamed: 'pages') selectIndex: aPane position.
    self getPage: pageList.!
   
initWindow

    (self paneNamed: 'ok') disable.
    (self paneNamed: 'remove') disable.
    removedQuick := false.!
 
loadChapters: aPane

    aPane contents: self chapters.
    (self paneNamed: 'remove') disable.
    chapter := nil.
    page := nil.!
  
loadPages: aPane

    aPane contents: self pages.
    (self paneNamed: 'ok') disable.
    page := nil.!
 
ok: aPane

    (chapter notNil and: [ page notNil ]) ifTrue: [
        layoutPane
            clipboard: ((scrapbook at: chapter) at: page ifAbsent: [ nil ]);
            paste.
        self close
    ].!
 
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'Retrieve from Scrapbook';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 1271 @ 584; lDU: 98 r: #left; tDU: 220 r: #top; cRDU: (11 @ 574 rightBottom: 1259 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 667 @ 512; lDU: 567 r: #left; rDU: 1234 r: #left; tDU: 8 r: #top; bDU: 520 r: #top);
                    startGroup;
                    contents: 'Selected Page';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 119 @ 32; lDU: 18 r: #left; rDU: 137 r: #left; tDU: 184 r: #top; bDU: 216 r: #top);
                    startGroup;
                    contents: 'Pages:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 155 @ 32; lDU: 18 r: #left; rDU: 174 r: #left; tDU: 8 r: #top; bDU: 40 r: #top);
                    startGroup;
                    contents: 'Chapters:';
                    yourself
            );
            addSubpane: (
                GraphPane new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 631 @ 344; lDU: 585 r: #left; rDU: 1216 r: #left; tDU: 112 r: #top; bDU: 456 r: #top);
                    paneName: 'graphic';
                    noScrollBars;
                    startGroup;
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 105 @ 32; lDU: 576 r: #left; rDU: 681 r: #left; tDU: 56 r: #top; bDU: 88 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Name:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 128 @ 32; lDU: 585 r: #left; rDU: 713 r: #left; tDU: 476 r: #top; bDU: 508 r: #top);
                    paneName: 'count';
                    rightJustified;
                    startGroup;
                    contents: '';
                    foreColor: ClrDarkblue;
                    yourself
            );
            addSubpane: (
                ListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 530 @ 136; lDU: 18 r: #left; rDU: 549 r: #left; tDU: 44 r: #top; bDU: 180 r: #top);
                    paneName: 'chapters';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #loadChapters:;
                    when: #select perform: #getChapter:;
                    yourself
            );
            addSubpane: (
                ListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 530 @ 236; lDU: 18 r: #left; rDU: 549 r: #left; tDU: 220 r: #top; bDU: 456 r: #top);
                    paneName: 'pages';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #loadPages:;
                    when: #select perform: #getPage:;
                    when: #doubleClickSelect perform: #ok:;
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 521 @ 48; lDU: 695 r: #left; rDU: 1216 r: #left; tDU: 48 r: #top; bDU: 96 r: #top; indent: 3 @ 4);
                    paneName: 'name';
                    startGroup;
                    tabStop;
                    when: #textChanged perform: #changeName:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 167 @ 56; lDU: 18 r: #left; rDU: 185 r: #left; tDU: 464 r: #top; bDU: 520 r: #top);
                    paneName: 'ok';
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 167 @ 56; lDU: 201 r: #left; rDU: 368 r: #left; tDU: 464 r: #top; bDU: 520 r: #top);
                    paneName: 'cancel';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: 'Cancel';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 167 @ 56; lDU: 384 r: #left; rDU: 551 r: #left; tDU: 464 r: #top; bDU: 520 r: #top);
                    paneName: 'remove';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #remove:;
                    contents: '&Remove';
                    yourself
            );
            addSubpane: (
                ScrollBar new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 494 @ 36; lDU: 722 r: #left; rDU: 1216 r: #left; tDU: 472 r: #top; bDU: 508 r: #top);
                    paneName: 'scrollbar';
                    horizontal;
                    startGroup;
                    tabStop;
                    when: #nextLine perform: #getScrollImage:;
                    when: #nextPage perform: #getScrollImage:;
                    when: #sliderPosition perform: #getScrollImage:;
                    when: #prevLine perform: #getScrollImage:;
                    when: #prevPage perform: #getScrollImage:;
                    yourself
            );
        yourself
    ).

    self openWindow!
 
openOn: aPane

    scrapbook := PWindowBuilder scrapbook.
    layoutPane := aPane.
    self open!
   
page
    ^page!

pages

    ^chapter isNil ifTrue: [
        OrderedCollection new
    ] ifFalse: [
        (scrapbook at: chapter) keys asSortedCollection
    ]!
 
remove: aPane

    chapter isNil ifFalse: [
        page isNil ifFalse: [
            (MessageBox confirm: 'Are you sure you want to remove the page: ''',page,'''?') ifTrue: [
                (scrapbook at: chapter) removeKey: page ifAbsent: [ nil ].
                chapter = 'Quick Reference' ifTrue: [ removedQuick := true ].
                self getChapter: (self paneNamed: 'chapters')
            ].
        ] ifTrue: [
            (MessageBox confirm: 'Are you sure you want to remove the chapter: ''',chapter,'''?') ifTrue: [
                scrapbook removeKey: chapter ifAbsent: [ nil ].
                self loadChapters: (self paneNamed: 'chapters').
                self getChapter: (self paneNamed: 'chapters')
            ].
        ].
    ]!
   
removedQuick

    ^removedQuick!
  
scrapbook

    ^scrapbook!

updateScrollBar
    | scrollbar size index |
    size := (scrapbook at: chapter) size.
    scrollbar := (self paneNamed: 'scrollbar').
    scrollbar
        minimum: (1 min: size) ;
        maximum: size;
        pageIncrement: 1.
    page isNil ifFalse: [
        index := self pages indexOf: page.
        scrollbar position: index.
    ] ifTrue: [
        index := 0
    ].
    (self paneNamed: 'count') contents: (index asString,' of ',size asString)! !



!PCheckBox class methods !
   
styleFrom: s

    (s bitIsOn: BsAutocheckbox) ifFalse: [
        ^#checkBox
    ] ifTrue: [
        ^#autoCheckBox
    ].! !



!PCheckBox methods !
  
styles

    ^#(autoCheckBox checkBox)!

winUserStyle

    style == #checkBox ifTrue: [
        ^BsCheckbox
    ].

    ^BsAutocheckbox! !



!WBScratchWindow class methods !
 
createMethod: methodString

    | fileInStream |

    fileInStream := ReadWriteStream on: (String new: methodString size).
    fileInStream
        nextPutAll: '!! WBScratchWindow methods !!';
        nextChunkPut: methodString;
        nextChunkPut: String new.

    fileInStream reset; fileIn.!
  
defaultClass

    ^ WBDefaultScratchWindow!
   
isScratchWindow

    ^true!
   
isWBInternalClass

    ^true!
 
resetToDefault

    "self defaultClass selectors do: [:s |
        self createMethod: (self defaultClass sourceCodeAt: s).
    ]."! !



!WBScratchWindow methods !
 
isWBWindow

    ^true!

perform: selector
    "Scratch windows should not perform any events"
    ^MessageBox messageNote: 'Scratch windows cannot do anything. You must first create a new view manager class with the "Save As..." command in order to add behavior.'!
  
perform: selector with: arg
    "Scratch windows should not perform any events"
    ^self perform: selector!
  
when: anEvent perform: aSelector
    "Scratch windows should not perform any events"! !



!WBListEntryField class methods !
   
isWBInternalClass

    ^true! !



!WBListEntryField methods !

asyncControlEvent: msgId

    msgId = EnChange ifTrue: [
        justSetContents ifTrue: [
            justSetContents := false.
       ] ifFalse: [
            owningListBox  editBoxTextChanged. ^nil
        ].
    ].!
 
initialize

    super initialize.
    justSetContents := false.!
 
owningListBox: aListBox

    owningListBox := aListBox.
    aListBox owningEditBox: self.!
   
setContents: aString

    justSetContents := true.
    super contents: aString.
    self selectAll.!

virtualKeyInput: char withKeys: keyArray

        "Private - Process the character input message."

    (char = VkUp) | (char = VkDown) |
        (char = VkLeft) | (char = VkRight) ifTrue: [
            owningListBox virtualKeyInput: char.
            ^true
    ].

    ^nil!
   
wmChar: char with: lParam
        "Private - Process the character input message."

    char = ReturnKey ifTrue: [
        owningListBox cr.
        ^true
    ].

    (char = TabKey) ifTrue: [
        UserLibrary sendMessage: parent handle
            msg: WmNextdlgctl
            wparam:  ((Notifier isKeyDown: VkShift) ifTrue: [ 1 ] ifFalse: [ 0 ])
            lparam: 0.
        ^true
    ].

    ^nil!
  
wmGetdlgcode: wParam with: lParam

    ^DlgcWantallkeys! !



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



!PToggle class methods ! !



!PToggle methods !
 
changesSize

    ^true!
   
defaultFont

    ^PWindowBuilder wbDefaultFont
    "^SysFont"!
   
defaultForeColor

    ^self getSysColor: ColorWindowtext!
 
displayleftIconAt: p with: aPen

    aPen drawRectangle: (p extent: self iconExtent).!

displayWith: aPen

    | y |

    y := (rect center y up: (self font height // 2)) down: 1.

    aPen
        fill: rect color: self backColor;
        foreColor: foreColor;
        backColor: self backColor;
        font: font;
        setTextAlign: TaTop;
        winDrawText: contents at: (rect left right: self iconExtent x + 4) @ y.

    self displayleftIconAt: rect left @ y with: aPen.!
 
iconExtent

    ^13@13!
   
importantEvents

    ^super importantEvents
        addFirst: #clicked;
        yourself!
   
isGroupable

    ^true!
   
mutationExceptions

    ^#(Toggle CPHorizontalPictureButton)!
 
mutationTypes

    ^#(Button CPBitmapButton)!
 
suggestedSize

    ^(( self font wbStringWidth: self contents) + 20) @((self font height + 4) max: 16)!
   
usesTitle

    ^true! !



!PEntryFieldGroup class methods ! !



!PEntryFieldGroup methods !
 
addSubpanes

    | numRows labelWidth fieldHeight scrollWidth vertOffset lowest |

    self children: nil.
    self font isNil ifTrue: [ self font: self defaultFont ].
    labelWidth := (self contents inject: 0 into: [ :max :item | max max: (self font wbStringWidth: item) ]) + 8.
    fieldHeight := self font height + 8.
    self style == #verticalScrollBar ifTrue: [
        scrollWidth := self scrollBarWidth
    ] ifFalse: [
        scrollWidth := 0
    ].
    self style == #defaultStyle ifTrue: [
        vertOffset := self font height + 2.
        self children add: (
            PGroupBox new
                framingBlock: ( FramingParameters new iDUE: self rect extent; lP: 0; rP: 1; tP: 0; bP: 1);
                paneName: 'group';
                contents: self label;
                realClass: GroupBox;
                yourself).
    ] ifFalse: [
        vertOffset := 0.
    ].

    lowest := 0.
    numRows := self contents size max: 1.
    1 to: numRows do: [ :row |
            row > self contents size ifFalse: [
                self children add: (
                   PStaticText new
                        framingBlock: ( FramingParameters new
                            left: 2 relativeTo: #left;
                            right: 2 + labelWidth relativeTo: #left;
                            top: 10 + vertOffset + ((fieldHeight + 4) * (row - 1)) relativeTo: #top;
                            bottom: 2 + vertOffset + ((fieldHeight + 4) * row) relativeTo: #top);
                        style: #rightJustified;
                        contents: (self contents at: row),':';
                        realClass: StaticText;
                        yourself).
                self children add: (
                   self fieldPClass new
                        framingBlock: ( FramingParameters new
                            left: 6 + labelWidth relativeTo: #left;
                            right: 4 + scrollWidth relativeTo: #right;
                            top: 6 + vertOffset + ((fieldHeight + 4) * (row - 1)) relativeTo: #top;
                            bottom: (lowest := 2 + vertOffset + ((fieldHeight + 4) * row)) relativeTo: #top;
                            indent: 3 @ 4);
                        paneName: (self contents at: row);
                        realClass: self fieldClass;
                        yourself).
           ].
    ].
    self contents size > 0 ifTrue: [ self bestSize y: lowest + 4 ].

    self foreColor: self foreColor.
    self backColor: self realBackColor.!

attributeEditor

    ^WBListEditor new!
   
backColor: aColor

    super backColor: aColor.
    self children do: [ :child | child backColor: aColor ].!
 
bestSize

    ^bestSize ifNil: [ bestSize := 250@100 ]!
   
children

    ^children ifNil: [ children := OrderedCollection new ].!

children: aCollection

    children := aCollection!
   
contents

    ^contents ifNil: [ contents := #() ].!
  
contents: aCollection

    aCollection isNil ifTrue: [ ^self ].
    super contents: (aCollection isDictionary
        ifTrue: [ aCollection keys asOrderedCollection asArray ]
        ifFalse: [ aCollection asArray ]).

    self addSubpanes.!

copySpecificsTo: aPane

    aPane
        label: self label;
        contents: self contents.!
  
defaultFont

    ^PWindowBuilder wbDefaultFont!
   
defaultSize

    ^self bestSize!
  
displayWith: aPen clipRect: inRect
    | region r clipRect |
    r := inRect.
    aPen fill: self rect color: self backColor.

    self style == #verticalScrollBar ifTrue: [
        self displayWithLeftScrollBar: aPen.
        r := inRect insetBy: 1.
        r := Rectangle
            leftTop: r leftTop
            extent: ((r extent x - self scrollBarWidth + 1)@(r extent y)).
        r := r intersect: inRect.
    ].

    self children do: [ :child |
        child reframe: self rect.
        region := aPen setClipRect: (clipRect := r intersect: child rect).
        child displayWith: aPen clipRect: clipRect.
        aPen destroyRegion: region.
    ].!
  
fieldClass

    ^WBEntryField!

fieldPClass

    ^PEntryField!

foreColor: aColor

    super foreColor: aColor.
    self children do: [ :child | child foreColor: aColor ].!
 
isComposite

    ^true!
   
label

    ^label ifNil: [ label := 'EntryFieldGroup' ]!
  
label: aString

    | gb |

    label := aString.

    self children isEmpty ifFalse: [
        gb := self children detect: [ :child | child isKindOf: PGroupbox] ifNone: [nil].
        gb isNil ifFalse: [ gb contents: aString ]
    ].!

mutateSpecificsFrom: aPane
    | list |
    ((list := aPane contents) notNil and: [ list isArray | list isDictionary ]) ifTrue: [
        self contents: list deepCopy
    ].
    (aPane respondsTo: #label) ifTrue: [
        self label: aPane label
    ].!
   
mutationExceptions

    ^#(CPScrollingPane)!
  
mutationTypes

    ^#(ListBox CPScrollingPane RadioButtonGroup EntryFieldGroup)!
  
readSpecificsFrom: c

    self
        label: c label;
        style: c cpStyle;
        contents: c list.

    self style isNil ifTrue: [ self style: self styles first ].!
 
storeContentsOn: aStream indentString: spaceString!
 
storeSpecificsOn: aStream indentString: indentString
    "Write out the list"
    self label isEmpty ifFalse: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'label: ',self label asQuotedString
    ].
    super storeStyleOn: aStream indentString: indentString.
    self contents isNil ifFalse: [
        (self contents isArray and: [ self contents notEmpty ]) ifTrue: [
            aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'contents: #( '.
                self contents do:[ :item | aStream nextPutAll: item asQuotedString,' ' ].
                aStream nextPutAll: ')'
        ]
    ].!
  
storeStyleOn: aStream indentString: spaceString!

style: aSymbol

    super style: aSymbol.
    self addSubpanes.!
 
styles

    ^#(defaultStyle noGroupBox verticalScrollBar)!

suggestedSize

    ^(self rect width) @ (self bestSize y)!

text

    ^self label!

text: aString

    ^self label: aString!
  
usesFont

     ^false!

usesMenu

     ^false!

usesTitle

    ^true! !



!PAnimationPane class methods ! !



!PAnimationPane methods !
 
displayWithBothScrollBars: aPen!

styles

    ^#(defaultStyle noBorders)! !



!WBMultiListChooser class methods ! !



!WBMultiListChooser methods !
   
listClass

    ^MultipleSelectListBox!

ok: aButton

    reply := (self paneNamed: #list) selectedItems.

    self mainView close!
  
opened: topPane

        "Private - Dialog is opened, select the text
         and set the initial focus."

    | list |

    list := self paneNamed: #list.

    sel notNil ifTrue: [
        list selection: sel.
    ].

    list setFocus.!

preInitWindow

    | charSize |
    charSize := WindowDialog unitMultiplier.

    self addSubpane:
        (Button new
            contents: 'Select All';
            when: #clicked perform: #selectAll:;
            framingBlock: [:box | ((box leftBottom
                        rightAndUp: (23 @ (5/2)) * charSize))
                    extentFromLeftTop: (10 @ 2) * charSize ] ).!

selectAll: aPane

    | list |
    list := self paneNamed: 'list'.
    list contents do: [ :item | list selectItem: item ].! !



!PButton class methods !
  
styleFrom: s

    (s bitIsOn: BsDefpushbutton) ifTrue: [
        ^#defaultPushButton
    ] ifFalse: [
        ^#pushButton
    ].! !



!PButton methods !

autoRecognizeOkCancel

    "By default, OK and Cancel buttons are automatically
     recognized and assigned the ID_OK and ID_CANCEL
     styles. Whenever the 'Enter' key is pressed, the #clicked
     event handler of the OK button is executed. Whenever
     the 'Esc' key is pressed, the #clicked event handler of
     the Cancel button is executed. Changing this method to
     return 'false' will disable this feature."

    ^true!

changesSize

    ^true!
   
contents
    contents isNil ifTrue: [ contents := '' ].
    ^contents!

contents: aString

    super contents: aString.!
  
copySpecificsTo: aPane

    aPane specialId: self specialId.!
 
defaultBackColor

    ^self getSysColor: ColorBtnface!

defaultFont

    ^PWindowBuilder wbDefaultFont!
   
defaultForeColor

    ^self getSysColor: ColorBtntext!

defaultSize

    ^self suggestedSize!
 
displayWith: aPen clipRect: clipRect

    | inset region bottom right r clip |

     r := rect.
    style == #defaultPushButton ifTrue: [
        inset := 1.
        aPen drawRectangle: (r insetBy: 1).
    ] ifFalse: [
        inset := 0.
    ].

    bottom := r bottom up: 1.
    right := r right left: 1.

    aPen
        lineFrom: r left @ (r top down: 1) to: r left @ bottom;
        lineFrom: right @ (r top down: 1) to: right @ bottom;
        lineFrom: (r left right: 1) @ r top to: right @  r top;
        lineFrom: (r left right: 1) @ bottom to: right @ bottom.


    aPen
        fill: (r insetBy: inset + 3) color: self defaultBackColor;
        drawRect3D: (r insetBy: inset).

    clip := ((r insetBy: inset + 3) intersect: clipRect).

    (clip left isRightOf: clip right) | (clip top isBelow: clip bottom) ifFalse: [
        region := aPen setClipRect: ((r insetBy: inset + 3) intersect: clipRect).

        aPen
            setBackMode: Transparent;
            foreColor: self foreColor;
            font: font;
            setTextAlign: TaTop;
            centerWinText: contents at: r center;
            setBackMode: Opaque.


        aPen destroyRegion: region.
    ].!

importantEvents

    ^super importantEvents
        addFirst: #clicked;
        yourself!
   
isButton

    ^true!
  
isGroupable

    ^true!
   
mutationExceptions

    ^#(Toggle CPHorizontalPictureButton)!
 
mutationTypes

    ^#(Button CPBitmapButton CPBitmapPane)!

otherButtonWithID: id

    self parent isNil ifTrue: [ ^nil ].
    ^self parent children detect: [ :c |
        c isButton and: [ c ~~ self and: [ c specialId == id ]]
    ] ifNone: [ nil ]!
 
readSpecificsFrom: c

    specialId := c propertyAt: #id.
    (c propertyAt: #cancelPushButton) isNil ifFalse: [
        self style: #cancelPushButton
    ]!
  
specialId

    ^specialId!

specialId: anObject

    specialId := anObject!
   
storeSpecificsOn: aStream indentString: indentString

    | string |

    self specialId = 1 ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'idOK'.
        ^self
    ].

    self style == #cancelPushButton ifTrue: [ ^self ].

    self specialId = 2 ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'idCancel'.
         ^self
   ].

   self autoRecognizeOkCancel ifFalse: [ ^self ].

    string := self contents stripMnemonic asUpperCase.
    string = 'OK' ifTrue: [
        (self otherButtonWithID: 1) isNil ifTrue: [
            aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'idOK'.
        ].
    ] ifFalse: [ string = 'CANCEL' ifTrue: [
        (self otherButtonWithID: 2) isNil ifTrue: [
            aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'idCancel'.
        ].
    ]].!

style: aStyle

    "Note that there can only be one default or
     cancel pushbutton in a window."

    | button  |
    super style: aStyle.
    self style == #defaultPushButton ifTrue: [
        self specialId: 1.
        (button := self otherButtonWithID: 1) isNil ifFalse: [
            button specialId: nil; style: #pushButton.
            ^nil
        ].
    ] ifFalse: [self style == #cancelPushButton ifTrue: [
        self specialId: 2.
        (button := self otherButtonWithID: 2) isNil ifFalse: [
            button specialId: nil; style: #pushButton.
            ^nil
        ].
    ] ifFalse: [
        self specialId: nil.
    ]].!

styles

    ^#(pushButton defaultPushButton cancelPushButton)!

suggestedSize

    ^((self font wbStringWidth: self contents) + 20) @(self font height + 14).!

usesColor

    ^false!

usesTitle

    ^true!
 
winUserStyle

    style == #defaultPushButton ifTrue: [
        ^BsDefpushbutton
    ].

    ^BsPushbutton! !



!WBKeyEntryField class methods !
 
isWBInternalClass

    ^true!
 
supportedEvents
        "Answer the Set of events that EntryFields can notify
         their owners about."
    ^super supportedEvents
        add: #keyEntered;
        yourself! !



!WBKeyEntryField methods !
 
accelerator

    ^accelerator!

accelerator: newAccel

    accelerator := newAccel.
    (accelerator isNil) ifTrue: [
        self contents: ''.
        accelerator := WBKeyAccel new.
    ] ifFalse: [
        self contents: accelerator keyName.
    ].!

initialize

    super initialize.
    accelerator := WBKeyAccel new.!

keyInput: aChar

    accelerator keyCode: aChar.
    self contents: accelerator keyName.
    self setAugmentKeys.
    self selectAll.
    self event: #keyEntered.!
   
setAugmentKeys

    accelerator isAlt: (Notifier isKeyDown: AltKey).
    accelerator isCtrl: (Notifier isKeyDown: VkControl).
    accelerator isShift: (Notifier isKeyDown: VkShift).!
  
virtualKeyInput: char withKeys: keyArray

        "Private - Process the character input message."
    (char = AltKey) | (char = ControlKey) | (char = ShiftKey) ifFalse: [
        self keyInput: char.
    ].!
   
wmChar: theChar with: lParam

    ^true!
  
wmGetdlgcode: wParam with: lParam

    ^DlgcWantmessage!
  
wmKeydown: wordInteger with: longInteger
        "Private - Process the key down message."
    | char |

    char := KeyboardLibrary
        mapVirtualKey: wordInteger
        mapType: 2.

    (char = TabKey) ifTrue: [
        ^UserLibrary sendMessage: parent handle
            msg: WmNextdlgctl
            wparam:  ((Notifier isKeyDown: VkShift) ifTrue: [ 1 ] ifFalse: [ 0 ])
            lparam: 0
    ].

    char < 44  ifTrue: [
        (wordInteger = AltKey) | (wordInteger = ControlKey) | (wordInteger = ShiftKey) ifFalse: [
            self sendInputEvent: #keyInput: with: wordInteger.
            ^true
        ].
    ] ifFalse: [

        self sendInputEvent: #keyInput: with: char asCharacter.
    ].

    ^true! !



!WBDefaultCompositePaneScratchWindow class methods !
 
isWBInternalClass

    ^true! !



!WBDefaultCompositePaneScratchWindow methods !
 
addSubpanes
    (self
        yourself;
            framingBlock: ( FramingParameters new iDUE: 457 @ 200; xC; yC; cRDU: (2 @ 198 rightBottom: 455 @ 2));
        yourself
    ).! !



!PComboBox class methods !
 
purgeCache

    DownArrow notNil ifTrue: [
        DownArrow release.
    ].
    DownArrow := nil.!

styleFrom: s

    (s bitIsOn: CbsDropdownlist) ifTrue: [
        ^#dropDownList
    ] ifFalse: [
        (s bitIsOn: CbsDropdown) ifTrue: [
            ^#dropDown
        ] ifFalse: [
            ^#simpleList
        ].
    ].! !



!PComboBox methods !
 
attributeEditor

    ^WBListEditor new!
   
containsPoint: p

    ^self hitRect containsPoint: p!
 
copySpecificsTo: aPane

    aPane
        contents: self contents.!
  
defaultFont

   "OSI 12/23/92 - used the stored system font"
    ^PWindowBuilder wbDefaultFont
    "^ListFont"!
 
displayWith: aPen

    | r bottomRect buttonWidth topRect theBackColor list region newPoint |

    theBackColor := (style == #dropDownList)
        ifFalse: [ ClrWhite ]
        ifTrue: [ self backColor ].

    buttonWidth := self scrollBarWidth.

    r := (rect right left: buttonWidth) @ rect top extentFromLeftTop: buttonWidth @ (self font height + 8).

    (style == #dropDown) ifTrue: [
        topRect := (rect leftTop extentFromLeftTop: rect width @ r height).
        aPen fill: (topRect insetBy: 1@0) color: self backColor.
        topRect := (rect leftTop extentFromLeftTop: (rect width - buttonWidth - 7) @ r height).
    ] ifFalse: [
        (style == #dropDownList) ifTrue: [
            topRect := (rect leftTop extentFromLeftTop: (rect width - buttonWidth) @ r height).
        ] ifFalse: [
            topRect := (rect leftTop extentFromLeftTop: rect width @ r height).
    ]].

    aPen drawRectangle: topRect;
            fill: (topRect insetBy: 1) color: ClrWhite.

    (style == #dropDownList) ifTrue: [
        aPen drawRectangle: topRect;
            fill: (topRect insetBy: 2) color: theBackColor].

    (style == #simpleList) ifTrue: [
        bottomRect := (rect left right: 8) @ (rect top down: r height - 1) rightBottom: rect rightBottom.
        "Must be an increment of font height"
        bottomRect := bottomRect leftTop extent: (bottomRect width @ ((bottomRect height - 2 truncateTo: aPen font height)+2)).
        aPen rectangle: bottomRect;
            fill: (bottomRect insetBy: 1) color: theBackColor.
        "OSI 12/27/92 - Draw the list contents"
        list := self contents.
        list isNil
            ifFalse: [
                aPen font: self font.
                region := aPen setClipRect: (bottomRect insetBy: 1@1).
                newPoint := (bottomRect insetBy: 3@1) leftTop.
                1 to: list size do: [ :i |
                    aPen displayText: (list at: i) at: newPoint.
                    newPoint := newPoint down: aPen font height ].
                aPen destroyRegion: region].
    ] ifFalse: [
      aPen
        fill: (r insetBy: 2) color: (self getSysColor: ColorBtnface);
        drawRect3DLight: r;
        drawRectangle: r;
        foreColor: ClrBlack;  "Should be ColrBtntext, but fails..."
        backColor: (self getSysColor: ColorBtnface);
        copyBitmap: self downArrow
            from: self downArrow boundingBox
            at: r origin + ((r extent - self downArrow extent) // 2)
            rule: Srcand.
    ].!
   
downArrow

    DownArrow isNil ifTrue: [
        DownArrow := Bitmap new fromSysID: ObmCombo
    ].

    ^DownArrow!
  
generateAllStyles

    ^true!
 
genReceiveWindowMessagesOn: aStream indentString: spaceString

    "Don't generate method for subclasses of EntryField or ListBox - they already have it"!

hitRect

    style == #simpleList ifTrue: [
        ^super hitRect
    ].

    ^(rect leftTop extentFromLeftTop: rect width @ (self font height + 8))!

importantEvents

    ^super importantEvents
        addFirst: #textChanged;
        addFirst: #select;
        yourself!
   
maxSize

    ^32000@32000!

minSize

    (self style = #simpleList) ifTrue: [
        ^1@1
    ] ifFalse: [
        ^1@ (self font height + 8)
    ].!

mutateSpecificsFrom: aPane
    | list |
    ((list := aPane contents) notNil and: [ list isArray ]) ifTrue: [
        self contents: list deepCopy
    ].!
  
mutationExceptions

    ^#(CPScrollingPane)!
  
mutationTypes

    ^#(ListBox CPScrollingPane RadioButtonGroup)!
  
storeSpecificsOn: aStream indentString: indentString
    "Write out the list"
    self contents isNil ifFalse: [
        self contents isEmpty ifFalse: [
            aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'contents: #( '.
                self contents do:[ :item | aStream nextPutAll: item asQuotedString,' ' ].
                aStream nextPutAll: ')' ] ].!
 
styles

    ^#(dropDown simpleList dropDownList   )!
  
usesColor

    ^(style == #simpleList) ifTrue: [ false ] ifFalse: [ true ]!
   
usesForeColor

    ^(style == #dropDownList) ifTrue: [ true ] ifFalse: [ false ]!
 
winUserStyle

    ^((Array with: CbsDropdown with: CbsDropdownlist with: CbsSimple)
        at: (#(dropDown dropDownList simpleList) indexOf: style))! !



!PCPStaticGraphic class methods ! !



!PCPStaticGraphic methods !
   
displayWith: aPen clipRect: r

    | labelOrFileName bitmap |
    labelOrFileName := self contents.
    (labelOrFileName isNil or: [ labelOrFileName isEmpty ]) ifTrue: [
        ^self displayGenericWith: aPen clipRect: r
    ].
    (self fileExists: labelOrFileName)
        ifTrue: [ bitmap := Bitmap fromFile: labelOrFileName ]
        ifFalse: [
            bitmap := Bitmap
                screenWidth: self extent x
                height: self extent y.
            bitmap pen
                fill: self realBackColor;
                foreColor: self foreColor;
                backColor: self realBackColor;
                setBackMode: Transparent;
                setTextAlign: TaTop;
                font: (self font isNil ifTrue: [ self defaultFont ] ifFalse: [ self font ]);
                centerWinText: labelOrFileName at: bitmap boundingBox center ].
    (style == #fixedSize)
        ifTrue: [
            aPen
                copyBitmap: bitmap
                    from: bitmap boundingBox
                    at: rect origin
                    rule: Srccopy]
        ifFalse: [
            aPen
                copyBitmap: bitmap
                    from: bitmap boundingBox
                    to: rect
                    rule: Srccopy].
    bitmap release.!
  
importantEvents

    ^super importantEvents
        remove: #clicked;
        yourself!
 
styles
    ^#(fixedSize stretchToFit)!
 
usesFocus

    ^false! !



!PCheckBoxGroup class methods ! !



!PCheckBoxGroup methods !

buttonClass

    ^CheckBox!
   
buttonPClass

    ^PCheckBox!
 
label

    ^label ifNil: [ label := 'CheckBoxGroup' ]! !



!PMultipleSelectListBox class methods ! !



!PMultipleSelectListBox methods !

winClassStyle

    ^super pmClassStyle | LbsMultiplesel! !



!WBScrollingPane class methods !

isWBInternalClass

    ^true! !



!WBScrollingPane methods !
 
addSubpane: aPane

    children isNil ifTrue: [
        children := IdentityDictionary new].
    children at: self getNextChildId put: aPane.

    aPane parent: self.
    owner mainView add: aPane interestIn: aPane name.!

amountToPageLeft

    ^(self visibleExtent x - 10) max: 20!
   
amountToPageUp

    ^(self visibleExtent y - 10) max: 20!
 
amountToScrollLeft

    ^10!
  
amountToScrollUp

    ^10!

childSize

    | theChild |

    (theChild := self firstChild) notNil  ifTrue: [
        ^theChild totalWidth @ theChild totalLength
    ] ifFalse: [
        ^0@0
    ].!
  
firstChild

    children isNil ifTrue: [
        ^nil
    ].

    ^children values asArray first!
 
getScrollRanges

    | h v minPtr maxPtr |

    minPtr := WinStructure new: 2.
    maxPtr := WinStructure new: 2.

    UserLibrary
        getScrollRange: self asParameter
        bar: SbHorz
        lpMinPos: minPtr asParameter
        lpMaxPos: maxPtr asParameter.

    h := maxPtr uShortAtOffset: 0.

    UserLibrary
        getScrollRange: self asParameter
        bar: SbVert
        lpMinPos: minPtr asParameter
        lpMaxPos: maxPtr asParameter.

    v := maxPtr uShortAtOffset: 0.

    ^h@v!
   
gettingFocus

    self firstChild setFocus.!
  
hasChildren

    ^ children notNil and: [ children size > 0 ]!

initialize

    super initialize.
    topCorner := 0@0.!
 
resizeChildren!
 
resizeWindow

    super resizeWindow.
    topCorner := 0@0.
    self scrollIfNecessaryRedraw: false.
    self setScrollRanges.
    self updateSliders!

scrollHorizontal: anInteger

    self scrollTopCorner: anInteger  @ 0!

scrollIfNecessaryRedraw: redraw

    | childSize visibleExtent newTopCorner |

    self hasChildren ifFalse: [
        ^false
    ].

    childSize       := self childSize.
    visibleExtent := self visibleExtent.


    newTopCorner := topCorner deepCopy.

    (childSize x < (visibleExtent x + topCorner x)) ifTrue: [
        newTopCorner x: (childSize x - visibleExtent x max: 0).
    ].

    (childSize y < (visibleExtent y + topCorner y)) ifTrue: [
        newTopCorner y: (childSize y - visibleExtent y max: 0).
    ].

    (newTopCorner ~= topCorner) ifTrue: [
        self scrollTopCorner: topCorner - newTopCorner unlimited: false.
        topCorner := newTopCorner.
        ^true
     ] ifFalse: [
        topCorner := newTopCorner.
        ^false
    ].!
   
scrollToOrigin

    self sendInputEvent: #scrollTopCorner:  with: self topCorner.!

scrollTopCorner: aPoint

    self scrollTopCorner: aPoint unlimited: false.!
  
scrollTopCorner: p unlimited: bool

    | oldCorner aPoint scrollRanges |

    aPoint := p x @ p y.

    oldCorner := topCorner deepCopy.

    scrollRanges := self getScrollRanges.

    bool ifFalse: [
        topCorner x: ((topCorner x - aPoint x  min: (scrollRanges x)) max: 0).
        topCorner y: ((topCorner y - aPoint y min: (scrollRanges y)) max: 0).
    ] ifTrue: [
        topCorner x: ((topCorner x - aPoint x) max: 0).
        topCorner y: ((topCorner y - aPoint y) max: 0).
    ].

    oldCorner = topCorner ifFalse: [

        UserLibrary
            scrollWindow: handle
            xAmount: oldCorner x - topCorner x
            yAmount: oldCorner y - topCorner y
            lpRect: nil
            clipRect: nil.

        self updateWindow.
    ].!
  
scrollVertical: anInteger

    self scrollTopCorner: 0 @ anInteger!
   
setScrollRanges

    self setScrollRanges: true!
  
setScrollRanges: redraw

    | oldRange newRange visibleExtent childSize f |

    visibleExtent := self visibleExtent.
    oldRange := self getScrollRanges.
    childSize := self childSize.
    newRange := (childSize - visibleExtent) max: 0@0.


   UserLibrary
        setScrollRange: self asParameter
        bar: SbHorz
        min: 0
        max: newRange x
        redraw: redraw.

    UserLibrary
        setScrollRange: self asParameter
        bar: SbVert
        min: 0
        max: newRange y
        redraw: redraw.

    ^f = true!
   
sizingWindow: aRect

    | mouseLoc deltaX deltaY visibleRect |

    mouseLoc := (Cursor offset mapToWindow: self).
    visibleRect := (0@0 extent: self extent).

    deltaX := deltaY := 0.

    (mouseLoc x isLeftOf: visibleRect left) ifTrue: [
        deltaX := (visibleRect left left: mouseLoc x).
    ] ifFalse: [
        (mouseLoc x isRightOf: visibleRect right) ifTrue: [
            deltaX := (visibleRect right left: mouseLoc x).
        ]
    ].
    (mouseLoc y isAbove: visibleRect top) ifTrue: [
        deltaY := (visibleRect top up: mouseLoc y).
    ] ifFalse: [
        (mouseLoc y isBelow: visibleRect bottom) ifTrue: [
            deltaY := (visibleRect bottom up: mouseLoc y).
        ].
    ].

    self scrollTopCorner: (deltaX@deltaY) unlimited: true.!
 
totalLength

    self hasChildren  ifTrue: [
        ^self firstChild totalLength
    ] ifFalse: [
        ^0
    ].!
 
totalWidth

   self hasChildren  ifTrue: [
        ^self firstChild totalWidth
    ] ifFalse: [
        ^0
    ].!

updateHorizontalSlider

    self updateHorizontalSliderTo: topCorner x.!
  
updateSliders

    handle = NullHandle ifTrue: [^self].

        self updateVerticalSlider.
        self updateHorizontalSlider.!
  
updateVerticalSlider

     self getScrollRanges.
    self updateVerticalSliderTo: topCorner y!
   
visibleExtent

    ^self extent - 2!
  
windowHasSized

    self setScrollRanges: true.
    self scrollIfNecessaryRedraw: true.
    self updateSliders.!

wmHScroll: wordInteger with: longInteger
        "This is the main entry point for scrolling frame communication with
    the ScrollingPane.  Subclassed from Subpane to avoid their turning everything
    into a percentage.  Using pixel absolutes is faster and more straightforward."

    | type |

    type := wordInteger.
    type = SbLineup         ifTrue: [self scrollHorizontal: self amountToScrollLeft ].
    type = SbLinedown     ifTrue: [self scrollHorizontal: self amountToScrollLeft negated].
    type = SbPageup        ifTrue: [self scrollHorizontal: self amountToPageLeft ].
    type = SbPagedown    ifTrue: [self scrollHorizontal: self amountToPageLeft negated].

    type = SbThumbposition ifTrue: [
        self updateHorizontalSliderTo: longInteger \\ 65536.
        ^nil
    ].

    type = SbThumbtrack ifTrue: [
        self scrollHorizontal: topCorner x - (longInteger \\ 65536).
        ^nil
    ].

    self updateHorizontalSlider.

   ^nil!
  
wmVScroll: wordInteger with: longInteger

        "This is the main entry point for scrolling frame communication with
    the ScrollingPane.  Subclassed from Subpane to avoid their turning everything
    into a percentage.  Using pixel absolutes is faster and more straightforward."

    | type |

    type := wordInteger.
    type = SbLineup         ifTrue: [self scrollVertical: self amountToScrollUp].
    type = SbLinedown     ifTrue: [self scrollVertical: self amountToScrollUp negated].
    type = SbPageup        ifTrue: [self scrollVertical: self amountToPageUp].
    type = SbPagedown    ifTrue: [self scrollVertical: self amountToPageUp negated].

    type = SbThumbposition ifTrue: [
        self updateVerticalSliderTo: longInteger \\ 65536.
        ^nil
    ].

    type = SbThumbtrack ifTrue: [
        self scrollVertical: topCorner y - (longInteger \\ 65536).
        ^nil
    ].

    self updateVerticalSlider.

   ^nil!

zoom

        "Private - Expand the pane to take up the entire area
          of its main window, or back to normal if it is
         already zoomed."
    | mainWindowRect |
    mainWindowRect := (self mainWindow rectangle).
    self mainWindow zoomed: self mainWindow zoomed not.
    self zoomed: self zoomed not.

    self mainWindow noRedraw: true.
    self mainWindow children do: [ :c |
        c ~~ self ifTrue: [
            self zoomed ifTrue: [
                c hideWindow.
            ] ifFalse: [
                c showWindow.
            ].
        ].
    ].
    self mainWindow noRedraw: false.
    self mainWindow invalidateRect: nil.

    self mainWindow zoomed not
        ifTrue: [ "unzoom"
            self mainWindow
                    resize: (mainWindowRect origin extent: mainWindowRect extent)
                    repaint: true]

        ifFalse: [ "zoom"
            rectangle origin: (0@0) extent: (mainWindowRect extent max: 0@0).
            self resizeWindow;
                updateRectangle;
                setFocus.
            self showWindow].! !



!WBToolBarEditor class methods ! !



!WBToolBarEditor methods !
 
activated: aPane

    | element selection |
    self changed: #getBitmaps:.
    (selection := (self paneNamed: 'buttons') selection) isNil ifTrue: [ ^nil ].
    (element := elements at: selection) isNil ifTrue: [ ^nil ].
    (self paneNamed: 'bitmaps') selectItem: element bitmapSelector asString.!

cellSize

    | cellSize |
    cellSize := (self paneNamed: 'cellSize') contents.
    ^((cellSize upTo: $@) trimBlanks asInteger) @
        ((cellSize reversed upTo: $@) reversed trimBlanks asInteger).!
 
copy: aPane

    | index |
    index := list selection.
    index isNil ifTrue: [ ^nil ].
    clipboard := elements at: index .
    (self paneNamed: 'paste') enable.!

down: aPane

    | element index |
    index := list selection.
    index isNil ifTrue: [ ^nil ].
    element := elements at: index.
    index == elements size ifTrue: [ ^nil ].
    elements removeIndex: index.
    elements add: element afterIndex: index.
    list invalidateRect: nil.
    list selection: index + 1.

    self updateButtons.!
  
drawItem: aPane

    | element |

    element := elements at: aPane drawIndex.
    element pen: nil.
    aPane pen
        copy: element pen
        from: element boundingBox
        to: ((aPane drawBox leftTop rightAndDown: 2) extent: element rectangle extent);
        setTextAlign: TaTop;
        font: SysFont;
        displayText: (element selector asString) at: aPane drawBox leftTop + ((element rectangle width + 6) @ 2)!

editBitmaps: ignore

    (Smalltalk includesKey: #CPBitmapManager) ifTrue: [
        (Smalltalk includesKey: #MDISystem) ifTrue: [
            (Smalltalk at: #MDISystem) isActive ifTrue: [
                ^MessageBox message: 'Due to limitations in the implementation of MDI, the bitmap manager cannot be launched from within MDI.  Either use the toolbar, or switch out of MDI first.'
            ].
        ].
        (Smalltalk at: #CPBitmapManager) new sendInputEvent: #open.
    ] ifFalse: [
        MessageBox message: 'To view/edit bitmaps, you must first file in the CPBitmapManager.'
    ].!
  
getBitmaps: aPane

    | keys aPoint |

    aPoint := self cellSize.
    aPane
        contents: (keys := useSystem
            ifTrue: [
                self
                    validBitmapsFrom: CPBitmapDict systemBitmapDictionary
                    withSize: aPoint ]
            ifFalse: [
                self
                    validBitmapsFrom: CPBitmapDict defaultBitmapDictionary
                    withSize: aPoint ]).
    keys isEmpty ifFalse: [ aPane selection: keys first ].!
  
help: aPane

    MessageBox notify: 'Instructions for Creating Toolbars' withText:
'1) Create toolbar buttons using the BitmapManager and ButtonEditor. They must be the same size as the ''Cell Size''.
2) Insert a blank button using the ''Insert'' button.
3) Select a button bitmap from the Bitmap combobox (only bitmaps of the chosen Cell Size will appear). Each button MUST have an associated bitmap.
4) Specify any other desired attributes.'!
  
highlightItem: aPane

    | element |

    element := elements at: aPane drawIndex.
    aPane pen reverse: (aPane drawBox leftTop + ((element rectangle width + 4) @ 0) corner: aPane drawBox corner)!
 
initWindow

    Notifier isAltDown ifFalse: [
        (self paneNamed: 'system') hideWindow
    ].

    list contents: (elements collect: [ :element |
        (element selector isNil or: [element selector == #nil]) ifTrue: [ element selector: '' ].
        element selector asString ]).

    (self paneNamed: 'system') selection: thePane useSystem.
    (self paneNamed: 'cellSize') contents: thePane cellSize asString.
    (self paneNamed: 'paste') disable.

    elements isEmpty ifFalse: [
        list selection: 1.
        self selectButton: list
    ] ifTrue: [
        self updateButtons.
    ].!

insert: aPane

    | index element |
    index := list selection.

    element := WBTool
        bitmap: (CPBitmapDict sysAt: 'toolPaneExample' ifAbsent: [ nil ])
        selector: ''.
    element rectangle: (0@0 extent: thePane cellSize).

    index isNil ifTrue: [
        elements add: element.
        index := elements size.
    ] ifFalse: [
        elements add: element afterIndex: index.
        index := index + 1.
    ].
    list
        contents: (elements collect: [ :element | element selector asString ]);
        selection: index.

    (self paneNamed: 'bitmaps') selectItem: nil.
    (self paneNamed: 'selector') setContents: ''.
    (self paneNamed: 'rbSelector') setContents: ''.
    (self paneNamed: 'numSpaces') setContents: '0'.

    self updateButtons.!
   
ok: aPane

    | rect |

    thePane cellSize: self cellSize.

    elements := elements select: [ :element |
        element bitmapSelector notNil and: [ element bitmapSelector notEmpty ]].
    elements isEmpty ifFalse: [
        elements first rectangle: (Rectangle leftTop: (elements first numSpaces - 1 @ 0) extent: thePane cellSize).
        2 to: elements size do: [ :i |
            (elements at: i) rectangle: (Rectangle
                leftTop: (((elements at: i - 1) rectangle) rightTop right: (elements at: i) numSpaces - 1)
                extent: thePane cellSize)
        ].
    ].
    thePane elements: elements.
    thePane useSystem: useSystem.

    self close!

open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'WBToolBar Attributes';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 1298 @ 552; xC; yC; cRDU: (11 @ 542 rightBottom: 1287 @ 48));
            pStyle: #(sysmenu modal titlebar);
            when: #activate perform: #activated:;
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 695 @ 480; lDU: 9 r: #left; rDU: 704 r: #left; tDU: 8 r: #top; bDU: 488 r: #top);
                    startGroup;
                    contents: 'Buttons';
                    yourself
            );
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 539 @ 408; lDU: 722 r: #left; rDU: 1262 r: #left; tDU: 8 r: #top; bDU: 416 r: #top);
                    startGroup;
                    contents: 'Button';
                    yourself
            );
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 503 @ 224; lDU: 741 r: #left; rDU: 1243 r: #left; tDU: 112 r: #top; bDU: 336 r: #top);
                    startGroup;
                    contents: 'Selectors';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 155 @ 32; lDU: 18 r: #left; rDU: 174 r: #left; tDU: 424 r: #top; bDU: 456 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Cell Size:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 128 @ 32; lDU: 731 r: #left; rDU: 859 r: #left; tDU: 64 r: #top; bDU: 96 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Bitmap:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 183 @ 32; lDU: 759 r: #left; rDU: 942 r: #left; tDU: 152 r: #top; bDU: 184 r: #top);
                    startGroup;
                    contents: 'Left Button:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 201 @ 32; lDU: 759 r: #left; rDU: 960 r: #left; tDU: 240 r: #top; bDU: 272 r: #top);
                    startGroup;
                    contents: 'Right Button:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 210 @ 32; lDU: 731 r: #left; rDU: 942 r: #left; tDU: 360 r: #top; bDU: 392 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Num Spaces:';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 155 @ 40; lDU: 1088 r: #left; rDU: 1243 r: #left; tDU: 360 r: #top; bDU: 400 r: #top);
                    paneName: 'system';
                    startGroup;
                    when: #clicked perform: #toggleSystem:;
                    contents: 'System';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 238 @ 64; lDU: 722 r: #left; rDU: 960 r: #left; tDU: 424 r: #top; bDU: 488 r: #top);
                    paneName: 'editBitmaps';
                    startGroup;
                    when: #clicked perform: #editBitmaps:;
                    contents: 'Edit Bitmaps';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 46 @ 48; lDU: 1198 r: #left; rDU: 1243 r: #left; tDU: 56 r: #top; bDU: 104 r: #top);
                    paneName: 'help';
                    startGroup;
                    when: #clicked perform: #help:;
                    contents: '?';
                    yourself
            );
            addSubpane: (
                WBListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 466 @ 352; lDU: 27 r: #left; rDU: 494 r: #left; tDU: 48 r: #top; bDU: 400 r: #top);
                    paneName: 'buttons';
                    ownerDrawFixed;
                    startGroup;
                    tabStop;
                    when: #highlightItem perform: #highlightItem:;
                    when: #select perform: #selectButton:;
                    when: #drawItem perform: #drawItem:;
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 155 @ 48; lDU: 183 r: #left; rDU: 338 r: #left; tDU: 416 r: #top; bDU: 464 r: #top; indent: 3 @ 4);
                    paneName: 'cellSize';
                    startGroup;
                    tabStop;
                    when: #textChanged perform: #setCellSize:;
                    contents: '25 @ 22';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 155 @ 40; lDU: 352 r: #left; rDU: 507 r: #left; tDU: 420 r: #top; bDU: 460 r: #top);
                    paneName: 'default';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #toggleDefault:;
                    contents: 'Default';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 174 @ 64; lDU: 512 r: #left; rDU: 686 r: #left; tDU: 48 r: #top; bDU: 112 r: #top);
                    paneName: 'insert';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #insert:;
                    contents: '&Insert';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 174 @ 64; lDU: 512 r: #left; rDU: 686 r: #left; tDU: 120 r: #top; bDU: 184 r: #top);
                    paneName: 'copy';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #copy:;
                    contents: '&Copy';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 174 @ 64; lDU: 512 r: #left; rDU: 686 r: #left; tDU: 192 r: #top; bDU: 256 r: #top);
                    paneName: 'paste';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #paste:;
                    contents: '&Paste';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 174 @ 64; lDU: 512 r: #left; rDU: 686 r: #left; tDU: 264 r: #top; bDU: 328 r: #top);
                    paneName: 'up';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #up:;
                    contents: '&Up';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 174 @ 64; lDU: 512 r: #left; rDU: 686 r: #left; tDU: 336 r: #top; bDU: 400 r: #top);
                    paneName: 'down';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #down:;
                    contents: '&Down';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 174 @ 64; lDU: 512 r: #left; rDU: 686 r: #left; tDU: 408 r: #top; bDU: 472 r: #top);
                    paneName: 'remove';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #remove:;
                    contents: '&Remove';
                    yourself
            );
            addSubpane: (
                WBComboBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 320 @ 344; lDU: 869 r: #left; rDU: 1189 r: #left; tDU: 56 r: #top; bDU: 400 r: #top);
                    paneName: 'bitmaps';
                    dropDownList;
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getBitmaps:;
                    when: #select perform: #selectBitmap:;
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 466 @ 48; lDU: 759 r: #left; rDU: 1225 r: #left; tDU: 184 r: #top; bDU: 232 r: #top; indent: 3 @ 4);
                    paneName: 'selector';
                    startGroup;
                    tabStop;
                    when: #textChanged perform: #setSelector:;
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 466 @ 48; lDU: 759 r: #left; rDU: 1225 r: #left; tDU: 272 r: #top; bDU: 320 r: #top; indent: 3 @ 4);
                    paneName: 'rbSelector';
                    startGroup;
                    tabStop;
                    when: #textChanged perform: #setRBSelector:;
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 119 @ 48; lDU: 951 r: #left; rDU: 1070 r: #left; tDU: 352 r: #top; bDU: 400 r: #top; indent: 3 @ 4);
                    paneName: 'numSpaces';
                    startGroup;
                    tabStop;
                    when: #textChanged perform: #setNumSpaces:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 128 @ 64; lDU: 978 r: #left; rDU: 1106 r: #left; tDU: 424 r: #top; bDU: 488 r: #top);
                    paneName: 'ok';
                    idOK;
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 146 @ 64; lDU: 1115 r: #left; rDU: 1262 r: #left; tDU: 424 r: #top; bDU: 488 r: #top);
                    paneName: 'cancel';
                    idCancel;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: 'Cancel';
                    yourself
            );
        yourself
    ).

    self openWindow!
  
paste: aPane

    | index |
    index := list selection.
    index isNil ifTrue: [
        elements add: clipboard deepCopy.
        index := elements size.
    ] ifFalse: [
        elements add: clipboard deepCopy beforeIndex: index
    ].
    list
        contents: (elements collect: [ :element | element selector asString ]);
        selection: index.

    self updateButtons.!
 
preInitWindow

    elements := thePane elements deepCopy.
    useSystem := thePane useSystem.
    list := self paneNamed: 'buttons'.

    list height: thePane cellSize y + 4.!
   
remove: aPane

    | index |
    index := list selection.
    index isNil ifTrue: [ ^nil ].
    elements removeIndex: index.
    list
        contents: (elements collect: [ :element | element selector asString ]);
        selection: (index min: elements size).

    self updateButtons.!

selectBitmap: aPane

    | element selector index |

    index := list selection.
    index isNil ifTrue: [ ^nil ].
    element := elements at: index.
    element bitmapSelector: aPane selectedItem.
    element bitmapSelector isNil ifTrue: [ ^nil ].

    useSystem ifTrue: [
        element bitmap: (CPBitmapDict sysAt: element bitmapSelector asString ifAbsent: [ nil ]).
    ] ifFalse: [
        element bitmap: (CPBitmapDict at: element bitmapSelector asString ifAbsent: [ nil ]).
    ].
    element boundingBox: nil.

    selector := self paneNamed: 'selector'.
    selector setContents: element bitmapSelector.
    element selector: element bitmapSelector.

    list
        invalidateRect: nil;
        setFocus!

selectButton: aPane

    | element |
    element := elements at: aPane selection.
    (self paneNamed: 'bitmaps') selectItem: element bitmapSelector asString.
    (self paneNamed: 'selector') setContents: element selector.
    (self paneNamed: 'rbSelector') setContents: element rbSelector.
    (self paneNamed: 'numSpaces') contents: element numSpaces asString.

    self updateButtons.!
   
setCellSize: aPane

    self changed: #getBitmaps:!
   
setNumSpaces: aPane

    | element |
    element := elements at: list selection.
    element numSpaces: aPane contents asInteger.!
  
setRBSelector: aPane

    | element |
    element := elements at: list selection.
    element rbSelector: aPane contents.!
  
setSelector: aPane

    | element |
    element := elements at: list selection.
    element selector: aPane contents.

    list invalidateRect: nil!
  
toggleDefault: aPane

    aPane selection ifTrue: [
        (self paneNamed: 'cellSize')
            contents: '25 @ 22';
            disable
    ] ifFalse: [
        (self paneNamed: 'cellSize') enable
    ].!
  
toggleSystem: aPane

    useSystem := aPane selection.
    self changed: #getBitmaps:.!
  
up: aPane

    | element index |
    index := list selection.
    index isNil ifTrue: [ ^nil ].
    element := elements at: index.
    index == 1 ifTrue: [ ^nil ].
    elements removeIndex: index.
    elements add: element beforeIndex: index - 1.
    list invalidateRect: nil.
    list selection: index - 1.

    self updateButtons.!
   
updateButtons

    elements isEmpty ifTrue: [
        (self paneNamed: 'remove') disable.
        (self paneNamed: 'copy') disable.
        (self paneNamed: 'up') disable.
        (self paneNamed: 'down') disable.
        ^nil
    ] ifFalse: [
        (self paneNamed: 'remove') enable.
        (self paneNamed: 'copy') enable.
    ].
    list selection == elements size ifTrue: [
        (self paneNamed: 'down') disable
    ] ifFalse: [
        (self paneNamed: 'down') enable
    ].
    list selection == 1 ifTrue: [
        (self paneNamed: 'up') disable
    ] ifFalse: [
        (self paneNamed: 'up') enable
    ].!
  
validBitmapsFrom: aBitmapDictionary withSize: aPoint

    | size |
    size := aPoint x * 2 @ aPoint y.
    ^(aBitmapDictionary select: [ :bitmap | bitmap extent = size ])
        keys asSortedCollection! !



!WBMenubarEditor class methods ! !



!WBMenubarEditor methods !
 
allowAttributesFor: anItem

    ^(super allowAttributesFor: anItem) & anItem parent isRoot not!
   
allowDividerFor: anItem

    ^(super allowDividerFor: anItem) & anItem parent isRoot not.!

initWindow

    super initWindow.
    self labelWithoutPrefix: 'Menubar Editor'.!

newMenuClass

    ^WBPMenubar!

testMenu: ignore

    | tester |

    self updateItem: menuItemsEditor selection.

    tester := WBMenuTester new.

    tester menubar: menuItemsEditor contents asMenu.
    tester open.!
 
warnOfAccelerators

    | accel |

    accel := keyShortCutEditor accelerator.

    (accel isAlt | accel isCtrl | accel isShift) not ifTrue: [
        MessageBox message: 'Digitalk does not support menu accelerators without an augmentation key (ctrl, alt, or shift).  Please add an augmentation key.'
    ].! !



!TextEditWindow class methods ! !



!TextEditWindow methods !

initWindowSize
        "Private - Answer the initial size of the receiver."
    ^10@10 extent: Display extent - (20@20)!
  
openOn: aString
        "Open the receiver with aString as its initial contents."
    file := aString.
    self addSubpane:
        (TextPane new
            owner: self;
            font: (Font face: 'Terminal' size: 8@14 fixedWidth: true);
            when: #getContents perform: #stringContents:;
            framingBlock: [ :box | box]).
    self openWindow.
    partial := false.! !



!WBDialogEditor class methods ! !



!WBDialogEditor methods !
 
initWindow

    | theStyle |

    theStyle := thePane style.

    (self paneNamed: 'systemMenu') selection: (theStyle includes: #sysmenu).
    (self paneNamed: 'systemModal') selection: (theStyle includes: #sysmodal).
    (self paneNamed: 'titleBar') selection: (theStyle includes: #titlebar).
    (self paneNamed: 'modal') selection: (theStyle includes: #modal).!
   
ok: aPane

    | s |

    s := Set new.

    (self paneNamed: 'systemMenu') selection ifTrue: [
        s add: #sysmenu.
    ].

    (self paneNamed: 'titleBar') selection ifTrue: [
        s add: #titlebar.
    ].

    (self paneNamed: 'systemModal') selection ifTrue: [
        s add: #sysmodal.
    ].

    (self paneNamed: 'modal') selection ifTrue: [
        s add: #modal.
    ].

    thePane := thePane fullCopy.

    thePane style: s.


    super close.!
   
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'Window Attributes';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 594 @ 256; xC; yC; cRDU: (11 @ 246 rightBottom: 583 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                StaticBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 530 @ 4; lDU: 18 r: #left; rDU: 549 r: #left; tDU: 112 r: #top; bDU: 116 r: #top);
                    blackRectangle;
                    startGroup;
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 295 @ 40; lDU: 18 r: #left; rDU: 313 r: #left; tDU: 16 r: #top; bDU: 56 r: #top);
                    paneName: 'systemMenu';
                    startGroup;
                    tabStop;
                    contents: '&System menu';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 313 @ 40; lDU: 293 r: #left; rDU: 606 r: #left; tDU: 16 r: #top; bDU: 56 r: #top);
                    paneName: 'systemModal';
                    startGroup;
                    tabStop;
                    contents: 'S&ystem modal';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 176 @ 40; lDU: 293 r: #left; rDU: 469 r: #left; tDU: 62 r: #top; bDU: 102 r: #top);
                    paneName: 'modal';
                    startGroup;
                    tabStop;
                    contents: '&Modal';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 192 @ 56; lDU: 18 r: #left; rDU: 210 r: #left; tDU: 128 r: #top; bDU: 184 r: #top);
                    idOK;
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 224 @ 40; lDU: 18 r: #left; rDU: 242 r: #left; tDU: 62 r: #top; bDU: 102 r: #top);
                    paneName: 'titleBar';
                    startGroup;
                    tabStop;
                    contents: '&Title bar';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 192 @ 56; lDU: 229 r: #left; rDU: 421 r: #left; tDU: 128 r: #top; bDU: 184 r: #top);
                    idCancel;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: '&Cancel';
                    yourself
            );
        yourself
    ).

    self openWindow! !



!PScrollBar class methods !

defaultRealClassName

    ^'ScrollBar'.! !



!PScrollBar methods !
   
attributeEditor

    ^WBScrollBarEditor new!
  
copySpecificsTo: aPane

    aPane
        minimum: self minimum;
        maximum: self maximum;
        lineIncrement: self lineIncrement;
        pageIncrement: self pageIncrement.!

initialize

    super initialize.
    self
        minimum: 0;
        maximum: 100;
        lineIncrement: 1;
        pageIncrement: 24.!
   
lineIncrement

    ^lineIncrement!

lineIncrement: i

    lineIncrement := i!
 
maximum

    ^maximum!

maximum: m

    maximum := m!
 
minimum

    ^minimum!

minimum: m

    minimum := m!
 
mutateSpecificsFrom: aPane

    (aPane respondsTo: #realPane) ifTrue: [
        (aPane realPane respondsTo: #min) ifTrue: [
            self minimum: aPane realPane min
        ].
        (aPane realPane respondsTo: #max) ifTrue: [
            self maximum: aPane realPane max
        ].
        ^nil
    ].

    (aPane respondsTo: #minimum) ifTrue: [
        self minimum: aPane minimum
    ].
    (aPane respondsTo: #maximum) ifTrue: [
        self maximum: aPane maximum
    ].
    (aPane respondsTo: #pageIncrement) ifTrue: [
        self pageIncrement: aPane pageIncrement
    ].
    (aPane respondsTo: #lineIncrement) ifTrue: [
        self lineIncrement: aPane lineIncrement
    ].!

mutationExceptions

    ^#(CPValuator CPGauge CPSlider)!
  
mutationTypes

    ^#(CPValuator ScrollBar)!
  
pageIncrement

    ^pageIncrement!

pageIncrement: i

    pageIncrement := i!
 
readSpecificsFrom: c

    self
        minimum: c minimum;
        maximum: c maximum;
        lineIncrement: c lineIncrement;
        pageIncrement: c pageIncrement.!
   
realClassName

    ^'ScrollBar'!
  
scrollBarColor

    ^self backColor!
  
storeSpecificsOn: aStream indentString: indentString

    self minimum = 0 ifFalse: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'minimum: ', self minimum asString.
    ].

    self maximum = 100 ifFalse: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'maximum: ', self maximum asString.
    ].

    self lineIncrement = 1 ifFalse: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'lineIncrement: ', self lineIncrement asString.
    ].

    self pageIncrement = 24 ifFalse: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'pageIncrement: ', self pageIncrement asString.
    ].! !



!CompositeFrameObject class methods ! !



!CompositeFrameObject methods !

drawFrameWith: aPen at: aPoint

    | r region |

    region := aPen setClipRect: (r := aPoint extentFromLeftTop: rect extent).
    aPen
        foreColor: (self getSysColor: ColorWindowframe);
        drawRectangle: r.
    aPen destroyRegion: region.!

hasOtherEditor

    ^false!
   
isNonWindowParent

    ^true!
 
paneName: n!

storeOn: aStream indentString: indentString

    aStream reset.
    PWindowBuilder secondArg = 'self' ifFalse: [
        aStream
            nextPutAll: '    | wbOwner |'; cr;
            nextPutAll: '    wbOwner := self.'; cr
    ].
    aStream
        nextPutAll: '    (self'; cr; nextPutAll: '        yourself'.

    self storeRectOn: aStream indentString: indentString.

"    self handlers keysDo: [ :symbol |
        ((self handlers at: symbol) isKindOf: Symbol) ifTrue: [
            aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'when: #', symbol,' perform: #', (self handlers at: symbol).
            ].
    ]."

    (self foreColor  ~= self defaultForeColor ) ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'cpForeColor: ', (ColorConstants keyAtValue: foreColor).
    ].

    ( self realBackColor  ~= self defaultBackColor ) ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'cpBackColor: ', (ColorConstants keyAtValue: backColor).
    ].!
 
storeOn: aStream indentString: indentString mdi: mdi

    self storeOn: aStream indentString: indentString!
   
supportedEvents

    ^#()!

usesMenu

    ^false!
 
usesTitle

    ^false! !



!WBPMenu class methods ! !



!WBPMenu methods !
  
allSelectors

    | allSelectors newSelectors |

    allSelectors := Dictionary new.

    children do: [ :m |
        newSelectors := m allSelectors.
        newSelectors keysDo: [ :k |
            allSelectors at: k asSymbol put: (newSelectors at: k).
        ].
    ].

    ^allSelectors.!

asMenu

    | menu |

    menu := Menu new.
    menu title: ''.
    children do: [ :c |
        c appendTo: menu.
    ].

    ^menu!
  
printOn: aStream

    aStream nextPutAll: 'a ', self class name.!
 
storeOn: aStream indentString: indentString

    | mainMenu |

    mainMenu := WBPMenuItem new.
    mainMenu children: children.
    mainMenu storeOn: aStream indentString: indentString.! !



!PThreeStateButton class methods !
   
styleFrom: s

    (s bitIsOn: BsAuto3state) ifFalse: [
        ^#threeState
    ] ifTrue: [
        ^#autoThreeState
    ].! !



!PThreeStateButton methods !

styles

    ^#(autoThreeState threeState)!

winUserStyle

    style == #threeState ifTrue: [
        ^Bs3state
    ].

    ^BsAuto3state! !



!WBTreeNode class methods !

new

    ^super new initialize! !



!WBTreeNode methods !

addChild: aChild

    children addLast: aChild.
    aChild setParent: self.!
 
addChild: aChild afterNode: aNode

    children add: aChild after: aNode.
    aChild setParent: self.!
   
addChild: aChild  beforeNode: aNode

    children add: aChild before: aNode.
    aChild setParent: self.!

allRelations

    | root |

    root := self.

    [ root isRoot ] whileFalse: [
        root := root parent.
    ].

    ^root asFlatList!
   
asFlatList

    | newList |

    newList := OrderedCollection new.

    (self isRoot) ifFalse: [
        newList add: self.
    ].

    children do: [ :c |
        newList addAll: c asFlatList.
    ].

    ^newList!
   
canExdent

    ^self isRoot not and:  [ parent isRoot not ].!
 
canIndent

    ^self previousSibling notNil!
  
canMoveDown

    ^self nextSibling notNil |
        (self isRoot not and: [ parent nextSibling notNil ]).!
   
canMoveUp

    ^self previousSibling notNil |
        (self isRoot not and: [ parent previousSibling notNil ]).!
 
childAfter: aChild

    ^children after: aChild ifNone: [ nil ]!
  
childBefore: aChild

    ^children before: aChild ifNone: [ nil ]!

children

    ^children!
  
children: c

    children := c!
   
copySpecificsTo: copy!
  
delete

    children notEmpty ifTrue: [
        (MessageBox confirm: self deleteMessage) ifFalse: [
            ^nil
        ].
    ].

    parent removeChild: self.!
  
deleteMessage

    ^
'Deleting this item will cause subitems to be irretrievably destroyed.                                 Do you wish to do so?'!
  
depth

    (self isRoot or: [ parent isRoot ])  ifTrue: [
        ^0
    ] ifFalse: [
        ^parent depth + 1
    ].!
   
descendantsCount

    | count |

    count := 1.
    children do: [ :c |
        count := count + c descendantsCount.
    ].

    ^count!
  
exdent

    parent  isRoot ifFalse: [
        self parent: parent parent positioningAfter: parent.
        self shiftLeft.
    ].!
 
firstChild

    children isEmpty ifTrue: [ ^nil ].

    ^children first!

fullCopy

    | copy |

    copy := self class new.
    self fullCopyTo: copy withParent: nil.

    ^copy!
   
fullCopyTo: copy  withParent: aParent

    | new |

    copy setChildren: (
        children collect: [ :c |
            new := c class new.
            c fullCopyTo: new withParent: copy.
            new
        ]
    ).

    copy setCurrentString: currentString.
    copy setListString: listString.
    copy setParent: aParent.
    self copySpecificsTo: copy.!
   
hasChildren

    ^children notEmpty!
  
indent

    | newParent |

    self canIndent ifTrue: [
        newParent := self previousSibling.
        self parent: newParent.
        self shiftRight.
    ].!
 
indentString

    ^'...'!
 
initialize

    children := OrderedCollection new.
    listString := ''.
    currentString := ''.!
  
insertNode: aNode

    children notEmpty ifTrue: [
        self addChild: aNode beforeNode: children first
    ] ifFalse: [
        parent addChild: aNode afterNode: self.
    ].!
   
isLeaf

    ^self hasChildren not!

isRoot

    ^parent isNil!

lastChild

    children isEmpty ifTrue: [ ^nil ].

    ^children last!
  
listString

    (self isRoot) ifTrue: [
        ^'ROOT'
    ] ifFalse: [
        ^currentString
    ].!
   
listString: aString

   listString := aString.
   currentString := listString.

    self depth timesRepeat: [
        currentString := self indentString, currentString.
    ].!
 
moveDown

    | nextSibling parentSibling |

    self isRoot ifTrue: [
        ^self
    ].

    (nextSibling := self nextSibling) notNil ifTrue: [
        parent removeChild: self.
        parent addChild: self afterNode: nextSibling.
    ] ifFalse: [
        parentSibling := parent nextSibling.
        (parentSibling notNil) ifTrue: [
            parent removeChild: self.
            (nextSibling := parentSibling firstChild) notNil ifTrue: [
                parentSibling addChild: self beforeNode: nextSibling.
            ] ifFalse: [
                parentSibling addChild: self.
            ].
        ].
    ].!
 
moveUp

    | prevSibling parentSibling |

    self isRoot ifTrue: [
        ^self
    ].

    (prevSibling := self previousSibling) notNil ifTrue: [
        parent removeChild: self.
        parent addChild: self beforeNode: prevSibling.
    ] ifFalse: [
        parentSibling := parent previousSibling.
        (parentSibling notNil) ifTrue: [
            parent removeChild: self.
            (prevSibling := parentSibling lastChild) notNil ifTrue: [
                parentSibling addChild: self afterNode: prevSibling.
            ] ifFalse: [
                parentSibling addChild: self.
            ].
        ].
    ].!

nextSibling

    self isRoot ifTrue: [
        ^nil
    ].

    ^parent childAfter: self.!

nonHierarchicalPosition

    self isRoot ifTrue: [
        ^0
    ].

    ^parent nonHierarchicalPosition + self siblingPosition!
 
parent

    ^parent!
  
parent: aNode

    parent removeChild: self.
    aNode addChild: self.!
  
parent: aNode positioningAfter: sibling

    parent removeChild: self.
    aNode addChild: self afterNode: sibling.!
 
positionOf: anEntry

    | position |

    position := 1.

    children do: [ :c |
        c == anEntry ifTrue: [
            ^position
        ].
        position := position + c descendantsCount.
    ].

    self error:  'Child missing'!

previousSibling

    self isRoot ifTrue: [
        ^nil
    ].

    ^parent childBefore: self.!
   
printOn: aStream

    self isRoot ifTrue: [
        aStream nextPutAll: '(ROOT)'.
    ] ifFalse: [
        aStream nextPutAll: '(', parent listString, '>>', currentString, ')'.
    ].!
  
removeChild: aChild

    children remove: aChild.!

setChildren: aList

    children := aList!

setCurrentString: aString

    currentString := aString!
  
setListString: aString

    listString := aString.!
   
setParent: aParent

    parent := aParent!

shiftLeft

    children do: [ :c |
        c shiftLeft.
    ].

    (currentString size < self indentString size) ifTrue: [ ^self ].

    currentString := currentString copyFrom: self indentString size + 1 to: currentString size.!
  
shiftRight

    children do: [ :c |
        c shiftRight.
    ].

    currentString := self indentString, currentString.!
 
siblingPosition

    ^parent positionOf: self!

updateListStrings

    children do: [ :c |
        c listString: c title.
        c updateListStrings.
    ].!
 
withoutEmptyNodes

    | newNode |

    newNode := self copy.

    newNode children: (
        (children select: [ :c |
            c title trimBlanks notEmpty
        ]) collect: [ :c |
            c withoutEmptyNodes.
        ]
    ).

    ^newNode! !



!WBMenuEditor class methods !

isWBInternalClass

    ^true! !



!WBMenuEditor methods !

accelCheckBoxChanged: accelCheckBox

    accelCheckBox selection  ifFalse: [
        keyShortCutEditor accelerator: nil.
    ].!

action: aPane

    "Link this menu option to an action"

    | item list itemIndex |

    list := menuItemsEditor contents asFlatList.
    itemIndex := menuItemsEditor selection.
    list size < itemIndex ifTrue: [
        ^self
    ].
    item := list at: itemIndex.

    WBActionEditor new openOn: item.

    self fillInCurrentItem.!
  
allowAttributesFor: anItem

    ^anItem hasChildren not & anItem isSeparator not!
 
allowDividerFor: anItem

    ^anItem hasChildren not!
 
cancel: ignore
    Notifier isAltDown ifTrue: [ ^editedMenu inspect ].
    self close!

checkKeyAccels

    | currentItem  accelerator |

    currentItem := menuItemsEditor selectedItem.
    accelerator := currentItem accelerator.
    currentItem allRelations do: [ :p |
        p ~= currentItem ifTrue: [
            (accelerator notNil and: [ p accelerator = accelerator ]) ifTrue: [
                ^MessageBox messageNote:  ' Another menu item (', p title stripMnemonic trimBlanks asQuotedString, ') already uses the accelerator ', accelerator fullKeyName,'.  Please choose another.'
            ].
        ].
    ].!
   
checkMnemonics

    | currentItem  mnemonic |

    currentItem := menuItemsEditor selectedItem.
    mnemonic := currentItem listString mnemonicChar.

    currentItem parent children do: [ :p |
        p ~= currentItem ifTrue: [
            mnemonic notNil & (p listString mnemonicChar = mnemonic) ifTrue: [
                ^MessageBox messageNote:  'Another menu item (', p listString stripMnemonic trimBlanks asQuotedString, ') already uses the mnemonic ~', mnemonic asUpperCase asString, '.  Please choose another.'
            ].
        ].
    ].!

commitSelection: menuItemEditor

    | oldIndex |

    (oldIndex := menuItemEditor previousSelection) notNil ifTrue: [
        self updateItem: oldIndex.
    ].

    ^true!

deleteItem: ignore

    menuItemsEditor deleteSelection.
    self fillInCurrentItem.!

disableAttributes: bool

    | currentItem |

    currentItem := menuItemsEditor selectedItem.

    (bool) ifTrue: [
        hasAccelCheckBox disable.
        isAlt disable.
        isCtrl disable.
        isShift disable.
        keyShortCutEditor disable.
        selectorEditor disable.
        (self paneNamed: 'linkButton') disable.
        (self paneNamed: 'actionButton') disable.
    ] ifFalse: [
        hasAccelCheckBox enable.
        isAlt enable.
        isCtrl enable.
        isShift enable.
        keyShortCutEditor enable.
        selectorEditor enable.
        (self paneNamed: 'linkButton') enable.
        (self paneNamed: 'actionButton') enable.
   ].!
  
fillInCurrentItem

    | currentItem |

    currentItem := menuItemsEditor selectedItem.

    self updateTestButton.

    currentItem selector isMessage ifTrue: [
        currentItem selector receiver isWBAction ifTrue: [
            selectorEditor contents: '<Action: ',currentItem selector receiver script asString,'>'
        ] ifFalse: [
            selectorEditor contents: '<Link: ',currentItem selector receiver asString,'>'
        ].
    ] ifFalse: [ currentItem selector notNil ifTrue: [
        selectorEditor contents: currentItem selector asString.
    ] ifFalse: [
        selectorEditor contents: ''.
    ]].

    dividerState selection: currentItem isSeparator & currentItem hasChildren not.

    self disableAttributes: (self allowAttributesFor: currentItem) not.
    (self allowDividerFor: currentItem) ifTrue: [
        dividerState enable.
    ] ifFalse: [
        dividerState disable.
    ].

    keyShortCutEditor
        accelerator: currentItem accelerator;
        selectAll.

    (self allowAttributesFor: currentItem) ifFalse: [
        keyShortCutEditor accelerator: nil.
    ].

    isShift selection: (currentItem hasChildren not & currentItem accelerator notNil and: [ currentItem accelerator isShift ]).
    isCtrl selection: (currentItem hasChildren not & currentItem accelerator notNil and: [ currentItem accelerator isCtrl ]).
    isAlt selection: (currentItem hasChildren not & currentItem accelerator notNil and: [ currentItem accelerator isAlt ]).
    hasAccelCheckBox selection: currentItem hasChildren not & keyShortCutEditor contents notEmpty.

    currentItem canExdent not ifTrue: [
        shiftLeftButton disable.
    ] ifFalse: [
        shiftLeftButton enable.
    ].
    currentItem canIndent not ifTrue: [
        shiftRightButton disable
    ] ifFalse: [
        shiftRightButton enable.
    ].

    currentItem canMoveUp not ifTrue: [
        shiftUpButton disable.
    ] ifFalse: [
        shiftUpButton enable.
    ].

    currentItem canMoveDown not ifTrue: [
        shiftDownButton disable.
    ] ifFalse: [
        shiftDownButton enable.
    ].!
 
getTestItMenu: button

    | m |

    self updateItem: menuItemsEditor selection.
    m :=  menuItemsEditor contents asMenu.
    m owner: self.
    button setPopupMenu: m.!
 
initializeOn: aPMenu

    (aPMenu hasChildren) ifFalse: [
        aPMenu addChild: WBPMenuItem new.
    ].

    aPMenu updateListStrings.
    menuItemsEditor contents: aPMenu.
    (self paneNamed: 'listEntryField')
        contents: aPMenu firstChild title;
        selectAll.
    menuItemsEditor selectIndex: 1.

    self fillInCurrentItem.!
 
initInstVars

    keyShortCutEditor := (self paneNamed: 'keyShortCutEditor').
    hasAccelCheckBox := (self paneNamed: 'hasAccelCheckBox').
    isShift := (self paneNamed: 'isShift').
    isAlt := (self paneNamed: 'isAlt').
    isCtrl := (self paneNamed: 'isCtrl').
    dividerState := (self paneNamed: 'dividerState').
    shiftUpButton := (self paneNamed: 'shiftUpButton').
    shiftDownButton := (self paneNamed: 'shiftDownButton').
    shiftLeftButton := (self paneNamed: 'shiftLeftButton').
    shiftRightButton := (self paneNamed: 'shiftRightButton').
    testItButton := (self paneNamed: 'testItButton').
    menuItemsEditor := (self paneNamed: 'menuItemsEditor').
    selectorEditor := (self paneNamed: 'selectorEditor').!

initWindow

    self initInstVars.
    (self paneNamed: 'listEntryField')
        owningListBox: menuItemsEditor.

    self initializeOn: editedMenu.!

insertItem: ignore

    menuItemsEditor insertAfterSelection.
    self fillInCurrentItem.!
   
isWBWindow

    ^true!

link: aPane

    "Link this menu option to a ViewManager"

    | item list itemIndex |

    list := menuItemsEditor contents asFlatList.
    itemIndex := menuItemsEditor selection.
    list size < itemIndex ifTrue: [
        ^self
    ].
    item := list at: itemIndex.

    WBLinkEditor new openOn: item.

    self fillInCurrentItem.!
  
menuItemNameChanged: menuEditor

    "If the name is a dash and it's legit, make the item a divider."

    | currentItem titleIsSeparator |

    self checkMnemonics.
    self updateTestButton.

    currentItem := menuEditor selectedItem.
    (self allowDividerFor: currentItem) ifFalse: [
        ^self
    ].

    titleIsSeparator := currentItem title notEmpty and: [ currentItem title first = $- ].

    (titleIsSeparator) ifTrue: [
        dividerState selection: true.
        currentItem isSeparator: true.
        self newDividerState: dividerState.
    ] ifFalse: [

     "If it was a divider, and isn't now, turn the divider off"
        (currentItem isSeparator & titleIsSeparator not) ifTrue: [
            dividerState selection: false.
            currentItem isSeparator: false.
            self newDividerState: dividerState.
        ].
    ].!
  
newAccelerator: anEntryField

    | accel |

    self warnOfAccelerators.

    self checkKeyAccels.

    (accel := anEntryField accelerator) notNil ifTrue: [
        isAlt selection: accel isAlt.
        isCtrl selection: accel isCtrl.
        isShift selection: accel isShift.
    ].

    hasAccelCheckBox selection:  accel notNil.!
 
newDividerState: checkBox

    | isNowDivider  |

    isNowDivider := checkBox selection.

    keyShortCutEditor contents: ''.

    hasAccelCheckBox selection: false.
    self disableAttributes: (self allowAttributesFor: menuItemsEditor selectedItem) not | isNowDivider.

    isNowDivider ifTrue: [
        menuItemsEditor setSelectionText:  '--------'.
     ].!
 
newMenuClass

    ^WBPMenu!
   
ok: ignore

    self updateItem: menuItemsEditor selection.
    result := self pMenu.
    super close!
  
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'Menu Editor';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 1417 @ 568; xC; yC; cRDU: (11 @ 558 rightBottom: 1406 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 503 @ 340; lDU: 878 r: #left; rDU: 1381 r: #left; tDU: 60 r: #top; bDU: 400 r: #top);
                    paneName: 'itemAttributesGroupbox';
                    startGroup;
                    contents: 'Item attributes';
                    yourself
            );
            addSubpane: (
                StaticBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 462 @ 4; lDU: 901 r: #left; rDU: 1362 r: #left; tDU: 236 r: #top; bDU: 240 r: #top);
                    paneName: 'pane2';
                    blackRectangle;
                    startGroup;
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 135 @ 32; lDU: 896 r: #left; rDU: 1031 r: #left; tDU: 120 r: #top; bDU: 152 r: #top);
                    paneName: 'pane1';
                    startGroup;
                    contents: 'Selector:';
                    yourself
            );
            addSubpane: (
                WBListEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 585 @ 48; lDU: 21 r: #left; rDU: 606 r: #left; tDU: 18 r: #top; bDU: 66 r: #top; indent: 3 @ 4);
                    paneName: 'listEntryField';
                    startGroup;
                    tabStop;
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 329 @ 48; lDU: 1038 r: #left; rDU: 1367 r: #left; tDU: 112 r: #top; bDU: 160 r: #top; indent: 3 @ 4);
                    paneName: 'selectorEditor';
                    startGroup;
                    tabStop;
                    when: #textChanged perform: #selectorEditorChanged:;
                    yourself
            );
            addSubpane: (
                WBKeyEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 263 @ 48; lDU: 1104 r: #left; rDU: 1367 r: #left; tDU: 264 r: #top; bDU: 312 r: #top; indent: 3 @ 4);
                    paneName: 'keyShortCutEditor';
                    startGroup;
                    tabStop;
                    when: #keyEntered perform: #newAccelerator:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 222 @ 60; lDU: 626 r: #left; rDU: 848 r: #left; tDU: 76 r: #top; bDU: 136 r: #top);
                    paneName: 'insertItemButton';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #insertItem:;
                    contents: '&Insert';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 222 @ 60; lDU: 626 r: #left; rDU: 848 r: #left; tDU: 140 r: #top; bDU: 200 r: #top);
                    paneName: 'deleteItemButton';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #deleteItem:;
                    contents: 'De&lete';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 222 @ 60; lDU: 626 r: #left; rDU: 848 r: #left; tDU: 208 r: #top; bDU: 268 r: #top);
                    paneName: 'shiftUpButton';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #shiftUp:;
                    contents: 'Shift &up';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 222 @ 60; lDU: 626 r: #left; rDU: 848 r: #left; tDU: 272 r: #top; bDU: 332 r: #top);
                    paneName: 'shiftDownButton';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #shiftDown:;
                    contents: 'Shift do&wn';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 222 @ 62; lDU: 626 r: #left; rDU: 848 r: #left; tDU: 340 r: #top; bDU: 402 r: #top);
                    paneName: 'testItButton';
                    startGroup;
                    tabStop;
                    when: #getPopupMenu perform: #getTestItMenu:;
                    when: #clicked perform: #testMenu:;
                    contents: '&Test menu';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 155 @ 40; lDU: 901 r: #left; rDU: 1056 r: #left; tDU: 176 r: #top; bDU: 216 r: #top);
                    paneName: 'dividerState';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #newDividerState:;
                    contents: 'Di&vider';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 155 @ 60; lDU: 1074 r: #left; rDU: 1230 r: #left; tDU: 168 r: #top; bDU: 228 r: #top);
                    paneName: 'actionButton';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #action:;
                    contents: 'Action...';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 128 @ 60; lDU: 1239 r: #left; rDU: 1367 r: #left; tDU: 168 r: #top; bDU: 228 r: #top);
                    paneName: 'linkButton';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #link:;
                    contents: 'Li&nk...';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 201 @ 40; lDU: 901 r: #left; rDU: 1102 r: #left; tDU: 268 r: #top; bDU: 308 r: #top);
                    paneName: 'hasAccelCheckBox';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #accelCheckBoxChanged:;
                    contents: '&Key accel:';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 123 @ 40; lDU: 949 r: #left; rDU: 1072 r: #left; tDU: 340 r: #top; bDU: 380 r: #top);
                    paneName: 'isShift';
                    startGroup;
                    tabStop;
                    contents: '&Shift';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 80 @ 40; lDU: 1083 r: #left; rDU: 1163 r: #left; tDU: 340 r: #top; bDU: 380 r: #top);
                    paneName: 'isAlt';
                    startGroup;
                    tabStop;
                    contents: '&Alt';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 183 @ 40; lDU: 1173 r: #left; rDU: 1355 r: #left; tDU: 340 r: #top; bDU: 380 r: #top);
                    paneName: 'isCtrl';
                    startGroup;
                    tabStop;
                    contents: 'Cont&rol';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 290 @ 60; lDU: 21 r: #left; rDU: 311 r: #left; tDU: 424 r: #top; bDU: 484 r: #top);
                    paneName: 'shiftLeftButton';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #shiftLeft:;
                    contents: '<< &Demote item';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 290 @ 60; lDU: 318 r: #left; rDU: 608 r: #left; tDU: 424 r: #top; bDU: 484 r: #top);
                    paneName: 'shiftRightButton';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #shiftRight:;
                    contents: '&Promote item >>';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 231 @ 60; lDU: 878 r: #left; rDU: 1109 r: #left; tDU: 424 r: #top; bDU: 484 r: #top);
                    paneName: 'okButton';
                    idOK;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 233 @ 60; lDU: 1147 r: #left; rDU: 1381 r: #left; tDU: 424 r: #top; bDU: 484 r: #top);
                    paneName: 'cancelButton';
                    idCancel;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: '&Cancel';
                    yourself
            );
            addSubpane: (
                WBTreeListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 585 @ 326; lDU: 21 r: #left; rDU: 606 r: #left; tDU: 76 r: #top; bDU: 402 r: #top);
                    paneName: 'menuItemsEditor';
                    ownerDrawFixed;
                    startGroup;
                    tabStop;
                    when: #preSelect perform: #commitSelection:;
                    when: #textChanged perform: #menuItemNameChanged:;
                    when: #select perform: #selectedItem:;
                    yourself
            );
        yourself
    ).

    self openWindow!
 
openOn: aMenu

    aMenu isNil ifTrue: [
        editedMenu := self newMenuClass new.
    ] ifFalse: [
        editedMenu := aMenu fullCopy.
    ].
    ^self open.!
 
pMenu

    ^menuItemsEditor contents withoutEmptyNodes!
   
result

    ^result!
  
selectedItem: itemsPane

    self fillInCurrentItem.!
 
selectorEditorChanged: aPane

    (selectorEditor contents size ~= 0) & (self allowAttributesFor: menuItemsEditor selectedItem) not ifTrue: [
        MessageBox message: 'Cannot set attributes for top level menus.  Press Cr to insert an item, then promote it with Promote item to add menu items to a menu.'.
        selectorEditor setContents: ''.
        menuItemsEditor
            sendInputEvent: #setFocus.
    ].!
   
shiftDown: ignore

    menuItemsEditor shiftSelectionDown.!
   
shiftLeft: ignore

    menuItemsEditor exdentSelection.!
  
shiftRight: ignore

    menuItemsEditor indentSelection.!
 
shiftUp: ignore

    menuItemsEditor shiftSelectionUp.!
   
testMenu: ignore

    testItButton setPopupMenu:  nil.
    testItButton doPopupMenuAt: testItButton cursorWindowPosition!

updateItem: itemIndex

    | item accel list |

    list := menuItemsEditor contents asFlatList.
    list size < itemIndex ifTrue: [
        ^self
    ].

    item := list at: itemIndex.

    item isSeparator: dividerState selection.

    hasAccelCheckBox selection  ifTrue: [
        accel := keyShortCutEditor accelerator.
        accel isAlt: isAlt selection.
        accel isShift: isShift selection.
        accel isCtrl: isCtrl selection.
        item accelerator: accel.
     ] ifFalse: [
        item accelerator: nil.
    ].

    selectorEditor contents trimBlanks notEmpty ifTrue: [
        (selectorEditor contents first == $<) ifFalse: [
            item selector: selectorEditor contents trimBlanks asSymbol.
        ].
    ] ifFalse: [
         item selector: nil.
    ].!
 
updateTestButton

    self pMenu hasChildren ifTrue: [
        testItButton enable.
    ] ifFalse: [
        testItButton disable.
    ].!

warnOfAccelerators

    warnedAboutAccelerators isNil ifTrue: [
        MessageBox messageNote: 'Warning: Keyboard accelerators in popup menus are not supported in Smalltalk/V.   Those you add here will appear visually, but must be in a menubar to truly function.'.
        warnedAboutAccelerators := true.
    ].! !



!PListBox class methods !
  
styleFrom: s

    (s bitIsOn: LbsOwnerdrawfixed) ifTrue: [
        ^#ownerDrawFixed
    ].
    (s bitIsOn: LbsOwnerdrawvariable) ifTrue: [
        ^#ownerDrawVariable
    ].

    ^#defaultStyle! !



!PListBox methods !

attributeEditor

    ^WBListEditor new!
   
copySpecificsTo: aPane

    aPane contents: self contents.!
   
defaultFont

    ^PWindowBuilder wbDefaultFont
    "^ListFont"!
  
displayWith: aPen
    | list newPoint region |
    self displayWithLeftScrollBar: aPen.

    "Draw the list contents"
    list := self contents.
    list isNil
        ifFalse: [
            aPen
                foreColor: self foreColor;
                backColor: self backColor;
                font: self font.
            region := aPen setClipRect:
                ((rect insetBy: 1@1) expandBy: (0@0 extent: self scrollBarWidth negated@0)).
            newPoint := (rect insetBy: 3@1) leftTop.
            1 to: list size do: [ :i |
                aPen displayText: (list at: i) at: newPoint.
                newPoint := newPoint down: aPen font height ].
            aPen destroyRegion: region].!
 
genReceiveWindowMessagesOn: aStream indentString: spaceString

    "Don't generate method for EntryField or ListBox - they already have it"!
  
importantEvents

    ^super importantEvents
        addFirst: #doubleClickSelect;
        addFirst: #select;
        yourself!
 
mutateSpecificsFrom: aPane
    | list |
    ((list := aPane contents) notNil and: [ list isArray ]) ifTrue: [
        self contents: list deepCopy
    ].!
  
mutationExceptions

    ^#(CPScrollingPane)!
  
mutationTypes

    ^#(ListBox CPScrollingPane RadioButtonGroup)!
  
pmClassStyle

    ^LbsNotify | LbsNointegralheight!
   
storeSpecificsOn: aStream indentString: indentString
    "Write out the list"
    self contents isNil ifFalse: [
        (self contents isArray and: [ self contents notEmpty ]) ifTrue: [
            aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'contents: #( '.
                self contents do:[ :item | aStream nextPutAll: item asQuotedString,' ' ].
                aStream nextPutAll: ')' ] ].!

styles

    ^#(defaultStyle ownerDrawFixed ownerDrawVariable)!

winUserStyle

    style == #defaultStyle ifFalse: [
        style == #ownerDrawFixed ifTrue: [
            ^LbsOwnerdrawfixed
        ] ifFalse: [
            ^LbsOwnerdrawvariable
        ].
    ].

    ^0! !



!PLinkButton class methods ! !



!PLinkButton methods !
 
attributeEditor

    Notifier isAltDown ifTrue: [
        ^super attributeEditor
    ] ifFalse: [
        ^WBLinkEditor new
    ].!
   
copySpecificsTo: aPane

    aPane
        link: self link;
        type: self type.!

importantEvents

    ^super importantEvents
        remove: #clicked;
        yourself!
 
link

    ^link!
  
link: aString

    link := aString!
   
readSpecificsFrom: c

    super readSpecificsFrom: c.
    self link: (c link isNil
        ifTrue: [ nil ]
        ifFalse: [ c link asString ]).
    self type: c type asString.!

storeContentsOn: aStream indentString: spaceString

    super storeContentsOn: aStream indentString: spaceString.

    (self link notNil and: [ self link notEmpty ]) ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'link: #',self link
    ].
    (self type notNil and: [ self type notEmpty ]) ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'type: #',self type
    ].!

type

    ^type!
  
type: aString

    type := aString! !



!PRadioButton class methods !

purgeCache

    RadioBitmap notNil ifTrue: [
        RadioBitmap release.
    ].
    RadioBitmap := nil.!
  
styleFrom: s

    (s bitIsOn: BsAutoradiobutton) ifFalse: [
        ^#radioButton
    ] ifTrue: [
        ^#autoRadioButton
    ].! !



!PRadioButton methods !
  
displayleftIconAt: p with: aPen

    aPen
        place: ((p extent: self iconExtent) center down: 1);
        circle: self iconExtent // 2!

styles

    ^#(autoRadioButton radioButton)!
  
winUserStyle

    style == #radioButton ifTrue: [
        ^BsRadiobutton
    ].

    ^BsAutoradiobutton! !



!PWBToolBar class methods ! !



!PWBToolBar methods !
  
attributeEditor

    ^WBToolBarEditor new!

cellSize

    ^cellSize ifNil: [ cellSize := self defaultCellSize ].!
 
cellSize: aPoint

    cellSize := aPoint!
 
changesSize

    ^true!
   
copySpecificsTo: aPane

    aPane
        cellSize: self cellSize deepCopy;
        useSystem: self useSystem;
        elements: self elements deepCopy.!
  
defaultCellSize

    ^25 @ 22!

displayElement: key with: aPen

    | element |

    element := self elements at: key.
    element isNil ifTrue: [ ^nil ].

    aPen
        copy: element pen
        from: element boundingBox
        to: (element rectangle translateBy: (rect leftTop right: 1)).!
   
displayWith: aPen

    | just s aRect |

    aPen fill: rect color: self backColor.

    self elements isEmpty ifTrue: [
        aPen
            place: rect origin;
            box: rect corner.
    ] ifFalse: [
        1 to: self elements size do: [ :i | self displayElement: i with: aPen]
    ].!
 
elements

    ^elements ifNil: [ elements := OrderedCollection new ].!

elements: aCollectionOfWBTools

    elements := aCollectionOfWBTools!
 
extraHandlers

    | aCollection |
    aCollection := OrderedCollection new.
    self elements do: [ :element |
        (element selector isNil or: [ element selector isEmpty ]) ifFalse: [
            aCollection add: element selector asSymbol
        ].
        (element rbSelector isNil or: [ element rbSelector isEmpty ]) ifFalse: [
            aCollection add: element rbSelector asSymbol
        ].
    ].
    ^aCollection!

framingBlock: f
    | width |
    self style == #mdiToolBar ifFalse: [
        ^super framingBlock: f
    ].
    parentWindow isNil ifTrue: [
        width := 300
    ] ifFalse: [
        width := parentWindow rect width
    ].
    framingBlock := FramingParameters new
        iDUE: width @ (self cellSize y / (SysFont height / 32));
        lDU: 0 r: #left;
        rDU: 0 r: #right;
        tDU: 0 r: #top;
        bDU: self cellSize y / (SysFont height / 32) r: #top!
  
importantEvents

    ^super importantEvents
        addFirst: #select;
        add: #selecting;
        add: #doubleClick;
        add: #gettingFocus;
        add: #showHelp;
        yourself!

maxSize

    ^32000@(self suggestedSize y)!
   
minSize

    ^self cellSize!
  
readSpecificsFrom: c

    self
        cellSize: c cellSize;
        useSystem: c useSystem;
        style: c tpStyle;
        elements: c elements.!
 
storeSpecificsOn: aStream indentString: indentString

    self useSystem ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'useSystem: true'.
    ] ifFalse: [ self cellSize = self defaultCellSize ifFalse: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'cellSize: ', self cellSize printString.
    ]].

    self elements do: [ :element |
        (element bitmapSelector notNil and: [ element bitmapSelector notEmpty ]) ifTrue: [
            aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'add: '.
            element bitmapSelector trimBlanks = element selector trimBlanks ifFalse: [
                aStream nextPut: $#; nextPutAll: element bitmapSelector asString; nextPutAll: ' selector: '.
            ].
            (element selector isNil or: [ element selector isEmpty ]) ifTrue: [
                aStream nextPutAll: 'nil'
            ] ifFalse: [
                aStream nextPut: $#; nextPutAll: element selector asString
            ].
            element numSpaces > 0 ifTrue: [
                aStream nextPutAll: ' spaces: '; nextPutAll: element numSpaces asString
            ].
            (element rbSelector notNil and: [ element rbSelector notEmpty ]) ifTrue: [
                aStream nextPutAll: ' rbSelector: #'; nextPutAll: element rbSelector asString
            ].
        ].
    ].!

style: aStyle

    super style: aStyle.
    aStyle == #mdiToolBar ifTrue: [
        framingBlock := FramingParameters new
            lDU: 0 r: #left;
            rDU: 0 r: #right;
            tDU: 0 r: #top;
            bDU: self cellSize y / (SysFont height / 32) r: #top.
        self parent notNil ifTrue: [ self reframe: self parent rect ].
        ^nil
    ].!
   
styles

    ^#(toggle preAutomatic postAutomatic mdiToolBar)!
 
suggestedSize

    self elements isEmpty ifTrue: [
        ^self cellSize
    ] ifFalse: [
        ^((elements at: elements size) rectangle right + 2) @ (self cellSize y)
    ]!
 
usesFraming

    ^self style ~~ #mdiToolBar!
  
useSystem

    ^useSystem ifNil: [ useSystem := false ].!
 
useSystem: aBoolean

    useSystem := aBoolean! !



!WBListEditor class methods ! !



!WBListEditor methods !
   
add: aPane

    list add: item contents.
    listBox contents: list.
    item selectAll; setFocus.!
 
change: aPane

    listBox selection isNil ifTrue: [ ^nil ].
    list at: listBox selection put: item contents.
    listBox contents: list.
    self disable.!
 
delete: aPane

    Notifier isAltDown
        ifTrue: [ list := OrderedCollection new ]
        ifFalse: [
            listBox selection isNil ifTrue: [ ^nil ].
            list removeIndex: listBox selection].
    listBox contents: list.
    self disable.!
   
disable

    (self paneNamed: #insert) disable.
    (self paneNamed: #change) disable.
    (self paneNamed: #delete) disable.
    item setFocus.!
  
enable

    (self paneNamed: #insert) enable.
    (self paneNamed: #change) enable.
    (self paneNamed: #delete) enable.!
  
initWindow

    list := thePane contents.
    list isNil
        ifTrue: [ list := OrderedCollection new ]
        ifFalse: [ list := list asOrderedCollection].
    (listBox := self paneNamed: 'list') contents: list.
    item := self paneNamed: #item!
  
insert: aPane

    listBox selection isNil ifTrue: [ ^nil ].
    list add: item contents beforeIndex: listBox selection.
    listBox contents: list.
    self disable.!

ok: ignore

    thePane
        contents: list asArray.

    self close!
   
open


     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'List Attributes';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 823 @ 432; lDU: 459 r: #left; tDU: 236 r: #top; cRDU: (11 @ 422 rightBottom: 811 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 558 @ 48; lDU: 18 r: #left; rDU: 576 r: #left; tDU: 16 r: #top; bDU: 64 r: #top; indent: 3 @ 4);
                    paneName: 'item';
                    startGroup;
                    tabStop;
                    yourself
            );
            addSubpane: (
                ListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 555 @ 224; lDU: 21 r: #left; rDU: 576 r: #left; tDU: 80 r: #top; bDU: 304 r: #top);
                    paneName: 'list';
                    startGroup;
                    tabStop;
                    when: #select perform: #select:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 594 r: #left; rDU: 777 r: #left; tDU: 16 r: #top; bDU: 72 r: #top);
                    paneName: 'add';
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #add:;
                    contents: '&Add';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 594 r: #left; rDU: 777 r: #left; tDU: 80 r: #top; bDU: 136 r: #top);
                    paneName: 'insert';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #insert:;
                    contents: '&Insert';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 594 r: #left; rDU: 777 r: #left; tDU: 144 r: #top; bDU: 200 r: #top);
                    paneName: 'change';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #change:;
                    contents: '&Change';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 594 r: #left; rDU: 777 r: #left; tDU: 208 r: #top; bDU: 264 r: #top);
                    paneName: 'delete';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #delete:;
                    contents: '&Delete';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 594 r: #left; rDU: 777 r: #left; tDU: 312 r: #top; bDU: 368 r: #top);
                    paneName: 'sort';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #sort:;
                    contents: '&Sort';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 165 @ 56; lDU: 21 r: #left; rDU: 185 r: #left; tDU: 312 r: #top; bDU: 368 r: #top);
                    paneName: 'ok';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 165 @ 56; lDU: 201 r: #left; rDU: 366 r: #left; tDU: 312 r: #top; bDU: 368 r: #top);
                    paneName: 'cancel';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: 'Cancel';
                    yourself
            );
        yourself
    ).

    self openWindow!
  
select: aPane

    item contents: listBox selectedItem; setFocus.
    self enable.!
  
sort: aPane

    list := list asSortedCollection asOrderedCollection.
    listBox  contents: list.! !



!WBTreeListBox class methods !
  
isWBInternalClass

    ^true!
 
new

    ^super new initialize.!
  
supportedEvents
        "Answer the Set of events that ListBoxes can notify
         their owners about."
    ^super supportedEvents
        add: #textChanged;
        add: #preSelect;
        yourself! !



!WBTreeListBox methods !
  
asyncControlEvent: anEvent
        "Private - Process single and double selections."
    self selectedItem isNil ifTrue: [^nil].
    anEvent= LbnSelchange
        ifTrue: [ "do nothing if a double click queued"
            (CurrentEvents
                detect: [:msg | msg selector = #asyncControlEvent:
                    and: [msg arguments size = 1
                    and: [(msg arguments at: 1) = LbnDblclk]]]
                ifNone: [nil])    "do nothing if a double click queued"
                    notNil ifTrue: [^self].
            ( self commitSelection )
                ifTrue: [
                    tempSelection := self selectedItem.
                    previousSelection := self selection.
                    self setEditBox.
                    self event: #select. ^nil ].
                self selectItem: tempSelection. ^nil ].

    anEvent = LbnDblclk
        ifTrue: [ self event: #doubleClickSelect. ^nil ].!
  
basicSelectionText: newText

    |  r |

    self selectedItem title: newText.

    r := WinRectangle new.
    UserLibrary sendMessage: self asParameter
        msg: LbGetitemrect
        wparam: self selection - 1
        lparamStruct: r asParameter.

    self invalidateRect: r asRectangle
        erase: false;
        updateWindow.!
  
commitSelection

    noSelect ifTrue: [
        noSelect := false.
        ^true
    ].

    ^self event: #preSelect!

contents: aTree

        "Set the receiver's contents to aCollection."
    list := aTree.
    handle = NullHandle
        ifFalse: [
            self noRedraw: true;
                deleteAll;
                insertArray: (list asFlatList collect: [ :i | i listString ]);
                noRedraw: false ].
    ^list!
 
cr

    (self contents asFlatList size = self selection) ifTrue: [
        self insertAfterSelection.
    ] ifFalse: [
        self moveSelectionDown.
    ].!

defaultStyle

    "Private"

   ^style := self basicStyle |
                WsBorder |
                WsVscroll |
                WsHscroll |
                LbsNotify  |
                LbsNointegralheight  |
                LbsOwnerdrawfixed!
 
delete

    owningEditBox setFocus.
    self selectedItem delete isNil ifTrue: [
        ^nil
    ].

    (self contents asFlatList size = 0) ifTrue: [
        self contents: (
            self contents
                addChild: self itemType new;
                yourself
        ).
    ].!

deleteAll
        "Private - Delete the whole list in the control.
         Subclassed by OSI to avoid anticipated later conflicts."

    self isHandleOk ifFalse: [^self].

    UserLibrary sendMessage: handle
        msg: LbResetcontent
        wparam: 0
        lparam: 0!
  
deleteSelection

    | contents |

    contents := self contents.
    owningEditBox setFocus.

    (contents asFlatList size = 1) ifTrue: [
        self contents: (
            contents
                removeChild: contents children first;
                addChild: self itemType new;
                yourself
        ).
        self wbSelectIndex: 1.
        ^self
    ].

    self performOnSelection: #delete
        selectionDelta: 0
        moveWithSelection: false.

    self selectedItem isNil ifTrue: [
        self wbSelectIndex: self contents asFlatList size.
    ].!

drawItem: aDrawStruct

    "Private - Draw the requested control item."

    | backColor foreColor |

    userDrawn := aDrawStruct.


    aDrawStruct itemState & OdsSelected = OdsSelected ifTrue:[
        backColor := UserLibrary getSysColor: ColorHighlight.
        foreColor := UserLibrary getSysColor: ColorHighlighttext.
    ] ifFalse: [
        backColor := self backColor.
        foreColor := self foreColor.
    ].

    graphicsTool
        fill: self drawBox color:  backColor;
        backColor: backColor;
        foreColor: foreColor;
        setTextAlign: TaTop;
        displayText: (self flatList at: self drawIndex) listString at: self drawBox leftTop.!
 
editBoxTextChanged

    self selectionText: owningEditBox contents.!
  
exdent

    self selectedItem exdent.
    owningEditBox setFocus.!
   
exdentSelection

    self performOnSelection: #exdent
        selectionDelta: nil
        moveWithSelection: false.
    self setEditBox.
    self event: #select!
 
flatList

    self drawIndex = self getTopIndex ifTrue: [
        cachedFlatList := list asFlatList.
    ].

    ^cachedFlatList!
 
gettingFocus

    self handle isValid ifFalse: [ ^self ].

    owningEditBox notNil ifTrue: [
        owningEditBox  sendInputEvent: #setFocus.
    ].!
   
highlight: drawStruct

    "Mask out behavior in ControlPane - we do our own highlighting in drawItem: method."
    self drawItem: drawStruct!
   
indent

    self selectedItem indent.
    owningEditBox setFocus.!
   
indentSelection

    self performOnSelection: #indent
        selectionDelta: nil
        moveWithSelection: false.
    self setEditBox.
    self event: #select!
 
initialize

    super initialize.
    list := WBTreeNode new.
    noSelect := false.!
   
insert

    | selection newNode |

    (selection := self selectedItem) notNil ifTrue: [
        newNode := self itemType new.
        selection insertNode:  newNode.
        newNode title: ''.
    ].
    owningEditBox setFocus.!
  
insertAfterSelection

    self performOnSelection: #insert
        selectionDelta: 1
        moveWithSelection: false!
  
itemType

    ^WBPMenuItem!
   
moveDown

    self selectedItem moveDown.
    owningEditBox setFocus.!
   
moveSelectionDown

    self commitSelection.
    self wbSelectIndex: ((self selection + 1) min:  list asFlatList size).
    owningEditBox setFocus.!

moveSelectionUp

    self commitSelection.
    self wbSelectIndex: ((self selection - 1) max: 1).
    owningEditBox setFocus.!
  
moveUp

    self selectedItem moveUp.
    owningEditBox setFocus.!
   
owningEditBox: aBox

    owningEditBox := aBox.!
  
performOnSelection: aSymbol  selectionDelta: delta  moveWithSelection: moveWithSelection

    |  oldPosition oldTopIndex positionDelta selection selectionIndex |

    (selection := self selectedItem) isNil ifTrue: [
        ^self
    ].

    self commitSelection.

    oldPosition := selection nonHierarchicalPosition.
    oldTopIndex := self getTopIndex.
    selectionIndex := self selection.


    (self perform: aSymbol) isNil ifTrue: [
        positionDelta := 0.  "Unsuccessful, therefore no delta"
    ] ifFalse: [
        (delta isNil) ifTrue: [
            positionDelta :=  selection nonHierarchicalPosition - oldPosition.
        ] ifFalse: [
            positionDelta := delta.
        ].
    ].

    self noRedraw: true.
    noSelect := moveWithSelection.
    self deleteAll.
    self insertArray: (list asFlatList collect: [ :i | i listString ]).
    self wbSelectIndex: ((selectionIndex + positionDelta max: 1) min: list asFlatList size).
    (moveWithSelection) ifTrue: [
        self setTopIndex: (oldTopIndex + positionDelta max: 1).
    ].
    self noRedraw: false.

    self invalidateRect: self rectangle.!
   
previousSelection

    ^previousSelection!

selectedItem

    ( self selection ) isNil   ifTrue: [
        ^nil
    ]  ifFalse: [
        ^list asFlatList at: value
    ]!
   
selectIndex: itemIndex
        "Private - Select the item at itemIndex. Index starts at 1."
    | index |
    self isHandleOk ifFalse: [^self].
    itemIndex isNil
        ifTrue: [index := 65535]
        ifFalse: [index := itemIndex - 1].
    UserLibrary sendMessage: handle
            msg: LbSetcursel
            wparam: index
            lparam: 0!
 
selectionText: newText

    | selection |

    (selection := self selectedItem) notNil ifTrue: [
        self basicSelectionText: newText.
        self event: #textChanged.
    ].!
 
setEditBox


        owningEditBox setContents: (
            self selectedItem notNil ifTrue: [
                self selectedItem title
            ] ifFalse: [
                ''.
            ]
        ).
        owningEditBox selectAll.!
  
setSelectionText: newText

    self basicSelectionText: newText.
    self setEditBox.!
   
shiftSelectionDown

    self performOnSelection: #moveDown
        selectionDelta: nil
        moveWithSelection: true.!

shiftSelectionUp

    self performOnSelection: #moveUp
        selectionDelta: nil
        moveWithSelection: true.!

usesFocus

    ^false!

virtualKeyInput: aChar

    (Notifier isKeyDown: VkControl) ifTrue: [
        aChar = VkUp ifTrue: [     self shiftSelectionUp. ^nil ].
        aChar = VkDown ifTrue: [  self shiftSelectionDown.  ^nil ].
        aChar = VkLeft ifTrue: [     self exdentSelection.  ^nil ].
        aChar = VkRight ifTrue: [   self indentSelection.  ^nil ].
        aChar = VkBack ifTrue: [ self deleteSelection. ^nil ].
    ] ifFalse: [
        aChar = VkUp ifTrue: [ self moveSelectionUp. ^nil ].
        aChar = VkDown ifTrue: [ self moveSelectionDown. ^nil ].
    ].!
 
wbSelectIndex: anIndex

    self selectIndex: anIndex.
    self event: #select.
    previousSelection := anIndex.
    self setEditBox.! !



!WBChooseClassDialog class methods !
  
isWBInternalClass

    ^true! !



!WBChooseClassDialog methods !
 
cancel: ignore

    result := nil.
    self close.!
  
classList: listOfClasses

    ^self classList: listOfClasses default: nil"(
         listOfClasses notEmpty ifTrue: [
            listOfClasses first
        ] ifFalse: [
            nil
        ]
    )    "!

classList: listOfClasses allowOthers: bool

    allowOthers := bool.

    ^self classList: listOfClasses default: (
         listOfClasses notEmpty ifTrue: [
            listOfClasses first
        ] ifFalse: [
            nil
        ]
    )!
   
classList: listOfClasses default: dClass

    classList := listOfClasses.

    default := dClass.

    self open.!

initialize

    allowOthers := true.
    super initialize.!
  
initWindow

    classListBox := self paneNamed: 'classListBox'.

    classListBox contents: (classList collect: [ :aClass |
                aClass name
            ]) asSortedCollection asOrderedCollection.

    default notNil ifTrue: [
        classListBox selection: default name.
    ] ifFalse: [
        classListBox contents notEmpty ifTrue: [
            classListBox selection: 1.
        ].
    ].

    allowOthers ifFalse: [
        (self paneNamed: 'allowOthers') hideWindow; disable.
    ].!

isWBWindow

    ^true!

ok: ignore

    result := classListBox selectedItem.
    result notNil ifTrue: [
        result := Smalltalk at: result asSymbol.
    ].

    self close.!
   
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'Choose a class:';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 658 @ 512; xC; yC; cRDU: (11 @ 502 rightBottom: 647 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                ListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 603 @ 368; lDU: 18 r: #left; rDU: 622 r: #left; tDU: 16 r: #top; bDU: 384 r: #top);
                    paneName: 'classListBox';
                    startGroup;
                    tabStop;
                    when: #doubleClickSelect perform: #selectedClass:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 146 @ 56; lDU: 18 r: #left; rDU: 165 r: #left; tDU: 392 r: #top; bDU: 448 r: #top);
                    idOK;
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 146 @ 56; lDU: 174 r: #left; rDU: 320 r: #left; tDU: 392 r: #top; bDU: 448 r: #top);
                    idCancel;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: '&Cancel';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 274 @ 56; lDU: 347 r: #left; rDU: 622 r: #left; tDU: 392 r: #top; bDU: 448 r: #top);
                    paneName: 'allowOthers';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #openNonWBView:;
                    contents: '&Non WB View...';
                    yourself
            );
        yourself
    ).

    self openWindow!
 
openNonWBView: aPane

    |className wbCreatedClasses |

    wbCreatedClasses := ViewManager wbCreatedClasses.

    className := WBListChooser fromList: ((
        (Notifier isAltDown ifFalse: [
            (ViewManager allSubclasses select: [ :c |
            (c canUnderstand: #open) and: [
            ((wbCreatedClasses includes: c) not) and: [
            c isWBInternalClass not ]]])
        ] ifTrue: [
            "Hold down ALT key to get access to WindowBuilder windows"
            (ViewManager allSubclasses select: [ :c | c isWBInternalClass ])
        ])
        collect: [ :class |
            class name
        ])) asSortedCollection asOrderedCollection prompt: 'Which ViewManager?'.

    className isNil ifTrue: [ ^self ].

    result := Smalltalk at: className asSymbol.

    self close.!
 
result

    ^result!
  
selectedClass: aClass

    "Assumes the class is already selected"

    self ok: nil.! !



!WBDialogScratchWindow class methods !
  
createMethod: methodString

    | fileInStream |

    fileInStream := ReadWriteStream on: (String new: methodString size).
    fileInStream
        nextPutAll: '!! WBDialogScratchWindow methods !!';
        nextChunkPut: methodString;
        nextChunkPut: String new.

    fileInStream reset; fileIn.!

defaultClass

    ^WBDefaultDialogScratchWindow!
  
isScratchWindow

    ^true!
   
isWBInternalClass

    ^true!
 
resetToDefault

    "self defaultClass selectors do: [:s |
        self createMethod: (self defaultClass sourceCodeAt: s).
    ]."! !



!WBDialogScratchWindow methods !
   
isWBWindow

    ^true!

perform: selector
    "Scratch windows should not perform any events"
    ^MessageBox messageNote: 'Scratch windows cannot do anything. You must first create a new view manager class with the "Save As..." command in order to add behavior.'!
  
perform: selector with: arg
    "Scratch windows should not perform any events"
    self perform: selector!
   
when: anEvent perform: aSelector
    "Scratch windows should not perform any events"! !



!WBCreateClassDialog class methods !

isWBInternalClass

    ^true! !



!WBCreateClassDialog methods !
 
cancel:  aPane

    newClass := nil.
    self close.!

classListFor: windowOrDialog

    (windowOrDialog = 'CompositePane') ifTrue: [
        ^(CompositePane withAllSubclasses collect: [ :c | c name ])
                asSortedCollection asOrderedCollection
    ].
    (windowOrDialog = 'Window') ifTrue: [
        ^((ViewManager allSubclasses reject: [ :c |
                (c inheritsFrom: WindowDialog) | (PWindowBuilder allViewManagerClasses includes: c)
            ]) collect: [ :c | c name ]) asSortedCollection asOrderedCollection
    ] ifFalse: [
        ^((WindowDialog allSubclasses reject: [ :c |
                (PWindowBuilder allViewManagerClasses includes: c)
            ]) collect: [ :c | c name]) asSortedCollection asOrderedCollection
    ].!

forWindowType: aType

        limitTo := aType.
        self open.!
  
initialize

        limitTo := 'Window'.
        super initialize.!
  
initWindow

        | names selection temp |

        names := (ViewManager withAllSubclasses collect: [ :c | c name ]) asSortedCollection.

        limitTo = 'Window' ifTrue: [
                selection :=  'ViewManager'.
        ] ifFalse: [ limitTo = 'CompositePane' ifTrue: [
                self labelWithoutPrefix:  'Save CompositePane'.
                (self paneNamed: 'nameText') contents: 'CompositePane name:'.
                selection :=  'CompositePane'.
        ] ifFalse: [
                (self paneNamed: 'nameText') contents: 'WindowDialog name:'.
                selection := 'WindowDialog'.
        ]].

        (self paneNamed: 'superclassName')
                contents: (self superclassListFor: limitTo);
                selectItem: selection;
                getSelection.  "kludge to avoid Digitalk bug"

       (self paneNamed: 'className')
            contents: (self classListFor: limitTo).!
 
isWBWindow

    ^true!

ok:  aPane

        | className superclass  |

    className := (self paneNamed: 'className') text trimBlanks.

    className size > 0 ifFalse: [
        ^MessageBox messageNote: 'You must provide a class name.'
    ].

   className first isUpperCase ifFalse: [
        ^MessageBox messageNote: 'Class name must begin with an upper case letter.'
    ].

    className do: [ :c |
        ('~!!@#$%^&*()_+=-|}{\][/?><.,''";: ' includes: c) ifTrue: [
            ^MessageBox messageNote: 'Class name can only contain alpha numerics.'
        ].
    ].

    superclass := Smalltalk at: (self paneNamed: 'superclassName') selectedItem asSymbol.

    (Smalltalk includesKey: className asSymbol) ifFalse: [

        newClass := superclass subclass: className
            instanceVariableNames: ''
            classVariableNames: ''
            poolDictionaries: 'WBConstants'.
    ] ifTrue: [
        newClass := Smalltalk at: className asSymbol.

        (newClass == ViewManager) | (newClass == WindowDialog) ifTrue: [
            ^MessageBox messageNote: 'You cannot save window definitions in the abstract class ', newClass name, '.  Please choose a different name.'
        ].

        (limitTo = 'Window') & (newClass inheritsFrom: ViewManager) not ifTrue: [
            ^MessageBox messageNote: 'That class already exists, and is not a ViewManager subclass.  Please choose a different name.'
        ].

        (limitTo = 'Window') & (newClass inheritsFrom: WindowDialog) ifTrue: [
            ^MessageBox messageNote: 'That class already exists, and is a subclass of WindowDialog.  Please choose a different name.'
        ].

        (limitTo = 'Dialog') & (newClass inheritsFrom: WindowDialog) not ifTrue: [
            ^MessageBox messageNote: 'That class exists already, and is not a WindowDialog subclass.  Please choose a different name.'
        ].

        newClass superclass == superclass ifFalse: [
            ^MessageBox messageNote: 'The superclass of an existing class cannot be changed.'
        ].

        (MessageBox confirm: 'The class ''', newClass name, ''' exists.  Overwrite?') ifFalse: [
            ^self
        ].
    ].

      self close.!
  
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'Save ViewManager';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 686 @ 360; xC; yC; cRDU: (11 @ 350 rightBottom: 674 @ 48));
            pStyle: #(sysmenu modal minimize maximize titlebar);
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 363 @ 32; lDU: 27 r: #left; rDU: 391 r: #left; tDU: 16 r: #top; bDU: 48 r: #top);
                    paneName: 'nameText';
                    startGroup;
                    contents: 'ViewManager name:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 219 @ 32; lDU: 27 r: #left; rDU: 247 r: #left; tDU: 120 r: #top; bDU: 152 r: #top);
                    startGroup;
                    contents: 'Superclass:';
                    yourself
            );
            addSubpane: (
                ComboBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 622 @ 240; lDU: 27 r: #left; rDU: 649 r: #left; tDU: 56 r: #top; bDU: 296 r: #top);
                    paneName: 'className';
                    dropDown;
                    startGroup;
                    tabStop;
                    yourself
            );
            addSubpane: (
                ComboBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 622 @ 302; lDU: 27 r: #left; rDU: 649 r: #left; tDU: 160 r: #top; bDU: 462 r: #top);
                    paneName: 'superclassName';
                    dropDownList;
                    startGroup;
                    tabStop;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 187 @ 60; lDU: 27 r: #left; rDU: 215 r: #left; tDU: 232 r: #top; bDU: 292 r: #top);
                    idOK;
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 187 @ 60; lDU: 238 r: #left; rDU: 425 r: #left; tDU: 232 r: #top; bDU: 292 r: #top);
                    idCancel;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: '&Cancel';
                    yourself
            );
        yourself
    ).

    self openWindow!

result

    ^newClass!

superclassListFor: windowOrDialog

    (windowOrDialog = 'CompositePane') ifTrue: [
        ^(CompositePane withAllSubclasses collect: [ :c | c name ]) asSortedCollection
    ].
    (windowOrDialog = 'Window') ifTrue: [
        Notifier isAltDown ifTrue: [
            ^(ViewManager withAllSubclasses collect: [ :c | c name ]) asSortedCollection
        ] ifFalse: [
            ^((ViewManager withAllSubclasses reject: [ :c |
                    (c inheritsFrom: WindowDialog) | (PWindowBuilder allViewManagerClasses includes: c)
                ]) collect: [ :c | c name ]) asSortedCollection
        ].
    ] ifFalse: [
        Notifier isAltDown ifTrue: [
            ^(WindowDialog withAllSubclasses collect: [ :c | c name ]) asSortedCollection
        ] ifFalse: [
            ^((WindowDialog withAllSubclasses reject: [ :c |
                    (PWindowBuilder allViewManagerClasses includes: c)
                ]) collect: [ :c | c name]) asSortedCollection
        ].
    ].! !



!WBTabOrderLayoutPane class methods !

supportedEvents

    ^super supportedEvents
        add: #setTabPosition;
        add: #setGroup;
        add: #deletedGroup;
        yourself! !



!WBTabOrderLayoutPane methods !
  
addGroupPaneStartingAt: aPoint

    | groupPane min containedPanes |

    modalState := nil.
    self dragSelectFrom: aPoint.

    selectedPanes := selectedPanes select: [ :p | p isGroupable ].

    selectedPanes isEmpty ifTrue: [
        ^self
    ].

    groupPane := PWBInvisibleGroupPane example.
    groupPane rect: (self selectedRect expandBy: 1).

    groups keysDo: [  :g |
        (g rect intersects: groupPane rect)  ifTrue: [
            MessageBox messageNote: 'Overlapping Grouping is not allowed.'.
            ^nil
        ].
    ].

    containedPanes := nonGroupedPanes select: [:p | p staysToBack not & (groupPane rect containsPoint: p rect leftTop) & (groupPane rect containsPoint: p rect rightBottom) ].

    min := WBTabPosition fromTabPosition: 10000.
    containedPanes do: [ :p |
        ((p usesFocus & p tabPosition notNil) and: [ p tabPosition <= min ]) ifTrue: [
            min := p tabPosition
        ].
    ].
    groupPane tabPosition: min.
    panes add: groupPane.

    self resetGroups.
    self normalizeTabOrder.

    self updateRect: self editedPaneContentRect.!
  
button1Down: aPoint

    | child |

    (modalState = #settingTabGroup) ifTrue: [
        self addGroupPaneStartingAt: aPoint.
        ^self event: #setGroup
    ].


    (modalState = #removeTabGroup) ifTrue: [
        child := self groupPaneHitBy: aPoint.
        child isGrouper ifTrue: [
            panes remove: child.
            self resetGroups.
            self normalizeTabOrder.
            self updateRect: self editedPaneContentRect.
        ].
        modalState := nil.
        ^self event: #deletedGroup
    ].

    child := self paneHitBy: aPoint.
    child ~= editedPane & child usesFocus ifTrue: [
        (self isEditingTabs & child tabPosition isNil) ifTrue: [
            self setTabPositionFor: child.
            self event: #setTabPosition.
            ^self updateRect: (child rect expandBy: 4)
        ].
    ].

    Terminal bell.!
 
button1DownShift: aPoint

    "Mask out super behavior"!
  
button2Down: aPoint

    "Mask out super behavior"!
   
display

    | savedFont |

    super display.
    savedFont := self font.

    self pen down.

    panes do: [ :p |
        self displayTabPositionFor: p.
    ].

    self pen font: savedFont.!
 
displayTabPositionFor: p

    | location oldFont |

    p tabPosition notNil & p isGrouper not & p usesFocus ifTrue: [
        location := p hitRect center.
        oldFont := self pen font.

        self pen
            place: location;
            backColor: ClrBlack;
            circleFilled: 10;
            foreColor: ClrWhite;
            font: (self fontFor: p);
            centerText: p tabPosition asString at: location;
            foreColor: ClrBlack;
            backColor: ClrWhite;
            font: oldFont
        ].!
   
editedPane: aPane subpanes: subPanes

    editedPane := aPane fullCopy.

    panes := self importPanes: subPanes.

    subPanes do: [ :s |
        s parent: aPane.
    ].

    self moveGroupboxesToBack.
    self insertGroupingPanes.
    self resetGroups.
    self normalizeTabOrder.!

exportedPanes

    ^(self sortInZorder: super exportedPanes) reject: [ :p |
        p isGrouper
    ].!
 
fontFor: aPane

    aPane tabPosition inGroup  ifFalse: [
        (LargeNumberFont isNil) ifTrue: [
            LargeNumberFont :=  (Font face: 'Helv' size: 8@18 fixedWidth: true attributes: 0).
        ].
        ^LargeNumberFont
    ] ifTrue: [
        (SmallNumberFont isNil) ifTrue: [
            SmallNumberFont := (Font face: 'Helv' size: 5@10 fixedWidth: false attributes: 0).
        ].
        ^SmallNumberFont
    ].!
 
groupPaneHitBy: aPoint

    | panesHit |

    panesHit := panes select: [:p | (p rect containsPoint: aPoint) & p isGrouper ].

    panesHit isEmpty ifTrue: [
        ^editedPane
    ] ifFalse: [
        ^panesHit first
    ].!

hideSelectionDots

    "Prevent super from displaying"!
   
initialize

    super initialize.
    isEditingTabs := false.
    tabCount := 0.!
   
insertGroupingPanes

    "Scan through the panes looking for grouped panes, and add a
     grouping pane around each of them.  Panes that are grouped have the
     same integer value in their tabposition, with a mantissa representing
     the order within the group"

    | groupsDict group groupID groupPane |

    groupsDict := Dictionary new.
    panes do: [ :p |
        (p tabPosition notNil and: [ p tabPosition inGroup]) ifTrue: [
            groupID := p tabPosition basicTabPosition.
            group := groupsDict at: groupID ifAbsent: [ OrderedCollection new ].
            group add: p.
            groupsDict at: groupID put: group.
        ].
    ].

    groupsDict do: [ :group |
        groupPane := PWBInvisibleGroupPane example.
        groupPane rect: ((self rectForPanes: group) expandBy: 1).
        groupPane tabPosition: (WBTabPosition fromTabPosition: (groupsDict keyAtValue: group)).
        panes add: groupPane.
    ].!
 
isEditingTabs

    ^isEditingTabs!

mode: aSymbol

    modalState := aSymbol.!

moveGroupboxesToBack

    panes copy do: [ :p |
        p staysToBack ifTrue: [
            panes remove: p.
            panes addLast: p.
        ].
    ].!

nextTabPositionFromCollection: paneList

    | max |

    max := WBTabPosition fromTabPosition: 0.
    paneList do: [ :p |
        ((p usesFocus & p tabPosition notNil) and: [ p tabPosition >= max ]) ifTrue: [
            max := p tabPosition
        ]
    ].

    ^max nextTabPosition!
   
normalizeTabOrder

    | sortBlock groupedPanes cnt |

    sortBlock :=  [:a :b |
            (b tabPosition isNil) ifTrue: [
                true
            ] ifFalse: [
                a tabPosition isNil ifTrue: [
                    false
                ] ifFalse: [
                    a tabPosition <= b tabPosition
                ]
            ]
     ].

    "Sort and set the tab positions for the outermost level panes,
      including the groups"

    nonGroupedPanes := (nonGroupedPanes asSortedCollection: sortBlock) asOrderedCollection.
    cnt := WBTabPosition fromTabPosition: 1.
    1 to: nonGroupedPanes size do: [ :i |
        (nonGroupedPanes at: i) usesFocus & (nonGroupedPanes at: i) tabPosition notNil ifTrue: [
            (nonGroupedPanes at: i) tabPosition: cnt.
            cnt := cnt nextTabPosition.
        ].
    ].

    "Sort and set the tab positions for the panes within each group"

    groups keysDo: [ :group |
        groupedPanes := groups at: group.
        groupedPanes := (groupedPanes asSortedCollection: sortBlock) asOrderedCollection.
        group tabPosition isNil ifTrue: [
            group tabPosition: cnt.
        ].
        cnt := group tabPosition makeFirstInGroup.
        1 to: groupedPanes size do: [ :i |
            (groupedPanes at: i) usesFocus ifTrue: [
                (groupedPanes at: i) tabPosition: cnt.
                cnt := cnt nextTabPosition.
            ].
        ].
        groups at: group put: groupedPanes.
    ].!
  
resetGroups

    | newGroup |

    nonGroupedPanes := (panes select: [:p | p isGrouper not ]).
    groups := Dictionary new.

    (panes select: [:p | p isGrouper ]) do: [:g |
        newGroup := nonGroupedPanes select: [:p | p staysToBack not & (g rect containsPoint: p rect leftTop) & (g rect containsPoint: p rect rightBottom) ].
        nonGroupedPanes := nonGroupedPanes select: [:p | (newGroup includes: p) not ].
        groups at: g put: newGroup.
    ].

    nonGroupedPanes addAll: groups keys.!
  
setTabOrder

    panes do: [ :p |
        p tabPosition: nil.
    ].

    tabCount := 0.
    isEditingTabs := true.
    self updateRect: self editedPaneContentRect.!
   
setTabPositionFor: aPane

    | containingGroup tabPosition |

    tabCount := tabCount + 1.

    groups do: [ :c |
        (c includes: aPane) ifTrue: [
            containingGroup := groups keyAtValue: c.
        ].
    ].

    containingGroup notNil ifTrue: [
        (containingGroup tabPosition isNil) ifTrue: [
            containingGroup tabPosition: (self nextTabPositionFromCollection: nonGroupedPanes).
            aPane tabPosition: containingGroup tabPosition copy makeFirstInGroup.
        ] ifFalse: [
            aPane tabPosition: (self nextTabPositionFromCollection: (groups at: containingGroup)).
        ].
    ] ifFalse: [
        aPane tabPosition: (self nextTabPositionFromCollection: nonGroupedPanes).
    ].!
   
showSelectionDotsOn: w

    "Prevent them from drawing"!
  
stopEditingTabs

    isEditingTabs := false.
    self normalizeTabOrder.
    self updateRect: self editedPaneContentRect.!
  
tabCount

    ^tabCount!
  
totalTabCount

    ^(panes select: [ :p | p isGrouper not & p usesFocus ]) size!
  
updateRect: r

    | clipRect region |

    clipRect := r intersect: self editedPaneContentRect.

    region := self pen setClipRect: clipRect.
    self pen fill: r color: editedPane backColor.
    self pen destroyRegion: region.

    panes reverseDo: [ :p |

        (p rect intersects: r) ifTrue: [
            self displayPane: p clipRect: clipRect.
            self displayTabPositionFor: p.
        ].
    ].!
  
usesFocus

    ^false! !



!WBAddInManager class methods !
   
isWBInternalClass

    ^true! !



!WBAddInManager methods !
  
done: aPane

    "Callback for the #clicked event in the Button named 'cancel'.
     (Generated by WindowBuilder)"

    changed ifTrue: [
        MessageBox messageNote: 'You must restart WindowBuilder for these changes to take effect.'
    ].
    self close!
 
getHelpText

    PWindowBuilder listAddIns do: [ :s |
        selection = (PWindowBuilder perform: s with: #name) ifTrue: [
            ^PWindowBuilder perform: s with: #help
        ]
    ].
    ^''!
 
initWindow

    changed := false.
    self loadList!
 
install: aPane

    "Callback for the #clicked event in the Button named 'install'.
     (Generated by WindowBuilder)"

    PWindowBuilder perform: (PWindowBuilder listAddIns detect: [ :s |
        (PWindowBuilder perform: s with: #name) = selection ]) with: nil.
    self updateProperties.
    changed := true.
    self loadList!
 
loadList
    | list extras |
    list := OrderedCollection new.
    extras := PWindowBuilder extras keys.
    (PWindowBuilder listAddIns collect: [ :s |
        PWindowBuilder perform: s with: #name ])
        do: [ :ai |
            ai isNil ifFalse: [
                (extras includes: ai)
                    ifTrue: [ list add: '*',ai ]
                    ifFalse: [ list add: ai ]]].
    (self paneNamed: 'list') contents: list.
    (self paneNamed: 'install') disable.
    (self paneNamed: 'remove') disable.!
   
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'Add-In Manager';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 713 @ 528; lDU: 361 r: #left; tDU: 226 r: #top; cRDU: (11 @ 518 rightBottom: 702 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                TextEdit new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 667 @ 152; lDU: 9 r: #left; rDU: 677 r: #left; tDU: 248 r: #top; bDU: 400 r: #top);
                    paneName: 'help';
                    scrollBars;
                    startGroup;
                    yourself
            );
            addSubpane: (
                ListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 667 @ 232; lDU: 9 r: #left; rDU: 677 r: #left; tDU: 8 r: #top; bDU: 240 r: #top);
                    paneName: 'list';
                    startGroup;
                    tabStop;
                    when: #select perform: #select:;
                    when: #doubleClickSelect perform: #toggle:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 146 @ 56; lDU: 9 r: #left; rDU: 155 r: #left; tDU: 408 r: #top; bDU: 464 r: #top);
                    paneName: 'install';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #install:;
                    contents: '&Enable';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 146 @ 56; lDU: 165 r: #left; rDU: 311 r: #left; tDU: 408 r: #top; bDU: 464 r: #top);
                    paneName: 'remove';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #remove:;
                    contents: '&Disable';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 146 @ 56; lDU: 530 r: #left; rDU: 677 r: #left; tDU: 408 r: #top; bDU: 464 r: #top);
                    paneName: 'done';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #done:;
                    contents: '&Done';
                    yourself
            );
        yourself
    ).

    self openWindow!
 
remove: aPane

    "Callback for the #clicked event in the Button named 'remove'.
     (Generated by WindowBuilder)"

    PWindowBuilder removeExtra: selection.
    self updateProperties.
    changed := true.
    self loadList!
 
select: aPane

    "Callback for the #select event in the ListBox named 'list'.
     (Generated by WindowBuilder)"

    (aPane selectedItem beginsWith: '*') ifTrue: [
        (self paneNamed: 'install') disable.
        (self paneNamed: 'remove') enable.
        selection := aPane selectedItem copyFrom: 2 to: aPane selectedItem size.
    ] ifFalse: [
        (self paneNamed: 'install') enable.
        (self paneNamed: 'remove') disable.
        selection := aPane selectedItem.
    ].
    (self paneNamed: 'help') contents: self getHelpText.!

toggle: aPane

    "Callback for the #doubleClickSelect event in the ListBox named 'list'.
     (Generated by WindowBuilder)"

    (aPane selectedItem beginsWith: '*') ifTrue: [
        self remove: nil
    ] ifFalse: [
        self install: nil
   ]!

updateProperties
    | gridSize drawGrid |
    gridSize := PWindowBuilder propertyAt: #GridSize.
    drawGrid := PWindowBuilder propertyAt: #DrawGrid.
    PWindowBuilder initProperties.
    PWindowBuilder propertyAt: #GridSize put: gridSize.
    PWindowBuilder propertyAt: #DrawGrid put: drawGrid.! !



!WBEnhancedEntryFieldEditor class methods ! !



!WBEnhancedEntryFieldEditor methods !

caseDict

    ^Dictionary new
        at: 'UPPER' put: #UPPER;
        at: 'lower' put: #lower;
        at: 'Proper' put: #Proper;
        at: 'Unchanged' put: nil;
        yourself!
   
getCase: aPane

    aPane contents: self caseDict keys asSortedCollection asArray!

getCharacter: aPane

    | list |
    list := OrderedCollection new.
    list
        add: self noneString;
        addAll: thePane realClass okCharacterMethods.
    aPane contents: list!
  
getField: aPane

    | list |
    list := OrderedCollection new.
    list
        add: self noneString;
        addAll: thePane realClass okFieldMethods.
    aPane contents: list!
  
getFocus: aPane

    aPane contents: self getFocusDict keys asSortedCollection asArray!
   
getFocusDict

    ^Dictionary new
        at: 'Select All' put: #selectAll;
        at: 'Cursor Before' put: #selectFirst;
        at: 'Cursor After' put: #selectLast;
        yourself!
 
getJustification: aPane

    aPane contents: self justificationDict keys asSortedCollection asArray!
  
initWindow

    | function |
    (self paneNamed: 'case') selectItem: (self caseDict keyAtValue: thePane case).
    (self paneNamed: 'justification') selectItem: (self justificationDict keyAtValue: thePane justification).
    (self paneNamed: 'getFocus') selectItem: (self getFocusDict keyAtValue: thePane getFocus).

    (self paneNamed: 'size') contents: thePane maximumSize asString.
    (self paneNamed: 'autoTab') selection: thePane autoTab.

    thePane character isNil ifTrue: [
        function := self noneString
    ] ifFalse: [
        function := thePane character copyFrom: 3 to: thePane character size - 1
    ].
    (self paneNamed: 'character') selectItem: function.

    thePane field isNil ifTrue: [
        function := self noneString
    ] ifFalse: [
        function := thePane field copyFrom: 3 to: thePane field size
    ].
    (self paneNamed: 'field') selectItem: function.

    self supportsAutoTab ifFalse: [
        (self paneNamed: 'autoTab') hideWindow
    ].
    self supportsJustification ifFalse: [
        (self paneNamed: 'justText') disable.
        (self paneNamed: 'justification') disable
    ].!
   
justificationDict

    ^Dictionary new
        at: 'Left' put: #left;
        at: 'Right' put: #right;
        at: 'Centered' put: #centered;
        yourself!
   
noneString

    ^'- None -'!
  
ok: aPane

    | function |
    thePane case: (self caseDict at: (self paneNamed: 'case') selectedItem).
    thePane justification: (self justificationDict at: (self paneNamed: 'justification') selectedItem).
    thePane getFocus: (self getFocusDict at: (self paneNamed: 'getFocus') selectedItem).

    thePane maximumSize: (self paneNamed: 'size') contents asInteger.
    thePane autoTab: (self paneNamed: 'autoTab') selection.

    function := (self paneNamed: 'character') selectedItem.
    function = self noneString ifTrue: [
        thePane character: nil
    ] ifFalse: [
        thePane character: ('ok',function,':') asSymbol
    ].

    function := (self paneNamed: 'field') selectedItem.
    function = self noneString ifTrue: [
        thePane field: nil
    ] ifFalse: [
        thePane field: ('ok',function) asSymbol
    ].

    self close!
 
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'EnhancedEntryField Attributes';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 859 @ 648; lDU: 302 r: #left; tDU: 234 r: #top; cRDU: (11 @ 638 rightBottom: 848 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 805 @ 336; lDU: 18 r: #left; rDU: 823 r: #left; tDU: 184 r: #top; bDU: 520 r: #top);
                    startGroup;
                    contents: 'Validation';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 165 @ 32; lDU: 37 r: #left; rDU: 201 r: #left; tDU: 224 r: #top; bDU: 256 r: #top);
                    startGroup;
                    contents: 'Character:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 91 @ 32; lDU: 427 r: #left; rDU: 519 r: #left; tDU: 224 r: #top; bDU: 256 r: #top);
                    startGroup;
                    contents: 'Field:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 165 @ 32; lDU: 366 r: #left; rDU: 530 r: #left; tDU: 536 r: #top; bDU: 568 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Max Size:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 169 @ 32; lDU: 265 r: #left; rDU: 434 r: #left; tDU: 8 r: #top; bDU: 40 r: #top);
                    startGroup;
                    contents: 'Get Focus:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 201 @ 32; lDU: 18 r: #left; rDU: 219 r: #left; tDU: 8 r: #top; bDU: 40 r: #top);
                    paneName: 'justText';
                    startGroup;
                    contents: 'Justification:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 101 @ 32; lDU: 567 r: #left; rDU: 667 r: #left; tDU: 8 r: #top; bDU: 40 r: #top);
                    startGroup;
                    contents: 'Case:';
                    yourself
            );
            addSubpane: (
                ListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 229 @ 144; lDU: 18 r: #left; rDU: 247 r: #left; tDU: 40 r: #top; bDU: 184 r: #top);
                    paneName: 'justification';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getJustification:;
                    yourself
            );
            addSubpane: (
                ListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 283 @ 144; lDU: 265 r: #left; rDU: 549 r: #left; tDU: 40 r: #top; bDU: 184 r: #top);
                    paneName: 'getFocus';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getFocus:;
                    yourself
            );
            addSubpane: (
                ListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 256 @ 144; lDU: 567 r: #left; rDU: 823 r: #left; tDU: 40 r: #top; bDU: 184 r: #top);
                    paneName: 'case';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getCase:;
                    yourself
            );
            addSubpane: (
                ListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 373 @ 248; lDU: 39 r: #left; rDU: 411 r: #left; tDU: 256 r: #top; bDU: 504 r: #top);
                    paneName: 'character';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getCharacter:;
                    yourself
            );
            addSubpane: (
                ListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 366 @ 248; lDU: 430 r: #left; rDU: 795 r: #left; tDU: 256 r: #top; bDU: 504 r: #top);
                    paneName: 'field';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getField:;
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 101 @ 48; lDU: 539 r: #left; rDU: 640 r: #left; tDU: 528 r: #top; bDU: 576 r: #top; indent: 3 @ 4);
                    paneName: 'size';
                    startGroup;
                    tabStop;
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 174 @ 40; lDU: 649 r: #left; rDU: 823 r: #left; tDU: 528 r: #top; bDU: 568 r: #top);
                    paneName: 'autoTab';
                    startGroup;
                    tabStop;
                    contents: 'Auto &Tab';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 165 @ 56; lDU: 18 r: #left; rDU: 183 r: #left; tDU: 528 r: #top; bDU: 584 r: #top);
                    paneName: 'ok';
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 165 @ 56; lDU: 192 r: #left; rDU: 357 r: #left; tDU: 528 r: #top; bDU: 584 r: #top);
                    paneName: 'cancel';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: 'Cancel';
                    yourself
            );
        yourself
    ).

    self openWindow!

supportsAutoTab

    ^false!
  
supportsJustification

    ^false! !



!CPCreateBitmap class methods ! !



!CPCreateBitmap methods !

cancel: aPane

    self close.!
   
initWindow

    mono := self paneNamed: 'mono'.
    width := self paneNamed: 'width'.
    height := self paneNamed: 'height'.

    (self paneNamed: 'color') selection: true.!

ok: aPane

    | w h |

    w := width contents asInteger.
    h := height contents asInteger.
    mono selection ifTrue: [
        b := Bitmap width: w height: h
    ] ifFalse: [
        b := Bitmap screenWidth: w height: h
    ].

    self close.!
   
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'Create Bitmap';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 631 @ 328; xC; yC; cRDU: (11 @ 318 rightBottom: 619 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 283 @ 160; lDU: 18 r: #left; rDU: 302 r: #left; tDU: 16 r: #top; bDU: 176 r: #top);
                    startGroup;
                    contents: 'Type';
                    yourself
            );
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 274 @ 160; lDU: 320 r: #left; rDU: 594 r: #left; tDU: 16 r: #top; bDU: 176 r: #top);
                    startGroup;
                    contents: 'Size';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 119 @ 32; lDU: 347 r: #left; rDU: 466 r: #left; tDU: 120 r: #top; bDU: 152 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Height:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 110 @ 32; lDU: 357 r: #left; rDU: 466 r: #left; tDU: 64 r: #top; bDU: 96 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Width:';
                    yourself
            );
            addSubpane: (
                RadioButton new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 238 @ 40; lDU: 46 r: #left; rDU: 283 r: #left; tDU: 56 r: #top; bDU: 96 r: #top);
                    paneName: 'mono';
                    startGroup;
                    tabStop;
                    contents: 'Monochrome';
                    yourself
            );
            addSubpane: (
                RadioButton new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 128 @ 40; lDU: 46 r: #left; rDU: 174 r: #left; tDU: 112 r: #top; bDU: 152 r: #top);
                    paneName: 'color';
                    contents: 'Color';
                    yourself
            );
            addSubpane: (
                EntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 101 @ 48; lDU: 475 r: #left; rDU: 576 r: #left; tDU: 112 r: #top; bDU: 160 r: #top; indent: 3 @ 4);
                    paneName: 'height';
                    startGroup;
                    tabStop;
                    contents: '32';
                    yourself
            );
            addSubpane: (
                EntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 101 @ 48; lDU: 475 r: #left; rDU: 576 r: #left; tDU: 56 r: #top; bDU: 104 r: #top; indent: 3 @ 4);
                    paneName: 'width';
                    startGroup;
                    tabStop;
                    contents: '32';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 146 @ 64; lDU: 18 r: #left; rDU: 165 r: #left; tDU: 192 r: #top; bDU: 256 r: #top);
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: 'OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 146 @ 64; lDU: 183 r: #left; rDU: 329 r: #left; tDU: 192 r: #top; bDU: 256 r: #top);
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: 'Cancel';
                    yourself
            );
        yourself
    ).

    self openWindow!
 
result

    ^b! !



!WBHorizontalScrollBar class methods !
   
isWBInternalClass

    ^true! !



!WBHorizontalScrollBar methods ! !



!WBStaticTextEditor class methods ! !



!WBStaticTextEditor methods !
   
ignore: ignore!
 
initWindow

    (self paneNamed: 'text')
        contents: thePane contents;
        setFocus;
        selectAll.!
 
ok: ignore
    | contents |
    contents := (self paneNamed: 'text') contents.
    thePane
        contents:  (contents copyFrom: 1 to: contents size - 2).

    self close!
  
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'Static Text Attributes';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 905 @ 424; xC; yC; cRDU: (11 @ 414 rightBottom: 894 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                TextPane new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 864 @ 284; lDU: 9 r: #left; rDU: 873 r: #left; tDU: 8 r: #top; bDU: 292 r: #top);
                    paneName: 'text';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #ignore:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 201 @ 56; lDU: 9 r: #left; rDU: 210 r: #left; tDU: 304 r: #top; bDU: 360 r: #top);
                    idOK;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 201 @ 56; lDU: 219 r: #left; rDU: 421 r: #left; tDU: 304 r: #top; bDU: 360 r: #top);
                    idCancel;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: '&Cancel';
                    yourself
            );
        yourself
    ).

    self openWindow! !



!WBScrapbookStore class methods !

isWBInternalClass

    ^true! !



!WBScrapbookStore methods !

cancel: aPane

    Notifier isAltDown ifTrue: [ ^PWindowBuilder scrapbook inspect ].

    self close!
   
chapters

    ^PWindowBuilder scrapbook keys asSortedCollection!
  
getChapter: aPane

    (self paneNamed: 'name') contents isEmpty ifTrue: [ 
        (self paneNamed: 'ok') disable
    ] ifFalse: [ 
        aPane selectedItems isEmpty ifTrue: [
            (self paneNamed: 'ok') disable
        ] ifFalse: [ 
            (self paneNamed: 'ok') enable
        ].
    ]!
   
getName: aPane

    aPane contents isEmpty ifTrue: [
        (self paneNamed: 'ok') disable
    ] ifFalse: [ 
        (self paneNamed: 'chapters') selectedItems isEmpty ifTrue: [
            (self paneNamed: 'ok') disable
        ] ifFalse: [
            (self paneNamed: 'ok') enable
        ].
    ]!

initWindow

    (self paneNamed: 'name') contents: ''.
    (self paneNamed: 'ok') disable.
    isQuick := false.!
   
isQuick

    ^isQuick!

loadChapters: aPane

    aPane contents: self chapters.!
  
name

    ^(self paneNamed: 'name') contents.!

newChapter: aPane

    | name |

    name := Prompter prompt: 'Enter name for new chapter.' default: ''.
    (name notNil and: [ name notEmpty ]) ifTrue: [
        (PWindowBuilder scrapbook includesKey: name) ifTrue: [
            ^MessageBox notify: 'Already Exists' withText: '''',name,''' alread exists!!'
        ].
        PWindowBuilder scrapbook at: name asString put: Dictionary new
    ].
    self loadChapters: (self paneNamed: 'chapters').!
  
ok: aPane

    | name chapter clipboard |

    layoutPane clipboard isNil ifFalse: [
        name := (self paneNamed: 'name') contents.
        name isEmpty ifFalse: [
            clipboard :=  layoutPane clipboard.
            (self paneNamed: 'chapters') selectedItems do: [ :chap |
                chapter := (PWindowBuilder scrapbook at: chap).
                (chapter includesKey: name) ifTrue: [
                    (MessageBox confirm: '''',name,''' already exists. Do you want to replace it?') ifFalse: [^nil]
                ].
                chapter at: name put: clipboard.
                chap = 'Quick Reference' ifTrue: [ isQuick := true ]
            ].
            self close
        ].
    ]!
   
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'Store in Scrapbook';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 795 @ 464; lDU: 311 r: #left; tDU: 248 r: #top; cRDU: (322 @ 702 rightBottom: 1095 @ 296));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 192 @ 32; lDU: 9 r: #left; rDU: 201 r: #left; tDU: 16 r: #top; bDU: 48 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Page Name:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 155 @ 32; lDU: 18 r: #left; rDU: 174 r: #left; tDU: 64 r: #top; bDU: 96 r: #top);
                    startGroup;
                    contents: 'Chapters:';
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 549 @ 48; lDU: 210 r: #left; rDU: 759 r: #left; tDU: 8 r: #top; bDU: 56 r: #top; indent: 3 @ 4);
                    paneName: 'name';
                    startGroup;
                    tabStop;
                    when: #textChanged perform: #getName:;
                    yourself
            );
            addSubpane: (
                MultipleSelectListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 741 @ 232; lDU: 18 r: #left; rDU: 759 r: #left; tDU: 104 r: #top; bDU: 336 r: #top);
                    paneName: 'chapters';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #loadChapters:;
                    when: #select perform: #getChapter:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 238 @ 56; lDU: 521 r: #left; rDU: 759 r: #left; tDU: 344 r: #top; bDU: 400 r: #top);
                    paneName: 'newChapter';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #newChapter:;
                    contents: '&New Chapter';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 167 @ 56; lDU: 18 r: #left; rDU: 185 r: #left; tDU: 344 r: #top; bDU: 400 r: #top);
                    paneName: 'ok';
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&Store';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 167 @ 56; lDU: 201 r: #left; rDU: 368 r: #left; tDU: 344 r: #top; bDU: 400 r: #top);
                    paneName: 'cancel';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: 'Cancel';
                    yourself
            );
        yourself
    ).

    self openWindow!
 
openOn: aPane

    layoutPane := aPane.
    self open! !



!WBRealLayoutPane class methods !

initWinConstants

    AcuFont := SysFont.!

resetBitmap

    DrawingBitmap := nil.! !



!WBRealLayoutPane methods !
  
checkMnemonicConflicts

    | mnemonic |

    (selectedPanes size = 1) ifFalse: [
        ^self
    ].

    (mnemonic := selectedPanes first contents) isString ifFalse: [
        ^self
    ].

    (mnemonic := mnemonic mnemonicChar) isNil ifTrue: [
        ^self
    ].

    panes do: [ :p |
        p contents notNil ifTrue: [
            (p ~= selectedPanes first) & (p contents isString and: [ p contents mnemonicChar = mnemonic ]) ifTrue: [
                ^MessageBox messageNote: 'The ', p realClass name, ' with contents ', p contents asQuotedString stripMnemonic, ' already has the mnemonic &', (String with: mnemonic), '.  Please choose another.'
            ].
        ].
    ].

    editedPane menu notNil ifTrue: [
        editedPane menu children do: [:m |
            (m listString mnemonicChar = mnemonic) ifTrue: [
                ^MessageBox messageNote: 'The menu ', m listString asQuotedString stripMnemonic, ' already has the mnemonic ~', mnemonic asString, '.  Please choose another.'
            ].
        ].
    ].!
   
convertChild: c inView: aView

    | newChild newChildClass name |

    newChildClass := (self pseudoClassFor: c class name).

    newChildClass = PScrollBar ifTrue: [
        (c style bitIsOn: SbsVert) ifTrue: [
            newChildClass := PWBVerticalScrollBar
        ] ifFalse: [
            newChildClass := PWBHorizontalScrollBar
        ].
    ].

    newChild := newChildClass new.

    c framingBlock isContext ifTrue: [
        newChild framingBlock: (self framingParametersFor: c framingBlock inView: aView).
    ] ifFalse: [
        newChild framingBlock: c framingBlock.
    ].

    (c respondsTo: #contents) ifTrue: [
        newChild contents: c contents
    ].

    newChild
        handlers: c realHandlers;
        menu: c getPopupMenu;
        paneName: c paneName;
        realClass: c class;
        setStyleFrom:  c style;
        readSpecificsFrom: c;
        parent: aView.

    (c foreColor notNil) ifTrue: [
        newChild foreColor: c foreColor
    ].

    (c backColor notNil) ifTrue: [
        newChild backColor: c backColor
    ].

    newChild menu notNil ifTrue: [
        newChild menu: newChild menu asWBPMenu.
    ].

    c font isNil ifFalse: [
        newChild font: c font.
    ].

    ^newChild!

convertChildrenToRes: dialogTitle

    | dU answer rect text |

    dU := self realDialogUnit.
    answer := OrderedCollection new.

    panes reverseDo: [ :p |
        rect := p framingBlock value: editedPane contentRect.
        rect := (rect left // dU x) @ (rect top // dU y) rightBottom: (rect right // dU x) @ (rect bottom // dU y).
        text := ''.
        p contents isString ifTrue: [
            text := p contents.
        ].

        answer add:
            (WinDialogInfo
                    itemTemplateStyle: p winStyle
                    x: rect left
                    y: rect top
                    cx: rect extent x
                    cy: rect extent y
                    id: (panes indexOf: p)
                    className: p winClass
                    text: text
            ).
    ].

    ^answer!
  
convertView: v realClass: aTopPaneClass

    "Altered to fix problem with re-editing windows containing
      multiple groups.  Also contains full fix for editing windows containing
      Ok or Cancel buttons, since last patch didn't completely fix the problem."

    | stayingToBack theChildren viewExtent newView newChildren newChild lastNonGroupTabPos lastGroupTabPos |

    ((v isKindOf: (Smalltalk at: #MDIFrame ifAbsent: [ nil ])) and: [
    v owner topPaneClass ~~ (Smalltalk at: #MDIFrame)]) ifTrue: [
        mdiAttributes := WBMDIAttributes new.
        mdiAttributes
            toolPane: v toolPane;
            statusPane: v statusPane;
            frameEvents: v handlers;
            label: v label.
        ^nil
    ].

    newView := WindowFrameObject newForClass: aTopPaneClass.
    newView realClass: aTopPaneClass.

    v framingBlock notNil ifTrue: [
        viewExtent := (v framingBlock value: Display boundingBox) extent.
    ] ifFalse: [
        (v respondsTo: #initWindowSize) ifTrue: [
            viewExtent := v initWindowSize.
        ] ifFalse: [
            viewExtent := v topPaneClass basicNew initWindowSize.
        ].
        (v isKindOf:  WindowDialog) ifTrue: [
            viewExtent := viewExtent // WindowDialog dialogUnit
        ].
    ].

    newView
        framingBlock: v framingBlock;
        handlers: v handlers;
        extent: viewExtent;
        contents: v label;
        style: v pStyle;
        createdBy: v createdBy;
        modifiedBy: v modifiedBy;
        iconFile: v iconFile.

    v backColor notNil ifTrue: [
        newView backColor: v backColor.
    ].

    v paneName notNil ifTrue: [
        newView paneName: v paneName.
    ] ifFalse: [
        newView paneName: 'mainView'.
    ].

    newView style isNil ifTrue: [
        newView style: newView defaultStyle
    ].

    v menuWindow menus notEmpty ifTrue: [
        newView menu: v menuWindow asWBPMenuBar.
    ] ifFalse: [
        newView menu: nil.
    ].

    newChildren := OrderedCollection new.

    "Needed to have children represented as OrderedCollection,
      since ordering relevant.  Digitalk stores them as an identity dictionary,
      which loses ordering.  Previous method of sorting on id fails for buttons
      with idOk and idCancel"
    theChildren := v getSubpaneOrder.

    stayingToBack := OrderedCollection new.

    "Fixed problem with reading back windows with multiple groups"
    lastNonGroupTabPos := WBTabPosition new.
    lastGroupTabPos := lastNonGroupTabPos.

    theChildren do: [ :c |
        newChild :=  self convertChild: c inView: newView.

        (c isWsGroup) ifTrue: [
            (c isWsTabstop) ifTrue: [
                newChild tabPosition: lastNonGroupTabPos nextBasicTabPosition.
                lastNonGroupTabPos := newChild tabPosition.
                lastGroupTabPos := lastNonGroupTabPos.
            ].
        ] ifFalse: [
            lastGroupTabPos withinGroup ifFalse: [
                  lastGroupTabPos makeFirstInGroup.
            ].
            newChild tabPosition: lastGroupTabPos nextTabPosition.
            lastGroupTabPos := newChild tabPosition.
        ].

        newChild staysToBack ifTrue: [
            stayingToBack addFirst: newChild.
        ] ifFalse: [
            newChildren addLast: newChild.
        ].
    ].


    "Fixed problem with reversed non-taborder controls by reversing
     newChildren below"
    newView children: (newChildren reversed addAllLast: stayingToBack; yourself).

    ^newView!
  
convertWinChild: c

    | newChild theClass |

    theClass := c class.

    theClass == WBGroupBox ifTrue: [
        theClass := GroupBox.
    ].

    newChild := (self pseudoClassFor: theClass name) new.

    (theClass = WBHorizontalScrollBar) | (theClass = WBVerticalScrollBar) ifTrue: [
        theClass := ScrollBar
    ].
    newChild realClass: theClass.

    c framingBlock isRectangle ifTrue: [
        c framingBlock: ( FramingParameters new initialExtent: (c propertyAt: #extent); left: c framingBlock left relativeTo: #left; right: c framingBlock right relativeTo:  #left; top: c framingBlock top relativeTo:  #top; bottom: c framingBlock bottom relativeTo:  #top)
    ] ifFalse: [
        c framingBlock initialExtent: (c propertyAt: #extent).
    ].

    (c respondsTo: #contents) ifTrue: [
        newChild contents: c contents.
    ].
    newChild
        framingBlock: c framingBlock;
        handlers: c realHandlers;
        menu: c getPopupMenu;
        paneName: c paneName;
        style: (c propertyAt:  #style).

    newChild menu notNil ifTrue: [
        newChild menu: newChild menu asWBPMenu.
    ].

    newChild style isNil ifTrue: [
        newChild style: newChild defaultStyle.
    ].

    c font isNil ifFalse: [
        newChild font: c font.
    ].

    ^newChild!

drawToBitmap

    ^DrawingBitmap notNil!
  
editClass: aTopPaneClass

    | holdEditedPane tempInstance oldOpenWindow oldOpenModeless
    openMethodType numArgs args |

    self outmostWindow hideWindow.

    "Support for #createViews and CompositePanes"
    (aTopPaneClass inheritsFrom: CompositePane) ifTrue: [
        openMethodType := #addSubpanes
    ] ifFalse: [
        openMethodType := PWindowBuilder openMethodType
    ].

    openMethodType notNil ifTrue: [
        self propertyAt: #keepOpenMethod put: (aTopPaneClass includesSelector: #open).
        tempInstance := aTopPaneClass new.
        numArgs := openMethodType occurrencesOf: $:.
        args := (Array new: numArgs) atAllPut: tempInstance.
        tempInstance := tempInstance perform: openMethodType withArguments: args.
    ].

    tempInstance isNil ifTrue: [
        self propertyAt: #keepOpenMethod put: nil.
        oldOpenWindow := aTopPaneClass sourceCodeAt: #openWindow.
        PWindowBuilder createMethod: '' titled: 'openWindow' in: aTopPaneClass loggingSource: false.
        oldOpenModeless := aTopPaneClass sourceCodeAt: #openModeless.
        PWindowBuilder createMethod: '' titled: 'openModeless' in: aTopPaneClass loggingSource: false.

        tempInstance := aTopPaneClass new open.

        oldOpenWindow == #openWindow ifFalse: [
            PWindowBuilder createMethod: oldOpenWindow titled: '' in: aTopPaneClass loggingSource: true.
        ] ifTrue: [
            aTopPaneClass removeSelector: #openWindow.
        ].
        oldOpenModeless == #openModeless ifFalse: [
            PWindowBuilder createMethod: oldOpenModeless titled: '' in: aTopPaneClass loggingSource: true.
        ] ifTrue: [
            aTopPaneClass removeSelector: #openModeless.
        ]
    ].
    tempInstance isNil ifTrue: [ ^nil ].
    views := tempInstance views.

    views := (views collect: [:v |
        (self convertView: v realClass: (
                (aTopPaneClass isScratchWindow) ifTrue: [
                       aTopPaneClass defaultClass
                ] ifFalse: [
                    aTopPaneClass
                ]
            )
        ).
    ]) reject: [:vi | vi isNil ].

    holdEditedPane := editedPane.
    views do: [ :v |
        v == views first ifFalse: [
            editedPane := v.
            v children do: [ :p | p reframe: self editedPaneContentRect. ].
        ].
    ].

    self switchToView: views first.

    ^views first!
   
editedPaneFrameLeftTop

    ^self margin@self margin!
 
editMDIAttributes

    | result |

    mdiAttributes isNil ifTrue: [
        mdiAttributes := WBMDIAttributes new.
    ].

    result :=  WBMDIAttributesEditor new openOn: mdiAttributes.
    result result isNil ifTrue: [
        ^nil
    ].

    mdiAttributes := result result!
  
eventsSummaryString

    | s spaceTab tab nameString |

    s := WriteStream on: String new.
    tab := String with: Tab.
    spaceTab := '  '.

    "MDI Stuff"
    mdiAttributes frameEvents isEmpty ifFalse: [
        s nextPutAll: 'MDIFrame Events:'; cr.
        (mdiAttributes frameEvents keys asSortedCollection) do: [ :key |
            s nextPutAll: spaceTab, spaceTab, ' when: #', key, tab, tab, 'perform: ', tab, '#', (mdiAttributes frameEvents at: key); cr.
        ].
    ].
    (mdiAttributes hasToolPane and: [ mdiAttributes toolPaneEvents notEmpty ]) ifTrue: [
        s nextPutAll: 'MDI ToolPane Events:'; cr.
        (mdiAttributes toolPaneEvents keys asSortedCollection: [ :a :b |
            (a = #getContents) ifTrue: [
                true
            ] ifFalse: [
                b = #getContents ifTrue: [ false ] ifFalse: [ a < b ]
            ]
        ]) do: [ :key |
            s nextPutAll: spaceTab, spaceTab, ' when: #', key, tab, tab, 'perform: ', tab, '#', (mdiAttributes toolPaneEvents at: key); cr.
        ].
    ].
    (mdiAttributes hasStatusPane and: [ mdiAttributes statusPaneEvents notEmpty ]) ifTrue: [
        s nextPutAll: 'MDI StatusPane Events:'; cr.
        (mdiAttributes statusPaneEvents keys asSortedCollection: [ :a :b |
            (a = #getContents) ifTrue: [
                true
            ] ifFalse: [
                b = #getContents ifTrue: [ false ] ifFalse: [ a < b ]
            ]
        ]) do: [ :key |
            s nextPutAll: spaceTab, spaceTab, ' when: #', key, tab, tab, 'perform: ', tab, '#', (mdiAttributes statusPaneEvents at: key); cr.
        ].
    ].

    views do: [ :v |
        (views size > 1) ifTrue: [
            nameString := ' (', v paneName asQuotedString, ') '.
        ] ifFalse: [
            nameString := ' '.
        ].

        s nextPutAll: 'View', nameString, 'Events:'; cr.
        (v handlers keys asSortedCollection: [ :a :b |
            (a = #getContents) ifTrue: [
                true
            ] ifFalse: [
                b = #getContents ifTrue: [ false ] ifFalse: [ a < b ]
            ]
        ]) do: [ :key |
            s nextPutAll: spaceTab, spaceTab, ' when: #', key, tab, tab, 'perform: ', tab, '#', (v handlers at: key); cr.
        ].
        v handlers isEmpty ifTrue: [
            s nextPutAll: spaceTab, spaceTab, spaceTab, '*** No events assigned ***'; cr.
        ].

        (v children size > 0) ifTrue: [
            s cr; nextPutAll: spaceTab,  'Subpane Events', nameString; cr.
        ].
        (v children asSortedCollection: [ :a :b | a handlers size > b handlers size ]) do: [ :c |
            c paneName isNil ifTrue: [
                c contents isString ifFalse: [
                    nameString := 'Unnamed'.
                ] ifTrue: [
                    nameString := 'Unnamed - text is ', c contents asQuotedString.
                ].
            ] ifFalse: [
                nameString := c paneName asQuotedString.
            ].

            s nextPutAll: spaceTab, spaceTab, c realClass name, ' (', nameString, ')'; cr.

            (c handlers keys asSortedCollection: [ :a :b |
                (a = #getContents) ifTrue: [
                    true
                ] ifFalse: [
                    b = #getContents ifTrue: [ false ] ifFalse: [ a < b ]
                ]
            ]) do: [ :k |
                s nextPutAll: spaceTab, spaceTab, spaceTab, ' when: #', k, ((String new: (20 - k size max: 1)) atAllPut: $ ; yourself), tab, 'perform: ', tab, '#', (c handlers at: k); cr.
            ].
            c handlers isEmpty ifTrue: [
                s nextPutAll: spaceTab, spaceTab, spaceTab, '*** No events assigned ***'; cr.
            ].
            s cr.
        ].
    ].

    ^s contents!
 
exportToResFile: fName

    | i hFile f theName dlgTemplate items fStyle r tempByteArray |

    theName := fName.
    ((fName size < 3) or: [ ((fName copyFrom: fName size - 2 to: fName size) asUpperCase = 'RES') not ]) ifTrue: [
        theName := fName, '.res'.
    ].

    f := File newFile: theName.
    hFile := File newFile: (theName copyFrom: 1 to: theName size - 3), 'H'.

    i := 0.
    panes do: [:p |
        p paneName notNil ifTrue: [
            i := i + 1.
            hFile nextPutAll: '#define    ', p paneName asString, '    ', i asString; cr.
        ].
    ].
    hFile close.

    r := editedPane rect origin extent: (self editedPaneContentRect extent / self realDialogUnit) rounded.

    fStyle := DsNoidlemsg | WsClipchildren | WsPopup.

    (editedPane style includes: #sysmenu) ifTrue: [
        fStyle:= fStyle| WsSysmenu.
    ].
    (editedPane style includes: #titlebar) ifTrue: [
        fStyle:= fStyle| WsCaption.
    ].
    (editedPane style includes: #sysmodal) ifTrue: [
        fStyle:= fStyle| DsSysmodal | DsModalframe.
    ].
    (editedPane style includes: #modal) ifTrue: [
        fStyle:= fStyle| DsModalframe.
    ] ifFalse: [
        fStyle:= fStyle| WsBorder.
    ].

    dlgTemplate := WinDialogInfo
        dialogTemplateStyle: fStyle
        itemCount: 0
        x: r origin x
        y: r origin y
        cx: r extent x
        cy: r extent y
        menuName: nil
        className: nil
        text: editedPane contents.

    items := self convertChildrenToRes: editedPane contents.

    dlgTemplate byteAtOffset: 4 put: items size.

    tempByteArray := dlgTemplate contents.
    items do: [:i |
        tempByteArray := tempByteArray, i contents.
    ].
    dlgTemplate contents: tempByteArray.

    "Resource Header"
    #(255 5 0 66 0 16 240)  do: [:b |
        f nextBytePut: b.
    ].
    f nextTwoBytesPut: dlgTemplate contents size;
        nextBytePut: 0;
        nextBytePut: 0.

    dlgTemplate contents do: [:b |
        f nextBytePut: b.
    ].
    f
        close.!

framingParametersFor:  aFramingBlock inView: aView

    "In case we're reading in an existing window, make life
     a little easier on them by performing a simple conversion of
    framing blocks into framing parameters.  Nothing fancy;  just
    getting the coordinates right."

    | baseRect viewContentRect |

    viewContentRect := 0@0 extent: aView contentRect extent.

    baseRect := aFramingBlock value: viewContentRect.
    aView isDialog ifTrue: [
        baseRect := (baseRect origin // WindowDialog dialogUnit) extent: (baseRect extent // WindowDialog dialogUnit).
    ].

    ^FramingParameters new fromRect: baseRect inRect: viewContentRect.!
  
importFromResFile: resFile

    | newClass template hFile idDict symName hName |

    (newClass := (PWindowBuilder wbCreateClassDialog new forWindowType: 'Dialog') result) isNil ifTrue: [
        ^nil
    ].

    editedPane := WindowFrameObject new.
    editedPane realClass: newClass.

    views := OrderedCollection with: editedPane.

    template := WinDialogInfo new readFrom: resFile.
    panes := OrderedCollection new.

    idDict := Dictionary new.
    hName := (resFile copyFrom: 1 to: resFile size - 3), 'H'.

    hFile := File pathName: hName.
    [ hFile atEnd not and: [ (hFile nextString: 'define') notNil ] ] whileTrue: [
        symName := hFile nextWord.
        idDict at: hFile nextWord asInteger put: symName.
    ].

    editedPane
        rect: (template origin extent: (template extent * self realDialogUnit) rounded);
        contents: template text.

    editedPane style: (WindowFrameObject styleFrom: template style).

    editedPane extent: editedPane extent + (self editedPaneFrameRect extent - self editedPaneContentRect extent).

    template items do: [:p |
        p rect: ((self editedPaneContentRect origin + (p rect origin  * self realDialogUnit) rounded)
                        extent: (p rect extent * self realDialogUnit) rounded).
        self recalcFramerFor: p.
        p paneName: (idDict at: p resID ifAbsent: [ nil ]).
        panes add: p.
    ].

    panes := panes reversed.

    ^newClass!
  
importWindow: theClass

    | v tempInstance t initInstVarStream hasName initPos |

    tempInstance := theClass new.
    v := WindowFrameObject new.

    v realClass: theClass.
    self outmostWindow hideWindow.

    tempInstance addSubpanesTo: v.

    views := OrderedCollection with: v.

    v
        framingBlock:  (FramingParameters new initialExtent: tempInstance initWindowExtent);
        extent: tempInstance initWindowExtent;
        contents: tempInstance label;
        style: (self styleFromWinClass: tempInstance).

    (tempInstance respondsTo: #initWindowPosition) ifTrue: [
        initPos := tempInstance initWindowPosition.
        v framingBlock left: initPos x relativeTo: #left.
        v framingBlock top: initPos y relativeTo: #top.
    ] ifFalse: [
        v framingBlock xC; yC.
    ].

    (tempInstance respondsTo: #buildMenuBarFor:) ifTrue: [
        tempInstance buildMenuBarFor: tempInstance.
    ].
    tempInstance menuWindow menus notEmpty ifTrue: [

        v menu: tempInstance menuWindow asWBPMenuBar.
    ] ifFalse: [
        v menu: nil.
    ].

    t := 0.

    "Detect grouping panes, add children with coordinates
      translated, set tabpositions with .x values relative to the
     grouping pane's tab position."
    v children copy do: [:c |
        (c isKindOf: WBInvisibleGroupPane) ifTrue: [
            c children do: [:ch |
                ch framingBlock: ((ch framingBlock leftTop rightAndDown: c framingBlock leftTop) extentFromLeftTop: ch framingBlock extent).
                 v children add: ch
            ].
            v children remove: c.
        ].
    ].
    v children: (
        v children  collect: [:c |
            t := t + 1.
            (self convertWinChild: c) tabPosition: nil; yourself.
        ]
    ).

    theClass
        removeSelector: #addSubpanesTo:;
        removeSelector: #label;
        removeSelector: #buildMenuBarFor:;
        removeSelector: #isModal;
        removeSelector: #defaultFrameStyle;
        removeSelector: #initWindowExtent.

    self switchToView: views first.

    initInstVarStream := WriteStream on: ''.
    panes do: [:p |
        p paneName notNil ifTrue: [
            hasName := true.
            initInstVarStream nextPutAll: '    ',p paneName, ' := self paneNamed: ', p paneName asQuotedString, '.'; cr.
        ].
    ].
    hasName = true ifTrue: [
        PWindowBuilder createMethod: initInstVarStream contents titled: 'initInstVars' in: theClass loggingSource: true.
     ].

    ^theClass!
 
initialize

    super initialize.
    mdiAttributes := WBMDIAttributes new.!
 
layoutAsBitmap

    | result e drawingGrid |

    "Answer a bitmap that contains an image of the current window."

    e := self editedPaneFrameRect extent.
    DrawingBitmap :=  Bitmap screenExtent: e + self margin.

    drawingGrid := self drawGrid.
    self drawGrid: false.

    self display.

    self drawGrid: drawingGrid.

    result := Bitmap screenExtent: e.
    result pen
        copyBitmap: DrawingBitmap
        from: (self margin @ self margin extent: e)
        at: 0@0.

    DrawingBitmap release.
    DrawingBitmap := nil.

    ^result!
 
mdiAttributes

    ^mdiAttributes!

newView: aName

    | v |

    views add: (v := WindowFrameObject new).
    v
        paneName: aName;
         framingBlock: ( FramingParameters new initialExtent: 200 @ 150; xC; yC);
        style: #(sysmenu sizable minimize maximize titlebar);
        extent: (v framingBlock value: Display boundingBox) extent;
        contents: 'Untitled';
        realClass: views first realClass.

    self switchToView: v.!
 
pen

    DrawingBitmap notNil ifTrue: [
        ^DrawingBitmap pen
    ] ifFalse: [
        ^super pen
    ].!

pseudoClassFor: className

    | superclass pSym |

    pSym := ('P', className) asSymbol.
    (Smalltalk includesKey: pSym) ifTrue: [
        ^Smalltalk at: pSym
    ].

    superclass := (Smalltalk at: className asSymbol) superclass name.

    [ superclass = 'Object' ] whileFalse: [
        pSym := ('P', superclass) asSymbol.
        (Smalltalk includesKey: pSym) ifTrue: [
            ^Smalltalk at: pSym
        ].

        superclass := (Smalltalk at: superclass asSymbol) superclass name.
    ].

    ^PGenericSubpane!
  
realDialogUnit

    ^(SysFont width / 4) @  (SysFont height / 8).!

removeView: aName

    | v |

    views size > 1 ifFalse: [
        ^MessageBox messageNote: 'You cannot remove the last view.'
    ].

    views := views reject: [:v | v paneName = aName ].

    editedPane paneName = aName ifTrue: [
        self switchToView: views first.
    ].!
   
styleFromWinClass: c

    | theStyle |

    theStyle := OrderedCollection new.

    c isModal ifTrue: [
        theStyle add: #modal.
    ].

    ((c defaultFrameStyle bitAnd:  (WinConstants at: 'WsSysmenu')) = 0) ifFalse: [
        theStyle add: #sysmenu.
    ].

    ((c defaultFrameStyle bitAnd:  (WinConstants at: 'WsMaximizebox' )) = 0) ifFalse: [
        theStyle add: #maximize.
    ].

    ((c defaultFrameStyle bitAnd:  (WinConstants at: 'WsMinimizebox' )) = 0) ifFalse: [
        theStyle add: #minimize.
    ].

    ((c defaultFrameStyle bitAnd:  (WinConstants at: 'WsThickframe' )) = 0) ifFalse: [
        theStyle add: #sizable.
    ].

    ((c defaultFrameStyle bitAnd:  (WinConstants at: 'WsCaption' )) = 0) ifFalse: [
        theStyle add: #titlebar.
    ].

    ^theStyle asArray!
 
switchToView: v

    self unselectAll.
    self outmostWindow hideWindow.

    self scrollPane scrollToOrigin.
    editedPane := v.

    self scrollPane
        setScrollRanges.

    panes := editedPane children.

    panes do: [:p | p reframe: self editedPaneContentRect.  ].
    self outmostWindow showWindow.

    self event: #selectionChanged.!

viewAt: aName

    ^(views select: [:v | v paneName = aName ]) first!
 
views

    ^views!

views: aCollection

    views := aCollection! !



!WBPMenuItem class methods ! !



!WBPMenuItem methods !
   
accelBits

    keyAccel isNil ifTrue: [ ^nil ].

    ^keyAccel accelBits!
   
accelerator

    ^keyAccel!
   
accelerator: aKeyAccel

    keyAccel := aKeyAccel!

accelKey

    keyAccel isNil ifTrue: [ ^nil ].

    ^keyAccel accelKey!
 
action

    (selector isNil or: [ (selector isMessage) not or: [ selector receiver isNil ]]) ifTrue: [
        ^nil
    ] ifFalse: [
        selector receiver isWBAction ifTrue: [
            ^selector receiver script asString
        ] ifFalse: [
            ^nil
        ].
    ]!

action: aString

    (aString isNil or: [ aString isEmpty ]) ifTrue: [ ^nil ].

     selector := (Message new)
                            receiver: (WBAction window: nil action: aString);
                            selector: #perform;
                            arguments: #();
                            yourself!
  
allSelectors

    | allSelectors newSelectors |

    allSelectors := Dictionary new.
    selector isMessage ifTrue: [ ^allSelectors ].

    selector notNil ifTrue: [
        allSelectors at: selector put: self title.
    ].
    children notNil ifTrue: [
        children do: [ :m |
            newSelectors := m allSelectors.
            newSelectors keysDo: [ :k |
                allSelectors at: k put: (newSelectors at: k).
            ].
        ].
    ].

    ^allSelectors!
 
appendTo: theMenu

    self isLeaf ifTrue: [
        self isSeparator ifTrue: [
            theMenu appendSeparator.
        ] ifFalse: [
            theMenu
                appendItem: self fullTitle
                selector: self realSelector
                accelKey: self accelKey
                accelBits: self accelBits.
        ].
    ] ifFalse: [
        theMenu appendSubMenu: self asMenu
    ].!

asMenu

    | theMenu |

    theMenu := Menu new.
    theMenu title: self fullTitle.

    children do: [ :c |
        c appendTo: theMenu.
    ].

    ^theMenu!
 
canIndent

    ^super canIndent and: [ self previousSibling isSeparator not ].!
   
copySpecificsTo: copy

    copy isSeparator: isDivider.
    copy accelerator: keyAccel.
    copy selector: selector.!
   
deleteMessage

    ^
'Deleting this item will cause submenus to be irretrievably destroyed. Do you wish to do so?'!
  
Doit self keyName!
  
fullTitle

    | fullTitle |

    fullTitle := self title.

    (keyAccel notNil and: [ keyAccel keyName notNil ]) ifTrue: [
        fullTitle := fullTitle, (String with: Tab), keyAccel fullKeyName.
    ].

    ^fullTitle!

initialize

    super initialize.
    listString := ''.
    isDivider := false.!

isSeparator

    ^isDivider!
  
isSeparator: bool

    isDivider := bool!
 
link

    (selector isNil or: [ (selector isMessage) not or: [ selector receiver isNil ]]) ifTrue: [
        ^nil
    ] ifFalse: [
        selector receiver isWBAction ifTrue: [
            ^nil
        ] ifFalse: [
            ^selector receiver asString
        ].
    ]!
 
link: aString

    (aString isNil or: [ aString isEmpty ]) ifTrue: [ ^nil ].
    selector isMessage ifFalse: [
        selector := (Message new)
                            receiver: (Smalltalk at: aString asSymbol);
                            selector: nil;
                            arguments: #();
                            yourself
    ] ifTrue: [
        selector receiver: (Smalltalk at: aString asSymbol)
    ]!
  
realSelector

    selector isArray ifTrue: [  ^selector ].
    selector isMessage ifTrue: [ ^selector ].
    ^selector isNil ifTrue: [ nil ] ifFalse: [ selector asSymbol ]!

selector

    ^selector!
  
selector:  aSelector

    (selector isMessage and: [
        selector receiver isWBAction]) ifTrue: [
        selector receiver receiver: nil
    ].

    selector := aSelector.!

storeOn: aStream indentString: indentString

    | spaceString |

    spaceString := indentString.
    aStream nextPutAll: spaceString, 'Menu new'; cr.

    spaceString := spaceString, '    '.

    aStream nextPutAll: spaceString, 'title: ', self title asQuotedString.
    aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'owner: ',PWindowBuilder secondArg.
    (self realSelector notNil and: [self realSelector isString]) ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'selector: #'.
        self realSelector printOn: aStream.
    ].
    children do: [ :c |
        c isLeaf ifTrue: [
            c isSeparator ifTrue: [
                aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'appendSeparator'.
            ] ifFalse: [
                aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'appendItem: ', c fullTitle asQuotedString.
                "Support for link menus"
                c action notNil ifTrue: [
                    aStream nextPutAll:  ' action: #', c action
                ] ifFalse: [ c link isNil ifTrue: [
                    aStream nextPutAll:  ' selector: '.
                    (c realSelector notNil) ifTrue: [
                        aStream nextPut: $#.
                    ].
                    c realSelector printOn: aStream.
                ] ifFalse: [
                    aStream nextPutAll:  ' link: #',c link,' type: #',c type
                ]].
                c accelerator notNil ifTrue: [
                    aStream nextPutAll: ' acceleratorString: '.
                    c accelerator printAccelOn: aStream.
                ].
            ].
        ] ifFalse: [
            aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'appendSubMenu: ('; cr.
            c storeOn: aStream indentString: spaceString, '    '.
            aStream cr; nextPutAll: spaceString,  ')'.
        ].
    ].!

title

    ^listString!
   
title: aTitle

    self listString: aTitle.!
  
type

    (selector isNil or: [ (selector isMessage) not or: [ selector selector isNil ]]) ifTrue: [
        ^nil
    ] ifFalse: [
        selector receiver isWBAction ifTrue: [
            ^nil
        ] ifFalse: [selector selector == #openWithParent: ifTrue: [
            ^#Child
        ] ifFalse: [ selector selector == #openWithMyParent: ifTrue: [
            ^#Sibling
        ] ifFalse: [ selector selector == #openWithMDIParent: ifTrue: [
            ^#MDIChild
        ] ifFalse: [
            ^#Independent
        ]]]].
    ]!
  
type: aString
    | aSymbol aSelector |
    (aString isNil or: [ aString isEmpty ]) ifTrue: [ ^nil ].
    aSymbol := aString asSymbol.
    aSymbol == #Child ifTrue: [
        aSelector := #openWithParent:
    ] ifFalse: [ aSymbol == #Sibling ifTrue: [
        aSelector := #openWithMyParent:
    ] ifFalse: [ aSymbol == #MDIChild ifTrue: [
        aSelector := #openWithMDIParent:
    ] ifFalse: [
        aSelector := #open
    ]]].
    selector isMessage ifFalse: [
        selector := (Message new)
                            receiver: nil;
                            selector: aSelector;
                            arguments: #();
                            yourself
    ] ifTrue: [
        selector selector: aSelector
    ]! !



!WBAboutDialog class methods !
 
isWBInternalClass

    ^true! !



!WBAboutDialog methods !
   
getVersion: aPane

    aPane contents: WindowBuilderVersion!
  
initWindow
    | font |
    font := Font new
        fromBytes: #( 243 255 0 0 0 0 0 0 188 2 0 0 0 0 3 2 1 18 84 105 109 101 115 32 78 101 119 32 82 111 109 97 110 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ).
    (self paneNamed: 'version') font: font.
    (self paneNamed: 'copyright') font: font.
    (self paneNamed: 'window') contents: (CPBitmapDict sysAt: 'window').
    (self paneNamed: 'osilogo') contents: (CPBitmapDict sysAt: 'osilogo').
    (self paneNamed: 'wbpro') contents: (CPBitmapDict sysAt: 'wbpro').
    (self paneNamed: 'address') contents: (CPBitmapDict sysAt: 'address').!
  
isWBWindow

    ^true!

ok: aPane

    self close!

open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'New Window';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 997 @ 512; xC; yC; cRDU: (2 @ 510 rightBottom: 994 @ 2));
            pStyle: #();
            backColor: ClrPalegray;
            addSubpane: (
                CPStaticGraphic new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 329 @ 288; lDU: 0 r: #left; rDU: 329 r: #left; tDU: 0 r: #top; bDU: 288 r: #top);
                    paneName: 'window';
                    startGroup;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 265 @ 64; lDU: 366 r: #left; rDU: 631 r: #left; tDU: 232 r: #top; bDU: 296 r: #top);
                    paneName: 'version';
                    centered;
                    startGroup;
                    when: #getContents perform: #getVersion:;
                    contents: '';
                    foreColor: ClrBlack;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                DrawnButton new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 329 @ 288; lDU: 663 r: #left; rDU: 992 r: #left; tDU: 0 r: #top; bDU: 288 r: #top);
                    paneName: 'osilogo';
                    startGroup;
                    when: #clicked perform: #thanks:;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                CPStaticGraphic new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 329 @ 192; lDU: 329 r: #left; rDU: 658 r: #left; tDU: 24 r: #top; bDU: 216 r: #top);
                    paneName: 'wbpro';
                    startGroup;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 814 @ 64; lDU: 110 r: #left; rDU: 923 r: #left; tDU: 304 r: #top; bDU: 368 r: #top);
                    paneName: 'copyright';
                    centered;
                    startGroup;
                    contents: '(c) Copyright ParcPlace-Digitalk, Inc. 1996
(c) Copyright Objectshare Systems, Inc. 1993-1996';
                    foreColor: ClrBlack;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                DrawnButton new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 750 @ 48; lDU: 137 r: #left; rDU: 887 r: #left; tDU: 376 r: #top; bDU: 424 r: #top);
                    paneName: 'address';
                    startGroup;
                    when: #clicked perform: #showAddress:;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 197 @ 56; lDU: 777 r: #left; rDU: 974 r: #left; tDU: 440 r: #top; bDU: 496 r: #top);
                    idOK;
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: 'OK';
                    backColor: ClrPalegray;
                    yourself
            );
        yourself
    ).

    self openModeless!
  
showAddress: aPane

    MessageBox messageNote:
'ObjectShare, a division of ParcPlace-Digitalk
3160 De La Cruz Blvd, Suite 205
Santa Clara, CA 95054-2408
http://www.objectshare.com
Phone: (408) 970-7280
Fax: (408) 970-7282
Compuserve: 76436,1063'!

thanks: aPane

    MessageBox message: 'Special Thanks to:

Robert Benson, James Chan, Eric Clayberg,
Ken Cooper, Dina Fischer, Suman Goel,
Scott Herndon, Ron Jeffries, Jasmin McCabe,
Tom Murphy, Ted Peters, Dan Rubel,
Dan Shafer, S. Sridhar, Robert Yerex.'! !



!PWBHorizontalScrollBar class methods ! !



!PWBHorizontalScrollBar methods !
  
defaultSize

    ^100 @ self suggestedSize y!
 
displayWith: aPen

    self drawHScrollBarWith: aPen at: rect.!
   
mutationRotationList

    ^#(WBVerticalScrollBar CPVerticalBarGauge CPVerticalSlider)!

storeSpecificsOn: aStream indentString: indentString

    super storeSpecificsOn: aStream indentString: indentString.

    aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'horizontal'.!

suggestedSize

    ^self extent x@17!
 
winClassStyle

    ^SbsHorz! !



!PGraphPane class methods !
 
styleFrom: s

    (s bitIsOn: WsBorder) ifFalse: [
        ^#noBorders
    ] ifTrue: [
        (s bitIsOn: WsHscroll) ifFalse: [
            ^#noScrollBars
        ] ifTrue: [
            ^#defaultStyle
        ].
    ].! !



!PGraphPane methods !
  
backColor

    ^ClrWhite!
 
displayWith: aPen

    aPen fill: self backColor.
    (style == #noBorders) ifTrue: [
        ^self
    ].
    super displayWith: aPen.

    (style == #noScrollBars) ifTrue: [
        ^self
    ].

    self displayWithBothScrollBars: aPen.!

mutationExceptions

    ^#(FreeDrawPane)!
 
mutationTypes

    ^#(GraphPane)!
 
removeEvents

    ^#().!
  
styles

    ^#(defaultStyle noScrollBars noBorders)!
  
usesColor

    ^false!

usesFocus

    ^false! !



!WBColorDialog class methods !

isWBInternalClass

    ^true! !



!WBColorDialog methods !
   
cancel: ignore

    self close.!
  
colorBarWidth

    ^50!
   
drawItem: aPane

"    drawBox drawIndex     "

    aPane pen
        fill: ((aPane drawBox leftTop extent: aPane drawBox height) insetBy: 1)
            color: (ColorConstants at: 'Clr', (colors at: aPane drawIndex) ifAbsent: [ thePane defaultBackColor ]);
        setTextAlign: TaTop;
        displayText: (colors at: aPane drawIndex) at: aPane drawBox leftTop + ((aPane drawBox height + 5) @ 0)!
   
drawItemBack: aPane

    | c |

    (colors at: aPane drawIndex) = 'Default' ifTrue: [
        c := thePane defaultBackColor.
    ] ifFalse: [
        c := ColorConstants at: 'Clr', (colors at: aPane drawIndex).
    ].

    aPane pen
        fill: ((aPane drawBox leftTop extent: self colorBarWidth @ aPane drawBox height) insetBy: 1) color: c;
        setTextAlign: TaTop;
        font: ListFont;
        displayText: (colors at: aPane drawIndex) at: aPane drawBox leftTop + ((self colorBarWidth + 5) @ 0)!
   
drawItemFore: aPane

    | c |

    (colors at: aPane drawIndex) = 'Default' ifTrue: [
        c := thePane defaultForeColor.
    ] ifFalse: [
        c := ColorConstants at: 'Clr', (colors at: aPane drawIndex).
    ].

    aPane pen
        fill: ((aPane drawBox leftTop extent: self colorBarWidth @ aPane drawBox height) insetBy: 1) color: c;
        setTextAlign: TaTop;
        font: ListFont;
        displayText: (colors at: aPane drawIndex) at: aPane drawBox leftTop + ((self colorBarWidth + 5) @ 0)!
   
foreColor: f backColor: b paneEdited: aPane

    foreColor := f.
    backColor := b.
    thePane := aPane.

    self open.

    ^result!

highlightItem: aPane

    aPane pen reverse: (aPane drawBox leftTop + ((self colorBarWidth + 2) @ 0) corner: aPane drawBox corner)!
   
initWindow

    | c |

    colors := ((ColorConstants keys asOrderedCollection
        remove: 'ClrDefault';
        remove: 'ClrBackground';
        remove: 'ClrNeutral';
        remove: 'ClrHighlighttext';
        remove: 'ClrHighlight';
        yourself) collect: [:s | s copyFrom: 4 to: s size ])
        addFirst: 'Default';
        yourself .

    thePane isFrameObject not | (CPBitmapDict systemBitmapDictionary keys includes: 'steelPattern') not ifTrue: [
        colors remove: 'Chiseledgray'
    ].

    foreColor = thePane defaultForeColor ifTrue: [
        c := 'Default'.
    ] ifFalse: [
        c := ColorConstants keyAtValue: foreColor ifAbsent: [ 'ClrDefault' ].
        c := c copyFrom: 4 to: c size.
    ].

    (thePane usesForeColor) ifTrue: [
        (self paneNamed: 'foreColorList')
            contents: colors;
            selection: c.
    ] ifFalse: [
        (self paneNamed: 'foreColorList')
            contents: #( 'Default' );
            selection: 'Default';
            disable
    ].

    backColor = thePane defaultBackColor ifTrue: [
        c := 'Default'.
    ] ifFalse: [
        c := ColorConstants keyAtValue: backColor ifAbsent: [ 'ClrDefault' ].
        c := c copyFrom: 4 to: c size.
    ].
    (self paneNamed: 'backColorList')
        contents: colors;
        selection: c.!

isWBWindow

    ^true!

ok: aPane

    | c |

    result := Array new: 2.
     (c := (self paneNamed: 'foreColorList') selectedItem) = 'Default' ifTrue: [
        result at: 1 put: nil.
    ] ifFalse: [
        result at: 1 put: (ColorConstants at: 'Clr', c).
    ].

     (c := (self paneNamed: 'backColorList') selectedItem) = 'Default' ifTrue: [
        result at: 2 put: nil.
    ] ifFalse: [
        result at: 2 put: (ColorConstants at: 'Clr', c).
    ].

    self close.!
 
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'Set Pane Colors';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 869 @ 504; xC; yC; cRDU: (11 @ 494 rightBottom: 857 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 187 @ 32; lDU: 18 r: #left; rDU: 206 r: #left; tDU: 16 r: #top; bDU: 48 r: #top);
                    startGroup;
                    contents: 'Forecolor:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 197 @ 32; lDU: 439 r: #left; rDU: 635 r: #left; tDU: 16 r: #top; bDU: 48 r: #top);
                    startGroup;
                    contents: 'Backcolor:';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 192 @ 56; lDU: 18 r: #left; rDU: 210 r: #left; tDU: 384 r: #top; bDU: 440 r: #top);
                    idOK;
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 192 @ 56; lDU: 229 r: #left; rDU: 421 r: #left; tDU: 384 r: #top; bDU: 440 r: #top);
                    idCancel;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: '&Cancel';
                    yourself
            );
            addSubpane: (
                WBListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 402 @ 320; lDU: 18 r: #left; rDU: 421 r: #left; tDU: 56 r: #top; bDU: 376 r: #top);
                    paneName: 'foreColorList';
                    ownerDrawFixed;
                    startGroup;
                    tabStop;
                    when: #highlightItem perform: #highlightItem:;
                    when: #drawItem perform: #drawItemFore:;
                    yourself
            );
            addSubpane: (
                WBListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 393 @ 320; lDU: 439 r: #left; rDU: 832 r: #left; tDU: 56 r: #top; bDU: 376 r: #top);
                    paneName: 'backColorList';
                    ownerDrawFixed;
                    startGroup;
                    tabStop;
                    when: #highlightItem perform: #highlightItem:;
                    when: #drawItem perform: #drawItemBack:;
                    yourself
            );
        yourself
    ).

    self openWindow! !



!WBAttributeEditor class methods !
  
isWBInternalClass

    ^true! !



!WBAttributeEditor methods !
   
cancel: aPane

    thePane := nil.
    super close!
  
isWBWindow

    ^true!

openOn: aWin

    thePane := aWin.
    ^self open!
   
result

    ^thePane! !



!PActionButton class methods ! !



!PActionButton methods !
   
action

    ^action!
  
action: aString

    action := aString!
   
attributeEditor

    Notifier isAltDown ifTrue: [
        ^super attributeEditor
    ] ifFalse: [
        ^WBActionEditor new
    ].!
 
copySpecificsTo: aPane

    aPane
        action: self action.!
  
importantEvents

    ^super importantEvents
        remove: #clicked;
        yourself!
 
readSpecificsFrom: c

    super readSpecificsFrom: c.
    self action: c action asString.!
   
storeContentsOn: aStream indentString: spaceString

    super storeContentsOn: aStream indentString: spaceString.

    (self action notNil and: [ self action notEmpty ]) ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: spaceString, 'action: #',self action
    ].! !



!WBKeyAccel class methods !

clearKeyConstants

    "     WBKeyAccel clearKeyConstants    "

    KeyConstantsDict := nil.! !



!WBKeyAccel methods !

= aKeyAccel

    ^(aKeyAccel isAlt = isAlt) &
     (aKeyAccel isCtrl = isControl) &
     (aKeyAccel isShift = isShift) &
     (aKeyAccel accelKey = keyCode).!
 
accelArray: accelArray

    | bits accel |

    bits := accelArray at: 2.
    accel := accelArray at: 1.

    "Can happen in 1.1, if no augmentation keys used.  Most likely case
      is non-ascii, e.g. a function key, so we use AfVirtual as a basis."
    bits isNil ifTrue: [ bits := AfVirtualkey ].

    self accelBits:  bits.

    accel isNil ifTrue: [
        ^keyCode := nil
    ].

    ((bits bitAnd: AfVirtualkey) ~= 0) ifTrue: [
        self keyCode: accel
    ] ifFalse: [
       self keyCode: (KeyboardLibrary mapVirtualKey: accel mapType: 2) asCharacter.
    ].!
  
accelBits

    | accelBits |

    accelBits := 0.

    (isAlt) ifTrue: [ accelBits := accelBits + AfAlt ].
    (isControl) ifTrue: [ accelBits := accelBits + AfControl ].
    (isShift) ifTrue: [ accelBits := accelBits + AfShift ].

    ^accelBits!
   
accelBits: accelBits

    accelBits isNil ifTrue: [
       ^isAlt := isControl := isShift := false
    ].

    isAlt := ((accelBits bitAnd: AfAlt) ~= 0).
    isControl := ((accelBits bitAnd: AfControl) ~= 0).
    isShift := ((accelBits bitAnd: AfShift) ~= 0).!

accelKey

    ^keyCode!
   
constantsDict

    KeyConstantsDict isNil ifTrue: [
        KeyConstantsDict := Dictionary new.
        WBConstants keysDo: [ :k |
            ((k at: 1) = $V) & ((k at: 2) = $k) ifTrue: [
                KeyConstantsDict at: (WBConstants at: k) put: k.
            ].
        ].
    ].

    ^KeyConstantsDict!
   
fullKeyName

    | titleString |

    titleString := ''.

    self isCtrl ifTrue: [
        titleString := titleString, 'Ctrl+'.
    ].
    self isAlt ifTrue: [
        titleString := titleString, 'Alt+'.
    ].
    self isShift ifTrue: [
        titleString := titleString, 'Shift+'.
    ].

    ^titleString, self keyName!

isAlt

    ^isAlt!

isAlt: bool

    isAlt := bool!
   
isCtrl

    ^isControl!
   
isCtrl: bool

    isControl := bool!
  
isShift

    ^isShift!

isShift: bool

    isShift := bool!
   
keyCode: code

    keyCode := code.
    keyCode isCharacter ifFalse: [
        text := self constantsDict at: code ifAbsent: [ ^text := '' ].
        text := text copyFrom: 3 to: text size.
    ] ifTrue: [
        text := CharacterConstants keyAtValue: code ifAbsent: [ String with: code asUpperCase ].
    ].!
  
keyName

    ^text!
   
pmKeyCodeFor: winCode

    ^WinToPMKeyMap at: winCode ifAbsent: [ nil ]!
  
printAccelOn: aStream

    | pmCode |

    aStream nextPut: $'.

    isAlt ifTrue: [
        aStream nextPutAll: 'Alt'.
    ].
    isShift ifTrue: [
        aStream nextPutAll: 'Shift'.
    ].
    isControl ifTrue: [
        aStream nextPutAll: 'Ctrl'.
    ].

    keyCode notNil ifTrue: [
        aStream nextPut: $+.
    ].

    keyCode isCharacter ifTrue: [
        aStream nextPut: keyCode.
    ] ifFalse: [
        pmCode := self pmKeyCodeFor: keyCode.

        pmCode notNil ifTrue: [
            aStream nextPutAll: pmCode asString
        ].
    ].

    aStream nextPut: $'.! !



!PStatusPane class methods ! !



!PStatusPane methods !
 
attributeEditor

    ^WBStatusPaneEditor new!
 
contents: ignore

    contents := nil!

copySpecificsTo: aPane

    aPane statusBoxes: self statusBoxes.!
 
defaultBackColor

    ^WinInfo colorButtonFace.!
  
defaultFont

    ^Font face:'Helv' size:(0 @ (self height - (2 * self inset))) fixedWidth:false!
  
defaultForeColor

    ^WinInfo colorButtonText.!
  
displayBox: box with: aPen

    |rcDraw  string|

    box rectangle isNil ifTrue:[^self].
    (box rectangle right isLeftEqualOf: box rectangle left)
        ifTrue:[^nil].

    rcDraw := box rectangle.
    aPen fill: ((rcDraw leftBottom leftAndUp:(0 @ 1)) rightTop: (rcDraw leftTop rightAndDown:( 1 @ 0)))
        color: WinInfo colorButtonShadow.
    aPen fill: ((rcDraw leftTop rightAndDown: (1 @ 0)) rightBottom: (rcDraw rightTop leftAndDown:( 0 @ 1)))
        color: WinInfo colorButtonShadow.
    aPen fill: ((rcDraw leftBottom rightAndUp:(0 @ 0))  rightTop: (rcDraw rightBottom leftAndUp:( 0 @ 1)))
        color: WinInfo colorButtonHighlight.
    aPen fill: ((rcDraw rightBottom leftAndUp:(1 @ 0)) rightTop: (rcDraw rightTop leftAndDown:( 2 @ 0)))
        color: WinInfo colorButtonHighlight.

    box contents isNil ifTrue:[^self].
    string := box contents isString
        ifTrue: [ box contents ]
        ifFalse: [ box contents printString ].
    rcDraw := box rectangle insetBy: (1 @ 1).
    aPen
        backColor: self realBackColor;
        foreColor: self foreColor;
        displayText: string at: (rcDraw leftBottom rightAndUp: (1 @ (aPen font height + 1)))
        clipRect: rcDraw
        options: EtoOpaque | EtoClipped.!
   
displayWith: aPen

    aPen
        font: self font;
        fill: rect color: self realBackColor;
        lineFrom: rect origin to: rect rightTop;
        foreColor: ClrWhite;
        lineFrom: (rect origin down: 1) to: (rect rightTop down: 1);
        foreColor: self foreColor.

    aPen
        backColor: WinInfo colorButtonFace;
        foreColor: WinInfo colorButtonText.

    self statusBoxes do: [ :each | self displayBox: each with: aPen ].!
   
framingBlock: f

    | width |
    parentWindow isNil ifTrue: [
        width := 300
    ] ifFalse: [
        width := parentWindow rect width
    ].
    framingBlock := FramingParameters new
        iDUE: width @ (self height / (SysFont height / 32));
        lDU: 0 r: #left;
        rDU: 0 r: #right;
        tDU: self height / (SysFont height / 32) r: #bottom;
        bDU: 0 r: #bottom.

    self updateBoxes!
   
generateTabStopsAndGroups

    ^true!
 
height

    ^self font isNil ifTrue: [
        WinInfo cyCaption - 1
    ] ifFalse: [
        self font height + 8
    ].!

inset

    ^3!

readSpecificsFrom: c

    self statusBoxes: c contents.
    c isResizable ifTrue: [
        self style: (c justified,'Justified') asSymbol
    ] ifFalse: [
        self style: (c justified,'JustifiedFixed') asSymbol
    ].

    self updateBoxes.!
 
reframe: parentRect

    super reframe: parentRect.
    self updateBoxes!

statusBoxes

    statusBoxes isNil ifTrue: [ statusBoxes := OrderedCollection new ].
    ^statusBoxes!
   
statusBoxes: aCollection

    statusBoxes := aCollection!
 
staysToBack

    ^true!
   
storeContentsOn: aStream indentString: indentString

    self statusBoxes isEmpty ifFalse: [
        aStream nextPutAll: ';'; cr; nextPutAll: indentString, 'contents: ('; cr.
        aStream nextPutAll: indentString, '    OrderedCollection new'; cr.
        self statusBoxes do: [ :f |
            aStream nextPutAll: indentString, '        addLast: ('; cr.
            f storeOn: aStream indentString: indentString, '            '.

            aStream cr; nextPutAll: indentString, '        )'.
            aStream nextPutAll: ';'; cr
        ].

        aStream nextPutAll: indentString, '        yourself'; cr.
        aStream nextPutAll: indentString, ')'.
    ].!

style: aStyle

    super style: aStyle.
    self updateBoxes!

styles

    ^#(rightJustified leftJustified rightJustifiedFixed leftJustifiedFixed)!
  
tabPosition: ignore!

updateBoxes

    self style == #leftJustified ifTrue:[
        self updateBoxesLeftJustified
    ] ifFalse: [ self style == #leftJustifiedFixed ifTrue:[
        self updateBoxesLeftJustifiedFixed
    ] ifFalse: [ self style == #rightJustifiedFixed ifTrue:[
        self updateBoxesRightJustifiedFixed
    ] ifFalse:[
        self updateBoxesRightJustified
    ]]].!
 
updateBoxesLeftJustified

    | xPos aRect box |
    xPos := self updateBoxesLeftJustifiedFixed.
    self statusBoxes isEmpty ifTrue: [^self].

    box := self statusBoxes last.
    xPos := xPos left: box width + 6.
    aRect := xPos @ rect top corner: (rect width left: self height - 12) @ (rect bottom down: 2).
    aRect := aRect insetBy: (0 @ self inset).
    box rectangle: aRect.!

updateBoxesLeftJustifiedFixed

    |xPos aRect|

    xPos := rect left.
    self statusBoxes do: [ :box |
        xPos := xPos right: box space.
        aRect := xPos @ rect top corner: (xPos + box width + 6) @ (rect bottom down: 2).
        aRect := aRect insetBy: (0 @ self inset).
        box rectangle: aRect.
        xPos := xPos right: box width + 6].
    ^xPos!
 
updateBoxesRightJustified

    | xPos aRect box |
    xPos := self updateBoxesRightJustifiedFixed.
    self statusBoxes isEmpty ifTrue:[^self].

    box := self statusBoxes first.
    xPos := xPos right: box space.
    xPos := xPos right: box width + 6.
    aRect := (12 + box space @ rect top) corner: xPos @ (rect bottom down: 2).
    aRect := aRect insetBy: (0 @ self inset).
    box rectangle: aRect.!

updateBoxesRightJustifiedFixed

    |xPos aRect|

    xPos := rect right - self height.
    self statusBoxes reverseDo: [ :box |
        xPos := xPos left: box width + 6.
        aRect := xPos @ rect top corner: (xPos + box width + 6) @ (rect bottom down: 2).
        aRect := aRect insetBy: (0 @ self inset).
        box rectangle: aRect.
        xPos := xPos left: box space].
    ^xPos!

usesFocus

    ^false!

usesFraming

    ^false! !



!WBLinkEditor class methods !
   
descriptions

    Descriptions isNil ifTrue: [
        (Descriptions := Dictionary new)
            at: 'Independent' put:
'Opens the selected
window with no
parent.';
            at: 'Child' put:
'Opens the selected
window as a child of
the current window.';
            at: 'MDIChild' put:
'Opens the selected
window as an MDI
child of the current
MDI parent window.';
            at: 'Sibling' put:
'Opens the selected
window as a child of
the current window''s
parent.'.
    ].
    ^Descriptions!
 
descriptions: aDictionary
    " WBLinkEditor descriptions: nil "
    Descriptions := aDictionary! !



!WBLinkEditor methods !

initWindow

    | listPane typePane |
    link := thePane link.
    type := thePane type.
    (self paneNamed: 'typeDescription') disable.
    (listPane := self paneNamed: 'list') contents: self viableClasses.
    link isNil ifFalse: [
        listPane selectItem: link.
        self select: listPane
    ].!
  
ok: aPane

    thePane link: (self paneNamed: 'list') selectedItem.
    thePane type: (self paneNamed: 'types') selectedItem.
    (thePane isInterfaceObject and: [ thePane link notNil ]) ifTrue: [
        thePane contents: thePane link,'...'
    ].

    self close!
   
open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'Link Attributes';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 850 @ 476; lDU: 286 r: #left; tDU: 282 r: #top; cRDU: (297 @ 748 rightBottom: 1125 @ 330));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 357 @ 316; lDU: 457 r: #left; rDU: 814 r: #left; tDU: 28 r: #top; bDU: 344 r: #top);
                    startGroup;
                    contents: 'Link Type';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 421 @ 32; lDU: 14 r: #left; rDU: 434 r: #left; tDU: 8 r: #top; bDU: 40 r: #top);
                    startGroup;
                    contents: 'Select a ViewManger Class:';
                    yourself
            );
            addSubpane: (
                ListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 320 @ 108; lDU: 475 r: #left; rDU: 795 r: #left; tDU: 68 r: #top; bDU: 176 r: #top);
                    paneName: 'types';
                    contents: #( 'Independent' 'Child' 'Sibling' );
                    startGroup;
                    when: #select perform: #selectType:;
                    when: #doubleClickSelect perform: #ok:;
                    yourself
            );
            addSubpane: (
                TextEdit new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 320 @ 148; lDU: 475 r: #left; rDU: 795 r: #left; tDU: 184 r: #top; bDU: 332 r: #top);
                    paneName: 'typeDescription';
                    startGroup;
                    yourself
            );
            addSubpane: (
                ListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 421 @ 364; lDU: 18 r: #left; rDU: 439 r: #left; tDU: 44 r: #top; bDU: 408 r: #top);
                    paneName: 'list';
                    startGroup;
                    tabStop;
                    when: #select perform: #select:;
                    when: #doubleClickSelect perform: #ok:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 169 @ 56; lDU: 457 r: #left; rDU: 626 r: #left; tDU: 352 r: #top; bDU: 408 r: #top);
                    paneName: 'ok';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 169 @ 56; lDU: 645 r: #left; rDU: 814 r: #left; tDU: 352 r: #top; bDU: 408 r: #top);
                    paneName: 'cancel';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: 'Cancel';
                    yourself
            );
        yourself
    ).

    self openWindow!
   
select: aPane
    | typePane |
    ((Smalltalk at: aPane selectedItem asSymbol) methodDictionary keys includes: #open) ifFalse: [
        (Smalltalk includesKey: #MDISystem) ifTrue: [
            (typePane := self paneNamed: 'types') contents: #('Independent' 'Child' 'Sibling' 'MDIChild')
        ] ifFalse: [
            (typePane := self paneNamed: 'types') contents: #('Independent' 'Child' 'Sibling')
        ].
    ] ifTrue: [
        (typePane := self paneNamed: 'types') contents: #('Independent')
    ].
    typePane selectItem: type asString.
    typePane selectedItem isNil ifTrue: [ typePane selectIndex: 1 ].
    self selectType: typePane.!
  
selectType: aPane

    (self paneNamed: 'typeDescription') contents:
        (self class descriptions at: aPane selectedItem)!
   
viableClasses

    ^(ViewManager wbCreatedClasses collect: [ :aClass |
        aClass name ]) asSortedCollection asOrderedCollection.! !



!WBWindowEditor class methods ! !



!WBWindowEditor methods !
   
initWindow

    | theStyle |

    theStyle := thePane style.
    iconFile := thePane iconFile.

    (self paneNamed: 'systemMenu') selection: (theStyle includes: #sysmenu).
    (self paneNamed: 'maximizeBox') selection: (theStyle includes: #maximize).
    (self paneNamed: 'minimizeBox') selection: (theStyle includes: #minimize).
    thePane isModal ifTrue: [
        (self paneNamed: 'sizingFrame') hideWindow.
        (self paneNamed: 'mainViewChild') hideWindow
    ] ifFalse: [
        (self paneNamed: 'sizingFrame') selection: (theStyle includes: #sizable).
    ].
    (self paneNamed: 'titleBar') selection: (theStyle includes: #titlebar).
    (self paneNamed: 'mainViewChild') selection: (theStyle includes: #mainViewChild).

    "Support for MainView children"
    (thePane paneName = 'mainView') ifTrue: [
        (self paneNamed: 'mainViewChild') hideWindow
    ].!
 
ok: aPane

    | s anArray |

    s := Set new.
    (self paneNamed: 'systemMenu') selection ifTrue: [
        s add: #sysmenu.
    ].

    (self paneNamed: 'maximizeBox') selection ifTrue: [
        s add: #maximize.
    ].

    (self paneNamed: 'minimizeBox') selection ifTrue: [
        s add: #minimize.
    ].

    (self paneNamed: 'sizingFrame') selection ifTrue: [
        s add: #sizable.
    ].

    (self paneNamed: 'titleBar') selection ifTrue: [
        s add: #titlebar.
    ].

    "Support for MainView children"
    (self paneNamed: 'mainViewChild') selection ifTrue: [
        s add: #mainViewChild.
    ].

    iconEditor notNil ifTrue: [
        iconEditor fileName notNil ifTrue: [
            iconFile := ((anArray := File splitPath: iconEditor fileName in: Disk) at: 2),'\',(anArray at: 3).
        ]
    ].

    thePane := thePane fullCopy.

    thePane
        style: s;
        iconFile: iconFile.


    super close.!
   
open


     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'Window Attributes';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 667 @ 312; xC; yC; cRDU: (11 @ 302 rightBottom: 656 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 274 @ 40; lDU: 357 r: #left; rDU: 631 r: #left; tDU: 120 r: #top; bDU: 160 r: #top);
                    paneName: 'mainViewChild';
                    startGroup;
                    contents: '&MainView Child';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 192 @ 56; lDU: 439 r: #left; rDU: 631 r: #left; tDU: 184 r: #top; bDU: 240 r: #top);
                    paneName: 'setIcon';
                    startGroup;
                    when: #clicked perform: #setIcon:;
                    contents: 'Set &Icon...';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 295 @ 40; lDU: 18 r: #left; rDU: 313 r: #left; tDU: 24 r: #top; bDU: 64 r: #top);
                    paneName: 'systemMenu';
                    startGroup;
                    tabStop;
                    contents: '&System menu';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 299 @ 40; lDU: 18 r: #left; rDU: 318 r: #left; tDU: 72 r: #top; bDU: 112 r: #top);
                    paneName: 'minimizeBox';
                    startGroup;
                    tabStop;
                    contents: 'Mi&nimize box';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 311 @ 40; lDU: 18 r: #left; rDU: 329 r: #left; tDU: 120 r: #top; bDU: 160 r: #top);
                    paneName: 'maximizeBox';
                    startGroup;
                    tabStop;
                    contents: 'Ma&ximize box';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 224 @ 40; lDU: 357 r: #left; rDU: 581 r: #left; tDU: 24 r: #top; bDU: 64 r: #top);
                    paneName: 'titleBar';
                    startGroup;
                    tabStop;
                    contents: '&Title bar';
                    yourself
            );
            addSubpane: (
                CheckBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 265 @ 40; lDU: 357 r: #left; rDU: 622 r: #left; tDU: 72 r: #top; bDU: 112 r: #top);
                    paneName: 'sizingFrame';
                    startGroup;
                    tabStop;
                    contents: 'Sizing &frame';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 165 @ 56; lDU: 18 r: #left; rDU: 183 r: #left; tDU: 184 r: #top; bDU: 240 r: #top);
                    idOK;
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 165 @ 56; lDU: 201 r: #left; rDU: 366 r: #left; tDU: 184 r: #top; bDU: 240 r: #top);
                    idCancel;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: '&Cancel';
                    yourself
            );
        yourself
    ).

    self openWindow!
  
setIcon: aPane

    "Support for setting window icons"

    (Smalltalk includesKey: #WBIconEditor) ifFalse: [
        ^self setIconFromDialog
    ].
    iconEditor notNil ifTrue: [
        iconEditor fileName notNil ifTrue: [
            iconFile := iconEditor fileName.
        ].
    ].
    iconEditor := iconFile isNil ifTrue: [
        (Smalltalk at: #WBIconEditor) new open.
    ] ifFalse: [
        (File exists: iconFile) ifFalse: [
            MessageBox message: 'The icon file: ''',iconFile,''' cannot be found.'.
            (Smalltalk at: #WBIconEditor) new open.
        ] ifTrue: [
            (Smalltalk at: #WBIconEditor) new openOnFile: iconFile.
        ].
    ].!
 
setIconFromDialog

    "Support for setting window icons"
    | file |
    iconFile isNil ifTrue: [
        file := nil
    ] ifFalse: [
        file := (File splitPath: iconFile in: Disk) at: 3
    ].
    iconFile := (FileDialog new
                            openTitle: (file isNil
                                ifTrue: ['Select Icon File']
                                ifFalse: ['Select Icon File - ',file])
                            fileSpec: '*.ICO'
                            showFileInButton: false) file.
    iconFile isNil ifTrue: [ ^nil ].
    (iconFile asStream skipTo: $.; upTo: $.) asUpperCase = 'ICO' ifFalse: [
        MessageBox message: iconFile,' is not a valid .ICO file!!'.
        iconFile := nil
    ].! !



!WBScrollBarEditor class methods ! !



!WBScrollBarEditor methods !
 
close
  ^self cancel: nil!
 
initWindow

    (self paneNamed: 'lineInc') contents: thePane lineIncrement asString.
    (self paneNamed: 'pageInc') contents: thePane pageIncrement asString.
    (self paneNamed: 'minimum') contents: thePane minimum asString.
    (self paneNamed: 'maximum') contents: thePane maximum asString.!
   
ok: ignore

    thePane
        lineIncrement: (self paneNamed: 'lineInc') contents asInteger;
        pageIncrement: (self paneNamed: 'pageInc') contents asInteger;
        minimum: (self paneNamed: 'minimum') contents asInteger;
        maximum: (self paneNamed: 'maximum') contents asInteger.

    self close!

open

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'Scroll Bar Attributes';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 503 @ 368; xC; yC; cRDU: (11 @ 358 rightBottom: 491 @ 48));
            pStyle: #(sysmenu modal titlebar);
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 210 @ 32; lDU: 55 r: #left; rDU: 265 r: #left; tDU: 136 r: #top; bDU: 168 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Minimum:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 201 @ 32; lDU: 64 r: #left; rDU: 265 r: #left; tDU: 192 r: #top; bDU: 224 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Maximum:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 256 @ 32; lDU: 9 r: #left; rDU: 265 r: #left; tDU: 80 r: #top; bDU: 112 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Page increment:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 249 @ 32; lDU: 18 r: #left; rDU: 267 r: #left; tDU: 24 r: #top; bDU: 56 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Line increment:';
                    yourself
            );
            addSubpane: (
                EntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 192 @ 48; lDU: 274 r: #left; rDU: 466 r: #left; tDU: 16 r: #top; bDU: 64 r: #top; indent: 3 @ 4);
                    paneName: 'lineInc';
                    startGroup;
                    tabStop;
                    yourself
            );
            addSubpane: (
                EntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 192 @ 48; lDU: 274 r: #left; rDU: 466 r: #left; tDU: 72 r: #top; bDU: 120 r: #top; indent: 3 @ 4);
                    paneName: 'pageInc';
                    startGroup;
                    tabStop;
                    yourself
            );
            addSubpane: (
                EntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 192 @ 48; lDU: 274 r: #left; rDU: 466 r: #left; tDU: 128 r: #top; bDU: 176 r: #top; indent: 3 @ 4);
                    paneName: 'minimum';
                    startGroup;
                    tabStop;
                    yourself
            );
            addSubpane: (
                EntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 192 @ 48; lDU: 274 r: #left; rDU: 466 r: #left; tDU: 184 r: #top; bDU: 232 r: #top; indent: 3 @ 4);
                    paneName: 'maximum';
                    startGroup;
                    tabStop;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 219 @ 56; lDU: 18 r: #left; rDU: 238 r: #left; tDU: 248 r: #top; bDU: 304 r: #top);
                    idOK;
                    defaultPushButton;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #ok:;
                    contents: '&OK';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 219 @ 56; lDU: 247 r: #left; rDU: 466 r: #left; tDU: 248 r: #top; bDU: 304 r: #top);
                    idCancel;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: '&Cancel';
                    yourself
            );
        yourself
    ).

    self openWindow! !



!WBTextPane class methods !

isWBInternalClass

    ^true!
 
messageMenu
        "Answer the Message menu."
    ^Menu new
        appendItem: '&Senders' selector: #senders;
        appendItem: '&Implementors' selector: #implementors;
        appendItem: '&References' selector: #references;
        "appendSeparator ;
        appendItem: '&Check Spelling' selector: #spellCheck;"
        title: '~Message'!
   
supportedEvents
        "Private - Answer the Set of events that TextPanes can notify
         their owners about."
    ^super supportedEvents
        add: #textChanged;
        yourself! !



!WBTextPane methods !
 
backspace

    super backspace.
    self event: #textChanged!

characterInput: aCharacter

    super characterInput: aCharacter.
    self event: #textChanged!
  
cutSelection

    super cutSelection.
    self event: #textChanged!
  
evaluate: aBoolean

    evaluate := aBoolean!
 
getText
        "Private - Restore the last saved
         version of the text."
    modified := false.
    textHolder string: owner.!
  
implementors

    self selectedItem isEmpty ifTrue: [ ^nil ].
    Smalltalk implementorsOf: self selectedItem asMessage!
 
modified

    ^false!
 
offset

    ^offset!
  
offset: anInteger

    offset := anInteger!
   
pasteSelection

    super pasteSelection.
    self event: #textChanged!
  
popupMenu
        "Private - Answer the popup Menu for the receiver."
    | m |
    m := Menu new
        appendItem: '&Copy' selector: #copySelection;
        appendItem: 'Cu&t' selector: #cutSelection ;
        appendItem: '&Paste' selector: #pasteSelection ;
        appendSeparator ;
        appendItem: '&Inspect It' selector: #inspectIt ;
        appendItem: '&Show It' selector: #printIt  ;
         appendItem: '&Do It' selector: #doIt  ;
       appendSeparator ;
        appendItem: '&Senders' selector: #senders;
        appendItem: '&Implementors' selector: #implementors;
        appendItem: '&References' selector: #references.
    m owner: self;
        title: '&TextPanePopup'.
    m getIndex: #accept ifAbsent: [^m]. "Check to be sure the item is there."
    (self mainWindow menuTitled: '&File') isNil ifFalse: [
        m copyItemAttributes: #accept from: (self mainWindow menuTitled: '&File').
    ].
    ^m!

references
    | global |
    self selectedItem isEmpty ifTrue: [ ^nil ].
    global := Smalltalk associationAt: self selectedItem trimBlanks asSymbol ifAbsent: [ nil ].
    global isNil
        ifFalse: [ Smalltalk sendersOf: global ]
        ifTrue: [ MessageBox message: 'There are no references to ''',self selectedItem,'''.']
        .!

saveCompilerError: aString at: anInteger in: codeString for: aClass

    ^super
        saveCompilerError: aString
        at: (anInteger - offset)
        in: self contents
        for: aClass!

senders

    self selectedItem isEmpty ifTrue: [ ^nil ].
    Smalltalk sendersOf: self selectedItem asMessage! !



!PListPane class methods ! !



!PListPane methods !
 
styles

    ^nil! !



!PStaticText class methods !
   
styleFrom: s

    (s bitIsOn: SsRight) ifTrue: [
        ^#rightJustified
    ] ifFalse: [
        (s bitIsOn: SsCenter) ifTrue: [
            ^#centered
        ] ifFalse: [
            ^#leftJustified
        ].
    ].! !



!PStaticText methods !
 
attributeEditor

    ^WBStaticTextEditor new!
 
autoSizeFrom

    ^self style!

changesSize

    ^true!
   
changesTitle

    ^true!
  
defaultForeColor

    ^self getSysColor: ColorWindowtext!
 
displayWith: aPen

    | just s aRect |

    aPen fill: rect color: self backColor.


    aPen
        foreColor: foreColor;
        backColor: self backColor;
        font: font.

    just :=  ((OrderedCollection new
                add: SsLeft;
                add: SsRight;
                add: SsCenter;
                yourself) asArray
               at: (#(leftJustified rightJustified centered) indexOf: style) ).

    s := contents.
    aRect := rect.

    aPen setTextAlign: TaTop.
    aPen winDrawText: s in: aRect format: just | DtWordbreak!

mutationExceptions

    ^#(CPChildEntryField Toggle)!
 
mutationTypes

    ^#(EntryField StaticText Toggle)!
  
styles

    ^#(leftJustified rightJustified centered)!

suggestedSize

    | lines max s |

    lines := (self contents occurrencesOf: Lf) + 1.
    max := 0.
    s := ReadStream on: self contents.
    [ s atEnd ] whileFalse: [
        max := max max: (self font wbStringWidth: (s upTo: Lf)).
    ].

    ^(max + 5) @(lines * self font height).!
 
usesMenu

    ^false!
 
usesTitle

    ^true!
 
winUserStyle

    ^((OrderedCollection new
            add: SsLeft;
            add: SsRight;
            add: SsCenter;
            yourself) asArray
        at: (#(leftJustified rightJustified centered) indexOf: style))! !



!WindowBuilder class methods !
   
aboutWB

    PWindowBuilder basicNew aboutWB!
 
addInCompositePaneExamples: op
    "Register the additional CompositePane Example menu items"
    | addInName |
    (Smalltalk includesKey: #ListEditorPane) ifFalse: [ ^nil ].
    addInName := 'CompositePane Examples'.
    op == #name ifTrue:[ ^addInName ].
    op == #help ifTrue:[
^'Adds tool palette and "Add" menu options
to support several CompositePane
examples.'].
    PWindowBuilder extras removeKey: addInName ifAbsent: [ nil ].
    PWindowBuilder
        register: addInName menu: #('~OkCancelPane' 'OkCancelPane' '' ) after: 'SexPane';
        register: addInName menu: #('~NamePane' 'NamePane' '' ) after: 'OkCancelPane';
        register: addInName menu: #('~AddressPane' 'AddressPane' '' ) after: 'NamePane';
        register: addInName menu: #('~PersonPane' 'PersonPane' '' ) after: 'AddressPane';
        register: addInName menu: #('~ListEditorPane' 'ListEditorPane' '' ) after: 'PersonPane';
        register: addInName menu: #('~DictionaryEditorPane' 'DictionaryEditorPane' '' ) after: 'ListEditorPane';
        register: addInName menu: #('Address~EditorPane' 'AddressEditorPane' '' ) after: 'DictionaryEditorPane'.!
  
addInFixFraming: op
    "Register the FramingParameter fix menu items"
    | addInName |
    addInName := 'Framing Fixer'.
    op == #name ifTrue:[ ^addInName ].
    op == #help ifTrue:[
^'Add a utility for fixing the framing
parameters on windows moved
between Windows and OS/2.'].
    PWindowBuilder extras removeKey: addInName ifAbsent: [ nil ].
    PWindowBuilder
        register: addInName menu: #('Fix Framing' fixFraming '' ) after: 'Set Window &Position...    '.!
 
addInInstVarNameCheck: op
    "Register support for Instance Variable Name Checking"
    | addInName |
    addInName := 'Instance Variable Name Checking'.
    op == #name ifTrue:[ ^addInName ].
    op == #help ifTrue:[
^'Force the pane name to be a valid
instance variable name.'].

    PWindowBuilder
        register: addInName propertyAt: #InstVarNameCheck put: true.!
   
addInPaneInspector: op
    "Register the additional Inspect menu items"
    | addInName |
    addInName := 'Pane Inspector'.
    op == #name ifTrue:[ ^addInName ].
    op == #help ifTrue:[
^'Adds an Inspect menu to the menubar.'].
    PWindowBuilder extras removeKey: addInName ifAbsent: [ nil ].
    PWindowBuilder
        register: addInName menu: #('&Inspect' nil (
            ('&Inspect Selection' inspectSelection '')
            )) after: 'Add'.!

addInSubPanes: op
    "Register the additional SubPanes menu items"
    | addInName |
    (Smalltalk includesKey: #CPSubPane) ifFalse: [ ^nil ].
    addInName := 'SubPanes/V'.
    op == #name ifTrue:[ ^addInName ].
    op == #help ifTrue:[
^'Adds tool palette and "Add" menu options
to support the SubPanes/V widget
collection.'].
    PWindowBuilder extras removeKey: addInName ifAbsent: [ nil ].
    PWindowBuilder
        register: addInName menu: #('~3D Button' add: (
            ('~CPBitmapButton' 'CPBitmapButton' '')
            ('CPBitmap~Toggle' 'CPBitmapToggle' '')
            ('CP3DC~heckBox' 'CP3DCheckBox' '')
            ('CP3D~RadioButton' 'CP3DRadioButton' '')
            )) after: 'Button';
        register: addInName menu: #('CP~HierarchicalListBox' 'CPHierarchicalListBox' '' ) after: 'ComboBox';
        register: addInName menu: #('CPC~olumnarListBox' 'CPColumnarListBox' '' ) after: 'CPHierarchicalListBox';
        register: addInName menu: #('CP~TableEditor' 'CPTableEditor' '' ) after: 'CPColumnarListBox';
        register: addInName menu: #('CP~SpinButton' 'CPSpinButton' '' ) after: 'CPTableEditor';
        register: addInName menu: #('CPHorizontal~BarGauge' 'CPHorizontalBarGauge' '' ) after: 'Vertical Scroll Bar';
        register: addInName menu: #('CPVerticalB~arGauge' 'CPVerticalBarGauge' '' ) after: 'CPHorizontalBarGauge';
        register: addInName menu: #('~CPCircularGauge' 'CPCircularGauge' '' ) after: 'CPVerticalBarGauge';
        register: addInName menu: #('CPHorizontal~Slider' 'CPHorizontalSlider' '' ) after: 'CPCircularGauge';
        register: addInName menu: #('CPVerticalS~lider' 'CPVerticalSlider' '' ) after: 'CPHorizontalSlider';
        register: addInName menu: #('CP~NumericEditor' 'CPNumericEditor' '' ) after: 'TextPane';
        register: addInName menu: #('CPT~imeEditor' 'CPTimeEditor' '' ) after: 'CPNumericEditor';
        register: addInName menu: #('~CPDateEditor' 'CPDateEditor' '' ) after: 'CPTimeEditor';
        register: addInName menu: #('~CP3DFrame' 'CP3DFrame' '' ) after: 'GroupBox';
        register: addInName menu: #('~CPBitmapPane' 'CPBitmapPane' '' ) after: 'StaticGraphic';
        register: addInName menu: #('~CPValueSet' 'CPValueSet' '' ) after: 'WBToolBar'.!
   
addToolbarTool

    | class |

    class := Smalltalk at: #MDISystem ifAbsent: [ nil ].

    class notNil ifTrue: [
        class addExtraTool: self toolBarTool.
    ].!
   
addWindowBuilderMenuHelpItems

    (Smalltalk includesKey: #HelpStatusPane) ifFalse: [
        ^self
    ].

    (Smalltalk at: #HelpStatusPane)
        at: 'WindowBuilder' put: 'Launch WindowBuilder.';
        at: 'newWindowBuilder' put: 'Open WindowBuilder on a scratch ViewManager.';
        at: 'newDialogWindowBuilder' put: 'Open WindowBuilder on a scratch WindowDialog.';
        at: 'editWindow' put: 'Open WindowBuilder on an existing ViewManager or WindowDialog.';
        at: 'launchBitmapManager' put: 'Open the CPBitmapManager.';
        at: 'aboutWB' put: 'Display version information on WindowBuilder.'!
   
allViewManagerClasses

    WBClasses notNil ifTrue: [
        ^WBClasses
    ].

    "Exclude all WindowBuilder subclasses"
    WBClasses := WindowBuilder withAllSubclasses asOrderedCollection.
    self excludeOtherClasses.
    ViewManager allSubclasses do: [ :c |
        c isWBInternalClass ifTrue: [
                WBClasses add: c
        ].
    ].

    ^WBClasses!
   
clearCustomPanes

    "  WindowBuilder clearCustomPanes   "

    CustomPanes := nil.!
   
clearExtras
    "   WindowBuilder clearExtras    "
    Extras := Dictionary new.!
 
clearHelpDict

    "   WindowBuilder clearHelpDict    "
    HelpDict := nil.!

clearToolbarTool

    "   WindowBuilder clearToolbarTool    "
    ToolbarTool := nil.!
   
clearWBClasses

    "  WindowBuilder clearWBClasses   "

    WBClasses := nil.!
 
clearWBIcon

    "  WindowBuilder clearWBIcon   "

    WBIcon := nil.!
  
codeGenerationHook
    ^self propertyAt: #CodeGenerationHook!
  
createMethod: methodString in: aClass loggingSource: logSource
    "Do all method creation through this method"
    | result hook |
    result := aClass compile: methodString.
    result notNil & logSource ifTrue: [
        ((hook := self codeGenerationHook) notNil and: [ self respondsTo: hook asSymbol ]) ifTrue: [
            self perform: hook asSymbol with: methodString with: result key with: aClass
        ] ifFalse: [
            Smalltalk
                logSource: methodString
                forSelector: result key
                inClass: aClass
        ].
    ].!

createMethod: bodyString titled: title in: aClass loggingSource: logSource

    | result methodString |

    methodString := title, '
', bodyString.
    "Consolidate all code creation"
    self
        createMethod: methodString
        in: aClass
        loggingSource: logSource!
 
editWindow

    | c |
    PWindowBuilder preOpen.
    (c := self new getEditedClass) notNil ifTrue: [
        PWindowBuilder new openOn: c.
    ].!
   
excludeOtherClasses
    "Exclude MDIViewManager subclasses unless MDI add-in is enabled"
    ((Smalltalk includesKey: #MDIViewManager) and: [
        (self extras includesKey: 'WindowBuilder 2.0 MDI Support') not ]) ifTrue: [
        WBClasses addAll: (Smalltalk at: #MDIViewManager) withAllSubclasses
    ].!
  
extras
    Extras isNil ifTrue: [ Extras := Dictionary new ].
    ^Extras!

firstArg
    | arg |
    arg := self openMethodArgs at: 1.
    ^(arg isNil or: [ arg isString not ])
        ifTrue: [ 'self' ]
        ifFalse: [ arg asString ]!
 
helpDict

    HelpDict isNil ifTrue: [
        HelpDict := Dictionary new.
        HelpDict
            at: 'File' put: 'Create, edit, import, export window definitions; edit app code.';
            at: 'createNew' put: 'Create a new window.';
            at: 'createNewDialog' put: 'Create a new dialog.';
            at: 'openNew' put: 'Open an existing window or dialog.';
            at: 'importFromWindows' put: 'Convert WindowBuilder 1.x generated windows.';
            at: 'importFromResFile' put: 'Convert dialog resources (.res files) to Smalltalk windows.';
            at: 'save' put: 'Save the currently edited ViewManager.';
            at: 'saveAs' put: 'Save the currently edited ViewManager with a new class name.';
            at: 'saveAsDefault' put: 'Use the current layout of windows as the default for new windows.';
            at: 'exportToResFile' put: 'Save the current dialog layout as a resource (.res) file.';
            at: 'editAppCode' put: 'Bring up CHB on currently edited ViewManager.';
            at: 'close' put: 'Close WindowBuilder.';

            at: 'Edit' put: 'Subpane editing, selection, ordering;  window testing, tab order editing ';
            at: 'undo' put: 'Undo the last command.';
            at: 'cut' put: 'Remove currently selected subpanes from layout, place on clipboard.';
            at: 'copy' put: 'Copy the currently selected subpanes to the clipboard.';
            at: 'paste' put: 'Load the cursor with the subpanes on the clipboard.';
            at: 'clear' put: 'Remove currently selected subpanes from layout.';
            at: 'selectAll'  put: 'Add all subpanes in window to the selection.';
            at: 'bringToFront' put: 'Bring currently selected pane to the front of all overlapping panes.';
            at: 'sendToBack' put: 'Send currently selected pane behind all overlapping panes.';
            at: 'duplicate'  put: 'Duplicate the currently selected subpanes.';
            at: 'mutate'  put: 'Morph the currently selected subpane into a different type.';
            at: 'eventSummary' put: 'Launch window summarizing event usage in this ViewManager.';
            at: 'editTabbing' put: 'Edit subpane tabbing order and grouping of buttons.';
            at: 'pasteWindowBitmapToClipboard' put: 'Copy a bitmap of current view to the Windows clipboard.';
            at: 'testWindow' put: 'Launch an example of currently edited ViewManager.';

            at: 'View' put: 'View creation, removal, switching.';
            at: 'viewSwitchTo' put: 'Switch to another view in this ViewManager.';
            at: 'viewCreate' put: 'Create a new view in this ViewManager.';
            at: 'viewRemove' put: 'Remove a view from this ViewManager.';

            at: 'Align' put: 'Alignment commands.';
            at: 'alignLeft' put: 'Align selected panes along left sides.';
            at: 'alignTop' put: 'Align selected panes along tops.';
            at: 'alignRight' put: 'Align selected panes along right sides.';
            at: 'alignBottom' put: 'Align selected panes along bottoms.';
            at: 'alignCenterHorizontal' put: 'Align selected panes along their horizontal centers.';
            at: 'alignCenterVertical' put: 'Align selected panes along their vertical centers.';
            at: 'alignDistributeHorizontal' put: 'Distribute selected panes horizontally.';
            at: 'alignDistributeVertical' put: 'Distribute selected panes vertically.';

            at: 'Center' put: 'Centering selected panes.';
            at: 'Distribute' put: 'Distribute selected panes.';
            at: 'horizontal' put: 'Do horizontally.';
            at: 'vertical' put: 'Do vertically.';

            at: 'Move By Pixel' put: 'Nudge selection around by one pixel increments.';
            at: 'moveSelectionUp' put: 'Nudge selection up one pixel.';
            at: 'moveSelectionDown' put: 'Nudge selection down one pixel.';
            at: 'moveSelectionLeft' put: 'Nudge selection left one  pixel.';
            at: 'moveSelectionRight' put: 'Nudge selection right one pixel.';

            at: 'Size By Pixel' put: 'Size selection by one pixel increments.';
            at: 'sizeSelectionUp' put: 'Shrink selection''s height by one pixel.';
            at: 'sizeSelectionDown' put: 'Grow selection''s height by one pixel.';
            at: 'sizeSelectionLeft' put: 'Shrink selection''s width by one pixel.';
            at: 'sizeSelectionRight' put: 'Grow selection''s width by one pixel.';

            at: 'Size' put: 'Size subpanes or window, set window position.';
            at: 'autosize' put: 'Size selected subpanes according to predefined hints.';
            at: 'replicateWidth' put: 'Set width of selected subpanes to be the same.';
            at: 'replicateHeight' put: 'Set height of selected subpanes to be the same.';
            at: 'setWindowSize' put: 'Specify the size of the selected subpane or window, in pixels.';
            at: 'setWindowPosition' put: 'Specify initial launching position of the window.';

            at: 'Options' put: 'Set grid, window zooming, MDI editing.';
            at: 'setGridSize' put: 'Set the size of the snap-to grid, in pixels.';
            at: 'drawGrid' put: 'Toggle display of the grid.';
            at: 'setDrawGrid' put: 'Toggle display of the grid (right mouse click for quick access to grid sizes).';
            at: 'autoSave' put: 'Toggle prompting for saving before Test Window.';
            at: 'autoSizeToggle' put: 'Toggle autosizing of StaticText and Buttons as text is entered.';
            at: 'zoomLayout' put: 'Zoom/unzoom the layout area of WindowBuilder.';
            at: 'addInManager' put: 'Invoke the WindowBuilder Add-In Manager.';
            at: 'mdi' put: 'Edit MDI specific options of the currently edited ViewManager.';

            at: 'Scrapbook' put: 'Scrapbook commands.';
            at: 'scrapbookStore' put: 'Store the currently selected panes as a page in the scrapbook.';
            at: 'scrapbookRetrieve' put: 'Retrieve a page from the scrapbook.';
            at: 'scrapbookNew' put: 'Create a new scrapbook.';
            at: 'scrapbookLoad' put: 'Load a scrapbook from disk.';
            at: 'scrapbookMerge' put: 'Merge a scrapbook from disk with the current one.';
            at: 'scrapbookSave' put: 'Save the current scrapbook to disk.';
            at: 'Quick Reference' put: 'Retrieve a page from the Quick Reference list.';

            at: 'Add' put: 'Load cursor with controls.';
            at: 'Button' put: 'Load cursor with one of the buttons.';
            at: '3D Button' put: 'Load the cursor with one of the 3D buttons.';
            at: 'List' put: 'Load the cursor with one of the listboxes.';
            at: 'Valuator' put: 'Load the cursor with one of the valuators.';
            at: 'Text' put: 'Load the cursor with one of the text editors.';
            at: 'Group' put: 'Load the cursor with one of the groupboxes.';
            at: 'Misc' put: 'Load the cursor with one of the miscellaneous subpanes.';
            at: 'Composite' put: 'Load the cursor with one of the composite subpanes.';
            at: 'Custom Panes' put: 'Load the cursor with one of the user-defined subpanes.';
            at: 'addCustomPane' put: 'Add a new custom pane to the Custom Panes menu.';
            at: 'removeCustomPane' put: 'Remove a custom pane from the Custom Panes menu.';

            at: 'setFont:' put: 'Set the font of the selected pane(s).';
            at: 'setColor:' put: 'Set the color of the selected pane(s).';
            at: 'setFraming:' put: 'Set the framing parameters for the selected pane(s).';
            at: 'setMenu:' put: 'Create a menu for the selected pane(s).';
            at: 'other:' put: 'Invoke the attribute editor for the selected pane.'.
    ].

    ^HelpDict!

initMenu!
   
initProperties
    "Set up the Properties dictionary"
    Properties := IdentityDictionary new.

    self propertyAt: #GridSize put: 4@4.
    self propertyAt: #DrawGrid put: false.
    self propertyAt: #AutoSize put: true.
    self propertyAt: #InstVarNameCheck put: false.
    self propertyAt: #OpenMethodType put: #createViews.
    self propertyAt: #OpenMethodArgs put: #('self' 'self').
    self propertyAt: #OpenMethodInitCode put: nil.
    self propertyAt: #CodeGenerationHook put: nil.
    self propertyAt: #RecordCreatorInformation put: false.
    "Subclass WBCreateClassDialog to record additional information about class creation (e.g., ENVY)"
    self propertyAt: #WBCreateClassDialog put: WBCreateClassDialog.

    WBScratchWindow removeSelector: #createViews.
    WBDialogScratchWindow removeSelector: #createViews.
    WBScratchWindow removeSelector: #open.
    WBDialogScratchWindow removeSelector: #open.

    self clearWBClasses.

    "Install extra menus and icons"
    self installExtras.!
 
insertMenu: anArray after: menuNameString
    | menus target oc aString |
    menus := self wbMenus.
    aString := menuNameString stripMnemonic.
    oc := anArray asOrderedCollectionRecursively.
    target := menus detect: [ :m | (m at: 1) stripMnemonic = aString ] ifNone: [nil].
    target isNil
        ifFalse: [
            ^menus add: oc after: target].
    menus do: [ :menu |
        (menu at: 3) do: [ :mi |
            mi isSymbol ifFalse: [
                (mi at: 1) stripMnemonic = aString ifTrue: [
                    ^(menu at: 3) add: oc after: mi ].
                (mi at: 3) isString ifFalse: [
                    (mi at: 3) do: [ :msi |
                        msi isSymbol ifFalse: [
                            (msi at: 1) stripMnemonic = aString ifTrue: [
                                ^(mi at: 3) add: oc after: msi ]]]]]]]!
 
insertMenu: anArray before: menuNameString
    | menus target oc aString |
    menus := self wbMenus.
    aString := menuNameString stripMnemonic.
    oc := anArray asOrderedCollectionRecursively.
    target := menus detect: [ :m | (m at: 1) stripMnemonic = aString ] ifNone: [nil].
    target isNil
        ifFalse: [
            ^menus add: oc before: target].
    menus do: [ :menu |
        (menu at: 3) do: [ :mi |
            mi isSymbol ifFalse: [
                (mi at: 1) stripMnemonic = aString ifTrue: [
                    ^(menu at: 3) add: oc before: mi ].
                (mi at: 3) isString ifFalse: [
                    (mi at: 3) do: [ :msi |
                        msi isSymbol ifFalse: [
                            (msi at: 1) stripMnemonic = aString ifTrue: [
                                ^(mi at: 3) add: oc before: msi ]]]]]]]!
 
installCode: anArray
    self
        createMethod: anArray convertBytesToString
        in: self
        loggingSource: false!
 
installExtras
    self extras do: [ :slot |
        slot do: [ :extra |
            extra perform ]]!

isWBInternalClass

    ^true!
 
labelName
    ^'WindowBuilder Pro'!

launchBitmapManager

    (Smalltalk at: #CPBitmapManager) new open!
   
listAddIns
    | list class |
    list := OrderedCollection new.
    class := self.
    [ class name = 'ViewManager' ] whileFalse: [
        list addAll: (class class methodDictionary keys asSortedCollection select: [ :selector |
            selector beginsWith: 'addIn' ]).
        class := class superclass
    ].
    ^list!
 
menuName
    ^'&',self labelName!
  
newDialogWindowBuilder
    PWindowBuilder preOpen.
    PWindowBuilder new openDialog.!

newWindowBuilder
    PWindowBuilder preOpen.
    PWindowBuilder new open.!

openMethodArgs
    ^self propertyAt: #OpenMethodArgs!
  
openMethodInitCode
    ^self propertyAt: #OpenMethodInitCode!
  
openMethodType
    ^self propertyAt: #OpenMethodType!
  
preOpen!

properties

    ^Properties!
  
propertyAt: aSymbol

    Properties isNil ifTrue: [ self initProperties ].
    ^Properties at: aSymbol ifAbsent: [ nil ]!

propertyAt: aSymbol put: anObject

    Properties isNil ifTrue: [ self initProperties ].
    Properties at: aSymbol put: anObject!
   
purgeCustomPanes

    " WindowBuilder purgeCustomPanes  "

    WBClasses := nil.
    CustomPanes := OrderedCollection new.!

recordCreatorInformation
    ^self propertyAt: #RecordCreatorInformation!
  
register: extraName menu: anArray after: aString
    | slot |
    slot := self extras at: extraName ifAbsent: [ OrderedCollection new ].
    slot add:
        (Message new
            receiver: PWindowBuilder
            selector: #insertMenu:after:
            arguments: (Array with: anArray with: aString)).
    self extras at: extraName put: slot.!

register: extraName menu: anArray before: aString
    | slot |
    slot := self extras at: extraName ifAbsent: [ OrderedCollection new ].
    slot add:
        (Message new
            receiver: PWindowBuilder
            selector: #insertMenu:before:
            arguments: (Array with: anArray with: aString)).
    self extras at: extraName put: slot.!
  
register: extraName propertyAt: aSymbol put: anObject
    | slot |
    slot := self extras at: extraName ifAbsent: [ OrderedCollection new ].
    slot add:
        (Message new
            receiver: PWindowBuilder
            selector: #propertyAt:put:
            arguments: (Array with: aSymbol with: anObject)).
    self extras at: extraName put: slot.!

register: extraName removeMenu: aString
    | slot |
    slot := self extras at: extraName ifAbsent: [ OrderedCollection new ].
    slot add:
        (Message new
            receiver: PWindowBuilder
            selector: #removeMenu:
            arguments: (Array with: aString)).
    self extras at: extraName put: slot.!
 
removeExtra: extraName

    self extras removeKey: extraName ifAbsent: [ nil ]!
   
removeMenu: aString
    | menus target  |
    menus := self wbMenus.
    target := menus detect: [ :m | (m at: 1) = aString ] ifNone: [nil].
    target isNil
        ifFalse: [
            ^menus remove: target ifAbsent: [ nil ]].
    menus do: [ :menu |
        (menu at: 3) do: [ :mi |
            mi isSymbol ifFalse: [
                (mi at: 1) = aString ifTrue: [
                    ^(menu at: 3) remove: mi ifAbsent: [ nil ]].
                (mi at: 3) isString ifFalse: [
                    (mi at: 3) do: [ :msi |
                        msi isSymbol ifFalse: [
                            (msi at: 1) = aString ifTrue: [
                                ^(mi at: 3) remove: msi ifAbsent: [ nil ]]]]]]]]!
 
reset

    InterfaceObject purgeCache.

    WBRealLayoutPane resetBitmap.

    "Set up Properties dictionary and install extras"
    self initProperties.

    CursorManager initialize.

    (Transcript menuWindow menuTitled: self labelName) isNil ifTrue: [
        PWindowBuilder addWindowBuilderMenuHelpItems.
        Transcript menuWindow addMenu:
            PWindowBuilder windowBuilderMenu.
    ].

    self updateForMDI.!

scrapbook
    Scrapbook isNil
        ifTrue: [
            Scrapbook := Dictionary new.
            Scrapbook at: 'Quick Reference' put: Dictionary new].
    ^Scrapbook!
 
scrapbook: aScrapbook

    Scrapbook := aScrapbook!
   
scrapbookLoadFile: aFileName

    (Smalltalk includesKey: #ObjectFiler) ifTrue: [
        self scrapbook: ((Smalltalk at: #ObjectFiler) loadFromPathName: aFileName)
    ].!

screenIcon

    | dir |

    WBIcon isNil ifTrue: [
        (Smalltalk includesKey: #CPSrcDir) ifTrue: [
            dir := (Smalltalk at: #CPSrcDir).
        ] ifFalse: [
            dir := ''.
        ].
        WBIcon := Icon fromFile: dir, 'wb.ico'.
    ].

    ^WBIcon!
 
secondArg
    | arg |
    arg := self openMethodArgs at: 2.
    ^(arg isNil or: [ arg isString not ])
        ifTrue: [ 'self' ]
        ifFalse: [ arg asString ]!

set

    Smalltalk at: #WindowBuilderVersion put:  'Version 1.0.5\Windows' withCrs.
    Smalltalk at: #PWindowBuilder put: WindowBuilder.
    WBClasses := nil.
    self initProperties.!
  
startup

    CursorManager initialize.

    "Force caches to be set up for path independence"
    self screenIcon.

    WBRealLayoutPane initWinConstants.

    self reset.!
   
toolBarTool

    ToolbarTool isNil ifTrue: [
        ToolbarTool :=  (Smalltalk at: #Tool) new fromBitmap: (CPBitmapDict sysAt:  'windowBuilderToolbarBitmap').
        ToolbarTool
            selector: #newWindowBuilder;
            owner: PWindowBuilder;
            name: 'WindowBuilder Tool';
            space: 11.
    ].

    ^ToolbarTool!
 
updateForMDI

    self
        addToolbarTool;
        addWindowBuilderMenuHelpItems.!
  
wbCreateClassDialog
    ^self propertyAt: #WBCreateClassDialog!

wbDefaultFont

    | defaultFont |
    defaultFont := self propertyAt: #WBDefaultFont.
    defaultFont isNil
        ifTrue: [
            defaultFont := Font fromStockFont: SystemFont.
            self propertyAt: #WBDefaultFont put: defaultFont].
    ^defaultFont!
  
wbMenuArray

^#(
    ('&File' nil
        (
            ('&New Window	Ctrl+N' createNew 'Ctrl+N')
            ('New &Dialog' createNewDialog '')
            ('&Open...	Ctrl+O' openNew 'Ctrl+O')
            separator
            ('&Composite Panes' nil
                (
                    ('&New' createNewCompositePane '')
                    ('&Open...' openNewComposite '')
                    separator
                    ('&Create...' createNewComposite '')
                    ('&Ungroup' ungroupComposite '')
                ))
            separator
            ('&Save	Ctrl+S' save 'Ctrl+S')
            ('Save &As...	' saveAs '')
            ('Save As De&fault	' saveAsDefault '')
            separator
            ('&Edit ViewManager Code...	Ctrl+E' editAppCode 'Ctrl+E')
            ('E&xit	Ctrl+Q' close 'Ctrl+Q')
        ))
    ('&Edit' nil
        (
            ('&Undo	Ctrl+Z' undo 'Ctrl+Z')
             separator
            ('Cu&t	Ctrl+X' cut 'Ctrl+X')
            ('&Copy	Ctrl+C' copy 'Ctrl+C')
            ('&Paste	Ctrl+V' paste 'Ctrl+V')
            ('Cl&ear	Ctrl+Delete' clear 'Ctrl+27')
            ('&Select All	Ctrl+/' selectAll 'Ctrl+/')
            separator
            ('&Bring To Front	Ctrl+F' bringToFront 'Ctrl+F')
            ('Send To B&ack	Ctrl+B' sendToBack 'Ctrl+B')
            ('&Duplicate	Ctrl+D' duplicate 'Ctrl+D')
            ('&Morph...	Ctrl+M' mutate 'Ctrl+M')
            separator
            ('E&vent Summary...	Ctrl+R' eventSummary 'Ctrl+R')
            ('Edit Tabbing/&Groups...    	Ctrl+G' editTabbing 'Ctrl+G')
            ('Paste W&indow Bitmap to Clipboard	' pasteWindowBitmapToClipboard '')
            ('Test &Window	Ctrl+T' testWindow 'Ctrl+T')
        ))
    "('&View' nil
        (
            ('&Switch To...	' viewSwitchTo '')
            ('&Create...	' viewCreate '')
            ('&Remove...	' viewRemove '')
        ))"
    ('&Align' nil
        (
            ('&Left	Ctrl+Shift+L' alignLeft 'ShiftCtrl+L')
            ('&Top	Ctrl+Shift+T' alignTop 'ShiftCtrl+T')
            ('&Right	Ctrl+Shift+R' alignRight 'ShiftCtrl+R')
            ('&Bottom	Ctrl+Shift+B' alignBottom 'ShiftCtrl+B')
            ('&Center' center:
                (
                    ('&Horizontally	Ctrl+Shift+C' horizontal 'ShiftCtrl+C')
                    ('&Vertically	Ctrl+Alt+Shift+C' vertical 'AltShiftCtrl+C')
                ))
            ('&Distribute' distribute:
                (
                    ('&Horizontally	Ctrl+Shift+D' horizontal 'ShiftCtrl+D')
                    ('&Vertically	Ctrl+Alt+Shift+D' vertical 'AltShiftCtrl+D')
                ))
            separator
            ('&Move By Pixel' doByPixel:
                (
                    ('&Up	Ctrl+Up' moveSelectionUp 'Ctrl+22')
                    ('&Down	Ctrl+Down' moveSelectionDown 'Ctrl+24')
                    ('&Left	Ctrl+Left' moveSelectionLeft 'Ctrl+21')
                    ('&Right	Ctrl+Right' moveSelectionRight 'Ctrl+23')
                ))
            ('&Size By Pixel' doByPixel:
                (
                    ('&Up	Ctrl+Shift+Up' sizeSelectionUp 'ShiftCtrl+22')
                    ('&Down	Ctrl+Shift+Down' sizeSelectionDown 'ShiftCtrl+24')
                    ('&Left	Ctrl+Shift+Left' sizeSelectionLeft 'ShiftCtrl+21')
                    ('&Right	Ctrl+Shift+Right' sizeSelectionRight 'ShiftCtrl+23')
                ))
        ))
    ('&Size' nil
        (
            ('&Auto Size Selection	Ctrl+Shift+A' autosize 'ShiftCtrl+A')
            separator
            ('Replicate &Width	Ctrl+Shift+W' replicateWidth 'ShiftCtrl+W')
            ('Replicate &Height	Ctrl+Shift+H' replicateHeight 'ShiftCtrl+H')
            separator
            ('&Set Window Size...	' setWindowSize '')
            ('Set Window &Position...	' setWindowPosition '')
        ))
    ('&Options' nil
        (
            ('&Grid Size...' setGridSize '')
            ('&Draw Grid' setDrawGrid '')
            separator
            ('&Auto Save' autoSave '')
            ('&Auto Size' autoSizeToggle '')
            ('&Zoom Layout	Alt+Z' zoomLayout 'Alt+Z')
            separator
            ('Add-&In Manager...' addInManager '')
        ))
    ('&Scrapbook' nil
        (
            ('&Store...' scrapbookStore '')
            ('&Retrieve...' scrapbookRetrieve '')
            separator
            ('&New' scrapbookNew '')
            ('&Load...' scrapbookLoad '')
            ('&Merge...' scrapbookMerge '')
            ('Sa&ve...' scrapbookSave '')
            separator
            ('&Quick Reference' scrapbookQuickReference: ())
        ))
    ('A~dd' nil
        (
            ('~Text' add:
                (
                    ('~StaticText' 'StaticText' '')
                    ('~EntryField' 'EntryField' '')
                    ('EnhancedEntry~Field' 'EnhancedEntryField' '')
                    ('~TextEdit' 'TextEdit' '')
                    ('Text~Pane' 'TextPane' '')
                ))
            ('~Button' add:
                (
                    ('~Button' 'Button' '')
                    ('~DrawnButton' 'DrawnButton' '')
                    ('~RadioButton' 'RadioButton' '')
                    ('~CheckBox' 'CheckBox' '')
                    ('~ThreeStateButton' 'ThreeStateButton' '')
                    ('~LinkButton' 'LinkButton' '')
                    ('~ActionButton' 'ActionButton' '')
                ))
            ('~List' add:
                (
                    ('~ListBox' 'ListBox' '')
                    ('List~Pane' 'ListPane' '')
                    ('~MultipleSelectListBox' 'MultipleSelectListBox' '')
                    ('~ComboBox' 'ComboBox' '')
                ))
            ('~Valuator' add:
                (
                    ('~Horizontal Scroll Bar' 'WBHorizontalScrollBar' '')
                    ('~Vertical Scroll Bar' 'WBVerticalScrollBar' '')
                ))
            ('~Group' add:
                (
                    ('~GroupBox' 'GroupBox' '')
                    ('~StaticBox' 'StaticBox' '')
                ))
            ('~Misc' add:
                (
                    ('~StaticGraphic' 'CPStaticGraphic' '')
                    ('~GraphPane' 'GraphPane' '')
                    ('~AnimationPane' 'AnimationPane' '')
                    ('~WBToolBar' 'WBToolBar' '')
                    ('Status~Pane' 'StatusPane' '')
                ))
            ('~Composite' add:
                (
                    ('~RadioButtonGroup' 'RadioButtonGroup' '')
                    ('~CheckBoxGroup' 'CheckBoxGroup' '')
                    ('~EntryFieldGroup' 'EntryFieldGroup' '')
                    ('~SexPane' 'SexPane' '')
                ))
            separator
            ('&Custom Panes' add: ())
            ('~Add Custom Pane...' addCustomPane '')
            ('~Remove Custom Pane...' removeCustomPane '')
        ))
    )!
   
wbMenus
    | menus |
    menus := self propertyAt: #WBMenus.
    menus isNil
        ifTrue: [
            menus := self wbMenuArray asOrderedCollectionRecursively.
            self propertyAt: #WBMenus put: menus ].
    ^menus!

windowBuilderMenu

    | menu menuName |

    menuName := PWindowBuilder menuName.
    menu := Menu new.
    menu
        owner: PWindowBuilder;
        title: menuName;
        appendItem: 'New ~Window	Ctrl+W' selector: #newWindowBuilder accelKey: $w accelBits: AfControl | AfChar;
        appendItem: 'New ~Dialog	Ctrl+L' selector: #newDialogWindowBuilder accelKey: $l accelBits: AfControl | AfChar;
        appendItem: '~Edit Window...	Ctrl+E' selector: #editWindow accelKey: $e accelBits: AfControl | AfChar;
        appendSeparator.

    (Smalltalk includesKey: #CPBitmapManager) ifTrue: [
        menu
            appendItem: 'Launch ~BitmapManager	Ctrl+B' selector: #launchBitmapManager accelKey: $b accelBits: AfControl | AfChar;
            appendSeparator.
    ].

    menu
        appendItem: '~About ',menuName,'...' selector: #aboutWB.

    ^menu! !



!WindowBuilder methods !
   
aboutWB

    WBAboutDialog new open!
  
activateClassBrowserOnClass:  aClass

    | chb |

    chb := Notifier windows values detect: [:w |
        w isApplicationWindow and: [
             (w owner isWBClassBrowser) and: [
                w owner selectedClass == aClass
            ].
        ].
    ] ifNone: [ nil ].

    chb notNil ifTrue: [
        chb := chb owner.

        "Make sure the open method gets refreshed"

        chb mainView minimized ifTrue: [
            UserLibrary openIcon: chb mainView asParameter
        ] ifFalse: [
            chb mainView bringToTop.
        ].

       (chb textModified) ifFalse: [
            chb
                changed: #selectors:
                with: #restoreSelected:
                with: chb selectedMethod;
                changed: #text:.
        ].
        ^self
    ].

    ^nil!

activated: ignore

    (self mainView isHandleOk) ifFalse: [
        ^self
    ].

    self drawGrid ifTrue: [
        (self menuTitled: 'Options') checkItem: #setDrawGrid.
    ] ifFalse: [
        (self menuTitled: 'Options') uncheckItem: #setDrawGrid.
    ].!
 
add: paneName

    | addPane className message |

    className := paneName reject: [ :c | c = $~ ].

    className = 'ArrowTool' ifTrue: [
        ^mainPane loadCursor: nil
    ].

    (Smalltalk includesKey: className asSymbol) ifFalse: [
        ^MessageBox messageNote: 'The class ', className, ' is not in this image.  You must file it in first.'
    ].
    className = editedClass name ifTrue: [
        ^MessageBox messageNote: 'You cannot add ',className,' to itself. This would result in infinite recursion.'
    ].

    addPane := (mainPane pseudoClassFor: className) exampleFrom: className.
    addPane isComposite & mainPane editedPane isDialog ifTrue: [
        MessageBox messageNote:
        'Sorry. WindowDialogs do not support nested tabbing within children (including GroupPanes and CompositePanes). Create your window as a subclass of WBWindowDialog instead.'
    ].

    mainPane loadCursor: addPane.!

addCustomPane

    | newPaneClass aName |

    (newPaneClass :=  (WBChoosePaneDialog new classList:
        (SubPane allSubclasses reject: [ :c | c isWBInternalClass ])) result) isNil ifTrue: [
        ^self
    ].

    (self customPanes includes: newPaneClass name) ifFalse: [
        aName := newPaneClass name.
        self customPanes add: aName.
        customSubMenu
            insertItemDynamically: aName
            selector: aName
            atIndex: customSubMenu numberOfItems + 1.
    ].

    self updateRemoveCustomPane.

    self add: newPaneClass name!
  
addInManager

    WBAddInManager new open!

alignBottom

    mainPane alignBottom.!
   
alignCenterHorizontal

    mainPane alignCenterHorizontal.!
   
alignCenterVertical

    mainPane alignCenterVertical.!
   
alignDistributeHorizontal

    mainPane alignDistributeHorizontal.!
   
alignDistributeVertical

    mainPane alignDistributeVertical.!
   
alignLeft

    mainPane alignLeft!

alignRight

    mainPane alignRight.!
 
alignTop

    mainPane alignTop.!
 
attributesHaveChanged

    mainPane
        hideSelectionDots;
        disableSelectionDots.

    thePane isFrameObject ifTrue: [
        mainPane
            hideSizeDot;
            hideWindow;
            reframeAll;
            showWindow.
    ] ifFalse: [
        mainPane redisplaySelection.
    ].

    mainPane
        enableSelectionDots;
        showSelectionDots.

    thePane isFrameObject ifTrue: [
        mainPane
            showSizeDot.
    ].

    self mainPaneChanged: true.!
 
autoSave

    autoSave ifTrue: [
        (self menuTitled: 'Options') uncheckItem: #autoSave.
    ] ifFalse: [
        (self menuTitled: 'Options') checkItem: #autoSave.
    ].

    autoSave := autoSave not.!

autoSize
    | autoSize |
    "Get AutoSize property from WindowBuilder"
    autoSize := self class propertyAt: #AutoSize.
    autoSize isNil ifTrue: [ self autoSize: false ].
    ^autoSize!
 
autosize

    mainPane autosizeSelection.
    self updateSizeAndPosition.!
   
autoSize: bool
    "Store into AutoSize property of WindowBuilder"
    self class propertyAt: #AutoSize put: bool.!
   
autoSizeMenu

    self autoSize ifFalse: [
        (self menuTitled: 'Options') uncheckItem: #autoSizeToggle.
    ] ifTrue: [
        (self menuTitled: 'Options') checkItem: #autoSizeToggle.
    ].!

autoSizeToggle

    self autoSize: self autoSize not.
    self autoSizeMenu.!

bringToFront

    mainPane bringToFront!
  
buildMenus
    "Build WindowBuilder's menu bar"
    | menus mw aMenu aSubMenu |
    menus := self class wbMenus.
    mw := self mainView menuWindow.
    menus do: [ :m |
        aMenu := Menu new.
        aMenu
            title: (m at: 1);
            owner: self.
        (m at: 3) do: [ :mi |
            mi == #separator
                ifTrue: [ aMenu appendSeparator ]
                ifFalse: [
                    (mi at: 3) isString
                        ifTrue: [
                            aMenu
                                appendItem: (mi at: 1)
                                selector: (mi at: 2)
                                acceleratorString: (mi at: 3)]
                        ifFalse: [
                            aSubMenu := Menu new.
                            aSubMenu
                                title: (mi at: 1);
                                owner: self.
                            (mi at: 2) isNil
                                ifFalse: [ aSubMenu selector: (mi at: 2)].
                            (mi at: 3) do: [ :msi |
                                msi == #separator
                                    ifTrue: [ aSubMenu appendSeparator ]
                                    ifFalse: [
                                        aSubMenu
                                            appendItem: (msi at: 1)
                                            selector: (msi at: 2)
                                            acceleratorString: (msi at: 3)]].
                            aMenu
                                appendSubMenu: aSubMenu]]].
        mw addMenu: aMenu]!

center: horizOrVert

    (horizOrVert first = $h) ifTrue: [
        mainPane alignCenterHorizontal.
    ] ifFalse: [
        mainPane alignCenterVertical.
    ].!

changed

    ^changed!

changed: bool

    changed := bool.!
  
checkIfSaveChanges: title

    | result |

    (self changed) ifTrue: [
        result := MessageBox yesNoCancelTitled: title text: 'Save changes before proceeding?'.
        (result isNil) ifTrue: [
            ^false
        ].

        (result == #yes) ifTrue: [
            self save isNil ifTrue: [
                ^false
            ].
        ].
    ].

    ^true!

clear

    mainPane clear!

close

    (self checkIfSaveChanges: 'Exiting WindowBuilder') ifFalse: [
        ^self
    ].
    self mainView parent isNil ifFalse: [
        self mainView parent isMDIClient ifFalse: [
            self mainView parent mainView bringToTop
        ].
    ].
   super close.!
   
close: ignore

    "Detect that Smalltalk is shutting down. Prevent our
     Save Changes query from coming up at shutdown. "
    Transcript isNil ifTrue: [
        ^nil
    ].

    (self checkIfSaveChanges: 'Exiting WindowBuilder') ifFalse: [
        ^self
    ].
    self mainView parent isNil ifFalse: [
        self mainView parent isMDIClient ifFalse: [
            self mainView parent mainView bringToTop
        ].
    ].

    ^nil!
   
copy

    self enable: #(paste) inMenu: 'Edit'.
    mainPane copy!
   
createNew

    (self checkIfSaveChanges: 'New Window') ifTrue: [
        WBScratchWindow resetToDefault.
        self editClass: WBScratchWindow.
    ].!
  
createNewComposite

    self copy.
    PWindowBuilder new newCompositePaneFrom: self!

createNewCompositePane

    (self checkIfSaveChanges: 'New Composite Pane') ifTrue: [
        WBCompositePaneScratchWindow resetToDefault.
        self editClass: WBCompositePaneScratchWindow.
    ].!
   
createNewDialog

    (self checkIfSaveChanges: 'New Dialog') ifTrue: [
        WBDialogScratchWindow resetToDefault.
        self editClass: WBDialogScratchWindow.
    ].!

createViews

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'WindowBuilder: [Untitled]';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 1426 @ 904; xC; yC; cRDU: (9 @ 896 rightBottom: 1417 @ 46));
            pStyle: #(sysmenu minimize maximize sizable titlebar);
            when: #close perform: #close:;
            when: #activate perform: #activated:;
            backColor: ClrPalegray;
            addSubpane: (
                WB3DFrame new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 1408 @ 36; lDU: 0 r: #left; rDU: 0 r: #right; tDU: 36 r: #bottom; bDU: 0 r: #bottom);
                    startGroup;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                WB3DFrame new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 169 @ 44; lDU: 178 r: #right; rDU: 9 r: #right; tDU: 194 r: #bottom; bDU: 150 r: #bottom);
                    startGroup;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                WB3DFrame new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 169 @ 44; lDU: 352 r: #right; rDU: 183 r: #right; tDU: 194 r: #bottom; bDU: 150 r: #bottom);
                    startGroup;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                StaticBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 1408 @ 2; lDU: 0 r: #left; rDU: 0 r: #right; tDU: 38 r: #bottom; bDU: 36 r: #bottom);
                    blackFrame;
                    startGroup;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                StaticBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 2 @ 760; lDU: 142 r: #left; rDU: 144 r: #left; tDU: 52 r: #top; bDU: 38 r: #bottom);
                    blackFrame;
                    startGroup;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 101 @ 32; lDU: 151 r: #left; rDU: 251 r: #left; tDU: 134 r: #bottom; bDU: 102 r: #bottom);
                    paneName: 'styleText';
                    rightJustified;
                    startGroup;
                    contents: 'Style:';
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 101 @ 32; lDU: 151 r: #left; rDU: 251 r: #left; tDU: 86 r: #bottom; bDU: 54 r: #bottom);
                    paneName: 'nameText';
                    rightJustified;
                    startGroup;
                    contents: 'Name:';
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 128 @ 32; rDU: 489 r: #right; bDU: 102 r: #bottom);
                    paneName: 'whenText';
                    rightJustified;
                    startGroup;
                    contents: 'When:';
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 128 @ 32; rDU: 489 r: #right; bDU: 50 r: #bottom);
                    paneName: 'performText';
                    rightJustified;
                    startGroup;
                    contents: 'Perform:';
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 91 @ 32; lDU: 160 r: #left; rDU: 251 r: #left; tDU: 186 r: #bottom; bDU: 154 r: #bottom);
                    paneName: 'titleText';
                    rightJustified;
                    startGroup;
                    contents: 'Text:';
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                WBToolBar new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 286 @ 44; lDU: 640 r: #right; rDU: 354 r: #right; tDU: 194 r: #bottom; bDU: 150 r: #bottom);
                    paneName: 'attributePalette';
                    useSystem: true;
                    add: #setFont:;
                    add: #setColor:;
                    add: #setFraming:;
                    add: #setMenu:;
                    add: #other:;
                    postAutomatic;
                    startGroup;
                    when: #showHelp perform: #paletteHelp:;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                WBMultiToolPalette new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 69 @ 688; lDU: 73 r: #left; rDU: 142 r: #left; tDU: 60 r: #top; bDU: 102 r: #bottom);
                    paneName: 'toolPalette';
                    startGroup;
                    when: #gettingFocus perform: #resetFocus:;
                    when: #select perform: #newTool:;
                    when: #selecting perform: #newToolMessage:;
                    when: #doubleClick perform: #placeCentered:;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                WBToolPalette new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 69 @ 688; lDU: 5 r: #left; rDU: 73 r: #left; tDU: 60 r: #top; bDU: 102 r: #bottom);
                    paneName: 'groupPalette';
                    startGroup;
                    when: #gettingFocus perform: #resetFocus:;
                    when: #selecting perform: #newPaneType:;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                WBToolBar new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 1408 @ 44; lDU: 0 r: #left; rDU: 0 r: #right; tDU: 4 r: #top);
                    paneName: 'toolBar';
                    useSystem: true;
                    add: #testWindow spaces: 3;
                    add: #createNew spaces: 4;
                    add: #createNewDialog;
                    add: #openNew;
                    add: #save;
                    add: #cut spaces: 4;
                    add: #copy;
                    add: #paste;
                    add: #clear;
                    add: #sendToBack spaces: 4;
                    add: #bringToFront;
                    add: #duplicate;
                    add: #autosize spaces: 4;
                    add: #replicateWidth;
                    add: #replicateHeight;
                    add: #alignLeft spaces: 4;
                    add: #alignCenterHorizontal;
                    add: #alignRight;
                    add: #alignTop spaces: 2;
                    add: #alignCenterVertical;
                    add: #alignBottom;
                    add: #alignDistributeVertical spaces: 2;
                    add: #alignDistributeHorizontal;
                    add: #setDrawGrid spaces: 4 rbSelector: #popupGridSize:;
                    postAutomatic;
                    startGroup;
                    when: #showHelp perform: #paletteHelp:;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                DrawnButton new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 37 @ 32; lDU: 347 r: #right; rDU: 311 r: #right; tDU: 190 r: #bottom; bDU: 158 r: #bottom);
                    paneName: 'positionButton';
                    startGroup;
                    when: #clicked perform: #setWindowPosition:;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 110 @ 28; lDU: 302 r: #right; rDU: 192 r: #right; tDU: 182 r: #bottom; bDU: 154 r: #bottom);
                    paneName: 'position';
                    startGroup;
                    contents: '0, 0';
                    foreColor: ClrBlack;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                DrawnButton new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 37 @ 32; lDU: 174 r: #right; rDU: 137 r: #right; tDU: 190 r: #bottom; bDU: 158 r: #bottom);
                    paneName: 'sizeButton';
                    startGroup;
                    when: #clicked perform: #setWindowSize:;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 110 @ 28; lDU: 128 r: #right; rDU: 18 r: #right; tDU: 182 r: #bottom; bDU: 154 r: #bottom);
                    paneName: 'size';
                    startGroup;
                    contents: '0 x 0';
                    foreColor: ClrBlack;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                StaticBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 142 @ 2; lDU: 0 r: #left; rDU: 142 r: #left; tDU: 52 r: #top; bDU: 54 r: #top);
                    blackFrame;
                    startGroup;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                WBToolBar new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 133 @ 56; lDU: 5 r: #left; rDU: 137 r: #left; tDU: 98 r: #bottom; bDU: 42 r: #bottom);
                    paneName: 'editPalette';
                    useSystem: true;
                    add: #editAppCode;
                    add: #editTabbing spaces: 3;
                    postAutomatic;
                    startGroup;
                    when: #showHelp perform: #paletteHelp:;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 1390 @ 28; lDU: 9 r: #left; rDU: 9 r: #right; tDU: 32 r: #bottom; bDU: 4 r: #bottom);
                    paneName: 'status';
                    startGroup;
                    contents: '';
                    foreColor: ClrBlack;
                    backColor: ClrPalegray;
                    yourself
            );
            addSubpane: (
                WBScrollingPane new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 1266 @ 600; lDU: 142 r: #left; rDU: 0 r: #right; tDU: 52 r: #top; bDU: 198 r: #bottom);
                    paneName: 'scrollingPane';
                    startGroup;
                    foreColor: ClrWhite;
                    backColor: ClrWhite;
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 489 @ 48; lDU: 261 r: #left; rDU: 658 r: #right; tDU: 194 r: #bottom; bDU: 146 r: #bottom; indent: 3 @ 4);
                    paneName: 'titleEditor';
                    startGroup;
                    tabStop;
                    when: #textChanged perform: #textChanged:;
                    foreColor: ClrBlack;
                    backColor: ClrWhite;
                    yourself
            );
            addSubpane: (
                WBComboBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 489 @ 184; lDU: 261 r: #left; rDU: 658 r: #right; tDU: 142 r: #bottom);
                    paneName: 'styleEditor';
                    dropDownList;
                    startGroup;
                    tabStop;
                    when: #select perform: #setStyle:;
                    backColor: ClrWhite;
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 489 @ 48; lDU: 261 r: #left; rDU: 658 r: #right; tDU: 90 r: #bottom; bDU: 42 r: #bottom; indent: 3 @ 4);
                    paneName: 'instVar';
                    startGroup;
                    tabStop;
                    when: #textChanged perform: #symbolNameChanged:;
                    backColor: ClrWhite;
                    yourself
            );
            addSubpane: (
                WBComboBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 471 @ 244; lDU: 480 r: #right; rDU: 9 r: #right; tDU: 142 r: #bottom);
                    paneName: 'when';
                    dropDownList;
                    startGroup;
                    tabStop;
                    when: #select perform: #when:;
                    backColor: ClrWhite;
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 471 @ 48; lDU: 480 r: #right; rDU: 9 r: #right; tDU: 90 r: #bottom; bDU: 42 r: #bottom; indent: 3 @ 4);
                    paneName: 'perform';
                    startGroup;
                    tabStop;
                    when: #textChanged perform: #performTextChanged:;
                    backColor: ClrWhite;
                    yourself
            );
        yourself
    ).!
  
currentEvent

    | event |

    event := currentWhen.
    event isNil ifTrue: [ ^nil ].
    (event at: 1) = $* ifTrue: [
        event := event copyFrom: 2 to: event size.
    ].

    ^event asSymbol!
 
customPanes

    CustomPanes isNil ifTrue: [
        CustomPanes := SortedCollection new.
    ].

    ^CustomPanes!
   
cut

    self enable: #(paste) inMenu: 'Edit'.
    mainPane cut!
 
declareMethod: aMethodName commentString: commentString

    | methodStream result resultString |

    methodStream := ReadWriteStream on: String new.

    methodStream
        nextPutAll: (self methodHeaderFor: aMethodName); cr; cr;
        nextPutAll: '    "', commentString; cr;
        nextPutAll: '     (Generated by WindowBuilder)"'.

    resultString := methodStream contents.

    "Consolidate all code creation"
    PWindowBuilder
        createMethod: resultString
        in: editedClass
        loggingSource: true!

disable: aCollection inMenu: aString
    | menu |
    menu := self menuTitled: aString.
    menu isNil ifTrue: [ menu := self mainView menuWindow wbMenuTitled: aString ].
    aCollection do: [ :item |
        menu disableItem: item.
        toolBar disableItem: item ].!

distribute: horizOrVert

    (horizOrVert first = $h) ifTrue: [
        mainPane alignDistributeHorizontal.
    ] ifFalse: [
        mainPane alignDistributeVertical.
    ].!

doByPixel: selector

    mainPane doByPixel: selector.!
   
drawGrid
    | drawGrid |
    "Get DrawGrid property from WindowBuilder"
    drawGrid := self class propertyAt: #DrawGrid.
    drawGrid isNil ifTrue: [ self drawGrid: false ].
    ^drawGrid!
 
drawGrid: bool
    "Store into DrawGrid property of WindowBuilder"
    self class propertyAt: #DrawGrid put: bool.
    mainPane display.!

duplicate

    mainPane duplicate!

editAppCode

    editedClass isScratchWindow
        ifTrue: [ self saveAs isNil ifTrue: [ ^nil ]].

    self tryToSaveChanges.

    (self activateClassBrowserOnClass: editedClass) isNil ifTrue: [
        ClassHierarchyBrowser new openSelecting: editedClass.
    ].!
 
editClass: aTopPaneClass

    "The windows are built.  Set this thing up to edit a new class (either at start or in open...)."

    | editedPane temp |

    editedClass := aTopPaneClass.

    self labelWithoutPrefix: self label.

    (editedClass isScratchWindow) ifTrue: [
        cleanedOutCode := false.
        editedPane := mainPane editClass: editedClass defaultClass.
        self disable: #(editAppCode) inMenu: 'File'.
    ] ifFalse: [
        temp := mainPane editClass: editedClass.
        temp isNil ifTrue: [
            WBScratchWindow resetToDefault.
            self editClass: WBScratchWindow.
            ^nil
        ].
        editedPane := temp.
        self enable: #(editAppCode) inMenu: 'File'.
    ].

    "(self menuTitled: 'View') disableAll.
    (editedPane isDialog or: [editedPane isCompositePane]) ifFalse: [
        (mainPane views size = 1) ifTrue: [
            (self menuTitled: 'View') enableItem: #viewCreate.
        ] ifFalse: [
            (self menuTitled: 'View') enableAll.
        ].
    ]."

    "editedPane isDialog ifTrue: [
        self enable: #(exportToResFile) inMenu: 'File'.
    ] ifFalse: [
        self disable: #(exportToResFile) inMenu: 'File'.
    ]."

    self reinitWindowBuilder.

    "Check if clipboard is an object pasteable (is that a word?) for us"
    ((mainPane clipboard isArray) not or: [ mainPane clipboard size ~= 2 ]) ifTrue: [
        self disable: #(paste) inMenu: 'Edit'.
    ].

    self sendInputEvent: #changed:  with: false.

    self disable: #(save) inMenu: 'File'.
    self disable: #(createNewComposite ungroupComposite) inMenu: 'Composite Panes'.
    autoSave isNil ifTrue: [
        autoSave := false.
        self autoSave.
    ].!
   
editTabbing

    | result |

    (result := (WBTabEditor new openOn: mainPane editedPane subpanes: mainPane exportedPanes) result) notNil ifTrue: [
        mainPane setPanes: result.
        self mainPaneChanged: true.
        mainPane unselectAll.
        mainPane invalidateRect: nil.
    ].!
 
enable: aCollection inMenu: aString
    | menu |
    menu := self menuTitled: aString.
    menu isNil ifTrue: [ menu := self mainView menuWindow wbMenuTitled: aString ].
    aCollection do: [ :item |
        menu enableItem: item.
        toolBar enableItem: item ].!
   
eventSummary

    | v className |

    className := editedClass isScratchWindow ifTrue: [
        'Untitled'
    ] ifFalse: [
        editedClass name
    ].
    v := TextEditWindow new.
    v labelWithoutPrefix: 'Event Summary [', className, ']'.
    v openOn: mainPane eventsSummaryString.!
 
exportToResFile

    | fName |

    fName := (FileDialog new saveFile:
        (File
            fileName: editedClass name
            extension: (String with: $r with: $e with: $s))) file.

    fName notNil ifTrue: [
        mainPane exportToResFile: fName.
    ].!
  
extraCommentNameFor: aSubpane

    ^'Callback for ', (self subpaneNameString: aSubpane), '.'.!

fillInPerform

    | selector |


    thePane supportedEvents isEmpty  ifFalse: [
        currentWhen := when selectedItem.
    ] ifTrue: [
        currentWhen := #none.
        perform contents: ''.
    ].

    selector := thePane handlers at: self currentEvent ifAbsent: [ '' ].

    perform contents: selector asString.!
   
fixFraming

    | framingBlock fraction |
    mainPane editedPane children do: [ :child |
        framingBlock := child framingBlock.
        (fraction := framingBlock top) isFraction ifTrue: [
            framingBlock tP: (fraction denominator - fraction numerator) / fraction denominator
        ].
        (fraction := framingBlock bottom) isFraction ifTrue: [
            framingBlock bP: (fraction denominator - fraction numerator) / fraction denominator
        ].
    ].
    mainPane reframeAll; display.
    changed := true.
    self enable: #(save) inMenu: 'File'.!

generateCode

    | editedPane mdiAttributes firstArg methodStream paneList mdi openMethodType |

    CursorManager execute change.

    editedPane := mainPane editedPane.
    mdiAttributes := mainPane mdiAttributes.
    firstArg := self class firstArg.

    methodStream := WriteStream on: String new.
    methodStream nextPutAll: self openMethodHeaderText.

    (mdi := ((Smalltalk includesKey: #MDIViewManager) and: [ editedPane realClass inheritsFrom: (Smalltalk at: #MDIViewManager) ])) ifTrue: [
        methodStream cr; cr;
            nextPutAll: '    ',firstArg,' addView: ('; cr;
            nextPutAll: '        ',firstArg,' frame: (MDIFrame new'; cr;
            nextPutAll: '            owner: ',firstArg,';'; cr.
        self writeHandlers: mdiAttributes frameEvents on: methodStream.
        methodStream
            nextPutAll: '            labelWithoutPrefix: ', mdiAttributes label asQuotedString; cr;
            nextPutAll: '        )'; cr;
            nextPutAll: '    ).'.

        mdiAttributes hasToolPane ifTrue: [
            methodStream cr; cr;
                nextPutAll: '    ',firstArg,' addSubpane: ('; cr;
                nextPutAll: '        ToolPane new'; cr.
            self writeHandlers: mdiAttributes toolPaneEvents on: methodStream.
            methodStream
                nextPutAll: '            owner: ',firstArg; cr;
                nextPutAll: '    ).'.
        ].
        mdiAttributes hasStatusPane ifTrue: [
            methodStream cr; cr;
                nextPutAll: '    ',firstArg,' addSubpane: ('; cr;
                nextPutAll: '        StatusPane new'; cr.
            self writeHandlers: mdiAttributes statusPaneEvents on: methodStream.
            methodStream
                nextPutAll: '            owner: ',firstArg; cr;
                nextPutAll: '    ).'.
        ].
    ].

    editedPane children: mainPane panes.
    mainPane views do: [:v |

        methodStream cr; cr;
        nextPutAll: '    ',firstArg,' addView: ('; cr;
        nextPutAll: '        v := '.

    paneList := mainPane sortInZorder: v children.

    paneList :=
            (paneList select: [ :p | p staysToBack and: [ p staysWayBack not ]]) reversed,
            (paneList select: [ :p | p staysWayBack ]) reversed,
            (paneList select: [ :p | p tabPosition notNil & p staysToBack not]) reversed,
            (paneList select: [ :p | p tabPosition isNil & p staysToBack not]) reversed.

    v storeOn: methodStream indentString: '            ' mdi: mdi.
    methodStream nextPutAll: ';'; cr.
    paneList do: [:p |
        methodStream nextPutAll: '            addSubpane: (' ; cr.
        p storeOn: methodStream  indentString: '                '.
        methodStream cr; nextPutAll: '            );'; cr.
    ].
    methodStream
        nextPutAll: '        yourself'; cr;
        nextPutAll: '    ).'.

    (v menu notNil) ifTrue: [
        methodStream cr; cr; nextPutAll: '    v menuWindow'; cr.
        methodStream nextPutAll: '        yourself'.
        v menu storeOn: methodStream indentString: '    '.
        methodStream nextPutAll: '.'.
    ].
  ].
    methodStream cr; cr.

    "Support for CompositePanes - #addSubpanes"
    editedPane isCompositePane ifTrue: [
        self class createMethod: methodStream contents
            titled: 'addSubpanes' in: editedPane realClass
            loggingSource: (editedPane realClass isScratchWindow) not.

    "Support for v2.0 #open methods"
    ] ifFalse: [(openMethodType := self class openMethodType) isNil ifTrue: [
        (editedPane isDialog) & (editedPane isModal not) ifTrue: [
            methodStream nextPutAll: '    ',firstArg,' openModeless'.
        ] ifFalse: [
            methodStream nextPutAll: '    ',firstArg,' openWindow'.
        ].
        self class createMethod: methodStream contents
            titled: 'open' in: editedPane realClass
            loggingSource: (editedPane realClass isScratchWindow) not.

    "Support for #createViews"
    ] ifFalse: [
        self class createMethod: methodStream contents
            titled: self openMethodTitle in: editedPane realClass
            loggingSource: (editedPane realClass isScratchWindow) not.
        "Get rid of old #open method if no longer required"
        (mainPane propertyAt: #keepOpenMethod) == true ifFalse: [
            (editedPane realClass includesSelector: #open) ifTrue: [
                editedPane realClass removeSelector: #open
            ].
        ].
    ]].

    editedPane realClass isWBInternalClass ifFalse: [
        self class createMethod: '
    ^true' titled: 'wbCreated' in: editedPane realClass class loggingSource: true.
    ].

    CursorManager normal change.!

getEditedClass

    | temp |

    (temp := (WBChooseClassDialog new classList: ViewManager wbCreatedClasses) result) notNil ifTrue: [
        editedClass := temp.
        self labelWithoutPrefix: self label.
        ^editedClass
    ].

    ^nil!

getEditedCompositeClass

    | temp |

    (temp := (WBChooseClassDialog new classList: CompositePane wbCreatedClasses) result) notNil ifTrue: [
        editedClass := temp.
        self labelWithoutPrefix: self label.
        ^editedClass
    ].

    ^nil!
 
getPointPrompting: promptString defaultPoint: defaultValue

    | string s point |

    (string := Prompter prompt: promptString default: defaultValue asString) isNil ifTrue: [
        ^nil
    ].

    (string includes: $@) ifTrue: [
        s := ReadStream on: string.
        point := (s upTo: $@) trimBlanks asInteger @ (s upTo: $@) trimBlanks asInteger.
        ^point
    ] ifFalse: [
       MessageBox messageNote: 'Value must be of the form ''x @ y''.'.
    ].

    ^nil!
  
getValidMethodName: string

    | result |

    result := (string select: [ :c | c isAlphaNumeric ]).

    (result notEmpty and: [ result first isDigit ]) ifTrue: [
        ^nil
    ].

    ^result!

gridSize
    | gridSize |
    "Get GridSize property from WindowBuilder"
    gridSize := self class propertyAt: #GridSize.
    gridSize isNil ifTrue: [ self gridSize: 1@1 ].
    ^gridSize!
   
gridSize: newSize
    | gridSize |
    "Store into GridSize property of WindowBuilder"
    gridSize := (newSize x max: 1) @ (newSize y max: 1).
    self class propertyAt: #GridSize put: gridSize.
    self drawGrid ifTrue: [
        mainPane display.
    ].!

importFromResFile

    | theClass resFile |

    resFile := FileDialog new
        title: 'Import Resource File:';
        fileSpec: '*.res';
        hideReadonly;
        addFilter: '*.res' description: 'Resource file (*.RES)';
        defFilter: '*.res';
        open;
        file.
    resFile isNil ifFalse: [
        (theClass := mainPane importFromResFile: resFile) notNil ifTrue: [
            editedClass := theClass.
            changed := true.
            self saveInternal.
            self editClass: theClass.
        ].
    ].!
   
importFromWindows

    | theClass windowsClasses |

    (windowsClasses := ViewManager allSubclasses select: [:c | c basicNew respondsTo: #addSubpanesTo: ]) isEmpty ifTrue: [
        ^MessageBox messageNote: 'No ViewManager subclasses were generated by WB 1.1.'
    ].

    (theClass := (WBChooseClassDialog new classList: windowsClasses allowOthers: false) result) isNil ifFalse: [
        (theClass := mainPane importWindow: theClass) notNil ifTrue: [
            editedClass := theClass.
            changed := true.
            self saveInternal.
            self editClass: theClass.
        ].
    ].!
  
initialize

    super initialize.
    changed := false.!
 
initializePalettes

    | aFont |

    groupPalette useSystem: true; size: 1@14.
    toolPalette useSystem: true; size: 1@14.
    self toolCollection do: [ :group |
        groupPalette add: group key.
        toolPalette on: group key add: 'ArrowTool'.
        group value do: [ :tool |
            toolPalette on: group key add: tool
        ]
    ].
    toolPalette switchTo: 'Text'.

    aFont := Font new fromBytes: #( 245 255 0 0 0 0 0 0 144 1 0 0 0 0 1 2 1 34 72 101 108 118 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ).
    positionPane font: aFont.
    sizePane font: aFont.
    statusPane font: aFont.

    (self paneNamed: 'sizeButton') contents: (CPBitmapDict sysAt: 'size').
    (self paneNamed: 'positionButton') contents: (CPBitmapDict sysAt: 'position').!
   
initInstVars

    titleEditor := self paneNamed: 'titleEditor'.
    styleEditor := self paneNamed: 'styleEditor'.
    name := self paneNamed: 'instVar'.
    perform := self paneNamed: 'perform'.
    when := self paneNamed: 'when'.
    styleText := self paneNamed: 'styleText'.
    titleText := self paneNamed: 'titleText'.
    groupPalette := self paneNamed: 'groupPalette'.
    editPalette := self paneNamed: 'editPalette'.
    toolPalette := self paneNamed: 'toolPalette'.
    attributePalette := self paneNamed: 'attributePalette'.
    toolBar := self paneNamed: 'toolBar'.
    sizePane := self paneNamed: 'size'.
    positionPane := self paneNamed: 'position'.
    statusPane := self paneNamed: 'status'.!
   
initMdiWindowSize

    | extent origin |

    extent := ((240@230) / FramingParameters dialogUnit) truncated.
    origin :=(self frame mdiChildren size - 1) * (16 @ 16).
    ^origin extentFromLeftTop: extent.!
 
initWindow

    | mainMenu |

    editedClass isNil ifTrue: [
        editedClass := WBScratchWindow.
    ].
    self initInstVars.

    self initializePalettes.

    mainMenu := self mainView menuWindow.

    customSubMenu := mainMenu wbMenuTitled: 'Custom Panes'.

    self updateCustomPanesMenu.
    self updateQuickReferenceMenu.
    self autoSizeMenu.
    self editClass: editedClass.!

inspectSelection

    (mainPane selection isEmpty) ifTrue: [
        mainPane editedPane inspect.
    ] ifFalse: [
        mainPane selection first inspect.
    ].!
  
instVarNameCheck
    | instVarNameCheck |
    "Get InstVarNameCheck property from WindowBuilder"
    instVarNameCheck := self class propertyAt: #InstVarNameCheck.
    instVarNameCheck isNil ifTrue: [ self instVarNameCheck: false ].
    ^instVarNameCheck!
 
instVarNameCheck: bool
    "Store into InstVarNameCheck property of WindowBuilder"
    self class propertyAt: #InstVarNameCheck put: bool.!
   
isMDIClient

    ^false!
  
isWBWindow

    ^true!

label

    editedClass isNil | (editedClass isScratchWindow) ifTrue: [
        ^self class labelName,': [Untitled]'
    ] ifFalse: [
        ^self class labelName,': [', editedClass name,']'
    ].!

layoutPaneClass

    ^WBRealLayoutPane!
   
mainPane

    ^mainPane := self layoutPaneClass new
        owner: self;
        paneName: 'mainPane';
        framingBlock: [:b | (b leftTop leftAndUp: 2@2) extentFromLeftTop: 10000@10000 ];
        when: #cursorUnloaded   perform: #panePlaced:;
        when: #selectionChanged perform: #selectionChanged:;
        when: #operationOccurred perform: #undoableOperation:;
        when: #changed                perform: #mainPaneChanged:;
        when: #gettingFocus perform: #resetFocus:;
        when: #editPane perform: #other:;
        when: #rightButtonDown perform: #popupPaneMenu:;
        yourself!
   
mainPaneChanged: ignore

    self enable: #(save) inMenu: 'File'.
    self changed: true.!
   
mdi

    (Smalltalk includesKey: #MDIViewManager) ifFalse: [
        ^MessageBox message: 'You must install Digitalk''s MDI extensions before using MDI.'
    ].

    (editedClass inheritsFrom: (Smalltalk at: #MDIViewManager)) ifFalse: [
        ^MessageBox message: 'In order to build an MDI application, you must first save your window as a subclass of MDIViewManager.'
    ].

    (mainPane editMDIAttributes) notNil ifTrue: [
        self mainPaneChanged: true.
    ].!

mdiCommentNameFor: aString event:  eventSymbol

    ^'Callback for the #', eventSymbol asString, ' event in the ', aString, '.'.!
 
menuCommentNameFor: aMenuName

    ^'Callback for the menu item titled ', aMenuName stripMnemonic asQuotedString, '.'.!
   
message: aString
    aString isNil ifTrue: [
        self statusPane showHelp: ''
    ] ifFalse: [
        self statusPane showHelp: aString
    ].!
   
methodHeaderFor: aSelectorString

    (aSelectorString includes: $:) ifTrue: [
        ^aSelectorString, ' aPane'
    ] ifFalse: [
        ^aSelectorString
    ].!
   
minWindowSize

  ^((210@180) / FramingParameters dialogUnit) truncated!
   
mutate

    ^self mutate: #other!
 
mutate: mutationType
    | newPane oldPane newPaneClass |

    mutationType == #other ifTrue: [
        (newPaneClass :=  (WBChoosePaneDialog new classList:
            (SubPane allSubclasses reject: [ :c | c isWBInternalClass ])) result) isNil ifTrue: [
            ^self
        ].
        newPane := thePane mutateTo: newPaneClass name asSymbol.
    ] ifFalse: [
        newPane := thePane mutateTo: mutationType.
    ].
    newPane isNil ifFalse: [
        oldPane := thePane.
        self pane: newPane.
        oldPane become: newPane.
        self pane: oldPane.
        mainPane display.
        self mainPaneChanged: true.
    ]!
   
newCompositePaneFrom: aWindowBuilder

    editedClass := WBCompositePaneScratchWindow.
    self openWithParent: aWindowBuilder.
    mainPane placeLoadedPanesAtLeftTop.
    self mainView propertyAt: #creatingNewComposite put: true.
    self sendInputEvent: #changed: with: true.!

newPaneType: palette
    | selector |
    CursorManager normal change.
    toolPalette
        switchTo: (selector := palette selectorAt: palette currentIndex).
    self message: (self statusPaneHelp: selector).
    mainPane loadCursor: nil.!

newTool: palette

    self add: palette selector.!

newToolMessage: palette
    | selector message |
    selector := palette selectorAt: palette currentIndex.
    selector isNil ifTrue: [ ^nil ].
    selector = 'ArrowTool' ifTrue: [
        message := 'Use the arrow to select a pane for further editing.'.
    ] ifFalse: [
        message := 'Load the cursor with a ',selector,'.'
    ].
    self message: message.!
   
openCompositePane: aCompositePaneClass from: aWindowBuilder

    editedClass := aCompositePaneClass.
    self openWithParent: aWindowBuilder.!
   
openDialog

    editedClass := WBDialogScratchWindow.
    self open.!

openMethodExtraArgs

    ^self class openMethodArgs inject: '' into: [ :a :b |
            b = 'self' ifTrue: [ a ] ifFalse: [ a,b,' ' ]]!
   
openMethodHeaderText
    | text initCode |
    text := '
     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v ',self openMethodExtraArgs,'|'.
    ^(initCode := self class openMethodInitCode) isNil
        ifFalse: [ text, initCode ]
        ifTrue: [ text ]!

openMethodTitle
    | openMethodType numArgs stream |
    openMethodType := self class openMethodType asString.
    numArgs := openMethodType occurrencesOf: $:.
    numArgs = 0 ifTrue: [ ^openMethodType ].
    numArgs = 1 ifTrue: [ ^openMethodType,' arg1' ].
    numArgs = 2 ifTrue: [
        stream := openMethodType asStream.
        ^(stream upTo: $:),': arg1 ',(stream upTo: $:),': arg2'
    ].
    ^self error: 'Can''t write more than two arguments'!
   
openNew

    (self checkIfSaveChanges: 'Open Window') ifTrue: [
        (self getEditedClass) notNil ifTrue: [
            self editClass: editedClass.
        ].
    ].!

openNewComposite

    (self checkIfSaveChanges: 'Open Composite') ifTrue: [
        (self getEditedCompositeClass) notNil ifTrue: [
            self editClass: editedClass.
        ].
    ].!
   
openOn: appWindowClass

    editedClass := appWindowClass.

    self open.!
 
other: ignore

    | c |

    (thePane isCompositePane and: [Notifier isAltDown not])  ifTrue: [
        PWindowBuilder new openCompositePane: thePane realClass from: self.
        ^nil
    ].
    (thePane hasOtherEditor) ifTrue: [
        (thePane preEdit: self) ifFalse: [ ^nil ].
        (c := (thePane attributeEditor openOn: thePane) result) notNil ifTrue: [
            c fullCopyTo: thePane.
            (c changesTitle) ifTrue: [
                titleEditor contents: c text.
            ].
            self attributesHaveChanged.
            (c changesSize) ifTrue: [
                self autosize.
                self updateEvents: false.
            ].
        ].
    ].!

paletteHelp: palette
    | selector |
    selector := palette selectorAt: palette currentIndex.
    self message: (self statusPaneHelp: selector asString).!
 
pane: aPane

    | message |

    self disable: #(createNewComposite) inMenu: 'Composite Panes'.
    mainPane selection size > 1 ifTrue: [
        message := 'Multiple panes selected. The first is ',(self subpaneNameString: aPane), '.'.
        self enable: #(createNewComposite) inMenu: 'Composite Panes'.
    ] ifFalse: [ aPane == mainPane editedPane ifTrue: [
        (aPane contents isNil or: [ aPane contents isEmpty ]) ifTrue: [
            aPane isCompositePane ifTrue: [
                message := 'This is an untitled CompositePane.'
            ] ifFalse: [
                message := 'This is an untitled window.'
            ].
        ] ifFalse: [
            aPane isCompositePane ifTrue: [
                message := 'This is a CompositePane titled ',aPane contents asQuotedString,'.'
            ] ifFalse: [
                message := 'This is a window titled ',aPane contents asQuotedString,'.'
            ].
        ]
    ] ifFalse: [
        message := 'This is ', (self subpaneNameString: aPane), '.'
    ]].
    self message: message.

    (aPane == thePane) ifTrue: [
        ^self
    ].

    thePane := aPane.

    "Title"
    self updateTitle: thePane.

    "Name"
    thePane paneName isNil ifFalse: [
        name contents: thePane paneName
    ] ifTrue: [
        name contents: ''.
    ].

    "Events"
    self updateEvents: false.
    when selection: 1.
    self fillInPerform.

    "Style"
    thePane styles isNil ifTrue: [
        styleEditor
            contents: #(' ');
            selection: ' ';
            disable.
        styleText disable.
    ] ifFalse: [
        styleEditor
            contents: thePane styles;
            selection: thePane style;
            enable.
        styleText enable.
    ].

    "Composite Stuff"
    thePane isCompositePane ifTrue: [
        self enable: #(ungroupComposite) inMenu: 'Composite Panes'.
    ] ifFalse: [
        self disable: #(ungroupComposite) inMenu: 'Composite Panes'.
    ].

    self setStatus: attributePalette.

    self updateSizeAndPosition.

    self resetFocus: nil.!
  
panePlaced: ignore

    toolPalette selectItem: (toolPalette elementAtSelector: 'ArrowTool').!

paste

    mainPane paste!

pasteWindowBitmapToClipboard

    Clipboard setBitmap: mainPane layoutAsBitmap!
   
performTextChanged: aPane

    thePane isNil ifTrue: [ ^nil ].
    (self getValidMethodName: aPane contents) = (thePane handlers at: self currentEvent ifAbsent: ['']) asString ifTrue: [
        ^self
    ].

    self saveWhenPerform.
    self mainPaneChanged: nil.!
   
placeCentered: palette

    "Happens on doubleclick in palette.  Assumes select
     happened first"

    mainPane placeLoadedPane.!
   
popupGridSize: aPane

    | selection labels gridLabel menu |
    labels := #('Grid Off' '2 x 2' '3 x 3' '4 x 4' '5 x 5' '6 x 6' '8 x 8' '10 x 10').
    gridLabel := self gridSize x.
    gridLabel = 1
        ifTrue: [ gridLabel := 'Grid Off']
        ifFalse: [ gridLabel := gridLabel asString,' x ',gridLabel asString ].

    (menu := Menu new
        labels: labels
        lines: #(1)
        selectors: labels)
            checkItem: gridLabel.
    aPane setPopupMenu: menu.
    selection := menu popUpIn: aPane.
    aPane setPopupMenu: nil.
    selection isNil ifTrue: [ ^nil ].
    (gridLabel := selection upTo: 'x') = 'Grid Off'
        ifTrue: [ self drawGrid: false; gridSize: 1@1 ]
        ifFalse: [ self gridSize: gridLabel asInteger @ gridLabel asInteger ]!
 
popupPaneMenu: layoutPane

    | selection newSelection menu subMenu list |

    newSelection := layoutPane selection.

    newSelection isEmpty ifTrue: [
        menu := Menu new
            labels: #('Font' 'Color' 'Framing' 'Menubar' 'Window')
            lines: #()
            selectors: #(setFont: setColor: setFraming: setMenu: other:).
    ] ifFalse: [ newSelection size > 1 ifTrue: [
        menu := Menu new
            appendItem: 'Framing' selector: #setFraming:;
            appendSeparator;
            appendItem: 'Create Composite' selector: #createNewComposite;
            appendSeparator;
            appendItem: 'Align Left' selector: #alignLeft;
            appendItem: 'Align Horizontal Center' selector: #alignCenterHorizontal;
            appendItem: 'Align Right' selector: #alignRight;
            appendItem: 'Align Top' selector: #alignTop;
            appendItem: 'Align Vertical Center' selector: #alignCenterVertical;
            appendItem: 'Align Bottom' selector: #alignBottom;
            appendSeparator;
            appendItem: 'Distribute Vertically' selector: #alignDistributeVertical;
            appendItem: 'Distribute Horizontally' selector: #alignDistributeHorizontal.
    ] ifFalse: [ newSelection first isComposite ifTrue: [
        menu := Menu new
            appendItem: 'Color' selector: #setColor:;
            appendItem: 'Framing' selector: #setFraming:;
            appendItem: 'Edit' selector: #other:;
            appendSeparator ;
            appendItem: 'Ungroup' selector: #ungroupComposite;
            appendSeparator ;
            appendSubMenu: (
                subMenu := Menu new
                    title: 'Morph';
                    owner: self owner).
            (list := thePane mutationList) do: [ :item |
                subMenu appendItem: item selector: item ].
            list isEmpty ifFalse: [ subMenu appendSeparator ].
            subMenu appendItem: 'Other...' selector: 'other'.
    ] ifFalse: [
        menu := Menu new
            appendItem: 'Font' selector: #setFont:;
            appendItem: 'Color' selector: #setColor:;
            appendItem: 'Framing' selector: #setFraming:;
            appendItem: 'Menu' selector: #setMenu:;
            appendItem: 'Attributes' selector: #other:;
            appendSeparator ;
            appendSubMenu: (
                subMenu := Menu new
                    title: 'Morph';
                    owner: self owner).
            (list := thePane mutationList) do: [ :item |
                subMenu appendItem: item selector: item ].
            list isEmpty ifFalse: [ subMenu appendSeparator ].
            subMenu appendItem: 'Other...' selector: 'other'.
    ]]].
    self setStatus: menu.
    layoutPane setPopupMenu: menu.
    selection := menu popUpIn: layoutPane.
    layoutPane setPopupMenu: nil.
    selection isSymbol ifTrue: [
        ((selection at: selection size) == $:) ifTrue: [
            self sendInputEvent: selection with: nil
        ] ifFalse: [
            self perform: selection.
            self theMainPane invalidateRect: mainPane visibleFrameRect
        ].
    ] ifFalse: [ selection isString ifTrue: [
        self sendInputEvent: #mutate: with: selection asSymbol
    ]].!

preInitWindow

    (self paneNamed: 'scrollingPane')
            addSubpane: self mainPane.

    self buildMenus.

    (self menuTitled: 'Edit')
        accelKey: BackspaceKey  accelBits: AfAlt | AfVirtualkey  for: #undo;
        accelKey: DeleteKey accelBits: AfShift | AfVirtualkey  for: #cut;
        accelKey: InsertKey accelBits:  AfChar | AfControl  for: #copy;
        accelKey: InsertKey accelBits: AfShift | AfVirtualkey  for: #paste.

    self icon: self class screenIcon.

    "Set the default font for all the controls"
    self mainView children do: [ :child | child font: self class wbDefaultFont ].!
  
prepareAppWindowsForSave: savedPaneList

    "Scan through the panes, looking for methods and instance
     variables to predeclare."

    | allSelectors menuPanes methodsToDeclare methodNames panesToScan
     mdiAttributes poolDictionaries sharedPools sharedVariableString generateClassDef |

    CursorManager execute change.

    "Since we don't log source, recompiling the class will fail
      when trying to compile the open method.  To avoid this, we
      remove the old method first"

    editedClass isScratchWindow ifTrue: [
        PWindowBuilder openMethodType isNil ifTrue: [
            editedClass removeSelector: #open
        ] ifFalse: [
            editedClass removeSelector: PWindowBuilder openMethodType.
        ].
    ].

    poolDictionaries := Set new.
    methodsToDeclare := Dictionary new.
    methodNames := editedClass selectors asOrderedCollection.

    editedClass allSuperclasses do: [ :aClass |
        methodNames addAll: aClass selectors.
    ].

    panesToScan := OrderedCollection new.
    savedPaneList do: [ :p |
        panesToScan addAll: p children copy.
    ].
    panesToScan addAll: mainPane panes.

    menuPanes := OrderedCollection new.

    savedPaneList do: [ :w |
        w menu notNil ifTrue: [
            allSelectors := w menu allSelectors.
            allSelectors keysDo: [:aSelector |
                (aSelector isSymbol) & (methodNames includes: aSelector) not ifTrue: [
                    methodsToDeclare at: aSelector put: (self menuCommentNameFor: (allSelectors at: aSelector)).
                ].
            ].
        ].
        w handlers do: [ :aSelector |
            (aSelector isSymbol) & (methodNames includes: aSelector) not ifTrue: [
                methodsToDeclare at:  aSelector put: (self topPaneCommentNameFor: w event: (w handlers keyAtValue: aSelector)).
            ].
        ].
    ].

    panesToScan do: [ :w |
        w menu notNil ifTrue: [
            allSelectors := w menu allSelectors.
            allSelectors keysDo: [:aSelector |
                (aSelector isSymbol) & (methodNames includes: aSelector) not ifTrue: [
                    methodsToDeclare at: aSelector put: (self menuCommentNameFor: (allSelectors at: aSelector)).
                ].
            ].
        ].
        w handlers do: [ :aSelector |
            (aSelector isSymbol) & (methodNames includes: aSelector) not ifTrue: [
                methodsToDeclare at:  aSelector put: (self subpaneCommentNameFor: w event: (w handlers keyAtValue: aSelector)).
            ].
        ].
        w extraHandlers do: [ :aSelector |
            (aSelector isSymbol) & (methodNames includes: aSelector) not ifTrue: [
                methodsToDeclare at: aSelector put: (self extraCommentNameFor: w).
            ].
        ].
        poolDictionaries addAll: w requiredPoolDictionaries.
    ].

    (mdiAttributes := mainPane mdiAttributes) notNil ifTrue: [
        mdiAttributes hasStatusPane ifTrue: [
            mdiAttributes statusPaneEvents do: [ :aSelector |
                (methodNames includes: aSelector) not ifTrue: [
                    methodsToDeclare at: aSelector put: (self mdiCommentNameFor:  'StatusPane for the MDI frame' event: (mdiAttributes statusPaneEvents keyAtValue: aSelector)).
                ].
            ].
        ].
        mdiAttributes hasToolPane ifTrue: [
            mdiAttributes toolPaneEvents do: [ :aSelector |
                (methodNames includes: aSelector) not ifTrue: [
                    methodsToDeclare at: aSelector put: (self mdiCommentNameFor:  'ToolPane for the MDI frame' event: (mdiAttributes toolPaneEvents keyAtValue: aSelector)).
                ].
            ].
        ].
        mdiAttributes frameEvents do: [ :aSelector |
            (methodNames includes: aSelector) not ifTrue: [
                methodsToDeclare at: aSelector put: (self mdiCommentNameFor:  'MDI frame' event: (mdiAttributes frameEvents keyAtValue: aSelector)).
            ].
        ].
    ].

    (methodsToDeclare notEmpty) & (editedClass isScratchWindow) ifTrue: [
        "Do not generate any methods for a scratch window"
        methodsToDeclare := Dictionary new.
    ].

    methodsToDeclare keysDo: [ :aMethod |
            self declareMethod: aMethod commentString: (methodsToDeclare at: aMethod).
    ].

    "Make sure it has the local Constants pool dictionary"
    sharedPools := editedClass sharedPools.
    editedClass isScratchWindow ifTrue: [
        poolDictionaries add: #WBConstants; add: #ColorConstants.
        editedClass setSharedPools: poolDictionaries asArray.
    ] ifFalse: [
        sharedVariableString := editedClass sharedVariableString.
        poolDictionaries add: #ColorConstants.
        (sharedPools includes: #WinConstants) ifFalse: [
            poolDictionaries add: #WBConstants.
        ].
        generateClassDef := false.
        poolDictionaries do: [ :dict |
            (sharedPools includes: dict) ifFalse: [
                sharedVariableString := sharedVariableString,' ',dict asString.
                generateClassDef := true.
            ].
        ].
        generateClassDef ifTrue: [
            editedClass superclass
                subclass: editedClass name asSymbol
                instanceVariableNames: editedClass instanceVariableString
                classVariableNames: editedClass classVariableString
                poolDictionaries: sharedVariableString.
        ].
    ].

    CursorManager normal change.!
  
propertyAt: aSymbol

    ^self class propertyAt: aSymbol!
 
propertyAt: aSymbol put: anObject

    self class propertyAt: aSymbol put: anObject!
  
quickReferenceMenu

    ^(self mainView menuWindow) wbMenuTitled: 'Quick Reference'.!
 
realStatusPane

    ^statusPane!
  
refresh

    self updateParent.
    mainPane editedPane children do: [ :c |
        c isCompositePane ifTrue: [ c realClass: c realClass ]
    ].
    mainPane
        hideSizeDot;
        hideWindow;
        reframeAll;
        showWindow.!
  
reinitWindowBuilder

    self selectionMenuItemsPerform: #disableItem:.
    (self menuTitled: 'Edit') disableItem: #undo.
    mainPane unselectAll.
    self selectionChanged: mainPane.!
  
removeCustomPane

    | result |

    result := WBListChooser fromList: self customPanes prompt: 'Remove which pane?'.
    result isNil ifTrue: [
        ^self
    ].

    (self customPanes includes: result) ifTrue: [
        self customPanes remove: result.
        customSubMenu removeItemDynamically: result.
    ].

    self updateRemoveCustomPane.!
 
replicateHeight

    mainPane replicateHeight!

replicateWidth

    mainPane replicateWidth!
  
resetFocus: ignore

    titleEditor setFocus; selectAll!
  
resetFonts

    | fonts |
    fonts := self propertyAt: #StoredFonts.

    ListFont := fonts at: 1.
    TextFont := fonts at: 2.
    ButtonFont := fonts at: 3.
    SysFont := fonts at: 4.!

save

    (editedClass isScratchWindow) ifTrue: [
        ^self saveAs
    ].

    ^self saveInternal.!
   
saveAs

        | temp windowType |

    mainPane editedPane isDialog ifTrue: [
        windowType := 'Dialog'.
    ] ifFalse: [ mainPane editedPane isCompositePane ifTrue: [
        windowType := 'CompositePane'
    ] ifFalse: [
        windowType := 'Window'.
    ]].


    (temp := (PWindowBuilder wbCreateClassDialog new forWindowType: windowType ) result) notNil ifTrue: [
        editedClass := temp.
        self labelWithoutPrefix: self label.
        self changed: true.
        self saveInternal.
        "(windowType = 'Window') ifTrue: [
            (self menuTitled: 'View') enableAll.
        ]."
    ] ifFalse: [
        ^nil
    ].!
 
saveAsDefault

    | savedEditedClass |


    savedEditedClass := editedClass.
    (editedClass inheritsFrom: WindowDialog) ifTrue: [
        editedClass := WBDefaultDialogScratchWindow.
    ] ifFalse: [(editedClass inheritsFrom: CompositePane) ifTrue: [
        editedClass := WBDefaultCompositePaneScratchWindow.
    ] ifFalse: [
        editedClass := WBDefaultScratchWindow.
    ]].

    self changed: true.
    self saveInternal.
    self changed: true.

    editedClass := savedEditedClass.

    (editedClass isScratchWindow) ifTrue: [
        (self menuTitled: 'File') disableItem: #editAppCode.
    ].!

saveInternal


    (self changed or: [ editedClass isScratchWindow ]) ifFalse: [
        ^self
    ].

    (self prepareAppWindowsForSave: mainPane views) isNil ifTrue: [
        ^nil
    ].

    mainPane editedPane realClass: editedClass.
    self generateCode.

    self changed: false.

    self disable: #(save) inMenu: 'File'.

    (editedClass isScratchWindow) ifFalse: [
        self enable: #(editAppCode) inMenu: 'File'.
    ].

    self updateParent.!
 
saveWhenPerform

    | methodName savedSelection |

    perform contents hasContent ifTrue: [

        methodName := self getValidMethodName: perform contents.

        (perform contents = methodName) ifFalse: [
            savedSelection := perform getSelection.
            perform contents: methodName.
            perform setSelectionFrom: savedSelection origin x - 1 to: savedSelection corner x - 1.
        ].
        methodName isNil ifFalse: [
            thePane handlers at: self currentEvent put: (methodName, ':') asSymbol.
        ].
    ] ifFalse: [
        thePane handlers removeKey: self currentEvent ifAbsent: [].
    ].

    self updateEvents: true.!
   
scrapbookLoad
    | fileName scrapbook |
    (Smalltalk includesKey: #ObjectFiler) ifFalse: [
        ^MessageBox message: 'Loading a Scrapbook requires the ObjectFiler. File in ''\EXTRAS\OBJFILER\VWOBJFLR.ST''.'
    ].
    fileName := (FileDialog new
                            openTitle: 'Load Scrapbook'
                            fileSpec: '*.SBK'
                            showFileInButton: false) file.
    fileName isNil ifFalse: [
        self class scrapbookLoadFile: fileName.
        self updateQuickReferenceMenu.
    ].!
   
scrapbookMerge
    | fileName scrapbook mergeScrapbook overWrite |
    (Smalltalk includesKey: #ObjectFiler) ifFalse: [
        ^MessageBox message: 'Merging a Scrapbook requires the ObjectFiler. File in ''\EXTRAS\OBJFILER\VWOBJFLR.ST''.'
    ].
    fileName := (FileDialog new
                            openTitle: 'Merge Scrapbook'
                            fileSpec: '*.SBK'
                            showFileInButton: false) file.
    fileName isNil ifFalse: [
        mergeScrapbook := (Smalltalk at: #ObjectFiler) loadFromPathName: fileName.
        scrapbook := self class scrapbook.
        overWrite := nil.
        mergeScrapbook keysDo: [ :chapter |
            (scrapbook includesKey: chapter) ifFalse: [
                scrapbook at: chapter put: (mergeScrapbook at: chapter).
            ] ifTrue: [
                (mergeScrapbook at: chapter) keysDo: [ :page |
                    (overWrite isNil and: [ (scrapbook at: chapter) includesKey: page ]) ifTrue: [
                        overWrite := MessageBox confirm: 'Overwrite existing pages with the same names?'
                    ].
                    (overWrite == false and: [ ((scrapbook at: chapter) includesKey: page) ]) ifTrue: [
                        (scrapbook at: chapter) at: (page,'.2') put: ((mergeScrapbook at: chapter) at: page)
                    ] ifFalse: [
                        (scrapbook at: chapter) at: page put: ((mergeScrapbook at: chapter) at: page)
                    ].
                ].
            ].
        self updateQuickReferenceMenu.
        ].
    ].!
   
scrapbookNew

    (MessageBox confirm: 'Are you sure that you want to throw out the old scrapbook and create another?') ifTrue: [
        self class scrapbook: nil.
        self updateQuickReferenceMenu.
    ]!
 
scrapbookQuickReference: aString
    | pageName found |
    found := false.
    pageName := aString reject: [:c | found := ((c == $~) | (c == $&) & found not) ].
    mainPane clipboard: ((self class scrapbook at: 'Quick Reference') at: pageName ifAbsent: [nil]).
    mainPane clipboard isNil ifFalse: [
        mainPane paste
    ].!

scrapbookRetrieve

    (WBScrapbookRetrieve new openOn: mainPane) removedQuick ifTrue: [
        self updateQuickReferenceMenu
    ]!
   
scrapbookSave
    | fileName |
    (Smalltalk includesKey: #ObjectFiler) ifFalse: [
        ^MessageBox message: 'Saving a Scrapbook requires the ObjectFiler. File in ''\EXTRAS\OBJFILER\VWOBJFLR.ST''.'
    ].
    fileName := (FileDialog new saveTitle: 'Save Scrapbook' fileName: 'SCRAP.SBK') file.
    fileName isNil ifTrue: [ ^nil ].
    (Smalltalk at: #ObjectFiler) dump: self class scrapbook newFile: fileName.!
   
scrapbookStore

    mainPane copy.
    (mainPane clipboard isNil or: [ mainPane clipboard first isEmpty ]) ifTrue: [
        ^MessageBox message: 'At least one pane must be selected first.'
    ].
    (WBScrapbookStore new openOn: mainPane) isQuick ifTrue: [
        self updateQuickReferenceMenu
    ]!
 
selectAll

    mainPane selectAll.!
   
selectionChanged: layoutPane

    | newSelection sizeMenu |

    toolBar cacheRedrawOn.

    newSelection := layoutPane selection.
    sizeMenu := self menuTitled: 'Size'.

    (self menuTitled: 'Edit')
        changeItem: #undo label: '&Undo	Ctrl+Z';
        disableItem: #undo.

    (newSelection size > 1) ifTrue: [
        self selectionMenuItemsPerform: #enableItem:.
        self enable: #(alignLeft alignRight alignTop alignBottom) inMenu: 'Align'.
        (self menuTitled: 'Align')
            enableItem: '~Center';
            enableItem: '~Distribute'.
        ( self menuWindow wbMenuTitled: 'Center') enableAll.
        ( self menuWindow wbMenuTitled: 'Distribute') enableAll.
        toolBar
            enableItem: #alignCenterHorizontal;
            enableItem: #alignCenterVertical;
            enableItem: #alignDistributeHorizontal;
            enableItem: #alignDistributeVertical.

        self pane: newSelection first.

        sizeMenu
            disableItem: #setWindowSize;
            disableItem: #setWindowPosition.

    ] ifFalse: [

        sizeMenu
            enableItem: #setWindowSize;
            enableItem: #setWindowPosition.

        self disable: #(alignLeft alignRight alignTop alignBottom) inMenu: 'Align'.
        (self menuTitled: 'Align')
            disableItem: '~Center';
            disableItem: '~Distribute'.
        ( self menuWindow wbMenuTitled: 'Center') disableAll.
        ( self menuWindow wbMenuTitled: 'Distribute') disableAll.
        toolBar
            disableItem: #alignCenterHorizontal;
            disableItem: #alignCenterVertical;
            disableItem: #alignDistributeHorizontal;
            disableItem: #alignDistributeVertical.
       newSelection isEmpty ifTrue: [
            self selectionMenuItemsPerform: #disableItem:.
            self pane: mainPane editedPane.
            sizeMenu
                changeItem: #setWindowSize label: '&Set Window Size...';
                changeItem: #setWindowPosition label: 'Set Window &Position...'.

        ] ifFalse: [
            sizeMenu
                changeItem: #setWindowSize label: '&Set Pane Size...';
                changeItem: #setWindowPosition label: 'Set Pane &Position...'.

            self enable: #(cut copy duplicate clear bringToFront sendToBack mutate) inMenu: 'Edit'.
            self enable: #(autosize) inMenu: 'Size'.
           self pane: newSelection first.
        ].
    ].

    toolBar cacheRedrawOff!
  
selectionMenuItemsPerform: op

     #(
            cut
            copy
            clear
            bringToFront
            sendToBack
            duplicate
            mutate

        ) do: [:s |
            (self menuTitled: 'Edit') perform: op with: s.
            toolBar perform: op with: s.
        ].

    #(
        autosize
        replicateWidth
        replicateHeight
    ) do: [ :s |
        (self menuTitled: 'Size') perform: op with: s.
        toolBar perform: op with: s.
    ].!
  
sendToBack

    mainPane sendToBack.!
 
setColor: ignore

    | result selection |

    mainPane selection size = 1 ifTrue: [
        result := thePane getColors: self.
    ] ifFalse: [
        result := WBColorDialog new
            foreColor: thePane foreColor
            backColor: thePane realBackColor
            paneEdited: thePane.
    ].
    result isArray ifTrue: [
        mainPane selection isEmpty ifTrue: [
            selection := OrderedCollection with: mainPane editedPane.
        ] ifFalse: [
            selection := mainPane selection.
        ].
        selection do: [:p |
            p usesColor ifTrue: [
                (result at: 1) isNil ifTrue: [
                    p foreColor: p defaultForeColor.
                ] ifFalse: [
                    p foreColor: (result at: 1).
                ].
                (result at: 2) isNil ifTrue: [
                    p backColor: p defaultBackColor.
                ] ifFalse: [
                    p backColor: (result at: 2).
                ].
            ].
        ].
        self attributesHaveChanged.
    ].!
 
setColorButton: choices

    thePane usesColor ifTrue: [
        choices enableItem: #setColor:.
    ] ifFalse: [
        choices disableItem: #setColor:.
    ].!

setDefaultFonts

    self
        propertyAt: #StoredFonts
        put: (Array with: ListFont with: TextFont with: ButtonFont with: SysFont).

    ListFont := TextFont := ButtonFont := SysFont := self class wbDefaultFont.!

setDrawGrid

    self drawGrid ifTrue: [
        (self menuTitled: 'Options') uncheckItem: #drawGrid.
    ] ifFalse: [

        ((self gridSize x < 3) | (self gridSize y < 3)) ifTrue: [
            (MessageBox confirm: 'Your grid is rather small, and will take some time to display.   Are you sure you wish to do this?') ifFalse: [
                ^self
            ].
        ].
        (self menuTitled: 'Options') checkItem: #setDrawGrid.
    ].

    self drawGrid: self drawGrid not.!
  
setFont: ignore

    | font |
    (font := thePane getFont: self) notNil ifTrue: [
        mainPane selection do: [:p |
            p usesFont ifTrue: [ p font: font ].
        ].
        self attributesHaveChanged.
        mainPane redraw.
    ].!
   
setFraming: ignore

    | f fp rects |

    fp := mainPane selection first framingBlock.

    mainPane hideSelectionDots; disableSelectionDots.

        rects := mainPane selection collect: [ :p |
                mainPane editedPaneContentRect localizeRect: p rect
        ].

    f := (WBFramingEditor new
        openOnFramer: fp
        rects: rects
        parentRect: (0@0 extent: mainPane editedPaneContentRect extent)) result.

    f notNil ifTrue: [
                1 to: mainPane selection size do: [ :i |
                        (mainPane selection at: i) framingBlock: (f at: i).
                mainPane reframePane: (mainPane selection at: i).
                ].
        self mainPaneChanged: true.
    ].

    mainPane enableSelectionDots; showSelectionDots; showSizeDot.!
 
setFramingButton: choices

    thePane usesFraming & thePane isFrameObject not &
        mainPane editedPane isDialog not ifTrue: [
        choices enableItem: #setFraming:.
    ] ifFalse: [
        choices disableItem: #setFraming:.
    ].!

setGridSize

    | gridSize |

    gridSize := self getPointPrompting: 'Grid Size:' defaultPoint: self gridSize.
    gridSize isNil ifTrue: [
        ^self
    ].

    ((gridSize x < 3) | (gridSize y < 3)) & self drawGrid ifTrue: [
        (MessageBox confirm: 'This grid size is rather fine, and will take some time to display.   Are you sure you wish to display it?') ifFalse: [
            self drawGrid: false.
            (self menuTitled: 'Options') uncheckItem: #setDrawGrid.
        ].
    ].
    self gridSize: gridSize.!
   
setMenu: ignore

    | m |

    m := (thePane menuEditor openOn: thePane menu) result.

    m notNil ifTrue: [
        m hasChildren not ifTrue: [
            thePane menu: nil.
        ] ifFalse: [
            thePane menu: m
        ].
        self attributesHaveChanged.
    ].!
  
setStatus: choices

    "Other"
    (thePane hasOtherEditor or: [
        thePane isCompositePane and: [thePane isFrameObject not]]) ifTrue: [
        choices enableItem: #other:.
    ] ifFalse: [
        choices disableItem: #other:.
    ].

    "Font"
    thePane usesFont ifTrue: [
        choices enableItem: #setFont:.
    ] ifFalse: [
        choices disableItem: #setFont:.
    ].

    "Color"
    self setColorButton: choices.

    "Framing"
    self setFramingButton: choices.

    "Menu"
    thePane usesMenu ifTrue: [
        choices enableItem: #setMenu:.
    ] ifFalse: [
        choices disableItem: #setMenu:.
    ].!

setStyle: comboBox

    | theStyle |

    styleEditor selectedItem isNil ifTrue: [
        ^self
    ].

    theStyle := styleEditor selectedItem trimBlanks.
    theStyle notEmpty ifTrue: [
        (thePane style: theStyle asSymbol) isNil ifTrue: [
            thePane reframe: mainPane editedPaneContentRect.
            mainPane redraw ].
        self attributesHaveChanged.
        self setColorButton: attributePalette.
        self setFramingButton: attributePalette.
        self updateTitle: thePane.
    ].!

setWindowPosition

    | r newOrigin  |

    mainPane selection notEmpty  ifTrue: [
        mainPane hideSelectionDots; disableSelectionDots.
        newOrigin := self getPointPrompting: 'New pane position:' defaultPoint: mainPane selectionOrigin.
        newOrigin notNil ifTrue: [
            mainPane selectionOrigin: newOrigin
        ].
        mainPane enableSelectionDots; showSelectionDots.
        self updateSizeAndPosition.
        ^self
    ].

    mainPane captureMouseInput.
    r := Display pointFromUser: (0@0 extent: mainPane editedPane rect extent)
                offset: (mainPane editedPane rect extent // 2).
    mainPane clearMouseCapture.

    mainPane editedPane rect: (r := r extent: mainPane editedPane rect extent).
    (mainPane editedPane framingBlock: FramingParameters new)
        framingBlock
            left: r left relativeTo: #left;
            top: r top relativeTo: #top.

    self updateSizeAndPosition.
    self changed: true.!

setWindowPosition: ignore
    self setWindowPosition!
  
setWindowSize

    | newExtent  |

    newExtent := self getPointPrompting: 'New window size:' defaultPoint: thePane rect extent.

    newExtent notNil ifTrue: [
        thePane == mainPane editedPane ifTrue: [
            mainPane sizeWindowExternal: newExtent.
        ] ifFalse: [
            mainPane
                disableSelectionDots; hideSelectionDots;
                sizeSelectionToRect: (thePane rect leftTop extentFromLeftTop: newExtent);
                enableSelectionDots; showSelectionDots.
        ].
    ].

    self updateSizeAndPosition.!

setWindowSize: ignore
    self setWindowSize!
  
statusPane

    ^self mainView statusPane!

statusPaneHelp:aKey
    "Answer the default dictionary used by
    the status bar for help support"

    ^self class helpDict at:aKey ifAbsent:[]!
  
subpaneCommentNameFor: aSubpane event:  eventSymbol

    ^'Callback for the #', eventSymbol asString, ' event in ', (self subpaneNameString: aSubpane), '.'.!
 
subpaneNameString: aSubpane

    | nameString  |

    aSubpane paneName isNil ifTrue: [
        nameString := 'an unnamed ', aSubpane realClass name.
        aSubpane contents isString ifTrue: [
            nameString := nameString, ' (contents is ', aSubpane contents asQuotedString, ')'.
        ].
    ] ifFalse: [
        nameString := 'the ', aSubpane realClass name, ' named ', aSubpane paneName asQuotedString.
    ].
    ^nameString!
   
symbolNameChanged: ignore

    | badName |

    thePane isNil ifTrue: [ ^nil ].
    name contents = thePane paneName ifTrue: [ ^self ].

    name contents hasContent ifTrue: [
        name contents do: [ :c |
            c isAlphaNumeric ifFalse: [  badName := true ].
        ].
        (self instVarNameCheck and: [
            name contents first isUpperCase | (badName = true)]) ifTrue: [
            MessageBox messageNote: '''', name contents, ''' is an invalid pane name.'.
                name contents: ''.
        ] ifFalse: [
            thePane paneName: name contents.
        ].
    ] ifFalse: [
        thePane paneName: nil.
    ].

    self mainPaneChanged: true.!
 
testWindow

    self setDefaultFonts.
    self tryToSaveChanges notNil ifTrue: [
        editedClass open
    ].
    self sendInputEvent: #resetFonts!

textChanged: ignore

    thePane isNil ifTrue: [ ^nil ].
    thePane usesTitle & (thePane text = titleEditor contents) not ifTrue: [
        thePane text: titleEditor contents.
        mainPane updateTitle: thePane.
        self mainPaneChanged: true.
        mainPane checkMnemonicConflicts.
        (self autoSize and: [ thePane changesSize ]) ifTrue: [
            self autosize.
            self updateEvents: false.
        ].
    ].!
 
theEditedClass

    ^editedClass!
 
theMainPane

    ^mainPane!
   
toolCollection
    | menus target tools |
    menus := self class wbMenus.
    target := menus detect: [ :m | (m at: 1) = 'A~dd' ] ifNone: [nil].
    target isNil ifTrue: [ ^nil].
    tools := OrderedCollection new.
    (target at: 3) do: [ :mi |
        mi == #separator ifTrue: [ ^tools ].
        tools add:
            (Association
                key: (mi at: 1) stripMnemonic
                value: ((mi at: 3) collect: [ :msi | msi at: 2 ]))
    ].
    ^tools!

topPaneClass
        "Private - Answer the default top pane class."
    (Smalltalk includesKey: #MDISystem) ifTrue: [
        Smalltalk isRunTime ifFalse:[
            (Smalltalk at: #MDISystem) isActive ifTrue:[
                ^(Smalltalk at: #WBMDIChild ifAbsent: [ WBTopPane ])]]].
    ^WBTopPane!
 
topPaneCommentNameFor: aTopPane event:  eventSymbol

    ^'Callback for the #',
        eventSymbol asString,
        ' event in the ',
        (aTopPane paneName isNil
            ifTrue: [ 'unnamed TopPane' ]
            ifFalse: [ 'TopPane ',aTopPane paneName asQuotedString]),
        '.'.!
  
tryToSaveChanges

    (self changed or: [ editedClass isScratchWindow ]) ifTrue: [
        autoSave ifFalse: [
            (MessageBox
                confirm: 'Your viewmanager needs to be saved first.  Save and continue?'
            ) ifFalse: [
                ^nil
            ].
        ].
        CursorManager execute change.

        self saveInternal isNil ifTrue: [
            CursorManager normal change.
            ^nil
        ].
        cleanedOutCode := true.
        CursorManager normal change.
    ].

    (editedClass isScratchWindow) & (cleanedOutCode = false) & (changed not) ifTrue: [
        editedClass resetToDefault.
        cleanedOutCode  := true.
    ].!
   
undo

    mainPane undo!
  
undoableOperation: layoutPane

    | aString aSymbol |

    aSymbol := mainPane lastOpSymbol.

    (#( move size sizeWindow clear undo align replicateSize autosize) includes: aSymbol) not |
        ((aSymbol = #undo) and: [ (mainPane previousOpSymbol = #place) ])  ifTrue: [
        ^(self menuTitled: 'Edit')
            changeItem: #undo label: 'Can''t &Undo', (String with: Tab), 'Ctrl+Z';
            disableItem: #undo
    ].

    aSymbol == #undo ifTrue: [
        aString := '&Redo', (String with: Tab),'Ctrl+Z'
    ] ifFalse: [
        aString := '&Undo ', aSymbol asPresentableString, (String with: Tab), 'Ctrl+Z'.
    ].

    (self menuTitled: '~Edit')
        changeItem: #undo label: aString;
        enableItem: #undo.!
   
ungroupComposite

    thePane isComposite ifFalse: [ ^nil ].

    mainPane ungroupComposite!

updateCustomPanesMenu

    | index m |

    index := customSubMenu numberOfItems + 1.

    self customPanes do: [ :p |
        customSubMenu insertItemDynamically: p selector: p atIndex: index.

        index := index + 1.
    ].

    self updateRemoveCustomPane.!

updateEvents: refresh

    | oldEvents theEvents sel used unused |

    oldEvents := when contents.
    theEvents := thePane supportedEvents.
    used := OrderedCollection new.
    unused := OrderedCollection new.
    theEvents do: [ :e |
        (thePane handlers at: e ifAbsent: [ nil ]) isSymbol
            ifTrue: [ used add: '*', e ]
            ifFalse: [ unused add: e asString ]
    ].
    theEvents := used addAll: unused; yourself.

    theEvents = oldEvents ifTrue: [
        ^self
    ].

    refresh ifTrue: [
        sel := when selectedItem.

        (sel notNil and: [ sel notEmpty ]) ifTrue: [
            sel first = $* ifTrue: [
                sel := sel copyFrom: 2 to: sel size.
            ].
            perform contents notEmpty ifTrue: [
                sel := '*', sel.
            ].
        ].

        when
            contents: theEvents;
            selectItem: sel;
            invalidateRect: when rectangle.
    ] ifFalse: [
        when contents: theEvents.
    ].!
 
updateParent
    | originalRect parentWB |
    (parentWB := self mainView parent) isNil ifFalse: [
        parentWB isMDIChild | parentWB isMDIClient ifTrue: [ ^nil ].
        (self mainView propertyAt: #creatingNewComposite) == true ifTrue: [
            (MessageBox confirm: 'Replace original widgets with new CompositePane?') ifTrue: [
                originalRect := parentWB theMainPane selectedRect.
                parentWB
                    cut;
                    add: self theEditedClass name.
                parentWB theMainPane placeLoadedPanesAt: originalRect leftTop.
            ].
            self mainView propertyAt: #creatingNewComposite put: false.
        ] ifFalse: [
            parentWB isMDIClient ifFalse: [ parentWB refresh ].
        ].
        self mainView setFocus.
    ].!
   
updatePosition: aPoint

    positionPane contents: aPoint x asString,', ',aPoint y asString.!
 
updateQuickReferenceMenu

    | quickReferenceMenu index p stream |

    quickReferenceMenu := self quickReferenceMenu.
    quickReferenceMenu removeAllItemsDynamically.
    index := quickReferenceMenu numberOfItems + 1.
    (self class scrapbook at: 'Quick Reference')  keys asSortedCollection do: [ :page |
        (page includes: $&) ifFalse: [
            p := page
        ] ifTrue: [
            stream := WriteStream on: String new.
            page do: [ :character |
                stream nextPut: character.
                character = $&  ifTrue: [stream nextPut: character]].
            p := stream contents
        ].
        quickReferenceMenu insertItemDynamically: p selector: p atIndex: index.
        index := index + 1.
    ].!
 
updateRemoveCustomPane

    self customPanes isEmpty ifTrue: [
        (self menuTitled: 'Add')
            disableItem: #removeCustomPane.
    ] ifFalse: [
        (self menuTitled: 'Add')
            enableItem: #removeCustomPane.
    ].!

updateSize: aRect
    | point |
    point := aRect extent.
    sizePane contents: point x asString,'x',point y asString.!

updateSizeAndPosition

    | point |
    self updateSize: thePane rect.

    mainPane selection notEmpty  ifTrue: [
        point := mainPane selectionOrigin.
     ] ifFalse: [
        point := mainPane editedPane rect leftTop.
    ].
    self updatePosition: point.!
   
updateTitle: aPane

    "Title"
    aPane usesTitle ifTrue: [
        titleEditor contents: aPane text; enable.
        titleText enable.
    ] ifFalse: [
        titleEditor contents: ''; disable.
        titleText disable.
    ].!
   
viewCreate

    | v |

    (v:= Prompter prompt: 'Name for new view:' default: '') isNil ifFalse: [
        mainPane newView: v.
        (self menuTitled: 'View') enableAll.
        self mainPaneChanged: true.
    ].!
   
viewList

    ^(mainPane views select: [ :view |
        view paneName notNil
    ]) collect: [ :v | v paneName ].!
 
viewRemove

    | v |

    (v:= WBListChooser new fromList: self viewList prompt: 'Remove which view?') isNil ifFalse: [
        mainPane removeView: v.
        (mainPane views size = 1) ifTrue: [
            (self menuTitled: 'View')
                disableItem: #viewSwitchTo;
                disableItem: #viewRemove.
        ].
        self mainPaneChanged: true.
    ].!
 
viewSwitchTo

        | v |

        (v:= WBListChooser new fromList: self viewList prompt: 'Which view?' selection: mainPane editedPane paneName) isNil ifFalse: [
                mainPane switchToView: (mainPane viewAt: v).
                self reinitWindowBuilder.
        ].!
   
when: ignore

    currentWhen = when selectedItem ifTrue: [
        ^self
    ].

    self fillInPerform.!

writeHandlers: h on: aStream

    h notNil ifTrue: [
        h keysDo: [ :symbol |
            (h at: symbol) isSymbol ifTrue: [
                aStream nextPutAll: '            when: #', symbol,' perform: #', (h at: symbol), ';'; cr.
            ].
        ].
    ].!

zoomLayout

    | scrollPane isZoomed |

    scrollPane := mainPane scrollPane.
    isZoomed := scrollPane zoomed.

    (self menuTitled: 'Options')  changeItem: #zoomLayout label: (
        isZoomed ifTrue: [
            '&Zoom Layout	Alt+Z'
        ] ifFalse: [
            'Un&zoom Layout	Alt+Z'
        ]
    ).

    scrollPane zoom.! !



!PTextPane class methods ! !



!PTextPane methods !
 
defaultFont

    ^PWindowBuilder wbDefaultFont
    "^TextFont"!
  
mutationExceptions

    ^#(CPChildEntryField Toggle CPSpinEditor)!

mutationTypes

    ^#(EntryField StaticText Toggle CPSpinEditor)!
 
usesFocus

    ^true! !



!WBMultiToolPalette class methods !

isWBInternalClass

    ^true! !



!WBMultiToolPalette methods !
  
aboutToSaveImage

    self pages do: [ :page |
        page do: [ :tool | tool pen: nil ]
    ].!
   
add: aSelector on: name

    ^self add: nil selector: aSelector on: name!
 
add: aBitmapFile selector: aSelector on: name
    | key point temp element |
    temp := self elements.
    self elements: (self pageNamed: name).
    key := self elements size + 1.
    point := ((key - 1)\\(self size x)+1) @ ((key + (self size x - 1))//(self size x )).
    element := self at: point put: aBitmapFile selector: aSelector.
    self elements: temp.
    ^element!
   
addPage: aPage name: name
    self pages at: name put: aPage.
    ^aPage!
 
at: key on: name put: aBitmapFileName

    ^self at: key on: name put: aBitmapFileName selector: nil!
 
at: key on: name put: aBitmapFileName selector: aSelector
    | temp element |
    temp := self elements.
    self elements: (self pageNamed: name).
    element := self at: key put: aBitmapFileName selector: aSelector.
    self elements: temp.
    ^element!
 
at: key on: name selector: aSelector

    ^self at: key on: name put: nil selector: aSelector!

bitmapFileAt: key on: name
    | element |
    ^(element := self elementAt: key on: name) isNil
        ifTrue: [ nil ]
        ifFalse: [ element file ]!
  
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
   
disable: key on: name
    | element |
    (element := self elementAt: key on: name) isNil
            ifFalse: [
                element disabled.
                (self handle isValid and: [ elements == (self pageNamed: name)])
                    ifTrue: [ self display: key ]]!
   
elementAt: key on: name
    ^(self pageNamed: name) at: key ifAbsent: [ nil ]!
 
enable: key on: name
    | element |
    (element := self elementAt: key on: name) isNil
            ifFalse: [
                element up.
                (self handle isValid and: [ elements == (self pageNamed: name)])
                    ifTrue: [ self display: key ]]!
  
initialize

    super initialize.
    self pages: Dictionary new.!
   
on: name add: aSelector

    ^self add: nil selector: aSelector on: name!
 
on: name add: aBitmapFile selector: aSelector

    ^self add: aBitmapFile selector: aSelector on: name!
   
pageNamed: name
    ^self pages at: name ifAbsent: [ self addPage: self newPage name: name ]!
  
pageNames
    ^self pages keys!

pages
    ^pages!
  
pages: aDictionary
    pages := aDictionary!
   
releaseBitmaps
        "Private - Release all bitmaps."
    | aBitmap |
    self elements: nil.
    self pages do: [ :page |
        page do: [ :element | element releaseBitmaps ]
    ].
    self pages: nil.!
 
selectorAt: key on: name
    | element |
    ^(element := self elementAt: key on: name) isNil
        ifTrue: [ nil ]
        ifFalse: [ element selector ]!

stateAt: key

    ^#up!
   
switchTo: name
    | sel |
    self hideWindow.
    self elements: (self pageNamed: name).
    selection := self elementAtSelector: 'ArrowTool'.
    selection isNil ifTrue: [ selection := self defaultSelection ].
    self elements do: [ :element | element up ].
    sel := self elementAt: selection.
    sel isNil ifFalse: [ sel down ].
    self handle isValid ifTrue: [ self display ].
    self showWindow.! !



!WBMDIAttributes class methods !

new

    ^super new initialize! !



!WBMDIAttributes methods !
   
frameEvents

    ^frameEvents!

frameEvents: dict

    frameEvents := dict.!
  
hasStatusPane

    ^hasStatusPane!

hasStatusPane: bool

    hasStatusPane  := bool!
  
hasToolPane

    ^hasToolPane!

hasToolPane: bool

    hasToolPane := bool!
   
initialize

    frameEvents := Dictionary new.
    label := 'MDI Frame'.
    hasStatusPane := false.
    hasToolPane := false.
    statusPaneEvents := Dictionary new.
    toolPaneEvents := Dictionary new.!

label

    ^label!

label: aString

    label := aString!
 
statusPane: b

    hasStatusPane :=  ((b = false) | (b isNil)) not.

    b isNil ifTrue: [ ^self ].
    (b isKindOf: (Smalltalk at: #StatusPane ifAbsent: [ nil ])) ifTrue: [
        ^statusPaneEvents := b handlers
    ].

    b ifTrue: [
        statusPaneEvents isNil ifTrue: [
            statusPaneEvents := Dictionary new.
        ].
    ] ifFalse: [
        statusPaneEvents := nil.
    ].!
  
statusPaneEvents

    ^statusPaneEvents!
  
toolPane: b

    hasToolPane := ((b = false) | (b isNil)) not.

    b isNil ifTrue: [ ^self ].
    (b isKindOf: (Smalltalk at: #ToolPane ifAbsent: [ nil ])) ifTrue: [
        ^toolPaneEvents := b handlers
    ].

    b ifTrue: [
        toolPaneEvents isNil ifTrue: [
            toolPaneEvents := Dictionary new.
        ].
    ] ifFalse: [
        toolPaneEvents := nil.
    ].!
 
toolPaneEvents

    ^toolPaneEvents! !



!WBListChooser class methods !
  
fromList: aList prompt: questionString

    ^super new fromList: aList prompt: questionString!

isWBInternalClass

    ^true! !



!WBListChooser methods !
   
cancel: aButton

    self mainView close!
 
fromList: aList prompt: questionString

        "Private - Initialize a Prompter window
         and give it control."

    | lineHeight charSize |

    self
        labelWithoutPrefix: '';
        when: #opened perform: #opened:.
    charSize := WindowDialog unitMultiplier.

    lineHeight := charSize y.

    self addSubpane:
        (StaticText new
            centered;
            contents: questionString;
            framingBlock: [:box |
                (box leftTop rightAndDown: lineHeight@5)
                    extentFromLeftTop: (box width - 10) @ lineHeight ] ).

    self addSubpane:
        (self listClass new
            paneName: 'list';
            contents: aList;
            when: #doubleClickSelect perform: #ok:;
            framingBlock: [:box |  ((box leftTop
                     rightAndDown: (1 @ 2) * charSize))
                     rightBottom:  (box rightBottom leftAndUp: (1@3) * charSize) ] ).

    self addSubpane:
        (Button new
            defaultPushButton;
            contents: 'OK';
            when: #clicked perform: #ok:;
            framingBlock: [:box | ((box leftBottom
                        rightAndUp: (1 @ (5/2)) * charSize))
                    extentFromLeftTop: (10 @ 2) * charSize ] ).

    self addSubpane:
        (Button new
            contents: 'Cancel';
            when: #clicked perform: #cancel:;
            framingBlock: [:box | ((box leftBottom
                        rightAndUp: (12 @ (5/2)) * charSize))
                    extentFromLeftTop: (10 @ 2) * charSize ] ).

    self openWindow.

    ^reply!
  
fromList: aList prompt: questionString selection: s

    sel := s.
    ^self fromList: aList prompt: questionString!
 
initWindowSize

    ^180@160!
 
isWBWindow

    ^true!

listClass

    ^ListBox!
  
ok: aButton

    reply := (self paneNamed: #list) selectedItem.

    self mainView close!
   
opened: topPane

        "Private - Dialog is opened, select the text
         and set the initial focus."

    | list |

    list := self paneNamed: #list.

    sel notNil ifTrue: [
        list selection: sel.
    ] ifFalse: [
        list contents notEmpty ifTrue: [
            list selectIndex: 1.
        ].
    ].

    list setFocus.! !


!Window methods !   
tabPosition: ignore

    "Added by OSI"
    #addedByOSI.!    !

!Window methods !
setStyle: s

    "Added by OSI"
    #addedByOSI.
    self propertyAt: #style put: s.!   !

!Window methods !
getId

    "Added by OSI"

    | i |
    #addedByOSI.
    (i := self id) isNil ifTrue: [
        ^1
    ].

    ^i!   !

!Window methods !
nameForInstVar: sym

    "Added by OSI"
    #addedByOSI.
    self paneName: sym!    !

!Window methods !
extent: e

    "Added by OSI"
    #addedByOSI.
    self propertyAt: #extent put: e! !

!WinDialogInfo methods ! 
numberOfItems
    "Added by OSI"
    #addedByOSI.
    ^self byteAtOffset: 4! !

!WinDialogInfo methods ! 
readFrom: fileName

    "Added by OSI"
    | s f |
    #addedByOSI.
    f := File pathName: fileName.

    f nextByte; nextByte; nextByte; nextByte.
    [ f nextByte = 0 ] whileFalse: [ ].
    f nextByte; nextByte.

    s := f nextUShort.
    f nextByte; nextByte.
    contents := ByteArray new: s.
    1 to: s do: [:i |
        contents at: i put: f nextByte.
    ].

    f close.!    !

!WinDialogInfo methods ! 
items

    "Added by OSI"

    | items s r resID style classID b text |

    #addedByOSI.
    s := ReadWriteStream on: (contents copyFrom: 14 to: contents size).

    "Skip menu name, class name, and text"
    s upTo: 0; upTo: 0; upTo: 0.

    (self style bitIsOn: (WinConstants at: 'DsSetfont')) ifTrue: [
        s nextTwoBytes; upTo: 0.
    ].

    items := OrderedCollection new.
    self numberOfItems timesRepeat: [
        r := (s nextTwoBytes @ s nextTwoBytes extent: s nextTwoBytes @ s nextTwoBytes).
        resID := s nextTwoBytes.
        style := s nextFourBytes.
        classID := s next.
        classID < 128 ifTrue: [
            classID := String with: classID asCharacter.
            [ (b := s next) = 0 ] whileFalse: [
                classID := classID, (String with: b asCharacter).
            ].
        ].
        text := ''.
        [ ( b := s next ) = 0 ] whileFalse: [
            text := text, (String with: b asCharacter)
        ].
        items add:
            (InterfaceObject
                newFromStyle: style
                classID: classID
                rect: r
                text: text
                resID: resID
            ).
        s next.
    ].

    ^items! !

!WinDialogInfo methods ! 
extent

    "Added by OSI"
    #addedByOSI.
    ^(self uShortAtOffset: 9) @ (self uShortAtOffset: 11)!  !

!WinDialogInfo methods ! 
style
    "Added by OSI"
    #addedByOSI.
    ^self uLongAtOffset: 0!    !

!WinDialogInfo methods ! 
text

    "Added by OSI"
    | s t |
    #addedByOSI.
    s := ReadStream on: (contents copyFrom: 14 to: contents size).

    "Skip menu name and class name"
    s upTo: 0; upTo: 0.

    t := String new.
    (s upTo: 0) do: [:b | t := t, (String with: b asCharacter) ].

    ^t! !

!WinDialogInfo methods ! 
origin
    "Added by OSI"
    #addedByOSI.
    ^(self uShortAtOffset: 5) @ (self uShortAtOffset: 7)! !

!ComboBox methods !  
text
    "Added by OSI"
    #addedByOSI.
    ^self windowText.!  !

!String methods !
asQuotedString

    "Added by OSI"

    | stream |
    #addedByOSI.
    stream := WriteStream on: String new.
    self printOn: stream.
    ^stream contents!   !

!String methods !
asMessage
    "Added by OSI - Converts a piece of code into a message selector"
    | array semiArray result |

    self isEmpty ifTrue:[ ^nil ].
    #addedByOSI.
    array := self asArrayOfSubstrings.
    semiArray := array select: [ :s |
        (s last == $: and:
        [ s size > 1 and:
        [(s at: s size - 1) ~= $$ ]])].
    semiArray size > 0
        ifTrue: [
            result := ''.
            semiArray do: [ :s | result := result, s trimBlanks ]]
        ifFalse: [
            result := (ReadStream on: array first) nextWord.
            result isNil ifTrue: [ result := array first ].
            (result first isUpperCase and: [ array size > 1 ])
                ifTrue: [ result := (ReadStream on: (array at: 2)) nextWord ]].
    ^result asSymbol! !

!String methods !
hasContent

    "Added by OSI"

    (self isEmpty) ifTrue: [
        #addedByOSI.
        ^false
    ].

    self do: [ :aChar |
        (aChar == $ ) not ifTrue: [
            ^true
        ].
    ].

    ^false!    !

!String methods !
upTo: aCharacter

    "Added by OSI - answer the string up to the given character,
     or the entire string if the character isn't found"

    | s |
    #addedByOSI.
    s := ReadStream on: self.
    ^s upTo: aCharacter!   !

!String methods !
mnemonicChar

    "Added by OSI.  Scan for the mnenomic character (&), and
     answer the character following it.  If no mnemonic, answer nil."

    | index |
    #addedByOSI.
    index := (self indexOf: $& ifAbsent: [ self size ]) + 1.
    index > self size ifTrue: [
        ^nil
    ].

    ^(self at: index) asUpperCase!   !

!ViewManager methods !   
menuWindow

    "Modified by OSI to allow asking for a menu if no view has been created.
     Used in Windows conversion."

    "Private - Answer the menu bar of the first view,
     retained for compatibility."

    #modifiedByOSI.
    views size < 1 ifTrue: [
        self addView: (
            (self topPaneClass) new
                owner: self)].
    ^self mainView menuWindow!    !

!StaticText methods !
showHelp: aString
    "Added by OSI"
    #addedByOSI.
    self contents: aString!    !

!Class methods ! 
setSharedPools: aCollection
    "Added by OSI - Change the shared pool dictionaries to be <aCollection>.
     Perform no error checking."
    #addedByOSI.
    sharedPools := aCollection asSet asArray collect: [ :poolName | poolName asSymbol ]! !

!Symbol methods !
asPresentableString

    "Added by OSI"

    "Take a smalltalk style symbol, separate its capital-letter-delimited tokens
     into words separated by spaces, capitalize the first word, and return a string."

    | inStream outStream nextChar |
    #addedByOSI.
    inStream := ReadStream on: self asString.
    outStream := WriteStream on: (String new: self asString size).

    nextChar := inStream next.
    outStream nextPut: nextChar asUpperCase.

    [ inStream atEnd ] whileFalse: [
        nextChar := inStream next.
        (nextChar isUpperCase) ifTrue: [
            outStream nextPut: $ .
        ].
        outStream nextPut: nextChar.
    ].

    ^outStream contents!    !

!Symbol methods !
asCUAPresentableString

    "Added by OSI"

    "Take a smalltalk style symbol, separate its capital-letter-delimited tokens
     into words separated by spaces and return a string."

    | inStream outStream nextChar |
    #addedByOSI.
    inStream := ReadStream on: self asString.
    outStream := WriteStream on: (String new: self asString size).

    nextChar := inStream next.
    outStream nextPut: nextChar.

    [ inStream atEnd ] whileFalse: [
        nextChar := inStream next.
        (nextChar isUpperCase) ifTrue: [
            outStream nextPut: $ .
        ].
        outStream nextPut: nextChar asLowerCase.
    ].

    ^outStream contents! !

!Point methods ! 
extentFromRightTop: aPoint
        "Added by OSI - Answer a Rectangle whose origin is the receiver
         at the top-right corner and extent is aPoint."
    #addedByOSI.
    ^Rectangle
        leftTop: ((self x left: aPoint x)@ (self y))
        rightBottom: ((self x) @ (self y down: aPoint y))!    !

!Point methods ! 
extentFromCenterTop: aPoint
        "Added by OSI - Answer a Rectangle whose center top point is
         the receiver at the center top point and extent is aPoint."
    #addedByOSI.
    ^Rectangle
        leftTop: ((self x left: (aPoint x // 2))@ (self y))
        rightBottom: ((self x right: (aPoint x // 2)) @ (self y down: aPoint y))!   !

!ReadWriteStream methods !   
nextFourBytes

     "Added byOSI.
      Answer the next two bytes from a byte array."

    | answer |
    #addedByOSI.
    answer := 0.
    #( 1 256 65536 16777216 ) do: [ : n |
        answer := answer + (self next * n)].
    ^answer!   !

!ReadWriteStream methods !   
nextTwoBytes

        "Added by OSI.
         Answer the next two bytes from a byte array."

    #addedByOSI.
    ^self next + (self next * 256)! !

!ClassHierarchyBrowser methods ! 
isWBClassBrowser
    "Added by OSI"
    #addedByOSI.
    ^true!  !

!ClassHierarchyBrowser methods ! 
openSelecting: selectingClass

    "Added by OSI"

    | aCollection blanks supers ratio groupPane |
    #addedByOSI.
    aCollection := Array with: Object.

    hiddenClasses := Set new.
    aCollection do: [ :class |
        class subclasses do: [:each |
            each subclasses isEmpty ifFalse: [
                hiddenClasses add: each
            ]
        ]
    ].

    ratio := 2 / 5.
    self update: aCollection.
     instanceSelectedLast := true.
    methodSelectedLast := false.
    assigned := used := true.
    self
        owner: self;
        label: self label.
    self addSubpane:
        (ListBox new
            owner: self;
            when: #getContents perform: #hierarchy: ;
            when: #select perform: #hierarchySelected: ;
            when: #doubleClickSelect perform: #hideShow: ;
            when: #getMenu perform: #menu: ;
            when: #charInput perform: #hierarchyCharInput: ;
            framingRatio:
                (Rectangle leftTopUnit extentFromLeftTop: 3/8 @ ratio)).
    self addSubpane:
        (ListBox new
            owner: self;
            when: #getContents perform: #instanceVars: ;
            when: #select perform: #instanceVar: ;
            when: #getMenu perform: #instVarsMenu: ;
            framingBlock: [:box|
                box leftTop + ((box width * 3/8) truncated @ (2 *
                    (ButtonFont height + 4) ))
                  rightBottom: (box width * 5//8) @ ((box height * ratio) truncated)]).
    self addSubpane:
        (ListBox new
            owner: self;
            when: #getContents perform: #selectors: ;
            when: #select perform: #selector: ;
            when: #getMenu perform: #selectorMenu: ;
            framingRatio:
                (Rectangle leftTopUnit + (5/8 @ 0)
                    extentFromLeftTop: 3/8 @ ratio)).
    self addSubpane: (groupPane := GroupPane new
        framingBlock: [:box| box leftTop + ((box width * 3//8) @ 0)
            rightBottom: ((box width * 5//8)@(box leftTop y + (2 *
                    (ButtonFont height + 4) )))]).
    groupPane addSubpane:
        (RadioButton new
            owner: self;
            contents: 'instance';
            when: #clicked perform: #instanceButton:;
            selection: true;
            framingRatio: (1/15 @ 0 extentFromLeftTop: 14/15 @ (1/2))).
    groupPane addSubpane:
        (RadioButton new
            owner: self;
            contents: 'class';
            when: #clicked perform: #classButton:;
            framingRatio: (1/15 @ (1/2) extentFromLeftTop: 14/15 @ (1/2))).
    self addSubpane:
        (TextPane new
            owner: self;
            when: #getContents perform: #text: ;
            when: #save perform: #accept: ;
            framingRatio: (Rectangle leftBottomUnit
              extentFromLeftBottom: 1 @ (1 - ratio))).
    supers := (Array with: class), selectingClass allSuperclasses.
    blanks := 0.
    1 to: supers size do: [ :i |
        (originalClasses includes: (supers at: i))
           ifTrue: [ blanks := i ]].
    supers do: [ :cl |
        hiddenClasses remove: cl ifAbsent: []].

    self openWindow.

    self update: originalClasses.
    methodSelectedLast := false.
    selectedMethod := nil.
    selectedInstVar := nil.
    selectedClass := selectingClass.
    self changed: #hierarchy:
        with: #restoreSelected:
        with: (((String new: ((blanks - 1 max: 0) * 2)) atAllPut: $ ),
            selectingClass name).
    self
        changed: #instanceVars: ;
        changed: #selectors: ;
        changed: #text:.
    CursorManager normal change.!  !

!ClassHierarchyBrowser methods ! 
selectedMethod

    "Added by OSI"
    #addedByOSI.
    ^selectedMethod!    !

!ClassHierarchyBrowser methods ! 
selectedClass

    "Added by OSI"
    #addedByOSI.
    ^selectedClass!  !

!Stream methods !
nextString: s

    "Added by OSI"
    #addedByOSI.
    [ self atEnd ] whileFalse: [
        self nextWord = s ifTrue: [
            ^self
        ].
    ].

    ^nil!    !

!Screen methods !
pointFromUser: aRectangle offset: anOffset

    "Modified by OSI to erase last extra rectangle left on screen."

        "Display aRectangle and answer a point selected
         by the user."
    | loc oldLoc oldCorner newCorner w |
    #modifiedByOSI.
    oldLoc := Cursor sense - anOffset.
    oldCorner := oldLoc + aRectangle extent.
    graphicsTool setRop2: R2Notxorpen;
        place: oldLoc;
        box: oldCorner.
    Notifier consumeInputUntil: [: event |
        loc := Cursor sense - anOffset.
        oldCorner := oldLoc + aRectangle extent.
        newCorner := loc + aRectangle extent.
        loc ~= oldLoc
            ifTrue: [
                graphicsTool
                    place: oldLoc;
                    box: oldCorner;
                    place: loc;
                    box: newCorner.
                oldLoc := loc].
        (event selector = #button1Down:)  ].
    "Added by OSI."
    graphicsTool
        place: loc;
        box: newCorner.
    ^loc!  !

!Object methods !
isWBClassBrowser
    "Added by OSI"
    #addedByOSI.
    ^false! !

!Object methods !
isInterfaceObject
    "Added by OSI"
    #addedByOSI.
    ^false!    !

!Object methods !
isWBInternalClass
    "Added by OSI"
    #addedByOSI.
    ^false!    !

!Rectangle methods ! 
localizeRect: aRect

    "Added by OSI"

     "Answer a rectangle that is in coordinates relative to
     self.  The rectangle passed in is assumed in the
     same coordinates as self.  This method is system independent."

    #addedByOSI.
    ^(aRect leftTop - self origin) extentFromLeftTop: aRect extent!   !

!Rectangle methods ! 
centerTop
        "Added by OSI - Answer the center top Point."
    #addedByOSI.
    ^(self right + self left)//2 @ self top!    !

!Rectangle methods ! 
offsetFromLeftTop: aRect

    "Added by OSI"

     "Answer a Point that is the offset difference between self's leftTop
     and aRect's leftTop, where positive values indicate aRect is below and
     to the right of self."

    #addedByOSI.
    ^(aRect left - self left) @ (aRect top - self top)!  !

!Rectangle methods ! 
unLocalizeRect: aRect

    "Added by OSI"

     "Answer a rectangle that is the same coordinates as
     self.  The rectangle passed in is assumed in self's coordinates."

    #addedByOSI.
    ^(aRect leftTop + self origin) extentFromLeftTop: aRect extent!    !

!Rectangle methods ! 
moveToLeftTop: aPoint

    "Added by OSI"
    #addedByOSI.
    self moveBy: aPoint - self leftTop!  !

!Font methods !  
logicalBytes

    "Added by OSI"

    | byteStream |
    #addedByOSI.
    byteStream := WriteStream on: String new.
    byteStream nextPutAll: '#( '.
    self logFont contents do: [ :b |
        byteStream nextPutAll: b asString, ' '.
    ].
    byteStream nextPut: $).
    ^byteStream contents! !

!Font methods !  
italic
    "Modified by OSI - Used to say = 1"
    #modifiedByOSI.
    ^textMetrics tmItalic ~= 0.!  !

!Font methods !  
wbEquals: aFont

    "Added by OSI"
    #addedByOSI.
    ^((self == aFont) or: [  (self faceName = aFont faceName) & (self charSize = aFont charSize)])!    !

!Font methods !  
bold: aValue
    "Modified by OSI.  Non bold used to set weight to 0"
        "set the bold boolean of the font to aValue."
    #modifiedByOSI.
    aValue notNil ifTrue: [
        aValue ifTrue:
            [logFont lfWeight: 700    ]
        ifFalse:
            [logFont lfWeight: 400    ]].
    changed := true.!    !

!Font methods !  
portableStoreOn: aStream indentString: indentString

    "Added by OSI"
    #addedByOSI.
    aStream
        nextPutAll: indentString, 'Font';
        cr; nextPutAll: indentString, 'face: ''', self faceName, '''';
        cr; nextPutAll: indentString, 'size: ', (self charSize x@ self pointSize) asString;
        cr; nextPutAll: indentString, 'fixedWidth: ', self fixedWidth asString.

    (self bold = false) & (self italic = false) & (self strikeOut = false) & (self underscore = false) ifFalse: [
      aStream
        cr; nextPutAll: indentString, 'bold: ', self bold asString;
        cr; nextPutAll: indentString, 'hollow: ', false asString;
        cr; nextPutAll: indentString, 'italic: ', self italic asString;
        cr; nextPutAll: indentString, 'negative: ', false asString;
        cr; nextPutAll: indentString, 'strikeOut: ', self strikeOut asString;
        cr; nextPutAll: indentString, 'underscore: ', self underscore asString
    ].! !

!Font methods !  
nonPortableStoreOn: aStream indentString: indentString

    "Added by OSI"
    #addedByOSI.
    aStream
        nextPutAll: indentString, 'Font new';
        cr; nextPutAll: indentString, 'fromBytes: ', self logicalBytes.!    !

!Font methods !  
underscore
    "Modified by OSI - Used to say = 1"
    #modifiedByOSI.
    ^textMetrics tmUnderline ~= 0.!   !

!Font methods !  
storeOn: aStream indentString: indentString

    "Added by OSI"
    #addedByOSI.

    "Default non-portable code generation for fonts"
    self nonPortableStoreOn: aStream indentString: indentString.

    "Portable code generation for fonts - use this for portability to V/Win32 & V/OS2"
    "self portableStoreOn: aStream indentString: indentString."!   !

!Font methods !  
strikeOut
    "Modified by OSI - Used to say = 1"
    #modifiedByOSI.
     ^ textMetrics tmStrikeOut ~= 0.!  !

!TopPane methods !   
handlers

    "Added by OSI"
    #addedByOSI.
    ^handlers!    !

!SubPane methods !   
realHandlers

    "Added by OSI"
    #addedByOSI.
    ^handlers!    !

!SubPane methods !   
handlers: dict

    "Added by OSI"
    #addedByOSI.
    handlers := dict!   !

!Bitmap methods !
storeOnStream: s

    "Added by OSI for saving bitmaps with the CPBitmapManager."

    | file fileHeader bits |
    #addedByOSI.
    bits := self getDIBits.
    bits isNil ifTrue: [^self].
    fileHeader := WinBitmapFileHeader new.
    fileHeader bfType: 'BM';
        bfSize: 14 + bitmapInfo contents size + bits size;
        reserved1: 0;
        reserved2: 0;
        offBits: 14 + bitmapInfo contents size.

    s nextPutAll: fileHeader contents asString.
    bitmapInfo contents do: [: aByte |
        s nextPut: aByte asCharacter].
    bits do: [: aByte |
        s nextPut: aByte asCharacter].!   !

!Bitmap methods !
fromSysID: id
    "Added by OSI"
    | handle bitmap |
    #addedByOSI.
    handle := UserLibrary
        loadBitmap: nil asParameter
        name: id.
    handle isNil ifTrue: [^self].
    bitmap := Bitmap fromHandle: handle.
    GDILibrary deleteObject: handle.
    ^bitmap!  !

!Bitmap methods !
cpCopy

    "Added by OSI"

    | newBitmap |

    #addedByOSI.
    newBitmap := Bitmap
            width: self width
            height: self height
            planes: self planes
            bitCount: self bitCount.
        self displayAt: 0@0 with: newBitmap pen.

    ^newBitmap!  !

!TextWindow methods !
addMenuItem: aPane

    "Modified by OSI to add WB Menu to the Transcript."

        "Private - Add items to the system menu in Transcript."
    self == Transcript ifTrue: [
        #modifiedByOSI.
        (self menuWindow menuTitled: '&File')
            appendItem: 'Graphics Demo' selector:
                (Message new receiver: self;
                    selector: #openDemo);
            appendItem: 'About V...' selector:
                (Message new receiver: self;
                    selector: #aboutV).

        "OSI - Changed to support WindowBuilder subclasses"
        self menuWindow addMenu: PWindowBuilder windowBuilderMenu.
    ].!   !

!UserDLL methods !   
openIcon: aHandle
    "Added by OSI"
    <api:OPENICON ushort boolean>
    #addedByOSI.
    self invalidArgument!   !

!UserDLL methods !   
drawFocusRect: hDC rectangle: aRect
    "Added by OSI"
    <api: DrawFocusRect ushort struct short>
    #addedByOSI.
    ^self invalidArgument! !

!Array methods ! 
asOrderedCollectionRecursively
    "Added by OSI"
    #addedByOSI.
    ^(self collect: [ :element |
        element isArray
            ifTrue: [ element asOrderedCollectionRecursively ]
            ifFalse: [ element == #nil
                ifTrue: [ nil ]
                ifFalse: [ element ]]]) asOrderedCollection!  !

!MenuWindow methods !
performMenuItem: anInteger

    "Altered by OSI to handle menus with no items"

        "Private - Perform the menu item whose id is anInteger."
    | menu selector |
    #modifiedByOSI.
    (anInteger // 256) > allMenus size ifTrue:[^self].   "MDI min/max button"
    (anInteger // 256) < 1 ifTrue:[^self].   "MDI Windows menu"
    menu := allMenus at: (anInteger // 256).
    menu owner initMenu.
    (menu isDisabled: anInteger \\ 256) ifFalse:[
        menu numberOfItems < 1 ifTrue: [ ^self ].
        selector := menu selectorOf: anInteger \\ 256.
        "OSI - removed #isKindOf: method reference"
        (selector isMessage)
            ifTrue: [^selector perform].
        menu selector isNil
            ifTrue: [
                selector isNil
                    ifFalse: [^menu owner perform: selector]]
            ifFalse: [
                ^menu owner perform: (menu selector) with: selector]]!  !

!MenuWindow methods !
asWBPMenuBar

    "Added by OSI"

    | mw |
    #addedByOSI.
    mw := WBPMenubar new.
    menus do: [ :m |
        mw addChild: m asPMenuItem.
    ].

    mw updateListStrings.
    ^mw! !

!MenuWindow methods !
asWBPMenu

    "Added by OSI"

    | mw |
    #addedByOSI.
    mw :=  WBPMenu new.
    menus do: [ :m |
        mw addChild: m asPMenuItem.
    ].

    mw updateListStrings.

    ^mw!    !

!MenuWindow methods !
wbMenuTitled: aString

    "Added by OSI - Search through all menus, including
      submenus, for the menu described below."

        "Answer the menu whose title is aString. Case is ignored
         and aString can include $&, $~, or neither."
    | plainString |
    #addedByOSI.
    plainString := aString reject: [:c | c = $& | (c = $~)].
    allMenus do: [:m |
        ((m title reject: [:c| c = $& | (c = $~)])
            equalsIgnoreCase: plainString)
             ifTrue: [^m]].
    ^nil!    !

!WinTextMetrics methods !
tmUnderline
    "Modified by OSI, they said tmUnderlined"
        "Private - Answer the tmUnderlined field."
    #modifiedByOSI.
    ^self byteAtOffset: 17!    !

!WinTextMetrics methods !
tmStrikeOut
    "Modified by OSI.  They said tmStruckOut."
        "Private - Answer the tmStruckOut field."
    #modifiedByOSI.
    ^self byteAtOffset: 18!    !

!ByteArray methods ! 
asString
        "Answer a String whose contents are the
         bytes of the receiver."
    #addedByOSI.
    ^(String new: self size) replace: self size with: self.! !

!ApplicationWindow methods ! 
menuWindow: newMenuWindow

    "Added by OSI"
    #addedByOSI.
    menuWindow := newMenuWindow.!    !

!ApplicationWindow methods ! 
label

    "Added by OSI"
    #addedByOSI.
    ^label!  !

!Number methods !
isFraction

    "Added by OSI"
    #addedByOSI.
    ^(self = self truncated) not!   !

!TextPane methods !  
realHandlers

    "Added by OSI"

    | realHandlers |
    #addedByOSI.
    realHandlers := Dictionary new.
    handlers keysDo: [ :k |
        ((k = #getContents) & ((handlers at: k) isSymbol not)) ifFalse: [
            realHandlers at: k put: (handlers at: k).
        ].
    ].
    ^realHandlers!    !

!Pen methods !   
drawRect3DLight: aRect

    "Added by OSI"
    #addedByOSI.
    self
        foreColor: self buttonHighlight;
        lineFrom: (aRect left @ (aRect top down: 1)) to: ((aRect right left: 1) @ (aRect top down: 1));
        lineFrom: ((aRect left right: 1) @ (aRect top down: 1)) to: ((aRect left right: 1)@ (aRect bottom up: 1));
        foreColor: (UserLibrary getSysColor: ColorBtnshadow);
        lineFrom: (aRect left right: 1) @ (aRect bottom up: 2) to: (aRect rightBottom leftAndUp: 1@2);
        lineFrom: (aRect left right: 2) @ (aRect bottom up: 3) to: ((aRect right left: 1) @ (aRect bottom up: 3));
        lineFrom: (aRect right left: 2) @ (aRect top down: 1) to: (aRect rightBottom leftAndUp: 2@1);
        lineFrom: (aRect right left: 3) @ (aRect top down: 2) to: (aRect right left: 3) @ (aRect bottom up: 1).! !

!Pen methods !   
buttonHighlight

    "Added by OSI"
    | color |
    ((WinAddress fromString: (KernelLibrary getVersion)) byteAtOffset: 0) = 3 ifTrue: [
        #addedByOSI.
        ^ClrWhite
    ] ifFalse: [
        ^UserLibrary getSysColor: ColorBtnhighlight
    ].!  !

!Pen methods !   
drawRect3D: aRect

    "Added by OSI"
    | theHandle leftRight1 leftRight2 rightLeft2 rightLeft3 topDown1 topDown2 bottomUp2 bottomUp3 |
    #addedByOSI.
    theHandle := self handle.
    leftRight1 := aRect left right: 1.
    leftRight2 := aRect left right: 2.
    rightLeft2 := aRect right left: 2.
    rightLeft3 := aRect right left: 3.
    topDown1 := aRect top down: 1.
    topDown2 := aRect top down: 2.
    bottomUp2 := aRect bottom up: 2.
    bottomUp3 := aRect bottom up: 3.

    self
        foreColor: self buttonHighlight;
        quickLineFrom: leftRight1 @ topDown1 to: rightLeft2 @ topDown1 using: theHandle;
        quickLineFrom: leftRight1 @ topDown2 to: rightLeft3 @ topDown2 using: theHandle;
        quickLineFrom: leftRight1 @ topDown1 to: leftRight1 @ bottomUp2 using: theHandle;
        quickLineFrom: leftRight2 @ topDown1 to: leftRight2 @ bottomUp3 using: theHandle;
        foreColor: (UserLibrary getSysColor: ColorBtnshadow);
        quickLineFrom: leftRight1 @ bottomUp2 to: (aRect right left: 1) @ bottomUp2 using: theHandle;
        quickLineFrom: leftRight2 @ bottomUp3 to: rightLeft2 @ bottomUp3 using: theHandle;
        quickLineFrom: rightLeft2 @ topDown1 to: rightLeft2 @ (aRect bottom up: 1) using: theHandle;
        quickLineFrom: rightLeft3 @ topDown2 to: rightLeft3 @ bottomUp2 using: theHandle!    !

!AboutDialog methods !   
open
        "Open a dialog box telling about Smalltalk/V."
    | lineHeight |
    self
        label: 'About'.

    lineHeight := 8.
    self addSubpane:
        (StaticText new
            centered;
            contents: 'Smalltalk Express';
            framingBlock: [:box |
                (box leftTop down: lineHeight)
                    extentFromLeftTop: box width @ lineHeight ] ).

    self addSubpane:
        (StaticText new centered;
            contents: '(c) Copyright ParcPlace-Digitalk Inc. 1992-1996';
            framingBlock: [:box |  (box leftTop down: lineHeight * 3)
                    extentFromLeftTop: box width @ lineHeight ] ).

    self addSubpane:
        (StaticText new centered;
            contents: 'All rights reserved';
            framingBlock: [:box | (box leftTop down: lineHeight * 4)
                    extentFromLeftTop: box width @ lineHeight ] ).

    self addSubpane:
        (StaticText new centered;
            contents: '999 East Arques Ave.';
            framingBlock: [:box | (box leftTop down: lineHeight * 6)
                    extentFromLeftTop: box width @ lineHeight ] ).

    self addSubpane:
        (StaticText new centered;
            contents: 'Sunnyvale, CA 94086-4593';
            framingBlock: [:box | (box leftTop down: lineHeight * 7)
                    extentFromLeftTop: box width @ lineHeight ] ).

    self addSubpane:
        (StaticText new centered;
            contents: 'www.parcplace.com';
            framingBlock: [:box | (box leftTop down: lineHeight * 8)
                    extentFromLeftTop: box width @ lineHeight ] ).

    self addSubpane:
        (StaticText new centered;
            contents: 'Smalltalk Express is a trademark';
            framingBlock: [:box | (box leftTop down: lineHeight * 12)
                    extentFromLeftTop: box width @ lineHeight ] ).

    self addSubpane:
        (StaticText new centered;
            contents: 'of ParcPlace-Digitalk Inc.';
            framingBlock: [:box | (box leftTop down: lineHeight * 13)
                    extentFromLeftTop: box width @ lineHeight ] ).

    self addSubpane:
        (Button new defaultPushButton;
            idOK;
            contents: 'OK';
            when: #clicked perform: #ok:;
            framingBlock: [:box | (box leftTop rightAndDown:
                        (box width - 35) // 2 @ (lineHeight * 19 // 2))
                    extentFromLeftTop: 35 @ (lineHeight * 2)] ).

    self openWindow!    !

!Menu methods !  
insertItemDynamically: string selector: aSelector atIndex: index

    "Added by OSI"
    #addedByOSI.
    self insertItem: string
        selector: aSelector
        accelKey: nil
        accelBits: nil
        after: index.

    UserLibrary
        insertMenu: window asParameter
        position: index
        flags: items last style + MfByposition
        id: (self menuItem id - 1) + items size
        contents: string asParameter.!   !

!Menu methods !  
asWBPMenu

    "Added by OSI"
    #addedByOSI.
    ^self asPMenuItem!   !

!Menu methods !  
removeItemDynamically: string

    "Added by OSI"

    | pos |
    #addedByOSI.
    pos := items indexOf: (items select: [:i | i contents = string]) first.
    items removeIndex: pos.
    accel removeIndex: pos.
    UserLibrary
        deleteMenu: window asParameter
        position:  pos - 1
        flag: MfByposition!   !

!Menu methods !  
removeAllItemsDynamically

    "Added by OSI"
    #addedByOSI.
    items reverseDo: [ :item |
        self removeItemDynamically: item contents ].
    items := OrderedCollection new.
    accel := OrderedCollection new.!  !

!Menu methods !  
asPMenuItem

    "Added by OSI"

    | item pMenu subMenu accelArray |

    #addedByOSI.
    pMenu := WBPMenuItem new.
    pMenu title: (title upTo: Tab).
    (selector isMessage and: [
        selector receiver isKindOf: WBAction]) ifTrue: [
        selector receiver receiver: nil
    ].
    pMenu selector: selector.

    1 to: self numberOfItems do: [ :i |
        item := items at: i.
        item isSubmenu ifTrue: [
            subMenu := item submenu asPMenuItem.
        ] ifFalse: [
            subMenu := WBPMenuItem new.
        ].
        subMenu isSeparator: (item style = MfSeparator).

        item contents notNil ifTrue: [
            subMenu title: (item contents upTo: Tab).
        ] ifFalse: [
            subMenu title: '--------'
        ].
        (item selector isMessage and: [
            item selector receiver isKindOf: WBAction]) ifTrue: [
            item selector receiver receiver: nil
        ].
        subMenu selector: item selector.

        accelArray := accel at: i.
        accelArray notNil ifTrue: [
            subMenu accelerator: (
                WBKeyAccel new
                    accelArray: accelArray;
                    yourself
            ).
        ].
        pMenu addChild: subMenu.
     ].

    ^pMenu!    !

!CursorManager class methods !   
leftRight

    "Added by OSI"
    #addedByOSI.
    ^CursorConstants at: 'LeftRight'!    !

!CursorManager class methods !   
corner

    "Added by OSI"
    #addedByOSI.
    ^CursorConstants at: 'Corner'!  !

!CursorManager class methods !   
initialize

    "Modified by OSI to support additional cursors."

        "Private - Fill the Cursors dictionary with available cursors."
    #modifiedByOSI.
    Cursor handle: nil.
    CursorConstants at: 'HourGlass'
        put: (self new handle: (
            self getWinCursor: IdcWait)).
    CursorConstants at: 'Arrow'
        put: (self new handle: (
            self getWinCursor: IdcArrow)).
    CursorConstants at: 'Normal'
        put: self new .
    CursorConstants at: 'Text'
        put: (self new handle: (
            self getWinCursor: IdcIbeam)).
    CursorConstants at: 'CrossHair'
        put: (self new handle: (
            self getWinCursor: IdcCross)).

    CursorConstants at: 'Origin'
        put: (self new handle: (
            self getWinCursor: IdcSizenesw)).
    CursorConstants at: 'Corner'
        put: (self new handle: (
            self getWinCursor: IdcSizenwse)).
    CursorConstants at: 'LeftRight'
        put: (self new handle: (
            self getWinCursor: IdcSizewe)).
    CursorConstants at: 'UpDown'
        put: (self new handle: (
            self getWinCursor: IdcSizens)).!  !

!CursorManager class methods !   
upDown

    "Added by OSI"
    #addedByOSI.
    ^CursorConstants at: 'UpDown'!  !

!ViewManager class methods ! 
wbCreatedClasses

    "Added by OSI"
    #addedByOSI.
    ^self allSubclasses select: [ :c |
        c wbCreated
    ].!  !

!ViewManager class methods ! 
isScratchWindow

    "Added by OSI"
    #addedByOSI.
    ^false!    !

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

!Bitmap class methods !  
buttonWidth: w height: h
    "Added by OSI - Create a new tool bar button bitmap template"
    | button |
    #addedByOSI.
    button := self screenWidth: w * 2 height: h.
    button pen
        fill: (ColorConstants at: 'ClrPalegray');
        foreColor: (ColorConstants at: 'ClrBlack');
        lineFrom: 1@0 to: (w - 1)@0;
        lineFrom: (w + 1)@0 to: (2 * w - 1)@0;
        lineFrom: (2 * w - 1)@1 to: (2 * w - 1)@(h - 1);
        lineFrom: 1@(h - 1) to: (w - 1)@(h - 1);
        lineFrom: (w + 1)@(h - 1) to: (2 * w - 1)@(h - 1);
        lineFrom: 0@1 to: 0@(h - 1);
        lineFrom: (w - 1)@1 to: (w - 1)@(h - 1);
        lineFrom: w@1 to: w@(h - 1);
        foreColor: (ColorConstants at: 'ClrWhite');
        lineFrom: 1@1 to: 1@(h - 2);
        lineFrom: 2@1 to: (w - 2)@1;
        foreColor: (ColorConstants at: 'ClrDarkgray');
        lineFrom: 1@(h - 2) to: (w - 1)@(h - 2);
        lineFrom: 2@(h - 3) to: (w - 1)@(h - 3);
        lineFrom: (w - 2)@1 to: (w - 2)@(h - 2);
        lineFrom: (w - 3)@2 to: (w - 3)@(h - 2);
        lineFrom: (w + 1)@1 to: (w + 1)@(h - 1);
        lineFrom: (w + 2)@1 to: (2 * w - 1)@1;
        lineFrom: (w + 2)@2 to: (w + 2)@(h - 1);
        lineFrom: (w + 3)@2 to: (2 * w - 1)@2.
    ^button!  !

!MessageBox class methods !  
yesNoCancelTitled: title text: text

    "Added by OSI"

    | r |
    #addedByOSI.
    r := self titled: title withText: text style: MbYesnocancel | MbIconquestion.

    r = 6 ifTrue: [
        ^#yes
    ] ifFalse: [
        r = 7 ifTrue: [
            ^#no
        ] ifFalse: [
            ^nil
        ].
    ].! !

!MessageBox class methods !  
messageNote: aString

    "Added by OSI  to avoid the 'Information' title"
    #addedByOSI.
    ^((self
        titled: ''
        withText: aString
        style: MbOk | MbIconinformation) = Idyes)!  !

!WinDialogInfo class methods !   
itemTemplateStyle: style x: x y: y cx: cx cy: cy id: id className: className text: text
        "Private - Calculate the size of a dialog item template
         and answer a new item template with attributes
         set from the arguments."
    |size dlgItemTemplate extraDataSizeOffset textOffset|

    size := 14.         "Base DLGITEMTEMPLATE size"
    textOffset := size := size + className size + 1.
    extraDataSizeOffset := size := size + text size +1.
    size := size + 1.

    dlgItemTemplate := self new: size.
    dlgItemTemplate uShortAtOffset: 0 put: x.
    dlgItemTemplate uShortAtOffset: 2 put: y.
    dlgItemTemplate uShortAtOffset: 4 put: cx.
    dlgItemTemplate uShortAtOffset: 6 put: cy.
    dlgItemTemplate uShortAtOffset: 8 put: id.
    dlgItemTemplate uLongAtOffset: 10 put: style.

    "OSI - For default controls we needed to use a numeric value, not a string,
     since Borland's Resource Workshop doesn't honor string class names for built-in
     controls."
    #modifiedByOSI.
    className isInteger ifTrue: [
        dlgItemTemplate byteAtOffset: 14 put: className asParameter.
    ] ifFalse: [
        dlgItemTemplate bytesAtOffset: 14 put: className asParameter.
    ].
    dlgItemTemplate bytesAtOffset: textOffset put: text asParameter.
    dlgItemTemplate byteAtOffset: extraDataSizeOffset put: 0.

    ^dlgItemTemplate!  !
"construct application"
((Smalltalk at: #CPApplication ifAbsent: [])
    isKindOf: Class) ifTrue: [
        ((Smalltalk at: #CPApplication) for:'WindowBuilder Pro/V Windows 1.0.6')
            addClass: CPBitmapManager;
            addClass: WBFileSelectorEditor;
            addClass: PStaticGraphic;
            addClass: PGroupBox;
            addClass: PGroupbox;
            addClass: WBTabEditor;
            addClass: PFormattedEntryField;
            addClass: WBFramingEditor;
            addClass: WBChoosePaneDialog;
            addClass: PWBInvisibleGroupPane;
            addClass: CPCreateButton;
            addClass: WBGroupBox;
            addClass: WBTopPane;
            addClass: WBFramingParameters;
            addClass: PRadioButtonGroup;
            addClass: WBActionEditor;
            addClass: WBInvisibleGroupPane;
            addClass: PWBVerticalScrollBar;
            addClass: WBFramerExample;
            addClass: WBCompositePaneScratchWindow;
            addClass: PCompositePane;
            addClass: WBDefaultDialogScratchWindow;
            addClass: WBStatusPaneEditor;
            addClass: WB3DFrame;
            addClass: PGenericSubpane;
            addClass: PEnhancedEntryField;
            addClass: ButtonEditor;
            addClass: GraphicObject;
            addClass: PStaticBox;
            addClass: WBVerticalScrollBar;
            addClass: FrameObject;
            addClass: WindowFrameObject;
            addClass: PTextEdit;
            addClass: WBPMenubar;
            addClass: PDrawnButton;
            addClass: InterfaceObject;
            addClass: WBMDIAttributesEditor;
            addClass: WBTabPosition;
            addClass: PEntryField;
            addClass: WBMenuTester;
            addClass: WBDefaultScratchWindow;
            addClass: WBLayoutPane;
            addClass: WBScrapbookRetrieve;
            addClass: PCheckBox;
            addClass: WBScratchWindow;
            addClass: WBListEntryField;
            addClass: BitEditor;
            addClass: PToggle;
            addClass: PEntryFieldGroup;
            addClass: PAnimationPane;
            addClass: WBMultiListChooser;
            addClass: PButton;
            addClass: WBKeyEntryField;
            addClass: WBDefaultCompositePaneScratchWindow;
            addClass: PComboBox;
            addClass: PCPStaticGraphic;
            addClass: PCheckBoxGroup;
            addClass: PMultipleSelectListBox;
            addClass: WBScrollingPane;
            addClass: WBToolBarEditor;
            addClass: WBMenubarEditor;
            addClass: TextEditWindow;
            addClass: WBDialogEditor;
            addClass: PScrollBar;
            addClass: CompositeFrameObject;
            addClass: WBPMenu;
            addClass: PThreeStateButton;
            addClass: WBTreeNode;
            addClass: WBMenuEditor;
            addClass: PListBox;
            addClass: PLinkButton;
            addClass: PRadioButton;
            addClass: PWBToolBar;
            addClass: WBListEditor;
            addClass: WBTreeListBox;
            addClass: WBChooseClassDialog;
            addClass: WBDialogScratchWindow;
            addClass: WBCreateClassDialog;
            addClass: WBTabOrderLayoutPane;
            addClass: WBAddInManager;
            addClass: WBEnhancedEntryFieldEditor;
            addClass: CPCreateBitmap;
            addClass: WBHorizontalScrollBar;
            addClass: WBStaticTextEditor;
            addClass: WBScrapbookStore;
            addClass: WBRealLayoutPane;
            addClass: WBPMenuItem;
            addClass: WBAboutDialog;
            addClass: PWBHorizontalScrollBar;
            addClass: PGraphPane;
            addClass: WBColorDialog;
            addClass: WBAttributeEditor;
            addClass: PActionButton;
            addClass: WBKeyAccel;
            addClass: PStatusPane;
            addClass: WBLinkEditor;
            addClass: WBWindowEditor;
            addClass: WBScrollBarEditor;
            addClass: WBTextPane;
            addClass: PListPane;
            addClass: PStaticText;
            addClass: WindowBuilder;
            addClass: PTextPane;
            addClass: WBMultiToolPalette;
            addClass: WBMDIAttributes;
            addClass: WBListChooser;
            addMethod: #leftRight forClass: CursorManager class;
            addMethod: #corner forClass: CursorManager class;
            addMethod: #initialize forClass: CursorManager class;
            addMethod: #upDown forClass: CursorManager class;
            addMethod: #wbCreatedClasses forClass: ViewManager class;
            addMethod: #isScratchWindow forClass: ViewManager class;
            addMethod: #fromStream: forClass: Bitmap class;
            addMethod: #buttonWidth:height: forClass: Bitmap class;
            addMethod: #yesNoCancelTitled:text: forClass: MessageBox class;
            addMethod: #messageNote: forClass: MessageBox class;
            addMethod: #itemTemplateStyle:x:y:cx:cy:id:className:text: forClass: WinDialogInfo class;
            addMethod: #tabPosition: forClass: Window;
            addMethod: #setStyle: forClass: Window;
            addMethod: #getId forClass: Window;
            addMethod: #nameForInstVar: forClass: Window;
            addMethod: #extent: forClass: Window;
            addMethod: #numberOfItems forClass: WinDialogInfo;
            addMethod: #readFrom: forClass: WinDialogInfo;
            addMethod: #items forClass: WinDialogInfo;
            addMethod: #extent forClass: WinDialogInfo;
            addMethod: #style forClass: WinDialogInfo;
            addMethod: #text forClass: WinDialogInfo;
            addMethod: #origin forClass: WinDialogInfo;
            addMethod: #text forClass: ComboBox;
            addMethod: #asQuotedString forClass: String;
            addMethod: #asMessage forClass: String;
            addMethod: #hasContent forClass: String;
            addMethod: #upTo: forClass: String;
            addMethod: #mnemonicChar forClass: String;
            addMethod: #menuWindow forClass: ViewManager;
            addMethod: #showHelp: forClass: StaticText;
            addMethod: #setSharedPools: forClass: Class;
            addMethod: #asPresentableString forClass: Symbol;
            addMethod: #asCUAPresentableString forClass: Symbol;
            addMethod: #extentFromRightTop: forClass: Point;
            addMethod: #extentFromCenterTop: forClass: Point;
            addMethod: #nextFourBytes forClass: ReadWriteStream;
            addMethod: #nextTwoBytes forClass: ReadWriteStream;
            addMethod: #isWBClassBrowser forClass: ClassHierarchyBrowser;
            addMethod: #openSelecting: forClass: ClassHierarchyBrowser;
            addMethod: #selectedMethod forClass: ClassHierarchyBrowser;
            addMethod: #selectedClass forClass: ClassHierarchyBrowser;
            addMethod: #nextString: forClass: Stream;
            addMethod: #pointFromUser:offset: forClass: Screen;
            addMethod: #isWBClassBrowser forClass: Object;
            addMethod: #isInterfaceObject forClass: Object;
            addMethod: #isWBInternalClass forClass: Object;
            addMethod: #localizeRect: forClass: Rectangle;
            addMethod: #centerTop forClass: Rectangle;
            addMethod: #offsetFromLeftTop: forClass: Rectangle;
            addMethod: #unLocalizeRect: forClass: Rectangle;
            addMethod: #moveToLeftTop: forClass: Rectangle;
            addMethod: #logicalBytes forClass: Font;
            addMethod: #italic forClass: Font;
            addMethod: #wbEquals: forClass: Font;
            addMethod: #bold: forClass: Font;
            addMethod: #portableStoreOn:indentString: forClass: Font;
            addMethod: #nonPortableStoreOn:indentString: forClass: Font;
            addMethod: #underscore forClass: Font;
            addMethod: #storeOn:indentString: forClass: Font;
            addMethod: #strikeOut forClass: Font;
            addMethod: #handlers forClass: TopPane;
            addMethod: #realHandlers forClass: SubPane;
            addMethod: #handlers: forClass: SubPane;
            addMethod: #storeOnStream: forClass: Bitmap;
            addMethod: #fromSysID: forClass: Bitmap;
            addMethod: #cpCopy forClass: Bitmap;
            addMethod: #addMenuItem: forClass: TextWindow;
            addMethod: #openIcon: forClass: UserDLL;
            addMethod: #drawFocusRect:rectangle: forClass: UserDLL;
            addMethod: #asOrderedCollectionRecursively forClass: Array;
            addMethod: #performMenuItem: forClass: MenuWindow;
            addMethod: #asWBPMenuBar forClass: MenuWindow;
            addMethod: #asWBPMenu forClass: MenuWindow;
            addMethod: #wbMenuTitled: forClass: MenuWindow;
            addMethod: #tmUnderline forClass: WinTextMetrics;
            addMethod: #tmStrikeOut forClass: WinTextMetrics;
            addMethod: #asString forClass: ByteArray;
            addMethod: #menuWindow: forClass: ApplicationWindow;
            addMethod: #label forClass: ApplicationWindow;
            addMethod: #isFraction forClass: Number;
            addMethod: #realHandlers forClass: TextPane;
            addMethod: #drawRect3DLight: forClass: Pen;
            addMethod: #buttonHighlight forClass: Pen;
            addMethod: #drawRect3D: forClass: Pen;
            addMethod: #open forClass: AboutDialog;
            addMethod: #insertItemDynamically:selector:atIndex: forClass: Menu;
            addMethod: #asWBPMenu forClass: Menu;
            addMethod: #removeItemDynamically: forClass: Menu;
            addMethod: #removeAllItemsDynamically forClass: Menu;
            addMethod: #asPMenuItem forClass: Menu;
            comments: 'This file contains the source code for WindowBuilder Pro/V Windows 1.0.6.
Use the ''File | Install..'' command to install this product.

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
            initCode: '
    | srcDir path class |

    ((Smalltalk product = ''Smalltalk/V Windows'' or: [Smalltalk product = ''Smalltalk Express'']) and: [Smalltalk version = ''2.0'']) ifFalse: [
        MessageBox message: ''This version of WindowBuilder Pro requires Smalltalk Express.
A walkback follows.''.
        self error: ''Wrong Smalltalk/V Platform/Version''
    ].

    Transcript cr; show: ''This will take awhile. Please do not interrupt the installation.''.
    (Smalltalk includesKey: #IconEditor) ifFalse: [
        Transcript cr; show: ''*** In order to edit icons for windows you must install the IconEditor.''.
        Transcript cr; show: ''*** It can be found in EXAMPLES\ICONEDIT (ICONEDIT.ST).''.
    ].
    (Smalltalk includesKey: #ObjectFiler) ifFalse: [
        Transcript cr; show: ''*** In order to load and save scrapbooks you must install ObjectFiler.''.
        Transcript cr; show: ''*** It can be found in EXTRAS\OBJFILER (VWOBJFLR.ST).''.
    ].

    File allInstances do: [ :f |
        (f name notNil and: [ f name asLowerCase = ''wbpro.st'' ]) ifTrue: [
            srcDir := f directory drivePathName, ''\''.
        ].
    ].
    srcDir isNil ifTrue: [
        srcDir := Directory current drivePathName, ''\''.
    ].
    (Smalltalk includesKey: #MDISystem) ifFalse: [
        Transcript cr; show: ''*** In order to use MDI you must install MDI support.''.
        Transcript cr; show: ''*** It can be found in EXTRAS\MDI (MDI.ST).''.
        Transcript cr; show: ''*** Also load MDIPATCH.ST from '',srcDir.
    ].

    #(''WBBMP.DCT'' ''BITMAPS.BDT'' ''SCRAP.SBK'') do: [ :file |
        (File exists: srcDir, file) ifFalse: [
            MessageBox message: ''Cannot find the file: '',file,''. The installation will be aborted.
A walkback follows.''.
            self error: ''Cannot find the file: '',file
       ].
    ].

    Smalltalk at: #CPSrcDir put: srcDir.

    Smalltalk at: #PWindowBuilder put: nil.

    Smalltalk at: #WindowBuilderVersion put:  ''Version 1.0.6\Smalltalk Express'' withCrs.
    Smalltalk at: #WindowLabelPrefix put: ''Smalltalk Express''.
    Smalltalk at: #AcuFont put: nil.
    Smalltalk at: #WBConstants put: WinConstants.
    Smalltalk at: #PMToWinKeyMap put: Dictionary new.
    Smalltalk at: #WinToPMKeyMap put: Dictionary new.
    WinConstants at: ''ColorBtnhighlight'' put: 20.
    ColorConstants at: ''ClrChiseledgray'' put: -1.

    (Smalltalk includesKey: #WindowBuilder) ifTrue: [
        (Smalltalk at: #WindowBuilder)
            removeSelector: #pane:;
            removeSelector: #initInstVars.
    ].

    Smalltalk at: #WindowBuilderUser put: ''''.
    Smalltalk at: #WindowBuilderCompany put: ''''.
    Smalltalk at: #WindowBuilderSerialNumber put: ''''.

    (File pathName: srcDir, ''runtime.st'') fileIn; close.

    Transcript cr; show: ''Loading WindowBuilder Pro Bitmaps...''.
    (Smalltalk at: #CPBitmapDict) loadSystemBitmaps: ''wbbmp.dct''.
    (Smalltalk at: #CPBitmapDict) addBitmaps: ''bitmaps.bdt''.
    Transcript cr; show: ''WindowBuilder Pro Bitmaps Loaded.''.

    Transcript cr; show: ''Installing WindowBuilder Pro Classes...''.




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

    Smalltalk at: #PWindowBuilder put: WindowBuilder.

    (Smalltalk includesKey: #CPSubPane) ifTrue: [
        PWindowBuilder
            addInSubPanes: nil;
            clearWBClasses;
            initProperties.
    ].

    PWindowBuilder startup.

    PWindowBuilder scrapbookLoadFile: CPSrcDir,''scrap.sbk''.
    (Smalltalk includesKey: #MDISystem) ifTrue: [
        (File pathName: CPSrcDir, ''mdipatch.st'') fileIn; close.
    ].
    (Smalltalk includesKey: #IconEditor) ifTrue: [
        (File pathName: CPSrcDir, ''wbiconed.st'') fileIn; close.
    ].
    CPBitmapManager addToolbarTool.
    (Smalltalk version first = $2) ifTrue: [
        CPBitmapManager screenIcon.
    ].

    Smalltalk removeKey: #CPSrcDir.

    PWindowBuilder aboutWB.



';
            fileName: 'wbpro.st';
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

    Smalltalk at: #PWindowBuilder put: WindowBuilder.

    (Smalltalk includesKey: #CPSubPane) ifTrue: [
        PWindowBuilder
            addInSubPanes: nil;
            clearWBClasses;
            initProperties.
    ].

    PWindowBuilder startup.

    PWindowBuilder scrapbookLoadFile: CPSrcDir,'scrap.sbk'.
    (Smalltalk includesKey: #MDISystem) ifTrue: [
        (File pathName: CPSrcDir, 'mdipatch.st') fileIn; close.
    ].
    (Smalltalk includesKey: #IconEditor) ifTrue: [
        (File pathName: CPSrcDir, 'wbiconed.st') fileIn; close.
    ].
    CPBitmapManager addToolbarTool.
    (Smalltalk version first = $2) ifTrue: [
        CPBitmapManager screenIcon.
    ].

    Smalltalk removeKey: #CPSrcDir.

    PWindowBuilder aboutWB.



!

 
    Transcript cr; show: 'WindowBuilder Pro/V Windows 1.0.6 installed.'!
