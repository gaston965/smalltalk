
ViewManager subclass: #PlotWindow
  instanceVariableNames: 
    'plotPane dataPane plotSelector factor barWidth barSpacing barPen plotData '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants ' !


!PlotWindow class methods !
  
example
   "Open a PlotWindow for demonstration purposes"
   PlotWindow new open.! !



!PlotWindow methods !
 
barSpacing
      "Prompt for a new value of the spacing between bars. If
      the user's response is not nil, validate it. If it is not
      valid, tell the user, otherwise accept it."
   barSpacing :=
      self
         promptFor: 'Bar Spacing'
         default: barSpacing
         validateWith:
            [ :ii | ((ii isKindOf: Integer) and: [ ii > 1 ]) and:
                        [ ii < 16 ] ].!

barWidth
      "Prompt for a new value for the width of bars. If
      the user's response is not nil, validate it. If it is not
      valid, tell the user, otherwise accept it."
   barWidth :=
      self
         promptFor: 'Bar Width'
         default: barWidth
         validateWith:
            [ :ii | ((ii isKindOf: Integer) and: [ ii > 2 ]) and:
                        [ ii < 50 ] ]!
   
black
"Set the bar to black."
barPen setSolidBrush: ClrBlack.!

clearPlot
      "Clear the plot pane."
      barPen erase!

darkGray
"Set the bar to dark gray."
barPen setSolidBrush: ClrDarkgray.!
  
dataMenu: theTextPane
      "Answer the menu for the data pane."
   ^theTextPane setMenu: ((Menu
      labels: '&Accept\&Restore\File &In\File&Out\&Copy\Cu&t\&Paste' withCrs
      lines: #(2 4)
      selectors: #(accept restoreData fileIn fileOut copySelection
cutSelection pasteSelection))
      title: '~Data')!

dataPane: theTextPane
      "Answer the initial data pane contents, an empty string."
   ^''!
 
factor
      "Prompt for a new value of the data stretch factor. If the
      user's response is not nil, validate it. If it is not
      valid, tell the user, otherwise accept it."
   factor :=
      self
         promptFor: 'Data Stretch Factor'
         default: factor
         validateWith:
            [ :ii | (ii isKindOf: Integer) and: [ ii > 0 ] ]!
  
fileIn
      "Use a standard Windows FileDialog to prompt
      for a specification of a file containing data.
      Open a stream on the path and ask the data pane
      to file the data in.
      Finally, mark the data pane as modified so the 'accept'
      choice on the pane menu will respond."
   | path stream |
   path :=
      FileDialog new defExtension: '*.txt';
            hideReadonly;
            openFile;
            file.
   stream := File pathName: path.
   dataPane fileInFrom: stream.
   stream close.
   dataPane update.
self newData: dataPane contents.!

fileOut
      "Use a standard Windows FileDialog to prompt
      for a specification of a file in which to store the data
      now stored in the dataPane.
      Open a stream on the path and ask the data pane
      to file the data out. "
   | path stream |
   path :=
      FileDialog new defExtension: '*.txt';
            hideReadonly;
            overwritePrompt;
            saveFile: 'untitled.txt';
            file.
   stream := File pathName: path.
   dataPane fileInFrom: stream.
   stream close.!
 
horizontalBar: theData
      "Draw a horizontal bar plot of theData, an ordered
      collection of integers."
      | x y |
      x := 0.
      y := 0.
      barPen
      erase;
      drawRetainPicture: [
      theData do: [ :value |
      barPen place: x @ y;
      boxFilled: x + (factor * value) @ y + barWidth.
      y := y + barWidth + barSpacing]]!
 
initialize
      "Initialize instance variables with default values."
      super initialize.
      plotSelector := #horizontalBar:.
      factor := 3. "stretch the data values by this much"
      barWidth := 2 * SysFont height.
      barSpacing := SysFont height.!
 
