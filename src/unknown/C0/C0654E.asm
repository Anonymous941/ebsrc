
UNKNOWN_C0654E: ;$C0654E
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	STACK_RESERVE_VARS
	STACK_RESERVE_RETURN_INT32
	END_STACK_VARS
	LDA CURRENT_QUEUED_INTERACTION
	OPTIMIZED_MULT @VIRTUAL04, .SIZEOF(queued_interaction)
	CLC
	ADC #.LOWORD(QUEUED_INTERACTIONS) + queued_interaction::text_ptr
	TAY
	MOVE_INT_YPTRSRC __BSS_START__, @VIRTUAL06
	MOVE_INT @VIRTUAL06, @RETURNVAL
	PLD
	RTL
