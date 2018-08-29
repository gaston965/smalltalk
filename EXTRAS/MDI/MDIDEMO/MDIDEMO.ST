"This file files in some MDI examples.
To install the examples, do the following:

        (File pathName: 'extras\mdi\mdidemo\mdidemo.st') fileIn; close

To start the examples, do

MDIDemo new open.
SysEdit new open

"



Smalltalk at: #HelpSysEdit put: ((Dictionary new)
add: (Association key: ('toggleStatusPane') value: ('Toggles the StatusPane on/off'));
add: (Association key: ('Options') value: ('Hides, shows the StatusPane'));yourself).!

Smalltalk at: #HelpMDIDemo put: ((Dictionary new)
add: (Association key: ('doc2') value: ('Opens a yellow document'));
add: (Association key: ('View') value: ('Hides, shows the StatusPane, the ToolPane'));
add: (Association key: ('toggleStatusPane') value: ('Toggles the StatusPane on/off'));
add: (Association key: ('doc1') value: ('Opens a green document'));
add: (Association key: ('Demo') value: ('Opens the MDI documents'));
add: (Association key: ('toggleToolPane') value: ('Toggles the ToolPane on/off'));
add: (Association key: ('polygon') value: ('Opens the Polygon view example'));
add: (Association key: ('exit') value: ('Exit the MDI Demonstration'));yourself).!

(File pathName:'extras\mdi\mdidemo\mdidemo.cls') fileIn; close!
(File pathName:'extras\mdi\mdidemo\sysedit.cls') fileIn; close!
MDIDemo directory: 'extras\mdi\mdidemo\'!
MDIDemo buildMapDictionary!

