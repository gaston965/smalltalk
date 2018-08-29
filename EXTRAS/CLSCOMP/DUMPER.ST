
"
dumper.st - ClassDumper installation script
"

"
This script installs the ClassDumper into a pre-VPM1.3 or
pre-VWin2.0 image.  Execute the script by filing it in or invoking doit.
"
    | srcDir oldClass references | 

    srcDir := Prompter
        prompt: 'Specify source directory'
        default: Directory current fullDirName, 'EXTRAS\CLSCOMP\'.
    srcDir isNil ifTrue: [^nil].

    Transcript cr; show: 'Filing in ClassDumper... '.
    (File pathNameReadOnly: srcDir, 'dumper.cls') fileIn; close.
    Transcript show: 'done'; cr.

    (MessageBox confirm: 'Do you want to see the ClassDumper documentation?')
        ifTrue: [
            TextWindow new openOnFile: 
                (File pathNameReadOnly: srcDir, 'dumper.txt')].


