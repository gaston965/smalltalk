"Smalltalk code from Chapter 10 of the Smalltalk/V Tutorial"! 

!AnimalHabitat methods!

browse
        "Open a window on the receiver."
    browser := AnimalHabitatWindow new openOn: self! 

browser
        "Return the browser window for the habitat"
    ^browser! !

! AnimalHabitatWindow methods !

answer: aString
        "Output aString to the reply Pane."
    Transcript
        nextPutAll: aString;
        cr!

inputMenu: aPane
        "Set the menu for the aPane text pane."
    aPane setMenu: ( (Menu
        labels: '~Play Selection\Play ~All' withCrs
        lines: Array new
        selectors: #(playSelection playAll ) )
            title: '~Habitat';
            owner: self;
            yourself)!

openOn: anAnimalHabitat
        "Create a single pane window with the script
         of anAnimalHabitat as its initial contents."
    habitat := anAnimalHabitat.
    self label: 'Habitat'.
    self addSubpane:
        (inputPane := TextPane new
            owner: self;
            when: #getContents perform: #input: ;
            when: #getMenu perform: #inputMenu: ).
    self openWindow!

playAll
        "Accept the entire content of the pane
         as the script and play it to animals."
    CursorManager execute change.
    habitat script: inputPane contents.
    habitat play.
    CursorManager normal change!

playSelection
        "Accept selected string as the script
         and play it to animals."
    CursorManager execute change.
    habitat script: inputPane selectedString.
    habitat play.
    CursorManager normal change! !


