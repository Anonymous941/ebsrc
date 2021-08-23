
UNKNOWN_C0369B: ;$C0369B
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 28
	TAY
	STY $1A
	LDX #$0000
	STX $18
	CPY #$0005
	BCC @UNKNOWN1
@UNKNOWN0:
	TXA
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	LDA a:game_state::unknown96,X
	AND #$00FF
	BEQ @UNKNOWN5
	AND #$00FF
	STA $02
	TYA
	CMP $02
	BCC @UNKNOWN5
	BEQ @UNKNOWN5
	LDX $18
	INX
	STX $18
	BRA @UNKNOWN0
@UNKNOWN1:
	TXA
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	LDA a:game_state::unknown96,X
	AND #$00FF
	BEQ @UNKNOWN5
	AND #$00FF
	STA $16
	STA $02
	LDA #$0005
	CLC
	SBC $02
	BRANCHLTEQS @UNKNOWN5
	LDY $1A
	STY $02
	LDA $16
	CMP $02
	BEQ @UNKNOWN4
	BCS @UNKNOWN5
@UNKNOWN4:
	ASL
	TAX
	LDA .LOWORD(UNKNOWN_30X2_TABLE_4),X
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA .LOWORD(CHAR_STRUCT)+char_struct::afflictions,X
	AND #$00FF
	CMP #$0001
	BEQ @UNKNOWN5
	LDX $18
	INX
	STX $18
	BRA @UNKNOWN1
@UNKNOWN5:
	LDX $18
	TXA
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	LDA a:game_state::unknown96,X
	AND #$00FF
	BEQ @UNKNOWN8
	LDA #$0005
	STA $14
	BRA @UNKNOWN7
@UNKNOWN6:
	CLC
	ADC #.LOWORD(GAME_STATE)
	STA $12
	LDA $14
	DEC
	STA $04
	CLC
	ADC #.LOWORD(GAME_STATE)
	STA $02
	LDX $02
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM) + game_state::unknown96,X
	LDY #game_state::unknown96
	STA ($12),Y
	REP #PROC_FLAGS::ACCUM8
	LDA $14
	ASL
	CLC
	ADC #.LOWORD(GAME_STATE)
	PHA
	LDA $04
	ASL
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	LDA a:game_state::unknownA2,X
	PLX
	STA a:game_state::unknownA2,X
	LDX $02
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM)+game_state::player_controlled_party_members,X
	LDY #game_state::player_controlled_party_members
	STA ($12),Y
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	STA $14
@UNKNOWN7:
	LDX $18
	TXA
	DEC
	STA $02
	LDA $14
	CMP $02
	BNE @UNKNOWN6
@UNKNOWN8:
	LDX $18
	TXA
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	LDY $1A
	TYA
	SEP #PROC_FLAGS::ACCUM8
	STA a:game_state::unknown96,X
	REP #PROC_FLAGS::ACCUM8
	LDA #.LOWORD(GAME_STATE) + game_state::party_count
	PHA
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	INC
	PLX
	STA a:.LOWORD(RAM),X
	REP #PROC_FLAGS::ACCUM8
	TYA
	DEC
	STA $12
	STA .LOWORD(UNKNOWN_7E0A38)
	LDA $12
	ASL
	ASL
	ASL
	CLC
	ADC #$0006
	TAX
	LDA f:CHARACTER_INITIAL_ENTITY_DATA,X
	STA $1A
	ASL
	TAX
	LDA .LOWORD(ENTITY_SCRIPT_TABLE),X
	CMP #$FFFF
	BEQ @UNKNOWN9
	INC $1A
@UNKNOWN9:
	LDX $18
	TXA
	ASL
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	LDA $1A
	STA a:game_state::unknownA2,X
	LDA $1A
	STA .LOWORD(UNKNOWN_7E0A3A)
	SEC
	SBC #$0018
	STA .LOWORD(UNKNOWN_7E0A3A)
	LDX $18
	TXA
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(UNKNOWN_7E0A3A)
	STA a:game_state::player_controlled_party_members,X
	REP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(GAME_STATE)+game_state::party_count
	AND #$00FF
	CMP #$0001
	BNE @UNKNOWN10
	LDA .LOWORD(UNKNOWN_7E0A3A)
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA .LOWORD(GAME_STATE) + game_state::unknown88
	STA .LOWORD(CHAR_STRUCT)+char_struct::position_index,X
	BRA @UNKNOWN13
