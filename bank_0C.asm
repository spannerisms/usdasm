; see «overworlds.asm»

org $0CC10C

;===================================================================================================
; FREE ROM: 0x14
;===================================================================================================
NULL_0CC10C:
#_0CC10C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CC114: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CC11C: db $FF, $FF, $FF, $FF

;===================================================================================================

Module00_Intro:
#_0CC120: LDA.b $11
#_0CC122: CMP.b #$08
#_0CC124: BCC .run_submodule

#_0CC126: LDA.b $F6
#_0CC128: AND.b #$C0

#_0CC12A: ORA.b $F4
#_0CC12C: AND.b #$D0
#_0CC12E: BEQ .run_submodule

#_0CC130: JMP.w FadeMusicAndResetSRAMMirror

;---------------------------------------------------------------------------------------------------

.run_submodule
#_0CC133: LDA.b $11
#_0CC135: JSL JumpTableLong
#_0CC139: dl Intro_InitialInitialization
#_0CC13C: dl Intro_InitializeMemory
#_0CC13F: dl Intro_InitializeTriforcePolyThread
#_0CC142: dl Intro_HandleAllTriforceAnimations
#_0CC145: dl Intro_HandleAllTriforceAnimations
#_0CC148: dl Intro_FadeLogoIn
#_0CC14B: dl Intro_SwordStab
#_0CC14E: dl Intro_PopSubtitleCard
#_0CC151: dl Intro_TrianglesBeforeAttract
#_0CC154: dl Intro_HandleAllTriforceAnimations
#_0CC157: dl Intro_InitializeTriforcePolyThread
#_0CC15A: dl Intro_HandleAllTriforceAnimations

;===================================================================================================

Intro_InitialInitialization:
#_0CC15D: JSL Intro_SetupScreen

#_0CC161: LDA.b #$0F
#_0CC163: STA.b $13

#_0CC165: STZ.b $B0

#_0CC167: INC.b $15
#_0CC169: INC.b $11

#_0CC16B: LDA.b #$0A ; SFX3.0A
#_0CC16D: STA.w $012F

;===================================================================================================

Intro_InitializeMemory:
#_0CC170: JSR Intro_DisplayLogo

#_0CC173: LDA.b $B0
#_0CC175: INC.b $B0
#_0CC177: CMP.b #$0B
#_0CC179: BCS Intro_InitializeMemory_darken

#_0CC17B: JSL JumpTableLong
#_0CC17F: dl Intro_Clear1kbBlocksOfWRAM
#_0CC182: dl Intro_Clear1kbBlocksOfWRAM
#_0CC185: dl Intro_Clear1kbBlocksOfWRAM
#_0CC188: dl Intro_Clear1kbBlocksOfWRAM
#_0CC18B: dl Intro_Clear1kbBlocksOfWRAM
#_0CC18E: dl Intro_Clear1kbBlocksOfWRAM
#_0CC191: dl Intro_Clear1kbBlocksOfWRAM
#_0CC194: dl Intro_Clear1kbBlocksOfWRAM
#_0CC197: dl Intro_LoadTextAndPalettes
#_0CC19A: dl LoadItemGFXIntoWRAM4BPPBuffer
#_0CC19D: dl LoadFollowerGraphics

;===================================================================================================

Intro_Clear1kbBlocksOfWRAM:
#_0CC1A0: REP #$30

#_0CC1A2: LDX.b $C8

#_0CC1A4: LDA.w #$0000

.loop
#_0CC1A7: STA.l $7E2000,X
#_0CC1AB: STA.l $7E4000,X
#_0CC1AF: STA.l $7E6000,X

#_0CC1B3: STA.l $7E8000,X
#_0CC1B7: STA.l $7EA000,X
#_0CC1BB: STA.l $7EC000,X
#_0CC1BF: STA.l $7EE000,X

#_0CC1C3: STA.l $7F0000,X
#_0CC1C7: STA.l $7F2000,X
#_0CC1CB: STA.l $7F4000,X
#_0CC1CF: STA.l $7F6000,X

#_0CC1D3: STA.l $7F8000,X
#_0CC1D7: STA.l $7FA000,X
#_0CC1DB: STA.l $7FC000,X
#_0CC1DF: STA.l $7FE000,X

#_0CC1E3: DEX
#_0CC1E4: DEX
#_0CC1E5: CPX.b $CA
#_0CC1E7: BNE .loop

;---------------------------------------------------------------------------------------------------

#_0CC1E9: STX.b $C8

#_0CC1EB: TXA
#_0CC1EC: SEC
#_0CC1ED: SBC.w #$0400
#_0CC1F0: STA.b $CA

#_0CC1F2: SEP #$30

#_0CC1F4: RTL

;===================================================================================================

Intro_InitializeMemory_darken:
#_0CC1F5: DEC.b $13
#_0CC1F7: BNE .still_darkening

;===================================================================================================

#Intro_InitializeDefaultGFX:
#_0CC1F9: JSL EnableForceBlank
#_0CC1FD: JSL EraseTilemaps_normal

#_0CC201: LDA.b #$02
#_0CC203: STA.w OBSEL

#_0CC206: LDA.b #$23
#_0CC208: STA.w $0AA1

#_0CC20B: LDA.b #$7D
#_0CC20D: STA.w $0AA3

#_0CC210: LDA.b #$51
#_0CC212: STA.w $0AA2

#_0CC215: LDA.b #$08
#_0CC217: STA.w $0AA4

#_0CC21A: JSL LoadDefaultGraphics
#_0CC21E: JSL InitializeTilesets

#_0CC222: LDY.b #$5D
#_0CC224: JSL DecompressAnimatedUnderworldTiles

;---------------------------------------------------------------------------------------------------

#_0CC228: LDA.b #$02
#_0CC22A: STA.l $7EC00D

#_0CC22E: LDA.b #$00
#_0CC230: STA.l $7EC00E

#_0CC234: STZ.b $8A

#_0CC236: STZ.w $0AB6
#_0CC239: STZ.w $0AB8

#_0CC23C: STZ.b $C8
#_0CC23E: STZ.b $C9

#_0CC240: STZ.b $CA
#_0CC242: STZ.b $CB

#_0CC244: LDA.b #$02
#_0CC246: STA.l $7EC009

#_0CC24A: LDA.b #$1F
#_0CC24C: STA.l $7EC007

#_0CC250: LDA.b #$00
#_0CC252: STA.l $7EC00B

#_0CC256: STZ.w $0AA6

#_0CC259: INC.b $11

.still_darkening
#_0CC25B: RTL

;===================================================================================================

Intro_FadeLogoIn:
#_0CC25C: JSL Intro_HandleAllTriforceAnimations

#_0CC260: LDA.b $1A
#_0CC262: LSR A
#_0CC263: BCC .exit_a

#_0CC265: JSL IntroLogoPaletteFadeIn

#_0CC269: LDA.l $7EC007
#_0CC26D: BNE .dont_advance

#_0CC26F: LDA.b #$2A
#_0CC271: STA.b $B0

#_0CC273: INC.b $11

#_0CC275: JSR Intro_InitLogoSword

.exit_a
#_0CC278: RTL

;---------------------------------------------------------------------------------------------------

.dont_advance
#_0CC279: CMP.b #$0D
#_0CC27B: BNE .exit_b

#_0CC27D: LDA.b #$15
#_0CC27F: STA.b $1C
#_0CC281: STZ.b $1D

.exit_b
#_0CC283: RTL

;===================================================================================================

Intro_PopSubtitleCard:
#_0CC284: JSR Intro_HandleLogoSword

#_0CC287: JSL Intro_HandleAllTriforceAnimations

#_0CC28B: LDA.l $7EC007
#_0CC28F: BEQ .delay_fade

#_0CC291: LDA.b $1A
#_0CC293: LSR A
#_0CC294: BCC .exit

#_0CC296: JML IntroTitleCardPaletteFadeIn

.delay_fade
#_0CC29A: LDA.b $F6
#_0CC29C: AND.b #$C0
#_0CC29E: ORA.b $F4
#_0CC2A0: AND.b #$D0
#_0CC2A2: BEQ .delay_music

#_0CC2A4: JMP.w FadeMusicAndResetSRAMMirror


.delay_music
#_0CC2A7: DEC.b $B0
#_0CC2A9: BNE .exit
#_0CC2AB: INC.b $11

.exit
#_0CC2AD: RTL

;===================================================================================================

Intro_SwordStab:
#_0CC2AE: JSL Intro_HandleAllTriforceAnimations

#_0CC2B2: STZ.w $1F00
#_0CC2B5: STZ.w $012A

#_0CC2B8: JSR Intro_HandleLogoSword

#_0CC2BB: DEC.b $B0
#_0CC2BD: BNE .exit

#_0CC2BF: INC.b $11

#_0CC2C1: LDA.b #$02
#_0CC2C3: STA.b $99

#_0CC2C5: LDA.b #$22
#_0CC2C7: STA.b $9A

#_0CC2C9: LDA.b #$1F
#_0CC2CB: STA.l $7EC007

#_0CC2CF: LDA.b #$02
#_0CC2D1: STA.b $1D

.exit
#_0CC2D3: RTL

;===================================================================================================

Intro_TrianglesBeforeAttract:
#_0CC2D4: JSL Intro_HandleAllTriforceAnimations

#_0CC2D8: STZ.w $1F00
#_0CC2DB: STZ.w $012A

#_0CC2DE: JSR Intro_HandleLogoSword

#_0CC2E1: DEC.b $B0
#_0CC2E3: BNE .exit

#_0CC2E5: INC.b $11

#_0CC2E7: LDA.b #$14
#_0CC2E9: STA.b $10

#_0CC2EB: STZ.b $11
#_0CC2ED: STZ.b $22

.exit
#_0CC2EF: RTL

;===================================================================================================

FadeMusicAndResetSRAMMirror:
#_0CC2F0: LDA.b #$FF
#_0CC2F2: STA.w $0128

#_0CC2F5: LDA.b #$15
#_0CC2F7: STA.b $1C

#_0CC2F9: STZ.b $1D
#_0CC2FB: STZ.b $1B

#_0CC2FD: LDA.b #$F1 ; SONG F1 - fade
#_0CC2FF: STA.w $012C

#_0CC302: JSL FixedColorBlack

;---------------------------------------------------------------------------------------------------

#_0CC306: REP #$30

#_0CC308: LDX.w #$006E

.next_dp
#_0CC30B: STZ.b $20,X

#_0CC30D: DEX
#_0CC30E: DEX
#_0CC30F: BPL .next_dp

;---------------------------------------------------------------------------------------------------

#_0CC311: LDX.w #$0000
#_0CC314: TXA

.next_sram
#_0CC315: STA.l $7EF000,X
#_0CC319: STA.l $7EF100,X
#_0CC31D: STA.l $7EF200,X
#_0CC321: STA.l $7EF300,X
#_0CC325: STA.l $7EF400,X

#_0CC329: INX
#_0CC32A: INX
#_0CC32B: CPX.w #$0100
#_0CC32E: BNE .next_sram

;---------------------------------------------------------------------------------------------------

#_0CC330: SEP #$30

#_0CC332: LDA.b #$01
#_0CC334: STA.b $10
#_0CC336: STA.w $04AA

#_0CC339: STZ.b $11

#_0CC33B: RTL

;===================================================================================================

Intro_InitializeTriforcePolyThread:
#_0CC33C: LDA.b #$08
#_0CC33E: STA.w $0AA4

#_0CC341: JSL LoadCommonSprites_long
#_0CC345: JSR TriforceInitializePolyhedralModule

#_0CC348: LDA.b #$01
#_0CC34A: STA.w $1E10
#_0CC34D: STA.w $1E11
#_0CC350: STA.w $1E12

#_0CC353: LDA.b #$00
#_0CC355: STA.w $1E18
#_0CC358: STA.w $1E19
#_0CC35B: STA.w $1E1A

#_0CC35E: LDA.b #$01
#_0CC360: STA.w $1E14

#_0CC363: LDA.b #$02
#_0CC365: STA.w $1E1C

#_0CC368: LDA.b #$0F
#_0CC36A: STA.b $13

#_0CC36C: INC.b $11

#_0CC36E: RTL

;===================================================================================================

TriforceInitializePolyhedralModule:
#_0CC36F: JSL Polyhedral_InitializeThread
#_0CC373: JSR LoadTriforceSpritePalette

#_0CC376: LDA.b #$90
#_0CC378: STA.b $FF

#_0CC37A: LDA.b #$FF
#_0CC37C: STA.w $1F02

#_0CC37F: LDA.b #$20
#_0CC381: STA.w $1F06
#_0CC384: STA.w $1F07
#_0CC387: STA.w $1F08

#_0CC38A: LDA.b #$A0
#_0CC38C: STA.w $1F04

#_0CC38F: LDA.b #$60
#_0CC391: STA.w $1F05

#_0CC394: LDA.b #$01
#_0CC396: STA.w $1F01
#_0CC399: STA.w $1F03
#_0CC39C: STA.w $012A
#_0CC39F: STA.w $1F00

;---------------------------------------------------------------------------------------------------

#_0CC3A2: LDX.b #$0F

.clear_next
#_0CC3A4: STZ.w $1E00,X
#_0CC3A7: STZ.w $1E10,X
#_0CC3AA: STZ.w $1E20,X
#_0CC3AD: STZ.w $1E30,X
#_0CC3B0: STZ.w $1E40,X
#_0CC3B3: STZ.w $1E50,X
#_0CC3B6: STZ.w $1E60,X

#_0CC3B9: DEX
#_0CC3BA: BPL .clear_next

;---------------------------------------------------------------------------------------------------

#_0CC3BC: RTS

;===================================================================================================

LoadTriforceSpritePalette:
#_0CC3BD: REP #$20

#_0CC3BF: LDA.l Palettes_Triforce+0
#_0CC3C3: STA.l $7EC6A0

#_0CC3C7: LDA.l Palettes_Triforce+2
#_0CC3CB: STA.l $7EC6A2

#_0CC3CF: LDA.l Palettes_Triforce+4
#_0CC3D3: STA.l $7EC6A4

#_0CC3D7: LDA.l Palettes_Triforce+6
#_0CC3DB: STA.l $7EC6A6

#_0CC3DF: LDA.l Palettes_Triforce+8
#_0CC3E3: STA.l $7EC6A8

#_0CC3E7: LDA.l Palettes_Triforce+10
#_0CC3EB: STA.l $7EC6AA

#_0CC3EF: LDA.l Palettes_Triforce+12
#_0CC3F3: STA.l $7EC6AC

#_0CC3F7: LDA.l Palettes_Triforce+14
#_0CC3FB: STA.l $7EC6AE

#_0CC3FF: SEP #$30

#_0CC401: INC.b $15

#_0CC403: RTS

;===================================================================================================

Intro_HandleAllTriforceAnimations:
#_0CC404: PHB
#_0CC405: PHK
#_0CC406: PLB

#_0CC407: INC.w $1E0A

#_0CC40A: JSR Intro_AnimateTriforce
#_0CC40D: JSR Scene_AnimateEverySprite

#_0CC410: PLB

#_0CC411: RTL

;===================================================================================================

Scene_AnimateEverySprite:
#_0CC412: LDA.b #$00
#_0CC414: STA.w $1E08

#_0CC417: LDA.b #$08
#_0CC419: STA.w $1E09

#_0CC41C: LDX.b #$07

.next
#_0CC41E: JSR Scene_AnimateSingleSprite

#_0CC421: DEX
#_0CC422: BPL .next

#_0CC424: RTS

;===================================================================================================

Palettes_Triforce:
; #RRGGBB :  000000, 685000, 806800, 987800, B09000, C89800, E8B800, F8D000
#_0CC425: dw  $0000,  $014D,  $01B0,  $01F3,  $0256,  $0279,  $02FD,  $035F

;===================================================================================================

Intro_AnimateTriforce:
#_0CC435: LDA.b #$01
#_0CC437: STA.w $012A

#_0CC43A: LDA.w $1F00
#_0CC43D: BNE .exit

#_0CC43F: JSR Intro_AnimateTriforceDanceMoves

#_0CC442: LDA.b #$01
#_0CC444: STA.w $1F00

.exit
#_0CC447: RTS

;===================================================================================================

Intro_AnimateTriforceDanceMoves:
#_0CC448: LDA.w $1E00
#_0CC44B: JSL JumpTableLocal
#_0CC44F: dw Intro_TriforceTinyDancers
#_0CC451: dw Intro_TriforceSpinInwards
#_0CC453: dw Intro_TriforceNearingMerge
#_0CC455: dw Intro_MergeTriforceSpin
#_0CC457: dw Intro_TriforceTerminateSpin
#_0CC459: dw Intro_TriforceDoNothing

;===================================================================================================

Intro_TriforceTinyDancers:
#_0CC45B: INC.w $1E01

#_0CC45E: LDA.w $1E01
#_0CC461: CMP.b #$40
#_0CC463: BNE .delay

#_0CC465: INC.w $1E00

.delay
#_0CC468: LDA.w $1F05
#_0CC46B: CLC
#_0CC46C: ADC.b #$05
#_0CC46E: STA.w $1F05

#_0CC471: LDA.w $1F04
#_0CC474: CLC
#_0CC475: ADC.b #$03
#_0CC477: STA.w $1F04

#_0CC47A: RTS

;===================================================================================================

Intro_TriforceSpinInwards:
#_0CC47B: LDA.w $1F02
#_0CC47E: CMP.b #$02
#_0CC480: BCS .delay

#_0CC482: STZ.w $1F02

#_0CC485: INC.w $1E00

#_0CC488: LDA.b #$40
#_0CC48A: STA.w $1E01

#_0CC48D: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_0CC48E: SBC.b #$02
#_0CC490: STA.w $1F02

#_0CC493: LDA.w $1F05
#_0CC496: CLC
#_0CC497: ADC.b #$05
#_0CC499: STA.w $1F05

#_0CC49C: LDA.w $1F04
#_0CC49F: CLC
#_0CC4A0: ADC.b #$03
#_0CC4A2: STA.w $1F04

#_0CC4A5: LDA.w $1F02
#_0CC4A8: CMP.b #$E1
#_0CC4AA: BCS .delay_skippability

#_0CC4AC: LDX.b #$04
#_0CC4AE: STX.b $11

.delay_skippability
#_0CC4B0: CMP.b #$71
#_0CC4B2: BNE .delay_song

#_0CC4B4: LDA.b #$01 ; SONG 01
#_0CC4B6: STA.w $012C

.delay_song
#_0CC4B9: RTS

;===================================================================================================

Intro_TriforceNearingMerge:
#_0CC4BA: DEC.w $1E01
#_0CC4BD: BNE .delay

#_0CC4BF: INC.w $1E00

#_0CC4C2: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_0CC4C3: LDA.w $1F05
#_0CC4C6: CLC
#_0CC4C7: ADC.b #$05
#_0CC4C9: STA.w $1F05

#_0CC4CC: LDA.w $1F04
#_0CC4CF: CLC
#_0CC4D0: ADC.b #$03
#_0CC4D2: STA.w $1F04

#_0CC4D5: RTS

;===================================================================================================

Intro_MergeTriforceSpin:
#_0CC4D6: LDA.w $1F05
#_0CC4D9: CMP.b #$FA
#_0CC4DB: BCC .spinning

#_0CC4DD: LDA.w $1F04
#_0CC4E0: CMP.b #$FC
#_0CC4E2: BCC .spinning

#_0CC4E4: INC.w $1E00

#_0CC4E7: LDA.b #$20
#_0CC4E9: STA.w $1E01

#_0CC4EC: RTS

;---------------------------------------------------------------------------------------------------

.spinning
#_0CC4ED: LDA.w $1F05
#_0CC4F0: CLC
#_0CC4F1: ADC.b #$05
#_0CC4F3: STA.w $1F05

#_0CC4F6: LDA.w $1F04
#_0CC4F9: CLC
#_0CC4FA: ADC.b #$03
#_0CC4FC: STA.w $1F04

#_0CC4FF: RTS

;===================================================================================================

Intro_TriforceTerminateSpin:
#_0CC500: STZ.w $1F05
#_0CC503: STZ.w $1F04

#_0CC506: DEC.w $1E01
#_0CC509: BNE .exit

#_0CC50B: INC.w $1E00

#_0CC50E: LDA.b #$01
#_0CC510: STA.w $1E15

#_0CC513: LDA.b #$03
#_0CC515: STA.w $1E1D

#_0CC518: LDA.b #$10
#_0CC51A: STA.b $1C

#_0CC51C: LDA.b #$05
#_0CC51E: STA.b $1D

#_0CC520: LDA.b #$02
#_0CC522: STA.b $99

#_0CC524: LDA.b #$31
#_0CC526: STA.b $9A

#_0CC528: STZ.b $B0

#_0CC52A: INC.b $15

#_0CC52C: LDA.b #$03

;---------------------------------------------------------------------------------------------------

#Intro_SetStripesAndAdvance:
#_0CC52E: STA.b $14

#_0CC530: INC.b $11

.exit
#_0CC532: RTS

;===================================================================================================

Intro_TriforceDoNothing:
#_0CC533: RTS

;===================================================================================================

Scene_AnimateSingleSprite:
#_0CC534: LDA.w $1E10,X
#_0CC537: BEQ .exit
#_0CC539: JSL JumpTableLocal
#_0CC53D: dw .exit
#_0CC53F: dw InitializeSceneSprite
#_0CC541: dw AnimateSceneSprite

;---------------------------------------------------------------------------------------------------

.exit
#_0CC543: RTS

;===================================================================================================

InitializeSceneSprite:
#_0CC544: LDA.w $1E18,X
#_0CC547: JSL JumpTableLocal
#_0CC54B: dw InitializeSceneSprite_Triangle
#_0CC54D: dw SceneSprite_TitleCard
#_0CC54F: dw InitializeSceneSprite_Copyright
#_0CC551: dw InitializeSceneSprite_Sparkle
#_0CC553: dw InitializeSceneSprite_TriforceRoomTriangle
#_0CC555: dw InitializeSceneSprite_TriforceRoomTriangle
#_0CC557: dw InitializeSceneSprite_TriforceRoomTriangle
#_0CC559: dw InitializeSceneSprite_CreditsTriangle

;===================================================================================================

AnimateSceneSprite:
#_0CC55B: LDA.w $1E18,X
#_0CC55E: JSL JumpTableLocal
#_0CC562: dw AnimateSceneSprite_Triangle
#_0CC564: dw SceneSprite_TitleCard
#_0CC566: dw AnimateSceneSprite_Copyright
#_0CC568: dw AnimateSceneSprite_Sparkle
#_0CC56A: dw AnimateSceneSprite_TriforceRoomTriangle
#_0CC56C: dw AnimateSceneSprite_TriforceRoomTriangle
#_0CC56E: dw AnimateSceneSprite_TriforceRoomTriangle
#_0CC570: dw AnimateSceneSprite_CreditsTriangle

;===================================================================================================

pool InitializeSceneSprite_Triangle

.pos_x_start
#_0CC572: dw $FFDA
#_0CC574: dw $005F
#_0CC576: dw $00E6

.pos_y_start
#_0CC578: dw $00C8
#_0CC57A: dw $FFBD
#_0CC57C: dw $00C8

pool off

;---------------------------------------------------------------------------------------------------

InitializeSceneSprite_Triangle:
#_0CC57E: TXA
#_0CC57F: ASL A
#_0CC580: TAY

#_0CC581: LDA.w .pos_x_start+0,Y
#_0CC584: STA.w $1E30,X

#_0CC587: LDA.w .pos_x_start+1,Y
#_0CC58A: STA.w $1E38,X

#_0CC58D: LDA.w .pos_y_start+0,Y
#_0CC590: STA.w $1E48,X

#_0CC593: LDA.w .pos_y_start+1,Y
#_0CC596: STA.w $1E50,X

#_0CC599: LDA.w IntroTriangleSpeedX,X
#_0CC59C: CLC
#_0CC59D: ADC.w $1E58,X
#_0CC5A0: STA.w $1E58,X

#_0CC5A3: LDA.w IntroTriangleSpeedY,X
#_0CC5A6: CLC
#_0CC5A7: ADC.w $1E60,X
#_0CC5AA: STA.w $1E60,X

#_0CC5AD: INC.w $1E10,X

#_0CC5B0: RTS

;===================================================================================================

AnimateSceneSprite_Triangle:
#_0CC5B1: JSR AnimateSceneSprite_DrawTriangle
#_0CC5B4: JSR AnimateSceneSprite_MoveTriangle

#_0CC5B7: LDA.w $1E00
#_0CC5BA: JSL JumpTableLocal
#_0CC5BE: dw IntroTriangle_MoveIntoPlace
#_0CC5C0: dw IntroTriangle_MoveIntoPlace
#_0CC5C2: dw IntroTriangle_MoveIntoPlace
#_0CC5C4: dw IntroTriangle_MoveIntoPlace
#_0CC5C6: dw IntroTriangle_MoveIntoPlace
#_0CC5C8: dw IntroTriangle_StopMoving

;===================================================================================================

IntroTriangleSpeedX:
#_0CC5CA: db   1
#_0CC5CB: db   0
#_0CC5CC: db  -1

IntroTriangleSpeedY:
#_0CC5CD: db  -1
#_0CC5CE: db   1
#_0CC5CF: db  -1

;===================================================================================================

pool IntroTriangle_MoveIntoPlace

.target_x
#_0CC5D0: db $4B
#_0CC5D1: db $5F
#_0CC5D2: db $75

.target_y
#_0CC5D3: db $58
#_0CC5D4: db $30
#_0CC5D5: db $58

pool off

;---------------------------------------------------------------------------------------------------

IntroTriangle_MoveIntoPlace:
#_0CC5D6: LDA.w $1E0A
#_0CC5D9: AND.b #$1F
#_0CC5DB: BNE .dont_accel

#_0CC5DD: LDA.w IntroTriangleSpeedX,X
#_0CC5E0: CLC
#_0CC5E1: ADC.w $1E58,X
#_0CC5E4: STA.w $1E58,X

#_0CC5E7: LDA.w IntroTriangleSpeedY,X
#_0CC5EA: CLC
#_0CC5EB: ADC.w $1E60,X
#_0CC5EE: STA.w $1E60,X

.dont_accel
#_0CC5F1: LDA.w .target_x,X
#_0CC5F4: CMP.w $1E30,X
#_0CC5F7: BNE .dont_reset_speed

#_0CC5F9: STZ.w $1E58,X

.dont_reset_speed
#_0CC5FC: LDA.w .target_y,X
#_0CC5FF: CMP.w $1E48,X
#_0CC602: BNE .exit

#_0CC604: STZ.w $1E60,X

.exit
#_0CC607: RTS

;===================================================================================================

IntroTriangle_StopMoving:
#_0CC608: STZ.w $1E58,X
#_0CC60B: STZ.w $1E60,X

#_0CC60E: RTS

;===================================================================================================

pool AnimateSceneSprite_DrawTriangle

.rightside_objects
#_0CC60F: dw   0,   0 : db $80, $1B, $00, $02
#_0CC617: dw  16,   0 : db $82, $1B, $00, $02
#_0CC61F: dw  32,   0 : db $84, $1B, $00, $02
#_0CC627: dw  48,   0 : db $86, $1B, $00, $02
#_0CC62F: dw   0,  16 : db $A0, $1B, $00, $02
#_0CC637: dw  16,  16 : db $A2, $1B, $00, $02
#_0CC63F: dw  32,  16 : db $A4, $1B, $00, $02
#_0CC647: dw  48,  16 : db $A6, $1B, $00, $02
#_0CC64F: dw   0,  32 : db $88, $1B, $00, $02
#_0CC657: dw  16,  32 : db $8A, $1B, $00, $02
#_0CC65F: dw  32,  32 : db $8C, $1B, $00, $02
#_0CC667: dw  48,  32 : db $8E, $1B, $00, $02
#_0CC66F: dw   0,  48 : db $A8, $1B, $00, $02
#_0CC677: dw  16,  48 : db $AA, $1B, $00, $02
#_0CC67F: dw  32,  48 : db $AC, $1B, $00, $02
#_0CC687: dw  48,  48 : db $AE, $1B, $00, $02

;---------------------------------------------------------------------------------------------------

.leftside_objects
#_0CC68F: dw  48,   0 : db $80, $5B, $00, $02
#_0CC697: dw  32,   0 : db $82, $5B, $00, $02
#_0CC69F: dw  16,   0 : db $84, $5B, $00, $02
#_0CC6A7: dw   0,   0 : db $86, $5B, $00, $02
#_0CC6AF: dw  48,  16 : db $A0, $5B, $00, $02
#_0CC6B7: dw  32,  16 : db $A2, $5B, $00, $02
#_0CC6BF: dw  16,  16 : db $A4, $5B, $00, $02
#_0CC6C7: dw   0,  16 : db $A6, $5B, $00, $02
#_0CC6CF: dw  48,  32 : db $88, $5B, $00, $02
#_0CC6D7: dw  32,  32 : db $8A, $5B, $00, $02
#_0CC6DF: dw  16,  32 : db $8C, $5B, $00, $02
#_0CC6E7: dw   0,  32 : db $8E, $5B, $00, $02
#_0CC6EF: dw  48,  48 : db $A8, $5B, $00, $02
#_0CC6F7: dw  32,  48 : db $AA, $5B, $00, $02
#_0CC6FF: dw  16,  48 : db $AC, $5B, $00, $02
#_0CC707: dw   0,  48 : db $AE, $5B, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

AnimateSceneSprite_DrawTriangle:
#_0CC70F: LDA.b #$10
#_0CC711: STA.b $06
#_0CC713: STZ.b $07

#_0CC715: CPX.b #$02
#_0CC717: BEQ .left_side

#_0CC719: LDA.b #.rightside_objects>>0
#_0CC71B: STA.b $08

#_0CC71D: LDA.b #.rightside_objects>>8
#_0CC71F: STA.b $09

#_0CC721: BRA .continue


.left_side
#_0CC723: LDA.b #.leftside_objects>>0
#_0CC725: STA.b $08

#_0CC727: LDA.b #.leftside_objects>>8
#_0CC729: STA.b $09

.continue
#_0CC72B: JSR AnimateSceneSprite_AddObjectsToOAMBuffer

#_0CC72E: RTS

;===================================================================================================

pool AnimateSceneSprite_DrawTriforceRoomTriangle

.rightside_objects
#_0CC72F: dw   0,   0 : db $80, $2B, $00, $02
#_0CC737: dw  16,   0 : db $82, $2B, $00, $02
#_0CC73F: dw  32,   0 : db $84, $2B, $00, $02
#_0CC747: dw  48,   0 : db $86, $2B, $00, $02
#_0CC74F: dw   0,  16 : db $A0, $2B, $00, $02
#_0CC757: dw  16,  16 : db $A2, $2B, $00, $02
#_0CC75F: dw  32,  16 : db $A4, $2B, $00, $02
#_0CC767: dw  48,  16 : db $A6, $2B, $00, $02
#_0CC76F: dw   0,  32 : db $88, $2B, $00, $02
#_0CC777: dw  16,  32 : db $8A, $2B, $00, $02
#_0CC77F: dw  32,  32 : db $8C, $2B, $00, $02
#_0CC787: dw  48,  32 : db $8E, $2B, $00, $02
#_0CC78F: dw   0,  48 : db $A8, $2B, $00, $02
#_0CC797: dw  16,  48 : db $AA, $2B, $00, $02
#_0CC79F: dw  32,  48 : db $AC, $2B, $00, $02
#_0CC7A7: dw  48,  48 : db $AE, $2B, $00, $02

;---------------------------------------------------------------------------------------------------

.leftside_objects
#_0CC7AF: dw  48,   0 : db $80, $6B, $00, $02
#_0CC7B7: dw  32,   0 : db $82, $6B, $00, $02
#_0CC7BF: dw  16,   0 : db $84, $6B, $00, $02
#_0CC7C7: dw   0,   0 : db $86, $6B, $00, $02
#_0CC7CF: dw  48,  16 : db $A0, $6B, $00, $02
#_0CC7D7: dw  32,  16 : db $A2, $6B, $00, $02
#_0CC7DF: dw  16,  16 : db $A4, $6B, $00, $02
#_0CC7E7: dw   0,  16 : db $A6, $6B, $00, $02
#_0CC7EF: dw  48,  32 : db $88, $6B, $00, $02
#_0CC7F7: dw  32,  32 : db $8A, $6B, $00, $02
#_0CC7FF: dw  16,  32 : db $8C, $6B, $00, $02
#_0CC807: dw   0,  32 : db $8E, $6B, $00, $02
#_0CC80F: dw  48,  48 : db $A8, $6B, $00, $02
#_0CC817: dw  32,  48 : db $AA, $6B, $00, $02
#_0CC81F: dw  16,  48 : db $AC, $6B, $00, $02
#_0CC827: dw   0,  48 : db $AE, $6B, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

AnimateSceneSprite_DrawTriforceRoomTriangle:
#_0CC82F: LDA.b #$10
#_0CC831: STA.b $06
#_0CC833: STZ.b $07

#_0CC835: CPX.b #$02
#_0CC837: BEQ .decrementing

#_0CC839: LDA.b #.rightside_objects>>0
#_0CC83B: STA.b $08

#_0CC83D: LDA.b #.rightside_objects>>8
#_0CC83F: STA.b $09

#_0CC841: BRA .continue

;---------------------------------------------------------------------------------------------------

.decrementing
#_0CC843: LDA.b #.leftside_objects>>0
#_0CC845: STA.b $08

#_0CC847: LDA.b #.leftside_objects>>8
#_0CC849: STA.b $09

.continue
#_0CC84B: JSR AnimateSceneSprite_AddObjectsToOAMBuffer

#_0CC84E: RTS

;===================================================================================================

SceneSprite_TitleCard:
#_0CC84F: RTS

;===================================================================================================

InitializeSceneSprite_Copyright:
#_0CC850: LDA.b #$4C
#_0CC852: STA.w $1E30,X
#_0CC855: STZ.w $1E38,X

#_0CC858: LDA.b #$B8
#_0CC85A: STA.w $1E48,X

#_0CC85D: STZ.w $1E50,X

#_0CC860: INC.w $1E10,X

#_0CC863: RTS

;===================================================================================================

AnimateSceneSprite_Copyright:
#_0CC864: JSR AnimateSceneSprite_DrawCopyright

#_0CC867: RTS

;===================================================================================================

pool AnimateSceneSprite_DrawCopyright

.groups
#_0CC868: dw   0,   0 : db $40, $0A, $00, $00
#_0CC870: dw   8,   0 : db $41, $0A, $00, $00
#_0CC878: dw  16,   0 : db $42, $0A, $00, $00
#_0CC880: dw  24,   0 : db $68, $0A, $00, $00
#_0CC888: dw  32,   0 : db $41, $0A, $00, $00
#_0CC890: dw  40,   0 : db $42, $0A, $00, $00
#_0CC898: dw  48,   0 : db $43, $0A, $00, $00
#_0CC8A0: dw  56,   0 : db $44, $0A, $00, $00
#_0CC8A8: dw  64,   0 : db $50, $0A, $00, $00
#_0CC8B0: dw  72,   0 : db $51, $0A, $00, $00
#_0CC8B8: dw  80,   0 : db $52, $0A, $00, $00
#_0CC8C0: dw  88,   0 : db $53, $0A, $00, $00
#_0CC8C8: dw  96,   0 : db $54, $0A, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

AnimateSceneSprite_DrawCopyright:
#_0CC8D0: LDA.b #$0D
#_0CC8D2: STA.b $06
#_0CC8D4: STZ.b $07

#_0CC8D6: LDA.b #.groups>>0
#_0CC8D8: STA.b $08

#_0CC8DA: LDA.b #.groups>>8
#_0CC8DC: STA.b $09

