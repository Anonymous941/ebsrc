
UNKNOWN_C12BF3: ;$C12BF3
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 16
	LDA #$0003
	JSR a:.LOWORD(UNKNOWN_C10FEA)
	LOADPTR UNKNOWN_C3E84E, $06
	BRA @UNKNOWN3
@UNKNOWN0:
	INC $06
	INC $06
	JSR a:.LOWORD(UNKNOWN_C10D60)
	LDX #$0001
	STX $0E
	BRA @UNKNOWN2
@UNKNOWN1:
	JSL UNKNOWN_C12DD5
@UNKNOWN2:
	LDX $0E
	TXA
	DEX
	STX $0E
	CMP #$0000
	BNE @UNKNOWN1
@UNKNOWN3:
	LDA [$06]
	BNE @UNKNOWN0
	LDA #$0000
	JSR a:.LOWORD(UNKNOWN_C10FEA)
	PLD
	RTL
