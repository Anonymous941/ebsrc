
UNKNOWN_C2087C: ;$C2087C
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 16
	LDA .LOWORD(UNKNOWN_7E89C9)
	AND #$00FF
	BEQ @UNKNOWN0
	JSR a:.LOWORD(UNKNOWN_C2077D)
@UNKNOWN0:
	LDA .LOWORD(WINDOW_HEAD)
	CMP #$FFFF
	BEQ @UNKNOWN2
	LDY .LOWORD(WINDOW_HEAD)
	STY $0E
@UNKNOWN1:
	TYA
	JSL UNKNOWN_C107AF
	LDY $0E
	TYA
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	LDY .LOWORD(WINDOW_STATS_TABLE)+window_stats::next,X
	STY $0E
	CPY #$FFFF
	BNE @UNKNOWN1
@UNKNOWN2:
	PLD
	RTL