#_0CC8DE: JSR AnimateSceneSprite_AddObjectsToOAMBuffer

#_0CC8E1: RTS

;===================================================================================================

InitializeSceneSprite_Sparkle:
#_0CC8E2: LDA.w $1E0A

#_0CC8E5: LSR A
#_0CC8E6: LSR A
#_0CC8E7: LSR A
#_0CC8E8: LSR A
#_0CC8E9: LSR A

#_0CC8EA: AND.b #$03
#_0CC8EC: TAY

#_0CC8ED: LDA.w .position_x,Y
#_0CC8F0: STA.w $1E30,X

#_0CC8F3: LDA.w .position_y,Y
#_0CC8F6: STA.w $1E48,X

#_0CC8F9: INC.w $1E10,X

#_0CC8FC: RTS

;---------------------------------------------------------------------------------------------------

pool InitializeSceneSprite_Sparkle AnimateSceneSprite_Sparkle

.position_x
#_0CC8FD: db $C2, $98, $6F, $34

.position_y
#_0CC901: db $7C, $54, $7C, $57

.anim_step
#_0CC905: db $00, $01, $02, $03, $02, $01, $FF, $FF

pool off

;---------------------------------------------------------------------------------------------------

AnimateSceneSprite_Sparkle:
#_0CC90D: JSR AnimateSceneSprite_DrawSparkle

#_0CC910: LDA.w $1E0A
#_0CC913: LSR A
#_0CC914: LSR A
#_0CC915: AND.b #$07
#_0CC917: TAY

#_0CC918: LDA.w .anim_step,Y
#_0CC91B: STA.w $1E20,X

#_0CC91E: LDA.w $1E0A
#_0CC921: LSR A
#_0CC922: LSR A
#_0CC923: LSR A
#_0CC924: LSR A
#_0CC925: LSR A
#_0CC926: AND.b #$03
#_0CC928: TAY

#_0CC929: LDA.w .position_x,Y
#_0CC92C: STA.w $1E30,X

#_0CC92F: LDA.w .position_y,Y
#_0CC932: STA.w $1E48,X

#_0CC935: RTS

;===================================================================================================

pool AnimateSceneSprite_DrawSparkle

.groups
#_0CC936: dw   0,   0 : db $80, $34, $00, $00
#_0CC93E: dw   0,   0 : db $B7, $34, $00, $00
#_0CC946: dw  -4,  -3 : db $64, $38, $00, $02
#_0CC94E: dw  -4,  -3 : db $62, $34, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

AnimateSceneSprite_DrawSparkle:
#_0CC956: LDA.b #$01
#_0CC958: STA.b $06
#_0CC95A: STZ.b $07

#_0CC95C: LDA.w $1E20,X
#_0CC95F: BMI .exit

#_0CC961: ASL A
#_0CC962: ASL A
#_0CC963: ASL A

#_0CC964: ADC.b #.groups>>0
#_0CC966: STA.b $08

#_0CC968: LDA.b #.groups>>8
#_0CC96A: ADC.b #$00
#_0CC96C: STA.b $09

#_0CC96E: JSR AnimateSceneSprite_AddObjectsToOAMBuffer

.exit
#_0CC971: RTS

;===================================================================================================

AnimateSceneSprite_AddObjectsToOAMBuffer:
#_0CC972: LDA.w $1E30,X
#_0CC975: STA.b $00

#_0CC977: LDA.w $1E38,X
#_0CC97A: STA.b $01

#_0CC97C: LDA.w $1E48,X
#_0CC97F: STA.b $02

#_0CC981: LDA.w $1E50,X
#_0CC984: STA.b $03

#_0CC986: STZ.b $04
#_0CC988: STZ.b $05

;---------------------------------------------------------------------------------------------------

#_0CC98A: PHX

#_0CC98B: REP #$30

#_0CC98D: LDY.w #$0000
#_0CC990: LDX.w $1E08

#_0CC993: LDA.b $06
#_0CC995: ASL A
#_0CC996: ASL A
#_0CC997: ADC.w $1E08
#_0CC99A: STA.w $1E08

;---------------------------------------------------------------------------------------------------

.next
#_0CC99D: LDA.b ($08),Y
#_0CC99F: CLC
#_0CC9A0: ADC.b $00
#_0CC9A2: STA.w $0000,X

#_0CC9A5: AND.w #$0100
#_0CC9A8: STA.b $0C

#_0CC9AA: INY
#_0CC9AB: INY

#_0CC9AC: LDA.b ($08),Y
#_0CC9AE: CLC
#_0CC9AF: ADC.b $02
#_0CC9B1: STA.w $0001,X

#_0CC9B4: CLC
#_0CC9B5: ADC.w #$0010
#_0CC9B8: CMP.w #$0100
#_0CC9BB: BCC .on_screen

#_0CC9BD: LDA.w #$00F0
#_0CC9C0: STA.w $0001,X

.on_screen
#_0CC9C3: INY
#_0CC9C4: INY

#_0CC9C5: LDA.b ($08),Y
#_0CC9C7: EOR.b $04
#_0CC9C9: STA.w $0002,X

#_0CC9CC: PHX

#_0CC9CD: TXA
#_0CC9CE: SEC
#_0CC9CF: SBC.w #$0800
#_0CC9D2: LSR A
#_0CC9D3: LSR A
#_0CC9D4: TAX

#_0CC9D5: SEP #$20

#_0CC9D7: INY
#_0CC9D8: INY
#_0CC9D9: INY

#_0CC9DA: LDA.b ($08),Y
#_0CC9DC: ORA.b $0D
#_0CC9DE: STA.w $0A20,X

#_0CC9E1: PLX

#_0CC9E2: REP #$20

#_0CC9E4: INY

#_0CC9E5: INX
#_0CC9E6: INX
#_0CC9E7: INX
#_0CC9E8: INX

#_0CC9E9: DEC.b $06
#_0CC9EB: BNE .next

;---------------------------------------------------------------------------------------------------

#_0CC9ED: SEP #$30

#_0CC9EF: PLX

#_0CC9F0: RTS

;===================================================================================================

AnimateSceneSprite_MoveTriangle:
#_0CC9F1: LDA.w $1E58,X
#_0CC9F4: BEQ .no_x_speed

#_0CC9F6: ASL A
#_0CC9F7: ASL A
#_0CC9F8: ASL A
#_0CC9F9: ASL A

#_0CC9FA: CLC
#_0CC9FB: ADC.w $1E28,X
#_0CC9FE: STA.w $1E28,X

#_0CCA01: LDA.w $1E58,X
#_0CCA04: PHP

#_0CCA05: LSR A
#_0CCA06: LSR A
#_0CCA07: LSR A
#_0CCA08: LSR A

#_0CCA09: LDY.b #$00

#_0CCA0B: PLP
#_0CCA0C: BPL .positive_x

#_0CCA0E: ORA.b #$F0
#_0CCA10: DEY

.positive_x
#_0CCA11: ADC.w $1E30,X
#_0CCA14: STA.w $1E30,X

#_0CCA17: TYA
#_0CCA18: ADC.w $1E38,X
#_0CCA1B: STA.w $1E38,X

;---------------------------------------------------------------------------------------------------

.no_x_speed
#_0CCA1E: LDA.w $1E60,X
#_0CCA21: BEQ .exit

#_0CCA23: ASL A
#_0CCA24: ASL A
#_0CCA25: ASL A
#_0CCA26: ASL A

#_0CCA27: CLC
#_0CCA28: ADC.w $1E40,X
#_0CCA2B: STA.w $1E40,X

#_0CCA2E: LDA.w $1E60,X
#_0CCA31: PHP

#_0CCA32: LSR A
#_0CCA33: LSR A
#_0CCA34: LSR A
#_0CCA35: LSR A

#_0CCA36: LDY.b #$00

#_0CCA38: PLP
#_0CCA39: BPL .positive_y

#_0CCA3B: ORA.b #$F0
#_0CCA3D: DEY

.positive_y
#_0CCA3E: ADC.w $1E48,X
#_0CCA41: STA.w $1E48,X

#_0CCA44: TYA
#_0CCA45: ADC.w $1E50,X
#_0CCA48: STA.w $1E50,X

.exit
#_0CCA4B: RTS

;===================================================================================================

AnimateSceneSprite_TerminateTriangle:
#_0CCA4C: LDA.w $1E02
#_0CCA4F: BEQ .exit

#_0CCA51: PLA
#_0CCA52: PLA

.exit
#_0CCA53: RTS

;===================================================================================================

TriforceRoom_PrepGFXSlotForPoly:
#_0CCA54: LDA.b #$08
#_0CCA56: STA.w $0AA4

#_0CCA59: JSL LoadCommonSprites_long
#_0CCA5D: JSR TriforceInitializePolyhedralModule

#_0CCA60: LDA.b #$01
#_0CCA62: STA.w $1E10
#_0CCA65: STA.w $1E11
#_0CCA68: STA.w $1E12

#_0CCA6B: LDA.b #$04
#_0CCA6D: STA.w $1E18

#_0CCA70: LDA.b #$05
#_0CCA72: STA.w $1E19

#_0CCA75: LDA.b #$06
#_0CCA77: STA.w $1E1A

#_0CCA7A: LDA.b #$0F
#_0CCA7C: STA.b $13

#_0CCA7E: INC.b $11

#_0CCA80: RTL

;===================================================================================================

Credits_InitializePolyhedral:
#_0CCA81: LDA.b #$08
#_0CCA83: STA.w $0AA4

#_0CCA86: JSL LoadCommonSprites_long
#_0CCA8A: JSR TriforceInitializePolyhedralModule

#_0CCA8D: STZ.w $1F02

#_0CCA90: LDA.b #$01
#_0CCA92: STA.w $1E10
#_0CCA95: STA.w $1E11
#_0CCA98: STA.w $1E12

#_0CCA9B: LDA.b #$07
#_0CCA9D: STA.w $1E18

#_0CCAA0: LDA.b #$07
#_0CCAA2: STA.w $1E19

#_0CCAA5: LDA.b #$07
#_0CCAA7: STA.w $1E1A

#_0CCAAA: LDA.b #$0F
#_0CCAAC: STA.b $13

#_0CCAAE: INC.b $11

#_0CCAB0: RTL

;===================================================================================================

AdvancePolyhedral:
#_0CCAB1: PHB
#_0CCAB2: PHK
#_0CCAB3: PLB

#_0CCAB4: JSR .do_advance
#_0CCAB7: JSR Scene_AnimateEverySprite

#_0CCABA: PLB

#_0CCABB: RTL

;===================================================================================================

.do_advance
#_0CCABC: LDA.b #$01
#_0CCABE: STA.w $012A
#_0CCAC1: STA.w $1E02

#_0CCAC4: LDA.w $1F00
#_0CCAC7: BNE .exit

#_0CCAC9: JSR .run_sub

#_0CCACC: LDA.b #$01
#_0CCACE: STA.w $1F00

#_0CCAD1: STZ.w $1E02

#_0CCAD4: INC.w $1E0A

.exit
#_0CCAD7: RTS

;---------------------------------------------------------------------------------------------------

.run_sub
#_0CCAD8: LDA.w $1E00
#_0CCADB: JSL JumpTableLocal
#_0CCADF: dw IntroPolyhedral_StartUp
#_0CCAE1: dw IntroPolyhedral_MoveGrowRotate
#_0CCAE3: dw IntroPolyhedral_MoveRotate
#_0CCAE5: dw IntroPolyhedral_LockIntoPlace
#_0CCAE7: dw EXIT_0CCBA1

;===================================================================================================

IntroPolyhedral_StartUp:
#_0CCAE9: LDA.w $1F02
#_0CCAEC: SEC
#_0CCAED: SBC.b #$02
#_0CCAEF: STA.w $1F02

#_0CCAF2: CMP.b #$02
#_0CCAF4: BCS IntroPolyhedral_MoveGrowRotate

#_0CCAF6: STZ.w $1F02

#_0CCAF9: INC.w $1E00
#_0CCAFC: INC.b $B0

;===================================================================================================

IntroPolyhedral_MoveGrowRotate:
#_0CCAFE: LDA.b $B0
#_0CCB00: CMP.b #$0A
#_0CCB02: BCC .delay

#_0CCB04: INC.w $1E00

#_0CCB07: LDA.b #$05
#_0CCB09: STA.w $1E61

.delay
#_0CCB0C: LDA.w $1F05
#_0CCB0F: CLC
#_0CCB10: ADC.b #$02
#_0CCB12: STA.w $1F05

#_0CCB15: LDA.w $1F04
#_0CCB18: CLC
#_0CCB19: ADC.b #$01
#_0CCB1B: STA.w $1F04

#_0CCB1E: RTS

;===================================================================================================

IntroPolyhedral_MoveRotate:
#_0CCB1F: LDA.b #$C0
#_0CCB21: STA.w $1E0C

#_0CCB24: LDA.b #$01
#_0CCB26: STA.w $1E0D

#_0CCB29: LDA.w $1F02
#_0CCB2C: CMP.b #$80
#_0CCB2E: BCS .negative

#_0CCB30: ADC.b #$01
#_0CCB32: STA.w $1F02

#_0CCB35: BRA .just_spin

;---------------------------------------------------------------------------------------------------

.negative
#_0CCB37: LDA.w $1F05
#_0CCB3A: SEC
#_0CCB3B: SBC.b #$0A
#_0CCB3D: AND.b #$7F

#_0CCB3F: CMP.b #$5C
#_0CCB41: BCC .just_spin

#_0CCB43: LDA.w $1F04
#_0CCB46: SEC
#_0CCB47: SBC.b #$0B

#_0CCB49: CMP.b #$DC
#_0CCB4B: BCC .just_spin

;---------------------------------------------------------------------------------------------------

#_0CCB4D: STZ.w $1F04
#_0CCB50: STZ.w $1F05

#_0CCB53: INC.b $B0
#_0CCB55: INC.w $1E00

#_0CCB58: LDA.b #$2C ; SFX2.2C
#_0CCB5A: STA.w $012E

#_0CCB5D: LDA.b #$FF ; RGB: #F8F8F8
#_0CCB5F: STA.l $7EC6AE

#_0CCB63: LDA.b #$7F
#_0CCB65: STA.l $7EC6AF

#_0CCB69: INC.b $15

#_0CCB6B: LDA.b #$06
#_0CCB6D: STA.w $1E01

#_0CCB70: RTS

;---------------------------------------------------------------------------------------------------

.just_spin
#_0CCB71: LDA.w $1F05
#_0CCB74: CLC
#_0CCB75: ADC.b #$05
#_0CCB77: STA.w $1F05

#_0CCB7A: LDA.w $1F04
#_0CCB7D: CLC
#_0CCB7E: ADC.b #$03
#_0CCB80: STA.w $1F04

#_0CCB83: RTS

;===================================================================================================

IntroPolyhedral_LockIntoPlace:
#_0CCB84: DEC.w $1E01

#_0CCB87: LDA.w $1E01
#_0CCB8A: BNE EXIT_0CCBA1

#_0CCB8C: LDA.l Palettes_Triforce+14
#_0CCB90: STA.l $7EC6AE

#_0CCB94: LDA.l Palettes_Triforce+15
#_0CCB98: STA.l $7EC6AF

#_0CCB9C: INC.b $15
#_0CCB9E: INC.w $1E00

;---------------------------------------------------------------------------------------------------

#EXIT_0CCBA1:
#_0CCBA1: RTS

;===================================================================================================

Credits_AnimateTheTriangles:
#_0CCBA2: PHB
#_0CCBA3: PHK
#_0CCBA4: PLB

#_0CCBA5: INC.w $1E0A

#_0CCBA8: JSR CreditsTriangle_HandleRotation
#_0CCBAB: JSR Scene_AnimateEverySprite

#_0CCBAE: PLB

#_0CCBAF: RTL

;===================================================================================================

CreditsTriangle_HandleRotation:
#_0CCBB0: LDA.b #$01
#_0CCBB2: STA.w $012A

#_0CCBB5: LDA.w $1F00
#_0CCBB8: BNE .exit

#_0CCBBA: JSR CreditsTriangle_ApplyRotation

#_0CCBBD: LDA.b #$01
#_0CCBBF: STA.w $1F00

.exit
#_0CCBC2: RTS

;===================================================================================================

CreditsTriangle_ApplyRotation:
#_0CCBC3: LDA.w $1F05
#_0CCBC6: CLC
#_0CCBC7: ADC.b #$03
#_0CCBC9: STA.w $1F05

#_0CCBCC: LDA.w $1F04
#_0CCBCF: CLC
#_0CCBD0: ADC.b #$01
#_0CCBD2: STA.w $1F04

#_0CCBD5: RTS

;===================================================================================================

pool InitializeSceneSprite_TriforceRoomTriangle

.position_x
#_0CCBD6: dw $004E
#_0CCBD8: dw $005F
#_0CCBDA: dw $0072

.position_y
#_0CCBDC: dw $009C
#_0CCBDE: dw $009C
#_0CCBE0: dw $009C

.speed_x
#_0CCBE2: db $FE
#_0CCBE3: db $00
#_0CCBE4: db $02

.speed_y
#_0CCBE5: db $04
#_0CCBE6: db $FC
#_0CCBE7: db $04

pool off

;---------------------------------------------------------------------------------------------------

InitializeSceneSprite_TriforceRoomTriangle:
#_0CCBE8: TXA
#_0CCBE9: ASL A
#_0CCBEA: TAY

#_0CCBEB: LDA.w .position_x+0,Y
#_0CCBEE: STA.w $1E30,X

#_0CCBF1: LDA.w .position_x+1,Y
#_0CCBF4: STA.w $1E38,X

#_0CCBF7: LDA.w .position_y+0,Y
#_0CCBFA: STA.w $1E48,X

#_0CCBFD: LDA.w .position_y+1,Y
#_0CCC00: STA.w $1E50,X

#_0CCC03: LDA.w .speed_x,X
#_0CCC06: STA.w $1E58,X

#_0CCC09: LDA.w .speed_y,X
#_0CCC0C: STA.w $1E60,X

#_0CCC0F: INC.w $1E10,X

#_0CCC12: RTS

;===================================================================================================

AnimateSceneSprite_TriforceRoomTriangle:
#_0CCC13: JSR AnimateSceneSprite_DrawTriforceRoomTriangle
#_0CCC16: JSR AnimateSceneSprite_TerminateTriangle
#_0CCC19: JSR AnimateSceneSprite_MoveTriangle

#_0CCC1C: LDA.w $1E00
#_0CCC1F: JSL JumpTableLocal
#_0CCC23: dw AnimateTriforceRoomTriangle_Expand
#_0CCC25: dw AnimateTriforceRoomTriangle_RotateInPlace
#_0CCC27: dw AnimateTriforceRoomTriangle_Contract
#_0CCC29: dw AnimateTriforceRoomTriangle_Stopped
#_0CCC2B: dw AnimateTriforceRoomTriangle_Stopped

;===================================================================================================

pool AnimateTriforceRoomTriangle_Expand

.speed_x
#_0CCC2D: db -1
#_0CCC2E: db  0
#_0CCC2F: db  1

.speed_y
#_0CCC30: db -1
#_0CCC31: db -1
#_0CCC32: db -1

pool off

;---------------------------------------------------------------------------------------------------

AnimateTriforceRoomTriangle_Expand:
#_0CCC33: LDA.w $1E0A
#_0CCC36: AND.b #$07
#_0CCC38: BNE .no_x_speed

#_0CCC3A: LDA.w .speed_x,X
#_0CCC3D: CLC
#_0CCC3E: ADC.w $1E58,X
#_0CCC41: STA.w $1E58,X

.no_x_speed
#_0CCC44: LDA.w $1E0A
#_0CCC47: AND.b #$03
#_0CCC49: BNE .exit

#_0CCC4B: LDA.w .speed_y,X
#_0CCC4E: CLC
#_0CCC4F: ADC.w $1E60,X
#_0CCC52: STA.w $1E60,X

.exit
#_0CCC55: RTS

;===================================================================================================

AnimateTriforceRoomTriangle_RotateInPlace:
#_0CCC56: STZ.w $1E58,X
#_0CCC59: STZ.w $1E60,X

#_0CCC5C: RTS

;===================================================================================================

pool AnimateTriforceRoomTriangle_Contract AnimateTriforceRoomTriangle_HandleContracting

.speed_x
#_0CCC5D: db $FF
#_0CCC5E: db $FF
#_0CCC5F: db $FF

.speed_y
#_0CCC60: db $01
#_0CCC61: db $01
#_0CCC62: db $01

.limit_x
#_0CCC63: db $EF

.limit_y
#_0CCC64: db $11

.target_x
#_0CCC65: db $59
#_0CCC66: db $5F
#_0CCC67: db $67

.target_y
#_0CCC68: db $74
#_0CCC69: db $68
#_0CCC6A: db $74

pool off

;---------------------------------------------------------------------------------------------------

AnimateTriforceRoomTriangle_Contract:
#_0CCC6B: LDA.w $1E0A
#_0CCC6E: AND.b #$03
#_0CCC70: BNE .no_x_speed

#_0CCC72: JSR AnimateTriforceRoomTriangle_HandleContracting

.no_x_speed
#_0CCC75: LDA.w .target_x,X
#_0CCC78: CMP.w $1E30,X
#_0CCC7B: BNE .no_reset

#_0CCC7D: STZ.w $1E58,X

.no_reset
#_0CCC80: LDA.w .target_y,X
#_0CCC83: CMP.w $1E48,X
#_0CCC86: BNE .exit

#_0CCC88: STZ.w $1E60,X

.exit
#_0CCC8B: RTS

;===================================================================================================

pool AnimateTriforceRoomTriangle_Stopped

.position_y
#_0CCC8C: db $72
#_0CCC8D: db $66
#_0CCC8E: db $72

pool off

;---------------------------------------------------------------------------------------------------

AnimateTriforceRoomTriangle_Stopped:
#_0CCC8F: LDA.w $1E0C
#_0CCC92: ORA.w $1E0D
#_0CCC95: BNE .no_adjust

#_0CCC97: LDA.w .position_y,X
#_0CCC9A: STA.w $1E48,X

#_0CCC9D: RTS

;---------------------------------------------------------------------------------------------------

.no_adjust
#_0CCC9E: LDA.w $1E0C
#_0CCCA1: SEC
#_0CCCA2: SBC.b #$01
#_0CCCA4: STA.w $1E0C

#_0CCCA7: LDA.w $1E0D
#_0CCCAA: SBC.b #$00
#_0CCCAC: STA.w $1E0D

#_0CCCAF: RTS

;===================================================================================================

AnimateTriforceRoomTriangle_HandleContracting:
#_0CCCB0: LDA.w .target_x,X
#_0CCCB3: CMP.w $1E30,X
#_0CCCB6: BCC .below_x

#_0CCCB8: LDA.w .speed_y,X
#_0CCCBB: BRA .continue_x

.below_x
#_0CCCBD: LDA.w .speed_x,X

.continue_x
#_0CCCC0: CLC
#_0CCCC1: ADC.w $1E58,X
#_0CCCC4: STA.w $1E58,X

#_0CCCC7: CMP.w .limit_x
#_0CCCCA: BNE .unequal_x

#_0CCCCC: LDA.w .limit_x
#_0CCCCF: INC A

#_0CCCD0: BRA .set_x

.unequal_x
#_0CCCD2: CMP.w .limit_y
#_0CCCD5: BNE .done_x

#_0CCCD7: LDA.w .limit_y
#_0CCCDA: DEC A

.set_x
#_0CCCDB: STA.w $1E58,X

;---------------------------------------------------------------------------------------------------

.done_x
#_0CCCDE: LDA.w .target_y,X
#_0CCCE1: CMP.w $1E48,X
#_0CCCE4: BCC .below_y

#_0CCCE6: LDA.w .speed_y,X
#_0CCCE9: BRA .continue_y

.below_y
#_0CCCEB: LDA.w .speed_x,X

.continue_y
#_0CCCEE: CLC
#_0CCCEF: ADC.w $1E60,X
#_0CCCF2: STA.w $1E60,X

#_0CCCF5: CMP.w .limit_x
#_0CCCF8: BNE .unequal_y

#_0CCCFA: LDA.w .limit_x
#_0CCCFD: INC A
#_0CCCFE: BRA .set_y

.unequal_y
#_0CCD00: CMP.w .limit_y
#_0CCD03: BNE .exit

#_0CCD05: LDA.w .limit_y
#_0CCD08: DEC A

.set_y
#_0CCD09: STA.w $1E60,X

.exit
#_0CCD0C: RTS

;===================================================================================================

pool InitializeSceneSprite_CreditsTriangle

.position_x
#_0CCD0D: dw $0029
#_0CCD0F: dw $005F
#_0CCD11: dw $0097

.position_y
#_0CCD13: dw $0070
#_0CCD15: dw $0020
#_0CCD17: dw $0070

pool off

;---------------------------------------------------------------------------------------------------

InitializeSceneSprite_CreditsTriangle:
#_0CCD19: TXA
#_0CCD1A: ASL A
#_0CCD1B: TAY

#_0CCD1C: LDA.w .position_x+0,Y
#_0CCD1F: STA.w $1E30,X

#_0CCD22: LDA.w .position_x+1,Y
#_0CCD25: STA.w $1E38,X

#_0CCD28: LDA.w .position_y+0,Y
#_0CCD2B: STA.w $1E48,X

#_0CCD2E: LDA.w .position_y+1,Y
#_0CCD31: STA.w $1E50,X

#_0CCD34: INC.w $1E10,X

#_0CCD37: RTS

;===================================================================================================

pool AnimateSceneSprite_CreditsTriangle

.speed_x
#_0CCD38: db -1
#_0CCD39: db  0
#_0CCD3A: db  1

.speed_y
#_0CCD3B: db  1
#_0CCD3C: db -1
#_0CCD3D: db  1

pool off

;---------------------------------------------------------------------------------------------------

AnimateSceneSprite_CreditsTriangle:
#_0CCD3E: JSR LoadTriforceSpritePalette
#_0CCD41: JSR AnimateSceneSprite_DrawTriforceRoomTriangle
#_0CCD44: JSR AnimateSceneSprite_MoveTriangle

#_0CCD47: LDA.b $11
#_0CCD49: CMP.b #$24
#_0CCD4B: BNE .reset

#_0CCD4D: LDA.w $1E20,X
#_0CCD50: CMP.b #$50
#_0CCD52: BEQ .exit

#_0CCD54: INC.w $1E20,X

#_0CCD57: LDA.w .speed_x,X
#_0CCD5A: CLC
#_0CCD5B: ADC.w $1E58,X
#_0CCD5E: STA.w $1E58,X

#_0CCD61: LDA.w .speed_y,X
#_0CCD64: CLC
#_0CCD65: ADC.w $1E60,X
#_0CCD68: STA.w $1E60,X

.exit
#_0CCD6B: RTS

;---------------------------------------------------------------------------------------------------

.reset
#_0CCD6C: STZ.w $1E20,X

#_0CCD6F: RTS

;===================================================================================================

UNREACHABLE_0CCD70:
#_0CCD70: dw $0000
#_0CCD72: dw $0054
#_0CCD74: dw $00A8
#_0CCD76: dw $FF8F

;===================================================================================================

FileSelect_FairyY:
#_0CCD78: db $4A ; File 1
#_0CCD79: db $6A ; File 2
#_0CCD7A: db $8A ; File 3
#_0CCD7B: db $AF ; Copy
#_0CCD7C: db $BF ; KILL

;---------------------------------------------------------------------------------------------------

Module01_FileSelect:
#_0CCD7D: STZ.b $E4
#_0CCD7F: STZ.b $E5
#_0CCD81: STZ.b $EA
#_0CCD83: STZ.b $EB

#_0CCD85: LDA.b $11
#_0CCD87: JSL JumpTableLong
#_0CCD8B: dl FileSelect_InitializeGFX
#_0CCD8E: dl FileSelect_ReInitSaveFlagsAndEraseTriforce
#_0CCD91: dl FileSelect_UploadFancyBackground
#_0CCD94: dl FileSelect_TriggerStripesAndAdvance
#_0CCD97: dl FileSelect_TriggerNameStripesAndAdvance
#_0CCD9A: dl FileSelect_Main

;===================================================================================================

FileSelect_InitializeGFX:
#_0CCD9D: JSL EnableForceBlank

#_0CCDA1: STZ.w $012A
#_0CCDA4: STZ.w $1F0C

#_0CCDA7: LDA.b #$0B ; SONG 0B
#_0CCDA9: STA.w $012C

#_0CCDAC: INC.b $11

#_0CCDAE: LDA.b #$02
#_0CCDB0: STA.w $0AA9

#_0CCDB3: LDA.b #$06
#_0CCDB5: STA.w $0AB6
#_0CCDB8: STA.w $0710

#_0CCDBB: JSL Palettes_Load_UnderworldSet
#_0CCDBF: JSL Palettes_Load_OWBG3

#_0CCDC3: LDA.b #$00
#_0CCDC5: STA.w $0AB2

#_0CCDC8: JSL Palettes_Load_HUD

#_0CCDCC: STZ.w $0202

#_0CCDCF: LDA.b #$01
#_0CCDD1: STA.w $0AA4

#_0CCDD4: LDA.b #$23
#_0CCDD6: STA.w $0AA1

#_0CCDD9: LDA.b #$51
#_0CCDDB: STA.w $0AA2

#_0CCDDE: JSL LoadDefaultGraphics
#_0CCDE2: JSL InitializeTilesets
#_0CCDE6: JSL LoadFileSelectGraphics

#_0CCDEA: JSL Intro_InitializeSRAMWRAM

#_0CCDEE: JML DecompressEnemyDamageSubclasses

;===================================================================================================

FileSelect_ReInitSaveFlagsAndEraseTriforce:
#_0CCDF2: LDX.b #$05

.clear_next
#_0CCDF4: STZ.b $BF,X

#_0CCDF6: DEX
#_0CCDF7: BPL .clear_next

;===================================================================================================

FileSelect_EraseTriforce:
#_0CCDF9: LDA.b #$80
#_0CCDFB: STA.w $0710

#_0CCDFE: JSL EnableForceBlank
#_0CCE02: JSL EraseTilemaps_triforce
#_0CCE06: JSL Palettes_LoadForFileSelect

#_0CCE0A: INC.b $15
#_0CCE0C: INC.b $11

#_0CCE0E: RTL

;===================================================================================================

pool FileSelect_UploadLinoleum

.set0
#_0CCE0F: db $81, $35, $82, $35

.set1
#_0CCE13: db $91, $35, $92, $35

.pointers
#_0CCE17: dw .set0
#_0CCE19: dw .set1

pool off

;---------------------------------------------------------------------------------------------------

FileSelect_UploadLinoleum:
#_0CCE1B: LDA.w #$0010
#_0CCE1E: STA.w $1002

#_0CCE21: LDA.w #$FF07
#_0CCE24: STA.w $1004

#_0CCE27: STZ.b $00

#_0CCE29: LDX.w #$0000

.next
#_0CCE2C: LDA.b $00
#_0CCE2E: PHA

#_0CCE2F: AND.w #$0020
#_0CCE32: LSR A
#_0CCE33: LSR A
#_0CCE34: LSR A
#_0CCE35: LSR A
#_0CCE36: TAY

#_0CCE37: LDA.w .pointers,Y
#_0CCE3A: STA.b $02

#_0CCE3C: PLA
#_0CCE3D: AND.w #$0001
#_0CCE40: ASL A
#_0CCE41: TAY

#_0CCE42: LDA.b ($02),Y
#_0CCE44: STA.w $1006,X

#_0CCE47: INX
#_0CCE48: INX

#_0CCE49: INC.b $00

#_0CCE4B: LDA.b $00
#_0CCE4D: CMP.w #$0400
#_0CCE50: BNE .next

#_0CCE52: RTS

;===================================================================================================

FileSelect_UploadFancyBackground:
#_0CCE53: PHB
#_0CCE54: PHK
#_0CCE55: PLB

#_0CCE56: REP #$30

#_0CCE58: JSR FileSelect_UploadLinoleum

;---------------------------------------------------------------------------------------------------

#_0CCE5B: LDY.w #$00DE

.next
#_0CCE5E: LDA.w FancyBackgroundTileMap,Y
#_0CCE61: STA.w $1806,Y

#_0CCE64: INX
#_0CCE65: INX

#_0CCE66: DEY
#_0CCE67: DEY
#_0CCE68: BPL .next

;---------------------------------------------------------------------------------------------------

#_0CCE6A: LDA.w #$1103
#_0CCE6D: STA.b $00

#_0CCE6F: LDA.w #$0011
#_0CCE72: STA.b $02

.next_stripe
#_0CCE74: LDA.b $00
#_0CCE76: XBA
#_0CCE77: STA.w $1006,X

#_0CCE7A: XBA
#_0CCE7B: CLC
#_0CCE7C: ADC.w #$0020
#_0CCE7F: STA.b $00

#_0CCE81: INX
#_0CCE82: INX

#_0CCE83: LDA.w #$3240
#_0CCE86: STA.w $1006,X

#_0CCE89: INX
#_0CCE8A: INX

#_0CCE8B: LDA.w #$347F
#_0CCE8E: STA.w $1006,X

#_0CCE91: INX
#_0CCE92: INX
#_0CCE93: DEC.b $02

#_0CCE95: BPL .next_stripe

;---------------------------------------------------------------------------------------------------

#_0CCE97: SEP #$20

#_0CCE99: LDA.b #$FF
#_0CCE9B: STA.w $1006,X

#_0CCE9E: SEP #$10

#_0CCEA0: INC.b $11

#_0CCEA2: JMP.w FileSelect_TriggerTheStripes

;===================================================================================================

FileSelect_TriggerStripesAndAdvance:
#_0CCEA5: LDA.w $0B9D
#_0CCEA8: STA.b $C8

.advance_submodule
#_0CCEAA: INC.b $11

#_0CCEAC: LDA.b #$06
#_0CCEAE: STA.b $14

#_0CCEB0: RTL

;===================================================================================================

#FileSelect_TriggerNameStripesAndAdvance:
#_0CCEB1: JSR FileSelect_SetUpNamesStripes

#_0CCEB4: LDA.b #$0F
#_0CCEB6: STA.b $13

#_0CCEB8: STZ.w $0710

#_0CCEBB: BRA .advance_submodule

;===================================================================================================

FileSelect_Main:
#_0CCEBD: PHB
#_0CCEBE: PHK
#_0CCEBF: PLB

#_0CCEC0: JSL FileSelect_HandleInput

#_0CCEC4: JMP.w FileSelect_TriggerTheStripes

;===================================================================================================

FileSelect_SetUpNamesStripes:
#_0CCEC7: PHB
#_0CCEC8: PHK
#_0CCEC9: PLB

#_0CCECA: REP #$10

#_0CCECC: LDX.w #$00FD

.next
#_0CCECF: LDA.w FileSelectNamesTilemap-1,X
#_0CCED2: STA.w $1001,X

#_0CCED5: DEX
#_0CCED6: BNE .next

;---------------------------------------------------------------------------------------------------

#_0CCED8: SEP #$10

#_0CCEDA: PLB

#_0CCEDB: RTS

;===================================================================================================

FileSelect_HandleInput:
#_0CCEDC: LDA.b $C8
#_0CCEDE: CMP.b #$03
#_0CCEE0: BCS .not_on_a_file

#_0CCEE2: STA.w $0B9D

.not_on_a_file
#_0CCEE5: REP #$30

#_0CCEE7: LDX.w #$0000

;---------------------------------------------------------------------------------------------------

.check_next_file
#_0CCEEA: STX.b $00

#_0CCEEC: LDA.l SaveFileCopyOffsets,X
#_0CCEF0: TAX

