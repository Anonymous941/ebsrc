
CC_1E_00: ;$C149B6
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 14
	STX $02
	LDA #$0001
	CLC
	SBC .LOWORD(CC_ARGUMENT_GATHERING_LOOP_COUNTER)
	BRANCHLTEQS @UNKNOWN2
	LDA $02
	SEP #PROC_FLAGS::ACCUM8
	LDX .LOWORD(CC_ARGUMENT_GATHERING_LOOP_COUNTER)
	STA .LOWORD(CC_ARGUMENT_STORAGE),X
	REP #PROC_FLAGS::ACCUM8
	INC .LOWORD(CC_ARGUMENT_GATHERING_LOOP_COUNTER)
	LDA #.LOWORD(CC_1E_00)
	BRA @UNKNOWN5
@UNKNOWN2:
	LDA .LOWORD(CC_ARGUMENT_STORAGE)
	AND #$00FF
	TAX
	BEQ @UNKNOWN3
	TXA
	BRA @UNKNOWN4
@UNKNOWN3:
	JSR a:.LOWORD(GET_ARGUMENT_MEMORY)
	LDA $06
@UNKNOWN4:
	LDY #$0000
	LDX $02
	JSR a:.LOWORD(RECOVER_HP_AMTPERCENT)
	LDA #NULL
@UNKNOWN5:
	PLD
	RTS
