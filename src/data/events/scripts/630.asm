
EVENT_630: ;$C373C2
	EVENT_SET_PHYSICS_CALLBACK .LOWORD(UNKNOWN_C09FAE_ENTRY4)
	EVENT_UNKNOWN_C0AA6E DIRECTION::LEFT, $00
	EVENT_SET_VELOCITIES_ZERO
	EVENT_PAUSE 1*FIFTEENTH_OF_A_SECOND
	EVENT_UNKNOWN_C0AA6E DIRECTION::UP, $00
	EVENT_PAUSE 1*FIFTEENTH_OF_A_SECOND
	EVENT_UNKNOWN_C0AA6E DIRECTION::RIGHT, $00
	EVENT_PAUSE 1*FIFTEENTH_OF_A_SECOND
	EVENT_UNKNOWN_C0AA6E DIRECTION::DOWN, $00
	EVENT_PAUSE 1*FIFTEENTH_OF_A_SECOND
	EVENT_UNKNOWN_C0AA6E DIRECTION::LEFT, $01
	EVENT_PLAY_SOUND SFX::DAMAGE_TAKEN
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V0, $000C
	EVENT_UNKNOWN_C474A8
	EVENT_PAUSE 7*FRAMES
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V0, $0000
	EVENT_UNKNOWN_C474A8
	EVENT_YIELD_TO_TEXT
	EVENT_HALT
