
GraphPane subclass: #FreeDrawPane
  instanceVariableNames: 
    'backup '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants CharacterConstants '   !


!FreeDrawPane class methods ! !



!FreeDrawPane methods !
   
backup
        "Answer the receiver's backup form."
    ^backup!
  
characterInput: aChar
        "Private - A character has been typed. Display aChar
          in the receiver."
    |  newPosition |
    self moveCaret: (newPosition :=
        (graphicsTool location + ((self font charWidth: aChar) @ 0))).
    graphicsTool displayText: (String with: aChar).
    backup pen displayText: (String with: aChar).
    graphicsTool place: newPosition.
    backup pen place: newPosition + (self rectangle extent // 2)!

close
        "Private - Close the receiver."
    backup notNil ifTrue: [backup release].
    ^super close!
  
display
        "Private - Display the receiver pane contents."
    "graphicsTool setClipRegion: nil."
    backup notNil
        ifTrue: [
            graphicsTool
                copyBitmap: backup
                from: backup boundingBox
                at: self scrollingRectangle origin].
    ^super display!
   
gettingFocus
        "Private - Create a flashing cursor."
    UserLibrary
        createCaret: self handle
        bitmap: nil
        width: 0
        height:  self font height.!
  
losingFocus
        "Private - Destroy the blinking cursor."
    UserLibrary hideCaret: self asParameter.
    UserLibrary destroyCaret!

moveCaret: aPoint
        "Private - Move the cursor to aPoint."
    UserLibrary
        setCaretPos: aPoint x
        y: aPoint y!
 
scrollingRectangle
        "Private - Answer the rectangle expanded by
         half its extent for scrolling purpose."
    ^rectangle expandBy: (rectangle extent // 2)!

validate
    super validate.
    backup isNil ifTrue: [
        backup := Bitmap new ownDCScreenExtent:
            self scrollingRectangle extent]!

wmPaint: aLongStruct with: aWordStruct
        "Process the Win WM_Paint message."
    self display.
    ^nil! !
