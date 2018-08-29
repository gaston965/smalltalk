

!VWVMDLL methods !
   
loadCollateTable: aCollateTable
        "Private - Initialize the collating-sequence table
          for the current country and language settings.
          This table is used in string comparison primitive.
          Answer -1 if not successful."
    <api: LOADCOLLATETABLE self  ushort>! !
