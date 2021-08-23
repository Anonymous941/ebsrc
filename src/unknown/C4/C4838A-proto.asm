
UNKNOWN_C4838A: ;$C4838A
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 50
	STA $30
	STZ $2E
	STZ $2C
	LDA #$0000
	STA $02
	STA $2A
	STZ .LOWORD(UNKNOWN_7E9E25)
	STZ .LOWORD(UNKNOWN_7E9E23)
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FF
	STA $0E
	LDX #$0200
	REP #PROC_FLAGS::ACCUM8
	LDA #.LOWORD(UNKNOWN_7E3492)
	JSL MEMSET16
	LDA #$0004
	STA $04
	LDA #.LOWORD(CHAR_STRUCT) + char_struct::name
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	JSL STRLEN
	TAY
	STY $28
	CPY #$0006
	BNE @UNKNOWN0
	DEY
	STY $28
@UNKNOWN0:
	LDA #$0006
	STA $26
	LDA #.LOWORD(CHAR_STRUCT) + char_struct::name
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	STZ $24
	BRA @UNKNOWN2
@UNKNOWN1:
	LDX $24
	LDA f:LUMINE_HALL_TEXT,X
	AND #$00FF
	TAX
	LDA $30
	JSL UNKNOWN_C4827B
	INC $24
@UNKNOWN2:
	LDA $04
	CLC
	SBC $24
	BRANCHGTS @UNKNOWN1
	LDA #$0000
	STA $04
	BRA @UNKNOWN6
@UNKNOWN5:
	LDA [$06]
	AND #$00FF
	TAX
	INC $06
	LDA $30
	JSL UNKNOWN_C4827B
	INC $04
@UNKNOWN6:
	LDY $28
	TYA
	CLC
	SBC $04
	BRANCHGTS @UNKNOWN5
	LDY #$0000
	STY $22
	BRA @UNKNOWN10
@UNKNOWN9:
	TYX
	LDA f:LUMINE_HALL_TEXT+4,X
	AND #$00FF
	TAX
	LDA $30
	JSL UNKNOWN_C4827B
	LDY $22
	INY
	STY $22
@UNKNOWN10:
	STY $04
	LDA $26
	CLC
	SBC $04
	BRANCHGTS @UNKNOWN9
	LDA .LOWORD(UNKNOWN_7E9E23)
	CLC
	ADC $2C
	STA $26
	LDY #$0000
	STY $28
	TYX
	STX $20
	JMP a:.LOWORD(@UNKNOWN14)
@UNKNOWN13:
	LOADPTR UNKNOWN_7F0000, $06
	MOVE_INT $06, $1C
	LDA #.LOWORD(UNKNOWN_7E3492)
	STA $0A
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $0C
	STZ $0D
	REP #PROC_FLAGS::ACCUM8
	LDA $02
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	TXA
	MOVE_INTX $0A, $06
	CLC
	ADC $06
	STA $06
	STA $12
	LDA $08
	STA $14
	LDA #$0010
	JSL MEMCPY24
	LDX $20
	TXA
	CLC
	ADC #$0010
	TAX
	STX $22
	LDA $02
	CLC
	ADC #$0100
	MOVE_INTY $1C, $06
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	TXA
	MOVE_INTX $0A, $06
	CLC
	ADC $06
	STA $06
	STA $12
	LDA $08
	STA $14
	LDA #$0010
	JSL MEMCPY24
	LDX $22
	TXA
	CLC
	ADC #$0010
	TAX
	STX $20
	LDA $02
	CLC
	ADC #$0010
	STA $02
	STA $2A
	LDY $28
	INY
	STY $28
@UNKNOWN14:
	LDA .LOWORD(UNKNOWN_7E9E23)
	LSR
	LSR
	LSR
	STA $22
	STA $04
	TYA
	CMP $04
	BCS @UNKNOWN15
	BEQ @UNKNOWN15
	JMP a:.LOWORD(@UNKNOWN13)
@UNKNOWN15:
	LDA #$00CD
	STA $2C
	LDA #.LOWORD(UNKNOWN_7E3492)
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDA $22
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC $06
	STA $06
	STA $12
	LDA $08
	STA $14
	LDA #$0020
	JSL MEMCPY24
	STZ .LOWORD(UNKNOWN_7E9E25)
	LDY #$0008
	LDA .LOWORD(UNKNOWN_7E9E23)
	JSL MODULUS16
	STA .LOWORD(UNKNOWN_7E9E23)
	LDA #$0000
	STA $04
	JMP a:.LOWORD(@UNKNOWN25)
@UNKNOWN16:
	LDA $2E
	CLC
	SBC #$0010
	JUMPLTEQS @UNKNOWN24
	STZ $2E
	LDA .LOWORD(UNKNOWN_7E9E23)
	CLC
	ADC $26
	STA $26
	LDY #$0000
	STY $28
	TYX
	STX $20
	JMP a:.LOWORD(@UNKNOWN21)
