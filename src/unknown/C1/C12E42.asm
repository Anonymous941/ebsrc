
UNKNOWN_C12E42: ;$C12E42
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	JSL HP_PP_ROLLER
	LDA .LOWORD(UNKNOWN_7E9649)
	BEQ @UNKNOWN0
	JSR a:.LOWORD(UNKNOWN_C1078D)
	STZ .LOWORD(UNKNOWN_7E9649)
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E9624)
@UNKNOWN0:
	JSL UNKNOWN_C213AC
	JSL UNKNOWN_C1004E
	RTL
