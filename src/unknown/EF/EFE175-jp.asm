
UNKNOWN_EFE175: ;$EFE175
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 30
	LOADPTR UNKNOWN_7F0000, $06
	LDA #$0000
	STA [$06]
	LDA .LOWORD(DEBUG_START_POSITION_X)
	STA $04
	LDA .LOWORD(DEBUG_START_POSITION_Y)
	STA $02
	JSL UNKNOWN_C08726
	JSL UNKNOWN_C0927C
	JSL UNKNOWN_C01A86
	LDX #$0000
	LDA #$8000
	JSL ALLOC_SPRITE_MEM
	JSL INITIALIZE_MISC_OBJECT_DATA
	LDA .LOWORD(DEBUG_UNKNOWN_B565)
	STA $1C
	LDA #$0017
	STA .LOWORD(ENTITY_ALLOCATION_MIN_SLOT)
	LDA #$0018
	STA .LOWORD(ENTITY_ALLOCATION_MAX_SLOT)
	LDA #$0003
	STA .LOWORD(NEW_ENTITY_PRIORITY)
	LDA $04
	STA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	LDA $02
	STA .LOWORD(GAME_STATE)+game_state::leader_y_coord
	LDY #$0000
	TYX
	LDA #EVENT_SCRIPT::EVENT_001
	JSL INIT_ENTITY
	JSL UNKNOWN_C02D29
	LDA #$0000
	STA $1A
	BRA @UNKNOWN1
@UNKNOWN0:
	CLC
	ADC #.LOWORD(GAME_STATE)
	TAX
	SEP #PROC_FLAGS::ACCUM8
	STZ a:game_state::party_members,X
	REP #PROC_FLAGS::ACCUM8
	LDA $1A
	INC
	STA $1A
@UNKNOWN1:
	CMP #$0006
	BCC @UNKNOWN0
	LDA #CHARACTER_PAULA
	JSL ADD_CHAR_TO_PARTY
	LDA .LOWORD(DEBUG_MODE_NUMBER)
	CMP #$0005
	BEQ @UNKNOWN2
	LDA .LOWORD(DEBUG_MODE_NUMBER)
	CMP #$0003
	BEQ @UNKNOWN2
	LDA #CHARACTER_JEFF
	JSL ADD_CHAR_TO_PARTY
	LDA #CHARACTER_POO
	JSL ADD_CHAR_TO_PARTY
@UNKNOWN2:
	LDA #$00FF
	JSL UNKNOWN_C46631
	LDX #$0080
	STX .LOWORD(ENTITY_SCREEN_X_TABLE) + (PARTY_LEADER_ENTITY_INDEX * 2)
	LDX #$0070
	STX .LOWORD(ENTITY_SCREEN_Y_TABLE) + (PARTY_LEADER_ENTITY_INDEX * 2)
	LDA .LOWORD(DEBUG_MODE_NUMBER)
	CMP #$0002
	BNE @UNKNOWN3
	LDA #$0020
	STA $0E
	STA $10
	LDY #$FFFF
	LDX #EVENT_SCRIPT::EVENT_004
	LDA $1C
	JSL CREATE_ENTITY
	STA $18
	ASL
	STA $1A
	CLC
	ADC #.LOWORD(ENTITY_TICK_CALLBACK_HIGH)
	TAX
	LDA a:.LOWORD(RAM),X
	ORA #OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED
	STA a:.LOWORD(RAM),X
	LDA $1A
	CLC
	ADC #.LOWORD(ENTITY_SPRITEMAP_POINTER_HIGH)
	TAX
	LDA a:.LOWORD(RAM),X
	ORA #$8000
	STA a:.LOWORD(RAM),X
@UNKNOWN3:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00
	STA $0E
	LDX #$0200
	REP #PROC_FLAGS::ACCUM8
	LDA #$0200
	JSL MEMSET16
	JSL OVERWORLD_INITIALIZE
	LDX $02
	LDA $04
	JSL LOAD_MAP_AT_POSITION
	LDY #$0004
	LDX $02
	LDA $04
	JSL UNKNOWN_C03FA9
	JSL UNKNOWN_EFD95E
	LDA .LOWORD(DEBUG_MODE_NUMBER)
	CMP #$0003
	BNE @UNKNOWN4
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0013
	STA a:.LOWORD(TM_MIRROR)
	LDA #$0004
	STA a:.LOWORD(TD_MIRROR)
	LDA #$0002
	STA f:CGWSEL
	LDA #$0047
	STA f:CGADSUB
	REP #PROC_FLAGS::ACCUM8
	LDA #$0003
	STA .LOWORD(DEBUG_MODE_NUMBER)
@UNKNOWN4:
	LDA .LOWORD(DEBUG_MODE_NUMBER)
	CMP #$0005
	BNE @UNKNOWN5
	JSL UNKNOWN_EFEAC8
@UNKNOWN5:
	LDA #.LOWORD(UNKNOWN_C0DC4E)
	JSL UNKNOWN_C0851C
	JSL UNKNOWN_C08744
	LDX #$0001
	TXA
	JSL UNKNOWN_C0886C
