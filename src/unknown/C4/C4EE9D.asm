
UNKNOWN_C4EE9D: ;$C4EE9D
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 16
	LDA #$0000
	STA $02
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA $02
	ASL
	TAX
	LDY .LOWORD(UNKNOWN_7EB4D5),X
	STY $0E
	LDX #$0005
	LDA $02
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)
	LDY $0E
	JSR a:.LOWORD(UNKNOWN_C4EDA3)
	INC $02
@UNKNOWN1:
	LDA $02
	CMP #$0004
	BCC @UNKNOWN0
	LDY .LOWORD(UNKNOWN_7EB4DD)
	LDX #$0006
	LDA #.LOWORD(GAME_STATE) + game_state::pet_name
	JSR a:.LOWORD(UNKNOWN_C4EDA3)
	PLD
	RTS
