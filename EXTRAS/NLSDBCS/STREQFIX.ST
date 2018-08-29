"
Have to do this until the string compare is made truely case insensitive....
NationalLanguageSupport>>string:isEqualToIgnorCase: - new support method
String>>equalsIgnoreCase: - call NLS case insensitive string compare API.

These changes will be added to the base image in the next release.
SystemDictionary>>imageName - discard newly added command line option /LANG...
SystemDictionary>>save - same as above
  ###ISSUE - should DB characters be ever allowed in filenames?
File class>>fileName:extension: - allow DB characters in fileName
FileDialog>>fileSpec:  - to go with the above change.
WinDialogInfo class - allow DB characters in dialog item text
  >>itemTemplateStyle:x:y:cx:cy:id:className:text: 
  >>dialogTemplateStyle:itemCount:x:y:cx:cy:menuName:className:text:
DynamicDataExchange - do asAsciiZ on formattedData before to getting size in bytes.
  >>pokeTo:release:format:data:item:
  >>dataTo:ackReq:release:requested:format:data:item:
DDEAuxServer 
  >>wmDdePoke:with: - do asNormalizedString on formattedData in case it is a DB string.  
  >>wmDdeExecute:with: - do asNormalizedString on command in case it is a DB string.
DDEAuxClient
  >>wmDdeAck:with: - do asNormalizedString on command in case it is a DB string. 
  >>wmDdeData:with: - do asNormalizedString on formattedData in case it is a DB string.
"!

!NationalLanguageSupport methods !

string: aString1 isEqualToIgnorCase: aString2
        "Answer true if aString1 is equal to aString2
         in the current sort sequence, else answer false.
         The comparison is not case sensitive."
    ^(self compareStringi: aString1 withString: aString2) = 0! !


! String methods !

equalsIgnoreCase: aString
        "Answer true if the reciever is equal to
         aString, anse answer false.
         The compairision is not case sensitive."
   " ^self <= aString and: [(self < aString) not] "
    ^NationalLanguage string: self isEqualToIgnorCase: aString! !


!SystemDictionary methods !

imageName
        "Private - Answers the name of the image.  For the runtime
         application, this is the name of the exe."
    | imageName string|

    "Check to see if VWin was invoked with  a image parameter"
    self isRunTime
        ifTrue: [
            string := String new: 256.
            KernelLibrary getModuleFileName: WIN hInstance
                    name: string size: string size.
            ^ string trimBlanks].
    imageName := String new:50.
    WinAddress copyFrom: WinAddress getVWargs to: imageName count: 50.
    imageName := imageName trimNullTerminator.
    imageName := imageName asStream upTo: $/.  "discard comand line options"
    imageName := (imageName asStream upTo: $-) trimBlanks.
    imageName size > 0
        ifFalse:[ imageName := 'v.exe'].
    ^ imageName! 

