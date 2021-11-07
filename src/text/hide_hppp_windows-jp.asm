
HIDE_HPPP_WINDOWS: ;$C10A1D
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 16
	JSR UNKNOWN_C3E6F8
	SEP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(UNKNOWN_7E89C9)
	REP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(BATTLE_MODE_FLAG)
	BNE @UNKNOWN2
	LDY #$0000
	STY $0E
	BRA @UNKNOWN1
@UNKNOWN0:
	TYA
	JSL UNDRAW_HP_PP_WINDOW
	LDY $0E
	TYA
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	LDA a:game_state::party_members,X
	AND #$00FF
	DEC
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)
	TAX
	LDA a:.LOWORD(RAM) + char_struct::current_hp_target,X
	STA a:.LOWORD(RAM) + char_struct::current_hp,X
	LDA a:.LOWORD(RAM) + char_struct::current_pp_target,X
	STA a:.LOWORD(RAM) + char_struct::current_pp,X
	STZ a:.LOWORD(RAM) + char_struct::current_pp_fraction,X
	STZ a:.LOWORD(RAM) + char_struct::current_hp_fraction,X
	LDY $0E
	INY
	STY $0E
@UNKNOWN1:
	LDA .LOWORD(GAME_STATE)+game_state::player_controlled_party_count
	AND #$00FF
	STA $02
	TYA
	CMP $02
	BNE @UNKNOWN0
@UNKNOWN2:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E9623)
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTS
