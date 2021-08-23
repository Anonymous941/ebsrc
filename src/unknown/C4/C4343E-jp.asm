
UNKNOWN_C4343E: ;$C4343E
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 20
	TAX
	DEC
	STA $02
	LOADINT32 3600, $0A
	LOADPTRPTR .LOWORD(TIMER), $06
	JSL DIVISION32
	LOADINT32 60000, $0A
	CLC
	LDA $0A
	SBC $06
	LDA $0C
	SBC $08
	BRANCHLTEQS @UNKNOWN2
	LDA $06
	STA $12
	BRA @UNKNOWN3
@UNKNOWN2:
	LDA #59999
	STA $12
@UNKNOWN3:
	LDA $02
	ASL
	ASL
	ASL
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	LDA $12
	STA a:game_state::saved_photo_states,X
	LDY #$0000
	STY $10
	JMP a:.LOWORD(@UNKNOWN10)
@UNKNOWN4:
	REP #PROC_FLAGS::ACCUM8
	TYA
	CLC
	ADC #.LOWORD(GAME_STATE)
	STA $12
	CLC
	ADC #game_state::unknown96
	TAX
	STX $0E
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	BNE @UNKNOWN5
	STY $04
	LDA $02
	ASL
	ASL
	ASL
	CLC
	ADC #.LOWORD(GAME_STATE)
	CLC
	ADC $04
	TAX
	SEP #PROC_FLAGS::ACCUM8
	STZ a:game_state::saved_photo_states + photo_state::party,X
	JMP @UNKNOWN9
@UNKNOWN5:
	.A16
	LDA $12
	TAX
	LDA a:.LOWORD(RAM)+game_state::player_controlled_party_members,X
	AND #$00FF
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)
	STA $12
	STA .LOWORD(UNKNOWN_7E4DC6)
	LDX $0E
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	TAX
	STX $0E
	LDA $12
	TAX
	LDA a:char_struct::afflictions,X
	AND #$00FF
	CMP #STATUS_0::UNCONSCIOUS
	BNE @UNKNOWN6
	LDX $0E
	TXA
	ORA #$0020
	TAX
	STX $0E
	BRA @UNKNOWN7
@UNKNOWN6:
	CMP #STATUS_0::DIAMONDIZED
	BNE @UNKNOWN7
	LDX $0E
	TXA
	ORA #$0040
	TAX
	STX $0E
@UNKNOWN7:
	LDX .LOWORD(UNKNOWN_7E4DC6)
	LDA a:char_struct::afflictions+STATUS_GROUP::PERSISTENT_HARDHEAL,X
	AND #$00FF
	CMP #STATUS_1::MUSHROOMIZED
	BNE @UNKNOWN8
	LDX $0E
	TXA
	ORA #$0080
	TAX
	STX $0E
@UNKNOWN8:
	LDY $10
	STY $04
	LDA $02
	ASL
	ASL
	ASL
	CLC
	ADC #.LOWORD(GAME_STATE)
	CLC
	ADC $04
	PHA
	LDX $0E
	TXA
	SEP #PROC_FLAGS::ACCUM8
	PLX
	STA a:game_state::saved_photo_states + photo_state::party,X
@UNKNOWN9:
	INY
	STY $10
@UNKNOWN10:
	CPY #$0006
	BCS @UNKNOWN11
	BEQ @UNKNOWN11
	JMP a:.LOWORD(@UNKNOWN4)
@UNKNOWN11:
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
