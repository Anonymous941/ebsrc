
UNKNOWN_C0E897: ;$C0E897
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 26
	LDA .LOWORD(TELEPORT_STYLE)
	CMP #TELEPORT_STYLE::INSTANT
	BNE @UNKNOWN0
	LDX .LOWORD(GAME_STATE)+game_state::leader_y_coord
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	JSL CENTER_SCREEN
	LDX #$0001
	TXA
	JSL FADE_IN
	JSR a:.LOWORD(UNKNOWN_C0DD0F)
	JMP @UNKNOWN7
@UNKNOWN0:
	LDA #$0000
	STA $02
	BRA @UNKNOWN2
@UNKNOWN1:
	LDA $02
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA #$FFFF
	STA .LOWORD(CHAR_STRUCT)+55,X
	LDA $02
	CLC
	ADC #$0018
	TAY
	LDX #$0000
	STX $18
	LDX $02
	LDA .LOWORD(GAME_STATE) + game_state::unknown96,X
	AND #$00FF
	DEC
	LDX $18
	JSL UNKNOWN_C07A56
	INC $02
@UNKNOWN2:
	LDA $02
	CMP #$0006
	BCC @UNKNOWN1
	LDA #$0000
	STA .LOWORD(UNKNOWN_7E9F45)
	LDA #$0008
	STA .LOWORD(UNKNOWN_7E9F47)
	LDA #$0006
	STA .LOWORD(GAME_STATE)+game_state::leader_direction
	LDA #$0003
	STA .LOWORD(UNKNOWN_7E9F43)
	LOADPTR UNKNOWN_C0E776, $0E
	LOADPTR UNKNOWN_C0E3C1, $12
	LDA #$0017
	JSL SET_PARTY_TICK_CALLBACKS
	JSR a:.LOWORD(UNKNOWN_C0DE16)
	LDA #MUSIC::TELEPORT_IN
	JSL CHANGE_MUSIC
	LDX #$0000
	STX $16
	BRA @UNKNOWN4
@UNKNOWN3:
	JSL WAIT_UNTIL_NEXT_FRAME
	LDX $16
	INX
	STX $16
@UNKNOWN4:
	CPX #$001E
	BCC @UNKNOWN3
	LDX #$0004
	LDA #$0001
	JSL FADE_IN
	BRA @UNKNOWN6
@UNKNOWN5:
	JSL OAM_CLEAR
	JSL UNKNOWN_C09466
	JSL UPDATE_SCREEN
	JSL WAIT_UNTIL_NEXT_FRAME
@UNKNOWN6:
	LDA .LOWORD(UNKNOWN_7E9F47)
	BNE @UNKNOWN5
	LDX .LOWORD(GAME_STATE)+game_state::leader_y_coord
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	JSL CENTER_SCREEN
@UNKNOWN7:
	PLD
	RTS
