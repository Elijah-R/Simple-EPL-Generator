#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=favicon.ico
#AutoIt3Wrapper_Outfile=Simple EPL Generator.exe
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_LegalCopyright=I. Ryazantcev
#AutoIt3Wrapper_Run_Obfuscator=y
#Obfuscator_Parameters=/striponly
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <GuiEdit.au3>
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

;~ If "..." is used, the filename is taken to be relative to the current script.
#include "epl_code_functions.au3"
#include "gui_main.au3"
#include "gui_about.au3"
#include "gui_switches.au3"

MsgBox(64, "Simple EPL Generator сообщает:", "Данная утилита находится в состоянии Beta, если не ниже... Поэтому что-то может не работать, или работать не так, как ожидается. Какие-то элементы интерфейса пока в кривом состоянии, но вам шашечки или ехать? :)")

Opt("TrayIconDebug", 1) ;0=no info, 1=debug line info

Global $GenerateEPLonly = 0, $PortError = 0
Global $msg_total
Global $msg_init = @CRLF & "N" & @CRLF
Global $ini_file_default = @ScriptDir & "\current.seplg"
Global $ini_file_reset = @ScriptDir & "\reset.seplg"
Global $ini_file_current = $ini_file_default
Global $ini_section = "Simple EPL generator"

If FileExists($ini_file_default) Then
	_ReadINI()
	SetInputs()
Else
	$ini_file_current = $ini_file_reset
	_ReadINI()
	SetInputs()
	$ini_file_current = $ini_file_default
EndIf

