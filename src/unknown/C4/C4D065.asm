
;A = char* name buf? X = char* name2?
UNKNOWN_C4D065: ;$C4D065
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	STX $04
	STA $10
	LDX #$0000
	STX $0E
	JMP @UNKNOWN31
@UNKNOWN0:
	LDA $00
	AND #$00FF
	STA $02
	INC $04
	LDX $0E
	BEQL @UNKNOWN19
	TXA
	CMP $02
	BNE @UNKNOWN2
	LDA $10
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$007E
	STA __BSS_START__,X
	REP #PROC_FLAGS::ACCUM8
	LDA $10
	INC
	STA $10
	JMP @UNKNOWN31
@UNKNOWN2:
	LDA $02
	CMP #$0041
	BEQ @UNKNOWN3
	CMP #$0049
	BEQ @UNKNOWN4
	CMP #$0055
	BEQ @UNKNOWN5
	CMP #$0045
	BEQ @UNKNOWN6
	CMP #$004F
	BEQ @UNKNOWN7
	BRA @UNKNOWN8
@UNKNOWN3:
	LDY #$0000
	LDA $10
	JSR UNKNOWN_C4D00F
	STA $10
	JMP @UNKNOWN18
@UNKNOWN4:
	LDY #$0001
	LDA $10
	JSR UNKNOWN_C4D00F
	STA $10
	JMP @UNKNOWN18
@UNKNOWN5:
	LDY #$0002
	LDA $10
	JSR UNKNOWN_C4D00F
	STA $10
	JMP @UNKNOWN18
@UNKNOWN6:
	LDY #$0003
	LDA $10
	JSR UNKNOWN_C4D00F
	STA $10
	JMP @UNKNOWN18
@UNKNOWN7:
	LDY #$0004
	LDA $10
	JSR UNKNOWN_C4D00F
	STA $10
	BRA @UNKNOWN18
@UNKNOWN8:
	LDA #$0041
	CLC
	SBC $02
	BRANCHGTS @UNKNOWN15
	LDA $02
	CLC
	SBC #$005A
	BRANCHGTS @UNKNOWN15
	CPX #$004E
	BNE @UNKNOWN13
	LDA $10
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$009D
	STA __BSS_START__,X
	REP #PROC_FLAGS::ACCUM8
	LDA $10
	INC
	STA $10
	BRA @UNKNOWN14
@UNKNOWN13:
	LDY #$0001
	LDA $10
	JSR UNKNOWN_C4D00F
	STA $10
@UNKNOWN14:
	LDX $02
	STX $0E
	JMP @UNKNOWN31
@UNKNOWN15:
	CPX #$004E
	BNE @UNKNOWN16
	LDA $10
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$009D
	STA __BSS_START__,X
	REP #PROC_FLAGS::ACCUM8
	LDA $10
	TAX
	INX
	BRA @UNKNOWN17
@UNKNOWN16:
	LDY #$0001
	LDA $10
	JSR UNKNOWN_C4D00F
	TAX
@UNKNOWN17:
	LDA $02
	SEP #PROC_FLAGS::ACCUM8
	STA __BSS_START__,X
	REP #PROC_FLAGS::ACCUM8
	TXA
	INC
	STA $10
@UNKNOWN18:
	LDX #$0000
	STX $0E
	JMP @UNKNOWN31
@UNKNOWN19:
	LDA $02
	CMP #$0041
	BEQ @UNKNOWN20
	CMP #$0049
	BEQ @UNKNOWN21
	CMP #$0055
	BEQ @UNKNOWN22
	CMP #$0045
	BEQ @UNKNOWN23
	CMP #$004F
	BEQ @UNKNOWN24
	BRA @UNKNOWN25
@UNKNOWN20:
	LDA $10
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0060
	STA __BSS_START__,X
	REP #PROC_FLAGS::ACCUM8
	LDA $10
	INC
	STA $10
	JMP @UNKNOWN31
@UNKNOWN21:
	LDA $10
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0070
	STA __BSS_START__,X
	REP #PROC_FLAGS::ACCUM8
	LDA $10
	INC
	STA $10
	BRA @UNKNOWN31
@UNKNOWN22:
	LDA $10
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0080
	STA __BSS_START__,X
	REP #PROC_FLAGS::ACCUM8
	LDA $10
	INC
	STA $10
	BRA @UNKNOWN31
@UNKNOWN23:
	LDA $10
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0090
	STA __BSS_START__,X
	REP #PROC_FLAGS::ACCUM8
	LDA $10
	INC
	STA $10
	BRA @UNKNOWN31
@UNKNOWN24:
	LDA $10
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00A0
	STA __BSS_START__,X
	REP #PROC_FLAGS::ACCUM8
	LDA $10
	INC
	STA $10
	BRA @UNKNOWN31
@UNKNOWN25:
	LDA #$0041
	CLC
	SBC $02
	BRANCHGTS @UNKNOWN30
	LDA $02
	CLC
	SBC #$005A
	BRANCHGTS @UNKNOWN30
	LDX $02
	STX $0E
	BRA @UNKNOWN31
@UNKNOWN30:
	LDA $10
	TAX
	LDA $02
	SEP #PROC_FLAGS::ACCUM8
	STA __BSS_START__,X
	REP #PROC_FLAGS::ACCUM8
	LDA $10
	INC
	STA $10
@UNKNOWN31:
	LDX $04
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	STA $00
	REP #PROC_FLAGS::ACCUM8
	LDA $00
	AND #$00FF
	BNEL @UNKNOWN0
	LDX $0E
	BEQ @UNKNOWN34
	CPX #$004E
	BNE @UNKNOWN33
	LDA $10
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$009D
	STA __BSS_START__,X
	REP #PROC_FLAGS::ACCUM8
	LDA $10
	INC
	STA $10
	BRA @UNKNOWN34
@UNKNOWN33:
	LDY #$0001
	LDA $10
	JSR UNKNOWN_C4D00F
	STA $10
@UNKNOWN34:
	LDA $10
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	STA __BSS_START__,X
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
