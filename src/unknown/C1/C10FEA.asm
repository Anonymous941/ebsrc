
UNKNOWN_C10FEA: ;$C10FEA
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	STA $0E
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	CMP #$FFFF
	BEQ @UNKNOWN0
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	ASL
	TAX
	LDA .LOWORD(WINDOW_EXISTENCE_TABLE),X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	LDY #$0400
	LDA $0E
	JSL MULT16
	STA .LOWORD(WINDOW_STATS_TABLE)+19,X
@UNKNOWN0:
	PLD
	RTS
