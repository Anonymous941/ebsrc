
UNKNOWN_C0CD50: ;$C0CD50
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 56
	LDA .LOWORD(UNKNOWN_7E1A42)
	STA $36
	ASL
	TAX
	LDA .LOWORD(UNKNOWN_30X2_TABLE_45),X
	STA $04
	BNE @UNKNOWN0
	LDA .LOWORD(UNKNOWN_30X2_TABLE_7),X
	CLC
	ADC .LOWORD(UNKNOWN_30X2_TABLE_8),X
	STA $02
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA .LOWORD(UNKNOWN_30X2_TABLE_7),X
	SEC
	SBC .LOWORD(UNKNOWN_30X2_TABLE_8),X
	STA $02
@UNKNOWN1:
	LDA $36
	ASL
	TAY
	STY $36
	LDA $02
	STA .LOWORD(UNKNOWN_30X2_TABLE_7),Y
	LDX #$1000
	LDA $02
	JSL UNKNOWN_C41FFF
	MOVE_INT $06, $0E
	STZ $1E
	STZ $1A
	LDA $10
	STA $1C
	LDA $0E
	STA $20
	MOVE_INT $1A, $06
	ASR8_INT $06
	MOVE_INT $06, $0A
	MOVE_INT $0A, $06
	MOVE_INT $06, $1A
	MOVE_INT $1E, $06
	ASR8_INT $06
	MOVE_INT $06, $32
	MOVE_INT $06, $1E
	STZ $26
	STZ $22
	LDY $36
	LDA .LOWORD(UNKNOWN_30X2_TABLE_9),Y
	STA $24
	LDA .LOWORD(UNKNOWN_30X2_TABLE_10),Y
	STA $28
	LDA .LOWORD(ENTITY_ABS_X_TABLE),Y
	STA $14
	LDA .LOWORD(ENTITY_ABS_X_FRACTION_TABLE),Y
	STA $12
	LDA .LOWORD(ENTITY_ABS_Y_TABLE),Y
	STA $18
	LDA .LOWORD(ENTITY_ABS_Y_FRACTION_TABLE),Y
	STA $16
	MOVE_INT $22, $06
	CLC
	ADD_INT_ASSIGN $06, $0A
	MOVE_INT $12, $0A
	SEC
	SUB_INT_ASSIGN $06, $0A
	MOVE_INT $06, $2A
	MOVE_INT $32, $06
	MOVE_INT $06, $0A
	MOVE_INT $26, $06
	CLC
	ADD_INT_ASSIGN $06, $0A
	MOVE_INT $16, $0A
	SEC
	SUB_INT_ASSIGN $06, $0A
	MOVE_INT $06, $2E
	LDA $2C
	STA .LOWORD(ENTITY_DELTA_X_TABLE),Y
	LDA $2A
	STA .LOWORD(ENTITY_DELTA_X_FRACTION_TABLE),Y
	LDA $30
	STA .LOWORD(ENTITY_DELTA_Y_TABLE),Y
	LDA $2E
	STA .LOWORD(ENTITY_DELTA_Y_FRACTION_TABLE),Y
	LDA $04
	BNE @UNKNOWN4
	LDA $02
	CLC
	ADC #$4000
	BRA @UNKNOWN5
@UNKNOWN4:
	LDA $02
	SEC
	SBC #$4000
@UNKNOWN5:
	PLD
	RTL
