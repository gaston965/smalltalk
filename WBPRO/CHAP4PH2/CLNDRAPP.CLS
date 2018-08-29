
ViewManager subclass: #CalendarApp
  instanceVariableNames: 
    'calendarPane calendar calendarView appointmentView appointmentPane appointment '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants ColorConstants '  !


!CalendarApp class methods ! !



!CalendarApp methods !
 
activate
      "Show special Days including appointments. show appointments first so
        others will override."

      calendar showAppointments: appointment getAppointments.
      calendar update!
  
activate: aPane
   "Synchronize the panes."
   views do: [:v |
   (( v isKindOf: TopPane) and: [(v == aPane) not])
   ifTrue:[ v showWindowAtTop]].
   self activate.!
 
appointmentMenu
   "Private - Answer an initialized menu for the application."
   |  menu |

   menu := (Menu
   labels: '&Save\S&how Schedule' withCrs
   lines: #(1)
   selectors: #(saveAppointment showSchedule))
   title: '&Appointments';
   owner: self;
   yourself.

   ^menu!

button1DoubleClick: aPoint

      "Private - The user double clicked at aPoint."
   | newDate |
      newDate := calendarPane selectedItem.
      calendar selectedDate: newDate.
      self updateViews: #all.!
  
calendarMenu
      "Private - Answer an initialized menu for the application."
   | menu |
   menu := (Menu
      labels: '&Go To Today\Go To Month and Year\&Show Special Days \&Refresh\&Enter a Holiday' withCrs
      lines: #(2)
      selectors: #(today gotoMonthYear activate displayCalendar enterHoliday))
       title: '&Calendar';
       owner: self;
       yourself.
        menu insertSubMenu: self lookMenu after: 0.
        ^menu.!
 
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
   
changeMenuBarForAppointmentView: aTopPane
   "Remove the file and Smalltalk menus
    for the appointment window"

   aTopPane menuWindow
   removeMenu:
   (aTopPane menuWindow menuTitled: '~File');
   removeMenu:
   (aTopPane menuWindow menuTitled: '~Smalltalk').!
   
close: aPane
        "Private - Close the receiver."


   super close!
  
displayAppointments
   "Used by getContents handler for appointmentPane"
   appointment notNil
   ifTrue:[
   appointment updateTextFor: calendar date;
     displayHolidayDescription: calendar isHoliday.
   appointmentView labelWithoutPrefix: calendar weekdayMonthDayYearString].!
  
displayAppointments: aPane
   "getContents handler for appointmentPane"
   self displayAppointments.!
 
displayCalendar
        "getContents event handler, calls calendar display"
     calendar isNil
        ifFalse: [
            self labelWithoutPrefix: (calendar monthYearString).
            calendar display].!

displayCalendar: aPane
    "getContents event handler, calls calendar display"

    self displayCalendar.!
   
displayHighlights: aPane
   calendar notNil ifTrue:[self activate].!
   
enterHoliday
   "Menu handler; prompts for string, adds result to holiday
   dictionary"
   | answer answerDescription date |
   answer := Prompter prompt:
   'Enter the date of the holiday to add' default: '1/1/93'.
   answer isNil ifTrue: [^nil].
   answerDescription :=  Prompter prompt:
    'Enter the description for this holiday' default: 'New Year'.
   answerDescription isNil ifTrue:[^nil].
   Calendar addHolidayFromString: answer named: answerDescription.
   self updateViews: #all. "Show added holiday"!
   
gotoMonthYear
        "Menu Handler, prompts for string then displays
         calendar with the correct month and year"
    | answer date |
    answer := Prompter prompt: 'Enter a Date or the Month and Year' default: ''.
        date := calendar makeNewDateFromString: answer.
        date isNil
            ifFalse: [
              self updateViews: #all].!
 
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
    self updateViews: #all.!
  
monthAhead: aPane
    "button Method to increment calendar month"

    self monthAhead.!
 
monthBack
    "Menu Method to decrement calendar month"

    calendar decrementMonth.
    self displayCalendar.
    self updateViews: #all.!
   
monthBack: aPane
    "Button Method to dcrement calendar month"

    self monthBack.!

open
      "open a Calendar app"
   self
      addView: (calendarView :=
      TopPane new
      label: 'Calendar';
      owner: self;
      when: #close perform: #close:;
      when: #menuBuilt perform: #changeMenuBar:;
      when: #activate perform: #activate:;
      framingRatio: (1/8 @ 0 extentFromLeftTop: 7 @ 8/20)).
      "try 6 @ 6/20 for 800x600 and 4.5 @ 5/20 for 1024x768"
      calendarView
         addSubpane:
            (calendarPane := NewTextPane new
               owner:self;
               when: #getContents perform: #displayCalendar:;
               when: #display perform: #displayHighlights:;
               when: #button1DoubleClick perform: #button1DoubleClick:;
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
       self
   addView: ( appointmentView :=
      TopPane new
      label: 'Appointments';
      owner: self;
      when: #close perform: #close:;
      when: #menuBuilt perform: #changeMenuBarForAppointmentView:;
      when: #activate perform: #activate:;
      framingRatio: (1/2 @ 0 extentFromLeftTop: 1/2 @ 1)).

   appointmentView
      addSubpane: (appointmentPane :=
         NewTextPane new
         owner: self;
         when: #getContents perform: #displayAppointments:;
         framingRatio: (0 @ 1/32 extentFromLeftTop: 1 @ 1));
      addSubpane: (
         StaticText new
         centered;
         setName: 'holiday';
         contents: '';
         framingRatio: (0 @ 0 extentFromLeftTop: 32 @ 1/32)).


    self openWindow.
    appointmentView menuWindow addMenu: self calendarMenu.
    appointmentView menuWindow addMenu: self appointmentMenu.
    self setUp.
    self updateViews: #all.!
  
saveAppointment
   "save the current appointment"
   appointment save.!
   
setUp
    "setup the application"
    calendar := Calendar new pane: calendarPane.
    appointment := AppointmentBook new pane: appointmentPane
        staticPane: (self paneAt: 'holiday').!
  
showSchedule
   "Menu handler, uses current date to display schedule"
   calendar makeNewDate.
   self updateViews: #all.!
   
today
    "button and Menu method to chnage to Today's calendar"

    calendar today.
    self displayCalendar.
    self updateViews: #all.!
   
today: aPane
    "button method to change to Today's calendar"

    self today.!
 
updateViews: aSymbol
   "central update method, aSymbol defines group of updates to use."
   aSymbol = #calendar
   ifTrue:[ self
      changed: #displayCalendar:;
      activate.
   ].
   aSymbol = #all
   ifTrue: [
   appointment save.
   self
      changed: #displayCalendar:;
         activate;
   changed: #displayAppointments:.
         ].!

yearAhead
    "Menu Method to increment calendar year"

    calendar incrementYear.
    self displayCalendar.
    self updateViews: #all.!
 
yearAhead: aPane
    "Button Method to increment calendar year"

    self yearAhead.!

yearBack
    "Menu Method to decrement calendar year"

    calendar decrementYear.
    self displayCalendar.
    self updateViews: #all.!
  
yearBack: aPane
    "Button Method to decrement calendar year"

    self yearBack.! !
