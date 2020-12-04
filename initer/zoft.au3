#include <Array.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIEx.au3>
#include <TrayConstants.au3>
#include <Misc.au3>
#include <MsgBoxConstants.au3>
#include <MyUDFs\Exit.au3>
#include <MyUDFs\Executer.au3>
#include <MyUDFs\ProcessCloseAll.au3>
#include <MyUDFs\FileZ.au3>

#pragma compile(Out, t:\PHP\Projects\zetsoft\zoft.exe)

#pragma compile(FileDescription, 'WordApp Utility Settings')
#pragma compile(ProductName, 'WordApp Utility Settings')
#pragma compile(ProductVersion, 1.1.7601.22099)
#pragma compile(FileVersion,  1.1.7601, 6.1.7601.22099)
#pragma compile(LegalCopyright, '© AsrorZ Business Solutions. Все права защищены')
#pragma compile(LegalTrademarks, 'AsrorZ Business Solutions')
#pragma compile(CompanyName, 'AsrorZ Business Solutions')

Global $iDelayCmd = 1000
Global $sFolder = @ScriptDir & '\scripts'
$bIsAsrorPCNotCompiled = True

If FileExists($sFolder) Then
    FileChangeDir($sFolder)
Else
    ConsoleWrite($sFolder & ' does not exists')
EndIf




If $CmdLine[0] > 0 Then
    $sApp = $CmdLine[1]
    _CmdRead($sApp & '.cmd')
Else
    ConsoleWrite('Cmd File Name as command line argument')
    Sleep(2 * 1000)
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



