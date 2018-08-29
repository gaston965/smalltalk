#include <windows.h>

extern VOID FAR PASCAL userAddInt (int intNumber);
HANDLE hInstance;

/****************************************************************************
   FUNCTION: LibMain(HANDLE, WORD, WORD, LPSTR)

   PURPOSE:  Is called by LibEntry.  LibEntry is called by Windows when
             the DLL is loaded.  The LibEntry routine is provided in
             the LIBENTRY.OBJ in the SDK Link Libraries disk.  (The
             source LIBENTRY.ASM is also provided.)  
           
*******************************************************************************/
int FAR PASCAL LibMain(hModule, wDataSeg, cbHeapSize, lpszCmdLine)
HANDLE	hModule;
WORD    wDataSeg;
WORD    cbHeapSize;
LPSTR   lpszCmdLine;
{
	hInstance = hModule;

	if (cbHeapSize > 0)
		UnlockData (0);
	
    return 1;
}


/****************************************************************************
    FUNCTION:  WEP(int)

    PURPOSE:  Performs cleanup tasks when the DLL is unloaded.  WEP() is
              called automatically by Windows when the DLL is unloaded (no
              remaining tasks still have the DLL loaded).  It is strongly
              recommended that a DLL have a WEP() function, even if it does
              nothing but returns success (1), as in this example.

*******************************************************************************/
int FAR PASCAL WEP (bSystemExit)
int  bSystemExit;
{
    return(1);
}


/****************************************************************************
    FUNCTION:  TimerFunc (HWND hWnd, WORD wMsg, int nIDEvent, DWORD dwTime)

    PURPOSE:  Call back function for SetTimer API

*******************************************************************************/
WORD FAR PASCAL TimerFunc (HWND hWnd, WORD wMsg, int nIDEvent, DWORD dwTime)
{

	userAddInt (12);
	KillTimer (NULL, nIDEvent);	
	return 1;
}


/****************************************************************************
    FUNCTION:  SetInterruptTimer (WORD wMilliseconds)

    PURPOSE:  Set a timer that will send a interrupt to Process class

*******************************************************************************/
WORD FAR PASCAL SetInterruptTimer (WORD wMilliseconds)
{
FARPROC lpfnTimer;

	lpfnTimer = MakeProcInstance (TimerFunc, hInstance);

	return SetTimer (NULL, NULL, wMilliseconds, lpfnTimer);
}




