
SHOW_TOWN_MAP: ;$C13CE5
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDX #$00CA
	LDA #$00FF
	JSL FIND_ITEM_IN_INVENTORY2
	CMP #$0000
	BEQ @NO_TOWN_MAP
	JSL UNKNOWN_C0943C
	JSL DISPLAY_TOWN_MAP
	JSL UNKNOWN_C09451
@NO_TOWN_MAP:
	RTL