#_0CCEF1: LDA.l $7003E5,X
#_0CCEF5: CMP.w #$55AA
#_0CCEF8: BNE .no_name

#_0CCEFA: PHX

#_0CCEFB: LDX.b $00

#_0CCEFD: LDA.w #$0001
#_0CCF00: STA.b $BF,X

#_0CCF02: PLX

#_0CCF03: LDA.w #FileSelect_DrawLink_offset_y+0
#_0CCF06: STA.b $04

#_0CCF08: LDA.w #FileSelect_DrawLink_offset_y+1
#_0CCF0B: STA.b $02

#_0CCF0D: PHX

#_0CCF0E: JSR FileSelect_DrawLink
#_0CCF11: JSR FileSelect_DrawDeaths

#_0CCF14: PLX

#_0CCF15: JSR FileSelect_CopyNameToStripes

.no_name
#_0CCF18: LDX.b $00
#_0CCF1A: INX
#_0CCF1B: INX
#_0CCF1C: CPX.w #$0006
#_0CCF1F: BCC .check_next_file

;---------------------------------------------------------------------------------------------------

#_0CCF21: SEP #$30

#_0CCF23: LDX.b $C8

#_0CCF25: LDA.b #$1C
#_0CCF27: STA.b $00

#_0CCF29: LDA.w FileSelect_FairyY,X
#_0CCF2C: STA.b $01

#_0CCF2E: JSR FileSelect_DrawFairy

#_0CCF31: LDY.b #$02

#_0CCF33: LDA.b $F6
#_0CCF35: AND.b #$C0

#_0CCF37: ORA.b $F4
#_0CCF39: AND.b #$FC
#_0CCF3B: BEQ .exit

#_0CCF3D: AND.b #$2C
#_0CCF3F: BEQ .didnt_change_selection

#_0CCF41: AND.b #$08
#_0CCF43: BEQ .pressed_down

;---------------------------------------------------------------------------------------------------

#_0CCF45: LDA.b #$20 ; SFX3.20
#_0CCF47: STA.w $012F

#_0CCF4A: DEC.b $C8
#_0CCF4C: BPL .proceed_to_exit

#_0CCF4E: LDA.b #$04
#_0CCF50: STA.b $C8

#_0CCF52: BRA .proceed_to_exit

;---------------------------------------------------------------------------------------------------

.pressed_down
#_0CCF54: LDA.b #$20 ; SFX3.20
#_0CCF56: STA.w $012F

#_0CCF59: INC.b $C8

#_0CCF5B: LDA.b $C8
#_0CCF5D: CMP.b #$05
#_0CCF5F: BNE .proceed_to_exit

#_0CCF61: STZ.b $C8

.proceed_to_exit
#_0CCF63: BRA .exit

;---------------------------------------------------------------------------------------------------

.didnt_change_selection
#_0CCF65: LDA.b #$2C ; SFX2.2C
#_0CCF67: STA.w $012E

#_0CCF6A: LDA.b $C8
#_0CCF6C: CMP.b #$03
#_0CCF6E: BEQ .copy_file

#_0CCF70: BCS .kill_file

#_0CCF72: LDA.b $C8
#_0CCF74: ASL A
#_0CCF75: TAX

#_0CCF76: LDA.b $BF,X
#_0CCF78: BEQ .no_file_there

#_0CCF7A: LDA.b #$F1 ; SONG F1 - fade
#_0CCF7C: STA.w $012C

#_0CCF7F: STZ.b $C9

#_0CCF81: REP #$20

#_0CCF83: LDA.l SaveFileCopyOffsets,X
#_0CCF87: STA.b $00

#_0CCF89: LDA.b $C8
#_0CCF8B: ASL A
#_0CCF8C: INC A
#_0CCF8D: INC A
#_0CCF8E: STA.l $701FFE

#_0CCF92: SEP #$20

#_0CCF94: BRL CopySaveToWRAM

;---------------------------------------------------------------------------------------------------

.no_file_there
#_0CCF97: STZ.b $C9

#_0CCF99: LDY.b #$04
#_0CCF9B: BRA .set_module

;---------------------------------------------------------------------------------------------------

.copy_file
#_0CCF9D: LDY.b #$02
#_0CCF9F: BRA .check_for_some_file

.kill_file
#_0CCFA1: LDY.b #$03

.check_for_some_file
#_0CCFA3: LDA.b $BF
#_0CCFA5: ORA.b $C1
#_0CCFA7: ORA.b $C3
#_0CCFA9: BNE .dont_error_beep

#_0CCFAB: LDA.b #$3C ; SFX2.3C
#_0CCFAD: STA.w $012E

#_0CCFB0: BRA .exit

.dont_error_beep
#_0CCFB2: STZ.b $C8

;---------------------------------------------------------------------------------------------------

.set_module
#_0CCFB4: STY.b $10

#_0CCFB6: STZ.b $11
#_0CCFB8: STZ.b $B0

.exit
#_0CCFBA: RTL

;===================================================================================================

CopySaveToWRAM:
#_0CCFBB: LDX.b #$0F

#_0CCFBD: LDA.b #$00
#_0CCFBF: STA.l $001AC0,X
#_0CCFC3: STA.l $001AE0,X

#_0CCFC7: LDA.b #$00
#_0CCFC9: STA.l $001AB0,X
#_0CCFCD: STA.l $001AD0,X
#_0CCFD1: STA.l $001AF0,X

#_0CCFD5: PHB

#_0CCFD6: LDA.b #$7E
#_0CCFD8: PHA
#_0CCFD9: PLB

;---------------------------------------------------------------------------------------------------

#_0CCFDA: REP #$30

#_0CCFDC: LDY.w #$0000
#_0CCFDF: LDX.b $00

.copy_next
#_0CCFE1: LDA.l $700000,X
#_0CCFE5: STA.w $7EF000,Y

#_0CCFE8: LDA.l $700100,X
#_0CCFEC: STA.w $7EF100,Y

#_0CCFEF: LDA.l $700200,X
#_0CCFF3: STA.w $7EF200,Y

#_0CCFF6: LDA.l $700300,X
#_0CCFFA: STA.w $7EF300,Y

#_0CCFFD: LDA.l $700400,X
#_0CD001: STA.w $7EF400,Y

#_0CD004: INX
#_0CD005: INX

#_0CD006: INY
#_0CD007: INY
#_0CD008: CPY.w #$0100
#_0CD00B: BNE .copy_next

;---------------------------------------------------------------------------------------------------

#_0CD00D: PLB

#_0CD00E: LDA.w #$0007
#_0CD011: STA.l $7EC00D
#_0CD015: STA.l $7EC013

#_0CD019: LDA.w #$0000
#_0CD01C: STA.l $7EC00F
#_0CD020: STA.l $7EC015

#_0CD024: LDA.w #$6040 ; VRAM $C080
#_0CD027: STA.w $0219

#_0CD02A: LDA.w #$4841
#_0CD02D: STA.w $021D

#_0CD030: LDA.w #$007F
#_0CD033: STA.w $021F

#_0CD036: LDA.w #$FFFF
#_0CD039: STA.w $0221

;---------------------------------------------------------------------------------------------------

#_0CD03C: SEP #$30

#_0CD03E: LDA.b #$80
#_0CD040: STA.w $0204

#_0CD043: LDA.b #$05
#_0CD045: STA.b $10
#_0CD047: STZ.b $11

#_0CD049: STZ.w $010E

#_0CD04C: STZ.w $0710

#_0CD04F: STZ.w $0AB2

#_0CD052: RTL

;===================================================================================================

Module02_CopyFile:
#_0CD053: STZ.w $0B9D

#_0CD056: LDA.b $11
#_0CD058: JSL JumpTableLong
#_0CD05C: dl FileSelect_EraseTriforce
#_0CD05F: dl FileSelect_UploadFancyBackground
#_0CD062: dl CopyFile_FindFileIndices
#_0CD065: dl CopyFile_ChooseSelection
#_0CD068: dl CopyFile_ChooseTarget
#_0CD06B: dl CopyFile_ConfirmSelection

;===================================================================================================

CopyFile_FindFileIndices:
#_0CD06E: LDA.b #$07

;===================================================================================================

KILLFile_FindFileIndices:
#_0CD070: JSR Intro_SetStripesAndAdvance

#_0CD073: LDA.b #$0F
#_0CD075: STA.b $13

#_0CD077: STZ.w $0710

#_0CD07A: LDX.b #$FE

.find_file
#_0CD07C: INX
#_0CD07D: INX

#_0CD07E: LDA.b $BF,X
#_0CD080: BEQ .find_file

;---------------------------------------------------------------------------------------------------

#_0CD082: TXA
#_0CD083: LSR A
#_0CD084: STA.b $C8

#_0CD086: RTL

;===================================================================================================

CopyFile_ChooseSelection:
#_0CD087: PHB
#_0CD088: PHK
#_0CD089: PLB

#_0CD08A: JSR CopyFile_SelectionAndBlinker

#_0CD08D: LDA.b $11
#_0CD08F: CMP.b #$03
#_0CD091: BNE FileSelect_TriggerTheStripes

#_0CD093: LDA.b $1A
#_0CD095: AND.b #$30
#_0CD097: BNE FileSelect_TriggerTheStripes

#_0CD099: JSR FilePicker_DeleteHeaderStripe

;===================================================================================================

FileSelect_TriggerTheStripes:
#_0CD09C: LDA.b #$01
#_0CD09E: STA.b $14

#_0CD0A0: PLB

#_0CD0A1: RTL

;===================================================================================================

CopyFile_ChooseTarget:
#_0CD0A2: PHB
#_0CD0A3: PHK
#_0CD0A4: PLB

#_0CD0A5: JSR CopyFile_TargetSelectionAndBlink

#_0CD0A8: LDA.b $11
#_0CD0AA: CMP.b #$04
#_0CD0AC: BNE .trigger_stripes

#_0CD0AE: LDA.b $1A
#_0CD0B0: AND.b #$30
#_0CD0B2: BNE FileSelect_TriggerTheStripes

#_0CD0B4: JSR FilePicker_DeleteHeaderStripe

.trigger_stripes
#_0CD0B7: BRA FileSelect_TriggerTheStripes

;===================================================================================================

CopyFile_ConfirmSelection:
#_0CD0B9: PHB
#_0CD0BA: PHK
#_0CD0BB: PLB

#_0CD0BC: JSR CopyFile_HandleConfirmation

#_0CD0BF: JMP.w FileSelect_TriggerTheStripes

;===================================================================================================

pool FilePicker_DeleteHeaderStripe

.offset
#_0CD0C2: dw $0004, $001E

pool off

;---------------------------------------------------------------------------------------------------

FilePicker_DeleteHeaderStripe:
#_0CD0C6: REP #$30

#_0CD0C8: LDX.w #$0002

#_0CD0CB: LDA.w #$00A9

.next_stripe
#_0CD0CE: LDY.w #$000B
#_0CD0D1: STY.b $00

#_0CD0D3: LDY.w .offset,X

.next_byte
#_0CD0D6: STA.w $1002,Y

#_0CD0D9: INY
#_0CD0DA: INY

#_0CD0DB: DEC.b $00
#_0CD0DD: BNE .next_byte

#_0CD0DF: DEX
#_0CD0E0: DEX
#_0CD0E1: BPL .next_stripe

#_0CD0E3: SEP #$30

#_0CD0E5: RTS

;===================================================================================================

CopyFile_FairyIndent:
#_0CD0E6: db $24 ; File 1
#_0CD0E7: db $24 ; File 2
#_0CD0E8: db $24 ; File 3
#_0CD0E9: db $1C ; Exit

CopyFile_FairyHeight:
#_0CD0EA: db $57
#_0CD0EB: db $6F
#_0CD0EC: db $87
#_0CD0ED: db $BF

;===================================================================================================

CopyFile_CopyToMenuStripe:
#_0CD0EE: dw $6761, $0E40 ; VRAM $C2CE | 16 bytes | Fixed horizontal
#_0CD0F2: dw $00A9

#_0CD0F4: dw $8761, $0E40 ; VRAM $C30E | 16 bytes | Fixed horizontal
#_0CD0F8: dw $00A9

#_0CD0FA: dw $C761, $0E40 ; VRAM $C38E | 16 bytes | Fixed horizontal
#_0CD0FE: dw $00A9

#_0CD100: dw $E761, $0E40 ; VRAM $C3CE | 16 bytes | Fixed horizontal
#_0CD104: dw $00A9

#_0CD106: dw $3011, $0100 ; VRAM $2260 | 2 bytes | Horizontal
#_0CD10A: dw $3583

#_0CD10C: dw $3111, $1440 ; VRAM $2262 | 22 bytes | Fixed horizontal
#_0CD110: dw $3585

#_0CD112: dw $3C11, $0100 ; VRAM $2278 | 2 bytes | Horizontal
#_0CD116: dw $3584

#_0CD118: dw $5011, $0EC0 ; VRAM $22A0 | 16 bytes | Fixed vertical
#_0CD11C: dw $3586

#_0CD11E: dw $5C11, $0EC0 ; VRAM $22B8 | 16 bytes | Fixed vertical
#_0CD122: dw $3596

#_0CD124: dw $5012, $0100 ; VRAM $24A0 | 2 bytes | Horizontal
#_0CD128: dw $3593

#_0CD12A: dw $5112, $1440 ; VRAM $24A2 | 22 bytes | Fixed horizontal
#_0CD12E: dw $3595

#_0CD130: dw $5C12, $0100 ; VRAM $24B8 | 2 bytes | Horizontal
#_0CD134: dw $3594

#_0CD136: db $FF ; end of stripes data

;===================================================================================================

CopyFile_TargetStripeOffsetAdjuster:
#_0CD137: db $00 ; File 1
#_0CD138: db $0C ; File 2

;===================================================================================================

CopyFile_NameStripeBufferOffset:
#_0CD139: dw $003C ; File 1
#_0CD13B: dw $0064 ; File 2
#_0CD13D: dw $008C ; File 3

;===================================================================================================

CopyFile_SelectionAndBlinker:
#_0CD13F: REP #$10

#_0CD141: LDX.w #$00AC
#_0CD144: STX.w $1000

.next_header_stripe
#_0CD147: LDA.w CopyFile_HeaderStripe,X
#_0CD14A: STA.w $1002,X

#_0CD14D: DEX
#_0CD14E: BPL .next_header_stripe

;---------------------------------------------------------------------------------------------------

#_0CD150: REP #$20

#_0CD152: LDX.w #$0000

.next_file_name
#_0CD155: STX.b $00

#_0CD157: LDA.b $BF,X
#_0CD159: AND.w #$0001
#_0CD15C: BEQ .skip_this_file

#_0CD15E: LDA.l SaveFileCopyOffsets,X
#_0CD162: TXY
#_0CD163: TAX

#_0CD164: LDA.w CopyFile_NameStripeBufferOffset,Y
#_0CD167: TAY

#_0CD168: LDA.w #$0006
#_0CD16B: STA.b $02

.next_letter
#_0CD16D: LDA.l $7003D9,X
#_0CD171: CLC
#_0CD172: ADC.w #$1800
#_0CD175: STA.w $1002,Y

#_0CD178: CLC
#_0CD179: ADC.w #$0010
#_0CD17C: STA.w $1016,Y

#_0CD17F: INX
#_0CD180: INX

#_0CD181: INY
#_0CD182: INY

#_0CD183: DEC.b $02
#_0CD185: BNE .next_letter

.skip_this_file
#_0CD187: LDX.b $00
#_0CD189: INX
#_0CD18A: INX
#_0CD18B: CPX.w #$0006
#_0CD18E: BCC .next_file_name

;---------------------------------------------------------------------------------------------------

#_0CD190: SEP #$30

#_0CD192: LDX.b $C8

#_0CD194: LDA.w CopyFile_FairyIndent,X
#_0CD197: STA.b $00

#_0CD199: LDA.w CopyFile_FairyHeight,X
#_0CD19C: STA.b $01

#_0CD19E: JSR FileSelect_DrawFairy

#_0CD1A1: LDA.b $F6
#_0CD1A3: AND.b #$C0

#_0CD1A5: ORA.b $F4
#_0CD1A7: AND.b #$FC
#_0CD1A9: BNE .made_input

#_0CD1AB: BRL .exit

.made_input
#_0CD1AE: AND.b #$2C
#_0CD1B0: BEQ .made_selection

#_0CD1B2: AND.b #$08
#_0CD1B4: BEQ .didnt_press_up

#_0CD1B6: LDX.b $C8
#_0CD1B8: DEX
#_0CD1B9: BMI .select_exit

;---------------------------------------------------------------------------------------------------

.prev_file_check
#_0CD1BB: TXA
#_0CD1BC: ASL A
#_0CD1BD: TAY

#_0CD1BE: LDA.w $00BF,Y
#_0CD1C1: BNE .set_new_selection

#_0CD1C3: DEX
#_0CD1C4: BPL .prev_file_check

.select_exit
#_0CD1C6: LDX.b #$03
#_0CD1C8: BRA .set_new_selection

;---------------------------------------------------------------------------------------------------

.didnt_press_up
#_0CD1CA: LDX.b $C8
#_0CD1CC: INX
#_0CD1CD: CPX.b #$03
#_0CD1CF: BCS .went_too_far

.next_file_check
#_0CD1D1: TXA
#_0CD1D2: ASL A
#_0CD1D3: TAY

#_0CD1D4: LDA.w $00BF,Y
#_0CD1D7: BNE .set_new_selection

#_0CD1D9: INX
#_0CD1DA: CPX.b #$03
#_0CD1DC: BNE .next_file_check

#_0CD1DE: BRA .set_new_selection

.went_too_far
#_0CD1E0: CPX.b #$04
#_0CD1E2: BNE .set_new_selection

#_0CD1E4: LDX.b #$00
#_0CD1E6: BRA .next_file_check

.set_new_selection
#_0CD1E8: LDA.b #$20 ; SFX3.20
#_0CD1EA: STA.w $012F

#_0CD1ED: STX.b $C8
#_0CD1EF: BRA .exit

;---------------------------------------------------------------------------------------------------

.made_selection
#_0CD1F1: LDA.b #$2C ; SFX2.2C
#_0CD1F3: STA.w $012E

#_0CD1F6: LDA.b $C8
#_0CD1F8: CMP.b #$03
#_0CD1FA: BEQ ReturnToFileSelect

;---------------------------------------------------------------------------------------------------

#_0CD1FC: ASL A
#_0CD1FD: STA.b $CC
#_0CD1FF: STZ.b $CD

#_0CD201: LDX.b #$49

.next_target_stripe
#_0CD203: LDA.w CopyFile_CopyToMenuStripe-1,X
#_0CD206: STA.w $1035,X

#_0CD209: DEX
#_0CD20A: BNE .next_target_stripe

;---------------------------------------------------------------------------------------------------

#_0CD20C: LDX.b $C8
#_0CD20E: CPX.b #$02
#_0CD210: BEQ .selected_file_3

#_0CD212: LDA.w CopyFile_TargetStripeOffsetAdjuster,X
#_0CD215: TAX

#_0CD216: LDA.b #$62
#_0CD218: STA.w $1036,X
#_0CD21B: STA.w $103C,X

#_0CD21E: LDA.b #$27
#_0CD220: STA.w $1037,X

#_0CD223: CLC
#_0CD224: ADC.b #$20
#_0CD226: STA.w $103D,X

.selected_file_3
#_0CD229: INC.b $11

#_0CD22B: BRA .reset_cursor

;===================================================================================================

#ReturnToFileSelect:
#_0CD22D: LDA.b #$01
#_0CD22F: STA.b $10

#_0CD231: LDA.b #$01
#_0CD233: STA.b $11

#_0CD235: STZ.b $B0

.reset_cursor
#_0CD237: STZ.b $C8

.exit
#_0CD239: RTS

;===================================================================================================

CopyFile_ConfirmationStripes:
#_0CD23A: dw $B461, $0E40 ; VRAM $C368 | 16 bytes | Fixed horizontal
#_0CD23E: dw $00A9

#_0CD240: dw $D461, $0E40 ; VRAM $C3A8 | 16 bytes | Fixed horizontal
#_0CD244: dw $00A9

#_0CD246: dw $C662, $0D00 ; VRAM $C58C | 14 bytes | Horizontal
#_0CD24A: dw $1802, $180E, $180F, $1828, $18A9, $180E, $180A

#_0CD258: dw $E662, $0D00 ; VRAM $C5CC | 14 bytes | Horizontal
#_0CD25C: dw $1812, $181E, $181F, $1838, $18A9, $181E, $181A

#_0CD26A: db $FF ; end of stripes data

;===================================================================================================

CopyFile_TargetFairyX:
#_0CD26B: db $8C ; 1
#_0CD26C: db $8C ; 2
#_0CD26D: db $1C ; Exit

CopyFile_TargetFairyY:
#_0CD26E: db $67 ; 1
#_0CD26F: db $7F ; 2
#_0CD270: db $BF ; Exit

CopyFile_BufferOffset:
#_0CD271: dw $0038
#_0CD273: dw $0060

CopyFile_TargetNumerals:
#_0CD275: dw $18E7 ; 1
#_0CD277: dw $18E8 ; 2
#_0CD279: dw $18E9 ; 3

;---------------------------------------------------------------------------------------------------

CopyFile_TargetSelectionAndBlink:
#_0CD27B: LDA.b #$04
#_0CD27D: LDX.b #$01

.next_index_setup
#_0CD27F: CMP.b $CC
#_0CD281: BEQ .dont_replace_index

#_0CD283: STA.b $CA,X

#_0CD285: DEX

.dont_replace_index
#_0CD286: DEC A
#_0CD287: DEC A
#_0CD288: BPL .next_index_setup

;---------------------------------------------------------------------------------------------------

#_0CD28A: REP #$10

#_0CD28C: LDX.w #$0084
#_0CD28F: STX.b $0E

.next_header_stripe
#_0CD291: LDA.w CopyFile_TargetHeaderStripes,X
#_0CD294: STA.w $1002,X

#_0CD297: DEX
#_0CD298: BPL .next_header_stripe

;---------------------------------------------------------------------------------------------------

#_0CD29A: REP #$20

#_0CD29C: LDX.w #$0000
#_0CD29F: STX.b $04

.next_filename_stripe
#_0CD2A1: STX.b $00

#_0CD2A3: CPX.b $CC
#_0CD2A5: BEQ .skip_this_file

#_0CD2A7: LDY.b $04

#_0CD2A9: LDA.w CopyFile_BufferOffset,Y
#_0CD2AC: TAY

#_0CD2AD: INC.b $04
#_0CD2AF: INC.b $04

#_0CD2B1: LDA.w CopyFile_TargetNumerals,X
#_0CD2B4: STA.w $1002,Y

#_0CD2B7: CLC
#_0CD2B8: ADC.w #$0010
#_0CD2BB: STA.w $1016,Y

#_0CD2BE: LDA.b $BF,X
#_0CD2C0: BEQ .skip_this_file

#_0CD2C2: LDA.w #$0006
#_0CD2C5: STA.b $02

#_0CD2C7: LDA.l SaveFileCopyOffsets,X
#_0CD2CB: TAX

.next_letter
#_0CD2CC: LDA.l $7003D9,X
#_0CD2D0: CLC
#_0CD2D1: ADC.w #$1800
#_0CD2D4: STA.w $1006,Y

#_0CD2D7: CLC
#_0CD2D8: ADC.w #$0010
#_0CD2DB: STA.w $101A,Y

#_0CD2DE: INX
#_0CD2DF: INX

#_0CD2E0: INY
#_0CD2E1: INY

#_0CD2E2: DEC.b $02
#_0CD2E4: BNE .next_letter

.skip_this_file
#_0CD2E6: LDX.b $00
#_0CD2E8: INX
#_0CD2E9: INX
#_0CD2EA: CPX.w #$0006
#_0CD2ED: BCC .next_filename_stripe

;---------------------------------------------------------------------------------------------------

#_0CD2EF: LDX.b $0E
#_0CD2F1: STX.w $1000

#_0CD2F4: SEP #$30

#_0CD2F6: LDX.b $C8

#_0CD2F8: LDA.w CopyFile_TargetFairyX,X
#_0CD2FB: STA.b $00

#_0CD2FD: LDA.w CopyFile_TargetFairyY,X
#_0CD300: STA.b $01

#_0CD302: JSR FileSelect_DrawFairy

#_0CD305: LDA.b $F6
#_0CD307: AND.b #$C0

#_0CD309: ORA.b $F4
#_0CD30B: AND.b #$FC
#_0CD30D: BEQ .exit

#_0CD30F: AND.b #$2C
#_0CD311: BEQ .made_selection

#_0CD313: AND.b #$08
#_0CD315: BEQ .didnt_press_up

#_0CD317: LDX.b $C8
#_0CD319: DEX
#_0CD31A: BPL .select_exit

#_0CD31C: LDX.b #$02
#_0CD31E: BRA .select_exit

.didnt_press_up
#_0CD320: LDX.b $C8
#_0CD322: INX
#_0CD323: CPX.b #$03
#_0CD325: BCC .select_exit

#_0CD327: LDX.b #$00

;---------------------------------------------------------------------------------------------------

.select_exit
#_0CD329: LDA.b #$20 ; SFX3.20
#_0CD32B: STA.w $012F

#_0CD32E: STX.b $C8
#_0CD330: BRA .exit

;---------------------------------------------------------------------------------------------------

.made_selection
#_0CD332: LDA.b #$2C ; SFX2.2C
#_0CD334: STA.w $012E

#_0CD337: LDX.b $C8
#_0CD339: CPX.b #$02
#_0CD33B: BEQ .selecting_exit

#_0CD33D: LDA.b $CA,X
#_0CD33F: STA.b $CA
#_0CD341: STZ.b $CB

#_0CD343: LDX.b #$30

.next_confirm_stripe
#_0CD345: LDA.w CopyFile_ConfirmationStripes,X
#_0CD348: STA.w $1036,X

#_0CD34B: DEX
#_0CD34C: BPL .next_confirm_stripe

#_0CD34E: LDA.b $C8
#_0CD350: BNE .dont_reposition_deleted_name

#_0CD352: LDA.b #$62
#_0CD354: STA.w $1036
#_0CD357: STA.w $103C

#_0CD35A: LDA.b #$14
#_0CD35C: STA.w $1037

#_0CD35F: CLC
#_0CD360: ADC.b #$20
#_0CD362: STA.w $103D

.dont_reposition_deleted_name
#_0CD365: INC.b $11
#_0CD367: BRA .reset_selection

;---------------------------------------------------------------------------------------------------

.selecting_exit
#_0CD369: JSR ReturnToFileSelect

.reset_selection
#_0CD36C: STZ.b $C8

.exit
#_0CD36E: RTS

;===================================================================================================

pool CopyFile_HandleConfirmation

.fairy_y
#_0CD36F: db $AF ; Yes
#_0CD370: db $BF ; No

pool off

;---------------------------------------------------------------------------------------------------

CopyFile_HandleConfirmation:
#_0CD371: LDX.b $C8

#_0CD373: LDA.b #$1C
#_0CD375: STA.b $00

#_0CD377: LDA.w .fairy_y,X
#_0CD37A: STA.b $01

#_0CD37C: JSR FileSelect_DrawFairy

#_0CD37F: LDA.b $F6
#_0CD381: AND.b #$C0

#_0CD383: ORA.b $F4
#_0CD385: AND.b #$FC
#_0CD387: BEQ .exit

#_0CD389: AND.b #$2C
#_0CD38B: BEQ .made_selection

#_0CD38D: AND.b #$24
#_0CD38F: BEQ .select_or_down

#_0CD391: LDA.b #$20 ; SFX3.20
#_0CD393: STA.w $012F

#_0CD396: INC.b $C8

#_0CD398: LDA.b $C8
#_0CD39A: CMP.b #$02
#_0CD39C: BCC .exit

#_0CD39E: STZ.b $C8
#_0CD3A0: BRA .exit

;---------------------------------------------------------------------------------------------------

.select_or_down
#_0CD3A2: LDA.b #$20 ; SFX3.20
#_0CD3A4: STA.w $012F

#_0CD3A7: DEC.b $C8
#_0CD3A9: BPL .exit

#_0CD3AB: LDA.b #$01
#_0CD3AD: STA.b $C8
#_0CD3AF: BRA .exit

;---------------------------------------------------------------------------------------------------

.made_selection
#_0CD3B1: LDA.b #$2C ; SFX2.2C
#_0CD3B3: STA.w $012E

#_0CD3B6: LDA.b $C8
#_0CD3B8: BNE .decided_against_it

#_0CD3BA: REP #$30

#_0CD3BC: LDX.b $CA

#_0CD3BE: LDA.l SaveFileCopyOffsets,X
#_0CD3C2: TAY

#_0CD3C3: LDX.b $CC

#_0CD3C5: LDA.l SaveFileCopyOffsets,X
#_0CD3C9: TAX

#_0CD3CA: JSR CopyFile_CopyData

#_0CD3CD: LDX.b $CA

#_0CD3CF: LDA.w #$0001
#_0CD3D2: STA.b $BF,X

#_0CD3D4: SEP #$30

;---------------------------------------------------------------------------------------------------

.decided_against_it
#_0CD3D6: JSR ReturnToFileSelect

#_0CD3D9: STZ.b $C8

.exit
#_0CD3DB: RTS

;===================================================================================================

CopyFile_CopyData:
#_0CD3DC: SEP #$20

#_0CD3DE: PHB

#_0CD3DF: LDA.b #$70
#_0CD3E1: PHA
#_0CD3E2: PLB

#_0CD3E3: REP #$20

#_0CD3E5: LDA.w #$0080
#_0CD3E8: STA.b $00

.next
#_0CD3EA: LDA.w $700000,X
#_0CD3ED: STA.w $700000,Y

#_0CD3F0: LDA.w $700100,X
#_0CD3F3: STA.w $700100,Y

#_0CD3F6: LDA.w $700200,X
#_0CD3F9: STA.w $700200,Y

#_0CD3FC: LDA.w $700300,X
#_0CD3FF: STA.w $700300,Y

#_0CD402: LDA.w $700400,X
#_0CD405: STA.w $700400,Y

#_0CD408: INY
#_0CD409: INY

#_0CD40A: INX
#_0CD40B: INX

#_0CD40C: DEC.b $00
#_0CD40E: BNE .next

;---------------------------------------------------------------------------------------------------

#_0CD410: SEP #$20

#_0CD412: PLB

#_0CD413: REP #$20

#_0CD415: RTS

;===================================================================================================

KILLFile_FairyX:
#_0CD416: db $24 ; File 1
#_0CD417: db $24 ; File 2
#_0CD418: db $24 ; File 3
#_0CD419: db $1C ; Exit

KILLFile_FairyY:
#_0CD41A: db $67 ; File 1
#_0CD41B: db $7F ; File 2
#_0CD41C: db $97 ; File 3
#_0CD41D: db $BF ; Exit

;---------------------------------------------------------------------------------------------------

KILL_OK_stripes:
#_0CD41E: db $61,$A7,$40,$24,$A9,$00,$61,$C7
#_0CD426: db $40,$24,$A9,$00,$62,$07,$40,$24
#_0CD42E: db $A9,$00,$62,$27,$40,$24,$A9,$00
#_0CD436: db $62,$C6,$00,$21,$04,$18,$21,$18
#_0CD43E: db $00,$18,$22,$18,$04,$18,$A9,$18
#_0CD446: db $23,$18,$07,$18,$AF,$18,$22,$18
#_0CD44E: db $A9,$18,$0F,$18,$0B,$18,$00,$18
#_0CD456: db $28,$18,$04,$18,$21,$18,$62,$E6
#_0CD45E: db $00,$21,$14,$18,$31,$18,$10,$18
#_0CD466: db $32,$18,$14,$18,$A9,$18,$33,$18
#_0CD46E: db $17,$18,$BF,$18,$32,$18,$A9,$18
#_0CD476: db $1F,$18,$1B,$18,$10,$18,$38,$18
#_0CD47E: db $14,$18,$31,$18

#_0CD482: db $FF ; end of stripes data

;===================================================================================================

KILL_OK_FileNameStripesAdjustment:
#_0CD483: db $00 ; File 1
#_0CD484: db $0C ; File 2

;===================================================================================================

Module03_KILLFile:
#_0CD485: LDA.b $11
#_0CD487: JSL JumpTableLong
#_0CD48B: dl FileSelect_EraseTriforce
#_0CD48E: dl FileSelect_UploadFancyBackground
#_0CD491: dl KILLFile_SetUp
#_0CD494: dl KILLFile_HandleSelection
#_0CD497: dl KILLFile_HandleConfirmation

;===================================================================================================

KILLFile_SetUp:
#_0CD49A: LDA.b #$08

#_0CD49C: JMP.w KILLFile_FindFileIndices

;===================================================================================================

KILLFile_HandleSelection:
#_0CD49F: PHB
#_0CD4A0: PHK
#_0CD4A1: PLB

#_0CD4A2: LDA.b $C8
#_0CD4A4: CMP.b #$03
#_0CD4A6: BCS .selecting_exit

#_0CD4A8: STA.w $0B9D

.selecting_exit
#_0CD4AB: JSR KILLFile_ChooseTarget

#_0CD4AE: JMP.w FileSelect_TriggerTheStripes

;===================================================================================================

KILLFile_HandleConfirmation:
#_0CD4B1: PHB
#_0CD4B2: PHK
#_0CD4B3: PLB

#_0CD4B4: JSR KILLFile_VerifyDeletion

#_0CD4B7: JMP.w FileSelect_TriggerTheStripes

;===================================================================================================

KILLFile_ChooseTarget:
#_0CD4BA: REP #$10

#_0CD4BC: LDX.w #$00FD

.next_blankname_stripe
#_0CD4BF: LDA.w KILLFile_BlankNameStripes-1,X
#_0CD4C2: STA.w $1001,X

#_0CD4C5: DEX
#_0CD4C6: BNE .next_blankname_stripe

;---------------------------------------------------------------------------------------------------

#_0CD4C8: REP #$20

#_0CD4CA: LDX.w #$0000

.next_filename_stripe
#_0CD4CD: STX.b $00

#_0CD4CF: LDA.b $BF,X
#_0CD4D1: AND.w #$0001
#_0CD4D4: BEQ .skip_this_file

#_0CD4D6: LDA.l SaveFileCopyOffsets,X
#_0CD4DA: TAX
#_0CD4DB: JSR FileSelect_CopyNameToStripes

.skip_this_file
#_0CD4DE: LDX.b $00
#_0CD4E0: INX
#_0CD4E1: INX
#_0CD4E2: CPX.w #$0006
#_0CD4E5: BCC .next_filename_stripe

;---------------------------------------------------------------------------------------------------

#_0CD4E7: SEP #$30

#_0CD4E9: LDX.b $C8

#_0CD4EB: LDA.w KILLFile_FairyX,X
#_0CD4EE: STA.b $00

#_0CD4F0: LDA.w KILLFile_FairyY,X
#_0CD4F3: STA.b $01

#_0CD4F5: JSR FileSelect_DrawFairy

;---------------------------------------------------------------------------------------------------

#_0CD4F8: LDY.b #$02

#_0CD4FA: LDA.b $F4
#_0CD4FC: AND.b #$20
#_0CD4FE: BNE .pressed_down_or_select

#_0CD500: LDA.b $F4
#_0CD502: AND.b #$0C
#_0CD504: BEQ .check_for_pick

#_0CD506: AND.b #$04
#_0CD508: BNE .pressed_down_or_select

#_0CD50A: LDA.b #$20 ; SFX3.20
#_0CD50C: STA.w $012F

#_0CD50F: LDY.b #$FE

#_0CD511: LDX.b $C8
#_0CD513: DEX
#_0CD514: BMI .select_exit

.check_prev_file
#_0CD516: TXA
#_0CD517: ASL A
#_0CD518: TAY

