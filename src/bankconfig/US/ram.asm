.SEGMENT "RAM"
.INCLUDE "config.asm"
.INCLUDE "enums.asm"
.INCLUDE "hardware.asm"
.INCLUDE "structs.asm"
.INCLUDE "symbols.asm"

RAM: ;For pointers.
UNKNOWN_7E0000: ;$7E0000
	.RES 1
UNKNOWN_7E0001: ;$7E0001
	.RES 1
UNKNOWN_7E0002: ;$7E0002
	.RES 1
OAM_ADDR: ;$7E0003
	.RES 2
OAM_END_ADDR: ;$7E0005
	.RES 2
OAM_HIGH_TABLE_ADDR: ;$7E0007
	.RES 2
UNKNOWN_7E0009: ;$7E0009
	.RES 1
UNKNOWN_7E000A: ;$7E000A
	.RES 1
UNKNOWN_7E000B: ;$7E000B
	.RES 2
INIDISP_MIRROR: ;$7E000D
	.RES 1
OBSEL_MIRROR: ;$7E000E
	.RES 1
UNKNOWN_7E000F: ;$7E000F
	.RES 1
MOSAIC_MIRROR: ;$7E0010
	.RES 1
UNKNOWN_7E0011: ;$7E0011
	.RES 1
UNKNOWN_7E0012: ;$7E0012
	.RES 1
UNKNOWN_7E0013: ;$7E0013
	.RES 1
UNKNOWN_7E0014: ;$7E0014
	.RES 1
BG12NBA_MIRROR: ;$7E0015
	.RES 1
UNKNOWN_7E0016: ;$7E0016
	.RES 1
UNUSED_WH2_MIRROR: ;$7E0017
	.RES 1
UNKNOWN_7E0018: ;$7E0018
	.RES 2
TM_MIRROR: ;$7E001A
	.RES 1
TD_MIRROR: ;$7E001B
	.RES 1

.ORG $7E001D
UNKNOWN_7E001D: ;$7E001D
	.RES 1
UNKNOWN_7E001E: ;$7E001E
	.RES 1
HDMAEN_MIRROR: ;$7E001F
	.RES 1
IRQ_CALLBACK: ;$7E0020
	.RES 2
UNKNOWN_7E0022: ;$7E0022
	.RES 1
UNKNOWN_7E0023: ;$7E0023
	.RES 1
RAND_A: ;$7E0024
	.RES 2
RAND_B: ;$7E0026
	.RES 2
UNKNOWN_7E0028: ;$7E0028
	.RES 1
UNKNOWN_7E0029: ;$7E0029
	.RES 1
UNKNOWN_7E002A: ;$7E002A
	.RES 1
UNKNOWN_7E002B: ;$7E002B
	.RES 1
;the ID of the frame being/about to be displayed, multiplied by 2
NEXT_FRAME_DISPLAY_ID: ;$7E002C
	.RES 1
UNKNOWN_7E002D: ;$7E002D
	.RES 1
;the ID of the next frame to buffer as a byte offset - 0 for buffer 0, 2 for buffer 1
NEXT_FRAME_BUF_ID: ;$7E002E
	.RES 1
UNKNOWN_7E002F: ;$7E002F
	.RES 1
; DMA table offset?
UNKNOWN_7E0030: ;$7E0030
	.RES 1
BG1_X_POS: ;$7E0031
	.RES 2
BG1_Y_POS: ;$7E0033
	.RES 2
BG2_X_POS: ;$7E0035
	.RES 2
BG2_Y_POS: ;$7E0037
	.RES 2
BG3_X_POS: ;$7E0039
	.RES 2
BG3_Y_POS: ;$7E003B
	.RES 2
BG4_X_POS: ;$7E003D
	.RES 2
BG4_Y_POS: ;$7E003F
	.RES 2
BG1_X_POS_BUF: ;$7E0041
	.RES 4
BG1_Y_POS_BUF: ;$7E0045
	.RES 4
BG2_X_POS_BUF: ;$7E0049
	.RES 4
BG2_Y_POS_BUF: ;$7E004D
	.RES 4
BG3_X_POS_BUF: ;$7E0051
	.RES 4
BG3_Y_POS_BUF: ;$7E0055
	.RES 4
BG4_X_POS_BUF: ;$7E0059
	.RES 4
BG4_Y_POS_BUF: ;$7E005D
	.RES 4
UNKNOWN_7E0061: ;$7E0061
	.RES 2
UNKNOWN_7E0063: ;$7E0063
	.RES 2
PAD_STATE: ;$7E0065
	.RES 2 * 2
PAD_HELD: ;$7E0069
	.RES 2 * 2
PAD_PRESS: ;$7E006D
	.RES 2 * 2
UNKNOWN_7E0071: ;$7E0071
	.RES 2 * 2
UNKNOWN_7E0075: ;$7E0075
	.RES 2
UNKNOWN_7E0077: ;$7E0077
	.RES 2 * 2
UNKNOWN_7E007B: ;$7E007B
	.RES 1
UNKNOWN_7E007C: ;$7E007C
	.RES 1
UNKNOWN_7E007D: ;$7E007D
	.RES 2
UNKNOWN_7E007F: ;$7E007F
	.RES 1
UNKNOWN_7E0080: ;$7E0080
	.RES 1
UNKNOWN_7E0081: ;$7E0081
	.RES 2
UNKNOWN_7E0083: ;$7E0083
	.RES 2
UNKNOWN_7E0085: ;$7E0085
	.RES 2
UNKNOWN_7E0087: ;$7E0087
	.RES 2
UNKNOWN_7E0089: ;$7E0089
	.RES 2
UNKNOWN_7E008B: ;$7E008B
	.RES 2
UNKNOWN_7E008D: ;$7E008D
	.RES 2
UNKNOWN_7E008F: ;$7E008F
	.RES 2
UNKNOWN_7E0091: ;$7E0091
	.RES 1
DMA_COPY_SIZE: ;$7E0092
	.RES 2
DMA_COPY_RAM_SRC: ;$7E0094
	.RES 3
DMA_COPY_VRAM_DEST: ;$7E0097
	.RES 2
UNKNOWN_7E0099: ;$7E0099
	.RES 2
UNKNOWN_7E009B: ;$7E009B
	.RES 2
UNKNOWN_7E009D: ;$7E009D
	.RES 2
UNKNOWN_7E009F: ;$7E009F
	.RES 2
CURRENT_HEAP_ADDRESS: ;$7E00A1
	.RES 2
BASE_HEAP_ADDRESS: ;$7E00A3
	.RES 2
UNKNOWN_7E00A5: ;$7E00A5
	.RES 1
UNKNOWN_7E00A6: ;$7E00A6
	.RES 1
TIMER: ;$7E00A7
	.RES 4
UNKNOWN_7E00AB: ;$7E00AB
	.RES 1
UNKNOWN_7E00AC: ;$7E00AC
	.RES 1
UNKNOWN_7E00AD: ;$7E00AC
	.RES 1
UNKNOWN_7E00AE: ;$7E00AE

.ORG $7E00B0
UNKNOWN_7E00B0: ;$7E00B0
	.RES 1
UNKNOWN_7E00B1: ;$7E00B1
	.RES 1
UNKNOWN_7E00B2: ;$7E00B2
	.RES 2
TEMP_DIVIDEND: ;$7E00B4
	.RES 1
UNKNOWN_7E00B5: ;$7E00B5
	.RES 1
UNKNOWN_7E00B6: ;$7E00B6
	.RES 1
UNKNOWN_7E00B7: ;$7E00B7
	.RES 1
UNKNOWN_7E00B8: ;$7E00B8
	.RES 1
UNKNOWN_7E00B9: ;$7E00B9
	.RES 1
UNKNOWN_7E00BA: ;$7E00BA
	.RES 2
UNKNOWN_7E00BC: ;$7E00BC
	.RES 2
UNKNOWN_7E00BE: ;$7E00BE
	.RES 2
UNKNOWN_7E00C0: ;$7E00C0

.ORG $7E00C4
UNKNOWN_7E00C4: ;$7E00C4
	.RES 2
SPC_DATA_PTR: ;$7E00C6
	.RES 2
UNKNOWN_7E00C8: ;$7E00C8
	.RES 2
SOUND_EFFECT_QUEUE_END_INDEX: ;$7E00CA
	.RES 1
SOUND_EFFECT_QUEUE_INDEX: ;$7E00CB
	.RES 1
UNKNOWN_7E00CC: ;$7E00CC
	.RES 2
UNKNOWN_7E00CE: ;$7E00CE
	.RES 1
UNKNOWN_7E00CF: ;$7E00CF
	.RES 2
UNKNOWN_7E00D1: ;$7E00D1
	.RES 1
UNKNOWN_7E00D2: ;$7E00D2
	.RES 1
UNKNOWN_7E00D3: ;$7E00D3

.ORG $7E0200
CUR_TEXT_PAL: ;$7E0200
	.RES TEXT_PALETTES_SIZE
CUR_MAP_PAL: ;$7E0240
	.RES MAP_PALETTES_SIZE
CUR_SPRITE_PALS: ;$7E0300
	.RES NPC_PALETTES_SIZE
CUR_PARTY_PAL: ;$7E03A0
	.RES PARTY_PALETTES_SIZE
UNKNOWN_7E0400: ;$7E0400

.ORG $7E0500
; OAM data for every odd frame
OAM1: ;$7E0500
	.RES .SIZEOF(oam_entry) * 128
OAM1_HIGH_TABLE: ;$7E0700
	.RES 32

; free space
	.RES 224

