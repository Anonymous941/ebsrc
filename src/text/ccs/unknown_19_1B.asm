
CC_19_1B: ;$C15C36
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	TXA
	JSR UNKNOWN_C12BD5
	STORE_INT1632 $06
	MOVE_INT $06, $0E
	JSR SET_WORKING_MEMORY
	LDA #NULL
	PLD
	RTS
