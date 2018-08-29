#include <windows.h>
#include <math.h>
#include <dos.h>                               
#include "objects.h"
#include "userprim.mac"
#include "fixdptrs.h"
                                        
unsigned short status = 0;

int FAR PASCAL LibMain (HANDLE hInstance,
			WORD wDataSeg,
			WORD cbHeapSize,
			LPSTR lpszCmdLine)
{
    return (1);
}

int FAR PASCAL WEP (int nParameter)
{
    return (1);
}

unsigned short FAR PASCAL getStatus(VOID)
{
    return (status);
} 

VOID FAR PASCAL initFxdPtrsSeg( smlPosObj, smlNegObj )
struct smallPosObj far *smlPosObj;
struct smallNegObj far *smlNegObj;
{
    plusSmallSeg = FP_SEG( smlPosObj );
    minusSmallSeg = FP_SEG( smlNegObj );
}

VOID FAR PASCAL asfloat (recvr,result)
struct floatObject far *recvr, far *result;
{
   long a;
   int size;
   unsigned short new, far *front;
   double r1;

   if (isSmallPosInt( recvr ) || isSmallNegInt( recvr ))
    {
    a = (long) (FP_OFF(recvr));
    if (FP_SEG(recvr) == plusSmallSeg)
        {(*result).dig = (1.0 * a);}
    else {(*result).dig = (-1.0 * a);}
    }
    else
    {
        r1 = 0.0;
        size = recvr->header.ObjectSize;
        size = size / 2;
        front = (unsigned short far *) &(recvr->dig);
        front += size - 1;
        r1 = *front --;
        size = size - 1;
        while (size > 0)
            {
              new = *front --;
              size = size - 1;
              r1 = r1 * 65536.0;
              r1 = r1 + new;
            }
        if ((*recvr).header.ClassPtrHash == LargeNegIntHash)
            r1 = 0.0 - r1;
        (*result).dig = r1;
    }
}

BOOL FAR PASCAL lessthan(recvr,arg1)
struct floatObject far *recvr, far *arg1;
{
   double a, b;

   a = (*recvr).dig;
   b = (*arg1).dig;
   if (a < b) {return TRUE;}
      else    {return FALSE;}
}

BOOL FAR PASCAL equal(recvr,arg1)
struct floatObject far *recvr, far *arg1;
{
   double a, b;

   a = (*recvr).dig;
   b = (*arg1).dig;
   if (a == b) {return TRUE;}
      else    {return FALSE;}
}

VOID FAR PASCAL add (recvr,arg1,result)
struct floatObject  far *recvr, far *arg1, far *result;
   {
   double a, b;

   a = (*recvr).dig;
   b = (*arg1).dig;
   (*result).dig = a + b;
   }

VOID FAR PASCAL subtract (arg1,recvr,result)
struct floatObject  far *arg1,  far *recvr, far *result;
   {
   double a, b;

   a = (*recvr).dig;
   b = (*arg1).dig;
   (*result).dig = a - b;
   }

VOID FAR PASCAL multiply(recvr,arg1,result)
struct floatObject  far *recvr, far *arg1, far *result;
   {
   double a, b;

   a = (*recvr).dig;
   b = (*arg1).dig;
   (*result).dig = a * b;
   }

BOOL FAR PASCAL divide(recvr,arg1,result)
struct floatObject  far *recvr, far *arg1, far *result;
   {
   double a, b;
   
   status = 0; 
   a = (*recvr).dig;
   b = (*arg1).dig; 
   if (b == 0.0) {status = 0x84; return FALSE;}
   else {(*result).dig = a / b; return TRUE;};
   }

VOID FAR PASCAL exponent (recvr,result)
struct floatObject  far *recvr, far *result;
   {
   double a, b;
   
    status = 0;
   a = (*recvr).dig;
    b = exp(a);
    if (b == HUGE_VAL) status = 0x88;
   (*result).dig = b;
   }

VOID FAR PASCAL naturallog (recvr, result)
struct floatObject  far *recvr, far *result;
   {
   double a, b;
   status = 0;
   a = (*recvr).dig;
   b = log(a);
   if (b == -HUGE_VAL) status = 0x88;
   (*result).dig  = b;
   }

VOID FAR PASCAL sine (recvr, result)
struct floatObject  far *recvr, far *result;
   {
   double a, b;
   status = 0;
   a = (*recvr).dig;  
    b = sin(a);
    if (b == HUGE_VAL) status = 0x88;
    if (b == -HUGE_VAL) status = 0x90;
   (*result).dig = b;
   }

VOID FAR PASCAL cosine (recvr, result)
struct floatObject  far *recvr, far *result;
   {
   double a, b;
    status = 0;
   a = (*recvr).dig;
    b = cos(a);
    if (b == HUGE_VAL) status = 0x88;
    if (b == -HUGE_VAL) status = 0x90;
   (*result).dig = b;
   }

VOID FAR PASCAL  tangent (recvr, result)
struct floatObject  far *recvr,  far *result;
   {
   double a;

   a = (*recvr).dig;
   (*result).dig = tan(a);
   }

void  far pascal arctan (recvr, result)
struct floatObject far *recvr, far *result;
   {
   double a;

   a = (*recvr).dig;
   (*result).dig = atan(a);
   }

VOID FAR PASCAL squareroot (recvr, result)
struct floatObject far *recvr, far *result;
   {
   double a;

   a = (*recvr).dig;
   a = sqrt(a);
   (*result).dig = a;
   }

VOID FAR PASCAL timespowerof2 (recvr,arg1,result)
struct floatObject  far *recvr,  far *result;
struct intObject far *arg1;
  {
   double a, r;
   int b;
    status = 0;
   a = (*recvr).dig;
   b = FP_OFF(arg1); 
    r = ldexp(a, b);
    if (r == HUGE_VAL) status = 0x88;
    if (r == -HUGE_VAL) status = 0x90;
   (*result).dig = r;
   }

short FAR PASCAL truncateSmall (recvr)
struct floatObject far *recvr;
{
   double a, fraction, number;
   short result;

   a = (*recvr).dig;
   fraction = modf (a, &number);
   result = (int) number;
   return (result);
}

VOID FAR PASCAL truncateLarge (recvr, result)
struct floatObject far *recvr, far *result;
   {
   double a, fraction;
   unsigned short far *res1;
      a = (*recvr).dig;
      a = fabs (a);
      res1 = (unsigned short far *) &(*result).dig;
      while (a >= 1.0)
      {
         fraction = fmod (a, 65536.0);
         *res1++ = (unsigned) fraction;
         a = a / 65536.0;
      }
   }

VOID FAR PASCAL fraction (recvr,result)
struct floatObject far *recvr, far *result;
   {
   double a, mantissa;
   int number;

   a = (*recvr).dig;
   mantissa = frexp(a, &number);
   (*result).dig = mantissa * 2.0;
   }

VOID FAR PASCAL nexponent (recvr,result)
struct floatObject far *recvr, far *result;
   {
   double a, mantissa;
   int number;

   a = (*recvr).dig;
   mantissa = frexp(a, &number);
   (*result).dig = (double) (number - 1);
   }

/* Override matherr function. matherr processes errors generated     */
/* by math functions. We override matherr to prevent it from	     */
/* displaying error messages. Math errors are handled in Smalltalk/V.*/
int matherr( x )
struct exception *x;
{
    return (1);   /* don't take default action.*/
}

