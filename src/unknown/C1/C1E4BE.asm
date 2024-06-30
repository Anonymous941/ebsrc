
UNKNOWN_C1E4BE: ;$C1E4BE
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 24
	STY $02
	STX $16
	STA $14
	JSL SET_INSTANT_PRINTING
	CREATE_WINDOW_NEAR $14
	LDA CURRENT_FOCUS_WINDOW
	ASL
	TAX
	LDA WINDOW_EXISTENCE_TABLE,X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	CLC
	ADC #.LOWORD(WINDOW_STATS_TABLE)
	TAY
	STY $12
    LDA #$0004
    CLC
    SBC $16
    BRANCHLTEQS @NONCHAR_DONT_CARE
	LDX #.SIZEOF(char_struct::name)
	BRA @UNKNOWN3
@NONCHAR_DONT_CARE:
	LDX #.SIZEOF(game_state::pet_name)
	; because there aren't seperate routines, the don't care pet name's length is copied throughout other text lengths
	; this means that if pet_name's length is 6 and there is a don't care name for favorite_food that is 7 characters long, it won't load the 7th character
	; this is impossible to fix without causing the routine to become larger, and running out of space
	.IF .SIZEOF(game_state::pet_name) <> .SIZEOF(game_state::favorite_food) || .SIZEOF(game_state::pet_name) <> .SIZEOF(game_state::favorite_thing) - 6
		.WARNING "pet name, favorite food and favorite thing lengths must be the same, or Don't care will be messed up"
	.ENDIF
@UNKNOWN3:
	STX $10
	LDA $10
	JSL UNKNOWN_C441B7
	LDY $12
	LDA a:window_stats::text_y,Y
	TAX
	LDA #$0000
	JSL UNKNOWN_C438A5
	LDA $02
	CMP #$0006
	BNE @UNKNOWN4
	LDX #$0000
	BRA @UNKNOWN5
@UNKNOWN4:
	LDX $02
	INX
@UNKNOWN5:
	STX $04
	LDA $04
	STA $12
	LDA #$0000
	STA $02
	STA $0E
	BRA @UNKNOWN7
@UNKNOWN6:
	TXY
	LDX $10
	LDA $14
	JSL UNKNOWN_C442AC
	INC $02
	LDA $02
	STA $0E
@UNKNOWN7:
	LDA $12
	STA $04
	OPTIMIZED_MULT $04, DONTCARE_NAME_LENGTH
	STA $02
	LDA $16
	OPTIMIZED_MULT $04, DONTCARE_NAME_LENGTH * DONTCARE_LIST_LENGTH
	CLC
	ADC $02
	LDX $0E
	STX $02
	CLC
	ADC $02
	TAX
	LDA f:DONT_CARE_NAMES,X
	AND #$00FF
	TAX
	BNE @UNKNOWN6
	LDA #$001C
	JSR SET_WINDOW_FOCUS
	LDA $12
	STA $04
	PLD
	RTS