save
        "Private - Truncate and Save image on image file.
        Returns true if the image was saved, false
        if the image was not saved."
    | aFile hFile stubLength stubBuffer imageName backupName
     fileName int handles answer |

    "Check to see if VWin was invoked with  a image parameter"
    imageName := String new:50.
    WinAddress copyFrom: WinAddress getVWargs to: imageName count: 50.
    imageName := imageName trimNullTerminator.
    imageName := imageName asStream upTo: $/.  "discard comand line options"
    imageName := (imageName asStream upTo: $-) trimBlanks.
    imageName size > 0
        ifFalse:[ imageName := 'v.exe'].

    "Delete v.old to free up disk space"
    backupName := File splitPath: imageName in: Disk.
    fileName := backupName at: 3.
    fileName fileExtension trimBlanks size = 0
        ifTrue: [
            imageName := imageName, '.exe'].
    backupName := File drive: (backupName at: 1)
        path: (backupName at: 2)
        file: (((ReadStream on: (backupName at: 3))
                upTo: $.) , '.bak').
    BackupImage ifTrue: [
        File remove: backupName ifAbsent:[nil]].

    aFile := (File pathName: imageName) asByteFileStream.
    aFile atEnd
        ifTrue:[ aFile close]
        ifFalse:[
        stubLength := (WinStructure fromBytes: (aFile next: 36))
                                uLongAtOffset:32.
        aFile position: 0.
        stubBuffer := aFile next: stubLength.
        aFile close.

        "If BackupImage is false then delete v.exe"
        BackupImage
            ifTrue:[
                File rename: imageName to: backupName]
            ifFalse:[
                File remove: imageName].

        ((hFile := KernelLibrary openFile: Disk drivePathName, '\vwimage.tmp' asParameter
                        reopenBuffer: (WinOfstruct new) asParameter
                        style: OfCreate "| OfShareExclusive") == -1)
            ifTrue:[
                MessageBox message: 'Could not open Image file'.
                ^ False].

        KernelLibrary lwrite: hFile
                            string: stubBuffer asParameter
                            size: stubBuffer size.
        KernelLibrary lclose: hFile].

    int := Process enableInterrupts: false.
    DynamicLinkLibrary withAllSubclasses do: [:class |
        class clearCachedAddresses].
    handles := IdentityDictionary new.
    File allInstancesPrim do: [:each |
        handles at: each put: each fileId.
        each fileId: nil].
    answer := self savePrim.
    handles associationsDo: [:a |
        a key fileId: a value].
    Process enableInterrupts: int.

    (answer isNil)
        ifTrue:[
            MessageBox titled:'Insufficient Disk Space'
                withText: 'Could not save image.  Set BackupImage global variable to false or free up disk space WITHOUT exiting Smalltalk and please try again.'
                style: MbOk | MbIconexclamation.
            ^ false ]
        ifFalse:[
            File remove: imageName ifAbsent: [nil].
            self openChangeLogIn: (Sources at: 2) file directory.
            self logEvaluate:
                    '""*** saved image on: '
                    , Date today printString, ' '
                    , Time now printString, ' ***""'.
            (Sources at: 2) flush].
        File rename: 'vwimage.tmp' to: imageName.
        ^ true.! ! 


!File class methods !

fileName: nString extension: eString
        "Answer a String which is a file name abbreviated
         from nString and eString. Lower case
         vowels are dropped from the right of nString
         until it is less than or equal to 8 characters."
    | size aString |
    size := nString size.
    aString :=
        (nString reversed select: [ :char |
        (char isVowel and: [char isLowerCase])
            ifTrue: [(size := size - 1) < 8]
            ifFalse: [true]]) reversed, '       '.
    size := 0.
    aString := aString select: [ :char |
        ((char isDoubleByte)
            ifTrue: [size := size + 2]
            ifFalse: [size := size + 1]) <= 8].
    ^(aString) trimBlanks,
        (String with: $.),
        ((eString, '   ') copyFrom: 1 to: 3) trimBlanks! !


!FileDialog methods !

fileSpec: aFileSpec
        "Sets the initial fileName of the edit control in the
            File Dialog."
    | aFileSpecAddress pFileSpec |
    pFileSpec := aFileSpec asParameter.

    aFileSpecAddress := WinAddress allocateMemory: 512.
    openFileNameStruct lpstrFile: (aFileSpecAddress replaceFrom: 1 to: pFileSpec size with: pFileSpec startingAt: 1) asParameter.
    openFileNameStruct nMaxFile: aFileSpecAddress memorySize.! !



!WinDialogInfo class methods !

