
COUNT_PHOTO_FLAGS: ;$C4F433
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	PHD
	TDC
	ADC #$FFEE
	TCD
	LDY #$0000
	STY $10
	TYX
	STX $0E
	BRA @LOOP_ENTRY
@LOOP_BEGIN:
	TXA
	LDY #.SIZEOF(photographer_config_entry)
	JSL MULT168
	TAX
	LDA f:PHOTOGRAPHER_CFG_TABLE,X
	JSL GET_EVENT_FLAG
	CMP #$0000
	BEQ @EVENT_FLAG_UNSET
	LDY $10
	INY
	STY $10
@EVENT_FLAG_UNSET:
	LDX $0E
	INX
	STX $0E
@LOOP_ENTRY:
	CPX #$0020
	BCC @LOOP_BEGIN
	LDY $10
	TYA
	PLD
	RTL
