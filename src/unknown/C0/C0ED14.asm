
UNKNOWN_C0ED14: ;$C0ED14
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 15
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FF
	STA $0E
	LDX #$0100
	REP #PROC_FLAGS::ACCUM8
	LDA #$0200
	JSL MEMSET16
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0018
	STA a:.LOWORD(UNKNOWN_7E0030)
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
