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
|198000| dw $0070, SAMPLE_POINTERS ; Transfer size, transfer address

site SAMPLE_POINTERS

|198004:3C00| dw $4000, $4012 ; 0x00 - Noise
|198008:3C04| dw $4048, $4063 ; 0x01 - Rain
|19800C:3C08| dw $47F2, $5395 ; 0x02 - Timpani
|198010:3C0C| dw $5395, $53B0 ; 0x03 - Square wave
|198014:3C10| dw $53D4, $53EF ; 0x04 - Saw wave
|198018:3C14| dw $5413, $542E ; 0x05 - Clink
|19801C:3C18| dw $5476, $54A3 ; 0x06 - Wobbly lead
|198020:3C1C| dw $550F, $5521 ; 0x07 - Compound saw
|198024:3C20| dw $55B1, $5B2D ; 0x08 - Tweet
|198028:3C24| dw $5B2D, $60BB ; 0x09 - Strings A
|19802C:3C28| dw $5B2D, $60BB ; 0x0A - Strings B
|198030:3C2C| dw $68AD, $6C9D ; 0x0B - Trombone
|198034:3C30| dw $6CD3, $7A65 ; 0x0C - Cymbal
|198038:3C34| dw $7A65, $7BFA ; 0x0D - Ocarina
|19803C:3C38| dw $7C03, $7C78 ; 0x0E - Chimes
|198040:3C3C| dw $7CDB, $7EA6 ; 0x0F - Harp
|198044:3C40| dw $7EC1, $867D ; 0x10 - Splash
|198048:3C44| dw $867D, $8D6A ; 0x11 - Trumpet
|19804C:3C48| dw $8D85, $944E ; 0x12 - Horn
|198050:3C4C| dw $948D, $A1BC ; 0x13 - Snare A
|198054:3C50| dw $948D, $A1BC ; 0x14 - Snare B
|198058:3C54| dw $A1BC, $A6E7 ; 0x15 - Choir
|19805C:3C58| dw $AEB5, $B0D1 ; 0x16 - Flute
|198060:3C5C| dw $B0EC, $B32C ; 0x17 - Oof
|198064:3C60| dw $B32C, $BA61 ; 0x18 - Piano
|198068:3C64| dw $FFFF, $FFFF ; 0x19 - null
|19806C:3C68| dw $FFFF, $FFFF ; 0x1A - null
|198070:3C6C| dw $FFFF, $FFFF ; 0x1B - null

site *

;===================================================================================================

SampleData:
|198074| dw $7AA0, SAMPLE_DATA ; Transfer size, transfer address

site SAMPLE_DATA

|198078:4000| incbin "bin/brr/noise.brr"
|1980C0:4048| incbin "bin/brr/rain.brr"
|19886A:47F2| incbin "bin/brr/timpani.brr"
|19940D:5395| incbin "bin/brr/square.brr"
|19944C:53D4| incbin "bin/brr/saw.brr"
|19948B:5413| incbin "bin/brr/clink.brr"
|1994EE:5476| incbin "bin/brr/wobbly.brr"
|199587:550F| incbin "bin/brr/compoundsaw.brr"
|199629:55B1| incbin "bin/brr/tweet.brr"
|199BA5:5B2D| incbin "bin/brr/strings.brr"
|19A925:68AD| incbin "bin/brr/trombone.brr"
|19AD4B:6CD3| incbin "bin/brr/cymbal.brr"
|19BADD:7A65| incbin "bin/brr/ocarina.brr"
|19BC7B:7C03| incbin "bin/brr/chime.brr"
|19BD53:7CDB| incbin "bin/brr/harp.brr"
|19BF39:7EC1| incbin "bin/brr/splash.brr"
|19C6F5:867D| incbin "bin/brr/trumpet.brr"
|19CDFD:8D85| incbin "bin/brr/horn.brr"
|19D505:948D| incbin "bin/brr/snare.brr"
|19E234:A1BC| incbin "bin/brr/choir.brr"
|19EF2D:AEB5| incbin "bin/brr/flute.brr"
|19F164:B0EC| incbin "bin/brr/OOF.brr"
|19F3A4:B32C| incbin "bin/brr/piano.brr"

site *

;===================================================================================================

InstrumentData:
|19FB18| dw $00AE, INSTRUMENT_DATA ; Transfer size, transfer address

site INSTRUMENT_DATA

; SRCN, ADSR1, ADSR2, GAIN, MULT (big endian)
|19FB1C:3D00| db $00, $FF, $E0, $B8, $04, $70 ; 0x00 - Noise
|19FB22:3D06| db $01, $FF, $E0, $B8, $07, $90 ; 0x01 - Rain
|19FB28:3D0C| db $02, $FF, $E0, $B8, $09, $C0 ; 0x02 - Timpani
|19FB2E:3D12| db $03, $FF, $E0, $B8, $04, $00 ; 0x03 - Square wave
|19FB34:3D18| db $04, $FF, $E0, $B8, $04, $00 ; 0x04 - Saw wave
|19FB3A:3D1E| db $05, $FF, $E0, $B8, $04, $70 ; 0x05 - Clink
|19FB40:3D24| db $06, $FF, $E0, $B8, $04, $70 ; 0x06 - Wobbly lead
|19FB46:3D2A| db $07, $FF, $E0, $B8, $04, $70 ; 0x07 - Compound saw
|19FB4C:3D30| db $08, $FF, $E0, $B8, $07, $A0 ; 0x08 - Tweet
|19FB52:3D36| db $09, $8F, $E9, $B8, $01, $E0 ; 0x09 - Strings A
|19FB58:3D3C| db $0A, $8A, $E9, $B8, $01, $E0 ; 0x0A - Strings B
|19FB5E:3D42| db $0B, $FF, $E0, $B8, $03, $00 ; 0x0B - Trombone
|19FB64:3D48| db $0C, $FF, $E0, $B8, $03, $A0 ; 0x0C - Cymbal
|19FB6A:3D4E| db $0D, $FF, $E0, $B8, $01, $00 ; 0x0D - Ocarina
|19FB70:3D54| db $0E, $FF, $EF, $B8, $0E, $A0 ; 0x0E - Chimes
|19FB76:3D5A| db $0F, $FF, $EF, $B8, $06, $00 ; 0x0F - Harp
|19FB7C:3D60| db $10, $FF, $E0, $B8, $03, $D0 ; 0x10 - Splash
|19FB82:3D66| db $11, $8F, $E0, $B8, $03, $00 ; 0x11 - Trumpet
|19FB88:3D6C| db $12, $8F, $E0, $B8, $06, $F0 ; 0x12 - Horn
|19FB8E:3D72| db $13, $FD, $E0, $B8, $07, $A0 ; 0x13 - Snare A
|19FB94:3D78| db $14, $FF, $E0, $B8, $07, $A0 ; 0x14 - Snare B
|19FB9A:3D7E| db $15, $FF, $E0, $B8, $03, $D0 ; 0x15 - Choir
|19FBA0:3D84| db $16, $8F, $E0, $B8, $03, $00 ; 0x16 - Flute
|19FBA6:3D8A| db $17, $FF, $E0, $B8, $02, $C0 ; 0x17 - Oof
|19FBAC:3D90| db $18, $FE, $8F, $B8, $06, $F0 ; 0x18 - Piano

;---------------------------------------------------------------------------------------------------

