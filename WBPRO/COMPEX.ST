"
******************************************************************************
Application : Composite Pane Examples
Date        : Sep 13, 1996
Time        : 17:26:34

Introduction
============

CompositePane Examples

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
    ListEditorPane WBObject WBName WBPerson OkCancelPane 
    NamePane AddressPaneTester AddressPane 
    DictionaryEditorPane AddressEditorPane WBAddress 
    PersonEditorPane PersonPane PersonPaneTester 

Methods : 
WindowBuilder class>>addInCompositePaneExamples:

******************************************************************************
"!

CompositePane subclass: #ListEditorPane
  instanceVariableNames: 
    'list listbox item '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

Object subclass: #WBObject
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!

WBObject subclass: #WBName
  instanceVariableNames: 
    'first middle last '
  classVariableNames: ''
  poolDictionaries: ''!

WBObject subclass: #WBPerson
  instanceVariableNames: 
    'name address sex '
  classVariableNames: ''
  poolDictionaries: ''!

CompositePane subclass: #OkCancelPane
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

CompositePane subclass: #NamePane
  instanceVariableNames: 
    'name '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

ViewManager subclass: #AddressPaneTester
  instanceVariableNames: 
    'address '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

CompositePane subclass: #AddressPane
  instanceVariableNames: 
    'address '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

CompositePane subclass: #DictionaryEditorPane
  instanceVariableNames: 
    'dictionary listEditor detail '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

DictionaryEditorPane subclass: #AddressEditorPane
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

WBObject subclass: #WBAddress
  instanceVariableNames: 
    'street1 street2 city state zip '
  classVariableNames: ''
  poolDictionaries: ''!

DictionaryEditorPane subclass: #PersonEditorPane
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

CompositePane subclass: #PersonPane
  instanceVariableNames: 
    'person '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!

ViewManager subclass: #PersonPaneTester
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants WBConstants '!




!ListEditorPane class methods !
   
supportedEvents
        "Private - Answer the events supported by this subpane."
    ^super supportedEvents
        add: #listChanged;
        add: #itemChanged;
        add: #itemChanging;
        add: #select;
        yourself!

wbCreated

    ^true! !



!ListEditorPane methods !
  
add: aPane

    self contents add: item contents.
    listbox contents: list.
    self event: #listChanged!
 
addSubpanes
    (self
        yourself;
            framingBlock: ( FramingParameters new iDUE: 741 @ 336; xC; yC; cRDU: (2 @ 334 rightBottom: 738 @ 2));
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 521 @ 48; lDU: 9 r: #left; rDU: 206 r: #right; tDU: 8 r: #top; bDU: 56 r: #top; indent: 3 @ 4);
                    paneName: 'item';
                    startGroup;
                    tabStop;
                    yourself
            );
            addSubpane: (
                ListBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 521 @ 248; lDU: 9 r: #left; rDU: 206 r: #right; tDU: 72 r: #top; bDU: 12 r: #bottom);
                    paneName: 'list';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getList:;
                    when: #select perform: #select:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 197 r: #right; rDU: 14 r: #right; tDU: 8 r: #top; bDU: 64 r: #top);
                    paneName: 'add';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #add:;
                    contents: '&Add';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 197 r: #right; rDU: 14 r: #right; tDU: 72 r: #top; bDU: 128 r: #top);
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
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 197 r: #right; rDU: 14 r: #right; tDU: 136 r: #top; bDU: 192 r: #top);
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
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 197 r: #right; rDU: 14 r: #right; tDU: 200 r: #top; bDU: 256 r: #top);
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
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 197 r: #right; rDU: 14 r: #right; tDU: 264 r: #top; bDU: 320 r: #top);
                    paneName: 'sort';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #sort:;
                    contents: '&Sort';
                    yourself
            );
        yourself
    ).!
  
change: aPane

    listbox selection isNil ifTrue: [ ^nil ].
    self event: #itemChanging.
    list at: listbox selection put: self itemContents.
    listbox contents: list.
    self disable.
    self event: #itemChanged.
    self event: #listChanged.!
   
contents

    ^list ifNil: [ list := OrderedCollection new ].!

contents: aCollection

    list := aCollection asOrderedCollection.
    handle = NullHandle ifTrue: [^self].
    listbox contents: list.!
   
