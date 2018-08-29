
Object subclass: #PolygonSound
  instanceVariableNames: 
    'owner handlers polygons '
  classVariableNames: ''
  poolDictionaries: ''   !


!PolygonSound class methods !

new
    ^super new initialize!
 
supportedEvents
        "Answer the Set of events that SubPanes can notify
         their owners about."
    ^Set new
        add: #getContents;
        yourself!
 
supportsEvent: anEvent
        "Answer true if the receiver supports anEvent."
    ^self supportedEvents includes: anEvent! !



!PolygonSound methods !
  
addOrDelete: aPolygon
        "Make its identity sound when
         aPolygon is added or deleted."
    aPolygon sound.
    self event: #getContents!
   
changed: aFacet
        "Something has changed related to the dependents
         of the receiver.  Send update message to all the
         dependents of aFacet (usually the name of a subpane)."
    self name = aFacet
        ifTrue: [self update]!
   
changed: aFacet with: firstArg with: secondArg
        "Something has changed related to the dependents
         of the receiver.  Send update message to all the
         dependents of aFacet (usually the name of a subpane)."
    self name = aFacet
        ifTrue: [self perform: firstArg with: secondArg]!
 
closeView
        "The sound interface is closed.
         Do nothing."!
  
contents: anArray
        "Add anArray of polygons to the
         sound interface."
    polygons := anArray!

event: aSymbol
        "Notify the receiver's owner of an event
         by performing the selector that the owner set for
         this event."
    | selector |
    selector := handlers at: aSymbol ifAbsent: [^nil].
    selector isNil ifTrue: [^nil].
    selector class == String
        ifTrue: [^self perform: selector asSymbol].
    ^owner perform: selector with: self!
  
initialize
        "Initialize the sound interface."
    handlers := IdentityDictionary new.
    polygons := OrderedCollection new.!
 
name
        "Answer the name of the interface."
    | answer |
    answer := handlers at: #getContents ifAbsent: [^nil].
    answer class == String
        ifTrue: [^(handlers at: #compatibility) at: 1].
    ^answer!
 
owner: anObject
        "Set the owner of the interface to anObject."
    owner := anObject!
  
select: index
        "The polygon at index has been
         selected, make its identity sound."
    (polygons at: index)
        sound!
   
update
        "The contents of the interface may
         have  changed, get new contents
         from the owner."
    self event: #getContents!
  
when: anEvent perform: aSelector

        "Notify the owner whenever anEvent occurs by
         performing aSelector.  aSelector takes one argument,
         the interface."

    (self class supportsEvent: anEvent)
        ifFalse: [^self error: 'Event not supported'].
    handlers at: anEvent put: aSelector! !
