
UNKNOWN_EF0F60: ;$EF0F60
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDA a:.LOWORD(UNKNOWN_7E0028)
	AND #$00FF
	BNE @UNKNOWN0
	LDA a:.LOWORD(INIDISP_MIRROR)
	AND #$00FF
	CMP #$000F
	BEQ @UNKNOWN1
@UNKNOWN0:
	LDA #$0001
	BRA @UNKNOWN9
@UNKNOWN1:
	LDA .LOWORD(UNKNOWN_7E88E0)
	CMP #$FFFF
	BEQ @UNKNOWN2
	LDA #$0001
	BRA @UNKNOWN9
@UNKNOWN2:
	LDA .LOWORD(UNKNOWN_7EB4A8)
	CMP #$FFFF
	BEQ @UNKNOWN3
	LDA #$0001
	BRA @UNKNOWN9
@UNKNOWN3:
	LDA .LOWORD(OVERWORLD_STATUS_SUPPRESSION)
	BEQ @UNKNOWN4
	LDA #$0001
	BRA @UNKNOWN9
@UNKNOWN4:
	LDA .LOWORD(GAME_STATE)+game_state::current_party_members
	ASL
	TAX
	LDA .LOWORD(UNKNOWN_30X2_TABLE_16),X
	AND #$8000
	BEQ @UNKNOWN5
	LDA #$0001
	BRA @UNKNOWN9
@UNKNOWN5:
	LDA .LOWORD(SPRITE_TICK_CALLBACK_HIGH)+46
	AND #$C000
	BEQ @UNKNOWN6
	LDA #$0000
	BRA @UNKNOWN7
@UNKNOWN6:
	LDA .LOWORD(UNKNOWN_7E5D9A)
@UNKNOWN7:
	LDX .LOWORD(GAME_STATE)+game_state::walking_style
	CPX #WALKING_STYLE::LADDER
	BEQ @UNKNOWN8
	CPX #WALKING_STYLE::ROPE
	BEQ @UNKNOWN8
	CPX #WALKING_STYLE::ESCALATOR
	BEQ @UNKNOWN8
	CPX #WALKING_STYLE::STAIRS
	BNE @UNKNOWN9
@UNKNOWN8:
	LDA #$0001
@UNKNOWN9:
	RTL
