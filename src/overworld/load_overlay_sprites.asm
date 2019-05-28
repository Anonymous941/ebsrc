
LOAD_OVERLAY_SPRITES: ;$C4B26B
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	PHD
	TDC
	ADC #$FFEC
	TCD
	LDA #$5600
	STA $12
	LOADPTR SPRITE_OVERLAY_SPRITES, $0A
	LDA #$0000
	STA $02
	BRA @FIRSTLOOPSTART
@LOADNEXTOVERLAYSPRITE:
	LDA $0A
	STA $06
	LDA $0C
	STA $08
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0002
	LDA [$0A],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	TAY
	LDA [$06]
	TAX
	LDA $12
	JSR a:.LOWORD(UNKNOWN_C4B1B8)
	STA $10
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0003
	LDA [$0A],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	TAY
	LDA [$06]
	TAX
	LDA $10
	JSR a:.LOWORD(UNKNOWN_C4B1B8)
	STA $12
	LDA #$0004
	CLC
	ADC $0A
	STA $0A
	INC $02
@FIRSTLOOPSTART:
	LDA f:SPRITE_OVERLAY_COUNT
	AND #$00FF
	STA $04
	LDA $02
	CMP $04
	BCC @LOADNEXTOVERLAYSPRITE
	LDA #$0000
	STA $0E
	BRA @SECONDLOOPSTART
@FILLNEXTENTRY:
	ASL
	TAX
	LOADPTR SPRITE_OVERLAY_MUSHROOMIZED, $06
	LDA $06
	STA .LOWORD(UNKNOWN_7E2EB6),X
	LOADPTR SPRITE_OVERLAY_SWEATING, $06
	LDA $06
	STA .LOWORD(UNKNOWN_7E2F6A),X
	LOADPTR SPRITE_OVERLAY_RIPPLE, $06
	LDA $06
	STA .LOWORD(UNKNOWN_7E301E),X
	LOADPTR SPRITE_OVERLAY_BIG_RIPPLE, $06
	LDA $06
	STA .LOWORD(UNKNOWN_7E30D2),X
	LDA $0E
	INC
	STA $0E
@SECONDLOOPSTART:
	CMP #$001E
	BCC @FILLNEXTENTRY
	PLD
	RTL
