; SetTitleMatchMode, 2
#NoEnv  
#SingleInstance, Force
;#Persistent
SetTitleMatchMode, RegEx
; SetKeyDelay, 10, 10


IfWinExist, ahk_class Chrome_WidgetWin_1 
	{
	; WinGetActiveTitle, Title
	WinGetClass, Title, A
	ControlFocus, Chrome_RenderWidgetHostHWND2
;	sleep, 500
	ControlSend,,{backspace}{backspace}{backspace}{backspace}{backspace}/say{space}, AI Dungeon - Google Chrome 
	WinActivate,ahk_class %Title%
	; ControlFocus, %Title%
	; MsgBox, %Title%
	; ControlSend,,spc bs, ahk_class Chrome_WidgetWin_1  
	}
else
	MsgBox, windows not found