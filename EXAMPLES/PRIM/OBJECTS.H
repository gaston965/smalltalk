/* Objects definitions
   Digitalk 1989 (C) All rights reserved. */

/*Object header structure*/
struct objectHeader {
    short ClassPtrHash;
    short junk1;
    short junk2;
    short NumberFixed;
    short ObjectSize;
    char ExtObjectSize;     /* Object size is 3 bytes */
    char ObjectFlags;
    };

#define HeaderSize  12	    /* Size of object header in bytes */
#define PointerBit  0x10
#define IndexedBit  8

struct arrayObj {
    struct objectHeader header;
    };

struct smallIntObject {
    char dontcare[1];
    };    /* a SmallInteger value is contained in the pointer */

struct largePosObject {
    struct objectHeader header;
    unsigned short words[2];
    };

struct smallNegObj {
    char dontcare[1];
    };

struct largNegObj {
    struct objectHeader header;
    unsigned short words[2];
    };

struct floatObject {
    struct objectHeader header;
    double dig;
    };

union guts {
    int instanceVar[4];
    int num;
    };

struct object {
    struct objectHeader header;
    union guts value;
    };

struct assoc {
    struct objectHeader header;
    long assocKey;
    long assocValue;
    };



