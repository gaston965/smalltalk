"Please see file 'polygon.txt' about how to install this demo."
!

ViewManager subclass: #PolygonView
  instanceVariableNames: 
    'polygons selection '
  classVariableNames: ''
  poolDictionaries: ''    !


!PolygonView class methods ! !



!PolygonView methods !
 
activate: aPane
    views do: [:v |
        ((v isKindOf: TopPane) and: [(v == aPane) not])
            ifTrue: [v showWindowAtTop]]!

add
    | answer newPolygon |
    answer := Prompter prompt: 'polygon sides @ side length'
        defaultExpression: '3 @ 50'.
    answer isNil ifTrue: [^nil].
    polygons add: (
        newPolygon := Polygon new
            sides: answer x;
            length: answer y).
    selection := nil.
    self changed: #lists:;
        changed: #graphs:;
        changed: #sounds: with: #addOrDelete: with: newPolygon!
  
close: aPane
    self close!
   
delete
    | polygonDeleted |
    selection isNil ifTrue: [^nil].
    polygonDeleted := polygons at: selection.
    polygons removeIndex: selection.
    self changed: #lists:;
        changed: #graphs:;
        changed: #sounds: with: #addOrDelete: with: polygonDeleted!
   
graphs: aPane
    | pen position |
    pen := aPane pen.
    pen erase.
    position := aPane rectangle leftTop rightAndDown:
        (aPane rectangle width // 2 @ 10).
    polygons do: [:p |
        pen place: position; direction: 0.
        p displayWith: pen.
        position := position + (0 @ (p height + 10))]!
  
lists: aPane
    aPane contents: (polygons collect: [:p | p printString])!
 
menu: listPane
        "Set menu for aPane."
    listPane setMenu: ((Menu
        labels: 'Add\Delete' withCrs
        lines: #()
        selectors: #(add delete))
            title: '&Options';
            owner: self;
            yourself)!
  
open
        "Create a polygon example."
    | listView graphView soundView |
    polygons := OrderedCollection new.
    self
        addView: (listView :=
            TopPane new
                owner: self;
                when: #close perform: #close:;
                when: #activate perform: #activate:;
                framingBlock: [:box | box scaleBy: 1/2]);
        addView: (graphView :=
            TopPane new
                owner: self;
                when: #close perform: #close:;
                when: #activate perform: #activate:;
                framingRatio: (1/2 @ 0 extentFromLeftTop: 1/2 @ (1)));
        addView: (soundView :=
            PolygonSound new
                owner: self).
    listView
        label: 'Polygon list';
        addSubpane:
            (ListBox new
                owner: self;
                when: #getContents perform: #lists:;
                when: #getMenu perform: #menu:;
                when: #select perform: #select:;
                framingBlock: [:box| box]).
    graphView
        label: 'Polygon graph';
        addSubpane:
            (GraphPane new
                owner: self;
                when: #getContents perform: #graphs:;
                framingBlock: [:box| box]).
    soundView
        when: #getContents perform: #sounds:.
    self openWindow.!
 
select: aPane
        "Select an item in listPane aPane."
    selection := aPane selection.
    self changed: #sounds: with: #select: with: selection!
   
sounds: aPane
    aPane contents: polygons! !