delete: aPane

    Notifier isAltDown
        ifTrue: [ list := OrderedCollection new ]
        ifFalse: [
            listbox selection isNil ifTrue: [ ^nil ].
            list removeIndex: listbox selection].
    listbox contents: list.
    self disable.
    self event: #listChanged!
 
disable

    (self paneNamed: 'insert') disable.
    (self paneNamed: 'change') disable.
    (self paneNamed: 'delete') disable.
    item setFocus.!
   
enable

    (self paneNamed: 'insert') enable.
    (self paneNamed: 'change') enable.
    (self paneNamed: 'delete') enable.!
   
getList: aPane

    aPane contents: self contents!

initWindow

    listbox := self paneNamed: 'list'.
    item := self paneNamed: 'item'.!
  
insert: aPane

    listbox selection isNil ifTrue: [ ^nil ].
    list add: item contents beforeIndex: listbox selection.
    listbox contents: list.
    self disable.
    self event: #listChanged!
  
item

    ^item!
  
itemContents

    ^item contents.!

select: aPane

    item contents: listbox selectedItem.
    self enable.
    self event: #select.!
  
selectedIndex

    ^listbox selectedIndex!

selectedItem

    ^listbox selectedItem!
  
selectIndex: index

    listbox selectIndex: index!
   
selection

    ^listbox selection!

selection: anObject

    listbox selection: anObject!
 
selectItem: aString

    listbox selectItem: aString!
 
sort: aPane

    list := list asSortedCollection asOrderedCollection.
    listbox contents: list.
    self event: #listChanged! !



!WBObject class methods ! !



!WBObject methods ! !



!WBName class methods ! !



!WBName methods !
 
first

    ^first ifNil: [ first := '' ]!
 
first: anString

    first := anString!
   
last

    ^last ifNil: [ last := '' ]!

last: anString

    last := anString!
 
middle

    ^middle ifNil: [ middle := '' ]!
  
middle: anString

    middle := anString!
 
printOn: aStream

    super printOn: aStream.
    aStream
        cr; nextPutAll: '    first: ',self first;
        cr; nextPutAll: '    middle: ',self middle;
        cr; nextPutAll: '    last: ',self last! !



!WBPerson class methods ! !



!WBPerson methods !
   
address

    ^address ifNil: [ address := WBAddress new ]!

address: anWBAddress

    address := anWBAddress!
 
fullName

    ^self name last,', ',self name first!
   
name

    ^name ifNil: [ name := WBName new ]!

name: anWBName

    name := anWBName!
 
printOn: aStream

    super printOn: aStream.
    aStream cr; nextPutAll: '    >'.
    self name printOn: aStream.
    aStream cr; nextPutAll: '    >'.
    self address printOn: aStream.
    aStream cr; nextPutAll: '    >sex: ',self sex!

