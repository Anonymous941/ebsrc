
UNKNOWN_C0888B: ;$C0888B
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(UNKNOWN_7E0028)
	BEQ @UNKNOWN0
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8
	JSL OAM_CLEAR
	JSL UNKNOWN_C08B19_ENTRY_POINT_2
	JSL WAIT_UNTIL_NEXT_FRAME
	BRA UNKNOWN_C0888B
@UNKNOWN0:
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8
	RTL
