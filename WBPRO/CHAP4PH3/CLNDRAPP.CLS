
ViewManager subclass: #CalendarApp
  instanceVariableNames: 
    'calendarPane calendar calendarView appointmentView appointmentPane appointment clock clockView alarms '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants ColorConstants '   !


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
 
addAlarm
  "Menu Handler - adds an alarm to the alarms dictionary"
  | time string |
  time := Prompter prompt: 'Enter time for alarm' default:''.
  time isNil ifTrue:[ ^nil].
  time := self parseTimeString: time.
  string := Prompter prompt: 'Enter Description for the Alarm' default:''.
  string isNil ifTrue:[ ^nil].
  alarms at: time put: string.!
 
addDailyAlarm
  "Menu Handler - adds a dialy alarm to the alarms dictionary and AlarmsDaily"
  | time string |
  time := Prompter prompt: 'Enter the time for the Alarm:' default:''.
  time isNil ifTrue:[ ^nil].
  time := self parseTimeString: time.
  string := Prompter prompt: 'Enter the Description for the Alarm:' default:''.
  string isNil ifTrue:[ ^nil].
  alarms at: time put: string.
  AlarmsDaily at: time put: string.!

addDateAlarm
  "Menu Handler - Requests time and description for an alarm. Adds alarm to
  alarms if date is today or to AlarmsDate otherwise."
  | time string collection day bag|
  time := Prompter prompt: 'Enter the time for the Alarm:' default:''.
  time isNil ifTrue:[ ^nil].
  time := self parseTimeString: time.
  string := Prompter prompt: 'Enter the Description for the Alarm:' default:''.
  string isNil ifTrue:[ ^nil].
  day := calendar date.
  day = calendar today
  ifTrue:[ alarms at: time put: string]  "Is today so store in alarms list"
  "Not today, so get the day bag and stuff time and description into it"
  ifFalse: [bag := AlarmsDate at: day ifAbsent: [ bag := Bag new].
  collection := OrderedCollection new.
  collection addLast: time.
  collection addLast: string.
  bag add: collection.
  AlarmsDate at: day put: bag ].!
 
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
   
checkAlarms
  "comment"
  | now |
  now := Time now .
  alarms keysDo: [:aTime |
  now minutes = aTime minutes
  ifTrue:[
  now hours = aTime hours
  ifTrue: [ self displayAlarm: (alarms at: aTime).
  alarms removeKey: aTime.]]].!
 
checkAlarms: aClock
  self checkAlarms.!
   
clockMenu
  "Private - Answer an initialized menu for the application."
  | submenu menu |
  submenu := (Menu
  labels: '&Daily\&For Current Date' withCrs
  lines: #()
  selectors: #( addDailyAlarm addDateAlarm))
  title: 'Add an Alarm';
  owner: self;
  yourself.

  menu := (Menu
  labels: '&Off\O&n\&Add an Alarm' withCrs
  lines: #(3)
  selectors: #( clockOff clockOn))
  title: '&Clock';
  owner: self;
  yourself.
  menu appendSubMenu: submenu.
  ^menu!
  
clockOff
  "Stop clock object and hideWindow"
  clock stop.
  clockView hideWindow.!
 
clockOn
  "Menu handler start clock and showWindow"
  clock start.
  clockView showWindow.!
  
close: aPane
  "Private - Close the receiver."
  clock stop.  "Stop clock object"
  ^super close!

createAlarmsList
  "Merges alarms from AlarmDaily and AlarmDate into alarms. Creates
  the globals if they are nil."
  | today alarm dayBag time description |
  AlarmsDaily isNil ifTrue:[ AlarmsDaily := Dictionary new].
  AlarmsDate isNil ifTrue:[ AlarmsDate := Dictionary new].

  today := calendar today.
  dayBag := AlarmsDate at: today ifAbsent: [dayBag := nil].
  dayBag notNil ifTrue:[
  dayBag do: [:alarm |
  alarms at: alarm removeFirst put: alarm removeFirst.
  AlarmsDate removeKey: today]].
  "Next add all dialy alarms"
  AlarmsDaily keysDo: [: alarm | alarms at: alarm put: (AlarmsDaily at: alarm)].
  ^alarms.!

daysEnd: aClock
  "#day event handler. End of day, change date, update alarms list"
  self today.
  self createAlarmsList.!
  
displayAlarm: aString
  Terminal bell.
  Terminal bell.
  MessageBox notify: 'Alarm  ' withText: aString,'!!!!'.!

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
 
hourlyChime: aClock
  "Clock Event Handler - chime every hour"
  Terminal bell.!
  
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

    self
    addView: (clockView :=
        TopPane new
        label: 'Clock';
        owner: self;
        when: #close perform: #close:;
        when: #menuBuilt perform: #changeMenuBar:;
        when: #activate perform: #activate:;
        framingRatio: (4  @ 12/27 extentFromLeftTop: 6/20 @ (0))).

    clock := Clock new
        owner: self;
        when: #second perform: #updateClock:;
        when: #minute perform: #checkAlarms:;
        when: #hour perform: #hourlyChime:;
        when: #day  perform: #daysEnd:;
        start.

    self openWindow.
    appointmentView menuWindow addMenu: self calendarMenu.
    appointmentView menuWindow addMenu: self appointmentMenu.
    appointmentView menuWindow addMenu: self clockMenu.
    self setUp.
    self updateViews: #all.!
 
parseTimeString: aString
  "Answer an instance of Time from aString.
  aString can contain 1 to 3 digits separated by $:"
  | aStream answer time  index |
  answer := OrderedCollection new.
  aStream := ReadStream on: aString.
  [aStream atEnd]
  whileFalse: [
  [aStream atEnd ifTrue: [^answer asArray].
  aStream peek ~= $:]  "look for $: "
  whileFalse: [aStream next].
  index := aStream position + 1.
  [aStream atEnd or: [aStream peek = $: ]]
  whileFalse: [aStream next].

  answer add:
  (aString copyFrom: index to: aStream position)].  "copy string fragment"
  time := 0.
  time := (answer at: 1) asInteger * 3600.  "Add it all up, Hour"
  answer size > 1 ifTrue: [
  time := ((answer at: 2) asInteger * 60) + time].  "Minute"
  answer size > 2 ifTrue:[
  time := (answer at: 3) asInteger + time].  "Second"
  ^Time fromSeconds: time.!

saveAppointment
   "save the current appointment"
   appointment save.!
   
setUp
    "setup the application"
    calendar := Calendar new pane: calendarPane.
    appointment := AppointmentBook new pane: appointmentPane
        staticPane: (self paneAt: 'holiday').
     alarms := Dictionary new.
       self createAlarmsList.!
   
showSchedule
   "Menu handler, uses current date to display schedule"
   calendar makeNewDate.
   self updateViews: #all.!
   
today
    "button and Menu method to change to Today's calendar"

    calendar today.
    self displayCalendar.
    self updateViews: #all.!
   
today: aPane
    "button method to change to Today's calendar"

    self today.!
 
updateClock:  aClock
  "Clock event handler - update the clock when we recv #second event"
  | displayTime |

  displayTime :=  aClock contents.
  clockView labelWithoutPrefix: displayTime printString.!
 
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
