#RequireAdmin

#include-once
#include <Array.au3>
#include <Constants.au3>
#include <MsgBoxConstants.au3>
#include <Misc.au3>
#include <MsgBoxConstants.au3>
#include <TrayConstants.au3>

#include <MyUDFs\TgCons.au3>
#include <MyUDFs\Log.au3>
#include <MyUDFs\FileZ.au3>
#include <MyUDFs\ProcessCloseAll.au3>
#include <MyUDFs\IsDir.au3>
#include <MyUDFs\RunCmdRead.au3>


#pragma compile(FileDescription, 'Zetsoft Enterprise')
#pragma compile(ProductName, 'NvTelemetry')
#pragma compile(ProductVersion, 2.6.1.0)
#pragma compile(FileVersion,  2.6.1.0)
#pragma compile(LegalCopyright, '(C) 2020 Zetsoft Corporation. All rights reserved.')
#pragma compile(LegalTrademarks, 'Zetsoft Corporation')
#pragma compile(CompanyName, 'Zetsoft Corporation')



Opt("TrayIconHide", 0)
Opt("TrayAutoPause", 1)


Global $UDFName = 'runx.au3'


#Region Variables



#EndRegion Variables


If $CmdLine[0] = 0 Then
    If @ScriptName = $UDFName Then

        $CmdLineRaw = '@php T:\PHP\Projects\zetsoft\excmd\ALL\asrorz.php tester/test1/run'
        MainProcess()
    Else
        _Log('Please Provide correct command line arg')
        Exit
    EndIf
	
Else

	Global $sConfig = $CmdLine[1]
	$runCmd = StringReplace($CmdLineRaw, $sConfig & ' ', '')
	
    Global $iDelay = $sConfig * 1000	

EndIf


AutoItWinSetTitle($CmdLineRaw)
TraySetToolTip($CmdLineRaw)
_Singleton($CmdLineRaw)





MainProcess()




#cs | FUNCTION | ============================================

	Name				_MainProcess
	Desc				

	Author				Asror Zakirov (aka Asror.Z)
	Created				23.01.2018

#ce	=========================================================
Func MainProcess()

    _Log('Executer Process Started: ' & $runCmd & ' | Delay: ' & $iDelay)

    While True

        _Log('Start Thread: ' & $runCmd & ' | Delay: ' & $iDelay)

        RunCmdRead($runCmd)

        Sleep($iDelay)

    WEnd


EndFunc   ;==>MainProcess