#_0CD519: LDA.w $00BF,Y
#_0CD51C: BNE .check_for_pick

#_0CD51E: DEX
#_0CD51F: BPL .check_prev_file

;---------------------------------------------------------------------------------------------------

.select_exit
#_0CD521: LDX.b #$03
#_0CD523: BRA .check_for_pick

;---------------------------------------------------------------------------------------------------

.pressed_down_or_select
#_0CD525: LDA.b #$20 ; SFX3.20
#_0CD527: STA.w $012F

#_0CD52A: LDX.b $C8
#_0CD52C: INX
#_0CD52D: CPX.b #$03
#_0CD52F: BCS .not_on_file

.check_next_file
#_0CD531: TXA
#_0CD532: ASL A
#_0CD533: TAY

#_0CD534: LDA.w $00BF,Y
#_0CD537: BNE .check_for_pick

#_0CD539: INX
#_0CD53A: CPX.b #$03
#_0CD53C: BNE .check_next_file

#_0CD53E: BRA .check_for_pick

.not_on_file
#_0CD540: CPX.b #$04
#_0CD542: BNE .check_for_pick

#_0CD544: LDX.b #$00
#_0CD546: BRA .check_next_file

;---------------------------------------------------------------------------------------------------

.check_for_pick
#_0CD548: STX.b $C8

#_0CD54A: LDA.b $F6
#_0CD54C: AND.b #$C0

#_0CD54E: ORA.b $F4
#_0CD550: AND.b #$D0
#_0CD552: BEQ .exit

#_0CD554: LDA.b #$2C ; SFX2.2C
#_0CD556: STA.w $012E

#_0CD559: LDA.b $C8
#_0CD55B: CMP.b #$03
#_0CD55D: BEQ .picked_exit

#_0CD55F: LDX.b #$64

.next_ok
#_0CD561: LDA.w KILL_OK_stripes,X
#_0CD564: STA.w $1002,X

#_0CD567: DEX
#_0CD568: BPL .next_ok

;---------------------------------------------------------------------------------------------------

#_0CD56A: INC.b $11

#_0CD56C: LDX.b $C8
#_0CD56E: CPX.b #$02
#_0CD570: BEQ .no_filename_stripe_adjustment

#_0CD572: LDA.w KILL_OK_FileNameStripesAdjustment,X
#_0CD575: TAX

#_0CD576: LDA.b #$62
#_0CD578: STA.w $1002,X
#_0CD57B: STA.w $1008,X

#_0CD57E: LDA.b #$67
#_0CD580: STA.w $1003,X

#_0CD583: CLC
#_0CD584: ADC.b #$20
#_0CD586: STA.w $1009,X

.no_filename_stripe_adjustment
#_0CD589: LDA.b $C8
#_0CD58B: STA.b $B0

#_0CD58D: STZ.b $C8
#_0CD58F: BRA .exit

;---------------------------------------------------------------------------------------------------

.picked_exit
#_0CD591: SEP #$30

#_0CD593: JSR ReturnToFileSelect

.exit
#_0CD596: RTS

;===================================================================================================

pool KILLFile_VerifyDeletion

.fairy_pos_y
#_0CD597: db $AF
#_0CD598: db $BF

pool off

;---------------------------------------------------------------------------------------------------

KILLFile_VerifyDeletion:
#_0CD599: LDA.b $B0
#_0CD59B: ASL A
#_0CD59C: STA.b $00

#_0CD59E: SEP #$30

#_0CD5A0: LDX.b $C8

#_0CD5A2: LDA.b #$1C
#_0CD5A4: STA.b $00

#_0CD5A6: LDA.w .fairy_pos_y,X
#_0CD5A9: STA.b $01

#_0CD5AB: JSR FileSelect_DrawFairy

;---------------------------------------------------------------------------------------------------

#_0CD5AE: LDY.b #$02

#_0CD5B0: LDA.b $F4
#_0CD5B2: AND.b #$2C
#_0CD5B4: BEQ .not_selection_change_input

#_0CD5B6: AND.b #$24
#_0CD5B8: BNE .pressed_select_or_down

#_0CD5BA: DEX
#_0CD5BB: BRA .move_kiss_of_death

.pressed_select_or_down
#_0CD5BD: INX

.move_kiss_of_death
#_0CD5BE: TXA
#_0CD5BF: AND.b #$01
#_0CD5C1: STA.b $C8

#_0CD5C3: LDA.b #$20 ; SFX3.20
#_0CD5C5: STA.w $012F

;---------------------------------------------------------------------------------------------------

.not_selection_change_input
#_0CD5C8: LDA.b $F6
#_0CD5CA: AND.b #$C0

#_0CD5CC: ORA.b $F4
#_0CD5CE: AND.b #$D0
#_0CD5D0: BEQ .exit

#_0CD5D2: LDA.b #$2C ; SFX2.2C
#_0CD5D4: STA.w $012E

#_0CD5D7: LDA.b $C8
#_0CD5D9: BNE .chickened_out

#_0CD5DB: LDA.b #$22 ; SFX3.22
#_0CD5DD: STA.w $012F
#_0CD5E0: STZ.w $012E

#_0CD5E3: REP #$30

#_0CD5E5: LDA.b $B0
#_0CD5E7: AND.w #$00FF
#_0CD5EA: ASL A
#_0CD5EB: TAX

#_0CD5EC: STZ.b $BF,X

#_0CD5EE: LDA.l SaveFileCopyOffsets,X
#_0CD5F2: TAX

;---------------------------------------------------------------------------------------------------

#_0CD5F3: LDY.w #$0000
#_0CD5F6: TYA

.clear_next
#_0CD5F7: STA.l $700000,X
#_0CD5FB: STA.l $700100,X
#_0CD5FF: STA.l $700200,X
#_0CD603: STA.l $700300,X
#_0CD607: STA.l $700400,X
#_0CD60B: STA.l $700F00,X
#_0CD60F: STA.l $701000,X
#_0CD613: STA.l $701100,X
#_0CD617: STA.l $701200,X
#_0CD61B: STA.l $701300,X

#_0CD61F: INX
#_0CD620: INX

#_0CD621: INY
#_0CD622: INY
#_0CD623: CPY.w #$0100
#_0CD626: BNE .clear_next

;---------------------------------------------------------------------------------------------------

#_0CD628: SEP #$30

.chickened_out
#_0CD62A: JSR ReturnToFileSelect

#_0CD62D: STZ.b $B0

.exit
#_0CD62F: RTS

;===================================================================================================

pool FileSelect_CopyNameToStripes

.name_offset
#_0CD630: dw $0008
#_0CD632: dw $005C
#_0CD634: dw $00B0

.hearts_offset
#_0CD636: dw $0016
#_0CD638: dw $006A
#_0CD63A: dw $00BE

pool off

;---------------------------------------------------------------------------------------------------

FileSelect_CopyNameToStripes:
#_0CD63C: PHX

#_0CD63D: LDY.b $00

#_0CD63F: LDA.w .name_offset,Y
#_0CD642: TAY

#_0CD643: LDA.w #$0006
#_0CD646: STA.b $02

;---------------------------------------------------------------------------------------------------

.next_character
#_0CD648: LDA.l $7003D9,X
#_0CD64C: CLC
#_0CD64D: ADC.w #$1800
#_0CD650: STA.w $1002,Y

#_0CD653: CLC
#_0CD654: ADC.w #$0010
#_0CD657: STA.w $102C,Y

#_0CD65A: INX
#_0CD65B: INX

#_0CD65C: INY
#_0CD65D: INY

#_0CD65E: DEC.b $02
#_0CD660: BNE .next_character

;---------------------------------------------------------------------------------------------------

#_0CD662: PLX

#_0CD663: LDY.w #$0001

#_0CD666: LDA.l $70036C,X
#_0CD66A: AND.w #$00FF
#_0CD66D: LSR A
#_0CD66E: LSR A
#_0CD66F: LSR A
#_0CD670: STA.b $02

#_0CD672: LDX.b $00

#_0CD674: LDY.w .hearts_offset,X
#_0CD677: STY.b $04

#_0CD679: LDA.w #$0520
#_0CD67C: LDX.w #$000A

;---------------------------------------------------------------------------------------------------

.next_heart
#_0CD67F: STA.w $1002,Y

#_0CD682: INY
#_0CD683: INY

#_0CD684: DEX
#_0CD685: BNE .same_row

#_0CD687: PHA

#_0CD688: LDA.b $04
#_0CD68A: CLC
#_0CD68B: ADC.w #$002A
#_0CD68E: TAY

#_0CD68F: PLA

.same_row
#_0CD690: DEC.b $02
#_0CD692: BNE .next_heart

#_0CD694: RTS

;===================================================================================================

pool FileSelect_DrawLink

.unused
#_0CD695: db $01, $06, $0B

.offset_y
#_0CD698: db $34 ; IDK
#_0CD699: db $43 ; file 1
#_0CD69A: db $63 ; file 2
#_0CD69B: db $83 ; file 3

.oam_offset
#_0CD69C: db $28 ; file 1
#_0CD69D: db $3C ; file 2
#_0CD69E: db $50 ; file 3

.sword_gfx
#_0CD69F: db $85 ; fighter sword
#_0CD6A0: db $A1 ; master sword
#_0CD6A1: db $A1 ; tempered sword
#_0CD6A2: db $A1 ; gold sword

.shield_gfx
#_0CD6A3: db $C4 ; fighter shield
#_0CD6A4: db $CA ; fire shield
#_0CD6A5: db $E0 ; mirror shield

.sword_props
#_0CD6A6: db $72 ; file 1
#_0CD6A7: db $76 ; file 2
#_0CD6A8: db $7A ; file 3

.shield_props
#_0CD6A9: db $32 ; file 1
#_0CD6AA: db $36 ; file 2
#_0CD6AB: db $3A ; file 3

.link_props
#_0CD6AC: db $30 ; file 1
#_0CD6AD: db $34 ; file 2
#_0CD6AE: db $38 ; file 3

pool off

;---------------------------------------------------------------------------------------------------

FileSelect_DrawLink:
#_0CD6AF: REP #$30

#_0CD6B1: LDA.w #$0116
#_0CD6B4: ASL A
#_0CD6B5: STA.w $0100

#_0CD6B8: LDA.b $00
#_0CD6BA: AND.w #$00FF
#_0CD6BD: TAX

#_0CD6BE: LDA.l SaveFileCopyOffsets,X
#_0CD6C2: STA.b $0E

;---------------------------------------------------------------------------------------------------

#_0CD6C4: SEP #$30

#_0CD6C6: LDA.b $00
#_0CD6C8: LSR A
#_0CD6C9: TAY

#_0CD6CA: LDA.w .oam_offset,Y
#_0CD6CD: TAX

#_0CD6CE: LDA.b ($04)
#_0CD6D0: CLC
#_0CD6D1: ADC.b #$0C
#_0CD6D3: STA.w $0800,X
#_0CD6D6: STA.w $0804,X

#_0CD6D9: LDA.b ($02),Y
#_0CD6DB: CLC
#_0CD6DC: ADC.b #$FB
#_0CD6DE: STA.w $0801,X

#_0CD6E1: CLC
#_0CD6E2: ADC.b #$08
#_0CD6E4: STA.w $0805,X

#_0CD6E7: LDA.w .sword_props,Y
#_0CD6EA: STA.w $0803,X
#_0CD6ED: STA.w $0807,X

;---------------------------------------------------------------------------------------------------

#_0CD6F0: PHY
#_0CD6F1: PHX

#_0CD6F2: REP #$10

#_0CD6F4: LDX.b $0E

#_0CD6F6: LDA.l $700359,X

#_0CD6FA: SEP #$10

#_0CD6FC: PLX

#_0CD6FD: TAY
#_0CD6FE: DEY
#_0CD6FF: BPL .have_sword

#_0CD701: LDA.b #$F0
#_0CD703: STA.w $0801,X
#_0CD706: STA.w $0805,X

#_0CD709: INY

.have_sword
#_0CD70A: LDA.w .sword_gfx,Y
#_0CD70D: STA.w $0802,X

#_0CD710: CLC
#_0CD711: ADC.b #$10
#_0CD713: STA.w $0806,X

;---------------------------------------------------------------------------------------------------

#_0CD716: PLY

#_0CD717: PHX
#_0CD718: TXA

#_0CD719: LSR A
#_0CD71A: LSR A
#_0CD71B: TAX

#_0CD71C: LDA.b #$00
#_0CD71E: STA.w $0A20,X
#_0CD721: STA.w $0A21,X

#_0CD724: PLA
#_0CD725: CLC
#_0CD726: ADC.b #$08
#_0CD728: TAX

#_0CD729: LDA.b ($04)
#_0CD72B: CLC
#_0CD72C: ADC.b #$FB
#_0CD72E: STA.w $0800,X

#_0CD731: LDA.b ($02),Y
#_0CD733: CLC
#_0CD734: ADC.b #$0A
#_0CD736: STA.w $0801,X

#_0CD739: LDA.w .shield_props,Y
#_0CD73C: STA.w $0803,X

;---------------------------------------------------------------------------------------------------

#_0CD73F: PHY
#_0CD740: PHX

#_0CD741: REP #$10

#_0CD743: LDX.b $0E

#_0CD745: LDA.l $70035A,X

#_0CD749: SEP #$10

#_0CD74B: PLX

#_0CD74C: TAY
#_0CD74D: DEY
#_0CD74E: BPL .have_shield

#_0CD750: LDA.b #$F0
#_0CD752: STA.w $0801,X

#_0CD755: INY

.have_shield
#_0CD756: LDA.w .shield_gfx,Y
#_0CD759: STA.w $0802,X

#_0CD75C: PLY
#_0CD75D: PHX

#_0CD75E: TXA
#_0CD75F: LSR A
#_0CD760: LSR A
#_0CD761: TAX

#_0CD762: LDA.b #$02
#_0CD764: STA.w $0A20,X

#_0CD767: PLA
#_0CD768: CLC
#_0CD769: ADC.b #$04
#_0CD76B: TAX

#_0CD76C: LDA.b ($04)
#_0CD76E: STA.w $0800,X
#_0CD771: STA.w $0804,X

#_0CD774: LDA.b #$00
#_0CD776: STA.w $0802,X

#_0CD779: LDA.b #$02
#_0CD77B: STA.w $0806,X

#_0CD77E: LDA.w .link_props,Y
#_0CD781: STA.w $0803,X

#_0CD784: ORA.b #$40
#_0CD786: STA.w $0807,X

#_0CD789: LDA.b ($02),Y
#_0CD78B: STA.w $0801,X

#_0CD78E: CLC
#_0CD78F: ADC.b #$08
#_0CD791: STA.w $0805,X

#_0CD794: TXA
#_0CD795: LSR A
#_0CD796: LSR A
#_0CD797: TAX

#_0CD798: LDA.b #$02
#_0CD79A: STA.w $0A20,X
#_0CD79D: STA.w $0A21,X

#_0CD7A0: REP #$30

#_0CD7A2: RTS

;===================================================================================================

pool FileSelect_DrawFairy

.char
#_0CD7A3: db $A8
#_0CD7A4: db $AA

pool off

;---------------------------------------------------------------------------------------------------

FileSelect_DrawFairy:
#_0CD7A5: LDA.b $00
#_0CD7A7: STA.w $0800

#_0CD7AA: LDA.b $01
#_0CD7AC: STA.w $0801

#_0CD7AF: PHX

#_0CD7B0: LDX.b #$00
#_0CD7B2: LDA.b $1A

#_0CD7B4: AND.b #$08
#_0CD7B6: BEQ .frame_0

#_0CD7B8: INX

.frame_0
#_0CD7B9: LDA.w .char,X
#_0CD7BC: STA.w $0802

#_0CD7BF: PLX

#_0CD7C0: LDA.b #$7E
#_0CD7C2: STA.w $0803

#_0CD7C5: LDA.b #$02
#_0CD7C7: STA.w $0A20

;---------------------------------------------------------------------------------------------------

#EXIT_0CD7CA:
#_0CD7CA: RTS

;===================================================================================================

pool FileSelect_DrawDeaths

.digit_char
#_0CD7CB: db $D0 ; 0
#_0CD7CC: db $AC ; 1
#_0CD7CD: db $AD ; 2
#_0CD7CE: db $BC ; 3
#_0CD7CF: db $BD ; 4
#_0CD7D0: db $AE ; 5
#_0CD7D1: db $AF ; 6
#_0CD7D2: db $BE ; 7
#_0CD7D3: db $BF ; 8
#_0CD7D4: db $C0 ; 9

.buffer_offset
#_0CD7D5: db $04 ; ..#
#_0CD7D6: db $10 ; .#.
#_0CD7D7: db $1C ; #..

.digit_position_x
#_0CD7D8: db $0C ; ..#
#_0CD7D9: db $04 ; .#.
#_0CD7DA: db $FC ; #..

pool off

;---------------------------------------------------------------------------------------------------

FileSelect_DrawDeaths:
#_0CD7DB: REP #$30

#_0CD7DD: LDA.b $02
#_0CD7DF: PHA
#_0CD7E0: STA.b $08

#_0CD7E2: LDA.b $04
#_0CD7E4: PHA
#_0CD7E5: STA.b $0A

#_0CD7E7: LDX.b $0E

#_0CD7E9: LDA.l $700405,X
#_0CD7ED: CMP.w #$FFFF

#_0CD7F0: BNE .continue

#_0CD7F2: JMP.w .exit

;---------------------------------------------------------------------------------------------------

.continue
#_0CD7F5: CMP.w #$03E8
#_0CD7F8: BCC .under_1000

#_0CD7FA: LDA.w #$0009
#_0CD7FD: STA.b $02
#_0CD7FF: STA.b $04
#_0CD801: STA.b $06

#_0CD803: BRA .done_number

.under_1000
#_0CD805: LDY.w #$0000

.next_100
#_0CD808: CMP.w #$000A
#_0CD80B: BCC .under_100

#_0CD80D: SEC
#_0CD80E: SBC.w #$000A

#_0CD811: INY
#_0CD812: BRA .next_100


.under_100
#_0CD814: STA.b $02
#_0CD816: TYA
#_0CD817: LDY.w #$0000

.next_10
#_0CD81A: CMP.w #$000A
#_0CD81D: BCC .under_10
#_0CD81F: SEC
#_0CD820: SBC.w #$000A
#_0CD823: INY
#_0CD824: BRA .next_10


.under_10
#_0CD826: STA.b $04
#_0CD828: STY.b $06

;---------------------------------------------------------------------------------------------------

.done_number
#_0CD82A: LDX.w #$0004

#_0CD82D: LDA.b $06
#_0CD82F: BNE .skip_digit
#_0CD831: DEX
#_0CD832: DEX
#_0CD833: LDA.b $04
#_0CD835: BNE .skip_digit
#_0CD837: DEX
#_0CD838: DEX

.skip_digit
#_0CD839: SEP #$30
#_0CD83B: LDA.b $00
#_0CD83D: LSR A
#_0CD83E: TAY
#_0CD83F: LDA.w .buffer_offset,Y
#_0CD842: TAY

;---------------------------------------------------------------------------------------------------

.next_digit
#_0CD843: PHX

#_0CD844: LDA.b $02,X
#_0CD846: TAX

#_0CD847: LDA.w .digit_char,X
#_0CD84A: STA.w $0802,Y

#_0CD84D: PHY

#_0CD84E: LDA.b $00
#_0CD850: LSR A
#_0CD851: TAY

#_0CD852: LDA.b ($08),Y
#_0CD854: CLC
#_0CD855: ADC.b #$10

#_0CD857: PLY
#_0CD858: STA.w $0801,Y

#_0CD85B: PLA
#_0CD85C: PHA

#_0CD85D: LSR A
#_0CD85E: TAX

#_0CD85F: LDA.b ($0A)
#_0CD861: CLC
#_0CD862: ADC.w .digit_position_x,X
#_0CD865: STA.w $0800,Y

#_0CD868: LDA.b #$3C
#_0CD86A: STA.w $0803,Y

#_0CD86D: PHY

#_0CD86E: TYA
#_0CD86F: LSR A
#_0CD870: LSR A
#_0CD871: TAY

#_0CD872: LDA.b #$00
#_0CD874: STA.w $0A20,Y

#_0CD877: PLY
#_0CD878: INY
#_0CD879: INY
#_0CD87A: INY
#_0CD87B: INY

#_0CD87C: PLX
#_0CD87D: DEX
#_0CD87E: DEX
#_0CD87F: BPL .next_digit

;---------------------------------------------------------------------------------------------------

#_0CD881: REP #$30

.exit
#_0CD883: PLA
#_0CD884: STA.b $04

#_0CD886: PLA
#_0CD887: STA.b $02

#_0CD889: RTS

;===================================================================================================

Module04_NameFile:
#_0CD88A: LDA.b $11
#_0CD88C: JSL JumpTableLong
#_0CD890: dl NameFile_EraseSave
#_0CD893: dl NameFile_FillBackground
#_0CD896: dl NameFile_MakeScreenVisible
#_0CD899: dl NameFile_DoTheNaming

;===================================================================================================

NameFile_EraseSave:
#_0CD89C: JSL FileSelect_EraseTriforce

#_0CD8A0: LDA.b #$01
#_0CD8A2: STA.w $0128

#_0CD8A5: STZ.w $0B10
#_0CD8A8: STZ.w $0B12
#_0CD8AB: STZ.w $0B15

#_0CD8AE: STZ.w $00CA
#_0CD8B1: STZ.w $00CC

#_0CD8B4: LDA.b #$83
#_0CD8B6: STA.w $0B11

#_0CD8B9: REP #$30

#_0CD8BB: LDA.w #$01F0
#_0CD8BE: STA.w $0630

#_0CD8C1: STZ.b $E4

#_0CD8C3: LDA.b $C8
#_0CD8C5: ASL A
#_0CD8C6: TAX

#_0CD8C7: LDA.l SaveFileCopyOffsets,X
#_0CD8CB: STA.w $0200

#_0CD8CE: TAX

;---------------------------------------------------------------------------------------------------

#_0CD8CF: LDY.w #$0000
#_0CD8D2: TYA

.next_clear
#_0CD8D3: STA.l $700000,X
#_0CD8D7: STA.l $700100,X
#_0CD8DB: STA.l $700200,X
#_0CD8DF: STA.l $700300,X
#_0CD8E3: STA.l $700400,X

#_0CD8E7: INX
#_0CD8E8: INX

#_0CD8E9: INY
#_0CD8EA: INY
#_0CD8EB: CPY.w #$0100
#_0CD8EE: BNE .next_clear

;---------------------------------------------------------------------------------------------------

#_0CD8F0: LDX.w $0200

#_0CD8F3: LDA.w #$00A9
#_0CD8F6: STA.l $7003D9,X
#_0CD8FA: STA.l $7003DB,X
#_0CD8FE: STA.l $7003DD,X
#_0CD902: STA.l $7003DF,X
#_0CD906: STA.l $7003E1,X
#_0CD90A: STA.l $7003E3,X

#_0CD90E: SEP #$30

#_0CD910: RTL

;===================================================================================================

NameFile_FillBackground:
#_0CD911: PHB
#_0CD912: PHK
#_0CD913: PLB

#_0CD914: REP #$30

#_0CD916: JSR FileSelect_UploadLinoleum

#_0CD919: LDA.w #$FFFF
#_0CD91C: STA.w $1006,X

#_0CD91F: SEP #$30

#_0CD921: PLB

#_0CD922: LDA.b #$01
#_0CD924: JSR Intro_SetStripesAndAdvance

#_0CD927: RTL

;===================================================================================================

NameFile_MakeScreenVisible:
#_0CD928: LDA.b #$05
#_0CD92A: JSR Intro_SetStripesAndAdvance

#_0CD92D: LDA.b #$0F
#_0CD92F: STA.b $13

#_0CD931: STZ.w $0710

#_0CD934: RTL

;===================================================================================================

NameFile_CharacterLayout:
#_0CD935: db $06, $07, $5F, $09, $59, $59, $1A, $1B
#_0CD93D: db $1C, $1D, $1E, $1F, $20, $21, $60, $23
#_0CD945: db $59, $59, $76, $77, $78, $79, $7A, $59
#_0CD94D: db $59, $59, $00, $01, $02, $03, $04, $05
#_0CD955: db $10, $11, $12, $13, $59, $59, $24, $5F
#_0CD95D: db $26, $27, $28, $29, $2A, $2B, $2C, $2D
#_0CD965: db $59, $59, $7B, $7C, $7D, $7E, $7F, $59
#_0CD96D: db $59, $59, $0A, $0B, $0C, $0D, $0E, $0F
#_0CD975: db $40, $41, $42, $59, $59, $59, $2E, $2F
#_0CD97D: db $30, $31, $32, $33, $40, $41, $42, $59
#_0CD985: db $59, $59, $61, $3F, $45, $46, $59, $59
#_0CD98D: db $59, $59, $14, $15, $16, $17, $18, $19
#_0CD995: db $44, $59, $6F, $6F, $59, $59, $59, $59
#_0CD99D: db $59, $59, $59, $5A, $44, $59, $6F, $6F
#_0CD9A5: db $59, $59, $5A, $44, $59, $6F, $6F, $59
#_0CD9AD: db $59, $59, $59, $59, $59, $59, $59, $5A

;===================================================================================================

NameFile_CursorPositionX:
#_0CD9B5: dw $01F0, $0000, $0010, $0020
#_0CD9BD: dw $0030, $0040, $0050, $0060
#_0CD9C5: dw $0070, $0080, $0090, $00A0
#_0CD9CD: dw $00B0, $00C0, $00D0, $00E0
#_0CD9D5: dw $00F0, $0100, $0110, $0120
#_0CD9DD: dw $0130, $0140, $0150, $0160
#_0CD9E5: dw $0170, $0180, $0190, $01A0
#_0CD9ED: dw $01B0, $01C0, $01D0, $01E0

NameFile_CursorIndexMovementX:
#_0CD9F5: dw $0001 ; Right
#_0CD9F7: dw $00FF ; Left

NameFile_CursorIndexBoundaryX:
#_0CD9F9: dw $0020 ; Right
#_0CD9FB: dw $00FF ; Left

NameFile_CursorIndexWrapX:
#_0CD9FD: dw $0000 ; Right
#_0CD9FF: dw $001F ; Left

;===================================================================================================

NameFile_CursorPositionY:
#_0CDA01: db $83, $93, $A3, $B3

NameFile_CursorIndexMovementY:
#_0CDA05: db $01, $FF

NameFile_CursorIndexBoundaryY:
#_0CDA07: db $04, $FF

NameFile_CursorStickY:
#_0CDA09: db $00, $03

NameFile_YtoXIndexOffset:
#_0CDA0B: dw $0000, $0020, $0040, $0060

;===================================================================================================

NameFile_HeartXPosition:
#_0CDA13: db $1F, $2F, $3F, $4F, $5F, $6F

NameFile_CursorMovement:
#_0CDA19: dw  -1,   1,  -1,   1
#_0CDA21: dw  -1,   1,  -1,   1
#_0CDA29: dw  -1,   1,  -1,   1
#_0CDA31: dw  -1,   1,  -1,   1
#_0CDA39: dw  -2,   2,  -2,   2
#_0CDA41: dw  -2,   2,  -2,   2
#_0CDA49: dw  -4,   4

;===================================================================================================

NameFile_DoTheNaming:
.check_x_scroll
#_0CDA4D: LDY.w $0B13
#_0CDA50: BEQ .not_busy_scrolling_x

#_0CDA52: TYA
#_0CDA53: CMP.b #$31
#_0CDA55: BEQ .hit_target_scroll_x

#_0CDA57: CLC
#_0CDA58: ADC.b #$04
#_0CDA5A: STA.w $0B13

.hit_target_scroll_x
#_0CDA5D: LDA.w $0B10
#_0CDA60: ASL A
#_0CDA61: TAX

#_0CDA62: REP #$20

#_0CDA64: DEY

#_0CDA65: LDA.w $0630
#_0CDA68: CMP.l NameFile_CursorPositionX,X
#_0CDA6C: BNE .not_at_valid_x_position

#_0CDA6E: SEP #$20

#_0CDA70: LDA.b #$30
#_0CDA72: STA.w $0B13

#_0CDA75: LDA.b $F0
#_0CDA77: AND.b #$03
#_0CDA79: BNE .had_lr_input

#_0CDA7B: STZ.w $0B13

.had_lr_input
#_0CDA7E: JSR NameFile_CheckForScrollInputX
#_0CDA81: BRA .check_x_scroll

;---------------------------------------------------------------------------------------------------

.not_at_valid_x_position
#_0CDA83: REP #$20

#_0CDA85: LDX.w $0B16
#_0CDA88: BNE .last_move_left

#_0CDA8A: INY
#_0CDA8B: INY

.last_move_left
#_0CDA8C: LDA.w $0630

#_0CDA8F: TYX

#_0CDA90: CLC
#_0CDA91: ADC.l NameFile_CursorMovement,X
#_0CDA95: AND.w #$01FF
#_0CDA98: STA.w $0630

#_0CDA9B: SEP #$20

#_0CDA9D: BRA .check_y_scroll

;---------------------------------------------------------------------------------------------------

.not_busy_scrolling_x
#_0CDA9F: JSR NameFile_CheckForScrollInputX

.check_y_scroll
#_0CDAA2: LDA.w $0B14
#_0CDAA5: BEQ .not_busy_scrolling_y

#_0CDAA7: LDX.w $0B15
#_0CDAAA: LDY.b #$02

#_0CDAAC: LDA.w $0B11
#_0CDAAF: CMP.l NameFile_CursorPositionY,X
#_0CDAB3: BNE .not_at_valid_y_position

#_0CDAB5: STZ.w $0B14

#_0CDAB8: JSR NameFile_CheckForScrollInputY
#_0CDABB: BRA .check_y_scroll

.not_at_valid_y_position
#_0CDABD: BMI .add_y_scroll

#_0CDABF: LDY.b #$FE

.add_y_scroll
#_0CDAC1: TYA
#_0CDAC2: CLC
#_0CDAC3: ADC.w $0B11
#_0CDAC6: STA.w $0B11
#_0CDAC9: BRA .done_y

.not_busy_scrolling_y
#_0CDACB: JSR NameFile_CheckForScrollInputY

;---------------------------------------------------------------------------------------------------

.done_y
#_0CDACE: LDX.b #$00
#_0CDAD0: TXY
#_0CDAD1: LDA.b #$18
#_0CDAD3: STA.b $00

.next_horizontal_bar_object
#_0CDAD5: LDA.b $00
#_0CDAD7: STA.w $0800,Y

#_0CDADA: CLC
#_0CDADB: ADC.b #$08
#_0CDADD: STA.b $00

#_0CDADF: LDA.w $0B11
#_0CDAE2: STA.w $0801,Y

#_0CDAE5: LDA.b #$2E
#_0CDAE7: STA.w $0802,Y

#_0CDAEA: LDA.b #$3C
#_0CDAEC: STA.w $0803,Y

#_0CDAEF: STZ.w $0A20,X

#_0CDAF2: INY
#_0CDAF3: INY
#_0CDAF4: INY
#_0CDAF5: INY

#_0CDAF6: INX
#_0CDAF7: CPX.b #$1A
#_0CDAF9: BNE .next_horizontal_bar_object

;---------------------------------------------------------------------------------------------------

#_0CDAFB: PHX

#_0CDAFC: LDX.w $0B12

#_0CDAFF: LDA.l NameFile_HeartXPosition,X
#_0CDB03: STA.w $0800,Y

#_0CDB06: LDA.b #$58
#_0CDB08: STA.w $0801,Y

#_0CDB0B: PLX

#_0CDB0C: LDA.b #$29
#_0CDB0E: STA.w $0802,Y

#_0CDB11: LDA.b #$0C
#_0CDB13: STA.w $0803,Y

#_0CDB16: STZ.w $0A20,X

#_0CDB19: LDA.w $0B13
#_0CDB1C: ORA.w $0B14
#_0CDB1F: BNE .busy_scrolling

#_0CDB21: LDA.b $F4
#_0CDB23: AND.b #$10
#_0CDB25: BEQ .no_start_press

#_0CDB27: JMP.w .confirm_name

.no_start_press
#_0CDB2A: LDA.b $F4
#_0CDB2C: AND.b #$C0
#_0CDB2E: BNE .select_item

#_0CDB30: LDA.b $F6
#_0CDB32: AND.b #$C0
#_0CDB34: BNE .select_item

.busy_scrolling
#_0CDB36: JMP.w .exit

.select_item
#_0CDB39: LDA.b #$2B ; SFX2.2B
#_0CDB3B: STA.w $012E

#_0CDB3E: REP #$30

#_0CDB40: LDA.w $0B15
#_0CDB43: AND.w #$00FF
#_0CDB46: ASL A
#_0CDB47: TAX

#_0CDB48: LDA.l NameFile_YtoXIndexOffset,X
#_0CDB4C: CLC
#_0CDB4D: ADC.w $0B10
#_0CDB50: AND.w #$00FF
#_0CDB53: TAX

#_0CDB54: SEP #$20

#_0CDB56: LDA.l NameFile_CharacterLayout,X
#_0CDB5A: CMP.b #$5A
#_0CDB5C: BEQ .back_arrow

#_0CDB5E: CMP.b #$44
#_0CDB60: BEQ .forward_arrow

#_0CDB62: CMP.b #$6F
#_0CDB64: BEQ .confirm_name

#_0CDB66: STA.b $00
#_0CDB68: STZ.b $01

#_0CDB6A: BRA .written_character

;---------------------------------------------------------------------------------------------------

.back_arrow
#_0CDB6C: LDA.w $0B12
#_0CDB6F: BNE .nonzero

#_0CDB71: LDA.b #$05
#_0CDB73: STA.w $0B12

#_0CDB76: BRA .exit

.nonzero
#_0CDB78: DEC.w $0B12
#_0CDB7B: BRA .exit


.forward_arrow
#_0CDB7D: INC.w $0B12

#_0CDB80: LDA.w $0B12
#_0CDB83: CMP.b #$06
#_0CDB85: BNE .nowrap

#_0CDB87: STZ.w $0B12

.nowrap
#_0CDB8A: BRA .exit

;---------------------------------------------------------------------------------------------------

.written_character
#_0CDB8C: REP #$30

#_0CDB8E: AND.w #$000F
#_0CDB91: STA.b $02

#_0CDB93: LDA.w $0B12
#_0CDB96: AND.w #$00FF
#_0CDB99: ASL A
#_0CDB9A: TAY

#_0CDB9B: CLC
#_0CDB9C: ADC.w $0200
#_0CDB9F: TAX

#_0CDBA0: LDA.b $00
#_0CDBA2: AND.w #$FFF0
#_0CDBA5: ASL A
#_0CDBA6: ORA.b $02
#_0CDBA8: STA.l $7003D9,X

#_0CDBAC: JSR NameFile_DrawSelectedCharacter

#_0CDBAF: BRA .forward_arrow

;---------------------------------------------------------------------------------------------------

.confirm_name
#_0CDBB1: REP #$30

#_0CDBB3: STZ.b $02

.write_name_to_save
#_0CDBB5: LDA.w $0200
#_0CDBB8: CLC
#_0CDBB9: ADC.b $02
#_0CDBBB: TAX

#_0CDBBC: LDA.l $7003D9,X
#_0CDBC0: CMP.w #$00A9
#_0CDBC3: BNE InitializeSaveFile

#_0CDBC5: LDA.b $02
#_0CDBC7: CMP.w #$000A
#_0CDBCA: BEQ .finished

#_0CDBCC: INC A
#_0CDBCD: INC A
#_0CDBCE: STA.b $02
#_0CDBD0: BRA .write_name_to_save


