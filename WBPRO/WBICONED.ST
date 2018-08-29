"
******************************************************************************
Application : WBIconEditor
Date        : Sep 13, 1996
Time        : 17:25:42

Classes : 
    WBIconEditor 

Methods : 

******************************************************************************
"!

IconEditor subclass: #WBIconEditor
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''!




!WBIconEditor class methods !
 
isWBInternalClass

    ^true! !



!WBIconEditor methods !

fileName
    ^fileName!

fromFile: aFileName
    fileName := aFileName.
    ^super fromFile: aFileName!

saveIconAs
        "Private - User selected Save Icon As... from the File menu."
    | dialog file |
    dialog := FileDialog new
                        saveTitle: 'Save Icon'
                        fileName: '*.ico'.
    file := dialog file.
    file isNil ifTrue: [^self].
    fileName := file.
    (Icon fromBitmap: xorMask andMask:andMask) outputToFile: file.
    changeFlag := false! !

"construct application"
((Smalltalk at: #CPApplication ifAbsent: [])
    isKindOf: Class) ifTrue: [
        ((Smalltalk at: #CPApplication) for:'WBIconEditor')
            addClass: WBIconEditor;
            comments: nil;
            initCode: nil;
            finalizeCode: nil;
            fileName: 'WBIconed.st';
            startUpCode: nil]!
