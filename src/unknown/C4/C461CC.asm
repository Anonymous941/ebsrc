
UNKNOWN_C461CC: ;$C461CC
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	TXY
	STY $10
	TAX
	JSL UNKNOWN_C46028
	TAX
	CPX #$FFFF
	BEQ @UNKNOWN0
	LOADPTR EVENT_SCRIPT_POINTERS, $06
	LDY $10
	TYA
	OPTIMIZED_MULT $04, 3
	STA $0E
	INC
	INC
	MOVE_INTY $06, $0A
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	AND #$00FF
	TAY
	LDA $0E
	CLC
	ADC $06
	STA $06
	LDA [$06]
	JSL CREATE_ENTITY_UNKNOWN1
@UNKNOWN0:
	PLD
	RTL
