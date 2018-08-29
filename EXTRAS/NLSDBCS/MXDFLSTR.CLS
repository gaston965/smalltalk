
FileStream subclass: #MixedFileStream
  instanceVariableNames: 
    'leadBytes '
  classVariableNames: ''
  poolDictionaries: 
    'CharacterConstants ' !


!MixedFileStream class methods ! !



!MixedFileStream methods !
 
asByteFileStream
        " Make the receiver a byte-oriented FileStream.
        Answer the receiver. "
    | byteStream |
    byteStream := FileStream new.
    1 to: FileStream instSize do: [ :i |
        byteStream instVarAt: i put: (self instVarAt: i)].
    (self position = 0)
        ifTrue: [byteStream setLineDelimiterFromFirstPage].
    self become: byteStream.
    ^byteStream!

asMixedFileStream: leadByteFlags
        " Make the receiver a character-oriented MixedFileStream
        which interprets mixed string encodings using the specified
        leadBytes flag array.  Answer the receiver. "
    (leadByteFlags == leadBytes) ifTrue: [^self].
    leadBytes := leadByteFlags.
    (self position = 0)
        ifTrue: [self setLineDelimiterFromFirstPage].
    ^self!
  
copyFrom: first to: last
        "Answer a string containing the characters of the
         receiver stream from byte positions first to last."
    ^(super copyFrom: first to: last)
        asNormalizedString: leadBytes!

leadBytes
        "Answer the leadBytes flag array currently in use
        for normalizing mixed strings."
    ^leadBytes!
  
leadBytes: leadByteFlags
        "Set the leadBytes flag array for normalizing mixed strings."
    leadBytes := leadByteFlags.!
   
next
        "Answer the next character accessible by the receiver
         and advance the stream position.  Report an error
         if the receiver stream is positioned at end."
    | char |
    char := self nextOneByteCharacter.
    (char isLeadByte: leadBytes)
        ifTrue: [char := Character
            leadByte: char
            trailByte: self nextOneByteCharacter].
    ^char!
 
nextByte
        "Answer the next byte accessible by the receiver
         and advance the stream position.  Report an error
         if the stream is positioned at end."
    ^self nextOneByteCharacter asciiValue!
   
nextOneByteCharacter
        " Private - answer the next byte. "
    ^super next!
 
nextPutAll: aCollection
        "Write each of the characters in
         aCollection to the receiver stream."
    ^super nextPutAll:
        ((aCollection isDoubleByteString)
            ifTrue: [aCollection asMixedString]
            ifFalse: [aCollection])!

nextWord
        "Answer a String containing the next word in the
         receiver stream.  A word starts with a letter,
         followed by a sequence of letters and digits."
    | first aChar |
    [self atEnd ifTrue: [^nil].
    (aChar := self next) isAlphaNumeric]
        whileFalse: [].  "skip separators"
    first := (aChar isDoubleByte
        ifTrue: [self position - 1]
        ifFalse: [self position]).
    [self atEnd
        ifTrue: [^self copyFrom: first to: self position].
     (aChar := self next) isAlphaNumeric]
        whileTrue: [].
    self backupOver: aChar.
    ^self copyFrom: first to: self position!
  
reverseContents
        "Answer a collection of the same species as the
         receiver collection, with the contents in
         reverse order."
    ^self invalidMessage!
   
setLimits
        "Private - Initialize the stream size and position."
    self leadBytes: NationalLanguage leadBytes.
    ^super setLimits!
 
setLineDelimiterFromFirstPage
        " Private - find the first line ending in the file. "
    | inDBC char |
    lineDelimiter := Cr.
    inDBC := false.
    1 to: readLimit do: [ :i |
        inDBC
            ifTrue: [inDBC := false]
            ifFalse: [
                char := collection at: i.
                (char isLeadByte: leadBytes)
                    ifTrue: [inDBC := true]
                    ifFalse: [
                        (char == Cr) ifTrue: [
                            lineDelimiter := Cr.
                            ^self].
                        (char == Lf) ifTrue: [
                            lineDelimiter := Lf.
                            ^self].
                        ]]].!
 
upTo: anObject
        "Answer the collection of objects from the receiver
         starting with the next accessible object and up to
         but not including anObject.  Set the position beyond
         anObject.  If anObject is not present, answer the
         remaining elements of the stream."
    ^self
        copyFrom: self position + 1
        to: ((self skipTo: anObject)
                ifTrue: [self position - (self sizeOf: anObject)]
                ifFalse: [self position])! !
