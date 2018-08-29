#include <windows.h>
#include "vwsignon.h"

HWND hDlg = NULL;
WORD WVerHI, WVerLO;

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



//****************************************************************************
//
//	Startup Dialog WndProc
//
//****************************************************************************
BOOL FAR PASCAL StartupDlgProc (HWND hDlg, WORD wMessage, WORD wParam, LONG lParam)
{
BOOL bResult = TRUE;
char szText [30];
short nCxScreen, nCyScreen, nWidth, nHeight;
RECT rcDlg;

	switch (wMessage)
	{
		case WM_INITDIALOG:
			wsprintf ((LPSTR)szText, "%d.%d", WVerHI, WVerLO);
			SetDlgItemText (hDlg, ID_VERSION, (LPSTR)szText);
			nCxScreen = GetSystemMetrics (SM_CXSCREEN);
			nCyScreen = GetSystemMetrics (SM_CYSCREEN);
			GetWindowRect (hDlg, &rcDlg);
			nWidth = rcDlg.right - rcDlg.left;
			nHeight = rcDlg.bottom - rcDlg.top;
			MoveWindow (hDlg,
							(nCxScreen - nWidth)/2,
							(nCyScreen - nHeight)/2,
							nWidth,
							nHeight,
							FALSE);
		
		break;

		default:
			bResult = FALSE;
		break;
	}

	return bResult;
}



//****************************************************************************
//
//	Called from Smalltalk to open the startup Dialog.
//
//****************************************************************************
BOOL FAR PASCAL OpenSignOn (HANDLE hInstance, WORD wVersion)
{
FARPROC lpfnStartupDlgProc;

	WVerHI = wVersion / 256;
	WVerLO = wVersion - (WVerHI * 256);

	lpfnStartupDlgProc = MakeProcInstance (StartupDlgProc, hInstance);
	if (hDlg = CreateDialog (hInstance, "Startup", GetDesktopWindow(), StartupDlgProc))
		return TRUE;
	else 
		return FALSE;
}


//****************************************************************************
//
//	Called from Smalltalk to close the startup Dialog.
//
//****************************************************************************
BOOL FAR PASCAL CloseSignOn ()
{
	if (hDlg != NULL)
	{
		if (DestroyWindow (hDlg))
			return TRUE;
	}
	return FALSE;
}


