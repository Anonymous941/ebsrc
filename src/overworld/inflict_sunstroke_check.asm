
INFLICT_SUNSTROKE_CHECK: ;$C20000
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	LDA OVERWORLD_STATUS_SUPPRESSION
	BNEL @UNKNOWN11
	LDA GAME_STATE+game_state::trodden_tile_type
	AND #$000C
	CMP #$0004
	BNEL @UNKNOWN11
	LDX #$0000
	STX $10
	JMP @UNKNOWN10
@UNKNOWN2:
	REP #PROC_FLAGS::ACCUM8
	TXA
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAY
	LDA __BSS_START__ + game_state::unknown96,Y
	AND #$00FF
	BEQL @UNKNOWN11
	AND #$00FF
	CLC
	SBC #$0004
	BRANCHGTS @UNKNOWN11
	LDA __BSS_START__+game_state::player_controlled_party_members,Y
	AND #$00FF
	ASL
	TAX
	LDY CHOSEN_FOUR_PTRS,X
	STY UNKNOWN_7E4DC6
	LDA a:char_struct::afflictions + STATUS_GROUP::PERSISTENT_EASYHEAL,Y
	AND #$00FF
	TAY
	BEQ @UNKNOWN6
	CPY #STATUS_0::COLD
	BNE @UNKNOWN9
@UNKNOWN6:
	LDX UNKNOWN_7E4DC6
	LDA a:char_struct::guts,X
	AND #$00FF
	STA $02
	LDA #$001E
	SEC
	SBC $02
	CMP #$8000
	BLTEQ @UNKNOWN7
	LDA #$0001
@UNKNOWN7:
	LDY #$0064
	XBA
	AND #$FF00
	JSL DIVISION16S_DIVISOR_POSITIVE
	STA $0E
	JSL RAND
	TAY
	LDA $0E
	STA $02
	TYA
	CMP $02
	BGT @UNKNOWN9
	SEP #PROC_FLAGS::ACCUM8
	LDA #STATUS_0::SUNSTROKE
	LDX UNKNOWN_7E4DC6
	STA a:char_struct::afflictions + STATUS_GROUP::PERSISTENT_EASYHEAL,X
@UNKNOWN9:
	LDX $10
	INX
	STX $10
@UNKNOWN10:
	CPX #$0006
	BCCL @UNKNOWN2
@UNKNOWN11:
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