; Same as OAM1, but used for every other frame
OAM2: ;$7E0800
	.RES .SIZEOF(oam_entry) * 128
OAM2_HIGH_TABLE: ;$7E0A00
	.RES 32

JMP_BUF1: ;$7E0A20
	.RES 10
JMP_BUF2: ;$7E0A2A
	.RES 10
UNKNOWN_7E0A34: ;$7E0A34
	.RES 2
UNKNOWN_7E0A36: ;$7E0A36
	.RES 2
NEW_ENTITY_VAR0: ;$7E0A38
	.RES 2
NEW_ENTITY_VAR1: ;$7E0A3A
	.RES 2
NEW_ENTITY_VAR2: ;$7E0A3C
	.RES 2
NEW_ENTITY_VAR3: ;$7E0A3E
	.RES 2
NEW_ENTITY_VAR4: ;$7E0A40
	.RES 2
NEW_ENTITY_VAR5: ;$7E0A42
	.RES 2
NEW_ENTITY_VAR6: ;$7E0A44
	.RES 2
NEW_ENTITY_VAR7: ;$7E0A46
	.RES 2
NEW_ENTITY_POS_Z: ;$7E0A48
	.RES 2
NEW_ENTITY_PRIORITY: ;$7E0A4A
	.RES 2
ENTITY_ALLOCATION_MIN_SLOT: ;$7E0A4C
	.RES 2
ENTITY_ALLOCATION_MAX_SLOT: ;$7E0A4E
	.RES 2
FIRST_ENTITY: ;$7E0A50
	.RES 2
UNKNOWN_7E0A52: ;$7E0A52
	.RES 2
UNKNOWN_7E0A54: ;$7E0A54
	.RES 2
UNKNOWN_7E0A56: ;$7E0A56
	.RES 2
UNKNOWN_7E0A58: ;$7E0A58
	.RES 2
MOVEMENT_42_LOADED_PTR: ;$7E0A5A
	.RES 4
UNKNOWN_7E0A5E: ;$7E0A5E
	.RES 2
UNKNOWN_7E0A60: ;$7E0A60
	.RES 2
ENTITY_SCRIPT_TABLE: ;$7E0A62
	.RES MAX_ENTITIES*2
ENTITY_NEXT_ENTITY_TABLE: ;$7E0A9E
	.RES MAX_ENTITIES*2
ENTITY_SCRIPT_INDEX_TABLE: ;$7E0ADA
	.RES MAX_ENTITIES*2
ENTITY_SCREEN_X_TABLE: ;$7E0B16
	.RES MAX_ENTITIES*2
ENTITY_SCREEN_Y_TABLE: ;$7E0B52
	.RES MAX_ENTITIES*2
ENTITY_ABS_X_TABLE: ;$7E0B8E
	.RES MAX_ENTITIES*2
ENTITY_ABS_Y_TABLE: ;$7E0BCA
	.RES MAX_ENTITIES*2
ENTITY_ABS_Z_TABLE: ;$7E0C06
	.RES MAX_ENTITIES*2
ENTITY_ABS_X_FRACTION_TABLE: ;$7E0C42
	.RES MAX_ENTITIES*2
ENTITY_ABS_Y_FRACTION_TABLE: ;$7E0C7E
	.RES MAX_ENTITIES*2
ENTITY_ABS_Z_FRACTION_TABLE: ;$7E0CBA
	.RES MAX_ENTITIES*2
ENTITY_DELTA_X_TABLE: ;$7E0CF6
	.RES MAX_ENTITIES*2
ENTITY_DELTA_Y_TABLE: ;$7E0D32
	.RES MAX_ENTITIES*2
ENTITY_DELTA_Z_TABLE: ;$7E0D6E
	.RES MAX_ENTITIES*2
ENTITY_DELTA_X_FRACTION_TABLE: ;$7E0DAA
	.RES MAX_ENTITIES*2
ENTITY_DELTA_Y_FRACTION_TABLE: ;$7E0DE6
	.RES MAX_ENTITIES*2
ENTITY_DELTA_Z_FRACTION_TABLE: ;$7E0E22
	.RES MAX_ENTITIES*2
ENTITY_SCRIPT_VAR0_TABLE: ;$7E0E5E
	.RES MAX_ENTITIES*2
ENTITY_SCRIPT_VAR1_TABLE: ;$7E0E9A
	.RES MAX_ENTITIES*2
ENTITY_SCRIPT_VAR2_TABLE: ;$7E0ED6
	.RES MAX_ENTITIES*2
ENTITY_SCRIPT_VAR3_TABLE: ;$7E0F12
	.RES MAX_ENTITIES*2
ENTITY_SCRIPT_VAR4_TABLE: ;$7E0F4E
	.RES MAX_ENTITIES*2
ENTITY_SCRIPT_VAR5_TABLE: ;$7E0F8A
	.RES MAX_ENTITIES*2
ENTITY_SCRIPT_VAR6_TABLE: ;$7E0FC6
	.RES MAX_ENTITIES*2
ENTITY_SCRIPT_VAR7_TABLE: ;$7E1002
	.RES MAX_ENTITIES*2
ENTITY_DRAW_PRIORITY: ;$7E103E
	.RES MAX_ENTITIES*2
ENTITY_TICK_CALLBACK_LOW: ;$7E107A
	.RES MAX_ENTITIES*2
ENTITY_TICK_CALLBACK_HIGH: ;$7E10B6
	.RES MAX_ENTITIES*2
ENTITY_ANIMATION_FRAME: ;$7E10F2
	.RES MAX_ENTITIES*2
ENTITY_SPRITEMAP_POINTER_LOW: ;$7E112E
	.RES MAX_ENTITIES*2
ENTITY_SPRITEMAP_POINTER_HIGH: ;$7E116A
	.RES MAX_ENTITIES*2
ENTITY_SCREEN_POSITION_CALLBACK: ;$7E11A6
	.RES MAX_ENTITIES*2
ENTITY_DRAW_CALLBACK: ;$7E11E2
	.RES MAX_ENTITIES*2
ENTITY_MOVE_CALLBACK: ;$7E121E
	.RES MAX_ENTITIES*2
UNKNOWN_7E125A: ;$7E125A
	.RES MAX_SCRIPTS*2
UNKNOWN_7E12E6: ;$7E12E6
	.RES MAX_SCRIPTS*2
ENTITY_SLEEP_FRAMES: ;$7E1372
	.RES MAX_SCRIPTS*2
ENTITY_PROGRAM_COUNTER: ;$7E13FE
	.RES MAX_SCRIPTS*2
ENTITY_PROGRAM_COUNTER_BANK: ;$7E148A
	.RES MAX_SCRIPTS*2
ENTITY_TEMPVARS: ;$7E1516

.ORG $7E15A2
UNKNOWN_7E15A2: ;$7E15A2

.ORG $7E1A02
UNKNOWN_7E1A02: ;$7E1A02
	.RES 8
UNKNOWN_7E1A0A: ;$7E1A0A
	.RES 8
UNKNOWN_7E1A12: ;$7E1A12
	.RES 8
UNKNOWN_7E1A1A: ;$7E1A1A
	.RES 8
UNKNOWN_7E1A22: ;$7E1A22
	.RES 8
UNKNOWN_7E1A2A: ;$7E1A2A
	.RES 8
UNKNOWN_7E1A32: ;$7E1A32
	.RES 8
UNKNOWN_7E1A3A: ;$7E1A3A
	.RES 8
CURRENT_ENTITY_SLOT: ;$7E1A42
	.RES 2
CURRENT_ENTITY_OFFSET: ;$7E1A44
	.RES 2
CURRENT_SCRIPT_SLOT: ;$7E1A46
	.RES 2
CURRENT_SCRIPT_OFFSET: ;$7E1A48
	.RES 2
UNKNOWN_7E1A4A: ;$7E1A4A

.ORG $7E1A86
UNKNOWN_7E1A86: ;$7E1A86

.ORG $7E1AC2
SOUND_EFFECT_QUEUE: ;$7E1AC2
	.RES 8
UNKNOWN_7E1ACA: ;$7E1ACA
	.RES 1
UNKNOWN_7E1ACB: ;$7E1ACB
	.RES 1
UNKNOWN_7E1ACC: ;$7E1ACC
	.RES 2
UNKNOWN_7E1ACE: ;$7E1ACE

.ORG $7E1AD2
UNKNOWN_7E1AD2: ;$7E1AD2
	.RES 2
UNKNOWN_7E1AD4: ;$7E1AD4
	.RES 2
UNKNOWN_7E1AD6: ;$7E1AD6
	.RES 64 * 2
UNKNOWN_7E1B56: ;$7E1B56

.ORG $7E1B6E
UNKNOWN_7E1B6E: ;$7E1B6E
	.RES 24
UNKNOWN_7E1B86: ;$7E1B86
	.RES 24
UNKNOWN_7E1B9E: ;$7E1B9E
	.RES 2
UNKNOWN_7E1BA0: ;$7E1BA0
	.RES 1
UNKNOWN_7E1BA1: ;$7E1BA1
	.RES 2
UNKNOWN_7E1BA3: ;$7E1BA3
	.RES 2
UNKNOWN_7E1BA5: ;$7E1BA5
	.RES 1
UNKNOWN_7E1BA6: ;$7E1BA6
	.RES 1
UNKNOWN_7E1BA7: ;$7E1BA7
	.RES 1
UNKNOWN_7E1BA8: ;$7E1BA8
	.RES 1
UNKNOWN_7E1BA9: ;$7E1BA9
	.RES 1
