
;  Initializes an entity along with other entity vars
; A = actipn script, X,Y = coordinates
INIT_ENTITY_WIPE: ;$C092F5
	PHA
	STZ .LOWORD(NEW_ENTITY_POS_Z)
	STZ .LOWORD(NEW_ENTITY_VAR0)
	STZ .LOWORD(NEW_ENTITY_VAR1)
	STZ .LOWORD(NEW_ENTITY_VAR2)
	STZ .LOWORD(NEW_ENTITY_VAR3)
	STZ .LOWORD(NEW_ENTITY_VAR4)
	STZ .LOWORD(NEW_ENTITY_VAR5)
	STZ .LOWORD(NEW_ENTITY_VAR6)
	STZ .LOWORD(NEW_ENTITY_VAR7)
	STZ .LOWORD(NEW_ENTITY_PRIORITY)
	LDA #$0000
	STA .LOWORD(ENTITY_ALLOCATION_MIN_SLOT)
	LDA #$001E
	STA .LOWORD(ENTITY_ALLOCATION_MAX_SLOT)
	PLA
; Initializes an entity
;A = action script, X,Y = coordinates
INIT_ENTITY: ;$C09321
	PHA
	PHY
	PHX
	LDA .LOWORD(ENTITY_ALLOCATION_MIN_SLOT)
	ASL
	STA .LOWORD(ENTITY_ALLOCATION_MIN_SLOT)
	LDA .LOWORD(ENTITY_ALLOCATION_MAX_SLOT)
	ASL
	STA .LOWORD(ENTITY_ALLOCATION_MAX_SLOT)
	JSR a:.LOWORD(UNKNOWN_C09C02)
	BCC @UNKNOWN0
	PLA
	PLA
	PLA
	LDA #$0000
	RTL
@UNKNOWN0:
	JSR a:.LOWORD(UNKNOWN_C09D03)
	TYA
	STA .LOWORD(ENTITY_SCRIPT_INDEX_TABLE),X
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_7E125A),Y
	LDA #.LOWORD(UNKNOWN_C09FAE_ENTRY2)
	STA .LOWORD(ENTITY_MOVE_CALLBACK),X
	LDA #.LOWORD(UNKNOWN_C0A023)
	STA .LOWORD(ENTITY_SCREEN_POSITION_CALLBACK),X
	LDA #.LOWORD(UNKNOWN_C0A3A4)
	STA .LOWORD(ENTITY_DRAW_CALLBACK),X
	LDA .LOWORD(NEW_ENTITY_VAR0)
	STA .LOWORD(ENTITY_SCRIPT_VAR0_TABLE),X
	LDA .LOWORD(NEW_ENTITY_VAR1)
	STA .LOWORD(ENTITY_SCRIPT_VAR1_TABLE),X
	LDA .LOWORD(NEW_ENTITY_VAR2)
	STA .LOWORD(ENTITY_SCRIPT_VAR2_TABLE),X
	LDA .LOWORD(NEW_ENTITY_VAR3)
	STA .LOWORD(ENTITY_SCRIPT_VAR3_TABLE),X
	LDA .LOWORD(NEW_ENTITY_VAR4)
	STA .LOWORD(ENTITY_SCRIPT_VAR4_TABLE),X
	LDA .LOWORD(NEW_ENTITY_VAR5)
	STA .LOWORD(ENTITY_SCRIPT_VAR5_TABLE),X
	LDA .LOWORD(NEW_ENTITY_VAR6)
	STA .LOWORD(ENTITY_SCRIPT_VAR6_TABLE),X
	LDA .LOWORD(NEW_ENTITY_VAR7)
	STA .LOWORD(ENTITY_SCRIPT_VAR7_TABLE),X
	LDA .LOWORD(NEW_ENTITY_PRIORITY)
	STA .LOWORD(ENTITY_DRAW_PRIORITY),X
	LDA #$8000
	STA .LOWORD(ENTITY_ABS_X_FRACTION_TABLE),X
	STA .LOWORD(ENTITY_ABS_Y_FRACTION_TABLE),X
	STA .LOWORD(ENTITY_ABS_Z_FRACTION_TABLE),X
	PLA
	STA .LOWORD(ENTITY_ABS_X_TABLE),X
	STA .LOWORD(ENTITY_SCREEN_X_TABLE),X
	PLA
	STA .LOWORD(ENTITY_ABS_Y_TABLE),X
	STA .LOWORD(ENTITY_SCREEN_Y_TABLE),X
	LDA .LOWORD(NEW_ENTITY_POS_Z)
	STA .LOWORD(ENTITY_ABS_Z_TABLE),X
	JSR a:.LOWORD(UNKNOWN_C09C57)
	PLA
	BRA @UNKNOWN1
	PHA
	JSR a:.LOWORD(UNKNOWN_C09C99)
	JSR a:.LOWORD(UNKNOWN_C09D03)
	TYA
	STA .LOWORD(ENTITY_SCRIPT_INDEX_TABLE),X
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_7E125A),Y
	PLA
@UNKNOWN1:
	STA .LOWORD(ENTITY_SCRIPT_TABLE),X
	PHX
	ASL
	ADC .LOWORD(ENTITY_SCRIPT_TABLE),X
	TXY
	TAX
	LDA f:EVENT_SCRIPT_POINTERS+2,X
	TAY
	LDA f:EVENT_SCRIPT_POINTERS,X
	PLX
	STZ .LOWORD(ENTITY_ANIMATION_FRAME),X
	DEC .LOWORD(ENTITY_ANIMATION_FRAME),X
	STZ .LOWORD(ENTITY_DELTA_X_FRACTION_TABLE),X
	STZ .LOWORD(ENTITY_DELTA_X_TABLE),X
	STZ .LOWORD(ENTITY_DELTA_Y_FRACTION_TABLE),X
	STZ .LOWORD(ENTITY_DELTA_Y_TABLE),X
	STZ .LOWORD(ENTITY_DELTA_Z_FRACTION_TABLE),X
	STZ .LOWORD(ENTITY_DELTA_Z_TABLE),X
	BRA UNKNOWN_C092F5_UNKNOWN4
INIT_ENTITY_UNKNOWN1:
	PHA
	TXA
	ASL
	TAX
	PLA
	JSL INIT_ENTITY_UNKNOWN2
	RTL
INIT_ENTITY_UNKNOWN2:
	PHY
	PHA
	LDA .LOWORD(ENTITY_SCRIPT_TABLE),X
	BPL @DONT_LOOP
@LOOP:
	BRA @LOOP
@DONT_LOOP:
	JSR a:.LOWORD(UNKNOWN_C09C99)
	JSR a:.LOWORD(UNKNOWN_C09D03)
	TYA
	STA .LOWORD(ENTITY_SCRIPT_INDEX_TABLE),X
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_7E125A),Y
	PLA
	PLY
UNKNOWN_C092F5_UNKNOWN4:
	PHY
	PHA
	JSR a:.LOWORD(CLEAR_SPRITE_TICK_CALLBACK)
	TXY
	LDX .LOWORD(ENTITY_SCRIPT_INDEX_TABLE),Y
	PLA
	STA .LOWORD(UNKNOWN_30X2_TABLE_21),X
	PLA
	AND #$00FF
	STA .LOWORD(UNKNOWN_30X2_TABLE_22),X
	STZ .LOWORD(ENTITY_SLEEP_FRAMES),X
	STZ .LOWORD(UNKNOWN_7E12E6),X
	TYA
	LSR
	CLC
MOVEMENT_NOP: ;$C0943B
	RTL
