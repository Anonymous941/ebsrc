
EVENT_711: ;$C3886C
	EVENT_UNKNOWN_43 $00
	EVENT_SET_SURFACE_FLAGS $00
	EVENT_UNKNOWN_WRITE_121E .LOWORD(UNKNOWN_C09FAE_ENTRY2)
	EVENT_SET_10F2 $00
	EVENT_SET_VELOCITIES_ZERO
	EVENT_SET_SURFACE_FLAGS $00
	EVENT_UNKNOWN_C0A3A4_ME2
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V0, $0D80
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V1, $0ED8
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V2, $0018
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V3, $0008
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB8A)
	EVENT_EXEC_TEXT_BLOCK TEXT_EVENT_711
	EVENT_PAUSE 1*FRAME
@UNKNOWN1: ;$C3889F
	EVENT_UNKNOWN_C0A86F $006A
	EVENT_PAUSE 1*FRAME
	EVENT_TEST_EVENT_FLAG EVENT_FLAG::UNKNOWN_20A
	EVENT_SHORTCALL_CONDITIONAL .LOWORD(@UNKNOWN1)
	EVENT_UNKNOWN_43 $03
	EVENT_UNKNOWN_C0AA6E DIRECTION::RIGHT, $00
@UNKNOWN2: ;$C388B8
	EVENT_UNKNOWN_C0A86F $006A
	EVENT_PAUSE 1*FRAME
	EVENT_SHORTJUMP .LOWORD(@UNKNOWN2)
