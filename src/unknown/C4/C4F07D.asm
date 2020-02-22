
;Loads graphics for the staff credits, but what else?
UNKNOWN_C4F07D: ;$C4F07D
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 22
	LOADPTR UNKNOWN_7F0000, $06
	JSL UNKNOWN_C08726
	JSL UNKNOWN_C021E6
	STZ $B4F7
	STZ $B4F5
	STZ $B4F3
	LDY #$0000
	LDX #$3800
	LDA #$0001
	JSL SET_BG1_VRAM_LOCATION
	LDY #$2000
	LDX #$7000
	LDA #$0003
	JSL SET_BG2_VRAM_LOCATION
	LDY #$6000
	LDX #$6C00
	LDA #$0000
	JSL SET_BG3_VRAM_LOCATION
	LDA #$0062
	JSL SET_OAM_SIZE
	STZ a:.LOWORD(BG3_X_POS)
	STZ a:.LOWORD(BG3_Y_POS)
	STZ a:.LOWORD(BG2_Y_POS)
	STZ a:.LOWORD(BG2_X_POS)
	STZ a:.LOWORD(BG1_Y_POS)
	STZ a:.LOWORD(BG1_X_POS)
	JSL UNKNOWN_C08B19_ENTRY_POINT_2
	LDA #$0000
	STA [$06]
	COPY_TO_VRAM1P $06, $3800, $1000, $03
	.A16
	LDA #$240C
	STA [$06]
	COPY_TO_VRAM1P $06, $7000, $1000, $09
	.A16
	COPY_TO_VRAM1 UNKNOWN_7F0000+1, $7000, $1000, $0F
	.A16
	LOADPTR UNKNOWN_E1E94A, $0E
	MOVE_INT $06, $12
	JSL DECOMP
	LDA #$0220
	STA $02
	LOADPTR UNKNOWN_E1E924+6, $0E
	LDX #$0020
	LDA $02
	JSL MEMCPY16
	COPY_TO_VRAM1P $06, $7000, $700, $00
	.A16
	COPY_TO_VRAM1 UNKNOWN_7F0700, $2000, $2000, $00
	.A16
	LDA #$0000
	STA [$06]
	COPY_TO_VRAM1P $06, $6C00, $800, $03
	.A16
	LOADPTR STAFF_CREDITS_FONT_GRAPHICS, $0E
	MOVE_INT $06, $12
	JSL DECOMP
	COPY_TO_VRAM1P $06, $6200, $C00, $00
	.A16
	LOADPTR STAFF_CREDITS_FONT_PALETTE, $0E
	LDX #$0010
	LDA #$0200
	JSL MEMCPY16
	LOADPTR SPRITE_GROUP_PALETTES, $0E
	LDX #$0100
	LDA #$0300
	JSL MEMCPY16
	SEP #PROC_FLAGS::ACCUM8
	STZ $0E
	LDX #$01E0
	REP #PROC_FLAGS::ACCUM8
	LDA $02
	JSL MEMSET16
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0018
	STA a:.LOWORD(UNKNOWN_7E0030)
	LDA #$0017
	STA a:.LOWORD(TM_MIRROR)
	REP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(UNKNOWN_7EB4E3)
	MOVE_INT_CONSTANT NULL, $B4EB
	LDA #$0007
	STA $B4E5
	LDA #$7DFE
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	LDX #$0000
	BRA @UNKNOWN1
@UNKNOWN0:
	REP #PROC_FLAGS::ACCUM8
	LDA #$0000
	STA [$06]
	INC $06
	INC $06
	INX
@UNKNOWN1:
	CPX #$0200
	BCC @UNKNOWN0
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT_CONSTANT STAFF_TEXT, $B4E7
	JSL UNKNOWN_C08744
	PLD
	RTL
