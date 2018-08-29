
!Window methods !
wmWinIniChange:wordInteger with: longInteger
        "Private - Process the system initialization file
         WIN.INI change message."
    ^nil! !

!TopPane methods !
wmWinIniChange:wordInteger with: longInteger
        "Private - Process the system initialization file
         WIN.INI change message."
    self sendInputEvent: #winIniChange:
        with: (String fromAddress: (WinAddress fromString: longInteger)).
    ^nil!

winIniChange: aString
        "Private - The Windows initialization file WIN.INI changed."
    (aString equalsIgnoreCase: 'intl')
        ifTrue: [ NationalLanguage initialize].! !


