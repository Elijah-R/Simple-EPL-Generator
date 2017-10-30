#include-once

Global $Text_Counters_Tooltip = 'Пример: для печати шести этикеток с текстами:' & @CRLF & _
		'   A1-B1, A1-B2, A1-B3, A2-B1, A2-B2, A1-B3' & @CRLF & _
		'введите в поле "Текст для печати":' & @CRLF & _
		'   A%N-B%R' & @CRLF & _
		'а в поля счетчиков:' & @CRLF & _
		'   1 - 2 для первого и 1 - 3 для второго.' & @CRLF & _
		'Счетчик автоматически включается при наличии в тексте символов:' & @CRLF & _
		'   %N   и/или   %R'

Global $Barcode_Counter_Tooltip = 'Для печати штрих-кода с увеличивающимся' & @CRLF & _
		'значением на каждой следующей этикетке' & @CRLF & _
		'используйте счетчик, пример:' & @CRLF & _
		'   введите "12345678901%F" в поле "Значение штрих-кода",' & @CRLF & _
		'   а в поле счетчика: 1 - 5,' & @CRLF & _
		'   будет напечатано 5 этикеток: 123456789011, 123456789012, 123456789013 и т.д.' & @CRLF & _
		'Счетчик автоматически включается при наличии в тексте символов:' & @CRLF & _
		'   %F'

Global $Text_Font_Tooltip = '1..7 встроенные шрифты (6 и 7 - содержат только цифры);' & @CRLF & _
		'8 и 9 - встроенные азиатские;' & @CRLF & _
		'a-z, A-Z - пользовательские шрифты.'

Global $BarcodeInput_Value_Tooltip = 'Соответствие количества символов выбранному типу штрих-кода никак не проверяется.' & @CRLF & _
		'В случае неверного варианта штрих-код принтером напечатан не будет.'

#Region ### START Koda GUI section ### Form=d:\Ст. яруса b1\autoit\!scripts\zebra\gui 005.kxf
$MainWindow = GUICreate("Simple EPL Generator", 962, 458, 200, 228)
$MainTab = GUICtrlCreateTab(8, 8, 433, 409)

