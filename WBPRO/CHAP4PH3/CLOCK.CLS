
Object subclass: #Clock
  instanceVariableNames: 
    'owner handlers sem currentSecond currentMinute currentHour currentDay isRunning '
  classVariableNames: ''
  poolDictionaries: ''  !


!Clock class methods !
   
new
  "Return a new, initialized timer"
  ^super new initialize.!
 
supportedEvents
  "Private - Answer the Set of events that Timers can notify
  their owners about."
  ^Set new
  add: #second;
  add: #minute;
  add: #hour;
  add: #day;
  yourself.!
  
supportsEvent: anEvent
  "Private - Answer true if the receiver supports anEvent."
  ^self supportedEvents includes: anEvent.! !



!Clock methods !
  
contents
  "Answers currentSecond as an instance of Time"
  ^Time fromSeconds: currentSecond.!

dayGear
  "Test day, if hour has passed then update currentDay
  send event"

  (Date today day > currentDay)
  ifTrue:[ currentDay := Date today day.

  self event: #day.
  ].!
   
driveGear
  "Private - answer the block of code that runs the main drive gear of the clock.
  The block checks the system time, and when one second has passed,
  performs the #second event.  The clock can be stopped by changing the value
  of the isRunning boolean to false. When stopped the clock will send
  the event:#off. "

  ^[

  [self isRunning] whileTrue:  [

  ((Time totalSeconds  > currentSecond) or: [ Time totalSeconds = 0]) ifTrue:  [
  currentSecond := Time totalSeconds.
  self event: #second.
  currentSecond = 0 ifTrue: [self resetClock. sem wait].
  self minuteGear.
  ]
  ].
  self event: #off
  ].!
 
event: aSymbol
  "Private - Notify the receiver's owner of an event
  by performing the selector that the owner set for
  this event."
  | selector |
  selector := self handlers at: aSymbol ifAbsent: [^nil].
  selector isNil ifTrue: [^nil].
  selector class == String
  ifTrue: [^self perform: selector asSymbol].
  ^owner perform: selector with: self!
   
handlers
  "Get the value of handlers."
  ^handlers!
  
hourGear
  "Test hour, if minute has passed then update currentHour
  send event and dayGear."

  ((currentSecond // 60 // 60)  > currentHour)
  ifTrue:[ currentHour := currentSecond // 60 // 60.
  self event: #hour.
  self dayGear].!
   
initialize
  "Initialize my knowledge"

  handlers := IdentityDictionary new.
  isRunning := false.
  sem := Semaphore new.!
   
isRunning
  "Get the value of isRunning."

  ^isRunning!
 
isRunning: aBoolean
  "Private - Set the value of isRunning."

  isRunning := aBoolean!
  
minuteGear
  "Test minute, if minute has passed then update currentMinute
  send event and hourGear."

  ((currentSecond // 60 )  > currentMinute)
  ifTrue:[ currentMinute := currentSecond // 60.
  self event: #minute.
  self hourGear].!

owner
  "Get the value of owner."
  ^owner!
   
owner: anObject
  "Set the value of owner."
  ^owner := anObject!
 
resetClock
  "End of day reset counters to 0"

  currentMinute := -1.  "Need to be less then zero so everything fires"
  currentHour := -1.
  [Time totalSeconds = 0] whileTrue: [].  "Wait unitl a second has passed"
  sem signal. "Now let everyone go."!
  
sem
  ^sem!

start
  "Start me running, unless I am already running."

  self isRunning ifFalse: [
  isRunning := true.
  "start from a known state"
  currentSecond :=Time totalSeconds.
  currentHour := currentSecond // 60 // 60.
  currentMinute := currentSecond // 60.
  currentDay := Date today day.

  self driveGear forkAt: Processor lowUserPriority
  ].!
  
stop
  "Stop the clock immediately"
  isRunning := false.!

when: anEvent perform: aSelector

  "Notify the owner whenever anEvent occurs by
  performing aSelector.  aSelector takes one argument,
  the timer."

  (self class supportsEvent: anEvent)
  ifFalse: [^self error: 'Event not supported'].
  handlers at: anEvent put: aSelector.! !