UNKNOWN_7E1BAA: ;$7E1BAA

.ORG $7E1BCA
UNKNOWN_7E1BCA: ;$7E1BCA
	.RES 2
UNKNOWN_7E1BCC: ;$7E1BCC
	.RES 2
UNKNOWN_7E1BCE: ;$7E1BCE
	.RES 2
UNKNOWN_7E1BD0: ;$7E1BD0
	.RES 2
UNKNOWN_7E1BD2: ;$7E1BD2
	.RES 2
UNKNOWN_7E1BD4: ;$7E1BD4

.ORG $7E1C00
STACK_START: ;$7E1C00
	.RES 768
STACK_END: ;$7E1F00
STACK_65816_START: ;$7E1F00
	.RES 255
STACK_65816_END: ;$7E1FFF
	.RES 1
HEAP: ;$7E2000
	.RES HEAPSIZE

.ORG $7E2400
UNKNOWN_7E2400: ;$7E2400
	.RES 2
UNKNOWN_7E2402: ;$7E2402
	.RES 2
UNKNOWN_7E2404: ;$7E2404
	.RES 2 * 32
UNKNOWN_7E2444: ;$7E2444
	.RES 2 * 32
UNKNOWN_7E2484: ;$7E2484
	.RES 2 * 32
UNKNOWN_7E24C4: ;$7E24C4
	.RES 2 * 32
UNKNOWN_7E2504: ;$7E2504
	.RES 2
UNKNOWN_7E2506: ;$7E2506
	.RES 2 * 32
UNKNOWN_7E2546: ;$7E2546
	.RES 2 * 32
UNKNOWN_7E2586: ;$7E2586
	.RES 2 * 32
UNKNOWN_7E25C6: ;$7E25C6
	.RES 2 * 32
UNKNOWN_7E2606: ;$7E2606
	.RES 2
UNKNOWN_7E2608: ;$7E2608
	.RES 2 * 32
UNKNOWN_7E2648: ;$7E2648
	.RES 2 * 32
UNKNOWN_7E2688: ;$7E2688
	.RES 2 * 32
UNKNOWN_7E26C8: ;$7E26C8
	.RES 2 * 32
UNKNOWN_7E2708: ;$7E2708
	.RES 2
UNKNOWN_7E270A: ;$7E270A
	.RES 2 * 32
UNKNOWN_7E274A: ;$7E274A
	.RES 2 * 32
UNKNOWN_7E278A: ;$7E278A
	.RES 2 * 32
UNKNOWN_7E27CA: ;$7E27CA
	.RES 2 * 32
UNKNOWN_7E280A: ;$7E280A
	.RES 2
ENTITY_DRAW_SORTING: ;$7E280C
	.RES MAX_ENTITIES*2
UNKNOWN_7E2848: ;$7E2848
	.RES 2
UNKNOWN_7E284A: ;$7E284A
	.RES 2
ENTITY_UNKNOWN_284C: ;$7E284C
	.RES MAX_ENTITIES*2
UNKNOWN_7E2888: ;$7E2888
	.RES 2
UNKNOWN_7E288A: ;$7E288A
	.RES 2
UNKNOWN_7E288C: ;$7E288C
	.RES 2
UNKNOWN_7E288E: ;$7E288E
	.RES 2
UNKNOWN_7E2890: ;$7E2890
	.RES 2
UNKNOWN_7E2892: ;$7E2892
	.RES 2
UNKNOWN_7E2894: ;$7E2894
	.RES 2
UNKNOWN_7E2896: ;$7E2896
	.RES 2
UNKNOWN_7E2898: ;$7E2898
	.RES 2
FOOTSTEP_SOUND_ID: ;$7E289A
	.RES 2
FOOTSTEP_SOUND_ID_OVERRIDE: ;$7E289C
	.RES 2
ENTITY_COLLIDED_OBJECTS: ;$7E289E
	.RES MAX_ENTITIES*2
ENTITY_OBSTACLE_FLAGS: ;$7E28DA
	.RES MAX_ENTITIES*2
ENTITY_UNKNOWN_2916: ;$7E2916
	.RES MAX_ENTITIES*2
ENTITY_UNKNOWN_2952: ;$7E2952
	.RES MAX_ENTITIES*2
ENTITY_VRAM_ADDRESS: ;$7E298E
	.RES MAX_ENTITIES*2
ENTITY_GRAPHICS_PTR_LOW: ;$7E29CA
	.RES MAX_ENTITIES*2
ENTITY_GRAPHICS_PTR_HIGH: ;$7E2A06
	.RES MAX_ENTITIES*2
UNKNOWN_30X2_TABLE_31: ;$7E2A42
	.RES MAX_ENTITIES*2
ENTITY_BYTE_WIDTHS: ;$7E2A7E
	.RES MAX_ENTITIES*2
ENTITY_TILE_HEIGHTS: ;$7E2ABA
	.RES MAX_ENTITIES*2
ENTITY_DIRECTIONS: ;$7E2AF6
	.RES MAX_ENTITIES*2
UNKNOWN_30X2_TABLE_35: ;$7E2B32
	.RES MAX_ENTITIES*2
UNKNOWN_30X2_TABLE_36: ;$7E2B6E
	.RES MAX_ENTITIES*2
ENTITY_SURFACE_FLAGS: ;$7E2BAA
	.RES MAX_ENTITIES*2
UNKNOWN_30X2_TABLE_38: ;$7E2BE6
	.RES MAX_ENTITIES*2
UNKNOWN_30X2_TABLE_40: ;$7E2C22
	.RES MAX_ENTITIES*2
UNKNOWN_30X2_TABLE_41: ;$7E2C5E
	.RES MAX_ENTITIES*2
ENTITY_TPT_ENTRIES: ;$7E2C9A
	.RES MAX_ENTITIES*2
ENTITY_TPT_ENTRY_SPRITES: ;$7E2CD6
	.RES MAX_ENTITIES*2
ENTITY_ENEMY_ID: ;$7E2D12
	.RES MAX_ENTITIES*2
UNKNOWN_30X2_TABLE_43: ;$7E2D4E
	.RES MAX_ENTITIES*2
UNKNOWN_30X2_TABLE_44: ;$7E2D8A
	.RES MAX_ENTITIES*2
UNKNOWN_30X2_TABLE_45: ;$7E2DC6
	.RES MAX_ENTITIES*2
UNKNOWN_30X2_TABLE_46: ;$7E2E02
	.RES MAX_ENTITIES*2
UNKNOWN_7E2E3E: ;$7E2E3E
	.RES MAX_ENTITIES*2
UNKNOWN_7E2E7A: ;$7E2E7A
	.RES MAX_ENTITIES*2
ENTITY_MUSHROOMIZED_OVERLAY_PTRS: ;$7E2EB6
	.RES MAX_ENTITIES*2
UNKNOWN_7E2EF2: ;$7E2EF2
	.RES MAX_ENTITIES*2
UNKNOWN_7E2F2E: ;$7E2F2E
	.RES MAX_ENTITIES*2
ENTITY_SWEATING_OVERLAY_PTRS: ;$7E2F6A
	.RES MAX_ENTITIES*2
UNKNOWN_7E2FA6: ;$7E2FA6
	.RES MAX_ENTITIES*2
UNKNOWN_7E2FE2: ;$7E2FE2
	.RES MAX_ENTITIES*2
ENTITY_RIPPLE_OVERLAY_PTRS: ;$7E301E
	.RES MAX_ENTITIES*2
UNKNOWN_7E305A: ;$7E305A
	.RES MAX_ENTITIES*2
UNKNOWN_7E3096: ;$7E3096
	.RES MAX_ENTITIES*2
ENTITY_BIG_RIPPLE_OVERLAY_PTRS: ;$7E30D2
	.RES MAX_ENTITIES*2
UNKNOWN_7E310E: ;$7E310E
	.RES MAX_ENTITIES*2
UNKNOWN_7E314A: ;$7E314A
	.RES MAX_ENTITIES*2
UNKNOWN_7E3186: ;$7E3186

.ORG $7E332A
UNKNOWN_7E332A: ;$7E332A
	.RES MAX_ENTITIES*2
UNKNOWN_7E3366: ;$7E3366
	.RES MAX_ENTITIES*2
UNKNOWN_7E33A2: ;$7E33A2
	.RES MAX_ENTITIES*2
UNKNOWN_7E33DE: ;$7E33DE
	.RES MAX_ENTITIES*2
UNKNOWN_7E341A: ;$7E341A
	.RES MAX_ENTITIES*2
UNKNOWN_7E3456: ;$7E3456
	.RES MAX_ENTITIES*2
UNKNOWN_7E3492: ;$7E3492
	.RES 16
UNKNOWN_7E34A2: ;$7E34A2
	.RES 16
UNKNOWN_7E34B2: ;$7E34B2
	.RES 1632
UNKNOWN_7E3B12: ;$7E3B12
	.RES 8*3

.ORG $7E3C14
UNKNOWN_7E3C14: ;$7E3C14
	.RES 2
UNKNOWN_7E3C16: ;$7E3C16
	.RES 2
UNKNOWN_7E3C18: ;$7E3C18
	.RES 2
UNKNOWN_7E3C1A: ;$7E3C1A
	.RES 2
UNKNOWN_7E3C1C: ;$7E3C1C
	.RES 2
UNKNOWN_7E3C1E: ;$7E3C1E
	.RES 2
UNKNOWN_7E3C20: ;$7E3C20
	.RES 2
UNKNOWN_7E3C22: ;$7E3C22
	.RES 1
UNKNOWN_7E3C23: ;$7E3C23
	.RES 1
UNKNOWN_7E3C24: ;$7E3C24
	.RES 2
UNKNOWN_7E3C26: ;$7E3C26
	.RES 1
UNKNOWN_7E3C27: ;$7E3C27
	.RES 1
UNKNOWN_7E3C28: ;$7E3C28
	.RES 2
UNKNOWN_7E3C2A: ;$7E3C2A
	.RES 2
UNKNOWN_7E3C2C: ;$7E3C2C
	.RES 2
UNKNOWN_7E3C2E: ;$7E3C2E
	.RES 2
UNKNOWN_7E3C30: ;$7E3C30
	.RES 2
UNKNOWN_7E3C32: ;$7E3C32
	.RES 2

.ORG $7E3C3C
UNKNOWN_7E3C3C: ;$7E3C3C
	.RES 2

.ORG $7E3C46
UNKNOWN_7E3C46: ;$7E3C46
	.RES $380
UNKNOWN_7E3FC6: ;$7E3FC6
	.RES 1
UNKNOWN_7E3FC7: ;$7E3FC7
	.RES 2
UNKNOWN_7E3FC9: ;$7E3FC9
	.RES 1
UNKNOWN_7E3FCA: ;$7E3FCA
	.RES 2
UNKNOWN_7E3FCC: ;$7E3FCC

.ORG $7E3FD0
UNKNOWN_7E3FD0: ;$7E3FD0

.ORG $7E4098
UNKNOWN_7E4098: ;$7E4098

.ORG $7E4160
UNKNOWN_7E4160: ;$7E4160

.ORG $7E436C
DEBUG: ;$7E436C
	.RES 2
UNKNOWN_7E436E: ;$7E436E
	.RES 2
UNKNOWN_7E4370: ;$7E4370
	.RES 2
UNKNOWN_7E4372: ;$7E4372
	.RES 2
UNKNOWN_7E4374: ;$7E4374
	.RES 2
UNKNOWN_7E4376: ;$7E4376

.ORG $7E437C
UNKNOWN_7E437C: ;$7E437C
	.RES 2
UNKNOWN_7E437E: ;$7E437E
	.RES 2
UNKNOWN_7E4380: ;$7E4380
	.RES 2
UNKNOWN_7E4382: ;$7E4382
	.RES 2
UNKNOWN_7E4384: ;$7E4384
	.RES 2
UNKNOWN_7E4386: ;$7E4386
	.RES 2
UNKNOWN_7E4388: ;$7E4388
	.RES 2
UNKNOWN_7E438A: ;$7E438A
	.RES 2
UNKNOWN_7E438C: ;$7E438C
	.RES 2
CURRENT_SECTOR_ATTRIBUTES: ;$7E438E
	.RES 2
UNKNOWN_7E4390: ;$7E4390
	.RES 16
UNKNOWN_7E43A0: ;$7E43A0
	.RES 16
UNKNOWN_7E43B0: ;$7E43A0
	.RES 16
UNKNOWN_7E43C0: ;$7E43A0
	.RES 16
UNKNOWN_7E43D0: ;$7E43D0
	.RES 2
UNKNOWN_7E43D2: ;$7E43D2
	.RES 2
UNKNOWN_7E43D4: ;$7E43D4
	.RES 2
UNKNOWN_7E43D6: ;$7E43D6
	.RES 2
UNKNOWN_7E43D8: ;$7E43D8
	.RES 2
UNKNOWN_7E43DA: ;$7E43DA
	.RES 2
OVERWORLD_TILESET_ANIM: ;$7E43DC
	.RES .SIZEOF(overworld_tileset_anim) * 8
OVERWORLD_PALETTE_ANIM: ;$7E445C
	.RES .SIZEOF(overworld_palette_anim)
UNKNOWN_7E4472: ;$7E4472
	.RES 2
UNKNOWN_7E4474: ;$7E4474
	.RES 2
UNKNOWN_7E4476: ;$7E4476

.ORG $7E4676
UNKNOWN_7E4676: ;$7E4676

.ORG $7E467A
;an ID for the UNKNOWN_C42F8C table
UNKNOWN_7E467A: ;$7E467A
	.RES 2
UNKNOWN_7E467C: ;$7E467C
	.RES 2
SPRITE_TABLE_7E467E: ;$7E467E
	.RES .SIZEOF(spritemap) * 179
UNUSED_7E49FD: ;$7E49FD
	.RES 3
UNKNOWN_7E4A00: ;$7E4A00
	.RES 88
UNKNOWN_7E4A58: ;$7E4A58
	.RES 2
UNKNOWN_7E4A5A: ;$7E4A5A
	.RES 2
OVERWORLD_ENEMY_COUNT: ;$7E4A5C
	.RES 2
UNKNOWN_7E4A5E: ;$7E4A5E
	.RES 2
MAGIC_BUTTERFLY: ;$7E4A60
	.RES 2
UNKNOWN_7E4A62: ;$7E4A62
	.RES 2
UNKNOWN_7E4A64: ;$7E4A64
	.RES 2
SHOW_NPC_FLAG: ;$7E4A66
	.RES 2
UNKNOWN_7E4A68: ;$7E4A68
	.RES 2
UNKNOWN_7E4A6A: ;$7E4A6A
	.RES 2
UNKNOWN_7E4A6C: ;$7E4A6C
	.RES 2
UNKNOWN_7E4A6E: ;$7E4A6E
	.RES 2
UNKNOWN_7E4A70: ;$7E4A70
	.RES 2
UNKNOWN_7E4A72: ;$7E4A72
	.RES 2
UNKNOWN_7E4A74: ;$7E4A74
	.RES 2
UNKNOWN_7E4A76: ;$7E4A76
	.RES 4
UNKNOWN_7E4A7A: ;$7E4A7A
	.RES 2
UNKNOWN_7E4A7C: ;$7E4A7C

.ORG $7E4A84
UNKNOWN_7E4A84: ;$7E4A84

.ORG $7E4A8C
CURRENT_BATTLE_GROUP: ;$7E4A8C
	.RES 2
UNKNOWN_7E4A8E: ;$7E4A8E
	.RES 2
UNKNOWN_7E4A90: ;$7E4A90
	.RES 2
UNKNOWN_7E4A92: ;$7E4A92
	.RES 2
UNKNOWN_7E4A94: ;$7E4A94
	.RES 2
UNKNOWN_7E4A96: ;$7E4A96

.ORG $7E4DB6
TOUCHED_ENEMY: ;$7E4DB6

.ORG $7E4DB8
UNKNOWN_7E4DB8: ;$7E4DB8
	.RES 2
BATTLE_SWIRL_FLAG: ;$7E4DBA
	.RES 2
BATTLE_INITIATIVE: ;$7E4DBC
	.RES 2
UNKNOWN_7E4DBE: ;$7E4DBE
	.RES 2
UNKNOWN_7E4DC0: ;$7E4DC0
	.RES 2
BATTLE_DEBUG: ;$7E4DC2
	.RES 2
UNKNOWN_7E4DC4: ;$7E4DC4
	.RES 2
UNKNOWN_7E4DC6: ;$7E4DC6
	.RES 2
CHOSEN_FOUR_PTRS: ;$7E4DC8

.ORG $7E4DD4
UNKNOWN_7E4DD4: ;$7E4DD4
	.RES 2
HORIZONTAL_MOVEMENT_SPEEDS: ;$7E4DD6
	.RES .SIZEOF(movement_speeds) * 14
VERTICAL_MOVEMENT_SPEEDS: ;$7E4F96
	.RES .SIZEOF(movement_speeds) * 14
PLAYER_POSITION_BUFFER: ;$7E5156
	.RES .SIZEOF(player_position_buffer_entry) * 256
MISC_DEBUG_FLAGS: ;$7E5D56
	.RES 2
UNKNOWN_7E5D58: ;$7E5D58
	.RES 2
UNKNOWN_7E5D5A: ;$7E5D5A
	.RES 2
UNKNOWN_7E5D5C: ;$7E5D5C
	.RES 2
UNKNOWN_7E5D5E: ;$7E5D5E
	.RES 2
BATTLE_SWIRL_COUNTDOWN: ;$7E5D60
	.RES 2
CURRENT_TPT_ENTRY: ;$7E5D62
	.RES 2
UNKNOWN_7E5D64: ;$7E5D64
	.RES 2
UNKNOWN_7E5D66: ;$7E5D66
	.RES 12
UNKNOWN_7E5D72: ;$7E5D72
	.RES 2
UNKNOWN_7E5D74: ;$7E5D74
	.RES 2
UNKNOWN_7E5D76: ;$7E5D76
	.RES 2
UNKNOWN_7E5D78: ;$7E5D78

.ORG $7E5D7A
UNKNOWN_7E5D7A: ;$7E5D7A
	.RES 2
UNKNOWN_7E5D7C: ;$7E5D7C
	.RES 2
UNKNOWN_7E5D7E: ;$7E5D7E

.ORG $7E5D8C
UNKNOWN_7E5D8C: ;$7E5D8C
	.RES 2 * 6
OVERWORLD_STATUS_SUPPRESSION: ;$7E5D98
	.RES 2
UNKNOWN_7E5D9A: ;$7E5D9A
	.RES 2
MUSHROOMIZATION_TIMER: ;$7E5D9C - Time left until next direction swap in frames
	.RES 2
MUSHROOMIZATION_MODIFIER: ;$7E5D9E - Which set of swapped directions to use
	.RES 2
MUSHROOMIZED_WALKING_FLAG: ;$7E5DA0 - Whether or not to use mushroomized movement logic
	.RES 2
