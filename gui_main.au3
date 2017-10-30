#include-once

Global $Text_Counters_Tooltip = '������: ��� ������ ����� �������� � ��������:' & @CRLF & _
		'   A1-B1, A1-B2, A1-B3, A2-B1, A2-B2, A1-B3' & @CRLF & _
		'������� � ���� "����� ��� ������":' & @CRLF & _
		'   A%N-B%R' & @CRLF & _
		'� � ���� ���������:' & @CRLF & _
		'   1 - 2 ��� ������� � 1 - 3 ��� �������.' & @CRLF & _
		'������� ������������� ���������� ��� ������� � ������ ��������:' & @CRLF & _
		'   %N   �/���   %R'

Global $Barcode_Counter_Tooltip = '��� ������ �����-���� � ���������������' & @CRLF & _
		'��������� �� ������ ��������� ��������' & @CRLF & _
		'����������� �������, ������:' & @CRLF & _
		'   ������� "12345678901%F" � ���� "�������� �����-����",' & @CRLF & _
		'   � � ���� ��������: 1 - 5,' & @CRLF & _
		'   ����� ���������� 5 ��������: 123456789011, 123456789012, 123456789013 � �.�.' & @CRLF & _
		'������� ������������� ���������� ��� ������� � ������ ��������:' & @CRLF & _
		'   %F'

Global $Text_Font_Tooltip = '1..7 ���������� ������ (6 � 7 - �������� ������ �����);' & @CRLF & _
		'8 � 9 - ���������� ���������;' & @CRLF & _
		'a-z, A-Z - ���������������� ������.'

Global $BarcodeInput_Value_Tooltip = '������������ ���������� �������� ���������� ���� �����-���� ����� �� �����������.' & @CRLF & _
		'� ������ ��������� �������� �����-��� ��������� ��������� �� �����.'

#Region ### START Koda GUI section ### Form=d:\��. ����� b1\autoit\!scripts\zebra\gui 005.kxf
$MainWindow = GUICreate("Simple EPL Generator", 962, 458, 200, 228)
$MainTab = GUICtrlCreateTab(8, 8, 433, 409)

