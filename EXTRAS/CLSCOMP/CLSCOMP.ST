"
clscomp.st - ClassComparisonTool installation script
"

"
This script installs the ClassComparisonTool.
Execute the script by filing it in or invoking doit.
"
    | srcDir | 

    (Smalltalk respondsTo: #version)
        ifFalse: [
            MessageBox message:
                'Cannot install ClassComparisonTool in this image - requires VW 1.1 or VPM 1.3 or later'.
            ^nil].

    srcDir := Prompter
        prompt: 'Specify source directory'
        default: Directory current fullDirName, 'EXTRAS\CLSCOMP\'.
    srcDir isNil ifTrue: [^nil].

    Transcript cr; show: 'Filing in ClassComparisonTool... '.
    (File pathNameReadOnly: srcDir, 'dialogs.cls') fileIn; close.
    ( Smalltalk includesKey: #ClassDumper ) ifFalse: [
        (File pathNameReadOnly: srcDir, 'dumper.cls') fileIn; close.
    ].
    (File pathNameReadOnly: srcDir, 'clscomp.cls') fileIn; close.
    Transcript show: 'done'; cr.

    (MessageBox confirm: 'Do you want to see the ClassComparisonTool documentation?')
        ifTrue: [
            TextWindow new openOnFile: 
                (File pathNameReadOnly: srcDir, 'Clscomp.txt')].