.finished
#_0CDBD2: SEP #$20

#_0CDBD4: LDA.b #$3C ; SFX2.3C
#_0CDBD6: STA.w $012E

.exit
#_0CDBD9: SEP #$30

#_0CDBDB: RTL

;===================================================================================================

InitializeSaveFile:
#_0CDBDC: SEP #$30

#_0CDBDE: PHB

#_0CDBDF: LDA.b #DefaultSaveFileItems>>16
#_0CDBE1: PHA
#_0CDBE2: PLB

#_0CDBE3: REP #$30

#_0CDBE5: LDA.b $C8
#_0CDBE7: ASL A
#_0CDBE8: INC A
#_0CDBE9: INC A
#_0CDBEA: STA.l $701FFE

#_0CDBEE: TAX

#_0CDBEF: LDA.l SaveFileOffsets,X
#_0CDBF3: STA.b $00

#_0CDBF5: TAX

;---------------------------------------------------------------------------------------------------

#_0CDBF6: LDA.w #$55AA
#_0CDBF9: STA.l $7003E5,X

#_0CDBFD: LDA.w #$F000
#_0CDC00: STA.l $70020C,X
#_0CDC04: STA.l $70020E,X

#_0CDC08: LDA.w #$FFFF
#_0CDC0B: STA.l $700405,X

#_0CDC0F: LDA.w #$001D
#_0CDC12: STA.b $02

;---------------------------------------------------------------------------------------------------

#_0CDC14: LDY.w #$003C

#_0CDC17: CPX.w #$0000
#_0CDC1A: BNE .copy_next

#_0CDC1C: LDA.l Player2JoypadReturn
#_0CDC20: AND.w #$00FF
#_0CDC23: CMP.w #$0060 ; RTS
#_0CDC26: BEQ .copy_next

#_0CDC28: LDA.l $7003D9
#_0CDC2C: CMP.w #$0001
#_0CDC2F: BNE .copy_next

#_0CDC31: LDA.w #$00F0
#_0CDC34: STA.l $700212,X

#_0CDC38: LDA.w #$1502
#_0CDC3B: STA.l $7003C5,X

#_0CDC3F: LDA.w #$0100
#_0CDC42: STA.l $7003C7,X

#_0CDC46: LDY.w #$0000

;---------------------------------------------------------------------------------------------------

.copy_next
#_0CDC49: LDA.w DefaultSaveFileItems,Y
#_0CDC4C: STA.l $700340,X

#_0CDC50: INX
#_0CDC51: INX

#_0CDC52: INY
#_0CDC53: INY

#_0CDC54: DEC.b $02
#_0CDC56: BPL .copy_next

;---------------------------------------------------------------------------------------------------

#_0CDC58: LDX.b $00

#_0CDC5A: LDY.w #$0000
#_0CDC5D: TYA

.build_checksum
#_0CDC5E: CLC
#_0CDC5F: ADC.l $700000,X

#_0CDC63: INX
#_0CDC64: INX

#_0CDC65: INY
#_0CDC66: CPY.w #$027F
#_0CDC69: BNE .build_checksum

#_0CDC6B: STA.b $02

#_0CDC6D: LDX.b $00

#_0CDC6F: LDA.w #$5A5A
#_0CDC72: SEC
#_0CDC73: SBC.b $02
#_0CDC75: STA.l $7004FE,X

;---------------------------------------------------------------------------------------------------

#_0CDC79: SEP #$30

#_0CDC7B: PLB

#_0CDC7C: JSR ReturnToFileSelect

#_0CDC7F: LDA.b #$FF
#_0CDC81: STA.w $0128

#_0CDC84: LDA.b #$2C ; SFX2.2C
#_0CDC86: STA.w $012E

#_0CDC89: SEP #$30

#_0CDC8B: RTL

;===================================================================================================

NameFile_CheckForScrollInputX:
#_0CDC8C: SEP #$30

#_0CDC8E: LDA.b $F0
#_0CDC90: AND.b #$03
#_0CDC92: BEQ .exit

#_0CDC94: INC.w $0B13

#_0CDC97: DEC A
#_0CDC98: STA.w $0B16

#_0CDC9B: REP #$30

#_0CDC9D: AND.w #$00FF
#_0CDCA0: ASL A
#_0CDCA1: TAX

#_0CDCA2: LDA.w $0B10
#_0CDCA5: AND.w #$00FF
#_0CDCA8: CLC
#_0CDCA9: ADC.l NameFile_CursorIndexMovementX,X
#_0CDCAD: CMP.l NameFile_CursorIndexBoundaryX,X
#_0CDCB1: BNE .no_wrap

#_0CDCB3: LDA.l NameFile_CursorIndexWrapX,X

.no_wrap
#_0CDCB7: SEP #$30

#_0CDCB9: STA.w $0B10

.exit
#_0CDCBC: SEP #$30

#_0CDCBE: RTS

;===================================================================================================

NameFile_CheckForScrollInputY:
#_0CDCBF: LDA.b $F0
#_0CDCC1: AND.b #$0C
#_0CDCC3: BEQ .no_input

#_0CDCC5: STA.b $02

#_0CDCC7: ASL A
#_0CDCC8: ORA.w $0B15
#_0CDCCB: CMP.b #$10
#_0CDCCD: BEQ .set_input

#_0CDCCF: LDA.b $02
#_0CDCD1: ASL A
#_0CDCD2: ASL A
#_0CDCD3: ORA.w $0B15

#_0CDCD6: LDX.w $0B10

#_0CDCD9: CMP.b #$13
#_0CDCDB: BEQ .set_input

#_0CDCDD: LDA.b $02
#_0CDCDF: LSR A
#_0CDCE0: LSR A

.next
#_0CDCE1: TAX

#_0CDCE2: LDA.w $0B15
#_0CDCE5: CLC
#_0CDCE6: ADC.l NameFile_CursorIndexMovementY-1,X
#_0CDCEA: CMP.l NameFile_CursorIndexBoundaryY-1,X
#_0CDCEE: BNE .no_stick

#_0CDCF0: LDA.l NameFile_CursorStickY-1,X

.no_stick
#_0CDCF4: STA.w $0B15
#_0CDCF7: BRA .not_this_guy

#_0CDCF9: STX.b $01

#_0CDCFB: LDX.w $0B15

#_0CDCFE: LDA.l NameFile_YtoXIndexOffset,X
#_0CDD02: CLC
#_0CDD03: ADC.w $0B10
#_0CDD06: AND.b #$FF
#_0CDD08: TAX

#_0CDD09: LDA.l NameFile_CharacterLayout,X
#_0CDD0D: CMP.b #$59
#_0CDD0F: BNE .not_this_guy

#_0CDD11: LDA.b $01
#_0CDD13: BRA .next

;---------------------------------------------------------------------------------------------------

.not_this_guy
#_0CDD15: INC.w $0B14
#_0CDD18: BRA .set_input


.no_input
#_0CDD1A: STZ.w $00CA

.set_input
#_0CDD1D: LDA.w $0002
#_0CDD20: STA.w $00CB

#_0CDD23: RTS

;===================================================================================================

pool NameFile_DrawSelectedCharacter

.vram_position_low
#_0CDD24: dw $0084
#_0CDD26: dw $0086
#_0CDD28: dw $0088
#_0CDD2A: dw $008A
#_0CDD2C: dw $008C
#_0CDD2E: dw $008E

pool off

;---------------------------------------------------------------------------------------------------

NameFile_DrawSelectedCharacter:
#_0CDD30: PHB
#_0CDD31: PHK
#_0CDD32: PLB

#_0CDD33: LDA.w #$6100
#_0CDD36: ORA.w .vram_position_low,Y
#_0CDD39: XBA
#_0CDD3A: STA.w $1002

#_0CDD3D: XBA
#_0CDD3E: CLC
#_0CDD3F: ADC.w #$0020

#_0CDD42: XBA
#_0CDD43: STA.w $1008

#_0CDD46: LDA.w #$0100
#_0CDD49: STA.w $1004
#_0CDD4C: STA.w $100A

#_0CDD4F: LDA.l $7003D9,X
#_0CDD53: ORA.w #$1800
#_0CDD56: STA.w $1006

#_0CDD59: CLC
#_0CDD5A: ADC.w #$0010
#_0CDD5D: STA.w $100C

;---------------------------------------------------------------------------------------------------

#_0CDD60: SEP #$30

#_0CDD62: LDA.b #$FF
#_0CDD64: STA.w $100E

#_0CDD67: LDA.b #$01
#_0CDD69: STA.b $14

#_0CDD6B: PLB

#_0CDD6C: RTS

;===================================================================================================

IntroLogoTilemap:
#_0CDD6D: dw $0B11, $1900 ; VRAM $2216 | 26 bytes | Horizontal
#_0CDD71: dw $1D68, $1D69, $1D6A, $1D6B, $1D5D, $1D5E, $1C30, $1C31
#_0CDD81: dw $1C32, $1C33, $1C34, $1C35, $1C36

#_0CDD8B: dw $2B11, $1900 ; VRAM $2256 | 26 bytes | Horizontal
#_0CDD8F: dw $1D78, $1D79, $1D7A, $1D7B, $1C37, $1C38, $1C39, $1C3A
#_0CDD9F: dw $1C3B, $1C3C, $1C3D, $1C3E, $1C3F

#_0CDDA9: dw $4611, $2500 ; VRAM $228C | 38 bytes | Horizontal
#_0CDDAD: dw $18F7, $1900, $1901, $1902, $1903, $1904, $1905, $1905
#_0CDDBD: dw $1906, $1905, $1907, $5907, $1905, $1908, $1909, $190A
#_0CDDCD: dw $190B, $190C, $1CF0

#_0CDDD3: dw $6611, $2300 ; VRAM $22CC | 36 bytes | Horizontal
#_0CDDD7: dw $190D, $190E, $18F9, $390F, $1910, $1911, $1912, $1913
#_0CDDE7: dw $1914, $1915, $18FA, $58FA, $1916, $1917, $1918, $18FB
#_0CDDF7: dw $1919, $191A

#_0CDDFB: dw $8611, $2300 ; VRAM $230C | 36 bytes | Horizontal
#_0CDDFF: dw $18F8, $195F, $391B, $391C, $191D, $191E, $191F, $1920
#_0CDE0F: dw $1921, $1922, $195F, $195F, $1923, $1924, $1925, $1926
#_0CDE1F: dw $1927, $1928

#_0CDE23: dw $A811, $1F00 ; VRAM $2350 | 32 bytes | Horizontal
#_0CDE27: dw $3929, $392A, $192B, $191E, $192C, $192D, $1938, $1922
#_0CDE37: dw $195F, $195F, $1923, $18FC, $192E, $192F, $1930, $1931

#_0CDE47: dw $C711, $2300 ; VRAM $238E | 36 bytes | Horizontal
#_0CDE4B: dw $1932, $3933, $3934, $195F, $191E, $191F, $1936, $1937
#_0CDE5B: dw $1922, $195F, $1939, $1923, $9924, $193A, $193B, $193C
#_0CDE6B: dw $193D, $193E

#_0CDE6F: dw $E711, $2300 ; VRAM $23CE | 36 bytes | Horizontal
#_0CDE73: dw $193F, $3940, $3941, $195F, $1942, $1943, $1944, $1945
#_0CDE83: dw $1946, $1947, $1948, $1949, $194A, $194B, $194C, $194D
#_0CDE93: dw $194E, $194F

#_0CDE97: dw $0612, $2500 ; VRAM $240C | 38 bytes | Horizontal
#_0CDE9B: dw $18FD, $1950, $3951, $98F9, $1952, $1953, $1954, $1954
#_0CDEAB: dw $1955, $1954, $1954, $1956, $1954, $1957, $1958, $1959
#_0CDEBB: dw $195A, $195B, $195C

#_0CDEC1: dw $2612, $2B00 ; VRAM $244C | 44 bytes | Horizontal
#_0CDEC5: dw $18F1, $18F2, $18F3, $18F4, $18F5, $18F6, $1D60, $1D61
#_0CDED5: dw $1D62, $1D63, $1D64, $1D65, $1D66, $1D67, $1D68, $1D69
#_0CDEE5: dw $1D6A, $1D6B, $1D6C, $1D6D, $1D6E, $1D6F

#_0CDEF1: dw $4C12, $1F00 ; VRAM $2498 | 32 bytes | Horizontal
#_0CDEF5: dw $1D70, $1D71, $1D72, $1D73, $1D74, $1D75, $1D76, $1D77
#_0CDF05: dw $1D78, $1D79, $1D7A, $1D7B, $1D7C, $1D7D, $1D7E, $1D7F

#_0CDF15: dw $8000, $BE41 ; VRAM $0100 | 448 bytes | Fixed horizontal
#_0CDF19: dw $10BD

#_0CDF1B: dw $6501, $2A40 ; VRAM $02CA | 44 bytes | Fixed horizontal
#_0CDF1F: dw $10BE

#_0CDF21: dw $8801, $2440 ; VRAM $0310 | 38 bytes | Fixed horizontal
#_0CDF25: dw $10BF

#_0CDF27: dw $2802, $2440 ; VRAM $0450 | 38 bytes | Fixed horizontal
#_0CDF2B: dw $90BF

#_0CDF2D: dw $4502, $2A40 ; VRAM $048A | 44 bytes | Fixed horizontal
#_0CDF31: dw $90BE

#_0CDF33: dw $6A02, $1A40 ; VRAM $04D4 | 28 bytes | Fixed horizontal
#_0CDF37: dw $90BD

#_0CDF39: dw $4001, $1300 ; VRAM $0280 | 20 bytes | Horizontal
#_0CDF3D: dw $11B3, $11B4, $51B4, $51B3, $10BD, $10BD, $11B3, $11B4
#_0CDF4D: dw $51B4, $51B3

#_0CDF51: dw $5801, $0500 ; VRAM $02B0 | 6 bytes | Horizontal
#_0CDF55: dw $11B3, $11B4, $51B4

#_0CDF5B: dw $6001, $0900 ; VRAM $02C0 | 10 bytes | Horizontal
#_0CDF5F: dw $10B0, $10B1, $10B2, $10B3, $10B4

#_0CDF69: dw $8001, $0F00 ; VRAM $0300 | 16 bytes | Horizontal
#_0CDF6D: dw $10B5, $10B6, $10B7, $10B8, $10B9, $10BA, $10BB, $10BC

#_0CDF7D: dw $A001, $3500 ; VRAM $0340 | 54 bytes | Horizontal
#_0CDF81: dw $09C9, $09CA, $09C9, $09CA, $09C9, $09CA, $09C9, $09CA
#_0CDF91: dw $09FF, $09E7, $09E8, $09E7, $09E8, $09E7, $09E8, $09E7
#_0CDFA1: dw $09E8, $09E7, $09E8, $09E7, $09E8, $09E7, $09E8, $09E7
#_0CDFB1: dw $09E8, $09E7, $09E8

#_0CDFB7: dw $C001, $3500 ; VRAM $0380 | 54 bytes | Horizontal
#_0CDFBB: dw $09D9, $09DA, $09D9, $09DA, $09D9, $09DA, $09D9, $09DA
#_0CDFCB: dw $09D9, $09DA, $09D9, $09DA, $09D9, $09DA, $09D9, $09DA
#_0CDFDB: dw $09D9, $09DA, $09D9, $09DA, $09D9, $09DA, $09D9, $09DA
#_0CDFEB: dw $09D9, $09DA, $09D9

#_0CDFF1: dw $E001, $3500 ; VRAM $03C0 | 54 bytes | Horizontal
#_0CDFF5: dw $0DB1, $0DB2, $0DB1, $0DB2, $0DB1, $0DB2, $0DB1, $0DB2
#_0CE005: dw $0DB1, $0DB2, $0DB1, $0DB2, $0DB1, $0DB2, $0DB1, $0DB2
#_0CE015: dw $0DB1, $0DB2, $0DB1, $0DB2, $0DB1, $0DB2, $0DB1, $0DB2
#_0CE025: dw $0DB1, $0DB2, $0DB1

#_0CE02B: dw $0002, $3500 ; VRAM $0400 | 54 bytes | Horizontal
#_0CE02F: dw $8DC9, $8DCA, $8DC9, $8DCA, $8DC9, $8DCA, $8DC9, $8DCA
#_0CE03F: dw $8DFF, $8DE7, $8DE8, $8DE7, $8DE8, $8DE7, $8DE8, $8DE7
#_0CE04F: dw $8DE8, $8DE7, $8DE8, $8DE7, $8DE8, $8DE7, $8DE8, $8DE7
#_0CE05F: dw $8DE8, $8DE7, $8DE8

#_0CE065: dw $2002, $0F00 ; VRAM $0440 | 16 bytes | Horizontal
#_0CE069: dw $90B5, $90B6, $90B7, $90B8, $90B9, $90BA, $90BB, $90BC

#_0CE079: dw $4002, $0900 ; VRAM $0480 | 10 bytes | Horizontal
#_0CE07D: dw $90B0, $90B1, $90B2, $90B3, $90B4

#_0CE087: dw $6002, $1300 ; VRAM $04C0 | 20 bytes | Horizontal
#_0CE08B: dw $91B3, $91B4, $D1B4, $D1B3, $90BD, $90BD, $91B3, $91B4
#_0CE09B: dw $D1B4, $D1B3

#_0CE09F: dw $7802, $0500 ; VRAM $04F0 | 6 bytes | Horizontal
#_0CE0A3: dw $91B3, $91B4, $D1B4

#_0CE0A9: dw $8002, $3500 ; VRAM $0500 | 54 bytes | Horizontal
#_0CE0AD: dw $11F0, $11F1, $11F0, $11F1, $11F0, $11F1, $11F0, $11F1
#_0CE0BD: dw $11F0, $11F1, $11F0, $11F1, $11F0, $11F1, $11F0, $11F1
#_0CE0CD: dw $11F0, $11F1, $11F0, $11F1, $11F0, $11F1, $11F0, $11F1
#_0CE0DD: dw $11F0, $11F1, $11F0

#_0CE0E3: dw $A002, $3500 ; VRAM $0540 | 54 bytes | Horizontal
#_0CE0E7: dw $11F2, $11F3, $11F2, $11F3, $11F2, $11F3, $11F2, $11F3
#_0CE0F7: dw $11F2, $11F3, $11F2, $11F3, $11F2, $11F3, $11F2, $11F3
#_0CE107: dw $11F2, $11F3, $11F2, $11F3, $11F2, $11F3, $11F2, $11F3
#_0CE117: dw $11F2, $11F3, $11F2

#_0CE11D: dw $3B01, $1980 ; VRAM $0276 | 26 bytes | Vertical
#_0CE121: dw $15F6, $15F4, $15CB, $15DB, $15DB, $15DB, $15DB, $15DB
#_0CE131: dw $15EB, $15FB, $15FD, $15FD, $15FD

#_0CE13B: dw $3C01, $1980 ; VRAM $0278 | 26 bytes | Vertical
#_0CE13F: dw $15F7, $15F5, $15DC, $15DC, $15DC, $15DC, $15DC, $15DC
#_0CE14F: dw $15B0, $15FC, $15FE, $15FE, $15FE

#_0CE159: dw $3D01, $1980 ; VRAM $027A | 26 bytes | Vertical
#_0CE15D: dw $15F8, $15CD, $15DD, $15DD, $15DD, $15DD, $15DD, $15DD
#_0CE16D: dw $15CC, $15ED, $14BD, $14BD, $15FE

#_0CE177: dw $9E00, $2380 ; VRAM $013C | 36 bytes | Vertical
#_0CE17B: dw $15F6, $15F4, $15CB, $15DB, $15E9, $15F9, $15CE, $15DE
#_0CE18B: dw $15DE, $15DE, $15DE, $15DE, $15DE, $15CC, $15EE, $14BD
#_0CE19B: dw $14BD, $14BD

#_0CE19F: dw $9F00, $2380 ; VRAM $013E | 36 bytes | Vertical
#_0CE1A3: dw $15F7, $15F5, $15DC, $15DC, $15EA, $15FA, $15CF, $15DF
#_0CE1B3: dw $15DF, $15DF, $15DF, $15DF, $15DF, $15CC, $15EF, $14BD
#_0CE1C3: dw $14BD, $14BD

#_0CE1C7: db $FF ; end of stripes data

;===================================================================================================

FancyBackgroundTileMap:
#_0CE1C8: dw $4210, $2700 ; VRAM $2084 | 40 bytes | Horizontal
#_0CE1CC: dw $3589, $358A, $358B, $358C, $358B, $358C, $358B, $358C
#_0CE1DC: dw $358B, $358C, $358B, $358C, $358B, $358C, $358B, $358C
#_0CE1EC: dw $358B, $358C, $758A, $7589

#_0CE1F4: dw $6210, $0300 ; VRAM $20C4 | 4 bytes | Horizontal
#_0CE1F8: dw $3599, $359A

#_0CE1FC: dw $6410, $1E40 ; VRAM $20C8 | 32 bytes | Fixed horizontal
#_0CE200: dw $347F

#_0CE202: dw $7410, $0300 ; VRAM $20E8 | 4 bytes | Horizontal
#_0CE206: dw $759A, $7599

#_0CE20A: dw $8210, $0300 ; VRAM $2104 | 4 bytes | Horizontal
#_0CE20E: dw $35A9, $35AA

#_0CE212: dw $8410, $1E40 ; VRAM $2108 | 32 bytes | Fixed horizontal
#_0CE216: dw $347F

#_0CE218: dw $9410, $0300 ; VRAM $2128 | 4 bytes | Horizontal
#_0CE21C: dw $75AA, $75A9

#_0CE220: dw $A210, $2700 ; VRAM $2144 | 40 bytes | Horizontal
#_0CE224: dw $359D, $35AD, $359B, $359C, $359B, $359C, $359B, $359C
#_0CE234: dw $359B, $359C, $359B, $359C, $359B, $359C, $359B, $359C
#_0CE244: dw $359B, $359C, $75AD, $759D

#_0CE24C: dw $C210, $2700 ; VRAM $2184 | 40 bytes | Horizontal
#_0CE250: dw $35AB, $35AC, $35AB, $35AC, $35AB, $35AC, $35AB, $35AC
#_0CE260: dw $35AB, $35AC, $35AB, $35AC, $35AB, $35AC, $35AB, $35AC
#_0CE270: dw $35AB, $35AC, $75AB, $75AC

#_0CE278: dw $E210, $0100 ; VRAM $21C4 | 2 bytes | Horizontal
#_0CE27C: dw $3583

#_0CE27E: dw $E310, $3240 ; VRAM $21C6 | 52 bytes | Fixed horizontal
#_0CE282: dw $3585

#_0CE284: dw $FD10, $0100 ; VRAM $21FA | 2 bytes | Horizontal
#_0CE288: dw $3584

#_0CE28A: dw $0211, $22C0 ; VRAM $2204 | 36 bytes | Fixed vertical
#_0CE28E: dw $3586

#_0CE290: dw $1D11, $22C0 ; VRAM $223A | 36 bytes | Fixed vertical
#_0CE294: dw $3596

#_0CE296: dw $4213, $0100 ; VRAM $2684 | 2 bytes | Horizontal
#_0CE29A: dw $3593

#_0CE29C: dw $4313, $3240 ; VRAM $2686 | 52 bytes | Fixed horizontal
#_0CE2A0: dw $3595

#_0CE2A2: dw $5D13, $0100 ; VRAM $26BA | 2 bytes | Horizontal
#_0CE2A6: dw $3594

;===================================================================================================

FileSelectTilemap:
#_0CE2A8: dw $6560, $1B00 ; VRAM $C0CA | 28 bytes | Horizontal
#_0CE2AC: dw $180F, $180B, $1800, $1828, $1804, $1821, $18A9, $18A9
#_0CE2BC: dw $1822, $1804, $180B, $1804, $1802, $1823

#_0CE2C8: dw $8560, $1B00 ; VRAM $C10A | 28 bytes | Horizontal
#_0CE2CC: dw $181F, $181B, $1810, $1838, $1814, $1831, $18B9, $18B9
#_0CE2DC: dw $1832, $1814, $181B, $1814, $1812, $1833

#_0CE2E8: dw $C662, $1700 ; VRAM $C58C | 24 bytes | Horizontal
#_0CE2EC: dw $1802, $180E, $180F, $1828, $18A9, $18A9, $180F, $180B
#_0CE2FC: dw $1800, $1828, $1804, $1821

#_0CE304: dw $E662, $1700 ; VRAM $C5CC | 24 bytes | Horizontal
#_0CE308: dw $1812, $181E, $181F, $1838, $18A9, $18A9, $181F, $181B
#_0CE318: dw $1810, $1838, $1814, $1831

#_0CE320: dw $0663, $1700 ; VRAM $C60C | 24 bytes | Horizontal
#_0CE324: dw $1804, $1821, $1800, $1822, $1804, $18A9, $180F, $180B
#_0CE334: dw $1800, $1828, $1804, $1821

#_0CE33C: dw $2663, $1700 ; VRAM $C64C | 24 bytes | Horizontal
#_0CE340: dw $1814, $1831, $1810, $1832, $1814, $18A9, $181F, $181B
#_0CE350: dw $1810, $1838, $1814, $1831

#_0CE358: db $FF ; end of stripes data

;===================================================================================================

FileSelectNamesTilemap:
#_0CE359: dw $2961, $2500 ; VRAM $C252 | 38 bytes | Horizontal
#_0CE35D: dw $18E7, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE36D: dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE37D: dw $18A9, $18A9, $18A9

#_0CE383: dw $4961, $2500 ; VRAM $C292 | 38 bytes | Horizontal
#_0CE387: dw $18F7, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE397: dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE3A7: dw $18A9, $18A9, $18A9

#_0CE3AD: dw $A961, $2500 ; VRAM $C352 | 38 bytes | Horizontal
#_0CE3B1: dw $18E8, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE3C1: dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE3D1: dw $18A9, $18A9, $18A9

#_0CE3D7: dw $C961, $2500 ; VRAM $C392 | 38 bytes | Horizontal
#_0CE3DB: dw $18F8, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE3EB: dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE3FB: dw $18A9, $18A9, $18A9

#_0CE401: dw $2962, $2500 ; VRAM $C452 | 38 bytes | Horizontal
#_0CE405: dw $18E9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE415: dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE425: dw $18A9, $18A9, $18A9

#_0CE42B: dw $4962, $2500 ; VRAM $C492 | 38 bytes | Horizontal
#_0CE42F: dw $18F9, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE43F: dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE44F: dw $18A9, $18A9, $18A9

#_0CE455: db $FF ; end of stripes data

;===================================================================================================

FileSelectKILLFileTilemap:
#_0CE456: dw $6560, $1700 ; VRAM $C0CA | 24 bytes | Horizontal
#_0CE45A: dw $1804, $1821, $1800, $1822, $1804, $18A9, $180F, $180B
#_0CE46A: dw $1800, $1828, $1804, $1821

#_0CE472: dw $8560, $1700 ; VRAM $C10A | 24 bytes | Horizontal
#_0CE476: dw $1814, $1831, $1810, $1832, $1814, $18A9, $181F, $181B
#_0CE486: dw $1810, $1838, $1814, $1831

#_0CE48E: dw $0461, $2F00 ; VRAM $C208 | 48 bytes | Horizontal
#_0CE492: dw $1826, $1807, $18AF, $1802, $1807, $18A9, $180F, $180B
#_0CE4A2: dw $1800, $1828, $1804, $1821, $18A9, $1803, $180E, $18A9
#_0CE4B2: dw $1828, $180E, $1824, $18A9, $1826, $1800, $180D, $1823

#_0CE4C2: dw $2461, $2F00 ; VRAM $C248 | 48 bytes | Horizontal
#_0CE4C6: dw $1836, $1817, $18BF, $1812, $1817, $18A9, $181F, $181B
#_0CE4D6: dw $1810, $1838, $1814, $1831, $18A9, $1813, $181E, $18A9
#_0CE4E6: dw $1838, $181E, $1834, $18A9, $1836, $1810, $181D, $1833

#_0CE4F6: dw $4461, $1300 ; VRAM $C288 | 20 bytes | Horizontal
#_0CE4FA: dw $1823, $180E, $18A9, $1804, $1821, $1800, $1822, $1804
#_0CE50A: dw $18A9, $186F

#_0CE50E: dw $6461, $1300 ; VRAM $C2C8 | 20 bytes | Horizontal
#_0CE512: dw $1833, $181E, $18A9, $1814, $1831, $1810, $1832, $1814
#_0CE522: dw $18A9, $187F

#_0CE526: dw $0663, $0700 ; VRAM $C60C | 8 bytes | Horizontal
#_0CE52A: dw $1820, $1824, $18AF, $1823

#_0CE532: dw $2663, $0700 ; VRAM $C64C | 8 bytes | Horizontal
#_0CE536: dw $1830, $1834, $18BF, $1833

#_0CE53E: db $FF ; end of stripes data

;===================================================================================================

KILLFile_BlankNameStripes:
#_0CE53F: dw $A761, $2500 ; VRAM $C34E | 38 bytes | Horizontal
#_0CE543: dw $18E7, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE553: dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE563: dw $18A9, $18A9, $18A9

#_0CE569: dw $C761, $2500 ; VRAM $C38E | 38 bytes | Horizontal
#_0CE56D: dw $18F7, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE57D: dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE58D: dw $18A9, $18A9, $18A9

#_0CE593: dw $0762, $2500 ; VRAM $C40E | 38 bytes | Horizontal
#_0CE597: dw $18E8, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE5A7: dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE5B7: dw $18A9, $18A9, $18A9

#_0CE5BD: dw $2762, $2500 ; VRAM $C44E | 38 bytes | Horizontal
#_0CE5C1: dw $18F8, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE5D1: dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE5E1: dw $18A9, $18A9, $18A9

#_0CE5E7: dw $6762, $2500 ; VRAM $C4CE | 38 bytes | Horizontal
#_0CE5EB: dw $18E9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE5FB: dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE60B: dw $18A9, $18A9, $18A9

#_0CE611: dw $8762, $2500 ; VRAM $C50E | 38 bytes | Horizontal
#_0CE615: dw $18F9, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE625: dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CE635: dw $18A9, $18A9, $18A9

#_0CE63B: db $FF ; end of stripes data

;===================================================================================================

FileSelectCopyFileTilemap:
#_0CE63C: dw $6560, $1700 ; VRAM $C0CA | 24 bytes | Horizontal
#_0CE640: dw $1802, $180E, $180F, $1828, $18A9, $18A9, $180F, $180B
#_0CE650: dw $1800, $1828, $1804, $1821

#_0CE658: dw $8560, $1700 ; VRAM $C10A | 24 bytes | Horizontal
#_0CE65C: dw $1812, $181E, $181F, $1838, $18A9, $18A9, $181F, $181B
#_0CE66C: dw $1810, $1838, $1814, $1831

#_0CE674: dw $0663, $0700 ; VRAM $C60C | 8 bytes | Horizontal
#_0CE678: dw $1820, $1824, $18AF, $1823

#_0CE680: dw $2663, $0700 ; VRAM $C64C | 8 bytes | Horizontal
#_0CE684: dw $1830, $1834, $18BF, $1833

#_0CE68C: db $FF ; end of stripes data

;===================================================================================================

CopyFile_HeaderStripe:
#_0CE68D: dw $0461, $1500 ; VRAM $C208 | 22 bytes | Horizontal
#_0CE691: dw $1885, $1826, $1807, $18AF, $1802, $1807, $186F, $1886
#_0CE6A1: dw $18A9, $18A9, $18A9

#_0CE6A7: dw $2461, $1500 ; VRAM $C248 | 22 bytes | Horizontal
#_0CE6AB: dw $1895, $1836, $1817, $18BF, $1812, $1817, $187F, $1896
#_0CE6BB: dw $18A9, $18A9, $18A9

#_0CE6C1: dw $6761, $0F00 ; VRAM $C2CE | 16 bytes | Horizontal
#_0CE6C5: dw $18E7, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

#_0CE6D5: dw $8761, $0F00 ; VRAM $C30E | 16 bytes | Horizontal
#_0CE6D9: dw $18F7, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

#_0CE6E9: dw $C761, $0F00 ; VRAM $C38E | 16 bytes | Horizontal
#_0CE6ED: dw $18E8, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

#_0CE6FD: dw $E761, $0F00 ; VRAM $C3CE | 16 bytes | Horizontal
#_0CE701: dw $18F8, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

#_0CE711: dw $2762, $0F00 ; VRAM $C44E | 16 bytes | Horizontal
#_0CE715: dw $18E9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

#_0CE725: dw $4762, $0F00 ; VRAM $C48E | 16 bytes | Horizontal
#_0CE729: dw $18F9, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

#_0CE739: db $FF ; end of stripes data

;===================================================================================================

CopyFile_TargetHeaderStripes:
#_0CE73A: dw $5161, $1500 ; VRAM $C2A2 | 22 bytes | Horizontal
#_0CE73E: dw $1885, $1823, $180E, $18A9, $1826, $1807, $18AF, $1802
#_0CE74E: dw $1807, $186F, $1886

#_0CE754: dw $7161, $1500 ; VRAM $C2E2 | 22 bytes | Horizontal
#_0CE758: dw $1895, $1833, $181E, $18B9, $1836, $1817, $18BF, $1812
#_0CE768: dw $1817, $187F, $1896

#_0CE76E: dw $B461, $0F00 ; VRAM $C368 | 16 bytes | Horizontal
#_0CE772: dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

#_0CE782: dw $D461, $0F00 ; VRAM $C3A8 | 16 bytes | Horizontal
#_0CE786: dw $18A9, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

#_0CE796: dw $1462, $0F00 ; VRAM $C428 | 16 bytes | Horizontal
#_0CE79A: dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

#_0CE7AA: dw $3462, $0F00 ; VRAM $C468 | 16 bytes | Horizontal
#_0CE7AE: dw $18A9, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

#_0CE7BE: db $FF ; end of stripes data

;===================================================================================================

NamePlayerTilemap:
#_0CE7BF: dw $A410, $2A40 ; VRAM $2148 | 44 bytes | Fixed horizontal
#_0CE7C3: dw $147F

#_0CE7C5: dw $C410, $2A40 ; VRAM $2188 | 44 bytes | Fixed horizontal
#_0CE7C9: dw $147F

#_0CE7CB: dw $6311, $1840 ; VRAM $22C6 | 26 bytes | Fixed horizontal
#_0CE7CF: dw $147F

#_0CE7D1: dw $8311, $1840 ; VRAM $2306 | 26 bytes | Fixed horizontal
#_0CE7D5: dw $147F

#_0CE7D7: dw $A311, $1840 ; VRAM $2346 | 26 bytes | Fixed horizontal
#_0CE7DB: dw $147F

#_0CE7DD: dw $E311, $3240 ; VRAM $23C6 | 52 bytes | Fixed horizontal
#_0CE7E1: dw $147F

#_0CE7E3: dw $0312, $3240 ; VRAM $2406 | 52 bytes | Fixed horizontal
#_0CE7E7: dw $147F

#_0CE7E9: dw $2312, $3240 ; VRAM $2446 | 52 bytes | Fixed horizontal
#_0CE7ED: dw $147F

#_0CE7EF: dw $4312, $3240 ; VRAM $2486 | 52 bytes | Fixed horizontal
#_0CE7F3: dw $147F

#_0CE7F5: dw $6312, $3240 ; VRAM $24C6 | 52 bytes | Fixed horizontal
#_0CE7F9: dw $147F

#_0CE7FB: dw $8312, $3240 ; VRAM $2506 | 52 bytes | Fixed horizontal
#_0CE7FF: dw $147F

#_0CE801: dw $A312, $3240 ; VRAM $2546 | 52 bytes | Fixed horizontal
#_0CE805: dw $147F

