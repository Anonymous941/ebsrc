
;void processQueuedInteractions()
PROCESS_QUEUED_INTERACTIONS: ;$C075DD
	.IF .DEFINED(JPN)
		@STACKFRAME = 24
		@LOCAL1 = $06 ;void far*
		@LOCAL2 = $0A ;void far*
		@LOCAL3 = $0E ;void far*
		@LOCAL4 = $16 ;short
		@LOCAL5 = $12 ;void far*
	.ELSE
		@STACKFRAME = 20
		@LOCAL1 = $06 ;void far*
		@LOCAL2 = $0A ;void far*
		@LOCAL3 = $0E ;void far*
		@LOCAL4 = $12 ;short
	.ENDIF
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER @STACKFRAME
	LDA CURRENT_QUEUED_INTERACTION
	OPTIMIZED_MULT $04, .SIZEOF(queued_interaction)
	TAX
	LDA QUEUED_INTERACTIONS + queued_interaction::type,X
	STA @LOCAL4
	TXA
	CLC
	ADC #.LOWORD(QUEUED_INTERACTIONS) + queued_interaction::text_ptr
	TAY
	MOVE_INT_YPTRSRC __BSS_START__, @LOCAL1
.IF .DEFINED(JPN)
	MOVE_INT @LOCAL1, @LOCAL5
.ENDIF
	LDA @LOCAL4
	STA CURRENT_QUEUED_INTERACTION_TYPE
	LDA CURRENT_QUEUED_INTERACTION
	INC
	AND #$0003
	STA CURRENT_QUEUED_INTERACTION
	LDA UNKNOWN_7E5D58
	AND #$FFFE
	STA UNKNOWN_7E5D58
	JSL UNKNOWN_C07C5B
	LDA @LOCAL4
	CMP #$0002
	BEQ @UNKNOWN0
	CMP #$000A
	BEQ @UNKNOWN1
	CMP #$0000
	BEQ @UNKNOWN3
	CMP #$0008
	BEQ @UNKNOWN3
	CMP #$0009
	BEQ @UNKNOWN3
	BRA @UNKNOWN4
@UNKNOWN0:
	MOVE_INT @LOCAL1, @LOCAL3
	JSR DOOR_TRANSITION
	BRA @UNKNOWN4
@UNKNOWN1:
	MOVE_INT @LOCAL1, @LOCAL3
	JSL UNKNOWN_C10004
.IF .DEFINED(JPN)
	LOADPTR MSG_SYS_PAPA_2H, @LOCAL1
	LDA @LOCAL1
	STA $02
	MOVE_INT @LOCAL5, @LOCAL1
	LDA @LOCAL1
	CMP $02
.ELSE
	LOADPTR MSG_SYS_PAPA_2H, @LOCAL2
	CMP32 @LOCAL1, @LOCAL2
.ENDIF
	BNE @UNKNOWN4
	LDA #$0697
	STA DAD_PHONE_TIMER
	STZ UNKNOWN_7E9E56
	BRA @UNKNOWN4
@UNKNOWN3:
	MOVE_INT @LOCAL1, @LOCAL3
	JSL UNKNOWN_C10004
@UNKNOWN4:
	LDX #$0000
	LDA CURRENT_QUEUED_INTERACTION
	CMP NEXT_QUEUED_INTERACTION
	BEQ @UNKNOWN5
	LDX #$0001
@UNKNOWN5:
	STX UNKNOWN_7E5D9A
	LDA #$FFFF
	STA CURRENT_QUEUED_INTERACTION_TYPE
	PLD
	RTL
