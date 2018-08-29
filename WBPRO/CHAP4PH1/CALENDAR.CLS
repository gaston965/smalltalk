
Object subclass: #Calendar
  instanceVariableNames: 
    'today month monthName day year date pane '
  classVariableNames: 
    'Holidays '
  poolDictionaries: 
    'ColorConstants '  !


!Calendar class methods !

addHoliday: aDate
    "add a aDate to the Holidays Collection. Uses Date day format"
    ^self holidays add: aDate.!
  
addHolidayFromString: aDateString
    "add a aDateString the Holidays Collection. Uses Date
     fromString format"
    ^self holidays add: Date fromString: aDateString.!
   
holidays
    "answer the Holidays collection"
    Holidays isNil
        ifTrue: [ self newHolidays].
    ^Holidays!

new
    "Answer a new instance of the receiver."
    ^super new initialize!
   
newHolidays
    "create a new class holiday Set"
    ^Holidays := Set new.! !



!Calendar methods !
  
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
  
highlight: aDay with: aColor
    "highlights aDay on the default pane with a color, retaining
      current foreColor"
    | oldForeColor |
    pane selectBefore: 1@1; "Start search from known position"
    searchFor: aDay printString. "Search for day, make day a string."
    oldForeColor := pane foreColor.	"Save the current foreColor"
    pane foreColor: aColor;
    selectBefore: 1@1;	    "Move the cursor back to beginning of Pane"
    foreColor: oldForeColor.	"restore old color"!
 
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
   
setNewDate: aDate
    "Sets the inst vars to aDate"
    month := aDate monthIndex.
    monthName := aDate monthName.
    year := aDate year.
    day := aDate dayOfMonth.
    date := aDate.!
 
showHolidays
    "Highight applicable holidays on aPane."

    self makeNewDate. "Sync date with other variables"
    self class holidays do: [ : each | (each monthIndex = month)
        ifTrue:[ self highlight: each dayOfMonth with: ClrBlue]].!
  
showToday
    "Highlight today if appropriate"
    ((today monthName = monthName) and: [today year = year])
        ifTrue: [ self highlight: today dayOfMonth with: ClrDarkgreen].!
 
today
    "Get"
    ^self initialize.!

update
    "update the highlights on the calendar"

    self showHolidays.
    self showToday.! !
