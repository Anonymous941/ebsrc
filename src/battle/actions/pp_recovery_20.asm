
BTLACT_PP_RECOVERY_20: ;$C2A0DF
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDA #$0014
	JSR a:.LOWORD(TWENTY_FIVE_PERCENT_VARIANCE)
	TAX
	LDA .LOWORD(CURRENT_TARGET)
	JSR a:.LOWORD(RECOVER_PP)
	RTL
