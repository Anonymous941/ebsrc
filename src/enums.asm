.INCLUDE "constants/music.asm"
.INCLUDE "constants/sfx.asm"
.INCLUDE "constants/enemies.asm"
.INCLUDE "constants/battle.asm"
.INCLUDE "constants/event_flags.asm"

.DEFINE NULL 0

.DEFINE OUT_OF_BATTLE 0
.DEFINE IN_BATTLE 1

.DEFINE CHARACTER_NESS 0
.DEFINE CHARACTER_PAULA 1
.DEFINE CHARACTER_JEFF 2
.DEFINE CHARACTER_POO 3

.DEFINE NUM_ENEMIES 231

.DEFINE EVENT_FLAG_COUNT 1024

.DEFINE COLOUR_SIZE 2
.DEFINE PALETTE_SIZE COLOUR_SIZE * 16

.DEFINE SAVE_COUNT 3
.DEFINE SAVE_COPY_COUNT 2

.DEFINE TEXT_SPEED_STRING_LENGTH 7
.DEFINE SOUND_SETTING_STRING_LENGTH 7
.DEFINE NAME_THEM_STRING_LENGTH 40

.DEFINE THINGS_NAMED_COUNT 7

.DEFINE NUM_89D4_ENTRIES 70

.ENUM WALKING_STYLE
	NORMAL = 0
	BICYCLE = 3
	GHOST = 4
	SLOWER = 6
	LADDER = 7
	ROPE = 8
	SLOWEST = 10
	ESCALATOR = 12
	STAIRS = 13
.ENDENUM

.ENUM DIRECTION
	UP = 0
	UP_RIGHT = 1
	RIGHT = 2
	DOWN_RIGHT = 3
	DOWN = 4
	DOWN_LEFT = 5
	LEFT = 6
	UP_LEFT = 7
.ENDENUM

.ENUM CC_DIRECTION
	USE_VAR = 0
	UNDEFINED = 0
	UP = DIRECTION::UP+1
	UP_RIGHT = DIRECTION::UP_RIGHT+1
	RIGHT = DIRECTION::RIGHT+1
	DOWN_RIGHT = DIRECTION::DOWN_RIGHT+1
	DOWN = DIRECTION::DOWN+1
	DOWN_LEFT = DIRECTION::DOWN_LEFT+1
	LEFT = DIRECTION::LEFT+1
	UP_LEFT = DIRECTION::UP_LEFT+1
.ENDENUM

.ENUM WARP_STYLE
	INSTANT_PLUS_FADE = 0
	STANDARD_DOOR = 1
	STANDARD_DOOR_WHITE = 2
	STANDARD_DOOR2 = 3
	STANDARD_DOOR_WITH_SOUND = 4
	HOLE = 5
	STANDARD_DOOR3 = 6
	STANDARD_DOOR_WITH_SOUND2 = 7
	STANDARD_DOOR_WITH_SOUND3 = 8
	STANDARD_DOOR_WITH_SOUND4 = 9
	STANDARD_DOOR4 = 10
	UNKNOWN = 11
	STANDARD_DOOR5 = 12
	STANDARD_DOOR6 = 13
	STANDARD_DOOR_WHITE2 = 14
	STANDARD_DOOR_WITH_UNKNOWN_SOUND = 15
	PHASE_DISTORTER_III = 16
	MOONSIDE1 = 17
	MOONSIDE2 = 18
	MOONSIDE3 = 19
	MOONSIDE4 = 20
	MOONSIDE5 = 21
	MOONSIDE6 = 22
	MOONSIDE7 = 23
	MOONSIDE8 = 24
	MOONSIDE9 = 25
	MOONSIDE10 = 26
	MOONSIDE11 = 27
	STANDARD_DOOR7 = 28
	STANDARD_DOOR_WHITE_SLOW = 29
	STANDARD_DOOR_WHITE_SLOW_SOUND = 30
	GHOST_TUNNEL = 31
	GHOST_TUNNEL2 = 32
	HOLE2 = 33
.ENDENUM

.ENUM PAD
	B_BUTTON = $8000
	Y_BUTTON = $4000
	SELECT_BUTTON = $2000
	START_BUTTON = $1000
	UP = $800
	DOWN = $400
	LEFT = $200
	RIGHT = $100
	A_BUTTON = $80
	X_BUTTON = $40
	L_BUTTON = $20
	R_BUTTON = $10
.ENDENUM

.ENUM BATTLE_SPRITE_SIZE
	_32X32 = 1
	_64X32 = 2
	_32X64 = 3
	_64X64 = 4
	_128X64 = 5
	_128X128 = 6
.ENDENUM

.ENUM TELEPORT_STYLE
	NONE = 0
	PSI_ALPHA = 1
	PSI_BETA = 2
	INSTANT = 3
	PSI_BETTER = 4
	UNKNOWN = 5
.ENDENUM

.ENUM FILE_MENU_NEW_GAME_NAME
	CHAR_1 = 0
	CHAR_2 = 1
	CHAR_3 = 2
	CHAR_4 = 3
	DOG = 4
	FAVORITE_FOOD = 5
	FAVORITE_THING = 6
.ENDENUM

.ENUM NPC_TYPE
	PERSON = 1
	ITEM_BOX = 2
	OBJECT = 3
.ENDENUM
