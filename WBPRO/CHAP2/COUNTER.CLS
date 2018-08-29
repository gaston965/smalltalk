
ViewManager subclass: #Counter
  instanceVariableNames: 
    'value '
  classVariableNames: ''
  poolDictionaries: '' !


!Counter class methods !
 
example
    "Demonstrate the creation of a new Counter"
    Counter new open! !



!Counter methods !
 
decrement: aButton
    "Subtract 1 from the value of the counter"
    value := value - 1.
    self changed: #values:!

increment: aButton
    "Add 1 to the value of the counter"
    value := value + 1.
    self changed: #values:!
   
initialize
    "Initialize the value of the counter to 0"
    super initialize.
    value := 0!
  
initWindowSize
    ^Display extent * 2 // 5!
   
open
    "Open the Counter application window"
    self label: 'Counter Example';
        owner: self;
    addSubpane: (StaticText new
            owner: self;
            when: #getContents perform: #values:;
            framingRatio: (3/4 @ 0 corner: 1 @ 1));
   addSubpane: (Button new
            defaultPushButton;
            contents: 'INCREMENT';
            when: #clicked perform: #increment:;
            framingRatio: (0 @ 0 corner: 1 @ 1/2));
    addSubpane: (Button new
            pushButton;
            contents: 'DECREMENT';
            when: #clicked perform: #decrement:;
            framingRatio: (0 @ 1/2 corner: 1/2 @ 1));
    openWindow.!

values: aStaticText
    "Set the value of the counter in the StaticText pane"
    aStaticText contents: value printString! !
