
Object subclass: #ObjectFiler
  instanceVariableNames: 
    'objectStream objectVersion textStream messageStream messageCounts numBehaviors numObjects behaviors objects remappedObjects idCharacterZero idIntegerZero operationAborted clientContext clientMessageHandler dllNameDict '
  classVariableNames: 
    'SingularClasses ClassIdDBSymbol RepVariablePointers ClassIdSymbol TagMetaClass ErrorClasses Seal NumPredefinedIds TerminalClasses NUL TagClass RepFixedPointers IdNil RepVariableBytes SingularNames SingularObjects IdNUL '
  poolDictionaries: 
    'CharacterConstants '    !


!ObjectFiler class methods !
 
describe
        " Describe the contents of a filed object. "
    | srcPathName dstPathName |
    srcPathName := (FileDialog new openFile) file.
    srcPathName isNil ifTrue: [^nil].
    dstPathName := ((ReadStream on: srcPathName) upTo: $.), '.txt'.
    ^self describeFromPathName: srcPathName newFile: dstPathName!
  
describeAllFromPathName: srcPathName newFile: dstPathName
        " Describe the contents of all filed objects in the
        file specified by srcPathName on file dstPathName;
        answer the number of filed objects. "
    | srcFileStream dstFileStream decompressor numFiledObjects |
    srcFileStream := File pathNameReadOnly: srcPathName.
    dstFileStream := File newFile: dstPathName.
    decompressor := self new.
    numFiledObjects := 0.
    [srcFileStream atEnd] whileFalse: [
        numFiledObjects := numFiledObjects + 1.
        (numFiledObjects > 1) ifTrue: [
            dstFileStream nextPutAll: '------------------------------'; cr; nextPut: Ff].
        decompressor describeFrom: srcFileStream to: dstFileStream].
    srcFileStream close.
    dstFileStream close.
    ^numFiledObjects!
 
describeClasses
        " Describe the classes in a filed object. "
    | srcPathName dstPathName |
    srcPathName := (FileDialog new openFile) file.
    srcPathName isNil ifTrue: [^nil].
    dstPathName := ((ReadStream on: srcPathName) upTo: $.), '.txt'.
    ^self describeClassesFromPathName: srcPathName 
        newFile: dstPathName!
   
describeClassesFrom: srcStream to: dstStream
        " Describe the classes in the filed object at the current
        position in the srcStream on dstStream. "
    self new describeClassesFrom: srcStream to: dstStream.!
 
describeClassesFromPathName: srcPathName newFile: dstPathName
        " Describe the classes in the filed object in the
        file specified by srcPathName on file dstPathName. "
    | srcFileStream dstFileStream decompressor |
    srcFileStream := File pathNameReadOnly: srcPathName.
    dstFileStream := File newFile: dstPathName.
    self new describeClassesFrom: srcFileStream to: dstFileStream.
    srcFileStream close.
    dstFileStream close.!

describeFrom: srcStream to: dstStream
        " Describe the contents of the filed object at the current
        position in the srcStream on dstStream. "
    self new describeFrom: srcStream to: dstStream.!
  
describeFromPathName: srcPathName newFile: dstPathName
        " Describe the contents of the filed object in the
        file specified by srcPathName on file dstPathName. "
    | srcFileStream dstFileStream decompressor |
    srcFileStream := File pathNameReadOnly: srcPathName.
    dstFileStream := File newFile: dstPathName.
    self new describeFrom: srcFileStream to: dstFileStream.
    srcFileStream close.
    dstFileStream close.!
 
dump: anObject
        " Store anObject. "
    | aPathName |
    aPathName := (FileDialog new saveFile: 'FiledObj.obj') file.
    aPathName isNil ifTrue: [^nil].
    ^self dump: anObject newFile: aPathName!
 
dump: anObject newFile: aPathName
        " Store anObject in the file specified by aPathName. "
    | fileStream |
    fileStream := File newFile: aPathName.
    self new dump: anObject on: fileStream.
    fileStream close.
    ^anObject!
   
dump: anObject on: aStream
        " Store anObject on aStream, starting at the current position. "
    self new dump: anObject on: aStream.
    ^anObject!
  
dumpAll: aCollection newFile: aPathName
        " Store each object in aCollection on the file
        specified by aPathName. "
    | fileStream dumper |
    fileStream := File newFile: aPathName.
    dumper := self new.
    aCollection do: [ :anObject |
        dumper dump: anObject on: fileStream].
    fileStream close.
    ^aCollection!
 
