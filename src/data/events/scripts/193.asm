
EVENT_193: ;$C3D486
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3DBDB_ENTRY2)
	EVENT_UNKNOWN_C0A685 $00, $02
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0002
	EVENT_SET_SURFACE_FLAGS SURFACE_FLAGS::OBSCURE_LOWER_BODY
	EVENT_LOOP $0A
		EVENT_SET_Y_RELATIVE $FFFF
		EVENT_PAUSE 1*TWENTIETH_OF_A_SECOND
		EVENT_SET_Y_RELATIVE $0001
		EVENT_PAUSE 1*TWENTIETH_OF_A_SECOND
	EVENT_LOOP_END
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $0A18
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $13D8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $08E8
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $13D8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_UNKNOWN_C0A907 $4B
	EVENT_EXEC_TEXT_BLOCK TEXT_EVENT_193
	EVENT_HALT
