
WindowDialog subclass: #ClassSelectionDialog
  instanceVariableNames:
    'classMSLB selectedClasses '
  classVariableNames: ''
  poolDictionaries: ''   !


WindowDialog subclass: #ClassComparisonDialog
  instanceVariableNames:
    'snapshotField snapshotFile descriptiveField descriptiveString resultsField resultsFile selectedClasses selectedClassBox classDialog nativeClassList '
  classVariableNames: ''
  poolDictionaries: ''    !


!ClassSelectionDialog class methods ! !



!ClassSelectionDialog methods !

cancel: aButton

    selectedClasses := nil.
    self mainView close.!

initWindowSize

    ^(45@20) * WindowDialog unitMultiplier!

ok: aButton

    selectedClasses := classMSLB selectedItems.
    (selectedClasses isEmpty) ifTrue: [ selectedClasses := nil ].
    self mainView close.!

openOn: aCollection
    withSelection: aClassGroup

    | charSize lineHeight charWidth classes selection |

    charSize := WindowDialog unitMultiplier.
    lineHeight := charSize y.
    charWidth := charSize x.

    ( Smalltalk product =  'Smalltalk/V Windows' ) ifTrue: [
        selection := OrderedCollection new.
        aClassGroup isNil ifFalse: [
            1 to: aCollection size do: [ :i |
                ( aClassGroup includes: ( (aCollection asArray) at: i ) ) ifTrue: [ selection add: i ]
            ].
        ].
    ] ifFalse: [
        selection := aClassGroup
    ].

    self
        label: 'Select Classes';

        addSubpane: ( classMSLB := MultipleSelectListBox new
            contents: aCollection;
            framingBlock: [ :box | (box leftTop rightAndDown: (5@5))
                extentFromLeftTop: ( (box width * (3/5)) rounded - 10 ) @ (box height - 10) ] );

        addSubpane: ( Button new
            contents: 'OK';
            defaultPushButton;
            when: #clicked perform: #ok:;
            framingBlock: [ :box | ( box leftTop rightAndDown: ( (box width * (11/16)) rounded) @ (box height // 3) )
                    extentFromLeftBottom: (charWidth * 9) @ (lineHeight*2) ] );

        addSubpane: ( Button new
            contents: 'Cancel';
            owner: self;
            when: #clicked perform: #cancel:;
            framingBlock: [ :box | ( box leftTop rightAndDown: ( (box width * (11/16)) rounded) @ (box height * (2/3)) rounded )
                extentFromLeftTop: (charWidth * 9) @ (lineHeight*2) ] ).

    aClassGroup notNil ifTrue:  [  classMSLB selection: selection. ].
    self openWindow.!

selectedClasses

     ^selectedClasses! !



!ClassComparisonDialog class methods ! !



!ClassComparisonDialog methods !

cancel: aButton

    descriptiveString := nil.    "To signal that cancel was chosen"
    self mainView close!

descriptiveString

    ^descriptiveString!

initialize

    resultsFile := 'scan_res.cmp'.
    snapshotFile := 'clsdump.vw'.
    descriptiveString := Smalltalk product, ' ', Smalltalk version.
    ^super initialize.!

initWindowSize

    ^(60@27) * WindowDialog unitMultiplier!

ok: aButton

    | string |

    string := descriptiveField contents.
    string isEmpty ifTrue: [ descriptiveString := Smalltalk version ] ifFalse: [ descriptiveString := string ].
    string := resultsField contents.
    string isEmpty ifTrue: [ resultsFile := 'scan_res.cmp' ] ifFalse: [ resultsFile := string ].
    string := snapshotField contents.
    string isEmpty ifTrue: [ snapshotFile := 'clsdump.vw' ] ifFalse: [ snapshotFile := string ].
    self mainView close.!

openOn: aCollection

    "Private - open up the UI for the image comparison tool"

    | charSize lineHeight charWidth |

    charSize := WindowDialog unitMultiplier.
    lineHeight := charSize y.
    charWidth := charSize x.
    nativeClassList := OrderedCollection new.
    aCollection do: [ :class | nativeClassList add: class name ].

    self
        label: 'Compare Classes';

        addSubpane: ( StaticText new leftJustified;
            contents: 'Snapshot File';
            framingBlock: [ :box | ( box leftTop rightAndDown: ((charSize*(7/3)) rounded) )
                extentFromLeftTop:  (charWidth*25) @ lineHeight ] );

        addSubpane: ( snapshotField:= EntryField new
            contents: snapshotFile;
            framingBlock: [ :box | ( box leftTop rightAndDown: ( charWidth*30 @ (lineHeight*2)) )
                extentFromLeftTop: ( (25@(5/3)) * charSize ) rounded ] );

        addSubpane: ( StaticText new leftJustified;
            contents: 'Native image Description';
            framingBlock: [ :box | ( box leftTop rightAndDown: ( (charWidth*(7/3)) rounded) @ (lineHeight*(16/3)) rounded )
                extentFromLeftTop:  (charWidth*25) @ lineHeight ] );

        addSubpane: ( descriptiveField := EntryField new
            contents: descriptiveString;
            framingBlock: [ :box | ( box leftTop rightAndDown: ( charWidth*30 @ (lineHeight*5)) )
                extentFromLeftTop: ( (25@(5/3)) * charSize ) rounded ] );

        addSubpane: ( StaticText new leftJustified;
            contents: 'Results File';
            framingBlock: [ :box | ( box leftTop rightAndDown: ( (charWidth*(7/3)) rounded) @ (lineHeight*(25/3)) rounded )
                extentFromLeftTop:  ( charWidth*25) @ lineHeight ] );

        addSubpane: ( resultsField := EntryField new
            contents: resultsFile;
            framingBlock: [ :box | ( box leftTop rightAndDown: (charWidth*30 @ (lineHeight*8)) )
                extentFromLeftTop: ( (25@(5/3)) * charSize ) rounded ] );

        addSubpane: ( StaticText new leftJustified;
            contents: 'Selected Classes ';
            framingBlock: [ :box | ( box leftTop rightAndDown: ( (charWidth*(7/3)) rounded) @ (lineHeight*11) )
                extentFromLeftTop: ( charWidth*25) @ lineHeight ] );

        addSubpane: ( selectedClassBox := ListBox new
            contents: ( selectedClasses isNil ifTrue: [ #('All classes') ] ifFalse: [ selectedClasses ] );
            framingBlock: [ :box | ( box leftTop rightAndDown: ( charWidth*30 @ (lineHeight*11)) )
                extentFromLeftTop: ( (25*charWidth) @ (lineHeight*10) ) ] );

        addSubpane: ( Button new
            contents: 'Select...';
            when: #clicked perform: #selectClasses:;
            framingBlock: [ :box | ( box leftTop rightAndDown: (charWidth*6) @ (lineHeight * (41/3)) rounded )
                    extentFromLeftTop: (charWidth * 9) @ (lineHeight*2) ] );

        addSubpane: ( Button new
            contents: 'OK';
            defaultPushButton;
            when: #clicked perform: #ok:;
            framingBlock: [ :box | ( box leftTop rightAndDown: (charWidth*15) @ (lineHeight * (73/3)) rounded )
                    extent: (charWidth * 9) @ (lineHeight*2) ] );

        addSubpane: ( Button new
            contents: 'Cancel';
            owner: self;
            when: #clicked perform: #cancel:;
            framingBlock: [ :box | ( box leftTop rightAndDown: (charWidth * 35) @ (lineHeight * (73/3)) rounded )
                extent: (charWidth * 9) @ (lineHeight*2) ] ).

    self openWindow.!

resultsFile

    ^resultsFile!

selectClasses: aButton

    CursorManager execute change.
    classDialog := ClassSelectionDialog new openOn: nativeClassList withSelection: selectedClasses.
    selectedClasses := classDialog selectedClasses.
    selectedClassBox contents: ( selectedClasses isNil  ifTrue: [ #('All classes') ] ifFalse: [ selectedClasses ] ).
    CursorManager normal change.!

selectedClasses

    ^selectedClasses!

snapshotFile

    ^snapshotFile! !
