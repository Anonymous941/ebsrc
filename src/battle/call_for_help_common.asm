
CALL_FOR_HELP_COMMON: ;$C2BD5E
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 42
	STA $28
	LDX .LOWORD(CURRENT_ATTACKER)
	LDA a:battler::ally_or_enemy,X
	AND #$00FF
	BEQ @UNKNOWN2
	LDX .LOWORD(CURRENT_ATTACKER)
	LDA a:battler::current_action_argument,X
	AND #$00FF
	STA $26
	LOADPTR BTL_ENTRY_PTR_TABLE, $0A
	LDA .LOWORD(CURRENT_BATTLE_GROUP)
	ASL
	ASL
	ASL
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	BRA @UNKNOWN1
@UNKNOWN0:
	LDY #$0001
	LDA [$06],Y
	CMP $26
	BEQ @UNKNOWN4
	LDA #$0003
	CLC
	ADC $06
	STA $06
@UNKNOWN1:
	MOVE_INT $06, $0A
	LDA [$0A]
	AND #$00FF
	CMP #$00FF
	BNE @UNKNOWN0
@UNKNOWN2:
	LDA $28
	BEQ @UNKNOWN3
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_SEED_SPROUT_FAILURE
	JMP a:.LOWORD(@UNKNOWN33)
@UNKNOWN3:
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_NOBODY_CAME
	JMP a:.LOWORD(@UNKNOWN33)
@UNKNOWN4:
	LDX #.LOWORD(BATTLERS_TABLE)
	LDA #$0000
	STA $24
	LDY #$0008
	BRA @UNKNOWN7
@UNKNOWN5:
	LDA a:battler::consciousness,X
	AND #$00FF
	CMP #$0001
	BNE @UNKNOWN6
	LDA a:battler::afflictions + STATUS_GROUP::PERSISTENT_EASYHEAL,X
	AND #$00FF
	CMP #STATUS_0::UNCONSCIOUS
	BEQ @UNKNOWN6
	LDA a:battler::unknown76,X
	CMP $26
	BNE @UNKNOWN6
	LDA $24
	INC
	STA $24
@UNKNOWN6:
	TXA
	CLC
	ADC #.SIZEOF(battler)
	TAX
	INY
@UNKNOWN7:
	CPY #$0020
	BCC @UNKNOWN5
	LOADPTR ENEMY_CONFIGURATION_TABLE, $06
	LDA $26
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	TAX
	STX $22
	TXA
	CLC
	ADC #enemy_data::max_called
	MOVE_INTX $06, $0A
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	AND #$00FF
	TAY
	STY $20
	LDA $24
	STA $02
	TYA
	SEC
	SBC $02
	LDY #$00CD
	JSL MULT168
	LDY $20
	JSL DIVISION16S_DIVISOR_POSITIVE
	SEP #PROC_FLAGS::ACCUM8
	JSR a:.LOWORD(SUCCESS_255)
	.A16
	CMP #$0000
	BNE @UNKNOWN8
	JMP a:.LOWORD(@UNKNOWN2)
@UNKNOWN8:
	LDX $22
	TXA
	CLC
	ADC #enemy_data::battle_sprite
	MOVE_INTX $06, $0A
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	STA $20
	JSR a:.LOWORD(GET_BATTLE_SPRITE_WIDTH)
	ASL
	ASL
	ASL
	CLC
	ADC #$0010
	STA $1E
	LDX $22
	TXA
	CLC
	ADC #enemy_data::row
	CLC
	ADC $06
	STA $06
	LDA [$06]
	AND #$00FF
	STA $1C
	JSR a:.LOWORD(UNKNOWN_C2BD13)
	TAX
	STX $1A
	LDA $20
	JSR a:.LOWORD(GET_BATTLE_SPRITE_WIDTH)
	STA $02
	LDX $1A
	TXA
	CLC
	ADC $02
	CMP #$0020
	BEQ @UNKNOWN9
	BCC @UNKNOWN9
	JMP a:.LOWORD(@UNKNOWN21)
