"
VWObjFlr.st
Copyright 1991, 1992 Digitalk Inc.
"

" Install the Smalltalk/V Windows ObjectFiler "

    | dir |

    " get directory "
    dir := Prompter
        prompt: 'Install from directory:'
        default: Disk fullDirName, 'Extras\ObjFiler\'.
    dir isNil ifTrue: [^nil].
    ((dir at: dir size) = $\)
        ifFalse: [dir := dir, '\'].

    CursorManager execute change.
    Transcript cr;
        show: 'Filing in ObjectFiler on ', Date today printString; cr;
        show: '... source directory: ', dir; cr.

    " Methods " 
    Transcript show: '... ObjectFiler support methods in base system classes'; cr.
    (File pathNameReadOnly: dir, 'VWObFlr.mth') fileIn; close.

    " Classes " 
    Transcript show: '... LargeIdentity class'; cr.
    (File pathNameReadOnly: dir, 'LrgIdDct.cls') fileIn; close. 
    Transcript show: '... ObjectLoadDialog class'; cr.
    (File pathNameReadOnly: dir, 'ObjctLdD.cls') fileIn; close. 
    Transcript show: '... ObjectFiler class'; cr.
    (File pathNameReadOnly: dir, 'ObjctFlr.cls') fileIn; close. 
    (Smalltalk at: #ObjectLoadDialog) initialize.
    (Smalltalk at: #ObjectFiler) initialize.

    Transcript show: '... done'; cr. 
    CursorManager normal change.
    