sex

    ^sex ifNil: [ sex := #male ]!

sex: aSymbol

    sex := aSymbol! !



!OkCancelPane class methods !
  
supportedEvents
        "Private - Answer the events supported by this subpane."
    ^super supportedEvents
        add: #ok;
        add: #cancel;
        yourself!
  
wbCreated

    ^true! !



!OkCancelPane methods !

addSubpanes
    (self
        yourself;
            framingBlock: ( FramingParameters new iDUE: 311 @ 72; xC; yC; cRDU: (2 @ 70 rightBottom: 309 @ 2));
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 146 @ 64; lDU: 0 r: #left; rP: 32/67; tDU: 0 r: #top; bP: 16/17);
                    paneName: 'ok';
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
                    framingBlock: ( FramingParameters new iDUE: 146 @ 64; lP: 34/67; rP: 66/67; tDU: 0 r: #top; bP: 16/17);
                    paneName: 'cancel';
                    idCancel;
                    startGroup;
                    tabStop;
                    when: #clicked perform: #cancel:;
                    contents: 'Cancel';
                    yourself
            );
        yourself
    ).!
  
cancel: aPane

    "Callback for the #clicked event in the Button named 'cancel'.
     (Generated by WindowBuilder)"

    self event: #cancel!
 
ok: aPane

    "Callback for the #clicked event in the Button named 'ok'.
     (Generated by WindowBuilder)"

    self event: #ok! !



!NamePane class methods !
  
supportedEvents
        "Private - Answer the events supported by this subpane."
    ^super supportedEvents
        add: #nameChanged;
        yourself!

wbCreated

    ^true! !



!NamePane methods !

addSubpanes
    (self
        yourself;
            framingBlock: ( FramingParameters new iDUE: 658 @ 136; xC; yC; cRDU: (2 @ 134 rightBottom: 656 @ 2));
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 649 @ 128; lDU: 0 r: #left; rDU: 5 r: #right; tDU: 0 r: #top; bDU: 128 r: #top);
                    startGroup;
                    contents: 'Name';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 82 @ 32; lDU: 18 r: #left; rDU: 101 r: #left; tDU: 32 r: #top; bDU: 64 r: #top);
                    startGroup;
                    contents: 'First';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 46 @ 32; lDU: 229 r: #left; rDU: 274 r: #left; tDU: 32 r: #top; bDU: 64 r: #top);
                    startGroup;
                    contents: 'MI';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 73 @ 32; lDU: 302 r: #left; rDU: 375 r: #left; tDU: 32 r: #top; bDU: 64 r: #top);
                    startGroup;
                    contents: 'Last';
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 201 @ 48; lDU: 18 r: #left; rDU: 219 r: #left; tDU: 64 r: #top; bDU: 112 r: #top; indent: 3 @ 4);
                    paneName: 'first';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getFirstName:;
                    when: #textChanged perform: #setFirstName:;
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 64 @ 48; lDU: 229 r: #left; rDU: 293 r: #left; tDU: 64 r: #top; bDU: 112 r: #top; indent: 3 @ 4);
                    paneName: 'middle';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getMiddleInitial:;
                    when: #textChanged perform: #setMiddleInitial:;
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 329 @ 48; lDU: 302 r: #left; rDU: 23 r: #right; tDU: 64 r: #top; bDU: 112 r: #top; indent: 3 @ 4);
                    paneName: 'last';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getLastName:;
                    when: #textChanged perform: #setLastName:;
                    yourself
            );
        yourself
    ).!

contents

    ^self name!
 
contents: aWBName

    self name: aWBName!

getFirstName: aPane

    "Callback for the #getContents event in the EntryField named 'firstName'.
     (Generated by WindowBuilder)"

    aPane contents: self name first!

getLastName: aPane

    "Callback for the #getContents event in the EntryField named 'lastName'.
     (Generated by WindowBuilder)"

    aPane contents: self name last!
   
getMiddleInitial: aPane

    "Callback for the #getContents event in the EntryField named 'middleInitial'.
     (Generated by WindowBuilder)"

    aPane contents: self name middle!
   
name

    ^name ifNil: [ name := WBName new ]!

name: aWBName

    name := aWBName.

    self updateAll.

    self event: #nameChanged.!
  
setFirstName: aPane

    "Callback for the #textChanged event in the EntryField named 'firstName'.
     (Generated by WindowBuilder)"

    self name first: aPane contents.
    self event: #nameChanged.!

setLastName: aPane

    "Callback for the #textChanged event in the EntryField named 'lastName'.
     (Generated by WindowBuilder)"

    self name last: aPane contents.
    self event: #nameChanged.!
   
setMiddleInitial: aPane

    "Callback for the #textChanged event in the EntryField named 'middleInitial'.
     (Generated by WindowBuilder)"

    self name middle: aPane contents.
    self event: #nameChanged.!
   
updateAll

    #(first middle last) do: [ :item |
        (self paneNamed: item asString) contents:
            (self name perform: item)].! !



!AddressPaneTester class methods !

wbCreated

    ^true! !



!AddressPaneTester methods !
   
address

    ^address ifNil: [ address := WBAddress new ].!
   
address: aWBAddress

    address := aWBAddress!
   
createViews

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'AddressPane Tester';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 695 @ 416; xC; yC; cRDU: (9 @ 408 rightBottom: 686 @ 46));
            pStyle: #(sysmenu sizable titlebar minimize maximize);
            addSubpane: (
                AddressPane new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 658 @ 272; lDU: 9 r: #left; rDU: 667 r: #left; tDU: 8 r: #top; bDU: 280 r: #top);
                    paneName: 'address';
                    addSubpanes;
                    startGroup;
                    when: #getContents perform: #getAddress:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 155 @ 64; lDU: 9 r: #left; rDU: 165 r: #left; tDU: 288 r: #top; bDU: 352 r: #top);
                    paneName: 'new';
                    startGroup;
                    when: #clicked perform: #newAddress:;
                    contents: 'New';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 155 @ 64; lDU: 174 r: #left; rDU: 329 r: #left; tDU: 288 r: #top; bDU: 352 r: #top);
                    paneName: 'inspect';
                    startGroup;
                    when: #clicked perform: #inspectAddress:;
                    contents: 'Inspect';
                    yourself
            );
        yourself
    ).!

