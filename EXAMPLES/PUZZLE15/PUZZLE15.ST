    Smalltalk at: #PuzzleText put: Dictionary new!

    | srcDir |
    srcDir := Prompter
        prompt: 'Verify source directory (change if necessary)'
        default: 'examples\puzzle15\'.
    srcDir isNil ifTrue: [^nil].
    StringDictionaryReader fill: PuzzleText
        fromStringTable: (srcDir, 'Puzzle15.RC').
    (File pathName: (srcDir, 'Pzzl15Cl.CLS')) fileIn; close.
    (File pathName: (srcDir, 'Puzzle15.CLS')) fileIn; close.!

