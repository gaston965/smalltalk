"*** Smalltalk Express v2.0.4 Update Installation ***"

|
  thisFileName updateVersion updateVersionValue imageVersion imageVersionValue
  verStream verMultiplier verArray mdi wbDev wbRun abort msgStream fileName installDir
  pkgs
|
thisFileName  := 'install.st'.
imageVersion  := Smalltalk version.
updateVersion := '2.0.4'.
abort 		  := false.

"Compute numerical value of image version."
verStream := ReadStream on: imageVersion.
verArray := OrderedCollection new.
[ verStream atEnd ] whileFalse: [
    verArray add: (verStream upTo: $.) asInteger ].
verArray size = 2
    ifTrue: [ verArray add: 0 afterIndex: 1 ].
verMultiplier := 1000.
imageVersionValue := 0.
verArray do: [ :each |
    imageVersionValue := imageVersionValue + (each * verMultiplier).
    verMultiplier := verMultiplier / 1000 ].

"Compute numerical value of update version."
verStream := ReadStream on: updateVersion.
verArray := OrderedCollection new.
[ verStream atEnd ] whileFalse: [
    verArray add: (verStream upTo: $.) asInteger ].
verArray size = 2
    ifTrue: [ verArray add: 0 afterIndex: 1 ].
verMultiplier := 1000.
updateVersionValue := 0.
verArray do: [ :each |
    updateVersionValue := updateVersionValue + (each * verMultiplier).
    verMultiplier := verMultiplier / 1000 ].

"Determine what extras are currently installed in the image."
wbRun := (Smalltalk includesKey: #FramingParameters).
wbDev := (Smalltalk includesKey: #WindowBuilder).
mdi := (Smalltalk includesKey: #MDISystem).

"Give user message on type of installation and chance to abort."
msgStream := WriteStream on: String new.
msgStream
	nextPutAll: 'Installing Smalltalk Express v', updateVersion, ' Update\\';
	nextPutAll: 'Current Configuration:\\';
	nextPutAll: '   Image Version:'; tab; nextPutAll: imageVersion; nextPut: $\;
	nextPutAll: '   WindowBuilder:'; tab.
wbDev
	ifTrue: [ msgStream nextPutAll: 'Development Installed' ]
	ifFalse: [
		wbRun
			ifTrue: [ msgStream nextPutAll: 'Runtime Installed' ]
			ifFalse: [ msgStream nextPutAll: 'Not Installed' ]].
msgStream
	nextPut: $\;
	nextPutAll: '   MDI:'; tab; tab; nextPutAll: (mdi ifTrue: [ '' ] ifFalse: [ 'Not ' ]), 'Installed\'.
imageVersionValue >= updateVersionValue ifTrue: [
	msgStream nextPutAll: '\Your Smalltalk Express image is already up to date.'.
	MessageBox message: msgStream contents withCrs.
	^nil ].
msgStream nextPutAll: '\Proceed?'.
abort := (MessageBox confirm: msgStream contents withCrs) not.

"Check if the installation has been aborted."
abort ifTrue: [
	MessageBox message: 'SE v', updateVersion, ' Update has been cancelled.'.
	^nil ].

"Define the code packages that comprise the installation."
pkgs := OrderedCollection new.
imageVersionValue < 2000.003 ifTrue: [
	pkgs
		add: 'BASEIMG1.203';
		add: 'BASEIMG2.203';
		add: 'BMPCLS.203';
		add: 'BMPMTH.203';
	    yourself.
	mdi
		ifTrue:  [ pkgs add: 'MDI.203' ].
	wbRun
		ifTrue:  [ pkgs add: 'WBRUN.203' ]
		ifFalse: [ pkgs add: 'NOWB.203' ].
	pkgs
		add: 'OBSMTH.203' ].
imageVersionValue < 2000.004 ifTrue: [
	pkgs
		add: 'BASEIMG.204';
	    yourself.
	mdi
		ifTrue:  [ pkgs add: 'MDI.204' ].
	wbRun
		ifTrue:  [ pkgs add: 'WBRUN.204' ]
		ifFalse: [ pkgs add: 'NOWB.204' ].
	pkgs
		add: 'OBSMTH.204' ].


"Determine the directory that the installation is running from."
File allInstances do: [ :f |
    (f name notNil and: [ f name asLowerCase = thisFileName ]) ifTrue: [
        installDir := f directory ]].
installDir isNil ifTrue: [
    installDir := Directory current ].

Transcript
    cr;
    show: 'Installing Smalltalk Express v', updateVersion, ' Update ....';
	cr.

"Install the packages."
pkgs do: [ :pkg |
    Transcript cr; show: 'Installing ', pkg, '...'; cr.
    fileName := installDir fullDirName, pkg.
    (File pathNameReadOnly: fileName) fileIn; close ].

Transcript
    cr;
    show: 'Smalltalk Express v', updateVersion, ' Update installed successfully';
	cr.

