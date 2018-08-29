"
MDI.st
Copyright 1992 Digitalk Inc.

This file installs:
    StatusPane and ToolPane classes
    MDI classes 
    It is possible to install separately the StatusPane and
ToolPane classes.
    Nevertheless the MDI classes need the the previous project
(ToolPane and StatusPane) to be filed in.
"

" Install the VW 2.0 MDI "

    | dir continue|

    continue := MessageBox confirm: 'At the end of the MDI installation ',
    'the Notifier will be reinitialized.  Continue ?'.
    continue
        ifFalse: [self error:'MDI installation stopped'].

    " get directory "
    dir := Prompter
        prompt: 'Install from directory:'
        default: Disk drivePathName, '\Extras\MDI\'.
    dir isNil ifTrue: [^nil].
    ((dir at: dir size) = $\)
        ifFalse: [dir := dir, '\'].

    CursorManager execute change.
    Transcript cr;
        show: '... source directory: ', dir; cr.

    " ToolPane and StatusPane Windows 3.1. "
    Transcript cr;show: '... ToolPane , StatusPane support'.
    (File pathNameReadOnly: dir, 'toolpane.vc') fileIn; close.
    (File pathNameReadOnly: dir, 'toolpane.vm') fileIn; close.

    " MDI "
    Transcript cr;show: '... MDI support'.
    (File pathNameReadOnly: dir, 'mdi.vc') fileIn; close.
    (File pathNameReadOnly: dir, 'mdi.vm') fileIn; close.
    Notifier mdiInitialize!    

    
    Smalltalk notifyAtStartUp: MDIFrame!
    Smalltalk notifyAtStartUp: MDIChild!
    MDIFrame startUp.
    MDIChild startUp!

    Transcript cr;show: '... done'. 
    CursorManager normal change!
    
    Notifier reinitialize.    

