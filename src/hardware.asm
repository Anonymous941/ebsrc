
.ENUM PROC_FLAGS
	CARRY = 1
	ZERO = 2
	INTERRUPT_DISABLE = 4
	DECIMAL = 8
	INDEX8 = 16
	ACCUM8 = 32
	OVERFLOW = 64
	NEGATIVE = 128
.ENDENUM

.ENUM DMA_CHANNELS
	CHANNEL_0 = 1
	CHANNEL_1 = 2
	CHANNEL_2 = 4
	CHANNEL_3 = 8
	CHANNEL_4 = 16
	CHANNEL_5 = 32
	CHANNEL_6 = 64
	CHANNEL_7 = 128
.ENDENUM

.ENUM DMAP
	UNUSED = 32
	INDIRECT_ADDRESSING = 64
	DIRECT_ADDRESSING = 0
	IO_TO_CPU = 128
	CPU_TO_IO = 0
.ENDENUM

.ENUM DMA_ADDRESS_STEP
	INCREMENT = 0
	FIXED = 1
	DECREMENT = 2
	FIXED2 = 3 ;Same as FIXED?
.ENDENUM

.ENUM DMA_TRANSFER_UNIT
	BYTE = 0
	WORD = 1
	BYTE_TWICE = 2
	WORD_TWICE_INTERLACED = 3
	INT = 4
	WORD_TWICE = 5
	WORD_COPY = 6
	WORD_TWICE_INTERLACED_COPY = 7
.ENDENUM

.ENUM BG_TILEMAP_SIZE
	NORMAL = 0
	HORIZONTAL = 1
	VERTICAL = 2
	BOTH = 3
.ENDENUM

.ENUM BGR555
	RED = $1F
	GREEN = $3E0
	BLUE = $7C00
.ENDENUM

