
BTLACT_PSI_FLASH_G: ;$C299EF
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	JSR a:.LOWORD(ATK_FAIL_CHK)
	CMP #$0000
	BNE @UNKNOWN5
	JSR a:.LOWORD(FLASH_IMMUNITY_TEST)
	CMP #$0000
	BEQ @UNKNOWN4
	JSL RAND
	AND #$0007
	BEQ @UNKNOWN0
	CMP #$0001
	BEQ @UNKNOWN0
	CMP #$0002
	BEQ @UNKNOWN1
	CMP #$0003
	BEQ @UNKNOWN2
	BRA @UNKNOWN3
@UNKNOWN0:
	LDA .LOWORD(CURRENT_TARGET)
	JSL KO_TARGET
	BRA @UNKNOWN4
@UNKNOWN1:
	JSR a:.LOWORD(FLASH_INFLICT_PARALYSIS)
	BRA @UNKNOWN4
@UNKNOWN2:
	JSR a:.LOWORD(FLASH_INFLICT_FEELING_STRANGE)
	BRA @UNKNOWN4
@UNKNOWN3:
	JSR a:.LOWORD(FLASH_INFLICT_CRYING)
@UNKNOWN4:
	JSR a:.LOWORD(WEAKEN_SHIELD)
@UNKNOWN5:
	RTL
