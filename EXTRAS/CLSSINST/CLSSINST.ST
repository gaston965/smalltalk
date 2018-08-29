"
******************************************************************************
Application : Class Instance Variables
Date        : Sep 14, 1996
Time        : 12:52:45

Classes : 

Methods : 
Class>>recreate:
ClassReader>>fileOut:
ClassHierarchyBrowser>>text:
ClassHierarchyBrowser>>acceptClass:from:
ClassHierarchyBrowser>>instanceVars:
ClassHierarchyBrowser>>newMethod
ClassHierarchyBrowser>>update
ClassHierarchyBrowser>>selector:
MetaClass>>instanceVariableNames:
MetaClass>>fileOutOn:
MetaClass class>>subclassOf:

******************************************************************************
"!



!Class methods ! 
recreate: numberOfExtraFields
	"Courtesy Hal Hildebrand"
	| newInstance mySuperclass myName oldId |
	myName := self symbol.
	newInstance := self class basicNew.
	oldId := self id.
	1 to: self class instSize - numberOfExtraFields do: [:i |
		newInstance instVarAt: i put: (self instVarAt: i)].
	mySuperclass := self superclass.
	mySuperclass removeSubclass: self.
	mySuperclass addSubclass: newInstance.
	Smalltalk at: myName put: newInstance.
	newInstance methodDictionary do: [:m |
		m classField = self ifTrue: [m classField: newInstance]].
	newInstance subclasses copy do: [:sub |
		sub superclass: newInstance.
		sub recreate: numberOfExtraFields].
	TableOfClasses at: oldId + 1 put: newInstance.
	newInstance id: oldId.
	self become: DeletedClass! !

!ClassReader methods !   
fileOut: aFileName
        "Write the source for the class (including the class definition,
         instance methods, and class methods) in chunk file format
         to aFileName."
    | aFileStream aMetaClass |
    class isNil ifTrue: [^self].
    aFileName isNil ifTrue: [^self].
    CursorManager execute change.
    aFileStream := File newFile: aFileName.
    aFileStream lineDelimiter: Cr.
    class fileOutOn: aFileStream.
    aFileStream nextChunkPut: ''.
    aMetaClass := class class.
    aMetaClass instanceVariableString = ''
        ifFalse: [
            aFileStream cr; cr.
            aMetaClass fileOutOn: aFileStream.
            aFileStream nextChunkPut: ''].
    (ClassReader forClass: class class) fileOutOn: aFileStream.
    self fileOutOn: aFileStream.
    aFileStream close.
    CursorManager normal change!    !

!ClassHierarchyBrowser methods ! 
text: textPane
		"Private - Set the source text for
		 the selected method or class definition
		 for the selected class."
	| answer aClass |
	selectedClass isNil
		ifTrue: [^textPane contents: String new].
	aClass := instanceSelectedLast
		ifTrue: [selectedClass]
		ifFalse: [selectedClass class].
	methodSelectedLast
		ifTrue: [
			aClass := instanceSelectedLast
				ifTrue: [selectedClass]
				ifFalse: [selectedClass class].
			selectedMethod isNil
				ifTrue: [^textPane contents: self template]
				ifFalse: [^textPane contents: (aClass sourceCodeAt: selectedMethod)]].
	answer := WriteStream on: (String new: 100).
	aClass fileOutOn: answer.
	textPane contents: answer contents!   !

!ClassHierarchyBrowser methods ! 
acceptClass: aString from: aPane
		"Private - Accept aString as an updated
		 class specification and compile it.  Notify
		 aPane if the compiler detects errors."
	| result |
	result := Compiler
		evaluate: aString
		in: nil class
		to: nil
		notifying: aPane
		ifFail: [^true].
	Smalltalk logEvaluate: aString.
	result isClass ifTrue: [selectedClass := result].
	self
		changed: #instanceVars:;
		changed: #text: .
	^result isClass not!  !

!ClassHierarchyBrowser methods ! 
instanceVars: instVarPane
        "Private - Set the list of instance variables."
    | aClass |
    selectedClass isNil
        ifTrue: [^instVarPane contents: Array new].
    instanceSelectedLast
        ifTrue: [aClass := selectedClass]
        ifFalse: [aClass := selectedClass class].
     self checkMenuForInstanceVariable.
     instVarPane contents: aClass allInstAndClassVarNamesGrouped.!   !

