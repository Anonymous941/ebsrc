
MOVEMENT_CODE_26: ;$C09BCC
	LDA [$80],Y
	AND #$00FF
	ASL
	TAX
	LDA f:ENTITY_SCRIPT_VAR_TABLES,X
	ADC $88
	TAX
	LDA a:.LOWORD(RAM),X
	LDX $88
	STA .LOWORD(ENTITY_ANIMATION_FRAME),X
	INY
	RTS
