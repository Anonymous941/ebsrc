
SUCCESS_SPEED: ;$C27CAF
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	TAY
	LDX CURRENT_TARGET
	LDA a:battler::speed,X
	ASL
	TAX
	STX $10
	LDX CURRENT_ATTACKER
	LDA a:battler::speed,X
	STA $0E
	STA $02
	LDX $10
	TXA
	CMP $02
	BCC @UNKNOWN0
	LDA $0E
	STA $02
	TXA
	SEC
	SBC $02
	TAX
	STX $10
	BRA @UNKNOWN1
@UNKNOWN0:
	LDX #$0000
	STX $10
@UNKNOWN1:
	TYA
	JSR RAND_LIMIT
	LDX $10
	STX $02
	CMP $02
	BCC @UNKNOWN2
	LDA #$0001
	BRA @UNKNOWN3
@UNKNOWN2:
	LDA #$0000
@UNKNOWN3:
	PLD
	RTS
