
UNKNOWN_C3E6F8: ;$C3E6F8
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	STACK_RESERVE_VARS
	END_STACK_VARS
	LDA BATTLE_MENU_CURRENT_CHARACTER_ID
	CMP #$FFFF
	BEQ @UNKNOWN2
	JSL WAIT_UNTIL_NEXT_FRAME
	LDA BATTLE_MENU_CURRENT_CHARACTER_ID
	OPTIMIZED_MULT @VIRTUAL04, 7
	STA @VIRTUAL02
	LDA GAME_STATE+game_state::player_controlled_party_count
	AND #$00FF
	OPTIMIZED_MULT @VIRTUAL04, 7
	PHA
	ASL
	PLA
	ROR
	STA @VIRTUAL04
	LDA #$0010
	SEC
	SBC @VIRTUAL04
	CLC
	ADC @VIRTUAL02
	ASL
	CLC
	ADC #.LOWORD(BG2_BUFFER) + (ACTIVE_HPPP_WINDOW_Y_OFFSET * 32) * 2
	TAY
	LDX #$0007
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA #$0000
	STA __BSS_START__,Y
	INY
	INY
	DEX
@UNKNOWN1:
	BNE @UNKNOWN0
	LDA #$FFFF
	STA BATTLE_MENU_CURRENT_CHARACTER_ID
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA UNKNOWN_7E9623
@UNKNOWN2:
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
