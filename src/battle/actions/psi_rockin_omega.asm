
BTLACT_PSI_ROCKIN_O: ;$C29571
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDA #ROCKIN_OMEGA_DAMAGE
	JSR a:.LOWORD(PSI_ROCKIN_COMMON)
	RTL
