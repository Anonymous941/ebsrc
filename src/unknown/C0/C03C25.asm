
UNKNOWN_C03C25: ;$C03C25
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E5DDA)
	LDX .LOWORD(GAME_STATE)+game_state::leader_y_coord
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	JSL UNKNOWN_C068F4
	LDA .LOWORD(UNKNOWN_7E5DD6)
	CMP .LOWORD(UNKNOWN_7E5DD4)
	BEQ @UNKNOWN0
	JSL WAIT_UNTIL_NEXT_FRAME
	JSL UNKNOWN_C069AF
@UNKNOWN0:
	STZ .LOWORD(UNKNOWN_7E5DDA)
	RTS
