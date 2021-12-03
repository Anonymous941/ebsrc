
UNKNOWN_C442AC: ;$C442AC
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 30
	STY $1C
	STX $1A
	JSL WAIT_UNTIL_NEXT_FRAME
	STZ .LOWORD(UNKNOWN_7E9E25)
	STZ .LOWORD(UNKNOWN_7E9E23)
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FF
	STA $0E
	LDX #$0340
	REP #PROC_FLAGS::ACCUM8
	LDA #.LOWORD(VWF_BUFFER)
	JSL MEMSET16
	STZ .LOWORD(UNKNOWN_7E9654)
	STZ .LOWORD(UNKNOWN_7E9652)
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	ASL
	TAX
	LDA .LOWORD(WINDOW_EXISTENCE_TABLE),X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	CLC
	ADC #.LOWORD(WINDOW_STATS_TABLE)
	STA $18
	LDA $1C
	CMP #$FFFF
	BNE @UNKNOWN2
	LDA .LOWORD(UNKNOWN_7E9662)
	BNE @UNKNOWN0
	LDA #$0001
	JMP @RETURN
@UNKNOWN0:
	LDA .LOWORD(UNKNOWN_7E9662)
	CMP $1A
	BCS @UNKNOWN1
	LDA #$0053
	JSR a:.LOWORD(UNKNOWN_C4424A)
@UNKNOWN1:
	DEC .LOWORD(UNKNOWN_7E9662)
	LDA #$0070
	JSR a:.LOWORD(UNKNOWN_C4424A)
	BRA @UNKNOWN4
@UNKNOWN2:
	LDA $1A
	DEC
	CMP .LOWORD(UNKNOWN_7E9662)
	BCS @UNKNOWN3
	LDA #$0000
	JMP @RETURN
@UNKNOWN3:
	LDA $1C
	JSR a:.LOWORD(UNKNOWN_C4424A)
	LDA .LOWORD(UNKNOWN_7E9662)
	INC
	STA .LOWORD(UNKNOWN_7E9662)
	CMP $1A
	BCS @UNKNOWN4
	LDA #$0070
	JSR a:.LOWORD(UNKNOWN_C4424A)
@UNKNOWN4:
	LOADPTR FONT_PTR_TABLE, $06
	LDY #$000A
	LDA [$06],Y
	STA $04
	LDX $18
	STZ a:window_stats::text_x,X
	LDY #$0008
	LDA [$06],Y
	STA $16
	LDA #$0000
	STA $02
	BRA @UNKNOWN8
@UNKNOWN5:
	MOVE_INT FONT_PTR_TABLE+4, $06
	LDX $02
	LDA .LOWORD(UNKNOWN_7E1B56),X
	AND #$00FF
	TAY
	LDA $16
	JSL MULT16
	CLC
	ADC $06
	STA $06
	LDX $02
	LDA .LOWORD(UNKNOWN_7E1B6E),X
	AND #$00FF
	TAY
	STY $14
	BRA @UNKNOWN7
@UNKNOWN6:
	MOVE_INT $06, $0E
	LDX $04
	LDA #$0008
	JSL UNKNOWN_C44B3A
	LDY $14
	TYA
	SEC
	SBC #$0008
	TAY
	STY $14
	LDA $04
	CLC
	ADC $06
	STA $06
@UNKNOWN7:
	CPY #$0008
	BCS @UNKNOWN6
	MOVE_INT $06, $0E
	LDX $04
	TYA
	JSL UNKNOWN_C44B3A
	INC $02
@UNKNOWN8:
	LDA $02
	CMP $1A
	BCC @UNKNOWN5
	LDX $18
	STZ a:window_stats::text_x,X
	LDA #$7700
	STA $04
	LDY #window_stats::width
	LDA ($18),Y
	STA $12
	LDA #$0000
	STA $02
	STA $14
	BRA @UNKNOWN10
@UNKNOWN9:
	LDA $14
	STA $02
	ASL
	ASL
	ASL
	ASL
	ASL
	STA $18
	CLC
	ADC #.LOWORD(VWF_BUFFER)
	PROMOTENEARPTRA $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDY $04
	LDX #$0010
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY
	.A16
	LDA $18
	CLC
	ADC #$34A2
	PROMOTENEARPTRA $06
	REP #PROC_FLAGS::ACCUM8
	COPY_TO_VRAM1OFFSET $06, $04, $10, $08, $00
	.A16
	LDA $04
	CLC
	ADC #$0010
	STA $04
	INC $02
	LDA $02
	STA $14
@UNKNOWN10:
	LDA $02
	PHA
	LDA $12
	STA $02
	INC $02
	PLA
	CMP $02
	BCCL @UNKNOWN9
	LDA #$0001
	STA .LOWORD(DMA_TRANSFER_FLAG)
	LDY #$0000
	STY $1A
	BRA @UNKNOWN13
@UNKNOWN12:
	TYA
	ASL
	CLC
	ADC #$02E0
	TAX
	INX
	JSR a:.LOWORD(UNKNOWN_C44C8C)
	LDY $1A
	INY
	STY $1A
@UNKNOWN13:
	LDA $12
	STA $02
	INC $02
	TYA
	CMP $02
	BCC @UNKNOWN12
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	ASL
	TAX
	LDA .LOWORD(WINDOW_EXISTENCE_TABLE),X
	CMP .LOWORD(WINDOW_TAIL)
	BEQ @UNKNOWN14
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E9623)
@UNKNOWN14:
	REP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(TEXT_SOUND_MODE)
	CMP #$0002
	BNE @UNKNOWN15
	LDX #$0001
	BRA @UNKNOWN17
@UNKNOWN15:
	LDA .LOWORD(TEXT_SOUND_MODE)
	CMP #$0003
	BNE @UNKNOWN16
	LDX #$0000
	BRA @UNKNOWN17
@UNKNOWN16:
	LDX #$0000
	LDA .LOWORD(BLINKING_TRIANGLE_FLAG)
	BNE @UNKNOWN17
	LDX #$0001
@UNKNOWN17:
	CPX #$0000
	BEQ @UNKNOWN18
	LDA .LOWORD(UNKNOWN_7E9622)
	AND #$00FF
	BNE @UNKNOWN18
	LDA $1C
	CMP #$0020
	BEQ @UNKNOWN18
	LDA #SFX::TEXT_PRINT
	JSL PLAY_SOUND
@UNKNOWN18:
	LDX .LOWORD(SELECTED_TEXT_SPEED)
	INX
	STX $1C
	BRA @UNKNOWN20
@UNKNOWN19:
	JSL WINDOW_TICK
	LDX $1C
	DEX
	STX $1C
@UNKNOWN20:
	BNE @UNKNOWN19
	LDA #$0000
@RETURN:
	PLD
	RTL
