
UNKNOWN_C07A56: ;$C07A56
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 24
	STY $04
	STX $02
	STX $16
	STA $14
	LDA $04
	STA .LOWORD(UNKNOWN_7E9F73)
	LDY .LOWORD(UNKNOWN_7E4DC6)
	LDX $02
	LDA $14
	JSL UNKNOWN_C0780F
	STA $12
	CMP #$FFFF
	BNE @UNKNOWN0
	LDA $04
	ASL
	TAX
	LDA $12
	STA .LOWORD(UNKNOWN_30X2_TABLE_14),X
	JMP a:.LOWORD(@UNKNOWN3)
@UNKNOWN0:
	LOADPTR SPRITE_GROUPING_PTR_TABLE, $0A
	LDA $12
	ASL
	ASL
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $0E
	LDA $04
	ASL
	TAX
	LDA $10
	STA .LOWORD(UNKNOWN_30X2_TABLE_30),X
	LDA $0E
	CLC
	ADC #$0009
	STA .LOWORD(UNKNOWN_30X2_TABLE_29),X
	LDY #$0008
	LDA [$0E],Y
	AND #$00FF
	STA .LOWORD(UNKNOWN_30X2_TABLE_31),X
	LDA $02
	STA .LOWORD(UNKNOWN_30X2_TABLE_40),X
	LDA .LOWORD(UNKNOWN_7E4DC6)
	CLC
	ADC #char_struct::unknown55
	TAY
	LDA a:.LOWORD(RAM),Y
	PHA
	LDA $02
	STA a:.LOWORD(UNKNOWN_7E00C0)
	PLA
	STA $02
	LDA a:.LOWORD(UNKNOWN_7E00C0)
	CMP $02
	BEQ @UNKNOWN1
	LDA $16
	STA $02
	STA a:.LOWORD(RAM),Y
	TXA
	CLC
	ADC #.LOWORD(UNKNOWN_30X2_TABLE_10)
	TAX
	LDA a:.LOWORD(RAM),X
	ORA #SPRITE_TABLE_10_FLAGS::UNKNOWN15
	STA a:.LOWORD(RAM),X
@UNKNOWN1:
	LDA .LOWORD(GAME_STATE) + game_state::unknown90
	BEQ @UNKNOWN2
	LDA $16
	STA $02
	CMP #$000C
	BEQ @UNKNOWN2
	LDA $04
	ASL
	CLC
	ADC #.LOWORD(UNKNOWN_30X2_TABLE_10)
	TAX
	LDA a:.LOWORD(RAM),X
	AND #$FFFF ^ (SPRITE_TABLE_10_FLAGS::UNKNOWN15 | SPRITE_TABLE_10_FLAGS::UNKNOWN14 | SPRITE_TABLE_10_FLAGS::UNKNOWN13)
	STA a:.LOWORD(RAM),X
	BRA @UNKNOWN3
@UNKNOWN2:
	LDA $04
	ASL
	CLC
	ADC #.LOWORD(UNKNOWN_30X2_TABLE_10)
	TAX
	LDA a:.LOWORD(RAM),X
	ORA #SPRITE_TABLE_10_FLAGS::UNKNOWN14 | SPRITE_TABLE_10_FLAGS::UNKNOWN13
	STA a:.LOWORD(RAM),X
@UNKNOWN3:
	LDA .LOWORD(GAME_STATE) + game_state::unknownB0
	CMP #$0002
	BNE @UNKNOWN4
	LDA $04
	ASL
	CLC
	ADC #.LOWORD(UNKNOWN_30X2_TABLE_10)
	TAX
	LDA a:.LOWORD(RAM),X
	ORA #SPRITE_TABLE_10_FLAGS::UNKNOWN12
	STA a:.LOWORD(RAM),X
@UNKNOWN4:
	PLD
	RTL
