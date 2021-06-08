
UNKNOWN_C113D1: ;$C113D1
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	MOVE_INT $24, $0A
	MOVE_INT $20, $06
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	CMP #$FFFF
	BNE @UNKNOWN0
	LDA #.LOWORD(UNKNOWN_7E89D4) + (.SIZEOF(u89D4_entry) * (NUM_89D4_ENTRIES - 1))
	JMP a:.LOWORD(@UNKNOWN5)
@UNKNOWN0:
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	ASL
	TAX
	LDA .LOWORD(WINDOW_EXISTENCE_TABLE),X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	CLC
	ADC #.LOWORD(WINDOW_STATS_TABLE)
	STA $02
	JSR a:.LOWORD(UNKNOWN_C11354)
	STA $10
	CMP #$FFFF
	BNE @UNKNOWN1
	LDA #.LOWORD(UNKNOWN_7E89D4) + (.SIZEOF(u89D4_entry) * (NUM_89D4_ENTRIES - 1))
	JMP a:.LOWORD(@UNKNOWN5)
@UNKNOWN1:
	LDY #.SIZEOF(u89D4_entry)
	JSL MULT168
	CLC
	ADC #.LOWORD(UNKNOWN_7E89D4)
	TAY
	STY $0E
	LDA $02
	CLC
	ADC #window_stats::current_option
	TAX
	LDA a:.LOWORD(RAM),X
	CMP #$FFFF
	BNE @UNKNOWN2
	LDA #$FFFF
	STA a:u89D4_entry::unknown4,Y
	LDA $10
	STA a:.LOWORD(RAM),X
	BRA @UNKNOWN3
@UNKNOWN2:
	LDA $02
	CLC
	ADC #window_stats::option_count
	TAX
	LDA a:.LOWORD(RAM),X
	STA a:u89D4_entry::unknown4,Y
	LDA a:.LOWORD(RAM),X
	LDY #.SIZEOF(u89D4_entry)
	JSL MULT168
	TAX
	LDA $10
	STA .LOWORD(UNKNOWN_7E89D4) + u89D4_entry::unknown2,X
@UNKNOWN3:
	LDX $02
	STA a:window_stats::option_count,X
	LDA #$FFFF
	LDY $0E
	STA a:u89D4_entry::unknown2,Y
	LDA #$0001
	STA a:u89D4_entry::unknown0,Y
	TYA
	CLC
	ADC #u89D4_entry::unknown15
	TAY
	MOVE_INT_YPTRDEST $0A, a:0
	LDA #$0001
	LDY $0E
	STA a:u89D4_entry::unknown6,Y
	SEP #PROC_FLAGS::ACCUM8
	STA a:u89D4_entry::unknown14,Y
	REP #PROC_FLAGS::ACCUM8
	TYA
	CLC
	ADC #u89D4_entry::unknown19
	TAX
@UNKNOWN4:
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	STA a:.LOWORD(RAM),X
	INX
	LDA [$06]
	REP #PROC_FLAGS::ACCUM8
	INC $06
	AND #$00FF
	BNE @UNKNOWN4
	TYA
@UNKNOWN5:
	PLD
	RTS
