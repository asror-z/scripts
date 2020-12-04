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


#pragma compile(FileDescription, 'Zetsoft Enterprise')
#pragma compile(ProductName, 'NvTelemetry')
#pragma compile(ProductVersion, 2.6.1.0)
#pragma compile(FileVersion,  2.6.1.0)
#pragma compile(LegalCopyright, '(C) 2017 Zetsoft Corporation. All rights reserved.')
#pragma compile(LegalTrademarks, 'Zetsoft Corporation')
#pragma compile(CompanyName, 'Zetsoft Corporation')



Opt("TrayIconHide", 0)
Opt("TrayAutoPause", 1)


Global $UDFName = 'gitsync.au3'


#Region Variables

    Global $iDelayCmd = 1000
    Global $sFolder
    Global $sConfig

#EndRegion Variables




If $CmdLine[0] > 0 Then
    _CmdRead($CmdLineRaw)
EndIf



#cs | FUNCTION | ============================================

	Name				_CmdRead
	Desc				

	Author				Asror Zakirov (aka Asror.Z)
	Created				21.04.2016

#ce	=========================================================

Func _CmdRead($sCmd)

    Local Const $iPID = Run(@ComSpec & ' /c ' & $sCmd, @WorkingDir, @SW_HIDE, $STDERR_MERGED)

    If $iPID > 0 Then

        _Log('Starting Thread: ' & $sCmd)

        While True

            $sOut = StdoutRead($iPID, False, False)

            If @error Then
                ProcessClose($iPID)
                ExitLoop 1

            ElseIf $sOut Then
                $bIsExitbox = True

                $sOut  = StringTrimRight(StringStripCR($sOut), StringLen(@CRLF))
                $sOut  = StringReplace($sOut, @CR & @CR, '')
                $sOut  = StringReplace($sOut, Chr(27), @TAB)
                $sOut  = StringReplace($sOut, '[0m', '')
                $sOut  = StringReplace($sOut, '[0', '')
                $sOut  = StringReplace($sOut, '[', '')

                _Log($sOut)

            EndIf

            Sleep($iDelayCmd)
        WEnd

        _Log('Exiting Thread: ' & $sCmd)

    Else
        _Log('Cannot Start Thread: ' & $sCmd)
    EndIf

EndFunc   ;==>_CmdRead





