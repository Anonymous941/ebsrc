
DISPLAY_VIEW_CHARACTER_DEBUG_OVERLAY: ;$EFDE1A
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	LDY #$0040
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	JSL DIVISION16S_DIVISOR_POSITIVE
	STA $04
	JSR a:.LOWORD(INTEGER_TO_HEX_DEBUG_TILES)
	.A16
	TAX
	LDA #$007E
	STA $0E
	LDA #$7F24
	STA $10
	TXY
	LDX #$0008
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY_ENTRY_B
	LDY #$0040
	LDA .LOWORD(GAME_STATE)+game_state::leader_y_coord
	JSL DIVISION16S_DIVISOR_POSITIVE
	STA $02
	JSR a:.LOWORD(INTEGER_TO_HEX_DEBUG_TILES)
	.A16
	TAX
	LDA #$007E
	STA $0E
	LDA #$7F2A
	STA $10
	TXY
	LDX #$0008
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY_ENTRY_B
	LDX $02
	LDA $04
	JSL UNKNOWN_C0263D
	JSR a:.LOWORD(INTEGER_TO_DECIMAL_DEBUG_TILES)
	.A16
	TAX
	LDA #$007E
	STA $0E
	LDA #$7F35
	STA $10
	TXY
	LDX #$0008
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY_ENTRY_B
	LDA .LOWORD(UNKNOWN_7E4A68)
	JSR a:.LOWORD(INTEGER_TO_DECIMAL_DEBUG_TILES)
	.A16
	TAX
	LDA #$007E
	STA $0E
	LDA #$7F3A
	STA $10
	TXY
	LDX #$0008
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY_ENTRY_B
	.A16
	LDA .LOWORD(BATTLE_SWIRL_COUNTDOWN)
	BEQ @UNKNOWN2
	LDA #$0000
	STA $02
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA $02
	ASL
	TAX
	LDA .LOWORD(UNKNOWN_7E9F8C),X
	JSR a:.LOWORD(INTEGER_TO_DECIMAL_DEBUG_TILES)
	.A16
	TAX
	LDA #$007E
	STA $0E
	LDA $02
	STA $04
	ASL
	ASL
	ADC $04
	CLC
	ADC #$7F46
	STA $10
	TXY
	LDX #$0008
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY_ENTRY_B
	.A16
	INC $02
@UNKNOWN1:
	LDA $02
	CMP #$0005
	BNE @UNKNOWN0
	LDA .LOWORD(CURRENT_BATTLE_GROUP)
	JSR a:.LOWORD(INTEGER_TO_DECIMAL_DEBUG_TILES)
	.A16
	TAX
	LDA #$007E
	STA $0E
	LDA #$7F41
	STA $10
	TXY
	LDX #$0008
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY_ENTRY_B
@UNKNOWN2:
	PLD
	RTS
