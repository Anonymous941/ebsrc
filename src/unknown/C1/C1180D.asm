
UNKNOWN_C1180D: ;$C1180D
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	TXY
	LDX #$0000
	JSL UNKNOWN_C451FA
	JSR a:.LOWORD(PRINT_MENU_ITEMS)
	RTS