UNKNOWN_7E5DA2: ;$7E5DA2
	.RES 2
UNKNOWN_7E5DA4: ;$7E5DA4
	.RES 2
UNKNOWN_7E5DA6: ;$7E5DA6
	.RES 2
UNKNOWN_7E5DA8: ;$7E5DA8
	.RES 2
UNKNOWN_7E5DAA: ;$7E5DAA
	.RES 2
UNKNOWN_7E5DAC: ;$7E5DAC
	.RES 2
UNKNOWN_7E5DAE: ;$7E5DAE

.ORG $7E5DB4
UNKNOWN_7E5DB4: ;$7E5DB4
	.RES 2
UNKNOWN_7E5DB6: ;$7E5DB6
	.RES 2
UNKNOWN_7E5DB8: ;$7E5DB8
	.RES 2
UNKNOWN_7E5DBA: ;$7E5DBA
	.RES 2
UNKNOWN_7E5DBC: ;$7E5DBC
	.RES 2
UNKNOWN_7E5DBE: ;$7E5DBE
	.RES 2
CURRENT_QUEUED_INTERACTION_TYPE: ;$7E5DC0
	.RES 2
UNKNOWN_7E5DC2: ;$7E5DC2
	.RES 2
UNKNOWN_7E5DC4: ;$7E5DC4
	.RES 2
UNKNOWN_7E5DC6: ;$7E5DC6

.ORG $7E5DCA
UNKNOWN_7E5DCA: ;$7E5DCA
	.RES 2
UNKNOWN_7E5DCC: ;$7E5DCC
	.RES 2
UNKNOWN_7E5DCE: ;$7E5DCE
	.RES 2
UNKNOWN_7E5DD0: ;$7E5DD0
	.RES 2
UNKNOWN_7E5DD2: ;$7E5DD2
	.RES 2
UNKNOWN_7E5DD4: ;$7E5DD4
	.RES 2
UNKNOWN_7E5DD6: ;$7E5DD6
	.RES 2
UNKNOWN_7E5DD8: ;$7E5DD8
	.RES 2
UNKNOWN_7E5DDA: ;$7E5DDA
	.RES 2
UNKNOWN_7E5DDC: ;$7E5DDC
	.RES 2
UNKNOWN_7E5DDE: ;$7E5DDE
	.RES 4

.ORG $7E5DEA
QUEUED_INTERACTIONS: ;$7E5DEA
	.RES .SIZEOF(queued_interaction) * 4
CURRENT_QUEUED_INTERACTION: ;$7E5E02
	.RES 2
NEXT_QUEUED_INTERACTION: ;$7E5E04
	.RES 2
UNKNOWN_7E5E06: ;$7E5E06
	.RES 4*12
; An index for the preceding table?
UNKNOWN_7E5E36: ;$7E5E36
	.RES 2
UNKNOWN_7E5E38: ;$7E5E38
	.RES 4
UNKNOWN_7E5E3C: ;$7E5E3C

.ORG $7E5E4A
UNKNOWN_7E5E4A: ;$7E5E4A

.ORG $7E5E58
UNKNOWN_7E5E58: ;$7E5E58

.ORG $7E5E6C
UNKNOWN_7E5E6C: ;$7E5E6C
	.RES 1
UNKNOWN_7E5E6D: ;$7E5E6D
	.RES 1
UNKNOWN_7E5E6E: ;$7E5E6E
	.RES 2
UNKNOWN_7E5E70: ;$7E5E70
	.RES 1
UNKNOWN_7E5E71: ;$7E5E71
	.RES 2
UNKNOWN_7E5E73: ;$7E5E73
	.RES 2
UNKNOWN_7E5E75: ;$7E5E75
	.RES 1
UNKNOWN_7E5E76: ;$7E5E76
	.RES 1
UNKNOWN_7E5E77: ;$7E5E77
	.RES 1
UNKNOWN_7E5E78: ;$7E5E78
	.RES 1
UNKNOWN_7E5E79: ;$7E5E79
	.RES 1
UNKNOWN_7E5E7A: ;$7E5E7A
	.RES 2
UNKNOWN_7E5E7C: ;$7E5E7C
	.RES 2
UNKNOWN_7E5E7E: ;$7E5E7E
	.RES 8 * $3F0
BG2_BUFFER: ;$7E7DFE
	.RES $700

.ORG $7E8272
UNKNOWN_7E8272: ;$7E8272
	.RES 8

;This seems to be a 0x240 byte block of VRAM data
.ORG $7E827E
UNKNOWN_7E827E: ;$7E827E

.ORG $7E847E
UNKNOWN_7E847E: ;$7E847E

.ORG $7E85FE
UNKNOWN_7E85FE: ;$7E85FE
	.RES .SIZEOF(window_stats) * 1
WINDOW_STATS_TABLE: ;$7E8650
	.RES .SIZEOF(window_stats) * 8
WINDOW_HEAD: ;$7E88E0
	.RES 2
WINDOW_TAIL: ;$7E88E2
	.RES 2
WINDOW_EXISTENCE_TABLE: ;$7E88E4
	.RES 53 * 2
UNKNOWN_7E894E: ;$7E894E
	.RES 5 * 2
CURRENT_FOCUS_WINDOW: ;$7E8958
	.RES 2
UNKNOWN_7E895A: ;$7E895A

.ORG $7E895F
UNKNOWN_7E895F: ;$7E895F
	.RES 1
UNKNOWN_7E8960: ;$7E8960
	.RES 1

.ORG $7E8966
HPPP_WINDOW_DIGIT_BUFFER: ;$7E8966
	.RES 3
HPPP_WINDOW_BUFFER: ;$7E8969
	.RES .SIZEOF(hp_pp_window_buffer) * 4
UNKNOWN_7E89C9: ;$7E89C9
	.RES 1
BATTLE_MENU_CURRENT_CHARACTER_ID: ;$7E89CA
	.RES 2
UNKNOWN_7E89CC: ;$7E89CC
	.RES 2
UNKNOWN_7E89CE: ;$7E89CE
	.RES 2
UNKNOWN_7E89D0: ;$7E89D0
	.RES 2
UNKNOWN_7E89D2: ;$7E89D2
	.RES 2
UNKNOWN_7E89D4: ;$7E89D4
	.RES NUM_89D4_ENTRIES*.SIZEOF(u89D4_entry)
UNKNOWN_7E9622: ;$7E9622
	.RES 1
UNKNOWN_7E9623: ;$7E9623
	.RES 1
UNKNOWN_7E9624: ;$7E9624
	.RES 1
SELECTED_TEXT_SPEED: ;$7E9625
	.RES 2
UNKNOWN_7E9627: ;$7E9627
	.RES 2
UNKNOWN_7E9629: ;$7E9629

.ORG $7E9631
; Text pointers?
UNKNOWN_7E9631: ;$7E9631
	.RES 4*4
UNKNOWN_7E9641: ;$7E9641
	.RES 2
BATTLE_MODE_FLAG: ;$7E9643
	.RES 2
INPUT_LOCK_FLAG: ;$7E9645
	.RES 2
UNKNOWN_7E9647: ;$7E9647
	.RES 2
UNKNOWN_7E9649: ;$7E9649
	.RES 2
UNKNOWN_7E964B: ;$7E964B
	.RES 2
BLINKING_TRIANGLE_FLAG: ;$7E964D
	.RES 2
UNKNOWN_7E964F: ;$7E964F
	.RES 2
UNKNOWN_7E9651: ;$7E9651
	.RES 1
UNKNOWN_7E9652: ;$7E9652
	.RES 2
UNKNOWN_7E9654: ;$7E9654

.ORG $7E9658
UNKNOWN_7E9658: ;$7E9658
	.RES 2
UNKNOWN_7E965A: ;$7E965A

.ORG $7E9660
UNKNOWN_7E9660: ;$7E9660
	.RES 2
UNKNOWN_7E9662: ;$7E9662
	.RES 2
UNKNOWN_7E9664: ;$7E9664
	.RES 32
UNKNOWN_7E9684: ;$7E9684
	.RES 2
UNKNOWN_7E9686: ;$7E9686
	.RES 2
UNKNOWN_7E9688: ;$7E9688
	.RES 2
UNKNOWN_7E968A: ;$7E968A
	.RES 2
UNKNOWN_7E968C: ;$7E968C
	.RES 1
UNKNOWN_7E968D: ;$7E968D
	.RES 4
UNKNOWN_7E9691: ;$7E9691
	.RES 4
UNKNOWN_7E9695: ;$7E9695
	.RES 1
UNKNOWN_7E9696: ;$7E9696
	.RES 1
UNKNOWN_7E9697: ;$7E9697
	.RES 1
UNKNOWN_7E9698: ;$7E9698
	.RES 2
UNKNOWN_7E969A: ;$7E969A
	.RES 2*4
UNKNOWN_7E96A2: ;$7E96A2
	.RES 2*4
DISPLAY_TEXT_STATES: ;$7E96AA
	.RES .SIZEOF(display_text_state) * 10
UNKNOWN_7E97B8: ;$7E97B8
	.RES 2
CC_ARGUMENT_STORAGE: ;$7E97BA

.ORG $7E97CA
CC_ARGUMENT_GATHERING_LOOP_COUNTER: ;$7E97CA
	.RES 2
WRAM_SCRIPT_WORK_MEMORY: ;$7E97CC
	.RES 4
WRAM_SCRIPT_ARG_MEMORY: ;$7E97D0
	.RES 4
WRAM_SCRIPT_SEC_MEMORY: ;$7E97D4
	.RES 1
UNKNOWN_7E97D5: ;$7E97D5

.ORG $7E97D7
UNKNOWN_7E97D7: ;$7E97D7

.ORG $7E97DA
UNKNOWN_7E97DA: ;$7E97DA

.ORG $7E97F5
GAME_STATE: ;$7E97F5
	.RES .SIZEOF(game_state)
CHAR_STRUCT: ;$7E99CE
	.RES .SIZEOF(char_struct) * (TOTAL_PARTY_COUNT)
EVENT_FLAG: ;$7E9C08
	.RES (EVENT_FLAG_COUNT/8)
CURRENT_INTERACTING_EVENT_FLAG: ;$7E9C88
	.RES 2
UNKNOWN_7E9C8A: ;$7E9C8A
	.RES .SIZEOF(window_text_attributes_copy)
UNKNOWN_7E9C9F: ;$7E9C9F
	.RES 1 * 49
UNKNOWN_7E9CD0: ;$7E9CD0
	.RES 1
UNKNOWN_7E9CD1: ;$7E9CD1
	.RES 1
UNKNOWN_7E9CD2: ;$7E9CD2
	.RES 1
UNKNOWN_7E9CD3: ;$7E9CD3
	.RES 1
UNKNOWN_7E9CD4: ;$7E9CD4
	.RES 2
UNKNOWN_7E9CD6: ;$7E9CD6
	.RES 1
UNKNOWN_7E9CD7: ;$7E9CD7
	.RES 30
UNKNOWN_7E9CF5: ;$7E9CF5
	.RES 28
UNKNOWN_7E9D11: ;$7E9D11
	.RES 1
UNKNOWN_7E9D12: ;$7E9D12
	.RES 2
UNKNOWN_7E9D14: ;$7E9D14
	.RES 2
UNKNOWN_7E9D16: ;$7E9D16
	.RES 2
UNKNOWN_7E9D18: ;$7E9D18
	.RES 1
UNKNOWN_7E9D19: ;$7E9D19
	.RES 2
UNKNOWN_7E9D1B: ;$7E9D1B
	.RES 2
UNKNOWN_7E9D1D: ;$7E9D1D
	.RES 2
RESPAWN_X: ;$7E9D1F
	.RES 2
RESPAWN_Y: ;$7E9D21
	.RES 2
UNKNOWN_7E9D23: ;$7E9D23
	.RES 32 * 8
UNKNOWN_7E9E23: ;$7E9E23
	.RES 2
UNKNOWN_7E9E25: ;$7E9E25
	.RES 2
UNKNOWN_7E9E27: ;$7E9E27
	.RES 2
UNKNOWN_7E9E29: ;$7E9E29
	.RES 2
DMA_TRANSFER_FLAG: ;$7E9E2B
	.RES 2
ENTITY_PREPARED_X_COORDINATE: ;$7E9E2D
	.RES 2
ENTITY_PREPARED_Y_COORDINATE: ;$7E9E2F
	.RES 2
ENTITY_PREPARED_DIRECTION: ;$7E9E31
	.RES 2
UNKNOWN_7E9E33: ;$7E9E33
	.RES 2
UNKNOWN_7E9E35: ;$7E9E35
	.RES 2
UNKNOWN_7E9E37: ;$7E9E37
	.RES 1
UNKNOWN_7E9E38: ;$7E9E38
	.RES 1
UNKNOWN_7E9E39: ;$7E9E39
	.RES 1
UNKNOWN_7E9E3A: ;$7E9E3A
	.RES 2
OVERWORLD_TASKS: ;$7E9E3C
	.RES 6 * 4
DAD_PHONE_TIMER: ;$7E9E54
	.RES 2
UNKNOWN_7E9E56: ;$7E9E56
	.RES 2
UNKNOWN_7E9E58: ;$7E9E58
	.RES 40*3

.ORG $7E9F18
UNKNOWN_7E9F18: ;$7E9F18
	.RES 2
LOADED_TIMED_ITEM_TRANSFORMATIONS: ;$7E9F1A
	.RES .SIZEOF(loaded_timed_item_transformation) * 4
UNKNOWN_7E9F2A: ;$7E9F2A
	.RES 2
UNKNOWN_7E9F2C: ;$7E9F2C
	.RES 1
UNKNOWN_7E9F2D: ;$7E9F2D
	.RES 2
UNKNOWN_7E9F2F: ;$7E9F2F
	.RES 2
UNKNOWN_7E9F31: ;$7E9F31
	.RES 2
UNKNOWN_7E9F33: ;$7E9F33
	.RES 2
UNKNOWN_7E9F35: ;$7E9F35

.ORG $7E9F39
UNKNOWN_7E9F39: ;$7E9F39
	.RES 2
UNKNOWN_7E9F3B: ;$7E9F3B
	.RES 2
UNKNOWN_7E9F3D: ;$7E9F3D
	.RES 2
TELEPORT_DESTINATION: ;$7E9F3F
	.RES 2
TELEPORT_STYLE: ;$7E9F41
	.RES 2
UNKNOWN_7E9F43: ;$7E9F43
	.RES 2
UNKNOWN_7E9F45: ;$7E9F45
	.RES 2
UNKNOWN_7E9F47: ;$7E9F47
	.RES 2
UNKNOWN_7E9F49: ;$7E9F49
	.RES 4
UNKNOWN_7E9F4D: ;$7E9F4D
	.RES 4
UNKNOWN_7E9F51: ;$7E9F51
	.RES 4
UNKNOWN_7E9F55: ;$7E9F55
	.RES 4
UNKNOWN_7E9F59: ;$7E9F59
	.RES 2
UNKNOWN_7E9F5B: ;$7E9F5B
	.RES 2
UNKNOWN_7E9F5D: ;$7E9F5D
	.RES 2
UNKNOWN_7E9F5F: ;$7E9F5F
	.RES 2
UNKNOWN_7E9F61: ;$7E9F61
	.RES 2
UNKNOWN_7E9F63: ;$7E9F63
	.RES 2
UNKNOWN_7E9F65: ;$7E9F65
	.RES 2
UNKNOWN_7E9F67: ;$7E9F67
	.RES 2
UNKNOWN_7E9F69: ;$7E9F69
	.RES 2
UNKNOWN_7E9F6B: ;$7E9F6B
	.RES 2
UNKNOWN_7E9F6D: ;$7E9F6D
	.RES 2
UNKNOWN_7E9F6F: ;$7E9F6F
	.RES 2
PAJAMA_FLAG: ;$7E9F71
	.RES 2
UNKNOWN_7E9F73: ;$7E9F73
	.RES 2
UNKNOWN_7E9F75: ;$7E9F75
	.RES 2
UNKNOWN_7E9F77: ;$7E9F77
	.RES 2
UNKNOWN_7E9F79: ;$7E9F79
	.RES 1
UNKNOWN_7E9F7A: ;$7E9F7A
	.RES 2
UNKNOWN_7E9F7C: ;$7E9F7C
	.RES 2
UNKNOWN_7E9F7E: ;$7E9F7E
	.RES 2
UNKNOWN_7E9F80: ;$7E9F80
	.RES 2
UNKNOWN_7E9F82: ;$7E9F82
	.RES 2
UNKNOWN_7E9F84: ;$7E9F84
	.RES 2
UNKNOWN_7E9F86: ;$7E9F86
	.RES 2
UNKNOWN_7E9F88: ;$7E9F88
	.RES 2
ENEMIES_IN_BATTLE: ;$7E9F8A
	.RES 2
UNKNOWN_7E9F8C: ;$7E9F8C
	.RES 2 * 16
BATTLERS_TABLE: ;$7E9FAC
	.RES .SIZEOF(battler) * BATTLER_COUNT
BATTLER_TARGET_FLAGS: ;$7EA96C
	.RES 4
CURRENT_ATTACKER: ;$7EA970
	.RES 2
CURRENT_TARGET: ;$7EA972
	.RES 2
BATTLE_EXP_SCRATCH: ;$7EA974
	.RES 4
BATTLE_MONEY_SCRATCH: ;$7EA978
	.RES 2
GIYGAS_PHASE: ;$7EA97A
	.RES 2
UNKNOWN_7EA97C: ;$7EA97C
	.RES 1
UNKNOWN_7EA97D: ;$7EA97D
	.RES .SIZEOF(unknown_A97D)
ATTACKER_NAME_ADJUST_SCRATCH: ;$7EA983
	.RES 27
TARGET_NAME_ADJUST_SCRATCH: ;$7EA99E
	.RES 27
UNKNOWN_7EA9B9: ;$7EA9B9
	.RES 27
UNKNOWN_7EA9D4: ;$7EA9D4

.ORG $7EAA0C
UNKNOWN_7EAA0C: ;$7EAA0C
	.RES 2
UNKNOWN_7EAA0E: ;$7EAA0E
	.RES 2
ITEM_DROPPED: ;$7EAA10
	.RES 2
MIRROR_ENEMY: ;$7EAA12
	.RES 2
UNKNOWN_7EAA14: ;$7EAA14
	.RES .SIZEOF(battler)
MIRROR_TURN_TIMER: ;$7EAA64
	.RES 2
UNKNOWN_7EAA66: ;$7EAA66
	.RES 2 * 6
UNKNOWN_7EAA70: ;$7EAA70
	.RES 2
UNKNOWN_7EAA72: ;$7EAA72
	.RES 2
UNKNOWN_7EAA74: ;$7EAA74
	.RES 2
UNKNOWN_7EAA76: ;$7EAA76
	.RES 2 * 4
