
CALC_RESISTANCES: ;$C21E03
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 20
	TAX
	DEX
	STX $12
	TXA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	STA $10
	TAX
	LDA .LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::BODY,X
	AND #$00FF
	TAY
	BEQ @UNKNOWN0
	TYA
	DEC
	STA $02
	LDA $10
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::items
	CLC
	ADC $02
	TAX
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC #item::special
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA f:ITEM_CONFIGURATION_TABLE,X
	REP #PROC_FLAGS::ACCUM8
	SEC
	AND #$00FF
	SBC #$0080
	EOR #$FF80
	AND #$0003
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA #$0000
@UNKNOWN1:
	STA $0E
	LDX $12
	TXA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	STA $02
	LDX $02
	LDA .LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::OTHER,X
	AND #$00FF
	TAY
	BEQ @UNKNOWN2
	TYA
	DEC
	STA $04
	LDA $02
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::items
	CLC
	ADC $04
	TAX
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC #item::special
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA f:ITEM_CONFIGURATION_TABLE,X
	REP #PROC_FLAGS::ACCUM8
	SEC
	AND #$00FF
	SBC #$0080
	EOR #$FF80
	AND #$0003
	STA $02
	LDA $0E
	CLC
	ADC $02
	STA $0E
@UNKNOWN2:
	LDA $0E
	CLC
	SBC #$0003
	BRANCHLTEQS @UNKNOWN5
	LDY #$0003
	STY $10
	BRA @UNKNOWN6
@UNKNOWN5:
	LDA $0E
	TAY
	STY $10
@UNKNOWN6:
	LDX $12
	TXA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	STA $0E
	TAX
	LDY $10
	TYA
	SEP #PROC_FLAGS::ACCUM8
	STA .LOWORD(CHAR_STRUCT)+char_struct::fire_resist,X
	REP #PROC_FLAGS::ACCUM8
	LDA $0E
	TAX
	LDA .LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::BODY,X
	AND #$00FF
	TAY
	BEQ @UNKNOWN7
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0002
	PHA
	REP #PROC_FLAGS::ACCUM8
	TYA
	DEC
	STA $02
	LDA $0E
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::items
	CLC
	ADC $02
	TAX
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC #item::special
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA f:ITEM_CONFIGURATION_TABLE,X
	REP #PROC_FLAGS::ACCUM8
	SEC
	AND #$00FF
	SBC #$0080
	EOR #$FF80
	AND #$000C
	SEP #PROC_FLAGS::INDEX8
	PLY
	JSL ASR16
	BRA @UNKNOWN8
@UNKNOWN7:
	LDA #$0000
@UNKNOWN8:
	STA $0E
	REP #PROC_FLAGS::INDEX8
	LDX $12
	TXA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	STA $02
	LDX $02
	LDA .LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::OTHER,X
	AND #$00FF
	TAY
	BEQ @UNKNOWN9
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0002
	PHA
	REP #PROC_FLAGS::ACCUM8
	TYA
	DEC
	STA $04
	LDA $02
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::items
	CLC
	ADC $04
	TAX
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC #item::special
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA f:ITEM_CONFIGURATION_TABLE,X
	REP #PROC_FLAGS::ACCUM8
	SEC
	AND #$00FF
	SBC #$0080
	EOR #$FF80
	AND #$000C
	SEP #PROC_FLAGS::INDEX8
	PLY
	JSL ASR16
	STA $02
	LDA $0E
	CLC
	ADC $02
	STA $0E
@UNKNOWN9:
	LDA $0E
	CLC
	SBC #$0003
	BRANCHLTEQS @UNKNOWN12
	REP #PROC_FLAGS::INDEX8
	LDY #$0003
	STY $10
	BRA @UNKNOWN13
@UNKNOWN12:
	LDA $0E
	REP #PROC_FLAGS::INDEX8
	TAY
	STY $10
@UNKNOWN13:
	LDX $12
	TXA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	STA $0E
	TAX
	LDY $10
	TYA
	SEP #PROC_FLAGS::ACCUM8
	STA .LOWORD(CHAR_STRUCT)+char_struct::freeze_resist,X
	REP #PROC_FLAGS::ACCUM8
	LDA $0E
	TAX
	LDA .LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::BODY,X
	AND #$00FF
	TAY
	BEQ @UNKNOWN14
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0004
	PHA
	REP #PROC_FLAGS::ACCUM8
	TYA
	DEC
	STA $02
	LDA $0E
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::items
	CLC
	ADC $02
	TAX
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC #item::special
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA f:ITEM_CONFIGURATION_TABLE,X
	REP #PROC_FLAGS::ACCUM8
	SEC
	AND #$00FF
	SBC #$0080
	EOR #$FF80
	AND #$0030
	SEP #PROC_FLAGS::INDEX8
	PLY
	JSL ASR16
	BRA @UNKNOWN15
