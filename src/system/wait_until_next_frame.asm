
WAIT_UNTIL_NEXT_FRAME: ;$C08756
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(UNKNOWN_7E001E)
	AND #$00B0
	BEQ @WAITFORNOTVBLANK
@UNKNOWN0:
	LDA a:.LOWORD(UNKNOWN_7E002B)
	BEQ @UNKNOWN0
	STZ a:.LOWORD(UNKNOWN_7E002B)
	BRA @UNKNOWN3
@WAITFORNOTVBLANK:
	LDA f:HVBJOY
	BMI @WAITFORNOTVBLANK
@WAITFORVBLANK:
	LDA f:HVBJOY
	BPL @WAITFORVBLANK
@UNKNOWN3:
	STZ a:.LOWORD(UNKNOWN_7E002B)
	PHD
	PEA $0000
	PLD
	PHB
	PEA $0000
	PLB
	PLB
	JSR a:.LOWORD(UNKNOWN_C08496)
	PLB
	PLD
	REP #PROC_FLAGS::ACCUM8
	RTL
