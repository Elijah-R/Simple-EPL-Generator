Global $Text1_Print, $Text1_Text, $Text1_X, $Text1_Y, $Text1_Font, $Text1_Yscale, $Text1_Xscale, $Text1_WoB, $Text1_Rotate, $Text1_CountN_From, $Text1_CountN_To
Global $Text1_CountR_From, $Text1_CountR_To, $Text2_Print, $Text2_Text, $Text2_X, $Text2_Y, $Text2_Font, $Text2_Yscale, $Text2_Xscale, $Text2_WoB, $Text2_Rotate, $Text3_Print
Global $Text3_Text, $Text3_X, $Text3_Y, $Text3_Font, $Text3_Yscale, $Text3_Xscale, $Text3_WoB, $Text3_Rotate, $Barcode_Print, $Barcode_Value, $Barcode_X, $Barcode_Y
Global $Barcode_Type, $Barcode_Rotate, $Barcode_NarrowBar, $Barcode_WideBar, $Barcode_Height, $Barcode_Human, $Barcode_CountF_From, $Barcode_CountF_To, $Print_Port
Global $Print_PortSpeed, $Print_Density, $Print_PrintSpeed, $Print_Delay, $Print_Direction, $Main_Copies

Func Switch_from_INPUTS_to_EPL()
	Switch $Text1_WoB
		Case "Нет"
			$Text1_WoB = "N"
		Case "Да"
			$Text1_WoB = "R"
	EndSwitch
	Switch $Text1_Rotate
		Case 0
			$Text1_Rotate = 0
		Case 90
			$Text1_Rotate = 1
		Case 180
			$Text1_Rotate = 2
		Case 270
			$Text1_Rotate = 3
	EndSwitch
	Switch $Text2_WoB
		Case "Нет"
			$Text2_WoB = "N"
		Case "Да"
			$Text2_WoB = "R"
	EndSwitch
	Switch $Text2_Rotate
		Case 0
			$Text2_Rotate = 0
		Case 90
			$Text2_Rotate = 1
		Case 180
			$Text2_Rotate = 2
		Case 270
			$Text2_Rotate = 3
	EndSwitch
	Switch $Text3_WoB
		Case "Нет"
			$Text3_WoB = "N"
		Case "Да"
			$Text3_WoB = "R"
	EndSwitch
	Switch $Text3_Rotate
		Case 0
			$Text3_Rotate = 0
		Case 90
			$Text3_Rotate = 1
		Case 180
			$Text3_Rotate = 2
		Case 270
			$Text3_Rotate = 3
	EndSwitch
	Switch $Barcode_Type
		Case "EAN13"
			$Barcode_Type = "E30"
		Case "EAN8"
			$Barcode_Type = "E80"
		Case "UPC A"
			$Barcode_Type = "UA0"
		Case "UPC E"
			$Barcode_Type = "UE0"
	EndSwitch
	Switch $Barcode_Rotate
		Case 0
			$Barcode_Rotate = 0
		Case 90
			$Barcode_Rotate = 1
		Case 180
			$Barcode_Rotate = 2
		Case 270
			$Barcode_Rotate = 3
	EndSwitch
	Switch $Barcode_Human
		Case "Нет"
			$Barcode_Human = "N"
		Case "Да"
			$Barcode_Human = "B"
	EndSwitch
	Switch $Print_Direction
		Case "Сверху вниз"
			$Print_Direction = "T"
		Case "Снизу вверх"
			$Print_Direction = "B"
	EndSwitch
EndFunc   ;==>Switch_from_INPUTS_to_EPL

Func Switch_from_EPL_to_INPUTS()
	Switch $Text1_WoB
		Case "N"
			$Text1_WoB = "Нет"
		Case "B"
			$Text1_WoB = "Да"
	EndSwitch
	Switch $Text1_Rotate
		Case 0
			$Text1_Rotate = 0
		Case 1
			$Text1_Rotate = 90
		Case 2
			$Text1_Rotate = 180
		Case 3
			$Text1_Rotate = 270
	EndSwitch
	Switch $Text2_WoB
		Case "N"
			$Text2_WoB = "Нет"
		Case "R"
			$Text2_WoB = "Да"
	EndSwitch
	Switch $Text2_Rotate
		Case 0
			$Text2_Rotate = 0
		Case 1
			$Text2_Rotate = 90
		Case 2
			$Text2_Rotate = 180
		Case 3
			$Text2_Rotate = 270
	EndSwitch
	Switch $Text3_WoB
		Case "N"
			$Text3_WoB = "Нет"
		Case "R"
			$Text3_WoB = "Да"
	EndSwitch
	Switch $Text3_Rotate
		Case 0
			$Text3_Rotate = 0
		Case 1
			$Text3_Rotate = 90
		Case 2
			$Text3_Rotate = 180
		Case 3
			$Text3_Rotate = 270
	EndSwitch
	Switch $Barcode_Type
		Case "E30"
			$Barcode_Type = "EAN13"
		Case "E80"
			$Barcode_Type = "EAN8"
		Case "UA0"
			$Barcode_Type = "UPC A"
		Case "UE0"
			$Barcode_Type = "UPC E"
	EndSwitch
	Switch $Barcode_Rotate
		Case 0
			$Barcode_Rotate = 0
		Case 1
			$Barcode_Rotate = 90
		Case 2
			$Barcode_Rotate = 180
		Case 3
			$Barcode_Rotate = 270
	EndSwitch
	Switch $Barcode_Human
		Case "N"
			$Barcode_Human = "Нет"
		Case "B"
			$Barcode_Human = "Да"
	EndSwitch
	Switch $Print_Direction
		Case "T"
			$Print_Direction = "Сверху вниз"
		Case "B"
			$Print_Direction = "Снизу вверх"
	EndSwitch
EndFunc   ;==>Switch_from_EPL_to_INPUTS
