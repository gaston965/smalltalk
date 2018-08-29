
ViewManager subclass: #IncomeTax
  instanceVariableNames: 
    'labelDialog filingDialog incomeDialog currentDialog '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants '  !


!IncomeTax class methods ! !



!IncomeTax methods !
 
activate: aPane
        "Private - Activate the dialog box so that it may set focus
        to a child control."
    UserLibrary setFocus: currentDialog handle!
 
cancel: aButton
        "Private - Ok button pushed, close the window."
    self mainView close!
  
filingDialog
        "Private - open filing Dialog."
    self hideCurrentDialog.
    filingDialog notNil ifTrue:[
        filingDialog mainView showWindow.
        currentDialog := filingDialog.]
    ifFalse:[
        currentDialog := filingDialog := TaxFilingDialog new open: self].

    "Activate the dialog box so that it may set focus
        to a child control."
    UserLibrary setFocus: currentDialog handle!
  
hideCurrentDialog
        "Private - hide current dialog."

    currentDialog notNil ifTrue:[
        currentDialog mainView hideWindow]!
   
incomeDialog
        "Private - open income Dialog."
    self hideCurrentDialog.
    incomeDialog notNil ifTrue:[
        incomeDialog mainView showWindow.
        currentDialog := incomeDialog.]
    ifFalse:[
        currentDialog := incomeDialog := TaxIncomeDialog new open: self].

    "Activate the dialog box so that it may set focus
        to a child control."
    UserLibrary setFocus: currentDialog handle!
  
initWindowSize
        "Private - Answer the window size."
    ^600 @ 380!

labelDialog
        "Private - open label Dialog."
    self hideCurrentDialog.
    labelDialog notNil ifTrue:[
        labelDialog mainView showWindow.
        currentDialog := labelDialog.]
    ifFalse:[
        currentDialog := labelDialog := TaxLabelDialog new open: self].

    "Activate the dialog box so that it may set focus
        to a child control."
    UserLibrary setFocus: currentDialog handle!
 
next: aButton
        "Private - User has pushed next button."
    |aDialogClass|
    aDialogClass := currentDialog class.
    aDialogClass = TaxLabelDialog ifTrue:[
        ^self filingDialog].
    aDialogClass = TaxFilingDialog ifTrue:[
        ^self incomeDialog].
    aDialogClass = TaxIncomeDialog ifTrue:[
        ^nil].!

ok: aButton
        "Private - Ok button pushed, close the window."

    self mainView close!

open
        "Open a dialog box telling about Smalltalk/V."
    | lineHeight charWidth charHeight |

    self openLabel: 'Income Tax Return'.!
  
openLabel: label
        "Open a dialog box telling about Smalltalk/V."
    | dialogBox lineHeight charWidth charHeight groupBox|

    self
        labelWithoutPrefix: label;
        when: #activate perform: #activate:.

    lineHeight := WindowDialog entryHeight.
    charHeight := WindowDialog charHeight.
    charWidth := WindowDialog charWidth.

    self openWindow.
    self menuWindow addMenu: self sectionMenu.

    self labelDialog.!

prev: aButton
        "Private - User has pushed prev button."
    |aDialogClass|

    aDialogClass := currentDialog class.
    aDialogClass = TaxLabelDialog ifTrue:[
        ^nil].
    aDialogClass = TaxFilingDialog ifTrue:[
        ^self labelDialog].
    aDialogClass = TaxIncomeDialog ifTrue:[
        ^self filingDialog].!
   
sectionMenu
        "Private - Answer the section menu."
    ^(Menu
         labels: 'Label\Filing Status\Income' withCrs
         lines: #()
         selectors: #(labelDialog filingDialog incomeDialog))
             title: '&Section';
             owner: self;
             yourself! !