UNKNOWN_7EAA7E: ;$7EAA7E
	.RES 2 * 4
UNKNOWN_7EAA86: ;$7EAA86
	.RES 2 * 4
UNKNOWN_7EAA8E: ;$7EAA8E
	.RES 2
UNKNOWN_7EAA90: ;$7EAA90
	.RES 2
UNKNOWN_7EAA92: ;$7EAA92
	.RES 2
UNKNOWN_7EAA94: ;$7EAA94
	.RES 2
UNKNOWN_7EAA96: ;$7EAA96
	.RES 2
UNKNOWN_7EAA98: ;$7EAA98
	.RES 26
UNKNOWN_7EAAB2: ;$7EAAB2
	.RES 2
UNKNOWN_7EAAB4: ;$7EAAB4
	.RES 2
UNKNOWN_7EAAB6: ;$7EAAB6
	.RES 8
UNKNOWN_7EAABE: ;$7EAABE
	.RES 8
UNKNOWN_7EAAC6: ;$7EAAC6
	.RES 8
UNKNOWN_7EAACE: ;$7EAACE
	.RES 8
UNKNOWN_7EAAD6: ;$7EAAD6
	.RES 80 * 4
UNKNOWN_7EAC16: ;$7EAC16
	.RES 80 * 4
UNKNOWN_7EAD56: ;$7EAD56
	.RES 2
UNKNOWN_7EAD58: ;$7EAD58
	.RES 2
UNKNOWN_7EAD5A: ;$7EAD5A
	.RES 8
UNKNOWN_7EAD62: ;$7EAD62
	.RES 8
UNKNOWN_7EAD6A: ;$7EAD6A
	.RES 8
UNKNOWN_7EAD72: ;$7EAD72
	.RES 8
UNKNOWN_7EAD7A: ;$7EAD7A
	.RES 8
UNKNOWN_7EAD82: ;$7EAD82
	.RES 1 * 4
UNKNOWN_7EAD86: ;$7EAD86

.ORG $7EAD8A
UNKNOWN_7EAD8A: ;$7EAD8A
	.RES 2
VERTICAL_SHAKE_DURATION: ;$7EAD8C
	.RES 2
VERTICAL_SHAKE_HOLD_DURATION: ;$7EAD8E
	.RES 2
UNKNOWN_7EAD90: ;$7EAD90
	.RES 2
WOBBLE_DURATION: ;$7EAD92
	.RES 2
SHAKE_DURATION: ;$7EAD94
	.RES 2
UNKNOWN_7EAD96: ;$7EAD96
	.RES 2
UNKNOWN_7EAD98: ;$7EAD98
	.RES 2
UNKNOWN_7EAD9A: ;$7EAD9A
	.RES 2
UNKNOWN_7EAD9C: ;$7EAD9C
	.RES 2
GREEN_FLASH_DURATION: ;$7EAD9E
	.RES 2
RED_FLASH_DURATION: ;$7EADA0
	.RES 2
UNKNOWN_7EADA2: ;$7EADA2
	.RES 2
HP_PP_BOX_BLINK_DURATION: ;$7EADA4
	.RES 2
HP_PP_BOX_BLINK_TARGET: ;$7EADA6
	.RES 2
UNKNOWN_7EADA8: ;$7EADA8
	.RES 2
UNKNOWN_7EADAA: ;$7EADAA
	.RES 2
UNKNOWN_7EADAC: ;$7EADAC
	.RES 2
UNKNOWN_7EADAE: ;$7EADAE
	.RES 2
UNKNOWN_7EADB0: ;$7EADB0
	.RES 2
UNKNOWN_7EADB2: ;$7EADB2
	.RES 2
UNKNOWN_7EADB4: ;$7EADB4
	.RES 2
UNKNOWN_7EADB6: ;$7EADB6
	.RES 2
UNKNOWN_7EADB8: ;$7EADB8

.ORG $7EADCC
UNKNOWN_7EADCC: ;$7EADCC
	.RES 2
UNKNOWN_7EADCE: ;$7EADCE
	.RES 2
UNKNOWN_7EADD0: ;$7EADD0
	.RES 2
UNKNOWN_7EADD2: ;$7EADD2
	.RES 2
LOADED_BG_DATA_LAYER1: ;$7EADD4
	.RES .SIZEOF(loaded_bg_data)
LOADED_BG_DATA_LAYER2: ;$7EAE4B
	.RES .SIZEOF(loaded_bg_data)
UNKNOWN_7EAEC2: ;$7EAEC2
	.RES 1
UNKNOWN_7EAEC3: ;$7EAEC3
	.RES 1
UNKNOWN_7EAEC4: ;$7EAEC4
	.RES 1
UNKNOWN_7EAEC5: ;$7EAEC5
	.RES 1
UNKNOWN_7EAEC6: ;$7EAEC6
	.RES 1
UNKNOWN_7EAEC7: ;$7EAEC7
	.RES 1
UNKNOWN_7EAEC8: ;$7EAEC8
	.RES 1
UNKNOWN_7EAEC9: ;$7EAEC9
	.RES 1
UNKNOWN_7EAECA: ;$7EAECA
	.RES 1
UNKNOWN_7EAECB: ;$7EAECB
	.RES 1
UNKNOWN_7EAECC: ;$7EAECC
	.RES 4
UNKNOWN_7EAED0: ;$7EAED0
	.RES 2
UNKNOWN_7EAED2: ;$7EAED2
	.RES 2
UNKNOWN_7EAED4: ;$7EAED4
	.RES 2
UNKNOWN_7EAED6: ;$7EAED6
	.RES 2
UNKNOWN_7EAED8: ;$7EAED8
	.RES 2
UNKNOWN_7EAEDA: ;$7EAEDA
	.RES 2
UNKNOWN_7EAEDC: ;$7EAEDC
	.RES 2
UNKNOWN_7EAEDE: ;$7EAEDE
	.RES 2
UNKNOWN_7EAEE0: ;$7EAEE0
	.RES 2
UNKNOWN_7EAEE2: ;$7EAEE2
	.RES 2
UNKNOWN_7EAEE4: ;$7EAEE4
	.RES 1
UNKNOWN_7EAEE5: ;$7EAEE5
	.RES 1
UNKNOWN_7EAEE6: ;$7EAEE6
	.RES 1
UNKNOWN_7EAEE7: ;$7EAEE7
	.RES 2 * 4
UNKNOWN_7EAEEF: ;$7EAEEF
	.RES 1
UNKNOWN_7EAEF0: ;$7EAEF0
	.RES 2
UNKNOWN_7EAEF2: ;$7EAEF2
	.RES 2
; UNKNOWN_7EB37C is used as an index for this.
UNKNOWN_7EAEF4: ;$7EAEF4
	.RES 2 * 4
UNKNOWN_7EAEFC: ;$7EAEFC

;Unknown... seems to be 64 6 byte entries, but I have no idea where the starting points are or what this data is
.ORG $7EAEFE
UNKNOWN_7EAEFE: ;$7EAEFE
	.RES 2
UNKNOWN_7EAF00: ;$7EAF00
	.RES 2
UNKNOWN_7EAF02: ;$7EAF02
	.RES 384
UNKNOWN_7EB082: ;$7EB082
	.RES 380
UNKNOWN_7EB1FE: ;$7EB1FE
	.RES 2
UNKNOWN_7EB200: ;$7EB200
	.RES 2
UNKNOWN_7EB202: ;$7EB202
	.RES 384

.ORG $7EB37C
;Used for 7EAEF4 table, apparently
UNKNOWN_7EB37C: ;$7EB37C
	.RES 2
UNKNOWN_7EB37E: ;$7EB37E
	.RES 2
UNKNOWN_7EB380: ;$7EB380
	.RES 2
UNKNOWN_7EB382: ;$7EB382
	.RES 2
UNKNOWN_7EB384: ;$7EB384
	.RES 2
UNKNOWN_7EB386: ;$7EB386
	.RES 2
UNKNOWN_7EB388: ;$7EB388
	.RES 2

.ORG $7EB3EE
UNKNOWN_7EB3EE: ;$7EB3EE
	.RES 1
UNKNOWN_7EB3EF: ;$7EB3EF
	.RES 1
UNKNOWN_7EB3F0: ;$7EB3F0
	.RES 1
UNKNOWN_7EB3F1: ;$7EB3F1
	.RES 1
UNKNOWN_7EB3F2: ;$7EB3F2
	.RES 1
UNKNOWN_7EB3F3: ;$7EB3F3
	.RES 1
UNKNOWN_7EB3F4: ;$7EB3F4
	.RES 1
UNKNOWN_7EB3F5: ;$7EB3F5
	.RES 1
UNKNOWN_7EB3F6: ;$7EB3F6
	.RES 1
UNKNOWN_7EB3F7: ;$7EB3F7
	.RES 1
UNKNOWN_7EB3F8: ;$7EB3F8
	.RES 2
UNKNOWN_7EB3FA: ;$7EB3FA
	.RES 2
UNKNOWN_7EB3FC: ;$7EB3FC
	.RES 2
UNKNOWN_7EB3FE: ;$7EB3FE
	.RES 2
UNKNOWN_7EB400: ;$7EB400
	.RES 2
UNKNOWN_7EB402: ;$7EB402
	.RES 2
UNKNOWN_7EB404: ;$7EB404
	.RES 2
UNKNOWN_7EB406: ;$7EB406
	.RES 2
UNKNOWN_7EB408: ;$7EB408
	.RES 2
UNKNOWN_7EB40A: ;$7EB40A
	.RES 2
UNKNOWN_7EB40C: ;$7EB40C
	.RES 2