newData: aString
      "The data pane's contents have been changed. Convert the
       new data into an ordered collection of integers and make
       a new plot. Answer true."
   | input token   |
   input := aString asStream.
   plotData := OrderedCollection new.
   [ input atEnd ]
         whileFalse: [
            token := input nextWord.
            token notNil
               ifTrue: [ plotData addLast: token asInteger ] ].
   self newPlot.
   ^true!
   
newPlot
   "If there is data to plot, plot it using the currently selected
set of plot parameters."
plotData notNil
   ifTrue: [self perform: plotSelector with: plotData].!

open
      "Open a PlotWindow. Define the pane sizes and behavior."
self label: 'Plot Window';
   owner: self;
   addSubpane:
      (dataPane := TextPane new
         owner: self;
            when: #getMenu perform: #dataMenu:;
            when: #getContents perform: #dataPane:;
            when: #save perform: #redraw:;
            framingBlock:
               [ :box | box origin extent: 50 @ box height]);
   addSubpane:
      (plotPane := GraphPane new
            owner: self;
            when: #getMenu perform: #plotMenu:;
            when: #display perform: #redraw:;
            framingBlock:
               [:box |   (box origin + (50 @ 0)) corner: box corner ]).
   self openWindow.
   barPen := plotPane pen.
   barPen setLineWidth: 1.
   self black.!
 
paleGray
"Set the bar to pale gray."
barPen setSolidBrush: ClrPalegray.!
  
plotMenu: thePlotPane
   "Answer the menu for the plot pane."
| firstMenu colorSubmenu optionSubmenu |
firstMenu := Menu new.
optionSubmenu := Menu new.
colorSubmenu :=
   (Menu
      labels: '&Black\&Dark gray\&Light gray' withCrs
      lines: #()
      selectors: #(black darkGray paleGray))
      owner: self;
      title: ' ~BarColor'.
optionSubmenu
   appendItem: 'Stretch &Factor' selector: #factor;
   appendItem: 'Bar & Width' selector: #barWidth;
   appendSubMenu: colorSubmenu;
   title: '~Options';
   owner: self.
firstMenu
   appendItem: '&Erase plot' selector: #clearPlot;
   appendItem: '&Redo plot' selector: #newPlot;
   appendSeparator;
   appendItem: '&Horizontal bar' selector: #setHorizontal;
   appendItem: '&Vertical bar' selector: #setVertical;
   appendSeparator;
   appendSubMenu: optionSubmenu;
   appendItem: 'Restore &Defaults' selector: #restoreDefaults;
   title: '~Plot'.
^plotPane setMenu: firstMenu.!
  
promptFor: aString default: anObject validateWith: aBlock
      "Prompt the user to supply a new value for what is
      described by aString. Present anObject as the default.
      If the user's response is nil, answer anObject. If it is
      not nil, validate it. If it is not valid, tell the user,
      and answer anObject, otherwise answer the user's response."
   | response |
   response :=
      Prompter
         prompt: 'Enter a new value for ' , aString
         defaultExpression: anObject printString.
   (response isNil)
      ifTrue: [ ^anObject ].
   (aBlock value: response)
      ifTrue: [ ^response ]
      ifFalse: [
         Menu message:
            response printString , ' is not a valid ' , aString.
            ^anObject ]!

redraw: theDataPane
| newData |
newData := dataPane contents.
self newData: newData.!

setHorizontal
   "Change the plot type to horizontal bar"
   plotSelector := #horizontalBar:!
 
setVertical
   "Change the plot type to vertical bar"
   plotSelector := #verticalBar:!
   
verticalBar: theData
      "Draw a vertical bar plot of theData, an ordered
      collection of integers."
   | x y |
   x := 0.
   y := 245.
   barPen
      setLineWidth: 1;
      drawRetainPicture: [
   theData do: [ :value |
            barPen place: x @  y ;
            boxFilled: x + barWidth @ (y - (factor * value)).
            x := x +   barWidth + barSpacing]].! !
