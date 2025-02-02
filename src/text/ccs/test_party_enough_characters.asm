
CC_1D_19: ;$C16172
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 20
	TXA
	LDX #$0000
	STX $12
	CMP #$0000
	BEQ @ARG_IS_ZERO
	STORE_INT1632 $06
	BRA @ARG_IS_NONZERO
@ARG_IS_ZERO:
	JSR GET_ARGUMENT_MEMORY
@ARG_IS_NONZERO:
	MOVE_INT $06, $0A
	SEP #PROC_FLAGS::ACCUM8
	MOVE_INT832 GAME_STATE+game_state::player_controlled_party_count, $06
	REP #PROC_FLAGS::ACCUM8
	LDA $06
	CMP $0A
	LDA $08
	SBC $0C
	BCS @UNKNOWN2
	LDX #$0001
	STX $12
@UNKNOWN2:
	LDX $12
	TXA
	STORE_INT1632S $06
	MOVE_INT $06, $0E
	JSR SET_WORKING_MEMORY
	LDA #NULL
	PLD
	RTS
