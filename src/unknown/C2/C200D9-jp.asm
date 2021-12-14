
UNKNOWN_C200D9: ;$C200D9
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	SEP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(UNKNOWN_7E89C9)
	REP #PROC_FLAGS::ACCUM8
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_7E89D2)
	STA .LOWORD(UNKNOWN_7E89D0)
	STA .LOWORD(UNKNOWN_7E89CE)
	STA .LOWORD(UNKNOWN_7E89CC)
	STA .LOWORD(BATTLE_MENU_CURRENT_CHARACTER_ID)
	SEP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(UNKNOWN_7E9622)
	STZ .LOWORD(UNKNOWN_7E9623)
	REP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(UNKNOWN_7E9641)
	SEP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(UNKNOWN_7E9624)
	REP #PROC_FLAGS::ACCUM8
	LDA #$FFFF
	STA .LOWORD(WINDOW_HEAD)
	STA .LOWORD(WINDOW_TAIL)
	LDA #$0000
	STA $10
	BRA @UNKNOWN1
@UNKNOWN0:
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	LDA #$FFFF
	STA .LOWORD(WINDOW_STATS_TABLE)+4,X
	LDA $10
	INC
	STA $10
@UNKNOWN1:
	CMP #$0008
	BNE @UNKNOWN0
	LDA #$0000
	STA $10
	BRA @UNKNOWN3
@UNKNOWN2:
	ASL
	TAX
	LDA #$FFFF
	STA .LOWORD(WINDOW_EXISTENCE_TABLE),X
	LDA $10
	INC
	STA $10
@UNKNOWN3:
	CMP #$0034
	BNE @UNKNOWN2
	LDA #$0000
	STA $10
	BRA @UNKNOWN5
@UNKNOWN4:
	ASL
	TAX
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_7E894E),X
	LDA $10
	INC
	STA $10
@UNKNOWN5:
	CMP #$0004
	BNE @UNKNOWN4
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_7E5E7A)
	STA .LOWORD(UNKNOWN_7E5E7C)
	LDY #.LOWORD(BG2_BUFFER)
	LDX #$0380
	BRA @UNKNOWN7
@UNKNOWN6:
	LDA #$0000
	STA a:.LOWORD(RAM),Y
	INY
	INY
	DEX
@UNKNOWN7:
	BNE @UNKNOWN6
	LDA #$0000
	STA $10
	BRA @UNKNOWN9
@UNKNOWN8:
	OPTIMIZED_MULT $04, .SIZEOF(menu_option)
	TAX
	STZ .LOWORD(MENU_OPTIONS),X
	LDA $10
	INC
	STA $10
@UNKNOWN9:
	CMP #$0046
	BNE @UNKNOWN8
	LDA #$0000
	STA $0E
	BRA @UNKNOWN13
@UNKNOWN10:
	LDX #$0000
	STX $10
	BRA @UNKNOWN12
@UNKNOWN11:
	STX $02
	REP #PROC_FLAGS::ACCUM8
	LDA $0E
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC $02
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FF
	STA .LOWORD(UNKNOWN_7E9D23),X
	LDX $10
	INX
	STX $10
@UNKNOWN12:
	CPX #$0020
	BCC @UNKNOWN11
	REP #PROC_FLAGS::ACCUM8
	LDA $0E
	INC
	STA $0E
@UNKNOWN13:
	CMP #$0004
	BCC @UNKNOWN10
	STZ .LOWORD(UNKNOWN_7E9E29)
	STZ .LOWORD(UNKNOWN_7E9E27)
	STZ .LOWORD(UNKNOWN_7E9E25)
	STZ .LOWORD(UNKNOWN_7E9E23)
	STZ .LOWORD(BLINKING_TRIANGLE_FLAG)
	LDA #$0001
	STA .LOWORD(TEXT_SOUND_MODE)
	STZ .LOWORD(BATTLE_MODE_FLAG)
	STZ .LOWORD(INPUT_LOCK_FLAG)
	LDA #$FFFF
	STA .LOWORD(CURRENT_FOCUS_WINDOW)
	PLD
	RTL
