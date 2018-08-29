"
******************************************************************************
Application : MDI-specific Code
Date        : Sep 13, 1996
Time        : 17:18:43

Introduction
============

This file contains the addition code needed to use MDI support with WindowBuilder Pro.

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
    WBMDIChild 

Methods : 
StatusPane>>isWsGroup
StatusPane>>initSize:
StatusPane>>rightJustifiedFixed
StatusPane>>framingBlock:
StatusPane>>leftJustifiedFixed
StatusPane>>justified
StatusPane>>startGroup
StatusPane>>tabStop
MDIFrame>>isMDIFrame
MDIFrame>>activate
ViewManager>>mdiCloseAll
ViewManager>>topPaneClass
ViewManager>>mdiCascade
ViewManager>>mdiTile
ViewManager>>frame
ViewManager>>mdiArrange
MDIChild>>autoCascadeTolerance
MDIChild>>closeView
MDIChild>>initMdiWindowSize
MDIChild>>defaultFrameStyle
MDIChild>>frameStyleFromPStyle
StatusBox>>storeOn:indentString:

******************************************************************************
"!

"Initialize"
  
    Transcript cr; show: 'Installing MDI-specific Code...'.!

  
    (Smalltalk includesKey: #MDISystem) ifFalse: [
        MessageBox message: 'You must have MDI support loaded to use this patch file. Install it and then reload this file.
A walkback follows.'.
        self error: 'MDI must be loaded first.'
    ].

!

MDIChild subclass: #WBMDIChild
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WBConstants '!




!WBMDIChild class methods ! !



!WBMDIChild methods !

wmMouseactivate: wParam with: lParam
        "Private - If mouse has been clicked on an inactive
         window, select it."
    self mainWindow mdiSelected: true.
    ^MaActivate! !


!StatusPane methods !
isWsGroup
    "Added by OSI"
    #addedByOSI.
    ^true! !