; SNES registers
.DEFINE INIDISP $2100
.DEFINE OBSEL $2101
.DEFINE OAMADDL$2102
.DEFINE OAMADDH $2103
.DEFINE BGMODE $2105
.DEFINE MOSAIC $2106
.DEFINE BG1SC $2107
.DEFINE BG2SC $2108
.DEFINE BG3SC $2109
.DEFINE BG4SC $210A
.DEFINE BG12NBA $210B
.DEFINE BG34NBA $210C
.DEFINE BG1HOFS $210D
.DEFINE BG1VOFS $210E
.DEFINE BG2HOFS $210F
.DEFINE BG2VOFS $2110
.DEFINE BG3HOFS $2111
.DEFINE BG3VOFS $2112
.DEFINE BG4HOFS $2113
.DEFINE BG4VOFS $2114
.DEFINE VMAIN $2115
.DEFINE VMADDL $2116
.DEFINE VMADDH $2117
.DEFINE M7SEL $211A
.DEFINE M7A $211B
.DEFINE M7B $211C
.DEFINE M7C $211D
.DEFINE M7D $211E
.DEFINE M7X $211F
.DEFINE M7Y $2120
.DEFINE CGADD $2121
.DEFINE W12SEL $2123
.DEFINE W34SEL $2124
.DEFINE WOBJSEL $2125
.DEFINE WH0 $2126
.DEFINE WH1 $2127
.DEFINE WH2 $2128
.DEFINE WH3 $2129
.DEFINE WBGLOG $212A
.DEFINE WOBJLOG $212B
.DEFINE TM $212C
.DEFINE TD $212D
.DEFINE TMW $212E
.DEFINE TSW $212F
.DEFINE CGWSEL $2130
.DEFINE CGADSUB $2131
.DEFINE FIXED_COLOR_DATA $2132
.DEFINE SETINI $2133
.DEFINE MPYM $2135
.DEFINE STAT78 $213F
.DEFINE APUIO0 $2140
.DEFINE APUIO1 $2141
.DEFINE APUIO2 $2142
.DEFINE APUIO3 $2143
.DEFINE WMDATA $2180
.DEFINE NMITIMEN $4200
.DEFINE PROGRAMMABLE_I_O_PORT_OUTPUT $4201
.DEFINE WRMPYA $4202
.DEFINE WRMPYB $4203
.DEFINE WRDIVL $4204
.DEFINE WRDIVH $4205
.DEFINE WRDIVB $4206
.DEFINE HTIMEL $4207
.DEFINE HTIMEH $4208
.DEFINE VTIMEL $4209
.DEFINE VTIMEH $420A
.DEFINE MDMAEN $420B
.DEFINE HDMAEN $420C
.DEFINE MEMSEL $420D
.DEFINE RDNMI $4210
.DEFINE TIMEUP $4211
.DEFINE HVBJOY $4212
.DEFINE RDDIVL $4214
.DEFINE RDMPYL $4216
.DEFINE JOYPAD_1_DATA $4218
.DEFINE JOYPAD_1_DATA_LOW_BYTE $4218
.DEFINE JOYPAD_1_DATA_HIGH_BYTE $4219
.DEFINE JOYPAD_2_DATA $421A
.DEFINE JOYPAD_2_DATA_LOW_BYTE $421A
.DEFINE JOYPAD_2_DATA_HIGH_BYTE $421B
.DEFINE JOYPAD_4_DATA $421E
.DEFINE JOYPAD_4_DATA_LOW_BYTE $421E
.DEFINE JOYPAD_4_DATA_HIGH_BYTE $421F
.DEFINE DMAP0 $4300
.DEFINE BBAD0 $4301
.DEFINE A1T0L $4302
.DEFINE A1T0H $4303
.DEFINE A1B0 $4304
.DEFINE DAS0L $4305
.DEFINE DAS0H $4306
.DEFINE DASB0 $4307
.DEFINE NTRL0 $430A
.DEFINE DMAP1 $4310
.DEFINE BBAD1 $4311
.DEFINE A1T1L $4312
.DEFINE A1T1H $4313
.DEFINE A1B1 $4314
.DEFINE DAS1L $4315
.DEFINE DAS1H $4316
.DEFINE DASB1 $4317
.DEFINE NTRL1 $431A
.DEFINE DMAP2 $4320
.DEFINE BBAD2 $4321
.DEFINE A1T2L $4322
.DEFINE A1T2H $4323
.DEFINE A1B2 $4324
.DEFINE DAS2L $4325
.DEFINE DAS2H $4326
.DEFINE DASB2 $4327
.DEFINE NTRL2 $432A
.DEFINE DMAP3 $4330
.DEFINE BBAD3 $4331
.DEFINE A1T3L $4332
.DEFINE A1T3H $4333
.DEFINE A1B3 $4334
.DEFINE DAS3L $4335
.DEFINE DAS3H $4336
.DEFINE DASB3 $4337
.DEFINE NTRL3 $433A
.DEFINE DMAP4 $4340
.DEFINE BBAD4 $4341
.DEFINE A1T4L $4342
.DEFINE A1T4H $4343
.DEFINE A1B4 $4344
.DEFINE DAS4L $4345
.DEFINE DAS4H $4346
.DEFINE DASB4 $4347
.DEFINE NTRL4 $434A
.DEFINE DMAP5 $4350
.DEFINE BBAD5 $4351
.DEFINE A1T5L $4352
.DEFINE A1T5H $4353
.DEFINE A1B5 $4354
.DEFINE DAS5L $4355
.DEFINE DAS5H $4356
.DEFINE DASB5 $4357
.DEFINE NTRL5 $435A
.DEFINE DMA_4_PARAMS $4340
.DEFINE DMA_4_B_ADDRESS $4341
.DEFINE DMA_4_A_ADDRESS_LOW_BYTE $4342
.DEFINE DMA_4_A_ADDRESS_HIGH_BYTE $4343
.DEFINE DMA_4_A_ADDRESS_BANK $4344
.DEFINE DMA_4_BYTES_COUNT_LOW_BYTE $4345
.DEFINE DMA_4_BYTES_COUNT_HIGH_BYTE $4346
.DEFINE DMA_5_PARAMS $4350
.DEFINE DMA_5_B_ADDRESS $4351
.DEFINE DMA_5_A_ADDRESS_LOW_BYTE $4352
.DEFINE DMA_5_A_ADDRESS_BANK $4354
.DEFINE DMA_5_BYTES_COUNT_LOW_BYTE $4355
.DEFINE DMA_6_PARAMS $4360
.DEFINE DMA_6_B_ADDRESS $4361
.DEFINE DMA_6_A_ADDRESS_LOW_BYTE $4362
.DEFINE DMA_6_A_ADDRESS_HIGH_BYTE $4363
.DEFINE DMA_6_A_ADDRESS_BANK $4364
.DEFINE DMA_6_BYTES_COUNT_LOW_BYTE $4365
.DEFINE DMA_6_BYTES_COUNT_HIGH_BYTE $4366
.DEFINE DMA_5_A_ADDRESS_HIGH_BYTE $4353
.DEFINE DMA_5_BYTES_COUNT_HIGH_BYTE $4356
.DEFINE PRODUCT_REMAINDER_RESULT_LOW_BYTE $4216
.DEFINE DATA_FOR_VRAM_WRITE_LOW_BYTE $2118
.DEFINE QUOTIENT_OF_DIVIDE_RESULT_LOW_BYTE $4214