#_0CE807: dw $C312, $3240 ; VRAM $2586 | 52 bytes | Fixed horizontal
#_0CE80B: dw $147F

#_0CE80D: dw $E312, $3240 ; VRAM $25C6 | 52 bytes | Fixed horizontal
#_0CE811: dw $147F

#_0CE813: dw $0313, $3240 ; VRAM $2606 | 52 bytes | Fixed horizontal
#_0CE817: dw $147F

#_0CE819: dw $8210, $3300 ; VRAM $2104 | 52 bytes | Horizontal
#_0CE81D: dw $1589, $158A, $158B, $158C, $158B, $158C, $158B, $158C
#_0CE82D: dw $158B, $158C, $158B, $158C, $158B, $158C, $158B, $158C
#_0CE83D: dw $158B, $158C, $158B, $158C, $158B, $158C, $158B, $158C
#_0CE84D: dw $558A, $5589

#_0CE851: dw $A210, $0300 ; VRAM $2144 | 4 bytes | Horizontal
#_0CE855: dw $1599, $159A

#_0CE859: dw $BA10, $0300 ; VRAM $2174 | 4 bytes | Horizontal
#_0CE85D: dw $559A, $5599

#_0CE861: dw $C210, $0300 ; VRAM $2184 | 4 bytes | Horizontal
#_0CE865: dw $15A9, $15AA

#_0CE869: dw $DA10, $0300 ; VRAM $21B4 | 4 bytes | Horizontal
#_0CE86D: dw $559A, $5599

#_0CE871: dw $E210, $3300 ; VRAM $21C4 | 52 bytes | Horizontal
#_0CE875: dw $159D, $15AD, $159B, $159C, $159B, $159C, $159B, $159C
#_0CE885: dw $159B, $159C, $159B, $159C, $159B, $159C, $159B, $159C
#_0CE895: dw $159B, $159C, $159B, $159C, $159B, $159C, $159B, $159C
#_0CE8A5: dw $55AD, $559D

#_0CE8A9: dw $0211, $3300 ; VRAM $2204 | 52 bytes | Horizontal
#_0CE8AD: dw $15AB, $15AC, $15AB, $15AC, $15AB, $15AC, $15AB, $15AC
#_0CE8BD: dw $15AB, $15AC, $15AB, $15AC, $15AB, $15AC, $15AB, $15AC
#_0CE8CD: dw $15AB, $15AC, $15AB, $15AC, $15AB, $15AC, $15AB, $15AC
#_0CE8DD: dw $15AB, $15AC

#_0CE8E1: dw $4211, $1D00 ; VRAM $2284 | 30 bytes | Horizontal
#_0CE8E5: dw $1587, $1588, $1587, $1588, $1587, $1588, $1587, $1588
#_0CE8F5: dw $1587, $1588, $1587, $1588, $1587, $1588, $1587

#_0CE903: dw $6211, $1B80 ; VRAM $22C4 | 28 bytes | Vertical
#_0CE907: dw $15AF, $15A7, $15AF, $15A7, $15AF, $15A7, $15AF, $15A7
#_0CE917: dw $15AF, $15A7, $15AF, $15A7, $15AF, $15A7

#_0CE923: dw $7011, $0580 ; VRAM $22E0 | 6 bytes | Vertical
#_0CE927: dw $15A8, $15AE, $15A8

#_0CE92D: dw $C311, $3500 ; VRAM $2386 | 54 bytes | Horizontal
#_0CE931: dw $1588, $1598, $1588, $1598, $1588, $1598, $1588, $1598
#_0CE941: dw $1588, $1598, $1588, $1598, $1588, $1598, $1588, $1587
#_0CE951: dw $1588, $1587, $1588, $1587, $1588, $1587, $1588, $1587
#_0CE961: dw $1588, $1587, $1588

#_0CE967: dw $FD11, $1380 ; VRAM $23FA | 20 bytes | Vertical
#_0CE96B: dw $15A8, $15AE, $15A8, $15AE, $15A8, $15AE, $15A8, $15AE
#_0CE97B: dw $15A8, $15AE

#_0CE97F: dw $2213, $3700 ; VRAM $2644 | 56 bytes | Horizontal
#_0CE983: dw $1597, $1598, $1597, $1598, $1597, $1598, $1597, $1598
#_0CE993: dw $1597, $1598, $1597, $1598, $1597, $1598, $1597, $1598
#_0CE9A3: dw $1597, $1598, $1597, $1598, $1597, $1598, $1597, $1598
#_0CE9B3: dw $1597, $1598, $1597, $1598

#_0CE9BB: dw $F011, $12C0 ; VRAM $23E0 | 20 bytes | Fixed vertical
#_0CE9BF: dw $158D

#_0CE9C1: dw $A460, $2B00 ; VRAM $C148 | 44 bytes | Horizontal
#_0CE9C5: dw $18A9, $1821, $1804, $1806, $18AF, $1822, $1823, $1804
#_0CE9D5: dw $1821, $18A9, $18A9, $1828, $180E, $1824, $1821, $18A9
#_0CE9E5: dw $18A9, $180D, $1800, $180C, $1804, $18A9

#_0CE9F1: dw $C460, $2B00 ; VRAM $C188 | 44 bytes | Horizontal
#_0CE9F5: dw $18A9, $1831, $1814, $1816, $18BF, $1832, $1833, $1814
#_0CEA05: dw $1831, $18A9, $18A9, $1838, $181E, $1834, $1831, $18A9
#_0CEA15: dw $18A9, $181D, $1810, $181C, $1814, $18A9

#_0CEA21: dw $0262, $3900 ; VRAM $C404 | 58 bytes | Horizontal
#_0CEA25: dw $1800, $18A9, $1801, $18A9, $1802, $18A9, $1803, $18A9
#_0CEA35: dw $1804, $18A9, $1805, $18A9, $1806, $18A9, $1807, $18A9
#_0CEA45: dw $18AF, $18A9, $1809, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CEA55: dw $182A, $18A9, $182B, $18A9, $182C

#_0CEA5F: dw $2262, $3900 ; VRAM $C444 | 58 bytes | Horizontal
#_0CEA63: dw $1810, $18A9, $1811, $18A9, $1812, $18A9, $1813, $18A9
#_0CEA73: dw $1814, $18A9, $1815, $18A9, $1816, $18A9, $1817, $18A9
#_0CEA83: dw $18BF, $18A9, $1819, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CEA93: dw $183A, $18A9, $183B, $18A9, $183C

#_0CEA9D: dw $4262, $3900 ; VRAM $C484 | 58 bytes | Horizontal
#_0CEAA1: dw $180A, $18A9, $180B, $18A9, $180C, $18A9, $180D, $18A9
#_0CEAB1: dw $180E, $18A9, $180F, $18A9, $1820, $18A9, $1821, $18A9
#_0CEAC1: dw $1822, $18A9, $1823, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CEAD1: dw $1844, $18A9, $18AF, $18A9, $1846

#_0CEADB: dw $6262, $3900 ; VRAM $C4C4 | 58 bytes | Horizontal
#_0CEADF: dw $181A, $18A9, $181B, $18A9, $181C, $18A9, $181D, $18A9
#_0CEAEF: dw $181E, $18A9, $181F, $18A9, $1830, $18A9, $1831, $18A9
#_0CEAFF: dw $1832, $18A9, $1833, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CEB0F: dw $1854, $18A9, $18BF, $18A9, $1856

#_0CEB19: dw $8262, $3900 ; VRAM $C504 | 58 bytes | Horizontal
#_0CEB1D: dw $1824, $18A9, $1825, $18A9, $1826, $18A9, $1827, $18A9
#_0CEB2D: dw $1828, $18A9, $1829, $18A9, $1880, $18A9, $1881, $18A9
#_0CEB3D: dw $1882, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CEB4D: dw $184E, $18A9, $184F, $18A9, $1860

#_0CEB57: dw $A262, $3900 ; VRAM $C544 | 58 bytes | Horizontal
#_0CEB5B: dw $1834, $18A9, $1835, $18A9, $1836, $18A9, $1837, $18A9
#_0CEB6B: dw $1838, $18A9, $1839, $18A9, $1890, $18A9, $1891, $18A9
#_0CEB7B: dw $1892, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CEB8B: dw $185E, $18A9, $185F, $18A9, $1870

#_0CEB95: dw $CC62, $1100 ; VRAM $C598 | 18 bytes | Horizontal
#_0CEB99: dw $18AA, $18A9, $1884, $18A9, $18A9, $18A9, $1804, $180D
#_0CEBA9: dw $1803

#_0CEBAB: dw $EC62, $1100 ; VRAM $C5D8 | 18 bytes | Horizontal
#_0CEBAF: dw $18BA, $18A9, $1894, $18A9, $18A9, $18A9, $1814, $181D
#_0CEBBF: dw $1813

#_0CEBC1: dw $0066, $3500 ; VRAM $CC00 | 54 bytes | Horizontal
#_0CEBC5: dw $182D, $18A9, $182E, $18A9, $182F, $18A9, $1840, $18A9
#_0CEBD5: dw $1841, $18A9, $18C0, $18A9, $1843, $18A9, $18A9, $18A9
#_0CEBE5: dw $18A9, $18A9, $18E6, $18A9, $18E7, $18A9, $18E8, $18A9
#_0CEBF5: dw $18E9, $18A9, $18EA

#_0CEBFB: dw $2066, $3500 ; VRAM $CC40 | 54 bytes | Horizontal
#_0CEBFF: dw $183D, $18A9, $183E, $18A9, $183F, $18A9, $1850, $18A9
#_0CEC0F: dw $1851, $18A9, $18D0, $18A9, $1853, $18A9, $18A9, $18A9
#_0CEC1F: dw $18A9, $18A9, $18F6, $18A9, $18F7, $18A9, $18F8, $18A9
#_0CEC2F: dw $18F9, $18A9, $18FA

#_0CEC35: dw $4066, $3500 ; VRAM $CC80 | 54 bytes | Horizontal
#_0CEC39: dw $1847, $18A9, $1848, $18A9, $1849, $18A9, $184A, $18A9
#_0CEC49: dw $184B, $18A9, $184C, $18A9, $184D, $18A9, $18A9, $18A9
#_0CEC59: dw $18A9, $18A9, $18EB, $18A9, $18EC, $18A9, $18ED, $18A9
#_0CEC69: dw $18EE, $18A9, $18EF

#_0CEC6F: dw $6066, $3500 ; VRAM $CCC0 | 54 bytes | Horizontal
#_0CEC73: dw $1857, $18A9, $1858, $18A9, $1859, $18A9, $185A, $18A9
#_0CEC83: dw $185B, $18A9, $185C, $18A9, $185D, $18A9, $18A9, $18A9
#_0CEC93: dw $18A9, $18A9, $18FB, $18A9, $18FC, $18A9, $18FD, $18A9
#_0CECA3: dw $18FE, $18A9, $18FF

#_0CECA9: dw $8066, $3100 ; VRAM $CD00 | 50 bytes | Horizontal
#_0CECAD: dw $1861, $18A9, $1862, $18A9, $1863, $18A9, $1880, $18A9
#_0CECBD: dw $1881, $18A9, $1882, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CECCD: dw $18A9, $18A9, $18C1, $18A9, $186F, $18A9, $1885, $18A9
#_0CECDD: dw $1886

#_0CECDF: dw $A066, $3100 ; VRAM $CD40 | 50 bytes | Horizontal
#_0CECE3: dw $1871, $18A9, $1872, $18A9, $1873, $18A9, $1890, $18A9
#_0CECF3: dw $1891, $18A9, $1892, $18A9, $18A9, $18A9, $18A9, $18A9
#_0CED03: dw $18A9, $18A9, $18D1, $18A9, $187F, $18A9, $1895, $18A9
#_0CED13: dw $1896

#_0CED15: dw $C466, $2D00 ; VRAM $CD88 | 46 bytes | Horizontal
#_0CED19: dw $18AA, $18A9, $1884, $18A9, $18A9, $18A9, $1804, $180D
#_0CED29: dw $1803, $18A9, $18A9, $18A9, $18A9, $18A9, $18AA, $18A9
#_0CED39: dw $1884, $18A9, $18A9, $18A9, $1804, $180D, $1803

#_0CED47: dw $E466, $2D00 ; VRAM $CDC8 | 46 bytes | Horizontal
#_0CED4B: dw $18BA, $18A9, $1894, $18A9, $18A9, $18A9, $1814, $181D
#_0CED5B: dw $1813, $18A9, $18A9, $18A9, $18A9, $18A9, $18BA, $18A9
#_0CED6B: dw $1894, $18A9, $18A9, $18A9, $1814, $181D, $1813

#_0CED79: db $FF ; end of stripes data

;===================================================================================================

pool Intro_DisplayLogo

.object_a
#_0CED7A: db $60, $70, $80, $88

.object_b
#_0CED7E: db $69, $6B, $6D, $6E

pool off

;---------------------------------------------------------------------------------------------------

Intro_DisplayLogo:
#_0CED82: PHB
#_0CED83: PHK
#_0CED84: PLB

#_0CED85: LDY.b #$03
#_0CED87: LDX.b #$0C

.next
#_0CED89: LDA.b #$02
#_0CED8B: STA.w $0A20,Y

#_0CED8E: LDA.w .object_a,Y
#_0CED91: STA.w $0800,X

#_0CED94: LDA.b #$68
#_0CED96: STA.w $0801,X

#_0CED99: LDA.w .object_b,Y
#_0CED9C: STA.w $0802,X

#_0CED9F: LDA.b #$32
#_0CEDA1: STA.w $0803,X

#_0CEDA4: DEX
#_0CEDA5: DEX
#_0CEDA6: DEX
#_0CEDA7: DEX

#_0CEDA8: DEY
#_0CEDA9: BPL .next

#_0CEDAB: PLB

#_0CEDAC: RTS

;===================================================================================================

Module14_Attract:
#_0CEDAD: LDA.b $13
#_0CEDAF: BEQ .continue

#_0CEDB1: CMP.b #$80
#_0CEDB3: BEQ .continue

#_0CEDB5: LDA.b $22
#_0CEDB7: BEQ .continue

#_0CEDB9: CMP.b #$02
#_0CEDBB: BEQ .continue

#_0CEDBD: CMP.b #$06
#_0CEDBF: BEQ .continue

#_0CEDC1: LDA.b $F4
#_0CEDC3: AND.b #$90
#_0CEDC5: BEQ .continue

#_0CEDC7: LDA.b #$09
#_0CEDC9: STA.b $22

.continue
#_0CEDCB: LDA.b $22
#_0CEDCD: ASL A
#_0CEDCE: TAX

#_0CEDCF: JMP.w (.vectors,X)

;---------------------------------------------------------------------------------------------------

.vectors
#_0CEDD2: dw Attract_FadeOut          ; 0x00
#_0CEDD4: dw Attract_Initialize       ; 0x01
#_0CEDD6: dw Attract_FadeOutSequence  ; 0x02
#_0CEDD8: dw Attract_LoadNewScene     ; 0x03
#_0CEDDA: dw Attract_FadeInSequence   ; 0x04
#_0CEDDC: dw Attract_EnactStory       ; 0x05
#_0CEDDE: dw Attract_FadeOutSequence  ; 0x06
#_0CEDE0: dw Attract_LoadNewScene     ; 0x07
#_0CEDE2: dw Attract_EnactStory       ; 0x08
#_0CEDE4: dw Attract_SkipToFileSelect ; 0x09

;===================================================================================================

Attract_FadeOut:
#_0CEDE6: JSL Intro_HandleAllTriforceAnimations

#_0CEDEA: STZ.w $1F00
#_0CEDED: STZ.w $012A

#_0CEDF0: JSR Intro_HandleLogoSword

#_0CEDF3: LDA.b $13
#_0CEDF5: BEQ .fully_faded

#_0CEDF7: DEC.b $13

#_0CEDF9: RTL

.fully_faded
#_0CEDFA: JSL EnableForceBlank

#_0CEDFE: LDA.b #$FF
#_0CEE00: STA.w $0128
#_0CEE03: STZ.w $012A

#_0CEE06: STZ.w $1F0C

#_0CEE09: INC.b $22

#_0CEE0B: RTL


;===================================================================================================

Attract_Initialize:
#_0CEE0C: LDX.b #$50

.next
#_0CEE0E: STZ.b $20,X

#_0CEE10: DEX
#_0CEE11: BPL .next

#_0CEE13: JSL EraseTilemaps_normal
#_0CEE17: JSL Attract_LoadBG3GFX

#_0CEE1B: LDA.b #$04
#_0CEE1D: STA.w $0AB3

#_0CEE20: LDA.b #$01
#_0CEE22: STA.w $0AB2
#_0CEE25: STZ.w $0AA9

#_0CEE28: JSL Palettes_Load_HUD

#_0CEE2C: LDA.b #$02
#_0CEE2E: STA.w $0AA9

#_0CEE31: JSL Palettes_Load_OWBGMain
#_0CEE35: JSL Palettes_Load_HUD
#_0CEE39: JSL Palettes_Load_LinkArmorAndGloves

#_0CEE3D: LDA.b #$00 ; RGB: #000070
#_0CEE3F: STA.l $7EC53A

#_0CEE43: LDA.b #$38
#_0CEE45: STA.l $7EC53B

#_0CEE49: INC.b $15

;---------------------------------------------------------------------------------------------------

#_0CEE4B: LDA.b #$14
#_0CEE4D: STA.b $EA

#_0CEE4F: JSR Attract_BuildBackgrounds

#_0CEE52: REP #$10

#_0CEE54: STZ.w $1CD8

#_0CEE57: LDX.w #$0112 ; MESSAGE 0112
#_0CEE5A: STX.w $1CF0

#_0CEE5D: STZ.b $E8
#_0CEE5F: STZ.b $E9

#_0CEE61: LDX.w #$1010
#_0CEE64: STX.w $0200

#_0CEE67: INC.b $22
#_0CEE69: INC.b $22
#_0CEE6B: INC.b $22

#_0CEE6D: SEP #$10

#_0CEE6F: JSR Attract_SetUpWindowingHDMA

;---------------------------------------------------------------------------------------------------

#_0CEE72: STZ.b $96
#_0CEE74: STZ.b $97

#_0CEE76: LDA.b #$B0
#_0CEE78: STA.b $98

#_0CEE7A: LDA.b #$03
#_0CEE7C: STA.b $1E
#_0CEE7E: STZ.b $1F

#_0CEE80: LDA.b #$25 ; Fixed color RGB: #282828
#_0CEE82: STA.b $9C

#_0CEE84: LDA.b #$45
#_0CEE86: STA.b $9D

#_0CEE88: LDA.b #$85
#_0CEE8A: STA.b $9E

#_0CEE8C: LDA.b #$10
#_0CEE8E: STA.b $99

#_0CEE90: LDA.b #$A3
#_0CEE92: STA.b $9A

#_0CEE94: STZ.w WBGLOG
#_0CEE97: STZ.w WOBJLOG

#_0CEE9A: LDA.b #$C0
#_0CEE9C: STA.b $9B

#_0CEE9E: LDA.b #$06 ; SONG 06
#_0CEEA0: STA.w $012C

#_0CEEA3: INC.b $27

#_0CEEA5: RTL

;===================================================================================================

Attract_FadeInStep:
#_0CEEA6: LDA.b $13
#_0CEEA8: CMP.b #$0F
#_0CEEAA: BEQ .step

#_0CEEAC: DEC.b $5E
#_0CEEAE: BPL .exit

#_0CEEB0: INC.b $13

#_0CEEB2: LDA.b #$01
#_0CEEB4: STA.b $5E

.exit
#_0CEEB6: RTS

.step
#_0CEEB7: INC.b $5F

#_0CEEB9: RTS

;===================================================================================================

Attract_FadeInSequence:
#_0CEEBA: LDA.b $13
#_0CEEBC: CMP.b #$0F
#_0CEEBE: BEQ Attract_FadedSequenceAdvance

#_0CEEC0: DEC.b $5E
#_0CEEC2: BPL .exit

#_0CEEC4: INC.b $13

#_0CEEC6: LDA.b #$01
#_0CEEC8: STA.b $5E

.exit
#_0CEECA: RTL

;===================================================================================================

Attract_FadeOutSequence:
#_0CEECB: LDA.b $13
#_0CEECD: BEQ .advance

#_0CEECF: DEC.b $5E
#_0CEED1: BPL .exit

#_0CEED3: DEC.b $13

#_0CEED5: LDA.b #$01
#_0CEED7: STA.b $5E

.exit
#_0CEED9: RTL

.advance
#_0CEEDA: JSL EnableForceBlank
#_0CEEDE: JSL EraseTilemaps_normal

;===================================================================================================

Attract_FadedSequenceAdvance:
#_0CEEE2: INC.b $22

#_0CEEE4: RTL

;===================================================================================================

Attract_LoadNewScene:
#_0CEEE5: LDA.b $23
#_0CEEE7: ASL A
#_0CEEE8: TAX

#_0CEEE9: JMP.w (.vectors,X)

;---------------------------------------------------------------------------------------------------

.vectors
#_0CEEEC: dw AttractScene_PolkaDots    ; 0x00
#_0CEEEE: dw AttractScene_WorldMap     ; 0x01
#_0CEEF0: dw AttractScene_ThroneRoom   ; 0x02
#_0CEEF2: dw AttractScene_Prison       ; 0x03
#_0CEEF4: dw AttractScene_AgahnimAltar ; 0x04
#_0CEEF6: dw AttractScene_EndOfStory   ; 0x05

;===================================================================================================

AttractScene_PolkaDots:
#_0CEEF8: STZ.b $26

#_0CEEFA: INC.b $22

#_0CEEFC: STZ.b $13

#_0CEEFE: RTL

;===================================================================================================

AttractScene_WorldMap:
#_0CEEFF: LDA.b #$13
#_0CEF01: STA.w BG1SC

#_0CEF04: LDA.b #$03
#_0CEF06: STA.w BG2SC

#_0CEF09: LDA.b #$80
#_0CEF0B: STA.b $99

#_0CEF0D: LDA.b #$21
#_0CEF0F: STA.b $9A

#_0CEF11: LDA.b #$07
#_0CEF13: STA.w BGMODE
#_0CEF16: STA.b $94

#_0CEF18: LDA.b #$80
#_0CEF1A: STA.w M7SEL

#_0CEF1D: JSL WorldMap_LoadLightWorldMap

;---------------------------------------------------------------------------------------------------

#_0CEF21: REP #$20

#_0CEF23: LDA.w #$00ED
#_0CEF26: STA.w $063A

#_0CEF29: LDA.w #$0100
#_0CEF2C: STA.w $0638

#_0CEF2F: LDA.w #$0080
#_0CEF32: STA.w $0120

#_0CEF35: LDA.w #$00C0
#_0CEF38: STA.w $0124

#_0CEF3B: SEP #$20

#_0CEF3D: LDA.b #$FF
#_0CEF3F: STA.w $0637

#_0CEF42: JSR Attract_ControlMapZoom

#_0CEF45: LDA.b #$01
#_0CEF47: STA.b $25

#_0CEF49: INC.b $22

#_0CEF4B: STZ.b $13

#_0CEF4D: RTL

;===================================================================================================

AttractScene_ThroneRoom:
#_0CEF4E: STZ.w HDMAEN
#_0CEF51: STZ.b $9B

#_0CEF53: LDA.b #$02
#_0CEF55: STA.b $99

#_0CEF57: LDA.b #$20
#_0CEF59: STA.b $9A

#_0CEF5B: LDA.b #$0A
#_0CEF5D: STA.w $0AA4

#_0CEF60: JSL LoadCommonSprites_long

#_0CEF64: REP #$20

#_0CEF66: LDA.b $20
#_0CEF68: PHA

#_0CEF69: LDA.b $22
#_0CEF6B: PHA

#_0CEF6C: SEP #$20

#_0CEF6E: LDA.b #$74
#_0CEF70: JSL Underworld_LoadAndDrawEntranceRoom

;---------------------------------------------------------------------------------------------------

#_0CEF74: REP #$20

#_0CEF76: PLA
#_0CEF77: STA.b $22

#_0CEF79: PLA
#_0CEF7A: STA.b $20

#_0CEF7C: SEP #$20

#_0CEF7E: STZ.w $0AB6
#_0CEF81: STZ.w $0AAC

#_0CEF84: LDA.b #$0E
#_0CEF86: STA.w $0AAD

#_0CEF89: LDA.b #$03
#_0CEF8B: STA.w $0AAE

#_0CEF8E: LDX.b #$7E
#_0CEF90: LDA.b #$00
#_0CEF92: JSL Underworld_SaveAndLoadLoadAllPalettes

#_0CEF96: LDA.b #$00 ; RGB: #0008C0
#_0CEF98: STA.l $7EC53A

#_0CEF9C: LDA.b #$38
#_0CEF9E: STA.l $7EC53B

;---------------------------------------------------------------------------------------------------

#_0CEFA2: STZ.w $1CD8

#_0CEFA5: LDA.b #$13 ; MESSAGE 0113
#_0CEFA7: STA.w $1CF0

#_0CEFAA: LDA.b #$01
#_0CEFAC: STA.w $1CF1

#_0CEFAF: LDA.b #$02
#_0CEFB1: STA.b $25

#_0CEFB3: LDA.b #$E0
#_0CEFB5: STA.b $2C

#_0CEFB7: REP #$20

#_0CEFB9: LDA.w #$0210
#_0CEFBC: STA.b $64

#_0CEFBE: SEP #$20

;===================================================================================================

AttractScene_AdvanceFromDungeon:
#_0CEFC0: INC.b $22

#_0CEFC2: STZ.b $13
#_0CEFC4: STZ.b $EA

#_0CEFC6: LDA.w $011F
#_0CEFC9: AND.b #$01
#_0CEFCB: STA.w $011F

#_0CEFCE: LDA.w $0123
#_0CEFD1: AND.b #$01
#_0CEFD3: STA.w $0123

#_0CEFD6: LDA.b $E3
#_0CEFD8: AND.b #$01
#_0CEFDA: STA.b $E3

#_0CEFDC: LDA.b $E9
#_0CEFDE: AND.b #$01
#_0CEFE0: STA.b $E9

#_0CEFE2: RTL

;===================================================================================================

AttractScene_Prison:
#_0CEFE3: STZ.b $99
#_0CEFE5: STZ.b $9A

#_0CEFE7: REP #$20

#_0CEFE9: LDA.b $20
#_0CEFEB: PHA

#_0CEFEC: LDA.b $22
#_0CEFEE: PHA

#_0CEFEF: SEP #$20

#_0CEFF1: LDA.b #$73
#_0CEFF3: JSL Underworld_LoadAndDrawEntranceRoom

#_0CEFF7: REP #$20

#_0CEFF9: PLA
#_0CEFFA: STA.b $22

#_0CEFFC: PLA
#_0CEFFD: STA.b $20

#_0CEFFF: SEP #$20

#_0CF001: LDA.b #$02
#_0CF003: STA.w $0AB6
#_0CF006: STZ.w $0AAC

#_0CF009: LDA.b #$0E
#_0CF00B: STA.w $0AAD

#_0CF00E: LDA.b #$03
#_0CF010: STA.w $0AAE

#_0CF013: LDX.b #$7F
#_0CF015: LDA.b #$01

#_0CF017: JSL Underworld_SaveAndLoadLoadAllPalettes

#_0CF01B: LDA.b #$00 ; RGB: #000070
#_0CF01D: STA.l $7EC53A

#_0CF021: LDA.b #$38
#_0CF023: STA.l $7EC53B

;---------------------------------------------------------------------------------------------------

#_0CF027: STZ.w $1CD8

#_0CF02A: LDA.b #$14 ; MESSAGE 0114
#_0CF02C: STA.w $1CF0

#_0CF02F: LDA.b #$01
#_0CF031: STA.w $1CF1

#_0CF034: LDA.b #$94
#_0CF036: STA.b $2B

#_0CF038: LDA.b #$68
#_0CF03A: STA.b $30

#_0CF03C: STZ.b $31
#_0CF03E: STZ.b $32
#_0CF040: STZ.b $33

#_0CF042: STZ.b $40
#_0CF044: STZ.b $50
#_0CF046: STZ.b $5F

#_0CF048: LDA.b #$FF
#_0CF04A: STA.b $25

#_0CF04C: REP #$20

#_0CF04E: LDA.w #$0240
#_0CF051: STA.b $64

#_0CF053: SEP #$20

#_0CF055: JMP.w AttractScene_AdvanceFromDungeon

;===================================================================================================

AttractScene_AgahnimAltar:
#_0CF058: REP #$20

#_0CF05A: LDA.b $20
#_0CF05C: PHA

#_0CF05D: LDA.b $22
#_0CF05F: PHA

#_0CF060: SEP #$20

#_0CF062: LDA.b #$75
#_0CF064: JSL Underworld_LoadAndDrawEntranceRoom

#_0CF068: REP #$20

#_0CF06A: PLA
#_0CF06B: STA.b $22

#_0CF06D: PLA
#_0CF06E: STA.b $20

#_0CF070: SEP #$20

#_0CF072: STZ.w $0AB6
#_0CF075: STZ.w $0AAC

#_0CF078: LDA.b #$0E
#_0CF07A: STA.w $0AAD

#_0CF07D: LDA.b #$03
#_0CF07F: STA.w $0AAE
#_0CF082: STZ.w $0AA9

#_0CF085: JSL Underworld_LoadAllPalettes

#_0CF089: LDX.b #$7F
#_0CF08B: LDA.b #$02
#_0CF08D: JSL Underworld_SaveAndLoadLoadAllPalettes

#_0CF091: LDA.b #$00 ; RGB: #0008C0
#_0CF093: STA.l $7EC33A
#_0CF097: STA.l $7EC53A

#_0CF09B: LDA.b #$38
#_0CF09D: STA.l $7EC33B
#_0CF0A1: STA.l $7EC53B

;---------------------------------------------------------------------------------------------------

#_0CF0A5: STZ.w $1CD8

#_0CF0A8: LDA.b #$15 ; MESSAGE 0115
#_0CF0AA: STA.w $1CF0

#_0CF0AD: LDA.b #$01
#_0CF0AF: STA.w $1CF1

#_0CF0B2: LDA.b #$FF
#_0CF0B4: STA.b $25

#_0CF0B6: LDA.b #$70
#_0CF0B8: STA.b $30
#_0CF0BA: STA.b $62

#_0CF0BC: LDA.b #$70
#_0CF0BE: STA.b $63

#_0CF0C0: LDA.b #$08
#_0CF0C2: STA.b $32

#_0CF0C4: STZ.b $50
#_0CF0C6: STZ.b $51
#_0CF0C8: STZ.b $52

#_0CF0CA: STZ.b $5F
#_0CF0CC: STZ.b $60
#_0CF0CE: STZ.b $61

#_0CF0D0: REP #$20

#_0CF0D2: LDA.w #$00C0
#_0CF0D5: STA.b $64

#_0CF0D7: SEP #$20

#_0CF0D9: JMP.w AttractScene_AdvanceFromDungeon

;===================================================================================================

AttractScene_EndOfStory:
#_0CF0DC: REP #$20

#_0CF0DE: JSL Attract_SetUpConclusionHDMA

;===================================================================================================

InitializeTriforceIntro:
#_0CF0E2: INC.w $0710

#_0CF0E5: JSL Intro_InitializeDefaultGFX
#_0CF0E9: JSL Overworld_LoadAllPalettes_long

#_0CF0ED: STZ.b $EA

#_0CF0EF: REP #$20

#_0CF0F1: STZ.w $063A
#_0CF0F4: STZ.w $0638

#_0CF0F7: STZ.w $0120
#_0CF0FA: STZ.w $0124

#_0CF0FD: STZ.w $011E
#_0CF100: STZ.w $0122

#_0CF103: SEP #$20

#_0CF105: LDA.b #$F1 ; SONG F1 - fade
#_0CF107: STA.w $012C

#_0CF10A: STZ.b $23
#_0CF10C: STZ.b $10

#_0CF10E: LDA.b #$0A
#_0CF110: STA.b $11

#_0CF112: STA.b $B0

#_0CF114: RTL

;===================================================================================================

Attract_EnactStory:
#_0CF115: LDA.b $23
#_0CF117: ASL A
#_0CF118: TAX

#_0CF119: JMP.w (.vectors,X)

;---------------------------------------------------------------------------------------------------

.vectors
#_0CF11C: dw AttractDramatize_PolkaDots    ; 0x00
#_0CF11E: dw AttractDramatize_WorldMap     ; 0x01
#_0CF120: dw AttractDramatize_ThroneRoom   ; 0x02
#_0CF122: dw AttractDramatize_Prison       ; 0x03
#_0CF124: dw AttractDramatize_AgahnimAltar ; 0x04

;===================================================================================================

AttractDramatize_PolkaDots:
#_0CF126: LDA.b $1A
#_0CF128: AND.b #$03
#_0CF12A: BNE .delay_scroll

#_0CF12C: INC.w $0124
#_0CF12F: INC.w $0120
#_0CF132: INC.w $0122
#_0CF135: DEC.w $011E

.delay_scroll
#_0CF138: LDA.b $27
#_0CF13A: BEQ .delay_map_update

#_0CF13C: JSR Attract_BuildNextImageTilemap

#_0CF13F: STZ.b $27

#_0CF141: INC.b $26
#_0CF143: INC.b $26

.delay_map_update
#_0CF145: STZ.b $F2
#_0CF147: STZ.b $F6
#_0CF149: STZ.b $F4

#_0CF14B: JSL RenderText

#_0CF14F: REP #$20

#_0CF151: DEC.w $0200
#_0CF154: BNE .delay_sequence

#_0CF156: SEP #$20

#_0CF158: INC.b $23

#_0CF15A: DEC.b $22
#_0CF15C: DEC.b $22
#_0CF15E: DEC.b $22

#_0CF160: BRA .exit

;---------------------------------------------------------------------------------------------------

.delay_sequence
#_0CF162: LDA.w $0200
#_0CF165: CMP.w #$0018
#_0CF168: BCS .exit

#_0CF16A: AND.w #$0001
#_0CF16D: BEQ .exit

#_0CF16F: SEP #$20

#_0CF171: DEC.b $13

.exit
#_0CF173: SEP #$20

#_0CF175: RTL

;===================================================================================================

AttractDramatize_WorldMap:
#_0CF176: LDA.w $0637
#_0CF179: CMP.b #$00
#_0CF17B: BEQ .advance_sequence

#_0CF17D: CMP.b #$0F
#_0CF17F: BCS .skip_fade

#_0CF181: DEC.b $13

.skip_fade
#_0CF183: LDY.b #$01

#_0CF185: DEC.b $25
#_0CF187: BNE .exit

#_0CF189: STY.b $25

#_0CF18B: LDA.w $0637
#_0CF18E: SEC
#_0CF18F: SBC.b #$01
#_0CF191: STA.w $0637

#_0CF194: JSR Attract_ControlMapZoom

.exit
#_0CF197: RTL

;---------------------------------------------------------------------------------------------------

.advance_sequence
#_0CF198: JSL EnableForceBlank

#_0CF19C: LDA.b #$09
#_0CF19E: STA.w BGMODE
#_0CF1A1: STA.b $94

#_0CF1A3: JSL EraseTilemaps_normal

#_0CF1A7: INC.b $23

#_0CF1A9: DEC.b $22
#_0CF1AB: DEC.b $22

#_0CF1AD: RTL

;---------------------------------------------------------------------------------------------------

pool AttractDramatize_ThroneRoom

.pointer_size
#_0CF1AE: dw AttractOAMData_king_size
#_0CF1B0: dw AttractOAMData_mantle_size

.pointer_offset_x
#_0CF1B2: dw AttractOAMData_king_offset_x
#_0CF1B4: dw AttractOAMData_mantle_offset_x

