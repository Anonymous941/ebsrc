
UNKNOWN_C4608C: ;$C4608C
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 15
	SEP #PROC_FLAGS::ACCUM8
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	CMP #$00FF
	BNE @UNKNOWN0
	LDA .LOWORD(GAME_STATE)+game_state::current_party_members
	BRA @UNKNOWN4
@UNKNOWN0:
	LDX #$0000
	BRA @UNKNOWN3
@UNKNOWN1:
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	CMP .LOWORD(GAME_STATE) + game_state::unknown96,X
	BNE @UNKNOWN2
	REP #PROC_FLAGS::ACCUM8
	TXA
	ASL
	TAX
	LDA .LOWORD(GAME_STATE) + game_state::unknownA2,X
	BRA @UNKNOWN4
@UNKNOWN2:
	INX
@UNKNOWN3:
	CPX #$0006
	BCC @UNKNOWN1
	REP #PROC_FLAGS::ACCUM8
	LDA #$FFFF
@UNKNOWN4:
	PLD
	RTL