!ClassHierarchyBrowser methods ! 
newMethod
		"Private - Display the text for a new
		 method template in the text pane."
	selectedClass isNil
		ifTrue: [self error: 'no class selected'].
	self textModified
		ifFalse: [
			self
				changed: #selectors:;
				selector: nil;
				disableMethodsMenu.
			(self paneAt: #text:) selectAll]!  !

!ClassHierarchyBrowser methods ! 
update
		"Private - Recompute the browsed
		 classes and display them."
	self textModified ifTrue: [^self].
	CursorManager execute changeFor: [
		selectedMethod := nil.
		methodSelectedLast := false.
		self update: originalClasses.
		self changed: #hierarchy:.
		self disableClassesMenu.
		self disableMethodsMenu.
		self
			changed: #selectors: ;
			changed: #text: ;
			changed: #instanceVars:].

	selectedClass isNil
		ifTrue: [^self].
	1 to: browsedClasses size do: [:i |
		(selectedClass name = (((browsedClasses at: i) trimBlanks) copyWithout: $.))
			ifTrue: [
				(self paneAt: #hierarchy:) selection: i.
				self hierarchySelected: (self paneAt: #hierarchy:).
				^self]]!    !

!ClassHierarchyBrowser methods ! 
selector: selectorPane
		"Private - Display the selected
		 method in the text pane."
	selectedMethod := selectorPane isNil
		ifTrue: [nil]
		ifFalse: [selectorPane selectedItem].
	methodSelectedLast := true.
	self changed: #text:.
	self enableMethodsMenu.
	(((selectedInstVar notNil) and: [selectedMethod notNil]) and: [assigned | used]) ifTrue: [
		self changed: #text: with: #searchFor: with: selectedInstVar]! !

!MetaClass methods ! 
instanceVariableNames: stringOfInstVarNames
	"Courtesy Hal Hildebrand"
	| theClass oldSize newSize aStream theClassName |
	theClass := self instanceClass.
	theClassName := theClass symbol.
	oldSize := self instVarNames size.
	newSize := stringOfInstVarNames asArrayOfSubstrings size.
	oldSize < newSize
		ifTrue: [
			theClass withAllSubclasses do: [:each |
				each allInstances notEmpty ifTrue: [self error: 'Has instances']]].
	self instVarNames: stringOfInstVarNames.
	oldSize < newSize ifTrue: [theClass recreate: newSize - oldSize].
	theClass := Smalltalk at: theClassName.
	aStream := WriteStream on: (String new: 64).
	theClass fileOutOn: aStream.
	Smalltalk logSource: aStream contents forClass: theClass.
	self compileAll.
	self allSubclasses do: [:aClass | aClass compileAll].
	^theClass!  !

!MetaClass methods ! 
fileOutOn: aStream
        "Append the class definition message for the receiver to <aStream>."
    aStream
        nextPutAll: self name;
        space;
        nextPutAll: 'instanceVariableNames: ';
        nextPutAll: self instanceVariableString storeString! !

!MetaClass class methods !   
subclassOf: aClass
		"Private - Answer a new metaclass that is
		 a subclass of the metaclass for aClass."
	| newMeta |
	newMeta := self new.
	newMeta
		assignClassHash;
		structure: aClass class structure;
		superclass: (aClass isNil
			ifTrue: [nil]
			ifFalse: [
				aClass == Class
					ifTrue: [Class]
					ifFalse: [aClass class]]);
		methodDictionaries:
			(Array with: (MethodDictionary newSize: 2))
			, newMeta superclass methodDictionaries.
	^newMeta! !
"construct application"
((Smalltalk at: #OSIApplication ifAbsent: [])
    isKindOf: Class) ifTrue: [
        ((Smalltalk at: #OSIApplication) for:'Class Instance Variables')
            addMethod: #subclassOf: forClass: MetaClass class;
            addMethod: #recreate: forClass: Class;
            addMethod: #fileOut: forClass: ClassReader;
            addMethod: #text: forClass: ClassHierarchyBrowser;
            addMethod: #acceptClass:from: forClass: ClassHierarchyBrowser;
            addMethod: #instanceVars: forClass: ClassHierarchyBrowser;
            addMethod: #newMethod forClass: ClassHierarchyBrowser;
            addMethod: #update forClass: ClassHierarchyBrowser;
            addMethod: #selector: forClass: ClassHierarchyBrowser;
            addMethod: #instanceVariableNames: forClass: MetaClass;
            addMethod: #fileOutOn: forClass: MetaClass;
            comments: nil;
            initCode: nil;
            finalizeCode: nil;
            fileName: 'CLSSINST.APP';
            startUpCode: nil;
            excludeApps: #();
            dllName: 'ClssInst.DLL';
            dllSpecialCode: '';
            dllinitMethod: nil]!