.pointer_offset_y
#_0CF1B6: dw AttractOAMData_king_offset_y
#_0CF1B8: dw AttractOAMData_mantle_offset_y

.pointer_char
#_0CF1BA: dw AttractOAMData_king_char
#_0CF1BC: dw AttractOAMData_mantle_char

.pointer_prop
#_0CF1BE: dw AttractOAMData_king_prop
#_0CF1C0: dw AttractOAMData_mantle_prop

;---------------------------------------------------------------------------------------------------

.offset_x
#_0CF1C2: db $50 ; king
#_0CF1C3: db $68 ; mantle

.offset_y
#_0CF1C4: db $58 ; king
#_0CF1C5: db $20 ; mantle

;---------------------------------------------------------------------------------------------------

.oam_count
#_0CF1C6: db $03 ; king
#_0CF1C7: db $05 ; mantle

pool off

;===================================================================================================

AttractDramatize_ThroneRoom:
#_0CF1C8: STZ.b $2A

#_0CF1CA: LDA.b $52
#_0CF1CC: BNE .continue

#_0CF1CE: LDA.b $13
#_0CF1D0: CMP.b #$0F
#_0CF1D2: BEQ .max_brightness

#_0CF1D4: INC.b $13

#_0CF1D6: BRA .continue

.max_brightness
#_0CF1D8: INC.b $52

;---------------------------------------------------------------------------------------------------

.continue
#_0CF1DA: REP #$20

#_0CF1DC: LDA.w $0122
#_0CF1DF: BNE .scroll_screen

#_0CF1E1: SEP #$20

#_0CF1E3: JSR Attract_DoTextInDungeonScene

#_0CF1E6: REP #$20

#_0CF1E8: LDA.b $64

#_0CF1EA: SEP #$20

#_0CF1EC: BNE .continue_dramatization

#_0CF1EE: LDA.b $2C
#_0CF1F0: CMP.b #$1F
#_0CF1F2: BCS .dont_fade_out

#_0CF1F4: AND.b #$01
#_0CF1F6: BNE .dont_fade_out

#_0CF1F8: DEC.b $13

.dont_fade_out
#_0CF1FA: DEC.b $2C
#_0CF1FC: BNE .continue_dramatization

#_0CF1FE: INC.b $23
#_0CF200: INC.b $22

#_0CF202: RTL

;---------------------------------------------------------------------------------------------------

.scroll_screen
#_0CF203: DEC.w $0122
#_0CF206: DEC.w $0124

;---------------------------------------------------------------------------------------------------

.continue_dramatization
#_0CF209: SEP #$20

#_0CF20B: LDX.b #$02

.next_entity
#_0CF20D: PHX

#_0CF20E: REP #$20

#_0CF210: LDA.l .pointer_size,X
#_0CF214: STA.b $2D

#_0CF216: LDA.l .pointer_offset_x,X
#_0CF21A: STA.b $02

#_0CF21C: LDA.l .pointer_offset_y,X
#_0CF220: STA.b $04

#_0CF222: LDA.l .pointer_char,X
#_0CF226: STA.b $06

#_0CF228: LDA.l .pointer_prop,X
#_0CF22C: STA.b $08

#_0CF22E: TXA
#_0CF22F: AND.w #$00FF
#_0CF232: LSR A
#_0CF233: TAX

#_0CF234: LDA.l .offset_y,X
#_0CF238: AND.w #$00FF
#_0CF23B: SEC
#_0CF23C: SBC.w $0122
#_0CF23F: STA.b $00

#_0CF241: CMP.w #$FFE0

#_0CF244: SEP #$20
#_0CF246: BMI .off_screen

#_0CF248: LDA.l .offset_x,X
#_0CF24C: STA.b $28

#_0CF24E: LDA.b $00
#_0CF250: STA.b $29

#_0CF252: LDA.l .oam_count,X
#_0CF256: TAY

#_0CF257: JSR Attract_DrawPreloadedSprite

.off_screen
#_0CF25A: PLX

#_0CF25B: DEX
#_0CF25C: DEX
#_0CF25D: BPL .next_entity

#_0CF25F: RTL

;===================================================================================================

pool AttractDramatize_Prison

.soldier_offset_x
#_0CF260: dw  32, -12

.soldier_offset_y
#_0CF264: db  24,  24

.soldier_direction
#_0CF266: db $01, $01

.soldier_palette
#_0CF268: db $09, $07

;---------------------------------------------------------------------------------------------------

.maiden_jab_offset_x
#_0CF26A: db  0,  1,  2,  3
#_0CF26E: db  4,  5,  5,  5
#_0CF272: db  4,  4,  3,  3
#_0CF276: db  2,  2,  1,  1

pool off

;---------------------------------------------------------------------------------------------------

AttractDramatize_Prison:
#_0CF27A: STZ.b $2A

#_0CF27C: LDA.b $5F
#_0CF27E: BNE .skip_fade

#_0CF280: JSR Attract_FadeInStep

.skip_fade
#_0CF283: LDA.b #$38
#_0CF285: STA.b $28

#_0CF287: JSR Attract_DrawZelda

#_0CF28A: LDA.b $25
#_0CF28C: CMP.b #$C0
#_0CF28E: BCS .delay_agahnim

#_0CF290: JMP.w AttractDramatize_Agahnim

.delay_agahnim
#_0CF293: LDA.b #$70
#_0CF295: STA.b $29

#_0CF297: DEC.b $50
#_0CF299: BPL .dont_reset_jab

#_0CF29B: LDA.b #$0F
#_0CF29D: STA.b $50

.dont_reset_jab
#_0CF29F: LDX.b $50

#_0CF2A1: LDA.b $31
#_0CF2A3: STA.b $40

#_0CF2A5: LDA.b $30
#_0CF2A7: CLC
#_0CF2A8: ADC.l .maiden_jab_offset_x,X
#_0CF2AC: STA.b $28

#_0CF2AE: BCC .dont_disable_maiden

#_0CF2B0: INC.b $40

.dont_disable_maiden
#_0CF2B2: JSR Attract_DrawKidnappedMaiden

;---------------------------------------------------------------------------------------------------

#_0CF2B5: LDX.b #$01

.next_soldier
#_0CF2B7: STZ.b $03

#_0CF2B9: LDA.b $33
#_0CF2BB: STA.b $06

#_0CF2BD: LDA.b $29
#_0CF2BF: CLC
#_0CF2C0: ADC.l .soldier_offset_y,X
#_0CF2C4: STA.b $02

#_0CF2C6: LDA.l .soldier_direction,X
#_0CF2CA: STA.b $04

#_0CF2CC: LDA.l .soldier_palette,X
#_0CF2D0: STA.b $05

#_0CF2D2: PHX

#_0CF2D3: REP #$20

#_0CF2D5: TXA
#_0CF2D6: ASL A
#_0CF2D7: TAX

#_0CF2D8: LDA.b $30
#_0CF2DA: CLC
#_0CF2DB: ADC.w #$0100

#_0CF2DE: CLC
#_0CF2DF: ADC.l .soldier_offset_x,X
#_0CF2E3: STA.b $00

#_0CF2E5: TAY
#_0CF2E6: STY.b $34

#_0CF2E8: SEP #$20

#_0CF2EA: JSL SpritePrep_ResetProperties
#_0CF2EE: JSL PuppetSoldier

#_0CF2F2: PLX
#_0CF2F3: DEX
#_0CF2F4: BPL .next_soldier

;---------------------------------------------------------------------------------------------------

#_0CF2F6: INC.b $32

#_0CF2F8: LDA.b $32
#_0CF2FA: AND.b #$07
#_0CF2FC: BNE AttractDramatize_Agahnim

#_0CF2FE: LDY.b #$FF

#_0CF300: LDA.b $33
#_0CF302: CMP.b #$02
#_0CF304: BNE .delay_sfx

#_0CF306: STY.b $33

#_0CF308: LDA.b $31
#_0CF30A: BNE .delay_sfx

#_0CF30C: LDA.b $32
#_0CF30E: AND.b #$08
#_0CF310: BEQ .delay_sfx

#_0CF312: LDA.b #$04 ; SFX3.04
#_0CF314: STA.w $012F

.delay_sfx
#_0CF317: INC.b $33

;===================================================================================================

AttractDramatize_Agahnim:
#_0CF319: LDA.b $60
#_0CF31B: ASL A
#_0CF31C: TAX

#_0CF31D: JMP.w (.vectors,X)

.vectors
#_0CF320: dw Dramaghanim_WaitForCue
#_0CF322: dw Dramaghanim_MoveAndSpin

;===================================================================================================

Dramaghanim_AdvanceStory:
#_0CF324: INC.b $23

#_0CF326: DEC.b $22
#_0CF328: DEC.b $22

#_0CF32A: RTL

;===================================================================================================

Dramaghanim_WaitForCue:
#_0CF32B: LDA.b $34
#_0CF32D: BNE .delay

#_0CF32F: INC.b $60

.delay
#_0CF331: REP #$20

#_0CF333: LDA.b $1A
#_0CF335: AND.w #$0001
#_0CF338: BEQ .delay_tick

#_0CF33A: DEC.b $30

.delay_tick
#_0CF33C: LDA.w #AttractAgahnimOAM_size
#_0CF33F: STA.b $2D

#_0CF341: LDA.w #AttractAgahnimOAM_offset_x
#_0CF344: STA.b $02

#_0CF346: LDA.w #AttractAgahnimOAM_offset_y
#_0CF349: STA.b $04

#_0CF34B: LDA.w #AttractAgahnimOAM_char_step0
#_0CF34E: STA.b $06

#_0CF350: LDA.w #AttractAgahnimOAM_prop_step0
#_0CF353: STA.b $08

#_0CF355: SEP #$20

#_0CF357: LDA.b #$58
#_0CF359: STA.b $28

#_0CF35B: LDA.b $2B
#_0CF35D: STA.b $29

#_0CF35F: LDY.b #$05
#_0CF361: JSR Attract_DrawPreloadedSprite

#_0CF364: RTL

;===================================================================================================

pool Dramaghanim_MoveAndSpin

.pointers_char
#_0CF365: dw AttractAgahnimOAM_char_step0
#_0CF367: dw AttractAgahnimOAM_char_step1
#_0CF369: dw AttractAgahnimOAM_char_step2
#_0CF36B: dw AttractAgahnimOAM_char_step3
#_0CF36D: dw AttractAgahnimOAM_char_step4

.pointers_prop
#_0CF36F: dw AttractAgahnimOAM_prop_step0
#_0CF371: dw AttractAgahnimOAM_prop_step1
#_0CF373: dw AttractAgahnimOAM_prop_step2
#_0CF375: dw AttractAgahnimOAM_prop_step0
#_0CF377: dw AttractAgahnimOAM_prop_step0

pool off

;---------------------------------------------------------------------------------------------------

Dramaghanim_MoveAndSpin:
#_0CF379: LDA.b $25
#_0CF37B: CMP.b #$80
#_0CF37D: BCS .continue

#_0CF37F: JSR Attract_DoTextInDungeonScene

#_0CF382: REP #$20

#_0CF384: LDA.b $64

#_0CF386: SEP #$20

#_0CF388: BEQ .continue

#_0CF38A: LDX.b #$08
#_0CF38C: BRA .animate_agahnim

.continue
#_0CF38E: LDX.b #$00

#_0CF390: LDA.b $2B
#_0CF392: CMP.b #$6E
#_0CF394: BEQ .timer_maxed

#_0CF396: DEC.b $2B
#_0CF398: BRA .animate_agahnim

.timer_maxed
#_0CF39A: LDA.b $25
#_0CF39C: CMP.b #$1F
#_0CF39E: BCS .delay_fade

#_0CF3A0: AND.b #$01
#_0CF3A2: BNE .delay_fade

#_0CF3A4: DEC.b $13

.delay_fade
#_0CF3A6: DEC.b $25
#_0CF3A8: BNE .dont_advance_story

#_0CF3AA: JMP.w Dramaghanim_AdvanceStory

;---------------------------------------------------------------------------------------------------

.dont_advance_story
#_0CF3AD: LDA.b $25
#_0CF3AF: CMP.b #$C0
#_0CF3B1: BCS .animate_agahnim

#_0CF3B3: INX
#_0CF3B4: INX

#_0CF3B5: CMP.b #$B8
#_0CF3B7: BCS .animate_agahnim

#_0CF3B9: INX
#_0CF3BA: INX

#_0CF3BB: CMP.b #$B0
#_0CF3BD: BCS .animate_agahnim

#_0CF3BF: INX
#_0CF3C0: INX

#_0CF3C1: CMP.b #$A0
#_0CF3C3: BCS .animate_agahnim

#_0CF3C5: INX
#_0CF3C6: INX

;---------------------------------------------------------------------------------------------------

.animate_agahnim
#_0CF3C7: LDA.b #$A8
#_0CF3C9: STA.b $28

#_0CF3CB: REP #$20

#_0CF3CD: LDA.b $1A
#_0CF3CF: AND.w #$0001
#_0CF3D2: BEQ .delay_tick

#_0CF3D4: DEC.b $30

.delay_tick
#_0CF3D6: LDA.w #AttractAgahnimOAM_size
#_0CF3D9: STA.b $2D

#_0CF3DB: LDA.w #AttractAgahnimOAM_offset_x
#_0CF3DE: STA.b $02

#_0CF3E0: LDA.w #AttractAgahnimOAM_offset_y
#_0CF3E3: STA.b $04

#_0CF3E5: LDA.l .pointers_char,X
#_0CF3E9: STA.b $06

#_0CF3EB: LDA.l .pointers_prop,X
#_0CF3EF: STA.b $08

#_0CF3F1: SEP #$20

#_0CF3F3: LDA.b #$58
#_0CF3F5: STA.b $28

#_0CF3F7: LDA.b $2B
#_0CF3F9: STA.b $29

#_0CF3FB: LDY.b #$05
#_0CF3FD: JSR Attract_DrawPreloadedSprite

#_0CF400: RTL

;===================================================================================================

pool AttractDramatize_AgahnimAltar

.soldier_position_x
#_0CF401: db $30, $C0, $30, $C0, $50, $A0

.soldier_position_y
#_0CF407: db $70, $70, $98, $98, $C0, $C0

.soldier_direction
#_0CF40D: db $00, $01, $00, $01, $03, $03

.soldier_palette
#_0CF413: db $09, $09, $09, $09, $07, $09

;---------------------------------------------------------------------------------------------------

.vectors
#_0CF419: dw Dramagahnim_RaiseTheRoof
#_0CF41B: dw Dramagahnim_ReadySpell
#_0CF41D: dw Dramagahnim_CastSpell
#_0CF41F: dw Dramagahnim_RealizeWhatJustHappened
#_0CF421: dw Dramagahnim_IdleGuiltily

pool off

;---------------------------------------------------------------------------------------------------

AttractDramatize_AgahnimAltar:
#_0CF423: LDA.b $5D
#_0CF425: BEQ .delay

#_0CF427: JMP.w Dramaghanim_AdvanceStory

.delay
#_0CF42A: STZ.b $2A

#_0CF42C: JSL HandleScreenFlash

#_0CF430: LDA.b $5F
#_0CF432: BNE .delay_fade

#_0CF434: JSR Attract_FadeInStep

.delay_fade
#_0CF437: LDA.b $50
#_0CF439: CMP.b #$FF
#_0CF43B: BEQ .delay_tick

#_0CF43D: INC.b $50

.delay_tick
#_0CF43F: LDA.w $0FF9
#_0CF442: BEQ .delay_sfx

#_0CF444: AND.b #$04
#_0CF446: BEQ .delay_sfx

#_0CF448: LDX.b #$2B ; SFX3.2B
#_0CF44A: STX.w $012F

;---------------------------------------------------------------------------------------------------

.delay_sfx
#_0CF44D: LDA.b $60
#_0CF44F: ASL A
#_0CF450: TAX

#_0CF451: JSR (.vectors,X)

;---------------------------------------------------------------------------------------------------

#_0CF454: LDX.b #$05

.next_soldier
#_0CF456: STZ.b $01
#_0CF458: STZ.b $03
#_0CF45A: STZ.b $06

#_0CF45C: LDA.l .soldier_position_x,X
#_0CF460: STA.b $00

#_0CF462: LDA.l .soldier_position_y,X
#_0CF466: STA.b $02

#_0CF468: LDA.l .soldier_direction,X
#_0CF46C: STA.b $04

#_0CF46E: LDA.l .soldier_palette,X
#_0CF472: STA.b $05

#_0CF474: PHX

#_0CF475: JSL SpritePrep_ResetProperties
#_0CF479: JSL PuppetSoldier

#_0CF47D: PLX
#_0CF47E: DEX
#_0CF47F: BPL .next_soldier

;---------------------------------------------------------------------------------------------------

#_0CF481: LDX.b $50
#_0CF483: CPX.b #$A0
#_0CF485: BCC .continue

#_0CF487: LDA.b $30
#_0CF489: CMP.b #$60
#_0CF48B: BEQ .tick_timer

#_0CF48D: DEC.b $32
#_0CF48F: BNE .continue

#_0CF491: DEC.b $30

#_0CF493: LDA.b #$08
#_0CF495: STA.b $32

#_0CF497: BRA .continue

.tick_timer
#_0CF499: INC.b $61

;---------------------------------------------------------------------------------------------------

.continue
#_0CF49B: LDA.b $52
#_0CF49D: BNE .dont_draw_maiden

#_0CF49F: REP #$20

#_0CF4A1: LDA.w #AttractAltarMaidenOAM_size
#_0CF4A4: STA.b $2D

#_0CF4A6: LDA.w #AttractAltarMaidenOAM_offset_x
#_0CF4A9: STA.b $02

#_0CF4AB: LDA.w #AttractAltarMaidenOAM_offset_y
#_0CF4AE: STA.b $04

#_0CF4B0: LDX.b #$00

#_0CF4B2: LDA.b $30
#_0CF4B4: AND.w #$00FF
#_0CF4B7: CMP.w #$0070
#_0CF4BA: BEQ .not_airborne

#_0CF4BC: INX
#_0CF4BD: INX

.not_airborne
#_0CF4BE: LDA.l .maiden_char_pointer,X
#_0CF4C2: STA.b $06

#_0CF4C4: LDA.w #AttractAltarMaidenOAM_prop
#_0CF4C7: STA.b $08

#_0CF4C9: SEP #$20

#_0CF4CB: LDA.b #$74
#_0CF4CD: STA.b $28

#_0CF4CF: LDA.b $30
#_0CF4D1: STA.b $29

#_0CF4D3: LDY.b #$01
#_0CF4D5: JSR Attract_DrawPreloadedSprite

;---------------------------------------------------------------------------------------------------

#_0CF4D8: LDX.b #$0E

#_0CF4DA: LDA.b $30
#_0CF4DC: CMP.b #$68
#_0CF4DE: BCS .adjust_shadow_index

#_0CF4E0: SEC
#_0CF4E1: SBC.b #$68

#_0CF4E3: ASL A
#_0CF4E4: AND.b #$0E
#_0CF4E6: TAX

.adjust_shadow_index
#_0CF4E7: REP #$20

#_0CF4E9: LDA.w #AttractAltarMaidenShadowOAM_size
#_0CF4EC: STA.b $2D

#_0CF4EE: LDA.l .shadow_offset_x_pointer,X
#_0CF4F2: STA.b $02

#_0CF4F4: LDA.w #AttractAltarMaidenShadowOAM_offset_y
#_0CF4F7: STA.b $04

#_0CF4F9: LDA.w #AttractAltarMaidenShadowOAM_char
#_0CF4FC: STA.b $06

#_0CF4FE: LDA.w #AttractAltarMaidenShadowOAM_prop
#_0CF501: STA.b $08

#_0CF503: SEP #$20

#_0CF505: TXA
#_0CF506: LSR A
#_0CF507: TAX

#_0CF508: LDA.b #$74
#_0CF50A: CLC
#_0CF50B: ADC.l .shadow_base_offset_x,X
#_0CF50F: STA.b $28

#_0CF511: LDA.b #$76
#_0CF513: STA.b $29

#_0CF515: LDY.b #$01
#_0CF517: JSR Attract_DrawPreloadedSprite

;---------------------------------------------------------------------------------------------------

.dont_draw_maiden
#_0CF51A: LDA.b $50

#_0CF51C: LSR A
#_0CF51D: LSR A
#_0CF51E: LSR A
#_0CF51F: LSR A

#_0CF520: AND.b #$0E
#_0CF522: TAX

#_0CF523: REP #$20

#_0CF525: LDA.w #AttractAgahnimOAM_size
#_0CF528: STA.b $2D

#_0CF52A: LDA.w #AttractAgahnimOAM_offset_x
#_0CF52D: STA.b $02

#_0CF52F: LDA.w #AttractAgahnimOAM_offset_y
#_0CF532: STA.b $04

#_0CF534: LDA.l .agahnim_char_pointer,X
#_0CF538: STA.b $06

#_0CF53A: LDA.w #AttractAgahnimOAM_prop_step0
#_0CF53D: STA.b $08

#_0CF53F: SEP #$20

#_0CF541: LDA.b #$70
#_0CF543: STA.b $28

#_0CF545: LDA.b #$46
#_0CF547: STA.b $29

#_0CF549: LDY.b #$05
#_0CF54B: JSR Attract_DrawPreloadedSprite

#_0CF54E: RTL

;---------------------------------------------------------------------------------------------------

.shadow_offset_x_pointer
#_0CF54F: dw AttractAltarMaidenShadowOAM_offset_x_step0
#_0CF551: dw AttractAltarMaidenShadowOAM_offset_x_step0
#_0CF553: dw AttractAltarMaidenShadowOAM_offset_x_step1
#_0CF555: dw AttractAltarMaidenShadowOAM_offset_x_step1
#_0CF557: dw AttractAltarMaidenShadowOAM_offset_x_step2
#_0CF559: dw AttractAltarMaidenShadowOAM_offset_x_step2
#_0CF55B: dw AttractAltarMaidenShadowOAM_offset_x_step3
#_0CF55D: dw AttractAltarMaidenShadowOAM_offset_x_step4

;---------------------------------------------------------------------------------------------------

.shadow_base_offset_x
#_0CF55F: db  4,  4,  3,  3
#_0CF563: db  2,  2,  1,  0

;---------------------------------------------------------------------------------------------------

.maiden_char_pointer
#_0CF567: dw AttractAltarMaidenOAM_char_step0
#_0CF569: dw AttractAltarMaidenOAM_char_step1

;---------------------------------------------------------------------------------------------------

.agahnim_char_pointer
#_0CF56B: dw AttractAgahnimOAM_char_step3
#_0CF56D: dw AttractAgahnimOAM_char_step5
#_0CF56F: dw AttractAgahnimOAM_char_step3
#_0CF571: dw AttractAgahnimOAM_char_step6
#_0CF573: dw AttractAgahnimOAM_char_step3
#_0CF575: dw AttractAgahnimOAM_char_step5
#_0CF577: dw AttractAgahnimOAM_char_step3
#_0CF579: dw AttractAgahnimOAM_char_step4

;===================================================================================================

Dramagahnim_RaiseTheRoof:
#_0CF57B: LDA.b $61
#_0CF57D: BEQ .exit

#_0CF57F: INC.b $60

.exit
#_0CF581: RTS

;===================================================================================================

DramagahnimSpellCharPointer:
#_0CF582: dw DramagahnimSpellOAM_char_step0
#_0CF584: dw DramagahnimSpellOAM_char_step1

;---------------------------------------------------------------------------------------------------

DramagahnimSpellPropPointer:
#_0CF586: dw DramagahnimSpellOAM_prop_step0
#_0CF588: dw DramagahnimSpellOAM_prop_step1

;---------------------------------------------------------------------------------------------------

pool Dramagahnim_ReadySpell

.oam_count
#_0CF58A: db  1
#_0CF58B: db  1
#_0CF58C: db  1
#_0CF58D: db  5
#_0CF58E: db  5
#_0CF58F: db  9
#_0CF590: db  9
#_0CF591: db 13

pool off

;---------------------------------------------------------------------------------------------------

Dramagahnim_ReadySpell:
#_0CF592: LDA.b $1A
#_0CF594: LSR A
#_0CF595: AND.b #$02
#_0CF597: TAX

#_0CF598: REP #$20

#_0CF59A: LDA.w #DramagahnimSpellOAM_size
#_0CF59D: STA.b $2D

#_0CF59F: LDA.w #DramagahnimSpellOAM_offset_x
#_0CF5A2: STA.b $02

#_0CF5A4: LDA.w #DramagahnimSpellOAM_offset_y
#_0CF5A7: STA.b $04

#_0CF5A9: LDA.l DramagahnimSpellCharPointer,X
#_0CF5AD: STA.b $06

#_0CF5AF: LDA.l DramagahnimSpellPropPointer,X
#_0CF5B3: STA.b $08

;---------------------------------------------------------------------------------------------------

#_0CF5B5: SEP #$20

#_0CF5B7: LDA.b #$6E
#_0CF5B9: STA.b $28

#_0CF5BB: LDA.b #$48
#_0CF5BD: STA.b $29

#_0CF5BF: LDA.b $51
#_0CF5C1: LSR A
#_0CF5C2: AND.b #$07
#_0CF5C4: TAX

#_0CF5C5: LDA.l .oam_count,X
#_0CF5C9: TAY

#_0CF5CA: JSR Attract_DrawPreloadedSprite

;---------------------------------------------------------------------------------------------------

#_0CF5CD: LDA.b $51
#_0CF5CF: BNE .delay_sfx

#_0CF5D1: LDY.b $63
#_0CF5D3: CPY.b #$70
#_0CF5D5: BNE .delay_sfx

#_0CF5D7: LDX.b #$27 ; SFX3.27
#_0CF5D9: STX.w $012F

;---------------------------------------------------------------------------------------------------

.delay_sfx
#_0CF5DC: CMP.b #$0F
#_0CF5DE: BEQ .advance

#_0CF5E0: CMP.b #$06
#_0CF5E2: BNE .delay_other_sfx

#_0CF5E4: LDX.b #$90
#_0CF5E6: STX.w $0FF9

#_0CF5E9: LDX.b #$2B ; SFX3.2B
#_0CF5EB: STX.w $012F

;---------------------------------------------------------------------------------------------------

.delay_other_sfx
#_0CF5EE: LDA.b $63
#_0CF5F0: BEQ .delay_tick

#_0CF5F2: DEC.b $63

#_0CF5F4: RTS

;---------------------------------------------------------------------------------------------------

.delay_tick
#_0CF5F5: INC.b $51

#_0CF5F7: RTS

;---------------------------------------------------------------------------------------------------

.advance
#_0CF5F8: INC.b $60

#_0CF5FA: RTS

;===================================================================================================

pool Dramagahnim_CastSpell

.oam_count
#_0CF5FB: db  3
#_0CF5FC: db  3
#_0CF5FD: db  7
#_0CF5FE: db  7
#_0CF5FF: db 11
#_0CF600: db 11
#_0CF601: db 13
#_0CF602: db 13

;---------------------------------------------------------------------------------------------------

.index_offset
#_0CF603: dw 10
#_0CF605: dw 10
#_0CF607: dw  6
#_0CF609: dw  6
#_0CF60B: dw  2
#_0CF60D: dw  2
#_0CF60F: dw  0
#_0CF611: dw  0

pool off

;---------------------------------------------------------------------------------------------------

Dramagahnim_CastSpell:
#_0CF613: PHB
#_0CF614: PHK
#_0CF615: PLB

#_0CF616: LDA.b $1A
#_0CF618: LSR A
#_0CF619: AND.b #$02
#_0CF61B: TAX

#_0CF61C: LDA.b $51
#_0CF61E: LSR A
#_0CF61F: AND.b #$07
#_0CF621: STA.b $00

#_0CF623: ASL A
#_0CF624: TAY

;---------------------------------------------------------------------------------------------------

#_0CF625: REP #$20

#_0CF627: LDA.w #DramagahnimSpellOAM_size
#_0CF62A: CLC
#_0CF62B: ADC.w .index_offset,Y
#_0CF62E: STA.b $2D

#_0CF630: LDA.w #DramagahnimSpellOAM_offset_x
#_0CF633: CLC
#_0CF634: ADC.w .index_offset,Y
#_0CF637: STA.b $02

#_0CF639: LDA.w #DramagahnimSpellOAM_offset_y
#_0CF63C: CLC
#_0CF63D: ADC.w .index_offset,Y
#_0CF640: STA.b $04

#_0CF642: LDA.w DramagahnimSpellCharPointer,X
#_0CF645: CLC
#_0CF646: ADC.w .index_offset,Y
#_0CF649: STA.b $06

#_0CF64B: LDA.w DramagahnimSpellPropPointer,X
#_0CF64E: CLC
#_0CF64F: ADC.w .index_offset,Y
#_0CF652: STA.b $08

;---------------------------------------------------------------------------------------------------

#_0CF654: SEP #$20

#_0CF656: LDA.b #$6E
#_0CF658: STA.b $28

#_0CF65A: LDA.b #$48
#_0CF65C: STA.b $29

#_0CF65E: LDX.b $00

#_0CF660: LDA.w .oam_count,X
#_0CF663: TAY

#_0CF664: JSR Attract_DrawPreloadedSprite

#_0CF667: PLB

;---------------------------------------------------------------------------------------------------

#_0CF668: LDA.b $51
#_0CF66A: BNE .delay_tick

#_0CF66C: DEC.b $62
#_0CF66E: BEQ Dramagahnim_ReadySpell_advance

#_0CF670: BRA .exit

.delay_tick
#_0CF672: DEC.b $51

.exit
#_0CF674: RTS

;===================================================================================================

pool Dramagahnim_RealizeWhatJustHappened

.pointers_offset_x
#_0CF675: dw AttractTelebubbleOAM_step0_offset_x
#_0CF677: dw AttractTelebubbleOAM_step1_offset_x

.pointers_offset_y
#_0CF679: dw AttractTelebubbleOAM_step0_offset_y
#_0CF67B: dw AttractTelebubbleOAM_step1_offset_y

.pointers_char
#_0CF67D: dw AttractTelebubbleOAM_step0_char
#_0CF67F: dw AttractTelebubbleOAM_step1_char

.pointers_prop
#_0CF681: dw AttractTelebubbleOAM_step0_prop
#_0CF683: dw AttractTelebubbleOAM_step1_prop

;---------------------------------------------------------------------------------------------------

.position_x
#_0CF685: db $78
#_0CF686: db $70

.object_count
#_0CF687: db $00
#_0CF688: db $01

pool off

;---------------------------------------------------------------------------------------------------

Dramagahnim_RealizeWhatJustHappened:
#_0CF689: LDA.b $51
#_0CF68B: CMP.b #$06
#_0CF68D: BNE .delay_sfx

#_0CF68F: INC.b $52

#_0CF691: LDA.b #$33 ; SFX2.33
#_0CF693: STA.w $012E

.delay_sfx
#_0CF696: CMP.b #$40
#_0CF698: BNE .delay_tick

#_0CF69A: LDA.b #$E0
#_0CF69C: STA.b $51

#_0CF69E: INC.b $60

.delay_tick
#_0CF6A0: CMP.b #$0F
#_0CF6A2: BCS .skip_draw

#_0CF6A4: LSR A
#_0CF6A5: LSR A
#_0CF6A6: AND.b #$02
#_0CF6A8: TAX

#_0CF6A9: REP #$20

#_0CF6AB: LDA.w #AttractTelebubbleOAM_size
#_0CF6AE: STA.b $2D

#_0CF6B0: LDA.l .pointers_offset_x,X
#_0CF6B4: STA.b $02

#_0CF6B6: LDA.l .pointers_offset_y,X
#_0CF6BA: STA.b $04

#_0CF6BC: LDA.l .pointers_char,X
#_0CF6C0: STA.b $06

#_0CF6C2: LDA.l .pointers_prop,X
#_0CF6C6: STA.b $08

;---------------------------------------------------------------------------------------------------

#_0CF6C8: SEP #$20

#_0CF6CA: TXA
#_0CF6CB: LSR A
#_0CF6CC: TAX

#_0CF6CD: LDA.l .position_x,X
#_0CF6D1: STA.b $28

#_0CF6D3: LDA.b #$60
#_0CF6D5: STA.b $29

#_0CF6D7: LDA.l .object_count,X
#_0CF6DB: TAY

#_0CF6DC: JSR Attract_DrawPreloadedSprite

.skip_draw
#_0CF6DF: INC.b $51

#_0CF6E1: RTS

;===================================================================================================

Dramagahnim_IdleGuiltily:
#_0CF6E2: JSR Attract_DoTextInDungeonScene

#_0CF6E5: REP #$20

#_0CF6E7: LDA.b $64

#_0CF6E9: SEP #$20

#_0CF6EB: BNE .exit

#_0CF6ED: LDA.b $51
#_0CF6EF: CMP.b #$1F
#_0CF6F1: BCS .delay_fade

#_0CF6F3: AND.b #$01
#_0CF6F5: BNE .delay_fade

#_0CF6F7: DEC.b $13

.delay_fade
#_0CF6F9: DEC.b $51
#_0CF6FB: BNE .exit

#_0CF6FD: INC.b $5D

.exit
#_0CF6FF: RTS

;===================================================================================================

Attract_SkipToFileSelect:
#_0CF700: DEC.b $13
#_0CF702: BNE .exit

#_0CF704: JSL EnableForceBlank

#_0CF708: LDA.b #$13
#_0CF70A: STA.w BG1SC

#_0CF70D: LDA.b #$03
#_0CF70F: STA.w BG2SC

#_0CF712: REP #$20

#_0CF714: JSL Attract_SetUpConclusionHDMA

#_0CF718: REP #$20

#_0CF71A: STZ.w $063A
#_0CF71D: STZ.w $0638

#_0CF720: STZ.w $0120
#_0CF723: STZ.w $0124

#_0CF726: STZ.b $EA

#_0CF728: SEP #$20

#_0CF72A: JMP.w FadeMusicAndResetSRAMMirror

.exit
#_0CF72D: RTL

;===================================================================================================

pool Attract_BuildNextImageTilemap

.stripes_pointers
#_0CF72E: dw AttractImage0Stripes
#_0CF730: dw AttractImage1Stripes
#_0CF732: dw AttractImage2Stripes
#_0CF734: dw AttractImage3Stripes

.stripes_sizes
#_0CF736: dw $009C
#_0CF738: dw $00EC
#_0CF73A: dw $00C6
#_0CF73C: dw $0108

pool off

;---------------------------------------------------------------------------------------------------

Attract_BuildNextImageTilemap:
#_0CF73E: REP #$20

#_0CF740: LDX.b $26

#_0CF742: LDA.l .stripes_sizes,X
#_0CF746: STA.b $00

#_0CF748: LDA.l .stripes_pointers,X
#_0CF74C: STA.b $02

#_0CF74E: LDX.b #Attract_BuildNextImageTilemap>>16
#_0CF750: STX.b $04

#_0CF752: REP #$10

#_0CF754: LDY.b $00

.copy_next
#_0CF756: LDA.b [$02],Y
#_0CF758: STA.w $1002,Y

#_0CF75B: DEY
#_0CF75C: DEY
#_0CF75D: BPL .copy_next

#_0CF75F: SEP #$30

#_0CF761: LDA.b #$01
#_0CF763: STA.b $14

#_0CF765: RTS

;===================================================================================================

Attract_DoTextInDungeonScene:
#_0CF766: LDA.b $E8
#_0CF768: STA.b $20

#_0CF76A: LDA.b $E9
#_0CF76C: STA.b $21

#_0CF76E: STZ.b $F2
#_0CF770: STZ.b $F6
#_0CF772: STZ.b $F4

#_0CF774: JSL RenderText

