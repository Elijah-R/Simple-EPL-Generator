#include-once

Func text_generate_msg($g_text, $g_text_h_pos, $g_text_v_pos, $g_text_rotation, $g_text_font, $g_text_h_mult, $g_text_v_mult, $g_text_reverse)
;~ $g_text ; text to send
;~ $g_text_h_pos = 20 ; Starting horizontal position (in points)
;~ $g_text_v_pos = 80 ; Starting vertical position (in points)
;~ $g_text_rotation = 0 ; How the text should be printed
;~ 0: horizontal, normal
;~ 1: 90 degrees
;~ 2: 180 degrees
;~ 3: 270 degrees
;~ $g_text_font = 2 ; Font style to use.
;~ $g_text_h_mult = 3 ; Horizontal multiplier for the font (1-9)
;~ $g_text_v_mult = 3 ; Vertical multiplier for the font (1-9)
;~ $g_text_reverse = "N" ; Whether the text should be rendered black-on-white (N) or white-on-black (R)
	Local $msg_text_generated = 'A' & $g_text_h_pos & ',' & $g_text_v_pos & ',' & $g_text_rotation & ',' & $g_text_font & ',' & $g_text_h_mult & ',' & $g_text_v_mult & ',' & $g_text_reverse & ',"' & $g_text & '"' & @CRLF
	Return $msg_text_generated
EndFunc   ;==>text_generate_msg

Func printer_generate_settings($g_density, $g_direction, $g_speed)
;~ $density = 9 ; Контрастность / Density 0-15
;~ $direction = 9 ; Направление печати из буфера. B - Снизу вверх, T - сверху вниз.
;~ $speed = ; Скорость печати / print speed 1-4, mobile printers ignore this command
	Local $msg_settings_generated = @CRLF & _ ; Отправляем пустую строку
			'N' & @CRLF & _ ; Что-то вроде cброса буфера
			'Z' & $g_direction & @CRLF & _ ; Настройка размера этикетки
			'S' & $g_speed & @CRLF & _ ; Настройка размера этикетки
			'D' & $g_density & @CRLF ; Контрастность / Density
	Return $msg_settings_generated
EndFunc   ;==>printer_generate_settings

Func label_generate_quantity($g_quantity)
;~ 	$quantity ; Сколько раз печатать этикетку
	Local $msg_label_quantity_generated = 'P' & $g_quantity & @CRLF
	Return $msg_label_quantity_generated
EndFunc   ;==>label_generate_quantity

Func barcode_generate($g_barcode_h_pos, $g_barcode_v_pos, $g_barcode_rotation, $g_barcode_type, $g_barcode_narrow_bar, $g_barcode_wide_bar, $g_barcode_height, $g_barcode_human, $value)
;~ Bh_pos,v_pos,rotation,barcode_type,narrow_bar,wide_bar,height,human,"value" - Barcode
;~ $g_barcode_h_pos = 20 ; Starting horizontal position (in points)
;~ $g_barcode_v_pos = 20 ; Starting vertical position (in points)
;~ $g_barcode_rotation = 0 ; How the text should be printed
;~ 0: horizontal, normal
;~ 1: 90 degrees
;~ 2: 180 degrees
;~ 3: 270 degrees
;~ $g_barcode_type = "E30" ; Which barcode type to print; 31 barcode types are available. See the official documentation[1] for full information.
;~ E80 - EAN8		E82 - EAN8 2 DIGIT ADD-ON		E85 - EAN8 5 DIGIT ADD-ON
;~ E30 - EAN13 - !!!!! Сделать по умолчанию		E32 - EAN13 2 DIGIT ADD-ON		E35 - EAN13 5 DIGIT ADD-ON
;~ UA0 - UPC A		UA2 - UPC A 2 DIGIT ADD-ON		UA5 - UPC A 5 DIGIT AON
;~ UE0 - UPC E		UE2 - UPC E 2 DIGIT ADD-ON		UE5 - UPC E 5 DIGIT ADD-ON
;~ $g_barcode_narrow_bar = 2 ; (2-4) How wide should the narrow bar of the generated barcode be. Legal values are determined by the barcode_type.
;~ $g_barcode_wide_bar ; How wide should the wide bar of the generated barcode be. Legal values are determined by the barcode_type. Не влияет на EAN8 / EAN13 / UPC A / UPC E
;~ $g_barcode_height = 20 ; Printed barcode desired height (in points)
;~ $g_barcode_human = "B" ; Print a human-readable form of the value below the barcode. B: yes, N: no

	Local $msg_barcode_generated = "B" & $g_barcode_h_pos & ',' & $g_barcode_v_pos & ',' & $g_barcode_rotation & ',' & $g_barcode_type & ',' & $g_barcode_narrow_bar & ',' & $g_barcode_wide_bar & ',' & $g_barcode_height & ',' & $g_barcode_human & ',"' & $value & '"' & @CRLF
;~ 	MsgBox (0, "$msg_barcode_generated", $msg_barcode_generated)

	Return $msg_barcode_generated

EndFunc   ;==>barcode_generate
