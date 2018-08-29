
ViewManager subclass: #CalendarApp
  instanceVariableNames: 
    'calendarPane calendar '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants '    !


!CalendarApp class methods ! !



!CalendarApp methods !
 
activate
    "Show special Days and Change Labels"

     calendar update.!
   
activate: aPane
    "activate event handler"

    self activate.!

calendarMenu: aPane
    "Private - Answer an initialized menu for the application."
    | menu |
    menu := (Menu
    labels: '&Go To Today\Go To Month and Year\&Show Special Days\&Refresh' withCrs
    lines: #(2)
    selectors: #( today gotoMonthYear activate displayCalendar ))
        title: '&Calendar';
        owner: self;
    yourself.
    menu insertSubMenu: self lookMenu after: 0.
    aPane setMenu: menu.!

changeMenuBar: aTopPane
    "Remove the file edit and Smalltalk menus"

    aTopPane menuWindow
    removeMenu:
    (aTopPane menuWindow menuTitled: '~File');
    removeMenu:
    (aTopPane menuWindow menuTitled: '~Edit');
    removeMenu:
    (aTopPane menuWindow menuTitled: '~Smalltalk');
    removeMenu:
    (aTopPane menuWindow menuTitled: '~Tools').!
   
close: aPane
        "Private - Close the receiver."


   super close!
  
displayCalendar
        "getContents event handler, calls calendar display"
     calendar isNil
        ifFalse: [
            self labelWithoutPrefix: (calendar monthYearString).
            calendar display].!

displayCalendar: aPane
    "getContents event handler, calls calendar display"

    self displayCalendar.!
   
gotoMonthYear
        "Menu Handler, prompts for string then displays
         calendar with the correct month and year"
    | answer date |
    answer := Prompter prompt: 'Enter a Date or the Month and Year' default: ''.
        date := calendar makeNewDateFromString: answer.
        date isNil
            ifFalse: [
              self update].!

lookMenu
    "Private - Answer an initialized menu for the application."

    ^ (Menu
    labels: '&Month Ahead\&Year Ahead\Month &Back\Year Back'
    withCrs
    lines: #(2)
    selectors: #( monthAhead yearAhead monthBack yearBack))
        title: '&Look';
        owner: self;
    yourself.!

monthAhead
    "Menu Method to increment calendar month"

    calendar incrementMonth.
    self displayCalendar.
    self update.!
 
monthAhead: aPane
    "button Method to increment calendar month"

    self monthAhead.!
 
monthBack
    "Menu Method to decrement calendar month"

    calendar decrementMonth.
    self displayCalendar.
    self update.!
  
monthBack: aPane
    "Button Method to dcrement calendar month"

    self monthBack.!

open
    "open a Calendar app"
    self
    label: 'Calendar';
    owner: self;
    when: #close perform: #close:;
    when: #menuBuilt perform: #changeMenuBar:;
    when: #activate perform: #activate:.
    self mainView framingRatio: ( 1/8 @ 0 extentFromLeftTop: 7 @ 8/20);
          "try 6 @ 6/20 800x600  4.5 @ 5/20 1024x768"
    addSubpane:
    (calendarPane := TextPane new
        owner:self;
        when: #getContents perform: #displayCalendar:;
        when: #getMenu perform: #calendarMenu: ;
        framingRatio: (0 @ 5/32 extentFromLeftTop: 1@ 1));
    addSubpane:
    (Button new
        owner: self;
        contents: '<' ;
        when: #clicked perform: #monthAhead:;
        framingRatio: (0 @ 0 extentFromLeftTop: 4 @ 5/32));
    addSubpane:
    (Button new
    owner: self;
        contents: '<<' ;
        when: #clicked perform: #yearAhead:;
        framingRatio: (4/32 @ 0 extentFromLeftTop: 4 @ 5/32));
    addSubpane:
    (Button new
        owner: self;
        contents: 'Today' ;
        when: #clicked perform: #today:;
        framingRatio: (11/32 @ 0 extentFromLeftTop: 8 @ 5/32));
    addSubpane:
    (Button new
        owner: self;
        contents: '>' ;
        when: #clicked perform: #monthBack:;
        framingRatio: (26/32 @ 0 extentFromLeftTop: 4 @ 5/32));
    addSubpane:
    (Button new
    owner: self;
    contents: '>>' ;
    when: #clicked perform: #yearBack:;
    framingRatio: (22/32 @ 0 extentFromLeftTop: 4 @ 5/32)).
    self openWindow.
    self setUp.
    self update.!
 
setUp
    "setup the application"
    calendar := Calendar new pane: calendarPane.!
   
today
    "button and Menu method to chnage to Today's calendar"

    calendar today.
    self displayCalendar.
    self update.!
  
today: aPane
    "button method to change to Today's calendar"

    self today.!
 
update
        "update the calendar pane"
    | temporaries |
    self changed: #displayCalendar:;
           activate.!

yearAhead
    "Menu Method to increment calendar year"

    calendar incrementYear.
    self displayCalendar.
    self update.!

yearAhead: aPane
    "Button Method to increment calendar year"

    self yearAhead.!

yearBack
    "Menu Method to decrement calendar year"

    calendar decrementYear.
    self displayCalendar.
    self update.!
 
yearBack: aPane
    "Button Method to decrement calendar year"

    self yearBack.! !
