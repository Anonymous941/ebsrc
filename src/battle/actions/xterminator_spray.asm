
BTLACT_XTERMINATOR_SPRAY: ;$C2AA15
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDA #$00C8
	JSR INSECT_SPRAY_COMMON
	RTL
