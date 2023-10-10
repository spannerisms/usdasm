org $028000

;===================================================================================================

Intro_SetupScreen:
#_028000: LDA.b #$80
#_028002: STA.w $0710

#_028005: JSL EnableForceBlank

#_028009: LDA.b #$10
#_02800B: STA.b $1C
#_02800D: STZ.b $1D

#_02800F: JSR Intro_InitializeBackgroundSettings

#_028012: LDA.b #$20
#_028014: STA.b $99

#_028016: LDA.b #$02
#_028018: STA.w OBSEL

#_02801B: LDA.b #$14
#_02801D: STA.w $0AAA

#_028020: JSL Graphics_LoadChrHalfSlot

#_028024: STZ.w $0AAA

#_028027: JSR LoadOWMusicIfNeeded

#_02802A: REP #$20

#_02802C: LDX.b #$80
#_02802E: STX.w VMAIN

#_028031: LDA.w #$27F0 ; VRAM $4FE0
#_028034: STA.w VMADDR

#_028037: LDX.b #$20

#_028039: LDA.w #$7FFF ; RGB: #F8F8F8

.clear_next
#_02803C: STZ.w VMDATA

#_02803F: STA.l $7EC620,X

#_028043: DEX
#_028044: DEX
#_028045: BPL .clear_next

#_028047: LDA.w #$1FFE
#_02804A: STA.b $C8

#_02804C: LDA.w #$1BFE
#_02804F: STA.b $CA

#_028051: SEP #$20

#_028053: RTL

;===================================================================================================

Intro_InitializeSRAMWRAM:
#_028054: REP #$30

#_028056: STZ.b $00

.next_file_check
#_028058: LDX.b $00

#_02805A: LDA.l SaveFileCopyOffsets,X
#_02805E: TAX

#_02805F: PHX

#_028060: LDY.w #$0000
#_028063: TYA

.calc_checksum_main
#_028064: CLC
#_028065: ADC.l $700000,X

#_028069: INX
#_02806A: INX

#_02806B: INY
#_02806C: CPY.w #$0280
#_02806F: BNE .calc_checksum_main

#_028071: PLX

#_028072: CMP.w #$5A5A
#_028075: BEQ .checksum_good

;---------------------------------------------------------------------------------------------------

#_028077: PHX

#_028078: LDY.w #$0000
#_02807B: TYA

.calc_checksum_backup
#_02807C: CLC
#_02807D: ADC.l $700F00,X

#_028081: INX
#_028082: INX

#_028083: INY
#_028084: CPY.w #$0280
#_028087: BNE .calc_checksum_backup

#_028089: PLX

#_02808A: CMP.w #$5A5A
#_02808D: BNE ClearAnSRAMFile

;---------------------------------------------------------------------------------------------------

#_02808F: LDY.w #$0000

.copy_from_backup
#_028092: LDA.l $700F00,X
#_028096: STA.l $700000,X

#_02809A: LDA.l $701000,X
#_02809E: STA.l $700100,X

#_0280A2: LDA.l $701100,X
#_0280A6: STA.l $700200,X

#_0280AA: LDA.l $701200,X
#_0280AE: STA.l $700300,X

#_0280B2: LDA.l $701300,X
#_0280B6: STA.l $700400,X

#_0280BA: INX
#_0280BB: INX

#_0280BC: INY
#_0280BD: CPY.w #$0080
#_0280C0: BNE .copy_from_backup

;---------------------------------------------------------------------------------------------------

.checksum_good
#_0280C2: INC.b $00
#_0280C4: INC.b $00

#_0280C6: LDX.b $00
#_0280C8: CPX.w #$0006
#_0280CB: BNE .next_file_check

;---------------------------------------------------------------------------------------------------

#_0280CD: LDX.w #$00FE

.clear_next_sprite_prop
#_0280D0: STZ.w $0D00,X
#_0280D3: STZ.w $0E00,X
#_0280D6: STZ.w $0F00,X

#_0280D9: DEX
#_0280DA: DEX
#_0280DB: BPL .clear_next_sprite_prop

#_0280DD: SEP #$30

#_0280DF: RTL

;===================================================================================================

#ClearAnSRAMFile:
#_0280E0: LDY.w #$0000
#_0280E3: TYA

.clear_next
#_0280E4: STA.l $700F00,X
#_0280E8: STA.l $700000,X
#_0280EC: STA.l $701000,X
#_0280F0: STA.l $700100,X
#_0280F4: STA.l $701100,X
#_0280F8: STA.l $700200,X
#_0280FC: STA.l $701200,X
#_028100: STA.l $700300,X
#_028104: STA.l $701300,X
#_028108: STA.l $700400,X

#_02810C: INX
#_02810D: INX

#_02810E: INY
#_02810F: CPY.w #$0080
#_028112: BNE .clear_next

;---------------------------------------------------------------------------------------------------

#_028114: BRA .checksum_good

;===================================================================================================

Intro_LoadTextAndPalettes:
#_028116: JSL CreateMessagePointers

;---------------------------------------------------------------------------------------------------

Overworld_LoadAllPalettes_long:
#_02811A: JSR Overworld_LoadAllPalettes

#_02811D: RTL

;===================================================================================================

AnimatedTileSheets:
#_02811E: db $5D, $5D, $5D, $5D, $5D, $5D, $5D, $5F
#_028126: db $5D, $5F, $5F, $5E, $5F, $5E, $5E, $5D
#_02812E: db $5D, $5E, $5D, $5D, $5D, $5D, $5D, $5D

;===================================================================================================

Module05_LoadFile:
#_028136: JSL EnableForceBlank

#_02813A: STZ.w $0200

#_02813D: STZ.w $03F4

#_028140: STZ.w $02D4
#_028143: STZ.w $02D7

#_028146: STZ.w $02F9

#_028149: STZ.w $0379

#_02814C: STZ.w $03FD

#_02814F: JSL EraseTilemaps_normal

#_028153: LDA.b #$02
#_028155: STA.w OBSEL

#_028158: JSL LoadDefaultGraphics
#_02815C: JSL Sprite_LoadGraphicsProperties
#_028160: JSL LoadDefaultTileTypes

#_028164: JSL DecompressSwordGraphics
#_028168: JSL DecompressShieldGraphics

#_02816C: JSL Link_Initialize

#_028170: JSL LoadFollowerGraphics

#_028174: LDA.b #$46
#_028176: STA.l $7EC2FC
#_02817A: STA.l $7EC2FD
#_02817E: STA.l $7EC2FE
#_028182: STA.l $7EC2FF

#_028186: STZ.w $02CD

#_028189: LDA.b #$02
#_02818B: STA.w $02CE

#_02818E: LDA.b #$30
#_028190: STA.b $FF

#_028192: LDA.l $7EF3CA
#_028196: BEQ .light_world

#_028198: LDA.b $1B
#_02819A: BNE LoadUnderworldRoomRebuildHUD

#_02819C: JSL SearchForEquippedItem_long
#_0281A0: JSL RebuildHUD_long2
#_0281A4: JSL UpdateEquippedItem_long

#_0281A8: STZ.w $010A

#_0281AB: LDA.b #$20 ; ROOM 0020
#_0281AD: STA.b $A0
#_0281AF: STZ.b $A1

#_0281B1: LDA.b #$08
#_0281B3: STA.b $10
#_0281B5: STZ.b $11
#_0281B7: STZ.b $B0

#_0281B9: STZ.w $04AA

#_0281BC: RTL

;---------------------------------------------------------------------------------------------------

.light_world
#_0281BD: LDA.l $7EC011
#_0281C1: BNE LoadUnderworldRoomRebuildHUD

#_0281C3: LDA.w $010A
#_0281C6: BEQ .not_continue

#_0281C8: LDA.w $04AA
#_0281CB: BEQ LoadUnderworldRoomRebuildHUD

.not_continue
#_0281CD: LDA.l $7EF3C5
#_0281D1: CMP.b #$02
#_0281D3: BCC LoadUnderworldRoomRebuildHUD

#_0281D5: LDA.l $7EF3C8
#_0281D9: CMP.b #$05
#_0281DB: BEQ LoadUnderworldRoomRebuildHUD

#_0281DD: REP #$10

#_0281DF: LDX.w #$0185 ; MESSAGE 0185

#_0281E2: LDA.l $7EF353
#_0281E6: CMP.b #$02
#_0281E8: BEQ .no_mirror

#_0281EA: LDX.w #$0184 ; MESSAGE 0184

.no_mirror
#_0281ED: STX.w $1CF0

#_0281F0: SEP #$10

#_0281F2: JSL Interface_PrepAndDisplayMessage
#_0281F6: JSR Underworld_LoadPalettes

#_0281F9: LDA.b #$0F
#_0281FB: STA.b $13

#_0281FD: LDA.b #$04
#_0281FF: STA.b $1C
#_028201: STZ.b $1D

#_028203: LDA.b #$1B
#_028205: STA.b $10

#_028207: RTL

;===================================================================================================

LoadUnderworldRoomRebuildHUD:
#_028208: LDA.b #$00
#_02820A: STA.l $7EC011

#_02820E: ORA.b #$07
#_028210: STA.b $95

#_028212: JSL SearchForEquippedItem_long
#_028216: JSL RebuildHUD_long2
#_02821A: JSL UpdateEquippedItem_long

;===================================================================================================

Module06_UnderworldLoad:
#_02821E: REP #$20

#_028220: LDA.w #$0005
#_028223: STA.w $012D

#_028226: STZ.b $A0
#_028228: STZ.b $A2

#_02822A: STZ.w $0402

#_02822D: LDA.w #$0000
#_028230: STA.l $7EC019
#_028234: STA.l $7EC01B
#_028238: STA.l $7EC01D
#_02823C: STA.l $7EC01F
#_028240: STA.l $7EC021
#_028244: STA.l $7EC023

#_028248: SEP #$20

#_02824A: JSR Underworld_LoadEntrance

#_02824D: LDA.w $040C
#_028250: CMP.b #$FF ; DUNGEON FF
#_028252: BEQ .cave

#_028254: CMP.b #$02 ; DUNGEON 02
#_028256: BNE .not_castle

#_028258: LDA.b #$00 ; DUNGEON 00

.not_castle
#_02825A: LSR A
#_02825B: TAX

#_02825C: LDA.l $7EF37C,X

.cave
#_028260: JSL RebuildHUD_Keys

#_028264: STZ.w $045A
#_028267: STZ.w $0458

#_02826A: JSR Underworld_LoadAndDrawRoom
#_02826D: JSL Underworld_LoadCustomTileTypes

;---------------------------------------------------------------------------------------------------

#_028271: LDX.w $0AA1

#_028274: LDA.l AnimatedTileSheets,X
#_028278: TAY

#_028279: JSL DecompressAnimatedUnderworldTiles
#_02827D: JSL Underworld_LoadAttributeTable

#_028281: LDA.b #$0A
#_028283: STA.w $0AA4

#_028286: JSL InitializeTilesets

#_02828A: LDA.b #$0A
#_02828C: STA.w $0AB1

#_02828F: JSR Underworld_LoadPalettes

#_028292: LDA.w $02E0
#_028295: ORA.b $56
#_028297: BEQ .not_bunny

#_028299: JSL RefreshLinkEquipmentPalettes_bunny

.not_bunny
#_02829D: REP #$30

#_02829F: LDA.b $A0
#_0282A1: AND.w #$000F
#_0282A4: ASL A
#_0282A5: XBA
#_0282A6: STA.w $062C

#_0282A9: LDA.b $A0
#_0282AB: AND.w #$0FF0
#_0282AE: LSR A
#_0282AF: LSR A
#_0282B0: LSR A
#_0282B1: XBA
#_0282B2: STA.w $062E

#_0282B5: LDA.b $A0
#_0282B7: CMP.w #$0104 ; ROOM 0104
#_0282BA: BNE .use_current_entrance

#_0282BC: LDA.l $7EF3C6
#_0282C0: AND.w #$0010
#_0282C3: BEQ .use_current_entrance

#_0282C5: LDA.w #$0000
#_0282C8: STA.l $7EC005

;---------------------------------------------------------------------------------------------------

.use_current_entrance
#_0282CC: SEP #$30

#_0282CE: JSL SetAndSaveVisitedQuadrantFlags

#_0282D2: LDA.b #$02
#_0282D4: STA.b $99

#_0282D6: LDA.b #$B3
#_0282D8: STA.b $9A

#_0282DA: LDX.w $045A

#_0282DD: LDA.l $7EC005
#_0282E1: BNE .do_fade

#_0282E3: LDX.b #$03
#_0282E5: LDY.w $0414
#_0282E8: BEQ .no_room_effect


#_0282EA: LDA.b #$32
#_0282EC: CPY.b #$07
#_0282EE: BEQ .set_room_effect

#_0282F0: LDA.b #$62
#_0282F2: CPY.b #$04
#_0282F4: BEQ .set_room_effect

.no_room_effect
#_0282F6: LDA.b #$20

.set_room_effect
#_0282F8: STA.b $9A

.do_fade
#_0282FA: LDA.l RoomEffectFixedColors,X
#_0282FE: STA.l $7EC017

#_028302: JSL ApplyGrayscaleFixed_Parameterized

#_028306: LDA.b #$1F
#_028308: STA.l $7EC007

#_02830C: LDA.b #$00
#_02830E: STA.l $7EC00B

#_028312: LDA.b #$02
#_028314: STA.l $7EC009

#_028318: STZ.w $0AA9

#_02831B: STZ.b $57

#_02831D: STZ.b $3A
#_02831F: STZ.b $3C

;---------------------------------------------------------------------------------------------------

#_028321: JSR Underworld_ResetTorchBackgroundAndPlayer
#_028324: JSL Link_CheckIfBunny
#_028328: JSR ResetThenCacheRoomEntryProperties

#_02832B: LDA.l $7EF3CC
#_02832F: CMP.b #$0D ; FOLLOWER 0D
#_028331: BNE .not_superbomb

#_028333: LDA.b #$00
#_028335: STA.l $7EF3CC

#_028339: STZ.w $04B4

#_02833C: JSL HUD_HideBigNumbers

.not_superbomb
#_028340: LDA.b #$09
#_028342: STA.b $94

#_028344: JSL Follower_Initialize
#_028348: JSL Sprite_ResetAll
#_02834C: JSL Underworld_ResetSprites

#_028350: STZ.w $02F0

#_028353: INC.w $04C7

#_028356: LDA.l $7EF3C5
#_02835A: BNE .not_bed_cutscene

#_02835C: LDA.l $7EF3C6
#_028360: AND.b #$10
#_028362: BNE .not_bed_cutscene

#_028364: LDA.b #$30 ; Fixed color RGB: #808000
#_028366: STA.b $9C

#_028368: LDA.b #$50
#_02836A: STA.b $9D

#_02836C: LDA.b #$80
#_02836E: STA.b $9E

#_028370: LDA.b #$00
#_028372: STA.l $7EC005
#_028376: STA.l $7EC006

#_02837A: JSL Link_TuckIntoBed

;---------------------------------------------------------------------------------------------------

.not_bed_cutscene
#_02837E: LDA.b #$07
#_028380: STA.w $010C
#_028383: STA.b $10

#_028385: LDA.b #$0F
#_028387: STA.b $11

#_028389: JSR Underworld_LoadSongBankIfNeeded

;===================================================================================================

UnderworldAdjustRainSFX:
#_02838C: LDA.l $7EF3C5
#_028390: CMP.b #$02
#_028392: BCS .exit

#_028394: LDA.b #$05 ; SFX1.05
#_028396: STA.w $012D

#_028399: LDA.b $A4
#_02839B: BMI .exit

#_02839D: REP #$20

#_02839F: LDA.b $A0 ; ROOM 0002
#_0283A1: CMP.w #$0002
#_0283A4: BEQ .exit

#_0283A6: CMP.w #$0012 ; ROOM 0012
#_0283A9: BEQ .exit

#_0283AB: SEP #$20

#_0283AD: LDA.b #$03 ; SFX1.03
#_0283AF: STA.w $012D

.exit
#_0283B2: SEP #$20

#_0283B4: RTL

;===================================================================================================

CacheRoomEntryProperties_long:
#_0283B5: JSR CacheRoomEntryProperties

#_0283B8: RTL

;===================================================================================================

pool OverworldLoad

.submodules
#_0283B9: dw Module08_00_LoadProperties
#_0283BB: dw Overworld_LoadSubscreenAndSilenceSFX1
#_0283BD: dw Module08_02_LoadAndAdvance

pool off

;---------------------------------------------------------------------------------------------------

Module08_OverworldLoad:
Module0A_OverworldSpecialLoad:
#_0283BF: LDA.b $11
#_0283C1: ASL A
#_0283C2: TAX

#_0283C3: JSR (OverworldLoad_submodules,X)

#_0283C6: RTL

;===================================================================================================

Module08_00_LoadProperties:
#_0283C7: LDA.b #$82
#_0283C9: STA.b $99

#_0283CB: STZ.w $03F4

#_0283CE: JSL AdjustLinkBunnyStatus

#_0283D2: LDA.b $10
#_0283D4: CMP.b #$08
#_0283D6: BNE .special_overworld_a

#_0283D8: JSR LoadOverworldFromUnderworld
#_0283DB: BRA .continue_a

.special_overworld_a
#_0283DD: JSR LoadOverworldFromSpecialOverworld

.continue_a
#_0283E0: JSL AdjustOverworldAmbiance

#_0283E4: LDA.b #$FF
#_0283E6: STA.l $7EF36F

#_0283EA: JSL RefillLogic_long

#_0283EE: LDY.b #$58
#_0283F0: LDX.b #$02 ; SONG 02

#_0283F2: LDA.b $8A
#_0283F4: CMP.b #$03 ; OW 03
#_0283F6: BEQ .death_mountain

#_0283F8: CMP.b #$05 ; OW 05
#_0283FA: BEQ .death_mountain

#_0283FC: CMP.b #$07 ; OW 07
#_0283FE: BEQ .death_mountain

#_028400: LDX.b #$09 ; SONG 09

#_028402: LDA.b $8A
#_028404: CMP.b #$43 ; OW 43
#_028406: BEQ .death_mountain

#_028408: CMP.b #$45 ; OW 45
#_02840A: BEQ .death_mountain

#_02840C: CMP.b #$47 ; OW 47
#_02840E: BEQ .death_mountain

#_028410: LDY.b #$5A ; OW 5A

#_028412: LDA.b $8A
#_028414: CMP.b #$40
#_028416: BCS .dark_world

;---------------------------------------------------------------------------------------------------

#_028418: LDX.b #$07 ; SONG 07

#_02841A: LDA.l $7EF3C5
#_02841E: CMP.b #$03
#_028420: BCC .aga_alive

#_028422: LDX.b #$02 ; SONG 02

.aga_alive
#_028424: LDA.b $A0
#_028426: CMP.b #$E3 ; ROOM 00E3
#_028428: BEQ .death_mountain

#_02842A: CMP.b #$18 ; ROOM 0018
#_02842C: BEQ .death_mountain

#_02842E: CMP.b #$2F ; ROOM 002F
#_028430: BEQ .death_mountain

#_028432: LDA.b $A0
#_028434: CMP.b #$1F ; ROOM 011F
#_028436: BNE .not_kakariko_shop

#_028438: LDA.b $8A
#_02843A: CMP.b #$18 ; OW 18
#_02843C: BEQ .death_mountain

.not_kakariko_shop
#_02843E: LDX.b #$05 ; SONG 05

#_028440: LDA.l $7EF300
#_028444: AND.b #$40
#_028446: BEQ .no_ms

#_028448: LDX.b #$02 ; SONG 02

.no_ms
#_02844A: LDA.b $A0 ; ROOM 0100
#_02844C: BEQ .death_mountain

#_02844E: CMP.b #$E1 ; ROOM 00E1
#_028450: BEQ .death_mountain

;---------------------------------------------------------------------------------------------------

.dark_world
#_028452: LDX.b #$F3 ; SONG F3 - max volume

#_028454: LDA.w $0132
#_028457: CMP.b #$F2 ; SONG F2 - half volume
#_028459: BEQ .continue_with_music

#_02845B: LDX.b #$02 ; SONG 02

#_02845D: LDA.l $7EF3C5
#_028461: CMP.b #$02
#_028463: BCS .death_mountain

#_028465: LDX.b #$03 ; SONG 03

.death_mountain
#_028467: LDA.l $7EF3CA
#_02846B: BEQ .continue_with_music

#_02846D: LDX.b #$0D ; SONG 0D

#_02846F: LDA.b $8A
#_028471: CMP.b #$40 ; OW 40
#_028473: BEQ .use_sw_theme

#_028475: CMP.b #$43 ; OW 43
#_028477: BEQ .use_sw_theme

#_028479: CMP.b #$45 ; OW 45
#_02847B: BEQ .use_sw_theme

#_02847D: CMP.b #$47 ; OW 47
#_02847F: BEQ .use_sw_theme

#_028481: LDX.b #$09 ; SONG 09

.use_sw_theme
#_028483: LDA.l $7EF357
#_028487: BNE .continue_with_music

#_028489: LDX.b #$04 ; SONG 04

.continue_with_music
#_02848B: STX.w $0132

#_02848E: JSL DecompressAnimatedOverworldTiles
#_028492: JSL InitializeTilesets
#_028496: JSR OverworldLoadScreensPaletteSet

#_028499: LDX.b $8A

#_02849B: LDA.l $7EFD40,X
#_02849F: STA.b $00

#_0284A1: LDA.l OverworldPalettesScreenToSet,X
#_0284A5: JSL OverworldPalettesLoader
#_0284A9: JSL Overworld_SetScreenBGColor

#_0284AD: LDA.b $10
#_0284AF: CMP.b #$08
#_0284B1: BNE .special_overworld_b

#_0284B3: JSR Overworld_CopyPalettesToCache_WithPrep
#_0284B6: BRA .continue_b

.special_overworld_b
#_0284B8: JSR SpecialOverworld_CopyPalettesToCache

.continue_b
#_0284BB: JSL Overworld_SetFixedColAndScroll

#_0284BF: LDA.b #$00
#_0284C1: STA.l $7EC017

#_0284C5: JSL Follower_Initialize

#_0284C9: LDA.b $8A
#_0284CB: AND.b #$3F ; OW 00, OW 40
#_0284CD: BNE .not_woods

#_0284CF: LDA.b #$1E
#_0284D1: JSL WriteTo4BPPBuffer_item_gfx

.not_woods
#_0284D5: LDA.b #$09
#_0284D7: STA.w $010C

#_0284DA: JSL Sprite_ReloadAll_Overworld

#_0284DE: LDA.b $8A
#_0284E0: AND.b #$40
#_0284E2: BNE .no_mirror_portal

#_0284E4: JSL InitializeMirrorPortal

.no_mirror_portal
#_0284E8: LDX.b #$05 ; SFX1.05

#_0284EA: LDA.l $7EF3C5
#_0284EE: CMP.b #$02
#_0284F0: BCS .no_rain_sfx

#_0284F2: LDX.b #$01 ; SFX1.01

.no_rain_sfx
#_0284F4: STX.w $012D

#_0284F7: LDA.l $7EF3CC
#_0284FB: CMP.b #$06 ; FOLLOWER 06
#_0284FD: BNE .not_blind_follower

#_0284FF: LDA.b #$00
#_028501: STA.l $7EF3CC

.not_blind_follower
#_028505: STZ.b $6C

#_028507: STZ.b $3A
#_028509: STZ.b $3C

#_02850B: STZ.b $50
#_02850D: STZ.b $5E

#_02850F: STZ.w $0351

#_028512: JSR DeleteCertainAncillaeStopDashing

#_028515: LDA.l $7EF357
#_028519: BNE .dont_become_bunny

#_02851B: LDA.l $7EF3CA
#_02851F: BEQ .dont_become_bunny

#_028521: LDA.b #$01
#_028523: STA.w $02E0
#_028526: STA.b $56

#_028528: LDA.b #$17 ; LINKSTATE 17
#_02852A: STA.b $5D

#_02852C: JSL RefreshLinkEquipmentPalettes_bunny

.dont_become_bunny
#_028530: LDA.b #$09
#_028532: STA.b $94

#_028534: LDA.b #$00
#_028536: STA.l $7EC005

#_02853A: STZ.w $046C
#_02853D: STZ.b $EE
#_02853F: STZ.w $0476

#_028542: INC.b $11
#_028544: INC.b $16

#_028546: STZ.w $0402
#_028549: STZ.w $0403

;===================================================================================================

LoadOWMusicIfNeeded:
#_02854C: LDA.w $0136
#_02854F: BEQ .exit

#_028551: SEI

#_028552: STZ.w NMITIMEN
#_028555: STZ.w HDMAEN
#_028558: STZ.w $0136

#_02855B: LDA.b #$FF ; SONG FF - transfer
#_02855D: STA.w APUIO0

#_028560: JSL LoadOverworldSongs

#_028564: LDA.b #$81
#_028566: STA.w NMITIMEN

.exit
#_028569: RTS

;===================================================================================================

AdjustLinkBunnyStatus:
#_02856A: LDA.l $7EF357
#_02856E: BEQ .exit

;===================================================================================================

#ForceNonbunnyStatus:
#_028570: LDA.b #$00 ; LINKSTATE 00
#_028572: STA.b $5D

#_028574: STZ.w $03F5
#_028577: STZ.w $03F6
#_02857A: STZ.w $03F7

#_02857D: STZ.b $56
#_02857F: STZ.w $02E0

.exit
#_028582: RTL

;===================================================================================================

pool Module1B_SpawnSelect

.spawns
#_028583: db $00 ; Link's  house
#_028584: db $01 ; Sanctuary
#_028585: db $06 ; Mountain cave

pool off

;---------------------------------------------------------------------------------------------------

Module1B_SpawnSelect:
#_028586: JSL RenderText

#_02858A: LDA.b $11
#_02858C: BNE .exit

#_02858E: STZ.b $14

#_028590: JSL EnableForceBlank
#_028594: JSL EraseTilemaps_normal

#_028598: LDA.l $7EF3C8
#_02859C: PHA

#_02859D: LDX.w $1CE8

#_0285A0: LDA.l .spawns,X
#_0285A4: STA.l $7EF3C8

#_0285A8: STZ.b $B0

#_0285AA: JSL LoadUnderworldRoomRebuildHUD

#_0285AE: PLA
#_0285AF: STA.l $7EF3C8

.exit
#_0285B3: RTL

;===================================================================================================

pool Credits_LoadScene_Overworld

.vectors
#_0285B4: dw Credits_LoadScene_Overworld_PrepGFX
#_0285B6: dw Credits_LoadScene_Overworld_Overlay
#_0285B8: dw Credits_LoadScene_Overworld_LoadMap

pool off

;---------------------------------------------------------------------------------------------------

Credits_LoadScene_Overworld:
#_0285BA: LDA.b $B0
#_0285BC: ASL A
#_0285BD: TAX

#_0285BE: JSR (.vectors,X)

#_0285C1: RTL

;===================================================================================================

pool Credits_LoadScene_Overworld_PrepGFX Credits_LoadScene_Underworld

.screen
#_0285C2: dw $1000 ; Hyrule Castle
#_0285C4: dw $0002 ; Sanctuary
#_0285C6: dw $1002 ; Kakariko
#_0285C8: dw $1012 ; Desert
#_0285CA: dw $1004 ; Tower of Hera
#_0285CC: dw $1006 ; Link's house
#_0285CE: dw $1010 ; Zora's Domain
#_0285D0: dw $1014 ; Potion shop
#_0285D2: dw $100A ; Lumberjacks
#_0285D4: dw $1016 ; Haunted Grove
#_0285D6: dw $005D ; Wishing Well
#_0285D8: dw $0064 ; Smithery
#_0285DA: dw $100E ; Kakariko (bug net)
#_0285DC: dw $1008 ; Death Mountain
#_0285DE: dw $1018 ; Lost Woods
#_0285E0: dw $0180 ; Master Sword

;---------------------------------------------------------------------------------------------------

.sprite_gfx
#_0285E2: db $28
#_0285E3: db $46
#_0285E4: db $27
#_0285E5: db $2E
#_0285E6: db $2B
#_0285E7: db $2B
#_0285E8: db $0E
#_0285E9: db $2C
#_0285EA: db $1A
#_0285EB: db $29
#_0285EC: db $47
#_0285ED: db $28
#_0285EE: db $27
#_0285EF: db $28
#_0285F0: db $2A
#_0285F1: db $28
#_0285F2: db $2D

.sprite_palette
#_0285F3: db $01
#_0285F4: db $40
#_0285F5: db $01
#_0285F6: db $04
#_0285F7: db $01
#_0285F8: db $01
#_0285F9: db $01
#_0285FA: db $11
#_0285FB: db $01
#_0285FC: db $01
#_0285FD: db $47
#_0285FE: db $40
#_0285FF: db $01
#_028600: db $01
#_028601: db $01
#_028602: db $01
#_028603: db $01

pool off

;---------------------------------------------------------------------------------------------------

Credits_LoadScene_Overworld_PrepGFX:
#_028604: JSL EnableForceBlank
#_028608: JSL EraseTilemaps_normal

#_02860C: LDA.b #$82
#_02860E: STA.b $99

#_028610: REP #$20

#_028612: LDX.b $11

#_028614: LDA.l .screen,X
#_028618: STA.b $A0

#_02861A: SEP #$20

#_02861C: CPX.b #$0C
#_02861E: BEQ .special_overworld

#_028620: CPX.b #$1E
#_028622: BEQ .special_overworld

#_028624: JSR LoadOverworldFromUnderworld

#_028627: BRA .continue

.special_overworld
#_028629: JSR LoadSpecialOverworld

;---------------------------------------------------------------------------------------------------

.continue
#_02862C: STZ.w $012C
#_02862F: STZ.w $012D

#_028632: LDY.b #$58

#_028634: LDA.b $8A
#_028636: AND.b #$BF
#_028638: CMP.b #$03 ; OW 03, OW 43
#_02863A: BEQ .death_mountain_screen

#_02863C: CMP.b #$05 ; OW 05, OW 45
#_02863E: BEQ .death_mountain_screen

#_028640: CMP.b #$07 ; OW 07, OW 47
#_028642: BEQ .death_mountain_screen

#_028644: LDY.b #$5A

.death_mountain_screen
#_028646: JSL DecompressAnimatedOverworldTiles

;---------------------------------------------------------------------------------------------------

#_02864A: LDA.b $11
#_02864C: LSR A
#_02864D: TAX

#_02864E: LDA.l .sprite_gfx,X
#_028652: STA.w $0AA3

#_028655: LDA.l .sprite_palette,X
#_028659: PHA

#_02865A: JSL InitializeTilesets
#_02865E: JSR OverworldLoadScreensPaletteSet

#_028661: PLA
#_028662: STA.b $00

#_028664: LDX.b $8A
#_028666: LDA.l OverworldPalettesScreenToSet,X

#_02866A: JSL OverworldPalettesLoader

#_02866E: LDA.b #$01
#_028670: STA.w $0AB2

#_028673: JSL Palettes_Load_HUD

;---------------------------------------------------------------------------------------------------

#_028677: LDA.b $11
#_028679: BNE .font_already_transferred

#_02867B: JSL TransferFontToVRAM

.font_already_transferred
#_02867F: JSR Overworld_CopyPalettesToCache_WithPrep
#_028682: JSL Overworld_SetFixedColAndScroll

#_028686: LDA.b $8A
#_028688: CMP.b #$80 ; SPOW
#_02868A: BCC .no_special_bg_color

#_02868C: JSL Overworld_SetScreenBGColor

.no_special_bg_color
#_028690: LDA.b #$09
#_028692: STA.b $94

#_028694: INC.b $B0

#_028696: RTS

;===================================================================================================

Credits_LoadScene_Overworld_Overlay:
#_028697: JSR Overworld_ReloadSubscreenOverlay

#_02869A: STZ.w $012C
#_02869D: STZ.w $012D

#_0286A0: DEC.b $11

#_0286A2: INC.b $B0

#_0286A4: RTS

;===================================================================================================

Credits_LoadScene_Overworld_LoadMap:
#_0286A5: JSR Overworld_LoadAndBuildScreen
#_0286A8: JSL Credits_PrepAndLoadSprites

#_0286AC: STZ.b $C8
#_0286AE: STZ.b $C9
#_0286B0: STZ.b $B0

#_0286B2: RTS

;===================================================================================================

Credits_OperateScrollingAndTilemap:
#_0286B3: JSL Credits_HandleCameraScrollControl

#_0286B7: LDA.w $0416
#_0286BA: BEQ .exit

#_0286BC: JSR OverworldHandleMapScroll

.exit
#_0286BF: RTL

;===================================================================================================

Credits_LoadCoolBackground:
#_0286C0: LDA.b #$21
#_0286C2: STA.w $0AA1

#_0286C5: LDA.b #$3B
#_0286C7: STA.w $0AA2

#_0286CA: LDA.b #$2D
#_0286CC: STA.w $0AA3

#_0286CF: JSL InitializeTilesets

#_0286D3: LDX.b #$5B ; OW 5B
#_0286D5: STX.b $8A

#_0286D7: LDA.b #$13
#_0286D9: STA.b $00

#_0286DB: LDA.l OverworldPalettesScreenToSet,X
#_0286DF: JSL OverworldPalettesLoader

#_0286E3: LDA.b #$03
#_0286E5: STA.w $0AB5

#_0286E8: JSL Palettes_Load_OWBG2
#_0286EC: JSR Overworld_CopyPalettesToCache
#_0286EF: JSR Overworld_ReloadSubscreenOverlay

#_0286F2: STZ.b $E6
#_0286F4: STZ.b $E7
#_0286F6: STZ.b $E0
#_0286F8: STZ.b $E1

#_0286FA: DEC.b $11

#_0286FC: RTL

;===================================================================================================

Credits_LoadScene_Underworld:
#_0286FD: JSL EnableForceBlank
#_028701: JSL EraseTilemaps_normal

#_028705: REP #$20

#_028707: LDX.b $11

#_028709: LDA.l .screen,X
#_02870D: STA.w $010E

#_028710: SEP #$20

#_028712: JSR Underworld_LoadEntrance

#_028715: STZ.w $045A
#_028718: STZ.w $0458

#_02871B: JSR Underworld_LoadAndDrawRoom

#_02871E: LDX.w $0AA1

#_028721: LDA.l AnimatedTileSheets,X
#_028725: TAY

#_028726: JSL DecompressAnimatedUnderworldTiles

#_02872A: LDA.b $11
#_02872C: LSR A
#_02872D: TAX

#_02872E: LDA.l .sprite_gfx,X
#_028732: STA.w $0AA3

#_028735: LDA.l .sprite_palette,X
#_028739: ASL A
#_02873A: ASL A
#_02873B: TAX

#_02873C: LDA.l UnderworldPaletteSets+2,X
#_028740: STA.w $0AAD

#_028743: LDA.l UnderworldPaletteSets+3,X
#_028747: STA.w $0AAE

#_02874A: LDA.b #$0A
#_02874C: STA.w $0AA4

#_02874F: JSL InitializeTilesets

#_028753: LDA.b #$0A
#_028755: STA.w $0AB1

#_028758: JSR Underworld_LoadPalettes

#_02875B: LDA.b #$09
#_02875D: STA.b $94

#_02875F: STZ.b $C8
#_028761: STZ.b $C9

#_028763: STZ.b $13

#_028765: INC.b $11

#_028767: JSL Credits_PrepAndLoadSprites

#_02876B: RTL

;===================================================================================================

pool Module07_Underworld

.submodules
#_02876C: dw Module07_00_PlayerControl                    ; 0x00
#_02876E: dw Module07_01_IntraroomTransition              ; 0x01
#_028770: dw Module07_02_InterroomTransition              ; 0x02
#_028772: dw Module07_03_OverlayChange                    ; 0x03
#_028774: dw Module07_04_UnlockDoor                       ; 0x04
#_028776: dw Module07_05_ControlShutters                  ; 0x05
#_028778: dw Module07_06_FatInterRoomStairs               ; 0x06
#_02877A: dw Module07_07_FallingTransition                ; 0x07
#_02877C: dw Module07_08_NorthIntraRoomStairs             ; 0x08
#_02877E: dw Module07_09_OpenCrackedDoor                  ; 0x09
#_028780: dw Module07_0A_ChangeBrightness                 ; 0x0A
#_028782: dw Module07_0B_DrainSwampPool                   ; 0x0B
#_028784: dw Module07_0C_FloodSwampWater                  ; 0x0C
#_028786: dw Module07_0D_FloodDam                         ; 0x0D
#_028788: dw Module07_0E_SpiralStairs                     ; 0x0E
#_02878A: dw Module07_0F_LandingWipe                      ; 0x0F
#_02878C: dw Module07_10_SouthIntraRoomStairs             ; 0x10
#_02878E: dw Module07_11_StraightInterroomStairs          ; 0x11
#_028790: dw Module07_11_StraightInterroomStairs          ; 0x12
#_028792: dw Module07_11_StraightInterroomStairs          ; 0x13
#_028794: dw Module07_14_RecoverFromFall                  ; 0x14
#_028796: dw Module07_15_WarpPad                          ; 0x15
#_028798: dw Module07_16_UpdatePegs                       ; 0x16
#_02879A: dw Module07_17_PressurePlate                    ; 0x17
#_02879C: dw Module07_18_RescuedMaiden                    ; 0x18
#_02879E: dw Module07_19_MirrorFade                       ; 0x19
#_0287A0: dw Module07_1A_RoomDraw_OpenTriforceDoor_bounce ; 0x1A

pool off

;---------------------------------------------------------------------------------------------------

Module07_Underworld:
#_0287A2: SEP #$30

#_0287A4: JSL Underworld_HandleLayerEffect

#_0287A8: LDA.b $11
#_0287AA: ASL A
#_0287AB: TAX

#_0287AC: JSR (.submodules,X)

#_0287AF: STZ.w $042C

#_0287B2: JSL PushBlock_Handler

#_0287B6: LDA.b $11
#_0287B8: BNE .continue

;---------------------------------------------------------------------------------------------------

#_0287BA: JSL Graphics_LoadChrHalfSlot
#_0287BE: JSR Underworld_HandleCamera

#_0287C1: LDA.b $11
#_0287C3: BNE .continue

#_0287C5: JSL Underworld_HandleRoomTags

#_0287C9: LDA.b $11
#_0287CB: BNE .continue

#_0287CD: JSL Underworld_ProcessTorchesAndDoors

#_0287D1: LDA.w $0454
#_0287D4: BEQ .no_blast_wall

#_0287D6: JSL Underworld_ClearAwayExplodingWall

.no_blast_wall
#_0287DA: LDA.b $6C
#_0287DC: BNE .continue

#_0287DE: JSR Underworld_TryScreenEdgeTransition

;---------------------------------------------------------------------------------------------------

.continue
#_0287E1: JSL OrientLampLightCone

#_0287E5: REP #$21

#_0287E7: LDA.b $E2
#_0287E9: PHA

#_0287EA: ADC.w $011A
#_0287ED: STA.b $E2
#_0287EF: STA.w $011E

#_0287F2: LDA.b $E8
#_0287F4: PHA

#_0287F5: CLC
#_0287F6: ADC.w $011C
#_0287F9: STA.b $E8
#_0287FB: STA.w $0122

#_0287FE: LDA.b $E0
#_028800: PHA

#_028801: CLC
#_028802: ADC.w $011A
#_028805: STA.b $E0
#_028807: STA.w $0120

#_02880A: LDA.b $E6
#_02880C: PHA

#_02880D: CLC
#_02880E: ADC.w $011C
#_028811: STA.b $E6
#_028813: STA.w $0124

#_028816: LDA.w $0428
#_028819: AND.w #$00FF
#_02881C: BEQ .keep_camera_coords

;---------------------------------------------------------------------------------------------------

#_02881E: PLA
#_02881F: PLA

#_028820: LDA.w $0422
#_028823: CLC
#_028824: ADC.b $E2
#_028826: STA.w $0120
#_028829: STA.b $E0

#_02882B: PHA

#_02882C: LDA.w $0424
#_02882F: CLC
#_028830: ADC.b $E8
#_028832: STA.w $0124
#_028835: STA.b $E6

#_028837: PHA

;---------------------------------------------------------------------------------------------------

.keep_camera_coords
#_028838: SEP #$20

#_02883A: JSL Underworld_DrawAllPushBlocks
#_02883E: JSL Sprite_Main

#_028842: REP #$20

#_028844: PLA
#_028845: STA.b $E6

#_028847: PLA
#_028848: STA.b $E0

#_02884A: PLA
#_02884B: STA.b $E8

#_02884D: PLA
#_02884E: STA.b $E2

#_028850: SEP #$20

#_028852: JSL LinkOAM_Main

#_028856: JSL RefillLogic_long
#_02885A: JML HUD_HandleFloorIndicator

;===================================================================================================

Underworld_TryScreenEdgeTransition:
#_02885E: REP #$20

#_028860: LDA.b $30
#_028862: AND.w #$00FF
#_028865: BEQ .no_vertical_movement

#_028867: LDA.b $67
#_028869: AND.w #$000C
#_02886C: STA.b $00

#_02886E: LDA.b $20
#_028870: AND.w #$01FF

#_028873: LDX.b #$03
#_028875: CMP.w #$0004
#_028878: BCC .check_for_transition

#_02887A: LDX.b #$02
#_02887C: CMP.w #$01DC
#_02887F: BCS .check_for_transition

;---------------------------------------------------------------------------------------------------

.no_vertical_movement
#_028881: LDA.b $31
#_028883: AND.w #$00FF
#_028886: BEQ .exit

#_028888: LDA.b $67
#_02888A: AND.w #$0003
#_02888D: STA.b $00

#_02888F: LDA.b $22
#_028891: AND.w #$01FF

#_028894: LDX.b #$01

#_028896: CMP.w #$0008
#_028899: BCC .check_for_transition

#_02889B: LDX.b #$00
#_02889D: CMP.w #$01E9
#_0288A0: BCC .exit

;---------------------------------------------------------------------------------------------------

.check_for_transition
#_0288A2: SEP #$20

#_0288A4: JSL Link_CheckForEdgeScreenTransition
#_0288A8: BCS .exit

#_0288AA: LDA.b $10
#_0288AC: CMP.b #$07
#_0288AE: BNE .exit

#_0288B0: JSL Underworld_HandleEdgeTransitionMovement

#_0288B4: LDA.b $10
#_0288B6: CMP.b #$07
#_0288B8: BNE .exit

#_0288BA: LDA.b #$02
#_0288BC: STA.b $11

.exit
#_0288BE: SEP #$20

#_0288C0: RTS

;===================================================================================================

pool Underworld_HandleEdgeTransitionMovement

.masks
#_0288C1: db $03
#_0288C2: db $03
#_0288C3: db $0C
#_0288C4: db $0C

pool off

;---------------------------------------------------------------------------------------------------

Underworld_HandleEdgeTransitionMovement:
#_0288C5: LDA.b $67
#_0288C7: AND.l .masks,X
#_0288CB: STA.b $67

#_0288CD: TXA
#_0288CE: JSL JumpTableLong
#_0288D2: dl HandleEdgeTransitionMovementEast
#_0288D5: dl HandleEdgeTransitionMovementWest
#_0288D8: dl HandleEdgeTransitionMovementSouth
#_0288DB: dl HandleEdgeTransitionMovementNorth

;===================================================================================================

Module07_00_PlayerControl:
#_0288DE: LDA.w $0112
#_0288E1: ORA.w $02E4
#_0288E4: ORA.w $0FFC
#_0288E7: BEQ .in_control

#_0288E9: JMP.w .no_SELECTing

;---------------------------------------------------------------------------------------------------

.in_control
#_0288EC: LDA.b $F4
#_0288EE: AND.b #$10
#_0288F0: BEQ .no_START_press

#_0288F2: STZ.w $0200

#_0288F5: LDA.b #$01

#_0288F7: BRA .open_interface

;---------------------------------------------------------------------------------------------------

.no_START_press
#_0288F9: LDA.b $F6
#_0288FB: AND.b #$40
#_0288FD: BEQ .no_mapping

#_0288FF: LDA.w $040C
#_028902: CMP.b #$FF ; DUNGEON FF
#_028904: BEQ .no_mapping

#_028906: LDA.b $A0 ; ROOM 0000
#_028908: BEQ .no_mapping

#_02890A: STZ.w $0200

#_02890D: LDA.b #$03

;---------------------------------------------------------------------------------------------------

.open_interface
#_02890F: STA.b $11

#_028911: LDA.b $10
#_028913: STA.w $010C

#_028916: LDA.b #$0E
#_028918: STA.b $10

#_02891A: RTS

;---------------------------------------------------------------------------------------------------

.no_mapping
#_02891B: LDA.b $F0
#_02891D: AND.b #$20
#_02891F: BEQ .no_SELECTing

#_028921: LDA.l $7EF3C5
#_028925: BEQ .no_SELECTing

#_028927: LDA.w $1CE8
#_02892A: STA.w $1CF4

#_02892D: REP #$20

#_02892F: LDA.w #$0186 ; MESSAGE 0186
#_028932: STA.w $1CF0

#_028935: SEP #$20

#_028937: LDA.b $10
#_028939: PHA

#_02893A: JSL Interface_PrepAndDisplayMessage

#_02893E: PLA
#_02893F: STA.b $10

#_028941: STZ.b $B0

#_028943: LDA.b #$0B

#_028945: BRA .open_interface

;---------------------------------------------------------------------------------------------------

.no_SELECTing
#_028947: JSL Link_Main

#_02894B: RTS

;===================================================================================================

Underworld_SubscreenEnable:
#_02894C: db $00, $01, $01, $FF, $01, $01, $01, $01

;===================================================================================================

PendantBossRooms:
#_028954: dw $00C8 ; ROOM 00C8 - Armos
#_028956: dw $0033 ; ROOM 0033 - Lanmolas
#_028958: dw $0007 ; ROOM 0007 - Moldorm
#_02895A: dw $0020 ; ROOM 0020 - Agahnim 1

;===================================================================================================

CrystalBossRooms:
#_02895C: dw $0006 ; ROOM 0006 - Arrghus
#_02895E: dw $005A ; ROOM 005A - Helmasaur
#_028960: dw $0029 ; ROOM 0029 - Mothula
#_028962: dw $0090 ; ROOM 0090 - Vitreous
#_028964: dw $00DE ; ROOM 00DE - Kholdstare
#_028966: dw $00A4 ; ROOM 00A4 - Trinexx
#_028968: dw $00AC ; ROOM 00AC - Blind
#_02896A: dw $000D ; ROOM 000D - Agahnim 2

;===================================================================================================

pool Module07_01_IntraroomTransition

.subsubmodules
#_02896C: dw UnderworldTransition_Intraroom_PrepTransition  ; 0x00
#_02896E: dw UnderworldTransition_Intraroom_ApplyFilter     ; 0x01
#_028970: dw UnderworldTransition_Intraroom_ResetShutters   ; 0x02
#_028972: dw UnderworldTransition_ScrollRoom                ; 0x03
#_028974: dw UnderworldTransition_FindTransitionLanding     ; 0x04
#_028976: dw UnderworldTransition_HandleFinalMovements      ; 0x05
#_028978: dw UnderworldTransition_Intraroom_ApplyFilter     ; 0x06
#_02897A: dw UnderworldTransition_Intraroom_TriggerShutters ; 0x07

pool off

;---------------------------------------------------------------------------------------------------

Module07_01_IntraroomTransition:
#_02897C: REP #$20

#_02897E: LDA.b $22
#_028980: STA.w $0FC2

#_028983: LDA.b $20
#_028985: STA.w $0FC4

#_028988: SEP #$20

#_02898A: JSL Link_HandleMovingAnimation_FullLongEntry

#_02898E: LDA.b $B0
#_028990: ASL A
#_028991: TAX

#_028992: JMP.w (.subsubmodules,X)

;===================================================================================================

UnderworldTransition_Intraroom_ResetShutters:
#_028995: STZ.w $0468

#_028998: LDA.b #$07
#_02899A: STA.w $0690

#_02899D: LDA.b $11
#_02899F: PHA

#_0289A0: JSL OperateShutterDoors

#_0289A4: PLA
#_0289A5: STA.b $11

#_0289A7: LDA.b #$1F
#_0289A9: STA.l $7EC007

#_0289AD: LDA.b #$00
#_0289AF: STA.l $7EC00B

#_0289B3: INC.b $B0

#_0289B5: RTS

;===================================================================================================

UnderworldTransition_Intraroom_PrepTransition:
#_0289B6: REP #$20

#_0289B8: LDA.w #$0000
#_0289BB: STA.l $7EC009
#_0289BF: STA.l $7EC007

#_0289C3: LDA.w #$001F
#_0289C6: STA.l $7EC00B

#_0289CA: STZ.w $0AA6

#_0289CD: SEP #$20

#_0289CF: STZ.w $0646
#_0289D2: STZ.w $0642

#_0289D5: INC.b $B0

#_0289D7: RTS

;===================================================================================================

UnderworldTransition_Intraroom_ApplyFilter:
#_0289D8: LDA.l $7EC005
#_0289DC: BEQ .advance

#_0289DE: JSL ApplyPaletteFilter

#_0289E2: LDA.l $7EC007
#_0289E6: BEQ .exit

#_0289E8: JSL ApplyPaletteFilter

.exit
#_0289EC: RTS

.advance
#_0289ED: INC.b $B0

#_0289EF: RTS

;===================================================================================================

UnderworldTransition_Intraroom_TriggerShutters:
#_0289F0: JSR ResetThenCacheRoomEntryProperties

#_0289F3: LDA.w $0468
#_0289F6: BNE .exit

#_0289F8: INC.w $0468

#_0289FB: STZ.w $068E
#_0289FE: STZ.w $0690

#_028A01: LDA.b #$05
#_028A03: STA.b $11

.exit
#_028A05: RTS

;===================================================================================================

pool Module07_02_InterroomTransition

.subsubmodules
#_028A06: dw Module07_02_00_InitializeTransition         ; 0x00
#_028A08: dw Module07_02_01_LoadNextRoom                 ; 0x01
#_028A0A: dw Module07_02_FadedFilter                     ; 0x02
#_028A0C: dw Module07_02_03                              ; 0x03
#_028A0E: dw Underworld_PrepNextQuadrantUploadAndAdvance ; 0x04
#_028A10: dw Underworld_PrepTilemapAndAdvance            ; 0x05
#_028A12: dw Underworld_PrepNextQuadrantUploadAndAdvance ; 0x06
#_028A14: dw Module07_02_07                              ; 0x07
#_028A16: dw UnderworldTransition_ScrollRoom             ; 0x08
#_028A18: dw Module07_02_09                              ; 0x09
#_028A1A: dw Module07_02_0A                              ; 0x0A
#_028A1C: dw Module07_02_09                              ; 0x0B
#_028A1E: dw Module07_02_0C                              ; 0x0C
#_028A20: dw Module07_02_0D                              ; 0x0D
#_028A22: dw Module07_02_FadedFilter                     ; 0x0E
#_028A24: dw Module07_02_0F                              ; 0x0F

pool off

;---------------------------------------------------------------------------------------------------

Module07_02_InterroomTransition:
#_028A26: REP #$20

#_028A28: LDA.b $22
#_028A2A: STA.w $0FC2

#_028A2D: LDA.b $20
#_028A2F: STA.w $0FC4

#_028A32: SEP #$20

#_028A34: LDA.b $B0
#_028A36: BEQ .run_subsubsub

#_028A38: CMP.b #$07
#_028A3A: BCC .skip_upload

#_028A3C: JSL Graphics_IncrementalVRAMUpload

.skip_upload
#_028A40: JSL Underworld_LoadAttribute_Selectable

.run_subsubsub
#_028A44: JSL Link_HandleMovingAnimation_FullLongEntry

#_028A48: LDA.b $B0
#_028A4A: ASL A
#_028A4B: TAX

#_028A4C: JMP.w (.subsubmodules,X)

;===================================================================================================

Module07_02_00_InitializeTransition:
#_028A4F: LDA.w $0458
#_028A52: PHA

#_028A53: JSR ResetTransitionPropsAndAdvanceSubmodule

#_028A56: PLA
#_028A57: STA.w $0458

#_028A5A: RTS

;===================================================================================================

Module07_02_01_LoadNextRoom:
#_028A5B: JSL Underworld_LoadRoom
#_028A5F: JSL ResetStarTileGraphics
#_028A63: JSL LoadTransAuxGFX_sprite

#_028A67: INC.b $B0

#_028A69: STZ.w $0200

#_028A6C: LDA.b $A2
#_028A6E: PHA

#_028A6F: LDA.b $A0
#_028A71: STA.w $048E

#_028A74: PLA
#_028A75: STA.b $A2

#_028A77: JSL Underworld_ResetSprites

#_028A7B: LDA.w $0458
#_028A7E: BNE .no_scroll_sync

#_028A80: JSR UnderworldSyncBG1and2Scroll

.no_scroll_sync
#_028A83: STZ.w $0458

#_028A86: RTS

;===================================================================================================

Module07_02_03:
#_028A87: LDA.l $7EC005
#_028A8B: ORA.l $7EC006
#_028A8F: BEQ .keep_subscreen_enable

#_028A91: STZ.b $1D

.keep_subscreen_enable
#_028A93: JSL Underworld_AdjustForRoomLayout
#_028A97: JSL LoadNewSpriteGFXSet

#_028A9B: JSR UnderworldSyncBG1and2Scroll
#_028A9E: JSL WaterFlood_BuildOneQuadrantForVRAM

#_028AA2: INC.b $B0

#_028AA4: RTS

;===================================================================================================

Module07_02_0A:
#_028AA5: LDA.l $7EC005
#_028AA9: ORA.l $7EC006
#_028AAD: BEQ Underworld_PrepTilemapAndAdvance

;===================================================================================================

Underworld_FilterPrepTilemapAndAdvance:
#_028AAF: JSL ApplyPaletteFilter

;===================================================================================================

Underworld_PrepTilemapAndAdvance:
#_028AB3: JSL WaterFlood_BuildOneQuadrantForVRAM

#_028AB7: INC.b $B0

#_028AB9: RTS

;===================================================================================================

Module07_02_09:
#_028ABA: LDA.l $7EC005
#_028ABE: ORA.l $7EC006
#_028AC2: BEQ Underworld_PrepNextQuadrantUploadAndAdvance

;===================================================================================================

Underworld_FilterUploadAndAdvance:
#_028AC4: JSL ApplyPaletteFilter

;===================================================================================================

Underworld_PrepNextQuadrantUploadAndAdvance:
#_028AC8: JSL Underworld_PrepareNextRoomQuadrantUpload

#_028ACC: INC.b $B0

#_028ACE: RTS

;===================================================================================================

Module07_02_0C:
#_028ACF: LDA.b $11
#_028AD1: CMP.b #$02
#_028AD3: BNE Underworld_AdvanceAndReset

#_028AD5: LDA.w $0200
#_028AD8: CMP.b #$05
#_028ADA: BNE EXIT_028B2D

#_028ADC: JSR IntraroomTransitionCalculateLanding

#_028ADF: LDA.l $7EC005
#_028AE3: ORA.l $7EC006
#_028AE7: BEQ Underworld_AdvanceAndReset

#_028AE9: JSL ApplyPaletteFilter

;===================================================================================================

Underworld_AdvanceAndReset:
#_028AED: INC.b $B0

;===================================================================================================

Underworld_ResetTorchBackgroundAndPlayer:
#_028AEF: LDY.b #$16
#_028AF1: LDX.w $0414

#_028AF4: LDA.l Underworld_SubscreenEnable,X
#_028AF8: BPL .disable

#_028AFA: LDY.b #$17
#_028AFC: LDA.b #$00

.disable
#_028AFE: CPX.b #$02
#_028B00: BNE .wait_dont_disable

#_028B02: LDA.b #$03

.wait_dont_disable
#_028B04: STY.b $1C
#_028B06: STA.b $1D

#_028B08: JSL RestoreTorchBackground

;===================================================================================================

DeleteCertainAncillaeStopDashing:
#_028B0C: JSL Ancilla_TerminateSelectInteractives

#_028B10: LDA.w $0372
#_028B13: BEQ EXIT_028B2D

#_028B15: STZ.b $4D
#_028B17: STZ.b $46

#_028B19: LDA.b #$FF
#_028B1B: STA.b $29
#_028B1D: STA.b $C7

#_028B1F: STZ.b $3D
#_028B21: STZ.b $5E

#_028B23: STZ.w $032B
#_028B26: STZ.w $0372

#_028B29: LDA.b #$00 ; LINKSTATE 00
#_028B2B: STA.b $5D

;---------------------------------------------------------------------------------------------------

#EXIT_028B2D:
#_028B2D: RTS

;===================================================================================================

Module07_02_07:
#_028B2E: REP #$10

#_028B30: LDX.b $E2
#_028B32: STX.b $E0

#_028B34: LDX.b $E8
#_028B36: STX.b $E6

#_028B38: LDX.b $A0

#_028B3A: CPX.w #$0036 ; ROOM 0036
#_028B3D: BEQ .dont_change_mainandsubscreen

#_028B3F: CPX.w #$0038 ; ROOM 0038
#_028B42: BEQ .dont_change_mainandsubscreen

#_028B44: LDX.w $0414
#_028B47: LDY.w #$0016

#_028B4A: LDA.l Underworld_SubscreenEnable,X
#_028B4E: BEQ .am_zero

#_028B50: LDY.w #$0116

.am_zero
#_028B53: CPY.b $1C
#_028B55: BEQ .dont_change_mainandsubscreen

#_028B57: LDA.b $1C
#_028B59: CMP.b #$17
#_028B5B: BEQ .set_mainandsubscreen

#_028B5D: ORA.b $1D
#_028B5F: CMP.b #$17
#_028B61: BEQ .dont_change_mainandsubscreen

.set_mainandsubscreen
#_028B63: STY.b $1C

.dont_change_mainandsubscreen
#_028B65: SEP #$10

;===================================================================================================

UnderworldTransition_RunFiltering:
#_028B67: LDA.l $7EC005
#_028B6B: ORA.l $7EC006
#_028B6F: BEQ .no_filter

#_028B71: LDX.b #$03

#_028B73: LDA.l $7EC005
#_028B77: BEQ .use_fixed_color_3

#_028B79: LDX.w $045A

.use_fixed_color_3
#_028B7C: LDA.l RoomEffectFixedColors,X
#_028B80: STA.l $7EC017

#_028B84: JSL ApplyGrayscaleFixed_Parameterized

#_028B88: LDA.b #$00
#_028B8A: STA.l $7EC00B

.no_filter
#_028B8E: JSR Underworld_HandleTranslucencyAndPalettes

#_028B91: RTS

;===================================================================================================

Module07_02_FadedFilter:
#_028B92: LDA.l $7EC005
#_028B96: ORA.l $7EC006
#_028B9A: BEQ .next_subsub

#_028B9C: JSL ApplyPaletteFilter
#_028BA0: LDA.l $7EC007
#_028BA4: BEQ .exit

#_028BA6: JSL ApplyPaletteFilter

.exit
#_028BAA: RTS

.next_subsub
#_028BAB: INC.b $B0

#_028BAD: RTS

;===================================================================================================

Module07_02_0F:
#_028BAE: JSR ResetThenCacheRoomEntryProperties

#_028BB1: LDA.w $0468
#_028BB4: BNE Underworld_SetBossOrSancMusicUponEntry

#_028BB6: LDA.b $A0

#_028BB8: CMP.b #$AC ; ROOM 00AC
#_028BBA: BNE .not_workable_blinds_room

#_028BBC: LDA.w $0403
#_028BBF: AND.b #$20
#_028BC1: BNE .not_workable_blinds_room

#_028BC3: LDA.w $0403
#_028BC6: AND.b #$10
#_028BC8: BEQ Underworld_SetBossOrSancMusicUponEntry

.not_workable_blinds_room
#_028BCA: INC.w $0468

#_028BCD: STZ.w $068E
#_028BD0: STZ.w $0690

#_028BD3: LDA.b #$05
#_028BD5: STA.b $11

;===================================================================================================

Underworld_SetBossOrSancMusicUponEntry:
#_028BD7: REP #$20

#_028BD9: LDX.b #$14 ; SONG 14

#_028BDB: LDA.b $A0

#_028BDD: CMP.w #$0012 ; ROOM 0012
#_028BE0: BEQ .set_song

#_028BE2: LDX.b #$10 ; SONG 10

#_028BE4: CMP.w #$0002 ; ROOM 0002
#_028BE7: BEQ .set_song

;---------------------------------------------------------------------------------------------------

#_028BE9: LDX.b #$18

.check_next_room
#_028BEB: DEX
#_028BEC: DEX
#_028BED: BMI .exit

#_028BEF: CMP.l PendantBossRooms,X
#_028BF3: BNE .check_next_room

;---------------------------------------------------------------------------------------------------

#_028BF5: SEP #$20

#_028BF7: JSL CheckIfScreenIsClear
#_028BFB: BCS .exit

#_028BFD: LDX.b #$15 ; SONG 15

.set_song
#_028BFF: STX.w $012C

.exit
#_028C02: SEP #$20

#_028C04: RTS

;===================================================================================================

Module07_03_OverlayChange:
#_028C05: JSL Underworld_ApplyRoomOverlay

#_028C09: RTS

;===================================================================================================

Module07_04_UnlockDoor:
#_028C0A: JSL UnlockKeyDoor_Main

#_028C0E: RTS

;===================================================================================================

Module07_05_ControlShutters:
#_028C0F: JSL OperateShutterDoors

#_028C13: RTS

;===================================================================================================

Module07_06_FatInterRoomStairs:
#_028C14: LDA.b $B0
#_028C16: CMP.b #$03
#_028C18: BCC .dont_reload_tile_types

#_028C1A: JSL Underworld_LoadAttribute_Selectable

.dont_reload_tile_types
#_028C1E: LDA.b $B0
#_028C20: CMP.b #$0D
#_028C22: BCC .skip_gfx_updates

#_028C24: JSL Graphics_IncrementalVRAMUpload

#_028C28: LDA.w $0464
#_028C2B: BEQ .run_subsubsub

#_028C2D: DEC.w $0464

#_028C30: CMP.b #$10
#_028C32: BNE .dont_add_stair_drag

#_028C34: LDA.b #$02
#_028C36: STA.b $57

.dont_add_stair_drag
#_028C38: LDX.b #$08

#_028C3A: LDA.w $0462
#_028C3D: AND.b #$04
#_028C3F: BEQ .going_up

#_028C41: LDX.b #$04

.going_up
#_028C43: STX.b $67

#_028C45: JSL Link_HandleVelocity
#_028C49: JSR Underworld_HandleCamera

;---------------------------------------------------------------------------------------------------

.skip_gfx_updates
#_028C4C: JSL Link_HandleMovingAnimation_FullLongEntry

.run_subsubsub
#_028C50: LDA.b $B0
#_028C52: JSL JumpTableLocal
#_028C56: dw ResetTransitionPropsAndAdvance_ResetInterface       ; 0x00
#_028C58: dw UnderworldTransition_FatStairs_RunFade              ; 0x01
#_028C5A: dw Underworld_InitializeRoomFromSpecial                ; 0x02
#_028C5C: dw UnderworldTransition_TriggerBGC34UpdateAndAdvance   ; 0x03
#_028C5E: dw UnderworldTransition_TriggerBGC56UpdateAndAdvance   ; 0x04
#_028C60: dw UnderworldTransition_LoadSpriteGFX                  ; 0x05
#_028C62: dw UnderworldTransition_AdjustForFatStairScroll        ; 0x06
#_028C64: dw Underworld_PrepNextQuadrantUploadAndAdvance         ; 0x07
#_028C66: dw Underworld_PrepTilemapAndAdvance                    ; 0x08
#_028C68: dw Underworld_PrepNextQuadrantUploadAndAdvance         ; 0x09
#_028C6A: dw Underworld_FilterPrepTilemapAndAdvance              ; 0x0A
#_028C6C: dw Underworld_FilterUploadAndAdvance                   ; 0x0B
#_028C6E: dw Underworld_FilterPrepTilemapAndAdvance              ; 0x0C
#_028C70: dw Underworld_FilterUploadAndAdvance                   ; 0x0D
#_028C72: dw Underworld_DoubleApplyAndIncrementGrayscale         ; 0x0E
#_028C74: dw Underworld_AdvanceAndReset                          ; 0x0F
#_028C76: dw UnderworldTransition_FatStairsEntryCache            ; 0x10

;===================================================================================================

Module07_0E_01_HandleMusicAndResetProps:
#_028C78: REP #$20

#_028C7A: LDA.b $A0
#_028C7C: CMP.w #$0007 ; ROOM 0007
#_028C7F: BEQ .not_moldorm_room

#_028C81: CMP.w #$0017 ; ROOM 0017
#_028C84: BNE .dont_fade_music

#_028C86: LDX.w $0130
#_028C89: CPX.b #$11 ; SONG 11
#_028C8B: BEQ .dont_fade_music

.not_moldorm_room
#_028C8D: LDA.l $7EF374
#_028C91: LSR A
#_028C92: BCS .dont_fade_music

#_028C94: LDX.b #$F1 ; SONG F1
#_028C96: STX.w $012C

;---------------------------------------------------------------------------------------------------

.dont_fade_music
#_028C99: SEP #$20

#_028C9B: LDX.b #$58

#_028C9D: LDA.w $0462
#_028CA0: AND.b #$04
#_028CA2: BEQ .going_up

#_028CA4: LDX.b #$6A

.going_up
#_028CA6: STX.w $0464

;===================================================================================================

ResetTransitionPropsAndAdvance_ResetInterface:
#_028CA9: STZ.w $0200

;===================================================================================================

ResetTransitionPropsAndAdvanceSubmodule:
#_028CAC: REP #$30

#_028CAE: LDA.w #$0000
#_028CB1: STA.l $7EC011
#_028CB5: STA.l $7EC009
#_028CB9: STA.l $7EC007

#_028CBD: LDA.w #$001F
#_028CC0: STA.l $7EC00B

#_028CC4: STZ.w $0AA6
#_028CC7: STZ.w $045A

#_028CCA: LDA.w $0458
#_028CCD: BEQ .dark_room

#_028CCF: LDA.w #$B302
#_028CD2: STA.b $99

.dark_room
#_028CD4: SEP #$30

#_028CD6: STZ.w $0458

#_028CD9: JSR DeleteCertainAncillaeStopDashing
#_028CDC: JSR Overworld_CopyPalettesToCache

#_028CDF: INC.b $B0

#_028CE1: RTS

;===================================================================================================

Underworld_InitializeRoomFromSpecial:
#_028CE2: JSR Underworld_AdjustCameraArbitrary

#_028CE5: JSL Underworld_LoadRoom
#_028CE9: JSL ResetStarTileGraphics

#_028CED: JSL LoadTransAuxGFX
#_028CF1: JSL Underworld_LoadCustomTileTypes

#_028CF5: LDA.b $A0
#_028CF7: STA.w $048E

#_028CFA: JSL Follower_Initialize

#_028CFE: INC.b $B0

#_028D00: RTS

;===================================================================================================

UnderworldTransition_FatStairs_RunFade:
#_028D01: JSL ApplyPaletteFilter

#_028D05: LDA.l $7EC007
#_028D09: BEQ .exit

#_028D0B: JSL ApplyPaletteFilter

.exit
#_028D0F: RTS

;===================================================================================================

UnderworldTransition_LoadSpriteGFX:
#_028D10: JSL LoadNewSpriteGFXSet
#_028D14: JSL Underworld_ResetSprites

#_028D18: JMP.w UnderworldTransition_RunFiltering

;===================================================================================================

UnderworldTransition_AdjustForFatStairScroll:
#_028D1B: JSR UnderworldSyncBG1and2Scroll
#_028D1E: JSL Underworld_AdjustForRoomLayout

#_028D22: LDY.b #$16
#_028D24: LDX.w $0414

#_028D27: LDA.l Underworld_SubscreenEnable,X
#_028D2B: BPL .valid_subscreens

#_028D2D: LDY.b #$17
#_028D2F: LDA.b #$00

.valid_subscreens
#_028D31: STY.b $1C
#_028D33: STA.b $1D

#_028D35: INC.b $A4

#_028D37: LDA.b #$01
#_028D39: STA.b $57

#_028D3B: LDY.b #$17 ; SFX2.17
#_028D3D: LDX.b #$30

#_028D3F: LDA.w $0462
#_028D42: AND.b #$04
#_028D44: BEQ .going_upstairs

#_028D46: LDY.b #$19 ; SFX2.19

#_028D48: DEC.b $A4
#_028D4A: DEC.b $A4

#_028D4C: LDX.b #$20

.going_upstairs
#_028D4E: STX.w $0464
#_028D51: STY.w $012E

;---------------------------------------------------------------------------------------------------

#_028D54: LDA.b #$24 ; SFX3.24
#_028D56: STA.w $012F

#_028D59: JSR Underworld_PlayBlipAndCacheQuadrantVisits

#_028D5C: JMP.w Underworld_PrepTilemapAndAdvance

;===================================================================================================

UnderworldTransition_FatStairsEntryCache:
#_028D5F: LDA.l $7EC009
#_028D63: ORA.l $7EC007
#_028D67: BEQ .continue

.exit
#_028D69: RTS

.continue
#_028D6A: LDA.w $0200
#_028D6D: CMP.b #$05
#_028D6F: BNE .exit

;===================================================================================================

ResetThenCacheRoomEntryProperties:
#_028D71: STZ.w $0200
#_028D74: STZ.b $B0

#_028D76: STZ.w $0418
#_028D79: STZ.b $11

#_028D7B: STZ.w $0642
#_028D7E: STZ.w $0641

;===================================================================================================

CacheRoomEntryProperties:
#_028D81: REP #$20

#_028D83: LDA.b $E2
#_028D85: STA.l $7EC180

#_028D89: LDA.b $E8
#_028D8B: STA.l $7EC182

#_028D8F: LDA.b $20
#_028D91: STA.l $7EC184

#_028D95: LDA.b $22
#_028D97: STA.l $7EC186

#_028D9B: LDA.w $0600
#_028D9E: STA.l $7EC188

#_028DA2: LDA.w $0604
#_028DA5: STA.l $7EC18A

#_028DA9: LDA.w $0608
#_028DAC: STA.l $7EC18C

#_028DB0: LDA.w $060C
#_028DB3: STA.l $7EC18E

#_028DB7: LDA.w $0610
#_028DBA: STA.l $7EC190

#_028DBE: LDA.w $0612
#_028DC1: STA.l $7EC192

#_028DC5: LDA.w $0614
#_028DC8: STA.l $7EC194

#_028DCC: LDA.w $0616
#_028DCF: STA.l $7EC196

#_028DD3: LDA.w $0618
#_028DD6: STA.l $7EC198

#_028DDA: LDA.w $061C
#_028DDD: STA.l $7EC19A

#_028DE1: LDA.b $A6
#_028DE3: STA.l $7EC19C

#_028DE7: LDA.b $A9
#_028DE9: STA.l $7EC19E

#_028DED: SEP #$20

#_028DEF: LDA.b $2F
#_028DF1: STA.l $7EC1A6

#_028DF5: LDA.b $EE
#_028DF7: STA.l $7EC1A7

#_028DFB: LDA.w $0476
#_028DFE: STA.l $7EC1A8

#_028E02: LDA.b $6C
#_028E04: STA.l $7EC1A9

#_028E08: LDA.b $A4
#_028E0A: STA.l $7EC1AA

#_028E0E: RTS

;===================================================================================================

UnderworldTransition_TriggerBGC34UpdateAndAdvance:
#_028E0F: JSL PrepTransAuxGfx

#_028E13: LDA.b #$09
#_028E15: STA.b $17
#_028E17: STA.w $0710

#_028E1A: INC.b $B0

#_028E1C: RTS

;===================================================================================================

UnderworldTransition_TriggerBGC56UpdateAndAdvance:
#_028E1D: LDA.b #$0A
#_028E1F: STA.b $17
#_028E21: STA.w $0710

#_028E24: INC.b $B0

#_028E26: RTS

;===================================================================================================

Module07_07_FallingTransition:
#_028E27: LDA.b $B0
#_028E29: CMP.b #$06
#_028E2B: BCC .run_subsubsub

#_028E2D: JSL Graphics_IncrementalVRAMUpload
#_028E31: JSL Underworld_LoadAttribute_Selectable
#_028E35: JSL ApplyGrayscaleFixed_Incremental

.run_subsubsub
#_028E39: LDA.b $B0
#_028E3B: JSL JumpTableLocal
#_028E3F: dw Module07_07_00_HandleMusicAndResetRoom            ; 0x00
#_028E41: dw ApplyPaletteFilter_bounce                         ; 0x01
#_028E43: dw Underworld_InitializeRoomFromSpecial              ; 0x02
#_028E45: dw UnderworldTransition_TriggerBGC34UpdateAndAdvance ; 0x03
#_028E47: dw UnderworldTransition_TriggerBGC56UpdateAndAdvance ; 0x04
#_028E49: dw UnderworldTransition_LoadSpriteGFX                ; 0x05
#_028E4B: dw Module07_07_06_SyncBG1and2                        ; 0x06
#_028E4D: dw Underworld_PrepNextQuadrantUploadAndAdvance       ; 0x07
#_028E4F: dw Underworld_PrepTilemapAndAdvance                  ; 0x08
#_028E51: dw Underworld_PrepNextQuadrantUploadAndAdvance       ; 0x09
#_028E53: dw Underworld_PrepTilemapAndAdvance                  ; 0x0A
#_028E55: dw Underworld_PrepNextQuadrantUploadAndAdvance       ; 0x0B
#_028E57: dw Underworld_PrepTilemapAndAdvance                  ; 0x0C
#_028E59: dw Underworld_PrepNextQuadrantUploadAndAdvance       ; 0x0D
#_028E5B: dw Underworld_AdvanceAndReset                        ; 0x0E
#_028E5D: dw Module07_07_0F_FallingFadeIn                      ; 0x0F
#_028E5F: dw Module07_07_10_LandLinkFromFalling                ; 0x10
#_028E61: dw Module07_07_11_CacheRoomAndSetMusic               ; 0x11

;===================================================================================================

Module07_07_00_HandleMusicAndResetRoom:
#_028E63: REP #$20

#_028E65: LDA.b $A0

#_028E67: CMP.w #$0010 ; ROOM 0010
#_028E6A: BEQ .fade_music

#_028E6C: CMP.w #$0007 ; ROOM 0007
#_028E6F: BEQ .fade_music

#_028E71: CMP.w #$0017 ; ROOM 0017
#_028E74: BNE .no_fade

.fade_music
#_028E76: LDX.b #$F1 ; SONG F1
#_028E78: STX.w $012C

.no_fade
#_028E7B: SEP #$20

#_028E7D: JMP.w ResetTransitionPropsAndAdvance_ResetInterface

;===================================================================================================

Module07_07_06_SyncBG1and2:
#_028E80: JSR UnderworldSyncBG1and2Scroll
#_028E83: JSL Underworld_AdjustForRoomLayout

#_028E87: LDY.b #$16
#_028E89: LDX.w $0414

#_028E8C: LDA.l Underworld_SubscreenEnable,X
#_028E90: BPL .valid_subscreen

#_028E92: LDY.b #$17
#_028E94: LDA.b #$00

.valid_subscreen
#_028E96: STY.b $1C
#_028E98: STA.b $1D

#_028E9A: JSL WaterFlood_BuildOneQuadrantForVRAM

#_028E9E: INC.b $B0

#_028EA0: RTS

;===================================================================================================

Module07_07_0F_FallingFadeIn:
#_028EA1: JSL ApplyPaletteFilter

#_028EA5: LDA.l $7EC009
#_028EA9: BNE .exit

#_028EAB: LDA.b $21

#_028EAD: LDY.b $20
#_028EAF: CPY.b $51
#_028EB1: BCC .at_target

#_028EB3: INC A

.at_target
#_028EB4: STA.b $52

#_028EB6: JSR Underworld_SetBossMusicUnorthodox

#_028EB9: LDA.b $A0

#_028EBB: CMP.b #$89 ; ROOM 0089
#_028EBD: BEQ .exit

#_028EBF: CMP.b #$4F ; ROOM 004F
#_028EC1: BEQ .exit

#_028EC3: CMP.b #$A7 ; ROOM 00A7
#_028EC5: BEQ .is_hera_fairies

#_028EC7: DEC.b $A4

;===================================================================================================

#Underworld_PlayBlipAndCacheQuadrantVisits:
#_028EC9: LDA.b #$01
#_028ECB: STA.w $04A0

#_028ECE: LDA.b #$24 ; SFX3.24
#_028ED0: STA.w $012F

#_028ED3: JSL SetAndSaveVisitedQuadrantFlags

.exit
#_028ED7: RTS

;---------------------------------------------------------------------------------------------------

.is_hera_fairies
#_028ED8: STZ.w $04A0

#_028EDB: LDA.b #$01
#_028EDD: STA.b $A4

#_028EDF: RTS

;===================================================================================================

Module07_07_10_LandLinkFromFalling:
#_028EE0: JSL HandleUnderworldLandingFromPit

#_028EE4: LDA.b $11
#_028EE6: BNE .exit

#_028EE8: LDA.b #$07
#_028EEA: STA.b $11

#_028EEC: LDA.b #$11
#_028EEE: STA.b $B0

#_028EF0: LDA.b #$01
#_028EF2: STA.w $0AAA

#_028EF5: JSL Graphics_LoadChrHalfSlot

.exit
#_028EF9: RTS

;===================================================================================================

Module07_07_11_CacheRoomAndSetMusic:
#_028EFA: LDA.w $0200
#_028EFD: CMP.b #$05
#_028EFF: BNE .exit

#_028F01: JSR ResetThenCacheRoomEntryProperties
#_028F04: JSR Underworld_SetBossOrSancMusicUponEntry
#_028F07: JSL Graphics_LoadChrHalfSlot

.exit
#_028F0B: RTS

;===================================================================================================

Module07_08_NorthIntraRoomStairs:
#_028F0C: LDA.w $0464
#_028F0F: BEQ .run_subsubsub

#_028F11: DEC.w $0464

#_028F14: CMP.b #$14
#_028F16: BNE .skip_stair_drag

#_028F18: LDA.b #$02
#_028F1A: STA.b $57

.skip_stair_drag
#_028F1C: JSL Link_HandleVelocity

#_028F20: JSL ApplyLinksMovementToCamera
#_028F24: JSR Underworld_HandleCamera

#_028F27: JSL Link_HandleMovingAnimation_FullLongEntry

.run_subsubsub
#_028F2B: LDA.b $B0
#_028F2D: JSL JumpTableLocal
#_028F31: dw Module07_08_00_InitStairs
#_028F33: dw Module07_08_01_ClimbStairs

;===================================================================================================

Module07_08_00_InitStairs:
#_028F35: STZ.w $0351

#_028F38: LDY.b #$19 ; SFX2.19
#_028F3A: LDX.b #$3C

#_028F3C: LDA.b $67
#_028F3E: AND.b #$08
#_028F40: BEQ .finish_up

#_028F42: LDY.b #$17 ; SFX2.17
#_028F44: LDX.b #$38

#_028F46: STZ.w $0476

#_028F49: LDA.w $044A
#_028F4C: CMP.b #$02
#_028F4E: BEQ .finish_up

#_028F50: STZ.b $EE

.finish_up
#_028F52: STX.w $0464
#_028F55: STY.w $012E

#_028F58: LDA.b #$01
#_028F5A: STA.b $57

#_028F5C: INC.b $B0

;---------------------------------------------------------------------------------------------------

#EXIT_028F5E:
#_028F5E: RTS

;===================================================================================================

Module07_08_01_ClimbStairs:
#_028F5F: LDA.w $0464
#_028F62: BNE EXIT_028F5E

#_028F64: LDA.b $67
#_028F66: AND.b #$04
#_028F68: BEQ .finish_up

#_028F6A: LDA.b #$01
#_028F6C: STA.w $0476

#_028F6F: LDA.w $044A
#_028F72: CMP.b #$02
#_028F74: BEQ .finish_up

#_028F76: LDA.b #$01
#_028F78: STA.b $EE

#_028F7A: BRA .finish_up

.finish_up
#_028F7C: STZ.b $B0
#_028F7E: STZ.w $0418
#_028F81: STZ.b $11

#_028F83: JSL SetAndSaveVisitedQuadrantFlags

#_028F87: RTS

;===================================================================================================

Module07_10_SouthIntraRoomStairs:
#_028F88: LDA.w $0464
#_028F8B: BEQ .run_subsubsub

#_028F8D: DEC.w $0464

#_028F90: CMP.b #$14
#_028F92: BNE .skip_stair_drag

#_028F94: LDA.b #$02
#_028F96: STA.b $57

.skip_stair_drag
#_028F98: JSL Link_HandleVelocity
#_028F9C: JSL ApplyLinksMovementToCamera
#_028FA0: JSR Underworld_HandleCamera
#_028FA3: JSL Link_HandleMovingAnimation_FullLongEntry

.run_subsubsub
#_028FA7: LDA.b $B0
#_028FA9: JSL JumpTableLocal
#_028FAD: dw Module07_10_00_InitStairs
#_028FAF: dw Module07_10_01_ClimbStairs

;===================================================================================================

Module07_10_00_InitStairs:
#_028FB1: LDY.b #$19 ; SFX2.19

#_028FB3: LDX.b #$3C

#_028FB5: LDA.b $67
#_028FB7: AND.b #$04
#_028FB9: BEQ .finish_up

#_028FBB: LDY.b #$17 ; SFX2.17

#_028FBD: LDX.b #$38

#_028FBF: LDA.w $0476
#_028FC2: EOR.b #$01
#_028FC4: STA.w $0476

#_028FC7: LDA.w $044A
#_028FCA: CMP.b #$02
#_028FCC: BEQ .finish_up

#_028FCE: LDA.b $EE
#_028FD0: EOR.b #$01
#_028FD2: STA.b $EE

.finish_up
#_028FD4: STX.w $0464

#_028FD7: STY.w $012E

#_028FDA: LDA.b #$01
#_028FDC: STA.b $57

#_028FDE: INC.b $B0

;---------------------------------------------------------------------------------------------------

#EXIT_028FE0:
#_028FE0: RTS

;===================================================================================================

Module07_10_01_ClimbStairs:
#_028FE1: LDA.w $0464
#_028FE4: BNE EXIT_028FE0

#_028FE6: LDA.b $67
#_028FE8: AND.b #$08
#_028FEA: BEQ .finish_up

#_028FEC: LDA.w $0476
#_028FEF: EOR.b #$01
#_028FF1: STA.w $0476

#_028FF4: LDA.w $044A
#_028FF7: CMP.b #$02
#_028FF9: BEQ .finish_up

#_028FFB: LDA.b $EE
#_028FFD: EOR.b #$01
#_028FFF: STA.b $EE

#_029001: BRA .finish_up

.finish_up
#_029003: STZ.b $B0
#_029005: STZ.w $0418
#_029008: STZ.b $11

#_02900A: JSL SetAndSaveVisitedQuadrantFlags

#_02900E: RTS

;===================================================================================================

Module07_09_OpenCrackedDoor:
#_02900F: JSL OpenCrackedDoor

#_029013: RTS

;===================================================================================================

Module07_0A_ChangeBrightness:
#_029014: JSL OrientLampLightCone
#_029018: JSL ApplyGrayscaleFixed_Incremental

#_02901C: LDA.l $00009C
#_029020: AND.b #$1F
#_029022: CMP.l $7EC017
#_029026: BNE .exit

#_029028: STZ.b $11
#_02902A: STZ.b $B0

.exit
#_02902C: RTS

;===================================================================================================

Module07_0B_DrainSwampPool:
#_02902D: JSL .do_it

#_029031: RTS

;---------------------------------------------------------------------------------------------------

.do_it
#_029032: LDA.b $B0
#_029034: JSL JumpTableLong
#_029038: dl IncrementallyDrainSwampPool            ; 0x00
#_02903B: dl DeleteSwampPoolWaterOverlay            ; 0x01
#_02903E: dl Underworld_FloodSwampWater_PrepTilemap ; 0x02
#_029041: dl Underworld_FloodSwampWater_PrepTilemap ; 0x03
#_029044: dl Underworld_FloodSwampWater_PrepTilemap ; 0x04
#_029047: dl Underworld_FloodSwampWater_PrepTilemap ; 0x05

;===================================================================================================

Module07_0C_FloodSwampWater:
#_02904A: JSL Underworld_FloodSwampWater

#_02904E: RTS

;===================================================================================================

Module07_0D_FloodDam:
#_02904F: JSL Underworld_FloodDam

#_029053: RTS

;===================================================================================================

Module07_0E_SpiralStairs:
#_029054: LDA.b $B0
#_029056: CMP.b #$07
#_029058: BCC .skip_upload

#_02905A: JSL Graphics_IncrementalVRAMUpload
#_02905E: JSL Underworld_LoadAttribute_Selectable

.skip_upload
#_029062: JSL HandleLinkOnSpiralStairs

#_029066: LDA.b $B0
#_029068: JSL JumpTableLocal
#_02906C: dw Module07_0E_00_InitPriorityAndScreens             ; 0x00
#_02906E: dw Module07_0E_01_HandleMusicAndResetProps           ; 0x01
#_029070: dw Module07_0E_02_ApplyFilterIf                      ; 0x02
#_029072: dw Underworld_InitializeRoomFromSpecial              ; 0x03
#_029074: dw UnderworldTransition_TriggerBGC34UpdateAndAdvance ; 0x04
#_029076: dw UnderworldTransition_TriggerBGC56UpdateAndAdvance ; 0x05
#_029078: dw UnderworldTransition_LoadSpriteGFX                ; 0x06
#_02907A: dw Underworld_SyncBackgroundsFromSpiralStairs        ; 0x07
#_02907C: dw Underworld_PrepNextQuadrantUploadAndAdvance       ; 0x08
#_02907E: dw Underworld_PrepTilemapAndAdvance                  ; 0x09
#_029080: dw Underworld_PrepNextQuadrantUploadAndAdvance       ; 0x0A
#_029082: dw Underworld_FilterPrepTilemapAndAdvance            ; 0x0B
#_029084: dw Underworld_FilterUploadAndAdvance                 ; 0x0C
#_029086: dw Underworld_FilterPrepTilemapAndAdvance            ; 0x0D
#_029088: dw Underworld_FilterUploadAndAdvance                 ; 0x0E
#_02908A: dw Underworld_DoubleApplyAndIncrementGrayscale       ; 0x0F
#_02908C: dw Underworld_AdvanceThenSetBossMusicUnorthodox      ; 0x10
#_02908E: dw Module07_0E_11                                    ; 0x11
#_029090: dw Module07_0E_12                                    ; 0x12
#_029092: dw Module07_0E_13_SetRoomAndLayerAndCache            ; 0x13

;===================================================================================================

Underworld_DoubleApplyAndIncrementGrayscale:
#_029094: JSL ApplyPaletteFilter
#_029098: JSL ApplyPaletteFilter

#_02909C: JSL ApplyGrayscaleFixed_Incremental

#_0290A0: RTS

;===================================================================================================

Module07_0E_02_ApplyFilterIf:
#_0290A1: LDA.w $0464
#_0290A4: CMP.b #$09
#_0290A6: BCS .skip_filtering

#_0290A8: JSL ApplyPaletteFilter
#_0290AC: LDA.l $7EC007
#_0290B0: BEQ .skip_filtering

#_0290B2: JSL ApplyPaletteFilter

.skip_filtering
#_0290B6: LDA.w $0464
#_0290B9: BNE .dec_to_zero

#_0290BB: LDA.b #$0C
#_0290BD: STA.b $4B
#_0290BF: STA.w $02F9

#_0290C2: RTS

.dec_to_zero
#_0290C3: DEC.w $0464

#_0290C6: RTS

;===================================================================================================

Underworld_SyncBackgroundsFromSpiralStairs:
#_0290C7: LDA.l $7EF3CC
#_0290CB: CMP.b #$06 ; FOLLOWER 06
#_0290CD: BNE .not_blind_in_attic

#_0290CF: LDA.b $A0
#_0290D1: CMP.b #$64 ; ROOM 0064
#_0290D3: BNE .not_blind_in_attic

#_0290D5: LDA.b #$00
#_0290D7: STA.l $7EF3CC

;---------------------------------------------------------------------------------------------------

.not_blind_in_attic
#_0290DB: LDA.b $EE
#_0290DD: PHA

#_0290DE: REP #$10

#_0290E0: LDX.w #$0030

#_0290E3: LDA.w $0462
#_0290E6: AND.b #$04
#_0290E8: BNE .positive_y_a

#_0290EA: LDX.w #$FFD0

.positive_y_a
#_0290ED: REP #$20

#_0290EF: TXA
#_0290F0: CLC
#_0290F1: ADC.b $20
#_0290F3: STA.b $20

#_0290F5: SEP #$30

#_0290F7: LDX.w $048A

#_0290FA: LDA.l LayerOfDestination_for_EE,X
#_0290FE: STA.b $EE

#_029100: JSR SpiralStairs_MakeNearbyWallsHighPriority_Exiting

#_029103: PLA
#_029104: STA.b $EE

;---------------------------------------------------------------------------------------------------

#_029106: REP #$10

#_029108: LDX.w #$FFD0

#_02910B: LDA.w $0462
#_02910E: AND.b #$04
#_029110: BNE .positive_y_b

#_029112: LDX.w #$0030

.positive_y_b
#_029115: REP #$20

#_029117: TXA
#_029118: CLC
#_029119: ADC.b $20
#_02911B: STA.b $20

#_02911D: JSR UnderworldSyncBG1and2Scroll

#_029120: SEP #$30

#_029122: JSL Underworld_AdjustForRoomLayout

;---------------------------------------------------------------------------------------------------

#_029126: LDY.b #$16

#_029128: LDX.w $0414
#_02912B: LDA.l Underworld_SubscreenEnable,X
#_02912F: BPL .valid_subscreen

#_029131: LDY.b #$17
#_029133: LDA.b #$00

.valid_subscreen
#_029135: CPX.b #$02
#_029137: BNE .dont_override_as_bg12

#_029139: LDA.b #$03

.dont_override_as_bg12
#_02913B: STY.b $1C
#_02913D: STA.b $1D

#_02913F: INC.b $A4

#_029141: LDA.w $0462
#_029144: AND.b #$04
#_029146: BEQ .going_up

#_029148: DEC.b $A4
#_02914A: DEC.b $A4

.going_up
#_02914C: LDX.b #$18
#_02914E: STX.w $0464

#_029151: JSR Underworld_PlayBlipAndCacheQuadrantVisits
#_029154: JSL RestoreTorchBackground

#_029158: JMP.w Underworld_PrepTilemapAndAdvance

;===================================================================================================

Underworld_AdvanceThenSetBossMusicUnorthodox:
#_02915B: JSR DeleteCertainAncillaeStopDashing

#_02915E: LDA.b #$38
#_029160: STA.w $0464

#_029163: INC.b $B0

;===================================================================================================

Underworld_SetBossMusicUnorthodox:
#_029165: REP #$20

#_029167: LDX.b #$1C ; SONG 1C

#_029169: LDA.b $A0

#_02916B: CMP.w #$0010 ; ROOM 0010
#_02916E: BEQ .set_song

#_029170: LDX.b #$15 ; SONG 15

#_029172: CMP.w #$0007 ; ROOM 0007
#_029175: BEQ .check_last_command

#_029177: LDX.b #$11 ; SONG 11

#_029179: CMP.w #$0017 ; ROOM 0017
#_02917C: BNE .exit

#_02917E: CPX.w $0130
#_029181: BEQ .exit

.check_last_command
#_029183: LDA.w $0130
#_029186: AND.w #$00FF
#_029189: CMP.w #$00F1 ; SONG F1 - fade
#_02918C: BEQ .set_song

#_02918E: LDA.l $7EF374
#_029192: LSR A
#_029193: BCS .exit

.set_song
#_029195: STX.w $012C

.exit
#_029198: SEP #$20

#_02919A: RTS

;===================================================================================================

Module07_0E_11:
#_02919B: JSL SpiralStairs_FindLandingSpot

#_02919F: DEC.w $0464
#_0291A2: BNE .exit

#_0291A4: LDX.b #$0A

#_0291A6: LDA.w $0462
#_0291A9: AND.b #$04
#_0291AB: BNE .going_down

#_0291AD: LDX.b #$18

.going_down
#_0291AF: STX.w $0464

#_0291B2: INC.b $B0

.exit
#_0291B4: RTS

;===================================================================================================

Module07_0E_12:
#_0291B5: JSL SpiralStairs_FindLandingSpot

#_0291B9: DEC.w $0464
#_0291BC: BNE .exit

#_0291BE: INC.b $B0

#_0291C0: STZ.w $0200

.exit
#_0291C3: RTS

;===================================================================================================

Module07_0E_00_InitPriorityAndScreens:
#_0291C4: JSL SpiralStairs_MakeNearbyWallsHighPriority_Entering

#_0291C8: LDA.b $EE
#_0291CA: BEQ .dont_set_screendes_and_priority

#_0291CC: LDA.b $1C
#_0291CE: AND.b #$0F
#_0291D0: STA.b $1C

#_0291D2: LDA.b #$10
#_0291D4: TSB.b $1D

#_0291D6: LDA.b #$03
#_0291D8: STA.b $EE

.dont_set_screendes_and_priority
#_0291DA: INC.b $B0

#_0291DC: RTS

;===================================================================================================

Module07_0E_13_SetRoomAndLayerAndCache:
#_0291DD: LDX.w $048A

#_0291E0: LDA.l LayerOfDestination_for_0476,X
#_0291E4: STA.w $0476

#_0291E7: LDA.l LayerOfDestination_for_EE,X
#_0291EB: STA.b $EE

#_0291ED: LDA.b #$10
#_0291EF: TSB.b $1C

#_0291F1: LDA.b $1D
#_0291F3: AND.b #$0F
#_0291F5: STA.b $1D

#_0291F7: LDA.w $0462
#_0291FA: AND.b #$04
#_0291FC: BNE .going_down

#_0291FE: JSL SpiralStairs_MakeNearbyWallsLowPriority

.going_down
#_029202: LDA.b $A0
#_029204: STA.w $048E

#_029207: JMP.w ResetThenCacheRoomEntryProperties

;===================================================================================================

pool RepositionLinkAfterSpiralStairs

.offset_x
#_02920A: dw -28
#_02920C: dw -28
#_02920E: dw  24
#_029210: dw  24

.offset_y
#_029212: dw  16
#_029214: dw -10
#_029216: dw -10
#_029218: dw -32

pool off

;---------------------------------------------------------------------------------------------------

RepositionLinkAfterSpiralStairs:
#_02921A: SEP #$20

#_02921C: STZ.b $4B
#_02921E: STZ.w $02F9

#_029221: LDX.b #$00

#_029223: LDA.w $048A
#_029226: BNE .use_offset_set_a

#_029228: CMP.w $0492
#_02922B: BEQ .use_offset_set_a

#_02922D: LDX.b #$02

.use_offset_set_a
#_02922F: LDA.w $0462
#_029232: AND.b #$04
#_029234: BEQ .going_up

#_029236: TXA
#_029237: CLC
#_029238: ADC.b #$04
#_02923A: TAX

.going_up
#_02923B: REP #$20

#_02923D: LDA.b $22
#_02923F: CLC
#_029240: ADC.l .offset_x,X
#_029244: STA.b $22

#_029246: LDA.b $20
#_029248: CLC
#_029249: ADC.l .offset_y,X
#_02924D: STA.b $20

#_02924F: SEP #$20

#_029251: LDA.b $1C
#_029253: AND.b #$10
#_029255: BEQ .sprites_not_on_mainscreen

;---------------------------------------------------------------------------------------------------

#_029257: LDA.w $048A
#_02925A: CMP.b #$02
#_02925C: BNE .reset_follower_a

#_02925E: LDA.b #$03
#_029260: STA.b $EE

#_029262: LDA.b $1C
#_029264: AND.b #$0F
#_029266: STA.b $1C

#_029268: LDA.b #$10
#_02926A: TSB.b $1D

#_02926C: LDA.w $0492
#_02926F: CMP.b #$02
#_029271: BEQ .reset_follower_a

#_029273: REP #$20

#_029275: LDA.b $20
#_029277: CLC
#_029278: ADC.w #$0018
#_02927B: STA.b $20

.reset_follower_a
#_02927D: SEP #$20

#_02927F: JSL Follower_Initialize

#_029283: REP #$20

#_029285: RTL

;---------------------------------------------------------------------------------------------------

.sprites_not_on_mainscreen
#_029286: LDA.w $048A
#_029289: CMP.b #$02
#_02928B: BEQ .reset_follower_b

#_02928D: LDA.b #$10
#_02928F: TSB.b $1C

#_029291: LDA.b $1D
#_029293: AND.b #$0F
#_029295: STA.b $1D

#_029297: LDA.w $0492
#_02929A: CMP.b #$02
#_02929C: BEQ .reset_follower_a

#_02929E: REP #$20

#_0292A0: LDA.b $20
#_0292A2: SEC
#_0292A3: SBC.w #$0018
#_0292A6: STA.b $20

.reset_follower_b
#_0292A8: SEP #$20

#_0292AA: JSL Follower_Initialize

#_0292AE: REP #$20

#_0292B0: RTL

;===================================================================================================

SpiralStairs_MakeNearbyWallsHighPriority_Exiting:
#_0292B1: LDA.w $0462
#_0292B4: AND.b #$04
#_0292B6: BNE .exit

#_0292B8: REP #$30

#_0292BA: LDA.w $048C
#_0292BD: CLC
#_0292BE: ADC.w #$0008
#_0292C1: AND.w #$007F
#_0292C4: STA.b $00

;---------------------------------------------------------------------------------------------------

#_0292C6: LDX.w #$FFFE

.check_next
#_0292C9: INX
#_0292CA: INX

#_0292CB: LDA.w $06B0,X
#_0292CE: ASL A
#_0292CF: AND.w #$007F
#_0292D2: CMP.b $00
#_0292D4: BNE .check_next

;---------------------------------------------------------------------------------------------------

#_0292D6: LDA.w $06B0,X
#_0292D9: ASL A
#_0292DA: SEC
#_0292DB: SBC.w #$0008
#_0292DE: STA.w $048C

#_0292E1: TAX

#_0292E2: LDY.w #$0004

.flag_next
#_0292E5: LDA.l $7E2000,X
#_0292E9: ORA.w #$2000
#_0292EC: STA.l $7E2000,X

#_0292F0: LDA.l $7E2080,X
#_0292F4: ORA.w #$2000
#_0292F7: STA.l $7E2080,X

#_0292FB: LDA.l $7E2100,X
#_0292FF: ORA.w #$2000
#_029302: STA.l $7E2100,X

#_029306: LDA.l $7E2180,X
#_02930A: ORA.w #$2000
#_02930D: STA.l $7E2180,X

#_029311: INX
#_029312: INX

#_029313: DEY
#_029314: BPL .flag_next

;---------------------------------------------------------------------------------------------------

#_029316: SEP #$30

.exit
#_029318: RTS

;===================================================================================================

pool Module07_0F_LandingWipe

.vectors
#_029319: dw Module07_0F_00_InitSpotlight
#_02931B: dw Module07_0F_01_OperateSpotlight

pool off

;---------------------------------------------------------------------------------------------------

Module07_0F_LandingWipe:
#_02931D: LDA.b $B0
#_02931F: ASL A
#_029320: TAX

#_029321: JSR (.vectors,X)

#_029324: JSL Link_HandleMovingAnimation_FullLongEntry
#_029328: JSL LinkOAM_Main

#_02932C: RTS

;===================================================================================================

Module07_0F_00_InitSpotlight:
#_02932D: JSL IrisSpotlight_open

#_029331: INC.b $B0

#_029333: RTS

;===================================================================================================

Module07_0F_01_OperateSpotlight:
#_029334: JSL Sprite_Main
#_029338: JSL IrisSpotlight_ConfigureTable

#_02933C: LDA.b $11
#_02933E: BNE .exit

#_029340: STZ.b $96
#_029342: STZ.b $97
#_029344: STZ.b $98

#_029346: STZ.b $1E
#_029348: STZ.b $1F

#_02934A: STZ.b $B0

#_02934C: LDA.w $0132
#_02934F: CMP.b #$FF ; SONG FF - transfer
#_029351: BEQ .exit

#_029353: STA.w $012C

.exit
#_029356: RTS

;===================================================================================================

Module07_11_StraightInterroomStairs:
#_029357: LDA.b $B0
#_029359: CMP.b #$03
#_02935B: BCC .skip_attributes

#_02935D: JSL Underworld_LoadAttribute_Selectable

.skip_attributes
#_029361: LDA.b $B0
#_029363: CMP.b #$0D
#_029365: BCC .skip_gfx_upload

#_029367: JSL Graphics_IncrementalVRAMUpload

.skip_gfx_upload
#_02936B: LDA.w $0464
#_02936E: BEQ .run_subsubsub

#_029370: DEC.w $0464

#_029373: CMP.b #$10
#_029375: BNE .no_stair_drag

#_029377: LDA.b #$02
#_029379: STA.b $57

.no_stair_drag
#_02937B: LDX.b #$08

#_02937D: LDA.b $11
#_02937F: CMP.b #$12
#_029381: BEQ .move_up

#_029383: LDX.b #$04

.move_up
#_029385: STX.b $67

#_029387: JSL Link_HandleVelocity

;---------------------------------------------------------------------------------------------------

.run_subsubsub
#_02938B: JSL Link_HandleMovingAnimation_FullLongEntry

#_02938F: LDA.b $B0
#_029391: JSL JumpTableLocal
#_029395: dw Module07_11_00_PrepAndReset                 ; 0x00
#_029397: dw Module07_11_01_FadeOut                      ; 0x01
#_029399: dw Module07_11_02_LoadAndPrepRoom              ; 0x02
#_02939B: dw Module07_11_03_FilterAndLoadBGChars         ; 0x03
#_02939D: dw Module07_11_04_FilterDoBGAndResetSprites    ; 0x04
#_02939F: dw Underworld_FilterPrepTilemapAndAdvance      ; 0x05
#_0293A1: dw Underworld_FilterUploadAndAdvance           ; 0x06
#_0293A3: dw Underworld_FilterPrepTilemapAndAdvance      ; 0x07
#_0293A5: dw Underworld_FilterUploadAndAdvance           ; 0x08
#_0293A7: dw Module07_11_09_LoadSpriteGraphics           ; 0x09
#_0293A9: dw Module07_11_0A_ScrollCamera                 ; 0x0A
#_0293AB: dw Module07_11_0B_PrepDestination              ; 0x0B
#_0293AD: dw Underworld_PrepNextQuadrantUploadAndAdvance ; 0x0C
#_0293AF: dw Underworld_PrepTilemapAndAdvance            ; 0x0D
#_0293B1: dw Underworld_PrepNextQuadrantUploadAndAdvance ; 0x0E
#_0293B3: dw Underworld_DoubleApplyAndIncrementGrayscale ; 0x0F
#_0293B5: dw Module07_11_19_SetSongAndFilter             ; 0x10
#_0293B7: dw Module07_11_11_KeepSliding                  ; 0x11
#_0293B9: dw ResetThenCacheRoomEntryProperties           ; 0x12

;===================================================================================================

Module07_11_00_PrepAndReset:
#_0293BB: LDA.w $0372
#_0293BE: BEQ .not_dashing

#_0293C0: STZ.w $0372

#_0293C3: LDA.b #$02
#_0293C5: STA.b $5E

.not_dashing
#_0293C7: LDX.b #$16 ; SFX2.16

#_0293C9: LDA.w $0462
#_0293CC: AND.b #$04
#_0293CE: BEQ .going_up

#_0293D0: LDX.b #$18 ; SFX2.18

.going_up
#_0293D2: STX.w $012E

;---------------------------------------------------------------------------------------------------

#_0293D5: REP #$20

#_0293D7: LDA.b $A0

#_0293D9: CMP.w #$0030 ; ROOM 0030
#_0293DC: BEQ .do_song_fade

#_0293DE: CMP.w #$0040 ; ROOM 0040
#_0293E1: BNE .no_song_fade

.do_song_fade
#_0293E3: LDX.b #$F1 ; SONG F1 - fade
#_0293E5: STX.w $012C

.no_song_fade
#_0293E8: SEP #$20

#_0293EA: JMP.w ResetTransitionPropsAndAdvance_ResetInterface

;===================================================================================================

Module07_11_01_FadeOut:
#_0293ED: LDA.w $0464
#_0293F0: CMP.b #$09
#_0293F2: BCS .exit

#_0293F4: JSL ApplyPaletteFilter

#_0293F8: LDA.l $7EC007
#_0293FC: CMP.b #$17
#_0293FE: BNE .exit

#_029400: INC.b $B0

.exit
#_029402: RTS

;===================================================================================================

Module07_11_02_LoadAndPrepRoom:
#_029403: JSL ApplyPaletteFilter

#_029407: JSL Underworld_LoadRoom

#_02940B: JSL ToggleStarTileGraphics
#_02940F: JSL LoadTransAuxGFX
#_029413: JSL Underworld_LoadCustomTileTypes

#_029417: JSL Underworld_AdjustForRoomLayout
#_02941B: JSL Follower_Initialize

#_02941F: INC.b $B0

#_029421: RTS

;===================================================================================================

Module07_11_03_FilterAndLoadBGChars:
#_029422: JSL ApplyPaletteFilter

#_029426: JSR UnderworldTransition_TriggerBGC34UpdateAndAdvance

#_029429: RTS

;===================================================================================================

Module07_11_04_FilterDoBGAndResetSprites:
#_02942A: JSL ApplyPaletteFilter
#_02942E: JSR UnderworldTransition_TriggerBGC56UpdateAndAdvance

#_029431: LDA.b $A0
#_029433: STA.w $048E

#_029436: JSL Underworld_ResetSprites

#_02943A: RTS

;===================================================================================================

Module07_11_0B_PrepDestination:
#_02943B: LDY.b #$16
#_02943D: LDX.w $0414

#_029440: LDA.l Underworld_SubscreenEnable,X
#_029444: BPL .valid_screendes

#_029446: LDY.b #$17
#_029448: LDA.b #$00

.valid_screendes
#_02944A: STY.b $1C
#_02944C: STA.b $1D

#_02944E: LDY.b #$17 ; SFX2.17

#_029450: INC.b $A4

#_029452: LDA.b #$01
#_029454: STA.b $57

#_029456: LDX.b #$3C

#_029458: LDA.w $0462
#_02945B: AND.b #$04
#_02945D: BEQ .going_up

#_02945F: LDY.b #$19 ; SFX2.19

#_029461: DEC.b $A4
#_029463: DEC.b $A4

#_029465: LDX.b #$32

;---------------------------------------------------------------------------------------------------

.going_up
#_029467: STX.w $0464

#_02946A: STY.w $012E

#_02946D: STZ.b $00

#_02946F: LDY.b $11

#_029471: LDA.b $EE
#_029473: BEQ .on_upper_layer

;---------------------------------------------------------------------------------------------------

#_029475: REP #$20

#_029477: LDA.w #$0020
#_02947A: CPY.b #$12
#_02947C: BNE .move_y_down_a

#_02947E: LDA.w #$FFE0

.move_y_down_a
#_029481: CLC
#_029482: ADC.b $20
#_029484: STA.b $20

#_029486: INC.b $00

#_029488: SEP #$20

;---------------------------------------------------------------------------------------------------

.on_upper_layer
#_02948A: LDX.w $048A

#_02948D: LDA.l LayerOfDestination_for_0476,X
#_029491: STA.w $0476

#_029494: LDA.l LayerOfDestination_for_EE,X
#_029498: STA.b $EE

#_02949A: BEQ .staying_on_upper_layer

#_02949C: REP #$20

#_02949E: LDA.w #$0020

#_0294A1: CPY.b #$12
#_0294A3: BNE .move_y_down_b

#_0294A5: LDA.w #$FFE0

.move_y_down_b
#_0294A8: CLC
#_0294A9: ADC.b $20
#_0294AB: STA.b $20

#_0294AD: INC.b $00

#_0294AF: SEP #$20

;---------------------------------------------------------------------------------------------------

.staying_on_upper_layer
#_0294B1: LDA.b $00
#_0294B3: BNE .skip_extra_y_adjust

#_0294B5: REP #$20

#_0294B7: LDA.w #$000C

#_0294BA: CPY.b #$12
#_0294BC: BNE .move_y_down_c

#_0294BE: REP #$10

#_0294C0: LDX.w #$FFE8

#_0294C3: LDA.w $0462
#_0294C6: AND.w #$0004
#_0294C9: BNE .going_down

#_0294CB: LDX.w #$FFF8

.going_down
#_0294CE: TXA

.move_y_down_c
#_0294CF: CLC
#_0294D0: ADC.b $20
#_0294D2: STA.b $20

#_0294D4: SEP #$30

.skip_extra_y_adjust
#_0294D6: JSR Underworld_PlayBlipAndCacheQuadrantVisits
#_0294D9: JSL RestoreTorchBackground

#_0294DD: JMP.w Underworld_PrepTilemapAndAdvance

;===================================================================================================

Module07_11_09_LoadSpriteGraphics:
#_0294E0: JSL ApplyPaletteFilter

#_0294E4: DEC.b $B0

#_0294E6: JSL LoadNewSpriteGFXSet

#_0294EA: JMP.w Underworld_HandleTranslucencyAndPalettes

;===================================================================================================

Module07_11_19_SetSongAndFilter:
#_0294ED: LDA.w $0200
#_0294F0: CMP.b #$05
#_0294F2: BNE ApplyGrayscaleFixed_Incremental_bounce

#_0294F4: LDA.l $7EC009
#_0294F8: BNE ApplyGrayscaleFixed_Incremental_bounce

#_0294FA: INC.b $B0

#_0294FC: REP #$20

#_0294FE: LDX.b #$1C ; SONG 1C

#_029500: LDA.b $A0

#_029502: CMP.w #$0030 ; ROOM 0030
#_029505: BEQ .set_song

#_029507: CMP.w #$0040 ; ROOM 0040
#_02950A: BNE .skip_song

#_02950C: LDX.b #$10 ; SONG 10

.set_song
#_02950E: STX.w $012C

.skip_song
#_029511: SEP #$20

;===================================================================================================

ApplyGrayscaleFixed_Incremental_bounce:
#_029513: JSL ApplyGrayscaleFixed_Incremental

#_029517: RTS

;===================================================================================================

Module07_11_11_KeepSliding:
#_029518: LDA.w $0464
#_02951B: BNE ApplyGrayscaleFixed_Incremental_bounce

#_02951D: INC.b $B0

#_02951F: RTS

;===================================================================================================

Module07_14_RecoverFromFall:
#_029520: LDA.b $B0
#_029522: JSL JumpTableLocal
#_029526: dw Module07_14_00_ScrollCamera
#_029528: dw RecoverPositionAfterDrowning

;===================================================================================================

Module07_14_00_ScrollCamera:
#_02952A: REP #$20

#_02952C: LDA.b $E2
#_02952E: CMP.l $7EC180
#_029532: BEQ .set_h_scroll
#_029534: BCC .scroll_right

#_029536: DEC A
#_029537: CMP.l $7EC180
#_02953B: BEQ .set_h_scroll

#_02953D: DEC A
#_02953E: BRA .set_h_scroll

.scroll_right
#_029540: INC A
#_029541: CMP.l $7EC180
#_029545: BEQ .set_h_scroll

#_029547: INC A

.set_h_scroll
#_029548: STA.b $E2

#_02954A: LDA.b $E8
#_02954C: CMP.l $7EC182
#_029550: BEQ .set_v_scroll
#_029552: BCC .scroll_up

#_029554: DEC A
#_029555: CMP.l $7EC182
#_029559: BEQ .set_v_scroll

#_02955B: DEC A
#_02955C: BRA .set_v_scroll

.scroll_up
#_02955E: INC A
#_02955F: CMP.l $7EC182
#_029563: BEQ .set_v_scroll

#_029565: INC A

;---------------------------------------------------------------------------------------------------

.set_v_scroll
#_029566: STA.b $E8

#_029568: CMP.l $7EC182
#_02956C: BNE .not_at_target_camera

#_02956E: LDA.b $E2
#_029570: CMP.l $7EC180
#_029574: BNE .not_at_target_camera

#_029576: INC.b $B0

.not_at_target_camera
#_029578: LDA.w $0458
#_02957B: BNE .exit

#_02957D: JSR UnderworldSyncBG1and2Scroll

.exit
#_029580: SEP #$20

#_029582: RTS

;===================================================================================================

RecoverPositionAfterDrowning:
#_029583: REP #$20

#_029585: LDA.l $7EC184
#_029589: STA.b $20

#_02958B: LDA.l $7EC186
#_02958F: STA.b $22

#_029591: LDA.l $7EC188
#_029595: STA.w $0600

#_029598: LDA.l $7EC18A
#_02959C: STA.w $0604

#_02959F: LDA.l $7EC18C
#_0295A3: STA.w $0608

#_0295A6: LDA.l $7EC18E
#_0295AA: STA.w $060C

#_0295AD: LDA.l $7EC190
#_0295B1: STA.w $0610

#_0295B4: LDA.l $7EC192
#_0295B8: STA.w $0612

#_0295BB: LDA.l $7EC194
#_0295BF: STA.w $0614

#_0295C2: LDA.l $7EC196
#_0295C6: STA.w $0616

;---------------------------------------------------------------------------------------------------

#_0295C9: LDA.b $1B
#_0295CB: AND.w #$00FF
#_0295CE: BEQ .outdoors

#_0295D0: LDA.l $7EC198
#_0295D4: STA.w $0618

#_0295D7: INC A
#_0295D8: INC A
#_0295D9: STA.w $061A

#_0295DC: LDA.l $7EC19A
#_0295E0: STA.w $061C

#_0295E3: INC A
#_0295E4: INC A
#_0295E5: STA.w $061E

;---------------------------------------------------------------------------------------------------

.outdoors
#_0295E8: LDA.l $7EC19C
#_0295EC: STA.b $A6

#_0295EE: LDA.l $7EC19E
#_0295F2: STA.b $A9

#_0295F4: LDA.b $1B
#_0295F6: AND.w #$00FF
#_0295F9: BNE .indoors

#_0295FB: LDA.w $0618
#_0295FE: DEC A
#_0295FF: DEC A
#_029600: STA.w $061A

#_029603: LDA.w $061C
#_029606: DEC A
#_029607: DEC A
#_029608: STA.w $061E

;---------------------------------------------------------------------------------------------------

.indoors
#_02960B: SEP #$20

#_02960D: LDA.l $7EC1A6
#_029611: STA.b $2F

#_029613: LDA.l $7EC1A7
#_029617: STA.b $EE

#_029619: LDA.l $7EC1A8
#_02961D: STA.w $0476

#_029620: LDA.l $7EC1A9
#_029624: STA.b $6C

#_029626: LDA.l $7EC1AA
#_02962A: STA.b $A4

#_02962C: STZ.b $4B

;---------------------------------------------------------------------------------------------------

#_02962E: LDA.b #$90
#_029630: STA.w $031F

#_029633: JSR Underworld_PlayBlipAndCacheQuadrantVisits

#_029636: STZ.w $037B

#_029639: JSL Link_ResetStateAfterDamagingPit

#_02963D: STZ.w $02F9

#_029640: JSL Follower_Initialize

#_029644: STZ.w $0642

#_029647: STZ.w $0200
#_02964A: STZ.b $B0

#_02964C: STZ.w $0418
#_02964F: STZ.b $11

#_029651: LDA.l $7EF36D
#_029655: BNE .exit

#_029657: LDA.b #$00
#_029659: STA.l $7EF36D

#_02965D: LDA.b $1C
#_02965F: STA.l $7EC211

#_029663: LDA.b $1D
#_029665: STA.l $7EC212

#_029669: LDA.b $10
#_02966B: STA.w $010C

#_02966E: LDA.b #$12
#_029670: STA.b $10

#_029672: LDA.b #$01
#_029674: STA.b $11

#_029676: STZ.w $031F

.exit
#_029679: RTS

;===================================================================================================

Module07_15_WarpPad:
#_02967A: LDA.b $B0
#_02967C: CMP.b #$03
#_02967E: BCC .skip_upload

#_029680: JSL Graphics_IncrementalVRAMUpload
#_029684: JSL Underworld_LoadAttribute_Selectable

.skip_upload
#_029688: LDA.b $B0
#_02968A: JSL JumpTableLocal
#_02968E: dw ResetTransitionPropsAndAdvance_ResetInterface ; 0x00
#_029690: dw Module07_15_01_ApplyMosaicAndFilter           ; 0x01
#_029692: dw Underworld_InitializeRoomFromSpecial          ; 0x02
#_029694: dw UnderworldTransition_LoadSpriteGFX            ; 0x03
#_029696: dw Module07_15_04_SyncRoomPropsAndBuildOverlay   ; 0x04
#_029698: dw Underworld_PrepNextQuadrantUploadAndAdvance   ; 0x05
#_02969A: dw Underworld_PrepTilemapAndAdvance              ; 0x06
#_02969C: dw Underworld_PrepNextQuadrantUploadAndAdvance   ; 0x07
#_02969E: dw Underworld_PrepTilemapAndAdvance              ; 0x08
#_0296A0: dw Underworld_PrepNextQuadrantUploadAndAdvance   ; 0x09
#_0296A2: dw Underworld_PrepTilemapAndAdvance              ; 0x0A
#_0296A4: dw Underworld_PrepNextQuadrantUploadAndAdvance   ; 0x0B
#_0296A6: dw Underworld_AdvanceAndReset                    ; 0x0C
#_0296A8: dw Module07_15_0E_FadeInFromWarp                 ; 0x0D
#_0296AA: dw Module07_15_0F_FinalizeAndCacheEntry          ; 0x0E

;===================================================================================================

Module07_15_01_ApplyMosaicAndFilter:
#_0296AC: JSR ConditionalMosaicControl

#_0296AF: LDA.l $7EC011
#_0296B3: ORA.b #$03
#_0296B5: STA.b $95

#_0296B7: JMP.w ApplyPaletteFilter_bounce

;===================================================================================================

Module07_15_04_SyncRoomPropsAndBuildOverlay:
#_0296BA: JSL ApplyGrayscaleFixed_Incremental

#_0296BE: REP #$20

#_0296C0: LDA.b $A0
#_0296C2: CMP.w #$0017 ; ROOM 0017
#_0296C5: BNE .not_hera_5F

#_0296C7: LDX.b #$04
#_0296C9: STX.b $A4

.not_hera_5F
#_0296CB: JSR UnderworldSyncBG1and2Scroll
#_0296CE: JSL Underworld_AdjustForRoomLayout

#_0296D2: LDY.b #$16

#_0296D4: LDX.w $0414
#_0296D7: LDA.l Underworld_SubscreenEnable,X
#_0296DB: BPL .valid_screendes

#_0296DD: LDY.b #$17
#_0296DF: LDA.b #$00

.valid_screendes
#_0296E1: STY.b $1C
#_0296E3: STA.b $1D

#_0296E5: JSL WaterFlood_BuildOneQuadrantForVRAM

#_0296E9: INC.b $B0

#_0296EB: RTS

;===================================================================================================

Module07_15_0E_FadeInFromWarp:
#_0296EC: LDA.l $7EC007
#_0296F0: LSR A
#_0296F1: BCC .dont_decrease_mosaic

#_0296F3: LDA.l $7EC011
#_0296F7: BEQ .dont_decrease_mosaic

#_0296F9: SEC
#_0296FA: SBC.b #$10
#_0296FC: STA.l $7EC011

.dont_decrease_mosaic
#_029700: LDA.b #$09
#_029702: STA.b $94

#_029704: LDA.l $7EC011
#_029708: ORA.b #$03
#_02970A: STA.b $95

#_02970C: JMP.w ApplyPaletteFilter_bounce

;===================================================================================================

Module07_15_0F_FinalizeAndCacheEntry:
#_02970F: LDA.w $0200
#_029712: CMP.b #$05
#_029714: BNE EXIT_02971F

#_029716: JSL SetAndSaveVisitedQuadrantFlags

#_02971A: STZ.b $11

#_02971C: JSR ResetThenCacheRoomEntryProperties

;---------------------------------------------------------------------------------------------------

#EXIT_02971F:
#_02971F: RTS

;===================================================================================================

pool Module07_16_UpdatePegs

.vectors
#_029720: dw Module07_16_UpdatePegs_Step1    ; 0x00
#_029722: dw Module07_16_UpdatePegs_Step1    ; 0x01
#_029724: dw Module07_16_UpdatePegs_Step2    ; 0x02
#_029726: dw Module07_16_UpdatePegs_Step3    ; 0x03
#_029728: dw Module07_16_UpdatePegs_FinishUp ; 0x04

pool off

;---------------------------------------------------------------------------------------------------

Module07_16_UpdatePegs:
#_02972A: INC.b $B0

#_02972C: LDA.b $B0
#_02972E: AND.b #$03
#_029730: BNE EXIT_02971F

#_029732: LDA.b $B0
#_029734: LSR A
#_029735: TAX

#_029736: JMP.w (.vectors,X)

;===================================================================================================

Module07_16_UpdatePegs_Step1:
#_029739: REP #$10

#_02973B: LDX.w #$0100
#_02973E: LDY.w #$0080

#_029741: LDA.l $7EC172
#_029745: BEQ .blue_pegs_up

#_029747: TYX

#_029748: LDY.w #$0100

.blue_pegs_up
#_02974B: BRA Underworld_UpdatePegGFXBuffer

;===================================================================================================

Module07_16_UpdatePegs_Step2:
#_02974D: REP #$10

#_02974F: LDX.w #$0080
#_029752: LDY.w #$0100

#_029755: LDA.l $7EC172
#_029759: BEQ .blue_pegs_up

#_02975B: TYX

#_02975C: LDY.w #$0080

.blue_pegs_up
#_02975F: BRA Underworld_UpdatePegGFXBuffer

;===================================================================================================

Module07_16_UpdatePegs_Step3:
#_029761: REP #$10

#_029763: LDX.w #$0000
#_029766: LDY.w #$0180

#_029769: LDA.l $7EC172
#_02976D: BEQ Underworld_UpdatePegGFXBuffer

#_02976F: TYX

#_029770: LDY.w #$0000

;===================================================================================================

Underworld_UpdatePegGFXBuffer:
#_029773: STY.b $0E

#_029775: PHB

#_029776: LDA.b #$7F
#_029778: PHA
#_029779: PLB

#_02977A: REP #$20

;---------------------------------------------------------------------------------------------------

#_02977C: LDY.w #$0000

.next_blue
#_02977F: LDA.l $7EB340,X
#_029783: STA.w $7F0000,Y

#_029786: INX
#_029787: INX

#_029788: INY
#_029789: INY
#_02978A: CPY.w #$0080
#_02978D: BNE .next_blue

;---------------------------------------------------------------------------------------------------

#_02978F: LDX.b $0E

.next_orange
#_029791: LDA.l $7EB340,X
#_029795: STA.w $7F0000,Y

#_029798: INX
#_029799: INX

#_02979A: INY
#_02979B: INY
#_02979C: CPY.w #$0100
#_02979F: BNE .next_orange

;---------------------------------------------------------------------------------------------------

#_0297A1: SEP #$30

#_0297A3: PLB

#_0297A4: LDA.b #$17
#_0297A6: STA.b $17

#_0297A8: RTS

;===================================================================================================

Module07_16_UpdatePegs_FinishUp:
#_0297A9: JSL Underworld_FlipCrystalPegAttribute

#_0297AD: STZ.b $B0
#_0297AF: STZ.b $11

#_0297B1: RTS

;===================================================================================================

RecoverPegGFXFromMapping:
#_0297B2: REP #$10

#_0297B4: LDX.w #$0000
#_0297B7: LDY.w #$0180

#_0297BA: LDA.l $7EC172
#_0297BE: BEQ .blue_pegs_up

#_0297C0: TYX

#_0297C1: LDY.w #$0000

.blue_pegs_up
#_0297C4: JSR Underworld_UpdatePegGFXBuffer

#_0297C7: RTL

;===================================================================================================

Module07_17_PressurePlate:
#_0297C8: DEC.b $B0
#_0297CA: BNE .exit

#_0297CC: REP #$30

#_0297CE: LDA.b $20
#_0297D0: SEC
#_0297D1: SBC.w #$0002
#_0297D4: STA.b $20

#_0297D6: LDA.w $04B6
#_0297D9: LSR A
#_0297DA: LSR A
#_0297DB: LSR A
#_0297DC: AND.w #$01F8
#_0297DF: STA.b $02

#_0297E1: LDA.w $04B6
#_0297E4: AND.w #$003F
#_0297E7: ASL A
#_0297E8: ASL A
#_0297E9: ASL A
#_0297EA: STA.b $00

#_0297EC: SEP #$30

#_0297EE: LDY.b #$0E
#_0297F0: JSL Underworld_UpdateTilemapWithCommonTile

#_0297F4: LDA.w $010C
#_0297F7: STA.b $11

.exit
#_0297F9: RTS

;===================================================================================================

CrystalGraphicsTilemapLocation:
#_0297FA: dw $1618, $1658, $1658, $1618
#_029802: dw $0658, $1618, $1658, $0000

;===================================================================================================

Module07_18_RescuedMaiden:
#_02980A: LDA.b $B0
#_02980C: JSL JumpTableLocal
#_029810: dw PrepareForCrystalCutscene                   ; 0x00
#_029812: dw BuildCrystalCutsceneTilemap                 ; 0x01
#_029814: dw Underworld_PrepTilemapAndAdvance            ; 0x02
#_029816: dw Underworld_PrepNextQuadrantUploadAndAdvance ; 0x03
#_029818: dw Underworld_PrepTilemapAndAdvance            ; 0x04
#_02981A: dw Underworld_PrepNextQuadrantUploadAndAdvance ; 0x05
#_02981C: dw Underworld_PrepTilemapAndAdvance            ; 0x06
#_02981E: dw Underworld_PrepNextQuadrantUploadAndAdvance ; 0x07
#_029820: dw Underworld_PrepTilemapAndAdvance            ; 0x08
#_029822: dw Underworld_PrepNextQuadrantUploadAndAdvance ; 0x09
#_029824: dw StartCrystalCutscene                        ; 0x0A

;===================================================================================================

PrepareForCrystalCutscene:
#_029826: JSL PaletteFilter_RestoreBGSubstractiveStrict

#_02982A: LDA.l $7EC540
#_02982E: STA.l $7EC500

#_029832: LDA.l $7EC541
#_029836: STA.l $7EC501

#_02983A: LDA.l $7EC009
#_02983E: CMP.b #$FF
#_029840: BNE .exit

;---------------------------------------------------------------------------------------------------

#_029842: REP #$30

#_029844: LDX.w #$0000
#_029847: LDA.w #$01EC

.next
#_02984A: STA.l $7E2000,X
#_02984E: STA.l $7E2800,X
#_029852: STA.l $7E3000,X
#_029856: STA.l $7E3800,X

#_02985A: STA.l $7E4000,X
#_02985E: STA.l $7E4800,X
#_029862: STA.l $7E5000,X
#_029866: STA.l $7E5800,X

#_02986A: INX
#_02986B: INX
#_02986C: CPX.w #$0800
#_02986F: BNE .next

;---------------------------------------------------------------------------------------------------

#_029871: STZ.w $011C
#_029874: STZ.w $011A

#_029877: STZ.w $0422
#_02987A: STZ.w $0424

#_02987D: SEP #$30

#_02987F: STZ.w $0418
#_029882: STZ.w $045C

#_029885: INC.b $B0

.exit
#_029887: RTS

;===================================================================================================

BuildCrystalCutsceneTilemap:
#_029888: JSL PaletteFilter_Crystal

#_02988C: LDA.b #$01
#_02988E: STA.b $1D

#_029890: LDA.b #$02
#_029892: STA.w $02E4

;---------------------------------------------------------------------------------------------------

#_029895: REP #$20

#_029897: LDX.b #$0E

#_029899: LDA.b $A0

.next_crystal_check
#_02989B: DEX
#_02989C: DEX

#_02989D: CMP.l CrystalBossRooms,X
#_0298A1: BNE .next_crystal_check

#_0298A3: LDA.l CrystalGraphicsTilemapLocation,X
#_0298A7: STA.b $08

;---------------------------------------------------------------------------------------------------

#_0298A9: REP #$10

#_0298AB: LDA.w #$0004
#_0298AE: STA.b $0C

#_0298B0: STZ.b $0E

.next_super
#_0298B2: LDY.w #$0007
#_0298B5: LDX.b $08

.next_tile
#_0298B7: LDA.b $0E
#_0298B9: ORA.w #$1F80
#_0298BC: STA.l $7E4000,X

#_0298C0: ORA.w #$1F88
#_0298C3: STA.l $7E4200,X

#_0298C7: INC.b $0E

#_0298C9: INX
#_0298CA: INX

#_0298CB: DEY
#_0298CC: BPL .next_tile

#_0298CE: LDA.b $0E
#_0298D0: CLC
#_0298D1: ADC.w #$0008
#_0298D4: STA.b $0E

#_0298D6: LDA.b $08
#_0298D8: CLC
#_0298D9: ADC.w #$0080
#_0298DC: STA.b $08

#_0298DE: DEC.b $0C
#_0298E0: BNE .next_super

;---------------------------------------------------------------------------------------------------

#_0298E2: SEP #$30

#_0298E4: INC.b $B0

#_0298E6: RTS

;===================================================================================================

StartCrystalCutscene:
#_0298E7: INC.w $012A

#_0298EA: JSL Polyhedral_InitializeThread

#_0298EE: JSL CrystalCutscene_Initialize

#_0298F2: STZ.b $11
#_0298F4: STZ.b $B0

#_0298F6: RTS

;===================================================================================================

Module07_19_MirrorFade:
#_0298F7: JSR MosaicControlIncrease

#_0298FA: DEC.b $13
#_0298FC: BNE .exit

#_0298FE: LDA.b #$05
#_029900: STA.b $10

#_029902: STZ.b $11
#_029904: STZ.b $14

#_029906: LDA.w $0130
#_029909: STA.w $0133

#_02990C: LDA.w $0ABD
#_02990F: BEQ .exit

#_029911: JSL Palette_RevertTranslucencySwap

.exit
#_029915: RTS

;===================================================================================================

Module07_1A_RoomDraw_OpenTriforceDoor_bounce:
#_029916: JSL RoomDraw_OpenTriforceDoor

#_02991A: RTS

;===================================================================================================

Module0C_Unused:
#_02991B: JSR ConditionalMosaicControl
#_02991E: JSR Module0C_RunSubmodule

#_029921: RTL

;===================================================================================================

Module0C_RunSubmodule:
#_029922: LDA.b $B0
#_029924: JSL JumpTableLocal
#_029928: dw ResetTransitionPropsAndAdvance_ResetInterface
#_02992A: dw ApplyPaletteFilter_bounce
#_02992C: dw Module0C_RestoreModule

;===================================================================================================

Module0C_RestoreModule:
#_02992E: LDA.w $010C
#_029931: STA.b $10

#_029933: STZ.b $11
#_029935: STZ.b $B0

#_029937: RTS

;---------------------------------------------------------------------------------------------------

Module0D_Unused:
#_029938: LDA.l $7EC007
#_02993C: LSR A
#_02993D: BCC .dont_adjust_mosaic

#_02993F: LDA.l $7EC011
#_029943: SEC
#_029944: SBC.b #$10
#_029946: STA.l $7EC011

.dont_adjust_mosaic
#_02994A: JSR CopyMosaicControl

#_02994D: JSR Module0D_RunSubmodule

#_029950: RTL

;---------------------------------------------------------------------------------------------------

Module0D_RunSubmodule:
#_029951: LDA.b $B0
#_029953: JSL JumpTableLocal
#_029957: dw ApplyPaletteFilter_bounce
#_029959: dw Module0D_RestoreModule

;===================================================================================================

Module0D_RestoreModule:
#_02995B: STZ.b $11
#_02995D: STZ.b $B0

#_02995F: LDA.w $010C
#_029962: STA.b $10

#_029964: CMP.b #$09
#_029966: BNE .exit

#_029968: LDA.w $0696
#_02996B: ORA.w $0698
#_02996E: BEQ .exit

#_029970: LDA.b #$0A
#_029972: STA.b $11

#_029974: LDA.b #$10
#_029976: STA.w $069A

.exit
#_029979: RTS

;===================================================================================================

pool Module0F_SpotlightClose

.direction
#_02997A: db $08
#_02997B: db $04
#_02997C: db $02
#_02997D: db $01

.submodules
#_02997E: dw Underworld_PrepExitWithSpotlight
#_029980: dw Spotlight_ConfigureTableAndControl

pool off

;---------------------------------------------------------------------------------------------------

Module0F_SpotlightClose:
#_029982: JSL Sprite_Main

#_029986: LDA.b $11
#_029988: ASL A
#_029989: TAX

#_02998A: JSR (.submodules,X)

;---------------------------------------------------------------------------------------------------

#_02998D: LDA.b $1B
#_02998F: BNE .indoors

#_029991: LDA.b $8A
#_029993: CMP.b #$0F ; ROOM 010F
#_029995: BNE .not_waterfall_of_wishing

#_029997: LDA.b #$01
#_029999: STA.w $0351

.not_waterfall_of_wishing
#_02999C: LDA.b #$06
#_02999E: STA.b $5E

#_0299A0: JSL Link_HandleVelocity

#_0299A4: STZ.b $31
#_0299A6: STZ.b $30

.indoors
#_0299A8: LDA.b $2F
#_0299AA: LSR A
#_0299AB: TAX

#_0299AC: LDA.b $1B
#_0299AE: BNE .still_indoors

#_0299B0: LDX.b #$00

#_0299B2: LDA.w $010E
#_0299B5: CMP.b #$43 ; ENTRANCE 43
#_0299B7: BNE .still_indoors

#_0299B9: INX

.still_indoors
#_0299BA: LDA.l .direction,X
#_0299BE: STA.b $26
#_0299C0: STA.b $67

#_0299C2: JSL Link_HandleMovingAnimation_FullLongEntry
#_0299C6: JML LinkOAM_Main

;===================================================================================================

Underworld_PrepExitWithSpotlight:
#_0299CA: STZ.w $012A
#_0299CD: STZ.w $1F0C

#_0299D0: LDA.b $1B
#_0299D2: BNE .indoors

#_0299D4: JSL Ancilla_DeleteWaterfallSplashes

#_0299D8: REP #$20

#_0299DA: LDA.b $20
#_0299DC: STA.l $7EC148

#_0299E0: SEP #$20

;---------------------------------------------------------------------------------------------------

.indoors
#_0299E2: LDX.w $010E

#_0299E5: LDA.l EntranceData_song,X
#_0299E9: CMP.b #$03 ; SONG 03
#_0299EB: BNE .check_if_half_vol

#_0299ED: LDA.l $7EF3C5
#_0299F1: CMP.b #$02
#_0299F3: BCC .rain_state

.check_if_half_vol
#_0299F5: CMP.b #$F2 ; SONG F2 - half volume
#_0299F7: BNE .fade_song

#_0299F9: LDX.w $0130
#_0299FC: CPX.b #$0C ; SONG 0C
#_0299FE: BNE .set_song

#_029A00: LDA.b #$07 ; SONG 07
#_029A02: BRA .set_song

.fade_song
#_029A04: LDA.b #$F1 ; SONG F1

;---------------------------------------------------------------------------------------------------

.set_song
#_029A06: STA.w $012C

.rain_state
#_029A09: STZ.w $04A0

#_029A0C: JSL HUD_HandleFloorIndicator

#_029A10: INC.b $16

#_029A12: JSL IrisSpotlight_close

#_029A16: INC.b $11

;---------------------------------------------------------------------------------------------------

#EXIT_029A18:
#_029A18: RTS

;===================================================================================================

Spotlight_ConfigureTableAndControl:
#_029A19: JSL IrisSpotlight_ConfigureTable

#_029A1D: STZ.w $012A
#_029A20: STZ.w $1F0C

#_029A23: LDA.b $11
#_029A25: BNE EXIT_029A18

#_029A27: LDA.b $10
#_029A29: CMP.b #$06
#_029A2B: BNE .dont_restore_y_coord

#_029A2D: REP #$20

#_029A2F: LDA.l $7EC148
#_029A33: STA.b $20

#_029A35: SEP #$20

;---------------------------------------------------------------------------------------------------

#Spotlight_ConfigureTableAndControl_dont_restore_y_coord:
#_029A37: LDA.b $10
#_029A39: CMP.b #$09
#_029A3B: BEQ .dont_reset

#_029A3D: JSL EnableForceBlank
#_029A41: JSL Link_ItemReset_FromOverworldThings

.dont_reset
#_029A45: LDA.b $10
#_029A47: CMP.b #$09
#_029A49: BNE .delay_advance

#_029A4B: LDA.b $A1
#_029A4D: BNE .underworld_2

#_029A4F: LDA.b $A0
#_029A51: CMP.b #$20 ; ROOM 0020
#_029A53: BEQ .from_agahnim

.underworld_2
#_029A55: LDA.b #$0A

#_029A57: LDX.b $2F
#_029A59: BNE .not_facing_up

#_029A5B: LDA.b #$0B

.not_facing_up
#_029A5D: STA.b $11

.from_agahnim
#_029A5F: LDA.b #$10
#_029A61: STA.w $069A

#_029A64: LDA.w $0696
#_029A67: ORA.w $0698
#_029A6A: BEQ .delay_advance

#_029A6C: LDA.w $0699
#_029A6F: BEQ .delay_advance

#_029A71: LDX.b #$00
#_029A73: ASL A
#_029A74: BCC .not_long_walk

#_029A76: LDX.b #$18

.not_long_walk
#_029A78: LDA.w $0699
#_029A7B: AND.b #$7F
#_029A7D: STA.w $0699

#_029A80: STX.w $0692
#_029A83: STZ.w $0690

#_029A86: LDA.b #$09
#_029A88: STA.b $11

#_029A8A: STZ.b $B0

#_029A8C: LDA.b #$15 ; SFX3.15
#_029A8E: STA.w $012F

;---------------------------------------------------------------------------------------------------

.delay_advance
#_029A91: STZ.b $96
#_029A93: STZ.b $97
#_029A95: STZ.b $98

#_029A97: STZ.b $1E
#_029A99: STZ.b $1F

#_029A9B: STZ.w $03EF

;---------------------------------------------------------------------------------------------------

#_029A9E: REP #$30

#_029AA0: LDX.w #$4C26
#_029AA3: LDY.w #$8C4C

#_029AA6: LDA.b $8A
#_029AA8: CMP.w #$0003 ; OW 03
#_029AAB: BEQ .on_dm_screens

#_029AAD: CMP.w #$0005 ; OW 05
#_029AB0: BEQ .on_dm_screens

#_029AB2: CMP.w #$0007 ; OW 07
#_029AB5: BEQ .on_dm_screens

#_029AB7: LDX.w #$4A26
#_029ABA: LDY.w #$874A

#_029ABD: CMP.w #$0043 ; OW 43
#_029AC0: BEQ .on_dm_screens

#_029AC2: CMP.w #$0045 ; OW 45
#_029AC5: BEQ .on_dm_screens

#_029AC7: CMP.w #$0047 ; OW 47
#_029ACA: BNE .not_dm_screen

.on_dm_screens
#_029ACC: STX.b $9C
#_029ACE: STY.b $9D

.not_dm_screen
#_029AD0: SEP #$30

#_029AD2: RTS

;===================================================================================================

pool Module10_SpotlightOpen

.submodules
#_029AD3: dw Module10_00_OpenIris
#_029AD5: dw Spotlight_ConfigureTableAndControl

pool off

;---------------------------------------------------------------------------------------------------

Module10_SpotlightOpen:
#_029AD7: JSL Sprite_Main

#_029ADB: LDA.b $11
#_029ADD: ASL A
#_029ADE: TAX

#_029ADF: JSR (.submodules,X)

#_029AE2: JML LinkOAM_Main

;===================================================================================================

Module10_00_OpenIris:
#_029AE6: JSL IrisSpotlight_open

#_029AEA: INC.b $11

#_029AEC: RTS

;===================================================================================================

pool Module11_UnderworldFallingEntrance

.vectors
#_029AED: dw Module_11_00_SetSongAndInit        ; 0x00
#_029AEF: dw PaletteFilter_bounce               ; 0x01
#_029AF1: dw Module11_02_LoadEntrance           ; 0x02
#_029AF3: dw UnderworldTransition_LoadSpriteGFX ; 0x03
#_029AF5: dw Module11_04_FadeAndLoadQuadrants   ; 0x04
#_029AF7: dw Module11_05_LoadQuadrants          ; 0x05

pool off

;---------------------------------------------------------------------------------------------------

Module11_UnderworldFallingEntrance:
#_029AF9: LDA.b $B0
#_029AFB: ASL A
#_029AFC: TAX

#_029AFD: JSR (.vectors,X)

#_029B00: RTL

;===================================================================================================

Module_11_00_SetSongAndInit:
#_029B01: LDX.w $010E

#_029B04: LDA.l EntranceData_song,X
#_029B08: CMP.b #$03 ; SONG 03
#_029B0A: BNE .fade

#_029B0C: LDA.l $7EF3C5
#_029B10: CMP.b #$02
#_029B12: BCC .rain_state

.fade
#_029B14: LDA.b #$F1 ; SONG F1 - fade
#_029B16: STA.w $012C

.rain_state
#_029B19: JMP.w ResetTransitionPropsAndAdvance_ResetInterface

;===================================================================================================

Module11_02_LoadEntrance:
#_029B1C: JSL EnableForceBlank

#_029B20: LDA.b #$02
#_029B22: STA.b $99

#_029B24: JSR Underworld_LoadEntrance

#_029B27: LDA.w $040C
#_029B2A: CMP.b #$FF ; DUNGEON FF
#_029B2C: BEQ .caves

#_029B2E: CMP.b #$02 ; DUNGEON 02
#_029B30: BNE .not_castle

#_029B32: LDA.b #$00 ; DUNGEON 00

.not_castle
#_029B34: LSR A
#_029B35: TAX

#_029B36: LDA.l $7EF37C,X

;---------------------------------------------------------------------------------------------------

.caves
#_029B3A: JSL RebuildHUD_Keys

#_029B3E: LDA.b #$04
#_029B40: STA.b $5A

#_029B42: LDA.b #$03
#_029B44: STA.b $5B

#_029B46: LDA.b #$0C
#_029B48: STA.b $4B

#_029B4A: LDA.b #$10
#_029B4C: STA.b $57

#_029B4E: LDA.b $20
#_029B50: SEC
#_029B51: SBC.b $E8
#_029B53: STA.b $00
#_029B55: STZ.b $01

#_029B57: STZ.w $0308
#_029B5A: STZ.w $0309
#_029B5D: STZ.w $030B

;---------------------------------------------------------------------------------------------------

#_029B60: REP #$30

#_029B62: LDA.b $A0
#_029B64: STA.b $A2

#_029B66: LDA.w #$0010
#_029B69: CLC
#_029B6A: ADC.b $00
#_029B6C: STA.b $00

#_029B6E: LDA.b $20
#_029B70: STA.b $51

#_029B72: SEC
#_029B73: SBC.b $00
#_029B75: STA.b $20

;---------------------------------------------------------------------------------------------------

#_029B77: SEP #$30

#_029B79: LDA.b $B0
#_029B7B: PHA

#_029B7C: STZ.w $045A
#_029B7F: STZ.w $0458

#_029B82: JSR Underworld_LoadAndDrawRoom
#_029B85: JSL Underworld_LoadCustomTileTypes

#_029B89: LDX.w $0AA1

#_029B8C: LDA.l AnimatedTileSheets,X
#_029B90: TAY

#_029B91: JSL DecompressAnimatedUnderworldTiles
#_029B95: JSL Underworld_LoadAttributeTable

;---------------------------------------------------------------------------------------------------

#_029B99: PLA
#_029B9A: INC A
#_029B9B: STA.b $B0

#_029B9D: LDA.b #$0A
#_029B9F: STA.w $0AA4

#_029BA2: LDA.b #$02
#_029BA4: STA.w OBSEL

#_029BA7: JSL InitializeTilesets

#_029BAB: LDA.b #$0A
#_029BAD: STA.w $0AB1

#_029BB0: JSR Underworld_LoadPalettes
#_029BB3: JSL RestoreTorchBackground

#_029BB7: STZ.b $3A
#_029BB9: STZ.b $3C

;---------------------------------------------------------------------------------------------------

#_029BBB: JSR Underworld_ResetTorchBackgroundAndPlayer

#_029BBE: LDA.w $02E0
#_029BC1: BEQ .not_bunny

#_029BC3: JSL RefreshLinkEquipmentPalettes_bunny

.not_bunny
#_029BC7: LDA.b #$80
#_029BC9: STA.b $9B

#_029BCB: JSL RefillLogic_long
#_029BCF: JSL UnderworldAdjustRainSFX

#_029BD3: LDA.b #$07
#_029BD5: STA.b $11

;===================================================================================================

Underworld_LoadSongBankIfNeeded:
#_029BD7: LDA.w $0132
#_029BDA: CMP.b #$FF ; SONG FF - transfer
#_029BDC: BEQ .exit

#_029BDE: CMP.b #$F2 ; SONG F2 - half volume
#_029BE0: BEQ .exit

#_029BE2: CMP.b #$03 ; SONG 03
#_029BE4: BEQ .overworld_song

#_029BE6: CMP.b #$07 ; SONG 07
#_029BE8: BEQ .overworld_song

#_029BEA: CMP.b #$0E ; SONG 0E
#_029BEC: BEQ .overworld_song

#_029BEE: LDA.w $0136
#_029BF1: BNE .exit

#_029BF3: SEI
#_029BF4: STZ.w NMITIMEN
#_029BF7: STZ.w HDMAEN

#_029BFA: INC.w $0136

#_029BFD: LDA.b #$FF ; SONG FF - transfer
#_029BFF: STA.w APUIO0

#_029C02: JSL LoadUnderworldSongs

#_029C06: LDA.b #$81
#_029C08: STA.w NMITIMEN

.exit
#_029C0B: RTS

;---------------------------------------------------------------------------------------------------

.overworld_song
#_029C0C: JMP.w LoadOWMusicIfNeeded

;===================================================================================================

Module11_04_FadeAndLoadQuadrants:
#_029C0F: LDA.b $13
#_029C11: INC A
#_029C12: AND.b #$0F
#_029C14: STA.b $13

#_029C16: CMP.b #$0F
#_029C18: BNE Module11_05_LoadQuadrants

#_029C1A: INC.b $B0

;===================================================================================================

Module11_05_LoadQuadrants:
#_029C1C: JSL HandleUnderworldLandingFromPit

#_029C20: LDA.b $11
#_029C22: BNE .exit

#_029C24: LDA.b #$07
#_029C26: STA.b $10

#_029C28: INC.w $04C7

#_029C2B: JSR Underworld_PlayBlipAndCacheQuadrantVisits
#_029C2E: JSR ResetThenCacheRoomEntryProperties

#_029C31: LDA.w $0132
#_029C34: STA.w $012C

#_029C37: LDA.w $0130
#_029C3A: STA.w $0133

.exit
#_029C3D: RTS

;===================================================================================================

pool Module13_BossVictory_Pendant

.submodules
#_029C3E: dw BossVictory_Heal                   ; 0x00
#_029C40: dw Underworld_StartVictorySpin        ; 0x01
#_029C42: dw Underworld_RunVictorySpin          ; 0x02
#_029C44: dw Underworld_CloseVictorySpin        ; 0x03
#_029C46: dw Underworld_PrepExitWithSpotlight   ; 0x04
#_029C48: dw Spotlight_ConfigureTableAndControl ; 0x05

pool off

;---------------------------------------------------------------------------------------------------

Module13_BossVictory_Pendant:
#_029C4A: LDA.b $11
#_029C4C: ASL A
#_029C4D: TAX

#_029C4E: JSR (.submodules,X)

#_029C51: JSL Sprite_Main
#_029C55: JML LinkOAM_Main

;===================================================================================================

BossVictory_Heal:
#_029C59: JSL AnimatedRefill_Magic
#_029C5D: BCS .still_restoring_magic

#_029C5F: INC.w $0200

.still_restoring_magic
#_029C62: JSL AnimatedRefill_Health
#_029C66: BCS .still_healing_hp

#_029C68: INC.w $0200

.still_healing_hp
#_029C6B: LDA.w $0200
#_029C6E: BNE .reset_subsub

;---------------------------------------------------------------------------------------------------

#_029C70: LDA.b $3A
#_029C72: AND.b #$BF
#_029C74: STA.b $3A

#_029C76: JSR DeleteCertainAncillaeStopDashing

#_029C79: LDA.b #$02
#_029C7B: STA.b $2F

#_029C7D: ASL A
#_029C7E: STA.b $26

#_029C80: INC.b $16
#_029C82: INC.b $11

#_029C84: LDA.b #$10
#_029C86: STA.b $B0

#_029C88: INC.w $02E4

;---------------------------------------------------------------------------------------------------

.reset_subsub
#_029C8B: STZ.w $0200

#_029C8E: JSL RefillLogic_long

#_029C92: RTS

;===================================================================================================

Underworld_StartVictorySpin:
#_029C93: DEC.b $B0
#_029C95: BNE .exit

#_029C97: STZ.w $02E4

#_029C9A: LDA.b #$02
#_029C9C: STA.b $2F

#_029C9E: JSL Link_AnimateVictorySpin_long
#_029CA2: JSL Ancilla_TerminateSelectInteractives
#_029CA6: JSL AncillaAdd_VictorySpin

#_029CAA: INC.b $11

.exit
#_029CAC: RTS

;===================================================================================================

Underworld_RunVictorySpin:
#_029CAD: JSL Link_Main

#_029CB1: LDA.b $5D
#_029CB3: CMP.b #$00 ; LINKSTATE 00
#_029CB5: BNE .exit

#_029CB7: LDA.l $7EF359
#_029CBB: INC A
#_029CBC: AND.b #$FE
#_029CBE: BEQ .skip_sfx

#_029CC0: LDA.b #$2C ; SFX2.2C
#_029CC2: STA.w $012E

.skip_sfx
#_029CC5: LDA.b #$01
#_029CC7: STA.w $03EF

#_029CCA: LDA.b #$20
#_029CCC: STA.b $B0

#_029CCE: INC.b $11

.exit
#_029CD0: RTS

;===================================================================================================

Underworld_CloseVictorySpin:
#_029CD1: DEC.b $B0
#_029CD3: BNE .exit

#_029CD5: INC.b $11

#_029CD7: STZ.b $30
#_029CD9: STZ.b $31

#_029CDB: LDA.b #$00
#_029CDD: STA.l $7EC017

.exit
#_029CE1: RTS

;===================================================================================================

pool Module15_MirrorWarpFromAga

.submodules
#_029CE2: dw Module15_00_Initialize          ; 0x00
#_029CE4: dw Module15_01_SetTheScene         ; 0x01
#_029CE6: dw Module15_02_RunMirrorWarp_Part1 ; 0x02
#_029CE8: dw Module15_03_RunMirrorWarp_Part2 ; 0x03
#_029CEA: dw Module15_04_RunMirrorWarp_Part3 ; 0x04
#_029CEC: dw Module15_05                     ; 0x05
#_029CEE: dw Module15_06                     ; 0x06
#_029CF0: dw Module15_07                     ; 0x07
#_029CF2: dw Module15_08                     ; 0x08
#_029CF4: dw BossVictory_Heal                ; 0x09
#_029CF6: dw Underworld_StartVictorySpin     ; 0x0A
#_029CF8: dw Underworld_RunVictorySpin       ; 0x0B
#_029CFA: dw Module15_0C                     ; 0x0C

pool off

;---------------------------------------------------------------------------------------------------

Module15_MirrorWarpFromAga:
#_029CFC: LDA.b $11
#_029CFE: ASL A
#_029CFF: TAX

#_029D00: JSR (.submodules,X)

#_029D03: LDA.b $11
#_029D05: CMP.b #$02
#_029D07: BCC .draw_link

#_029D09: CMP.b #$05
#_029D0B: BCC .exit

.draw_link
#_029D0D: JSL Sprite_Main
#_029D11: JSL LinkOAM_Main

.exit
#_029D15: RTL

;===================================================================================================

Module15_00_Initialize:
#_029D16: STZ.w $0710

#_029D19: INC.w $0200
#_029D1C: INC.b $11

#_029D1E: JSR LoadOWMusicIfNeeded

#_029D21: RTS

;===================================================================================================

Module15_01_SetTheScene:
#_029D22: LDA.b #$08 ; SONG 08
#_029D24: STA.w $012C
#_029D27: STA.w $0410

#_029D2A: JSL InitializeMirrorHDMA

#_029D2E: STZ.w $0200

#_029D31: JSL PaletteFilter_InitializeWhiteFilter

#_029D35: JSR Overworld_LoadGFXAndScreenSize

#_029D38: INC.b $11

#_029D3A: LDA.b #$14 ; LINKSTATE 14
#_029D3C: STA.b $5D

#_029D3E: REP #$20

#_029D40: STZ.w $011A
#_029D43: STZ.w $011C

#_029D46: STZ.w $0402
#_029D49: STZ.b $30

#_029D4B: LDA.w #$7FFF ; RGB: #F8F8F8
#_029D4E: STA.l $7EC500
#_029D52: STA.l $7EC540

#_029D56: SEP #$20

#_029D58: JSL ResetAncillaAndLink

#_029D5C: RTS

;===================================================================================================

Module15_05:
#_029D5D: REP #$30

#_029D5F: LDA.w #$2641
#_029D62: STA.w DMA7MODE

#_029D65: LDX.w #$003E

#_029D68: LDA.w #$FF00

;---------------------------------------------------------------------------------------------------

.next
#_029D6B: STA.w $1B00,X
#_029D6E: STA.w $1B40,X
#_029D71: STA.w $1B80,X
#_029D74: STA.w $1BC0,X

#_029D77: STA.w $1C00,X
#_029D7A: STA.w $1C40,X
#_029D7D: STA.w $1C80,X

#_029D80: DEX
#_029D81: DEX
#_029D82: BPL .next

;---------------------------------------------------------------------------------------------------

#_029D84: LDA.w #$0000
#_029D87: STA.l $7EC007
#_029D8B: STA.l $7EC009

#_029D8F: SEP #$20

#_029D91: LDX.w #$0035 ; MESSAGE 0035
#_029D94: STX.w $1CF0

#_029D97: SEP #$10

#_029D99: JSL Interface_PrepAndDisplayMessage

#_029D9D: JSL ReloadPreviouslyLoadedSheets
#_029DA1: JSL RebuildHUD_ZeroKeys

#_029DA5: LDA.b #$80
#_029DA7: STA.b $9B

#_029DA9: LDA.b #$15
#_029DAB: STA.b $10

#_029DAD: LDA.b #$06
#_029DAF: STA.b $11

#_029DB1: LDA.b #$18
#_029DB3: STA.b $B0

#_029DB5: RTS

;===================================================================================================

Module15_06:
#_029DB6: DEC.b $B0
#_029DB8: BNE .exit

#_029DBA: INC.b $11

#_029DBC: LDA.b #$09 ; SFX1.09
#_029DBE: STA.w $012D

.exit
#_029DC1: RTS

;===================================================================================================

Module15_07:
#_029DC2: JSL RenderText

#_029DC6: LDA.b $11
#_029DC8: BNE .exit

#_029DCA: STZ.w $0200

#_029DCD: LDA.b #$05 ; SFX1.05
#_029DCF: STA.w $012D

#_029DD2: LDX.b #$09

#_029DD4: LDA.l $7EF357
#_029DD8: BNE .set_submodule

;---------------------------------------------------------------------------------------------------

#_029DDA: REP #$20

#_029DDC: LDA.w #$0036 ; MESSAGE 0036
#_029DDF: STA.w $1CF0

#_029DE2: SEP #$20

#_029DE4: JSL Interface_PrepAndDisplayMessage

#_029DE8: STZ.w $012D

#_029DEB: LDA.b #$15
#_029DED: STA.b $10

#_029DEF: LDX.b #$09
#_029DF1: DEX

;---------------------------------------------------------------------------------------------------

.set_submodule
#_029DF2: STX.b $11

.exit
#_029DF4: RTS

;===================================================================================================

Module15_08:
#_029DF5: JSL RenderText

#_029DF9: LDA.b $11
#_029DFB: BNE .exit

#_029DFD: LDA.b #$20
#_029DFF: STA.b $B0

#_029E01: LDX.b #$0C
#_029E03: STX.b $11

.exit
#_029E05: RTS

;===================================================================================================

Module15_02_RunMirrorWarp_Part1:
#_029E06: JSL MirrorWarp_BuildAndEnableHDMATable

#_029E0A: INC.b $11
#_029E0C: STZ.b $B0

#_029E0E: RTS

;===================================================================================================

Module15_03_RunMirrorWarp_Part2:
#_029E0F: JSL MirrorWarp_BuildWavingHDMATable

#_029E13: BRA .check_subsub

;===================================================================================================

#Module15_04_RunMirrorWarp_Part3:
#_029E15: JSL MirrorWarp_BuildDewavingHDMATable

;---------------------------------------------------------------------------------------------------

.check_subsub
#_029E19: LDA.b $B0
#_029E1B: BEQ .exit

#_029E1D: STZ.b $B0

#_029E1F: INC.b $11

.exit
#_029E21: RTS

;===================================================================================================

Module15_0C:
#_029E22: DEC.b $B0
#_029E24: BNE .exit

#_029E26: JSL ResetAncillaAndCutscene
#_029E2A: JSL AdjustOverworldAmbiance

#_029E2E: LDA.l $7EF29B
#_029E32: ORA.b #$20
#_029E34: STA.l $7EF29B

#_029E38: LDA.b #$FF
#_029E3A: STA.w $040C

#_029E3D: STZ.b $11
#_029E3F: STZ.w $0200

#_029E42: STZ.w $0710

#_029E45: LDA.b #$09
#_029E47: STA.b $10

#_029E49: STZ.b $E6

#_029E4B: LDX.b #$09 ; SONG 09

#_029E4D: LDA.l $7EF357
#_029E51: BNE .have_pearl

#_029E53: LDX.b #$04 ; SONG 04

.have_pearl
#_029E55: STX.w $012C

#_029E58: LDA.b #$06
#_029E5A: STA.l $7EF3C7

.exit
#_029E5E: RTS

;===================================================================================================

SetTargetOverworldWarpToPyramid:
#_029E5F: LDA.b $10
#_029E61: CMP.b #$15
#_029E63: BNE .exit

#_029E65: JSR LoadOverworldFromUnderworld

#_029E68: LDY.b #$5A
#_029E6A: JSL DecompressAnimatedOverworldTiles

;===================================================================================================

#ResetAncillaAndCutscene:
#_029E6E: JSL Ancilla_TerminateSelectInteractives

#_029E72: STZ.w $037B

#_029E75: STZ.b $3C
#_029E77: STZ.b $3A

#_029E79: STZ.w $03EF
#_029E7C: STZ.w $02E4

.exit
#_029E7F: RTL

;===================================================================================================

pool Module16_BossVictory_Crystal

.submodules
#_029E80: dw BossVictory_Heal            ; 0x00
#_029E82: dw Underworld_StartVictorySpin ; 0x01
#_029E84: dw Underworld_RunVictorySpin   ; 0x02
#_029E86: dw Underworld_CloseVictorySpin ; 0x03
#_029E88: dw Module16_04_FadeAndEnd      ; 0x04

pool off

;---------------------------------------------------------------------------------------------------

Module16_BossVictory_Crystal:
#_029E8A: LDA.b $11
#_029E8C: ASL A
#_029E8D: TAX

#_029E8E: JSR (.submodules,X)

#_029E91: JSL Sprite_Main
#_029E95: JML LinkOAM_Main

;===================================================================================================

#EXIT_029E99:
#_029E99: RTS

;---------------------------------------------------------------------------------------------------

Module16_04_FadeAndEnd:
#_029E9A: DEC.b $13
#_029E9C: BNE EXIT_029E99

#_029E9E: REP #$20

#_029EA0: STZ.w $011A
#_029EA3: STZ.w $011C

#_029EA6: STZ.b $30

#_029EA8: SEP #$20

#_029EAA: STZ.w $02E4

#_029EAD: JSL Palette_RevertTranslucencySwap

#_029EB1: LDA.b #$00 ; LINKSTATE 00
#_029EB3: STA.b $5D

#_029EB5: STZ.w $02D8
#_029EB8: STZ.w $02DA
#_029EBB: STZ.w $037B

#_029EBE: LDA.w $010C
#_029EC1: STA.b $10

#_029EC3: STZ.b $11
#_029EC5: STZ.b $B0

#_029EC7: JMP.w Spotlight_ConfigureTableAndControl_dont_restore_y_coord

;===================================================================================================

pool Module18_GanonEmerges

.submodules
#_029ECA: dw Module18_00 ; 0x00
#_029ECC: dw Module18_01 ; 0x01
#_029ECE: dw Module18_02 ; 0x02
#_029ED0: dw Module18_03 ; 0x03
#_029ED2: dw Module18_04 ; 0x04
#_029ED4: dw Module18_05 ; 0x05
#_029ED6: dw EXIT_029FC0 ; 0x06
#_029ED8: dw Module18_07 ; 0x07
#_029EDA: dw Module18_08 ; 0x08

pool off

;---------------------------------------------------------------------------------------------------

Module18_GanonEmerges:
#_029EDC: REP #$21

#_029EDE: LDA.b $E2
#_029EE0: PHA

#_029EE1: ADC.w $011A
#_029EE4: STA.b $E2
#_029EE6: STA.w $011E

#_029EE9: LDA.b $E8
#_029EEB: PHA

#_029EEC: CLC
#_029EED: ADC.w $011C
#_029EF0: STA.b $E8
#_029EF2: STA.w $0122

#_029EF5: LDA.b $E0
#_029EF7: PHA

#_029EF8: CLC
#_029EF9: ADC.w $011A
#_029EFC: STA.b $E0
#_029EFE: STA.w $0120

#_029F01: LDA.b $E6
#_029F03: PHA

#_029F04: CLC
#_029F05: ADC.w $011C
#_029F08: STA.b $E6
#_029F0A: STA.w $0124

;---------------------------------------------------------------------------------------------------

#_029F0D: SEP #$20

#_029F0F: JSL Sprite_Main

#_029F13: REP #$20

;---------------------------------------------------------------------------------------------------

#_029F15: PLA
#_029F16: STA.b $E6

#_029F18: PLA
#_029F19: STA.b $E0

#_029F1B: PLA
#_029F1C: STA.b $E8

#_029F1E: PLA
#_029F1F: STA.b $E2

;---------------------------------------------------------------------------------------------------

#_029F21: SEP #$20

#_029F23: LDA.w $0200
#_029F26: ASL A
#_029F27: TAX

#_029F28: JSR (.submodules,X)
#_029F2B: JML LinkOAM_Main

;===================================================================================================

Module18_00:
#_029F2F: JSL Underworld_HandleLayerEffect
#_029F33: JSL CallForDuckIndoors
#_029F37: JSL SaveDungeonKeys

#_029F3B: INC.w $0200
#_029F3E: INC.w $02E4

#_029F41: RTS

;===================================================================================================

Module18_01:
#_029F42: JSL Underworld_HandleLayerEffect

#_029F46: LDA.b $11
#_029F48: CMP.b #$0A
#_029F4A: BNE .exit

#_029F4C: LDA.b #$5B
#_029F4E: STA.b $8A

#_029F50: STZ.b $1B

#_029F52: LDA.b #$18
#_029F54: STA.b $10
#_029F56: STZ.b $11

#_029F58: LDA.b #$02
#_029F5A: STA.w $0200

.exit
#_029F5D: RTS

;===================================================================================================

Module18_02:
#_029F5E: JSL Underworld_HandleLayerEffect

#_029F62: DEC.b $13
#_029F64: BNE .exit

#_029F66: JSL EnableForceBlank

#_029F6A: INC.w $0200

#_029F6D: JSL RebuildHUD_ZeroKeys

#_029F71: STZ.b $30
#_029F73: STZ.b $31

.exit
#_029F75: RTS

;===================================================================================================

Module18_03:
#_029F76: LDA.b #$08
#_029F78: STA.w $1AF0
#_029F7B: STZ.w $1AF1

#_029F7E: JSL FluteMenu_LoadSelectedScreen

#_029F82: JSR LoadOWMusicIfNeeded

#_029F85: LDA.b #$09 ; SONG 09
#_029F87: STA.w $012C

#_029F8A: RTS

;===================================================================================================

Module18_04:
#_029F8B: JSL Overworld_LoadOverlayAndMap

#_029F8F: LDA.b #$00
#_029F91: STA.b $B0

#_029F93: RTS

;===================================================================================================

Module18_05:
#_029F94: INC.b $13

#_029F96: LDA.b $13
#_029F98: CMP.b #$0F
#_029F9A: BNE EXIT_029FC0

#_029F9C: STZ.w $0402
#_029F9F: STZ.w $0403

#_029FA2: STZ.w $0FC1

#_029FA5: JSL Sprite_SpawnBatCrashCutscene

#_029FA9: LDA.b #$02
#_029FAB: STA.b $2F

#_029FAD: LDA.b #$09
#_029FAF: STA.w $010C

#_029FB2: STZ.b $1B

#_029FB4: INC.w $0200

#_029FB7: LDA.b #$80
#_029FB9: STA.b $B0

#_029FBB: LDA.b #$FF
#_029FBD: STA.w $040C

;---------------------------------------------------------------------------------------------------

#EXIT_029FC0:
#_029FC0: RTS

;===================================================================================================

Module18_07:
#_029FC1: DEC.b $B0
#_029FC3: BNE EXIT_029FC0

#_029FC5: INC.w $0200

#_029FC8: RTS

;===================================================================================================

Module18_08:
#_029FC9: JSL SpawnLandingDuck

#_029FCD: RTS

;===================================================================================================

pool Module19_TriforceRoom

.submodules
#_029FCE: dw Module19_00_ResetAndInit          ; 0x00
#_029FD0: dw Module19_01_MosaicAndPalette      ; 0x01
#_029FD2: dw Module19_02_LoadMusicAndScreen    ; 0x02
#_029FD4: dw Module19_03_PrepTileSetsPalette   ; 0x03
#_029FD6: dw Module19_04_LoadAndSongAndAdvance ; 0x04
#_029FD8: dw Module19_05_WalkLinkIn            ; 0x05
#_029FDA: dw Module19_06_MosaicFadeIn          ; 0x06
#_029FDC: dw Module19_07_PrepMessage           ; 0x07
#_029FDE: dw Module19_TriforceExpansionControl ; 0x08
#_029FE0: dw Module19_09_TriforceSpeak         ; 0x09
#_029FE2: dw Module19_TriforceExpansionControl ; 0x0A
#_029FE4: dw Module19_0B_ApproachTriforce      ; 0x0B
#_029FE6: dw Module19_0C_HoldTriforce          ; 0x0C
#_029FE8: dw Module19_0D_FadeToWhite           ; 0x0D
#_029FEA: dw Module19_0E_AdvanceToCredits      ; 0x0E

pool off

;---------------------------------------------------------------------------------------------------

Module19_TriforceRoom:
#_029FEC: LDA.b $B0
#_029FEE: ASL A
#_029FEF: TAX

#_029FF0: JSR (.submodules,X)

;---------------------------------------------------------------------------------------------------

#_029FF3: REP #$20

#_029FF5: LDA.b $E0
#_029FF7: STA.w $0120

#_029FFA: LDA.b $E6
#_029FFC: STA.w $0124

#_029FFF: LDA.b $E2
#_02A001: STA.w $011E

#_02A004: LDA.b $E8
#_02A006: STA.w $0122

;---------------------------------------------------------------------------------------------------

#_02A009: SEP #$20

#_02A00B: LDA.b $B0
#_02A00D: CMP.b #$07
#_02A00F: BCC .move_link

#_02A011: CMP.b #$0B
#_02A013: BCC .dont_move_link

.move_link
#_02A015: JSL Link_HandleVelocity
#_02A019: JSL Link_HandleMovingAnimation_FullLongEntry

.dont_move_link
#_02A01D: JML LinkOAM_Main

;===================================================================================================

Module19_00_ResetAndInit:
#_02A021: JSL Link_ResetProperties_A

#_02A025: STZ.b $66

#_02A027: LDA.b #$F1 ; SONG F1 - fade
#_02A029: STA.w $012C

#_02A02C: JMP.w ResetTransitionPropsAndAdvance_ResetInterface

;===================================================================================================

Module19_01_MosaicAndPalette:
#_02A02F: JSR ConditionalMosaicControl

#_02A032: JMP.w ApplyPaletteFilter_bounce

;===================================================================================================

Module19_02_LoadMusicAndScreen:
#_02A035: JSL EnableForceBlank

#_02A039: SEI

#_02A03A: STZ.w NMITIMEN

#_02A03D: LDA.b #$FF ; SONG FF - transfer
#_02A03F: STA.w APUIO0

#_02A042: JSL LoadCreditsSongs

#_02A046: LDA.b #$81
#_02A048: STA.w NMITIMEN

#_02A04B: LDA.b #$89
#_02A04D: STA.b $A0

#_02A04F: LDA.b #$01
#_02A051: STA.b $A1

#_02A053: JSL EraseTilemaps_normal
#_02A057: JSL Palette_RevertTranslucencySwap
#_02A05B: JSR LoadSpecialOverworld

#_02A05E: JSR Overworld_ReloadSubscreenOverlay

#_02A061: INC.b $B0

#_02A063: BRA RefreshTriforceModule

;===================================================================================================

Module19_03_PrepTileSetsPalette:
#_02A065: LDA.b #$24
#_02A067: STA.w $0AA1

#_02A06A: LDA.b #$7D
#_02A06C: STA.w $0AA3

#_02A06F: LDA.b #$51
#_02A071: STA.w $0AA2

#_02A074: JSL InitializeTilesets

#_02A078: LDX.b #$04
#_02A07A: JSR OverworldLoadScreensPaletteSet_Preloaded

#_02A07D: LDA.b #$0E
#_02A07F: JSL OverworldPalettesLoader
#_02A083: JSR SpecialOverworld_CopyPalettesToCache

#_02A086: INC.b $B0

#_02A088: RTS

;===================================================================================================

Module19_04_LoadAndSongAndAdvance:
#_02A089: LDA.b $B0
#_02A08B: PHA

#_02A08C: JSR Module08_02_LoadAndAdvance

#_02A08F: PLA
#_02A090: INC A
#_02A091: STA.b $B0

;---------------------------------------------------------------------------------------------------

#_02A093: LDA.b #$0F
#_02A095: STA.b $13

#_02A097: LDA.b #$1F
#_02A099: STA.l $7EC007

#_02A09D: LDA.b #$00
#_02A09F: STA.l $7EC00B

#_02A0A3: LDA.b #$01
#_02A0A5: STA.b $E1

#_02A0A7: LDA.b #$02
#_02A0A9: STA.b $99

#_02A0AB: LDA.b #$32
#_02A0AD: STA.b $9A

#_02A0AF: LDA.b #$F0
#_02A0B1: STA.l $7EC011

#_02A0B5: LDA.b #$EC
#_02A0B7: STA.b $20

#_02A0B9: LDA.b #$78
#_02A0BB: STA.b $22

#_02A0BD: LDA.b #$02
#_02A0BF: STA.b $EE

#_02A0C1: LDA.b #$20 ; SONG 20
#_02A0C3: STA.w $012C

;===================================================================================================

RefreshTriforceModule:
#_02A0C6: LDA.b #$19
#_02A0C8: STA.b $10

#_02A0CA: STZ.b $11

#_02A0CC: RTS

;===================================================================================================

Module19_05_WalkLinkIn:
#_02A0CD: LDA.b #$08
#_02A0CF: STA.b $67
#_02A0D1: STA.b $26

#_02A0D3: STZ.b $2F

#_02A0D5: LDA.b $20
#_02A0D7: CMP.b #$C0
#_02A0D9: BCS .exit

#_02A0DB: STZ.b $67
#_02A0DD: STZ.b $26
#_02A0DF: STZ.b $2E

#_02A0E1: INC.b $B0

.exit
#_02A0E3: RTS

;===================================================================================================

Module19_06_MosaicFadeIn:
#_02A0E4: LDA.l $7EC007
#_02A0E8: LSR A
#_02A0E9: BCS .continue

#_02A0EB: LDA.l $7EC011
#_02A0EF: BEQ .continue

#_02A0F1: SEC
#_02A0F2: SBC.b #$10
#_02A0F4: STA.l $7EC011

.continue
#_02A0F8: JSR CopyMosaicControl
#_02A0FB: JSL ApplyPaletteFilter

#_02A0FF: RTS

;===================================================================================================

Module19_07_PrepMessage:
#_02A100: JSL TriforceRoom_PrepGFXSlotForPoly

#_02A104: REP #$20

#_02A106: LDA.w #$0173 ; MESSAGE 0173
#_02A109: STA.w $1CF0

#_02A10C: SEP #$20

#_02A10E: JSL Interface_PrepAndDisplayMessage

#_02A112: JSL RenderText

#_02A116: LDA.b #$80
#_02A118: STA.b $C8

#_02A11A: LDA.b #$19
#_02A11C: STA.b $10

#_02A11E: INC.b $B0

#_02A120: RTS

;===================================================================================================

Module19_09_TriforceSpeak:
#_02A121: JSL AdvancePolyhedral
#_02A125: JSL RenderText

#_02A129: LDA.b $11
#_02A12B: BNE .exit

#_02A12D: STZ.w $0200

#_02A130: LDA.b #$19
#_02A132: STA.b $10

#_02A134: INC.b $B0

.exit
#_02A136: RTS

;===================================================================================================

Module19_TriforceExpansionControl:
#_02A137: JSL AdvancePolyhedral

#_02A13B: LDA.b $B0
#_02A13D: CMP.b #$0B
#_02A13F: BNE .exit

#_02A141: LDA.b #$21 ; SONG 21
#_02A143: STA.w $012C

#_02A146: LDA.b #$19
#_02A148: STA.b $10

#_02A14A: STZ.b $67
#_02A14C: STZ.b $26

#_02A14E: INC.b $11

.exit
#_02A150: RTS

;===================================================================================================

Module19_0B_ApproachTriforce:
#_02A151: JSL AdvancePolyhedral
#_02A155: JSL TriforceRoom_LinkApproachTriforce

#_02A159: LDA.b $B0
#_02A15B: CMP.b #$0C
#_02A15D: BNE .exit

#_02A15F: STZ.b $67
#_02A161: STZ.b $26

.exit
#_02A163: RTS

;===================================================================================================

Module19_0C_HoldTriforce:
#_02A164: JSL AdvancePolyhedral

#_02A168: DEC.b $C8
#_02A16A: BNE .exit

#_02A16C: JSL PaletteBlackAndWhiteSomething

#_02A170: INC.b $11

.exit
#_02A172: RTS

;===================================================================================================

Module19_0D_FadeToWhite:
#_02A173: JSL AdvancePolyhedral
#_02A177: JSL PaletteFilter_BlindingWhiteTriforce

#_02A17B: LDA.l $7EC009
#_02A17F: CMP.b #$FF
#_02A181: BNE .exit

#_02A183: INC.b $B0

.exit
#_02A185: RTS

;===================================================================================================

Module19_0E_AdvanceToCredits:
#_02A186: DEC.b $13
#_02A188: BNE .exit

#_02A18A: LDA.b #$1A
#_02A18C: STA.b $10

#_02A18E: STZ.b $11
#_02A190: STZ.b $B0

#_02A192: LDA.b #$FF
#_02A194: STA.w $0128

#_02A197: STZ.w $012A
#_02A19A: STZ.w $1F0C

#_02A19D: LDA.b #$00
#_02A19F: STA.l $7EF3CA

.exit
#_02A1A3: RTS

;===================================================================================================

RoomTagPrizeChecks:
#_02A1A4: db $00 ; Sewers
#_02A1A5: db $00 ; Hyrule Castle
#_02A1A6: db $04 ; Eastern Palace
#_02A1A7: db $02 ; Desert Palace
#_02A1A8: db $00 ; Agahnim's Tower
#_02A1A9: db $10 ; Swamp Palace
#_02A1AA: db $02 ; Palace of Darkness
#_02A1AB: db $01 ; Misery Mire
#_02A1AC: db $40 ; Skull Woods
#_02A1AD: db $04 ; Ice Palace
#_02A1AE: db $01 ; Tower of Hera
#_02A1AF: db $20 ; Thieves' Town
#_02A1B0: db $08 ; Turtle Rock

;===================================================================================================

Mirror_SaveRoomData:
#_02A1B1: LDA.w $040C
#_02A1B4: CMP.b #$FF ; DUNGEON FF
#_02A1B6: BEQ .play_beep

#_02A1B8: LDA.b #$19
#_02A1BA: STA.b $11
#_02A1BC: STZ.b $B0

#_02A1BE: LDA.b #$33 ; SFX2.33
#_02A1C0: STA.w $012E

#_02A1C3: JSL Underworld_FlagRoomData_Quadrants

;===================================================================================================

#SaveDungeonKeys:
#_02A1C7: LDA.w $040C
#_02A1CA: CMP.b #$FF ; DUNGEON FF
#_02A1CC: BEQ .exit

#_02A1CE: CMP.b #$02 ; DUNGEON 02
#_02A1D0: BNE .not_castle

#_02A1D2: LDA.b #$00 ; DUNGEON 00

.not_castle
#_02A1D4: LSR A
#_02A1D5: TAX

#_02A1D6: LDA.l $7EF36F
#_02A1DA: STA.l $7EF37C,X

.exit
#_02A1DE: RTL

;---------------------------------------------------------------------------------------------------

.play_beep
#_02A1DF: LDA.b #$3C ; SFX2.3C
#_02A1E1: STA.w $012E

#_02A1E4: RTL

;===================================================================================================

RoomEffectFixedColors:
#_02A1E5: db $1F, $08, $04, $00

;===================================================================================================

Underworld_HandleTranslucencyAndPalettes:
#_02A1E9: LDA.w $0ABD
#_02A1EC: BEQ .dont_undo_translucency

#_02A1EE: JSL Palette_RevertTranslucencySwap

.dont_undo_translucency
#_02A1F2: LDA.b #$02
#_02A1F4: STA.b $99

#_02A1F6: LDA.b #$B3
#_02A1F8: STA.b $9A

#_02A1FA: LDX.w $045A

#_02A1FD: LDA.l $7EC005
#_02A201: BNE .lights_out

;---------------------------------------------------------------------------------------------------

#_02A203: LDA.b #$20
#_02A205: LDX.b #$03
#_02A207: LDY.w $0414
#_02A20A: BEQ .no_translucency

#_02A20C: LDA.b #$32
#_02A20E: CPY.b #$07
#_02A210: BEQ .no_translucency

#_02A212: LDA.b #$62
#_02A214: CPY.b #$04
#_02A216: BEQ .no_translucency

#_02A218: LDA.b #$20
#_02A21A: CPY.b #$02
#_02A21C: BNE .no_translucency

;---------------------------------------------------------------------------------------------------

#_02A21E: PHX

#_02A21F: JSL Palette_AssertTranslucencySwap

#_02A223: PLX

#_02A224: LDA.b $A0
#_02A226: CMP.b #$0D ; ROOM 000D
#_02A228: BNE .not_aga_2

#_02A22A: REP #$20

#_02A22C: LDA.w #$0000
#_02A22F: STA.l $7EC019
#_02A233: STA.l $7EC01B
#_02A237: STA.l $7EC01D
#_02A23B: STA.l $7EC01F
#_02A23F: STA.l $7EC021
#_02A243: STA.l $7EC023

#_02A247: SEP #$20

#_02A249: JSL Palettes_LoadAgahnim

.not_aga_2
#_02A24D: LDA.b #$70

;---------------------------------------------------------------------------------------------------

.no_translucency
#_02A24F: STA.b $9A

.lights_out
#_02A251: LDA.l RoomEffectFixedColors,X
#_02A255: STA.l $7EC017

#_02A259: LDA.b #$1F
#_02A25B: STA.l $7EC007

#_02A25F: LDA.b #$00
#_02A261: STA.l $7EC00B

#_02A265: LDA.b #$02
#_02A267: STA.l $7EC009

#_02A26B: STZ.w $0AA9

#_02A26E: JSL Palettes_Load_UnderworldSet
#_02A272: JSL Palettes_Load_SpritePal0Left
#_02A276: JSL Palettes_Load_SpriteAux1
#_02A27A: JSL Palettes_Load_SpriteAux2

#_02A27E: INC.b $B0

#_02A280: RTS

;===================================================================================================

UnusedInterfacePaletteRecovery:
#_02A281: JSL ApplyPaletteFilter

#_02A285: LDA.l $7EC007
#_02A289: BNE .exit

#_02A28B: LDA.b #$00
#_02A28D: STA.l $7EC005

#_02A291: LDA.w $010C
#_02A294: STA.b $10

#_02A296: STZ.b $B0
#_02A298: STZ.b $11

.exit
#_02A29A: RTS

;===================================================================================================

PaletteFilter_bounce:
#_02A29B: JSL PaletteFilter

#_02A29F: RTS

;===================================================================================================

ApplyPaletteFilter_bounce:
#_02A2A0: JSL ApplyPaletteFilter

#_02A2A4: RTS

;===================================================================================================

ResetTransitionPropsAndAdvance_ResetInterface_long:
#_02A2A5: JSR ResetTransitionPropsAndAdvance_ResetInterface

#_02A2A8: RTL

;===================================================================================================

Underworld_HandleTranslucencyAndPalettes_long:
#_02A2A9: JSR Underworld_HandleTranslucencyAndPalettes

#_02A2AC: RTL

;===================================================================================================

UnusedInterfacePaletteRecovery_long:
#_02A2AD: JSR UnusedInterfacePaletteRecovery

#_02A2B0: RTL

;===================================================================================================

UNREACHABLE_02A2B1:
#_02A2B1: LDA.b $A0
#_02A2B3: AND.b #$F0
#_02A2B5: STA.b $00

#_02A2B7: LDA.b $21
#_02A2B9: AND.b #$0F
#_02A2BB: ORA.b $00
#_02A2BD: STA.b $21

#_02A2BF: LDA.b $E9
#_02A2C1: AND.b #$0F
#_02A2C3: ORA.b $00
#_02A2C5: STA.b $E9

#_02A2C7: LDA.w $0605
#_02A2CA: AND.b #$0F
#_02A2CC: ORA.b $00
#_02A2CE: STA.w $0605

#_02A2D1: LDA.w $0607
#_02A2D4: AND.b #$0F
#_02A2D6: ORA.b $00
#_02A2D8: STA.w $0607

#_02A2DB: LDA.w $0601
#_02A2DE: AND.b #$0F
#_02A2E0: ORA.b $00
#_02A2E2: STA.w $0601

#_02A2E5: LDA.w $0603
#_02A2E8: AND.b #$0F
#_02A2EA: ORA.b $00
#_02A2EC: STA.w $0603

#_02A2EF: RTS

;===================================================================================================

Underworld_AdjustCameraArbitrary:
#_02A2F0: LDA.b $A2
#_02A2F2: AND.b #$0F
#_02A2F4: STA.b $00

#_02A2F6: LDA.b $A0
#_02A2F8: AND.b #$0F
#_02A2FA: SEC
#_02A2FB: SBC.b $00

#_02A2FD: ASL A
#_02A2FE: STA.b $00

#_02A300: LDA.b $23
#_02A302: CLC
#_02A303: ADC.b $00
#_02A305: STA.b $23

#_02A307: LDA.b $E3
#_02A309: CLC
#_02A30A: ADC.b $00
#_02A30C: STA.b $E3

;---------------------------------------------------------------------------------------------------

#_02A30E: LDA.w $060D
#_02A311: CLC
#_02A312: ADC.b $00
#_02A314: STA.w $060D

#_02A317: LDA.w $060F
#_02A31A: CLC
#_02A31B: ADC.b $00
#_02A31D: STA.w $060F

#_02A320: LDA.w $0609
#_02A323: CLC
#_02A324: ADC.b $00
#_02A326: STA.w $0609

#_02A329: LDA.w $060B
#_02A32C: CLC
#_02A32D: ADC.b $00
#_02A32F: STA.w $060B

;---------------------------------------------------------------------------------------------------

#_02A332: LDA.b $A2
#_02A334: AND.b #$F0
#_02A336: LSR A
#_02A337: LSR A
#_02A338: LSR A
#_02A339: STA.b $00

#_02A33B: LDA.b $A0
#_02A33D: AND.b #$F0
#_02A33F: LSR A
#_02A340: LSR A
#_02A341: LSR A
#_02A342: STA.b $01

#_02A344: SEC
#_02A345: SBC.b $00
#_02A347: STA.b $00

;---------------------------------------------------------------------------------------------------

#_02A349: LDA.b $21
#_02A34B: CLC
#_02A34C: ADC.b $00
#_02A34E: STA.b $21

#_02A350: LDA.b $E9
#_02A352: CLC
#_02A353: ADC.b $00
#_02A355: STA.b $E9

#_02A357: LDA.w $0605
#_02A35A: CLC
#_02A35B: ADC.b $00
#_02A35D: STA.w $0605

#_02A360: LDA.w $0607
#_02A363: CLC
#_02A364: ADC.b $00
#_02A366: STA.w $0607

#_02A369: LDA.w $0601
#_02A36C: CLC
#_02A36D: ADC.b $00
#_02A36F: STA.w $0601

#_02A372: LDA.w $0603
#_02A375: CLC
#_02A376: ADC.b $00
#_02A378: STA.w $0603

#_02A37B: RTS

;===================================================================================================

Underworld_AdjustForTeleportDoors:
#_02A37C: STY.b $00

#_02A37E: STA.w $048E
#_02A381: STA.b $A2

#_02A383: LDA.b $A2
#_02A385: AND.b #$0F
#_02A387: ASL A

#_02A388: SEC
#_02A389: SBC.b $23

#_02A38B: CLC
#_02A38C: ADC.b $00
#_02A38E: STA.b $00

;---------------------------------------------------------------------------------------------------

#_02A390: LDA.b $23
#_02A392: CLC
#_02A393: ADC.b $00
#_02A395: STA.b $23

#_02A397: LDA.b $E3
#_02A399: CLC
#_02A39A: ADC.b $00
#_02A39C: STA.b $E3

#_02A39E: LDA.w $060D
#_02A3A1: CLC
#_02A3A2: ADC.b $00
#_02A3A4: STA.w $060D

#_02A3A7: LDA.w $060F
#_02A3AA: CLC
#_02A3AB: ADC.b $00
#_02A3AD: STA.w $060F

#_02A3B0: LDA.w $0609
#_02A3B3: CLC
#_02A3B4: ADC.b $00
#_02A3B6: STA.w $0609

#_02A3B9: LDA.w $060B
#_02A3BC: CLC
#_02A3BD: ADC.b $00
#_02A3BF: STA.w $060B

;---------------------------------------------------------------------------------------------------

#_02A3C2: LDA.b $A2
#_02A3C4: AND.b #$F0

#_02A3C6: LSR A
#_02A3C7: LSR A
#_02A3C8: LSR A

#_02A3C9: SEC
#_02A3CA: SBC.b $21
#_02A3CC: STA.b $00

;---------------------------------------------------------------------------------------------------

#_02A3CE: LDA.b $21
#_02A3D0: CLC
#_02A3D1: ADC.b $00
#_02A3D3: STA.b $21

#_02A3D5: LDA.b $E9
#_02A3D7: CLC
#_02A3D8: ADC.b $00
#_02A3DA: STA.b $E9

#_02A3DC: LDA.w $0605
#_02A3DF: CLC
#_02A3E0: ADC.b $00
#_02A3E2: STA.w $0605

#_02A3E5: LDA.w $0607
#_02A3E8: CLC
#_02A3E9: ADC.b $00
#_02A3EB: STA.w $0607

#_02A3EE: LDA.w $0601
#_02A3F1: CLC
#_02A3F2: ADC.b $00
#_02A3F4: STA.w $0601

#_02A3F7: LDA.w $0603
#_02A3FA: CLC
#_02A3FB: ADC.b $00
#_02A3FD: STA.w $0603

;---------------------------------------------------------------------------------------------------

#_02A400: LDY.b #$00

.next
#_02A402: LDA.b $21
#_02A404: STA.w $1A14,Y

#_02A407: INY
#_02A408: CPY.b #$14
#_02A40A: BNE .next

#_02A40C: RTS

;===================================================================================================

pool Module09_Overworld

.submodules
#_02A40D: dw Module09_00_PlayerControl              ; 0x00
#_02A40F: dw Module09_LoadAuxGFX                    ; 0x01
#_02A411: dw Module09_TriggerTilemapUpdate          ; 0x02
#_02A413: dw Module09_LoadNewMapAndGFX              ; 0x03
#_02A415: dw Module09_LoadNewSprites                ; 0x04
#_02A417: dw Overworld_StartScrollTransition        ; 0x05
#_02A419: dw Overworld_RunScrollTransition          ; 0x06
#_02A41B: dw Overworld_EaseOffScrollTransition      ; 0x07
#_02A41D: dw Overworld_FinalizeEntryOntoScreen      ; 0x08
#_02A41F: dw Module09_09_OpenBigDoorFromExiting     ; 0x09
#_02A421: dw Module09_0A_WalkFromExiting_FacingDown ; 0x0A
#_02A423: dw Module09_0B_WalkFromExiting_FacingUp   ; 0x0B
#_02A425: dw Module09_0C_OpenBigDoor                ; 0x0C
#_02A427: dw Overworld_StartMosaicTransition        ; 0x0D
#_02A429: dw Overworld_LoadSubscreenAndSilenceSFX1  ; 0x0E
#_02A42B: dw Module09_LoadAuxGFX                    ; 0x0F
#_02A42D: dw Module09_TriggerTilemapUpdate          ; 0x10
#_02A42F: dw Module09_LoadNewMapAndGFX              ; 0x11
#_02A431: dw Module09_LoadNewSprites                ; 0x12
#_02A433: dw Overworld_StartScrollTransition        ; 0x13
#_02A435: dw Overworld_RunScrollTransition          ; 0x14
#_02A437: dw Overworld_EaseOffScrollTransition      ; 0x15
#_02A439: dw Module09_FadeBackInFromMosaic          ; 0x16
#_02A43B: dw Overworld_StartMosaicTransition        ; 0x17
#_02A43D: dw Module09_18                            ; 0x18
#_02A43F: dw Module09_19                            ; 0x19
#_02A441: dw Module09_LoadAuxGFX                    ; 0x1A
#_02A443: dw Module09_TriggerTilemapUpdate          ; 0x1B
#_02A445: dw Module09_1C                            ; 0x1C
#_02A447: dw Module09_1D                            ; 0x1D
#_02A449: dw Module09_1E                            ; 0x1E
#_02A44B: dw Module09_1F                            ; 0x1F
#_02A44D: dw Overworld_ReloadSubscreenOverlay       ; 0x20
#_02A44F: dw Module09_21                            ; 0x21
#_02A451: dw Module09_22                            ; 0x22
#_02A453: dw Module09_MirrorWarp                    ; 0x23
#_02A455: dw Overworld_StartMosaicTransition        ; 0x24
#_02A457: dw Module09_25                            ; 0x25
#_02A459: dw Module09_LoadAuxGFX                    ; 0x26
#_02A45B: dw Module09_TriggerTilemapUpdate          ; 0x27
#_02A45D: dw Overworld_LoadAndBuildScreen           ; 0x28
#_02A45F: dw Module09_FadeBackInFromMosaic          ; 0x29
#_02A461: dw Module09_2A_RecoverFromDrowning        ; 0x2A
#_02A463: dw Module09_2B                            ; 0x2B
#_02A465: dw Module09_MirrorWarp                    ; 0x2C
#_02A467: dw Module09_2D_WaitForBird                ; 0x2D
#_02A469: dw Module09_2E_Whirlpool                  ; 0x2E
#_02A46B: dw Module09_2F                            ; 0x2F

pool off

;===================================================================================================

OWOverlayHShift:
#_02A46D: db  1,  0,  1,  0

OWOverlayVShift:
#_02A471: db  0, 17,  0, 17

;===================================================================================================

Module09_Overworld:
#Module0B_OverworldSpecial:
#_02A475: SEP #$30

#_02A477: LDA.b $11
#_02A479: ASL A
#_02A47A: TAX

#_02A47B: JSR (.submodules,X)

;---------------------------------------------------------------------------------------------------

#_02A47E: REP #$21

#_02A480: LDA.b $E2
#_02A482: PHA
#_02A483: ADC.w $011A
#_02A486: STA.b $E2
#_02A488: STA.w $011E

#_02A48B: LDA.b $E8
#_02A48D: PHA
#_02A48E: CLC
#_02A48F: ADC.w $011C
#_02A492: STA.b $E8
#_02A494: STA.w $0122

#_02A497: LDA.b $E0
#_02A499: PHA
#_02A49A: CLC
#_02A49B: ADC.w $011A
#_02A49E: STA.b $E0
#_02A4A0: STA.w $0120

#_02A4A3: LDA.b $E6
#_02A4A5: PHA
#_02A4A6: CLC
#_02A4A7: ADC.w $011C
#_02A4AA: STA.b $E6
#_02A4AC: STA.w $0124

;---------------------------------------------------------------------------------------------------

#_02A4AF: SEP #$20

#_02A4B1: JSL Sprite_Main

;---------------------------------------------------------------------------------------------------

#_02A4B5: REP #$20

#_02A4B7: PLA
#_02A4B8: STA.b $E6

#_02A4BA: PLA
#_02A4BB: STA.b $E0

#_02A4BD: PLA
#_02A4BE: STA.b $E8

#_02A4C0: PLA
#_02A4C1: STA.b $E2

;---------------------------------------------------------------------------------------------------

#_02A4C3: SEP #$20

#_02A4C5: JSL LinkOAM_Main
#_02A4C9: JSL RefillLogic_long

;===================================================================================================

OverworldOverlay_HandleRain:
#_02A4CD: LDA.b $8A
#_02A4CF: CMP.b #$70 ; OW 70
#_02A4D1: BEQ .mire_screen

#_02A4D3: LDA.l $7EF3C5
#_02A4D7: CMP.b #$02
#_02A4D9: BCS .exit

;---------------------------------------------------------------------------------------------------

.mire_screen
#_02A4DB: LDA.l $7EF2F0
#_02A4DF: AND.b #$20
#_02A4E1: BNE .exit

#_02A4E3: LDA.b $1A
#_02A4E5: CMP.b #$03
#_02A4E7: BEQ .flash

#_02A4E9: CMP.b #$05
#_02A4EB: BEQ .unflash

#_02A4ED: CMP.b #$24
#_02A4EF: BEQ .thunder

#_02A4F1: CMP.b #$2C
#_02A4F3: BEQ .unflash

#_02A4F5: CMP.b #$58
#_02A4F7: BEQ .flash

#_02A4F9: CMP.b #$5A
#_02A4FB: BNE .no_effect

.unflash
#_02A4FD: LDA.b #$72
#_02A4FF: BRA .set_color_math

.thunder
#_02A501: LDX.b #$36 ; SFX2.36
#_02A503: STX.w $012E

.flash
#_02A506: LDA.b #$32

.set_color_math
#_02A508: STA.b $9A

;---------------------------------------------------------------------------------------------------

.no_effect
#_02A50A: LDA.b $1A
#_02A50C: AND.b #$03
#_02A50E: BNE .exit

#_02A510: LDA.w $0494
#_02A513: INC A
#_02A514: AND.b #$03
#_02A516: STA.w $0494

#_02A519: TAX

#_02A51A: LDA.b $E1
#_02A51C: CLC
#_02A51D: ADC.l OWOverlayHShift,X
#_02A521: STA.b $E1

#_02A523: LDA.b $E7
#_02A525: CLC
#_02A526: ADC.l OWOverlayVShift,X
#_02A52A: STA.b $E7

.exit
#_02A52C: RTL

;===================================================================================================

UNREACHABLE_02A52D:
#_02A52D: db $08, $09, $02, $04, $02, $02, $02, $02
#_02A535: db $02, $02, $02, $02, $02, $02, $02

;===================================================================================================

Module09_00_PlayerControl:
#_02A53C: LDA.w $0112
#_02A53F: ORA.w $02E4
#_02A542: ORA.w $0FFC
#_02A545: ORA.w $04C6
#_02A548: BEQ .check_for_start

#_02A54A: JMP.w .continue

;---------------------------------------------------------------------------------------------------

.check_for_start
#_02A54D: LDA.b $F4
#_02A54F: AND.b #$10
#_02A551: BEQ .check_for_X

#_02A553: STZ.w $0200

#_02A556: LDA.b #$01
#_02A558: BRA .set_new_module

;---------------------------------------------------------------------------------------------------

.check_for_X
#_02A55A: LDA.b $F6
#_02A55C: AND.b #$40
#_02A55E: BEQ .check_for_select

#_02A560: STZ.w $0200

#_02A563: LDA.b #$07

;---------------------------------------------------------------------------------------------------

.set_new_module
#_02A565: STA.b $11

#_02A567: LDA.b $10
#_02A569: STA.w $010C

#_02A56C: LDA.b #$0E
#_02A56E: STA.b $10

#_02A570: RTS

;---------------------------------------------------------------------------------------------------

.check_for_select
#_02A571: LDA.b $F0
#_02A573: AND.b #$20
#_02A575: BEQ .continue

;---------------------------------------------------------------------------------------------------

#_02A577: LDA.w $1CE8
#_02A57A: STA.w $1CF4

#_02A57D: REP #$20

#_02A57F: LDA.w #$0186 ; MESSAGE 0186
#_02A582: STA.w $1CF0

#_02A585: SEP #$20

#_02A587: LDA.b $10
#_02A589: PHA

#_02A58A: JSL Interface_PrepAndDisplayMessage

#_02A58E: PLA
#_02A58F: STA.b $10

#_02A591: STZ.b $B0

#_02A593: LDA.b #$0B
#_02A595: BRA .set_new_module

;---------------------------------------------------------------------------------------------------

.continue
#_02A597: LDA.w $04C6
#_02A59A: BEQ .not_entrance_cutscene

#_02A59C: JSL Overworld_AnimateEntrance

;---------------------------------------------------------------------------------------------------

.not_entrance_cutscene
#_02A5A0: SEP #$30

#_02A5A2: JSL Link_Main

#_02A5A6: LDA.w $04B4
#_02A5A9: CMP.b #$FF
#_02A5AB: BEQ .no_countdown

#_02A5AD: JSL HUD_HandleBigTimer

;---------------------------------------------------------------------------------------------------

.no_countdown
#_02A5B1: REP #$20

#_02A5B3: LDA.b $20
#_02A5B5: AND.w #$1E00
#_02A5B8: ASL A
#_02A5B9: ASL A
#_02A5BA: ASL A
#_02A5BB: STA.w $0700

#_02A5BE: LDA.b $22
#_02A5C0: AND.w #$1E00
#_02A5C3: ORA.w $0700

#_02A5C6: XBA
#_02A5C7: STA.w $0700

;---------------------------------------------------------------------------------------------------

#_02A5CA: SEP #$20

#_02A5CC: JSL Graphics_LoadChrHalfSlot
#_02A5D0: JSR Overworld_OperateCameraScroll

#_02A5D3: LDA.b $10
#_02A5D5: CMP.b #$0B
#_02A5D7: BEQ .special_overworld

;---------------------------------------------------------------------------------------------------

#_02A5D9: JSL Overworld_UseEntrance
#_02A5DD: JSL FlashGanonTowerPalette
#_02A5E1: JSR OverworldHandleTransitions

#_02A5E4: BRA .exit

;---------------------------------------------------------------------------------------------------

.special_overworld
#_02A5E6: JSR ScrollAndCheckForSOWExit

.exit
#_02A5E9: SEP #$20

#_02A5EB: RTS

;===================================================================================================

Overworld_ActualScreenID:
#_02A5EC: db $00, $00, $02, $03, $03, $05, $05, $07
#_02A5F4: db $00, $00, $0A, $03, $03, $05, $05, $0F
#_02A5FC: db $10, $11, $12, $13, $14, $15, $16, $17
#_02A604: db $18, $18, $1A, $1B, $1B, $1D, $1E, $1E
#_02A60C: db $18, $18, $22, $1B, $1B, $25, $1E, $1E
#_02A614: db $28, $29, $2A, $2B, $2C, $2D, $2E, $2F
#_02A61C: db $30, $30, $32, $33, $34, $35, $35, $37
#_02A624: db $30, $30, $3A, $3B, $3C, $35, $35, $3F

;===================================================================================================

OverworldScreenTilemapChange:
#_02A62C: dw $0F80
#_02A62E: dw $0F80
#_02A630: dw $003F
#_02A632: dw $003F

;===================================================================================================

OverworldScreenTilemapChangeByScreen:
#_02A634: dw $0060, $0060, $0060, $0060
#_02A63C: dw $0060, $0060, $0060, $0060
#_02A644: dw $0060, $0060, $0060, $1060
#_02A64C: dw $1060, $1060, $1060, $0060
#_02A654: dw $0060, $0060, $0060, $0060
#_02A65C: dw $0060, $0060, $0060, $0060
#_02A664: dw $0060, $0060, $0060, $0060
#_02A66C: dw $0060, $0060, $0060, $0060
#_02A674: dw $0060, $0060, $0060, $1060
#_02A67C: dw $1060, $0060, $1060, $1060
#_02A684: dw $0060, $0060, $0060, $0060
#_02A68C: dw $0060, $0060, $0060, $0060
#_02A694: dw $0060, $0060, $0060, $0060
#_02A69C: dw $0060, $0060, $0060, $0060
#_02A6A4: dw $0060, $0060, $0060, $0060
#_02A6AC: dw $0060, $1060, $1060, $0060
#_02A6B4: dw $0080, $0080, $0040, $0080
#_02A6BC: dw $0080, $0080, $0080, $0040
#_02A6C4: dw $1080, $1080, $0040, $1080
#_02A6CC: dw $1080, $1080, $1080, $0040
#_02A6D4: dw $0040, $0040, $0040, $0040
#_02A6DC: dw $0040, $0040, $0040, $0040
#_02A6E4: dw $0080, $0080, $0040, $0080
#_02A6EC: dw $0080, $0040, $0080, $0080
#_02A6F4: dw $1080, $1080, $0040, $1080
#_02A6FC: dw $1080, $0040, $1080, $1080
#_02A704: dw $0040, $0040, $0040, $0040
#_02A70C: dw $0040, $0040, $0040, $0040
#_02A714: dw $0080, $0080, $0040, $0040
#_02A71C: dw $0040, $0080, $0080, $0040
#_02A724: dw $1080, $1080, $0040, $0040
#_02A72C: dw $0040, $1080, $1080, $0040
#_02A734: dw $1800, $1840, $1800, $1800
#_02A73C: dw $1840, $1800, $1840, $1800
#_02A744: dw $1800, $1840, $1800, $1800
#_02A74C: dw $1840, $1800, $1840, $1800
#_02A754: dw $1800, $1800, $1800, $1800
#_02A75C: dw $1800, $1800, $1800, $1800
#_02A764: dw $1800, $1840, $1800, $1800
#_02A76C: dw $1840, $1800, $1800, $1840
#_02A774: dw $1800, $1840, $1800, $1800
#_02A77C: dw $1840, $1800, $1800, $1840
#_02A784: dw $1800, $1800, $1800, $1800
#_02A78C: dw $1800, $1800, $1800, $1800
#_02A794: dw $1800, $1840, $1800, $1800
#_02A79C: dw $1800, $1800, $1840, $1800
#_02A7A4: dw $1800, $1840, $1800, $1800
#_02A7AC: dw $1800, $1800, $1840, $1800
#_02A7B4: dw $2000, $2040, $1000, $2000
#_02A7BC: dw $2040, $2000, $2040, $1000
#_02A7C4: dw $2000, $2040, $1000, $2000
#_02A7CC: dw $2040, $2000, $2040, $1000
#_02A7D4: dw $1000, $1000, $1000, $1000
#_02A7DC: dw $1000, $1000, $1000, $1000
#_02A7E4: dw $2000, $2040, $1000, $2000
#_02A7EC: dw $2040, $1000, $2000, $2040
#_02A7F4: dw $2000, $2040, $1000, $2000
#_02A7FC: dw $2040, $1000, $2000, $2040
#_02A804: dw $1000, $1000, $1000, $1000
#_02A80C: dw $1000, $1000, $1000, $1000
#_02A814: dw $2000, $2040, $1000, $1000
#_02A81C: dw $1000, $2000, $2040, $1000
#_02A824: dw $2000, $2040, $1000, $1000
#_02A82C: dw $1000, $2000, $2040, $1000

;===================================================================================================

OverworldScreenIDChange:
#_02A834: dw $0002 ; east
#_02A836: dw $FFFE ; west
#_02A838: dw $0010 ; south
#_02A83A: dw $FFF0 ; north

;===================================================================================================

OverworldMixedCoordsChange:
#_02A83C: dw $FFF0
#_02A83E: dw $0010
#_02A840: dw $FFFE
#_02A842: dw $0002

;===================================================================================================

OverworldScreenSizeFlag:
#_02A844: db $20, $20, $00, $20, $20, $20, $20, $00
#_02A84C: db $20, $20, $00, $20, $20, $20, $20, $00
#_02A854: db $00, $00, $00, $00, $00, $00, $00, $00
#_02A85C: db $20, $20, $00, $20, $20, $00, $20, $20
#_02A864: db $20, $20, $00, $20, $20, $00, $20, $20
#_02A86C: db $00, $00, $00, $00, $00, $00, $00, $00
#_02A874: db $20, $20, $00, $00, $00, $20, $20, $00
#_02A87C: db $20, $20, $00, $00, $00, $20, $20, $00

;===================================================================================================

OverworldScreenSizeHighByte:
#_02A884: db $03, $03, $01, $03, $03, $03, $03, $01
#_02A88C: db $03, $03, $01, $03, $03, $03, $03, $01
#_02A894: db $01, $01, $01, $01, $01, $01, $01, $01
#_02A89C: db $03, $03, $01, $03, $03, $01, $03, $03
#_02A8A4: db $03, $03, $01, $03, $03, $01, $03, $03
#_02A8AC: db $01, $01, $01, $01, $01, $01, $01, $01
#_02A8B4: db $03, $03, $01, $01, $01, $03, $03, $01
#_02A8BC: db $03, $03, $01, $01, $01, $03, $03, $01

;===================================================================================================

OverworldTransitionPositionY:
#_02A8C4: dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
#_02A8D4: dw $0000, $0000, $0200, $0000, $0000, $0000, $0000, $0200
#_02A8E4: dw $0400, $0400, $0400, $0400, $0400, $0400, $0400, $0400
#_02A8F4: dw $0600, $0600, $0600, $0600, $0600, $0600, $0600, $0600
#_02A904: dw $0600, $0600, $0800, $0600, $0600, $0800, $0600, $0600
#_02A914: dw $0A00, $0A00, $0A00, $0A00, $0A00, $0A00, $0A00, $0A00
#_02A924: dw $0C00, $0C00, $0C00, $0C00, $0C00, $0C00, $0C00, $0C00
#_02A934: dw $0C00, $0C00, $0E00, $0E00, $0E00, $0C00, $0C00, $0E00

;===================================================================================================

OverworldTransitionPositionX:
#_02A944: dw $0000, $0000, $0400, $0600, $0600, $0A00, $0A00, $0E00
#_02A954: dw $0000, $0000, $0400, $0600, $0600, $0A00, $0A00, $0E00
#_02A964: dw $0000, $0200, $0400, $0600, $0800, $0A00, $0C00, $0E00
#_02A974: dw $0000, $0000, $0400, $0600, $0600, $0A00, $0C00, $0C00
#_02A984: dw $0000, $0000, $0400, $0600, $0600, $0A00, $0C00, $0C00
#_02A994: dw $0000, $0200, $0400, $0600, $0800, $0A00, $0C00, $0E00
#_02A9A4: dw $0000, $0000, $0400, $0600, $0800, $0A00, $0A00, $0E00
#_02A9B4: dw $0000, $0000, $0400, $0600, $0800, $0A00, $0A00, $0E00

;===================================================================================================

OverworldHandleTransitions:
#_02A9C4: LDA.w $0416
#_02A9C7: BEQ .not_scrolling

#_02A9C9: JSR OverworldHandleMapScroll

.not_scrolling
#_02A9CC: REP #$20

#_02A9CE: LDA.b $30
#_02A9D0: AND.w #$00FF
#_02A9D3: BEQ .not_moving_vertically

#_02A9D5: LDA.b $67
#_02A9D7: AND.w #$000C
#_02A9DA: STA.b $00

#_02A9DC: LDX.w $0700

#_02A9DF: LDA.b $20
#_02A9E1: SEC
#_02A9E2: SBC.l OverworldTransitionPositionY,X

#_02A9E6: LDY.b #$06
#_02A9E8: LDX.b #$08
#_02A9EA: CMP.w #$0004
#_02A9ED: BCC .continue_check

#_02A9EF: LDY.b #$04
#_02A9F1: LDX.b #$04
#_02A9F3: CMP.w $0716
#_02A9F6: BCS .continue_check

;---------------------------------------------------------------------------------------------------

.not_moving_vertically
#_02A9F8: LDA.b $31
#_02A9FA: AND.w #$00FF
#_02A9FD: BEQ .check_special_triggers

#_02A9FF: LDA.w $0716
#_02AA02: CLC
#_02AA03: ADC.w #$0004
#_02AA06: STA.b $02

#_02AA08: LDA.b $67
#_02AA0A: AND.w #$0003
#_02AA0D: STA.b $00

#_02AA0F: LDX.w $0700

#_02AA12: LDA.b $22
#_02AA14: SEC
#_02AA15: SBC.l OverworldTransitionPositionX,X

#_02AA19: LDY.b #$02
#_02AA1B: LDX.b #$02
#_02AA1D: CMP.w #$0006
#_02AA20: BCC .continue_check

#_02AA22: LDY.b #$00
#_02AA24: LDX.b #$01

#_02AA26: CMP.b $02
#_02AA28: BCC .check_special_triggers

;---------------------------------------------------------------------------------------------------

.continue_check
#_02AA2A: CPX.b $00
#_02AA2C: BEQ .some_transition_was_hit

.check_special_triggers
#_02AA2E: JSL Overworld_CheckForSpecialOverworldTrigger

#_02AA32: RTS

;---------------------------------------------------------------------------------------------------

.some_transition_was_hit
#_02AA33: SEP #$20

#_02AA35: JSL Link_CheckForEdgeScreenTransition
#_02AA39: BCS .check_special_triggers

#_02AA3B: STY.b $02
#_02AA3D: STZ.b $03

#_02AA3F: JSR DeleteCertainAncillaeStopDashing

#_02AA42: REP #$31

#_02AA44: LDX.b $02

#_02AA46: LDA.b $84
#_02AA48: AND.l OverworldScreenTilemapChange,X
#_02AA4C: STA.b $84

#_02AA4E: LDA.w $0700
#_02AA51: CLC
#_02AA52: ADC.l OverworldScreenIDChange,X
#_02AA56: PHA

#_02AA57: STA.b $04

#_02AA59: TXA

#_02AA5A: ASL A
#_02AA5B: ASL A
#_02AA5C: ASL A
#_02AA5D: ASL A
#_02AA5E: ASL A
#_02AA5F: ASL A

#_02AA60: ORA.b $04
#_02AA62: TAX

#_02AA63: LDA.b $84
#_02AA65: CLC
#_02AA66: ADC.l OverworldScreenTilemapChangeByScreen,X
#_02AA6A: STA.b $84

;---------------------------------------------------------------------------------------------------

#_02AA6C: PLA
#_02AA6D: LSR A
#_02AA6E: TAX

#_02AA6F: SEP #$30

#_02AA71: LDA.b $8A
#_02AA73: PHA

#_02AA74: CMP.b #$2A ; OW 2A
#_02AA76: BNE .not_haunted_grove

#_02AA78: LDA.b #$80 ; SFX1.80 - fade
#_02AA7A: STA.w $012D

.not_haunted_grove
#_02AA7D: LDA.l Overworld_ActualScreenID,X
#_02AA81: ORA.l $7EF3CA
#_02AA85: STA.b $8A
#_02AA87: STA.w $040A

#_02AA8A: TAX
#_02AA8B: LDA.l $7EF3CA
#_02AA8F: BEQ .light_world

#_02AA91: LDA.l $7EF357
#_02AA95: BEQ .dont_restore_dw_music

.light_world
#_02AA97: LDA.l $7F5B00,X
#_02AA9B: LSR A
#_02AA9C: LSR A
#_02AA9D: LSR A
#_02AA9E: LSR A
#_02AA9F: BNE .has_ambient_sfx

#_02AAA1: LDA.b #$05
#_02AAA3: STA.w $012D

.has_ambient_sfx
#_02AAA6: LDA.l $7F5B00,X
#_02AAAA: AND.b #$0F
#_02AAAC: CMP.w $0130
#_02AAAF: BEQ .dont_restore_dw_music

#_02AAB1: LDA.b #$F1 ; SONG F1 - fade
#_02AAB3: STA.w $012C

;---------------------------------------------------------------------------------------------------

.dont_restore_dw_music
#_02AAB6: JSR Overworld_LoadGFXAndScreenSize

#_02AAB9: LDA.b #$01
#_02AABB: STA.b $11

#_02AABD: LDA.b $00
#_02AABF: STA.w $0410
#_02AAC2: STA.w $0416

#_02AAC5: LDX.b #$04

.shift
#_02AAC7: DEX
#_02AAC8: LSR A
#_02AAC9: BCC .shift

#_02AACB: STX.w $0418
#_02AACE: STX.w $069C

#_02AAD1: STZ.w $0696
#_02AAD4: STZ.w $0698
#_02AAD7: STZ.w $0126

#_02AADA: PLA
#_02AADB: AND.b #$3F ; OW 00, OW 40
#_02AADD: BEQ .skip_palettes

#_02AADF: LDA.b $8A ; OW 00, OW 80
#_02AAE1: AND.b #$BF
#_02AAE3: BNE .change_palettes

.skip_palettes
#_02AAE5: STZ.b $B0

#_02AAE7: LDA.b #$0D
#_02AAE9: STA.b $11

#_02AAEB: LDA.b #$00
#_02AAED: STA.b $95
#_02AAEF: STA.l $7EC011

#_02AAF3: RTS

;---------------------------------------------------------------------------------------------------

.change_palettes
#_02AAF4: LDX.b $8A

#_02AAF6: LDA.l $7EFD40,X
#_02AAFA: STA.b $00

#_02AAFC: LDA.l OverworldPalettesScreenToSet,X
#_02AB00: JSL OverworldPalettesLoader
#_02AB04: JSR Overworld_CopyPalettesToCache

#_02AB07: RTS

;===================================================================================================

Overworld_LoadGFXAndScreenSize:
#_02AB08: LDX.b $8A

#_02AB0A: STZ.w $0412

#_02AB0D: LDA.l $7EFCC0,X
#_02AB11: STA.w $0AA3

#_02AB14: LDA.l GFXAA2ValsOW,X
#_02AB18: STA.w $0AA2

#_02AB1B: TXA
#_02AB1C: AND.b #$3F
#_02AB1E: TAX

#_02AB1F: LDA.w $0712
#_02AB22: STA.w $0714

#_02AB25: LDA.l OverworldScreenSizeFlag,X
#_02AB29: STA.w $0712

#_02AB2C: LDA.l OverworldScreenSizeHighByte,X
#_02AB30: STA.w $0717

;---------------------------------------------------------------------------------------------------

#_02AB33: LDY.b #$20
#_02AB35: LDX.b #$00

#_02AB37: LDA.b $8A
#_02AB39: AND.b #$40
#_02AB3B: BEQ .light_world

#_02AB3D: INY
#_02AB3E: LDX.b #$08

.light_world
#_02AB40: STY.w $0AA1

#_02AB43: LDA.l SheetsTable_AA4,X
#_02AB47: STA.w $0AA4

#_02AB4A: REP #$30

#_02AB4C: LDA.b $8A
#_02AB4E: AND.w #$00BF
#_02AB51: ASL A
#_02AB52: TAX

#_02AB53: LDA.l OverworldTransitionPositionY,X
#_02AB57: STA.w $0708

#_02AB5A: LDA.l OverworldTransitionPositionX,X
#_02AB5E: LSR A
#_02AB5F: LSR A
#_02AB60: LSR A
#_02AB61: STA.w $070C

#_02AB64: LDA.w #$03F0

#_02AB67: LDX.w $0712
#_02AB6A: BNE .bigger_screen

#_02AB6C: LDA.w #$01F0

.bigger_screen
#_02AB6F: STA.w $070A

#_02AB72: LSR A
#_02AB73: LSR A
#_02AB74: LSR A
#_02AB75: STA.w $070E

#_02AB78: SEP #$30

#_02AB7A: RTS

;===================================================================================================

ScrollAndCheckForSOWExit:
#_02AB7B: LDA.w $0416
#_02AB7E: BEQ .no_scroll

#_02AB80: JSR OverworldHandleMapScroll

.no_scroll
#_02AB83: JSL SpecialOverworld_CheckForReturnTrigger

#_02AB87: RTS

;===================================================================================================

Module09_LoadAuxGFX:
#_02AB88: LDA.l $7EF2BB
#_02AB8C: AND.b #$DF
#_02AB8E: STA.l $7EF2BB

#_02AB92: LDA.l $7EF2FB
#_02AB96: AND.b #$DF
#_02AB98: STA.l $7EF2FB

#_02AB9C: LDA.l $7EF216
#_02ABA0: AND.b #$7F
#_02ABA2: STA.l $7EF216

#_02ABA6: LDA.l $7EF051
#_02ABAA: AND.b #$FE
#_02ABAC: STA.l $7EF051

#_02ABB0: JSL LoadTransAuxGFX
#_02ABB4: JSL PrepTransAuxGfx

#_02ABB8: LDA.b #$09
#_02ABBA: BRA .go

;===================================================================================================

#Module09_TriggerTilemapUpdate:
#_02ABBC: LDA.b #$0A

;---------------------------------------------------------------------------------------------------

.go
#_02ABBE: STA.b $17
#_02ABC0: STA.w $0710

#_02ABC3: INC.b $11

#_02ABC5: RTS

;===================================================================================================

Module09_LoadNewMapAndGFX:
#_02ABC6: STZ.w $04C8
#_02ABC9: STZ.w $04C9

#_02ABCC: JSR SomeTilemapChange

#_02ABCF: INC.w $0710

#_02ABD2: JSR CreateInitialNewScreenMapToScroll
#_02ABD5: JSL LoadNewSpriteGFXSet

#_02ABD9: RTS

;===================================================================================================

Overworld_RunScrollTransition:
#_02ABDA: JSL Link_HandleMovingAnimation_FullLongEntry
#_02ABDE: JSL Graphics_IncrementalVRAMUpload

#_02ABE2: JSR OverworldScrollTransition
#_02ABE5: AND.b #$0F
#_02ABE7: BEQ .continue

#_02ABE9: RTS

.continue
#_02ABEA: JMP.w OverworldTranScrollSet

;===================================================================================================

Module09_LoadNewSprites:
#_02ABED: LDA.w $0418
#_02ABF0: CMP.b #$01
#_02ABF2: BNE .dont_adjust_y

;---------------------------------------------------------------------------------------------------

#_02ABF4: REP #$20

#_02ABF6: LDA.b $E8
#_02ABF8: CLC
#_02ABF9: ADC.w #$0002
#_02ABFC: STA.b $E8

#_02ABFE: LDA.b $20
#_02AC00: CLC
#_02AC01: ADC.w #$0002
#_02AC04: STA.b $20

#_02AC06: SEP #$20

;---------------------------------------------------------------------------------------------------

.dont_adjust_y
#_02AC08: JSL Sprite_LoadAll_Overworld

#_02AC0C: STZ.w $04AC
#_02AC0F: STZ.w $04AD

#_02AC12: LDA.l $7EF3C5
#_02AC16: CMP.b #$02
#_02AC18: BCS .not_raining

.dont_set_fixed_color
#_02AC1A: JMP.w Overworld_StartScrollTransition

.not_raining
#_02AC1D: LDA.b $11
#_02AC1F: CMP.b #$12
#_02AC21: BEQ .dont_set_fixed_color

#_02AC23: JSL Overworld_SetFixedColAndScroll

;===================================================================================================

Overworld_StartScrollTransition:
#_02AC27: INC.b $11

#_02AC29: LDX.w $0410
#_02AC2C: CPX.b #$04
#_02AC2E: BCC .exit

;===================================================================================================

#OverworldTranScrollSet:
#_02AC30: STX.w $0416

#_02AC33: JSR OverworldTransitionScrollAndLoadMap

#_02AC36: STZ.w $0416

.exit
#_02AC39: RTS

;===================================================================================================

Overworld_EaseOffScrollTransition:
#_02AC3A: LDX.b $8A

#_02AC3C: LDA.l OverworldScreenSize,X
#_02AC40: BEQ .dont_scroll_map

#_02AC42: LDX.w $0410
#_02AC45: STX.w $0416

#_02AC48: JSR OverworldTransitionScrollAndLoadMap

#_02AC4B: STZ.w $0416

.dont_scroll_map
#_02AC4E: INC.b $B0

#_02AC50: LDA.b $B0
#_02AC52: CMP.b #$08
#_02AC54: BCC .exit

#_02AC56: LDX.w $0410
#_02AC59: CPX.b #$08
#_02AC5B: BEQ .scrolling_north

#_02AC5D: CPX.b #$02
#_02AC5F: BNE .not_scrolling_vertically

.scrolling_north
#_02AC61: CMP.b #$09
#_02AC63: BCC .exit

.not_scrolling_vertically
#_02AC65: STZ.b $B0
#_02AC67: STZ.w $0410

;---------------------------------------------------------------------------------------------------

#_02AC6A: LDX.b $8A

#_02AC6C: LDA.l OverworldScreenSize,X
#_02AC70: BEQ .dont_recover_map16

#_02AC72: REP #$20

#_02AC74: LDA.l $7EC172
#_02AC78: STA.b $84

#_02AC7A: LDA.l $7EC174
#_02AC7E: STA.b $86

#_02AC80: LDA.l $7EC176
#_02AC84: STA.b $88

#_02AC86: SEP #$20

.dont_recover_map16
#_02AC88: INC.b $11

#_02AC8A: JSL Follower_Disable

.exit
#_02AC8E: RTS

;===================================================================================================

Module09_0A_WalkFromExiting_FacingDown:
#_02AC8F: JSL Link_HandleMovingAnimation_SetFacingDown

#_02AC93: REP #$20

#_02AC95: LDA.b $20
#_02AC97: CLC
#_02AC98: ADC.w #$0001
#_02AC9B: STA.b $20

#_02AC9D: SEP #$20

#_02AC9F: DEC.w $069A
#_02ACA2: BNE .exit

;---------------------------------------------------------------------------------------------------

#_02ACA4: STZ.b $11

#_02ACA6: REP #$20

#_02ACA8: LDA.b $20
#_02ACAA: CLC
#_02ACAB: ADC.w #$0003
#_02ACAE: STA.b $20

#_02ACB0: SEP #$20

#_02ACB2: LDA.b #$03
#_02ACB4: STA.b $30

;---------------------------------------------------------------------------------------------------

#_02ACB6: JSR Overworld_OperateCameraScroll

#_02ACB9: LDA.w $0416
#_02ACBC: BEQ .exit

#_02ACBE: JSR OverworldHandleMapScroll

.exit
#_02ACC1: RTS

;===================================================================================================

Module09_0B_WalkFromExiting_FacingUp:
#_02ACC2: JSL Link_HandleMovingAnimation_FullLongEntry

#_02ACC6: REP #$20

#_02ACC8: LDA.b $20
#_02ACCA: SEC
#_02ACCB: SBC.w #$0001
#_02ACCE: STA.b $20

#_02ACD0: SEP #$20

#_02ACD2: DEC.w $069A
#_02ACD5: BNE .exit

#_02ACD7: STZ.b $11

.exit
#_02ACD9: RTS

;===================================================================================================

Map32UpdateTiles:
#_02ACDA: dw $0DA8, $0DA9, $0DAA, $0DAB ; sanc doors half open
#_02ACE2: dw $0DAC, $0DAD, $0DAE, $0DAF ; sanc doors 2/3 open
#_02ACEA: dw $0DB0, $0DB1, $0DB2, $0DB3 ; sanc doors fully open
#_02ACF2: dw $0DB6, $0DB7, $0DB8, $0DB9 ; castle doors 2/3 open
#_02ACFA: dw $0DBA, $0DBB, $0DBC, $0DBD ; castle doors fully open
#_02AD02: dw $0DCD, $0DCE, $0DCF, $0DD0 ; big rock imprint
#_02AD0A: dw $0DD3, $0DD4, $0DD5, $0DD6 ; open grave with corpse bottom half
#_02AD12: dw $0DD7, $0DD8, $0DD9, $0DDA ; open grave with stairs bottom half
#_02AD1A: dw $0DD1, $0DD2, $0DD3, $0DD4 ; open grave with corpse top half
#_02AD22: dw $0DD1, $0DD2, $0DD7, $0DD8 ; open grave with stairs top half
#_02AD2A: dw $0918, $0919, $091A, $091B ; stairs to cave
#_02AD32: dw $0DDB, $0DDC, $0DDD, $0DDE ; open grave with pit bottom half
#_02AD3A: dw $0DD1, $0DD2, $0DDB, $0DDC ; open grave with pit top half
#_02AD42: dw $0E21, $0E22, $0E23, $0E24 ; broken weather vane

;===================================================================================================

Module09_09_OpenBigDoorFromExiting:
#_02AD4A: LDA.w $0690
#_02AD4D: CMP.b #$03
#_02AD4F: BNE Overworld_DoMapUpdate32x32_conditional

#_02AD51: LDA.b #$24

#_02AD53: STA.w $069A

#_02AD56: STZ.w $0416

#_02AD59: INC.b $11

#_02AD5B: RTS

;===================================================================================================

Overworld_DoMapUpdate32x32_long:
#_02AD5C: JSR Overworld_DoMapUpdate32x32

#_02AD5F: STZ.w $0692

#_02AD62: RTL

;===================================================================================================

UNREACHABLE_02AD63:
#_02AD63: REP #$30

#_02AD65: JSR Overworld_DoMapUpdate32x32_16bit_already

#_02AD68: STZ.w $0692

#_02AD6B: RTL

;===================================================================================================

Module09_0C_OpenBigDoor:
#_02AD6C: LDA.w $0690
#_02AD6F: CMP.b #$03
#_02AD71: BNE Overworld_DoMapUpdate32x32_conditional

#_02AD73: STZ.b $B0
#_02AD75: STZ.b $11
#_02AD77: STZ.w $0416

#_02AD7A: RTS

;===================================================================================================

Overworld_DoMapUpdate32x32_conditional:
#_02AD7B: LDA.w $0692
#_02AD7E: AND.b #$07
#_02AD80: BEQ Overworld_DoMapUpdate32x32

#_02AD82: JMP.w NoMap32Update

;===================================================================================================

Overworld_DoMapUpdate32x32:
#_02AD85: REP #$30

;---------------------------------------------------------------------------------------------------

#Overworld_DoMapUpdate32x32_16bit_already:
#_02AD87: PHB
#_02AD88: PHK
#_02AD89: PLB

#_02AD8A: LDA.w $0698

#_02AD8D: LDX.w $04AC

#_02AD90: STA.l $7EF800,X

#_02AD94: TAX

#_02AD95: LDY.w $0692

#_02AD98: LDA.w Map32UpdateTiles,Y
#_02AD9B: STA.l $7E2000,X

#_02AD9F: LDX.w $04AC

#_02ADA2: STA.l $7EFA00,X

#_02ADA6: LDY.w #$0000
#_02ADA9: LDX.w $0698
#_02ADAC: JSL Overworld_DrawMap16_Anywhere

;---------------------------------------------------------------------------------------------------

#_02ADB0: LDA.w $0698
#_02ADB3: LDX.w $04AC

#_02ADB6: INC A
#_02ADB7: INC A
#_02ADB8: STA.l $7EF802,X

#_02ADBC: LDX.w $0698
#_02ADBF: LDY.w $0692

#_02ADC2: LDA.w Map32UpdateTiles+2,Y
#_02ADC5: STA.l $7E2002,X

#_02ADC9: LDX.w $04AC
#_02ADCC: STA.l $7EFA02,X

#_02ADD0: LDY.w #$0002
#_02ADD3: LDX.w $0698
#_02ADD6: JSL Overworld_DrawMap16_Anywhere

;---------------------------------------------------------------------------------------------------

#_02ADDA: LDA.w $0698

#_02ADDD: LDX.w $04AC

#_02ADE0: CLC
#_02ADE1: ADC.w #$0080
#_02ADE4: STA.l $7EF804,X

#_02ADE8: LDX.w $0698
#_02ADEB: LDY.w $0692

#_02ADEE: LDA.w Map32UpdateTiles+4,Y
#_02ADF1: STA.l $7E2080,X

#_02ADF5: LDX.w $04AC
#_02ADF8: STA.l $7EFA04,X

#_02ADFC: LDY.w #$0080
#_02ADFF: LDX.w $0698
#_02AE02: JSL Overworld_DrawMap16_Anywhere

;---------------------------------------------------------------------------------------------------

#_02AE06: LDA.w $0698

#_02AE09: LDX.w $04AC

#_02AE0C: CLC
#_02AE0D: ADC.w #$0082
#_02AE10: STA.l $7EF806,X

#_02AE14: LDX.w $0698
#_02AE17: LDY.w $0692

#_02AE1A: LDA.w Map32UpdateTiles+6,Y
#_02AE1D: STA.l $7E2082,X

#_02AE21: LDX.w $04AC
#_02AE24: STA.l $7EFA06,X

#_02AE28: LDY.w #$0082
#_02AE2B: LDX.w $0698
#_02AE2E: JSL Overworld_DrawMap16_Anywhere

;---------------------------------------------------------------------------------------------------

#_02AE32: LDY.w $1000

#_02AE35: LDA.w #$FFFF
#_02AE38: STA.w $1002,Y

#_02AE3B: LDA.w $04AC
#_02AE3E: CLC
#_02AE3F: ADC.w #$0008
#_02AE42: STA.w $04AC

#_02AE45: INC.w $0690

#_02AE48: LDA.w $0692
#_02AE4B: CMP.w #$0020
#_02AE4E: BNE .dont_advance_count

#_02AE50: INC.w $0690

.dont_advance_count
#_02AE53: PLB

#_02AE54: SEP #$30

#_02AE56: LDA.b #$01
#_02AE58: STA.b $14

;===================================================================================================

NoMap32Update:
#_02AE5A: INC.w $0692

#_02AE5D: RTS

;===================================================================================================

Overworld_StartMosaicTransition:
#_02AE5E: JSR ConditionalMosaicControl

#_02AE61: LDA.b $B0
#_02AE63: JSL JumpTableLocal
#_02AE67: dw OverworldMosaicTransition_HandleSong                 ; 0x00
#_02AE69: dw ApplyPaletteFilter_bounce                            ; 0x01
#_02AE6B: dw OverworldMosaicTransition_HandleScreensAndLoadShroom ; 0x02

;===================================================================================================

OverworldMosaicTransition_HandleSong:
#_02AE6D: LDX.b $8A
#_02AE6F: CPX.b #$80
#_02AE71: BEQ .skip

#_02AE73: LDA.l $7F5B00,X
#_02AE77: AND.b #$0F
#_02AE79: CMP.w $0130
#_02AE7C: BEQ .skip

#_02AE7E: LDA.b #$F1 ; SONG F1 - fade
#_02AE80: STA.w $012C

.skip
#_02AE83: JMP.w ResetTransitionPropsAndAdvance_ResetInterface

;===================================================================================================

OverworldMosaicTransition_HandleScreensAndLoadShroom:
#_02AE86: LDA.b #$80
#_02AE88: STA.b $13

#_02AE8A: STZ.b $B0

#_02AE8C: LDA.b $8A
#_02AE8E: AND.b #$3F ; OW 00, OW 40
#_02AE90: BNE .not_woods_screen

#_02AE92: LDA.b #$1E
#_02AE94: JSL WriteTo4BPPBuffer_item_gfx

.not_woods_screen
#_02AE98: LDA.w $040A
#_02AE9B: BEQ .check_to_load

#_02AE9D: LDA.b $10
#_02AE9F: CMP.b #$0B
#_02AEA1: BEQ .check_to_load

#_02AEA3: LDY.b #$16

#_02AEA5: LDA.b #$01
#_02AEA7: STY.b $1C
#_02AEA9: STA.b $1D

#_02AEAB: LDA.b #$82
#_02AEAD: STA.b $99

#_02AEAF: LDA.b #$20
#_02AEB1: STA.b $9A

#_02AEB3: INC.b $11

#_02AEB5: RTS

;---------------------------------------------------------------------------------------------------

.check_to_load
#_02AEB6: LDA.b $11
#_02AEB8: CMP.b #$24
#_02AEBA: BNE .dont_load

#_02AEBC: JSR LoadOverworldFromSpecialOverworld

#_02AEBF: LDA.b $8A
#_02AEC1: AND.b #$3F ; OW 00, OW 40
#_02AEC3: BNE .dont_load

#_02AEC5: LDA.b #$1E
#_02AEC7: JSL WriteTo4BPPBuffer_item_gfx

.dont_load
#_02AECB: INC.b $11

#_02AECD: RTS

;===================================================================================================

Module09_1D:
#_02AECE: JSR ConditionalMosaicControl

#_02AED1: LDA.b $B0
#_02AED3: JSL JumpTableLocal
#_02AED7: dw ResetTransitionPropsAndAdvance_ResetInterface ; 0x00
#_02AED9: dw ApplyPaletteFilter_bounce                     ; 0x01
#_02AEDB: dw Module09_1D_02_FBlankAndEnterModule0A         ; 0x02

;===================================================================================================

Module09_1D_02_FBlankAndEnterModule0A:
#_02AEDD: LDA.b #$80
#_02AEDF: STA.b $13

#_02AEE1: STZ.b $B0

#_02AEE3: LDA.b #$0A
#_02AEE5: STA.b $10
#_02AEE7: STZ.b $11

#_02AEE9: RTS

;===================================================================================================

Module09_1E:
#_02AEEA: JSR ConditionalMosaicControl

#_02AEED: LDA.b $B0
#_02AEEF: JSL JumpTableLocal
#_02AEF3: dw ResetTransitionPropsAndAdvance_ResetInterface ; 0x00
#_02AEF5: dw ApplyPaletteFilter_bounce                     ; 0x01
#_02AEF7: dw Module09_1E_02_FBlankAndLoadSPOW              ; 0x02

;===================================================================================================

Module09_1E_02_FBlankAndLoadSPOW:
#_02AEF9: LDA.b #$80
#_02AEFB: STA.b $13

#_02AEFD: JSR LoadOverworldFromSpecialOverworld

#_02AF00: LDA.b #$09
#_02AF02: STA.b $10

#_02AF04: LDA.b #$0F
#_02AF06: STA.b $11

#_02AF08: STZ.b $B0

#_02AF0A: RTS

;===================================================================================================

Module09_25:
#_02AF0B: JSL Sprite_InitializeSlots
#_02AF0F: JSL Sprite_ReloadAll_Overworld

#_02AF13: STZ.w $0308
#_02AF16: STZ.w $0309

;===================================================================================================

Overworld_LoadSubscreenAndSilenceSFX1:
#_02AF19: LDA.b #$05 ; SFX1.05
#_02AF1B: STA.w $012D

;===================================================================================================

Overworld_ReloadSubscreenOverlay:
#_02AF1E: REP #$30

#_02AF20: LDA.b $8A
#_02AF22: STA.l $7EC213

#_02AF26: LDA.b $84
#_02AF28: STA.l $7EC215

#_02AF2C: LDA.b $88
#_02AF2E: STA.l $7EC217

#_02AF32: LDA.b $86
#_02AF34: STA.l $7EC219

#_02AF38: LDA.w $0418
#_02AF3B: STA.l $7EC21B

#_02AF3F: LDA.w $0410
#_02AF42: STA.l $7EC21D

#_02AF46: LDA.w $0416
#_02AF49: STA.l $7EC21F

#_02AF4D: STZ.b $8C

#_02AF4F: STZ.w $0622
#_02AF52: STZ.w $0620

;---------------------------------------------------------------------------------------------------

#_02AF55: LDY.w #$0390

#_02AF58: LDA.b $8A
#_02AF5A: CMP.w #$0080 ; SPOW
#_02AF5D: BCC .normal_overworld

#_02AF5F: LDX.w #$0097 ; OW 97

#_02AF62: LDA.b $A0
#_02AF64: CMP.w #$0180 ; OW 80
#_02AF67: BNE .not_mastersword

#_02AF69: LDX.w #$0080 ; OW 80
#_02AF6C: LDA.l $7EF280,X

#_02AF70: LDX.w #$0097 ; OW 97

#_02AF73: AND.w #$0040
#_02AF76: BNE .disable_overlay

;---------------------------------------------------------------------------------------------------

.do_load_special
#_02AF78: JMP.w .load_overlay

;---------------------------------------------------------------------------------------------------

.not_mastersword
#_02AF7B: LDX.w #$0094 ; OW 94
#_02AF7E: CMP.w #$0181 ; OW 81
#_02AF81: BEQ .do_load_special

#_02AF83: LDX.w #$0093 ; OW 93
#_02AF86: CMP.w #$0189 ; OW 89
#_02AF89: BEQ .do_load_special

#_02AF8B: CMP.w #$0182 ; OW 82
#_02AF8E: BEQ .disable_with_sfx

#_02AF90: CMP.w #$0183 ; OW 83
#_02AF93: BNE .disable_overlay

;---------------------------------------------------------------------------------------------------

.disable_with_sfx
#_02AF95: SEP #$30

#_02AF97: LDA.b #$01 ; SFX1.01
#_02AF99: STA.w $012D

;---------------------------------------------------------------------------------------------------

.disable_overlay
#_02AF9C: SEP #$30

#_02AF9E: STZ.b $1D

#_02AFA0: INC.b $11

#_02AFA2: RTS

;---------------------------------------------------------------------------------------------------

.normal_overworld
#_02AFA3: AND.w #$003F ; OW 00, OW 40
#_02AFA6: BNE .not_any_woods

#_02AFA8: LDA.b $8A
#_02AFAA: AND.w #$0040
#_02AFAD: BNE .skull_woods

#_02AFAF: LDX.w #$0080 ; OW 80
#_02AFB2: LDA.l $7EF280,X

#_02AFB6: LDX.w #$009E ; OW 9E
#_02AFB9: AND.w #$0040
#_02AFBC: BNE .load_overlay

.skull_woods
#_02AFBE: LDX.w #$009D ; OW 9D
#_02AFC1: BRA .load_overlay

;---------------------------------------------------------------------------------------------------

.not_any_woods
#_02AFC3: LDX.w #$0095 ; OW 95

#_02AFC6: LDA.b $8A
#_02AFC8: CMP.w #$0003 ; OW 03
#_02AFCB: BEQ .load_overlay

#_02AFCD: CMP.w #$0005 ; OW 05
#_02AFD0: BEQ .load_overlay

#_02AFD2: CMP.w #$0007 ; OW 07
#_02AFD5: BEQ .load_overlay

#_02AFD7: LDX.w #$009C ; OW 9C

#_02AFDA: CMP.w #$0043 ; OW 43
#_02AFDD: BEQ .load_overlay

#_02AFDF: CMP.w #$0045 ; OW 45
#_02AFE2: BEQ .load_overlay

#_02AFE4: CMP.w #$0047 ; OW 47
#_02AFE7: BEQ .load_overlay

#_02AFE9: CMP.w #$0070 ; OW 70
#_02AFEC: BNE .not_mire

#_02AFEE: LDA.l $7EF2F0
#_02AFF2: AND.w #$0020
#_02AFF5: BNE .load_overlay

#_02AFF7: BRA .load_rain

;---------------------------------------------------------------------------------------------------

.not_mire
#_02AFF9: LDX.w #$0096 ; OW 96

#_02AFFC: LDA.l $7EF3C5
#_02B000: AND.w #$00FF
#_02B003: CMP.w #$0002
#_02B006: BCS .load_overlay

.load_rain
#_02B008: LDX.w #$009F ; OW 9F

;---------------------------------------------------------------------------------------------------

.load_overlay
#_02B00B: STY.b $84

#_02B00D: STX.b $8A
#_02B00F: STX.b $8C

#_02B011: LDA.b $84
#_02B013: SEC
#_02B014: SBC.w #$0400
#_02B017: AND.w #$0F80
#_02B01A: ASL A
#_02B01B: XBA
#_02B01C: STA.b $88

#_02B01E: LDA.b $84
#_02B020: SEC
#_02B021: SBC.w #$0010
#_02B024: AND.w #$003E
#_02B027: LSR A
#_02B028: STA.b $86

#_02B02A: STZ.w $0418
#_02B02D: STZ.w $0410
#_02B030: STZ.w $0416

;---------------------------------------------------------------------------------------------------

#_02B033: SEP #$30

#_02B035: LDA.b #$82
#_02B037: STA.b $99

#_02B039: LDA.b #$16
#_02B03B: STA.b $1C

#_02B03D: LDA.b #$01
#_02B03F: STA.b $1D

#_02B041: PHX
#_02B042: LDX.b $8A

#_02B044: LDA.l $7F5B00,X
#_02B048: LSR A
#_02B049: LSR A
#_02B04A: LSR A
#_02B04B: LSR A
#_02B04C: STA.w $012D

#_02B04F: PLX

#_02B050: LDA.b #$72

#_02B052: CPX.b #$97 ; OW 97
#_02B054: BEQ .continue_with_subscreen

#_02B056: CPX.b #$94 ; OW 94
#_02B058: BEQ .continue_with_subscreen

#_02B05A: CPX.b #$93 ; OW 93
#_02B05C: BEQ .continue_with_subscreen

#_02B05E: CPX.b #$9D ; OW 9D
#_02B060: BEQ .continue_with_subscreen

#_02B062: CPX.b #$9E ; OW 9E
#_02B064: BEQ .continue_with_subscreen

#_02B066: CPX.b #$9F ; OW 9F
#_02B068: BEQ .continue_with_subscreen

#_02B06A: LDA.b #$20

#_02B06C: CPX.b #$95 ; OW 95
#_02B06E: BEQ .continue_with_subscreen

#_02B070: CPX.b #$9C ; OW 9C
#_02B072: BEQ .continue_with_subscreen

#_02B074: LDA.l $7EC213
#_02B078: TAX

#_02B079: LDA.b #$20
#_02B07B: CPX.b #$5B ; OW 5B
#_02B07D: BEQ .continue_with_subscreen

#_02B07F: CPX.b #$1B ; OW 1B
#_02B081: BNE .disable_subscreen

#_02B083: LDX.b $11
#_02B085: CPX.b #$23
#_02B087: BEQ .continue_with_subscreen

#_02B089: CPX.b #$2C
#_02B08B: BEQ .continue_with_subscreen

;---------------------------------------------------------------------------------------------------

.disable_subscreen
#_02B08D: STZ.b $1D

.continue_with_subscreen
#_02B08F: STA.b $9A

#_02B091: JSR LoadOverworldOverlay

#_02B094: LDA.b $8C
#_02B096: CMP.b #$94 ; OW 94
#_02B098: BNE .not_hobo_bridge_shadow

#_02B09A: LDA.b $E7
#_02B09C: ORA.b #$01
#_02B09E: STA.b $E7

.not_hobo_bridge_shadow
#_02B0A0: REP #$20

#_02B0A2: LDA.l $7EC213
#_02B0A6: STA.b $8A

#_02B0A8: LDA.l $7EC215
#_02B0AC: STA.b $84

#_02B0AE: LDA.l $7EC217
#_02B0B2: STA.b $88

#_02B0B4: LDA.l $7EC219
#_02B0B8: STA.b $86

#_02B0BA: LDA.l $7EC21B
#_02B0BE: STA.w $0418

#_02B0C1: LDA.l $7EC21D
#_02B0C5: STA.w $0410

#_02B0C8: LDA.l $7EC21F
#_02B0CC: STA.w $0416

#_02B0CF: SEP #$20

#_02B0D1: RTS

;===================================================================================================

Module09_FadeBackInFromMosaic:
#_02B0D2: LDA.l $7EC007
#_02B0D6: LSR A
#_02B0D7: BCC .delay

#_02B0D9: LDA.l $7EC011
#_02B0DD: SEC
#_02B0DE: SBC.b #$10
#_02B0E0: STA.l $7EC011

.delay
#_02B0E4: JSR CopyMosaicControl

#_02B0E7: LDA.b $B0
#_02B0E9: JSL JumpTableLocal
#_02B0ED: dw OverworldMosaicTransition_RecoverDestinationPalettes ; 0x00
#_02B0EF: dw OverworldMosaicTransition_FilterAndLoadGraphics      ; 0x01
#_02B0F1: dw OverworldMosaicTransition_RecoverSongAndSetMoving    ; 0x02

;===================================================================================================

OverworldMosaicTransition_RecoverDestinationPalettes:
#_02B0F3: LDX.b $8A

#_02B0F5: LDA.l $7EFD40,X
#_02B0F9: STA.b $00

#_02B0FB: LDA.l OverworldPalettesScreenToSet,X
#_02B0FF: JSL OverworldPalettesLoader

#_02B103: BRA OverworldMosaicTransition_LoadSpriteGraphicsAndSetMosaic

;===================================================================================================

OverworldMosaicTransition_RecoverSongAndSetMoving:
#_02B105: LDA.w $0130
#_02B108: STA.w $0133

#_02B10B: LDA.b $8A
#_02B10D: CMP.b #$80 ; OW 80
#_02B10F: BEQ .dont_set_song

#_02B111: CMP.b #$2A ; OW 2A
#_02B113: BEQ .dont_set_song

#_02B115: LDX.b $8A

#_02B117: LDA.l $7F5B00,X
#_02B11B: LSR A
#_02B11C: LSR A
#_02B11D: LSR A
#_02B11E: LSR A
#_02B11F: BNE .has_sfx

#_02B121: LDA.b #$05 ; SFX1.05

.has_sfx
#_02B123: STA.w $012D

#_02B126: LDA.l $7F5B00,X
#_02B12A: AND.b #$0F
#_02B12C: CMP.w $0130
#_02B12F: BEQ .dont_set_song

#_02B131: STA.w $012C

.dont_set_song
#_02B134: STZ.b $11

#_02B136: LDA.b #$08
#_02B138: STA.b $11

#_02B13A: STZ.b $B0

#_02B13C: LDA.b $10
#_02B13E: CMP.b #$0B
#_02B140: BNE .exit

#_02B142: LDA.b #$09
#_02B144: STA.b $10

#_02B146: LDA.b #$1F
#_02B148: STA.b $11

#_02B14A: LDA.b #$0C
#_02B14C: STA.w $069A

.exit
#_02B14F: RTS

;===================================================================================================

Module09_1C:
#_02B150: LDA.l $7EC007
#_02B154: LSR A
#_02B155: BCC .delay

#_02B157: LDA.l $7EC011
#_02B15B: SEC
#_02B15C: SBC.b #$10
#_02B15E: STA.l $7EC011

.delay
#_02B162: JSR CopyMosaicControl

#_02B165: LDA.b $B0
#_02B167: JSL JumpTableLocal
#_02B16B: dw OverworldMosaicTransition_LoadSpriteGraphicsAndSetMosaic ; 0x00
#_02B16D: dw OverworldMosaicTransition_FilterAndLoadGraphics          ; 0x01
#_02B16F: dw Module09_1C_02_HandleMusic                               ; 0x02

;===================================================================================================

OverworldMosaicTransition_LoadSpriteGraphicsAndSetMosaic:
#_02B171: JSL LoadNewSpriteGFXSet

#_02B175: LDA.b #$0F
#_02B177: STA.b $13

#_02B179: LDA.b #$80
#_02B17B: STA.b $9B

#_02B17D: LDA.l $7EC00B
#_02B181: DEC A
#_02B182: STA.l $7EC007

#_02B186: LDA.b #$00
#_02B188: STA.l $7EC00B

#_02B18C: LDA.b #$02
#_02B18E: STA.l $7EC009

#_02B192: INC.b $B0

#_02B194: RTS

;===================================================================================================

OverworldMosaicTransition_FilterAndLoadGraphics:
#_02B195: JSL Graphics_IncrementalVRAMUpload
#_02B199: JSL ApplyPaletteFilter

#_02B19D: RTS

;===================================================================================================

Module09_1C_02_HandleMusic:
#_02B19E: LDA.b $8A
#_02B1A0: CMP.b #$80 ; OW 80
#_02B1A2: BCS .no_song_change

#_02B1A4: LDA.b #$02 ; SONG 02
#_02B1A6: STA.w $012C

#_02B1A9: LDA.b $8A
#_02B1AB: AND.b #$3F ; OW 00, OW 40
#_02B1AD: BNE .no_song_change

#_02B1AF: LDA.b #$05 ; SONG 05
#_02B1B1: STA.w $012C

.no_song_change
#_02B1B4: LDA.b #$08
#_02B1B6: STA.b $11

#_02B1B8: STZ.b $B0

#_02B1BA: RTS

;===================================================================================================

Module09_22:
#_02B1BB: INC.b $13

#_02B1BD: LDA.b $13
#_02B1BF: CMP.b #$0F
#_02B1C1: BNE .exit

#_02B1C3: STZ.b $11
#_02B1C5: STZ.b $B0

.exit
#_02B1C7: RTS

;===================================================================================================

Module09_18:
#_02B1C8: STZ.w $032A

#_02B1CB: LDA.b $10
#_02B1CD: PHA

#_02B1CE: LDA.b $11
#_02B1D0: PHA

#_02B1D1: JSR LoadSpecialOverworld
#_02B1D4: JSR Module09_25

#_02B1D7: PLA
#_02B1D8: INC A
#_02B1D9: STA.b $11

#_02B1DB: PLA
#_02B1DC: STA.b $10

#_02B1DE: RTS

;===================================================================================================

Module09_19:
#_02B1DF: LDA.b $10
#_02B1E1: PHA

#_02B1E2: LDA.b $11
#_02B1E4: PHA

#_02B1E5: JSR Module08_02_LoadAndAdvance

#_02B1E8: PLA
#_02B1E9: INC A
#_02B1EA: STA.b $11

#_02B1EC: PLA
#_02B1ED: STA.b $10

#_02B1EF: RTS

;===================================================================================================

Overworld_LoadAndBuildScreen_long:
#_02B1F0: JSR Overworld_LoadAndBuildScreen

#_02B1F3: RTL

;===================================================================================================

Overworld_ReloadSubscreenOverlayAndAdvance_long:
#_02B1F4: JSR Overworld_ReloadSubscreenOverlay

#_02B1F7: DEC.b $11

#_02B1F9: RTL

;===================================================================================================

Module09_MirrorWarp:
#_02B1FA: JSL MirrorWarp_Main

#_02B1FE: RTS

;===================================================================================================

MirrorWarp_Main:
#_02B1FF: INC.w $0710

#_02B202: LDA.b $B0
#_02B204: JSL JumpTableLong
#_02B208: dl MirrorWarp_Initialize                 ; 0x00
#_02B20B: dl MirrorWarp_BuildAndEnableHDMATable    ; 0x01
#_02B20E: dl MirrorWarp_BuildWavingHDMATable       ; 0x02
#_02B211: dl MirrorWarp_BuildDewavingHDMATable     ; 0x03
#_02B214: dl MirrorWarp_FinalizeAndLoadDestination ; 0x04

;===================================================================================================

MirrorWarp_Initialize:
#_02B217: LDA.b $8A
#_02B219: CMP.b #$80 ; SPOW
#_02B21B: BCC .not_special

#_02B21D: STZ.b $11
#_02B21F: STZ.b $B0
#_02B221: STZ.w $0200

#_02B224: RTL

;---------------------------------------------------------------------------------------------------

.not_special
#_02B225: LDA.b #$08 ; SONG 08
#_02B227: STA.w $012C
#_02B22A: STA.w $0ABF

#_02B22D: LDA.b #$90
#_02B22F: STA.w $031F

#_02B232: JSL InitializeMirrorHDMA

#_02B236: LDA.l $7EF3CA
#_02B23A: EOR.b #$40
#_02B23C: STA.l $7EF3CA

#_02B240: STZ.w $04C8
#_02B243: STZ.w $04C9

#_02B246: LDA.b $8A
#_02B248: AND.b #$3F
#_02B24A: ORA.l $7EF3CA
#_02B24E: STA.b $8A
#_02B250: STA.w $040A

#_02B253: STZ.w $0200

#_02B256: JSL PaletteFilter_InitializeWhiteFilter
#_02B25A: JSR Overworld_LoadGFXAndScreenSize

#_02B25D: INC.b $B0

#_02B25F: RTL

;===================================================================================================

MirrorWarp_FinalizeAndLoadDestination:
#_02B260: REP #$20

#_02B262: LDA.w #$2641
#_02B265: STA.w DMA7MODE

#_02B268: LDX.b #$3E

#_02B26A: LDA.w #$FF00

.next
#_02B26D: STA.w $1B00,X
#_02B270: STA.w $1B40,X
#_02B273: STA.w $1B80,X
#_02B276: STA.w $1BC0,X
#_02B279: STA.w $1C00,X
#_02B27C: STA.w $1C40,X
#_02B27F: STA.w $1C80,X

#_02B282: DEX
#_02B283: DEX
#_02B284: BPL .next

;---------------------------------------------------------------------------------------------------

#_02B286: LDA.w #$0000
#_02B289: STA.l $7EC007
#_02B28D: STA.l $7EC009

#_02B291: SEP #$20

#_02B293: JSL ReloadPreviouslyLoadedSheets
#_02B297: JSL AdjustOverworldAmbiance

#_02B29B: LDA.b #$80
#_02B29D: STA.b $9B

#_02B29F: LDX.b $8A

#_02B2A1: LDA.l $7F5B00,X
#_02B2A5: AND.b #$0F
#_02B2A7: STA.w $012C

#_02B2AA: LDA.l $7F5B00,X
#_02B2AE: LSR A
#_02B2AF: LSR A
#_02B2B0: LSR A
#_02B2B1: LSR A
#_02B2B2: STA.w $012D

#_02B2B5: CPX.b #$40 ; DW
#_02B2B7: BCC .not_bunny_song

#_02B2B9: LDA.l $7EF357
#_02B2BD: BNE .not_bunny_song

#_02B2BF: LDA.b #$04 ; SONG 04
#_02B2C1: STA.w $012C

.not_bunny_song
#_02B2C4: LDA.b $11
#_02B2C6: STA.w $010C

#_02B2C9: STZ.b $11
#_02B2CB: STZ.b $B0

#_02B2CD: STZ.w $0200
#_02B2D0: STZ.w $0710

#_02B2D3: RTL

;===================================================================================================

MirrorWarp_HandleCastlePyramidSubscreen:
#_02B2D4: JSR Overworld_LoadSubscreenAndSilenceSFX1

#_02B2D7: LDA.b $8A
#_02B2D9: CMP.b #$1B ; OW 1B
#_02B2DB: BEQ .is_castle

#_02B2DD: CMP.b #$5B ; OW 5B
#_02B2DF: BNE .not_pyramid

.is_castle
#_02B2E1: LDA.b #$01
#_02B2E3: STA.b $1D

.not_pyramid
#_02B2E5: RTL

;===================================================================================================

Overworld_DrawScreenAtCurrentMirrorPosition:
#_02B2E6: REP #$20

#_02B2E8: LDA.b $84
#_02B2EA: PHA

#_02B2EB: LDA.b $86
#_02B2ED: PHA

#_02B2EE: LDA.b $88
#_02B2F0: PHA

#_02B2F1: LDX.b $8A

#_02B2F3: LDA.l OverworldScreenSize,X
#_02B2F7: AND.w #$00FF
#_02B2FA: BEQ .no_adjustment

#_02B2FC: LDA.w #$0390
#_02B2FF: STA.b $84

#_02B301: SEC
#_02B302: SBC.w #$0400
#_02B305: AND.w #$0F80
#_02B308: ASL A
#_02B309: XBA
#_02B30A: STA.b $88

#_02B30C: LDA.b $84
#_02B30E: SEC
#_02B30F: SBC.w #$0010
#_02B312: AND.w #$003E
#_02B315: LSR A
#_02B316: STA.b $86

;---------------------------------------------------------------------------------------------------

.no_adjustment
#_02B318: SEP #$20

#_02B31A: JSR Overworld_DrawQuadrantsAndOverlays

#_02B31D: LDA.b $11
#_02B31F: CMP.b #$2C
#_02B321: BNE .not_mirror_bonk

#_02B323: JSR MirrorBonk_RecoverChangedTiles

.not_mirror_bonk
#_02B326: REP #$20

#_02B328: PLA
#_02B329: STA.b $88

#_02B32B: PLA
#_02B32C: STA.b $86

#_02B32E: PLA
#_02B32F: STA.b $84

#_02B331: SEP #$20

#_02B333: RTL

;===================================================================================================

MirrorWarp_LoadSpritesAndColors:
#_02B334: LDA.b #$90
#_02B336: STA.w $031F

#_02B339: REP #$20

#_02B33B: LDA.b $84
#_02B33D: PHA

#_02B33E: LDA.b $86
#_02B340: PHA

#_02B341: LDA.b $88
#_02B343: PHA

#_02B344: LDA.w #$FFFF
#_02B347: STA.b $C8

#_02B349: STZ.b $CA
#_02B34B: STZ.b $CC

;---------------------------------------------------------------------------------------------------

#_02B34D: LDX.b $8A

#_02B34F: LDA.l OverworldScreenSize,X
#_02B353: AND.w #$00FF
#_02B356: BEQ .no_adjustment

#_02B358: LDA.w #$0390
#_02B35B: STA.b $84

#_02B35D: SEC
#_02B35E: SBC.w #$0400
#_02B361: AND.w #$0F80
#_02B364: ASL A
#_02B365: XBA
#_02B366: STA.b $88

#_02B368: LDA.b $84
#_02B36A: SEC
#_02B36B: SBC.w #$0010
#_02B36E: AND.w #$003E
#_02B371: LSR A
#_02B372: STA.b $86

;---------------------------------------------------------------------------------------------------

.no_adjustment
#_02B374: SEP #$20

#_02B376: JSR BuildOverworldMapFromMap16

#_02B379: REP #$20

#_02B37B: PLA
#_02B37C: STA.b $88

#_02B37E: PLA
#_02B37F: STA.b $86

#_02B381: PLA
#_02B382: STA.b $84

;---------------------------------------------------------------------------------------------------

#_02B384: SEP #$20

#_02B386: JSR OverworldLoadScreensPaletteSet

#_02B389: LDX.b $8A

#_02B38B: LDA.l $7EFD40,X
#_02B38F: STA.b $00

#_02B391: LDA.l OverworldPalettesScreenToSet,X
#_02B395: JSL OverworldPalettesLoader

#_02B399: JSL Overworld_SetScreenBGColorCacheOnly
#_02B39D: JSL Overworld_SetFixedColAndScroll

#_02B3A1: LDA.b $8A
#_02B3A3: CMP.b #$1B ; OW 1B
#_02B3A5: BEQ .is_castle

#_02B3A7: CMP.b #$5B ; OW 5B
#_02B3A9: BNE .not_pyramid_a

.is_castle
#_02B3AB: LDA.b #$01
#_02B3AD: STA.b $1D

;---------------------------------------------------------------------------------------------------

.not_pyramid_a
#_02B3AF: REP #$20

#_02B3B1: LDX.b #$00

#_02B3B3: LDA.w #$7FFF ; RGB: #F8F8F8

.next_color
#_02B3B6: STA.l $7EC540,X
#_02B3BA: STA.l $7EC560,X
#_02B3BE: STA.l $7EC580,X
#_02B3C2: STA.l $7EC5A0,X
#_02B3C6: STA.l $7EC5C0,X
#_02B3CA: STA.l $7EC5E0,X

#_02B3CE: INX
#_02B3CF: INX
#_02B3D0: CPX.b #$20
#_02B3D2: BNE .next_color

#_02B3D4: STA.l $7EC500

;---------------------------------------------------------------------------------------------------

#_02B3D8: LDA.b $8A
#_02B3DA: CMP.w #$005B ; OW 5B
#_02B3DD: BNE .not_pyramid_b

#_02B3DF: LDA.w #$0000 ; RGB: #000000
#_02B3E2: STA.l $7EC500
#_02B3E6: STA.l $7EC540

;---------------------------------------------------------------------------------------------------

.not_pyramid_b
#_02B3EA: SEP #$20

#_02B3EC: JSL Sprite_ResetAll
#_02B3F0: JSL Sprite_ReloadAll_Overworld

#_02B3F4: JSL Link_ItemReset_FromOverworldThings

#_02B3F8: JSR DeleteCertainAncillaeStopDashing

#_02B3FB: LDA.b #$14 ; LINKSTATE 14
#_02B3FD: STA.b $5D

#_02B3FF: LDA.b $8A
#_02B401: AND.b #$40
#_02B403: BNE .exit

#_02B405: JSL InitializeMirrorPortal

.exit
#_02B409: RTL

;===================================================================================================

Module09_2B:
#_02B40A: JSL PaletteBlackAndWhiteSomething_Conditional

;===================================================================================================

Module09_2D_WaitForBird:
#_02B40E: RTS

;===================================================================================================

Module09_2E_Whirlpool:
#_02B40F: INC.w $0710

#_02B412: LDA.b $B0
#_02B414: JSL JumpTableLocal
#_02B418: dw Module09_2E_00_InitWhirlpool        ; 0x00
#_02B41A: dw Module09_2E_01_FilterBlue           ; 0x01
#_02B41C: dw Module09_2E_01_MoreBlue             ; 0x02
#_02B41E: dw Module09_2E_03_FindDestination      ; 0x03
#_02B420: dw Module09_2E_04                      ; 0x04
#_02B422: dw Module09_2E_05_LoadDestinationMap   ; 0x05
#_02B424: dw Module09_2E_04                      ; 0x06
#_02B426: dw Module09_2E_07_LoadAuxGraphics      ; 0x07
#_02B428: dw Module09_2E_08_TriggerTilemapUpdate ; 0x08
#_02B42A: dw Module09_2E_09_LoadPalettes         ; 0x09
#_02B42C: dw Module09_2E_0A                      ; 0x0A
#_02B42E: dw Module09_2E_0B                      ; 0x0B
#_02B430: dw Module09_2E_0C_FinalizeWarp         ; 0x0C

;===================================================================================================

Module09_2E_00_InitWhirlpool:
#_02B432: LDA.b #$34 ; SFX2.34
#_02B434: STA.w $012E

#_02B437: LDA.b #$05 ; SFX1.05
#_02B439: STA.w $012D

#_02B43C: STZ.w $0200

#_02B43F: LDA.b #$00
#_02B441: STA.l $7EC007
#_02B445: STA.l $7EC008

#_02B449: INC.b $B0

#_02B44B: RTS

;===================================================================================================

Module09_2E_01_FilterBlue:
#_02B44C: JSL PaletteFilter_WhirlpoolBlue

#_02B450: RTS

;===================================================================================================

Module09_2E_01_MoreBlue:
#_02B451: JSL PaletteFilter_IsolateWhirlpoolBlue

#_02B455: RTS

;===================================================================================================

Module09_2E_0B:
#_02B456: JSL Graphics_IncrementalVRAMUpload
#_02B45A: JSL PaletteFilter_WhirlpoolRestoreBlue

#_02B45E: RTS

;===================================================================================================

Module09_2E_0A:
#_02B45F: JSL PaletteFilter_WhirlpoolRestoreRedGreen

#_02B463: LDA.l $7EC007
#_02B467: BEQ .exit

#_02B469: JSL PaletteFilter_WhirlpoolRestoreRedGreen

.exit
#_02B46D: RTS

;===================================================================================================

Module09_2E_03_FindDestination:
#_02B46E: LDA.b #$9F ; Max green
#_02B470: STA.b $9E

#_02B472: STZ.w $0AA9
#_02B475: STZ.w $0AB2

#_02B478: JSL FindPartnerWhirlpoolExit

#_02B47C: STZ.b $B2

#_02B47E: JSL Overworld_ReloadSubscreenOverlayAndAdvance_long

#_02B482: LDA.b #$0C
#_02B484: STA.b $17

#_02B486: STZ.b $15

#_02B488: BRA Whirlpool_SetFixedColor

;===================================================================================================

Module09_2E_04:
#_02B48A: LDA.b #$0D
#_02B48C: STA.b $17

#_02B48E: BRA Whirlpool_Advance

;===================================================================================================

Module09_2E_05_LoadDestinationMap:
#_02B490: JSL Overworld_LoadOverlayAndMap

#_02B494: LDA.b #$0C
#_02B496: STA.b $17

#_02B498: BRA Whirlpool_SetBrightness

;===================================================================================================

Module09_2E_07_LoadAuxGraphics:
#_02B49A: JSR Module09_LoadAuxGFX

#_02B49D: BRA Whirlpool_ToSubmod2D

;===================================================================================================

Module09_2E_08_TriggerTilemapUpdate:
#_02B49F: JSR Module09_TriggerTilemapUpdate

#_02B4A2: LDA.b #$0F
#_02B4A4: STA.b $13

#_02B4A6: INC.w $0710

;===================================================================================================

Whirlpool_ToSubmod2D:
#_02B4A9: DEC.b $11

#_02B4AB: INC.b $B0

#_02B4AD: RTS

;===================================================================================================

Module09_2E_09_LoadPalettes:
#_02B4AE: STZ.w $0AA9

#_02B4B1: JSL Palettes_Load_SpriteMain
#_02B4B5: JSL Palettes_Load_SpriteEnvironment
#_02B4B9: JSL Palettes_Load_SpritePal0Left
#_02B4BD: JSL Palettes_Load_HUD
#_02B4C1: JSL Palettes_Load_OWBGMain

#_02B4C5: LDX.b $8A

#_02B4C7: LDA.l $7EFD40,X
#_02B4CB: STA.b $00

#_02B4CD: LDA.l OverworldPalettesScreenToSet,X
#_02B4D1: JSL OverworldPalettesLoader
#_02B4D5: JSL Overworld_SetScreenBGColor
#_02B4D9: JSL Overworld_SetFixedColAndScroll
#_02B4DD: JSL LoadNewSpriteGFXSet

;===================================================================================================

Whirlpool_SetFixedColor:
#_02B4E1: LDA.b #$80 ; No green
#_02B4E3: STA.b $9E

;===================================================================================================

Whirlpool_SetBrightness:
#_02B4E5: LDA.b #$0F
#_02B4E7: STA.b $13

;===================================================================================================

Whirlpool_Advance:
#_02B4E9: INC.w $0710
#_02B4EC: INC.b $B0

#_02B4EE: RTS

;===================================================================================================

Module09_2E_0C_FinalizeWarp:
#_02B4EF: LDA.b #$90
#_02B4F1: STA.w $031F

#_02B4F4: JSL ReloadPreviouslyLoadedSheets

#_02B4F8: LDA.b #$80
#_02B4FA: STA.b $9B

#_02B4FC: LDX.b $8A

#_02B4FE: LDA.l $7F5B00,X
#_02B502: LSR A
#_02B503: LSR A
#_02B504: LSR A
#_02B505: LSR A
#_02B506: STA.w $012D

#_02B509: LDX.b #$02 ; SONG 02

#_02B50B: LDA.l $7EF3CA
#_02B50F: BEQ .not_dark_world

#_02B511: LDX.b #$09 ; SONG 09

.not_dark_world
#_02B513: STX.w $012C

#_02B516: STZ.b $11
#_02B518: STZ.b $B0

#_02B51A: STZ.w $0200
#_02B51D: STZ.w $0710

#_02B520: RTS

;===================================================================================================

Module09_2F:
#_02B521: JSL Overworld_CreateTRPortal

#_02B525: STZ.b $11

#_02B527: RTS

;===================================================================================================

Module09_2A_RecoverFromDrowning:
#_02B528: LDA.b $B0
#_02B52A: JSL JumpTableLocal
#_02B52E: dw Module09_2A_00_ScrollToLand
#_02B530: dw RecoverPositionAfterDrowning

;===================================================================================================

Module09_2A_00_ScrollToLand:
#_02B532: REP #$20

#_02B534: STZ.b $00
#_02B536: STZ.b $02

#_02B538: LDA.b $22
#_02B53A: CMP.l $7EC186
#_02B53E: BEQ .set_x
#_02B540: BCC .x_low

#_02B542: DEC.b $02

#_02B544: DEC A
#_02B545: CMP.l $7EC186
#_02B549: BEQ .set_x

#_02B54B: DEC.b $02

#_02B54D: DEC A

#_02B54E: BRA .set_x

;---------------------------------------------------------------------------------------------------

.x_low
#_02B550: INC.b $02

#_02B552: INC A
#_02B553: CMP.l $7EC186
#_02B557: BEQ .set_x

#_02B559: INC.b $02
#_02B55B: INC A

.set_x
#_02B55C: STA.b $22

;---------------------------------------------------------------------------------------------------

#_02B55E: LDA.b $20
#_02B560: CMP.l $7EC184
#_02B564: BEQ .set_y
#_02B566: BCC .y_low

#_02B568: DEC.b $00

#_02B56A: DEC A
#_02B56B: CMP.l $7EC184
#_02B56F: BEQ .set_y

#_02B571: DEC.b $00

#_02B573: DEC A

#_02B574: BRA .set_y

;---------------------------------------------------------------------------------------------------

.y_low
#_02B576: INC.b $00

#_02B578: INC A
#_02B579: CMP.l $7EC184
#_02B57D: BEQ .set_y

#_02B57F: INC.b $00
#_02B581: INC A

.set_y
#_02B582: STA.b $20

;---------------------------------------------------------------------------------------------------

#_02B584: CMP.l $7EC184
#_02B588: BNE .delay_advance

#_02B58A: LDA.b $22
#_02B58C: CMP.l $7EC186
#_02B590: BNE .delay_advance

#_02B592: INC.b $B0

#_02B594: STZ.b $46

.delay_advance
#_02B596: SEP #$20

#_02B598: LDA.b $00
#_02B59A: STA.b $30

#_02B59C: LDA.b $02
#_02B59E: STA.b $31

#_02B5A0: JSR Overworld_OperateCameraScroll

#_02B5A3: LDA.w $0416
#_02B5A6: BEQ .exit

#_02B5A8: JSR OverworldHandleMapScroll

.exit
#_02B5AB: RTS

;===================================================================================================

RoomQuadrantLayoutValues:
#_02B5AC: db $0F ; xxxx - 0 NW
#_02B5AD: db $0F ; xxxx - 0 NE
#_02B5AE: db $0F ; xxxx - 0 SW
#_02B5AF: db $0F ; xxxx - 0 SE
#_02B5B0: db $0B ; x.xx - 1 NW
#_02B5B1: db $0B ; x.xx - 1 NE
#_02B5B2: db $07 ; .xxx - 1 SW
#_02B5B3: db $07 ; .xxx - 1 SE
#_02B5B4: db $0F ; xxxx - 2 NW
#_02B5B5: db $0B ; x.xx - 2 NE
#_02B5B6: db $0F ; xxxx - 2 SW
#_02B5B7: db $07 ; .xxx - 2 SE
#_02B5B8: db $0B ; x.xx - 3 NW
#_02B5B9: db $0F ; xxxx - 3 NE
#_02B5BA: db $07 ; .xxx - 3 SW
#_02B5BB: db $0F ; xxxx - 3 SE
#_02B5BC: db $0E ; xxx. - 4 NW
#_02B5BD: db $0D ; xx.x - 4 NE
#_02B5BE: db $0E ; xxx. - 4 SW
#_02B5BF: db $0D ; xx.x - 4 SE
#_02B5C0: db $0F ; xxxx - 5 NW
#_02B5C1: db $0F ; xxxx - 5 NE
#_02B5C2: db $0E ; xxx. - 5 SW
#_02B5C3: db $0D ; xx.x - 5 SE
#_02B5C4: db $0E ; xxx. - 6 NW
#_02B5C5: db $0D ; xx.x - 6 NE
#_02B5C6: db $0F ; xxxx - 6 SW
#_02B5C7: db $0F ; xxxx - 6 SE
#_02B5C8: db $0A ; x.x. - 7 NW
#_02B5C9: db $09 ; x..x - 7 NE
#_02B5CA: db $06 ; .xx. - 7 SW
#_02B5CB: db $05 ; .x.x - 7 SE

;===================================================================================================

QuadrantLayoutFlagBitfield:
#_02B5CC: db $08, $04, $02, $01, $0C, $0C, $03, $03
#_02B5D4: db $0A, $05, $0A, $05, $0F, $0F, $0F, $0F

;===================================================================================================

Underworld_AdjustForRoomLayout:
#_02B5DC: PHB
#_02B5DD: PHK
#_02B5DE: PLB

#_02B5DF: SEP #$30

#_02B5E1: JSR Underworld_AdjustQuadrant

#_02B5E4: STZ.b $A6

#_02B5E6: LDY.b #$02

#_02B5E8: LDA.b $A9
#_02B5EA: BNE .right_side

#_02B5EC: LDY.b #$01

.right_side
#_02B5EE: STY.b $00

#_02B5F0: LDA.w $0452
#_02B5F3: BNE .from_wall

#_02B5F5: LDX.b $A8

#_02B5F7: LDA.w RoomQuadrantLayoutValues,X
#_02B5FA: AND.b $00
#_02B5FC: BNE .small_horizontally

.from_wall
#_02B5FE: LDA.b #$02
#_02B600: STA.b $A6

.small_horizontally
#_02B602: STZ.b $A7

#_02B604: LDY.b #$08
#_02B606: LDA.b $AA
#_02B608: BNE .bottom_side

#_02B60A: LDY.b #$04

.bottom_side
#_02B60C: STY.b $00

#_02B60E: LDA.w $0453
#_02B611: BNE .blast_wall_makes_tall

#_02B613: LDX.b $A8
#_02B615: LDA.w RoomQuadrantLayoutValues,X
#_02B618: AND.b $00
#_02B61A: BNE .small_vertically

.blast_wall_makes_tall
#_02B61C: LDA.b #$02
#_02B61E: STA.b $A7

.small_vertically
#_02B620: LDA.b $FC
#_02B622: BEQ .blast_wall_not_wide

#_02B624: STA.b $A6

.blast_wall_not_wide
#_02B626: LDA.b $FD
#_02B628: BEQ .exit

#_02B62A: STA.b $A7

.exit
#_02B62C: PLB

#_02B62D: RTL

;===================================================================================================

HandleEdgeTransitionMovementEast_RightBy8:
#_02B62E: REP #$20

#_02B630: LDA.b $22
#_02B632: CLC
#_02B633: ADC.w #$0008
#_02B636: STA.b $22

#_02B638: SEP #$20

;===================================================================================================

HandleEdgeTransitionMovementEast:
#_02B63A: PHB
#_02B63B: PHK
#_02B63C: PLB

#_02B63D: LDA.b $A9
#_02B63F: EOR.b #$01
#_02B641: STA.b $A9

#_02B643: JSR Underworld_AdjustQuadrant

#_02B646: LDX.b #$08

#_02B648: JSR AdjustCameraBoundaries_DownOrRightQuadrant
#_02B64B: JSR Underworld_SaveRoomData

#_02B64E: LDA.b $A9
#_02B650: JSR UnderworldTransition_AdjustCamera_Horizontal

#_02B653: LDY.b #$02
#_02B655: JSR HandleEdgeTransition_AdjustCameraBoundaries

#_02B658: INC.b $11

#_02B65A: LDA.b $A9
#_02B65C: BNE .continue

#_02B65E: LDX.b #$08
#_02B660: JSR AdjustCameraBoundaries_DownOrRightWholeRoom

#_02B663: LDA.b $A0
#_02B665: STA.b $A2

#_02B667: LDA.w $0114
#_02B66A: AND.b #$CF
#_02B66C: CMP.b #$89 ; TILETYPE 89
#_02B66E: BNE .not_teleport_door

#_02B670: LDA.l $7EC004
#_02B674: STA.b $A0

#_02B676: DEC A

#_02B677: LDY.b #$01
#_02B679: JSR Underworld_AdjustForTeleportDoors

#_02B67C: BRA .continue_from_tele

;---------------------------------------------------------------------------------------------------

.not_teleport_door
#_02B67E: LDA.w $048E
#_02B681: CMP.b $A0
#_02B683: BEQ .room_id_matches

#_02B685: STA.b $A2

#_02B687: JSR Underworld_AdjustCameraArbitrary

.room_id_matches
#_02B68A: INC.b $A0

;---------------------------------------------------------------------------------------------------

.continue_from_tele
#_02B68C: INC.b $11

#_02B68E: LDA.b $EF
#_02B690: AND.b #$01
#_02B692: BEQ .no_layer_swap

#_02B694: LDA.b $EE
#_02B696: EOR.b #$01
#_02B698: STA.b $EE
#_02B69A: STA.w $0476

.no_layer_swap
#_02B69D: LDA.b $EF
#_02B69F: AND.b #$02
#_02B6A1: BEQ .continue

#_02B6A3: LDA.w $040C
#_02B6A6: EOR.b #$02
#_02B6A8: STA.w $040C

;---------------------------------------------------------------------------------------------------

.continue
#_02B6AB: STZ.b $EF

#_02B6AD: STZ.b $A7

#_02B6AF: LDY.b #$08

#_02B6B1: LDA.b $AA
#_02B6B3: BNE .on_lower_half

#_02B6B5: LDY.b #$04

.on_lower_half
#_02B6B7: STY.b $00

#_02B6B9: LDA.w $0453
#_02B6BC: BNE .set_layout

#_02B6BE: LDX.b $A8

#_02B6C0: LDA.w RoomQuadrantLayoutValues,X
#_02B6C3: AND.b $00
#_02B6C5: BNE .exit

.set_layout
#_02B6C7: LDA.b #$02
#_02B6C9: STA.b $A7

.exit
#_02B6CB: PLB

#_02B6CC: RTL

;===================================================================================================

HandleEdgeTransitionMovementWest_LeftBy8:
#_02B6CD: REP #$20

#_02B6CF: LDA.b $22
#_02B6D1: SEC
#_02B6D2: SBC.w #$0008
#_02B6D5: STA.b $22

#_02B6D7: SEP #$20

;===================================================================================================

HandleEdgeTransitionMovementWest:
#_02B6D9: PHB
#_02B6DA: PHK
#_02B6DB: PLB

#_02B6DC: LDA.b $A9
#_02B6DE: EOR.b #$01
#_02B6E0: STA.b $A9

#_02B6E2: JSR Underworld_AdjustQuadrant

#_02B6E5: LDX.b #$08
#_02B6E7: JSR AdjustCameraBoundaries_UpOrLeftQuadrant

#_02B6EA: JSR Underworld_SaveRoomData

#_02B6ED: LDA.b $A9
#_02B6EF: EOR.b #$01
#_02B6F1: JSR UnderworldTransition_AdjustCamera_Horizontal

#_02B6F4: LDY.b #$03
#_02B6F6: JSR HandleEdgeTransition_AdjustCameraBoundaries

#_02B6F9: INC.b $11

#_02B6FB: LDA.b $A9
#_02B6FD: BEQ .continue

#_02B6FF: LDX.b #$08
#_02B701: JSR AdjustCameraBoundaries_UpOrLeftWholeRoom

#_02B704: LDA.b $A0
#_02B706: STA.b $A2

#_02B708: LDA.w $0114
#_02B70B: AND.b #$CF
#_02B70D: CMP.b #$89 ; TILETYPE 89
#_02B70F: BNE .not_teleport_door

#_02B711: LDA.l $7EC003
#_02B715: STA.b $A0

#_02B717: INC A

#_02B718: LDY.b #$FF
#_02B71A: JSR Underworld_AdjustForTeleportDoors

#_02B71D: BRA .continue_from_tele

;---------------------------------------------------------------------------------------------------

.not_teleport_door
#_02B71F: LDA.w $048E
#_02B722: CMP.b $A0
#_02B724: BEQ .room_id_matches

#_02B726: STA.b $A2

#_02B728: JSR Underworld_AdjustCameraArbitrary

.room_id_matches
#_02B72B: DEC.b $A0

;---------------------------------------------------------------------------------------------------

.continue_from_tele
#_02B72D: INC.b $11

#_02B72F: LDA.b $EF
#_02B731: AND.b #$01
#_02B733: BEQ .no_layer_swap

#_02B735: LDA.b $EE
#_02B737: EOR.b #$01
#_02B739: STA.b $EE
#_02B73B: STA.w $0476

.no_layer_swap
#_02B73E: LDA.b $EF
#_02B740: AND.b #$02
#_02B742: BEQ .continue

#_02B744: LDA.w $040C
#_02B747: EOR.b #$02
#_02B749: STA.w $040C

;---------------------------------------------------------------------------------------------------

.continue
#_02B74C: STZ.b $EF
#_02B74E: STZ.b $A7

#_02B750: LDY.b #$08

#_02B752: LDA.b $AA
#_02B754: BNE .on_lower_half

#_02B756: LDY.b #$04

.on_lower_half
#_02B758: STY.b $00

#_02B75A: LDA.w $0453
#_02B75D: BNE .set_layout

#_02B75F: LDX.b $A8

#_02B761: LDA.w RoomQuadrantLayoutValues,X
#_02B764: AND.b $00
#_02B766: BNE .exit

.set_layout
#_02B768: LDA.b #$02
#_02B76A: STA.b $A7

.exit
#_02B76C: PLB

#_02B76D: RTL

;===================================================================================================

HandleEdgeTransitionMovementSouth_DownBy16:
#_02B76E: REP #$20

#_02B770: LDA.b $20
#_02B772: CLC
#_02B773: ADC.w #$0010
#_02B776: STA.b $20

#_02B778: SEP #$20

;===================================================================================================

HandleEdgeTransitionMovementSouth:
#_02B77A: PHB
#_02B77B: PHK
#_02B77C: PLB

#_02B77D: LDA.b $AA
#_02B77F: EOR.b #$02
#_02B781: STA.b $AA

#_02B783: JSR Underworld_AdjustQuadrant

#_02B786: LDX.b #$00
#_02B788: JSR AdjustCameraBoundaries_DownOrRightQuadrant

#_02B78B: JSR Underworld_SaveRoomData

#_02B78E: LDA.b $AA
#_02B790: JSR UnderworldTransition_AdjustCamera_Vertical

#_02B793: LDY.b #$00
#_02B795: JSR HandleEdgeTransition_AdjustCameraBoundaries

#_02B798: INC.b $11

#_02B79A: LDA.b $AA
#_02B79C: BNE .continue

#_02B79E: LDX.b #$00
#_02B7A0: JSR AdjustCameraBoundaries_DownOrRightWholeRoom

#_02B7A3: LDA.b $A0
#_02B7A5: STA.b $A2

#_02B7A7: LDA.w $0114
#_02B7AA: CMP.b #$8E ; TILETYPE 8E
#_02B7AC: BNE .not_entrance

;===================================================================================================

#PrepForOverworldExit:
#_02B7AE: JSL SaveDungeonKeys
#_02B7B2: JSL SaveVisitedQuadrantFlags

#_02B7B6: LDA.b #$08
#_02B7B8: STA.w $010C

#_02B7BB: LDA.b #$0F
#_02B7BD: STA.b $10
#_02B7BF: STZ.b $11

#_02B7C1: STZ.b $B0

#_02B7C3: JSR DeleteCertainAncillaeStopDashing

#_02B7C6: PLB

#_02B7C7: RTL

;===================================================================================================

.not_entrance
#_02B7C8: LDA.w $048E
#_02B7CB: CMP.b $A0
#_02B7CD: BEQ .room_id_matches

#_02B7CF: STA.b $A2

#_02B7D1: JSR Underworld_AdjustCameraArbitrary

.room_id_matches
#_02B7D4: LDA.b $A0
#_02B7D6: CLC
#_02B7D7: ADC.b #$10
#_02B7D9: STA.b $A0

#_02B7DB: INC.b $11

#_02B7DD: LDA.b $EF
#_02B7DF: AND.b #$01
#_02B7E1: BEQ .no_layer_swap

#_02B7E3: LDA.b $EE
#_02B7E5: EOR.b #$01
#_02B7E7: STA.b $EE
#_02B7E9: STA.w $0476

.no_layer_swap
#_02B7EC: LDA.b $EF
#_02B7EE: AND.b #$02
#_02B7F0: BEQ .continue

#_02B7F2: LDA.w $040C
#_02B7F5: EOR.b #$02
#_02B7F7: STA.w $040C

.continue
#_02B7FA: STZ.b $EF
#_02B7FC: STZ.b $A6

#_02B7FE: LDY.b #$02
#_02B800: LDA.b $A9
#_02B802: BNE .on_east_side

#_02B804: LDY.b #$01

.on_east_side
#_02B806: STY.b $00

#_02B808: LDA.w $0452
#_02B80B: BNE .set_layout

#_02B80D: LDX.b $A8

#_02B80F: LDA.w RoomQuadrantLayoutValues,X
#_02B812: AND.b $00
#_02B814: BNE .exit

.set_layout
#_02B816: LDA.b #$02
#_02B818: STA.b $A6

.exit
#_02B81A: PLB

#_02B81B: RTL

;===================================================================================================

HandleEdgeTransitionMovementNorth:
#_02B81C: PHB
#_02B81D: PHK
#_02B81E: PLB

#_02B81F: LDA.b $AA
#_02B821: EOR.b #$02
#_02B823: STA.b $AA

#_02B825: JSR Underworld_AdjustQuadrant

#_02B828: LDX.b #$00
#_02B82A: JSR AdjustCameraBoundaries_UpOrLeftQuadrant

#_02B82D: JSR Underworld_SaveRoomData

#_02B830: LDA.b $AA
#_02B832: EOR.b #$02
#_02B834: JSR UnderworldTransition_AdjustCamera_Vertical

#_02B837: LDY.b #$01
#_02B839: JSR HandleEdgeTransition_AdjustCameraBoundaries

#_02B83C: INC.b $11

#_02B83E: LDA.b $AA
#_02B840: BEQ .continue

#_02B842: LDX.b #$00
#_02B844: JSR AdjustCameraBoundaries_UpOrLeftWholeRoom

#_02B847: LDA.b $A0
#_02B849: STA.b $A2

#_02B84B: LDA.w $0114
#_02B84E: CMP.b #$8E ; TILETYPE 8E
#_02B850: BNE .not_entrance

#_02B852: JMP.w PrepForOverworldExit

.not_entrance
#_02B855: LDA.b $A0 ; ROOM 0000
#_02B857: ORA.b $A1
#_02B859: BNE .not_ganon_room

#_02B85B: JSL SaveDungeonKeys

#_02B85F: LDA.b #$19
#_02B861: STA.b $10
#_02B863: STZ.b $11

#_02B865: STZ.b $B0

#_02B867: PLB

#_02B868: RTL

;---------------------------------------------------------------------------------------------------

.not_ganon_room
#_02B869: LDA.w $048E
#_02B86C: CMP.b $A0
#_02B86E: BEQ .room_id_matches

#_02B870: STA.b $A2

#_02B872: JSR Underworld_AdjustCameraArbitrary

.room_id_matches
#_02B875: LDA.b $A0
#_02B877: SEC
#_02B878: SBC.b #$10
#_02B87A: STA.b $A0

#_02B87C: INC.b $11

#_02B87E: LDA.b $EF
#_02B880: AND.b #$01
#_02B882: BEQ .no_layer_swap

#_02B884: LDA.b $EE
#_02B886: EOR.b #$01
#_02B888: STA.b $EE
#_02B88A: STA.w $0476

.no_layer_swap
#_02B88D: LDA.b $EF
#_02B88F: AND.b #$02
#_02B891: BEQ .continue

#_02B893: LDA.w $040C
#_02B896: EOR.b #$02
#_02B898: STA.w $040C

.continue
#_02B89B: STZ.b $EF
#_02B89D: STZ.b $A6

#_02B89F: LDY.b #$02
#_02B8A1: LDA.b $A9
#_02B8A3: BNE .on_east_side

#_02B8A5: LDY.b #$01

.on_east_side
#_02B8A7: STY.b $00

#_02B8A9: LDA.w $0452
#_02B8AC: BNE .set_layout

#_02B8AE: LDX.b $A8

#_02B8B0: LDA.w RoomQuadrantLayoutValues,X
#_02B8B3: AND.b $00
#_02B8B5: BNE .exit

.set_layout
#_02B8B7: LDA.b #$02
#_02B8B9: STA.b $A6

.exit
#_02B8BB: PLB

#_02B8BC: RTL

;===================================================================================================

AdjustQuadrantAndCamera_right:
#_02B8BD: LDA.b $A9
#_02B8BF: EOR.b #$01
#_02B8C1: STA.b $A9

#_02B8C3: JSR Underworld_AdjustQuadrant

#_02B8C6: LDX.b #$08
#_02B8C8: JSR AdjustCameraBoundaries_DownOrRightQuadrant

;===================================================================================================

SetAndSaveVisitedQuadrantFlags:
#_02B8CB: LDA.b $A7
#_02B8CD: ASL A
#_02B8CE: ASL A
#_02B8CF: STA.b $00

#_02B8D1: LDA.b $A6
#_02B8D3: ASL A
#_02B8D4: ORA.b $00
#_02B8D6: ORA.b $AA
#_02B8D8: ORA.b $A9
#_02B8DA: TAX

#_02B8DB: LDA.l QuadrantLayoutFlagBitfield,X
#_02B8DF: ORA.w $0408
#_02B8E2: STA.w $0408

;===================================================================================================

SaveVisitedQuadrantFlags:
#_02B8E5: REP #$30

#_02B8E7: LDA.b $A0
#_02B8E9: ASL A
#_02B8EA: TAX

#_02B8EB: LDA.l $7EF000,X
#_02B8EF: ORA.w $0408
#_02B8F2: STA.l $7EF000,X

#_02B8F6: SEP #$30

#_02B8F8: RTL

;===================================================================================================

AdjustQuadrantAndCamera_left:
#_02B8F9: LDA.b $A9
#_02B8FB: EOR.b #$01
#_02B8FD: STA.b $A9

#_02B8FF: JSR Underworld_AdjustQuadrant

#_02B902: LDX.b #$08
#_02B904: JSR AdjustCameraBoundaries_UpOrLeftQuadrant

#_02B907: BRA SetAndSaveVisitedQuadrantFlags

;===================================================================================================

AdjustQuadrantAndCamera_down:
#_02B909: LDA.b $AA
#_02B90B: EOR.b #$02
#_02B90D: STA.b $AA

#_02B90F: JSR Underworld_AdjustQuadrant

#_02B912: LDX.b #$00
#_02B914: JSR AdjustCameraBoundaries_DownOrRightQuadrant

#_02B917: BRA SetAndSaveVisitedQuadrantFlags

;===================================================================================================

AdjustQuadrantAndCamera_up:
#_02B919: LDA.b $AA
#_02B91B: EOR.b #$02
#_02B91D: STA.b $AA

#_02B91F: JSR Underworld_AdjustQuadrant

#_02B922: LDX.b #$00
#_02B924: JSR AdjustCameraBoundaries_UpOrLeftQuadrant

#_02B927: BRA SetAndSaveVisitedQuadrantFlags

;===================================================================================================

Underworld_FlagRoomData_Quadrants:
#_02B929: LDA.b $A7
#_02B92B: ASL A
#_02B92C: ASL A
#_02B92D: STA.b $00

#_02B92F: LDA.b $A6
#_02B931: ASL A
#_02B932: ORA.b $00
#_02B934: ORA.b $AA
#_02B936: ORA.b $A9
#_02B938: TAX

#_02B939: LDA.l QuadrantLayoutFlagBitfield,X
#_02B93D: ORA.w $0408
#_02B940: STA.w $0408

#_02B943: JSR Underworld_SaveRoomData

#_02B946: RTL

;===================================================================================================

Underworld_SaveRoomData:
#_02B947: REP #$30

#_02B949: LDA.b $A0
#_02B94B: ASL A
#_02B94C: TAX

#_02B94D: LDA.w $0402
#_02B950: LSR A
#_02B951: LSR A
#_02B952: LSR A
#_02B953: LSR A
#_02B954: STA.b $06

#_02B956: LDA.w $0400
#_02B959: AND.w #$F000

#_02B95C: ORA.w $0408
#_02B95F: ORA.b $06

#_02B961: STA.l $7EF000,X

#_02B965: SEP #$30

#_02B967: RTS

;===================================================================================================

AdjustCameraBoundaries_DownOrRightQuadrant:
#_02B968: REP #$20

#_02B96A: LDA.w $0600,X
#_02B96D: CLC
#_02B96E: ADC.w #$0100
#_02B971: STA.w $0600,X

#_02B974: LDA.w $0604,X
#_02B977: CLC
#_02B978: ADC.w #$0100
#_02B97B: STA.w $0604,X

#_02B97E: SEP #$20

#_02B980: RTS

;===================================================================================================

AdjustCameraBoundaries_DownOrRightWholeRoom:
#_02B981: REP #$20

#_02B983: LDA.w $0602,X
#_02B986: CLC
#_02B987: ADC.w #$0200
#_02B98A: STA.w $0602,X

#_02B98D: LDA.w $0606,X
#_02B990: CLC
#_02B991: ADC.w #$0200
#_02B994: STA.w $0606,X

#_02B997: SEP #$20

#_02B999: RTS

;===================================================================================================

AdjustCameraBoundaries_UpOrLeftQuadrant:
#_02B99A: REP #$20

#_02B99C: LDA.w $0600,X
#_02B99F: SEC
#_02B9A0: SBC.w #$0100
#_02B9A3: STA.w $0600,X

#_02B9A6: LDA.w $0604,X
#_02B9A9: SEC
#_02B9AA: SBC.w #$0100
#_02B9AD: STA.w $0604,X

#_02B9B0: SEP #$20

#_02B9B2: RTS

;===================================================================================================

AdjustCameraBoundaries_UpOrLeftWholeRoom:
#_02B9B3: REP #$20

#_02B9B5: LDA.w $0602,X
#_02B9B8: SEC
#_02B9B9: SBC.w #$0200
#_02B9BC: STA.w $0602,X

#_02B9BF: LDA.w $0606,X
#_02B9C2: SEC
#_02B9C3: SBC.w #$0200
#_02B9C6: STA.w $0606,X

#_02B9C9: SEP #$20

#_02B9CB: RTS

;===================================================================================================

pool HandleEdgeTransition_AdjustCameraBoundaries

.vertical_boundaries
#_02B9CC: dw $0078
#_02B9CE: dw $0178
#_02B9D0: dw $0088
#_02B9D2: dw $0188

.horizontal_boundaries
#_02B9D4: dw $007F
#_02B9D6: dw $017F
#_02B9D8: dw $007F
#_02B9DA: dw $017F

pool off

;---------------------------------------------------------------------------------------------------

HandleEdgeTransition_AdjustCameraBoundaries:
#_02B9DC: STY.w $0418

#_02B9DF: LDA.b $67
#_02B9E1: AND.b #$03
#_02B9E3: BEQ .nothorizontal

#_02B9E5: REP #$20

#_02B9E7: LDX.b #$04

#_02B9E9: LDA.b $67
#_02B9EB: AND.w #$0001
#_02B9EE: BEQ .not_right

#_02B9F0: LDX.b #$00

.not_right
#_02B9F2: LDY.b $A9
#_02B9F4: BEQ .west_side

#_02B9F6: INX
#_02B9F7: INX

.west_side
#_02B9F8: LDA.w .horizontal_boundaries,X
#_02B9FB: STA.w $061C

#_02B9FE: INC A
#_02B9FF: INC A
#_02BA00: STA.w $061E

#_02BA03: SEP #$20

#_02BA05: RTS

;---------------------------------------------------------------------------------------------------

.nothorizontal
#_02BA06: REP #$20

#_02BA08: LDX.b #$04

#_02BA0A: LDA.b $67
#_02BA0C: AND.w #$0004
#_02BA0F: BEQ .not_down

#_02BA11: LDX.b #$00

.not_down
#_02BA13: LDY.b $AA
#_02BA15: BEQ .upper_quadrant

#_02BA17: INX
#_02BA18: INX

.upper_quadrant
#_02BA19: LDA.w .vertical_boundaries,X
#_02BA1C: STA.w $0618

#_02BA1F: INC A
#_02BA20: INC A
#_02BA21: STA.w $061A

#_02BA24: SEP #$20

#_02BA26: RTS

;===================================================================================================

Underworld_AdjustQuadrant:
#_02BA27: LDA.w $040E
#_02BA2A: ORA.b $AA
#_02BA2C: ORA.b $A9
#_02BA2E: STA.b $A8

#_02BA30: RTS

;===================================================================================================

Underworld_HandleCamera:
#_02BA31: REP #$20

#_02BA33: LDA.w #$0001
#_02BA36: STA.b $00

#_02BA38: LDA.b $78
#_02BA3A: AND.w #$00FF
#_02BA3D: BEQ .dont_zero

#_02BA3F: LDA.b $24
#_02BA41: CMP.w #$FFFF
#_02BA44: BNE .dont_zero

#_02BA46: LDA.w #$0000

.dont_zero
#_02BA49: STA.b $0E

#_02BA4B: LDA.b $20
#_02BA4D: SEC
#_02BA4E: SBC.b $0E
#_02BA50: AND.w #$01FF

#_02BA53: CLC
#_02BA54: ADC.w #$000C
#_02BA57: STA.b $0E

;---------------------------------------------------------------------------------------------------

#_02BA59: LDA.b $30
#_02BA5B: AND.w #$00FF
#_02BA5E: BEQ .no_vertical_movement

#_02BA60: LDX.b $A7
#_02BA62: CMP.w #$0080
#_02BA65: BCC .moving_down_a

#_02BA67: EOR.w #$00FF
#_02BA6A: INC A

#_02BA6B: DEC.b $00
#_02BA6D: DEC.b $00

.moving_down_a
#_02BA6F: TAY

;---------------------------------------------------------------------------------------------------

.next_vertical
#_02BA70: LDX.b $A7

#_02BA72: LDA.b $30
#_02BA74: AND.w #$00FF
#_02BA77: CMP.w #$0080
#_02BA7A: BCC .moving_down_b

#_02BA7C: LDA.w $0618
#_02BA7F: CMP.b $0E
#_02BA81: BCS .continue_vertically
#_02BA83: BCC .dont_scroll_vertically

.moving_down_b
#_02BA85: LDA.b $0E
#_02BA87: CMP.w $061A
#_02BA8A: BCC .dont_scroll_vertically

#_02BA8C: INX
#_02BA8D: INX
#_02BA8E: INX
#_02BA8F: INX

.continue_vertically
#_02BA90: LDA.b $E8
#_02BA92: CMP.w $0600,X
#_02BA95: BEQ .dont_scroll_vertically

#_02BA97: CLC
#_02BA98: ADC.b $00
#_02BA9A: STA.b $E8

#_02BA9C: LDA.b $A0
#_02BA9E: CMP.w #$FFFF
#_02BAA1: BEQ .dont_scroll_vertically

#_02BAA3: LDA.b $00
#_02BAA5: STZ.b $04
#_02BAA7: LSR A
#_02BAA8: ROR.b $04

#_02BAAA: CMP.w #$7000
#_02BAAD: BCC .dont_invert_vertically

#_02BAAF: ORA.w #$F000

.dont_invert_vertically
#_02BAB2: STA.b $06

#_02BAB4: LDA.w $0622
#_02BAB7: CLC
#_02BAB8: ADC.b $04
#_02BABA: STA.w $0622

#_02BABD: LDA.b $E6
#_02BABF: ADC.b $06
#_02BAC1: STA.b $E6

#_02BAC3: LDA.w $0618
#_02BAC6: CLC
#_02BAC7: ADC.b $00
#_02BAC9: STA.w $0618

#_02BACC: INC A
#_02BACD: INC A
#_02BACE: STA.w $061A

.dont_scroll_vertically
#_02BAD1: DEY
#_02BAD2: BNE .next_vertical

;---------------------------------------------------------------------------------------------------

.no_vertical_movement
#_02BAD4: LDA.w #$0001
#_02BAD7: STA.b $00

#_02BAD9: LDA.b $22
#_02BADB: AND.w #$01FF
#_02BADE: CLC
#_02BADF: ADC.w #$0008
#_02BAE2: STA.b $0E

#_02BAE4: LDA.b $31
#_02BAE6: AND.w #$00FF
#_02BAE9: BEQ .no_horizontal_scroll

#_02BAEB: LDX.b $A6
#_02BAED: CMP.w #$0080
#_02BAF0: BCC .moving_right_a

#_02BAF2: EOR.w #$00FF
#_02BAF5: INC A
#_02BAF6: DEC.b $00
#_02BAF8: DEC.b $00

.moving_right_a
#_02BAFA: TAY

;---------------------------------------------------------------------------------------------------

.next_horizontal
#_02BAFB: LDX.b $A6

#_02BAFD: LDA.b $31
#_02BAFF: AND.w #$00FF
#_02BB02: CMP.w #$0080
#_02BB05: BCC .moving_right_b

#_02BB07: LDA.w $061C
#_02BB0A: CMP.b $0E
#_02BB0C: BCS .continue_horizontally
#_02BB0E: BCC .dont_scroll_horizontally

.moving_right_b
#_02BB10: LDA.b $0E
#_02BB12: CMP.w $061E
#_02BB15: BCC .dont_scroll_horizontally

#_02BB17: INX
#_02BB18: INX
#_02BB19: INX
#_02BB1A: INX

.continue_horizontally
#_02BB1B: LDA.b $E2
#_02BB1D: CMP.w $0608,X
#_02BB20: BEQ .dont_scroll_horizontally

#_02BB22: CLC
#_02BB23: ADC.b $00
#_02BB25: STA.b $E2

#_02BB27: LDA.b $A0
#_02BB29: CMP.w #$FFFF
#_02BB2C: BEQ .dont_scroll_horizontally

#_02BB2E: LDA.b $00
#_02BB30: STZ.b $04

#_02BB32: LSR A
#_02BB33: ROR.b $04
#_02BB35: CMP.w #$7000
#_02BB38: BCC .dont_invert_horizontally

#_02BB3A: ORA.w #$F000

;---------------------------------------------------------------------------------------------------

.dont_invert_horizontally
#_02BB3D: STA.b $06

#_02BB3F: LDA.w $0620
#_02BB42: CLC
#_02BB43: ADC.b $04
#_02BB45: STA.w $0620

#_02BB48: LDA.b $E0
#_02BB4A: ADC.b $06
#_02BB4C: STA.b $E0

#_02BB4E: LDA.w $061C
#_02BB51: CLC
#_02BB52: ADC.b $00
#_02BB54: STA.w $061C

#_02BB57: INC A
#_02BB58: INC A
#_02BB59: STA.w $061E

.dont_scroll_horizontally
#_02BB5C: DEY
#_02BB5D: BNE .next_horizontal

;---------------------------------------------------------------------------------------------------

.no_horizontal_scroll
#_02BB5F: LDA.b $A0
#_02BB61: CMP.w #$FFFF
#_02BB64: BEQ .exit

#_02BB66: LDX.w $0414
#_02BB69: BEQ UnderworldSyncBG1and2Scroll

#_02BB6B: CPX.b #$06
#_02BB6D: BCS UnderworldSyncBG1and2Scroll

#_02BB6F: CPX.b #$04
#_02BB71: BEQ UnderworldSyncBG1and2Scroll

#_02BB73: CPX.b #$03
#_02BB75: BEQ UnderworldSyncBG1and2Scroll

#_02BB77: CPX.b #$02
#_02BB79: BNE .exit

;===================================================================================================

#UnderworldSyncBG1and2Scroll:
#_02BB7B: REP #$20

#_02BB7D: LDA.b $E2
#_02BB7F: STA.b $E0

#_02BB81: LDA.b $E8
#_02BB83: STA.b $E6

.exit
#_02BB85: SEP #$20

#_02BB87: RTS

;===================================================================================================

OverworldTransitionDirections:
#_02BB88: dw $0008 ; up
#_02BB8A: dw $0004 ; down
#_02BB8C: dw $0002 ; left
#_02BB8E: dw $0001 ; right

;---------------------------------------------------------------------------------------------------

Overworld_OperateCameraScroll:
#_02BB90: PHB
#_02BB91: PHK
#_02BB92: PLB

#_02BB93: REP #$20

#_02BB95: LDA.b $78
#_02BB97: AND.w #$00FF
#_02BB9A: BEQ .not_grounded

#_02BB9C: LDA.b $24
#_02BB9E: CMP.w #$FFFF
#_02BBA1: BNE .not_grounded

#_02BBA3: LDA.w #$0000

.not_grounded
#_02BBA6: STA.b $0E

#_02BBA8: LDA.b $20
#_02BBAA: SEC
#_02BBAB: SBC.b $0E
#_02BBAD: CLC
#_02BBAE: ADC.w #$000C
#_02BBB1: STA.b $0E

#_02BBB3: LDA.w #$0001
#_02BBB6: STA.b $00

#_02BBB8: LDA.b $30
#_02BBBA: AND.w #$00FF
#_02BBBD: BNE .moving_vertically

#_02BBBF: JMP.w .handle_x_camera

.moving_vertically
#_02BBC2: STZ.b $04

#_02BBC4: CMP.w #$0080
#_02BBC7: BCC .positive_vy

#_02BBC9: EOR.w #$00FF
#_02BBCC: INC A

#_02BBCD: DEC.b $00
#_02BBCF: DEC.b $00

.positive_vy
#_02BBD1: STA.b $02

#_02BBD3: STZ.b $08

;---------------------------------------------------------------------------------------------------

.next_camera_shift_y
#_02BBD5: LDA.b $30
#_02BBD7: AND.w #$00FF
#_02BBDA: CMP.w #$0080
#_02BBDD: BCC .positive_vy_2

#_02BBDF: LDA.w $0618
#_02BBE2: CMP.b $0E
#_02BBE4: BCC .skip_camera_check_y

#_02BBE6: LDY.b #$00
#_02BBE8: BRA .check_camera_y

.positive_vy_2
#_02BBEA: LDA.b $0E
#_02BBEC: CMP.w $061A
#_02BBEF: BCC .skip_camera_check_y

#_02BBF1: LDY.b #$02

.check_camera_y
#_02BBF3: LDX.b #$06
#_02BBF5: JSR OverworldCameraBoundaryCheck

.skip_camera_check_y
#_02BBF8: DEC.b $02
#_02BBFA: BNE .next_camera_shift_y

;---------------------------------------------------------------------------------------------------

#_02BBFC: LDA.b $04
#_02BBFE: STA.w $069E

#_02BC01: LDX.b $8C
#_02BC03: CPX.b #$97 ; OW 97
#_02BC05: BEQ .handle_x_camera

#_02BC07: CPX.b #$9D ; OW 9D
#_02BC09: BEQ .handle_x_camera

#_02BC0B: LDA.b $04
#_02BC0D: BEQ .handle_x_camera

#_02BC0F: STZ.b $00
#_02BC11: LSR A
#_02BC12: ROR.b $00

#_02BC14: LDX.b $8C
#_02BC16: CPX.b #$B5 ; OW B5
#_02BC18: BEQ .garbage_overlay

#_02BC1A: CPX.b #$BE ; OW BE
#_02BC1C: BNE .not_garbage_overlay

.garbage_overlay
#_02BC1E: LSR A
#_02BC1F: ROR.b $00
#_02BC21: CMP.w #$3000
#_02BC24: BCC .set_scroll_add_y

#_02BC26: ORA.w #$F000
#_02BC29: BRA .set_scroll_add_y

.not_garbage_overlay
#_02BC2B: CMP.w #$7000
#_02BC2E: BCC .set_scroll_add_y

#_02BC30: ORA.w #$F000

.set_scroll_add_y
#_02BC33: STA.b $06

#_02BC35: LDA.w $0622
#_02BC38: CLC
#_02BC39: ADC.b $00
#_02BC3B: STA.w $0622

#_02BC3E: LDA.b $E6
#_02BC40: ADC.b $06
#_02BC42: STA.b $E6

#_02BC44: LDA.b $8A
#_02BC46: AND.w #$003F
#_02BC49: CMP.w #$001B ; OW 1B, OW 5B
#_02BC4C: BNE .handle_x_camera

#_02BC4E: LDA.w #$0600
#_02BC51: CMP.b $E6
#_02BC53: BCC .camera_too_low_y

#_02BC55: STA.b $E6

.camera_too_low_y
#_02BC57: LDA.w #$06C0
#_02BC5A: CMP.b $E6
#_02BC5C: BCS .handle_x_camera

#_02BC5E: STA.b $E6

;---------------------------------------------------------------------------------------------------

.handle_x_camera
#_02BC60: LDA.b $22
#_02BC62: CLC
#_02BC63: ADC.w #$0008
#_02BC66: STA.b $0E

#_02BC68: LDA.w #$0001
#_02BC6B: STA.b $00

#_02BC6D: LDA.b $31
#_02BC6F: AND.w #$00FF
#_02BC72: BNE .moving_horizontally

#_02BC74: JMP.w OverworldHandleBGOverlayScroll

.moving_horizontally
#_02BC77: STZ.b $04

#_02BC79: CMP.w #$0080
#_02BC7C: BCC .positive_vx

#_02BC7E: EOR.w #$00FF
#_02BC81: INC A

#_02BC82: DEC.b $00
#_02BC84: DEC.b $00

.positive_vx
#_02BC86: STA.b $02

#_02BC88: LDX.b #$04
#_02BC8A: STX.b $08

;---------------------------------------------------------------------------------------------------

.next_camera_shift_x
#_02BC8C: LDA.b $31
#_02BC8E: AND.w #$00FF
#_02BC91: CMP.w #$0080
#_02BC94: BCC .positive_vx_2

#_02BC96: LDA.w $061C
#_02BC99: CMP.b $0E
#_02BC9B: BCC .skip_camera_check_x

#_02BC9D: LDY.b #$04
#_02BC9F: BRA .check_camera_x

.positive_vx_2
#_02BCA1: LDA.b $0E
#_02BCA3: CMP.w $061E
#_02BCA6: BCC .skip_camera_check_x

#_02BCA8: LDY.b #$06

.check_camera_x
#_02BCAA: LDX.b #$00
#_02BCAC: JSR OverworldCameraBoundaryCheck

.skip_camera_check_x
#_02BCAF: DEC.b $02
#_02BCB1: BNE .next_camera_shift_x

;---------------------------------------------------------------------------------------------------

#_02BCB3: LDA.b $04
#_02BCB5: STA.w $069F

#_02BCB8: LDX.b $8C
#_02BCBA: CPX.b #$97 ; OW 97
#_02BCBC: BEQ OverworldHandleBGOverlayScroll

#_02BCBE: CPX.b #$9D ; OW 9D
#_02BCC0: BEQ OverworldHandleBGOverlayScroll

#_02BCC2: LDA.b $04
#_02BCC4: BEQ OverworldHandleBGOverlayScroll

#_02BCC6: STZ.b $00
#_02BCC8: LSR A
#_02BCC9: ROR.b $00

#_02BCCB: LDX.b $8C
#_02BCCD: CPX.b #$95 ; OW 95
#_02BCCF: BEQ .dm_overlay

#_02BCD1: CPX.b #$9E ; OW 9E
#_02BCD3: BNE .not_clear_lw_overlay

.dm_overlay
#_02BCD5: LSR A
#_02BCD6: ROR.b $00
#_02BCD8: CMP.w #$3000
#_02BCDB: BCC .set_scroll_add_x

#_02BCDD: ORA.w #$F000
#_02BCE0: BRA .set_scroll_add_x

.not_clear_lw_overlay
#_02BCE2: CMP.w #$7000
#_02BCE5: BCC .set_scroll_add_x

#_02BCE7: ORA.w #$F000

.set_scroll_add_x
#_02BCEA: STA.b $06

#_02BCEC: LDA.w $0620
#_02BCEF: CLC
#_02BCF0: ADC.b $00
#_02BCF2: STA.w $0620

#_02BCF5: LDA.b $E0
#_02BCF7: ADC.b $06
#_02BCF9: STA.b $E0

;===================================================================================================

OverworldHandleBGOverlayScroll:
#_02BCFB: LDX.b $8A
#_02BCFD: CPX.b #$47 ; OW 47
#_02BCFF: BEQ .no_overlay_scroll

#_02BD01: LDX.b $8C
#_02BD03: CPX.b #$9C ; OW 9C
#_02BD05: BEQ .dark_dm_overlay_scroll

#_02BD07: CPX.b #$97 ; OW 97
#_02BD09: BEQ .grove_fog_scroll

#_02BD0B: CPX.b #$9D ; OW 9D
#_02BD0D: BNE .no_overlay_scroll

.grove_fog_scroll
#_02BD0F: LDA.w $0622
#_02BD12: CLC
#_02BD13: ADC.w #$2000
#_02BD16: STA.w $0622

#_02BD19: LDA.b $E6
#_02BD1B: ADC.w #$0000
#_02BD1E: STA.b $E6

#_02BD20: LDA.w $0620
#_02BD23: CLC
#_02BD24: ADC.w #$2000
#_02BD27: STA.w $0620

#_02BD2A: LDA.b $E0
#_02BD2C: ADC.w #$0000
#_02BD2F: STA.b $E0

#_02BD31: BRA .no_overlay_scroll

.dark_dm_overlay_scroll
#_02BD33: LDA.w $0622
#_02BD36: SEC
#_02BD37: SBC.w #$2000
#_02BD3A: STA.w $0622

#_02BD3D: LDA.b $E6
#_02BD3F: SBC.w #$0000
#_02BD42: CLC
#_02BD43: ADC.w $069E
#_02BD46: STA.b $E6

#_02BD48: LDA.b $E2
#_02BD4A: STA.b $E0

.no_overlay_scroll
#_02BD4C: LDA.b $A0
#_02BD4E: CMP.w #$0181 ; OW 81
#_02BD51: BNE .exit

#_02BD53: LDA.b $E8
#_02BD55: ORA.w #$0100
#_02BD58: STA.b $E6

#_02BD5A: LDA.b $E2
#_02BD5C: STA.b $E0

.exit
#_02BD5E: SEP #$20

#_02BD60: PLB

#_02BD61: RTS

;===================================================================================================

OverworldCameraBoundaryCheck:
#_02BD62: LDA.b $E2,X
#_02BD64: CMP.w $0600,Y
#_02BD67: BNE .not_at_boundary

#_02BD69: TYA
#_02BD6A: EOR.w #$0002
#_02BD6D: TAX

#_02BD6E: LDA.w #$0000
#_02BD71: STA.w $0624,Y
#_02BD74: STA.w $0624,X

#_02BD77: RTS

;---------------------------------------------------------------------------------------------------

.not_at_boundary
#_02BD78: CLC
#_02BD79: ADC.b $00
#_02BD7B: STA.b $E2,X

#_02BD7D: LDA.b $04
#_02BD7F: CLC
#_02BD80: ADC.b $00
#_02BD82: STA.b $04

#_02BD84: LDX.b $08

#_02BD86: LDA.w $061A,X
#_02BD89: CLC
#_02BD8A: ADC.b $00
#_02BD8C: STA.w $061A,X

#_02BD8F: INC A
#_02BD90: INC A
#_02BD91: STA.w $0618,X

#_02BD94: TYA
#_02BD95: EOR.w #$0002
#_02BD98: TAX

#_02BD99: LDA.w $0624,Y
#_02BD9C: INC A
#_02BD9D: STA.w $0624,Y

#_02BDA0: CMP.w #$0010
#_02BDA3: BMI .dont_extend_movement

#_02BDA5: SEC
#_02BDA6: SBC.w #$0010
#_02BDA9: STA.w $0624,Y

#_02BDAC: LDA.w OverworldTransitionDirections,Y
#_02BDAF: ORA.w $0416
#_02BDB2: STA.w $0416

.dont_extend_movement
#_02BDB5: LDA.w #$0000
#_02BDB8: SEC
#_02BDB9: SBC.w $0624,Y
#_02BDBC: STA.w $0624,X

#_02BDBF: RTS

;===================================================================================================

pool UnderworldTransition_AdjustCamera_Horizontal

.boundary
#_02BDC0: dw $0000
#_02BDC2: dw $0100
#_02BDC4: dw $0100
#_02BDC6: dw $0000

pool off

;---------------------------------------------------------------------------------------------------

UnderworldTransition_AdjustCamera_Horizontal:
#_02BDC8: ASL A
#_02BDC9: ASL A
#_02BDCA: TAY

#_02BDCB: LDX.b #$00

.next
#_02BDCD: LDA.w .boundary,Y
#_02BDD0: STA.w $0614,X

#_02BDD3: INY

#_02BDD4: INX
#_02BDD5: CPX.b #$04
#_02BDD7: BNE .next

#_02BDD9: RTS

;===================================================================================================

pool UnderworldTransition_AdjustCamera_Vertical

.boundary
#_02BDDA: dw $0000
#_02BDDC: dw $0110
#_02BDDE: dw $0100
#_02BDE0: dw $0010

pool off

;---------------------------------------------------------------------------------------------------

UnderworldTransition_AdjustCamera_Vertical:
#_02BDE2: ASL A
#_02BDE3: TAY

#_02BDE4: LDX.b #$00

.next
#_02BDE6: LDA.w .boundary,Y
#_02BDE9: STA.w $0610,X

#_02BDEC: INY

#_02BDED: INX
#_02BDEE: CPX.b #$04
#_02BDF0: BNE .next

#_02BDF2: RTS

;===================================================================================================

pool UnderworldTransition_ScrollRoom

.camera_scroll
#_02BDF3: dw   4
#_02BDF5: dw  -4
#_02BDF7: dw   4
#_02BDF9: dw  -4

.boundaries
#_02BDFB: dw $0034
#_02BDFD: dw $0034
#_02BDFF: dw $003B
#_02BE01: dw $003A

pool off

;---------------------------------------------------------------------------------------------------

UnderworldTransition_ScrollRoom:
#_02BE03: PHB
#_02BE04: PHK
#_02BE05: PLB

#_02BE06: INC.w $0126

#_02BE09: LDA.w $0418
#_02BE0C: ASL A
#_02BE0D: TAY

#_02BE0E: REP #$20

#_02BE10: STZ.w $011A
#_02BE13: STZ.w $011C

#_02BE16: LDX.b #$00
#_02BE18: CPY.b #$04
#_02BE1A: BCS .scrolling_horizontally

#_02BE1C: LDX.b #$06

.scrolling_horizontally
#_02BE1E: LDA.b $E2,X
#_02BE20: CLC
#_02BE21: ADC.w .camera_scroll,Y
#_02BE24: AND.w #$FFFE
#_02BE27: STA.b $E2,X
#_02BE29: STA.b $E0,X
#_02BE2B: STA.b $00

;---------------------------------------------------------------------------------------------------

#_02BE2D: LDX.b #$00
#_02BE2F: CPY.b #$04
#_02BE31: BCC .scrolling_vertically

#_02BE33: LDX.b #$02

.scrolling_vertically
#_02BE35: LDA.w $0126
#_02BE38: AND.w #$00FF
#_02BE3B: CMP.w .boundaries,Y
#_02BE3E: BCC .keep_walking

#_02BE40: LDA.b $20,X
#_02BE42: CLC
#_02BE43: ADC.w .camera_scroll,Y
#_02BE46: STA.b $20,X

.keep_walking
#_02BE48: LDA.b $00
#_02BE4A: AND.w #$01FC
#_02BE4D: CMP.w $0610,Y
#_02BE50: BNE .dirty_exit

#_02BE52: SEP #$20

#_02BE54: JSL SetAndSaveVisitedQuadrantFlags

#_02BE58: PLB

#_02BE59: INC.b $B0

#_02BE5B: STZ.w $0126

#_02BE5E: LDA.b $11
#_02BE60: CMP.b #$02
#_02BE62: BNE .clean_exit

#_02BE64: JSL WaterFlood_BuildOneQuadrantForVRAM

#_02BE68: RTS

;---------------------------------------------------------------------------------------------------

.dirty_exit
#_02BE69: PLB

#_02BE6A: SEP #$20

.clean_exit
#_02BE6C: RTS

;===================================================================================================

pool Module07_11_0A_ScrollCamera

.offset
#_02BE6D: dw  32
#_02BE6F: dw -64
#_02BE71: dw  32
#_02BE73: dw -32

pool off

;---------------------------------------------------------------------------------------------------

Module07_11_0A_ScrollCamera:
#_02BE75: PHB
#_02BE76: PHK
#_02BE77: PLB

#_02BE78: LDA.b #$0C
#_02BE7A: STA.b $4B
#_02BE7C: STA.w $02F9

#_02BE7F: LDA.w $0418
#_02BE82: ASL A
#_02BE83: TAX

#_02BE84: REP #$20

#_02BE86: LDA.b $E8
#_02BE88: CLC
#_02BE89: ADC.w UnderworldTransition_ScrollRoom_camera_scroll,X
#_02BE8C: AND.w #$FFFC
#_02BE8F: STA.b $E8
#_02BE91: STA.b $E6

#_02BE93: AND.w #$01FC
#_02BE96: CMP.w $0610,X
#_02BE99: BNE .exit

;---------------------------------------------------------------------------------------------------

#_02BE9B: LDY.b $11

#_02BE9D: CPY.b #$12
#_02BE9F: BCC .set_a

#_02BEA1: INX
#_02BEA2: INX
#_02BEA3: INX
#_02BEA4: INX

.set_a
#_02BEA5: LDA.b $20
#_02BEA7: CLC
#_02BEA8: ADC.w .offset,X
#_02BEAB: STA.b $20

#_02BEAD: SEP #$20

;---------------------------------------------------------------------------------------------------

#_02BEAF: STZ.b $4B
#_02BEB1: STZ.w $02F9

#_02BEB4: INC.b $B0

.exit
#_02BEB6: SEP #$20

#_02BEB8: PLB

#_02BEB9: RTS

;===================================================================================================

pool OverworldScrollTransition Overworld_SetCameraBoundaries

.coordinate_camera_adjust
#_02BEBA: dw $FFF8, $0008, $FFF8, $0008
#_02BEC2: dw $FFE8, $0018, $FFD8, $0018

.boundary_delta
#_02BECA: dw $FF90, $0070, $FF90, $0070
#_02BED2: dw $FE00, $0200, $FE00, $0200
#_02BEDA: dw $0018, $00E8, $0008, $00E8

.transition_target_north
#_02BEE2: dw $FF20, $FF20, $FF20, $FF20
#_02BEEA: dw $FF20, $FF20, $FF20, $FF20
#_02BEF2: dw $FF20, $FF20, $0120, $FF20
#_02BEFA: dw $FF20, $FF20, $FF20, $0120
#_02BF02: dw $0320, $0320, $0320, $0320
#_02BF0A: dw $0320, $0320, $0320, $0320
#_02BF12: dw $0520, $0520, $0520, $0520
#_02BF1A: dw $0520, $0520, $0520, $0520
#_02BF22: dw $0520, $0520, $0720, $0520
#_02BF2A: dw $0520, $0720, $0520, $0520
#_02BF32: dw $0920, $0920, $0920, $0920
#_02BF3A: dw $0920, $0920, $0920, $0920
#_02BF42: dw $0B20, $0B20, $0B20, $0B20
#_02BF4A: dw $0B20, $0B20, $0B20, $0B20
#_02BF52: dw $0B20, $0B20, $0D20, $0D20
#_02BF5A: dw $0D20, $0B20, $0B20, $0D20

.transition_target_west
#_02BF62: dw $FF00, $FF00, $0300, $0500
#_02BF6A: dw $0500, $0900, $0900, $0D00
#_02BF72: dw $FF00, $FF00, $0300, $0500
#_02BF7A: dw $0500, $0900, $0900, $0D00
#_02BF82: dw $FF00, $0100, $0300, $0500
#_02BF8A: dw $0700, $0900, $0B00, $0D00
#_02BF92: dw $FF00, $FF00, $0300, $0500
#_02BF9A: dw $0500, $0900, $0B00, $0B00
#_02BFA2: dw $FF00, $FF00, $0300, $0500
#_02BFAA: dw $0500, $0900, $0B00, $0B00
#_02BFB2: dw $FF00, $0100, $0300, $0500
#_02BFBA: dw $0700, $0900, $0B00, $0D00
#_02BFC2: dw $FF00, $FF00, $0300, $0500
#_02BFCA: dw $0700, $0900, $0900, $0D00
#_02BFD2: dw $FF00, $FF00, $0300, $0500
#_02BFDA: dw $0700, $0900, $0900, $0D00

;---------------------------------------------------------------------------------------------------

.boundary_y_size
#_02BFE2: dw $011E, $031E

.boundary_x_size
#_02BFE6: dw $0100, $0300

.transition_target_south_offset
#_02BFEA: dw $02E0, $04E0

.transition_target_east_offset
#_02BFEE: dw $0300, $0500

;---------------------------------------------------------------------------------------------------

.camera_matters_when
#_02BFF2: dw $001B, $001B, $001E, $001E

pool off

;---------------------------------------------------------------------------------------------------

OverworldScrollTransition_dirty_exit:
#_02BFFA: SEP #$20

#_02BFFC: PLB

#_02BFFD: LDX.w $0410

#_02C000: RTS

;---------------------------------------------------------------------------------------------------

OverworldScrollTransition:
#_02C001: PHB
#_02C002: PHK
#_02C003: PLB

#_02C004: INC.w $0126

#_02C007: LDA.w $0418
#_02C00A: ASL A
#_02C00B: TAY

#_02C00C: LDX.b #$01

#_02C00E: CPY.b #$04
#_02C010: BCS .going_horizontal

#_02C012: LDX.b #$00

.going_horizontal
#_02C014: LDA.w .coordinate_camera_adjust,Y
#_02C017: STA.w $069E,X

;---------------------------------------------------------------------------------------------------

#_02C01A: REP #$20

#_02C01C: PHY

#_02C01D: LDX.b #$00

#_02C01F: CPY.b #$04
#_02C021: BCS .adjust_horizontal_camera

#_02C023: LDX.b #$06

.adjust_horizontal_camera
#_02C025: LDA.b $E2,X
#_02C027: CLC
#_02C028: ADC.w .coordinate_camera_adjust,Y
#_02C02B: STA.b $E2,X

#_02C02D: LDY.b $8A
#_02C02F: CPY.b #$1B ; OW 1B
#_02C031: BEQ .castle_or_pyramid

#_02C033: CPY.b #$5B ; OW 5B
#_02C035: BEQ .castle_or_pyramid

#_02C037: STA.b $E0,X

.castle_or_pyramid
#_02C039: STA.b $00

;---------------------------------------------------------------------------------------------------

#_02C03B: PLY

#_02C03C: LDX.b #$00

#_02C03E: CPY.b #$04
#_02C040: BCC .adjust_y_position

#_02C042: LDX.b #$02

.adjust_y_position
#_02C044: LDA.w $0126
#_02C047: AND.w #$00FF
#_02C04A: CMP.w .camera_matters_when,Y
#_02C04D: BCC .dont_add_in_camera

#_02C04F: LDA.b $20,X
#_02C051: CLC
#_02C052: ADC.w .coordinate_camera_adjust,Y
#_02C055: STA.b $20,X

.dont_add_in_camera
#_02C057: LDA.b $00
#_02C059: CMP.w $0610,Y
#_02C05C: BNE OverworldScrollTransition_dirty_exit

;---------------------------------------------------------------------------------------------------

#_02C05E: LDA.w $0418
#_02C061: AND.w #$00FF
#_02C064: BNE .dont_shift_v_scroll

#_02C066: LDA.b $E8
#_02C068: SEC
#_02C069: SBC.w #$0002
#_02C06C: STA.b $E8

.dont_shift_v_scroll
#_02C06E: LDA.b $20,X
#_02C070: AND.w #$FFF8
#_02C073: STA.b $20,X

#_02C075: CLC
#_02C076: ADC.w .boundary_delta,Y
#_02C079: PHA

#_02C07A: TXA
#_02C07B: ASL A
#_02C07C: TAX

#_02C07D: PLA
#_02C07E: CLC
#_02C07F: ADC.w #$000B
#_02C082: STA.w $061A,X

#_02C085: INC A
#_02C086: INC A
#_02C087: STA.w $0618,X

#_02C08A: PHX

;---------------------------------------------------------------------------------------------------

#_02C08B: LDX.b #$00

#_02C08D: LDA.w $0712
#_02C090: BEQ .smaller_screen

#_02C092: INX
#_02C093: INX

.smaller_screen
#_02C094: LDA.w $0700
#_02C097: CLC
#_02C098: ADC.w OverworldMixedCoordsChange,Y
#_02C09B: TAY

#_02C09C: JSR Overworld_SetCameraBoundaries

#_02C09F: PLX

#_02C0A0: STZ.w $0624,X
#_02C0A3: STZ.w $0626,X

#_02C0A6: SEP #$20

#_02C0A8: LDA.b #$01
#_02C0AA: STA.w $0ABF

#_02C0AD: LDX.w $0410

#_02C0B0: INC.b $11

#_02C0B2: STZ.b $B0
#_02C0B4: STZ.w $0126

;---------------------------------------------------------------------------------------------------

#_02C0B7: PLB

#_02C0B8: LDA.b $00

#_02C0BA: PHA
#_02C0BB: PHX

#_02C0BC: JSL Sprite_InitializeSlots

#_02C0C0: PLX
#_02C0C1: PLA

#_02C0C2: RTS

;===================================================================================================

Overworld_SetCameraBoundaries:
#_02C0C3: LDA.w OverworldTransitionPositionY,Y
#_02C0C6: STA.w $0600

#_02C0C9: CLC
#_02C0CA: ADC.w .boundary_y_size,X
#_02C0CD: STA.w $0602

#_02C0D0: LDA.w OverworldTransitionPositionX,Y
#_02C0D3: STA.w $0604

#_02C0D6: CLC
#_02C0D7: ADC.w .boundary_x_size,X
#_02C0DA: STA.w $0606

#_02C0DD: LDA.w .transition_target_north,Y
#_02C0E0: STA.w $0610

#_02C0E3: CLC
#_02C0E4: ADC.w .transition_target_south_offset,X
#_02C0E7: STA.w $0612

#_02C0EA: LDA.w .transition_target_west,Y
#_02C0ED: STA.w $0614

#_02C0F0: CLC
#_02C0F1: ADC.w .transition_target_east_offset,X
#_02C0F4: STA.w $0616

#_02C0F7: RTS

;===================================================================================================

LinkLandingIndexOffset:
#_02C0F8: db $00
#_02C0F9: db $05
#_02C0FA: db $0A
#_02C0FB: db $0F

;===================================================================================================

UnderworldTransitionLandingCoordinate:
#_02C0FC: db $0C, $20, $30, $38, $48
#_02C101: db $D4, $D8, $C0, $C0, $A8
#_02C106: db $0C, $18, $28, $30, $40
#_02C10B: db $E4, $D8, $C8, $C0, $B0

;===================================================================================================

UnderworldTransition_FindTransitionLanding:
#_02C110: JSR DeleteCertainAncillaeStopDashing
#_02C113: JSR IntraroomTransitionCalculateLanding

#_02C116: INC.b $B0

#_02C118: REP #$30

#_02C11A: LDA.b $A0
#_02C11C: ASL A
#_02C11D: TAX

#_02C11E: LDA.l $7EF000,X
#_02C122: ORA.w $0408
#_02C125: STA.l $7EF000,X

#_02C129: SEP #$30

#_02C12B: RTS

;===================================================================================================

IntraroomTransitionCalculateLanding:
#_02C12C: LDA.w $0418
#_02C12F: AND.b #$02
#_02C131: PHA

#_02C132: JSR CalculateTransitionLanding

#_02C135: LDX.w $0418

#_02C138: CMP.b #$02
#_02C13A: BNE .not_layers

#_02C13C: LDA.b #$01

.not_layers
#_02C13E: CMP.b #$04
#_02C140: BNE .not_lower_layer_shutter

#_02C142: LDA.b #$02

.not_lower_layer_shutter
#_02C144: CLC
#_02C145: ADC.l LinkLandingIndexOffset,X
#_02C149: TAX

#_02C14A: LDY.b #$08
#_02C14C: LDA.l UnderworldTransitionLandingCoordinate,X
#_02C150: BPL .positive

#_02C152: LDY.b #$F8

.positive
#_02C154: STY.b $00

#_02C156: SEC
#_02C157: SBC.b $00

#_02C159: PLY

#_02C15A: STA.w $0020,Y

#_02C15D: LDX.b #$00
#_02C15F: STX.b $4B

#_02C161: RTS

;===================================================================================================

Module07_02_0D:
#_02C162: LDA.l $7EC005
#_02C166: ORA.l $7EC006
#_02C16A: BEQ UnderworldTransition_HandleFinalMovements

#_02C16C: JSL ApplyPaletteFilter

;===================================================================================================

UnderworldTransition_HandleFinalMovements:
#_02C170: JSL Link_HandleMovingAnimation_FullLongEntry

#_02C174: JSR UnderworldTransition_MoveLinkOutDoor
#_02C177: BCC .exit

#_02C179: LDX.b $4E
#_02C17B: CPX.b #$02
#_02C17D: BEQ .clear_door_flag

#_02C17F: CPX.b #$04
#_02C181: BNE .ignore_door_flag

.clear_door_flag
#_02C183: STZ.b $6C

.ignore_door_flag
#_02C185: STZ.b $6F
#_02C187: STZ.b $49
#_02C189: STZ.b $4E

#_02C18B: STZ.w $0418

#_02C18E: INC.b $B0

.exit
#_02C190: RTS

;===================================================================================================

UnderworldTransition_MoveLinkOutDoor:
#_02C191: LDX.w $0418

#_02C194: LDA.b $4E
#_02C196: CLC
#_02C197: ADC.l LinkLandingIndexOffset,X
#_02C19B: TAX

#_02C19C: LDY.b #$02

#_02C19E: LDA.w $0418
#_02C1A1: LSR A
#_02C1A2: BCC .positive_speed

#_02C1A4: LDY.b #$FE

.positive_speed
#_02C1A6: STY.b $00

#_02C1A8: LSR A
#_02C1A9: BCS .handle_x

#_02C1AB: LDY.b #$FF

#_02C1AD: LDA.b $00
#_02C1AF: BMI .negative_y

#_02C1B1: INY

.negative_y
#_02C1B2: CLC
#_02C1B3: ADC.b $20
#_02C1B5: STA.b $20

#_02C1B7: TYA
#_02C1B8: ADC.b $21
#_02C1BA: STA.b $21

#_02C1BC: LDA.b $20
#_02C1BE: AND.b #$FE
#_02C1C0: CMP.l UnderworldTransitionLandingCoordinate,X
#_02C1C4: BEQ .success

.fail
#_02C1C6: CLC

#_02C1C7: RTS

;---------------------------------------------------------------------------------------------------

.handle_x
#_02C1C8: LDY.b #$FF

#_02C1CA: LDA.b $00
#_02C1CC: BMI .negative_x

#_02C1CE: INY

.negative_x
#_02C1CF: CLC
#_02C1D0: ADC.b $22
#_02C1D2: STA.b $22

#_02C1D4: TYA
#_02C1D5: ADC.b $23
#_02C1D7: STA.b $23

#_02C1D9: LDA.b $22
#_02C1DB: AND.b #$FE
#_02C1DD: CMP.l UnderworldTransitionLandingCoordinate,X
#_02C1E1: BNE .fail

.success
#_02C1E3: SEC

#_02C1E4: RTS

;===================================================================================================

CalculateTransitionLanding:
#_02C1E5: REP #$20

#_02C1E7: LDA.b $20
#_02C1E9: CLC
#_02C1EA: ADC.w #$000C
#_02C1ED: AND.w #$01F8
#_02C1F0: ASL A
#_02C1F1: ASL A
#_02C1F2: ASL A
#_02C1F3: STA.b $00

#_02C1F5: LDA.b $22
#_02C1F7: CLC
#_02C1F8: ADC.w #$0008
#_02C1FB: AND.w #$01F8
#_02C1FE: LSR A
#_02C1FF: LSR A
#_02C200: LSR A
#_02C201: ORA.b $00

;---------------------------------------------------------------------------------------------------

#_02C203: LDX.b $EE
#_02C205: BEQ .upper_layer

#_02C207: CLC
#_02C208: ADC.w #$1000

.upper_layer
#_02C20B: REP #$10

#_02C20D: TAX
#_02C20E: LDA.l $7F2000,X

#_02C212: SEP #$30

#_02C214: LDY.b #$00

#_02C216: CMP.b #$00 ; TILETYPE 00
#_02C218: BEQ .save

#_02C21A: CMP.b #$09 ; TILETYPE 09
#_02C21C: BEQ .save

#_02C21E: INY

#_02C21F: AND.b #$8E
#_02C221: CMP.b #$80 ; TILETYPE 80, TILETYPE 81
#_02C223: BEQ .save

#_02C225: INY

#_02C226: CMP.b #$82 ; TILETYPE 82
#_02C228: BEQ .save

#_02C22A: INY
#_02C22B: CMP.b #$84 ; TILETYPE 84
#_02C22D: BEQ .save

#_02C22F: CMP.b #$88 ; TILETYPE 88
#_02C231: BEQ .save

#_02C233: INY
#_02C234: CMP.b #$86 ; TILETYPE 86
#_02C236: BEQ .save

#_02C238: DEY
#_02C239: DEY

.save
#_02C23A: STY.b $4E

#_02C23C: TYA

#_02C23D: RTS

;===================================================================================================

pool Overworld_FinalizeEntryOntoScreen

.song_change_directions
#_02C23E: db $E0
#_02C23F: db $08
#_02C240: db $E0
#_02C241: db $10

pool off

;---------------------------------------------------------------------------------------------------

Overworld_FinalizeEntryOntoScreen:
#_02C242: JSL Link_HandleMovingAnimation_FullLongEntry

#_02C246: LDY.b #$02

#_02C248: LDA.w $069C
#_02C24B: LSR A
#_02C24C: BCS .positive

#_02C24E: LDY.b #$FE

.positive
#_02C250: STY.b $00

#_02C252: LDX.b #$02

#_02C254: LSR A
#_02C255: BCS .handle_x_coords

#_02C257: LDX.b #$00

.handle_x_coords
#_02C259: LDY.b #$FF

#_02C25B: LDA.b $00
#_02C25D: BMI .negative

#_02C25F: INY

.negative
#_02C260: CLC
#_02C261: ADC.b $20,X
#_02C263: STA.b $20,X

#_02C265: TYA
#_02C266: ADC.b $21,X
#_02C268: STA.b $21,X

#_02C26A: LDA.b $20,X

#_02C26C: LDX.w $069C

#_02C26F: AND.b #$FE
#_02C271: CMP.l .song_change_directions,X

#_02C275: BNE .not_fade

;---------------------------------------------------------------------------------------------------

#_02C277: STZ.b $11
#_02C279: STZ.b $B0

#_02C27B: LDX.b $8A

#_02C27D: LDA.l $7F5B00,X
#_02C281: LSR A
#_02C282: LSR A
#_02C283: LSR A
#_02C284: LSR A
#_02C285: STA.w $012D

#_02C288: LDA.w $0130
#_02C28B: CMP.b #$F1 ; SONG F1 - fade
#_02C28D: BNE .not_fade

#_02C28F: LDA.l $7F5B00,X
#_02C293: AND.b #$0F
#_02C295: STA.w $012C

.not_fade
#_02C298: JSR Overworld_OperateCameraScroll

#_02C29B: LDA.w $0416
#_02C29E: BEQ .exit

#_02C2A0: JSR OverworldHandleMapScroll

.exit
#_02C2A3: RTS

;===================================================================================================

Module09_1F:
#_02C2A4: JSL Link_HandleMovingAnimation_FullLongEntry

#_02C2A8: LDY.b #$01

#_02C2AA: LDA.w $069C
#_02C2AD: LSR A
#_02C2AE: BCS .positive_velocity

#_02C2B0: LDY.b #$FF

.positive_velocity
#_02C2B2: STY.b $00

#_02C2B4: LDX.b #$02

#_02C2B6: LSR A
#_02C2B7: BCS .handle_x_coords

#_02C2B9: LDX.b #$00

.handle_x_coords
#_02C2BB: LDY.b #$FF

#_02C2BD: LDA.b $00
#_02C2BF: BMI .negative

#_02C2C1: INY

.negative
#_02C2C2: CLC
#_02C2C3: ADC.b $20,X
#_02C2C5: STA.b $20,X

#_02C2C7: TYA
#_02C2C8: ADC.b $21,X
#_02C2CA: STA.b $21,X

#_02C2CC: TXA
#_02C2CD: LSR A
#_02C2CE: TAX

#_02C2CF: LDA.b $00
#_02C2D1: STA.b $30,X

#_02C2D3: DEC.w $069A
#_02C2D6: BNE .delay_mode

#_02C2D8: LDA.b #$09
#_02C2DA: STA.b $10
#_02C2DC: STZ.b $11
#_02C2DE: STZ.b $B0

.delay_mode
#_02C2E0: JSR Overworld_OperateCameraScroll

#_02C2E3: RTS

;===================================================================================================

ConditionalMosaicControl:
#_02C2E4: LDA.l $7EC007
#_02C2E8: LSR A
#_02C2E9: BCC CopyMosaicControl

;===================================================================================================

MosaicControlIncrease:
#_02C2EB: LDA.l $7EC011
#_02C2EF: CLC
#_02C2F0: ADC.b #$10
#_02C2F2: STA.l $7EC011

;===================================================================================================

CopyMosaicControl:
#_02C2F6: LDA.b #$09
#_02C2F8: STA.b $94

#_02C2FA: LDA.l $7EC011
#_02C2FE: ORA.b #$07
#_02C300: STA.b $95

#_02C302: RTS

;===================================================================================================

LightWorldAmbiance:
#_02C303: db $05, $05, $03, $03, $03, $03, $03, $03
#_02C30B: db $05, $05, $03, $03, $03, $03, $03, $03
#_02C313: db $03, $03, $13, $13, $13, $03, $03, $03
#_02C31B: db $03, $03, $13, $13, $13, $03, $03, $03
#_02C323: db $03, $03, $13, $13, $13, $03, $03, $03
#_02C32B: db $03, $03, $13, $13, $13, $03, $03, $03
#_02C333: db $03, $03, $03, $03, $03, $03, $03, $03
#_02C33B: db $03, $03, $03, $03, $03, $03, $03, $03

#_02C343: db $55, $55, $02, $52, $52, $52, $52, $52
#_02C34B: db $55, $55, $02, $52, $52, $52, $52, $02
#_02C353: db $02, $02, $02, $02, $02, $02, $02, $02
#_02C35B: db $07, $07, $02, $02, $02, $02, $02, $02
#_02C363: db $07, $07, $07, $02, $02, $02, $02, $02
#_02C36B: db $07, $07, $02, $02, $02, $02, $02, $02
#_02C373: db $02, $02, $02, $02, $02, $02, $02, $02
#_02C37B: db $02, $02, $02, $02, $02, $02, $02, $02

#_02C383: db $52, $52, $02, $52, $52, $52, $52, $52
#_02C38B: db $52, $52, $02, $52, $52, $52, $52, $02
#_02C393: db $02, $02, $02, $02, $02, $02, $02, $02
#_02C39B: db $07, $07, $02, $02, $02, $02, $02, $02
#_02C3A3: db $07, $07, $07, $02, $02, $02, $02, $02
#_02C3AB: db $07, $07, $02, $02, $02, $02, $02, $02
#_02C3B3: db $02, $02, $02, $02, $02, $02, $02, $02
#_02C3BB: db $02, $02, $02, $02, $02, $02, $02, $02

#_02C3C3: db $52, $52, $02, $52, $52, $52, $52, $52
#_02C3CB: db $52, $52, $02, $52, $52, $52, $52, $02
#_02C3D3: db $02, $02, $02, $02, $02, $02, $02, $02
#_02C3DB: db $02, $02, $02, $02, $02, $02, $02, $02
#_02C3E3: db $02, $02, $02, $02, $02, $02, $02, $02
#_02C3EB: db $02, $02, $02, $02, $02, $02, $02, $02
#_02C3F3: db $52, $52, $02, $02, $02, $02, $02, $02
#_02C3FB: db $52, $52, $02, $02, $02, $02, $02, $02

DarkWorldAmbiance:
#_02C403: db $9D, $9D, $09, $9D, $9D, $9D, $9D, $9D
#_02C40B: db $9D, $9D, $09, $9D, $9D, $9D, $9D, $09
#_02C413: db $09, $09, $09, $09, $09, $09, $09, $09
#_02C41B: db $09, $09, $09, $09, $09, $09, $09, $09
#_02C423: db $09, $09, $09, $09, $09, $09, $09, $09
#_02C42B: db $09, $09, $09, $09, $09, $09, $09, $09
#_02C433: db $09, $09, $09, $09, $09, $09, $09, $09
#_02C43B: db $09, $09, $09, $09, $09, $09, $09, $09
#_02C443: db $05, $02, $02, $02, $02, $02, $02, $02
#_02C44B: db $02, $02, $02, $02, $02, $02, $02, $02
#_02C453: db $02, $02, $02, $02, $02, $02, $02, $02
#_02C45B: db $02, $02, $02, $02, $02, $02, $02, $12

;===================================================================================================

AdjustOverworldAmbiance:
#_02C463: PHB
#_02C464: PHK
#_02C465: PLB

#_02C466: REP #$10

#_02C468: LDA.b #$02
#_02C46A: STA.b $00

#_02C46C: LDX.w #$0000
#_02C46F: LDY.w #$00C0

#_02C472: LDA.l $7EF3C5
#_02C476: CMP.b #$03
#_02C478: BCS .copy_next

#_02C47A: LDY.w #$0080

#_02C47D: LDA.l $7EF359
#_02C481: CMP.b #$02
#_02C483: BCS .copy_next

#_02C485: LDA.b #$05
#_02C487: STA.b $00

#_02C489: LDY.w #$0040

#_02C48C: LDA.l $7EF3C5
#_02C490: CMP.b #$02
#_02C492: BCS .copy_next

#_02C494: LDY.w #$0000

;---------------------------------------------------------------------------------------------------

.copy_next
#_02C497: LDA.w LightWorldAmbiance,Y
#_02C49A: STA.l $7F5B00,X

#_02C49E: INY

#_02C49F: INX
#_02C4A0: CPX.w #$0040
#_02C4A3: BNE .copy_next

;---------------------------------------------------------------------------------------------------

#_02C4A5: LDY.w #$0000

.copy_more
#_02C4A8: LDA.w DarkWorldAmbiance,Y
#_02C4AB: STA.l $7F5B00,X

#_02C4AF: INX

#_02C4B0: INY
#_02C4B1: CPY.w #$0060
#_02C4B4: BNE .copy_more

;---------------------------------------------------------------------------------------------------

#_02C4B6: LDA.b $00
#_02C4B8: STA.l $7F5B80

#_02C4BC: SEP #$10

#_02C4BE: PLB
#_02C4BF: RTL

;===================================================================================================
; FREE ROM: 0x40
;===================================================================================================
NULL_02C4C0:
#_02C4C0: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02C4C8: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02C4D0: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02C4D8: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02C4E0: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02C4E8: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02C4F0: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02C4F8: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

Intro_InitializeBackgroundSettings:
#_02C500: STZ.w SETINI

#_02C503: LDA.b #$09
#_02C505: STA.b $94
#_02C507: STZ.b $95

#_02C509: LDA.b #$13
#_02C50B: STA.w BG1SC

#_02C50E: LDA.b #$03
#_02C510: STA.w BG2SC

#_02C513: LDA.b #$63
#_02C515: STA.w BG3SC

#_02C518: LDA.b #$22
#_02C51A: STA.w BG12NBA

#_02C51D: LDA.b #$07
#_02C51F: STA.w BG34NBA

#_02C522: LDA.b #$20
#_02C524: STA.b $9A

#_02C526: LDA.b #$20 ; Fixed color RGB: #000000
#_02C528: STA.b $9C

#_02C52A: LDA.b #$40
#_02C52C: STA.b $9D

#_02C52E: LDA.b #$80
#_02C530: STA.b $9E

#_02C532: RTS

;===================================================================================================

Underworld_LoadAndDrawEntranceRoom:
#_02C533: STA.w $010E

#_02C536: JSR Underworld_LoadEntrance

#_02C539: STZ.w $045A
#_02C53C: STZ.w $0458

#_02C53F: JSR Underworld_LoadAndDrawRoom
#_02C542: JSR Underworld_ResetTorchBackgroundAndPlayer

#_02C545: RTL

;===================================================================================================

Underworld_SaveAndLoadLoadAllPalettes:
#_02C546: STX.w $0AA3

#_02C549: STA.w $0AA1
#_02C54C: STA.w $0AA2

#_02C54F: JSL InitializeTilesets

#_02C553: LDA.b #$02
#_02C555: STA.w $0AA9

#_02C558: INC.b $15

#_02C55A: JSL SetBGandFixedColorBlack

;---------------------------------------------------------------------------------------------------

Underworld_LoadAllPalettes:
#_02C55E: JSL Palettes_Load_SpritePal0Left
#_02C562: JSL Palettes_Load_SpriteMain
#_02C566: JSL Palettes_Load_SpriteAux1
#_02C56A: JSL Palettes_Load_SpriteAux2
#_02C56E: JSL Palettes_Load_SpriteEnvironment_Underworld
#_02C572: JSL Palettes_Load_HUD
#_02C576: JSL Palettes_Load_UnderworldSet

#_02C57A: RTL

;===================================================================================================

Underworld_LoadAndDrawRoom:
#_02C57B: LDA.b $9B
#_02C57D: PHA

#_02C57E: STZ.w HDMAEN
#_02C581: STZ.b $9B

#_02C583: JSL Underworld_LoadRoom

#_02C587: STZ.w $0418
#_02C58A: STZ.w $045C
#_02C58D: STZ.w $0200

;---------------------------------------------------------------------------------------------------

.next_quadrant
#_02C590: JSL TilemapPrep_NotWaterOnTag
#_02C594: JSL NMI_UploadTilemap_long

#_02C598: JSL Underworld_PrepareNextRoomQuadrantUpload
#_02C59C: JSL NMI_UploadTilemap_long

#_02C5A0: LDA.w $045C
#_02C5A3: CMP.b #$10
#_02C5A5: BNE .next_quadrant

;---------------------------------------------------------------------------------------------------

#_02C5A7: PLA
#_02C5A8: STA.b $9B

#_02C5AA: STZ.b $17
#_02C5AC: STZ.w $0200
#_02C5AF: STZ.b $B0

#_02C5B1: RTS

;===================================================================================================

Overworld_LoadAllPalettes:
#_02C5B2: REP #$20

#_02C5B4: LDX.b #$00

#_02C5B6: LDA.w #$0000 ; RGB: #000000

.next_color
#_02C5B9: STA.l $7EC480,X
#_02C5BD: STA.l $7EC500,X
#_02C5C1: STA.l $7EC580,X
#_02C5C5: STA.l $7EC600,X
#_02C5C9: STA.l $7EC680,X

#_02C5CD: INX
#_02C5CE: INX
#_02C5CF: CPX.b #$80
#_02C5D1: BNE .next_color

;---------------------------------------------------------------------------------------------------

#_02C5D3: SEP #$20

#_02C5D5: LDA.b #$05
#_02C5D7: STA.w $0AB3

#_02C5DA: LDA.b #$03
#_02C5DC: STA.w $0AB4
#_02C5DF: STA.w $0AB5

#_02C5E2: LDA.b #$00
#_02C5E4: STA.w $0AB8

#_02C5E7: LDA.b #$05
#_02C5E9: STA.w $0AB1

#_02C5EC: LDA.b #$0B
#_02C5EE: STA.w $0AAC

#_02C5F1: STZ.w $0ABD
#_02C5F4: STZ.w $0AA9

#_02C5F7: JSL SetBGandFixedColorBlack

#_02C5FB: JSL Palettes_Load_SpritePal0Left
#_02C5FF: JSL Palettes_Load_SpriteMain
#_02C603: JSL Palettes_Load_OWBGMain

#_02C607: JSL Palettes_Load_OWBG1
#_02C60B: JSL Palettes_Load_OWBG2
#_02C60F: JSL Palettes_Load_OWBG3

#_02C613: JSL Palettes_Load_SpriteEnvironment_Underworld

#_02C617: JSL Palettes_Load_HUD

;---------------------------------------------------------------------------------------------------

#_02C61B: REP #$20

#_02C61D: LDX.b #$00

.copy_next
#_02C61F: LDA.l $7EC4D0,X
#_02C623: STA.l $7EC6B0,X

#_02C627: INX
#_02C628: INX
#_02C629: CPX.b #$10
#_02C62B: BNE .copy_next

#_02C62D: SEP #$20

#_02C62F: RTS

;===================================================================================================

Underworld_LoadPalettes:
#_02C630: STZ.w $0AA9

#_02C633: JSL SetBGandFixedColorBlack

#_02C637: JSL Palettes_Load_SpritePal0Left
#_02C63B: JSL Palettes_Load_SpriteMain
#_02C63F: JSL Palettes_Load_SpriteAux1
#_02C643: JSL Palettes_Load_SpriteAux2

#_02C647: JSL Palettes_Load_Sword
#_02C64B: JSL Palettes_Load_Shield

#_02C64F: JSL Palettes_Load_SpriteEnvironment
#_02C653: JSL Palettes_Load_LinkArmorAndGloves

#_02C657: JSL Palettes_Load_HUD
#_02C65B: JSL Palettes_Load_UnderworldSet

;===================================================================================================

Overworld_CopyPalettesToCache_WithPrep:
#_02C65F: LDA.w $0AB6
#_02C662: STA.l $7EC20A

#_02C666: LDA.w $0AB8
#_02C669: STA.l $7EC20B

#_02C66D: LDA.w $0AB7
#_02C670: STA.l $7EC20C

#_02C674: REP #$20

#_02C676: LDA.w #$0002
#_02C679: STA.l $7EC009

#_02C67D: LDA.w #$0000
#_02C680: STA.l $7EC007

#_02C684: LDA.w #$0000
#_02C687: STA.l $7EC00B

#_02C68B: JMP.w Overworld_CopyPalettesToCache

;===================================================================================================

OverworldLoadScreensPaletteSet_long:
#_02C68E: JSR OverworldLoadScreensPaletteSet

#_02C691: RTL

;===================================================================================================

OverworldLoadScreensPaletteSet:
#_02C692: LDX.b #$02

#_02C694: LDA.b $8A
#_02C696: AND.b #$3F
#_02C698: CMP.b #$03 ; OW 03, OW 43
#_02C69A: BEQ .not_death_mountain

#_02C69C: CMP.b #$05 ; OW 05, OW 45
#_02C69E: BEQ .not_death_mountain

#_02C6A0: CMP.b #$07 ; OW 07, OW 47
#_02C6A2: BEQ .not_death_mountain

#_02C6A4: LDX.b #$00

.not_death_mountain
#_02C6A6: LDA.b $8A
#_02C6A8: AND.b #$40
#_02C6AA: BEQ OverworldLoadScreensPaletteSet_Preloaded

#_02C6AC: INX

;===================================================================================================

OverworldLoadScreensPaletteSet_Preloaded:
#_02C6AD: STX.w $0AB3
#_02C6B0: STZ.w $0AA9

#_02C6B3: JSL Palettes_Load_SpriteMain
#_02C6B7: JSL Palettes_Load_SpriteEnvironment

#_02C6BB: JSL Palettes_Load_SpriteAux1
#_02C6BF: JSL Palettes_Load_SpriteAux2

#_02C6C3: JSL Palettes_Load_Sword
#_02C6C7: JSL Palettes_Load_Shield
#_02C6CB: JSL Palettes_Load_LinkArmorAndGloves

#_02C6CF: LDX.b #$01

#_02C6D1: LDA.l $7EF3CA
#_02C6D5: AND.b #$40
#_02C6D7: BEQ .light_world

#_02C6D9: LDX.b #$03

.light_world
#_02C6DB: STX.w $0AAC

#_02C6DE: JSL Palettes_Load_SpritePal0Left
#_02C6E2: JSL Palettes_Load_HUD
#_02C6E6: JSL Palettes_Load_OWBGMain

#_02C6EA: RTS

;===================================================================================================

SpecialOverworld_CopyPalettesToCache:
#_02C6EB: REP #$20

#_02C6ED: LDX.b #$00

#_02C6EF: LDA.w #$0000 ; RGB: #000000

.next_black
#_02C6F2: STA.l $7EC540,X
#_02C6F6: STA.l $7EC580,X
#_02C6FA: STA.l $7EC5C0,X
#_02C6FE: STA.l $7EC600,X
#_02C702: STA.l $7EC640,X
#_02C706: STA.l $7EC680,X
#_02C70A: STA.l $7EC6C0,X

#_02C70E: INX
#_02C70F: INX
#_02C710: CPX.b #$40
#_02C712: BNE .next_black

;---------------------------------------------------------------------------------------------------

#_02C714: LDX.b #$00

.next_color
#_02C716: LDA.l $7EC300,X
#_02C71A: STA.l $7EC500,X

#_02C71E: LDA.l $7EC310,X
#_02C722: STA.l $7EC510,X

#_02C726: LDA.l $7EC320,X
#_02C72A: STA.l $7EC520,X

#_02C72E: LDA.l $7EC330,X
#_02C732: STA.l $7EC530,X

#_02C736: LDA.l $7EC4B0,X
#_02C73A: STA.l $7EC6B0,X

#_02C73E: LDA.l $7EC4D0,X
#_02C742: STA.l $7EC6D0,X

#_02C746: LDA.l $7EC4E0,X
#_02C74A: STA.l $7EC6E0,X

#_02C74E: LDA.l $7EC4F0,X
#_02C752: STA.l $7EC6F0,X

#_02C756: INX
#_02C757: INX
#_02C758: CPX.b #$10
#_02C75A: BNE .next_color

;---------------------------------------------------------------------------------------------------

#_02C75C: SEP #$20

#_02C75E: LDA.b #$F7
#_02C760: STA.b $95
#_02C762: STA.l $7EC011

#_02C766: INC.b $15

#_02C768: RTS

;===================================================================================================

Overworld_CopyPalettesToCache:
#_02C769: REP #$20

#_02C76B: LDX.b #$00

.next_color
#_02C76D: LDA.l $7EC300,X
#_02C771: STA.l $7EC500,X

#_02C775: LDA.l $7EC340,X
#_02C779: STA.l $7EC540,X

#_02C77D: LDA.l $7EC380,X
#_02C781: STA.l $7EC580,X

#_02C785: LDA.l $7EC3C0,X
#_02C789: STA.l $7EC5C0,X

#_02C78D: LDA.l $7EC400,X
#_02C791: STA.l $7EC600,X

#_02C795: LDA.l $7EC440,X
#_02C799: STA.l $7EC640,X

#_02C79D: LDA.l $7EC480,X
#_02C7A1: STA.l $7EC680,X

#_02C7A5: LDA.l $7EC4C0,X
#_02C7A9: STA.l $7EC6C0,X

#_02C7AD: INX
#_02C7AE: INX
#_02C7AF: CPX.b #$40
#_02C7B1: BNE .next_color

;---------------------------------------------------------------------------------------------------

#_02C7B3: SEP #$20

#_02C7B5: INC.b $15

#_02C7B7: RTS

;===================================================================================================

CleanUpAndPrepDesertPrayerHDMA:
#_02C7B8: PHB
#_02C7B9: PHK
#_02C7BA: PLB

#_02C7BB: LDX.b #$04

.next_prop
#_02C7BD: LDA.w .hdma_props,X
#_02C7C0: STA.w DMA7MODE,X

#_02C7C3: DEX
#_02C7C4: BPL .next_prop

;---------------------------------------------------------------------------------------------------

#_02C7C6: LDA.b #$00
#_02C7C8: STA.w HDMA7INDIRECTB

#_02C7CB: LDA.b #$33
#_02C7CD: STA.b $96

#_02C7CF: LDA.b #$03
#_02C7D1: STA.b $97

#_02C7D3: LDA.b #$33
#_02C7D5: STA.b $98

#_02C7D7: LDA.b $1C
#_02C7D9: STA.b $1E

#_02C7DB: LDA.b $1D
#_02C7DD: STA.b $1F

#_02C7DF: LDA.b #$80
#_02C7E1: STA.b $9B

#_02C7E3: REP #$10

#_02C7E5: LDX.w #$01DF

;---------------------------------------------------------------------------------------------------

.clear_next
#_02C7E8: STZ.w $1B00,X

#_02C7EB: DEX
#_02C7EC: BPL .clear_next

#_02C7EE: SEP #$10

#_02C7F0: PLB

#_02C7F1: RTL

;---------------------------------------------------------------------------------------------------

.unused_hdma_data
#_02C7F2: db $01 : dw $FF00 ; 1 line
#_02C7F5: db $01 : dw $FF00 ; 1 line
#_02C7F8: db $01 : dw $FF00 ; 1 line
#_02C7FB: db $01 : dw $FF00 ; 1 line
#_02C7FE: db $81 : dw $0000 ; 1 line continuous
#_02C801: db $00 ; end

.unused_hdma_props
#_02C802: db $01 ; direct transfer, 2 registers write once
#_02C803: db WH0
#_02C804: dl $001B00 ; table location

;---------------------------------------------------------------------------------------------------

.hdma_props
#_02C807: db $41 ; indirect transfer, 2 registers write once
#_02C808: db WH0
#_02C809: dl .indirect_table

.indirect_table
#_02C80C: db $F8 : dw $1B00 ; 120 lines, continuous
#_02C80F: db $F8 : dw $1BF0 ; 120 lines, continuous
#_02C812: db $00 ; end

;===================================================================================================

EntranceData:

.room_id
#_02C813: dw $0104 ; 0x00
#_02C815: dw $0104 ; 0x01
#_02C817: dw $0012 ; 0x02
#_02C819: dw $0060 ; 0x03
#_02C81B: dw $0061 ; 0x04
#_02C81D: dw $0062 ; 0x05
#_02C81F: dw $00F0 ; 0x06
#_02C821: dw $00F1 ; 0x07
#_02C823: dw $00C9 ; 0x08
#_02C825: dw $0084 ; 0x09
#_02C827: dw $0085 ; 0x0A
#_02C829: dw $0083 ; 0x0B
#_02C82B: dw $0063 ; 0x0C
#_02C82D: dw $00F2 ; 0x0D
#_02C82F: dw $00F3 ; 0x0E
#_02C831: dw $00F4 ; 0x0F
#_02C833: dw $00F5 ; 0x10
#_02C835: dw $00E3 ; 0x11
#_02C837: dw $00E2 ; 0x12
#_02C839: dw $00F8 ; 0x13
#_02C83B: dw $00E8 ; 0x14
#_02C83D: dw $0023 ; 0x15
#_02C83F: dw $00FB ; 0x16
#_02C841: dw $00EB ; 0x17
#_02C843: dw $00D5 ; 0x18
#_02C845: dw $0024 ; 0x19
#_02C847: dw $00FD ; 0x1A
#_02C849: dw $00ED ; 0x1B
#_02C84B: dw $00FE ; 0x1C
#_02C84D: dw $00EE ; 0x1D
#_02C84F: dw $00FF ; 0x1E
#_02C851: dw $00EF ; 0x1F
#_02C853: dw $00DF ; 0x20
#_02C855: dw $00F9 ; 0x21
#_02C857: dw $00FA ; 0x22
#_02C859: dw $00EA ; 0x23
#_02C85B: dw $00E0 ; 0x24
#_02C85D: dw $0028 ; 0x25
#_02C85F: dw $004A ; 0x26
#_02C861: dw $0098 ; 0x27
#_02C863: dw $0056 ; 0x28
#_02C865: dw $0057 ; 0x29
#_02C867: dw $0058 ; 0x2A
#_02C869: dw $0059 ; 0x2B
#_02C86B: dw $00E1 ; 0x2C
#_02C86D: dw $000E ; 0x2D
#_02C86F: dw $00E6 ; 0x2E
#_02C871: dw $00E7 ; 0x2F
#_02C873: dw $00E4 ; 0x30
#_02C875: dw $00E5 ; 0x31
#_02C877: dw $0055 ; 0x32
#_02C879: dw $0077 ; 0x33
#_02C87B: dw $00DB ; 0x34
#_02C87D: dw $00D6 ; 0x35
#_02C87F: dw $0010 ; 0x36
#_02C881: dw $000C ; 0x37
#_02C883: dw $0008 ; 0x38
#_02C885: dw $002F ; 0x39
#_02C887: dw $003C ; 0x3A
#_02C889: dw $002C ; 0x3B
#_02C88B: dw $0100 ; 0x3C
#_02C88D: dw $011E ; 0x3D
#_02C88F: dw $0101 ; 0x3E
#_02C891: dw $0101 ; 0x3F
#_02C893: dw $0102 ; 0x40
#_02C895: dw $0117 ; 0x41
#_02C897: dw $0103 ; 0x42
#_02C899: dw $0103 ; 0x43
#_02C89B: dw $0103 ; 0x44
#_02C89D: dw $0105 ; 0x45
#_02C89F: dw $011F ; 0x46
#_02C8A1: dw $0106 ; 0x47
#_02C8A3: dw $0106 ; 0x48
#_02C8A5: dw $0107 ; 0x49
#_02C8A7: dw $0107 ; 0x4A
#_02C8A9: dw $0108 ; 0x4B
#_02C8AB: dw $0109 ; 0x4C
#_02C8AD: dw $010A ; 0x4D
#_02C8AF: dw $010B ; 0x4E
#_02C8B1: dw $010C ; 0x4F
#_02C8B3: dw $010C ; 0x50
#_02C8B5: dw $011B ; 0x51
#_02C8B7: dw $011B ; 0x52
#_02C8B9: dw $011C ; 0x53
#_02C8BB: dw $011C ; 0x54
#_02C8BD: dw $011E ; 0x55
#_02C8BF: dw $0120 ; 0x56
#_02C8C1: dw $0110 ; 0x57
#_02C8C3: dw $0112 ; 0x58
#_02C8C5: dw $0111 ; 0x59
#_02C8C7: dw $0112 ; 0x5A
#_02C8C9: dw $0113 ; 0x5B
#_02C8CB: dw $0114 ; 0x5C
#_02C8CD: dw $0115 ; 0x5D
#_02C8CF: dw $0115 ; 0x5E
#_02C8D1: dw $010D ; 0x5F
#_02C8D3: dw $010F ; 0x60
#_02C8D5: dw $0119 ; 0x61
#_02C8D7: dw $0114 ; 0x62
#_02C8D9: dw $0116 ; 0x63
#_02C8DB: dw $0121 ; 0x64
#_02C8DD: dw $0122 ; 0x65
#_02C8DF: dw $0122 ; 0x66
#_02C8E1: dw $0118 ; 0x67
#_02C8E3: dw $011A ; 0x68
#_02C8E5: dw $010E ; 0x69
#_02C8E7: dw $010E ; 0x6A
#_02C8E9: dw $011F ; 0x6B
#_02C8EB: dw $0123 ; 0x6C
#_02C8ED: dw $0124 ; 0x6D
#_02C8EF: dw $0124 ; 0x6E
#_02C8F1: dw $0125 ; 0x6F
#_02C8F3: dw $0125 ; 0x70
#_02C8F5: dw $0126 ; 0x71
#_02C8F7: dw $0126 ; 0x72
#_02C8F9: dw $0080 ; 0x73
#_02C8FB: dw $0051 ; 0x74
#_02C8FD: dw $0030 ; 0x75
#_02C8FF: dw $0058 ; 0x76
#_02C901: dw $0067 ; 0x77
#_02C903: dw $0068 ; 0x78
#_02C905: dw $0056 ; 0x79
#_02C907: dw $00E1 ; 0x7A
#_02C909: dw $0000 ; 0x7B
#_02C90B: dw $0018 ; 0x7C
#_02C90D: dw $0055 ; 0x7D
#_02C90F: dw $00E3 ; 0x7E
#_02C911: dw $00E2 ; 0x7F
#_02C913: dw $002F ; 0x80
#_02C915: dw $0011 ; 0x81
#_02C917: dw $0003 ; 0x82
#_02C919: dw $0127 ; 0x83
#_02C91B: dw $0120 ; 0x84

;---------------------------------------------------------------------------------------------------

.camera_scroll_boundaries
#_02C91D: db $21, $20, $21, $21, $09, $09, $09, $0A ; 0x00
#_02C925: db $21, $20, $21, $21, $09, $09, $09, $0A ; 0x01
#_02C92D: db $03, $02, $03, $03, $04, $04, $04, $05 ; 0x02
#_02C935: db $0D, $0C, $0D, $0D, $01, $00, $01, $01 ; 0x03
#_02C93D: db $0D, $0C, $0D, $0D, $02, $02, $02, $03 ; 0x04
#_02C945: db $0D, $0C, $0D, $0D, $04, $04, $04, $05 ; 0x05
#_02C94D: db $1F, $1E, $1F, $1F, $00, $00, $00, $01 ; 0x06
#_02C955: db $1F, $1E, $1F, $1F, $03, $02, $03, $03 ; 0x07
#_02C95D: db $19, $18, $19, $19, $12, $12, $12, $13 ; 0x08
#_02C965: db $11, $10, $11, $11, $08, $08, $08, $09 ; 0x09
#_02C96D: db $11, $10, $11, $11, $0B, $0A, $0B, $0B ; 0x0A
#_02C975: db $11, $10, $11, $11, $06, $06, $06, $07 ; 0x0B
#_02C97D: db $0D, $0C, $0D, $0D, $06, $06, $06, $07 ; 0x0C
#_02C985: db $1F, $1E, $1F, $1F, $05, $05, $05, $06 ; 0x0D
#_02C98D: db $1F, $1E, $1F, $1F, $06, $06, $06, $07 ; 0x0E
#_02C995: db $1F, $1E, $1F, $1F, $09, $09, $09, $0A ; 0x0F
#_02C99D: db $1F, $1E, $1F, $1F, $0A, $0A, $0A, $0B ; 0x10
#_02C9A5: db $1D, $1C, $1D, $1D, $06, $06, $06, $07 ; 0x11
#_02C9AD: db $1D, $1C, $1D, $1D, $05, $04, $05, $05 ; 0x12
#_02C9B5: db $1F, $1E, $1F, $1F, $10, $10, $10, $11 ; 0x13
#_02C9BD: db $1D, $1C, $1D, $1D, $11, $10, $11, $11 ; 0x14
#_02C9C5: db $05, $04, $05, $05, $07, $06, $07, $07 ; 0x15
#_02C9CD: db $1F, $1E, $1F, $1F, $16, $16, $16, $17 ; 0x16
#_02C9D5: db $1D, $1C, $1D, $1D, $17, $16, $17, $17 ; 0x17
#_02C9DD: db $1B, $1A, $1B, $1B, $0A, $0A, $0A, $0B ; 0x18
#_02C9E5: db $05, $04, $05, $05, $09, $08, $09, $09 ; 0x19
#_02C9ED: db $1F, $1E, $1F, $1F, $1A, $1A, $1A, $1B ; 0x1A
#_02C9F5: db $1D, $1C, $1D, $1D, $1A, $1A, $1A, $1B ; 0x1B
#_02C9FD: db $1F, $1E, $1F, $1F, $1D, $1D, $1D, $1E ; 0x1C
#_02CA05: db $1D, $1C, $1D, $1D, $1D, $1C, $1D, $1D ; 0x1D
#_02CA0D: db $1F, $1E, $1F, $1F, $1F, $1E, $1F, $1F ; 0x1E
#_02CA15: db $1D, $1C, $1D, $1D, $1E, $1E, $1E, $1F ; 0x1F
#_02CA1D: db $1B, $1A, $1B, $1B, $1E, $1E, $1E, $1F ; 0x20
#_02CA25: db $1F, $1E, $1F, $1F, $12, $12, $12, $13 ; 0x21
#_02CA2D: db $1F, $1E, $1F, $1F, $14, $14, $14, $15 ; 0x22
#_02CA35: db $1D, $1C, $1D, $1D, $14, $14, $14, $15 ; 0x23
#_02CA3D: db $1D, $1C, $1D, $1D, $00, $00, $00, $01 ; 0x24
#_02CA45: db $05, $04, $05, $05, $10, $10, $10, $11 ; 0x25
#_02CA4D: db $09, $08, $09, $09, $14, $14, $14, $15 ; 0x26
#_02CA55: db $13, $12, $13, $13, $10, $10, $10, $11 ; 0x27
#_02CA5D: db $0B, $0A, $0B, $0B, $0C, $0C, $0C, $0D ; 0x28
#_02CA65: db $0B, $0A, $0B, $0B, $0E, $0E, $0E, $0F ; 0x29
#_02CA6D: db $0B, $0A, $0B, $0B, $10, $10, $10, $11 ; 0x2A
#_02CA75: db $0B, $0A, $0B, $0B, $12, $12, $12, $13 ; 0x2B
#_02CA7D: db $1D, $1C, $1D, $1D, $02, $02, $02, $03 ; 0x2C
#_02CA85: db $01, $00, $01, $01, $1D, $1C, $1D, $1D ; 0x2D
#_02CA8D: db $1D, $1C, $1D, $1D, $0C, $0C, $0C, $0D ; 0x2E
#_02CA95: db $1D, $1C, $1D, $1D, $0F, $0E, $0F, $0F ; 0x2F
#_02CA9D: db $1D, $1C, $1D, $1D, $08, $08, $08, $09 ; 0x30
#_02CAA5: db $1D, $1C, $1D, $1D, $0A, $0A, $0A, $0B ; 0x31
#_02CAAD: db $0B, $0A, $0B, $0B, $0A, $0A, $0A, $0B ; 0x32
#_02CAB5: db $0F, $0E, $0F, $0F, $0E, $0E, $0E, $0F ; 0x33
#_02CABD: db $1B, $1A, $1B, $1B, $16, $16, $16, $17 ; 0x34
#_02CAC5: db $1B, $1A, $1B, $1B, $0D, $0C, $0D, $0D ; 0x35
#_02CACD: db $03, $02, $03, $03, $00, $00, $00, $01 ; 0x36
#_02CAD5: db $01, $00, $01, $01, $18, $18, $18, $19 ; 0x37
#_02CADD: db $01, $00, $01, $01, $11, $10, $11, $11 ; 0x38
#_02CAE5: db $05, $04, $05, $05, $1F, $1E, $1F, $1F ; 0x39
#_02CAED: db $07, $06, $07, $07, $19, $18, $19, $19 ; 0x3A
#_02CAF5: db $05, $04, $05, $05, $18, $18, $18, $19 ; 0x3B
#_02CAFD: db $21, $20, $21, $21, $00, $00, $00, $01 ; 0x3C
#_02CB05: db $23, $22, $23, $23, $1D, $1D, $1D, $1E ; 0x3D
#_02CB0D: db $21, $20, $21, $21, $02, $02, $02, $03 ; 0x3E
#_02CB15: db $21, $20, $21, $21, $03, $03, $03, $04 ; 0x3F
#_02CB1D: db $21, $20, $21, $21, $04, $04, $04, $05 ; 0x40
#_02CB25: db $23, $22, $23, $23, $0F, $0E, $0F, $0F ; 0x41
#_02CB2D: db $21, $20, $21, $21, $06, $06, $06, $07 ; 0x42
#_02CB35: db $21, $20, $21, $21, $06, $06, $06, $07 ; 0x43
#_02CB3D: db $21, $20, $21, $21, $07, $07, $07, $08 ; 0x44
#_02CB45: db $21, $20, $21, $21, $0A, $0A, $0A, $0B ; 0x45
#_02CB4D: db $23, $22, $23, $23, $1F, $1F, $1F, $20 ; 0x46
#_02CB55: db $21, $20, $21, $21, $0C, $0C, $0C, $0D ; 0x47
#_02CB5D: db $21, $20, $21, $21, $0D, $0D, $0D, $0E ; 0x48
#_02CB65: db $21, $20, $21, $21, $0E, $0E, $0E, $0F ; 0x49
#_02CB6D: db $21, $20, $21, $21, $0F, $0F, $0F, $10 ; 0x4A
#_02CB75: db $21, $20, $21, $21, $10, $10, $10, $11 ; 0x4B
#_02CB7D: db $21, $20, $21, $21, $12, $12, $12, $13 ; 0x4C
#_02CB85: db $21, $20, $21, $21, $14, $14, $14, $15 ; 0x4D
#_02CB8D: db $21, $20, $21, $21, $16, $16, $16, $17 ; 0x4E
#_02CB95: db $21, $20, $21, $21, $18, $18, $18, $19 ; 0x4F
#_02CB9D: db $21, $20, $21, $21, $19, $19, $19, $1A ; 0x50
#_02CBA5: db $23, $22, $23, $23, $16, $16, $16, $17 ; 0x51
#_02CBAD: db $23, $22, $23, $23, $17, $17, $17, $18 ; 0x52
#_02CBB5: db $23, $22, $23, $23, $18, $18, $18, $19 ; 0x53
#_02CBBD: db $23, $22, $23, $23, $19, $19, $19, $19 ; 0x54
#_02CBC5: db $23, $22, $23, $23, $1C, $1C, $1C, $1D ; 0x55
#_02CBCD: db $25, $24, $25, $25, $01, $00, $01, $01 ; 0x56
#_02CBD5: db $23, $22, $23, $23, $00, $00, $00, $01 ; 0x57
#_02CBDD: db $23, $22, $23, $23, $05, $05, $05, $06 ; 0x58
#_02CBE5: db $23, $22, $23, $23, $02, $02, $02, $03 ; 0x59
#_02CBED: db $23, $22, $23, $23, $04, $04, $04, $05 ; 0x5A
#_02CBF5: db $23, $22, $23, $23, $06, $06, $06, $07 ; 0x5B
#_02CBFD: db $23, $22, $23, $23, $08, $08, $08, $09 ; 0x5C
#_02CC05: db $23, $22, $23, $23, $0A, $0A, $0A, $0B ; 0x5D
#_02CC0D: db $23, $22, $23, $23, $0B, $0B, $0B, $0C ; 0x5E
#_02CC15: db $21, $20, $21, $21, $1A, $1A, $1A, $1B ; 0x5F
#_02CC1D: db $21, $20, $21, $21, $1E, $1E, $1E, $1F ; 0x60
#_02CC25: db $23, $22, $23, $23, $12, $12, $12, $13 ; 0x61
#_02CC2D: db $23, $22, $23, $23, $09, $09, $09, $0A ; 0x62
#_02CC35: db $23, $22, $23, $23, $0D, $0D, $0D, $0E ; 0x63
#_02CC3D: db $25, $24, $25, $25, $02, $02, $02, $03 ; 0x64
#_02CC45: db $25, $24, $25, $25, $04, $04, $04, $05 ; 0x65
#_02CC4D: db $25, $24, $25, $25, $05, $05, $05, $06 ; 0x66
#_02CC55: db $23, $22, $23, $23, $11, $11, $11, $12 ; 0x67
#_02CC5D: db $23, $22, $23, $23, $15, $15, $15, $16 ; 0x68
#_02CC65: db $21, $20, $21, $21, $1C, $1C, $1C, $1D ; 0x69
#_02CC6D: db $21, $20, $21, $21, $1D, $1D, $1D, $1E ; 0x6A
#_02CC75: db $23, $22, $23, $23, $1E, $1E, $1E, $1F ; 0x6B
#_02CC7D: db $25, $24, $25, $25, $06, $06, $06, $07 ; 0x6C
#_02CC85: db $25, $24, $25, $25, $08, $08, $08, $09 ; 0x6D
#_02CC8D: db $25, $24, $25, $25, $09, $09, $09, $0A ; 0x6E
#_02CC95: db $25, $24, $25, $25, $0A, $0A, $0A, $0B ; 0x6F
#_02CC9D: db $25, $24, $25, $25, $0B, $0B, $0B, $0C ; 0x70
#_02CCA5: db $25, $24, $25, $25, $0C, $0C, $0C, $0D ; 0x71
#_02CCAD: db $25, $24, $25, $25, $0D, $0D, $0D, $0E ; 0x72
#_02CCB5: db $10, $10, $10, $11, $01, $00, $01, $01 ; 0x73
#_02CCBD: db $0B, $0A, $0B, $0B, $02, $02, $02, $03 ; 0x74
#_02CCC5: db $06, $06, $06, $07, $00, $00, $00, $01 ; 0x75
#_02CCCD: db $0A, $0A, $0A, $0B, $11, $10, $11, $11 ; 0x76
#_02CCD5: db $0C, $0C, $0C, $0D, $0E, $0E, $0E, $0F ; 0x77
#_02CCDD: db $0C, $0C, $0C, $0D, $11, $10, $11, $11 ; 0x78
#_02CCE5: db $0A, $0A, $0A, $0B, $0D, $0C, $0D, $0D ; 0x79
#_02CCED: db $1C, $1C, $1C, $1D, $03, $02, $03, $03 ; 0x7A
#_02CCF5: db $00, $00, $00, $01, $01, $00, $01, $01 ; 0x7B
#_02CCFD: db $03, $02, $03, $03, $10, $10, $10, $11 ; 0x7C
#_02CD05: db $0A, $0A, $0A, $0B, $0B, $0A, $0B, $0B ; 0x7D
#_02CD0D: db $1D, $1C, $1D, $1D, $07, $06, $07, $07 ; 0x7E
#_02CD15: db $1D, $1C, $1D, $1D, $04, $04, $04, $05 ; 0x7F
#_02CD1D: db $05, $04, $05, $05, $1E, $1E, $1E, $1F ; 0x80
#_02CD25: db $03, $02, $03, $03, $03, $02, $03, $03 ; 0x81
#_02CD2D: db $01, $00, $01, $01, $06, $06, $06, $07 ; 0x82
#_02CD35: db $25, $24, $25, $25, $0E, $0E, $0E, $0F ; 0x83
#_02CD3D: db $25, $24, $25, $25, $00, $00, $00, $01 ; 0x84

;---------------------------------------------------------------------------------------------------

.horizontal_scroll
#_02CD45: dw $0900 ; 0x00
#_02CD47: dw $0900 ; 0x01
#_02CD49: dw $0480 ; 0x02
#_02CD4B: dw $0100 ; 0x03
#_02CD4D: dw $0280 ; 0x04
#_02CD4F: dw $0400 ; 0x05
#_02CD51: dw $0000 ; 0x06
#_02CD53: dw $0300 ; 0x07
#_02CD55: dw $1280 ; 0x08
#_02CD57: dw $0880 ; 0x09
#_02CD59: dw $0B00 ; 0x0A
#_02CD5B: dw $0600 ; 0x0B
#_02CD5D: dw $0600 ; 0x0C
#_02CD5F: dw $0500 ; 0x0D
#_02CD61: dw $0600 ; 0x0E
#_02CD63: dw $0900 ; 0x0F
#_02CD65: dw $0A00 ; 0x10
#_02CD67: dw $0600 ; 0x11
#_02CD69: dw $0500 ; 0x12
#_02CD6B: dw $1080 ; 0x13
#_02CD6D: dw $1100 ; 0x14
#_02CD6F: dw $0700 ; 0x15
#_02CD71: dw $1680 ; 0x16
#_02CD73: dw $1700 ; 0x17
#_02CD75: dw $0A00 ; 0x18
#_02CD77: dw $0900 ; 0x19
#_02CD79: dw $1A80 ; 0x1A
#_02CD7B: dw $1B00 ; 0x1B
#_02CD7D: dw $1D00 ; 0x1C
#_02CD7F: dw $1D00 ; 0x1D
#_02CD81: dw $1F00 ; 0x1E
#_02CD83: dw $1E80 ; 0x1F
#_02CD85: dw $1E80 ; 0x20
#_02CD87: dw $1200 ; 0x21
#_02CD89: dw $1400 ; 0x22
#_02CD8B: dw $1400 ; 0x23
#_02CD8D: dw $0000 ; 0x24
#_02CD8F: dw $1080 ; 0x25
#_02CD91: dw $1480 ; 0x26
#_02CD93: dw $1000 ; 0x27
#_02CD95: dw $0C00 ; 0x28
#_02CD97: dw $0E00 ; 0x29
#_02CD99: dw $1000 ; 0x2A
#_02CD9B: dw $1200 ; 0x2B
#_02CD9D: dw $0200 ; 0x2C
#_02CD9F: dw $1D00 ; 0x2D
#_02CDA1: dw $0C00 ; 0x2E
#_02CDA3: dw $0F00 ; 0x2F
#_02CDA5: dw $0800 ; 0x30
#_02CDA7: dw $0A80 ; 0x31
#_02CDA9: dw $0A00 ; 0x32
#_02CDAB: dw $0E80 ; 0x33
#_02CDAD: dw $1680 ; 0x34
#_02CDAF: dw $0D00 ; 0x35
#_02CDB1: dw $0000 ; 0x36
#_02CDB3: dw $1880 ; 0x37
#_02CDB5: dw $1100 ; 0x38
#_02CDB7: dw $1F00 ; 0x39
#_02CDB9: dw $1900 ; 0x3A
#_02CDBB: dw $1800 ; 0x3B
#_02CDBD: dw $0000 ; 0x3C
#_02CDBF: dw $1D00 ; 0x3D
#_02CDC1: dw $0200 ; 0x3E
#_02CDC3: dw $0300 ; 0x3F
#_02CDC5: dw $0400 ; 0x40
#_02CDC7: dw $0F00 ; 0x41
#_02CDC9: dw $0600 ; 0x42
#_02CDCB: dw $0600 ; 0x43
#_02CDCD: dw $0700 ; 0x44
#_02CDCF: dw $0A00 ; 0x45
#_02CDD1: dw $1F00 ; 0x46
#_02CDD3: dw $0C00 ; 0x47
#_02CDD5: dw $0D00 ; 0x48
#_02CDD7: dw $0E00 ; 0x49
#_02CDD9: dw $0F00 ; 0x4A
#_02CDDB: dw $1000 ; 0x4B
#_02CDDD: dw $1200 ; 0x4C
#_02CDDF: dw $1400 ; 0x4D
#_02CDE1: dw $1680 ; 0x4E
#_02CDE3: dw $1800 ; 0x4F
#_02CDE5: dw $1900 ; 0x50
#_02CDE7: dw $1600 ; 0x51
#_02CDE9: dw $1700 ; 0x52
#_02CDEB: dw $1800 ; 0x53
#_02CDED: dw $1900 ; 0x54
#_02CDEF: dw $1C00 ; 0x55
#_02CDF1: dw $0100 ; 0x56
#_02CDF3: dw $0000 ; 0x57
#_02CDF5: dw $0500 ; 0x58
#_02CDF7: dw $0200 ; 0x59
#_02CDF9: dw $0400 ; 0x5A
#_02CDFB: dw $0600 ; 0x5B
#_02CDFD: dw $0800 ; 0x5C
#_02CDFF: dw $0A00 ; 0x5D
#_02CE01: dw $0B00 ; 0x5E
#_02CE03: dw $1A00 ; 0x5F
#_02CE05: dw $1E00 ; 0x60
#_02CE07: dw $1280 ; 0x61
#_02CE09: dw $0900 ; 0x62
#_02CE0B: dw $0D00 ; 0x63
#_02CE0D: dw $0200 ; 0x64
#_02CE0F: dw $0400 ; 0x65
#_02CE11: dw $0500 ; 0x66
#_02CE13: dw $1100 ; 0x67
#_02CE15: dw $1500 ; 0x68
#_02CE17: dw $1C00 ; 0x69
#_02CE19: dw $1D00 ; 0x6A
#_02CE1B: dw $1E00 ; 0x6B
#_02CE1D: dw $0600 ; 0x6C
#_02CE1F: dw $0800 ; 0x6D
#_02CE21: dw $0900 ; 0x6E
#_02CE23: dw $0A00 ; 0x6F
#_02CE25: dw $0B00 ; 0x70
#_02CE27: dw $0C00 ; 0x71
#_02CE29: dw $0D00 ; 0x72
#_02CE2B: dw $0100 ; 0x73
#_02CE2D: dw $0280 ; 0x74
#_02CE2F: dw $0000 ; 0x75
#_02CE31: dw $1100 ; 0x76
#_02CE33: dw $0E00 ; 0x77
#_02CE35: dw $1088 ; 0x78
#_02CE37: dw $0D00 ; 0x79
#_02CE39: dw $0300 ; 0x7A
#_02CE3B: dw $0100 ; 0x7B
#_02CE3D: dw $1000 ; 0x7C
#_02CE3F: dw $0B00 ; 0x7D
#_02CE41: dw $0700 ; 0x7E
#_02CE43: dw $0400 ; 0x7F
#_02CE45: dw $1E00 ; 0x80
#_02CE47: dw $0300 ; 0x81
#_02CE49: dw $0600 ; 0x82
#_02CE4B: dw $0E00 ; 0x83
#_02CE4D: dw $0000 ; 0x84

;---------------------------------------------------------------------------------------------------

.vertical_scroll
#_02CE4F: dw $2110 ; 0x00
#_02CE51: dw $2110 ; 0x01
#_02CE53: dw $0310 ; 0x02
#_02CE55: dw $0D10 ; 0x03
#_02CE57: dw $0D10 ; 0x04
#_02CE59: dw $0D10 ; 0x05
#_02CE5B: dw $1F10 ; 0x06
#_02CE5D: dw $1F10 ; 0x07
#_02CE5F: dw $1910 ; 0x08
#_02CE61: dw $1110 ; 0x09
#_02CE63: dw $1110 ; 0x0A
#_02CE65: dw $1110 ; 0x0B
#_02CE67: dw $0D10 ; 0x0C
#_02CE69: dw $1F10 ; 0x0D
#_02CE6B: dw $1F10 ; 0x0E
#_02CE6D: dw $1F10 ; 0x0F
#_02CE6F: dw $1F10 ; 0x10
#_02CE71: dw $1D10 ; 0x11
#_02CE73: dw $1D10 ; 0x12
#_02CE75: dw $1F10 ; 0x13
#_02CE77: dw $1D10 ; 0x14
#_02CE79: dw $0510 ; 0x15
#_02CE7B: dw $1F10 ; 0x16
#_02CE7D: dw $1D10 ; 0x17
#_02CE7F: dw $1B10 ; 0x18
#_02CE81: dw $0510 ; 0x19
#_02CE83: dw $1F10 ; 0x1A
#_02CE85: dw $1D10 ; 0x1B
#_02CE87: dw $1F10 ; 0x1C
#_02CE89: dw $1D10 ; 0x1D
#_02CE8B: dw $1F10 ; 0x1E
#_02CE8D: dw $1D10 ; 0x1F
#_02CE8F: dw $1B10 ; 0x20
#_02CE91: dw $1F10 ; 0x21
#_02CE93: dw $1F10 ; 0x22
#_02CE95: dw $1D10 ; 0x23
#_02CE97: dw $1D10 ; 0x24
#_02CE99: dw $0510 ; 0x25
#_02CE9B: dw $0910 ; 0x26
#_02CE9D: dw $1310 ; 0x27
#_02CE9F: dw $0B10 ; 0x28
#_02CEA1: dw $0B10 ; 0x29
#_02CEA3: dw $0B10 ; 0x2A
#_02CEA5: dw $0B10 ; 0x2B
#_02CEA7: dw $1D10 ; 0x2C
#_02CEA9: dw $0110 ; 0x2D
#_02CEAB: dw $1D10 ; 0x2E
#_02CEAD: dw $1D10 ; 0x2F
#_02CEAF: dw $1D10 ; 0x30
#_02CEB1: dw $1D10 ; 0x31
#_02CEB3: dw $0B10 ; 0x32
#_02CEB5: dw $0F10 ; 0x33
#_02CEB7: dw $1B10 ; 0x34
#_02CEB9: dw $1B10 ; 0x35
#_02CEBB: dw $0310 ; 0x36
#_02CEBD: dw $0110 ; 0x37
#_02CEBF: dw $0110 ; 0x38
#_02CEC1: dw $0510 ; 0x39
#_02CEC3: dw $0710 ; 0x3A
#_02CEC5: dw $0510 ; 0x3B
#_02CEC7: dw $2110 ; 0x3C
#_02CEC9: dw $2310 ; 0x3D
#_02CECB: dw $2110 ; 0x3E
#_02CECD: dw $2110 ; 0x3F
#_02CECF: dw $2110 ; 0x40
#_02CED1: dw $2310 ; 0x41
#_02CED3: dw $2110 ; 0x42
#_02CED5: dw $2000 ; 0x43
#_02CED7: dw $2110 ; 0x44
#_02CED9: dw $2110 ; 0x45
#_02CEDB: dw $2310 ; 0x46
#_02CEDD: dw $2110 ; 0x47
#_02CEDF: dw $2110 ; 0x48
#_02CEE1: dw $2110 ; 0x49
#_02CEE3: dw $2110 ; 0x4A
#_02CEE5: dw $2110 ; 0x4B
#_02CEE7: dw $2110 ; 0x4C
#_02CEE9: dw $2110 ; 0x4D
#_02CEEB: dw $2110 ; 0x4E
#_02CEED: dw $2110 ; 0x4F
#_02CEEF: dw $2110 ; 0x50
#_02CEF1: dw $2310 ; 0x51
#_02CEF3: dw $2310 ; 0x52
#_02CEF5: dw $2310 ; 0x53
#_02CEF7: dw $2310 ; 0x54
#_02CEF9: dw $2310 ; 0x55
#_02CEFB: dw $2510 ; 0x56
#_02CEFD: dw $2310 ; 0x57
#_02CEFF: dw $2310 ; 0x58
#_02CF01: dw $2310 ; 0x59
#_02CF03: dw $2310 ; 0x5A
#_02CF05: dw $2310 ; 0x5B
#_02CF07: dw $2310 ; 0x5C
#_02CF09: dw $2310 ; 0x5D
#_02CF0B: dw $2310 ; 0x5E
#_02CF0D: dw $2110 ; 0x5F
#_02CF0F: dw $2110 ; 0x60
#_02CF11: dw $2310 ; 0x61
#_02CF13: dw $2310 ; 0x62
#_02CF15: dw $2310 ; 0x63
#_02CF17: dw $2510 ; 0x64
#_02CF19: dw $2510 ; 0x65
#_02CF1B: dw $2510 ; 0x66
#_02CF1D: dw $2310 ; 0x67
#_02CF1F: dw $2310 ; 0x68
#_02CF21: dw $2110 ; 0x69
#_02CF23: dw $2110 ; 0x6A
#_02CF25: dw $2310 ; 0x6B
#_02CF27: dw $2510 ; 0x6C
#_02CF29: dw $2510 ; 0x6D
#_02CF2B: dw $2510 ; 0x6E
#_02CF2D: dw $2510 ; 0x6F
#_02CF2F: dw $2510 ; 0x70
#_02CF31: dw $2510 ; 0x71
#_02CF33: dw $2510 ; 0x72
#_02CF35: dw $1010 ; 0x73
#_02CF37: dw $0B10 ; 0x74
#_02CF39: dw $0610 ; 0x75
#_02CF3B: dw $0A00 ; 0x76
#_02CF3D: dw $0C00 ; 0x77
#_02CF3F: dw $0C29 ; 0x78
#_02CF41: dw $0A00 ; 0x79
#_02CF43: dw $1C3D ; 0x7A
#_02CF45: dw $0010 ; 0x7B
#_02CF47: dw $02CE ; 0x7C
#_02CF49: dw $0A10 ; 0x7D
#_02CF4B: dw $1D10 ; 0x7E
#_02CF4D: dw $1D10 ; 0x7F
#_02CF4F: dw $0510 ; 0x80
#_02CF51: dw $02AD ; 0x81
#_02CF53: dw $0110 ; 0x82
#_02CF55: dw $2510 ; 0x83
#_02CF57: dw $2510 ; 0x84

;---------------------------------------------------------------------------------------------------

.y_coordinate
#_02CF59: dw $2178 ; 0x00
#_02CF5B: dw $21D8 ; 0x01
#_02CF5D: dw $03C0 ; 0x02
#_02CF5F: dw $0DD8 ; 0x03
#_02CF61: dw $0DC0 ; 0x04
#_02CF63: dw $0DD8 ; 0x05
#_02CF65: dw $1FD8 ; 0x06
#_02CF67: dw $1FC0 ; 0x07
#_02CF69: dw $19D8 ; 0x08
#_02CF6B: dw $11D8 ; 0x09
#_02CF6D: dw $11D8 ; 0x0A
#_02CF6F: dw $11D8 ; 0x0B
#_02CF71: dw $0DD8 ; 0x0C
#_02CF73: dw $1FD8 ; 0x0D
#_02CF75: dw $1FD8 ; 0x0E
#_02CF77: dw $1FD8 ; 0x0F
#_02CF79: dw $1FD8 ; 0x10
#_02CF7B: dw $1DD8 ; 0x11
#_02CF7D: dw $1DD8 ; 0x12
#_02CF7F: dw $1FD8 ; 0x13
#_02CF81: dw $1DD8 ; 0x14
#_02CF83: dw $05D8 ; 0x15
#_02CF85: dw $1FD8 ; 0x16
#_02CF87: dw $1DD8 ; 0x17
#_02CF89: dw $1BD8 ; 0x18
#_02CF8B: dw $05D8 ; 0x19
#_02CF8D: dw $1FC0 ; 0x1A
#_02CF8F: dw $1DD8 ; 0x1B
#_02CF91: dw $1FC0 ; 0x1C
#_02CF93: dw $1DD8 ; 0x1D
#_02CF95: dw $1FD8 ; 0x1E
#_02CF97: dw $1DD8 ; 0x1F
#_02CF99: dw $1BD8 ; 0x20
#_02CF9B: dw $1FD8 ; 0x21
#_02CF9D: dw $1FC0 ; 0x22
#_02CF9F: dw $1DD8 ; 0x23
#_02CFA1: dw $1DD8 ; 0x24
#_02CFA3: dw $05D8 ; 0x25
#_02CFA5: dw $09D8 ; 0x26
#_02CFA7: dw $13D8 ; 0x27
#_02CFA9: dw $0BD8 ; 0x28
#_02CFAB: dw $0BD8 ; 0x29
#_02CFAD: dw $0BD8 ; 0x2A
#_02CFAF: dw $0BD8 ; 0x2B
#_02CFB1: dw $1DD8 ; 0x2C
#_02CFB3: dw $01D8 ; 0x2D
#_02CFB5: dw $1DC0 ; 0x2E
#_02CFB7: dw $1DC0 ; 0x2F
#_02CFB9: dw $1DC0 ; 0x30
#_02CFBB: dw $1DD8 ; 0x31
#_02CFBD: dw $0BD8 ; 0x32
#_02CFBF: dw $0FC0 ; 0x33
#_02CFC1: dw $1BD8 ; 0x34
#_02CFC3: dw $1BD8 ; 0x35
#_02CFC5: dw $03D8 ; 0x36
#_02CFC7: dw $01D8 ; 0x37
#_02CFC9: dw $01D8 ; 0x38
#_02CFCB: dw $05D8 ; 0x39
#_02CFCD: dw $07D8 ; 0x3A
#_02CFCF: dw $05D8 ; 0x3B
#_02CFD1: dw $21D8 ; 0x3C
#_02CFD3: dw $23D8 ; 0x3D
#_02CFD5: dw $21D8 ; 0x3E
#_02CFD7: dw $21D8 ; 0x3F
#_02CFD9: dw $21D8 ; 0x40
#_02CFDB: dw $23D8 ; 0x41
#_02CFDD: dw $21D8 ; 0x42
#_02CFDF: dw $2020 ; 0x43
#_02CFE1: dw $21D8 ; 0x44
#_02CFE3: dw $21D8 ; 0x45
#_02CFE5: dw $23D8 ; 0x46
#_02CFE7: dw $21D8 ; 0x47
#_02CFE9: dw $21D8 ; 0x48
#_02CFEB: dw $21D8 ; 0x49
#_02CFED: dw $21D8 ; 0x4A
#_02CFEF: dw $21D8 ; 0x4B
#_02CFF1: dw $21D8 ; 0x4C
#_02CFF3: dw $21C0 ; 0x4D
#_02CFF5: dw $21D8 ; 0x4E
#_02CFF7: dw $21D8 ; 0x4F
#_02CFF9: dw $21D8 ; 0x50
#_02CFFB: dw $23C0 ; 0x51
#_02CFFD: dw $23D8 ; 0x52
#_02CFFF: dw $23D8 ; 0x53
#_02D001: dw $23D8 ; 0x54
#_02D003: dw $23D8 ; 0x55
#_02D005: dw $25D8 ; 0x56
#_02D007: dw $23D8 ; 0x57
#_02D009: dw $23D8 ; 0x58
#_02D00B: dw $23D8 ; 0x59
#_02D00D: dw $23D8 ; 0x5A
#_02D00F: dw $23D8 ; 0x5B
#_02D011: dw $23D8 ; 0x5C
#_02D013: dw $23D8 ; 0x5D
#_02D015: dw $23D8 ; 0x5E
#_02D017: dw $21D8 ; 0x5F
#_02D019: dw $21D8 ; 0x60
#_02D01B: dw $23D8 ; 0x61
#_02D01D: dw $23D8 ; 0x62
#_02D01F: dw $23D8 ; 0x63
#_02D021: dw $25D8 ; 0x64
#_02D023: dw $25D8 ; 0x65
#_02D025: dw $25D8 ; 0x66
#_02D027: dw $23D8 ; 0x67
#_02D029: dw $23D8 ; 0x68
#_02D02B: dw $21C0 ; 0x69
#_02D02D: dw $21C0 ; 0x6A
#_02D02F: dw $23D8 ; 0x6B
#_02D031: dw $25D8 ; 0x6C
#_02D033: dw $25D8 ; 0x6D
#_02D035: dw $25D8 ; 0x6E
#_02D037: dw $25D8 ; 0x6F
#_02D039: dw $25D8 ; 0x70
#_02D03B: dw $25D8 ; 0x71
#_02D03D: dw $25D8 ; 0x72
#_02D03F: dw $1080 ; 0x73
#_02D041: dw $0BA8 ; 0x74
#_02D043: dw $0698 ; 0x75
#_02D045: dw $0A69 ; 0x76
#_02D047: dw $0C68 ; 0x77
#_02D049: dw $0C96 ; 0x78
#_02D04B: dw $0A68 ; 0x79
#_02D04D: dw $1CA9 ; 0x7A
#_02D04F: dw $0089 ; 0x7B
#_02D051: dw $033B ; 0x7C
#_02D053: dw $0A96 ; 0x7D
#_02D055: dw $1D7D ; 0x7E
#_02D057: dw $1D89 ; 0x7F
#_02D059: dw $0589 ; 0x80
#_02D05B: dw $031A ; 0x81
#_02D05D: dw $0197 ; 0x82
#_02D05F: dw $25D8 ; 0x83
#_02D061: dw $25D8 ; 0x84

;---------------------------------------------------------------------------------------------------

.x_coordinate
#_02D063: dw $0978 ; 0x00
#_02D065: dw $0978 ; 0x01
#_02D067: dw $04F8 ; 0x02
#_02D069: dw $0178 ; 0x03
#_02D06B: dw $02F8 ; 0x04
#_02D06D: dw $0478 ; 0x05
#_02D06F: dw $0078 ; 0x06
#_02D071: dw $0378 ; 0x07
#_02D073: dw $12F8 ; 0x08
#_02D075: dw $08F8 ; 0x09
#_02D077: dw $0B78 ; 0x0A
#_02D079: dw $0678 ; 0x0B
#_02D07B: dw $0678 ; 0x0C
#_02D07D: dw $0578 ; 0x0D
#_02D07F: dw $0678 ; 0x0E
#_02D081: dw $0978 ; 0x0F
#_02D083: dw $0A78 ; 0x10
#_02D085: dw $0678 ; 0x11
#_02D087: dw $0578 ; 0x12
#_02D089: dw $10F8 ; 0x13
#_02D08B: dw $1178 ; 0x14
#_02D08D: dw $0778 ; 0x15
#_02D08F: dw $16F8 ; 0x16
#_02D091: dw $1778 ; 0x17
#_02D093: dw $0A78 ; 0x18
#_02D095: dw $0978 ; 0x19
#_02D097: dw $1AF8 ; 0x1A
#_02D099: dw $1B78 ; 0x1B
#_02D09B: dw $1D78 ; 0x1C
#_02D09D: dw $1D78 ; 0x1D
#_02D09F: dw $1F78 ; 0x1E
#_02D0A1: dw $1EF8 ; 0x1F
#_02D0A3: dw $1EF8 ; 0x20
#_02D0A5: dw $1278 ; 0x21
#_02D0A7: dw $1478 ; 0x22
#_02D0A9: dw $1478 ; 0x23
#_02D0AB: dw $0078 ; 0x24
#_02D0AD: dw $10F8 ; 0x25
#_02D0AF: dw $14F8 ; 0x26
#_02D0B1: dw $1078 ; 0x27
#_02D0B3: dw $0C78 ; 0x28
#_02D0B5: dw $0E78 ; 0x29
#_02D0B7: dw $1078 ; 0x2A
#_02D0B9: dw $1278 ; 0x2B
#_02D0BB: dw $0278 ; 0x2C
#_02D0BD: dw $1D78 ; 0x2D
#_02D0BF: dw $0C78 ; 0x2E
#_02D0C1: dw $0F78 ; 0x2F
#_02D0C3: dw $0878 ; 0x30
#_02D0C5: dw $0AF8 ; 0x31
#_02D0C7: dw $0A78 ; 0x32
#_02D0C9: dw $0EF8 ; 0x33
#_02D0CB: dw $16F8 ; 0x34
#_02D0CD: dw $0D78 ; 0x35
#_02D0CF: dw $0078 ; 0x36
#_02D0D1: dw $18F8 ; 0x37
#_02D0D3: dw $1178 ; 0x38
#_02D0D5: dw $1F78 ; 0x39
#_02D0D7: dw $1978 ; 0x3A
#_02D0D9: dw $1878 ; 0x3B
#_02D0DB: dw $0078 ; 0x3C
#_02D0DD: dw $1D78 ; 0x3D
#_02D0DF: dw $0278 ; 0x3E
#_02D0E1: dw $0378 ; 0x3F
#_02D0E3: dw $0478 ; 0x40
#_02D0E5: dw $0F78 ; 0x41
#_02D0E7: dw $0678 ; 0x42
#_02D0E9: dw $0678 ; 0x43
#_02D0EB: dw $0778 ; 0x44
#_02D0ED: dw $0A78 ; 0x45
#_02D0EF: dw $1F78 ; 0x46
#_02D0F1: dw $0C78 ; 0x47
#_02D0F3: dw $0D78 ; 0x48
#_02D0F5: dw $0E78 ; 0x49
#_02D0F7: dw $0F78 ; 0x4A
#_02D0F9: dw $1078 ; 0x4B
#_02D0FB: dw $1278 ; 0x4C
#_02D0FD: dw $1478 ; 0x4D
#_02D0FF: dw $16F8 ; 0x4E
#_02D101: dw $1878 ; 0x4F
#_02D103: dw $1978 ; 0x50
#_02D105: dw $1678 ; 0x51
#_02D107: dw $1778 ; 0x52
#_02D109: dw $1878 ; 0x53
#_02D10B: dw $1978 ; 0x54
#_02D10D: dw $1C78 ; 0x55
#_02D10F: dw $0178 ; 0x56
#_02D111: dw $0078 ; 0x57
#_02D113: dw $0578 ; 0x58
#_02D115: dw $0278 ; 0x59
#_02D117: dw $0478 ; 0x5A
#_02D119: dw $0678 ; 0x5B
#_02D11B: dw $0878 ; 0x5C
#_02D11D: dw $0A78 ; 0x5D
#_02D11F: dw $0B78 ; 0x5E
#_02D121: dw $1A78 ; 0x5F
#_02D123: dw $1E78 ; 0x60
#_02D125: dw $12F8 ; 0x61
#_02D127: dw $0978 ; 0x62
#_02D129: dw $0D78 ; 0x63
#_02D12B: dw $0278 ; 0x64
#_02D12D: dw $0478 ; 0x65
#_02D12F: dw $0578 ; 0x66
#_02D131: dw $1178 ; 0x67
#_02D133: dw $1578 ; 0x68
#_02D135: dw $1C78 ; 0x69
#_02D137: dw $1D78 ; 0x6A
#_02D139: dw $1E78 ; 0x6B
#_02D13B: dw $0678 ; 0x6C
#_02D13D: dw $0878 ; 0x6D
#_02D13F: dw $0978 ; 0x6E
#_02D141: dw $0A78 ; 0x6F
#_02D143: dw $0B78 ; 0x70
#_02D145: dw $0C78 ; 0x71
#_02D147: dw $0D78 ; 0x72
#_02D149: dw $01A8 ; 0x73
#_02D14B: dw $02F8 ; 0x74
#_02D14D: dw $0078 ; 0x75
#_02D14F: dw $1190 ; 0x76
#_02D151: dw $0E80 ; 0x77
#_02D153: dw $1100 ; 0x78
#_02D155: dw $0D40 ; 0x79
#_02D157: dw $0370 ; 0x7A
#_02D159: dw $017F ; 0x7B
#_02D15B: dw $1073 ; 0x7C
#_02D15D: dw $0B9F ; 0x7D
#_02D15F: dw $0778 ; 0x7E
#_02D161: dw $047F ; 0x7F
#_02D163: dw $1E61 ; 0x80
#_02D165: dw $0393 ; 0x81
#_02D167: dw $0677 ; 0x82
#_02D169: dw $0E78 ; 0x83
#_02D16B: dw $0078 ; 0x84

;---------------------------------------------------------------------------------------------------

.camera_trigger_y
#_02D16D: dw $0187 ; 0x00
#_02D16F: dw $0187 ; 0x01
#_02D171: dw $0187 ; 0x02
#_02D173: dw $0187 ; 0x03
#_02D175: dw $0187 ; 0x04
#_02D177: dw $0187 ; 0x05
#_02D179: dw $0187 ; 0x06
#_02D17B: dw $0187 ; 0x07
#_02D17D: dw $0187 ; 0x08
#_02D17F: dw $0187 ; 0x09
#_02D181: dw $0187 ; 0x0A
#_02D183: dw $0187 ; 0x0B
#_02D185: dw $0187 ; 0x0C
#_02D187: dw $0187 ; 0x0D
#_02D189: dw $0187 ; 0x0E
#_02D18B: dw $0187 ; 0x0F
#_02D18D: dw $0187 ; 0x10
#_02D18F: dw $0187 ; 0x11
#_02D191: dw $0187 ; 0x12
#_02D193: dw $0187 ; 0x13
#_02D195: dw $0187 ; 0x14
#_02D197: dw $0187 ; 0x15
#_02D199: dw $0187 ; 0x16
#_02D19B: dw $0187 ; 0x17
#_02D19D: dw $0187 ; 0x18
#_02D19F: dw $0187 ; 0x19
#_02D1A1: dw $0187 ; 0x1A
#_02D1A3: dw $0187 ; 0x1B
#_02D1A5: dw $0187 ; 0x1C
#_02D1A7: dw $0187 ; 0x1D
#_02D1A9: dw $0187 ; 0x1E
#_02D1AB: dw $0187 ; 0x1F
#_02D1AD: dw $0187 ; 0x20
#_02D1AF: dw $0187 ; 0x21
#_02D1B1: dw $0187 ; 0x22
#_02D1B3: dw $0187 ; 0x23
#_02D1B5: dw $0187 ; 0x24
#_02D1B7: dw $0187 ; 0x25
#_02D1B9: dw $0187 ; 0x26
#_02D1BB: dw $0187 ; 0x27
#_02D1BD: dw $0187 ; 0x28
#_02D1BF: dw $0187 ; 0x29
#_02D1C1: dw $0187 ; 0x2A
#_02D1C3: dw $0187 ; 0x2B
#_02D1C5: dw $0187 ; 0x2C
#_02D1C7: dw $0187 ; 0x2D
#_02D1C9: dw $0187 ; 0x2E
#_02D1CB: dw $0187 ; 0x2F
#_02D1CD: dw $0187 ; 0x30
#_02D1CF: dw $0187 ; 0x31
#_02D1D1: dw $0187 ; 0x32
#_02D1D3: dw $0187 ; 0x33
#_02D1D5: dw $0187 ; 0x34
#_02D1D7: dw $0187 ; 0x35
#_02D1D9: dw $0187 ; 0x36
#_02D1DB: dw $0187 ; 0x37
#_02D1DD: dw $0187 ; 0x38
#_02D1DF: dw $0187 ; 0x39
#_02D1E1: dw $0187 ; 0x3A
#_02D1E3: dw $0187 ; 0x3B
#_02D1E5: dw $0187 ; 0x3C
#_02D1E7: dw $0187 ; 0x3D
#_02D1E9: dw $0187 ; 0x3E
#_02D1EB: dw $0187 ; 0x3F
#_02D1ED: dw $0187 ; 0x40
#_02D1EF: dw $0187 ; 0x41
#_02D1F1: dw $0187 ; 0x42
#_02D1F3: dw $0074 ; 0x43
#_02D1F5: dw $0187 ; 0x44
#_02D1F7: dw $0187 ; 0x45
#_02D1F9: dw $0187 ; 0x46
#_02D1FB: dw $0187 ; 0x47
#_02D1FD: dw $0187 ; 0x48
#_02D1FF: dw $0187 ; 0x49
#_02D201: dw $0187 ; 0x4A
#_02D203: dw $0187 ; 0x4B
#_02D205: dw $0187 ; 0x4C
#_02D207: dw $0187 ; 0x4D
#_02D209: dw $0187 ; 0x4E
#_02D20B: dw $0187 ; 0x4F
#_02D20D: dw $0187 ; 0x50
#_02D20F: dw $0187 ; 0x51
#_02D211: dw $0187 ; 0x52
#_02D213: dw $0187 ; 0x53
#_02D215: dw $0187 ; 0x54
#_02D217: dw $0187 ; 0x55
#_02D219: dw $0187 ; 0x56
#_02D21B: dw $0187 ; 0x57
#_02D21D: dw $0187 ; 0x58
#_02D21F: dw $0187 ; 0x59
#_02D221: dw $0187 ; 0x5A
#_02D223: dw $0187 ; 0x5B
#_02D225: dw $0187 ; 0x5C
#_02D227: dw $0187 ; 0x5D
#_02D229: dw $0187 ; 0x5E
#_02D22B: dw $0187 ; 0x5F
#_02D22D: dw $0187 ; 0x60
#_02D22F: dw $0187 ; 0x61
#_02D231: dw $0187 ; 0x62
#_02D233: dw $0187 ; 0x63
#_02D235: dw $0187 ; 0x64
#_02D237: dw $0187 ; 0x65
#_02D239: dw $0187 ; 0x66
#_02D23B: dw $0187 ; 0x67
#_02D23D: dw $0187 ; 0x68
#_02D23F: dw $0187 ; 0x69
#_02D241: dw $0187 ; 0x6A
#_02D243: dw $0187 ; 0x6B
#_02D245: dw $0187 ; 0x6C
#_02D247: dw $0187 ; 0x6D
#_02D249: dw $0187 ; 0x6E
#_02D24B: dw $0187 ; 0x6F
#_02D24D: dw $0187 ; 0x70
#_02D24F: dw $0187 ; 0x71
#_02D251: dw $0187 ; 0x72
#_02D253: dw $0088 ; 0x73
#_02D255: dw $0188 ; 0x74
#_02D257: dw $0088 ; 0x75
#_02D259: dw $0077 ; 0x76
#_02D25B: dw $0078 ; 0x77
#_02D25D: dw $00A1 ; 0x78
#_02D25F: dw $0077 ; 0x79
#_02D261: dw $00B4 ; 0x7A
#_02D263: dw $0088 ; 0x7B
#_02D265: dw $0146 ; 0x7C
#_02D267: dw $0088 ; 0x7D
#_02D269: dw $0188 ; 0x7E
#_02D26B: dw $0187 ; 0x7F
#_02D26D: dw $0187 ; 0x80
#_02D26F: dw $0125 ; 0x81
#_02D271: dw $0188 ; 0x82
#_02D273: dw $0187 ; 0x83
#_02D275: dw $0187 ; 0x84

;---------------------------------------------------------------------------------------------------

.camera_trigger_x
#_02D277: dw $017F ; 0x00
#_02D279: dw $017F ; 0x01
#_02D27B: dw $00FF ; 0x02
#_02D27D: dw $017F ; 0x03
#_02D27F: dw $00FF ; 0x04
#_02D281: dw $007F ; 0x05
#_02D283: dw $007F ; 0x06
#_02D285: dw $017F ; 0x07
#_02D287: dw $00FF ; 0x08
#_02D289: dw $00FF ; 0x09
#_02D28B: dw $017F ; 0x0A
#_02D28D: dw $007F ; 0x0B
#_02D28F: dw $007F ; 0x0C
#_02D291: dw $017F ; 0x0D
#_02D293: dw $007F ; 0x0E
#_02D295: dw $017F ; 0x0F
#_02D297: dw $007F ; 0x10
#_02D299: dw $007F ; 0x11
#_02D29B: dw $017F ; 0x12
#_02D29D: dw $00FF ; 0x13
#_02D29F: dw $017F ; 0x14
#_02D2A1: dw $017F ; 0x15
#_02D2A3: dw $00FF ; 0x16
#_02D2A5: dw $017F ; 0x17
#_02D2A7: dw $007F ; 0x18
#_02D2A9: dw $017F ; 0x19
#_02D2AB: dw $00FF ; 0x1A
#_02D2AD: dw $017F ; 0x1B
#_02D2AF: dw $017F ; 0x1C
#_02D2B1: dw $017F ; 0x1D
#_02D2B3: dw $017F ; 0x1E
#_02D2B5: dw $00FF ; 0x1F
#_02D2B7: dw $00FF ; 0x20
#_02D2B9: dw $007F ; 0x21
#_02D2BB: dw $007F ; 0x22
#_02D2BD: dw $007F ; 0x23
#_02D2BF: dw $007F ; 0x24
#_02D2C1: dw $00FF ; 0x25
#_02D2C3: dw $00FF ; 0x26
#_02D2C5: dw $007F ; 0x27
#_02D2C7: dw $007F ; 0x28
#_02D2C9: dw $007F ; 0x29
#_02D2CB: dw $007F ; 0x2A
#_02D2CD: dw $007F ; 0x2B
#_02D2CF: dw $007F ; 0x2C
#_02D2D1: dw $017F ; 0x2D
#_02D2D3: dw $007F ; 0x2E
#_02D2D5: dw $017F ; 0x2F
#_02D2D7: dw $007F ; 0x30
#_02D2D9: dw $00FF ; 0x31
#_02D2DB: dw $007F ; 0x32
#_02D2DD: dw $00FF ; 0x33
#_02D2DF: dw $00FF ; 0x34
#_02D2E1: dw $017F ; 0x35
#_02D2E3: dw $007F ; 0x36
#_02D2E5: dw $00FF ; 0x37
#_02D2E7: dw $017F ; 0x38
#_02D2E9: dw $017F ; 0x39
#_02D2EB: dw $017F ; 0x3A
#_02D2ED: dw $007F ; 0x3B
#_02D2EF: dw $007F ; 0x3C
#_02D2F1: dw $017F ; 0x3D
#_02D2F3: dw $007F ; 0x3E
#_02D2F5: dw $017F ; 0x3F
#_02D2F7: dw $007F ; 0x40
#_02D2F9: dw $017F ; 0x41
#_02D2FB: dw $007F ; 0x42
#_02D2FD: dw $007F ; 0x43
#_02D2FF: dw $017F ; 0x44
#_02D301: dw $007F ; 0x45
#_02D303: dw $017F ; 0x46
#_02D305: dw $007F ; 0x47
#_02D307: dw $017F ; 0x48
#_02D309: dw $007F ; 0x49
#_02D30B: dw $017F ; 0x4A
#_02D30D: dw $007F ; 0x4B
#_02D30F: dw $007F ; 0x4C
#_02D311: dw $007F ; 0x4D
#_02D313: dw $00FF ; 0x4E
#_02D315: dw $007F ; 0x4F
#_02D317: dw $017F ; 0x50
#_02D319: dw $007F ; 0x51
#_02D31B: dw $017F ; 0x52
#_02D31D: dw $007F ; 0x53
#_02D31F: dw $017F ; 0x54
#_02D321: dw $007F ; 0x55
#_02D323: dw $017F ; 0x56
#_02D325: dw $007F ; 0x57
#_02D327: dw $017F ; 0x58
#_02D329: dw $007F ; 0x59
#_02D32B: dw $007F ; 0x5A
#_02D32D: dw $007F ; 0x5B
#_02D32F: dw $007F ; 0x5C
#_02D331: dw $007F ; 0x5D
#_02D333: dw $017F ; 0x5E
#_02D335: dw $007F ; 0x5F
#_02D337: dw $007F ; 0x60
#_02D339: dw $00FF ; 0x61
#_02D33B: dw $017F ; 0x62
#_02D33D: dw $017F ; 0x63
#_02D33F: dw $007F ; 0x64
#_02D341: dw $007F ; 0x65
#_02D343: dw $017F ; 0x66
#_02D345: dw $017F ; 0x67
#_02D347: dw $017F ; 0x68
#_02D349: dw $007F ; 0x69
#_02D34B: dw $017F ; 0x6A
#_02D34D: dw $007F ; 0x6B
#_02D34F: dw $007F ; 0x6C
#_02D351: dw $007F ; 0x6D
#_02D353: dw $017F ; 0x6E
#_02D355: dw $007F ; 0x6F
#_02D357: dw $017F ; 0x70
#_02D359: dw $007F ; 0x71
#_02D35B: dw $017F ; 0x72
#_02D35D: dw $017F ; 0x73
#_02D35F: dw $00FF ; 0x74
#_02D361: dw $007F ; 0x75
#_02D363: dw $017F ; 0x76
#_02D365: dw $007F ; 0x77
#_02D367: dw $0107 ; 0x78
#_02D369: dw $017F ; 0x79
#_02D36B: dw $017F ; 0x7A
#_02D36D: dw $017F ; 0x7B
#_02D36F: dw $007F ; 0x7C
#_02D371: dw $017F ; 0x7D
#_02D373: dw $017F ; 0x7E
#_02D375: dw $007F ; 0x7F
#_02D377: dw $007F ; 0x80
#_02D379: dw $017F ; 0x81
#_02D37B: dw $007F ; 0x82
#_02D37D: dw $007F ; 0x83
#_02D37F: dw $007F ; 0x84

;---------------------------------------------------------------------------------------------------

.main_GFX
#_02D381: db $03 ; 0x00
#_02D382: db $03 ; 0x01
#_02D383: db $04 ; 0x02
#_02D384: db $04 ; 0x03
#_02D385: db $04 ; 0x04
#_02D386: db $04 ; 0x05
#_02D387: db $06 ; 0x06
#_02D388: db $06 ; 0x07
#_02D389: db $05 ; 0x08
#_02D38A: db $12 ; 0x09
#_02D38B: db $12 ; 0x0A
#_02D38C: db $12 ; 0x0B
#_02D38D: db $12 ; 0x0C
#_02D38E: db $03 ; 0x0D
#_02D38F: db $03 ; 0x0E
#_02D390: db $03 ; 0x0F
#_02D391: db $03 ; 0x10
#_02D392: db $06 ; 0x11
#_02D393: db $06 ; 0x12
#_02D394: db $06 ; 0x13
#_02D395: db $06 ; 0x14
#_02D396: db $0D ; 0x15
#_02D397: db $06 ; 0x16
#_02D398: db $06 ; 0x17
#_02D399: db $0D ; 0x18
#_02D39A: db $0D ; 0x19
#_02D39B: db $06 ; 0x1A
#_02D39C: db $06 ; 0x1B
#_02D39D: db $06 ; 0x1C
#_02D39E: db $06 ; 0x1D
#_02D39F: db $06 ; 0x1E
#_02D3A0: db $06 ; 0x1F
#_02D3A1: db $06 ; 0x20
#_02D3A2: db $06 ; 0x21
#_02D3A3: db $06 ; 0x22
#_02D3A4: db $06 ; 0x23
#_02D3A5: db $04 ; 0x24
#_02D3A6: db $08 ; 0x25
#_02D3A7: db $07 ; 0x26
#_02D3A8: db $0C ; 0x27
#_02D3A9: db $09 ; 0x28
#_02D3AA: db $09 ; 0x29
#_02D3AB: db $09 ; 0x2A
#_02D3AC: db $09 ; 0x2B
#_02D3AD: db $06 ; 0x2C
#_02D3AE: db $0B ; 0x2D
#_02D3AF: db $06 ; 0x2E
#_02D3B0: db $06 ; 0x2F
#_02D3B1: db $14 ; 0x30
#_02D3B2: db $14 ; 0x31
#_02D3B3: db $01 ; 0x32
#_02D3B4: db $05 ; 0x33
#_02D3B5: db $0A ; 0x34
#_02D3B6: db $0D ; 0x35
#_02D3B7: db $13 ; 0x36
#_02D3B8: db $0E ; 0x37
#_02D3B9: db $06 ; 0x38
#_02D3BA: db $06 ; 0x39
#_02D3BB: db $06 ; 0x3A
#_02D3BC: db $06 ; 0x3B
#_02D3BD: db $03 ; 0x3C
#_02D3BE: db $06 ; 0x3D
#_02D3BF: db $03 ; 0x3E
#_02D3C0: db $03 ; 0x3F
#_02D3C1: db $03 ; 0x40
#_02D3C2: db $14 ; 0x41
#_02D3C3: db $03 ; 0x42
#_02D3C4: db $03 ; 0x43
#_02D3C5: db $03 ; 0x44
#_02D3C6: db $0F ; 0x45
#_02D3C7: db $03 ; 0x46
#_02D3C8: db $03 ; 0x47
#_02D3C9: db $03 ; 0x48
#_02D3CA: db $03 ; 0x49
#_02D3CB: db $03 ; 0x4A
#_02D3CC: db $03 ; 0x4B
#_02D3CD: db $03 ; 0x4C
#_02D3CE: db $06 ; 0x4D
#_02D3CF: db $08 ; 0x4E
#_02D3D0: db $06 ; 0x4F
#_02D3D1: db $06 ; 0x50
#_02D3D2: db $06 ; 0x51
#_02D3D3: db $06 ; 0x52
#_02D3D4: db $03 ; 0x53
#_02D3D5: db $03 ; 0x54
#_02D3D6: db $06 ; 0x55
#_02D3D7: db $06 ; 0x56
#_02D3D8: db $03 ; 0x57
#_02D3D9: db $14 ; 0x58
#_02D3DA: db $11 ; 0x59
#_02D3DB: db $14 ; 0x5A
#_02D3DC: db $01 ; 0x5B
#_02D3DD: db $06 ; 0x5C
#_02D3DE: db $06 ; 0x5D
#_02D3DF: db $06 ; 0x5E
#_02D3E0: db $08 ; 0x5F
#_02D3E1: db $03 ; 0x60
#_02D3E2: db $0A ; 0x61
#_02D3E3: db $06 ; 0x62
#_02D3E4: db $12 ; 0x63
#_02D3E5: db $11 ; 0x64
#_02D3E6: db $11 ; 0x65
#_02D3E7: db $11 ; 0x66
#_02D3E8: db $03 ; 0x67
#_02D3E9: db $0F ; 0x68
#_02D3EA: db $14 ; 0x69
#_02D3EB: db $14 ; 0x6A
#_02D3EC: db $03 ; 0x6B
#_02D3ED: db $06 ; 0x6C
#_02D3EE: db $06 ; 0x6D
#_02D3EF: db $06 ; 0x6E
#_02D3F0: db $06 ; 0x6F
#_02D3F1: db $06 ; 0x70
#_02D3F2: db $06 ; 0x71
#_02D3F3: db $06 ; 0x72
#_02D3F4: db $01 ; 0x73
#_02D3F5: db $04 ; 0x74
#_02D3F6: db $02 ; 0x75
#_02D3F7: db $09 ; 0x76
#_02D3F8: db $09 ; 0x77
#_02D3F9: db $09 ; 0x78
#_02D3FA: db $09 ; 0x79
#_02D3FB: db $06 ; 0x7A
#_02D3FC: db $13 ; 0x7B
#_02D3FD: db $06 ; 0x7C
#_02D3FE: db $01 ; 0x7D
#_02D3FF: db $06 ; 0x7E
#_02D400: db $06 ; 0x7F
#_02D401: db $06 ; 0x80
#_02D402: db $01 ; 0x81
#_02D403: db $06 ; 0x82
#_02D404: db $06 ; 0x83
#_02D405: db $06 ; 0x84

;---------------------------------------------------------------------------------------------------

.floor
#_02D406: db $00 ; 0x00
#_02D407: db $00 ; 0x01
#_02D408: db $00 ; 0x02
#_02D409: db $00 ; 0x03
#_02D40A: db $00 ; 0x04
#_02D40B: db $00 ; 0x05
#_02D40C: db $00 ; 0x06
#_02D40D: db $00 ; 0x07
#_02D40E: db $00 ; 0x08
#_02D40F: db $FF ; 0x09
#_02D410: db $FF ; 0x0A
#_02D411: db $FF ; 0x0B
#_02D412: db $00 ; 0x0C
#_02D413: db $00 ; 0x0D
#_02D414: db $00 ; 0x0E
#_02D415: db $00 ; 0x0F
#_02D416: db $00 ; 0x10
#_02D417: db $FF ; 0x11
#_02D418: db $FF ; 0x12
#_02D419: db $00 ; 0x13
#_02D41A: db $01 ; 0x14
#_02D41B: db $FF ; 0x15
#_02D41C: db $00 ; 0x16
#_02D41D: db $01 ; 0x17
#_02D41E: db $FE ; 0x18
#_02D41F: db $FF ; 0x19
#_02D420: db $00 ; 0x1A
#_02D421: db $01 ; 0x1B
#_02D422: db $00 ; 0x1C
#_02D423: db $01 ; 0x1D
#_02D424: db $FF ; 0x1E
#_02D425: db $00 ; 0x1F
#_02D426: db $01 ; 0x20
#_02D427: db $00 ; 0x21
#_02D428: db $00 ; 0x22
#_02D429: db $01 ; 0x23
#_02D42A: db $01 ; 0x24
#_02D42B: db $00 ; 0x25
#_02D42C: db $00 ; 0x26
#_02D42D: db $00 ; 0x27
#_02D42E: db $FF ; 0x28
#_02D42F: db $FF ; 0x29
#_02D430: db $FF ; 0x2A
#_02D431: db $FF ; 0x2B
#_02D432: db $FF ; 0x2C
#_02D433: db $00 ; 0x2D
#_02D434: db $00 ; 0x2E
#_02D435: db $00 ; 0x2F
#_02D436: db $00 ; 0x30
#_02D437: db $00 ; 0x31
#_02D438: db $FF ; 0x32
#_02D439: db $01 ; 0x33
#_02D43A: db $FF ; 0x34
#_02D43B: db $00 ; 0x35
#_02D43C: db $00 ; 0x36
#_02D43D: db $01 ; 0x37
#_02D43E: db $FF ; 0x38
#_02D43F: db $FF ; 0x39
#_02D440: db $FF ; 0x3A
#_02D441: db $FF ; 0x3B
#_02D442: db $00 ; 0x3C
#_02D443: db $00 ; 0x3D
#_02D444: db $00 ; 0x3E
#_02D445: db $00 ; 0x3F
#_02D446: db $00 ; 0x40
#_02D447: db $00 ; 0x41
#_02D448: db $00 ; 0x42
#_02D449: db $00 ; 0x43
#_02D44A: db $00 ; 0x44
#_02D44B: db $00 ; 0x45
#_02D44C: db $00 ; 0x46
#_02D44D: db $00 ; 0x47
#_02D44E: db $00 ; 0x48
#_02D44F: db $00 ; 0x49
#_02D450: db $00 ; 0x4A
#_02D451: db $00 ; 0x4B
#_02D452: db $00 ; 0x4C
#_02D453: db $00 ; 0x4D
#_02D454: db $00 ; 0x4E
#_02D455: db $00 ; 0x4F
#_02D456: db $00 ; 0x50
#_02D457: db $00 ; 0x51
#_02D458: db $00 ; 0x52
#_02D459: db $00 ; 0x53
#_02D45A: db $00 ; 0x54
#_02D45B: db $00 ; 0x55
#_02D45C: db $00 ; 0x56
#_02D45D: db $00 ; 0x57
#_02D45E: db $00 ; 0x58
#_02D45F: db $00 ; 0x59
#_02D460: db $00 ; 0x5A
#_02D461: db $00 ; 0x5B
#_02D462: db $00 ; 0x5C
#_02D463: db $00 ; 0x5D
#_02D464: db $00 ; 0x5E
#_02D465: db $00 ; 0x5F
#_02D466: db $00 ; 0x60
#_02D467: db $00 ; 0x61
#_02D468: db $00 ; 0x62
#_02D469: db $00 ; 0x63
#_02D46A: db $00 ; 0x64
#_02D46B: db $00 ; 0x65
#_02D46C: db $00 ; 0x66
#_02D46D: db $00 ; 0x67
#_02D46E: db $00 ; 0x68
#_02D46F: db $00 ; 0x69
#_02D470: db $00 ; 0x6A
#_02D471: db $00 ; 0x6B
#_02D472: db $00 ; 0x6C
#_02D473: db $00 ; 0x6D
#_02D474: db $00 ; 0x6E
#_02D475: db $00 ; 0x6F
#_02D476: db $00 ; 0x70
#_02D477: db $00 ; 0x71
#_02D478: db $00 ; 0x72
#_02D479: db $FF ; 0x73
#_02D47A: db $FF ; 0x74
#_02D47B: db $FF ; 0x75
#_02D47C: db $FF ; 0x76
#_02D47D: db $FF ; 0x77
#_02D47E: db $FF ; 0x78
#_02D47F: db $FF ; 0x79
#_02D480: db $FF ; 0x7A
#_02D481: db $01 ; 0x7B
#_02D482: db $FF ; 0x7C
#_02D483: db $FF ; 0x7D
#_02D484: db $FF ; 0x7E
#_02D485: db $FF ; 0x7F
#_02D486: db $FF ; 0x80
#_02D487: db $FF ; 0x81
#_02D488: db $FF ; 0x82
#_02D489: db $00 ; 0x83
#_02D48A: db $00 ; 0x84

;---------------------------------------------------------------------------------------------------

.dungeon_id
#_02D48B: db $FF ; 0x00
#_02D48C: db $FF ; 0x01
#_02D48D: db $00 ; 0x02
#_02D48E: db $02 ; 0x03
#_02D48F: db $02 ; 0x04
#_02D490: db $02 ; 0x05
#_02D491: db $FF ; 0x06
#_02D492: db $FF ; 0x07
#_02D493: db $04 ; 0x08
#_02D494: db $06 ; 0x09
#_02D495: db $06 ; 0x0A
#_02D496: db $06 ; 0x0B
#_02D497: db $06 ; 0x0C
#_02D498: db $FF ; 0x0D
#_02D499: db $FF ; 0x0E
#_02D49A: db $FF ; 0x0F
#_02D49B: db $FF ; 0x10
#_02D49C: db $FF ; 0x11
#_02D49D: db $FF ; 0x12
#_02D49E: db $FF ; 0x13
#_02D49F: db $FF ; 0x14
#_02D4A0: db $18 ; 0x15
#_02D4A1: db $FF ; 0x16
#_02D4A2: db $FF ; 0x17
#_02D4A3: db $18 ; 0x18
#_02D4A4: db $18 ; 0x19
#_02D4A5: db $FF ; 0x1A
#_02D4A6: db $FF ; 0x1B
#_02D4A7: db $FF ; 0x1C
#_02D4A8: db $FF ; 0x1D
#_02D4A9: db $FF ; 0x1E
#_02D4AA: db $FF ; 0x1F
#_02D4AB: db $FF ; 0x20
#_02D4AC: db $FF ; 0x21
#_02D4AD: db $FF ; 0x22
#_02D4AE: db $FF ; 0x23
#_02D4AF: db $08 ; 0x24
#_02D4B0: db $0A ; 0x25
#_02D4B1: db $0C ; 0x26
#_02D4B2: db $0E ; 0x27
#_02D4B3: db $10 ; 0x28
#_02D4B4: db $10 ; 0x29
#_02D4B5: db $10 ; 0x2A
#_02D4B6: db $10 ; 0x2B
#_02D4B7: db $FF ; 0x2C
#_02D4B8: db $12 ; 0x2D
#_02D4B9: db $FF ; 0x2E
#_02D4BA: db $FF ; 0x2F
#_02D4BB: db $FF ; 0x30
#_02D4BC: db $FF ; 0x31
#_02D4BD: db $FF ; 0x32
#_02D4BE: db $14 ; 0x33
#_02D4BF: db $16 ; 0x34
#_02D4C0: db $18 ; 0x35
#_02D4C1: db $FF ; 0x36
#_02D4C2: db $1A ; 0x37
#_02D4C3: db $FF ; 0x38
#_02D4C4: db $FF ; 0x39
#_02D4C5: db $FF ; 0x3A
#_02D4C6: db $FF ; 0x3B
#_02D4C7: db $FF ; 0x3C
#_02D4C8: db $FF ; 0x3D
#_02D4C9: db $FF ; 0x3E
#_02D4CA: db $FF ; 0x3F
#_02D4CB: db $FF ; 0x40
#_02D4CC: db $FF ; 0x41
#_02D4CD: db $FF ; 0x42
#_02D4CE: db $FF ; 0x43
#_02D4CF: db $FF ; 0x44
#_02D4D0: db $FF ; 0x45
#_02D4D1: db $FF ; 0x46
#_02D4D2: db $FF ; 0x47
#_02D4D3: db $FF ; 0x48
#_02D4D4: db $FF ; 0x49
#_02D4D5: db $FF ; 0x4A
#_02D4D6: db $FF ; 0x4B
#_02D4D7: db $FF ; 0x4C
#_02D4D8: db $FF ; 0x4D
#_02D4D9: db $FF ; 0x4E
#_02D4DA: db $FF ; 0x4F
#_02D4DB: db $FF ; 0x50
#_02D4DC: db $FF ; 0x51
#_02D4DD: db $FF ; 0x52
#_02D4DE: db $FF ; 0x53
#_02D4DF: db $FF ; 0x54
#_02D4E0: db $FF ; 0x55
#_02D4E1: db $FF ; 0x56
#_02D4E2: db $FF ; 0x57
#_02D4E3: db $FF ; 0x58
#_02D4E4: db $FF ; 0x59
#_02D4E5: db $FF ; 0x5A
#_02D4E6: db $FF ; 0x5B
#_02D4E7: db $FF ; 0x5C
#_02D4E8: db $FF ; 0x5D
#_02D4E9: db $FF ; 0x5E
#_02D4EA: db $FF ; 0x5F
#_02D4EB: db $FF ; 0x60
#_02D4EC: db $FF ; 0x61
#_02D4ED: db $FF ; 0x62
#_02D4EE: db $FF ; 0x63
#_02D4EF: db $FF ; 0x64
#_02D4F0: db $FF ; 0x65
#_02D4F1: db $FF ; 0x66
#_02D4F2: db $FF ; 0x67
#_02D4F3: db $FF ; 0x68
#_02D4F4: db $FF ; 0x69
#_02D4F5: db $FF ; 0x6A
#_02D4F6: db $FF ; 0x6B
#_02D4F7: db $FF ; 0x6C
#_02D4F8: db $FF ; 0x6D
#_02D4F9: db $FF ; 0x6E
#_02D4FA: db $FF ; 0x6F
#_02D4FB: db $FF ; 0x70
#_02D4FC: db $FF ; 0x71
#_02D4FD: db $FF ; 0x72
#_02D4FE: db $FF ; 0x73
#_02D4FF: db $FF ; 0x74
#_02D500: db $FF ; 0x75
#_02D501: db $10 ; 0x76
#_02D502: db $10 ; 0x77
#_02D503: db $10 ; 0x78
#_02D504: db $10 ; 0x79
#_02D505: db $FF ; 0x7A
#_02D506: db $FF ; 0x7B
#_02D507: db $FF ; 0x7C
#_02D508: db $FF ; 0x7D
#_02D509: db $FF ; 0x7E
#_02D50A: db $FF ; 0x7F
#_02D50B: db $FF ; 0x80
#_02D50C: db $00 ; 0x81
#_02D50D: db $FF ; 0x82
#_02D50E: db $FF ; 0x83
#_02D50F: db $FF ; 0x84

;---------------------------------------------------------------------------------------------------

.in_door
#_02D510: db $00 ; 0x00
#_02D511: db $01 ; 0x01
#_02D512: db $01 ; 0x02
#_02D513: db $01 ; 0x03
#_02D514: db $01 ; 0x04
#_02D515: db $01 ; 0x05
#_02D516: db $01 ; 0x06
#_02D517: db $01 ; 0x07
#_02D518: db $01 ; 0x08
#_02D519: db $01 ; 0x09
#_02D51A: db $01 ; 0x0A
#_02D51B: db $01 ; 0x0B
#_02D51C: db $01 ; 0x0C
#_02D51D: db $01 ; 0x0D
#_02D51E: db $01 ; 0x0E
#_02D51F: db $01 ; 0x0F
#_02D520: db $01 ; 0x10
#_02D521: db $01 ; 0x11
#_02D522: db $01 ; 0x12
#_02D523: db $01 ; 0x13
#_02D524: db $01 ; 0x14
#_02D525: db $01 ; 0x15
#_02D526: db $01 ; 0x16
#_02D527: db $01 ; 0x17
#_02D528: db $01 ; 0x18
#_02D529: db $01 ; 0x19
#_02D52A: db $01 ; 0x1A
#_02D52B: db $01 ; 0x1B
#_02D52C: db $01 ; 0x1C
#_02D52D: db $01 ; 0x1D
#_02D52E: db $01 ; 0x1E
#_02D52F: db $01 ; 0x1F
#_02D530: db $01 ; 0x20
#_02D531: db $01 ; 0x21
#_02D532: db $01 ; 0x22
#_02D533: db $01 ; 0x23
#_02D534: db $01 ; 0x24
#_02D535: db $01 ; 0x25
#_02D536: db $01 ; 0x26
#_02D537: db $01 ; 0x27
#_02D538: db $01 ; 0x28
#_02D539: db $01 ; 0x29
#_02D53A: db $01 ; 0x2A
#_02D53B: db $01 ; 0x2B
#_02D53C: db $01 ; 0x2C
#_02D53D: db $01 ; 0x2D
#_02D53E: db $01 ; 0x2E
#_02D53F: db $01 ; 0x2F
#_02D540: db $01 ; 0x30
#_02D541: db $01 ; 0x31
#_02D542: db $01 ; 0x32
#_02D543: db $01 ; 0x33
#_02D544: db $01 ; 0x34
#_02D545: db $01 ; 0x35
#_02D546: db $01 ; 0x36
#_02D547: db $01 ; 0x37
#_02D548: db $01 ; 0x38
#_02D549: db $01 ; 0x39
#_02D54A: db $01 ; 0x3A
#_02D54B: db $01 ; 0x3B
#_02D54C: db $01 ; 0x3C
#_02D54D: db $01 ; 0x3D
#_02D54E: db $01 ; 0x3E
#_02D54F: db $01 ; 0x3F
#_02D550: db $01 ; 0x40
#_02D551: db $01 ; 0x41
#_02D552: db $01 ; 0x42
#_02D553: db $01 ; 0x43
#_02D554: db $01 ; 0x44
#_02D555: db $01 ; 0x45
#_02D556: db $01 ; 0x46
#_02D557: db $01 ; 0x47
#_02D558: db $01 ; 0x48
#_02D559: db $01 ; 0x49
#_02D55A: db $01 ; 0x4A
#_02D55B: db $01 ; 0x4B
#_02D55C: db $01 ; 0x4C
#_02D55D: db $01 ; 0x4D
#_02D55E: db $01 ; 0x4E
#_02D55F: db $01 ; 0x4F
#_02D560: db $01 ; 0x50
#_02D561: db $01 ; 0x51
#_02D562: db $01 ; 0x52
#_02D563: db $01 ; 0x53
#_02D564: db $01 ; 0x54
#_02D565: db $01 ; 0x55
#_02D566: db $01 ; 0x56
#_02D567: db $01 ; 0x57
#_02D568: db $01 ; 0x58
#_02D569: db $01 ; 0x59
#_02D56A: db $01 ; 0x5A
#_02D56B: db $01 ; 0x5B
#_02D56C: db $01 ; 0x5C
#_02D56D: db $01 ; 0x5D
#_02D56E: db $01 ; 0x5E
#_02D56F: db $01 ; 0x5F
#_02D570: db $01 ; 0x60
#_02D571: db $01 ; 0x61
#_02D572: db $01 ; 0x62
#_02D573: db $01 ; 0x63
#_02D574: db $01 ; 0x64
#_02D575: db $01 ; 0x65
#_02D576: db $01 ; 0x66
#_02D577: db $01 ; 0x67
#_02D578: db $01 ; 0x68
#_02D579: db $01 ; 0x69
#_02D57A: db $01 ; 0x6A
#_02D57B: db $01 ; 0x6B
#_02D57C: db $01 ; 0x6C
#_02D57D: db $01 ; 0x6D
#_02D57E: db $01 ; 0x6E
#_02D57F: db $01 ; 0x6F
#_02D580: db $01 ; 0x70
#_02D581: db $01 ; 0x71
#_02D582: db $01 ; 0x72
#_02D583: db $00 ; 0x73
#_02D584: db $00 ; 0x74
#_02D585: db $00 ; 0x75
#_02D586: db $00 ; 0x76
#_02D587: db $00 ; 0x77
#_02D588: db $00 ; 0x78
#_02D589: db $00 ; 0x79
#_02D58A: db $00 ; 0x7A
#_02D58B: db $00 ; 0x7B
#_02D58C: db $00 ; 0x7C
#_02D58D: db $00 ; 0x7D
#_02D58E: db $00 ; 0x7E
#_02D58F: db $00 ; 0x7F
#_02D590: db $00 ; 0x80
#_02D591: db $00 ; 0x81
#_02D592: db $00 ; 0x82
#_02D593: db $01 ; 0x83
#_02D594: db $01 ; 0x84

;---------------------------------------------------------------------------------------------------

.layer
#_02D595: db $00 ; 0x00
#_02D596: db $00 ; 0x01
#_02D597: db $01 ; 0x02
#_02D598: db $00 ; 0x03
#_02D599: db $01 ; 0x04
#_02D59A: db $00 ; 0x05
#_02D59B: db $00 ; 0x06
#_02D59C: db $01 ; 0x07
#_02D59D: db $00 ; 0x08
#_02D59E: db $00 ; 0x09
#_02D59F: db $00 ; 0x0A
#_02D5A0: db $00 ; 0x0B
#_02D5A1: db $00 ; 0x0C
#_02D5A2: db $00 ; 0x0D
#_02D5A3: db $00 ; 0x0E
#_02D5A4: db $00 ; 0x0F
#_02D5A5: db $00 ; 0x10
#_02D5A6: db $00 ; 0x11
#_02D5A7: db $00 ; 0x12
#_02D5A8: db $00 ; 0x13
#_02D5A9: db $00 ; 0x14
#_02D5AA: db $00 ; 0x15
#_02D5AB: db $00 ; 0x16
#_02D5AC: db $00 ; 0x17
#_02D5AD: db $00 ; 0x18
#_02D5AE: db $00 ; 0x19
#_02D5AF: db $01 ; 0x1A
#_02D5B0: db $00 ; 0x1B
#_02D5B1: db $01 ; 0x1C
#_02D5B2: db $00 ; 0x1D
#_02D5B3: db $00 ; 0x1E
#_02D5B4: db $00 ; 0x1F
#_02D5B5: db $00 ; 0x20
#_02D5B6: db $00 ; 0x21
#_02D5B7: db $11 ; 0x22
#_02D5B8: db $00 ; 0x23
#_02D5B9: db $00 ; 0x24
#_02D5BA: db $00 ; 0x25
#_02D5BB: db $00 ; 0x26
#_02D5BC: db $00 ; 0x27
#_02D5BD: db $00 ; 0x28
#_02D5BE: db $00 ; 0x29
#_02D5BF: db $00 ; 0x2A
#_02D5C0: db $00 ; 0x2B
#_02D5C1: db $00 ; 0x2C
#_02D5C2: db $00 ; 0x2D
#_02D5C3: db $01 ; 0x2E
#_02D5C4: db $01 ; 0x2F
#_02D5C5: db $01 ; 0x30
#_02D5C6: db $00 ; 0x31
#_02D5C7: db $00 ; 0x32
#_02D5C8: db $11 ; 0x33
#_02D5C9: db $00 ; 0x34
#_02D5CA: db $00 ; 0x35
#_02D5CB: db $00 ; 0x36
#_02D5CC: db $00 ; 0x37
#_02D5CD: db $00 ; 0x38
#_02D5CE: db $00 ; 0x39
#_02D5CF: db $00 ; 0x3A
#_02D5D0: db $00 ; 0x3B
#_02D5D1: db $00 ; 0x3C
#_02D5D2: db $00 ; 0x3D
#_02D5D3: db $00 ; 0x3E
#_02D5D4: db $00 ; 0x3F
#_02D5D5: db $00 ; 0x40
#_02D5D6: db $00 ; 0x41
#_02D5D7: db $00 ; 0x42
#_02D5D8: db $00 ; 0x43
#_02D5D9: db $00 ; 0x44
#_02D5DA: db $00 ; 0x45
#_02D5DB: db $00 ; 0x46
#_02D5DC: db $00 ; 0x47
#_02D5DD: db $00 ; 0x48
#_02D5DE: db $00 ; 0x49
#_02D5DF: db $00 ; 0x4A
#_02D5E0: db $00 ; 0x4B
#_02D5E1: db $00 ; 0x4C
#_02D5E2: db $01 ; 0x4D
#_02D5E3: db $00 ; 0x4E
#_02D5E4: db $00 ; 0x4F
#_02D5E5: db $00 ; 0x50
#_02D5E6: db $11 ; 0x51
#_02D5E7: db $00 ; 0x52
#_02D5E8: db $00 ; 0x53
#_02D5E9: db $00 ; 0x54
#_02D5EA: db $00 ; 0x55
#_02D5EB: db $00 ; 0x56
#_02D5EC: db $00 ; 0x57
#_02D5ED: db $00 ; 0x58
#_02D5EE: db $00 ; 0x59
#_02D5EF: db $00 ; 0x5A
#_02D5F0: db $00 ; 0x5B
#_02D5F1: db $00 ; 0x5C
#_02D5F2: db $00 ; 0x5D
#_02D5F3: db $00 ; 0x5E
#_02D5F4: db $00 ; 0x5F
#_02D5F5: db $00 ; 0x60
#_02D5F6: db $00 ; 0x61
#_02D5F7: db $00 ; 0x62
#_02D5F8: db $00 ; 0x63
#_02D5F9: db $00 ; 0x64
#_02D5FA: db $00 ; 0x65
#_02D5FB: db $00 ; 0x66
#_02D5FC: db $00 ; 0x67
#_02D5FD: db $00 ; 0x68
#_02D5FE: db $01 ; 0x69
#_02D5FF: db $01 ; 0x6A
#_02D600: db $00 ; 0x6B
#_02D601: db $00 ; 0x6C
#_02D602: db $00 ; 0x6D
#_02D603: db $00 ; 0x6E
#_02D604: db $00 ; 0x6F
#_02D605: db $00 ; 0x70
#_02D606: db $00 ; 0x71
#_02D607: db $00 ; 0x72
#_02D608: db $00 ; 0x73
#_02D609: db $11 ; 0x74
#_02D60A: db $00 ; 0x75
#_02D60B: db $00 ; 0x76
#_02D60C: db $00 ; 0x77
#_02D60D: db $00 ; 0x78
#_02D60E: db $00 ; 0x79
#_02D60F: db $00 ; 0x7A
#_02D610: db $00 ; 0x7B
#_02D611: db $01 ; 0x7C
#_02D612: db $01 ; 0x7D
#_02D613: db $11 ; 0x7E
#_02D614: db $01 ; 0x7F
#_02D615: db $00 ; 0x80
#_02D616: db $00 ; 0x81
#_02D617: db $00 ; 0x82
#_02D618: db $00 ; 0x83
#_02D619: db $00 ; 0x84

;---------------------------------------------------------------------------------------------------

.camera_scroll_controller
#_02D61A: db $00 ; 0x00
#_02D61B: db $00 ; 0x01
#_02D61C: db $22 ; 0x02
#_02D61D: db $02 ; 0x03
#_02D61E: db $22 ; 0x04
#_02D61F: db $22 ; 0x05
#_02D620: db $22 ; 0x06
#_02D621: db $22 ; 0x07
#_02D622: db $20 ; 0x08
#_02D623: db $22 ; 0x09
#_02D624: db $00 ; 0x0A
#_02D625: db $00 ; 0x0B
#_02D626: db $00 ; 0x0C
#_02D627: db $00 ; 0x0D
#_02D628: db $00 ; 0x0E
#_02D629: db $00 ; 0x0F
#_02D62A: db $00 ; 0x10
#_02D62B: db $00 ; 0x11
#_02D62C: db $02 ; 0x12
#_02D62D: db $22 ; 0x13
#_02D62E: db $22 ; 0x14
#_02D62F: db $00 ; 0x15
#_02D630: db $22 ; 0x16
#_02D631: db $02 ; 0x17
#_02D632: db $02 ; 0x18
#_02D633: db $00 ; 0x19
#_02D634: db $22 ; 0x1A
#_02D635: db $22 ; 0x1B
#_02D636: db $02 ; 0x1C
#_02D637: db $22 ; 0x1D
#_02D638: db $20 ; 0x1E
#_02D639: db $20 ; 0x1F
#_02D63A: db $20 ; 0x20
#_02D63B: db $22 ; 0x21
#_02D63C: db $22 ; 0x22
#_02D63D: db $22 ; 0x23
#_02D63E: db $00 ; 0x24
#_02D63F: db $22 ; 0x25
#_02D640: db $20 ; 0x26
#_02D641: db $20 ; 0x27
#_02D642: db $00 ; 0x28
#_02D643: db $00 ; 0x29
#_02D644: db $00 ; 0x2A
#_02D645: db $02 ; 0x2B
#_02D646: db $02 ; 0x2C
#_02D647: db $00 ; 0x2D
#_02D648: db $22 ; 0x2E
#_02D649: db $22 ; 0x2F
#_02D64A: db $02 ; 0x30
#_02D64B: db $22 ; 0x31
#_02D64C: db $20 ; 0x32
#_02D64D: db $22 ; 0x33
#_02D64E: db $22 ; 0x34
#_02D64F: db $02 ; 0x35
#_02D650: db $02 ; 0x36
#_02D651: db $22 ; 0x37
#_02D652: db $00 ; 0x38
#_02D653: db $20 ; 0x39
#_02D654: db $22 ; 0x3A
#_02D655: db $00 ; 0x3B
#_02D656: db $00 ; 0x3C
#_02D657: db $00 ; 0x3D
#_02D658: db $00 ; 0x3E
#_02D659: db $00 ; 0x3F
#_02D65A: db $00 ; 0x40
#_02D65B: db $22 ; 0x41
#_02D65C: db $02 ; 0x42
#_02D65D: db $02 ; 0x43
#_02D65E: db $00 ; 0x44
#_02D65F: db $00 ; 0x45
#_02D660: db $00 ; 0x46
#_02D661: db $00 ; 0x47
#_02D662: db $00 ; 0x48
#_02D663: db $00 ; 0x49
#_02D664: db $00 ; 0x4A
#_02D665: db $00 ; 0x4B
#_02D666: db $00 ; 0x4C
#_02D667: db $02 ; 0x4D
#_02D668: db $20 ; 0x4E
#_02D669: db $00 ; 0x4F
#_02D66A: db $02 ; 0x50
#_02D66B: db $00 ; 0x51
#_02D66C: db $00 ; 0x52
#_02D66D: db $00 ; 0x53
#_02D66E: db $00 ; 0x54
#_02D66F: db $02 ; 0x55
#_02D670: db $00 ; 0x56
#_02D671: db $00 ; 0x57
#_02D672: db $00 ; 0x58
#_02D673: db $00 ; 0x59
#_02D674: db $02 ; 0x5A
#_02D675: db $02 ; 0x5B
#_02D676: db $00 ; 0x5C
#_02D677: db $02 ; 0x5D
#_02D678: db $00 ; 0x5E
#_02D679: db $02 ; 0x5F
#_02D67A: db $00 ; 0x60
#_02D67B: db $20 ; 0x61
#_02D67C: db $00 ; 0x62
#_02D67D: db $00 ; 0x63
#_02D67E: db $00 ; 0x64
#_02D67F: db $00 ; 0x65
#_02D680: db $00 ; 0x66
#_02D681: db $00 ; 0x67
#_02D682: db $00 ; 0x68
#_02D683: db $02 ; 0x69
#_02D684: db $02 ; 0x6A
#_02D685: db $00 ; 0x6B
#_02D686: db $00 ; 0x6C
#_02D687: db $00 ; 0x6D
#_02D688: db $00 ; 0x6E
#_02D689: db $00 ; 0x6F
#_02D68A: db $00 ; 0x70
#_02D68B: db $00 ; 0x71
#_02D68C: db $00 ; 0x72
#_02D68D: db $20 ; 0x73
#_02D68E: db $22 ; 0x74
#_02D68F: db $00 ; 0x75
#_02D690: db $02 ; 0x76
#_02D691: db $02 ; 0x77
#_02D692: db $22 ; 0x78
#_02D693: db $02 ; 0x79
#_02D694: db $02 ; 0x7A
#_02D695: db $00 ; 0x7B
#_02D696: db $02 ; 0x7C
#_02D697: db $20 ; 0x7D
#_02D698: db $00 ; 0x7E
#_02D699: db $02 ; 0x7F
#_02D69A: db $20 ; 0x80
#_02D69B: db $02 ; 0x81
#_02D69C: db $00 ; 0x82
#_02D69D: db $00 ; 0x83
#_02D69E: db $00 ; 0x84

;---------------------------------------------------------------------------------------------------

.quadrant
#_02D69F: db $02 ; 0x00
#_02D6A0: db $02 ; 0x01
#_02D6A1: db $02 ; 0x02
#_02D6A2: db $12 ; 0x03
#_02D6A3: db $02 ; 0x04
#_02D6A4: db $02 ; 0x05
#_02D6A5: db $02 ; 0x06
#_02D6A6: db $12 ; 0x07
#_02D6A7: db $02 ; 0x08
#_02D6A8: db $02 ; 0x09
#_02D6A9: db $12 ; 0x0A
#_02D6AA: db $02 ; 0x0B
#_02D6AB: db $02 ; 0x0C
#_02D6AC: db $12 ; 0x0D
#_02D6AD: db $02 ; 0x0E
#_02D6AE: db $12 ; 0x0F
#_02D6AF: db $02 ; 0x10
#_02D6B0: db $02 ; 0x11
#_02D6B1: db $12 ; 0x12
#_02D6B2: db $02 ; 0x13
#_02D6B3: db $12 ; 0x14
#_02D6B4: db $12 ; 0x15
#_02D6B5: db $02 ; 0x16
#_02D6B6: db $12 ; 0x17
#_02D6B7: db $02 ; 0x18
#_02D6B8: db $12 ; 0x19
#_02D6B9: db $02 ; 0x1A
#_02D6BA: db $12 ; 0x1B
#_02D6BB: db $02 ; 0x1C
#_02D6BC: db $12 ; 0x1D
#_02D6BD: db $12 ; 0x1E
#_02D6BE: db $02 ; 0x1F
#_02D6BF: db $02 ; 0x20
#_02D6C0: db $02 ; 0x21
#_02D6C1: db $02 ; 0x22
#_02D6C2: db $02 ; 0x23
#_02D6C3: db $02 ; 0x24
#_02D6C4: db $02 ; 0x25
#_02D6C5: db $02 ; 0x26
#_02D6C6: db $02 ; 0x27
#_02D6C7: db $02 ; 0x28
#_02D6C8: db $02 ; 0x29
#_02D6C9: db $02 ; 0x2A
#_02D6CA: db $02 ; 0x2B
#_02D6CB: db $02 ; 0x2C
#_02D6CC: db $12 ; 0x2D
#_02D6CD: db $02 ; 0x2E
#_02D6CE: db $12 ; 0x2F
#_02D6CF: db $02 ; 0x30
#_02D6D0: db $02 ; 0x31
#_02D6D1: db $02 ; 0x32
#_02D6D2: db $02 ; 0x33
#_02D6D3: db $02 ; 0x34
#_02D6D4: db $12 ; 0x35
#_02D6D5: db $02 ; 0x36
#_02D6D6: db $02 ; 0x37
#_02D6D7: db $12 ; 0x38
#_02D6D8: db $12 ; 0x39
#_02D6D9: db $12 ; 0x3A
#_02D6DA: db $02 ; 0x3B
#_02D6DB: db $02 ; 0x3C
#_02D6DC: db $12 ; 0x3D
#_02D6DD: db $02 ; 0x3E
#_02D6DE: db $02 ; 0x3F
#_02D6DF: db $02 ; 0x40
#_02D6E0: db $12 ; 0x41
#_02D6E1: db $02 ; 0x42
#_02D6E2: db $00 ; 0x43
#_02D6E3: db $02 ; 0x44
#_02D6E4: db $02 ; 0x45
#_02D6E5: db $12 ; 0x46
#_02D6E6: db $02 ; 0x47
#_02D6E7: db $02 ; 0x48
#_02D6E8: db $02 ; 0x49
#_02D6E9: db $02 ; 0x4A
#_02D6EA: db $02 ; 0x4B
#_02D6EB: db $02 ; 0x4C
#_02D6EC: db $02 ; 0x4D
#_02D6ED: db $02 ; 0x4E
#_02D6EE: db $02 ; 0x4F
#_02D6EF: db $02 ; 0x50
#_02D6F0: db $02 ; 0x51
#_02D6F1: db $02 ; 0x52
#_02D6F2: db $02 ; 0x53
#_02D6F3: db $12 ; 0x54
#_02D6F4: db $02 ; 0x55
#_02D6F5: db $12 ; 0x56
#_02D6F6: db $02 ; 0x57
#_02D6F7: db $12 ; 0x58
#_02D6F8: db $02 ; 0x59
#_02D6F9: db $02 ; 0x5A
#_02D6FA: db $02 ; 0x5B
#_02D6FB: db $02 ; 0x5C
#_02D6FC: db $02 ; 0x5D
#_02D6FD: db $12 ; 0x5E
#_02D6FE: db $02 ; 0x5F
#_02D6FF: db $02 ; 0x60
#_02D700: db $02 ; 0x61
#_02D701: db $12 ; 0x62
#_02D702: db $12 ; 0x63
#_02D703: db $02 ; 0x64
#_02D704: db $02 ; 0x65
#_02D705: db $12 ; 0x66
#_02D706: db $12 ; 0x67
#_02D707: db $12 ; 0x68
#_02D708: db $02 ; 0x69
#_02D709: db $12 ; 0x6A
#_02D70A: db $02 ; 0x6B
#_02D70B: db $02 ; 0x6C
#_02D70C: db $02 ; 0x6D
#_02D70D: db $12 ; 0x6E
#_02D70E: db $02 ; 0x6F
#_02D70F: db $12 ; 0x70
#_02D710: db $02 ; 0x71
#_02D711: db $12 ; 0x72
#_02D712: db $10 ; 0x73
#_02D713: db $02 ; 0x74
#_02D714: db $00 ; 0x75
#_02D715: db $10 ; 0x76
#_02D716: db $00 ; 0x77
#_02D717: db $10 ; 0x78
#_02D718: db $10 ; 0x79
#_02D719: db $10 ; 0x7A
#_02D71A: db $10 ; 0x7B
#_02D71B: db $02 ; 0x7C
#_02D71C: db $10 ; 0x7D
#_02D71D: db $12 ; 0x7E
#_02D71E: db $02 ; 0x7F
#_02D71F: db $02 ; 0x80
#_02D720: db $12 ; 0x81
#_02D721: db $02 ; 0x82
#_02D722: db $02 ; 0x83
#_02D723: db $02 ; 0x84

;---------------------------------------------------------------------------------------------------

.overworld_door_tilemap
#_02D724: dw $0816 ; 0x00
#_02D726: dw $0816 ; 0x01
#_02D728: dw $0000 ; 0x02
#_02D72A: dw $0000 ; 0x03
#_02D72C: dw $0000 ; 0x04
#_02D72E: dw $0000 ; 0x05
#_02D730: dw $0000 ; 0x06
#_02D732: dw $0000 ; 0x07
#_02D734: dw $0000 ; 0x08
#_02D736: dw $0000 ; 0x09
#_02D738: dw $0000 ; 0x0A
#_02D73A: dw $0000 ; 0x0B
#_02D73C: dw $0000 ; 0x0C
#_02D73E: dw $05CC ; 0x0D
#_02D740: dw $05D4 ; 0x0E
#_02D742: dw $0BB6 ; 0x0F
#_02D744: dw $0B86 ; 0x10
#_02D746: dw $0000 ; 0x11
#_02D748: dw $0000 ; 0x12
#_02D74A: dw $0000 ; 0x13
#_02D74C: dw $0000 ; 0x14
#_02D74E: dw $0000 ; 0x15
#_02D750: dw $0000 ; 0x16
#_02D752: dw $0000 ; 0x17
#_02D754: dw $0000 ; 0x18
#_02D756: dw $0000 ; 0x19
#_02D758: dw $0000 ; 0x1A
#_02D75A: dw $0000 ; 0x1B
#_02D75C: dw $0000 ; 0x1C
#_02D75E: dw $0000 ; 0x1D
#_02D760: dw $0000 ; 0x1E
#_02D762: dw $0000 ; 0x1F
#_02D764: dw $0000 ; 0x20
#_02D766: dw $0000 ; 0x21
#_02D768: dw $0000 ; 0x22
#_02D76A: dw $0000 ; 0x23
#_02D76C: dw $0000 ; 0x24
#_02D76E: dw $0000 ; 0x25
#_02D770: dw $0000 ; 0x26
#_02D772: dw $0000 ; 0x27
#_02D774: dw $0000 ; 0x28
#_02D776: dw $0000 ; 0x29
#_02D778: dw $0000 ; 0x2A
#_02D77A: dw $0000 ; 0x2B
#_02D77C: dw $0000 ; 0x2C
#_02D77E: dw $0000 ; 0x2D
#_02D780: dw $0000 ; 0x2E
#_02D782: dw $0000 ; 0x2F
#_02D784: dw $0000 ; 0x30
#_02D786: dw $0000 ; 0x31
#_02D788: dw $0000 ; 0x32
#_02D78A: dw $0000 ; 0x33
#_02D78C: dw $0000 ; 0x34
#_02D78E: dw $0000 ; 0x35
#_02D790: dw $0000 ; 0x36
#_02D792: dw $0000 ; 0x37
#_02D794: dw $0000 ; 0x38
#_02D796: dw $0000 ; 0x39
#_02D798: dw $0000 ; 0x3A
#_02D79A: dw $0000 ; 0x3B
#_02D79C: dw $0000 ; 0x3C
#_02D79E: dw $0000 ; 0x3D
#_02D7A0: dw $0DE8 ; 0x3E
#_02D7A2: dw $0B98 ; 0x3F
#_02D7A4: dw $14CE ; 0x40
#_02D7A6: dw $0000 ; 0x41
#_02D7A8: dw $1C50 ; 0x42
#_02D7AA: dw $FFFF ; 0x43
#_02D7AC: dw $1466 ; 0x44
#_02D7AE: dw $0000 ; 0x45
#_02D7B0: dw $1AB6 ; 0x46
#_02D7B2: dw $0B98 ; 0x47
#_02D7B4: dw $1AB6 ; 0x48
#_02D7B6: dw $040E ; 0x49
#_02D7B8: dw $9C0C ; 0x4A
#_02D7BA: dw $1530 ; 0x4B
#_02D7BC: dw $0A98 ; 0x4C
#_02D7BE: dw $0000 ; 0x4D
#_02D7C0: dw $0000 ; 0x4E
#_02D7C2: dw $0000 ; 0x4F
#_02D7C4: dw $0000 ; 0x50
#_02D7C6: dw $0000 ; 0x51
#_02D7C8: dw $0000 ; 0x52
#_02D7CA: dw $0816 ; 0x53
#_02D7CC: dw $0DE8 ; 0x54
#_02D7CE: dw $0000 ; 0x55
#_02D7D0: dw $0000 ; 0x56
#_02D7D2: dw $0AA8 ; 0x57
#_02D7D4: dw $0000 ; 0x58
#_02D7D6: dw $09AC ; 0x59
#_02D7D8: dw $0000 ; 0x5A
#_02D7DA: dw $0000 ; 0x5B
#_02D7DC: dw $0000 ; 0x5C
#_02D7DE: dw $0000 ; 0x5D
#_02D7E0: dw $0000 ; 0x5E
#_02D7E2: dw $0000 ; 0x5F
#_02D7E4: dw $0000 ; 0x60
#_02D7E6: dw $0000 ; 0x61
#_02D7E8: dw $0000 ; 0x62
#_02D7EA: dw $0000 ; 0x63
#_02D7EC: dw $041A ; 0x64
#_02D7EE: dw $0000 ; 0x65
#_02D7F0: dw $091E ; 0x66
#_02D7F2: dw $09AC ; 0x67
#_02D7F4: dw $0000 ; 0x68
#_02D7F6: dw $0000 ; 0x69
#_02D7F8: dw $0000 ; 0x6A
#_02D7FA: dw $07AA ; 0x6B
#_02D7FC: dw $0000 ; 0x6C
#_02D7FE: dw $0000 ; 0x6D
#_02D800: dw $0000 ; 0x6E
#_02D802: dw $0000 ; 0x6F
#_02D804: dw $0000 ; 0x70
#_02D806: dw $0000 ; 0x71
#_02D808: dw $0000 ; 0x72
#_02D80A: dw $0000 ; 0x73
#_02D80C: dw $0000 ; 0x74
#_02D80E: dw $0000 ; 0x75
#_02D810: dw $0000 ; 0x76
#_02D812: dw $0000 ; 0x77
#_02D814: dw $0000 ; 0x78
#_02D816: dw $0000 ; 0x79
#_02D818: dw $0000 ; 0x7A
#_02D81A: dw $0000 ; 0x7B
#_02D81C: dw $0000 ; 0x7C
#_02D81E: dw $0000 ; 0x7D
#_02D820: dw $0000 ; 0x7E
#_02D822: dw $0000 ; 0x7F
#_02D824: dw $0000 ; 0x80
#_02D826: dw $0000 ; 0x81
#_02D828: dw $0000 ; 0x82
#_02D82A: dw $0000 ; 0x83
#_02D82C: dw $0000 ; 0x84

;---------------------------------------------------------------------------------------------------

.song
#_02D82E: db $FF ; 0x00 - SONG FF
#_02D82F: db $07 ; 0x01 - SONG 07
#_02D830: db $14 ; 0x02 - SONG 14
#_02D831: db $10 ; 0x03 - SONG 10
#_02D832: db $10 ; 0x04 - SONG 10
#_02D833: db $10 ; 0x05 - SONG 10
#_02D834: db $12 ; 0x06 - SONG 12
#_02D835: db $12 ; 0x07 - SONG 12
#_02D836: db $11 ; 0x08 - SONG 11
#_02D837: db $11 ; 0x09 - SONG 11
#_02D838: db $11 ; 0x0A - SONG 11
#_02D839: db $11 ; 0x0B - SONG 11
#_02D83A: db $11 ; 0x0C - SONG 11
#_02D83B: db $F2 ; 0x0D - SONG F2
#_02D83C: db $F2 ; 0x0E - SONG F2
#_02D83D: db $F2 ; 0x0F - SONG F2
#_02D83E: db $F2 ; 0x10 - SONG F2
#_02D83F: db $18 ; 0x11 - SONG 18
#_02D840: db $1B ; 0x12 - SONG 1B
#_02D841: db $12 ; 0x13 - SONG 12
#_02D842: db $12 ; 0x14 - SONG 12
#_02D843: db $16 ; 0x15 - SONG 16
#_02D844: db $12 ; 0x16 - SONG 12
#_02D845: db $12 ; 0x17 - SONG 12
#_02D846: db $16 ; 0x18 - SONG 16
#_02D847: db $16 ; 0x19 - SONG 16
#_02D848: db $12 ; 0x1A - SONG 12
#_02D849: db $12 ; 0x1B - SONG 12
#_02D84A: db $12 ; 0x1C - SONG 12
#_02D84B: db $12 ; 0x1D - SONG 12
#_02D84C: db $12 ; 0x1E - SONG 12
#_02D84D: db $12 ; 0x1F - SONG 12
#_02D84E: db $12 ; 0x20 - SONG 12
#_02D84F: db $12 ; 0x21 - SONG 12
#_02D850: db $12 ; 0x22 - SONG 12
#_02D851: db $12 ; 0x23 - SONG 12
#_02D852: db $10 ; 0x24 - SONG 10
#_02D853: db $16 ; 0x25 - SONG 16
#_02D854: db $16 ; 0x26 - SONG 16
#_02D855: db $16 ; 0x27 - SONG 16
#_02D856: db $16 ; 0x28 - SONG 16
#_02D857: db $16 ; 0x29 - SONG 16
#_02D858: db $16 ; 0x2A - SONG 16
#_02D859: db $16 ; 0x2B - SONG 16
#_02D85A: db $18 ; 0x2C - SONG 18
#_02D85B: db $16 ; 0x2D - SONG 16
#_02D85C: db $12 ; 0x2E - SONG 12
#_02D85D: db $12 ; 0x2F - SONG 12
#_02D85E: db $12 ; 0x30 - SONG 12
#_02D85F: db $12 ; 0x31 - SONG 12
#_02D860: db $03 ; 0x32 - SONG 03
#_02D861: db $11 ; 0x33 - SONG 11
#_02D862: db $16 ; 0x34 - SONG 16
#_02D863: db $16 ; 0x35 - SONG 16
#_02D864: db $1C ; 0x36 - SONG 1C
#_02D865: db $16 ; 0x37 - SONG 16
#_02D866: db $1B ; 0x38 - SONG 1B
#_02D867: db $12 ; 0x39 - SONG 12
#_02D868: db $12 ; 0x3A - SONG 12
#_02D869: db $12 ; 0x3B - SONG 12
#_02D86A: db $0E ; 0x3C - SONG 0E
#_02D86B: db $12 ; 0x3D - SONG 12
#_02D86C: db $F2 ; 0x3E - SONG F2
#_02D86D: db $F2 ; 0x3F - SONG F2
#_02D86E: db $F2 ; 0x40 - SONG F2
#_02D86F: db $12 ; 0x41 - SONG 12
#_02D870: db $F2 ; 0x42 - SONG F2
#_02D871: db $F2 ; 0x43 - SONG F2
#_02D872: db $F2 ; 0x44 - SONG F2
#_02D873: db $18 ; 0x45 - SONG 18
#_02D874: db $17 ; 0x46 - SONG 17
#_02D875: db $0E ; 0x47 - SONG 0E
#_02D876: db $F2 ; 0x48 - SONG F2
#_02D877: db $F2 ; 0x49 - SONG F2
#_02D878: db $F2 ; 0x4A - SONG F2
#_02D879: db $F2 ; 0x4B - SONG F2
#_02D87A: db $F2 ; 0x4C - SONG F2
#_02D87B: db $18 ; 0x4D - SONG 18
#_02D87C: db $18 ; 0x4E - SONG 18
#_02D87D: db $12 ; 0x4F - SONG 12
#_02D87E: db $12 ; 0x50 - SONG 12
#_02D87F: db $18 ; 0x51 - SONG 18
#_02D880: db $18 ; 0x52 - SONG 18
#_02D881: db $F2 ; 0x53 - SONG F2
#_02D882: db $F2 ; 0x54 - SONG F2
#_02D883: db $1B ; 0x55 - SONG 1B
#_02D884: db $1B ; 0x56 - SONG 1B
#_02D885: db $17 ; 0x57 - SONG 17
#_02D886: db $12 ; 0x58 - SONG 12
#_02D887: db $0E ; 0x59 - SONG 0E
#_02D888: db $12 ; 0x5A - SONG 12
#_02D889: db $18 ; 0x5B - SONG 18
#_02D88A: db $18 ; 0x5C - SONG 18
#_02D88B: db $18 ; 0x5D - SONG 18
#_02D88C: db $1B ; 0x5E - SONG 1B
#_02D88D: db $12 ; 0x5F - SONG 12
#_02D88E: db $17 ; 0x60 - SONG 17
#_02D88F: db $F2 ; 0x61 - SONG F2
#_02D890: db $12 ; 0x62 - SONG 12
#_02D891: db $18 ; 0x63 - SONG 18
#_02D892: db $F2 ; 0x64 - SONG F2
#_02D893: db $17 ; 0x65 - SONG 17
#_02D894: db $17 ; 0x66 - SONG 17
#_02D895: db $0E ; 0x67 - SONG 0E
#_02D896: db $18 ; 0x68 - SONG 18
#_02D897: db $12 ; 0x69 - SONG 12
#_02D898: db $12 ; 0x6A - SONG 12
#_02D899: db $F2 ; 0x6B - SONG F2
#_02D89A: db $12 ; 0x6C - SONG 12
#_02D89B: db $12 ; 0x6D - SONG 12
#_02D89C: db $12 ; 0x6E - SONG 12
#_02D89D: db $12 ; 0x6F - SONG 12
#_02D89E: db $12 ; 0x70 - SONG 12
#_02D89F: db $1B ; 0x71 - SONG 1B
#_02D8A0: db $12 ; 0x72 - SONG 12
#_02D8A1: db $FF ; 0x73 - SONG FF
#_02D8A2: db $FF ; 0x74 - SONG FF
#_02D8A3: db $FF ; 0x75 - SONG FF
#_02D8A4: db $16 ; 0x76 - SONG 16
#_02D8A5: db $16 ; 0x77 - SONG 16
#_02D8A6: db $16 ; 0x78 - SONG 16
#_02D8A7: db $16 ; 0x79 - SONG 16
#_02D8A8: db $18 ; 0x7A - SONG 18
#_02D8A9: db $15 ; 0x7B - SONG 15
#_02D8AA: db $1B ; 0x7C - SONG 1B
#_02D8AB: db $03 ; 0x7D - SONG 03
#_02D8AC: db $18 ; 0x7E - SONG 18
#_02D8AD: db $1B ; 0x7F - SONG 1B
#_02D8AE: db $12 ; 0x80 - SONG 12
#_02D8AF: db $10 ; 0x81 - SONG 10
#_02D8B0: db $12 ; 0x82 - SONG 12
#_02D8B1: db $12 ; 0x83 - SONG 12
#_02D8B2: db $1B ; 0x84 - SONG 1B

;===================================================================================================

Underworld_LoadEntrance:
#_02D8B3: PHB
#_02D8B4: PHK
#_02D8B5: PLB

#_02D8B6: LDA.b #$01
#_02D8B8: STA.b $1B

#_02D8BA: LDA.w $010A
#_02D8BD: BEQ .recache

#_02D8BF: STZ.w $010A

#_02D8C2: JMP.w .continue

;---------------------------------------------------------------------------------------------------

.recache
#_02D8C5: REP #$20

#_02D8C7: LDA.w $040A
#_02D8CA: STA.l $7EC140

#_02D8CE: LDA.b $1C
#_02D8D0: STA.l $7EC142

#_02D8D4: LDA.b $E8
#_02D8D6: STA.l $7EC144

#_02D8DA: LDA.b $E2
#_02D8DC: STA.l $7EC146

#_02D8E0: LDA.b $20
#_02D8E2: STA.l $7EC148

#_02D8E6: LDA.b $22
#_02D8E8: STA.l $7EC14A

#_02D8EC: LDA.w $0618
#_02D8EF: STA.l $7EC150

#_02D8F3: LDA.w $061C
#_02D8F6: STA.l $7EC152

#_02D8FA: LDA.b $8A
#_02D8FC: STA.l $7EC14C

#_02D900: LDA.b $84
#_02D902: STA.l $7EC14E

#_02D906: STZ.b $8A
#_02D908: STZ.b $8C

#_02D90A: LDA.w $0600
#_02D90D: STA.l $7EC154

#_02D911: LDA.w $0602
#_02D914: STA.l $7EC156

#_02D918: LDA.w $0604
#_02D91B: STA.l $7EC158

#_02D91F: LDA.w $0606
#_02D922: STA.l $7EC15A

#_02D926: LDA.w $0610
#_02D929: STA.l $7EC15C

#_02D92D: LDA.w $0612
#_02D930: STA.l $7EC15E

#_02D934: LDA.w $0614
#_02D937: STA.l $7EC160

#_02D93B: LDA.w $0616
#_02D93E: STA.l $7EC162

#_02D942: LDA.w $0624
#_02D945: STA.l $7EC16A

#_02D949: LDA.w $0626
#_02D94C: STA.l $7EC16C

#_02D950: LDA.w $0628
#_02D953: STA.l $7EC16E

#_02D957: LDA.w $062A
#_02D95A: STA.l $7EC170

#_02D95E: SEP #$20

#_02D960: LDA.w $0AA0
#_02D963: STA.l $7EC164

#_02D967: LDA.w $0AA1
#_02D96A: STA.l $7EC165

#_02D96E: LDA.w $0AA2
#_02D971: STA.l $7EC166

#_02D975: LDA.w $0AA3
#_02D978: STA.l $7EC167

;---------------------------------------------------------------------------------------------------

.continue
#_02D97C: REP #$30

#_02D97E: STZ.w $011A
#_02D981: STZ.w $011C
#_02D984: STZ.w $010A

#_02D987: LDA.l $7EF3CC
#_02D98B: CMP.w #$04 ; FOLLOWER 04
#_02D98E: BEQ .have_old_man

#_02D990: LDA.w $04AA
#_02D993: BEQ .not_a_respawn

.have_old_man
#_02D995: JMP.w Underworld_LoadSpawnEntrance

;---------------------------------------------------------------------------------------------------

.not_a_respawn
#_02D998: LDA.w $010E
#_02D99B: AND.w #$00FF

#_02D99E: ASL A
#_02D99F: TAX

#_02D9A0: ASL A
#_02D9A1: ASL A
#_02D9A2: TAY

#_02D9A3: LDA.w EntranceData_room_id,X
#_02D9A6: STA.b $A0
#_02D9A8: STA.w $048E

#_02D9AB: LDA.w EntranceData_vertical_scroll,X
#_02D9AE: STA.b $E8
#_02D9B0: STA.b $E6
#_02D9B2: STA.w $0122
#_02D9B5: STA.w $0124

#_02D9B8: LDA.w EntranceData_horizontal_scroll,X
#_02D9BB: STA.b $E2
#_02D9BD: STA.b $E0
#_02D9BF: STA.w $011E
#_02D9C2: STA.w $0120

#_02D9C5: LDA.l $7EF3C5
#_02D9C9: BEQ .skip_coordinates

#_02D9CB: LDA.w EntranceData_y_coordinate,X
#_02D9CE: STA.b $20

#_02D9D0: LDA.w EntranceData_x_coordinate,X
#_02D9D3: STA.b $22

;---------------------------------------------------------------------------------------------------

.skip_coordinates
#_02D9D5: LDA.w EntranceData_camera_trigger_y,X
#_02D9D8: STA.w $0618

#_02D9DB: INC A
#_02D9DC: INC A
#_02D9DD: STA.w $061A

#_02D9E0: LDA.w EntranceData_camera_trigger_x,X
#_02D9E3: STA.w $061C

#_02D9E6: INC A
#_02D9E7: INC A
#_02D9E8: STA.w $061E

#_02D9EB: LDA.w #$01F8
#_02D9EE: STA.b $EC

#_02D9F0: LDA.w EntranceData_overworld_door_tilemap,X
#_02D9F3: STA.w $0696
#_02D9F6: STZ.w $0698

#_02D9F9: LDA.w #$0000
#_02D9FC: STA.w $0610

#_02D9FF: LDA.w #$0110
#_02DA02: STA.w $0612

#_02DA05: LDA.w #$0000
#_02DA08: STA.w $0614

#_02DA0B: LDA.w #$0100
#_02DA0E: STA.w $0616

#_02DA11: LDA.w $010E
#_02DA14: AND.w #$00FF
#_02DA17: TAX

;---------------------------------------------------------------------------------------------------

#_02DA18: SEP #$20

#_02DA1A: LDA.w EntranceData_camera_scroll_boundaries+0,Y
#_02DA1D: STA.w $0601

#_02DA20: LDA.w EntranceData_camera_scroll_boundaries+1,Y
#_02DA23: STA.w $0603

#_02DA26: LDA.w EntranceData_camera_scroll_boundaries+2,Y
#_02DA29: STA.w $0605

#_02DA2C: LDA.w EntranceData_camera_scroll_boundaries+3,Y
#_02DA2F: STA.w $0607

#_02DA32: LDA.w EntranceData_camera_scroll_boundaries+4,Y
#_02DA35: STA.w $0609

#_02DA38: LDA.w EntranceData_camera_scroll_boundaries+5,Y
#_02DA3B: STA.w $060B

#_02DA3E: LDA.w EntranceData_camera_scroll_boundaries+6,Y
#_02DA41: STA.w $060D

#_02DA44: LDA.w EntranceData_camera_scroll_boundaries+7,Y
#_02DA47: STA.w $060F

#_02DA4A: STZ.w $0600
#_02DA4D: STZ.w $0602

#_02DA50: LDA.b #$10
#_02DA52: STA.w $0604
#_02DA55: STA.w $0606

#_02DA58: STZ.w $0608
#_02DA5B: STZ.w $060A
#_02DA5E: STZ.w $060C
#_02DA61: STZ.w $060E

;---------------------------------------------------------------------------------------------------

#_02DA64: LDA.b #$02

#_02DA66: CPX.w #$0000
#_02DA69: BEQ .face_up

#_02DA6B: CPX.w #$0043
#_02DA6E: BEQ .face_up

#_02DA70: LDA.b #$00

.face_up
#_02DA72: STA.b $2F

#_02DA74: LDA.w EntranceData_main_GFX,X
#_02DA77: STA.w $0AA1

#_02DA7A: LDA.w EntranceData_song,X
#_02DA7D: STA.w $0132

#_02DA80: CMP.b #$03 ; SONG 03
#_02DA82: BNE .no_song_override

#_02DA84: LDA.l $7EF3C5
#_02DA88: CMP.b #$02
#_02DA8A: BCC .no_song_override

#_02DA8C: LDA.b #$12 ; SONG 12
#_02DA8E: STA.w $0132

.no_song_override
#_02DA91: LDA.w EntranceData_floor,X
#_02DA94: STA.b $A4

#_02DA96: LDA.w EntranceData_dungeon_id,X
#_02DA99: STA.w $040C

#_02DA9C: LDA.w EntranceData_in_door,X
#_02DA9F: STA.b $6C

#_02DAA1: LDA.w EntranceData_layer,X
#_02DAA4: LSR A
#_02DAA5: LSR A
#_02DAA6: LSR A
#_02DAA7: LSR A
#_02DAA8: STA.b $EE

#_02DAAA: LDA.w EntranceData_layer,X
#_02DAAD: AND.b #$0F
#_02DAAF: STA.w $0476

#_02DAB2: LDA.w EntranceData_camera_scroll_controller,X
#_02DAB5: LSR A
#_02DAB6: LSR A
#_02DAB7: LSR A
#_02DAB8: LSR A
#_02DAB9: STA.b $A6

#_02DABB: LDA.w EntranceData_camera_scroll_controller,X
#_02DABE: AND.b #$0F
#_02DAC0: STA.b $A7

#_02DAC2: LDA.w EntranceData_quadrant,X
#_02DAC5: LSR A
#_02DAC6: LSR A
#_02DAC7: LSR A
#_02DAC8: LSR A
#_02DAC9: STA.b $A9

#_02DACB: LDA.w EntranceData_quadrant,X
#_02DACE: AND.b #$0F
#_02DAD0: STA.b $AA

#_02DAD2: LDX.b $A0
#_02DAD4: CPX.w #$0100
#_02DAD7: BCC Underworld_LoadEntrance_DoPotsBlocksTorches

#_02DAD9: STZ.b $A4

;===================================================================================================

Underworld_LoadEntrance_DoPotsBlocksTorches:
#_02DADB: LDA.b #$80
#_02DADD: STA.b $45
#_02DADF: STA.b $44

#_02DAE1: LDA.b #$0F
#_02DAE3: STA.b $42
#_02DAE5: STA.b $43

#_02DAE7: LDA.b #$FF
#_02DAE9: STA.b $24
#_02DAEB: STA.b $29

#_02DAED: SEP #$30

#_02DAEF: PLB
#_02DAF0: PHB

#_02DAF1: LDA.b #$7E
#_02DAF3: PHA
#_02DAF4: PLB

;---------------------------------------------------------------------------------------------------

#_02DAF5: REP #$20

#_02DAF7: LDX.b #$00

.next_block_torch
#_02DAF9: LDA.l SpecialUnderworldObjects_pushable_block+0*128,X
#_02DAFD: STA.w $7EF940,X

#_02DB00: LDA.l SpecialUnderworldObjects_pushable_block+1*128,X
#_02DB04: STA.w $7EF9C0,X

#_02DB07: LDA.l SpecialUnderworldObjects_pushable_block+2*128,X
#_02DB0B: STA.w $7EFA40,X

#_02DB0E: LDA.l SpecialUnderworldObjects_pushable_block+3*128,X
#_02DB12: STA.w $7EFAC0,X

#_02DB15: LDA.l SpecialUnderworldObjects_torch+0*128,X
#_02DB19: STA.w $7EFB40,X

#_02DB1C: LDA.l SpecialUnderworldObjects_torch+1*128,X
#_02DB20: STA.w $7EFBC0,X

#_02DB23: LDA.l SpecialUnderworldObjects_torch+2*128,X
#_02DB27: STA.w $7EFC40,X

#_02DB2A: INX
#_02DB2B: INX
#_02DB2C: CPX.b #$80
#_02DB2E: BNE .next_block_torch

;---------------------------------------------------------------------------------------------------

#_02DB30: LDX.b #$3E
#_02DB32: LDA.w #$0000

.next_pot
#_02DB35: STA.w $7EF800,X
#_02DB38: STA.w $7EF840,X
#_02DB3B: STA.w $7EF880,X
#_02DB3E: STA.w $7EF8C0,X

#_02DB41: STA.w $7EF580,X
#_02DB44: STA.w $7EF5C0,X
#_02DB47: STA.w $7EF600,X
#_02DB4A: STA.w $7EF640,X
#_02DB4D: STA.w $7EF680,X

#_02DB50: STA.w $7EF6C0,X
#_02DB53: STA.w $7EF700,X
#_02DB56: STA.w $7EF740,X
#_02DB59: STA.w $7EF780,X
#_02DB5C: STA.w $7EF7C0,X

#_02DB5F: DEX
#_02DB60: DEX
#_02DB61: BPL .next_pot

;---------------------------------------------------------------------------------------------------

#_02DB63: STA.l $7EC172

#_02DB67: STZ.w $04BC

#_02DB6A: SEP #$30

#_02DB6C: PLB

#_02DB6D: RTS

;===================================================================================================

SpawnPointData:

.room_id
#_02DB6E: dw $0104 ; 0x00 - Link's house   - ROOM 0104
#_02DB70: dw $0012 ; 0x01 - Sanctuary      - ROOM 0012
#_02DB72: dw $0080 ; 0x02 - Prison         - ROOM 0080
#_02DB74: dw $0055 ; 0x03 - Uncle          - ROOM 0055
#_02DB76: dw $0051 ; 0x04 - Throne         - ROOM 0051
#_02DB78: dw $00F0 ; 0x05 - Old man cave   - ROOM 00F0
#_02DB7A: dw $00E4 ; 0x06 - Old man home   - ROOM 00E4

;---------------------------------------------------------------------------------------------------

.camera_scroll_boundaries
#_02DB7C: db $21, $20, $21, $21, $09, $09, $09, $0A ; 0x00 - Link's house
#_02DB84: db $02, $02, $02, $03, $04, $04, $04, $05 ; 0x01 - Sanctuary
#_02DB8C: db $10, $10, $10, $11, $01, $00, $01, $01 ; 0x02 - Prison
#_02DB94: db $0A, $0A, $0A, $0B, $0B, $0A, $0B, $0B ; 0x03 - Uncle
#_02DB9C: db $0A, $0A, $0A, $0B, $02, $02, $02, $03 ; 0x04 - Throne
#_02DBA4: db $1E, $1E, $1E, $1F, $01, $00, $01, $01 ; 0x05 - Old man cave
#_02DBAC: db $1D, $1C, $1D, $1D, $08, $08, $08, $09 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.horizontal_scroll
#_02DBB4: dw $0900 ; 0x00 - Link's house
#_02DBB6: dw $0480 ; 0x01 - Sanctuary
#_02DBB8: dw $00DB ; 0x02 - Prison
#_02DBBA: dw $0A8E ; 0x03 - Uncle
#_02DBBC: dw $0280 ; 0x04 - Throne
#_02DBBE: dw $0100 ; 0x05 - Old man cave
#_02DBC0: dw $0800 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.vertical_scroll
#_02DBC2: dw $2110 ; 0x00 - Link's house
#_02DBC4: dw $0231 ; 0x01 - Sanctuary
#_02DBC6: dw $1000 ; 0x02 - Prison
#_02DBC8: dw $0A03 ; 0x03 - Uncle
#_02DBCA: dw $0A22 ; 0x04 - Throne
#_02DBCC: dw $1E8C ; 0x05 - Old man cave
#_02DBCE: dw $1D10 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.y_coordinate
#_02DBD0: dw $2178 ; 0x00 - Link's house
#_02DBD2: dw $029C ; 0x01 - Sanctuary
#_02DBD4: dw $1041 ; 0x02 - Prison
#_02DBD6: dw $0A70 ; 0x03 - Uncle
#_02DBD8: dw $0A8F ; 0x04 - Throne
#_02DBDA: dw $1EF8 ; 0x05 - Old man cave
#_02DBDC: dw $1D98 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.x_coordinate
#_02DBDE: dw $0978 ; 0x00 - Link's house
#_02DBE0: dw $04F8 ; 0x01 - Sanctuary
#_02DBE2: dw $0160 ; 0x02 - Prison
#_02DBE4: dw $0B06 ; 0x03 - Uncle
#_02DBE6: dw $02F8 ; 0x04 - Throne
#_02DBE8: dw $01A8 ; 0x05 - Old man cave
#_02DBEA: dw $0878 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.camera_trigger_y
#_02DBEC: dw $017F ; 0x00 - Link's house
#_02DBEE: dw $00A7 ; 0x01 - Sanctuary
#_02DBF0: dw $0083 ; 0x02 - Prison
#_02DBF2: dw $007B ; 0x03 - Uncle
#_02DBF4: dw $009A ; 0x04 - Throne
#_02DBF6: dw $0103 ; 0x05 - Old man cave
#_02DBF8: dw $0187 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.camera_trigger_x
#_02DBFA: dw $017F ; 0x00 - Link's house
#_02DBFC: dw $00FF ; 0x01 - Sanctuary
#_02DBFE: dw $0167 ; 0x02 - Prison
#_02DC00: dw $010D ; 0x03 - Uncle
#_02DC02: dw $00FF ; 0x04 - Throne
#_02DC04: dw $017F ; 0x05 - Old man cave
#_02DC06: dw $007F ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.main_GFX
#_02DC08: db $03 ; 0x00 - Link's house
#_02DC09: db $04 ; 0x01 - Sanctuary
#_02DC0A: db $04 ; 0x02 - Prison
#_02DC0B: db $01 ; 0x03 - Uncle
#_02DC0C: db $04 ; 0x04 - Throne
#_02DC0D: db $06 ; 0x05 - Old man cave
#_02DC0E: db $14 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.floor
#_02DC0F: db $00 ; 0x00 - Link's house
#_02DC10: db $00 ; 0x01 - Sanctuary
#_02DC11: db $FD ; 0x02 - Prison
#_02DC12: db $FF ; 0x03 - Uncle
#_02DC13: db $01 ; 0x04 - Throne
#_02DC14: db $00 ; 0x05 - Old man cave
#_02DC15: db $00 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.dungeon_id
#_02DC16: db $FF ; 0x00 - Link's house
#_02DC17: db $00 ; 0x01 - Sanctuary
#_02DC18: db $02 ; 0x02 - Prison
#_02DC19: db $FF ; 0x03 - Uncle
#_02DC1A: db $02 ; 0x04 - Throne
#_02DC1B: db $FF ; 0x05 - Old man cave
#_02DC1C: db $FF ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.layer
#_02DC1D: db $00 ; 0x00 - Link's house
#_02DC1E: db $00 ; 0x01 - Sanctuary
#_02DC1F: db $00 ; 0x02 - Prison
#_02DC20: db $01 ; 0x03 - Uncle
#_02DC21: db $00 ; 0x04 - Throne
#_02DC22: db $00 ; 0x05 - Old man cave
#_02DC23: db $01 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.camera_scroll_controller
#_02DC24: db $00 ; 0x00 - Link's house
#_02DC25: db $22 ; 0x01 - Sanctuary
#_02DC26: db $20 ; 0x02 - Prison
#_02DC27: db $20 ; 0x03 - Uncle
#_02DC28: db $22 ; 0x04 - Throne
#_02DC29: db $22 ; 0x05 - Old man cave
#_02DC2A: db $02 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.quadrant
#_02DC2B: db $02 ; 0x00 - Link's house
#_02DC2C: db $00 ; 0x01 - Sanctuary
#_02DC2D: db $10 ; 0x02 - Prison
#_02DC2E: db $10 ; 0x03 - Uncle
#_02DC2F: db $00 ; 0x04 - Throne
#_02DC30: db $10 ; 0x05 - Old man cave
#_02DC31: db $02 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.overworld_door_tilemap
#_02DC32: dw $0816 ; 0x00 - Link's house
#_02DC34: dw $0000 ; 0x01 - Sanctuary
#_02DC36: dw $0000 ; 0x02 - Prison
#_02DC38: dw $0000 ; 0x03 - Uncle
#_02DC3A: dw $0000 ; 0x04 - Throne
#_02DC3C: dw $0000 ; 0x05 - Old man cave
#_02DC3E: dw $0000 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.entrance_id
#_02DC40: dw $0000 ; 0x00 - Link's house
#_02DC42: dw $0002 ; 0x01 - Sanctuary
#_02DC44: dw $0002 ; 0x02 - Prison
#_02DC46: dw $0032 ; 0x03 - Uncle
#_02DC48: dw $0004 ; 0x04 - Throne
#_02DC4A: dw $0006 ; 0x05 - Old man cave
#_02DC4C: dw $0030 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.song
#_02DC4E: db $07 ; 0x00 - Link's house - SONG 07
#_02DC4F: db $14 ; 0x01 - Sanctuary    - SONG 14
#_02DC50: db $10 ; 0x02 - Prison       - SONG 10
#_02DC51: db $03 ; 0x03 - Uncle        - SONG 03
#_02DC52: db $10 ; 0x04 - Throne       - SONG 10
#_02DC53: db $12 ; 0x05 - Old man cave - SONG 12
#_02DC54: db $12 ; 0x06 - Old man home - SONG 12

;===================================================================================================

Underworld_LoadSpawnEntrance:
#_02DC55: LDA.l $7EF3C8
#_02DC59: AND.w #$00FF
#_02DC5C: ASL A
#_02DC5D: TAX

#_02DC5E: ASL A
#_02DC5F: ASL A
#_02DC60: TAY

#_02DC61: LDA.w SpawnPointData_entrance_id,X
#_02DC64: STA.w $010E

#_02DC67: LDA.w SpawnPointData_room_id,X
#_02DC6A: STA.b $A0
#_02DC6C: STA.w $048E

#_02DC6F: LDA.w SpawnPointData_vertical_scroll,X
#_02DC72: STA.b $E8
#_02DC74: STA.b $E6
#_02DC76: STA.w $0122
#_02DC79: STA.w $0124

#_02DC7C: LDA.w SpawnPointData_horizontal_scroll,X
#_02DC7F: STA.b $E2
#_02DC81: STA.b $E0
#_02DC83: STA.w $011E
#_02DC86: STA.w $0120

#_02DC89: LDA.l $7EF3C5
#_02DC8D: BEQ .skip_coordinates

#_02DC8F: LDA.w SpawnPointData_y_coordinate,X
#_02DC92: STA.b $20

#_02DC94: LDA.w SpawnPointData_x_coordinate,X
#_02DC97: STA.b $22

;---------------------------------------------------------------------------------------------------

.skip_coordinates
#_02DC99: LDA.w SpawnPointData_camera_trigger_y,X
#_02DC9C: STA.w $0618

#_02DC9F: INC A
#_02DCA0: INC A
#_02DCA1: STA.w $061A

#_02DCA4: LDA.w SpawnPointData_camera_trigger_x,X
#_02DCA7: STA.w $061C

#_02DCAA: INC A
#_02DCAB: INC A
#_02DCAC: STA.w $061E

#_02DCAF: LDA.w #$01F8
#_02DCB2: STA.b $EC

#_02DCB4: LDA.w SpawnPointData_overworld_door_tilemap,X
#_02DCB7: STA.w $0696

#_02DCBA: LDA.w #$0000
#_02DCBD: STA.w $0610

#_02DCC0: LDA.w #$0110
#_02DCC3: STA.w $0612

#_02DCC6: LDA.w #$0000
#_02DCC9: STA.w $0614

#_02DCCC: LDA.w #$0100
#_02DCCF: STA.w $0616

;---------------------------------------------------------------------------------------------------

#_02DCD2: LDA.l $7EF3C8
#_02DCD6: AND.w #$00FF
#_02DCD9: TAX

#_02DCDA: SEP #$20

#_02DCDC: LDA.w SpawnPointData_camera_scroll_boundaries+0,Y
#_02DCDF: STA.w $0601

#_02DCE2: LDA.w SpawnPointData_camera_scroll_boundaries+1,Y
#_02DCE5: STA.w $0603

#_02DCE8: LDA.w SpawnPointData_camera_scroll_boundaries+2,Y
#_02DCEB: STA.w $0605

#_02DCEE: LDA.w SpawnPointData_camera_scroll_boundaries+3,Y
#_02DCF1: STA.w $0607

#_02DCF4: LDA.w SpawnPointData_camera_scroll_boundaries+4,Y
#_02DCF7: STA.w $0609

#_02DCFA: LDA.w SpawnPointData_camera_scroll_boundaries+5,Y
#_02DCFD: STA.w $060B

#_02DD00: LDA.w SpawnPointData_camera_scroll_boundaries+6,Y
#_02DD03: STA.w $060D

#_02DD06: LDA.w SpawnPointData_camera_scroll_boundaries+7,Y
#_02DD09: STA.w $060F

#_02DD0C: STZ.w $0600
#_02DD0F: STZ.w $0602

#_02DD12: LDA.b #$10
#_02DD14: STA.w $0604
#_02DD17: STA.w $0606

#_02DD1A: STZ.w $0608
#_02DD1D: STZ.w $060A
#_02DD20: STZ.w $060C
#_02DD23: STZ.w $060E

;---------------------------------------------------------------------------------------------------

#_02DD26: LDA.b #$02
#_02DD28: STA.b $2F

#_02DD2A: LDA.w SpawnPointData_main_GFX,X
#_02DD2D: STA.w $0AA1

#_02DD30: LDA.w SpawnPointData_floor,X
#_02DD33: STA.b $A4

#_02DD35: LDA.w SpawnPointData_dungeon_id,X
#_02DD38: STA.w $040C

#_02DD3B: STZ.b $6C

#_02DD3D: LDA.w SpawnPointData_layer,X
#_02DD40: LSR A
#_02DD41: LSR A
#_02DD42: LSR A
#_02DD43: LSR A
#_02DD44: STA.b $EE

#_02DD46: LDA.w SpawnPointData_layer,X
#_02DD49: AND.b #$0F
#_02DD4B: STA.w $0476

#_02DD4E: LDA.w SpawnPointData_camera_scroll_controller,X
#_02DD51: LSR A
#_02DD52: LSR A
#_02DD53: LSR A
#_02DD54: LSR A
#_02DD55: STA.b $A6

#_02DD57: LDA.w SpawnPointData_camera_scroll_controller,X
#_02DD5A: AND.b #$0F
#_02DD5C: STA.b $A7

#_02DD5E: LDA.w SpawnPointData_quadrant,X
#_02DD61: LSR A
#_02DD62: LSR A
#_02DD63: LSR A
#_02DD64: LSR A
#_02DD65: STA.b $A9

#_02DD67: LDA.w SpawnPointData_quadrant,X
#_02DD6A: AND.b #$0F
#_02DD6C: STA.b $AA

;---------------------------------------------------------------------------------------------------

#_02DD6E: LDA.w SpawnPointData_song,X
#_02DD71: STA.w $0132

#_02DD74: CPX.w #$0000
#_02DD77: BNE .dont_lower_song_volume

#_02DD79: LDA.l $7EF3C5
#_02DD7D: BNE .dont_lower_song_volume

#_02DD7F: LDA.b #$FF ; SONG FF - transfer
#_02DD81: STA.w $0132

.dont_lower_song_volume
#_02DD84: STZ.w $04AA

#_02DD87: JMP.w Underworld_LoadEntrance_DoPotsBlocksTorches

;===================================================================================================

UnderworldExitData:

.room_id
#_02DD8A: dw $0104 ; 0x00
#_02DD8C: dw $0012 ; 0x01
#_02DD8E: dw $0060 ; 0x02
#_02DD90: dw $0061 ; 0x03
#_02DD92: dw $0062 ; 0x04
#_02DD94: dw $FFFF ; 0x05
#_02DD96: dw $0020 ; 0x06
#_02DD98: dw $00F0 ; 0x07
#_02DD9A: dw $00F1 ; 0x08
#_02DD9C: dw $00C9 ; 0x09
#_02DD9E: dw $0084 ; 0x0A
#_02DDA0: dw $0085 ; 0x0B
#_02DDA2: dw $0083 ; 0x0C
#_02DDA4: dw $0063 ; 0x0D
#_02DDA6: dw $00F2 ; 0x0E
#_02DDA8: dw $00F3 ; 0x0F
#_02DDAA: dw $00F4 ; 0x10
#_02DDAC: dw $00F5 ; 0x11
#_02DDAE: dw $00E3 ; 0x12
#_02DDB0: dw $00E2 ; 0x13
#_02DDB2: dw $00F8 ; 0x14
#_02DDB4: dw $00E8 ; 0x15
#_02DDB6: dw $0023 ; 0x16
#_02DDB8: dw $00FB ; 0x17
#_02DDBA: dw $00EB ; 0x18
#_02DDBC: dw $00D5 ; 0x19
#_02DDBE: dw $0024 ; 0x1A
#_02DDC0: dw $00FD ; 0x1B
#_02DDC2: dw $00ED ; 0x1C
#_02DDC4: dw $00FE ; 0x1D
#_02DDC6: dw $00EE ; 0x1E
#_02DDC8: dw $00FF ; 0x1F
#_02DDCA: dw $00EF ; 0x20
#_02DDCC: dw $00DF ; 0x21
#_02DDCE: dw $00F9 ; 0x22
#_02DDD0: dw $00FA ; 0x23
#_02DDD2: dw $00EA ; 0x24
#_02DDD4: dw $00E0 ; 0x25
#_02DDD6: dw $0028 ; 0x26
#_02DDD8: dw $004A ; 0x27
#_02DDDA: dw $0098 ; 0x28
#_02DDDC: dw $0056 ; 0x29
#_02DDDE: dw $0057 ; 0x2A
#_02DDE0: dw $0058 ; 0x2B
#_02DDE2: dw $0059 ; 0x2C
#_02DDE4: dw $0077 ; 0x2D
#_02DDE6: dw $000E ; 0x2E
#_02DDE8: dw $00E6 ; 0x2F
#_02DDEA: dw $00E7 ; 0x30
#_02DDEC: dw $00E4 ; 0x31
#_02DDEE: dw $00E5 ; 0x32
#_02DDF0: dw $0055 ; 0x33
#_02DDF2: dw $00D6 ; 0x34
#_02DDF4: dw $00DB ; 0x35
#_02DDF6: dw $00E1 ; 0x36
#_02DDF8: dw $0010 ; 0x37
#_02DDFA: dw $000C ; 0x38
#_02DDFC: dw $0008 ; 0x39
#_02DDFE: dw $002F ; 0x3A
#_02DE00: dw $003C ; 0x3B
#_02DE02: dw $002C ; 0x3C
#_02DE04: dw $0003 ; 0x3D
#_02DE06: dw $1000 ; 0x3E
#_02DE08: dw $1002 ; 0x3F
#_02DE0A: dw $1004 ; 0x40
#_02DE0C: dw $1006 ; 0x41
#_02DE0E: dw $1008 ; 0x42
#_02DE10: dw $100A ; 0x43
#_02DE12: dw $100C ; 0x44
#_02DE14: dw $100E ; 0x45
#_02DE16: dw $1010 ; 0x46
#_02DE18: dw $1012 ; 0x47
#_02DE1A: dw $1014 ; 0x48
#_02DE1C: dw $1016 ; 0x49
#_02DE1E: dw $1018 ; 0x4A
#_02DE20: dw $0180 ; 0x4B
#_02DE22: dw $0181 ; 0x4C
#_02DE24: dw $0182 ; 0x4D
#_02DE26: dw $0189 ; 0x4E

;---------------------------------------------------------------------------------------------------

.overworld_id
#_02DE28: db $2C ; 0x00
#_02DE29: db $13 ; 0x01
#_02DE2A: db $1B ; 0x02
#_02DE2B: db $1B ; 0x03
#_02DE2C: db $1B ; 0x04
#_02DE2D: db $0F ; 0x05
#_02DE2E: db $5B ; 0x06
#_02DE2F: db $0A ; 0x07
#_02DE30: db $03 ; 0x08
#_02DE31: db $1E ; 0x09
#_02DE32: db $30 ; 0x0A
#_02DE33: db $30 ; 0x0B
#_02DE34: db $30 ; 0x0C
#_02DE35: db $30 ; 0x0D
#_02DE36: db $18 ; 0x0E
#_02DE37: db $18 ; 0x0F
#_02DE38: db $28 ; 0x10
#_02DE39: db $29 ; 0x11
#_02DE3A: db $22 ; 0x12
#_02DE3B: db $02 ; 0x13
#_02DE3C: db $45 ; 0x14
#_02DE3D: db $45 ; 0x15
#_02DE3E: db $45 ; 0x16
#_02DE3F: db $4A ; 0x17
#_02DE40: db $4A ; 0x18
#_02DE41: db $45 ; 0x19
#_02DE42: db $45 ; 0x1A
#_02DE43: db $05 ; 0x1B
#_02DE44: db $05 ; 0x1C
#_02DE45: db $05 ; 0x1D
#_02DE46: db $05 ; 0x1E
#_02DE47: db $05 ; 0x1F
#_02DE48: db $05 ; 0x20
#_02DE49: db $05 ; 0x21
#_02DE4A: db $03 ; 0x22
#_02DE4B: db $03 ; 0x23
#_02DE4C: db $03 ; 0x24
#_02DE4D: db $1B ; 0x25
#_02DE4E: db $7B ; 0x26
#_02DE4F: db $5E ; 0x27
#_02DE50: db $70 ; 0x28
#_02DE51: db $40 ; 0x29
#_02DE52: db $40 ; 0x2A
#_02DE53: db $40 ; 0x2B
#_02DE54: db $40 ; 0x2C
#_02DE55: db $03 ; 0x2D
#_02DE56: db $75 ; 0x2E
#_02DE57: db $0A ; 0x2F
#_02DE58: db $03 ; 0x30
#_02DE59: db $03 ; 0x31
#_02DE5A: db $03 ; 0x32
#_02DE5B: db $1B ; 0x33
#_02DE5C: db $47 ; 0x34
#_02DE5D: db $58 ; 0x35
#_02DE5E: db $00 ; 0x36
#_02DE5F: db $5B ; 0x37
#_02DE60: db $43 ; 0x38
#_02DE61: db $15 ; 0x39
#_02DE62: db $18 ; 0x3A
#_02DE63: db $45 ; 0x3B
#_02DE64: db $45 ; 0x3C
#_02DE65: db $2C ; 0x3D
#_02DE66: db $1B ; 0x3E
#_02DE67: db $18 ; 0x3F
#_02DE68: db $03 ; 0x40
#_02DE69: db $2C ; 0x41
#_02DE6A: db $05 ; 0x42
#_02DE6B: db $02 ; 0x43
#_02DE6C: db $1E ; 0x44
#_02DE6D: db $18 ; 0x45
#_02DE6E: db $81 ; 0x46
#_02DE6F: db $30 ; 0x47
#_02DE70: db $16 ; 0x48
#_02DE71: db $2A ; 0x49
#_02DE72: db $00 ; 0x4A
#_02DE73: db $80 ; 0x4B
#_02DE74: db $80 ; 0x4C
#_02DE75: db $81 ; 0x4D
#_02DE76: db $88 ; 0x4E

;---------------------------------------------------------------------------------------------------

.exit_vram_addr
#_02DE77: dw $0506 ; 0x00
#_02DE79: dw $001C ; 0x01
#_02DE7B: dw $0016 ; 0x02
#_02DE7D: dw $0530 ; 0x03
#_02DE7F: dw $004A ; 0x04
#_02DE81: dw $001C ; 0x05
#_02DE83: dw $002E ; 0x06
#_02DE85: dw $03A0 ; 0x07
#_02DE87: dw $1402 ; 0x08
#_02DE89: dw $005A ; 0x09
#_02DE8B: dw $0314 ; 0x0A
#_02DE8D: dw $02A8 ; 0x0B
#_02DE8F: dw $0280 ; 0x0C
#_02DE91: dw $0016 ; 0x0D
#_02DE93: dw $02BC ; 0x0E
#_02DE95: dw $02C4 ; 0x0F
#_02DE97: dw $08A0 ; 0x10
#_02DE99: dw $0880 ; 0x11
#_02DE9B: dw $0412 ; 0x12
#_02DE9D: dw $0118 ; 0x13
#_02DE9F: dw $0EE0 ; 0x14
#_02DEA1: dw $0460 ; 0x15
#_02DEA3: dw $07CA ; 0x16
#_02DEA5: dw $03A0 ; 0x17
#_02DEA7: dw $00A0 ; 0x18
#_02DEA9: dw $0AD4 ; 0x19
#_02DEAB: dw $07E0 ; 0x1A
#_02DEAD: dw $0DD4 ; 0x1B
#_02DEAF: dw $0AD4 ; 0x1C
#_02DEB1: dw $0CCA ; 0x1D
#_02DEB3: dw $07C8 ; 0x1E
#_02DEB5: dw $0EE0 ; 0x1F
#_02DEB7: dw $17E0 ; 0x20
#_02DEB9: dw $0460 ; 0x21
#_02DEBB: dw $0D9C ; 0x22
#_02DEBD: dw $0EAC ; 0x23
#_02DEBF: dw $092C ; 0x24
#_02DEC1: dw $0032 ; 0x25
#_02DEC3: dw $049E ; 0x26
#_02DEC5: dw $005A ; 0x27
#_02DEC7: dw $0414 ; 0x28
#_02DEC9: dw $0C8E ; 0x29
#_02DECB: dw $0EB8 ; 0x2A
#_02DECD: dw $0F4C ; 0x2B
#_02DECF: dw $0282 ; 0x2C
#_02DED1: dw $0050 ; 0x2D
#_02DED3: dw $0BC6 ; 0x2E
#_02DED5: dw $00A0 ; 0x2F
#_02DED7: dw $0D82 ; 0x30
#_02DED9: dw $181A ; 0x31
#_02DEDB: dw $10C6 ; 0x32
#_02DEDD: dw $044A ; 0x33
#_02DEDF: dw $0712 ; 0x34
#_02DEE1: dw $0B2E ; 0x35
#_02DEE3: dw $0F4E ; 0x36
#_02DEE5: dw $0B0E ; 0x37
#_02DEE7: dw $0052 ; 0x38
#_02DEE9: dw $0088 ; 0x39
#_02DEEB: dw $0386 ; 0x3A
#_02DEED: dw $04DA ; 0x3B
#_02DEEF: dw $004C ; 0x3C
#_02DEF1: dw $0506 ; 0x3D
#_02DEF3: dw $1230 ; 0x3E
#_02DEF5: dw $0448 ; 0x3F
#_02DEF7: dw $0050 ; 0x40
#_02DEF9: dw $009A ; 0x41
#_02DEFB: dw $034E ; 0x42
#_02DEFD: dw $049A ; 0x43
#_02DEFF: dw $07C0 ; 0x44
#_02DF01: dw $1100 ; 0x45
#_02DF03: dw $0040 ; 0x46
#_02DF05: dw $0916 ; 0x47
#_02DF07: dw $000A ; 0x48
#_02DF09: dw $0910 ; 0x49
#_02DF0B: dw $0A3A ; 0x4A
#_02DF0D: dw $0000 ; 0x4B
#_02DF0F: dw $0020 ; 0x4C
#_02DF11: dw $1782 ; 0x4D
#_02DF13: dw $0000 ; 0x4E

;---------------------------------------------------------------------------------------------------

.vertical_scroll
#_02DF15: dw $0A9A ; 0x00
#_02DF17: dw $0400 ; 0x01
#_02DF19: dw $0600 ; 0x02
#_02DF1B: dw $0692 ; 0x03
#_02DF1D: dw $0600 ; 0x04
#_02DF1F: dw $0200 ; 0x05
#_02DF21: dw $0600 ; 0x06
#_02DF23: dw $0264 ; 0x07
#_02DF25: dw $0294 ; 0x08
#_02DF27: dw $0600 ; 0x09
#_02DF29: dw $0C56 ; 0x0A
#_02DF2B: dw $0C4A ; 0x0B
#_02DF2D: dw $0C46 ; 0x0C
#_02DF2F: dw $0C00 ; 0x0D
#_02DF31: dw $064C ; 0x0E
#_02DF33: dw $064A ; 0x0F
#_02DF35: dw $0B06 ; 0x10
#_02DF37: dw $0B07 ; 0x11
#_02DF39: dw $087A ; 0x12
#_02DF3B: dw $0015 ; 0x13
#_02DF3D: dw $01E4 ; 0x14
#_02DF3F: dw $0093 ; 0x15
#_02DF41: dw $0103 ; 0x16
#_02DF43: dw $0263 ; 0x17
#_02DF45: dw $020A ; 0x18
#_02DF47: dw $0164 ; 0x19
#_02DF49: dw $0103 ; 0x1A
#_02DF4B: dw $01C4 ; 0x1B
#_02DF4D: dw $0163 ; 0x1C
#_02DF4F: dw $01A3 ; 0x1D
#_02DF51: dw $0108 ; 0x1E
#_02DF53: dw $01E3 ; 0x1F
#_02DF55: dw $0304 ; 0x20
#_02DF57: dw $0093 ; 0x21
#_02DF59: dw $01C3 ; 0x22
#_02DF5B: dw $01E3 ; 0x23
#_02DF5D: dw $0133 ; 0x24
#_02DF5F: dw $0600 ; 0x25
#_02DF61: dw $0E8C ; 0x26
#_02DF63: dw $0600 ; 0x27
#_02DF65: dw $0C79 ; 0x28
#_02DF67: dw $01A6 ; 0x29
#_02DF69: dw $01E6 ; 0x2A
#_02DF6B: dw $01F6 ; 0x2B
#_02DF6D: dw $0066 ; 0x2C
#_02DF6F: dw $0014 ; 0x2D
#_02DF71: dw $0D6A ; 0x2E
#_02DF73: dw $0205 ; 0x2F
#_02DF75: dw $01C4 ; 0x30
#_02DF77: dw $031E ; 0x31
#_02DF79: dw $0224 ; 0x32
#_02DF7B: dw $067A ; 0x33
#_02DF7D: dw $00DA ; 0x34
#_02DF7F: dw $075A ; 0x35
#_02DF81: dw $01F6 ; 0x36
#_02DF83: dw $075A ; 0x37
#_02DF85: dw $0000 ; 0x38
#_02DF87: dw $0400 ; 0x39
#_02DF89: dw $0665 ; 0x3A
#_02DF8B: dw $00A3 ; 0x3B
#_02DF8D: dw $0000 ; 0x3C
#_02DF8F: dw $0A9A ; 0x3D
#_02DF91: dw $0842 ; 0x3E
#_02DF93: dw $0674 ; 0x3F
#_02DF95: dw $0000 ; 0x40
#_02DF97: dw $0A0B ; 0x41
#_02DF99: dw $005C ; 0x42
#_02DF9B: dw $0089 ; 0x43
#_02DF9D: dw $06E4 ; 0x44
#_02DF9F: dw $0826 ; 0x45
#_02DFA1: dw $0010 ; 0x46
#_02DFA3: dw $0D20 ; 0x47
#_02DFA5: dw $0400 ; 0x48
#_02DFA7: dw $0B1E ; 0x49
#_02DFA9: dw $016A ; 0x4A
#_02DFAB: dw $0120 ; 0x4B
#_02DFAD: dw $0000 ; 0x4C
#_02DFAF: dw $0320 ; 0x4D
#_02DFB1: dw $0000 ; 0x4E

;---------------------------------------------------------------------------------------------------

.horizontal_scroll
#_02DFB3: dw $0832 ; 0x00
#_02DFB5: dw $06DE ; 0x01
#_02DFB7: dw $06AE ; 0x02
#_02DFB9: dw $0784 ; 0x03
#_02DFBB: dw $0856 ; 0x04
#_02DFBD: dw $0EE2 ; 0x05
#_02DFBF: dw $0778 ; 0x06
#_02DFC1: dw $0500 ; 0x07
#_02DFC3: dw $0604 ; 0x08
#_02DFC5: dw $0ED6 ; 0x09
#_02DFC7: dw $00A6 ; 0x0A
#_02DFC9: dw $0142 ; 0x0B
#_02DFCB: dw $0003 ; 0x0C
#_02DFCD: dw $00A2 ; 0x0D
#_02DFCF: dw $01E2 ; 0x0E
#_02DFD1: dw $0222 ; 0x0F
#_02DFD3: dw $0100 ; 0x10
#_02DFD5: dw $0200 ; 0x11
#_02DFD7: dw $048E ; 0x12
#_02DFD9: dw $04C6 ; 0x13
#_02DFDB: dw $0D00 ; 0x14
#_02DFDD: dw $0D00 ; 0x15
#_02DFDF: dw $0C46 ; 0x16
#_02DFE1: dw $0500 ; 0x17
#_02DFE3: dw $0500 ; 0x18
#_02DFE5: dw $0CA6 ; 0x19
#_02DFE7: dw $0D00 ; 0x1A
#_02DFE9: dw $0CA6 ; 0x1B
#_02DFEB: dw $0CA6 ; 0x1C
#_02DFED: dw $0C56 ; 0x1D
#_02DFEF: dw $0C46 ; 0x1E
#_02DFF1: dw $0D00 ; 0x1F
#_02DFF3: dw $0D00 ; 0x20
#_02DFF5: dw $0D00 ; 0x21
#_02DFF7: dw $06D4 ; 0x22
#_02DFF9: dw $0754 ; 0x23
#_02DFFB: dw $0754 ; 0x24
#_02DFFD: dw $0784 ; 0x25
#_02DFFF: dw $06F2 ; 0x26
#_02E001: dw $0ED6 ; 0x27
#_02E003: dw $00A6 ; 0x28
#_02E005: dw $0062 ; 0x29
#_02E007: dw $01C2 ; 0x2A
#_02E009: dw $0262 ; 0x2B
#_02E00B: dw $0016 ; 0x2C
#_02E00D: dw $087C ; 0x2D
#_02E00F: dw $0C3E ; 0x2E
#_02E011: dw $0500 ; 0x2F
#_02E013: dw $0600 ; 0x30
#_02E015: dw $06B4 ; 0x31
#_02E017: dw $0814 ; 0x32
#_02E019: dw $0854 ; 0x33
#_02E01B: dw $0E96 ; 0x34
#_02E01D: dw $0176 ; 0x35
#_02E01F: dw $0262 ; 0x36
#_02E021: dw $0674 ; 0x37
#_02E023: dw $0884 ; 0x38
#_02E025: dw $0A36 ; 0x39
#_02E027: dw $0032 ; 0x3A
#_02E029: dw $0CD6 ; 0x3B
#_02E02B: dw $0C56 ; 0x3C
#_02E02D: dw $0832 ; 0x3D
#_02E02F: dw $077F ; 0x3E
#_02E031: dw $024B ; 0x3F
#_02E033: dw $0878 ; 0x40
#_02E035: dw $08D7 ; 0x41
#_02E037: dw $0C6D ; 0x42
#_02E039: dw $04CF ; 0x43
#_02E03B: dw $0DFE ; 0x44
#_02E03D: dw $0001 ; 0x45
#_02E03F: dw $0401 ; 0x46
#_02E041: dw $00AA ; 0x47
#_02E043: dw $0C57 ; 0x48
#_02E045: dw $0478 ; 0x49
#_02E047: dw $01CF ; 0x4A
#_02E049: dw $0000 ; 0x4B
#_02E04B: dw $0100 ; 0x4C
#_02E04D: dw $021E ; 0x4D
#_02E04F: dw $0000 ; 0x4E

;---------------------------------------------------------------------------------------------------

.y_coordinate
#_02E051: dw $0AE8 ; 0x00
#_02E053: dw $0414 ; 0x01
#_02E055: dw $0604 ; 0x02
#_02E057: dw $06CC ; 0x03
#_02E059: dw $0604 ; 0x04
#_02E05B: dw $0203 ; 0x05
#_02E05D: dw $065C ; 0x06
#_02E05F: dw $02B8 ; 0x07
#_02E061: dw $02E8 ; 0x08
#_02E063: dw $0618 ; 0x09
#_02E065: dw $0CA8 ; 0x0A
#_02E067: dw $0C98 ; 0x0B
#_02E069: dw $0C98 ; 0x0C
#_02E06B: dw $0C28 ; 0x0D
#_02E06D: dw $0698 ; 0x0E
#_02E06F: dw $0698 ; 0x0F
#_02E071: dw $0B58 ; 0x10
#_02E073: dw $0B58 ; 0x11
#_02E075: dw $08C8 ; 0x12
#_02E077: dw $0067 ; 0x13
#_02E079: dw $0238 ; 0x14
#_02E07B: dw $00E7 ; 0x15
#_02E07D: dw $0157 ; 0x16
#_02E07F: dw $02B7 ; 0x17
#_02E081: dw $0258 ; 0x18
#_02E083: dw $01B8 ; 0x19
#_02E085: dw $0157 ; 0x1A
#_02E087: dw $0218 ; 0x1B
#_02E089: dw $01B7 ; 0x1C
#_02E08B: dw $01F7 ; 0x1D
#_02E08D: dw $0158 ; 0x1E
#_02E08F: dw $0237 ; 0x1F
#_02E091: dw $0358 ; 0x20
#_02E093: dw $00E7 ; 0x21
#_02E095: dw $0217 ; 0x22
#_02E097: dw $0237 ; 0x23
#_02E099: dw $0187 ; 0x24
#_02E09B: dw $0634 ; 0x25
#_02E09D: dw $0ED8 ; 0x26
#_02E09F: dw $0628 ; 0x27
#_02E0A1: dw $0CC7 ; 0x28
#_02E0A3: dw $01F8 ; 0x29
#_02E0A5: dw $0238 ; 0x2A
#_02E0A7: dw $0248 ; 0x2B
#_02E0A9: dw $00B8 ; 0x2C
#_02E0AB: dw $0068 ; 0x2D
#_02E0AD: dw $0DB8 ; 0x2E
#_02E0AF: dw $0257 ; 0x2F
#_02E0B1: dw $0218 ; 0x30
#_02E0B3: dw $03A7 ; 0x31
#_02E0B5: dw $0278 ; 0x32
#_02E0B7: dw $06C8 ; 0x33
#_02E0B9: dw $0128 ; 0x34
#_02E0BB: dw $07A8 ; 0x35
#_02E0BD: dw $0248 ; 0x36
#_02E0BF: dw $07A8 ; 0x37
#_02E0C1: dw $0028 ; 0x38
#_02E0C3: dw $0448 ; 0x39
#_02E0C5: dw $06B7 ; 0x3A
#_02E0C7: dw $0107 ; 0x3B
#_02E0C9: dw $0038 ; 0x3C
#_02E0CB: dw $0AE8 ; 0x3D
#_02E0CD: dw $0890 ; 0x3E
#_02E0CF: dw $06C2 ; 0x3F
#_02E0D1: dw $004D ; 0x40
#_02E0D3: dw $0A59 ; 0x41
#_02E0D5: dw $00AA ; 0x42
#_02E0D7: dw $00DB ; 0x43
#_02E0D9: dw $0732 ; 0x44
#_02E0DB: dw $0874 ; 0x45
#_02E0DD: dw $006E ; 0x46
#_02E0DF: dw $0D72 ; 0x47
#_02E0E1: dw $044D ; 0x48
#_02E0E3: dw $0B72 ; 0x49
#_02E0E5: dw $01BE ; 0x4A
#_02E0E7: dw $01E8 ; 0x4B
#_02E0E9: dw $0080 ; 0x4C
#_02E0EB: dw $03E8 ; 0x4D
#_02E0ED: dw $0100 ; 0x4E

;---------------------------------------------------------------------------------------------------

.x_coordinate
#_02E0EF: dw $08B8 ; 0x00
#_02E0F1: dw $0758 ; 0x01
#_02E0F3: dw $0728 ; 0x02
#_02E0F5: dw $07F8 ; 0x03
#_02E0F7: dw $08C8 ; 0x04
#_02E0F9: dw $0F50 ; 0x05
#_02E0FB: dw $07F0 ; 0x06
#_02E0FD: dw $05A8 ; 0x07
#_02E0FF: dw $0678 ; 0x08
#_02E101: dw $0F50 ; 0x09
#_02E103: dw $0128 ; 0x0A
#_02E105: dw $01C8 ; 0x0B
#_02E107: dw $0088 ; 0x0C
#_02E109: dw $0128 ; 0x0D
#_02E10B: dw $0268 ; 0x0E
#_02E10D: dw $02A8 ; 0x0F
#_02E10F: dw $01B8 ; 0x10
#_02E111: dw $0238 ; 0x11
#_02E113: dw $0508 ; 0x12
#_02E115: dw $0548 ; 0x13
#_02E117: dw $0D78 ; 0x14
#_02E119: dw $0DB8 ; 0x15
#_02E11B: dw $0CB8 ; 0x16
#_02E11D: dw $05A8 ; 0x17
#_02E11F: dw $05B8 ; 0x18
#_02E121: dw $0D18 ; 0x19
#_02E123: dw $0D78 ; 0x1A
#_02E125: dw $0D18 ; 0x1B
#_02E127: dw $0D18 ; 0x1C
#_02E129: dw $0CC8 ; 0x1D
#_02E12B: dw $0CB8 ; 0x1E
#_02E12D: dw $0DA8 ; 0x1F
#_02E12F: dw $0DC8 ; 0x20
#_02E131: dw $0DB8 ; 0x21
#_02E133: dw $0748 ; 0x22
#_02E135: dw $07C8 ; 0x23
#_02E137: dw $07C8 ; 0x24
#_02E139: dw $07F8 ; 0x25
#_02E13B: dw $0778 ; 0x26
#_02E13D: dw $0F50 ; 0x27
#_02E13F: dw $0128 ; 0x28
#_02E141: dw $00E8 ; 0x29
#_02E143: dw $0248 ; 0x2A
#_02E145: dw $02E8 ; 0x2B
#_02E147: dw $0098 ; 0x2C
#_02E149: dw $08F0 ; 0x2D
#_02E14B: dw $0CB8 ; 0x2E
#_02E14D: dw $05B8 ; 0x2F
#_02E14F: dw $0648 ; 0x30
#_02E151: dw $0728 ; 0x31
#_02E153: dw $0888 ; 0x32
#_02E155: dw $08C8 ; 0x33
#_02E157: dw $0F08 ; 0x34
#_02E159: dw $01F8 ; 0x35
#_02E15B: dw $02E8 ; 0x36
#_02E15D: dw $06E8 ; 0x37
#_02E15F: dw $08F8 ; 0x38
#_02E161: dw $0AA8 ; 0x39
#_02E163: dw $00B8 ; 0x3A
#_02E165: dw $0D48 ; 0x3B
#_02E167: dw $0CC8 ; 0x3C
#_02E169: dw $08B8 ; 0x3D
#_02E16B: dw $07F3 ; 0x3E
#_02E16D: dw $02CD ; 0x3F
#_02E16F: dw $08E6 ; 0x40
#_02E171: dw $094F ; 0x41
#_02E173: dw $0CDF ; 0x42
#_02E175: dw $0551 ; 0x43
#_02E177: dw $0E7C ; 0x44
#_02E179: dw $0083 ; 0x45
#_02E17B: dw $047D ; 0x46
#_02E17D: dw $0130 ; 0x47
#_02E17F: dw $0CD1 ; 0x48
#_02E181: dw $04FE ; 0x49
#_02E183: dw $0255 ; 0x4A
#_02E185: dw $0080 ; 0x4B
#_02E187: dw $01F0 ; 0x4C
#_02E189: dw $029E ; 0x4D
#_02E18B: dw $0080 ; 0x4E

;---------------------------------------------------------------------------------------------------

.camera_trigger_y
#_02E18D: dw $0B07 ; 0x00
#_02E18F: dw $046D ; 0x01
#_02E191: dw $066D ; 0x02
#_02E193: dw $06FF ; 0x03
#_02E195: dw $066D ; 0x04
#_02E197: dw $026D ; 0x05
#_02E199: dw $066D ; 0x06
#_02E19B: dw $02D3 ; 0x07
#_02E19D: dw $0303 ; 0x08
#_02E19F: dw $066D ; 0x09
#_02E1A1: dw $0CC3 ; 0x0A
#_02E1A3: dw $0CB7 ; 0x0B
#_02E1A5: dw $0CB3 ; 0x0C
#_02E1A7: dw $0C6D ; 0x0D
#_02E1A9: dw $06B9 ; 0x0E
#_02E1AB: dw $06B7 ; 0x0F
#_02E1AD: dw $0B73 ; 0x10
#_02E1AF: dw $0B74 ; 0x11
#_02E1B1: dw $08E7 ; 0x12
#_02E1B3: dw $0082 ; 0x13
#_02E1B5: dw $0253 ; 0x14
#_02E1B7: dw $0102 ; 0x15
#_02E1B9: dw $0172 ; 0x16
#_02E1BB: dw $02D2 ; 0x17
#_02E1BD: dw $0277 ; 0x18
#_02E1BF: dw $01D3 ; 0x19
#_02E1C1: dw $0172 ; 0x1A
#_02E1C3: dw $0233 ; 0x1B
#_02E1C5: dw $01D2 ; 0x1C
#_02E1C7: dw $0212 ; 0x1D
#_02E1C9: dw $0177 ; 0x1E
#_02E1CB: dw $0252 ; 0x1F
#_02E1CD: dw $0373 ; 0x20
#_02E1CF: dw $0102 ; 0x21
#_02E1D1: dw $0232 ; 0x22
#_02E1D3: dw $0252 ; 0x23
#_02E1D5: dw $01A2 ; 0x24
#_02E1D7: dw $066D ; 0x25
#_02E1D9: dw $0EF9 ; 0x26
#_02E1DB: dw $066D ; 0x27
#_02E1DD: dw $0CE6 ; 0x28
#_02E1DF: dw $0213 ; 0x29
#_02E1E1: dw $0253 ; 0x2A
#_02E1E3: dw $0263 ; 0x2B
#_02E1E5: dw $00D3 ; 0x2C
#_02E1E7: dw $0083 ; 0x2D
#_02E1E9: dw $0DD7 ; 0x2E
#_02E1EB: dw $0272 ; 0x2F
#_02E1ED: dw $0233 ; 0x30
#_02E1EF: dw $038D ; 0x31
#_02E1F1: dw $0293 ; 0x32
#_02E1F3: dw $06E7 ; 0x33
#_02E1F5: dw $0147 ; 0x34
#_02E1F7: dw $07C7 ; 0x35
#_02E1F9: dw $0263 ; 0x36
#_02E1FB: dw $07C7 ; 0x37
#_02E1FD: dw $006F ; 0x38
#_02E1FF: dw $046F ; 0x39
#_02E201: dw $06D2 ; 0x3A
#_02E203: dw $0112 ; 0x3B
#_02E205: dw $006F ; 0x3C
#_02E207: dw $0B07 ; 0x3D
#_02E209: dw $08AF ; 0x3E
#_02E20B: dw $06E1 ; 0x3F
#_02E20D: dw $006D ; 0x40
#_02E20F: dw $0A78 ; 0x41
#_02E211: dw $00C9 ; 0x42
#_02E213: dw $00F6 ; 0x43
#_02E215: dw $0751 ; 0x44
#_02E217: dw $0893 ; 0x45
#_02E219: dw $008D ; 0x46
#_02E21B: dw $0D8D ; 0x47
#_02E21D: dw $046D ; 0x48
#_02E21F: dw $0B8D ; 0x49
#_02E221: dw $01D9 ; 0x4A
#_02E223: dw $019D ; 0x4B
#_02E225: dw $008F ; 0x4C
#_02E227: dw $039D ; 0x4D
#_02E229: dw $009D ; 0x4E

;---------------------------------------------------------------------------------------------------

.camera_trigger_x
#_02E22B: dw $08BF ; 0x00
#_02E22D: dw $0763 ; 0x01
#_02E22F: dw $0733 ; 0x02
#_02E231: dw $0803 ; 0x03
#_02E233: dw $08D3 ; 0x04
#_02E235: dw $0F57 ; 0x05
#_02E237: dw $07F7 ; 0x06
#_02E239: dw $058D ; 0x07
#_02E23B: dw $0683 ; 0x08
#_02E23D: dw $0F5B ; 0x09
#_02E23F: dw $0133 ; 0x0A
#_02E241: dw $01CF ; 0x0B
#_02E243: dw $0090 ; 0x0C
#_02E245: dw $012F ; 0x0D
#_02E247: dw $026F ; 0x0E
#_02E249: dw $02AF ; 0x0F
#_02E24B: dw $018D ; 0x10
#_02E24D: dw $028D ; 0x11
#_02E24F: dw $0513 ; 0x12
#_02E251: dw $0553 ; 0x13
#_02E253: dw $0D7D ; 0x14
#_02E255: dw $0D7D ; 0x15
#_02E257: dw $0CC3 ; 0x16
#_02E259: dw $058D ; 0x17
#_02E25B: dw $058D ; 0x18
#_02E25D: dw $0D23 ; 0x19
#_02E25F: dw $0D7D ; 0x1A
#_02E261: dw $0D23 ; 0x1B
#_02E263: dw $0D23 ; 0x1C
#_02E265: dw $0CD3 ; 0x1D
#_02E267: dw $0CC3 ; 0x1E
#_02E269: dw $0D7D ; 0x1F
#_02E26B: dw $0D7D ; 0x20
#_02E26D: dw $0D7D ; 0x21
#_02E26F: dw $0753 ; 0x22
#_02E271: dw $07D3 ; 0x23
#_02E273: dw $07D3 ; 0x24
#_02E275: dw $0803 ; 0x25
#_02E277: dw $077F ; 0x26
#_02E279: dw $0F5B ; 0x27
#_02E27B: dw $0133 ; 0x28
#_02E27D: dw $00EF ; 0x29
#_02E27F: dw $024F ; 0x2A
#_02E281: dw $02EF ; 0x2B
#_02E283: dw $00A3 ; 0x2C
#_02E285: dw $08FB ; 0x2D
#_02E287: dw $0CC3 ; 0x2E
#_02E289: dw $058D ; 0x2F
#_02E28B: dw $067F ; 0x30
#_02E28D: dw $0733 ; 0x31
#_02E28F: dw $0893 ; 0x32
#_02E291: dw $08D3 ; 0x33
#_02E293: dw $0F13 ; 0x34
#_02E295: dw $0203 ; 0x35
#_02E297: dw $02EF ; 0x36
#_02E299: dw $06F3 ; 0x37
#_02E29B: dw $0903 ; 0x38
#_02E29D: dw $0AB3 ; 0x39
#_02E29F: dw $00BF ; 0x3A
#_02E2A1: dw $0D53 ; 0x3B
#_02E2A3: dw $0CD3 ; 0x3C
#_02E2A5: dw $08BF ; 0x3D
#_02E2A7: dw $07FE ; 0x3E
#_02E2A9: dw $02D8 ; 0x3F
#_02E2AB: dw $08ED ; 0x40
#_02E2AD: dw $0956 ; 0x41
#_02E2AF: dw $0CEA ; 0x42
#_02E2B1: dw $055C ; 0x43
#_02E2B3: dw $0E83 ; 0x44
#_02E2B5: dw $008E ; 0x45
#_02E2B7: dw $0484 ; 0x46
#_02E2B9: dw $0137 ; 0x47
#_02E2BB: dw $0CDC ; 0x48
#_02E2BD: dw $0505 ; 0x49
#_02E2BF: dw $025C ; 0x4A
#_02E2C1: dw $0083 ; 0x4B
#_02E2C3: dw $018D ; 0x4C
#_02E2C5: dw $02A1 ; 0x4D
#_02E2C7: dw $0083 ; 0x4E

;---------------------------------------------------------------------------------------------------

.scroll_mod_y
#_02E2C9: db $06 ; 0x00
#_02E2CA: db $00 ; 0x01
#_02E2CB: db $00 ; 0x02
#_02E2CC: db $0E ; 0x03
#_02E2CD: db $00 ; 0x04
#_02E2CE: db $00 ; 0x05
#_02E2CF: db $00 ; 0x06
#_02E2D0: db $0A ; 0x07
#_02E2D1: db $0A ; 0x08
#_02E2D2: db $00 ; 0x09
#_02E2D3: db $0A ; 0x0A
#_02E2D4: db $06 ; 0x0B
#_02E2D5: db $0A ; 0x0C
#_02E2D6: db $00 ; 0x0D
#_02E2D7: db $04 ; 0x0E
#_02E2D8: db $06 ; 0x0F
#_02E2D9: db $0A ; 0x10
#_02E2DA: db $09 ; 0x11
#_02E2DB: db $06 ; 0x12
#_02E2DC: db $0B ; 0x13
#_02E2DD: db $0A ; 0x14
#_02E2DE: db $0B ; 0x15
#_02E2DF: db $0B ; 0x16
#_02E2E0: db $0B ; 0x17
#_02E2E1: db $06 ; 0x18
#_02E2E2: db $0A ; 0x19
#_02E2E3: db $0B ; 0x1A
#_02E2E4: db $0A ; 0x1B
#_02E2E5: db $0B ; 0x1C
#_02E2E6: db $0B ; 0x1D
#_02E2E7: db $06 ; 0x1E
#_02E2E8: db $0B ; 0x1F
#_02E2E9: db $0A ; 0x20
#_02E2EA: db $0B ; 0x21
#_02E2EB: db $0B ; 0x22
#_02E2EC: db $0B ; 0x23
#_02E2ED: db $0B ; 0x24
#_02E2EE: db $00 ; 0x25
#_02E2EF: db $04 ; 0x26
#_02E2F0: db $00 ; 0x27
#_02E2F1: db $07 ; 0x28
#_02E2F2: db $0A ; 0x29
#_02E2F3: db $0A ; 0x2A
#_02E2F4: db $0A ; 0x2B
#_02E2F5: db $0A ; 0x2C
#_02E2F6: db $0A ; 0x2D
#_02E2F7: db $06 ; 0x2E
#_02E2F8: db $0B ; 0x2F
#_02E2F9: db $0A ; 0x30
#_02E2FA: db $00 ; 0x31
#_02E2FB: db $0A ; 0x32
#_02E2FC: db $06 ; 0x33
#_02E2FD: db $06 ; 0x34
#_02E2FE: db $06 ; 0x35
#_02E2FF: db $0A ; 0x36
#_02E300: db $06 ; 0x37
#_02E301: db $00 ; 0x38
#_02E302: db $00 ; 0x39
#_02E303: db $0B ; 0x3A
#_02E304: db $0B ; 0x3B
#_02E305: db $00 ; 0x3C
#_02E306: db $06 ; 0x3D
#_02E307: db $FE ; 0x3E
#_02E308: db $0C ; 0x3F
#_02E309: db $00 ; 0x40
#_02E30A: db $05 ; 0x41
#_02E30B: db $04 ; 0x42
#_02E30C: db $01 ; 0x43
#_02E30D: db $07 ; 0x44
#_02E30E: db $FA ; 0x45
#_02E30F: db $00 ; 0x46
#_02E310: db $00 ; 0x47
#_02E311: db $00 ; 0x48
#_02E312: db $00 ; 0x49
#_02E313: db $F4 ; 0x4A
#_02E314: db $00 ; 0x4B
#_02E315: db $00 ; 0x4C
#_02E316: db $00 ; 0x4D
#_02E317: db $00 ; 0x4E

;---------------------------------------------------------------------------------------------------

.scroll_mod_x
#_02E318: db $FE ; 0x00
#_02E319: db $02 ; 0x01
#_02E31A: db $02 ; 0x02
#_02E31B: db $FA ; 0x03
#_02E31C: db $FA ; 0x04
#_02E31D: db $FE ; 0x05
#_02E31E: db $F8 ; 0x06
#_02E31F: db $00 ; 0x07
#_02E320: db $FC ; 0x08
#_02E321: db $FA ; 0x09
#_02E322: db $FA ; 0x0A
#_02E323: db $FE ; 0x0B
#_02E324: db $FD ; 0x0C
#_02E325: db $0E ; 0x0D
#_02E326: db $FE ; 0x0E
#_02E327: db $FE ; 0x0F
#_02E328: db $00 ; 0x10
#_02E329: db $00 ; 0x11
#_02E32A: db $02 ; 0x12
#_02E32B: db $FA ; 0x13
#_02E32C: db $00 ; 0x14
#_02E32D: db $00 ; 0x15
#_02E32E: db $0A ; 0x16
#_02E32F: db $00 ; 0x17
#_02E330: db $00 ; 0x18
#_02E331: db $FA ; 0x19
#_02E332: db $00 ; 0x1A
#_02E333: db $FA ; 0x1B
#_02E334: db $FA ; 0x1C
#_02E335: db $FA ; 0x1D
#_02E336: db $FA ; 0x1E
#_02E337: db $00 ; 0x1F
#_02E338: db $00 ; 0x20
#_02E339: db $00 ; 0x21
#_02E33A: db $FC ; 0x22
#_02E33B: db $FC ; 0x23
#_02E33C: db $FC ; 0x24
#_02E33D: db $0A ; 0x25
#_02E33E: db $FE ; 0x26
#_02E33F: db $FA ; 0x27
#_02E340: db $FA ; 0x28
#_02E341: db $0E ; 0x29
#_02E342: db $FE ; 0x2A
#_02E343: db $FE ; 0x2B
#_02E344: db $FA ; 0x2C
#_02E345: db $F4 ; 0x2D
#_02E346: db $F2 ; 0x2E
#_02E347: db $00 ; 0x2F
#_02E348: db $00 ; 0x30
#_02E349: db $0C ; 0x31
#_02E34A: db $0C ; 0x32
#_02E34B: db $FA ; 0x33
#_02E34C: db $FA ; 0x34
#_02E34D: db $FA ; 0x35
#_02E34E: db $0E ; 0x36
#_02E34F: db $FA ; 0x37
#_02E350: db $FC ; 0x38
#_02E351: db $0A ; 0x39
#_02E352: db $FE ; 0x3A
#_02E353: db $FA ; 0x3B
#_02E354: db $0A ; 0x3C
#_02E355: db $FE ; 0x3D
#_02E356: db $FF ; 0x3E
#_02E357: db $F5 ; 0x3F
#_02E358: db $08 ; 0x40
#_02E359: db $F9 ; 0x41
#_02E35A: db $03 ; 0x42
#_02E35B: db $01 ; 0x43
#_02E35C: db $02 ; 0x44
#_02E35D: db $FF ; 0x45
#_02E35E: db $FF ; 0x46
#_02E35F: db $06 ; 0x47
#_02E360: db $F9 ; 0x48
#_02E361: db $08 ; 0x49
#_02E362: db $01 ; 0x4A
#_02E363: db $00 ; 0x4B
#_02E364: db $00 ; 0x4C
#_02E365: db $F2 ; 0x4D
#_02E366: db $00 ; 0x4E

;---------------------------------------------------------------------------------------------------

.door_graphic
#_02E367: dw $0816 ; 0x00
#_02E369: dw $0000 ; 0x01
#_02E36B: dw $0000 ; 0x02
#_02E36D: dw $0000 ; 0x03
#_02E36F: dw $0000 ; 0x04
#_02E371: dw $0000 ; 0x05
#_02E373: dw $0000 ; 0x06
#_02E375: dw $0000 ; 0x07
#_02E377: dw $0000 ; 0x08
#_02E379: dw $0000 ; 0x09
#_02E37B: dw $0000 ; 0x0A
#_02E37D: dw $0000 ; 0x0B
#_02E37F: dw $0000 ; 0x0C
#_02E381: dw $0000 ; 0x0D
#_02E383: dw $05CC ; 0x0E
#_02E385: dw $05D4 ; 0x0F
#_02E387: dw $0BB6 ; 0x10
#_02E389: dw $0B86 ; 0x11
#_02E38B: dw $0000 ; 0x12
#_02E38D: dw $0000 ; 0x13
#_02E38F: dw $0000 ; 0x14
#_02E391: dw $0000 ; 0x15
#_02E393: dw $0000 ; 0x16
#_02E395: dw $0000 ; 0x17
#_02E397: dw $0000 ; 0x18
#_02E399: dw $0000 ; 0x19
#_02E39B: dw $0000 ; 0x1A
#_02E39D: dw $0000 ; 0x1B
#_02E39F: dw $0000 ; 0x1C
#_02E3A1: dw $0000 ; 0x1D
#_02E3A3: dw $0000 ; 0x1E
#_02E3A5: dw $0000 ; 0x1F
#_02E3A7: dw $0000 ; 0x20
#_02E3A9: dw $0000 ; 0x21
#_02E3AB: dw $0000 ; 0x22
#_02E3AD: dw $0000 ; 0x23
#_02E3AF: dw $0000 ; 0x24
#_02E3B1: dw $0000 ; 0x25
#_02E3B3: dw $0000 ; 0x26
#_02E3B5: dw $0000 ; 0x27
#_02E3B7: dw $0000 ; 0x28
#_02E3B9: dw $0000 ; 0x29
#_02E3BB: dw $0000 ; 0x2A
#_02E3BD: dw $0000 ; 0x2B
#_02E3BF: dw $0000 ; 0x2C
#_02E3C1: dw $0000 ; 0x2D
#_02E3C3: dw $0000 ; 0x2E
#_02E3C5: dw $0000 ; 0x2F
#_02E3C7: dw $0000 ; 0x30
#_02E3C9: dw $0000 ; 0x31
#_02E3CB: dw $0000 ; 0x32
#_02E3CD: dw $0000 ; 0x33
#_02E3CF: dw $0000 ; 0x34
#_02E3D1: dw $0000 ; 0x35
#_02E3D3: dw $0000 ; 0x36
#_02E3D5: dw $0000 ; 0x37
#_02E3D7: dw $0000 ; 0x38
#_02E3D9: dw $0000 ; 0x39
#_02E3DB: dw $0000 ; 0x3A
#_02E3DD: dw $0000 ; 0x3B
#_02E3DF: dw $0000 ; 0x3C
#_02E3E1: dw $0816 ; 0x3D
#_02E3E3: dw $0000 ; 0x3E
#_02E3E5: dw $0000 ; 0x3F
#_02E3E7: dw $0000 ; 0x40
#_02E3E9: dw $0000 ; 0x41
#_02E3EB: dw $0000 ; 0x42
#_02E3ED: dw $0000 ; 0x43
#_02E3EF: dw $0000 ; 0x44
#_02E3F1: dw $0000 ; 0x45
#_02E3F3: dw $0000 ; 0x46
#_02E3F5: dw $0000 ; 0x47
#_02E3F7: dw $0000 ; 0x48
#_02E3F9: dw $0000 ; 0x49
#_02E3FB: dw $0000 ; 0x4A
#_02E3FD: dw $0000 ; 0x4B
#_02E3FF: dw $0000 ; 0x4C
#_02E401: dw $0000 ; 0x4D
#_02E403: dw $0000 ; 0x4E

;---------------------------------------------------------------------------------------------------

.door_graphic_location
#_02E405: dw $0000 ; 0x00
#_02E407: dw $01AA ; 0x01
#_02E409: dw $8124 ; 0x02
#_02E40B: dw $87BE ; 0x03
#_02E40D: dw $8158 ; 0x04
#_02E40F: dw $0000 ; 0x05
#_02E411: dw $0000 ; 0x06
#_02E413: dw $0000 ; 0x07
#_02E415: dw $0000 ; 0x08
#_02E417: dw $0000 ; 0x09
#_02E419: dw $0000 ; 0x0A
#_02E41B: dw $0000 ; 0x0B
#_02E41D: dw $0000 ; 0x0C
#_02E41F: dw $0000 ; 0x0D
#_02E421: dw $0000 ; 0x0E
#_02E423: dw $0000 ; 0x0F
#_02E425: dw $0000 ; 0x10
#_02E427: dw $0000 ; 0x11
#_02E429: dw $0000 ; 0x12
#_02E42B: dw $0000 ; 0x13
#_02E42D: dw $0000 ; 0x14
#_02E42F: dw $0000 ; 0x15
#_02E431: dw $0000 ; 0x16
#_02E433: dw $0000 ; 0x17
#_02E435: dw $0000 ; 0x18
#_02E437: dw $0000 ; 0x19
#_02E439: dw $0000 ; 0x1A
#_02E43B: dw $0000 ; 0x1B
#_02E43D: dw $0000 ; 0x1C
#_02E43F: dw $0000 ; 0x1D
#_02E441: dw $0000 ; 0x1E
#_02E443: dw $0000 ; 0x1F
#_02E445: dw $0000 ; 0x20
#_02E447: dw $0000 ; 0x21
#_02E449: dw $0000 ; 0x22
#_02E44B: dw $0000 ; 0x23
#_02E44D: dw $0000 ; 0x24
#_02E44F: dw $82BE ; 0x25
#_02E451: dw $0000 ; 0x26
#_02E453: dw $0000 ; 0x27
#_02E455: dw $0000 ; 0x28
#_02E457: dw $0000 ; 0x29
#_02E459: dw $0000 ; 0x2A
#_02E45B: dw $0000 ; 0x2B
#_02E45D: dw $0000 ; 0x2C
#_02E45F: dw $0000 ; 0x2D
#_02E461: dw $0000 ; 0x2E
#_02E463: dw $0000 ; 0x2F
#_02E465: dw $0000 ; 0x30
#_02E467: dw $0000 ; 0x31
#_02E469: dw $0000 ; 0x32
#_02E46B: dw $0000 ; 0x33
#_02E46D: dw $0000 ; 0x34
#_02E46F: dw $0000 ; 0x35
#_02E471: dw $0000 ; 0x36
#_02E473: dw $0000 ; 0x37
#_02E475: dw $0000 ; 0x38
#_02E477: dw $0000 ; 0x39
#_02E479: dw $0000 ; 0x3A
#_02E47B: dw $0000 ; 0x3B
#_02E47D: dw $0000 ; 0x3C
#_02E47F: dw $0000 ; 0x3D
#_02E481: dw $0000 ; 0x3E
#_02E483: dw $0000 ; 0x3F
#_02E485: dw $0000 ; 0x40
#_02E487: dw $0000 ; 0x41
#_02E489: dw $0000 ; 0x42
#_02E48B: dw $0000 ; 0x43
#_02E48D: dw $0000 ; 0x44
#_02E48F: dw $0000 ; 0x45
#_02E491: dw $0000 ; 0x46
#_02E493: dw $0000 ; 0x47
#_02E495: dw $0000 ; 0x48
#_02E497: dw $0000 ; 0x49
#_02E499: dw $0000 ; 0x4A
#_02E49B: dw $0000 ; 0x4B
#_02E49D: dw $0000 ; 0x4C
#_02E49F: dw $0000 ; 0x4D
#_02E4A1: dw $0000 ; 0x4E

;===================================================================================================

LoadOverworldFromUnderworld:
#_02E4A3: PHB
#_02E4A4: PHK
#_02E4A5: PLB

#_02E4A6: STZ.b $1B
#_02E4A8: STZ.w $0458

#_02E4AB: REP #$20

#_02E4AD: LDA.w #$0000
#_02E4B0: STA.l $7EC017

#_02E4B4: LDA.w #$00FF
#_02E4B7: STA.w $040C

#_02E4BA: STZ.w $04AC

#_02E4BD: LDA.b $A0

#_02E4BF: CMP.w #$0104 ; ROOM 0104
#_02E4C2: BEQ .custom_exit

#_02E4C4: CMP.w #$0180 ; SPOW
#_02E4C7: BCS .custom_exit

#_02E4C9: CMP.w #$0100
#_02E4CC: BCC .custom_exit

#_02E4CE: JSR LoadCachedEntranceProperties
#_02E4D1: JMP.w Overworld_LoadNewScreenProperties_pre

.custom_exit
#_02E4D4: LDX.b #$9E

.next_room_check
#_02E4D6: DEX
#_02E4D7: DEX

#_02E4D8: CMP.w UnderworldExitData_room_id,X
#_02E4DB: BNE .next_room_check

;---------------------------------------------------------------------------------------------------

#_02E4DD: LDA.w UnderworldExitData_vertical_scroll,X
#_02E4E0: STA.b $E6
#_02E4E2: STA.b $E8
#_02E4E4: STA.w $0122
#_02E4E7: STA.w $0124

#_02E4EA: LDA.w UnderworldExitData_horizontal_scroll,X
#_02E4ED: STA.b $E0
#_02E4EF: STA.b $E2
#_02E4F1: STA.w $011E
#_02E4F4: STA.w $0120

#_02E4F7: LDA.w UnderworldExitData_y_coordinate,X
#_02E4FA: STA.b $20

#_02E4FC: LDA.w UnderworldExitData_x_coordinate,X
#_02E4FF: STA.b $22

;---------------------------------------------------------------------------------------------------

#_02E501: LDA.w UnderworldExitData_exit_vram_addr,X
#_02E504: STA.b $84

#_02E506: SEC
#_02E507: SBC.w #$0400
#_02E50A: AND.w #$0F80
#_02E50D: ASL A
#_02E50E: XBA
#_02E50F: STA.b $88

#_02E511: LDA.b $84
#_02E513: SEC
#_02E514: SBC.w #$0010
#_02E517: AND.w #$003E
#_02E51A: LSR A
#_02E51B: STA.b $86

#_02E51D: LDA.w UnderworldExitData_camera_trigger_y,X
#_02E520: STA.w $0618

#_02E523: DEC A
#_02E524: DEC A
#_02E525: STA.w $061A

#_02E528: LDA.w UnderworldExitData_camera_trigger_x,X
#_02E52B: STA.w $061C

#_02E52E: DEC A
#_02E52F: DEC A
#_02E530: STA.w $061E

;---------------------------------------------------------------------------------------------------

#_02E533: LDA.w #$0002
#_02E536: STA.b $2F

#_02E538: LDA.w UnderworldExitData_door_graphic,X
#_02E53B: STA.w $0696

#_02E53E: LDA.w UnderworldExitData_door_graphic_location,X
#_02E541: STA.w $0698

#_02E544: TXA
#_02E545: LSR A
#_02E546: TAX

#_02E547: SEP #$20

#_02E549: LDA.w UnderworldExitData_overworld_id,X
#_02E54C: STA.b $8A
#_02E54E: STA.w $040A

#_02E551: STZ.b $8B
#_02E553: STZ.w $040B

#_02E556: LDA.w UnderworldExitData_scroll_mod_y,X
#_02E559: STA.w $0624
#_02E55C: STZ.w $0625

#_02E55F: ASL A
#_02E560: BCC .positive_camera_y

#_02E562: DEC.w $0625

.positive_camera_y
#_02E565: LDA.w UnderworldExitData_scroll_mod_x,X
#_02E568: STA.w $0628
#_02E56B: STZ.w $0629

#_02E56E: ASL A
#_02E56F: BCC .positive_camera_x

#_02E571: DEC.w $0629

.positive_camera_x
#_02E574: REP #$20

#_02E576: LDA.w #$0000
#_02E579: SEC
#_02E57A: SBC.w $0624
#_02E57D: STA.w $0626

#_02E580: LDA.w #$0000
#_02E583: SEC
#_02E584: SBC.w $0628
#_02E587: STA.w $062A

;===================================================================================================

Overworld_LoadNewScreenProperties_pre:
#_02E58A: PLB

;===================================================================================================

Overworld_LoadNewScreenProperties:
#_02E58B: LDA.w #$FFF8
#_02E58E: STA.b $EC

#_02E590: SEP #$30

#_02E592: PHB
#_02E593: PHK
#_02E594: PLB

#_02E595: JSR Overworld_LoadGFXAndScreenSize

#_02E598: LDA.b #$E4
#_02E59A: STA.w $0716

#_02E59D: STZ.w $0713

#_02E5A0: LDA.b $8A
#_02E5A2: AND.b #$3F
#_02E5A4: ASL A
#_02E5A5: TAY

#_02E5A6: REP #$20

#_02E5A8: LDX.b #$00

#_02E5AA: LDA.w $0712
#_02E5AD: BEQ .smaller_screen

#_02E5AF: INX
#_02E5B0: INX

.smaller_screen
#_02E5B1: JSR Overworld_SetCameraBoundaries

#_02E5B4: SEP #$20

#_02E5B6: PLB

#_02E5B7: STZ.b $A9

#_02E5B9: LDA.b #$02
#_02E5BB: STA.b $AA
#_02E5BD: STA.b $A6
#_02E5BF: STA.b $A7

#_02E5C1: LDA.b #$80
#_02E5C3: STA.b $45
#_02E5C5: STA.b $44

#_02E5C7: LDA.b #$0F
#_02E5C9: STA.b $42
#_02E5CB: STA.b $43

#_02E5CD: LDA.b #$FF
#_02E5CF: STA.b $24
#_02E5D1: STA.b $29

#_02E5D3: RTS

;===================================================================================================

LoadCachedEntranceProperties:
#_02E5D4: REP #$20

#_02E5D6: LDA.l $7EC140
#_02E5DA: STA.w $040A

#_02E5DD: LDA.l $7EC142
#_02E5E1: STA.b $1C

#_02E5E3: LDA.l $7EC144
#_02E5E7: STA.b $E8
#_02E5E9: STA.w $0122
#_02E5EC: STA.b $E6
#_02E5EE: STA.w $0124

#_02E5F1: LDA.l $7EC146
#_02E5F5: STA.b $E2
#_02E5F7: STA.w $011E
#_02E5FA: STA.b $E0
#_02E5FC: STA.w $0120

#_02E5FF: LDA.l $7EC14A
#_02E603: STA.b $22

#_02E605: LDA.l $7EC148
#_02E609: STA.b $20

#_02E60B: LDA.b $A0
#_02E60D: CMP.w #$0124 ; ROOM 0124
#_02E610: BCS .normal_exit

#_02E612: LDA.b $20
#_02E614: SEC
#_02E615: SBC.w #$0010
#_02E618: STA.b $20

.normal_exit
#_02E61A: LDA.w #$0002
#_02E61D: STA.b $2F

#_02E61F: LDA.w $0696
#_02E622: CMP.w #$FFFF
#_02E625: BNE .face_down

#_02E627: LDA.b $20
#_02E629: CLC
#_02E62A: ADC.w #$0020
#_02E62D: STA.b $20

#_02E62F: STZ.b $2F

;---------------------------------------------------------------------------------------------------

.face_down
#_02E631: LDA.l $7EC14C
#_02E635: STA.b $8A

#_02E637: LDA.l $7EC14E
#_02E63B: STA.b $84

#_02E63D: SEC
#_02E63E: SBC.w #$0400
#_02E641: AND.w #$0F80
#_02E644: ASL A
#_02E645: XBA
#_02E646: STA.b $88

#_02E648: LDA.b $84
#_02E64A: SEC
#_02E64B: SBC.w #$0010
#_02E64E: AND.w #$003E
#_02E651: LSR A
#_02E652: STA.b $86

#_02E654: LDA.l $7EC150
#_02E658: STA.w $0618

#_02E65B: DEC A
#_02E65C: DEC A
#_02E65D: STA.w $061A

#_02E660: LDA.l $7EC152
#_02E664: STA.w $061C

#_02E667: DEC A
#_02E668: DEC A
#_02E669: STA.w $061E

#_02E66C: LDA.l $7EC154
#_02E670: STA.w $0600

#_02E673: LDA.l $7EC156
#_02E677: STA.w $0602

#_02E67A: LDA.l $7EC158
#_02E67E: STA.w $0604

#_02E681: LDA.l $7EC15A
#_02E685: STA.w $0606

#_02E688: LDA.l $7EC15C
#_02E68C: STA.w $0610

#_02E68F: LDA.l $7EC15E
#_02E693: STA.w $0612

#_02E696: LDA.l $7EC160
#_02E69A: STA.w $0614

#_02E69D: LDA.l $7EC162
#_02E6A1: STA.w $0616

#_02E6A4: LDA.l $7EC16A
#_02E6A8: STA.w $0624

#_02E6AB: LDA.l $7EC16C
#_02E6AF: STA.w $0626

#_02E6B2: LDA.l $7EC16E
#_02E6B6: STA.w $0628

#_02E6B9: LDA.l $7EC170
#_02E6BD: STA.w $062A

#_02E6C0: SEP #$20

#_02E6C2: LDA.l $7EC164
#_02E6C6: STA.w $0AA0

#_02E6C9: LDA.l $7EC165
#_02E6CD: STA.w $0AA1

#_02E6D0: LDA.l $7EC166
#_02E6D4: STA.w $0AA2

#_02E6D7: LDA.l $7EC167
#_02E6DB: STA.w $0AA3

#_02E6DE: REP #$20

#_02E6E0: RTS

;===================================================================================================

pool LoadSpecialOverworld

.camera600
#_02E6E1: dw $0000, $0000, $0000, $0000
#_02E6E9: dw $0000, $0000, $0000, $0000
#_02E6F1: dw $0200, $0200, $0000, $0000
#_02E6F9: dw $0000, $0000, $0000, $0000

.camera602
#_02E701: dw $0120, $0020, $0320, $0020
#_02E709: dw $0000, $0000, $0320, $0320
#_02E711: dw $0320, $0220, $0000, $0000
#_02E719: dw $0000, $0000, $0320, $0320

.camera604
#_02E721: dw $0000, $0100, $0200, $0600
#_02E729: dw $0600, $0A00, $0C00, $0C00
#_02E731: dw $0000, $0100, $0200, $0600
#_02E739: dw $0600, $0A00, $0C00, $0C00

.camera606
#_02E741: dw $0000, $0100, $0500, $0600
#_02E749: dw $0600, $0A00, $0C00, $0C00
#_02E751: dw $0000, $0100, $0400, $0600
#_02E759: dw $0600, $0A00, $0C00, $0C00

.camera610
#_02E761: dw $FF20, $FF20, $FF20, $FF20
#_02E769: dw $FF20, $FF20, $FF20, $FF20
#_02E771: dw $FF20, $FF20, $0120, $FF20
#_02E779: dw $FF20, $FF20, $FF20, $0120

.camera614
#_02E781: dw $FFFC, $0100, $0300, $0100
#_02E789: dw $0500, $0900, $0B00, $0B00
#_02E791: dw $FFFC, $0100, $0300, $0500
#_02E799: dw $0500, $0900, $0B00, $0B00

.camera612
#_02E7A1: dw $FF20, $FF20, $FF20, $FF20
#_02E7A9: dw $FF20, $FF20, $0400, $0400
#_02E7B1: dw $FF20, $FF20, $0120, $FF20
#_02E7B9: dw $FF20, $FF20, $0400, $0400

.camera616
#_02E7C1: dw $0004, $0104, $0300, $0100
#_02E7C9: dw $0500, $0900, $0B00, $0B00
#_02E7D1: dw $0004, $0104, $0300, $0100
#_02E7D9: dw $0500, $0900, $0B00, $0B00

.camera70C
#_02E7E1: dw $0000, $0000, $0200, $0600
#_02E7E9: dw $0600, $0A00, $0C00, $0C00
#_02E7F1: dw $0000, $0000, $0200, $0600
#_02E7F9: dw $0600, $0A00, $0C00, $0C00

;---------------------------------------------------------------------------------------------------

.direction
#_02E801: db $00, $04, $00, $00
#_02E805: db $00, $00, $00, $00
#_02E809: db $00, $00, $00, $00
#_02E80D: db $00, $00, $00, $00

.gfx_AA3
#_02E811: db $0C, $0C, $0E, $0E
#_02E815: db $0E, $10, $10, $10
#_02E819: db $0E, $0E, $0E, $0E
#_02E81D: db $10, $10, $10, $10

.gfx_AA2
#_02E821: db $2F, $2F, $2F, $2F
#_02E825: db $2F, $2F, $2F, $2F
#_02E829: db $2F, $2F, $2F, $2F
#_02E82D: db $2F, $2F, $2F, $2F

.palette_prop_a
#_02E831: db $0A, $0A, $0A, $0A
#_02E835: db $02, $02, $02, $0A
#_02E839: db $02, $02, $0A, $02
#_02E83D: db $02, $02, $02, $0A

.palette_prop_b
#_02E841: db $01, $08, $08, $08
#_02E845: db $00, $00, $00, $00
#_02E849: db $00, $00, $08, $00
#_02E84D: db $00, $00, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

LoadSpecialOverworld:
#_02E851: REP #$20

#_02E853: STZ.w $04AC

#_02E856: LDA.w $040A
#_02E859: STA.l $7EC100

#_02E85D: LDA.b $1C
#_02E85F: STA.l $7EC102

#_02E863: LDA.b $E8
#_02E865: STA.l $7EC104

#_02E869: LDA.b $E2
#_02E86B: STA.l $7EC106

#_02E86F: LDA.b $20
#_02E871: STA.l $7EC108

#_02E875: LDA.b $22
#_02E877: STA.l $7EC10A

#_02E87B: LDA.w $0618
#_02E87E: STA.l $7EC110

#_02E882: LDA.w $061C
#_02E885: STA.l $7EC112

#_02E889: LDA.b $8A
#_02E88B: STA.l $7EC10C

#_02E88F: LDA.b $84
#_02E891: STA.l $7EC10E

#_02E895: LDA.w $0600
#_02E898: STA.l $7EC114

#_02E89C: LDA.w $0602
#_02E89F: STA.l $7EC116

#_02E8A3: LDA.w $0604
#_02E8A6: STA.l $7EC118

#_02E8AA: LDA.w $0606
#_02E8AD: STA.l $7EC11A

#_02E8B1: LDA.w $0610
#_02E8B4: STA.l $7EC11C

#_02E8B8: LDA.w $0612
#_02E8BB: STA.l $7EC11E

#_02E8BF: LDA.w $0614
#_02E8C2: STA.l $7EC120

#_02E8C6: LDA.w $0616
#_02E8C9: STA.l $7EC122

#_02E8CD: LDA.w $0624
#_02E8D0: STA.l $7EC12A

#_02E8D4: LDA.w $0626
#_02E8D7: STA.l $7EC12C

#_02E8DB: LDA.w $0628
#_02E8DE: STA.l $7EC12E

#_02E8E2: LDA.w $062A
#_02E8E5: STA.l $7EC130

#_02E8E9: SEP #$20

#_02E8EB: LDA.w $0AA0
#_02E8EE: STA.l $7EC124

#_02E8F2: LDA.w $0AA1
#_02E8F5: STA.l $7EC125

#_02E8F9: LDA.w $0AA2
#_02E8FC: STA.l $7EC126

#_02E900: LDA.w $0AA3
#_02E903: STA.l $7EC127

;---------------------------------------------------------------------------------------------------

#_02E907: SEP #$20

#_02E909: JSR LoadOverworldFromUnderworld

#_02E90C: REP #$20

#_02E90E: LDA.b $A0
#_02E910: CMP.w #$1010
#_02E913: BNE .not_zora

#_02E915: LDA.w #$0182 ; OW 82
#_02E918: STA.b $A0

.not_zora
#_02E91A: SEP #$20

#_02E91C: PHB
#_02E91D: PHK
#_02E91E: PLB

#_02E91F: LDA.b $A0
#_02E921: PHA

#_02E922: SEC
#_02E923: SBC.b #$80
#_02E925: STA.b $A0

#_02E927: TAX

#_02E928: LDA.l .direction,X
#_02E92C: STA.b $2F

#_02E92E: STZ.w $0412

#_02E931: LDA.l .gfx_AA3,X
#_02E935: STA.w $0AA3

#_02E938: LDA.l .gfx_AA2,X
#_02E93C: STA.w $0AA2

#_02E93F: PHX

#_02E940: LDA.l .palette_prop_b,X
#_02E944: STA.b $00

#_02E946: LDA.l .palette_prop_a,X
#_02E94A: JSL OverworldPalettesLoader

#_02E94E: PLX

#_02E94F: REP #$30

#_02E951: LDA.w #$03F0
#_02E954: STA.b $00

#_02E956: LDA.b $A0
#_02E958: AND.w #$003F
#_02E95B: ASL A
#_02E95C: TAX

#_02E95D: LDA.l .camera600,X
#_02E961: STA.w $0708

#_02E964: LDA.l .camera70C,X
#_02E968: LSR A
#_02E969: LSR A
#_02E96A: LSR A
#_02E96B: STA.w $070C

#_02E96E: LDA.b $00
#_02E970: STA.w $070A

#_02E973: LDA.b $00
#_02E975: LSR A
#_02E976: LSR A
#_02E977: LSR A
#_02E978: STA.w $070E

;---------------------------------------------------------------------------------------------------

#_02E97B: LDA.b $A0
#_02E97D: ASL A
#_02E97E: TAY

#_02E97F: SEP #$10

#_02E981: LDA.w .camera600,Y
#_02E984: STA.w $0600

#_02E987: LDA.w .camera602,Y
#_02E98A: STA.w $0602

#_02E98D: LDA.w .camera604,Y
#_02E990: STA.w $0604

#_02E993: LDA.w .camera606,Y
#_02E996: STA.w $0606

#_02E999: LDA.w .camera610,Y
#_02E99C: STA.w $0610

#_02E99F: LDA.w .camera612,Y
#_02E9A2: STA.w $0612

#_02E9A5: LDA.w .camera614,Y
#_02E9A8: STA.w $0614

#_02E9AB: LDA.w .camera616,Y
#_02E9AE: STA.w $0616

;---------------------------------------------------------------------------------------------------

#_02E9B1: SEP #$20

#_02E9B3: PLA
#_02E9B4: STA.b $A0

#_02E9B6: PLB

#_02E9B7: JSL Overworld_SetScreenBGColorCacheOnly

#_02E9BB: RTS

;===================================================================================================

LoadOverworldFromSpecialOverworld:
#_02E9BC: REP #$20

#_02E9BE: STZ.w $04AC

#_02E9C1: LDA.l $7EC100
#_02E9C5: STA.w $040A

#_02E9C8: LDA.l $7EC102
#_02E9CC: STA.b $1C

#_02E9CE: LDA.l $7EC104
#_02E9D2: STA.b $E8
#_02E9D4: STA.w $0122
#_02E9D7: STA.b $E6
#_02E9D9: STA.w $0124

#_02E9DC: LDA.l $7EC106
#_02E9E0: STA.b $E2
#_02E9E2: STA.w $011E
#_02E9E5: STA.b $E0
#_02E9E7: STA.w $0120

#_02E9EA: LDA.l $7EC108
#_02E9EE: STA.b $20

#_02E9F0: LDA.l $7EC10A
#_02E9F4: STA.b $22

#_02E9F6: LDA.l $7EC10C
#_02E9FA: STA.b $8A

#_02E9FC: LDA.l $7EC10E
#_02EA00: STA.b $84

#_02EA02: SEC
#_02EA03: SBC.w #$0400
#_02EA06: AND.w #$0F80
#_02EA09: ASL A
#_02EA0A: XBA
#_02EA0B: STA.b $88

#_02EA0D: LDA.b $84
#_02EA0F: SEC
#_02EA10: SBC.w #$0010
#_02EA13: AND.w #$003E
#_02EA16: LSR A
#_02EA17: STA.b $86

;---------------------------------------------------------------------------------------------------

#_02EA19: LDA.l $7EC110
#_02EA1D: STA.w $0618

#_02EA20: DEC A
#_02EA21: DEC A
#_02EA22: STA.w $061A

#_02EA25: LDA.l $7EC112
#_02EA29: STA.w $061C

#_02EA2C: DEC A
#_02EA2D: DEC A
#_02EA2E: STA.w $061E

#_02EA31: LDA.l $7EC114
#_02EA35: STA.w $0600

#_02EA38: LDA.l $7EC116
#_02EA3C: STA.w $0602

#_02EA3F: LDA.l $7EC118
#_02EA43: STA.w $0604

#_02EA46: LDA.l $7EC11A
#_02EA4A: STA.w $0606

#_02EA4D: LDA.l $7EC11C
#_02EA51: STA.w $0610

#_02EA54: LDA.l $7EC11E
#_02EA58: STA.w $0612

#_02EA5B: LDA.l $7EC120
#_02EA5F: STA.w $0614

#_02EA62: LDA.l $7EC122
#_02EA66: STA.w $0616

#_02EA69: LDA.l $7EC12A
#_02EA6D: STA.w $0624

#_02EA70: LDA.l $7EC12C
#_02EA74: STA.w $0626

#_02EA77: LDA.l $7EC12E
#_02EA7B: STA.w $0628

#_02EA7E: LDA.l $7EC130
#_02EA82: STA.w $062A

;---------------------------------------------------------------------------------------------------

#_02EA85: SEP #$20

#_02EA87: LDA.l $7EC124
#_02EA8B: STA.w $0AA0

#_02EA8E: LDA.l $7EC125
#_02EA92: STA.w $0AA1

#_02EA95: LDA.l $7EC126
#_02EA99: STA.w $0AA2

#_02EA9C: LDA.l $7EC127
#_02EAA0: STA.w $0AA3

#_02EAA3: LDX.b $8A

#_02EAA5: LDA.l $7EFD40,X
#_02EAA9: STA.b $00

#_02EAAB: LDA.l OverworldPalettesScreenToSet,X
#_02EAAF: JSL OverworldPalettesLoader
#_02EAB3: JSL Overworld_SetScreenBGColorCacheOnly

;---------------------------------------------------------------------------------------------------

#_02EAB7: STZ.b $A9

#_02EAB9: LDA.b #$02
#_02EABB: STA.b $AA
#_02EABD: STA.b $A6
#_02EABF: STA.b $A7

#_02EAC1: LDA.b #$80
#_02EAC3: STA.b $45
#_02EAC5: STA.b $44

#_02EAC7: LDA.b #$0F
#_02EAC9: STA.b $42
#_02EACB: STA.b $43

#_02EACD: LDA.b #$FF
#_02EACF: STA.b $24
#_02EAD1: STA.b $29

#_02EAD3: SEP #$30

#_02EAD5: JSL Link_ResetSwimmingState
#_02EAD9: JSR Overworld_LoadGFXAndScreenSize

#_02EADC: LDA.b #$E4
#_02EADE: STA.w $0716

#_02EAE1: STZ.w $0713

#_02EAE4: RTS

;===================================================================================================

pool LoadTransport

.screen_id
#_02EAE5: dw $0003 ; OW 03 - Flute 1
#_02EAE7: dw $0016 ; OW 16 - Flute 2
#_02EAE9: dw $0018 ; OW 18 - Flute 3
#_02EAEB: dw $002C ; OW 2C - Flute 4
#_02EAED: dw $002F ; OW 2F - Flute 5
#_02EAEF: dw $0030 ; OW 30 - Flute 6
#_02EAF1: dw $003B ; OW 3B - Flute 7
#_02EAF3: dw $003F ; OW 3F - Flute 8
#_02EAF5: dw $005B ; OW 5B - Pyramid
#_02EAF7: dw $0035 ; OW 35 - Lake Hylia whirlpool
#_02EAF9: dw $000F ; OW 0F - Waterfall of Wishing whirlpool
#_02EAFB: dw $0015 ; OW 15 - Witch whirlpool
#_02EAFD: dw $0033 ; OW 33 - South of Link's house whirlpool
#_02EAFF: dw $0012 ; OW 12 - Death Mountain whirlpool
#_02EB01: dw $003F ; OW 3F - Lake Hylia falls whirlpool
#_02EB03: dw $0055 ; OW 55 - Dark witch whirlpool
#_02EB05: dw $007F ; OW 7F - Dark Lake Hylia falls whirlpool

.map16_index
#_02EB07: dw $1600 ; Flute 1
#_02EB09: dw $0888 ; Flute 2
#_02EB0B: dw $0B30 ; Flute 3
#_02EB0D: dw $0588 ; Flute 4
#_02EB0F: dw $0798 ; Flute 5
#_02EB11: dw $1880 ; Flute 6
#_02EB13: dw $069E ; Flute 7
#_02EB15: dw $0810 ; Flute 8
#_02EB17: dw $002E ; Pyramid
#_02EB19: dw $1242 ; Lake Hylia whirlpool
#_02EB1B: dw $0680 ; Waterfall of Wishing whirlpool
#_02EB1D: dw $0112 ; Witch whirlpool
#_02EB1F: dw $059E ; South of Link's house whirlpool
#_02EB21: dw $048E ; Death Mountain whirlpool
#_02EB23: dw $0280 ; Lake Hylia falls whirlpool
#_02EB25: dw $0112 ; Dark witch whirlpool
#_02EB27: dw $0280 ; Dark Lake Hylia falls whirlpool

.vertical_scroll
#_02EB29: dw $02CA ; Flute 1
#_02EB2B: dw $0516 ; Flute 2
#_02EB2D: dw $0759 ; Flute 3
#_02EB2F: dw $0AB9 ; Flute 4
#_02EB31: dw $0AFA ; Flute 5
#_02EB33: dw $0F1E ; Flute 6
#_02EB35: dw $0EDF ; Flute 7
#_02EB37: dw $0F05 ; Flute 8
#_02EB39: dw $0600 ; Pyramid
#_02EB3B: dw $0E46 ; Lake Hylia whirlpool
#_02EB3D: dw $02C6 ; Waterfall of Wishing whirlpool
#_02EB3F: dw $042A ; Witch whirlpool
#_02EB41: dw $0CBA ; South of Link's house whirlpool
#_02EB43: dw $049A ; Death Mountain whirlpool
#_02EB45: dw $0E56 ; Lake Hylia falls whirlpool
#_02EB47: dw $042A ; Dark witch whirlpool
#_02EB49: dw $0E56 ; Dark Lake Hylia falls whirlpool

.horizontal_scroll
#_02EB4B: dw $060E ; Flute 1
#_02EB4D: dw $0C4E ; Flute 2
#_02EB4F: dw $017E ; Flute 3
#_02EB51: dw $0840 ; Flute 4
#_02EB53: dw $0EB2 ; Flute 5
#_02EB55: dw $0000 ; Flute 6
#_02EB57: dw $06F2 ; Flute 7
#_02EB59: dw $0E75 ; Flute 8
#_02EB5B: dw $0778 ; Pyramid
#_02EB5D: dw $0C0A ; Lake Hylia whirlpool
#_02EB5F: dw $0E06 ; Waterfall of Wishing whirlpool
#_02EB61: dw $0A8A ; Witch whirlpool
#_02EB63: dw $06EA ; South of Link's house whirlpool
#_02EB65: dw $0462 ; Death Mountain whirlpool
#_02EB67: dw $0E00 ; Lake Hylia falls whirlpool
#_02EB69: dw $0A8A ; Dark witch whirlpool
#_02EB6B: dw $0E00 ; Dark Lake Hylia falls whirlpool

.link_pos_y
#_02EB6D: dw $0328 ; Flute 1
#_02EB6F: dw $0578 ; Flute 2
#_02EB71: dw $07B7 ; Flute 3
#_02EB73: dw $0B17 ; Flute 4
#_02EB75: dw $0B58 ; Flute 5
#_02EB77: dw $0FA8 ; Flute 6
#_02EB79: dw $0F3D ; Flute 7
#_02EB7B: dw $0F67 ; Flute 8
#_02EB7D: dw $065C ; Pyramid
#_02EB7F: dw $0EA8 ; Lake Hylia whirlpool
#_02EB81: dw $0328 ; Waterfall of Wishing whirlpool
#_02EB83: dw $0488 ; Witch whirlpool
#_02EB85: dw $0D18 ; South of Link's house whirlpool
#_02EB87: dw $04F8 ; Death Mountain whirlpool
#_02EB89: dw $0EB8 ; Lake Hylia falls whirlpool
#_02EB8B: dw $0488 ; Dark witch whirlpool
#_02EB8D: dw $0EB8 ; Dark Lake Hylia falls whirlpool

.link_pos_x
#_02EB8F: dw $0678 ; Flute 1
#_02EB91: dw $0CC8 ; Flute 2
#_02EB93: dw $0200 ; Flute 3
#_02EB95: dw $08B8 ; Flute 4
#_02EB97: dw $0F30 ; Flute 5
#_02EB99: dw $0078 ; Flute 6
#_02EB9B: dw $0778 ; Flute 7
#_02EB9D: dw $0EF3 ; Flute 8
#_02EB9F: dw $07F0 ; Pyramid
#_02EBA1: dw $0C90 ; Lake Hylia whirlpool
#_02EBA3: dw $0E80 ; Waterfall of Wishing whirlpool
#_02EBA5: dw $0B10 ; Witch whirlpool
#_02EBA7: dw $0770 ; South of Link's house whirlpool
#_02EBA9: dw $04E8 ; Death Mountain whirlpool
#_02EBAB: dw $0E68 ; Lake Hylia falls whirlpool
#_02EBAD: dw $0B10 ; Dark witch whirlpool
#_02EBAF: dw $0E68 ; Dark Lake Hylia falls whirlpool

.camera_trigger_y
#_02EBB1: dw $0337 ; Flute 1
#_02EBB3: dw $0583 ; Flute 2
#_02EBB5: dw $07C6 ; Flute 3
#_02EBB7: dw $0B26 ; Flute 4
#_02EBB9: dw $0B67 ; Flute 5
#_02EBBB: dw $0F8D ; Flute 6
#_02EBBD: dw $0F4C ; Flute 7
#_02EBBF: dw $0F72 ; Flute 8
#_02EBC1: dw $066D ; Pyramid
#_02EBC3: dw $0EB3 ; Lake Hylia whirlpool
#_02EBC5: dw $0333 ; Waterfall of Wishing whirlpool
#_02EBC7: dw $0497 ; Witch whirlpool
#_02EBC9: dw $0D27 ; South of Link's house whirlpool
#_02EBCB: dw $0507 ; Death Mountain whirlpool
#_02EBCD: dw $0EC3 ; Lake Hylia falls whirlpool
#_02EBCF: dw $0497 ; Dark witch whirlpool
#_02EBD1: dw $0EC3 ; Dark Lake Hylia falls whirlpool

.camera_trigger_x
#_02EBD3: dw $0683 ; Flute 1
#_02EBD5: dw $0CD3 ; Flute 2
#_02EBD7: dw $020B ; Flute 3
#_02EBD9: dw $08BF ; Flute 4
#_02EBDB: dw $0F37 ; Flute 5
#_02EBDD: dw $008D ; Flute 6
#_02EBDF: dw $077F ; Flute 7
#_02EBE1: dw $0EFA ; Flute 8
#_02EBE3: dw $07F7 ; Pyramid
#_02EBE5: dw $0C97 ; Lake Hylia whirlpool
#_02EBE7: dw $0E8B ; Waterfall of Wishing whirlpool
#_02EBE9: dw $0B17 ; Witch whirlpool
#_02EBEB: dw $0777 ; South of Link's house whirlpool
#_02EBED: dw $04EF ; Death Mountain whirlpool
#_02EBEF: dw $0E85 ; Lake Hylia falls whirlpool
#_02EBF1: dw $0B17 ; Dark witch whirlpool
#_02EBF3: dw $0E85 ; Dark Lake Hylia falls whirlpool

.scroll_mod_y
#_02EBF5: dw $FFF6 ; Flute 1
#_02EBF7: dw $FFFA ; Flute 2
#_02EBF9: dw $0007 ; Flute 3
#_02EBFB: dw $FFF7 ; Flute 4
#_02EBFD: dw $FFF6 ; Flute 5
#_02EBFF: dw $0000 ; Flute 6
#_02EC01: dw $FFF1 ; Flute 7
#_02EC03: dw $FFFB ; Flute 8
#_02EC05: dw $0000 ; Pyramid
#_02EC07: dw $FFFA ; Lake Hylia whirlpool
#_02EC09: dw $000A ; Waterfall of Wishing whirlpool
#_02EC0B: dw $FFF6 ; Witch whirlpool
#_02EC0D: dw $FFF6 ; South of Link's house whirlpool
#_02EC0F: dw $FFF6 ; Death Mountain whirlpool
#_02EC11: dw $FFFA ; Lake Hylia falls whirlpool
#_02EC13: dw $FFF6 ; Dark witch whirlpool
#_02EC15: dw $FFFA ; Dark Lake Hylia falls whirlpool

.scroll_mod_x
#_02EC17: dw $FFF2 ; Flute 1
#_02EC19: dw $FFF2 ; Flute 2
#_02EC1B: dw $0002 ; Flute 3
#_02EC1D: dw $0000 ; Flute 4
#_02EC1F: dw $000E ; Flute 5
#_02EC21: dw $0000 ; Flute 6
#_02EC23: dw $FFFE ; Flute 7
#_02EC25: dw $000B ; Flute 8
#_02EC27: dw $FFF8 ; Pyramid
#_02EC29: dw $0006 ; Lake Hylia whirlpool
#_02EC2B: dw $FFFA ; Waterfall of Wishing whirlpool
#_02EC2D: dw $FFFA ; Witch whirlpool
#_02EC2F: dw $0006 ; South of Link's house whirlpool
#_02EC31: dw $000E ; Death Mountain whirlpool
#_02EC33: dw $0000 ; Lake Hylia falls whirlpool
#_02EC35: dw $FFFA ; Dark witch whirlpool
#_02EC37: dw $0000 ; Dark Lake Hylia falls whirlpool

pool off

;---------------------------------------------------------------------------------------------------

FluteMenu_LoadTransport:
#_02EC39: PHB
#_02EC3A: PHK
#_02EC3B: PLB

#_02EC3C: REP #$20

#_02EC3E: STZ.w $04AC

#_02EC41: ASL.w $1AF0
#_02EC44: LDX.w $1AF0

;===================================================================================================

LoadTransport:
#_02EC47: LDA.w .vertical_scroll,X
#_02EC4A: STA.b $E6
#_02EC4C: STA.b $E8
#_02EC4E: STA.w $0122
#_02EC51: STA.w $0124

#_02EC54: LDA.w .horizontal_scroll,X
#_02EC57: STA.b $E0
#_02EC59: STA.b $E2
#_02EC5B: STA.w $011E
#_02EC5E: STA.w $0120

#_02EC61: LDA.w .link_pos_y,X
#_02EC64: STA.b $20

#_02EC66: LDA.w .link_pos_x,X
#_02EC69: STA.b $22

#_02EC6B: LDA.w .scroll_mod_y,X
#_02EC6E: STA.w $0624

#_02EC71: LDA.w #$0000
#_02EC74: SEC
#_02EC75: SBC.w $0624
#_02EC78: STA.w $0626

#_02EC7B: LDA.w .scroll_mod_x,X
#_02EC7E: STA.w $0628

#_02EC81: LDA.w #$0000
#_02EC84: SEC
#_02EC85: SBC.w $0628
#_02EC88: STA.w $062A

#_02EC8B: LDA.w .screen_id,X
#_02EC8E: STA.b $8A
#_02EC90: STA.w $040A

#_02EC93: LDA.w .map16_index,X
#_02EC96: STA.b $84

#_02EC98: SEC
#_02EC99: SBC.w #$0400
#_02EC9C: AND.w #$0F80
#_02EC9F: ASL A
#_02ECA0: XBA
#_02ECA1: STA.b $88

#_02ECA3: LDA.b $84
#_02ECA5: SEC
#_02ECA6: SBC.w #$0010
#_02ECA9: AND.w #$003E
#_02ECAC: LSR A
#_02ECAD: STA.b $86

#_02ECAF: LDA.w .camera_trigger_y,X
#_02ECB2: STA.w $0618

#_02ECB5: DEC A
#_02ECB6: DEC A
#_02ECB7: STA.w $061A

#_02ECBA: LDA.w .camera_trigger_x,X
#_02ECBD: STA.w $061C

#_02ECC0: DEC A
#_02ECC1: DEC A
#_02ECC2: STA.w $061E

;---------------------------------------------------------------------------------------------------

#_02ECC5: STZ.w $0696
#_02ECC8: STZ.w $0698

#_02ECCB: PLB

#_02ECCC: JSR Overworld_LoadNewScreenProperties

#_02ECCF: JSL Sprite_ResetAll
#_02ECD3: JSL Sprite_ReloadAll_Overworld

#_02ECD7: STZ.b $6C

#_02ECD9: JSR DeleteCertainAncillaeStopDashing

#_02ECDC: RTL

;===================================================================================================

FluteMenu_LoadSelectedScreenPalettes:
#_02ECDD: JSR OverworldLoadScreensPaletteSet

#_02ECE0: LDX.b $8A

#_02ECE2: LDA.l $7EFD40,X
#_02ECE6: STA.b $00

#_02ECE8: LDA.l OverworldPalettesScreenToSet,X

#_02ECEC: JSL OverworldPalettesLoader
#_02ECF0: JSL Overworld_SetScreenBGColor
#_02ECF4: JSR Overworld_CopyPalettesToCache_WithPrep

#_02ECF7: RTL

;===================================================================================================

pool FindPartnerWhirlpoolExit

.my_screen_id
#_02ECF8: dw $000F ; OW 0F - Lake Hylia whirlpool
#_02ECFA: dw $0035 ; OW 35 - Waterfall of Wishing whirlpool
#_02ECFC: dw $0033 ; OW 33 - Witch whirlpool
#_02ECFE: dw $0015 ; OW 15 - South of Link's house whirlpool
#_02ED00: dw $003F ; OW 3F - Death Mountain whirlpool
#_02ED02: dw $0012 ; OW 12 - Lake Hylia falls whirlpool
#_02ED04: dw $007F ; OW 7F - Dark witch whirlpool
#_02ED06: dw $0055 ; OW 55 - Dark Lake Hylia falls whirlpool

pool off

;---------------------------------------------------------------------------------------------------

FindPartnerWhirlpoolExit:
#_02ED08: PHB
#_02ED09: PHK
#_02ED0A: PLB

#_02ED0B: REP #$20

#_02ED0D: LDX.b #$10

#_02ED0F: LDA.b $8A

.next_screen
#_02ED11: DEX
#_02ED12: DEX

#_02ED13: CMP.l .my_screen_id,X
#_02ED17: BNE .next_screen

;---------------------------------------------------------------------------------------------------

#_02ED19: TXA
#_02ED1A: CLC
#_02ED1B: ADC.w #$0012
#_02ED1E: TAX

#_02ED1F: STZ.w $04AC

#_02ED22: JMP.w LoadTransport

;===================================================================================================

Module09_21:
#_02ED25: REP #$20

#_02ED27: LDA.b $84
#_02ED29: PHA

#_02ED2A: LDA.b $86
#_02ED2C: PHA

#_02ED2D: LDA.b $88
#_02ED2F: PHA

#_02ED30: LDX.b $8A

#_02ED32: LDA.l OverworldScreenSize,X
#_02ED36: AND.w #$00FF
#_02ED39: BEQ OverworldBuildMapAndTrigger

#_02ED3B: LDA.w #$0390
#_02ED3E: STA.b $84

#_02ED40: SEC
#_02ED41: SBC.w #$0400
#_02ED44: AND.w #$0F80
#_02ED47: ASL A
#_02ED48: XBA
#_02ED49: STA.b $88

#_02ED4B: LDA.b $84
#_02ED4D: SEC
#_02ED4E: SBC.w #$0010
#_02ED51: AND.w #$003E
#_02ED54: LSR A
#_02ED55: STA.b $86

#_02ED57: BRA OverworldBuildMapAndTrigger

;===================================================================================================

Overworld_LoadAndBuildScreen:
#_02ED59: REP #$20

#_02ED5B: LDA.b $84
#_02ED5D: PHA

#_02ED5E: LDA.b $86
#_02ED60: PHA

#_02ED61: LDA.b $88
#_02ED63: PHA

#_02ED64: LDX.b $8A

#_02ED66: LDA.l OverworldScreenSize,X
#_02ED6A: AND.w #$00FF
#_02ED6D: BEQ .big_screen

#_02ED6F: LDA.w #$0390
#_02ED72: STA.b $84

#_02ED74: SEC
#_02ED75: SBC.w #$0400
#_02ED78: AND.w #$0F80
#_02ED7B: ASL A
#_02ED7C: XBA
#_02ED7D: STA.b $88

#_02ED7F: LDA.b $84
#_02ED81: SEC
#_02ED82: SBC.w #$0010
#_02ED85: AND.w #$003E
#_02ED88: LSR A
#_02ED89: STA.b $86

.big_screen
#_02ED8B: SEP #$20

#_02ED8D: JSR Overworld_DrawQuadrantsAndOverlays

;===================================================================================================

OverworldBuildMapAndTrigger:
#_02ED90: REP #$20

#_02ED92: LDA.w #$FFFF
#_02ED95: STA.b $C8

#_02ED97: STZ.b $CA
#_02ED99: STZ.b $CC

#_02ED9B: SEP #$20

#_02ED9D: JSR BuildOverworldMapFromMap16

#_02EDA0: REP #$20

#_02EDA2: PLA
#_02EDA3: STA.b $88

#_02EDA5: PLA
#_02EDA6: STA.b $86

#_02EDA8: PLA
#_02EDA9: STA.b $84

#_02EDAB: SEP #$20

#_02EDAD: LDA.b #$04
#_02EDAF: STA.b $17
#_02EDB1: STA.w $0710

#_02EDB4: INC.b $11

#_02EDB6: STZ.b $13

#_02EDB8: RTS

;===================================================================================================

Module08_02_LoadAndAdvance:
#_02EDB9: JSR Overworld_LoadAndBuildScreen

#_02EDBC: LDA.b #$10
#_02EDBE: STA.b $10

#_02EDC0: STZ.b $B0
#_02EDC2: STZ.b $11

#_02EDC4: RTS

;===================================================================================================

pool Overworld_HandleOverlaysAndBombDoors

.bombable_door_location
#_02EDC5: dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
#_02EDD5: dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
#_02EDE5: dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
#_02EDF5: dw $1C0C, $1C0C, $0000, $0000, $0000, $0000, $0000, $0000
#_02EE05: dw $1C0C, $1C0C, $0000, $0000, $0000, $0000, $0000, $0000
#_02EE15: dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
#_02EE25: dw $0000, $0000, $0000, $0000, $03B0, $180C, $180C, $0288
#_02EE35: dw $0000, $0000, $0000, $0000, $0000, $180C, $180C, $0000

#_02EE45: dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
#_02EE55: dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
#_02EE65: dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
#_02EE75: dw $1AB6, $1AB6, $0000, $0E2E, $0E2E, $0000, $0000, $0000
#_02EE85: dw $1AB6, $1AB6, $0000, $0E2E, $0E2E, $0000, $0000, $0000
#_02EE95: dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
#_02EEA5: dw $0000, $0000, $0000, $0000, $03B0, $0000, $0000, $0288
#_02EEB5: dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000

pool off

;===================================================================================================

Overworld_DrawQuadrantsAndOverlays:
#_02EEC5: REP #$30

#_02EEC7: JSR Overworld_DecompressAndDrawAllQuadrants

;---------------------------------------------------------------------------------------------------

#_02EECA: LDX.w #$001E
#_02EECD: LDA.w #$0DC4

.next
#_02EED0: STA.l $7E4000,X
#_02EED4: STA.l $7E4020,X
#_02EED8: STA.l $7E4020,X
#_02EEDC: STA.l $7E4040,X
#_02EEE0: STA.l $7E4060,X

#_02EEE4: DEX
#_02EEE5: DEX
#_02EEE6: BPL .next

;---------------------------------------------------------------------------------------------------

#_02EEE8: LDX.w $0696
#_02EEEB: BEQ Overworld_HandleOverlaysAndBombDoors

#_02EEED: CPX.w #$FFFF
#_02EEF0: BEQ Overworld_HandleOverlaysAndBombDoors

#_02EEF2: CPX.w #$8000
#_02EEF5: BCS .do_two

#_02EEF7: LDA.w #$0DA4
#_02EEFA: STA.l $7E2000,X

#_02EEFE: JSL Overworld_MemorizeMap16Change

#_02EF02: LDA.w #$0DA6
#_02EF05: BRA .just_one

.do_two
#_02EF07: TXA
#_02EF08: AND.w #$1FFF
#_02EF0B: TAX

#_02EF0C: LDA.w #$0DB4
#_02EF0F: JSL Overworld_MemorizeMap16Change
#_02EF13: STA.l $7E2000,X

#_02EF17: LDA.w #$0DB5

.just_one
#_02EF1A: STA.l $7E2002,X

#_02EF1E: INX
#_02EF1F: INX

#_02EF20: JSL Overworld_MemorizeMap16Change

#_02EF24: DEX
#_02EF25: DEX

#_02EF26: STZ.w $0696

;===================================================================================================

Overworld_HandleOverlaysAndBombDoors:
#_02EF29: LDA.w #$020F

#_02EF2C: LDX.b $8A
#_02EF2E: CPX.w #$0033 ; OW 33
#_02EF31: BNE .not_swamp_portal

#_02EF33: STA.l $7E22A8

.not_swamp_portal
#_02EF37: CPX.w #$002F ; OW 2F
#_02EF3A: BNE .not_pod_portal

#_02EF3C: STA.l $7E2BB2

;---------------------------------------------------------------------------------------------------

.not_pod_portal
#_02EF40: SEP #$30

#_02EF42: LDX.b $8A
#_02EF44: CPX.b #$80 ; SPOW
#_02EF46: BCS .no_overlay

#_02EF48: LDA.l $7EF280,X
#_02EF4C: AND.b #$20
#_02EF4E: BEQ .no_overlay

#_02EF50: JSL ApplyOverworldOverlay

.no_overlay
#_02EF54: LDX.b $8A

#_02EF56: LDA.l $7EF280,X
#_02EF5A: AND.b #$02
#_02EF5C: BEQ .exit

#_02EF5E: REP #$30

#_02EF60: LDA.b $8A
#_02EF62: ASL A
#_02EF63: TAX

#_02EF64: LDA.l .bombable_door_location,X
#_02EF68: TAX

#_02EF69: LDA.w #$0DB4
#_02EF6C: STA.l $7E2000,X

#_02EF70: LDA.w #$0DB5
#_02EF73: STA.l $7E2002,X

#_02EF77: SEP #$30

.exit
#_02EF79: RTS

;===================================================================================================

TriggerAndFinishMapLoadStripe_Vertical:
#_02EF7A: SEP #$30

#_02EF7C: LDA.b #$08
#_02EF7E: STA.w $0416

#_02EF81: LDA.b #$03
#_02EF83: STA.b $17

#_02EF85: REP #$30

#_02EF87: LDY.b $0E

#_02EF89: LDA.w #$0080
#_02EF8C: STA.w $1100,Y

#_02EF8F: INY
#_02EF90: INY
#_02EF91: STY.b $0E

;---------------------------------------------------------------------------------------------------

.next
#_02EF93: JSR BufferAndBuildMap16Stripes_Vertical

#_02EF96: LDA.b $84
#_02EF98: SEC
#_02EF99: SBC.w #$0080
#_02EF9C: STA.b $84

#_02EF9E: LDA.b $88
#_02EFA0: DEC A
#_02EFA1: AND.w #$001F
#_02EFA4: STA.b $88

#_02EFA6: DEC.b $08
#_02EFA8: BNE .next

;---------------------------------------------------------------------------------------------------

#_02EFAA: LDA.w #$FFFF
#_02EFAD: LDX.b $0E
#_02EFAF: STA.w $1100,X

#_02EFB2: RTS

;===================================================================================================

TriggerAndFinishMapLoadStripe_Horizontal:
#_02EFB3: SEP #$30

#_02EFB5: LDA.b #$02
#_02EFB7: STA.w $0416

#_02EFBA: LDA.b #$03
#_02EFBC: STA.b $17

#_02EFBE: REP #$30

#_02EFC0: LDY.b $0E

#_02EFC2: LDA.w #$8040
#_02EFC5: STA.w $1100,Y

#_02EFC8: INY
#_02EFC9: INY
#_02EFCA: STY.b $0E

;---------------------------------------------------------------------------------------------------

.next
#_02EFCC: JSR BufferAndBuildMap16Stripes_Horizontal

#_02EFCF: DEC.b $84
#_02EFD1: DEC.b $84

#_02EFD3: LDA.b $86
#_02EFD5: DEC A
#_02EFD6: AND.w #$001F
#_02EFD9: STA.b $86

#_02EFDB: DEC.b $08
#_02EFDD: BNE .next

;---------------------------------------------------------------------------------------------------

#_02EFDF: LDA.w #$FFFF
#_02EFE2: LDX.b $0E
#_02EFE4: STA.w $1100,X

#_02EFE7: RTS

;===================================================================================================

SomeTilemapChange:
#_02EFE8: REP #$30

#_02EFEA: JSR Overworld_DecompressAndDrawAllQuadrants

#_02EFED: LDX.w #$001E
#_02EFF0: LDA.w #$0DC4

.next
#_02EFF3: STA.l $7E4000,X
#_02EFF7: STA.l $7E4020,X
#_02EFFB: STA.l $7E4040,X
#_02EFFF: STA.l $7E4060,X

#_02F003: DEX
#_02F004: DEX
#_02F005: BPL .next

#_02F007: JSR Overworld_HandleOverlaysAndBombDoors

#_02F00A: INC.b $11

#_02F00C: RTS

;===================================================================================================

pool CreateInitialNewScreenMapToScroll

.vectors_big_screen
#_02F00D: dw Overworld_ResetSubmodule
#_02F00F: dw CreateInitialOWScreenView_Big_East
#_02F011: dw CreateInitialOWScreenView_Big_West
#_02F013: dw Overworld_ResetSubmodule
#_02F015: dw CreateInitialOWScreenView_Big_South
#_02F017: dw Overworld_ResetSubmodule
#_02F019: dw Overworld_ResetSubmodule
#_02F01B: dw Overworld_ResetSubmodule
#_02F01D: dw CreateInitialOWScreenView_Big_North

.vectors_small_screen
#_02F01F: dw Overworld_ResetSubmodule
#_02F021: dw CreateInitialOWScreenView_Small_East
#_02F023: dw CreateInitialOWScreenView_Small_West
#_02F025: dw Overworld_ResetSubmodule
#_02F027: dw CreateInitialOWScreenView_Small_South
#_02F029: dw Overworld_ResetSubmodule
#_02F02B: dw Overworld_ResetSubmodule
#_02F02D: dw Overworld_ResetSubmodule
#_02F02F: dw CreateInitialOWScreenView_Small_North

pool off

;---------------------------------------------------------------------------------------------------

CreateInitialNewScreenMapToScroll:
#_02F031: SEP #$30

#_02F033: LDX.b $8A

#_02F035: LDA.l OverworldScreenSize,X
#_02F039: BNE .small_screen

#_02F03B: LDA.w $0416
#_02F03E: ASL A
#_02F03F: TAX

#_02F040: JMP.w (.vectors_big_screen,X)

;---------------------------------------------------------------------------------------------------

.small_screen
#_02F043: LDA.w $0416
#_02F046: ASL A
#_02F047: TAX

#_02F048: JMP.w (.vectors_small_screen,X)

;===================================================================================================

UNREACHABLE_02F04B:
#_02F04B: LDA.b $84
#_02F04D: SEC
#_02F04E: SBC.w #$0400
#_02F051: AND.w #$0F80
#_02F054: ASL A
#_02F055: XBA
#_02F056: AND.w #$001F
#_02F059: STA.b $88

#_02F05B: LDA.b $84
#_02F05D: SEC
#_02F05E: SBC.w #$0010
#_02F061: AND.w #$003E
#_02F064: LSR A
#_02F065: AND.w #$001F
#_02F068: STA.b $86

#_02F06A: RTS

;===================================================================================================

CreateInitialOWScreenView_Big_North:
#_02F06B: REP #$30

#_02F06D: LDA.b $84
#_02F06F: CLC
#_02F070: ADC.w #$0380
#_02F073: STA.b $84

#_02F075: LDA.w #$001F
#_02F078: STA.b $88

#_02F07A: STZ.b $0E

#_02F07C: LDA.w #$0007
#_02F07F: STA.b $08

#_02F081: JSR TriggerAndFinishMapLoadStripe_Vertical

#_02F084: SEP #$30

#_02F086: RTS

;===================================================================================================

CreateInitialOWScreenView_Big_South:
#_02F087: REP #$30

#_02F089: LDA.b $84

.adjust_more
#_02F08B: CMP.w #$0080
#_02F08E: BCC .in_range

#_02F090: SBC.w #$0080
#_02F093: BRA .adjust_more

;---------------------------------------------------------------------------------------------------

.in_range
#_02F095: CLC
#_02F096: ADC.w #$0780
#_02F099: STA.b $84

#_02F09B: STZ.b $0E

#_02F09D: LDA.w #$0007
#_02F0A0: STA.b $88

#_02F0A2: LDA.w #$0008
#_02F0A5: STA.b $08

#_02F0A7: JSR TriggerAndFinishMapLoadStripe_Vertical

#_02F0AA: LDA.b $88
#_02F0AC: CLC
#_02F0AD: ADC.w #$0009
#_02F0B0: AND.w #$001F
#_02F0B3: STA.b $88

#_02F0B5: LDA.b $84
#_02F0B7: SEC
#_02F0B8: SBC.w #$0B80
#_02F0BB: STA.b $84

#_02F0BD: SEP #$30

#_02F0BF: RTS

;===================================================================================================

CreateInitialOWScreenView_Big_West:
#_02F0C0: REP #$30

#_02F0C2: LDA.b $84
#_02F0C4: CLC
#_02F0C5: ADC.w #$000E
#_02F0C8: STA.b $84

#_02F0CA: LDA.w #$001F
#_02F0CD: STA.b $86

#_02F0CF: STZ.b $0E

#_02F0D1: LDA.w #$0007
#_02F0D4: STA.b $08

#_02F0D6: JSR TriggerAndFinishMapLoadStripe_Horizontal

#_02F0D9: SEP #$30

#_02F0DB: RTS

;===================================================================================================

CreateInitialOWScreenView_Big_East:
#_02F0DC: REP #$30

#_02F0DE: LDA.b $84
#_02F0E0: SEC
#_02F0E1: SBC.w #$0060
#_02F0E4: CLC
#_02F0E5: ADC.w #$001E
#_02F0E8: STA.b $84

#_02F0EA: STZ.b $0E

#_02F0EC: LDA.w #$0007
#_02F0EF: STA.b $86

#_02F0F1: LDA.w #$0008
#_02F0F4: STA.b $08

#_02F0F6: JSR TriggerAndFinishMapLoadStripe_Horizontal

#_02F0F9: LDA.b $86
#_02F0FB: CLC
#_02F0FC: ADC.w #$0009
#_02F0FF: AND.w #$001F
#_02F102: STA.b $86

#_02F104: LDA.b $84
#_02F106: SEC
#_02F107: SBC.w #$002E
#_02F10A: STA.b $84

#_02F10C: SEP #$30

#_02F10E: RTS

;===================================================================================================

CreateInitialOWScreenView_Small_North:
#_02F10F: REP #$30

#_02F111: LDA.b $84
#_02F113: SEC
#_02F114: SBC.w #$0700
#_02F117: STA.l $7EC172

#_02F11B: LDA.b $86
#_02F11D: STA.l $7EC174

#_02F121: LDA.w #$000A
#_02F124: STA.l $7EC176

#_02F128: LDA.w #$1390
#_02F12B: STA.b $84

#_02F12D: STZ.b $86

#_02F12F: LDA.w #$001F
#_02F132: STA.b $88

#_02F134: STZ.b $0E

#_02F136: LDA.w #$0007
#_02F139: STA.b $08

#_02F13B: JSR TriggerAndFinishMapLoadStripe_Vertical

#_02F13E: SEP #$30

#_02F140: RTS

;===================================================================================================

CreateInitialOWScreenView_Small_South:
#_02F141: REP #$30

#_02F143: LDA.b $84
#_02F145: AND.w #$00FF
#_02F148: STA.l $7EC172

#_02F14C: LDA.b $86
#_02F14E: STA.l $7EC174

#_02F152: LDA.w #$0018
#_02F155: STA.l $7EC176

#_02F159: LDA.w #$0790
#_02F15C: STA.b $84

#_02F15E: STZ.b $86

#_02F160: LDA.w #$0007
#_02F163: STA.b $88

#_02F165: STZ.b $0E

#_02F167: LDA.w #$0008
#_02F16A: STA.b $08

#_02F16C: JSR TriggerAndFinishMapLoadStripe_Vertical

#_02F16F: LDA.b $88
#_02F171: CLC
#_02F172: ADC.w #$0009
#_02F175: AND.w #$001F
#_02F178: STA.b $88

#_02F17A: LDA.b $84
#_02F17C: SEC
#_02F17D: SBC.w #$0B80
#_02F180: STA.b $84

#_02F182: SEP #$30

#_02F184: RTS

;===================================================================================================

CreateInitialOWScreenView_Small_West:
#_02F185: REP #$30

#_02F187: LDA.b $84
#_02F189: SEC
#_02F18A: SBC.w #$0020
#_02F18D: STA.l $7EC172

#_02F191: LDA.w #$0008
#_02F194: STA.l $7EC174

#_02F198: LDA.b $88
#_02F19A: STA.l $7EC176

#_02F19E: LDA.w #$044E
#_02F1A1: STA.b $84

#_02F1A3: STZ.b $88

#_02F1A5: LDA.w #$001F
#_02F1A8: STA.b $86

#_02F1AA: STZ.b $0E

#_02F1AC: LDA.w #$0007
#_02F1AF: STA.b $08

#_02F1B1: JSR TriggerAndFinishMapLoadStripe_Horizontal

#_02F1B4: SEP #$30

#_02F1B6: RTS

;===================================================================================================

CreateInitialOWScreenView_Small_East:
#_02F1B7: REP #$30

#_02F1B9: LDA.b $84
#_02F1BB: SEC
#_02F1BC: SBC.w #$0060
#_02F1BF: STA.l $7EC172

#_02F1C3: LDA.w #$0018
#_02F1C6: STA.l $7EC174

#_02F1CA: LDA.b $88
#_02F1CC: STA.l $7EC176

#_02F1D0: LDA.w #$041E
#_02F1D3: STA.b $84

#_02F1D5: STZ.b $88

#_02F1D7: LDA.w #$0007
#_02F1DA: STA.b $86

#_02F1DC: STZ.b $0E

#_02F1DE: LDA.w #$0008
#_02F1E1: STA.b $08

#_02F1E3: JSR TriggerAndFinishMapLoadStripe_Horizontal

#_02F1E6: LDA.b $86
#_02F1E8: CLC
#_02F1E9: ADC.w #$0009
#_02F1EC: AND.w #$001F
#_02F1EF: STA.b $86

#_02F1F1: LDA.b $84
#_02F1F3: SEC
#_02F1F4: SBC.w #$002E
#_02F1F7: STA.b $84

#_02F1F9: SEP #$30

#_02F1FB: RTS

;===================================================================================================

pool OverworldTransitionScrollAndLoadMap

.vectors
#_02F1FC: dw Overworld_ResetSubmodule
#_02F1FE: dw BuildFullStripeDuringTransition_East
#_02F200: dw BuildFullStripeDuringTransition_West
#_02F202: dw Overworld_ResetSubmodule
#_02F204: dw BuildFullStripeDuringTransition_South
#_02F206: dw Overworld_ResetSubmodule
#_02F208: dw Overworld_ResetSubmodule
#_02F20A: dw Overworld_ResetSubmodule
#_02F20C: dw BuildFullStripeDuringTransition_North

pool off

;---------------------------------------------------------------------------------------------------

OverworldTransitionScrollAndLoadMap:
#_02F20E: SEP #$30

#_02F210: LDA.w $0416
#_02F213: ASL A
#_02F214: TAX

#_02F215: JMP.w (.vectors,X)

;===================================================================================================

BuildFullStripeDuringTransition_North:
#_02F218: REP #$30

#_02F21A: STZ.b $0E

#_02F21C: JSR CheckForNewlyLoadedMapAreas_North_NewStripe

;===================================================================================================

OverworldTransitionScrollAndLoadMap_BuildStripe:
#_02F21F: LDY.b $0E

#_02F221: LDA.w #$FFFF
#_02F224: STA.w $1100,Y
#_02F227: STA.w $1102,Y

#_02F22A: CPY.w #$0000
#_02F22D: BEQ .empty

#_02F22F: SEP #$30

#_02F231: LDA.b #$03
#_02F233: STA.b $17

.empty
#_02F235: SEP #$30

#_02F237: RTS

;===================================================================================================

BuildFullStripeDuringTransition_South:
#_02F238: REP #$30

#_02F23A: STZ.b $0E

#_02F23C: JSR CheckForNewlyLoadedMapAreas_South_NewStripe

#_02F23F: BRA OverworldTransitionScrollAndLoadMap_BuildStripe

;===================================================================================================

BuildFullStripeDuringTransition_West:
#_02F241: REP #$30

#_02F243: STZ.b $0E

#_02F245: JSR CheckForNewlyLoadedMapAreas_West_NewStripe

#_02F248: BRA OverworldTransitionScrollAndLoadMap_BuildStripe

;===================================================================================================

BuildFullStripeDuringTransition_East:
#_02F24A: REP #$30

#_02F24C: STZ.b $0E

#_02F24E: JSR CheckForNewlyLoadedMapAreas_East_NewStripe

#_02F251: BRA OverworldTransitionScrollAndLoadMap_BuildStripe

;===================================================================================================

pool OverworldHandleMapScroll

.vectors
#_02F253: dw Overworld_ResetSubmodule
#_02F255: dw MapScroll_East
#_02F257: dw MapScroll_West
#_02F259: dw Overworld_ResetSubmodule
#_02F25B: dw MapScroll_South
#_02F25D: dw MapScroll_SouthAndClear
#_02F25F: dw MapScroll_SouthAndClear
#_02F261: dw Overworld_ResetSubmodule
#_02F263: dw MapScroll_North
#_02F265: dw MapScroll_NorthAndClear
#_02F267: dw MapScroll_NorthAndClear
#_02F269: dw Overworld_ResetSubmodule
#_02F26B: dw Overworld_ResetSubmodule
#_02F26D: dw Overworld_ResetSubmodule
#_02F26F: dw Overworld_ResetSubmodule
#_02F271: dw Overworld_ResetSubmodule

pool off

;---------------------------------------------------------------------------------------------------

OverworldHandleMapScroll:
#_02F273: REP #$30

#_02F275: STZ.b $0E

#_02F277: SEP #$30

#_02F279: LDA.w $0416
#_02F27C: ASL A
#_02F27D: TAX

#_02F27E: JSR (.vectors,X)

#_02F281: REP #$30

#_02F283: LDY.b $0E

#_02F285: LDA.w #$FFFF
#_02F288: STA.w $1100,Y
#_02F28B: STA.w $1102,Y

#_02F28E: CPY.w #$0000
#_02F291: BEQ .no_update

#_02F293: SEP #$30

#_02F295: LDA.b #$03
#_02F297: STA.b $17

.no_update
#_02F299: SEP #$30

#_02F29B: LDA.w $0416
#_02F29E: STA.w $0418

#_02F2A1: RTS

;===================================================================================================

Overworld_ResetSubmodule:
#_02F2A2: STZ.b $11

#_02F2A4: RTS

;===================================================================================================

MapScroll_East:
#_02F2A5: JSR CheckForNewlyLoadedMapAreas_East

#_02F2A8: STZ.w $0416

#_02F2AB: RTS

;===================================================================================================

MapScroll_West:
#_02F2AC: JSR CheckForNewlyLoadedMapAreas_West

#_02F2AF: STZ.w $0416

#_02F2B2: RTS

;===================================================================================================

MapScroll_South:
#_02F2B3: JSR CheckForNewlyLoadedMapAreas_South

#_02F2B6: STZ.w $0416

#_02F2B9: RTS

;===================================================================================================

MapScroll_SouthAndClear:
#_02F2BA: JSR CheckForNewlyLoadedMapAreas_South

#_02F2BD: SEP #$30

#_02F2BF: LDA.w $0416
#_02F2C2: AND.b #$03
#_02F2C4: STA.w $0416

#_02F2C7: RTS

;===================================================================================================

MapScroll_North:
#_02F2C8: JSR CheckForNewlyLoadedMapAreas_North

#_02F2CB: STZ.w $0416

#_02F2CE: RTS

;===================================================================================================

MapScroll_NorthAndClear:
#_02F2CF: JSR CheckForNewlyLoadedMapAreas_North

#_02F2D2: SEP #$30

#_02F2D4: LDA.w $0416
#_02F2D7: AND.b #$03
#_02F2D9: STA.w $0416

#_02F2DC: RTS

;===================================================================================================

CheckForNewlyLoadedMapAreas_North:
#_02F2DD: REP #$30

#_02F2DF: LDA.b $84
#_02F2E1: CMP.w #$0080
#_02F2E4: BMI .exit

#_02F2E6: LDX.b $8A

#_02F2E8: LDA.l OverworldScreenSize,X
#_02F2EC: AND.w #$00FF
#_02F2EF: BNE .dont_start_stripe

;===================================================================================================

#CheckForNewlyLoadedMapAreas_North_NewStripe:
#_02F2F1: LDY.b $0E

#_02F2F3: LDA.w #$0080
#_02F2F6: STA.w $1100,Y

#_02F2F9: INY
#_02F2FA: INY
#_02F2FB: STY.b $0E

#_02F2FD: JSR BufferAndBuildMap16Stripes_Vertical

;---------------------------------------------------------------------------------------------------

.dont_start_stripe
#_02F300: LDA.b $84
#_02F302: SEC
#_02F303: SBC.w #$0080
#_02F306: STA.b $84

#_02F308: LDA.b $88
#_02F30A: DEC A
#_02F30B: AND.w #$001F
#_02F30E: STA.b $88

.exit
#_02F310: RTS

;===================================================================================================

CheckForNewlyLoadedMapAreas_South:
#_02F311: REP #$30

#_02F313: LDA.b $84
#_02F315: CMP.w #$1800
#_02F318: BCS .exit

#_02F31A: LDX.b $8A

#_02F31C: LDA.l OverworldScreenSize,X
#_02F320: AND.w #$00FF
#_02F323: BNE .dont_start_stripe

;===================================================================================================

#CheckForNewlyLoadedMapAreas_South_NewStripe:
#_02F325: LDY.b $0E

#_02F327: LDA.w #$0080
#_02F32A: STA.w $1100,Y

#_02F32D: INY
#_02F32E: INY
#_02F32F: STY.b $0E

#_02F331: JSR BufferAndBuildMap16Stripes_Vertical

;---------------------------------------------------------------------------------------------------

.dont_start_stripe
#_02F334: LDA.b $84
#_02F336: CLC
#_02F337: ADC.w #$0080
#_02F33A: STA.b $84

#_02F33C: LDA.b $88
#_02F33E: INC A
#_02F33F: AND.w #$001F
#_02F342: STA.b $88

.exit
#_02F344: RTS

;===================================================================================================

CheckForNewlyLoadedMapAreas_West:
#_02F345: REP #$30

#_02F347: LDA.b $84

.cull_more
#_02F349: CMP.w #$0080
#_02F34C: BCC .in_range

#_02F34E: SBC.w #$0080
#_02F351: BRA .cull_more

.in_range
#_02F353: CMP.w #$0000
#_02F356: BEQ .exit

#_02F358: LDX.b $8A

#_02F35A: LDA.l OverworldScreenSize,X
#_02F35E: AND.w #$00FF
#_02F361: BNE .dont_start_stripe

;===================================================================================================

#CheckForNewlyLoadedMapAreas_West_NewStripe:
#_02F363: LDY.b $0E

#_02F365: LDA.w #$8040
#_02F368: STA.w $1100,Y

#_02F36B: INY
#_02F36C: INY
#_02F36D: STY.b $0E

#_02F36F: JSR BufferAndBuildMap16Stripes_Horizontal

;---------------------------------------------------------------------------------------------------

.dont_start_stripe
#_02F372: DEC.b $84
#_02F374: DEC.b $84

#_02F376: LDA.b $86
#_02F378: DEC A
#_02F379: AND.w #$001F
#_02F37C: STA.b $86

.exit
#_02F37E: RTS

;===================================================================================================

CheckForNewlyLoadedMapAreas_East:
#_02F37F: REP #$30

#_02F381: LDA.b $84

.cull_more
#_02F383: CMP.w #$0080
#_02F386: BCC .in_range

#_02F388: SBC.w #$0080
#_02F38B: BRA .cull_more

.in_range
#_02F38D: CMP.w #$0060
#_02F390: BCS .exit

#_02F392: LDX.b $8A

#_02F394: LDA.l OverworldScreenSize,X
#_02F398: AND.w #$00FF
#_02F39B: BNE .dont_start_stripe

;===================================================================================================

#CheckForNewlyLoadedMapAreas_East_NewStripe:
#_02F39D: LDY.b $0E

#_02F39F: LDA.w #$8040
#_02F3A2: STA.w $1100,Y

#_02F3A5: INY
#_02F3A6: INY
#_02F3A7: STY.b $0E

#_02F3A9: JSR BufferAndBuildMap16Stripes_Horizontal

;---------------------------------------------------------------------------------------------------

.dont_start_stripe
#_02F3AC: INC.b $84
#_02F3AE: INC.b $84

#_02F3B0: LDA.b $86
#_02F3B2: INC A
#_02F3B3: AND.w #$001F
#_02F3B6: STA.b $86

.exit
#_02F3B8: RTS

;===================================================================================================

BufferAndBuildMap16Stripes_Horizontal:
#_02F3B9: LDA.w $0416
#_02F3BC: AND.w #$0002
#_02F3BF: TAX

#_02F3C0: LDA.b $84
#_02F3C2: SEC
#_02F3C3: SBC.l Map16ReadOffset_Horizontal,X
#_02F3C7: TAY

#_02F3C8: LDA.b $88
#_02F3CA: ASL A
#_02F3CB: TAX

#_02F3CC: LDA.w #$2000
#_02F3CF: STA.b $00

#_02F3D1: LDA.w #$007E
#_02F3D4: STA.b $02

#_02F3D6: LDA.w #$0010
#_02F3D9: STA.b $03

;---------------------------------------------------------------------------------------------------

.next
#_02F3DB: LDA.b [$00],Y
#_02F3DD: STA.w $0500,X

#_02F3E0: INX
#_02F3E1: INX

#_02F3E2: TXA
#_02F3E3: AND.w #$003F
#_02F3E6: TAX

#_02F3E7: TYA
#_02F3E8: CLC
#_02F3E9: ADC.w #$0080
#_02F3EC: TAY

#_02F3ED: LDA.b [$00],Y
#_02F3EF: STA.w $0500,X

#_02F3F2: INX
#_02F3F3: INX

#_02F3F4: TXA
#_02F3F5: AND.w #$003F
#_02F3F8: TAX

#_02F3F9: TYA
#_02F3FA: CLC
#_02F3FB: ADC.w #$0080
#_02F3FE: TAY

#_02F3FF: DEC.b $03
#_02F401: BNE .next

;---------------------------------------------------------------------------------------------------

#_02F403: STZ.b $00

#_02F405: LDA.b $86
#_02F407: STA.b $02

#_02F409: CMP.w #$0010
#_02F40C: BCC .start_low

#_02F40E: AND.w #$000F
#_02F411: STA.b $02

#_02F413: LDA.w #$0400
#_02F416: STA.b $00

.start_low
#_02F418: LDA.b $02
#_02F41A: ASL A
#_02F41B: CLC
#_02F41C: ADC.b $00
#_02F41E: STA.b $00

#_02F420: CLC
#_02F421: ADC.w #$0800
#_02F424: STA.b $0C

#_02F426: LDA.l Map16BufferOffsetLow
#_02F42A: JSR CreateMap16Stripes_Horizontal

#_02F42D: LDA.b $0C
#_02F42F: STA.b $00

#_02F431: LDA.l Map16BufferOffsetHigh

;===================================================================================================

CreateMap16Stripes_Horizontal:
#_02F435: STA.b $02

#_02F437: LDY.b $0E

#_02F439: LDA.b $00
#_02F43B: STA.w $1100,Y

#_02F43E: INC A
#_02F43F: STA.w $1142,Y

#_02F442: INY
#_02F443: INY

#_02F444: LDA.w #$0010
#_02F447: STA.b $06

;---------------------------------------------------------------------------------------------------

.next
#_02F449: LDX.b $02

#_02F44B: LDA.w $0500,X

#_02F44E: INX
#_02F44F: INX
#_02F450: STX.b $02

#_02F452: ASL A
#_02F453: ASL A
#_02F454: ASL A
#_02F455: TAX

#_02F456: LDA.l Map16Definitions+0,X
#_02F45A: STA.w $1100,Y

#_02F45D: LDA.l Map16Definitions+2,X
#_02F461: STA.w $1142,Y

#_02F464: INY
#_02F465: INY

#_02F466: LDA.l Map16Definitions+4,X
#_02F46A: STA.w $1100,Y

#_02F46D: LDA.l Map16Definitions+6,X
#_02F471: STA.w $1142,Y

#_02F474: INY
#_02F475: INY

#_02F476: DEC.b $06
#_02F478: BNE .next

;---------------------------------------------------------------------------------------------------

#_02F47A: TYA
#_02F47B: CLC
#_02F47C: ADC.w #$0042
#_02F47F: STA.b $0E

#_02F481: RTS

;===================================================================================================

BufferAndBuildMap16Stripes_Vertical:
#_02F482: LDA.w $0416
#_02F485: AND.w #$0004
#_02F488: LSR A
#_02F489: TAX

#_02F48A: LDA.b $84
#_02F48C: SEC
#_02F48D: SBC.l Map16ReadOffset_Vertical,X
#_02F491: TAY

#_02F492: LDA.b $86
#_02F494: ASL A
#_02F495: TAX

#_02F496: LDA.w #$2000
#_02F499: STA.b $00

#_02F49B: LDA.w #$007E
#_02F49E: STA.b $02

#_02F4A0: LDA.w #$0010
#_02F4A3: STA.b $03

;---------------------------------------------------------------------------------------------------

.next
#_02F4A5: LDA.b [$00],Y
#_02F4A7: STA.w $0500,X

#_02F4AA: INX
#_02F4AB: INX

#_02F4AC: TXA
#_02F4AD: AND.w #$003F
#_02F4B0: TAX

#_02F4B1: INY
#_02F4B2: INY

#_02F4B3: LDA.b [$00],Y
#_02F4B5: STA.w $0500,X

#_02F4B8: INX
#_02F4B9: INX

#_02F4BA: TXA
#_02F4BB: AND.w #$003F
#_02F4BE: TAX

#_02F4BF: INY
#_02F4C0: INY

#_02F4C1: DEC.b $03
#_02F4C3: BNE .next

;---------------------------------------------------------------------------------------------------

#_02F4C5: STZ.b $00

#_02F4C7: LDA.b $88
#_02F4C9: STA.b $02

#_02F4CB: CMP.w #$0010
#_02F4CE: BCC .start_low

#_02F4D0: AND.w #$000F
#_02F4D3: STA.b $02

#_02F4D5: LDA.w #$0800
#_02F4D8: STA.b $00

.start_low
#_02F4DA: LDA.b $02

#_02F4DC: ASL A
#_02F4DD: ASL A
#_02F4DE: ASL A
#_02F4DF: ASL A
#_02F4E0: ASL A
#_02F4E1: ASL A

#_02F4E2: CLC
#_02F4E3: ADC.b $00
#_02F4E5: STA.b $00

#_02F4E7: CLC
#_02F4E8: ADC.w #$0400
#_02F4EB: STA.b $0C

#_02F4ED: LDY.b $0E

#_02F4EF: LDA.b $00
#_02F4F1: STA.w $1100,Y

#_02F4F4: INY
#_02F4F5: INY

#_02F4F6: LDA.l Map16BufferOffsetLow
#_02F4FA: JSR CreateMap16Stripes_Vertical

#_02F4FD: LDY.b $0E

#_02F4FF: LDA.b $0C
#_02F501: STA.w $1100,Y

#_02F504: INY
#_02F505: INY
#_02F506: LDA.l Map16BufferOffsetHigh

;===================================================================================================

CreateMap16Stripes_Vertical:
#_02F50A: STA.b $02

#_02F50C: LDA.w #$0010
#_02F50F: STA.b $06

;---------------------------------------------------------------------------------------------------

.next
#_02F511: LDX.b $02

#_02F513: LDA.w $0500,X

#_02F516: INX
#_02F517: INX
#_02F518: STX.b $02

#_02F51A: ASL A
#_02F51B: ASL A
#_02F51C: ASL A
#_02F51D: TAX

#_02F51E: LDA.l Map16Definitions+0,X
#_02F522: STA.w $1100,Y

#_02F525: LDA.l Map16Definitions+4,X
#_02F529: STA.w $1140,Y

#_02F52C: INY
#_02F52D: INY

#_02F52E: LDA.l Map16Definitions+2,X
#_02F532: STA.w $1100,Y

#_02F535: LDA.l Map16Definitions+6,X
#_02F539: STA.w $1140,Y

#_02F53C: INY
#_02F53D: INY

#_02F53E: DEC.b $06
#_02F540: BNE .next

;---------------------------------------------------------------------------------------------------

#_02F542: TYA
#_02F543: CLC
#_02F544: ADC.w #$0040
#_02F547: STA.b $0E

#_02F549: RTS

;===================================================================================================

Overworld_DecompressAndDrawAllQuadrants:
#_02F54A: LDA.b $8A
#_02F54C: ASL A
#_02F54D: ADC.b $8A
#_02F54F: TAX

#_02F550: LDA.w #$007E
#_02F553: STA.b $02
#_02F555: STA.b $05

#_02F557: LDA.w #$2000
#_02F55A: JSR Overworld_DecompressAndDrawOneQuadrant

;---------------------------------------------------------------------------------------------------

#_02F55D: LDA.b $8A
#_02F55F: INC A
#_02F560: STA.b $00

#_02F562: ASL A
#_02F563: ADC.b $00
#_02F565: TAX

#_02F566: LDA.w #$2000
#_02F569: CLC
#_02F56A: ADC.w #$0040
#_02F56D: JSR Overworld_DecompressAndDrawOneQuadrant

;---------------------------------------------------------------------------------------------------

#_02F570: LDA.b $8A
#_02F572: CLC
#_02F573: ADC.w #$0008
#_02F576: STA.b $00

#_02F578: ASL A
#_02F579: ADC.b $00
#_02F57B: TAX

#_02F57C: LDA.w #$3000
#_02F57F: JSR Overworld_DecompressAndDrawOneQuadrant

;---------------------------------------------------------------------------------------------------

#_02F582: LDA.b $8A
#_02F584: CLC
#_02F585: ADC.w #$0009
#_02F588: STA.b $00

#_02F58A: ASL A
#_02F58B: ADC.b $00
#_02F58D: TAX

#_02F58E: LDA.w #$3000
#_02F591: CLC
#_02F592: ADC.w #$0040

;===================================================================================================

Overworld_DecompressAndDrawOneQuadrant:
#_02F595: STA.b $00

#_02F597: CLC
#_02F598: ADC.w #$0080
#_02F59B: STA.b $03

#_02F59D: LDA.l OverworldLoad_Map32HPointers+0,X
#_02F5A1: STA.b $C8

#_02F5A3: LDA.l OverworldLoad_Map32HPointers+1,X
#_02F5A7: STA.b $C9

#_02F5A9: LDA.b $00
#_02F5AB: PHA

#_02F5AC: LDA.b $02
#_02F5AE: PHA

#_02F5AF: LDA.b $04
#_02F5B1: PHA

#_02F5B2: LDA.w #$7F4400
#_02F5B5: STA.b $00

#_02F5B7: LDA.w #$007F
#_02F5BA: STA.b $02

#_02F5BC: PHX

#_02F5BD: SEP #$30

#_02F5BF: JSR Decompress_bank02

#_02F5C2: REP #$30

#_02F5C4: JSR BlockMoveMap32Chunks_High

#_02F5C7: PLX

;---------------------------------------------------------------------------------------------------

#_02F5C8: LDA.l OverworldLoad_Map32LPointers+0,X
#_02F5CC: STA.b $C8

#_02F5CE: LDA.l OverworldLoad_Map32LPointers+1,X
#_02F5D2: STA.b $C9

#_02F5D4: LDA.w #$7F4400
#_02F5D7: STA.b $00

#_02F5D9: LDA.w #$007F
#_02F5DC: STA.b $02

#_02F5DE: PHX

#_02F5DF: SEP #$30

#_02F5E1: JSR Decompress_bank02

#_02F5E4: REP #$30

#_02F5E6: JSR BlockMoveMap32Chunks_Low

#_02F5E9: PLX

;---------------------------------------------------------------------------------------------------

#_02F5EA: PLA
#_02F5EB: STA.b $04

#_02F5ED: PLA
#_02F5EE: STA.b $02

#_02F5F0: PLA
#_02F5F1: STA.b $00

#_02F5F3: LDA.w #$7F4000
#_02F5F6: STA.b $08

#_02F5F8: LDA.w #$007F
#_02F5FB: STA.b $0A

#_02F5FD: SEP #$20

#_02F5FF: PHB

#_02F600: LDA.b #$7F
#_02F602: PHA
#_02F603: PLB

#_02F604: REP #$30

#_02F606: LDA.w #$FFFF
#_02F609: STA.w $7F4440

#_02F60C: STZ.b $06
#_02F60E: STZ.b $0B

;---------------------------------------------------------------------------------------------------

.next_a
#_02F610: LDA.w #$0010
#_02F613: STA.b $0D

.next_b
#_02F615: LDY.b $0B

#_02F617: LDA.b [$08],Y
#_02F619: ASL A

#_02F61A: LDY.b $06
#_02F61C: JSR Overworld_ParseMap32Definition

#_02F61F: STY.b $06

#_02F621: INC.b $0B
#_02F623: INC.b $0B

#_02F625: DEC.b $0D
#_02F627: BNE .next_b

#_02F629: LDA.b $06
#_02F62B: CLC
#_02F62C: ADC.w #$00C0
#_02F62F: STA.b $06

#_02F631: CMP.w #$1000
#_02F634: BCC .next_a

#_02F636: PLB

#_02F637: RTS

;===================================================================================================

BlockMoveMap32Chunks_High:
#_02F638: SEP #$20

#_02F63A: PHB

#_02F63B: LDA.b #$7F
#_02F63D: PHA
#_02F63E: PLB

#_02F63F: STA.b $02

#_02F641: REP #$30

#_02F643: LDX.w #$0000
#_02F646: LDY.w #$0001

#_02F649: LDA.w #$7F4000
#_02F64C: STA.b $00

#_02F64E: SEP #$20

;---------------------------------------------------------------------------------------------------

.next
#_02F650: LDA.w $7F4400,X
#_02F653: STA.b [$00],Y

#_02F655: INY
#_02F656: INY

#_02F657: INX

#_02F658: LDA.w $7F4400,X
#_02F65B: STA.b [$00],Y

#_02F65D: INY
#_02F65E: INY

#_02F65F: INX

#_02F660: LDA.w $7F4400,X
#_02F663: STA.b [$00],Y

#_02F665: INY
#_02F666: INY

#_02F667: INX

#_02F668: LDA.w $7F4400,X
#_02F66B: STA.b [$00],Y

#_02F66D: INY
#_02F66E: INY

#_02F66F: INX
#_02F670: CPX.w #$0100
#_02F673: BCC .next

#_02F675: REP #$30

#_02F677: PLB

#_02F678: RTS

;---------------------------------------------------------------------------------------------------

#BlockMoveMap32Chunks_Low:
#_02F679: SEP #$20

#_02F67B: PHB

#_02F67C: LDA.b #$7F
#_02F67E: PHA
#_02F67F: PLB

#_02F680: STA.b $02

#_02F682: REP #$30

#_02F684: LDX.w #$0000
#_02F687: TXY

#_02F688: LDA.w #$7F4000
#_02F68B: STA.b $00

#_02F68D: SEP #$20

#_02F68F: BRA .next

;===================================================================================================

Overworld_ParseMap32Definition:
#_02F691: PHA

#_02F692: AND.w #$FFF8
#_02F695: CMP.w $7F4440
#_02F698: BNE .continue

#_02F69A: JMP.w .skip

;---------------------------------------------------------------------------------------------------

.continue
#_02F69D: STA.w $7F4440

#_02F6A0: LSR A
#_02F6A1: STA.w $7F4442

#_02F6A4: LSR A
#_02F6A5: ADC.w $7F4442
#_02F6A8: TAX

#_02F6A9: SEP #$20

;---------------------------------------------------------------------------------------------------

#_02F6AB: LDA.l Tile32_TopLeft+0,X
#_02F6AF: STA.w $7F4400

#_02F6B2: LDA.l Tile32_TopLeft+1,X
#_02F6B6: STA.w $7F4402

#_02F6B9: LDA.l Tile32_TopLeft+2,X
#_02F6BD: STA.w $7F4404

#_02F6C0: LDA.l Tile32_TopLeft+3,X
#_02F6C4: STA.w $7F4406

#_02F6C7: LDA.l Tile32_TopLeft+4,X
#_02F6CB: PHA

#_02F6CC: LSR A
#_02F6CD: LSR A
#_02F6CE: LSR A
#_02F6CF: LSR A
#_02F6D0: STA.w $7F4401

#_02F6D3: PLA
#_02F6D4: AND.b #$0F
#_02F6D6: STA.w $7F4403

#_02F6D9: LDA.l Tile32_TopLeft+5,X
#_02F6DD: PHA

#_02F6DE: LSR A
#_02F6DF: LSR A
#_02F6E0: LSR A
#_02F6E1: LSR A
#_02F6E2: STA.w $7F4405

#_02F6E5: PLA
#_02F6E6: AND.b #$0F
#_02F6E8: STA.w $7F4407

;---------------------------------------------------------------------------------------------------

#_02F6EB: LDA.l Tile32_TopRight+0,X
#_02F6EF: STA.w $7F4410

#_02F6F2: LDA.l Tile32_TopRight+1,X
#_02F6F6: STA.w $7F4412

#_02F6F9: LDA.l Tile32_TopRight+2,X
#_02F6FD: STA.w $7F4414

#_02F700: LDA.l Tile32_TopRight+3,X
#_02F704: STA.w $7F4416

#_02F707: LDA.l Tile32_TopRight+4,X
#_02F70B: PHA

#_02F70C: LSR A
#_02F70D: LSR A
#_02F70E: LSR A
#_02F70F: LSR A
#_02F710: STA.w $7F4411

#_02F713: PLA
#_02F714: AND.b #$0F
#_02F716: STA.w $7F4413

#_02F719: LDA.l Tile32_TopRight+5,X
#_02F71D: PHA

#_02F71E: LSR A
#_02F71F: LSR A
#_02F720: LSR A
#_02F721: LSR A
#_02F722: STA.w $7F4415

#_02F725: PLA
#_02F726: AND.b #$0F
#_02F728: STA.w $7F4417

;---------------------------------------------------------------------------------------------------

#_02F72B: LDA.l Tile32_BottomLeft+0,X
#_02F72F: STA.w $7F4420

#_02F732: LDA.l Tile32_BottomLeft+1,X
#_02F736: STA.w $7F4422

#_02F739: LDA.l Tile32_BottomLeft+2,X
#_02F73D: STA.w $7F4424

#_02F740: LDA.l Tile32_BottomLeft+3,X
#_02F744: STA.w $7F4426

#_02F747: LDA.l Tile32_BottomLeft+4,X
#_02F74B: PHA

#_02F74C: LSR A
#_02F74D: LSR A
#_02F74E: LSR A
#_02F74F: LSR A
#_02F750: STA.w $7F4421

#_02F753: PLA
#_02F754: AND.b #$0F
#_02F756: STA.w $7F4423

#_02F759: LDA.l Tile32_BottomLeft+5,X
#_02F75D: PHA

#_02F75E: LSR A
#_02F75F: LSR A
#_02F760: LSR A
#_02F761: LSR A
#_02F762: STA.w $7F4425

#_02F765: PLA
#_02F766: AND.b #$0F
#_02F768: STA.w $7F4427

;---------------------------------------------------------------------------------------------------

#_02F76B: LDA.l Tile32_BottomRight+0,X
#_02F76F: STA.w $7F4430

#_02F772: LDA.l Tile32_BottomRight+1,X
#_02F776: STA.w $7F4432

#_02F779: LDA.l Tile32_BottomRight+2,X
#_02F77D: STA.w $7F4434

#_02F780: LDA.l Tile32_BottomRight+3,X
#_02F784: STA.w $7F4436

#_02F787: LDA.l Tile32_BottomRight+4,X
#_02F78B: PHA

#_02F78C: LSR A
#_02F78D: LSR A
#_02F78E: LSR A
#_02F78F: LSR A
#_02F790: STA.w $7F4431

#_02F793: PLA
#_02F794: AND.b #$0F
#_02F796: STA.w $7F4433

#_02F799: LDA.l Tile32_BottomRight+5,X
#_02F79D: PHA

#_02F79E: LSR A
#_02F79F: LSR A
#_02F7A0: LSR A
#_02F7A1: LSR A
#_02F7A2: STA.w $7F4435

#_02F7A5: PLA
#_02F7A6: AND.b #$0F
#_02F7A8: STA.w $7F4437

#_02F7AB: REP #$30

;---------------------------------------------------------------------------------------------------

.skip
#_02F7AD: PLA
#_02F7AE: AND.w #$0007
#_02F7B1: TAX

#_02F7B2: LDA.w $7F4400,X
#_02F7B5: STA.b [$00],Y

#_02F7B7: LDA.w $7F4420,X
#_02F7BA: STA.b [$03],Y

#_02F7BC: INY
#_02F7BD: INY

#_02F7BE: LDA.w $7F4410,X
#_02F7C1: STA.b [$00],Y

#_02F7C3: LDA.w $7F4430,X
#_02F7C6: STA.b [$03],Y

#_02F7C8: INY
#_02F7C9: INY

#_02F7CA: RTS

;===================================================================================================

OverworldLoad_LoadSubOverlayMap32:
#_02F7CB: LDA.b $8A
#_02F7CD: ASL A
#_02F7CE: ADC.b $8A
#_02F7D0: TAX

#_02F7D1: LDA.w #$007E
#_02F7D4: STA.b $02
#_02F7D6: STA.b $05

#_02F7D8: LDA.w #$7E4000
#_02F7DB: STA.b $00

#_02F7DD: CLC
#_02F7DE: ADC.w #$0080
#_02F7E1: STA.b $03

#_02F7E3: LDA.l OverworldLoad_Map32HPointers+0,X
#_02F7E7: STA.b $C8

#_02F7E9: LDA.l OverworldLoad_Map32HPointers+1,X
#_02F7ED: STA.b $C9

;---------------------------------------------------------------------------------------------------

#_02F7EF: LDA.b $00
#_02F7F1: PHA

#_02F7F2: LDA.b $02
#_02F7F4: PHA

#_02F7F5: LDA.b $04
#_02F7F7: PHA

#_02F7F8: LDA.w #$7F4400
#_02F7FB: STA.b $00

#_02F7FD: LDA.w #$007F
#_02F800: STA.b $02

;---------------------------------------------------------------------------------------------------

#_02F802: PHX

#_02F803: SEP #$30

#_02F805: JSR Decompress_bank02

#_02F808: REP #$30

#_02F80A: JSR BlockMoveMap32Chunks_High

;---------------------------------------------------------------------------------------------------

#_02F80D: PLX

#_02F80E: LDA.l OverworldLoad_Map32LPointers+0,X
#_02F812: STA.b $C8

#_02F814: LDA.l OverworldLoad_Map32LPointers+1,X
#_02F818: STA.b $C9

#_02F81A: LDA.w #$7F4400
#_02F81D: STA.b $00

#_02F81F: LDA.w #$007F
#_02F822: STA.b $02

;---------------------------------------------------------------------------------------------------

#_02F824: PHX

#_02F825: SEP #$30

#_02F827: JSR Decompress_bank02

#_02F82A: REP #$30

#_02F82C: JSR BlockMoveMap32Chunks_Low

#_02F82F: PLX

;---------------------------------------------------------------------------------------------------

#_02F830: PLA
#_02F831: STA.b $04

#_02F833: PLA
#_02F834: STA.b $02

#_02F836: PLA
#_02F837: STA.b $00

#_02F839: LDA.w #$7F4000
#_02F83C: STA.b $08

#_02F83E: LDA.w #$007F
#_02F841: STA.b $0A

;---------------------------------------------------------------------------------------------------

#_02F843: SEP #$20

#_02F845: PHB

#_02F846: LDA.b #$7F
#_02F848: PHA
#_02F849: PLB

#_02F84A: REP #$30

#_02F84C: LDA.w #$FFFF
#_02F84F: STA.w $7F4440

#_02F852: STZ.b $06
#_02F854: STZ.b $0B

.next_a
#_02F856: LDA.w #$0010
#_02F859: STA.b $0D

.next_b
#_02F85B: LDY.b $0B

#_02F85D: LDA.b [$08],Y
#_02F85F: ASL A
#_02F860: TAX

#_02F861: LDY.b $06
#_02F863: JSR Overworld_ParseMap32Definition

#_02F866: STY.b $06

#_02F868: INC.b $0B
#_02F86A: INC.b $0B

#_02F86C: DEC.b $0D
#_02F86E: BNE .next_b

#_02F870: LDA.b $06
#_02F872: CLC
#_02F873: ADC.w #$00C0
#_02F876: STA.b $06

#_02F878: CMP.w #$1000
#_02F87B: BCC .next_a

#_02F87D: PLB

#_02F87E: RTS

;===================================================================================================

UNREACHABLE_02F87F:
#_02F87F: dw $0002, $0004

;===================================================================================================

Map16ReadOffset_Horizontal:
#_02F883: dw $03D0

Map16ReadOffset_Vertical:
#_02F885: dw $0410, $F410

Map16BufferOffsetLow:
#_02F889: dw $0000

Map16BufferOffsetHigh:
#_02F88B: dw $0020

;===================================================================================================

OverworldScreenSize:
#_02F88D: db $00, $00, $01, $00, $00, $00, $00, $01
#_02F895: db $00, $00, $01, $00, $00, $00, $00, $01
#_02F89D: db $01, $01, $01, $01, $01, $01, $01, $01
#_02F8A5: db $00, $00, $01, $00, $00, $01, $00, $00
#_02F8AD: db $00, $00, $01, $00, $00, $01, $00, $00
#_02F8B5: db $01, $01, $01, $01, $01, $01, $01, $01
#_02F8BD: db $00, $00, $01, $01, $01, $00, $00, $01
#_02F8C5: db $00, $00, $01, $01, $01, $00, $00, $01

#_02F8CD: db $00, $00, $01, $00, $00, $00, $00, $01
#_02F8D5: db $00, $00, $01, $00, $00, $00, $00, $01
#_02F8DD: db $01, $01, $01, $01, $01, $01, $01, $01
#_02F8E5: db $00, $00, $01, $00, $00, $01, $00, $00
#_02F8ED: db $00, $00, $01, $00, $00, $01, $00, $00
#_02F8F5: db $01, $01, $01, $01, $01, $01, $01, $01
#_02F8FD: db $00, $00, $01, $01, $01, $00, $00, $01
#_02F905: db $00, $00, $01, $01, $01, $00, $00, $01

#_02F90D: db $01, $00, $00, $00, $00, $00, $00, $00
#_02F915: db $00, $00, $00, $00, $00, $00, $00, $00
#_02F91D: db $00, $00, $00, $00, $00, $00, $00, $00
#_02F925: db $00, $00, $00, $00, $00, $00, $00, $00
#_02F92D: db $00, $00, $00, $00, $00, $00, $00, $00
#_02F935: db $00, $00, $00, $00, $00, $00, $00, $00
#_02F93D: db $00, $00, $00, $00, $00, $00, $00, $00
#_02F945: db $00, $00, $00, $00, $00, $00, $00, $00

;===================================================================================================

OverworldLoad_Map32HPointers:
#_02F94D: dl OverworldMap32_Screen00_High
#_02F950: dl OverworldMap32_Screen01_High
#_02F953: dl OverworldMap32_Screen02_High
#_02F956: dl OverworldMap32_Screen03_High

#_02F959: dl OverworldMap32_Screen04_High
#_02F95C: dl OverworldMap32_Screen05_High
#_02F95F: dl OverworldMap32_Screen06_High
#_02F962: dl OverworldMap32_Screen07_High

#_02F965: dl OverworldMap32_Screen08_High
#_02F968: dl OverworldMap32_Screen09_High
#_02F96B: dl OverworldMap32_Screen0A_High
#_02F96E: dl OverworldMap32_Screen0B_High

#_02F971: dl OverworldMap32_Screen0C_High
#_02F974: dl OverworldMap32_Screen0D_High
#_02F977: dl OverworldMap32_Screen0E_High
#_02F97A: dl OverworldMap32_Screen0F_High

#_02F97D: dl OverworldMap32_Screen10_High
#_02F980: dl OverworldMap32_Screen11_High
#_02F983: dl OverworldMap32_Screen12_High
#_02F986: dl OverworldMap32_Screen13_High

#_02F989: dl OverworldMap32_Screen14_High
#_02F98C: dl OverworldMap32_Screen15_High
#_02F98F: dl OverworldMap32_Screen16_High
#_02F992: dl OverworldMap32_Screen17_High

#_02F995: dl OverworldMap32_Screen18_High
#_02F998: dl OverworldMap32_Screen19_High
#_02F99B: dl OverworldMap32_Screen1A_High
#_02F99E: dl OverworldMap32_Screen1B_High

#_02F9A1: dl OverworldMap32_Screen1C_High
#_02F9A4: dl OverworldMap32_Screen1D_High
#_02F9A7: dl OverworldMap32_Screen1E_High
#_02F9AA: dl OverworldMap32_Screen1F_High

#_02F9AD: dl OverworldMap32_Screen20_High
#_02F9B0: dl OverworldMap32_Screen21_High
#_02F9B3: dl OverworldMap32_Screen22_High
#_02F9B6: dl OverworldMap32_Screen23_High

#_02F9B9: dl OverworldMap32_Screen24_High
#_02F9BC: dl OverworldMap32_Screen25_High
#_02F9BF: dl OverworldMap32_Screen26_High
#_02F9C2: dl OverworldMap32_Screen27_High

#_02F9C5: dl OverworldMap32_Screen28_High
#_02F9C8: dl OverworldMap32_Screen29_High
#_02F9CB: dl OverworldMap32_Screen2A_High
#_02F9CE: dl OverworldMap32_Screen2B_High

#_02F9D1: dl OverworldMap32_Screen2C_High
#_02F9D4: dl OverworldMap32_Screen2D_High
#_02F9D7: dl OverworldMap32_Screen2E_High
#_02F9DA: dl OverworldMap32_Screen2F_High

#_02F9DD: dl OverworldMap32_Screen30_High
#_02F9E0: dl OverworldMap32_Screen31_High
#_02F9E3: dl OverworldMap32_Screen32_High
#_02F9E6: dl OverworldMap32_Screen33_High

#_02F9E9: dl OverworldMap32_Screen34_High
#_02F9EC: dl OverworldMap32_Screen35_High
#_02F9EF: dl OverworldMap32_Screen36_High
#_02F9F2: dl OverworldMap32_Screen37_High

#_02F9F5: dl OverworldMap32_Screen38_High
#_02F9F8: dl OverworldMap32_Screen39_High
#_02F9FB: dl OverworldMap32_Screen3A_High
#_02F9FE: dl OverworldMap32_Screen3B_High

#_02FA01: dl OverworldMap32_Screen3C_High
#_02FA04: dl OverworldMap32_Screen3D_High
#_02FA07: dl OverworldMap32_Screen3E_High
#_02FA0A: dl OverworldMap32_Screen3F_High

;===================================================================================================

#_02FA0D: dl OverworldMap32_Screen40_High
#_02FA10: dl OverworldMap32_Screen41_High
#_02FA13: dl OverworldMap32_Screen42_High
#_02FA16: dl OverworldMap32_Screen43_High

#_02FA19: dl OverworldMap32_Screen44_High
#_02FA1C: dl OverworldMap32_Screen45_High
#_02FA1F: dl OverworldMap32_Screen46_High
#_02FA22: dl OverworldMap32_Screen47_High

#_02FA25: dl OverworldMap32_Screen48_High
#_02FA28: dl OverworldMap32_Screen49_High
#_02FA2B: dl OverworldMap32_Screen0A_High
#_02FA2E: dl OverworldMap32_Screen4B_High

#_02FA31: dl OverworldMap32_Screen4C_High
#_02FA34: dl OverworldMap32_Screen4D_High
#_02FA37: dl OverworldMap32_Screen4E_High
#_02FA3A: dl OverworldMap32_Screen4F_High

#_02FA3D: dl OverworldMap32_Screen50_High
#_02FA40: dl OverworldMap32_Screen11_High
#_02FA43: dl OverworldMap32_Screen12_High
#_02FA46: dl OverworldMap32_Screen53_High

#_02FA49: dl OverworldMap32_Screen54_High
#_02FA4C: dl OverworldMap32_Screen55_High
#_02FA4F: dl OverworldMap32_Screen56_High
#_02FA52: dl OverworldMap32_Screen17_High

#_02FA55: dl OverworldMap32_Screen58_High
#_02FA58: dl OverworldMap32_Screen59_High
#_02FA5B: dl OverworldMap32_Screen5A_High
#_02FA5E: dl OverworldMap32_Screen5B_High

#_02FA61: dl OverworldMap32_Screen5C_High
#_02FA64: dl OverworldMap32_Screen5D_High
#_02FA67: dl OverworldMap32_Screen5E_High
#_02FA6A: dl OverworldMap32_Screen5F_High

#_02FA6D: dl OverworldMap32_Screen60_High
#_02FA70: dl OverworldMap32_Screen61_High
#_02FA73: dl OverworldMap32_Screen62_High
#_02FA76: dl OverworldMap32_Screen63_High

#_02FA79: dl OverworldMap32_Screen64_High
#_02FA7C: dl OverworldMap32_Screen25_High
#_02FA7F: dl OverworldMap32_Screen66_High
#_02FA82: dl OverworldMap32_Screen67_High

#_02FA85: dl OverworldMap32_Screen68_High
#_02FA88: dl OverworldMap32_Screen69_High
#_02FA8B: dl OverworldMap32_Screen2A_High
#_02FA8E: dl OverworldMap32_Screen2B_High

#_02FA91: dl OverworldMap32_Screen2C_High
#_02FA94: dl OverworldMap32_Screen6D_High
#_02FA97: dl OverworldMap32_Screen2E_High
#_02FA9A: dl OverworldMap32_Screen2F_High

#_02FA9D: dl OverworldMap32_Screen70_High
#_02FAA0: dl OverworldMap32_Screen71_High
#_02FAA3: dl OverworldMap32_Screen72_High
#_02FAA6: dl OverworldMap32_Screen33_High

#_02FAA9: dl OverworldMap32_Screen34_High
#_02FAAC: dl OverworldMap32_Screen75_High
#_02FAAF: dl OverworldMap32_Screen76_High
#_02FAB2: dl OverworldMap32_Screen37_High

#_02FAB5: dl OverworldMap32_Screen78_High
#_02FAB8: dl OverworldMap32_Screen79_High
#_02FABB: dl OverworldMap32_Screen7A_High
#_02FABE: dl OverworldMap32_Screen3B_High

#_02FAC1: dl OverworldMap32_Screen3C_High
#_02FAC4: dl OverworldMap32_Screen7D_High
#_02FAC7: dl OverworldMap32_Screen7E_High
#_02FACA: dl OverworldMap32_Screen3F_High

;===================================================================================================

#_02FACD: dl OverworldMap32_Screen80_High
#_02FAD0: dl OverworldMap32_Screen81_High
#_02FAD3: dl OverworldMap32_Screen82_High
#_02FAD6: dl OverworldMap32_Screen00_High

#_02FAD9: dl OverworldMap32_Screen00_High
#_02FADC: dl OverworldMap32_Screen00_High
#_02FADF: dl OverworldMap32_Screen00_High
#_02FAE2: dl OverworldMap32_Screen00_High

#_02FAE5: dl OverworldMap32_Screen88_High
#_02FAE8: dl OverworldMap32_Screen89_High
#_02FAEB: dl OverworldMap32_Screen8A_High
#_02FAEE: dl OverworldMap32_Screen00_High

#_02FAF1: dl OverworldMap32_Screen00_High
#_02FAF4: dl OverworldMap32_Screen00_High
#_02FAF7: dl OverworldMap32_Screen00_High
#_02FAFA: dl OverworldMap32_Screen00_High

#_02FAFD: dl OverworldMap32_Screen00_High
#_02FB00: dl OverworldMap32_Screen00_High
#_02FB03: dl OverworldMap32_Screen00_High
#_02FB06: dl OverworldMap32_Screen88_High

#_02FB09: dl OverworldMap32_Screen80_High
#_02FB0C: dl OverworldMap32_Screen95_High
#_02FB0F: dl OverworldMap32_Screen96_High
#_02FB12: dl OverworldMap32_Screen97_High

#_02FB15: dl OverworldMap32_Screen00_High
#_02FB18: dl OverworldMap32_Screen00_High
#_02FB1B: dl OverworldMap32_Screen00_High
#_02FB1E: dl OverworldMap32_Screen00_High

#_02FB21: dl OverworldMap32_Screen9C_High
#_02FB24: dl OverworldMap32_Screen97_High
#_02FB27: dl OverworldMap32_Screen9E_High
#_02FB2A: dl OverworldMap32_Screen9F_High

;===================================================================================================

OverworldLoad_Map32LPointers:
#_02FB2D: dl OverworldMap32_Screen00_Low
#_02FB30: dl OverworldMap32_Screen01_Low
#_02FB33: dl OverworldMap32_Screen02_Low
#_02FB36: dl OverworldMap32_Screen03_Low

#_02FB39: dl OverworldMap32_Screen04_Low
#_02FB3C: dl OverworldMap32_Screen05_Low
#_02FB3F: dl OverworldMap32_Screen06_Low
#_02FB42: dl OverworldMap32_Screen07_Low

#_02FB45: dl OverworldMap32_Screen08_Low
#_02FB48: dl OverworldMap32_Screen09_Low
#_02FB4B: dl OverworldMap32_Screen0A_Low
#_02FB4E: dl OverworldMap32_Screen0B_Low

#_02FB51: dl OverworldMap32_Screen0C_Low
#_02FB54: dl OverworldMap32_Screen0D_Low
#_02FB57: dl OverworldMap32_Screen0E_Low
#_02FB5A: dl OverworldMap32_Screen0F_Low

#_02FB5D: dl OverworldMap32_Screen10_Low
#_02FB60: dl OverworldMap32_Screen11_Low
#_02FB63: dl OverworldMap32_Screen12_Low
#_02FB66: dl OverworldMap32_Screen13_Low

#_02FB69: dl OverworldMap32_Screen14_Low
#_02FB6C: dl OverworldMap32_Screen15_Low
#_02FB6F: dl OverworldMap32_Screen16_Low
#_02FB72: dl OverworldMap32_Screen17_Low

#_02FB75: dl OverworldMap32_Screen18_Low
#_02FB78: dl OverworldMap32_Screen19_Low
#_02FB7B: dl OverworldMap32_Screen1A_Low
#_02FB7E: dl OverworldMap32_Screen1B_Low

#_02FB81: dl OverworldMap32_Screen1C_Low
#_02FB84: dl OverworldMap32_Screen1D_Low
#_02FB87: dl OverworldMap32_Screen1E_Low
#_02FB8A: dl OverworldMap32_Screen1F_Low

#_02FB8D: dl OverworldMap32_Screen20_Low
#_02FB90: dl OverworldMap32_Screen21_Low
#_02FB93: dl OverworldMap32_Screen22_Low
#_02FB96: dl OverworldMap32_Screen23_Low

#_02FB99: dl OverworldMap32_Screen24_Low
#_02FB9C: dl OverworldMap32_Screen25_Low
#_02FB9F: dl OverworldMap32_Screen26_Low
#_02FBA2: dl OverworldMap32_Screen27_Low

#_02FBA5: dl OverworldMap32_Screen28_Low
#_02FBA8: dl OverworldMap32_Screen29_Low
#_02FBAB: dl OverworldMap32_Screen2A_Low
#_02FBAE: dl OverworldMap32_Screen2B_Low

#_02FBB1: dl OverworldMap32_Screen2C_Low
#_02FBB4: dl OverworldMap32_Screen2D_Low
#_02FBB7: dl OverworldMap32_Screen2E_Low
#_02FBBA: dl OverworldMap32_Screen2F_Low

#_02FBBD: dl OverworldMap32_Screen30_Low
#_02FBC0: dl OverworldMap32_Screen31_Low
#_02FBC3: dl OverworldMap32_Screen32_Low
#_02FBC6: dl OverworldMap32_Screen33_Low

#_02FBC9: dl OverworldMap32_Screen34_Low
#_02FBCC: dl OverworldMap32_Screen35_Low
#_02FBCF: dl OverworldMap32_Screen36_Low
#_02FBD2: dl OverworldMap32_Screen37_Low

#_02FBD5: dl OverworldMap32_Screen38_Low
#_02FBD8: dl OverworldMap32_Screen39_Low
#_02FBDB: dl OverworldMap32_Screen3A_Low
#_02FBDE: dl OverworldMap32_Screen3B_Low

#_02FBE1: dl OverworldMap32_Screen3C_Low
#_02FBE4: dl OverworldMap32_Screen3D_Low
#_02FBE7: dl OverworldMap32_Screen3E_Low
#_02FBEA: dl OverworldMap32_Screen3F_Low

;===================================================================================================

#_02FBED: dl OverworldMap32_Screen40_Low
#_02FBF0: dl OverworldMap32_Screen41_Low
#_02FBF3: dl OverworldMap32_Screen42_Low
#_02FBF6: dl OverworldMap32_Screen43_Low

#_02FBF9: dl OverworldMap32_Screen44_Low
#_02FBFC: dl OverworldMap32_Screen45_Low
#_02FBFF: dl OverworldMap32_Screen46_Low
#_02FC02: dl OverworldMap32_Screen47_Low

#_02FC05: dl OverworldMap32_Screen48_Low
#_02FC08: dl OverworldMap32_Screen49_Low
#_02FC0B: dl OverworldMap32_Screen0A_Low
#_02FC0E: dl OverworldMap32_Screen4B_Low

#_02FC11: dl OverworldMap32_Screen4C_Low
#_02FC14: dl OverworldMap32_Screen4D_Low
#_02FC17: dl OverworldMap32_Screen4E_Low
#_02FC1A: dl OverworldMap32_Screen4F_Low

#_02FC1D: dl OverworldMap32_Screen50_Low
#_02FC20: dl OverworldMap32_Screen11_Low
#_02FC23: dl OverworldMap32_Screen12_Low
#_02FC26: dl OverworldMap32_Screen53_Low

#_02FC29: dl OverworldMap32_Screen54_Low
#_02FC2C: dl OverworldMap32_Screen55_Low
#_02FC2F: dl OverworldMap32_Screen56_Low
#_02FC32: dl OverworldMap32_Screen17_Low

#_02FC35: dl OverworldMap32_Screen58_Low
#_02FC38: dl OverworldMap32_Screen59_Low
#_02FC3B: dl OverworldMap32_Screen5A_Low
#_02FC3E: dl OverworldMap32_Screen5B_Low

#_02FC41: dl OverworldMap32_Screen5C_Low
#_02FC44: dl OverworldMap32_Screen5D_Low
#_02FC47: dl OverworldMap32_Screen5E_Low
#_02FC4A: dl OverworldMap32_Screen5F_Low

#_02FC4D: dl OverworldMap32_Screen60_Low
#_02FC50: dl OverworldMap32_Screen61_Low
#_02FC53: dl OverworldMap32_Screen62_Low
#_02FC56: dl OverworldMap32_Screen63_Low

#_02FC59: dl OverworldMap32_Screen64_Low
#_02FC5C: dl OverworldMap32_Screen25_Low
#_02FC5F: dl OverworldMap32_Screen66_Low
#_02FC62: dl OverworldMap32_Screen67_Low

#_02FC65: dl OverworldMap32_Screen68_Low
#_02FC68: dl OverworldMap32_Screen69_Low
#_02FC6B: dl OverworldMap32_Screen2A_Low
#_02FC6E: dl OverworldMap32_Screen2B_Low

#_02FC71: dl OverworldMap32_Screen2C_Low
#_02FC74: dl OverworldMap32_Screen6D_Low
#_02FC77: dl OverworldMap32_Screen2E_Low
#_02FC7A: dl OverworldMap32_Screen2F_Low

#_02FC7D: dl OverworldMap32_Screen70_Low
#_02FC80: dl OverworldMap32_Screen71_Low
#_02FC83: dl OverworldMap32_Screen72_Low
#_02FC86: dl OverworldMap32_Screen33_Low

#_02FC89: dl OverworldMap32_Screen34_Low
#_02FC8C: dl OverworldMap32_Screen75_Low
#_02FC8F: dl OverworldMap32_Screen76_Low
#_02FC92: dl OverworldMap32_Screen37_Low

#_02FC95: dl OverworldMap32_Screen78_Low
#_02FC98: dl OverworldMap32_Screen79_Low
#_02FC9B: dl OverworldMap32_Screen7A_Low
#_02FC9E: dl OverworldMap32_Screen3B_Low

#_02FCA1: dl OverworldMap32_Screen3C_Low
#_02FCA4: dl OverworldMap32_Screen7D_Low
#_02FCA7: dl OverworldMap32_Screen7E_Low
#_02FCAA: dl OverworldMap32_Screen3F_Low

;===================================================================================================

#_02FCAD: dl OverworldMap32_Screen80_Low
#_02FCB0: dl OverworldMap32_Screen81_Low
#_02FCB3: dl OverworldMap32_Screen82_Low
#_02FCB6: dl OverworldMap32_Screen00_Low

#_02FCB9: dl OverworldMap32_Screen00_Low
#_02FCBC: dl OverworldMap32_Screen00_Low
#_02FCBF: dl OverworldMap32_Screen00_Low
#_02FCC2: dl OverworldMap32_Screen00_Low

#_02FCC5: dl OverworldMap32_Screen88_Low
#_02FCC8: dl OverworldMap32_Screen89_Low
#_02FCCB: dl OverworldMap32_Screen8A_Low
#_02FCCE: dl OverworldMap32_Screen00_Low

#_02FCD1: dl OverworldMap32_Screen00_Low
#_02FCD4: dl OverworldMap32_Screen00_Low
#_02FCD7: dl OverworldMap32_Screen00_Low
#_02FCDA: dl OverworldMap32_Screen00_Low

#_02FCDD: dl OverworldMap32_Screen00_Low
#_02FCE0: dl OverworldMap32_Screen00_Low
#_02FCE3: dl OverworldMap32_Screen00_Low
#_02FCE6: dl OverworldMap32_Screen88_Low

#_02FCE9: dl OverworldMap32_Screen80_Low
#_02FCEC: dl OverworldMap32_Screen95_Low
#_02FCEF: dl OverworldMap32_Screen96_Low
#_02FCF2: dl OverworldMap32_Screen97_Low

#_02FCF5: dl OverworldMap32_Screen00_Low
#_02FCF8: dl OverworldMap32_Screen00_Low
#_02FCFB: dl OverworldMap32_Screen00_Low
#_02FCFE: dl OverworldMap32_Screen00_Low

#_02FD01: dl OverworldMap32_Screen9C_Low
#_02FD04: dl OverworldMap32_Screen97_Low
#_02FD07: dl OverworldMap32_Screen9E_Low
#_02FD0A: dl OverworldMap32_Screen9F_Low

;===================================================================================================

LoadOverworldOverlay:
#_02FD0D: REP #$30

#_02FD0F: JSR OverworldLoad_LoadSubOverlayMap32

#_02FD12: LDA.w #$1000
#_02FD15: STA.b $CC

#_02FD17: SEP #$30

#_02FD19: JSR BuildBGOverlayFromMap16

#_02FD1C: LDA.b #$04
#_02FD1E: STA.b $17
#_02FD20: STA.w $0710

#_02FD23: INC.b $11

#_02FD25: RTS

;===================================================================================================

BuildBGOverlayFromMap16:
#_02FD26: PHB

#_02FD27: LDA.b #Map16Definitions>>16
#_02FD29: PHA
#_02FD2A: PLB

#_02FD2B: REP #$30

#_02FD2D: LDA.w #$7E4000
#_02FD30: STA.b $04

#_02FD32: LDA.w #$007E

#_02FD35: BRA .start

;===================================================================================================

#BuildOverworldMapFromMap16:
#_02FD37: PHB

#_02FD38: LDA.b #Map16Definitions>>16
#_02FD3A: PHA
#_02FD3B: PLB

#_02FD3C: REP #$30

#_02FD3E: LDA.w #$7E2000
#_02FD41: STA.b $04

#_02FD43: LDA.w #$007E

;===================================================================================================

.start
#_02FD46: STA.b $06

#_02FD48: LDA.b $84
#_02FD4A: CLC
#_02FD4B: ADC.w #$1000
#_02FD4E: STA.b $84

#_02FD50: STZ.b $0A
#_02FD52: STZ.b $0E

#_02FD54: LDA.w #$0010
#_02FD57: STA.b $08

;---------------------------------------------------------------------------------------------------

.next
#_02FD59: JSR OverworldCopyMap16ToBuffer

#_02FD5C: LDA.b $84
#_02FD5E: SEC
#_02FD5F: SBC.w #$0080
#_02FD62: STA.b $84

#_02FD64: LDA.b $88
#_02FD66: DEC A
#_02FD67: AND.w #$001F
#_02FD6A: STA.b $88

#_02FD6C: JSR OverworldCopyMap16ToBuffer

#_02FD6F: LDA.b $84
#_02FD71: SEC
#_02FD72: SBC.w #$0080
#_02FD75: STA.b $84

#_02FD77: LDA.b $88
#_02FD79: DEC A
#_02FD7A: AND.w #$001F
#_02FD7D: STA.b $88

#_02FD7F: DEC.b $08
#_02FD81: BNE .next

;---------------------------------------------------------------------------------------------------

#_02FD83: SEP #$30

#_02FD85: PLB

#_02FD86: RTS

;===================================================================================================

OverworldCopyMap16ToBuffer:
#_02FD87: LDA.b $84
#_02FD89: SEC
#_02FD8A: SBC.w #$0410
#_02FD8D: AND.w #$1FFF
#_02FD90: TAY

#_02FD91: LDA.b $86
#_02FD93: ASL A
#_02FD94: TAX

#_02FD95: LDA.w #$0010
#_02FD98: STA.b $00

;---------------------------------------------------------------------------------------------------

.next
#_02FD9A: LDA.b [$04],Y
#_02FD9C: STA.w $0500,X

#_02FD9F: INX
#_02FDA0: INX

#_02FDA1: TXA
#_02FDA2: AND.w #$003F
#_02FDA5: TAX

#_02FDA6: INY
#_02FDA7: INY

#_02FDA8: TYA
#_02FDA9: AND.w #$1FFF
#_02FDAC: TAY

;---------------------------------------------------------------------------------------------------

#_02FDAD: LDA.b [$04],Y
#_02FDAF: STA.w $0500,X

#_02FDB2: INX
#_02FDB3: INX

#_02FDB4: TXA
#_02FDB5: AND.w #$003F
#_02FDB8: TAX

#_02FDB9: INY
#_02FDBA: INY

#_02FDBB: TYA
#_02FDBC: AND.w #$1FFF
#_02FDBF: TAY

#_02FDC0: DEC.b $00
#_02FDC2: BNE .next

;---------------------------------------------------------------------------------------------------

#_02FDC4: LDA.b $88
#_02FDC6: STA.b $02

#_02FDC8: CMP.w #$0010
#_02FDCB: BCC .not_lower_half_yet

#_02FDCD: AND.w #$000F
#_02FDD0: STA.b $02

#_02FDD2: LDA.w #$0800
#_02FDD5: STA.b $00

.not_lower_half_yet
#_02FDD7: LDA.b $02

#_02FDD9: ASL A
#_02FDDA: ASL A
#_02FDDB: ASL A
#_02FDDC: ASL A
#_02FDDD: ASL A
#_02FDDE: ASL A

#_02FDDF: CLC
#_02FDE0: ADC.b $00
#_02FDE2: STA.b $00

#_02FDE4: LDA.l Map16BufferOffsetLow
#_02FDE8: JSR OverworldCopyOneMap16Segment

#_02FDEB: LDA.b $00
#_02FDED: CLC
#_02FDEE: ADC.w #$0400
#_02FDF1: STA.b $00

#_02FDF3: LDA.l Map16BufferOffsetHigh

;===================================================================================================

OverworldCopyOneMap16Segment:
#_02FDF7: STA.b $02

#_02FDF9: LDX.b $0A

#_02FDFB: LDA.b $00
#_02FDFD: ORA.b $CC
#_02FDFF: STA.l $7F4000,X

#_02FE03: INX
#_02FE04: INX
#_02FE05: STX.b $0A

#_02FE07: LDX.b $0E

#_02FE09: LDA.w #$0010
#_02FE0C: STA.b $0C

;---------------------------------------------------------------------------------------------------

.next
#_02FE0E: LDY.b $02

#_02FE10: LDA.w $0500,Y

#_02FE13: INY
#_02FE14: INY
#_02FE15: STY.b $02

#_02FE17: ASL A
#_02FE18: ASL A
#_02FE19: ASL A
#_02FE1A: TAY

#_02FE1B: LDA.w Map16Definitions+0,Y
#_02FE1E: STA.l $7F2000,X

#_02FE22: LDA.w Map16Definitions+4,Y
#_02FE25: STA.l $7F2040,X

#_02FE29: INX
#_02FE2A: INX

#_02FE2B: LDA.w Map16Definitions+2,Y
#_02FE2E: STA.l $7F2000,X

#_02FE32: LDA.w Map16Definitions+6,Y
#_02FE35: STA.l $7F2040,X

#_02FE39: INX
#_02FE3A: INX

#_02FE3B: DEC.b $0C
#_02FE3D: BNE .next

;---------------------------------------------------------------------------------------------------

#_02FE3F: TXA
#_02FE40: CLC
#_02FE41: ADC.w #$0040
#_02FE44: STA.b $0E

#_02FE46: RTS

;===================================================================================================

MirrorBonk_RecoverChangedTiles:
#_02FE47: REP #$30

#_02FE49: LDA.w $04AC
#_02FE4C: BEQ .exit

#_02FE4E: LDX.w #$0000
#_02FE51: STX.b $00

;---------------------------------------------------------------------------------------------------

.next
#_02FE53: LDX.b $00

#_02FE55: LDA.l $7EF800,X
#_02FE59: TAY

#_02FE5A: LDA.l $7EFA00,X
#_02FE5E: TYX

#_02FE5F: STA.l $7E2000,X

#_02FE63: INC.b $00
#_02FE65: INC.b $00

#_02FE67: LDA.b $00
#_02FE69: CMP.w $04AC
#_02FE6C: BNE .next

;---------------------------------------------------------------------------------------------------

.exit
#_02FE6E: SEP #$30

#_02FE70: RTS

;===================================================================================================

DecompressEnemyDamageSubclasses:
#_02FE71: LDA.b #$7F4000>>0
#_02FE73: STA.b $00

#_02FE75: LDA.b #$7F4000>>8
#_02FE77: STA.b $01

#_02FE79: LDA.b #$7F4000>>16
#_02FE7B: STA.b $02

#_02FE7D: LDA.b #EnemyDamageCompressed>>0
#_02FE7F: STA.b $C8

#_02FE81: LDA.b #EnemyDamageCompressed>>8
#_02FE83: STA.b $C9

#_02FE85: LDA.b #EnemyDamageCompressed>>16
#_02FE87: STA.b $CA

;---------------------------------------------------------------------------------------------------

#_02FE89: JSR Decompress_bank02

#_02FE8C: LDA.b #$7F4000>>0
#_02FE8E: STA.b $00

#_02FE90: LDA.b #$7F4000>>8
#_02FE92: STA.b $01

#_02FE94: LDA.b #$7F4000>>16
#_02FE96: STA.b $02

#_02FE98: REP #$10

#_02FE9A: LDX.w #$0000
#_02FE9D: TXY

;---------------------------------------------------------------------------------------------------

.next
#_02FE9E: LDA.b [$00],Y
#_02FEA0: PHA

#_02FEA1: LSR A
#_02FEA2: LSR A
#_02FEA3: LSR A
#_02FEA4: LSR A
#_02FEA5: STA.l $7F6000+0,X

#_02FEA9: PLA
#_02FEAA: AND.b #$0F
#_02FEAC: STA.l $7F6000+1,X

#_02FEB0: INY

#_02FEB1: INX
#_02FEB2: INX
#_02FEB3: CPX.w #$1000
#_02FEB6: BCC .next

;---------------------------------------------------------------------------------------------------

#_02FEB8: SEP #$30

#_02FEBA: RTL

;===================================================================================================

Decompress_bank02:
#_02FEBB: REP #$10

#_02FEBD: LDY.w #$0000

.next_byte
#_02FEC0: JSR .read_next_byte

#_02FEC3: CMP.b #$FF
#_02FEC5: BNE .continue

#_02FEC7: SEP #$10

#_02FEC9: RTS

;---------------------------------------------------------------------------------------------------

.continue
#_02FECA: STA.b $CD

#_02FECC: AND.b #$E0
#_02FECE: CMP.b #$E0
#_02FED0: BEQ .expanded

#_02FED2: PHA

#_02FED3: LDA.b $CD

#_02FED5: REP #$20

#_02FED7: AND.w #$001F
#_02FEDA: BRA .normal

;---------------------------------------------------------------------------------------------------

.expanded
#_02FEDC: LDA.b $CD
#_02FEDE: ASL A
#_02FEDF: ASL A
#_02FEE0: ASL A
#_02FEE1: AND.b #$E0
#_02FEE3: PHA

#_02FEE4: LDA.b $CD
#_02FEE6: AND.b #$03
#_02FEE8: XBA

#_02FEE9: JSR .read_next_byte

#_02FEEC: REP #$20

;---------------------------------------------------------------------------------------------------

.normal
#_02FEEE: INC A
#_02FEEF: STA.b $CB

#_02FEF1: SEP #$20

#_02FEF3: PLA
#_02FEF4: BEQ .nonrepeating
#_02FEF6: BMI .copy

#_02FEF8: ASL A
#_02FEF9: BPL .repeating8

#_02FEFB: ASL A
#_02FEFC: BPL .repeating16

;---------------------------------------------------------------------------------------------------

#_02FEFE: JSR .read_next_byte

#_02FF01: LDX.b $CB

.next_incremental
#_02FF03: STA.b [$00],Y

#_02FF05: INC A
#_02FF06: INY

#_02FF07: DEX
#_02FF08: BNE .next_incremental

#_02FF0A: BRA .next_byte

;---------------------------------------------------------------------------------------------------

.nonrepeating
.next_nonrepeating
#_02FF0C: JSR .read_next_byte

#_02FF0F: STA.b [$00],Y
#_02FF11: INY

#_02FF12: LDX.b $CB
#_02FF14: DEX
#_02FF15: STX.b $CB

#_02FF17: BNE .next_nonrepeating

#_02FF19: BRA .next_byte

;---------------------------------------------------------------------------------------------------

.repeating8
#_02FF1B: JSR .read_next_byte

#_02FF1E: LDX.b $CB

.next_repeating8
#_02FF20: STA.b [$00],Y

#_02FF22: INY

#_02FF23: DEX
#_02FF24: BNE .next_repeating8

#_02FF26: BRA .next_byte

;---------------------------------------------------------------------------------------------------

.repeating16
#_02FF28: JSR .read_next_byte
#_02FF2B: XBA

#_02FF2C: JSR .read_next_byte
#_02FF2F: LDX.b $CB

.next_repeating16
#_02FF31: XBA
#_02FF32: STA.b [$00],Y

#_02FF34: INY

#_02FF35: DEX
#_02FF36: BEQ .done16

#_02FF38: XBA
#_02FF39: STA.b [$00],Y

#_02FF3B: INY

#_02FF3C: DEX
#_02FF3D: BNE .next_repeating16

.done16
#_02FF3F: JMP.w .next_byte

;---------------------------------------------------------------------------------------------------

.copy
#_02FF42: JSR .read_next_byte
#_02FF45: XBA

#_02FF46: JSR .read_next_byte
#_02FF49: TAX

.next_copy
#_02FF4A: PHY
#_02FF4B: TXY

#_02FF4C: LDA.b [$00],Y

#_02FF4E: TYX
#_02FF4F: PLY

.do_copy
#_02FF50: STA.b [$00],Y

#_02FF52: INY
#_02FF53: INX

#_02FF54: REP #$20

#_02FF56: DEC.b $CB

#_02FF58: SEP #$20

#_02FF5A: BNE .next_copy

#_02FF5C: JMP.w .next_byte

;---------------------------------------------------------------------------------------------------

.read_next_byte
#_02FF5F: LDA.b [$C8]

#_02FF61: LDX.b $C8

#_02FF63: INX
#_02FF64: BNE .exit

#_02FF66: LDX.b #$00
#_02FF68: BRA .do_copy

.unreachable
#_02FF6A: DEX

.exit
#_02FF6B: STX.b $C8

#_02FF6D: RTS

;===================================================================================================
; FREE ROM: 0x92
;===================================================================================================
NULL_02FF6E:
#_02FF6E: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FF76: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FF7E: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FF86: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FF8E: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FF96: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FF9E: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FFA6: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FFAE: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FFB6: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FFBE: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FFC6: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FFCE: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FFD6: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FFDE: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FFE6: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FFEE: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FFF6: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_02FFFE: db $FF, $FF

;===================================================================================================