@UNKNOWN6:
	JSL OAM_CLEAR
	LDA .LOWORD(DEBUG_MODE_NUMBER)
	CMP #$0002
	BEQ @UNKNOWN7
	CMP #$0005
	BEQ @UNKNOWN8
	BRA @UNKNOWN9
@UNKNOWN7:
	JSR a:.LOWORD(UNKNOWN_EFDE1A)
	BRA @UNKNOWN9
@UNKNOWN8:
	JSR a:.LOWORD(UNKNOWN_EFDCBC)
@UNKNOWN9:
	LDA a:.LOWORD(PAD_1_PRESS)
	AND #PAD::A_BUTTON
	BNE @UNKNOWN10
	JMP @UNKNOWN13
@UNKNOWN10:
	STZ .LOWORD(BATTLE_SWIRL_COUNTDOWN)
	LDA a:.LOWORD(PAD_1_STATE)
	AND #PAD::X_BUTTON
	BEQ @UNKNOWN11
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_7EB575)
@UNKNOWN11:
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_7E4370)
	STA .LOWORD(UNKNOWN_7E436E)
	LDA .LOWORD(UNKNOWN_7E4380)
	AND #$FFF8
	STA .LOWORD(UNKNOWN_7E4380)
	LDA .LOWORD(UNKNOWN_7E4382)
	AND #$FFF8
	STA .LOWORD(UNKNOWN_7E4382)
	JSL UNKNOWN_C08726
	LDA #.LOWORD(GAME_STATE)+game_state::leader_x_coord
	STA $04
	LDA #.LOWORD(GAME_STATE)+game_state::leader_y_coord
	STA $02
	LDX $02
	LDA a:.LOWORD(RAM),X
	TAX
	STX $16
	LDX $04
	LDA a:.LOWORD(RAM),X
	LDX $16
	JSL LOAD_MAP_AT_POSITION
	LDY .LOWORD(GAME_STATE)+game_state::leader_direction
	LDX $02
	LDA a:.LOWORD(RAM),X
	TAX
	STX $16
	LDX $04
	LDA a:.LOWORD(RAM),X
	LDX $16
	JSL UNKNOWN_C03FA9
	JSL UNKNOWN_EFD95E
	STZ .LOWORD(UNKNOWN_7EB575)
	LDA .LOWORD(DEBUG_MODE_NUMBER)
	CMP #$0005
	BNE @UNKNOWN12
	JSL UNKNOWN_EFEAC8
@UNKNOWN12:
	JSL UNKNOWN_C08744
	LDY #$0000
	LDX #$0001
	LDA #$0004
	JSL UNKNOWN_C087CE
@UNKNOWN13:
	LDA .LOWORD(DEBUG_MODE_NUMBER)
	CMP #$0002
	BEQ @UNKNOWN14
	JMP @UNKNOWN26
@UNKNOWN14:
	LDY $1C
	LDA a:.LOWORD(PAD_2_HELD)
	STA $14
	AND #PAD::UP
	BEQ @UNKNOWN16
	LDA $1C
	CMP #$014D
	BEQ @UNKNOWN15
	INC $1C
	BRA @UNKNOWN18
@UNKNOWN15:
	STZ $1C
	BRA @UNKNOWN18
@UNKNOWN16:
	LDA $14
	AND #PAD::DOWN
	BEQ @UNKNOWN18
	LDA $1C
	BEQ @UNKNOWN17
	DEC $1C
	BRA @UNKNOWN18
@UNKNOWN17:
	LDA #$0144
	STA $1C
@UNKNOWN18:
	LDA a:.LOWORD(PAD_2_PRESS)
	AND #PAD::X_BUTTON
	BEQ @UNKNOWN19
	LDA $18
	ASL
	STA $1A
	CLC
	ADC #.LOWORD(ENTITY_TICK_CALLBACK_HIGH)
	TAX
	LDA a:.LOWORD(RAM),X
	ORA #OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED
	STA a:.LOWORD(RAM),X
	LDA $1A
	CLC
	ADC #.LOWORD(ENTITY_SPRITEMAP_POINTER_HIGH)
	TAX
	LDA a:.LOWORD(RAM),X
	ORA #$8000
	STA a:.LOWORD(RAM),X
@UNKNOWN19:
	LDA a:.LOWORD(PAD_2_PRESS)
	AND #PAD::Y_BUTTON
	BEQ @UNKNOWN20
	LDA $18
	ASL
	STA $1A
	CLC
	ADC #.LOWORD(ENTITY_TICK_CALLBACK_HIGH)
	TAX
	LDA a:.LOWORD(RAM),X
	AND #$FFFF ^ (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED)
	STA a:.LOWORD(RAM),X
	LDA $1A
	CLC
	ADC #.LOWORD(ENTITY_SPRITEMAP_POINTER_HIGH)
	TAX
	LDA a:.LOWORD(RAM),X
	AND #$7FFF
	STA a:.LOWORD(RAM),X
