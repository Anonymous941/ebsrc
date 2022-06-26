
UNKNOWN_C07213: ;$C07213
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 15
	LDA #$0000
	STA $02
	JMP @UNKNOWN3
@UNKNOWN0:
	LDA $02
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAY
	SEP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(RAM) + game_state::unknownC8,Y
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	BEQL @UNKNOWN2
	LDA $02
	OPTIMIZED_MULT $04, .SIZEOF(active_hotspot)
	CLC
	ADC #.LOWORD(ACTIVE_HOTSPOTS)
	TAX
	LOADPTR MAP_HOTSPOTS, $06
	LDA a:.LOWORD(RAM)+game_state::unknownC8 + 2,Y
	AND #$00FF
	ASL
	ASL
	ASL
	CLC
	ADC $06
	STA $06
	LDA $0E
	AND #$00FF
	STA a:active_hotspot::mode,X
	MOVE_INT $06, $0A
	LDA [$0A]
	ASL
	ASL
	ASL
	STA a:active_hotspot::x1,X
	LDY #$0004
	LDA [$06],Y
	ASL
	ASL
	ASL
	STA a:active_hotspot::x2,X
	LDY #$0002
	LDA [$06],Y
	ASL
	ASL
	ASL
	STA a:active_hotspot::y1,X
	LDY #$0006
	LDA [$06],Y
	ASL
	ASL
	ASL
	STA a:active_hotspot::y2,X
	LDA $02
	ASL
	ASL
	CLC
	ADC #.LOWORD(GAME_STATE)
	CLC
	ADC #game_state::unknownC8 + 4
	TAY
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $06
	TXA
	CLC
	ADC #active_hotspot::pointer
	TAY
	MOVE_INT_YPTRDEST $06, a:.LOWORD(RAM)
@UNKNOWN2:
	INC $02
@UNKNOWN3:
	LDA $02
	CMP #$0002
	BCCL @UNKNOWN0
	PLD
	RTL
