
Object subclass: #AppointmentBook
  instanceVariableNames: 
    'appointments currentDate pane staticPane '
  classVariableNames: ''
  poolDictionaries: 
    'ColorConstants '  !


!AppointmentBook class methods !
 
new
   "Create a new appointment book"
   ^super new initialize.! !



!AppointmentBook methods !
 
displayHolidayDescription: aString
   "displays a holiday description"

   staticPane foreColor: ClrRed.
   staticPane contents: aString!
   
getAppointments
   "answer a collection of appointment dates."

   ^appointments keys.!
  
getCurrentDaySchedule
      "uses currentDate as key to appointments and answers schedule
      or a new String  if no schedule exists"
   ^appointments at: currentDate ifAbsent:[^String new].!

initialize
   "initialize a new appointment book by getting Appointments
   Dictionary"
   Appointments isNil ifTrue: [Appointments := Dictionary new].
   appointments := Appointments.!
   
pane: aPane staticPane: anotherPane
   "set my pane to aPane"

   pane := aPane.
   staticPane := anotherPane.!
 
save
   "Save schedule to appointments dictionary"
   pane modified
      ifTrue: [appointments at: currentDate put: pane contents.
   ].!
  
updateTextFor: aDate
   "update the text with the appropriate schedule"
   | mySchedule |
   currentDate := aDate.
   mySchedule :=  self getCurrentDaySchedule.
   pane contents: mySchedule.! !
