
CC_1C_00: ;$C140F9
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	TXA
	JSR UNKNOWN_C10FEA
	LDA #NULL
	RTS
