SMALLTALK EXPRESS
by ObjectShare, a division of ParcPlace-Digitalk

README.TXT file

Important Information - Please Read Me
--------------------------------------

This file contains important information about the contents of
Smalltalk Express files and some details about the software
not covered in the handbook.  This file addresses the following
topics:

I.      Installation of Smalltalk Express
II.     New features of Smalltalk Express
III.    Microsoft Windows 3.x Configuration
IV.     Installation of WindowBuilder Pro
V.      Tips, tricks and solutions.
VI.     Application delivery vs development
VII.    API calls using Pascal and C calling conventions
VIII.   Starting up a standalone application
IX.     Changing standalone application icon and startup screen
X.      Cross-language debugging
XI.     Saving the image
XII.    Other topics
XIII.   Known problems


I.   INSTALLATION OF SMALLTALK EXPRESS

To install Smalltalk Express, first bring up Microsoft Windows.
Next, double-click on the SETUP.EXE program provided with the
Smalltalk Express installation.  The install program will ask 
for the directory (default is C:\STEXPRES on your hard disk)
into which to expand and install the files.  

The installation program will create a new Program Group with 
the title Smalltalk Express.  It contains an icon labeled 
Smalltalk Express and an icon labeled Encyclopedia of Classes.

This version of Smalltalk Express will not run correctly with more 
than 256 colors. Please set your video driver to 256 color mode.

To run Smalltalk Express, you simply double-click on this icon.

Be sure to include your new Smalltalk Express directory in your PATH
environment variable (e.g., either "C:\STEXPRES" or ".;").

A detailed list with descriptions of all the files of Smalltalk 
Express is provided in the "packing.txt' file in the Smalltalk 
Express root directory.

After installing the product, please visit the ObjectShare web 
site at http://www.objectshare.com to find the latest 
information on Smalltalk Express: projects using Smalltalk 
Express, bug fixes, additional compatible classes and tools, 
and more.


II. FEATURES OF SMALLTALK EXPRESS

