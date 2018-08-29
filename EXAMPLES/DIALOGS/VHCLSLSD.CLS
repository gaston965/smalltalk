
WindowDialog subclass: #VehicleSalesDialog
  instanceVariableNames: 
    'priceList carList '
  classVariableNames: ''
  poolDictionaries: 
    'WinConstants '  !


!VehicleSalesDialog class methods ! !



!VehicleSalesDialog methods !
   
buildCustControls
        "Build customer controls"
    | lineHeight charWidth charHeight |

    lineHeight := WindowDialog entryHeight.
    charHeight := WindowDialog charHeight.
    charWidth := WindowDialog charWidth.


    " 'Last' Static Field"
    self addSubpane:
        (StaticText new
            leftJustified;
            contents: 'Last';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 4) @ (lineHeight * 1.5)
                    extent: (charWidth * 20) @ charHeight ] ).

    " 'First' Static Field"
    self addSubpane:
        (StaticText new
            leftJustified;
            contents: 'First';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 25) @ (lineHeight * 1.5)
                    extent: (charWidth * 20) @ charHeight ] ).

    " 'MI' Static Field"
    self addSubpane:
        (StaticText new
            leftJustified;
            contents: 'MI';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 46) @ (lineHeight * 1.5)
                    extent: (charWidth * 2) @ charHeight ] ).

    " 'Date' Static Field"
    self addSubpane:
        (StaticText new
            leftJustified;
            contents: 'Date';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 52) @ (lineHeight * 1.5)
                    extent: (charWidth * 4) @ charHeight ] ).

    "Last Name Entry Field"
    self addSubpane:
        (FormattedEntryField new
            acceptAlpha;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 4) @ (lineHeight *2.5)
                    extent: (charWidth * 20) @ (lineHeight) ] ).

    "First Name Entry Field"
    self addSubpane:
        (FormattedEntryField new
            acceptAlpha;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 25) @ (lineHeight * 2.5)
                    extent: (charWidth * 20) @ (lineHeight) ] ).

    "Middle Initial Entry Field"
    self addSubpane:
        (FormattedEntryField new
            acceptAlpha;
            setTextLimit: 1;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 46) @ (lineHeight *2.5)
                    extent: (charWidth * 3) @ (lineHeight) ] ).

    "Date Entry Field"
    self addSubpane:
        (FormattedEntryField new
            acceptDate;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 52) @ (lineHeight *2.5)
                    extent: (charWidth * 8) @ (lineHeight) ] ).

     " 'Address' Static Field"
     self addSubpane:
        (StaticText new
            leftJustified;
            contents: 'Address';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 4) @ (lineHeight *4)
                    extent: (charWidth * 25) @ charHeight ] ).

    " 'City' Static Field"
    self addSubpane:
        (StaticText new
            leftJustified;
            contents: 'City';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 30) @ (lineHeight *4)
                    extent: (charWidth * 20) @ charHeight ] ).

    " 'State' Static Field"
    self addSubpane:
        (StaticText new
            leftJustified;
            contents: 'State';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 51) @ (lineHeight *4)
                    extent: (charWidth * 5) @ charHeight ] ).

    " 'Zip' Static Field"
    self addSubpane:
        (StaticText new
            leftJustified;
            contents: 'Zip';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 57) @ (lineHeight *4)
                    extent: (charWidth * 5) @ charHeight ] ).

    "Address Entry Field"
    self addSubpane:
        (EntryField new
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 4) @ (lineHeight *5)
                    extent: (charWidth * 25) @ lineHeight ] ).

    "City Entry Field"
    self addSubpane:
        (FormattedEntryField new
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 30) @ (lineHeight *5)
                    extent: (charWidth * 20) @ lineHeight ] ).

    "State Entry Field"
    self addSubpane:
        (FormattedEntryField new
            acceptAlpha;
            setTextLimit: 2;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 51) @ (lineHeight *5)
                    extent: (charWidth * 4) @ lineHeight ] ).

    "Zip Entry Field"
    self addSubpane:
        (FormattedEntryField new
            acceptPositiveInteger;
            setTextLimit: 5;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 56) @ (lineHeight *5)
                    extent: (charWidth * 7) @ lineHeight ] ).

    " 'Hm Phone #' Static Field"
    self addSubpane:
        (StaticText new
            contents: 'Hm Phone #';
            leftJustified;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 4) @ (lineHeight *6.5)
                    extent: (charWidth * 14) @ charHeight ] ).

    " 'Wk Phone #' Static Field"
    self addSubpane:
        (StaticText new
            contents: 'Wk Phone #';
            leftJustified;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 20) @ (lineHeight *6.5)
                    extent: (charWidth * 14) @ charHeight ] ).

    " 'Soc Sec #' Static Field"
    self addSubpane:
        (StaticText new
            contents: 'Soc Sec #';
            leftJustified;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 35) @ (lineHeight *6.5)
                    extent: (charWidth * 15) @ charHeight ] ).

    "Hm Phone Entry Field"
    self addSubpane:
        (FormattedEntryField new
            acceptPhoneNumber;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 4) @ (lineHeight *7.5)
                    extent: (charWidth * 14) @ lineHeight ] ).

    "Wk Phone Entry Field"
    self addSubpane:
        (FormattedEntryField new
            acceptPhoneNumber;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 20) @ (lineHeight *7.5)
                    extent: (charWidth * 14) @ lineHeight ] ).

    "Soc Sec Entry Field.
    Here is an example of a defining a formatting block without
    using ones defined in FormattedEntryField."
    self addSubpane:
        (FormattedEntryField new
            setTextLimit: 9;
            acceptBlock:[ :input| self formatSocSecNum: input];
            acceptPositiveInteger;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 35) @ (lineHeight *7.5)
                    extent: (charWidth * 15) @ lineHeight ] ).

    "Customer Group Box.
        Make sure to add the group box AFTER the controls that
        surround it."
    self addSubpane:
        (GroupBox new
            contents: 'Customer';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 2) @ (charHeight * 0.5)
                    extent: (charWidth * 63) @ (lineHeight *8.5) ] ).!
  
