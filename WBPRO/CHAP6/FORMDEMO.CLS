
ViewManager subclass: #FormDemo
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''    !


!FormDemo class methods ! !



!FormDemo methods !
   
cancel
   self close.!
 
demo1
| temp |
temp := FormPane new
   owner: self.
self label: 'Form Demonstration';
   addSubpane:
   (temp).
   temp
   openWithLabels:
   #('Name:' 'Address:' 'City:' 'State:' 'Zip:' 'Phone #: ')
   withValues:
   #('Michael Angelo' '123 Main Street' 'Anytown' 'CA' '12345' '9009764257')
   formatted:
    #('acceptAlpha' 'contents' 'acceptAlpha' 'acceptAlpha' 'acceptInteger' 'acceptPhoneNumber').
   self openWindow.!
   
demo2
| temp |
temp := FormPane new
   owner: self.
self label: 'Form Demonstration';
   addSubpane:
   (temp).
   temp
   openWithLabels:
   #('Name:' 'Address:' 'City:' 'State:' 'Zip:' 'Phone #: ')
   withValues:
   #('Michael Angelo' '123 Main Street' 'Anytown' 'CA' '12345' '9009764257')
   formatted:
    #('acceptAlpha' 'contents' 'acceptAlpha' 'acceptAlpha' 'acceptInteger' 'acceptPhoneNumber').
   temp
   addButton:
      (Button new
      owner: self;
      contents: 'Value Font ...';
      when: #clicked perform: #valueFont:;
      framingBlock: [:box | (box leftBottom rightAndUp: 280 @ (ButtonFont height + 8))
    extent:(( ButtonFont stringWidth: 'Value Font ...') @ (ButtonFont height) + 8) ]);
   addButton:
      (Button new
      owner: self;
      contents: 'Label Font ...';
      when: #clicked perform: #labelFont:;
      framingBlock: [:box | (box leftBottom rightAndUp: 0 @ (ButtonFont height + 8))
        extent: (( ButtonFont stringWidth: 'Label Font ...') @ (ButtonFont height) + 8) ]).
    self openWindow.!

labelFont: aButton
    aButton parent parent setLabelFont:
    (Font chooseAFont: 'Choose a new Label Font')!
 
valueFont: aButton
    aButton parent parent setValueFont:
        (Font chooseAFont: 'Choose a new Field Font')! !
