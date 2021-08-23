
CC_19_1D: ;$C16080
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 22
	STX $02
	LDA #$0001
	CLC
	SBC .LOWORD(CC_ARGUMENT_GATHERING_LOOP_COUNTER)
	BRANCHLTEQS @UNKNOWN2
	LDA $02
	SEP #PROC_FLAGS::ACCUM8
	LDX .LOWORD(CC_ARGUMENT_GATHERING_LOOP_COUNTER)
	STA .LOWORD(CC_ARGUMENT_STORAGE),X
	REP #PROC_FLAGS::ACCUM8
	INC .LOWORD(CC_ARGUMENT_GATHERING_LOOP_COUNTER)
	LDA #.LOWORD(CC_19_1D)
	BRA @UNKNOWN6
@UNKNOWN2:
	LDA .LOWORD(CC_ARGUMENT_STORAGE)
	AND #$00FF
	TAX
	BEQ @ARG_IS_ZERO
	TXA
	BRA @ARG_IS_NONZERO
@ARG_IS_ZERO:
	JSR a:.LOWORD(GET_WORKING_MEMORY)
	LDA $06
@ARG_IS_NONZERO:
	DEC
	CLC
	ADC #.LOWORD(GAME_STATE)
	STA $14
	CLC
	ADC #game_state::unknownB8
	TAY
	STY $12
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),Y
	STA $06
	STZ $07
	STZ $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	JSR a:.LOWORD(SET_WORKING_MEMORY)
	LDA $14
	CLC
	ADC #game_state::unknownB6
	TAX
	STX $14
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	STA $06
	STZ $07
	STZ $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	JSR a:.LOWORD(SET_ARGUMENT_MEMORY)
	LDA $02
	BEQ @UNKNOWN5
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	LDX $14
	STA a:.LOWORD(RAM),X
	LDY $12
	STA a:.LOWORD(RAM),Y
@UNKNOWN5:
	REP #PROC_FLAGS::ACCUM8
	LDA #NULL
@UNKNOWN6:
	PLD
	RTS
