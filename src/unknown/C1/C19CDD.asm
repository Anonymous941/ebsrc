
UNKNOWN_C19CDD: ;$C19CDD
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 20
	LDA #$0000
	STA $12
	BRA @UNKNOWN1
@UNKNOWN0:
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA #$0400
	STA .LOWORD(CHAR_STRUCT)+char_struct::hp_pp_window_options,X
	LDA $12
	INC
	STA $12
@UNKNOWN1:
	CMP #PLAYER_CHAR_COUNT
	BCC @UNKNOWN0
	LOADPTR TEXT_WINDOW_FLAVOUR_PALETTES, $06
	LDA .LOWORD(GAME_STATE)+game_state::text_flavour
	AND #$00FF
	DEC
	OPTIMIZED_MULT $04, 3
	TAX
	LDA f:TEXT_WINDOW_PROPERTIES,X
	CLC
	ADC #$0028
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDX #$0008
	LDA #$0218
	JSL MEMCPY16
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0018
	STA a:.LOWORD(UNKNOWN_7E0030)
	REP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E9623)
	PLD
	RTS
