
GET_SECONDARY_MEMORY: ;$C10400
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	JSR GET_ACTIVE_WINDOW_ADDRESS
	TAX
	LDA a:window_stats::secondary_memory,X
	RTS
