
FIND_INVENTORY_SPACE: ;$C456E4
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	DEC
	STA $0E
	LDA #$0000
	STA $02
	BRA @UNKNOWN2
@UNKNOWN0:
	LDA $0E
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::items
	CLC
	ADC $02
	TAX
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	BNE @UNKNOWN1
	LDA $0E
	INC
	BRA @UNKNOWN5
@UNKNOWN1:
	INC $02
@UNKNOWN2:
	LDA #$000E
	CLC
	SBC $02
	BRANCHGTS @UNKNOWN0
	LDA #$0000
@UNKNOWN5:
	PLD
	RTS
