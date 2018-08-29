
DynamicLinkLibrary variableByteSubclass: #TestInterruptDLL
  classVariableNames: ''
  poolDictionaries: ''  !


!TestInterruptDLL class methods !

fileName
    ^'vwint.dll'! !



!TestInterruptDLL methods !

setInterruptTimer: milliseconds
    <api: SetInterruptTimer ushort ushort>
    ^self invalidArgument! !
