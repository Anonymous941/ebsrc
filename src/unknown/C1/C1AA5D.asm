
UNKNOWN_C1AA5D: ;$C1AA5D
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 24
	LDA #.LOWORD(UNKNOWN_7E9C8A)
	JSL UNKNOWN_C20A20
	LDA .LOWORD(GAME_STATE) + game_state::unknown7A
	AND #$00FF
	TAX
	STX $16
@UNKNOWN0:
	LDA .LOWORD(GAME_STATE)+game_state::player_controlled_party_count
	AND #$00FF
	CMP #$0001
	BNE @UNKNOWN1
	LDX $16
	TXA
	JSL UNKNOWN_C1A778
@UNKNOWN1:
	LDA .LOWORD(GAME_STATE)+game_state::player_controlled_party_count
	AND #$00FF
	CMP #$0001
	BEQ @UNKNOWN2
	LDA #$0000
	JSR a:.LOWORD(UNKNOWN_C193E7)
	LOADPTR UNKNOWN_C1A778, $0E
	MOVE_INT_CONSTANT NULL, $12
	LDX #$0001
	LDA #$0000
	JSR a:.LOWORD(CHAR_SELECT_PROMPT)
	TAX
	STX $16
	JSR a:.LOWORD(UNKNOWN_C19437)
	BRA @UNKNOWN3
@UNKNOWN2:
	LDA .LOWORD(GAME_STATE) + game_state::unknown7A
	AND #$00FF
	TAX
	STX $16
	LDA #$0000
	JSL UNKNOWN_C43573
@UNKNOWN3:
	LDX $16
	BEQ @UNKNOWN4
	TXA
	JSR a:.LOWORD(UNKNOWN_C1A795)
	LDA .LOWORD(GAME_STATE)+game_state::player_controlled_party_count
	AND #$00FF
	CMP #$0001
	BNE @UNKNOWN0
@UNKNOWN4:
	LDA #$002D
	JSL CLOSE_WINDOW
	LDA #$0006
	JSL CLOSE_WINDOW
	LDA #.LOWORD(UNKNOWN_7E9C8A)
	JSL UNKNOWN_C20ABC
	LDX $16
	TXA
	PLD
	RTS
