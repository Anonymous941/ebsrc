
MOVEMENT_225_226_227: ;$C302AC
	EBMOVE_CALLROUTINE UNKNOWN_C0A864, $FF
	EBMOVE_SHORTCALL .LOWORD(UNKNOWN_C3AB37)
	EBMOVE_WRITE_WORD_TO_9AF9_ENTRY $05, $0011
	EBMOVE_CALLROUTINE UNKNOWN_C0A938, $4B, $00
	EBMOVE_CALLROUTINE UNKNOWN_C0A685, $00, $01
	EBMOVE_SHORTCALL .LOWORD(UNKNOWN_C3AB44)
	EBMOVE_PAUSE $01
	EBMOVE_SET_VELOCITIES_ZERO
	EBMOVE_CALLROUTINE UNKNOWN_C0A938, $4B, $00
	EBMOVE_CALLROUTINE UNKNOWN_C0A8C6
	EBMOVE_SHORTJUMP $02C7