dialogTemplateStyle: style itemCount: itemCount x: x y: y cx: cx cy: cy menuName: menuName className: className text: text
        "Private - Answer a new dialog template
         with its attributes set from the parameters."
    |size dlgTemplate classNameOffset textOffset ptext |

    size := 13.         "Base DLGTEMPLATE size"
    classNameOffset := size := size + menuName size + 1.
    textOffset := size := size + className size + 1.
    ptext := (text isNil
        ifTrue: [ String new ]
        ifFalse: [ text ]) asParameter.
    size := size + ptext size.

    dlgTemplate := self new: size.
    dlgTemplate uLongAtOffset: 0 put: style.
    dlgTemplate byteAtOffset: 4 put: itemCount.
    dlgTemplate uShortAtOffset: 5 put: x.
    dlgTemplate uShortAtOffset: 7 put: y.
    dlgTemplate uShortAtOffset: 9 put: cx.
    dlgTemplate uShortAtOffset: 11 put: cy.
    dlgTemplate bytesAtOffset: 13 put: menuName asParameter.
    dlgTemplate bytesAtOffset: classNameOffset put: className asParameter.
    dlgTemplate bytesAtOffset: textOffset put: ptext.

    ^dlgTemplate!

itemTemplateStyle: style x: x y: y cx: cx cy: cy id: id className: className text: text
        "Private - Calculate the size of a dialog item template
         and answer a new item template with attributes
         set from the arguments."
    |size dlgItemTemplate extraDataSizeOffset textOffset ptext |

    size := 14.         "Base DLGITEMTEMPLATE size"
    textOffset := size := size + className size + 1.
    ptext := (text isNil
        ifTrue: [ String new]
        ifFalse: [ text ])asParameter.
    extraDataSizeOffset := size := size + ptext size.
    size := size + 1.

    dlgItemTemplate := self new: size.
    dlgItemTemplate uShortAtOffset: 0 put: x.
    dlgItemTemplate uShortAtOffset: 2 put: y.
    dlgItemTemplate uShortAtOffset: 4 put: cx.
    dlgItemTemplate uShortAtOffset: 6 put: cy.
    dlgItemTemplate uShortAtOffset: 8 put: id.
    dlgItemTemplate uLongAtOffset: 10 put: style.

    dlgItemTemplate bytesAtOffset: 14 put: className asParameter.
    dlgItemTemplate bytesAtOffset: textOffset put: ptext.
    dlgItemTemplate byteAtOffset: extraDataSizeOffset put: 0.

    ^dlgItemTemplate! !


!DynamicDataExchange methods !

