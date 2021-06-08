
UNKNOWN_C008C3: ;$C008C3
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 28
	STA $1A
	LDA .LOWORD(UNKNOWN_7E438A)
	ORA .LOWORD(UNKNOWN_7E438C)
	BEQ @UNKNOWN0
	LDA .LOWORD(UNKNOWN_7E438A)
	LSR
	LSR
	LSR
	LSR
	LSR
	STA $1A
	LDA .LOWORD(UNKNOWN_7E438C)
	LSR
	LSR
	LSR
	LSR
	TAX
@UNKNOWN0:
	LDA $1A
	STA $02
	TXA
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC $02
	TAX
	LDA f:GLOBAL_MAP_TILESETPALETTE_DATA,X
	AND #$00FF
	STA $1A
	AND #$0007
	STA $18
	LDA $1A
	LSR
	LSR
	LSR
	STA $04
	ASL
	TAX
	LDA f:TILESET_TABLE,X
	TAY
	STY $16
	TYA
	ASL
	ASL
	STA $02
	LOADPTR MAP_DATA_TILE_ARRANGEMENT_PTR_TABLE, $0A
	LDA $02
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $0E
	LOADPTR UNKNOWN_7F8000, $12
	JSL DECOMP
	LDY $16
	TYA
	JSR a:.LOWORD(LOAD_TILE_COLLISION)
	LDY $16
	TYA
	JSL UNKNOWN_C006F2
	JSL UNKNOWN_C005E7
	LOADPTR SPRITE_GROUP_PALETTES, $0E
	LDX #$0100
	LDA #$0300
	JSL MEMCPY16
	LDA $04
	CMP .LOWORD(UNKNOWN_7E436E)
	BEQ @UNKNOWN3
	LDY $16
	STY .LOWORD(UNKNOWN_7E4372)
	LOADPTR MAP_DATA_TILESET_PTR_TABLE, $0A
	LDA $02
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $0E
	LOADPTR UNKNOWN_7F0000, $12
	JSL DECOMP
@UNKNOWN1:
	LDA a:.LOWORD(UNKNOWN_7E0028)
	AND #$00FF
	BNE @UNKNOWN1
	LDA .LOWORD(UNKNOWN_7EB4EF)
	BNE @UNKNOWN2
	COPY_TO_VRAM3 UNKNOWN_7F0000, $0000, $7000, $0000
	BRA @UNKNOWN3
@UNKNOWN2:
	.A16
	COPY_TO_VRAM3 UNKNOWN_7F0000, $0000, $4000, $0000
@UNKNOWN3:
	.A16
	LDA a:.LOWORD(UNKNOWN_7E0028)
	AND #$00FF
	BNE @UNKNOWN3
	LDX $18
	LDA $04
	JSL LOAD_MAP_PAL
	JSL UNKNOWN_C00480
	JSL UNKNOWN_C00778
	LDA .LOWORD(UNKNOWN_7EB4EF)
	BNE @UNKNOWN4
	JSL LOAD_OVERLAY_SPRITES
	JSR a:.LOWORD(UNKNOWN_C00085)
	JSR a:.LOWORD(UNKNOWN_C0023F)
@UNKNOWN4:
	LDA .LOWORD(UNKNOWN_7EB4EF)
	BNE @UNKNOWN7
	LDA .LOWORD(DEBUG)
	BEQ @UNKNOWN5
	JSL UNKNOWN_EFD9F3
	BRA @UNKNOWN6
@UNKNOWN5:
	JSL UNKNOWN_C47F87
@UNKNOWN6:
	LDA #$0000
	JSL UNKNOWN_C0856B
@UNKNOWN7:
	.A16
	LDA #$0200
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	LDA #$0040
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDX #$01C0
	LDA #.LOWORD(UNKNOWN_7E4476)
	JSL MEMCPY16
	LDA .LOWORD(UNKNOWN_7E4676)
	BEQ @UNKNOWN8
	JSL UNKNOWN_C496F9
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FF
	STA $0E
	LDX #$0200
	REP #PROC_FLAGS::ACCUM8
	LDA #$0200
	JSL MEMSET16
	STZ .LOWORD(UNKNOWN_7E4676)
@UNKNOWN8:
	LDA .LOWORD(UNKNOWN_7EB4EF)
	BEQ @UNKNOWN9
	JSL UNKNOWN_C496F9
	SEP #PROC_FLAGS::ACCUM8
	STZ $0E
	LDX #$01E0
	REP #PROC_FLAGS::ACCUM8
	LDA #$0220
	JSL MEMSET16
@UNKNOWN9:
	LDA #$0018
	JSL UNKNOWN_C0856B
	LDA $04
	STA .LOWORD(UNKNOWN_7E436E)
	LDA $18
	STA .LOWORD(UNKNOWN_7E4370)
	PLD
	RTS
