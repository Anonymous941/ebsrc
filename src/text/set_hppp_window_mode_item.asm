
SET_HPPP_WINDOW_MODE_ITEM: ;$C19B4E
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
.IF .DEFINED(JPN)
	RESERVE_STACK_SPACE 22
.ELSE
	RESERVE_STACK_SPACE 20
.ENDIF
	STA $04
.IF .DEFINED(JPN)
	STA $14
.ENDIF
	LDY #$0000
	STY $12
	JMP @UNKNOWN17
@UNKNOWN0:
.IF .DEFINED(JPN)
	LDA $14
	STA $04
.ENDIF
	LDX $04
	TYA
	INC
	JSL UNKNOWN_C3EE14
	CMP #$0000
	BNE @UNKNOWN1
	LDA #$0C00
	STA $10
	JMP @UNKNOWN16
@UNKNOWN1:
	LDA $04
	JSR a:.LOWORD(GET_ITEM_TYPE)
	CMP #$0002
	BEQ @UNKNOWN2
	LDA #$0400
	STA $10
	JMP @UNKNOWN16
@UNKNOWN2:
	LDA $04
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC #item::type
	TAX
	LDA f:ITEM_CONFIGURATION_TABLE,X
	AND #$00FF
	AND #$000C
	BEQ @UNKNOWN3
	CMP #$0004
	BEQ @UNKNOWN4
	CMP #$0008
	BEQ @UNKNOWN5
	CMP #$000C
	BEQ @UNKNOWN6
	BRA @UNKNOWN7
@UNKNOWN3:
	LDY $12
	TYA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA .LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::WEAPON,X
	AND #$00FF
	STA $02
	STA $0E
	BRA @UNKNOWN7
@UNKNOWN4:
	LDY $12
	TYA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA .LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::BODY,X
	AND #$00FF
	STA $02
	STA $0E
	BRA @UNKNOWN7
@UNKNOWN5:
	LDY $12
	TYA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA .LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::ARMS,X
	AND #$00FF
	STA $02
	STA $0E
	BRA @UNKNOWN7
@UNKNOWN6:
	LDY $12
	TYA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA .LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::OTHER,X
	AND #$00FF
	STA $02
	STA $0E
@UNKNOWN7:
	LDA $0E
	STA $02
	BEQ @UNKNOWN9
	LDX #$0000
	STX $10
	LDY $12
	CPY #$0003
	BNE @UNKNOWN8
	LDX #$0001
	STX $10
@UNKNOWN8:
	LDA $02
	DEC
.IF .DEFINED(JPN)
	STA $04
.ELSE
	STA $02
.ENDIF
	TYA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::items
	CLC
.IF .DEFINED(JPN)
	ADC $04
.ELSE
	ADC $02
.ENDIF
	TAX
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	OPTIMIZED_MULT $04, .SIZEOF(item)
	LDX $10
	STX $02
	CLC
	ADC $02
	CLC
	ADC #item::strength
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA f:ITEM_CONFIGURATION_TABLE,X
	REP #PROC_FLAGS::ACCUM8
	SEC
	AND #$00FF
	SBC #$0080
	EOR #$FF80
	BRA @UNKNOWN10
@UNKNOWN9:
	LDA #$0000
@UNKNOWN10:
	LDX #$0000
	LDY $12
	CPY #$0003
	BNE @UNKNOWN11
	LDX #$0001
@UNKNOWN11:
	PHA
	STX $02
.IF .DEFINED(JPN)
	LDA $14
	STA $04
.ELSE
	LDA $04
.ENDIF
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC $02
	CLC
	ADC #item::strength
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA f:ITEM_CONFIGURATION_TABLE,X
	REP #PROC_FLAGS::ACCUM8
	SEC
	AND #$00FF
	SBC #$0080
	EOR #$FF80
	PLY
	STY $02
	CLC
	SBC $02
	BRANCHLTEQS @UNKNOWN14
	LDX #$1400
	BRA @UNKNOWN15
@UNKNOWN14:
	LDX #$0400
@UNKNOWN15:
	TXA
	STA $10
@UNKNOWN16:
	LDY $12
	TYA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA $10
	STA .LOWORD(CHAR_STRUCT)+char_struct::hp_pp_window_options,X
	LDY $12
	INY
	STY $12
@UNKNOWN17:
	CPY #PLAYER_CHAR_COUNT
	BCCL @UNKNOWN0
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E9623)
	PLD
	RTL