UNKNOWN_7EB40E: ;$7EB40E
	.RES 2
UNKNOWN_7EB410: ;$7EB410
	.RES 2
UNKNOWN_7EB412: ;$7EB412
	.RES 2
UNKNOWN_7EB414: ;$7EB414
	.RES 2
UNKNOWN_7EB416: ;$7EB416
	.RES 2
UNKNOWN_7EB418: ;$7EB418
	.RES 2
UNKNOWN_7EB41A: ;$7EB41A
	.RES 2
UNKNOWN_7EB41C: ;$7EB41C
	.RES 2
UNKNOWN_7EB41E: ;$7EB41E
	.RES 2
UNKNOWN_7EB420: ;$7EB420
	.RES 2
UNKNOWN_7EB422: ;$7EB422
	.RES 2
UNKNOWN_7EB424: ;$7EB424
	.RES 2
UNKNOWN_7EB426: ;$7EB426
	.RES 2
UNKNOWN_7EB428: ;$7EB428
	.RES 2
UNKNOWN_7EB42A: ;$7EB42A
	.RES 2
UNKNOWN_7EB42C: ;$7EB42C
	.RES 2
UNKNOWN_7EB42E: ;$7EB42E
	.RES 2
UNKNOWN_7EB430: ;$7EB430
	.RES 2
UNKNOWN_7EB432: ;$7EB432
	.RES 2
UNKNOWN_7EB434: ;$7EB434
	.RES 2
UNKNOWN_7EB436: ;$7EB436
	.RES 2
UNKNOWN_7EB438: ;$7EB438
	.RES 2
UNKNOWN_7EB43A: ;$7EB43A
	.RES 2
UNKNOWN_7EB43C: ;$7EB43C

.ORG $7EB49D
UNKNOWN_7EB49D: ;$7EB49D
	.RES 1
UNKNOWN_7EB49E: ;$7EB49E

.ORG $7EB4A1
CURRENT_SAVE_SLOT: ;$7EB4A1
	.RES 1
UNKNOWN_7EB4A2: ;$7EB4A2
	.RES 2
UNKNOWN_7EB4A4: ;$7EB4A4
	.RES 2
UNKNOWN_7EB4A6: ;$7EB4A6
	.RES 2
UNKNOWN_7EB4A8: ;$7EB4A8
	.RES 2
UNKNOWN_7EB4AA: ;$7EB4AA
	.RES 2
UNKNOWN_7EB4AC: ;$7EB4AC
	.RES 2
UNKNOWN_7EB4AE: ;$7EB4AE
	.RES 2
UNKNOWN_7EB4B0: ;$7EB4B0
	.RES 2
UNKNOWN_7EB4B2: ;$7EB4B2
	.RES 2
UNKNOWN_7EB4B4: ;$7EB4B4
	.RES 2
UNKNOWN_7EB4B6: ;$7EB4B6
	.RES 2
UNKNOWN_7EB4B8: ;$7EB4B8
	.RES 2
UNKNOWN_7EB4BA: ;$7EB4BA
	.RES 2
UNKNOWN_7EB4BC: ;$7EB4BC
	.RES 2
UNKNOWN_7EB4BE: ;$7EB4BE

.ORG $7EB4CE
UNKNOWN_7EB4CE: ;$7EB4CE
	.RES 1
UNKNOWN_7EB4CF: ;$7EB4CF
	.RES 2
UNKNOWN_7EB4D1: ;$7EB4D1
	.RES 2
UNKNOWN_7EB4D3: ;$7EB4D3
	.RES 2
UNKNOWN_7EB4D5: ;$7EB4D5

.ORG $7EB4DD
UNKNOWN_7EB4DD: ;$7EB4DD

.ORG $7EB4E3
UNKNOWN_7EB4E3: ;$7EB4E3
	.RES 2
UNKNOWN_7EB4E5: ;$7EB4E5
	.RES 2
UNKNOWN_7EB4E7: ;$7EB4E7
	.RES 4
UNKNOWN_7EB4EB: ;$7EB4EB
	.RES 4
UNKNOWN_7EB4EF: ;$7EB4EF
	.RES 2
CUR_PHOTO_DISPLAY: ;$7EB4F1
	.RES 2
UNKNOWN_7EB4F3: ;$7EB4F3
	.RES 2
UNKNOWN_7EB4F5: ;$7EB4F5
	.RES 2
UNKNOWN_7EB4F7: ;$7EB4F7
	.RES 2
UNKNOWN_7EB4F9: ;$7EB4F9

.ORG $7EB511
UNKNOWN_7EB511: ;$7EB511

.ORG $7EB525
UNKNOWN_7EB525: ;$7EB525

.ORG $7EB539
PIRACY_FLAG: ;$7EB539
	.RES 2

; Audio stuff
CURRENT_MUSIC_TRACK: ;$7EB53B
	.RES 2
CURRENT_PRIMARY_SAMPLE_PACK: ;$7EB53D
	.RES 2
CURRENT_SECONDARY_SAMPLE_PACK: ;$7EB53F
	.RES 2
CURRENT_SEQUENCE_PACK: ;$7EB541
	.RES 2

UNKNOWN_7EB543: ;$7EB543
	.RES 2
UNKNOWN_7EB545: ;$7EB545
	.RES 2
UNKNOWN_7EB547: ;$7EB547
	.RES 2
SECTOR_BOUNDARY_BEHAVIOUR_FLAG: ;$7EB549
	.RES 2
UNKNOWN_7EB54B: ;$7EB54B
	.RES 2
UNKNOWN_7EB54D: ;$7EB54D
	.RES 2
UNKNOWN_7EB54F: ;$7EB54F
	.RES 2
UNKNOWN_7EB551: ;$7EB551
	.RES 2
UNKNOWN_7EB553: ;$7EB553
	.RES 2
DEBUG_MENU_CURSOR_POSITION: ;$7EB555
	.RES 2
UNKNOWN_7EB557: ;$7EB557
	.RES 2
DEBUG_MODE_NUMBER: ;$7EB559

.ORG $7EB55D
UNKNOWN_7EB55D: ;$7EB55D
	.RES 2
UNKNOWN_7EB55F: ;$7EB55F
	.RES 2
DEBUG_START_POSITION_X: ;$7EB561
	.RES 2
DEBUG_START_POSITION_Y: ;$7EB563
	.RES 2
; A sprite ID?
DEBUG_UNKNOWN_B565: ;$7EB565
	.RES 2
UNKNOWN_7EB567: ;$7EB567
	.RES 2
UNKNOWN_7EB569: ;$7EB569
	.RES 2
UNKNOWN_7EB56B: ;$7EB56B
	.RES 2
UNKNOWN_7EB56D: ;$7EB56D
	.RES 2
UNKNOWN_7EB56F: ;$7EB56F
	.RES 2
UNKNOWN_7EB571: ;$7EB571
	.RES 2
UNKNOWN_7EB573: ;$7EB573
	.RES 2
UNKNOWN_7EB575: ;$7EB575

.ORG $7EB800
UNKNOWN_7EB800: ;$7EB800

.ORG $7EC000
UNKNOWN_7EC000: ;$7EC000

.ORG $7EE000
UNKNOWN_7EE000: ;$7EE000
	.RES 64 * 64

.ORG $7EF200
UNKNOWN_7EF200: ;$7EF200

; Memory bank 2

.ORG $7F0000
UNKNOWN_7F0000: ;$7F0000
	.RES $40
UNKNOWN_7F0040: ;$7F0040
	.RES $30
UNKNOWN_7F0070: ;$7F0070
	.RES $90
UNKNOWN_7F0100: ;$7F0100
	.RES $100
UNKNOWN_7F0200: ;$7F0200
	.RES $200
UNKNOWN_7F0400: ;$7F0400
	.RES $F0
UNKNOWN_7F04F0: ;$7F04F0
	.RES $100
UNKNOWN_7F05F0: ;$7F05F0
	.RES $10
UNKNOWN_7F0600: ;$7F0600
	.RES $100
UNKNOWN_7F0700: ;$7F0700
	.RES $100
UNKNOWN_7F0800: ;$7F0800
	.RES $40
UNKNOWN_7F0840: ;$7F0840
	.RES $C0
UNKNOWN_7F0900: ;$7F0900
	.RES $100
UNKNOWN_7F0A00: ;$7F0A00
	.RES $200
UNKNOWN_7F0C00: ;$7F0C00
	.RES $400
UNKNOWN_7F1000: ;$7F1000
	.RES $1000
UNKNOWN_7F2000: ;$7F2000
	.RES $A00
UNKNOWN_7F2A00: ;$7F2A00
	.RES $200
UNKNOWN_7F2C00: ;$7F2C00
	.RES $400
UNKNOWN_7F3000: ;$7F3000
	.RES $200
UNKNOWN_7F3200: ;$7F3200
	.RES $E00
UNKNOWN_7F4000: ;$7F4000
	.RES $3000
UNKNOWN_7F7000: ;$7F7000
	.RES $800
UNKNOWN_7F7800: ;$7F7800
	.RES $400
UNKNOWN_7F7C00: ;$7F7C00
	.RES $100
UNKNOWN_7F7D00: ;$7F7D00
	.RES $100
UNKNOWN_7F7E00: ;$7F7E00
	.RES $100
UNKNOWN_7F7F00: ;$7F7F00
	.RES $100
UNKNOWN_7F8000: ;$7F8000
	.RES $7800
TILE_COLLISION_BUFFER: ;$7FF800
	.RES $800

.ORG $7E8000
INTRO_BG2_BUFFER:
