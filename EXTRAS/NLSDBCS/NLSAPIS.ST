
!KernelDLL methods !

isDBCSLeadByte: aChar
    <api: IsDBCSLeadByte ushort boolean>
    ^ UserLibrary isTwoByteCharPrefix: aChar! !

!UserDLL methods !

isCharUpper: aChar
    <api: IsCharUpper ushort boolean>
    ^self invalidArgument! 

isCharLower: aChar
    <api: IsCharLower ushort boolean>
    ^self invalidArgument!
 
isCharAlpha: aChar
    <api: IsCharAlpha ushort boolean>
    ^self invalidArgument!

isCharAlphaNumeric: aChar
    <api: IsCharAlphaNumeric ushort boolean>
    ^self invalidArgument!

isTwoByteCharPrefix: aChar
    <api: IsTwoByteCharPrefix ushort boolean>
    ^self invalidArgument!

ansiUpperBuff: aString length: anInteger
    <api: AnsiUpperBuff struct ushort ushort>
    ^self invalidArgument!

ansiUpper: aString
    <api: AnsiUpper struct ulong>
    ^self invalidArgument!

ansiLowerBuff: aString length: anInteger
    <api: AnsiLowerBuff struct ushort ushort>
    ^self invalidArgument!

ansiLower: aString
    <api: AnsiLower struct ulong>
    ^self invalidArgument!

lStrCmp: aString1 withString: aString2
        "The comparison is case-sensitive.
          All strings must be less than 64K in size."
    <api: lStrCmp struct struct short>
    ^self invalidArgument! 

lStrCmpi: aString1 withString: aString2
        "The comparison is case-insensitive.
          All strings must be less than 64K in size."
    <api: lStrCmpi struct struct short>
    ^self invalidArgument! !

