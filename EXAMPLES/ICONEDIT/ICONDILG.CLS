
WindowDialog subclass: #IconDialog
  instanceVariableNames: 
    'exeFile icon '
  classVariableNames: ''
  poolDictionaries: ''  !


!IconDialog class methods ! !



!IconDialog methods !
   
cancel:aButton
        "Private - The user has clicked the Cancel button"

    icon:=nil.
    self close.!
  
icon
        "Answer the selected icon -
        nil if no selection or if the cancel button has been clicked on"

    ^icon!
   
icons:aListBox
        "Private - Set the contents of aListBox"
    |list|
    list:=OrderedCollection new.
    exeFile icons do:[:each |
        list add: (each id printString,'        ',each name)].
    aListBox contents:list.!
 
initWindowSize
        "Private - Answer the window size."

    ^(40 @ 15) * WindowDialog unitMultiplier!

ok:aButton
        "Private - The user has clicked the OK button"

    self close.!
  
openOn:anExeFile
        "Open an Icon Dialog
        Display all icon ids in anExeFile"

    |lineHeight charHeight charWidth|
    exeFile:=anExeFile.
    lineHeight := WindowDialog entryHeight.
    charHeight := WindowDialog charHeight.
    charWidth := WindowDialog charWidth.
    self label:'Icons on: ',exeFile fileName.
    self addSubpane:
        (ListBox new
            when:#getContents perform:#icons:;
            when:#select perform:#select:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 5) @ (lineHeight)
                    extent: (charWidth * 30) @ (charHeight*10) ] ).

    self addSubpane:
        (Button new
            contents:'Ok';
            when:#clicked perform:#ok:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 8) @ (lineHeight *8)
                    extent: (charWidth * 10) @ (charHeight*2) ] ).

    self addSubpane:
        (Button new
            contents:'Cancel';
            when:#clicked perform:#cancel:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 23) @ (lineHeight *8)
                    extent: (charWidth * 10) @ (charHeight*2) ] ).


    self openWindow.!
 
select:aListBox
        "Private - The use has selected an Icon"

    icon:=exeFile icons at:(aListBox selection).! !
