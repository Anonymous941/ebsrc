
UNKNOWN_C20266: ;$C20266
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	STACK_RESERVE_VARS
	END_STACK_VARS
	LDY #.LOWORD(BG2_BUFFER) + ((ACTIVE_HPPP_WINDOW_Y_OFFSET * 32) - 6) * 2
	LOADPTR UNKNOWN_C3E40E, @VIRTUAL06
	LDX #$0000
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA [@VIRTUAL06]
	STA __BSS_START__,Y
	INC @VIRTUAL06
	INC @VIRTUAL06
	INY
	INY
	INX
@UNKNOWN1:
	CPX #$0004
	BCC @UNKNOWN0
	PLD
	RTL
