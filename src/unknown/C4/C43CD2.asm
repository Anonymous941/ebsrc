
UNKNOWN_C43CD2: ;$C43CD2
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 17
	STY $02
	TXY
	STA $04
	LDX $02
	TYA
	JSL REDIRECT_C438A5
	LDX $04
	LDA a:u89D4_entry::unknown44,X
	AND #$00FF
	BEQ @UNKNOWN0
	AND #$00FF
	CLC
	ADC .LOWORD(UNKNOWN_7E9E23)
	STA .LOWORD(UNKNOWN_7E9E23)
	LDA .LOWORD(UNKNOWN_7E9E25)
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC #.LOWORD(UNKNOWN_7E3492)
	STA $0F
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FF
	STA $0E
	LDX #$0020
	REP #PROC_FLAGS::ACCUM8
	LDA $0F
	JSL MEMSET16
@UNKNOWN0:
	SEP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(UNKNOWN_7E5E79)
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
