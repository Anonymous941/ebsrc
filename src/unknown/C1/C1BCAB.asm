
UNKNOWN_C1BCAB: ;$C1BCAB
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 26
	STA $18
	LDA .LOWORD(OVERWORLD_STATUS_SUPPRESSION)
	STA $16
	LDA #$0001
	STA .LOWORD(OVERWORLD_STATUS_SUPPRESSION)
	LOADPTR TELEPORT_DESTINATION_TABLE, $0A
	LDA $18
	ASL
	ASL
	ASL
	CLC
	ADC $0A
	STA $0A
	STA $12
	LDA $0C
	STA $14
	LDY #$0001
	STY $18
	BRA @UNKNOWN1
@UNKNOWN0:
	LDX #$0000
	TYA
	JSL SET_EVENT_FLAG
	LDY $18
	INY
	STY $18
@UNKNOWN1:
	CPY #$000A
	BCC @UNKNOWN0
	BEQ @UNKNOWN0
	JSL UNKNOWN_C06B3D
	LDA #$0005
	MOVE_INTX $0A, $06
	CLC
	ADC $06
	STA $06
	LDX #$0001
	LDA [$06]
	AND #$00FF
	JSL GET_SCREEN_TRANSITION_SOUND_EFFECT
	JSL PLAY_SOUND
	LDA .LOWORD(UNKNOWN_7EB4B6)
	BEQ @UNKNOWN2
	LDX #$0001
	TXA
	JSL FADE_OUT
	BRA @UNKNOWN3
@UNKNOWN2:
	LDX #$0001
	LDA [$06]
	AND #$00FF
	JSL SCREEN_TRANSITION
@UNKNOWN3:
	MOVE_INT $0A, $06
	LDA [$06]
	ASL
	ASL
	ASL
	STA $18
	LDY #$0002
	LDA [$0A],Y
	ASL
	ASL
	ASL
	STA $04
	LDA #$0004
	MOVE_INTX $0A, $06
	CLC
	ADC $06
	STA $06
	LDA [$06]
	AND #$00FF
	AND #$007F
	DEC
	STA $02
	LDX $04
	LDA $18
	JSL LOAD_MAP_AT_POSITION
	STZ .LOWORD(UNKNOWN_7E2890)
	LDY $02
	LDX $04
	LDA $18
	JSL UNKNOWN_C03FA9
	LDA [$06]
	AND #$00FF
	AND #$0080
	BEQ @UNKNOWN4
	LDA $02
	JSL UNKNOWN_C052D4
@UNKNOWN4:
	LDX $04
	LDA $18
	JSL UNKNOWN_C068F4
	JSL UNKNOWN_C069AF
	MOVE_INT_CONSTANT NULL, $06
	MOVE_INT $06, $0E
	MOVE_INT $06, $0A
	MOVE_INT .LOWORD(UNKNOWN_7E9D1B), $06
	CMP $0C
	BNE @UNKNOWN5
	LDA $06
	CMP $0A
@UNKNOWN5:
	BEQ @UNKNOWN6
	MOVE_INT .LOWORD(UNKNOWN_7E9D1B), $06
	PHA
	MOVE_INT $06, a:.LOWORD(UNKNOWN_7E00BC)
	PLA
	JSL UNKNOWN_C09279
	MOVE_INT $0E, $06
	MOVE_INT $06, .LOWORD(UNKNOWN_7E9D1B)
@UNKNOWN6:
	JSL UNKNOWN_C065A3
	LDA #$0005
	MOVE_INTX $12, $0A
	MOVE_INTX $0A, $06
	CLC
	ADC $06
	STA $06
	LDX #$0000
	LDA [$06]
	AND #$00FF
	JSL GET_SCREEN_TRANSITION_SOUND_EFFECT
	JSL PLAY_SOUND
	LDA .LOWORD(UNKNOWN_7EB4B6)
	BEQ @UNKNOWN7
	LDX #$0001
	TXA
	JSL FADE_IN
	BRA @UNKNOWN8
@UNKNOWN7:
	LDX #$0000
	LDA [$06]
	AND #$00FF
	JSL SCREEN_TRANSITION
@UNKNOWN8:
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_7E5DC4)
	JSL SPAWN_BUZZ_BUZZ
	LDA $16
	STA .LOWORD(OVERWORLD_STATUS_SUPPRESSION)
	PLD
	RTS