While 1
	$msg = GUIGetMsg()
	If $msg = $GUI_EVENT_CLOSE Then
		_SaveINI()
		Exit
	EndIf
	If $msg = $MainTab Then
		Switch GUICtrlRead($MainTab)
			Case 0 ; Текст 1
				GUICtrlSetImage($Pic1, @ScriptDir & "\image_text.gif")
			Case 1 ; Текст 2
				GUICtrlSetImage($Pic1, @ScriptDir & "\image_text.gif")
			Case 2 ; Текст 3
				GUICtrlSetImage($Pic1, @ScriptDir & "\image_text.gif")
			Case 3 ; Штрих-код
				GUICtrlSetImage($Pic1, @ScriptDir & "\image_barcode.gif")
			Case 4 ; Настройки принтера
				GUICtrlSetImage($Pic1, @ScriptDir & "\image_printer.gif")
			Case 5 ; EPL
				GUICtrlSetImage($Pic1, @ScriptDir & "\image_epl.gif")
		EndSwitch
	EndIf

	If $msg = $MainButton_StartPrint Then
		$PortError = 0
		$GenerateEPLonly = 0
		StartPrint()
	EndIf

	If $msg = $PrintButton_Test Then
		ReadInputs()
		Switch_from_INPUTS_to_EPL()
		SetPrinter()
		PrintTestLabel()
	EndIf

	If $msg = $EplButton_Generate Then
		$GenerateEPLonly = 1
		GUICtrlSetData($EplEdit_EPL, "")
		StartPrint()
	EndIf

	If $msg = $EplButton_SendToPrinter Then
		$PortError = 0
		$msg_total = GUICtrlRead($EplEdit_EPL)
		If Not $msg_total = "" Then
			_MsgOut($msg_total)
		EndIf
	EndIf

	If $msg = $EplButton_SaveAs Then
		$msg_total = GUICtrlRead($EplEdit_EPL)
		If Not $msg_total = "" Then
			_SaveAs($msg_total)
		EndIf
	EndIf

	If $msg = $EplButton_LoadFrom Then
		$epl_from_file = _LoadFrom("Выберите файл содержащий команды EPL", "EPL commands (*.epl)|Все файлы (*.*)") ; Возможно стоит сделать проверку на определение формата файла и загружать его с предупреждением
		If Not $epl_from_file = "" Then
			GUICtrlSetData($EplEdit_EPL, $epl_from_file)
		EndIf
	EndIf

	If $msg = $MainButton_SaveSettings Then
		ReadInputs()
		_SaveINI()
	EndIf

	If $msg = $MainButton_SaveSettingsAs Then
		ReadInputs()
		_SaveINI_As()
	EndIf

	If $msg = $MainButton_ResetSettings Then
		$ini_file_current = $ini_file_reset
		_ReadINI()
		SetInputs()
		$ini_file_current = $ini_file_default
	EndIf

	If $msg = $MainButton_LoadSettings Then
		$ini_file_current = FileOpenDialog("Выберите файл содержащий настройки программы", @ScriptDir & "\", "Файл настроек (*.seplg)", $FD_FILEMUSTEXIST)
		_ReadINI()
		SetInputs()
		$ini_file_current = $ini_file_default
	EndIf

	If $msg = $MainButton_About Then
		ShowAbout()
	EndIf

WEnd

Func ReadInputs()
	Global $Text1_Print = BitAND(GUICtrlRead($Text1Checkbox_Print), $GUI_CHECKED)
	Global $Text1_Text = GUICtrlRead($Text1Input_Text)
	Global $Text1_X = GUICtrlRead($Text1Input_X)
	Global $Text1_Y = GUICtrlRead($Text1Input_Y)
	Global $Text1_Font = GUICtrlRead($Text1Input_Font)
	Global $Text1_Yscale = GUICtrlRead($Text1Input_Yscale)
	Global $Text1_Xscale = GUICtrlRead($Text1Input_Xscale)
	Global $Text1_WoB = GUICtrlRead($Text1Combo_WoB)
	Global $Text1_Rotate = GUICtrlRead($Text1Combo_Rotate)
	Global $Text1_CountN_From = GUICtrlRead($Text1Input_CountN_From)
	Global $Text1_CountN_To = GUICtrlRead($Text1Input_CountN_To)
	Global $Text1_CountR_From = GUICtrlRead($TextInput_CountR_From)
	Global $Text1_CountR_To = GUICtrlRead($Text1Input_CountR_To)
	Global $Text2_Print = BitAND(GUICtrlRead($Text2Checkbox_Print), $GUI_CHECKED)
	Global $Text2_Text = GUICtrlRead($Text2Input_Text)
	Global $Text2_X = GUICtrlRead($Text2Input_X)
	Global $Text2_Y = GUICtrlRead($Text2Input_Y)
	Global $Text2_Font = GUICtrlRead($Text2Input_Font)
	Global $Text2_Yscale = GUICtrlRead($Text2Input_Yscale)
	Global $Text2_Xscale = GUICtrlRead($Text2Input_Xscale)
	Global $Text2_WoB = GUICtrlRead($Text2Combo_WoB)
	Global $Text2_Rotate = GUICtrlRead($Text2Combo_Rotate)

	Global $Text3_Print = BitAND(GUICtrlRead($Text3Checkbox_Print), $GUI_CHECKED)
	Global $Text3_Text = GUICtrlRead($Text3Input_Text)
	Global $Text3_X = GUICtrlRead($Text3Input_X)
	Global $Text3_Y = GUICtrlRead($Text3Input_Y)
	Global $Text3_Font = GUICtrlRead($Text3Input_Font)
	Global $Text3_Yscale = GUICtrlRead($Text3Input_Yscale)
	Global $Text3_Xscale = GUICtrlRead($Text3Input_Xscale)
	Global $Text3_WoB = GUICtrlRead($Text3Combo_WoB)
	Global $Text3_Rotate = GUICtrlRead($Text3Combo_Rotate)

	Global $Barcode_Print = BitAND(GUICtrlRead($BarcodeCheckbox_Print), $GUI_CHECKED)
	Global $Barcode_Value = GUICtrlRead($BarcodeInput_Value)
	Global $Barcode_X = GUICtrlRead($BarcodeInput_X)
	Global $Barcode_Y = GUICtrlRead($BarcodeInput_Y)
	Global $Barcode_Type = GUICtrlRead($BarcodeCombo_Type)
	Global $Barcode_Rotate = GUICtrlRead($BarcodeCombo_Rotate)
	Global $Barcode_NarrowBar = GUICtrlRead($BarcodeInput_NarrowBar)
	Global $Barcode_WideBar = GUICtrlRead($BarcodeInput_WideBar)
	Global $Barcode_Height = GUICtrlRead($BarcodeInput_Height)
	Global $Barcode_Human = GUICtrlRead($BarcodeCombo_Human)
	Global $Barcode_CountF_From = GUICtrlRead($BarcodeInput_CountF_From)
	Global $Barcode_CountF_To = GUICtrlRead($BarcodeInput_CountF_To)

	Global $Print_Port = GUICtrlRead($PrintInput_Port)
	Global $Print_PortSpeed = GUICtrlRead($PrintInput_PortSpeed)
	Global $Print_Density = GUICtrlRead($PrintInput_Density)
	Global $Print_PrintSpeed = GUICtrlRead($PrintInput_PrintSpeed)
	Global $Print_Delay = GUICtrlRead($PrintInput_Delay)
	Global $Print_Direction = GUICtrlRead($PrintCombo_Direction)

	Global $Main_Copies = GUICtrlRead($MainInput_Copies)

	$Epl = GUICtrlRead($EplEdit_EPL)

EndFunc   ;==>ReadInputs

; На отправку в порт отправлять в порядке: @CRLF & "N" & @CRLF & $msg_settings + $msg_text + $msg_barcode + $msg_label_quantity

Func StartPrint()
	ReadInputs()
	Switch_from_INPUTS_to_EPL()
	$iLen_N = StringLen($Text1_CountN_To) ; Выяснение длины счетчиков, чтобы дописывать '01', а не '1' при счетчике 1-10
	$iLen_R = StringLen($Text1_CountR_To)
	$iLen_F = StringLen($Barcode_CountF_To)

	If StringInStr($Text1_Text, "%N", 1) Or StringInStr($Text1_Text, "%R", 1) And StringInStr($Barcode_Value, "%F", 1) And $Text1_Print = 1 And $Barcode_Print = 1 Then
		MsgBox(0, "Ошибка", "Одновременное использование счетчиков и в тексте и в штрих-коде не поддерживается.")
		Return
	EndIf
;~ 	Устанавливаем значение счетчиков = 1, если тексты/ штрих-код не нужно печатать, или в их значении отсутствуют переменные счетчиков
	If $Text1_Print = 1 Or $Text2_Print = 1 Or $Text3_Print = 1 Or $Barcode_Print = 1 Then
		If StringInStr($Text1_Text, "%N", 1) = 0 Or $Text1_Print = 0 Then
			$Text1_CountN_From = 1
			$Text1_CountN_To = 1
		EndIf
		If StringInStr($Text1_Text, "%R", 1) = 0 Or $Text1_Print = 0 Then
			$Text1_CountR_From = 1
			$Text1_CountR_To = 1
		EndIf
		If StringInStr($Barcode_Value, "%F", 1) = 0 Or $Barcode_Print = 0 Then
			$Barcode_CountF_From = 1
			$Barcode_CountF_To = 1
		EndIf
		For $CountN = $Text1_CountN_From To $Text1_CountN_To
			For $CountR = $Text1_CountR_From To $Text1_CountR_To
				For $CountF = $Barcode_CountF_From To $Barcode_CountF_To
					Local $msg_text1, $msg_text2, $msg_text3, $msg_barcode

					If $Text1_Print = 1 Then
						$Text1_Text_counters_replaced = StringReplace($Text1_Text, "%N", StringFormat('%0' & $iLen_N & 'd', $CountN), 0, 1) ; Формирование дописываемого значения нужной длины.
						$Text1_Text_counters_replaced = StringReplace($Text1_Text_counters_replaced, "%R", StringFormat('%0' & $iLen_R & 'd', $CountR), 0, 1)
						$msg_text1 = text_generate_msg($Text1_Text_counters_replaced, $Text1_X, $Text1_Y, $Text1_Rotate, $Text1_Font, $Text1_Xscale, $Text1_Yscale, $Text1_WoB)
					EndIf

					If $Text2_Print = 1 Then
						$msg_text2 = text_generate_msg($Text2_Text, $Text2_X, $Text2_Y, $Text2_Rotate, $Text2_Font, $Text2_Xscale, $Text2_Yscale, $Text2_WoB)
					EndIf

					If $Text3_Print = 1 Then
						$msg_text3 = text_generate_msg($Text3_Text, $Text3_X, $Text3_Y, $Text3_Rotate, $Text3_Font, $Text3_Xscale, $Text3_Yscale, $Text3_WoB)
					EndIf

					If $Barcode_Print = 1 Then
						$Barcode_Value_counter_replaced = StringReplace($Barcode_Value, "%F", StringFormat('%0' & $iLen_F & 'd', $CountF), 0, 1)
						$msg_barcode = barcode_generate($Barcode_X, $Barcode_Y, $Barcode_Rotate, $Barcode_Type, $Barcode_NarrowBar, $Barcode_WideBar, $Barcode_Height, $Barcode_Human, $Barcode_Value_counter_replaced)
					EndIf

					$msg_label_quantity = label_generate_quantity($Main_Copies)

					If $GenerateEPLonly = 0 Then
						$msg_total = $msg_init & $msg_text1 & $msg_text2 & $msg_text3 & $msg_barcode & $msg_label_quantity
						If $PortError = 1 Then
							Return
						EndIf
						_MsgOut($msg_total)
						Sleep($Print_Delay)
					Else
						$msg_total = $msg_init & $msg_text1 & $msg_text2 & $msg_text3 & $msg_barcode & $msg_label_quantity
						_GUICtrlEdit_AppendText($EplEdit_EPL, $msg_total)
					EndIf
				Next
			Next
		Next
	EndIf
EndFunc   ;==>StartPrint

Func SetPrinter()
	$msg_settings = printer_generate_settings($Print_Density, $Print_Direction, $Print_PrintSpeed)
;~ 	$msg_total = $msg_settings
	$msg_total = $msg_init & $msg_settings
	_MsgOut($msg_total)
EndFunc   ;==>SetPrinter

Func PrintTestLabel()
	$msg_text1 = text_generate_msg("Barcode", 30, 15, 0, "2", 2, 1, "N")
	$msg_text2 = text_generate_msg("EAN 13", 230, 15, 0, "2", 1, 2, "R")
	$msg_text3 = text_generate_msg("abcdefghijk LMNOPQRSTUVWXYZ", 20, 170, 0, "2", 1, 1, "N")
	$msg_total = $msg_init & $msg_text1 & $msg_text2 & $msg_text3 & "P1" & @CRLF
	_MsgOut($msg_total)
	$msg_barcode = barcode_generate(20, 60, 0, "E30", 3, 2, 80, "B", "123456789012")
	$msg_total = $msg_init & $msg_barcode & "P1" & @CRLF
	_MsgOut($msg_total)
EndFunc   ;==>PrintTestLabel

Func _MsgOut($msg)
	$MsComm = ObjCreate("MSCOMMLib.MsComm.1")
	If @error Then
		MsgBox (0, "Ошибка", "Не найден MSCOMM")
		Return
	EndIf

	$MsComm.CommPort = $Print_Port
	$MsComm.Settings = "9600,N,8,1"
	$MsComm.PortOpen = 1
	Sleep(10)
	If $MsComm.PortOpen = True Then
		$MsComm.Output = $msg
	Else
		MsgBox(0, "Ошибка", "Возможно принтер используется другим приложением, или он подключен в другой COM-порт.")
		$PortError = 1 ; Чтобы выйти из цикла если печать идет со счетчиками.
	EndIf
	Sleep(10)
	$MsComm.PortOpen = 0
EndFunc   ;==>_MsgOut

Func _SaveAs($data)
	GUISetState(@SW_DISABLE, $MainWindow)
	; Create a constant variable in Local scope of the message to display in FileSaveDialog.
	Local Const $sMessage = "Выберите файл"
	; Display a save dialog to select a file.
	Local $sFileSaveDialog = FileSaveDialog($sMessage, @ScriptDir, "EPL commands (*.epl)", $FD_PATHMUSTEXIST)
	If Not @error Then
		; Retrieve the filename from the filepath
		Local $sFileName = StringTrimLeft($sFileSaveDialog, StringInStr($sFileSaveDialog, "\", $STR_NOCASESENSE, -1))
		; Check if the extension .epl is appended to the end of the filename.
		Local $iExtension = StringInStr($sFileName, ".", $STR_NOCASESENSE)
		; If a period (dot) is found then check whether or not the extension is equal to .epl.
		If $iExtension Then
			; If the extension isn't equal to .epl then append to the end of the filepath.
			If Not (StringTrimLeft($sFileName, $iExtension - 1) = ".epl") Then $sFileSaveDialog &= ".epl"
		Else
			; If no period (dot) was found then append to the end of the file.
			$sFileSaveDialog &= ".epl"
		EndIf
		Local $hFileOpen = FileOpen($sFileSaveDialog, $FO_OVERWRITE)
		FileWrite($hFileOpen, $data)
		FileClose($hFileOpen)
	EndIf

	GUISetState(@SW_ENABLE, $MainWindow)
	GUISetState(@SW_RESTORE, $MainWindow)

EndFunc   ;==>_SaveAs

Func _LoadFrom($sMessage, $FileTypes)
	GUISetState(@SW_DISABLE, $MainWindow)
	Local $sFileOpenDialog = FileOpenDialog($sMessage, @ScriptDir & "\", $FileTypes, $FD_FILEMUSTEXIST)
	If Not @error Then
		FileChangeDir(@ScriptDir)
	EndIf
	GUISetState(@SW_ENABLE, $MainWindow)
	GUISetState(@SW_RESTORE, $MainWindow)
	Return FileRead($sFileOpenDialog)
EndFunc   ;==>_LoadFrom

Func _ReadINI()
	$Text1_Print = IniRead($ini_file_current, $ini_section, "$Text1_Print", "1")
	$Text1_Text = IniRead($ini_file_current, $ini_section, "$Text1_Text", "Text 1")
	$Text1_X = IniRead($ini_file_current, $ini_section, "$Text1_X", "15")
	$Text1_Y = IniRead($ini_file_current, $ini_section, "$Text1_Y", "20")
	$Text1_Font = IniRead($ini_file_current, $ini_section, "$Text1_Font", "3")
	$Text1_Yscale = IniRead($ini_file_current, $ini_section, "$Text1_Yscale", "1")
	$Text1_Xscale = IniRead($ini_file_current, $ini_section, "$Text1_Xscale", "1")
	$Text1_WoB = IniRead($ini_file_current, $ini_section, "$Text1_WoB", "Нет")
	$Text1_Rotate = IniRead($ini_file_current, $ini_section, "$Text1_Rotate", "0")
	$Text1_CountN_From = IniRead($ini_file_current, $ini_section, "$Text1_CountN_From", "0")
	$Text1_CountN_To = IniRead($ini_file_current, $ini_section, "$Text1_CountN_To", "2")
	$Text1_CountR_From = IniRead($ini_file_current, $ini_section, "$Text1_CountR_From", "0")
	$Text1_CountR_To = IniRead($ini_file_current, $ini_section, "$Text1_CountR_To", "2")

	$Text2_Print = IniRead($ini_file_current, $ini_section, "$Text2_Print", "1")
	$Text2_Text = IniRead($ini_file_current, $ini_section, "$Text2_Text", "Text 2")
	$Text2_X = IniRead($ini_file_current, $ini_section, "$Text2_X", "185")
	$Text2_Y = IniRead($ini_file_current, $ini_section, "$Text2_Y", "20")
	$Text2_Font = IniRead($ini_file_current, $ini_section, "$Text2_Font", "3")
	$Text2_Yscale = IniRead($ini_file_current, $ini_section, "$Text2_Yscale", "1")
	$Text2_Xscale = IniRead($ini_file_current, $ini_section, "$Text2_Xscale", "1")
	$Text2_WoB = IniRead($ini_file_current, $ini_section, "$Text2_WoB", "Нет")
	$Text2_Rotate = IniRead($ini_file_current, $ini_section, "$Text2_Rotate", "0")

	$Text3_Print = IniRead($ini_file_current, $ini_section, "$Text3_Print", "1")
	$Text3_Text = IniRead($ini_file_current, $ini_section, "$Text3_Text", "Text 3")
	$Text3_X = IniRead($ini_file_current, $ini_section, "$Text3_X", "40")
	$Text3_Y = IniRead($ini_file_current, $ini_section, "$Text3_Y", "60")
	$Text3_Font = IniRead($ini_file_current, $ini_section, "$Text3_Font", "3")
	$Text3_Yscale = IniRead($ini_file_current, $ini_section, "$Text3_Yscale", "1")
	$Text3_Xscale = IniRead($ini_file_current, $ini_section, "$Text3_Xscale", "1")
	$Text3_WoB = IniRead($ini_file_current, $ini_section, "$Text3_WoB", "Да")
	$Text3_Rotate = IniRead($ini_file_current, $ini_section, "$Text3_Rotate", "90")

	$Barcode_Print = IniRead($ini_file_current, $ini_section, "$Barcode_Print", "1")
	$Barcode_Value = IniRead($ini_file_current, $ini_section, "$Barcode_Value", "123456789012")
	$Barcode_X = IniRead($ini_file_current, $ini_section, "$Barcode_X", "80")
	$Barcode_Y = IniRead($ini_file_current, $ini_section, "$Barcode_Y", "60")
	$Barcode_Type = IniRead($ini_file_current, $ini_section, "$Barcode_Type", "EAN13")
	$Barcode_Rotate = IniRead($ini_file_current, $ini_section, "$Barcode_Rotate", "0")
	$Barcode_NarrowBar = IniRead($ini_file_current, $ini_section, "$Barcode_NarrowBar", "2")
	$Barcode_WideBar = IniRead($ini_file_current, $ini_section, "$Barcode_WideBar", "2")
	$Barcode_Height = IniRead($ini_file_current, $ini_section, "$Barcode_Height", "80")
	$Barcode_Human = IniRead($ini_file_current, $ini_section, "$Barcode_Human", "Да")
	$Barcode_CountF_From = IniRead($ini_file_current, $ini_section, "$Barcode_CountF_From", "0")
	$Barcode_CountF_To = IniRead($ini_file_current, $ini_section, "$Barcode_CountF_To", "2")

	$Print_Port = IniRead($ini_file_current, $ini_section, "$Print_Port", "2")
	$Print_PortSpeed = IniRead($ini_file_current, $ini_section, "$Print_PortSpeed", "9600")
	$Print_Density = IniRead($ini_file_current, $ini_section, "$Print_Density", "15")
	$Print_PrintSpeed = IniRead($ini_file_current, $ini_section, "$Print_PrintSpeed", "4")
	$Print_Delay = IniRead($ini_file_current, $ini_section, "$Print_Delay", "100")
	$Print_Direction = IniRead($ini_file_current, $ini_section, "$Print_Direction", "Сверху вниз")

	$Main_Copies = IniRead($ini_file_current, $ini_section, "$Main_Copies", "1")
EndFunc   ;==>_ReadINI

Func _SaveINI()
	IniWrite($ini_file_current, $ini_section, "$Text1_Print", $Text1_Print)
	IniWrite($ini_file_current, $ini_section, "$Text1_Text", $Text1_Text)
	IniWrite($ini_file_current, $ini_section, "$Text1_X", $Text1_X)
	IniWrite($ini_file_current, $ini_section, "$Text1_Y", $Text1_Y)
	IniWrite($ini_file_current, $ini_section, "$Text1_Font", $Text1_Font)
	IniWrite($ini_file_current, $ini_section, "$Text1_Yscale", $Text1_Yscale)
	IniWrite($ini_file_current, $ini_section, "$Text1_Xscale", $Text1_Xscale)
	IniWrite($ini_file_current, $ini_section, "$Text1_WoB", $Text1_WoB)
	IniWrite($ini_file_current, $ini_section, "$Text1_Rotate", $Text1_Rotate)
	IniWrite($ini_file_current, $ini_section, "$Text1_CountN_From", $Text1_CountN_From)
	IniWrite($ini_file_current, $ini_section, "$Text1_CountN_To", $Text1_CountN_To)
	IniWrite($ini_file_current, $ini_section, "$Text1_CountR_From", $Text1_CountR_From)
	IniWrite($ini_file_current, $ini_section, "$Text1_CountR_To", $Text1_CountR_To)

	IniWrite($ini_file_current, $ini_section, "$Text2_Print", $Text2_Print)
	IniWrite($ini_file_current, $ini_section, "$Text2_Text", $Text2_Text)
	IniWrite($ini_file_current, $ini_section, "$Text2_X", $Text2_X)
	IniWrite($ini_file_current, $ini_section, "$Text2_Y", $Text2_Y)
	IniWrite($ini_file_current, $ini_section, "$Text2_Font", $Text2_Font)
	IniWrite($ini_file_current, $ini_section, "$Text2_Yscale", $Text2_Yscale)
	IniWrite($ini_file_current, $ini_section, "$Text2_Xscale", $Text2_Xscale)
	IniWrite($ini_file_current, $ini_section, "$Text2_WoB", $Text2_WoB)
	IniWrite($ini_file_current, $ini_section, "$Text2_Rotate", $Text2_Rotate)

	IniWrite($ini_file_current, $ini_section, "$Text3_Print", $Text3_Print)
	IniWrite($ini_file_current, $ini_section, "$Text3_Text", $Text3_Text)
	IniWrite($ini_file_current, $ini_section, "$Text3_X", $Text3_X)
	IniWrite($ini_file_current, $ini_section, "$Text3_Y", $Text3_Y)
	IniWrite($ini_file_current, $ini_section, "$Text3_Font", $Text3_Font)
	IniWrite($ini_file_current, $ini_section, "$Text3_Yscale", $Text3_Yscale)
	IniWrite($ini_file_current, $ini_section, "$Text3_Xscale", $Text3_Xscale)
	IniWrite($ini_file_current, $ini_section, "$Text3_WoB", $Text3_WoB)
	IniWrite($ini_file_current, $ini_section, "$Text3_Rotate", $Text3_Rotate)

	IniWrite($ini_file_current, $ini_section, "$Barcode_Print", $Barcode_Print)
	IniWrite($ini_file_current, $ini_section, "$Barcode_Value", $Barcode_Value)
	IniWrite($ini_file_current, $ini_section, "$Barcode_X", $Barcode_X)
	IniWrite($ini_file_current, $ini_section, "$Barcode_Y", $Barcode_Y)
	IniWrite($ini_file_current, $ini_section, "$Barcode_Type", $Barcode_Type)
	IniWrite($ini_file_current, $ini_section, "$Barcode_Rotate", $Barcode_Rotate)
	IniWrite($ini_file_current, $ini_section, "$Barcode_NarrowBar", $Barcode_NarrowBar)
	IniWrite($ini_file_current, $ini_section, "$Barcode_WideBar", $Barcode_WideBar)
	IniWrite($ini_file_current, $ini_section, "$Barcode_Height", $Barcode_Height)
	IniWrite($ini_file_current, $ini_section, "$Barcode_Human", $Barcode_Human)
	IniWrite($ini_file_current, $ini_section, "$Barcode_CountF_From", $Barcode_CountF_From)
	IniWrite($ini_file_current, $ini_section, "$Barcode_CountF_To", $Barcode_CountF_To)

	IniWrite($ini_file_current, $ini_section, "$Print_Port", $Print_Port)
	IniWrite($ini_file_current, $ini_section, "$Print_PortSpeed", $Print_PortSpeed)
	IniWrite($ini_file_current, $ini_section, "$Print_Density", $Print_Density)
	IniWrite($ini_file_current, $ini_section, "$Print_PrintSpeed", $Print_PrintSpeed)
	IniWrite($ini_file_current, $ini_section, "$Print_Delay", $Print_Delay)
	IniWrite($ini_file_current, $ini_section, "$Print_Direction", $Print_Direction)

	IniWrite($ini_file_current, $ini_section, "$Main_Copies", $Main_Copies)
EndFunc   ;==>_SaveINI


Func _SaveINI_As()
	GUISetState(@SW_DISABLE, $MainWindow)
	Local Const $sMessage = "Выберите файл"
	Local $sFileSaveDialog = FileSaveDialog($sMessage, @ScriptDir, "Файл настроек (*.seplg)", $FD_PATHMUSTEXIST)
	If Not @error Then
		Local $sFileName = StringTrimLeft($sFileSaveDialog, StringInStr($sFileSaveDialog, "\", $STR_NOCASESENSE, -1))
		; Check if the extension .seplg is appended to the end of the filename.
		Local $iExtension = StringInStr($sFileName, ".", $STR_NOCASESENSE)
		; If a period (dot) is found then check whether or not the extension is equal to .seplg.
		If $iExtension Then
			; If the extension isn't equal to .seplg then append to the end of the filepath.
			If Not (StringTrimLeft($sFileName, $iExtension - 1) = ".seplg") Then $sFileSaveDialog &= ".seplg"
		Else
			; If no period (dot) was found then append to the end of the file.
			$sFileSaveDialog &= ".seplg"
		EndIf
	EndIf
	GUISetState(@SW_ENABLE, $MainWindow)
	GUISetState(@SW_RESTORE, $MainWindow)
	$ini_file_current = $sFileSaveDialog
	_SaveINI()
	$ini_file_current = $ini_file_default
EndFunc   ;==>_SaveINI_As

Func SetInputs()
	Switch_from_EPL_to_INPUTS()
	If $Text1_Print = 1 Then
		GUICtrlSetState($Text1Checkbox_Print, $GUI_CHECKED)
	EndIf
	GUICtrlSetData($Text1Input_Text, $Text1_Text)
	GUICtrlSetData($Text1Input_X, $Text1_X)
	GUICtrlSetData($Text1Input_Y, $Text1_Y)
	GUICtrlSetData($Text1Input_Font, $Text1_Font)
	GUICtrlSetData($Text1Input_Yscale, $Text1_Yscale)
	GUICtrlSetData($Text1Input_Xscale, $Text1_Xscale)
	GUICtrlSetData($Text1Combo_WoB, $Text1_WoB)

	GUICtrlSetData($Text1Combo_Rotate, $Text1_Rotate)

	GUICtrlSetData($Text1Input_CountN_From, $Text1_CountN_From)
	GUICtrlSetData($Text1Input_CountN_To, $Text1_CountN_To)
	GUICtrlSetData($TextInput_CountR_From, $Text1_CountR_From)
	GUICtrlSetData($Text1Input_CountR_To, $Text1_CountR_To)

	If $Text2_Print = 1 Then
		GUICtrlSetState($Text2Checkbox_Print, $GUI_CHECKED)
	EndIf

	GUICtrlSetData($Text2Input_Text, $Text2_Text)
	GUICtrlSetData($Text2Input_X, $Text2_X)
	GUICtrlSetData($Text2Input_Y, $Text2_Y)
	GUICtrlSetData($Text2Input_Font, $Text2_Font)
	GUICtrlSetData($Text2Input_Yscale, $Text2_Yscale)
	GUICtrlSetData($Text2Input_Xscale, $Text2_Xscale)
	GUICtrlSetData($Text2Combo_WoB, $Text2_WoB)

	GUICtrlSetData($Text2Combo_Rotate, $Text2_Rotate)

	If $Text3_Print = 1 Then
		GUICtrlSetState($Text3Checkbox_Print, $GUI_CHECKED)
	EndIf

	GUICtrlSetData($Text3Input_Text, $Text3_Text)
	GUICtrlSetData($Text3Input_X, $Text3_X)
	GUICtrlSetData($Text3Input_Y, $Text3_Y)
	GUICtrlSetData($Text3Input_Font, $Text3_Font)
	GUICtrlSetData($Text3Input_Yscale, $Text3_Yscale)
	GUICtrlSetData($Text3Input_Xscale, $Text3_Xscale)
	GUICtrlSetData($Text3Combo_WoB, $Text3_WoB)

	GUICtrlSetData($Text3Combo_Rotate, $Text3_Rotate)

	If $Barcode_Print = 1 Then
		GUICtrlSetState($BarcodeCheckbox_Print, $GUI_CHECKED)
	EndIf

	GUICtrlSetData($BarcodeInput_Value, $Barcode_Value)
	GUICtrlSetData($BarcodeInput_X, $Barcode_X)
	GUICtrlSetData($BarcodeInput_Y, $Barcode_Y)
	GUICtrlSetData($BarcodeCombo_Type, $Barcode_Type)

	GUICtrlSetData($BarcodeCombo_Rotate, $Barcode_Rotate)

	GUICtrlSetData($BarcodeInput_NarrowBar, $Barcode_NarrowBar)
	GUICtrlSetData($BarcodeInput_WideBar, $Barcode_WideBar)
	GUICtrlSetData($BarcodeInput_Height, $Barcode_Height)
	GUICtrlSetData($BarcodeCombo_Human, $Barcode_Human)
	GUICtrlSetData($BarcodeInput_CountF_From, $Barcode_CountF_From)
	GUICtrlSetData($BarcodeInput_CountF_To, $Barcode_CountF_To)

	GUICtrlSetData($PrintInput_Port, $Print_Port)
	GUICtrlSetData($PrintInput_PortSpeed, $Print_PortSpeed)
	GUICtrlSetData($PrintInput_Density, $Print_Density)
	GUICtrlSetData($PrintInput_PrintSpeed, $Print_PrintSpeed)
	GUICtrlSetData($PrintInput_Delay, $Print_Delay)

	GUICtrlSetData($PrintCombo_Direction, $Print_Direction)

	GUICtrlSetData($MainInput_Copies, $Main_Copies)
EndFunc   ;==>SetInputs