getAddress: aPane

    "Callback for the #getContents event in the AddressPane named 'address'.
     (Generated by WindowBuilder)"

    aPane contents: self address!
  
inspectAddress: aPane

    "Callback for the #clicked event in the Button named 'inspect'.
     (Generated by WindowBuilder)"

    (self paneNamed: 'address') contents inspect!
   
newAddress: aPane

    "Callback for the #clicked event in the Button named 'new'.
     (Generated by WindowBuilder)"

    (self paneNamed: 'address') contents: WBAddress new!

openOn: aWBAddress

    self address: aWBAddress.
    self open! !



!AddressPane class methods !
   
supportedEvents
        "Private - Answer the events supported by this subpane."
    ^super supportedEvents
        add: #addressChanged;
        yourself!
 
wbCreated

    ^true! !



!AddressPane methods !
 
address

    ^address ifNil: [ address := WBAddress new ]!

address: aWBAddress

    address := aWBAddress.

    self updateAll.

    self event: #addressChanged.!
   
addSubpanes
    (self
        yourself;
            framingBlock: ( FramingParameters new iDUE: 658 @ 280; xC; yC; cRDU: (2 @ 278 rightBottom: 656 @ 2));
            addSubpane: (
                GroupBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 654 @ 268; lDU: 0 r: #left; rDU: 0 r: #right; tDU: 8 r: #top; bDU: 0 r: #bottom);
                    startGroup;
                    contents: 'Address';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 110 @ 32; lDU: 18 r: #left; rDU: 128 r: #left; tDU: 56 r: #top; bDU: 88 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Street:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 82 @ 32; lDU: 46 r: #left; rDU: 128 r: #left; tDU: 168 r: #top; bDU: 200 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'City:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 91 @ 32; lDU: 251 r: #right; rDU: 160 r: #right; tDU: 168 r: #top; bDU: 200 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'State:';
                    yourself
            );
            addSubpane: (
                StaticText new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 73 @ 32; lDU: 55 r: #left; rDU: 128 r: #left; tDU: 224 r: #top; bDU: 256 r: #top);
                    rightJustified;
                    startGroup;
                    contents: 'Zip:';
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 496 @ 48; lDU: 135 r: #left; rDU: 23 r: #right; tDU: 48 r: #top; bDU: 96 r: #top; indent: 3 @ 4);
                    paneName: 'street1';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getStreet1:;
                    when: #textChanged perform: #setStreet1:;
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 496 @ 48; lDU: 135 r: #left; rDU: 23 r: #right; tDU: 104 r: #top; bDU: 152 r: #top; indent: 3 @ 4);
                    paneName: 'street2';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getStreet2:;
                    when: #textChanged perform: #setStreet2:;
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 256 @ 48; lDU: 135 r: #left; rDU: 263 r: #right; tDU: 160 r: #top; bDU: 208 r: #top; indent: 3 @ 4);
                    paneName: 'city';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getCity:;
                    when: #textChanged perform: #setCity:;
                    yourself
            );
            addSubpane: (
                WBComboBox new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 128 @ 236; lDU: 151 r: #right; rDU: 23 r: #right; tDU: 160 r: #top; bDU: 396 r: #top);
                    paneName: 'state';
                    contents: #( 'CA' 'DC' 'MA' 'MD' 'NJ' 'NY' 'OR' 'TX' 'VA' 'WA' );
                    dropDownList;
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getState:;
                    when: #select perform: #setState:;
                    yourself
            );
            addSubpane: (
                WBEntryField new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 256 @ 48; lDU: 135 r: #left; rDU: 263 r: #right; tDU: 216 r: #top; bDU: 264 r: #top; indent: 3 @ 4);
                    paneName: 'zip';
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getZip:;
                    when: #textChanged perform: #setZip:;
                    yourself
            );
        yourself
    ).!
  
contents

    ^self address!
  
contents: aWBAddress

    self address: aWBAddress!
   
getCity: aPane

    "Callback for the #getContents event in the EntryField named 'city'.
     (Generated by WindowBuilder)"

    aPane contents: self address city!

