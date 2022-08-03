
; void screenTransition(int, int)
SCREEN_TRANSITION: ;$C06662
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 33
	TXY
	STY $1F
	STA $1D
	MOVE_INT_CONSTANT SCREEN_TRANSITION_CONFIG_TABLE, $06
	LDA $1D
	OPTIMIZED_MULT $04, .SIZEOF(screen_transition_config)
	CLC
	ADC $06
	STA $06
	STA $19
	LDA $08
	STA $1B
	MOVE_INT $06, $0A
	LDA [$0A] ;screen_transition_config::duration
	AND #$00FF
	STA $02
	CMP #$00FF
	BNE @NOT_MAX_DURATION
	LDA #$0384
	STA $02
@NOT_MAX_DURATION:
	SEP #PROC_FLAGS::ACCUM8
	LDY #screen_transition_config::direction
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	ASL
	ASL
	TAX
	LDY #screen_transition_config::unknown5
	LDA [$06],Y
	JSL UNKNOWN_C42631
	LDY $1F
	CPY #$0001
	BNEL @UNKNOWN10
	JSL UNKNOWN_C0943C
	LDA #$0002
	JSL UNKNOWN_C0DD2C
	SEP #PROC_FLAGS::ACCUM8
	LDY #screen_transition_config::animation_id
	LDA [$06],Y
	STA $18
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	BEQ @UNKNOWN2
	SEP #PROC_FLAGS::ACCUM8
	LDY #screen_transition_config::animation_flags
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	TAX
	INX
	INX
	LDA $18
	AND #$00FF
	JSL UNKNOWN_C4A67E
@UNKNOWN2:
	PROMOTENEARPTR .LOWORD(CUR_TEXT_PAL), $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $12
	LDA #$007E
	STA $14
.IF .DEFINED(JPN)
	MOVE_INT $12, $0A
	MOVE_INT $0A, $0E
.ELSE
	MOVE_INT $12, $06
	MOVE_INT $06, $0E
.ENDIF
	MOVE_INT $19, $06
	SEP #PROC_FLAGS::ACCUM8
	LDY #screen_transition_config::fade_style
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	JSL UNKNOWN_C4954C
	LDX #$FFFF
	LDA $02
	JSL UNKNOWN_C496E7
	LDA #$0000
	STA $16
	BRA @UNKNOWN5
@UNKNOWN3:
	LDA a:.LOWORD(UNKNOWN_7E0030)
	AND #$00FF
	BEQ @UNKNOWN4
	JSL WAIT_UNTIL_NEXT_FRAME
@UNKNOWN4:
	JSL UPDATE_MAP_PALETTE_ANIMATION
	JSL OAM_CLEAR
	JSL UNKNOWN_C4268A
	JSL UNKNOWN_C426C7
	JSL RUN_ACTIONSCRIPT_FRAME
	JSL UPDATE_SCREEN
	JSL UNKNOWN_C4A7B0
	JSL WAIT_UNTIL_NEXT_FRAME
	LDA $16
	INC
	STA $16
@UNKNOWN5:
	CMP $02
	BCC @UNKNOWN3
	SEP #PROC_FLAGS::ACCUM8
	LDY #screen_transition_config::fade_style
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDA #$0032
	CLC
	SBC $02
	BRANCHLTEQS @UNKNOWN8
	JSL UNKNOWN_C08726
	BRA @UNKNOWN9
@UNKNOWN8:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FF
	STA $0E
	LDX #$0200
	REP #PROC_FLAGS::ACCUM8
	LDA #$0200
	JSL MEMSET16
	LDA #$0018
	JSL UNKNOWN_C0856B
	JSL WAIT_UNTIL_NEXT_FRAME
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E4676)
@UNKNOWN9:
	JSL UNKNOWN_C09451
	JMP @UNKNOWN22
@UNKNOWN10:
	LDX #$0000
	SEP #PROC_FLAGS::ACCUM8
	LDY #screen_transition_config::fade_style
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDA #$0032
	CLC
	SBC $02
	BRANCHLTEQS @UNKNOWN13
	LDX #$0001
@UNKNOWN13:
	TXY
	STY $1D
	BEQ @UNKNOWN14
	LDX #$0001
	TXA
	JSL FADE_IN
	BRA @UNKNOWN15
@UNKNOWN14:
	LDX #$FFFF
	SEP #PROC_FLAGS::ACCUM8
	LDY #screen_transition_config::secondary_duration
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	JSL UNKNOWN_C496E7
@UNKNOWN15:
	SEP #PROC_FLAGS::ACCUM8
	LDY #screen_transition_config::secondary_animation_id
	LDA [$06],Y
	STA $18
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	BEQ @UNKNOWN16
	SEP #PROC_FLAGS::ACCUM8
	LDY #screen_transition_config::secondary_animation_flags
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	TAX
	LDA $18
	AND #$00FF
	JSL UNKNOWN_C4A67E
@UNKNOWN16:
	LDA #$0000
	STA $16
	BRA @UNKNOWN21
@UNKNOWN17:
	LDY $1D
	BNE @UNKNOWN19
	LDA a:.LOWORD(UNKNOWN_7E0030)
	AND #$00FF
	BEQ @UNKNOWN18
	JSL WAIT_UNTIL_NEXT_FRAME
@UNKNOWN18:
	JSL UPDATE_MAP_PALETTE_ANIMATION
@UNKNOWN19:
	JSL OAM_CLEAR
	JSL RUN_ACTIONSCRIPT_FRAME
	JSL UNKNOWN_C4A7B0
	JSL UPDATE_SCREEN
	JSL WAIT_UNTIL_NEXT_FRAME
	LDA $16
	CMP #$0001
	BNE @UNKNOWN20
	JSL UNKNOWN_C0943C
@UNKNOWN20:
	LDA $16
	INC
	STA $16
@UNKNOWN21:
	SEP #PROC_FLAGS::ACCUM8
	LDY #screen_transition_config::secondary_duration
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA $02
	LDA $16
	CMP $02
	BCC @UNKNOWN17
	LDY $1D
	BNE @UNKNOWN22
	JSL UNKNOWN_C49740
@UNKNOWN22:
	LDA .LOWORD(GIYGAS_PHASE)
	CMP #$0004
	BCS @UNKNOWN23
	JSL UNKNOWN_C2EAAA
@UNKNOWN23:
	JSL UNKNOWN_C09451
	STZ .LOWORD(UNKNOWN_7E5DAA)
	STZ .LOWORD(UNKNOWN_7E5DA8)
	PLD
	RTL
