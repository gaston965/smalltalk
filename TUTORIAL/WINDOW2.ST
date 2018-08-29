"Smalltalk code from Chapter 10 of the Smalltalk/V Tutorial"! 

! AnimalHabitatWindow methods !
openOn: anAnimalHabitat
        "Create a single pane window with the script
         of anAnimalHabitat as its initial contents."
    habitat := anAnimalHabitat.
    self label: 'Habitat'.
    self addSubpane:
        (TextPane new
            owner: self;
            when: #getContents perform: #input:).
    self openWindow! 

input: aPane
        "Initialize inputPane with the string stored in the 
        script of the owning window's associated habitat."
    aPane contents: habitat scriptString! !


