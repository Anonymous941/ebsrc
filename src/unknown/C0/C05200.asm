
UNKNOWN_C05200: ;$C05200
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 16
	LDA .LOWORD(BATTLE_DEBUG)
	BEQ @UNKNOWN0
	JMP a:.LOWORD(@UNKNOWN9)
@UNKNOWN0:
	LDA $9F6F
	BEQ @UNKNOWN1
	LDA .LOWORD(UNKNOWN_7E9F6B)
	CMP #$FFFF
	BNE @UNKNOWN2
	JSL UNKNOWN_C07716
	BRA @UNKNOWN2
@UNKNOWN1:
	LDA .LOWORD(UNKNOWN_7E9F6B)
	CMP #$FFFF
	BEQ @UNKNOWN2
	JSL UNKNOWN_C0777A
@UNKNOWN2:
	LDA .LOWORD(UNKNOWN_7E4472)
	BEQ @UNKNOWN3
	JSL UNKNOWN_C00172
@UNKNOWN3:
	LDA .LOWORD(UNKNOWN_7E4474)
	BEQ @UNKNOWN4
	JSL UNKNOWN_C0030F
@UNKNOWN4:
	LDA $9F2A
	BEQ @UNKNOWN5
	JSL UNKNOWN_C48FC4
@UNKNOWN5:
	JSL UNKNOWN_C04C45
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	XBA
	AND #$00FF
	STA $0E
	LDA .LOWORD(GAME_STATE)+game_state::leader_y_coord
	XBA
	AND #$00FF
	TAX
	LDA $0E
	EOR .LOWORD(UNKNOWN_7E5D5C)
	BNE @UNKNOWN6
	TXA
	EOR .LOWORD(UNKNOWN_7E5D5E)
	BEQ @UNKNOWN7
@UNKNOWN6:
	LDA $0E
	STA .LOWORD(UNKNOWN_7E5D5C)
	STX .LOWORD(UNKNOWN_7E5D5E)
	LDA .LOWORD(SECTOR_BOUNDARY_BEHAVIOUR_FLAG)
	BEQ @UNKNOWN7
	JSR a:.LOWORD(UNKNOWN_C03C25)
@UNKNOWN7:
	LDA .LOWORD(DAD_PHONE_TIMER)
	BNE @UNKNOWN8
	LDA .LOWORD(GAME_STATE) + game_state::unknownB0
	CMP #$0002
	BEQ @UNKNOWN8
	JSL LOAD_DAD_PHONE
@UNKNOWN8:
	STZ $9F6F
	LDA .LOWORD(GAME_STATE)+game_state::leader_direction
	STA .LOWORD(UNKNOWN_7E5D76)
	LDA .LOWORD(GAME_STATE)+game_state::current_party_members
	ASL
	STA .LOWORD(UNKNOWN_7E5D78)
	LDA .LOWORD(GAME_STATE) + game_state::unknown90
	BEQ @UNKNOWN9
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E0A34)
@UNKNOWN9:
	PLD
	RTL
