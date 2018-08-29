"Smalltalk code from Chapter 10 of the Smalltalk/V Tutorial"!

! AnimalHabitat methods !

closeBrowser
        "Set the browser to nil."
    browser := nil ! !


! AnimalHabitatWindow methods !

answer: aString
        "Output aString to the reply Pane."
    replyStream
        nextPutAll: aString;
        cr!

close
        "Window is to be closed, disconnect the habitat
        instance from the window before killing the window."
    habitat closeBrowser.
    ^super close !

input: aPane
        "Initialize inputPane with the string stored in the
        script of the owning window's associated habitat."
    aPane contents: habitat scriptString! 

inputMenu: aPane
        "Set the menu for the aPane text pane."
    aPane setMenu: ( (Menu
        labels: '~Play Selection\Play ~All' withCrs
        lines: Array new
        selectors: #(playSelection playAll ) )
            title: '~Habitat';
            owner: self;
            yourself)!

pictures: animationPane
        "Initialize animation pane objects."
    animationPane contents: (
        habitat animals collect: [:animal | animal picture])!

playAll
        "Accept the entire content of the pane
         as the script and play it to animals."
    self changed: #reply:.
    CursorManager execute change.
    habitat script: inputPane contents.
    habitat play.
    CursorManager normal change!

playSelection
        "Accept selected string as the script
         and play it to animals."  
    self changed: #reply:.
    CursorManager execute change.
    habitat script: inputPane selectedString.
    habitat play.
    CursorManager normal change!

reply: replyPane
        "Initialize reply pane with an
         empty String."
    replyStream contents: String new! !

