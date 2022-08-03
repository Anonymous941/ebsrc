
UNKNOWN_C0B67F: ;$C0B67F
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
.IF .DEFINED(JPN)
	RESERVE_STACK_SPACE_CLOBBER 18
.ELSE
	RESERVE_STACK_SPACE_CLOBBER 15
.ENDIF
	JSL UNKNOWN_C0927C
	JSL UNKNOWN_C01A86
	LDX #$0000
	LDA #$8000
	JSL ALLOC_SPRITE_MEM
	JSL INITIALIZE_MISC_OBJECT_DATA
	STZ .LOWORD(BATTLE_DEBUG)
	STZ .LOWORD(INPUT_DISABLE_FRAME_COUNTER)
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E4A58)
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_7E4A5A)
	LDA #$000A
	STA .LOWORD(UNKNOWN_7E4A5E)
	STZ .LOWORD(BATTLE_SWIRL_COUNTDOWN)
	STZ .LOWORD(UNKNOWN_7E5D9A)
	LDA #$0001
	JSL SET_BOUNDARY_BEHAVIOR
	LDA #$0697
	STA .LOWORD(DAD_PHONE_TIMER)
	LDA #.LOWORD(PROCESS_OVERWORLD_TASKS)
	JSL SET_IRQ_CALLBACK
	STZ .LOWORD(TELEPORT_STYLE)
	STZ .LOWORD(TELEPORT_DESTINATION)
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_7EB4A8)
	LDA #$0017
	STA .LOWORD(ENTITY_ALLOCATION_MIN_SLOT)
	LDA #$0018
	STA .LOWORD(ENTITY_ALLOCATION_MAX_SLOT)
	LDY #$0000
	TYX
	LDA #EVENT_SCRIPT::EVENT_001
	JSL INIT_ENTITY
	JSL UNKNOWN_C02D29
	JSL UNKNOWN_C03A24
	SEP #PROC_FLAGS::ACCUM8
	STZ_BADOPT $0E
	LDX #$0200
	REP #PROC_FLAGS::ACCUM8
	LDA #$0200
	JSL MEMSET16
	JSL UNKNOWN_C47F87
	JSL OVERWORLD_INITIALIZE
	LDX .LOWORD(GAME_STATE)+game_state::leader_y_coord
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	JSL LOAD_MAP_AT_POSITION
	JSL SPAWN_BUZZ_BUZZ
	JSL LOAD_WINDOW_GFX
.IF .DEFINED(JPN)
	.I8
	LOADPTR UNKNOWN_7F0000, $0E
	LDY #$00
.ELSE
	LDA #$0001
	JSL UNKNOWN_C44963
	JSL UNKNOWN_C039E5
	PLD
.ENDIF
	RTS
