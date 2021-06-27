
UNKNOWN_C2DB3F: ;$C2DB3F
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 14
	LDA .LOWORD(UNKNOWN_7EADD0)
	BEQ @UNKNOWN3
	LDA .LOWORD(UNKNOWN_7EADD2)
	SEC
	SBC #$0555
	STA .LOWORD(UNKNOWN_7EADD2)
	STA $0A
	STZ $0C
	MOVE_INT_CONSTANT $00006000, $06
	CLC
	LDA $06
	SBC $0A
	LDA $08
	SBC $0C
	BVC @UNKNOWN0
	BPL @UNKNOWN2
	BRA @UNKNOWN1
@UNKNOWN0:
	BMI @UNKNOWN2
@UNKNOWN1:
	LDA #$6000
	STA .LOWORD(UNKNOWN_7EADD2)
	STZ .LOWORD(UNKNOWN_7EADD0)
@UNKNOWN2:
	SEP #PROC_FLAGS::INDEX8
	LDY #$0008
	LDA .LOWORD(UNKNOWN_7EADD2)
	JSL ASR8_UNKNOWN1
	JSR a:.LOWORD(UNKNOWN_C2E08E)
@UNKNOWN3:
	LDA .LOWORD(UNKNOWN_7EADA8)
	BEQ @UNKNOWN5
	LDA .LOWORD(UNKNOWN_7EADA8)
	DEC
	STA .LOWORD(UNKNOWN_7EADA8)
	AND #$0002
	BEQ @UNKNOWN4
	LDA #$FFFF
	JSR a:.LOWORD(UNKNOWN_C2E08E)
	BRA @UNKNOWN5
@UNKNOWN4:
	LDA #$0100
	JSR a:.LOWORD(UNKNOWN_C2E08E)
@UNKNOWN5:
	LDA .LOWORD(UNKNOWN_7EADAA)
	BEQ @UNKNOWN10
	STZ .LOWORD(CUR_TEXT_PAL)
	LDA .LOWORD(UNKNOWN_7EADAA)
	CMP #$0003
	BEQ @UNKNOWN6
	CMP #$0002
	BEQ @UNKNOWN7
	BRA @UNKNOWN8
@UNKNOWN6:
	LDA #$03E0
	STA .LOWORD(CUR_TEXT_PAL)
@UNKNOWN7:
	LDA #$0018
	JSL UNKNOWN_C0856B
@UNKNOWN8:
	LDA .LOWORD(UNKNOWN_7EADAA)
	DEC
	STA .LOWORD(UNKNOWN_7EADAA)
	AND #$0002
	BEQ @UNKNOWN9
	LDA #$0000
	JSR a:.LOWORD(UNKNOWN_C2E08E)
	BRA @UNKNOWN10
@UNKNOWN9:
	LDA #$0100
	JSR a:.LOWORD(UNKNOWN_C2E08E)
@UNKNOWN10:
	LDA .LOWORD(VERTICAL_SHAKE_DURATION)
	BNE @UNKNOWN11
	STZ .LOWORD(UNKNOWN_7EAD98)
	BRA @UNKNOWN12
@UNKNOWN11:
	LDA #1*SECOND
	SEC
	SBC .LOWORD(VERTICAL_SHAKE_DURATION)
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA f:UNKNOWN_C4A591,X
	REP #PROC_FLAGS::ACCUM8
	SEC
	AND #$00FF
	SBC #$0080
	EOR #$FF80
	STA .LOWORD(UNKNOWN_7EAD98)
	LDX .LOWORD(VERTICAL_SHAKE_DURATION)
	DEX
	STX .LOWORD(VERTICAL_SHAKE_DURATION)
	BNE @UNKNOWN12
	LDA .LOWORD(VERTICAL_SHAKE_HOLD_DURATION)
	BEQ @UNKNOWN12
	DEC .LOWORD(VERTICAL_SHAKE_HOLD_DURATION)
	LDA #1*SIXTH_OF_A_SECOND
	STA .LOWORD(VERTICAL_SHAKE_DURATION)
