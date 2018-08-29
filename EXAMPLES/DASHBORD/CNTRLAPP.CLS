"Please read 'dashbord.txt' file in this same directory
 about how to install this application.
"!

Object subclass: #ControlApparatus
  instanceVariableNames: 
    'form frame foreColor pen dependentArray lastChange '
  classVariableNames: ''
  poolDictionaries: ''    !


!ControlApparatus class methods ! !



!ControlApparatus methods !
   
contains: aPoint 
        "Answer true if the frame on the 
         screen contains aPoint (relative 
         to frame). Else answer 
         false." 
    ^frame containsPoint: aPoint!

dependentArray  
        "Answer the dependentArray."  
    ^dependentArray!
  
dependentArray: anArray  
        "Set the dependentArray to anArray."  
    dependentArray := anArray!
   
frame  
        "Answer the framing rectangle of the receiver."  
    ^frame!
 
lastChange  
        "Answer the last change."  
    ^lastChange!
 
lastChange: anInteger  
        "Set the last change  
         to anInteger."  
    lastChange := anInteger!

paintLabel: aString 
    labelLoc: aPoint 
        "Write the label aString at aPoint 
         with aFont." 
    pen 
        displayText: aString 
            from: 1 
            to: aString size 
            at: aPoint!
 
pen: aPen  frame: aRectangle 
        "Initialize form, frame and 
         default colors." 
    pen := aPen. 
    frame := aRectangle. 
    dependentArray := #()!
   
reframe: aRectangle
        "Change the receiver's framing rectangle to aRectangle."
    frame := aRectangle! !

ControlApparatus subclass: #Scale
  instanceVariableNames: 
    'reading lowReading highReading '
  classVariableNames: ''
  poolDictionaries: ''  !


!Scale class methods ! !



!Scale methods !
 
changeReading: anInteger  
        "Answer the difference between anInteger  
         and old reading. Draw needle to reflect  
         the new reading anInteger."  
    | newReading |  
    newReading := (anInteger max: lowReading) min: highReading.  
    lastChange := newReading rounded - reading rounded.  
    reading := newReading.  
    lastChange = 0  
        ifFalse: [  
            self eraseNeedle.  
            self drawNeedle].  
    ^lastChange!

increment: inc  
        "Increment (or Decrement if inc is negative)  
         the dial"  
    self changeReading: ((reading + inc max: lowReading)  
        min: highReading)!
  
reading  
        "Answer the current reading."  
    ^reading!
   
setReading: anInteger 
        "Set reading to anInteger without drawing needle." 
    reading := (anInteger max: lowReading) min: highReading! !

Scale subclass: #Dial
  instanceVariableNames: 
    'r center tip lowDegree highDegree readingsPerDegree needle '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants ' !


!Dial class methods ! !



!Dial methods !
   
arcTan90: aPoint 
        "Compute the angle of the vector from 
         0@0 to aPoint in the interval 0 to 90 
         degrees (adjusting for the screen 
         aspect ratio).  This method does not use 
         floating point." 
    | ratio tan x y | 
    (y := aPoint y) = 0 ifTrue: [^0]. 
    (x := aPoint x) = 0 ifTrue: [^90]. 
    ratio := y abs * 100 // x abs. 
    1 to: 89 do: [ :i | 
        tan := i integerSin * 100 // i integerCos. 
        ratio <= tan 
            ifTrue: [^i]]. 
    ^90!
  
arcTan: aPoint  
        "Compute the angle of the vector from  
         0@0 to aPoint in the interval 0 to 360  
         degrees (adjusting for the screen  
         aspect ratio).  This method does not use  
         floating point."  
    | degree |  
    degree := self arcTan90: aPoint.  
    aPoint x < 0  
        ifTrue: [  
            aPoint y < 0  
                ifTrue: [^180 + degree]  
                ifFalse: [^180 - degree]]  
        ifFalse: [  
            aPoint y < 0  
                ifTrue: [^360 - degree]  
                ifFalse: [^degree]]!
  
