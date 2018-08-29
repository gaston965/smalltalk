
GroupPane subclass: #FormPane
  instanceVariableNames: 
    'controlPane displayPane fieldNames fieldValues initialFieldValues fieldFormats '
  classVariableNames: ''
  poolDictionaries: '' !


!FormPane class methods ! !



!FormPane methods !
   
addButton: aButton
   controlPane addSubpane: aButton.!

cancel: ignored
owner cancel!
  
defineFields: fieldNameList defaultValues: defaultValues formatted: formats
"Initialize the field names and values of a FormPane using the supplied field
  names and initial values"
| fieldOrigin fieldHeight fieldCount fieldNumber maxWidth|

fieldNames := fieldNameList.
fieldValues := initialFieldValues := defaultValues.
fieldFormats := formats.
fieldCount := fieldNames size.
fieldHeight :=ButtonFont height.
maxWidth := 0.

fieldNames do: [:field |   maxWidth := maxWidth max: field size ].

fieldNumber := 0.
fieldNames do: [:field |
fieldNumber := fieldNumber + 1.
displayPane
   addSubpane:
   (StaticText new
   owner: self;
   rightJustified;
   contents: field;
   framingBlock: ( self nextLabelOrigin: fieldNumber of: fieldCount widest: maxWidth))
   ].

fieldNumber := 0.
fieldValues do: [:value |
fieldNumber := fieldNumber + 1.
displayPane
   addSubpane:
   (FormattedEntryField new
   owner: self;
   contents: value;
   perform: ((fieldFormats at: fieldNumber) asSymbol);
   framingBlock: ( self nextValueOrigin: fieldNumber of: fieldCount widest: maxWidth))
   ]!

nextLabelOrigin: fieldNumber of: fieldCount widest: maxWidth

^[:box | (box origin + (0 @
   ((box height - ButtonFont height) // fieldCount) * (fieldNumber - 1))
   corner:
   (box origin + (ButtonFont width * maxWidth @
   (((box height - ButtonFont height) // fieldCount) * fieldNumber))))]!

nextValueOrigin: fieldNumber of: fieldCount widest: maxWidth

^[:box | (box origin + ( ((ButtonFont width * maxWidth) + 5) @
   (((box height - ButtonFont height) // fieldCount) * (fieldNumber - 1)) )
   corner:
   (box width @ (((box height - ButtonFont height) // fieldCount) * fieldNumber )))].!
 
ok: ignored
Transcript cr; show: 'The responses are: ';
   show: (fieldValues printString); cr.

^fieldValues.!
 
openWithLabels: aFieldList withValues: aValueList formatted: aFormatList
self addSubpane:
      (displayPane := GroupPane new
      owner: self;
      framingRatio: (0 @ 0 extent: 1 @ (14/16)));
   addSubpane:
      (controlPane := GroupPane new
      owner: self;
      framingRatio: (0 @ 0 extent: 1 @ 1)).
controlPane addSubpane:
   (Button new
   owner: self;
   contents: 'OK';
   when: #clicked perform: #ok:;
   framingBlock: [:box | (box leftBottom rightAndUp: 130 @ (ButtonFont height + 8))
    extent: (( ButtonFont stringWidth: 'Cancel') @ (ButtonFont height) + 8) ]);
   addSubpane:
   (Button new
   owner: self;
   contents: 'Cancel';
   when: #clicked perform: #cancel:;
   framingBlock: [:box | (box leftBottom rightAndUp: 195 @ (ButtonFont height + 8))
     extent: (( ButtonFont stringWidth: 'Cancel') @ (ButtonFont height) + 8) ]).
self defineFields: aFieldList defaultValues: aValueList formatted: aFormatList.
super open.!
 
setLabelFont: aFont
| fieldPanes |
fieldPanes := displayPane children
   select: [:pane | pane class == StaticText ].
fieldPanes do: [:field |
   field font: aFont].
   displayPane update!
  
setValueFont: aFont
| fieldPanes |
fieldPanes := displayPane children
   select: [:pane | pane class == FormattedEntryField ].
fieldPanes do: [:field |
   field font: aFont].
   displayPane update! !
