
UNKNOWN_C114B1: ;$C114B1
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 30
	STX $02
	TAY
	STY $1C
	MOVE_INT $30, $06
	MOVE_INT $06, $18
	MOVE_INT $2C, $0A
	MOVE_INT $0A, $06
	MOVE_INT $06, $0E
	MOVE_INT $18, $06
	MOVE_INT $06, $12
	JSR a:.LOWORD(UNKNOWN_C113D1)
	STA $16
	CLC
	ADC #$002C
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	STA a:.LOWORD(RAM),X
	REP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(UNKNOWN_7E5E71)
	AND #$00FF
	BEQ @UNKNOWN0
	LDY $1C
	TYA
	SEP #PROC_FLAGS::ACCUM8
	AND #$0007
	STA a:.LOWORD(RAM),X
	REP #PROC_FLAGS::ACCUM8
	TYA
	LSR
	LSR
	LSR
	TAY
	STY $1C
@UNKNOWN0:
	LDY $1C
	LDA $16
	TAX
	TYA
	STA a:.LOWORD(RAM)+8,X
	LDA $16
	TAX
	LDA $02
	STA a:.LOWORD(RAM)+10,X
	LDA $16
	PLD
	RTS