@UNKNOWN10:
	LDX $18
	BNE @UNKNOWN11
	LDA .LOWORD(GAME_STATE) + game_state::unknown88
	STA $16
	BRA @UNKNOWN12
@UNKNOWN11:
	TXA
	DEC
	ASL
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	LDA a:game_state::unknownA2,X
	ASL
	TAX
	LDA .LOWORD(UNKNOWN_30X2_TABLE_4),X
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA .LOWORD(CHAR_STRUCT)+char_struct::position_index,X
	STA $16
@UNKNOWN12:
	LDA .LOWORD(UNKNOWN_7E0A3A)
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA $16
	STA .LOWORD(CHAR_STRUCT)+char_struct::position_index,X
@UNKNOWN13:
	LDA .LOWORD(UNKNOWN_7E0A3A)
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA .LOWORD(CHAR_STRUCT)+char_struct::position_index,X
	BEQ @UNKNOWN14
	TAX
	DEX
	BRA @UNKNOWN15
@UNKNOWN14:
	LDX #$00FF
@UNKNOWN15:
	TXA
	STA $04
	ASL
	ADC $04
	ASL
	ASL
	TAX
	LDA .LOWORD(PLAYER_POSITION_BUFFER),X
	STA $04
	LDA .LOWORD(PLAYER_POSITION_BUFFER)+2,X
	STA $02
	LDA .LOWORD(GAME_STATE) + game_state::unknown92
	CMP #$0003
	BEQ @UNKNOWN16
	LDA $12
	ASL
	ASL
	ASL
	TAX
	LDA f:CHARACTER_INITIAL_ENTITY_DATA,X
	STA $18
	BRA @UNKNOWN17
@UNKNOWN16:
	LDA $12
	ASL
	ASL
	ASL
	TAX
	INX
	INX
	LDA f:CHARACTER_INITIAL_ENTITY_DATA,X
	STA $18
@UNKNOWN17:
	LOADPTR CHARACTER_INITIAL_ENTITY_DATA, $06
	LDA $04
	STA $0E
	LDA $02
	STA $10
	LDY $1A
	LDA $12
	ASL
	ASL
	ASL
	INC
	INC
	INC
	INC
	MOVE_INTX $06, $0A
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	TAX
	LDA $18
	JSL CREATE_ENTITY
	LDA $1A
	ASL
	TAX
	STX $14
	LDA $04
	SEC
	SBC a:.LOWORD(BG1_X_POS)
	STA .LOWORD(ENTITY_SCREEN_X_TABLE),X
	LDA $02
	SEC
	SBC a:.LOWORD(BG1_Y_POS)
	STA .LOWORD(ENTITY_SCREEN_Y_TABLE),X
	LDY #.LOWORD(GAME_STATE) + game_state::current_party_members
	STY $18
	LDA .LOWORD(GAME_STATE) + game_state::unknown96
	AND #$00FF
	DEC
	ASL
	ASL
	ASL
	CLC
	ADC #$0006
	CLC
	ADC $06
	STA $06
	LDA [$06]
	STA a:.LOWORD(RAM),Y
	JSL UNKNOWN_C09CD7
	JSL UNKNOWN_C032EC
	LDA .LOWORD(GAME_STATE) + game_state::unknownA2
	LDY $18
	STA a:.LOWORD(RAM),Y
	JSL UNKNOWN_C034D6
	LDA $04
	STA .LOWORD(UNKNOWN_7E9E2D)
	LDA $02
	STA .LOWORD(UNKNOWN_7E9E2F)
	LDX $14
	LDA .LOWORD(ENTITY_DIRECTIONS),X
	STA .LOWORD(UNKNOWN_7E9E31)
	LDA $1A
	PLD
	RTL
