
UNKNOWN_C04B53: ;$C04B53
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 20
	LDX .LOWORD(GAME_STATE)+game_state::walking_style
	STX $12
	CPX #WALKING_STYLE::STAIRS
	BEQ @UNKNOWN0
	LDA .LOWORD(GAME_STATE)+game_state::leader_direction
	STA $10
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA .LOWORD(UNKNOWN_7E5DCA)
	STA $10
@UNKNOWN1:
	LDA #.LOWORD(GAME_STATE) + game_state::unknownB0
	STA $02
	LDX $02
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	CMP #$0001
	BEQ @UNKNOWN4
	CMP #$0002
	BNE @UNKNOWN2
	JMP a:.LOWORD(@UNKNOWN6)
@UNKNOWN2:
	CMP #$0003
	BNE @UNKNOWN3
	JMP a:.LOWORD(@UNKNOWN7)
@UNKNOWN3:
	JMP a:.LOWORD(@UNKNOWN8)
@UNKNOWN4:
	LDY #.LOWORD(GAME_STATE) + game_state::unknown80
	STY $0E
	LDA $10
	ASL
	ASL
	STA $04
	LDX $12
	TXA
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC $04
	STA $10
	CLC
	ADC #.LOWORD(UNKNOWN_7E4DD6)
	TAY
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $0A
	LDY $0E
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $06
	CLC
	LDA $06
	ADC $0A
	STA $06
	LDA $08
	ADC $0C
	STA $08
	LDA $06
	STA a:.LOWORD(RAM),Y
	LDA $08
	STA a:.LOWORD(RAM)+2,Y
	LDY #.LOWORD(GAME_STATE) + game_state::unknown84
	STY $12
	LDA $10
	CLC
	ADC #$4F96
	TAY
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $0A
	LDY $12
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $06
	CLC
	LDA $06
	ADC $0A
	STA $06
	LDA $08
	ADC $0C
	STA $08
	LDA $06
	STA a:.LOWORD(RAM),Y
	LDA $08
	STA a:.LOWORD(RAM)+2,Y
	LDX #.LOWORD(GAME_STATE) + game_state::unknownB2
	LDA a:.LOWORD(RAM),X
	DEC
	STA a:.LOWORD(RAM),X
	BNE @UNKNOWN5
	LDA #$0000
	LDX $02
	STA a:.LOWORD(RAM),X
	LDA .LOWORD(GAME_STATE) + game_state::unknownB4
	STA .LOWORD(GAME_STATE)+game_state::walking_style
@UNKNOWN5:
	LDA #$0001
	STA .LOWORD(GAME_STATE) + game_state::unknown90
	BRA @UNKNOWN8
@UNKNOWN6:
	JSR a:.LOWORD(UNKNOWN_C0476D)
	BRA @UNKNOWN8
@UNKNOWN7:
	JSR a:.LOWORD(UNKNOWN_C04AAD)
@UNKNOWN8:
	PLD
	RTS
