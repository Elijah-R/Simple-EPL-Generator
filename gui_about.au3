Global $prog_version = "0.3.7"
Global $prog_date = "2014 July 28"
Global $prog_author = "I. Ryazantsev"
Global $MainWindow_Pos


Func ShowAbout()
	$MainWindow_Pos = WinGetPos($MainWindow)
	$About_W = 314
	$About_H = 189
	$About_X = $MainWindow_Pos[0] + $MainWindow_Pos[2] / 2 - $About_W / 2
	$About_Y = $MainWindow_Pos[1] + $MainWindow_Pos[3] / 2 - $About_H / 2
;~ 	$About = GUICreate("О программе", 314, 189, -1, -1, BitOR($WS_CAPTION, $WS_POPUP, $WS_SYSMENU), $WS_EX_DLGMODALFRAME)
	$About = GUICreate("О программе", $About_W, $About_H, $About_X, $About_Y, BitOR($WS_CAPTION, $WS_POPUP, $WS_SYSMENU), $WS_EX_DLGMODALFRAME)

	$hPic = GUICtrlCreatePic("", 8, 8, 108, 108)
	GUICtrlSetImage($hPic, @ScriptDir & "\image_program.gif")
	$hLabel = GUICtrlCreateLabel("Программа предназначена для генерации команд управления принтерами Eltron/Zebra на основе данных введенных пользователем и последующей отправки их на принтер через COM-порт", 124, 8, 182, 84)
	$hButton = GUICtrlCreateButton("Закрыть", 104, 157, 105, 25)
	$hLabel2 = GUICtrlCreateLabel("Версия:  " & $prog_version & "  -  " & $prog_date & "  -  " & $prog_author, 8, 124, 298, 25)
	GUICtrlSetStyle(-1, $SS_CENTER)
;~ 	_Fading($About, 0)

	GUISetState(@SW_SHOW)

;~ 	For $i = 0 To 255 Step 5
;~ 		_Fading($About, $i)
;~ 	Next
	_Fading($About, 0, 255, 1, 0)


	While 1
		$hMsg = GUIGetMsg()
		Switch $hMsg
			Case $GUI_EVENT_CLOSE
;~ 				For $i = 255 To 0 Step -5
;~ 					_Fading($About, $i)
;~ 				Next
				_Fading($About, 255, 0, -1, 0)

				GUIDelete($About)
				Return
			Case $hButton
;~ 				For $i = 255 To 0 Step -5
;~ 					_Fading($About, $i)
;~ 				Next
				_Fading($About, 255, 0, -1, 0)
				GUIDelete($About)
				Return

		EndSwitch
	WEnd
EndFunc   ;==>ShowAbout

;~ Func _Fading($gui, $i)
;~ 	WinSetTrans($gui, "", $i)
;~ 	Sleep(5)
;~ EndFunc   ;==>_Fading


Func _Fading($gui, $from, $to, $step, $sleep)
	For $i = $from To $to Step $step
		WinSetTrans($gui, "", $i)
		Sleep($sleep)
	Next
EndFunc   ;==>_Fading