buildVehicleControls
        "Build Vehicle controls"
    | lineHeight charWidth charHeight |

    lineHeight := WindowDialog entryHeight.
    charHeight := WindowDialog charHeight.
    charWidth := WindowDialog charWidth.

    " 'Description' Static Field"
    self addSubpane:
        (StaticText new
            contents: 'Description:';
            leftJustified;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 4) @ (lineHeight * 10.5)
                    extent: (charWidth * 11) @ charHeight ] ).

    "Vehicle Description Combo Box"
    self addSubpane:
        (ComboBox new
            dropDownList;
            contents: carList;
            when: #select perform: #selectedVehicle:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 16) @ (lineHeight *10.5)
                    extent: (charWidth * 32) @ (lineHeight * 6) ] ).

    "Vehicle Price Entry Field"
    self addSubpane:
        (FormattedEntryField new
            acceptDollar;
            setName: 'priceEntry';
            when: #textChanged perform: #newVehiclePrice:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 49) @ (lineHeight *10.5)
                    extent: (charWidth * 14) @ lineHeight ] ).

    "Vehicle Group Box.
        Make sure to the group box AFTER the controls that
        surround it."
    self addSubpane:
        (GroupBox new
            contents: 'Vehicle';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 2) @ (lineHeight *9.5)
                    extent: (charWidth * 63) @ (lineHeight *2.5) ] ).

    " 'Tax' Static Field"
    self addSubpane:
        (StaticText new
            contents: 'Tax Rate:';
            leftJustified;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 4) @ (lineHeight *12.5)
                    extent: (charWidth * 9) @ charHeight ] ).

    "Tax Rate Entry Field"
    self addSubpane:
        (FormattedEntryField new
            acceptFloat;
            setName: 'taxRateEntry';
            contents: '7';
            when: #textChanged perform: #newTaxRate:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 14) @ (lineHeight *12.5)
                    extent: (charWidth * 4) @ lineHeight ] ).

    " '%' Static Field"
    self addSubpane:
        (StaticText new
            contents: '%';
            leftJustified;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 19) @ (lineHeight *12.5)
                    extent: (charWidth * 2) @ charHeight ] ).

    " 'Tax' Static Field"
    self addSubpane:
        (StaticText new
            contents: 'Tax:';
            leftJustified;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 32) @ (lineHeight *12.5)
                    extent: (charWidth * 15) @ charHeight ] ).

    " Tax Formatted Static Field"
    self addSubpane:
        (FormattedStaticText new
            formatAsDollar;
            setName: 'taxStatic';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 49) @ (lineHeight *12.5)
                    extent: (charWidth * 14) @ lineHeight ] ).

    " 'Total Sale Price' Static Field"
    self addSubpane:
        (StaticText new
            contents: 'Total Sale Price:';
            leftJustified;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 32) @ (lineHeight *14)
                    extent: (charWidth * 15) @ charHeight ] ).

    " total price Formatted Static Field"
    self addSubpane:
        (FormattedStaticText new
            formatAsDollar;
            setName: 'totalStatic';
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 49) @ (lineHeight *14)
                    extent: (charWidth * 14) @ lineHeight ] ).!
  