pokeTo: to release: release format: format data: value item: item
        "Private - Send data value in specified format to the server"
    |aItemName data hData answer formattedData|
    aItemName := WinHandle stringToAtom: item.
    formattedData := value.
    format = CfText
        ifTrue: [ formattedData := formattedData asAsciiZ].
    data :=WinStructure new: 4 + formattedData size.
    data uShortAtOffset: 0 put: 0.
    release ifTrue: [
        data uShortAtOffset: 0 put: (data uShortAtOffset: 0) | 16r2000].
    data uShortAtOffset: 2 put: format.
    data bytesAtOffset: 4 put: formattedData.

    hData := WinAddress memoryHandleFrom: data contents
          withAllocFlag: GmemDdeshare | GmemMoveable.

    answer := self postTo: to
           msg: WmDdePoke
           lParamLo: hData
           lParamHi: aItemName.
    answer ifFalse: [
        "PostMessage failed destroy atom and memory"
        WinHandle deleteAtom: aItemName.
         KernelLibrary globalFree: hData]
        ifTrue:[pendingAck:= #WmDdePoke].
    ^answer.!


dataTo: to ackReq: ackReq release: release requested: requested format: format data: value item: item
        "Private - Send data to the client in response
         to a request or an advise."
    |aItemName data hData answer formattedData|
    aItemName := WinHandle stringToAtom: item.
    hData := 0.
    value notNil ifTrue:
    [
        formattedData := value.
        format = CfText
            ifTrue: [ formattedData := formattedData asAsciiZ ].
        data := WinStructure new: 4 + formattedData size.
        data uShortAtOffset: 0 put: 0.
        ackReq ifTrue: [
            data uShortAtOffset: 0 put: (data uShortAtOffset: 0) | 16r8000].
        release ifTrue: [
            data uShortAtOffset: 0 put: (data uShortAtOffset: 0) | 16r2000].
        requested ifTrue: [
            data uShortAtOffset: 0 put: (data uShortAtOffset: 0) | 16r1000].

        data uShortAtOffset: 2 put: format.
        data bytesAtOffset: 4 put: formattedData.
        hData := WinAddress memoryHandleFrom: data contents
              withAllocFlag: GmemDdeshare | GmemMoveable.
    ].

    answer := self postTo: to
           msg: WmDdeData
           lParamLo: hData
           lParamHi: aItemName.
    answer ifFalse: [
        "PostMessage failed destroy atom and memory"
        WinHandle deleteAtom: aItemName.
         KernelLibrary globalFree: hData]
        ifTrue:[pendingAck:= #WmDdeData].
    ^answer.! ! 
 

!DDEAuxServer methods !

wmDdePoke: wparam with: lparam
        "Private - Pass along a Dde message."
| hData lpData data size item release format value paramArray formattedData |

    dde notNil
        ifTrue: [
            hData := lparam \\ 16r10000.
            item := WinHandle atomToString: lparam // 16r10000.

            hData~= 0
                ifTrue: [
                    lpData := WinAddress fromString: (KernelLibrary globalLock: hData).
                    size := WinAddress integerFrom: (KernelLibrary globalSize: hData).
                    data := (WinStructure new: size)
                            fillFromAddress: lpData.
                    KernelLibrary globalUnlock: hData.
                    release := ((data uShortAtOffset: 0) bitAnd: 16r2000) = 16r2000.
                    format := data uShortAtOffset: 2.
                    value := data bytesAtOffset: 4 count: size - 4.
                    formattedData = value.
                    format = CfText
                        ifTrue: [
                            formattedData := String new: value size.
                            formattedData replaceFrom: 1 to: value size
                                    with: value startingAt: 1.
                            formattedData := formattedData trimNullTerminator asNormalizedString].

                    paramArray := Array new: 4.
                    paramArray at: 1 put: wparam;
                                        at: 2 put: format;
                                        at: 3 put: formattedData;
                                        at: 4 put: item.
                    self sendInputEvent: #ddePoke:format:data:item:
                    withArgs: (paramArray).

                    WinHandle deleteAtom: lparam // 16r10000.

                    release
                        ifTrue: [ KernelLibrary globalFree: hData.] ] ].
    ^nil!

wmDdeExecute: wparam with: lparam
        "Private - Pass along a Dde message."
| hCommand command|

    dde notNil
        ifTrue: [
            hCommand := lparam // 16r10000.

            hCommand ~= 0
                ifTrue: [
                    command := (String fromAddress: ( WinAddress fromString:(KernelLibrary globalLock:hCommand)))
                                     trimNullTerminator asNormalizedString.
                    KernelLibrary globalUnlock: hCommand.

                    self sendInputEvent: #ddeExecute:command:hCommand:
                            withArgs: (Array
                            with: wparam
                            with: command
                            with: hCommand) ] ].

    ^nil! !


!DDEAuxClient methods !

wmDdeAck: wparam with: lparam
        "Private - Pass along a Dde message."
|lParamLo lParamHi command ack busy appReturnCode paramArray|

    dde notNil
        ifTrue: [
           lParamLo := lparam \\ 16r10000.
            lParamHi := lparam // 16r10000.

            dde pendingAck = #WmDdeInitiate
                ifTrue: [
                    dde server: wparam.
                    self ddeAckInitiate: wparam
                       application: (WinHandle atomToString: lParamLo)
                        topic:(WinHandle atomToString: lParamHi).
                    WinHandle deleteAtom: lParamLo.
                    WinHandle deleteAtom: lParamHi. ]

                ifFalse: [
                    ack := (lParamLo bitAnd: 16r8000) = 16r8000.
                    busy := (lParamLo bitAnd: 16r4000) = 16r4000.
                    appReturnCode := lParamLo bitAnd: 16r00FF.
                    answer := ack.
                   dde pendingAck = #WmDdeExecute
                        ifTrue: [

                            "Turned off because when different DDE messages
                              are queued, don't know which message this ack
                              is for. "
                            "
                            lParamHi ~= 0
                                ifTrue: [
                                    command := (String fromAddress: (WinAddress fromString: (KernelLibrary globalLock:lParamHi)))
                                                         trimNullTerminator asNormalizedString.
                                    KernelLibrary globalUnlock: lParamHi.
                                    KernelLibrary globalFree: lParamHi ]
                                ifFalse: [
                                    command := String new ].
                            "
                            "Not sending command string to this method."
                            paramArray := Array new: 5.
                            paramArray at: 1 put: wparam;
                                                at: 2 put: ack;
                                                at: 3 put: busy;
                                                at: 4 put: appReturnCode;
                                                at: 5 put: String new.
                            self sendInputEvent: #ddeAckExecute:ack:busy:appReturnCode:command:
                                        withArgs: paramArray]
                        ifFalse: [
                            dde pendingAck = #WmDdeAdvise
                            ifTrue:[
                                ack
                                ifFalse:[
                                    dde deleteOption ]]
                            ifFalse:[
                                ((dde pendingAck = #WmDdeRequest)
                                    and:[ ack = false])
                                    ifTrue:[answer := nil]].
                            paramArray := Array new: 6.
                            paramArray at: 1 put: wparam;
                                                at: 2 put: dde pendingAck;
                                                at: 3 put: ack;
                                                at: 4 put: busy;
                                                at: 5 put: appReturnCode;
                                                at: 6 put: (WinHandle atomToString:lParamHi).

                            self sendInputEvent: #ddeAck:msg:ack:busy:appReturnCode:item:
                                        withArgs: (paramArray).
                            WinHandle deleteAtom: lParamHi ] ] ].

    dde pendingAck: nil.
    ^nil! 

wmDdeData: wparam with: lparam
        "Private - Pass along a Dde message."
| hData lpData data size item ackReq release requested format value paramArray formattedData|

    hData := 0.
    dde notNil
        ifTrue: [
            hData := lparam \\ 16r10000.
            item := WinHandle atomToString: lparam // 16r10000.

            hData~= 0
                ifTrue: [
                    lpData := WinAddress fromString: (KernelLibrary globalLock: hData).
                    size := WinAddress integerFrom: (KernelLibrary globalSize: hData).
                    data := (WinStructure new: size)
                                        fillFromAddress: lpData.
                    KernelLibrary globalUnlock: hData.
                    ackReq := ((data uShortAtOffset: 0) bitAnd: 16r8000) = 16r8000.
                    release := ((data uShortAtOffset: 0) bitAnd: 16r2000) = 16r2000.
                    requested := ((data uShortAtOffset: 0) bitAnd: 16r1000) = 16r1000.
                    format := data uShortAtOffset: 2.
                    value := data bytesAtOffset: 4 count: size - 4.
                    formattedData = value.
                    format = CfText
                        ifTrue: [
                            formattedData := String new: value size.
                            formattedData replaceFrom: 1 to: value size
                                    with: value startingAt: 1.
                            formattedData := formattedData trimNullTerminator asNormalizedString ].

                    ackReq
                        ifTrue: [
                            dde ackAcceptTo: dde server item: item].


                    release
                        ifTrue: [
                            KernelLibrary globalFree: hData].

                    paramArray := Array new: 4.
                    paramArray at: 1 put: wparam;
                                at: 2 put: format;
                                at: 3 put: formattedData ;
                                at: 4 put: item.

                    requested
                        ifTrue: [
                            self sendInputEvent: #ddeDataRequested:format:data:item:
                                    withArgs: (paramArray) ]
                        ifFalse: [
                            self sendInputEvent: #ddeDataAdvised:format:data:item:
                                    withArgs: (paramArray) ] ]
                ifFalse: [
                   self sendInputEvent: #ddeDataUpdated:item:
                            withArgs: (Array
                            with: wparam
                            with: item) ].
           WinHandle deleteAtom: lparam // 16r10000 ].
    ^nil! !
