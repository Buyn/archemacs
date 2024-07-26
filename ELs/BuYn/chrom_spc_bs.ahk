#NoEnv  
#SingleInstance, Force
;#Persistent
SetTitleMatchMode, RegEx

IfWinExist, ahk_class Chrome_WidgetWin_1 
	{
	WinGetClass, Title, A
	ControlFocus, Chrome_RenderWidgetHostHWND2
	ControlSend,,{space}, AI Dungeon - Google Chrome 
	; Sleep 1000
	WinActivate,ahk_class %Title%
	; ControlFocus, %Title%
	; MsgBox, %Title%
	; ControlSend,,spc bs, ahk_class Chrome_WidgetWin_1  
	}
else
	MsgBox, windows not found
