
UNKNOWN_C490EE: ;$C490EE
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 20
	LDA #$0178
	JSL UNKNOWN_C46028
	STA $04
	CMP #$FFFF
	BNE @UNKNOWN0
	LDA #$0000
	JMP a:.LOWORD(@UNKNOWN15)
@UNKNOWN0:
	LDA $04
	ASL
	TAX
	LDA .LOWORD(ENTITY_ABS_X_TABLE),X
	STA $12
	LDY .LOWORD(GAME_STATE)+game_state::leader_x_coord
	TYA
	SEC
	SBC #$0040
	STA $02
	LDA $12
	CMP $02
	BCC @UNKNOWN2
	TYA
	CLC
	ADC #$0040
	STA $02
	LDA $12
	CMP $02
	BEQ @UNKNOWN1
	BCS @UNKNOWN2
@UNKNOWN1:
	LDY .LOWORD(ENTITY_ABS_Y_TABLE),X
	LDA .LOWORD(GAME_STATE)+game_state::leader_y_coord
	STA $12
	SEC
	SBC #$0040
	STA $02
	TYA
	CMP $02
	BCC @UNKNOWN2
	LDA $12
	CLC
	ADC #$0040
	STA $02
	TYA
	CMP $02
	BCC @UNKNOWN3
	BEQ @UNKNOWN3
@UNKNOWN2:
	LDA #$0001
	JMP a:.LOWORD(@UNKNOWN15)
@UNKNOWN3:
	LDA $12
	STA $02
	TYA
	SEC
	SBC $02
	STA $12
	STA $02
	LDA #$0000
	CLC
	SBC $02
	BVC @UNKNOWN4
	BPL @UNKNOWN6
	BRA @UNKNOWN5
@UNKNOWN4:
	BMI @UNKNOWN6
@UNKNOWN5:
	LDA $12
	EOR #$FFFF
	INC
	STA $02
	STA $10
	BRA @UNKNOWN7
@UNKNOWN6:
	LDA $12
	STA $02
	STA $10
@UNKNOWN7:
	LDA $04
	ASL
	TAX
	LDA .LOWORD(ENTITY_ABS_X_TABLE),X
	SEC
	SBC .LOWORD(GAME_STATE)+game_state::leader_x_coord
	STA $12
	STA $02
	LDA #$0000
	CLC
	SBC $02
	BVC @UNKNOWN8
	BPL @UNKNOWN10
	BRA @UNKNOWN9
@UNKNOWN8:
	BMI @UNKNOWN10
@UNKNOWN9:
	LDA $12
	EOR #$FFFF
	INC
	BRA @UNKNOWN11
@UNKNOWN10:
	LDA $12
@UNKNOWN11:
	LDX $10
	STX $02
	CLC
	ADC $02
	STA $02
	LDA #$0010
	CLC
	SBC $02
	BVC @UNKNOWN12
	BPL @UNKNOWN14
	BRA @UNKNOWN13
@UNKNOWN12:
	BMI @UNKNOWN14
@UNKNOWN13:
	LDA #$000A
	BRA @UNKNOWN15
@UNKNOWN14:
	LDA $04
	ASL
	TAX
	LDA .LOWORD(ENTITY_ABS_Y_TABLE),X
	STA $0E
	LDY .LOWORD(ENTITY_ABS_X_TABLE),X
	LDX .LOWORD(GAME_STATE) + game_state::leader_y_coord
	LDA .LOWORD(GAME_STATE) + game_state::leader_x_coord
	JSL UNKNOWN_C41EFF
	LDY #$2000
	CLC
	ADC #$1000
	JSL DIVISION16S_DIVISOR_POSITIVE
	INC
	INC
@UNKNOWN15:
	PLD
	RTL