The features of Smalltalk Express are as follows:

    - Support for Microsoft Windows 3.1, Windows 95 and Windows NT.

    - Support for Windows Multiple Document Interface (MDI), a user interface
      standard for presenting and manipulating multiple documents within
      a single application.  The documentation of MDI support is provided in "mdi.txt"
      in the "docs" subdirectory.  MDI (along with ToolPane and StatusPane) can 
      be installed by evaluating the following expression:

      (File pathName: 'extras\mdi\mdi.st') fileIn; close.

    - ToolPane, a SubPane consisting of a row of bitmaps each of which can
      be assigned a selector to be performed when you click on it.  The 
      documentation of ToolPane is provided in "toolpane.txt" in the "docs"
      subdirectory.  ToolPane (along with MDI and StatusPane) can be installed by
      evaluating the following expression:

      (File pathName: 'extras\mdi\mdi.st') fileIn; close.

    - StatusPane, a SubPane which displays information reflecting the states
      of the application and  which shows hints when the user highlights a menu item.
      The documentation of StatusPane is provided in "statuspn.txt" in the "docs" 
      subdirectory.   StatusPane (along with ToolPane and MDI) can be installed 
      by evaluating the following expression:

      (File pathName: 'extras\mdi\mdi.st') fileIn; close.

    - ObjectFiler for sharing objects easily with other applications and
      developers.  The documentation of the ObjectFiler is provided in
      "objfiler.txt" in the "docs" subdirectory.   The ObjectFiler can be installed
      by evaluating the following expression:

      (File pathName: 'extras\objfiler\vwobjflr.st') fileIn; close.

    - HelpManager support.  The HelpManager class allows you to add context-
      sensitive help to your applications by creating instances of this new class.
      Documentation of the HelpManager is provided in "helpmgr.txt" in the 
      "docs" subdirectory.

    - National Language and Double-Byte Character Set Support (NLS/DBCS).
      The documentation of NLS/DBCS is provided in "nlsdbcs.txt" in the 
      "docs" subdirectory.   NLS/DBCS can be installed by evaluating the 
      following expression:

      (File pathName: 'extras\nlsdbcs\nlsdbcs.st') fileIn; close.

    - Callback which allows you to call back into Smalltalk Express.
      The documentation of the CallBack class is provided in "callback.txt"
      in the "docs" subdirectory.

    - The ability to assign an individual icon for each TopPane.
      For documentation on the Icon class, look at  the "icon.txt" file in the
      "docs" subdirectory. 

    - ClassComparisonTool has been added.  ClassComparisonTool 
      is a tool which compares the classes in two images, telling you
      the following information:

       1. what classes have been added or deleted from the images

       2. for classes which the two images have in common, what
        methods have been added, deleted, or changed.

      The documentation of the ClassComparisonTool and ClassDumper
      is provided in "clscomp.txt" and "dumper.txt" in the "extras\clscomp" 
      subdirectory. The ClassComparisonTool can be installed by evaluating
      the following expression:

      (File pathName: 'extras\clscomp\clscomp.st') fileIn; close.
       
      The ClassDumper can be installed by evaluating the 
      following expression:

      (File pathName: 'extras\clscomp\dumper.st') fileIn; close.

    - Printing has been improved.  In addition to the new
      PrintDialog class, PrintAbortDialog class has been added to allow
      the user to abort from a print job.  Also, text from TextPane
      is now printed using the selected font of the TextPane.  

    - The class SelfDefinedStructure has been added.    SelfDefinedStructure
      allows you to have an instance of WinStructure that corresponds to a
      C struct but does not require an entirely new Smalltalk class.  For
      documentation on SelfDefinedStructures, look at  the"selfdef.txt" file in
      the "docs" subdirectory.

    - A Window class properties feature has been added.   A property is very 
      much like an instance variable, but for those instances that do not have 
      a particular property, there is no space "wasted" on an instance variable.  
      For documentation on Window properties look at the"property.txt" file in
      the "docs" subdirectory.

    - Remote WinStructures has been added.  Remote WinStructures allows
      you to directly access the fields of a struct at its non-Smalltalk address.
      For documentation on Remote WinStructures, look at the "remstruc.txt" file
      in the "docs" subdirectory.

    - The ability to send user interrupts has been added.  For documentation
      on user interrupts, look at the "userint.txt" file in the "docs" subdirectory.
      
    - DDE has been improved.  In previous releases, when a DDEClient makes
      a request of a server (set up a hot or warm link, execute a command,  poke
      some data),  the DDEClient would return true to the application if the request
      was successfully sent.  In this release, the DDEClient waits until it
      receives the response from the server (the server responds true if it can act
      upon the request, false otherwise), and the DDEClient returns this response
      to the application.  When the DDEClient requests data from the server, it 
      returns nil to the application if the server could not provide the data requested.

      A timeout feature has also been implemented.  If a DDEClient makes a request
      of the server, and the server does not respond to the request within 10 seconds,
      the DDEClient displays a MessageBox allowing the user the option to continue
      to wait or to stop waiting.  The amount  of time to wait is set in
      DDEAuxClient>>setTimeOut.
    
    - The ability to add copyright info into the image has been added.
      This allows you to embed your application's copyright information 
      into the image.  This can be accomplished through the Smalltalk>>
      copyright: aString method.  aString must be less than 1K is size.  
      The copyright string can be retrieved through the Smalltalk>>copyright
      method.

    - The ability to change the signon DLL file name has been added.
      This can be accomplished by sending the "signonDLL: aString"
      message to Smalltalk. The signon DLL file name can be retrieved
      by sending the signonDLL message to Smalltalk.

    - The ability to view methods that reference class variables has been
      added.  ClassHierarchyBrowser will now show the class variables
      in the variable list box.  When the class variable is selected, only
      the methods that make reference(s) to it will be displayed in the methods
      list box.

    - SelfDefinedStructureInspector has been added.  To install
      SelfDefinedStructureInspector,  file in "sdsinspc.st" from the
      "extras\sdsinspc" subdirectory.

    - The ability to send "startUp" and "exit" messages to objects has
      been added.  This allows you to perform system initialization and 
      cleanup without changing the "startUp" and "exit" methods in 
      SystemDictionary.

      The following instance methods have been added to SystemDictionary:

      >>notifyAtStartUp: anObject
            "Add anObject to the StartUpObjects class variable.
             At system startup the objects in this class array are sent
             a startUp message.  Users must implement a startUp
             method in anObject."

      >>notifyAtExit: anObject
            "Add anObject to the ExitObjects class variable.
             At system exit time, the objects in this class array are sent
             an exit message.  Users must implement an exit
             method in anObject."

      >>removeStartUpObject: anObject
            "Remove anObject from the StartUpObjects class variable.
             At system startup the objects in this class array are sent
             a startUp message.  Users must implement a startUp
             method in anObject."

      >>removeExitObject: anObject
            "Remove anObject from the ExitObjects class variable.
             At system exit time, the objects in this class array are sent
             an exit message.  Users must implement an exit
             method in anObject."

    - During garbage collection, the cursor now changes to an hourglass.

    - The ability to add a root class (class outside of Object class) has been
       added. This can be accomplished through the following expression:

      nil subclass: #AntiObject
        instanceVariableNames: ''
        classVariableNames: ''
        poolDictionaries: ''

      Also, a SystemDictionary>>rootClasses method has been added.  This
      method answers an OrderedCollection of all the classes that are
      subclasses of nil.  It is recommended that this method be used to get
      all the "root" classes instead of assuming that "Object" is the only
      root class.

    - Accelerator keys for the edit menu have been changed.  The new
      accelerator keys are:

          Ctrl+Z for Undo
          Ctrl+X for Cut
          Ctrl+C for Copy
          Ctrl+V for Paste

      The old accelerator keys are still supported.
    
    - The symbol hashing algorithm has been improved. 

    - backColor and foreColor support has been moved up from
      ApplicationWindow class to Window class.  Now, each window can
      have its own independent backColor and foreColor.  The foreColor of
      the windows can be selected through the font dialog. New public
      methods added to the Window class are:

      backColor
              "Answer the background color of the receiver."

      backColor: aColor
              "Set the background color of the receiver."

      foreColor
              "Answer the foreground color of the receiver."

      foreColor: aColor
              "Set the foreground color of the receiver."

    - SubPane>>idOk and >>idCancel methods were added which set
      the id of the SubPane to that of an 'OK' or 'Cancel' button, respectively.
      If the SubPane is added to a DialogTopPane, the selector assigned for a
      #clicked event will be performed when the 'Enter' or 'Escape' key is pressed.



