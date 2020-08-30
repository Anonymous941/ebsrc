
INSECT_SPRAY_COMMON: ;$C2A9BD
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 20
	TAX
	STX $12
	JSR a:.LOWORD(SUCCESS_LUCK80)
	CMP #$0000
	BEQ @FAILURE
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::ally_or_enemy,X
	AND #$00FF
	CMP #$0001
	BNE @FAILURE
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::id,X
	JSR a:.LOWORD(GET_ENEMY_TYPE)
	CMP #$0001
	BNE @FAILURE
	LDX $12
	TXA
	JSR a:.LOWORD(FIFTY_PERCENT_VARIANCE)
	LDX #$00FF
	JSR a:.LOWORD(CALC_RESIST_DAMAGE)
	BRA @RETURN
@FAILURE:
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_IT_DIDNT_WORK_ON_X
@RETURN:
	PLD
	RTS
