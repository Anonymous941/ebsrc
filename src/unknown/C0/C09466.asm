
UNKNOWN_C09466: ;$C09466
	LDA .LOWORD(UNKNOWN_7E0A60)
	BEQ @UNKNOWN0
	RTL
@UNKNOWN0:
	JMP $800000 | .LOWORD(@UNKNOWN1)
@UNKNOWN1:
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8
	REP #PROC_FLAGS::ACCUM8
	PHD
	PHA
	TDC
	SEC
	SBC #$00A0
	AND #$FF00
	TCD
	PLA
	INC .LOWORD(UNKNOWN_7E0A60)
	LDX .LOWORD(FIRST_ENTITY)
	BMI @UNKNOWN5
	STZ $80
	STZ $86
@UNKNOWN2:
	STX $88
	STX .LOWORD(CURRENT_ENTITY_OFFSET)
	STX .LOWORD(CURRENT_ENTITY_SLOT)
	LSR .LOWORD(CURRENT_ENTITY_SLOT)
	LDA .LOWORD(ENTITY_NEXT_ENTITY_TABLE),X
	STA .LOWORD(UNKNOWN_7E0A56)
	JSR a:.LOWORD(UNKNOWN_C094D0)
	LDX .LOWORD(UNKNOWN_7E0A56)
	BPL @UNKNOWN2
	LDX .LOWORD(FIRST_ENTITY)
	BMI @UNKNOWN5
@UNKNOWN3:
	STX .LOWORD(CURRENT_ENTITY_SLOT)
	LSR .LOWORD(CURRENT_ENTITY_SLOT)
	STX $88
	BIT .LOWORD(ENTITY_TICK_CALLBACK_HIGH),X
	BVS @UNKNOWN4
	JSR (.LOWORD(ENTITY_MOVE_CALLBACK),X)
@UNKNOWN4:
	JSR (.LOWORD(ENTITY_SCREEN_POSITION_CALLBACK),X)
	LDX $88
	LDA .LOWORD(ENTITY_NEXT_ENTITY_TABLE),X
	TAX
	BPL @UNKNOWN3
	LDX #$0000
	JSR (.LOWORD(UNKNOWN_7E0A5E),X)
@UNKNOWN5:
	PLD
	STZ .LOWORD(UNKNOWN_7E0A60)
	RTL
