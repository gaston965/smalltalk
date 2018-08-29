"
nlsdbcs.st  - Install script for NLS/DBCS support feature
"
    | srcDir |

    srcDir := Prompter
        prompt: 'Directory containing source code:'
        default: 'extras\nlsdbcs\'.
    srcDir isNil ifTrue: [^self].

    Transcript
        cr; show: 'Installing Single-Byte NLS support ';
        show: Date dateAndTimeNow printString; cr;
        show: '... source directory = ', srcDir; cr.

    Transcript show: '... new WinConstants for date format'; cr.
    (File pathNameReadOnly: srcDir, 'nwwincon.st') fileIn; close.

    Transcript show: '... new NLS support for system Kernel & User APIs'; cr.
    (File pathNameReadOnly: srcDir, 'nlsapis.st') fileIn; close.

    Transcript show: '... new virtual-machine NLS support'; cr.
    (File pathNameReadOnly: srcDir, 'vwvmdll.cls') fileIn; close.

    Transcript show: '... new class NationalLanguageSupport '; cr.
    (File pathNameReadOnly: srcDir, 'ntnllngg.cls') fileIn; close.
    Smalltalk at: #NationalLanguage put: (Smalltalk at: #NationalLanguageSupport) new.
    (File pathNameReadOnly: srcDir, 'ntcllttl.mth') fileIn; close.

    Transcript cr; show: '... language specific formatting'; cr.
    (File pathNameReadOnly: srcDir, 'dateext.st') fileIn; close.
    (Smalltalk at: #Date) initialize.
    (File pathNameReadOnly: srcDir, 'dateini.mth') fileIn; close.
    (File pathNameReadOnly: srcDir, 'langfmt.st') fileIn; close.

    Transcript cr; show: '... character & string enabling'; cr.
    (File pathNameReadOnly: srcDir, 'charactr.st') fileIn; close.
    (File pathNameReadOnly: srcDir, 'string.st') fileIn; close.
    (File pathNameReadOnly: srcDir, 'streqfix.st') fileIn; close.

    " Window message notifying WIN.INI change"
    Transcript show: '... monitor Control Panel change'; cr.
    WinEvents at: 26 put: #wmWinIniChange:with:.
    (File pathNameReadOnly: srcDir, 'inichnge.st') fileIn; close.

    Transcript show: '... done single-byte support.'; cr.


    "### The following installs the DBCS support###"

    Transcript
        cr; show: 'Installing full NLS with DBCS support';
        show: Date dateAndTimeNow printString; cr;
        show: '... source directory = ', srcDir; cr.

    Transcript show: '... add DBCS support to Character class'; cr.
    CharacterConstants at: 'DoubleByteSpace' put: (16r20 asCharacter).
    (File pathNameReadOnly: srcDir, 'charext.st') fileIn; close.
    CharacterConstants at: 'DoubleByteSpace' put: (16r8140 asCharacter).

    Transcript show: '... add virtual-machine DBCS support'; cr.
    (File pathNameReadOnly: srcDir, 'vwvmdll.st') fileIn; close.

    Transcript show: '... new DoubleByteString class'; cr.
    (File pathNameReadOnly:  srcDir, 'dblbytin.cls') fileIn; close.
    (File pathNameReadOnly:  srcDir, 'dblbytst.cls') fileIn; close.

    Transcript cr;show: '... new DoubleByteSymbol class'; cr.
    (File pathNameReadOnly:  srcDir, 'dblbytsy.cls') fileIn; close.

    Transcript show: '... add misc DBCS support'; cr.
    (Smalltalk at: #NationalLanguage) initialize.
    (File pathNameReadOnly: srcDir, 'ntnllext.st') fileIn; close.
    (File pathNameReadOnly:  srcDir, 'strngext.st') fileIn; close.
    (File pathNameReadOnly:  srcDir, 'bytarext.st') fileIn; close.
    (File pathNameReadOnly: srcDir, 'symbext.st') fileIn; close.
    (File pathNameReadOnly: srcDir, 'winadext.st') fileIn; close.
    (File pathNameReadOnly:  srcDir, 'rplbyts.st') fileIn; close.

    Transcript show: '... add DBCS support to Stream'; cr.
    (File pathNameReadOnly: srcDir, 'mxdflstr.cls') fileIn; close.
    (File pathNameReadOnly: srcDir, 'filstext.st') fileIn; close.

     Transcript show: '... add DBCS enablement of mixed file stream'; cr.
    (File pathNameReadOnly: srcDir, 'onflstrm.mth') fileIn; close.

    Transcript show: '... add workaround for getCharWidth API not supporting DBCS.'; cr.
    Smalltalk at: #DBString put: ((Smalltalk at: #DoubleByteString) new: 1).

    "If the ObjectFiler is resident then reinitialize it for NLS/DBCS to take effect"
    (Smalltalk at: #ObjectFiler ifAbsent: [ nil ]) notNil
        ifTrue: [ (Smalltalk at: #ObjectFiler) initialize ].

    Transcript show: '... done.'; cr.
    Transcript cr; show: 'NOTICE: If you are running on a DBCS System' ;cr.
    Transcript show: 'NOTICE: please Save and restart your image.' ;cr.

