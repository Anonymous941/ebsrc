
UNKNOWN_C0E196: ;$C0E196
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 22
	LDA #.LOWORD(GAME_STATE) + game_state::unknown88
	STA $04
	STA $14
	LDX $04
	LDA a:.LOWORD(RAM),X
	STA $04
	ASL
	ADC $04
	ASL
	ASL
	CLC
	ADC #$5156
	STA $02
	LDA #.LOWORD(GAME_STATE) + game_state::leader_x_coord
	STA $12
	TAX
	LDA a:.LOWORD(RAM),X
	LDX $02
	STA a:.LOWORD(RAM),X
	LDX #.LOWORD(GAME_STATE) + game_state::leader_y_coord
	STX $10
	LDA a:.LOWORD(RAM),X
	LDX $02
	STA a:.LOWORD(RAM)+2,X
	LDY .LOWORD(GAME_STATE)+game_state::current_party_members
	LDX $10
	LDA a:.LOWORD(RAM),X
	TAX
	STX $0E
	LDA $12
	TAX
	LDA a:.LOWORD(RAM),X
	LDX $0E
	JSL UNKNOWN_C05F33
	LDX $02
	STA a:.LOWORD(RAM)+4,X
	LDX $02
	STZ a:.LOWORD(RAM)+6,X
	LDA .LOWORD(GAME_STATE)+game_state::leader_direction
	LDX $02
	STA a:.LOWORD(RAM)+8,X
	LDA $14
	STA $04
	LDX $04
	LDA a:.LOWORD(RAM),X
	INC
	LDX $04
	STA a:.LOWORD(RAM),X
	AND #$00FF
	LDX $04
	STA a:.LOWORD(RAM),X
	PLD
	RTS
