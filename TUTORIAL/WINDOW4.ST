"Smalltalk code from Chapter 10 of the Smalltalk/V Tutorial"!


! AnimalHabitatWindow methods !    

openOn: anAnimalHabitat
        "Create a single pane window with the script
         of anAnimalHabitat as its initial contents."
    habitat := anAnimalHabitat.
    self label: 'K E N N E L'.
    self addSubpane:
        (replyStream := TextPane new
            owner: self;
            when: #getContents perform: #reply: ;  
             framingRatio: (Rectangle leftTopUnit
                extentFromLeftTop: 2/3 @ (1/4) ) ).
    self addSubpane:
        (AnimationPane new
            owner: self;
            when: #getContents perform: #pictures: ;
            framingRatio: (Rectangle leftBottomUnit
                extentFromLeftBottom: 2/3 @ (3/4) ) ).
    self addSubpane:
        (inputPane := TextPane new
            owner: self;
            when: #getMenu perform: #inputMenu: ;
            when: #getContents perform: #input: ;
            framingRatio: ((Rectangle leftTopUnit rightAndDown: (2/3 @ 0) ) 
                 extentFromLeftTop: 1/3 @ 1) ).
    self openWindow!

initWindowSize
        "Answer the initial window extent."
    ^(Display boundingBox insetBy: 16@16) extent ! !



