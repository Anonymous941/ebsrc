
CC_18_05: ;$C14509
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	LDA #$0001
	CLC
	SBC .LOWORD(CC_ARGUMENT_GATHERING_LOOP_COUNTER)
	BRANCHLTEQS @UNKNOWN2
	TXA
	SEP #PROC_FLAGS::ACCUM8
	LDX .LOWORD(CC_ARGUMENT_GATHERING_LOOP_COUNTER)
	STA .LOWORD(CC_ARGUMENT_STORAGE),X
	REP #PROC_FLAGS::ACCUM8
	INC .LOWORD(CC_ARGUMENT_GATHERING_LOOP_COUNTER)
	LDA #.LOWORD(CC_18_05)
	BRA @UNKNOWN5
@UNKNOWN2:
	LDA .LOWORD(CC_ARGUMENT_STORAGE)
	AND #$00FF
	STA $0E
	LDA .LOWORD(UNKNOWN_7E5E71)
	AND #$00FF
	BEQ @UNKNOWN3
	LDA $0E
	JSL UNKNOWN_C43D75
	BRA @UNKNOWN4
@UNKNOWN3:
	LDA $0E
	JSL UNKNOWN_C438A5
@UNKNOWN4:
	LDA #NULL
@UNKNOWN5:
	PLD
	RTS