@UNKNOWN19:
	LOADPTR UNKNOWN_7F0000, $06
	MOVE_INT $06, $1C
	LDA #.LOWORD(UNKNOWN_7E3492)
	STA $0A
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $0C
	STZ $0D
	REP #PROC_FLAGS::ACCUM8
	LDA $2A
	STA $02
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	TXA
	MOVE_INTX $0A, $06
	CLC
	ADC $06
	STA $06
	STA $12
	LDA $08
	STA $14
	LDA #$0010
	JSL MEMCPY24
	LDX $20
	TXA
	CLC
	ADC #$0010
	TAX
	STX $20
	LDA $02
	CLC
	ADC #$0100
	MOVE_INTY $1C, $06
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	TXA
	MOVE_INTX $0A, $06
	CLC
	ADC $06
	STA $06
	STA $12
	LDA $08
	STA $14
	LDA #$0010
	JSL MEMCPY24
	LDX $20
	TXA
	CLC
	ADC #$0010
	TAX
	STX $20
	LDA $02
	CLC
	ADC #$0010
	STA $02
	STA $2A
	LDY #$0100
	LDA $02
	JSL MODULUS16S
	CMP #$0000
	BNE @UNKNOWN20
	LDA $02
	CLC
	ADC #$0100
	STA $02
	STA $2A
@UNKNOWN20:
	LDY $28
	INY
	STY $28
@UNKNOWN21:
	LDA .LOWORD(UNKNOWN_7E9E23)
	LSR
	LSR
	LSR
	STA $24
	STA $02
	TYA
	CMP $02
	BCS @UNKNOWN22
	BEQ @UNKNOWN22
	JMP a:.LOWORD(@UNKNOWN19)
@UNKNOWN22:
	LDY #$0008
	LDA .LOWORD(UNKNOWN_7E9E23)
	JSL MODULUS16
	CMP #$0000
	BEQ @UNKNOWN23
	LDA #.LOWORD(UNKNOWN_7E3492)
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDA $24
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC $06
	STA $06
	STA $12
	LDA $08
	STA $14
	LDA #$0020
	JSL MEMCPY24
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FF
	STA $0E
	LDX #$01E0
	REP #PROC_FLAGS::ACCUM8
	LDA #$34B2
	JSL MEMSET16
	STZ .LOWORD(UNKNOWN_7E9E25)
	LDY #$0008
	LDA .LOWORD(UNKNOWN_7E9E23)
	JSL MODULUS16
	STA .LOWORD(UNKNOWN_7E9E23)
	BRA @UNKNOWN24
@UNKNOWN23:
	STZ .LOWORD(UNKNOWN_7E9E23)
	STZ .LOWORD(UNKNOWN_7E9E25)
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FF
	STA $0E
	LDX #$0200
	REP #PROC_FLAGS::ACCUM8
	LDA #.LOWORD(UNKNOWN_7E3492)
	JSL MEMSET16
@UNKNOWN24:
	LDX $04
	LDA f:LUMINE_HALL_TEXT+10,X
	AND #$00FF
	TAX
	LDA $30
	JSL UNKNOWN_C4827B
	INC $2E
	INC $04
@UNKNOWN25:
	LDA $2C
	CLC
	SBC $04
	JUMPGTS @UNKNOWN16
	LDA .LOWORD(UNKNOWN_7E9E23)
	CLC
	ADC $26
	STA $04
	LDY #$0000
	STY $28
	TYX
	STX $20
	JMP a:.LOWORD(@UNKNOWN30)
@UNKNOWN28:
	LOADPTR UNKNOWN_7F0000, $06
	MOVE_INT $06, $18
	LDA #.LOWORD(UNKNOWN_7E3492)
	STA $0A
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $0C
	STZ $0D
	REP #PROC_FLAGS::ACCUM8
	LDA $2A
	STA $02
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	TXA
	MOVE_INTX $0A, $06
	CLC
	ADC $06
	STA $06
	STA $12
	LDA $08
	STA $14
	LDA #$0010
	JSL MEMCPY24
	LDX $20
	TXA
	CLC
	ADC #$0010
	TAX
	STX $16
	LDA $02
	CLC
	ADC #$0100
	MOVE_INTY $18, $06
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	TXA
	MOVE_INTX $0A, $06
	CLC
	ADC $06
	STA $06
	STA $12
	LDA $08
	STA $14
	LDA #$0010
	JSL MEMCPY24
	LDX $16
	TXA
	CLC
	ADC #$0010
	TAX
	STX $20
	LDA $02
	CLC
	ADC #$0010
	STA $02
	STA $2A
	LDY #$0100
	LDA $02
	JSL MODULUS16S
	CMP #$0000
	BNE @UNKNOWN29
	LDA $02
	CLC
	ADC #$0100
	STA $02
	STA $2A
@UNKNOWN29:
	LDY $28
	INY
	STY $28
@UNKNOWN30:
	LDA .LOWORD(UNKNOWN_7E9E23)
	LSR
	LSR
	LSR
	STA $02
	INC $02
	TYA
	CMP $02
	BCS @UNKNOWN31
	BEQ @UNKNOWN31
	JMP a:.LOWORD(@UNKNOWN28)
@UNKNOWN31:
	LDA $04
	ASL
	PHP
	LSR
	LSR
	LSR
	LSR
	PLP
	BCC @UNKNOWN32
	ORA #$F000
@UNKNOWN32:
	ASL
	ASL
	PLD
	RTL
