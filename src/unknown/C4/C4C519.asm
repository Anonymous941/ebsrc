
UNKNOWN_C4C519: ;$C4C519
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 20
	TXY
	STY $12
	TAX
	JSR a:.LOWORD(UNKNOWN_C4C45F)
	LDY $12
	TYA
	JSL UNKNOWN_C49208
	BRA @UNKNOWN2
@UNKNOWN0:
	LDA a:.LOWORD(PAD_1_PRESS)
	BEQ @UNKNOWN1
	LDA #$FFFF
	BRA @UNKNOWN3
@UNKNOWN1:
	JSL UNKNOWN_C492D2
	JSL WAIT_UNTIL_NEXT_FRAME
	LDY $12
	DEY
	STY $12
@UNKNOWN2:
	LDY $12
	BNE @UNKNOWN0
	LOADPTR UNKNOWN_7F7800, $0E
	LDX #$00C0
	LDA #$0240
	JSL MEMCPY16
	LDA #$0000
@UNKNOWN3:
	PLD
	RTS
