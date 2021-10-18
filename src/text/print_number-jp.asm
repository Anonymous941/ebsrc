
PRINT_NUMBER: ;$C10DF6
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 24
	MOVE_INT $26, $0A
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	CMP #$FFFF
	BEQL @UNKNOWN6
.IF CLEAN_ROM
	MOVE_INT_CONSTANT $FFFF967F, $06 ; fun with C enums?
.ELSE
	MOVE_INT_CONSTANT 9999999, $06
.ENDIF
	LDA $06
	CMP $0A
	LDA $08
	SBC $0C
	BCS @UNKNOWN1
	MOVE_INT $06, $0A
@UNKNOWN1:
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	ASL
	TAX
	LDA .LOWORD(WINDOW_EXISTENCE_TABLE),X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	CLC
	ADC #.LOWORD(WINDOW_STATS_TABLE)
	TAX
	STX $16
	MOVE_INT $0A, $0E
	JSR UNKNOWN_C10D7C
	TAY
	STY $14
	STY $04
	LDA #$0007
	SEC
	SBC $04
	CLC
	ADC #.LOWORD(UNKNOWN_7E895A)
	STA $02
	LDX $16
	LDA a:window_stats::number_padding,X
	AND #$00FF
	STA $12
	AND #$0080
	BNE @UNKNOWN5
	LDA $12
	AND #$000F
	TAX
	INX
	STX $16
	STY $04
	TXA
	CMP $04
	BCS @UNKNOWN3
	TYX
	STX $16
	BRA @UNKNOWN3
@UNKNOWN2:
	LDA #CHAR::SPACE
	JSR PRINT_LETTER
	LDX $16
	DEX
	STX $16
@UNKNOWN3:
	LDY $14
	STY $04
	TXA
	CMP $04
	BNE @UNKNOWN2
	BRA @UNKNOWN5
@UNKNOWN4:
	LDX $02
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	CLC
	ADC #CHAR::ZERO
	INC $02
	JSR PRINT_LETTER
	LDY $14
	DEY
	STY $14
@UNKNOWN5:
	CPY #$0000
	BNE @UNKNOWN4
@UNKNOWN6:
	PLD
	RTS
