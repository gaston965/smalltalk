
Object subclass: #Calendar
  instanceVariableNames: 
    'today month monthName day year date pane '
  classVariableNames: 
    'Holidays '
  poolDictionaries: 
    'ColorConstants '  !


!Calendar class methods !

addHoliday: aDate named: aString
   "add a aDate to the Holidays Collection. Uses Date day format"
   | newDate |

   newDate := aDate.
   newDate := self modifyDate: newDate.
   ^(self holidays) at: aDate put:aString.!
   
addHolidayFromString: aDateString named: aString
   "add a aDateString and description to the Holidays dictionary.
   Uses Date fromString format"
   | newDate |

   newDate := Date fromString: aDateString.
   newDate := self modifyDate: newDate.
   ^(self holidays) at: newDate put: aString.!

holidays
    "answer the Holidays collection"
    Holidays isNil
        ifTrue: [ self newHolidays].
    ^Holidays!

modifyDate: aDate
   "Private - modify aDate to have a year of 0000 for holidays"
   | month day |
   month := aDate monthName.
   day := aDate dayOfMonth.
   ^Date newDay: day month: month year: 0000.!
 
new
    "Answer a new instance of the receiver."
    ^super new initialize!
   
newHolidays
      "Create a new class Holiday Dictionary"
   ^Holidays := Dictionary new.! !



!Calendar methods !
   
date
   "answer date"
   ^date.!
  
decrementMonth
    "decrease month by one"
    month = 1
    ifTrue:[ month := 12.
        year := year - 1]
    ifFalse:[
        month := month - 1 ].
    monthName := Date nameOfMonth: month.!
  
decrementYear
    "decrease year by one"
    year = 1901 "Can't go past base year"
    ifFalse:[ year := year - 1].
    ^year.!
 
display
    "answers a calendar for the current inst vars and highlights
      today and holidays"
    | oldFont oldColor|
    pane font: Font fixedSystemFont. "Make sure we have a monospaced font"
    pane cr;
        contents: (Date newCalendarForMonth: monthName year: year).
    pane selectBefore: 1@1.!
 
incrementMonth
    "increase month by one"
    month = 12
        ifTrue:[ month := 1.
                year := year + 1]
        ifFalse:[
                month := month + 1 ].
    monthName := Date nameOfMonth: month.!
  
incrementYear
    "increase year by one"
    year = 2100 "Set a limit"
    ifFalse:[ year := year + 1].
    ^year.!
 
initialize
    "initialize the calendar objects"
    today := Date today.
    self setNewDate: today.!
   
isHoliday
   "answers the holiday's description if date is a holiday, else
nil"
   |aDate name|
   aDate := self class modifyDate: date."convert to holiday format"
   ^Holidays at: aDate ifAbsent: [^nil].!
  
makeNewDate
    "Creates a new date from current month, day and year."
    ^date := Date newDay: day month: monthName year: year.!

makeNewDateFromString: aString
    "Private - parses aString for date or month-year,
     then sets inst vars to resulting date.
     Adapted from Date fromString:, which is documented as:
     Answer a Date specified by aString. aString
    must represent a date in one of three formats:
    'Dec 31, 1989' or '31 Dec 1989' or '12/31/89'
    but the delimiters between the month, day and
    year can be any sequence of non-alphanumeric
    characters. "
    | aStream word1 word2 word3 newMonth newYear |
    aStream := aString asStream.
    word1 := aStream nextWord asLowerCase.
    word2 := aStream nextWord asLowerCase.
    word3 := aStream nextWord.
    word3 isNil
        ifTrue: [ " Month & Year Format "
        word3 := day.
        newYear := word2 asLowerCase asInteger.
        newYear < 100 ifTrue: [newYear := newYear + 1900].
        word1 first isLetter
            ifTrue: [ newMonth := Date monthNameFromString: word1]
            ifFalse: [ newMonth := Date nameOfMonth: word1 asInteger].
        ^self setNewDate: (Date
        newDay: word3 asInteger
        month: newMonth
        year: newYear)]

        ifFalse: [ "Full date format, almost exactly like fromString"
        newYear := word3 asLowerCase asInteger.
        newYear < 100 ifTrue: [newYear := newYear + 1900].

       word1 first isLetter ifTrue: [ " 'jan 1 1990' style"
            newMonth := Date monthNameFromString: word1.
            ^self setNewDate: ( Date
            newDay: word2 asInteger
            month: newMonth
            year: newYear)].

    word2 first isLetter ifTrue: [ " '1 jan 1990' style"
        newMonth := Date monthNameFromString: word2.
        ^self setNewDate: (Date
        newDay: word1 asInteger
        month: newMonth
        year: newYear)].

    "must be '1/20/90' or 1/20/1990' style"
    ^self setNewDate:(Date
        newDay: word2 asInteger
        month: (Date nameOfMonth: word1 asInteger)
        year: newYear)].!
 
monthYearString
    "answer a string with the current month and year"
    ^monthName,' ',year printString.!
   
pane
    "Get"
    ^pane.!

pane: newValue
    "Set"
    pane := newValue.!
   
selectedDate: aDayString
      "Creates a Date from the aDayString"
   | aDay |
   aDay := aDayString asInteger.
   aDay = 0
      ifFalse: [
         day := aDay.
         self makeNewDate].!
 
setNewDate: aDate
    "Sets the inst vars to aDate"
    month := aDate monthIndex.
    monthName := aDate monthName.
    year := aDate year.
    day := aDate dayOfMonth.
    date := aDate.!
 
showAppointments: aCollection
      "Highlights dates with appointments on a pane"

   self makeNewDate. "Sync date with other variables"
   aCollection do: [ : each | (each monthIndex = month)
      ifTrue:[(each year = year)
         ifTrue:[pane highlightString: each dayOfMonth printString foreColor: ClrBlue]]].!
 
showHolidays
      "Highlight applicable holidays on aPane."
   self makeNewDate. "Sync date with other variables"
      self class holidays keysDo: [ : each | (each monthIndex = month)
         ifTrue: [ pane highlightString: each dayOfMonth printString foreColor: ClrDarkred]].!

showSelectedDay
      "HighLight the selected Day"

   day notNil ifTrue:[ pane highlightString:date dayOfMonth printString
    backColor: ClrBrown].!
  
showToday
    "Highlight today if appropriate"
    ((today monthName = monthName) and: [today year = year])
        ifTrue: [ pane highlightString: today dayOfMonth printString foreColor: ClrDarkgreen].!
  
today
    "Get"
    ^self initialize.!

update
      "updates the highlights on the calendar"

   self showSelectedDay.
   self showHolidays.
   self showToday.!
  
weekdayMonthDayYearString
   "answers a string "

   ^date dayName,' ',monthName,' ',day printString, ', ',year printString.! !
