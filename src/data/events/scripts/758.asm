
EVENT_758: ;$C3924D
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA38)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V4, $0001
	EVENT_UNKNOWN_C0A443_ME2
	EVENT_UNKNOWN_C0A8B3 $0000, $0008
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V2, $0030
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V3, $0020
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB8A)
	EVENT_UNKNOWN_C0AA6E DIRECTION::UP, $00
	EVENT_PAUSE 1*QUARTER_OF_A_SECOND
	EVENT_UNKNOWN_C0AA6E DIRECTION::LEFT, $00
	EVENT_PAUSE 1*QUARTER_OF_A_SECOND
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C39E01)
	EVENT_QUEUE_TEXT MSG_THRK_GATEKEEPER_AB
	EVENT_PAUSE 1*HALF_OF_A_SECOND
	EVENT_UNKNOWN_C0AA6E DIRECTION::RIGHT, $00
	EVENT_HALT
