org $028000

;===================================================================================================

Intro_SetupScreen:
|028000| LDA.b #$80
|028002| STA.w $0710

|028005| JSL EnableForceBlank

|028009| LDA.b #$10
|02800B| STA.b $1C
|02800D| STZ.b $1D

|02800F| JSR Intro_InitializeBackgroundSettings

|028012| LDA.b #$20
|028014| STA.b $99

|028016| LDA.b #$02
|028018| STA.w OBSEL

|02801B| LDA.b #$14
|02801D| STA.w $0AAA

|028020| JSL LoadChrHalfSlot

|028024| STZ.w $0AAA

|028027| JSR LoadOWMusicIfNeeded

|02802A| REP #$20

|02802C| LDX.b #$80
|02802E| STX.w VMAIN

|028031| LDA.w #$27F0 ; VRAM $4FE0
|028034| STA.w VMADDR

|028037| LDX.b #$20

|028039| LDA.w #$7FFF ; RGB: #F8F8F8

.clear_next
|02803C| STZ.w VMDATA

|02803F| STA.l $7EC620,X

|028043| DEX
|028044| DEX
|028045| BPL .clear_next

|028047| LDA.w #$1FFE
|02804A| STA.b $C8

|02804C| LDA.w #$1BFE
|02804F| STA.b $CA

|028051| SEP #$20

|028053| RTL

;===================================================================================================

Intro_InitializeSRAMWRAM:
|028054| REP #$30

|028056| STZ.b $00

.next_file_check
|028058| LDX.b $00

|02805A| LDA.l SaveFileCopyOffsets,X
|02805E| TAX

|02805F| PHX

|028060| LDY.w #$0000
|028063| TYA

.calc_checksum_main
|028064| CLC
|028065| ADC.l $700000,X

|028069| INX
|02806A| INX

|02806B| INY
|02806C| CPY.w #$0280
|02806F| BNE .calc_checksum_main

|028071| PLX

|028072| CMP.w #$5A5A
|028075| BEQ .checksum_good

;---------------------------------------------------------------------------------------------------

|028077| PHX

|028078| LDY.w #$0000
|02807B| TYA

.calc_checksum_backup
|02807C| CLC
|02807D| ADC.l $700F00,X

|028081| INX
|028082| INX

|028083| INY
|028084| CPY.w #$0280
|028087| BNE .calc_checksum_backup

|028089| PLX

|02808A| CMP.w #$5A5A
|02808D| BNE ClearAnSRAMFile

;---------------------------------------------------------------------------------------------------

|02808F| LDY.w #$0000

.copy_from_backup
|028092| LDA.l $700F00,X
|028096| STA.l $700000,X

|02809A| LDA.l $701000,X
|02809E| STA.l $700100,X

|0280A2| LDA.l $701100,X
|0280A6| STA.l $700200,X

|0280AA| LDA.l $701200,X
|0280AE| STA.l $700300,X

|0280B2| LDA.l $701300,X
|0280B6| STA.l $700400,X

|0280BA| INX
|0280BB| INX

|0280BC| INY
|0280BD| CPY.w #$0080
|0280C0| BNE .copy_from_backup

;---------------------------------------------------------------------------------------------------

.checksum_good
|0280C2| INC.b $00
|0280C4| INC.b $00

|0280C6| LDX.b $00
|0280C8| CPX.w #$0006
|0280CB| BNE .next_file_check

;---------------------------------------------------------------------------------------------------

|0280CD| LDX.w #$00FE

.clear_next_sprite_prop
|0280D0| STZ.w $0D00,X
|0280D3| STZ.w $0E00,X
|0280D6| STZ.w $0F00,X

|0280D9| DEX
|0280DA| DEX
|0280DB| BPL .clear_next_sprite_prop

|0280DD| SEP #$30

|0280DF| RTL

;===================================================================================================

#ClearAnSRAMFile:
|0280E0| LDY.w #$0000
|0280E3| TYA

.clear_next
|0280E4| STA.l $700F00,X
|0280E8| STA.l $700000,X
|0280EC| STA.l $701000,X
|0280F0| STA.l $700100,X
|0280F4| STA.l $701100,X
|0280F8| STA.l $700200,X
|0280FC| STA.l $701200,X
|028100| STA.l $700300,X
|028104| STA.l $701300,X
|028108| STA.l $700400,X

|02810C| INX
|02810D| INX

|02810E| INY
|02810F| CPY.w #$0080
|028112| BNE .clear_next

;---------------------------------------------------------------------------------------------------

|028114| BRA .checksum_good

;===================================================================================================

Intro_LoadTextAndPalettes:
|028116| JSL CreateMessagePointers

;---------------------------------------------------------------------------------------------------

Intro_LoadAllPalettes_long:
|02811A| JSR Intro_LoadAllPalettes

|02811D| RTL

;===================================================================================================

AnimatedTileSheets:
|02811E| db $5D, $5D, $5D, $5D, $5D, $5D, $5D, $5F
|028126| db $5D, $5F, $5F, $5E, $5F, $5E, $5E, $5D
|02812E| db $5D, $5E, $5D, $5D, $5D, $5D, $5D, $5D

;===================================================================================================

Module05_LoadFile:
|028136| JSL EnableForceBlank

|02813A| STZ.w $0200

|02813D| STZ.w $03F4

|028140| STZ.w $02D4
|028143| STZ.w $02D7

|028146| STZ.w $02F9

|028149| STZ.w $0379

|02814C| STZ.w $03FD

|02814F| JSL EraseTilemaps_normal

|028153| LDA.b #$02
|028155| STA.w OBSEL

|028158| JSL LoadDefaultGraphics
|02815C| JSL Sprite_LoadGraphicsProperties
|028160| JSL LoadDefaultTileTypes

|028164| JSL DecompressSwordGraphics
|028168| JSL DecompressShieldGraphics

|02816C| JSL InitializeLink

|028170| JSL LoadFollowerGraphics

|028174| LDA.b #$46
|028176| STA.l $7EC2FC
|02817A| STA.l $7EC2FD
|02817E| STA.l $7EC2FE
|028182| STA.l $7EC2FF

|028186| STZ.w $02CD

|028189| LDA.b #$02
|02818B| STA.w $02CE

|02818E| LDA.b #$30
|028190| STA.b $FF

|028192| LDA.l $7EF3CA
|028196| BEQ .light_world

|028198| LDA.b $1B
|02819A| BNE LoadUnderworldRoomRebuildHUD

|02819C| JSL SearchForEquippedItem_long
|0281A0| JSL RebuildHUD_long2
|0281A4| JSL UpdateEquippedItem_long

|0281A8| STZ.w $010A

|0281AB| LDA.b #$20 ; ROOM 0020
|0281AD| STA.b $A0
|0281AF| STZ.b $A1

|0281B1| LDA.b #$08
|0281B3| STA.b $10
|0281B5| STZ.b $11
|0281B7| STZ.b $B0

|0281B9| STZ.w $04AA

|0281BC| RTL

;---------------------------------------------------------------------------------------------------

.light_world
|0281BD| LDA.l $7EC011
|0281C1| BNE LoadUnderworldRoomRebuildHUD

|0281C3| LDA.w $010A
|0281C6| BEQ .not_continue

|0281C8| LDA.w $04AA
|0281CB| BEQ LoadUnderworldRoomRebuildHUD

.not_continue
|0281CD| LDA.l $7EF3C5
|0281D1| CMP.b #$02
|0281D3| BCC LoadUnderworldRoomRebuildHUD

|0281D5| LDA.l $7EF3C8
|0281D9| CMP.b #$05
|0281DB| BEQ LoadUnderworldRoomRebuildHUD

|0281DD| REP #$10

|0281DF| LDX.w #$0185 ; MESSAGE 0185

|0281E2| LDA.l $7EF353
|0281E6| CMP.b #$02
|0281E8| BEQ .no_mirror

|0281EA| LDX.w #$0184 ; MESSAGE 0184

.no_mirror
|0281ED| STX.w $1CF0

|0281F0| SEP #$10

|0281F2| JSL PrepAndDisplayMessage
|0281F6| JSR LoadUnderworldPalettes

|0281F9| LDA.b #$0F
|0281FB| STA.b $13

|0281FD| LDA.b #$04
|0281FF| STA.b $1C
|028201| STZ.b $1D

|028203| LDA.b #$1B
|028205| STA.b $10

|028207| RTL

;===================================================================================================

LoadUnderworldRoomRebuildHUD:
|028208| LDA.b #$00
|02820A| STA.l $7EC011

|02820E| ORA.b #$07
|028210| STA.b $95

|028212| JSL SearchForEquippedItem_long
|028216| JSL RebuildHUD_long2
|02821A| JSL UpdateEquippedItem_long

;===================================================================================================

Module06_UnderworldLoad:
|02821E| REP #$20

|028220| LDA.w #$0005 ; SFX1.05
|028223| STA.w $012D

|028226| STZ.b $A0
|028228| STZ.b $A2

|02822A| STZ.w $0402

|02822D| LDA.w #$0000
|028230| STA.l $7EC019
|028234| STA.l $7EC01B
|028238| STA.l $7EC01D
|02823C| STA.l $7EC01F
|028240| STA.l $7EC021
|028244| STA.l $7EC023

|028248| SEP #$20

|02824A| JSR LoadUnderworldEntrance

|02824D| LDA.w $040C
|028250| CMP.b #$FF ; DUNGEON FF
|028252| BEQ .cave

|028254| CMP.b #$02 ; DUNGEON 02
|028256| BNE .not_castle

|028258| LDA.b #$00 ; DUNGEON 00

.not_castle
|02825A| LSR A
|02825B| TAX

|02825C| LDA.l $7EF37C,X

.cave
|028260| JSL RebuildHUD_Keys

|028264| STZ.w $045A
|028267| STZ.w $0458

|02826A| JSR LoadAndDrawRoom
|02826D| JSL LoadUnderworldTileTypes

;---------------------------------------------------------------------------------------------------

|028271| LDX.w $0AA1

|028274| LDA.l AnimatedTileSheets,X
|028278| TAY

|028279| JSL DecompressAnimatedUnderworldTiles
|02827D| JSL LoadEveryObjectAttributeSet

|028281| LDA.b #$0A
|028283| STA.w $0AA4

|028286| JSL InitializeTilesets

|02828A| LDA.b #$0A
|02828C| STA.w $0AB1

|02828F| JSR LoadUnderworldPalettes

|028292| LDA.w $02E0
|028295| ORA.b $56
|028297| BEQ .not_bunny

|028299| JSL RefreshEquipmentPalettes_bunny

.not_bunny
|02829D| REP #$30

|02829F| LDA.b $A0
|0282A1| AND.w #$000F
|0282A4| ASL A
|0282A5| XBA
|0282A6| STA.w $062C

|0282A9| LDA.b $A0
|0282AB| AND.w #$0FF0
|0282AE| LSR A
|0282AF| LSR A
|0282B0| LSR A
|0282B1| XBA
|0282B2| STA.w $062E

|0282B5| LDA.b $A0
|0282B7| CMP.w #$0104 ; ROOM 0104
|0282BA| BNE .use_current_entrance

|0282BC| LDA.l $7EF3C6
|0282C0| AND.w #$0010
|0282C3| BEQ .use_current_entrance

|0282C5| LDA.w #$0000
|0282C8| STA.l $7EC005

;---------------------------------------------------------------------------------------------------

.use_current_entrance
|0282CC| SEP #$30

|0282CE| JSL SetAndSaveVisitedQuadrantFlags

|0282D2| LDA.b #$02
|0282D4| STA.b $99

|0282D6| LDA.b #$B3
|0282D8| STA.b $9A

|0282DA| LDX.w $045A

|0282DD| LDA.l $7EC005
|0282E1| BNE .do_fade

|0282E3| LDX.b #$03
|0282E5| LDY.w $0414
|0282E8| BEQ .no_room_effect

|0282EA| LDA.b #$32
|0282EC| CPY.b #$07
|0282EE| BEQ .set_room_effect

|0282F0| LDA.b #$62
|0282F2| CPY.b #$04
|0282F4| BEQ .set_room_effect

.no_room_effect
|0282F6| LDA.b #$20

.set_room_effect
|0282F8| STA.b $9A

.do_fade
|0282FA| LDA.l RoomEffectFixedColors,X
|0282FE| STA.l $7EC017

|028302| JSL ApplyGrayscaleFixed_Parameterized

|028306| LDA.b #$1F
|028308| STA.l $7EC007

|02830C| LDA.b #$00
|02830E| STA.l $7EC00B

|028312| LDA.b #$02
|028314| STA.l $7EC009

|028318| STZ.w $0AA9

|02831B| STZ.b $57

|02831D| STZ.b $3A
|02831F| STZ.b $3C

;---------------------------------------------------------------------------------------------------

|028321| JSR ResetLampconeAndLink
|028324| JSL CheckIfBunny
|028328| JSR ResetThenCacheRoomEntryProperties

|02832B| LDA.l $7EF3CC
|02832F| CMP.b #$0D ; FOLLOWER 0D
|028331| BNE .not_superbomb

|028333| LDA.b #$00
|028335| STA.l $7EF3CC

|028339| STZ.w $04B4

|02833C| JSL HideHUDTimer

.not_superbomb
|028340| LDA.b #$09
|028342| STA.b $94

|028344| JSL InitializeFollower
|028348| JSL ResetAllSprites
|02834C| JSL Underworld_ResetSprites

|028350| STZ.w $02F0

|028353| INC.w $04C7

|028356| LDA.l $7EF3C5
|02835A| BNE .not_bed_cutscene

|02835C| LDA.l $7EF3C6
|028360| AND.b #$10
|028362| BNE .not_bed_cutscene

|028364| LDA.b #$30 ; Fixed color RGB: #808000
|028366| STA.b $9C

|028368| LDA.b #$50
|02836A| STA.b $9D

|02836C| LDA.b #$80
|02836E| STA.b $9E

|028370| LDA.b #$00
|028372| STA.l $7EC005
|028376| STA.l $7EC006

|02837A| JSL TuckLinkIntoBed

;---------------------------------------------------------------------------------------------------

.not_bed_cutscene
|02837E| LDA.b #$07
|028380| STA.w $010C
|028383| STA.b $10

|028385| LDA.b #$0F
|028387| STA.b $11

|028389| JSR LoadUnderworldSongBankIfNeeded

;===================================================================================================

UnderworldAdjustRainSFX:
|02838C| LDA.l $7EF3C5
|028390| CMP.b #$02
|028392| BCS .exit

|028394| LDA.b #$05 ; SFX1.05
|028396| STA.w $012D

|028399| LDA.b $A4
|02839B| BMI .exit

|02839D| REP #$20

|02839F| LDA.b $A0
|0283A1| CMP.w #$0002 ; ROOM 0002
|0283A4| BEQ .exit

|0283A6| CMP.w #$0012 ; ROOM 0012
|0283A9| BEQ .exit

|0283AB| SEP #$20

|0283AD| LDA.b #$03 ; SFX1.03
|0283AF| STA.w $012D

.exit
|0283B2| SEP #$20

|0283B4| RTL

;===================================================================================================

CacheRoomEntryProperties_long:
|0283B5| JSR CacheRoomEntryProperties

|0283B8| RTL

;===================================================================================================

OverworldLoadSubmodules:
|0283B9| dw Module08_00_LoadProperties
|0283BB| dw Overworld_LoadSubscreenAndSilenceSFX1
|0283BD| dw Module08_02_LoadAndAdvance

;===================================================================================================

Module08_OverworldLoad:
Module0A_OverworldSpecialLoad:
|0283BF| LDA.b $11
|0283C1| ASL A
|0283C2| TAX

|0283C3| JSR (OverworldLoadSubmodules,X)

|0283C6| RTL

;===================================================================================================

Module08_00_LoadProperties:
|0283C7| LDA.b #$82
|0283C9| STA.b $99

|0283CB| STZ.w $03F4

|0283CE| JSL AdjustLinkBunnyStatus

|0283D2| LDA.b $10
|0283D4| CMP.b #$08
|0283D6| BNE .special_overworld_a

|0283D8| JSR LoadOverworldFromUnderworld
|0283DB| BRA .continue_a

.special_overworld_a
|0283DD| JSR LoadOverworldFromSpecialOverworld

;---------------------------------------------------------------------------------------------------

.continue_a
|0283E0| JSL AdjustOverworldAmbiance

|0283E4| LDA.b #$FF
|0283E6| STA.l $7EF36F

|0283EA| JSL HandleItemRefills

|0283EE| LDY.b #$58
|0283F0| LDX.b #$02 ; SONG 02

|0283F2| LDA.b $8A
|0283F4| CMP.b #$03 ; OW 03
|0283F6| BEQ .death_mountain

|0283F8| CMP.b #$05 ; OW 05
|0283FA| BEQ .death_mountain

|0283FC| CMP.b #$07 ; OW 07
|0283FE| BEQ .death_mountain

|028400| LDX.b #$09 ; SONG 09

|028402| LDA.b $8A
|028404| CMP.b #$43 ; OW 43
|028406| BEQ .death_mountain

|028408| CMP.b #$45 ; OW 45
|02840A| BEQ .death_mountain

|02840C| CMP.b #$47 ; OW 47
|02840E| BEQ .death_mountain

|028410| LDY.b #$5A

|028412| LDA.b $8A
|028414| CMP.b #$40
|028416| BCS .dark_world

|028418| LDX.b #$07 ; SONG 07

|02841A| LDA.l $7EF3C5
|02841E| CMP.b #$03
|028420| BCC .aga_alive

|028422| LDX.b #$02 ; SONG 02

.aga_alive
|028424| LDA.b $A0
|028426| CMP.b #$E3 ; ROOM 00E3
|028428| BEQ .death_mountain

|02842A| CMP.b #$18 ; ROOM 0118
|02842C| BEQ .death_mountain

|02842E| CMP.b #$2F ; ROOM 002F
|028430| BEQ .death_mountain

|028432| LDA.b $A0
|028434| CMP.b #$1F ; ROOM 011F
|028436| BNE .not_kakariko_shop

|028438| LDA.b $8A
|02843A| CMP.b #$18 ; OW 18
|02843C| BEQ .death_mountain

.not_kakariko_shop
|02843E| LDX.b #$05 ; SONG 05

|028440| LDA.l $7EF300
|028444| AND.b #$40
|028446| BEQ .no_ms

|028448| LDX.b #$02 ; SONG 02

.no_ms
|02844A| LDA.b $A0 ; ROOM 0100
|02844C| BEQ .death_mountain

|02844E| CMP.b #$E1 ; ROOM 00E1
|028450| BEQ .death_mountain

;---------------------------------------------------------------------------------------------------

.dark_world
|028452| LDX.b #$F3 ; SONG F3 - max volume

|028454| LDA.w $0132
|028457| CMP.b #$F2 ; SONG F2 - half volume
|028459| BEQ .continue_with_music

|02845B| LDX.b #$02 ; SONG 02

|02845D| LDA.l $7EF3C5
|028461| CMP.b #$02
|028463| BCS .death_mountain

|028465| LDX.b #$03 ; SONG 03

.death_mountain
|028467| LDA.l $7EF3CA
|02846B| BEQ .continue_with_music

|02846D| LDX.b #$0D ; SONG 0D

|02846F| LDA.b $8A
|028471| CMP.b #$40 ; OW 40
|028473| BEQ .use_sw_theme

|028475| CMP.b #$43 ; OW 43
|028477| BEQ .use_sw_theme

|028479| CMP.b #$45 ; OW 45
|02847B| BEQ .use_sw_theme

|02847D| CMP.b #$47 ; OW 47
|02847F| BEQ .use_sw_theme

|028481| LDX.b #$09 ; SONG 09

.use_sw_theme
|028483| LDA.l $7EF357
|028487| BNE .continue_with_music

|028489| LDX.b #$04 ; SONG 04

.continue_with_music
|02848B| STX.w $0132

;---------------------------------------------------------------------------------------------------

|02848E| JSL DecompressAnimatedOverworldTiles
|028492| JSL InitializeTilesets
|028496| JSR OverworldLoadScreensPaletteSet

|028499| LDX.b $8A

|02849B| LDA.l $7EFD40,X
|02849F| STA.b $00

|0284A1| LDA.l OverworldPalettesScreenToSet,X
|0284A5| JSL OverworldPalettesLoader
|0284A9| JSL SetOverworldBackgroundColor

|0284AD| LDA.b $10
|0284AF| CMP.b #$08
|0284B1| BNE .special_overworld_b

|0284B3| JSR Overworld_CopyPalettesToCache_WithPrep
|0284B6| BRA .continue_b

.special_overworld_b
|0284B8| JSR SpecialOverworld_CopyPalettesToCache

.continue_b
|0284BB| JSL Overworld_SetFixedColAndScroll

|0284BF| LDA.b #$00
|0284C1| STA.l $7EC017

|0284C5| JSL InitializeFollower

|0284C9| LDA.b $8A
|0284CB| AND.b #$3F ; OW 00, OW 40
|0284CD| BNE .not_woods

|0284CF| LDA.b #$1E
|0284D1| JSL WriteTo4BPPBuffer_item_gfx

.not_woods
|0284D5| LDA.b #$09
|0284D7| STA.w $010C

|0284DA| JSL ResetAndReloadOverworldSprites

|0284DE| LDA.b $8A
|0284E0| AND.b #$40
|0284E2| BNE .no_mirror_portal

|0284E4| JSL InitializeMirrorPortal

.no_mirror_portal
|0284E8| LDX.b #$05 ; SFX1.05

|0284EA| LDA.l $7EF3C5
|0284EE| CMP.b #$02
|0284F0| BCS .no_rain_sfx

|0284F2| LDX.b #$01 ; SFX1.01

.no_rain_sfx
|0284F4| STX.w $012D

|0284F7| LDA.l $7EF3CC
|0284FB| CMP.b #$06 ; FOLLOWER 06
|0284FD| BNE .not_blind_follower

|0284FF| LDA.b #$00
|028501| STA.l $7EF3CC

.not_blind_follower
|028505| STZ.b $6C

|028507| STZ.b $3A
|028509| STZ.b $3C

|02850B| STZ.b $50
|02850D| STZ.b $5E

|02850F| STZ.w $0351

|028512| JSR DeleteCertainAncillaeStopDashing

|028515| LDA.l $7EF357
|028519| BNE .dont_become_bunny

|02851B| LDA.l $7EF3CA
|02851F| BEQ .dont_become_bunny

|028521| LDA.b #$01
|028523| STA.w $02E0
|028526| STA.b $56

|028528| LDA.b #$17 ; LINKSTATE 17
|02852A| STA.b $5D

|02852C| JSL RefreshEquipmentPalettes_bunny

.dont_become_bunny
|028530| LDA.b #$09
|028532| STA.b $94

|028534| LDA.b #$00
|028536| STA.l $7EC005

|02853A| STZ.w $046C
|02853D| STZ.b $EE
|02853F| STZ.w $0476

|028542| INC.b $11
|028544| INC.b $16

|028546| STZ.w $0402
|028549| STZ.w $0403

;===================================================================================================

LoadOWMusicIfNeeded:
|02854C| LDA.w $0136
|02854F| BEQ .exit

|028551| SEI

|028552| STZ.w NMITIMEN
|028555| STZ.w HDMAEN
|028558| STZ.w $0136

|02855B| LDA.b #$FF ; SONG FF - transfer
|02855D| STA.w APUIO0

|028560| JSL LoadOverworldSongs

|028564| LDA.b #$81
|028566| STA.w NMITIMEN

.exit
|028569| RTS

;===================================================================================================

AdjustLinkBunnyStatus:
|02856A| LDA.l $7EF357
|02856E| BEQ .exit

;===================================================================================================

#ForceNonbunnyStatus:
|028570| LDA.b #$00 ; LINKSTATE 00
|028572| STA.b $5D

|028574| STZ.w $03F5
|028577| STZ.w $03F6
|02857A| STZ.w $03F7

|02857D| STZ.b $56
|02857F| STZ.w $02E0

.exit
|028582| RTL

;===================================================================================================

pool Module1B_SpawnSelect

.spawns
|028583| db $00 ; Link's house
|028584| db $01 ; Sanctuary
|028585| db $06 ; Mountain cave

endpool

;---------------------------------------------------------------------------------------------------

Module1B_SpawnSelect:
|028586| JSL RenderText

|02858A| LDA.b $11
|02858C| BNE .exit

|02858E| STZ.b $14

|028590| JSL EnableForceBlank
|028594| JSL EraseTilemaps_normal

|028598| LDA.l $7EF3C8
|02859C| PHA

|02859D| LDX.w $1CE8

|0285A0| LDA.l .spawns,X
|0285A4| STA.l $7EF3C8

|0285A8| STZ.b $B0

|0285AA| JSL LoadUnderworldRoomRebuildHUD

|0285AE| PLA
|0285AF| STA.l $7EF3C8

.exit
|0285B3| RTL

;===================================================================================================

pool Epilogue_LoadOverworldScene

.vectors
|0285B4| dw Epilogue_LoadOverworldScene_PrepGFX
|0285B6| dw Epilogue_LoadOverworldScene_Overlay
|0285B8| dw Epilogue_LoadOverworldScene_LoadMap

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_LoadOverworldScene:
|0285BA| LDA.b $B0
|0285BC| ASL A
|0285BD| TAX

|0285BE| JSR (.vectors,X)

|0285C1| RTL

;===================================================================================================

pool Epilogue_LoadOverworldScene_PrepGFX Epilogue_LoadUnderworldScene

.screen
|0285C2| dw $1000 ; Hyrule Castle
|0285C4| dw $0002 ; Sanctuary
|0285C6| dw $1002 ; Kakariko
|0285C8| dw $1012 ; Desert
|0285CA| dw $1004 ; Tower of Hera
|0285CC| dw $1006 ; Link's house
|0285CE| dw $1010 ; Zora's Domain
|0285D0| dw $1014 ; Potion shop
|0285D2| dw $100A ; Lumberjacks
|0285D4| dw $1016 ; Haunted Grove
|0285D6| dw $005D ; Wishing Well
|0285D8| dw $0064 ; Smithery
|0285DA| dw $100E ; Kakariko (bug net)
|0285DC| dw $1008 ; Death Mountain
|0285DE| dw $1018 ; Lost Woods
|0285E0| dw $0180 ; Master Sword

;---------------------------------------------------------------------------------------------------

.sprite_gfx
|0285E2| db $28
|0285E3| db $46
|0285E4| db $27
|0285E5| db $2E
|0285E6| db $2B
|0285E7| db $2B
|0285E8| db $0E
|0285E9| db $2C
|0285EA| db $1A
|0285EB| db $29
|0285EC| db $47
|0285ED| db $28
|0285EE| db $27
|0285EF| db $28
|0285F0| db $2A
|0285F1| db $28
|0285F2| db $2D

.sprite_palette
|0285F3| db $01
|0285F4| db $40
|0285F5| db $01
|0285F6| db $04
|0285F7| db $01
|0285F8| db $01
|0285F9| db $01
|0285FA| db $11
|0285FB| db $01
|0285FC| db $01
|0285FD| db $47
|0285FE| db $40
|0285FF| db $01
|028600| db $01
|028601| db $01
|028602| db $01
|028603| db $01

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_LoadOverworldScene_PrepGFX:
|028604| JSL EnableForceBlank
|028608| JSL EraseTilemaps_normal

|02860C| LDA.b #$82
|02860E| STA.b $99

|028610| REP #$20

|028612| LDX.b $11

|028614| LDA.l .screen,X
|028618| STA.b $A0

|02861A| SEP #$20

|02861C| CPX.b #$0C
|02861E| BEQ .special_overworld

|028620| CPX.b #$1E
|028622| BEQ .special_overworld

|028624| JSR LoadOverworldFromUnderworld

|028627| BRA .continue

.special_overworld
|028629| JSR LoadSpecialOverworld

;---------------------------------------------------------------------------------------------------

.continue
|02862C| STZ.w $012C
|02862F| STZ.w $012D

|028632| LDY.b #$58

|028634| LDA.b $8A
|028636| AND.b #$BF
|028638| CMP.b #$03 ; OW 03, OW 43
|02863A| BEQ .death_mountain_screen

|02863C| CMP.b #$05 ; OW 05, OW 45
|02863E| BEQ .death_mountain_screen

|028640| CMP.b #$07 ; OW 07, OW 47
|028642| BEQ .death_mountain_screen

|028644| LDY.b #$5A

.death_mountain_screen
|028646| JSL DecompressAnimatedOverworldTiles

;---------------------------------------------------------------------------------------------------

|02864A| LDA.b $11
|02864C| LSR A
|02864D| TAX

|02864E| LDA.l .sprite_gfx,X
|028652| STA.w $0AA3

|028655| LDA.l .sprite_palette,X
|028659| PHA

|02865A| JSL InitializeTilesets
|02865E| JSR OverworldLoadScreensPaletteSet

|028661| PLA
|028662| STA.b $00

|028664| LDX.b $8A
|028666| LDA.l OverworldPalettesScreenToSet,X

|02866A| JSL OverworldPalettesLoader

|02866E| LDA.b #$01
|028670| STA.w $0AB2

|028673| JSL PaletteLoad_HUD

;---------------------------------------------------------------------------------------------------

|028677| LDA.b $11
|028679| BNE .font_already_transferred

|02867B| JSL TransferFontToVRAM

.font_already_transferred
|02867F| JSR Overworld_CopyPalettesToCache_WithPrep
|028682| JSL Overworld_SetFixedColAndScroll

|028686| LDA.b $8A
|028688| CMP.b #$80 ; SPOW
|02868A| BCC .no_special_bg_color

|02868C| JSL SetOverworldBackgroundColor

.no_special_bg_color
|028690| LDA.b #$09
|028692| STA.b $94

|028694| INC.b $B0

|028696| RTS

;===================================================================================================

Epilogue_LoadOverworldScene_Overlay:
|028697| JSR ReloadSubscreenOverlay

|02869A| STZ.w $012C
|02869D| STZ.w $012D

|0286A0| DEC.b $11

|0286A2| INC.b $B0

|0286A4| RTS

;===================================================================================================

Epilogue_LoadOverworldScene_LoadMap:
|0286A5| JSR LoadAndBuildOverworldScreen
|0286A8| JSL Epilogue_PrepAndLoadSprites

|0286AC| STZ.b $C8
|0286AE| STZ.b $C9
|0286B0| STZ.b $B0

|0286B2| RTS

;===================================================================================================

Epilogue_OperateScrollingAndTilemap:
|0286B3| JSL Epilogue_HandleCameraScrollControl

|0286B7| LDA.w $0416
|0286BA| BEQ .exit

|0286BC| JSR OverworldHandleMapScroll

.exit
|0286BF| RTL

;===================================================================================================

Credits_LoadCoolBackground:
|0286C0| LDA.b #$21
|0286C2| STA.w $0AA1

|0286C5| LDA.b #$3B
|0286C7| STA.w $0AA2

|0286CA| LDA.b #$2D
|0286CC| STA.w $0AA3

|0286CF| JSL InitializeTilesets

|0286D3| LDX.b #$5B ; OW 5B
|0286D5| STX.b $8A

|0286D7| LDA.b #$13
|0286D9| STA.b $00

|0286DB| LDA.l OverworldPalettesScreenToSet,X
|0286DF| JSL OverworldPalettesLoader

|0286E3| LDA.b #$03
|0286E5| STA.w $0AB5

|0286E8| JSL PaletteLoad_OWBG2
|0286EC| JSR Overworld_CopyPalettesToCache
|0286EF| JSR ReloadSubscreenOverlay

|0286F2| STZ.b $E6
|0286F4| STZ.b $E7
|0286F6| STZ.b $E0
|0286F8| STZ.b $E1

|0286FA| DEC.b $11

|0286FC| RTL

;===================================================================================================

Epilogue_LoadUnderworldScene:
|0286FD| JSL EnableForceBlank
|028701| JSL EraseTilemaps_normal

|028705| REP #$20

|028707| LDX.b $11

|028709| LDA.l .screen,X
|02870D| STA.w $010E

|028710| SEP #$20

|028712| JSR LoadUnderworldEntrance

|028715| STZ.w $045A
|028718| STZ.w $0458

|02871B| JSR LoadAndDrawRoom

|02871E| LDX.w $0AA1

|028721| LDA.l AnimatedTileSheets,X
|028725| TAY

|028726| JSL DecompressAnimatedUnderworldTiles

|02872A| LDA.b $11
|02872C| LSR A
|02872D| TAX

|02872E| LDA.l .sprite_gfx,X
|028732| STA.w $0AA3

|028735| LDA.l .sprite_palette,X
|028739| ASL A
|02873A| ASL A
|02873B| TAX

|02873C| LDA.l UnderworldPaletteSets+2,X
|028740| STA.w $0AAD

|028743| LDA.l UnderworldPaletteSets+3,X
|028747| STA.w $0AAE

|02874A| LDA.b #$0A
|02874C| STA.w $0AA4

|02874F| JSL InitializeTilesets

|028753| LDA.b #$0A
|028755| STA.w $0AB1

|028758| JSR LoadUnderworldPalettes

|02875B| LDA.b #$09
|02875D| STA.b $94

|02875F| STZ.b $C8
|028761| STZ.b $C9

|028763| STZ.b $13

|028765| INC.b $11

|028767| JSL Epilogue_PrepAndLoadSprites

|02876B| RTL

;===================================================================================================

pool Module07_Underworld

.submodules
|02876C| dw Module07_00_PlayerControl                    ; 0x00
|02876E| dw Module07_01_IntraroomTransition              ; 0x01
|028770| dw Module07_02_InterroomTransition              ; 0x02
|028772| dw Module07_03_OverlayChange                    ; 0x03
|028774| dw Module07_04_UnlockDoor                       ; 0x04
|028776| dw Module07_05_ControlShutters                  ; 0x05
|028778| dw Module07_06_FatInterRoomStairs               ; 0x06
|02877A| dw Module07_07_FallingTransition                ; 0x07
|02877C| dw Module07_08_NorthIntraRoomStairs             ; 0x08
|02877E| dw Module07_09_OpenCrackedDoor                  ; 0x09
|028780| dw Module07_0A_ChangeBrightness                 ; 0x0A
|028782| dw Module07_0B_DrainSwampPool                   ; 0x0B
|028784| dw Module07_0C_FloodSwampWater                  ; 0x0C
|028786| dw Module07_0D_FloodDam                         ; 0x0D
|028788| dw Module07_0E_SpiralStairs                     ; 0x0E
|02878A| dw Module07_0F_LandingWipe                      ; 0x0F
|02878C| dw Module07_10_SouthIntraRoomStairs             ; 0x10
|02878E| dw Module07_11_StraightInterroomStairs          ; 0x11
|028790| dw Module07_11_StraightInterroomStairs          ; 0x12
|028792| dw Module07_11_StraightInterroomStairs          ; 0x13
|028794| dw Module07_14_RecoverFromFall                  ; 0x14
|028796| dw Module07_15_WarpPad                          ; 0x15
|028798| dw Module07_16_UpdatePegs                       ; 0x16
|02879A| dw Module07_17_PressurePlate                    ; 0x17
|02879C| dw Module07_18_RescuedMaiden                    ; 0x18
|02879E| dw Module07_19_MirrorFade                       ; 0x19
|0287A0| dw Module07_1A_OpenTriforceDoor                 ; 0x1A

endpool

;---------------------------------------------------------------------------------------------------

Module07_Underworld:
|0287A2| SEP #$30

|0287A4| JSL HandleRoomLayerEffect

|0287A8| LDA.b $11
|0287AA| ASL A
|0287AB| TAX

|0287AC| JSR (.submodules,X)

|0287AF| STZ.w $042C

|0287B2| JSL PushBlock_Handler

|0287B6| LDA.b $11
|0287B8| BNE .continue

;---------------------------------------------------------------------------------------------------

|0287BA| JSL LoadChrHalfSlot
|0287BE| JSR HandleUnderworldCamera

|0287C1| LDA.b $11
|0287C3| BNE .continue

|0287C5| JSL HandleRoomTags

|0287C9| LDA.b $11
|0287CB| BNE .continue

|0287CD| JSL ProcessTorchesAndDoors

|0287D1| LDA.w $0454
|0287D4| BEQ .no_blast_wall

|0287D6| JSL ClearAwayExplodingWall

.no_blast_wall
|0287DA| LDA.b $6C
|0287DC| BNE .continue

|0287DE| JSR Underworld_TryScreenEdgeTransition

;---------------------------------------------------------------------------------------------------

.continue
|0287E1| JSL OrientLampLightCone

|0287E5| REP #$21

|0287E7| LDA.b $E2
|0287E9| PHA

|0287EA| ADC.w $011A
|0287ED| STA.b $E2
|0287EF| STA.w $011E

|0287F2| LDA.b $E8
|0287F4| PHA

|0287F5| CLC
|0287F6| ADC.w $011C
|0287F9| STA.b $E8
|0287FB| STA.w $0122

|0287FE| LDA.b $E0
|028800| PHA

|028801| CLC
|028802| ADC.w $011A
|028805| STA.b $E0
|028807| STA.w $0120

|02880A| LDA.b $E6
|02880C| PHA

|02880D| CLC
|02880E| ADC.w $011C
|028811| STA.b $E6
|028813| STA.w $0124

|028816| LDA.w $0428
|028819| AND.w #$00FF
|02881C| BEQ .keep_camera_coords

;---------------------------------------------------------------------------------------------------

|02881E| PLA
|02881F| PLA

|028820| LDA.w $0422
|028823| CLC
|028824| ADC.b $E2
|028826| STA.w $0120
|028829| STA.b $E0

|02882B| PHA

|02882C| LDA.w $0424
|02882F| CLC
|028830| ADC.b $E8
|028832| STA.w $0124
|028835| STA.b $E6

|028837| PHA

;---------------------------------------------------------------------------------------------------

.keep_camera_coords
|028838| SEP #$20

|02883A| JSL DrawAllPushBlocks
|02883E| JSL HandleAllSprites

|028842| REP #$20

|028844| PLA
|028845| STA.b $E6

|028847| PLA
|028848| STA.b $E0

|02884A| PLA
|02884B| STA.b $E8

|02884D| PLA
|02884E| STA.b $E2

|028850| SEP #$20

|028852| JSL DrawLink

|028856| JSL HandleItemRefills
|02885A| JML HandleFloorIndicator

;===================================================================================================

Underworld_TryScreenEdgeTransition:
|02885E| REP #$20

|028860| LDA.b $30
|028862| AND.w #$00FF
|028865| BEQ .no_vertical_movement

|028867| LDA.b $67
|028869| AND.w #$000C
|02886C| STA.b $00

|02886E| LDA.b $20
|028870| AND.w #$01FF

|028873| LDX.b #$03
|028875| CMP.w #$0004
|028878| BCC .check_for_transition

|02887A| LDX.b #$02
|02887C| CMP.w #$01DC
|02887F| BCS .check_for_transition

;---------------------------------------------------------------------------------------------------

.no_vertical_movement
|028881| LDA.b $31
|028883| AND.w #$00FF
|028886| BEQ .exit

|028888| LDA.b $67
|02888A| AND.w #$0003
|02888D| STA.b $00

|02888F| LDA.b $22
|028891| AND.w #$01FF

|028894| LDX.b #$01

|028896| CMP.w #$0008
|028899| BCC .check_for_transition

|02889B| LDX.b #$00
|02889D| CMP.w #$01E9
|0288A0| BCC .exit

;---------------------------------------------------------------------------------------------------

.check_for_transition
|0288A2| SEP #$20

|0288A4| JSL CheckForEdgeScreenTransition
|0288A8| BCS .exit

|0288AA| LDA.b $10
|0288AC| CMP.b #$07
|0288AE| BNE .exit

|0288B0| JSL Underworld_HandleEdgeTransitionMovement

|0288B4| LDA.b $10
|0288B6| CMP.b #$07
|0288B8| BNE .exit

|0288BA| LDA.b #$02
|0288BC| STA.b $11

.exit
|0288BE| SEP #$20

|0288C0| RTS

;===================================================================================================

pool Underworld_HandleEdgeTransitionMovement

.masks
|0288C1| db $03
|0288C2| db $03
|0288C3| db $0C
|0288C4| db $0C

endpool

;---------------------------------------------------------------------------------------------------

Underworld_HandleEdgeTransitionMovement:
|0288C5| LDA.b $67
|0288C7| AND.l .masks,X
|0288CB| STA.b $67

|0288CD| TXA
|0288CE| JSL JumpTableLong
|0288D2| dl HandleEdgeTransitionMovementEast
|0288D5| dl HandleEdgeTransitionMovementWest
|0288D8| dl HandleEdgeTransitionMovementSouth
|0288DB| dl HandleEdgeTransitionMovementNorth

;===================================================================================================

Module07_00_PlayerControl:
|0288DE| LDA.w $0112
|0288E1| ORA.w $02E4
|0288E4| ORA.w $0FFC
|0288E7| BEQ .in_control

|0288E9| JMP.w .no_SELECTing

;---------------------------------------------------------------------------------------------------

.in_control
|0288EC| LDA.b $F4
|0288EE| AND.b #$10
|0288F0| BEQ .no_START_press

|0288F2| STZ.w $0200

|0288F5| LDA.b #$01

|0288F7| BRA .open_interface

;---------------------------------------------------------------------------------------------------

.no_START_press
|0288F9| LDA.b $F6
|0288FB| AND.b #$40
|0288FD| BEQ .no_mapping

|0288FF| LDA.w $040C
|028902| CMP.b #$FF ; DUNGEON FF
|028904| BEQ .no_mapping

|028906| LDA.b $A0 ; ROOM 0000
|028908| BEQ .no_mapping

|02890A| STZ.w $0200

|02890D| LDA.b #$03

;---------------------------------------------------------------------------------------------------

.open_interface
|02890F| STA.b $11

|028911| LDA.b $10
|028913| STA.w $010C

|028916| LDA.b #$0E
|028918| STA.b $10

|02891A| RTS

;---------------------------------------------------------------------------------------------------

.no_mapping
|02891B| LDA.b $F0
|02891D| AND.b #$20
|02891F| BEQ .no_SELECTing

|028921| LDA.l $7EF3C5
|028925| BEQ .no_SELECTing

|028927| LDA.w $1CE8
|02892A| STA.w $1CF4

|02892D| REP #$20

|02892F| LDA.w #$0186 ; MESSAGE 0186
|028932| STA.w $1CF0

|028935| SEP #$20

|028937| LDA.b $10
|028939| PHA

|02893A| JSL PrepAndDisplayMessage

|02893E| PLA
|02893F| STA.b $10

|028941| STZ.b $B0

|028943| LDA.b #$0B

|028945| BRA .open_interface

;---------------------------------------------------------------------------------------------------

.no_SELECTing
|028947| JSL Link

|02894B| RTS

;===================================================================================================

Underworld_SubscreenEnable:
|02894C| db $00, $01, $01, $FF, $01, $01, $01, $01

;===================================================================================================

PendantBossRooms:
|028954| dw $00C8 ; ROOM 00C8 - Armos
|028956| dw $0033 ; ROOM 0033 - Lanmolas
|028958| dw $0007 ; ROOM 0007 - Moldorm
|02895A| dw $0020 ; ROOM 0020 - Agahnim 1

;===================================================================================================

CrystalBossRooms:
|02895C| dw $0006 ; ROOM 0006 - Arrghus
|02895E| dw $005A ; ROOM 005A - Helmasaur
|028960| dw $0029 ; ROOM 0029 - Mothula
|028962| dw $0090 ; ROOM 0090 - Vitreous
|028964| dw $00DE ; ROOM 00DE - Kholdstare
|028966| dw $00A4 ; ROOM 00A4 - Trinexx
|028968| dw $00AC ; ROOM 00AC - Blind
|02896A| dw $000D ; ROOM 000D - Agahnim 2

;===================================================================================================

pool Module07_01_IntraroomTransition

.subsubmodules
|02896C| dw IntraroomTransition_PrepTransition             ; 0x00
|02896E| dw IntraroomTransition_ApplyFilter                ; 0x01
|028970| dw IntraroomTransition_ResetShutters              ; 0x02
|028972| dw ScrollRoomDuringTransition                     ; 0x03
|028974| dw IntraroomTransition_FindTransitionLanding      ; 0x04
|028976| dw TransitionLinkOutOfDoor                        ; 0x05
|028978| dw IntraroomTransition_ApplyFilter                ; 0x06
|02897A| dw IntraroomTransition_TriggerShutters            ; 0x07

endpool

;---------------------------------------------------------------------------------------------------

Module07_01_IntraroomTransition:
|02897C| REP #$20

|02897E| LDA.b $22
|028980| STA.w $0FC2

|028983| LDA.b $20
|028985| STA.w $0FC4

|028988| SEP #$20

|02898A| JSL HandleLinkAnimation_FullLongEntry

|02898E| LDA.b $B0
|028990| ASL A
|028991| TAX

|028992| JMP.w (.subsubmodules,X)

;===================================================================================================

IntraroomTransition_ResetShutters:
|028995| STZ.w $0468

|028998| LDA.b #$07
|02899A| STA.w $0690

|02899D| LDA.b $11
|02899F| PHA

|0289A0| JSL OperateShutterDoors

|0289A4| PLA
|0289A5| STA.b $11

|0289A7| LDA.b #$1F
|0289A9| STA.l $7EC007

|0289AD| LDA.b #$00
|0289AF| STA.l $7EC00B

|0289B3| INC.b $B0

|0289B5| RTS

;===================================================================================================

IntraroomTransition_PrepTransition:
|0289B6| REP #$20

|0289B8| LDA.w #$0000
|0289BB| STA.l $7EC009
|0289BF| STA.l $7EC007

|0289C3| LDA.w #$001F
|0289C6| STA.l $7EC00B

|0289CA| STZ.w $0AA6

|0289CD| SEP #$20

|0289CF| STZ.w $0646
|0289D2| STZ.w $0642

|0289D5| INC.b $B0

|0289D7| RTS

;===================================================================================================

IntraroomTransition_ApplyFilter:
|0289D8| LDA.l $7EC005
|0289DC| BEQ .advance

|0289DE| JSL ApplyPaletteFilter

|0289E2| LDA.l $7EC007
|0289E6| BEQ .exit

|0289E8| JSL ApplyPaletteFilter

.exit
|0289EC| RTS

.advance
|0289ED| INC.b $B0

|0289EF| RTS

;===================================================================================================

IntraroomTransition_TriggerShutters:
|0289F0| JSR ResetThenCacheRoomEntryProperties

|0289F3| LDA.w $0468
|0289F6| BNE .exit

|0289F8| INC.w $0468

|0289FB| STZ.w $068E
|0289FE| STZ.w $0690

|028A01| LDA.b #$05
|028A03| STA.b $11

.exit
|028A05| RTS

;===================================================================================================

pool Module07_02_InterroomTransition

.subsubmodules
|028A06| dw Module07_02_00_InitializeTransition         ; 0x00
|028A08| dw Module07_02_01_LoadNextRoom                 ; 0x01
|028A0A| dw Module07_02_FadedFilter                     ; 0x02
|028A0C| dw Module07_02_03                              ; 0x03
|028A0E| dw Underworld_BuildBG2AndAdvance               ; 0x04
|028A10| dw Underworld_BuildBG1AndAdvance               ; 0x05
|028A12| dw Underworld_BuildBG2AndAdvance               ; 0x06
|028A14| dw Module07_02_07                              ; 0x07
|028A16| dw ScrollRoomDuringTransition                  ; 0x08
|028A18| dw Module07_02_09                              ; 0x09
|028A1A| dw Module07_02_0A                              ; 0x0A
|028A1C| dw Module07_02_09                              ; 0x0B
|028A1E| dw Module07_02_0C                              ; 0x0C
|028A20| dw Module07_02_0D                              ; 0x0D
|028A22| dw Module07_02_FadedFilter                     ; 0x0E
|028A24| dw Module07_02_0F                              ; 0x0F

endpool

;---------------------------------------------------------------------------------------------------

Module07_02_InterroomTransition:
|028A26| REP #$20

|028A28| LDA.b $22
|028A2A| STA.w $0FC2

|028A2D| LDA.b $20
|028A2F| STA.w $0FC4

|028A32| SEP #$20

|028A34| LDA.b $B0
|028A36| BEQ .run_subsubsub

|028A38| CMP.b #$07
|028A3A| BCC .skip_upload

|028A3C| JSL IncrementalVRAMUpload

.skip_upload
|028A40| JSL LoadNextObjectAttributeSet

.run_subsubsub
|028A44| JSL HandleLinkAnimation_FullLongEntry

|028A48| LDA.b $B0
|028A4A| ASL A
|028A4B| TAX

|028A4C| JMP.w (.subsubmodules,X)

;===================================================================================================

Module07_02_00_InitializeTransition:
|028A4F| LDA.w $0458
|028A52| PHA

|028A53| JSR ResetTransitionPropsAndAdvanceSubmodule

|028A56| PLA
|028A57| STA.w $0458

|028A5A| RTS

;===================================================================================================

Module07_02_01_LoadNextRoom:
|028A5B| JSL LoadAndBuildRoom
|028A5F| JSL ResetStarTileGraphics
|028A63| JSL LoadTransAuxGFX_sprite

|028A67| INC.b $B0

|028A69| STZ.w $0200

|028A6C| LDA.b $A2
|028A6E| PHA

|028A6F| LDA.b $A0
|028A71| STA.w $048E

|028A74| PLA
|028A75| STA.b $A2

|028A77| JSL Underworld_ResetSprites

|028A7B| LDA.w $0458
|028A7E| BNE .no_scroll_sync

|028A80| JSR UnderworldSyncBG1and2Scroll

.no_scroll_sync
|028A83| STZ.w $0458

|028A86| RTS

;===================================================================================================

Module07_02_03:
|028A87| LDA.l $7EC005
|028A8B| ORA.l $7EC006
|028A8F| BEQ .keep_subscreen_enable

|028A91| STZ.b $1D

.keep_subscreen_enable
|028A93| JSL AdjustForRoomLayout
|028A97| JSL LoadNewSpriteGFXSet

|028A9B| JSR UnderworldSyncBG1and2Scroll
|028A9E| JSL BuildBG1QuadrantForUpload

|028AA2| INC.b $B0

|028AA4| RTS

;===================================================================================================

Module07_02_0A:
|028AA5| LDA.l $7EC005
|028AA9| ORA.l $7EC006
|028AAD| BEQ Underworld_BuildBG1AndAdvance

;===================================================================================================

Underworld_FilterBuildBG1AndAdvance:
|028AAF| JSL ApplyPaletteFilter

;===================================================================================================

Underworld_BuildBG1AndAdvance:
|028AB3| JSL BuildBG1QuadrantForUpload

|028AB7| INC.b $B0

|028AB9| RTS

;===================================================================================================

Module07_02_09:
|028ABA| LDA.l $7EC005
|028ABE| ORA.l $7EC006
|028AC2| BEQ Underworld_BuildBG2AndAdvance

;===================================================================================================

Underworld_FilterBuildBG2AndAdvance:
|028AC4| JSL ApplyPaletteFilter

;===================================================================================================

Underworld_BuildBG2AndAdvance:
|028AC8| JSL BuildBG2QuadrantForUpload

|028ACC| INC.b $B0

|028ACE| RTS

;===================================================================================================

Module07_02_0C:
|028ACF| LDA.b $11
|028AD1| CMP.b #$02
|028AD3| BNE Underworld_AdvanceAndReset

|028AD5| LDA.w $0200
|028AD8| CMP.b #$05
|028ADA| BNE EXIT_028B2D

|028ADC| JSR IntraroomTransitionCalculateLanding

|028ADF| LDA.l $7EC005
|028AE3| ORA.l $7EC006
|028AE7| BEQ Underworld_AdvanceAndReset

|028AE9| JSL ApplyPaletteFilter

;===================================================================================================

Underworld_AdvanceAndReset:
|028AED| INC.b $B0

;===================================================================================================

ResetLampconeAndLink:
|028AEF| LDY.b #$16
|028AF1| LDX.w $0414

|028AF4| LDA.l Underworld_SubscreenEnable,X
|028AF8| BPL .disable

|028AFA| LDY.b #$17
|028AFC| LDA.b #$00

.disable
|028AFE| CPX.b #$02
|028B00| BNE .wait_dont_disable

|028B02| LDA.b #$03

.wait_dont_disable
|028B04| STY.b $1C
|028B06| STA.b $1D

|028B08| JSL RestoreTorchBackground

;===================================================================================================

DeleteCertainAncillaeStopDashing:
|028B0C| JSL TerminateSelectInteractives

|028B10| LDA.w $0372
|028B13| BEQ EXIT_028B2D

|028B15| STZ.b $4D
|028B17| STZ.b $46

|028B19| LDA.b #$FF
|028B1B| STA.b $29
|028B1D| STA.b $C7

|028B1F| STZ.b $3D
|028B21| STZ.b $5E

|028B23| STZ.w $032B
|028B26| STZ.w $0372

|028B29| LDA.b #$00 ; LINKSTATE 00
|028B2B| STA.b $5D

;---------------------------------------------------------------------------------------------------

#EXIT_028B2D:
|028B2D| RTS

;===================================================================================================

Module07_02_07:
|028B2E| REP #$10

|028B30| LDX.b $E2
|028B32| STX.b $E0

|028B34| LDX.b $E8
|028B36| STX.b $E6

|028B38| LDX.b $A0

|028B3A| CPX.w #$0036 ; ROOM 0036
|028B3D| BEQ .dont_change_mainandsubscreen

|028B3F| CPX.w #$0038 ; ROOM 0038
|028B42| BEQ .dont_change_mainandsubscreen

|028B44| LDX.w $0414
|028B47| LDY.w #$0016

|028B4A| LDA.l Underworld_SubscreenEnable,X
|028B4E| BEQ .am_zero

|028B50| LDY.w #$0116

.am_zero
|028B53| CPY.b $1C
|028B55| BEQ .dont_change_mainandsubscreen

|028B57| LDA.b $1C
|028B59| CMP.b #$17
|028B5B| BEQ .set_mainandsubscreen

|028B5D| ORA.b $1D
|028B5F| CMP.b #$17
|028B61| BEQ .dont_change_mainandsubscreen

.set_mainandsubscreen
|028B63| STY.b $1C

.dont_change_mainandsubscreen
|028B65| SEP #$10

;===================================================================================================

UnderworldTransition_RunFiltering:
|028B67| LDA.l $7EC005
|028B6B| ORA.l $7EC006
|028B6F| BEQ .no_filter

|028B71| LDX.b #$03

|028B73| LDA.l $7EC005
|028B77| BEQ .use_fixed_color_3

|028B79| LDX.w $045A

.use_fixed_color_3
|028B7C| LDA.l RoomEffectFixedColors,X
|028B80| STA.l $7EC017

|028B84| JSL ApplyGrayscaleFixed_Parameterized

|028B88| LDA.b #$00
|028B8A| STA.l $7EC00B

.no_filter
|028B8E| JSR HandleRoomTranslucencyAndPalettes

|028B91| RTS

;===================================================================================================

Module07_02_FadedFilter:
|028B92| LDA.l $7EC005
|028B96| ORA.l $7EC006
|028B9A| BEQ .next_subsub

|028B9C| JSL ApplyPaletteFilter

|028BA0| LDA.l $7EC007
|028BA4| BEQ .exit

|028BA6| JSL ApplyPaletteFilter

.exit
|028BAA| RTS

.next_subsub
|028BAB| INC.b $B0

|028BAD| RTS

;===================================================================================================

Module07_02_0F:
|028BAE| JSR ResetThenCacheRoomEntryProperties

|028BB1| LDA.w $0468
|028BB4| BNE SetBossOrSancMusicUponEntry

|028BB6| LDA.b $A0

|028BB8| CMP.b #$AC ; ROOM 00AC
|028BBA| BNE .not_workable_blinds_room

|028BBC| LDA.w $0403
|028BBF| AND.b #$20
|028BC1| BNE .not_workable_blinds_room

|028BC3| LDA.w $0403
|028BC6| AND.b #$10
|028BC8| BEQ SetBossOrSancMusicUponEntry

.not_workable_blinds_room
|028BCA| INC.w $0468

|028BCD| STZ.w $068E
|028BD0| STZ.w $0690

|028BD3| LDA.b #$05
|028BD5| STA.b $11

;===================================================================================================

SetBossOrSancMusicUponEntry:
|028BD7| REP #$20

|028BD9| LDX.b #$14 ; SONG 14

|028BDB| LDA.b $A0

|028BDD| CMP.w #$0012 ; ROOM 0012
|028BE0| BEQ .set_song

|028BE2| LDX.b #$10 ; SONG 10

|028BE4| CMP.w #$0002 ; ROOM 0002
|028BE7| BEQ .set_song

;---------------------------------------------------------------------------------------------------

|028BE9| LDX.b #$18

.check_next_room
|028BEB| DEX
|028BEC| DEX
|028BED| BMI .exit

|028BEF| CMP.l PendantBossRooms,X
|028BF3| BNE .check_next_room

;---------------------------------------------------------------------------------------------------

|028BF5| SEP #$20

|028BF7| JSL CheckIfScreenIsClear
|028BFB| BCS .exit

|028BFD| LDX.b #$15 ; SONG 15

.set_song
|028BFF| STX.w $012C

.exit
|028C02| SEP #$20

|028C04| RTS

;===================================================================================================

Module07_03_OverlayChange:
|028C05| JSL ApplyRoomHolesOverlay

|028C09| RTS

;===================================================================================================

Module07_04_UnlockDoor:
|028C0A| JSL UnlockKeyDoor

|028C0E| RTS

;===================================================================================================

Module07_05_ControlShutters:
|028C0F| JSL OperateShutterDoors

|028C13| RTS

;===================================================================================================

Module07_06_FatInterRoomStairs:
|028C14| LDA.b $B0
|028C16| CMP.b #$03
|028C18| BCC .dont_reload_tile_types

|028C1A| JSL LoadNextObjectAttributeSet

.dont_reload_tile_types
|028C1E| LDA.b $B0
|028C20| CMP.b #$0D
|028C22| BCC .skip_gfx_updates

|028C24| JSL IncrementalVRAMUpload

|028C28| LDA.w $0464
|028C2B| BEQ .run_subsubsub

|028C2D| DEC.w $0464

|028C30| CMP.b #$10
|028C32| BNE .dont_add_stair_drag

|028C34| LDA.b #$02
|028C36| STA.b $57

.dont_add_stair_drag
|028C38| LDX.b #$08

|028C3A| LDA.w $0462
|028C3D| AND.b #$04
|028C3F| BEQ .going_up

|028C41| LDX.b #$04

.going_up
|028C43| STX.b $67

|028C45| JSL HandleLinkVelocity
|028C49| JSR HandleUnderworldCamera

;---------------------------------------------------------------------------------------------------

.skip_gfx_updates
|028C4C| JSL HandleLinkAnimation_FullLongEntry

.run_subsubsub
|028C50| LDA.b $B0
|028C52| JSL JumpTableLocal
|028C56| dw ResetTransitionPropsAndAdvance_ResetInterface       ; 0x00
|028C58| dw UnderworldTransition_FatStairs_RunFade              ; 0x01
|028C5A| dw InitializeRoomFromSpecial                           ; 0x02
|028C5C| dw TriggerBGC34UpdateAndAdvance                        ; 0x03
|028C5E| dw TriggerBGC56UpdateAndAdvance                        ; 0x04
|028C60| dw UnderworldTransition_LoadSpriteGFX                  ; 0x05
|028C62| dw UnderworldTransition_AdjustForFatStairScroll        ; 0x06
|028C64| dw Underworld_BuildBG2AndAdvance                       ; 0x07
|028C66| dw Underworld_BuildBG1AndAdvance                       ; 0x08
|028C68| dw Underworld_BuildBG2AndAdvance                       ; 0x09
|028C6A| dw Underworld_FilterBuildBG1AndAdvance                 ; 0x0A
|028C6C| dw Underworld_FilterBuildBG2AndAdvance                 ; 0x0B
|028C6E| dw Underworld_FilterBuildBG1AndAdvance                 ; 0x0C
|028C70| dw Underworld_FilterBuildBG2AndAdvance                 ; 0x0D
|028C72| dw DoubleApplyAndIncrementGrayscale                    ; 0x0E
|028C74| dw Underworld_AdvanceAndReset                          ; 0x0F
|028C76| dw UnderworldTransition_FatStairsEntryCache            ; 0x10

;===================================================================================================

Module07_0E_01_HandleMusicAndResetProps:
|028C78| REP #$20

|028C7A| LDA.b $A0
|028C7C| CMP.w #$0007 ; ROOM 0007
|028C7F| BEQ .not_moldorm_room

|028C81| CMP.w #$0017 ; ROOM 0017
|028C84| BNE .dont_fade_music

|028C86| LDX.w $0130
|028C89| CPX.b #$11 ; SONG 11
|028C8B| BEQ .dont_fade_music

.not_moldorm_room
|028C8D| LDA.l $7EF374
|028C91| LSR A
|028C92| BCS .dont_fade_music

|028C94| LDX.b #$F1 ; SONG F1
|028C96| STX.w $012C

;---------------------------------------------------------------------------------------------------

.dont_fade_music
|028C99| SEP #$20

|028C9B| LDX.b #$58

|028C9D| LDA.w $0462
|028CA0| AND.b #$04
|028CA2| BEQ .going_up

|028CA4| LDX.b #$6A

.going_up
|028CA6| STX.w $0464

;===================================================================================================

ResetTransitionPropsAndAdvance_ResetInterface:
|028CA9| STZ.w $0200

;===================================================================================================

ResetTransitionPropsAndAdvanceSubmodule:
|028CAC| REP #$30

|028CAE| LDA.w #$0000
|028CB1| STA.l $7EC011
|028CB5| STA.l $7EC009
|028CB9| STA.l $7EC007

|028CBD| LDA.w #$001F
|028CC0| STA.l $7EC00B

|028CC4| STZ.w $0AA6
|028CC7| STZ.w $045A

|028CCA| LDA.w $0458
|028CCD| BEQ .dark_room

|028CCF| LDA.w #$B302
|028CD2| STA.b $99

.dark_room
|028CD4| SEP #$30

|028CD6| STZ.w $0458

|028CD9| JSR DeleteCertainAncillaeStopDashing
|028CDC| JSR Overworld_CopyPalettesToCache

|028CDF| INC.b $B0

|028CE1| RTS

;===================================================================================================

InitializeRoomFromSpecial:
|028CE2| JSR AdjustUnderworldCameraArbitrarily

|028CE5| JSL LoadAndBuildRoom
|028CE9| JSL ResetStarTileGraphics

|028CED| JSL LoadTransAuxGFX
|028CF1| JSL LoadUnderworldTileTypes

|028CF5| LDA.b $A0
|028CF7| STA.w $048E

|028CFA| JSL InitializeFollower

|028CFE| INC.b $B0

|028D00| RTS

;===================================================================================================

UnderworldTransition_FatStairs_RunFade:
|028D01| JSL ApplyPaletteFilter

|028D05| LDA.l $7EC007
|028D09| BEQ .exit

|028D0B| JSL ApplyPaletteFilter

.exit
|028D0F| RTS

;===================================================================================================

UnderworldTransition_LoadSpriteGFX:
|028D10| JSL LoadNewSpriteGFXSet
|028D14| JSL Underworld_ResetSprites

|028D18| JMP.w UnderworldTransition_RunFiltering

;===================================================================================================

UnderworldTransition_AdjustForFatStairScroll:
|028D1B| JSR UnderworldSyncBG1and2Scroll
|028D1E| JSL AdjustForRoomLayout

|028D22| LDY.b #$16
|028D24| LDX.w $0414

|028D27| LDA.l Underworld_SubscreenEnable,X
|028D2B| BPL .valid_subscreens

|028D2D| LDY.b #$17
|028D2F| LDA.b #$00

.valid_subscreens
|028D31| STY.b $1C
|028D33| STA.b $1D

|028D35| INC.b $A4

|028D37| LDA.b #$01
|028D39| STA.b $57

|028D3B| LDY.b #$17 ; SFX2.17
|028D3D| LDX.b #$30

|028D3F| LDA.w $0462
|028D42| AND.b #$04
|028D44| BEQ .going_upstairs

|028D46| LDY.b #$19 ; SFX2.19

|028D48| DEC.b $A4
|028D4A| DEC.b $A4

|028D4C| LDX.b #$20

.going_upstairs
|028D4E| STX.w $0464
|028D51| STY.w $012E

;---------------------------------------------------------------------------------------------------

|028D54| LDA.b #$24 ; SFX3.24
|028D56| STA.w $012F

|028D59| JSR BlipAndCacheQuadrants

|028D5C| JMP.w Underworld_BuildBG1AndAdvance

;===================================================================================================

UnderworldTransition_FatStairsEntryCache:
|028D5F| LDA.l $7EC009
|028D63| ORA.l $7EC007
|028D67| BEQ .continue

.exit
|028D69| RTS

.continue
|028D6A| LDA.w $0200
|028D6D| CMP.b #$05
|028D6F| BNE .exit

;===================================================================================================

ResetThenCacheRoomEntryProperties:
|028D71| STZ.w $0200
|028D74| STZ.b $B0

|028D76| STZ.w $0418
|028D79| STZ.b $11

|028D7B| STZ.w $0642
|028D7E| STZ.w $0641

;===================================================================================================

CacheRoomEntryProperties:
|028D81| REP #$20

|028D83| LDA.b $E2
|028D85| STA.l $7EC180

|028D89| LDA.b $E8
|028D8B| STA.l $7EC182

|028D8F| LDA.b $20
|028D91| STA.l $7EC184

|028D95| LDA.b $22
|028D97| STA.l $7EC186

|028D9B| LDA.w $0600
|028D9E| STA.l $7EC188

|028DA2| LDA.w $0604
|028DA5| STA.l $7EC18A

|028DA9| LDA.w $0608
|028DAC| STA.l $7EC18C

|028DB0| LDA.w $060C
|028DB3| STA.l $7EC18E

|028DB7| LDA.w $0610
|028DBA| STA.l $7EC190

|028DBE| LDA.w $0612
|028DC1| STA.l $7EC192

|028DC5| LDA.w $0614
|028DC8| STA.l $7EC194

|028DCC| LDA.w $0616
|028DCF| STA.l $7EC196

|028DD3| LDA.w $0618
|028DD6| STA.l $7EC198

|028DDA| LDA.w $061C
|028DDD| STA.l $7EC19A

|028DE1| LDA.b $A6
|028DE3| STA.l $7EC19C

|028DE7| LDA.b $A9
|028DE9| STA.l $7EC19E

|028DED| SEP #$20

|028DEF| LDA.b $2F
|028DF1| STA.l $7EC1A6

|028DF5| LDA.b $EE
|028DF7| STA.l $7EC1A7

|028DFB| LDA.w $0476
|028DFE| STA.l $7EC1A8

|028E02| LDA.b $6C
|028E04| STA.l $7EC1A9

|028E08| LDA.b $A4
|028E0A| STA.l $7EC1AA

|028E0E| RTS

;===================================================================================================

TriggerBGC34UpdateAndAdvance:
|028E0F| JSL PrepTransAuxGfx

|028E13| LDA.b #$09
|028E15| STA.b $17
|028E17| STA.w $0710

|028E1A| INC.b $B0

|028E1C| RTS

;===================================================================================================

TriggerBGC56UpdateAndAdvance:
|028E1D| LDA.b #$0A
|028E1F| STA.b $17
|028E21| STA.w $0710

|028E24| INC.b $B0

|028E26| RTS

;===================================================================================================

Module07_07_FallingTransition:
|028E27| LDA.b $B0
|028E29| CMP.b #$06
|028E2B| BCC .run_subsubsub

|028E2D| JSL IncrementalVRAMUpload
|028E31| JSL LoadNextObjectAttributeSet
|028E35| JSL ApplyGrayscaleFixed_Incremental

.run_subsubsub
|028E39| LDA.b $B0
|028E3B| JSL JumpTableLocal
|028E3F| dw Module07_07_00_HandleMusicAndResetRoom            ; 0x00
|028E41| dw ApplyPaletteFilter_bounce                         ; 0x01
|028E43| dw InitializeRoomFromSpecial                         ; 0x02
|028E45| dw TriggerBGC34UpdateAndAdvance                      ; 0x03
|028E47| dw TriggerBGC56UpdateAndAdvance                      ; 0x04
|028E49| dw UnderworldTransition_LoadSpriteGFX                ; 0x05
|028E4B| dw Module07_07_06_SyncBG1and2                        ; 0x06
|028E4D| dw Underworld_BuildBG2AndAdvance                     ; 0x07
|028E4F| dw Underworld_BuildBG1AndAdvance                     ; 0x08
|028E51| dw Underworld_BuildBG2AndAdvance                     ; 0x09
|028E53| dw Underworld_BuildBG1AndAdvance                     ; 0x0A
|028E55| dw Underworld_BuildBG2AndAdvance                     ; 0x0B
|028E57| dw Underworld_BuildBG1AndAdvance                     ; 0x0C
|028E59| dw Underworld_BuildBG2AndAdvance                     ; 0x0D
|028E5B| dw Underworld_AdvanceAndReset                        ; 0x0E
|028E5D| dw Module07_07_0F_FallingFadeIn                      ; 0x0F
|028E5F| dw Module07_07_10_LandLinkFromFalling                ; 0x10
|028E61| dw Module07_07_11_CacheRoomAndSetMusic               ; 0x11

;===================================================================================================

Module07_07_00_HandleMusicAndResetRoom:
|028E63| REP #$20

|028E65| LDA.b $A0

|028E67| CMP.w #$0010 ; ROOM 0010
|028E6A| BEQ .fade_music

|028E6C| CMP.w #$0007 ; ROOM 0007
|028E6F| BEQ .fade_music

|028E71| CMP.w #$0017 ; ROOM 0017
|028E74| BNE .no_fade

.fade_music
|028E76| LDX.b #$F1 ; SONG F1
|028E78| STX.w $012C

.no_fade
|028E7B| SEP #$20

|028E7D| JMP.w ResetTransitionPropsAndAdvance_ResetInterface

;===================================================================================================

Module07_07_06_SyncBG1and2:
|028E80| JSR UnderworldSyncBG1and2Scroll
|028E83| JSL AdjustForRoomLayout

|028E87| LDY.b #$16
|028E89| LDX.w $0414

|028E8C| LDA.l Underworld_SubscreenEnable,X
|028E90| BPL .valid_subscreen

|028E92| LDY.b #$17
|028E94| LDA.b #$00

.valid_subscreen
|028E96| STY.b $1C
|028E98| STA.b $1D

|028E9A| JSL BuildBG1QuadrantForUpload

|028E9E| INC.b $B0

|028EA0| RTS

;===================================================================================================

Module07_07_0F_FallingFadeIn:
|028EA1| JSL ApplyPaletteFilter

|028EA5| LDA.l $7EC009
|028EA9| BNE .exit

|028EAB| LDA.b $21

|028EAD| LDY.b $20
|028EAF| CPY.b $51
|028EB1| BCC .at_target

|028EB3| INC A

.at_target
|028EB4| STA.b $52

|028EB6| JSR SetBossMusic

|028EB9| LDA.b $A0

|028EBB| CMP.b #$89 ; ROOM 0089
|028EBD| BEQ .exit

|028EBF| CMP.b #$4F ; ROOM 004F
|028EC1| BEQ .exit

|028EC3| CMP.b #$A7 ; ROOM 00A7
|028EC5| BEQ .is_hera_fairies

|028EC7| DEC.b $A4

;===================================================================================================

#BlipAndCacheQuadrants:
|028EC9| LDA.b #$01
|028ECB| STA.w $04A0

|028ECE| LDA.b #$24 ; SFX3.24
|028ED0| STA.w $012F

|028ED3| JSL SetAndSaveVisitedQuadrantFlags

.exit
|028ED7| RTS

;---------------------------------------------------------------------------------------------------

.is_hera_fairies
|028ED8| STZ.w $04A0

|028EDB| LDA.b #$01
|028EDD| STA.b $A4

|028EDF| RTS

;===================================================================================================

Module07_07_10_LandLinkFromFalling:
|028EE0| JSL HandleUnderworldLandingFromPit

|028EE4| LDA.b $11
|028EE6| BNE .exit

|028EE8| LDA.b #$07
|028EEA| STA.b $11

|028EEC| LDA.b #$11
|028EEE| STA.b $B0

|028EF0| LDA.b #$01
|028EF2| STA.w $0AAA

|028EF5| JSL LoadChrHalfSlot

.exit
|028EF9| RTS

;===================================================================================================

Module07_07_11_CacheRoomAndSetMusic:
|028EFA| LDA.w $0200
|028EFD| CMP.b #$05
|028EFF| BNE .exit

|028F01| JSR ResetThenCacheRoomEntryProperties
|028F04| JSR SetBossOrSancMusicUponEntry
|028F07| JSL LoadChrHalfSlot

.exit
|028F0B| RTS

;===================================================================================================

Module07_08_NorthIntraRoomStairs:
|028F0C| LDA.w $0464
|028F0F| BEQ .run_subsubsub

|028F11| DEC.w $0464

|028F14| CMP.b #$14
|028F16| BNE .skip_stair_drag

|028F18| LDA.b #$02
|028F1A| STA.b $57

.skip_stair_drag
|028F1C| JSL HandleLinkVelocity

|028F20| JSL ApplyLinksMovementToCamera
|028F24| JSR HandleUnderworldCamera

|028F27| JSL HandleLinkAnimation_FullLongEntry

.run_subsubsub
|028F2B| LDA.b $B0
|028F2D| JSL JumpTableLocal
|028F31| dw Module07_08_00_InitStairs
|028F33| dw Module07_08_01_ClimbStairs

;===================================================================================================

Module07_08_00_InitStairs:
|028F35| STZ.w $0351

|028F38| LDY.b #$19 ; SFX2.19
|028F3A| LDX.b #$3C

|028F3C| LDA.b $67
|028F3E| AND.b #$08
|028F40| BEQ .finish_up

|028F42| LDY.b #$17 ; SFX2.17
|028F44| LDX.b #$38

|028F46| STZ.w $0476

|028F49| LDA.w $044A
|028F4C| CMP.b #$02
|028F4E| BEQ .finish_up

|028F50| STZ.b $EE

.finish_up
|028F52| STX.w $0464
|028F55| STY.w $012E

|028F58| LDA.b #$01
|028F5A| STA.b $57

|028F5C| INC.b $B0

;---------------------------------------------------------------------------------------------------

#EXIT_028F5E:
|028F5E| RTS

;===================================================================================================

Module07_08_01_ClimbStairs:
|028F5F| LDA.w $0464
|028F62| BNE EXIT_028F5E

|028F64| LDA.b $67
|028F66| AND.b #$04
|028F68| BEQ .finish_up

|028F6A| LDA.b #$01
|028F6C| STA.w $0476

|028F6F| LDA.w $044A
|028F72| CMP.b #$02
|028F74| BEQ .finish_up

|028F76| LDA.b #$01
|028F78| STA.b $EE

|028F7A| BRA .finish_up

.finish_up
|028F7C| STZ.b $B0
|028F7E| STZ.w $0418
|028F81| STZ.b $11

|028F83| JSL SetAndSaveVisitedQuadrantFlags

|028F87| RTS

;===================================================================================================

Module07_10_SouthIntraRoomStairs:
|028F88| LDA.w $0464
|028F8B| BEQ .run_subsubsub

|028F8D| DEC.w $0464

|028F90| CMP.b #$14
|028F92| BNE .skip_stair_drag

|028F94| LDA.b #$02
|028F96| STA.b $57

.skip_stair_drag
|028F98| JSL HandleLinkVelocity
|028F9C| JSL ApplyLinksMovementToCamera
|028FA0| JSR HandleUnderworldCamera
|028FA3| JSL HandleLinkAnimation_FullLongEntry

.run_subsubsub
|028FA7| LDA.b $B0
|028FA9| JSL JumpTableLocal
|028FAD| dw Module07_10_00_InitStairs
|028FAF| dw Module07_10_01_ClimbStairs

;===================================================================================================

Module07_10_00_InitStairs:
|028FB1| LDY.b #$19 ; SFX2.19

|028FB3| LDX.b #$3C

|028FB5| LDA.b $67
|028FB7| AND.b #$04
|028FB9| BEQ .finish_up

|028FBB| LDY.b #$17 ; SFX2.17

|028FBD| LDX.b #$38

|028FBF| LDA.w $0476
|028FC2| EOR.b #$01
|028FC4| STA.w $0476

|028FC7| LDA.w $044A
|028FCA| CMP.b #$02
|028FCC| BEQ .finish_up

|028FCE| LDA.b $EE
|028FD0| EOR.b #$01
|028FD2| STA.b $EE

.finish_up
|028FD4| STX.w $0464

|028FD7| STY.w $012E

|028FDA| LDA.b #$01
|028FDC| STA.b $57

|028FDE| INC.b $B0

;---------------------------------------------------------------------------------------------------

#EXIT_028FE0:
|028FE0| RTS

;===================================================================================================

Module07_10_01_ClimbStairs:
|028FE1| LDA.w $0464
|028FE4| BNE EXIT_028FE0

|028FE6| LDA.b $67
|028FE8| AND.b #$08
|028FEA| BEQ .finish_up

|028FEC| LDA.w $0476
|028FEF| EOR.b #$01
|028FF1| STA.w $0476

|028FF4| LDA.w $044A
|028FF7| CMP.b #$02
|028FF9| BEQ .finish_up

|028FFB| LDA.b $EE
|028FFD| EOR.b #$01
|028FFF| STA.b $EE

|029001| BRA .finish_up

.finish_up
|029003| STZ.b $B0
|029005| STZ.w $0418
|029008| STZ.b $11

|02900A| JSL SetAndSaveVisitedQuadrantFlags

|02900E| RTS

;===================================================================================================

Module07_09_OpenCrackedDoor:
|02900F| JSL OpenCrackedDoor

|029013| RTS

;===================================================================================================

Module07_0A_ChangeBrightness:
|029014| JSL OrientLampLightCone
|029018| JSL ApplyGrayscaleFixed_Incremental

|02901C| LDA.l $00009C
|029020| AND.b #$1F
|029022| CMP.l $7EC017
|029026| BNE .exit

|029028| STZ.b $11
|02902A| STZ.b $B0

.exit
|02902C| RTS

;===================================================================================================

Module07_0B_DrainSwampPool:
|02902D| JSL .do_it

|029031| RTS

;---------------------------------------------------------------------------------------------------

.do_it
|029032| LDA.b $B0
|029034| JSL JumpTableLong
|029038| dl IncrementallyDrainSwampPool            ; 0x00
|02903B| dl DeleteSwampPoolWaterOverlay            ; 0x01
|02903E| dl FloodSwampWater_PrepTilemap            ; 0x02
|029041| dl FloodSwampWater_PrepTilemap            ; 0x03
|029044| dl FloodSwampWater_PrepTilemap            ; 0x04
|029047| dl FloodSwampWater_PrepTilemap            ; 0x05

;===================================================================================================

Module07_0C_FloodSwampWater:
|02904A| JSL FloodSwampWater

|02904E| RTS

;===================================================================================================

Module07_0D_FloodDam:
|02904F| JSL FloodDam

|029053| RTS

;===================================================================================================

Module07_0E_SpiralStairs:
|029054| LDA.b $B0
|029056| CMP.b #$07
|029058| BCC .skip_upload

|02905A| JSL IncrementalVRAMUpload
|02905E| JSL LoadNextObjectAttributeSet

.skip_upload
|029062| JSL HandleLinkOnSpiralStairs

|029066| LDA.b $B0
|029068| JSL JumpTableLocal
|02906C| dw Module07_0E_00_InitPriorityAndScreens             ; 0x00
|02906E| dw Module07_0E_01_HandleMusicAndResetProps           ; 0x01
|029070| dw Module07_0E_02_ApplyFilterIf                      ; 0x02
|029072| dw InitializeRoomFromSpecial                         ; 0x03
|029074| dw TriggerBGC34UpdateAndAdvance                      ; 0x04
|029076| dw TriggerBGC56UpdateAndAdvance                      ; 0x05
|029078| dw UnderworldTransition_LoadSpriteGFX                ; 0x06
|02907A| dw SyncBackgroundsFromSpiralStairs                   ; 0x07
|02907C| dw Underworld_BuildBG2AndAdvance                     ; 0x08
|02907E| dw Underworld_BuildBG1AndAdvance                     ; 0x09
|029080| dw Underworld_BuildBG2AndAdvance                     ; 0x0A
|029082| dw Underworld_FilterBuildBG1AndAdvance               ; 0x0B
|029084| dw Underworld_FilterBuildBG2AndAdvance               ; 0x0C
|029086| dw Underworld_FilterBuildBG1AndAdvance               ; 0x0D
|029088| dw Underworld_FilterBuildBG2AndAdvance               ; 0x0E
|02908A| dw DoubleApplyAndIncrementGrayscale                  ; 0x0F
|02908C| dw AdvanceThenSetBossMusic                           ; 0x10
|02908E| dw Module07_0E_11                                    ; 0x11
|029090| dw Module07_0E_12                                    ; 0x12
|029092| dw Module07_0E_13_SetRoomAndLayerAndCache            ; 0x13

;===================================================================================================

DoubleApplyAndIncrementGrayscale:
|029094| JSL ApplyPaletteFilter
|029098| JSL ApplyPaletteFilter

|02909C| JSL ApplyGrayscaleFixed_Incremental

|0290A0| RTS

;===================================================================================================

Module07_0E_02_ApplyFilterIf:
|0290A1| LDA.w $0464
|0290A4| CMP.b #$09
|0290A6| BCS .skip_filtering

|0290A8| JSL ApplyPaletteFilter
|0290AC| LDA.l $7EC007
|0290B0| BEQ .skip_filtering

|0290B2| JSL ApplyPaletteFilter

.skip_filtering
|0290B6| LDA.w $0464
|0290B9| BNE .dec_to_zero

|0290BB| LDA.b #$0C
|0290BD| STA.b $4B
|0290BF| STA.w $02F9

|0290C2| RTS

.dec_to_zero
|0290C3| DEC.w $0464

|0290C6| RTS

;===================================================================================================

SyncBackgroundsFromSpiralStairs:
|0290C7| LDA.l $7EF3CC
|0290CB| CMP.b #$06 ; FOLLOWER 06
|0290CD| BNE .not_blind_in_attic

|0290CF| LDA.b $A0
|0290D1| CMP.b #$64 ; ROOM 0064
|0290D3| BNE .not_blind_in_attic

|0290D5| LDA.b #$00
|0290D7| STA.l $7EF3CC

;---------------------------------------------------------------------------------------------------

.not_blind_in_attic
|0290DB| LDA.b $EE
|0290DD| PHA

|0290DE| REP #$10

|0290E0| LDX.w #$0030

|0290E3| LDA.w $0462
|0290E6| AND.b #$04
|0290E8| BNE .positive_y_a

|0290EA| LDX.w #$FFD0

.positive_y_a
|0290ED| REP #$20

|0290EF| TXA
|0290F0| CLC
|0290F1| ADC.b $20
|0290F3| STA.b $20

|0290F5| SEP #$30

|0290F7| LDX.w $048A

|0290FA| LDA.l LayerOfDestination.for_EE,X
|0290FE| STA.b $EE

|029100| JSR MakeNearbyWallsHighPriority_Exiting

|029103| PLA
|029104| STA.b $EE

;---------------------------------------------------------------------------------------------------

|029106| REP #$10

|029108| LDX.w #$FFD0

|02910B| LDA.w $0462
|02910E| AND.b #$04
|029110| BNE .positive_y_b

|029112| LDX.w #$0030

.positive_y_b
|029115| REP #$20

|029117| TXA
|029118| CLC
|029119| ADC.b $20
|02911B| STA.b $20

|02911D| JSR UnderworldSyncBG1and2Scroll

|029120| SEP #$30

|029122| JSL AdjustForRoomLayout

;---------------------------------------------------------------------------------------------------

|029126| LDY.b #$16

|029128| LDX.w $0414
|02912B| LDA.l Underworld_SubscreenEnable,X
|02912F| BPL .valid_subscreen

|029131| LDY.b #$17
|029133| LDA.b #$00

.valid_subscreen
|029135| CPX.b #$02
|029137| BNE .dont_override_as_bg12

|029139| LDA.b #$03

.dont_override_as_bg12
|02913B| STY.b $1C
|02913D| STA.b $1D

|02913F| INC.b $A4

|029141| LDA.w $0462
|029144| AND.b #$04
|029146| BEQ .going_up

|029148| DEC.b $A4
|02914A| DEC.b $A4

.going_up
|02914C| LDX.b #$18
|02914E| STX.w $0464

|029151| JSR BlipAndCacheQuadrants
|029154| JSL RestoreTorchBackground

|029158| JMP.w Underworld_BuildBG1AndAdvance

;===================================================================================================

AdvanceThenSetBossMusic:
|02915B| JSR DeleteCertainAncillaeStopDashing

|02915E| LDA.b #$38
|029160| STA.w $0464

|029163| INC.b $B0

;===================================================================================================

SetBossMusic:
|029165| REP #$20

|029167| LDX.b #$1C ; SONG 1C

|029169| LDA.b $A0

|02916B| CMP.w #$0010 ; ROOM 0010
|02916E| BEQ .set_song

|029170| LDX.b #$15 ; SONG 15

|029172| CMP.w #$0007 ; ROOM 0007
|029175| BEQ .check_last_command

|029177| LDX.b #$11 ; SONG 11

|029179| CMP.w #$0017 ; ROOM 0017
|02917C| BNE .exit

|02917E| CPX.w $0130
|029181| BEQ .exit

.check_last_command
|029183| LDA.w $0130
|029186| AND.w #$00FF
|029189| CMP.w #$00F1 ; SONG F1 - fade
|02918C| BEQ .set_song

|02918E| LDA.l $7EF374
|029192| LSR A
|029193| BCS .exit

.set_song
|029195| STX.w $012C

.exit
|029198| SEP #$20

|02919A| RTS

;===================================================================================================

Module07_0E_11:
|02919B| JSL FindSpiralStairsLandingSpot

|02919F| DEC.w $0464
|0291A2| BNE .exit

|0291A4| LDX.b #$0A

|0291A6| LDA.w $0462
|0291A9| AND.b #$04
|0291AB| BNE .going_down

|0291AD| LDX.b #$18

.going_down
|0291AF| STX.w $0464

|0291B2| INC.b $B0

.exit
|0291B4| RTS

;===================================================================================================

Module07_0E_12:
|0291B5| JSL FindSpiralStairsLandingSpot

|0291B9| DEC.w $0464
|0291BC| BNE .exit

|0291BE| INC.b $B0

|0291C0| STZ.w $0200

.exit
|0291C3| RTS

;===================================================================================================

Module07_0E_00_InitPriorityAndScreens:
|0291C4| JSL MakeNearbyWallsHighPriority_Entering

|0291C8| LDA.b $EE
|0291CA| BEQ .dont_set_screendes_and_priority

|0291CC| LDA.b $1C
|0291CE| AND.b #$0F
|0291D0| STA.b $1C

|0291D2| LDA.b #$10
|0291D4| TSB.b $1D

|0291D6| LDA.b #$03
|0291D8| STA.b $EE

.dont_set_screendes_and_priority
|0291DA| INC.b $B0

|0291DC| RTS

;===================================================================================================

Module07_0E_13_SetRoomAndLayerAndCache:
|0291DD| LDX.w $048A

|0291E0| LDA.l LayerOfDestination.for_0476,X
|0291E4| STA.w $0476

|0291E7| LDA.l LayerOfDestination.for_EE,X
|0291EB| STA.b $EE

|0291ED| LDA.b #$10
|0291EF| TSB.b $1C

|0291F1| LDA.b $1D
|0291F3| AND.b #$0F
|0291F5| STA.b $1D

|0291F7| LDA.w $0462
|0291FA| AND.b #$04
|0291FC| BNE .going_down

|0291FE| JSL MakeNearbyWallsLowPriority

.going_down
|029202| LDA.b $A0
|029204| STA.w $048E

|029207| JMP.w ResetThenCacheRoomEntryProperties

;===================================================================================================

pool RepositionAfterSpiralStairs

.offset_x
|02920A| dw -28
|02920C| dw -28
|02920E| dw  24
|029210| dw  24

.offset_y
|029212| dw  16
|029214| dw -10
|029216| dw -10
|029218| dw -32

endpool

;---------------------------------------------------------------------------------------------------

RepositionAfterSpiralStairs:
|02921A| SEP #$20

|02921C| STZ.b $4B
|02921E| STZ.w $02F9

|029221| LDX.b #$00

|029223| LDA.w $048A
|029226| BNE .use_offset_set_a

|029228| CMP.w $0492
|02922B| BEQ .use_offset_set_a

|02922D| LDX.b #$02

.use_offset_set_a
|02922F| LDA.w $0462
|029232| AND.b #$04
|029234| BEQ .going_up

|029236| TXA
|029237| CLC
|029238| ADC.b #$04
|02923A| TAX

.going_up
|02923B| REP #$20

|02923D| LDA.b $22
|02923F| CLC
|029240| ADC.l .offset_x,X
|029244| STA.b $22

|029246| LDA.b $20
|029248| CLC
|029249| ADC.l .offset_y,X
|02924D| STA.b $20

|02924F| SEP #$20

|029251| LDA.b $1C
|029253| AND.b #$10
|029255| BEQ .sprites_not_on_mainscreen

;---------------------------------------------------------------------------------------------------

|029257| LDA.w $048A
|02925A| CMP.b #$02
|02925C| BNE .reset_follower_a

|02925E| LDA.b #$03
|029260| STA.b $EE

|029262| LDA.b $1C
|029264| AND.b #$0F
|029266| STA.b $1C

|029268| LDA.b #$10
|02926A| TSB.b $1D

|02926C| LDA.w $0492
|02926F| CMP.b #$02
|029271| BEQ .reset_follower_a

|029273| REP #$20

|029275| LDA.b $20
|029277| CLC
|029278| ADC.w #$0018
|02927B| STA.b $20

.reset_follower_a
|02927D| SEP #$20

|02927F| JSL InitializeFollower

|029283| REP #$20

|029285| RTL

;---------------------------------------------------------------------------------------------------

.sprites_not_on_mainscreen
|029286| LDA.w $048A
|029289| CMP.b #$02
|02928B| BEQ .reset_follower_b

|02928D| LDA.b #$10
|02928F| TSB.b $1C

|029291| LDA.b $1D
|029293| AND.b #$0F
|029295| STA.b $1D

|029297| LDA.w $0492
|02929A| CMP.b #$02
|02929C| BEQ .reset_follower_a

|02929E| REP #$20

|0292A0| LDA.b $20
|0292A2| SEC
|0292A3| SBC.w #$0018
|0292A6| STA.b $20

.reset_follower_b
|0292A8| SEP #$20

|0292AA| JSL InitializeFollower

|0292AE| REP #$20

|0292B0| RTL

;===================================================================================================

MakeNearbyWallsHighPriority_Exiting:
|0292B1| LDA.w $0462
|0292B4| AND.b #$04
|0292B6| BNE .exit

|0292B8| REP #$30

|0292BA| LDA.w $048C
|0292BD| CLC
|0292BE| ADC.w #$0008
|0292C1| AND.w #$007F
|0292C4| STA.b $00

;---------------------------------------------------------------------------------------------------

|0292C6| LDX.w #$FFFE

.check_next
|0292C9| INX
|0292CA| INX

|0292CB| LDA.w $06B0,X
|0292CE| ASL A
|0292CF| AND.w #$007F
|0292D2| CMP.b $00
|0292D4| BNE .check_next

;---------------------------------------------------------------------------------------------------

|0292D6| LDA.w $06B0,X
|0292D9| ASL A
|0292DA| SEC
|0292DB| SBC.w #$0008
|0292DE| STA.w $048C

|0292E1| TAX

|0292E2| LDY.w #$0004

.flag_next
|0292E5| LDA.l $7E2000,X
|0292E9| ORA.w #$2000
|0292EC| STA.l $7E2000,X

|0292F0| LDA.l $7E2080,X
|0292F4| ORA.w #$2000
|0292F7| STA.l $7E2080,X

|0292FB| LDA.l $7E2100,X
|0292FF| ORA.w #$2000
|029302| STA.l $7E2100,X

|029306| LDA.l $7E2180,X
|02930A| ORA.w #$2000
|02930D| STA.l $7E2180,X

|029311| INX
|029312| INX

|029313| DEY
|029314| BPL .flag_next

;---------------------------------------------------------------------------------------------------

|029316| SEP #$30

.exit
|029318| RTS

;===================================================================================================

pool Module07_0F_LandingWipe

.vectors
|029319| dw Module07_0F_00_InitSpotlight
|02931B| dw Module07_0F_01_OperateSpotlight

endpool

;---------------------------------------------------------------------------------------------------

Module07_0F_LandingWipe:
|02931D| LDA.b $B0
|02931F| ASL A
|029320| TAX

|029321| JSR (.vectors,X)

|029324| JSL HandleLinkAnimation_FullLongEntry
|029328| JSL DrawLink

|02932C| RTS

;===================================================================================================

Module07_0F_00_InitSpotlight:
|02932D| JSL IrisSpotlight_open

|029331| INC.b $B0

|029333| RTS

;===================================================================================================

Module07_0F_01_OperateSpotlight:
|029334| JSL HandleAllSprites
|029338| JSL IrisSpotlight_ConfigureTable

|02933C| LDA.b $11
|02933E| BNE .exit

|029340| STZ.b $96
|029342| STZ.b $97
|029344| STZ.b $98

|029346| STZ.b $1E
|029348| STZ.b $1F

|02934A| STZ.b $B0

|02934C| LDA.w $0132
|02934F| CMP.b #$FF ; SONG FF - transfer
|029351| BEQ .exit

|029353| STA.w $012C

.exit
|029356| RTS

;===================================================================================================

Module07_11_StraightInterroomStairs:
|029357| LDA.b $B0
|029359| CMP.b #$03
|02935B| BCC .skip_attributes

|02935D| JSL LoadNextObjectAttributeSet

.skip_attributes
|029361| LDA.b $B0
|029363| CMP.b #$0D
|029365| BCC .skip_gfx_upload

|029367| JSL IncrementalVRAMUpload

.skip_gfx_upload
|02936B| LDA.w $0464
|02936E| BEQ .run_subsubsub

|029370| DEC.w $0464

|029373| CMP.b #$10
|029375| BNE .no_stair_drag

|029377| LDA.b #$02
|029379| STA.b $57

.no_stair_drag
|02937B| LDX.b #$08

|02937D| LDA.b $11
|02937F| CMP.b #$12
|029381| BEQ .move_up

|029383| LDX.b #$04

.move_up
|029385| STX.b $67

|029387| JSL HandleLinkVelocity

;---------------------------------------------------------------------------------------------------

.run_subsubsub
|02938B| JSL HandleLinkAnimation_FullLongEntry

|02938F| LDA.b $B0
|029391| JSL JumpTableLocal
|029395| dw Module07_11_00_PrepAndReset                 ; 0x00
|029397| dw Module07_11_01_FadeOut                      ; 0x01
|029399| dw Module07_11_02_LoadAndPrepRoom              ; 0x02
|02939B| dw Module07_11_03_FilterAndLoadBGChars         ; 0x03
|02939D| dw Module07_11_04_FilterDoBGAndResetSprites    ; 0x04
|02939F| dw Underworld_FilterBuildBG1AndAdvance         ; 0x05
|0293A1| dw Underworld_FilterBuildBG2AndAdvance         ; 0x06
|0293A3| dw Underworld_FilterBuildBG1AndAdvance         ; 0x07
|0293A5| dw Underworld_FilterBuildBG2AndAdvance         ; 0x08
|0293A7| dw Module07_11_09_LoadSpriteGraphics           ; 0x09
|0293A9| dw Module07_11_0A_ScrollCamera                 ; 0x0A
|0293AB| dw Module07_11_0B_PrepDestination              ; 0x0B
|0293AD| dw Underworld_BuildBG2AndAdvance               ; 0x0C
|0293AF| dw Underworld_BuildBG1AndAdvance               ; 0x0D
|0293B1| dw Underworld_BuildBG2AndAdvance               ; 0x0E
|0293B3| dw DoubleApplyAndIncrementGrayscale            ; 0x0F
|0293B5| dw Module07_11_19_SetSongAndFilter             ; 0x10
|0293B7| dw Module07_11_11_KeepSliding                  ; 0x11
|0293B9| dw ResetThenCacheRoomEntryProperties           ; 0x12

;===================================================================================================

Module07_11_00_PrepAndReset:
|0293BB| LDA.w $0372
|0293BE| BEQ .not_dashing

|0293C0| STZ.w $0372

|0293C3| LDA.b #$02
|0293C5| STA.b $5E

.not_dashing
|0293C7| LDX.b #$16 ; SFX2.16

|0293C9| LDA.w $0462
|0293CC| AND.b #$04
|0293CE| BEQ .going_up

|0293D0| LDX.b #$18 ; SFX2.18

.going_up
|0293D2| STX.w $012E

;---------------------------------------------------------------------------------------------------

|0293D5| REP #$20

|0293D7| LDA.b $A0

|0293D9| CMP.w #$0030 ; ROOM 0030
|0293DC| BEQ .do_song_fade

|0293DE| CMP.w #$0040 ; ROOM 0040
|0293E1| BNE .no_song_fade

.do_song_fade
|0293E3| LDX.b #$F1 ; SONG F1 - fade
|0293E5| STX.w $012C

.no_song_fade
|0293E8| SEP #$20

|0293EA| JMP.w ResetTransitionPropsAndAdvance_ResetInterface

;===================================================================================================

Module07_11_01_FadeOut:
|0293ED| LDA.w $0464
|0293F0| CMP.b #$09
|0293F2| BCS .exit

|0293F4| JSL ApplyPaletteFilter

|0293F8| LDA.l $7EC007
|0293FC| CMP.b #$17
|0293FE| BNE .exit

|029400| INC.b $B0

.exit
|029402| RTS

;===================================================================================================

Module07_11_02_LoadAndPrepRoom:
|029403| JSL ApplyPaletteFilter

|029407| JSL LoadAndBuildRoom

|02940B| JSL ToggleStarTileGraphics
|02940F| JSL LoadTransAuxGFX
|029413| JSL LoadUnderworldTileTypes

|029417| JSL AdjustForRoomLayout
|02941B| JSL InitializeFollower

|02941F| INC.b $B0

|029421| RTS

;===================================================================================================

Module07_11_03_FilterAndLoadBGChars:
|029422| JSL ApplyPaletteFilter

|029426| JSR TriggerBGC34UpdateAndAdvance

|029429| RTS

;===================================================================================================

Module07_11_04_FilterDoBGAndResetSprites:
|02942A| JSL ApplyPaletteFilter
|02942E| JSR TriggerBGC56UpdateAndAdvance

|029431| LDA.b $A0
|029433| STA.w $048E

|029436| JSL Underworld_ResetSprites

|02943A| RTS

;===================================================================================================

Module07_11_0B_PrepDestination:
|02943B| LDY.b #$16
|02943D| LDX.w $0414

|029440| LDA.l Underworld_SubscreenEnable,X
|029444| BPL .valid_screendes

|029446| LDY.b #$17
|029448| LDA.b #$00

.valid_screendes
|02944A| STY.b $1C
|02944C| STA.b $1D

|02944E| LDY.b #$17 ; SFX2.17

|029450| INC.b $A4

|029452| LDA.b #$01
|029454| STA.b $57

|029456| LDX.b #$3C

|029458| LDA.w $0462
|02945B| AND.b #$04
|02945D| BEQ .going_up

|02945F| LDY.b #$19 ; SFX2.19

|029461| DEC.b $A4
|029463| DEC.b $A4

|029465| LDX.b #$32

;---------------------------------------------------------------------------------------------------

.going_up
|029467| STX.w $0464

|02946A| STY.w $012E

|02946D| STZ.b $00

|02946F| LDY.b $11

|029471| LDA.b $EE
|029473| BEQ .on_upper_layer

;---------------------------------------------------------------------------------------------------

|029475| REP #$20

|029477| LDA.w #$0020
|02947A| CPY.b #$12
|02947C| BNE .move_y_down_a

|02947E| LDA.w #$FFE0

.move_y_down_a
|029481| CLC
|029482| ADC.b $20
|029484| STA.b $20

|029486| INC.b $00

|029488| SEP #$20

;---------------------------------------------------------------------------------------------------

.on_upper_layer
|02948A| LDX.w $048A

|02948D| LDA.l LayerOfDestination.for_0476,X
|029491| STA.w $0476

|029494| LDA.l LayerOfDestination.for_EE,X
|029498| STA.b $EE

|02949A| BEQ .staying_on_upper_layer

|02949C| REP #$20

|02949E| LDA.w #$0020

|0294A1| CPY.b #$12
|0294A3| BNE .move_y_down_b

|0294A5| LDA.w #$FFE0

.move_y_down_b
|0294A8| CLC
|0294A9| ADC.b $20
|0294AB| STA.b $20

|0294AD| INC.b $00

|0294AF| SEP #$20

;---------------------------------------------------------------------------------------------------

.staying_on_upper_layer
|0294B1| LDA.b $00
|0294B3| BNE .skip_extra_y_adjust

|0294B5| REP #$20

|0294B7| LDA.w #$000C

|0294BA| CPY.b #$12
|0294BC| BNE .move_y_down_c

|0294BE| REP #$10

|0294C0| LDX.w #$FFE8

|0294C3| LDA.w $0462
|0294C6| AND.w #$0004
|0294C9| BNE .going_down

|0294CB| LDX.w #$FFF8

.going_down
|0294CE| TXA

.move_y_down_c
|0294CF| CLC
|0294D0| ADC.b $20
|0294D2| STA.b $20

|0294D4| SEP #$30

.skip_extra_y_adjust
|0294D6| JSR BlipAndCacheQuadrants
|0294D9| JSL RestoreTorchBackground

|0294DD| JMP.w Underworld_BuildBG1AndAdvance

;===================================================================================================

Module07_11_09_LoadSpriteGraphics:
|0294E0| JSL ApplyPaletteFilter

|0294E4| DEC.b $B0

|0294E6| JSL LoadNewSpriteGFXSet

|0294EA| JMP.w HandleRoomTranslucencyAndPalettes

;===================================================================================================

Module07_11_19_SetSongAndFilter:
|0294ED| LDA.w $0200
|0294F0| CMP.b #$05
|0294F2| BNE ApplyGrayscaleFixed_Incremental_bounce

|0294F4| LDA.l $7EC009
|0294F8| BNE ApplyGrayscaleFixed_Incremental_bounce

|0294FA| INC.b $B0

|0294FC| REP #$20

|0294FE| LDX.b #$1C ; SONG 1C

|029500| LDA.b $A0

|029502| CMP.w #$0030 ; ROOM 0030
|029505| BEQ .set_song

|029507| CMP.w #$0040 ; ROOM 0040
|02950A| BNE .skip_song

|02950C| LDX.b #$10 ; SONG 10

.set_song
|02950E| STX.w $012C

.skip_song
|029511| SEP #$20

;===================================================================================================

ApplyGrayscaleFixed_Incremental_bounce:
|029513| JSL ApplyGrayscaleFixed_Incremental

|029517| RTS

;===================================================================================================

Module07_11_11_KeepSliding:
|029518| LDA.w $0464
|02951B| BNE ApplyGrayscaleFixed_Incremental_bounce

|02951D| INC.b $B0

|02951F| RTS

;===================================================================================================

Module07_14_RecoverFromFall:
|029520| LDA.b $B0
|029522| JSL JumpTableLocal
|029526| dw Module07_14_00_ScrollCamera
|029528| dw RecoverPositionAfterDrowning

;===================================================================================================

Module07_14_00_ScrollCamera:
|02952A| REP #$20

|02952C| LDA.b $E2
|02952E| CMP.l $7EC180
|029532| BEQ .set_h_scroll
|029534| BCC .scroll_right

|029536| DEC A
|029537| CMP.l $7EC180
|02953B| BEQ .set_h_scroll

|02953D| DEC A
|02953E| BRA .set_h_scroll

.scroll_right
|029540| INC A
|029541| CMP.l $7EC180
|029545| BEQ .set_h_scroll

|029547| INC A

.set_h_scroll
|029548| STA.b $E2

|02954A| LDA.b $E8
|02954C| CMP.l $7EC182
|029550| BEQ .set_v_scroll
|029552| BCC .scroll_up

|029554| DEC A
|029555| CMP.l $7EC182
|029559| BEQ .set_v_scroll

|02955B| DEC A
|02955C| BRA .set_v_scroll

.scroll_up
|02955E| INC A
|02955F| CMP.l $7EC182
|029563| BEQ .set_v_scroll

|029565| INC A

;---------------------------------------------------------------------------------------------------

.set_v_scroll
|029566| STA.b $E8

|029568| CMP.l $7EC182
|02956C| BNE .not_at_target_camera

|02956E| LDA.b $E2
|029570| CMP.l $7EC180
|029574| BNE .not_at_target_camera

|029576| INC.b $B0

.not_at_target_camera
|029578| LDA.w $0458
|02957B| BNE .exit

|02957D| JSR UnderworldSyncBG1and2Scroll

.exit
|029580| SEP #$20

|029582| RTS

;===================================================================================================

RecoverPositionAfterDrowning:
|029583| REP #$20

|029585| LDA.l $7EC184
|029589| STA.b $20

|02958B| LDA.l $7EC186
|02958F| STA.b $22

|029591| LDA.l $7EC188
|029595| STA.w $0600

|029598| LDA.l $7EC18A
|02959C| STA.w $0604

|02959F| LDA.l $7EC18C
|0295A3| STA.w $0608

|0295A6| LDA.l $7EC18E
|0295AA| STA.w $060C

|0295AD| LDA.l $7EC190
|0295B1| STA.w $0610

|0295B4| LDA.l $7EC192
|0295B8| STA.w $0612

|0295BB| LDA.l $7EC194
|0295BF| STA.w $0614

|0295C2| LDA.l $7EC196
|0295C6| STA.w $0616

;---------------------------------------------------------------------------------------------------

|0295C9| LDA.b $1B
|0295CB| AND.w #$00FF
|0295CE| BEQ .outdoors

|0295D0| LDA.l $7EC198
|0295D4| STA.w $0618

|0295D7| INC A
|0295D8| INC A
|0295D9| STA.w $061A

|0295DC| LDA.l $7EC19A
|0295E0| STA.w $061C

|0295E3| INC A
|0295E4| INC A
|0295E5| STA.w $061E

;---------------------------------------------------------------------------------------------------

.outdoors
|0295E8| LDA.l $7EC19C
|0295EC| STA.b $A6

|0295EE| LDA.l $7EC19E
|0295F2| STA.b $A9

|0295F4| LDA.b $1B
|0295F6| AND.w #$00FF
|0295F9| BNE .indoors

|0295FB| LDA.w $0618
|0295FE| DEC A
|0295FF| DEC A
|029600| STA.w $061A

|029603| LDA.w $061C
|029606| DEC A
|029607| DEC A
|029608| STA.w $061E

;---------------------------------------------------------------------------------------------------

.indoors
|02960B| SEP #$20

|02960D| LDA.l $7EC1A6
|029611| STA.b $2F

|029613| LDA.l $7EC1A7
|029617| STA.b $EE

|029619| LDA.l $7EC1A8
|02961D| STA.w $0476

|029620| LDA.l $7EC1A9
|029624| STA.b $6C

|029626| LDA.l $7EC1AA
|02962A| STA.b $A4

|02962C| STZ.b $4B

;---------------------------------------------------------------------------------------------------

|02962E| LDA.b #$90
|029630| STA.w $031F

|029633| JSR BlipAndCacheQuadrants

|029636| STZ.w $037B

|029639| JSL ResetStateAfterDamagingPit

|02963D| STZ.w $02F9

|029640| JSL InitializeFollower

|029644| STZ.w $0642

|029647| STZ.w $0200
|02964A| STZ.b $B0

|02964C| STZ.w $0418
|02964F| STZ.b $11

|029651| LDA.l $7EF36D
|029655| BNE .exit

|029657| LDA.b #$00
|029659| STA.l $7EF36D

|02965D| LDA.b $1C
|02965F| STA.l $7EC211

|029663| LDA.b $1D
|029665| STA.l $7EC212

|029669| LDA.b $10
|02966B| STA.w $010C

|02966E| LDA.b #$12
|029670| STA.b $10

|029672| LDA.b #$01
|029674| STA.b $11

|029676| STZ.w $031F

.exit
|029679| RTS

;===================================================================================================

Module07_15_WarpPad:
|02967A| LDA.b $B0
|02967C| CMP.b #$03
|02967E| BCC .skip_upload

|029680| JSL IncrementalVRAMUpload
|029684| JSL LoadNextObjectAttributeSet

.skip_upload
|029688| LDA.b $B0
|02968A| JSL JumpTableLocal
|02968E| dw ResetTransitionPropsAndAdvance_ResetInterface ; 0x00
|029690| dw Module07_15_01_ApplyMosaicAndFilter           ; 0x01
|029692| dw InitializeRoomFromSpecial                     ; 0x02
|029694| dw UnderworldTransition_LoadSpriteGFX            ; 0x03
|029696| dw Module07_15_04_SyncRoomPropsAndBuildOverlay   ; 0x04
|029698| dw Underworld_BuildBG2AndAdvance                 ; 0x05
|02969A| dw Underworld_BuildBG1AndAdvance                 ; 0x06
|02969C| dw Underworld_BuildBG2AndAdvance                 ; 0x07
|02969E| dw Underworld_BuildBG1AndAdvance                 ; 0x08
|0296A0| dw Underworld_BuildBG2AndAdvance                 ; 0x09
|0296A2| dw Underworld_BuildBG1AndAdvance                 ; 0x0A
|0296A4| dw Underworld_BuildBG2AndAdvance                 ; 0x0B
|0296A6| dw Underworld_AdvanceAndReset                    ; 0x0C
|0296A8| dw Module07_15_0E_FadeInFromWarp                 ; 0x0D
|0296AA| dw Module07_15_0F_FinalizeAndCacheEntry          ; 0x0E

;===================================================================================================

Module07_15_01_ApplyMosaicAndFilter:
|0296AC| JSR ConditionalMosaicControl

|0296AF| LDA.l $7EC011
|0296B3| ORA.b #$03
|0296B5| STA.b $95

|0296B7| JMP.w ApplyPaletteFilter_bounce

;===================================================================================================

Module07_15_04_SyncRoomPropsAndBuildOverlay:
|0296BA| JSL ApplyGrayscaleFixed_Incremental

|0296BE| REP #$20

|0296C0| LDA.b $A0
|0296C2| CMP.w #$0017 ; ROOM 0017
|0296C5| BNE .not_hera_5F

|0296C7| LDX.b #$04
|0296C9| STX.b $A4

.not_hera_5F
|0296CB| JSR UnderworldSyncBG1and2Scroll
|0296CE| JSL AdjustForRoomLayout

|0296D2| LDY.b #$16

|0296D4| LDX.w $0414
|0296D7| LDA.l Underworld_SubscreenEnable,X
|0296DB| BPL .valid_screendes

|0296DD| LDY.b #$17
|0296DF| LDA.b #$00

.valid_screendes
|0296E1| STY.b $1C
|0296E3| STA.b $1D

|0296E5| JSL BuildBG1QuadrantForUpload

|0296E9| INC.b $B0

|0296EB| RTS

;===================================================================================================

Module07_15_0E_FadeInFromWarp:
|0296EC| LDA.l $7EC007
|0296F0| LSR A
|0296F1| BCC .dont_decrease_mosaic

|0296F3| LDA.l $7EC011
|0296F7| BEQ .dont_decrease_mosaic

|0296F9| SEC
|0296FA| SBC.b #$10
|0296FC| STA.l $7EC011

.dont_decrease_mosaic
|029700| LDA.b #$09
|029702| STA.b $94

|029704| LDA.l $7EC011
|029708| ORA.b #$03
|02970A| STA.b $95

|02970C| JMP.w ApplyPaletteFilter_bounce

;===================================================================================================

Module07_15_0F_FinalizeAndCacheEntry:
|02970F| LDA.w $0200
|029712| CMP.b #$05
|029714| BNE EXIT_02971F

|029716| JSL SetAndSaveVisitedQuadrantFlags

|02971A| STZ.b $11

|02971C| JSR ResetThenCacheRoomEntryProperties

;---------------------------------------------------------------------------------------------------

#EXIT_02971F:
|02971F| RTS

;===================================================================================================

pool Module07_16_UpdatePegs

.vectors
|029720| dw Module07_16_UpdatePegs_Step1    ; 0x00
|029722| dw Module07_16_UpdatePegs_Step1    ; 0x01
|029724| dw Module07_16_UpdatePegs_Step2    ; 0x02
|029726| dw Module07_16_UpdatePegs_Step3    ; 0x03
|029728| dw Module07_16_UpdatePegs_FinishUp ; 0x04

endpool

;---------------------------------------------------------------------------------------------------

Module07_16_UpdatePegs:
|02972A| INC.b $B0

|02972C| LDA.b $B0
|02972E| AND.b #$03
|029730| BNE EXIT_02971F

|029732| LDA.b $B0
|029734| LSR A
|029735| TAX

|029736| JMP.w (.vectors,X)

;===================================================================================================

Module07_16_UpdatePegs_Step1:
|029739| REP #$10

|02973B| LDX.w #$0100
|02973E| LDY.w #$0080

|029741| LDA.l $7EC172
|029745| BEQ .blue_pegs_up

|029747| TYX

|029748| LDY.w #$0100

.blue_pegs_up
|02974B| BRA UpdatePegGFXBuffer

;===================================================================================================

Module07_16_UpdatePegs_Step2:
|02974D| REP #$10

|02974F| LDX.w #$0080
|029752| LDY.w #$0100

|029755| LDA.l $7EC172
|029759| BEQ .blue_pegs_up

|02975B| TYX

|02975C| LDY.w #$0080

.blue_pegs_up
|02975F| BRA UpdatePegGFXBuffer

;===================================================================================================

Module07_16_UpdatePegs_Step3:
|029761| REP #$10

|029763| LDX.w #$0000
|029766| LDY.w #$0180

|029769| LDA.l $7EC172
|02976D| BEQ UpdatePegGFXBuffer

|02976F| TYX

|029770| LDY.w #$0000

;===================================================================================================

UpdatePegGFXBuffer:
|029773| STY.b $0E

|029775| PHB

|029776| LDA.b #$7F
|029778| PHA
|029779| PLB

|02977A| REP #$20

;---------------------------------------------------------------------------------------------------

|02977C| LDY.w #$0000

.next_blue
|02977F| LDA.l $7EB340,X
|029783| STA.w $7F0000,Y

|029786| INX
|029787| INX

|029788| INY
|029789| INY
|02978A| CPY.w #$0080
|02978D| BNE .next_blue

;---------------------------------------------------------------------------------------------------

|02978F| LDX.b $0E

.next_orange
|029791| LDA.l $7EB340,X
|029795| STA.w $7F0000,Y

|029798| INX
|029799| INX

|02979A| INY
|02979B| INY
|02979C| CPY.w #$0100
|02979F| BNE .next_orange

;---------------------------------------------------------------------------------------------------

|0297A1| SEP #$30

|0297A3| PLB

|0297A4| LDA.b #$17
|0297A6| STA.b $17

|0297A8| RTS

;===================================================================================================

Module07_16_UpdatePegs_FinishUp:
|0297A9| JSL FlipCrystalPegAttributes

|0297AD| STZ.b $B0
|0297AF| STZ.b $11

|0297B1| RTS

;===================================================================================================

RecoverPegGFXFromMapping:
|0297B2| REP #$10

|0297B4| LDX.w #$0000
|0297B7| LDY.w #$0180

|0297BA| LDA.l $7EC172
|0297BE| BEQ .blue_pegs_up

|0297C0| TYX

|0297C1| LDY.w #$0000

.blue_pegs_up
|0297C4| JSR UpdatePegGFXBuffer

|0297C7| RTL

;===================================================================================================

Module07_17_PressurePlate:
|0297C8| DEC.b $B0
|0297CA| BNE .exit

|0297CC| REP #$30

|0297CE| LDA.b $20
|0297D0| SEC
|0297D1| SBC.w #$0002
|0297D4| STA.b $20

|0297D6| LDA.w $04B6
|0297D9| LSR A
|0297DA| LSR A
|0297DB| LSR A
|0297DC| AND.w #$01F8
|0297DF| STA.b $02

|0297E1| LDA.w $04B6
|0297E4| AND.w #$003F
|0297E7| ASL A
|0297E8| ASL A
|0297E9| ASL A
|0297EA| STA.b $00

|0297EC| SEP #$30

|0297EE| LDY.b #$0E
|0297F0| JSL UpdateTilemapWithCommonObject

|0297F4| LDA.w $010C
|0297F7| STA.b $11

.exit
|0297F9| RTS

;===================================================================================================

CrystalGraphicsTilemapLocation:
|0297FA| dw $1618, $1658, $1658, $1618
|029802| dw $0658, $1618, $1658, $0000

;===================================================================================================

Module07_18_RescuedMaiden:
|02980A| LDA.b $B0
|02980C| JSL JumpTableLocal
|029810| dw PrepareForCrystalCutscene                   ; 0x00
|029812| dw BuildCrystalCutsceneTilemap                 ; 0x01
|029814| dw Underworld_BuildBG1AndAdvance               ; 0x02
|029816| dw Underworld_BuildBG2AndAdvance               ; 0x03
|029818| dw Underworld_BuildBG1AndAdvance               ; 0x04
|02981A| dw Underworld_BuildBG2AndAdvance               ; 0x05
|02981C| dw Underworld_BuildBG1AndAdvance               ; 0x06
|02981E| dw Underworld_BuildBG2AndAdvance               ; 0x07
|029820| dw Underworld_BuildBG1AndAdvance               ; 0x08
|029822| dw Underworld_BuildBG2AndAdvance               ; 0x09
|029824| dw StartCrystalCutscene                        ; 0x0A

;===================================================================================================

PrepareForCrystalCutscene:
|029826| JSL PaletteFilter_RestoreBGSubstractiveStrict

|02982A| LDA.l $7EC540
|02982E| STA.l $7EC500

|029832| LDA.l $7EC541
|029836| STA.l $7EC501

|02983A| LDA.l $7EC009
|02983E| CMP.b #$FF
|029840| BNE .exit

;---------------------------------------------------------------------------------------------------

|029842| REP #$30

|029844| LDX.w #$0000
|029847| LDA.w #$01EC

.next
|02984A| STA.l $7E2000,X
|02984E| STA.l $7E2800,X
|029852| STA.l $7E3000,X
|029856| STA.l $7E3800,X

|02985A| STA.l $7E4000,X
|02985E| STA.l $7E4800,X
|029862| STA.l $7E5000,X
|029866| STA.l $7E5800,X

|02986A| INX
|02986B| INX
|02986C| CPX.w #$0800
|02986F| BNE .next

;---------------------------------------------------------------------------------------------------

|029871| STZ.w $011C
|029874| STZ.w $011A

|029877| STZ.w $0422
|02987A| STZ.w $0424

|02987D| SEP #$30

|02987F| STZ.w $0418
|029882| STZ.w $045C

|029885| INC.b $B0

.exit
|029887| RTS

;===================================================================================================

BuildCrystalCutsceneTilemap:
|029888| JSL PaletteFilter_Crystal

|02988C| LDA.b #$01
|02988E| STA.b $1D

|029890| LDA.b #$02
|029892| STA.w $02E4

;---------------------------------------------------------------------------------------------------

|029895| REP #$20

|029897| LDX.b #$0E

|029899| LDA.b $A0

.next_crystal_check
|02989B| DEX
|02989C| DEX

|02989D| CMP.l CrystalBossRooms,X
|0298A1| BNE .next_crystal_check

|0298A3| LDA.l CrystalGraphicsTilemapLocation,X
|0298A7| STA.b $08

;---------------------------------------------------------------------------------------------------

|0298A9| REP #$10

|0298AB| LDA.w #$0004
|0298AE| STA.b $0C

|0298B0| STZ.b $0E

.next_super
|0298B2| LDY.w #$0007
|0298B5| LDX.b $08

.next_tile
|0298B7| LDA.b $0E
|0298B9| ORA.w #$1F80
|0298BC| STA.l $7E4000,X

|0298C0| ORA.w #$1F88
|0298C3| STA.l $7E4200,X

|0298C7| INC.b $0E

|0298C9| INX
|0298CA| INX

|0298CB| DEY
|0298CC| BPL .next_tile

|0298CE| LDA.b $0E
|0298D0| CLC
|0298D1| ADC.w #$0008
|0298D4| STA.b $0E

|0298D6| LDA.b $08
|0298D8| CLC
|0298D9| ADC.w #$0080
|0298DC| STA.b $08

|0298DE| DEC.b $0C
|0298E0| BNE .next_super

;---------------------------------------------------------------------------------------------------

|0298E2| SEP #$30

|0298E4| INC.b $B0

|0298E6| RTS

;===================================================================================================

StartCrystalCutscene:
|0298E7| INC.w $012A

|0298EA| JSL Polyhedral_InitializeThread

|0298EE| JSL CrystalCutscene_Initialize

|0298F2| STZ.b $11
|0298F4| STZ.b $B0

|0298F6| RTS

;===================================================================================================

Module07_19_MirrorFade:
|0298F7| JSR MosaicControlIncrease

|0298FA| DEC.b $13
|0298FC| BNE .exit

|0298FE| LDA.b #$05
|029900| STA.b $10

|029902| STZ.b $11
|029904| STZ.b $14

|029906| LDA.w $0130
|029909| STA.w $0133

|02990C| LDA.w $0ABD
|02990F| BEQ .exit

|029911| JSL RevertTranslucencySwap

.exit
|029915| RTS

;===================================================================================================

Module07_1A_OpenTriforceDoor:
|029916| JSL OpenTriforceDoor

|02991A| RTS

;===================================================================================================

Module0C_Unused:
|02991B| JSR ConditionalMosaicControl
|02991E| JSR Module0C_RunSubmodule

|029921| RTL

;===================================================================================================

Module0C_RunSubmodule:
|029922| LDA.b $B0
|029924| JSL JumpTableLocal
|029928| dw ResetTransitionPropsAndAdvance_ResetInterface
|02992A| dw ApplyPaletteFilter_bounce
|02992C| dw Module0C_RestoreModule

;===================================================================================================

Module0C_RestoreModule:
|02992E| LDA.w $010C
|029931| STA.b $10

|029933| STZ.b $11
|029935| STZ.b $B0

|029937| RTS

;---------------------------------------------------------------------------------------------------

Module0D_Unused:
|029938| LDA.l $7EC007
|02993C| LSR A
|02993D| BCC .dont_adjust_mosaic

|02993F| LDA.l $7EC011
|029943| SEC
|029944| SBC.b #$10
|029946| STA.l $7EC011

.dont_adjust_mosaic
|02994A| JSR CopyMosaicControl

|02994D| JSR Module0D_RunSubmodule

|029950| RTL

;---------------------------------------------------------------------------------------------------

Module0D_RunSubmodule:
|029951| LDA.b $B0
|029953| JSL JumpTableLocal
|029957| dw ApplyPaletteFilter_bounce
|029959| dw Module0D_RestoreModule

;===================================================================================================

Module0D_RestoreModule:
|02995B| STZ.b $11
|02995D| STZ.b $B0

|02995F| LDA.w $010C
|029962| STA.b $10

|029964| CMP.b #$09
|029966| BNE .exit

|029968| LDA.w $0696
|02996B| ORA.w $0698
|02996E| BEQ .exit

|029970| LDA.b #$0A
|029972| STA.b $11

|029974| LDA.b #$10
|029976| STA.w $069A

.exit
|029979| RTS

;===================================================================================================

pool Module0F_SpotlightClose

.direction
|02997A| db $08
|02997B| db $04
|02997C| db $02
|02997D| db $01

.submodules
|02997E| dw PrepExitWithSpotlight
|029980| dw Spotlight_ExitToOverworld

endpool

;---------------------------------------------------------------------------------------------------

Module0F_SpotlightClose:
|029982| JSL HandleAllSprites

|029986| LDA.b $11
|029988| ASL A
|029989| TAX

|02998A| JSR (.submodules,X)

;---------------------------------------------------------------------------------------------------

|02998D| LDA.b $1B
|02998F| BNE .indoors

|029991| LDA.b $8A
|029993| CMP.b #$0F ; OW 0F
|029995| BNE .not_waterfall_of_wishing

|029997| LDA.b #$01
|029999| STA.w $0351

.not_waterfall_of_wishing
|02999C| LDA.b #$06
|02999E| STA.b $5E

|0299A0| JSL HandleLinkVelocity

|0299A4| STZ.b $31
|0299A6| STZ.b $30

.indoors
|0299A8| LDA.b $2F
|0299AA| LSR A
|0299AB| TAX

|0299AC| LDA.b $1B
|0299AE| BNE .still_indoors

|0299B0| LDX.b #$00

|0299B2| LDA.w $010E
|0299B5| CMP.b #$43 ; ENTRANCE 43
|0299B7| BNE .still_indoors

|0299B9| INX

.still_indoors
|0299BA| LDA.l .direction,X
|0299BE| STA.b $26
|0299C0| STA.b $67

|0299C2| JSL HandleLinkAnimation_FullLongEntry
|0299C6| JML DrawLink

;===================================================================================================

PrepExitWithSpotlight:
|0299CA| STZ.w $012A
|0299CD| STZ.w $1F0C

|0299D0| LDA.b $1B
|0299D2| BNE .indoors

|0299D4| JSL DeleteWaterfallSplashes

|0299D8| REP #$20

|0299DA| LDA.b $20
|0299DC| STA.l $7EC148

|0299E0| SEP #$20

;---------------------------------------------------------------------------------------------------

.indoors
|0299E2| LDX.w $010E

|0299E5| LDA.l EntranceData.song,X
|0299E9| CMP.b #$03 ; SONG 03
|0299EB| BNE .check_if_half_vol

|0299ED| LDA.l $7EF3C5
|0299F1| CMP.b #$02
|0299F3| BCC .rain_state

.check_if_half_vol
|0299F5| CMP.b #$F2 ; SONG F2 - half volume
|0299F7| BNE .fade_song

|0299F9| LDX.w $0130
|0299FC| CPX.b #$0C ; SONG 0C
|0299FE| BNE .set_song

|029A00| LDA.b #$07 ; SONG 07
|029A02| BRA .set_song

.fade_song
|029A04| LDA.b #$F1 ; SONG F1

;---------------------------------------------------------------------------------------------------

.set_song
|029A06| STA.w $012C

.rain_state
|029A09| STZ.w $04A0

|029A0C| JSL HandleFloorIndicator

|029A10| INC.b $16

|029A12| JSL IrisSpotlight_close

|029A16| INC.b $11

;---------------------------------------------------------------------------------------------------

#EXIT_029A18:
|029A18| RTS

;===================================================================================================

Spotlight_ExitToOverworld:
|029A19| JSL IrisSpotlight_ConfigureTable

|029A1D| STZ.w $012A
|029A20| STZ.w $1F0C

|029A23| LDA.b $11
|029A25| BNE EXIT_029A18

|029A27| LDA.b $10
|029A29| CMP.b #$06
|029A2B| BNE ExitToOverworld

|029A2D| REP #$20

|029A2F| LDA.l $7EC148
|029A33| STA.b $20

|029A35| SEP #$20

;===================================================================================================

ExitToOverworld:
|029A37| LDA.b $10
|029A39| CMP.b #$09
|029A3B| BEQ .dont_reset

|029A3D| JSL EnableForceBlank
|029A41| JSL ResetBasicActions

.dont_reset
|029A45| LDA.b $10
|029A47| CMP.b #$09
|029A49| BNE .delay_advance

|029A4B| LDA.b $A1
|029A4D| BNE .underworld_2

|029A4F| LDA.b $A0
|029A51| CMP.b #$20 ; ROOM 0020
|029A53| BEQ .from_agahnim

.underworld_2
|029A55| LDA.b #$0A

|029A57| LDX.b $2F
|029A59| BNE .not_facing_up

|029A5B| LDA.b #$0B

.not_facing_up
|029A5D| STA.b $11

.from_agahnim
|029A5F| LDA.b #$10
|029A61| STA.w $069A

|029A64| LDA.w $0696
|029A67| ORA.w $0698
|029A6A| BEQ .delay_advance

|029A6C| LDA.w $0699
|029A6F| BEQ .delay_advance

|029A71| LDX.b #$00
|029A73| ASL A
|029A74| BCC .not_long_walk

|029A76| LDX.b #$18

.not_long_walk
|029A78| LDA.w $0699
|029A7B| AND.b #$7F
|029A7D| STA.w $0699

|029A80| STX.w $0692
|029A83| STZ.w $0690

|029A86| LDA.b #$09
|029A88| STA.b $11

|029A8A| STZ.b $B0

|029A8C| LDA.b #$15 ; SFX3.15
|029A8E| STA.w $012F

;---------------------------------------------------------------------------------------------------

.delay_advance
|029A91| STZ.b $96
|029A93| STZ.b $97
|029A95| STZ.b $98

|029A97| STZ.b $1E
|029A99| STZ.b $1F

|029A9B| STZ.w $03EF

;---------------------------------------------------------------------------------------------------

|029A9E| REP #$30

|029AA0| LDX.w #$4C26
|029AA3| LDY.w #$8C4C

|029AA6| LDA.b $8A
|029AA8| CMP.w #$0003 ; OW 03
|029AAB| BEQ .on_dm_screens

|029AAD| CMP.w #$0005 ; OW 05
|029AB0| BEQ .on_dm_screens

|029AB2| CMP.w #$0007 ; OW 07
|029AB5| BEQ .on_dm_screens

|029AB7| LDX.w #$4A26
|029ABA| LDY.w #$874A

|029ABD| CMP.w #$0043 ; OW 43
|029AC0| BEQ .on_dm_screens

|029AC2| CMP.w #$0045 ; OW 45
|029AC5| BEQ .on_dm_screens

|029AC7| CMP.w #$0047 ; OW 47
|029ACA| BNE .not_dm_screen

.on_dm_screens
|029ACC| STX.b $9C
|029ACE| STY.b $9D

.not_dm_screen
|029AD0| SEP #$30

|029AD2| RTS

;===================================================================================================

pool Module10_SpotlightOpen

.submodules
|029AD3| dw Module10_00_OpenIris
|029AD5| dw Spotlight_ExitToOverworld

endpool

;---------------------------------------------------------------------------------------------------

Module10_SpotlightOpen:
|029AD7| JSL HandleAllSprites

|029ADB| LDA.b $11
|029ADD| ASL A
|029ADE| TAX

|029ADF| JSR (.submodules,X)

|029AE2| JML DrawLink

;===================================================================================================

Module10_00_OpenIris:
|029AE6| JSL IrisSpotlight_open

|029AEA| INC.b $11

|029AEC| RTS

;===================================================================================================

pool Module11_UnderworldFallingEntrance

.vectors
|029AED| dw Module_11_00_SetSongAndInit        ; 0x00
|029AEF| dw PaletteFilter_bounce               ; 0x01
|029AF1| dw Module11_02_LoadEntrance           ; 0x02
|029AF3| dw UnderworldTransition_LoadSpriteGFX ; 0x03
|029AF5| dw Module11_04_FadeAndLoadQuadrants   ; 0x04
|029AF7| dw Module11_05_LoadQuadrants          ; 0x05

endpool

;---------------------------------------------------------------------------------------------------

Module11_UnderworldFallingEntrance:
|029AF9| LDA.b $B0
|029AFB| ASL A
|029AFC| TAX

|029AFD| JSR (.vectors,X)

|029B00| RTL

;===================================================================================================

Module_11_00_SetSongAndInit:
|029B01| LDX.w $010E

|029B04| LDA.l EntranceData.song,X
|029B08| CMP.b #$03 ; SONG 03
|029B0A| BNE .fade

|029B0C| LDA.l $7EF3C5
|029B10| CMP.b #$02
|029B12| BCC .rain_state

.fade
|029B14| LDA.b #$F1 ; SONG F1 - fade
|029B16| STA.w $012C

.rain_state
|029B19| JMP.w ResetTransitionPropsAndAdvance_ResetInterface

;===================================================================================================

Module11_02_LoadEntrance:
|029B1C| JSL EnableForceBlank

|029B20| LDA.b #$02
|029B22| STA.b $99

|029B24| JSR LoadUnderworldEntrance

|029B27| LDA.w $040C
|029B2A| CMP.b #$FF ; DUNGEON FF
|029B2C| BEQ .caves

|029B2E| CMP.b #$02 ; DUNGEON 02
|029B30| BNE .not_castle

|029B32| LDA.b #$00 ; DUNGEON 00

.not_castle
|029B34| LSR A
|029B35| TAX

|029B36| LDA.l $7EF37C,X

;---------------------------------------------------------------------------------------------------

.caves
|029B3A| JSL RebuildHUD_Keys

|029B3E| LDA.b #$04
|029B40| STA.b $5A

|029B42| LDA.b #$03
|029B44| STA.b $5B

|029B46| LDA.b #$0C
|029B48| STA.b $4B

|029B4A| LDA.b #$10
|029B4C| STA.b $57

|029B4E| LDA.b $20
|029B50| SEC
|029B51| SBC.b $E8
|029B53| STA.b $00
|029B55| STZ.b $01

|029B57| STZ.w $0308
|029B5A| STZ.w $0309
|029B5D| STZ.w $030B

;---------------------------------------------------------------------------------------------------

|029B60| REP #$30

|029B62| LDA.b $A0
|029B64| STA.b $A2

|029B66| LDA.w #$0010
|029B69| CLC
|029B6A| ADC.b $00
|029B6C| STA.b $00

|029B6E| LDA.b $20
|029B70| STA.b $51

|029B72| SEC
|029B73| SBC.b $00
|029B75| STA.b $20

;---------------------------------------------------------------------------------------------------

|029B77| SEP #$30

|029B79| LDA.b $B0
|029B7B| PHA

|029B7C| STZ.w $045A
|029B7F| STZ.w $0458

|029B82| JSR LoadAndDrawRoom
|029B85| JSL LoadUnderworldTileTypes

|029B89| LDX.w $0AA1

|029B8C| LDA.l AnimatedTileSheets,X
|029B90| TAY

|029B91| JSL DecompressAnimatedUnderworldTiles
|029B95| JSL LoadEveryObjectAttributeSet

;---------------------------------------------------------------------------------------------------

|029B99| PLA
|029B9A| INC A
|029B9B| STA.b $B0

|029B9D| LDA.b #$0A
|029B9F| STA.w $0AA4

|029BA2| LDA.b #$02
|029BA4| STA.w OBSEL

|029BA7| JSL InitializeTilesets

|029BAB| LDA.b #$0A
|029BAD| STA.w $0AB1

|029BB0| JSR LoadUnderworldPalettes
|029BB3| JSL RestoreTorchBackground

|029BB7| STZ.b $3A
|029BB9| STZ.b $3C

;---------------------------------------------------------------------------------------------------

|029BBB| JSR ResetLampconeAndLink

|029BBE| LDA.w $02E0
|029BC1| BEQ .not_bunny

|029BC3| JSL RefreshEquipmentPalettes_bunny

.not_bunny
|029BC7| LDA.b #$80
|029BC9| STA.b $9B

|029BCB| JSL HandleItemRefills
|029BCF| JSL UnderworldAdjustRainSFX

|029BD3| LDA.b #$07
|029BD5| STA.b $11

;===================================================================================================

LoadUnderworldSongBankIfNeeded:
|029BD7| LDA.w $0132
|029BDA| CMP.b #$FF ; SONG FF - transfer
|029BDC| BEQ .exit

|029BDE| CMP.b #$F2 ; SONG F2 - half volume
|029BE0| BEQ .exit

|029BE2| CMP.b #$03 ; SONG 03
|029BE4| BEQ .overworld_song

|029BE6| CMP.b #$07 ; SONG 07
|029BE8| BEQ .overworld_song

|029BEA| CMP.b #$0E ; SONG 0E
|029BEC| BEQ .overworld_song

|029BEE| LDA.w $0136
|029BF1| BNE .exit

|029BF3| SEI
|029BF4| STZ.w NMITIMEN
|029BF7| STZ.w HDMAEN

|029BFA| INC.w $0136

|029BFD| LDA.b #$FF ; SONG FF - transfer
|029BFF| STA.w APUIO0

|029C02| JSL LoadUnderworldSongs

|029C06| LDA.b #$81
|029C08| STA.w NMITIMEN

.exit
|029C0B| RTS

;---------------------------------------------------------------------------------------------------

.overworld_song
|029C0C| JMP.w LoadOWMusicIfNeeded

;===================================================================================================

Module11_04_FadeAndLoadQuadrants:
|029C0F| LDA.b $13
|029C11| INC A
|029C12| AND.b #$0F
|029C14| STA.b $13

|029C16| CMP.b #$0F
|029C18| BNE Module11_05_LoadQuadrants

|029C1A| INC.b $B0

;===================================================================================================

Module11_05_LoadQuadrants:
|029C1C| JSL HandleUnderworldLandingFromPit

|029C20| LDA.b $11
|029C22| BNE .exit

|029C24| LDA.b #$07
|029C26| STA.b $10

|029C28| INC.w $04C7

|029C2B| JSR BlipAndCacheQuadrants
|029C2E| JSR ResetThenCacheRoomEntryProperties

|029C31| LDA.w $0132
|029C34| STA.w $012C

|029C37| LDA.w $0130
|029C3A| STA.w $0133

.exit
|029C3D| RTS

;===================================================================================================

pool Module13_PendantBossVictory

.submodules
|029C3E| dw VictoriousHeal                     ; 0x00
|029C40| dw StartVictorySpin                   ; 0x01
|029C42| dw RunVictorySpin                     ; 0x02
|029C44| dw FinishVictorySpin                  ; 0x03
|029C46| dw PrepExitWithSpotlight              ; 0x04
|029C48| dw Spotlight_ExitToOverworld          ; 0x05

endpool

;---------------------------------------------------------------------------------------------------

Module13_PendantBossVictory:
|029C4A| LDA.b $11
|029C4C| ASL A
|029C4D| TAX

|029C4E| JSR (.submodules,X)

|029C51| JSL HandleAllSprites
|029C55| JML DrawLink

;===================================================================================================

VictoriousHeal:
|029C59| JSL FullyRefillMagic
|029C5D| BCS .still_restoring_magic

|029C5F| INC.w $0200

.still_restoring_magic
|029C62| JSL FullyRefillHealth
|029C66| BCS .still_healing_hp

|029C68| INC.w $0200

.still_healing_hp
|029C6B| LDA.w $0200
|029C6E| BNE .reset_subsub

;---------------------------------------------------------------------------------------------------

|029C70| LDA.b $3A
|029C72| AND.b #$BF
|029C74| STA.b $3A

|029C76| JSR DeleteCertainAncillaeStopDashing

|029C79| LDA.b #$02
|029C7B| STA.b $2F

|029C7D| ASL A
|029C7E| STA.b $26

|029C80| INC.b $16
|029C82| INC.b $11

|029C84| LDA.b #$10
|029C86| STA.b $B0

|029C88| INC.w $02E4

;---------------------------------------------------------------------------------------------------

.reset_subsub
|029C8B| STZ.w $0200

|029C8E| JSL HandleItemRefills

|029C92| RTS

;===================================================================================================

StartVictorySpin:
|029C93| DEC.b $B0
|029C95| BNE .exit

|029C97| STZ.w $02E4

|029C9A| LDA.b #$02
|029C9C| STA.b $2F

|029C9E| JSL AnimateVictorySpin_long
|029CA2| JSL TerminateSelectInteractives
|029CA6| JSL AncillaAdd_SwordUpSparkle

|029CAA| INC.b $11

.exit
|029CAC| RTS

;===================================================================================================

RunVictorySpin:
|029CAD| JSL Link

|029CB1| LDA.b $5D
|029CB3| CMP.b #$00 ; LINKSTATE 00
|029CB5| BNE .exit

|029CB7| LDA.l $7EF359
|029CBB| INC A
|029CBC| AND.b #$FE
|029CBE| BEQ .skip_sfx

|029CC0| LDA.b #$2C ; SFX2.2C
|029CC2| STA.w $012E

.skip_sfx
|029CC5| LDA.b #$01
|029CC7| STA.w $03EF

|029CCA| LDA.b #$20
|029CCC| STA.b $B0

|029CCE| INC.b $11

.exit
|029CD0| RTS

;===================================================================================================

FinishVictorySpin:
|029CD1| DEC.b $B0
|029CD3| BNE .exit

|029CD5| INC.b $11

|029CD7| STZ.b $30
|029CD9| STZ.b $31

|029CDB| LDA.b #$00
|029CDD| STA.l $7EC017

.exit
|029CE1| RTS

;===================================================================================================

pool Module15_MirrorWarpFromAga

.submodules
|029CE2| dw Module15_00_Initialize          ; 0x00
|029CE4| dw Module15_01_SetTheScene         ; 0x01
|029CE6| dw Module15_02_RunMirrorWarp_Part1 ; 0x02
|029CE8| dw Module15_03_RunMirrorWarp_Part2 ; 0x03
|029CEA| dw Module15_04_RunMirrorWarp_Part3 ; 0x04
|029CEC| dw Module15_05_PrepTelepathy       ; 0x05
|029CEE| dw Module15_06_ShortDelay          ; 0x06
|029CF0| dw Module15_07_HandleTelepathy     ; 0x07
|029CF2| dw Module15_08_MoonPearlHint       ; 0x08
|029CF4| dw VictoriousHeal                  ; 0x09
|029CF6| dw StartVictorySpin                ; 0x0A
|029CF8| dw RunVictorySpin                  ; 0x0B
|029CFA| dw Module15_0C_ReturnControl       ; 0x0C

endpool

;---------------------------------------------------------------------------------------------------

Module15_MirrorWarpFromAga:
|029CFC| LDA.b $11
|029CFE| ASL A
|029CFF| TAX

|029D00| JSR (.submodules,X)

|029D03| LDA.b $11
|029D05| CMP.b #$02
|029D07| BCC .draw_link

|029D09| CMP.b #$05
|029D0B| BCC .exit

.draw_link
|029D0D| JSL HandleAllSprites
|029D11| JSL DrawLink

.exit
|029D15| RTL

;===================================================================================================

Module15_00_Initialize:
|029D16| STZ.w $0710

|029D19| INC.w $0200
|029D1C| INC.b $11

|029D1E| JSR LoadOWMusicIfNeeded

|029D21| RTS

;===================================================================================================

Module15_01_SetTheScene:
|029D22| LDA.b #$08 ; SONG 08
|029D24| STA.w $012C
|029D27| STA.w $0410

|029D2A| JSL InitializeMirrorHDMA

|029D2E| STZ.w $0200

|029D31| JSL PaletteFilter_InitializeWhiteFilter

|029D35| JSR LoadGraphicsAndScreenSize

|029D38| INC.b $11

|029D3A| LDA.b #$14 ; LINKSTATE 14
|029D3C| STA.b $5D

|029D3E| REP #$20

|029D40| STZ.w $011A
|029D43| STZ.w $011C

|029D46| STZ.w $0402
|029D49| STZ.b $30

|029D4B| LDA.w #$7FFF ; RGB: #F8F8F8
|029D4E| STA.l $7EC500
|029D52| STA.l $7EC540

|029D56| SEP #$20

|029D58| JSL ResetAncillaAndLink

|029D5C| RTS

;===================================================================================================

Module15_05_PrepTelepathy:
|029D5D| REP #$30

|029D5F| LDA.w #$2641
|029D62| STA.w DMA7MODE

|029D65| LDX.w #$003E

|029D68| LDA.w #$FF00

;---------------------------------------------------------------------------------------------------

.next
|029D6B| STA.w $1B00,X
|029D6E| STA.w $1B40,X
|029D71| STA.w $1B80,X
|029D74| STA.w $1BC0,X

|029D77| STA.w $1C00,X
|029D7A| STA.w $1C40,X
|029D7D| STA.w $1C80,X

|029D80| DEX
|029D81| DEX
|029D82| BPL .next

;---------------------------------------------------------------------------------------------------

|029D84| LDA.w #$0000
|029D87| STA.l $7EC007
|029D8B| STA.l $7EC009

|029D8F| SEP #$20

|029D91| LDX.w #$0035 ; MESSAGE 0035
|029D94| STX.w $1CF0

|029D97| SEP #$10

|029D99| JSL PrepAndDisplayMessage

|029D9D| JSL ReloadPreviouslyLoadedSheets
|029DA1| JSL RebuildHUD_HideKeys

|029DA5| LDA.b #$80
|029DA7| STA.b $9B

|029DA9| LDA.b #$15
|029DAB| STA.b $10

|029DAD| LDA.b #$06
|029DAF| STA.b $11

|029DB1| LDA.b #$18
|029DB3| STA.b $B0

|029DB5| RTS

;===================================================================================================

Module15_06_ShortDelay:
|029DB6| DEC.b $B0
|029DB8| BNE .exit

|029DBA| INC.b $11

|029DBC| LDA.b #$09 ; SFX1.09
|029DBE| STA.w $012D

.exit
|029DC1| RTS

;===================================================================================================

Module15_07_HandleTelepathy:
|029DC2| JSL RenderText

|029DC6| LDA.b $11
|029DC8| BNE .exit

|029DCA| STZ.w $0200

|029DCD| LDA.b #$05 ; SFX1.05
|029DCF| STA.w $012D

|029DD2| LDX.b #$09

|029DD4| LDA.l $7EF357
|029DD8| BNE .have_pearl

;---------------------------------------------------------------------------------------------------

|029DDA| REP #$20

|029DDC| LDA.w #$0036 ; MESSAGE 0036
|029DDF| STA.w $1CF0

|029DE2| SEP #$20

|029DE4| JSL PrepAndDisplayMessage

|029DE8| STZ.w $012D

|029DEB| LDA.b #$15
|029DED| STA.b $10

|029DEF| LDX.b #$09
|029DF1| DEX

;---------------------------------------------------------------------------------------------------

.have_pearl
|029DF2| STX.b $11

.exit
|029DF4| RTS

;===================================================================================================

Module15_08_MoonPearlHint:
|029DF5| JSL RenderText

|029DF9| LDA.b $11
|029DFB| BNE .exit

|029DFD| LDA.b #$20
|029DFF| STA.b $B0

|029E01| LDX.b #$0C
|029E03| STX.b $11

.exit
|029E05| RTS

;===================================================================================================

Module15_02_RunMirrorWarp_Part1:
|029E06| JSL MirrorWarp_BuildAndEnableHDMATable

|029E0A| INC.b $11
|029E0C| STZ.b $B0

|029E0E| RTS

;===================================================================================================

Module15_03_RunMirrorWarp_Part2:
|029E0F| JSL MirrorWarp_BuildWavingHDMATable

|029E13| BRA .check_subsub

;===================================================================================================

#Module15_04_RunMirrorWarp_Part3:
|029E15| JSL MirrorWarp_BuildDewavingHDMATable

;---------------------------------------------------------------------------------------------------

.check_subsub
|029E19| LDA.b $B0
|029E1B| BEQ .exit

|029E1D| STZ.b $B0

|029E1F| INC.b $11

.exit
|029E21| RTS

;===================================================================================================

Module15_0C_ReturnControl:
|029E22| DEC.b $B0
|029E24| BNE .exit

|029E26| JSL ResetAncillaAndCutscene
|029E2A| JSL AdjustOverworldAmbiance

|029E2E| LDA.l $7EF29B
|029E32| ORA.b #$20
|029E34| STA.l $7EF29B

|029E38| LDA.b #$FF
|029E3A| STA.w $040C

|029E3D| STZ.b $11
|029E3F| STZ.w $0200

|029E42| STZ.w $0710

|029E45| LDA.b #$09
|029E47| STA.b $10

|029E49| STZ.b $E6

|029E4B| LDX.b #$09 ; SONG 09

|029E4D| LDA.l $7EF357
|029E51| BNE .have_pearl

|029E53| LDX.b #$04 ; SONG 04

.have_pearl
|029E55| STX.w $012C

|029E58| LDA.b #$06
|029E5A| STA.l $7EF3C7

.exit
|029E5E| RTS

;===================================================================================================

SetTargetOverworldWarpToPyramid:
|029E5F| LDA.b $10
|029E61| CMP.b #$15
|029E63| BNE .exit

|029E65| JSR LoadOverworldFromUnderworld

|029E68| LDY.b #$5A
|029E6A| JSL DecompressAnimatedOverworldTiles

;===================================================================================================

#ResetAncillaAndCutscene:
|029E6E| JSL TerminateSelectInteractives

|029E72| STZ.w $037B

|029E75| STZ.b $3C
|029E77| STZ.b $3A

|029E79| STZ.w $03EF
|029E7C| STZ.w $02E4

.exit
|029E7F| RTL

;===================================================================================================

pool Module16_CrystalBossVictory

.submodules
|029E80| dw VictoriousHeal              ; 0x00
|029E82| dw StartVictorySpin            ; 0x01
|029E84| dw RunVictorySpin              ; 0x02
|029E86| dw FinishVictorySpin           ; 0x03
|029E88| dw Module16_04_FadeAndEnd      ; 0x04

endpool

;---------------------------------------------------------------------------------------------------

Module16_CrystalBossVictory:
|029E8A| LDA.b $11
|029E8C| ASL A
|029E8D| TAX

|029E8E| JSR (.submodules,X)

|029E91| JSL HandleAllSprites
|029E95| JML DrawLink

;===================================================================================================

#EXIT_029E99:
|029E99| RTS

;---------------------------------------------------------------------------------------------------

Module16_04_FadeAndEnd:
|029E9A| DEC.b $13
|029E9C| BNE EXIT_029E99

|029E9E| REP #$20

|029EA0| STZ.w $011A
|029EA3| STZ.w $011C

|029EA6| STZ.b $30

|029EA8| SEP #$20

|029EAA| STZ.w $02E4

|029EAD| JSL RevertTranslucencySwap

|029EB1| LDA.b #$00 ; LINKSTATE 00
|029EB3| STA.b $5D

|029EB5| STZ.w $02D8
|029EB8| STZ.w $02DA
|029EBB| STZ.w $037B

|029EBE| LDA.w $010C
|029EC1| STA.b $10

|029EC3| STZ.b $11
|029EC5| STZ.b $B0

|029EC7| JMP.w ExitToOverworld

;===================================================================================================

pool Module18_GanonEmerges

.submodules
|029ECA| dw Module18_00 ; 0x00
|029ECC| dw Module18_01 ; 0x01
|029ECE| dw Module18_02 ; 0x02
|029ED0| dw Module18_03 ; 0x03
|029ED2| dw Module18_04 ; 0x04
|029ED4| dw Module18_05 ; 0x05
|029ED6| dw EXIT_029FC0 ; 0x06
|029ED8| dw Module18_07 ; 0x07
|029EDA| dw Module18_08 ; 0x08

endpool

;---------------------------------------------------------------------------------------------------

Module18_GanonEmerges:
|029EDC| REP #$21

|029EDE| LDA.b $E2
|029EE0| PHA

|029EE1| ADC.w $011A
|029EE4| STA.b $E2
|029EE6| STA.w $011E

|029EE9| LDA.b $E8
|029EEB| PHA

|029EEC| CLC
|029EED| ADC.w $011C
|029EF0| STA.b $E8
|029EF2| STA.w $0122

|029EF5| LDA.b $E0
|029EF7| PHA

|029EF8| CLC
|029EF9| ADC.w $011A
|029EFC| STA.b $E0
|029EFE| STA.w $0120

|029F01| LDA.b $E6
|029F03| PHA

|029F04| CLC
|029F05| ADC.w $011C
|029F08| STA.b $E6
|029F0A| STA.w $0124

;---------------------------------------------------------------------------------------------------

|029F0D| SEP #$20

|029F0F| JSL HandleAllSprites

|029F13| REP #$20

;---------------------------------------------------------------------------------------------------

|029F15| PLA
|029F16| STA.b $E6

|029F18| PLA
|029F19| STA.b $E0

|029F1B| PLA
|029F1C| STA.b $E8

|029F1E| PLA
|029F1F| STA.b $E2

;---------------------------------------------------------------------------------------------------

|029F21| SEP #$20

|029F23| LDA.w $0200
|029F26| ASL A
|029F27| TAX

|029F28| JSR (.submodules,X)
|029F2B| JML DrawLink

;===================================================================================================

Module18_00:
|029F2F| JSL HandleRoomLayerEffect
|029F33| JSL CallForDuckIndoors
|029F37| JSL SaveDungeonKeys

|029F3B| INC.w $0200
|029F3E| INC.w $02E4

|029F41| RTS

;===================================================================================================

Module18_01:
|029F42| JSL HandleRoomLayerEffect

|029F46| LDA.b $11
|029F48| CMP.b #$0A
|029F4A| BNE .exit

|029F4C| LDA.b #$5B ; OW 5B
|029F4E| STA.b $8A

|029F50| STZ.b $1B

|029F52| LDA.b #$18
|029F54| STA.b $10
|029F56| STZ.b $11

|029F58| LDA.b #$02
|029F5A| STA.w $0200

.exit
|029F5D| RTS

;===================================================================================================

Module18_02:
|029F5E| JSL HandleRoomLayerEffect

|029F62| DEC.b $13
|029F64| BNE .exit

|029F66| JSL EnableForceBlank

|029F6A| INC.w $0200

|029F6D| JSL RebuildHUD_HideKeys

|029F71| STZ.b $30
|029F73| STZ.b $31

.exit
|029F75| RTS

;===================================================================================================

Module18_03:
|029F76| LDA.b #$08
|029F78| STA.w $1AF0
|029F7B| STZ.w $1AF1

|029F7E| JSL FluteMenu_LoadSelectedScreen

|029F82| JSR LoadOWMusicIfNeeded

|029F85| LDA.b #$09 ; SONG 09
|029F87| STA.w $012C

|029F8A| RTS

;===================================================================================================

Module18_04:
|029F8B| JSL Overworld_LoadOverlayAndMap

|029F8F| LDA.b #$00
|029F91| STA.b $B0

|029F93| RTS

;===================================================================================================

Module18_05:
|029F94| INC.b $13

|029F96| LDA.b $13
|029F98| CMP.b #$0F
|029F9A| BNE EXIT_029FC0

|029F9C| STZ.w $0402
|029F9F| STZ.w $0403

|029FA2| STZ.w $0FC1

|029FA5| JSL SpawnBatCrashCutscene

|029FA9| LDA.b #$02
|029FAB| STA.b $2F

|029FAD| LDA.b #$09
|029FAF| STA.w $010C

|029FB2| STZ.b $1B

|029FB4| INC.w $0200

|029FB7| LDA.b #$80
|029FB9| STA.b $B0

|029FBB| LDA.b #$FF
|029FBD| STA.w $040C

;---------------------------------------------------------------------------------------------------

#EXIT_029FC0:
|029FC0| RTS

;===================================================================================================

Module18_07:
|029FC1| DEC.b $B0
|029FC3| BNE EXIT_029FC0

|029FC5| INC.w $0200

|029FC8| RTS

;===================================================================================================

Module18_08:
|029FC9| JSL SpawnLandingDuck

|029FCD| RTS

;===================================================================================================

pool Module19_TriforceRoom

.submodules
|029FCE| dw Module19_00_ResetAndInit          ; 0x00
|029FD0| dw Module19_01_MosaicAndPalette      ; 0x01
|029FD2| dw Module19_02_LoadMusicAndScreen    ; 0x02
|029FD4| dw Module19_03_PrepTileSetsPalette   ; 0x03
|029FD6| dw Module19_04_LoadAndSongAndAdvance ; 0x04
|029FD8| dw Module19_05_WalkLinkIn            ; 0x05
|029FDA| dw Module19_06_MosaicFadeIn          ; 0x06
|029FDC| dw Module19_07_PrepMessage           ; 0x07
|029FDE| dw Module19_TriforceExpansionControl ; 0x08
|029FE0| dw Module19_09_TriforceSpeak         ; 0x09
|029FE2| dw Module19_TriforceExpansionControl ; 0x0A
|029FE4| dw Module19_0B_ApproachTriforce      ; 0x0B
|029FE6| dw Module19_0C_HoldTriforce          ; 0x0C
|029FE8| dw Module19_0D_FadeToWhite           ; 0x0D
|029FEA| dw Module19_0E_AdvanceToCredits      ; 0x0E

endpool

;---------------------------------------------------------------------------------------------------

Module19_TriforceRoom:
|029FEC| LDA.b $B0
|029FEE| ASL A
|029FEF| TAX

|029FF0| JSR (.submodules,X)

;---------------------------------------------------------------------------------------------------

|029FF3| REP #$20

|029FF5| LDA.b $E0
|029FF7| STA.w $0120

|029FFA| LDA.b $E6
|029FFC| STA.w $0124

|029FFF| LDA.b $E2
|02A001| STA.w $011E

|02A004| LDA.b $E8
|02A006| STA.w $0122

;---------------------------------------------------------------------------------------------------

|02A009| SEP #$20

|02A00B| LDA.b $B0
|02A00D| CMP.b #$07
|02A00F| BCC .move_link

|02A011| CMP.b #$0B
|02A013| BCC .dont_move_link

.move_link
|02A015| JSL HandleLinkVelocity
|02A019| JSL HandleLinkAnimation_FullLongEntry

.dont_move_link
|02A01D| JML DrawLink

;===================================================================================================

Module19_00_ResetAndInit:
|02A021| JSL ResetLinkProperties_A

|02A025| STZ.b $66

|02A027| LDA.b #$F1 ; SONG F1 - fade
|02A029| STA.w $012C

|02A02C| JMP.w ResetTransitionPropsAndAdvance_ResetInterface

;===================================================================================================

Module19_01_MosaicAndPalette:
|02A02F| JSR ConditionalMosaicControl

|02A032| JMP.w ApplyPaletteFilter_bounce

;===================================================================================================

Module19_02_LoadMusicAndScreen:
|02A035| JSL EnableForceBlank

|02A039| SEI

|02A03A| STZ.w NMITIMEN

|02A03D| LDA.b #$FF ; SONG FF - transfer
|02A03F| STA.w APUIO0

|02A042| JSL LoadCreditsSongs

|02A046| LDA.b #$81
|02A048| STA.w NMITIMEN

|02A04B| LDA.b #$89
|02A04D| STA.b $A0

|02A04F| LDA.b #$01
|02A051| STA.b $A1

|02A053| JSL EraseTilemaps_normal
|02A057| JSL RevertTranslucencySwap
|02A05B| JSR LoadSpecialOverworld

|02A05E| JSR ReloadSubscreenOverlay

|02A061| INC.b $B0

|02A063| BRA RefreshTriforceModule

;===================================================================================================

Module19_03_PrepTileSetsPalette:
|02A065| LDA.b #$24
|02A067| STA.w $0AA1

|02A06A| LDA.b #$7D
|02A06C| STA.w $0AA3

|02A06F| LDA.b #$51
|02A071| STA.w $0AA2

|02A074| JSL InitializeTilesets

|02A078| LDX.b #$04
|02A07A| JSR OverworldLoadScreensPaletteSet_Preloaded

|02A07D| LDA.b #$0E
|02A07F| JSL OverworldPalettesLoader
|02A083| JSR SpecialOverworld_CopyPalettesToCache

|02A086| INC.b $B0

|02A088| RTS

;===================================================================================================

Module19_04_LoadAndSongAndAdvance:
|02A089| LDA.b $B0
|02A08B| PHA

|02A08C| JSR Module08_02_LoadAndAdvance

|02A08F| PLA
|02A090| INC A
|02A091| STA.b $B0

;---------------------------------------------------------------------------------------------------

|02A093| LDA.b #$0F
|02A095| STA.b $13

|02A097| LDA.b #$1F
|02A099| STA.l $7EC007

|02A09D| LDA.b #$00
|02A09F| STA.l $7EC00B

|02A0A3| LDA.b #$01
|02A0A5| STA.b $E1

|02A0A7| LDA.b #$02
|02A0A9| STA.b $99

|02A0AB| LDA.b #$32
|02A0AD| STA.b $9A

|02A0AF| LDA.b #$F0
|02A0B1| STA.l $7EC011

|02A0B5| LDA.b #$EC
|02A0B7| STA.b $20

|02A0B9| LDA.b #$78
|02A0BB| STA.b $22

|02A0BD| LDA.b #$02
|02A0BF| STA.b $EE

|02A0C1| LDA.b #$20 ; SONG 20
|02A0C3| STA.w $012C

;===================================================================================================

RefreshTriforceModule:
|02A0C6| LDA.b #$19
|02A0C8| STA.b $10

|02A0CA| STZ.b $11

|02A0CC| RTS

;===================================================================================================

Module19_05_WalkLinkIn:
|02A0CD| LDA.b #$08
|02A0CF| STA.b $67
|02A0D1| STA.b $26

|02A0D3| STZ.b $2F

|02A0D5| LDA.b $20
|02A0D7| CMP.b #$C0
|02A0D9| BCS .exit

|02A0DB| STZ.b $67
|02A0DD| STZ.b $26
|02A0DF| STZ.b $2E

|02A0E1| INC.b $B0

.exit
|02A0E3| RTS

;===================================================================================================

Module19_06_MosaicFadeIn:
|02A0E4| LDA.l $7EC007
|02A0E8| LSR A
|02A0E9| BCS .continue

|02A0EB| LDA.l $7EC011
|02A0EF| BEQ .continue

|02A0F1| SEC
|02A0F2| SBC.b #$10
|02A0F4| STA.l $7EC011

.continue
|02A0F8| JSR CopyMosaicControl
|02A0FB| JSL ApplyPaletteFilter

|02A0FF| RTS

;===================================================================================================

Module19_07_PrepMessage:
|02A100| JSL TriforceRoom_PrepGFXSlotForPoly

|02A104| REP #$20

|02A106| LDA.w #$0173 ; MESSAGE 0173
|02A109| STA.w $1CF0

|02A10C| SEP #$20

|02A10E| JSL PrepAndDisplayMessage

|02A112| JSL RenderText

|02A116| LDA.b #$80
|02A118| STA.b $C8

|02A11A| LDA.b #$19
|02A11C| STA.b $10

|02A11E| INC.b $B0

|02A120| RTS

;===================================================================================================

Module19_09_TriforceSpeak:
|02A121| JSL AdvancePolyhedral
|02A125| JSL RenderText

|02A129| LDA.b $11
|02A12B| BNE .exit

|02A12D| STZ.w $0200

|02A130| LDA.b #$19
|02A132| STA.b $10

|02A134| INC.b $B0

.exit
|02A136| RTS

;===================================================================================================

Module19_TriforceExpansionControl:
|02A137| JSL AdvancePolyhedral

|02A13B| LDA.b $B0
|02A13D| CMP.b #$0B
|02A13F| BNE .exit

|02A141| LDA.b #$21 ; SONG 21
|02A143| STA.w $012C

|02A146| LDA.b #$19
|02A148| STA.b $10

|02A14A| STZ.b $67
|02A14C| STZ.b $26

|02A14E| INC.b $11

.exit
|02A150| RTS

;===================================================================================================

Module19_0B_ApproachTriforce:
|02A151| JSL AdvancePolyhedral
|02A155| JSL ApproachTheTriforce

|02A159| LDA.b $B0
|02A15B| CMP.b #$0C
|02A15D| BNE .exit

|02A15F| STZ.b $67
|02A161| STZ.b $26

.exit
|02A163| RTS

;===================================================================================================

Module19_0C_HoldTriforce:
|02A164| JSL AdvancePolyhedral

|02A168| DEC.b $C8
|02A16A| BNE .exit

|02A16C| JSL PaletteBlackAndWhiteSomething

|02A170| INC.b $11

.exit
|02A172| RTS

;===================================================================================================

Module19_0D_FadeToWhite:
|02A173| JSL AdvancePolyhedral
|02A177| JSL PaletteFilter_BlindingWhiteTriforce

|02A17B| LDA.l $7EC009
|02A17F| CMP.b #$FF
|02A181| BNE .exit

|02A183| INC.b $B0

.exit
|02A185| RTS

;===================================================================================================

Module19_0E_AdvanceToCredits:
|02A186| DEC.b $13
|02A188| BNE .exit

|02A18A| LDA.b #$1A
|02A18C| STA.b $10

|02A18E| STZ.b $11
|02A190| STZ.b $B0

|02A192| LDA.b #$FF
|02A194| STA.w $0128

|02A197| STZ.w $012A
|02A19A| STZ.w $1F0C

|02A19D| LDA.b #$00
|02A19F| STA.l $7EF3CA

.exit
|02A1A3| RTS

;===================================================================================================

RoomTagPrizeChecks:
|02A1A4| db $00 ; Sewers
|02A1A5| db $00 ; Hyrule Castle
|02A1A6| db $04 ; Eastern Palace
|02A1A7| db $02 ; Desert Palace
|02A1A8| db $00 ; Agahnim's Tower
|02A1A9| db $10 ; Swamp Palace
|02A1AA| db $02 ; Palace of Darkness
|02A1AB| db $01 ; Misery Mire
|02A1AC| db $40 ; Skull Woods
|02A1AD| db $04 ; Ice Palace
|02A1AE| db $01 ; Tower of Hera
|02A1AF| db $20 ; Thieves' Town
|02A1B0| db $08 ; Turtle Rock

;===================================================================================================

MirrorAndSaveRoomFlags:
|02A1B1| LDA.w $040C
|02A1B4| CMP.b #$FF ; DUNGEON FF
|02A1B6| BEQ .play_beep

|02A1B8| LDA.b #$19
|02A1BA| STA.b $11
|02A1BC| STZ.b $B0

|02A1BE| LDA.b #$33 ; SFX2.33
|02A1C0| STA.w $012E

|02A1C3| JSL FullyUpdateRoomFlags

;===================================================================================================

#SaveDungeonKeys:
|02A1C7| LDA.w $040C
|02A1CA| CMP.b #$FF ; DUNGEON FF
|02A1CC| BEQ .exit

|02A1CE| CMP.b #$02 ; DUNGEON 02
|02A1D0| BNE .not_castle

|02A1D2| LDA.b #$00 ; DUNGEON 00

.not_castle
|02A1D4| LSR A
|02A1D5| TAX

|02A1D6| LDA.l $7EF36F
|02A1DA| STA.l $7EF37C,X

.exit
|02A1DE| RTL

;---------------------------------------------------------------------------------------------------

.play_beep
|02A1DF| LDA.b #$3C ; SFX2.3C
|02A1E1| STA.w $012E

|02A1E4| RTL

;===================================================================================================

RoomEffectFixedColors:
|02A1E5| db $1F, $08, $04, $00

;===================================================================================================

HandleRoomTranslucencyAndPalettes:
|02A1E9| LDA.w $0ABD
|02A1EC| BEQ .dont_undo_translucency

|02A1EE| JSL RevertTranslucencySwap

.dont_undo_translucency
|02A1F2| LDA.b #$02
|02A1F4| STA.b $99

|02A1F6| LDA.b #$B3
|02A1F8| STA.b $9A

|02A1FA| LDX.w $045A

|02A1FD| LDA.l $7EC005
|02A201| BNE .lights_out

;---------------------------------------------------------------------------------------------------

|02A203| LDA.b #$20
|02A205| LDX.b #$03
|02A207| LDY.w $0414
|02A20A| BEQ .no_translucency

|02A20C| LDA.b #$32
|02A20E| CPY.b #$07
|02A210| BEQ .no_translucency

|02A212| LDA.b #$62
|02A214| CPY.b #$04
|02A216| BEQ .no_translucency

|02A218| LDA.b #$20
|02A21A| CPY.b #$02
|02A21C| BNE .no_translucency

;---------------------------------------------------------------------------------------------------

|02A21E| PHX

|02A21F| JSL AssertTranslucencySwap

|02A223| PLX

|02A224| LDA.b $A0
|02A226| CMP.b #$0D ; ROOM 000D
|02A228| BNE .not_aga_2

|02A22A| REP #$20

|02A22C| LDA.w #$0000
|02A22F| STA.l $7EC019
|02A233| STA.l $7EC01B
|02A237| STA.l $7EC01D
|02A23B| STA.l $7EC01F
|02A23F| STA.l $7EC021
|02A243| STA.l $7EC023

|02A247| SEP #$20

|02A249| JSL PaletteLoadAgahnim

.not_aga_2
|02A24D| LDA.b #$70

;---------------------------------------------------------------------------------------------------

.no_translucency
|02A24F| STA.b $9A

.lights_out
|02A251| LDA.l RoomEffectFixedColors,X
|02A255| STA.l $7EC017

|02A259| LDA.b #$1F
|02A25B| STA.l $7EC007

|02A25F| LDA.b #$00
|02A261| STA.l $7EC00B

|02A265| LDA.b #$02
|02A267| STA.l $7EC009

|02A26B| STZ.w $0AA9

|02A26E| JSL PaletteLoad_UnderworldSet
|02A272| JSL PaletteLoad_SpritePal0Left
|02A276| JSL PaletteLoad_SpriteAux1
|02A27A| JSL PaletteLoad_SpriteAux2

|02A27E| INC.b $B0

|02A280| RTS

;===================================================================================================

UnusedInterfacePaletteRecovery:
|02A281| JSL ApplyPaletteFilter

|02A285| LDA.l $7EC007
|02A289| BNE .exit

|02A28B| LDA.b #$00
|02A28D| STA.l $7EC005

|02A291| LDA.w $010C
|02A294| STA.b $10

|02A296| STZ.b $B0
|02A298| STZ.b $11

.exit
|02A29A| RTS

;===================================================================================================

PaletteFilter_bounce:
|02A29B| JSL PaletteFilter

|02A29F| RTS

;===================================================================================================

ApplyPaletteFilter_bounce:
|02A2A0| JSL ApplyPaletteFilter

|02A2A4| RTS

;===================================================================================================

ResetTransitionPropsAndAdvance_ResetInterface_long:
|02A2A5| JSR ResetTransitionPropsAndAdvance_ResetInterface

|02A2A8| RTL

;===================================================================================================

HandleRoomTranslucencyAndPalettes_long:
|02A2A9| JSR HandleRoomTranslucencyAndPalettes

|02A2AC| RTL

;===================================================================================================

UnusedInterfacePaletteRecovery_long:
|02A2AD| JSR UnusedInterfacePaletteRecovery

|02A2B0| RTL

;===================================================================================================

UNREACHABLE_02A2B1:
|02A2B1| LDA.b $A0
|02A2B3| AND.b #$F0
|02A2B5| STA.b $00

|02A2B7| LDA.b $21
|02A2B9| AND.b #$0F
|02A2BB| ORA.b $00
|02A2BD| STA.b $21

|02A2BF| LDA.b $E9
|02A2C1| AND.b #$0F
|02A2C3| ORA.b $00
|02A2C5| STA.b $E9

|02A2C7| LDA.w $0605
|02A2CA| AND.b #$0F
|02A2CC| ORA.b $00
|02A2CE| STA.w $0605

|02A2D1| LDA.w $0607
|02A2D4| AND.b #$0F
|02A2D6| ORA.b $00
|02A2D8| STA.w $0607

|02A2DB| LDA.w $0601
|02A2DE| AND.b #$0F
|02A2E0| ORA.b $00
|02A2E2| STA.w $0601

|02A2E5| LDA.w $0603
|02A2E8| AND.b #$0F
|02A2EA| ORA.b $00
|02A2EC| STA.w $0603

|02A2EF| RTS

;===================================================================================================

AdjustUnderworldCameraArbitrarily:
|02A2F0| LDA.b $A2
|02A2F2| AND.b #$0F
|02A2F4| STA.b $00

|02A2F6| LDA.b $A0
|02A2F8| AND.b #$0F
|02A2FA| SEC
|02A2FB| SBC.b $00

|02A2FD| ASL A
|02A2FE| STA.b $00

|02A300| LDA.b $23
|02A302| CLC
|02A303| ADC.b $00
|02A305| STA.b $23

|02A307| LDA.b $E3
|02A309| CLC
|02A30A| ADC.b $00
|02A30C| STA.b $E3

;---------------------------------------------------------------------------------------------------

|02A30E| LDA.w $060D
|02A311| CLC
|02A312| ADC.b $00
|02A314| STA.w $060D

|02A317| LDA.w $060F
|02A31A| CLC
|02A31B| ADC.b $00
|02A31D| STA.w $060F

|02A320| LDA.w $0609
|02A323| CLC
|02A324| ADC.b $00
|02A326| STA.w $0609

|02A329| LDA.w $060B
|02A32C| CLC
|02A32D| ADC.b $00
|02A32F| STA.w $060B

;---------------------------------------------------------------------------------------------------

|02A332| LDA.b $A2
|02A334| AND.b #$F0
|02A336| LSR A
|02A337| LSR A
|02A338| LSR A
|02A339| STA.b $00

|02A33B| LDA.b $A0
|02A33D| AND.b #$F0
|02A33F| LSR A
|02A340| LSR A
|02A341| LSR A
|02A342| STA.b $01

|02A344| SEC
|02A345| SBC.b $00
|02A347| STA.b $00

;---------------------------------------------------------------------------------------------------

|02A349| LDA.b $21
|02A34B| CLC
|02A34C| ADC.b $00
|02A34E| STA.b $21

|02A350| LDA.b $E9
|02A352| CLC
|02A353| ADC.b $00
|02A355| STA.b $E9

|02A357| LDA.w $0605
|02A35A| CLC
|02A35B| ADC.b $00
|02A35D| STA.w $0605

|02A360| LDA.w $0607
|02A363| CLC
|02A364| ADC.b $00
|02A366| STA.w $0607

|02A369| LDA.w $0601
|02A36C| CLC
|02A36D| ADC.b $00
|02A36F| STA.w $0601

|02A372| LDA.w $0603
|02A375| CLC
|02A376| ADC.b $00
|02A378| STA.w $0603

|02A37B| RTS

;===================================================================================================

AdjustForTeleportDoors:
|02A37C| STY.b $00

|02A37E| STA.w $048E
|02A381| STA.b $A2

|02A383| LDA.b $A2
|02A385| AND.b #$0F
|02A387| ASL A

|02A388| SEC
|02A389| SBC.b $23

|02A38B| CLC
|02A38C| ADC.b $00
|02A38E| STA.b $00

;---------------------------------------------------------------------------------------------------

|02A390| LDA.b $23
|02A392| CLC
|02A393| ADC.b $00
|02A395| STA.b $23

|02A397| LDA.b $E3
|02A399| CLC
|02A39A| ADC.b $00
|02A39C| STA.b $E3

|02A39E| LDA.w $060D
|02A3A1| CLC
|02A3A2| ADC.b $00
|02A3A4| STA.w $060D

|02A3A7| LDA.w $060F
|02A3AA| CLC
|02A3AB| ADC.b $00
|02A3AD| STA.w $060F

|02A3B0| LDA.w $0609
|02A3B3| CLC
|02A3B4| ADC.b $00
|02A3B6| STA.w $0609

|02A3B9| LDA.w $060B
|02A3BC| CLC
|02A3BD| ADC.b $00
|02A3BF| STA.w $060B

;---------------------------------------------------------------------------------------------------

|02A3C2| LDA.b $A2
|02A3C4| AND.b #$F0

|02A3C6| LSR A
|02A3C7| LSR A
|02A3C8| LSR A

|02A3C9| SEC
|02A3CA| SBC.b $21
|02A3CC| STA.b $00

;---------------------------------------------------------------------------------------------------

|02A3CE| LDA.b $21
|02A3D0| CLC
|02A3D1| ADC.b $00
|02A3D3| STA.b $21

|02A3D5| LDA.b $E9
|02A3D7| CLC
|02A3D8| ADC.b $00
|02A3DA| STA.b $E9

|02A3DC| LDA.w $0605
|02A3DF| CLC
|02A3E0| ADC.b $00
|02A3E2| STA.w $0605

|02A3E5| LDA.w $0607
|02A3E8| CLC
|02A3E9| ADC.b $00
|02A3EB| STA.w $0607

|02A3EE| LDA.w $0601
|02A3F1| CLC
|02A3F2| ADC.b $00
|02A3F4| STA.w $0601

|02A3F7| LDA.w $0603
|02A3FA| CLC
|02A3FB| ADC.b $00
|02A3FD| STA.w $0603

;---------------------------------------------------------------------------------------------------

|02A400| LDY.b #$00

.next
|02A402| LDA.b $21
|02A404| STA.w $1A14,Y

|02A407| INY
|02A408| CPY.b #$14
|02A40A| BNE .next

|02A40C| RTS

;===================================================================================================

pool Module09_Overworld

.submodules
|02A40D| dw Module09_00_PlayerControl              ; 0x00
|02A40F| dw Module09_LoadAuxGFX                    ; 0x01
|02A411| dw Module09_TriggerTilemapUpdate          ; 0x02
|02A413| dw Module09_LoadNewMapAndGFX              ; 0x03
|02A415| dw Module09_LoadNewSprites                ; 0x04
|02A417| dw StartOverworldScrollTransition         ; 0x05
|02A419| dw RunScrollOverworldTransition           ; 0x06
|02A41B| dw Overworld_EaseOffScrollTransition      ; 0x07
|02A41D| dw Overworld_FinalizeEntryOntoScreen      ; 0x08
|02A41F| dw Module09_09_OpenBigDoorFromExiting     ; 0x09
|02A421| dw Module09_0A_WalkFromExiting_FacingDown ; 0x0A
|02A423| dw Module09_0B_WalkFromExiting_FacingUp   ; 0x0B
|02A425| dw Module09_0C_OpenBigDoor                ; 0x0C
|02A427| dw StartOverworldMosaicTransition         ; 0x0D
|02A429| dw Overworld_LoadSubscreenAndSilenceSFX1  ; 0x0E
|02A42B| dw Module09_LoadAuxGFX                    ; 0x0F
|02A42D| dw Module09_TriggerTilemapUpdate          ; 0x10
|02A42F| dw Module09_LoadNewMapAndGFX              ; 0x11
|02A431| dw Module09_LoadNewSprites                ; 0x12
|02A433| dw StartOverworldScrollTransition         ; 0x13
|02A435| dw RunScrollOverworldTransition           ; 0x14
|02A437| dw Overworld_EaseOffScrollTransition      ; 0x15
|02A439| dw Module09_FadeBackInFromMosaic          ; 0x16
|02A43B| dw StartOverworldMosaicTransition         ; 0x17
|02A43D| dw Module09_18                            ; 0x18
|02A43F| dw Module09_19                            ; 0x19
|02A441| dw Module09_LoadAuxGFX                    ; 0x1A
|02A443| dw Module09_TriggerTilemapUpdate          ; 0x1B
|02A445| dw Module09_1C                            ; 0x1C
|02A447| dw Module09_1D                            ; 0x1D
|02A449| dw Module09_1E                            ; 0x1E
|02A44B| dw Module09_1F                            ; 0x1F
|02A44D| dw ReloadSubscreenOverlay                 ; 0x20
|02A44F| dw Module09_21                            ; 0x21
|02A451| dw Module09_22                            ; 0x22
|02A453| dw Module09_MirrorWarp                    ; 0x23
|02A455| dw StartOverworldMosaicTransition         ; 0x24
|02A457| dw Module09_25                            ; 0x25
|02A459| dw Module09_LoadAuxGFX                    ; 0x26
|02A45B| dw Module09_TriggerTilemapUpdate          ; 0x27
|02A45D| dw LoadAndBuildOverworldScreen            ; 0x28
|02A45F| dw Module09_FadeBackInFromMosaic          ; 0x29
|02A461| dw Module09_2A_RecoverFromDrowning        ; 0x2A
|02A463| dw Module09_2B                            ; 0x2B
|02A465| dw Module09_MirrorWarp                    ; 0x2C
|02A467| dw Module09_2D_WaitForBird                ; 0x2D
|02A469| dw Module09_2E_Whirlpool                  ; 0x2E
|02A46B| dw Module09_2F                            ; 0x2F

endpool

;===================================================================================================

OWOverlayHShift:
|02A46D| db  1,  0,  1,  0

OWOverlayVShift:
|02A471| db  0, 17,  0, 17

;===================================================================================================

Module09_Overworld:
#Module0B_OverworldSpecial:
|02A475| SEP #$30

|02A477| LDA.b $11
|02A479| ASL A
|02A47A| TAX

|02A47B| JSR (.submodules,X)

;---------------------------------------------------------------------------------------------------

|02A47E| REP #$21

|02A480| LDA.b $E2
|02A482| PHA
|02A483| ADC.w $011A
|02A486| STA.b $E2
|02A488| STA.w $011E

|02A48B| LDA.b $E8
|02A48D| PHA
|02A48E| CLC
|02A48F| ADC.w $011C
|02A492| STA.b $E8
|02A494| STA.w $0122

|02A497| LDA.b $E0
|02A499| PHA
|02A49A| CLC
|02A49B| ADC.w $011A
|02A49E| STA.b $E0
|02A4A0| STA.w $0120

|02A4A3| LDA.b $E6
|02A4A5| PHA
|02A4A6| CLC
|02A4A7| ADC.w $011C
|02A4AA| STA.b $E6
|02A4AC| STA.w $0124

;---------------------------------------------------------------------------------------------------

|02A4AF| SEP #$20

|02A4B1| JSL HandleAllSprites

;---------------------------------------------------------------------------------------------------

|02A4B5| REP #$20

|02A4B7| PLA
|02A4B8| STA.b $E6

|02A4BA| PLA
|02A4BB| STA.b $E0

|02A4BD| PLA
|02A4BE| STA.b $E8

|02A4C0| PLA
|02A4C1| STA.b $E2

;---------------------------------------------------------------------------------------------------

|02A4C3| SEP #$20

|02A4C5| JSL DrawLink
|02A4C9| JSL HandleItemRefills

;===================================================================================================

OverworldOverlay_HandleRain:
|02A4CD| LDA.b $8A
|02A4CF| CMP.b #$70 ; OW 70
|02A4D1| BEQ .mire_screen

|02A4D3| LDA.l $7EF3C5
|02A4D7| CMP.b #$02
|02A4D9| BCS .exit

;---------------------------------------------------------------------------------------------------

.mire_screen
|02A4DB| LDA.l $7EF2F0
|02A4DF| AND.b #$20
|02A4E1| BNE .exit

|02A4E3| LDA.b $1A
|02A4E5| CMP.b #$03
|02A4E7| BEQ .flash

|02A4E9| CMP.b #$05
|02A4EB| BEQ .unflash

|02A4ED| CMP.b #$24
|02A4EF| BEQ .thunder

|02A4F1| CMP.b #$2C
|02A4F3| BEQ .unflash

|02A4F5| CMP.b #$58
|02A4F7| BEQ .flash

|02A4F9| CMP.b #$5A
|02A4FB| BNE .no_effect

.unflash
|02A4FD| LDA.b #$72
|02A4FF| BRA .set_color_math

.thunder
|02A501| LDX.b #$36 ; SFX2.36
|02A503| STX.w $012E

.flash
|02A506| LDA.b #$32

.set_color_math
|02A508| STA.b $9A

;---------------------------------------------------------------------------------------------------

.no_effect
|02A50A| LDA.b $1A
|02A50C| AND.b #$03
|02A50E| BNE .exit

|02A510| LDA.w $0494
|02A513| INC A
|02A514| AND.b #$03
|02A516| STA.w $0494

|02A519| TAX

|02A51A| LDA.b $E1
|02A51C| CLC
|02A51D| ADC.l OWOverlayHShift,X
|02A521| STA.b $E1

|02A523| LDA.b $E7
|02A525| CLC
|02A526| ADC.l OWOverlayVShift,X
|02A52A| STA.b $E7

.exit
|02A52C| RTL

;===================================================================================================

UNREACHABLE_02A52D:
|02A52D| db $08, $09, $02, $04, $02, $02, $02, $02
|02A535| db $02, $02, $02, $02, $02, $02, $02

;===================================================================================================

Module09_00_PlayerControl:
|02A53C| LDA.w $0112
|02A53F| ORA.w $02E4
|02A542| ORA.w $0FFC
|02A545| ORA.w $04C6
|02A548| BEQ .check_for_start

|02A54A| JMP.w .continue

;---------------------------------------------------------------------------------------------------

.check_for_start
|02A54D| LDA.b $F4
|02A54F| AND.b #$10
|02A551| BEQ .check_for_X

|02A553| STZ.w $0200

|02A556| LDA.b #$01
|02A558| BRA .set_new_module

;---------------------------------------------------------------------------------------------------

.check_for_X
|02A55A| LDA.b $F6
|02A55C| AND.b #$40
|02A55E| BEQ .check_for_select

|02A560| STZ.w $0200

|02A563| LDA.b #$07

;---------------------------------------------------------------------------------------------------

.set_new_module
|02A565| STA.b $11

|02A567| LDA.b $10
|02A569| STA.w $010C

|02A56C| LDA.b #$0E
|02A56E| STA.b $10

|02A570| RTS

;---------------------------------------------------------------------------------------------------

.check_for_select
|02A571| LDA.b $F0
|02A573| AND.b #$20
|02A575| BEQ .continue

;---------------------------------------------------------------------------------------------------

|02A577| LDA.w $1CE8
|02A57A| STA.w $1CF4

|02A57D| REP #$20

|02A57F| LDA.w #$0186 ; MESSAGE 0186
|02A582| STA.w $1CF0

|02A585| SEP #$20

|02A587| LDA.b $10
|02A589| PHA

|02A58A| JSL PrepAndDisplayMessage

|02A58E| PLA
|02A58F| STA.b $10

|02A591| STZ.b $B0

|02A593| LDA.b #$0B
|02A595| BRA .set_new_module

;---------------------------------------------------------------------------------------------------

.continue
|02A597| LDA.w $04C6
|02A59A| BEQ .not_entrance_cutscene

|02A59C| JSL EntranceCutscene

;---------------------------------------------------------------------------------------------------

.not_entrance_cutscene
|02A5A0| SEP #$30

|02A5A2| JSL Link

|02A5A6| LDA.w $04B4
|02A5A9| CMP.b #$FF
|02A5AB| BEQ .no_countdown

|02A5AD| JSL HandleHUDTimer

;---------------------------------------------------------------------------------------------------

.no_countdown
|02A5B1| REP #$20

|02A5B3| LDA.b $20
|02A5B5| AND.w #$1E00
|02A5B8| ASL A
|02A5B9| ASL A
|02A5BA| ASL A
|02A5BB| STA.w $0700

|02A5BE| LDA.b $22
|02A5C0| AND.w #$1E00
|02A5C3| ORA.w $0700

|02A5C6| XBA
|02A5C7| STA.w $0700

;---------------------------------------------------------------------------------------------------

|02A5CA| SEP #$20

|02A5CC| JSL LoadChrHalfSlot
|02A5D0| JSR Overworld_OperateCameraScroll

|02A5D3| LDA.b $10
|02A5D5| CMP.b #$0B
|02A5D7| BEQ .special_overworld

;---------------------------------------------------------------------------------------------------

|02A5D9| JSL UseOverworldEntrance
|02A5DD| JSL FlashGanonTowerPalette
|02A5E1| JSR HandleOverworldTransitions

|02A5E4| BRA .exit

;---------------------------------------------------------------------------------------------------

.special_overworld
|02A5E6| JSR ScrollAndCheckForSOWExit

.exit
|02A5E9| SEP #$20

|02A5EB| RTS

;===================================================================================================

ActualOverworldScreenID:
|02A5EC| db $00, $00, $02, $03, $03, $05, $05, $07
|02A5F4| db $00, $00, $0A, $03, $03, $05, $05, $0F
|02A5FC| db $10, $11, $12, $13, $14, $15, $16, $17
|02A604| db $18, $18, $1A, $1B, $1B, $1D, $1E, $1E
|02A60C| db $18, $18, $22, $1B, $1B, $25, $1E, $1E
|02A614| db $28, $29, $2A, $2B, $2C, $2D, $2E, $2F
|02A61C| db $30, $30, $32, $33, $34, $35, $35, $37
|02A624| db $30, $30, $3A, $3B, $3C, $35, $35, $3F

;===================================================================================================

OverworldScreenTilemapChange:
|02A62C| dw $0F80
|02A62E| dw $0F80
|02A630| dw $003F
|02A632| dw $003F

;===================================================================================================

OverworldScreenTilemapChangeByScreen:
|02A634| dw $0060, $0060, $0060, $0060
|02A63C| dw $0060, $0060, $0060, $0060
|02A644| dw $0060, $0060, $0060, $1060
|02A64C| dw $1060, $1060, $1060, $0060
|02A654| dw $0060, $0060, $0060, $0060
|02A65C| dw $0060, $0060, $0060, $0060
|02A664| dw $0060, $0060, $0060, $0060
|02A66C| dw $0060, $0060, $0060, $0060
|02A674| dw $0060, $0060, $0060, $1060
|02A67C| dw $1060, $0060, $1060, $1060
|02A684| dw $0060, $0060, $0060, $0060
|02A68C| dw $0060, $0060, $0060, $0060
|02A694| dw $0060, $0060, $0060, $0060
|02A69C| dw $0060, $0060, $0060, $0060
|02A6A4| dw $0060, $0060, $0060, $0060
|02A6AC| dw $0060, $1060, $1060, $0060
|02A6B4| dw $0080, $0080, $0040, $0080
|02A6BC| dw $0080, $0080, $0080, $0040
|02A6C4| dw $1080, $1080, $0040, $1080
|02A6CC| dw $1080, $1080, $1080, $0040
|02A6D4| dw $0040, $0040, $0040, $0040
|02A6DC| dw $0040, $0040, $0040, $0040
|02A6E4| dw $0080, $0080, $0040, $0080
|02A6EC| dw $0080, $0040, $0080, $0080
|02A6F4| dw $1080, $1080, $0040, $1080
|02A6FC| dw $1080, $0040, $1080, $1080
|02A704| dw $0040, $0040, $0040, $0040
|02A70C| dw $0040, $0040, $0040, $0040
|02A714| dw $0080, $0080, $0040, $0040
|02A71C| dw $0040, $0080, $0080, $0040
|02A724| dw $1080, $1080, $0040, $0040
|02A72C| dw $0040, $1080, $1080, $0040
|02A734| dw $1800, $1840, $1800, $1800
|02A73C| dw $1840, $1800, $1840, $1800
|02A744| dw $1800, $1840, $1800, $1800
|02A74C| dw $1840, $1800, $1840, $1800
|02A754| dw $1800, $1800, $1800, $1800
|02A75C| dw $1800, $1800, $1800, $1800
|02A764| dw $1800, $1840, $1800, $1800
|02A76C| dw $1840, $1800, $1800, $1840
|02A774| dw $1800, $1840, $1800, $1800
|02A77C| dw $1840, $1800, $1800, $1840
|02A784| dw $1800, $1800, $1800, $1800
|02A78C| dw $1800, $1800, $1800, $1800
|02A794| dw $1800, $1840, $1800, $1800
|02A79C| dw $1800, $1800, $1840, $1800
|02A7A4| dw $1800, $1840, $1800, $1800
|02A7AC| dw $1800, $1800, $1840, $1800
|02A7B4| dw $2000, $2040, $1000, $2000
|02A7BC| dw $2040, $2000, $2040, $1000
|02A7C4| dw $2000, $2040, $1000, $2000
|02A7CC| dw $2040, $2000, $2040, $1000
|02A7D4| dw $1000, $1000, $1000, $1000
|02A7DC| dw $1000, $1000, $1000, $1000
|02A7E4| dw $2000, $2040, $1000, $2000
|02A7EC| dw $2040, $1000, $2000, $2040
|02A7F4| dw $2000, $2040, $1000, $2000
|02A7FC| dw $2040, $1000, $2000, $2040
|02A804| dw $1000, $1000, $1000, $1000
|02A80C| dw $1000, $1000, $1000, $1000
|02A814| dw $2000, $2040, $1000, $1000
|02A81C| dw $1000, $2000, $2040, $1000
|02A824| dw $2000, $2040, $1000, $1000
|02A82C| dw $1000, $2000, $2040, $1000

;===================================================================================================

OverworldScreenIDChange:
|02A834| dw $0002 ; east
|02A836| dw $FFFE ; west
|02A838| dw $0010 ; south
|02A83A| dw $FFF0 ; north

;===================================================================================================

OverworldMixedCoordsChange:
|02A83C| dw $FFF0
|02A83E| dw $0010
|02A840| dw $FFFE
|02A842| dw $0002

;===================================================================================================

OverworldScreenSizeFlag:
|02A844| db $20, $20, $00, $20, $20, $20, $20, $00
|02A84C| db $20, $20, $00, $20, $20, $20, $20, $00
|02A854| db $00, $00, $00, $00, $00, $00, $00, $00
|02A85C| db $20, $20, $00, $20, $20, $00, $20, $20
|02A864| db $20, $20, $00, $20, $20, $00, $20, $20
|02A86C| db $00, $00, $00, $00, $00, $00, $00, $00
|02A874| db $20, $20, $00, $00, $00, $20, $20, $00
|02A87C| db $20, $20, $00, $00, $00, $20, $20, $00

;===================================================================================================

OverworldScreenSizeHighByte:
|02A884| db $03, $03, $01, $03, $03, $03, $03, $01
|02A88C| db $03, $03, $01, $03, $03, $03, $03, $01
|02A894| db $01, $01, $01, $01, $01, $01, $01, $01
|02A89C| db $03, $03, $01, $03, $03, $01, $03, $03
|02A8A4| db $03, $03, $01, $03, $03, $01, $03, $03
|02A8AC| db $01, $01, $01, $01, $01, $01, $01, $01
|02A8B4| db $03, $03, $01, $01, $01, $03, $03, $01
|02A8BC| db $03, $03, $01, $01, $01, $03, $03, $01

;===================================================================================================

OverworldTransitionPositionY:
|02A8C4| dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
|02A8D4| dw $0000, $0000, $0200, $0000, $0000, $0000, $0000, $0200
|02A8E4| dw $0400, $0400, $0400, $0400, $0400, $0400, $0400, $0400
|02A8F4| dw $0600, $0600, $0600, $0600, $0600, $0600, $0600, $0600
|02A904| dw $0600, $0600, $0800, $0600, $0600, $0800, $0600, $0600
|02A914| dw $0A00, $0A00, $0A00, $0A00, $0A00, $0A00, $0A00, $0A00
|02A924| dw $0C00, $0C00, $0C00, $0C00, $0C00, $0C00, $0C00, $0C00
|02A934| dw $0C00, $0C00, $0E00, $0E00, $0E00, $0C00, $0C00, $0E00

;===================================================================================================

OverworldTransitionPositionX:
|02A944| dw $0000, $0000, $0400, $0600, $0600, $0A00, $0A00, $0E00
|02A954| dw $0000, $0000, $0400, $0600, $0600, $0A00, $0A00, $0E00
|02A964| dw $0000, $0200, $0400, $0600, $0800, $0A00, $0C00, $0E00
|02A974| dw $0000, $0000, $0400, $0600, $0600, $0A00, $0C00, $0C00
|02A984| dw $0000, $0000, $0400, $0600, $0600, $0A00, $0C00, $0C00
|02A994| dw $0000, $0200, $0400, $0600, $0800, $0A00, $0C00, $0E00
|02A9A4| dw $0000, $0000, $0400, $0600, $0800, $0A00, $0A00, $0E00
|02A9B4| dw $0000, $0000, $0400, $0600, $0800, $0A00, $0A00, $0E00

;===================================================================================================

HandleOverworldTransitions:
|02A9C4| LDA.w $0416
|02A9C7| BEQ .not_scrolling

|02A9C9| JSR OverworldHandleMapScroll

.not_scrolling
|02A9CC| REP #$20

|02A9CE| LDA.b $30
|02A9D0| AND.w #$00FF
|02A9D3| BEQ .not_moving_vertically

|02A9D5| LDA.b $67
|02A9D7| AND.w #$000C
|02A9DA| STA.b $00

|02A9DC| LDX.w $0700

|02A9DF| LDA.b $20
|02A9E1| SEC
|02A9E2| SBC.l OverworldTransitionPositionY,X

|02A9E6| LDY.b #$06
|02A9E8| LDX.b #$08
|02A9EA| CMP.w #$0004
|02A9ED| BCC .continue_check

|02A9EF| LDY.b #$04
|02A9F1| LDX.b #$04
|02A9F3| CMP.w $0716
|02A9F6| BCS .continue_check

;---------------------------------------------------------------------------------------------------

.not_moving_vertically
|02A9F8| LDA.b $31
|02A9FA| AND.w #$00FF
|02A9FD| BEQ .check_special_triggers

|02A9FF| LDA.w $0716
|02AA02| CLC
|02AA03| ADC.w #$0004
|02AA06| STA.b $02

|02AA08| LDA.b $67
|02AA0A| AND.w #$0003
|02AA0D| STA.b $00

|02AA0F| LDX.w $0700

|02AA12| LDA.b $22
|02AA14| SEC
|02AA15| SBC.l OverworldTransitionPositionX,X

|02AA19| LDY.b #$02
|02AA1B| LDX.b #$02
|02AA1D| CMP.w #$0006
|02AA20| BCC .continue_check

|02AA22| LDY.b #$00
|02AA24| LDX.b #$01

|02AA26| CMP.b $02
|02AA28| BCC .check_special_triggers

;---------------------------------------------------------------------------------------------------

.continue_check
|02AA2A| CPX.b $00
|02AA2C| BEQ .some_transition_was_hit

.check_special_triggers
|02AA2E| JSL CheckForSpecialOverworldTrigger

|02AA32| RTS

;---------------------------------------------------------------------------------------------------

.some_transition_was_hit
|02AA33| SEP #$20

|02AA35| JSL CheckForEdgeScreenTransition
|02AA39| BCS .check_special_triggers

|02AA3B| STY.b $02
|02AA3D| STZ.b $03

|02AA3F| JSR DeleteCertainAncillaeStopDashing

|02AA42| REP #$31

|02AA44| LDX.b $02

|02AA46| LDA.b $84
|02AA48| AND.l OverworldScreenTilemapChange,X
|02AA4C| STA.b $84

|02AA4E| LDA.w $0700
|02AA51| CLC
|02AA52| ADC.l OverworldScreenIDChange,X
|02AA56| PHA

|02AA57| STA.b $04

|02AA59| TXA

|02AA5A| ASL A
|02AA5B| ASL A
|02AA5C| ASL A
|02AA5D| ASL A
|02AA5E| ASL A
|02AA5F| ASL A

|02AA60| ORA.b $04
|02AA62| TAX

|02AA63| LDA.b $84
|02AA65| CLC
|02AA66| ADC.l OverworldScreenTilemapChangeByScreen,X
|02AA6A| STA.b $84

;---------------------------------------------------------------------------------------------------

|02AA6C| PLA
|02AA6D| LSR A
|02AA6E| TAX

|02AA6F| SEP #$30

|02AA71| LDA.b $8A
|02AA73| PHA

|02AA74| CMP.b #$2A ; OW 2A
|02AA76| BNE .not_haunted_grove

|02AA78| LDA.b #$80 ; SFX1.80 - fade
|02AA7A| STA.w $012D

.not_haunted_grove
|02AA7D| LDA.l ActualOverworldScreenID,X
|02AA81| ORA.l $7EF3CA
|02AA85| STA.b $8A
|02AA87| STA.w $040A

|02AA8A| TAX
|02AA8B| LDA.l $7EF3CA
|02AA8F| BEQ .light_world

|02AA91| LDA.l $7EF357
|02AA95| BEQ .dont_restore_dw_music

.light_world
|02AA97| LDA.l $7F5B00,X
|02AA9B| LSR A
|02AA9C| LSR A
|02AA9D| LSR A
|02AA9E| LSR A
|02AA9F| BNE .has_ambient_sfx

|02AAA1| LDA.b #$05
|02AAA3| STA.w $012D

.has_ambient_sfx
|02AAA6| LDA.l $7F5B00,X
|02AAAA| AND.b #$0F
|02AAAC| CMP.w $0130
|02AAAF| BEQ .dont_restore_dw_music

|02AAB1| LDA.b #$F1 ; SONG F1 - fade
|02AAB3| STA.w $012C

;---------------------------------------------------------------------------------------------------

.dont_restore_dw_music
|02AAB6| JSR LoadGraphicsAndScreenSize

|02AAB9| LDA.b #$01
|02AABB| STA.b $11

|02AABD| LDA.b $00
|02AABF| STA.w $0410
|02AAC2| STA.w $0416

|02AAC5| LDX.b #$04

.shift
|02AAC7| DEX
|02AAC8| LSR A
|02AAC9| BCC .shift

|02AACB| STX.w $0418
|02AACE| STX.w $069C

|02AAD1| STZ.w $0696
|02AAD4| STZ.w $0698
|02AAD7| STZ.w $0126

|02AADA| PLA
|02AADB| AND.b #$3F ; OW 00, OW 40
|02AADD| BEQ .mosaic_transition

|02AADF| LDA.b $8A ; OW 00, OW 80
|02AAE1| AND.b #$BF
|02AAE3| BNE .normal_transition

.mosaic_transition
|02AAE5| STZ.b $B0

|02AAE7| LDA.b #$0D
|02AAE9| STA.b $11

|02AAEB| LDA.b #$00
|02AAED| STA.b $95
|02AAEF| STA.l $7EC011

|02AAF3| RTS

;---------------------------------------------------------------------------------------------------

.normal_transition
|02AAF4| LDX.b $8A

|02AAF6| LDA.l $7EFD40,X
|02AAFA| STA.b $00

|02AAFC| LDA.l OverworldPalettesScreenToSet,X
|02AB00| JSL OverworldPalettesLoader
|02AB04| JSR Overworld_CopyPalettesToCache

|02AB07| RTS

;===================================================================================================

LoadGraphicsAndScreenSize:
|02AB08| LDX.b $8A

|02AB0A| STZ.w $0412

|02AB0D| LDA.l $7EFCC0,X
|02AB11| STA.w $0AA3

|02AB14| LDA.l GFXAA2ValsOW,X
|02AB18| STA.w $0AA2

|02AB1B| TXA
|02AB1C| AND.b #$3F
|02AB1E| TAX

|02AB1F| LDA.w $0712
|02AB22| STA.w $0714

|02AB25| LDA.l OverworldScreenSizeFlag,X
|02AB29| STA.w $0712

|02AB2C| LDA.l OverworldScreenSizeHighByte,X
|02AB30| STA.w $0717

;---------------------------------------------------------------------------------------------------

|02AB33| LDY.b #$20
|02AB35| LDX.b #$00

|02AB37| LDA.b $8A
|02AB39| AND.b #$40
|02AB3B| BEQ .light_world

|02AB3D| INY
|02AB3E| LDX.b #$08

.light_world
|02AB40| STY.w $0AA1

|02AB43| LDA.l SheetsTable_AA4,X
|02AB47| STA.w $0AA4

|02AB4A| REP #$30

|02AB4C| LDA.b $8A
|02AB4E| AND.w #$00BF
|02AB51| ASL A
|02AB52| TAX

|02AB53| LDA.l OverworldTransitionPositionY,X
|02AB57| STA.w $0708

|02AB5A| LDA.l OverworldTransitionPositionX,X
|02AB5E| LSR A
|02AB5F| LSR A
|02AB60| LSR A
|02AB61| STA.w $070C

|02AB64| LDA.w #$03F0

|02AB67| LDX.w $0712
|02AB6A| BNE .bigger_screen

|02AB6C| LDA.w #$01F0

.bigger_screen
|02AB6F| STA.w $070A

|02AB72| LSR A
|02AB73| LSR A
|02AB74| LSR A
|02AB75| STA.w $070E

|02AB78| SEP #$30

|02AB7A| RTS

;===================================================================================================

ScrollAndCheckForSOWExit:
|02AB7B| LDA.w $0416
|02AB7E| BEQ .no_scroll

|02AB80| JSR OverworldHandleMapScroll

.no_scroll
|02AB83| JSL CheckForReturnTrigger

|02AB87| RTS

;===================================================================================================

Module09_LoadAuxGFX:
|02AB88| LDA.l $7EF2BB
|02AB8C| AND.b #$DF
|02AB8E| STA.l $7EF2BB

|02AB92| LDA.l $7EF2FB
|02AB96| AND.b #$DF
|02AB98| STA.l $7EF2FB

|02AB9C| LDA.l $7EF216
|02ABA0| AND.b #$7F
|02ABA2| STA.l $7EF216

|02ABA6| LDA.l $7EF051
|02ABAA| AND.b #$FE
|02ABAC| STA.l $7EF051

|02ABB0| JSL LoadTransAuxGFX
|02ABB4| JSL PrepTransAuxGfx

|02ABB8| LDA.b #$09
|02ABBA| BRA .go

;===================================================================================================

#Module09_TriggerTilemapUpdate:
|02ABBC| LDA.b #$0A

;---------------------------------------------------------------------------------------------------

.go
|02ABBE| STA.b $17
|02ABC0| STA.w $0710

|02ABC3| INC.b $11

|02ABC5| RTS

;===================================================================================================

Module09_LoadNewMapAndGFX:
|02ABC6| STZ.w $04C8
|02ABC9| STZ.w $04C9

|02ABCC| JSR SomeTilemapChange

|02ABCF| INC.w $0710

|02ABD2| JSR CreateInitialNewScreenMapToScroll
|02ABD5| JSL LoadNewSpriteGFXSet

|02ABD9| RTS

;===================================================================================================

RunScrollOverworldTransition:
|02ABDA| JSL HandleLinkAnimation_FullLongEntry
|02ABDE| JSL IncrementalVRAMUpload

|02ABE2| JSR OverworldScrollTransition
|02ABE5| AND.b #$0F
|02ABE7| BEQ .continue

|02ABE9| RTS

.continue
|02ABEA| JMP.w OverworldTranScrollSet

;===================================================================================================

Module09_LoadNewSprites:
|02ABED| LDA.w $0418
|02ABF0| CMP.b #$01
|02ABF2| BNE .dont_adjust_y

;---------------------------------------------------------------------------------------------------

|02ABF4| REP #$20

|02ABF6| LDA.b $E8
|02ABF8| CLC
|02ABF9| ADC.w #$0002
|02ABFC| STA.b $E8

|02ABFE| LDA.b $20
|02AC00| CLC
|02AC01| ADC.w #$0002
|02AC04| STA.b $20

|02AC06| SEP #$20

;---------------------------------------------------------------------------------------------------

.dont_adjust_y
|02AC08| JSL ReloadOverworldSprites

|02AC0C| STZ.w $04AC
|02AC0F| STZ.w $04AD

|02AC12| LDA.l $7EF3C5
|02AC16| CMP.b #$02
|02AC18| BCS .not_raining

.dont_set_fixed_color
|02AC1A| JMP.w StartOverworldScrollTransition

.not_raining
|02AC1D| LDA.b $11
|02AC1F| CMP.b #$12
|02AC21| BEQ .dont_set_fixed_color

|02AC23| JSL Overworld_SetFixedColAndScroll

;===================================================================================================

StartOverworldScrollTransition:
|02AC27| INC.b $11

|02AC29| LDX.w $0410
|02AC2C| CPX.b #$04
|02AC2E| BCC .exit

;===================================================================================================

#OverworldTranScrollSet:
|02AC30| STX.w $0416

|02AC33| JSR OverworldTransitionScrollAndLoadMap

|02AC36| STZ.w $0416

.exit
|02AC39| RTS

;===================================================================================================

Overworld_EaseOffScrollTransition:
|02AC3A| LDX.b $8A

|02AC3C| LDA.l OverworldScreenSize,X
|02AC40| BEQ .dont_scroll_map

|02AC42| LDX.w $0410
|02AC45| STX.w $0416

|02AC48| JSR OverworldTransitionScrollAndLoadMap

|02AC4B| STZ.w $0416

.dont_scroll_map
|02AC4E| INC.b $B0

|02AC50| LDA.b $B0
|02AC52| CMP.b #$08
|02AC54| BCC .exit

|02AC56| LDX.w $0410
|02AC59| CPX.b #$08
|02AC5B| BEQ .scrolling_north

|02AC5D| CPX.b #$02
|02AC5F| BNE .not_scrolling_vertically

.scrolling_north
|02AC61| CMP.b #$09
|02AC63| BCC .exit

.not_scrolling_vertically
|02AC65| STZ.b $B0
|02AC67| STZ.w $0410

;---------------------------------------------------------------------------------------------------

|02AC6A| LDX.b $8A

|02AC6C| LDA.l OverworldScreenSize,X
|02AC70| BEQ .dont_recover_params

|02AC72| REP #$20

|02AC74| LDA.l $7EC172
|02AC78| STA.b $84

|02AC7A| LDA.l $7EC174
|02AC7E| STA.b $86

|02AC80| LDA.l $7EC176
|02AC84| STA.b $88

|02AC86| SEP #$20

.dont_recover_params
|02AC88| INC.b $11

|02AC8A| JSL RemoveKikiAndLocksmith

.exit
|02AC8E| RTS

;===================================================================================================

Module09_0A_WalkFromExiting_FacingDown:
|02AC8F| JSL HandleLinkAnimation_SetFacingDown

|02AC93| REP #$20

|02AC95| LDA.b $20
|02AC97| CLC
|02AC98| ADC.w #$0001
|02AC9B| STA.b $20

|02AC9D| SEP #$20

|02AC9F| DEC.w $069A
|02ACA2| BNE .exit

;---------------------------------------------------------------------------------------------------

|02ACA4| STZ.b $11

|02ACA6| REP #$20

|02ACA8| LDA.b $20
|02ACAA| CLC
|02ACAB| ADC.w #$0003
|02ACAE| STA.b $20

|02ACB0| SEP #$20

|02ACB2| LDA.b #$03
|02ACB4| STA.b $30

;---------------------------------------------------------------------------------------------------

|02ACB6| JSR Overworld_OperateCameraScroll

|02ACB9| LDA.w $0416
|02ACBC| BEQ .exit

|02ACBE| JSR OverworldHandleMapScroll

.exit
|02ACC1| RTS

;===================================================================================================

Module09_0B_WalkFromExiting_FacingUp:
|02ACC2| JSL HandleLinkAnimation_FullLongEntry

|02ACC6| REP #$20

|02ACC8| LDA.b $20
|02ACCA| SEC
|02ACCB| SBC.w #$0001
|02ACCE| STA.b $20

|02ACD0| SEP #$20

|02ACD2| DEC.w $069A
|02ACD5| BNE .exit

|02ACD7| STZ.b $11

.exit
|02ACD9| RTS

;===================================================================================================

BigMap16UpdateObjects:
|02ACDA| dw $0DA8, $0DA9, $0DAA, $0DAB ; sanc doors half open
|02ACE2| dw $0DAC, $0DAD, $0DAE, $0DAF ; sanc doors 2/3 open
|02ACEA| dw $0DB0, $0DB1, $0DB2, $0DB3 ; sanc doors fully open
|02ACF2| dw $0DB6, $0DB7, $0DB8, $0DB9 ; castle doors 2/3 open
|02ACFA| dw $0DBA, $0DBB, $0DBC, $0DBD ; castle doors fully open
|02AD02| dw $0DCD, $0DCE, $0DCF, $0DD0 ; big rock imprint
|02AD0A| dw $0DD3, $0DD4, $0DD5, $0DD6 ; open grave with corpse bottom half
|02AD12| dw $0DD7, $0DD8, $0DD9, $0DDA ; open grave with stairs bottom half
|02AD1A| dw $0DD1, $0DD2, $0DD3, $0DD4 ; open grave with corpse top half
|02AD22| dw $0DD1, $0DD2, $0DD7, $0DD8 ; open grave with stairs top half
|02AD2A| dw $0918, $0919, $091A, $091B ; stairs to cave
|02AD32| dw $0DDB, $0DDC, $0DDD, $0DDE ; open grave with pit bottom half
|02AD3A| dw $0DD1, $0DD2, $0DDB, $0DDC ; open grave with pit top half
|02AD42| dw $0E21, $0E22, $0E23, $0E24 ; broken weather vane

;===================================================================================================

Module09_09_OpenBigDoorFromExiting:
|02AD4A| LDA.w $0690
|02AD4D| CMP.b #$03
|02AD4F| BNE BigMap16Update_conditional

|02AD51| LDA.b #$24
|02AD53| STA.w $069A

|02AD56| STZ.w $0416

|02AD59| INC.b $11

|02AD5B| RTS

;===================================================================================================

BigMap16Update_long:
|02AD5C| JSR BigMap16Update

|02AD5F| STZ.w $0692

|02AD62| RTL

;===================================================================================================

UNREACHABLE_02AD63:
|02AD63| REP #$30

|02AD65| JSR BigMap16Update_16bit_already

|02AD68| STZ.w $0692

|02AD6B| RTL

;===================================================================================================

Module09_0C_OpenBigDoor:
|02AD6C| LDA.w $0690
|02AD6F| CMP.b #$03
|02AD71| BNE BigMap16Update_conditional

|02AD73| STZ.b $B0
|02AD75| STZ.b $11
|02AD77| STZ.w $0416

|02AD7A| RTS

;===================================================================================================

BigMap16Update_conditional:
|02AD7B| LDA.w $0692
|02AD7E| AND.b #$07
|02AD80| BEQ BigMap16Update

|02AD82| JMP.w NoBigMap16Update

;===================================================================================================

BigMap16Update:
|02AD85| REP #$30

;---------------------------------------------------------------------------------------------------

#BigMap16Update_16bit_already:
|02AD87| PHB
|02AD88| PHK
|02AD89| PLB

|02AD8A| LDA.w $0698

|02AD8D| LDX.w $04AC

|02AD90| STA.l $7EF800,X

|02AD94| TAX

|02AD95| LDY.w $0692

|02AD98| LDA.w BigMap16UpdateObjects,Y
|02AD9B| STA.l $7E2000,X

|02AD9F| LDX.w $04AC

|02ADA2| STA.l $7EFA00,X

|02ADA6| LDY.w #$0000
|02ADA9| LDX.w $0698
|02ADAC| JSL DrawMap16Anywhere

;---------------------------------------------------------------------------------------------------

|02ADB0| LDA.w $0698
|02ADB3| LDX.w $04AC

|02ADB6| INC A
|02ADB7| INC A
|02ADB8| STA.l $7EF802,X

|02ADBC| LDX.w $0698
|02ADBF| LDY.w $0692

|02ADC2| LDA.w BigMap16UpdateObjects+2,Y
|02ADC5| STA.l $7E2002,X

|02ADC9| LDX.w $04AC
|02ADCC| STA.l $7EFA02,X

|02ADD0| LDY.w #$0002
|02ADD3| LDX.w $0698
|02ADD6| JSL DrawMap16Anywhere

;---------------------------------------------------------------------------------------------------

|02ADDA| LDA.w $0698

|02ADDD| LDX.w $04AC

|02ADE0| CLC
|02ADE1| ADC.w #$0080
|02ADE4| STA.l $7EF804,X

|02ADE8| LDX.w $0698
|02ADEB| LDY.w $0692

|02ADEE| LDA.w BigMap16UpdateObjects+4,Y
|02ADF1| STA.l $7E2080,X

|02ADF5| LDX.w $04AC
|02ADF8| STA.l $7EFA04,X

|02ADFC| LDY.w #$0080
|02ADFF| LDX.w $0698
|02AE02| JSL DrawMap16Anywhere

;---------------------------------------------------------------------------------------------------

|02AE06| LDA.w $0698

|02AE09| LDX.w $04AC

|02AE0C| CLC
|02AE0D| ADC.w #$0082
|02AE10| STA.l $7EF806,X

|02AE14| LDX.w $0698
|02AE17| LDY.w $0692

|02AE1A| LDA.w BigMap16UpdateObjects+6,Y
|02AE1D| STA.l $7E2082,X

|02AE21| LDX.w $04AC
|02AE24| STA.l $7EFA06,X

|02AE28| LDY.w #$0082
|02AE2B| LDX.w $0698
|02AE2E| JSL DrawMap16Anywhere

;---------------------------------------------------------------------------------------------------

|02AE32| LDY.w $1000

|02AE35| LDA.w #$FFFF
|02AE38| STA.w $1002,Y

|02AE3B| LDA.w $04AC
|02AE3E| CLC
|02AE3F| ADC.w #$0008
|02AE42| STA.w $04AC

|02AE45| INC.w $0690

|02AE48| LDA.w $0692
|02AE4B| CMP.w #$0020
|02AE4E| BNE .dont_advance_count

|02AE50| INC.w $0690

.dont_advance_count
|02AE53| PLB

|02AE54| SEP #$30

|02AE56| LDA.b #$01
|02AE58| STA.b $14

;===================================================================================================

NoBigMap16Update:
|02AE5A| INC.w $0692

|02AE5D| RTS

;===================================================================================================

StartOverworldMosaicTransition:
|02AE5E| JSR ConditionalMosaicControl

|02AE61| LDA.b $B0
|02AE63| JSL JumpTableLocal
|02AE67| dw OverworldMosaicTransition_HandleSong                 ; 0x00
|02AE69| dw ApplyPaletteFilter_bounce                            ; 0x01
|02AE6B| dw OverworldMosaicTransition_HandleScreensAndLoadShroom ; 0x02

;===================================================================================================

OverworldMosaicTransition_HandleSong:
|02AE6D| LDX.b $8A
|02AE6F| CPX.b #$80
|02AE71| BEQ .skip

|02AE73| LDA.l $7F5B00,X
|02AE77| AND.b #$0F
|02AE79| CMP.w $0130
|02AE7C| BEQ .skip

|02AE7E| LDA.b #$F1 ; SONG F1 - fade
|02AE80| STA.w $012C

.skip
|02AE83| JMP.w ResetTransitionPropsAndAdvance_ResetInterface

;===================================================================================================

OverworldMosaicTransition_HandleScreensAndLoadShroom:
|02AE86| LDA.b #$80
|02AE88| STA.b $13

|02AE8A| STZ.b $B0

|02AE8C| LDA.b $8A
|02AE8E| AND.b #$3F ; OW 00, OW 40
|02AE90| BNE .not_woods_screen

|02AE92| LDA.b #$1E
|02AE94| JSL WriteTo4BPPBuffer_item_gfx

.not_woods_screen
|02AE98| LDA.w $040A
|02AE9B| BEQ .check_to_load

|02AE9D| LDA.b $10
|02AE9F| CMP.b #$0B
|02AEA1| BEQ .check_to_load

|02AEA3| LDY.b #$16

|02AEA5| LDA.b #$01
|02AEA7| STY.b $1C
|02AEA9| STA.b $1D

|02AEAB| LDA.b #$82
|02AEAD| STA.b $99

|02AEAF| LDA.b #$20
|02AEB1| STA.b $9A

|02AEB3| INC.b $11

|02AEB5| RTS

;---------------------------------------------------------------------------------------------------

.check_to_load
|02AEB6| LDA.b $11
|02AEB8| CMP.b #$24
|02AEBA| BNE .dont_load

|02AEBC| JSR LoadOverworldFromSpecialOverworld

|02AEBF| LDA.b $8A
|02AEC1| AND.b #$3F ; OW 00, OW 40
|02AEC3| BNE .dont_load

|02AEC5| LDA.b #$1E
|02AEC7| JSL WriteTo4BPPBuffer_item_gfx

.dont_load
|02AECB| INC.b $11

|02AECD| RTS

;===================================================================================================

Module09_1D:
|02AECE| JSR ConditionalMosaicControl

|02AED1| LDA.b $B0
|02AED3| JSL JumpTableLocal
|02AED7| dw ResetTransitionPropsAndAdvance_ResetInterface ; 0x00
|02AED9| dw ApplyPaletteFilter_bounce                     ; 0x01
|02AEDB| dw Module09_1D_02_FBlankAndEnterModule0A         ; 0x02

;===================================================================================================

Module09_1D_02_FBlankAndEnterModule0A:
|02AEDD| LDA.b #$80
|02AEDF| STA.b $13

|02AEE1| STZ.b $B0

|02AEE3| LDA.b #$0A
|02AEE5| STA.b $10
|02AEE7| STZ.b $11

|02AEE9| RTS

;===================================================================================================

Module09_1E:
|02AEEA| JSR ConditionalMosaicControl

|02AEED| LDA.b $B0
|02AEEF| JSL JumpTableLocal
|02AEF3| dw ResetTransitionPropsAndAdvance_ResetInterface ; 0x00
|02AEF5| dw ApplyPaletteFilter_bounce                     ; 0x01
|02AEF7| dw Module09_1E_02_FBlankAndLoadSPOW              ; 0x02

;===================================================================================================

Module09_1E_02_FBlankAndLoadSPOW:
|02AEF9| LDA.b #$80
|02AEFB| STA.b $13

|02AEFD| JSR LoadOverworldFromSpecialOverworld

|02AF00| LDA.b #$09
|02AF02| STA.b $10

|02AF04| LDA.b #$0F
|02AF06| STA.b $11

|02AF08| STZ.b $B0

|02AF0A| RTS

;===================================================================================================

Module09_25:
|02AF0B| JSL InitializeSpriteSlots
|02AF0F| JSL ResetAndReloadOverworldSprites

|02AF13| STZ.w $0308
|02AF16| STZ.w $0309

;===================================================================================================

Overworld_LoadSubscreenAndSilenceSFX1:
|02AF19| LDA.b #$05 ; SFX1.05
|02AF1B| STA.w $012D

;===================================================================================================

ReloadSubscreenOverlay:
|02AF1E| REP #$30

|02AF20| LDA.b $8A
|02AF22| STA.l $7EC213

|02AF26| LDA.b $84
|02AF28| STA.l $7EC215

|02AF2C| LDA.b $88
|02AF2E| STA.l $7EC217

|02AF32| LDA.b $86
|02AF34| STA.l $7EC219

|02AF38| LDA.w $0418
|02AF3B| STA.l $7EC21B

|02AF3F| LDA.w $0410
|02AF42| STA.l $7EC21D

|02AF46| LDA.w $0416
|02AF49| STA.l $7EC21F

|02AF4D| STZ.b $8C

|02AF4F| STZ.w $0622
|02AF52| STZ.w $0620

;---------------------------------------------------------------------------------------------------

|02AF55| LDY.w #$0390

|02AF58| LDA.b $8A
|02AF5A| CMP.w #$0080 ; SPOW
|02AF5D| BCC .normal_overworld

|02AF5F| LDX.w #$0097 ; OW 97

|02AF62| LDA.b $A0
|02AF64| CMP.w #$0180 ; OW 80
|02AF67| BNE .not_mastersword

|02AF69| LDX.w #$0080 ; OW 80
|02AF6C| LDA.l $7EF280,X

|02AF70| LDX.w #$0097 ; OW 97

|02AF73| AND.w #$0040
|02AF76| BNE .disable_overlay

;---------------------------------------------------------------------------------------------------

.do_load_special
|02AF78| JMP.w .load_overlay

;---------------------------------------------------------------------------------------------------

.not_mastersword
|02AF7B| LDX.w #$0094 ; OW 94
|02AF7E| CMP.w #$0181 ; OW 81
|02AF81| BEQ .do_load_special

|02AF83| LDX.w #$0093 ; OW 93
|02AF86| CMP.w #$0189 ; OW 89
|02AF89| BEQ .do_load_special

|02AF8B| CMP.w #$0182 ; OW 82
|02AF8E| BEQ .disable_with_sfx

|02AF90| CMP.w #$0183 ; OW 83
|02AF93| BNE .disable_overlay

;---------------------------------------------------------------------------------------------------

.disable_with_sfx
|02AF95| SEP #$30

|02AF97| LDA.b #$01 ; SFX1.01
|02AF99| STA.w $012D

;---------------------------------------------------------------------------------------------------

.disable_overlay
|02AF9C| SEP #$30

|02AF9E| STZ.b $1D

|02AFA0| INC.b $11

|02AFA2| RTS

;---------------------------------------------------------------------------------------------------

.normal_overworld
|02AFA3| AND.w #$003F ; OW 00, OW 40
|02AFA6| BNE .not_any_woods

|02AFA8| LDA.b $8A
|02AFAA| AND.w #$0040
|02AFAD| BNE .skull_woods

|02AFAF| LDX.w #$0080 ; OW 80
|02AFB2| LDA.l $7EF280,X

|02AFB6| LDX.w #$009E ; OW 9E
|02AFB9| AND.w #$0040
|02AFBC| BNE .load_overlay

.skull_woods
|02AFBE| LDX.w #$009D ; OW 9D
|02AFC1| BRA .load_overlay

;---------------------------------------------------------------------------------------------------

.not_any_woods
|02AFC3| LDX.w #$0095 ; OW 95

|02AFC6| LDA.b $8A
|02AFC8| CMP.w #$0003 ; OW 03
|02AFCB| BEQ .load_overlay

|02AFCD| CMP.w #$0005 ; OW 05
|02AFD0| BEQ .load_overlay

|02AFD2| CMP.w #$0007 ; OW 07
|02AFD5| BEQ .load_overlay

|02AFD7| LDX.w #$009C ; OW 9C

|02AFDA| CMP.w #$0043 ; OW 43
|02AFDD| BEQ .load_overlay

|02AFDF| CMP.w #$0045 ; OW 45
|02AFE2| BEQ .load_overlay

|02AFE4| CMP.w #$0047 ; OW 47
|02AFE7| BEQ .load_overlay

|02AFE9| CMP.w #$0070 ; OW 70
|02AFEC| BNE .not_mire

|02AFEE| LDA.l $7EF2F0
|02AFF2| AND.w #$0020
|02AFF5| BNE .load_overlay

|02AFF7| BRA .load_rain

;---------------------------------------------------------------------------------------------------

.not_mire
|02AFF9| LDX.w #$0096 ; OW 96

|02AFFC| LDA.l $7EF3C5
|02B000| AND.w #$00FF
|02B003| CMP.w #$0002
|02B006| BCS .load_overlay

.load_rain
|02B008| LDX.w #$009F ; OW 9F

;---------------------------------------------------------------------------------------------------

.load_overlay
|02B00B| STY.b $84

|02B00D| STX.b $8A
|02B00F| STX.b $8C

|02B011| LDA.b $84
|02B013| SEC
|02B014| SBC.w #$0400
|02B017| AND.w #$0F80
|02B01A| ASL A
|02B01B| XBA
|02B01C| STA.b $88

|02B01E| LDA.b $84
|02B020| SEC
|02B021| SBC.w #$0010
|02B024| AND.w #$003E
|02B027| LSR A
|02B028| STA.b $86

|02B02A| STZ.w $0418
|02B02D| STZ.w $0410
|02B030| STZ.w $0416

;---------------------------------------------------------------------------------------------------

|02B033| SEP #$30

|02B035| LDA.b #$82
|02B037| STA.b $99

|02B039| LDA.b #$16
|02B03B| STA.b $1C

|02B03D| LDA.b #$01
|02B03F| STA.b $1D

|02B041| PHX
|02B042| LDX.b $8A

|02B044| LDA.l $7F5B00,X
|02B048| LSR A
|02B049| LSR A
|02B04A| LSR A
|02B04B| LSR A
|02B04C| STA.w $012D

|02B04F| PLX

|02B050| LDA.b #$72

|02B052| CPX.b #$97 ; OW 97
|02B054| BEQ .continue_with_subscreen

|02B056| CPX.b #$94 ; OW 94
|02B058| BEQ .continue_with_subscreen

|02B05A| CPX.b #$93 ; OW 93
|02B05C| BEQ .continue_with_subscreen

|02B05E| CPX.b #$9D ; OW 9D
|02B060| BEQ .continue_with_subscreen

|02B062| CPX.b #$9E ; OW 9E
|02B064| BEQ .continue_with_subscreen

|02B066| CPX.b #$9F ; OW 9F
|02B068| BEQ .continue_with_subscreen

|02B06A| LDA.b #$20

|02B06C| CPX.b #$95 ; OW 95
|02B06E| BEQ .continue_with_subscreen

|02B070| CPX.b #$9C ; OW 9C
|02B072| BEQ .continue_with_subscreen

|02B074| LDA.l $7EC213
|02B078| TAX

|02B079| LDA.b #$20
|02B07B| CPX.b #$5B ; OW 5B
|02B07D| BEQ .continue_with_subscreen

|02B07F| CPX.b #$1B ; OW 1B
|02B081| BNE .disable_subscreen

|02B083| LDX.b $11
|02B085| CPX.b #$23
|02B087| BEQ .continue_with_subscreen

|02B089| CPX.b #$2C
|02B08B| BEQ .continue_with_subscreen

;---------------------------------------------------------------------------------------------------

.disable_subscreen
|02B08D| STZ.b $1D

.continue_with_subscreen
|02B08F| STA.b $9A

|02B091| JSR LoadOverworldOverlay

|02B094| LDA.b $8C
|02B096| CMP.b #$94 ; OW 94
|02B098| BNE .not_hobo_bridge_shadow

|02B09A| LDA.b $E7
|02B09C| ORA.b #$01
|02B09E| STA.b $E7

.not_hobo_bridge_shadow
|02B0A0| REP #$20

|02B0A2| LDA.l $7EC213
|02B0A6| STA.b $8A

|02B0A8| LDA.l $7EC215
|02B0AC| STA.b $84

|02B0AE| LDA.l $7EC217
|02B0B2| STA.b $88

|02B0B4| LDA.l $7EC219
|02B0B8| STA.b $86

|02B0BA| LDA.l $7EC21B
|02B0BE| STA.w $0418

|02B0C1| LDA.l $7EC21D
|02B0C5| STA.w $0410

|02B0C8| LDA.l $7EC21F
|02B0CC| STA.w $0416

|02B0CF| SEP #$20

|02B0D1| RTS

;===================================================================================================

Module09_FadeBackInFromMosaic:
|02B0D2| LDA.l $7EC007
|02B0D6| LSR A
|02B0D7| BCC .delay

|02B0D9| LDA.l $7EC011
|02B0DD| SEC
|02B0DE| SBC.b #$10
|02B0E0| STA.l $7EC011

.delay
|02B0E4| JSR CopyMosaicControl

|02B0E7| LDA.b $B0
|02B0E9| JSL JumpTableLocal
|02B0ED| dw OverworldMosaicTransition_RecoverDestinationPalettes ; 0x00
|02B0EF| dw OverworldMosaicTransition_FilterAndLoadGraphics      ; 0x01
|02B0F1| dw OverworldMosaicTransition_RecoverSongAndSetMoving    ; 0x02

;===================================================================================================

OverworldMosaicTransition_RecoverDestinationPalettes:
|02B0F3| LDX.b $8A

|02B0F5| LDA.l $7EFD40,X
|02B0F9| STA.b $00

|02B0FB| LDA.l OverworldPalettesScreenToSet,X
|02B0FF| JSL OverworldPalettesLoader

|02B103| BRA OverworldMosaicTransition_LoadSpriteGraphicsAndSetMosaic

;===================================================================================================

OverworldMosaicTransition_RecoverSongAndSetMoving:
|02B105| LDA.w $0130
|02B108| STA.w $0133

|02B10B| LDA.b $8A
|02B10D| CMP.b #$80 ; OW 80
|02B10F| BEQ .dont_set_song

|02B111| CMP.b #$2A ; OW 2A
|02B113| BEQ .dont_set_song

|02B115| LDX.b $8A

|02B117| LDA.l $7F5B00,X
|02B11B| LSR A
|02B11C| LSR A
|02B11D| LSR A
|02B11E| LSR A
|02B11F| BNE .has_sfx

|02B121| LDA.b #$05 ; SFX1.05

.has_sfx
|02B123| STA.w $012D

|02B126| LDA.l $7F5B00,X
|02B12A| AND.b #$0F
|02B12C| CMP.w $0130
|02B12F| BEQ .dont_set_song

|02B131| STA.w $012C

.dont_set_song
|02B134| STZ.b $11

|02B136| LDA.b #$08
|02B138| STA.b $11

|02B13A| STZ.b $B0

|02B13C| LDA.b $10
|02B13E| CMP.b #$0B
|02B140| BNE .exit

|02B142| LDA.b #$09
|02B144| STA.b $10

|02B146| LDA.b #$1F
|02B148| STA.b $11

|02B14A| LDA.b #$0C
|02B14C| STA.w $069A

.exit
|02B14F| RTS

;===================================================================================================

Module09_1C:
|02B150| LDA.l $7EC007
|02B154| LSR A
|02B155| BCC .delay

|02B157| LDA.l $7EC011
|02B15B| SEC
|02B15C| SBC.b #$10
|02B15E| STA.l $7EC011

.delay
|02B162| JSR CopyMosaicControl

|02B165| LDA.b $B0
|02B167| JSL JumpTableLocal
|02B16B| dw OverworldMosaicTransition_LoadSpriteGraphicsAndSetMosaic ; 0x00
|02B16D| dw OverworldMosaicTransition_FilterAndLoadGraphics          ; 0x01
|02B16F| dw Module09_1C_02_HandleMusic                               ; 0x02

;===================================================================================================

OverworldMosaicTransition_LoadSpriteGraphicsAndSetMosaic:
|02B171| JSL LoadNewSpriteGFXSet

|02B175| LDA.b #$0F
|02B177| STA.b $13

|02B179| LDA.b #$80
|02B17B| STA.b $9B

|02B17D| LDA.l $7EC00B
|02B181| DEC A
|02B182| STA.l $7EC007

|02B186| LDA.b #$00
|02B188| STA.l $7EC00B

|02B18C| LDA.b #$02
|02B18E| STA.l $7EC009

|02B192| INC.b $B0

|02B194| RTS

;===================================================================================================

OverworldMosaicTransition_FilterAndLoadGraphics:
|02B195| JSL IncrementalVRAMUpload
|02B199| JSL ApplyPaletteFilter

|02B19D| RTS

;===================================================================================================

Module09_1C_02_HandleMusic:
|02B19E| LDA.b $8A
|02B1A0| CMP.b #$80 ; OW 80
|02B1A2| BCS .no_song_change

|02B1A4| LDA.b #$02 ; SONG 02
|02B1A6| STA.w $012C

|02B1A9| LDA.b $8A
|02B1AB| AND.b #$3F ; OW 00, OW 40
|02B1AD| BNE .no_song_change

|02B1AF| LDA.b #$05 ; SONG 05
|02B1B1| STA.w $012C

.no_song_change
|02B1B4| LDA.b #$08
|02B1B6| STA.b $11

|02B1B8| STZ.b $B0

|02B1BA| RTS

;===================================================================================================

Module09_22:
|02B1BB| INC.b $13

|02B1BD| LDA.b $13
|02B1BF| CMP.b #$0F
|02B1C1| BNE .exit

|02B1C3| STZ.b $11
|02B1C5| STZ.b $B0

.exit
|02B1C7| RTS

;===================================================================================================

Module09_18:
|02B1C8| STZ.w $032A

|02B1CB| LDA.b $10
|02B1CD| PHA

|02B1CE| LDA.b $11
|02B1D0| PHA

|02B1D1| JSR LoadSpecialOverworld
|02B1D4| JSR Module09_25

|02B1D7| PLA
|02B1D8| INC A
|02B1D9| STA.b $11

|02B1DB| PLA
|02B1DC| STA.b $10

|02B1DE| RTS

;===================================================================================================

Module09_19:
|02B1DF| LDA.b $10
|02B1E1| PHA

|02B1E2| LDA.b $11
|02B1E4| PHA

|02B1E5| JSR Module08_02_LoadAndAdvance

|02B1E8| PLA
|02B1E9| INC A
|02B1EA| STA.b $11

|02B1EC| PLA
|02B1ED| STA.b $10

|02B1EF| RTS

;===================================================================================================

LoadAndBuildOverworldScreen_long:
|02B1F0| JSR LoadAndBuildOverworldScreen

|02B1F3| RTL

;===================================================================================================

ReloadSubscreenOverlayAndAdvance_long:
|02B1F4| JSR ReloadSubscreenOverlay

|02B1F7| DEC.b $11

|02B1F9| RTL

;===================================================================================================

Module09_MirrorWarp:
|02B1FA| JSL .main

|02B1FE| RTS

;---------------------------------------------------------------------------------------------------

.main
|02B1FF| INC.w $0710

|02B202| LDA.b $B0
|02B204| JSL JumpTableLong
|02B208| dl MirrorWarp_Initialize                 ; 0x00
|02B20B| dl MirrorWarp_BuildAndEnableHDMATable    ; 0x01
|02B20E| dl MirrorWarp_BuildWavingHDMATable       ; 0x02
|02B211| dl MirrorWarp_BuildDewavingHDMATable     ; 0x03
|02B214| dl MirrorWarp_FinalizeAndLoadDestination ; 0x04

;===================================================================================================

MirrorWarp_Initialize:
|02B217| LDA.b $8A
|02B219| CMP.b #$80 ; SPOW
|02B21B| BCC .not_special

|02B21D| STZ.b $11
|02B21F| STZ.b $B0
|02B221| STZ.w $0200

|02B224| RTL

;---------------------------------------------------------------------------------------------------

.not_special
|02B225| LDA.b #$08 ; SONG 08
|02B227| STA.w $012C
|02B22A| STA.w $0ABF

|02B22D| LDA.b #$90
|02B22F| STA.w $031F

|02B232| JSL InitializeMirrorHDMA

|02B236| LDA.l $7EF3CA
|02B23A| EOR.b #$40
|02B23C| STA.l $7EF3CA

|02B240| STZ.w $04C8
|02B243| STZ.w $04C9

|02B246| LDA.b $8A
|02B248| AND.b #$3F
|02B24A| ORA.l $7EF3CA
|02B24E| STA.b $8A
|02B250| STA.w $040A

|02B253| STZ.w $0200

|02B256| JSL PaletteFilter_InitializeWhiteFilter
|02B25A| JSR LoadGraphicsAndScreenSize

|02B25D| INC.b $B0

|02B25F| RTL

;===================================================================================================

MirrorWarp_FinalizeAndLoadDestination:
|02B260| REP #$20

|02B262| LDA.w #$2641
|02B265| STA.w DMA7MODE

|02B268| LDX.b #$3E

|02B26A| LDA.w #$FF00

.next
|02B26D| STA.w $1B00,X
|02B270| STA.w $1B40,X
|02B273| STA.w $1B80,X
|02B276| STA.w $1BC0,X
|02B279| STA.w $1C00,X
|02B27C| STA.w $1C40,X
|02B27F| STA.w $1C80,X

|02B282| DEX
|02B283| DEX
|02B284| BPL .next

;---------------------------------------------------------------------------------------------------

|02B286| LDA.w #$0000
|02B289| STA.l $7EC007
|02B28D| STA.l $7EC009

|02B291| SEP #$20

|02B293| JSL ReloadPreviouslyLoadedSheets
|02B297| JSL AdjustOverworldAmbiance

|02B29B| LDA.b #$80
|02B29D| STA.b $9B

|02B29F| LDX.b $8A

|02B2A1| LDA.l $7F5B00,X
|02B2A5| AND.b #$0F
|02B2A7| STA.w $012C

|02B2AA| LDA.l $7F5B00,X
|02B2AE| LSR A
|02B2AF| LSR A
|02B2B0| LSR A
|02B2B1| LSR A
|02B2B2| STA.w $012D

|02B2B5| CPX.b #$40 ; DW
|02B2B7| BCC .not_bunny_song

|02B2B9| LDA.l $7EF357
|02B2BD| BNE .not_bunny_song

|02B2BF| LDA.b #$04 ; SONG 04
|02B2C1| STA.w $012C

.not_bunny_song
|02B2C4| LDA.b $11
|02B2C6| STA.w $010C

|02B2C9| STZ.b $11
|02B2CB| STZ.b $B0

|02B2CD| STZ.w $0200
|02B2D0| STZ.w $0710

|02B2D3| RTL

;===================================================================================================

MirrorWarp_HandleCastlePyramidSubscreen:
|02B2D4| JSR Overworld_LoadSubscreenAndSilenceSFX1

|02B2D7| LDA.b $8A
|02B2D9| CMP.b #$1B ; OW 1B
|02B2DB| BEQ .is_castle

|02B2DD| CMP.b #$5B ; OW 5B
|02B2DF| BNE .not_pyramid

.is_castle
|02B2E1| LDA.b #$01
|02B2E3| STA.b $1D

.not_pyramid
|02B2E5| RTL

;===================================================================================================

DrawScreenAtCurrentMirrorPosition:
|02B2E6| REP #$20

|02B2E8| LDA.b $84
|02B2EA| PHA

|02B2EB| LDA.b $86
|02B2ED| PHA

|02B2EE| LDA.b $88
|02B2F0| PHA

|02B2F1| LDX.b $8A

|02B2F3| LDA.l OverworldScreenSize,X
|02B2F7| AND.w #$00FF
|02B2FA| BEQ .no_adjustment

|02B2FC| LDA.w #$0390
|02B2FF| STA.b $84

|02B301| SEC
|02B302| SBC.w #$0400
|02B305| AND.w #$0F80
|02B308| ASL A
|02B309| XBA
|02B30A| STA.b $88

|02B30C| LDA.b $84
|02B30E| SEC
|02B30F| SBC.w #$0010
|02B312| AND.w #$003E
|02B315| LSR A
|02B316| STA.b $86

;---------------------------------------------------------------------------------------------------

.no_adjustment
|02B318| SEP #$20

|02B31A| JSR DrawOverworldQuadrantsAndOverlays

|02B31D| LDA.b $11
|02B31F| CMP.b #$2C
|02B321| BNE .not_mirror_bonk

|02B323| JSR RecoverTilesFromMirrorBonk

.not_mirror_bonk
|02B326| REP #$20

|02B328| PLA
|02B329| STA.b $88

|02B32B| PLA
|02B32C| STA.b $86

|02B32E| PLA
|02B32F| STA.b $84

|02B331| SEP #$20

|02B333| RTL

;===================================================================================================

MirrorWarp_LoadSpritesAndColors:
|02B334| LDA.b #$90
|02B336| STA.w $031F

|02B339| REP #$20

|02B33B| LDA.b $84
|02B33D| PHA

|02B33E| LDA.b $86
|02B340| PHA

|02B341| LDA.b $88
|02B343| PHA

|02B344| LDA.w #$FFFF
|02B347| STA.b $C8

|02B349| STZ.b $CA
|02B34B| STZ.b $CC

;---------------------------------------------------------------------------------------------------

|02B34D| LDX.b $8A

|02B34F| LDA.l OverworldScreenSize,X
|02B353| AND.w #$00FF
|02B356| BEQ .no_adjustment

|02B358| LDA.w #$0390
|02B35B| STA.b $84

|02B35D| SEC
|02B35E| SBC.w #$0400
|02B361| AND.w #$0F80
|02B364| ASL A
|02B365| XBA
|02B366| STA.b $88

|02B368| LDA.b $84
|02B36A| SEC
|02B36B| SBC.w #$0010
|02B36E| AND.w #$003E
|02B371| LSR A
|02B372| STA.b $86

;---------------------------------------------------------------------------------------------------

.no_adjustment
|02B374| SEP #$20

|02B376| JSR BuildOverworldFromMap16

|02B379| REP #$20

|02B37B| PLA
|02B37C| STA.b $88

|02B37E| PLA
|02B37F| STA.b $86

|02B381| PLA
|02B382| STA.b $84

;---------------------------------------------------------------------------------------------------

|02B384| SEP #$20

|02B386| JSR OverworldLoadScreensPaletteSet

|02B389| LDX.b $8A

|02B38B| LDA.l $7EFD40,X
|02B38F| STA.b $00

|02B391| LDA.l OverworldPalettesScreenToSet,X
|02B395| JSL OverworldPalettesLoader

|02B399| JSL SetOverworldBackgroundColorCacheOnly
|02B39D| JSL Overworld_SetFixedColAndScroll

|02B3A1| LDA.b $8A
|02B3A3| CMP.b #$1B ; OW 1B
|02B3A5| BEQ .is_castle

|02B3A7| CMP.b #$5B ; OW 5B
|02B3A9| BNE .not_pyramid_a

.is_castle
|02B3AB| LDA.b #$01
|02B3AD| STA.b $1D

;---------------------------------------------------------------------------------------------------

.not_pyramid_a
|02B3AF| REP #$20

|02B3B1| LDX.b #$00

|02B3B3| LDA.w #$7FFF ; RGB: #F8F8F8

.next_color
|02B3B6| STA.l $7EC540,X
|02B3BA| STA.l $7EC560,X
|02B3BE| STA.l $7EC580,X
|02B3C2| STA.l $7EC5A0,X
|02B3C6| STA.l $7EC5C0,X
|02B3CA| STA.l $7EC5E0,X

|02B3CE| INX
|02B3CF| INX
|02B3D0| CPX.b #$20
|02B3D2| BNE .next_color

|02B3D4| STA.l $7EC500

;---------------------------------------------------------------------------------------------------

|02B3D8| LDA.b $8A
|02B3DA| CMP.w #$005B ; OW 5B
|02B3DD| BNE .not_pyramid_b

|02B3DF| LDA.w #$0000 ; RGB: #000000
|02B3E2| STA.l $7EC500
|02B3E6| STA.l $7EC540

;---------------------------------------------------------------------------------------------------

.not_pyramid_b
|02B3EA| SEP #$20

|02B3EC| JSL ResetAllSprites
|02B3F0| JSL ResetAndReloadOverworldSprites

|02B3F4| JSL ResetBasicActions

|02B3F8| JSR DeleteCertainAncillaeStopDashing

|02B3FB| LDA.b #$14 ; LINKSTATE 14
|02B3FD| STA.b $5D

|02B3FF| LDA.b $8A
|02B401| AND.b #$40
|02B403| BNE .exit

|02B405| JSL InitializeMirrorPortal

.exit
|02B409| RTL

;===================================================================================================

Module09_2B:
|02B40A| JSL PaletteBlackAndWhiteSomething_Conditional

;===================================================================================================

Module09_2D_WaitForBird:
|02B40E| RTS

;===================================================================================================

Module09_2E_Whirlpool:
|02B40F| INC.w $0710

|02B412| LDA.b $B0
|02B414| JSL JumpTableLocal
|02B418| dw Module09_2E_00_InitWhirlpool        ; 0x00
|02B41A| dw Module09_2E_01_FilterBlue           ; 0x01
|02B41C| dw Module09_2E_01_MoreBlue             ; 0x02
|02B41E| dw Module09_2E_03_FindDestination      ; 0x03
|02B420| dw Module09_2E_04                      ; 0x04
|02B422| dw Module09_2E_05_LoadDestinationMap   ; 0x05
|02B424| dw Module09_2E_04                      ; 0x06
|02B426| dw Module09_2E_07_LoadAuxGraphics      ; 0x07
|02B428| dw Module09_2E_08_TriggerTilemapUpdate ; 0x08
|02B42A| dw Module09_2E_09_LoadPalettes         ; 0x09
|02B42C| dw Module09_2E_0A                      ; 0x0A
|02B42E| dw Module09_2E_0B                      ; 0x0B
|02B430| dw Module09_2E_0C_FinalizeWarp         ; 0x0C

;===================================================================================================

Module09_2E_00_InitWhirlpool:
|02B432| LDA.b #$34 ; SFX2.34
|02B434| STA.w $012E

|02B437| LDA.b #$05 ; SFX1.05
|02B439| STA.w $012D

|02B43C| STZ.w $0200

|02B43F| LDA.b #$00
|02B441| STA.l $7EC007
|02B445| STA.l $7EC008

|02B449| INC.b $B0

|02B44B| RTS

;===================================================================================================

Module09_2E_01_FilterBlue:
|02B44C| JSL PaletteFilter_WhirlpoolBlue

|02B450| RTS

;===================================================================================================

Module09_2E_01_MoreBlue:
|02B451| JSL PaletteFilter_IsolateWhirlpoolBlue

|02B455| RTS

;===================================================================================================

Module09_2E_0B:
|02B456| JSL IncrementalVRAMUpload
|02B45A| JSL PaletteFilter_WhirlpoolRestoreBlue

|02B45E| RTS

;===================================================================================================

Module09_2E_0A:
|02B45F| JSL PaletteFilter_WhirlpoolRestoreRedGreen

|02B463| LDA.l $7EC007
|02B467| BEQ .exit

|02B469| JSL PaletteFilter_WhirlpoolRestoreRedGreen

.exit
|02B46D| RTS

;===================================================================================================

Module09_2E_03_FindDestination:
|02B46E| LDA.b #$9F ; max blue
|02B470| STA.b $9E

|02B472| STZ.w $0AA9
|02B475| STZ.w $0AB2

|02B478| JSL FindPartnerWhirlpoolExit

|02B47C| STZ.b $B2

|02B47E| JSL ReloadSubscreenOverlayAndAdvance_long

|02B482| LDA.b #$0C
|02B484| STA.b $17

|02B486| STZ.b $15

|02B488| BRA BlueRemoval

;===================================================================================================

Module09_2E_04:
|02B48A| LDA.b #$0D
|02B48C| STA.b $17

|02B48E| BRA AdvanceWhirlpooling

;===================================================================================================

Module09_2E_05_LoadDestinationMap:
|02B490| JSL Overworld_LoadOverlayAndMap

|02B494| LDA.b #$0C
|02B496| STA.b $17

|02B498| BRA EnableWhirlpoolScreen

;===================================================================================================

Module09_2E_07_LoadAuxGraphics:
|02B49A| JSR Module09_LoadAuxGFX

|02B49D| BRA DecrementWhirlpoolSubmodule

;===================================================================================================

Module09_2E_08_TriggerTilemapUpdate:
|02B49F| JSR Module09_TriggerTilemapUpdate

|02B4A2| LDA.b #$0F
|02B4A4| STA.b $13

|02B4A6| INC.w $0710

;===================================================================================================

DecrementWhirlpoolSubmodule:
|02B4A9| DEC.b $11

|02B4AB| INC.b $B0

|02B4AD| RTS

;===================================================================================================

Module09_2E_09_LoadPalettes:
|02B4AE| STZ.w $0AA9

|02B4B1| JSL PaletteLoad_SpriteMain
|02B4B5| JSL PaletteLoad_SpriteEnvironment
|02B4B9| JSL PaletteLoad_SpritePal0Left
|02B4BD| JSL PaletteLoad_HUD
|02B4C1| JSL PaletteLoad_OWBGMain

|02B4C5| LDX.b $8A

|02B4C7| LDA.l $7EFD40,X
|02B4CB| STA.b $00

|02B4CD| LDA.l OverworldPalettesScreenToSet,X
|02B4D1| JSL OverworldPalettesLoader
|02B4D5| JSL SetOverworldBackgroundColor
|02B4D9| JSL Overworld_SetFixedColAndScroll
|02B4DD| JSL LoadNewSpriteGFXSet

;===================================================================================================

BlueRemoval:
|02B4E1| LDA.b #$80
|02B4E3| STA.b $9E

;===================================================================================================

EnableWhirlpoolScreen:
|02B4E5| LDA.b #$0F
|02B4E7| STA.b $13

;===================================================================================================

AdvanceWhirlpooling:
|02B4E9| INC.w $0710
|02B4EC| INC.b $B0

|02B4EE| RTS

;===================================================================================================

Module09_2E_0C_FinalizeWarp:
|02B4EF| LDA.b #$90
|02B4F1| STA.w $031F

|02B4F4| JSL ReloadPreviouslyLoadedSheets

|02B4F8| LDA.b #$80
|02B4FA| STA.b $9B

|02B4FC| LDX.b $8A

|02B4FE| LDA.l $7F5B00,X
|02B502| LSR A
|02B503| LSR A
|02B504| LSR A
|02B505| LSR A
|02B506| STA.w $012D

|02B509| LDX.b #$02 ; SONG 02

|02B50B| LDA.l $7EF3CA
|02B50F| BEQ .not_dark_world

|02B511| LDX.b #$09 ; SONG 09

.not_dark_world
|02B513| STX.w $012C

|02B516| STZ.b $11
|02B518| STZ.b $B0

|02B51A| STZ.w $0200
|02B51D| STZ.w $0710

|02B520| RTS

;===================================================================================================

Module09_2F:
|02B521| JSL CreateTurtleRockPortal

|02B525| STZ.b $11

|02B527| RTS

;===================================================================================================

Module09_2A_RecoverFromDrowning:
|02B528| LDA.b $B0
|02B52A| JSL JumpTableLocal
|02B52E| dw Module09_2A_00_ScrollToLand
|02B530| dw RecoverPositionAfterDrowning

;===================================================================================================

Module09_2A_00_ScrollToLand:
|02B532| REP #$20

|02B534| STZ.b $00
|02B536| STZ.b $02

|02B538| LDA.b $22
|02B53A| CMP.l $7EC186
|02B53E| BEQ .set_x
|02B540| BCC .x_low

|02B542| DEC.b $02

|02B544| DEC A
|02B545| CMP.l $7EC186
|02B549| BEQ .set_x

|02B54B| DEC.b $02

|02B54D| DEC A

|02B54E| BRA .set_x

.x_low
|02B550| INC.b $02

|02B552| INC A
|02B553| CMP.l $7EC186
|02B557| BEQ .set_x

|02B559| INC.b $02
|02B55B| INC A

.set_x
|02B55C| STA.b $22

;---------------------------------------------------------------------------------------------------

|02B55E| LDA.b $20
|02B560| CMP.l $7EC184
|02B564| BEQ .set_y
|02B566| BCC .y_low

|02B568| DEC.b $00

|02B56A| DEC A
|02B56B| CMP.l $7EC184
|02B56F| BEQ .set_y

|02B571| DEC.b $00

|02B573| DEC A

|02B574| BRA .set_y

.y_low
|02B576| INC.b $00

|02B578| INC A
|02B579| CMP.l $7EC184
|02B57D| BEQ .set_y

|02B57F| INC.b $00
|02B581| INC A

.set_y
|02B582| STA.b $20

;---------------------------------------------------------------------------------------------------

|02B584| CMP.l $7EC184
|02B588| BNE .delay_advance

|02B58A| LDA.b $22
|02B58C| CMP.l $7EC186
|02B590| BNE .delay_advance

|02B592| INC.b $B0

|02B594| STZ.b $46

.delay_advance
|02B596| SEP #$20

|02B598| LDA.b $00
|02B59A| STA.b $30

|02B59C| LDA.b $02
|02B59E| STA.b $31

|02B5A0| JSR Overworld_OperateCameraScroll

|02B5A3| LDA.w $0416
|02B5A6| BEQ .exit

|02B5A8| JSR OverworldHandleMapScroll

.exit
|02B5AB| RTS

;===================================================================================================

RoomQuadrantLayoutValues:
|02B5AC| db $0F ; xxxx - 0 NW
|02B5AD| db $0F ; xxxx - 0 NE
|02B5AE| db $0F ; xxxx - 0 SW
|02B5AF| db $0F ; xxxx - 0 SE
|02B5B0| db $0B ; x.xx - 1 NW
|02B5B1| db $0B ; x.xx - 1 NE
|02B5B2| db $07 ; .xxx - 1 SW
|02B5B3| db $07 ; .xxx - 1 SE
|02B5B4| db $0F ; xxxx - 2 NW
|02B5B5| db $0B ; x.xx - 2 NE
|02B5B6| db $0F ; xxxx - 2 SW
|02B5B7| db $07 ; .xxx - 2 SE
|02B5B8| db $0B ; x.xx - 3 NW
|02B5B9| db $0F ; xxxx - 3 NE
|02B5BA| db $07 ; .xxx - 3 SW
|02B5BB| db $0F ; xxxx - 3 SE
|02B5BC| db $0E ; xxx. - 4 NW
|02B5BD| db $0D ; xx.x - 4 NE
|02B5BE| db $0E ; xxx. - 4 SW
|02B5BF| db $0D ; xx.x - 4 SE
|02B5C0| db $0F ; xxxx - 5 NW
|02B5C1| db $0F ; xxxx - 5 NE
|02B5C2| db $0E ; xxx. - 5 SW
|02B5C3| db $0D ; xx.x - 5 SE
|02B5C4| db $0E ; xxx. - 6 NW
|02B5C5| db $0D ; xx.x - 6 NE
|02B5C6| db $0F ; xxxx - 6 SW
|02B5C7| db $0F ; xxxx - 6 SE
|02B5C8| db $0A ; x.x. - 7 NW
|02B5C9| db $09 ; x..x - 7 NE
|02B5CA| db $06 ; .xx. - 7 SW
|02B5CB| db $05 ; .x.x - 7 SE

;===================================================================================================

QuadrantLayoutFlagBitfield:
|02B5CC| db $08, $04, $02, $01, $0C, $0C, $03, $03
|02B5D4| db $0A, $05, $0A, $05, $0F, $0F, $0F, $0F

;===================================================================================================

AdjustForRoomLayout:
|02B5DC| PHB
|02B5DD| PHK
|02B5DE| PLB

|02B5DF| SEP #$30

|02B5E1| JSR AdjustQuadrant

|02B5E4| STZ.b $A6

|02B5E6| LDY.b #$02

|02B5E8| LDA.b $A9
|02B5EA| BNE .right_side

|02B5EC| LDY.b #$01

.right_side
|02B5EE| STY.b $00

|02B5F0| LDA.w $0452
|02B5F3| BNE .from_wall

|02B5F5| LDX.b $A8

|02B5F7| LDA.w RoomQuadrantLayoutValues,X
|02B5FA| AND.b $00
|02B5FC| BNE .small_horizontally

.from_wall
|02B5FE| LDA.b #$02
|02B600| STA.b $A6

.small_horizontally
|02B602| STZ.b $A7

|02B604| LDY.b #$08
|02B606| LDA.b $AA
|02B608| BNE .bottom_side

|02B60A| LDY.b #$04

.bottom_side
|02B60C| STY.b $00

|02B60E| LDA.w $0453
|02B611| BNE .blast_wall_makes_tall

|02B613| LDX.b $A8
|02B615| LDA.w RoomQuadrantLayoutValues,X
|02B618| AND.b $00
|02B61A| BNE .small_vertically

.blast_wall_makes_tall
|02B61C| LDA.b #$02
|02B61E| STA.b $A7

.small_vertically
|02B620| LDA.b $FC
|02B622| BEQ .blast_wall_not_wide

|02B624| STA.b $A6

.blast_wall_not_wide
|02B626| LDA.b $FD
|02B628| BEQ .exit

|02B62A| STA.b $A7

.exit
|02B62C| PLB

|02B62D| RTL

;===================================================================================================

HandleEdgeTransitionMovementEast_Right8:
|02B62E| REP #$20

|02B630| LDA.b $22
|02B632| CLC
|02B633| ADC.w #$0008
|02B636| STA.b $22

|02B638| SEP #$20

;===================================================================================================

HandleEdgeTransitionMovementEast:
|02B63A| PHB
|02B63B| PHK
|02B63C| PLB

|02B63D| LDA.b $A9
|02B63F| EOR.b #$01
|02B641| STA.b $A9

|02B643| JSR AdjustQuadrant

|02B646| LDX.b #$08

|02B648| JSR AdjustCameraBoundariesDownOrRightQuadrant
|02B64B| JSR SaveRoomFlags

|02B64E| LDA.b $A9
|02B650| JSR AdjustUnderworldCamera_Horizontal

|02B653| LDY.b #$02
|02B655| JSR AdjustCameraBoundariesAfterTransition

|02B658| INC.b $11

|02B65A| LDA.b $A9
|02B65C| BNE .continue

|02B65E| LDX.b #$08
|02B660| JSR AdjustCameraBoundariesDownOrRightWholeRoom

|02B663| LDA.b $A0
|02B665| STA.b $A2

|02B667| LDA.w $0114
|02B66A| AND.b #$CF
|02B66C| CMP.b #$89 ; TILETYPE 89
|02B66E| BNE .not_teleport_door

|02B670| LDA.l $7EC004
|02B674| STA.b $A0

|02B676| DEC A

|02B677| LDY.b #$01
|02B679| JSR AdjustForTeleportDoors

|02B67C| BRA .continue_from_tele

;---------------------------------------------------------------------------------------------------

.not_teleport_door
|02B67E| LDA.w $048E
|02B681| CMP.b $A0
|02B683| BEQ .room_id_matches

|02B685| STA.b $A2

|02B687| JSR AdjustUnderworldCameraArbitrarily

.room_id_matches
|02B68A| INC.b $A0

;---------------------------------------------------------------------------------------------------

.continue_from_tele
|02B68C| INC.b $11

|02B68E| LDA.b $EF
|02B690| AND.b #$01
|02B692| BEQ .no_layer_swap

|02B694| LDA.b $EE
|02B696| EOR.b #$01
|02B698| STA.b $EE
|02B69A| STA.w $0476

.no_layer_swap
|02B69D| LDA.b $EF
|02B69F| AND.b #$02
|02B6A1| BEQ .continue

|02B6A3| LDA.w $040C
|02B6A6| EOR.b #$02
|02B6A8| STA.w $040C

;---------------------------------------------------------------------------------------------------

.continue
|02B6AB| STZ.b $EF

|02B6AD| STZ.b $A7

|02B6AF| LDY.b #$08

|02B6B1| LDA.b $AA
|02B6B3| BNE .on_lower_half

|02B6B5| LDY.b #$04

.on_lower_half
|02B6B7| STY.b $00

|02B6B9| LDA.w $0453
|02B6BC| BNE .set_layout

|02B6BE| LDX.b $A8

|02B6C0| LDA.w RoomQuadrantLayoutValues,X
|02B6C3| AND.b $00
|02B6C5| BNE .exit

.set_layout
|02B6C7| LDA.b #$02
|02B6C9| STA.b $A7

.exit
|02B6CB| PLB

|02B6CC| RTL

;===================================================================================================

HandleEdgeTransitionMovementWest_Left8:
|02B6CD| REP #$20

|02B6CF| LDA.b $22
|02B6D1| SEC
|02B6D2| SBC.w #$0008
|02B6D5| STA.b $22

|02B6D7| SEP #$20

;===================================================================================================

HandleEdgeTransitionMovementWest:
|02B6D9| PHB
|02B6DA| PHK
|02B6DB| PLB

|02B6DC| LDA.b $A9
|02B6DE| EOR.b #$01
|02B6E0| STA.b $A9

|02B6E2| JSR AdjustQuadrant

|02B6E5| LDX.b #$08
|02B6E7| JSR AdjustCameraBoundariesUpOrLeftQuadrant

|02B6EA| JSR SaveRoomFlags

|02B6ED| LDA.b $A9
|02B6EF| EOR.b #$01
|02B6F1| JSR AdjustUnderworldCamera_Horizontal

|02B6F4| LDY.b #$03
|02B6F6| JSR AdjustCameraBoundariesAfterTransition

|02B6F9| INC.b $11

|02B6FB| LDA.b $A9
|02B6FD| BEQ .continue

|02B6FF| LDX.b #$08
|02B701| JSR AdjustCameraBoundariesUpOrLeftWholeRoom

|02B704| LDA.b $A0
|02B706| STA.b $A2

|02B708| LDA.w $0114
|02B70B| AND.b #$CF
|02B70D| CMP.b #$89 ; TILETYPE 89
|02B70F| BNE .not_teleport_door

|02B711| LDA.l $7EC003
|02B715| STA.b $A0

|02B717| INC A

|02B718| LDY.b #$FF
|02B71A| JSR AdjustForTeleportDoors

|02B71D| BRA .continue_from_tele

;---------------------------------------------------------------------------------------------------

.not_teleport_door
|02B71F| LDA.w $048E
|02B722| CMP.b $A0
|02B724| BEQ .room_id_matches

|02B726| STA.b $A2

|02B728| JSR AdjustUnderworldCameraArbitrarily

.room_id_matches
|02B72B| DEC.b $A0

;---------------------------------------------------------------------------------------------------

.continue_from_tele
|02B72D| INC.b $11

|02B72F| LDA.b $EF
|02B731| AND.b #$01
|02B733| BEQ .no_layer_swap

|02B735| LDA.b $EE
|02B737| EOR.b #$01
|02B739| STA.b $EE
|02B73B| STA.w $0476

.no_layer_swap
|02B73E| LDA.b $EF
|02B740| AND.b #$02
|02B742| BEQ .continue

|02B744| LDA.w $040C
|02B747| EOR.b #$02
|02B749| STA.w $040C

;---------------------------------------------------------------------------------------------------

.continue
|02B74C| STZ.b $EF
|02B74E| STZ.b $A7

|02B750| LDY.b #$08

|02B752| LDA.b $AA
|02B754| BNE .on_lower_half

|02B756| LDY.b #$04

.on_lower_half
|02B758| STY.b $00

|02B75A| LDA.w $0453
|02B75D| BNE .set_layout

|02B75F| LDX.b $A8

|02B761| LDA.w RoomQuadrantLayoutValues,X
|02B764| AND.b $00
|02B766| BNE .exit

.set_layout
|02B768| LDA.b #$02
|02B76A| STA.b $A7

.exit
|02B76C| PLB

|02B76D| RTL

;===================================================================================================

HandleEdgeTransitionMovementSouth_Down16:
|02B76E| REP #$20

|02B770| LDA.b $20
|02B772| CLC
|02B773| ADC.w #$0010
|02B776| STA.b $20

|02B778| SEP #$20

;===================================================================================================

HandleEdgeTransitionMovementSouth:
|02B77A| PHB
|02B77B| PHK
|02B77C| PLB

|02B77D| LDA.b $AA
|02B77F| EOR.b #$02
|02B781| STA.b $AA

|02B783| JSR AdjustQuadrant

|02B786| LDX.b #$00
|02B788| JSR AdjustCameraBoundariesDownOrRightQuadrant

|02B78B| JSR SaveRoomFlags

|02B78E| LDA.b $AA
|02B790| JSR AdjustUnderworldCamera_Vertical

|02B793| LDY.b #$00
|02B795| JSR AdjustCameraBoundariesAfterTransition

|02B798| INC.b $11

|02B79A| LDA.b $AA
|02B79C| BNE .continue

|02B79E| LDX.b #$00
|02B7A0| JSR AdjustCameraBoundariesDownOrRightWholeRoom

|02B7A3| LDA.b $A0
|02B7A5| STA.b $A2

|02B7A7| LDA.w $0114
|02B7AA| CMP.b #$8E ; TILETYPE 8E
|02B7AC| BNE .not_entrance

;===================================================================================================

#PrepForOverworldExit:
|02B7AE| JSL SaveDungeonKeys
|02B7B2| JSL SaveVisitedQuadrantFlags

|02B7B6| LDA.b #$08
|02B7B8| STA.w $010C

|02B7BB| LDA.b #$0F
|02B7BD| STA.b $10
|02B7BF| STZ.b $11

|02B7C1| STZ.b $B0

|02B7C3| JSR DeleteCertainAncillaeStopDashing

|02B7C6| PLB

|02B7C7| RTL

;===================================================================================================

.not_entrance
|02B7C8| LDA.w $048E
|02B7CB| CMP.b $A0
|02B7CD| BEQ .room_id_matches

|02B7CF| STA.b $A2

|02B7D1| JSR AdjustUnderworldCameraArbitrarily

.room_id_matches
|02B7D4| LDA.b $A0
|02B7D6| CLC
|02B7D7| ADC.b #$10
|02B7D9| STA.b $A0

|02B7DB| INC.b $11

|02B7DD| LDA.b $EF
|02B7DF| AND.b #$01
|02B7E1| BEQ .no_layer_swap

|02B7E3| LDA.b $EE
|02B7E5| EOR.b #$01
|02B7E7| STA.b $EE
|02B7E9| STA.w $0476

.no_layer_swap
|02B7EC| LDA.b $EF
|02B7EE| AND.b #$02
|02B7F0| BEQ .continue

|02B7F2| LDA.w $040C
|02B7F5| EOR.b #$02
|02B7F7| STA.w $040C

.continue
|02B7FA| STZ.b $EF
|02B7FC| STZ.b $A6

|02B7FE| LDY.b #$02
|02B800| LDA.b $A9
|02B802| BNE .on_east_side

|02B804| LDY.b #$01

.on_east_side
|02B806| STY.b $00

|02B808| LDA.w $0452
|02B80B| BNE .set_layout

|02B80D| LDX.b $A8

|02B80F| LDA.w RoomQuadrantLayoutValues,X
|02B812| AND.b $00
|02B814| BNE .exit

.set_layout
|02B816| LDA.b #$02
|02B818| STA.b $A6

.exit
|02B81A| PLB

|02B81B| RTL

;===================================================================================================

HandleEdgeTransitionMovementNorth:
|02B81C| PHB
|02B81D| PHK
|02B81E| PLB

|02B81F| LDA.b $AA
|02B821| EOR.b #$02
|02B823| STA.b $AA

|02B825| JSR AdjustQuadrant

|02B828| LDX.b #$00
|02B82A| JSR AdjustCameraBoundariesUpOrLeftQuadrant

|02B82D| JSR SaveRoomFlags

|02B830| LDA.b $AA
|02B832| EOR.b #$02
|02B834| JSR AdjustUnderworldCamera_Vertical

|02B837| LDY.b #$01
|02B839| JSR AdjustCameraBoundariesAfterTransition

|02B83C| INC.b $11

|02B83E| LDA.b $AA
|02B840| BEQ .continue

|02B842| LDX.b #$00
|02B844| JSR AdjustCameraBoundariesUpOrLeftWholeRoom

|02B847| LDA.b $A0
|02B849| STA.b $A2

|02B84B| LDA.w $0114
|02B84E| CMP.b #$8E ; TILETYPE 8E
|02B850| BNE .not_entrance

|02B852| JMP.w PrepForOverworldExit

.not_entrance
|02B855| LDA.b $A0 ; ROOM 0000
|02B857| ORA.b $A1
|02B859| BNE .not_ganon_room

|02B85B| JSL SaveDungeonKeys

|02B85F| LDA.b #$19
|02B861| STA.b $10
|02B863| STZ.b $11

|02B865| STZ.b $B0

|02B867| PLB

|02B868| RTL

;---------------------------------------------------------------------------------------------------

.not_ganon_room
|02B869| LDA.w $048E
|02B86C| CMP.b $A0
|02B86E| BEQ .room_id_matches

|02B870| STA.b $A2

|02B872| JSR AdjustUnderworldCameraArbitrarily

.room_id_matches
|02B875| LDA.b $A0
|02B877| SEC
|02B878| SBC.b #$10
|02B87A| STA.b $A0

|02B87C| INC.b $11

|02B87E| LDA.b $EF
|02B880| AND.b #$01
|02B882| BEQ .no_layer_swap

|02B884| LDA.b $EE
|02B886| EOR.b #$01
|02B888| STA.b $EE
|02B88A| STA.w $0476

.no_layer_swap
|02B88D| LDA.b $EF
|02B88F| AND.b #$02
|02B891| BEQ .continue

|02B893| LDA.w $040C
|02B896| EOR.b #$02
|02B898| STA.w $040C

.continue
|02B89B| STZ.b $EF
|02B89D| STZ.b $A6

|02B89F| LDY.b #$02
|02B8A1| LDA.b $A9
|02B8A3| BNE .on_east_side

|02B8A5| LDY.b #$01

.on_east_side
|02B8A7| STY.b $00

|02B8A9| LDA.w $0452
|02B8AC| BNE .set_layout

|02B8AE| LDX.b $A8

|02B8B0| LDA.w RoomQuadrantLayoutValues,X
|02B8B3| AND.b $00
|02B8B5| BNE .exit

.set_layout
|02B8B7| LDA.b #$02
|02B8B9| STA.b $A6

.exit
|02B8BB| PLB

|02B8BC| RTL

;===================================================================================================

AdjustQuadrantAndCamera_right:
|02B8BD| LDA.b $A9
|02B8BF| EOR.b #$01
|02B8C1| STA.b $A9

|02B8C3| JSR AdjustQuadrant

|02B8C6| LDX.b #$08
|02B8C8| JSR AdjustCameraBoundariesDownOrRightQuadrant

;===================================================================================================

SetAndSaveVisitedQuadrantFlags:
|02B8CB| LDA.b $A7
|02B8CD| ASL A
|02B8CE| ASL A
|02B8CF| STA.b $00

|02B8D1| LDA.b $A6
|02B8D3| ASL A
|02B8D4| ORA.b $00
|02B8D6| ORA.b $AA
|02B8D8| ORA.b $A9
|02B8DA| TAX

|02B8DB| LDA.l QuadrantLayoutFlagBitfield,X
|02B8DF| ORA.w $0408
|02B8E2| STA.w $0408

;===================================================================================================

SaveVisitedQuadrantFlags:
|02B8E5| REP #$30

|02B8E7| LDA.b $A0
|02B8E9| ASL A
|02B8EA| TAX

|02B8EB| LDA.l $7EF000,X
|02B8EF| ORA.w $0408
|02B8F2| STA.l $7EF000,X

|02B8F6| SEP #$30

|02B8F8| RTL

;===================================================================================================

AdjustQuadrantAndCamera_left:
|02B8F9| LDA.b $A9
|02B8FB| EOR.b #$01
|02B8FD| STA.b $A9

|02B8FF| JSR AdjustQuadrant

|02B902| LDX.b #$08
|02B904| JSR AdjustCameraBoundariesUpOrLeftQuadrant

|02B907| BRA SetAndSaveVisitedQuadrantFlags

;===================================================================================================

AdjustQuadrantAndCamera_down:
|02B909| LDA.b $AA
|02B90B| EOR.b #$02
|02B90D| STA.b $AA

|02B90F| JSR AdjustQuadrant

|02B912| LDX.b #$00
|02B914| JSR AdjustCameraBoundariesDownOrRightQuadrant

|02B917| BRA SetAndSaveVisitedQuadrantFlags

;===================================================================================================

AdjustQuadrantAndCamera_up:
|02B919| LDA.b $AA
|02B91B| EOR.b #$02
|02B91D| STA.b $AA

|02B91F| JSR AdjustQuadrant

|02B922| LDX.b #$00
|02B924| JSR AdjustCameraBoundariesUpOrLeftQuadrant

|02B927| BRA SetAndSaveVisitedQuadrantFlags

;===================================================================================================

FullyUpdateRoomFlags:
|02B929| LDA.b $A7
|02B92B| ASL A
|02B92C| ASL A
|02B92D| STA.b $00

|02B92F| LDA.b $A6
|02B931| ASL A
|02B932| ORA.b $00
|02B934| ORA.b $AA
|02B936| ORA.b $A9
|02B938| TAX

|02B939| LDA.l QuadrantLayoutFlagBitfield,X
|02B93D| ORA.w $0408
|02B940| STA.w $0408

|02B943| JSR SaveRoomFlags

|02B946| RTL

;===================================================================================================

SaveRoomFlags:
|02B947| REP #$30

|02B949| LDA.b $A0
|02B94B| ASL A
|02B94C| TAX

|02B94D| LDA.w $0402
|02B950| LSR A
|02B951| LSR A
|02B952| LSR A
|02B953| LSR A
|02B954| STA.b $06

|02B956| LDA.w $0400
|02B959| AND.w #$F000

|02B95C| ORA.w $0408
|02B95F| ORA.b $06

|02B961| STA.l $7EF000,X

|02B965| SEP #$30

|02B967| RTS

;===================================================================================================

AdjustCameraBoundariesDownOrRightQuadrant:
|02B968| REP #$20

|02B96A| LDA.w $0600,X
|02B96D| CLC
|02B96E| ADC.w #$0100
|02B971| STA.w $0600,X

|02B974| LDA.w $0604,X
|02B977| CLC
|02B978| ADC.w #$0100
|02B97B| STA.w $0604,X

|02B97E| SEP #$20

|02B980| RTS

;===================================================================================================

AdjustCameraBoundariesDownOrRightWholeRoom:
|02B981| REP #$20

|02B983| LDA.w $0602,X
|02B986| CLC
|02B987| ADC.w #$0200
|02B98A| STA.w $0602,X

|02B98D| LDA.w $0606,X
|02B990| CLC
|02B991| ADC.w #$0200
|02B994| STA.w $0606,X

|02B997| SEP #$20

|02B999| RTS

;===================================================================================================

AdjustCameraBoundariesUpOrLeftQuadrant:
|02B99A| REP #$20

|02B99C| LDA.w $0600,X
|02B99F| SEC
|02B9A0| SBC.w #$0100
|02B9A3| STA.w $0600,X

|02B9A6| LDA.w $0604,X
|02B9A9| SEC
|02B9AA| SBC.w #$0100
|02B9AD| STA.w $0604,X

|02B9B0| SEP #$20

|02B9B2| RTS

;===================================================================================================

AdjustCameraBoundariesUpOrLeftWholeRoom:
|02B9B3| REP #$20

|02B9B5| LDA.w $0602,X
|02B9B8| SEC
|02B9B9| SBC.w #$0200
|02B9BC| STA.w $0602,X

|02B9BF| LDA.w $0606,X
|02B9C2| SEC
|02B9C3| SBC.w #$0200
|02B9C6| STA.w $0606,X

|02B9C9| SEP #$20

|02B9CB| RTS

;===================================================================================================

pool AdjustCameraBoundariesAfterTransition

.vertical_boundaries
|02B9CC| dw $0078
|02B9CE| dw $0178
|02B9D0| dw $0088
|02B9D2| dw $0188

.horizontal_boundaries
|02B9D4| dw $007F
|02B9D6| dw $017F
|02B9D8| dw $007F
|02B9DA| dw $017F

endpool

;---------------------------------------------------------------------------------------------------

AdjustCameraBoundariesAfterTransition:
|02B9DC| STY.w $0418

|02B9DF| LDA.b $67
|02B9E1| AND.b #$03
|02B9E3| BEQ .not_horizontal

|02B9E5| REP #$20

|02B9E7| LDX.b #$04

|02B9E9| LDA.b $67
|02B9EB| AND.w #$0001
|02B9EE| BEQ .not_right

|02B9F0| LDX.b #$00

.not_right
|02B9F2| LDY.b $A9
|02B9F4| BEQ .west_side

|02B9F6| INX
|02B9F7| INX

.west_side
|02B9F8| LDA.w .horizontal_boundaries,X
|02B9FB| STA.w $061C

|02B9FE| INC A
|02B9FF| INC A
|02BA00| STA.w $061E

|02BA03| SEP #$20

|02BA05| RTS

;---------------------------------------------------------------------------------------------------

.not_horizontal
|02BA06| REP #$20

|02BA08| LDX.b #$04

|02BA0A| LDA.b $67
|02BA0C| AND.w #$0004
|02BA0F| BEQ .not_down

|02BA11| LDX.b #$00

.not_down
|02BA13| LDY.b $AA
|02BA15| BEQ .upper_quadrant

|02BA17| INX
|02BA18| INX

.upper_quadrant
|02BA19| LDA.w .vertical_boundaries,X
|02BA1C| STA.w $0618

|02BA1F| INC A
|02BA20| INC A
|02BA21| STA.w $061A

|02BA24| SEP #$20

|02BA26| RTS

;===================================================================================================

AdjustQuadrant:
|02BA27| LDA.w $040E
|02BA2A| ORA.b $AA
|02BA2C| ORA.b $A9
|02BA2E| STA.b $A8

|02BA30| RTS

;===================================================================================================

HandleUnderworldCamera:
|02BA31| REP #$20

|02BA33| LDA.w #$0001
|02BA36| STA.b $00

|02BA38| LDA.b $78
|02BA3A| AND.w #$00FF
|02BA3D| BEQ .dont_zero

|02BA3F| LDA.b $24
|02BA41| CMP.w #$FFFF
|02BA44| BNE .dont_zero

|02BA46| LDA.w #$0000

.dont_zero
|02BA49| STA.b $0E

|02BA4B| LDA.b $20
|02BA4D| SEC
|02BA4E| SBC.b $0E
|02BA50| AND.w #$01FF

|02BA53| CLC
|02BA54| ADC.w #$000C
|02BA57| STA.b $0E

;---------------------------------------------------------------------------------------------------

|02BA59| LDA.b $30
|02BA5B| AND.w #$00FF
|02BA5E| BEQ .no_vertical_movement

|02BA60| LDX.b $A7 ; [USELESS]
|02BA62| CMP.w #$0080
|02BA65| BCC .moving_down_a

|02BA67| EOR.w #$00FF
|02BA6A| INC A

|02BA6B| DEC.b $00
|02BA6D| DEC.b $00

.moving_down_a
|02BA6F| TAY

;---------------------------------------------------------------------------------------------------

.next_vertical
|02BA70| LDX.b $A7

|02BA72| LDA.b $30
|02BA74| AND.w #$00FF
|02BA77| CMP.w #$0080
|02BA7A| BCC .moving_down_b

|02BA7C| LDA.w $0618
|02BA7F| CMP.b $0E
|02BA81| BCS .continue_vertically
|02BA83| BCC .dont_scroll_vertically

.moving_down_b
|02BA85| LDA.b $0E
|02BA87| CMP.w $061A
|02BA8A| BCC .dont_scroll_vertically

|02BA8C| INX
|02BA8D| INX
|02BA8E| INX
|02BA8F| INX

.continue_vertically
|02BA90| LDA.b $E8
|02BA92| CMP.w $0600,X
|02BA95| BEQ .dont_scroll_vertically

|02BA97| CLC
|02BA98| ADC.b $00
|02BA9A| STA.b $E8

|02BA9C| LDA.b $A0
|02BA9E| CMP.w #$FFFF
|02BAA1| BEQ .dont_scroll_vertically

|02BAA3| LDA.b $00
|02BAA5| STZ.b $04
|02BAA7| LSR A
|02BAA8| ROR.b $04

|02BAAA| CMP.w #$7000
|02BAAD| BCC .dont_invert_vertically

|02BAAF| ORA.w #$F000

.dont_invert_vertically
|02BAB2| STA.b $06

|02BAB4| LDA.w $0622
|02BAB7| CLC
|02BAB8| ADC.b $04
|02BABA| STA.w $0622

|02BABD| LDA.b $E6
|02BABF| ADC.b $06
|02BAC1| STA.b $E6

|02BAC3| LDA.w $0618
|02BAC6| CLC
|02BAC7| ADC.b $00
|02BAC9| STA.w $0618

|02BACC| INC A
|02BACD| INC A
|02BACE| STA.w $061A

.dont_scroll_vertically
|02BAD1| DEY
|02BAD2| BNE .next_vertical

;---------------------------------------------------------------------------------------------------

.no_vertical_movement
|02BAD4| LDA.w #$0001
|02BAD7| STA.b $00

|02BAD9| LDA.b $22
|02BADB| AND.w #$01FF
|02BADE| CLC
|02BADF| ADC.w #$0008
|02BAE2| STA.b $0E

|02BAE4| LDA.b $31
|02BAE6| AND.w #$00FF
|02BAE9| BEQ .no_horizontal_scroll

|02BAEB| LDX.b $A6
|02BAED| CMP.w #$0080
|02BAF0| BCC .moving_right_a

|02BAF2| EOR.w #$00FF
|02BAF5| INC A
|02BAF6| DEC.b $00
|02BAF8| DEC.b $00

.moving_right_a
|02BAFA| TAY

;---------------------------------------------------------------------------------------------------

.next_horizontal
|02BAFB| LDX.b $A6

|02BAFD| LDA.b $31
|02BAFF| AND.w #$00FF
|02BB02| CMP.w #$0080
|02BB05| BCC .moving_right_b

|02BB07| LDA.w $061C
|02BB0A| CMP.b $0E
|02BB0C| BCS .continue_horizontally
|02BB0E| BCC .dont_scroll_horizontally

.moving_right_b
|02BB10| LDA.b $0E
|02BB12| CMP.w $061E
|02BB15| BCC .dont_scroll_horizontally

|02BB17| INX
|02BB18| INX
|02BB19| INX
|02BB1A| INX

.continue_horizontally
|02BB1B| LDA.b $E2
|02BB1D| CMP.w $0608,X
|02BB20| BEQ .dont_scroll_horizontally

|02BB22| CLC
|02BB23| ADC.b $00
|02BB25| STA.b $E2

|02BB27| LDA.b $A0
|02BB29| CMP.w #$FFFF
|02BB2C| BEQ .dont_scroll_horizontally

|02BB2E| LDA.b $00
|02BB30| STZ.b $04

|02BB32| LSR A
|02BB33| ROR.b $04
|02BB35| CMP.w #$7000
|02BB38| BCC .dont_invert_horizontally

|02BB3A| ORA.w #$F000

.dont_invert_horizontally
|02BB3D| STA.b $06

|02BB3F| LDA.w $0620
|02BB42| CLC
|02BB43| ADC.b $04
|02BB45| STA.w $0620

|02BB48| LDA.b $E0
|02BB4A| ADC.b $06
|02BB4C| STA.b $E0

|02BB4E| LDA.w $061C
|02BB51| CLC
|02BB52| ADC.b $00
|02BB54| STA.w $061C

|02BB57| INC A
|02BB58| INC A
|02BB59| STA.w $061E

.dont_scroll_horizontally
|02BB5C| DEY
|02BB5D| BNE .next_horizontal

;---------------------------------------------------------------------------------------------------

.no_horizontal_scroll
|02BB5F| LDA.b $A0
|02BB61| CMP.w #$FFFF
|02BB64| BEQ .exit

|02BB66| LDX.w $0414
|02BB69| BEQ UnderworldSyncBG1and2Scroll

|02BB6B| CPX.b #$06
|02BB6D| BCS UnderworldSyncBG1and2Scroll

|02BB6F| CPX.b #$04
|02BB71| BEQ UnderworldSyncBG1and2Scroll

|02BB73| CPX.b #$03
|02BB75| BEQ UnderworldSyncBG1and2Scroll

|02BB77| CPX.b #$02
|02BB79| BNE .exit

;===================================================================================================

#UnderworldSyncBG1and2Scroll:
|02BB7B| REP #$20

|02BB7D| LDA.b $E2
|02BB7F| STA.b $E0

|02BB81| LDA.b $E8
|02BB83| STA.b $E6

.exit
|02BB85| SEP #$20

|02BB87| RTS

;===================================================================================================

OverworldTransitionDirections:
|02BB88| dw $0008 ; up
|02BB8A| dw $0004 ; down
|02BB8C| dw $0002 ; left
|02BB8E| dw $0001 ; right

;---------------------------------------------------------------------------------------------------

Overworld_OperateCameraScroll:
|02BB90| PHB
|02BB91| PHK
|02BB92| PLB

|02BB93| REP #$20

|02BB95| LDA.b $78
|02BB97| AND.w #$00FF
|02BB9A| BEQ .not_grounded

|02BB9C| LDA.b $24
|02BB9E| CMP.w #$FFFF
|02BBA1| BNE .not_grounded

|02BBA3| LDA.w #$0000

.not_grounded
|02BBA6| STA.b $0E

|02BBA8| LDA.b $20
|02BBAA| SEC
|02BBAB| SBC.b $0E
|02BBAD| CLC
|02BBAE| ADC.w #$000C
|02BBB1| STA.b $0E

|02BBB3| LDA.w #$0001
|02BBB6| STA.b $00

|02BBB8| LDA.b $30
|02BBBA| AND.w #$00FF
|02BBBD| BNE .moving_vertically

|02BBBF| JMP.w .handle_x_camera

.moving_vertically
|02BBC2| STZ.b $04

|02BBC4| CMP.w #$0080
|02BBC7| BCC .positive_vy

|02BBC9| EOR.w #$00FF
|02BBCC| INC A

|02BBCD| DEC.b $00
|02BBCF| DEC.b $00

.positive_vy
|02BBD1| STA.b $02

|02BBD3| STZ.b $08

;---------------------------------------------------------------------------------------------------

.next_camera_shift_y
|02BBD5| LDA.b $30
|02BBD7| AND.w #$00FF
|02BBDA| CMP.w #$0080
|02BBDD| BCC .positive_vy_2

|02BBDF| LDA.w $0618
|02BBE2| CMP.b $0E
|02BBE4| BCC .skip_camera_check_y

|02BBE6| LDY.b #$00
|02BBE8| BRA .check_camera_y

.positive_vy_2
|02BBEA| LDA.b $0E
|02BBEC| CMP.w $061A
|02BBEF| BCC .skip_camera_check_y

|02BBF1| LDY.b #$02

.check_camera_y
|02BBF3| LDX.b #$06
|02BBF5| JSR OverworldCameraBoundaryCheck

.skip_camera_check_y
|02BBF8| DEC.b $02
|02BBFA| BNE .next_camera_shift_y

;---------------------------------------------------------------------------------------------------

|02BBFC| LDA.b $04
|02BBFE| STA.w $069E

|02BC01| LDX.b $8C
|02BC03| CPX.b #$97 ; OW 97
|02BC05| BEQ .handle_x_camera

|02BC07| CPX.b #$9D ; OW 9D
|02BC09| BEQ .handle_x_camera

|02BC0B| LDA.b $04
|02BC0D| BEQ .handle_x_camera

|02BC0F| STZ.b $00
|02BC11| LSR A
|02BC12| ROR.b $00

|02BC14| LDX.b $8C
|02BC16| CPX.b #$B5 ; OW B5
|02BC18| BEQ .garbage_overlay

|02BC1A| CPX.b #$BE ; OW BE
|02BC1C| BNE .not_garbage_overlay

.garbage_overlay
|02BC1E| LSR A
|02BC1F| ROR.b $00
|02BC21| CMP.w #$3000
|02BC24| BCC .set_scroll_add_y

|02BC26| ORA.w #$F000
|02BC29| BRA .set_scroll_add_y

.not_garbage_overlay
|02BC2B| CMP.w #$7000
|02BC2E| BCC .set_scroll_add_y

|02BC30| ORA.w #$F000

.set_scroll_add_y
|02BC33| STA.b $06

|02BC35| LDA.w $0622
|02BC38| CLC
|02BC39| ADC.b $00
|02BC3B| STA.w $0622

|02BC3E| LDA.b $E6
|02BC40| ADC.b $06
|02BC42| STA.b $E6

|02BC44| LDA.b $8A
|02BC46| AND.w #$003F
|02BC49| CMP.w #$001B ; OW 1B, OW 5B
|02BC4C| BNE .handle_x_camera

|02BC4E| LDA.w #$0600
|02BC51| CMP.b $E6
|02BC53| BCC .camera_too_low_y

|02BC55| STA.b $E6

.camera_too_low_y
|02BC57| LDA.w #$06C0
|02BC5A| CMP.b $E6
|02BC5C| BCS .handle_x_camera

|02BC5E| STA.b $E6

;---------------------------------------------------------------------------------------------------

.handle_x_camera
|02BC60| LDA.b $22
|02BC62| CLC
|02BC63| ADC.w #$0008
|02BC66| STA.b $0E

|02BC68| LDA.w #$0001
|02BC6B| STA.b $00

|02BC6D| LDA.b $31
|02BC6F| AND.w #$00FF
|02BC72| BNE .moving_horizontally

|02BC74| JMP.w OverworldHandleBGOverlayScroll

.moving_horizontally
|02BC77| STZ.b $04

|02BC79| CMP.w #$0080
|02BC7C| BCC .positive_vx

|02BC7E| EOR.w #$00FF
|02BC81| INC A

|02BC82| DEC.b $00
|02BC84| DEC.b $00

.positive_vx
|02BC86| STA.b $02

|02BC88| LDX.b #$04
|02BC8A| STX.b $08

;---------------------------------------------------------------------------------------------------

.next_camera_shift_x
|02BC8C| LDA.b $31
|02BC8E| AND.w #$00FF
|02BC91| CMP.w #$0080
|02BC94| BCC .positive_vx_2

|02BC96| LDA.w $061C
|02BC99| CMP.b $0E
|02BC9B| BCC .skip_camera_check_x

|02BC9D| LDY.b #$04
|02BC9F| BRA .check_camera_x

.positive_vx_2
|02BCA1| LDA.b $0E
|02BCA3| CMP.w $061E
|02BCA6| BCC .skip_camera_check_x

|02BCA8| LDY.b #$06

.check_camera_x
|02BCAA| LDX.b #$00
|02BCAC| JSR OverworldCameraBoundaryCheck

.skip_camera_check_x
|02BCAF| DEC.b $02
|02BCB1| BNE .next_camera_shift_x

;---------------------------------------------------------------------------------------------------

|02BCB3| LDA.b $04
|02BCB5| STA.w $069F

|02BCB8| LDX.b $8C
|02BCBA| CPX.b #$97 ; OW 97
|02BCBC| BEQ OverworldHandleBGOverlayScroll

|02BCBE| CPX.b #$9D ; OW 9D
|02BCC0| BEQ OverworldHandleBGOverlayScroll

|02BCC2| LDA.b $04
|02BCC4| BEQ OverworldHandleBGOverlayScroll

|02BCC6| STZ.b $00
|02BCC8| LSR A
|02BCC9| ROR.b $00

|02BCCB| LDX.b $8C
|02BCCD| CPX.b #$95 ; OW 95
|02BCCF| BEQ .dm_overlay

|02BCD1| CPX.b #$9E ; OW 9E
|02BCD3| BNE .not_clear_lw_overlay

.dm_overlay
|02BCD5| LSR A
|02BCD6| ROR.b $00
|02BCD8| CMP.w #$3000
|02BCDB| BCC .set_scroll_add_x

|02BCDD| ORA.w #$F000
|02BCE0| BRA .set_scroll_add_x

.not_clear_lw_overlay
|02BCE2| CMP.w #$7000
|02BCE5| BCC .set_scroll_add_x

|02BCE7| ORA.w #$F000

.set_scroll_add_x
|02BCEA| STA.b $06

|02BCEC| LDA.w $0620
|02BCEF| CLC
|02BCF0| ADC.b $00
|02BCF2| STA.w $0620

|02BCF5| LDA.b $E0
|02BCF7| ADC.b $06
|02BCF9| STA.b $E0

;===================================================================================================

OverworldHandleBGOverlayScroll:
|02BCFB| LDX.b $8A
|02BCFD| CPX.b #$47 ; OW 47
|02BCFF| BEQ .no_overlay_scroll

|02BD01| LDX.b $8C
|02BD03| CPX.b #$9C ; OW 9C
|02BD05| BEQ .dark_dm_overlay_scroll

|02BD07| CPX.b #$97 ; OW 97
|02BD09| BEQ .grove_fog_scroll

|02BD0B| CPX.b #$9D ; OW 9D
|02BD0D| BNE .no_overlay_scroll

.grove_fog_scroll
|02BD0F| LDA.w $0622
|02BD12| CLC
|02BD13| ADC.w #$2000
|02BD16| STA.w $0622

|02BD19| LDA.b $E6
|02BD1B| ADC.w #$0000
|02BD1E| STA.b $E6

|02BD20| LDA.w $0620
|02BD23| CLC
|02BD24| ADC.w #$2000
|02BD27| STA.w $0620

|02BD2A| LDA.b $E0
|02BD2C| ADC.w #$0000
|02BD2F| STA.b $E0

|02BD31| BRA .no_overlay_scroll

.dark_dm_overlay_scroll
|02BD33| LDA.w $0622
|02BD36| SEC
|02BD37| SBC.w #$2000
|02BD3A| STA.w $0622

|02BD3D| LDA.b $E6
|02BD3F| SBC.w #$0000
|02BD42| CLC
|02BD43| ADC.w $069E
|02BD46| STA.b $E6

|02BD48| LDA.b $E2
|02BD4A| STA.b $E0

.no_overlay_scroll
|02BD4C| LDA.b $A0
|02BD4E| CMP.w #$0181 ; OW 81
|02BD51| BNE .exit

|02BD53| LDA.b $E8
|02BD55| ORA.w #$0100
|02BD58| STA.b $E6

|02BD5A| LDA.b $E2
|02BD5C| STA.b $E0

.exit
|02BD5E| SEP #$20

|02BD60| PLB

|02BD61| RTS

;===================================================================================================

OverworldCameraBoundaryCheck:
|02BD62| LDA.b $E2,X
|02BD64| CMP.w $0600,Y
|02BD67| BNE .not_at_boundary

|02BD69| TYA
|02BD6A| EOR.w #$0002
|02BD6D| TAX

|02BD6E| LDA.w #$0000
|02BD71| STA.w $0624,Y
|02BD74| STA.w $0624,X

|02BD77| RTS

;---------------------------------------------------------------------------------------------------

.not_at_boundary
|02BD78| CLC
|02BD79| ADC.b $00
|02BD7B| STA.b $E2,X

|02BD7D| LDA.b $04
|02BD7F| CLC
|02BD80| ADC.b $00
|02BD82| STA.b $04

|02BD84| LDX.b $08

|02BD86| LDA.w $061A,X
|02BD89| CLC
|02BD8A| ADC.b $00
|02BD8C| STA.w $061A,X

|02BD8F| INC A
|02BD90| INC A
|02BD91| STA.w $0618,X

|02BD94| TYA
|02BD95| EOR.w #$0002
|02BD98| TAX

|02BD99| LDA.w $0624,Y
|02BD9C| INC A
|02BD9D| STA.w $0624,Y

|02BDA0| CMP.w #$0010
|02BDA3| BMI .dont_extend_movement

|02BDA5| SEC
|02BDA6| SBC.w #$0010
|02BDA9| STA.w $0624,Y

|02BDAC| LDA.w OverworldTransitionDirections,Y
|02BDAF| ORA.w $0416
|02BDB2| STA.w $0416

.dont_extend_movement
|02BDB5| LDA.w #$0000
|02BDB8| SEC
|02BDB9| SBC.w $0624,Y
|02BDBC| STA.w $0624,X

|02BDBF| RTS

;===================================================================================================

pool AdjustUnderworldCamera_Horizontal

.boundary
|02BDC0| dw $0000
|02BDC2| dw $0100
|02BDC4| dw $0100
|02BDC6| dw $0000

endpool

;---------------------------------------------------------------------------------------------------

AdjustUnderworldCamera_Horizontal:
|02BDC8| ASL A
|02BDC9| ASL A
|02BDCA| TAY

|02BDCB| LDX.b #$00

.next
|02BDCD| LDA.w .boundary,Y
|02BDD0| STA.w $0614,X

|02BDD3| INY

|02BDD4| INX
|02BDD5| CPX.b #$04
|02BDD7| BNE .next

|02BDD9| RTS

;===================================================================================================

pool AdjustUnderworldCamera_Vertical

.boundary
|02BDDA| dw $0000
|02BDDC| dw $0110
|02BDDE| dw $0100
|02BDE0| dw $0010

endpool

;---------------------------------------------------------------------------------------------------

AdjustUnderworldCamera_Vertical:
|02BDE2| ASL A
|02BDE3| TAY

|02BDE4| LDX.b #$00

.next
|02BDE6| LDA.w .boundary,Y
|02BDE9| STA.w $0610,X

|02BDEC| INY

|02BDED| INX
|02BDEE| CPX.b #$04
|02BDF0| BNE .next

|02BDF2| RTS

;===================================================================================================

pool ScrollRoomDuringTransition

.camera_scroll
|02BDF3| dw   4
|02BDF5| dw  -4
|02BDF7| dw   4
|02BDF9| dw  -4

.boundaries
|02BDFB| dw $0034
|02BDFD| dw $0034
|02BDFF| dw $003B
|02BE01| dw $003A

endpool

;---------------------------------------------------------------------------------------------------

ScrollRoomDuringTransition:
|02BE03| PHB
|02BE04| PHK
|02BE05| PLB

|02BE06| INC.w $0126

|02BE09| LDA.w $0418
|02BE0C| ASL A
|02BE0D| TAY

|02BE0E| REP #$20

|02BE10| STZ.w $011A
|02BE13| STZ.w $011C

|02BE16| LDX.b #$00
|02BE18| CPY.b #$04
|02BE1A| BCS .scrolling_horizontally

|02BE1C| LDX.b #$06

.scrolling_horizontally
|02BE1E| LDA.b $E2,X
|02BE20| CLC
|02BE21| ADC.w .camera_scroll,Y
|02BE24| AND.w #$FFFE
|02BE27| STA.b $E2,X
|02BE29| STA.b $E0,X
|02BE2B| STA.b $00

;---------------------------------------------------------------------------------------------------

|02BE2D| LDX.b #$00
|02BE2F| CPY.b #$04
|02BE31| BCC .scrolling_vertically

|02BE33| LDX.b #$02

.scrolling_vertically
|02BE35| LDA.w $0126
|02BE38| AND.w #$00FF
|02BE3B| CMP.w .boundaries,Y
|02BE3E| BCC .keep_walking

|02BE40| LDA.b $20,X
|02BE42| CLC
|02BE43| ADC.w .camera_scroll,Y
|02BE46| STA.b $20,X

.keep_walking
|02BE48| LDA.b $00
|02BE4A| AND.w #$01FC
|02BE4D| CMP.w $0610,Y
|02BE50| BNE .dirty_exit

|02BE52| SEP #$20

|02BE54| JSL SetAndSaveVisitedQuadrantFlags

|02BE58| PLB

|02BE59| INC.b $B0

|02BE5B| STZ.w $0126

|02BE5E| LDA.b $11
|02BE60| CMP.b #$02
|02BE62| BNE .clean_exit

|02BE64| JSL BuildBG1QuadrantForUpload

|02BE68| RTS

;---------------------------------------------------------------------------------------------------

.dirty_exit
|02BE69| PLB

|02BE6A| SEP #$20

.clean_exit
|02BE6C| RTS

;===================================================================================================

pool Module07_11_0A_ScrollCamera

.offset
|02BE6D| dw  32
|02BE6F| dw -64
|02BE71| dw  32
|02BE73| dw -32

endpool

;---------------------------------------------------------------------------------------------------

Module07_11_0A_ScrollCamera:
|02BE75| PHB
|02BE76| PHK
|02BE77| PLB

|02BE78| LDA.b #$0C
|02BE7A| STA.b $4B
|02BE7C| STA.w $02F9

|02BE7F| LDA.w $0418
|02BE82| ASL A
|02BE83| TAX

|02BE84| REP #$20

|02BE86| LDA.b $E8
|02BE88| CLC
|02BE89| ADC.w ScrollRoomDuringTransition.camera_scroll,X
|02BE8C| AND.w #$FFFC
|02BE8F| STA.b $E8
|02BE91| STA.b $E6

|02BE93| AND.w #$01FC
|02BE96| CMP.w $0610,X
|02BE99| BNE .exit

;---------------------------------------------------------------------------------------------------

|02BE9B| LDY.b $11

|02BE9D| CPY.b #$12
|02BE9F| BCC .set_a

|02BEA1| INX
|02BEA2| INX
|02BEA3| INX
|02BEA4| INX

.set_a
|02BEA5| LDA.b $20
|02BEA7| CLC
|02BEA8| ADC.w .offset,X
|02BEAB| STA.b $20

|02BEAD| SEP #$20

;---------------------------------------------------------------------------------------------------

|02BEAF| STZ.b $4B
|02BEB1| STZ.w $02F9

|02BEB4| INC.b $B0

.exit
|02BEB6| SEP #$20

|02BEB8| PLB

|02BEB9| RTS

;===================================================================================================

pool OverworldScrollTransition SetOverworldCameraBoundaries

.coordinate_camera_adjust
|02BEBA| dw $FFF8, $0008, $FFF8, $0008

.unused_a
|02BEC2| dw $FFE8, $0018, $FFD8, $0018

.boundary_delta
|02BECA| dw $FF90, $0070, $FF90, $0070

.unused_b
|02BED2| dw $FE00, $0200, $FE00, $0200

.unused_c
|02BEDA| dw $0018, $00E8, $0008, $00E8

.transition_target_north
|02BEE2| dw $FF20, $FF20, $FF20, $FF20
|02BEEA| dw $FF20, $FF20, $FF20, $FF20
|02BEF2| dw $FF20, $FF20, $0120, $FF20
|02BEFA| dw $FF20, $FF20, $FF20, $0120
|02BF02| dw $0320, $0320, $0320, $0320
|02BF0A| dw $0320, $0320, $0320, $0320
|02BF12| dw $0520, $0520, $0520, $0520
|02BF1A| dw $0520, $0520, $0520, $0520
|02BF22| dw $0520, $0520, $0720, $0520
|02BF2A| dw $0520, $0720, $0520, $0520
|02BF32| dw $0920, $0920, $0920, $0920
|02BF3A| dw $0920, $0920, $0920, $0920
|02BF42| dw $0B20, $0B20, $0B20, $0B20
|02BF4A| dw $0B20, $0B20, $0B20, $0B20
|02BF52| dw $0B20, $0B20, $0D20, $0D20
|02BF5A| dw $0D20, $0B20, $0B20, $0D20

.transition_target_west
|02BF62| dw $FF00, $FF00, $0300, $0500
|02BF6A| dw $0500, $0900, $0900, $0D00
|02BF72| dw $FF00, $FF00, $0300, $0500
|02BF7A| dw $0500, $0900, $0900, $0D00
|02BF82| dw $FF00, $0100, $0300, $0500
|02BF8A| dw $0700, $0900, $0B00, $0D00
|02BF92| dw $FF00, $FF00, $0300, $0500
|02BF9A| dw $0500, $0900, $0B00, $0B00
|02BFA2| dw $FF00, $FF00, $0300, $0500
|02BFAA| dw $0500, $0900, $0B00, $0B00
|02BFB2| dw $FF00, $0100, $0300, $0500
|02BFBA| dw $0700, $0900, $0B00, $0D00
|02BFC2| dw $FF00, $FF00, $0300, $0500
|02BFCA| dw $0700, $0900, $0900, $0D00
|02BFD2| dw $FF00, $FF00, $0300, $0500
|02BFDA| dw $0700, $0900, $0900, $0D00

;---------------------------------------------------------------------------------------------------

.boundary_y_size
|02BFE2| dw $011E, $031E

.boundary_x_size
|02BFE6| dw $0100, $0300

.transition_target_south_offset
|02BFEA| dw $02E0, $04E0

.transition_target_east_offset
|02BFEE| dw $0300, $0500

;---------------------------------------------------------------------------------------------------

.camera_matters_when
|02BFF2| dw $001B, $001B, $001E, $001E

endpool

;---------------------------------------------------------------------------------------------------

OverworldScrollTransition_dirty_exit:
|02BFFA| SEP #$20

|02BFFC| PLB

|02BFFD| LDX.w $0410

|02C000| RTS

;---------------------------------------------------------------------------------------------------

OverworldScrollTransition:
|02C001| PHB
|02C002| PHK
|02C003| PLB

|02C004| INC.w $0126

|02C007| LDA.w $0418
|02C00A| ASL A
|02C00B| TAY

|02C00C| LDX.b #$01

|02C00E| CPY.b #$04
|02C010| BCS .going_horizontal

|02C012| LDX.b #$00

.going_horizontal
|02C014| LDA.w .coordinate_camera_adjust,Y
|02C017| STA.w $069E,X

;---------------------------------------------------------------------------------------------------

|02C01A| REP #$20

|02C01C| PHY

|02C01D| LDX.b #$00

|02C01F| CPY.b #$04
|02C021| BCS .adjust_horizontal_camera

|02C023| LDX.b #$06

.adjust_horizontal_camera
|02C025| LDA.b $E2,X
|02C027| CLC
|02C028| ADC.w .coordinate_camera_adjust,Y
|02C02B| STA.b $E2,X

|02C02D| LDY.b $8A
|02C02F| CPY.b #$1B ; OW 1B
|02C031| BEQ .castle_or_pyramid

|02C033| CPY.b #$5B ; OW 5B
|02C035| BEQ .castle_or_pyramid

|02C037| STA.b $E0,X

.castle_or_pyramid
|02C039| STA.b $00

;---------------------------------------------------------------------------------------------------

|02C03B| PLY

|02C03C| LDX.b #$00

|02C03E| CPY.b #$04
|02C040| BCC .adjust_y_position

|02C042| LDX.b #$02

.adjust_y_position
|02C044| LDA.w $0126
|02C047| AND.w #$00FF
|02C04A| CMP.w .camera_matters_when,Y
|02C04D| BCC .dont_add_in_camera

|02C04F| LDA.b $20,X
|02C051| CLC
|02C052| ADC.w .coordinate_camera_adjust,Y
|02C055| STA.b $20,X

.dont_add_in_camera
|02C057| LDA.b $00
|02C059| CMP.w $0610,Y
|02C05C| BNE OverworldScrollTransition_dirty_exit

;---------------------------------------------------------------------------------------------------

|02C05E| LDA.w $0418
|02C061| AND.w #$00FF
|02C064| BNE .dont_shift_v_scroll

|02C066| LDA.b $E8
|02C068| SEC
|02C069| SBC.w #$0002
|02C06C| STA.b $E8

.dont_shift_v_scroll
|02C06E| LDA.b $20,X
|02C070| AND.w #$FFF8
|02C073| STA.b $20,X

|02C075| CLC
|02C076| ADC.w .boundary_delta,Y
|02C079| PHA

|02C07A| TXA
|02C07B| ASL A
|02C07C| TAX

|02C07D| PLA
|02C07E| CLC
|02C07F| ADC.w #$000B
|02C082| STA.w $061A,X

|02C085| INC A
|02C086| INC A
|02C087| STA.w $0618,X

|02C08A| PHX

;---------------------------------------------------------------------------------------------------

|02C08B| LDX.b #$00

|02C08D| LDA.w $0712
|02C090| BEQ .smaller_screen

|02C092| INX
|02C093| INX

.smaller_screen
|02C094| LDA.w $0700
|02C097| CLC
|02C098| ADC.w OverworldMixedCoordsChange,Y
|02C09B| TAY

|02C09C| JSR SetOverworldCameraBoundaries

|02C09F| PLX

|02C0A0| STZ.w $0624,X
|02C0A3| STZ.w $0626,X

|02C0A6| SEP #$20

|02C0A8| LDA.b #$01
|02C0AA| STA.w $0ABF

|02C0AD| LDX.w $0410

|02C0B0| INC.b $11

|02C0B2| STZ.b $B0
|02C0B4| STZ.w $0126

;---------------------------------------------------------------------------------------------------

|02C0B7| PLB

|02C0B8| LDA.b $00

|02C0BA| PHA
|02C0BB| PHX

|02C0BC| JSL InitializeSpriteSlots

|02C0C0| PLX
|02C0C1| PLA

|02C0C2| RTS

;===================================================================================================

SetOverworldCameraBoundaries:
|02C0C3| LDA.w OverworldTransitionPositionY,Y
|02C0C6| STA.w $0600

|02C0C9| CLC
|02C0CA| ADC.w .boundary_y_size,X
|02C0CD| STA.w $0602

|02C0D0| LDA.w OverworldTransitionPositionX,Y
|02C0D3| STA.w $0604

|02C0D6| CLC
|02C0D7| ADC.w .boundary_x_size,X
|02C0DA| STA.w $0606

|02C0DD| LDA.w .transition_target_north,Y
|02C0E0| STA.w $0610

|02C0E3| CLC
|02C0E4| ADC.w .transition_target_south_offset,X
|02C0E7| STA.w $0612

|02C0EA| LDA.w .transition_target_west,Y
|02C0ED| STA.w $0614

|02C0F0| CLC
|02C0F1| ADC.w .transition_target_east_offset,X
|02C0F4| STA.w $0616

|02C0F7| RTS

;===================================================================================================

LinkLandingIndexOffset:
|02C0F8| db $00
|02C0F9| db $05
|02C0FA| db $0A
|02C0FB| db $0F

;===================================================================================================

UnderworldTransitionLandingCoordinate:
|02C0FC| db $0C, $20, $30, $38, $48
|02C101| db $D4, $D8, $C0, $C0, $A8
|02C106| db $0C, $18, $28, $30, $40
|02C10B| db $E4, $D8, $C8, $C0, $B0

;===================================================================================================

IntraroomTransition_FindTransitionLanding:
|02C110| JSR DeleteCertainAncillaeStopDashing
|02C113| JSR IntraroomTransitionCalculateLanding

|02C116| INC.b $B0

|02C118| REP #$30

|02C11A| LDA.b $A0
|02C11C| ASL A
|02C11D| TAX

|02C11E| LDA.l $7EF000,X
|02C122| ORA.w $0408
|02C125| STA.l $7EF000,X

|02C129| SEP #$30

|02C12B| RTS

;===================================================================================================

IntraroomTransitionCalculateLanding:
|02C12C| LDA.w $0418
|02C12F| AND.b #$02
|02C131| PHA

|02C132| JSR CalculateTransitionLanding

|02C135| LDX.w $0418

|02C138| CMP.b #$02
|02C13A| BNE .not_layers

|02C13C| LDA.b #$01

.not_layers
|02C13E| CMP.b #$04
|02C140| BNE .not_lower_layer_shutter

|02C142| LDA.b #$02

.not_lower_layer_shutter
|02C144| CLC
|02C145| ADC.l LinkLandingIndexOffset,X
|02C149| TAX

|02C14A| LDY.b #$08
|02C14C| LDA.l UnderworldTransitionLandingCoordinate,X
|02C150| BPL .positive

|02C152| LDY.b #$F8

.positive
|02C154| STY.b $00

|02C156| SEC
|02C157| SBC.b $00

|02C159| PLY

|02C15A| STA.w $0020,Y

|02C15D| LDX.b #$00
|02C15F| STX.b $4B

|02C161| RTS

;===================================================================================================

Module07_02_0D:
|02C162| LDA.l $7EC005
|02C166| ORA.l $7EC006
|02C16A| BEQ TransitionLinkOutOfDoor

|02C16C| JSL ApplyPaletteFilter

;===================================================================================================

TransitionLinkOutOfDoor:
|02C170| JSL HandleLinkAnimation_FullLongEntry

|02C174| JSR WalkOutOfDoor
|02C177| BCC .exit

|02C179| LDX.b $4E
|02C17B| CPX.b #$02
|02C17D| BEQ .clear_door_flag

|02C17F| CPX.b #$04
|02C181| BNE .ignore_door_flag

.clear_door_flag
|02C183| STZ.b $6C

.ignore_door_flag
|02C185| STZ.b $6F
|02C187| STZ.b $49
|02C189| STZ.b $4E

|02C18B| STZ.w $0418

|02C18E| INC.b $B0

.exit
|02C190| RTS

;===================================================================================================

WalkOutOfDoor:
|02C191| LDX.w $0418

|02C194| LDA.b $4E
|02C196| CLC
|02C197| ADC.l LinkLandingIndexOffset,X
|02C19B| TAX

|02C19C| LDY.b #$02

|02C19E| LDA.w $0418
|02C1A1| LSR A
|02C1A2| BCC .positive_speed

|02C1A4| LDY.b #$FE

.positive_speed
|02C1A6| STY.b $00

|02C1A8| LSR A
|02C1A9| BCS .handle_x

|02C1AB| LDY.b #$FF

|02C1AD| LDA.b $00
|02C1AF| BMI .negative_y

|02C1B1| INY

.negative_y
|02C1B2| CLC
|02C1B3| ADC.b $20
|02C1B5| STA.b $20

|02C1B7| TYA
|02C1B8| ADC.b $21
|02C1BA| STA.b $21

|02C1BC| LDA.b $20
|02C1BE| AND.b #$FE
|02C1C0| CMP.l UnderworldTransitionLandingCoordinate,X
|02C1C4| BEQ .success

.fail
|02C1C6| CLC

|02C1C7| RTS

;---------------------------------------------------------------------------------------------------

.handle_x
|02C1C8| LDY.b #$FF

|02C1CA| LDA.b $00
|02C1CC| BMI .negative_x

|02C1CE| INY

.negative_x
|02C1CF| CLC
|02C1D0| ADC.b $22
|02C1D2| STA.b $22

|02C1D4| TYA
|02C1D5| ADC.b $23
|02C1D7| STA.b $23

|02C1D9| LDA.b $22
|02C1DB| AND.b #$FE
|02C1DD| CMP.l UnderworldTransitionLandingCoordinate,X
|02C1E1| BNE .fail

.success
|02C1E3| SEC

|02C1E4| RTS

;===================================================================================================

CalculateTransitionLanding:
|02C1E5| REP #$20

|02C1E7| LDA.b $20
|02C1E9| CLC
|02C1EA| ADC.w #$000C
|02C1ED| AND.w #$01F8
|02C1F0| ASL A
|02C1F1| ASL A
|02C1F2| ASL A
|02C1F3| STA.b $00

|02C1F5| LDA.b $22
|02C1F7| CLC
|02C1F8| ADC.w #$0008
|02C1FB| AND.w #$01F8
|02C1FE| LSR A
|02C1FF| LSR A
|02C200| LSR A
|02C201| ORA.b $00

;---------------------------------------------------------------------------------------------------

|02C203| LDX.b $EE
|02C205| BEQ .upper_layer

|02C207| CLC
|02C208| ADC.w #$1000

.upper_layer
|02C20B| REP #$10

|02C20D| TAX
|02C20E| LDA.l $7F2000,X

|02C212| SEP #$30

|02C214| LDY.b #$00

|02C216| CMP.b #$00 ; TILETYPE 00
|02C218| BEQ .save

|02C21A| CMP.b #$09 ; TILETYPE 09
|02C21C| BEQ .save

|02C21E| INY

|02C21F| AND.b #$8E
|02C221| CMP.b #$80 ; TILETYPE 80, TILETYPE 81
|02C223| BEQ .save

|02C225| INY

|02C226| CMP.b #$82 ; TILETYPE 82
|02C228| BEQ .save

|02C22A| INY
|02C22B| CMP.b #$84 ; TILETYPE 84
|02C22D| BEQ .save

|02C22F| CMP.b #$88 ; TILETYPE 88
|02C231| BEQ .save

|02C233| INY
|02C234| CMP.b #$86 ; TILETYPE 86
|02C236| BEQ .save

|02C238| DEY
|02C239| DEY

.save
|02C23A| STY.b $4E

|02C23C| TYA

|02C23D| RTS

;===================================================================================================

pool Overworld_FinalizeEntryOntoScreen

.landing_point
|02C23E| db $E0
|02C23F| db $08
|02C240| db $E0
|02C241| db $10

endpool

;---------------------------------------------------------------------------------------------------

Overworld_FinalizeEntryOntoScreen:
|02C242| JSL HandleLinkAnimation_FullLongEntry

|02C246| LDY.b #$02

|02C248| LDA.w $069C
|02C24B| LSR A
|02C24C| BCS .positive

|02C24E| LDY.b #$FE

.positive
|02C250| STY.b $00

|02C252| LDX.b #$02

|02C254| LSR A
|02C255| BCS .handle_x_coords

|02C257| LDX.b #$00

.handle_x_coords
|02C259| LDY.b #$FF

|02C25B| LDA.b $00
|02C25D| BMI .negative

|02C25F| INY

.negative
|02C260| CLC
|02C261| ADC.b $20,X
|02C263| STA.b $20,X

|02C265| TYA
|02C266| ADC.b $21,X
|02C268| STA.b $21,X

|02C26A| LDA.b $20,X

|02C26C| LDX.w $069C

|02C26F| AND.b #$FE
|02C271| CMP.l .landing_point,X

|02C275| BNE .not_fade

;---------------------------------------------------------------------------------------------------

|02C277| STZ.b $11
|02C279| STZ.b $B0

|02C27B| LDX.b $8A

|02C27D| LDA.l $7F5B00,X
|02C281| LSR A
|02C282| LSR A
|02C283| LSR A
|02C284| LSR A
|02C285| STA.w $012D

|02C288| LDA.w $0130
|02C28B| CMP.b #$F1 ; SONG F1 - fade
|02C28D| BNE .not_fade

|02C28F| LDA.l $7F5B00,X
|02C293| AND.b #$0F
|02C295| STA.w $012C

.not_fade
|02C298| JSR Overworld_OperateCameraScroll

|02C29B| LDA.w $0416
|02C29E| BEQ .exit

|02C2A0| JSR OverworldHandleMapScroll

.exit
|02C2A3| RTS

;===================================================================================================

Module09_1F:
|02C2A4| JSL HandleLinkAnimation_FullLongEntry

|02C2A8| LDY.b #$01

|02C2AA| LDA.w $069C
|02C2AD| LSR A
|02C2AE| BCS .positive_velocity

|02C2B0| LDY.b #$FF

.positive_velocity
|02C2B2| STY.b $00

|02C2B4| LDX.b #$02

|02C2B6| LSR A
|02C2B7| BCS .handle_x_coords

|02C2B9| LDX.b #$00

.handle_x_coords
|02C2BB| LDY.b #$FF

|02C2BD| LDA.b $00
|02C2BF| BMI .negative

|02C2C1| INY

.negative
|02C2C2| CLC
|02C2C3| ADC.b $20,X
|02C2C5| STA.b $20,X

|02C2C7| TYA
|02C2C8| ADC.b $21,X
|02C2CA| STA.b $21,X

|02C2CC| TXA
|02C2CD| LSR A
|02C2CE| TAX

|02C2CF| LDA.b $00
|02C2D1| STA.b $30,X

|02C2D3| DEC.w $069A
|02C2D6| BNE .delay_mode

|02C2D8| LDA.b #$09
|02C2DA| STA.b $10
|02C2DC| STZ.b $11
|02C2DE| STZ.b $B0

.delay_mode
|02C2E0| JSR Overworld_OperateCameraScroll

|02C2E3| RTS

;===================================================================================================

ConditionalMosaicControl:
|02C2E4| LDA.l $7EC007
|02C2E8| LSR A
|02C2E9| BCC CopyMosaicControl

;===================================================================================================

MosaicControlIncrease:
|02C2EB| LDA.l $7EC011
|02C2EF| CLC
|02C2F0| ADC.b #$10
|02C2F2| STA.l $7EC011

;===================================================================================================

CopyMosaicControl:
|02C2F6| LDA.b #$09
|02C2F8| STA.b $94

|02C2FA| LDA.l $7EC011
|02C2FE| ORA.b #$07
|02C300| STA.b $95

|02C302| RTS

;===================================================================================================

LightWorldAmbiance:
|02C303| db $05, $05, $03, $03, $03, $03, $03, $03
|02C30B| db $05, $05, $03, $03, $03, $03, $03, $03
|02C313| db $03, $03, $13, $13, $13, $03, $03, $03
|02C31B| db $03, $03, $13, $13, $13, $03, $03, $03
|02C323| db $03, $03, $13, $13, $13, $03, $03, $03
|02C32B| db $03, $03, $13, $13, $13, $03, $03, $03
|02C333| db $03, $03, $03, $03, $03, $03, $03, $03
|02C33B| db $03, $03, $03, $03, $03, $03, $03, $03

|02C343| db $55, $55, $02, $52, $52, $52, $52, $52
|02C34B| db $55, $55, $02, $52, $52, $52, $52, $02
|02C353| db $02, $02, $02, $02, $02, $02, $02, $02
|02C35B| db $07, $07, $02, $02, $02, $02, $02, $02
|02C363| db $07, $07, $07, $02, $02, $02, $02, $02
|02C36B| db $07, $07, $02, $02, $02, $02, $02, $02
|02C373| db $02, $02, $02, $02, $02, $02, $02, $02
|02C37B| db $02, $02, $02, $02, $02, $02, $02, $02

|02C383| db $52, $52, $02, $52, $52, $52, $52, $52
|02C38B| db $52, $52, $02, $52, $52, $52, $52, $02
|02C393| db $02, $02, $02, $02, $02, $02, $02, $02
|02C39B| db $07, $07, $02, $02, $02, $02, $02, $02
|02C3A3| db $07, $07, $07, $02, $02, $02, $02, $02
|02C3AB| db $07, $07, $02, $02, $02, $02, $02, $02
|02C3B3| db $02, $02, $02, $02, $02, $02, $02, $02
|02C3BB| db $02, $02, $02, $02, $02, $02, $02, $02

|02C3C3| db $52, $52, $02, $52, $52, $52, $52, $52
|02C3CB| db $52, $52, $02, $52, $52, $52, $52, $02
|02C3D3| db $02, $02, $02, $02, $02, $02, $02, $02
|02C3DB| db $02, $02, $02, $02, $02, $02, $02, $02
|02C3E3| db $02, $02, $02, $02, $02, $02, $02, $02
|02C3EB| db $02, $02, $02, $02, $02, $02, $02, $02
|02C3F3| db $52, $52, $02, $02, $02, $02, $02, $02
|02C3FB| db $52, $52, $02, $02, $02, $02, $02, $02

DarkWorldAmbiance:
|02C403| db $9D, $9D, $09, $9D, $9D, $9D, $9D, $9D
|02C40B| db $9D, $9D, $09, $9D, $9D, $9D, $9D, $09
|02C413| db $09, $09, $09, $09, $09, $09, $09, $09
|02C41B| db $09, $09, $09, $09, $09, $09, $09, $09
|02C423| db $09, $09, $09, $09, $09, $09, $09, $09
|02C42B| db $09, $09, $09, $09, $09, $09, $09, $09
|02C433| db $09, $09, $09, $09, $09, $09, $09, $09
|02C43B| db $09, $09, $09, $09, $09, $09, $09, $09

; Special overworld
|02C443| db $05, $02, $02, $02, $02, $02, $02, $02
|02C44B| db $02, $02, $02, $02, $02, $02, $02, $02
|02C453| db $02, $02, $02, $02, $02, $02, $02, $02
|02C45B| db $02, $02, $02, $02, $02, $02, $02, $12

;===================================================================================================

AdjustOverworldAmbiance:
|02C463| PHB
|02C464| PHK
|02C465| PLB

|02C466| REP #$10

|02C468| LDA.b #$02
|02C46A| STA.b $00

|02C46C| LDX.w #$0000
|02C46F| LDY.w #$00C0

|02C472| LDA.l $7EF3C5
|02C476| CMP.b #$03
|02C478| BCS .copy_next

|02C47A| LDY.w #$0080

|02C47D| LDA.l $7EF359
|02C481| CMP.b #$02
|02C483| BCS .copy_next

|02C485| LDA.b #$05
|02C487| STA.b $00

|02C489| LDY.w #$0040

|02C48C| LDA.l $7EF3C5
|02C490| CMP.b #$02
|02C492| BCS .copy_next

|02C494| LDY.w #$0000

;---------------------------------------------------------------------------------------------------

.copy_next
|02C497| LDA.w LightWorldAmbiance,Y
|02C49A| STA.l $7F5B00,X

|02C49E| INY

|02C49F| INX
|02C4A0| CPX.w #$0040
|02C4A3| BNE .copy_next

;---------------------------------------------------------------------------------------------------

|02C4A5| LDY.w #$0000

.copy_more
|02C4A8| LDA.w DarkWorldAmbiance,Y
|02C4AB| STA.l $7F5B00,X

|02C4AF| INX

|02C4B0| INY
|02C4B1| CPY.w #$0060
|02C4B4| BNE .copy_more

;---------------------------------------------------------------------------------------------------

|02C4B6| LDA.b $00
|02C4B8| STA.l $7F5B80

|02C4BC| SEP #$10

|02C4BE| PLB
|02C4BF| RTL

;===================================================================================================
; FREE ROM: 0x40
;===================================================================================================
NULL_02C4C0:
|02C4C0| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02C4C8| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02C4D0| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02C4D8| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02C4E0| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02C4E8| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02C4F0| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02C4F8| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

Intro_InitializeBackgroundSettings:
|02C500| STZ.w SETINI

|02C503| LDA.b #$09
|02C505| STA.b $94
|02C507| STZ.b $95

|02C509| LDA.b #$13
|02C50B| STA.w BG1SC

|02C50E| LDA.b #$03
|02C510| STA.w BG2SC

|02C513| LDA.b #$63
|02C515| STA.w BG3SC

|02C518| LDA.b #$22
|02C51A| STA.w BG12NBA

|02C51D| LDA.b #$07
|02C51F| STA.w BG34NBA

|02C522| LDA.b #$20
|02C524| STA.b $9A

|02C526| LDA.b #$20 ; Fixed color RGB: #000000
|02C528| STA.b $9C

|02C52A| LDA.b #$40
|02C52C| STA.b $9D

|02C52E| LDA.b #$80
|02C530| STA.b $9E

|02C532| RTS

;===================================================================================================

LoadRoomForAttract:
|02C533| STA.w $010E

|02C536| JSR LoadUnderworldEntrance

|02C539| STZ.w $045A
|02C53C| STZ.w $0458

|02C53F| JSR LoadAndDrawRoom
|02C542| JSR ResetLampconeAndLink

|02C545| RTL

;===================================================================================================

SaveAndLoadAttractPalettes:
|02C546| STX.w $0AA3

|02C549| STA.w $0AA1
|02C54C| STA.w $0AA2

|02C54F| JSL InitializeTilesets

|02C553| LDA.b #$02
|02C555| STA.w $0AA9

|02C558| INC.b $15

|02C55A| JSL SetBGandFixedColorBlack

;---------------------------------------------------------------------------------------------------

LoadAttractAltarPalettes:
|02C55E| JSL PaletteLoad_SpritePal0Left
|02C562| JSL PaletteLoad_SpriteMain
|02C566| JSL PaletteLoad_SpriteAux1
|02C56A| JSL PaletteLoad_SpriteAux2
|02C56E| JSL PaletteLoad_SpriteEnvironment_Underworld
|02C572| JSL PaletteLoad_HUD
|02C576| JSL PaletteLoad_UnderworldSet

|02C57A| RTL

;===================================================================================================

LoadAndDrawRoom:
|02C57B| LDA.b $9B
|02C57D| PHA

|02C57E| STZ.w HDMAEN
|02C581| STZ.b $9B

|02C583| JSL LoadAndBuildRoom

|02C587| STZ.w $0418
|02C58A| STZ.w $045C
|02C58D| STZ.w $0200

;---------------------------------------------------------------------------------------------------

.next_quadrant
|02C590| JSL TilemapPrep_NotWaterOnTag
|02C594| JSL NMI_UploadTilemap_long

|02C598| JSL BuildBG2QuadrantForUpload
|02C59C| JSL NMI_UploadTilemap_long

|02C5A0| LDA.w $045C
|02C5A3| CMP.b #$10
|02C5A5| BNE .next_quadrant

;---------------------------------------------------------------------------------------------------

|02C5A7| PLA
|02C5A8| STA.b $9B

|02C5AA| STZ.b $17
|02C5AC| STZ.w $0200
|02C5AF| STZ.b $B0

|02C5B1| RTS

;===================================================================================================

Intro_LoadAllPalettes:
|02C5B2| REP #$20

|02C5B4| LDX.b #$00

|02C5B6| LDA.w #$0000 ; RGB: #000000

.next_color
|02C5B9| STA.l $7EC480,X
|02C5BD| STA.l $7EC500,X
|02C5C1| STA.l $7EC580,X
|02C5C5| STA.l $7EC600,X
|02C5C9| STA.l $7EC680,X

|02C5CD| INX
|02C5CE| INX
|02C5CF| CPX.b #$80
|02C5D1| BNE .next_color

;---------------------------------------------------------------------------------------------------

|02C5D3| SEP #$20

|02C5D5| LDA.b #$05
|02C5D7| STA.w $0AB3

|02C5DA| LDA.b #$03
|02C5DC| STA.w $0AB4
|02C5DF| STA.w $0AB5

|02C5E2| LDA.b #$00
|02C5E4| STA.w $0AB8

|02C5E7| LDA.b #$05
|02C5E9| STA.w $0AB1

|02C5EC| LDA.b #$0B
|02C5EE| STA.w $0AAC

|02C5F1| STZ.w $0ABD
|02C5F4| STZ.w $0AA9

|02C5F7| JSL SetBGandFixedColorBlack

|02C5FB| JSL PaletteLoad_SpritePal0Left
|02C5FF| JSL PaletteLoad_SpriteMain
|02C603| JSL PaletteLoad_OWBGMain

|02C607| JSL PaletteLoad_OWBG1
|02C60B| JSL PaletteLoad_OWBG2
|02C60F| JSL PaletteLoad_OWBG3

|02C613| JSL PaletteLoad_SpriteEnvironment_Underworld

|02C617| JSL PaletteLoad_HUD

;---------------------------------------------------------------------------------------------------

|02C61B| REP #$20

|02C61D| LDX.b #$00

.copy_next
|02C61F| LDA.l $7EC4D0,X
|02C623| STA.l $7EC6B0,X

|02C627| INX
|02C628| INX
|02C629| CPX.b #$10
|02C62B| BNE .copy_next

|02C62D| SEP #$20

|02C62F| RTS

;===================================================================================================

LoadUnderworldPalettes:
|02C630| STZ.w $0AA9

|02C633| JSL SetBGandFixedColorBlack

|02C637| JSL PaletteLoad_SpritePal0Left
|02C63B| JSL PaletteLoad_SpriteMain
|02C63F| JSL PaletteLoad_SpriteAux1
|02C643| JSL PaletteLoad_SpriteAux2

|02C647| JSL PaletteLoad_Sword
|02C64B| JSL PaletteLoad_Shield

|02C64F| JSL PaletteLoad_SpriteEnvironment
|02C653| JSL PaletteLoad_LinkArmorAndGloves

|02C657| JSL PaletteLoad_HUD
|02C65B| JSL PaletteLoad_UnderworldSet

;===================================================================================================

Overworld_CopyPalettesToCache_WithPrep:
|02C65F| LDA.w $0AB6
|02C662| STA.l $7EC20A

|02C666| LDA.w $0AB8
|02C669| STA.l $7EC20B

|02C66D| LDA.w $0AB7
|02C670| STA.l $7EC20C

|02C674| REP #$20

|02C676| LDA.w #$0002
|02C679| STA.l $7EC009

|02C67D| LDA.w #$0000
|02C680| STA.l $7EC007

|02C684| LDA.w #$0000
|02C687| STA.l $7EC00B

|02C68B| JMP.w Overworld_CopyPalettesToCache

;===================================================================================================

OverworldLoadScreensPaletteSet_long:
|02C68E| JSR OverworldLoadScreensPaletteSet

|02C691| RTL

;===================================================================================================

OverworldLoadScreensPaletteSet:
|02C692| LDX.b #$02

|02C694| LDA.b $8A
|02C696| AND.b #$3F
|02C698| CMP.b #$03 ; OW 03, OW 43
|02C69A| BEQ .not_death_mountain

|02C69C| CMP.b #$05 ; OW 05, OW 45
|02C69E| BEQ .not_death_mountain

|02C6A0| CMP.b #$07 ; OW 07, OW 47
|02C6A2| BEQ .not_death_mountain

|02C6A4| LDX.b #$00

.not_death_mountain
|02C6A6| LDA.b $8A
|02C6A8| AND.b #$40
|02C6AA| BEQ OverworldLoadScreensPaletteSet_Preloaded

|02C6AC| INX

;===================================================================================================

OverworldLoadScreensPaletteSet_Preloaded:
|02C6AD| STX.w $0AB3
|02C6B0| STZ.w $0AA9

|02C6B3| JSL PaletteLoad_SpriteMain
|02C6B7| JSL PaletteLoad_SpriteEnvironment

|02C6BB| JSL PaletteLoad_SpriteAux1
|02C6BF| JSL PaletteLoad_SpriteAux2

|02C6C3| JSL PaletteLoad_Sword
|02C6C7| JSL PaletteLoad_Shield
|02C6CB| JSL PaletteLoad_LinkArmorAndGloves

|02C6CF| LDX.b #$01

|02C6D1| LDA.l $7EF3CA
|02C6D5| AND.b #$40
|02C6D7| BEQ .light_world

|02C6D9| LDX.b #$03

.light_world
|02C6DB| STX.w $0AAC

|02C6DE| JSL PaletteLoad_SpritePal0Left
|02C6E2| JSL PaletteLoad_HUD
|02C6E6| JSL PaletteLoad_OWBGMain

|02C6EA| RTS

;===================================================================================================

SpecialOverworld_CopyPalettesToCache:
|02C6EB| REP #$20

|02C6ED| LDX.b #$00

|02C6EF| LDA.w #$0000 ; RGB: #000000

.next_black
|02C6F2| STA.l $7EC540,X
|02C6F6| STA.l $7EC580,X
|02C6FA| STA.l $7EC5C0,X
|02C6FE| STA.l $7EC600,X
|02C702| STA.l $7EC640,X
|02C706| STA.l $7EC680,X
|02C70A| STA.l $7EC6C0,X

|02C70E| INX
|02C70F| INX
|02C710| CPX.b #$40
|02C712| BNE .next_black

;---------------------------------------------------------------------------------------------------

|02C714| LDX.b #$00

.next_color
|02C716| LDA.l $7EC300,X
|02C71A| STA.l $7EC500,X

|02C71E| LDA.l $7EC310,X
|02C722| STA.l $7EC510,X

|02C726| LDA.l $7EC320,X
|02C72A| STA.l $7EC520,X

|02C72E| LDA.l $7EC330,X
|02C732| STA.l $7EC530,X

|02C736| LDA.l $7EC4B0,X
|02C73A| STA.l $7EC6B0,X

|02C73E| LDA.l $7EC4D0,X
|02C742| STA.l $7EC6D0,X

|02C746| LDA.l $7EC4E0,X
|02C74A| STA.l $7EC6E0,X

|02C74E| LDA.l $7EC4F0,X
|02C752| STA.l $7EC6F0,X

|02C756| INX
|02C757| INX
|02C758| CPX.b #$10
|02C75A| BNE .next_color

;---------------------------------------------------------------------------------------------------

|02C75C| SEP #$20

|02C75E| LDA.b #$F7
|02C760| STA.b $95
|02C762| STA.l $7EC011

|02C766| INC.b $15

|02C768| RTS

;===================================================================================================

Overworld_CopyPalettesToCache:
|02C769| REP #$20

|02C76B| LDX.b #$00

.next_color
|02C76D| LDA.l $7EC300,X
|02C771| STA.l $7EC500,X

|02C775| LDA.l $7EC340,X
|02C779| STA.l $7EC540,X

|02C77D| LDA.l $7EC380,X
|02C781| STA.l $7EC580,X

|02C785| LDA.l $7EC3C0,X
|02C789| STA.l $7EC5C0,X

|02C78D| LDA.l $7EC400,X
|02C791| STA.l $7EC600,X

|02C795| LDA.l $7EC440,X
|02C799| STA.l $7EC640,X

|02C79D| LDA.l $7EC480,X
|02C7A1| STA.l $7EC680,X

|02C7A5| LDA.l $7EC4C0,X
|02C7A9| STA.l $7EC6C0,X

|02C7AD| INX
|02C7AE| INX
|02C7AF| CPX.b #$40
|02C7B1| BNE .next_color

;---------------------------------------------------------------------------------------------------

|02C7B3| SEP #$20

|02C7B5| INC.b $15

|02C7B7| RTS

;===================================================================================================

CleanUpAndPrepDesertPrayerHDMA:
|02C7B8| PHB
|02C7B9| PHK
|02C7BA| PLB

|02C7BB| LDX.b #$04

.next_prop
|02C7BD| LDA.w .hdma_props,X
|02C7C0| STA.w DMA7MODE,X

|02C7C3| DEX
|02C7C4| BPL .next_prop

;---------------------------------------------------------------------------------------------------

|02C7C6| LDA.b #$00
|02C7C8| STA.w HDMA7ITBLB

|02C7CB| LDA.b #$33
|02C7CD| STA.b $96

|02C7CF| LDA.b #$03
|02C7D1| STA.b $97

|02C7D3| LDA.b #$33
|02C7D5| STA.b $98

|02C7D7| LDA.b $1C
|02C7D9| STA.b $1E

|02C7DB| LDA.b $1D
|02C7DD| STA.b $1F

|02C7DF| LDA.b #$80
|02C7E1| STA.b $9B

|02C7E3| REP #$10

|02C7E5| LDX.w #$01DF

;---------------------------------------------------------------------------------------------------

.clear_next
|02C7E8| STZ.w $1B00,X

|02C7EB| DEX
|02C7EC| BPL .clear_next

|02C7EE| SEP #$10

|02C7F0| PLB

|02C7F1| RTL

;---------------------------------------------------------------------------------------------------

.unused_hdma_data
|02C7F2| db $01 : dw $FF00 ; 1 line
|02C7F5| db $01 : dw $FF00 ; 1 line
|02C7F8| db $01 : dw $FF00 ; 1 line
|02C7FB| db $01 : dw $FF00 ; 1 line
|02C7FE| db $81 : dw $0000 ; 1 line continuous
|02C801| db $00 ; end

.unused_hdma_props
|02C802| db $01 ; direct transfer, 2 registers write once
|02C803| db WH0
|02C804| dl $001B00 ; table location

;---------------------------------------------------------------------------------------------------

.hdma_props
|02C807| db $41 ; indirect transfer, 2 registers write once
|02C808| db WH0
|02C809| dl .indirect_table

.indirect_table
|02C80C| db $F8 : dw $1B00 ; 120 lines, continuous
|02C80F| db $F8 : dw $1BF0 ; 120 lines, continuous
|02C812| db $00 ; end

;===================================================================================================

EntranceData:

.room_id
|02C813| dw $0104 ; 0x00
|02C815| dw $0104 ; 0x01
|02C817| dw $0012 ; 0x02
|02C819| dw $0060 ; 0x03
|02C81B| dw $0061 ; 0x04
|02C81D| dw $0062 ; 0x05
|02C81F| dw $00F0 ; 0x06
|02C821| dw $00F1 ; 0x07
|02C823| dw $00C9 ; 0x08
|02C825| dw $0084 ; 0x09
|02C827| dw $0085 ; 0x0A
|02C829| dw $0083 ; 0x0B
|02C82B| dw $0063 ; 0x0C
|02C82D| dw $00F2 ; 0x0D
|02C82F| dw $00F3 ; 0x0E
|02C831| dw $00F4 ; 0x0F
|02C833| dw $00F5 ; 0x10
|02C835| dw $00E3 ; 0x11
|02C837| dw $00E2 ; 0x12
|02C839| dw $00F8 ; 0x13
|02C83B| dw $00E8 ; 0x14
|02C83D| dw $0023 ; 0x15
|02C83F| dw $00FB ; 0x16
|02C841| dw $00EB ; 0x17
|02C843| dw $00D5 ; 0x18
|02C845| dw $0024 ; 0x19
|02C847| dw $00FD ; 0x1A
|02C849| dw $00ED ; 0x1B
|02C84B| dw $00FE ; 0x1C
|02C84D| dw $00EE ; 0x1D
|02C84F| dw $00FF ; 0x1E
|02C851| dw $00EF ; 0x1F
|02C853| dw $00DF ; 0x20
|02C855| dw $00F9 ; 0x21
|02C857| dw $00FA ; 0x22
|02C859| dw $00EA ; 0x23
|02C85B| dw $00E0 ; 0x24
|02C85D| dw $0028 ; 0x25
|02C85F| dw $004A ; 0x26
|02C861| dw $0098 ; 0x27
|02C863| dw $0056 ; 0x28
|02C865| dw $0057 ; 0x29
|02C867| dw $0058 ; 0x2A
|02C869| dw $0059 ; 0x2B
|02C86B| dw $00E1 ; 0x2C
|02C86D| dw $000E ; 0x2D
|02C86F| dw $00E6 ; 0x2E
|02C871| dw $00E7 ; 0x2F
|02C873| dw $00E4 ; 0x30
|02C875| dw $00E5 ; 0x31
|02C877| dw $0055 ; 0x32
|02C879| dw $0077 ; 0x33
|02C87B| dw $00DB ; 0x34
|02C87D| dw $00D6 ; 0x35
|02C87F| dw $0010 ; 0x36
|02C881| dw $000C ; 0x37
|02C883| dw $0008 ; 0x38
|02C885| dw $002F ; 0x39
|02C887| dw $003C ; 0x3A
|02C889| dw $002C ; 0x3B
|02C88B| dw $0100 ; 0x3C
|02C88D| dw $011E ; 0x3D
|02C88F| dw $0101 ; 0x3E
|02C891| dw $0101 ; 0x3F
|02C893| dw $0102 ; 0x40
|02C895| dw $0117 ; 0x41
|02C897| dw $0103 ; 0x42
|02C899| dw $0103 ; 0x43
|02C89B| dw $0103 ; 0x44
|02C89D| dw $0105 ; 0x45
|02C89F| dw $011F ; 0x46
|02C8A1| dw $0106 ; 0x47
|02C8A3| dw $0106 ; 0x48
|02C8A5| dw $0107 ; 0x49
|02C8A7| dw $0107 ; 0x4A
|02C8A9| dw $0108 ; 0x4B
|02C8AB| dw $0109 ; 0x4C
|02C8AD| dw $010A ; 0x4D
|02C8AF| dw $010B ; 0x4E
|02C8B1| dw $010C ; 0x4F
|02C8B3| dw $010C ; 0x50
|02C8B5| dw $011B ; 0x51
|02C8B7| dw $011B ; 0x52
|02C8B9| dw $011C ; 0x53
|02C8BB| dw $011C ; 0x54
|02C8BD| dw $011E ; 0x55
|02C8BF| dw $0120 ; 0x56
|02C8C1| dw $0110 ; 0x57
|02C8C3| dw $0112 ; 0x58
|02C8C5| dw $0111 ; 0x59
|02C8C7| dw $0112 ; 0x5A
|02C8C9| dw $0113 ; 0x5B
|02C8CB| dw $0114 ; 0x5C
|02C8CD| dw $0115 ; 0x5D
|02C8CF| dw $0115 ; 0x5E
|02C8D1| dw $010D ; 0x5F
|02C8D3| dw $010F ; 0x60
|02C8D5| dw $0119 ; 0x61
|02C8D7| dw $0114 ; 0x62
|02C8D9| dw $0116 ; 0x63
|02C8DB| dw $0121 ; 0x64
|02C8DD| dw $0122 ; 0x65
|02C8DF| dw $0122 ; 0x66
|02C8E1| dw $0118 ; 0x67
|02C8E3| dw $011A ; 0x68
|02C8E5| dw $010E ; 0x69
|02C8E7| dw $010E ; 0x6A
|02C8E9| dw $011F ; 0x6B
|02C8EB| dw $0123 ; 0x6C
|02C8ED| dw $0124 ; 0x6D
|02C8EF| dw $0124 ; 0x6E
|02C8F1| dw $0125 ; 0x6F
|02C8F3| dw $0125 ; 0x70
|02C8F5| dw $0126 ; 0x71
|02C8F7| dw $0126 ; 0x72
|02C8F9| dw $0080 ; 0x73
|02C8FB| dw $0051 ; 0x74
|02C8FD| dw $0030 ; 0x75
|02C8FF| dw $0058 ; 0x76
|02C901| dw $0067 ; 0x77
|02C903| dw $0068 ; 0x78
|02C905| dw $0056 ; 0x79
|02C907| dw $00E1 ; 0x7A
|02C909| dw $0000 ; 0x7B
|02C90B| dw $0018 ; 0x7C
|02C90D| dw $0055 ; 0x7D
|02C90F| dw $00E3 ; 0x7E
|02C911| dw $00E2 ; 0x7F
|02C913| dw $002F ; 0x80
|02C915| dw $0011 ; 0x81
|02C917| dw $0003 ; 0x82
|02C919| dw $0127 ; 0x83
|02C91B| dw $0120 ; 0x84

;---------------------------------------------------------------------------------------------------

.camera_scroll_boundaries
|02C91D| db $21, $20, $21, $21, $09, $09, $09, $0A ; 0x00
|02C925| db $21, $20, $21, $21, $09, $09, $09, $0A ; 0x01
|02C92D| db $03, $02, $03, $03, $04, $04, $04, $05 ; 0x02
|02C935| db $0D, $0C, $0D, $0D, $01, $00, $01, $01 ; 0x03
|02C93D| db $0D, $0C, $0D, $0D, $02, $02, $02, $03 ; 0x04
|02C945| db $0D, $0C, $0D, $0D, $04, $04, $04, $05 ; 0x05
|02C94D| db $1F, $1E, $1F, $1F, $00, $00, $00, $01 ; 0x06
|02C955| db $1F, $1E, $1F, $1F, $03, $02, $03, $03 ; 0x07
|02C95D| db $19, $18, $19, $19, $12, $12, $12, $13 ; 0x08
|02C965| db $11, $10, $11, $11, $08, $08, $08, $09 ; 0x09
|02C96D| db $11, $10, $11, $11, $0B, $0A, $0B, $0B ; 0x0A
|02C975| db $11, $10, $11, $11, $06, $06, $06, $07 ; 0x0B
|02C97D| db $0D, $0C, $0D, $0D, $06, $06, $06, $07 ; 0x0C
|02C985| db $1F, $1E, $1F, $1F, $05, $05, $05, $06 ; 0x0D
|02C98D| db $1F, $1E, $1F, $1F, $06, $06, $06, $07 ; 0x0E
|02C995| db $1F, $1E, $1F, $1F, $09, $09, $09, $0A ; 0x0F
|02C99D| db $1F, $1E, $1F, $1F, $0A, $0A, $0A, $0B ; 0x10
|02C9A5| db $1D, $1C, $1D, $1D, $06, $06, $06, $07 ; 0x11
|02C9AD| db $1D, $1C, $1D, $1D, $05, $04, $05, $05 ; 0x12
|02C9B5| db $1F, $1E, $1F, $1F, $10, $10, $10, $11 ; 0x13
|02C9BD| db $1D, $1C, $1D, $1D, $11, $10, $11, $11 ; 0x14
|02C9C5| db $05, $04, $05, $05, $07, $06, $07, $07 ; 0x15
|02C9CD| db $1F, $1E, $1F, $1F, $16, $16, $16, $17 ; 0x16
|02C9D5| db $1D, $1C, $1D, $1D, $17, $16, $17, $17 ; 0x17
|02C9DD| db $1B, $1A, $1B, $1B, $0A, $0A, $0A, $0B ; 0x18
|02C9E5| db $05, $04, $05, $05, $09, $08, $09, $09 ; 0x19
|02C9ED| db $1F, $1E, $1F, $1F, $1A, $1A, $1A, $1B ; 0x1A
|02C9F5| db $1D, $1C, $1D, $1D, $1A, $1A, $1A, $1B ; 0x1B
|02C9FD| db $1F, $1E, $1F, $1F, $1D, $1D, $1D, $1E ; 0x1C
|02CA05| db $1D, $1C, $1D, $1D, $1D, $1C, $1D, $1D ; 0x1D
|02CA0D| db $1F, $1E, $1F, $1F, $1F, $1E, $1F, $1F ; 0x1E
|02CA15| db $1D, $1C, $1D, $1D, $1E, $1E, $1E, $1F ; 0x1F
|02CA1D| db $1B, $1A, $1B, $1B, $1E, $1E, $1E, $1F ; 0x20
|02CA25| db $1F, $1E, $1F, $1F, $12, $12, $12, $13 ; 0x21
|02CA2D| db $1F, $1E, $1F, $1F, $14, $14, $14, $15 ; 0x22
|02CA35| db $1D, $1C, $1D, $1D, $14, $14, $14, $15 ; 0x23
|02CA3D| db $1D, $1C, $1D, $1D, $00, $00, $00, $01 ; 0x24
|02CA45| db $05, $04, $05, $05, $10, $10, $10, $11 ; 0x25
|02CA4D| db $09, $08, $09, $09, $14, $14, $14, $15 ; 0x26
|02CA55| db $13, $12, $13, $13, $10, $10, $10, $11 ; 0x27
|02CA5D| db $0B, $0A, $0B, $0B, $0C, $0C, $0C, $0D ; 0x28
|02CA65| db $0B, $0A, $0B, $0B, $0E, $0E, $0E, $0F ; 0x29
|02CA6D| db $0B, $0A, $0B, $0B, $10, $10, $10, $11 ; 0x2A
|02CA75| db $0B, $0A, $0B, $0B, $12, $12, $12, $13 ; 0x2B
|02CA7D| db $1D, $1C, $1D, $1D, $02, $02, $02, $03 ; 0x2C
|02CA85| db $01, $00, $01, $01, $1D, $1C, $1D, $1D ; 0x2D
|02CA8D| db $1D, $1C, $1D, $1D, $0C, $0C, $0C, $0D ; 0x2E
|02CA95| db $1D, $1C, $1D, $1D, $0F, $0E, $0F, $0F ; 0x2F
|02CA9D| db $1D, $1C, $1D, $1D, $08, $08, $08, $09 ; 0x30
|02CAA5| db $1D, $1C, $1D, $1D, $0A, $0A, $0A, $0B ; 0x31
|02CAAD| db $0B, $0A, $0B, $0B, $0A, $0A, $0A, $0B ; 0x32
|02CAB5| db $0F, $0E, $0F, $0F, $0E, $0E, $0E, $0F ; 0x33
|02CABD| db $1B, $1A, $1B, $1B, $16, $16, $16, $17 ; 0x34
|02CAC5| db $1B, $1A, $1B, $1B, $0D, $0C, $0D, $0D ; 0x35
|02CACD| db $03, $02, $03, $03, $00, $00, $00, $01 ; 0x36
|02CAD5| db $01, $00, $01, $01, $18, $18, $18, $19 ; 0x37
|02CADD| db $01, $00, $01, $01, $11, $10, $11, $11 ; 0x38
|02CAE5| db $05, $04, $05, $05, $1F, $1E, $1F, $1F ; 0x39
|02CAED| db $07, $06, $07, $07, $19, $18, $19, $19 ; 0x3A
|02CAF5| db $05, $04, $05, $05, $18, $18, $18, $19 ; 0x3B
|02CAFD| db $21, $20, $21, $21, $00, $00, $00, $01 ; 0x3C
|02CB05| db $23, $22, $23, $23, $1D, $1D, $1D, $1E ; 0x3D
|02CB0D| db $21, $20, $21, $21, $02, $02, $02, $03 ; 0x3E
|02CB15| db $21, $20, $21, $21, $03, $03, $03, $04 ; 0x3F
|02CB1D| db $21, $20, $21, $21, $04, $04, $04, $05 ; 0x40
|02CB25| db $23, $22, $23, $23, $0F, $0E, $0F, $0F ; 0x41
|02CB2D| db $21, $20, $21, $21, $06, $06, $06, $07 ; 0x42
|02CB35| db $21, $20, $21, $21, $06, $06, $06, $07 ; 0x43
|02CB3D| db $21, $20, $21, $21, $07, $07, $07, $08 ; 0x44
|02CB45| db $21, $20, $21, $21, $0A, $0A, $0A, $0B ; 0x45
|02CB4D| db $23, $22, $23, $23, $1F, $1F, $1F, $20 ; 0x46
|02CB55| db $21, $20, $21, $21, $0C, $0C, $0C, $0D ; 0x47
|02CB5D| db $21, $20, $21, $21, $0D, $0D, $0D, $0E ; 0x48
|02CB65| db $21, $20, $21, $21, $0E, $0E, $0E, $0F ; 0x49
|02CB6D| db $21, $20, $21, $21, $0F, $0F, $0F, $10 ; 0x4A
|02CB75| db $21, $20, $21, $21, $10, $10, $10, $11 ; 0x4B
|02CB7D| db $21, $20, $21, $21, $12, $12, $12, $13 ; 0x4C
|02CB85| db $21, $20, $21, $21, $14, $14, $14, $15 ; 0x4D
|02CB8D| db $21, $20, $21, $21, $16, $16, $16, $17 ; 0x4E
|02CB95| db $21, $20, $21, $21, $18, $18, $18, $19 ; 0x4F
|02CB9D| db $21, $20, $21, $21, $19, $19, $19, $1A ; 0x50
|02CBA5| db $23, $22, $23, $23, $16, $16, $16, $17 ; 0x51
|02CBAD| db $23, $22, $23, $23, $17, $17, $17, $18 ; 0x52
|02CBB5| db $23, $22, $23, $23, $18, $18, $18, $19 ; 0x53
|02CBBD| db $23, $22, $23, $23, $19, $19, $19, $19 ; 0x54
|02CBC5| db $23, $22, $23, $23, $1C, $1C, $1C, $1D ; 0x55
|02CBCD| db $25, $24, $25, $25, $01, $00, $01, $01 ; 0x56
|02CBD5| db $23, $22, $23, $23, $00, $00, $00, $01 ; 0x57
|02CBDD| db $23, $22, $23, $23, $05, $05, $05, $06 ; 0x58
|02CBE5| db $23, $22, $23, $23, $02, $02, $02, $03 ; 0x59
|02CBED| db $23, $22, $23, $23, $04, $04, $04, $05 ; 0x5A
|02CBF5| db $23, $22, $23, $23, $06, $06, $06, $07 ; 0x5B
|02CBFD| db $23, $22, $23, $23, $08, $08, $08, $09 ; 0x5C
|02CC05| db $23, $22, $23, $23, $0A, $0A, $0A, $0B ; 0x5D
|02CC0D| db $23, $22, $23, $23, $0B, $0B, $0B, $0C ; 0x5E
|02CC15| db $21, $20, $21, $21, $1A, $1A, $1A, $1B ; 0x5F
|02CC1D| db $21, $20, $21, $21, $1E, $1E, $1E, $1F ; 0x60
|02CC25| db $23, $22, $23, $23, $12, $12, $12, $13 ; 0x61
|02CC2D| db $23, $22, $23, $23, $09, $09, $09, $0A ; 0x62
|02CC35| db $23, $22, $23, $23, $0D, $0D, $0D, $0E ; 0x63
|02CC3D| db $25, $24, $25, $25, $02, $02, $02, $03 ; 0x64
|02CC45| db $25, $24, $25, $25, $04, $04, $04, $05 ; 0x65
|02CC4D| db $25, $24, $25, $25, $05, $05, $05, $06 ; 0x66
|02CC55| db $23, $22, $23, $23, $11, $11, $11, $12 ; 0x67
|02CC5D| db $23, $22, $23, $23, $15, $15, $15, $16 ; 0x68
|02CC65| db $21, $20, $21, $21, $1C, $1C, $1C, $1D ; 0x69
|02CC6D| db $21, $20, $21, $21, $1D, $1D, $1D, $1E ; 0x6A
|02CC75| db $23, $22, $23, $23, $1E, $1E, $1E, $1F ; 0x6B
|02CC7D| db $25, $24, $25, $25, $06, $06, $06, $07 ; 0x6C
|02CC85| db $25, $24, $25, $25, $08, $08, $08, $09 ; 0x6D
|02CC8D| db $25, $24, $25, $25, $09, $09, $09, $0A ; 0x6E
|02CC95| db $25, $24, $25, $25, $0A, $0A, $0A, $0B ; 0x6F
|02CC9D| db $25, $24, $25, $25, $0B, $0B, $0B, $0C ; 0x70
|02CCA5| db $25, $24, $25, $25, $0C, $0C, $0C, $0D ; 0x71
|02CCAD| db $25, $24, $25, $25, $0D, $0D, $0D, $0E ; 0x72
|02CCB5| db $10, $10, $10, $11, $01, $00, $01, $01 ; 0x73
|02CCBD| db $0B, $0A, $0B, $0B, $02, $02, $02, $03 ; 0x74
|02CCC5| db $06, $06, $06, $07, $00, $00, $00, $01 ; 0x75
|02CCCD| db $0A, $0A, $0A, $0B, $11, $10, $11, $11 ; 0x76
|02CCD5| db $0C, $0C, $0C, $0D, $0E, $0E, $0E, $0F ; 0x77
|02CCDD| db $0C, $0C, $0C, $0D, $11, $10, $11, $11 ; 0x78
|02CCE5| db $0A, $0A, $0A, $0B, $0D, $0C, $0D, $0D ; 0x79
|02CCED| db $1C, $1C, $1C, $1D, $03, $02, $03, $03 ; 0x7A
|02CCF5| db $00, $00, $00, $01, $01, $00, $01, $01 ; 0x7B
|02CCFD| db $03, $02, $03, $03, $10, $10, $10, $11 ; 0x7C
|02CD05| db $0A, $0A, $0A, $0B, $0B, $0A, $0B, $0B ; 0x7D
|02CD0D| db $1D, $1C, $1D, $1D, $07, $06, $07, $07 ; 0x7E
|02CD15| db $1D, $1C, $1D, $1D, $04, $04, $04, $05 ; 0x7F
|02CD1D| db $05, $04, $05, $05, $1E, $1E, $1E, $1F ; 0x80
|02CD25| db $03, $02, $03, $03, $03, $02, $03, $03 ; 0x81
|02CD2D| db $01, $00, $01, $01, $06, $06, $06, $07 ; 0x82
|02CD35| db $25, $24, $25, $25, $0E, $0E, $0E, $0F ; 0x83
|02CD3D| db $25, $24, $25, $25, $00, $00, $00, $01 ; 0x84

;---------------------------------------------------------------------------------------------------

.horizontal_scroll
|02CD45| dw $0900 ; 0x00
|02CD47| dw $0900 ; 0x01
|02CD49| dw $0480 ; 0x02
|02CD4B| dw $0100 ; 0x03
|02CD4D| dw $0280 ; 0x04
|02CD4F| dw $0400 ; 0x05
|02CD51| dw $0000 ; 0x06
|02CD53| dw $0300 ; 0x07
|02CD55| dw $1280 ; 0x08
|02CD57| dw $0880 ; 0x09
|02CD59| dw $0B00 ; 0x0A
|02CD5B| dw $0600 ; 0x0B
|02CD5D| dw $0600 ; 0x0C
|02CD5F| dw $0500 ; 0x0D
|02CD61| dw $0600 ; 0x0E
|02CD63| dw $0900 ; 0x0F
|02CD65| dw $0A00 ; 0x10
|02CD67| dw $0600 ; 0x11
|02CD69| dw $0500 ; 0x12
|02CD6B| dw $1080 ; 0x13
|02CD6D| dw $1100 ; 0x14
|02CD6F| dw $0700 ; 0x15
|02CD71| dw $1680 ; 0x16
|02CD73| dw $1700 ; 0x17
|02CD75| dw $0A00 ; 0x18
|02CD77| dw $0900 ; 0x19
|02CD79| dw $1A80 ; 0x1A
|02CD7B| dw $1B00 ; 0x1B
|02CD7D| dw $1D00 ; 0x1C
|02CD7F| dw $1D00 ; 0x1D
|02CD81| dw $1F00 ; 0x1E
|02CD83| dw $1E80 ; 0x1F
|02CD85| dw $1E80 ; 0x20
|02CD87| dw $1200 ; 0x21
|02CD89| dw $1400 ; 0x22
|02CD8B| dw $1400 ; 0x23
|02CD8D| dw $0000 ; 0x24
|02CD8F| dw $1080 ; 0x25
|02CD91| dw $1480 ; 0x26
|02CD93| dw $1000 ; 0x27
|02CD95| dw $0C00 ; 0x28
|02CD97| dw $0E00 ; 0x29
|02CD99| dw $1000 ; 0x2A
|02CD9B| dw $1200 ; 0x2B
|02CD9D| dw $0200 ; 0x2C
|02CD9F| dw $1D00 ; 0x2D
|02CDA1| dw $0C00 ; 0x2E
|02CDA3| dw $0F00 ; 0x2F
|02CDA5| dw $0800 ; 0x30
|02CDA7| dw $0A80 ; 0x31
|02CDA9| dw $0A00 ; 0x32
|02CDAB| dw $0E80 ; 0x33
|02CDAD| dw $1680 ; 0x34
|02CDAF| dw $0D00 ; 0x35
|02CDB1| dw $0000 ; 0x36
|02CDB3| dw $1880 ; 0x37
|02CDB5| dw $1100 ; 0x38
|02CDB7| dw $1F00 ; 0x39
|02CDB9| dw $1900 ; 0x3A
|02CDBB| dw $1800 ; 0x3B
|02CDBD| dw $0000 ; 0x3C
|02CDBF| dw $1D00 ; 0x3D
|02CDC1| dw $0200 ; 0x3E
|02CDC3| dw $0300 ; 0x3F
|02CDC5| dw $0400 ; 0x40
|02CDC7| dw $0F00 ; 0x41
|02CDC9| dw $0600 ; 0x42
|02CDCB| dw $0600 ; 0x43
|02CDCD| dw $0700 ; 0x44
|02CDCF| dw $0A00 ; 0x45
|02CDD1| dw $1F00 ; 0x46
|02CDD3| dw $0C00 ; 0x47
|02CDD5| dw $0D00 ; 0x48
|02CDD7| dw $0E00 ; 0x49
|02CDD9| dw $0F00 ; 0x4A
|02CDDB| dw $1000 ; 0x4B
|02CDDD| dw $1200 ; 0x4C
|02CDDF| dw $1400 ; 0x4D
|02CDE1| dw $1680 ; 0x4E
|02CDE3| dw $1800 ; 0x4F
|02CDE5| dw $1900 ; 0x50
|02CDE7| dw $1600 ; 0x51
|02CDE9| dw $1700 ; 0x52
|02CDEB| dw $1800 ; 0x53
|02CDED| dw $1900 ; 0x54
|02CDEF| dw $1C00 ; 0x55
|02CDF1| dw $0100 ; 0x56
|02CDF3| dw $0000 ; 0x57
|02CDF5| dw $0500 ; 0x58
|02CDF7| dw $0200 ; 0x59
|02CDF9| dw $0400 ; 0x5A
|02CDFB| dw $0600 ; 0x5B
|02CDFD| dw $0800 ; 0x5C
|02CDFF| dw $0A00 ; 0x5D
|02CE01| dw $0B00 ; 0x5E
|02CE03| dw $1A00 ; 0x5F
|02CE05| dw $1E00 ; 0x60
|02CE07| dw $1280 ; 0x61
|02CE09| dw $0900 ; 0x62
|02CE0B| dw $0D00 ; 0x63
|02CE0D| dw $0200 ; 0x64
|02CE0F| dw $0400 ; 0x65
|02CE11| dw $0500 ; 0x66
|02CE13| dw $1100 ; 0x67
|02CE15| dw $1500 ; 0x68
|02CE17| dw $1C00 ; 0x69
|02CE19| dw $1D00 ; 0x6A
|02CE1B| dw $1E00 ; 0x6B
|02CE1D| dw $0600 ; 0x6C
|02CE1F| dw $0800 ; 0x6D
|02CE21| dw $0900 ; 0x6E
|02CE23| dw $0A00 ; 0x6F
|02CE25| dw $0B00 ; 0x70
|02CE27| dw $0C00 ; 0x71
|02CE29| dw $0D00 ; 0x72
|02CE2B| dw $0100 ; 0x73
|02CE2D| dw $0280 ; 0x74
|02CE2F| dw $0000 ; 0x75
|02CE31| dw $1100 ; 0x76
|02CE33| dw $0E00 ; 0x77
|02CE35| dw $1088 ; 0x78
|02CE37| dw $0D00 ; 0x79
|02CE39| dw $0300 ; 0x7A
|02CE3B| dw $0100 ; 0x7B
|02CE3D| dw $1000 ; 0x7C
|02CE3F| dw $0B00 ; 0x7D
|02CE41| dw $0700 ; 0x7E
|02CE43| dw $0400 ; 0x7F
|02CE45| dw $1E00 ; 0x80
|02CE47| dw $0300 ; 0x81
|02CE49| dw $0600 ; 0x82
|02CE4B| dw $0E00 ; 0x83
|02CE4D| dw $0000 ; 0x84

;---------------------------------------------------------------------------------------------------

.vertical_scroll
|02CE4F| dw $2110 ; 0x00
|02CE51| dw $2110 ; 0x01
|02CE53| dw $0310 ; 0x02
|02CE55| dw $0D10 ; 0x03
|02CE57| dw $0D10 ; 0x04
|02CE59| dw $0D10 ; 0x05
|02CE5B| dw $1F10 ; 0x06
|02CE5D| dw $1F10 ; 0x07
|02CE5F| dw $1910 ; 0x08
|02CE61| dw $1110 ; 0x09
|02CE63| dw $1110 ; 0x0A
|02CE65| dw $1110 ; 0x0B
|02CE67| dw $0D10 ; 0x0C
|02CE69| dw $1F10 ; 0x0D
|02CE6B| dw $1F10 ; 0x0E
|02CE6D| dw $1F10 ; 0x0F
|02CE6F| dw $1F10 ; 0x10
|02CE71| dw $1D10 ; 0x11
|02CE73| dw $1D10 ; 0x12
|02CE75| dw $1F10 ; 0x13
|02CE77| dw $1D10 ; 0x14
|02CE79| dw $0510 ; 0x15
|02CE7B| dw $1F10 ; 0x16
|02CE7D| dw $1D10 ; 0x17
|02CE7F| dw $1B10 ; 0x18
|02CE81| dw $0510 ; 0x19
|02CE83| dw $1F10 ; 0x1A
|02CE85| dw $1D10 ; 0x1B
|02CE87| dw $1F10 ; 0x1C
|02CE89| dw $1D10 ; 0x1D
|02CE8B| dw $1F10 ; 0x1E
|02CE8D| dw $1D10 ; 0x1F
|02CE8F| dw $1B10 ; 0x20
|02CE91| dw $1F10 ; 0x21
|02CE93| dw $1F10 ; 0x22
|02CE95| dw $1D10 ; 0x23
|02CE97| dw $1D10 ; 0x24
|02CE99| dw $0510 ; 0x25
|02CE9B| dw $0910 ; 0x26
|02CE9D| dw $1310 ; 0x27
|02CE9F| dw $0B10 ; 0x28
|02CEA1| dw $0B10 ; 0x29
|02CEA3| dw $0B10 ; 0x2A
|02CEA5| dw $0B10 ; 0x2B
|02CEA7| dw $1D10 ; 0x2C
|02CEA9| dw $0110 ; 0x2D
|02CEAB| dw $1D10 ; 0x2E
|02CEAD| dw $1D10 ; 0x2F
|02CEAF| dw $1D10 ; 0x30
|02CEB1| dw $1D10 ; 0x31
|02CEB3| dw $0B10 ; 0x32
|02CEB5| dw $0F10 ; 0x33
|02CEB7| dw $1B10 ; 0x34
|02CEB9| dw $1B10 ; 0x35
|02CEBB| dw $0310 ; 0x36
|02CEBD| dw $0110 ; 0x37
|02CEBF| dw $0110 ; 0x38
|02CEC1| dw $0510 ; 0x39
|02CEC3| dw $0710 ; 0x3A
|02CEC5| dw $0510 ; 0x3B
|02CEC7| dw $2110 ; 0x3C
|02CEC9| dw $2310 ; 0x3D
|02CECB| dw $2110 ; 0x3E
|02CECD| dw $2110 ; 0x3F
|02CECF| dw $2110 ; 0x40
|02CED1| dw $2310 ; 0x41
|02CED3| dw $2110 ; 0x42
|02CED5| dw $2000 ; 0x43
|02CED7| dw $2110 ; 0x44
|02CED9| dw $2110 ; 0x45
|02CEDB| dw $2310 ; 0x46
|02CEDD| dw $2110 ; 0x47
|02CEDF| dw $2110 ; 0x48
|02CEE1| dw $2110 ; 0x49
|02CEE3| dw $2110 ; 0x4A
|02CEE5| dw $2110 ; 0x4B
|02CEE7| dw $2110 ; 0x4C
|02CEE9| dw $2110 ; 0x4D
|02CEEB| dw $2110 ; 0x4E
|02CEED| dw $2110 ; 0x4F
|02CEEF| dw $2110 ; 0x50
|02CEF1| dw $2310 ; 0x51
|02CEF3| dw $2310 ; 0x52
|02CEF5| dw $2310 ; 0x53
|02CEF7| dw $2310 ; 0x54
|02CEF9| dw $2310 ; 0x55
|02CEFB| dw $2510 ; 0x56
|02CEFD| dw $2310 ; 0x57
|02CEFF| dw $2310 ; 0x58
|02CF01| dw $2310 ; 0x59
|02CF03| dw $2310 ; 0x5A
|02CF05| dw $2310 ; 0x5B
|02CF07| dw $2310 ; 0x5C
|02CF09| dw $2310 ; 0x5D
|02CF0B| dw $2310 ; 0x5E
|02CF0D| dw $2110 ; 0x5F
|02CF0F| dw $2110 ; 0x60
|02CF11| dw $2310 ; 0x61
|02CF13| dw $2310 ; 0x62
|02CF15| dw $2310 ; 0x63
|02CF17| dw $2510 ; 0x64
|02CF19| dw $2510 ; 0x65
|02CF1B| dw $2510 ; 0x66
|02CF1D| dw $2310 ; 0x67
|02CF1F| dw $2310 ; 0x68
|02CF21| dw $2110 ; 0x69
|02CF23| dw $2110 ; 0x6A
|02CF25| dw $2310 ; 0x6B
|02CF27| dw $2510 ; 0x6C
|02CF29| dw $2510 ; 0x6D
|02CF2B| dw $2510 ; 0x6E
|02CF2D| dw $2510 ; 0x6F
|02CF2F| dw $2510 ; 0x70
|02CF31| dw $2510 ; 0x71
|02CF33| dw $2510 ; 0x72
|02CF35| dw $1010 ; 0x73
|02CF37| dw $0B10 ; 0x74
|02CF39| dw $0610 ; 0x75
|02CF3B| dw $0A00 ; 0x76
|02CF3D| dw $0C00 ; 0x77
|02CF3F| dw $0C29 ; 0x78
|02CF41| dw $0A00 ; 0x79
|02CF43| dw $1C3D ; 0x7A
|02CF45| dw $0010 ; 0x7B
|02CF47| dw $02CE ; 0x7C
|02CF49| dw $0A10 ; 0x7D
|02CF4B| dw $1D10 ; 0x7E
|02CF4D| dw $1D10 ; 0x7F
|02CF4F| dw $0510 ; 0x80
|02CF51| dw $02AD ; 0x81
|02CF53| dw $0110 ; 0x82
|02CF55| dw $2510 ; 0x83
|02CF57| dw $2510 ; 0x84

;---------------------------------------------------------------------------------------------------

.y_coordinate
|02CF59| dw $2178 ; 0x00
|02CF5B| dw $21D8 ; 0x01
|02CF5D| dw $03C0 ; 0x02
|02CF5F| dw $0DD8 ; 0x03
|02CF61| dw $0DC0 ; 0x04
|02CF63| dw $0DD8 ; 0x05
|02CF65| dw $1FD8 ; 0x06
|02CF67| dw $1FC0 ; 0x07
|02CF69| dw $19D8 ; 0x08
|02CF6B| dw $11D8 ; 0x09
|02CF6D| dw $11D8 ; 0x0A
|02CF6F| dw $11D8 ; 0x0B
|02CF71| dw $0DD8 ; 0x0C
|02CF73| dw $1FD8 ; 0x0D
|02CF75| dw $1FD8 ; 0x0E
|02CF77| dw $1FD8 ; 0x0F
|02CF79| dw $1FD8 ; 0x10
|02CF7B| dw $1DD8 ; 0x11
|02CF7D| dw $1DD8 ; 0x12
|02CF7F| dw $1FD8 ; 0x13
|02CF81| dw $1DD8 ; 0x14
|02CF83| dw $05D8 ; 0x15
|02CF85| dw $1FD8 ; 0x16
|02CF87| dw $1DD8 ; 0x17
|02CF89| dw $1BD8 ; 0x18
|02CF8B| dw $05D8 ; 0x19
|02CF8D| dw $1FC0 ; 0x1A
|02CF8F| dw $1DD8 ; 0x1B
|02CF91| dw $1FC0 ; 0x1C
|02CF93| dw $1DD8 ; 0x1D
|02CF95| dw $1FD8 ; 0x1E
|02CF97| dw $1DD8 ; 0x1F
|02CF99| dw $1BD8 ; 0x20
|02CF9B| dw $1FD8 ; 0x21
|02CF9D| dw $1FC0 ; 0x22
|02CF9F| dw $1DD8 ; 0x23
|02CFA1| dw $1DD8 ; 0x24
|02CFA3| dw $05D8 ; 0x25
|02CFA5| dw $09D8 ; 0x26
|02CFA7| dw $13D8 ; 0x27
|02CFA9| dw $0BD8 ; 0x28
|02CFAB| dw $0BD8 ; 0x29
|02CFAD| dw $0BD8 ; 0x2A
|02CFAF| dw $0BD8 ; 0x2B
|02CFB1| dw $1DD8 ; 0x2C
|02CFB3| dw $01D8 ; 0x2D
|02CFB5| dw $1DC0 ; 0x2E
|02CFB7| dw $1DC0 ; 0x2F
|02CFB9| dw $1DC0 ; 0x30
|02CFBB| dw $1DD8 ; 0x31
|02CFBD| dw $0BD8 ; 0x32
|02CFBF| dw $0FC0 ; 0x33
|02CFC1| dw $1BD8 ; 0x34
|02CFC3| dw $1BD8 ; 0x35
|02CFC5| dw $03D8 ; 0x36
|02CFC7| dw $01D8 ; 0x37
|02CFC9| dw $01D8 ; 0x38
|02CFCB| dw $05D8 ; 0x39
|02CFCD| dw $07D8 ; 0x3A
|02CFCF| dw $05D8 ; 0x3B
|02CFD1| dw $21D8 ; 0x3C
|02CFD3| dw $23D8 ; 0x3D
|02CFD5| dw $21D8 ; 0x3E
|02CFD7| dw $21D8 ; 0x3F
|02CFD9| dw $21D8 ; 0x40
|02CFDB| dw $23D8 ; 0x41
|02CFDD| dw $21D8 ; 0x42
|02CFDF| dw $2020 ; 0x43
|02CFE1| dw $21D8 ; 0x44
|02CFE3| dw $21D8 ; 0x45
|02CFE5| dw $23D8 ; 0x46
|02CFE7| dw $21D8 ; 0x47
|02CFE9| dw $21D8 ; 0x48
|02CFEB| dw $21D8 ; 0x49
|02CFED| dw $21D8 ; 0x4A
|02CFEF| dw $21D8 ; 0x4B
|02CFF1| dw $21D8 ; 0x4C
|02CFF3| dw $21C0 ; 0x4D
|02CFF5| dw $21D8 ; 0x4E
|02CFF7| dw $21D8 ; 0x4F
|02CFF9| dw $21D8 ; 0x50
|02CFFB| dw $23C0 ; 0x51
|02CFFD| dw $23D8 ; 0x52
|02CFFF| dw $23D8 ; 0x53
|02D001| dw $23D8 ; 0x54
|02D003| dw $23D8 ; 0x55
|02D005| dw $25D8 ; 0x56
|02D007| dw $23D8 ; 0x57
|02D009| dw $23D8 ; 0x58
|02D00B| dw $23D8 ; 0x59
|02D00D| dw $23D8 ; 0x5A
|02D00F| dw $23D8 ; 0x5B
|02D011| dw $23D8 ; 0x5C
|02D013| dw $23D8 ; 0x5D
|02D015| dw $23D8 ; 0x5E
|02D017| dw $21D8 ; 0x5F
|02D019| dw $21D8 ; 0x60
|02D01B| dw $23D8 ; 0x61
|02D01D| dw $23D8 ; 0x62
|02D01F| dw $23D8 ; 0x63
|02D021| dw $25D8 ; 0x64
|02D023| dw $25D8 ; 0x65
|02D025| dw $25D8 ; 0x66
|02D027| dw $23D8 ; 0x67
|02D029| dw $23D8 ; 0x68
|02D02B| dw $21C0 ; 0x69
|02D02D| dw $21C0 ; 0x6A
|02D02F| dw $23D8 ; 0x6B
|02D031| dw $25D8 ; 0x6C
|02D033| dw $25D8 ; 0x6D
|02D035| dw $25D8 ; 0x6E
|02D037| dw $25D8 ; 0x6F
|02D039| dw $25D8 ; 0x70
|02D03B| dw $25D8 ; 0x71
|02D03D| dw $25D8 ; 0x72
|02D03F| dw $1080 ; 0x73
|02D041| dw $0BA8 ; 0x74
|02D043| dw $0698 ; 0x75
|02D045| dw $0A69 ; 0x76
|02D047| dw $0C68 ; 0x77
|02D049| dw $0C96 ; 0x78
|02D04B| dw $0A68 ; 0x79
|02D04D| dw $1CA9 ; 0x7A
|02D04F| dw $0089 ; 0x7B
|02D051| dw $033B ; 0x7C
|02D053| dw $0A96 ; 0x7D
|02D055| dw $1D7D ; 0x7E
|02D057| dw $1D89 ; 0x7F
|02D059| dw $0589 ; 0x80
|02D05B| dw $031A ; 0x81
|02D05D| dw $0197 ; 0x82
|02D05F| dw $25D8 ; 0x83
|02D061| dw $25D8 ; 0x84

;---------------------------------------------------------------------------------------------------

.x_coordinate
|02D063| dw $0978 ; 0x00
|02D065| dw $0978 ; 0x01
|02D067| dw $04F8 ; 0x02
|02D069| dw $0178 ; 0x03
|02D06B| dw $02F8 ; 0x04
|02D06D| dw $0478 ; 0x05
|02D06F| dw $0078 ; 0x06
|02D071| dw $0378 ; 0x07
|02D073| dw $12F8 ; 0x08
|02D075| dw $08F8 ; 0x09
|02D077| dw $0B78 ; 0x0A
|02D079| dw $0678 ; 0x0B
|02D07B| dw $0678 ; 0x0C
|02D07D| dw $0578 ; 0x0D
|02D07F| dw $0678 ; 0x0E
|02D081| dw $0978 ; 0x0F
|02D083| dw $0A78 ; 0x10
|02D085| dw $0678 ; 0x11
|02D087| dw $0578 ; 0x12
|02D089| dw $10F8 ; 0x13
|02D08B| dw $1178 ; 0x14
|02D08D| dw $0778 ; 0x15
|02D08F| dw $16F8 ; 0x16
|02D091| dw $1778 ; 0x17
|02D093| dw $0A78 ; 0x18
|02D095| dw $0978 ; 0x19
|02D097| dw $1AF8 ; 0x1A
|02D099| dw $1B78 ; 0x1B
|02D09B| dw $1D78 ; 0x1C
|02D09D| dw $1D78 ; 0x1D
|02D09F| dw $1F78 ; 0x1E
|02D0A1| dw $1EF8 ; 0x1F
|02D0A3| dw $1EF8 ; 0x20
|02D0A5| dw $1278 ; 0x21
|02D0A7| dw $1478 ; 0x22
|02D0A9| dw $1478 ; 0x23
|02D0AB| dw $0078 ; 0x24
|02D0AD| dw $10F8 ; 0x25
|02D0AF| dw $14F8 ; 0x26
|02D0B1| dw $1078 ; 0x27
|02D0B3| dw $0C78 ; 0x28
|02D0B5| dw $0E78 ; 0x29
|02D0B7| dw $1078 ; 0x2A
|02D0B9| dw $1278 ; 0x2B
|02D0BB| dw $0278 ; 0x2C
|02D0BD| dw $1D78 ; 0x2D
|02D0BF| dw $0C78 ; 0x2E
|02D0C1| dw $0F78 ; 0x2F
|02D0C3| dw $0878 ; 0x30
|02D0C5| dw $0AF8 ; 0x31
|02D0C7| dw $0A78 ; 0x32
|02D0C9| dw $0EF8 ; 0x33
|02D0CB| dw $16F8 ; 0x34
|02D0CD| dw $0D78 ; 0x35
|02D0CF| dw $0078 ; 0x36
|02D0D1| dw $18F8 ; 0x37
|02D0D3| dw $1178 ; 0x38
|02D0D5| dw $1F78 ; 0x39
|02D0D7| dw $1978 ; 0x3A
|02D0D9| dw $1878 ; 0x3B
|02D0DB| dw $0078 ; 0x3C
|02D0DD| dw $1D78 ; 0x3D
|02D0DF| dw $0278 ; 0x3E
|02D0E1| dw $0378 ; 0x3F
|02D0E3| dw $0478 ; 0x40
|02D0E5| dw $0F78 ; 0x41
|02D0E7| dw $0678 ; 0x42
|02D0E9| dw $0678 ; 0x43
|02D0EB| dw $0778 ; 0x44
|02D0ED| dw $0A78 ; 0x45
|02D0EF| dw $1F78 ; 0x46
|02D0F1| dw $0C78 ; 0x47
|02D0F3| dw $0D78 ; 0x48
|02D0F5| dw $0E78 ; 0x49
|02D0F7| dw $0F78 ; 0x4A
|02D0F9| dw $1078 ; 0x4B
|02D0FB| dw $1278 ; 0x4C
|02D0FD| dw $1478 ; 0x4D
|02D0FF| dw $16F8 ; 0x4E
|02D101| dw $1878 ; 0x4F
|02D103| dw $1978 ; 0x50
|02D105| dw $1678 ; 0x51
|02D107| dw $1778 ; 0x52
|02D109| dw $1878 ; 0x53
|02D10B| dw $1978 ; 0x54
|02D10D| dw $1C78 ; 0x55
|02D10F| dw $0178 ; 0x56
|02D111| dw $0078 ; 0x57
|02D113| dw $0578 ; 0x58
|02D115| dw $0278 ; 0x59
|02D117| dw $0478 ; 0x5A
|02D119| dw $0678 ; 0x5B
|02D11B| dw $0878 ; 0x5C
|02D11D| dw $0A78 ; 0x5D
|02D11F| dw $0B78 ; 0x5E
|02D121| dw $1A78 ; 0x5F
|02D123| dw $1E78 ; 0x60
|02D125| dw $12F8 ; 0x61
|02D127| dw $0978 ; 0x62
|02D129| dw $0D78 ; 0x63
|02D12B| dw $0278 ; 0x64
|02D12D| dw $0478 ; 0x65
|02D12F| dw $0578 ; 0x66
|02D131| dw $1178 ; 0x67
|02D133| dw $1578 ; 0x68
|02D135| dw $1C78 ; 0x69
|02D137| dw $1D78 ; 0x6A
|02D139| dw $1E78 ; 0x6B
|02D13B| dw $0678 ; 0x6C
|02D13D| dw $0878 ; 0x6D
|02D13F| dw $0978 ; 0x6E
|02D141| dw $0A78 ; 0x6F
|02D143| dw $0B78 ; 0x70
|02D145| dw $0C78 ; 0x71
|02D147| dw $0D78 ; 0x72
|02D149| dw $01A8 ; 0x73
|02D14B| dw $02F8 ; 0x74
|02D14D| dw $0078 ; 0x75
|02D14F| dw $1190 ; 0x76
|02D151| dw $0E80 ; 0x77
|02D153| dw $1100 ; 0x78
|02D155| dw $0D40 ; 0x79
|02D157| dw $0370 ; 0x7A
|02D159| dw $017F ; 0x7B
|02D15B| dw $1073 ; 0x7C
|02D15D| dw $0B9F ; 0x7D
|02D15F| dw $0778 ; 0x7E
|02D161| dw $047F ; 0x7F
|02D163| dw $1E61 ; 0x80
|02D165| dw $0393 ; 0x81
|02D167| dw $0677 ; 0x82
|02D169| dw $0E78 ; 0x83
|02D16B| dw $0078 ; 0x84

;---------------------------------------------------------------------------------------------------

.camera_trigger_y
|02D16D| dw $0187 ; 0x00
|02D16F| dw $0187 ; 0x01
|02D171| dw $0187 ; 0x02
|02D173| dw $0187 ; 0x03
|02D175| dw $0187 ; 0x04
|02D177| dw $0187 ; 0x05
|02D179| dw $0187 ; 0x06
|02D17B| dw $0187 ; 0x07
|02D17D| dw $0187 ; 0x08
|02D17F| dw $0187 ; 0x09
|02D181| dw $0187 ; 0x0A
|02D183| dw $0187 ; 0x0B
|02D185| dw $0187 ; 0x0C
|02D187| dw $0187 ; 0x0D
|02D189| dw $0187 ; 0x0E
|02D18B| dw $0187 ; 0x0F
|02D18D| dw $0187 ; 0x10
|02D18F| dw $0187 ; 0x11
|02D191| dw $0187 ; 0x12
|02D193| dw $0187 ; 0x13
|02D195| dw $0187 ; 0x14
|02D197| dw $0187 ; 0x15
|02D199| dw $0187 ; 0x16
|02D19B| dw $0187 ; 0x17
|02D19D| dw $0187 ; 0x18
|02D19F| dw $0187 ; 0x19
|02D1A1| dw $0187 ; 0x1A
|02D1A3| dw $0187 ; 0x1B
|02D1A5| dw $0187 ; 0x1C
|02D1A7| dw $0187 ; 0x1D
|02D1A9| dw $0187 ; 0x1E
|02D1AB| dw $0187 ; 0x1F
|02D1AD| dw $0187 ; 0x20
|02D1AF| dw $0187 ; 0x21
|02D1B1| dw $0187 ; 0x22
|02D1B3| dw $0187 ; 0x23
|02D1B5| dw $0187 ; 0x24
|02D1B7| dw $0187 ; 0x25
|02D1B9| dw $0187 ; 0x26
|02D1BB| dw $0187 ; 0x27
|02D1BD| dw $0187 ; 0x28
|02D1BF| dw $0187 ; 0x29
|02D1C1| dw $0187 ; 0x2A
|02D1C3| dw $0187 ; 0x2B
|02D1C5| dw $0187 ; 0x2C
|02D1C7| dw $0187 ; 0x2D
|02D1C9| dw $0187 ; 0x2E
|02D1CB| dw $0187 ; 0x2F
|02D1CD| dw $0187 ; 0x30
|02D1CF| dw $0187 ; 0x31
|02D1D1| dw $0187 ; 0x32
|02D1D3| dw $0187 ; 0x33
|02D1D5| dw $0187 ; 0x34
|02D1D7| dw $0187 ; 0x35
|02D1D9| dw $0187 ; 0x36
|02D1DB| dw $0187 ; 0x37
|02D1DD| dw $0187 ; 0x38
|02D1DF| dw $0187 ; 0x39
|02D1E1| dw $0187 ; 0x3A
|02D1E3| dw $0187 ; 0x3B
|02D1E5| dw $0187 ; 0x3C
|02D1E7| dw $0187 ; 0x3D
|02D1E9| dw $0187 ; 0x3E
|02D1EB| dw $0187 ; 0x3F
|02D1ED| dw $0187 ; 0x40
|02D1EF| dw $0187 ; 0x41
|02D1F1| dw $0187 ; 0x42
|02D1F3| dw $0074 ; 0x43
|02D1F5| dw $0187 ; 0x44
|02D1F7| dw $0187 ; 0x45
|02D1F9| dw $0187 ; 0x46
|02D1FB| dw $0187 ; 0x47
|02D1FD| dw $0187 ; 0x48
|02D1FF| dw $0187 ; 0x49
|02D201| dw $0187 ; 0x4A
|02D203| dw $0187 ; 0x4B
|02D205| dw $0187 ; 0x4C
|02D207| dw $0187 ; 0x4D
|02D209| dw $0187 ; 0x4E
|02D20B| dw $0187 ; 0x4F
|02D20D| dw $0187 ; 0x50
|02D20F| dw $0187 ; 0x51
|02D211| dw $0187 ; 0x52
|02D213| dw $0187 ; 0x53
|02D215| dw $0187 ; 0x54
|02D217| dw $0187 ; 0x55
|02D219| dw $0187 ; 0x56
|02D21B| dw $0187 ; 0x57
|02D21D| dw $0187 ; 0x58
|02D21F| dw $0187 ; 0x59
|02D221| dw $0187 ; 0x5A
|02D223| dw $0187 ; 0x5B
|02D225| dw $0187 ; 0x5C
|02D227| dw $0187 ; 0x5D
|02D229| dw $0187 ; 0x5E
|02D22B| dw $0187 ; 0x5F
|02D22D| dw $0187 ; 0x60
|02D22F| dw $0187 ; 0x61
|02D231| dw $0187 ; 0x62
|02D233| dw $0187 ; 0x63
|02D235| dw $0187 ; 0x64
|02D237| dw $0187 ; 0x65
|02D239| dw $0187 ; 0x66
|02D23B| dw $0187 ; 0x67
|02D23D| dw $0187 ; 0x68
|02D23F| dw $0187 ; 0x69
|02D241| dw $0187 ; 0x6A
|02D243| dw $0187 ; 0x6B
|02D245| dw $0187 ; 0x6C
|02D247| dw $0187 ; 0x6D
|02D249| dw $0187 ; 0x6E
|02D24B| dw $0187 ; 0x6F
|02D24D| dw $0187 ; 0x70
|02D24F| dw $0187 ; 0x71
|02D251| dw $0187 ; 0x72
|02D253| dw $0088 ; 0x73
|02D255| dw $0188 ; 0x74
|02D257| dw $0088 ; 0x75
|02D259| dw $0077 ; 0x76
|02D25B| dw $0078 ; 0x77
|02D25D| dw $00A1 ; 0x78
|02D25F| dw $0077 ; 0x79
|02D261| dw $00B4 ; 0x7A
|02D263| dw $0088 ; 0x7B
|02D265| dw $0146 ; 0x7C
|02D267| dw $0088 ; 0x7D
|02D269| dw $0188 ; 0x7E
|02D26B| dw $0187 ; 0x7F
|02D26D| dw $0187 ; 0x80
|02D26F| dw $0125 ; 0x81
|02D271| dw $0188 ; 0x82
|02D273| dw $0187 ; 0x83
|02D275| dw $0187 ; 0x84

;---------------------------------------------------------------------------------------------------

.camera_trigger_x
|02D277| dw $017F ; 0x00
|02D279| dw $017F ; 0x01
|02D27B| dw $00FF ; 0x02
|02D27D| dw $017F ; 0x03
|02D27F| dw $00FF ; 0x04
|02D281| dw $007F ; 0x05
|02D283| dw $007F ; 0x06
|02D285| dw $017F ; 0x07
|02D287| dw $00FF ; 0x08
|02D289| dw $00FF ; 0x09
|02D28B| dw $017F ; 0x0A
|02D28D| dw $007F ; 0x0B
|02D28F| dw $007F ; 0x0C
|02D291| dw $017F ; 0x0D
|02D293| dw $007F ; 0x0E
|02D295| dw $017F ; 0x0F
|02D297| dw $007F ; 0x10
|02D299| dw $007F ; 0x11
|02D29B| dw $017F ; 0x12
|02D29D| dw $00FF ; 0x13
|02D29F| dw $017F ; 0x14
|02D2A1| dw $017F ; 0x15
|02D2A3| dw $00FF ; 0x16
|02D2A5| dw $017F ; 0x17
|02D2A7| dw $007F ; 0x18
|02D2A9| dw $017F ; 0x19
|02D2AB| dw $00FF ; 0x1A
|02D2AD| dw $017F ; 0x1B
|02D2AF| dw $017F ; 0x1C
|02D2B1| dw $017F ; 0x1D
|02D2B3| dw $017F ; 0x1E
|02D2B5| dw $00FF ; 0x1F
|02D2B7| dw $00FF ; 0x20
|02D2B9| dw $007F ; 0x21
|02D2BB| dw $007F ; 0x22
|02D2BD| dw $007F ; 0x23
|02D2BF| dw $007F ; 0x24
|02D2C1| dw $00FF ; 0x25
|02D2C3| dw $00FF ; 0x26
|02D2C5| dw $007F ; 0x27
|02D2C7| dw $007F ; 0x28
|02D2C9| dw $007F ; 0x29
|02D2CB| dw $007F ; 0x2A
|02D2CD| dw $007F ; 0x2B
|02D2CF| dw $007F ; 0x2C
|02D2D1| dw $017F ; 0x2D
|02D2D3| dw $007F ; 0x2E
|02D2D5| dw $017F ; 0x2F
|02D2D7| dw $007F ; 0x30
|02D2D9| dw $00FF ; 0x31
|02D2DB| dw $007F ; 0x32
|02D2DD| dw $00FF ; 0x33
|02D2DF| dw $00FF ; 0x34
|02D2E1| dw $017F ; 0x35
|02D2E3| dw $007F ; 0x36
|02D2E5| dw $00FF ; 0x37
|02D2E7| dw $017F ; 0x38
|02D2E9| dw $017F ; 0x39
|02D2EB| dw $017F ; 0x3A
|02D2ED| dw $007F ; 0x3B
|02D2EF| dw $007F ; 0x3C
|02D2F1| dw $017F ; 0x3D
|02D2F3| dw $007F ; 0x3E
|02D2F5| dw $017F ; 0x3F
|02D2F7| dw $007F ; 0x40
|02D2F9| dw $017F ; 0x41
|02D2FB| dw $007F ; 0x42
|02D2FD| dw $007F ; 0x43
|02D2FF| dw $017F ; 0x44
|02D301| dw $007F ; 0x45
|02D303| dw $017F ; 0x46
|02D305| dw $007F ; 0x47
|02D307| dw $017F ; 0x48
|02D309| dw $007F ; 0x49
|02D30B| dw $017F ; 0x4A
|02D30D| dw $007F ; 0x4B
|02D30F| dw $007F ; 0x4C
|02D311| dw $007F ; 0x4D
|02D313| dw $00FF ; 0x4E
|02D315| dw $007F ; 0x4F
|02D317| dw $017F ; 0x50
|02D319| dw $007F ; 0x51
|02D31B| dw $017F ; 0x52
|02D31D| dw $007F ; 0x53
|02D31F| dw $017F ; 0x54
|02D321| dw $007F ; 0x55
|02D323| dw $017F ; 0x56
|02D325| dw $007F ; 0x57
|02D327| dw $017F ; 0x58
|02D329| dw $007F ; 0x59
|02D32B| dw $007F ; 0x5A
|02D32D| dw $007F ; 0x5B
|02D32F| dw $007F ; 0x5C
|02D331| dw $007F ; 0x5D
|02D333| dw $017F ; 0x5E
|02D335| dw $007F ; 0x5F
|02D337| dw $007F ; 0x60
|02D339| dw $00FF ; 0x61
|02D33B| dw $017F ; 0x62
|02D33D| dw $017F ; 0x63
|02D33F| dw $007F ; 0x64
|02D341| dw $007F ; 0x65
|02D343| dw $017F ; 0x66
|02D345| dw $017F ; 0x67
|02D347| dw $017F ; 0x68
|02D349| dw $007F ; 0x69
|02D34B| dw $017F ; 0x6A
|02D34D| dw $007F ; 0x6B
|02D34F| dw $007F ; 0x6C
|02D351| dw $007F ; 0x6D
|02D353| dw $017F ; 0x6E
|02D355| dw $007F ; 0x6F
|02D357| dw $017F ; 0x70
|02D359| dw $007F ; 0x71
|02D35B| dw $017F ; 0x72
|02D35D| dw $017F ; 0x73
|02D35F| dw $00FF ; 0x74
|02D361| dw $007F ; 0x75
|02D363| dw $017F ; 0x76
|02D365| dw $007F ; 0x77
|02D367| dw $0107 ; 0x78
|02D369| dw $017F ; 0x79
|02D36B| dw $017F ; 0x7A
|02D36D| dw $017F ; 0x7B
|02D36F| dw $007F ; 0x7C
|02D371| dw $017F ; 0x7D
|02D373| dw $017F ; 0x7E
|02D375| dw $007F ; 0x7F
|02D377| dw $007F ; 0x80
|02D379| dw $017F ; 0x81
|02D37B| dw $007F ; 0x82
|02D37D| dw $007F ; 0x83
|02D37F| dw $007F ; 0x84

;---------------------------------------------------------------------------------------------------

.main_GFX
|02D381| db $03 ; 0x00
|02D382| db $03 ; 0x01
|02D383| db $04 ; 0x02
|02D384| db $04 ; 0x03
|02D385| db $04 ; 0x04
|02D386| db $04 ; 0x05
|02D387| db $06 ; 0x06
|02D388| db $06 ; 0x07
|02D389| db $05 ; 0x08
|02D38A| db $12 ; 0x09
|02D38B| db $12 ; 0x0A
|02D38C| db $12 ; 0x0B
|02D38D| db $12 ; 0x0C
|02D38E| db $03 ; 0x0D
|02D38F| db $03 ; 0x0E
|02D390| db $03 ; 0x0F
|02D391| db $03 ; 0x10
|02D392| db $06 ; 0x11
|02D393| db $06 ; 0x12
|02D394| db $06 ; 0x13
|02D395| db $06 ; 0x14
|02D396| db $0D ; 0x15
|02D397| db $06 ; 0x16
|02D398| db $06 ; 0x17
|02D399| db $0D ; 0x18
|02D39A| db $0D ; 0x19
|02D39B| db $06 ; 0x1A
|02D39C| db $06 ; 0x1B
|02D39D| db $06 ; 0x1C
|02D39E| db $06 ; 0x1D
|02D39F| db $06 ; 0x1E
|02D3A0| db $06 ; 0x1F
|02D3A1| db $06 ; 0x20
|02D3A2| db $06 ; 0x21
|02D3A3| db $06 ; 0x22
|02D3A4| db $06 ; 0x23
|02D3A5| db $04 ; 0x24
|02D3A6| db $08 ; 0x25
|02D3A7| db $07 ; 0x26
|02D3A8| db $0C ; 0x27
|02D3A9| db $09 ; 0x28
|02D3AA| db $09 ; 0x29
|02D3AB| db $09 ; 0x2A
|02D3AC| db $09 ; 0x2B
|02D3AD| db $06 ; 0x2C
|02D3AE| db $0B ; 0x2D
|02D3AF| db $06 ; 0x2E
|02D3B0| db $06 ; 0x2F
|02D3B1| db $14 ; 0x30
|02D3B2| db $14 ; 0x31
|02D3B3| db $01 ; 0x32
|02D3B4| db $05 ; 0x33
|02D3B5| db $0A ; 0x34
|02D3B6| db $0D ; 0x35
|02D3B7| db $13 ; 0x36
|02D3B8| db $0E ; 0x37
|02D3B9| db $06 ; 0x38
|02D3BA| db $06 ; 0x39
|02D3BB| db $06 ; 0x3A
|02D3BC| db $06 ; 0x3B
|02D3BD| db $03 ; 0x3C
|02D3BE| db $06 ; 0x3D
|02D3BF| db $03 ; 0x3E
|02D3C0| db $03 ; 0x3F
|02D3C1| db $03 ; 0x40
|02D3C2| db $14 ; 0x41
|02D3C3| db $03 ; 0x42
|02D3C4| db $03 ; 0x43
|02D3C5| db $03 ; 0x44
|02D3C6| db $0F ; 0x45
|02D3C7| db $03 ; 0x46
|02D3C8| db $03 ; 0x47
|02D3C9| db $03 ; 0x48
|02D3CA| db $03 ; 0x49
|02D3CB| db $03 ; 0x4A
|02D3CC| db $03 ; 0x4B
|02D3CD| db $03 ; 0x4C
|02D3CE| db $06 ; 0x4D
|02D3CF| db $08 ; 0x4E
|02D3D0| db $06 ; 0x4F
|02D3D1| db $06 ; 0x50
|02D3D2| db $06 ; 0x51
|02D3D3| db $06 ; 0x52
|02D3D4| db $03 ; 0x53
|02D3D5| db $03 ; 0x54
|02D3D6| db $06 ; 0x55
|02D3D7| db $06 ; 0x56
|02D3D8| db $03 ; 0x57
|02D3D9| db $14 ; 0x58
|02D3DA| db $11 ; 0x59
|02D3DB| db $14 ; 0x5A
|02D3DC| db $01 ; 0x5B
|02D3DD| db $06 ; 0x5C
|02D3DE| db $06 ; 0x5D
|02D3DF| db $06 ; 0x5E
|02D3E0| db $08 ; 0x5F
|02D3E1| db $03 ; 0x60
|02D3E2| db $0A ; 0x61
|02D3E3| db $06 ; 0x62
|02D3E4| db $12 ; 0x63
|02D3E5| db $11 ; 0x64
|02D3E6| db $11 ; 0x65
|02D3E7| db $11 ; 0x66
|02D3E8| db $03 ; 0x67
|02D3E9| db $0F ; 0x68
|02D3EA| db $14 ; 0x69
|02D3EB| db $14 ; 0x6A
|02D3EC| db $03 ; 0x6B
|02D3ED| db $06 ; 0x6C
|02D3EE| db $06 ; 0x6D
|02D3EF| db $06 ; 0x6E
|02D3F0| db $06 ; 0x6F
|02D3F1| db $06 ; 0x70
|02D3F2| db $06 ; 0x71
|02D3F3| db $06 ; 0x72
|02D3F4| db $01 ; 0x73
|02D3F5| db $04 ; 0x74
|02D3F6| db $02 ; 0x75
|02D3F7| db $09 ; 0x76
|02D3F8| db $09 ; 0x77
|02D3F9| db $09 ; 0x78
|02D3FA| db $09 ; 0x79
|02D3FB| db $06 ; 0x7A
|02D3FC| db $13 ; 0x7B
|02D3FD| db $06 ; 0x7C
|02D3FE| db $01 ; 0x7D
|02D3FF| db $06 ; 0x7E
|02D400| db $06 ; 0x7F
|02D401| db $06 ; 0x80
|02D402| db $01 ; 0x81
|02D403| db $06 ; 0x82
|02D404| db $06 ; 0x83
|02D405| db $06 ; 0x84

;---------------------------------------------------------------------------------------------------

.floor
|02D406| db $00 ; 0x00
|02D407| db $00 ; 0x01
|02D408| db $00 ; 0x02
|02D409| db $00 ; 0x03
|02D40A| db $00 ; 0x04
|02D40B| db $00 ; 0x05
|02D40C| db $00 ; 0x06
|02D40D| db $00 ; 0x07
|02D40E| db $00 ; 0x08
|02D40F| db $FF ; 0x09
|02D410| db $FF ; 0x0A
|02D411| db $FF ; 0x0B
|02D412| db $00 ; 0x0C
|02D413| db $00 ; 0x0D
|02D414| db $00 ; 0x0E
|02D415| db $00 ; 0x0F
|02D416| db $00 ; 0x10
|02D417| db $FF ; 0x11
|02D418| db $FF ; 0x12
|02D419| db $00 ; 0x13
|02D41A| db $01 ; 0x14
|02D41B| db $FF ; 0x15
|02D41C| db $00 ; 0x16
|02D41D| db $01 ; 0x17
|02D41E| db $FE ; 0x18
|02D41F| db $FF ; 0x19
|02D420| db $00 ; 0x1A
|02D421| db $01 ; 0x1B
|02D422| db $00 ; 0x1C
|02D423| db $01 ; 0x1D
|02D424| db $FF ; 0x1E
|02D425| db $00 ; 0x1F
|02D426| db $01 ; 0x20
|02D427| db $00 ; 0x21
|02D428| db $00 ; 0x22
|02D429| db $01 ; 0x23
|02D42A| db $01 ; 0x24
|02D42B| db $00 ; 0x25
|02D42C| db $00 ; 0x26
|02D42D| db $00 ; 0x27
|02D42E| db $FF ; 0x28
|02D42F| db $FF ; 0x29
|02D430| db $FF ; 0x2A
|02D431| db $FF ; 0x2B
|02D432| db $FF ; 0x2C
|02D433| db $00 ; 0x2D
|02D434| db $00 ; 0x2E
|02D435| db $00 ; 0x2F
|02D436| db $00 ; 0x30
|02D437| db $00 ; 0x31
|02D438| db $FF ; 0x32
|02D439| db $01 ; 0x33
|02D43A| db $FF ; 0x34
|02D43B| db $00 ; 0x35
|02D43C| db $00 ; 0x36
|02D43D| db $01 ; 0x37
|02D43E| db $FF ; 0x38
|02D43F| db $FF ; 0x39
|02D440| db $FF ; 0x3A
|02D441| db $FF ; 0x3B
|02D442| db $00 ; 0x3C
|02D443| db $00 ; 0x3D
|02D444| db $00 ; 0x3E
|02D445| db $00 ; 0x3F
|02D446| db $00 ; 0x40
|02D447| db $00 ; 0x41
|02D448| db $00 ; 0x42
|02D449| db $00 ; 0x43
|02D44A| db $00 ; 0x44
|02D44B| db $00 ; 0x45
|02D44C| db $00 ; 0x46
|02D44D| db $00 ; 0x47
|02D44E| db $00 ; 0x48
|02D44F| db $00 ; 0x49
|02D450| db $00 ; 0x4A
|02D451| db $00 ; 0x4B
|02D452| db $00 ; 0x4C
|02D453| db $00 ; 0x4D
|02D454| db $00 ; 0x4E
|02D455| db $00 ; 0x4F
|02D456| db $00 ; 0x50
|02D457| db $00 ; 0x51
|02D458| db $00 ; 0x52
|02D459| db $00 ; 0x53
|02D45A| db $00 ; 0x54
|02D45B| db $00 ; 0x55
|02D45C| db $00 ; 0x56
|02D45D| db $00 ; 0x57
|02D45E| db $00 ; 0x58
|02D45F| db $00 ; 0x59
|02D460| db $00 ; 0x5A
|02D461| db $00 ; 0x5B
|02D462| db $00 ; 0x5C
|02D463| db $00 ; 0x5D
|02D464| db $00 ; 0x5E
|02D465| db $00 ; 0x5F
|02D466| db $00 ; 0x60
|02D467| db $00 ; 0x61
|02D468| db $00 ; 0x62
|02D469| db $00 ; 0x63
|02D46A| db $00 ; 0x64
|02D46B| db $00 ; 0x65
|02D46C| db $00 ; 0x66
|02D46D| db $00 ; 0x67
|02D46E| db $00 ; 0x68
|02D46F| db $00 ; 0x69
|02D470| db $00 ; 0x6A
|02D471| db $00 ; 0x6B
|02D472| db $00 ; 0x6C
|02D473| db $00 ; 0x6D
|02D474| db $00 ; 0x6E
|02D475| db $00 ; 0x6F
|02D476| db $00 ; 0x70
|02D477| db $00 ; 0x71
|02D478| db $00 ; 0x72
|02D479| db $FF ; 0x73
|02D47A| db $FF ; 0x74
|02D47B| db $FF ; 0x75
|02D47C| db $FF ; 0x76
|02D47D| db $FF ; 0x77
|02D47E| db $FF ; 0x78
|02D47F| db $FF ; 0x79
|02D480| db $FF ; 0x7A
|02D481| db $01 ; 0x7B
|02D482| db $FF ; 0x7C
|02D483| db $FF ; 0x7D
|02D484| db $FF ; 0x7E
|02D485| db $FF ; 0x7F
|02D486| db $FF ; 0x80
|02D487| db $FF ; 0x81
|02D488| db $FF ; 0x82
|02D489| db $00 ; 0x83
|02D48A| db $00 ; 0x84

;---------------------------------------------------------------------------------------------------

.dungeon_id
|02D48B| db $FF ; 0x00
|02D48C| db $FF ; 0x01
|02D48D| db $00 ; 0x02
|02D48E| db $02 ; 0x03
|02D48F| db $02 ; 0x04
|02D490| db $02 ; 0x05
|02D491| db $FF ; 0x06
|02D492| db $FF ; 0x07
|02D493| db $04 ; 0x08
|02D494| db $06 ; 0x09
|02D495| db $06 ; 0x0A
|02D496| db $06 ; 0x0B
|02D497| db $06 ; 0x0C
|02D498| db $FF ; 0x0D
|02D499| db $FF ; 0x0E
|02D49A| db $FF ; 0x0F
|02D49B| db $FF ; 0x10
|02D49C| db $FF ; 0x11
|02D49D| db $FF ; 0x12
|02D49E| db $FF ; 0x13
|02D49F| db $FF ; 0x14
|02D4A0| db $18 ; 0x15
|02D4A1| db $FF ; 0x16
|02D4A2| db $FF ; 0x17
|02D4A3| db $18 ; 0x18
|02D4A4| db $18 ; 0x19
|02D4A5| db $FF ; 0x1A
|02D4A6| db $FF ; 0x1B
|02D4A7| db $FF ; 0x1C
|02D4A8| db $FF ; 0x1D
|02D4A9| db $FF ; 0x1E
|02D4AA| db $FF ; 0x1F
|02D4AB| db $FF ; 0x20
|02D4AC| db $FF ; 0x21
|02D4AD| db $FF ; 0x22
|02D4AE| db $FF ; 0x23
|02D4AF| db $08 ; 0x24
|02D4B0| db $0A ; 0x25
|02D4B1| db $0C ; 0x26
|02D4B2| db $0E ; 0x27
|02D4B3| db $10 ; 0x28
|02D4B4| db $10 ; 0x29
|02D4B5| db $10 ; 0x2A
|02D4B6| db $10 ; 0x2B
|02D4B7| db $FF ; 0x2C
|02D4B8| db $12 ; 0x2D
|02D4B9| db $FF ; 0x2E
|02D4BA| db $FF ; 0x2F
|02D4BB| db $FF ; 0x30
|02D4BC| db $FF ; 0x31
|02D4BD| db $FF ; 0x32
|02D4BE| db $14 ; 0x33
|02D4BF| db $16 ; 0x34
|02D4C0| db $18 ; 0x35
|02D4C1| db $FF ; 0x36
|02D4C2| db $1A ; 0x37
|02D4C3| db $FF ; 0x38
|02D4C4| db $FF ; 0x39
|02D4C5| db $FF ; 0x3A
|02D4C6| db $FF ; 0x3B
|02D4C7| db $FF ; 0x3C
|02D4C8| db $FF ; 0x3D
|02D4C9| db $FF ; 0x3E
|02D4CA| db $FF ; 0x3F
|02D4CB| db $FF ; 0x40
|02D4CC| db $FF ; 0x41
|02D4CD| db $FF ; 0x42
|02D4CE| db $FF ; 0x43
|02D4CF| db $FF ; 0x44
|02D4D0| db $FF ; 0x45
|02D4D1| db $FF ; 0x46
|02D4D2| db $FF ; 0x47
|02D4D3| db $FF ; 0x48
|02D4D4| db $FF ; 0x49
|02D4D5| db $FF ; 0x4A
|02D4D6| db $FF ; 0x4B
|02D4D7| db $FF ; 0x4C
|02D4D8| db $FF ; 0x4D
|02D4D9| db $FF ; 0x4E
|02D4DA| db $FF ; 0x4F
|02D4DB| db $FF ; 0x50
|02D4DC| db $FF ; 0x51
|02D4DD| db $FF ; 0x52
|02D4DE| db $FF ; 0x53
|02D4DF| db $FF ; 0x54
|02D4E0| db $FF ; 0x55
|02D4E1| db $FF ; 0x56
|02D4E2| db $FF ; 0x57
|02D4E3| db $FF ; 0x58
|02D4E4| db $FF ; 0x59
|02D4E5| db $FF ; 0x5A
|02D4E6| db $FF ; 0x5B
|02D4E7| db $FF ; 0x5C
|02D4E8| db $FF ; 0x5D
|02D4E9| db $FF ; 0x5E
|02D4EA| db $FF ; 0x5F
|02D4EB| db $FF ; 0x60
|02D4EC| db $FF ; 0x61
|02D4ED| db $FF ; 0x62
|02D4EE| db $FF ; 0x63
|02D4EF| db $FF ; 0x64
|02D4F0| db $FF ; 0x65
|02D4F1| db $FF ; 0x66
|02D4F2| db $FF ; 0x67
|02D4F3| db $FF ; 0x68
|02D4F4| db $FF ; 0x69
|02D4F5| db $FF ; 0x6A
|02D4F6| db $FF ; 0x6B
|02D4F7| db $FF ; 0x6C
|02D4F8| db $FF ; 0x6D
|02D4F9| db $FF ; 0x6E
|02D4FA| db $FF ; 0x6F
|02D4FB| db $FF ; 0x70
|02D4FC| db $FF ; 0x71
|02D4FD| db $FF ; 0x72
|02D4FE| db $FF ; 0x73
|02D4FF| db $FF ; 0x74
|02D500| db $FF ; 0x75
|02D501| db $10 ; 0x76
|02D502| db $10 ; 0x77
|02D503| db $10 ; 0x78
|02D504| db $10 ; 0x79
|02D505| db $FF ; 0x7A
|02D506| db $FF ; 0x7B
|02D507| db $FF ; 0x7C
|02D508| db $FF ; 0x7D
|02D509| db $FF ; 0x7E
|02D50A| db $FF ; 0x7F
|02D50B| db $FF ; 0x80
|02D50C| db $00 ; 0x81
|02D50D| db $FF ; 0x82
|02D50E| db $FF ; 0x83
|02D50F| db $FF ; 0x84

;---------------------------------------------------------------------------------------------------

.in_door
|02D510| db $00 ; 0x00
|02D511| db $01 ; 0x01
|02D512| db $01 ; 0x02
|02D513| db $01 ; 0x03
|02D514| db $01 ; 0x04
|02D515| db $01 ; 0x05
|02D516| db $01 ; 0x06
|02D517| db $01 ; 0x07
|02D518| db $01 ; 0x08
|02D519| db $01 ; 0x09
|02D51A| db $01 ; 0x0A
|02D51B| db $01 ; 0x0B
|02D51C| db $01 ; 0x0C
|02D51D| db $01 ; 0x0D
|02D51E| db $01 ; 0x0E
|02D51F| db $01 ; 0x0F
|02D520| db $01 ; 0x10
|02D521| db $01 ; 0x11
|02D522| db $01 ; 0x12
|02D523| db $01 ; 0x13
|02D524| db $01 ; 0x14
|02D525| db $01 ; 0x15
|02D526| db $01 ; 0x16
|02D527| db $01 ; 0x17
|02D528| db $01 ; 0x18
|02D529| db $01 ; 0x19
|02D52A| db $01 ; 0x1A
|02D52B| db $01 ; 0x1B
|02D52C| db $01 ; 0x1C
|02D52D| db $01 ; 0x1D
|02D52E| db $01 ; 0x1E
|02D52F| db $01 ; 0x1F
|02D530| db $01 ; 0x20
|02D531| db $01 ; 0x21
|02D532| db $01 ; 0x22
|02D533| db $01 ; 0x23
|02D534| db $01 ; 0x24
|02D535| db $01 ; 0x25
|02D536| db $01 ; 0x26
|02D537| db $01 ; 0x27
|02D538| db $01 ; 0x28
|02D539| db $01 ; 0x29
|02D53A| db $01 ; 0x2A
|02D53B| db $01 ; 0x2B
|02D53C| db $01 ; 0x2C
|02D53D| db $01 ; 0x2D
|02D53E| db $01 ; 0x2E
|02D53F| db $01 ; 0x2F
|02D540| db $01 ; 0x30
|02D541| db $01 ; 0x31
|02D542| db $01 ; 0x32
|02D543| db $01 ; 0x33
|02D544| db $01 ; 0x34
|02D545| db $01 ; 0x35
|02D546| db $01 ; 0x36
|02D547| db $01 ; 0x37
|02D548| db $01 ; 0x38
|02D549| db $01 ; 0x39
|02D54A| db $01 ; 0x3A
|02D54B| db $01 ; 0x3B
|02D54C| db $01 ; 0x3C
|02D54D| db $01 ; 0x3D
|02D54E| db $01 ; 0x3E
|02D54F| db $01 ; 0x3F
|02D550| db $01 ; 0x40
|02D551| db $01 ; 0x41
|02D552| db $01 ; 0x42
|02D553| db $01 ; 0x43
|02D554| db $01 ; 0x44
|02D555| db $01 ; 0x45
|02D556| db $01 ; 0x46
|02D557| db $01 ; 0x47
|02D558| db $01 ; 0x48
|02D559| db $01 ; 0x49
|02D55A| db $01 ; 0x4A
|02D55B| db $01 ; 0x4B
|02D55C| db $01 ; 0x4C
|02D55D| db $01 ; 0x4D
|02D55E| db $01 ; 0x4E
|02D55F| db $01 ; 0x4F
|02D560| db $01 ; 0x50
|02D561| db $01 ; 0x51
|02D562| db $01 ; 0x52
|02D563| db $01 ; 0x53
|02D564| db $01 ; 0x54
|02D565| db $01 ; 0x55
|02D566| db $01 ; 0x56
|02D567| db $01 ; 0x57
|02D568| db $01 ; 0x58
|02D569| db $01 ; 0x59
|02D56A| db $01 ; 0x5A
|02D56B| db $01 ; 0x5B
|02D56C| db $01 ; 0x5C
|02D56D| db $01 ; 0x5D
|02D56E| db $01 ; 0x5E
|02D56F| db $01 ; 0x5F
|02D570| db $01 ; 0x60
|02D571| db $01 ; 0x61
|02D572| db $01 ; 0x62
|02D573| db $01 ; 0x63
|02D574| db $01 ; 0x64
|02D575| db $01 ; 0x65
|02D576| db $01 ; 0x66
|02D577| db $01 ; 0x67
|02D578| db $01 ; 0x68
|02D579| db $01 ; 0x69
|02D57A| db $01 ; 0x6A
|02D57B| db $01 ; 0x6B
|02D57C| db $01 ; 0x6C
|02D57D| db $01 ; 0x6D
|02D57E| db $01 ; 0x6E
|02D57F| db $01 ; 0x6F
|02D580| db $01 ; 0x70
|02D581| db $01 ; 0x71
|02D582| db $01 ; 0x72
|02D583| db $00 ; 0x73
|02D584| db $00 ; 0x74
|02D585| db $00 ; 0x75
|02D586| db $00 ; 0x76
|02D587| db $00 ; 0x77
|02D588| db $00 ; 0x78
|02D589| db $00 ; 0x79
|02D58A| db $00 ; 0x7A
|02D58B| db $00 ; 0x7B
|02D58C| db $00 ; 0x7C
|02D58D| db $00 ; 0x7D
|02D58E| db $00 ; 0x7E
|02D58F| db $00 ; 0x7F
|02D590| db $00 ; 0x80
|02D591| db $00 ; 0x81
|02D592| db $00 ; 0x82
|02D593| db $01 ; 0x83
|02D594| db $01 ; 0x84

;---------------------------------------------------------------------------------------------------

.layer
|02D595| db $00 ; 0x00
|02D596| db $00 ; 0x01
|02D597| db $01 ; 0x02
|02D598| db $00 ; 0x03
|02D599| db $01 ; 0x04
|02D59A| db $00 ; 0x05
|02D59B| db $00 ; 0x06
|02D59C| db $01 ; 0x07
|02D59D| db $00 ; 0x08
|02D59E| db $00 ; 0x09
|02D59F| db $00 ; 0x0A
|02D5A0| db $00 ; 0x0B
|02D5A1| db $00 ; 0x0C
|02D5A2| db $00 ; 0x0D
|02D5A3| db $00 ; 0x0E
|02D5A4| db $00 ; 0x0F
|02D5A5| db $00 ; 0x10
|02D5A6| db $00 ; 0x11
|02D5A7| db $00 ; 0x12
|02D5A8| db $00 ; 0x13
|02D5A9| db $00 ; 0x14
|02D5AA| db $00 ; 0x15
|02D5AB| db $00 ; 0x16
|02D5AC| db $00 ; 0x17
|02D5AD| db $00 ; 0x18
|02D5AE| db $00 ; 0x19
|02D5AF| db $01 ; 0x1A
|02D5B0| db $00 ; 0x1B
|02D5B1| db $01 ; 0x1C
|02D5B2| db $00 ; 0x1D
|02D5B3| db $00 ; 0x1E
|02D5B4| db $00 ; 0x1F
|02D5B5| db $00 ; 0x20
|02D5B6| db $00 ; 0x21
|02D5B7| db $11 ; 0x22
|02D5B8| db $00 ; 0x23
|02D5B9| db $00 ; 0x24
|02D5BA| db $00 ; 0x25
|02D5BB| db $00 ; 0x26
|02D5BC| db $00 ; 0x27
|02D5BD| db $00 ; 0x28
|02D5BE| db $00 ; 0x29
|02D5BF| db $00 ; 0x2A
|02D5C0| db $00 ; 0x2B
|02D5C1| db $00 ; 0x2C
|02D5C2| db $00 ; 0x2D
|02D5C3| db $01 ; 0x2E
|02D5C4| db $01 ; 0x2F
|02D5C5| db $01 ; 0x30
|02D5C6| db $00 ; 0x31
|02D5C7| db $00 ; 0x32
|02D5C8| db $11 ; 0x33
|02D5C9| db $00 ; 0x34
|02D5CA| db $00 ; 0x35
|02D5CB| db $00 ; 0x36
|02D5CC| db $00 ; 0x37
|02D5CD| db $00 ; 0x38
|02D5CE| db $00 ; 0x39
|02D5CF| db $00 ; 0x3A
|02D5D0| db $00 ; 0x3B
|02D5D1| db $00 ; 0x3C
|02D5D2| db $00 ; 0x3D
|02D5D3| db $00 ; 0x3E
|02D5D4| db $00 ; 0x3F
|02D5D5| db $00 ; 0x40
|02D5D6| db $00 ; 0x41
|02D5D7| db $00 ; 0x42
|02D5D8| db $00 ; 0x43
|02D5D9| db $00 ; 0x44
|02D5DA| db $00 ; 0x45
|02D5DB| db $00 ; 0x46
|02D5DC| db $00 ; 0x47
|02D5DD| db $00 ; 0x48
|02D5DE| db $00 ; 0x49
|02D5DF| db $00 ; 0x4A
|02D5E0| db $00 ; 0x4B
|02D5E1| db $00 ; 0x4C
|02D5E2| db $01 ; 0x4D
|02D5E3| db $00 ; 0x4E
|02D5E4| db $00 ; 0x4F
|02D5E5| db $00 ; 0x50
|02D5E6| db $11 ; 0x51
|02D5E7| db $00 ; 0x52
|02D5E8| db $00 ; 0x53
|02D5E9| db $00 ; 0x54
|02D5EA| db $00 ; 0x55
|02D5EB| db $00 ; 0x56
|02D5EC| db $00 ; 0x57
|02D5ED| db $00 ; 0x58
|02D5EE| db $00 ; 0x59
|02D5EF| db $00 ; 0x5A
|02D5F0| db $00 ; 0x5B
|02D5F1| db $00 ; 0x5C
|02D5F2| db $00 ; 0x5D
|02D5F3| db $00 ; 0x5E
|02D5F4| db $00 ; 0x5F
|02D5F5| db $00 ; 0x60
|02D5F6| db $00 ; 0x61
|02D5F7| db $00 ; 0x62
|02D5F8| db $00 ; 0x63
|02D5F9| db $00 ; 0x64
|02D5FA| db $00 ; 0x65
|02D5FB| db $00 ; 0x66
|02D5FC| db $00 ; 0x67
|02D5FD| db $00 ; 0x68
|02D5FE| db $01 ; 0x69
|02D5FF| db $01 ; 0x6A
|02D600| db $00 ; 0x6B
|02D601| db $00 ; 0x6C
|02D602| db $00 ; 0x6D
|02D603| db $00 ; 0x6E
|02D604| db $00 ; 0x6F
|02D605| db $00 ; 0x70
|02D606| db $00 ; 0x71
|02D607| db $00 ; 0x72
|02D608| db $00 ; 0x73
|02D609| db $11 ; 0x74
|02D60A| db $00 ; 0x75
|02D60B| db $00 ; 0x76
|02D60C| db $00 ; 0x77
|02D60D| db $00 ; 0x78
|02D60E| db $00 ; 0x79
|02D60F| db $00 ; 0x7A
|02D610| db $00 ; 0x7B
|02D611| db $01 ; 0x7C
|02D612| db $01 ; 0x7D
|02D613| db $11 ; 0x7E
|02D614| db $01 ; 0x7F
|02D615| db $00 ; 0x80
|02D616| db $00 ; 0x81
|02D617| db $00 ; 0x82
|02D618| db $00 ; 0x83
|02D619| db $00 ; 0x84

;---------------------------------------------------------------------------------------------------

.camera_scroll_controller
|02D61A| db $00 ; 0x00
|02D61B| db $00 ; 0x01
|02D61C| db $22 ; 0x02
|02D61D| db $02 ; 0x03
|02D61E| db $22 ; 0x04
|02D61F| db $22 ; 0x05
|02D620| db $22 ; 0x06
|02D621| db $22 ; 0x07
|02D622| db $20 ; 0x08
|02D623| db $22 ; 0x09
|02D624| db $00 ; 0x0A
|02D625| db $00 ; 0x0B
|02D626| db $00 ; 0x0C
|02D627| db $00 ; 0x0D
|02D628| db $00 ; 0x0E
|02D629| db $00 ; 0x0F
|02D62A| db $00 ; 0x10
|02D62B| db $00 ; 0x11
|02D62C| db $02 ; 0x12
|02D62D| db $22 ; 0x13
|02D62E| db $22 ; 0x14
|02D62F| db $00 ; 0x15
|02D630| db $22 ; 0x16
|02D631| db $02 ; 0x17
|02D632| db $02 ; 0x18
|02D633| db $00 ; 0x19
|02D634| db $22 ; 0x1A
|02D635| db $22 ; 0x1B
|02D636| db $02 ; 0x1C
|02D637| db $22 ; 0x1D
|02D638| db $20 ; 0x1E
|02D639| db $20 ; 0x1F
|02D63A| db $20 ; 0x20
|02D63B| db $22 ; 0x21
|02D63C| db $22 ; 0x22
|02D63D| db $22 ; 0x23
|02D63E| db $00 ; 0x24
|02D63F| db $22 ; 0x25
|02D640| db $20 ; 0x26
|02D641| db $20 ; 0x27
|02D642| db $00 ; 0x28
|02D643| db $00 ; 0x29
|02D644| db $00 ; 0x2A
|02D645| db $02 ; 0x2B
|02D646| db $02 ; 0x2C
|02D647| db $00 ; 0x2D
|02D648| db $22 ; 0x2E
|02D649| db $22 ; 0x2F
|02D64A| db $02 ; 0x30
|02D64B| db $22 ; 0x31
|02D64C| db $20 ; 0x32
|02D64D| db $22 ; 0x33
|02D64E| db $22 ; 0x34
|02D64F| db $02 ; 0x35
|02D650| db $02 ; 0x36
|02D651| db $22 ; 0x37
|02D652| db $00 ; 0x38
|02D653| db $20 ; 0x39
|02D654| db $22 ; 0x3A
|02D655| db $00 ; 0x3B
|02D656| db $00 ; 0x3C
|02D657| db $00 ; 0x3D
|02D658| db $00 ; 0x3E
|02D659| db $00 ; 0x3F
|02D65A| db $00 ; 0x40
|02D65B| db $22 ; 0x41
|02D65C| db $02 ; 0x42
|02D65D| db $02 ; 0x43
|02D65E| db $00 ; 0x44
|02D65F| db $00 ; 0x45
|02D660| db $00 ; 0x46
|02D661| db $00 ; 0x47
|02D662| db $00 ; 0x48
|02D663| db $00 ; 0x49
|02D664| db $00 ; 0x4A
|02D665| db $00 ; 0x4B
|02D666| db $00 ; 0x4C
|02D667| db $02 ; 0x4D
|02D668| db $20 ; 0x4E
|02D669| db $00 ; 0x4F
|02D66A| db $02 ; 0x50
|02D66B| db $00 ; 0x51
|02D66C| db $00 ; 0x52
|02D66D| db $00 ; 0x53
|02D66E| db $00 ; 0x54
|02D66F| db $02 ; 0x55
|02D670| db $00 ; 0x56
|02D671| db $00 ; 0x57
|02D672| db $00 ; 0x58
|02D673| db $00 ; 0x59
|02D674| db $02 ; 0x5A
|02D675| db $02 ; 0x5B
|02D676| db $00 ; 0x5C
|02D677| db $02 ; 0x5D
|02D678| db $00 ; 0x5E
|02D679| db $02 ; 0x5F
|02D67A| db $00 ; 0x60
|02D67B| db $20 ; 0x61
|02D67C| db $00 ; 0x62
|02D67D| db $00 ; 0x63
|02D67E| db $00 ; 0x64
|02D67F| db $00 ; 0x65
|02D680| db $00 ; 0x66
|02D681| db $00 ; 0x67
|02D682| db $00 ; 0x68
|02D683| db $02 ; 0x69
|02D684| db $02 ; 0x6A
|02D685| db $00 ; 0x6B
|02D686| db $00 ; 0x6C
|02D687| db $00 ; 0x6D
|02D688| db $00 ; 0x6E
|02D689| db $00 ; 0x6F
|02D68A| db $00 ; 0x70
|02D68B| db $00 ; 0x71
|02D68C| db $00 ; 0x72
|02D68D| db $20 ; 0x73
|02D68E| db $22 ; 0x74
|02D68F| db $00 ; 0x75
|02D690| db $02 ; 0x76
|02D691| db $02 ; 0x77
|02D692| db $22 ; 0x78
|02D693| db $02 ; 0x79
|02D694| db $02 ; 0x7A
|02D695| db $00 ; 0x7B
|02D696| db $02 ; 0x7C
|02D697| db $20 ; 0x7D
|02D698| db $00 ; 0x7E
|02D699| db $02 ; 0x7F
|02D69A| db $20 ; 0x80
|02D69B| db $02 ; 0x81
|02D69C| db $00 ; 0x82
|02D69D| db $00 ; 0x83
|02D69E| db $00 ; 0x84

;---------------------------------------------------------------------------------------------------

.quadrant
|02D69F| db $02 ; 0x00
|02D6A0| db $02 ; 0x01
|02D6A1| db $02 ; 0x02
|02D6A2| db $12 ; 0x03
|02D6A3| db $02 ; 0x04
|02D6A4| db $02 ; 0x05
|02D6A5| db $02 ; 0x06
|02D6A6| db $12 ; 0x07
|02D6A7| db $02 ; 0x08
|02D6A8| db $02 ; 0x09
|02D6A9| db $12 ; 0x0A
|02D6AA| db $02 ; 0x0B
|02D6AB| db $02 ; 0x0C
|02D6AC| db $12 ; 0x0D
|02D6AD| db $02 ; 0x0E
|02D6AE| db $12 ; 0x0F
|02D6AF| db $02 ; 0x10
|02D6B0| db $02 ; 0x11
|02D6B1| db $12 ; 0x12
|02D6B2| db $02 ; 0x13
|02D6B3| db $12 ; 0x14
|02D6B4| db $12 ; 0x15
|02D6B5| db $02 ; 0x16
|02D6B6| db $12 ; 0x17
|02D6B7| db $02 ; 0x18
|02D6B8| db $12 ; 0x19
|02D6B9| db $02 ; 0x1A
|02D6BA| db $12 ; 0x1B
|02D6BB| db $02 ; 0x1C
|02D6BC| db $12 ; 0x1D
|02D6BD| db $12 ; 0x1E
|02D6BE| db $02 ; 0x1F
|02D6BF| db $02 ; 0x20
|02D6C0| db $02 ; 0x21
|02D6C1| db $02 ; 0x22
|02D6C2| db $02 ; 0x23
|02D6C3| db $02 ; 0x24
|02D6C4| db $02 ; 0x25
|02D6C5| db $02 ; 0x26
|02D6C6| db $02 ; 0x27
|02D6C7| db $02 ; 0x28
|02D6C8| db $02 ; 0x29
|02D6C9| db $02 ; 0x2A
|02D6CA| db $02 ; 0x2B
|02D6CB| db $02 ; 0x2C
|02D6CC| db $12 ; 0x2D
|02D6CD| db $02 ; 0x2E
|02D6CE| db $12 ; 0x2F
|02D6CF| db $02 ; 0x30
|02D6D0| db $02 ; 0x31
|02D6D1| db $02 ; 0x32
|02D6D2| db $02 ; 0x33
|02D6D3| db $02 ; 0x34
|02D6D4| db $12 ; 0x35
|02D6D5| db $02 ; 0x36
|02D6D6| db $02 ; 0x37
|02D6D7| db $12 ; 0x38
|02D6D8| db $12 ; 0x39
|02D6D9| db $12 ; 0x3A
|02D6DA| db $02 ; 0x3B
|02D6DB| db $02 ; 0x3C
|02D6DC| db $12 ; 0x3D
|02D6DD| db $02 ; 0x3E
|02D6DE| db $02 ; 0x3F
|02D6DF| db $02 ; 0x40
|02D6E0| db $12 ; 0x41
|02D6E1| db $02 ; 0x42
|02D6E2| db $00 ; 0x43
|02D6E3| db $02 ; 0x44
|02D6E4| db $02 ; 0x45
|02D6E5| db $12 ; 0x46
|02D6E6| db $02 ; 0x47
|02D6E7| db $02 ; 0x48
|02D6E8| db $02 ; 0x49
|02D6E9| db $02 ; 0x4A
|02D6EA| db $02 ; 0x4B
|02D6EB| db $02 ; 0x4C
|02D6EC| db $02 ; 0x4D
|02D6ED| db $02 ; 0x4E
|02D6EE| db $02 ; 0x4F
|02D6EF| db $02 ; 0x50
|02D6F0| db $02 ; 0x51
|02D6F1| db $02 ; 0x52
|02D6F2| db $02 ; 0x53
|02D6F3| db $12 ; 0x54
|02D6F4| db $02 ; 0x55
|02D6F5| db $12 ; 0x56
|02D6F6| db $02 ; 0x57
|02D6F7| db $12 ; 0x58
|02D6F8| db $02 ; 0x59
|02D6F9| db $02 ; 0x5A
|02D6FA| db $02 ; 0x5B
|02D6FB| db $02 ; 0x5C
|02D6FC| db $02 ; 0x5D
|02D6FD| db $12 ; 0x5E
|02D6FE| db $02 ; 0x5F
|02D6FF| db $02 ; 0x60
|02D700| db $02 ; 0x61
|02D701| db $12 ; 0x62
|02D702| db $12 ; 0x63
|02D703| db $02 ; 0x64
|02D704| db $02 ; 0x65
|02D705| db $12 ; 0x66
|02D706| db $12 ; 0x67
|02D707| db $12 ; 0x68
|02D708| db $02 ; 0x69
|02D709| db $12 ; 0x6A
|02D70A| db $02 ; 0x6B
|02D70B| db $02 ; 0x6C
|02D70C| db $02 ; 0x6D
|02D70D| db $12 ; 0x6E
|02D70E| db $02 ; 0x6F
|02D70F| db $12 ; 0x70
|02D710| db $02 ; 0x71
|02D711| db $12 ; 0x72
|02D712| db $10 ; 0x73
|02D713| db $02 ; 0x74
|02D714| db $00 ; 0x75
|02D715| db $10 ; 0x76
|02D716| db $00 ; 0x77
|02D717| db $10 ; 0x78
|02D718| db $10 ; 0x79
|02D719| db $10 ; 0x7A
|02D71A| db $10 ; 0x7B
|02D71B| db $02 ; 0x7C
|02D71C| db $10 ; 0x7D
|02D71D| db $12 ; 0x7E
|02D71E| db $02 ; 0x7F
|02D71F| db $02 ; 0x80
|02D720| db $12 ; 0x81
|02D721| db $02 ; 0x82
|02D722| db $02 ; 0x83
|02D723| db $02 ; 0x84

;---------------------------------------------------------------------------------------------------

.overworld_door_tilemap
|02D724| dw $0816 ; 0x00
|02D726| dw $0816 ; 0x01
|02D728| dw $0000 ; 0x02
|02D72A| dw $0000 ; 0x03
|02D72C| dw $0000 ; 0x04
|02D72E| dw $0000 ; 0x05
|02D730| dw $0000 ; 0x06
|02D732| dw $0000 ; 0x07
|02D734| dw $0000 ; 0x08
|02D736| dw $0000 ; 0x09
|02D738| dw $0000 ; 0x0A
|02D73A| dw $0000 ; 0x0B
|02D73C| dw $0000 ; 0x0C
|02D73E| dw $05CC ; 0x0D
|02D740| dw $05D4 ; 0x0E
|02D742| dw $0BB6 ; 0x0F
|02D744| dw $0B86 ; 0x10
|02D746| dw $0000 ; 0x11
|02D748| dw $0000 ; 0x12
|02D74A| dw $0000 ; 0x13
|02D74C| dw $0000 ; 0x14
|02D74E| dw $0000 ; 0x15
|02D750| dw $0000 ; 0x16
|02D752| dw $0000 ; 0x17
|02D754| dw $0000 ; 0x18
|02D756| dw $0000 ; 0x19
|02D758| dw $0000 ; 0x1A
|02D75A| dw $0000 ; 0x1B
|02D75C| dw $0000 ; 0x1C
|02D75E| dw $0000 ; 0x1D
|02D760| dw $0000 ; 0x1E
|02D762| dw $0000 ; 0x1F
|02D764| dw $0000 ; 0x20
|02D766| dw $0000 ; 0x21
|02D768| dw $0000 ; 0x22
|02D76A| dw $0000 ; 0x23
|02D76C| dw $0000 ; 0x24
|02D76E| dw $0000 ; 0x25
|02D770| dw $0000 ; 0x26
|02D772| dw $0000 ; 0x27
|02D774| dw $0000 ; 0x28
|02D776| dw $0000 ; 0x29
|02D778| dw $0000 ; 0x2A
|02D77A| dw $0000 ; 0x2B
|02D77C| dw $0000 ; 0x2C
|02D77E| dw $0000 ; 0x2D
|02D780| dw $0000 ; 0x2E
|02D782| dw $0000 ; 0x2F
|02D784| dw $0000 ; 0x30
|02D786| dw $0000 ; 0x31
|02D788| dw $0000 ; 0x32
|02D78A| dw $0000 ; 0x33
|02D78C| dw $0000 ; 0x34
|02D78E| dw $0000 ; 0x35
|02D790| dw $0000 ; 0x36
|02D792| dw $0000 ; 0x37
|02D794| dw $0000 ; 0x38
|02D796| dw $0000 ; 0x39
|02D798| dw $0000 ; 0x3A
|02D79A| dw $0000 ; 0x3B
|02D79C| dw $0000 ; 0x3C
|02D79E| dw $0000 ; 0x3D
|02D7A0| dw $0DE8 ; 0x3E
|02D7A2| dw $0B98 ; 0x3F
|02D7A4| dw $14CE ; 0x40
|02D7A6| dw $0000 ; 0x41
|02D7A8| dw $1C50 ; 0x42
|02D7AA| dw $FFFF ; 0x43
|02D7AC| dw $1466 ; 0x44
|02D7AE| dw $0000 ; 0x45
|02D7B0| dw $1AB6 ; 0x46
|02D7B2| dw $0B98 ; 0x47
|02D7B4| dw $1AB6 ; 0x48
|02D7B6| dw $040E ; 0x49
|02D7B8| dw $9C0C ; 0x4A
|02D7BA| dw $1530 ; 0x4B
|02D7BC| dw $0A98 ; 0x4C
|02D7BE| dw $0000 ; 0x4D
|02D7C0| dw $0000 ; 0x4E
|02D7C2| dw $0000 ; 0x4F
|02D7C4| dw $0000 ; 0x50
|02D7C6| dw $0000 ; 0x51
|02D7C8| dw $0000 ; 0x52
|02D7CA| dw $0816 ; 0x53
|02D7CC| dw $0DE8 ; 0x54
|02D7CE| dw $0000 ; 0x55
|02D7D0| dw $0000 ; 0x56
|02D7D2| dw $0AA8 ; 0x57
|02D7D4| dw $0000 ; 0x58
|02D7D6| dw $09AC ; 0x59
|02D7D8| dw $0000 ; 0x5A
|02D7DA| dw $0000 ; 0x5B
|02D7DC| dw $0000 ; 0x5C
|02D7DE| dw $0000 ; 0x5D
|02D7E0| dw $0000 ; 0x5E
|02D7E2| dw $0000 ; 0x5F
|02D7E4| dw $0000 ; 0x60
|02D7E6| dw $0000 ; 0x61
|02D7E8| dw $0000 ; 0x62
|02D7EA| dw $0000 ; 0x63
|02D7EC| dw $041A ; 0x64
|02D7EE| dw $0000 ; 0x65
|02D7F0| dw $091E ; 0x66
|02D7F2| dw $09AC ; 0x67
|02D7F4| dw $0000 ; 0x68
|02D7F6| dw $0000 ; 0x69
|02D7F8| dw $0000 ; 0x6A
|02D7FA| dw $07AA ; 0x6B
|02D7FC| dw $0000 ; 0x6C
|02D7FE| dw $0000 ; 0x6D
|02D800| dw $0000 ; 0x6E
|02D802| dw $0000 ; 0x6F
|02D804| dw $0000 ; 0x70
|02D806| dw $0000 ; 0x71
|02D808| dw $0000 ; 0x72
|02D80A| dw $0000 ; 0x73
|02D80C| dw $0000 ; 0x74
|02D80E| dw $0000 ; 0x75
|02D810| dw $0000 ; 0x76
|02D812| dw $0000 ; 0x77
|02D814| dw $0000 ; 0x78
|02D816| dw $0000 ; 0x79
|02D818| dw $0000 ; 0x7A
|02D81A| dw $0000 ; 0x7B
|02D81C| dw $0000 ; 0x7C
|02D81E| dw $0000 ; 0x7D
|02D820| dw $0000 ; 0x7E
|02D822| dw $0000 ; 0x7F
|02D824| dw $0000 ; 0x80
|02D826| dw $0000 ; 0x81
|02D828| dw $0000 ; 0x82
|02D82A| dw $0000 ; 0x83
|02D82C| dw $0000 ; 0x84

;---------------------------------------------------------------------------------------------------

.song
|02D82E| db $FF ; 0x00 - SONG FF
|02D82F| db $07 ; 0x01 - SONG 07
|02D830| db $14 ; 0x02 - SONG 14
|02D831| db $10 ; 0x03 - SONG 10
|02D832| db $10 ; 0x04 - SONG 10
|02D833| db $10 ; 0x05 - SONG 10
|02D834| db $12 ; 0x06 - SONG 12
|02D835| db $12 ; 0x07 - SONG 12
|02D836| db $11 ; 0x08 - SONG 11
|02D837| db $11 ; 0x09 - SONG 11
|02D838| db $11 ; 0x0A - SONG 11
|02D839| db $11 ; 0x0B - SONG 11
|02D83A| db $11 ; 0x0C - SONG 11
|02D83B| db $F2 ; 0x0D - SONG F2
|02D83C| db $F2 ; 0x0E - SONG F2
|02D83D| db $F2 ; 0x0F - SONG F2
|02D83E| db $F2 ; 0x10 - SONG F2
|02D83F| db $18 ; 0x11 - SONG 18
|02D840| db $1B ; 0x12 - SONG 1B
|02D841| db $12 ; 0x13 - SONG 12
|02D842| db $12 ; 0x14 - SONG 12
|02D843| db $16 ; 0x15 - SONG 16
|02D844| db $12 ; 0x16 - SONG 12
|02D845| db $12 ; 0x17 - SONG 12
|02D846| db $16 ; 0x18 - SONG 16
|02D847| db $16 ; 0x19 - SONG 16
|02D848| db $12 ; 0x1A - SONG 12
|02D849| db $12 ; 0x1B - SONG 12
|02D84A| db $12 ; 0x1C - SONG 12
|02D84B| db $12 ; 0x1D - SONG 12
|02D84C| db $12 ; 0x1E - SONG 12
|02D84D| db $12 ; 0x1F - SONG 12
|02D84E| db $12 ; 0x20 - SONG 12
|02D84F| db $12 ; 0x21 - SONG 12
|02D850| db $12 ; 0x22 - SONG 12
|02D851| db $12 ; 0x23 - SONG 12
|02D852| db $10 ; 0x24 - SONG 10
|02D853| db $16 ; 0x25 - SONG 16
|02D854| db $16 ; 0x26 - SONG 16
|02D855| db $16 ; 0x27 - SONG 16
|02D856| db $16 ; 0x28 - SONG 16
|02D857| db $16 ; 0x29 - SONG 16
|02D858| db $16 ; 0x2A - SONG 16
|02D859| db $16 ; 0x2B - SONG 16
|02D85A| db $18 ; 0x2C - SONG 18
|02D85B| db $16 ; 0x2D - SONG 16
|02D85C| db $12 ; 0x2E - SONG 12
|02D85D| db $12 ; 0x2F - SONG 12
|02D85E| db $12 ; 0x30 - SONG 12
|02D85F| db $12 ; 0x31 - SONG 12
|02D860| db $03 ; 0x32 - SONG 03
|02D861| db $11 ; 0x33 - SONG 11
|02D862| db $16 ; 0x34 - SONG 16
|02D863| db $16 ; 0x35 - SONG 16
|02D864| db $1C ; 0x36 - SONG 1C
|02D865| db $16 ; 0x37 - SONG 16
|02D866| db $1B ; 0x38 - SONG 1B
|02D867| db $12 ; 0x39 - SONG 12
|02D868| db $12 ; 0x3A - SONG 12
|02D869| db $12 ; 0x3B - SONG 12
|02D86A| db $0E ; 0x3C - SONG 0E
|02D86B| db $12 ; 0x3D - SONG 12
|02D86C| db $F2 ; 0x3E - SONG F2
|02D86D| db $F2 ; 0x3F - SONG F2
|02D86E| db $F2 ; 0x40 - SONG F2
|02D86F| db $12 ; 0x41 - SONG 12
|02D870| db $F2 ; 0x42 - SONG F2
|02D871| db $F2 ; 0x43 - SONG F2
|02D872| db $F2 ; 0x44 - SONG F2
|02D873| db $18 ; 0x45 - SONG 18
|02D874| db $17 ; 0x46 - SONG 17
|02D875| db $0E ; 0x47 - SONG 0E
|02D876| db $F2 ; 0x48 - SONG F2
|02D877| db $F2 ; 0x49 - SONG F2
|02D878| db $F2 ; 0x4A - SONG F2
|02D879| db $F2 ; 0x4B - SONG F2
|02D87A| db $F2 ; 0x4C - SONG F2
|02D87B| db $18 ; 0x4D - SONG 18
|02D87C| db $18 ; 0x4E - SONG 18
|02D87D| db $12 ; 0x4F - SONG 12
|02D87E| db $12 ; 0x50 - SONG 12
|02D87F| db $18 ; 0x51 - SONG 18
|02D880| db $18 ; 0x52 - SONG 18
|02D881| db $F2 ; 0x53 - SONG F2
|02D882| db $F2 ; 0x54 - SONG F2
|02D883| db $1B ; 0x55 - SONG 1B
|02D884| db $1B ; 0x56 - SONG 1B
|02D885| db $17 ; 0x57 - SONG 17
|02D886| db $12 ; 0x58 - SONG 12
|02D887| db $0E ; 0x59 - SONG 0E
|02D888| db $12 ; 0x5A - SONG 12
|02D889| db $18 ; 0x5B - SONG 18
|02D88A| db $18 ; 0x5C - SONG 18
|02D88B| db $18 ; 0x5D - SONG 18
|02D88C| db $1B ; 0x5E - SONG 1B
|02D88D| db $12 ; 0x5F - SONG 12
|02D88E| db $17 ; 0x60 - SONG 17
|02D88F| db $F2 ; 0x61 - SONG F2
|02D890| db $12 ; 0x62 - SONG 12
|02D891| db $18 ; 0x63 - SONG 18
|02D892| db $F2 ; 0x64 - SONG F2
|02D893| db $17 ; 0x65 - SONG 17
|02D894| db $17 ; 0x66 - SONG 17
|02D895| db $0E ; 0x67 - SONG 0E
|02D896| db $18 ; 0x68 - SONG 18
|02D897| db $12 ; 0x69 - SONG 12
|02D898| db $12 ; 0x6A - SONG 12
|02D899| db $F2 ; 0x6B - SONG F2
|02D89A| db $12 ; 0x6C - SONG 12
|02D89B| db $12 ; 0x6D - SONG 12
|02D89C| db $12 ; 0x6E - SONG 12
|02D89D| db $12 ; 0x6F - SONG 12
|02D89E| db $12 ; 0x70 - SONG 12
|02D89F| db $1B ; 0x71 - SONG 1B
|02D8A0| db $12 ; 0x72 - SONG 12
|02D8A1| db $FF ; 0x73 - SONG FF
|02D8A2| db $FF ; 0x74 - SONG FF
|02D8A3| db $FF ; 0x75 - SONG FF
|02D8A4| db $16 ; 0x76 - SONG 16
|02D8A5| db $16 ; 0x77 - SONG 16
|02D8A6| db $16 ; 0x78 - SONG 16
|02D8A7| db $16 ; 0x79 - SONG 16
|02D8A8| db $18 ; 0x7A - SONG 18
|02D8A9| db $15 ; 0x7B - SONG 15
|02D8AA| db $1B ; 0x7C - SONG 1B
|02D8AB| db $03 ; 0x7D - SONG 03
|02D8AC| db $18 ; 0x7E - SONG 18
|02D8AD| db $1B ; 0x7F - SONG 1B
|02D8AE| db $12 ; 0x80 - SONG 12
|02D8AF| db $10 ; 0x81 - SONG 10
|02D8B0| db $12 ; 0x82 - SONG 12
|02D8B1| db $12 ; 0x83 - SONG 12
|02D8B2| db $1B ; 0x84 - SONG 1B

;===================================================================================================

LoadUnderworldEntrance:
|02D8B3| PHB
|02D8B4| PHK
|02D8B5| PLB

|02D8B6| LDA.b #$01
|02D8B8| STA.b $1B

|02D8BA| LDA.w $010A
|02D8BD| BEQ .recache

|02D8BF| STZ.w $010A

|02D8C2| JMP.w .continue

;---------------------------------------------------------------------------------------------------

.recache
|02D8C5| REP #$20

|02D8C7| LDA.w $040A
|02D8CA| STA.l $7EC140

|02D8CE| LDA.b $1C
|02D8D0| STA.l $7EC142

|02D8D4| LDA.b $E8
|02D8D6| STA.l $7EC144

|02D8DA| LDA.b $E2
|02D8DC| STA.l $7EC146

|02D8E0| LDA.b $20
|02D8E2| STA.l $7EC148

|02D8E6| LDA.b $22
|02D8E8| STA.l $7EC14A

|02D8EC| LDA.w $0618
|02D8EF| STA.l $7EC150

|02D8F3| LDA.w $061C
|02D8F6| STA.l $7EC152

|02D8FA| LDA.b $8A
|02D8FC| STA.l $7EC14C

|02D900| LDA.b $84
|02D902| STA.l $7EC14E

|02D906| STZ.b $8A
|02D908| STZ.b $8C

|02D90A| LDA.w $0600
|02D90D| STA.l $7EC154

|02D911| LDA.w $0602
|02D914| STA.l $7EC156

|02D918| LDA.w $0604
|02D91B| STA.l $7EC158

|02D91F| LDA.w $0606
|02D922| STA.l $7EC15A

|02D926| LDA.w $0610
|02D929| STA.l $7EC15C

|02D92D| LDA.w $0612
|02D930| STA.l $7EC15E

|02D934| LDA.w $0614
|02D937| STA.l $7EC160

|02D93B| LDA.w $0616
|02D93E| STA.l $7EC162

|02D942| LDA.w $0624
|02D945| STA.l $7EC16A

|02D949| LDA.w $0626
|02D94C| STA.l $7EC16C

|02D950| LDA.w $0628
|02D953| STA.l $7EC16E

|02D957| LDA.w $062A
|02D95A| STA.l $7EC170

|02D95E| SEP #$20

|02D960| LDA.w $0AA0
|02D963| STA.l $7EC164

|02D967| LDA.w $0AA1
|02D96A| STA.l $7EC165

|02D96E| LDA.w $0AA2
|02D971| STA.l $7EC166

|02D975| LDA.w $0AA3
|02D978| STA.l $7EC167

;---------------------------------------------------------------------------------------------------

.continue
|02D97C| REP #$30

|02D97E| STZ.w $011A
|02D981| STZ.w $011C
|02D984| STZ.w $010A

|02D987| LDA.l $7EF3CC
|02D98B| CMP.w #$0004 ; FOLLOWER 04
|02D98E| BEQ .have_old_man

|02D990| LDA.w $04AA
|02D993| BEQ .not_a_respawn

.have_old_man
|02D995| JMP.w LoadSpawnEntrance

;---------------------------------------------------------------------------------------------------

.not_a_respawn
|02D998| LDA.w $010E
|02D99B| AND.w #$00FF

|02D99E| ASL A
|02D99F| TAX

|02D9A0| ASL A
|02D9A1| ASL A
|02D9A2| TAY

|02D9A3| LDA.w EntranceData.room_id,X
|02D9A6| STA.b $A0
|02D9A8| STA.w $048E

|02D9AB| LDA.w EntranceData.vertical_scroll,X
|02D9AE| STA.b $E8
|02D9B0| STA.b $E6
|02D9B2| STA.w $0122
|02D9B5| STA.w $0124

|02D9B8| LDA.w EntranceData.horizontal_scroll,X
|02D9BB| STA.b $E2
|02D9BD| STA.b $E0
|02D9BF| STA.w $011E
|02D9C2| STA.w $0120

|02D9C5| LDA.l $7EF3C5
|02D9C9| BEQ .skip_coordinates

|02D9CB| LDA.w EntranceData.y_coordinate,X
|02D9CE| STA.b $20

|02D9D0| LDA.w EntranceData.x_coordinate,X
|02D9D3| STA.b $22

;---------------------------------------------------------------------------------------------------

.skip_coordinates
|02D9D5| LDA.w EntranceData.camera_trigger_y,X
|02D9D8| STA.w $0618

|02D9DB| INC A
|02D9DC| INC A
|02D9DD| STA.w $061A

|02D9E0| LDA.w EntranceData.camera_trigger_x,X
|02D9E3| STA.w $061C

|02D9E6| INC A
|02D9E7| INC A
|02D9E8| STA.w $061E

|02D9EB| LDA.w #$01F8
|02D9EE| STA.b $EC

|02D9F0| LDA.w EntranceData.overworld_door_tilemap,X
|02D9F3| STA.w $0696
|02D9F6| STZ.w $0698

|02D9F9| LDA.w #$0000
|02D9FC| STA.w $0610

|02D9FF| LDA.w #$0110
|02DA02| STA.w $0612

|02DA05| LDA.w #$0000
|02DA08| STA.w $0614

|02DA0B| LDA.w #$0100
|02DA0E| STA.w $0616

|02DA11| LDA.w $010E
|02DA14| AND.w #$00FF
|02DA17| TAX

;---------------------------------------------------------------------------------------------------

|02DA18| SEP #$20

|02DA1A| LDA.w EntranceData.camera_scroll_boundaries+0,Y
|02DA1D| STA.w $0601

|02DA20| LDA.w EntranceData.camera_scroll_boundaries+1,Y
|02DA23| STA.w $0603

|02DA26| LDA.w EntranceData.camera_scroll_boundaries+2,Y
|02DA29| STA.w $0605

|02DA2C| LDA.w EntranceData.camera_scroll_boundaries+3,Y
|02DA2F| STA.w $0607

|02DA32| LDA.w EntranceData.camera_scroll_boundaries+4,Y
|02DA35| STA.w $0609

|02DA38| LDA.w EntranceData.camera_scroll_boundaries+5,Y
|02DA3B| STA.w $060B

|02DA3E| LDA.w EntranceData.camera_scroll_boundaries+6,Y
|02DA41| STA.w $060D

|02DA44| LDA.w EntranceData.camera_scroll_boundaries+7,Y
|02DA47| STA.w $060F

|02DA4A| STZ.w $0600
|02DA4D| STZ.w $0602

|02DA50| LDA.b #$10
|02DA52| STA.w $0604
|02DA55| STA.w $0606

|02DA58| STZ.w $0608
|02DA5B| STZ.w $060A
|02DA5E| STZ.w $060C
|02DA61| STZ.w $060E

;---------------------------------------------------------------------------------------------------

|02DA64| LDA.b #$02

|02DA66| CPX.w #$0000
|02DA69| BEQ .face_down

|02DA6B| CPX.w #$0043
|02DA6E| BEQ .face_down

|02DA70| LDA.b #$00

.face_down
|02DA72| STA.b $2F

|02DA74| LDA.w EntranceData.main_GFX,X
|02DA77| STA.w $0AA1

|02DA7A| LDA.w EntranceData.song,X
|02DA7D| STA.w $0132

|02DA80| CMP.b #$03 ; SONG 03
|02DA82| BNE .no_song_override

|02DA84| LDA.l $7EF3C5
|02DA88| CMP.b #$02
|02DA8A| BCC .no_song_override

|02DA8C| LDA.b #$12 ; SONG 12
|02DA8E| STA.w $0132

.no_song_override
|02DA91| LDA.w EntranceData.floor,X
|02DA94| STA.b $A4

|02DA96| LDA.w EntranceData.dungeon_id,X
|02DA99| STA.w $040C

|02DA9C| LDA.w EntranceData.in_door,X
|02DA9F| STA.b $6C

|02DAA1| LDA.w EntranceData.layer,X
|02DAA4| LSR A
|02DAA5| LSR A
|02DAA6| LSR A
|02DAA7| LSR A
|02DAA8| STA.b $EE

|02DAAA| LDA.w EntranceData.layer,X
|02DAAD| AND.b #$0F
|02DAAF| STA.w $0476

|02DAB2| LDA.w EntranceData.camera_scroll_controller,X
|02DAB5| LSR A
|02DAB6| LSR A
|02DAB7| LSR A
|02DAB8| LSR A
|02DAB9| STA.b $A6

|02DABB| LDA.w EntranceData.camera_scroll_controller,X
|02DABE| AND.b #$0F
|02DAC0| STA.b $A7

|02DAC2| LDA.w EntranceData.quadrant,X
|02DAC5| LSR A
|02DAC6| LSR A
|02DAC7| LSR A
|02DAC8| LSR A
|02DAC9| STA.b $A9

|02DACB| LDA.w EntranceData.quadrant,X
|02DACE| AND.b #$0F
|02DAD0| STA.b $AA

|02DAD2| LDX.b $A0
|02DAD4| CPX.w #$0100
|02DAD7| BCC PullBlocksTorchesFromROM

|02DAD9| STZ.b $A4

;===================================================================================================

PullBlocksTorchesFromROM:
|02DADB| LDA.b #$80
|02DADD| STA.b $45
|02DADF| STA.b $44

|02DAE1| LDA.b #$0F
|02DAE3| STA.b $42
|02DAE5| STA.b $43

|02DAE7| LDA.b #$FF
|02DAE9| STA.b $24
|02DAEB| STA.b $29

|02DAED| SEP #$30

|02DAEF| PLB
|02DAF0| PHB

|02DAF1| LDA.b #$7E
|02DAF3| PHA
|02DAF4| PLB

;---------------------------------------------------------------------------------------------------

|02DAF5| REP #$20

|02DAF7| LDX.b #$00

.next_block_torch
|02DAF9| LDA.l PushableBlocks+0*128,X
|02DAFD| STA.w $7EF940,X

|02DB00| LDA.l PushableBlocks+1*128,X
|02DB04| STA.w $7EF9C0,X

|02DB07| LDA.l PushableBlocks+2*128,X
|02DB0B| STA.w $7EFA40,X

|02DB0E| LDA.l PushableBlocks+3*128,X
|02DB12| STA.w $7EFAC0,X

|02DB15| LDA.l LightableTorches+0*128,X
|02DB19| STA.w $7EFB40,X

|02DB1C| LDA.l LightableTorches+1*128,X
|02DB20| STA.w $7EFBC0,X

|02DB23| LDA.l LightableTorches+2*128,X
|02DB27| STA.w $7EFC40,X

|02DB2A| INX
|02DB2B| INX
|02DB2C| CPX.b #$80
|02DB2E| BNE .next_block_torch

;===================================================================================================

ResetPotTracking:
|02DB30| LDX.b #$3E
|02DB32| LDA.w #$0000

.next_pot
|02DB35| STA.w $7EF800,X
|02DB38| STA.w $7EF840,X
|02DB3B| STA.w $7EF880,X
|02DB3E| STA.w $7EF8C0,X

|02DB41| STA.w $7EF580,X
|02DB44| STA.w $7EF5C0,X
|02DB47| STA.w $7EF600,X
|02DB4A| STA.w $7EF640,X
|02DB4D| STA.w $7EF680,X

|02DB50| STA.w $7EF6C0,X
|02DB53| STA.w $7EF700,X
|02DB56| STA.w $7EF740,X
|02DB59| STA.w $7EF780,X
|02DB5C| STA.w $7EF7C0,X

|02DB5F| DEX
|02DB60| DEX
|02DB61| BPL .next_pot

;---------------------------------------------------------------------------------------------------

|02DB63| STA.l $7EC172

|02DB67| STZ.w $04BC

|02DB6A| SEP #$30

|02DB6C| PLB

|02DB6D| RTS

;===================================================================================================

SpawnPointData:

.room_id
|02DB6E| dw $0104 ; 0x00 - Link's house   - ROOM 0104
|02DB70| dw $0012 ; 0x01 - Sanctuary      - ROOM 0012
|02DB72| dw $0080 ; 0x02 - Prison         - ROOM 0080
|02DB74| dw $0055 ; 0x03 - Uncle          - ROOM 0055
|02DB76| dw $0051 ; 0x04 - Throne         - ROOM 0051
|02DB78| dw $00F0 ; 0x05 - Old man cave   - ROOM 00F0
|02DB7A| dw $00E4 ; 0x06 - Old man home   - ROOM 00E4

;---------------------------------------------------------------------------------------------------

.camera_scroll_boundaries
|02DB7C| db $21, $20, $21, $21, $09, $09, $09, $0A ; 0x00 - Link's house
|02DB84| db $02, $02, $02, $03, $04, $04, $04, $05 ; 0x01 - Sanctuary
|02DB8C| db $10, $10, $10, $11, $01, $00, $01, $01 ; 0x02 - Prison
|02DB94| db $0A, $0A, $0A, $0B, $0B, $0A, $0B, $0B ; 0x03 - Uncle
|02DB9C| db $0A, $0A, $0A, $0B, $02, $02, $02, $03 ; 0x04 - Throne
|02DBA4| db $1E, $1E, $1E, $1F, $01, $00, $01, $01 ; 0x05 - Old man cave
|02DBAC| db $1D, $1C, $1D, $1D, $08, $08, $08, $09 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.horizontal_scroll
|02DBB4| dw $0900 ; 0x00 - Link's house
|02DBB6| dw $0480 ; 0x01 - Sanctuary
|02DBB8| dw $00DB ; 0x02 - Prison
|02DBBA| dw $0A8E ; 0x03 - Uncle
|02DBBC| dw $0280 ; 0x04 - Throne
|02DBBE| dw $0100 ; 0x05 - Old man cave
|02DBC0| dw $0800 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.vertical_scroll
|02DBC2| dw $2110 ; 0x00 - Link's house
|02DBC4| dw $0231 ; 0x01 - Sanctuary
|02DBC6| dw $1000 ; 0x02 - Prison
|02DBC8| dw $0A03 ; 0x03 - Uncle
|02DBCA| dw $0A22 ; 0x04 - Throne
|02DBCC| dw $1E8C ; 0x05 - Old man cave
|02DBCE| dw $1D10 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.y_coordinate
|02DBD0| dw $2178 ; 0x00 - Link's house
|02DBD2| dw $029C ; 0x01 - Sanctuary
|02DBD4| dw $1041 ; 0x02 - Prison
|02DBD6| dw $0A70 ; 0x03 - Uncle
|02DBD8| dw $0A8F ; 0x04 - Throne
|02DBDA| dw $1EF8 ; 0x05 - Old man cave
|02DBDC| dw $1D98 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.x_coordinate
|02DBDE| dw $0978 ; 0x00 - Link's house
|02DBE0| dw $04F8 ; 0x01 - Sanctuary
|02DBE2| dw $0160 ; 0x02 - Prison
|02DBE4| dw $0B06 ; 0x03 - Uncle
|02DBE6| dw $02F8 ; 0x04 - Throne
|02DBE8| dw $01A8 ; 0x05 - Old man cave
|02DBEA| dw $0878 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.camera_trigger_y
|02DBEC| dw $017F ; 0x00 - Link's house
|02DBEE| dw $00A7 ; 0x01 - Sanctuary
|02DBF0| dw $0083 ; 0x02 - Prison
|02DBF2| dw $007B ; 0x03 - Uncle
|02DBF4| dw $009A ; 0x04 - Throne
|02DBF6| dw $0103 ; 0x05 - Old man cave
|02DBF8| dw $0187 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.camera_trigger_x
|02DBFA| dw $017F ; 0x00 - Link's house
|02DBFC| dw $00FF ; 0x01 - Sanctuary
|02DBFE| dw $0167 ; 0x02 - Prison
|02DC00| dw $010D ; 0x03 - Uncle
|02DC02| dw $00FF ; 0x04 - Throne
|02DC04| dw $017F ; 0x05 - Old man cave
|02DC06| dw $007F ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.main_GFX
|02DC08| db $03 ; 0x00 - Link's house
|02DC09| db $04 ; 0x01 - Sanctuary
|02DC0A| db $04 ; 0x02 - Prison
|02DC0B| db $01 ; 0x03 - Uncle
|02DC0C| db $04 ; 0x04 - Throne
|02DC0D| db $06 ; 0x05 - Old man cave
|02DC0E| db $14 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.floor
|02DC0F| db $00 ; 0x00 - Link's house
|02DC10| db $00 ; 0x01 - Sanctuary
|02DC11| db $FD ; 0x02 - Prison
|02DC12| db $FF ; 0x03 - Uncle
|02DC13| db $01 ; 0x04 - Throne
|02DC14| db $00 ; 0x05 - Old man cave
|02DC15| db $00 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.dungeon_id
|02DC16| db $FF ; 0x00 - Link's house
|02DC17| db $00 ; 0x01 - Sanctuary
|02DC18| db $02 ; 0x02 - Prison
|02DC19| db $FF ; 0x03 - Uncle
|02DC1A| db $02 ; 0x04 - Throne
|02DC1B| db $FF ; 0x05 - Old man cave
|02DC1C| db $FF ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.layer
|02DC1D| db $00 ; 0x00 - Link's house
|02DC1E| db $00 ; 0x01 - Sanctuary
|02DC1F| db $00 ; 0x02 - Prison
|02DC20| db $01 ; 0x03 - Uncle
|02DC21| db $00 ; 0x04 - Throne
|02DC22| db $00 ; 0x05 - Old man cave
|02DC23| db $01 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.camera_scroll_controller
|02DC24| db $00 ; 0x00 - Link's house
|02DC25| db $22 ; 0x01 - Sanctuary
|02DC26| db $20 ; 0x02 - Prison
|02DC27| db $20 ; 0x03 - Uncle
|02DC28| db $22 ; 0x04 - Throne
|02DC29| db $22 ; 0x05 - Old man cave
|02DC2A| db $02 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.quadrant
|02DC2B| db $02 ; 0x00 - Link's house
|02DC2C| db $00 ; 0x01 - Sanctuary
|02DC2D| db $10 ; 0x02 - Prison
|02DC2E| db $10 ; 0x03 - Uncle
|02DC2F| db $00 ; 0x04 - Throne
|02DC30| db $10 ; 0x05 - Old man cave
|02DC31| db $02 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.overworld_door_tilemap
|02DC32| dw $0816 ; 0x00 - Link's house
|02DC34| dw $0000 ; 0x01 - Sanctuary
|02DC36| dw $0000 ; 0x02 - Prison
|02DC38| dw $0000 ; 0x03 - Uncle
|02DC3A| dw $0000 ; 0x04 - Throne
|02DC3C| dw $0000 ; 0x05 - Old man cave
|02DC3E| dw $0000 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.entrance_id
|02DC40| dw $0000 ; 0x00 - Link's house
|02DC42| dw $0002 ; 0x01 - Sanctuary
|02DC44| dw $0002 ; 0x02 - Prison
|02DC46| dw $0032 ; 0x03 - Uncle
|02DC48| dw $0004 ; 0x04 - Throne
|02DC4A| dw $0006 ; 0x05 - Old man cave
|02DC4C| dw $0030 ; 0x06 - Old man home

;---------------------------------------------------------------------------------------------------

.song
|02DC4E| db $07 ; 0x00 - Link's house - SONG 07
|02DC4F| db $14 ; 0x01 - Sanctuary    - SONG 14
|02DC50| db $10 ; 0x02 - Prison       - SONG 10
|02DC51| db $03 ; 0x03 - Uncle        - SONG 03
|02DC52| db $10 ; 0x04 - Throne       - SONG 10
|02DC53| db $12 ; 0x05 - Old man cave - SONG 12
|02DC54| db $12 ; 0x06 - Old man home - SONG 12

;===================================================================================================

LoadSpawnEntrance:
|02DC55| LDA.l $7EF3C8
|02DC59| AND.w #$00FF
|02DC5C| ASL A
|02DC5D| TAX

|02DC5E| ASL A
|02DC5F| ASL A
|02DC60| TAY

|02DC61| LDA.w SpawnPointData.entrance_id,X
|02DC64| STA.w $010E

|02DC67| LDA.w SpawnPointData.room_id,X
|02DC6A| STA.b $A0
|02DC6C| STA.w $048E

|02DC6F| LDA.w SpawnPointData.vertical_scroll,X
|02DC72| STA.b $E8
|02DC74| STA.b $E6
|02DC76| STA.w $0122
|02DC79| STA.w $0124

|02DC7C| LDA.w SpawnPointData.horizontal_scroll,X
|02DC7F| STA.b $E2
|02DC81| STA.b $E0
|02DC83| STA.w $011E
|02DC86| STA.w $0120

|02DC89| LDA.l $7EF3C5
|02DC8D| BEQ .skip_coordinates

|02DC8F| LDA.w SpawnPointData.y_coordinate,X
|02DC92| STA.b $20

|02DC94| LDA.w SpawnPointData.x_coordinate,X
|02DC97| STA.b $22

;---------------------------------------------------------------------------------------------------

.skip_coordinates
|02DC99| LDA.w SpawnPointData.camera_trigger_y,X
|02DC9C| STA.w $0618

|02DC9F| INC A
|02DCA0| INC A
|02DCA1| STA.w $061A

|02DCA4| LDA.w SpawnPointData.camera_trigger_x,X
|02DCA7| STA.w $061C

|02DCAA| INC A
|02DCAB| INC A
|02DCAC| STA.w $061E

|02DCAF| LDA.w #$01F8
|02DCB2| STA.b $EC

|02DCB4| LDA.w SpawnPointData.overworld_door_tilemap,X
|02DCB7| STA.w $0696

|02DCBA| LDA.w #$0000
|02DCBD| STA.w $0610

|02DCC0| LDA.w #$0110
|02DCC3| STA.w $0612

|02DCC6| LDA.w #$0000
|02DCC9| STA.w $0614

|02DCCC| LDA.w #$0100
|02DCCF| STA.w $0616

;---------------------------------------------------------------------------------------------------

|02DCD2| LDA.l $7EF3C8
|02DCD6| AND.w #$00FF
|02DCD9| TAX

|02DCDA| SEP #$20

|02DCDC| LDA.w SpawnPointData.camera_scroll_boundaries+0,Y
|02DCDF| STA.w $0601

|02DCE2| LDA.w SpawnPointData.camera_scroll_boundaries+1,Y
|02DCE5| STA.w $0603

|02DCE8| LDA.w SpawnPointData.camera_scroll_boundaries+2,Y
|02DCEB| STA.w $0605

|02DCEE| LDA.w SpawnPointData.camera_scroll_boundaries+3,Y
|02DCF1| STA.w $0607

|02DCF4| LDA.w SpawnPointData.camera_scroll_boundaries+4,Y
|02DCF7| STA.w $0609

|02DCFA| LDA.w SpawnPointData.camera_scroll_boundaries+5,Y
|02DCFD| STA.w $060B

|02DD00| LDA.w SpawnPointData.camera_scroll_boundaries+6,Y
|02DD03| STA.w $060D

|02DD06| LDA.w SpawnPointData.camera_scroll_boundaries+7,Y
|02DD09| STA.w $060F

|02DD0C| STZ.w $0600
|02DD0F| STZ.w $0602

|02DD12| LDA.b #$10
|02DD14| STA.w $0604
|02DD17| STA.w $0606

|02DD1A| STZ.w $0608
|02DD1D| STZ.w $060A
|02DD20| STZ.w $060C
|02DD23| STZ.w $060E

;---------------------------------------------------------------------------------------------------

|02DD26| LDA.b #$02
|02DD28| STA.b $2F

|02DD2A| LDA.w SpawnPointData.main_GFX,X
|02DD2D| STA.w $0AA1

|02DD30| LDA.w SpawnPointData.floor,X
|02DD33| STA.b $A4

|02DD35| LDA.w SpawnPointData.dungeon_id,X
|02DD38| STA.w $040C

|02DD3B| STZ.b $6C

|02DD3D| LDA.w SpawnPointData.layer,X
|02DD40| LSR A
|02DD41| LSR A
|02DD42| LSR A
|02DD43| LSR A
|02DD44| STA.b $EE

|02DD46| LDA.w SpawnPointData.layer,X
|02DD49| AND.b #$0F
|02DD4B| STA.w $0476

|02DD4E| LDA.w SpawnPointData.camera_scroll_controller,X
|02DD51| LSR A
|02DD52| LSR A
|02DD53| LSR A
|02DD54| LSR A
|02DD55| STA.b $A6

|02DD57| LDA.w SpawnPointData.camera_scroll_controller,X
|02DD5A| AND.b #$0F
|02DD5C| STA.b $A7

|02DD5E| LDA.w SpawnPointData.quadrant,X
|02DD61| LSR A
|02DD62| LSR A
|02DD63| LSR A
|02DD64| LSR A
|02DD65| STA.b $A9

|02DD67| LDA.w SpawnPointData.quadrant,X
|02DD6A| AND.b #$0F
|02DD6C| STA.b $AA

;---------------------------------------------------------------------------------------------------

|02DD6E| LDA.w SpawnPointData.song,X
|02DD71| STA.w $0132

|02DD74| CPX.w #$0000
|02DD77| BNE .dont_lower_song_volume

|02DD79| LDA.l $7EF3C5
|02DD7D| BNE .dont_lower_song_volume

|02DD7F| LDA.b #$FF ; SONG FF - transfer
|02DD81| STA.w $0132

.dont_lower_song_volume
|02DD84| STZ.w $04AA

|02DD87| JMP.w PullBlocksTorchesFromROM

;===================================================================================================

UnderworldExitData:

.room_id
|02DD8A| dw $0104 ; 0x00
|02DD8C| dw $0012 ; 0x01
|02DD8E| dw $0060 ; 0x02
|02DD90| dw $0061 ; 0x03
|02DD92| dw $0062 ; 0x04
|02DD94| dw $FFFF ; 0x05
|02DD96| dw $0020 ; 0x06
|02DD98| dw $00F0 ; 0x07
|02DD9A| dw $00F1 ; 0x08
|02DD9C| dw $00C9 ; 0x09
|02DD9E| dw $0084 ; 0x0A
|02DDA0| dw $0085 ; 0x0B
|02DDA2| dw $0083 ; 0x0C
|02DDA4| dw $0063 ; 0x0D
|02DDA6| dw $00F2 ; 0x0E
|02DDA8| dw $00F3 ; 0x0F
|02DDAA| dw $00F4 ; 0x10
|02DDAC| dw $00F5 ; 0x11
|02DDAE| dw $00E3 ; 0x12
|02DDB0| dw $00E2 ; 0x13
|02DDB2| dw $00F8 ; 0x14
|02DDB4| dw $00E8 ; 0x15
|02DDB6| dw $0023 ; 0x16
|02DDB8| dw $00FB ; 0x17
|02DDBA| dw $00EB ; 0x18
|02DDBC| dw $00D5 ; 0x19
|02DDBE| dw $0024 ; 0x1A
|02DDC0| dw $00FD ; 0x1B
|02DDC2| dw $00ED ; 0x1C
|02DDC4| dw $00FE ; 0x1D
|02DDC6| dw $00EE ; 0x1E
|02DDC8| dw $00FF ; 0x1F
|02DDCA| dw $00EF ; 0x20
|02DDCC| dw $00DF ; 0x21
|02DDCE| dw $00F9 ; 0x22
|02DDD0| dw $00FA ; 0x23
|02DDD2| dw $00EA ; 0x24
|02DDD4| dw $00E0 ; 0x25
|02DDD6| dw $0028 ; 0x26
|02DDD8| dw $004A ; 0x27
|02DDDA| dw $0098 ; 0x28
|02DDDC| dw $0056 ; 0x29
|02DDDE| dw $0057 ; 0x2A
|02DDE0| dw $0058 ; 0x2B
|02DDE2| dw $0059 ; 0x2C
|02DDE4| dw $0077 ; 0x2D
|02DDE6| dw $000E ; 0x2E
|02DDE8| dw $00E6 ; 0x2F
|02DDEA| dw $00E7 ; 0x30
|02DDEC| dw $00E4 ; 0x31
|02DDEE| dw $00E5 ; 0x32
|02DDF0| dw $0055 ; 0x33
|02DDF2| dw $00D6 ; 0x34
|02DDF4| dw $00DB ; 0x35
|02DDF6| dw $00E1 ; 0x36
|02DDF8| dw $0010 ; 0x37
|02DDFA| dw $000C ; 0x38
|02DDFC| dw $0008 ; 0x39
|02DDFE| dw $002F ; 0x3A
|02DE00| dw $003C ; 0x3B
|02DE02| dw $002C ; 0x3C
|02DE04| dw $0003 ; 0x3D
|02DE06| dw $1000 ; 0x3E
|02DE08| dw $1002 ; 0x3F
|02DE0A| dw $1004 ; 0x40
|02DE0C| dw $1006 ; 0x41
|02DE0E| dw $1008 ; 0x42
|02DE10| dw $100A ; 0x43
|02DE12| dw $100C ; 0x44
|02DE14| dw $100E ; 0x45
|02DE16| dw $1010 ; 0x46
|02DE18| dw $1012 ; 0x47
|02DE1A| dw $1014 ; 0x48
|02DE1C| dw $1016 ; 0x49
|02DE1E| dw $1018 ; 0x4A
|02DE20| dw $0180 ; 0x4B
|02DE22| dw $0181 ; 0x4C
|02DE24| dw $0182 ; 0x4D
|02DE26| dw $0189 ; 0x4E

;---------------------------------------------------------------------------------------------------

.overworld_id
|02DE28| db $2C ; 0x00
|02DE29| db $13 ; 0x01
|02DE2A| db $1B ; 0x02
|02DE2B| db $1B ; 0x03
|02DE2C| db $1B ; 0x04
|02DE2D| db $0F ; 0x05
|02DE2E| db $5B ; 0x06
|02DE2F| db $0A ; 0x07
|02DE30| db $03 ; 0x08
|02DE31| db $1E ; 0x09
|02DE32| db $30 ; 0x0A
|02DE33| db $30 ; 0x0B
|02DE34| db $30 ; 0x0C
|02DE35| db $30 ; 0x0D
|02DE36| db $18 ; 0x0E
|02DE37| db $18 ; 0x0F
|02DE38| db $28 ; 0x10
|02DE39| db $29 ; 0x11
|02DE3A| db $22 ; 0x12
|02DE3B| db $02 ; 0x13
|02DE3C| db $45 ; 0x14
|02DE3D| db $45 ; 0x15
|02DE3E| db $45 ; 0x16
|02DE3F| db $4A ; 0x17
|02DE40| db $4A ; 0x18
|02DE41| db $45 ; 0x19
|02DE42| db $45 ; 0x1A
|02DE43| db $05 ; 0x1B
|02DE44| db $05 ; 0x1C
|02DE45| db $05 ; 0x1D
|02DE46| db $05 ; 0x1E
|02DE47| db $05 ; 0x1F
|02DE48| db $05 ; 0x20
|02DE49| db $05 ; 0x21
|02DE4A| db $03 ; 0x22
|02DE4B| db $03 ; 0x23
|02DE4C| db $03 ; 0x24
|02DE4D| db $1B ; 0x25
|02DE4E| db $7B ; 0x26
|02DE4F| db $5E ; 0x27
|02DE50| db $70 ; 0x28
|02DE51| db $40 ; 0x29
|02DE52| db $40 ; 0x2A
|02DE53| db $40 ; 0x2B
|02DE54| db $40 ; 0x2C
|02DE55| db $03 ; 0x2D
|02DE56| db $75 ; 0x2E
|02DE57| db $0A ; 0x2F
|02DE58| db $03 ; 0x30
|02DE59| db $03 ; 0x31
|02DE5A| db $03 ; 0x32
|02DE5B| db $1B ; 0x33
|02DE5C| db $47 ; 0x34
|02DE5D| db $58 ; 0x35
|02DE5E| db $00 ; 0x36
|02DE5F| db $5B ; 0x37
|02DE60| db $43 ; 0x38
|02DE61| db $15 ; 0x39
|02DE62| db $18 ; 0x3A
|02DE63| db $45 ; 0x3B
|02DE64| db $45 ; 0x3C
|02DE65| db $2C ; 0x3D
|02DE66| db $1B ; 0x3E
|02DE67| db $18 ; 0x3F
|02DE68| db $03 ; 0x40
|02DE69| db $2C ; 0x41
|02DE6A| db $05 ; 0x42
|02DE6B| db $02 ; 0x43
|02DE6C| db $1E ; 0x44
|02DE6D| db $18 ; 0x45
|02DE6E| db $81 ; 0x46
|02DE6F| db $30 ; 0x47
|02DE70| db $16 ; 0x48
|02DE71| db $2A ; 0x49
|02DE72| db $00 ; 0x4A
|02DE73| db $80 ; 0x4B
|02DE74| db $80 ; 0x4C
|02DE75| db $81 ; 0x4D
|02DE76| db $88 ; 0x4E

;---------------------------------------------------------------------------------------------------

.exit_vram_addr
|02DE77| dw $0506 ; 0x00
|02DE79| dw $001C ; 0x01
|02DE7B| dw $0016 ; 0x02
|02DE7D| dw $0530 ; 0x03
|02DE7F| dw $004A ; 0x04
|02DE81| dw $001C ; 0x05
|02DE83| dw $002E ; 0x06
|02DE85| dw $03A0 ; 0x07
|02DE87| dw $1402 ; 0x08
|02DE89| dw $005A ; 0x09
|02DE8B| dw $0314 ; 0x0A
|02DE8D| dw $02A8 ; 0x0B
|02DE8F| dw $0280 ; 0x0C
|02DE91| dw $0016 ; 0x0D
|02DE93| dw $02BC ; 0x0E
|02DE95| dw $02C4 ; 0x0F
|02DE97| dw $08A0 ; 0x10
|02DE99| dw $0880 ; 0x11
|02DE9B| dw $0412 ; 0x12
|02DE9D| dw $0118 ; 0x13
|02DE9F| dw $0EE0 ; 0x14
|02DEA1| dw $0460 ; 0x15
|02DEA3| dw $07CA ; 0x16
|02DEA5| dw $03A0 ; 0x17
|02DEA7| dw $00A0 ; 0x18
|02DEA9| dw $0AD4 ; 0x19
|02DEAB| dw $07E0 ; 0x1A
|02DEAD| dw $0DD4 ; 0x1B
|02DEAF| dw $0AD4 ; 0x1C
|02DEB1| dw $0CCA ; 0x1D
|02DEB3| dw $07C8 ; 0x1E
|02DEB5| dw $0EE0 ; 0x1F
|02DEB7| dw $17E0 ; 0x20
|02DEB9| dw $0460 ; 0x21
|02DEBB| dw $0D9C ; 0x22
|02DEBD| dw $0EAC ; 0x23
|02DEBF| dw $092C ; 0x24
|02DEC1| dw $0032 ; 0x25
|02DEC3| dw $049E ; 0x26
|02DEC5| dw $005A ; 0x27
|02DEC7| dw $0414 ; 0x28
|02DEC9| dw $0C8E ; 0x29
|02DECB| dw $0EB8 ; 0x2A
|02DECD| dw $0F4C ; 0x2B
|02DECF| dw $0282 ; 0x2C
|02DED1| dw $0050 ; 0x2D
|02DED3| dw $0BC6 ; 0x2E
|02DED5| dw $00A0 ; 0x2F
|02DED7| dw $0D82 ; 0x30
|02DED9| dw $181A ; 0x31
|02DEDB| dw $10C6 ; 0x32
|02DEDD| dw $044A ; 0x33
|02DEDF| dw $0712 ; 0x34
|02DEE1| dw $0B2E ; 0x35
|02DEE3| dw $0F4E ; 0x36
|02DEE5| dw $0B0E ; 0x37
|02DEE7| dw $0052 ; 0x38
|02DEE9| dw $0088 ; 0x39
|02DEEB| dw $0386 ; 0x3A
|02DEED| dw $04DA ; 0x3B
|02DEEF| dw $004C ; 0x3C
|02DEF1| dw $0506 ; 0x3D
|02DEF3| dw $1230 ; 0x3E
|02DEF5| dw $0448 ; 0x3F
|02DEF7| dw $0050 ; 0x40
|02DEF9| dw $009A ; 0x41
|02DEFB| dw $034E ; 0x42
|02DEFD| dw $049A ; 0x43
|02DEFF| dw $07C0 ; 0x44
|02DF01| dw $1100 ; 0x45
|02DF03| dw $0040 ; 0x46
|02DF05| dw $0916 ; 0x47
|02DF07| dw $000A ; 0x48
|02DF09| dw $0910 ; 0x49
|02DF0B| dw $0A3A ; 0x4A
|02DF0D| dw $0000 ; 0x4B
|02DF0F| dw $0020 ; 0x4C
|02DF11| dw $1782 ; 0x4D
|02DF13| dw $0000 ; 0x4E

;---------------------------------------------------------------------------------------------------

.vertical_scroll
|02DF15| dw $0A9A ; 0x00
|02DF17| dw $0400 ; 0x01
|02DF19| dw $0600 ; 0x02
|02DF1B| dw $0692 ; 0x03
|02DF1D| dw $0600 ; 0x04
|02DF1F| dw $0200 ; 0x05
|02DF21| dw $0600 ; 0x06
|02DF23| dw $0264 ; 0x07
|02DF25| dw $0294 ; 0x08
|02DF27| dw $0600 ; 0x09
|02DF29| dw $0C56 ; 0x0A
|02DF2B| dw $0C4A ; 0x0B
|02DF2D| dw $0C46 ; 0x0C
|02DF2F| dw $0C00 ; 0x0D
|02DF31| dw $064C ; 0x0E
|02DF33| dw $064A ; 0x0F
|02DF35| dw $0B06 ; 0x10
|02DF37| dw $0B07 ; 0x11
|02DF39| dw $087A ; 0x12
|02DF3B| dw $0015 ; 0x13
|02DF3D| dw $01E4 ; 0x14
|02DF3F| dw $0093 ; 0x15
|02DF41| dw $0103 ; 0x16
|02DF43| dw $0263 ; 0x17
|02DF45| dw $020A ; 0x18
|02DF47| dw $0164 ; 0x19
|02DF49| dw $0103 ; 0x1A
|02DF4B| dw $01C4 ; 0x1B
|02DF4D| dw $0163 ; 0x1C
|02DF4F| dw $01A3 ; 0x1D
|02DF51| dw $0108 ; 0x1E
|02DF53| dw $01E3 ; 0x1F
|02DF55| dw $0304 ; 0x20
|02DF57| dw $0093 ; 0x21
|02DF59| dw $01C3 ; 0x22
|02DF5B| dw $01E3 ; 0x23
|02DF5D| dw $0133 ; 0x24
|02DF5F| dw $0600 ; 0x25
|02DF61| dw $0E8C ; 0x26
|02DF63| dw $0600 ; 0x27
|02DF65| dw $0C79 ; 0x28
|02DF67| dw $01A6 ; 0x29
|02DF69| dw $01E6 ; 0x2A
|02DF6B| dw $01F6 ; 0x2B
|02DF6D| dw $0066 ; 0x2C
|02DF6F| dw $0014 ; 0x2D
|02DF71| dw $0D6A ; 0x2E
|02DF73| dw $0205 ; 0x2F
|02DF75| dw $01C4 ; 0x30
|02DF77| dw $031E ; 0x31
|02DF79| dw $0224 ; 0x32
|02DF7B| dw $067A ; 0x33
|02DF7D| dw $00DA ; 0x34
|02DF7F| dw $075A ; 0x35
|02DF81| dw $01F6 ; 0x36
|02DF83| dw $075A ; 0x37
|02DF85| dw $0000 ; 0x38
|02DF87| dw $0400 ; 0x39
|02DF89| dw $0665 ; 0x3A
|02DF8B| dw $00A3 ; 0x3B
|02DF8D| dw $0000 ; 0x3C
|02DF8F| dw $0A9A ; 0x3D
|02DF91| dw $0842 ; 0x3E
|02DF93| dw $0674 ; 0x3F
|02DF95| dw $0000 ; 0x40
|02DF97| dw $0A0B ; 0x41
|02DF99| dw $005C ; 0x42
|02DF9B| dw $0089 ; 0x43
|02DF9D| dw $06E4 ; 0x44
|02DF9F| dw $0826 ; 0x45
|02DFA1| dw $0010 ; 0x46
|02DFA3| dw $0D20 ; 0x47
|02DFA5| dw $0400 ; 0x48
|02DFA7| dw $0B1E ; 0x49
|02DFA9| dw $016A ; 0x4A
|02DFAB| dw $0120 ; 0x4B
|02DFAD| dw $0000 ; 0x4C
|02DFAF| dw $0320 ; 0x4D
|02DFB1| dw $0000 ; 0x4E

;---------------------------------------------------------------------------------------------------

.horizontal_scroll
|02DFB3| dw $0832 ; 0x00
|02DFB5| dw $06DE ; 0x01
|02DFB7| dw $06AE ; 0x02
|02DFB9| dw $0784 ; 0x03
|02DFBB| dw $0856 ; 0x04
|02DFBD| dw $0EE2 ; 0x05
|02DFBF| dw $0778 ; 0x06
|02DFC1| dw $0500 ; 0x07
|02DFC3| dw $0604 ; 0x08
|02DFC5| dw $0ED6 ; 0x09
|02DFC7| dw $00A6 ; 0x0A
|02DFC9| dw $0142 ; 0x0B
|02DFCB| dw $0003 ; 0x0C
|02DFCD| dw $00A2 ; 0x0D
|02DFCF| dw $01E2 ; 0x0E
|02DFD1| dw $0222 ; 0x0F
|02DFD3| dw $0100 ; 0x10
|02DFD5| dw $0200 ; 0x11
|02DFD7| dw $048E ; 0x12
|02DFD9| dw $04C6 ; 0x13
|02DFDB| dw $0D00 ; 0x14
|02DFDD| dw $0D00 ; 0x15
|02DFDF| dw $0C46 ; 0x16
|02DFE1| dw $0500 ; 0x17
|02DFE3| dw $0500 ; 0x18
|02DFE5| dw $0CA6 ; 0x19
|02DFE7| dw $0D00 ; 0x1A
|02DFE9| dw $0CA6 ; 0x1B
|02DFEB| dw $0CA6 ; 0x1C
|02DFED| dw $0C56 ; 0x1D
|02DFEF| dw $0C46 ; 0x1E
|02DFF1| dw $0D00 ; 0x1F
|02DFF3| dw $0D00 ; 0x20
|02DFF5| dw $0D00 ; 0x21
|02DFF7| dw $06D4 ; 0x22
|02DFF9| dw $0754 ; 0x23
|02DFFB| dw $0754 ; 0x24
|02DFFD| dw $0784 ; 0x25
|02DFFF| dw $06F2 ; 0x26
|02E001| dw $0ED6 ; 0x27
|02E003| dw $00A6 ; 0x28
|02E005| dw $0062 ; 0x29
|02E007| dw $01C2 ; 0x2A
|02E009| dw $0262 ; 0x2B
|02E00B| dw $0016 ; 0x2C
|02E00D| dw $087C ; 0x2D
|02E00F| dw $0C3E ; 0x2E
|02E011| dw $0500 ; 0x2F
|02E013| dw $0600 ; 0x30
|02E015| dw $06B4 ; 0x31
|02E017| dw $0814 ; 0x32
|02E019| dw $0854 ; 0x33
|02E01B| dw $0E96 ; 0x34
|02E01D| dw $0176 ; 0x35
|02E01F| dw $0262 ; 0x36
|02E021| dw $0674 ; 0x37
|02E023| dw $0884 ; 0x38
|02E025| dw $0A36 ; 0x39
|02E027| dw $0032 ; 0x3A
|02E029| dw $0CD6 ; 0x3B
|02E02B| dw $0C56 ; 0x3C
|02E02D| dw $0832 ; 0x3D
|02E02F| dw $077F ; 0x3E
|02E031| dw $024B ; 0x3F
|02E033| dw $0878 ; 0x40
|02E035| dw $08D7 ; 0x41
|02E037| dw $0C6D ; 0x42
|02E039| dw $04CF ; 0x43
|02E03B| dw $0DFE ; 0x44
|02E03D| dw $0001 ; 0x45
|02E03F| dw $0401 ; 0x46
|02E041| dw $00AA ; 0x47
|02E043| dw $0C57 ; 0x48
|02E045| dw $0478 ; 0x49
|02E047| dw $01CF ; 0x4A
|02E049| dw $0000 ; 0x4B
|02E04B| dw $0100 ; 0x4C
|02E04D| dw $021E ; 0x4D
|02E04F| dw $0000 ; 0x4E

;---------------------------------------------------------------------------------------------------

.y_coordinate
|02E051| dw $0AE8 ; 0x00
|02E053| dw $0414 ; 0x01
|02E055| dw $0604 ; 0x02
|02E057| dw $06CC ; 0x03
|02E059| dw $0604 ; 0x04
|02E05B| dw $0203 ; 0x05
|02E05D| dw $065C ; 0x06
|02E05F| dw $02B8 ; 0x07
|02E061| dw $02E8 ; 0x08
|02E063| dw $0618 ; 0x09
|02E065| dw $0CA8 ; 0x0A
|02E067| dw $0C98 ; 0x0B
|02E069| dw $0C98 ; 0x0C
|02E06B| dw $0C28 ; 0x0D
|02E06D| dw $0698 ; 0x0E
|02E06F| dw $0698 ; 0x0F
|02E071| dw $0B58 ; 0x10
|02E073| dw $0B58 ; 0x11
|02E075| dw $08C8 ; 0x12
|02E077| dw $0067 ; 0x13
|02E079| dw $0238 ; 0x14
|02E07B| dw $00E7 ; 0x15
|02E07D| dw $0157 ; 0x16
|02E07F| dw $02B7 ; 0x17
|02E081| dw $0258 ; 0x18
|02E083| dw $01B8 ; 0x19
|02E085| dw $0157 ; 0x1A
|02E087| dw $0218 ; 0x1B
|02E089| dw $01B7 ; 0x1C
|02E08B| dw $01F7 ; 0x1D
|02E08D| dw $0158 ; 0x1E
|02E08F| dw $0237 ; 0x1F
|02E091| dw $0358 ; 0x20
|02E093| dw $00E7 ; 0x21
|02E095| dw $0217 ; 0x22
|02E097| dw $0237 ; 0x23
|02E099| dw $0187 ; 0x24
|02E09B| dw $0634 ; 0x25
|02E09D| dw $0ED8 ; 0x26
|02E09F| dw $0628 ; 0x27
|02E0A1| dw $0CC7 ; 0x28
|02E0A3| dw $01F8 ; 0x29
|02E0A5| dw $0238 ; 0x2A
|02E0A7| dw $0248 ; 0x2B
|02E0A9| dw $00B8 ; 0x2C
|02E0AB| dw $0068 ; 0x2D
|02E0AD| dw $0DB8 ; 0x2E
|02E0AF| dw $0257 ; 0x2F
|02E0B1| dw $0218 ; 0x30
|02E0B3| dw $03A7 ; 0x31
|02E0B5| dw $0278 ; 0x32
|02E0B7| dw $06C8 ; 0x33
|02E0B9| dw $0128 ; 0x34
|02E0BB| dw $07A8 ; 0x35
|02E0BD| dw $0248 ; 0x36
|02E0BF| dw $07A8 ; 0x37
|02E0C1| dw $0028 ; 0x38
|02E0C3| dw $0448 ; 0x39
|02E0C5| dw $06B7 ; 0x3A
|02E0C7| dw $0107 ; 0x3B
|02E0C9| dw $0038 ; 0x3C
|02E0CB| dw $0AE8 ; 0x3D
|02E0CD| dw $0890 ; 0x3E
|02E0CF| dw $06C2 ; 0x3F
|02E0D1| dw $004D ; 0x40
|02E0D3| dw $0A59 ; 0x41
|02E0D5| dw $00AA ; 0x42
|02E0D7| dw $00DB ; 0x43
|02E0D9| dw $0732 ; 0x44
|02E0DB| dw $0874 ; 0x45
|02E0DD| dw $006E ; 0x46
|02E0DF| dw $0D72 ; 0x47
|02E0E1| dw $044D ; 0x48
|02E0E3| dw $0B72 ; 0x49
|02E0E5| dw $01BE ; 0x4A
|02E0E7| dw $01E8 ; 0x4B
|02E0E9| dw $0080 ; 0x4C
|02E0EB| dw $03E8 ; 0x4D
|02E0ED| dw $0100 ; 0x4E

;---------------------------------------------------------------------------------------------------

.x_coordinate
|02E0EF| dw $08B8 ; 0x00
|02E0F1| dw $0758 ; 0x01
|02E0F3| dw $0728 ; 0x02
|02E0F5| dw $07F8 ; 0x03
|02E0F7| dw $08C8 ; 0x04
|02E0F9| dw $0F50 ; 0x05
|02E0FB| dw $07F0 ; 0x06
|02E0FD| dw $05A8 ; 0x07
|02E0FF| dw $0678 ; 0x08
|02E101| dw $0F50 ; 0x09
|02E103| dw $0128 ; 0x0A
|02E105| dw $01C8 ; 0x0B
|02E107| dw $0088 ; 0x0C
|02E109| dw $0128 ; 0x0D
|02E10B| dw $0268 ; 0x0E
|02E10D| dw $02A8 ; 0x0F
|02E10F| dw $01B8 ; 0x10
|02E111| dw $0238 ; 0x11
|02E113| dw $0508 ; 0x12
|02E115| dw $0548 ; 0x13
|02E117| dw $0D78 ; 0x14
|02E119| dw $0DB8 ; 0x15
|02E11B| dw $0CB8 ; 0x16
|02E11D| dw $05A8 ; 0x17
|02E11F| dw $05B8 ; 0x18
|02E121| dw $0D18 ; 0x19
|02E123| dw $0D78 ; 0x1A
|02E125| dw $0D18 ; 0x1B
|02E127| dw $0D18 ; 0x1C
|02E129| dw $0CC8 ; 0x1D
|02E12B| dw $0CB8 ; 0x1E
|02E12D| dw $0DA8 ; 0x1F
|02E12F| dw $0DC8 ; 0x20
|02E131| dw $0DB8 ; 0x21
|02E133| dw $0748 ; 0x22
|02E135| dw $07C8 ; 0x23
|02E137| dw $07C8 ; 0x24
|02E139| dw $07F8 ; 0x25
|02E13B| dw $0778 ; 0x26
|02E13D| dw $0F50 ; 0x27
|02E13F| dw $0128 ; 0x28
|02E141| dw $00E8 ; 0x29
|02E143| dw $0248 ; 0x2A
|02E145| dw $02E8 ; 0x2B
|02E147| dw $0098 ; 0x2C
|02E149| dw $08F0 ; 0x2D
|02E14B| dw $0CB8 ; 0x2E
|02E14D| dw $05B8 ; 0x2F
|02E14F| dw $0648 ; 0x30
|02E151| dw $0728 ; 0x31
|02E153| dw $0888 ; 0x32
|02E155| dw $08C8 ; 0x33
|02E157| dw $0F08 ; 0x34
|02E159| dw $01F8 ; 0x35
|02E15B| dw $02E8 ; 0x36
|02E15D| dw $06E8 ; 0x37
|02E15F| dw $08F8 ; 0x38
|02E161| dw $0AA8 ; 0x39
|02E163| dw $00B8 ; 0x3A
|02E165| dw $0D48 ; 0x3B
|02E167| dw $0CC8 ; 0x3C
|02E169| dw $08B8 ; 0x3D
|02E16B| dw $07F3 ; 0x3E
|02E16D| dw $02CD ; 0x3F
|02E16F| dw $08E6 ; 0x40
|02E171| dw $094F ; 0x41
|02E173| dw $0CDF ; 0x42
|02E175| dw $0551 ; 0x43
|02E177| dw $0E7C ; 0x44
|02E179| dw $0083 ; 0x45
|02E17B| dw $047D ; 0x46
|02E17D| dw $0130 ; 0x47
|02E17F| dw $0CD1 ; 0x48
|02E181| dw $04FE ; 0x49
|02E183| dw $0255 ; 0x4A
|02E185| dw $0080 ; 0x4B
|02E187| dw $01F0 ; 0x4C
|02E189| dw $029E ; 0x4D
|02E18B| dw $0080 ; 0x4E

;---------------------------------------------------------------------------------------------------

.camera_trigger_y
|02E18D| dw $0B07 ; 0x00
|02E18F| dw $046D ; 0x01
|02E191| dw $066D ; 0x02
|02E193| dw $06FF ; 0x03
|02E195| dw $066D ; 0x04
|02E197| dw $026D ; 0x05
|02E199| dw $066D ; 0x06
|02E19B| dw $02D3 ; 0x07
|02E19D| dw $0303 ; 0x08
|02E19F| dw $066D ; 0x09
|02E1A1| dw $0CC3 ; 0x0A
|02E1A3| dw $0CB7 ; 0x0B
|02E1A5| dw $0CB3 ; 0x0C
|02E1A7| dw $0C6D ; 0x0D
|02E1A9| dw $06B9 ; 0x0E
|02E1AB| dw $06B7 ; 0x0F
|02E1AD| dw $0B73 ; 0x10
|02E1AF| dw $0B74 ; 0x11
|02E1B1| dw $08E7 ; 0x12
|02E1B3| dw $0082 ; 0x13
|02E1B5| dw $0253 ; 0x14
|02E1B7| dw $0102 ; 0x15
|02E1B9| dw $0172 ; 0x16
|02E1BB| dw $02D2 ; 0x17
|02E1BD| dw $0277 ; 0x18
|02E1BF| dw $01D3 ; 0x19
|02E1C1| dw $0172 ; 0x1A
|02E1C3| dw $0233 ; 0x1B
|02E1C5| dw $01D2 ; 0x1C
|02E1C7| dw $0212 ; 0x1D
|02E1C9| dw $0177 ; 0x1E
|02E1CB| dw $0252 ; 0x1F
|02E1CD| dw $0373 ; 0x20
|02E1CF| dw $0102 ; 0x21
|02E1D1| dw $0232 ; 0x22
|02E1D3| dw $0252 ; 0x23
|02E1D5| dw $01A2 ; 0x24
|02E1D7| dw $066D ; 0x25
|02E1D9| dw $0EF9 ; 0x26
|02E1DB| dw $066D ; 0x27
|02E1DD| dw $0CE6 ; 0x28
|02E1DF| dw $0213 ; 0x29
|02E1E1| dw $0253 ; 0x2A
|02E1E3| dw $0263 ; 0x2B
|02E1E5| dw $00D3 ; 0x2C
|02E1E7| dw $0083 ; 0x2D
|02E1E9| dw $0DD7 ; 0x2E
|02E1EB| dw $0272 ; 0x2F
|02E1ED| dw $0233 ; 0x30
|02E1EF| dw $038D ; 0x31
|02E1F1| dw $0293 ; 0x32
|02E1F3| dw $06E7 ; 0x33
|02E1F5| dw $0147 ; 0x34
|02E1F7| dw $07C7 ; 0x35
|02E1F9| dw $0263 ; 0x36
|02E1FB| dw $07C7 ; 0x37
|02E1FD| dw $006F ; 0x38
|02E1FF| dw $046F ; 0x39
|02E201| dw $06D2 ; 0x3A
|02E203| dw $0112 ; 0x3B
|02E205| dw $006F ; 0x3C
|02E207| dw $0B07 ; 0x3D
|02E209| dw $08AF ; 0x3E
|02E20B| dw $06E1 ; 0x3F
|02E20D| dw $006D ; 0x40
|02E20F| dw $0A78 ; 0x41
|02E211| dw $00C9 ; 0x42
|02E213| dw $00F6 ; 0x43
|02E215| dw $0751 ; 0x44
|02E217| dw $0893 ; 0x45
|02E219| dw $008D ; 0x46
|02E21B| dw $0D8D ; 0x47
|02E21D| dw $046D ; 0x48
|02E21F| dw $0B8D ; 0x49
|02E221| dw $01D9 ; 0x4A
|02E223| dw $019D ; 0x4B
|02E225| dw $008F ; 0x4C
|02E227| dw $039D ; 0x4D
|02E229| dw $009D ; 0x4E

;---------------------------------------------------------------------------------------------------

.camera_trigger_x
|02E22B| dw $08BF ; 0x00
|02E22D| dw $0763 ; 0x01
|02E22F| dw $0733 ; 0x02
|02E231| dw $0803 ; 0x03
|02E233| dw $08D3 ; 0x04
|02E235| dw $0F57 ; 0x05
|02E237| dw $07F7 ; 0x06
|02E239| dw $058D ; 0x07
|02E23B| dw $0683 ; 0x08
|02E23D| dw $0F5B ; 0x09
|02E23F| dw $0133 ; 0x0A
|02E241| dw $01CF ; 0x0B
|02E243| dw $0090 ; 0x0C
|02E245| dw $012F ; 0x0D
|02E247| dw $026F ; 0x0E
|02E249| dw $02AF ; 0x0F
|02E24B| dw $018D ; 0x10
|02E24D| dw $028D ; 0x11
|02E24F| dw $0513 ; 0x12
|02E251| dw $0553 ; 0x13
|02E253| dw $0D7D ; 0x14
|02E255| dw $0D7D ; 0x15
|02E257| dw $0CC3 ; 0x16
|02E259| dw $058D ; 0x17
|02E25B| dw $058D ; 0x18
|02E25D| dw $0D23 ; 0x19
|02E25F| dw $0D7D ; 0x1A
|02E261| dw $0D23 ; 0x1B
|02E263| dw $0D23 ; 0x1C
|02E265| dw $0CD3 ; 0x1D
|02E267| dw $0CC3 ; 0x1E
|02E269| dw $0D7D ; 0x1F
|02E26B| dw $0D7D ; 0x20
|02E26D| dw $0D7D ; 0x21
|02E26F| dw $0753 ; 0x22
|02E271| dw $07D3 ; 0x23
|02E273| dw $07D3 ; 0x24
|02E275| dw $0803 ; 0x25
|02E277| dw $077F ; 0x26
|02E279| dw $0F5B ; 0x27
|02E27B| dw $0133 ; 0x28
|02E27D| dw $00EF ; 0x29
|02E27F| dw $024F ; 0x2A
|02E281| dw $02EF ; 0x2B
|02E283| dw $00A3 ; 0x2C
|02E285| dw $08FB ; 0x2D
|02E287| dw $0CC3 ; 0x2E
|02E289| dw $058D ; 0x2F
|02E28B| dw $067F ; 0x30
|02E28D| dw $0733 ; 0x31
|02E28F| dw $0893 ; 0x32
|02E291| dw $08D3 ; 0x33
|02E293| dw $0F13 ; 0x34
|02E295| dw $0203 ; 0x35
|02E297| dw $02EF ; 0x36
|02E299| dw $06F3 ; 0x37
|02E29B| dw $0903 ; 0x38
|02E29D| dw $0AB3 ; 0x39
|02E29F| dw $00BF ; 0x3A
|02E2A1| dw $0D53 ; 0x3B
|02E2A3| dw $0CD3 ; 0x3C
|02E2A5| dw $08BF ; 0x3D
|02E2A7| dw $07FE ; 0x3E
|02E2A9| dw $02D8 ; 0x3F
|02E2AB| dw $08ED ; 0x40
|02E2AD| dw $0956 ; 0x41
|02E2AF| dw $0CEA ; 0x42
|02E2B1| dw $055C ; 0x43
|02E2B3| dw $0E83 ; 0x44
|02E2B5| dw $008E ; 0x45
|02E2B7| dw $0484 ; 0x46
|02E2B9| dw $0137 ; 0x47
|02E2BB| dw $0CDC ; 0x48
|02E2BD| dw $0505 ; 0x49
|02E2BF| dw $025C ; 0x4A
|02E2C1| dw $0083 ; 0x4B
|02E2C3| dw $018D ; 0x4C
|02E2C5| dw $02A1 ; 0x4D
|02E2C7| dw $0083 ; 0x4E

;---------------------------------------------------------------------------------------------------

.scroll_mod_y
|02E2C9| db $06 ; 0x00
|02E2CA| db $00 ; 0x01
|02E2CB| db $00 ; 0x02
|02E2CC| db $0E ; 0x03
|02E2CD| db $00 ; 0x04
|02E2CE| db $00 ; 0x05
|02E2CF| db $00 ; 0x06
|02E2D0| db $0A ; 0x07
|02E2D1| db $0A ; 0x08
|02E2D2| db $00 ; 0x09
|02E2D3| db $0A ; 0x0A
|02E2D4| db $06 ; 0x0B
|02E2D5| db $0A ; 0x0C
|02E2D6| db $00 ; 0x0D
|02E2D7| db $04 ; 0x0E
|02E2D8| db $06 ; 0x0F
|02E2D9| db $0A ; 0x10
|02E2DA| db $09 ; 0x11
|02E2DB| db $06 ; 0x12
|02E2DC| db $0B ; 0x13
|02E2DD| db $0A ; 0x14
|02E2DE| db $0B ; 0x15
|02E2DF| db $0B ; 0x16
|02E2E0| db $0B ; 0x17
|02E2E1| db $06 ; 0x18
|02E2E2| db $0A ; 0x19
|02E2E3| db $0B ; 0x1A
|02E2E4| db $0A ; 0x1B
|02E2E5| db $0B ; 0x1C
|02E2E6| db $0B ; 0x1D
|02E2E7| db $06 ; 0x1E
|02E2E8| db $0B ; 0x1F
|02E2E9| db $0A ; 0x20
|02E2EA| db $0B ; 0x21
|02E2EB| db $0B ; 0x22
|02E2EC| db $0B ; 0x23
|02E2ED| db $0B ; 0x24
|02E2EE| db $00 ; 0x25
|02E2EF| db $04 ; 0x26
|02E2F0| db $00 ; 0x27
|02E2F1| db $07 ; 0x28
|02E2F2| db $0A ; 0x29
|02E2F3| db $0A ; 0x2A
|02E2F4| db $0A ; 0x2B
|02E2F5| db $0A ; 0x2C
|02E2F6| db $0A ; 0x2D
|02E2F7| db $06 ; 0x2E
|02E2F8| db $0B ; 0x2F
|02E2F9| db $0A ; 0x30
|02E2FA| db $00 ; 0x31
|02E2FB| db $0A ; 0x32
|02E2FC| db $06 ; 0x33
|02E2FD| db $06 ; 0x34
|02E2FE| db $06 ; 0x35
|02E2FF| db $0A ; 0x36
|02E300| db $06 ; 0x37
|02E301| db $00 ; 0x38
|02E302| db $00 ; 0x39
|02E303| db $0B ; 0x3A
|02E304| db $0B ; 0x3B
|02E305| db $00 ; 0x3C
|02E306| db $06 ; 0x3D
|02E307| db $FE ; 0x3E
|02E308| db $0C ; 0x3F
|02E309| db $00 ; 0x40
|02E30A| db $05 ; 0x41
|02E30B| db $04 ; 0x42
|02E30C| db $01 ; 0x43
|02E30D| db $07 ; 0x44
|02E30E| db $FA ; 0x45
|02E30F| db $00 ; 0x46
|02E310| db $00 ; 0x47
|02E311| db $00 ; 0x48
|02E312| db $00 ; 0x49
|02E313| db $F4 ; 0x4A
|02E314| db $00 ; 0x4B
|02E315| db $00 ; 0x4C
|02E316| db $00 ; 0x4D
|02E317| db $00 ; 0x4E

;---------------------------------------------------------------------------------------------------

.scroll_mod_x
|02E318| db $FE ; 0x00
|02E319| db $02 ; 0x01
|02E31A| db $02 ; 0x02
|02E31B| db $FA ; 0x03
|02E31C| db $FA ; 0x04
|02E31D| db $FE ; 0x05
|02E31E| db $F8 ; 0x06
|02E31F| db $00 ; 0x07
|02E320| db $FC ; 0x08
|02E321| db $FA ; 0x09
|02E322| db $FA ; 0x0A
|02E323| db $FE ; 0x0B
|02E324| db $FD ; 0x0C
|02E325| db $0E ; 0x0D
|02E326| db $FE ; 0x0E
|02E327| db $FE ; 0x0F
|02E328| db $00 ; 0x10
|02E329| db $00 ; 0x11
|02E32A| db $02 ; 0x12
|02E32B| db $FA ; 0x13
|02E32C| db $00 ; 0x14
|02E32D| db $00 ; 0x15
|02E32E| db $0A ; 0x16
|02E32F| db $00 ; 0x17
|02E330| db $00 ; 0x18
|02E331| db $FA ; 0x19
|02E332| db $00 ; 0x1A
|02E333| db $FA ; 0x1B
|02E334| db $FA ; 0x1C
|02E335| db $FA ; 0x1D
|02E336| db $FA ; 0x1E
|02E337| db $00 ; 0x1F
|02E338| db $00 ; 0x20
|02E339| db $00 ; 0x21
|02E33A| db $FC ; 0x22
|02E33B| db $FC ; 0x23
|02E33C| db $FC ; 0x24
|02E33D| db $0A ; 0x25
|02E33E| db $FE ; 0x26
|02E33F| db $FA ; 0x27
|02E340| db $FA ; 0x28
|02E341| db $0E ; 0x29
|02E342| db $FE ; 0x2A
|02E343| db $FE ; 0x2B
|02E344| db $FA ; 0x2C
|02E345| db $F4 ; 0x2D
|02E346| db $F2 ; 0x2E
|02E347| db $00 ; 0x2F
|02E348| db $00 ; 0x30
|02E349| db $0C ; 0x31
|02E34A| db $0C ; 0x32
|02E34B| db $FA ; 0x33
|02E34C| db $FA ; 0x34
|02E34D| db $FA ; 0x35
|02E34E| db $0E ; 0x36
|02E34F| db $FA ; 0x37
|02E350| db $FC ; 0x38
|02E351| db $0A ; 0x39
|02E352| db $FE ; 0x3A
|02E353| db $FA ; 0x3B
|02E354| db $0A ; 0x3C
|02E355| db $FE ; 0x3D
|02E356| db $FF ; 0x3E
|02E357| db $F5 ; 0x3F
|02E358| db $08 ; 0x40
|02E359| db $F9 ; 0x41
|02E35A| db $03 ; 0x42
|02E35B| db $01 ; 0x43
|02E35C| db $02 ; 0x44
|02E35D| db $FF ; 0x45
|02E35E| db $FF ; 0x46
|02E35F| db $06 ; 0x47
|02E360| db $F9 ; 0x48
|02E361| db $08 ; 0x49
|02E362| db $01 ; 0x4A
|02E363| db $00 ; 0x4B
|02E364| db $00 ; 0x4C
|02E365| db $F2 ; 0x4D
|02E366| db $00 ; 0x4E

;---------------------------------------------------------------------------------------------------

.door_graphic
|02E367| dw $0816 ; 0x00
|02E369| dw $0000 ; 0x01
|02E36B| dw $0000 ; 0x02
|02E36D| dw $0000 ; 0x03
|02E36F| dw $0000 ; 0x04
|02E371| dw $0000 ; 0x05
|02E373| dw $0000 ; 0x06
|02E375| dw $0000 ; 0x07
|02E377| dw $0000 ; 0x08
|02E379| dw $0000 ; 0x09
|02E37B| dw $0000 ; 0x0A
|02E37D| dw $0000 ; 0x0B
|02E37F| dw $0000 ; 0x0C
|02E381| dw $0000 ; 0x0D
|02E383| dw $05CC ; 0x0E
|02E385| dw $05D4 ; 0x0F
|02E387| dw $0BB6 ; 0x10
|02E389| dw $0B86 ; 0x11
|02E38B| dw $0000 ; 0x12
|02E38D| dw $0000 ; 0x13
|02E38F| dw $0000 ; 0x14
|02E391| dw $0000 ; 0x15
|02E393| dw $0000 ; 0x16
|02E395| dw $0000 ; 0x17
|02E397| dw $0000 ; 0x18
|02E399| dw $0000 ; 0x19
|02E39B| dw $0000 ; 0x1A
|02E39D| dw $0000 ; 0x1B
|02E39F| dw $0000 ; 0x1C
|02E3A1| dw $0000 ; 0x1D
|02E3A3| dw $0000 ; 0x1E
|02E3A5| dw $0000 ; 0x1F
|02E3A7| dw $0000 ; 0x20
|02E3A9| dw $0000 ; 0x21
|02E3AB| dw $0000 ; 0x22
|02E3AD| dw $0000 ; 0x23
|02E3AF| dw $0000 ; 0x24
|02E3B1| dw $0000 ; 0x25
|02E3B3| dw $0000 ; 0x26
|02E3B5| dw $0000 ; 0x27
|02E3B7| dw $0000 ; 0x28
|02E3B9| dw $0000 ; 0x29
|02E3BB| dw $0000 ; 0x2A
|02E3BD| dw $0000 ; 0x2B
|02E3BF| dw $0000 ; 0x2C
|02E3C1| dw $0000 ; 0x2D
|02E3C3| dw $0000 ; 0x2E
|02E3C5| dw $0000 ; 0x2F
|02E3C7| dw $0000 ; 0x30
|02E3C9| dw $0000 ; 0x31
|02E3CB| dw $0000 ; 0x32
|02E3CD| dw $0000 ; 0x33
|02E3CF| dw $0000 ; 0x34
|02E3D1| dw $0000 ; 0x35
|02E3D3| dw $0000 ; 0x36
|02E3D5| dw $0000 ; 0x37
|02E3D7| dw $0000 ; 0x38
|02E3D9| dw $0000 ; 0x39
|02E3DB| dw $0000 ; 0x3A
|02E3DD| dw $0000 ; 0x3B
|02E3DF| dw $0000 ; 0x3C
|02E3E1| dw $0816 ; 0x3D
|02E3E3| dw $0000 ; 0x3E
|02E3E5| dw $0000 ; 0x3F
|02E3E7| dw $0000 ; 0x40
|02E3E9| dw $0000 ; 0x41
|02E3EB| dw $0000 ; 0x42
|02E3ED| dw $0000 ; 0x43
|02E3EF| dw $0000 ; 0x44
|02E3F1| dw $0000 ; 0x45
|02E3F3| dw $0000 ; 0x46
|02E3F5| dw $0000 ; 0x47
|02E3F7| dw $0000 ; 0x48
|02E3F9| dw $0000 ; 0x49
|02E3FB| dw $0000 ; 0x4A
|02E3FD| dw $0000 ; 0x4B
|02E3FF| dw $0000 ; 0x4C
|02E401| dw $0000 ; 0x4D
|02E403| dw $0000 ; 0x4E

;---------------------------------------------------------------------------------------------------

.door_graphic_location
|02E405| dw $0000 ; 0x00
|02E407| dw $01AA ; 0x01
|02E409| dw $8124 ; 0x02
|02E40B| dw $87BE ; 0x03
|02E40D| dw $8158 ; 0x04
|02E40F| dw $0000 ; 0x05
|02E411| dw $0000 ; 0x06
|02E413| dw $0000 ; 0x07
|02E415| dw $0000 ; 0x08
|02E417| dw $0000 ; 0x09
|02E419| dw $0000 ; 0x0A
|02E41B| dw $0000 ; 0x0B
|02E41D| dw $0000 ; 0x0C
|02E41F| dw $0000 ; 0x0D
|02E421| dw $0000 ; 0x0E
|02E423| dw $0000 ; 0x0F
|02E425| dw $0000 ; 0x10
|02E427| dw $0000 ; 0x11
|02E429| dw $0000 ; 0x12
|02E42B| dw $0000 ; 0x13
|02E42D| dw $0000 ; 0x14
|02E42F| dw $0000 ; 0x15
|02E431| dw $0000 ; 0x16
|02E433| dw $0000 ; 0x17
|02E435| dw $0000 ; 0x18
|02E437| dw $0000 ; 0x19
|02E439| dw $0000 ; 0x1A
|02E43B| dw $0000 ; 0x1B
|02E43D| dw $0000 ; 0x1C
|02E43F| dw $0000 ; 0x1D
|02E441| dw $0000 ; 0x1E
|02E443| dw $0000 ; 0x1F
|02E445| dw $0000 ; 0x20
|02E447| dw $0000 ; 0x21
|02E449| dw $0000 ; 0x22
|02E44B| dw $0000 ; 0x23
|02E44D| dw $0000 ; 0x24
|02E44F| dw $82BE ; 0x25
|02E451| dw $0000 ; 0x26
|02E453| dw $0000 ; 0x27
|02E455| dw $0000 ; 0x28
|02E457| dw $0000 ; 0x29
|02E459| dw $0000 ; 0x2A
|02E45B| dw $0000 ; 0x2B
|02E45D| dw $0000 ; 0x2C
|02E45F| dw $0000 ; 0x2D
|02E461| dw $0000 ; 0x2E
|02E463| dw $0000 ; 0x2F
|02E465| dw $0000 ; 0x30
|02E467| dw $0000 ; 0x31
|02E469| dw $0000 ; 0x32
|02E46B| dw $0000 ; 0x33
|02E46D| dw $0000 ; 0x34
|02E46F| dw $0000 ; 0x35
|02E471| dw $0000 ; 0x36
|02E473| dw $0000 ; 0x37
|02E475| dw $0000 ; 0x38
|02E477| dw $0000 ; 0x39
|02E479| dw $0000 ; 0x3A
|02E47B| dw $0000 ; 0x3B
|02E47D| dw $0000 ; 0x3C
|02E47F| dw $0000 ; 0x3D
|02E481| dw $0000 ; 0x3E
|02E483| dw $0000 ; 0x3F
|02E485| dw $0000 ; 0x40
|02E487| dw $0000 ; 0x41
|02E489| dw $0000 ; 0x42
|02E48B| dw $0000 ; 0x43
|02E48D| dw $0000 ; 0x44
|02E48F| dw $0000 ; 0x45
|02E491| dw $0000 ; 0x46
|02E493| dw $0000 ; 0x47
|02E495| dw $0000 ; 0x48
|02E497| dw $0000 ; 0x49
|02E499| dw $0000 ; 0x4A
|02E49B| dw $0000 ; 0x4B
|02E49D| dw $0000 ; 0x4C
|02E49F| dw $0000 ; 0x4D
|02E4A1| dw $0000 ; 0x4E

;===================================================================================================

LoadOverworldFromUnderworld:
|02E4A3| PHB
|02E4A4| PHK
|02E4A5| PLB

|02E4A6| STZ.b $1B
|02E4A8| STZ.w $0458

|02E4AB| REP #$20

|02E4AD| LDA.w #$0000
|02E4B0| STA.l $7EC017

|02E4B4| LDA.w #$00FF
|02E4B7| STA.w $040C

|02E4BA| STZ.w $04AC

|02E4BD| LDA.b $A0
|02E4BF| CMP.w #$0104 ; ROOM 0104
|02E4C2| BEQ .custom_exit

|02E4C4| CMP.w #$0180 ; SPOW
|02E4C7| BCS .custom_exit

|02E4C9| CMP.w #$0100
|02E4CC| BCC .custom_exit

|02E4CE| JSR LoadCachedEntranceProperties

|02E4D1| JMP.w LoadOverworldScreenProperties_pre

.custom_exit
|02E4D4| LDX.b #$9E

.next_room_check
|02E4D6| DEX
|02E4D7| DEX

|02E4D8| CMP.w UnderworldExitData.room_id,X
|02E4DB| BNE .next_room_check

;---------------------------------------------------------------------------------------------------

|02E4DD| LDA.w UnderworldExitData.vertical_scroll,X
|02E4E0| STA.b $E6
|02E4E2| STA.b $E8
|02E4E4| STA.w $0122
|02E4E7| STA.w $0124

|02E4EA| LDA.w UnderworldExitData.horizontal_scroll,X
|02E4ED| STA.b $E0
|02E4EF| STA.b $E2
|02E4F1| STA.w $011E
|02E4F4| STA.w $0120

|02E4F7| LDA.w UnderworldExitData.y_coordinate,X
|02E4FA| STA.b $20

|02E4FC| LDA.w UnderworldExitData.x_coordinate,X
|02E4FF| STA.b $22

;---------------------------------------------------------------------------------------------------

|02E501| LDA.w UnderworldExitData.exit_vram_addr,X
|02E504| STA.b $84

|02E506| SEC
|02E507| SBC.w #$0400
|02E50A| AND.w #$0F80
|02E50D| ASL A
|02E50E| XBA
|02E50F| STA.b $88

|02E511| LDA.b $84
|02E513| SEC
|02E514| SBC.w #$0010
|02E517| AND.w #$003E
|02E51A| LSR A
|02E51B| STA.b $86

|02E51D| LDA.w UnderworldExitData.camera_trigger_y,X
|02E520| STA.w $0618

|02E523| DEC A
|02E524| DEC A
|02E525| STA.w $061A

|02E528| LDA.w UnderworldExitData.camera_trigger_x,X
|02E52B| STA.w $061C

|02E52E| DEC A
|02E52F| DEC A
|02E530| STA.w $061E

;---------------------------------------------------------------------------------------------------

|02E533| LDA.w #$0002
|02E536| STA.b $2F

|02E538| LDA.w UnderworldExitData.door_graphic,X
|02E53B| STA.w $0696

|02E53E| LDA.w UnderworldExitData.door_graphic_location,X
|02E541| STA.w $0698

|02E544| TXA
|02E545| LSR A
|02E546| TAX

|02E547| SEP #$20

|02E549| LDA.w UnderworldExitData.overworld_id,X
|02E54C| STA.b $8A
|02E54E| STA.w $040A

|02E551| STZ.b $8B
|02E553| STZ.w $040B

|02E556| LDA.w UnderworldExitData.scroll_mod_y,X
|02E559| STA.w $0624
|02E55C| STZ.w $0625

|02E55F| ASL A
|02E560| BCC .positive_camera_y

|02E562| DEC.w $0625

.positive_camera_y
|02E565| LDA.w UnderworldExitData.scroll_mod_x,X
|02E568| STA.w $0628
|02E56B| STZ.w $0629

|02E56E| ASL A
|02E56F| BCC .positive_camera_x

|02E571| DEC.w $0629

.positive_camera_x
|02E574| REP #$20

|02E576| LDA.w #$0000
|02E579| SEC
|02E57A| SBC.w $0624
|02E57D| STA.w $0626

|02E580| LDA.w #$0000
|02E583| SEC
|02E584| SBC.w $0628
|02E587| STA.w $062A

;===================================================================================================

LoadOverworldScreenProperties_pre:
|02E58A| PLB

;===================================================================================================

LoadOverworldScreenProperties:
|02E58B| LDA.w #$FFF8
|02E58E| STA.b $EC

|02E590| SEP #$30

|02E592| PHB
|02E593| PHK
|02E594| PLB

|02E595| JSR LoadGraphicsAndScreenSize

|02E598| LDA.b #$E4
|02E59A| STA.w $0716

|02E59D| STZ.w $0713

|02E5A0| LDA.b $8A
|02E5A2| AND.b #$3F
|02E5A4| ASL A
|02E5A5| TAY

|02E5A6| REP #$20

|02E5A8| LDX.b #$00

|02E5AA| LDA.w $0712
|02E5AD| BEQ .smaller_screen

|02E5AF| INX
|02E5B0| INX

.smaller_screen
|02E5B1| JSR SetOverworldCameraBoundaries

|02E5B4| SEP #$20

|02E5B6| PLB

|02E5B7| STZ.b $A9

|02E5B9| LDA.b #$02
|02E5BB| STA.b $AA
|02E5BD| STA.b $A6
|02E5BF| STA.b $A7

|02E5C1| LDA.b #$80
|02E5C3| STA.b $45
|02E5C5| STA.b $44

|02E5C7| LDA.b #$0F
|02E5C9| STA.b $42
|02E5CB| STA.b $43

|02E5CD| LDA.b #$FF
|02E5CF| STA.b $24
|02E5D1| STA.b $29

|02E5D3| RTS

;===================================================================================================

LoadCachedEntranceProperties:
|02E5D4| REP #$20

|02E5D6| LDA.l $7EC140
|02E5DA| STA.w $040A

|02E5DD| LDA.l $7EC142
|02E5E1| STA.b $1C

|02E5E3| LDA.l $7EC144
|02E5E7| STA.b $E8
|02E5E9| STA.w $0122
|02E5EC| STA.b $E6
|02E5EE| STA.w $0124

|02E5F1| LDA.l $7EC146
|02E5F5| STA.b $E2
|02E5F7| STA.w $011E
|02E5FA| STA.b $E0
|02E5FC| STA.w $0120

|02E5FF| LDA.l $7EC14A
|02E603| STA.b $22

|02E605| LDA.l $7EC148
|02E609| STA.b $20

|02E60B| LDA.b $A0
|02E60D| CMP.w #$0124 ; ROOM 0124
|02E610| BCS .normal_exit

|02E612| LDA.b $20
|02E614| SEC
|02E615| SBC.w #$0010
|02E618| STA.b $20

.normal_exit
|02E61A| LDA.w #$0002
|02E61D| STA.b $2F

|02E61F| LDA.w $0696
|02E622| CMP.w #$FFFF
|02E625| BNE .face_down

|02E627| LDA.b $20
|02E629| CLC
|02E62A| ADC.w #$0020
|02E62D| STA.b $20

|02E62F| STZ.b $2F

;---------------------------------------------------------------------------------------------------

.face_down
|02E631| LDA.l $7EC14C
|02E635| STA.b $8A

|02E637| LDA.l $7EC14E
|02E63B| STA.b $84

|02E63D| SEC
|02E63E| SBC.w #$0400
|02E641| AND.w #$0F80
|02E644| ASL A
|02E645| XBA
|02E646| STA.b $88

|02E648| LDA.b $84
|02E64A| SEC
|02E64B| SBC.w #$0010
|02E64E| AND.w #$003E
|02E651| LSR A
|02E652| STA.b $86

|02E654| LDA.l $7EC150
|02E658| STA.w $0618

|02E65B| DEC A
|02E65C| DEC A
|02E65D| STA.w $061A

|02E660| LDA.l $7EC152
|02E664| STA.w $061C

|02E667| DEC A
|02E668| DEC A
|02E669| STA.w $061E

|02E66C| LDA.l $7EC154
|02E670| STA.w $0600

|02E673| LDA.l $7EC156
|02E677| STA.w $0602

|02E67A| LDA.l $7EC158
|02E67E| STA.w $0604

|02E681| LDA.l $7EC15A
|02E685| STA.w $0606

|02E688| LDA.l $7EC15C
|02E68C| STA.w $0610

|02E68F| LDA.l $7EC15E
|02E693| STA.w $0612

|02E696| LDA.l $7EC160
|02E69A| STA.w $0614

|02E69D| LDA.l $7EC162
|02E6A1| STA.w $0616

|02E6A4| LDA.l $7EC16A
|02E6A8| STA.w $0624

|02E6AB| LDA.l $7EC16C
|02E6AF| STA.w $0626

|02E6B2| LDA.l $7EC16E
|02E6B6| STA.w $0628

|02E6B9| LDA.l $7EC170
|02E6BD| STA.w $062A

|02E6C0| SEP #$20

|02E6C2| LDA.l $7EC164
|02E6C6| STA.w $0AA0

|02E6C9| LDA.l $7EC165
|02E6CD| STA.w $0AA1

|02E6D0| LDA.l $7EC166
|02E6D4| STA.w $0AA2

|02E6D7| LDA.l $7EC167
|02E6DB| STA.w $0AA3

|02E6DE| REP #$20

|02E6E0| RTS

;===================================================================================================

pool LoadSpecialOverworld

.camera600
|02E6E1| dw $0000, $0000, $0000, $0000
|02E6E9| dw $0000, $0000, $0000, $0000
|02E6F1| dw $0200, $0200, $0000, $0000
|02E6F9| dw $0000, $0000, $0000, $0000

.camera602
|02E701| dw $0120, $0020, $0320, $0020
|02E709| dw $0000, $0000, $0320, $0320
|02E711| dw $0320, $0220, $0000, $0000
|02E719| dw $0000, $0000, $0320, $0320

.camera604
|02E721| dw $0000, $0100, $0200, $0600
|02E729| dw $0600, $0A00, $0C00, $0C00
|02E731| dw $0000, $0100, $0200, $0600
|02E739| dw $0600, $0A00, $0C00, $0C00

.camera606
|02E741| dw $0000, $0100, $0500, $0600
|02E749| dw $0600, $0A00, $0C00, $0C00
|02E751| dw $0000, $0100, $0400, $0600
|02E759| dw $0600, $0A00, $0C00, $0C00

.camera610
|02E761| dw $FF20, $FF20, $FF20, $FF20
|02E769| dw $FF20, $FF20, $FF20, $FF20
|02E771| dw $FF20, $FF20, $0120, $FF20
|02E779| dw $FF20, $FF20, $FF20, $0120

.camera614
|02E781| dw $FFFC, $0100, $0300, $0100
|02E789| dw $0500, $0900, $0B00, $0B00
|02E791| dw $FFFC, $0100, $0300, $0500
|02E799| dw $0500, $0900, $0B00, $0B00

.camera612
|02E7A1| dw $FF20, $FF20, $FF20, $FF20
|02E7A9| dw $FF20, $FF20, $0400, $0400
|02E7B1| dw $FF20, $FF20, $0120, $FF20
|02E7B9| dw $FF20, $FF20, $0400, $0400

.camera616
|02E7C1| dw $0004, $0104, $0300, $0100
|02E7C9| dw $0500, $0900, $0B00, $0B00
|02E7D1| dw $0004, $0104, $0300, $0100
|02E7D9| dw $0500, $0900, $0B00, $0B00

.camera70C
|02E7E1| dw $0000, $0000, $0200, $0600
|02E7E9| dw $0600, $0A00, $0C00, $0C00
|02E7F1| dw $0000, $0000, $0200, $0600
|02E7F9| dw $0600, $0A00, $0C00, $0C00

;---------------------------------------------------------------------------------------------------

.direction
|02E801| db $00, $04, $00, $00
|02E805| db $00, $00, $00, $00
|02E809| db $00, $00, $00, $00
|02E80D| db $00, $00, $00, $00

.gfx_AA3
|02E811| db $0C, $0C, $0E, $0E
|02E815| db $0E, $10, $10, $10
|02E819| db $0E, $0E, $0E, $0E
|02E81D| db $10, $10, $10, $10

.gfx_AA2
|02E821| db $2F, $2F, $2F, $2F
|02E825| db $2F, $2F, $2F, $2F
|02E829| db $2F, $2F, $2F, $2F
|02E82D| db $2F, $2F, $2F, $2F

.palette_prop_a
|02E831| db $0A, $0A, $0A, $0A
|02E835| db $02, $02, $02, $0A
|02E839| db $02, $02, $0A, $02
|02E83D| db $02, $02, $02, $0A

.palette_prop_b
|02E841| db $01, $08, $08, $08
|02E845| db $00, $00, $00, $00
|02E849| db $00, $00, $08, $00
|02E84D| db $00, $00, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

LoadSpecialOverworld:
|02E851| REP #$20

|02E853| STZ.w $04AC

|02E856| LDA.w $040A
|02E859| STA.l $7EC100

|02E85D| LDA.b $1C
|02E85F| STA.l $7EC102

|02E863| LDA.b $E8
|02E865| STA.l $7EC104

|02E869| LDA.b $E2
|02E86B| STA.l $7EC106

|02E86F| LDA.b $20
|02E871| STA.l $7EC108

|02E875| LDA.b $22
|02E877| STA.l $7EC10A

|02E87B| LDA.w $0618
|02E87E| STA.l $7EC110

|02E882| LDA.w $061C
|02E885| STA.l $7EC112

|02E889| LDA.b $8A
|02E88B| STA.l $7EC10C

|02E88F| LDA.b $84
|02E891| STA.l $7EC10E

|02E895| LDA.w $0600
|02E898| STA.l $7EC114

|02E89C| LDA.w $0602
|02E89F| STA.l $7EC116

|02E8A3| LDA.w $0604
|02E8A6| STA.l $7EC118

|02E8AA| LDA.w $0606
|02E8AD| STA.l $7EC11A

|02E8B1| LDA.w $0610
|02E8B4| STA.l $7EC11C

|02E8B8| LDA.w $0612
|02E8BB| STA.l $7EC11E

|02E8BF| LDA.w $0614
|02E8C2| STA.l $7EC120

|02E8C6| LDA.w $0616
|02E8C9| STA.l $7EC122

|02E8CD| LDA.w $0624
|02E8D0| STA.l $7EC12A

|02E8D4| LDA.w $0626
|02E8D7| STA.l $7EC12C

|02E8DB| LDA.w $0628
|02E8DE| STA.l $7EC12E

|02E8E2| LDA.w $062A
|02E8E5| STA.l $7EC130

|02E8E9| SEP #$20

|02E8EB| LDA.w $0AA0
|02E8EE| STA.l $7EC124

|02E8F2| LDA.w $0AA1
|02E8F5| STA.l $7EC125

|02E8F9| LDA.w $0AA2
|02E8FC| STA.l $7EC126

|02E900| LDA.w $0AA3
|02E903| STA.l $7EC127

;---------------------------------------------------------------------------------------------------

|02E907| SEP #$20

|02E909| JSR LoadOverworldFromUnderworld

|02E90C| REP #$20

|02E90E| LDA.b $A0
|02E910| CMP.w #$1010
|02E913| BNE .not_zora

|02E915| LDA.w #$0182 ; OW 82
|02E918| STA.b $A0

.not_zora
|02E91A| SEP #$20

|02E91C| PHB
|02E91D| PHK
|02E91E| PLB

|02E91F| LDA.b $A0
|02E921| PHA

|02E922| SEC
|02E923| SBC.b #$80
|02E925| STA.b $A0

|02E927| TAX

|02E928| LDA.l .direction,X
|02E92C| STA.b $2F

|02E92E| STZ.w $0412

|02E931| LDA.l .gfx_AA3,X
|02E935| STA.w $0AA3

|02E938| LDA.l .gfx_AA2,X
|02E93C| STA.w $0AA2

|02E93F| PHX

|02E940| LDA.l .palette_prop_b,X
|02E944| STA.b $00

|02E946| LDA.l .palette_prop_a,X
|02E94A| JSL OverworldPalettesLoader

|02E94E| PLX

|02E94F| REP #$30

|02E951| LDA.w #$03F0
|02E954| STA.b $00

|02E956| LDA.b $A0
|02E958| AND.w #$003F
|02E95B| ASL A
|02E95C| TAX

|02E95D| LDA.l .camera600,X
|02E961| STA.w $0708

|02E964| LDA.l .camera70C,X
|02E968| LSR A
|02E969| LSR A
|02E96A| LSR A
|02E96B| STA.w $070C

|02E96E| LDA.b $00
|02E970| STA.w $070A

|02E973| LDA.b $00
|02E975| LSR A
|02E976| LSR A
|02E977| LSR A
|02E978| STA.w $070E

;---------------------------------------------------------------------------------------------------

|02E97B| LDA.b $A0
|02E97D| ASL A
|02E97E| TAY

|02E97F| SEP #$10

|02E981| LDA.w .camera600,Y
|02E984| STA.w $0600

|02E987| LDA.w .camera602,Y
|02E98A| STA.w $0602

|02E98D| LDA.w .camera604,Y
|02E990| STA.w $0604

|02E993| LDA.w .camera606,Y
|02E996| STA.w $0606

|02E999| LDA.w .camera610,Y
|02E99C| STA.w $0610

|02E99F| LDA.w .camera612,Y
|02E9A2| STA.w $0612

|02E9A5| LDA.w .camera614,Y
|02E9A8| STA.w $0614

|02E9AB| LDA.w .camera616,Y
|02E9AE| STA.w $0616

;---------------------------------------------------------------------------------------------------

|02E9B1| SEP #$20

|02E9B3| PLA
|02E9B4| STA.b $A0

|02E9B6| PLB

|02E9B7| JSL SetOverworldBackgroundColorCacheOnly

|02E9BB| RTS

;===================================================================================================

LoadOverworldFromSpecialOverworld:
|02E9BC| REP #$20

|02E9BE| STZ.w $04AC

|02E9C1| LDA.l $7EC100
|02E9C5| STA.w $040A

|02E9C8| LDA.l $7EC102
|02E9CC| STA.b $1C

|02E9CE| LDA.l $7EC104
|02E9D2| STA.b $E8
|02E9D4| STA.w $0122
|02E9D7| STA.b $E6
|02E9D9| STA.w $0124

|02E9DC| LDA.l $7EC106
|02E9E0| STA.b $E2
|02E9E2| STA.w $011E
|02E9E5| STA.b $E0
|02E9E7| STA.w $0120

|02E9EA| LDA.l $7EC108
|02E9EE| STA.b $20

|02E9F0| LDA.l $7EC10A
|02E9F4| STA.b $22

|02E9F6| LDA.l $7EC10C
|02E9FA| STA.b $8A

|02E9FC| LDA.l $7EC10E
|02EA00| STA.b $84

|02EA02| SEC
|02EA03| SBC.w #$0400
|02EA06| AND.w #$0F80
|02EA09| ASL A
|02EA0A| XBA
|02EA0B| STA.b $88

|02EA0D| LDA.b $84
|02EA0F| SEC
|02EA10| SBC.w #$0010
|02EA13| AND.w #$003E
|02EA16| LSR A
|02EA17| STA.b $86

;---------------------------------------------------------------------------------------------------

|02EA19| LDA.l $7EC110
|02EA1D| STA.w $0618

|02EA20| DEC A
|02EA21| DEC A
|02EA22| STA.w $061A

|02EA25| LDA.l $7EC112
|02EA29| STA.w $061C

|02EA2C| DEC A
|02EA2D| DEC A
|02EA2E| STA.w $061E

|02EA31| LDA.l $7EC114
|02EA35| STA.w $0600

|02EA38| LDA.l $7EC116
|02EA3C| STA.w $0602

|02EA3F| LDA.l $7EC118
|02EA43| STA.w $0604

|02EA46| LDA.l $7EC11A
|02EA4A| STA.w $0606

|02EA4D| LDA.l $7EC11C
|02EA51| STA.w $0610

|02EA54| LDA.l $7EC11E
|02EA58| STA.w $0612

|02EA5B| LDA.l $7EC120
|02EA5F| STA.w $0614

|02EA62| LDA.l $7EC122
|02EA66| STA.w $0616

|02EA69| LDA.l $7EC12A
|02EA6D| STA.w $0624

|02EA70| LDA.l $7EC12C
|02EA74| STA.w $0626

|02EA77| LDA.l $7EC12E
|02EA7B| STA.w $0628

|02EA7E| LDA.l $7EC130
|02EA82| STA.w $062A

;---------------------------------------------------------------------------------------------------

|02EA85| SEP #$20

|02EA87| LDA.l $7EC124
|02EA8B| STA.w $0AA0

|02EA8E| LDA.l $7EC125
|02EA92| STA.w $0AA1

|02EA95| LDA.l $7EC126
|02EA99| STA.w $0AA2

|02EA9C| LDA.l $7EC127
|02EAA0| STA.w $0AA3

|02EAA3| LDX.b $8A

|02EAA5| LDA.l $7EFD40,X
|02EAA9| STA.b $00

|02EAAB| LDA.l OverworldPalettesScreenToSet,X
|02EAAF| JSL OverworldPalettesLoader
|02EAB3| JSL SetOverworldBackgroundColorCacheOnly

;---------------------------------------------------------------------------------------------------

|02EAB7| STZ.b $A9

|02EAB9| LDA.b #$02
|02EABB| STA.b $AA
|02EABD| STA.b $A6
|02EABF| STA.b $A7

|02EAC1| LDA.b #$80
|02EAC3| STA.b $45
|02EAC5| STA.b $44

|02EAC7| LDA.b #$0F
|02EAC9| STA.b $42
|02EACB| STA.b $43

|02EACD| LDA.b #$FF
|02EACF| STA.b $24
|02EAD1| STA.b $29

|02EAD3| SEP #$30

|02EAD5| JSL ResetSwimmingState
|02EAD9| JSR LoadGraphicsAndScreenSize

|02EADC| LDA.b #$E4
|02EADE| STA.w $0716

|02EAE1| STZ.w $0713

|02EAE4| RTS

;===================================================================================================

pool LoadTransport

.screen_id
|02EAE5| dw $0003 ; OW 03 - Flute 1
|02EAE7| dw $0016 ; OW 16 - Flute 2
|02EAE9| dw $0018 ; OW 18 - Flute 3
|02EAEB| dw $002C ; OW 2C - Flute 4
|02EAED| dw $002F ; OW 2F - Flute 5
|02EAEF| dw $0030 ; OW 30 - Flute 6
|02EAF1| dw $003B ; OW 3B - Flute 7
|02EAF3| dw $003F ; OW 3F - Flute 8
|02EAF5| dw $005B ; OW 5B - Pyramid
|02EAF7| dw $0035 ; OW 35 - Lake Hylia whirlpool
|02EAF9| dw $000F ; OW 0F - Waterfall of Wishing whirlpool
|02EAFB| dw $0015 ; OW 15 - Witch whirlpool
|02EAFD| dw $0033 ; OW 33 - South of Link's house whirlpool
|02EAFF| dw $0012 ; OW 12 - Death Mountain whirlpool
|02EB01| dw $003F ; OW 3F - Lake Hylia falls whirlpool
|02EB03| dw $0055 ; OW 55 - Dark witch whirlpool
|02EB05| dw $007F ; OW 7F - Dark Lake Hylia falls whirlpool

.map16_index
|02EB07| dw $1600 ; Flute 1
|02EB09| dw $0888 ; Flute 2
|02EB0B| dw $0B30 ; Flute 3
|02EB0D| dw $0588 ; Flute 4
|02EB0F| dw $0798 ; Flute 5
|02EB11| dw $1880 ; Flute 6
|02EB13| dw $069E ; Flute 7
|02EB15| dw $0810 ; Flute 8
|02EB17| dw $002E ; Pyramid
|02EB19| dw $1242 ; Lake Hylia whirlpool
|02EB1B| dw $0680 ; Waterfall of Wishing whirlpool
|02EB1D| dw $0112 ; Witch whirlpool
|02EB1F| dw $059E ; South of Link's house whirlpool
|02EB21| dw $048E ; Death Mountain whirlpool
|02EB23| dw $0280 ; Lake Hylia falls whirlpool
|02EB25| dw $0112 ; Dark witch whirlpool
|02EB27| dw $0280 ; Dark Lake Hylia falls whirlpool

.vertical_scroll
|02EB29| dw $02CA ; Flute 1
|02EB2B| dw $0516 ; Flute 2
|02EB2D| dw $0759 ; Flute 3
|02EB2F| dw $0AB9 ; Flute 4
|02EB31| dw $0AFA ; Flute 5
|02EB33| dw $0F1E ; Flute 6
|02EB35| dw $0EDF ; Flute 7
|02EB37| dw $0F05 ; Flute 8
|02EB39| dw $0600 ; Pyramid
|02EB3B| dw $0E46 ; Lake Hylia whirlpool
|02EB3D| dw $02C6 ; Waterfall of Wishing whirlpool
|02EB3F| dw $042A ; Witch whirlpool
|02EB41| dw $0CBA ; South of Link's house whirlpool
|02EB43| dw $049A ; Death Mountain whirlpool
|02EB45| dw $0E56 ; Lake Hylia falls whirlpool
|02EB47| dw $042A ; Dark witch whirlpool
|02EB49| dw $0E56 ; Dark Lake Hylia falls whirlpool

.horizontal_scroll
|02EB4B| dw $060E ; Flute 1
|02EB4D| dw $0C4E ; Flute 2
|02EB4F| dw $017E ; Flute 3
|02EB51| dw $0840 ; Flute 4
|02EB53| dw $0EB2 ; Flute 5
|02EB55| dw $0000 ; Flute 6
|02EB57| dw $06F2 ; Flute 7
|02EB59| dw $0E75 ; Flute 8
|02EB5B| dw $0778 ; Pyramid
|02EB5D| dw $0C0A ; Lake Hylia whirlpool
|02EB5F| dw $0E06 ; Waterfall of Wishing whirlpool
|02EB61| dw $0A8A ; Witch whirlpool
|02EB63| dw $06EA ; South of Link's house whirlpool
|02EB65| dw $0462 ; Death Mountain whirlpool
|02EB67| dw $0E00 ; Lake Hylia falls whirlpool
|02EB69| dw $0A8A ; Dark witch whirlpool
|02EB6B| dw $0E00 ; Dark Lake Hylia falls whirlpool

.link_pos_y
|02EB6D| dw $0328 ; Flute 1
|02EB6F| dw $0578 ; Flute 2
|02EB71| dw $07B7 ; Flute 3
|02EB73| dw $0B17 ; Flute 4
|02EB75| dw $0B58 ; Flute 5
|02EB77| dw $0FA8 ; Flute 6
|02EB79| dw $0F3D ; Flute 7
|02EB7B| dw $0F67 ; Flute 8
|02EB7D| dw $065C ; Pyramid
|02EB7F| dw $0EA8 ; Lake Hylia whirlpool
|02EB81| dw $0328 ; Waterfall of Wishing whirlpool
|02EB83| dw $0488 ; Witch whirlpool
|02EB85| dw $0D18 ; South of Link's house whirlpool
|02EB87| dw $04F8 ; Death Mountain whirlpool
|02EB89| dw $0EB8 ; Lake Hylia falls whirlpool
|02EB8B| dw $0488 ; Dark witch whirlpool
|02EB8D| dw $0EB8 ; Dark Lake Hylia falls whirlpool

.link_pos_x
|02EB8F| dw $0678 ; Flute 1
|02EB91| dw $0CC8 ; Flute 2
|02EB93| dw $0200 ; Flute 3
|02EB95| dw $08B8 ; Flute 4
|02EB97| dw $0F30 ; Flute 5
|02EB99| dw $0078 ; Flute 6
|02EB9B| dw $0778 ; Flute 7
|02EB9D| dw $0EF3 ; Flute 8
|02EB9F| dw $07F0 ; Pyramid
|02EBA1| dw $0C90 ; Lake Hylia whirlpool
|02EBA3| dw $0E80 ; Waterfall of Wishing whirlpool
|02EBA5| dw $0B10 ; Witch whirlpool
|02EBA7| dw $0770 ; South of Link's house whirlpool
|02EBA9| dw $04E8 ; Death Mountain whirlpool
|02EBAB| dw $0E68 ; Lake Hylia falls whirlpool
|02EBAD| dw $0B10 ; Dark witch whirlpool
|02EBAF| dw $0E68 ; Dark Lake Hylia falls whirlpool

.camera_trigger_y
|02EBB1| dw $0337 ; Flute 1
|02EBB3| dw $0583 ; Flute 2
|02EBB5| dw $07C6 ; Flute 3
|02EBB7| dw $0B26 ; Flute 4
|02EBB9| dw $0B67 ; Flute 5
|02EBBB| dw $0F8D ; Flute 6
|02EBBD| dw $0F4C ; Flute 7
|02EBBF| dw $0F72 ; Flute 8
|02EBC1| dw $066D ; Pyramid
|02EBC3| dw $0EB3 ; Lake Hylia whirlpool
|02EBC5| dw $0333 ; Waterfall of Wishing whirlpool
|02EBC7| dw $0497 ; Witch whirlpool
|02EBC9| dw $0D27 ; South of Link's house whirlpool
|02EBCB| dw $0507 ; Death Mountain whirlpool
|02EBCD| dw $0EC3 ; Lake Hylia falls whirlpool
|02EBCF| dw $0497 ; Dark witch whirlpool
|02EBD1| dw $0EC3 ; Dark Lake Hylia falls whirlpool

.camera_trigger_x
|02EBD3| dw $0683 ; Flute 1
|02EBD5| dw $0CD3 ; Flute 2
|02EBD7| dw $020B ; Flute 3
|02EBD9| dw $08BF ; Flute 4
|02EBDB| dw $0F37 ; Flute 5
|02EBDD| dw $008D ; Flute 6
|02EBDF| dw $077F ; Flute 7
|02EBE1| dw $0EFA ; Flute 8
|02EBE3| dw $07F7 ; Pyramid
|02EBE5| dw $0C97 ; Lake Hylia whirlpool
|02EBE7| dw $0E8B ; Waterfall of Wishing whirlpool
|02EBE9| dw $0B17 ; Witch whirlpool
|02EBEB| dw $0777 ; South of Link's house whirlpool
|02EBED| dw $04EF ; Death Mountain whirlpool
|02EBEF| dw $0E85 ; Lake Hylia falls whirlpool
|02EBF1| dw $0B17 ; Dark witch whirlpool
|02EBF3| dw $0E85 ; Dark Lake Hylia falls whirlpool

.scroll_mod_y
|02EBF5| dw $FFF6 ; Flute 1
|02EBF7| dw $FFFA ; Flute 2
|02EBF9| dw $0007 ; Flute 3
|02EBFB| dw $FFF7 ; Flute 4
|02EBFD| dw $FFF6 ; Flute 5
|02EBFF| dw $0000 ; Flute 6
|02EC01| dw $FFF1 ; Flute 7
|02EC03| dw $FFFB ; Flute 8
|02EC05| dw $0000 ; Pyramid
|02EC07| dw $FFFA ; Lake Hylia whirlpool
|02EC09| dw $000A ; Waterfall of Wishing whirlpool
|02EC0B| dw $FFF6 ; Witch whirlpool
|02EC0D| dw $FFF6 ; South of Link's house whirlpool
|02EC0F| dw $FFF6 ; Death Mountain whirlpool
|02EC11| dw $FFFA ; Lake Hylia falls whirlpool
|02EC13| dw $FFF6 ; Dark witch whirlpool
|02EC15| dw $FFFA ; Dark Lake Hylia falls whirlpool

.scroll_mod_x
|02EC17| dw $FFF2 ; Flute 1
|02EC19| dw $FFF2 ; Flute 2
|02EC1B| dw $0002 ; Flute 3
|02EC1D| dw $0000 ; Flute 4
|02EC1F| dw $000E ; Flute 5
|02EC21| dw $0000 ; Flute 6
|02EC23| dw $FFFE ; Flute 7
|02EC25| dw $000B ; Flute 8
|02EC27| dw $FFF8 ; Pyramid
|02EC29| dw $0006 ; Lake Hylia whirlpool
|02EC2B| dw $FFFA ; Waterfall of Wishing whirlpool
|02EC2D| dw $FFFA ; Witch whirlpool
|02EC2F| dw $0006 ; South of Link's house whirlpool
|02EC31| dw $000E ; Death Mountain whirlpool
|02EC33| dw $0000 ; Lake Hylia falls whirlpool
|02EC35| dw $FFFA ; Dark witch whirlpool
|02EC37| dw $0000 ; Dark Lake Hylia falls whirlpool

endpool

;---------------------------------------------------------------------------------------------------

LoadFluteSpot:
|02EC39| PHB
|02EC3A| PHK
|02EC3B| PLB

|02EC3C| REP #$20

|02EC3E| STZ.w $04AC

|02EC41| ASL.w $1AF0
|02EC44| LDX.w $1AF0

;===================================================================================================

LoadTransport:
|02EC47| LDA.w .vertical_scroll,X
|02EC4A| STA.b $E6
|02EC4C| STA.b $E8
|02EC4E| STA.w $0122
|02EC51| STA.w $0124

|02EC54| LDA.w .horizontal_scroll,X
|02EC57| STA.b $E0
|02EC59| STA.b $E2
|02EC5B| STA.w $011E
|02EC5E| STA.w $0120

|02EC61| LDA.w .link_pos_y,X
|02EC64| STA.b $20

|02EC66| LDA.w .link_pos_x,X
|02EC69| STA.b $22

|02EC6B| LDA.w .scroll_mod_y,X
|02EC6E| STA.w $0624

|02EC71| LDA.w #$0000
|02EC74| SEC
|02EC75| SBC.w $0624
|02EC78| STA.w $0626

|02EC7B| LDA.w .scroll_mod_x,X
|02EC7E| STA.w $0628

|02EC81| LDA.w #$0000
|02EC84| SEC
|02EC85| SBC.w $0628
|02EC88| STA.w $062A

|02EC8B| LDA.w .screen_id,X
|02EC8E| STA.b $8A
|02EC90| STA.w $040A

|02EC93| LDA.w .map16_index,X
|02EC96| STA.b $84

|02EC98| SEC
|02EC99| SBC.w #$0400
|02EC9C| AND.w #$0F80
|02EC9F| ASL A
|02ECA0| XBA
|02ECA1| STA.b $88

|02ECA3| LDA.b $84
|02ECA5| SEC
|02ECA6| SBC.w #$0010
|02ECA9| AND.w #$003E
|02ECAC| LSR A
|02ECAD| STA.b $86

|02ECAF| LDA.w .camera_trigger_y,X
|02ECB2| STA.w $0618

|02ECB5| DEC A
|02ECB6| DEC A
|02ECB7| STA.w $061A

|02ECBA| LDA.w .camera_trigger_x,X
|02ECBD| STA.w $061C

|02ECC0| DEC A
|02ECC1| DEC A
|02ECC2| STA.w $061E

;---------------------------------------------------------------------------------------------------

|02ECC5| STZ.w $0696
|02ECC8| STZ.w $0698

|02ECCB| PLB

|02ECCC| JSR LoadOverworldScreenProperties

|02ECCF| JSL ResetAllSprites
|02ECD3| JSL ResetAndReloadOverworldSprites

|02ECD7| STZ.b $6C

|02ECD9| JSR DeleteCertainAncillaeStopDashing

|02ECDC| RTL

;===================================================================================================

LoadLandingScreenPalettes:
|02ECDD| JSR OverworldLoadScreensPaletteSet

|02ECE0| LDX.b $8A

|02ECE2| LDA.l $7EFD40,X
|02ECE6| STA.b $00

|02ECE8| LDA.l OverworldPalettesScreenToSet,X

|02ECEC| JSL OverworldPalettesLoader
|02ECF0| JSL SetOverworldBackgroundColor
|02ECF4| JSR Overworld_CopyPalettesToCache_WithPrep

|02ECF7| RTL

;===================================================================================================

pool FindPartnerWhirlpoolExit

.my_screen_id
|02ECF8| dw $000F ; OW 0F - Lake Hylia whirlpool
|02ECFA| dw $0035 ; OW 35 - Waterfall of Wishing whirlpool
|02ECFC| dw $0033 ; OW 33 - Witch whirlpool
|02ECFE| dw $0015 ; OW 15 - South of Link's house whirlpool
|02ED00| dw $003F ; OW 3F - Death Mountain whirlpool
|02ED02| dw $0012 ; OW 12 - Lake Hylia falls whirlpool
|02ED04| dw $007F ; OW 7F - Dark witch whirlpool
|02ED06| dw $0055 ; OW 55 - Dark Lake Hylia falls whirlpool

endpool

;---------------------------------------------------------------------------------------------------

FindPartnerWhirlpoolExit:
|02ED08| PHB
|02ED09| PHK
|02ED0A| PLB

|02ED0B| REP #$20

|02ED0D| LDX.b #$10

|02ED0F| LDA.b $8A

.next_screen
|02ED11| DEX
|02ED12| DEX

|02ED13| CMP.l .my_screen_id,X
|02ED17| BNE .next_screen

;---------------------------------------------------------------------------------------------------

|02ED19| TXA
|02ED1A| CLC
|02ED1B| ADC.w #$0012
|02ED1E| TAX

|02ED1F| STZ.w $04AC

|02ED22| JMP.w LoadTransport

;===================================================================================================

Module09_21:
|02ED25| REP #$20

|02ED27| LDA.b $84
|02ED29| PHA

|02ED2A| LDA.b $86
|02ED2C| PHA

|02ED2D| LDA.b $88
|02ED2F| PHA

|02ED30| LDX.b $8A

|02ED32| LDA.l OverworldScreenSize,X
|02ED36| AND.w #$00FF
|02ED39| BEQ OverworldBuildMapAndTrigger

|02ED3B| LDA.w #$0390
|02ED3E| STA.b $84

|02ED40| SEC
|02ED41| SBC.w #$0400
|02ED44| AND.w #$0F80
|02ED47| ASL A
|02ED48| XBA
|02ED49| STA.b $88

|02ED4B| LDA.b $84
|02ED4D| SEC
|02ED4E| SBC.w #$0010
|02ED51| AND.w #$003E
|02ED54| LSR A
|02ED55| STA.b $86

|02ED57| BRA OverworldBuildMapAndTrigger

;===================================================================================================

LoadAndBuildOverworldScreen:
|02ED59| REP #$20

|02ED5B| LDA.b $84
|02ED5D| PHA

|02ED5E| LDA.b $86
|02ED60| PHA

|02ED61| LDA.b $88
|02ED63| PHA

|02ED64| LDX.b $8A

|02ED66| LDA.l OverworldScreenSize,X
|02ED6A| AND.w #$00FF
|02ED6D| BEQ .big_screen

|02ED6F| LDA.w #$0390
|02ED72| STA.b $84

|02ED74| SEC
|02ED75| SBC.w #$0400
|02ED78| AND.w #$0F80
|02ED7B| ASL A
|02ED7C| XBA
|02ED7D| STA.b $88

|02ED7F| LDA.b $84
|02ED81| SEC
|02ED82| SBC.w #$0010
|02ED85| AND.w #$003E
|02ED88| LSR A
|02ED89| STA.b $86

.big_screen
|02ED8B| SEP #$20

|02ED8D| JSR DrawOverworldQuadrantsAndOverlays

;===================================================================================================

OverworldBuildMapAndTrigger:
|02ED90| REP #$20

|02ED92| LDA.w #$FFFF
|02ED95| STA.b $C8

|02ED97| STZ.b $CA
|02ED99| STZ.b $CC

|02ED9B| SEP #$20

|02ED9D| JSR BuildOverworldFromMap16

|02EDA0| REP #$20

|02EDA2| PLA
|02EDA3| STA.b $88

|02EDA5| PLA
|02EDA6| STA.b $86

|02EDA8| PLA
|02EDA9| STA.b $84

|02EDAB| SEP #$20

|02EDAD| LDA.b #$04
|02EDAF| STA.b $17
|02EDB1| STA.w $0710

|02EDB4| INC.b $11

|02EDB6| STZ.b $13

|02EDB8| RTS

;===================================================================================================

Module08_02_LoadAndAdvance:
|02EDB9| JSR LoadAndBuildOverworldScreen

|02EDBC| LDA.b #$10
|02EDBE| STA.b $10

|02EDC0| STZ.b $B0
|02EDC2| STZ.b $11

|02EDC4| RTS

;===================================================================================================

pool Overworld_HandleOverlaysAndBombDoors

.bombable_door_location
|02EDC5| dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
|02EDD5| dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
|02EDE5| dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
|02EDF5| dw $1C0C, $1C0C, $0000, $0000, $0000, $0000, $0000, $0000
|02EE05| dw $1C0C, $1C0C, $0000, $0000, $0000, $0000, $0000, $0000
|02EE15| dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
|02EE25| dw $0000, $0000, $0000, $0000, $03B0, $180C, $180C, $0288
|02EE35| dw $0000, $0000, $0000, $0000, $0000, $180C, $180C, $0000

|02EE45| dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
|02EE55| dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
|02EE65| dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
|02EE75| dw $1AB6, $1AB6, $0000, $0E2E, $0E2E, $0000, $0000, $0000
|02EE85| dw $1AB6, $1AB6, $0000, $0E2E, $0E2E, $0000, $0000, $0000
|02EE95| dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
|02EEA5| dw $0000, $0000, $0000, $0000, $03B0, $0000, $0000, $0288
|02EEB5| dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000

endpool

;===================================================================================================

DrawOverworldQuadrantsAndOverlays:
|02EEC5| REP #$30

|02EEC7| JSR Overworld_DecompressAndDrawAllQuadrants

;---------------------------------------------------------------------------------------------------

|02EECA| LDX.w #$001E
|02EECD| LDA.w #$0DC4

.next
|02EED0| STA.l $7E4000,X
|02EED4| STA.l $7E4020,X
|02EED8| STA.l $7E4020,X
|02EEDC| STA.l $7E4040,X
|02EEE0| STA.l $7E4060,X

|02EEE4| DEX
|02EEE5| DEX
|02EEE6| BPL .next

;---------------------------------------------------------------------------------------------------

|02EEE8| LDX.w $0696
|02EEEB| BEQ Overworld_HandleOverlaysAndBombDoors

|02EEED| CPX.w #$FFFF
|02EEF0| BEQ Overworld_HandleOverlaysAndBombDoors

|02EEF2| CPX.w #$8000
|02EEF5| BCS .do_two

|02EEF7| LDA.w #$0DA4
|02EEFA| STA.l $7E2000,X

|02EEFE| JSL MemorizeMap16Change

|02EF02| LDA.w #$0DA6
|02EF05| BRA .just_one

.do_two
|02EF07| TXA
|02EF08| AND.w #$1FFF
|02EF0B| TAX

|02EF0C| LDA.w #$0DB4
|02EF0F| JSL MemorizeMap16Change
|02EF13| STA.l $7E2000,X

|02EF17| LDA.w #$0DB5

.just_one
|02EF1A| STA.l $7E2002,X

|02EF1E| INX
|02EF1F| INX

|02EF20| JSL MemorizeMap16Change

|02EF24| DEX
|02EF25| DEX

|02EF26| STZ.w $0696

;===================================================================================================

Overworld_HandleOverlaysAndBombDoors:
|02EF29| LDA.w #$020F

|02EF2C| LDX.b $8A
|02EF2E| CPX.w #$0033 ; OW 33
|02EF31| BNE .not_swamp_portal

|02EF33| STA.l $7E22A8

.not_swamp_portal
|02EF37| CPX.w #$002F ; OW 2F
|02EF3A| BNE .not_pod_portal

|02EF3C| STA.l $7E2BB2

;---------------------------------------------------------------------------------------------------

.not_pod_portal
|02EF40| SEP #$30

|02EF42| LDX.b $8A
|02EF44| CPX.b #$80 ; SPOW
|02EF46| BCS .no_overlay

|02EF48| LDA.l $7EF280,X
|02EF4C| AND.b #$20
|02EF4E| BEQ .no_overlay

|02EF50| JSL ApplyOverworldOverlay

.no_overlay
|02EF54| LDX.b $8A

|02EF56| LDA.l $7EF280,X
|02EF5A| AND.b #$02
|02EF5C| BEQ .exit

|02EF5E| REP #$30

|02EF60| LDA.b $8A
|02EF62| ASL A
|02EF63| TAX

|02EF64| LDA.l .bombable_door_location,X
|02EF68| TAX

|02EF69| LDA.w #$0DB4
|02EF6C| STA.l $7E2000,X

|02EF70| LDA.w #$0DB5
|02EF73| STA.l $7E2002,X

|02EF77| SEP #$30

.exit
|02EF79| RTS

;===================================================================================================

TriggerAndFinishMapLoadStripe_Vertical:
|02EF7A| SEP #$30

|02EF7C| LDA.b #$08
|02EF7E| STA.w $0416

|02EF81| LDA.b #$03
|02EF83| STA.b $17

|02EF85| REP #$30

|02EF87| LDY.b $0E

|02EF89| LDA.w #$0080
|02EF8C| STA.w $1100,Y

|02EF8F| INY
|02EF90| INY
|02EF91| STY.b $0E

;---------------------------------------------------------------------------------------------------

.next
|02EF93| JSR BufferAndBuildMap16Stripes_Vertical

|02EF96| LDA.b $84
|02EF98| SEC
|02EF99| SBC.w #$0080
|02EF9C| STA.b $84

|02EF9E| LDA.b $88
|02EFA0| DEC A
|02EFA1| AND.w #$001F
|02EFA4| STA.b $88

|02EFA6| DEC.b $08
|02EFA8| BNE .next

;---------------------------------------------------------------------------------------------------

|02EFAA| LDA.w #$FFFF
|02EFAD| LDX.b $0E
|02EFAF| STA.w $1100,X

|02EFB2| RTS

;===================================================================================================

TriggerAndFinishMapLoadStripe_Horizontal:
|02EFB3| SEP #$30

|02EFB5| LDA.b #$02
|02EFB7| STA.w $0416

|02EFBA| LDA.b #$03
|02EFBC| STA.b $17

|02EFBE| REP #$30

|02EFC0| LDY.b $0E

|02EFC2| LDA.w #$8040
|02EFC5| STA.w $1100,Y

|02EFC8| INY
|02EFC9| INY
|02EFCA| STY.b $0E

;---------------------------------------------------------------------------------------------------

.next
|02EFCC| JSR BufferAndBuildMap16Stripes_Horizontal

|02EFCF| DEC.b $84
|02EFD1| DEC.b $84

|02EFD3| LDA.b $86
|02EFD5| DEC A
|02EFD6| AND.w #$001F
|02EFD9| STA.b $86

|02EFDB| DEC.b $08
|02EFDD| BNE .next

;---------------------------------------------------------------------------------------------------

|02EFDF| LDA.w #$FFFF
|02EFE2| LDX.b $0E
|02EFE4| STA.w $1100,X

|02EFE7| RTS

;===================================================================================================

SomeTilemapChange:
|02EFE8| REP #$30

|02EFEA| JSR Overworld_DecompressAndDrawAllQuadrants

|02EFED| LDX.w #$001E
|02EFF0| LDA.w #$0DC4

.next
|02EFF3| STA.l $7E4000,X
|02EFF7| STA.l $7E4020,X
|02EFFB| STA.l $7E4040,X
|02EFFF| STA.l $7E4060,X

|02F003| DEX
|02F004| DEX
|02F005| BPL .next

|02F007| JSR Overworld_HandleOverlaysAndBombDoors

|02F00A| INC.b $11

|02F00C| RTS

;===================================================================================================

pool CreateInitialNewScreenMapToScroll

.vectors_big_screen
|02F00D| dw Overworld_ResetSubmodule
|02F00F| dw CreateInitialOWScreenView_Big_East
|02F011| dw CreateInitialOWScreenView_Big_West
|02F013| dw Overworld_ResetSubmodule
|02F015| dw CreateInitialOWScreenView_Big_South
|02F017| dw Overworld_ResetSubmodule
|02F019| dw Overworld_ResetSubmodule
|02F01B| dw Overworld_ResetSubmodule
|02F01D| dw CreateInitialOWScreenView_Big_North

.vectors_small_screen
|02F01F| dw Overworld_ResetSubmodule
|02F021| dw CreateInitialOWScreenView_Small_East
|02F023| dw CreateInitialOWScreenView_Small_West
|02F025| dw Overworld_ResetSubmodule
|02F027| dw CreateInitialOWScreenView_Small_South
|02F029| dw Overworld_ResetSubmodule
|02F02B| dw Overworld_ResetSubmodule
|02F02D| dw Overworld_ResetSubmodule
|02F02F| dw CreateInitialOWScreenView_Small_North

endpool

;---------------------------------------------------------------------------------------------------

CreateInitialNewScreenMapToScroll:
|02F031| SEP #$30

|02F033| LDX.b $8A

|02F035| LDA.l OverworldScreenSize,X
|02F039| BNE .small_screen

|02F03B| LDA.w $0416
|02F03E| ASL A
|02F03F| TAX

|02F040| JMP.w (.vectors_big_screen,X)

;---------------------------------------------------------------------------------------------------

.small_screen
|02F043| LDA.w $0416
|02F046| ASL A
|02F047| TAX

|02F048| JMP.w (.vectors_small_screen,X)

;===================================================================================================

UNREACHABLE_02F04B:
|02F04B| LDA.b $84
|02F04D| SEC
|02F04E| SBC.w #$0400
|02F051| AND.w #$0F80
|02F054| ASL A
|02F055| XBA
|02F056| AND.w #$001F
|02F059| STA.b $88

|02F05B| LDA.b $84
|02F05D| SEC
|02F05E| SBC.w #$0010
|02F061| AND.w #$003E
|02F064| LSR A
|02F065| AND.w #$001F
|02F068| STA.b $86

|02F06A| RTS

;===================================================================================================

CreateInitialOWScreenView_Big_North:
|02F06B| REP #$30

|02F06D| LDA.b $84
|02F06F| CLC
|02F070| ADC.w #$0380
|02F073| STA.b $84

|02F075| LDA.w #$001F
|02F078| STA.b $88

|02F07A| STZ.b $0E

|02F07C| LDA.w #$0007
|02F07F| STA.b $08

|02F081| JSR TriggerAndFinishMapLoadStripe_Vertical

|02F084| SEP #$30

|02F086| RTS

;===================================================================================================

CreateInitialOWScreenView_Big_South:
|02F087| REP #$30

|02F089| LDA.b $84

.adjust_more
|02F08B| CMP.w #$0080
|02F08E| BCC .in_range

|02F090| SBC.w #$0080
|02F093| BRA .adjust_more

;---------------------------------------------------------------------------------------------------

.in_range
|02F095| CLC
|02F096| ADC.w #$0780
|02F099| STA.b $84

|02F09B| STZ.b $0E

|02F09D| LDA.w #$0007
|02F0A0| STA.b $88

|02F0A2| LDA.w #$0008
|02F0A5| STA.b $08

|02F0A7| JSR TriggerAndFinishMapLoadStripe_Vertical

|02F0AA| LDA.b $88
|02F0AC| CLC
|02F0AD| ADC.w #$0009
|02F0B0| AND.w #$001F
|02F0B3| STA.b $88

|02F0B5| LDA.b $84
|02F0B7| SEC
|02F0B8| SBC.w #$0B80
|02F0BB| STA.b $84

|02F0BD| SEP #$30

|02F0BF| RTS

;===================================================================================================

CreateInitialOWScreenView_Big_West:
|02F0C0| REP #$30

|02F0C2| LDA.b $84
|02F0C4| CLC
|02F0C5| ADC.w #$000E
|02F0C8| STA.b $84

|02F0CA| LDA.w #$001F
|02F0CD| STA.b $86

|02F0CF| STZ.b $0E

|02F0D1| LDA.w #$0007
|02F0D4| STA.b $08

|02F0D6| JSR TriggerAndFinishMapLoadStripe_Horizontal

|02F0D9| SEP #$30

|02F0DB| RTS

;===================================================================================================

CreateInitialOWScreenView_Big_East:
|02F0DC| REP #$30

|02F0DE| LDA.b $84
|02F0E0| SEC
|02F0E1| SBC.w #$0060
|02F0E4| CLC
|02F0E5| ADC.w #$001E
|02F0E8| STA.b $84

|02F0EA| STZ.b $0E

|02F0EC| LDA.w #$0007
|02F0EF| STA.b $86

|02F0F1| LDA.w #$0008
|02F0F4| STA.b $08

|02F0F6| JSR TriggerAndFinishMapLoadStripe_Horizontal

|02F0F9| LDA.b $86
|02F0FB| CLC
|02F0FC| ADC.w #$0009
|02F0FF| AND.w #$001F
|02F102| STA.b $86

|02F104| LDA.b $84
|02F106| SEC
|02F107| SBC.w #$002E
|02F10A| STA.b $84

|02F10C| SEP #$30

|02F10E| RTS

;===================================================================================================

CreateInitialOWScreenView_Small_North:
|02F10F| REP #$30

|02F111| LDA.b $84
|02F113| SEC
|02F114| SBC.w #$0700
|02F117| STA.l $7EC172

|02F11B| LDA.b $86
|02F11D| STA.l $7EC174

|02F121| LDA.w #$000A
|02F124| STA.l $7EC176

|02F128| LDA.w #$1390
|02F12B| STA.b $84

|02F12D| STZ.b $86

|02F12F| LDA.w #$001F
|02F132| STA.b $88

|02F134| STZ.b $0E

|02F136| LDA.w #$0007
|02F139| STA.b $08

|02F13B| JSR TriggerAndFinishMapLoadStripe_Vertical

|02F13E| SEP #$30

|02F140| RTS

;===================================================================================================

CreateInitialOWScreenView_Small_South:
|02F141| REP #$30

|02F143| LDA.b $84
|02F145| AND.w #$00FF
|02F148| STA.l $7EC172

|02F14C| LDA.b $86
|02F14E| STA.l $7EC174

|02F152| LDA.w #$0018
|02F155| STA.l $7EC176

|02F159| LDA.w #$0790
|02F15C| STA.b $84

|02F15E| STZ.b $86

|02F160| LDA.w #$0007
|02F163| STA.b $88

|02F165| STZ.b $0E

|02F167| LDA.w #$0008
|02F16A| STA.b $08

|02F16C| JSR TriggerAndFinishMapLoadStripe_Vertical

|02F16F| LDA.b $88
|02F171| CLC
|02F172| ADC.w #$0009
|02F175| AND.w #$001F
|02F178| STA.b $88

|02F17A| LDA.b $84
|02F17C| SEC
|02F17D| SBC.w #$0B80
|02F180| STA.b $84

|02F182| SEP #$30

|02F184| RTS

;===================================================================================================

CreateInitialOWScreenView_Small_West:
|02F185| REP #$30

|02F187| LDA.b $84
|02F189| SEC
|02F18A| SBC.w #$0020
|02F18D| STA.l $7EC172

|02F191| LDA.w #$0008
|02F194| STA.l $7EC174

|02F198| LDA.b $88
|02F19A| STA.l $7EC176

|02F19E| LDA.w #$044E
|02F1A1| STA.b $84

|02F1A3| STZ.b $88

|02F1A5| LDA.w #$001F
|02F1A8| STA.b $86

|02F1AA| STZ.b $0E

|02F1AC| LDA.w #$0007
|02F1AF| STA.b $08

|02F1B1| JSR TriggerAndFinishMapLoadStripe_Horizontal

|02F1B4| SEP #$30

|02F1B6| RTS

;===================================================================================================

CreateInitialOWScreenView_Small_East:
|02F1B7| REP #$30

|02F1B9| LDA.b $84
|02F1BB| SEC
|02F1BC| SBC.w #$0060
|02F1BF| STA.l $7EC172

|02F1C3| LDA.w #$0018
|02F1C6| STA.l $7EC174

|02F1CA| LDA.b $88
|02F1CC| STA.l $7EC176

|02F1D0| LDA.w #$041E
|02F1D3| STA.b $84

|02F1D5| STZ.b $88

|02F1D7| LDA.w #$0007
|02F1DA| STA.b $86

|02F1DC| STZ.b $0E

|02F1DE| LDA.w #$0008
|02F1E1| STA.b $08

|02F1E3| JSR TriggerAndFinishMapLoadStripe_Horizontal

|02F1E6| LDA.b $86
|02F1E8| CLC
|02F1E9| ADC.w #$0009
|02F1EC| AND.w #$001F
|02F1EF| STA.b $86

|02F1F1| LDA.b $84
|02F1F3| SEC
|02F1F4| SBC.w #$002E
|02F1F7| STA.b $84

|02F1F9| SEP #$30

|02F1FB| RTS

;===================================================================================================

pool OverworldTransitionScrollAndLoadMap

.vectors
|02F1FC| dw Overworld_ResetSubmodule
|02F1FE| dw BuildFullStripeDuringTransition_East
|02F200| dw BuildFullStripeDuringTransition_West
|02F202| dw Overworld_ResetSubmodule
|02F204| dw BuildFullStripeDuringTransition_South
|02F206| dw Overworld_ResetSubmodule
|02F208| dw Overworld_ResetSubmodule
|02F20A| dw Overworld_ResetSubmodule
|02F20C| dw BuildFullStripeDuringTransition_North

endpool

;---------------------------------------------------------------------------------------------------

OverworldTransitionScrollAndLoadMap:
|02F20E| SEP #$30

|02F210| LDA.w $0416
|02F213| ASL A
|02F214| TAX

|02F215| JMP.w (.vectors,X)

;===================================================================================================

BuildFullStripeDuringTransition_North:
|02F218| REP #$30

|02F21A| STZ.b $0E

|02F21C| JSR CheckForNewlyLoadedMapAreas_North_NewStripe

;===================================================================================================

OverworldTransitionScrollAndLoadMap_BuildStripe:
|02F21F| LDY.b $0E

|02F221| LDA.w #$FFFF
|02F224| STA.w $1100,Y
|02F227| STA.w $1102,Y

|02F22A| CPY.w #$0000
|02F22D| BEQ .empty

|02F22F| SEP #$30

|02F231| LDA.b #$03
|02F233| STA.b $17

.empty
|02F235| SEP #$30

|02F237| RTS

;===================================================================================================

BuildFullStripeDuringTransition_South:
|02F238| REP #$30

|02F23A| STZ.b $0E

|02F23C| JSR CheckForNewlyLoadedMapAreas_South_NewStripe

|02F23F| BRA OverworldTransitionScrollAndLoadMap_BuildStripe

;===================================================================================================

BuildFullStripeDuringTransition_West:
|02F241| REP #$30

|02F243| STZ.b $0E

|02F245| JSR CheckForNewlyLoadedMapAreas_West_NewStripe

|02F248| BRA OverworldTransitionScrollAndLoadMap_BuildStripe

;===================================================================================================

BuildFullStripeDuringTransition_East:
|02F24A| REP #$30

|02F24C| STZ.b $0E

|02F24E| JSR CheckForNewlyLoadedMapAreas_East_NewStripe

|02F251| BRA OverworldTransitionScrollAndLoadMap_BuildStripe

;===================================================================================================

pool OverworldHandleMapScroll

.vectors
|02F253| dw Overworld_ResetSubmodule
|02F255| dw MapScroll_East
|02F257| dw MapScroll_West
|02F259| dw Overworld_ResetSubmodule
|02F25B| dw MapScroll_South
|02F25D| dw MapScroll_SouthAndClear
|02F25F| dw MapScroll_SouthAndClear
|02F261| dw Overworld_ResetSubmodule
|02F263| dw MapScroll_North
|02F265| dw MapScroll_NorthAndClear
|02F267| dw MapScroll_NorthAndClear
|02F269| dw Overworld_ResetSubmodule
|02F26B| dw Overworld_ResetSubmodule
|02F26D| dw Overworld_ResetSubmodule
|02F26F| dw Overworld_ResetSubmodule
|02F271| dw Overworld_ResetSubmodule

endpool

;---------------------------------------------------------------------------------------------------

OverworldHandleMapScroll:
|02F273| REP #$30

|02F275| STZ.b $0E

|02F277| SEP #$30

|02F279| LDA.w $0416
|02F27C| ASL A
|02F27D| TAX

|02F27E| JSR (.vectors,X)

|02F281| REP #$30

|02F283| LDY.b $0E

|02F285| LDA.w #$FFFF
|02F288| STA.w $1100,Y
|02F28B| STA.w $1102,Y

|02F28E| CPY.w #$0000
|02F291| BEQ .no_update

|02F293| SEP #$30

|02F295| LDA.b #$03
|02F297| STA.b $17

.no_update
|02F299| SEP #$30

|02F29B| LDA.w $0416
|02F29E| STA.w $0418

|02F2A1| RTS

;===================================================================================================

Overworld_ResetSubmodule:
|02F2A2| STZ.b $11

|02F2A4| RTS

;===================================================================================================

MapScroll_East:
|02F2A5| JSR CheckForNewlyLoadedMapAreas_East

|02F2A8| STZ.w $0416

|02F2AB| RTS

;===================================================================================================

MapScroll_West:
|02F2AC| JSR CheckForNewlyLoadedMapAreas_West

|02F2AF| STZ.w $0416

|02F2B2| RTS

;===================================================================================================

MapScroll_South:
|02F2B3| JSR CheckForNewlyLoadedMapAreas_South

|02F2B6| STZ.w $0416

|02F2B9| RTS

;===================================================================================================

MapScroll_SouthAndClear:
|02F2BA| JSR CheckForNewlyLoadedMapAreas_South

|02F2BD| SEP #$30

|02F2BF| LDA.w $0416
|02F2C2| AND.b #$03
|02F2C4| STA.w $0416

|02F2C7| RTS

;===================================================================================================

MapScroll_North:
|02F2C8| JSR CheckForNewlyLoadedMapAreas_North

|02F2CB| STZ.w $0416

|02F2CE| RTS

;===================================================================================================

MapScroll_NorthAndClear:
|02F2CF| JSR CheckForNewlyLoadedMapAreas_North

|02F2D2| SEP #$30

|02F2D4| LDA.w $0416
|02F2D7| AND.b #$03
|02F2D9| STA.w $0416

|02F2DC| RTS

;===================================================================================================

CheckForNewlyLoadedMapAreas_North:
|02F2DD| REP #$30

|02F2DF| LDA.b $84
|02F2E1| CMP.w #$0080
|02F2E4| BMI .exit

|02F2E6| LDX.b $8A

|02F2E8| LDA.l OverworldScreenSize,X
|02F2EC| AND.w #$00FF
|02F2EF| BNE .dont_start_stripe

;===================================================================================================

#CheckForNewlyLoadedMapAreas_North_NewStripe:
|02F2F1| LDY.b $0E

|02F2F3| LDA.w #$0080
|02F2F6| STA.w $1100,Y

|02F2F9| INY
|02F2FA| INY
|02F2FB| STY.b $0E

|02F2FD| JSR BufferAndBuildMap16Stripes_Vertical

;---------------------------------------------------------------------------------------------------

.dont_start_stripe
|02F300| LDA.b $84
|02F302| SEC
|02F303| SBC.w #$0080
|02F306| STA.b $84

|02F308| LDA.b $88
|02F30A| DEC A
|02F30B| AND.w #$001F
|02F30E| STA.b $88

.exit
|02F310| RTS

;===================================================================================================

CheckForNewlyLoadedMapAreas_South:
|02F311| REP #$30

|02F313| LDA.b $84
|02F315| CMP.w #$1800
|02F318| BCS .exit

|02F31A| LDX.b $8A

|02F31C| LDA.l OverworldScreenSize,X
|02F320| AND.w #$00FF
|02F323| BNE .dont_start_stripe

;===================================================================================================

#CheckForNewlyLoadedMapAreas_South_NewStripe:
|02F325| LDY.b $0E

|02F327| LDA.w #$0080
|02F32A| STA.w $1100,Y

|02F32D| INY
|02F32E| INY
|02F32F| STY.b $0E

|02F331| JSR BufferAndBuildMap16Stripes_Vertical

;---------------------------------------------------------------------------------------------------

.dont_start_stripe
|02F334| LDA.b $84
|02F336| CLC
|02F337| ADC.w #$0080
|02F33A| STA.b $84

|02F33C| LDA.b $88
|02F33E| INC A
|02F33F| AND.w #$001F
|02F342| STA.b $88

.exit
|02F344| RTS

;===================================================================================================

CheckForNewlyLoadedMapAreas_West:
|02F345| REP #$30

|02F347| LDA.b $84

.cull_more
|02F349| CMP.w #$0080
|02F34C| BCC .in_range

|02F34E| SBC.w #$0080
|02F351| BRA .cull_more

.in_range
|02F353| CMP.w #$0000
|02F356| BEQ .exit

|02F358| LDX.b $8A

|02F35A| LDA.l OverworldScreenSize,X
|02F35E| AND.w #$00FF
|02F361| BNE .dont_start_stripe

;===================================================================================================

#CheckForNewlyLoadedMapAreas_West_NewStripe:
|02F363| LDY.b $0E

|02F365| LDA.w #$8040
|02F368| STA.w $1100,Y

|02F36B| INY
|02F36C| INY
|02F36D| STY.b $0E

|02F36F| JSR BufferAndBuildMap16Stripes_Horizontal

;---------------------------------------------------------------------------------------------------

.dont_start_stripe
|02F372| DEC.b $84
|02F374| DEC.b $84

|02F376| LDA.b $86
|02F378| DEC A
|02F379| AND.w #$001F
|02F37C| STA.b $86

.exit
|02F37E| RTS

;===================================================================================================

CheckForNewlyLoadedMapAreas_East:
|02F37F| REP #$30

|02F381| LDA.b $84

.cull_more
|02F383| CMP.w #$0080
|02F386| BCC .in_range

|02F388| SBC.w #$0080
|02F38B| BRA .cull_more

.in_range
|02F38D| CMP.w #$0060
|02F390| BCS .exit

|02F392| LDX.b $8A

|02F394| LDA.l OverworldScreenSize,X
|02F398| AND.w #$00FF
|02F39B| BNE .dont_start_stripe

;===================================================================================================

#CheckForNewlyLoadedMapAreas_East_NewStripe:
|02F39D| LDY.b $0E

|02F39F| LDA.w #$8040
|02F3A2| STA.w $1100,Y

|02F3A5| INY
|02F3A6| INY
|02F3A7| STY.b $0E

|02F3A9| JSR BufferAndBuildMap16Stripes_Horizontal

;---------------------------------------------------------------------------------------------------

.dont_start_stripe
|02F3AC| INC.b $84
|02F3AE| INC.b $84

|02F3B0| LDA.b $86
|02F3B2| INC A
|02F3B3| AND.w #$001F
|02F3B6| STA.b $86

.exit
|02F3B8| RTS

;===================================================================================================

BufferAndBuildMap16Stripes_Horizontal:
|02F3B9| LDA.w $0416
|02F3BC| AND.w #$0002
|02F3BF| TAX

|02F3C0| LDA.b $84
|02F3C2| SEC
|02F3C3| SBC.l Map16ReadOffset_Horizontal,X
|02F3C7| TAY

|02F3C8| LDA.b $88
|02F3CA| ASL A
|02F3CB| TAX

|02F3CC| LDA.w #$2000
|02F3CF| STA.b $00

|02F3D1| LDA.w #$007E
|02F3D4| STA.b $02

|02F3D6| LDA.w #$0010
|02F3D9| STA.b $03

;---------------------------------------------------------------------------------------------------

.next
|02F3DB| LDA.b [$00],Y
|02F3DD| STA.w $0500,X

|02F3E0| INX
|02F3E1| INX

|02F3E2| TXA
|02F3E3| AND.w #$003F
|02F3E6| TAX

|02F3E7| TYA
|02F3E8| CLC
|02F3E9| ADC.w #$0080
|02F3EC| TAY

|02F3ED| LDA.b [$00],Y
|02F3EF| STA.w $0500,X

|02F3F2| INX
|02F3F3| INX

|02F3F4| TXA
|02F3F5| AND.w #$003F
|02F3F8| TAX

|02F3F9| TYA
|02F3FA| CLC
|02F3FB| ADC.w #$0080
|02F3FE| TAY

|02F3FF| DEC.b $03
|02F401| BNE .next

;---------------------------------------------------------------------------------------------------

|02F403| STZ.b $00

|02F405| LDA.b $86
|02F407| STA.b $02

|02F409| CMP.w #$0010
|02F40C| BCC .start_low

|02F40E| AND.w #$000F
|02F411| STA.b $02

|02F413| LDA.w #$0400
|02F416| STA.b $00

.start_low
|02F418| LDA.b $02
|02F41A| ASL A
|02F41B| CLC
|02F41C| ADC.b $00
|02F41E| STA.b $00

|02F420| CLC
|02F421| ADC.w #$0800
|02F424| STA.b $0C

|02F426| LDA.l Map16BufferOffsetLow
|02F42A| JSR CreateMap16Stripes_Horizontal

|02F42D| LDA.b $0C
|02F42F| STA.b $00

|02F431| LDA.l Map16BufferOffsetHigh

;===================================================================================================

CreateMap16Stripes_Horizontal:
|02F435| STA.b $02

|02F437| LDY.b $0E

|02F439| LDA.b $00
|02F43B| STA.w $1100,Y

|02F43E| INC A
|02F43F| STA.w $1142,Y

|02F442| INY
|02F443| INY

|02F444| LDA.w #$0010
|02F447| STA.b $06

;---------------------------------------------------------------------------------------------------

.next
|02F449| LDX.b $02

|02F44B| LDA.w $0500,X

|02F44E| INX
|02F44F| INX
|02F450| STX.b $02

|02F452| ASL A
|02F453| ASL A
|02F454| ASL A
|02F455| TAX

|02F456| LDA.l Map16Definitions+0,X
|02F45A| STA.w $1100,Y

|02F45D| LDA.l Map16Definitions+2,X
|02F461| STA.w $1142,Y

|02F464| INY
|02F465| INY

|02F466| LDA.l Map16Definitions+4,X
|02F46A| STA.w $1100,Y

|02F46D| LDA.l Map16Definitions+6,X
|02F471| STA.w $1142,Y

|02F474| INY
|02F475| INY

|02F476| DEC.b $06
|02F478| BNE .next

;---------------------------------------------------------------------------------------------------

|02F47A| TYA
|02F47B| CLC
|02F47C| ADC.w #$0042
|02F47F| STA.b $0E

|02F481| RTS

;===================================================================================================

BufferAndBuildMap16Stripes_Vertical:
|02F482| LDA.w $0416
|02F485| AND.w #$0004
|02F488| LSR A
|02F489| TAX

|02F48A| LDA.b $84
|02F48C| SEC
|02F48D| SBC.l Map16ReadOffset_Vertical,X
|02F491| TAY

|02F492| LDA.b $86
|02F494| ASL A
|02F495| TAX

|02F496| LDA.w #$2000
|02F499| STA.b $00

|02F49B| LDA.w #$007E
|02F49E| STA.b $02

|02F4A0| LDA.w #$0010
|02F4A3| STA.b $03

;---------------------------------------------------------------------------------------------------

.next
|02F4A5| LDA.b [$00],Y
|02F4A7| STA.w $0500,X

|02F4AA| INX
|02F4AB| INX

|02F4AC| TXA
|02F4AD| AND.w #$003F
|02F4B0| TAX

|02F4B1| INY
|02F4B2| INY

|02F4B3| LDA.b [$00],Y
|02F4B5| STA.w $0500,X

|02F4B8| INX
|02F4B9| INX

|02F4BA| TXA
|02F4BB| AND.w #$003F
|02F4BE| TAX

|02F4BF| INY
|02F4C0| INY

|02F4C1| DEC.b $03
|02F4C3| BNE .next

;---------------------------------------------------------------------------------------------------

|02F4C5| STZ.b $00

|02F4C7| LDA.b $88
|02F4C9| STA.b $02

|02F4CB| CMP.w #$0010
|02F4CE| BCC .start_low

|02F4D0| AND.w #$000F
|02F4D3| STA.b $02

|02F4D5| LDA.w #$0800
|02F4D8| STA.b $00

.start_low
|02F4DA| LDA.b $02

|02F4DC| ASL A
|02F4DD| ASL A
|02F4DE| ASL A
|02F4DF| ASL A
|02F4E0| ASL A
|02F4E1| ASL A

|02F4E2| CLC
|02F4E3| ADC.b $00
|02F4E5| STA.b $00

|02F4E7| CLC
|02F4E8| ADC.w #$0400
|02F4EB| STA.b $0C

|02F4ED| LDY.b $0E

|02F4EF| LDA.b $00
|02F4F1| STA.w $1100,Y

|02F4F4| INY
|02F4F5| INY

|02F4F6| LDA.l Map16BufferOffsetLow
|02F4FA| JSR CreateMap16Stripes_Vertical

|02F4FD| LDY.b $0E

|02F4FF| LDA.b $0C
|02F501| STA.w $1100,Y

|02F504| INY
|02F505| INY
|02F506| LDA.l Map16BufferOffsetHigh

;===================================================================================================

CreateMap16Stripes_Vertical:
|02F50A| STA.b $02

|02F50C| LDA.w #$0010
|02F50F| STA.b $06

;---------------------------------------------------------------------------------------------------

.next
|02F511| LDX.b $02

|02F513| LDA.w $0500,X

|02F516| INX
|02F517| INX
|02F518| STX.b $02

|02F51A| ASL A
|02F51B| ASL A
|02F51C| ASL A
|02F51D| TAX

|02F51E| LDA.l Map16Definitions+0,X
|02F522| STA.w $1100,Y

|02F525| LDA.l Map16Definitions+4,X
|02F529| STA.w $1140,Y

|02F52C| INY
|02F52D| INY

|02F52E| LDA.l Map16Definitions+2,X
|02F532| STA.w $1100,Y

|02F535| LDA.l Map16Definitions+6,X
|02F539| STA.w $1140,Y

|02F53C| INY
|02F53D| INY

|02F53E| DEC.b $06
|02F540| BNE .next

;---------------------------------------------------------------------------------------------------

|02F542| TYA
|02F543| CLC
|02F544| ADC.w #$0040
|02F547| STA.b $0E

|02F549| RTS

;===================================================================================================

Overworld_DecompressAndDrawAllQuadrants:
|02F54A| LDA.b $8A
|02F54C| ASL A
|02F54D| ADC.b $8A
|02F54F| TAX

|02F550| LDA.w #$007E
|02F553| STA.b $02
|02F555| STA.b $05

|02F557| LDA.w #$2000
|02F55A| JSR Overworld_DecompressAndDrawOneQuadrant

;---------------------------------------------------------------------------------------------------

|02F55D| LDA.b $8A
|02F55F| INC A
|02F560| STA.b $00

|02F562| ASL A
|02F563| ADC.b $00
|02F565| TAX

|02F566| LDA.w #$2000
|02F569| CLC
|02F56A| ADC.w #$0040
|02F56D| JSR Overworld_DecompressAndDrawOneQuadrant

;---------------------------------------------------------------------------------------------------

|02F570| LDA.b $8A
|02F572| CLC
|02F573| ADC.w #$0008
|02F576| STA.b $00

|02F578| ASL A
|02F579| ADC.b $00
|02F57B| TAX

|02F57C| LDA.w #$3000
|02F57F| JSR Overworld_DecompressAndDrawOneQuadrant

;---------------------------------------------------------------------------------------------------

|02F582| LDA.b $8A
|02F584| CLC
|02F585| ADC.w #$0009
|02F588| STA.b $00

|02F58A| ASL A
|02F58B| ADC.b $00
|02F58D| TAX

|02F58E| LDA.w #$3000
|02F591| CLC
|02F592| ADC.w #$0040

;===================================================================================================

Overworld_DecompressAndDrawOneQuadrant:
|02F595| STA.b $00

|02F597| CLC
|02F598| ADC.w #$0080
|02F59B| STA.b $03

|02F59D| LDA.l OverworldLoad_Map32HPointers+0,X
|02F5A1| STA.b $C8

|02F5A3| LDA.l OverworldLoad_Map32HPointers+1,X
|02F5A7| STA.b $C9

|02F5A9| LDA.b $00
|02F5AB| PHA

|02F5AC| LDA.b $02
|02F5AE| PHA

|02F5AF| LDA.b $04
|02F5B1| PHA

|02F5B2| LDA.w #$7F4400
|02F5B5| STA.b $00

|02F5B7| LDA.w #$007F
|02F5BA| STA.b $02

|02F5BC| PHX

|02F5BD| SEP #$30

|02F5BF| JSR Decompress_bank02

|02F5C2| REP #$30

|02F5C4| JSR BlockMoveMap32Chunks_High

|02F5C7| PLX

;---------------------------------------------------------------------------------------------------

|02F5C8| LDA.l OverworldLoad_Map32LPointers+0,X
|02F5CC| STA.b $C8

|02F5CE| LDA.l OverworldLoad_Map32LPointers+1,X
|02F5D2| STA.b $C9

|02F5D4| LDA.w #$7F4400
|02F5D7| STA.b $00

|02F5D9| LDA.w #$007F
|02F5DC| STA.b $02

|02F5DE| PHX

|02F5DF| SEP #$30

|02F5E1| JSR Decompress_bank02

|02F5E4| REP #$30

|02F5E6| JSR BlockMoveMap32Chunks_Low

|02F5E9| PLX

;---------------------------------------------------------------------------------------------------

|02F5EA| PLA
|02F5EB| STA.b $04

|02F5ED| PLA
|02F5EE| STA.b $02

|02F5F0| PLA
|02F5F1| STA.b $00

|02F5F3| LDA.w #$7F4000
|02F5F6| STA.b $08

|02F5F8| LDA.w #$007F
|02F5FB| STA.b $0A

|02F5FD| SEP #$20

|02F5FF| PHB

|02F600| LDA.b #$7F
|02F602| PHA
|02F603| PLB

|02F604| REP #$30

|02F606| LDA.w #$FFFF
|02F609| STA.w $7F4440

|02F60C| STZ.b $06
|02F60E| STZ.b $0B

;---------------------------------------------------------------------------------------------------

.next_a
|02F610| LDA.w #$0010
|02F613| STA.b $0D

.next_b
|02F615| LDY.b $0B

|02F617| LDA.b [$08],Y
|02F619| ASL A

|02F61A| LDY.b $06
|02F61C| JSR ParseMap32Definition

|02F61F| STY.b $06

|02F621| INC.b $0B
|02F623| INC.b $0B

|02F625| DEC.b $0D
|02F627| BNE .next_b

|02F629| LDA.b $06
|02F62B| CLC
|02F62C| ADC.w #$00C0
|02F62F| STA.b $06

|02F631| CMP.w #$1000
|02F634| BCC .next_a

|02F636| PLB

|02F637| RTS

;===================================================================================================

BlockMoveMap32Chunks_High:
|02F638| SEP #$20

|02F63A| PHB

|02F63B| LDA.b #$7F
|02F63D| PHA
|02F63E| PLB

|02F63F| STA.b $02

|02F641| REP #$30

|02F643| LDX.w #$0000
|02F646| LDY.w #$0001

|02F649| LDA.w #$7F4000
|02F64C| STA.b $00

|02F64E| SEP #$20

;---------------------------------------------------------------------------------------------------

.next
|02F650| LDA.w $7F4400,X
|02F653| STA.b [$00],Y

|02F655| INY
|02F656| INY

|02F657| INX

|02F658| LDA.w $7F4400,X
|02F65B| STA.b [$00],Y

|02F65D| INY
|02F65E| INY

|02F65F| INX

|02F660| LDA.w $7F4400,X
|02F663| STA.b [$00],Y

|02F665| INY
|02F666| INY

|02F667| INX

|02F668| LDA.w $7F4400,X
|02F66B| STA.b [$00],Y

|02F66D| INY
|02F66E| INY

|02F66F| INX
|02F670| CPX.w #$0100
|02F673| BCC .next

|02F675| REP #$30

|02F677| PLB

|02F678| RTS

;---------------------------------------------------------------------------------------------------

#BlockMoveMap32Chunks_Low:
|02F679| SEP #$20

|02F67B| PHB

|02F67C| LDA.b #$7F
|02F67E| PHA
|02F67F| PLB

|02F680| STA.b $02

|02F682| REP #$30

|02F684| LDX.w #$0000
|02F687| TXY

|02F688| LDA.w #$7F4000
|02F68B| STA.b $00

|02F68D| SEP #$20

|02F68F| BRA .next

;===================================================================================================

ParseMap32Definition:
|02F691| PHA

|02F692| AND.w #$FFF8
|02F695| CMP.w $7F4440
|02F698| BNE .continue

|02F69A| JMP.w .skip

;---------------------------------------------------------------------------------------------------

.continue
|02F69D| STA.w $7F4440

|02F6A0| LSR A
|02F6A1| STA.w $7F4442

|02F6A4| LSR A
|02F6A5| ADC.w $7F4442
|02F6A8| TAX

|02F6A9| SEP #$20

;---------------------------------------------------------------------------------------------------

|02F6AB| LDA.l Map32_TopLeft+0,X
|02F6AF| STA.w $7F4400

|02F6B2| LDA.l Map32_TopLeft+1,X
|02F6B6| STA.w $7F4402

|02F6B9| LDA.l Map32_TopLeft+2,X
|02F6BD| STA.w $7F4404

|02F6C0| LDA.l Map32_TopLeft+3,X
|02F6C4| STA.w $7F4406

|02F6C7| LDA.l Map32_TopLeft+4,X
|02F6CB| PHA

|02F6CC| LSR A
|02F6CD| LSR A
|02F6CE| LSR A
|02F6CF| LSR A
|02F6D0| STA.w $7F4401

|02F6D3| PLA
|02F6D4| AND.b #$0F
|02F6D6| STA.w $7F4403

|02F6D9| LDA.l Map32_TopLeft+5,X
|02F6DD| PHA

|02F6DE| LSR A
|02F6DF| LSR A
|02F6E0| LSR A
|02F6E1| LSR A
|02F6E2| STA.w $7F4405

|02F6E5| PLA
|02F6E6| AND.b #$0F
|02F6E8| STA.w $7F4407

;---------------------------------------------------------------------------------------------------

|02F6EB| LDA.l Map32_TopRight+0,X
|02F6EF| STA.w $7F4410

|02F6F2| LDA.l Map32_TopRight+1,X
|02F6F6| STA.w $7F4412

|02F6F9| LDA.l Map32_TopRight+2,X
|02F6FD| STA.w $7F4414

|02F700| LDA.l Map32_TopRight+3,X
|02F704| STA.w $7F4416

|02F707| LDA.l Map32_TopRight+4,X
|02F70B| PHA

|02F70C| LSR A
|02F70D| LSR A
|02F70E| LSR A
|02F70F| LSR A
|02F710| STA.w $7F4411

|02F713| PLA
|02F714| AND.b #$0F
|02F716| STA.w $7F4413

|02F719| LDA.l Map32_TopRight+5,X
|02F71D| PHA

|02F71E| LSR A
|02F71F| LSR A
|02F720| LSR A
|02F721| LSR A
|02F722| STA.w $7F4415

|02F725| PLA
|02F726| AND.b #$0F
|02F728| STA.w $7F4417

;---------------------------------------------------------------------------------------------------

|02F72B| LDA.l Map32_BottomLeft+0,X
|02F72F| STA.w $7F4420

|02F732| LDA.l Map32_BottomLeft+1,X
|02F736| STA.w $7F4422

|02F739| LDA.l Map32_BottomLeft+2,X
|02F73D| STA.w $7F4424

|02F740| LDA.l Map32_BottomLeft+3,X
|02F744| STA.w $7F4426

|02F747| LDA.l Map32_BottomLeft+4,X
|02F74B| PHA

|02F74C| LSR A
|02F74D| LSR A
|02F74E| LSR A
|02F74F| LSR A
|02F750| STA.w $7F4421

|02F753| PLA
|02F754| AND.b #$0F
|02F756| STA.w $7F4423

|02F759| LDA.l Map32_BottomLeft+5,X
|02F75D| PHA

|02F75E| LSR A
|02F75F| LSR A
|02F760| LSR A
|02F761| LSR A
|02F762| STA.w $7F4425

|02F765| PLA
|02F766| AND.b #$0F
|02F768| STA.w $7F4427

;---------------------------------------------------------------------------------------------------

|02F76B| LDA.l Map32_BottomRight+0,X
|02F76F| STA.w $7F4430

|02F772| LDA.l Map32_BottomRight+1,X
|02F776| STA.w $7F4432

|02F779| LDA.l Map32_BottomRight+2,X
|02F77D| STA.w $7F4434

|02F780| LDA.l Map32_BottomRight+3,X
|02F784| STA.w $7F4436

|02F787| LDA.l Map32_BottomRight+4,X
|02F78B| PHA

|02F78C| LSR A
|02F78D| LSR A
|02F78E| LSR A
|02F78F| LSR A
|02F790| STA.w $7F4431

|02F793| PLA
|02F794| AND.b #$0F
|02F796| STA.w $7F4433

|02F799| LDA.l Map32_BottomRight+5,X
|02F79D| PHA

|02F79E| LSR A
|02F79F| LSR A
|02F7A0| LSR A
|02F7A1| LSR A
|02F7A2| STA.w $7F4435

|02F7A5| PLA
|02F7A6| AND.b #$0F
|02F7A8| STA.w $7F4437

|02F7AB| REP #$30

;---------------------------------------------------------------------------------------------------

.skip
|02F7AD| PLA
|02F7AE| AND.w #$0007
|02F7B1| TAX

|02F7B2| LDA.w $7F4400,X
|02F7B5| STA.b [$00],Y

|02F7B7| LDA.w $7F4420,X
|02F7BA| STA.b [$03],Y

|02F7BC| INY
|02F7BD| INY

|02F7BE| LDA.w $7F4410,X
|02F7C1| STA.b [$00],Y

|02F7C3| LDA.w $7F4430,X
|02F7C6| STA.b [$03],Y

|02F7C8| INY
|02F7C9| INY

|02F7CA| RTS

;===================================================================================================

LoadSubOverlayMap32:
|02F7CB| LDA.b $8A
|02F7CD| ASL A
|02F7CE| ADC.b $8A
|02F7D0| TAX

|02F7D1| LDA.w #$007E
|02F7D4| STA.b $02
|02F7D6| STA.b $05

|02F7D8| LDA.w #$7E4000
|02F7DB| STA.b $00

|02F7DD| CLC
|02F7DE| ADC.w #$0080
|02F7E1| STA.b $03

|02F7E3| LDA.l OverworldLoad_Map32HPointers+0,X
|02F7E7| STA.b $C8

|02F7E9| LDA.l OverworldLoad_Map32HPointers+1,X
|02F7ED| STA.b $C9

;---------------------------------------------------------------------------------------------------

|02F7EF| LDA.b $00
|02F7F1| PHA

|02F7F2| LDA.b $02
|02F7F4| PHA

|02F7F5| LDA.b $04
|02F7F7| PHA

|02F7F8| LDA.w #$7F4400
|02F7FB| STA.b $00

|02F7FD| LDA.w #$007F
|02F800| STA.b $02

;---------------------------------------------------------------------------------------------------

|02F802| PHX

|02F803| SEP #$30

|02F805| JSR Decompress_bank02

|02F808| REP #$30

|02F80A| JSR BlockMoveMap32Chunks_High

;---------------------------------------------------------------------------------------------------

|02F80D| PLX

|02F80E| LDA.l OverworldLoad_Map32LPointers+0,X
|02F812| STA.b $C8

|02F814| LDA.l OverworldLoad_Map32LPointers+1,X
|02F818| STA.b $C9

|02F81A| LDA.w #$7F4400
|02F81D| STA.b $00

|02F81F| LDA.w #$007F
|02F822| STA.b $02

;---------------------------------------------------------------------------------------------------

|02F824| PHX

|02F825| SEP #$30

|02F827| JSR Decompress_bank02

|02F82A| REP #$30

|02F82C| JSR BlockMoveMap32Chunks_Low

|02F82F| PLX

;---------------------------------------------------------------------------------------------------

|02F830| PLA
|02F831| STA.b $04

|02F833| PLA
|02F834| STA.b $02

|02F836| PLA
|02F837| STA.b $00

|02F839| LDA.w #$7F4000
|02F83C| STA.b $08

|02F83E| LDA.w #$007F
|02F841| STA.b $0A

;---------------------------------------------------------------------------------------------------

|02F843| SEP #$20

|02F845| PHB

|02F846| LDA.b #$7F
|02F848| PHA
|02F849| PLB

|02F84A| REP #$30

|02F84C| LDA.w #$FFFF
|02F84F| STA.w $7F4440

|02F852| STZ.b $06
|02F854| STZ.b $0B

.next_a
|02F856| LDA.w #$0010
|02F859| STA.b $0D

.next_b
|02F85B| LDY.b $0B

|02F85D| LDA.b [$08],Y
|02F85F| ASL A
|02F860| TAX

|02F861| LDY.b $06
|02F863| JSR ParseMap32Definition

|02F866| STY.b $06

|02F868| INC.b $0B
|02F86A| INC.b $0B

|02F86C| DEC.b $0D
|02F86E| BNE .next_b

|02F870| LDA.b $06
|02F872| CLC
|02F873| ADC.w #$00C0
|02F876| STA.b $06

|02F878| CMP.w #$1000
|02F87B| BCC .next_a

|02F87D| PLB

|02F87E| RTS

;===================================================================================================

UNREACHABLE_02F87F:
|02F87F| dw $0002, $0004

;===================================================================================================

Map16ReadOffset_Horizontal:
|02F883| dw $03D0

Map16ReadOffset_Vertical:
|02F885| dw $0410, $F410

Map16BufferOffsetLow:
|02F889| dw $0000

Map16BufferOffsetHigh:
|02F88B| dw $0020

;===================================================================================================

OverworldScreenSize:
|02F88D| db $00, $00, $01, $00, $00, $00, $00, $01
|02F895| db $00, $00, $01, $00, $00, $00, $00, $01
|02F89D| db $01, $01, $01, $01, $01, $01, $01, $01
|02F8A5| db $00, $00, $01, $00, $00, $01, $00, $00
|02F8AD| db $00, $00, $01, $00, $00, $01, $00, $00
|02F8B5| db $01, $01, $01, $01, $01, $01, $01, $01
|02F8BD| db $00, $00, $01, $01, $01, $00, $00, $01
|02F8C5| db $00, $00, $01, $01, $01, $00, $00, $01

|02F8CD| db $00, $00, $01, $00, $00, $00, $00, $01
|02F8D5| db $00, $00, $01, $00, $00, $00, $00, $01
|02F8DD| db $01, $01, $01, $01, $01, $01, $01, $01
|02F8E5| db $00, $00, $01, $00, $00, $01, $00, $00
|02F8ED| db $00, $00, $01, $00, $00, $01, $00, $00
|02F8F5| db $01, $01, $01, $01, $01, $01, $01, $01
|02F8FD| db $00, $00, $01, $01, $01, $00, $00, $01
|02F905| db $00, $00, $01, $01, $01, $00, $00, $01

|02F90D| db $01, $00, $00, $00, $00, $00, $00, $00
|02F915| db $00, $00, $00, $00, $00, $00, $00, $00
|02F91D| db $00, $00, $00, $00, $00, $00, $00, $00
|02F925| db $00, $00, $00, $00, $00, $00, $00, $00
|02F92D| db $00, $00, $00, $00, $00, $00, $00, $00
|02F935| db $00, $00, $00, $00, $00, $00, $00, $00
|02F93D| db $00, $00, $00, $00, $00, $00, $00, $00
|02F945| db $00, $00, $00, $00, $00, $00, $00, $00

;===================================================================================================

OverworldLoad_Map32HPointers:
|02F94D| dl OverworldMap32_Screen00_High
|02F950| dl OverworldMap32_Screen01_High
|02F953| dl OverworldMap32_Screen02_High
|02F956| dl OverworldMap32_Screen03_High

|02F959| dl OverworldMap32_Screen04_High
|02F95C| dl OverworldMap32_Screen05_High
|02F95F| dl OverworldMap32_Screen06_High
|02F962| dl OverworldMap32_Screen07_High

|02F965| dl OverworldMap32_Screen08_High
|02F968| dl OverworldMap32_Screen09_High
|02F96B| dl OverworldMap32_Screen0A_High
|02F96E| dl OverworldMap32_Screen0B_High

|02F971| dl OverworldMap32_Screen0C_High
|02F974| dl OverworldMap32_Screen0D_High
|02F977| dl OverworldMap32_Screen0E_High
|02F97A| dl OverworldMap32_Screen0F_High

|02F97D| dl OverworldMap32_Screen10_High
|02F980| dl OverworldMap32_Screen11_High
|02F983| dl OverworldMap32_Screen12_High
|02F986| dl OverworldMap32_Screen13_High

|02F989| dl OverworldMap32_Screen14_High
|02F98C| dl OverworldMap32_Screen15_High
|02F98F| dl OverworldMap32_Screen16_High
|02F992| dl OverworldMap32_Screen17_High

|02F995| dl OverworldMap32_Screen18_High
|02F998| dl OverworldMap32_Screen19_High
|02F99B| dl OverworldMap32_Screen1A_High
|02F99E| dl OverworldMap32_Screen1B_High

|02F9A1| dl OverworldMap32_Screen1C_High
|02F9A4| dl OverworldMap32_Screen1D_High
|02F9A7| dl OverworldMap32_Screen1E_High
|02F9AA| dl OverworldMap32_Screen1F_High

|02F9AD| dl OverworldMap32_Screen20_High
|02F9B0| dl OverworldMap32_Screen21_High
|02F9B3| dl OverworldMap32_Screen22_High
|02F9B6| dl OverworldMap32_Screen23_High

|02F9B9| dl OverworldMap32_Screen24_High
|02F9BC| dl OverworldMap32_Screen25_High
|02F9BF| dl OverworldMap32_Screen26_High
|02F9C2| dl OverworldMap32_Screen27_High

|02F9C5| dl OverworldMap32_Screen28_High
|02F9C8| dl OverworldMap32_Screen29_High
|02F9CB| dl OverworldMap32_Screen2A_High
|02F9CE| dl OverworldMap32_Screen2B_High

|02F9D1| dl OverworldMap32_Screen2C_High
|02F9D4| dl OverworldMap32_Screen2D_High
|02F9D7| dl OverworldMap32_Screen2E_High
|02F9DA| dl OverworldMap32_Screen2F_High

|02F9DD| dl OverworldMap32_Screen30_High
|02F9E0| dl OverworldMap32_Screen31_High
|02F9E3| dl OverworldMap32_Screen32_High
|02F9E6| dl OverworldMap32_Screen33_High

|02F9E9| dl OverworldMap32_Screen34_High
|02F9EC| dl OverworldMap32_Screen35_High
|02F9EF| dl OverworldMap32_Screen36_High
|02F9F2| dl OverworldMap32_Screen37_High

|02F9F5| dl OverworldMap32_Screen38_High
|02F9F8| dl OverworldMap32_Screen39_High
|02F9FB| dl OverworldMap32_Screen3A_High
|02F9FE| dl OverworldMap32_Screen3B_High

|02FA01| dl OverworldMap32_Screen3C_High
|02FA04| dl OverworldMap32_Screen3D_High
|02FA07| dl OverworldMap32_Screen3E_High
|02FA0A| dl OverworldMap32_Screen3F_High

;===================================================================================================

|02FA0D| dl OverworldMap32_Screen40_High
|02FA10| dl OverworldMap32_Screen41_High
|02FA13| dl OverworldMap32_Screen42_High
|02FA16| dl OverworldMap32_Screen43_High

|02FA19| dl OverworldMap32_Screen44_High
|02FA1C| dl OverworldMap32_Screen45_High
|02FA1F| dl OverworldMap32_Screen46_High
|02FA22| dl OverworldMap32_Screen47_High

|02FA25| dl OverworldMap32_Screen48_High
|02FA28| dl OverworldMap32_Screen49_High
|02FA2B| dl OverworldMap32_Screen0A_High
|02FA2E| dl OverworldMap32_Screen4B_High

|02FA31| dl OverworldMap32_Screen4C_High
|02FA34| dl OverworldMap32_Screen4D_High
|02FA37| dl OverworldMap32_Screen4E_High
|02FA3A| dl OverworldMap32_Screen4F_High

|02FA3D| dl OverworldMap32_Screen50_High
|02FA40| dl OverworldMap32_Screen11_High
|02FA43| dl OverworldMap32_Screen12_High
|02FA46| dl OverworldMap32_Screen53_High

|02FA49| dl OverworldMap32_Screen54_High
|02FA4C| dl OverworldMap32_Screen55_High
|02FA4F| dl OverworldMap32_Screen56_High
|02FA52| dl OverworldMap32_Screen17_High

|02FA55| dl OverworldMap32_Screen58_High
|02FA58| dl OverworldMap32_Screen59_High
|02FA5B| dl OverworldMap32_Screen5A_High
|02FA5E| dl OverworldMap32_Screen5B_High

|02FA61| dl OverworldMap32_Screen5C_High
|02FA64| dl OverworldMap32_Screen5D_High
|02FA67| dl OverworldMap32_Screen5E_High
|02FA6A| dl OverworldMap32_Screen5F_High

|02FA6D| dl OverworldMap32_Screen60_High
|02FA70| dl OverworldMap32_Screen61_High
|02FA73| dl OverworldMap32_Screen62_High
|02FA76| dl OverworldMap32_Screen63_High

|02FA79| dl OverworldMap32_Screen64_High
|02FA7C| dl OverworldMap32_Screen25_High
|02FA7F| dl OverworldMap32_Screen66_High
|02FA82| dl OverworldMap32_Screen67_High

|02FA85| dl OverworldMap32_Screen68_High
|02FA88| dl OverworldMap32_Screen69_High
|02FA8B| dl OverworldMap32_Screen2A_High
|02FA8E| dl OverworldMap32_Screen2B_High

|02FA91| dl OverworldMap32_Screen2C_High
|02FA94| dl OverworldMap32_Screen6D_High
|02FA97| dl OverworldMap32_Screen2E_High
|02FA9A| dl OverworldMap32_Screen2F_High

|02FA9D| dl OverworldMap32_Screen70_High
|02FAA0| dl OverworldMap32_Screen71_High
|02FAA3| dl OverworldMap32_Screen72_High
|02FAA6| dl OverworldMap32_Screen33_High

|02FAA9| dl OverworldMap32_Screen34_High
|02FAAC| dl OverworldMap32_Screen75_High
|02FAAF| dl OverworldMap32_Screen76_High
|02FAB2| dl OverworldMap32_Screen37_High

|02FAB5| dl OverworldMap32_Screen78_High
|02FAB8| dl OverworldMap32_Screen79_High
|02FABB| dl OverworldMap32_Screen7A_High
|02FABE| dl OverworldMap32_Screen3B_High

|02FAC1| dl OverworldMap32_Screen3C_High
|02FAC4| dl OverworldMap32_Screen7D_High
|02FAC7| dl OverworldMap32_Screen7E_High
|02FACA| dl OverworldMap32_Screen3F_High

;===================================================================================================

|02FACD| dl OverworldMap32_Screen80_High
|02FAD0| dl OverworldMap32_Screen81_High
|02FAD3| dl OverworldMap32_Screen82_High
|02FAD6| dl OverworldMap32_Screen00_High

|02FAD9| dl OverworldMap32_Screen00_High
|02FADC| dl OverworldMap32_Screen00_High
|02FADF| dl OverworldMap32_Screen00_High
|02FAE2| dl OverworldMap32_Screen00_High

|02FAE5| dl OverworldMap32_Screen88_High
|02FAE8| dl OverworldMap32_Screen89_High
|02FAEB| dl OverworldMap32_Screen8A_High
|02FAEE| dl OverworldMap32_Screen00_High

|02FAF1| dl OverworldMap32_Screen00_High
|02FAF4| dl OverworldMap32_Screen00_High
|02FAF7| dl OverworldMap32_Screen00_High
|02FAFA| dl OverworldMap32_Screen00_High

|02FAFD| dl OverworldMap32_Screen00_High
|02FB00| dl OverworldMap32_Screen00_High
|02FB03| dl OverworldMap32_Screen00_High
|02FB06| dl OverworldMap32_Screen88_High

|02FB09| dl OverworldMap32_Screen80_High
|02FB0C| dl OverworldMap32_Screen95_High
|02FB0F| dl OverworldMap32_Screen96_High
|02FB12| dl OverworldMap32_Screen97_High

|02FB15| dl OverworldMap32_Screen00_High
|02FB18| dl OverworldMap32_Screen00_High
|02FB1B| dl OverworldMap32_Screen00_High
|02FB1E| dl OverworldMap32_Screen00_High

|02FB21| dl OverworldMap32_Screen9C_High
|02FB24| dl OverworldMap32_Screen97_High
|02FB27| dl OverworldMap32_Screen9E_High
|02FB2A| dl OverworldMap32_Screen9F_High

;===================================================================================================

OverworldLoad_Map32LPointers:
|02FB2D| dl OverworldMap32_Screen00_Low
|02FB30| dl OverworldMap32_Screen01_Low
|02FB33| dl OverworldMap32_Screen02_Low
|02FB36| dl OverworldMap32_Screen03_Low

|02FB39| dl OverworldMap32_Screen04_Low
|02FB3C| dl OverworldMap32_Screen05_Low
|02FB3F| dl OverworldMap32_Screen06_Low
|02FB42| dl OverworldMap32_Screen07_Low

|02FB45| dl OverworldMap32_Screen08_Low
|02FB48| dl OverworldMap32_Screen09_Low
|02FB4B| dl OverworldMap32_Screen0A_Low
|02FB4E| dl OverworldMap32_Screen0B_Low

|02FB51| dl OverworldMap32_Screen0C_Low
|02FB54| dl OverworldMap32_Screen0D_Low
|02FB57| dl OverworldMap32_Screen0E_Low
|02FB5A| dl OverworldMap32_Screen0F_Low

|02FB5D| dl OverworldMap32_Screen10_Low
|02FB60| dl OverworldMap32_Screen11_Low
|02FB63| dl OverworldMap32_Screen12_Low
|02FB66| dl OverworldMap32_Screen13_Low

|02FB69| dl OverworldMap32_Screen14_Low
|02FB6C| dl OverworldMap32_Screen15_Low
|02FB6F| dl OverworldMap32_Screen16_Low
|02FB72| dl OverworldMap32_Screen17_Low

|02FB75| dl OverworldMap32_Screen18_Low
|02FB78| dl OverworldMap32_Screen19_Low
|02FB7B| dl OverworldMap32_Screen1A_Low
|02FB7E| dl OverworldMap32_Screen1B_Low

|02FB81| dl OverworldMap32_Screen1C_Low
|02FB84| dl OverworldMap32_Screen1D_Low
|02FB87| dl OverworldMap32_Screen1E_Low
|02FB8A| dl OverworldMap32_Screen1F_Low

|02FB8D| dl OverworldMap32_Screen20_Low
|02FB90| dl OverworldMap32_Screen21_Low
|02FB93| dl OverworldMap32_Screen22_Low
|02FB96| dl OverworldMap32_Screen23_Low

|02FB99| dl OverworldMap32_Screen24_Low
|02FB9C| dl OverworldMap32_Screen25_Low
|02FB9F| dl OverworldMap32_Screen26_Low
|02FBA2| dl OverworldMap32_Screen27_Low

|02FBA5| dl OverworldMap32_Screen28_Low
|02FBA8| dl OverworldMap32_Screen29_Low
|02FBAB| dl OverworldMap32_Screen2A_Low
|02FBAE| dl OverworldMap32_Screen2B_Low

|02FBB1| dl OverworldMap32_Screen2C_Low
|02FBB4| dl OverworldMap32_Screen2D_Low
|02FBB7| dl OverworldMap32_Screen2E_Low
|02FBBA| dl OverworldMap32_Screen2F_Low

|02FBBD| dl OverworldMap32_Screen30_Low
|02FBC0| dl OverworldMap32_Screen31_Low
|02FBC3| dl OverworldMap32_Screen32_Low
|02FBC6| dl OverworldMap32_Screen33_Low

|02FBC9| dl OverworldMap32_Screen34_Low
|02FBCC| dl OverworldMap32_Screen35_Low
|02FBCF| dl OverworldMap32_Screen36_Low
|02FBD2| dl OverworldMap32_Screen37_Low

|02FBD5| dl OverworldMap32_Screen38_Low
|02FBD8| dl OverworldMap32_Screen39_Low
|02FBDB| dl OverworldMap32_Screen3A_Low
|02FBDE| dl OverworldMap32_Screen3B_Low

|02FBE1| dl OverworldMap32_Screen3C_Low
|02FBE4| dl OverworldMap32_Screen3D_Low
|02FBE7| dl OverworldMap32_Screen3E_Low
|02FBEA| dl OverworldMap32_Screen3F_Low

;===================================================================================================

|02FBED| dl OverworldMap32_Screen40_Low
|02FBF0| dl OverworldMap32_Screen41_Low
|02FBF3| dl OverworldMap32_Screen42_Low
|02FBF6| dl OverworldMap32_Screen43_Low

|02FBF9| dl OverworldMap32_Screen44_Low
|02FBFC| dl OverworldMap32_Screen45_Low
|02FBFF| dl OverworldMap32_Screen46_Low
|02FC02| dl OverworldMap32_Screen47_Low

|02FC05| dl OverworldMap32_Screen48_Low
|02FC08| dl OverworldMap32_Screen49_Low
|02FC0B| dl OverworldMap32_Screen0A_Low
|02FC0E| dl OverworldMap32_Screen4B_Low

|02FC11| dl OverworldMap32_Screen4C_Low
|02FC14| dl OverworldMap32_Screen4D_Low
|02FC17| dl OverworldMap32_Screen4E_Low
|02FC1A| dl OverworldMap32_Screen4F_Low

|02FC1D| dl OverworldMap32_Screen50_Low
|02FC20| dl OverworldMap32_Screen11_Low
|02FC23| dl OverworldMap32_Screen12_Low
|02FC26| dl OverworldMap32_Screen53_Low

|02FC29| dl OverworldMap32_Screen54_Low
|02FC2C| dl OverworldMap32_Screen55_Low
|02FC2F| dl OverworldMap32_Screen56_Low
|02FC32| dl OverworldMap32_Screen17_Low

|02FC35| dl OverworldMap32_Screen58_Low
|02FC38| dl OverworldMap32_Screen59_Low
|02FC3B| dl OverworldMap32_Screen5A_Low
|02FC3E| dl OverworldMap32_Screen5B_Low

|02FC41| dl OverworldMap32_Screen5C_Low
|02FC44| dl OverworldMap32_Screen5D_Low
|02FC47| dl OverworldMap32_Screen5E_Low
|02FC4A| dl OverworldMap32_Screen5F_Low

|02FC4D| dl OverworldMap32_Screen60_Low
|02FC50| dl OverworldMap32_Screen61_Low
|02FC53| dl OverworldMap32_Screen62_Low
|02FC56| dl OverworldMap32_Screen63_Low

|02FC59| dl OverworldMap32_Screen64_Low
|02FC5C| dl OverworldMap32_Screen25_Low
|02FC5F| dl OverworldMap32_Screen66_Low
|02FC62| dl OverworldMap32_Screen67_Low

|02FC65| dl OverworldMap32_Screen68_Low
|02FC68| dl OverworldMap32_Screen69_Low
|02FC6B| dl OverworldMap32_Screen2A_Low
|02FC6E| dl OverworldMap32_Screen2B_Low

|02FC71| dl OverworldMap32_Screen2C_Low
|02FC74| dl OverworldMap32_Screen6D_Low
|02FC77| dl OverworldMap32_Screen2E_Low
|02FC7A| dl OverworldMap32_Screen2F_Low

|02FC7D| dl OverworldMap32_Screen70_Low
|02FC80| dl OverworldMap32_Screen71_Low
|02FC83| dl OverworldMap32_Screen72_Low
|02FC86| dl OverworldMap32_Screen33_Low

|02FC89| dl OverworldMap32_Screen34_Low
|02FC8C| dl OverworldMap32_Screen75_Low
|02FC8F| dl OverworldMap32_Screen76_Low
|02FC92| dl OverworldMap32_Screen37_Low

|02FC95| dl OverworldMap32_Screen78_Low
|02FC98| dl OverworldMap32_Screen79_Low
|02FC9B| dl OverworldMap32_Screen7A_Low
|02FC9E| dl OverworldMap32_Screen3B_Low

|02FCA1| dl OverworldMap32_Screen3C_Low
|02FCA4| dl OverworldMap32_Screen7D_Low
|02FCA7| dl OverworldMap32_Screen7E_Low
|02FCAA| dl OverworldMap32_Screen3F_Low

;===================================================================================================

|02FCAD| dl OverworldMap32_Screen80_Low
|02FCB0| dl OverworldMap32_Screen81_Low
|02FCB3| dl OverworldMap32_Screen82_Low
|02FCB6| dl OverworldMap32_Screen00_Low

|02FCB9| dl OverworldMap32_Screen00_Low
|02FCBC| dl OverworldMap32_Screen00_Low
|02FCBF| dl OverworldMap32_Screen00_Low
|02FCC2| dl OverworldMap32_Screen00_Low

|02FCC5| dl OverworldMap32_Screen88_Low
|02FCC8| dl OverworldMap32_Screen89_Low
|02FCCB| dl OverworldMap32_Screen8A_Low
|02FCCE| dl OverworldMap32_Screen00_Low

|02FCD1| dl OverworldMap32_Screen00_Low
|02FCD4| dl OverworldMap32_Screen00_Low
|02FCD7| dl OverworldMap32_Screen00_Low
|02FCDA| dl OverworldMap32_Screen00_Low

|02FCDD| dl OverworldMap32_Screen00_Low
|02FCE0| dl OverworldMap32_Screen00_Low
|02FCE3| dl OverworldMap32_Screen00_Low
|02FCE6| dl OverworldMap32_Screen88_Low

|02FCE9| dl OverworldMap32_Screen80_Low
|02FCEC| dl OverworldMap32_Screen95_Low
|02FCEF| dl OverworldMap32_Screen96_Low
|02FCF2| dl OverworldMap32_Screen97_Low

|02FCF5| dl OverworldMap32_Screen00_Low
|02FCF8| dl OverworldMap32_Screen00_Low
|02FCFB| dl OverworldMap32_Screen00_Low
|02FCFE| dl OverworldMap32_Screen00_Low

|02FD01| dl OverworldMap32_Screen9C_Low
|02FD04| dl OverworldMap32_Screen97_Low
|02FD07| dl OverworldMap32_Screen9E_Low
|02FD0A| dl OverworldMap32_Screen9F_Low

;===================================================================================================

LoadOverworldOverlay:
|02FD0D| REP #$30

|02FD0F| JSR LoadSubOverlayMap32

|02FD12| LDA.w #$1000
|02FD15| STA.b $CC

|02FD17| SEP #$30

|02FD19| JSR BuildBGOverlayFromMap16

|02FD1C| LDA.b #$04
|02FD1E| STA.b $17
|02FD20| STA.w $0710

|02FD23| INC.b $11

|02FD25| RTS

;===================================================================================================

BuildBGOverlayFromMap16:
|02FD26| PHB

|02FD27| LDA.b #^Map16Definitions
|02FD29| PHA
|02FD2A| PLB

|02FD2B| REP #$30

|02FD2D| LDA.w #$7E4000
|02FD30| STA.b $04

|02FD32| LDA.w #$007E

|02FD35| BRA .start

;===================================================================================================

#BuildOverworldFromMap16:
|02FD37| PHB

|02FD38| LDA.b #^Map16Definitions
|02FD3A| PHA
|02FD3B| PLB

|02FD3C| REP #$30

|02FD3E| LDA.w #$7E2000
|02FD41| STA.b $04

|02FD43| LDA.w #$007E

;===================================================================================================

.start
|02FD46| STA.b $06

|02FD48| LDA.b $84
|02FD4A| CLC
|02FD4B| ADC.w #$1000
|02FD4E| STA.b $84

|02FD50| STZ.b $0A
|02FD52| STZ.b $0E

|02FD54| LDA.w #$0010
|02FD57| STA.b $08

;---------------------------------------------------------------------------------------------------

.next
|02FD59| JSR CopyMap16ToBuffer

|02FD5C| LDA.b $84
|02FD5E| SEC
|02FD5F| SBC.w #$0080
|02FD62| STA.b $84

|02FD64| LDA.b $88
|02FD66| DEC A
|02FD67| AND.w #$001F
|02FD6A| STA.b $88

|02FD6C| JSR CopyMap16ToBuffer

|02FD6F| LDA.b $84
|02FD71| SEC
|02FD72| SBC.w #$0080
|02FD75| STA.b $84

|02FD77| LDA.b $88
|02FD79| DEC A
|02FD7A| AND.w #$001F
|02FD7D| STA.b $88

|02FD7F| DEC.b $08
|02FD81| BNE .next

;---------------------------------------------------------------------------------------------------

|02FD83| SEP #$30

|02FD85| PLB

|02FD86| RTS

;===================================================================================================

CopyMap16ToBuffer:
|02FD87| LDA.b $84
|02FD89| SEC
|02FD8A| SBC.w #$0410
|02FD8D| AND.w #$1FFF
|02FD90| TAY

|02FD91| LDA.b $86
|02FD93| ASL A
|02FD94| TAX

|02FD95| LDA.w #$0010
|02FD98| STA.b $00

;---------------------------------------------------------------------------------------------------

.next
|02FD9A| LDA.b [$04],Y
|02FD9C| STA.w $0500,X

|02FD9F| INX
|02FDA0| INX

|02FDA1| TXA
|02FDA2| AND.w #$003F
|02FDA5| TAX

|02FDA6| INY
|02FDA7| INY

|02FDA8| TYA
|02FDA9| AND.w #$1FFF
|02FDAC| TAY

|02FDAD| LDA.b [$04],Y
|02FDAF| STA.w $0500,X

|02FDB2| INX
|02FDB3| INX

|02FDB4| TXA
|02FDB5| AND.w #$003F
|02FDB8| TAX

|02FDB9| INY
|02FDBA| INY

|02FDBB| TYA
|02FDBC| AND.w #$1FFF
|02FDBF| TAY

|02FDC0| DEC.b $00
|02FDC2| BNE .next

;---------------------------------------------------------------------------------------------------

|02FDC4| LDA.b $88
|02FDC6| STA.b $02

|02FDC8| CMP.w #$0010
|02FDCB| BCC .not_lower_half_yet

|02FDCD| AND.w #$000F
|02FDD0| STA.b $02

|02FDD2| LDA.w #$0800
|02FDD5| STA.b $00

.not_lower_half_yet
|02FDD7| LDA.b $02

|02FDD9| ASL A
|02FDDA| ASL A
|02FDDB| ASL A
|02FDDC| ASL A
|02FDDD| ASL A
|02FDDE| ASL A

|02FDDF| CLC
|02FDE0| ADC.b $00
|02FDE2| STA.b $00

|02FDE4| LDA.l Map16BufferOffsetLow
|02FDE8| JSR CopyOneMap16Segment

|02FDEB| LDA.b $00
|02FDED| CLC
|02FDEE| ADC.w #$0400
|02FDF1| STA.b $00

|02FDF3| LDA.l Map16BufferOffsetHigh

;===================================================================================================

CopyOneMap16Segment:
|02FDF7| STA.b $02

|02FDF9| LDX.b $0A

|02FDFB| LDA.b $00
|02FDFD| ORA.b $CC
|02FDFF| STA.l $7F4000,X

|02FE03| INX
|02FE04| INX
|02FE05| STX.b $0A

|02FE07| LDX.b $0E

|02FE09| LDA.w #$0010
|02FE0C| STA.b $0C

;---------------------------------------------------------------------------------------------------

.next
|02FE0E| LDY.b $02

|02FE10| LDA.w $0500,Y

|02FE13| INY
|02FE14| INY
|02FE15| STY.b $02

|02FE17| ASL A
|02FE18| ASL A
|02FE19| ASL A
|02FE1A| TAY

|02FE1B| LDA.w Map16Definitions+0,Y
|02FE1E| STA.l $7F2000,X

|02FE22| LDA.w Map16Definitions+4,Y
|02FE25| STA.l $7F2040,X

|02FE29| INX
|02FE2A| INX

|02FE2B| LDA.w Map16Definitions+2,Y
|02FE2E| STA.l $7F2000,X

|02FE32| LDA.w Map16Definitions+6,Y
|02FE35| STA.l $7F2040,X

|02FE39| INX
|02FE3A| INX

|02FE3B| DEC.b $0C
|02FE3D| BNE .next

;---------------------------------------------------------------------------------------------------

|02FE3F| TXA
|02FE40| CLC
|02FE41| ADC.w #$0040
|02FE44| STA.b $0E

|02FE46| RTS

;===================================================================================================

RecoverTilesFromMirrorBonk:
|02FE47| REP #$30

|02FE49| LDA.w $04AC
|02FE4C| BEQ .exit

|02FE4E| LDX.w #$0000
|02FE51| STX.b $00

;---------------------------------------------------------------------------------------------------

.next
|02FE53| LDX.b $00

|02FE55| LDA.l $7EF800,X
|02FE59| TAY

|02FE5A| LDA.l $7EFA00,X
|02FE5E| TYX

|02FE5F| STA.l $7E2000,X

|02FE63| INC.b $00
|02FE65| INC.b $00

|02FE67| LDA.b $00
|02FE69| CMP.w $04AC
|02FE6C| BNE .next

;---------------------------------------------------------------------------------------------------

.exit
|02FE6E| SEP #$30

|02FE70| RTS

;===================================================================================================

DecompressEnemyDamageSubclasses:
|02FE71| LDA.b #$7F4000
|02FE73| STA.b $00

|02FE75| LDA.b #>$7F4000
|02FE77| STA.b $01

|02FE79| LDA.b #^$7F4000
|02FE7B| STA.b $02

|02FE7D| LDA.b #EnemyDamageCompressed
|02FE7F| STA.b $C8

|02FE81| LDA.b #>EnemyDamageCompressed
|02FE83| STA.b $C9

|02FE85| LDA.b #^EnemyDamageCompressed
|02FE87| STA.b $CA

;---------------------------------------------------------------------------------------------------

|02FE89| JSR Decompress_bank02

|02FE8C| LDA.b #$7F4000
|02FE8E| STA.b $00

|02FE90| LDA.b #>$7F4000
|02FE92| STA.b $01

|02FE94| LDA.b #^$7F4000
|02FE96| STA.b $02

|02FE98| REP #$10

|02FE9A| LDX.w #$0000
|02FE9D| TXY

;---------------------------------------------------------------------------------------------------

.next
|02FE9E| LDA.b [$00],Y
|02FEA0| PHA

|02FEA1| LSR A
|02FEA2| LSR A
|02FEA3| LSR A
|02FEA4| LSR A
|02FEA5| STA.l $7F6000+0,X

|02FEA9| PLA
|02FEAA| AND.b #$0F
|02FEAC| STA.l $7F6000+1,X

|02FEB0| INY

|02FEB1| INX
|02FEB2| INX
|02FEB3| CPX.w #$1000
|02FEB6| BCC .next

;---------------------------------------------------------------------------------------------------

|02FEB8| SEP #$30

|02FEBA| RTL

;===================================================================================================

Decompress_bank02:
|02FEBB| REP #$10

|02FEBD| LDY.w #$0000

.next_byte
|02FEC0| JSR .read_next_byte

|02FEC3| CMP.b #$FF
|02FEC5| BNE .continue

|02FEC7| SEP #$10

|02FEC9| RTS

;---------------------------------------------------------------------------------------------------

.continue
|02FECA| STA.b $CD

|02FECC| AND.b #$E0
|02FECE| CMP.b #$E0
|02FED0| BEQ .expanded

|02FED2| PHA

|02FED3| LDA.b $CD

|02FED5| REP #$20

|02FED7| AND.w #$001F
|02FEDA| BRA .normal

;---------------------------------------------------------------------------------------------------

.expanded
|02FEDC| LDA.b $CD
|02FEDE| ASL A
|02FEDF| ASL A
|02FEE0| ASL A
|02FEE1| AND.b #$E0
|02FEE3| PHA

|02FEE4| LDA.b $CD
|02FEE6| AND.b #$03
|02FEE8| XBA

|02FEE9| JSR .read_next_byte

|02FEEC| REP #$20

;---------------------------------------------------------------------------------------------------

.normal
|02FEEE| INC A
|02FEEF| STA.b $CB

|02FEF1| SEP #$20

|02FEF3| PLA
|02FEF4| BEQ .raw_copy
|02FEF6| BMI .copy

|02FEF8| ASL A
|02FEF9| BPL .repeating8

|02FEFB| ASL A
|02FEFC| BPL .repeating16

;---------------------------------------------------------------------------------------------------

|02FEFE| JSR .read_next_byte

|02FF01| LDX.b $CB

.next_incremental
|02FF03| STA.b [$00],Y

|02FF05| INC A
|02FF06| INY

|02FF07| DEX
|02FF08| BNE .next_incremental

|02FF0A| BRA .next_byte

;---------------------------------------------------------------------------------------------------

.raw_copy
|02FF0C| JSR .read_next_byte

|02FF0F| STA.b [$00],Y
|02FF11| INY

|02FF12| LDX.b $CB
|02FF14| DEX
|02FF15| STX.b $CB

|02FF17| BNE .raw_copy

|02FF19| BRA .next_byte

;---------------------------------------------------------------------------------------------------

.repeating8
|02FF1B| JSR .read_next_byte

|02FF1E| LDX.b $CB

.next_repeating8
|02FF20| STA.b [$00],Y

|02FF22| INY

|02FF23| DEX
|02FF24| BNE .next_repeating8

|02FF26| BRA .next_byte

;---------------------------------------------------------------------------------------------------

.repeating16
|02FF28| JSR .read_next_byte
|02FF2B| XBA

|02FF2C| JSR .read_next_byte
|02FF2F| LDX.b $CB

.next_repeating16
|02FF31| XBA
|02FF32| STA.b [$00],Y

|02FF34| INY

|02FF35| DEX
|02FF36| BEQ .done16

|02FF38| XBA
|02FF39| STA.b [$00],Y

|02FF3B| INY

|02FF3C| DEX
|02FF3D| BNE .next_repeating16

.done16
|02FF3F| JMP.w .next_byte

;---------------------------------------------------------------------------------------------------

.copy
|02FF42| JSR .read_next_byte
|02FF45| XBA

|02FF46| JSR .read_next_byte
|02FF49| TAX

.next_copy
|02FF4A| PHY
|02FF4B| TXY

|02FF4C| LDA.b [$00],Y

|02FF4E| TYX
|02FF4F| PLY

.do_copy
|02FF50| STA.b [$00],Y

|02FF52| INY
|02FF53| INX

|02FF54| REP #$20

|02FF56| DEC.b $CB

|02FF58| SEP #$20

|02FF5A| BNE .next_copy

|02FF5C| JMP.w .next_byte

;---------------------------------------------------------------------------------------------------

.read_next_byte
|02FF5F| LDA.b [$C8]

|02FF61| LDX.b $C8

|02FF63| INX
|02FF64| BNE .exit

|02FF66| LDX.b #$00
|02FF68| BRA .do_copy

.unreachable
|02FF6A| DEX

.exit
|02FF6B| STX.b $C8

|02FF6D| RTS

;===================================================================================================
; FREE ROM: 0x92
;===================================================================================================
NULL_02FF6E:
|02FF6E| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FF76| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FF7E| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FF86| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FF8E| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FF96| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FF9E| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FFA6| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FFAE| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FFB6| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FFBE| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FFC6| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FFCE| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FFD6| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FFDE| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FFE6| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FFEE| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FFF6| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|02FFFE| db $FF, $FF

;===================================================================================================
