
MOVEMENT_CODE_1D: ;$C09B61
	LDA [$80],Y
	LDX $8A
	STA .LOWORD(MAP_ENTITY_TEMPVARS),X
	INY
	INY
	RTS
