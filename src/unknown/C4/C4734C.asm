
UNKNOWN_C4734C: ;$C4734C
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	TAY
	STY $0E
	TYX
	LDA BG1_X_POS
	LSR
	LSR
	LSR
	JSL UNKNOWN_C01A63
	LDY $0E
	TYA
	PLD
	RTL