@UNKNOWN9:
	LDA #$0080
	STA $1A
	STA $18
	STA $04
	LDY $04
	STY $16
	LDX #.LOWORD(BATTLERS_TABLE) + (.SIZEOF(battler) * 8)
	STX $14
	LDA #$0008
	STA $22
	BRA @UNKNOWN16
@UNKNOWN10:
	LDA a:battler::consciousness,X
	AND #$00FF
	BEQ @UNKNOWN15
	LDA a:battler::sprite,X
	JSR a:.LOWORD(GET_BATTLE_SPRITE_WIDTH)
	ASL
	ASL
	ASL
	LSR
	STA $02
	STA $12
	LDX $14
	LDA a:battler::row,X
	AND #$00FF
	CMP $1C
	BNE @UNKNOWN12
	LDA a:battler::initiative,X
	AND #$00FF
	SEC
	SBC $02
	LDY $16
	STY $02
	CMP $02
	BCS @UNKNOWN11
	TAY
	STY $16
@UNKNOWN11:
	LDA $12
	STA $02
	LDA a:battler::initiative,X
	AND #$00FF
	CLC
	ADC $02
	CMP $04
	BCC @UNKNOWN15
	BEQ @UNKNOWN15
	STA $04
	BRA @UNKNOWN15
@UNKNOWN12:
	LDA a:battler::initiative,X
	AND #$00FF
	SEC
	SBC $02
	CMP $18
	BCS @UNKNOWN13
	STA $18
@UNKNOWN13:
	LDA a:battler::initiative,X
	AND #$00FF
	CLC
	ADC $02
	CMP $1A
	BCC @UNKNOWN15
	BEQ @UNKNOWN15
	STA $1A
@UNKNOWN15:
	TXA
	CLC
	ADC #.SIZEOF(battler)
	TAX
	STX $14
	INC $22
@UNKNOWN16:
	LDA $22
	CMP #$0020
	BCS @UNKNOWN17
	BEQ @UNKNOWN17
	JMP a:.LOWORD(@UNKNOWN10)
@UNKNOWN17:
	LDA $04
	SEC
	SBC #$0080
	PHA
	LDY $16
	STY $02
	LDA #$0080
	SEC
	SBC $02
	PLX
	STX $02
	CMP $02
	BCS @UNKNOWN18
	CPY $1E
	BCC @UNKNOWN19
	BEQ @UNKNOWN19
	LDA $1E
	LSR
	STA $02
	TYA
	SEC
	SBC $02
	TAY
	STY $24
	JMP a:.LOWORD(@UNKNOWN25)
@UNKNOWN18:
	.A16
	LDA $04
	CLC
	ADC $1E
	CMP #$0100
	BCS @UNKNOWN19
	LDA $1E
	LSR
	STA $02
	LDA $04
	CLC
	ADC $02
	TAY
	STY $24
	JMP a:.LOWORD(@UNKNOWN25)
@UNKNOWN19:
	LDA #$0001
	SEC
	SBC $1C
	STA $1C
	LDA $1A
	SEC
	SBC #$0080
	STA $02
	LDA #$0080
	SEC
	SBC $18
	CMP $02
	BCS @UNKNOWN20
	LDA $18
	CMP $1E
	BCC @UNKNOWN21
	BEQ @UNKNOWN21
	LDA $1E
	LSR
	STA $02
	LDA $18
	SEC
	SBC $02
	TAY
	STY $24
	JMP a:.LOWORD(@UNKNOWN25)
@UNKNOWN20:
	LDA $1A
	CLC
	ADC $1E
	CMP #$0100
	BCS @UNKNOWN21
	LDA $1E
	LSR
	CLC
	ADC $1A
	TAY
	STY $24
	JMP a:.LOWORD(@UNKNOWN25)
@UNKNOWN21:
	LDX #.LOWORD(BATTLERS_TABLE) + (.SIZEOF(battler) * 8)
	STX $12
	LDA #$0008
	STA $02
	BRA @UNKNOWN24
