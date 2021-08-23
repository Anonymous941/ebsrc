
UNKNOWN_C032EC: ;$C032EC
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 25
	LDY #$0000
	BRA @UNKNOWN1
@UNKNOWN0:
	INY
@UNKNOWN1:
	LDA .LOWORD(GAME_STATE) + game_state::party_members,Y
	AND #$00FF
	BEQ @UNKNOWN3
	AND #$00FF
	STA $02
	LDA #$0005
	CLC
	SBC $02
	BRANCHGTS @UNKNOWN0
@UNKNOWN3:
	TYA
	SEP #PROC_FLAGS::ACCUM8
	STA .LOWORD(GAME_STATE)+game_state::player_controlled_party_count
	REP #PROC_FLAGS::ACCUM8
	LDA #.LOWORD(GAME_STATE)+game_state::party_npc_1
	STA $04
	LDX $04
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	STA $00
	STA $18
	REP #PROC_FLAGS::ACCUM8
	TYA
	CLC
	ADC #.LOWORD(GAME_STATE) + game_state::party_members
	STA $16
	SEP #PROC_FLAGS::ACCUM8
	LDA ($16)
	STA $15
	STA $01
	LDA $00
	CMP $01
	BNE @UNKNOWN4
	JMP a:.LOWORD(@UNKNOWN7)
@UNKNOWN4:
	REP #PROC_FLAGS::ACCUM8
	LDA #.LOWORD(GAME_STATE)+game_state::party_npc_2
	STA $02
	LDX $02
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	STA $01
	LDA $15
	STA $00
	LDA $01
	CMP $00
	BNE @UNKNOWN5
	LDA $01
	LDX $04
	STA a:.LOWORD(RAM),X
	LDX #.LOWORD(GAME_STATE)+game_state::party_npc_2_hp
	STX $13
	REP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	STA .LOWORD(GAME_STATE)+game_state::party_npc_1_hp
	SEP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(GAME_STATE) + game_state::party_members + 1,Y
	LDX $02
	STA a:.LOWORD(RAM),X
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	ASL
	TAX
	INX
	LDA f:NPC_AI_TABLE,X
	AND #$00FF
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	CLC
	ADC #enemy_data::hp
	TAX
	LDA f:ENEMY_CONFIGURATION_TABLE,X
	LDX $13
	STA a:.LOWORD(RAM),X
	JMP a:.LOWORD(@UNKNOWN8)
@UNKNOWN5:
	LDA $18
	STA $00
	CMP .LOWORD(GAME_STATE) + game_state::party_members + 1,Y
	BNE @UNKNOWN6
	LDA $00
	LDX $02
	STA a:.LOWORD(RAM),X
	LDX #.LOWORD(GAME_STATE)+game_state::party_npc_1_hp
	STX $13
	REP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	STA .LOWORD(GAME_STATE)+game_state::party_npc_2_hp
	SEP #PROC_FLAGS::ACCUM8
	LDA ($16)
	LDX $04
	STA a:.LOWORD(RAM),X
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	ASL
	TAX
	INX
	LDA f:NPC_AI_TABLE,X
	AND #$00FF
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	CLC
	ADC #enemy_data::hp
	TAX
	LDA f:ENEMY_CONFIGURATION_TABLE,X
	LDX $13
	STA a:.LOWORD(RAM),X
	JMP a:.LOWORD(@UNKNOWN8)
@UNKNOWN6:
	LDA $15
	LDX $04
	STA a:.LOWORD(RAM),X
	TYX
	INX
	REP #PROC_FLAGS::ACCUM8
	LOADPTR ENEMY_CONFIGURATION_TABLE, $0A
	LOADPTR NPC_AI_TABLE, $06
	MOVE_INT $06, $0F
	LDA $15
	AND #$00FF
	ASL
	INC
	CLC
	ADC $06
	STA $06
	LDA [$06]
	AND #$00FF
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	CLC
	ADC #enemy_data::hp
	MOVE_INTY $0A, $06
	CLC
	ADC $06
	STA $06
	LDA [$06]
	STA .LOWORD(GAME_STATE)+game_state::party_npc_1_hp
	SEP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(GAME_STATE) + game_state::party_members,X
	STA $0E
	STA $00
	LDX $02
	LDA a:.LOWORD(RAM),X
	CMP $00
	BEQ @UNKNOWN8
	LDA $0E
	LDX $02
	STA a:.LOWORD(RAM),X
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	ASL
	INC
	MOVE_INTX $0F, $06
	CLC
	ADC $06
	STA $06
	LDA [$06]
	AND #$00FF
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	CLC
	ADC #enemy_data::hp
	MOVE_INTX $0A, $06
	CLC
	ADC $06
	STA $06
	LDA [$06]
	STA .LOWORD(GAME_STATE)+game_state::party_npc_2_hp
	BRA @UNKNOWN8
@UNKNOWN7:
	INY
	LDX #.LOWORD(GAME_STATE)+game_state::party_npc_2
	LDA .LOWORD(GAME_STATE) + game_state::party_members,Y
	STA $0E
	STA $00
	LDA a:.LOWORD(RAM),X
	CMP $00
	BEQ @UNKNOWN8
	LDA $0E
	STA a:.LOWORD(RAM),X
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	ASL
	TAX
	INX
	LDA f:NPC_AI_TABLE,X
	AND #$00FF
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	CLC
	ADC #enemy_data::hp
	TAX
	LDA f:ENEMY_CONFIGURATION_TABLE,X
	STA .LOWORD(GAME_STATE)+game_state::party_npc_2_hp
@UNKNOWN8:
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
