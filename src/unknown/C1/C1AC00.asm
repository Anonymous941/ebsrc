
UNKNOWN_C1AC00: ;$C1AC00
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 20
	JSR a:.LOWORD(UNKNOWN_C19441)
	STA $12
	CMP #$0000
	BEQ @UNKNOWN0
	LOADPTR TELEPHONE_CONTACTS_TABLE, $0A
	LDA $12
	LDY #$001F
	JSL MULT168
	CLC
	ADC #$001B
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $0E
	JSL DISPLAY_TEXT
@UNKNOWN0:
	LDA $12
	PLD
	RTS