@UNKNOWN22:
	TXA
	CLC
	ADC #battler::consciousness
	TAY
	STY $14
	LDA a:.LOWORD(RAM),Y
	AND #$00FF
	CMP #$0001
	BNE @UNKNOWN23
	LDA a:battler::afflictions + STATUS_GROUP::PERSISTENT_EASYHEAL,X
	AND #$00FF
	CMP #STATUS_0::UNCONSCIOUS
	BNE @UNKNOWN23
	LDA $20
	JSR a:.LOWORD(GET_BATTLE_SPRITE_WIDTH)
	STA $04
	LDX $12
	LDA a:battler::sprite,X
	JSR a:.LOWORD(GET_BATTLE_SPRITE_WIDTH)
	PHA
	LDA $04
	PLY
	STY $04
	CMP $04
	BNE @UNKNOWN23
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	LDY $14 ;battler::consciousness
	STA a:.LOWORD(RAM),Y
	LDX $12
	REP #PROC_FLAGS::ACCUM8
	LDA a:battler::initiative,X
	AND #$00FF
	TAY
	STY $24
	LDA a:battler::row,X
	AND #$00FF
	STA $1C
	BRA @UNKNOWN25
@UNKNOWN23:
	LDX $12
	TXA
	CLC
	ADC #.SIZEOF(battler)
	TAX
	STX $12
	INC $02
@UNKNOWN24:
	LDA $02
	CMP #BATTLER_COUNT
	BCC @UNKNOWN22
	JMP a:.LOWORD(@UNKNOWN2)
@UNKNOWN25:
	JSR a:.LOWORD(UNKNOWN_C2BD13)
	TAX
	STX $22
	LDA $20
	JSR a:.LOWORD(GET_BATTLE_SPRITE_WIDTH)
	STA $02
	LDX $22
	TXA
	CLC
	ADC $02
	CMP #$0020
	BEQ @UNKNOWN26
	BCC @UNKNOWN26
	JMP a:.LOWORD(@UNKNOWN2)
@UNKNOWN26:
	LDA #.LOWORD(BATTLERS_TABLE) + (.SIZEOF(battler) * 8)
	STA $22
	LDX #$0008
	STX $20
	BRA @UNKNOWN28
@UNKNOWN27:
	TAX
	LDA a:battler::consciousness,X
	AND #$00FF
	BEQ @UNKNOWN29
	LDA $22
	CLC
	ADC #.SIZEOF(battler)
	STA $22
	LDX $20
	INX
	STX $20
@UNKNOWN28:
	CPX #$0020
	BCC @UNKNOWN27
@UNKNOWN29:
	LDA $22
	STA .LOWORD(CURRENT_TARGET)
	LDX .LOWORD(CURRENT_TARGET)
	LDA $26
	JSL BATTLE_INIT_ENEMY_STATS
	LDY $24
	TYA
	SEP #PROC_FLAGS::ACCUM8
	LDX .LOWORD(CURRENT_TARGET)
	STA a:battler::initiative,X
	REP #PROC_FLAGS::ACCUM8
	LDA $1C
	SEP #PROC_FLAGS::ACCUM8
	LDX .LOWORD(CURRENT_TARGET)
	STA a:battler::row,X
	LDX .LOWORD(CURRENT_TARGET)
	REP #PROC_FLAGS::ACCUM8
	LDA a:battler::row,X
	AND #$00FF
	BEQ @UNKNOWN30
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0080
	LDX .LOWORD(CURRENT_TARGET)
	STA a:battler::unknown69,X
	BRA @UNKNOWN31
@UNKNOWN30:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0090
	LDX .LOWORD(CURRENT_TARGET)
	STA a:battler::unknown69,X
@UNKNOWN31:
	REP #PROC_FLAGS::ACCUM8
	LDA $26
	JSR a:.LOWORD(UNKNOWN_C2F09F)
	SEP #PROC_FLAGS::ACCUM8
	LDX .LOWORD(CURRENT_TARGET)
	STA a:battler::sprite_y,X
	LDA #$0001
	LDX .LOWORD(CURRENT_TARGET)
	STA a:battler::unknown13,X
	JSL FIX_TARGET_NAME
	.A16
	LDA $28
	BEQ @UNKNOWN32
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_STARTED_GROWING
	BRA @UNKNOWN33
@UNKNOWN32:
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_JOINED_BATTLE
@UNKNOWN33:
	PLD
	RTS