@UNKNOWN12:
	.I16
	STZ .LOWORD(UNKNOWN_7EAD96)
	LDA .LOWORD(WOBBLE_DURATION)
	BEQ @UNKNOWN13
	LDY #6*FIFTHS_OF_A_SECOND
	LDA .LOWORD(WOBBLE_DURATION)
	JSL MODULUS16
	DEC .LOWORD(WOBBLE_DURATION)
	LDY #$0048
	XBA
	AND #$FF00
	JSL DIVISION16S_DIVISOR_POSITIVE
	.I16
	TAX
	LDY #$0100
	SEP #PROC_FLAGS::ACCUM8
	LDA f:SINE_LOOKUP_TABLE,X
	REP #PROC_FLAGS::ACCUM8
	SEC
	AND #$00FF
	SBC #$0080
	EOR #$FF80
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	JSL DIVISION16
	STA .LOWORD(UNKNOWN_7EAD96)
@UNKNOWN13:
	LDA .LOWORD(SHAKE_DURATION)
	BEQ @UNKNOWN17
	LDA .LOWORD(SHAKE_DURATION)
	AND #$0003
	DEC .LOWORD(SHAKE_DURATION)
	CMP #$0000
	BEQ @UNKNOWN14
	CMP #$0002
	BEQ @UNKNOWN14
	CMP #$0001
	BEQ @UNKNOWN15
	CMP #$0003
	BEQ @UNKNOWN16
	BRA @UNKNOWN17
@UNKNOWN14:
	STZ .LOWORD(UNKNOWN_7EAD96)
	BRA @UNKNOWN17
@UNKNOWN15:
	LDA #$0002
	STA .LOWORD(UNKNOWN_7EAD96)
	BRA @UNKNOWN17
@UNKNOWN16:
	LDA #$FFFE
	STA .LOWORD(UNKNOWN_7EAD96)
@UNKNOWN17:
	LDA .LOWORD(LOADED_BG_DATA_LAYER1) + loaded_bg_data::bitdepth
	AND #$00FF
	CMP #$0002
	BNE @UNKNOWN18
	LDA .LOWORD(UNKNOWN_7EAD96)
	STA a:.LOWORD(BG1_X_POS)
	LDA .LOWORD(UNKNOWN_7EAD98)
	STA a:.LOWORD(BG1_Y_POS)
	BRA @UNKNOWN19
@UNKNOWN18:
	LDA .LOWORD(BATTLE_MODE_FLAG)
	BEQ @UNKNOWN19
	LDA .LOWORD(UNKNOWN_7EAD96)
	STA a:.LOWORD(BG3_X_POS)
	LDA .LOWORD(UNKNOWN_7EAD98)
	STA a:.LOWORD(BG3_Y_POS)
@UNKNOWN19:
	LDA .LOWORD(UNKNOWN_7EAD90)
	BEQ @UNKNOWN20
	DEC .LOWORD(UNKNOWN_7EAD90)
@UNKNOWN20:
	LDA .LOWORD(BATTLE_MODE_FLAG)
	BEQ @UNKNOWN21
	JSL UNKNOWN_C2F8F9
@UNKNOWN21:
	LDX #$0000
	LDA #.LOWORD(LOADED_BG_DATA_LAYER1)
	JSL GENERATE_BATTLEBG_FRAME
	LDY #.LOWORD(LOADED_BG_DATA_LAYER2)
	LDA a:.LOWORD(RAM),Y
	AND #$00FF
	BEQ @UNKNOWN22
	LDX #$0001
	TYA
	JSL GENERATE_BATTLEBG_FRAME
@UNKNOWN22:
	JSL UNKNOWN_C2E6B3_ENTRY2
	LDA .LOWORD(RED_FLASH_DURATION)
	BEQ @UNKNOWN24
	LDA .LOWORD(RED_FLASH_DURATION)
	DEC
	STA .LOWORD(RED_FLASH_DURATION)
	LDY #$000C
	JSL DIVISION16S_DIVISOR_POSITIVE
	AND #$0001
	BEQ @UNKNOWN23
	LDY #$0004
	LDX #$0000
	LDA #$001F
	JSL SET_COLDATA
	LDX #$003F
	LDA #$0000
	JSL SET_COLOUR_ADDSUB_MODE
	BRA @UNKNOWN24
