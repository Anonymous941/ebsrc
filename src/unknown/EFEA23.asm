
UNKNOWN_EFEA23: ;$EFEA23
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	JSL TEST_SRAM_SIZE
	CMP #$0000
	BEQ @RETURN ;insufficient SRAM
	LDA .LOWORD(UNKNOWN_7EB567)
	BEQ @UNKNOWN0
	JSL LOAD_REPLAY_SAVE_SLOT
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	STA .LOWORD(UNKNOWN_7EB569)
	LDA .LOWORD(GAME_STATE)+game_state::leader_y_coord
	STA .LOWORD(UNKNOWN_7EB56B)
	BRA @RETURN
@UNKNOWN0:
	JSL SAVE_REPLAY_SAVE_SLOT
@RETURN:
	RTL
