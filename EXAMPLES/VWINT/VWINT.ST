"This file will install a Smalltalk code that demonstrates user interrupts.
For more info on user interrupt look at 'vwint.txt' in 'docs' subdirectory.
To install this sample code, first have 'vwint.dll' in your path.
Then, evaluate the following expression:

    (File pathName: 'examples\vwint\vwint.st') fileIn; close.

To test user interrupt capabilities, evaluate the following expression:

 
|intDLL|
intDLL := TestInterruptDLL open.
intDLL setInterruptTimer: 3000.
intDLL close
"!

    (File pathName: 'examples\vwint\tstintrr.cls') fileIn; close.
    (File pathName: 'examples\vwint\tstintrr.mth') fileIn; close.
    InterruptSelectors at: 12 put:#testInterrupt.!