@UNKNOWN23:
	LDY #$0000
	TYX
	TYA
	JSL SET_COLDATA
	LDA .LOWORD(UNKNOWN_7EAD8A)
	JSL UNKNOWN_C0AFCD
@UNKNOWN24:
	LDA .LOWORD(GREEN_FLASH_DURATION)
	BEQ @UNKNOWN26
	LDA .LOWORD(GREEN_FLASH_DURATION)
	DEC
	STA .LOWORD(GREEN_FLASH_DURATION)
	LDY #$000C
	JSL DIVISION16S_DIVISOR_POSITIVE
	AND #$0001
	BEQ @UNKNOWN25
	LDY #$0004
	LDX #$001F
	LDA #$0000
	JSL SET_COLDATA
	LDX #$003F
	LDA #$0000
	JSL SET_COLOUR_ADDSUB_MODE
	BRA @UNKNOWN26
@UNKNOWN25:
	LDY #$0000
	TYX
	TYA
	JSL SET_COLDATA
	LDA .LOWORD(UNKNOWN_7EAD8A)
	JSL UNKNOWN_C0AFCD
@UNKNOWN26:
	LDA .LOWORD(HP_PP_BOX_BLINK_DURATION)
	BEQ @UNKNOWN28
	LDA .LOWORD(HP_PP_BOX_BLINK_DURATION)
	DEC
	STA .LOWORD(HP_PP_BOX_BLINK_DURATION)
	LDY #$0003
	JSL DIVISION16S_DIVISOR_POSITIVE
	AND #$0001
	BEQ @UNKNOWN27
	LDA .LOWORD(HP_PP_BOX_BLINK_TARGET)
	JSL UNDRAW_HP_PP_WINDOW
	BRA @UNKNOWN28
@UNKNOWN27:
	LDA .LOWORD(HP_PP_BOX_BLINK_TARGET)
	JSL UNKNOWN_C207B6
@UNKNOWN28:
	JSL UNKNOWN_C4A7B0
	JSL UNKNOWN_C2FD99
	LDA .LOWORD(UNKNOWN_7EADB6)
	BEQ @UNKNOWN33
	LDA .LOWORD(UNKNOWN_7EADB2)
	BEQ @UNKNOWN33
	LDA .LOWORD(UNKNOWN_7EADCC)
	CMP #$03BB
	BCS @UNKNOWN29
	STZ .LOWORD(UNKNOWN_7EADCC)
	LDA #$00E0
	STA .LOWORD(UNKNOWN_7EADCE)
	STZ .LOWORD(UNKNOWN_7EADB6)
	BRA @UNKNOWN30
@UNKNOWN29:
	LDA .LOWORD(UNKNOWN_7EADCC)
	SEC
	SBC #$03BB
	STA .LOWORD(UNKNOWN_7EADCC)
	LDA .LOWORD(UNKNOWN_7EADCE)
	CLC
	ADC #$03BB
	STA .LOWORD(UNKNOWN_7EADCE)
@UNKNOWN30:
	SEP #PROC_FLAGS::INDEX8
	LDY #$0008
	LDA .LOWORD(UNKNOWN_7EADCC)
	JSL ASR8_UNKNOWN1
	CMP .LOWORD(UNKNOWN_7EADB2)
	BCS @UNKNOWN31
	STA .LOWORD(UNKNOWN_7EADB2)
@UNKNOWN31:
	LDY #$0008
	LDA .LOWORD(UNKNOWN_7EADCE)
	JSL ASR8_UNKNOWN1
	CMP .LOWORD(UNKNOWN_7EADB4)
	BCC @UNKNOWN32
	BEQ @UNKNOWN32
	STA .LOWORD(UNKNOWN_7EADB4)
@UNKNOWN32:
	JSL UNKNOWN_C2D0AC
@UNKNOWN33:
	PLD
	RTL
