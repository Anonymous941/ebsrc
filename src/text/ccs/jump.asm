
CC_0A: ;$C14103
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	TAY
	STY $0E
	LDA #$0003
	CLC
	SBC .LOWORD(CC_ARGUMENT_GATHERING_LOOP_COUNTER)
	BRANCHLTEQS @UNKNOWN2
	TXA
	SEP #PROC_FLAGS::ACCUM8
	LDX .LOWORD(CC_ARGUMENT_GATHERING_LOOP_COUNTER)
	STA .LOWORD(CC_ARGUMENT_STORAGE),X
	REP #PROC_FLAGS::ACCUM8
	INC .LOWORD(CC_ARGUMENT_GATHERING_LOOP_COUNTER)
	LDA #.LOWORD(CC_0A)
	JMP a:.LOWORD(@UNKNOWN3)
@UNKNOWN2:
	TXA
	STA $06
	STZ $08
	SEP #PROC_FLAGS::INDEX8
	LDY #$0018
	JSL ASL32_ENTRY2
	LDA $08
	PHA
	LDA $06
	PHA
	LDY #$0010
	SEP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(CC_ARGUMENT_STORAGE)+2
	STA $06
	STZ $07
	STZ $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	JSL ASL32_ENTRY2
	LDA $08
	PHA
	LDA $06
	PHA
	LDY #$0008
	SEP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(CC_ARGUMENT_STORAGE)+1
	STA $06
	STZ $07
	STZ $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	JSL ASL32_ENTRY2
	MOVE_INT $06, $0A
	SEP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(CC_ARGUMENT_STORAGE)
	STA $06
	STZ $07
	STZ $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	LDA $06
	ORA $0A
	STA $06
	LDA $08
	ORA $0C
	STA $08
	PLA
	STA $0A
	PLA
	STA $0C
	LDA $06
	ORA $0A
	STA $06
	LDA $08
	ORA $0C
	STA $08
	PLA
	STA $0A
	PLA
	STA $0C
	LDA $06
	ORA $0A
	STA $06
	LDA $08
	ORA $0C
	STA $08
	REP #PROC_FLAGS::INDEX8
	LDY $0E
	MOVE_INT_YPTRDEST $06, a:.LOWORD(RAM)
	LDA #NULL
@UNKNOWN3:
	PLD
	RTS
