
EVENT_136: ;$C3C46E
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AAAA)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V4, $000C
	EVENT_START_TASK .LOWORD(UNKNOWN_C3AFA3)
	EVENT_UNKNOWN_C0A685 $00, $01
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0001
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1A28
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $1E50
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_PLAY_SOUND SFX::UNKNOWN12
	EVENT_SET_X_RELATIVE $FF00
	EVENT_PAUSE 1*SECOND
	EVENT_PLAY_SOUND SFX::DOOR_CLOSE
	EVENT_PAUSE 1*SECOND
	EVENT_PLAY_SOUND SFX::DOOR_CLOSE
	EVENT_PAUSE $28*FRAMES
	EVENT_PLAY_SOUND SFX::UNKNOWN61
	EVENT_PAUSE $32*FRAMES
	EVENT_SET_X_RELATIVE $0100
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V4, $0007
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0014
	EVENT_UNKNOWN_C0A685 $80, $01
	EVENT_GET_POSITION_OF_PARTY_MEMBER $FF
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_END_LAST_TASK
	EVENT_YIELD_TO_TEXT
	EVENT_HALT
