
EVENT_317: ;$C31452
	EVENT_UNKNOWN_C0A82F
	EVENT_UNKNOWN_WRITE_121E .LOWORD(UNKNOWN_C09FAE_ENTRY4)
	EVENT_SET_10F2 $FF
	EVENT_SET_VELOCITIES_ZERO
	EVENT_LOOP $B4
		EVENT_LOOP $3C
			EVENT_UNKNOWN_C468A9
			EVENT_AND_TEMPVAR $0F00
			EVENT_UNKNOWN_C468AF
			EVENT_AND_TEMPVAR $0F00
			EVENT_SHORTCALL_CONDITIONAL .LOWORD(@UNKNOWN0)
			EVENT_SHORTJUMP .LOWORD(EVENT_35)
@UNKNOWN0: ;$C31476
			EVENT_PAUSE 1*FRAME
		EVENT_LOOP_END
	EVENT_LOOP_END
	EVENT_EXEC_TEXT_BLOCK TEXT_EVENT_317
	EVENT_SHORTJUMP .LOWORD(EVENT_35)
