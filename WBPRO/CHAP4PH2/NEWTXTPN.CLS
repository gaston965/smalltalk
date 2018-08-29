
TextPane subclass: #NewTextPane
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''    !


!NewTextPane class methods !
 
supportedEvents
      "Private - Answer the Set of events that TextPanes can notify
      their owners about."
   ^super supportedEvents
      add: #button1DoubleClick;
      yourself! !



!NewTextPane methods !
   
button1DoubleClick: aPoint

      "Private - The user double clicked at aPoint."

   | aChar |
   aChar := self bracketCharAt: aPoint.
   aChar notNil
      ifTrue: [self matchBracketChar: aChar at: aPoint]
      ifFalse: [
         self
            selectDoubleAtCursor: aPoint;
            displayChanges;
            showSelection].

   self event: #button1DoubleClick.!
 
display
        "Private - Display the contents of
         the receiver."
    | rect hd |
    rectangle isNil ifTrue: [^self].
    selection hideSelection.
    textHolder displayAll.
    changedArea := nil.
    self displayWindow.!

displayWindow
        "Private - Let the owner process the display event
        or draw all the retained segments."
    (self handlesEvent: #display)
        ifTrue: [self event: #display]
        ifFalse: [
            selection displaySelection]!
 
highlightString: aString backColor: aColor
      "highlights aDay on the default pane with a color, retains
current foreColor"
   | oldBackColor  |
   self selectBefore: 1@1.  "Start search from known position"
   self searchFor: aString.  "Search for day, Make day a string
Warning this is a private method"
   oldBackColor := self backColor. "Save the current foreColor"
   self backColor: aColor.
   self selectBefore: 1@1.  "Move cursor back to beginning of Pane"
   self backColor: oldBackColor. "restore old color"!
 
highlightString: aString foreColor: aColor
      "highlights aDay on the default pane with a color, retains
      current foreColor"
   | oldForeColor  |
   self selectBefore: 1@1;    "Start search from known position"
      searchFor: aString.   "Search for day, Make day a string"
   oldForeColor := self foreColor. "Save the current foreColor"
   self foreColor: aColor;
      selectBefore: 1@1. "Move the cursor back to beginning of Pane"
   self foreColor: oldForeColor. "restore old color"! !
