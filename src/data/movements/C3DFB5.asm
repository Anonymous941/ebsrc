
UNKNOWN_C3DFB5: ;$C3DFB5
	EBMOVE_CALL_C09F82 $0000, $0001
	EBMOVE_SHORTCALL_CONDITIONAL_NOT .LOWORD(UNKNOWN_C3DFD4)
	EBMOVE_SET_Z_VELOCITY $FF80
	EBMOVE_CALL_C09F82 $001E, $003C, $005A, $0078
	EBMOVE_SHORTJUMP .LOWORD(UNKNOWN_C3DFD4_2)
