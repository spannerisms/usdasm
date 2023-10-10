org $198000

;===================================================================================================

SPC_ENGINE          = $0800
SFX_DATA            = $17C0
SAMPLE_POINTERS     = $3C00
INSTRUMENT_DATA     = $3D00
INSTRUMENT_DATA_SFX = $3E00
SAMPLE_DATA         = $4000
SONG_POINTERS       = $D000
SONG_POINTERS_AUX   = $2B00
CREDITS_AUX_POINTER = $2900

;===================================================================================================

SamplePointers:
#_198000: dw $0070, SAMPLE_POINTERS ; Transfer size, transfer address

base SAMPLE_POINTERS

#_198004: #_3C00: dw $4000, $4012 ; 0x00 - Noise
#_198008: #_3C04: dw $4048, $4063 ; 0x01 - Rain
#_19800C: #_3C08: dw $47F2, $5395 ; 0x02 - Timpani
#_198010: #_3C0C: dw $5395, $53B0 ; 0x03 - Square wave
#_198014: #_3C10: dw $53D4, $53EF ; 0x04 - Saw wave
#_198018: #_3C14: dw $5413, $542E ; 0x05 - Clink
#_19801C: #_3C18: dw $5476, $54A3 ; 0x06 - Wobbly lead
#_198020: #_3C1C: dw $550F, $5521 ; 0x07 - Compound saw
#_198024: #_3C20: dw $55B1, $5B2D ; 0x08 - Tweet
#_198028: #_3C24: dw $5B2D, $60BB ; 0x09 - Strings A
#_19802C: #_3C28: dw $5B2D, $60BB ; 0x0A - Strings B
#_198030: #_3C2C: dw $68AD, $6C9D ; 0x0B - Trombone
#_198034: #_3C30: dw $6CD3, $7A65 ; 0x0C - Cymbal
#_198038: #_3C34: dw $7A65, $7BFA ; 0x0D - Ocarina
#_19803C: #_3C38: dw $7C03, $7C78 ; 0x0E - Chimes
#_198040: #_3C3C: dw $7CDB, $7EA6 ; 0x0F - Harp
#_198044: #_3C40: dw $7EC1, $867D ; 0x10 - Splash
#_198048: #_3C44: dw $867D, $8D6A ; 0x11 - Trumpet
#_19804C: #_3C48: dw $8D85, $944E ; 0x12 - Horn
#_198050: #_3C4C: dw $948D, $A1BC ; 0x13 - Snare A
#_198054: #_3C50: dw $948D, $A1BC ; 0x14 - Snare B
#_198058: #_3C54: dw $A1BC, $A6E7 ; 0x15 - Choir
#_19805C: #_3C58: dw $AEB5, $B0D1 ; 0x16 - Flute
#_198060: #_3C5C: dw $B0EC, $B32C ; 0x17 - Oof
#_198064: #_3C60: dw $B32C, $BA61 ; 0x18 - Piano
#_198068: #_3C64: dw $FFFF, $FFFF ; 0x19 - null
#_19806C: #_3C68: dw $FFFF, $FFFF ; 0x1A - null
#_198070: #_3C6C: dw $FFFF, $FFFF ; 0x1B - null

base off

;===================================================================================================

SampleData:
#_198074: dw $7AA0, SAMPLE_DATA ; Transfer size, transfer address

base SAMPLE_DATA

#_198078: #_4000: incbin "bin/brr/noise.brr"
#_1980C0: #_4048: incbin "bin/brr/rain.brr"
#_19886A: #_47F2: incbin "bin/brr/timpani.brr"
#_19940D: #_5395: incbin "bin/brr/square.brr"
#_19944C: #_53D4: incbin "bin/brr/saw.brr"
#_19948B: #_5413: incbin "bin/brr/clink.brr"
#_1994EE: #_5476: incbin "bin/brr/wobbly.brr"
#_199587: #_550F: incbin "bin/brr/compoundsaw.brr"
#_199629: #_55B1: incbin "bin/brr/tweet.brr"
#_199BA5: #_5B2D: incbin "bin/brr/strings.brr"
#_19A925: #_68AD: incbin "bin/brr/trombone.brr"
#_19AD4B: #_6CD3: incbin "bin/brr/cymbal.brr"
#_19BADD: #_7A65: incbin "bin/brr/ocarina.brr"
#_19BC7B: #_7C03: incbin "bin/brr/chime.brr"
#_19BD53: #_7CDB: incbin "bin/brr/harp.brr"
#_19BF39: #_7EC1: incbin "bin/brr/splash.brr"
#_19C6F5: #_867D: incbin "bin/brr/trumpet.brr"
#_19CDFD: #_8D85: incbin "bin/brr/horn.brr"
#_19D505: #_948D: incbin "bin/brr/snare.brr"
#_19E234: #_A1BC: incbin "bin/brr/choir.brr"
#_19EF2D: #_AEB5: incbin "bin/brr/flute.brr"
#_19F164: #_B0EC: incbin "bin/brr/OOF.brr"
#_19F3A4: #_B32C: incbin "bin/brr/piano.brr"

base off

;===================================================================================================

InstrumentData:
#_19FB18: dw $00AE, INSTRUMENT_DATA ; Transfer size, transfer address

base INSTRUMENT_DATA

; SRCN, ADSR1, ADSR2, GAIN, MULT (big endian)
#_19FB1C: #_3D00: db $00, $FF, $E0, $B8, $04, $70 ; 0x00 - Noise
#_19FB22: #_3D06: db $01, $FF, $E0, $B8, $07, $90 ; 0x01 - Rain
#_19FB28: #_3D0C: db $02, $FF, $E0, $B8, $09, $C0 ; 0x02 - Timpani
#_19FB2E: #_3D12: db $03, $FF, $E0, $B8, $04, $00 ; 0x03 - Square wave
#_19FB34: #_3D18: db $04, $FF, $E0, $B8, $04, $00 ; 0x04 - Saw wave
#_19FB3A: #_3D1E: db $05, $FF, $E0, $B8, $04, $70 ; 0x05 - Clink
#_19FB40: #_3D24: db $06, $FF, $E0, $B8, $04, $70 ; 0x06 - Wobbly lead
#_19FB46: #_3D2A: db $07, $FF, $E0, $B8, $04, $70 ; 0x07 - Compound saw
#_19FB4C: #_3D30: db $08, $FF, $E0, $B8, $07, $A0 ; 0x08 - Tweet
#_19FB52: #_3D36: db $09, $8F, $E9, $B8, $01, $E0 ; 0x09 - Strings A
#_19FB58: #_3D3C: db $0A, $8A, $E9, $B8, $01, $E0 ; 0x0A - Strings B
#_19FB5E: #_3D42: db $0B, $FF, $E0, $B8, $03, $00 ; 0x0B - Trombone
#_19FB64: #_3D48: db $0C, $FF, $E0, $B8, $03, $A0 ; 0x0C - Cymbal
#_19FB6A: #_3D4E: db $0D, $FF, $E0, $B8, $01, $00 ; 0x0D - Ocarina
#_19FB70: #_3D54: db $0E, $FF, $EF, $B8, $0E, $A0 ; 0x0E - Chimes
#_19FB76: #_3D5A: db $0F, $FF, $EF, $B8, $06, $00 ; 0x0F - Harp
#_19FB7C: #_3D60: db $10, $FF, $E0, $B8, $03, $D0 ; 0x10 - Splash
#_19FB82: #_3D66: db $11, $8F, $E0, $B8, $03, $00 ; 0x11 - Trumpet
#_19FB88: #_3D6C: db $12, $8F, $E0, $B8, $06, $F0 ; 0x12 - Horn
#_19FB8E: #_3D72: db $13, $FD, $E0, $B8, $07, $A0 ; 0x13 - Snare A
#_19FB94: #_3D78: db $14, $FF, $E0, $B8, $07, $A0 ; 0x14 - Snare B
#_19FB9A: #_3D7E: db $15, $FF, $E0, $B8, $03, $D0 ; 0x15 - Choir
#_19FBA0: #_3D84: db $16, $8F, $E0, $B8, $03, $00 ; 0x16 - Flute
#_19FBA6: #_3D8A: db $17, $FF, $E0, $B8, $02, $C0 ; 0x17 - Oof
#_19FBAC: #_3D90: db $18, $FE, $8F, $B8, $06, $F0 ; 0x18 - Piano

;---------------------------------------------------------------------------------------------------

