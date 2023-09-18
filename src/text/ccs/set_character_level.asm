
CC_1E_08: ;$C16A01
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	STACK_RESERVE_VARS
	STACK_RESERVE_PARAM_INT16
	STACK_RESERVE_PARAM_INT16
	STACK_RESERVE_RETURN_INT16
	END_STACK_VARS
	LDA #$0001
	CLC
	SBC CC_ARGUMENT_GATHERING_LOOP_COUNTER
	BRANCHLTEQS @UNKNOWN2
	TXA
	SEP #PROC_FLAGS::ACCUM8
	LDX CC_ARGUMENT_GATHERING_LOOP_COUNTER
	STA CC_ARGUMENT_STORAGE,X
	REP #PROC_FLAGS::ACCUM8
	INC CC_ARGUMENT_GATHERING_LOOP_COUNTER
	LDA #.LOWORD(CC_1E_08)
	BRA @UNKNOWN8
@UNKNOWN2:
	SEP #PROC_FLAGS::ACCUM8
	LDA CC_ARGUMENT_STORAGE
	STA @VIRTUAL00
	REP #PROC_FLAGS::ACCUM8
	TXA
	BEQ @ARG_1_IS_ZERO
	SIGN_EXTENDA1632 @VIRTUAL0A
	BRA @ARG_1_IS_NONZERO2
@ARG_1_IS_ZERO:
	JSR GET_ARGUMENT_MEMORY
	MOVE_INT @VIRTUAL06, @VIRTUAL0A
@ARG_1_IS_NONZERO2:
	LDA @VIRTUAL00
	AND #$00FF
	BEQ @ARG_2_IS_ZERO
	SEP #PROC_FLAGS::ACCUM8
	MOVE_INT832 @VIRTUAL00, @VIRTUAL06
	BRA @ARG_2_IS_NONZERO
@ARG_2_IS_ZERO:
	JSR GET_WORKING_MEMORY
@ARG_2_IS_NONZERO:
	LDY #$0001
	REP #PROC_FLAGS::ACCUM8
	LDA @VIRTUAL0A
	TAX
	LDA @VIRTUAL06
	JSR RESET_CHAR_LEVEL_ONE
	LDA #NULL
@UNKNOWN8:
	PLD
	RTS