initErrorClass: aClass
        " Private - add aClass and its subclasses to 
        ErrorClasses unless they have implemented
        an override to the default behavior or refusing
        to be filed out. "
    ((aClass includesSelector: #fileOutSurrogate:)
    or: [aClass includesSelector: #fileInActivate:])
        ifFalse: [  
            ErrorClasses add: aClass.
            aClass subclasses do: [ :aSubClass |
                self initErrorClass: aSubClass]].!
  
initialize
        " ObjectFiler class initialization "
    | systemInfo aClass |

    systemInfo := self systemInfo.

    Seal := Esc.  " control code byte to mark start of filed object "

    " entry/section delimiter, entry type constants "
    NUL := 0 asCharacter.
    TagClass := 1 asCharacter.
    TagMetaClass := 2 asCharacter.
    RepFixedPointers := 1 asCharacter.
    RepVariablePointers := 2 asCharacter.
    RepVariableBytes := 3 asCharacter.
    ClassIdSymbol := 1.
    ClassIdDBSymbol := 2.

    " The dump id name space of a filed object is a contiguous range of
         integers which fall into 4 distinct regions:
            (1) ids for immutable objects and certain singular classes:
                    nil, true, false, MetaClass, Smalltalk,
                    Notifier, Processor, PM/WIN, Display, Clipboard
            (2) sequentially assigned ids for behavior descriptors
                    (class and metaclass entries)
            (3) sequentially assigned ids for non-behavior objects
            (4) ids for immutable objects of type Character and Integer
                    (single-byte characters only; DBC gets dynamic id)
        Only the dynamically assigned descriptors must be filed. "
    IdNUL := 0.
    IdNil := 1.

    " SingularClasses are terminals of the dump enumeration.  They are
        classes which are defined to only have a single instance.  They
        are assigned standard ids at the beginning of the dump id name
        name space.  These objects are bound to their environment at
        object load time. "
    SingularClasses := Set new.
    SingularClasses
        add: UndefinedObject;
        add: True;
        add: False;
        add: MetaClass class;
        add: SystemDictionary;
        add: SymbolSet;
        add: NotificationManager;
        add: ProcessScheduler;
        add: ClipboardManager;
        add: (Smalltalk at: systemInfo) class;  " PMInfo or WinInfo "
        add: Screen.
    NumPredefinedIds := 11.
    self initSingularIds.  " SingularObjects and SingularNames "

    " Classes whose objects and behaviors are not logged.  Either a
        singular class whose instance ids are predefined or immutable
        objects whose ids are computable. "
    TerminalClasses := Set new.
    TerminalClasses
        addAll: SingularClasses;
        addAll: (Integer withAllSubclasses).
    " only single-byte characters are terminals "
    (Character compiledMethodAt: #isSingleByte) isNil
        ifTrue: [TerminalClasses add: Character].

    " Classes which cannot be dumped (runtime execution state, compiled methods). "
    ErrorClasses := Set new.
    #(CompiledMethod Context FileHandle Process SortedCollection) 
    do: [ :symbol |
        (aClass := Smalltalk at: symbol ifAbsent: [nil]) notNil 
            ifTrue: [self initErrorClass: aClass]].!
 
initSingularIds
        " Private - global bindings must be refreshed after image load "
    | systemInfo |

    systemInfo := self systemInfo.

    SingularObjects := LargeIdentityDictionary new: 31.
    SingularObjects   " dumper uses to map object to dump id "
        "at: nil put: IdNil;"   " sigh, can't have nil be a key "
        at: true put: 2;
        at: false put: 3;
        at: MetaClass put: 4;
        at: Smalltalk put: 5;
        at: SymbolTable put: 6;
        at: Notifier put: 7;
        at: Processor put: 8;
        at: Clipboard put: 9;
        at: (Smalltalk at: systemInfo) put: 10;  " PM or WIN global "
        at: Display put: 11.

    SingularNames := Array new: NumPredefinedIds.
    SingularNames  " decompressor indexes by dump id "
        at: 1 put: 'nil';
        at: 2 put: 'true';
        at: 3 put: 'false';
        at: 4 put: 'MetaClass';
        at: 5 put: 'Smalltalk';
        at: 6 put: 'SymbolTable';
        at: 7 put: 'Notifier';
        at: 8 put: 'Processor';
        at: 9 put: 'Clipboard';
        at: 10 put: systemInfo asString;
        at: 11 put: 'Display'.!
   
load
        " Answer the first object stored a file. "
    | aPathName |
    aPathName := (FileDialog new openFile) file.
    aPathName isNil ifTrue: [^nil].
    ^self loadFromPathName: aPathName!
  
loadAllFromPathName: aPathName
        "  Answer a collection containing all the objects stored
        in the file specified by aPathName. "
    | fileStream loader restoredObjects |
    fileStream := File pathNameReadOnly: aPathName.
    loader := self new.
    restoredObjects := OrderedCollection new.
    [fileStream atEnd] whileFalse: [
        restoredObjects add: (loader loadFrom: fileStream)].
    fileStream close.
    ^restoredObjects!
   
loadAllFromPathName: aPathName loadMaps: loadMapsDict
        "  Answer a collection containing all the objects
        stored in the file specified by aPathName. The
        loadMapsDict defines mappings for loading classes
        whose shape has changed. "
    | fileStream loader restoredObjects |
    fileStream := File pathNameReadOnly: aPathName.
    loader := self new.
    restoredObjects := OrderedCollection new.
    [fileStream atEnd] whileFalse: [
        restoredObjects add:
            (loader loadFrom: fileStream loadMaps: loadMapsDict)].
    fileStream close.
    ^restoredObjects!
   
loadFrom: aStream
        " Answer the filed object stored at the current
        position on aStream. "
    ^self new loadFrom: aStream!

loadFrom: aStream loadMaps: loadMapsDict
        " Answer the filed object stored at the current
        position on aStream.   The loadMapsDict
        defines mappings for loading classes
        whose shape has changed. "
    ^self new
        loadFrom: aStream
        loadMaps: loadMapsDict!
 
loadFromPathName: aPathName
        " Answer the first object stored in the file
        specified by aPathName. "
    | fileStream restoredObject |
    fileStream := File pathNameReadOnly: aPathName.
    restoredObject := self new loadFrom: fileStream.
    fileStream close.
    ^restoredObject!
 
loadFromPathName: aPathName loadMaps: loadMapsDict
        " Answer the first object stored in the file
        specified by aPathName.  The loadMapsDict
        defines mappings for loading classes
        whose shape has changed. "
    | fileStream restoredObject |
    fileStream := File pathNameReadOnly: aPathName.
    restoredObject := self new
        loadFrom: fileStream
        loadMaps: loadMapsDict.
    fileStream close.
    ^restoredObject!
   
systemInfo
        " Answer the symbol identifying the host system info global "
    (Smalltalk at: #PM ifAbsent: [nil]) notNil ifTrue: [^#PM].
    (Smalltalk at: #WIN ifAbsent: [nil]) notNil ifTrue: [^#WIN].
    self error: ['Unknown Smalltalk/V system'].!
   
version
        " Answer version stamp for the object file format.
            = 1, Smalltalk/V Dumper (Goodies #1 package)
            = 2, Smalltalk/V 286 Dumper
            = 3, Smalltalk/V PM 1.2 ObjectFiler
            = 4, Smalltalk/V Win 2.0 ObjectFiler
            = 5, Smalltalk/V PM 1.3 ObjectFiler
            = 6, Smalltalk/V PM 2.0 ObjectFiler
         "
    | systemInfo |
    systemInfo := self systemInfo.
    (systemInfo = #PM) ifTrue: [^6].
    (systemInfo = #WIN) ifTrue: [^4].
    self error: ['Unknown ObjectFiler version'].!
 
versionCanBeDescribed: aVersion
        " Answer whether a filed object from aVersion
        can be described by this ObjectFiler. "
    ^(Array with: 3 with: 4 with: 5 with: 6) includes: aVersion  
        " VPM 1.2; VW 2.0; VPM 1.3; VPM 2.0 "!
  
versionCanBeLoaded: aVersion
        " Answer whether a filed object from aVersion
        can be loaded by this ObjectFiler. "
    | systemInfo |
    systemInfo := self systemInfo.
    (systemInfo = #PM) 
        ifTrue: [
            ^((Array with: 3 with: 5 with: 6)  "VPM 1.2, 1.3, 2.0"
                 includes: aVersion)]. 
    (systemInfo = #WIN) 
         ifTrue: [^(aVersion = 4)].   "VW 2.0"
    self error: ['Unknown ObjectFiler version'].!
 
versionHasDllInfo: aVersion
        " Answer whether a filed object from aVersion
        contains DLL information in its behavior descriptors. "
    ^(aVersion = 6)   " VPM 2.0 "! !



!ObjectFiler methods !
 
assignComputedIdRanges: lastDynamicId
        " Private - Assign the end of the dump id name space,
        given the last id assigned in the dynamic range
        (behaviors and objects) "
    idCharacterZero := lastDynamicId + 1.
    idIntegerZero := idCharacterZero + 256.!
   
clientContext
        " Answer the client context associated with
        the current dump or load operation.
        Can be accessed in fileInSurrogate: and
         fileOutActivate: methods to provide
         context-dependent behavior. "
    ^clientContext!
 
clientContext: anObject
        " Store anObject on behalf of the client.
        The client context can be accessed in
        fileOutSurrogate: and fileInActivate: methods
        to allow context-dependent behavior. "
    clientContext := anObject!

clientMessageHandler: aHandler
        " Register a client message handler.
        aHandler is a two-argument block or message
        which is invoked when a problem is
        encountered during object loading or dumping.
        The first argument is this ObjectFiler.
        The second argument is an assoc
        with key => value information:
            'info' => an information message (string)
            'warning' => a warning message (string)
            'abort' => a fatal error message (string)
            'summary' => number of warnings encountered 
                (Dictionary of integers indexed by above key strings)
        The 'summary' notification is sent at operation 
        completion when warnings were encountered
        (allows client to do sumary or termination processing). "
    clientMessageHandler := aHandler.!
  
computedObjectDescription: computedObject
        " Private - answer a description of a predefined/computed object "
    ^computedObject isCharacter
        ifTrue: [
            (computedObject printString),
                ' (Character code ', (computedObject asciiValue printString), ')']
        ifFalse: [
            computedObject printString, ' (Integer)']!

computedObjectFromId: objectId
        " Private - answer the object described by the given
        computed dump id (Character or Integer at the end of
        the dump name space) "
    | integerId |
    ^(objectId < idIntegerZero)
        ifTrue: [
            (objectId - idCharacterZero) asCharacter]
        ifFalse: [
            (integerId := objectId - idIntegerZero) odd
                ifTrue: [(integerId // 2) negated]  " odd is negative "
                ifFalse: [integerId // 2]].  " even is positive "!
  
describeBehaviorDescriptors
        " Private - Read the <behavior descriptors section>
        to find referenced classes and MetaClasses.
        Dump in id order (not file order). "
    | numEntries hasDllName classInfo 
      tag classId name rep
      numNamedInstVars instVarNames dllName |

    " set up pseudo-classId entries for self-contained object descriptors "
    behaviors
        at: ClassIdSymbol
        put: (Association key: 'Symbol' value: RepVariableBytes).
    behaviors
        at: ClassIdDBSymbol
        put: (Association key: 'DoubleByteSymbol' value: RepVariableBytes).
    objects at: ClassIdSymbol put: (Array new: 0).  " no named inst vars "
    objects at: ClassIdDBSymbol put: (Array new: 0).

    " read unordered entries "
    numEntries := 0.
    hasDllName := self class versionHasDllInfo: objectVersion.
    classInfo := Array new: (behaviors size).
    [(tag := objectStream next) ~= NUL] whileTrue: [
        numEntries := numEntries + 1.
        classId := objectStream getInteger.
        name := objectStream upTo: NUL.
        rep := objectStream next.
        numNamedInstVars := objectStream getInteger.
        instVarNames := Array new: numNamedInstVars.
        1 to: numNamedInstVars do: [ :i |
            instVarNames at: i put: (objectStream upTo: NUL)].
        dllName := (hasDllName
            ifTrue: [objectStream upTo: NUL]
            ifFalse: [nil]).
        classInfo at: classId put: 
            (Association key: tag value: dllName).
        behaviors
            at: classId
            put: (Association key: name value: rep).
        objects at: classId put: instVarNames].

    " report in id order "
    textStream
        cr; nextPutAll: 'Behavior descriptors section (id = behavior entry)'; cr.
    (NumPredefinedIds + 1) to: (behaviors size) do: [ :classId |
        name := (behaviors at: classId) key.
        rep := (behaviors at: classId) value.
        numNamedInstVars := (objects at: classId) size.
        textStream nextPutAll:
            (classId printString), ' = ',
            (((classInfo at: classId) key = TagClass)
                ifTrue: [
                    'Class ', name, ' (',
                    (self repDescription: rep), ', ',
                    ((numNamedInstVars = 0)
                        ifTrue: ['no'] ifFalse: [numNamedInstVars printString]),
                    ' named instance variables)']
                ifFalse: ['MetaClass ', name]);
            cr.
        dllName := (classInfo at: classId) value.
        (dllName size > 0)  " not supported or base system DLL "
            ifTrue: [textStream nextPutAll: 
                '        (bind ', dllName, 
                '.dll if not found in loading image)'; cr].
        ].   " processing behavior entries "
    textStream
        nextPutAll: '(', numEntries printString, ' behavior descriptor entries)'; cr.
    "ASSERT [numEntries = numBehaviors]."!
 
describeClasses
        " Private - Read the <behavior descriptors section>
        to find referenced classes and MetaClasses.
        Dump in class name order (not file order). "
    | numEntries hasDllName classInfo 
      tag classId name rep
      numNamedInstVars instVarNames dllName
      reportDict |

    " set up pseudo-classId entries for self-contained object descriptors "
    behaviors
        at: ClassIdSymbol
        put: (Association key: 'Symbol' value: RepVariableBytes).
    behaviors
        at: ClassIdDBSymbol
        put: (Association key: 'DoubleByteSymbol' value: RepVariableBytes).
    objects at: ClassIdSymbol put: (Array new: 0).  " no named inst vars "
    objects at: ClassIdDBSymbol put: (Array new: 0).

    " read unordered entries "
    numEntries := 0.
    hasDllName := self class versionHasDllInfo: objectVersion.
    classInfo := Array new: (behaviors size).
    reportDict := Dictionary new.
    [(tag := objectStream next) ~= NUL] whileTrue: [
        numEntries := numEntries + 1.
        classId := objectStream getInteger.
        name := objectStream upTo: NUL.
        rep := objectStream next.
        numNamedInstVars := objectStream getInteger.
        instVarNames := Array new: numNamedInstVars.
        1 to: numNamedInstVars do: [ :i |
            instVarNames at: i put: (objectStream upTo: NUL)].
        dllName := (hasDllName
            ifTrue: [objectStream upTo: NUL]
            ifFalse: [nil]).
        classInfo at: classId put: 
            (Association key: tag value: dllName).
        behaviors
            at: classId
            put: (Association key: name value: rep).
        objects at: classId put: instVarNames.
        reportDict 
            at: ((tag = TagClass)
                ifTrue: [name]
                ifFalse: [name, ' class']) 
            put: classId.
        ].

    " report in alphabetical order "
    reportDict keys asSortedCollection do: [ :className |
        classId := reportDict at: className.
        tag := (classInfo at: classId) key.
        rep := (behaviors at: classId) value.
        instVarNames := objects at: classId.
        numNamedInstVars := instVarNames size.
        textStream nextPutAll: className.
        (tag = TagClass)
            ifTrue: [
                textStream nextPutAll: 
                    ' (', (self repDescription: rep), ', ',
                    ((numNamedInstVars = 0)
                        ifTrue: ['no'] 
                        ifFalse: [numNamedInstVars printString]),
                    ' named instance variables)'].
        textStream cr.
        dllName := (classInfo at: classId) value.
        (dllName size > 0)  " not supported or base system DLL "
            ifTrue: [textStream nextPutAll: 
                '        (bind ', dllName, 
                '.dll if not found in loading image)'; cr].
        ((tag = TagClass) and: [numNamedInstVars > 0])
            ifTrue: [
                1 to: numNamedInstVars do: [ :i |
                    textStream nextPutAll: 
                        '    ', i printString,
                        ' - ', (instVarNames at: i); cr]].
        ].   " processing behavior entries "!
  
describeClassesFrom: srcStream to: dstStream
        " Describe the classes in the filed object on 
        srcStream in a text report on dstStream. "
    | initialPosition rootObjectId lastBehaviorId
      firstObjectId lastObjectId numBehaviorEntries |

    CursorManager execute change.
    Seal isNil ifTrue: [self class initialize].
    self class initSingularIds.  " refresh global bindings "

    objectStream := ((srcStream respondsTo: #asByteFileStream)
        ifTrue: [srcStream asByteFileStream]
        ifFalse: [srcStream]).
    initialPosition := objectStream position.  " remember so we can report size"
    textStream := dstStream.
    messageCounts := nil.

    " header section (version, last dynamically assigned id, root object) "
    (objectStream next ~= Seal)
        ifTrue: [
            self recordWarningMessage: 'Incorrect seal for filed object.'.
            objectStream position: initialPosition.  " back out "
            CursorManager normal change.
            ^nil].
    objectVersion := objectStream getInteger.
    (self class versionCanBeDescribed: objectVersion)
        ifFalse: [
            self recordWarningMessage: 
                'This ObjectFiler cannot describe filed objects of version ',
                objectVersion printString.
            objectStream position: initialPosition.  " back out "
            CursorManager normal change.
            ^nil].
    numBehaviors := objectStream getInteger.
    numObjects := objectStream getInteger.
    rootObjectId := objectStream getInteger.
    (objectStream next ~= NUL)
        ifTrue: [
            self recordWarningMessage: 
                'File format error (bad header section)'.
            objectStream position: initialPosition.  " back out "
            CursorManager normal change.
            ^nil].

    " set up the dump id name space "
    lastBehaviorId := NumPredefinedIds + numBehaviors.
    firstObjectId := lastBehaviorId + 1.
    "(numObjects > 0) ifTrue: [ASSERT [firstObjectId = rootObjectId]]."
    lastObjectId := lastBehaviorId + numObjects.
    self assignComputedIdRanges: lastObjectId.

    " print header info and describe the id name space "
    self describeObjectVersion.
    textStream
        nextPutAll:
            'Number of classes = ', (numBehaviors printString); cr;
        nextPutAll:
            'Number of objects = ', (numObjects printString); cr;
        cr.

    " objects is indexed by the dump ID of a behavior.
        Records instance variable names. "
    objects := Array new: lastBehaviorId.
    " behaviors is indexed by a behavior dump ID and contains the
        class name and representation "
    behaviors := Array new: lastBehaviorId.

    self
        describeClasses;
        describeObjectsNop.

    textStream
        cr; nextPutAll:
            'Filed object size = ', (((objectStream position) - initialPosition) printString),
            ' bytes';
        cr; cr.
    CursorManager normal change.!
   
describeFrom: srcStream to: dstStream
        " Describe the filed object on srcStream in
        a human-readable report on dstStream. "
    | initialPosition rootObjectId lastBehaviorId
      firstObjectId lastObjectId numBehaviorEntries |

    CursorManager execute change.
    Seal isNil ifTrue: [self class initialize].
    self class initSingularIds.  " refresh global bindings "

    objectStream := ((srcStream respondsTo: #asByteFileStream)
        ifTrue: [srcStream asByteFileStream]
        ifFalse: [srcStream]).
    initialPosition := objectStream position.  " remember so we can report size"
    textStream := dstStream.
    messageCounts := nil.

    " header section (version, last dynamically assigned id, root object) "
    (objectStream next ~= Seal)
        ifTrue: [
            self recordWarningMessage: 'Incorrect seal for filed object.'.
            objectStream position: initialPosition.  " back out "
            CursorManager normal change.
            ^nil].
    objectVersion := objectStream getInteger.
    (self class versionCanBeDescribed: objectVersion)
        ifFalse: [
            self recordWarningMessage: 
                'This ObjectFiler cannot describe filed objects of version ',
                objectVersion printString.
            objectStream position: initialPosition.  " back out "
            CursorManager normal change.
            ^nil].
    numBehaviors := objectStream getInteger.
    numObjects := objectStream getInteger.
    rootObjectId := objectStream getInteger.
    (objectStream next ~= NUL)
        ifTrue: [
            self recordWarningMessage: 
                'File format error (bad header section)'.
            objectStream position: initialPosition.  " back out "
            CursorManager normal change.
            ^nil].

    " set up the dump id name space "
    lastBehaviorId := NumPredefinedIds + numBehaviors.
    firstObjectId := lastBehaviorId + 1.
    "(numObjects > 0) ifTrue: [ASSERT [firstObjectId = rootObjectId]]."
    lastObjectId := lastBehaviorId + numObjects.
    self assignComputedIdRanges: lastObjectId.

    " print header info and describe the id name space "
    self describeObjectVersion.
    textStream
        nextPutAll:
            'Number of behavior entries = ', (numBehaviors printString); cr;
        nextPutAll:
            'Number of object entries = ', (numObjects printString); cr;
        nextPutAll: 'Root object id = ', (rootObjectId printString).
    " special case: add description of non-filed root object "
    (rootObjectId <= NumPredefinedIds) ifTrue: [
        textStream nextPutAll: ' => ', (SingularNames at: rootObjectId)].
    (rootObjectId > lastObjectId) ifTrue: [
        textStream nextPutAll:
            ' => ',
            (self computedObjectDescription:
                    (self computedObjectFromId: rootObjectId))].
    textStream cr; cr.

    " describe the id ranges  "
    textStream nextPutAll:
            'Dump id name space:'; cr.
    1 to: NumPredefinedIds do: [ :i |
        textStream nextPutAll: '    ', (i printString), ' = ', (SingularNames at: i); cr].
    (numBehaviors > 0) ifTrue: [textStream
        nextPutAll:
            '    ', '[', (NumPredefinedIds + 1) printString, '..',
            lastBehaviorId printString, '] = behavior ids'; cr].
    (numObjects > 0) ifTrue: [textStream
        nextPutAll:
            '    ', '[', firstObjectId printString, '..',
            lastObjectId printString, '] = object ids'; cr].
    textStream
        nextPutAll:
            '    [', idCharacterZero printString, '..',
            (idCharacterZero + 255) printString,
            '] = Character codes [0..255]'; cr;
        nextPutAll:
            '    ', idIntegerZero printString, '.. = Integer values (0, 1, -1, 2, -2, ...)'; cr.

    " objects is indexed by the dump ID of a behavior or object entry.
        For a behavior, records instance variable names.
        For an object, records the class id. "
    objects := Array new: lastObjectId.
    " behaviors is indexed by a behavior dump ID and contains the
        class name and representation "
    behaviors := Array new: lastBehaviorId.

    self
        describeBehaviorDescriptors;
        describeObjectDescriptors.

    textStream
        cr; nextPutAll:
            'Filed object size = ', (((objectStream position) - initialPosition) printString),
            ' bytes';
        cr; cr.
    CursorManager normal change.!

describeId: id
        " Private - Answer a description of the object referenced by id."
    | behavior name |

    " predefined names which aren't actually filed "
    (id <= NumPredefinedIds)
        ifTrue: [^SingularNames at: id].

    " dynamically assigned behavior and object dump ids "
    (id <= (NumPredefinedIds + numBehaviors)) ifTrue:  [
        ^(((behaviors at: id) value = NUL)  " no rep info for metaclass "
            ifTrue: ['MetaClass ']
            ifFalse: ['Class ']),
        (behaviors at: id) key].
   (id < idCharacterZero) ifTrue: [
         ^((behaviors at: ((objects at: id) at: 1)) key), ' instance ', (id printString)].

    " computable objects at the end of the dump name space (Character, Integer) "
    ^self computedObjectDescription: (self computedObjectFromId: id).!
   
describeObjectDescriptors
        " Private - Read the <object descriptors section> "
    | numEntries objectId classId size basicHash
      classInfo values entryInfo
      numNamedVars instVarNames |

    numEntries := 0.
    [(objectId := objectStream getInteger) ~= IdNUL] whileTrue: [
        numEntries := numEntries + 1.
        classId := objectStream getInteger.
        size := objectStream getInteger.
        basicHash := objectStream getInteger.
        classInfo := behaviors at: classId.
        (classInfo value = RepVariableBytes) ifTrue: [
            values :=
                ((classInfo key = 'DoubleByteString')
                or: [classInfo key = 'DoubleByteSymbol'])
                    ifTrue: [(Smalltalk at: #DoubleByteString) basicNew: size]
                    ifFalse: [String new: size].
                    " leave symbols as strings for report "
            objectStream getBytesFor: values]
        ifFalse: [
            values := Array new: (((objects at: classId) size) + size).
            1 to: values size do: [ :i |
                values at: i put: (objectStream getInteger)]].
        objects at: objectId put:
            (Array with: classId with: size with: basicHash with: values).
        ].  " processing object description entry "

    " dump objects in id order (not filed order) "
    textStream cr; nextPutAll: 'Object descriptors section (id = object entry)'; cr.
    (behaviors size + 1) to: (objects size) do: [ :objectId |
        entryInfo := objects at: objectId.
        classId := entryInfo at: 1.
        size := entryInfo at: 2.
        basicHash := entryInfo at: 3.
        values := entryInfo at: 4.
        textStream nextPutAll: (objectId printString), ' = '.
        ((classId = ClassIdSymbol) or: [classId = ClassIdDBSymbol])
        ifTrue: [   "symbols were read in as strings"
            textStream nextPutAll:
                '#', values, ' (basicHash = ', basicHash printString, ')'; cr]
        ifFalse: [
            textStream nextPutAll:
                ((behaviors at: classId) key),
                ' instance (basicHash = ', basicHash printString, ')'; cr.
            ((behaviors at: classId) value = RepVariableBytes) ifTrue: [
                textStream nextPutAll:
                    '    ', 'bytes(', size printString, '): ',
                    values; cr]
            ifFalse: [
                instVarNames := objects at: classId.
                numNamedVars := instVarNames size.
                " named instance variables "
                1 to: numNamedVars do: [ :i |
                    textStream nextPutAll:
                        '    ', (instVarNames at: i), ': ',
                        (self describeId: (values at: i)); cr].
                " indexed instance variables "
                1 to: size do: [ :i |
                    textStream nextPutAll:
                        '    ', i printString, ': ',
                        (self describeId: (values at: (numNamedVars + i))); cr]]].
        ].
    textStream
        nextPutAll: '(', numEntries printString, ' object descriptor entries)'; cr.
    "ASSERT [numEntries = numObjects]."!

describeObjectsNop
        " Private - Read the <object descriptors section> "
    | objectId classId size basicHash classInfo
      values summaryDict numInstances total count |

    numInstances := Array new: behaviors size.
    numInstances atAllPut: 0.

    [(objectId := objectStream getInteger) ~= IdNUL] whileTrue: [
        classId := objectStream getInteger.
        size := objectStream getInteger.
        basicHash := objectStream getInteger.
        classInfo := behaviors at: classId.
        (classInfo value = RepVariableBytes) ifTrue: [
            values :=
                ((classInfo key = 'DoubleByteString')
                or: [classInfo key = 'DoubleByteSymbol'])
                    ifTrue: [(Smalltalk at: #DoubleByteString) basicNew: size]
                    ifFalse: [String new: size].
                    " leave symbols as strings for report "
            objectStream getBytesFor: values]
        ifFalse: [
            values := Array new: (((objects at: classId) size) + size).
            1 to: values size do: [ :i |
                values at: i put: (objectStream getInteger)]].
        numInstances at: classId 
            put: ((numInstances at: classId) + 1).
        ].  " processing object description entry "

    " report instance counts "
    textStream cr; nextPutAll: 'Object counts by class:'; cr.
    summaryDict := Dictionary new.
    1 to: behaviors size do: [ :i |
        ((classInfo := behaviors at: i) notNil
        and: [(classInfo value ~= NUL)  " skip metaclasses "
        and: [(count := numInstances at: i) > 0]])
            ifTrue: [summaryDict at: classInfo key put: count]].
    total := 0.
    summaryDict keys asSortedCollection do: [ :className |
        count := summaryDict at: className.
        textStream nextPutAll: 
            className, ': ', count printString, 
            ((count = 1) ifTrue: [' instance'] ifFalse: [' instances']); 
            cr.
        total := total + count].
    textStream nextPutAll: total printString, ' objects'; cr.!
   
describeObjectVersion
        " Private - emit header describing the objectVersion. "
    textStream
        nextPutAll: '"Smalltalk/V filed object description"'; cr;
        nextPutAll: (
            'Version ', objectVersion printString,
            ' (1 = V; 2 = V286; 3 = VPM 1.2;',
           ' 4 = VW 2.0; 5 = VPM 1.3; 6 = VPM 2.0)'); 
        cr; cr.!
  
dllNameDict: anIdentityDictionary
        " Register the DLL mapping dictionary to use
        for object dumping.  Entries map a class
        to a string containing the DLL name to use for
        that class when an object is dumped. "
    dllNameDict := anIdentityDictionary.!

dllNameOf: behavior
        " Private "
    | dllName |
    (dllNameDict notNil
    and: [(dllName := dllNameDict at: behavior ifAbsent: [nil]) notNil])
        ifTrue: [^dllName fileNameLessPath fileName].
    ^(behavior isInDLL and: [behavior isInBase not])
        ifTrue: [behavior dllName fileNameLessPath fileName]
        ifFalse: ['']!
 
dump: anObject on: aStream
        " Write a compressed description of anObject
        (along with anObject's referenced structure)
        onto aStream. "
    | lastDynamicId |

    CursorManager execute change.
    Seal isNil ifTrue: [self class initialize].
    self class initSingularIds.  " refresh global bindings "

    objectStream := ((aStream respondsTo: #asByteFileStream)
        ifTrue: [aStream asByteFileStream]
        ifFalse: [aStream]).
    messageCounts := nil.

    " behaviors dictionary maps class/metaclass object to its dump id. "
    " The dump ids of behaviors follow the predefined objects in the name space. "
    behaviors := LargeIdentityDictionary new: 127.

    " objects dictionary maps non-behavior object to an association
        defining its relative object id [1..n] and surrogate. "
    " The dump ids of objects follow the behaviors in the name space."
    " Relative object number is mapped to dump id after behavior ids known. "
    objects := LargeIdentityDictionary new.

    " enumerate the contents of anObject, logging all its component
      objects and behaviors "
    objectVersion := self class version.
    numBehaviors := 0.
    numObjects := 0.
    self log: anObject.
    lastDynamicId := NumPredefinedIds + numBehaviors + numObjects.
    self assignComputedIdRanges: lastDynamicId.

    " write the <header section> of the filed object dump:
        <seal> <version> <num behaviors> <num objects> <root object id> <NUL> "
    objectStream
        nextPut: Seal;
        putInteger: objectVersion;
        putInteger: behaviors size;
        putInteger: objects size;
        putInteger: (self dumpIdOf: anObject);
        nextPut: NUL.

   " write the body of the filed object dump "
    self
        dumpBehaviorDescriptors;    " <behavior descriptors section> "
        dumpObjectDescriptors.         " <object descriptors section> "

    messageCounts notNil
        ifTrue: [self recordSummaryMessage: 'object dumping'].
    CursorManager normal change.!
 
dumpBehaviorDescriptors
        " Private - Write the <behavior descriptors section>. "
    | hasDllName behavior tag name rep numInstVars |

    " write a <behavior descriptor> entry for each behavior "
    " <behavior type> <id> <nameString> <NUL> 
            <representation>
            <number of named instance vars> [<inst var name>]... 
            <DLL name> <NUL>  [version-dependent] "
    " for class, store names of all the inst vars in <name> <NUL> form "
    hasDllName := self class versionHasDllInfo: objectVersion.
    behaviors associationsDo: [ :assoc |
        behavior := assoc key.
        name := behavior name.
        (behavior class == MetaClass)
            ifTrue: [
                tag := TagMetaClass.
                rep := NUL.
                numInstVars := 0.
                name := name copyFrom: 1 to: (name size - 6).  " strip trailing ' class' "]
            ifFalse: [
                tag := TagClass.
                rep := self repOf: behavior.
                numInstVars := behavior instSize].
        objectStream
            nextPut: tag;
            putInteger: assoc value;  " id "
            nextPutAll: name; nextPut: NUL;
            nextPut: rep;
            putInteger: numInstVars.
        (numInstVars > 0)
            ifTrue: [(behavior allInstVarNames) do: [ :instVarName |
                objectStream nextPutAll: instVarName; nextPut: NUL]].
        hasDllName
            ifTrue: [objectStream 
                nextPutAll: (self dllNameOf: behavior);
                nextPut: NUL].
        ].

    objectStream nextPut: NUL.  " section terminator "!
 
dumpIdOf: anObject
        " Private - Answer the dump id of anObject in the objectStream."
    | objectsEntry |

    " predefined identifiers at the beginning of the dump id name space "
    anObject isNil ifTrue: [^IdNil].
    (SingularClasses includes: anObject class) ifTrue: [
        ^SingularObjects at: anObject
            ifAbsent: [
                self recordWarningMessage: 
                    ' duplicate member of singular class ',
                    anObject class printString, ' was encountered; mapped to nil.'.
                IdNil]].

    " dynamically assigned behavior id "
    (anObject isKindOf: Behavior) ifTrue: [^behaviors at: anObject].

    " computed ids of immutable objects at the end of the name space "
    anObject isCharacter ifTrue: [
        ((anObject respondsTo: #isSingleByte) not
        or: [anObject isSingleByte]) ifTrue: [
            ^idCharacterZero + anObject asciiValue]].  "single-byte char"
        "ifFalse: [double-byte character with dynamic id]"
    (anObject isKindOf: Integer) ifTrue: [
        ^idIntegerZero +
            (anObject positive  " use low-order bit for sign "
                ifTrue: [anObject * 2]   " even id for positive "
                ifFalse: [anObject negated * 2 + 1])].  " odd id for negative "

    " objects with dynamically assigned ids "
    objectsEntry := objects at: anObject ifAbsent: [nil].
    ^(objectsEntry isNil)
        ifTrue: [IdNil]
        ifFalse: [NumPredefinedIds + numBehaviors + objectsEntry key]!

dumpObjectDescriptors
        " Private - Write the <object descriptors section> of the object dump "
    | lastBehaviorId objectId object class classId |

    " Write an <object descriptor> for each (surrogate) object:
        <object id> <class id> <number of indexed instance variables>
            <basicHash> <bytesOrPointers>
      "
    lastBehaviorId := NumPredefinedIds+ numBehaviors.
    objects do: [ :assoc |  " ignore original object, only need surrogate "
        objectId := lastBehaviorId + assoc key.  " last behavior id + relative object id "
        object := assoc value.   " surrogate "
        class := object class.
        classId :=
            object isSymbol
                ifTrue: [(class == Symbol)
                    ifTrue: [ClassIdSymbol]
                    ifFalse: [ClassIdDBSymbol]]
                ifFalse: [self dumpIdOf: class].
            " We can play games with symbol class ids because
                we know class ids start at NumPredefinedIds + 1 "
        objectStream
            putInteger: objectId;
            putInteger: classId;
            putInteger: object basicSize;
            putInteger: object basicHash.
        (class isBytes) ifTrue: [
            objectStream putBytesFrom: object]
        ifFalse: [   " pointers "
            1 to: (class instSize + object basicSize) do: [ :i |
                objectStream
                    putInteger: (self dumpIdOf: (object instVarAt: i))]]].

    objectStream nextPut: NUL.  " section terminator "!
 
fileInActivateForErrorClass: errorObject
        " Private - nuke the nasty stuff.  Objects should be doing this themselves... "
    | errorClass errorMessage surrogate instVarNames slot
      homeContext blockArgCount index |

    " won't be able to load sortBlock, but rest of SortedCollection is ok "
    (errorObject isKindOf: SortedCollection) ifTrue: [
        errorObject sortBlock isContext 
            ifFalse: [^errorObject].  " not error if something safe sorting it "
        self recordWarningMessage: 
            'The sortBlock of a SortedCollection cannot be loaded properly, won''t be bound.'.
        ^errorObject].

    errorClass := errorObject class.
    errorMessage := 'ObjectFiler error: cannot load a ', errorClass name.
    self recordWarningMessage:
        'a ', errorClass name,
        ' cannot be loaded properly, won''t  be bound.'.

    (errorObject isKindOf: CompiledMethod) ifTrue: [
        surrogate :=
            errorMessage, ' (', errorObject classField name,
            '>>', errorObject selector asString, ')'.
        ^surrogate].

    (errorObject isKindOf: Context) ifTrue: [
        instVarNames := errorObject class allInstVarNames.
        homeContext := errorObject instVarAt: (instVarNames indexOf: 'homeContext').
        slot := instVarNames indexOf: 'blockArgumentCount'.  " VW only; not in VPM "
        (slot = 0) ifFalse: [blockArgCount := errorObject instVarAt: slot].
        (errorObject isKindOf: HomeContext) ifTrue: [
            errorMessage :=
                errorMessage,
                (blockArgCount isNil
                    ifTrue: [' (homeContext, method, receiver values follow)']
                    ifFalse: [' (blockArgumentCount, homeContext, method, receiver values follow)']).
            surrogate := Array new: (blockArgCount isNil ifTrue: [4] ifFalse: [5]).
            surrogate at: 1 put: errorMessage.
            blockArgCount isNil ifTrue: [
                index := 2]
            ifFalse: [
                surrogate at: 2 put: blockArgCount.
                index := 3].
            surrogate at: index put: homeContext.
            index := index + 1.
            slot := instVarNames indexOf: 'method'.
            surrogate at: index put: (errorObject instVarAt: slot).
            index := index + 1.
            slot := instVarNames indexOf: 'receiver'.
            surrogate at: index put: (errorObject instVarAt: slot)]
        ifFalse: [
            blockArgCount isNil ifTrue: [
                errorMessage := errorMessage, ' (homeContext value follows)'.
                surrogate := Array
                    with: errorMessage
                    with: homeContext]
            ifFalse: [
                errorMessage :=
                    errorMessage,
                    ' (blockArgumentCount, homeContext value follows)'.
                surrogate := Array
                    with: errorMessage
                    with: blockArgCount
                    with: homeContext]].
        ^surrogate].

    (errorObject isKindOf: Process) ifTrue: [
        surrogate := errorMessage, ' (name = ', errorObject name printString, ')'.
        ^surrogate].

    ^errorMessage!
   
fileOutSurrogateForErrorClass: errorObject
        " Private - nuke the nasty stuff.  Objects should be doing this themselves... "
    | errorClass surrogate instVarNames slot |

    " can't store sortBlock, give user a chance to salvage SortedCollection "
    (errorObject isKindOf: SortedCollection) ifTrue: [
        errorObject sortBlock isContext 
            ifFalse: [^errorObject].  " not error if something safe sorting it "
        (MessageBox confirm: 'Dump SortedCollection as OrderedCollection?')
            ifTrue: [
                ^errorObject asOrderedCollection]
            ifFalse: [
                self recordWarningMessage: 
                    'The sortBlock of a SortedCollection cannot be dumped properly, won''t be bound when loaded.'.
                ^errorObject]].

    errorClass := errorObject class.
    surrogate := errorClass basicNew.  " drops any indexed variables "
    self recordWarningMessage:
        'a ', errorClass name,
        ' cannot be dumped properly, won''t be bound when loaded.'.

    " selectively allow some information to be filed as clues... "
    (errorObject isKindOf: CompiledMethod) ifTrue: [
        surrogate
            classField: errorObject classField;
            selector: errorObject selector.
        ^surrogate].
    (errorObject isKindOf: Context) ifTrue: [
        " funky stuff because methods (properly!!) don't exist to get/set all of this "
        instVarNames := errorObject class allInstVarNames.
        slot := instVarNames indexOf: 'homeContext'.
        surrogate instVarAt: slot put: (errorObject instVarAt: slot).
        slot := instVarNames indexOf: 'blockArgumentCount'.  " VW only; not in VPM "
        (slot = 0) ifFalse: [surrogate instVarAt: slot put: (errorObject instVarAt: slot)].
        (errorObject isKindOf: HomeContext) ifTrue: [
            slot := instVarNames indexOf: 'method'.
            surrogate instVarAt: slot put: (errorObject instVarAt: slot).
            slot := instVarNames indexOf: 'receiver'.
            surrogate instVarAt: slot put: (errorObject instVarAt: slot)].
        ^surrogate].
    (errorObject isKindOf: Process) ifTrue: [
        surrogate
            initPositions: 0;  " empty contents so hash works properly "
            name: errorObject name.
        ^surrogate].

    ^surrogate!
 
instanceLayoutChanging: anArray
       " Private - answer whether inst var remapping needed. "
    | filedSize loadMap |
    filedSize := anArray at: 1.
    loadMap := anArray at: 2.
    (filedSize ~= loadMap size)
        ifTrue: [^true].   " adding or dropping values "
    1 to: (filedSize min: loadMap size) do: [ :i |
        ((loadMap at: i) = i) ifFalse: [^true]].  " inst var shuffled or dropped "
    ^false!
  
instVarLoadMapFrom: aCollection filedNames: filedNames loadNames: loadNames
        " Private - answer an instVarLoadMap based on the
        assoc's in aCollection which strings in filedNames
        to strings in loadNames.  Answer nil if an invalid
        instance variable name was specified. "
    | loadMap loadSlot filedSlot |
    loadMap := Array new: loadNames size.
    aCollection do: [ :assoc |
        loadSlot := loadNames indexOf: assoc key ifAbsent: [^nil].
        filedSlot := filedNames indexOf: assoc value 
            ifAbsent: [filedNames indexOf: assoc key " try current name "
                ifAbsent: [nil]].  " a new inst var is ok "
        filedSlot notNil
            ifTrue: [loadMap at: loadSlot put: filedSlot]].
    ^loadMap!
 
loadBehaviorDescriptors: loadMapsDict
         " Private - Read the <behavior descriptors section>
        of the objectStream to find referenced classes and
        MetaClasses and put pointers to them in objects list
        at their dump id.  Where there is a size mismatch,
        record an instVar map in the behaviors list. "
    | hasDllName dllBinder tag classId name rep 
      numNamedInstVars filedInstVarNames dllName
      behavior loadName loadRep loadInstVarNames
      loadAssoc instVarLoadMap title |

    hasDllName := self class versionHasDllInfo: objectVersion.
    hasDllName 
        ifTrue: [dllBinder := Smalltalk at: #ObjectLibraryBind].
    [(tag := objectStream next) ~= NUL] whileTrue: [
        classId := objectStream getInteger.
        name := objectStream upTo: NUL.
        rep := objectStream next.
        numNamedInstVars := objectStream getInteger.
        filedInstVarNames := Array new: numNamedInstVars.
        1 to: numNamedInstVars do: [ :i |
            filedInstVarNames at: i put: (objectStream upTo: NUL)].
        dllName := (hasDllName
            ifTrue: [objectStream upTo: NUL]
            ifFalse: [nil]).
        loadAssoc := loadMapsDict at: name ifAbsent: [nil].
        " determine the class to load into "
        loadAssoc notNil ifTrue: [  " override normal loading "
            loadName := loadAssoc key.
            (Smalltalk includesKey: loadName asSymbol) ifFalse: [
                self recordWarningMessage:
                    self warningLoadCancelled,
                    ' - class ', loadName, ' not found in this system',
                    ' (specified by load map as new class of filed ',
                    name, ' instances).'.
                ^nil]]
        ifFalse: [  " allow user to specify load class if class is not present "
            loadName := name.
            ((dllName size > 0)   " automatically bind DLL "
            and: [(Smalltalk includesKey: loadName asSymbol) not])
                ifTrue: [
                    self recordInfoMessage: 
                        'Attempting to bind DLL ', dllName,
                        ' to locate class ', loadName.
                    (dllBinder attemptBindTo: dllName)
                       ifTrue: [self recordInfoMessage: '    ...done']
                       ifFalse: [self recordInfoMessage: '   (unable to open or wrong version)'].
                    ].
            [Smalltalk includesKey: loadName asSymbol] whileFalse: [
                loadName := Prompter
                    prompt: 'Class ', name, ' is not in target system, enter new name:'
                    default: loadName.
                (loadName isNil) ifTrue: [   " bail if user cancelled "
                    self recordWarningMessage: 
                        self warningLoadCancelled,
                        ' - class ', name, ' not found in this system.'.
                    ^nil]]].
        behavior := Smalltalk at: loadName asSymbol.
        " determine whether load class is compatible or needs inst map "
        (tag = TagMetaClass) ifTrue: [
            behavior := behavior class]
        ifFalse: [   " check for incompatible class changes "
            " check for representation mismatch "
            loadRep := self repOf: behavior.
            (self rep: rep canBeLoadedInto: loadRep filedClass: name) ifFalse: [
                self recordWarningMessage:
                    self warningLoadCancelled,
                    ' -  cannot load filed ',
                    (self repDescription: rep), ' class ', name,
                    ' into ', (self repDescription: loadRep), ' class ', loadName.
                ^nil].
            " build load map for shape change or per loadMapsDict "
            loadInstVarNames := behavior allInstVarNames.
            loadAssoc notNil ifTrue: [
                instVarLoadMap := self
                    instVarLoadMapFrom: loadAssoc value
                    filedNames: filedInstVarNames
                    loadNames: loadInstVarNames.
                instVarLoadMap isNil ifTrue: [  " invalid mapping "
                    self recordWarningMessage: 
                         self warningLoadCancelled,
                         ' - load map supplied for changed class ',
                         name, ' is unusable.'.
                    ^nil]]
            ifFalse: [   " check for shape changes "
                ((numNamedInstVars ~= behavior instSize)
                or: [filedInstVarNames ~= loadInstVarNames]) ifTrue: [
                    " need to get mapping for shape change "
                    ((self class version = 6) 
                    and: [behavior name = 'Association'
                    and: [name = 'Association']]) ifTrue: [
                        " automatically upgrade assoc in VPM 2.0 "
                        instVarLoadMap := Array with: 2 with: 1]
                    ifFalse: [   " make user tell us what to do "
                        title := 'Loading class ', name.
                        (loadName ~= name)
                            ifTrue: [title := title, ' into ', loadName].
                        instVarLoadMap := ObjectLoadDialog new
                            openFor: title
                            sourceTitle: 'Filed:'
                            sourceVars: filedInstVarNames
                             destTitle: 'Loading:'
                            destVars: loadInstVarNames.
                        instVarLoadMap isNil ifTrue: [  " user cancelled "
                            self recordWarningMessage: 
                                 self warningLoadCancelled,
                                 ' - instance variable remapping for changed class ',
                                 name, ' cancelled.'.
                            ^nil]]
                    ]
                ifFalse: [  " no shape change or mapping override "
                    instVarLoadMap := nil]].
            instVarLoadMap notNil ifTrue: [
                instVarLoadMap := Array
                    with: numNamedInstVars    " num filed values "
                    with: instVarLoadMap.
                (self instanceLayoutChanging: instVarLoadMap)
                    ifTrue: [behaviors at: classId put: instVarLoadMap].
                ]].
        objects at: classId put: behavior.
        " track shape changes only if loading blocks "
        (remappedObjects isNil
        and: [behavior == HomeContext])  
            ifTrue: [remappedObjects := 
                LargeIdentityDictionary new: 127].
        ].!

loadFrom: aStream
        " Answer the object encoded on aStream at
        aStream's current position. "
    ^self loadFrom: aStream loadMaps: Dictionary new!
  
loadFrom: aStream loadMaps: loadMapsDict
        " Answer the object encoded on aStream at
        aStream's current position.  The loadMapsDict
        defines mappings for loading classes whose
        shape has changed.  The loadMapsDict key
        is the name of a filed class.  The value is an
        assoc whose key is the name of the class into
        which to load the filed instances and whose
        value is a collection of assoc's defining the instance
        variable mappings.  The key of an inst var map assoc
        is the name of the instance variable to be loaded
        and the value is the name of the filed inst var to
        load into its slot in the restored object.  An inst var
        is loaded with nil if there is no mapping for it. "
    | initialPosition rootObjectId lastBehaviorId
      firstObjectId lastObjectId |

    CursorManager execute change.
    Seal isNil ifTrue: [self class initialize].
    self class initSingularIds.  " refresh global bindings "

    objectStream := ((aStream respondsTo: #asByteFileStream)
        ifTrue: [aStream asByteFileStream]
        ifFalse: [aStream]).
    messageCounts := nil.
    operationAborted := false.
    initialPosition := objectStream position.  " for failure backout "

    " read the header section to verify version and establish the name space "
    (objectStream next ~= Seal)
        ifTrue: [
            self recordWarningMessage: 'Incorrect seal for filed object.'.
            objectStream position: initialPosition.  " back out "
            CursorManager normal change.
            ^nil].
    objectVersion := objectStream getInteger.
    (self class versionCanBeLoaded: objectVersion)
        ifFalse: [
            self recordWarningMessage: 
                'This ObjectFiler cannot load filed objects of version ',
                objectVersion printString.
            objectStream position: initialPosition.  " back out "
            CursorManager normal change.
            ^nil].
    numBehaviors := objectStream getInteger.
    numObjects := objectStream getInteger.
    rootObjectId := objectStream getInteger.
    (objectStream next ~= NUL)
        ifTrue: [
            self recordWarningMessage: 
                'File format error (bad header section)'.
            objectStream position: initialPosition.  " back out "
            CursorManager normal change.
            ^nil].

    " set up the dump id name space "
    lastBehaviorId := NumPredefinedIds + numBehaviors.
    firstObjectId := lastBehaviorId + 1.
    lastObjectId := lastBehaviorId + numObjects.
    self assignComputedIdRanges: lastObjectId.

    " objects is indexed by the dump ID of a behavior or object entry.
        For a behavior, contains loading system's behavior object.
        For an object, contains the restored object. "
    objects := Array new: lastObjectId.
    " behaviors is indexed by the dump ID of a behavior enty.
        For a behavior, contains an instVar mapping for size/shape changes. "
    behaviors := Array new: lastBehaviorId.
    " remappedObjects maps slot-shuffled objects to source info
        when loading blocks "
    remappedObjects := nil.

    " load the predefined objects "
    objects at: IdNil put: nil.
    SingularObjects associationsDo: [ :anAssociation |
        objects at: anAssociation value put: anAssociation key].

    (self loadBehaviorDescriptors: loadMapsDict) isNil ifTrue: [
        " unable to bind xrefs to load environment "
        objectStream position: initialPosition.  " back out "
        CursorManager normal change.
        ^ nil].
    self
        loadObjectDescriptors;
        restoreInstVars: firstObjectId;
        restoreLoadedObjects: firstObjectId rootObjectId: rootObjectId.
    operationAborted
        ifFalse: [self restoreLoadedHashStructures: firstObjectId].
    remappedObjects := nil.

    messageCounts notNil
        ifTrue: [self recordSummaryMessage: 'object loading'].
    CursorManager normal change.

    operationAborted ifTrue: [^nil].  " fatal load error encountered "
    ^(rootObjectId < idCharacterZero)
        ifTrue: [objects at: rootObjectId]
        ifFalse: [self computedObjectFromId: rootObjectId].!
   
loadInstVarIds: skeletonObject mapping: loadMap size: size
        " Private - Read pointer <values> of an <object descriptor>
        and stash the ids in the instance variables of skeletonObject.
        An instVarMap may be supplied to reorder the named instVars;
        it will always be provided when the load class is a different
        size than was the dump class. "
    | class filedSize filedValues instVarLoadMap filedIndex |

    class := skeletonObject class.

    " load named instance variables "
    loadMap isNil
        ifTrue: [  " no size change and no reordering of named instance variables "
            1 to: class instSize do: [ :i |
                skeletonObject instVarAt: i put: (objectStream getInteger)]]
        ifFalse: [  " reordering inst vars or changing class size "
            filedSize := loadMap at: 1.
            instVarLoadMap := loadMap at: 2.
            "ASSERT [instVarLoadMap size = class instSize]."
            " read all the filed values "
            filedValues := Array new: filedSize.
            1 to: filedSize do: [ :i |
                filedValues at: i put: (objectStream getInteger)].
            " load slots in skeleton, using filed values per user mapping "
            1 to: class instSize do: [ :i |
                filedIndex := instVarLoadMap at: i.
                skeletonObject instVarAt: i put:
                    ((filedIndex isNil)
                        ifTrue: [IdNil]
                        ifFalse: [filedValues at: filedIndex])].
            remappedObjects notNil
                ifTrue: [remappedObjects at: skeletonObject 
                                put: loadMap].
            ].

    " load indexed instance variables "
    (size > 0) ifTrue: [
        (class isVariable) ifTrue: [
            1 to: size do: [ :i |
                skeletonObject basicAt: i put: (objectStream getInteger)]]
        ifFalse: [  " drop filed indexed values on the floor "
            1 to: size do: [ :i | objectStream getInteger]]].!
  
loadLayoutChanges: anObject
        " Answer inst var change history for anObject.
        If the positions of anObject's instance values changed
        during loading, an array is answered with entries:
            1 - filed size of anObject
            2 - array indexed by current inst var slot containing
                    filed slot index that was loaded into this slot
                    (nil if no value loaded into this slot)
        May only be called by a fileInActivate: method. "
    ^remappedObjects at: anObject ifAbsent: [nil]!
 
loadObjectDescriptors
        " Private - Read the <object descriptors section> of the file.
        For each <object descriptor>, put the byte-date object
        or a pointer skeleton whose slots contain dump ids
        in the object list at its dump id. "
    | objectId classId size basicHash class anObject |

    [(objectId := objectStream getInteger) ~= IdNUL] whileTrue: [
        classId := objectStream getInteger.
        size := objectStream getInteger.
        basicHash := objectStream getInteger.
        ((classId = ClassIdSymbol) or: [classId = ClassIdDBSymbol]) ifTrue: [
            anObject := (classId = ClassIdSymbol)
                ifTrue: [String new: size]
                ifFalse: [(Smalltalk at: #DoubleByteString) basicNew: size].
            objectStream getBytesFor: anObject.
            anObject := anObject asSymbol]
        ifFalse: [
            class := objects at: classId.
            anObject := self new: class size: size.
            anObject hash: basicHash.  " hash: is really basicHash: "
            (class isBytes)
                ifTrue: [objectStream getBytesFor: anObject]
                ifFalse: [self
                    loadInstVarIds: anObject
                    mapping: (behaviors at: classId)
                    size: size]].
        objects at: objectId put: anObject].!
 
log: anObject
        " Private - Ensure anObject is in one of the two dictionaries,
        (behaviors or objects).  Recurse to log anObject's
        class and instance variables."
    | class surrogate |

    " behaviors entry maps behavior to its dump id. "
    (anObject isKindOf: Behavior) ifTrue: [
        (anObject == MetaClass) ifTrue: [^anObject].  " in TerminalClasses "
        (behaviors includesKey: anObject) ifFalse: [
            numBehaviors := numBehaviors + 1.
            behaviors at: anObject put: (NumPredefinedIds + numBehaviors)].
        ^anObject].

    " objects entry maps non-terminal object to its
        relative object number [1..n] and surrogate "
    ((TerminalClasses includes: anObject class)
    or: [(anObject isCharacter and: [anObject isSingleByte])
    or: [objects includesKey: anObject]])
        ifTrue: [^anObject].

    " allow object to sanitize its contents or transform itself if desired "
    surrogate := anObject fileOutSurrogate: self.
    class := surrogate class.
    (ErrorClasses includes: class) ifTrue: [
        surrogate := self fileOutSurrogateForErrorClass: surrogate.
        class := surrogate class].

    " log object's class in behaviors if not a self-describing <object descriptor> "
    surrogate isSymbol
        ifFalse: [self log: class].

    " log the object itself "
    numObjects := numObjects + 1.
    objects
        at: anObject
        put: (Association key: numObjects value: surrogate).

    " log each named instance variable and any indexed inst vars "
    (class isPointers) ifTrue: [
        1 to: (class instSize + surrogate basicSize) do: [ :i |
            self log: (surrogate instVarAt: i)]].
    ^anObject!
  
new: aClass size: numIndexedInstVars
        " Private - Answer a new skeleton instance of aClass. "
    ^(aClass isVariable)
        ifTrue: [aClass basicNew: numIndexedInstVars]
        ifFalse: [aClass basicNew]!
 
objectVersion
        " Answer the filed version of the object
        currently being loaded or dumped. "
    ^objectVersion!
   
recordAbortMessage: aString
        " Abort the operation in progress and notify the 
        user that a fatal error has occurred. "
    self recordMessage: aString 
        type: 'abort' 
        prefix: '*****FATAL ERROR: '.
    operationAborted := true.!

recordInfoMessage: aString
        " Notify the user that something interesting has occurred. "
    self recordMessage: aString type: 'info' prefix: ''.!
 
recordMessage: message type: type prefix: prefix
        " Private - record message about the current operation. "
    | messageWindow date |

   " update the message counts "
    messageCounts isNil
        ifTrue: [
            messageCounts := Dictionary new.
            #( 'summary' 'info' 'warning' 'abort') do: [ :aType |
                    messageCounts at: aType put: 0]].
    messageCounts 
        at: type put: ((messageCounts at: type) + 1);
        at: 'summary' put: ((messageCounts at: 'summary') + 1).

    clientMessageHandler notNil
        ifTrue: [
            clientMessageHandler 
                value: self 
                value: (Association key: type value: message).
            ^self].

    messageStream isNil ifTrue: [
        messageWindow := TextWindow new openOn: String new.
        date := Date today.
        messageStream := messageWindow pane.
        messageStream
            nextPutAll: 'ObjectFiler messages (';
            "nextPutAll: Date today printString; nextPut: Space;"
            nextPutAll: date dayOfMonth printString; nextPut: $-;
            nextPutAll: (date monthName copyFrom: 1 to: 3); nextPut: $-;
            nextPutAll: (date year printString copyFrom: 3 to: 4); nextPut: Space;
            nextPutAll: Time now printString;
            nextPutAll: ')'; cr; cr].
    messageStream 
        nextPutAll: prefix;
        nextPutAll: message; cr.!

recordSummaryMessage: operationDescription
        " Private - summarize messages 
        were encountered during the dump or
        load operation that has just completed. "
    | numWarnings |
    clientMessageHandler notNil
        ifTrue: [
            clientMessageHandler 
                value: self 
                value: (Association key: 'summary' value: messageCounts)]
        ifFalse: [
            ((numWarnings := messageCounts at: 'warning') > 0) 
                ifTrue: [messageStream
                    cr; nextPutAll: '***** '; 
                    nextPutAll: numWarnings printString;
                    nextPutAll: ' warnings encountered during ';
                    nextPutAll: operationDescription;
                    nextPutAll: ' *****'; cr].
            ((messageCounts at: 'abort') > 0)
                ifTrue: [messageStream
                    cr; nextPutAll: '***** ';
                    nextPutAll: operationDescription;
                    nextPutAll: ' aborted *****'].
            messageCounts := messageStream := nil].!
 
recordWarningMessage: aString
        " Notify the user that a non-fatal error has occurred.
        Usually indicates the dumping or loading of
        an object that should be bound but won't be."
    self recordMessage: aString type: 'warning' prefix: 'Warning: '.!

rep: filedRep canBeLoadedInto: loadRep filedClass: className
        " Private - answer whether filed class can be loaded into
        class with loadRep representation "
    (filedRep = loadRep)
        ifTrue: [^true].
    ((filedRep = RepVariableBytes) | (loadRep = RepVariableBytes))
        ifTrue: [^false].  " can't load into bytes into pointers or vice-versa "
    " pointers can be either indexed or fixed on either side "
    (filedRep = RepVariablePointers) "& (loadRep = RepFixedPointers)"
        ifTrue: [self recordWarningMessage:
                'Indexed instance variables of class ', className,
                ' dropped (loaded into non-indexed class)'].
    ^true!

repDescription: rep
        " Private - answer a string describing rep "
    ^(rep = RepFixedPointers)
        ifTrue: ['fixedPointers']
        ifFalse: [(rep = RepVariablePointers)
            ifTrue: ['variablePointers']
            ifFalse: ['variableBytes']]!
  
repOf: class
        " Private - answer representation of class "
    ^(class isPointers)
        ifTrue: [(class isVariable)
            ifTrue: [RepVariablePointers]
            ifFalse: [RepFixedPointers]]
        ifFalse: [RepVariableBytes]!
 
restoreInstVars: firstObjectId
        " Private - restore instance variables in the skeleton objects "
    | anObject class id |

    firstObjectId to: (objects size) do: [ :objectId |
        anObject := objects at: objectId.
        class := anObject class.
        (class isPointers) ifTrue: [
            1 to: (class instSize + anObject basicSize) do: [ :i |
                id := anObject instVarAt: i.   " dump id "
                anObject instVarAt: i put:
                    ((id < idCharacterZero)
                        ifTrue: [objects at: id]  " predefined and dynamically assigned ids "
                        ifFalse: [self computedObjectFromId: id])]]]  " computed objects "!
   
restoreLoadedHashStructures: firstObjectId
        " Private - rehash objects dumped from VPM 1.2
        which rely on basicHash. "
    | containsIdDict lastObjectId loadedObject rehashedDict
      contentsSlot |
    (objectVersion = 3) " need to check VPM 1.2 IdDict's "
        ifFalse: [^self].  
    " check classes to see if any IdentityDictionary's were loaded "
    containsIdDict := false.
    (NumPredefinedIds + 1) to: (firstObjectId - 1) do: [ :i |
        (objects at: i) == IdentityDictionary
            ifTrue: [containsIdDict := true]].
    containsIdDict ifFalse: [^self].
    " scan objects to fix IdentityDictionary instances "
    "ASSUMPTION: nobody should point to IdDict contents
        array other than the dict itself, so don't bother with
        second-pass scan over objects to check for references
        which need to be reset to the new contents. "
    lastObjectId := objects size.
    contentsSlot := IdentityDictionary allInstVarNames indexOf: 'contents'.
    " restore in bottom-up order (ids were assigned top-down in object graph) "
    lastObjectId to: firstObjectId by: -1 do: [ :objectId |
        loadedObject := objects at: objectId.
        (loadedObject class == IdentityDictionary)
            ifTrue: [
                rehashedDict := IdentityDictionary newSize:
                    (loadedObject contents size // 2).
                loadedObject associationsDo: [ :anAssoc |
                    rehashedDict add: anAssoc].
                loadedObject
                    instVarAt: contentsSlot
                    put: rehashedDict contents]].!
 
restoreLoadedObjects: firstObjectId rootObjectId: rootObjectId
        " Private - restore objects which need special initialization.
        Allow activation to transform the identity of the restored object. "
    | lastObjectId loadedObject activatedObject transformations class
      patchQ |

    lastObjectId := objects size.

    " restore in bottom-up order (ids were assigned top-down in object graph) "
    transformations := LargeIdentityDictionary new: 127.
    patchQ := OrderedCollection new.
    lastObjectId to: firstObjectId by: -1 do: [ :objectId |
        loadedObject := objects at: objectId.
        activatedObject :=
            (ErrorClasses includes: loadedObject class)
                ifTrue: [self fileInActivateForErrorClass: loadedObject]
                ifFalse: [loadedObject fileInActivate: self].
        (activatedObject ~~ loadedObject) ifTrue: [
            transformations at: loadedObject put: activatedObject.
            (activatedObject class isPointers)
                ifTrue: [patchQ add: activatedObject]].
        operationAborted ifTrue: [^nil]].

    (transformations size = 0) ifTrue: [^self].

    " fix up pointers in any objects which are being transformed to new identities "
    patchQ do: [ :aTransformedObject |
        class := aTransformedObject class.
        1 to: (class instSize + aTransformedObject basicSize) do: [ :i |
            activatedObject :=
                    transformations at: (aTransformedObject instVarAt: i) ifAbsent: [nil].
            activatedObject notNil
                ifTrue: [aTransformedObject instVarAt: i put: activatedObject]]].

    " fix references to any objects which changed their identity when activated "
    firstObjectId to: lastObjectId do: [ :objectId |
        loadedObject := objects at: objectId.
        class := loadedObject class.
        (class isPointers) ifTrue: [
            1 to: (class instSize + loadedObject basicSize) do: [ :i |
                activatedObject :=
                    transformations at: (loadedObject instVarAt: i) ifAbsent: [nil].
                activatedObject notNil
                    ifTrue: [loadedObject instVarAt: i put: activatedObject]]]].  " become: "

    " special check in case the root object transformed itself "
    (rootObjectId < idCharacterZero) ifTrue: [
        activatedObject :=
            transformations at: (objects at: rootObjectId) ifAbsent: [nil].
        activatedObject notNil
            ifTrue: [objects at: rootObjectId put: activatedObject]].!
  
warningLoadCancelled
        " Answer the warning message prefix used
        in all warning messages about a load
        operation being cancelled by the user."
    ^'Object loading cancelled'! !
