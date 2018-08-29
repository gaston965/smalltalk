/* Definitions for fixed pointer objects. */
/* The fixed pointers segments and offsets below must be 
    initialized prior to usage. To initialize these variables, create
    a method that calls an initialization routine in your dll. 
    The arguments to this routine are the various fixed pointers 
    that you wish to reference in your dll. See function initFixdPtrSeg 
    in vpmfloat.c for an example. */

int plusSmallSeg;	   /*segment of small positive integers*/
int nilSegment; 	   /*segment of nil object*/
int minusSmallSeg;	   /*segment of small negative integers*/
int booleanSeg; 	   /*segment for true and false*/
int characterSeg;	   /*segment for all character objects*/
int fixedPtrSeg;	   /*segment for all fixed ptr objects*/

/* Fixed offsets */

int nilOffset;		   /*offset of nil object*/
int trueOffset; 	   /*offset of true object*/
int falseOffset;	   /*offset of false object*/
int firstCharOffset;	   /*offset of ascii char*/

#define LargeNegIntHash 56