@UNKNOWN20:
	CPY $1C
	BEQ @UNKNOWN21
	LDA $18
	JSL UNKNOWN_C02140
	LDA #$0020
	STA $0E
	STA $10
	LDY $18
	LDX #EVENT_SCRIPT::EVENT_004
	LDA $1C
	JSL CREATE_ENTITY
	ASL
	TAX
	STZ .LOWORD(ENTITY_TPT_ENTRIES),X
@UNKNOWN21:
	LDA a:.LOWORD(PAD_2_PRESS)
	AND #PAD::A_BUTTON
	BEQ @UNKNOWN22
	LDA $18
	ASL
	TAX
	LDA .LOWORD(ENTITY_TICK_CALLBACK_HIGH),X
	AND #OBJECT_TICK_DISABLED
	BNE @UNKNOWN22
	LDA a:.LOWORD(BG1_X_POS)
	CLC
	ADC #$0020
	TAX
	LDA a:.LOWORD(BG1_Y_POS)
	CLC
	ADC #$0020
	STX $0E
	STA $10
	LDY #$FFFF
	LDX #EVENT_SCRIPT::EVENT_006
	LDA $1C
	JSL CREATE_ENTITY
	ASL
	TAX
	STZ .LOWORD(ENTITY_TPT_ENTRIES),X
@UNKNOWN22:
	LDA a:.LOWORD(PAD_2_PRESS)
	AND #PAD::B_BUTTON
	BEQ @UNKNOWN26
	LDA a:.LOWORD(BG1_X_POS)
	STA $12
	LDY a:.LOWORD(BG1_Y_POS)
	LDA #$0000
	STA $02
	BRA @UNKNOWN25
@UNKNOWN23:
	LDA $02
	ASL
	TAX
	LDA .LOWORD(ENTITY_SCRIPT_TABLE),X
	CMP #$FFFF
	BEQ @UNKNOWN24
	STZ .LOWORD(UNKNOWN_30X2_TABLE_41),X
@UNKNOWN24:
	INC $02
@UNKNOWN25:
	LDA $02
	CMP #$001E
	BNE @UNKNOWN23
	LDA $12
	STA $0E
	STY $10
	LDY #$FFFF
	LDX #EVENT_SCRIPT::EVENT_499
	LDA #$008A
	JSL CREATE_ENTITY
	ASL
	TAX
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_30X2_TABLE_41),X
	JSL UNKNOWN_C0BD96
@UNKNOWN26:
	JSL UNKNOWN_C09466
	LDA a:.LOWORD(PAD_1_STATE)
	AND #PAD::START_BUTTON | PAD::SELECT_BUTTON
	CMP #PAD::START_BUTTON | PAD::SELECT_BUTTON
	BNE @UNKNOWN27
	LDA .LOWORD(ENTITY_ABS_X_TABLE) + (PARTY_LEADER_ENTITY_INDEX * 2)
	STA .LOWORD(DEBUG_START_POSITION_X)
	LDA .LOWORD(ENTITY_ABS_Y_TABLE) + (PARTY_LEADER_ENTITY_INDEX * 2)
	STA .LOWORD(DEBUG_START_POSITION_Y)
	LDA $1C
	STA .LOWORD(DEBUG_UNKNOWN_B565)
	BRA @UNKNOWN33
@UNKNOWN27:
	LDA a:.LOWORD(PAD_1_PRESS)
	AND #PAD::Y_BUTTON
	BEQ @UNKNOWN28
	JSL DEBUG_Y_BUTTON_MENU
@UNKNOWN28:
	LDA .LOWORD(DEBUG_MODE_NUMBER)
	CMP #$0003
	BNE @UNKNOWN30
	LDA a:.LOWORD(BG1_X_POS)
	STA a:.LOWORD(BG3_X_POS)
	LDA a:.LOWORD(BG1_Y_POS)
	STA a:.LOWORD(BG3_Y_POS)
	LDA a:.LOWORD(PAD_1_PRESS)
	AND #PAD::SELECT_BUTTON
	BEQ @UNKNOWN30
	LDX .LOWORD(UNKNOWN_7EB55F)
	INX
	STX .LOWORD(UNKNOWN_7EB55F)
	CPX #$0004
	BNE @UNKNOWN29
	STZ .LOWORD(UNKNOWN_7EB55F)
@UNKNOWN29:
	LDX .LOWORD(GAME_STATE)+game_state::leader_y_coord
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	JSR a:.LOWORD(UNKNOWN_EFE133)
@UNKNOWN30:
	LDA .LOWORD(DEBUG_MODE_NUMBER)
	CMP #$0001
	BNE @UNKNOWN31
	LDA a:.LOWORD(PAD_1_PRESS)
	AND #PAD::B_BUTTON
	BEQ @UNKNOWN31
	JSL OPEN_MENU_BUTTON
@UNKNOWN31:
	LDA .LOWORD(UNKNOWN_7E5E02)
	SEC
	SBC .LOWORD(UNKNOWN_7E5E04)
	BEQ @UNKNOWN32
	JSL DAD_PHONE
@UNKNOWN32:
	JSL UPDATE_SCREEN
	JSL WAIT_UNTIL_NEXT_FRAME
	JSL INIT_BATTLE_OVERWORLD
	JMP @UNKNOWN6
@UNKNOWN33:
	PLD
	RTS
