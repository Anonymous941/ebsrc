
; int getScreenTransitionSoundEffect(int transitionID, int getStart)
GET_SCREEN_TRANSITION_SOUND_EFFECT: ;$C068AF
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	STA $0E
	LOADPTR SCREEN_TRANSITION_CONFIG_TABLE, $06
	LDA $0E
	OPTIMIZED_MULT $04, .SIZEOF(screen_transition_config)
	CLC
	ADC $06
	STA $06
	CPX #$0000
	BNE @UNKNOWN0
	SEP #PROC_FLAGS::ACCUM8
	LDY #screen_transition_config::ending_sound_effect
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	BRA @UNKNOWN1
@UNKNOWN0:
	SEP #PROC_FLAGS::ACCUM8
	LDY #screen_transition_config::start_sound_effect
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
@UNKNOWN1:
	PLD
	RTL
