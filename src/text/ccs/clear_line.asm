
CC_12: ;$C10BD3
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDA CURRENT_FOCUS_WINDOW
	JSL UNKNOWN_C43739
	LDA CURRENT_FOCUS_WINDOW
	ASL
	TAX
	LDA WINDOW_EXISTENCE_TABLE,X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	LDA WINDOW_STATS_TABLE+window_stats::text_y,X
	TAX
	LDA #NULL
	JSL UNKNOWN_C438A5
	RTS
