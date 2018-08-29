"Smalltalk code from Chapter 10 of the Smalltalk/V Tutorial"!

!AnimalHabitatWindow methods !

openOn: anAnimalHabitat
        "Create a single pane window with the script
         of anAnimalHabitat as its initial contents."
    habitat := anAnimalHabitat.
    self label: 'Habitat'.
    self addSubpane: TextPane new.
    self openWindow!
                 
                                                    
