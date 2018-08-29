| files path directory textFile|
path := 'chap07\'. 
files := #('calendar.cls' 'nwclndrf.mth' 'clndrapp.cls' 'clndrapp.wb1').
textFile := 'chap7.wsp'.
File allInstances do: [ :f |
    (f name notNil and: [ f name asLowerCase = 'filemein.st' ]) ifTrue: [
        path := (directory := f directory) drivePrefix, directory pathName, '\'.
    ].
].
path isNil ifTrue: [
    path := Directory current drivePathName, '\'.
].
(File exists:( path, (files at: 1)))
ifFalse:[
path := Prompter prompt: 'Path is Invalid, Please correct this path'
 default: (path).
path isNil ifTrue: [Transcript show: 'Canceled ...'; cr. ^self]].
Transcript cr.
(File exists: (path, (files at: 1)))
    ifFalse:[Transcript show: 'Entered path: ' ,path, ' is still invalid. Exiting ...';cr. ^self].
files do: [:each |
                Transcript show: 'Loading File ',each printString,' ...';cr.

               (File pathName: path,each) fileIn; close
                ].textFile notNil
        ifTrue: [ TextWindow new openOnFile: (File pathName: path,textFile)].
Transcript cr; show: 'Done ...';cr.


"Use this code to create file name array, simply replace path
   with correct path.
 (Directory pathName:
    (Disk drivePathName,'\chap7')) filesNamed: '*.*'.  

"
 