getState: aPane

    "Callback for the #getContents event in the ComboBox named 'state'.
     (Generated by WindowBuilder)"

    aPane
        "selectItem: self address state;"
        selection: self address state!
  
getStreet1: aPane

    "Callback for the #getContents event in the EntryField named 'street1'.
     (Generated by WindowBuilder)"

    aPane contents: self address street1!
   
getStreet2: aPane

    "Callback for the #getContents event in the EntryField named 'street2'.
     (Generated by WindowBuilder)"

    aPane contents: self address street2!
   
getZip: aPane

    "Callback for the #getContents event in the EntryField named 'zip'.
     (Generated by WindowBuilder)"

    aPane contents: self address zip!
   
setCity: aPane

    "Callback for the #textChanged event in the EntryField named 'city'.
     (Generated by WindowBuilder)"

    self address city: aPane contents!

setState: aPane

    "Callback for the #textChanged event in the ComboBox named 'state'.
     (Generated by WindowBuilder)"

    self address state: aPane selectedItem.
    self event: #addressChanged.!

setStreet1: aPane

    "Callback for the #textChanged event in the EntryField named 'street1'.
     (Generated by WindowBuilder)"

    self address street1: aPane contents.
    self event: #addressChanged.!

setStreet2: aPane

    "Callback for the #textChanged event in the EntryField named 'street2'.
     (Generated by WindowBuilder)"

    self address street2: aPane contents.
    self event: #addressChanged.!

setZip: aPane

    "Callback for the #textChanged event in the EntryField named 'zip'.
     (Generated by WindowBuilder)"

    self address zip: aPane contents.
    self event: #addressChanged.!

updateAll

    #(street1 street2 city zip) do: [ :item |
        (self paneNamed: item asString) contents:
            (self address perform: item)].

    (self paneNamed: 'state') selection: self address state! !



!DictionaryEditorPane class methods !

supportedEvents
        "Private - Answer the events supported by this subpane."
    ^super supportedEvents
        add: #listChanged;
        add: #select;
        yourself!
 
wbCreated

    ^true! !



!DictionaryEditorPane methods !

accept: aPane

    dictionary at: listEditor selectedItem put: detail contents!
   
addSubpanes
    (self
        yourself;
            framingBlock: ( FramingParameters new iDUE: 741 @ 524; xC; yC; cRDU: (2 @ 522 rightBottom: 738 @ 2));
            addSubpane: (
                ListEditorPane new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 736 @ 332; lDU: 0 r: #left; rDU: 0 r: #right; tDU: 0 r: #top; bP: 83/130);
                    paneName: 'listEditor';
                    addSubpanes;
                    startGroup;
                    tabStop;
                    when: #itemChanging perform: #itemChanging:;
                    when: #listChanged perform: #listChanged:;
                    when: #select perform: #select:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 192 r: #right; rDU: 9 r: #right; tDU: 128 r: #bottom; bDU: 72 r: #bottom);
                    paneName: 'accept';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #accept:;
                    contents: 'Accept';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 192 r: #right; rDU: 9 r: #right; tDU: 64 r: #bottom; bDU: 8 r: #bottom);
                    paneName: 'revert';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #revert:;
                    contents: 'Revert';
                    yourself
            );
            addSubpane: (
                TextEdit new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 521 @ 176; lDU: 9 r: #left; rDU: 206 r: #right; tP: 42/65; bDU: 8 r: #bottom);
                    paneName: 'detail';
                    scrollBars;
                    startGroup;
                    tabStop;
                    yourself
            );
        yourself
    ).!

contents

    ^dictionary!

contents: aDictionaryOfStrings

    dictionary := aDictionaryOfStrings.
    listEditor contents: dictionary keys.!
   
initializeNewItem: anItem key: key!
 
initWindow

    listEditor := self paneNamed: 'listEditor'.
    detail := self paneNamed: 'detail'.
    dictionary ifNil: [ dictionary := Dictionary new ].!

itemChanging: aPane
    | current new |
    current := listEditor selectedItem.
    new := listEditor itemContents.
    (dictionary includesKey: current) ifTrue: [
        dictionary at: new put: (dictionary at: current).
        dictionary removeKey: current.
    ]!
  
itemClass

    ^String!
   
