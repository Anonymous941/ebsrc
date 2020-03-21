
ATTEMPT_HOMESICKNESS: ;$C1BE4D
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 16
	LDA .LOWORD(CHAR_STRUCT)+char_struct::afflictions
	AND #$00FF
	CMP #$0001
	BEQ @FAILED
	LDX #$0000
	LDA #$000F
	STA $0E
	BRA @UNKNOWN5
@UNKNOWN0:
	LDA $0E
	STA $02
	LDA .LOWORD(CHAR_STRUCT)+char_struct::level
	AND #$00FF
	CLC
	SBC $02
	BVS @UNKNOWN1
	BPL @UNKNOWN4
	BRA @UNKNOWN2
@UNKNOWN1:
	BMI @UNKNOWN4
@UNKNOWN2:
	LDA f:HOMESICKNESS_PROBABILITY,X
	AND #$00FF
	BEQ @UNKNOWN3
	AND #$00FF
	JSL RAND_MOD
	CMP #$0000
	BNE @UNKNOWN3
	LDY #$0002
	LDX #$0006
	LDA #$0001
	JSL INFLICT_STATUS_NONBATTLE
	BRA @RETURN
@UNKNOWN3:
	LDA #$0000
	BRA @RETURN
@UNKNOWN4:
	INX
	LDA $0E
	CLC
	ADC #$000F
	STA $0E
@UNKNOWN5:
	STX $02
	LDA #$0006
	CLC
	SBC $02
	BVS @UNKNOWN6
	BPL @UNKNOWN0
	BRA @FAILED
@UNKNOWN6:
	BMI @UNKNOWN0
@FAILED:
	LDA #$0000
@RETURN:
	PLD
	RTS
