
; Places player in world after loading a game
SPAWN: ;$C4C718
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 24
	LDA .LOWORD(RESPAWN_X)
	STA $02
	LDX .LOWORD(RESPAWN_Y)
	STX $16
	JSL UNKNOWN_C0943C
	JSR a:.LOWORD(UNKNOWN_C4C2DE)
	JSR a:.LOWORD(UNKNOWN_C4C64D)
	STA $04
	CMP #$0000
	BEQ @UNKNOWN0
	LDY #$0000
	LDX #$0001
	LDA #$0002
	JSL UNKNOWN_C08814
	JSL UNKNOWN_C09451
	JMP a:.LOWORD(@UNKNOWN9)
@UNKNOWN0:
	LDA #$0020
	JSL UNKNOWN_C4C58F
	LDA #$0002
	JSL UNKNOWN_C0AC0C
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0017
	STA a:.LOWORD(TM_MIRROR)
	REP #PROC_FLAGS::ACCUM8
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_7E436E)
	STA .LOWORD(UNKNOWN_7E5DD4)
	STA .LOWORD(CURRENT_MUSIC_TRACK)
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E4676)
	JSL WAIT_UNTIL_NEXT_FRAME
	LDY #$0006
	LDX $16
	LDA $02
	JSL INITIALIZE_MAP
	LDA .LOWORD(GAME_STATE) + game_state::party_members
	AND #$00FF
	DEC
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)
	STA .LOWORD(UNKNOWN_7E4DC6)
	LDA #$0000
	STA $14
	BRA @UNKNOWN2
@UNKNOWN1:
	CLC
	ADC .LOWORD(UNKNOWN_7E4DC6)
	TAX
	SEP #PROC_FLAGS::ACCUM8
	STZ a:char_struct::afflictions,X
	REP #PROC_FLAGS::ACCUM8
	LDA $14
	INC
	STA $14
@UNKNOWN2:
	CMP #$0006
	BCC @UNKNOWN1
	LDX .LOWORD(UNKNOWN_7E4DC6)
	LDA a:char_struct::max_hp,X
	LDX .LOWORD(UNKNOWN_7E4DC6)
	STA a:char_struct::current_hp_target,X
	LDX .LOWORD(UNKNOWN_7E4DC6)
	STA a:char_struct::current_hp,X
	LDX .LOWORD(UNKNOWN_7E4DC6)
	STZ a:char_struct::current_pp_target,X
	LDX .LOWORD(UNKNOWN_7E4DC6)
	STZ a:char_struct::current_pp,X
	LDY #.LOWORD(GAME_STATE) + game_state::money_carried
	STY $12
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $06
	MOVE_INT $06, $0E
	MOVE_INT $06, $0A
	MOVE_INT_CONSTANT 1, $06
	LDA $0A
	AND $06
	STA $0A
	LDA $0C
	AND $08
	STA $0C
	PHA
	LDA $0A
	PHA
	MOVE_INT_CONSTANT 2, $0A
	MOVE_INT $0E, $06
	JSL DIVISION32
	PLA
	STA $0A
	PLA
	STA $0C
	CLC
	ADD_INT_ASSIGN $06, $0A
	LDY $12
	MOVE_INT_YPTRDEST $06, a:.LOWORD(RAM)
	JSL UNKNOWN_C07B52
	LDY #$0001
	STY $16
	BRA @UNKNOWN4
@UNKNOWN3:
	LDX #$0000
	TYA
	JSL SET_EVENT_FLAG
	LDY $16
	INY
	STY $16
@UNKNOWN4:
	TYA
	CLC
	SBC #$000A
	BRANCHLTEQS @UNKNOWN3
	LDA #$0000
	STA $14
	BRA @UNKNOWN8
@UNKNOWN7:
	ASL
	TAX
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_30X2_TABLE_24),X
	LDA $14
	INC
	STA $14
@UNKNOWN8:
	CMP #$001E
	BCC @UNKNOWN7
	JSL UNKNOWN_C064D4
	STZ .LOWORD(UNKNOWN_7E9E56)
	STZ .LOWORD(UNKNOWN_7E5D58)
	JSL SPAWN_BUZZ_BUZZ
	JSL OAM_CLEAR
	JSL UNKNOWN_C09451
	LDA #$0020
	JSL UNKNOWN_C4C60E
@UNKNOWN9:
	LDA $04
	PLD
	RTL
