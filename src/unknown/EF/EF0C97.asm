
UNKNOWN_EF0C97: ;$EF0C97
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDA CURRENT_ENTITY_SLOT
	ASL
	TAX
	LDA ENTITY_SCRIPT_VAR0_TABLE,X
	ASL
	TAX
	STZ UNKNOWN_7EB511,X
	RTL