$TabSheet_Text1 = GUICtrlCreateTabItem("Текст 1")
$Text1Checkbox_Print = GUICtrlCreateCheckbox("печатать этот текст", 20, 51, 137, 17)
$Text1Input_Text = GUICtrlCreateInput("", 177, 75, 177, 22)
$Text1Input_X = GUICtrlCreateInput("85", 177, 107, 41, 22)
$Text1Input_Y = GUICtrlCreateInput("10", 177, 139, 41, 22)
$Text1Input_Font = GUICtrlCreateInput("3", 177, 171, 41, 22)
GUICtrlSetTip(-1, $Text_Font_Tooltip)
$Text1Input_Yscale = GUICtrlCreateInput("1", 177, 203, 41, 22)
$Text1Input_Xscale = GUICtrlCreateInput("1", 177, 235, 41, 22)
$Text1Combo_WoB = GUICtrlCreateCombo("Нет", 177, 267, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($Text1Combo_WoB, "Да", "Нет")
$Text1Combo_Rotate = GUICtrlCreateCombo("0", 177, 299, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($Text1Combo_Rotate, "90|180|270", "0")
$Text1Input_CountN_From = GUICtrlCreateInput("0", 177, 331, 41, 22)
GUICtrlSetTip(-1, $Text_Counters_Tooltip)
$Text1Input_CountN_To = GUICtrlCreateInput("2", 240, 331, 41, 22)
$TextInput_CountR_From = GUICtrlCreateInput("0", 177, 363, 41, 22)
$Text1Input_CountR_To = GUICtrlCreateInput("2", 240, 363, 41, 22)
$Text1Label_X = GUICtrlCreateLabel("Положение по оси X", 20, 115, 108, 17)
$Text1Label_Y = GUICtrlCreateLabel("Положение по оси Y", 20, 147, 108, 17)
$Text1Label_Font = GUICtrlCreateLabel("Шрифт", 20, 179, 38, 17)
$Text1Label_ScalY = GUICtrlCreateLabel("Вертик. скалирование", 20, 211, 118, 17)
$Text1Label_ScalX = GUICtrlCreateLabel("Гориз. скалирование", 20, 243, 112, 17)
$Text1Label_WoB = GUICtrlCreateLabel("Белое на черном", 20, 275, 90, 17)
$Text1Label_Rotate = GUICtrlCreateLabel("Поворот", 20, 307, 47, 17)
$Text1Label_CountN = GUICtrlCreateLabel("Счетчик %N", 20, 339, 71, 17)
$Text1Label_CountR = GUICtrlCreateLabel("Счетчик %R", 20, 371, 71, 17)
$Text1Label_Text = GUICtrlCreateLabel("Текст для печати", 20, 83, 92, 17)
$Text1Label_CountN_Sep = GUICtrlCreateLabel("–", 224, 335, 9, 17)
$Text1Label_CountR_Se = GUICtrlCreateLabel("–", 224, 367, 9, 17)

$TabSheet_Text2 = GUICtrlCreateTabItem("Текст 2")
$Text2Checkbox_Print = GUICtrlCreateCheckbox("печатать этот текст", 20, 51, 137, 17)
$Text2Input_Text = GUICtrlCreateInput("Text 2", 177, 75, 177, 22)
$Text2Input_X = GUICtrlCreateInput("85", 177, 107, 41, 22)
$Text2Input_Y = GUICtrlCreateInput("10", 177, 139, 41, 22)
$Text2Input_Font = GUICtrlCreateInput("3", 177, 171, 41, 22)
GUICtrlSetTip(-1, $Text_Font_Tooltip)
$Text2Input_Yscale = GUICtrlCreateInput("1", 177, 203, 41, 22)
$Text2Input_Xscale = GUICtrlCreateInput("1", 177, 235, 41, 22)
$Text2Combo_WoB = GUICtrlCreateCombo("Нет", 177, 267, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($Text2Combo_WoB, "Да", "Нет")
$Text2Combo_Rotate = GUICtrlCreateCombo("0", 177, 299, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($Text2Combo_Rotate, "90|180|270", "0")
$Text2Label_X = GUICtrlCreateLabel("Положение по оси X", 20, 115, 108, 17)
$Text2Label_Y = GUICtrlCreateLabel("Положение по оси Y", 20, 147, 108, 17)
$Text2Label_Font = GUICtrlCreateLabel("Шрифт", 20, 179, 38, 17)
$Text2Label_ScalY = GUICtrlCreateLabel("Вертик. скалирование", 20, 211, 118, 17)
$Text2Label_ScalX = GUICtrlCreateLabel("Гориз. скалирование", 20, 243, 112, 17)
$Text2Label_WoB = GUICtrlCreateLabel("Белое на черном", 20, 275, 90, 17)
$Text2Label_Rotate = GUICtrlCreateLabel("Поворот", 20, 307, 47, 17)
$Text2Label_Text = GUICtrlCreateLabel("Текст для печати", 20, 83, 92, 17)

$TabSheet_Text3 = GUICtrlCreateTabItem("Текст 3")
$Text3Checkbox_Print = GUICtrlCreateCheckbox("печатать этот текст", 20, 51, 137, 17)
$Text3Input_Text = GUICtrlCreateInput("Text 3", 177, 75, 177, 22)
$Text3Input_X = GUICtrlCreateInput("85", 177, 107, 41, 22)
$Text3Input_Y = GUICtrlCreateInput("10", 177, 139, 41, 22)
$Text3Input_Font = GUICtrlCreateInput("3", 177, 171, 41, 22)
GUICtrlSetTip(-1, $Text_Font_Tooltip)
$Text3Input_Yscale = GUICtrlCreateInput("1", 177, 203, 41, 22)
$Text3Input_Xscale = GUICtrlCreateInput("1", 177, 235, 41, 22)
$Text3Combo_WoB = GUICtrlCreateCombo("Нет", 177, 267, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($Text3Combo_WoB, "Да", "Нет")
$Text3Combo_Rotate = GUICtrlCreateCombo("0", 177, 299, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($Text3Combo_Rotate, "90|180|270", "0")
$Text3Label_X = GUICtrlCreateLabel("Положение по оси X", 20, 115, 108, 17)
$Text3Label_Y = GUICtrlCreateLabel("Положение по оси Y", 20, 147, 108, 17)
$Text3Label_Font = GUICtrlCreateLabel("Шрифт", 20, 179, 38, 17)
$Text3Label_ScalY = GUICtrlCreateLabel("Вертик. скалирование", 20, 211, 118, 17)
$Text3Label_ScalX = GUICtrlCreateLabel("Гориз. скалирование", 20, 243, 112, 17)
$Text3Label_WoB = GUICtrlCreateLabel("Белое на черном", 20, 275, 90, 17)
$Text3Label_Rotate = GUICtrlCreateLabel("Поворот", 20, 307, 47, 17)
$Text3Label_Text = GUICtrlCreateLabel("Текст для печати", 20, 83, 92, 17)

$TabSheet_Barcode = GUICtrlCreateTabItem("Штрих-код")
$BarcodeCheckbox_Print = GUICtrlCreateCheckbox("печатать штрих-код", 20, 51, 137, 17)
$BarcodeInput_Value = GUICtrlCreateInput("123456789012", 177, 75, 177, 22)
GUICtrlSetTip(-1, $BarcodeInput_Value_Tooltip)

$BarcodeInput_X = GUICtrlCreateInput("20", 177, 107, 41, 22)
$BarcodeInput_Y = GUICtrlCreateInput("40", 177, 139, 41, 22)
$BarcodeCombo_Type = GUICtrlCreateCombo("EAN13", 177, 171, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($BarcodeCombo_Type, "EAN8|UPC A|UPC E", "EAN13")
$BarcodeCombo_Rotate = GUICtrlCreateCombo("0", 177, 203, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($BarcodeCombo_Rotate, "90|180|270", "0")
$BarcodeInput_NarrowBar = GUICtrlCreateInput("3", 177, 235, 41, 22)
GUICtrlSetTip(-1, "От 2 до 4 для EAN8/13 и UPC A/E")

$BarcodeInput_WideBar = GUICtrlCreateInput("2", 177, 267, 41, 22)
GUICtrlSetTip(-1, "От 2 до 30, для EAN8/13 и UPC A/E и некоторых других значение не влияет на печать")

$BarcodeInput_Height = GUICtrlCreateInput("120", 177, 299, 41, 22)
$BarcodeCombo_Human = GUICtrlCreateCombo("Да", 177, 331, 62, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($BarcodeCombo_Human, "Нет", "Да")
$BarcodeInput_CountF_From = GUICtrlCreateInput("0", 177, 363, 41, 22)
GUICtrlSetTip(-1, $Barcode_Counter_Tooltip)
$BarcodeInput_CountF_To = GUICtrlCreateInput("2", 237, 363, 41, 22)
$BarcodeLabel_Value = GUICtrlCreateLabel("Значение штрих-кода", 20, 83, 112, 17)
$BarcodeLabel_X = GUICtrlCreateLabel("Положение по оси X", 20, 115, 108, 17)
$BarcodeLabel_Rotate = GUICtrlCreateLabel("Поворот", 20, 211, 118, 17)
$BarcodeLabel_Y = GUICtrlCreateLabel("Положение по оси Y", 20, 147, 108, 17)
$BarcodeLabel_Type = GUICtrlCreateLabel("Тип штрих-кода", 20, 179, 83, 17)
$BarcodeLabel_NarrowBar = GUICtrlCreateLabel("Ширина узкой полосы", 20, 243, 116, 17)
$BarcodeLabel_WideBar = GUICtrlCreateLabel("Ширина широкой полосы", 20, 275, 131, 17)
$BarcodeLabel_Height = GUICtrlCreateLabel("Высота", 20, 307, 42, 17)
$BarcodeLabel_Human = GUICtrlCreateLabel("Печатать читаемый аналог", 20, 339, 143, 17)
$BarcodeLabel_CountF = GUICtrlCreateLabel("Счетчик %F", 20, 371, 61, 17)
$BarcodeLabel_CountF_Sep = GUICtrlCreateLabel("–", 224, 367, 9, 17)
$TabSheet_Print = GUICtrlCreateTabItem("Настройки принтера")
$PrintInput_Port = GUICtrlCreateInput("2", 177, 75, 41, 22)
$PrintInput_PortSpeed = GUICtrlCreateInput("9600", 177, 107, 41, 22)
GUICtrlSetTip(-1, "Обычно 9600")
$PrintInput_Density = GUICtrlCreateInput("15", 177, 139, 41, 22)
GUICtrlSetTip(-1, "От 0 до 15")
$PrintInput_PrintSpeed = GUICtrlCreateInput("4", 177, 171, 41, 22)
GUICtrlSetTip(-1, "От 1 до 4")
$PrintInput_Delay = GUICtrlCreateInput("100", 177, 203, 41, 22)
GUICtrlSetTip(-1, "Задержка между командами на печать, настройка только для этой программы")
$PrintCombo_Direction = GUICtrlCreateCombo("Сверху вниз", 177, 235, 100, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData($PrintCombo_Direction, "Снизу вверх", "Сверху вниз")

;~ $PrintButton_Test = GUICtrlCreateButton("Напечатать пробную этикетку", 52, 370, 185, 25)
$PrintButton_Test = GUICtrlCreateButton("Применить и напечатать пробную этикетку", 102, 371, 245, 25)
$PrintLabel_Port = GUICtrlCreateLabel("COM-порт подключения", 20, 83, 128, 17)
$PrintLabel_PortSpeed = GUICtrlCreateLabel("Скорость порта", 20, 115, 108, 17)
$PrintLabel_Density = GUICtrlCreateLabel("Контрастность", 20, 147, 124, 17)
$PrintLabel_PrintSpeed = GUICtrlCreateLabel("Скорость печати", 20, 179, 107, 17)
$PrintLabel_Delay = GUICtrlCreateLabel("Задержка между печатью", 20, 211, 143, 17)
$PrintLabel_Direction = GUICtrlCreateLabel("Направление печати", 20, 243, 143, 17)

$TabSheet_EPL = GUICtrlCreateTabItem("EPL")
$EplButton_Generate = GUICtrlCreateButton("Сгенерировать из текущих настроек", 224, 42, 205, 25)
$EplButton_SaveAs = GUICtrlCreateButton("Сохранить в файл ...", 224, 79, 135, 25)
$EplButton_LoadFrom = GUICtrlCreateButton("Загрузить из файла", 224, 116, 135, 25)
$EplButton_SendToPrinter = GUICtrlCreateButton("Отправить на принтер", 224, 153, 135, 25)
$EplEdit_EPL = GUICtrlCreateEdit("", 20, 42, 193, 361)
GUICtrlSetData(-1, "")
GUICtrlCreateTabItem("")
$MainButton_StartPrint = GUICtrlCreateButton("Начать печать", 8, 424, 105, 25)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$MainInput_Copies = GUICtrlCreateInput("1", 136, 424, 25, 24)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$MainButton_LoadSettings = GUICtrlCreateButton("Загрузить настройки", 332, 424, 125, 25)
$MainButton_SaveSettings = GUICtrlCreateButton("Сохранить", 472, 424, 105, 25)
$MainButton_SaveSettingsAs = GUICtrlCreateButton("Сохранить как ...", 592, 424, 105, 25)
$MainButton_ResetSettings = GUICtrlCreateButton("Сброс", 712, 424, 105, 25)
$MainButton_About = GUICtrlCreateButton("О программе ...", 847, 424, 105, 25)
$Pic1 = GUICtrlCreatePic(@ScriptDir & "\image_text.gif", 448, 30, 505, 385)
$MainLabel_Copies = GUICtrlCreateLabel("копий каждой этикетки", 168, 432, 146, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