listChanged: aPane
    | removeList new |
    listEditor contents do: [ :item |
        (dictionary includesKey: item) ifFalse: [
            dictionary at: item put: (new := self itemClass new).
            self initializeNewItem: new key: item].
    ].
    removeList := OrderedCollection new.
    dictionary keysDo: [ :key |
        (listEditor contents includes: key) ifFalse: [ removeList add: key ]
    ].
    removeList do: [ :item | dictionary removeKey: item ifAbsent: [ nil ]].
    detail contents: self itemClass new.
    self event: #listChanged!
 
revert: aPane

    Notifier isAltDown ifTrue: [ ^detail contents inspect ].
    detail contents: (dictionary at: listEditor selectedItem)!
   
select: aPane

    detail contents: (dictionary at: listEditor selectedItem) deepCopy.
    self event: #select.!
 
selectedIndex

    ^listEditor selectedIndex!
 
selectedItem

    ^listEditor selectedItem!
   
selectIndex: index

    listEditor selectIndex: index!

selection

    ^listEditor selection!
 
selection: anObject

    listEditor selection: anObject!
  
selectItem: aString

    listEditor selectItem: aString! !



!AddressEditorPane class methods !
  
wbCreated

    ^true! !



!AddressEditorPane methods !
   
addSubpanes
    (self
        yourself;
            framingBlock: ( FramingParameters new iDUE: 869 @ 624; xC; yC; cRDU: (2 @ 622 rightBottom: 866 @ 2));
            addSubpane: (
                ListEditorPane new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 859 @ 344; lDU: 0 r: #left; rDU: 5 r: #right; tDU: 0 r: #top; bP: 86/155);
                    paneName: 'listEditor';
                    addSubpanes;
                    startGroup;
                    tabStop;
                    when: #listChanged perform: #listChanged:;
                    when: #select perform: #select:;
                    when: #itemChanging perform: #itemChanging:;
                    yourself
            );
            addSubpane: (
                AddressPane new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 649 @ 272; lDU: 9 r: #left; rDU: 206 r: #right; tP: 86/155; bDU: 4 r: #bottom);
                    paneName: 'detail';
                    addSubpanes;
                    startGroup;
                    tabStop;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 192 r: #right; rDU: 9 r: #right; tDU: 128 r: #bottom; bDU: 72 r: #bottom);
                    paneName: 'accept';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #accept:;
                    contents: 'Accept';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 192 r: #right; rDU: 9 r: #right; tDU: 64 r: #bottom; bDU: 8 r: #bottom);
                    paneName: 'revert';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #revert:;
                    contents: 'Revert';
                    yourself
            );
        yourself
    ).!
   
itemClass

    ^WBAddress! !



!WBAddress class methods !

example

    ^(self new)
        street1: '5 Town & Country Village';
        street2: 'Suite 735';
        city: 'San Jose';
        state: 'CA';
        zip: '95128-2026';
        yourself! !



!WBAddress methods !
   
city

    ^city ifNil: [ city := '' ]!

city: aString

    city := aString!
   
printOn: aStream

    super printOn: aStream.
    aStream
        cr; nextPutAll: '    street1: ',self street1;
        cr; nextPutAll: '    street2: ',self street2;
        cr; nextPutAll: '    city: ',self city;
        cr; nextPutAll: '    state: ',self state;
        cr; nextPutAll: '    zip: ',self zip!
   
state

    ^state ifNil: [ state := '' ]!
 
state: aString

    state := aString!
 
street1

    ^street1 ifNil: [ street1 := '' ]!
   
street1: aString

    street1 := aString!
 
street2

    ^street2 ifNil: [ street2 := '' ]!
   
street2: aString

    street2 := aString!
 
zip

    ^zip ifNil: [ zip := '' ]!
   
zip: aString

    zip := aString! !



!PersonEditorPane class methods !
  
wbCreated

    ^true! !



!PersonEditorPane methods !

accept: aPane

    super accept: aPane.
    (listEditor selectedItem = detail person fullName) ifFalse: [
        dictionary at: detail person fullName put:
            (dictionary at: listEditor selectedItem).
        dictionary removeKey: listEditor selectedItem.
        self contents: dictionary.
        listEditor item contents: detail person fullName
    ]!
   