calculate
        "calculate new total sale price"
    |total|

    self calculateTax.
    total := (self paneAt: 'priceEntry') contents asFloat
                    + (self paneAt: 'taxStatic') contents asFloat.
    (self paneAt: 'totalStatic') contents: total printString.!
   
calculateTax
        "Calculate tax"
    |tax t1 t2|
    tax := ((t1 := (self paneAt: 'priceEntry') contents asFloat)
            * (t2 := (self paneAt: 'taxRateEntry') contents asFloat) / 100) asFloat.
    (self paneAt: 'taxStatic') contents: tax printString.
    ^tax.!
   
cancel: aButton
        "Private - Ok button pushed, close the window."
    self mainView close!
  
formatSocSecNum: input
        "Answer Formatted social security number"
    | formatedOutput |

    formatedOutput := input.
    input size = 9
        ifTrue:[
            formatedOutput := (input copyFrom: 1 to: 3) ,
                                        '-', (input copyFrom: 4 to: 5),
                                        '-', (input copyFrom: 6 to: 9)]
        ifFalse:[ input size = 0
            ifTrue:[]
            ifFalse:[
                     MessageBox message: 'Invalid Social Security Number']].
    ^ formatedOutput!
   
initWindowSize
        "Private - Answer the window size."
    ^(67 @ 26) * WindowDialog unitMultiplier!
  
newTaxRate: aTaxRateEntry
        "User has entered a new tax rate"

    self calculateTax.
    self calculate.!

newVehiclePrice: aPriceEntry
        "User has entered a vehicle price"
    self calculate.!
  
ok: aButton
        "Private - Ok button pushed, close the window."

    self mainView close!

open
        "Open a dialog box to get info on used car purchases."
    | lineHeight charWidth charHeight |

    self openLabel: 'Vehicle sales'
        withCars: #('1984 Honda Accord'
                            '1988 Nissan Sentra'
                            '1990 Chevy Corvette'
                            '1974 Oldsmobile Cutless Supreme'
                            '1980 Ford Mustang'
                            '1986 Dodge Caravan'
                            '1987 Toyota Celica'
                            '1985 Chevy Z28'
                            '1990 Nissan 300Z'
                            '1985 M1A Abrams Tank')
        withPrices:#(5440.00
                            6500.00
                            25000.00
                            400.00
                            3400.00
                            8900.00
                            7800.00
                            6800.00
                            21000.00
                            2600000.00).!
 
openLabel: label withCars: aCarList withPrices:aPriceList
        "Open a dialog box to get information on used car purchase"
    | lineHeight charWidth charHeight groupBox|

    self
        labelWithoutPrefix: label;
        "Since there are GroupBoxes, don't clip children"
        style:
            WsVisible |
            WsPopupwindow |
            WsCaption |
            DsNoidlemsg.

    priceList := aPriceList.
    carList := aCarList.

    lineHeight := WindowDialog entryHeight.
    charHeight := WindowDialog charHeight.
    charWidth := WindowDialog charWidth.

    self buildCustControls.
    self buildVehicleControls.

    self addSubpane:
        (Button new
            contents: 'OK';
            defaultPushButton;
            when: #clicked perform: #ok:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 20) @ (lineHeight *15.5)
                    extent: (charWidth * 8) @ lineHeight ] ).

    self addSubpane:
        (Button new
            contents: 'Cancel';
            when: #clicked perform: #cancel:;
            framingBlock: [:box |
                Rectangle new leftTop: (charWidth * 35) @ (lineHeight *15.5)
                    extent: (charWidth * 8) @ lineHeight ] ).

    self openWindow!
 
selectedVehicle: vehicleComboBox
        "User has selected an item from vehicle Combo Box"
    |selectedIndex|

    (selectedIndex := vehicleComboBox getSelection)isNil
        ifTrue:[^ nil].

    (self paneAt: 'priceEntry') contents: (priceList at: selectedIndex) printString.
    self calculate.! !
