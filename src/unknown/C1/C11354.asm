
UNKNOWN_C11354: ;$C11354
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 16
	LDA #$0000
	STA $0E
	BRA @UNKNOWN2
@UNKNOWN0:
	OPTIMIZED_MULT $04, .SIZEOF(menu_option)
	TAX
	LDA .LOWORD(MENU_OPTIONS),X
	BNE @UNKNOWN1
	LDA $0E
	BRA @UNKNOWN3
@UNKNOWN1:
	LDA $0E
	INC
	STA $0E
@UNKNOWN2:
	CMP #NUM_MENU_OPTIONS
	BNE @UNKNOWN0
	LDA #$FFFF
@UNKNOWN3:
	PLD
	RTS
