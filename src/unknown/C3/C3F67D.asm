
UNKNOWN_C3F67D: ;$C3F67D
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 20
	LDA UNKNOWN_7E9F80
	ASL
	STA $04
	LDA #$0000
	STA $02
	BRA @UNKNOWN3
@UNKNOWN0:
	LDA UNKNOWN_7E9F7C
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC UNKNOWN_7E9F84
	CLC
	ADC UNKNOWN_7E9F7A
	STA $12
	INC UNKNOWN_7E9F7A
	MOVE_INT UNKNOWN_7E9F86, $06
	MOVE_INT $06, $0E
	LDA $12
	TAY
	LDX $04
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY
	.A16
	MOVE_INT UNKNOWN_7E9F86, $06
	LDA UNKNOWN_7E9F82
	ASL
	CLC
	ADC $06
	STA $06
	STA UNKNOWN_7E9F86
	LDA $08
	STA UNKNOWN_7E9F88
	LDA UNKNOWN_7E9F7A
	CMP #$0020
	BEQ @UNKNOWN1
	LDA UNKNOWN_7E9F7A
	CMP #$0040
	BNE @UNKNOWN2
@UNKNOWN1:
	LDA UNKNOWN_7E9F84
	EOR #$0400
	STA UNKNOWN_7E9F84
@UNKNOWN2:
	INC $02
@UNKNOWN3:
	LDA $02
	CMP UNKNOWN_7E9F7E
	BCC @UNKNOWN0
	PLD
	RTS
