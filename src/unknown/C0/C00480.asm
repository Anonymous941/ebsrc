
UNKNOWN_C00480: ;$C00480
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 34
	LDA #$0240
	JSR a:.LOWORD(UNKNOWN_C00391)
	LDY .LOWORD(UNKNOWN_7E43D6)
	LDA .LOWORD(UNKNOWN_7E43D0)
	XBA
	AND #$FF00
	JSL DIVISION16S_DIVISOR_POSITIVE ; UNKNOWN_7E43D0 / UNKNOWN_7E43D6
	STA $20
	LDY .LOWORD(UNKNOWN_7E43D8)
	LDA .LOWORD(UNKNOWN_7E43D2)
	XBA
	AND #$FF00
	JSL DIVISION16S_DIVISOR_POSITIVE ; UNKNOWN_7E43D2 / UNKNOWN_7E43D8
	STA $1E
	LDY .LOWORD(UNKNOWN_7E43DA)
	LDA .LOWORD(UNKNOWN_7E43D4)
	XBA
	AND #$FF00
	JSL DIVISION16S_DIVISOR_POSITIVE ; UNKNOWN_7E43D4 / UNKNOWN_7E43DA
	STA $1C
	LDY #$0003
	LDA $20
	CLC
	ADC $1E
	CLC
	ADC $1C
	JSL DIVISION16S_DIVISOR_POSITIVE
	STA $1A
	LDA $20
	CMP #$0100
	BEQ @UNKNOWN0;$20 == 0x100
	BCC @UNKNOWN0;$20 < 0x100
	JMP a:.LOWORD(@UNKNOWN7)
@UNKNOWN0:
	LDA $1E
	CMP #$0100
	BEQ @UNKNOWN1;$1E == 0x100
	BCC @UNKNOWN1;$1E < 0x100
	JMP a:.LOWORD(@UNKNOWN7)
@UNKNOWN1:
	LDA $1C
	CMP #$0100
	BEQ @UNKNOWN2 ;$1C == 0x100
	BCC @UNKNOWN2 ;$1C < 0x100
	JMP a:.LOWORD(@UNKNOWN7)
@UNKNOWN2:
	LDA #$0080
	STA $18
	JMP a:.LOWORD(@UNKNOWN6)
@UNKNOWN3:
	LDA $18
	ASL
	TAX
	LDA .LOWORD(CUR_TEXT_PAL),X
	TAX
	;Extract red
	AND #BGR555::RED
	STA $16
	TAY
	STY $14
	;Extract green
	TXA
	AND #BGR555::GREEN
	; >> 5
	LSR
	LSR
	LSR
	LSR
	LSR
	STA $02
	STA $12
	LDA $02
	STA $10
	;Extract blue
	TXA
	AND #BGR555::BLUE
	; >>10
	XBA
	AND #$00FF
	LSR
	LSR
	STA $04
	STA $0E
	LDA $16
	CMP $02
	BNE @UNKNOWN4 ;red != green
	LDA $02
	CMP $04
	BNE @UNKNOWN4 ;green != blue
	LDA $16
	STA $02
	LDA $04
	CMP $02
	BNE @UNKNOWN4 ;blue != red
	LDY $1A
	LDA $16
	JSL MULT16 ; red *= ???
	STA $16
	LDY $1A
	LDA $12
	STA $02
	JSL MULT16 ; blue *= ???
	STA $02
	LDY $1A
	LDA $04
	JSL MULT16 ; green *= ???
	STA $04
	BRA @UNKNOWN5
@UNKNOWN4:
	LDY $20
	LDA $16
	JSL MULT16 ; red *= ???
	STA $16
	LDY $1E
	LDA $12
	STA $02
	JSL MULT16 ; blue *= ???
	STA $02
	LDY $1C
	LDA $04
	JSL MULT16 ; green *= ???
	STA $04
@UNKNOWN5:
	LDA $16
	XBA
	AND #$00FF
	AND #$001F
	TAX
	LDY $14
	TYA
	JSR a:.LOWORD(UNKNOWN_C00434) ;red & new red
	TAY
	STY $14
	LDA $02
	XBA
	AND #$00FF
	AND #$001F
	TAX
	LDA $10
	JSR a:.LOWORD(UNKNOWN_C00434) ;green & new green
	STA $02
	LDA $04
	XBA
	AND #$00FF
	AND #$001F
	TAX
	LDA $0E
	JSR a:.LOWORD(UNKNOWN_C00434) ;blue & new blue
	STA $0E
	LDA $18
	ASL
	TAX
	LDY $14 ;final red
	LDA $02 ;final green
	ASL
	ASL
	ASL
	ASL
	ASL
	STA $04
	LDA $0E ;final blue
	XBA
	AND #$FF00
	ASL
	ASL
	ORA $04
	STY $02
	ORA $02
	STA .LOWORD(CUR_TEXT_PAL),X
	INC $18
@UNKNOWN6:
	LDA $18
	CMP #$0100
	BCS @UNKNOWN7
	BEQ @UNKNOWN7
	JMP a:.LOWORD(@UNKNOWN3)
@UNKNOWN7:
	PLD
	RTL