@UNKNOWN14:
	LDA #$0000
@UNKNOWN15:
	STA $0E
	REP #PROC_FLAGS::INDEX8
	LDX $12
	TXA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	STA $02
	LDX $02
	LDA .LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::OTHER,X
	AND #$00FF
	TAY
	BEQ @UNKNOWN16
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0004
	PHA
	REP #PROC_FLAGS::ACCUM8
	TYA
	DEC
	STA $04
	LDA $02
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::items
	CLC
	ADC $04
	TAX
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC #item::special
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA f:ITEM_CONFIGURATION_TABLE,X
	REP #PROC_FLAGS::ACCUM8
	SEC
	AND #$00FF
	SBC #$0080
	EOR #$FF80
	AND #$0030
	SEP #PROC_FLAGS::INDEX8
	PLY
	JSL ASR16
	STA $02
	LDA $0E
	CLC
	ADC $02
	STA $0E
@UNKNOWN16:
	LDA $0E
	CLC
	SBC #$0003
	BRANCHLTEQS @UNKNOWN19
	REP #PROC_FLAGS::INDEX8
	LDY #$0003
	STY $10
	BRA @UNKNOWN20
@UNKNOWN19:
	LDA $0E
	REP #PROC_FLAGS::INDEX8
	TAY
	STY $10
@UNKNOWN20:
	LDX $12
	TXA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	STA $0E
	TAX
	LDY $10
	TYA
	SEP #PROC_FLAGS::ACCUM8
	STA .LOWORD(CHAR_STRUCT)+char_struct::flash_resist,X
	REP #PROC_FLAGS::ACCUM8
	LDA $0E
	TAX
	LDA .LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::BODY,X
	AND #$00FF
	TAY
	BEQ @UNKNOWN21
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0006
	PHA
	REP #PROC_FLAGS::ACCUM8
	TYA
	DEC
	STA $02
	LDA $0E
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::items
	CLC
	ADC $02
	TAX
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC #item::special
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA f:ITEM_CONFIGURATION_TABLE,X
	REP #PROC_FLAGS::ACCUM8
	SEC
	AND #$00FF
	SBC #$0080
	EOR #$FF80
	AND #$00C0
	SEP #PROC_FLAGS::INDEX8
	PLY
	JSL ASR16
	BRA @UNKNOWN22
@UNKNOWN21:
	LDA #$0000
@UNKNOWN22:
	STA $0E
	REP #PROC_FLAGS::INDEX8
	LDX $12
	TXA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	STA $02
	LDX $02
	LDA .LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::OTHER,X
	AND #$00FF
	TAY
	BEQ @UNKNOWN23
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0006
	PHA
	REP #PROC_FLAGS::ACCUM8
	TYA
	DEC
	STA $04
	LDA $02
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::items
	CLC
	ADC $04
	TAX
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC #item::special
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA f:ITEM_CONFIGURATION_TABLE,X
	REP #PROC_FLAGS::ACCUM8
	SEC
	AND #$00FF
	SBC #$0080
	EOR #$FF80
	AND #$00C0
	SEP #PROC_FLAGS::INDEX8
	PLY
	JSL ASR16
	STA $02
	LDA $0E
	CLC
	ADC $02
	STA $0E
@UNKNOWN23:
	LDA $0E
	CLC
	SBC #$0003
	BRANCHLTEQS @UNKNOWN26
	REP #PROC_FLAGS::INDEX8
	LDY #$0003
	STY $10
	BRA @UNKNOWN27
@UNKNOWN26:
	LDA $0E
	REP #PROC_FLAGS::INDEX8
	TAY
	STY $10
@UNKNOWN27:
	LDX $12
	TXA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	STA $0E
	TAX
	LDY $10
	TYA
	SEP #PROC_FLAGS::ACCUM8
	STA .LOWORD(CHAR_STRUCT)+char_struct::paralysis_resist,X
	REP #PROC_FLAGS::ACCUM8
	LDA $0E
	TAX
	LDA .LOWORD(CHAR_STRUCT)+char_struct::equipment+EQUIPMENT_SLOT::ARMS,X
	AND #$00FF
	TAY
	BEQ @UNKNOWN28
	TYA
	DEC
	STA $02
	LDA $0E
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::items
	CLC
	ADC $02
	TAX
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC #item::special
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA f:ITEM_CONFIGURATION_TABLE,X
	REP #PROC_FLAGS::ACCUM8
	SEC
	AND #$00FF
	SBC #$0080
	EOR #$FF80
	STA $10
	BRA @UNKNOWN29
@UNKNOWN28:
	LDA #$0000
	STA $10
@UNKNOWN29:
	LDX $12
	TXA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA $10
	SEP #PROC_FLAGS::ACCUM8
	STA .LOWORD(CHAR_STRUCT)+char_struct::hypnosis_brainshock_resist,X
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
