
REDIRECT_DISPLAY_CONFIG_MENU_TITLE: ;$C10C8C
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 20
	STA $12
	MOVE_INT $22, $06
	MOVE_INT $06, $0E
	LDA $12
	JSR a:.LOWORD(DISPLAY_CONFIG_MENU_TITLE)
	PLD
	RTL
