



!VWVMDLL methods !
   
containsDoubleByteCharacter: aDBString
        "Private - Answer 1 if aDBString contains
         any double-byte characters, answer 0 if it
         does not. Answer -1 it the api fails."
    <api: CONTAINSDBCHARACTER self long>!
  
doubleByteString: aDBString toMixedString: aString
        "Private - Answer the length of aString in
          mixed-encoding containing all the characters
         of the double-byte string. Answer -1 it the api fails."
    <api: DBTOMIXEDSTRING self self  long>!
   
doubleByteStringSizeFrom: aString leadBytes: leadByteFlags
        "Private - Answer the size of a double-byte
          string containing the characters of aString
          in mixed-encoding. Answer -1 it the api fails."
    <api: MIXEDTODBSTRINGSIZE self self long>!
   
mixedString: aString containsLeadByte: leadByteFlags
        "Private - Answer 1 if aString contains
         any lead-byte characters, answer 0 if it
         does not. Answer -1 it the api fails."
    <api: CONTAINSLEADBYTE self self long>!
  
mixedString: aString toDoubleByteString: aDBString leadBytes: leadByteFlags
        "Private - Answer the length of a double-byte
          string containing all the characters of aString
          in mixed-encoding. Answer -1 it the api fails."
    <api: MIXEDTODBSTRING self self self long>!
   
mixedStringSizeFrom: aDBString
        "Private - Answer the size of a string in
          mixed-encoding containing all the characters of
          the double-byte string. Answer -1 it the api fails."
    <api: DBTOMIXEDSTRINGSIZE self  long>! !
