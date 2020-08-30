
BTLACT_SNAKE: ;$C2A89D
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	JSR a:.LOWORD(ATK_FAIL_CHK)
	CMP #$0000
	BNE @UNKNOWN1
	LDA #$00FA
	JSR a:.LOWORD(SUCCESS_SPEED)
	CMP #$0000
	BEQ @UNKNOWN0
	LDA #$0004
	JSR a:.LOWORD(RAND_LIMIT)
	LDX #$00FF
	INC
	JSR a:.LOWORD(CALC_RESIST_DAMAGE)
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0080
	JSR a:.LOWORD(SUCCESS_255)
	.A16
	CMP #$0000
	BEQ @UNKNOWN1
	LDY #STATUS_0::POISONED
	LDX #STATUS_GROUP::PERSISTENT_EASYHEAL
	LDA .LOWORD(CURRENT_TARGET)
	JSR a:.LOWORD(INFLICT_STATUS_BATTLE)
	.A16
	CMP #$0000
	BEQ @UNKNOWN1
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_GOT_POISONED
	BRA @UNKNOWN1
@UNKNOWN0:
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_IT_DIDNT_WORK_ON_X
@UNKNOWN1:
	PLD
	RTL
