
UNKNOWN_C190E6: ;$C190E6
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	TAX
	DEX
	LDA .LOWORD(GAME_STATE) + game_state::unknown96,X
	AND #$00FF
	RTS