III.   MICROSOFT WINDOWS 3.x CONFIGURATION

Microsoft Windows must be configured to run either in enhanced or
standard mode.  Smalltalk Express will not run in real mode.

If you have less than 4 MB of RAM total, you should free up as much
memory as possible by removing any RAM disks, or by reducing the size
of your disk-caching buffer (refer to Optimizing Windows in the
Microsoft Windows User's Guide).

If you have an 80386 or 80486 CPU, we recommend that you install a
permanent swap file.  This will improve the performance of Smalltalk
and other Windows applications, especially on systems with 4 MB or
less of RAM (refer to Optimizing Windows in the Microsoft Windows
User's Guide).



IV.  INSTALLATION OF WINDOWBUILDER PRO

WindowBuilder Pro is the leading GUI builder used in the Smalltalk
world. You may install WBPro in a clean Smalltalk Express image
by filing in the file WBPRO.ST in the \WBPRO directory. Please read
the READMEWB.TXT file before doing this. Note that WBPro is
pre-installed into the image provided by Smalltalk Express



V.   TIPS, TRICKS AND SOLUTIONS

This section discusses useful tips, tricks and solutions.

1. If you are having problems selecting certain fonts using the Font
class >>face:size:fixedWidth: method, use the new Font class
>>face:size:fixedWidth:bold:hollow:italic:negative:strikeOut:underscore:
charSet: method with OemCharset as the charSet.  Another alternative is
illustrated by the following expression:

    MyFont :=  Font new
                   faceName: 'Arial';
                   pointSize: 12 graphicsMedium: Display;
                   "Any other attributes that you want to assign"
                   charSet: AnsiCharset.
    MyFont makeFont.

The problem with selecting certain fonts, such as Roman, is that
they use a character set other than AnsiCharset.  Having the wrong
character set is weighed heavily against the font by Windows when
selecting a font.

When you are requesting a Font, MS Windows will try to find the
closest matching font.  Certain sizes of non-outline fonts may not
be available, in which case MS Windows will return the font with
the closest matching size.


2.  To create a resource-only DLL with CBS_DROPDOWN or CBS_SIMPLE
style combo boxes, give the DLL its own data segment and heap space
(Look at the source code in the examples\vwdlgs subdirectory).  Not giving the
DLL its own data segment and heap space will cause an Unrecoverable
Application Error.  For some reason, the edit box portion of the combo
box is always trying to use the DLL's data segment.  This is a confirmed
Microsoft bug.

3.  Only one AnimationPane can be active (with animation running in it)
at any given time.  This is a design limitation.

4.  If you are creating a data entry window (a window with lots of
controls), you should consider implementing it as a subclass of
WindowDialog (refer to VehicleSalesDialog in the examples\dialogs
subdirectory).  By implementing it as a subclass of WindowDialog, you
get all the default behaviors of dialog boxes including the use of
"tab" keys to navigate between controls and the use of the "Enter" key to
push the default button.

5.  To disable the "Control C" (Control Break) operation for your
standalone application, disable the appropriate code in
NotificationManager>>translateAccelerator: method.

6.  To interface to SQL Server, API calls must use the C calling
convention and be referenced by numbers.

7.  Compressing the change log will not preserve the record of the
changes to class definitions, changes to global variable, changes to
pool dictionary or deletion of methods. So, keep good separate records
of changes that you have made to the base classes.

8.  Unused file handles can be cleaned up by executing the following 
expression.

    FileHandle cleanHandles.

    File handles are a limited system resource and should be closed
    whenever they are not used.  File handles can be closed by the
    following expression.

    YourFileHandle close.


9. To find methods that reference a class, evaluate the following
expression.

    Smalltalk sendersOf: (
        Smalltalk associationAt: #AClassName)

    To find all instances of a class, inspect the following
    expression.

    AClassName allInstances.

    To get rid of all instances of a class, evaluate the following
    expression.

    AClassName allInstances do:[: i |
        i become: String new].

    To find all references to an object, evaluate the following
    expression.

    anObject allReferences.

    To remove a global variable, evaluate the following expression.

    Smalltalk removeKey:#AGlobalVariable.

10.  There is no arbitrary limit to the number of object pointers allowed
in the system.  The only limiting factors are your machine's memory plus
the swap space.

11.  You should avoid using private methods.  Private methods are
used in implementation of the public methods and are not guaranteed
to be compatible across platforms or versions.

12.  Implementation of WinAddress has been changed so that accesses use
an offset starting at 1 instead of 0.   This was done to be compatible with
Smalltalk Express PM's implementation of PMAddress.   Any code that directly
accesses a memory location at a WinAddress (using WinAddress>at:, for
example) needs to be changed so that the offsets it uses are decreased by one.

13.  To be compatible with VPM, only ListBox and EditFields are now
Window subclassed.  If you have previously subclassed other MS Windows
controls, you must send the receiveAllWindowsMessages message during the
creation of a control.

14.  #loosingFocus event in SubPane>>supportedEvents has been changed
to #losingFocus event.

15.  You should exit Smalltalk before recompiling a resource-only DLL containing
Icons used by Smalltalk.

16.  GroupPane's implementation has been changed to allow the mouse events to
go through it to the other SubPanes on top of it.  This might cause problems for
some subclass of GroupPane that depends on mouse events.  If this is the case,
just reimplement the wmNchittest: wParam with: lParam method in the GroupPane
subclasses to return nil.

17.  You should always develop using the debug version of Windows.
For information on tracing Smalltalk Express' stack after a break or
a crash using Microsoft's CodeView, look at the "stack.txt" file in the "docs"
subdirectory.

18.  NLS/DBCS (especially DBCS) can cause some performance 
degradations so it should be filed in only if you are planning to use these
features.  Alternatively, you can file in only NLS by modifying the NLS/DBCS
install script ("nlsdbcs.st").

19.  If your application allows command line arguments, you can read them in
Smalltalk.  The #getCommandLine method in class SystemDictionary answers
the contents of the command line.

20.  In Smalltalk Express, we no long set the WS_CLIPCHILDREN flag
in ApplicationWindow>>defaultFrameStyle method.  This was done to speed
up the creation of window.  However, we have noticed that this change has
created some compatibility problem in certian ApplicationWindow that contains 
GraphPane.  This problem can be fixed by setting the style bit with the
WS_CLIPCHILDREN flag in the "open" method of the window that is causing
the problem.  You can look at GraphPane>>openWindow:extent:
method for example.

21.  On the Chinese version of Windows 3.0 we have come across some
problems with starting up standalone applications due to the way in
which the application executable file is opened by the Chinese version of 
Windows 3.0.  It seems that this version of Windows opens the executable
file with OpenShareCompat flag.  Other version of Windows that we have
tested doesn't not seem to use this flag for opening executables.
The workaround is the following:
    SystemDictionary>>signonDLL
        Replace the line:
            aFile := File pathName: self imageName.
        With:
            aFile := File pathName: self imageName
                attribute: FileNormal
                mode: (OpenAccessReadwrite  | OpenShareCompat).

22.  A late bug was discovered with associating help panels with
controls inside a subclass of DialogBox.  If your application needs
to do this, look at the "Errata" section at the end of the "helpmgr.txt"
file in the "docs" subdirectory for two methods which need to be
filed in.



VI.   APPLICATION DELIVERY vs DEVELOPMENT

Smalltalk Express is designed to allow application delivery to be as
easy as possible.  The image of objects is split across several files:
VWBAS20.DLL (the objects of the base classes, which include executable
code objects as well as data objects), VWDEV20.DLL (the objects of the
development classes) and V.EXE (your application-specific objects).

When you do Smalltalk program development, you have access to the
Smalltalk compiler, the class hierarchy browser, the class browser, the
disk browser and the debugger.  You start a development session by
running vw.exe, which gives you access to both the development and base
classes' dynamic link libraries.  When you run vw.exe, there is an
optional argument which is the name of the executable file containing
the objects of your application - both code and data.  If the argument
is omitted, v.exe is used.

When you have an application which is run-only (that is, you want to use
the application on computer systems for which a Smalltalk Express
development license has not been paid), the application can access only
the base classes, not the development classes.  You start your
application by running V.EXE (or renaming V.EXE to whatever you wish to
call your application).  Running V.EXE gives you access to VWBAS20.DLL
but not VWDEV20.DLL.

If you develop a run-only application in Smalltalk Express, you can
distribute the following files with your application:

  V.EXE                      (which you may rename)
  VWABORT.DLL
  VWBAS20.DLL
  VWDLGS20.DLL
  VWFLOAT.DLL
  VWSIGNON.DLL     (the contents of which you may change)
  VWVM20.DLL
  VWICONS.DLL
  VWHELP.DLL
  COMMDLG.DLL      (If the target environment is Windows 3.0)  

You cannot distribute the files VW.EXE, VWDEV20.DLL, or VWSRC20.DLL.
Since VWDEV20.DLL contains the classes ClassHierarchyBrowser, Debugger,
Inspector, DiskBrowser, and Compiler, these classes (and their
subclasses) are not available in a distributable application.

If your application tries to access an object in the development dynamic
link library (or makes any other error that, in the development
environment, results in a walkback window), it will be advised of the
runtime error with a dialog box.  The SystemDictionary method
"isRunTime" can be used to test if the current session is for runtime
or development.

Note that the segments in the dynamic link libraries are partly read-
only and partly writable.  The read-only part is sharable.  You may
have multiple Smalltalk Express applications running concurrently and sharing
the read-only part of the class library.

Because the V.EXE file contains only the code and data belonging to your
application, you need not worry about trimming the system code from your
application.  For example, "puzzle15.cls", after being filed into
the base system and saved, results in a very small-sized V.EXE.



VII.   API CALLS USING PASCAL AND C CALLING CONVENTIONS

Appendix 2 of the Smalltalk Express Tutorial and Programming Handbook
describes how to make API calls that use the Pascal calling convention --
the convention used by Windows for interfacing to its dynamic link libraries
(even though the implementation is in C, the C compiler can support the Pascal
convention).  Since some libraries use the C convention (SQL Server,
for example), Smalltalk Express also supports the C calling convention.

The difference between the Pascal and C conventions is small.  Pascal
pushes arguments onto the stack left-to-right, whereas C pushes arguments
onto the stack right-to-left.  The conventions for popping arguments off
the stack after a call are different as well.  Refer to the relevant
language manuals for calling convention details.  The argument types
supported by Smalltalk Express are the same for both languages.

Smalltalk Express uses the keyword "api:" for the Pascal convention, and the
keyword "c:" for the C convention.

An example of the Pascal interface is as follows.

    someMethod: aBoolean arg2: anInteger arg3: aString
        <api: DLLENTRYNAME boolean long struct boolean>

The same example using the C interface is as follows

    someMethod: aBoolean arg2: anInteger arg3: aString
        <c: DLLENTRYNAME boolean long struct boolean>

Refer to Appendix 2 in the Smalltalk Express Tutorial and Programming
Handbook for a definition of the argument types supported.

For more information on creating Dynamic Link Libraries, please refer to
Microsoft Windows Software Development Kit's "Guide to Programming" or
to "Programming Windows" by Charles Petzold (both available from
Microsoft Press).



VIII.  STARTING UP A STANDALONE APPLICATION

To make the runtime version of your application start up with its
window open (instead of the Smalltalk Transcript), perform the
following steps:

A.  In NotificationManager, change the code in the #startUpApplication:
method so that it opens your application window (the default code in
#startUpApplication: is to open GraphicsDemo).  The startUpApplication:
method is executed when the runtime .EXE is started and is not executed
when the development (VW.EXE) system is started.

B.  In the open method of your application, send the following message
to self.

    when: #close perform: #close:

C.  Change the #close: method in your application (or add a close method
if there isn't one) as follows:

close: aPane
        "Private - Close the receiver."
    | answer |
    Smalltalk isRunTime
        ifTrue: [
            (MessageBox confirm: 'Are you sure you want to exit?')
                ifTrue: [self close. ^Smalltalk exit] ifFalse: [^self]]
        ifFalse: [^self close].

These steps ensure that Smalltalk Express exits when your application closes.
Be sure to save your image after making these changes.

For examples on creating a standalone application, refer to the
GraphicsDemo class and  the Puzzle15 class found in the
examples\puzzle15 subdirectory.



IX.   CHANGING STANDALONE APPLICATION ICON AND STARTUP SCREEN

To change your standalone application icon, use the icon editor
found in the examples\iconedit subdirectory.  For more information
on the icon editor, read iconedit.txt in the examples\iconedit sub-
directory.

By default, the Smalltalk sign-on screen is displayed by a DLL module called
"vwsignon.dll" when you run "v.exe".  Source for the default sign-on
DLL ("vwsignon.dll") is supplied in the examples\vwsignon subdirectory.  
You can use this as a template for your own sign-on DLL.  You should
ensure that the name of your sign-on DLL does not clash with that of 
some other application's sign-on DLL name.  You can change the name 
of  the sign-on DLL that Smalltalk brings up by sending the
"signonDLL: aString" message to Smalltalk (default sign-on DLL name 
is "vwsignon.dll").  When changing the sign-on DLL name, remember to
change the LIBRARY section in the ".def" file. 

The sign-on DLL should contain two functions:

     OpenSignOn (HANDLE hInstance, WORD wVersion)

and

     CloseSignOn (void)

When OpenSignOn is called, the current Smalltalk version number
and the instance handle are passed as parameters.  The high byte of
wVersion contains the major version number and the low byte contains
the minor version number.  You should bring up a dialog box.  When 
CloseSignOn is called, you should close the dialog box.



X.  CROSS-LANGUAGE DEBUGGING

If you write a DLL in another language such as C and call that DLL from
Smalltalk (see more about how to do this in Appendix 4 of the
Smalltalk Express Tutorial and Programming Handbook), here is how
to debug your DLL code.  This discussion assumes that you already have
your DLL and already know how to call it from Smalltalk.  For the examples
below, assume your DLL class is TestDLL, the DLL file name is TEST.DLL, 
and there is a procedure in the DLL called TESTPROC.

You must use CodeView (available with a Windows Developer's
Toolkit from Microsoft).  First, you must compile and link your code
with the appropriate debugging enabled (read the manuals for your
compiler and linker).

To set up your breakpoints using CodeView, perform the following steps:

a.  Put your DLL in a directory on your PATH, typically in
\windows\system.

b.  Use the Microsoft Windows Program Manager to edit the properties of
the Smalltalk Express icon.  Set the command execution line to be:

       cvw /L [dll directory]\test.dll vw

c.  Double-clicking on this icon will now bring up Smalltalk Express
under CodeView.  Type 'g' for Go (or press F5) to start Smalltalk Express.
Type Ctrl-Alt-SysRq to move to CodeView from Smalltalk Express.

d.  Use the File menu to bring up the "Open Source..." dialog box.
Select your source file and select the line(s) at which you want to set
breakpoints.



XI.  SAVING THE IMAGE

When you save the image, a dialog box pops up to ask for your
confirmation.  If you look carefully, you will notice a check box
labeled 'Make Backup' in this dialog box.  If this check box is checked,
then after you save the image, the previous image file is renamed with
an extension ".BAK"; it is not deleted or overwritten.  If the check box
is not checked, the old image file will be overwritten.

We recommend that you always keep backups of your image.


XII.    OTHER TOPICS

The "docs" subdirectory contains files describing other Smalltalk topics.

    apic.htm                -  examples of C API calls with C calling convention
    callback.htm         -  Callback documentation
    helpmgr.htm         -  HelpManager documentation
    icon.htm               -  Icon class documentation
    mdi.htm                -  MDI documentation
    nlsdbcs.htm         -  NLS/DBCS documentation
    objfiler.htm           -  ObjectFiler documentation
    property.htm        -  Window property documentation
    remstruc.htm        -  Remote WinStructure documentation
    selfdef.htm           -  SelfDefinedStructure documentation
    stack.htm             -  Tips on debugging Smalltalk with CodeView
    statuspn.htm        -  StatusPane documentation
    toolpane.htm        -  ToolPane documentation
    userint.htm           -  UserInterrupts documentation



XIII.    KNOWN PROBLEMS

This version of Smalltalk Express will not run correctly with more 
than 256 colors. Please set your video driver to 256 color mode.

We are aware of a rare problem where Microsoft Windows 3.0 can display a
message box reporting 'Insufficient Memory' when trying to run an
application, after exiting Smalltalk.  If this occurs, continue to try to load 
the application; it will eventually load.

We are aware of a rare problem of Smalltalk Express crashing when 
saving the image while exiting Smalltalk Express.  This does not occur 
if the image is saved using the 'Save Image...' menu item in the 'File' menu.
We recommend that you avoid saving the image while exiting.



Copyright 1992-1996                                   ParcPlace-Digitalk, Inc.


