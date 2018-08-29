"This file installs the Dashboard application.  To install
 this application evaluate the following expression:

    (File pathName: 'examples\dashbord\dashbord.st') fileIn; close.

 The file dashbord.txt contains a brief explanation and user's
 guide.

 To open the dashboard, evaluate the following expression:

    Dashboard new open

"!

"File in the ControlApparatus class hierarchies"!

(Smalltalk includesKey: #ControlApparatus)
    ifFalse: [
        (File pathName: 'examples\dashbord\cntrlapp.cls') fileIn; close]. 
    
(File pathName: 'examples\dashbord\dashbord.cls') fileIn; close!

