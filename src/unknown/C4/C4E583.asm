
UNKNOWN_C4E583: ;$C4E583
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 42
	STY $28
	STX $26
	STA $02
	LOADPTR FONT_PTR_TABLE, $22
	STZ .LOWORD(UNKNOWN_7E9E25)
	STZ .LOWORD(UNKNOWN_7E9E23)
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FF
	STA $0E
	LDX #$0340
	REP #PROC_FLAGS::ACCUM8
	LDA #.LOWORD(UNKNOWN_7E3492)
	JSL MEMSET16
	STZ .LOWORD(UNKNOWN_7E9654)
	STZ .LOWORD(UNKNOWN_7E9652)
	LDA $02
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDX $26
	LDA #$FFFF
	JSL UNKNOWN_C1FF99
	LDA #$0000
	STA $04
	JMP a:.LOWORD(@UNKNOWN3)
@UNKNOWN0:
	AND #$00FF
	SEC
	SBC #$0050
	AND #$007F
	STA $20
	MOVE_INT $22, $06
	LDY #$0004
	LDA [$06],Y
	PHA
	INY
	INY
	LDA [$06],Y
	STA $0C
	PLA
	STA $0A
	LDA $20
	PHA
	LDY #$0008
	LDA [$22],Y
	PLY
	JSL MULT16
	CLC
	ADC $0A
	STA $0A
	MOVE_INT $22, $06
	DEREFERENCE_PTR_TO $06, $06
	LDA $20
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	CLC
	ADC .LOWORD(UNKNOWN_7E5E6D)
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	TAY
	STY $1E
	CPY #$0008
	BCC @UNKNOWN2
	BEQ @UNKNOWN2
@UNKNOWN1:
	MOVE_INT $22, $06
	LDA #$000A
	CLC
	ADC $06
	STA $06
	STA $1A
	LDA $08
	STA $1C
	MOVE_INT $0A, $06
	MOVE_INT $06, $0E
	MOVE_INT $1A, $06
	LDA [$06]
	TAX
	TYA
	JSL UNKNOWN_C44B3A
	LDY $1E
	TYA
	SEC
	SBC #$0008
	TAY
	STY $1E
	LDA [$06]
	CLC
	ADC $0A
	STA $0A
	CPY #$0008
	BEQ @UNKNOWN2
	BCS @UNKNOWN1
@UNKNOWN2:
	MOVE_INT $0A, $06
	MOVE_INT $06, $0E
	LDY #$000A
	LDA [$22],Y
	TAX
	LDY $1E
	TYA
	JSL UNKNOWN_C44B3A
	INC $02
	INC $04
@UNKNOWN3:
	LDX $02
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	BEQ @UNKNOWN4
	JMP a:.LOWORD(@UNKNOWN0)
@UNKNOWN4:
	LDA $26
	JSL UNKNOWN_C4EEE1
	LDA $28
	ASL
	ASL
	ASL
	STA $04
	LDA #$0000
	STA $02
	STA $18
	JMP a:.LOWORD(@UNKNOWN6)
@UNKNOWN5:
	LDA $28
	AND #$000F
	STA $02
	LDA $28
	AND #$03F0
	ASL
	CLC
	ADC $02
	ASL
	ASL
	ASL
	ASL
	TAY
	STY $16
	LOADPTR UNKNOWN_7F0000, $06
	MOVE_INT $06, $1A
	LDA $18
	STA $02
	ASL
	ASL
	ASL
	ASL
	ASL
	TAX
	STX $20
	TYA
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	TXA
	CLC
	ADC #.LOWORD(UNKNOWN_7E3492)
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $12
	LDA #$0010
	JSL MEMCPY24
	LDY $16
	TYA
	CLC
	ADC #$0100
	MOVE_INTX $1A, $06
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDX $20
	TXA
	CLC
	ADC #$34A2
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $12
	LDA #$0010
	JSL MEMCPY24
	INC $02
	LDA $02
	STA $18
	LDA $04
	CLC
	ADC #$0008
	STA $04
	INC $28
@UNKNOWN6:
	LDA $02
	CMP $26
	BCS @UNKNOWN7
	BEQ @UNKNOWN7
	JMP a:.LOWORD(@UNKNOWN5)
@UNKNOWN7:
	PLD
	RTS
