
REDIRECT_SHOW_HPPP_WINDOWS: ;$C1DD3B
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	JSR a:.LOWORD(SHOW_HPPP_WINDOWS)
	RTL
