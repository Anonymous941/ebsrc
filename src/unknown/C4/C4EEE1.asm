
UNKNOWN_C4EEE1: ;$C4EEE1
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	STA $04
	LDX #.LOWORD(UNKNOWN_7E3492)
	LDA #$0000
	STA $02
	STA $10
	JMP a:.LOWORD(@UNKNOWN10)
@UNKNOWN0:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	STA $0F
	STA $00
	LDA a:.LOWORD(RAM),X
	STA $0E
	LDA a:.LOWORD(RAM)+1,X
	STA $01
	LDY #$0000
	JMP a:.LOWORD(@UNKNOWN8)
@UNKNOWN1:
	LDA $00
	ASL
	STA $00
	LDA $0F
	ASL
	STA $0F
	REP #PROC_FLAGS::ACCUM8
	LDA $0E
	AND #$00FF
	AND #$0080
	BEQ @UNKNOWN2
	LDA $01
	AND #$00FF
	AND #$0080
	BEQ @UNKNOWN2
	SEP #PROC_FLAGS::ACCUM8
	LDA $00
	AND #$00FE
	STA $00
	LDA $0F
	AND #$00FE
	STA $0F
	BRA @UNKNOWN7
@UNKNOWN2:
	.A16
	LDA $0E
	AND #$00FF
	AND #$0080
	BEQ @UNKNOWN3
	LDA #$0001
	BRA @UNKNOWN4
@UNKNOWN3:
	LDA #$0000
@UNKNOWN4:
	SEP #PROC_FLAGS::ACCUM8
	PHA
	LDA $00
	STA a:.LOWORD(UNKNOWN_7E00C0)
	PLA
	STA $00
	LDA a:.LOWORD(UNKNOWN_7E00C0)
	ORA $00
	STA $00
	REP #PROC_FLAGS::ACCUM8
	LDA $01
	AND #$00FF
	AND #$0080
	BEQ @UNKNOWN5
	LDA #$0001
	BRA @UNKNOWN6
@UNKNOWN5:
	LDA #$0000
@UNKNOWN6:
	SEP #PROC_FLAGS::ACCUM8
	ORA $0F
	STA $0F
@UNKNOWN7:
	LDA $0E
	ASL
	STA $0E
	LDA $01
	ASL
	STA $01
	INY
@UNKNOWN8:
	CPY #$0008
	BCS @UNKNOWN9
	BEQ @UNKNOWN9
	JMP a:.LOWORD(@UNKNOWN1)
@UNKNOWN9:
	LDA $0F
	STA a:.LOWORD(RAM)+1,X
	LDA $00
	STA a:.LOWORD(RAM),X
	INX
	INX
	REP #PROC_FLAGS::ACCUM8
	LDA $10
	STA $02
	INC $02
	LDA $02
	STA $10
@UNKNOWN10:
	LDA $04
	ASL
	ASL
	ASL
	ASL
	PHA
	LDA $02
	PLY
	STY $02
	CMP $02
	BCS @UNKNOWN11
	BEQ @UNKNOWN11
	JMP a:.LOWORD(@UNKNOWN0)
@UNKNOWN11:
	PLD
	RTL