degreeToReading: degreeInteger  
        "Convert degreeInteger to the receiver  
         dial reading."  
    | newDegree maxRel |  
    maxRel := self relativeDegree: highDegree.  
    newDegree := self relativeDegree: degreeInteger.  
    newDegree > maxRel  
        ifTrue: [  
            newDegree > (maxRel // 2 + 180)  
                ifTrue: [newDegree := 0]  
                ifFalse: [newDegree := maxRel]].  
    ^(newDegree * readingsPerDegree) rounded!

drawDial: clipRectangle
        "Draw the curved outline of the receiver dial on the form."
    | boundingBox |
    pen place: center.
    clipRectangle bottom = center y
        ifTrue: [
            boundingBox := center - r corner: (center + r).
            pen
                chord: r
                minor: r
                angles: 0 @ -180]
        ifFalse: [
            pen circle: r]!
 
drawDial: clipRectangle
    center: aPoint
    radius: rInteger
    scales: scaleInteger
    marks: anArray
        "Draw the dial, its tick marks, and labels."
    | scanner |
    "pen setLineWidth: 1. "
    center := aPoint.
    r := rInteger.
    self drawDial: clipRectangle.
    self
        drawTickMarks: anArray
            scale: scaleInteger!
   
drawNeedle
        "Draw the needle of the receiver at the current reading."
    | dir  |
    pen down;
        place: center;
        direction: (dir := (reading - lowReading
            // readingsPerDegree) rounded + lowDegree);
        go: (tip := (r - 10 max: 2)).
    tip := tip @ dir!
 
drawTickMarks: anArray scale: anInteger  
        "Draw the recievers tick marks and labels."  
    | degree tickSize markInc unitsPerScale  
      aString x y marks |  
    marks := ((highReading - lowReading) / anInteger) rounded.  
    tickSize := 9.  
    unitsPerScale := (self relativeDegree: highDegree)  
        / marks.  
    markInc := marks // (anArray size - 1).  
    degree := lowDegree.  
    1 to: marks + 1 do: [:i |  
        pen direction: degree rounded;  
            place: center;  
            up;  
            go: r - tickSize - 4.  
        i \\ markInc = 1  
        ifTrue: [  
            pen down; go: tickSize + 2;  
                up; go: 4.  
            (degree < 180 and: [degree > 0]) 
                ifTrue: [ 
                    y := pen location y  - 2] 
                ifFalse: [ 
                    y := pen location y -  pen font height + 4]. 
            x := pen location x.  
            aString :=  
                anArray at: i // markInc + 1.  
            (degree == 270 or: [degree == 90])  
                ifTrue: [  
                    x := x - (aString size  
                        * pen font width // 2).  
                    y := y - 2]  
                ifFalse: [  
                    (degree < 270 and: [degree > 90])  
                        ifTrue: [x := x - (aString size  
                            * pen font width) - 3]  
                        ifFalse: [x := x + 3]].  
            pen displayText: aString 
                from: 1  
                to: aString size    
                at: x @ y]  
        ifFalse: [  
            pen go: 4;  
                down;  
                go: tickSize - 4].  
        pen down.  
        degree := degree + unitsPerScale.  
        degree := degree - ((degree // 360) * 360). 
        "degree < 0 ifTrue: [degree := degree + 360]"]!
  
eraseNeedle
        "Erase the current dial reading."
        | oldColor |
    oldColor := pen foreColor.
    pen down;
        foreColor:
            (pen backColor isNil
                ifTrue: [ColorConstants at: 'ClrBackground']
                ifFalse: [pen backColor]);
        place: center;
        direction: tip y;
        go: tip x;
        foreColor: oldColor!
 
framelessDial: clipRectangle 
    center: aPoint 
    radius: rInteger 
    scales: scaleInteger 
    marks: anArray 
        "Draw the receiver dial, its tick marks, and labels without drawing 
         the curved border of the dial." 
    | scanner | 
    center := aPoint. 
    r := rInteger. 
    self 
        drawTickMarks: anArray 
            scale: scaleInteger!
 
initDial: lowReadInteger 
    highReading: highReadInteger 
    lowDegree: lInteger 
    highDegree: hInteger 
        "Initialize the receiver." 
    lowDegree := lInteger. 
    highDegree := hInteger. 
    lowReading := 
    reading := lowReadInteger. 
    highReading := highReadInteger. 
    readingsPerDegree := highReading - lowReading / 
        (self relativeDegree: highDegree)!
  
relativeDegree: degreeInteger
        "Answer the total degrees between
         degreeInteger and lowDegree."
    | degree |
    degreeInteger < lowDegree
        ifTrue: [
            ^360 - lowDegree + degreeInteger]
        ifFalse: [^degreeInteger - lowDegree]!
   
setToDegree: anInteger  
        "Set the reading of the receiver  
         dial to anInteger degrees."  
    self changeReading: lowReading +  
        (self degreeToReading: anInteger)!

setToPoint: aPoint 
        "Set the reading of the receiver 
         dial so the line defined by the 
         needle goes through aPoint." 
    self setToDegree: 
        (self arcTan: aPoint - center)! !

ControlApparatus subclass: #Switch
  instanceVariableNames: 
    'areas selection '
  classVariableNames: ''
  poolDictionaries: '' !


!Switch class methods ! !



!Switch methods !
   
loc: locArray 
    size: aPoint 
        "Initialize an array of rectangles 
         containing switches. Their origins 
         are in locArray, extent is aPoint." 
    | index | 
    "selection := 1. "
    areas := Array new: locArray size. 
    index := 1. 
    locArray do: [ :loc | 
        areas at: index put: (loc extent: aPoint). 
        index := index + 1]!
   
loc: locArray 
    size: aPoint 
    label: labelArray 
    labelLoc: labLocArray 
        "Initialize an array of rectangles 
         containing switches. Their origins 
         are in locArray, extent is aPoint. 
         Arguments labelArray, labLocArray, 
         and aFont allow for printing labels." 
    | index | 
    self loc: locArray size: aPoint. 
    1 to: areas size do: [ :switch | 
        self draw: switch]. 
    1 to: labelArray size do: [ :i | 
        self 
            paintLabel: (labelArray at: i) 
            labelLoc: (labLocArray at: i) + frame origin]!

selection  
        "Answer the current selection  
         (switch number selected)."  
    ^selection!

selection: anInteger 
        "Set selection to anInteger 
         (a switch index)." 
    self reverseSelection. 
    selection := anInteger. 
    self reverseSelection!

setSelection: anInteger 
        "Set selection to anInteger without reversing the 
          selection."
    selection := anInteger!

setToPoint: aPoint 
        "Set the switch containing aPoint 
         to be on." 
    | area point | 
    point := aPoint - frame origin. 
    1 to: areas size do: [ :i | 
        area := areas at: i. 
        (area containsPoint: point) 
            ifTrue: [ 
                (self switch: i contain: point) 
                    ifTrue: [ 
                        lastChange := 0. 
                        i = selection 
                            ifFalse: [ 
                                lastChange := 1. 
                                self selection: i]. 
                        ^selection]]]. 
    ^nil! !

Switch subclass: #SwitchButton
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''   !


!SwitchButton class methods ! !



!SwitchButton methods !
   
draw: anInteger 
        "Draw the button anInteger." 
    | rect | 
    rect := areas at: anInteger. 
    pen place: rect origin + frame origin; 
            box: rect corner + frame origin!

reverseSelection 
        "Reverse the color of the button 
         indexed by anInteger." 
    | area origin corner | 
    (selection < 1 or: [selection > areas size]) 
        ifTrue: [^self]. 
    area := areas at: selection. 
    origin := area  origin + frame origin. 
    corner := area corner + frame origin. 
    pen reverse: (origin corner: corner)!

switch: anInteger contain: aPoint  
        "Answer true if aRectangle  
         contains aPoint."  
    ^true! !
