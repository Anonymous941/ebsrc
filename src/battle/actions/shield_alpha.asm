
BTLACT_SHIELD_A: ;$C29D44
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	LDX #STATUS_6::SHIELD
	LDA .LOWORD(CURRENT_TARGET)
	JSR a:.LOWORD(SHIELDS_COMMON)
	CMP #$0000
	BEQ @UNKNOWN0
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_SHIELD_GOT_STRONGER
	BRA @UNKNOWN1
@UNKNOWN0:
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_PROTECTED_BY_SHIELD
@UNKNOWN1:
	PLD
	RTL