; stacc and attack table (dumb that it's here)
NoteStacc:
#_19FBB2: #_3D96: db $32, $65, $7F, $98, $B2, $CB, $E5, $FC

NoteAttack:
#_19FBB8: #_3D9E: db $19, $32, $4C, $65, $72, $7F, $8C, $98
#_19FBBE: #_3DA6: db $A5, $B2, $BF, $CB, $D8, $E5, $F2, $FC

base off

;===================================================================================================

SPCEngine:
#_19FBCA: dw $0F9E, SPC_ENGINE ; Transfer size, transfer address

incsrc "spc.asm"

;===================================================================================================

SFX_Data:
#_1A8B6C: dw $1090, SFX_DATA ; Transfer size, transfer address

base SFX_DATA

;===================================================================================================

SFX1_Pointers:
#_1A8B70: #_17C0: dw SFX1_01
#_1A8B72: #_17C2: dw SFX1_02
#_1A8B74: #_17C4: dw SFX1_03
#_1A8B76: #_17C6: dw SFX1_04
#_1A8B78: #_17C8: dw SFX1_05
#_1A8B7A: #_17CA: dw SFX1_05
#_1A8B7C: #_17CC: dw SFX1_07
#_1A8B7E: #_17CE: dw SFX1_08
#_1A8B80: #_17D0: dw SFX1_09
#_1A8B82: #_17D2: dw SFX1_0A
#_1A8B84: #_17D4: dw SFX1_0B
#_1A8B86: #_17D6: dw SFX1_0C
#_1A8B88: #_17D8: dw SFX1_0D
#_1A8B8A: #_17DA: dw SFX1_0E
#_1A8B8C: #_17DC: dw SFX1_0F
#_1A8B8E: #_17DE: dw SFX1_10
#_1A8B90: #_17E0: dw SFX1_11
#_1A8B92: #_17E2: dw SFX1_12
#_1A8B94: #_17E4: dw SFX1_13
#_1A8B96: #_17E6: dw SFX1_14
#_1A8B98: #_17E8: dw SFX1_15
#_1A8B9A: #_17EA: dw SFX1_16
#_1A8B9C: #_17EC: dw SFX1_17
#_1A8B9E: #_17EE: dw SFX1_18
#_1A8BA0: #_17F0: dw $0000
#_1A8BA2: #_17F2: dw $0000
#_1A8BA4: #_17F4: dw SFX1_0B
#_1A8BA6: #_17F6: dw SFX1_0C
#_1A8BA8: #_17F8: dw SFX1_0D
#_1A8BAA: #_17FA: dw SFX1_0E
#_1A8BAC: #_17FC: dw SFX1_0F
#_1A8BAE: #_17FE: dw SFX1_10

;---------------------------------------------------------------------------------------------------

SFX1_Accomp:
#_1A8BB0: #_1800: db $02 ; SFX1 01
#_1A8BB1: #_1801: db $00 ; SFX1 02
#_1A8BB2: #_1802: db $04 ; SFX1 03
#_1A8BB3: #_1803: db $00 ; SFX1 04
#_1A8BB4: #_1804: db $06 ; SFX1 05
#_1A8BB5: #_1805: db $00 ; SFX1 06
#_1A8BB6: #_1806: db $08 ; SFX1 07
#_1A8BB7: #_1807: db $00 ; SFX1 08
#_1A8BB8: #_1808: db $0A ; SFX1 09
#_1A8BB9: #_1809: db $00 ; SFX1 0A
#_1A8BBA: #_180A: db $0C ; SFX1 0B
#_1A8BBB: #_180B: db $00 ; SFX1 0C
#_1A8BBC: #_180C: db $0E ; SFX1 0D
#_1A8BBD: #_180D: db $00 ; SFX1 0E
#_1A8BBE: #_180E: db $10 ; SFX1 0F
#_1A8BBF: #_180F: db $00 ; SFX1 10
#_1A8BC0: #_1810: db $12 ; SFX1 11
#_1A8BC1: #_1811: db $00 ; SFX1 12
#_1A8BC2: #_1812: db $14 ; SFX1 13
#_1A8BC3: #_1813: db $00 ; SFX1 14
#_1A8BC4: #_1814: db $16 ; SFX1 15
#_1A8BC5: #_1815: db $00 ; SFX1 16
#_1A8BC6: #_1816: db $18 ; SFX1 17
#_1A8BC7: #_1817: db $00 ; SFX1 18
#_1A8BC8: #_1818: db $1A ; SFX1 19
#_1A8BC9: #_1819: db $00 ; SFX1 1A
#_1A8BCA: #_181A: db $1C ; SFX1 1B
#_1A8BCB: #_181B: db $00 ; SFX1 1C
#_1A8BCC: #_181C: db $1E ; SFX1 1D
#_1A8BCD: #_181D: db $00 ; SFX1 1E
#_1A8BCE: #_181E: db $20 ; SFX1 1F
#_1A8BCF: #_181F: db $00 ; SFX1 20

;===================================================================================================

SFX2_Pointers:
#_1A8BD0: #_1820: dw SFX2_01
#_1A8BD2: #_1822: dw SFX2_02
#_1A8BD4: #_1824: dw SFX2_03
#_1A8BD6: #_1826: dw SFX2_04
#_1A8BD8: #_1828: dw SFX2_05
#_1A8BDA: #_182A: dw SFX2_06
#_1A8BDC: #_182C: dw SFX2_07
#_1A8BDE: #_182E: dw SFX2_08
#_1A8BE0: #_1830: dw SFX2_09
#_1A8BE2: #_1832: dw SFX2_0A
#_1A8BE4: #_1834: dw SFX2_0B
#_1A8BE6: #_1836: dw SFX2_0C
#_1A8BE8: #_1838: dw SFX2_0D
#_1A8BEA: #_183A: dw SFX2_0E
#_1A8BEC: #_183C: dw SFX2_0F
#_1A8BEE: #_183E: dw SFX2_10
#_1A8BF0: #_1840: dw SFX2_11
#_1A8BF2: #_1842: dw SFX2_12
#_1A8BF4: #_1844: dw SFX2_13
#_1A8BF6: #_1846: dw SFX2_14
#_1A8BF8: #_1848: dw SFX2_15
#_1A8BFA: #_184A: dw SFX2_16
#_1A8BFC: #_184C: dw SFX2_17
#_1A8BFE: #_184E: dw SFX2_18
#_1A8C00: #_1850: dw SFX2_19
#_1A8C02: #_1852: dw SFX2_1A
#_1A8C04: #_1854: dw SFX2_1B
#_1A8C06: #_1856: dw SFX2_1C
#_1A8C08: #_1858: dw SFX2_1D
#_1A8C0A: #_185A: dw SFX2_1E
#_1A8C0C: #_185C: dw SFX2_1F
#_1A8C0E: #_185E: dw SFX2_20
#_1A8C10: #_1860: dw SFX2_21
#_1A8C12: #_1862: dw SFX2_22
#_1A8C14: #_1864: dw SFX2_23
#_1A8C16: #_1866: dw SFX2_24
#_1A8C18: #_1868: dw SFX2_25
#_1A8C1A: #_186A: dw SFX2_26
#_1A8C1C: #_186C: dw SFX2_27
#_1A8C1E: #_186E: dw SFX2_28
#_1A8C20: #_1870: dw SFX2_29
#_1A8C22: #_1872: dw SFX2_2A
#_1A8C24: #_1874: dw SFX2_2B
#_1A8C26: #_1876: dw SFX2_2C
#_1A8C28: #_1878: dw SFX2_2D
#_1A8C2A: #_187A: dw SFX2_2E
#_1A8C2C: #_187C: dw SFX2_2F
#_1A8C2E: #_187E: dw SFX2_30
#_1A8C30: #_1880: dw SFX2_31
#_1A8C32: #_1882: dw SFX2_32
#_1A8C34: #_1884: dw SFX2_33
#_1A8C36: #_1886: dw SFX2_34
#_1A8C38: #_1888: dw SFX2_35
#_1A8C3A: #_188A: dw SFX2_36
#_1A8C3C: #_188C: dw SFX2_37
#_1A8C3E: #_188E: dw SFX2_34
#_1A8C40: #_1890: dw SFX2_39
#_1A8C42: #_1892: dw SFX2_3A
#_1A8C44: #_1894: dw SFX2_3B
#_1A8C46: #_1896: dw SFX2_3C
#_1A8C48: #_1898: dw SFX2_3D
#_1A8C4A: #_189A: dw SFX2_3E
#_1A8C4C: #_189C: dw SFX2_3F

;---------------------------------------------------------------------------------------------------

SFX2_Accomp:
#_1A8C4E: #_189E: db $00 ; SFX2 01
#_1A8C4F: #_189F: db $00 ; SFX2 02
#_1A8C50: #_18A0: db $00 ; SFX2 03
#_1A8C51: #_18A1: db $00 ; SFX2 04
#_1A8C52: #_18A2: db $00 ; SFX2 05
#_1A8C53: #_18A3: db $00 ; SFX2 06
#_1A8C54: #_18A4: db $00 ; SFX2 07
#_1A8C55: #_18A5: db $00 ; SFX2 08
#_1A8C56: #_18A6: db $00 ; SFX2 09
#_1A8C57: #_18A7: db $00 ; SFX2 0A
#_1A8C58: #_18A8: db $00 ; SFX2 0B
#_1A8C59: #_18A9: db $00 ; SFX2 0C
#_1A8C5A: #_18AA: db $3F ; SFX2 0D
#_1A8C5B: #_18AB: db $00 ; SFX2 0E
#_1A8C5C: #_18AC: db $00 ; SFX2 0F
#_1A8C5D: #_18AD: db $00 ; SFX2 10
#_1A8C5E: #_18AE: db $00 ; SFX2 11
#_1A8C5F: #_18AF: db $00 ; SFX2 12
#_1A8C60: #_18B0: db $3E ; SFX2 13
#_1A8C61: #_18B1: db $00 ; SFX2 14
#_1A8C62: #_18B2: db $00 ; SFX2 15
#_1A8C63: #_18B3: db $00 ; SFX2 16
#_1A8C64: #_18B4: db $00 ; SFX2 17
#_1A8C65: #_18B5: db $00 ; SFX2 18
#_1A8C66: #_18B6: db $00 ; SFX2 19
#_1A8C67: #_18B7: db $00 ; SFX2 1A
#_1A8C68: #_18B8: db $00 ; SFX2 1B
#_1A8C69: #_18B9: db $00 ; SFX2 1C
#_1A8C6A: #_18BA: db $00 ; SFX2 1D
#_1A8C6B: #_18BB: db $00 ; SFX2 1E
#_1A8C6C: #_18BC: db $00 ; SFX2 1F
#_1A8C6D: #_18BD: db $00 ; SFX2 20
#_1A8C6E: #_18BE: db $00 ; SFX2 21
#_1A8C6F: #_18BF: db $00 ; SFX2 22
#_1A8C70: #_18C0: db $00 ; SFX2 23
#_1A8C71: #_18C1: db $3D ; SFX2 24
#_1A8C72: #_18C2: db $00 ; SFX2 25
#_1A8C73: #_18C3: db $00 ; SFX2 26
#_1A8C74: #_18C4: db $00 ; SFX2 27
#_1A8C75: #_18C5: db $00 ; SFX2 28
#_1A8C76: #_18C6: db $3B ; SFX2 29
#_1A8C77: #_18C7: db $00 ; SFX2 2A
#_1A8C78: #_18C8: db $00 ; SFX2 2B
#_1A8C79: #_18C9: db $3A ; SFX2 2C
#_1A8C7A: #_18CA: db $00 ; SFX2 2D
#_1A8C7B: #_18CB: db $39 ; SFX2 2E
#_1A8C7C: #_18CC: db $38 ; SFX2 2F
#_1A8C7D: #_18CD: db $00 ; SFX2 30
#_1A8C7E: #_18CE: db $00 ; SFX2 31
#_1A8C7F: #_18CF: db $00 ; SFX2 32
#_1A8C80: #_18D0: db $00 ; SFX2 33
#_1A8C81: #_18D1: db $33 ; SFX2 34
#_1A8C82: #_18D2: db $36 ; SFX2 35
#_1A8C83: #_18D3: db $00 ; SFX2 36
#_1A8C84: #_18D4: db $00 ; SFX2 37
#_1A8C85: #_18D5: db $00 ; SFX2 38
#_1A8C86: #_18D6: db $00 ; SFX2 39
#_1A8C87: #_18D7: db $00 ; SFX2 3A
#_1A8C88: #_18D8: db $00 ; SFX2 3B
#_1A8C89: #_18D9: db $00 ; SFX2 3C
#_1A8C8A: #_18DA: db $00 ; SFX2 3D
#_1A8C8B: #_18DB: db $00 ; SFX2 3E
#_1A8C8C: #_18DC: db $00 ; SFX2 3F

;---------------------------------------------------------------------------------------------------

SFX2_Echo:
#_1A8C8D: #_18DD: db $00 ; SFX2 01
#_1A8C8E: #_18DE: db $00 ; SFX2 02
#_1A8C8F: #_18DF: db $00 ; SFX2 03
#_1A8C90: #_18E0: db $00 ; SFX2 04
#_1A8C91: #_18E1: db $00 ; SFX2 05
#_1A8C92: #_18E2: db $00 ; SFX2 06
#_1A8C93: #_18E3: db $00 ; SFX2 07
#_1A8C94: #_18E4: db $00 ; SFX2 08
#_1A8C95: #_18E5: db $00 ; SFX2 09
#_1A8C96: #_18E6: db $00 ; SFX2 0A
#_1A8C97: #_18E7: db $00 ; SFX2 0B
#_1A8C98: #_18E8: db $01 ; SFX2 0C
#_1A8C99: #_18E9: db $00 ; SFX2 0D
#_1A8C9A: #_18EA: db $00 ; SFX2 0E
#_1A8C9B: #_18EB: db $00 ; SFX2 0F
#_1A8C9C: #_18EC: db $00 ; SFX2 10
#_1A8C9D: #_18ED: db $00 ; SFX2 11
#_1A8C9E: #_18EE: db $00 ; SFX2 12
#_1A8C9F: #_18EF: db $00 ; SFX2 13
#_1A8CA0: #_18F0: db $00 ; SFX2 14
#_1A8CA1: #_18F1: db $00 ; SFX2 15
#_1A8CA2: #_18F2: db $00 ; SFX2 16
#_1A8CA3: #_18F3: db $00 ; SFX2 17
#_1A8CA4: #_18F4: db $00 ; SFX2 18
#_1A8CA5: #_18F5: db $00 ; SFX2 19
#_1A8CA6: #_18F6: db $00 ; SFX2 1A
#_1A8CA7: #_18F7: db $00 ; SFX2 1B
#_1A8CA8: #_18F8: db $00 ; SFX2 1C
#_1A8CA9: #_18F9: db $00 ; SFX2 1D
#_1A8CAA: #_18FA: db $00 ; SFX2 1E
#_1A8CAB: #_18FB: db $00 ; SFX2 1F
#_1A8CAC: #_18FC: db $00 ; SFX2 20
#_1A8CAD: #_18FD: db $00 ; SFX2 21
#_1A8CAE: #_18FE: db $00 ; SFX2 22
#_1A8CAF: #_18FF: db $00 ; SFX2 23
#_1A8CB0: #_1900: db $00 ; SFX2 24
#_1A8CB1: #_1901: db $00 ; SFX2 25
#_1A8CB2: #_1902: db $00 ; SFX2 26
#_1A8CB3: #_1903: db $00 ; SFX2 27
#_1A8CB4: #_1904: db $00 ; SFX2 28
#_1A8CB5: #_1905: db $3B ; SFX2 29
#_1A8CB6: #_1906: db $01 ; SFX2 2A
#_1A8CB7: #_1907: db $01 ; SFX2 2B
#_1A8CB8: #_1908: db $00 ; SFX2 2C
#_1A8CB9: #_1909: db $01 ; SFX2 2D
#_1A8CBA: #_190A: db $01 ; SFX2 2E
#_1A8CBB: #_190B: db $01 ; SFX2 2F
#_1A8CBC: #_190C: db $00 ; SFX2 30
#_1A8CBD: #_190D: db $00 ; SFX2 31
#_1A8CBE: #_190E: db $00 ; SFX2 32
#_1A8CBF: #_190F: db $00 ; SFX2 33
#_1A8CC0: #_1910: db $00 ; SFX2 34
#_1A8CC1: #_1911: db $01 ; SFX2 35
#_1A8CC2: #_1912: db $01 ; SFX2 36
#_1A8CC3: #_1913: db $00 ; SFX2 37
#_1A8CC4: #_1914: db $00 ; SFX2 38
#_1A8CC5: #_1915: db $00 ; SFX2 39
#_1A8CC6: #_1916: db $00 ; SFX2 3A
#_1A8CC7: #_1917: db $00 ; SFX2 3B
#_1A8CC8: #_1918: db $01 ; SFX2 3C
#_1A8CC9: #_1919: db $00 ; SFX2 3D
#_1A8CCA: #_191A: db $3C ; SFX2 3E
#_1A8CCB: #_191B: db $00 ; SFX2 3F

;===================================================================================================

SFX3_Pointers:
#_1A8CCC: #_191C: dw SFX3_01
#_1A8CCE: #_191E: dw SFX3_02
#_1A8CD0: #_1920: dw SFX3_03
#_1A8CD2: #_1922: dw SFX3_04
#_1A8CD4: #_1924: dw SFX2_07
#_1A8CD6: #_1926: dw SFX3_06
#_1A8CD8: #_1928: dw SFX3_07
#_1A8CDA: #_192A: dw SFX3_08
#_1A8CDC: #_192C: dw SFX3_09
#_1A8CDE: #_192E: dw SFX3_0A
#_1A8CE0: #_1930: dw SFX3_0B
#_1A8CE2: #_1932: dw SFX3_0C
#_1A8CE4: #_1934: dw SFX3_0D
#_1A8CE6: #_1936: dw SFX3_0E
#_1A8CE8: #_1938: dw SFX3_0F
#_1A8CEA: #_193A: dw SFX3_10
#_1A8CEC: #_193C: dw SFX3_11
#_1A8CEE: #_193E: dw SFX3_12
#_1A8CF0: #_1940: dw SFX3_13
#_1A8CF2: #_1942: dw SFX3_14
#_1A8CF4: #_1944: dw SFX3_15
#_1A8CF6: #_1946: dw SFX3_16
#_1A8CF8: #_1948: dw SFX3_17
#_1A8CFA: #_194A: dw SFX3_18
#_1A8CFC: #_194C: dw SFX3_19
#_1A8CFE: #_194E: dw SFX3_1A
#_1A8D00: #_1950: dw SFX3_1B
#_1A8D02: #_1952: dw SFX3_1C
#_1A8D04: #_1954: dw SFX2_2D
#_1A8D06: #_1956: dw SFX3_1E
#_1A8D08: #_1958: dw SFX3_1F
#_1A8D0A: #_195A: dw SFX3_20
#_1A8D0C: #_195C: dw SFX3_21
#_1A8D0E: #_195E: dw SFX3_22
#_1A8D10: #_1960: dw SFX3_23
#_1A8D12: #_1962: dw SFX3_24
#_1A8D14: #_1964: dw SFX3_25
#_1A8D16: #_1966: dw SFX3_26
#_1A8D18: #_1968: dw SFX3_27
#_1A8D1A: #_196A: dw SFX3_28
#_1A8D1C: #_196C: dw SFX3_29
#_1A8D1E: #_196E: dw SFX3_2A
#_1A8D20: #_1970: dw SFX3_2B
#_1A8D22: #_1972: dw SFX3_2C
#_1A8D24: #_1974: dw SFX3_2D
#_1A8D26: #_1976: dw SFX3_2E
#_1A8D28: #_1978: dw SFX3_2F
#_1A8D2A: #_197A: dw SFX3_30
#_1A8D2C: #_197C: dw SFX3_31
#_1A8D2E: #_197E: dw SFX3_32
#_1A8D30: #_1980: dw SFX3_33
#_1A8D32: #_1982: dw SFX3_34
#_1A8D34: #_1984: dw SFX3_35
#_1A8D36: #_1986: dw SFX3_36
#_1A8D38: #_1988: dw SFX3_37
#_1A8D3A: #_198A: dw SFX3_38
#_1A8D3C: #_198C: dw SFX3_39
#_1A8D3E: #_198E: dw SFX3_3A
#_1A8D40: #_1990: dw SFX3_3B
#_1A8D42: #_1992: dw SFX3_3C
#_1A8D44: #_1994: dw SFX3_3D
#_1A8D46: #_1996: dw SFX3_3E
#_1A8D48: #_1998: dw SFX3_3F

;---------------------------------------------------------------------------------------------------

SFX3_Accomp:
#_1A8D4A: #_199A: db $00 ; SFX3 01
#_1A8D4B: #_199B: db $00 ; SFX3 02
#_1A8D4C: #_199C: db $00 ; SFX3 03
#_1A8D4D: #_199D: db $00 ; SFX3 04
#_1A8D4E: #_199E: db $00 ; SFX3 05
#_1A8D4F: #_199F: db $00 ; SFX3 06
#_1A8D50: #_19A0: db $00 ; SFX3 07
#_1A8D51: #_19A1: db $00 ; SFX3 08
#_1A8D52: #_19A2: db $00 ; SFX3 09
#_1A8D53: #_19A3: db $00 ; SFX3 0A
#_1A8D54: #_19A4: db $00 ; SFX3 0B
#_1A8D55: #_19A5: db $00 ; SFX3 0C
#_1A8D56: #_19A6: db $00 ; SFX3 0D
#_1A8D57: #_19A7: db $00 ; SFX3 0E
#_1A8D58: #_19A8: db $3C ; SFX3 0F
#_1A8D59: #_19A9: db $3B ; SFX3 10
#_1A8D5A: #_19AA: db $00 ; SFX3 11
#_1A8D5B: #_19AB: db $00 ; SFX3 12
#_1A8D5C: #_19AC: db $00 ; SFX3 13
#_1A8D5D: #_19AD: db $00 ; SFX3 14
#_1A8D5E: #_19AE: db $00 ; SFX3 15
#_1A8D5F: #_19AF: db $00 ; SFX3 16
#_1A8D60: #_19B0: db $00 ; SFX3 17
#_1A8D61: #_19B1: db $00 ; SFX3 18
#_1A8D62: #_19B2: db $00 ; SFX3 19
#_1A8D63: #_19B3: db $38 ; SFX3 1A
#_1A8D64: #_19B4: db $3A ; SFX3 1B
#_1A8D65: #_19B5: db $00 ; SFX3 1C
#_1A8D66: #_19B6: db $00 ; SFX3 1D
#_1A8D67: #_19B7: db $00 ; SFX3 1E
#_1A8D68: #_19B8: db $00 ; SFX3 1F
#_1A8D69: #_19B9: db $00 ; SFX3 20
#_1A8D6A: #_19BA: db $00 ; SFX3 21
#_1A8D6B: #_19BB: db $00 ; SFX3 22
#_1A8D6C: #_19BC: db $39 ; SFX3 23
#_1A8D6D: #_19BD: db $00 ; SFX3 24
#_1A8D6E: #_19BE: db $00 ; SFX3 25
#_1A8D6F: #_19BF: db $00 ; SFX3 26
#_1A8D70: #_19C0: db $00 ; SFX3 27
#_1A8D71: #_19C1: db $00 ; SFX3 28
#_1A8D72: #_19C2: db $00 ; SFX3 29
#_1A8D73: #_19C3: db $00 ; SFX3 2A
#_1A8D74: #_19C4: db $00 ; SFX3 2B
#_1A8D75: #_19C5: db $00 ; SFX3 2C
#_1A8D76: #_19C6: db $37 ; SFX3 2D
#_1A8D77: #_19C7: db $35 ; SFX3 2E
#_1A8D78: #_19C8: db $33 ; SFX3 2F
#_1A8D79: #_19C9: db $00 ; SFX3 30
#_1A8D7A: #_19CA: db $00 ; SFX3 31
#_1A8D7B: #_19CB: db $00 ; SFX3 32
#_1A8D7C: #_19CC: db $00 ; SFX3 33
#_1A8D7D: #_19CD: db $00 ; SFX3 34
#_1A8D7E: #_19CE: db $34 ; SFX3 35
#_1A8D7F: #_19CF: db $00 ; SFX3 36
#_1A8D80: #_19D0: db $00 ; SFX3 37
#_1A8D81: #_19D1: db $00 ; SFX3 38
#_1A8D82: #_19D2: db $00 ; SFX3 39
#_1A8D83: #_19D3: db $00 ; SFX3 3A
#_1A8D84: #_19D4: db $00 ; SFX3 3B
#_1A8D85: #_19D5: db $3D ; SFX3 3C
#_1A8D86: #_19D6: db $3E ; SFX3 3D
#_1A8D87: #_19D7: db $3F ; SFX3 3E
#_1A8D88: #_19D8: db $00 ; SFX3 3F

;---------------------------------------------------------------------------------------------------

SFX3_Echo:
#_1A8D89: #_19D9: db $00 ; SFX3 01
#_1A8D8A: #_19DA: db $00 ; SFX3 02
#_1A8D8B: #_19DB: db $00 ; SFX3 03
#_1A8D8C: #_19DC: db $00 ; SFX3 04
#_1A8D8D: #_19DD: db $00 ; SFX3 05
#_1A8D8E: #_19DE: db $00 ; SFX3 06
#_1A8D8F: #_19DF: db $00 ; SFX3 07
#_1A8D90: #_19E0: db $00 ; SFX3 08
#_1A8D91: #_19E1: db $00 ; SFX3 09
#_1A8D92: #_19E2: db $00 ; SFX3 0A
#_1A8D93: #_19E3: db $00 ; SFX3 0B
#_1A8D94: #_19E4: db $01 ; SFX3 0C
#_1A8D95: #_19E5: db $01 ; SFX3 0D
#_1A8D96: #_19E6: db $00 ; SFX3 0E
#_1A8D97: #_19E7: db $3C ; SFX3 0F
#_1A8D98: #_19E8: db $3B ; SFX3 10
#_1A8D99: #_19E9: db $01 ; SFX3 11
#_1A8D9A: #_19EA: db $01 ; SFX3 12
#_1A8D9B: #_19EB: db $00 ; SFX3 13
#_1A8D9C: #_19EC: db $00 ; SFX3 14
#_1A8D9D: #_19ED: db $00 ; SFX3 15
#_1A8D9E: #_19EE: db $00 ; SFX3 16
#_1A8D9F: #_19EF: db $00 ; SFX3 17
#_1A8DA0: #_19F0: db $00 ; SFX3 18
#_1A8DA1: #_19F1: db $00 ; SFX3 19
#_1A8DA2: #_19F2: db $00 ; SFX3 1A
#_1A8DA3: #_19F3: db $3A ; SFX3 1B
#_1A8DA4: #_19F4: db $00 ; SFX3 1C
#_1A8DA5: #_19F5: db $01 ; SFX3 1D
#_1A8DA6: #_19F6: db $00 ; SFX3 1E
#_1A8DA7: #_19F7: db $01 ; SFX3 1F
#_1A8DA8: #_19F8: db $01 ; SFX3 20
#_1A8DA9: #_19F9: db $01 ; SFX3 21
#_1A8DAA: #_19FA: db $01 ; SFX3 22
#_1A8DAB: #_19FB: db $00 ; SFX3 23
#_1A8DAC: #_19FC: db $01 ; SFX3 24
#_1A8DAD: #_19FD: db $00 ; SFX3 25
#_1A8DAE: #_19FE: db $00 ; SFX3 26
#_1A8DAF: #_19FF: db $00 ; SFX3 27
#_1A8DB0: #_1A00: db $00 ; SFX3 28
#_1A8DB1: #_1A01: db $00 ; SFX3 29
#_1A8DB2: #_1A02: db $00 ; SFX3 2A
#_1A8DB3: #_1A03: db $00 ; SFX3 2B
#_1A8DB4: #_1A04: db $00 ; SFX3 2C
#_1A8DB5: #_1A05: db $01 ; SFX3 2D
#_1A8DB6: #_1A06: db $01 ; SFX3 2E
#_1A8DB7: #_1A07: db $01 ; SFX3 2F
#_1A8DB8: #_1A08: db $00 ; SFX3 30
#_1A8DB9: #_1A09: db $01 ; SFX3 31
#_1A8DBA: #_1A0A: db $00 ; SFX3 32
#_1A8DBB: #_1A0B: db $01 ; SFX3 33
#_1A8DBC: #_1A0C: db $01 ; SFX3 34
#_1A8DBD: #_1A0D: db $01 ; SFX3 35
#_1A8DBE: #_1A0E: db $00 ; SFX3 36
#_1A8DBF: #_1A0F: db $01 ; SFX3 37
#_1A8DC0: #_1A10: db $00 ; SFX3 38
#_1A8DC1: #_1A11: db $00 ; SFX3 39
#_1A8DC2: #_1A12: db $00 ; SFX3 3A
#_1A8DC3: #_1A13: db $00 ; SFX3 3B
#_1A8DC4: #_1A14: db $3D ; SFX3 3C
#_1A8DC5: #_1A15: db $3E ; SFX3 3D
#_1A8DC6: #_1A16: db $3F ; SFX3 3E
#_1A8DC7: #_1A17: db $01 ; SFX3 3F

;===================================================================================================
; Sound effects
;===================================================================================================
#_1A8DC8: #_1A18: SFX3_01: incbin "bin/sfx/sfx3-01.sfx"            ; size: 0x001F
#_1A8DE7: #_1A37: SFX2_3C: incbin "bin/sfx/sfx2-3C.sfx"            ; size: 0x000C
#_1A8DF3: #_1A43: SFX2_37: incbin "bin/sfx/sfx2-37.sfx"            ; size: 0x0018
#_1A8E0B: #_1A5B: UnusedSFX_1A5B: incbin "bin/sfx/unused-1A5B.sfx" ; size: 0x0007
#_1A8E12: #_1A62: SFX3_1C: incbin "bin/sfx/sfx3-1C.sfx"            ; size: 0x0016
#_1A8E28: #_1A78: SFX3_32: incbin "bin/sfx/sfx3-32.sfx"            ; size: 0x002F
#_1A8E57: #_1AA7: SFX3_36: incbin "bin/sfx/sfx3-36.sfx"            ; size: 0x0023
#_1A8E7A: #_1ACA: SFX3_31: incbin "bin/sfx/sfx3-31.sfx"            ; size: 0x0008
#_1A8E82: #_1AD2: SFX1_13: incbin "bin/sfx/sfx1-13.sfx"            ; size: 0x000F
#_1A8E91: #_1AE1: SFX1_14: incbin "bin/sfx/sfx1-14.sfx"            ; size: 0x000F
#_1A8EA0: #_1AF0: SFX1_15: incbin "bin/sfx/sfx1-15.sfx"            ; size: 0x000F
#_1A8EAF: #_1AFF: SFX1_16: incbin "bin/sfx/sfx1-16.sfx"            ; size: 0x000F
#_1A8EBE: #_1B0E: SFX1_0D: incbin "bin/sfx/sfx1-0D.sfx"            ; size: 0x000F
#_1A8ECD: #_1B1D: SFX1_0E: incbin "bin/sfx/sfx1-0E.sfx"            ; size: 0x000F
#_1A8EDC: #_1B2C: SFX1_0F: incbin "bin/sfx/sfx1-0F.sfx"            ; size: 0x0012
#_1A8EEE: #_1B3E: SFX1_10: incbin "bin/sfx/sfx1-10.sfx"            ; size: 0x0015
#_1A8F03: #_1B53: SFX3_30: incbin "bin/sfx/sfx3-30.sfx"            ; size: 0x000F
#_1A8F12: #_1B62: SFX1_0C: incbin "bin/sfx/sfx1-0C.sfx"            ; size: 0x0041
#_1A8F53: #_1BA3: SFX1_0B: incbin "bin/sfx/sfx1-0B.sfx"            ; size: 0x0040
#_1A8F93: #_1BE3: SFX1_18: incbin "bin/sfx/sfx1-18.sfx"            ; size: 0x0041
#_1A8FD4: #_1C24: SFX1_17: incbin "bin/sfx/sfx1-17.sfx"            ; size: 0x0040
#_1A9014: #_1C64: SFX2_36: incbin "bin/sfx/sfx2-36.sfx"            ; size: 0x0003
#_1A9017: #_1C67: SFX2_35: incbin "bin/sfx/sfx2-35.sfx"            ; size: 0x0027
#_1A903E: #_1C8E: SFX1_09: incbin "bin/sfx/sfx1-09.sfx"            ; size: 0x002E
#_1A906C: #_1CBC: SFX1_0A: incbin "bin/sfx/sfx1-0A.sfx"            ; size: 0x0020
#_1A908C: #_1CDC: SFX2_33: incbin "bin/sfx/sfx2-33.sfx"            ; size: 0x0040
#_1A90CC: #_1D1C: UnusedSFX_1D1C: incbin "bin/sfx/unused-1D1C.sfx" ; size: 0x002B
#_1A90F7: #_1D47: SFX2_32: incbin "bin/sfx/sfx2-32.sfx"            ; size: 0x0016
#_1A910D: #_1D5D: SFX3_2E: incbin "bin/sfx/sfx3-2E.sfx"            ; size: 0x0009
#_1A9116: #_1D66: SFX3_34: incbin "bin/sfx/sfx3-34.sfx"            ; size: 0x000D
#_1A9123: #_1D73: SFX3_35: incbin "bin/sfx/sfx3-35.sfx"            ; size: 0x000D
#_1A9130: #_1D80: SFX3_2F: incbin "bin/sfx/sfx3-2F.sfx"            ; size: 0x0013
#_1A9143: #_1D93: SFX3_33: incbin "bin/sfx/sfx3-33.sfx"            ; size: 0x0016
#_1A9159: #_1DA9: SFX3_2D: incbin "bin/sfx/sfx3-2D.sfx"            ; size: 0x000B
#_1A9164: #_1DB4: SFX3_37: incbin "bin/sfx/sfx3-37.sfx"            ; size: 0x000C
#_1A9170: #_1DC0: SFX3_2C: incbin "bin/sfx/sfx3-2C.sfx"            ; size: 0x0033
#_1A91A3: #_1DF3: SFX3_2B: incbin "bin/sfx/sfx3-2B.sfx"            ; size: 0x001F
#_1A91C2: #_1E12: SFX3_2A: incbin "bin/sfx/sfx3-2A.sfx"            ; size: 0x000F
#_1A91D1: #_1E21: SFX3_29: incbin "bin/sfx/sfx3-29.sfx"            ; size: 0x001F
#_1A91F0: #_1E40: SFX3_27: incbin "bin/sfx/sfx3-27.sfx"            ; size: 0x003B
#_1A922B: #_1E7B: SFX3_26: incbin "bin/sfx/sfx3-26.sfx"            ; size: 0x000F
#_1A923A: #_1E8A: SFX3_1A: incbin "bin/sfx/sfx3-1A.sfx"            ; size: 0x0009
#_1A9243: #_1E93: SFX3_38: incbin "bin/sfx/sfx3-38.sfx"            ; size: 0x000A
#_1A924D: #_1E9D: SFX3_25: incbin "bin/sfx/sfx3-25.sfx"            ; size: 0x000F
#_1A925C: #_1EAC: SFX1_11: incbin "bin/sfx/sfx1-11.sfx"            ; size: 0x001C
#_1A9278: #_1EC8: SFX1_12: incbin "bin/sfx/sfx1-12.sfx"            ; size: 0x001A
#_1A9292: #_1EE2: UnusedSFX_1EE2: incbin "bin/sfx/unused-1EE2.sfx" ; size: 0x000F
#_1A92A1: #_1EF1: SFX2_30: incbin "bin/sfx/sfx2-30.sfx"            ; size: 0x0022
#_1A92C3: #_1F13: UnusedSFX_1F13: incbin "bin/sfx/unused-1F13.sfx" ; size: 0x0034
#_1A92F7: #_1F47: SFX2_2F: incbin "bin/sfx/sfx2-2F.sfx"            ; size: 0x0028
#_1A931F: #_1F6F: SFX2_34: incbin "bin/sfx/sfx2-34.sfx"            ; size: 0x002D
#_1A934C: #_1F9C: SFX2_39: incbin "bin/sfx/sfx2-39.sfx"            ; size: 0x002E
#_1A937A: #_1FCA: SFX2_2E: incbin "bin/sfx/sfx2-2E.sfx"            ; size: 0x000F
#_1A9389: #_1FD9: SFX2_2C: incbin "bin/sfx/sfx2-2C.sfx"            ; size: 0x000E
#_1A9397: #_1FE7: SFX2_3A: incbin "bin/sfx/sfx2-3A.sfx"            ; size: 0x000B
#_1A93A2: #_1FF2: SFX2_2B: incbin "bin/sfx/sfx2-2B.sfx"            ; size: 0x000F
#_1A93B1: #_2001: SFX3_23: incbin "bin/sfx/sfx3-23.sfx"            ; size: 0x0016
#_1A93C7: #_2017: SFX3_39: incbin "bin/sfx/sfx3-39.sfx"            ; size: 0x001C
#_1A93E3: #_2033: SFX2_2A: incbin "bin/sfx/sfx2-2A.sfx"            ; size: 0x0010
#_1A93F3: #_2043: SFX3_24: incbin "bin/sfx/sfx3-24.sfx"            ; size: 0x0008
#_1A93FB: #_204B: SFX3_1F: incbin "bin/sfx/sfx3-1F.sfx"            ; size: 0x0046
#_1A9441: #_2091: SFX3_1E: incbin "bin/sfx/sfx3-1E.sfx"            ; size: 0x0015
#_1A9456: #_20A6: SFX2_2D: incbin "bin/sfx/sfx2-2D.sfx"            ; size: 0x0010
#_1A9466: #_20B6: SFX3_1B: incbin "bin/sfx/sfx3-1B.sfx"            ; size: 0x000A
#_1A9470: #_20C0: SFX3_3A: incbin "bin/sfx/sfx3-3A.sfx"            ; size: 0x000E
#_1A947E: #_20CE: SFX2_31: incbin "bin/sfx/sfx2-31.sfx"            ; size: 0x000F
#_1A948D: #_20DD: SFX3_18: incbin "bin/sfx/sfx3-18.sfx"            ; size: 0x002A
#_1A94B7: #_2107: SFX2_22: incbin "bin/sfx/sfx2-22.sfx"            ; size: 0x001C
#_1A94D3: #_2123: SFX3_16: incbin "bin/sfx/sfx3-16.sfx"            ; size: 0x000C
#_1A94DF: #_212F: SFX3_15: incbin "bin/sfx/sfx3-15.sfx"            ; size: 0x000C
#_1A94EB: #_213B: SFX3_13: incbin "bin/sfx/sfx3-13.sfx"            ; size: 0x0014
#_1A94FF: #_214F: SFX3_11: incbin "bin/sfx/sfx3-11.sfx"            ; size: 0x000F
#_1A950E: #_215E: SFX3_12: incbin "bin/sfx/sfx3-12.sfx"            ; size: 0x000F
#_1A951D: #_216D: SFX3_10: incbin "bin/sfx/sfx3-10.sfx"            ; size: 0x0009
#_1A9526: #_2176: SFX3_3B: incbin "bin/sfx/sfx3-3B.sfx"            ; size: 0x000C
#_1A9532: #_2182: SFX3_0E: incbin "bin/sfx/sfx3-0E.sfx"            ; size: 0x000C
#_1A953E: #_218E: SFX3_0C: incbin "bin/sfx/sfx3-0C.sfx"            ; size: 0x000A
#_1A9548: #_2198: SFX3_0B: incbin "bin/sfx/sfx3-0B.sfx"            ; size: 0x0011
#_1A9559: #_21A9: SFX3_0A: incbin "bin/sfx/sfx3-0A.sfx"            ; size: 0x000C
#_1A9565: #_21B5: SFX3_0D: incbin "bin/sfx/sfx3-0D.sfx"            ; size: 0x000C
#_1A9571: #_21C1: SFX3_09: incbin "bin/sfx/sfx3-09.sfx"            ; size: 0x0025
#_1A9596: #_21E6: SFX3_08: incbin "bin/sfx/sfx3-08.sfx"            ; size: 0x000F
#_1A95A5: #_21F5: SFX3_06: incbin "bin/sfx/sfx3-06.sfx"            ; size: 0x0019
#_1A95BE: #_220E: SFX3_04: incbin "bin/sfx/sfx3-04.sfx"            ; size: 0x002F
#_1A95ED: #_223D: SFX3_07: incbin "bin/sfx/sfx3-07.sfx"            ; size: 0x000D
#_1A95FA: #_224A: SFX3_03: incbin "bin/sfx/sfx3-03.sfx"            ; size: 0x0008
#_1A9602: #_2252: SFX2_27: incbin "bin/sfx/sfx2-27.sfx"            ; size: 0x0035
#_1A9637: #_2287: SFX2_28: incbin "bin/sfx/sfx2-28.sfx"            ; size: 0x000F
#_1A9646: #_2296: SFX2_25: incbin "bin/sfx/sfx2-25.sfx"            ; size: 0x000F
#_1A9655: #_22A5: SFX2_24: incbin "bin/sfx/sfx2-24.sfx"            ; size: 0x0006
#_1A965B: #_22AB: SFX2_3D: incbin "bin/sfx/sfx2-3D.sfx"            ; size: 0x0006
#_1A9661: #_22B1: SFX2_23: incbin "bin/sfx/sfx2-23.sfx"            ; size: 0x000A
#_1A966B: #_22BB: SFX2_1D: incbin "bin/sfx/sfx2-1D.sfx"            ; size: 0x0014
#_1A967F: #_22CF: SFX2_21: incbin "bin/sfx/sfx2-21.sfx"            ; size: 0x000B
#_1A968A: #_22DA: SFX2_20: incbin "bin/sfx/sfx2-20.sfx"            ; size: 0x000F
#_1A9699: #_22E9: SFX2_1F: incbin "bin/sfx/sfx2-1F.sfx"            ; size: 0x0018
#_1A96B1: #_2301: SFX2_1C: incbin "bin/sfx/sfx2-1C.sfx"            ; size: 0x0006
#_1A96B7: #_2307: SFX2_1B: incbin "bin/sfx/sfx2-1B.sfx"            ; size: 0x000F
#_1A96C6: #_2316: SFX2_1A: incbin "bin/sfx/sfx2-1A.sfx"            ; size: 0x0016
#_1A96DC: #_232C: SFX2_16: incbin "bin/sfx/sfx2-16.sfx"            ; size: 0x0018
#_1A96F4: #_2344: SFX2_17: incbin "bin/sfx/sfx2-17.sfx"            ; size: 0x0012
#_1A9706: #_2356: SFX2_18: incbin "bin/sfx/sfx2-18.sfx"            ; size: 0x0018
#_1A971E: #_236E: SFX2_19: incbin "bin/sfx/sfx2-19.sfx"            ; size: 0x0012
#_1A9730: #_2380: SFX2_14: incbin "bin/sfx/sfx2-14.sfx"            ; size: 0x0010
#_1A9740: #_2390: SFX2_15: incbin "bin/sfx/sfx2-15.sfx"            ; size: 0x0010
#_1A9750: #_23A0: SFX2_13: incbin "bin/sfx/sfx2-13.sfx"            ; size: 0x0015
#_1A9765: #_23B5: SFX2_3E: incbin "bin/sfx/sfx2-3E.sfx"            ; size: 0x0018
#_1A977D: #_23CD: SFX2_12: incbin "bin/sfx/sfx2-12.sfx"            ; size: 0x0023
#_1A97A0: #_23F0: SFX2_11: incbin "bin/sfx/sfx2-11.sfx"            ; size: 0x000A
#_1A97AA: #_23FA: SFX2_10: incbin "bin/sfx/sfx2-10.sfx"            ; size: 0x000A
#_1A97B4: #_2404: SFX2_0E: incbin "bin/sfx/sfx2-0E.sfx"            ; size: 0x0010
#_1A97C4: #_2414: SFX2_0D: incbin "bin/sfx/sfx2-0D.sfx"            ; size: 0x0021
#_1A97E5: #_2435: SFX2_3F: incbin "bin/sfx/sfx2-3F.sfx"            ; size: 0x000A
#_1A97EF: #_243F: SFX2_29: incbin "bin/sfx/sfx2-29.sfx"            ; size: 0x0023
#_1A9812: #_2462: SFX2_3B: incbin "bin/sfx/sfx2-3B.sfx"            ; size: 0x000A
#_1A981C: #_246C: SFX3_14: incbin "bin/sfx/sfx3-14.sfx"            ; size: 0x000C
#_1A9828: #_2478: SFX2_0B: incbin "bin/sfx/sfx2-0B.sfx"            ; size: 0x0008
#_1A9830: #_2480: SFX3_3F: incbin "bin/sfx/sfx3-3F.sfx"            ; size: 0x000A
#_1A983A: #_248A: SFX3_3C: incbin "bin/sfx/sfx3-3C.sfx"            ; size: 0x000A
#_1A9844: #_2494: SFX3_3D: incbin "bin/sfx/sfx3-3D.sfx"            ; size: 0x000A
#_1A984E: #_249E: SFX3_3E: incbin "bin/sfx/sfx3-3E.sfx"            ; size: 0x001B
#_1A9869: #_24B9: SFX3_0F: incbin "bin/sfx/sfx3-0F.sfx"            ; size: 0x000A
#_1A9873: #_24C3: SFX2_0F: incbin "bin/sfx/sfx2-0F.sfx"            ; size: 0x0047
#_1A98BA: #_250A: SFX3_19: incbin "bin/sfx/sfx3-19.sfx"            ; size: 0x0023
#_1A98DD: #_252D: UnusedSFX_252D: incbin "bin/sfx/unused-252D.sfx" ; size: 0x0006
#_1A98E3: #_2533: UnusedSFX_2533: incbin "bin/sfx/unused-2533.sfx" ; size: 0x001B
#_1A98FE: #_254E: SFX3_02: incbin "bin/sfx/sfx3-02.sfx"            ; size: 0x0029
#_1A9927: #_2577: SFX2_1E: incbin "bin/sfx/sfx2-1E.sfx"            ; size: 0x002F
#_1A9956: #_25A6: SFX3_17: incbin "bin/sfx/sfx3-17.sfx"            ; size: 0x0007
#_1A995D: #_25AD: SFX2_09: incbin "bin/sfx/sfx2-09.sfx"            ; size: 0x000A
#_1A9967: #_25B7: SFX2_07: incbin "bin/sfx/sfx2-07.sfx"            ; size: 0x0010
#_1A9977: #_25C7: SFX2_0A: incbin "bin/sfx/sfx2-0A.sfx"            ; size: 0x0010
#_1A9987: #_25D7: SFX2_06: incbin "bin/sfx/sfx2-06.sfx"            ; size: 0x0006
#_1A998D: #_25DD: SFX2_05: incbin "bin/sfx/sfx2-05.sfx"            ; size: 0x0006
#_1A9993: #_25E3: SFX2_08: incbin "bin/sfx/sfx2-08.sfx"            ; size: 0x0031
#_1A99C4: #_2614: SFX2_01: incbin "bin/sfx/sfx2-01.sfx"            ; size: 0x0011
#_1A99D5: #_2625: SFX2_02: incbin "bin/sfx/sfx2-02.sfx"            ; size: 0x000F
#_1A99E4: #_2634: SFX2_03: incbin "bin/sfx/sfx2-03.sfx"            ; size: 0x000F
#_1A99F3: #_2643: SFX2_04: incbin "bin/sfx/sfx2-04.sfx"            ; size: 0x000F
#_1A9A02: #_2652: SFX1_01: incbin "bin/sfx/sfx1-01.sfx"            ; size: 0x0005
#_1A9A07: #_2657: UnusedSFX_2657: incbin "bin/sfx/unused-2657.sfx" ; size: 0x000B
#_1A9A12: #_2662: SFX1_02: incbin "bin/sfx/sfx1-02.sfx"            ; size: 0x0015
#_1A9A27: #_2677: SFX1_03: incbin "bin/sfx/sfx1-03.sfx"            ; size: 0x0005
#_1A9A2C: #_267C: UnusedSFX_267C: incbin "bin/sfx/unused-267C.sfx" ; size: 0x000B
#_1A9A37: #_2687: SFX1_04: incbin "bin/sfx/sfx1-04.sfx"            ; size: 0x0015
#_1A9A4C: #_269C: SFX2_0C: incbin "bin/sfx/sfx2-0C.sfx"            ; size: 0x0006
#_1A9A52: #_26A2: UnusedSFX_26A2: incbin "bin/sfx/unused-26A2.sfx" ; size: 0x002D
#_1A9A7F: #_26CF: SFX3_22: incbin "bin/sfx/sfx3-22.sfx"            ; size: 0x0028
#_1A9AA7: #_26F7: SFX3_28: incbin "bin/sfx/sfx3-28.sfx"            ; size: 0x003F
#_1A9AE6: #_2736: SFX1_08: incbin "bin/sfx/sfx1-08.sfx"            ; size: 0x0003
#_1A9AE9: #_2739: SFX1_07: incbin "bin/sfx/sfx1-07.sfx"            ; size: 0x0033
#_1A9B1C: #_276C: SFX3_20: incbin "bin/sfx/sfx3-20.sfx"            ; size: 0x0012
#_1A9B2E: #_277E: UnusedSFX_277E: incbin "bin/sfx/unused-277E.sfx" ; size: 0x001F
#_1A9B4D: #_279D: UnusedSFX_279D: incbin "bin/sfx/unused-279D.sfx" ; size: 0x002C
#_1A9B79: #_27C9: UnusedSFX_27C9: incbin "bin/sfx/unused-27C9.sfx" ; size: 0x0019
#_1A9B92: #_27E2: SFX3_21: incbin "bin/sfx/sfx3-21.sfx"            ; size: 0x0014
#_1A9BA6: #_27F6: UnusedSFX_27F6: incbin "bin/sfx/unused-27F6.sfx" ; size: 0x0011
#_1A9BB7: #_2807: UnusedSFX_2807: incbin "bin/sfx/unused-2807.sfx" ; size: 0x0011
#_1A9BC8: #_2818: UnusedSFX_2818: incbin "bin/sfx/unused-2818.sfx" ; size: 0x0011
#_1A9BD9: #_2829: UnusedSFX_2829: incbin "bin/sfx/unused-2829.sfx" ; size: 0x0008
#_1A9BE1: #_2831: UnusedSFX_2831: incbin "bin/sfx/unused-2831.sfx" ; size: 0x0013
#_1A9BF4: #_2844: SFX2_26: incbin "bin/sfx/sfx2-26.sfx"            ; size: 0x0006
#_1A9BFA: #_284A: SFX_284A: incbin "bin/sfx/sfx-284A.sfx"          ; size: 0x0005
#_1A9BFF: #_284F: SFX1_05: incbin "bin/sfx/sfx1-05.sfx"            ; size: 0x0001

base off

;===================================================================================================

SFX_Instruments:
#_1A9C00: dw $00E1, INSTRUMENT_DATA_SFX ; Transfer size, transfer address

base INSTRUMENT_DATA_SFX
;                   VOLL VOLR      Pitch      SRCN   ADSR   GAIN  Mult
#_1A9C04: #_3E00: db $70, $70 : dw $1000 : db $00, $F6, $6A, $B8, $03 ; 00
#_1A9C0D: #_3E09: db $70, $70 : dw $1000 : db $01, $8E, $E0, $B8, $02 ; 01
#_1A9C16: #_3E12: db $70, $70 : dw $1000 : db $14, $FE, $6A, $B8, $02 ; 02
#_1A9C1F: #_3E1B: db $70, $70 : dw $1000 : db $03, $FE, $F8, $B8, $0D ; 03
#_1A9C28: #_3E24: db $70, $70 : dw $1000 : db $04, $FE, $6A, $7F, $03 ; 04
#_1A9C31: #_3E2D: db $70, $70 : dw $1000 : db $02, $FE, $6A, $7F, $03 ; 05
#_1A9C3A: #_3E36: db $70, $70 : dw $1000 : db $05, $FE, $6A, $70, $03 ; 06
#_1A9C43: #_3E3F: db $70, $70 : dw $1000 : db $06, $FE, $6A, $70, $03 ; 07
#_1A9C4C: #_3E48: db $70, $70 : dw $1000 : db $08, $FA, $6A, $70, $03 ; 08
#_1A9C55: #_3E51: db $70, $70 : dw $1000 : db $06, $FE, $6A, $70, $01 ; 09
#_1A9C5E: #_3E5A: db $70, $70 : dw $1000 : db $07, $FE, $6A, $70, $05 ; 0A
#_1A9C67: #_3E63: db $70, $70 : dw $1000 : db $0B, $FE, $6A, $B8, $03 ; 0B
#_1A9C70: #_3E6C: db $70, $70 : dw $1000 : db $0C, $FE, $E0, $B8, $02 ; 0C
#_1A9C79: #_3E75: db $70, $70 : dw $1000 : db $0D, $F9, $6E, $B8, $03 ; 0D
#_1A9C82: #_3E7E: db $70, $70 : dw $1000 : db $0E, $FE, $F5, $B8, $07 ; 0E
#_1A9C8B: #_3E87: db $70, $70 : dw $1000 : db $0F, $FE, $F5, $B8, $06 ; 0F
#_1A9C94: #_3E90: db $70, $70 : dw $1000 : db $01, $FE, $FC, $B8, $03 ; 10
#_1A9C9D: #_3E99: db $70, $70 : dw $1000 : db $10, $8E, $E0, $B8, $03 ; 11
#_1A9CA6: #_3EA2: db $70, $70 : dw $1000 : db $08, $8E, $E0, $B8, $02 ; 12
#_1A9CAF: #_3EAB: db $70, $70 : dw $1000 : db $14, $8E, $E0, $B8, $02 ; 13
#_1A9CB8: #_3EB4: db $70, $70 : dw $1000 : db $0A, $88, $E0, $B8, $02 ; 14
#_1A9CC1: #_3EBD: db $70, $70 : dw $1000 : db $17, $8E, $E0, $B8, $02 ; 15
#_1A9CCA: #_3EC6: db $70, $70 : dw $1000 : db $15, $FF, $E0, $B8, $04 ; 16
#_1A9CD3: #_3ECF: db $70, $70 : dw $1000 : db $03, $DF, $11, $B8, $0F ; 17
#_1A9CDC: #_3ED8: db $70, $70 : dw $1000 : db $01, $88, $E0, $B8, $01 ; 18

base off

;===================================================================================================

Fairy_Theme:
#_1A9CE5: dw $020C, $2880 ; Transfer size, transfer address

base $2880

Song0B_FairyTheme:
#_1A9CE9: #_2880: incbin "bin/music/song0B.bin" ; size: 0x020C

base off

;===================================================================================================

SongBank_Overworld_Main:
#_1A9EF5: dw $2DAE, SONG_POINTERS ; Transfer size, transfer address

base SONG_POINTERS
#_1A9EF9: #_D000o: dw Song01_TriforceIntro
#_1A9EFB: #_D002o: dw Song02_LightWorldOverture
#_1A9EFD: #_D004o: dw Song03_Rain
#_1A9EFF: #_D006o: dw Song04_BunnyTheme
#_1A9F01: #_D008o: dw Song05_LostWoods
#_1A9F03: #_D00Ao: dw Song06_LegendsTheme_Attract
#_1A9F05: #_D00Co: dw Song07_KakarikoVillage
#_1A9F07: #_D00Eo: dw Song08_MirrorWarp
#_1A9F09: #_D010o: dw Song09_DarkWorld
#_1A9F0B: #_D012o: dw Song0A_PullingTheMasterSword
#_1A9F0D: #_D014o: dw Song0B_FairyTheme
#_1A9F0F: #_D016o: dw Song0C_Fugitive
#_1A9F11: #_D018o: dw Song0D_SkullWoodsMarch
#_1A9F13: #_D01Ao: dw Song0E_MinigameTheme
#_1A9F15: #_D01Co: dw Song0F_IntroFanfare
#_1A9F17: #_D01Eo: dw $0000
#_1A9F19: #_D020o: dw $0000
#_1A9F1B: #_D022o: dw $0000
#_1A9F1D: #_D024o: dw $0000
#_1A9F1F: #_D026o: dw $0000
#_1A9F21: #_D028o: dw $0000
#_1A9F23: #_D02Ao: dw $0000
#_1A9F25: #_D02Co: dw $0000
#_1A9F27: #_D02Eo: dw $0000
#_1A9F29: #_D030o: dw $0000
#_1A9F2B: #_D032o: dw $0000
#_1A9F2D: #_D034o: dw $0000

;---------------------------------------------------------------------------------------------------

Song01_TriforceIntro:
#_1A9F2F: #_D036o: incbin "bin/music/song01.bin" ; size: 0x00C9

Song02_LightWorldOverture:
#_1A9FF8: #_D0FFo: incbin "bin/music/song02.bin" ; size: 0x076B

Song03_Rain:
#_1AA763: #_D86Ao: incbin "bin/music/song03.bin" ; size: 0x043D

Song04_BunnyTheme:
#_1AABA0: #_DCA7o: incbin "bin/music/song04.bin" ; size: 0x023E

Song05_LostWoods:
#_1AADDE: #_DEE5o: incbin "bin/music/song05.bin" ; size: 0x0485

Song06_LegendsTheme_Attract:
#_1AB263: #_E36Ao: incbin "bin/music/song06.bin" ; size: 0x0572

Song07_KakarikoVillage:
#_1AB7D5: #_E8DCo: incbin "bin/music/song07.bin" ; size: 0x0535

Song08_MirrorWarp:
#_1ABD0A: #_EE11o: incbin "bin/music/song08.bin" ; size: 0x015C

Song09_DarkWorld:
#_1ABE66: #_EF6Do: incbin "bin/music/song09.bin" ; size: 0x08A6

Song0A_PullingTheMasterSword:
#_1AC70C: #_F813o: incbin "bin/music/song0A.bin" ; size: 0x00E3

Song0C_Fugitive:
#_1AC7EF: #_F8F6o: incbin "bin/music/song0C.bin" ; size: 0x0204

Song0F_IntroFanfare:
#_1AC9F3: #_FAFAo: incbin "bin/music/song0F.bin" ; size: 0x02B4

base off

;===================================================================================================

SongBank_Overworld_Auxiliary:
#_1ACCA7: dw $0688, SONG_POINTERS_AUX ; Transfer size, transfer address

base SONG_POINTERS_AUX

Song0D_SkullWoodsMarch:
#_1ACCAB: #_2B00o: incbin "bin/music/song0D.bin" ; size: 0x04A6

Song0E_MinigameTheme:
#_1AD151: #_2FA6o: incbin "bin/music/song0E.bin" ; size: 0x01E2

base off

;===================================================================================================

#_1AD333: dw $0000, SPC_ENGINE ; end of transfer

;===================================================================================================
; FREE ROM: 0x49
; including garbage
;===================================================================================================
GARBAGE_1AD337:
#_1AD337: db $77, $00, $00, $00, $00, $01, $FF, $00, $00

NULL_1AD340:
#_1AD340: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AD348: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AD350: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AD358: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AD360: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AD368: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AD370: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AD378: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

SongBank_Credits_Main:
#_1AD380: dw $1060, SONG_POINTERS ; Transfer size, transfer address

base SONG_POINTERS
#_1AD384: #_D000c: dw $0000
#_1AD386: #_D002c: dw $0000
#_1AD388: #_D004c: dw $0000
#_1AD38A: #_D006c: dw $0000
#_1AD38C: #_D008c: dw $0000
#_1AD38E: #_D00Ac: dw $0000
#_1AD390: #_D00Cc: dw $0000
#_1AD392: #_D00Ec: dw $0000
#_1AD394: #_D010c: dw $0000
#_1AD396: #_D012c: dw $0000
#_1AD398: #_D014c: dw $0000
#_1AD39A: #_D016c: dw $0000
#_1AD39C: #_D018c: dw $0000
#_1AD39E: #_D01Ac: dw $0000
#_1AD3A0: #_D01Cc: dw $0000
#_1AD3A2: #_D01Ec: dw $0000
#_1AD3A4: #_D020c: dw $0000
#_1AD3A6: #_D022c: dw $0000
#_1AD3A8: #_D024c: dw $0000
#_1AD3AA: #_D026c: dw $0000
#_1AD3AC: #_D028c: dw $0000
#_1AD3AE: #_D02Ac: dw $0000
#_1AD3B0: #_D02Cc: dw $0000
#_1AD3B2: #_D02Ec: dw $0000
#_1AD3B4: #_D030c: dw $0000
#_1AD3B6: #_D032c: dw $0000
#_1AD3B8: #_D034c: dw $0000
#_1AD3BA: #_D036c: dw $0000
#_1AD3BC: #_D038c: dw $0000
#_1AD3BE: #_D03Ac: dw $0000
#_1AD3C0: #_D03Cc: dw $0000
#_1AD3C2: #_D03Ec: dw Song20_TriforceRoom
#_1AD3C4: #_D040c: dw Song21_EndingTheme
#_1AD3C6: #_D042c: dw Song22_Credits
#_1AD3C8: #_D044c: dw $0000

;---------------------------------------------------------------------------------------------------

Song20_TriforceRoom:
#_1AD3CA: #_D046c: incbin "bin/music/song20.bin" ; size: 0x02B7

Song22_Credits:
#_1AD681: #_D2FDc: incbin "bin/music/song22.bin" ; size: 0x0D63

base off

;===================================================================================================

SongBank_Credits_Auxiliary:
#_1AE3E4: dw $1038, CREDITS_AUX_POINTER ; Transfer size, transfer address

base CREDITS_AUX_POINTER

Song21_EndingTheme:
#_1AE3E8: #_2900c: incbin "bin/music/song21.bin" ; size: 0x1038

base off

;===================================================================================================

#_1AF420: dw $0000, SPC_ENGINE ; end of transfer

;===================================================================================================

org $1B8000

;===================================================================================================

SongBank_Underworld_Main:
#_1B8000: dw $2CBF, SONG_POINTERS ; Transfer size, transfer address

base SONG_POINTERS

#_1B8004: #_D000u: dw $0000
#_1B8006: #_D002u: dw $0000
#_1B8008: #_D004u: dw $0000
#_1B800A: #_D006u: dw $0000
#_1B800C: #_D008u: dw $0000
#_1B800E: #_D00Au: dw $0000
#_1B8010: #_D00Cu: dw $0000
#_1B8012: #_D00Eu: dw $0000
#_1B8014: #_D010u: dw $0000
#_1B8016: #_D012u: dw $0000
#_1B8018: #_D014u: dw Song0B_FairyTheme
#_1B801A: #_D016u: dw $0000
#_1B801C: #_D018u: dw $0000
#_1B801E: #_D01Au: dw $0000
#_1B8020: #_D01Cu: dw $0000
#_1B8022: #_D01Eu: dw Song10_HyruleCastle
#_1B8024: #_D020u: dw Song11_PendantDungeon
#_1B8026: #_D022u: dw Song12_Cave
#_1B8028: #_D024u: dw Song13_Fanfare
#_1B802A: #_D026u: dw Song14_Sanctuary
#_1B802C: #_D028u: dw Song15_Boss
#_1B802E: #_D02Au: dw Song16_CrystalDungeon
#_1B8030: #_D02Cu: dw Song17_Shop
#_1B8032: #_D02Eu: dw Song12_Cave
#_1B8034: #_D030u: dw Song19_ZeldaRescue
#_1B8036: #_D032u: dw Song1A_CrystalMaiden
#_1B8038: #_D034u: dw Song1B_BigFairy
#_1B803A: #_D036u: dw Song1C_Suspense
#_1B803C: #_D038u: dw Song1D_AgahnimEscapes
#_1B803E: #_D03Au: dw Song1E_MeetingGanon
#_1B8040: #_D03Cu: dw Song1F_KingOfThieves
#_1B8042: #_D03Eu: dw $0000
#_1B8044: #_D040u: dw Song1D_AgahnimEscapes
#_1B8046: #_D042u: dw Song1E_MeetingGanon
#_1B8048: #_D044u: dw Song1F_KingOfThieves

;---------------------------------------------------------------------------------------------------

Song10_HyruleCastle:
#_1B804A: #_D046u: incbin "bin/music/song10.bin" ; size: 0x0BA6

Song11_PendantDungeon:
#_1B8BF0: #_DBECu: incbin "bin/music/song11.bin" ; size: 0x054E

Song12_Cave:
#_1B913E: #_E13Au: incbin "bin/music/song12.bin" ; size: 0x02F7

Song13_Fanfare:
#_1B9435: #_E431u: incbin "bin/music/song13.bin" ; size: 0x02C8

Song14_Sanctuary:
#_1B96FD: #_E6F9u: incbin "bin/music/song14.bin" ; size: 0x0225

Song15_Boss:
#_1B9922: #_E91Eu: incbin "bin/music/song15.bin" ; size: 0x02ED

Song16_CrystalDungeon:
#_1B9C0F: #_EC0Bu: incbin "bin/music/song16.bin" ; size: 0x05C6

Song17_Shop:
#_1BA1D5: #_F1D1u: incbin "bin/music/song17.bin" ; size: 0x0133

Song19_ZeldaRescue:
#_1BA308: #_F304u: incbin "bin/music/song19.bin" ; size: 0x027C

Song1A_CrystalMaiden:
#_1BA584: #_F580u: incbin "bin/music/song1A.bin" ; size: 0x0389

Song1B_BigFairy:
#_1BA90D: #_F909u: incbin "bin/music/song1B.bin" ; size: 0x0261

Song1C_Suspense:
#_1BAB6E: #_FB6Au: incbin "bin/music/song1C.bin" ; size: 0x0155

base off

;===================================================================================================

SongBank_Underworld_Auxiliary:
#_1BACC3: dw $050C, SONG_POINTERS_AUX ; Transfer size, transfer address

base SONG_POINTERS_AUX

Song1D_AgahnimEscapes:
#_1BACC7: #_2B00u: incbin "bin/music/song1D.bin" ; size: 0x00B3

Song1F_KingOfThieves:
#_1BAD7A: #_2BB3u: incbin "bin/music/song1F.bin" ; size: 0x03A6

Song1E_MeetingGanon:
#_1BB120: #_2F59u: incbin "bin/music/song1E.bin" ; size: 0x00B3

base off

;===================================================================================================

#_1BB1D3: dw $0000, SPC_ENGINE ; end of transfer

;===================================================================================================
