
UNKNOWN_C03A94: ;$C03A94
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 32
	STA $1E
	LDA .LOWORD(UNKNOWN_7E438A)
	ORA .LOWORD(UNKNOWN_7E438C)
	BEQ @UNKNOWN0
	LDA .LOWORD(UNKNOWN_7E438A)
	ASL
	ASL
	ASL
	STA $1C
	LDA .LOWORD(UNKNOWN_7E438C)
	ASL
	ASL
	ASL
	TAX
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	STA $1C
	LDX .LOWORD(GAME_STATE)+game_state::leader_y_coord
@UNKNOWN1:
	LDA $1C
	JSL LOAD_SECTOR_ATTRS
	AND #$0007
	STA $1A
	STA .LOWORD(GAME_STATE)+game_state::unknown92
	ASL
	STA .LOWORD(UNKNOWN_7E289A)
	STZ .LOWORD(UNKNOWN_7E289C)
	LDA $1A
	CMP #$0003
	BEQ @UNKNOWN2
	STZ .LOWORD(GAME_STATE)+game_state::walking_style
	BRA @UNKNOWN3
@UNKNOWN2:
	LDA #WALKING_STYLE::SLOWEST
	STA .LOWORD(GAME_STATE)+game_state::walking_style
@UNKNOWN3:
	LDA .LOWORD(UNKNOWN_7E1A42)
	STA $18
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_7E1A42)
	STZ $16
	JMP a:.LOWORD(@UNKNOWN9)
@UNKNOWN4:
	LDY #.LOWORD(GAME_STATE) + game_state::unknown96
	LDA ($16),Y
	AND #$00FF
	TAX
	BNE @UNKNOWN5
	JMP a:.LOWORD(@UNKNOWN8)
@UNKNOWN5:
	TXA
	DEC
	STA $04
	LDA $16
	ASL
	TAY
	LDA .LOWORD(GAME_STATE) + game_state::unknownA2,Y
	STA $02
	ASL
	TAX
	LDA .LOWORD(UNKNOWN_30X2_TABLE_3),X
	STA .LOWORD(UNKNOWN_7E0A38)
	LDA .LOWORD(UNKNOWN_30X2_TABLE_4),X
	STA .LOWORD(UNKNOWN_7E0A3A)
	STY .LOWORD(UNKNOWN_7E0A42)
	LDA .LOWORD(UNKNOWN_30X2_TABLE_16),X
	STA $14
	LDA .LOWORD(ENTITY_TICK_CALLBACK_HIGH),X
	STA $1A
	LDA $02
	JSL UNKNOWN_C02140
	LDA $02
	STA .LOWORD(UNKNOWN_7E9F73)
	LDA .LOWORD(GAME_STATE)+game_state::unknown92
	CMP #$0003
	BEQ @UNKNOWN6
	LDA $16
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)
	TAY
	LDX #$0000
	LDA $04
	JSL UNKNOWN_C0780F
	STA $1C
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	STA $0E
	LDA .LOWORD(GAME_STATE)+game_state::leader_y_coord
	STA $10
	LDY $02
	LDA $04
	ASL
	ASL
	ASL
	TAX
	INX
	INX
	INX
	INX
	LDA f:CHARACTER_INITIAL_ENTITY_DATA,X
	TAX
	LDA $1C
	JSL PARSE_C3FC49_DATA
	STA $12
	BRA @UNKNOWN7
@UNKNOWN6:
	LDA $16
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)
	TAY
	LDX #$000A
	LDA $04
	JSL UNKNOWN_C0780F
	STA $1C
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	STA $0E
	LDA .LOWORD(GAME_STATE)+game_state::leader_y_coord
	STA $10
	LDY $02
	LDA $04
	ASL
	ASL
	ASL
	TAX
	INX
	INX
	INX
	INX
	LDA f:CHARACTER_INITIAL_ENTITY_DATA,X
	TAX
	LDA $1C
	JSL PARSE_C3FC49_DATA
	STA $12
@UNKNOWN7:
	ASL
	TAX
	LDA $14
	STA .LOWORD(UNKNOWN_30X2_TABLE_16),X
	LDA $1A
	STA .LOWORD(ENTITY_TICK_CALLBACK_HIGH),X
	LDA $1E
	STA .LOWORD(ENTITY_DIRECTIONS),X
	STZ .LOWORD(UNKNOWN_30X2_TABLE_14),X
	LDA $12
	JSL UNKNOWN_C0A780
@UNKNOWN8:
	INC $16
@UNKNOWN9:
	LDA $16
	CMP #$0006
	BCS @UNKNOWN10
	BEQ @UNKNOWN10
	JMP a:.LOWORD(@UNKNOWN4)
@UNKNOWN10:
	LDA $18
	STA .LOWORD(UNKNOWN_7E1A42)
	JSL UNKNOWN_C039E5
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_7E5DA8)
	LDA .LOWORD(UNKNOWN_7E5D9A)
	STA $02
	STZ .LOWORD(UNKNOWN_7E5D9A)
	LDA #$0004
	STA $0E
	LDY .LOWORD(GAME_STATE)+game_state::current_party_members
	LDX .LOWORD(GAME_STATE)+game_state::leader_y_coord
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	JSL UNKNOWN_C05B7B
	LDA $02
	STA .LOWORD(UNKNOWN_7E5D9A)
	LDA .LOWORD(UNKNOWN_7E5DA8)
	CMP #$FFFF
	BEQ @UNKNOWN11
	LDX .LOWORD(UNKNOWN_7E5DAA)
	LDA .LOWORD(UNKNOWN_7E5DA8)
	JSL UNKNOWN_C07526
@UNKNOWN11:
	PLD
	RTL