#_0CF778: REP #$20

#_0CF77A: LDA.b $64

#_0CF77C: BEQ .exit

#_0CF77E: DEC.b $64

.exit
#_0CF780: SEP #$20

#_0CF782: RTS

;===================================================================================================

Attract_ControlMapZoom:
#_0CF783: REP #$10

#_0CF785: LDA.w $0637
#_0CF788: STA.w WRMPYA

#_0CF78B: LDX.w #$01BE

.copy_next
#_0CF78E: LDA.l WorldMapHDMA_ZoomedOut_Part1+0,X
#_0CF792: STA.w WRMPYB

#_0CF795: NOP
#_0CF796: NOP
#_0CF797: NOP
#_0CF798: NOP

#_0CF799: LDA.w RDMPYH
#_0CF79C: STA.b $00

#_0CF79E: LDA.l WorldMapHDMA_ZoomedOut_Part1+1,X
#_0CF7A2: STA.w WRMPYB

#_0CF7A5: NOP

#_0CF7A6: LDA.b $00
#_0CF7A8: CLC
#_0CF7A9: ADC.w RDMPYL
#_0CF7AC: STA.w $1B00,X

#_0CF7AF: LDA.w RDMPYH
#_0CF7B2: ADC.b #$00
#_0CF7B4: STA.w $1B01,X

#_0CF7B7: DEX
#_0CF7B8: DEX
#_0CF7B9: BPL .copy_next

#_0CF7BB: SEP #$10

#_0CF7BD: RTS

;===================================================================================================

AttractBG1Tiles:
#_0CF7BE: dw $01A0, $09A6, $89A5, $01A0
#_0CF7C6: dw $09A5, $01A0, $01A0, $89A6
#_0CF7CE: dw $49A5, $01A0, $01A0, $49A5
#_0CF7D6: dw $01A0, $89A5, $C9A5, $01A0

;---------------------------------------------------------------------------------------------------

AttractBG2Tiles:
#_0CF7DE: dw $09A1, $09A2, $09A3, $09A4

;---------------------------------------------------------------------------------------------------

Attract_BuildBackgrounds:
#_0CF7E6: LDA.b #$09
#_0CF7E8: STA.b $94

#_0CF7EA: LDA.b #$17
#_0CF7EC: STA.b $1C
#_0CF7EE: STZ.b $1D

#_0CF7F0: LDA.b #$10
#_0CF7F2: STA.w BG1SC

#_0CF7F5: LDA.b #$00
#_0CF7F7: STA.w BG2SC

#_0CF7FA: PHB
#_0CF7FB: PHK
#_0CF7FC: PLB

;---------------------------------------------------------------------------------------------------

#_0CF7FD: REP #$30

#_0CF7FF: LDX.w #$0000

#_0CF802: LDA.w #AttractBG1Tiles
#_0CF805: STA.b $30

.next_stripe_bg1
#_0CF807: TXA
#_0CF808: AND.w #$0007
#_0CF80B: TAY

.next_bg1
#_0CF80C: LDA.b ($30),Y
#_0CF80E: STA.w $1006,X

#_0CF811: INY
#_0CF812: INY

#_0CF813: INX
#_0CF814: INX

#_0CF815: TYA
#_0CF816: AND.w #$0007
#_0CF819: BNE .next_bg1

#_0CF81B: TXA
#_0CF81C: AND.w #$003F
#_0CF81F: BNE .next_stripe_bg1

#_0CF821: LDA.b $30
#_0CF823: CLC
#_0CF824: ADC.w #$0008
#_0CF827: STA.b $30

#_0CF829: CPX.w #$0100
#_0CF82C: BNE .next_stripe_bg1

;---------------------------------------------------------------------------------------------------

#_0CF82E: LDA.w #$1000
#_0CF831: STA.b $30

#_0CF833: JSR Attract_TriggerBGDMA

;---------------------------------------------------------------------------------------------------

#_0CF836: REP #$30

#_0CF838: LDX.w #$0000

#_0CF83B: LDA.w #AttractBG2Tiles
#_0CF83E: STA.b $30

.next_stripe_bg2
#_0CF840: TXA
#_0CF841: AND.w #$0003
#_0CF844: TAY

.next_bg2
#_0CF845: LDA.b ($30),Y
#_0CF847: STA.w $1006,X

#_0CF84A: INY
#_0CF84B: INY

#_0CF84C: INX
#_0CF84D: INX

#_0CF84E: TYA
#_0CF84F: AND.w #$0003
#_0CF852: BNE .next_bg2

#_0CF854: TXA
#_0CF855: AND.w #$003F
#_0CF858: BNE .next_stripe_bg2

#_0CF85A: TXA
#_0CF85B: AND.w #$0040

#_0CF85E: LSR A
#_0CF85F: LSR A
#_0CF860: LSR A
#_0CF861: LSR A

#_0CF862: CLC
#_0CF863: ADC.w #AttractBG2Tiles
#_0CF866: STA.b $30

#_0CF868: CPX.w #$0100
#_0CF86B: BNE .next_stripe_bg2

#_0CF86D: LDA.w #$0000
#_0CF870: STA.b $30

#_0CF872: JSR Attract_TriggerBGDMA

#_0CF875: SEP #$30

#_0CF877: PLB

#_0CF878: RTS

;===================================================================================================

Attract_TriggerBGDMA:
#_0CF879: SEP #$10

#_0CF87B: LDX.b #$07

#_0CF87D: LDA.b $30
#_0CF87F: STA.w VMADDR

.next
#_0CF882: LDY.b #$80
#_0CF884: STY.w VMAIN

#_0CF887: LDA.w #$1801
#_0CF88A: STA.w DMA0MODE

#_0CF88D: LDA.w #$1006
#_0CF890: STA.w DMA0ADDRL

#_0CF893: LDY.b #$00
#_0CF895: STY.w DMA0ADDRB

#_0CF898: LDA.w #$0100
#_0CF89B: STA.w DMA0SIZE

#_0CF89E: LDY.b #$01
#_0CF8A0: STY.w MDMAEN

#_0CF8A3: DEX
#_0CF8A4: BPL .next

#_0CF8A6: RTS

;===================================================================================================

AttractOAMData:

.king_size
#_0CF8A7: db $02, $02, $02, $02

.king_offset_x
#_0CF8AB: db  16,   0,  16,   0

.king_offset_y
#_0CF8AF: db  16,  16,   0,   0

.king_char
#_0CF8B3: db $2A, $2A, $0A, $0A

.king_prop
#_0CF8B7: db $7B, $3B, $7B, $3B

;---------------------------------------------------------------------------------------------------

.mantle_size
#_0CF8BB: db $02, $02, $02, $02, $02, $02

.mantle_offset_x
#_0CF8C1: db   0,  16,  32,   0,  16,  32

.mantle_offset_y
#_0CF8C7: db   0,   0,   0,  16,  16,  16

.mantle_char
#_0CF8CD: db $0C, $0E, $0C, $2C, $2E, $2C

.mantle_prop
#_0CF8D3: db $31, $31, $71, $31, $31, $71

;---------------------------------------------------------------------------------------------------

AttractAgahnimOAM:

.size
#_0CF8D9: db $02, $02, $02, $02, $02, $02

.offset_x
#_0CF8DF: db   5,  11,   0,  16,   0,  16

.offset_y
#_0CF8E5: db  25,  25,   0,   0,  16,  16

;---------------------------------------------------------------------------------------------------

.char_step3
#_0CF8EB: db $6C, $6C, $82, $82, $A2, $A2

.char_step5
#_0CF8F1: db $6C, $6C, $80, $82, $A0, $A2

.char_step6
#_0CF8F7: db $6C, $6C, $82, $80, $A2, $A0

.char_step4
#_0CF8FD: db $6C, $6C, $80, $80, $A0, $A0

.char_step0
#_0CF903: db $6C, $6C, $84, $84, $A4, $A4

.char_step1
#_0CF909: db $6C, $6C, $C4, $C2, $E4, $E6

.char_step2
#_0CF90F: db $6C, $6C, $88, $8A, $A8, $AA

;---------------------------------------------------------------------------------------------------

.prop_step0
#_0CF915: db $38, $38, $3B, $7B, $3B, $7B

.prop_step1
#_0CF91B: db $38, $38, $3B, $3B, $3B, $3B

.prop_step2
#_0CF921: db $38, $38, $3B, $3B, $3B, $3B

;---------------------------------------------------------------------------------------------------

AttractAltarMaidenOAM:

.size
#_0CF927: db $02, $02

.offset_x
#_0CF929: db $00, $08

.offset_y
#_0CF92B: db $00, $00

.char_step0
#_0CF92D: db $03, $04

.char_step1
#_0CF92F: db $00, $01

.prop
#_0CF931: db $3D, $3D

;---------------------------------------------------------------------------------------------------

AttractAltarMaidenShadowOAM:

.size
#_0CF933: db $02, $02

;---------------------------------------------------------------------------------------------------

.offset_x_step4
#_0CF935: db $00, $08

.offset_x_step3
#_0CF937: db $00, $06

.offset_x_step2
#_0CF939: db $00, $04

.offset_x_step1
#_0CF93B: db $00, $02

.offset_x_step0
#_0CF93D: db $00, $00

;---------------------------------------------------------------------------------------------------

.offset_y
#_0CF93F: db $00, $00

.char
#_0CF941: db $6C, $6C

.prop
#_0CF943: db $38, $38

;===================================================================================================

DramagahnimSpellOAM:

.size
#_0CF945: db $00, $00, $00, $00
#_0CF949: db $00, $00, $00, $00
#_0CF94D: db $00, $00, $02, $02
#_0CF951: db $02, $02

.offset_x
#_0CF953: db   0,  28,  -2,  30
#_0CF957: db  -2,  30,   0,  28
#_0CF95B: db   0,  28,   2,  18
#_0CF95F: db   2,  18

.offset_y
#_0CF961: db   0,   0,   3,   3
#_0CF965: db  11,  11,  16,  16
#_0CF969: db  24,  24,  16,  16
#_0CF96D: db  32,  32

;---------------------------------------------------------------------------------------------------

.char_step0
#_0CF96F: db $CE, $CE, $26, $26
#_0CF973: db $36, $36, $26, $26
#_0CF977: db $36, $36, $20, $20
#_0CF97B: db $20, $20

.char_step1
#_0CF97D: db $CE, $CE, $26, $26
#_0CF981: db $36, $36, $26, $26
#_0CF985: db $36, $36, $22, $22
#_0CF989: db $22, $22

;---------------------------------------------------------------------------------------------------

.prop_step0
#_0CF98B: db $35, $35, $75, $35
#_0CF98F: db $75, $35, $75, $35
#_0CF993: db $75, $35, $35, $75
#_0CF997: db $B5, $F5

.prop_step1
#_0CF999: db $37, $37, $77, $37
#_0CF99D: db $77, $37, $77, $37
#_0CF9A1: db $77, $37, $37, $77
#_0CF9A5: db $B7, $F7

;---------------------------------------------------------------------------------------------------

AttractTelebubbleOAM:

.size
#_0CF9A7: db $02, $02

.step0_offset_x
#_0CF9A9: db   0

.step0_offset_y
#_0CF9AA: db   0

.step0_char
#_0CF9AB: db $C6

.step0_prop
#_0CF9AC: db $3D

;---------------------------------------------------------------------------------------------------

.step1_offset_x
#_0CF9AD: db   0,  16

.step1_offset_y
#_0CF9AF: db   0,   0

.step1_char
#_0CF9B1: db $24, $24

.step1_prop
#_0CF9B3: db $35, $75

;===================================================================================================

Attract_DrawPreloadedSprite:
#_0CF9B5: PHB
#_0CF9B6: PHK
#_0CF9B7: PLB

.next_object
#_0CF9B8: LDX.b $2A

#_0CF9BA: LDA.b ($2D),Y
#_0CF9BC: STA.w $0A60,X

#_0CF9BF: TXA
#_0CF9C0: ASL A
#_0CF9C1: ASL A
#_0CF9C2: TAX

#_0CF9C3: LDA.b ($02),Y
#_0CF9C5: CLC
#_0CF9C6: ADC.b $28
#_0CF9C8: STA.w $0900,X

#_0CF9CB: LDA.b ($04),Y
#_0CF9CD: CLC
#_0CF9CE: ADC.b $29
#_0CF9D0: STA.w $0901,X

#_0CF9D3: LDA.b ($06),Y
#_0CF9D5: STA.w $0902,X

#_0CF9D8: LDA.b ($08),Y
#_0CF9DA: STA.w $0903,X

#_0CF9DD: INC.b $2A

#_0CF9DF: DEY
#_0CF9E0: BPL .next_object

#_0CF9E2: PLB

#_0CF9E3: RTS

;===================================================================================================

pool Attract_DrawZelda

.head_char
#_0CF9E4: db $28

.body_char
#_0CF9E5: db $2A

.head_prop
#_0CF9E6: db $29

.body_prop
#_0CF9E7: db $29

pool off

;---------------------------------------------------------------------------------------------------

Attract_DrawZelda:
#_0CF9E8: LDX.b $2A

#_0CF9EA: LDA.b #$02
#_0CF9EC: STA.w $0A60,X

#_0CF9EF: TXA
#_0CF9F0: ASL A
#_0CF9F1: ASL A
#_0CF9F2: TAX

#_0CF9F3: LDA.b #$60
#_0CF9F5: STA.w $0900,X
#_0CF9F8: STA.w $0904,X

#_0CF9FB: LDA.b $28
#_0CF9FD: STA.w $0901,X

#_0CFA00: CLC
#_0CFA01: ADC.b #$0A
#_0CFA03: STA.w $0905,X

#_0CFA06: LDA.l .head_char
#_0CFA0A: STA.w $0902,X

#_0CFA0D: LDA.l .body_char
#_0CFA11: STA.w $0906,X

#_0CFA14: LDA.l .head_prop
#_0CFA18: STA.w $0903,X

#_0CFA1B: LDA.l .body_prop
#_0CFA1F: STA.w $0907,X

#_0CFA22: INC.b $2A
#_0CFA24: INC.b $2A

#_0CFA26: RTS

;===================================================================================================

pool Attract_DrawKidnappedMaiden

.head_char
#_0CFA27: db $06

.body_char
#_0CFA28: db $08, $0A

.offset_y
#_0CFA2A: db   0,   1

.body_offset_y
#_0CFA2C: db  10,   9

.head_prop
#_0CFA2E: db $3D

.body_prop
#_0CFA2F: db $3D

pool off

;---------------------------------------------------------------------------------------------------

Attract_DrawKidnappedMaiden:
#_0CFA30: PHB
#_0CFA31: PHK
#_0CFA32: PLB

#_0CFA33: PHY

#_0CFA34: LDX.b $2A

#_0CFA36: LDA.b #$02
#_0CFA38: LDY.b $40
#_0CFA3A: BEQ .step_0

#_0CFA3C: ORA.b #$01

.step_0
#_0CFA3E: STA.w $0A60,X
#_0CFA41: STA.w $0A61,X

#_0CFA44: TXA
#_0CFA45: ASL A
#_0CFA46: ASL A
#_0CFA47: TAX

#_0CFA48: LDA.b $28
#_0CFA4A: STA.w $0900,X
#_0CFA4D: STA.w $0904,X

#_0CFA50: LDA.b $32

#_0CFA52: LSR A
#_0CFA53: LSR A
#_0CFA54: LSR A

#_0CFA55: AND.b #$01
#_0CFA57: TAY

#_0CFA58: LDA.b $29
#_0CFA5A: CLC
#_0CFA5B: ADC.w .offset_y,Y
#_0CFA5E: STA.w $0901,X

#_0CFA61: CLC
#_0CFA62: ADC.w .body_offset_y,Y
#_0CFA65: STA.w $0905,X

#_0CFA68: LDA.w .head_char
#_0CFA6B: STA.w $0902,X

#_0CFA6E: LDA.w .body_char,Y
#_0CFA71: STA.w $0906,X

#_0CFA74: LDA.w .head_prop
#_0CFA77: STA.w $0903,X

#_0CFA7A: LDA.w .body_prop
#_0CFA7D: STA.w $0907,X

#_0CFA80: INC.b $2A
#_0CFA82: INC.b $2A

#_0CFA84: PLY
#_0CFA85: PLB

#_0CFA86: RTS

;===================================================================================================

Attract_WindowingHDMA:

.table_a
#_0CFA87: db $20 : db $FF, $00
#_0CFA8A: db $50 : db $18, $E0
#_0CFA8D: db $50 : db $18, $E0
#_0CFA90: db $01 : db $FF, $00
#_0CFA93: db $00

.table_b
#_0CFA94: db $48 : db $FF, $00
#_0CFA97: db $30 : db $30, $D8
#_0CFA9A: db $01 : db $FF, $00
#_0CFA9D: db $00

;---------------------------------------------------------------------------------------------------

.settings
#_0CFA9E: db $01
#_0CFA9F: db WH0
#_0CFAA0: dl .table_a

;===================================================================================================

Attract_SetUpWindowingHDMA:
#_0CFAA3: LDX.b #$04

.next
#_0CFAA5: LDA.l Attract_WindowingHDMA_settings,X
#_0CFAA9: STA.w DMA6MODE,X
#_0CFAAC: STA.w DMA7MODE,X

#_0CFAAF: DEX
#_0CFAB0: BPL .next

#_0CFAB2: REP #$20

#_0CFAB4: LDA.w #Attract_WindowingHDMA_table_b
#_0CFAB7: STA.w DMA7ADDRL

#_0CFABA: SEP #$20

#_0CFABC: LDA.b #WH2
#_0CFABE: STA.w DMA7PORT

#_0CFAC1: RTS

;===================================================================================================

AttractImage0Stripes:
#_0CFAC2: dw $6561, $2840 ; VRAM $C2CA | 42 bytes | Fixed horizontal
#_0CFAC6: dw $3500

#_0CFAC8: dw $8561, $2840 ; VRAM $C30A | 42 bytes | Fixed horizontal
#_0CFACC: dw $3510

#_0CFACE: dw $A561, $2900 ; VRAM $C34A | 42 bytes | Horizontal
#_0CFAD2: dw $3501, $3502, $3501, $3502, $3501, $3502, $3501, $3502
#_0CFAE2: dw $3501, $3103, $7103, $3502, $3501, $3502, $3501, $3502
#_0CFAF2: dw $3501, $3502, $3501, $3502, $3501

#_0CFAFC: dw $C561, $2900 ; VRAM $C38A | 42 bytes | Horizontal
#_0CFB00: dw $3511, $3512, $3511, $3512, $3511, $3512, $3511, $3512
#_0CFB10: dw $3511, $3513, $7513, $3512, $3511, $3512, $3511, $3512
#_0CFB20: dw $3511, $3512, $3511, $3512, $3511

#_0CFB2A: dw $E561, $2900 ; VRAM $C3CA | 42 bytes | Horizontal
#_0CFB2E: dw $3520, $3521, $3520, $3521, $3520, $3521, $3520, $3521
#_0CFB3E: dw $3520, $3521, $3520, $3521, $3520, $3521, $3520, $3521
#_0CFB4E: dw $3520, $3521, $3520, $3521, $3520

#_0CFB58: dw $0562, $2840 ; VRAM $C40A | 42 bytes | Fixed horizontal
#_0CFB5C: dw $B500

#_0CFB5E: db $FF ; end of stripes data

;===================================================================================================

AttractImage1Stripes:
#_0CFB5F: dw $6561, $2840 ; VRAM $C2CA | 42 bytes | Fixed horizontal
#_0CFB63: dw $3500

#_0CFB65: dw $8561, $1300 ; VRAM $C30A | 20 bytes | Horizontal
#_0CFB69: dw $3510, $754E, $356E, $3510, $354E, $3510, $354C, $3510
#_0CFB79: dw $754E, $3549

#_0CFB7D: dw $8F61, $0840 ; VRAM $C31E | 10 bytes | Fixed horizontal
#_0CFB81: dw $3510

#_0CFB83: dw $9461, $0B00 ; VRAM $C328 | 12 bytes | Horizontal
#_0CFB87: dw $754E, $356E, $3510, $354E, $3510, $354C

#_0CFB93: dw $A561, $2900 ; VRAM $C34A | 42 bytes | Horizontal
#_0CFB97: dw $755F, $755E, $357E, $357F, $355E, $355F, $354D, $755F
#_0CFBA7: dw $755E, $354A, $354B, $3510, $7549, $3510, $755F, $755E
#_0CFBB7: dw $357E, $357F, $355E, $355F, $354D

#_0CFBC1: dw $C561, $2900 ; VRAM $C38A | 42 bytes | Horizontal
#_0CFBC5: dw $3550, $3551, $3552, $3553, $3554, $3555, $3556, $3557
#_0CFBD5: dw $3558, $3559, $355A, $355B, $355C, $355D, $3550, $3551
#_0CFBE5: dw $3552, $3553, $3554, $3555, $3556

#_0CFBEF: dw $E561, $2900 ; VRAM $C3CA | 42 bytes | Horizontal
#_0CFBF3: dw $3560, $3561, $3562, $3563, $3564, $3565, $3566, $3567
#_0CFC03: dw $3568, $3569, $356A, $356B, $356C, $356D, $3560, $3561
#_0CFC13: dw $3562, $3563, $3564, $3565, $3566

#_0CFC1D: dw $0562, $2900 ; VRAM $C40A | 42 bytes | Horizontal
#_0CFC21: dw $3570, $3571, $3572, $3573, $3574, $3575, $3576, $3577
#_0CFC31: dw $3578, $3579, $357A, $357B, $357C, $357D, $3570, $3571
#_0CFC41: dw $3572, $3573, $3574, $3575, $3576

#_0CFC4B: db $FF ; end of stripes data

;===================================================================================================

AttractImage2Stripes:
#_0CFC4C: dw $6561, $2840 ; VRAM $C2CA | 42 bytes | Fixed horizontal
#_0CFC50: dw $3500

#_0CFC52: dw $8561, $2840 ; VRAM $C30A | 42 bytes | Fixed horizontal
#_0CFC56: dw $3510

#_0CFC58: dw $A561, $1D00 ; VRAM $C34A | 30 bytes | Horizontal
#_0CFC5C: dw $3522, $3523, $3510, $3522, $3523, $3510, $3522, $3523
#_0CFC6C: dw $3510, $3522, $3523, $3510, $7510, $7523, $7522

#_0CFC7A: dw $B461, $0640 ; VRAM $C368 | 8 bytes | Fixed horizontal
#_0CFC7E: dw $3510

#_0CFC80: dw $B861, $0300 ; VRAM $C370 | 4 bytes | Horizontal
#_0CFC84: dw $7523, $7522

#_0CFC88: dw $C561, $2900 ; VRAM $C38A | 42 bytes | Horizontal
#_0CFC8C: dw $3504, $3505, $3506, $3504, $3505, $3506, $3504, $3505
#_0CFC9C: dw $3506, $3504, $3505, $3506, $7506, $7505, $7504, $7510
#_0CFCAC: dw $7523, $7522, $7506, $7505, $7504

#_0CFCB6: dw $E561, $2900 ; VRAM $C3CA | 42 bytes | Horizontal
#_0CFCBA: dw $3514, $3515, $3516, $3514, $3515, $3516, $3514, $3515
#_0CFCCA: dw $3516, $3514, $3515, $3516, $7516, $7515, $7514, $7506
#_0CFCDA: dw $7505, $7504, $7516, $7515, $7514

#_0CFCE4: dw $0562, $2900 ; VRAM $C40A | 42 bytes | Horizontal
#_0CFCE8: dw $3524, $3525, $3526, $3524, $3525, $3526, $3524, $3525
#_0CFCF8: dw $3526, $3524, $3525, $3526, $7526, $7525, $7524, $7526
#_0CFD08: dw $7525, $7524, $7526, $7525, $7524

#_0CFD12: db $FF ; end of stripes data

;===================================================================================================

AttractImage3Stripes:
#_0CFD13: dw $6561, $2900 ; VRAM $C2CA | 42 bytes | Horizontal
#_0CFD17: dw $3500, $3500, $351B, $3530, $3531, $3532, $3500, $3500
#_0CFD27: dw $3500, $3533, $3541, $7541, $7533, $7500, $7500, $7500
#_0CFD37: dw $7532, $7531, $7530, $751B, $7500

#_0CFD41: dw $8561, $1E40 ; VRAM $C30A | 32 bytes | Fixed horizontal
#_0CFD45: dw $3510

#_0CFD47: dw $8661, $0900 ; VRAM $C30C | 10 bytes | Horizontal
#_0CFD4B: dw $3534, $350B, $3540, $3541, $3542

#_0CFD55: dw $9561, $0900 ; VRAM $C32A | 10 bytes | Horizontal
#_0CFD59: dw $7542, $7541, $7540, $750B, $7534

#_0CFD63: dw $A561, $2900 ; VRAM $C34A | 42 bytes | Horizontal
#_0CFD67: dw $3543, $3544, $3507, $3508, $3509, $350A, $3510, $350C
#_0CFD77: dw $350D, $350E, $350F, $750F, $750E, $750D, $750C, $7510
#_0CFD87: dw $750A, $7509, $7508, $7507, $7544

#_0CFD91: dw $C561, $2900 ; VRAM $C38A | 42 bytes | Horizontal
#_0CFD95: dw $3535, $3536, $3517, $3518, $3519, $351A, $3510, $351C
#_0CFDA5: dw $351D, $351E, $351F, $751F, $751E, $751D, $751C, $7510
#_0CFDB5: dw $751A, $7519, $7518, $7517, $7536

#_0CFDBF: dw $E561, $2900 ; VRAM $C3CA | 42 bytes | Horizontal
#_0CFDC3: dw $3545, $3546, $3527, $3528, $3529, $352A, $352B, $352C
#_0CFDD3: dw $352D, $352E, $352F, $752F, $752E, $752D, $752C, $752B
#_0CFDE3: dw $752A, $7529, $7528, $7527, $7546

#_0CFDED: dw $0562, $2900 ; VRAM $C40A | 42 bytes | Horizontal
#_0CFDF1: dw $3547, $3548, $3537, $3538, $3539, $353A, $353B, $353C
#_0CFE01: dw $353D, $353E, $353F, $753F, $753E, $753D, $753C, $753B
#_0CFE11: dw $753A, $7539, $7538, $7537, $7548

#_0CFE1B: db $FF ; end of stripes data

;===================================================================================================

pool Intro_HandleLogoSword

.char
#_0CFE1C: db $00
#_0CFE1D: db $02
#_0CFE1E: db $20
#_0CFE1F: db $22
#_0CFE20: db $04
#_0CFE21: db $06
#_0CFE22: db $08
#_0CFE23: db $0A
#_0CFE24: db $0C
#_0CFE25: db $0E

.position_x
#_0CFE26: db $40
#_0CFE27: db $40
#_0CFE28: db $30
#_0CFE29: db $50
#_0CFE2A: db $40
#_0CFE2B: db $40
#_0CFE2C: db $40
#_0CFE2D: db $40
#_0CFE2E: db $40
#_0CFE2F: db $40

.position_y
#_0CFE30: dw $0010
#_0CFE32: dw $0020
#_0CFE34: dw $0028
#_0CFE36: dw $0028
#_0CFE38: dw $0030
#_0CFE3A: dw $0040
#_0CFE3C: dw $0050
#_0CFE3E: dw $0060
#_0CFE40: dw $0070
#_0CFE42: dw $0080

#_0CFE44: db $00

pool off

;---------------------------------------------------------------------------------------------------

Intro_InitLogoSword:
#_0CFE45: LDA.b #$07
#_0CFE47: STA.b $CB
#_0CFE49: STZ.b $CC
#_0CFE4B: STZ.b $CD

#_0CFE4D: REP #$20

#_0CFE4F: LDA.w #$FF7E
#_0CFE52: STA.b $C8

#_0CFE54: SEP #$20

;---------------------------------------------------------------------------------------------------

Intro_HandleLogoSword:
#_0CFE56: PHB
#_0CFE57: PHK
#_0CFE58: PLB

#_0CFE59: LDA.b $CA
#_0CFE5B: BEQ .dont_tick

#_0CFE5D: DEC.b $CA

.dont_tick
#_0CFE5F: JSL FixedColorBlack

#_0CFE63: LDA.w $0FF9
#_0CFE66: BEQ .do_sprites

#_0CFE68: AND.b #$03
#_0CFE6A: BEQ .delay_clear

#_0CFE6C: LDX.b $D0

#_0CFE6E: LDA.b #$1F
#_0CFE70: ORA.b $9C,X
#_0CFE72: STA.b $9C,X

#_0CFE74: INX
#_0CFE75: CPX.b #$03
#_0CFE77: BNE .nowrap

#_0CFE79: LDX.b #$00

.nowrap
#_0CFE7B: STX.b $D0

.delay_clear
#_0CFE7D: DEC.w $0FF9

;---------------------------------------------------------------------------------------------------

.do_sprites
#_0CFE80: LDY.b #$09

.next_sprite
#_0CFE82: TYA
#_0CFE83: ASL A
#_0CFE84: ASL A
#_0CFE85: TAX

#_0CFE86: LDA.b #$02
#_0CFE88: STA.w $0A72,Y

#_0CFE8B: LDA.w .char,Y
#_0CFE8E: STA.w $094A,X

#_0CFE91: LDA.b #$21
#_0CFE93: STA.w $094B,X

#_0CFE96: LDA.w .position_x,Y
#_0CFE99: STA.w $0948,X

#_0CFE9C: PHY
#_0CFE9D: TYA
#_0CFE9E: ASL A
#_0CFE9F: TAY

#_0CFEA0: REP #$20

#_0CFEA2: LDA.b $C8
#_0CFEA4: CLC
#_0CFEA5: ADC.w .position_y,Y
#_0CFEA8: SEP #$20
#_0CFEAA: XBA
#_0CFEAB: BEQ .on_screen

#_0CFEAD: LDA.b #$F8
#_0CFEAF: XBA

.on_screen
#_0CFEB0: XBA
#_0CFEB1: SEC
#_0CFEB2: SBC.b #$08
#_0CFEB4: STA.w $0949,X

#_0CFEB7: PLY
#_0CFEB8: DEY
#_0CFEB9: BPL .next_sprite

;---------------------------------------------------------------------------------------------------

#_0CFEBB: REP #$20

#_0CFEBD: LDA.b $C8
#_0CFEBF: CMP.w #$001E
#_0CFEC2: BEQ .no_sfx

#_0CFEC4: LDY.b #$01 ; SFX2.01

#_0CFEC6: CMP.w #$FFBE
#_0CFEC9: BEQ .play_sfx

#_0CFECB: CMP.w #$000E
#_0CFECE: BNE .delay

#_0CFED0: STZ.b $D0

#_0CFED2: LDX.b #$20
#_0CFED4: STX.w $0FF9

#_0CFED7: LDY.b #$2C ; SFX2.2C

.play_sfx
#_0CFED9: STY.w $012E

.delay
#_0CFEDC: CLC
#_0CFEDD: ADC.w #$0010
#_0CFEE0: STA.b $C8

;---------------------------------------------------------------------------------------------------

.no_sfx
#_0CFEE2: SEP #$20

#_0CFEE4: LDX.b $CC
#_0CFEE6: JMP.w (.vectors,X)

.vectors
#_0CFEE9: dw LogoSword_IdleState
#_0CFEEB: dw LogoSword_EyeTwinkle
#_0CFEED: dw LogoSword_BladeShimmer

;===================================================================================================

LogoSword_IdleState:
#_0CFEEF: LDA.w $0FF9
#_0CFEF2: BNE .exit

#_0CFEF4: REP #$20

#_0CFEF6: LDA.b $C8
#_0CFEF8: CMP.w #$001E

#_0CFEFB: SEP #$20

#_0CFEFD: BNE .exit

#_0CFEFF: INC.b $CC
#_0CFF01: INC.b $CC

.exit
#_0CFF03: PLB

#_0CFF04: RTS

;===================================================================================================

pool LogoSword_EyeTwinkle

.timer
#_0CFF05: db $04, $04, $06, $06, $06, $04, $04

.char
#_0CFF0C: db $28, $37, $27, $36, $27, $37, $28

pool off

;---------------------------------------------------------------------------------------------------

LogoSword_EyeTwinkle:
#_0CFF13: LDX.b $CB

#_0CFF15: LDA.b $CA
#_0CFF17: BNE .char_only

#_0CFF19: DEX
#_0CFF1A: STX.b $CB
#_0CFF1C: BPL .delay

#_0CFF1E: STZ.b $CB

#_0CFF20: LDA.b #$02
#_0CFF22: STA.b $CA

#_0CFF24: INC.b $CC
#_0CFF26: INC.b $CC

#_0CFF28: BRA .exit

.delay
#_0CFF2A: LDA.w .timer,X
#_0CFF2D: STA.b $CA

.char_only
#_0CFF2F: STZ.w $0A70

#_0CFF32: LDA.b #$44
#_0CFF34: STA.w $0940

#_0CFF37: LDA.b #$43
#_0CFF39: STA.w $0941

#_0CFF3C: LDA.b #$25
#_0CFF3E: STA.w $0943

#_0CFF41: LDA.w .char,X
#_0CFF44: STA.w $0942

.exit
#_0CFF47: PLB

#_0CFF48: RTS

;===================================================================================================

pool LogoSword_BladeShimmer

.char
#_0CFF49: db $26, $20
#_0CFF4B: db $24, $34
#_0CFF4D: db $25, $20
#_0CFF4F: db $35, $20

pool off

;---------------------------------------------------------------------------------------------------

LogoSword_BladeShimmer:
#_0CFF51: LDX.b $CB
#_0CFF53: CPX.b #$07
#_0CFF55: BCS .exit

#_0CFF57: STZ.w $0A70
#_0CFF5A: STZ.w $0A71

#_0CFF5D: LDA.b #$42
#_0CFF5F: STA.w $0940
#_0CFF62: STA.w $0944

#_0CFF65: LDA.b $CD
#_0CFF67: CMP.b #$50
#_0CFF69: BCC .not_maxed
#_0CFF6B: LDA.b #$4F

.not_maxed
#_0CFF6D: CLC
#_0CFF6E: ADC.b $C8
#_0CFF70: CLC
#_0CFF71: ADC.b #$31
#_0CFF73: STA.w $0941
#_0CFF76: CLC
#_0CFF77: ADC.b #$08
#_0CFF79: STA.w $0945

#_0CFF7C: LDA.b #$23
#_0CFF7E: STA.w $0943
#_0CFF81: STA.w $0947

#_0CFF84: LDA.w .char+0,X
#_0CFF87: STA.w $0942

#_0CFF8A: LDA.w .char+1,X
#_0CFF8D: STA.w $0946

;---------------------------------------------------------------------------------------------------

#_0CFF90: LDA.b $CA
#_0CFF92: BNE .exit

#_0CFF94: LDA.b $CD
#_0CFF96: CLC
#_0CFF97: ADC.b #$04
#_0CFF99: STA.b $CD

#_0CFF9B: CMP.b #$04
#_0CFF9D: BEQ .advance

#_0CFF9F: CMP.b #$48
#_0CFFA1: BEQ .advance

#_0CFFA3: CMP.b #$4C
#_0CFFA5: BEQ .advance

#_0CFFA7: CMP.b #$58
#_0CFFA9: BNE .exit

.advance
#_0CFFAB: INC.b $CB
#_0CFFAD: INC.b $CB

.exit
#_0CFFAF: PLB

#_0CFFB0: RTS

;===================================================================================================
; FREE ROM: 0x4F
;===================================================================================================
NULL_0CFFB1:
#_0CFFB1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CFFB9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CFFC1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CFFC9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CFFD1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CFFD9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CFFE1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CFFE9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CFFF1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0CFFF9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================
