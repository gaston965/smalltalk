


!FileStream methods !

sizeOf: aCharacter
        "Private - answer the size in bytes of aCharacter."
    ^(aCharacter isDoubleByte ifTrue: [2] ifFalse: [1])!

backupOver: previousChar
        "Reposition the receiver to before the previous character.
        previousChar is the last character obtained from the receiver."
    self position:
        (self position - (self sizeOf: previousChar))!
  
asMixedFileStream
        " Make the receiver a character-oriented MixedFileStream
        which interprets mixed string encodings using the lead bytes
        of the current national language.  Answer the receiver. "
    ^self asMixedFileStream: NationalLanguage leadBytes!
  
asMixedFileStream: leadBytes
        " Make the receiver a character-oriented MixedFileStream
        which interprets mixed string encodings using the specified
        leadBytes flag array.  Answer the receiver. "
    | mixedStream |
    mixedStream := MixedFileStream new.
    1 to: FileStream instSize do: [ :i |
        mixedStream instVarAt: i put: (self instVarAt: i)].
    mixedStream leadBytes: leadBytes.
    (self position = 0)
        ifTrue: [mixedStream setLineDelimiterFromFirstPage].
    self become: mixedStream.
    ^mixedStream!
   
   
getBytesFor: aByteObject from: start to: stop
        " Directly copy from the stream to aByteObject.
          start and stop are byte indices into aByteObject. "
    | objectIndex writeTo bufferLeft |
    writeTo := objectIndex := start - 1.
    [(objectIndex := writeTo) < stop] whileTrue: [
        bufferLeft := collection size - position.
        writeTo := writeTo + bufferLeft min: stop.
        aByteObject
            replaceBytesFrom: objectIndex + 1
            to: writeTo
            with: collection
            startingAt: position + 1.
        self position: self position + writeTo - objectIndex]!


  
 

 
putBytesFrom: aByteObject from: start to: stop
        " Write the contents of aByteObject to the receiver.
          aByteObject can be a ByteArray or a String.
          start and stop are byte indices into aByteObject. "
    | writeTo objectLeft objectIndex |
    objectIndex := start - 1.
    [objectIndex < stop] whileTrue: [
        objectLeft := stop - objectIndex.
        writeTo := collection size min: position + objectLeft.
        collection
            replaceBytesFrom: position + 1
            to: writeTo
            with: aByteObject
            startingAt: objectIndex + 1.
        objectIndex := objectIndex + writeTo - position.
        writtenOn := true.
        position := writeTo.
        self position: pageStart + position - 1]! !