addSubpanes
    (self
        yourself;
            framingBlock: ( FramingParameters new iDUE: 1106 @ 768; xC; yC; cRDU: (2 @ 766 rightBottom: 1104 @ 2));
            addSubpane: (
                ListEditorPane new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 1097 @ 344; lDU: 0 r: #left; rDU: 5 r: #right; tDU: 0 r: #top; bDU: 344 r: #top);
                    paneName: 'listEditor';
                    addSubpanes;
                    startGroup;
                    tabStop;
                    when: #listChanged perform: #listChanged:;
                    when: #select perform: #select:;
                    when: #itemChanging perform: #itemChanging:;
                    yourself
            );
            addSubpane: (
                PersonPane new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 887 @ 416; lDU: 9 r: #left; rDU: 206 r: #right; tDU: 344 r: #top; bDU: 4 r: #bottom);
                    paneName: 'detail';
                    addSubpanes;
                    startGroup;
                    tabStop;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 192 r: #right; rDU: 9 r: #right; tDU: 128 r: #bottom; bDU: 72 r: #bottom);
                    paneName: 'accept';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #accept:;
                    contents: 'Accept';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 183 @ 56; lDU: 192 r: #right; rDU: 9 r: #right; tDU: 64 r: #bottom; bDU: 8 r: #bottom);
                    paneName: 'revert';
                    startGroup;
                    tabStop;
                    when: #clicked perform: #revert:;
                    contents: 'Revert';
                    yourself
            );
        yourself
    ).!
 
initializeNewItem: anItem key: key

    | first last |
    (key includes: $,)
        ifTrue: [
            first := (key reversed upTo: $,) trimBlanks reversed.
            last := key upTo: $,]
        ifFalse: [
            first := (key upTo: $ ) trimBlanks.
            last := (key reversed upTo: $ ) trimBlanks reversed].

    (anItem name)
        first: first;
        last: last!
  
itemClass

    ^WBPerson! !



!PersonPane class methods !

supportedEvents
        "Private - Answer the events supported by this subpane."
    ^super supportedEvents
        add: #nameChanged;
        add: #personChanged;
        yourself!
  
wbCreated

    ^true! !



!PersonPane methods !
  
addressChanged: aPane

    "Callback for the #addressChanged event in the AddressPane named 'address'.
     (Generated by WindowBuilder)"

    self event: #personChanged!
 
addSubpanes
    (self
        yourself;
            framingBlock: ( FramingParameters new iDUE: 887 @ 416; xC; yC; cRDU: (2 @ 414 rightBottom: 885 @ 2));
            addSubpane: (
                NamePane new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 658 @ 136; lDU: 0 r: #left; rDU: 224 r: #right; tDU: 0 r: #top; bDU: 136 r: #top);
                    paneName: 'name';
                    addSubpanes;
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getName:;
                    when: #nameChanged perform: #nameChanged:;
                    yourself
            );
            addSubpane: (
                SexPane new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 215 @ 132; lDU: 215 r: #right; rDU: 0 r: #right; tDU: 0 r: #top; bDU: 132 r: #top);
                    paneName: 'sex';
                    addSubpanes;
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getSex:;
                    when: #sexChanged perform: #sexChanged:;
                    yourself
            );
            addSubpane: (
                AddressPane new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 878 @ 272; lDU: 0 r: #left; rDU: 5 r: #right; tDU: 136 r: #top; bDU: 408 r: #top);
                    paneName: 'address';
                    addSubpanes;
                    startGroup;
                    tabStop;
                    when: #getContents perform: #getAddress:;
                    when: #addressChanged perform: #addressChanged:;
                    yourself
            );
        yourself
    ).!
   
contents

    ^self person!
   
contents: aWBPerson

    self person: aWBPerson!
  
getAddress: aPane

    "Callback for the #getContents event in the AddressPane named 'address'.
     (Generated by WindowBuilder)"

    aPane contents: self person address!
   
getName: aPane

    "Callback for the #getContents event in the NamePane named 'name'.
     (Generated by WindowBuilder)"

    aPane contents: self person name!
   
getSex: aPane

    "Callback for the #getContents event in the SexPane named 'sex'.
     (Generated by WindowBuilder)"

    aPane contents: self person sex!
   
nameChanged: aPane

    "Callback for the #nameChanged event in the NamePane named 'name'.
     (Generated by WindowBuilder)"

    self event: #nameChanged.
    self event: #personChanged.!
 
person

    ^person ifNil: [ person := WBPerson new ]!

person: aWBPerson

    person := aWBPerson.

    self updateAll.

    self event: #personChanged.!

sexChanged: aPane

    "Callback for the #sexChanged event in the SexPane named 'sex'.
     (Generated by WindowBuilder)"

    self person sex: aPane sex.
    self event: #personChanged!

