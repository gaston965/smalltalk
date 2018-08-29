Welcome to WindowBuilder/V Pro Windows 1.0.6!

This README file covers several topics not covered in the installation guide
or the manual, as well as information that was added after the manual was
created.  It includes information on:

  o Installing WindowBuilder Pro 1.0.6      
  o Hints for WindowBuilder Standard users      
  o Creating Runtime Applications      
  o Using WindowBuilder with MDI  
  o General Notes


INSTALLING WINDOWBUILDER    

NOTE: To install WindowBuilder Pro, MDI, and Subpanes, do them in the following order:  

    1) MDI
    2) WindowBuilder Pro
    3) Subpanes/V   

MDI is a feature of Smalltalk Express.  It is provided in a filein that comes
with the Smalltalk Express installation.  For more information on MDI, see the 
file mdi.txt in the DOCS subdirectory of the Smalltalk Express release directory.

To install WindowBuilder Pro (if not already installed):  

1)  Run SETUP.EXE. This will create a directory for you and 
    decompress all of the WindowBuilder Pro source files.
    This step is only necessary if you are installing WBPro 
    from a separate floppy disk. This has already been done for
    you if you are using Smalltalk Express.

2) Launch your Smalltalk Express image from within Windows (either by 
    adding a new icon to the Program Manager, executing the Run... 
    command from the Program Manager, or doubleclicking on the vw.exe 
    file in the File Manager). It is best to use a clean image if at all
    possible.

3) We strongly suggest that you install ObjectFiler before
   installing WindowBuilder Pro. It can be found in the \EXTRAS\OBJFILER
   directory. The Smalltalk Express IconEditor may also be used in 
   conjunction with WindowBuilder Pro. It can be found in \EXAMPLES\ICONEDIT.

4) Select Install... command from the File menu. In the resulting File 
    dialog,  select the file WBPRO.ST, and press the OK button.  
    WindowBuilder Pro will begin its installation.

    This process will take a few minutes.  

5) Install COMPEX.ST for several interesting CompositePane examples.
    Then enable the 'CompositePane Examples' Add-in in WindowBuilder

6) Optional: Install Subpanes using its own installation files.

7) Quit and save the image, then copy the files v.exe and change.log for future "clean
     WindowBuilder Pro image" use.


HINTS FOR WINDOWBUILDER STANDARD USERS

WindowBuilder Pro provides numerous enhancements over the standard version
of WindowBuilder. All of these are fully covered in the manual that
accompanies the product.

The only important item to be aware of when moving to WindowBuilder Pro
is that it generates #createViews methods by default rather that #open
methods. This changes affords you a great deal of flexibility than the
old approach. A #createViews method is exactly the same as the old #open
method with the "self openWindow" line removed from the bottom. We have
provided a standard #open method at the ViewManager level. You will
still open windows the same way you always have (e.g., XYZWindow new open).
In addition, we have also provided several other useful ViewManager
methods including #openWithParent:. Any window can be opened independently
(with the #open method) or as a child (using the #openWithParent: method).


CREATING RUNTIME APPLICATIONS

To create a runtime application, you should create an image that contains only
your classes and methods;  WindowBuilder Pro itself should not be in the image.

WindowBuilder Pro generated classes cannot be filed into a clean image without some
support;  there are a few classes and methods that need to be installed first before
adding any ViewManager subclasses you've created.  These classes and methods
are included in the file RUNTIME.ST from the WindowBuilder Pro installation directory.

WindowBuilder Pro code runs on both Windows and OS/2. If you purchase
WindowBuilder Pro for OS/2, you will be able to easily port your code to
that platform.


USING WINDOWBUILDER PRO WITH MDI

IMPORTANT: This section requires that you have an understanding of the MDI 
capabilities provided in Smalltalk Express.  Before reading it you should 
read the file mdi.txt in the Smalltalk docs directory.

Any window created with WindowBuilder Pro's default code generation (#createView) may
be opened as an MDI parent by sending it the #openAsMDIParent message. Any window
may be opened as an MDI child by sending it the #openWithMDIParent: message with a 
single argument, the MDI parent window. The following example will open a sample
window as an MDI parent and then open another copy of it as an MDI child of the first:

    | test |
    test := TestWindow new openAsMDIParent.
    TestWindow new openWithMDIParent: test.

If a window must always open as an MDI parent, create a #topPaneClass method for the
window that returns 'MDIFrame':

    topPaneClass
        ^MDIFrame

The WBToolBar class has been extended to provide an #mdiToolBar style. MDI toolbars are
locked to the top of the window. The MDI StatusPane control has also been completely
wrappered (they are locked to the bottom of the window). Multiple StatusBoxes may be 
easily created within the StatusPane.


GENERAL NOTES

Font Matching Problems

There is currently a problem in the way Smalltalk Express's font lookup
mechanism works.  You may notice that some fonts look fine in
WindowBuilder Pro, but not in the actual window.  This has been corrected
by writing out font descriptions in a non-portable (to V/OS2 or 
V/Win) way.  If this portability is important to you, you can make use 
of the less accurate code generation method.  In the Font class, there are 
two methods, #portableStoreOn:indentString: and #nonPortableStoreOn:
indentString:.  Currently, the #storeOn:indentString: utilizes the
#nonPortableStoreOn:indentString method.  To use the more portable code
generation, change the #storeOn:indentString: method to use the 
#portableStoreOn:indentString: method.
                         
                    
Multiple Screen Resolution Development & WindowBuilder Pro Bitmaps

If you are using more than one screen resolution for your development,
you should install WindowBuilder Pro while in the highest resolution
you will be using.   If you do not do this, you may experience erratic
coloring within the bitmaps used in WindowBuilder Pro.

                                          
Initial Tab Order

When creating windows, there is no initial tab order.
You must use the tabbing/grouping editor to create a tabbing order for
tabbing between components to work.           


Closing Unwanted Dialogs

At times, you may create a dialog that has no closebox, and in the process of testing it within WindowBuilder Pro,
find that there is no way to remove either the dialog or WindowBuilder Pro.  If this ever happens, you can access
your window as follows:

  MyDialogClassName allInstances do: [ :i | i close ].   

The dialog will close, and you should find that WindowBuilder Pro is now reenabled.      



For more info about Smalltalk Express or WindowBuilder Pro, contact:

    ObjectShare, a division of ParcPlace-Digitalk
    3160 De La Cruz Blvd, Suite 205
    Santa Clara, CA 95054-2408
    (408) 970-7280 Phone
    (408) 970-7282 Fax
    http://www.objectshare.com
