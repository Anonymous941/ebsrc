
UNKNOWN_C4ECE7: ;$C4ECE7
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 16
	LDA #$0000
	STA $0E
	LDA .LOWORD(UNKNOWN_7E1A42)
	ASL
	TAX
	LDA a:.LOWORD(BG3_Y_POS)
	SEC
	SBC #$0008
	CMP .LOWORD(SPRITE_ABS_Y_TABLE),X
	BCS @UNKNOWN0
	LDA #$0001
	STA $0E
@UNKNOWN0:
	LDA $0E
	PLD
	RTL
