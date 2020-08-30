
BTLACT_RANDOM_STAT_UP_1D4: ;$C2A27F
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 24
	LDA #$0007
	JSR a:.LOWORD(RAND_LIMIT)
	CMP #$0000
	BEQ @UNKNOWN5
	CMP #$0001
	BEQ @UNKNOWN7
	CMP #$0002
	BNE @UNKNOWN0
	JMP a:.LOWORD(@UNKNOWN9)
@UNKNOWN0:
	CMP #$0003
	BNE @UNKNOWN1
	JMP a:.LOWORD(@UNKNOWN10)
@UNKNOWN1:
	CMP #$0004
	BNE @UNKNOWN2
	JMP a:.LOWORD(@UNKNOWN11)
@UNKNOWN2:
	CMP #$0005
	BNE @UNKNOWN3
	JMP a:.LOWORD(@UNKNOWN12)
@UNKNOWN3:
	CMP #$0006
	BNE @UNKNOWN4
	JMP a:.LOWORD(@UNKNOWN13)
@UNKNOWN4:
	JMP a:.LOWORD(@UNKNOWN14)
@UNKNOWN5:
	LDA #$0004
	JSR a:.LOWORD(RAND_LIMIT)
	INC
	STA $16
	LDA .LOWORD(CURRENT_TARGET)
	CLC
	ADC #$0028
	TAX
	LDA $16
	STA $02
	LDA a:.LOWORD(RAM),X
	CLC
	ADC $02
	STA a:.LOWORD(RAM),X
	LOADPTR TEXT_BATTLE_DEFENSE_WENT_UP, $0E
	LDA $16
	STA $06
	STZ $08
	BPL @UNKNOWN6
	DEC $08
@UNKNOWN6:
	MOVE_INT $06, $12
	JSL DISPLAY_TEXT_WAIT
	BRA @UNKNOWN14
@UNKNOWN7:
	LDA #$0004
	JSR a:.LOWORD(RAND_LIMIT)
	INC
	STA $16
	LDA .LOWORD(CURRENT_TARGET)
	CLC
	ADC #$0026
	TAX
	LDA $16
	STA $02
	LDA a:.LOWORD(RAM),X
	CLC
	ADC $02
	STA a:.LOWORD(RAM),X
	LOADPTR TEXT_BATTLE_OFFENSE_WENT_UP, $0E
	LDA $16
	STA $06
	STZ $08
	BPL @UNKNOWN8
	DEC $08
@UNKNOWN8:
	MOVE_INT $06, $12
	JSL DISPLAY_TEXT_WAIT
	BRA @UNKNOWN14
@UNKNOWN9:
	JSL BTLACT_SPEED_UP_1D4
	BRA @UNKNOWN14
@UNKNOWN10:
	JSL BTLACT_GUTS_UP_1D4
	BRA @UNKNOWN14
@UNKNOWN11:
	JSL BTLACT_VITALITY_UP_1D4
	BRA @UNKNOWN14
@UNKNOWN12:
	JSL BTLACT_IQ_UP_1D4
	BRA @UNKNOWN14
@UNKNOWN13:
	JSL BTLACT_LUCK_UP_1D4
@UNKNOWN14:
	PLD
	RTL