; stacc and attack table (dumb that it's here)
NoteStacc:
|19FBB2:3D96| db $32, $65, $7F, $98, $B2, $CB, $E5, $FC

NoteAttack:
|19FBBA:3D9E| db $19, $32, $4C, $65, $72, $7F, $8C, $98
|19FBC2:3DA6| db $A5, $B2, $BF, $CB, $D8, $E5, $F2, $FC

site *

;===================================================================================================

SPCEngine:
|19FBCA| dw $0F9E, SPC_ENGINE ; Transfer size, transfer address

incsrc "spc.asm"

;===================================================================================================

SFX_Data:
|1A8B6C| dw $1090, SFX_DATA ; Transfer size, transfer address

site SFX_DATA

;===================================================================================================

SFX1_Pointers:
|1A8B70:17C0| dw SFX1_01
|1A8B72:17C2| dw SFX1_02
|1A8B74:17C4| dw SFX1_03
|1A8B76:17C6| dw SFX1_04
|1A8B78:17C8| dw SFX1_05
|1A8B7A:17CA| dw SFX1_05
|1A8B7C:17CC| dw SFX1_07
|1A8B7E:17CE| dw SFX1_08
|1A8B80:17D0| dw SFX1_09
|1A8B82:17D2| dw SFX1_0A
|1A8B84:17D4| dw SFX1_0B
|1A8B86:17D6| dw SFX1_0C
|1A8B88:17D8| dw SFX1_0D
|1A8B8A:17DA| dw SFX1_0E
|1A8B8C:17DC| dw SFX1_0F
|1A8B8E:17DE| dw SFX1_10
|1A8B90:17E0| dw SFX1_11
|1A8B92:17E2| dw SFX1_12
|1A8B94:17E4| dw SFX1_13
|1A8B96:17E6| dw SFX1_14
|1A8B98:17E8| dw SFX1_15
|1A8B9A:17EA| dw SFX1_16
|1A8B9C:17EC| dw SFX1_17
|1A8B9E:17EE| dw SFX1_18
|1A8BA0:17F0| dw $0000
|1A8BA2:17F2| dw $0000
|1A8BA4:17F4| dw SFX1_0B
|1A8BA6:17F6| dw SFX1_0C
|1A8BA8:17F8| dw SFX1_0D
|1A8BAA:17FA| dw SFX1_0E
|1A8BAC:17FC| dw SFX1_0F
|1A8BAE:17FE| dw SFX1_10

;---------------------------------------------------------------------------------------------------

SFX1_Accomp:
|1A8BB0:1800| db $02 ; SFX1 01
|1A8BB1:1801| db $00 ; SFX1 02
|1A8BB2:1802| db $04 ; SFX1 03
|1A8BB3:1803| db $00 ; SFX1 04
|1A8BB4:1804| db $06 ; SFX1 05
|1A8BB5:1805| db $00 ; SFX1 06
|1A8BB6:1806| db $08 ; SFX1 07
|1A8BB7:1807| db $00 ; SFX1 08
|1A8BB8:1808| db $0A ; SFX1 09
|1A8BB9:1809| db $00 ; SFX1 0A
|1A8BBA:180A| db $0C ; SFX1 0B
|1A8BBB:180B| db $00 ; SFX1 0C
|1A8BBC:180C| db $0E ; SFX1 0D
|1A8BBD:180D| db $00 ; SFX1 0E
|1A8BBE:180E| db $10 ; SFX1 0F
|1A8BBF:180F| db $00 ; SFX1 10
|1A8BC0:1810| db $12 ; SFX1 11
|1A8BC1:1811| db $00 ; SFX1 12
|1A8BC2:1812| db $14 ; SFX1 13
|1A8BC3:1813| db $00 ; SFX1 14
|1A8BC4:1814| db $16 ; SFX1 15
|1A8BC5:1815| db $00 ; SFX1 16
|1A8BC6:1816| db $18 ; SFX1 17
|1A8BC7:1817| db $00 ; SFX1 18
|1A8BC8:1818| db $1A ; SFX1 19
|1A8BC9:1819| db $00 ; SFX1 1A
|1A8BCA:181A| db $1C ; SFX1 1B
|1A8BCB:181B| db $00 ; SFX1 1C
|1A8BCC:181C| db $1E ; SFX1 1D
|1A8BCD:181D| db $00 ; SFX1 1E
|1A8BCE:181E| db $20 ; SFX1 1F
|1A8BCF:181F| db $00 ; SFX1 20

;===================================================================================================

SFX2_Pointers:
|1A8BD0:1820| dw SFX2_01
|1A8BD2:1822| dw SFX2_02
|1A8BD4:1824| dw SFX2_03
|1A8BD6:1826| dw SFX2_04
|1A8BD8:1828| dw SFX2_05
|1A8BDA:182A| dw SFX2_06
|1A8BDC:182C| dw SFX2_07
|1A8BDE:182E| dw SFX2_08
|1A8BE0:1830| dw SFX2_09
|1A8BE2:1832| dw SFX2_0A
|1A8BE4:1834| dw SFX2_0B
|1A8BE6:1836| dw SFX2_0C
|1A8BE8:1838| dw SFX2_0D
|1A8BEA:183A| dw SFX2_0E
|1A8BEC:183C| dw SFX2_0F
|1A8BEE:183E| dw SFX2_10
|1A8BF0:1840| dw SFX2_11
|1A8BF2:1842| dw SFX2_12
|1A8BF4:1844| dw SFX2_13
|1A8BF6:1846| dw SFX2_14
|1A8BF8:1848| dw SFX2_15
|1A8BFA:184A| dw SFX2_16
|1A8BFC:184C| dw SFX2_17
|1A8BFE:184E| dw SFX2_18
|1A8C00:1850| dw SFX2_19
|1A8C02:1852| dw SFX2_1A
|1A8C04:1854| dw SFX2_1B
|1A8C06:1856| dw SFX2_1C
|1A8C08:1858| dw SFX2_1D
|1A8C0A:185A| dw SFX2_1E
|1A8C0C:185C| dw SFX2_1F
|1A8C0E:185E| dw SFX2_20
|1A8C10:1860| dw SFX2_21
|1A8C12:1862| dw SFX2_22
|1A8C14:1864| dw SFX2_23
|1A8C16:1866| dw SFX2_24
|1A8C18:1868| dw SFX2_25
|1A8C1A:186A| dw SFX2_26
|1A8C1C:186C| dw SFX2_27
|1A8C1E:186E| dw SFX2_28
|1A8C20:1870| dw SFX2_29
|1A8C22:1872| dw SFX2_2A
|1A8C24:1874| dw SFX2_2B
|1A8C26:1876| dw SFX2_2C
|1A8C28:1878| dw SFX2_2D
|1A8C2A:187A| dw SFX2_2E
|1A8C2C:187C| dw SFX2_2F
|1A8C2E:187E| dw SFX2_30
|1A8C30:1880| dw SFX2_31
|1A8C32:1882| dw SFX2_32
|1A8C34:1884| dw SFX2_33
|1A8C36:1886| dw SFX2_34
|1A8C38:1888| dw SFX2_35
|1A8C3A:188A| dw SFX2_36
|1A8C3C:188C| dw SFX2_37
|1A8C3E:188E| dw SFX2_34
|1A8C40:1890| dw SFX2_39
|1A8C42:1892| dw SFX2_3A
|1A8C44:1894| dw SFX2_3B
|1A8C46:1896| dw SFX2_3C
|1A8C48:1898| dw SFX2_3D
|1A8C4A:189A| dw SFX2_3E
|1A8C4C:189C| dw SFX2_3F

;---------------------------------------------------------------------------------------------------

SFX2_Accomp:
|1A8C4E:189E| db $00 ; SFX2 01
|1A8C4F:189F| db $00 ; SFX2 02
|1A8C50:18A0| db $00 ; SFX2 03
|1A8C51:18A1| db $00 ; SFX2 04
|1A8C52:18A2| db $00 ; SFX2 05
|1A8C53:18A3| db $00 ; SFX2 06
|1A8C54:18A4| db $00 ; SFX2 07
|1A8C55:18A5| db $00 ; SFX2 08
|1A8C56:18A6| db $00 ; SFX2 09
|1A8C57:18A7| db $00 ; SFX2 0A
|1A8C58:18A8| db $00 ; SFX2 0B
|1A8C59:18A9| db $00 ; SFX2 0C
|1A8C5A:18AA| db $3F ; SFX2 0D
|1A8C5B:18AB| db $00 ; SFX2 0E
|1A8C5C:18AC| db $00 ; SFX2 0F
|1A8C5D:18AD| db $00 ; SFX2 10
|1A8C5E:18AE| db $00 ; SFX2 11
|1A8C5F:18AF| db $00 ; SFX2 12
|1A8C60:18B0| db $3E ; SFX2 13
|1A8C61:18B1| db $00 ; SFX2 14
|1A8C62:18B2| db $00 ; SFX2 15
|1A8C63:18B3| db $00 ; SFX2 16
|1A8C64:18B4| db $00 ; SFX2 17
|1A8C65:18B5| db $00 ; SFX2 18
|1A8C66:18B6| db $00 ; SFX2 19
|1A8C67:18B7| db $00 ; SFX2 1A
|1A8C68:18B8| db $00 ; SFX2 1B
|1A8C69:18B9| db $00 ; SFX2 1C
|1A8C6A:18BA| db $00 ; SFX2 1D
|1A8C6B:18BB| db $00 ; SFX2 1E
|1A8C6C:18BC| db $00 ; SFX2 1F
|1A8C6D:18BD| db $00 ; SFX2 20
|1A8C6E:18BE| db $00 ; SFX2 21
|1A8C6F:18BF| db $00 ; SFX2 22
|1A8C70:18C0| db $00 ; SFX2 23
|1A8C71:18C1| db $3D ; SFX2 24
|1A8C72:18C2| db $00 ; SFX2 25
|1A8C73:18C3| db $00 ; SFX2 26
|1A8C74:18C4| db $00 ; SFX2 27
|1A8C75:18C5| db $00 ; SFX2 28
|1A8C76:18C6| db $3B ; SFX2 29
|1A8C77:18C7| db $00 ; SFX2 2A
|1A8C78:18C8| db $00 ; SFX2 2B
|1A8C79:18C9| db $3A ; SFX2 2C
|1A8C7A:18CA| db $00 ; SFX2 2D
|1A8C7B:18CB| db $39 ; SFX2 2E
|1A8C7C:18CC| db $38 ; SFX2 2F
|1A8C7D:18CD| db $00 ; SFX2 30
|1A8C7E:18CE| db $00 ; SFX2 31
|1A8C7F:18CF| db $00 ; SFX2 32
|1A8C80:18D0| db $00 ; SFX2 33
|1A8C81:18D1| db $33 ; SFX2 34
|1A8C82:18D2| db $36 ; SFX2 35
|1A8C83:18D3| db $00 ; SFX2 36
|1A8C84:18D4| db $00 ; SFX2 37
|1A8C85:18D5| db $00 ; SFX2 38
|1A8C86:18D6| db $00 ; SFX2 39
|1A8C87:18D7| db $00 ; SFX2 3A
|1A8C88:18D8| db $00 ; SFX2 3B
|1A8C89:18D9| db $00 ; SFX2 3C
|1A8C8A:18DA| db $00 ; SFX2 3D
|1A8C8B:18DB| db $00 ; SFX2 3E
|1A8C8C:18DC| db $00 ; SFX2 3F

;---------------------------------------------------------------------------------------------------

SFX2_Echo:
|1A8C8D:18DD| db $00 ; SFX2 01
|1A8C8E:18DE| db $00 ; SFX2 02
|1A8C8F:18DF| db $00 ; SFX2 03
|1A8C90:18E0| db $00 ; SFX2 04
|1A8C91:18E1| db $00 ; SFX2 05
|1A8C92:18E2| db $00 ; SFX2 06
|1A8C93:18E3| db $00 ; SFX2 07
|1A8C94:18E4| db $00 ; SFX2 08
|1A8C95:18E5| db $00 ; SFX2 09
|1A8C96:18E6| db $00 ; SFX2 0A
|1A8C97:18E7| db $00 ; SFX2 0B
|1A8C98:18E8| db $01 ; SFX2 0C
|1A8C99:18E9| db $00 ; SFX2 0D
|1A8C9A:18EA| db $00 ; SFX2 0E
|1A8C9B:18EB| db $00 ; SFX2 0F
|1A8C9C:18EC| db $00 ; SFX2 10
|1A8C9D:18ED| db $00 ; SFX2 11
|1A8C9E:18EE| db $00 ; SFX2 12
|1A8C9F:18EF| db $00 ; SFX2 13
|1A8CA0:18F0| db $00 ; SFX2 14
|1A8CA1:18F1| db $00 ; SFX2 15
|1A8CA2:18F2| db $00 ; SFX2 16
|1A8CA3:18F3| db $00 ; SFX2 17
|1A8CA4:18F4| db $00 ; SFX2 18
|1A8CA5:18F5| db $00 ; SFX2 19
|1A8CA6:18F6| db $00 ; SFX2 1A
|1A8CA7:18F7| db $00 ; SFX2 1B
|1A8CA8:18F8| db $00 ; SFX2 1C
|1A8CA9:18F9| db $00 ; SFX2 1D
|1A8CAA:18FA| db $00 ; SFX2 1E
|1A8CAB:18FB| db $00 ; SFX2 1F
|1A8CAC:18FC| db $00 ; SFX2 20
|1A8CAD:18FD| db $00 ; SFX2 21
|1A8CAE:18FE| db $00 ; SFX2 22
|1A8CAF:18FF| db $00 ; SFX2 23
|1A8CB0:1900| db $00 ; SFX2 24
|1A8CB1:1901| db $00 ; SFX2 25
|1A8CB2:1902| db $00 ; SFX2 26
|1A8CB3:1903| db $00 ; SFX2 27
|1A8CB4:1904| db $00 ; SFX2 28
|1A8CB5:1905| db $3B ; SFX2 29
|1A8CB6:1906| db $01 ; SFX2 2A
|1A8CB7:1907| db $01 ; SFX2 2B
|1A8CB8:1908| db $00 ; SFX2 2C
|1A8CB9:1909| db $01 ; SFX2 2D
|1A8CBA:190A| db $01 ; SFX2 2E
|1A8CBB:190B| db $01 ; SFX2 2F
|1A8CBC:190C| db $00 ; SFX2 30
|1A8CBD:190D| db $00 ; SFX2 31
|1A8CBE:190E| db $00 ; SFX2 32
|1A8CBF:190F| db $00 ; SFX2 33
|1A8CC0:1910| db $00 ; SFX2 34
|1A8CC1:1911| db $01 ; SFX2 35
|1A8CC2:1912| db $01 ; SFX2 36
|1A8CC3:1913| db $00 ; SFX2 37
|1A8CC4:1914| db $00 ; SFX2 38
|1A8CC5:1915| db $00 ; SFX2 39
|1A8CC6:1916| db $00 ; SFX2 3A
|1A8CC7:1917| db $00 ; SFX2 3B
|1A8CC8:1918| db $01 ; SFX2 3C
|1A8CC9:1919| db $00 ; SFX2 3D
|1A8CCA:191A| db $3C ; SFX2 3E
|1A8CCB:191B| db $00 ; SFX2 3F

;===================================================================================================

SFX3_Pointers:
|1A8CCC:191C| dw SFX3_01
|1A8CCE:191E| dw SFX3_02
|1A8CD0:1920| dw SFX3_03
|1A8CD2:1922| dw SFX3_04
|1A8CD4:1924| dw SFX2_07
|1A8CD6:1926| dw SFX3_06
|1A8CD8:1928| dw SFX3_07
|1A8CDA:192A| dw SFX3_08
|1A8CDC:192C| dw SFX3_09
|1A8CDE:192E| dw SFX3_0A
|1A8CE0:1930| dw SFX3_0B
|1A8CE2:1932| dw SFX3_0C
|1A8CE4:1934| dw SFX3_0D
|1A8CE6:1936| dw SFX3_0E
|1A8CE8:1938| dw SFX3_0F
|1A8CEA:193A| dw SFX3_10
|1A8CEC:193C| dw SFX3_11
|1A8CEE:193E| dw SFX3_12
|1A8CF0:1940| dw SFX3_13
|1A8CF2:1942| dw SFX3_14
|1A8CF4:1944| dw SFX3_15
|1A8CF6:1946| dw SFX3_16
|1A8CF8:1948| dw SFX3_17
|1A8CFA:194A| dw SFX3_18
|1A8CFC:194C| dw SFX3_19
|1A8CFE:194E| dw SFX3_1A
|1A8D00:1950| dw SFX3_1B
|1A8D02:1952| dw SFX3_1C
|1A8D04:1954| dw SFX2_2D
|1A8D06:1956| dw SFX3_1E
|1A8D08:1958| dw SFX3_1F
|1A8D0A:195A| dw SFX3_20
|1A8D0C:195C| dw SFX3_21
|1A8D0E:195E| dw SFX3_22
|1A8D10:1960| dw SFX3_23
|1A8D12:1962| dw SFX3_24
|1A8D14:1964| dw SFX3_25
|1A8D16:1966| dw SFX3_26
|1A8D18:1968| dw SFX3_27
|1A8D1A:196A| dw SFX3_28
|1A8D1C:196C| dw SFX3_29
|1A8D1E:196E| dw SFX3_2A
|1A8D20:1970| dw SFX3_2B
|1A8D22:1972| dw SFX3_2C
|1A8D24:1974| dw SFX3_2D
|1A8D26:1976| dw SFX3_2E
|1A8D28:1978| dw SFX3_2F
|1A8D2A:197A| dw SFX3_30
|1A8D2C:197C| dw SFX3_31
|1A8D2E:197E| dw SFX3_32
|1A8D30:1980| dw SFX3_33
|1A8D32:1982| dw SFX3_34
|1A8D34:1984| dw SFX3_35
|1A8D36:1986| dw SFX3_36
|1A8D38:1988| dw SFX3_37
|1A8D3A:198A| dw SFX3_38
|1A8D3C:198C| dw SFX3_39
|1A8D3E:198E| dw SFX3_3A
|1A8D40:1990| dw SFX3_3B
|1A8D42:1992| dw SFX3_3C
|1A8D44:1994| dw SFX3_3D
|1A8D46:1996| dw SFX3_3E
|1A8D48:1998| dw SFX3_3F

;---------------------------------------------------------------------------------------------------

SFX3_Accomp:
|1A8D4A:199A| db $00 ; SFX3 01
|1A8D4B:199B| db $00 ; SFX3 02
|1A8D4C:199C| db $00 ; SFX3 03
|1A8D4D:199D| db $00 ; SFX3 04
|1A8D4E:199E| db $00 ; SFX3 05
|1A8D4F:199F| db $00 ; SFX3 06
|1A8D50:19A0| db $00 ; SFX3 07
|1A8D51:19A1| db $00 ; SFX3 08
|1A8D52:19A2| db $00 ; SFX3 09
|1A8D53:19A3| db $00 ; SFX3 0A
|1A8D54:19A4| db $00 ; SFX3 0B
|1A8D55:19A5| db $00 ; SFX3 0C
|1A8D56:19A6| db $00 ; SFX3 0D
|1A8D57:19A7| db $00 ; SFX3 0E
|1A8D58:19A8| db $3C ; SFX3 0F
|1A8D59:19A9| db $3B ; SFX3 10
|1A8D5A:19AA| db $00 ; SFX3 11
|1A8D5B:19AB| db $00 ; SFX3 12
|1A8D5C:19AC| db $00 ; SFX3 13
|1A8D5D:19AD| db $00 ; SFX3 14
|1A8D5E:19AE| db $00 ; SFX3 15
|1A8D5F:19AF| db $00 ; SFX3 16
|1A8D60:19B0| db $00 ; SFX3 17
|1A8D61:19B1| db $00 ; SFX3 18
|1A8D62:19B2| db $00 ; SFX3 19
|1A8D63:19B3| db $38 ; SFX3 1A
|1A8D64:19B4| db $3A ; SFX3 1B
|1A8D65:19B5| db $00 ; SFX3 1C
|1A8D66:19B6| db $00 ; SFX3 1D
|1A8D67:19B7| db $00 ; SFX3 1E
|1A8D68:19B8| db $00 ; SFX3 1F
|1A8D69:19B9| db $00 ; SFX3 20
|1A8D6A:19BA| db $00 ; SFX3 21
|1A8D6B:19BB| db $00 ; SFX3 22
|1A8D6C:19BC| db $39 ; SFX3 23
|1A8D6D:19BD| db $00 ; SFX3 24
|1A8D6E:19BE| db $00 ; SFX3 25
|1A8D6F:19BF| db $00 ; SFX3 26
|1A8D70:19C0| db $00 ; SFX3 27
|1A8D71:19C1| db $00 ; SFX3 28
|1A8D72:19C2| db $00 ; SFX3 29
|1A8D73:19C3| db $00 ; SFX3 2A
|1A8D74:19C4| db $00 ; SFX3 2B
|1A8D75:19C5| db $00 ; SFX3 2C
|1A8D76:19C6| db $37 ; SFX3 2D
|1A8D77:19C7| db $35 ; SFX3 2E
|1A8D78:19C8| db $33 ; SFX3 2F
|1A8D79:19C9| db $00 ; SFX3 30
|1A8D7A:19CA| db $00 ; SFX3 31
|1A8D7B:19CB| db $00 ; SFX3 32
|1A8D7C:19CC| db $00 ; SFX3 33
|1A8D7D:19CD| db $00 ; SFX3 34
|1A8D7E:19CE| db $34 ; SFX3 35
|1A8D7F:19CF| db $00 ; SFX3 36
|1A8D80:19D0| db $00 ; SFX3 37
|1A8D81:19D1| db $00 ; SFX3 38
|1A8D82:19D2| db $00 ; SFX3 39
|1A8D83:19D3| db $00 ; SFX3 3A
|1A8D84:19D4| db $00 ; SFX3 3B
|1A8D85:19D5| db $3D ; SFX3 3C
|1A8D86:19D6| db $3E ; SFX3 3D
|1A8D87:19D7| db $3F ; SFX3 3E
|1A8D88:19D8| db $00 ; SFX3 3F

;---------------------------------------------------------------------------------------------------

SFX3_Echo:
|1A8D89:19D9| db $00 ; SFX3 01
|1A8D8A:19DA| db $00 ; SFX3 02
|1A8D8B:19DB| db $00 ; SFX3 03
|1A8D8C:19DC| db $00 ; SFX3 04
|1A8D8D:19DD| db $00 ; SFX3 05
|1A8D8E:19DE| db $00 ; SFX3 06
|1A8D8F:19DF| db $00 ; SFX3 07
|1A8D90:19E0| db $00 ; SFX3 08
|1A8D91:19E1| db $00 ; SFX3 09
|1A8D92:19E2| db $00 ; SFX3 0A
|1A8D93:19E3| db $00 ; SFX3 0B
|1A8D94:19E4| db $01 ; SFX3 0C
|1A8D95:19E5| db $01 ; SFX3 0D
|1A8D96:19E6| db $00 ; SFX3 0E
|1A8D97:19E7| db $3C ; SFX3 0F
|1A8D98:19E8| db $3B ; SFX3 10
|1A8D99:19E9| db $01 ; SFX3 11
|1A8D9A:19EA| db $01 ; SFX3 12
|1A8D9B:19EB| db $00 ; SFX3 13
|1A8D9C:19EC| db $00 ; SFX3 14
|1A8D9D:19ED| db $00 ; SFX3 15
|1A8D9E:19EE| db $00 ; SFX3 16
|1A8D9F:19EF| db $00 ; SFX3 17
|1A8DA0:19F0| db $00 ; SFX3 18
|1A8DA1:19F1| db $00 ; SFX3 19
|1A8DA2:19F2| db $00 ; SFX3 1A
|1A8DA3:19F3| db $3A ; SFX3 1B
|1A8DA4:19F4| db $00 ; SFX3 1C
|1A8DA5:19F5| db $01 ; SFX3 1D
|1A8DA6:19F6| db $00 ; SFX3 1E
|1A8DA7:19F7| db $01 ; SFX3 1F
|1A8DA8:19F8| db $01 ; SFX3 20
|1A8DA9:19F9| db $01 ; SFX3 21
|1A8DAA:19FA| db $01 ; SFX3 22
|1A8DAB:19FB| db $00 ; SFX3 23
|1A8DAC:19FC| db $01 ; SFX3 24
|1A8DAD:19FD| db $00 ; SFX3 25
|1A8DAE:19FE| db $00 ; SFX3 26
|1A8DAF:19FF| db $00 ; SFX3 27
|1A8DB0:1A00| db $00 ; SFX3 28
|1A8DB1:1A01| db $00 ; SFX3 29
|1A8DB2:1A02| db $00 ; SFX3 2A
|1A8DB3:1A03| db $00 ; SFX3 2B
|1A8DB4:1A04| db $00 ; SFX3 2C
|1A8DB5:1A05| db $01 ; SFX3 2D
|1A8DB6:1A06| db $01 ; SFX3 2E
|1A8DB7:1A07| db $01 ; SFX3 2F
|1A8DB8:1A08| db $00 ; SFX3 30
|1A8DB9:1A09| db $01 ; SFX3 31
|1A8DBA:1A0A| db $00 ; SFX3 32
|1A8DBB:1A0B| db $01 ; SFX3 33
|1A8DBC:1A0C| db $01 ; SFX3 34
|1A8DBD:1A0D| db $01 ; SFX3 35
|1A8DBE:1A0E| db $00 ; SFX3 36
|1A8DBF:1A0F| db $01 ; SFX3 37
|1A8DC0:1A10| db $00 ; SFX3 38
|1A8DC1:1A11| db $00 ; SFX3 39
|1A8DC2:1A12| db $00 ; SFX3 3A
|1A8DC3:1A13| db $00 ; SFX3 3B
|1A8DC4:1A14| db $3D ; SFX3 3C
|1A8DC5:1A15| db $3E ; SFX3 3D
|1A8DC6:1A16| db $3F ; SFX3 3E
|1A8DC7:1A17| db $01 ; SFX3 3F

;===================================================================================================
; Sound effects
;===================================================================================================
|1A8DC8:1A18| SFX3_01: incbin "bin/sfx/sfx3-01.sfx"            ; size: 0x001F
|1A8DE7:1A37| SFX2_3C: incbin "bin/sfx/sfx2-3C.sfx"            ; size: 0x000C
|1A8DF3:1A43| SFX2_37: incbin "bin/sfx/sfx2-37.sfx"            ; size: 0x0018
|1A8E0B:1A5B| UnusedSFX_1A5B: incbin "bin/sfx/unused-1A5B.sfx" ; size: 0x0007
|1A8E12:1A62| SFX3_1C: incbin "bin/sfx/sfx3-1C.sfx"            ; size: 0x0016
|1A8E28:1A78| SFX3_32: incbin "bin/sfx/sfx3-32.sfx"            ; size: 0x002F
|1A8E57:1AA7| SFX3_36: incbin "bin/sfx/sfx3-36.sfx"            ; size: 0x0023
|1A8E7A:1ACA| SFX3_31: incbin "bin/sfx/sfx3-31.sfx"            ; size: 0x0008
|1A8E82:1AD2| SFX1_13: incbin "bin/sfx/sfx1-13.sfx"            ; size: 0x000F
|1A8E91:1AE1| SFX1_14: incbin "bin/sfx/sfx1-14.sfx"            ; size: 0x000F
|1A8EA0:1AF0| SFX1_15: incbin "bin/sfx/sfx1-15.sfx"            ; size: 0x000F
|1A8EAF:1AFF| SFX1_16: incbin "bin/sfx/sfx1-16.sfx"            ; size: 0x000F
|1A8EBE:1B0E| SFX1_0D: incbin "bin/sfx/sfx1-0D.sfx"            ; size: 0x000F
|1A8ECD:1B1D| SFX1_0E: incbin "bin/sfx/sfx1-0E.sfx"            ; size: 0x000F
|1A8EDC:1B2C| SFX1_0F: incbin "bin/sfx/sfx1-0F.sfx"            ; size: 0x0012
|1A8EEE:1B3E| SFX1_10: incbin "bin/sfx/sfx1-10.sfx"            ; size: 0x0015
|1A8F03:1B53| SFX3_30: incbin "bin/sfx/sfx3-30.sfx"            ; size: 0x000F
|1A8F12:1B62| SFX1_0C: incbin "bin/sfx/sfx1-0C.sfx"            ; size: 0x0041
|1A8F53:1BA3| SFX1_0B: incbin "bin/sfx/sfx1-0B.sfx"            ; size: 0x0040
|1A8F93:1BE3| SFX1_18: incbin "bin/sfx/sfx1-18.sfx"            ; size: 0x0041
|1A8FD4:1C24| SFX1_17: incbin "bin/sfx/sfx1-17.sfx"            ; size: 0x0040
|1A9014:1C64| SFX2_36: incbin "bin/sfx/sfx2-36.sfx"            ; size: 0x0003
|1A9017:1C67| SFX2_35: incbin "bin/sfx/sfx2-35.sfx"            ; size: 0x0027
|1A903E:1C8E| SFX1_09: incbin "bin/sfx/sfx1-09.sfx"            ; size: 0x002E
|1A906C:1CBC| SFX1_0A: incbin "bin/sfx/sfx1-0A.sfx"            ; size: 0x0020
|1A908C:1CDC| SFX2_33: incbin "bin/sfx/sfx2-33.sfx"            ; size: 0x0040
|1A90CC:1D1C| UnusedSFX_1D1C: incbin "bin/sfx/unused-1D1C.sfx" ; size: 0x002B
|1A90F7:1D47| SFX2_32: incbin "bin/sfx/sfx2-32.sfx"            ; size: 0x0016
|1A910D:1D5D| SFX3_2E: incbin "bin/sfx/sfx3-2E.sfx"            ; size: 0x0009
|1A9116:1D66| SFX3_34: incbin "bin/sfx/sfx3-34.sfx"            ; size: 0x000D
|1A9123:1D73| SFX3_35: incbin "bin/sfx/sfx3-35.sfx"            ; size: 0x000D
|1A9130:1D80| SFX3_2F: incbin "bin/sfx/sfx3-2F.sfx"            ; size: 0x0013
|1A9143:1D93| SFX3_33: incbin "bin/sfx/sfx3-33.sfx"            ; size: 0x0016
|1A9159:1DA9| SFX3_2D: incbin "bin/sfx/sfx3-2D.sfx"            ; size: 0x000B
|1A9164:1DB4| SFX3_37: incbin "bin/sfx/sfx3-37.sfx"            ; size: 0x000C
|1A9170:1DC0| SFX3_2C: incbin "bin/sfx/sfx3-2C.sfx"            ; size: 0x0033
|1A91A3:1DF3| SFX3_2B: incbin "bin/sfx/sfx3-2B.sfx"            ; size: 0x001F
|1A91C2:1E12| SFX3_2A: incbin "bin/sfx/sfx3-2A.sfx"            ; size: 0x000F
|1A91D1:1E21| SFX3_29: incbin "bin/sfx/sfx3-29.sfx"            ; size: 0x001F
|1A91F0:1E40| SFX3_27: incbin "bin/sfx/sfx3-27.sfx"            ; size: 0x003B
|1A922B:1E7B| SFX3_26: incbin "bin/sfx/sfx3-26.sfx"            ; size: 0x000F
|1A923A:1E8A| SFX3_1A: incbin "bin/sfx/sfx3-1A.sfx"            ; size: 0x0009
|1A9243:1E93| SFX3_38: incbin "bin/sfx/sfx3-38.sfx"            ; size: 0x000A
|1A924D:1E9D| SFX3_25: incbin "bin/sfx/sfx3-25.sfx"            ; size: 0x000F
|1A925C:1EAC| SFX1_11: incbin "bin/sfx/sfx1-11.sfx"            ; size: 0x001C
|1A9278:1EC8| SFX1_12: incbin "bin/sfx/sfx1-12.sfx"            ; size: 0x001A
|1A9292:1EE2| UnusedSFX_1EE2: incbin "bin/sfx/unused-1EE2.sfx" ; size: 0x000F
|1A92A1:1EF1| SFX2_30: incbin "bin/sfx/sfx2-30.sfx"            ; size: 0x0022
|1A92C3:1F13| UnusedSFX_1F13: incbin "bin/sfx/unused-1F13.sfx" ; size: 0x0034
|1A92F7:1F47| SFX2_2F: incbin "bin/sfx/sfx2-2F.sfx"            ; size: 0x0028
|1A931F:1F6F| SFX2_34: incbin "bin/sfx/sfx2-34.sfx"            ; size: 0x002D
|1A934C:1F9C| SFX2_39: incbin "bin/sfx/sfx2-39.sfx"            ; size: 0x002E
|1A937A:1FCA| SFX2_2E: incbin "bin/sfx/sfx2-2E.sfx"            ; size: 0x000F
|1A9389:1FD9| SFX2_2C: incbin "bin/sfx/sfx2-2C.sfx"            ; size: 0x000E
|1A9397:1FE7| SFX2_3A: incbin "bin/sfx/sfx2-3A.sfx"            ; size: 0x000B
|1A93A2:1FF2| SFX2_2B: incbin "bin/sfx/sfx2-2B.sfx"            ; size: 0x000F
|1A93B1:2001| SFX3_23: incbin "bin/sfx/sfx3-23.sfx"            ; size: 0x0016
|1A93C7:2017| SFX3_39: incbin "bin/sfx/sfx3-39.sfx"            ; size: 0x001C
|1A93E3:2033| SFX2_2A: incbin "bin/sfx/sfx2-2A.sfx"            ; size: 0x0010
|1A93F3:2043| SFX3_24: incbin "bin/sfx/sfx3-24.sfx"            ; size: 0x0008
|1A93FB:204B| SFX3_1F: incbin "bin/sfx/sfx3-1F.sfx"            ; size: 0x0046
|1A9441:2091| SFX3_1E: incbin "bin/sfx/sfx3-1E.sfx"            ; size: 0x0015
|1A9456:20A6| SFX2_2D: incbin "bin/sfx/sfx2-2D.sfx"            ; size: 0x0010
|1A9466:20B6| SFX3_1B: incbin "bin/sfx/sfx3-1B.sfx"            ; size: 0x000A
|1A9470:20C0| SFX3_3A: incbin "bin/sfx/sfx3-3A.sfx"            ; size: 0x000E
|1A947E:20CE| SFX2_31: incbin "bin/sfx/sfx2-31.sfx"            ; size: 0x000F
|1A948D:20DD| SFX3_18: incbin "bin/sfx/sfx3-18.sfx"            ; size: 0x002A
|1A94B7:2107| SFX2_22: incbin "bin/sfx/sfx2-22.sfx"            ; size: 0x001C
|1A94D3:2123| SFX3_16: incbin "bin/sfx/sfx3-16.sfx"            ; size: 0x000C
|1A94DF:212F| SFX3_15: incbin "bin/sfx/sfx3-15.sfx"            ; size: 0x000C
|1A94EB:213B| SFX3_13: incbin "bin/sfx/sfx3-13.sfx"            ; size: 0x0014
|1A94FF:214F| SFX3_11: incbin "bin/sfx/sfx3-11.sfx"            ; size: 0x000F
|1A950E:215E| SFX3_12: incbin "bin/sfx/sfx3-12.sfx"            ; size: 0x000F
|1A951D:216D| SFX3_10: incbin "bin/sfx/sfx3-10.sfx"            ; size: 0x0009
|1A9526:2176| SFX3_3B: incbin "bin/sfx/sfx3-3B.sfx"            ; size: 0x000C
|1A9532:2182| SFX3_0E: incbin "bin/sfx/sfx3-0E.sfx"            ; size: 0x000C
|1A953E:218E| SFX3_0C: incbin "bin/sfx/sfx3-0C.sfx"            ; size: 0x000A
|1A9548:2198| SFX3_0B: incbin "bin/sfx/sfx3-0B.sfx"            ; size: 0x0011
|1A9559:21A9| SFX3_0A: incbin "bin/sfx/sfx3-0A.sfx"            ; size: 0x000C
|1A9565:21B5| SFX3_0D: incbin "bin/sfx/sfx3-0D.sfx"            ; size: 0x000C
|1A9571:21C1| SFX3_09: incbin "bin/sfx/sfx3-09.sfx"            ; size: 0x0025
|1A9596:21E6| SFX3_08: incbin "bin/sfx/sfx3-08.sfx"            ; size: 0x000F
|1A95A5:21F5| SFX3_06: incbin "bin/sfx/sfx3-06.sfx"            ; size: 0x0019
|1A95BE:220E| SFX3_04: incbin "bin/sfx/sfx3-04.sfx"            ; size: 0x002F
|1A95ED:223D| SFX3_07: incbin "bin/sfx/sfx3-07.sfx"            ; size: 0x000D
|1A95FA:224A| SFX3_03: incbin "bin/sfx/sfx3-03.sfx"            ; size: 0x0008
|1A9602:2252| SFX2_27: incbin "bin/sfx/sfx2-27.sfx"            ; size: 0x0035
|1A9637:2287| SFX2_28: incbin "bin/sfx/sfx2-28.sfx"            ; size: 0x000F
|1A9646:2296| SFX2_25: incbin "bin/sfx/sfx2-25.sfx"            ; size: 0x000F
|1A9655:22A5| SFX2_24: incbin "bin/sfx/sfx2-24.sfx"            ; size: 0x0006
|1A965B:22AB| SFX2_3D: incbin "bin/sfx/sfx2-3D.sfx"            ; size: 0x0006
|1A9661:22B1| SFX2_23: incbin "bin/sfx/sfx2-23.sfx"            ; size: 0x000A
|1A966B:22BB| SFX2_1D: incbin "bin/sfx/sfx2-1D.sfx"            ; size: 0x0014
|1A967F:22CF| SFX2_21: incbin "bin/sfx/sfx2-21.sfx"            ; size: 0x000B
|1A968A:22DA| SFX2_20: incbin "bin/sfx/sfx2-20.sfx"            ; size: 0x000F
|1A9699:22E9| SFX2_1F: incbin "bin/sfx/sfx2-1F.sfx"            ; size: 0x0018
|1A96B1:2301| SFX2_1C: incbin "bin/sfx/sfx2-1C.sfx"            ; size: 0x0006
|1A96B7:2307| SFX2_1B: incbin "bin/sfx/sfx2-1B.sfx"            ; size: 0x000F
|1A96C6:2316| SFX2_1A: incbin "bin/sfx/sfx2-1A.sfx"            ; size: 0x0016
|1A96DC:232C| SFX2_16: incbin "bin/sfx/sfx2-16.sfx"            ; size: 0x0018
|1A96F4:2344| SFX2_17: incbin "bin/sfx/sfx2-17.sfx"            ; size: 0x0012
|1A9706:2356| SFX2_18: incbin "bin/sfx/sfx2-18.sfx"            ; size: 0x0018
|1A971E:236E| SFX2_19: incbin "bin/sfx/sfx2-19.sfx"            ; size: 0x0012
|1A9730:2380| SFX2_14: incbin "bin/sfx/sfx2-14.sfx"            ; size: 0x0010
|1A9740:2390| SFX2_15: incbin "bin/sfx/sfx2-15.sfx"            ; size: 0x0010
|1A9750:23A0| SFX2_13: incbin "bin/sfx/sfx2-13.sfx"            ; size: 0x0015
|1A9765:23B5| SFX2_3E: incbin "bin/sfx/sfx2-3E.sfx"            ; size: 0x0018
|1A977D:23CD| SFX2_12: incbin "bin/sfx/sfx2-12.sfx"            ; size: 0x0023
|1A97A0:23F0| SFX2_11: incbin "bin/sfx/sfx2-11.sfx"            ; size: 0x000A
|1A97AA:23FA| SFX2_10: incbin "bin/sfx/sfx2-10.sfx"            ; size: 0x000A
|1A97B4:2404| SFX2_0E: incbin "bin/sfx/sfx2-0E.sfx"            ; size: 0x0010
|1A97C4:2414| SFX2_0D: incbin "bin/sfx/sfx2-0D.sfx"            ; size: 0x0021
|1A97E5:2435| SFX2_3F: incbin "bin/sfx/sfx2-3F.sfx"            ; size: 0x000A
|1A97EF:243F| SFX2_29: incbin "bin/sfx/sfx2-29.sfx"            ; size: 0x0023
|1A9812:2462| SFX2_3B: incbin "bin/sfx/sfx2-3B.sfx"            ; size: 0x000A
|1A981C:246C| SFX3_14: incbin "bin/sfx/sfx3-14.sfx"            ; size: 0x000C
|1A9828:2478| SFX2_0B: incbin "bin/sfx/sfx2-0B.sfx"            ; size: 0x0008
|1A9830:2480| SFX3_3F: incbin "bin/sfx/sfx3-3F.sfx"            ; size: 0x000A
|1A983A:248A| SFX3_3C: incbin "bin/sfx/sfx3-3C.sfx"            ; size: 0x000A
|1A9844:2494| SFX3_3D: incbin "bin/sfx/sfx3-3D.sfx"            ; size: 0x000A
|1A984E:249E| SFX3_3E: incbin "bin/sfx/sfx3-3E.sfx"            ; size: 0x001B
|1A9869:24B9| SFX3_0F: incbin "bin/sfx/sfx3-0F.sfx"            ; size: 0x000A
|1A9873:24C3| SFX2_0F: incbin "bin/sfx/sfx2-0F.sfx"            ; size: 0x0047
|1A98BA:250A| SFX3_19: incbin "bin/sfx/sfx3-19.sfx"            ; size: 0x0023
|1A98DD:252D| UnusedSFX_252D: incbin "bin/sfx/unused-252D.sfx" ; size: 0x0006
|1A98E3:2533| UnusedSFX_2533: incbin "bin/sfx/unused-2533.sfx" ; size: 0x001B
|1A98FE:254E| SFX3_02: incbin "bin/sfx/sfx3-02.sfx"            ; size: 0x0029
|1A9927:2577| SFX2_1E: incbin "bin/sfx/sfx2-1E.sfx"            ; size: 0x002F
|1A9956:25A6| SFX3_17: incbin "bin/sfx/sfx3-17.sfx"            ; size: 0x0007
|1A995D:25AD| SFX2_09: incbin "bin/sfx/sfx2-09.sfx"            ; size: 0x000A
|1A9967:25B7| SFX2_07: incbin "bin/sfx/sfx2-07.sfx"            ; size: 0x0010
|1A9977:25C7| SFX2_0A: incbin "bin/sfx/sfx2-0A.sfx"            ; size: 0x0010
|1A9987:25D7| SFX2_06: incbin "bin/sfx/sfx2-06.sfx"            ; size: 0x0006
|1A998D:25DD| SFX2_05: incbin "bin/sfx/sfx2-05.sfx"            ; size: 0x0006
|1A9993:25E3| SFX2_08: incbin "bin/sfx/sfx2-08.sfx"            ; size: 0x0031
|1A99C4:2614| SFX2_01: incbin "bin/sfx/sfx2-01.sfx"            ; size: 0x0011
|1A99D5:2625| SFX2_02: incbin "bin/sfx/sfx2-02.sfx"            ; size: 0x000F
|1A99E4:2634| SFX2_03: incbin "bin/sfx/sfx2-03.sfx"            ; size: 0x000F
|1A99F3:2643| SFX2_04: incbin "bin/sfx/sfx2-04.sfx"            ; size: 0x000F
|1A9A02:2652| SFX1_01: incbin "bin/sfx/sfx1-01.sfx"            ; size: 0x0005
|1A9A07:2657| UnusedSFX_2657: incbin "bin/sfx/unused-2657.sfx" ; size: 0x000B
|1A9A12:2662| SFX1_02: incbin "bin/sfx/sfx1-02.sfx"            ; size: 0x0015
|1A9A27:2677| SFX1_03: incbin "bin/sfx/sfx1-03.sfx"            ; size: 0x0005
|1A9A2C:267C| UnusedSFX_267C: incbin "bin/sfx/unused-267C.sfx" ; size: 0x000B
|1A9A37:2687| SFX1_04: incbin "bin/sfx/sfx1-04.sfx"            ; size: 0x0015
|1A9A4C:269C| SFX2_0C: incbin "bin/sfx/sfx2-0C.sfx"            ; size: 0x0006
|1A9A52:26A2| UnusedSFX_26A2: incbin "bin/sfx/unused-26A2.sfx" ; size: 0x002D
|1A9A7F:26CF| SFX3_22: incbin "bin/sfx/sfx3-22.sfx"            ; size: 0x0028
|1A9AA7:26F7| SFX3_28: incbin "bin/sfx/sfx3-28.sfx"            ; size: 0x003F
|1A9AE6:2736| SFX1_08: incbin "bin/sfx/sfx1-08.sfx"            ; size: 0x0003
|1A9AE9:2739| SFX1_07: incbin "bin/sfx/sfx1-07.sfx"            ; size: 0x0033
|1A9B1C:276C| SFX3_20: incbin "bin/sfx/sfx3-20.sfx"            ; size: 0x0012
|1A9B2E:277E| UnusedSFX_277E: incbin "bin/sfx/unused-277E.sfx" ; size: 0x001F
|1A9B4D:279D| UnusedSFX_279D: incbin "bin/sfx/unused-279D.sfx" ; size: 0x002C
|1A9B79:27C9| UnusedSFX_27C9: incbin "bin/sfx/unused-27C9.sfx" ; size: 0x0019
|1A9B92:27E2| SFX3_21: incbin "bin/sfx/sfx3-21.sfx"            ; size: 0x0014
|1A9BA6:27F6| UnusedSFX_27F6: incbin "bin/sfx/unused-27F6.sfx" ; size: 0x0011
|1A9BB7:2807| UnusedSFX_2807: incbin "bin/sfx/unused-2807.sfx" ; size: 0x0011
|1A9BC8:2818| UnusedSFX_2818: incbin "bin/sfx/unused-2818.sfx" ; size: 0x0011
|1A9BD9:2829| UnusedSFX_2829: incbin "bin/sfx/unused-2829.sfx" ; size: 0x0008
|1A9BE1:2831| UnusedSFX_2831: incbin "bin/sfx/unused-2831.sfx" ; size: 0x0013
|1A9BF4:2844| SFX2_26: incbin "bin/sfx/sfx2-26.sfx"            ; size: 0x0006
|1A9BFA:284A| UnusedSFX_284A: incbin "bin/sfx/unused-284A.sfx" ; size: 0x0005
|1A9BFF:284F| SFX1_05: incbin "bin/sfx/sfx1-05.sfx"            ; size: 0x0001

site *

;===================================================================================================

SFXInstruments:
|1A9C00| dw $00E1, INSTRUMENT_DATA_SFX ; Transfer size, transfer address

site INSTRUMENT_DATA_SFX
;                   VOLL VOLR      Pitch      SRCN   ADSR   GAIN  Mult
|1A9C04:3E00| db $70, $70 : dw $1000 : db $00, $F6, $6A, $B8, $03 ; 00
|1A9C0D:3E09| db $70, $70 : dw $1000 : db $01, $8E, $E0, $B8, $02 ; 01
|1A9C16:3E12| db $70, $70 : dw $1000 : db $14, $FE, $6A, $B8, $02 ; 02
|1A9C1F:3E1B| db $70, $70 : dw $1000 : db $03, $FE, $F8, $B8, $0D ; 03
|1A9C28:3E24| db $70, $70 : dw $1000 : db $04, $FE, $6A, $7F, $03 ; 04
|1A9C31:3E2D| db $70, $70 : dw $1000 : db $02, $FE, $6A, $7F, $03 ; 05
|1A9C3A:3E36| db $70, $70 : dw $1000 : db $05, $FE, $6A, $70, $03 ; 06
|1A9C43:3E3F| db $70, $70 : dw $1000 : db $06, $FE, $6A, $70, $03 ; 07
|1A9C4C:3E48| db $70, $70 : dw $1000 : db $08, $FA, $6A, $70, $03 ; 08
|1A9C55:3E51| db $70, $70 : dw $1000 : db $06, $FE, $6A, $70, $01 ; 09
|1A9C5E:3E5A| db $70, $70 : dw $1000 : db $07, $FE, $6A, $70, $05 ; 0A
|1A9C67:3E63| db $70, $70 : dw $1000 : db $0B, $FE, $6A, $B8, $03 ; 0B
|1A9C70:3E6C| db $70, $70 : dw $1000 : db $0C, $FE, $E0, $B8, $02 ; 0C
|1A9C79:3E75| db $70, $70 : dw $1000 : db $0D, $F9, $6E, $B8, $03 ; 0D
|1A9C82:3E7E| db $70, $70 : dw $1000 : db $0E, $FE, $F5, $B8, $07 ; 0E
|1A9C8B:3E87| db $70, $70 : dw $1000 : db $0F, $FE, $F5, $B8, $06 ; 0F
|1A9C94:3E90| db $70, $70 : dw $1000 : db $01, $FE, $FC, $B8, $03 ; 10
|1A9C9D:3E99| db $70, $70 : dw $1000 : db $10, $8E, $E0, $B8, $03 ; 11
|1A9CA6:3EA2| db $70, $70 : dw $1000 : db $08, $8E, $E0, $B8, $02 ; 12
|1A9CAF:3EAB| db $70, $70 : dw $1000 : db $14, $8E, $E0, $B8, $02 ; 13
|1A9CB8:3EB4| db $70, $70 : dw $1000 : db $0A, $88, $E0, $B8, $02 ; 14
|1A9CC1:3EBD| db $70, $70 : dw $1000 : db $17, $8E, $E0, $B8, $02 ; 15
|1A9CCA:3EC6| db $70, $70 : dw $1000 : db $15, $FF, $E0, $B8, $04 ; 16
|1A9CD3:3ECF| db $70, $70 : dw $1000 : db $03, $DF, $11, $B8, $0F ; 17
|1A9CDC:3ED8| db $70, $70 : dw $1000 : db $01, $88, $E0, $B8, $01 ; 18

site *

;===================================================================================================

Fairy_Theme:
|1A9CE5| dw $020C, $2880 ; Transfer size, transfer address

site $2880

Song0B_FairyTheme:
|1A9CE9:2880| incbin "bin/music/song0B.bin" ; size: 0x020C

site *

;===================================================================================================

SongBank_Overworld_Main:
|1A9EF5| dw $2DAE, SONG_POINTERS ; Transfer size, transfer address

site SONG_POINTERS
|1A9EF9:D000| dw Song01_TriforceIntro
|1A9EFB:D002| dw Song02_LightWorldOverture
|1A9EFD:D004| dw Song03_Rain
|1A9EFF:D006| dw Song04_BunnyTheme
|1A9F01:D008| dw Song05_LostWoods
|1A9F03:D00A| dw Song06_LegendsTheme_Attract
|1A9F05:D00C| dw Song07_KakarikoVillage
|1A9F07:D00E| dw Song08_MirrorWarp
|1A9F09:D010| dw Song09_DarkWorld
|1A9F0B:D012| dw Song0A_PullingTheMasterSword
|1A9F0D:D014| dw Song0B_FairyTheme
|1A9F0F:D016| dw Song0C_Fugitive
|1A9F11:D018| dw Song0D_SkullWoodsMarch
|1A9F13:D01A| dw Song0E_MinigameTheme
|1A9F15:D01C| dw Song0F_IntroFanfare
|1A9F17:D01E| dw $0000
|1A9F19:D020| dw $0000
|1A9F1B:D022| dw $0000
|1A9F1D:D024| dw $0000
|1A9F1F:D026| dw $0000
|1A9F21:D028| dw $0000
|1A9F23:D02A| dw $0000
|1A9F25:D02C| dw $0000
|1A9F27:D02E| dw $0000
|1A9F29:D030| dw $0000
|1A9F2B:D032| dw $0000
|1A9F2D:D034| dw $0000

;---------------------------------------------------------------------------------------------------

Song01_TriforceIntro:
|1A9F2F:D036| incbin "bin/music/song01.bin" ; size: 0x00C9

Song02_LightWorldOverture:
|1A9FF8:D0FF| incbin "bin/music/song02.bin" ; size: 0x076B

Song03_Rain:
|1AA763:D86A| incbin "bin/music/song03.bin" ; size: 0x043D

Song04_BunnyTheme:
|1AABA0:DCA7| incbin "bin/music/song04.bin" ; size: 0x023E

Song05_LostWoods:
|1AADDE:DEE5| incbin "bin/music/song05.bin" ; size: 0x0485

Song06_LegendsTheme_Attract:
|1AB263:E36A| incbin "bin/music/song06.bin" ; size: 0x0572

Song07_KakarikoVillage:
|1AB7D5:E8DC| incbin "bin/music/song07.bin" ; size: 0x0535

Song08_MirrorWarp:
|1ABD0A:EE11| incbin "bin/music/song08.bin" ; size: 0x015C

Song09_DarkWorld:
|1ABE66:EF6D| incbin "bin/music/song09.bin" ; size: 0x08A6

Song0A_PullingTheMasterSword:
|1AC70C:F813| incbin "bin/music/song0A.bin" ; size: 0x00E3

Song0C_Fugitive:
|1AC7EF:F8F6| incbin "bin/music/song0C.bin" ; size: 0x0204

Song0F_IntroFanfare:
|1AC9F3:FAFA| incbin "bin/music/song0F.bin" ; size: 0x02B4

site *

;===================================================================================================

SongBank_Overworld_Auxiliary:
|1ACCA7| dw $0688, SONG_POINTERS_AUX ; Transfer size, transfer address

site SONG_POINTERS_AUX

Song0D_SkullWoodsMarch:
|1ACCAB:2B00| incbin "bin/music/song0D.bin" ; size: 0x04A6

Song0E_MinigameTheme:
|1AD151:2FA6| incbin "bin/music/song0E.bin" ; size: 0x01E2

site *

;===================================================================================================

|1AD333| dw $0000, SPC_ENGINE ; end of transfer

;===================================================================================================
; FREE ROM: 0x49
; including garbage
;===================================================================================================
GARBAGE_1AD337:
|1AD337| db $77, $00, $00, $00, $00, $01, $FF, $00, $00

NULL_1AD340:
|1AD340| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AD348| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AD350| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AD358| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AD360| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AD368| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AD370| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AD378| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

SongBank_Credits_Main:
|1AD380| dw $1060, SONG_POINTERS ; Transfer size, transfer address

site SONG_POINTERS
|1AD384:D000| dw $0000
|1AD386:D002| dw $0000
|1AD388:D004| dw $0000
|1AD38A:D006| dw $0000
|1AD38C:D008| dw $0000
|1AD38E:D00A| dw $0000
|1AD390:D00C| dw $0000
|1AD392:D00E| dw $0000
|1AD394:D010| dw $0000
|1AD396:D012| dw $0000
|1AD398:D014| dw $0000
|1AD39A:D016| dw $0000
|1AD39C:D018| dw $0000
|1AD39E:D01A| dw $0000
|1AD3A0:D01C| dw $0000
|1AD3A2:D01E| dw $0000
|1AD3A4:D020| dw $0000
|1AD3A6:D022| dw $0000
|1AD3A8:D024| dw $0000
|1AD3AA:D026| dw $0000
|1AD3AC:D028| dw $0000
|1AD3AE:D02A| dw $0000
|1AD3B0:D02C| dw $0000
|1AD3B2:D02E| dw $0000
|1AD3B4:D030| dw $0000
|1AD3B6:D032| dw $0000
|1AD3B8:D034| dw $0000
|1AD3BA:D036| dw $0000
|1AD3BC:D038| dw $0000
|1AD3BE:D03A| dw $0000
|1AD3C0:D03C| dw $0000
|1AD3C2:D03E| dw Song20_TriforceRoom
|1AD3C4:D040| dw Song21_EndingTheme
|1AD3C6:D042| dw Song22_Credits
|1AD3C8:D044| dw $0000

;---------------------------------------------------------------------------------------------------

Song20_TriforceRoom:
|1AD3CA:D046| incbin "bin/music/song20.bin" ; size: 0x02B7

Song22_Credits:
|1AD681:D2FD| incbin "bin/music/song22.bin" ; size: 0x0D63

site *

;===================================================================================================

SongBank_Credits_Auxiliary:
|1AE3E4| dw $1038, CREDITS_AUX_POINTER ; Transfer size, transfer address

site CREDITS_AUX_POINTER

Song21_EndingTheme:
|1AE3E8:2900| incbin "bin/music/song21.bin" ; size: 0x1038

site *

;===================================================================================================

|1AF420| dw $0000, SPC_ENGINE ; end of transfer

;===================================================================================================

org $1B8000

;===================================================================================================

SongBank_Underworld_Main:
|1B8000| dw $2CBF, SONG_POINTERS ; Transfer size, transfer address

site SONG_POINTERS

|1B8004:D000| dw $0000
|1B8006:D002| dw $0000
|1B8008:D004| dw $0000
|1B800A:D006| dw $0000
|1B800C:D008| dw $0000
|1B800E:D00A| dw $0000
|1B8010:D00C| dw $0000
|1B8012:D00E| dw $0000
|1B8014:D010| dw $0000
|1B8016:D012| dw $0000
|1B8018:D014| dw Song0B_FairyTheme
|1B801A:D016| dw $0000
|1B801C:D018| dw $0000
|1B801E:D01A| dw $0000
|1B8020:D01C| dw $0000
|1B8022:D01E| dw Song10_HyruleCastle
|1B8024:D020| dw Song11_PendantDungeon
|1B8026:D022| dw Song12_Cave
|1B8028:D024| dw Song13_Fanfare
|1B802A:D026| dw Song14_Sanctuary
|1B802C:D028| dw Song15_Boss
|1B802E:D02A| dw Song16_CrystalDungeon
|1B8030:D02C| dw Song17_Shop
|1B8032:D02E| dw Song12_Cave
|1B8034:D030| dw Song19_ZeldaRescue
|1B8036:D032| dw Song1A_CrystalMaiden
|1B8038:D034| dw Song1B_BigFairy
|1B803A:D036| dw Song1C_Suspense
|1B803C:D038| dw Song1D_AgahnimEscapes
|1B803E:D03A| dw Song1E_MeetingGanon
|1B8040:D03C| dw Song1F_KingOfThieves
|1B8042:D03E| dw $0000
|1B8044:D040| dw Song1D_AgahnimEscapes
|1B8046:D042| dw Song1E_MeetingGanon
|1B8048:D044| dw Song1F_KingOfThieves

;---------------------------------------------------------------------------------------------------

Song10_HyruleCastle:
|1B804A:D046| incbin "bin/music/song10.bin" ; size: 0x0BA6

Song11_PendantDungeon:
|1B8BF0:DBEC| incbin "bin/music/song11.bin" ; size: 0x054E

Song12_Cave:
|1B913E:E13A| incbin "bin/music/song12.bin" ; size: 0x02F7

Song13_Fanfare:
|1B9435:E431| incbin "bin/music/song13.bin" ; size: 0x02C8

Song14_Sanctuary:
|1B96FD:E6F9| incbin "bin/music/song14.bin" ; size: 0x0225

Song15_Boss:
|1B9922:E91E| incbin "bin/music/song15.bin" ; size: 0x02ED

Song16_CrystalDungeon:
|1B9C0F:EC0B| incbin "bin/music/song16.bin" ; size: 0x05C6

Song17_Shop:
|1BA1D5:F1D1| incbin "bin/music/song17.bin" ; size: 0x0133

Song19_ZeldaRescue:
|1BA308:F304| incbin "bin/music/song19.bin" ; size: 0x027C

Song1A_CrystalMaiden:
|1BA584:F580| incbin "bin/music/song1A.bin" ; size: 0x0389

Song1B_BigFairy:
|1BA90D:F909| incbin "bin/music/song1B.bin" ; size: 0x0261

Song1C_Suspense:
|1BAB6E:FB6A| incbin "bin/music/song1C.bin" ; size: 0x0155

site *

;===================================================================================================

SongBank_Underworld_Auxiliary:
|1BACC3| dw $050C, SONG_POINTERS_AUX ; Transfer size, transfer address

site SONG_POINTERS_AUX

Song1D_AgahnimEscapes:
|1BACC7:2B00| incbin "bin/music/song1D.bin" ; size: 0x00B3

Song1F_KingOfThieves:
|1BAD7A:2BB3| incbin "bin/music/song1F.bin" ; size: 0x03A6

Song1E_MeetingGanon:
|1BB120:2F59| incbin "bin/music/song1E.bin" ; size: 0x00B3

site *

;===================================================================================================

|1BB1D3| dw $0000, SPC_ENGINE ; end of transfer

;===================================================================================================