updateAll

    #(name address sex) do: [ :item |
        (self paneNamed: item asString) contents:
            (self person perform: item)].! !



!PersonPaneTester class methods !

wbCreated

    ^true! !



!PersonPaneTester methods !

createViews

     "WARNING!!  This method was automatically generated by
      WindowBuilder.  Code you add here which does not conform
      to the WindowBuilder API will probably be lost the next time
      you save your layout definition."

     | v |

    self addView: (
        v := self topPaneClass new
            owner: self;
            labelWithoutPrefix:  'PersonPane Tester';
            noSmalltalkMenuBar;
            viewName: 'mainView';
            framingBlock: ( FramingParameters new iDUE: 933 @ 544; xC; yC; cRDU: (9 @ 536 rightBottom: 923 @ 46));
            pStyle: #(sysmenu sizable titlebar minimize maximize);
            addSubpane: (
                PersonPane new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 887 @ 416; lDU: 18 r: #left; rDU: 905 r: #left; tDU: 0 r: #top; bDU: 416 r: #top);
                    paneName: 'person';
                    addSubpanes;
                    startGroup;
                    when: #getContents perform: #getPerson:;
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 155 @ 64; lDU: 18 r: #left; rDU: 174 r: #left; tDU: 416 r: #top; bDU: 480 r: #top);
                    paneName: 'new';
                    startGroup;
                    when: #clicked perform: #newPerson:;
                    contents: 'New';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 155 @ 64; lDU: 183 r: #left; rDU: 338 r: #left; tDU: 416 r: #top; bDU: 480 r: #top);
                    paneName: 'inspect';
                    startGroup;
                    when: #clicked perform: #inspectPerson:;
                    contents: 'Inspect';
                    yourself
            );
            addSubpane: (
                Button new
                    owner: self;
                    framingBlock: ( FramingParameters new iDUE: 238 @ 64; lDU: 347 r: #left; rDU: 585 r: #left; tDU: 416 r: #top; bDU: 480 r: #top);
                    startGroup;
                    when: #clicked perform: #inspectPane:;
                    contents: 'Inspect Pane';
                    yourself
            );
        yourself
    ).!
   
getPerson: aPane

    "Callback for the #getContents event in the PersonPane named 'person'.
     (Generated by WindowBuilder)"

    aPane contents: WBPerson new!
 
inspectPane: aPane

    "Callback for the #clicked event in an unnamed Button (contents is 'Inspect Pane').
     (Generated by WindowBuilder)"

    (self paneNamed: 'person') inspect!

inspectPerson: aPane

    "Callback for the #clicked event in the Button named 'inspect'.
     (Generated by WindowBuilder)"

    (self paneNamed: 'person') contents inspect!
 
newPerson: aPane

    "Callback for the #clicked event in the Button named 'new'.
     (Generated by WindowBuilder)"

    (self paneNamed: 'person') contents: WBPerson new! !


!WindowBuilder class methods !   
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
        register: addInName menu: #('Address~EditorPane' 'AddressEditorPane' '' ) after: 'DictionaryEditorPane'.!  !
"construct application"
((Smalltalk at: #CPApplication ifAbsent: [])
    isKindOf: Class) ifTrue: [
        ((Smalltalk at: #CPApplication) for:'Composite Pane Examples')
            addClass: ListEditorPane;
            addClass: WBObject;
            addClass: WBName;
            addClass: WBPerson;
            addClass: OkCancelPane;
            addClass: NamePane;
            addClass: AddressPaneTester;
            addClass: AddressPane;
            addClass: DictionaryEditorPane;
            addClass: AddressEditorPane;
            addClass: WBAddress;
            addClass: PersonEditorPane;
            addClass: PersonPane;
            addClass: PersonPaneTester;
            addMethod: #addInCompositePaneExamples: forClass: WindowBuilder class;
            comments: 'CompositePane Examples

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
            initCode: nil;
            finalizeCode: '    PWindowBuilder
        addInCompositePaneExamples: nil;
        clearWBClasses;
        initProperties;
        reset.
';
            fileName: 'COMPEX.ST';
            startUpCode: nil]!

"Finalize"
   
    PWindowBuilder
        addInCompositePaneExamples: nil;
        clearWBClasses;
        initProperties;
        reset.
!

 
    Transcript cr; show: 'Composite Pane Examples installed.'!