!StatusPane methods !
initSize: aRectangle
    "Added by OSI"
    | fp |
    #addedByOSI.
    (self parent isMDIFrame not and: [
    (fp := self propertyAt: #wbFramer) notNil]) ifTrue: [
        super framingBlock: fp
    ].
    super initSize: aRectangle!  !

!StatusPane methods !
rightJustifiedFixed
    "Added by OSI"
    #addedByOSI.
    self
        rightJustified;
        fixedSize!    !

!StatusPane methods !
framingBlock: aBlock
    "Added by OSI"
    #addedByOSI.
    aBlock isContext ifTrue: [
        super framingBlock: aBlock
    ] ifFalse: [
        self propertyAt: #wbFramer put: aBlock
    ].!   !

!StatusPane methods !
leftJustifiedFixed
    "Added by OSI"
    #addedByOSI.
    self
        leftJustified;
        fixedSize!  !

!StatusPane methods !
justified

    #addedByOSI.
    ^justified!  !

!StatusPane methods !
startGroup
    "Added by OSI because StatusPanes may not be tabstops"
    #addedByOSI!    !

!StatusPane methods !
tabStop
    "Added by OSI because StatusPanes may not be tabstops"
    #addedByOSI!   !

!MDIFrame methods !  
isMDIFrame

    "Added by OSI to improve speed in NotificationManager>>activeWindow"
    #addedByOSI.
    ^true!    !

!MDIFrame methods !  
activate
    "Modified by OSI"
        "Private - The receiver was activated."

    | focusWindow |

    self isHandleOk ifFalse:[^self].

    self owner isWBWindow ifTrue: [
        #modifiedByOSI.
        focusWindow := self mdiGetActive.
        focusWindow isNil ifTrue: [ ^super activate ].
        focusWindow := focusWindow propertyAt: #focusWindow.
        ((focusWindow notNil and: [ self isActive ]) and: [ self minimized not ]) ifTrue: [
            focusWindow setFocus.
            self event: #activate.
            ^children notNil ifTrue:[
                children do:[ :i| i activate]
            ]
        ].
    ].

    super activate.!   !

!ViewManager methods !   
mdiCloseAll
    "Added by OSI. Close all MDI documents
     which are not minimized."
    #addedByOSI.
    self frame mdiCloseAll!  !

!ViewManager methods !   
topPaneClass
    "Modified by OSI to support opening any window
     as an MDI parent or child"
        "Private - Answer the default top pane class."
    #modifiedByOSI.
    Smalltalk isRunTime ifFalse:[
        MDISystem isActive ifTrue:[^MDIChild]].
    ^Smalltalk at: #TopPaneClass ifAbsent: [ TopPane ].!    !

!ViewManager methods !   
mdiCascade
    "Added by OSI. Cascade the MDI documents."
    #addedByOSI.
    self frame mdiCascade!    !

!ViewManager methods !   
mdiTile
    "Added by OSI. Tile the MDI documents."
    #addedByOSI.
    self frame mdiTile! !

!ViewManager methods !   
frame
        "Answer the receiver's frame if any."

    #modifiedByOSI.
    self mainView isMDIFrame ifTrue: [ ^self mainView ].
    self mainView isMDIChild ifFalse:[^nil].
    ^self mainView frame!  !

!ViewManager methods !   
mdiArrange
    "Added by OSI. Arrange the MDI documents."
    #addedByOSI.
    self frame mdiArrange!    !

!MDIChild methods !  
autoCascadeTolerance

    ^1@1!   !

!MDIChild methods !  
closeView
    "Private - Close the receiver and all its children."

    |answer active max|

    self isHandleOk ifFalse: [^self]. "already closed"
    #modifiedByOSI.

    answer:=super closeView.
    answer isNil ifTrue:[
        ^nil].

    owner removeView: self.
    self frame childClose.
    self frame renumber:self.
    active:=self frame mdiGetActive.
    active isNil ifTrue:[self setInitMenu].

    self updateClient.

    ^answer! !

!MDIChild methods !  
initMdiWindowSize
    "Modified by OSI with thanks to Robert Gurrieri"
        "Private-Answer the default size of a document."
    |rect extent origin sizeRect offset |

    #modifiedByOSI.
    rect:=self frame mdiClient rectangle.

    "if framingBlock notNil, use it for initial rectangle."
    framingBlock notNil  ifTrue: [
        "If the corner is set to 0@0 use an offset"
        sizeRect := framingBlock value: rect.
        sizeRect leftTop < self autoCascadeTolerance ifTrue: [
            offset := (UserLibrary getSystemMetrics: SmCysize) +
                (UserLibrary getSystemMetrics: SmCyframe).
            ^sizeRect moveTo: ((self frame mdiChildren size - 1) * (offset @ offset))
        ] ifFalse: [
            ^sizeRect
        ].
    ] ifFalse: [
        extent := (rect width * 24 // 25) @ (rect height * 24 // 25).
        extent := extent - ((self frame mdiChildren size - 1) * ( 8 @ 8)).
        origin :=(self frame mdiChildren size - 1) * (8 @ 8).
        ^origin extent: extent
    ].!    !

!MDIChild methods !  
defaultFrameStyle

    "Modified by OSI to allow for setting a specific style from a
     ViewManager"

        "Private - Answer the default frame style for the receiver."
    | fs |

    ((self respondsTo: #frameStyleFromPStyle) and: [ (fs := self frameStyleFromPStyle) notNil ]) ifTrue: [
        #modifiedByOSI.
        ^fs
    ].

    ^WsMaximizebox |
        WsMinimizebox |
        WsThickframe |
        WsSysmenu |
        WsCaption |
        WsChild |
        WsClipsiblings |
        WsBorder!    !

!MDIChild methods !  
frameStyleFromPStyle

    "Added by OSI"

    | s pStyle |


    (pStyle := self pStyle) isNil ifTrue: [
        #addedByOSI.
        ^nil
    ].

    s := WsChild | WsClipsiblings.

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
    ].

    ^s!  !

!StatusBox methods ! 
storeOn: aStream indentString: indentString
    "Added by OSI"
    | indent theHeader |

    #addedByOSI.
    indent := indentString, '    '.

    aStream nextPutAll: indentString, self class name, ' new'.
    aStream cr; nextPutAll: indent, 'space: ', self space asString.

    self width > 0 ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: indent, 'width: ', self width asString.
    ].
    (self contents notNil and: [ self contents hasContent ]) ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: indent, 'contents: ', self contents asQuotedString.
    ].
    (self name notNil and: [ self name hasContent ]) ifTrue: [
        aStream nextPutAll: ';'; cr; nextPutAll: indent, 'name: #', self name asString.
    ].! !
"construct application"
((Smalltalk at: #CPApplication ifAbsent: [])
    isKindOf: Class) ifTrue: [
        ((Smalltalk at: #CPApplication) for:'MDI-specific Code')
            addClass: WBMDIChild;
            addMethod: #isWsGroup forClass: StatusPane;
            addMethod: #initSize: forClass: StatusPane;
            addMethod: #rightJustifiedFixed forClass: StatusPane;
            addMethod: #framingBlock: forClass: StatusPane;
            addMethod: #leftJustifiedFixed forClass: StatusPane;
            addMethod: #justified forClass: StatusPane;
            addMethod: #startGroup forClass: StatusPane;
            addMethod: #tabStop forClass: StatusPane;
            addMethod: #isMDIFrame forClass: MDIFrame;
            addMethod: #activate forClass: MDIFrame;
            addMethod: #mdiCloseAll forClass: ViewManager;
            addMethod: #topPaneClass forClass: ViewManager;
            addMethod: #mdiCascade forClass: ViewManager;
            addMethod: #mdiTile forClass: ViewManager;
            addMethod: #frame forClass: ViewManager;
            addMethod: #mdiArrange forClass: ViewManager;
            addMethod: #autoCascadeTolerance forClass: MDIChild;
            addMethod: #closeView forClass: MDIChild;
            addMethod: #initMdiWindowSize forClass: MDIChild;
            addMethod: #defaultFrameStyle forClass: MDIChild;
            addMethod: #frameStyleFromPStyle forClass: MDIChild;
            addMethod: #storeOn:indentString: forClass: StatusBox;
            comments: 'This file contains the addition code needed to use MDI support with WindowBuilder Pro.

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
            initCode: '    (Smalltalk includesKey: #MDISystem) ifFalse: [
        MessageBox message: ''You must have MDI support loaded to use this patch file. Install it and then reload this file.
A walkback follows.''.
        self error: ''MDI must be loaded first.''
    ].

';
            finalizeCode: nil;
            fileName: 'mdipatch.st';
            startUpCode: nil]!
