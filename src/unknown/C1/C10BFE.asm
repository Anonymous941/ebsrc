
UNKNOWN_C10BFE: ;$C10BFE
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 28
	STA $1A
	MOVE_INT $2E, $06
	MOVE_INT $06, $16
	MOVE_INT $2A, $0A
	MOVE_INT $0A, $06
	MOVE_INT $06, $0E
	MOVE_INT $16, $06
	MOVE_INT $06, $12
	LDA $1A
	JSR UNKNOWN_C1153B
	PLD
	RTL