$TabSheet_Text1 = GUICtrlCreateTabItem("����� 1")
$Text1Checkbox_Print = GUICtrlCreateCheckbox("�������� ���� �����", 20, 51, 137, 17)
$Text1Input_Text = GUICtrlCreateInput("", 177, 75, 177, 22)
$Text1Input_X = GUICtrlCreateInput("85", 177, 107, 41, 22)
$Text1Input_Y = GUICtrlCreateInput("10", 177, 139, 41, 22)
$Text1Input_Font = GUICtrlCreateInput("3", 177, 171, 41, 22)
GUICtrlSetTip(-1, $Text_Font_Tooltip)
$Text1Input_Yscale = GUICtrlCreateInput("1", 177, 203, 41, 22)
$Text1Input_Xscale = GUICtrlCreateInput("1", 177, 235, 41, 22)
$Text1Combo_WoB = GUICtrlCreateCombo("���", 177, 267, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($Text1Combo_WoB, "��", "���")
$Text1Combo_Rotate = GUICtrlCreateCombo("0", 177, 299, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($Text1Combo_Rotate, "90|180|270", "0")
$Text1Input_CountN_From = GUICtrlCreateInput("0", 177, 331, 41, 22)
GUICtrlSetTip(-1, $Text_Counters_Tooltip)
$Text1Input_CountN_To = GUICtrlCreateInput("2", 240, 331, 41, 22)
$TextInput_CountR_From = GUICtrlCreateInput("0", 177, 363, 41, 22)
$Text1Input_CountR_To = GUICtrlCreateInput("2", 240, 363, 41, 22)
$Text1Label_X = GUICtrlCreateLabel("��������� �� ��� X", 20, 115, 108, 17)
$Text1Label_Y = GUICtrlCreateLabel("��������� �� ��� Y", 20, 147, 108, 17)
$Text1Label_Font = GUICtrlCreateLabel("�����", 20, 179, 38, 17)
$Text1Label_ScalY = GUICtrlCreateLabel("������. ������������", 20, 211, 118, 17)
$Text1Label_ScalX = GUICtrlCreateLabel("�����. ������������", 20, 243, 112, 17)
$Text1Label_WoB = GUICtrlCreateLabel("����� �� ������", 20, 275, 90, 17)
$Text1Label_Rotate = GUICtrlCreateLabel("�������", 20, 307, 47, 17)
$Text1Label_CountN = GUICtrlCreateLabel("������� %N", 20, 339, 71, 17)
$Text1Label_CountR = GUICtrlCreateLabel("������� %R", 20, 371, 71, 17)
$Text1Label_Text = GUICtrlCreateLabel("����� ��� ������", 20, 83, 92, 17)
$Text1Label_CountN_Sep = GUICtrlCreateLabel("�", 224, 335, 9, 17)
$Text1Label_CountR_Se = GUICtrlCreateLabel("�", 224, 367, 9, 17)

$TabSheet_Text2 = GUICtrlCreateTabItem("����� 2")
$Text2Checkbox_Print = GUICtrlCreateCheckbox("�������� ���� �����", 20, 51, 137, 17)
$Text2Input_Text = GUICtrlCreateInput("Text 2", 177, 75, 177, 22)
$Text2Input_X = GUICtrlCreateInput("85", 177, 107, 41, 22)
$Text2Input_Y = GUICtrlCreateInput("10", 177, 139, 41, 22)
$Text2Input_Font = GUICtrlCreateInput("3", 177, 171, 41, 22)
GUICtrlSetTip(-1, $Text_Font_Tooltip)
$Text2Input_Yscale = GUICtrlCreateInput("1", 177, 203, 41, 22)
$Text2Input_Xscale = GUICtrlCreateInput("1", 177, 235, 41, 22)
$Text2Combo_WoB = GUICtrlCreateCombo("���", 177, 267, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($Text2Combo_WoB, "��", "���")
$Text2Combo_Rotate = GUICtrlCreateCombo("0", 177, 299, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($Text2Combo_Rotate, "90|180|270", "0")
$Text2Label_X = GUICtrlCreateLabel("��������� �� ��� X", 20, 115, 108, 17)
$Text2Label_Y = GUICtrlCreateLabel("��������� �� ��� Y", 20, 147, 108, 17)
$Text2Label_Font = GUICtrlCreateLabel("�����", 20, 179, 38, 17)
$Text2Label_ScalY = GUICtrlCreateLabel("������. ������������", 20, 211, 118, 17)
$Text2Label_ScalX = GUICtrlCreateLabel("�����. ������������", 20, 243, 112, 17)
$Text2Label_WoB = GUICtrlCreateLabel("����� �� ������", 20, 275, 90, 17)
$Text2Label_Rotate = GUICtrlCreateLabel("�������", 20, 307, 47, 17)
$Text2Label_Text = GUICtrlCreateLabel("����� ��� ������", 20, 83, 92, 17)

$TabSheet_Text3 = GUICtrlCreateTabItem("����� 3")
$Text3Checkbox_Print = GUICtrlCreateCheckbox("�������� ���� �����", 20, 51, 137, 17)
$Text3Input_Text = GUICtrlCreateInput("Text 3", 177, 75, 177, 22)
$Text3Input_X = GUICtrlCreateInput("85", 177, 107, 41, 22)
$Text3Input_Y = GUICtrlCreateInput("10", 177, 139, 41, 22)
$Text3Input_Font = GUICtrlCreateInput("3", 177, 171, 41, 22)
GUICtrlSetTip(-1, $Text_Font_Tooltip)
$Text3Input_Yscale = GUICtrlCreateInput("1", 177, 203, 41, 22)
$Text3Input_Xscale = GUICtrlCreateInput("1", 177, 235, 41, 22)
$Text3Combo_WoB = GUICtrlCreateCombo("���", 177, 267, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($Text3Combo_WoB, "��", "���")
$Text3Combo_Rotate = GUICtrlCreateCombo("0", 177, 299, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($Text3Combo_Rotate, "90|180|270", "0")
$Text3Label_X = GUICtrlCreateLabel("��������� �� ��� X", 20, 115, 108, 17)
$Text3Label_Y = GUICtrlCreateLabel("��������� �� ��� Y", 20, 147, 108, 17)
$Text3Label_Font = GUICtrlCreateLabel("�����", 20, 179, 38, 17)
$Text3Label_ScalY = GUICtrlCreateLabel("������. ������������", 20, 211, 118, 17)
$Text3Label_ScalX = GUICtrlCreateLabel("�����. ������������", 20, 243, 112, 17)
$Text3Label_WoB = GUICtrlCreateLabel("����� �� ������", 20, 275, 90, 17)
$Text3Label_Rotate = GUICtrlCreateLabel("�������", 20, 307, 47, 17)
$Text3Label_Text = GUICtrlCreateLabel("����� ��� ������", 20, 83, 92, 17)

$TabSheet_Barcode = GUICtrlCreateTabItem("�����-���")
$BarcodeCheckbox_Print = GUICtrlCreateCheckbox("�������� �����-���", 20, 51, 137, 17)
$BarcodeInput_Value = GUICtrlCreateInput("123456789012", 177, 75, 177, 22)
GUICtrlSetTip(-1, $BarcodeInput_Value_Tooltip)

$BarcodeInput_X = GUICtrlCreateInput("20", 177, 107, 41, 22)
$BarcodeInput_Y = GUICtrlCreateInput("40", 177, 139, 41, 22)
$BarcodeCombo_Type = GUICtrlCreateCombo("EAN13", 177, 171, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($BarcodeCombo_Type, "EAN8|UPC A|UPC E", "EAN13")
$BarcodeCombo_Rotate = GUICtrlCreateCombo("0", 177, 203, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($BarcodeCombo_Rotate, "90|180|270", "0")
$BarcodeInput_NarrowBar = GUICtrlCreateInput("3", 177, 235, 41, 22)
GUICtrlSetTip(-1, "�� 2 �� 4 ��� EAN8/13 � UPC A/E")

$BarcodeInput_WideBar = GUICtrlCreateInput("2", 177, 267, 41, 22)
GUICtrlSetTip(-1, "�� 2 �� 30, ��� EAN8/13 � UPC A/E � ��������� ������ �������� �� ������ �� ������")

$BarcodeInput_Height = GUICtrlCreateInput("120", 177, 299, 41, 22)
$BarcodeCombo_Human = GUICtrlCreateCombo("��", 177, 331, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($BarcodeCombo_Human, "���", "��")
$BarcodeInput_CountF_From = GUICtrlCreateInput("0", 177, 363, 41, 22)
GUICtrlSetTip(-1, $Barcode_Counter_Tooltip)
$BarcodeInput_CountF_To = GUICtrlCreateInput("2", 237, 363, 41, 22)
$BarcodeLabel_Value = GUICtrlCreateLabel("�������� �����-����", 20, 83, 112, 17)
$BarcodeLabel_X = GUICtrlCreateLabel("��������� �� ��� X", 20, 115, 108, 17)
$BarcodeLabel_Rotate = GUICtrlCreateLabel("�������", 20, 211, 118, 17)
$BarcodeLabel_Y = GUICtrlCreateLabel("��������� �� ��� Y", 20, 147, 108, 17)
$BarcodeLabel_Type = GUICtrlCreateLabel("��� �����-����", 20, 179, 83, 17)
$BarcodeLabel_NarrowBar = GUICtrlCreateLabel("������ ����� ������", 20, 243, 116, 17)
$BarcodeLabel_WideBar = GUICtrlCreateLabel("������ ������� ������", 20, 275, 131, 17)
$BarcodeLabel_Height = GUICtrlCreateLabel("������", 20, 307, 42, 17)
$BarcodeLabel_Human = GUICtrlCreateLabel("�������� �������� ������", 20, 339, 143, 17)
$BarcodeLabel_CountF = GUICtrlCreateLabel("������� %F", 20, 371, 61, 17)
$BarcodeLabel_CountF_Sep = GUICtrlCreateLabel("�", 224, 367, 9, 17)
$TabSheet_Print = GUICtrlCreateTabItem("��������� ��������")
$PrintInput_Port = GUICtrlCreateInput("2", 177, 75, 41, 22)
$PrintInput_PortSpeed = GUICtrlCreateInput("9600", 177, 107, 41, 22)
GUICtrlSetTip(-1, "������ 9600")
$PrintInput_Density = GUICtrlCreateInput("15", 177, 139, 41, 22)
GUICtrlSetTip(-1, "�� 0 �� 15")
$PrintInput_PrintSpeed = GUICtrlCreateInput("4", 177, 171, 41, 22)
GUICtrlSetTip(-1, "�� 1 �� 4")
$PrintInput_Delay = GUICtrlCreateInput("100", 177, 203, 41, 22)
GUICtrlSetTip(-1, "�������� ����� ��������� �� ������, ��������� ������ ��� ���� ���������")
$PrintCombo_Direction = GUICtrlCreateCombo("������ ����", 177, 235, 100, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($PrintCombo_Direction, "����� �����", "������ ����")

;~ $PrintButton_Test = GUICtrlCreateButton("���������� ������� ��������", 52, 370, 185, 25)
$PrintButton_Test = GUICtrlCreateButton("��������� � ���������� ������� ��������", 102, 371, 245, 25)
$PrintLabel_Port = GUICtrlCreateLabel("COM-���� �����������", 20, 83, 128, 17)
$PrintLabel_PortSpeed = GUICtrlCreateLabel("�������� �����", 20, 115, 108, 17)
$PrintLabel_Density = GUICtrlCreateLabel("�������������", 20, 147, 124, 17)
$PrintLabel_PrintSpeed = GUICtrlCreateLabel("�������� ������", 20, 179, 107, 17)
$PrintLabel_Delay = GUICtrlCreateLabel("�������� ����� �������", 20, 211, 143, 17)
$PrintLabel_Direction = GUICtrlCreateLabel("����������� ������", 20, 243, 143, 17)

$TabSheet_EPL = GUICtrlCreateTabItem("EPL")
$EplButton_Generate = GUICtrlCreateButton("������������� �� ������� ��������", 224, 42, 205, 25)
$EplButton_SaveAs = GUICtrlCreateButton("��������� � ���� ...", 224, 79, 135, 25)
$EplButton_LoadFrom = GUICtrlCreateButton("��������� �� �����", 224, 116, 135, 25)
$EplButton_SendToPrinter = GUICtrlCreateButton("��������� �� �������", 224, 153, 135, 25)
$EplEdit_EPL = GUICtrlCreateEdit("", 20, 42, 193, 361)
GUICtrlSetData(-1, "")
GUICtrlCreateTabItem("")
$MainButton_StartPrint = GUICtrlCreateButton("������ ������", 8, 424, 105, 25)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$MainInput_Copies = GUICtrlCreateInput("1", 136, 424, 25, 24)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$MainButton_LoadSettings = GUICtrlCreateButton("��������� ���������", 332, 424, 125, 25)
$MainButton_SaveSettings = GUICtrlCreateButton("���������", 472, 424, 105, 25)
$MainButton_SaveSettingsAs = GUICtrlCreateButton("��������� ��� ...", 592, 424, 105, 25)
$MainButton_ResetSettings = GUICtrlCreateButton("�����", 712, 424, 105, 25)
$MainButton_About = GUICtrlCreateButton("� ��������� ...", 847, 424, 105, 25)
$Pic1 = GUICtrlCreatePic(@ScriptDir & "\image_text.gif", 448, 30, 505, 385)
$MainLabel_Copies = GUICtrlCreateLabel("����� ������ ��������", 168, 432, 146, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
