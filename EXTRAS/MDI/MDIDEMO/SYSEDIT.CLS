
MDIViewManager subclass: #SysEdit
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants VirtualKeyConstants '   !


!SysEdit class methods !
 
mdiMenu
        "Private - Answer a standard MDI Window menu"
    ^MDIMenu new
        appendItem: '&New Window' selector: #mdiNewWindow accelKey:$n accelBits:AfControl;
        appendItem: '&Cascade	Shift+F5' selector: #mdiCascade accelKey: VkF5 accelBits: AfVirtualkey|AfShift ;
        appendItem: '&Tile	Shift+F4' selector: #mdiTile accelKey: VkF4 accelBits: AfVirtualkey|AfShift ;
        appendItem: 'Arrange &Icons' selector: #mdiArrange;
        title: '&Window'.!
 
optionMenu
        "Private - Answer the option menu"
    ^Menu new
        appendItem: '&StatusPane' selector:#toggleStatusPane;
        title: '&Options'.! !



!SysEdit methods !
   
childActivate:aPane
        "Private - Update the StatusPane"
    |mdiActive|
    (mdiActive := self frame mdiGetActive) notNil ifTrue:[
        (self statusPane statusBoxAt: #status) contents: mdiActive label].!

close:aPane
        "Private - Close the receiver application"
    Smalltalk isRunTime
        ifTrue: [
            (MessageBox confirm: 'Are you sure you want to exit?')
                ifTrue: [
                    self close.
                    ^Smalltalk exit]
                ifFalse: [
                    ^self]]
        ifFalse: [
            ^self close].!
  
createDocuments
        "Private - Create the MDI documents"

    |buffer winaddress pathName file|
    buffer:=String new: 160.
    winaddress:=WinAddress copyToNonSmalltalkMemory: buffer.
    KernelLibrary getWindowsDirectory:winaddress asParameter length:buffer size.
    pathName:=String fromAddress:winaddress.
    winaddress unlockAndFree.

    self openTextWindow:pathName,'\SYSTEM.INI'.
    self openTextWindow:pathName,'\WIN.INI'.
    self openTextWindow:'C:\CONFIG.SYS'.
    self openTextWindow:'C:\AUTOEXEC.BAT'.!
   
label
        "Private - Answer the receiver's mainView label"

    ^'System Configuration Editor'!
  
mdiMenu:anMDIFrame
        "Private - Create the menuBar for the frame"

    anMDIFrame mdiMenuWindow addMenu:self class optionMenu owner:self.
    anMDIFrame mdiMenuWindow addMenu:self class mdiMenu owner:self.!

open
        "Create and open a SysEdit application"
    self
        addView: (self frame:
            (MDIFrame new
                owner: self;
                icon:(Icon fromModule:self resourceDLLFile id:'Default');
                when: #mdiMenuBuilt perform: #mdiMenu:;
                when: #childActivate perform: #childActivate:;
                when: #close perform:#close:;
                label: self label)).
    self
        addSubpane:(
            StatusPane new
                owner:self;
                when: #getContents perform: #statusPane:).

    self openWindow.
    self toggleMenu:'&Options' item:#toggleStatusPane.
    self createDocuments.!
   
openTextWindow:aFileName
        "Private - Open a TexWindow application as an MDI document"
    |file|
    file := File pathName:aFileName.
    (self statusPane statusBoxAt: #status) contents: file file name.
    TextWindow new
            frame:self frame;
            disableSystemMenuItemClose;
            icon:(Icon fromModule:self resourceDLLFile id:'TextWindow');
            openOnFile: file.
    file close.!

resourceDLLFile
        "Private - Answer the DLL filename for resources"
    ^Icon defaultDLLFileName!
   
statusPane: aStatusPane
        "Private - Set the StatusPane contents"
    | statusBoxes |
    statusBoxes := OrderedCollection new
                                    add: (StatusBox new
                                        space: aStatusPane font width;
                                        name: #status);
                                    yourself.

    aStatusPane contents: statusBoxes.!
 
statusPaneHelp:aKey
    "Private - Answer the hint text to the StatusPane"

    ^HelpSysEdit at:aKey ifAbsent:[^super statusPaneHelp:aKey].!
 
toggleMenu: menuName item: itemName
    "Private - Toggle the selected menu item"

    | theMenu aBoolean|

    theMenu := self frame menuWindow menuTitled: menuName.
    (aBoolean:=theMenu isChecked:itemName)
        ifTrue: [self frame uncheckItem:itemName forAllMDIChildMenus:menuName]
        ifFalse: [self frame checkItem:itemName forAllMDIChildMenus:menuName].

    ^aBoolean!
   
toggleStatusPane
        "Private - Show/Hide the ToolPane"

    self toggleMenu:'&Options' item:#toggleStatusPane.
    self statusPane show.
    self mdiArrange.! !
