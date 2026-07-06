; see «overworlds.asm»

org $0CC10C

;===================================================================================================
; FREE ROM: 0x14
;===================================================================================================
NULL_0CC10C:
|0CC10C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0CC114| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0CC11C| db $FF, $FF, $FF, $FF

;===================================================================================================

Module00_Intro:
|0CC120| LDA.b $11
|0CC122| CMP.b #$08
|0CC124| BCC .run_submodule

|0CC126| LDA.b $F6
|0CC128| AND.b #$C0

|0CC12A| ORA.b $F4
|0CC12C| AND.b #$D0
|0CC12E| BEQ .run_submodule

|0CC130| JMP.w FadeMusicAndResetSRAMMirror

;---------------------------------------------------------------------------------------------------

.run_submodule
|0CC133| LDA.b $11
|0CC135| JSL JumpTableLong
|0CC139| dl Intro_InitialInitialization
|0CC13C| dl Intro_InitializeMemory
|0CC13F| dl Intro_InitializeTriforcePolyThread
|0CC142| dl Intro_HandleAllTriforceAnimations
|0CC145| dl Intro_HandleAllTriforceAnimations
|0CC148| dl Intro_FadeLogoIn
|0CC14B| dl Intro_SwordStab
|0CC14E| dl Intro_PopSubtitleCard
|0CC151| dl Intro_TrianglesBeforeAttract
|0CC154| dl Intro_HandleAllTriforceAnimations
|0CC157| dl Intro_InitializeTriforcePolyThread
|0CC15A| dl Intro_HandleAllTriforceAnimations

;===================================================================================================

Intro_InitialInitialization:
|0CC15D| JSL Intro_SetupScreen

|0CC161| LDA.b #$0F
|0CC163| STA.b $13

|0CC165| STZ.b $B0

|0CC167| INC.b $15
|0CC169| INC.b $11

|0CC16B| LDA.b #$0A ; SFX3.0A
|0CC16D| STA.w $012F

;===================================================================================================

Intro_InitializeMemory:
|0CC170| JSR Intro_DisplayLogo

|0CC173| LDA.b $B0
|0CC175| INC.b $B0
|0CC177| CMP.b #$0B
|0CC179| BCS Intro_InitializeMemory_darken

|0CC17B| JSL JumpTableLong
|0CC17F| dl Intro_Clear1kbBlocksOfWRAM
|0CC182| dl Intro_Clear1kbBlocksOfWRAM
|0CC185| dl Intro_Clear1kbBlocksOfWRAM
|0CC188| dl Intro_Clear1kbBlocksOfWRAM
|0CC18B| dl Intro_Clear1kbBlocksOfWRAM
|0CC18E| dl Intro_Clear1kbBlocksOfWRAM
|0CC191| dl Intro_Clear1kbBlocksOfWRAM
|0CC194| dl Intro_Clear1kbBlocksOfWRAM
|0CC197| dl Intro_LoadTextAndPalettes
|0CC19A| dl LoadItemGFXIntoWRAM4BPPBuffer
|0CC19D| dl LoadFollowerGraphics

;===================================================================================================

Intro_Clear1kbBlocksOfWRAM:
|0CC1A0| REP #$30

|0CC1A2| LDX.b $C8

|0CC1A4| LDA.w #$0000

.loop
|0CC1A7| STA.l $7E2000,X
|0CC1AB| STA.l $7E4000,X
|0CC1AF| STA.l $7E6000,X

|0CC1B3| STA.l $7E8000,X
|0CC1B7| STA.l $7EA000,X
|0CC1BB| STA.l $7EC000,X
|0CC1BF| STA.l $7EE000,X

|0CC1C3| STA.l $7F0000,X
|0CC1C7| STA.l $7F2000,X
|0CC1CB| STA.l $7F4000,X
|0CC1CF| STA.l $7F6000,X

|0CC1D3| STA.l $7F8000,X
|0CC1D7| STA.l $7FA000,X
|0CC1DB| STA.l $7FC000,X
|0CC1DF| STA.l $7FE000,X

|0CC1E3| DEX
|0CC1E4| DEX
|0CC1E5| CPX.b $CA
|0CC1E7| BNE .loop

;---------------------------------------------------------------------------------------------------

|0CC1E9| STX.b $C8

|0CC1EB| TXA
|0CC1EC| SEC
|0CC1ED| SBC.w #$0400
|0CC1F0| STA.b $CA

|0CC1F2| SEP #$30

|0CC1F4| RTL

;===================================================================================================

Intro_InitializeMemory_darken:
|0CC1F5| DEC.b $13
|0CC1F7| BNE .still_darkening

;===================================================================================================

#Intro_InitializeDefaultGFX:
|0CC1F9| JSL EnableForceBlank
|0CC1FD| JSL EraseTilemaps_normal

|0CC201| LDA.b #$02
|0CC203| STA.w OBSEL

|0CC206| LDA.b #$23
|0CC208| STA.w $0AA1

|0CC20B| LDA.b #$7D
|0CC20D| STA.w $0AA3

|0CC210| LDA.b #$51
|0CC212| STA.w $0AA2

|0CC215| LDA.b #$08
|0CC217| STA.w $0AA4

|0CC21A| JSL LoadDefaultGraphics
|0CC21E| JSL InitializeTilesets

|0CC222| LDY.b #$5D
|0CC224| JSL DecompressAnimatedUnderworldTiles

;---------------------------------------------------------------------------------------------------

|0CC228| LDA.b #$02
|0CC22A| STA.l $7EC00D

|0CC22E| LDA.b #$00
|0CC230| STA.l $7EC00E

|0CC234| STZ.b $8A

|0CC236| STZ.w $0AB6
|0CC239| STZ.w $0AB8

|0CC23C| STZ.b $C8
|0CC23E| STZ.b $C9

|0CC240| STZ.b $CA
|0CC242| STZ.b $CB

|0CC244| LDA.b #$02
|0CC246| STA.l $7EC009

|0CC24A| LDA.b #$1F
|0CC24C| STA.l $7EC007

|0CC250| LDA.b #$00
|0CC252| STA.l $7EC00B

|0CC256| STZ.w $0AA6

|0CC259| INC.b $11

.still_darkening
|0CC25B| RTL

;===================================================================================================

Intro_FadeLogoIn:
|0CC25C| JSL Intro_HandleAllTriforceAnimations

|0CC260| LDA.b $1A
|0CC262| LSR A
|0CC263| BCC .exit_a

|0CC265| JSL IntroLogoPaletteFadeIn

|0CC269| LDA.l $7EC007
|0CC26D| BNE .dont_advance

|0CC26F| LDA.b #$2A
|0CC271| STA.b $B0

|0CC273| INC.b $11

|0CC275| JSR Intro_InitLogoSword

.exit_a
|0CC278| RTL

;---------------------------------------------------------------------------------------------------

.dont_advance
|0CC279| CMP.b #$0D
|0CC27B| BNE .exit_b

|0CC27D| LDA.b #$15
|0CC27F| STA.b $1C
|0CC281| STZ.b $1D

.exit_b
|0CC283| RTL

;===================================================================================================

Intro_PopSubtitleCard:
|0CC284| JSR Intro_HandleLogoSword

|0CC287| JSL Intro_HandleAllTriforceAnimations

|0CC28B| LDA.l $7EC007
|0CC28F| BEQ .delay_fade

|0CC291| LDA.b $1A
|0CC293| LSR A
|0CC294| BCC .exit

|0CC296| JML IntroTitleCardPaletteFadeIn

.delay_fade
|0CC29A| LDA.b $F6
|0CC29C| AND.b #$C0
|0CC29E| ORA.b $F4
|0CC2A0| AND.b #$D0
|0CC2A2| BEQ .delay_music

|0CC2A4| JMP.w FadeMusicAndResetSRAMMirror

.delay_music
|0CC2A7| DEC.b $B0
|0CC2A9| BNE .exit

|0CC2AB| INC.b $11

.exit
|0CC2AD| RTL

;===================================================================================================

Intro_SwordStab:
|0CC2AE| JSL Intro_HandleAllTriforceAnimations

|0CC2B2| STZ.w $1F00
|0CC2B5| STZ.w $012A

|0CC2B8| JSR Intro_HandleLogoSword

|0CC2BB| DEC.b $B0
|0CC2BD| BNE .exit

|0CC2BF| INC.b $11

|0CC2C1| LDA.b #$02
|0CC2C3| STA.b $99

|0CC2C5| LDA.b #$22
|0CC2C7| STA.b $9A

|0CC2C9| LDA.b #$1F
|0CC2CB| STA.l $7EC007

|0CC2CF| LDA.b #$02
|0CC2D1| STA.b $1D

.exit
|0CC2D3| RTL

;===================================================================================================

Intro_TrianglesBeforeAttract:
|0CC2D4| JSL Intro_HandleAllTriforceAnimations

|0CC2D8| STZ.w $1F00
|0CC2DB| STZ.w $012A

|0CC2DE| JSR Intro_HandleLogoSword

|0CC2E1| DEC.b $B0
|0CC2E3| BNE .exit

|0CC2E5| INC.b $11

|0CC2E7| LDA.b #$14
|0CC2E9| STA.b $10

|0CC2EB| STZ.b $11
|0CC2ED| STZ.b $22

.exit
|0CC2EF| RTL

;===================================================================================================

FadeMusicAndResetSRAMMirror:
|0CC2F0| LDA.b #$FF
|0CC2F2| STA.w $0128

|0CC2F5| LDA.b #$15
|0CC2F7| STA.b $1C

|0CC2F9| STZ.b $1D
|0CC2FB| STZ.b $1B

|0CC2FD| LDA.b #$F1 ; SONG F1 - fade
|0CC2FF| STA.w $012C

|0CC302| JSL FixedColorBlack

;---------------------------------------------------------------------------------------------------

|0CC306| REP #$30

|0CC308| LDX.w #$006E

.next_dp
|0CC30B| STZ.b $20,X

|0CC30D| DEX
|0CC30E| DEX
|0CC30F| BPL .next_dp

;---------------------------------------------------------------------------------------------------

|0CC311| LDX.w #$0000
|0CC314| TXA

.next_sram
|0CC315| STA.l $7EF000,X
|0CC319| STA.l $7EF100,X
|0CC31D| STA.l $7EF200,X
|0CC321| STA.l $7EF300,X
|0CC325| STA.l $7EF400,X

|0CC329| INX
|0CC32A| INX
|0CC32B| CPX.w #$0100
|0CC32E| BNE .next_sram

;---------------------------------------------------------------------------------------------------

|0CC330| SEP #$30

|0CC332| LDA.b #$01
|0CC334| STA.b $10
|0CC336| STA.w $04AA

|0CC339| STZ.b $11

|0CC33B| RTL

;===================================================================================================

Intro_InitializeTriforcePolyThread:
|0CC33C| LDA.b #$08
|0CC33E| STA.w $0AA4

|0CC341| JSL LoadCommonSprites_long
|0CC345| JSR TriforceInitializePolyhedralModule

|0CC348| LDA.b #$01
|0CC34A| STA.w $1E10
|0CC34D| STA.w $1E11
|0CC350| STA.w $1E12

|0CC353| LDA.b #$00
|0CC355| STA.w $1E18
|0CC358| STA.w $1E19
|0CC35B| STA.w $1E1A

|0CC35E| LDA.b #$01
|0CC360| STA.w $1E14

|0CC363| LDA.b #$02
|0CC365| STA.w $1E1C

|0CC368| LDA.b #$0F
|0CC36A| STA.b $13

|0CC36C| INC.b $11

|0CC36E| RTL

;===================================================================================================

TriforceInitializePolyhedralModule:
|0CC36F| JSL Polyhedral_InitializeThread
|0CC373| JSR LoadTriforceSpritePalette

|0CC376| LDA.b #$90
|0CC378| STA.b $FF

|0CC37A| LDA.b #$FF
|0CC37C| STA.w $1F02

|0CC37F| LDA.b #$20
|0CC381| STA.w $1F06
|0CC384| STA.w $1F07
|0CC387| STA.w $1F08

|0CC38A| LDA.b #$A0
|0CC38C| STA.w $1F04

|0CC38F| LDA.b #$60
|0CC391| STA.w $1F05

|0CC394| LDA.b #$01
|0CC396| STA.w $1F01
|0CC399| STA.w $1F03
|0CC39C| STA.w $012A
|0CC39F| STA.w $1F00

;---------------------------------------------------------------------------------------------------

|0CC3A2| LDX.b #$0F

.clear_next
|0CC3A4| STZ.w $1E00,X
|0CC3A7| STZ.w $1E10,X
|0CC3AA| STZ.w $1E20,X
|0CC3AD| STZ.w $1E30,X
|0CC3B0| STZ.w $1E40,X
|0CC3B3| STZ.w $1E50,X
|0CC3B6| STZ.w $1E60,X

|0CC3B9| DEX
|0CC3BA| BPL .clear_next

;---------------------------------------------------------------------------------------------------

|0CC3BC| RTS

;===================================================================================================

LoadTriforceSpritePalette:
|0CC3BD| REP #$20

|0CC3BF| LDA.l Palettes_Triforce+0
|0CC3C3| STA.l $7EC6A0

|0CC3C7| LDA.l Palettes_Triforce+2
|0CC3CB| STA.l $7EC6A2

|0CC3CF| LDA.l Palettes_Triforce+4
|0CC3D3| STA.l $7EC6A4

|0CC3D7| LDA.l Palettes_Triforce+6
|0CC3DB| STA.l $7EC6A6

|0CC3DF| LDA.l Palettes_Triforce+8
|0CC3E3| STA.l $7EC6A8

|0CC3E7| LDA.l Palettes_Triforce+10
|0CC3EB| STA.l $7EC6AA

|0CC3EF| LDA.l Palettes_Triforce+12
|0CC3F3| STA.l $7EC6AC

|0CC3F7| LDA.l Palettes_Triforce+14
|0CC3FB| STA.l $7EC6AE

|0CC3FF| SEP #$30

|0CC401| INC.b $15

|0CC403| RTS

;===================================================================================================

Intro_HandleAllTriforceAnimations:
|0CC404| PHB
|0CC405| PHK
|0CC406| PLB

|0CC407| INC.w $1E0A

|0CC40A| JSR Intro_AnimateTriforce
|0CC40D| JSR Scene_AnimateEverySprite

|0CC410| PLB

|0CC411| RTL

;===================================================================================================

Scene_AnimateEverySprite:
|0CC412| LDA.b #$00
|0CC414| STA.w $1E08

|0CC417| LDA.b #$08
|0CC419| STA.w $1E09

|0CC41C| LDX.b #$07

.next
|0CC41E| JSR Scene_AnimateSingleSprite

|0CC421| DEX
|0CC422| BPL .next

|0CC424| RTS

;===================================================================================================

Palettes_Triforce:
; #RRGGBB :  000000, 685000, 806800, 987800, B09000, C89800, E8B800, F8D000
|0CC425| dw  $0000,  $014D,  $01B0,  $01F3,  $0256,  $0279,  $02FD,  $035F

;===================================================================================================

Intro_AnimateTriforce:
|0CC435| LDA.b #$01
|0CC437| STA.w $012A

|0CC43A| LDA.w $1F00
|0CC43D| BNE .exit

|0CC43F| JSR Intro_AnimateTriforceDanceMoves

|0CC442| LDA.b #$01
|0CC444| STA.w $1F00

.exit
|0CC447| RTS

;===================================================================================================

Intro_AnimateTriforceDanceMoves:
|0CC448| LDA.w $1E00
|0CC44B| JSL JumpTableLocal
|0CC44F| dw Intro_TriforceTinyDancers
|0CC451| dw Intro_TriforceSpinInwards
|0CC453| dw Intro_TriforceNearingMerge
|0CC455| dw Intro_MergeTriforceSpin
|0CC457| dw Intro_TriforceTerminateSpin
|0CC459| dw Intro_TriforceDoNothing

;===================================================================================================

Intro_TriforceTinyDancers:
|0CC45B| INC.w $1E01

|0CC45E| LDA.w $1E01
|0CC461| CMP.b #$40
|0CC463| BNE .delay

|0CC465| INC.w $1E00

.delay
|0CC468| LDA.w $1F05
|0CC46B| CLC
|0CC46C| ADC.b #$05
|0CC46E| STA.w $1F05

|0CC471| LDA.w $1F04
|0CC474| CLC
|0CC475| ADC.b #$03
|0CC477| STA.w $1F04

|0CC47A| RTS

;===================================================================================================

Intro_TriforceSpinInwards:
|0CC47B| LDA.w $1F02
|0CC47E| CMP.b #$02
|0CC480| BCS .delay

|0CC482| STZ.w $1F02

|0CC485| INC.w $1E00

|0CC488| LDA.b #$40
|0CC48A| STA.w $1E01

|0CC48D| RTS

;---------------------------------------------------------------------------------------------------

.delay
|0CC48E| SBC.b #$02
|0CC490| STA.w $1F02

|0CC493| LDA.w $1F05
|0CC496| CLC
|0CC497| ADC.b #$05
|0CC499| STA.w $1F05

|0CC49C| LDA.w $1F04
|0CC49F| CLC
|0CC4A0| ADC.b #$03
|0CC4A2| STA.w $1F04

|0CC4A5| LDA.w $1F02
|0CC4A8| CMP.b #$E1
|0CC4AA| BCS .delay_skippability

|0CC4AC| LDX.b #$04
|0CC4AE| STX.b $11

.delay_skippability
|0CC4B0| CMP.b #$71
|0CC4B2| BNE .delay_song

|0CC4B4| LDA.b #$01 ; SONG 01
|0CC4B6| STA.w $012C

.delay_song
|0CC4B9| RTS

;===================================================================================================

Intro_TriforceNearingMerge:
|0CC4BA| DEC.w $1E01
|0CC4BD| BNE .delay

|0CC4BF| INC.w $1E00

|0CC4C2| RTS

;---------------------------------------------------------------------------------------------------

.delay
|0CC4C3| LDA.w $1F05
|0CC4C6| CLC
|0CC4C7| ADC.b #$05
|0CC4C9| STA.w $1F05

|0CC4CC| LDA.w $1F04
|0CC4CF| CLC
|0CC4D0| ADC.b #$03
|0CC4D2| STA.w $1F04

|0CC4D5| RTS

;===================================================================================================

Intro_MergeTriforceSpin:
|0CC4D6| LDA.w $1F05
|0CC4D9| CMP.b #$FA
|0CC4DB| BCC .spinning

|0CC4DD| LDA.w $1F04
|0CC4E0| CMP.b #$FC
|0CC4E2| BCC .spinning

|0CC4E4| INC.w $1E00

|0CC4E7| LDA.b #$20
|0CC4E9| STA.w $1E01

|0CC4EC| RTS

;---------------------------------------------------------------------------------------------------

.spinning
|0CC4ED| LDA.w $1F05
|0CC4F0| CLC
|0CC4F1| ADC.b #$05
|0CC4F3| STA.w $1F05

|0CC4F6| LDA.w $1F04
|0CC4F9| CLC
|0CC4FA| ADC.b #$03
|0CC4FC| STA.w $1F04

|0CC4FF| RTS

;===================================================================================================

Intro_TriforceTerminateSpin:
|0CC500| STZ.w $1F05
|0CC503| STZ.w $1F04

|0CC506| DEC.w $1E01
|0CC509| BNE .exit

|0CC50B| INC.w $1E00

|0CC50E| LDA.b #$01
|0CC510| STA.w $1E15

|0CC513| LDA.b #$03
|0CC515| STA.w $1E1D

|0CC518| LDA.b #$10
|0CC51A| STA.b $1C

|0CC51C| LDA.b #$05
|0CC51E| STA.b $1D

|0CC520| LDA.b #$02
|0CC522| STA.b $99

|0CC524| LDA.b #$31
|0CC526| STA.b $9A

|0CC528| STZ.b $B0

|0CC52A| INC.b $15

|0CC52C| LDA.b #$03

;---------------------------------------------------------------------------------------------------

#Intro_SetStripesAndAdvance:
|0CC52E| STA.b $14

|0CC530| INC.b $11

.exit
|0CC532| RTS

;===================================================================================================

Intro_TriforceDoNothing:
|0CC533| RTS

;===================================================================================================

Scene_AnimateSingleSprite:
|0CC534| LDA.w $1E10,X
|0CC537| BEQ .exit
|0CC539| JSL JumpTableLocal
|0CC53D| dw .exit
|0CC53F| dw InitializeSceneSprite
|0CC541| dw AnimateSceneSprite

;---------------------------------------------------------------------------------------------------

.exit
|0CC543| RTS

;===================================================================================================

InitializeSceneSprite:
|0CC544| LDA.w $1E18,X
|0CC547| JSL JumpTableLocal
|0CC54B| dw InitializeSceneSprite_Triangle
|0CC54D| dw SceneSprite_TitleCard
|0CC54F| dw InitializeSceneSprite_Copyright
|0CC551| dw InitializeSceneSprite_Sparkle
|0CC553| dw InitializeSceneSprite_TriforceRoomTriangle
|0CC555| dw InitializeSceneSprite_TriforceRoomTriangle
|0CC557| dw InitializeSceneSprite_TriforceRoomTriangle
|0CC559| dw InitializeSceneSprite_CreditsTriangle

;===================================================================================================

AnimateSceneSprite:
|0CC55B| LDA.w $1E18,X
|0CC55E| JSL JumpTableLocal
|0CC562| dw AnimateSceneSprite_Triangle
|0CC564| dw SceneSprite_TitleCard
|0CC566| dw AnimateSceneSprite_Copyright
|0CC568| dw AnimateSceneSprite_Sparkle
|0CC56A| dw AnimateSceneSprite_TriforceRoomTriangle
|0CC56C| dw AnimateSceneSprite_TriforceRoomTriangle
|0CC56E| dw AnimateSceneSprite_TriforceRoomTriangle
|0CC570| dw AnimateSceneSprite_CreditsTriangle

;===================================================================================================

pool InitializeSceneSprite_Triangle

.pos_x_start
|0CC572| dw $FFDA
|0CC574| dw $005F
|0CC576| dw $00E6

.pos_y_start
|0CC578| dw $00C8
|0CC57A| dw $FFBD
|0CC57C| dw $00C8

endpool

;---------------------------------------------------------------------------------------------------

InitializeSceneSprite_Triangle:
|0CC57E| TXA
|0CC57F| ASL A
|0CC580| TAY

|0CC581| LDA.w .pos_x_start+0,Y
|0CC584| STA.w $1E30,X

|0CC587| LDA.w .pos_x_start+1,Y
|0CC58A| STA.w $1E38,X

|0CC58D| LDA.w .pos_y_start+0,Y
|0CC590| STA.w $1E48,X

|0CC593| LDA.w .pos_y_start+1,Y
|0CC596| STA.w $1E50,X

|0CC599| LDA.w IntroTriangleSpeedX,X
|0CC59C| CLC
|0CC59D| ADC.w $1E58,X
|0CC5A0| STA.w $1E58,X

|0CC5A3| LDA.w IntroTriangleSpeedY,X
|0CC5A6| CLC
|0CC5A7| ADC.w $1E60,X
|0CC5AA| STA.w $1E60,X

|0CC5AD| INC.w $1E10,X

|0CC5B0| RTS

;===================================================================================================

AnimateSceneSprite_Triangle:
|0CC5B1| JSR AnimateSceneSprite_DrawTriangle
|0CC5B4| JSR AnimateSceneSprite_MoveTriangle

|0CC5B7| LDA.w $1E00
|0CC5BA| JSL JumpTableLocal
|0CC5BE| dw IntroTriangle_MoveIntoPlace
|0CC5C0| dw IntroTriangle_MoveIntoPlace
|0CC5C2| dw IntroTriangle_MoveIntoPlace
|0CC5C4| dw IntroTriangle_MoveIntoPlace
|0CC5C6| dw IntroTriangle_MoveIntoPlace
|0CC5C8| dw IntroTriangle_StopMoving

;===================================================================================================

IntroTriangleSpeedX:
|0CC5CA| db   1
|0CC5CB| db   0
|0CC5CC| db  -1

IntroTriangleSpeedY:
|0CC5CD| db  -1
|0CC5CE| db   1
|0CC5CF| db  -1

;===================================================================================================

pool IntroTriangle_MoveIntoPlace

.target_x
|0CC5D0| db $4B
|0CC5D1| db $5F
|0CC5D2| db $75

.target_y
|0CC5D3| db $58
|0CC5D4| db $30
|0CC5D5| db $58

endpool

;---------------------------------------------------------------------------------------------------

IntroTriangle_MoveIntoPlace:
|0CC5D6| LDA.w $1E0A
|0CC5D9| AND.b #$1F
|0CC5DB| BNE .dont_accel

|0CC5DD| LDA.w IntroTriangleSpeedX,X
|0CC5E0| CLC
|0CC5E1| ADC.w $1E58,X
|0CC5E4| STA.w $1E58,X

|0CC5E7| LDA.w IntroTriangleSpeedY,X
|0CC5EA| CLC
|0CC5EB| ADC.w $1E60,X
|0CC5EE| STA.w $1E60,X

.dont_accel
|0CC5F1| LDA.w .target_x,X
|0CC5F4| CMP.w $1E30,X
|0CC5F7| BNE .dont_reset_speed

|0CC5F9| STZ.w $1E58,X

.dont_reset_speed
|0CC5FC| LDA.w .target_y,X
|0CC5FF| CMP.w $1E48,X
|0CC602| BNE .exit

|0CC604| STZ.w $1E60,X

.exit
|0CC607| RTS

;===================================================================================================

IntroTriangle_StopMoving:
|0CC608| STZ.w $1E58,X
|0CC60B| STZ.w $1E60,X

|0CC60E| RTS

;===================================================================================================

pool AnimateSceneSprite_DrawTriangle

.rightside_objects
|0CC60F| dw   0,   0 : db $80, $1B, $00, $02
|0CC617| dw  16,   0 : db $82, $1B, $00, $02
|0CC61F| dw  32,   0 : db $84, $1B, $00, $02
|0CC627| dw  48,   0 : db $86, $1B, $00, $02
|0CC62F| dw   0,  16 : db $A0, $1B, $00, $02
|0CC637| dw  16,  16 : db $A2, $1B, $00, $02
|0CC63F| dw  32,  16 : db $A4, $1B, $00, $02
|0CC647| dw  48,  16 : db $A6, $1B, $00, $02
|0CC64F| dw   0,  32 : db $88, $1B, $00, $02
|0CC657| dw  16,  32 : db $8A, $1B, $00, $02
|0CC65F| dw  32,  32 : db $8C, $1B, $00, $02
|0CC667| dw  48,  32 : db $8E, $1B, $00, $02
|0CC66F| dw   0,  48 : db $A8, $1B, $00, $02
|0CC677| dw  16,  48 : db $AA, $1B, $00, $02
|0CC67F| dw  32,  48 : db $AC, $1B, $00, $02
|0CC687| dw  48,  48 : db $AE, $1B, $00, $02

;---------------------------------------------------------------------------------------------------

.leftside_objects
|0CC68F| dw  48,   0 : db $80, $5B, $00, $02
|0CC697| dw  32,   0 : db $82, $5B, $00, $02
|0CC69F| dw  16,   0 : db $84, $5B, $00, $02
|0CC6A7| dw   0,   0 : db $86, $5B, $00, $02
|0CC6AF| dw  48,  16 : db $A0, $5B, $00, $02
|0CC6B7| dw  32,  16 : db $A2, $5B, $00, $02
|0CC6BF| dw  16,  16 : db $A4, $5B, $00, $02
|0CC6C7| dw   0,  16 : db $A6, $5B, $00, $02
|0CC6CF| dw  48,  32 : db $88, $5B, $00, $02
|0CC6D7| dw  32,  32 : db $8A, $5B, $00, $02
|0CC6DF| dw  16,  32 : db $8C, $5B, $00, $02
|0CC6E7| dw   0,  32 : db $8E, $5B, $00, $02
|0CC6EF| dw  48,  48 : db $A8, $5B, $00, $02
|0CC6F7| dw  32,  48 : db $AA, $5B, $00, $02
|0CC6FF| dw  16,  48 : db $AC, $5B, $00, $02
|0CC707| dw   0,  48 : db $AE, $5B, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

AnimateSceneSprite_DrawTriangle:
|0CC70F| LDA.b #$10
|0CC711| STA.b $06
|0CC713| STZ.b $07

|0CC715| CPX.b #$02
|0CC717| BEQ .left_side

|0CC719| LDA.b #<.rightside_objects
|0CC71B| STA.b $08

|0CC71D| LDA.b #>.rightside_objects
|0CC71F| STA.b $09

|0CC721| BRA .continue


.left_side
|0CC723| LDA.b #<.leftside_objects
|0CC725| STA.b $08

|0CC727| LDA.b #>.leftside_objects
|0CC729| STA.b $09

.continue
|0CC72B| JSR AnimateSceneSprite_AddObjectsToOAMBuffer

|0CC72E| RTS

;===================================================================================================

pool AnimateSceneSprite_DrawTriforceRoomTriangle

.rightside_objects
|0CC72F| dw   0,   0 : db $80, $2B, $00, $02
|0CC737| dw  16,   0 : db $82, $2B, $00, $02
|0CC73F| dw  32,   0 : db $84, $2B, $00, $02
|0CC747| dw  48,   0 : db $86, $2B, $00, $02
|0CC74F| dw   0,  16 : db $A0, $2B, $00, $02
|0CC757| dw  16,  16 : db $A2, $2B, $00, $02
|0CC75F| dw  32,  16 : db $A4, $2B, $00, $02
|0CC767| dw  48,  16 : db $A6, $2B, $00, $02
|0CC76F| dw   0,  32 : db $88, $2B, $00, $02
|0CC777| dw  16,  32 : db $8A, $2B, $00, $02
|0CC77F| dw  32,  32 : db $8C, $2B, $00, $02
|0CC787| dw  48,  32 : db $8E, $2B, $00, $02
|0CC78F| dw   0,  48 : db $A8, $2B, $00, $02
|0CC797| dw  16,  48 : db $AA, $2B, $00, $02
|0CC79F| dw  32,  48 : db $AC, $2B, $00, $02
|0CC7A7| dw  48,  48 : db $AE, $2B, $00, $02

;---------------------------------------------------------------------------------------------------

.leftside_objects
|0CC7AF| dw  48,   0 : db $80, $6B, $00, $02
|0CC7B7| dw  32,   0 : db $82, $6B, $00, $02
|0CC7BF| dw  16,   0 : db $84, $6B, $00, $02
|0CC7C7| dw   0,   0 : db $86, $6B, $00, $02
|0CC7CF| dw  48,  16 : db $A0, $6B, $00, $02
|0CC7D7| dw  32,  16 : db $A2, $6B, $00, $02
|0CC7DF| dw  16,  16 : db $A4, $6B, $00, $02
|0CC7E7| dw   0,  16 : db $A6, $6B, $00, $02
|0CC7EF| dw  48,  32 : db $88, $6B, $00, $02
|0CC7F7| dw  32,  32 : db $8A, $6B, $00, $02
|0CC7FF| dw  16,  32 : db $8C, $6B, $00, $02
|0CC807| dw   0,  32 : db $8E, $6B, $00, $02
|0CC80F| dw  48,  48 : db $A8, $6B, $00, $02
|0CC817| dw  32,  48 : db $AA, $6B, $00, $02
|0CC81F| dw  16,  48 : db $AC, $6B, $00, $02
|0CC827| dw   0,  48 : db $AE, $6B, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

AnimateSceneSprite_DrawTriforceRoomTriangle:
|0CC82F| LDA.b #$10
|0CC831| STA.b $06
|0CC833| STZ.b $07

|0CC835| CPX.b #$02
|0CC837| BEQ .decrementing

|0CC839| LDA.b #.rightside_objects
|0CC83B| STA.b $08

|0CC83D| LDA.b #>.rightside_objects
|0CC83F| STA.b $09

|0CC841| BRA .continue

;---------------------------------------------------------------------------------------------------

.decrementing
|0CC843| LDA.b #.leftside_objects
|0CC845| STA.b $08

|0CC847| LDA.b #>.leftside_objects
|0CC849| STA.b $09

.continue
|0CC84B| JSR AnimateSceneSprite_AddObjectsToOAMBuffer

|0CC84E| RTS

;===================================================================================================

SceneSprite_TitleCard:
|0CC84F| RTS

;===================================================================================================

InitializeSceneSprite_Copyright:
|0CC850| LDA.b #$4C
|0CC852| STA.w $1E30,X
|0CC855| STZ.w $1E38,X

|0CC858| LDA.b #$B8
|0CC85A| STA.w $1E48,X

|0CC85D| STZ.w $1E50,X

|0CC860| INC.w $1E10,X

|0CC863| RTS

;===================================================================================================

AnimateSceneSprite_Copyright:
|0CC864| JSR AnimateSceneSprite_DrawCopyright

|0CC867| RTS

;===================================================================================================

pool AnimateSceneSprite_DrawCopyright

.groups
|0CC868| dw   0,   0 : db $40, $0A, $00, $00
|0CC870| dw   8,   0 : db $41, $0A, $00, $00
|0CC878| dw  16,   0 : db $42, $0A, $00, $00
|0CC880| dw  24,   0 : db $68, $0A, $00, $00
|0CC888| dw  32,   0 : db $41, $0A, $00, $00
|0CC890| dw  40,   0 : db $42, $0A, $00, $00
|0CC898| dw  48,   0 : db $43, $0A, $00, $00
|0CC8A0| dw  56,   0 : db $44, $0A, $00, $00
|0CC8A8| dw  64,   0 : db $50, $0A, $00, $00
|0CC8B0| dw  72,   0 : db $51, $0A, $00, $00
|0CC8B8| dw  80,   0 : db $52, $0A, $00, $00
|0CC8C0| dw  88,   0 : db $53, $0A, $00, $00
|0CC8C8| dw  96,   0 : db $54, $0A, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

AnimateSceneSprite_DrawCopyright:
|0CC8D0| LDA.b #$0D
|0CC8D2| STA.b $06
|0CC8D4| STZ.b $07

|0CC8D6| LDA.b #.groups
|0CC8D8| STA.b $08

|0CC8DA| LDA.b #>.groups
|0CC8DC| STA.b $09

|0CC8DE| JSR AnimateSceneSprite_AddObjectsToOAMBuffer

|0CC8E1| RTS

;===================================================================================================

InitializeSceneSprite_Sparkle:
|0CC8E2| LDA.w $1E0A

|0CC8E5| LSR A
|0CC8E6| LSR A
|0CC8E7| LSR A
|0CC8E8| LSR A
|0CC8E9| LSR A

|0CC8EA| AND.b #$03
|0CC8EC| TAY

|0CC8ED| LDA.w .position_x,Y
|0CC8F0| STA.w $1E30,X

|0CC8F3| LDA.w .position_y,Y
|0CC8F6| STA.w $1E48,X

|0CC8F9| INC.w $1E10,X

|0CC8FC| RTS

;---------------------------------------------------------------------------------------------------

pool InitializeSceneSprite_Sparkle AnimateSceneSprite_Sparkle

.position_x
|0CC8FD| db $C2, $98, $6F, $34

.position_y
|0CC901| db $7C, $54, $7C, $57

.anim_step
|0CC905| db $00, $01, $02, $03, $02, $01, $FF, $FF

endpool

;---------------------------------------------------------------------------------------------------

AnimateSceneSprite_Sparkle:
|0CC90D| JSR AnimateSceneSprite_DrawSparkle

|0CC910| LDA.w $1E0A
|0CC913| LSR A
|0CC914| LSR A
|0CC915| AND.b #$07
|0CC917| TAY

|0CC918| LDA.w .anim_step,Y
|0CC91B| STA.w $1E20,X

|0CC91E| LDA.w $1E0A
|0CC921| LSR A
|0CC922| LSR A
|0CC923| LSR A
|0CC924| LSR A
|0CC925| LSR A
|0CC926| AND.b #$03
|0CC928| TAY

|0CC929| LDA.w .position_x,Y
|0CC92C| STA.w $1E30,X

|0CC92F| LDA.w .position_y,Y
|0CC932| STA.w $1E48,X

|0CC935| RTS

;===================================================================================================

pool AnimateSceneSprite_DrawSparkle

.groups
|0CC936| dw   0,   0 : db $80, $34, $00, $00
|0CC93E| dw   0,   0 : db $B7, $34, $00, $00
|0CC946| dw  -4,  -3 : db $64, $38, $00, $02
|0CC94E| dw  -4,  -3 : db $62, $34, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

AnimateSceneSprite_DrawSparkle:
|0CC956| LDA.b #$01
|0CC958| STA.b $06
|0CC95A| STZ.b $07

|0CC95C| LDA.w $1E20,X
|0CC95F| BMI .exit

|0CC961| ASL A
|0CC962| ASL A
|0CC963| ASL A

|0CC964| ADC.b #.groups
|0CC966| STA.b $08

|0CC968| LDA.b #>.groups
|0CC96A| ADC.b #$00
|0CC96C| STA.b $09

|0CC96E| JSR AnimateSceneSprite_AddObjectsToOAMBuffer

.exit
|0CC971| RTS

;===================================================================================================

AnimateSceneSprite_AddObjectsToOAMBuffer:
|0CC972| LDA.w $1E30,X
|0CC975| STA.b $00

|0CC977| LDA.w $1E38,X
|0CC97A| STA.b $01

|0CC97C| LDA.w $1E48,X
|0CC97F| STA.b $02

|0CC981| LDA.w $1E50,X
|0CC984| STA.b $03

|0CC986| STZ.b $04
|0CC988| STZ.b $05

;---------------------------------------------------------------------------------------------------

|0CC98A| PHX

|0CC98B| REP #$30

|0CC98D| LDY.w #$0000
|0CC990| LDX.w $1E08

|0CC993| LDA.b $06
|0CC995| ASL A
|0CC996| ASL A
|0CC997| ADC.w $1E08
|0CC99A| STA.w $1E08

;---------------------------------------------------------------------------------------------------

.next
|0CC99D| LDA.b ($08),Y
|0CC99F| CLC
|0CC9A0| ADC.b $00
|0CC9A2| STA.w $0000,X

|0CC9A5| AND.w #$0100
|0CC9A8| STA.b $0C

|0CC9AA| INY
|0CC9AB| INY

|0CC9AC| LDA.b ($08),Y
|0CC9AE| CLC
|0CC9AF| ADC.b $02
|0CC9B1| STA.w $0001,X

|0CC9B4| CLC
|0CC9B5| ADC.w #$0010
|0CC9B8| CMP.w #$0100
|0CC9BB| BCC .on_screen

|0CC9BD| LDA.w #$00F0
|0CC9C0| STA.w $0001,X

.on_screen
|0CC9C3| INY
|0CC9C4| INY

|0CC9C5| LDA.b ($08),Y
|0CC9C7| EOR.b $04
|0CC9C9| STA.w $0002,X

|0CC9CC| PHX

|0CC9CD| TXA
|0CC9CE| SEC
|0CC9CF| SBC.w #$0800
|0CC9D2| LSR A
|0CC9D3| LSR A
|0CC9D4| TAX

|0CC9D5| SEP #$20

|0CC9D7| INY
|0CC9D8| INY
|0CC9D9| INY

|0CC9DA| LDA.b ($08),Y
|0CC9DC| ORA.b $0D
|0CC9DE| STA.w $0A20,X

|0CC9E1| PLX

|0CC9E2| REP #$20

|0CC9E4| INY

|0CC9E5| INX
|0CC9E6| INX
|0CC9E7| INX
|0CC9E8| INX

|0CC9E9| DEC.b $06
|0CC9EB| BNE .next

;---------------------------------------------------------------------------------------------------

|0CC9ED| SEP #$30

|0CC9EF| PLX

|0CC9F0| RTS

;===================================================================================================

AnimateSceneSprite_MoveTriangle:
|0CC9F1| LDA.w $1E58,X
|0CC9F4| BEQ .no_x_speed

|0CC9F6| ASL A
|0CC9F7| ASL A
|0CC9F8| ASL A
|0CC9F9| ASL A

|0CC9FA| CLC
|0CC9FB| ADC.w $1E28,X
|0CC9FE| STA.w $1E28,X

|0CCA01| LDA.w $1E58,X
|0CCA04| PHP

|0CCA05| LSR A
|0CCA06| LSR A
|0CCA07| LSR A
|0CCA08| LSR A

|0CCA09| LDY.b #$00

|0CCA0B| PLP
|0CCA0C| BPL .positive_x

|0CCA0E| ORA.b #$F0
|0CCA10| DEY

.positive_x
|0CCA11| ADC.w $1E30,X
|0CCA14| STA.w $1E30,X

|0CCA17| TYA
|0CCA18| ADC.w $1E38,X
|0CCA1B| STA.w $1E38,X

;---------------------------------------------------------------------------------------------------

.no_x_speed
|0CCA1E| LDA.w $1E60,X
|0CCA21| BEQ .exit

|0CCA23| ASL A
|0CCA24| ASL A
|0CCA25| ASL A
|0CCA26| ASL A

|0CCA27| CLC
|0CCA28| ADC.w $1E40,X
|0CCA2B| STA.w $1E40,X

|0CCA2E| LDA.w $1E60,X
|0CCA31| PHP

|0CCA32| LSR A
|0CCA33| LSR A
|0CCA34| LSR A
|0CCA35| LSR A

|0CCA36| LDY.b #$00

|0CCA38| PLP
|0CCA39| BPL .positive_y

|0CCA3B| ORA.b #$F0
|0CCA3D| DEY

.positive_y
|0CCA3E| ADC.w $1E48,X
|0CCA41| STA.w $1E48,X

|0CCA44| TYA
|0CCA45| ADC.w $1E50,X
|0CCA48| STA.w $1E50,X

.exit
|0CCA4B| RTS

;===================================================================================================

AnimateSceneSprite_TerminateTriangle:
|0CCA4C| LDA.w $1E02
|0CCA4F| BEQ .exit

|0CCA51| PLA
|0CCA52| PLA

.exit
|0CCA53| RTS

;===================================================================================================

TriforceRoom_PrepGFXSlotForPoly:
|0CCA54| LDA.b #$08
|0CCA56| STA.w $0AA4

|0CCA59| JSL LoadCommonSprites_long
|0CCA5D| JSR TriforceInitializePolyhedralModule

|0CCA60| LDA.b #$01
|0CCA62| STA.w $1E10
|0CCA65| STA.w $1E11
|0CCA68| STA.w $1E12

|0CCA6B| LDA.b #$04
|0CCA6D| STA.w $1E18

|0CCA70| LDA.b #$05
|0CCA72| STA.w $1E19

|0CCA75| LDA.b #$06
|0CCA77| STA.w $1E1A

|0CCA7A| LDA.b #$0F
|0CCA7C| STA.b $13

|0CCA7E| INC.b $11

|0CCA80| RTL

;===================================================================================================

Credits_InitializePolyhedral:
|0CCA81| LDA.b #$08
|0CCA83| STA.w $0AA4

|0CCA86| JSL LoadCommonSprites_long
|0CCA8A| JSR TriforceInitializePolyhedralModule

|0CCA8D| STZ.w $1F02

|0CCA90| LDA.b #$01
|0CCA92| STA.w $1E10
|0CCA95| STA.w $1E11
|0CCA98| STA.w $1E12

|0CCA9B| LDA.b #$07
|0CCA9D| STA.w $1E18

|0CCAA0| LDA.b #$07
|0CCAA2| STA.w $1E19

|0CCAA5| LDA.b #$07
|0CCAA7| STA.w $1E1A

|0CCAAA| LDA.b #$0F
|0CCAAC| STA.b $13

|0CCAAE| INC.b $11

|0CCAB0| RTL

;===================================================================================================

AdvancePolyhedral:
|0CCAB1| PHB
|0CCAB2| PHK
|0CCAB3| PLB

|0CCAB4| JSR .do_advance
|0CCAB7| JSR Scene_AnimateEverySprite

|0CCABA| PLB

|0CCABB| RTL

;===================================================================================================

.do_advance
|0CCABC| LDA.b #$01
|0CCABE| STA.w $012A
|0CCAC1| STA.w $1E02

|0CCAC4| LDA.w $1F00
|0CCAC7| BNE .exit

|0CCAC9| JSR .run_sub

|0CCACC| LDA.b #$01
|0CCACE| STA.w $1F00

|0CCAD1| STZ.w $1E02

|0CCAD4| INC.w $1E0A

.exit
|0CCAD7| RTS

;---------------------------------------------------------------------------------------------------

.run_sub
|0CCAD8| LDA.w $1E00
|0CCADB| JSL JumpTableLocal
|0CCADF| dw IntroPolyhedral_StartUp
|0CCAE1| dw IntroPolyhedral_MoveGrowRotate
|0CCAE3| dw IntroPolyhedral_MoveRotate
|0CCAE5| dw IntroPolyhedral_LockIntoPlace
|0CCAE7| dw EXIT_0CCBA1

;===================================================================================================

IntroPolyhedral_StartUp:
|0CCAE9| LDA.w $1F02
|0CCAEC| SEC
|0CCAED| SBC.b #$02
|0CCAEF| STA.w $1F02

|0CCAF2| CMP.b #$02
|0CCAF4| BCS IntroPolyhedral_MoveGrowRotate

|0CCAF6| STZ.w $1F02

|0CCAF9| INC.w $1E00
|0CCAFC| INC.b $B0

;===================================================================================================

IntroPolyhedral_MoveGrowRotate:
|0CCAFE| LDA.b $B0
|0CCB00| CMP.b #$0A
|0CCB02| BCC .delay

|0CCB04| INC.w $1E00

|0CCB07| LDA.b #$05
|0CCB09| STA.w $1E61

.delay
|0CCB0C| LDA.w $1F05
|0CCB0F| CLC
|0CCB10| ADC.b #$02
|0CCB12| STA.w $1F05

|0CCB15| LDA.w $1F04
|0CCB18| CLC
|0CCB19| ADC.b #$01
|0CCB1B| STA.w $1F04

|0CCB1E| RTS

;===================================================================================================

IntroPolyhedral_MoveRotate:
|0CCB1F| LDA.b #$C0
|0CCB21| STA.w $1E0C

|0CCB24| LDA.b #$01
|0CCB26| STA.w $1E0D

|0CCB29| LDA.w $1F02
|0CCB2C| CMP.b #$80
|0CCB2E| BCS .negative

|0CCB30| ADC.b #$01
|0CCB32| STA.w $1F02

|0CCB35| BRA .just_spin

;---------------------------------------------------------------------------------------------------

.negative
|0CCB37| LDA.w $1F05
|0CCB3A| SEC
|0CCB3B| SBC.b #$0A
|0CCB3D| AND.b #$7F

|0CCB3F| CMP.b #$5C
|0CCB41| BCC .just_spin

|0CCB43| LDA.w $1F04
|0CCB46| SEC
|0CCB47| SBC.b #$0B

|0CCB49| CMP.b #$DC
|0CCB4B| BCC .just_spin

;---------------------------------------------------------------------------------------------------

|0CCB4D| STZ.w $1F04
|0CCB50| STZ.w $1F05

|0CCB53| INC.b $B0
|0CCB55| INC.w $1E00

|0CCB58| LDA.b #$2C ; SFX2.2C
|0CCB5A| STA.w $012E

|0CCB5D| LDA.b #$FF ; RGB: #F8F8F8
|0CCB5F| STA.l $7EC6AE

|0CCB63| LDA.b #$7F
|0CCB65| STA.l $7EC6AF

|0CCB69| INC.b $15

|0CCB6B| LDA.b #$06
|0CCB6D| STA.w $1E01

|0CCB70| RTS

;---------------------------------------------------------------------------------------------------

.just_spin
|0CCB71| LDA.w $1F05
|0CCB74| CLC
|0CCB75| ADC.b #$05
|0CCB77| STA.w $1F05

|0CCB7A| LDA.w $1F04
|0CCB7D| CLC
|0CCB7E| ADC.b #$03
|0CCB80| STA.w $1F04

|0CCB83| RTS

;===================================================================================================

IntroPolyhedral_LockIntoPlace:
|0CCB84| DEC.w $1E01

|0CCB87| LDA.w $1E01
|0CCB8A| BNE EXIT_0CCBA1

|0CCB8C| LDA.l Palettes_Triforce+14
|0CCB90| STA.l $7EC6AE

|0CCB94| LDA.l Palettes_Triforce+15
|0CCB98| STA.l $7EC6AF

|0CCB9C| INC.b $15
|0CCB9E| INC.w $1E00

;---------------------------------------------------------------------------------------------------

#EXIT_0CCBA1:
|0CCBA1| RTS

;===================================================================================================

Credits_AnimateTheTriangles:
|0CCBA2| PHB
|0CCBA3| PHK
|0CCBA4| PLB

|0CCBA5| INC.w $1E0A

|0CCBA8| JSR CreditsTriangle_HandleRotation
|0CCBAB| JSR Scene_AnimateEverySprite

|0CCBAE| PLB

|0CCBAF| RTL

;===================================================================================================

CreditsTriangle_HandleRotation:
|0CCBB0| LDA.b #$01
|0CCBB2| STA.w $012A

|0CCBB5| LDA.w $1F00
|0CCBB8| BNE .exit

|0CCBBA| JSR CreditsTriangle_ApplyRotation

|0CCBBD| LDA.b #$01
|0CCBBF| STA.w $1F00

.exit
|0CCBC2| RTS

;===================================================================================================

CreditsTriangle_ApplyRotation:
|0CCBC3| LDA.w $1F05
|0CCBC6| CLC
|0CCBC7| ADC.b #$03
|0CCBC9| STA.w $1F05

|0CCBCC| LDA.w $1F04
|0CCBCF| CLC
|0CCBD0| ADC.b #$01
|0CCBD2| STA.w $1F04

|0CCBD5| RTS

;===================================================================================================

pool InitializeSceneSprite_TriforceRoomTriangle

.position_x
|0CCBD6| dw $004E
|0CCBD8| dw $005F
|0CCBDA| dw $0072

.position_y
|0CCBDC| dw $009C
|0CCBDE| dw $009C
|0CCBE0| dw $009C

.speed_x
|0CCBE2| db $FE
|0CCBE3| db $00
|0CCBE4| db $02

.speed_y
|0CCBE5| db $04
|0CCBE6| db $FC
|0CCBE7| db $04

endpool

;---------------------------------------------------------------------------------------------------

InitializeSceneSprite_TriforceRoomTriangle:
|0CCBE8| TXA
|0CCBE9| ASL A
|0CCBEA| TAY

|0CCBEB| LDA.w .position_x+0,Y
|0CCBEE| STA.w $1E30,X

|0CCBF1| LDA.w .position_x+1,Y
|0CCBF4| STA.w $1E38,X

|0CCBF7| LDA.w .position_y+0,Y
|0CCBFA| STA.w $1E48,X

|0CCBFD| LDA.w .position_y+1,Y
|0CCC00| STA.w $1E50,X

|0CCC03| LDA.w .speed_x,X
|0CCC06| STA.w $1E58,X

|0CCC09| LDA.w .speed_y,X
|0CCC0C| STA.w $1E60,X

|0CCC0F| INC.w $1E10,X

|0CCC12| RTS

;===================================================================================================

AnimateSceneSprite_TriforceRoomTriangle:
|0CCC13| JSR AnimateSceneSprite_DrawTriforceRoomTriangle
|0CCC16| JSR AnimateSceneSprite_TerminateTriangle
|0CCC19| JSR AnimateSceneSprite_MoveTriangle

|0CCC1C| LDA.w $1E00
|0CCC1F| JSL JumpTableLocal
|0CCC23| dw AnimateTriforceRoomTriangle_Expand
|0CCC25| dw AnimateTriforceRoomTriangle_RotateInPlace
|0CCC27| dw AnimateTriforceRoomTriangle_Contract
|0CCC29| dw AnimateTriforceRoomTriangle_Stopped
|0CCC2B| dw AnimateTriforceRoomTriangle_Stopped

;===================================================================================================

pool AnimateTriforceRoomTriangle_Expand

.speed_x
|0CCC2D| db -1
|0CCC2E| db  0
|0CCC2F| db  1

.speed_y
|0CCC30| db -1
|0CCC31| db -1
|0CCC32| db -1

endpool

;---------------------------------------------------------------------------------------------------

AnimateTriforceRoomTriangle_Expand:
|0CCC33| LDA.w $1E0A
|0CCC36| AND.b #$07
|0CCC38| BNE .no_x_speed

|0CCC3A| LDA.w .speed_x,X
|0CCC3D| CLC
|0CCC3E| ADC.w $1E58,X
|0CCC41| STA.w $1E58,X

.no_x_speed
|0CCC44| LDA.w $1E0A
|0CCC47| AND.b #$03
|0CCC49| BNE .exit

|0CCC4B| LDA.w .speed_y,X
|0CCC4E| CLC
|0CCC4F| ADC.w $1E60,X
|0CCC52| STA.w $1E60,X

.exit
|0CCC55| RTS

;===================================================================================================

AnimateTriforceRoomTriangle_RotateInPlace:
|0CCC56| STZ.w $1E58,X
|0CCC59| STZ.w $1E60,X

|0CCC5C| RTS

;===================================================================================================

pool AnimateTriforceRoomTriangle_Contract AnimateTriforceRoomTriangle_HandleContracting

.speed_negative
|0CCC5D| db $FF
|0CCC5E| db $FF
|0CCC5F| db $FF

.speed_positive
|0CCC60| db $01
|0CCC61| db $01
|0CCC62| db $01

.limit_a
|0CCC63| db $EF

.limit_b
|0CCC64| db $11

.target_x
|0CCC65| db $59
|0CCC66| db $5F
|0CCC67| db $67

.target_y
|0CCC68| db $74
|0CCC69| db $68
|0CCC6A| db $74

endpool

;---------------------------------------------------------------------------------------------------

AnimateTriforceRoomTriangle_Contract:
|0CCC6B| LDA.w $1E0A
|0CCC6E| AND.b #$03
|0CCC70| BNE .dont_contract

|0CCC72| JSR AnimateTriforceRoomTriangle_HandleContracting

.dont_contract
|0CCC75| LDA.w .target_x,X
|0CCC78| CMP.w $1E30,X
|0CCC7B| BNE .check_y

|0CCC7D| STZ.w $1E58,X

.check_y
|0CCC80| LDA.w .target_y,X
|0CCC83| CMP.w $1E48,X
|0CCC86| BNE .exit

|0CCC88| STZ.w $1E60,X

.exit
|0CCC8B| RTS

;===================================================================================================

pool AnimateTriforceRoomTriangle_Stopped

.position_y
|0CCC8C| db $72
|0CCC8D| db $66
|0CCC8E| db $72

endpool

;---------------------------------------------------------------------------------------------------

AnimateTriforceRoomTriangle_Stopped:
|0CCC8F| LDA.w $1E0C
|0CCC92| ORA.w $1E0D
|0CCC95| BNE .no_adjust

|0CCC97| LDA.w .position_y,X
|0CCC9A| STA.w $1E48,X

|0CCC9D| RTS

;---------------------------------------------------------------------------------------------------

.no_adjust
|0CCC9E| LDA.w $1E0C
|0CCCA1| SEC
|0CCCA2| SBC.b #$01
|0CCCA4| STA.w $1E0C

|0CCCA7| LDA.w $1E0D
|0CCCAA| SBC.b #$00
|0CCCAC| STA.w $1E0D

|0CCCAF| RTS

;===================================================================================================

AnimateTriforceRoomTriangle_HandleContracting:
|0CCCB0| LDA.w .target_x,X
|0CCCB3| CMP.w $1E30,X
|0CCCB6| BCC .below_x

|0CCCB8| LDA.w .speed_positive,X
|0CCCBB| BRA .continue_x

.below_x
|0CCCBD| LDA.w .speed_negative,X

.continue_x
|0CCCC0| CLC
|0CCCC1| ADC.w $1E58,X
|0CCCC4| STA.w $1E58,X

|0CCCC7| CMP.w .limit_a
|0CCCCA| BNE .unequal_x

|0CCCCC| LDA.w .limit_a
|0CCCCF| INC A

|0CCCD0| BRA .set_x

.unequal_x
|0CCCD2| CMP.w .limit_b
|0CCCD5| BNE .done_x

|0CCCD7| LDA.w .limit_b
|0CCCDA| DEC A

.set_x
|0CCCDB| STA.w $1E58,X

;---------------------------------------------------------------------------------------------------

.done_x
|0CCCDE| LDA.w .target_y,X
|0CCCE1| CMP.w $1E48,X
|0CCCE4| BCC .below_y

|0CCCE6| LDA.w .speed_positive,X
|0CCCE9| BRA .continue_y

.below_y
|0CCCEB| LDA.w .speed_negative,X

.continue_y
|0CCCEE| CLC
|0CCCEF| ADC.w $1E60,X
|0CCCF2| STA.w $1E60,X

|0CCCF5| CMP.w .limit_a
|0CCCF8| BNE .unequal_y

|0CCCFA| LDA.w .limit_a
|0CCCFD| INC A
|0CCCFE| BRA .set_y

.unequal_y
|0CCD00| CMP.w .limit_b
|0CCD03| BNE .exit

|0CCD05| LDA.w .limit_b
|0CCD08| DEC A

.set_y
|0CCD09| STA.w $1E60,X

.exit
|0CCD0C| RTS

;===================================================================================================

pool InitializeSceneSprite_CreditsTriangle

.position_x
|0CCD0D| dw $0029
|0CCD0F| dw $005F
|0CCD11| dw $0097

.position_y
|0CCD13| dw $0070
|0CCD15| dw $0020
|0CCD17| dw $0070

endpool

;---------------------------------------------------------------------------------------------------

InitializeSceneSprite_CreditsTriangle:
|0CCD19| TXA
|0CCD1A| ASL A
|0CCD1B| TAY

|0CCD1C| LDA.w .position_x+0,Y
|0CCD1F| STA.w $1E30,X

|0CCD22| LDA.w .position_x+1,Y
|0CCD25| STA.w $1E38,X

|0CCD28| LDA.w .position_y+0,Y
|0CCD2B| STA.w $1E48,X

|0CCD2E| LDA.w .position_y+1,Y
|0CCD31| STA.w $1E50,X

|0CCD34| INC.w $1E10,X

|0CCD37| RTS

;===================================================================================================

pool AnimateSceneSprite_CreditsTriangle

.speed_x
|0CCD38| db -1
|0CCD39| db  0
|0CCD3A| db  1

.speed_y
|0CCD3B| db  1
|0CCD3C| db -1
|0CCD3D| db  1

endpool

;---------------------------------------------------------------------------------------------------

AnimateSceneSprite_CreditsTriangle:
|0CCD3E| JSR LoadTriforceSpritePalette
|0CCD41| JSR AnimateSceneSprite_DrawTriforceRoomTriangle
|0CCD44| JSR AnimateSceneSprite_MoveTriangle

|0CCD47| LDA.b $11
|0CCD49| CMP.b #$24
|0CCD4B| BNE .reset

|0CCD4D| LDA.w $1E20,X
|0CCD50| CMP.b #$50
|0CCD52| BEQ .exit

|0CCD54| INC.w $1E20,X

|0CCD57| LDA.w .speed_x,X
|0CCD5A| CLC
|0CCD5B| ADC.w $1E58,X
|0CCD5E| STA.w $1E58,X

|0CCD61| LDA.w .speed_y,X
|0CCD64| CLC
|0CCD65| ADC.w $1E60,X
|0CCD68| STA.w $1E60,X

.exit
|0CCD6B| RTS

;---------------------------------------------------------------------------------------------------

.reset
|0CCD6C| STZ.w $1E20,X

|0CCD6F| RTS

;===================================================================================================

UNREACHABLE_0CCD70:
|0CCD70| dw $0000
|0CCD72| dw $0054
|0CCD74| dw $00A8
|0CCD76| dw $FF8F

;===================================================================================================

FileSelect_FairyY:
|0CCD78| db $4A ; File 1
|0CCD79| db $6A ; File 2
|0CCD7A| db $8A ; File 3
|0CCD7B| db $AF ; Copy
|0CCD7C| db $BF ; KILL

;---------------------------------------------------------------------------------------------------

Module01_FileSelect:
|0CCD7D| STZ.b $E4
|0CCD7F| STZ.b $E5
|0CCD81| STZ.b $EA
|0CCD83| STZ.b $EB

|0CCD85| LDA.b $11
|0CCD87| JSL JumpTableLong
|0CCD8B| dl FileSelect_InitializeGFX
|0CCD8E| dl FileSelect_ReInitSaveFlagsAndGraphics
|0CCD91| dl FileSelect_UploadFancyBackground
|0CCD94| dl FileSelect_TriggerStripesAndAdvance
|0CCD97| dl FileSelect_TriggerNameStripesAndAdvance
|0CCD9A| dl FileSelect_Main

;===================================================================================================

FileSelect_InitializeGFX:
|0CCD9D| JSL EnableForceBlank

|0CCDA1| STZ.w $012A
|0CCDA4| STZ.w $1F0C

|0CCDA7| LDA.b #$0B ; SONG 0B
|0CCDA9| STA.w $012C

|0CCDAC| INC.b $11

|0CCDAE| LDA.b #$02
|0CCDB0| STA.w $0AA9

|0CCDB3| LDA.b #$06
|0CCDB5| STA.w $0AB6
|0CCDB8| STA.w $0710

|0CCDBB| JSL PaletteLoad_UnderworldSet
|0CCDBF| JSL PaletteLoad_OWBG3

|0CCDC3| LDA.b #$00
|0CCDC5| STA.w $0AB2

|0CCDC8| JSL PaletteLoad_HUD

|0CCDCC| STZ.w $0202

|0CCDCF| LDA.b #$01
|0CCDD1| STA.w $0AA4

|0CCDD4| LDA.b #$23
|0CCDD6| STA.w $0AA1

|0CCDD9| LDA.b #$51
|0CCDDB| STA.w $0AA2

|0CCDDE| JSL LoadDefaultGraphics
|0CCDE2| JSL InitializeTilesets
|0CCDE6| JSL LoadFileSelectGraphics

|0CCDEA| JSL Intro_InitializeSRAMWRAM

|0CCDEE| JML DecompressEnemyDamageSubclasses

;===================================================================================================

FileSelect_ReInitSaveFlagsAndGraphics:
|0CCDF2| LDX.b #$05

.clear_next
|0CCDF4| STZ.b $BF,X

|0CCDF6| DEX
|0CCDF7| BPL .clear_next

;===================================================================================================

ReinitializeFileSelectGraphics:
|0CCDF9| LDA.b #$80
|0CCDFB| STA.w $0710

|0CCDFE| JSL EnableForceBlank
|0CCE02| JSL EraseTilemaps_bg3
|0CCE06| JSL PaletteLoadForFileSelect

|0CCE0A| INC.b $15
|0CCE0C| INC.b $11

|0CCE0E| RTL

;===================================================================================================

pool FileSelect_UploadLinoleum

.set0
|0CCE0F| dw $3581, $3582

.set1
|0CCE13| dw $3591, $3592

.pointers
|0CCE17| dw .set0
|0CCE19| dw .set1

endpool

;---------------------------------------------------------------------------------------------------

FileSelect_UploadLinoleum:
|0CCE1B| LDA.w #$0010 ; VRAM $2000
|0CCE1E| STA.w $1002

|0CCE21| LDA.w #$FF07
|0CCE24| STA.w $1004

|0CCE27| STZ.b $00

|0CCE29| LDX.w #$0000

.next
|0CCE2C| LDA.b $00
|0CCE2E| PHA

|0CCE2F| AND.w #$0020
|0CCE32| LSR A
|0CCE33| LSR A
|0CCE34| LSR A
|0CCE35| LSR A
|0CCE36| TAY

|0CCE37| LDA.w .pointers,Y
|0CCE3A| STA.b $02

|0CCE3C| PLA
|0CCE3D| AND.w #$0001
|0CCE40| ASL A
|0CCE41| TAY

|0CCE42| LDA.b ($02),Y
|0CCE44| STA.w $1006,X

|0CCE47| INX
|0CCE48| INX

|0CCE49| INC.b $00

|0CCE4B| LDA.b $00
|0CCE4D| CMP.w #$0400
|0CCE50| BNE .next

|0CCE52| RTS

;===================================================================================================

FileSelect_UploadFancyBackground:
|0CCE53| PHB
|0CCE54| PHK
|0CCE55| PLB

|0CCE56| REP #$30

|0CCE58| JSR FileSelect_UploadLinoleum

;---------------------------------------------------------------------------------------------------

|0CCE5B| LDY.w #$00DE

.next
|0CCE5E| LDA.w FancyBackgroundTileMap,Y
|0CCE61| STA.w $1806,Y

|0CCE64| INX
|0CCE65| INX

|0CCE66| DEY
|0CCE67| DEY
|0CCE68| BPL .next

;---------------------------------------------------------------------------------------------------

|0CCE6A| LDA.w #$1103 ; VRAM $2206
|0CCE6D| STA.b $00

|0CCE6F| LDA.w #$0011
|0CCE72| STA.b $02

.next_stripe
|0CCE74| LDA.b $00
|0CCE76| XBA
|0CCE77| STA.w $1006,X

|0CCE7A| XBA
|0CCE7B| CLC
|0CCE7C| ADC.w #$0020
|0CCE7F| STA.b $00

|0CCE81| INX
|0CCE82| INX

|0CCE83| LDA.w #$3240
|0CCE86| STA.w $1006,X

|0CCE89| INX
|0CCE8A| INX

|0CCE8B| LDA.w #$347F
|0CCE8E| STA.w $1006,X

|0CCE91| INX
|0CCE92| INX

|0CCE93| DEC.b $02
|0CCE95| BPL .next_stripe

;---------------------------------------------------------------------------------------------------

|0CCE97| SEP #$20

|0CCE99| LDA.b #$FF
|0CCE9B| STA.w $1006,X

|0CCE9E| SEP #$10

|0CCEA0| INC.b $11

|0CCEA2| JMP.w FileSelect_TriggerTheStripes

;===================================================================================================

FileSelect_TriggerStripesAndAdvance:
|0CCEA5| LDA.w $0B9D
|0CCEA8| STA.b $C8

.advance_submodule
|0CCEAA| INC.b $11

|0CCEAC| LDA.b #$06
|0CCEAE| STA.b $14

|0CCEB0| RTL

;===================================================================================================

#FileSelect_TriggerNameStripesAndAdvance:
|0CCEB1| JSR FileSelect_SetUpNamesStripes

|0CCEB4| LDA.b #$0F
|0CCEB6| STA.b $13

|0CCEB8| STZ.w $0710

|0CCEBB| BRA .advance_submodule

;===================================================================================================

FileSelect_Main:
|0CCEBD| PHB
|0CCEBE| PHK
|0CCEBF| PLB

|0CCEC0| JSL FileSelect_HandleInput

|0CCEC4| JMP.w FileSelect_TriggerTheStripes

;===================================================================================================

FileSelect_SetUpNamesStripes:
|0CCEC7| PHB
|0CCEC8| PHK
|0CCEC9| PLB

|0CCECA| REP #$10

|0CCECC| LDX.w #$00FD

.next
|0CCECF| LDA.w FileSelectNamesTilemap-1,X
|0CCED2| STA.w $1001,X

|0CCED5| DEX
|0CCED6| BNE .next

;---------------------------------------------------------------------------------------------------

|0CCED8| SEP #$10

|0CCEDA| PLB

|0CCEDB| RTS

;===================================================================================================

FileSelect_HandleInput:
|0CCEDC| LDA.b $C8
|0CCEDE| CMP.b #$03
|0CCEE0| BCS .not_on_a_file

|0CCEE2| STA.w $0B9D

.not_on_a_file
|0CCEE5| REP #$30

|0CCEE7| LDX.w #$0000

;---------------------------------------------------------------------------------------------------

.check_next_file
|0CCEEA| STX.b $00

|0CCEEC| LDA.l SaveFileCopyOffsets,X
|0CCEF0| TAX

|0CCEF1| LDA.l $7003E5,X
|0CCEF5| CMP.w #$55AA
|0CCEF8| BNE .no_name

|0CCEFA| PHX

|0CCEFB| LDX.b $00

|0CCEFD| LDA.w #$0001
|0CCF00| STA.b $BF,X

|0CCF02| PLX

|0CCF03| LDA.w #FileSelect_DrawLink.offset_x
|0CCF06| STA.b $04

|0CCF08| LDA.w #FileSelect_DrawLink.offset_y
|0CCF0B| STA.b $02

|0CCF0D| PHX

|0CCF0E| JSR FileSelect_DrawLink
|0CCF11| JSR FileSelect_DrawDeaths

|0CCF14| PLX

|0CCF15| JSR FileSelect_CopyNameToStripes

.no_name
|0CCF18| LDX.b $00
|0CCF1A| INX
|0CCF1B| INX
|0CCF1C| CPX.w #$0006
|0CCF1F| BCC .check_next_file

;---------------------------------------------------------------------------------------------------

|0CCF21| SEP #$30

|0CCF23| LDX.b $C8

|0CCF25| LDA.b #$1C
|0CCF27| STA.b $00

|0CCF29| LDA.w FileSelect_FairyY,X
|0CCF2C| STA.b $01

|0CCF2E| JSR FileSelect_DrawFairy

|0CCF31| LDY.b #$02

|0CCF33| LDA.b $F6
|0CCF35| AND.b #$C0

|0CCF37| ORA.b $F4
|0CCF39| AND.b #$FC
|0CCF3B| BEQ .exit

|0CCF3D| AND.b #$2C
|0CCF3F| BEQ .didnt_change_selection

|0CCF41| AND.b #$08
|0CCF43| BEQ .pressed_down

;---------------------------------------------------------------------------------------------------

|0CCF45| LDA.b #$20 ; SFX3.20
|0CCF47| STA.w $012F

|0CCF4A| DEC.b $C8
|0CCF4C| BPL .proceed_to_exit

|0CCF4E| LDA.b #$04
|0CCF50| STA.b $C8

|0CCF52| BRA .proceed_to_exit

;---------------------------------------------------------------------------------------------------

.pressed_down
|0CCF54| LDA.b #$20 ; SFX3.20
|0CCF56| STA.w $012F

|0CCF59| INC.b $C8

|0CCF5B| LDA.b $C8
|0CCF5D| CMP.b #$05
|0CCF5F| BNE .proceed_to_exit

|0CCF61| STZ.b $C8

.proceed_to_exit
|0CCF63| BRA .exit

;---------------------------------------------------------------------------------------------------

.didnt_change_selection
|0CCF65| LDA.b #$2C ; SFX2.2C
|0CCF67| STA.w $012E

|0CCF6A| LDA.b $C8
|0CCF6C| CMP.b #$03
|0CCF6E| BEQ .copy_file
|0CCF70| BCS .kill_file

|0CCF72| LDA.b $C8
|0CCF74| ASL A
|0CCF75| TAX

|0CCF76| LDA.b $BF,X
|0CCF78| BEQ .no_file_there

|0CCF7A| LDA.b #$F1 ; SONG F1 - fade
|0CCF7C| STA.w $012C

|0CCF7F| STZ.b $C9

|0CCF81| REP #$20

|0CCF83| LDA.l SaveFileCopyOffsets,X
|0CCF87| STA.b $00

|0CCF89| LDA.b $C8
|0CCF8B| ASL A
|0CCF8C| INC A
|0CCF8D| INC A
|0CCF8E| STA.l $701FFE

|0CCF92| SEP #$20

|0CCF94| BRL CopySaveToWRAM

;---------------------------------------------------------------------------------------------------

.no_file_there
|0CCF97| STZ.b $C9

|0CCF99| LDY.b #$04
|0CCF9B| BRA .set_module

;---------------------------------------------------------------------------------------------------

.copy_file
|0CCF9D| LDY.b #$02
|0CCF9F| BRA .check_for_some_file

.kill_file
|0CCFA1| LDY.b #$03

.check_for_some_file
|0CCFA3| LDA.b $BF
|0CCFA5| ORA.b $C1
|0CCFA7| ORA.b $C3
|0CCFA9| BNE .dont_error_beep

|0CCFAB| LDA.b #$3C ; SFX2.3C
|0CCFAD| STA.w $012E

|0CCFB0| BRA .exit

.dont_error_beep
|0CCFB2| STZ.b $C8

;---------------------------------------------------------------------------------------------------

.set_module
|0CCFB4| STY.b $10

|0CCFB6| STZ.b $11
|0CCFB8| STZ.b $B0

.exit
|0CCFBA| RTL

;===================================================================================================

CopySaveToWRAM:
|0CCFBB| LDX.b #$0F

|0CCFBD| LDA.b #$00
|0CCFBF| STA.l $001AC0,X
|0CCFC3| STA.l $001AE0,X

|0CCFC7| LDA.b #$00
|0CCFC9| STA.l $001AB0,X
|0CCFCD| STA.l $001AD0,X
|0CCFD1| STA.l $001AF0,X

|0CCFD5| PHB

|0CCFD6| LDA.b #$7E
|0CCFD8| PHA
|0CCFD9| PLB

;---------------------------------------------------------------------------------------------------

|0CCFDA| REP #$30

|0CCFDC| LDY.w #$0000
|0CCFDF| LDX.b $00

.copy_next
|0CCFE1| LDA.l $700000,X
|0CCFE5| STA.w $7EF000,Y

|0CCFE8| LDA.l $700100,X
|0CCFEC| STA.w $7EF100,Y

|0CCFEF| LDA.l $700200,X
|0CCFF3| STA.w $7EF200,Y

|0CCFF6| LDA.l $700300,X
|0CCFFA| STA.w $7EF300,Y

|0CCFFD| LDA.l $700400,X
|0CD001| STA.w $7EF400,Y

|0CD004| INX
|0CD005| INX

|0CD006| INY
|0CD007| INY
|0CD008| CPY.w #$0100
|0CD00B| BNE .copy_next

;---------------------------------------------------------------------------------------------------

|0CD00D| PLB

|0CD00E| LDA.w #$0007
|0CD011| STA.l $7EC00D
|0CD015| STA.l $7EC013

|0CD019| LDA.w #$0000
|0CD01C| STA.l $7EC00F
|0CD020| STA.l $7EC015

|0CD024| LDA.w #$6040 ; VRAM $C080
|0CD027| STA.w $0219

|0CD02A| LDA.w #$4841
|0CD02D| STA.w $021D

|0CD030| LDA.w #$007F
|0CD033| STA.w $021F

|0CD036| LDA.w #$FFFF
|0CD039| STA.w $0221

;---------------------------------------------------------------------------------------------------

|0CD03C| SEP #$30

|0CD03E| LDA.b #$80
|0CD040| STA.w $0204

|0CD043| LDA.b #$05
|0CD045| STA.b $10
|0CD047| STZ.b $11

|0CD049| STZ.w $010E

|0CD04C| STZ.w $0710

|0CD04F| STZ.w $0AB2

|0CD052| RTL

;===================================================================================================

Module02_CopyFile:
|0CD053| STZ.w $0B9D

|0CD056| LDA.b $11
|0CD058| JSL JumpTableLong
|0CD05C| dl ReinitializeFileSelectGraphics
|0CD05F| dl FileSelect_UploadFancyBackground
|0CD062| dl CopyFile_FindFileIndices
|0CD065| dl CopyFile_ChooseSelection
|0CD068| dl CopyFile_ChooseTarget
|0CD06B| dl CopyFile_ConfirmSelection

;===================================================================================================

CopyFile_FindFileIndices:
|0CD06E| LDA.b #$07

;===================================================================================================

KILLFile_FindFileIndices:
|0CD070| JSR Intro_SetStripesAndAdvance

|0CD073| LDA.b #$0F
|0CD075| STA.b $13

|0CD077| STZ.w $0710

|0CD07A| LDX.b #$FE

.find_file
|0CD07C| INX
|0CD07D| INX

|0CD07E| LDA.b $BF,X
|0CD080| BEQ .find_file

;---------------------------------------------------------------------------------------------------

|0CD082| TXA
|0CD083| LSR A
|0CD084| STA.b $C8

|0CD086| RTL

;===================================================================================================

CopyFile_ChooseSelection:
|0CD087| PHB
|0CD088| PHK
|0CD089| PLB

|0CD08A| JSR CopyFile_SelectionAndBlinker

|0CD08D| LDA.b $11
|0CD08F| CMP.b #$03
|0CD091| BNE FileSelect_TriggerTheStripes

|0CD093| LDA.b $1A
|0CD095| AND.b #$30
|0CD097| BNE FileSelect_TriggerTheStripes

|0CD099| JSR FilePicker_DeleteHeaderStripe

;===================================================================================================

FileSelect_TriggerTheStripes:
|0CD09C| LDA.b #$01
|0CD09E| STA.b $14

|0CD0A0| PLB

|0CD0A1| RTL

;===================================================================================================

CopyFile_ChooseTarget:
|0CD0A2| PHB
|0CD0A3| PHK
|0CD0A4| PLB

|0CD0A5| JSR CopyFile_TargetSelectionAndBlink

|0CD0A8| LDA.b $11
|0CD0AA| CMP.b #$04
|0CD0AC| BNE .trigger_stripes

|0CD0AE| LDA.b $1A
|0CD0B0| AND.b #$30
|0CD0B2| BNE FileSelect_TriggerTheStripes

|0CD0B4| JSR FilePicker_DeleteHeaderStripe

.trigger_stripes
|0CD0B7| BRA FileSelect_TriggerTheStripes

;===================================================================================================

CopyFile_ConfirmSelection:
|0CD0B9| PHB
|0CD0BA| PHK
|0CD0BB| PLB

|0CD0BC| JSR CopyFile_HandleConfirmation

|0CD0BF| JMP.w FileSelect_TriggerTheStripes

;===================================================================================================

pool FilePicker_DeleteHeaderStripe

.offset
|0CD0C2| dw $0004, $001E

endpool

;---------------------------------------------------------------------------------------------------

FilePicker_DeleteHeaderStripe:
|0CD0C6| REP #$30

|0CD0C8| LDX.w #$0002

|0CD0CB| LDA.w #$00A9

.next_stripe
|0CD0CE| LDY.w #$000B
|0CD0D1| STY.b $00

|0CD0D3| LDY.w .offset,X

.next_byte
|0CD0D6| STA.w $1002,Y

|0CD0D9| INY
|0CD0DA| INY

|0CD0DB| DEC.b $00
|0CD0DD| BNE .next_byte

|0CD0DF| DEX
|0CD0E0| DEX
|0CD0E1| BPL .next_stripe

|0CD0E3| SEP #$30

|0CD0E5| RTS

;===================================================================================================

CopyFile_FairyIndent:
|0CD0E6| db $24 ; File 1
|0CD0E7| db $24 ; File 2
|0CD0E8| db $24 ; File 3
|0CD0E9| db $1C ; Exit

CopyFile_FairyHeight:
|0CD0EA| db $57
|0CD0EB| db $6F
|0CD0EC| db $87
|0CD0ED| db $BF

;===================================================================================================

CopyFile_CopyToMenuStripe:
|0CD0EE| dw $6761, $0E40 ; VRAM $C2CE | 16 bytes | Fixed horizontal
|0CD0F2| dw $00A9

|0CD0F4| dw $8761, $0E40 ; VRAM $C30E | 16 bytes | Fixed horizontal
|0CD0F8| dw $00A9

|0CD0FA| dw $C761, $0E40 ; VRAM $C38E | 16 bytes | Fixed horizontal
|0CD0FE| dw $00A9

|0CD100| dw $E761, $0E40 ; VRAM $C3CE | 16 bytes | Fixed horizontal
|0CD104| dw $00A9

|0CD106| dw $3011, $0100 ; VRAM $2260 | 2 bytes | Horizontal
|0CD10A| dw $3583

|0CD10C| dw $3111, $1440 ; VRAM $2262 | 22 bytes | Fixed horizontal
|0CD110| dw $3585

|0CD112| dw $3C11, $0100 ; VRAM $2278 | 2 bytes | Horizontal
|0CD116| dw $3584

|0CD118| dw $5011, $0EC0 ; VRAM $22A0 | 16 bytes | Fixed vertical
|0CD11C| dw $3586

|0CD11E| dw $5C11, $0EC0 ; VRAM $22B8 | 16 bytes | Fixed vertical
|0CD122| dw $3596

|0CD124| dw $5012, $0100 ; VRAM $24A0 | 2 bytes | Horizontal
|0CD128| dw $3593

|0CD12A| dw $5112, $1440 ; VRAM $24A2 | 22 bytes | Fixed horizontal
|0CD12E| dw $3595

|0CD130| dw $5C12, $0100 ; VRAM $24B8 | 2 bytes | Horizontal
|0CD134| dw $3594

|0CD136| db $FF ; end of stripes data

;===================================================================================================

CopyFile_TargetStripeOffsetAdjuster:
|0CD137| db $00 ; File 1
|0CD138| db $0C ; File 2

;===================================================================================================

CopyFile_NameStripeBufferOffset:
|0CD139| dw $003C ; File 1
|0CD13B| dw $0064 ; File 2
|0CD13D| dw $008C ; File 3

;===================================================================================================

CopyFile_SelectionAndBlinker:
|0CD13F| REP #$10

|0CD141| LDX.w #$00AC
|0CD144| STX.w $1000

.next_header_stripe
|0CD147| LDA.w CopyFile_HeaderStripe,X
|0CD14A| STA.w $1002,X

|0CD14D| DEX
|0CD14E| BPL .next_header_stripe

;---------------------------------------------------------------------------------------------------

|0CD150| REP #$20

|0CD152| LDX.w #$0000

.next_file_name
|0CD155| STX.b $00

|0CD157| LDA.b $BF,X
|0CD159| AND.w #$0001
|0CD15C| BEQ .skip_this_file

|0CD15E| LDA.l SaveFileCopyOffsets,X
|0CD162| TXY
|0CD163| TAX

|0CD164| LDA.w CopyFile_NameStripeBufferOffset,Y
|0CD167| TAY

|0CD168| LDA.w #$0006
|0CD16B| STA.b $02

.next_letter
|0CD16D| LDA.l $7003D9,X
|0CD171| CLC
|0CD172| ADC.w #$1800
|0CD175| STA.w $1002,Y

|0CD178| CLC
|0CD179| ADC.w #$0010
|0CD17C| STA.w $1016,Y

|0CD17F| INX
|0CD180| INX

|0CD181| INY
|0CD182| INY

|0CD183| DEC.b $02
|0CD185| BNE .next_letter

.skip_this_file
|0CD187| LDX.b $00
|0CD189| INX
|0CD18A| INX
|0CD18B| CPX.w #$0006
|0CD18E| BCC .next_file_name

;---------------------------------------------------------------------------------------------------

|0CD190| SEP #$30

|0CD192| LDX.b $C8

|0CD194| LDA.w CopyFile_FairyIndent,X
|0CD197| STA.b $00

|0CD199| LDA.w CopyFile_FairyHeight,X
|0CD19C| STA.b $01

|0CD19E| JSR FileSelect_DrawFairy

|0CD1A1| LDA.b $F6
|0CD1A3| AND.b #$C0

|0CD1A5| ORA.b $F4
|0CD1A7| AND.b #$FC
|0CD1A9| BNE .made_input

|0CD1AB| BRL .exit

.made_input
|0CD1AE| AND.b #$2C
|0CD1B0| BEQ .made_selection

|0CD1B2| AND.b #$08
|0CD1B4| BEQ .didnt_press_up

|0CD1B6| LDX.b $C8
|0CD1B8| DEX
|0CD1B9| BMI .select_exit

;---------------------------------------------------------------------------------------------------

.prev_file_check
|0CD1BB| TXA
|0CD1BC| ASL A
|0CD1BD| TAY

|0CD1BE| LDA.w $00BF,Y
|0CD1C1| BNE .set_new_selection

|0CD1C3| DEX
|0CD1C4| BPL .prev_file_check

.select_exit
|0CD1C6| LDX.b #$03
|0CD1C8| BRA .set_new_selection

;---------------------------------------------------------------------------------------------------

.didnt_press_up
|0CD1CA| LDX.b $C8
|0CD1CC| INX
|0CD1CD| CPX.b #$03
|0CD1CF| BCS .went_too_far

.next_file_check
|0CD1D1| TXA
|0CD1D2| ASL A
|0CD1D3| TAY

|0CD1D4| LDA.w $00BF,Y
|0CD1D7| BNE .set_new_selection

|0CD1D9| INX
|0CD1DA| CPX.b #$03
|0CD1DC| BNE .next_file_check

|0CD1DE| BRA .set_new_selection

.went_too_far
|0CD1E0| CPX.b #$04
|0CD1E2| BNE .set_new_selection

|0CD1E4| LDX.b #$00
|0CD1E6| BRA .next_file_check

.set_new_selection
|0CD1E8| LDA.b #$20 ; SFX3.20
|0CD1EA| STA.w $012F

|0CD1ED| STX.b $C8
|0CD1EF| BRA .exit

;---------------------------------------------------------------------------------------------------

.made_selection
|0CD1F1| LDA.b #$2C ; SFX2.2C
|0CD1F3| STA.w $012E

|0CD1F6| LDA.b $C8
|0CD1F8| CMP.b #$03
|0CD1FA| BEQ ReturnToFileSelect

;---------------------------------------------------------------------------------------------------

|0CD1FC| ASL A
|0CD1FD| STA.b $CC
|0CD1FF| STZ.b $CD

|0CD201| LDX.b #$49

.next_target_stripe
|0CD203| LDA.w CopyFile_CopyToMenuStripe-1,X
|0CD206| STA.w $1035,X

|0CD209| DEX
|0CD20A| BNE .next_target_stripe

;---------------------------------------------------------------------------------------------------

|0CD20C| LDX.b $C8
|0CD20E| CPX.b #$02
|0CD210| BEQ .selected_file_3

|0CD212| LDA.w CopyFile_TargetStripeOffsetAdjuster,X
|0CD215| TAX

|0CD216| LDA.b #$62
|0CD218| STA.w $1036,X
|0CD21B| STA.w $103C,X

|0CD21E| LDA.b #$27
|0CD220| STA.w $1037,X

|0CD223| CLC
|0CD224| ADC.b #$20
|0CD226| STA.w $103D,X

.selected_file_3
|0CD229| INC.b $11

|0CD22B| BRA .reset_cursor

;===================================================================================================

#ReturnToFileSelect:
|0CD22D| LDA.b #$01
|0CD22F| STA.b $10

|0CD231| LDA.b #$01
|0CD233| STA.b $11

|0CD235| STZ.b $B0

.reset_cursor
|0CD237| STZ.b $C8

.exit
|0CD239| RTS

;===================================================================================================

CopyFile_ConfirmationStripes:
|0CD23A| dw $B461, $0E40 ; VRAM $C368 | 16 bytes | Fixed horizontal
|0CD23E| dw $00A9

|0CD240| dw $D461, $0E40 ; VRAM $C3A8 | 16 bytes | Fixed horizontal
|0CD244| dw $00A9

|0CD246| dw $C662, $0D00 ; VRAM $C58C | 14 bytes | Horizontal
|0CD24A| dw $1802, $180E, $180F, $1828, $18A9, $180E, $180A

|0CD258| dw $E662, $0D00 ; VRAM $C5CC | 14 bytes | Horizontal
|0CD25C| dw $1812, $181E, $181F, $1838, $18A9, $181E, $181A

|0CD26A| db $FF ; end of stripes data

;===================================================================================================

CopyFile_TargetFairyX:
|0CD26B| db $8C ; 1
|0CD26C| db $8C ; 2
|0CD26D| db $1C ; Exit

CopyFile_TargetFairyY:
|0CD26E| db $67 ; 1
|0CD26F| db $7F ; 2
|0CD270| db $BF ; Exit

CopyFile_BufferOffset:
|0CD271| dw $0038
|0CD273| dw $0060

CopyFile_TargetNumerals:
|0CD275| dw $18E7 ; 1
|0CD277| dw $18E8 ; 2
|0CD279| dw $18E9 ; 3

;---------------------------------------------------------------------------------------------------

CopyFile_TargetSelectionAndBlink:
|0CD27B| LDA.b #$04
|0CD27D| LDX.b #$01

.next_index_setup
|0CD27F| CMP.b $CC
|0CD281| BEQ .dont_replace_index

|0CD283| STA.b $CA,X

|0CD285| DEX

.dont_replace_index
|0CD286| DEC A
|0CD287| DEC A
|0CD288| BPL .next_index_setup

;---------------------------------------------------------------------------------------------------

|0CD28A| REP #$10

|0CD28C| LDX.w #$0084
|0CD28F| STX.b $0E

.next_header_stripe
|0CD291| LDA.w CopyFile_TargetHeaderStripes,X
|0CD294| STA.w $1002,X

|0CD297| DEX
|0CD298| BPL .next_header_stripe

;---------------------------------------------------------------------------------------------------

|0CD29A| REP #$20

|0CD29C| LDX.w #$0000
|0CD29F| STX.b $04

.next_filename_stripe
|0CD2A1| STX.b $00

|0CD2A3| CPX.b $CC
|0CD2A5| BEQ .skip_this_file

|0CD2A7| LDY.b $04

|0CD2A9| LDA.w CopyFile_BufferOffset,Y
|0CD2AC| TAY

|0CD2AD| INC.b $04
|0CD2AF| INC.b $04

|0CD2B1| LDA.w CopyFile_TargetNumerals,X
|0CD2B4| STA.w $1002,Y

|0CD2B7| CLC
|0CD2B8| ADC.w #$0010
|0CD2BB| STA.w $1016,Y

|0CD2BE| LDA.b $BF,X
|0CD2C0| BEQ .skip_this_file

|0CD2C2| LDA.w #$0006
|0CD2C5| STA.b $02

|0CD2C7| LDA.l SaveFileCopyOffsets,X
|0CD2CB| TAX

.next_letter
|0CD2CC| LDA.l $7003D9,X
|0CD2D0| CLC
|0CD2D1| ADC.w #$1800
|0CD2D4| STA.w $1006,Y

|0CD2D7| CLC
|0CD2D8| ADC.w #$0010
|0CD2DB| STA.w $101A,Y

|0CD2DE| INX
|0CD2DF| INX

|0CD2E0| INY
|0CD2E1| INY

|0CD2E2| DEC.b $02
|0CD2E4| BNE .next_letter

.skip_this_file
|0CD2E6| LDX.b $00
|0CD2E8| INX
|0CD2E9| INX
|0CD2EA| CPX.w #$0006
|0CD2ED| BCC .next_filename_stripe

;---------------------------------------------------------------------------------------------------

|0CD2EF| LDX.b $0E
|0CD2F1| STX.w $1000

|0CD2F4| SEP #$30

|0CD2F6| LDX.b $C8

|0CD2F8| LDA.w CopyFile_TargetFairyX,X
|0CD2FB| STA.b $00

|0CD2FD| LDA.w CopyFile_TargetFairyY,X
|0CD300| STA.b $01

|0CD302| JSR FileSelect_DrawFairy

|0CD305| LDA.b $F6
|0CD307| AND.b #$C0

|0CD309| ORA.b $F4
|0CD30B| AND.b #$FC
|0CD30D| BEQ .exit

|0CD30F| AND.b #$2C
|0CD311| BEQ .made_selection

|0CD313| AND.b #$08
|0CD315| BEQ .didnt_press_up

|0CD317| LDX.b $C8
|0CD319| DEX
|0CD31A| BPL .select_exit

|0CD31C| LDX.b #$02
|0CD31E| BRA .select_exit

.didnt_press_up
|0CD320| LDX.b $C8
|0CD322| INX
|0CD323| CPX.b #$03
|0CD325| BCC .select_exit

|0CD327| LDX.b #$00

;---------------------------------------------------------------------------------------------------

.select_exit
|0CD329| LDA.b #$20 ; SFX3.20
|0CD32B| STA.w $012F

|0CD32E| STX.b $C8
|0CD330| BRA .exit

;---------------------------------------------------------------------------------------------------

.made_selection
|0CD332| LDA.b #$2C ; SFX2.2C
|0CD334| STA.w $012E

|0CD337| LDX.b $C8
|0CD339| CPX.b #$02
|0CD33B| BEQ .selecting_exit

|0CD33D| LDA.b $CA,X
|0CD33F| STA.b $CA
|0CD341| STZ.b $CB

|0CD343| LDX.b #$30

.next_confirm_stripe
|0CD345| LDA.w CopyFile_ConfirmationStripes,X
|0CD348| STA.w $1036,X

|0CD34B| DEX
|0CD34C| BPL .next_confirm_stripe

|0CD34E| LDA.b $C8
|0CD350| BNE .dont_reposition_deleted_name

|0CD352| LDA.b #$62
|0CD354| STA.w $1036
|0CD357| STA.w $103C

|0CD35A| LDA.b #$14
|0CD35C| STA.w $1037

|0CD35F| CLC
|0CD360| ADC.b #$20
|0CD362| STA.w $103D

.dont_reposition_deleted_name
|0CD365| INC.b $11
|0CD367| BRA .reset_selection

;---------------------------------------------------------------------------------------------------

.selecting_exit
|0CD369| JSR ReturnToFileSelect

.reset_selection
|0CD36C| STZ.b $C8

.exit
|0CD36E| RTS

;===================================================================================================

pool CopyFile_HandleConfirmation

.fairy_y
|0CD36F| db $AF ; Yes
|0CD370| db $BF ; No

endpool

;---------------------------------------------------------------------------------------------------

CopyFile_HandleConfirmation:
|0CD371| LDX.b $C8

|0CD373| LDA.b #$1C
|0CD375| STA.b $00

|0CD377| LDA.w .fairy_y,X
|0CD37A| STA.b $01

|0CD37C| JSR FileSelect_DrawFairy

|0CD37F| LDA.b $F6
|0CD381| AND.b #$C0

|0CD383| ORA.b $F4
|0CD385| AND.b #$FC
|0CD387| BEQ .exit

|0CD389| AND.b #$2C
|0CD38B| BEQ .made_selection

|0CD38D| AND.b #$24
|0CD38F| BEQ .select_or_down

|0CD391| LDA.b #$20 ; SFX3.20
|0CD393| STA.w $012F

|0CD396| INC.b $C8

|0CD398| LDA.b $C8
|0CD39A| CMP.b #$02
|0CD39C| BCC .exit

|0CD39E| STZ.b $C8
|0CD3A0| BRA .exit

;---------------------------------------------------------------------------------------------------

.select_or_down
|0CD3A2| LDA.b #$20 ; SFX3.20
|0CD3A4| STA.w $012F

|0CD3A7| DEC.b $C8
|0CD3A9| BPL .exit

|0CD3AB| LDA.b #$01
|0CD3AD| STA.b $C8
|0CD3AF| BRA .exit

;---------------------------------------------------------------------------------------------------

.made_selection
|0CD3B1| LDA.b #$2C ; SFX2.2C
|0CD3B3| STA.w $012E

|0CD3B6| LDA.b $C8
|0CD3B8| BNE .decided_against_it

|0CD3BA| REP #$30

|0CD3BC| LDX.b $CA

|0CD3BE| LDA.l SaveFileCopyOffsets,X
|0CD3C2| TAY

|0CD3C3| LDX.b $CC

|0CD3C5| LDA.l SaveFileCopyOffsets,X
|0CD3C9| TAX

|0CD3CA| JSR CopyFile_CopyData

|0CD3CD| LDX.b $CA

|0CD3CF| LDA.w #$0001
|0CD3D2| STA.b $BF,X

|0CD3D4| SEP #$30

;---------------------------------------------------------------------------------------------------

.decided_against_it
|0CD3D6| JSR ReturnToFileSelect

|0CD3D9| STZ.b $C8

.exit
|0CD3DB| RTS

;===================================================================================================

CopyFile_CopyData:
|0CD3DC| SEP #$20

|0CD3DE| PHB

|0CD3DF| LDA.b #$70
|0CD3E1| PHA
|0CD3E2| PLB

|0CD3E3| REP #$20

|0CD3E5| LDA.w #$0080
|0CD3E8| STA.b $00

.next
|0CD3EA| LDA.w $700000,X
|0CD3ED| STA.w $700000,Y

|0CD3F0| LDA.w $700100,X
|0CD3F3| STA.w $700100,Y

|0CD3F6| LDA.w $700200,X
|0CD3F9| STA.w $700200,Y

|0CD3FC| LDA.w $700300,X
|0CD3FF| STA.w $700300,Y

|0CD402| LDA.w $700400,X
|0CD405| STA.w $700400,Y

|0CD408| INY
|0CD409| INY

|0CD40A| INX
|0CD40B| INX

|0CD40C| DEC.b $00
|0CD40E| BNE .next

;---------------------------------------------------------------------------------------------------

|0CD410| SEP #$20

|0CD412| PLB

|0CD413| REP #$20

|0CD415| RTS

;===================================================================================================

KILLFile_FairyX:
|0CD416| db $24 ; File 1
|0CD417| db $24 ; File 2
|0CD418| db $24 ; File 3
|0CD419| db $1C ; Exit

KILLFile_FairyY:
|0CD41A| db $67 ; File 1
|0CD41B| db $7F ; File 2
|0CD41C| db $97 ; File 3
|0CD41D| db $BF ; Exit

;---------------------------------------------------------------------------------------------------

KILL_OK_stripes:
|0CD41E| dw $A761, $2440 ; VRAM $C34E | 38 bytes | Fixed horizontal
|0CD422| dw $00A9

|0CD424| dw $C761, $2440 ; VRAM $C38E | 38 bytes | Fixed horizontal
|0CD428| dw $00A9

|0CD42A| dw $0762, $2440 ; VRAM $C40E | 38 bytes | Fixed horizontal
|0CD42E| dw $00A9

|0CD430| dw $2762, $2440 ; VRAM $C44E | 38 bytes | Fixed horizontal
|0CD434| dw $00A9

|0CD436| dw $C662, $2100 ; VRAM $C58C | 34 bytes | Horizontal
|0CD43A| dw $1804, $1821, $1800, $1822, $1804, $18A9, $1823, $1807
|0CD44A| dw $18AF, $1822, $18A9, $180F, $180B, $1800, $1828, $1804
|0CD45A| dw $1821

|0CD45C| dw $E662, $2100 ; VRAM $C5CC | 34 bytes | Horizontal
|0CD460| dw $1814, $1831, $1810, $1832, $1814, $18A9, $1833, $1817
|0CD470| dw $18BF, $1832, $18A9, $181F, $181B, $1810, $1838, $1814
|0CD480| dw $1831

|0CD482| db $FF ; end of stripes data

;===================================================================================================

KILL_OK_FileNameStripesAdjustment:
|0CD483| db $00 ; File 1
|0CD484| db $0C ; File 2

;===================================================================================================

Module03_KILLFile:
|0CD485| LDA.b $11
|0CD487| JSL JumpTableLong
|0CD48B| dl ReinitializeFileSelectGraphics
|0CD48E| dl FileSelect_UploadFancyBackground
|0CD491| dl KILLFile_SetUp
|0CD494| dl KILLFile_HandleSelection
|0CD497| dl KILLFile_HandleConfirmation

;===================================================================================================

KILLFile_SetUp:
|0CD49A| LDA.b #$08

|0CD49C| JMP.w KILLFile_FindFileIndices

;===================================================================================================

KILLFile_HandleSelection:
|0CD49F| PHB
|0CD4A0| PHK
|0CD4A1| PLB

|0CD4A2| LDA.b $C8
|0CD4A4| CMP.b #$03
|0CD4A6| BCS .selecting_exit

|0CD4A8| STA.w $0B9D

.selecting_exit
|0CD4AB| JSR KILLFile_ChooseTarget

|0CD4AE| JMP.w FileSelect_TriggerTheStripes

;===================================================================================================

KILLFile_HandleConfirmation:
|0CD4B1| PHB
|0CD4B2| PHK
|0CD4B3| PLB

|0CD4B4| JSR KILLFile_VerifyDeletion

|0CD4B7| JMP.w FileSelect_TriggerTheStripes

;===================================================================================================

KILLFile_ChooseTarget:
|0CD4BA| REP #$10

|0CD4BC| LDX.w #$00FD

.next_blankname_stripe
|0CD4BF| LDA.w KILLFile_BlankNameStripes-1,X
|0CD4C2| STA.w $1001,X

|0CD4C5| DEX
|0CD4C6| BNE .next_blankname_stripe

;---------------------------------------------------------------------------------------------------

|0CD4C8| REP #$20

|0CD4CA| LDX.w #$0000

.next_filename_stripe
|0CD4CD| STX.b $00

|0CD4CF| LDA.b $BF,X
|0CD4D1| AND.w #$0001
|0CD4D4| BEQ .skip_this_file

|0CD4D6| LDA.l SaveFileCopyOffsets,X
|0CD4DA| TAX
|0CD4DB| JSR FileSelect_CopyNameToStripes

.skip_this_file
|0CD4DE| LDX.b $00
|0CD4E0| INX
|0CD4E1| INX
|0CD4E2| CPX.w #$0006
|0CD4E5| BCC .next_filename_stripe

;---------------------------------------------------------------------------------------------------

|0CD4E7| SEP #$30

|0CD4E9| LDX.b $C8

|0CD4EB| LDA.w KILLFile_FairyX,X
|0CD4EE| STA.b $00

|0CD4F0| LDA.w KILLFile_FairyY,X
|0CD4F3| STA.b $01

|0CD4F5| JSR FileSelect_DrawFairy

;---------------------------------------------------------------------------------------------------

|0CD4F8| LDY.b #$02

|0CD4FA| LDA.b $F4
|0CD4FC| AND.b #$20
|0CD4FE| BNE .pressed_down_or_select

|0CD500| LDA.b $F4
|0CD502| AND.b #$0C
|0CD504| BEQ .check_for_pick

|0CD506| AND.b #$04
|0CD508| BNE .pressed_down_or_select

|0CD50A| LDA.b #$20 ; SFX3.20
|0CD50C| STA.w $012F

|0CD50F| LDY.b #$FE

|0CD511| LDX.b $C8
|0CD513| DEX
|0CD514| BMI .select_exit

.check_prev_file
|0CD516| TXA
|0CD517| ASL A
|0CD518| TAY

|0CD519| LDA.w $00BF,Y
|0CD51C| BNE .check_for_pick

|0CD51E| DEX
|0CD51F| BPL .check_prev_file

;---------------------------------------------------------------------------------------------------

.select_exit
|0CD521| LDX.b #$03
|0CD523| BRA .check_for_pick

;---------------------------------------------------------------------------------------------------

.pressed_down_or_select
|0CD525| LDA.b #$20 ; SFX3.20
|0CD527| STA.w $012F

|0CD52A| LDX.b $C8
|0CD52C| INX
|0CD52D| CPX.b #$03
|0CD52F| BCS .not_on_file

.check_next_file
|0CD531| TXA
|0CD532| ASL A
|0CD533| TAY

|0CD534| LDA.w $00BF,Y
|0CD537| BNE .check_for_pick

|0CD539| INX
|0CD53A| CPX.b #$03
|0CD53C| BNE .check_next_file

|0CD53E| BRA .check_for_pick

.not_on_file
|0CD540| CPX.b #$04
|0CD542| BNE .check_for_pick

|0CD544| LDX.b #$00
|0CD546| BRA .check_next_file

;---------------------------------------------------------------------------------------------------

.check_for_pick
|0CD548| STX.b $C8

|0CD54A| LDA.b $F6
|0CD54C| AND.b #$C0

|0CD54E| ORA.b $F4
|0CD550| AND.b #$D0
|0CD552| BEQ .exit

|0CD554| LDA.b #$2C ; SFX2.2C
|0CD556| STA.w $012E

|0CD559| LDA.b $C8
|0CD55B| CMP.b #$03
|0CD55D| BEQ .picked_exit

|0CD55F| LDX.b #$64

.next_ok
|0CD561| LDA.w KILL_OK_stripes,X
|0CD564| STA.w $1002,X

|0CD567| DEX
|0CD568| BPL .next_ok

;---------------------------------------------------------------------------------------------------

|0CD56A| INC.b $11

|0CD56C| LDX.b $C8
|0CD56E| CPX.b #$02
|0CD570| BEQ .no_filename_stripe_adjustment

|0CD572| LDA.w KILL_OK_FileNameStripesAdjustment,X
|0CD575| TAX

|0CD576| LDA.b #$62
|0CD578| STA.w $1002,X
|0CD57B| STA.w $1008,X

|0CD57E| LDA.b #$67
|0CD580| STA.w $1003,X

|0CD583| CLC
|0CD584| ADC.b #$20
|0CD586| STA.w $1009,X

.no_filename_stripe_adjustment
|0CD589| LDA.b $C8
|0CD58B| STA.b $B0

|0CD58D| STZ.b $C8
|0CD58F| BRA .exit

;---------------------------------------------------------------------------------------------------

.picked_exit
|0CD591| SEP #$30

|0CD593| JSR ReturnToFileSelect

.exit
|0CD596| RTS

;===================================================================================================

pool KILLFile_VerifyDeletion

.fairy_pos_y
|0CD597| db $AF
|0CD598| db $BF

endpool

;---------------------------------------------------------------------------------------------------

KILLFile_VerifyDeletion:
|0CD599| LDA.b $B0
|0CD59B| ASL A
|0CD59C| STA.b $00

|0CD59E| SEP #$30

|0CD5A0| LDX.b $C8

|0CD5A2| LDA.b #$1C
|0CD5A4| STA.b $00

|0CD5A6| LDA.w .fairy_pos_y,X
|0CD5A9| STA.b $01

|0CD5AB| JSR FileSelect_DrawFairy

;---------------------------------------------------------------------------------------------------

|0CD5AE| LDY.b #$02

|0CD5B0| LDA.b $F4
|0CD5B2| AND.b #$2C
|0CD5B4| BEQ .not_selection_change_input

|0CD5B6| AND.b #$24
|0CD5B8| BNE .pressed_select_or_down

|0CD5BA| DEX
|0CD5BB| BRA .move_kiss_of_death

.pressed_select_or_down
|0CD5BD| INX

.move_kiss_of_death
|0CD5BE| TXA
|0CD5BF| AND.b #$01
|0CD5C1| STA.b $C8

|0CD5C3| LDA.b #$20 ; SFX3.20
|0CD5C5| STA.w $012F

;---------------------------------------------------------------------------------------------------

.not_selection_change_input
|0CD5C8| LDA.b $F6
|0CD5CA| AND.b #$C0

|0CD5CC| ORA.b $F4
|0CD5CE| AND.b #$D0
|0CD5D0| BEQ .exit

|0CD5D2| LDA.b #$2C ; SFX2.2C
|0CD5D4| STA.w $012E

|0CD5D7| LDA.b $C8
|0CD5D9| BNE .chickened_out

|0CD5DB| LDA.b #$22 ; SFX3.22
|0CD5DD| STA.w $012F
|0CD5E0| STZ.w $012E

|0CD5E3| REP #$30

|0CD5E5| LDA.b $B0
|0CD5E7| AND.w #$00FF
|0CD5EA| ASL A
|0CD5EB| TAX

|0CD5EC| STZ.b $BF,X

|0CD5EE| LDA.l SaveFileCopyOffsets,X
|0CD5F2| TAX

;---------------------------------------------------------------------------------------------------

|0CD5F3| LDY.w #$0000
|0CD5F6| TYA

.clear_next
|0CD5F7| STA.l $700000,X
|0CD5FB| STA.l $700100,X
|0CD5FF| STA.l $700200,X
|0CD603| STA.l $700300,X
|0CD607| STA.l $700400,X
|0CD60B| STA.l $700F00,X
|0CD60F| STA.l $701000,X
|0CD613| STA.l $701100,X
|0CD617| STA.l $701200,X
|0CD61B| STA.l $701300,X

|0CD61F| INX
|0CD620| INX

|0CD621| INY
|0CD622| INY
|0CD623| CPY.w #$0100
|0CD626| BNE .clear_next

;---------------------------------------------------------------------------------------------------

|0CD628| SEP #$30

.chickened_out
|0CD62A| JSR ReturnToFileSelect

|0CD62D| STZ.b $B0

.exit
|0CD62F| RTS

;===================================================================================================

pool FileSelect_CopyNameToStripes

.name_offset
|0CD630| dw $0008
|0CD632| dw $005C
|0CD634| dw $00B0

.hearts_offset
|0CD636| dw $0016
|0CD638| dw $006A
|0CD63A| dw $00BE

endpool

;---------------------------------------------------------------------------------------------------

FileSelect_CopyNameToStripes:
|0CD63C| PHX

|0CD63D| LDY.b $00

|0CD63F| LDA.w .name_offset,Y
|0CD642| TAY

|0CD643| LDA.w #$0006
|0CD646| STA.b $02

;---------------------------------------------------------------------------------------------------

.next_character
|0CD648| LDA.l $7003D9,X
|0CD64C| CLC
|0CD64D| ADC.w #$1800
|0CD650| STA.w $1002,Y

|0CD653| CLC
|0CD654| ADC.w #$0010
|0CD657| STA.w $102C,Y

|0CD65A| INX
|0CD65B| INX

|0CD65C| INY
|0CD65D| INY

|0CD65E| DEC.b $02
|0CD660| BNE .next_character

;---------------------------------------------------------------------------------------------------

|0CD662| PLX

|0CD663| LDY.w #$0001

|0CD666| LDA.l $70036C,X
|0CD66A| AND.w #$00FF
|0CD66D| LSR A
|0CD66E| LSR A
|0CD66F| LSR A
|0CD670| STA.b $02

|0CD672| LDX.b $00

|0CD674| LDY.w .hearts_offset,X
|0CD677| STY.b $04

|0CD679| LDA.w #$0520
|0CD67C| LDX.w #$000A

;---------------------------------------------------------------------------------------------------

.next_heart
|0CD67F| STA.w $1002,Y

|0CD682| INY
|0CD683| INY

|0CD684| DEX
|0CD685| BNE .same_row

|0CD687| PHA

|0CD688| LDA.b $04
|0CD68A| CLC
|0CD68B| ADC.w #$002A
|0CD68E| TAY

|0CD68F| PLA

.same_row
|0CD690| DEC.b $02
|0CD692| BNE .next_heart

|0CD694| RTS

;===================================================================================================

pool FileSelect_DrawLink

.unused
|0CD695| db $01, $06, $0B

.offset_x
|0CD698| db $34

.offset_y
|0CD699| db $43 ; file 1
|0CD69A| db $63 ; file 2
|0CD69B| db $83 ; file 3

.oam_offset
|0CD69C| db $28 ; file 1
|0CD69D| db $3C ; file 2
|0CD69E| db $50 ; file 3

.sword_gfx
|0CD69F| db $85 ; fighter sword
|0CD6A0| db $A1 ; master sword
|0CD6A1| db $A1 ; tempered sword
|0CD6A2| db $A1 ; gold sword

.shield_gfx
|0CD6A3| db $C4 ; fighter shield
|0CD6A4| db $CA ; fire shield
|0CD6A5| db $E0 ; mirror shield

.sword_props
|0CD6A6| db $72 ; file 1
|0CD6A7| db $76 ; file 2
|0CD6A8| db $7A ; file 3

.shield_props
|0CD6A9| db $32 ; file 1
|0CD6AA| db $36 ; file 2
|0CD6AB| db $3A ; file 3

.link_props
|0CD6AC| db $30 ; file 1
|0CD6AD| db $34 ; file 2
|0CD6AE| db $38 ; file 3

endpool

;---------------------------------------------------------------------------------------------------

FileSelect_DrawLink:
|0CD6AF| REP #$30

|0CD6B1| LDA.w #$0116
|0CD6B4| ASL A
|0CD6B5| STA.w $0100

|0CD6B8| LDA.b $00
|0CD6BA| AND.w #$00FF
|0CD6BD| TAX

|0CD6BE| LDA.l SaveFileCopyOffsets,X
|0CD6C2| STA.b $0E

;---------------------------------------------------------------------------------------------------

|0CD6C4| SEP #$30

|0CD6C6| LDA.b $00
|0CD6C8| LSR A
|0CD6C9| TAY

|0CD6CA| LDA.w .oam_offset,Y
|0CD6CD| TAX

|0CD6CE| LDA.b ($04)
|0CD6D0| CLC
|0CD6D1| ADC.b #$0C
|0CD6D3| STA.w $0800,X
|0CD6D6| STA.w $0804,X

|0CD6D9| LDA.b ($02),Y
|0CD6DB| CLC
|0CD6DC| ADC.b #$FB
|0CD6DE| STA.w $0801,X

|0CD6E1| CLC
|0CD6E2| ADC.b #$08
|0CD6E4| STA.w $0805,X

|0CD6E7| LDA.w .sword_props,Y
|0CD6EA| STA.w $0803,X
|0CD6ED| STA.w $0807,X

;---------------------------------------------------------------------------------------------------

|0CD6F0| PHY
|0CD6F1| PHX

|0CD6F2| REP #$10

|0CD6F4| LDX.b $0E

|0CD6F6| LDA.l $700359,X

|0CD6FA| SEP #$10

|0CD6FC| PLX

|0CD6FD| TAY
|0CD6FE| DEY
|0CD6FF| BPL .have_sword

|0CD701| LDA.b #$F0
|0CD703| STA.w $0801,X
|0CD706| STA.w $0805,X

|0CD709| INY

.have_sword
|0CD70A| LDA.w .sword_gfx,Y
|0CD70D| STA.w $0802,X

|0CD710| CLC
|0CD711| ADC.b #$10
|0CD713| STA.w $0806,X

;---------------------------------------------------------------------------------------------------

|0CD716| PLY

|0CD717| PHX
|0CD718| TXA

|0CD719| LSR A
|0CD71A| LSR A
|0CD71B| TAX

|0CD71C| LDA.b #$00
|0CD71E| STA.w $0A20,X
|0CD721| STA.w $0A21,X

|0CD724| PLA
|0CD725| CLC
|0CD726| ADC.b #$08
|0CD728| TAX

|0CD729| LDA.b ($04)
|0CD72B| CLC
|0CD72C| ADC.b #$FB
|0CD72E| STA.w $0800,X

|0CD731| LDA.b ($02),Y
|0CD733| CLC
|0CD734| ADC.b #$0A
|0CD736| STA.w $0801,X

|0CD739| LDA.w .shield_props,Y
|0CD73C| STA.w $0803,X

;---------------------------------------------------------------------------------------------------

|0CD73F| PHY
|0CD740| PHX

|0CD741| REP #$10

|0CD743| LDX.b $0E

|0CD745| LDA.l $70035A,X

|0CD749| SEP #$10

|0CD74B| PLX

|0CD74C| TAY
|0CD74D| DEY
|0CD74E| BPL .have_shield

|0CD750| LDA.b #$F0
|0CD752| STA.w $0801,X

|0CD755| INY

.have_shield
|0CD756| LDA.w .shield_gfx,Y
|0CD759| STA.w $0802,X

|0CD75C| PLY
|0CD75D| PHX

|0CD75E| TXA
|0CD75F| LSR A
|0CD760| LSR A
|0CD761| TAX

|0CD762| LDA.b #$02
|0CD764| STA.w $0A20,X

|0CD767| PLA
|0CD768| CLC
|0CD769| ADC.b #$04
|0CD76B| TAX

|0CD76C| LDA.b ($04)
|0CD76E| STA.w $0800,X
|0CD771| STA.w $0804,X

|0CD774| LDA.b #$00
|0CD776| STA.w $0802,X

|0CD779| LDA.b #$02
|0CD77B| STA.w $0806,X

|0CD77E| LDA.w .link_props,Y
|0CD781| STA.w $0803,X

|0CD784| ORA.b #$40
|0CD786| STA.w $0807,X

|0CD789| LDA.b ($02),Y
|0CD78B| STA.w $0801,X

|0CD78E| CLC
|0CD78F| ADC.b #$08
|0CD791| STA.w $0805,X

|0CD794| TXA
|0CD795| LSR A
|0CD796| LSR A
|0CD797| TAX

|0CD798| LDA.b #$02
|0CD79A| STA.w $0A20,X
|0CD79D| STA.w $0A21,X

|0CD7A0| REP #$30

|0CD7A2| RTS

;===================================================================================================

pool FileSelect_DrawFairy

.char
|0CD7A3| db $A8
|0CD7A4| db $AA

endpool

;---------------------------------------------------------------------------------------------------

FileSelect_DrawFairy:
|0CD7A5| LDA.b $00
|0CD7A7| STA.w $0800

|0CD7AA| LDA.b $01
|0CD7AC| STA.w $0801

|0CD7AF| PHX

|0CD7B0| LDX.b #$00

|0CD7B2| LDA.b $1A
|0CD7B4| AND.b #$08
|0CD7B6| BEQ .frame_0

|0CD7B8| INX

.frame_0
|0CD7B9| LDA.w .char,X
|0CD7BC| STA.w $0802

|0CD7BF| PLX

|0CD7C0| LDA.b #$7E
|0CD7C2| STA.w $0803

|0CD7C5| LDA.b #$02
|0CD7C7| STA.w $0A20

;---------------------------------------------------------------------------------------------------

#EXIT_0CD7CA:
|0CD7CA| RTS

;===================================================================================================

pool FileSelect_DrawDeaths

.digit_char
|0CD7CB| db $D0 ; 0
|0CD7CC| db $AC ; 1
|0CD7CD| db $AD ; 2
|0CD7CE| db $BC ; 3
|0CD7CF| db $BD ; 4
|0CD7D0| db $AE ; 5
|0CD7D1| db $AF ; 6
|0CD7D2| db $BE ; 7
|0CD7D3| db $BF ; 8
|0CD7D4| db $C0 ; 9

.buffer_offset
|0CD7D5| db $04 ; ..#
|0CD7D6| db $10 ; .#.
|0CD7D7| db $1C ; #..

.digit_position_x
|0CD7D8| db $0C ; ..#
|0CD7D9| db $04 ; .#.
|0CD7DA| db $FC ; #..

endpool

;---------------------------------------------------------------------------------------------------

FileSelect_DrawDeaths:
|0CD7DB| REP #$30

|0CD7DD| LDA.b $02
|0CD7DF| PHA
|0CD7E0| STA.b $08

|0CD7E2| LDA.b $04
|0CD7E4| PHA
|0CD7E5| STA.b $0A

|0CD7E7| LDX.b $0E

|0CD7E9| LDA.l $700405,X
|0CD7ED| CMP.w #$FFFF

|0CD7F0| BNE .continue

|0CD7F2| JMP.w .exit

;---------------------------------------------------------------------------------------------------

.continue
|0CD7F5| CMP.w #$03E8
|0CD7F8| BCC .under_1000

|0CD7FA| LDA.w #$0009
|0CD7FD| STA.b $02
|0CD7FF| STA.b $04
|0CD801| STA.b $06

|0CD803| BRA .done_number

.under_1000
|0CD805| LDY.w #$0000

.next_100
|0CD808| CMP.w #$000A
|0CD80B| BCC .under_100

|0CD80D| SEC
|0CD80E| SBC.w #$000A

|0CD811| INY
|0CD812| BRA .next_100


.under_100
|0CD814| STA.b $02
|0CD816| TYA
|0CD817| LDY.w #$0000

.next_10
|0CD81A| CMP.w #$000A
|0CD81D| BCC .under_10

|0CD81F| SEC
|0CD820| SBC.w #$000A
|0CD823| INY

|0CD824| BRA .next_10

.under_10
|0CD826| STA.b $04
|0CD828| STY.b $06

;---------------------------------------------------------------------------------------------------

.done_number
|0CD82A| LDX.w #$0004

|0CD82D| LDA.b $06
|0CD82F| BNE .skip_digit

|0CD831| DEX
|0CD832| DEX

|0CD833| LDA.b $04
|0CD835| BNE .skip_digit

|0CD837| DEX
|0CD838| DEX

.skip_digit
|0CD839| SEP #$30

|0CD83B| LDA.b $00
|0CD83D| LSR A
|0CD83E| TAY

|0CD83F| LDA.w .buffer_offset,Y
|0CD842| TAY

;---------------------------------------------------------------------------------------------------

.next_digit
|0CD843| PHX

|0CD844| LDA.b $02,X
|0CD846| TAX

|0CD847| LDA.w .digit_char,X
|0CD84A| STA.w $0802,Y

|0CD84D| PHY

|0CD84E| LDA.b $00
|0CD850| LSR A
|0CD851| TAY

|0CD852| LDA.b ($08),Y
|0CD854| CLC
|0CD855| ADC.b #$10

|0CD857| PLY
|0CD858| STA.w $0801,Y

|0CD85B| PLA
|0CD85C| PHA

|0CD85D| LSR A
|0CD85E| TAX

|0CD85F| LDA.b ($0A)
|0CD861| CLC
|0CD862| ADC.w .digit_position_x,X
|0CD865| STA.w $0800,Y

|0CD868| LDA.b #$3C
|0CD86A| STA.w $0803,Y

|0CD86D| PHY

|0CD86E| TYA
|0CD86F| LSR A
|0CD870| LSR A
|0CD871| TAY

|0CD872| LDA.b #$00
|0CD874| STA.w $0A20,Y

|0CD877| PLY
|0CD878| INY
|0CD879| INY
|0CD87A| INY
|0CD87B| INY

|0CD87C| PLX
|0CD87D| DEX
|0CD87E| DEX
|0CD87F| BPL .next_digit

;---------------------------------------------------------------------------------------------------

|0CD881| REP #$30

.exit
|0CD883| PLA
|0CD884| STA.b $04

|0CD886| PLA
|0CD887| STA.b $02

|0CD889| RTS

;===================================================================================================

Module04_NameFile:
|0CD88A| LDA.b $11
|0CD88C| JSL JumpTableLong
|0CD890| dl NameFile_EraseSave
|0CD893| dl NameFile_FillBackground
|0CD896| dl NameFile_MakeScreenVisible
|0CD899| dl NameFile_DoTheNaming

;===================================================================================================

NameFile_EraseSave:
|0CD89C| JSL ReinitializeFileSelectGraphics

|0CD8A0| LDA.b #$01
|0CD8A2| STA.w $0128

|0CD8A5| STZ.w $0B10
|0CD8A8| STZ.w $0B12
|0CD8AB| STZ.w $0B15

|0CD8AE| STZ.w $00CA
|0CD8B1| STZ.w $00CC

|0CD8B4| LDA.b #$83
|0CD8B6| STA.w $0B11

|0CD8B9| REP #$30

|0CD8BB| LDA.w #$01F0
|0CD8BE| STA.w $0630

|0CD8C1| STZ.b $E4

|0CD8C3| LDA.b $C8
|0CD8C5| ASL A
|0CD8C6| TAX

|0CD8C7| LDA.l SaveFileCopyOffsets,X
|0CD8CB| STA.w $0200

|0CD8CE| TAX

;---------------------------------------------------------------------------------------------------

|0CD8CF| LDY.w #$0000
|0CD8D2| TYA

.next_clear
|0CD8D3| STA.l $700000,X
|0CD8D7| STA.l $700100,X
|0CD8DB| STA.l $700200,X
|0CD8DF| STA.l $700300,X
|0CD8E3| STA.l $700400,X

|0CD8E7| INX
|0CD8E8| INX

|0CD8E9| INY
|0CD8EA| INY
|0CD8EB| CPY.w #$0100
|0CD8EE| BNE .next_clear

;---------------------------------------------------------------------------------------------------

|0CD8F0| LDX.w $0200

|0CD8F3| LDA.w #$00A9
|0CD8F6| STA.l $7003D9,X
|0CD8FA| STA.l $7003DB,X
|0CD8FE| STA.l $7003DD,X
|0CD902| STA.l $7003DF,X
|0CD906| STA.l $7003E1,X
|0CD90A| STA.l $7003E3,X

|0CD90E| SEP #$30

|0CD910| RTL

;===================================================================================================

NameFile_FillBackground:
|0CD911| PHB
|0CD912| PHK
|0CD913| PLB

|0CD914| REP #$30

|0CD916| JSR FileSelect_UploadLinoleum

|0CD919| LDA.w #$FFFF
|0CD91C| STA.w $1006,X

|0CD91F| SEP #$30

|0CD921| PLB

|0CD922| LDA.b #$01
|0CD924| JSR Intro_SetStripesAndAdvance

|0CD927| RTL

;===================================================================================================

NameFile_MakeScreenVisible:
|0CD928| LDA.b #$05
|0CD92A| JSR Intro_SetStripesAndAdvance

|0CD92D| LDA.b #$0F
|0CD92F| STA.b $13

|0CD931| STZ.w $0710

|0CD934| RTL

;===================================================================================================

NameFile_CharacterLayout:
|0CD935| db $06, $07, $5F, $09, $59, $59, $1A, $1B
|0CD93D| db $1C, $1D, $1E, $1F, $20, $21, $60, $23
|0CD945| db $59, $59, $76, $77, $78, $79, $7A, $59
|0CD94D| db $59, $59, $00, $01, $02, $03, $04, $05
|0CD955| db $10, $11, $12, $13, $59, $59, $24, $5F
|0CD95D| db $26, $27, $28, $29, $2A, $2B, $2C, $2D
|0CD965| db $59, $59, $7B, $7C, $7D, $7E, $7F, $59
|0CD96D| db $59, $59, $0A, $0B, $0C, $0D, $0E, $0F
|0CD975| db $40, $41, $42, $59, $59, $59, $2E, $2F
|0CD97D| db $30, $31, $32, $33, $40, $41, $42, $59
|0CD985| db $59, $59, $61, $3F, $45, $46, $59, $59
|0CD98D| db $59, $59, $14, $15, $16, $17, $18, $19
|0CD995| db $44, $59, $6F, $6F, $59, $59, $59, $59
|0CD99D| db $59, $59, $59, $5A, $44, $59, $6F, $6F
|0CD9A5| db $59, $59, $5A, $44, $59, $6F, $6F, $59
|0CD9AD| db $59, $59, $59, $59, $59, $59, $59, $5A

;===================================================================================================

NameFile_CursorPositionX:
|0CD9B5| dw $01F0, $0000, $0010, $0020
|0CD9BD| dw $0030, $0040, $0050, $0060
|0CD9C5| dw $0070, $0080, $0090, $00A0
|0CD9CD| dw $00B0, $00C0, $00D0, $00E0
|0CD9D5| dw $00F0, $0100, $0110, $0120
|0CD9DD| dw $0130, $0140, $0150, $0160
|0CD9E5| dw $0170, $0180, $0190, $01A0
|0CD9ED| dw $01B0, $01C0, $01D0, $01E0

NameFile_CursorIndexMovementX:
|0CD9F5| dw $0001 ; Right
|0CD9F7| dw $00FF ; Left

NameFile_CursorIndexBoundaryX:
|0CD9F9| dw $0020 ; Right
|0CD9FB| dw $00FF ; Left

NameFile_CursorIndexWrapX:
|0CD9FD| dw $0000 ; Right
|0CD9FF| dw $001F ; Left

;===================================================================================================

NameFile_CursorPositionY:
|0CDA01| db $83, $93, $A3, $B3

NameFile_CursorIndexMovementY:
|0CDA05| db $01, $FF

NameFile_CursorIndexBoundaryY:
|0CDA07| db $04, $FF

NameFile_CursorStickY:
|0CDA09| db $00, $03

NameFile_YtoXIndexOffset:
|0CDA0B| dw $0000, $0020, $0040, $0060

;===================================================================================================

NameFile_HeartXPosition:
|0CDA13| db $1F, $2F, $3F, $4F, $5F, $6F

NameFile_CursorMovement:
|0CDA19| dw  -1,   1,  -1,   1
|0CDA21| dw  -1,   1,  -1,   1
|0CDA29| dw  -1,   1,  -1,   1
|0CDA31| dw  -1,   1,  -1,   1
|0CDA39| dw  -2,   2,  -2,   2
|0CDA41| dw  -2,   2,  -2,   2
|0CDA49| dw  -4,   4

;===================================================================================================

NameFile_DoTheNaming:
.check_x_scroll
|0CDA4D| LDY.w $0B13
|0CDA50| BEQ .not_busy_scrolling_x

|0CDA52| TYA
|0CDA53| CMP.b #$31
|0CDA55| BEQ .hit_target_scroll_x

|0CDA57| CLC
|0CDA58| ADC.b #$04
|0CDA5A| STA.w $0B13

.hit_target_scroll_x
|0CDA5D| LDA.w $0B10
|0CDA60| ASL A
|0CDA61| TAX

|0CDA62| REP #$20

|0CDA64| DEY

|0CDA65| LDA.w $0630
|0CDA68| CMP.l NameFile_CursorPositionX,X
|0CDA6C| BNE .not_at_valid_x_position

|0CDA6E| SEP #$20

|0CDA70| LDA.b #$30
|0CDA72| STA.w $0B13

|0CDA75| LDA.b $F0
|0CDA77| AND.b #$03
|0CDA79| BNE .had_lr_input

|0CDA7B| STZ.w $0B13

.had_lr_input
|0CDA7E| JSR NameFile_CheckForScrollInputX
|0CDA81| BRA .check_x_scroll

;---------------------------------------------------------------------------------------------------

.not_at_valid_x_position
|0CDA83| REP #$20

|0CDA85| LDX.w $0B16
|0CDA88| BNE .last_move_left

|0CDA8A| INY
|0CDA8B| INY

.last_move_left
|0CDA8C| LDA.w $0630

|0CDA8F| TYX

|0CDA90| CLC
|0CDA91| ADC.l NameFile_CursorMovement,X
|0CDA95| AND.w #$01FF
|0CDA98| STA.w $0630

|0CDA9B| SEP #$20

|0CDA9D| BRA .check_y_scroll

;---------------------------------------------------------------------------------------------------

.not_busy_scrolling_x
|0CDA9F| JSR NameFile_CheckForScrollInputX

.check_y_scroll
|0CDAA2| LDA.w $0B14
|0CDAA5| BEQ .not_busy_scrolling_y

|0CDAA7| LDX.w $0B15
|0CDAAA| LDY.b #$02

|0CDAAC| LDA.w $0B11
|0CDAAF| CMP.l NameFile_CursorPositionY,X
|0CDAB3| BNE .not_at_valid_y_position

|0CDAB5| STZ.w $0B14

|0CDAB8| JSR NameFile_CheckForScrollInputY
|0CDABB| BRA .check_y_scroll

.not_at_valid_y_position
|0CDABD| BMI .add_y_scroll

|0CDABF| LDY.b #$FE

.add_y_scroll
|0CDAC1| TYA
|0CDAC2| CLC
|0CDAC3| ADC.w $0B11
|0CDAC6| STA.w $0B11
|0CDAC9| BRA .done_y

.not_busy_scrolling_y
|0CDACB| JSR NameFile_CheckForScrollInputY

;---------------------------------------------------------------------------------------------------

.done_y
|0CDACE| LDX.b #$00
|0CDAD0| TXY
|0CDAD1| LDA.b #$18
|0CDAD3| STA.b $00

.next_horizontal_bar_object
|0CDAD5| LDA.b $00
|0CDAD7| STA.w $0800,Y

|0CDADA| CLC
|0CDADB| ADC.b #$08
|0CDADD| STA.b $00

|0CDADF| LDA.w $0B11
|0CDAE2| STA.w $0801,Y

|0CDAE5| LDA.b #$2E
|0CDAE7| STA.w $0802,Y

|0CDAEA| LDA.b #$3C
|0CDAEC| STA.w $0803,Y

|0CDAEF| STZ.w $0A20,X

|0CDAF2| INY
|0CDAF3| INY
|0CDAF4| INY
|0CDAF5| INY

|0CDAF6| INX
|0CDAF7| CPX.b #$1A
|0CDAF9| BNE .next_horizontal_bar_object

;---------------------------------------------------------------------------------------------------

|0CDAFB| PHX

|0CDAFC| LDX.w $0B12

|0CDAFF| LDA.l NameFile_HeartXPosition,X
|0CDB03| STA.w $0800,Y

|0CDB06| LDA.b #$58
|0CDB08| STA.w $0801,Y

|0CDB0B| PLX

|0CDB0C| LDA.b #$29
|0CDB0E| STA.w $0802,Y

|0CDB11| LDA.b #$0C
|0CDB13| STA.w $0803,Y

|0CDB16| STZ.w $0A20,X

|0CDB19| LDA.w $0B13
|0CDB1C| ORA.w $0B14
|0CDB1F| BNE .busy_scrolling

|0CDB21| LDA.b $F4
|0CDB23| AND.b #$10
|0CDB25| BEQ .no_start_press

|0CDB27| JMP.w .confirm_name

.no_start_press
|0CDB2A| LDA.b $F4
|0CDB2C| AND.b #$C0
|0CDB2E| BNE .select_item

|0CDB30| LDA.b $F6
|0CDB32| AND.b #$C0
|0CDB34| BNE .select_item

.busy_scrolling
|0CDB36| JMP.w .exit

.select_item
|0CDB39| LDA.b #$2B ; SFX2.2B
|0CDB3B| STA.w $012E

|0CDB3E| REP #$30

|0CDB40| LDA.w $0B15
|0CDB43| AND.w #$00FF
|0CDB46| ASL A
|0CDB47| TAX

|0CDB48| LDA.l NameFile_YtoXIndexOffset,X
|0CDB4C| CLC
|0CDB4D| ADC.w $0B10
|0CDB50| AND.w #$00FF
|0CDB53| TAX

|0CDB54| SEP #$20

|0CDB56| LDA.l NameFile_CharacterLayout,X
|0CDB5A| CMP.b #$5A
|0CDB5C| BEQ .back_arrow

|0CDB5E| CMP.b #$44
|0CDB60| BEQ .forward_arrow

|0CDB62| CMP.b #$6F
|0CDB64| BEQ .confirm_name

|0CDB66| STA.b $00
|0CDB68| STZ.b $01

|0CDB6A| BRA .written_character

;---------------------------------------------------------------------------------------------------

.back_arrow
|0CDB6C| LDA.w $0B12
|0CDB6F| BNE .nonzero

|0CDB71| LDA.b #$05
|0CDB73| STA.w $0B12

|0CDB76| BRA .exit

.nonzero
|0CDB78| DEC.w $0B12
|0CDB7B| BRA .exit


.forward_arrow
|0CDB7D| INC.w $0B12

|0CDB80| LDA.w $0B12
|0CDB83| CMP.b #$06
|0CDB85| BNE .nowrap

|0CDB87| STZ.w $0B12

.nowrap
|0CDB8A| BRA .exit

;---------------------------------------------------------------------------------------------------

.written_character
|0CDB8C| REP #$30

|0CDB8E| AND.w #$000F
|0CDB91| STA.b $02

|0CDB93| LDA.w $0B12
|0CDB96| AND.w #$00FF
|0CDB99| ASL A
|0CDB9A| TAY

|0CDB9B| CLC
|0CDB9C| ADC.w $0200
|0CDB9F| TAX

|0CDBA0| LDA.b $00
|0CDBA2| AND.w #$FFF0
|0CDBA5| ASL A
|0CDBA6| ORA.b $02
|0CDBA8| STA.l $7003D9,X

|0CDBAC| JSR NameFile_DrawSelectedCharacter

|0CDBAF| BRA .forward_arrow

;---------------------------------------------------------------------------------------------------

.confirm_name
|0CDBB1| REP #$30

|0CDBB3| STZ.b $02

.write_name_to_save
|0CDBB5| LDA.w $0200
|0CDBB8| CLC
|0CDBB9| ADC.b $02
|0CDBBB| TAX

|0CDBBC| LDA.l $7003D9,X
|0CDBC0| CMP.w #$00A9
|0CDBC3| BNE InitializeSaveFile

|0CDBC5| LDA.b $02
|0CDBC7| CMP.w #$000A
|0CDBCA| BEQ .finished

|0CDBCC| INC A
|0CDBCD| INC A
|0CDBCE| STA.b $02
|0CDBD0| BRA .write_name_to_save


.finished
|0CDBD2| SEP #$20

|0CDBD4| LDA.b #$3C ; SFX2.3C
|0CDBD6| STA.w $012E

.exit
|0CDBD9| SEP #$30

|0CDBDB| RTL

;===================================================================================================

InitializeSaveFile:
|0CDBDC| SEP #$30

|0CDBDE| PHB

|0CDBDF| LDA.b #^DefaultSaveFileItems
|0CDBE1| PHA
|0CDBE2| PLB

|0CDBE3| REP #$30

|0CDBE5| LDA.b $C8
|0CDBE7| ASL A
|0CDBE8| INC A
|0CDBE9| INC A
|0CDBEA| STA.l $701FFE

|0CDBEE| TAX

|0CDBEF| LDA.l SaveFileOffsets,X
|0CDBF3| STA.b $00

|0CDBF5| TAX

;---------------------------------------------------------------------------------------------------

|0CDBF6| LDA.w #$55AA
|0CDBF9| STA.l $7003E5,X

|0CDBFD| LDA.w #$F000
|0CDC00| STA.l $70020C,X
|0CDC04| STA.l $70020E,X

|0CDC08| LDA.w #$FFFF
|0CDC0B| STA.l $700405,X

|0CDC0F| LDA.w #$001D
|0CDC12| STA.b $02

;---------------------------------------------------------------------------------------------------

|0CDC14| LDY.w #$003C

|0CDC17| CPX.w #$0000
|0CDC1A| BNE .copy_next

|0CDC1C| LDA.l Player2JoypadReturn
|0CDC20| AND.w #$00FF
|0CDC23| CMP.w #$0060 ; RTS
|0CDC26| BEQ .copy_next

|0CDC28| LDA.l $7003D9
|0CDC2C| CMP.w #$0001
|0CDC2F| BNE .copy_next

|0CDC31| LDA.w #$00F0
|0CDC34| STA.l $700212,X

|0CDC38| LDA.w #$1502
|0CDC3B| STA.l $7003C5,X

|0CDC3F| LDA.w #$0100
|0CDC42| STA.l $7003C7,X

|0CDC46| LDY.w #$0000

;---------------------------------------------------------------------------------------------------

.copy_next
|0CDC49| LDA.w DefaultSaveFileItems,Y
|0CDC4C| STA.l $700340,X

|0CDC50| INX
|0CDC51| INX

|0CDC52| INY
|0CDC53| INY

|0CDC54| DEC.b $02
|0CDC56| BPL .copy_next

;---------------------------------------------------------------------------------------------------

|0CDC58| LDX.b $00

|0CDC5A| LDY.w #$0000
|0CDC5D| TYA

.build_checksum
|0CDC5E| CLC
|0CDC5F| ADC.l $700000,X

|0CDC63| INX
|0CDC64| INX

|0CDC65| INY
|0CDC66| CPY.w #$027F
|0CDC69| BNE .build_checksum

|0CDC6B| STA.b $02

|0CDC6D| LDX.b $00

|0CDC6F| LDA.w #$5A5A
|0CDC72| SEC
|0CDC73| SBC.b $02
|0CDC75| STA.l $7004FE,X

;---------------------------------------------------------------------------------------------------

|0CDC79| SEP #$30

|0CDC7B| PLB

|0CDC7C| JSR ReturnToFileSelect

|0CDC7F| LDA.b #$FF
|0CDC81| STA.w $0128

|0CDC84| LDA.b #$2C ; SFX2.2C
|0CDC86| STA.w $012E

|0CDC89| SEP #$30

|0CDC8B| RTL

;===================================================================================================

NameFile_CheckForScrollInputX:
|0CDC8C| SEP #$30

|0CDC8E| LDA.b $F0
|0CDC90| AND.b #$03
|0CDC92| BEQ .exit

|0CDC94| INC.w $0B13

|0CDC97| DEC A
|0CDC98| STA.w $0B16

|0CDC9B| REP #$30

|0CDC9D| AND.w #$00FF
|0CDCA0| ASL A
|0CDCA1| TAX

|0CDCA2| LDA.w $0B10
|0CDCA5| AND.w #$00FF
|0CDCA8| CLC
|0CDCA9| ADC.l NameFile_CursorIndexMovementX,X
|0CDCAD| CMP.l NameFile_CursorIndexBoundaryX,X
|0CDCB1| BNE .no_wrap

|0CDCB3| LDA.l NameFile_CursorIndexWrapX,X

.no_wrap
|0CDCB7| SEP #$30

|0CDCB9| STA.w $0B10

.exit
|0CDCBC| SEP #$30

|0CDCBE| RTS

;===================================================================================================

NameFile_CheckForScrollInputY:
|0CDCBF| LDA.b $F0
|0CDCC1| AND.b #$0C
|0CDCC3| BEQ .no_input

|0CDCC5| STA.b $02

|0CDCC7| ASL A
|0CDCC8| ORA.w $0B15
|0CDCCB| CMP.b #$10
|0CDCCD| BEQ .set_input

|0CDCCF| LDA.b $02
|0CDCD1| ASL A
|0CDCD2| ASL A
|0CDCD3| ORA.w $0B15

|0CDCD6| LDX.w $0B10

|0CDCD9| CMP.b #$13
|0CDCDB| BEQ .set_input

|0CDCDD| LDA.b $02
|0CDCDF| LSR A
|0CDCE0| LSR A

.next
|0CDCE1| TAX

|0CDCE2| LDA.w $0B15
|0CDCE5| CLC
|0CDCE6| ADC.l NameFile_CursorIndexMovementY-1,X
|0CDCEA| CMP.l NameFile_CursorIndexBoundaryY-1,X
|0CDCEE| BNE .no_stick

|0CDCF0| LDA.l NameFile_CursorStickY-1,X

.no_stick
|0CDCF4| STA.w $0B15
|0CDCF7| BRA .not_this_guy

;---------------------------------------------------------------------------------------------------
; Code from the JP versions
;---------------------------------------------------------------------------------------------------
#UNREACHABLE_0CFDF9:
|0CDCF9| STX.b $01

|0CDCFB| LDX.w $0B15

|0CDCFE| LDA.l NameFile_YtoXIndexOffset,X
|0CDD02| CLC
|0CDD03| ADC.w $0B10
|0CDD06| AND.b #$FF
|0CDD08| TAX

|0CDD09| LDA.l NameFile_CharacterLayout,X
|0CDD0D| CMP.b #$59
|0CDD0F| BNE .not_this_guy

|0CDD11| LDA.b $01
|0CDD13| BRA .next

;---------------------------------------------------------------------------------------------------

.not_this_guy
|0CDD15| INC.w $0B14
|0CDD18| BRA .set_input

.no_input
|0CDD1A| STZ.w $00CA

.set_input
|0CDD1D| LDA.w $0002
|0CDD20| STA.w $00CB

|0CDD23| RTS

;===================================================================================================

pool NameFile_DrawSelectedCharacter

.vram_position_low
|0CDD24| dw $0084
|0CDD26| dw $0086
|0CDD28| dw $0088
|0CDD2A| dw $008A
|0CDD2C| dw $008C
|0CDD2E| dw $008E

endpool

;---------------------------------------------------------------------------------------------------

NameFile_DrawSelectedCharacter:
|0CDD30| PHB
|0CDD31| PHK
|0CDD32| PLB

|0CDD33| LDA.w #$6100 ; VRAM $C200
|0CDD36| ORA.w .vram_position_low,Y
|0CDD39| XBA
|0CDD3A| STA.w $1002

|0CDD3D| XBA
|0CDD3E| CLC
|0CDD3F| ADC.w #$0020

|0CDD42| XBA
|0CDD43| STA.w $1008

|0CDD46| LDA.w #$0100
|0CDD49| STA.w $1004
|0CDD4C| STA.w $100A

|0CDD4F| LDA.l $7003D9,X
|0CDD53| ORA.w #$1800
|0CDD56| STA.w $1006

|0CDD59| CLC
|0CDD5A| ADC.w #$0010
|0CDD5D| STA.w $100C

;---------------------------------------------------------------------------------------------------

|0CDD60| SEP #$30

|0CDD62| LDA.b #$FF
|0CDD64| STA.w $100E

|0CDD67| LDA.b #$01
|0CDD69| STA.b $14

|0CDD6B| PLB

|0CDD6C| RTS

;===================================================================================================

IntroLogoTilemap:
|0CDD6D| dw $0B11, $1900 ; VRAM $2216 | 26 bytes | Horizontal
|0CDD71| dw $1D68, $1D69, $1D6A, $1D6B, $1D5D, $1D5E, $1C30, $1C31
|0CDD81| dw $1C32, $1C33, $1C34, $1C35, $1C36

|0CDD8B| dw $2B11, $1900 ; VRAM $2256 | 26 bytes | Horizontal
|0CDD8F| dw $1D78, $1D79, $1D7A, $1D7B, $1C37, $1C38, $1C39, $1C3A
|0CDD9F| dw $1C3B, $1C3C, $1C3D, $1C3E, $1C3F

|0CDDA9| dw $4611, $2500 ; VRAM $228C | 38 bytes | Horizontal
|0CDDAD| dw $18F7, $1900, $1901, $1902, $1903, $1904, $1905, $1905
|0CDDBD| dw $1906, $1905, $1907, $5907, $1905, $1908, $1909, $190A
|0CDDCD| dw $190B, $190C, $1CF0

|0CDDD3| dw $6611, $2300 ; VRAM $22CC | 36 bytes | Horizontal
|0CDDD7| dw $190D, $190E, $18F9, $390F, $1910, $1911, $1912, $1913
|0CDDE7| dw $1914, $1915, $18FA, $58FA, $1916, $1917, $1918, $18FB
|0CDDF7| dw $1919, $191A

|0CDDFB| dw $8611, $2300 ; VRAM $230C | 36 bytes | Horizontal
|0CDDFF| dw $18F8, $195F, $391B, $391C, $191D, $191E, $191F, $1920
|0CDE0F| dw $1921, $1922, $195F, $195F, $1923, $1924, $1925, $1926
|0CDE1F| dw $1927, $1928

|0CDE23| dw $A811, $1F00 ; VRAM $2350 | 32 bytes | Horizontal
|0CDE27| dw $3929, $392A, $192B, $191E, $192C, $192D, $1938, $1922
|0CDE37| dw $195F, $195F, $1923, $18FC, $192E, $192F, $1930, $1931

|0CDE47| dw $C711, $2300 ; VRAM $238E | 36 bytes | Horizontal
|0CDE4B| dw $1932, $3933, $3934, $195F, $191E, $191F, $1936, $1937
|0CDE5B| dw $1922, $195F, $1939, $1923, $9924, $193A, $193B, $193C
|0CDE6B| dw $193D, $193E

|0CDE6F| dw $E711, $2300 ; VRAM $23CE | 36 bytes | Horizontal
|0CDE73| dw $193F, $3940, $3941, $195F, $1942, $1943, $1944, $1945
|0CDE83| dw $1946, $1947, $1948, $1949, $194A, $194B, $194C, $194D
|0CDE93| dw $194E, $194F

|0CDE97| dw $0612, $2500 ; VRAM $240C | 38 bytes | Horizontal
|0CDE9B| dw $18FD, $1950, $3951, $98F9, $1952, $1953, $1954, $1954
|0CDEAB| dw $1955, $1954, $1954, $1956, $1954, $1957, $1958, $1959
|0CDEBB| dw $195A, $195B, $195C

|0CDEC1| dw $2612, $2B00 ; VRAM $244C | 44 bytes | Horizontal
|0CDEC5| dw $18F1, $18F2, $18F3, $18F4, $18F5, $18F6, $1D60, $1D61
|0CDED5| dw $1D62, $1D63, $1D64, $1D65, $1D66, $1D67, $1D68, $1D69
|0CDEE5| dw $1D6A, $1D6B, $1D6C, $1D6D, $1D6E, $1D6F

|0CDEF1| dw $4C12, $1F00 ; VRAM $2498 | 32 bytes | Horizontal
|0CDEF5| dw $1D70, $1D71, $1D72, $1D73, $1D74, $1D75, $1D76, $1D77
|0CDF05| dw $1D78, $1D79, $1D7A, $1D7B, $1D7C, $1D7D, $1D7E, $1D7F

|0CDF15| dw $8000, $BE41 ; VRAM $0100 | 448 bytes | Fixed horizontal
|0CDF19| dw $10BD

|0CDF1B| dw $6501, $2A40 ; VRAM $02CA | 44 bytes | Fixed horizontal
|0CDF1F| dw $10BE

|0CDF21| dw $8801, $2440 ; VRAM $0310 | 38 bytes | Fixed horizontal
|0CDF25| dw $10BF

|0CDF27| dw $2802, $2440 ; VRAM $0450 | 38 bytes | Fixed horizontal
|0CDF2B| dw $90BF

|0CDF2D| dw $4502, $2A40 ; VRAM $048A | 44 bytes | Fixed horizontal
|0CDF31| dw $90BE

|0CDF33| dw $6A02, $1A40 ; VRAM $04D4 | 28 bytes | Fixed horizontal
|0CDF37| dw $90BD

|0CDF39| dw $4001, $1300 ; VRAM $0280 | 20 bytes | Horizontal
|0CDF3D| dw $11B3, $11B4, $51B4, $51B3, $10BD, $10BD, $11B3, $11B4
|0CDF4D| dw $51B4, $51B3

|0CDF51| dw $5801, $0500 ; VRAM $02B0 | 6 bytes | Horizontal
|0CDF55| dw $11B3, $11B4, $51B4

|0CDF5B| dw $6001, $0900 ; VRAM $02C0 | 10 bytes | Horizontal
|0CDF5F| dw $10B0, $10B1, $10B2, $10B3, $10B4

|0CDF69| dw $8001, $0F00 ; VRAM $0300 | 16 bytes | Horizontal
|0CDF6D| dw $10B5, $10B6, $10B7, $10B8, $10B9, $10BA, $10BB, $10BC

|0CDF7D| dw $A001, $3500 ; VRAM $0340 | 54 bytes | Horizontal
|0CDF81| dw $09C9, $09CA, $09C9, $09CA, $09C9, $09CA, $09C9, $09CA
|0CDF91| dw $09FF, $09E7, $09E8, $09E7, $09E8, $09E7, $09E8, $09E7
|0CDFA1| dw $09E8, $09E7, $09E8, $09E7, $09E8, $09E7, $09E8, $09E7
|0CDFB1| dw $09E8, $09E7, $09E8

|0CDFB7| dw $C001, $3500 ; VRAM $0380 | 54 bytes | Horizontal
|0CDFBB| dw $09D9, $09DA, $09D9, $09DA, $09D9, $09DA, $09D9, $09DA
|0CDFCB| dw $09D9, $09DA, $09D9, $09DA, $09D9, $09DA, $09D9, $09DA
|0CDFDB| dw $09D9, $09DA, $09D9, $09DA, $09D9, $09DA, $09D9, $09DA
|0CDFEB| dw $09D9, $09DA, $09D9

|0CDFF1| dw $E001, $3500 ; VRAM $03C0 | 54 bytes | Horizontal
|0CDFF5| dw $0DB1, $0DB2, $0DB1, $0DB2, $0DB1, $0DB2, $0DB1, $0DB2
|0CE005| dw $0DB1, $0DB2, $0DB1, $0DB2, $0DB1, $0DB2, $0DB1, $0DB2
|0CE015| dw $0DB1, $0DB2, $0DB1, $0DB2, $0DB1, $0DB2, $0DB1, $0DB2
|0CE025| dw $0DB1, $0DB2, $0DB1

|0CE02B| dw $0002, $3500 ; VRAM $0400 | 54 bytes | Horizontal
|0CE02F| dw $8DC9, $8DCA, $8DC9, $8DCA, $8DC9, $8DCA, $8DC9, $8DCA
|0CE03F| dw $8DFF, $8DE7, $8DE8, $8DE7, $8DE8, $8DE7, $8DE8, $8DE7
|0CE04F| dw $8DE8, $8DE7, $8DE8, $8DE7, $8DE8, $8DE7, $8DE8, $8DE7
|0CE05F| dw $8DE8, $8DE7, $8DE8

|0CE065| dw $2002, $0F00 ; VRAM $0440 | 16 bytes | Horizontal
|0CE069| dw $90B5, $90B6, $90B7, $90B8, $90B9, $90BA, $90BB, $90BC

|0CE079| dw $4002, $0900 ; VRAM $0480 | 10 bytes | Horizontal
|0CE07D| dw $90B0, $90B1, $90B2, $90B3, $90B4

|0CE087| dw $6002, $1300 ; VRAM $04C0 | 20 bytes | Horizontal
|0CE08B| dw $91B3, $91B4, $D1B4, $D1B3, $90BD, $90BD, $91B3, $91B4
|0CE09B| dw $D1B4, $D1B3

|0CE09F| dw $7802, $0500 ; VRAM $04F0 | 6 bytes | Horizontal
|0CE0A3| dw $91B3, $91B4, $D1B4

|0CE0A9| dw $8002, $3500 ; VRAM $0500 | 54 bytes | Horizontal
|0CE0AD| dw $11F0, $11F1, $11F0, $11F1, $11F0, $11F1, $11F0, $11F1
|0CE0BD| dw $11F0, $11F1, $11F0, $11F1, $11F0, $11F1, $11F0, $11F1
|0CE0CD| dw $11F0, $11F1, $11F0, $11F1, $11F0, $11F1, $11F0, $11F1
|0CE0DD| dw $11F0, $11F1, $11F0

|0CE0E3| dw $A002, $3500 ; VRAM $0540 | 54 bytes | Horizontal
|0CE0E7| dw $11F2, $11F3, $11F2, $11F3, $11F2, $11F3, $11F2, $11F3
|0CE0F7| dw $11F2, $11F3, $11F2, $11F3, $11F2, $11F3, $11F2, $11F3
|0CE107| dw $11F2, $11F3, $11F2, $11F3, $11F2, $11F3, $11F2, $11F3
|0CE117| dw $11F2, $11F3, $11F2

|0CE11D| dw $3B01, $1980 ; VRAM $0276 | 26 bytes | Vertical
|0CE121| dw $15F6, $15F4, $15CB, $15DB, $15DB, $15DB, $15DB, $15DB
|0CE131| dw $15EB, $15FB, $15FD, $15FD, $15FD

|0CE13B| dw $3C01, $1980 ; VRAM $0278 | 26 bytes | Vertical
|0CE13F| dw $15F7, $15F5, $15DC, $15DC, $15DC, $15DC, $15DC, $15DC
|0CE14F| dw $15B0, $15FC, $15FE, $15FE, $15FE

|0CE159| dw $3D01, $1980 ; VRAM $027A | 26 bytes | Vertical
|0CE15D| dw $15F8, $15CD, $15DD, $15DD, $15DD, $15DD, $15DD, $15DD
|0CE16D| dw $15CC, $15ED, $14BD, $14BD, $15FE

|0CE177| dw $9E00, $2380 ; VRAM $013C | 36 bytes | Vertical
|0CE17B| dw $15F6, $15F4, $15CB, $15DB, $15E9, $15F9, $15CE, $15DE
|0CE18B| dw $15DE, $15DE, $15DE, $15DE, $15DE, $15CC, $15EE, $14BD
|0CE19B| dw $14BD, $14BD

|0CE19F| dw $9F00, $2380 ; VRAM $013E | 36 bytes | Vertical
|0CE1A3| dw $15F7, $15F5, $15DC, $15DC, $15EA, $15FA, $15CF, $15DF
|0CE1B3| dw $15DF, $15DF, $15DF, $15DF, $15DF, $15CC, $15EF, $14BD
|0CE1C3| dw $14BD, $14BD

|0CE1C7| db $FF ; end of stripes data

;===================================================================================================

FancyBackgroundTileMap:
|0CE1C8| dw $4210, $2700 ; VRAM $2084 | 40 bytes | Horizontal
|0CE1CC| dw $3589, $358A, $358B, $358C, $358B, $358C, $358B, $358C
|0CE1DC| dw $358B, $358C, $358B, $358C, $358B, $358C, $358B, $358C
|0CE1EC| dw $358B, $358C, $758A, $7589

|0CE1F4| dw $6210, $0300 ; VRAM $20C4 | 4 bytes | Horizontal
|0CE1F8| dw $3599, $359A

|0CE1FC| dw $6410, $1E40 ; VRAM $20C8 | 32 bytes | Fixed horizontal
|0CE200| dw $347F

|0CE202| dw $7410, $0300 ; VRAM $20E8 | 4 bytes | Horizontal
|0CE206| dw $759A, $7599

|0CE20A| dw $8210, $0300 ; VRAM $2104 | 4 bytes | Horizontal
|0CE20E| dw $35A9, $35AA

|0CE212| dw $8410, $1E40 ; VRAM $2108 | 32 bytes | Fixed horizontal
|0CE216| dw $347F

|0CE218| dw $9410, $0300 ; VRAM $2128 | 4 bytes | Horizontal
|0CE21C| dw $75AA, $75A9

|0CE220| dw $A210, $2700 ; VRAM $2144 | 40 bytes | Horizontal
|0CE224| dw $359D, $35AD, $359B, $359C, $359B, $359C, $359B, $359C
|0CE234| dw $359B, $359C, $359B, $359C, $359B, $359C, $359B, $359C
|0CE244| dw $359B, $359C, $75AD, $759D

|0CE24C| dw $C210, $2700 ; VRAM $2184 | 40 bytes | Horizontal
|0CE250| dw $35AB, $35AC, $35AB, $35AC, $35AB, $35AC, $35AB, $35AC
|0CE260| dw $35AB, $35AC, $35AB, $35AC, $35AB, $35AC, $35AB, $35AC
|0CE270| dw $35AB, $35AC, $75AB, $75AC

|0CE278| dw $E210, $0100 ; VRAM $21C4 | 2 bytes | Horizontal
|0CE27C| dw $3583

|0CE27E| dw $E310, $3240 ; VRAM $21C6 | 52 bytes | Fixed horizontal
|0CE282| dw $3585

|0CE284| dw $FD10, $0100 ; VRAM $21FA | 2 bytes | Horizontal
|0CE288| dw $3584

|0CE28A| dw $0211, $22C0 ; VRAM $2204 | 36 bytes | Fixed vertical
|0CE28E| dw $3586

|0CE290| dw $1D11, $22C0 ; VRAM $223A | 36 bytes | Fixed vertical
|0CE294| dw $3596

|0CE296| dw $4213, $0100 ; VRAM $2684 | 2 bytes | Horizontal
|0CE29A| dw $3593

|0CE29C| dw $4313, $3240 ; VRAM $2686 | 52 bytes | Fixed horizontal
|0CE2A0| dw $3595

|0CE2A2| dw $5D13, $0100 ; VRAM $26BA | 2 bytes | Horizontal
|0CE2A6| dw $3594

;===================================================================================================

FileSelectTilemap:
|0CE2A8| dw $6560, $1B00 ; VRAM $C0CA | 28 bytes | Horizontal
|0CE2AC| dw $180F, $180B, $1800, $1828, $1804, $1821, $18A9, $18A9
|0CE2BC| dw $1822, $1804, $180B, $1804, $1802, $1823

|0CE2C8| dw $8560, $1B00 ; VRAM $C10A | 28 bytes | Horizontal
|0CE2CC| dw $181F, $181B, $1810, $1838, $1814, $1831, $18B9, $18B9
|0CE2DC| dw $1832, $1814, $181B, $1814, $1812, $1833

|0CE2E8| dw $C662, $1700 ; VRAM $C58C | 24 bytes | Horizontal
|0CE2EC| dw $1802, $180E, $180F, $1828, $18A9, $18A9, $180F, $180B
|0CE2FC| dw $1800, $1828, $1804, $1821

|0CE304| dw $E662, $1700 ; VRAM $C5CC | 24 bytes | Horizontal
|0CE308| dw $1812, $181E, $181F, $1838, $18A9, $18A9, $181F, $181B
|0CE318| dw $1810, $1838, $1814, $1831

|0CE320| dw $0663, $1700 ; VRAM $C60C | 24 bytes | Horizontal
|0CE324| dw $1804, $1821, $1800, $1822, $1804, $18A9, $180F, $180B
|0CE334| dw $1800, $1828, $1804, $1821

|0CE33C| dw $2663, $1700 ; VRAM $C64C | 24 bytes | Horizontal
|0CE340| dw $1814, $1831, $1810, $1832, $1814, $18A9, $181F, $181B
|0CE350| dw $1810, $1838, $1814, $1831

|0CE358| db $FF ; end of stripes data

;===================================================================================================

FileSelectNamesTilemap:
|0CE359| dw $2961, $2500 ; VRAM $C252 | 38 bytes | Horizontal
|0CE35D| dw $18E7, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE36D| dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE37D| dw $18A9, $18A9, $18A9

|0CE383| dw $4961, $2500 ; VRAM $C292 | 38 bytes | Horizontal
|0CE387| dw $18F7, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE397| dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE3A7| dw $18A9, $18A9, $18A9

|0CE3AD| dw $A961, $2500 ; VRAM $C352 | 38 bytes | Horizontal
|0CE3B1| dw $18E8, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE3C1| dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE3D1| dw $18A9, $18A9, $18A9

|0CE3D7| dw $C961, $2500 ; VRAM $C392 | 38 bytes | Horizontal
|0CE3DB| dw $18F8, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE3EB| dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE3FB| dw $18A9, $18A9, $18A9

|0CE401| dw $2962, $2500 ; VRAM $C452 | 38 bytes | Horizontal
|0CE405| dw $18E9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE415| dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE425| dw $18A9, $18A9, $18A9

|0CE42B| dw $4962, $2500 ; VRAM $C492 | 38 bytes | Horizontal
|0CE42F| dw $18F9, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE43F| dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE44F| dw $18A9, $18A9, $18A9

|0CE455| db $FF ; end of stripes data

;===================================================================================================

FileSelectKILLFileTilemap:
|0CE456| dw $6560, $1700 ; VRAM $C0CA | 24 bytes | Horizontal
|0CE45A| dw $1804, $1821, $1800, $1822, $1804, $18A9, $180F, $180B
|0CE46A| dw $1800, $1828, $1804, $1821

|0CE472| dw $8560, $1700 ; VRAM $C10A | 24 bytes | Horizontal
|0CE476| dw $1814, $1831, $1810, $1832, $1814, $18A9, $181F, $181B
|0CE486| dw $1810, $1838, $1814, $1831

|0CE48E| dw $0461, $2F00 ; VRAM $C208 | 48 bytes | Horizontal
|0CE492| dw $1826, $1807, $18AF, $1802, $1807, $18A9, $180F, $180B
|0CE4A2| dw $1800, $1828, $1804, $1821, $18A9, $1803, $180E, $18A9
|0CE4B2| dw $1828, $180E, $1824, $18A9, $1826, $1800, $180D, $1823

|0CE4C2| dw $2461, $2F00 ; VRAM $C248 | 48 bytes | Horizontal
|0CE4C6| dw $1836, $1817, $18BF, $1812, $1817, $18A9, $181F, $181B
|0CE4D6| dw $1810, $1838, $1814, $1831, $18A9, $1813, $181E, $18A9
|0CE4E6| dw $1838, $181E, $1834, $18A9, $1836, $1810, $181D, $1833

|0CE4F6| dw $4461, $1300 ; VRAM $C288 | 20 bytes | Horizontal
|0CE4FA| dw $1823, $180E, $18A9, $1804, $1821, $1800, $1822, $1804
|0CE50A| dw $18A9, $186F

|0CE50E| dw $6461, $1300 ; VRAM $C2C8 | 20 bytes | Horizontal
|0CE512| dw $1833, $181E, $18A9, $1814, $1831, $1810, $1832, $1814
|0CE522| dw $18A9, $187F

|0CE526| dw $0663, $0700 ; VRAM $C60C | 8 bytes | Horizontal
|0CE52A| dw $1820, $1824, $18AF, $1823

|0CE532| dw $2663, $0700 ; VRAM $C64C | 8 bytes | Horizontal
|0CE536| dw $1830, $1834, $18BF, $1833

|0CE53E| db $FF ; end of stripes data

;===================================================================================================

KILLFile_BlankNameStripes:
|0CE53F| dw $A761, $2500 ; VRAM $C34E | 38 bytes | Horizontal
|0CE543| dw $18E7, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE553| dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE563| dw $18A9, $18A9, $18A9

|0CE569| dw $C761, $2500 ; VRAM $C38E | 38 bytes | Horizontal
|0CE56D| dw $18F7, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE57D| dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE58D| dw $18A9, $18A9, $18A9

|0CE593| dw $0762, $2500 ; VRAM $C40E | 38 bytes | Horizontal
|0CE597| dw $18E8, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE5A7| dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE5B7| dw $18A9, $18A9, $18A9

|0CE5BD| dw $2762, $2500 ; VRAM $C44E | 38 bytes | Horizontal
|0CE5C1| dw $18F8, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE5D1| dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE5E1| dw $18A9, $18A9, $18A9

|0CE5E7| dw $6762, $2500 ; VRAM $C4CE | 38 bytes | Horizontal
|0CE5EB| dw $18E9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE5FB| dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE60B| dw $18A9, $18A9, $18A9

|0CE611| dw $8762, $2500 ; VRAM $C50E | 38 bytes | Horizontal
|0CE615| dw $18F9, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE625| dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CE635| dw $18A9, $18A9, $18A9

|0CE63B| db $FF ; end of stripes data

;===================================================================================================

FileSelectCopyFileTilemap:
|0CE63C| dw $6560, $1700 ; VRAM $C0CA | 24 bytes | Horizontal
|0CE640| dw $1802, $180E, $180F, $1828, $18A9, $18A9, $180F, $180B
|0CE650| dw $1800, $1828, $1804, $1821

|0CE658| dw $8560, $1700 ; VRAM $C10A | 24 bytes | Horizontal
|0CE65C| dw $1812, $181E, $181F, $1838, $18A9, $18A9, $181F, $181B
|0CE66C| dw $1810, $1838, $1814, $1831

|0CE674| dw $0663, $0700 ; VRAM $C60C | 8 bytes | Horizontal
|0CE678| dw $1820, $1824, $18AF, $1823

|0CE680| dw $2663, $0700 ; VRAM $C64C | 8 bytes | Horizontal
|0CE684| dw $1830, $1834, $18BF, $1833

|0CE68C| db $FF ; end of stripes data

;===================================================================================================

CopyFile_HeaderStripe:
|0CE68D| dw $0461, $1500 ; VRAM $C208 | 22 bytes | Horizontal
|0CE691| dw $1885, $1826, $1807, $18AF, $1802, $1807, $186F, $1886
|0CE6A1| dw $18A9, $18A9, $18A9

|0CE6A7| dw $2461, $1500 ; VRAM $C248 | 22 bytes | Horizontal
|0CE6AB| dw $1895, $1836, $1817, $18BF, $1812, $1817, $187F, $1896
|0CE6BB| dw $18A9, $18A9, $18A9

|0CE6C1| dw $6761, $0F00 ; VRAM $C2CE | 16 bytes | Horizontal
|0CE6C5| dw $18E7, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

|0CE6D5| dw $8761, $0F00 ; VRAM $C30E | 16 bytes | Horizontal
|0CE6D9| dw $18F7, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

|0CE6E9| dw $C761, $0F00 ; VRAM $C38E | 16 bytes | Horizontal
|0CE6ED| dw $18E8, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

|0CE6FD| dw $E761, $0F00 ; VRAM $C3CE | 16 bytes | Horizontal
|0CE701| dw $18F8, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

|0CE711| dw $2762, $0F00 ; VRAM $C44E | 16 bytes | Horizontal
|0CE715| dw $18E9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

|0CE725| dw $4762, $0F00 ; VRAM $C48E | 16 bytes | Horizontal
|0CE729| dw $18F9, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

|0CE739| db $FF ; end of stripes data

;===================================================================================================

CopyFile_TargetHeaderStripes:
|0CE73A| dw $5161, $1500 ; VRAM $C2A2 | 22 bytes | Horizontal
|0CE73E| dw $1885, $1823, $180E, $18A9, $1826, $1807, $18AF, $1802
|0CE74E| dw $1807, $186F, $1886

|0CE754| dw $7161, $1500 ; VRAM $C2E2 | 22 bytes | Horizontal
|0CE758| dw $1895, $1833, $181E, $18B9, $1836, $1817, $18BF, $1812
|0CE768| dw $1817, $187F, $1896

|0CE76E| dw $B461, $0F00 ; VRAM $C368 | 16 bytes | Horizontal
|0CE772| dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

|0CE782| dw $D461, $0F00 ; VRAM $C3A8 | 16 bytes | Horizontal
|0CE786| dw $18A9, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

|0CE796| dw $1462, $0F00 ; VRAM $C428 | 16 bytes | Horizontal
|0CE79A| dw $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

|0CE7AA| dw $3462, $0F00 ; VRAM $C468 | 16 bytes | Horizontal
|0CE7AE| dw $18A9, $1891, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9

|0CE7BE| db $FF ; end of stripes data

;===================================================================================================

NamePlayerTilemap:
|0CE7BF| dw $A410, $2A40 ; VRAM $2148 | 44 bytes | Fixed horizontal
|0CE7C3| dw $147F

|0CE7C5| dw $C410, $2A40 ; VRAM $2188 | 44 bytes | Fixed horizontal
|0CE7C9| dw $147F

|0CE7CB| dw $6311, $1840 ; VRAM $22C6 | 26 bytes | Fixed horizontal
|0CE7CF| dw $147F

|0CE7D1| dw $8311, $1840 ; VRAM $2306 | 26 bytes | Fixed horizontal
|0CE7D5| dw $147F

|0CE7D7| dw $A311, $1840 ; VRAM $2346 | 26 bytes | Fixed horizontal
|0CE7DB| dw $147F

|0CE7DD| dw $E311, $3240 ; VRAM $23C6 | 52 bytes | Fixed horizontal
|0CE7E1| dw $147F

|0CE7E3| dw $0312, $3240 ; VRAM $2406 | 52 bytes | Fixed horizontal
|0CE7E7| dw $147F

|0CE7E9| dw $2312, $3240 ; VRAM $2446 | 52 bytes | Fixed horizontal
|0CE7ED| dw $147F

|0CE7EF| dw $4312, $3240 ; VRAM $2486 | 52 bytes | Fixed horizontal
|0CE7F3| dw $147F

|0CE7F5| dw $6312, $3240 ; VRAM $24C6 | 52 bytes | Fixed horizontal
|0CE7F9| dw $147F

|0CE7FB| dw $8312, $3240 ; VRAM $2506 | 52 bytes | Fixed horizontal
|0CE7FF| dw $147F

|0CE801| dw $A312, $3240 ; VRAM $2546 | 52 bytes | Fixed horizontal
|0CE805| dw $147F

|0CE807| dw $C312, $3240 ; VRAM $2586 | 52 bytes | Fixed horizontal
|0CE80B| dw $147F

|0CE80D| dw $E312, $3240 ; VRAM $25C6 | 52 bytes | Fixed horizontal
|0CE811| dw $147F

|0CE813| dw $0313, $3240 ; VRAM $2606 | 52 bytes | Fixed horizontal
|0CE817| dw $147F

|0CE819| dw $8210, $3300 ; VRAM $2104 | 52 bytes | Horizontal
|0CE81D| dw $1589, $158A, $158B, $158C, $158B, $158C, $158B, $158C
|0CE82D| dw $158B, $158C, $158B, $158C, $158B, $158C, $158B, $158C
|0CE83D| dw $158B, $158C, $158B, $158C, $158B, $158C, $158B, $158C
|0CE84D| dw $558A, $5589

|0CE851| dw $A210, $0300 ; VRAM $2144 | 4 bytes | Horizontal
|0CE855| dw $1599, $159A

|0CE859| dw $BA10, $0300 ; VRAM $2174 | 4 bytes | Horizontal
|0CE85D| dw $559A, $5599

|0CE861| dw $C210, $0300 ; VRAM $2184 | 4 bytes | Horizontal
|0CE865| dw $15A9, $15AA

|0CE869| dw $DA10, $0300 ; VRAM $21B4 | 4 bytes | Horizontal
|0CE86D| dw $559A, $5599

|0CE871| dw $E210, $3300 ; VRAM $21C4 | 52 bytes | Horizontal
|0CE875| dw $159D, $15AD, $159B, $159C, $159B, $159C, $159B, $159C
|0CE885| dw $159B, $159C, $159B, $159C, $159B, $159C, $159B, $159C
|0CE895| dw $159B, $159C, $159B, $159C, $159B, $159C, $159B, $159C
|0CE8A5| dw $55AD, $559D

|0CE8A9| dw $0211, $3300 ; VRAM $2204 | 52 bytes | Horizontal
|0CE8AD| dw $15AB, $15AC, $15AB, $15AC, $15AB, $15AC, $15AB, $15AC
|0CE8BD| dw $15AB, $15AC, $15AB, $15AC, $15AB, $15AC, $15AB, $15AC
|0CE8CD| dw $15AB, $15AC, $15AB, $15AC, $15AB, $15AC, $15AB, $15AC
|0CE8DD| dw $15AB, $15AC

|0CE8E1| dw $4211, $1D00 ; VRAM $2284 | 30 bytes | Horizontal
|0CE8E5| dw $1587, $1588, $1587, $1588, $1587, $1588, $1587, $1588
|0CE8F5| dw $1587, $1588, $1587, $1588, $1587, $1588, $1587

|0CE903| dw $6211, $1B80 ; VRAM $22C4 | 28 bytes | Vertical
|0CE907| dw $15AF, $15A7, $15AF, $15A7, $15AF, $15A7, $15AF, $15A7
|0CE917| dw $15AF, $15A7, $15AF, $15A7, $15AF, $15A7

|0CE923| dw $7011, $0580 ; VRAM $22E0 | 6 bytes | Vertical
|0CE927| dw $15A8, $15AE, $15A8

|0CE92D| dw $C311, $3500 ; VRAM $2386 | 54 bytes | Horizontal
|0CE931| dw $1588, $1598, $1588, $1598, $1588, $1598, $1588, $1598
|0CE941| dw $1588, $1598, $1588, $1598, $1588, $1598, $1588, $1587
|0CE951| dw $1588, $1587, $1588, $1587, $1588, $1587, $1588, $1587
|0CE961| dw $1588, $1587, $1588

|0CE967| dw $FD11, $1380 ; VRAM $23FA | 20 bytes | Vertical
|0CE96B| dw $15A8, $15AE, $15A8, $15AE, $15A8, $15AE, $15A8, $15AE
|0CE97B| dw $15A8, $15AE

|0CE97F| dw $2213, $3700 ; VRAM $2644 | 56 bytes | Horizontal
|0CE983| dw $1597, $1598, $1597, $1598, $1597, $1598, $1597, $1598
|0CE993| dw $1597, $1598, $1597, $1598, $1597, $1598, $1597, $1598
|0CE9A3| dw $1597, $1598, $1597, $1598, $1597, $1598, $1597, $1598
|0CE9B3| dw $1597, $1598, $1597, $1598

|0CE9BB| dw $F011, $12C0 ; VRAM $23E0 | 20 bytes | Fixed vertical
|0CE9BF| dw $158D

|0CE9C1| dw $A460, $2B00 ; VRAM $C148 | 44 bytes | Horizontal
|0CE9C5| dw $18A9, $1821, $1804, $1806, $18AF, $1822, $1823, $1804
|0CE9D5| dw $1821, $18A9, $18A9, $1828, $180E, $1824, $1821, $18A9
|0CE9E5| dw $18A9, $180D, $1800, $180C, $1804, $18A9

|0CE9F1| dw $C460, $2B00 ; VRAM $C188 | 44 bytes | Horizontal
|0CE9F5| dw $18A9, $1831, $1814, $1816, $18BF, $1832, $1833, $1814
|0CEA05| dw $1831, $18A9, $18A9, $1838, $181E, $1834, $1831, $18A9
|0CEA15| dw $18A9, $181D, $1810, $181C, $1814, $18A9

|0CEA21| dw $0262, $3900 ; VRAM $C404 | 58 bytes | Horizontal
|0CEA25| dw $1800, $18A9, $1801, $18A9, $1802, $18A9, $1803, $18A9
|0CEA35| dw $1804, $18A9, $1805, $18A9, $1806, $18A9, $1807, $18A9
|0CEA45| dw $18AF, $18A9, $1809, $18A9, $18A9, $18A9, $18A9, $18A9
|0CEA55| dw $182A, $18A9, $182B, $18A9, $182C

|0CEA5F| dw $2262, $3900 ; VRAM $C444 | 58 bytes | Horizontal
|0CEA63| dw $1810, $18A9, $1811, $18A9, $1812, $18A9, $1813, $18A9
|0CEA73| dw $1814, $18A9, $1815, $18A9, $1816, $18A9, $1817, $18A9
|0CEA83| dw $18BF, $18A9, $1819, $18A9, $18A9, $18A9, $18A9, $18A9
|0CEA93| dw $183A, $18A9, $183B, $18A9, $183C

|0CEA9D| dw $4262, $3900 ; VRAM $C484 | 58 bytes | Horizontal
|0CEAA1| dw $180A, $18A9, $180B, $18A9, $180C, $18A9, $180D, $18A9
|0CEAB1| dw $180E, $18A9, $180F, $18A9, $1820, $18A9, $1821, $18A9
|0CEAC1| dw $1822, $18A9, $1823, $18A9, $18A9, $18A9, $18A9, $18A9
|0CEAD1| dw $1844, $18A9, $18AF, $18A9, $1846

|0CEADB| dw $6262, $3900 ; VRAM $C4C4 | 58 bytes | Horizontal
|0CEADF| dw $181A, $18A9, $181B, $18A9, $181C, $18A9, $181D, $18A9
|0CEAEF| dw $181E, $18A9, $181F, $18A9, $1830, $18A9, $1831, $18A9
|0CEAFF| dw $1832, $18A9, $1833, $18A9, $18A9, $18A9, $18A9, $18A9
|0CEB0F| dw $1854, $18A9, $18BF, $18A9, $1856

|0CEB19| dw $8262, $3900 ; VRAM $C504 | 58 bytes | Horizontal
|0CEB1D| dw $1824, $18A9, $1825, $18A9, $1826, $18A9, $1827, $18A9
|0CEB2D| dw $1828, $18A9, $1829, $18A9, $1880, $18A9, $1881, $18A9
|0CEB3D| dw $1882, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CEB4D| dw $184E, $18A9, $184F, $18A9, $1860

|0CEB57| dw $A262, $3900 ; VRAM $C544 | 58 bytes | Horizontal
|0CEB5B| dw $1834, $18A9, $1835, $18A9, $1836, $18A9, $1837, $18A9
|0CEB6B| dw $1838, $18A9, $1839, $18A9, $1890, $18A9, $1891, $18A9
|0CEB7B| dw $1892, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9, $18A9
|0CEB8B| dw $185E, $18A9, $185F, $18A9, $1870

|0CEB95| dw $CC62, $1100 ; VRAM $C598 | 18 bytes | Horizontal
|0CEB99| dw $18AA, $18A9, $1884, $18A9, $18A9, $18A9, $1804, $180D
|0CEBA9| dw $1803

|0CEBAB| dw $EC62, $1100 ; VRAM $C5D8 | 18 bytes | Horizontal
|0CEBAF| dw $18BA, $18A9, $1894, $18A9, $18A9, $18A9, $1814, $181D
|0CEBBF| dw $1813

|0CEBC1| dw $0066, $3500 ; VRAM $CC00 | 54 bytes | Horizontal
|0CEBC5| dw $182D, $18A9, $182E, $18A9, $182F, $18A9, $1840, $18A9
|0CEBD5| dw $1841, $18A9, $18C0, $18A9, $1843, $18A9, $18A9, $18A9
|0CEBE5| dw $18A9, $18A9, $18E6, $18A9, $18E7, $18A9, $18E8, $18A9
|0CEBF5| dw $18E9, $18A9, $18EA

|0CEBFB| dw $2066, $3500 ; VRAM $CC40 | 54 bytes | Horizontal
|0CEBFF| dw $183D, $18A9, $183E, $18A9, $183F, $18A9, $1850, $18A9
|0CEC0F| dw $1851, $18A9, $18D0, $18A9, $1853, $18A9, $18A9, $18A9
|0CEC1F| dw $18A9, $18A9, $18F6, $18A9, $18F7, $18A9, $18F8, $18A9
|0CEC2F| dw $18F9, $18A9, $18FA

|0CEC35| dw $4066, $3500 ; VRAM $CC80 | 54 bytes | Horizontal
|0CEC39| dw $1847, $18A9, $1848, $18A9, $1849, $18A9, $184A, $18A9
|0CEC49| dw $184B, $18A9, $184C, $18A9, $184D, $18A9, $18A9, $18A9
|0CEC59| dw $18A9, $18A9, $18EB, $18A9, $18EC, $18A9, $18ED, $18A9
|0CEC69| dw $18EE, $18A9, $18EF

|0CEC6F| dw $6066, $3500 ; VRAM $CCC0 | 54 bytes | Horizontal
|0CEC73| dw $1857, $18A9, $1858, $18A9, $1859, $18A9, $185A, $18A9
|0CEC83| dw $185B, $18A9, $185C, $18A9, $185D, $18A9, $18A9, $18A9
|0CEC93| dw $18A9, $18A9, $18FB, $18A9, $18FC, $18A9, $18FD, $18A9
|0CECA3| dw $18FE, $18A9, $18FF

|0CECA9| dw $8066, $3100 ; VRAM $CD00 | 50 bytes | Horizontal
|0CECAD| dw $1861, $18A9, $1862, $18A9, $1863, $18A9, $1880, $18A9
|0CECBD| dw $1881, $18A9, $1882, $18A9, $18A9, $18A9, $18A9, $18A9
|0CECCD| dw $18A9, $18A9, $18C1, $18A9, $186F, $18A9, $1885, $18A9
|0CECDD| dw $1886

|0CECDF| dw $A066, $3100 ; VRAM $CD40 | 50 bytes | Horizontal
|0CECE3| dw $1871, $18A9, $1872, $18A9, $1873, $18A9, $1890, $18A9
|0CECF3| dw $1891, $18A9, $1892, $18A9, $18A9, $18A9, $18A9, $18A9
|0CED03| dw $18A9, $18A9, $18D1, $18A9, $187F, $18A9, $1895, $18A9
|0CED13| dw $1896

|0CED15| dw $C466, $2D00 ; VRAM $CD88 | 46 bytes | Horizontal
|0CED19| dw $18AA, $18A9, $1884, $18A9, $18A9, $18A9, $1804, $180D
|0CED29| dw $1803, $18A9, $18A9, $18A9, $18A9, $18A9, $18AA, $18A9
|0CED39| dw $1884, $18A9, $18A9, $18A9, $1804, $180D, $1803

|0CED47| dw $E466, $2D00 ; VRAM $CDC8 | 46 bytes | Horizontal
|0CED4B| dw $18BA, $18A9, $1894, $18A9, $18A9, $18A9, $1814, $181D
|0CED5B| dw $1813, $18A9, $18A9, $18A9, $18A9, $18A9, $18BA, $18A9
|0CED6B| dw $1894, $18A9, $18A9, $18A9, $1814, $181D, $1813

|0CED79| db $FF ; end of stripes data

;===================================================================================================

pool Intro_DisplayLogo

.object_a
|0CED7A| db $60, $70, $80, $88

.object_b
|0CED7E| db $69, $6B, $6D, $6E

endpool

;---------------------------------------------------------------------------------------------------

Intro_DisplayLogo:
|0CED82| PHB
|0CED83| PHK
|0CED84| PLB

|0CED85| LDY.b #$03
|0CED87| LDX.b #$0C

.next
|0CED89| LDA.b #$02
|0CED8B| STA.w $0A20,Y

|0CED8E| LDA.w .object_a,Y
|0CED91| STA.w $0800,X

|0CED94| LDA.b #$68
|0CED96| STA.w $0801,X

|0CED99| LDA.w .object_b,Y
|0CED9C| STA.w $0802,X

|0CED9F| LDA.b #$32
|0CEDA1| STA.w $0803,X

|0CEDA4| DEX
|0CEDA5| DEX
|0CEDA6| DEX
|0CEDA7| DEX

|0CEDA8| DEY
|0CEDA9| BPL .next

|0CEDAB| PLB

|0CEDAC| RTS

;===================================================================================================

Module14_Attract:
|0CEDAD| LDA.b $13
|0CEDAF| BEQ .continue

|0CEDB1| CMP.b #$80
|0CEDB3| BEQ .continue

|0CEDB5| LDA.b $22
|0CEDB7| BEQ .continue

|0CEDB9| CMP.b #$02
|0CEDBB| BEQ .continue

|0CEDBD| CMP.b #$06
|0CEDBF| BEQ .continue

|0CEDC1| LDA.b $F4
|0CEDC3| AND.b #$90
|0CEDC5| BEQ .continue

|0CEDC7| LDA.b #$09
|0CEDC9| STA.b $22

.continue
|0CEDCB| LDA.b $22
|0CEDCD| ASL A
|0CEDCE| TAX

|0CEDCF| JMP.w (.vectors,X)

;---------------------------------------------------------------------------------------------------

.vectors
|0CEDD2| dw Attract_FadeOut          ; 0x00
|0CEDD4| dw Attract_Initialize       ; 0x01
|0CEDD6| dw Attract_FadeOutSequence  ; 0x02
|0CEDD8| dw Attract_LoadNewScene     ; 0x03
|0CEDDA| dw Attract_FadeInSequence   ; 0x04
|0CEDDC| dw Attract_EnactStory       ; 0x05
|0CEDDE| dw Attract_FadeOutSequence  ; 0x06
|0CEDE0| dw Attract_LoadNewScene     ; 0x07
|0CEDE2| dw Attract_EnactStory       ; 0x08
|0CEDE4| dw Attract_SkipToFileSelect ; 0x09

;===================================================================================================

Attract_FadeOut:
|0CEDE6| JSL Intro_HandleAllTriforceAnimations

|0CEDEA| STZ.w $1F00
|0CEDED| STZ.w $012A

|0CEDF0| JSR Intro_HandleLogoSword

|0CEDF3| LDA.b $13
|0CEDF5| BEQ .fully_faded

|0CEDF7| DEC.b $13

|0CEDF9| RTL

.fully_faded
|0CEDFA| JSL EnableForceBlank

|0CEDFE| LDA.b #$FF
|0CEE00| STA.w $0128
|0CEE03| STZ.w $012A

|0CEE06| STZ.w $1F0C

|0CEE09| INC.b $22

|0CEE0B| RTL


;===================================================================================================

Attract_Initialize:
|0CEE0C| LDX.b #$50

.next
|0CEE0E| STZ.b $20,X

|0CEE10| DEX
|0CEE11| BPL .next

|0CEE13| JSL EraseTilemaps_normal
|0CEE17| JSL TransferAttractPlaques

|0CEE1B| LDA.b #$04
|0CEE1D| STA.w $0AB3

|0CEE20| LDA.b #$01
|0CEE22| STA.w $0AB2
|0CEE25| STZ.w $0AA9

|0CEE28| JSL PaletteLoad_HUD

|0CEE2C| LDA.b #$02
|0CEE2E| STA.w $0AA9

|0CEE31| JSL PaletteLoad_OWBGMain
|0CEE35| JSL PaletteLoad_HUD
|0CEE39| JSL PaletteLoad_LinkArmorAndGloves

|0CEE3D| LDA.b #$00 ; RGB: #000070
|0CEE3F| STA.l $7EC53A

|0CEE43| LDA.b #$38
|0CEE45| STA.l $7EC53B

|0CEE49| INC.b $15

;---------------------------------------------------------------------------------------------------

|0CEE4B| LDA.b #$14
|0CEE4D| STA.b $EA

|0CEE4F| JSR Attract_BuildBackgrounds

|0CEE52| REP #$10

|0CEE54| STZ.w $1CD8

|0CEE57| LDX.w #$0112 ; MESSAGE 0112
|0CEE5A| STX.w $1CF0

|0CEE5D| STZ.b $E8
|0CEE5F| STZ.b $E9

|0CEE61| LDX.w #$1010
|0CEE64| STX.w $0200

|0CEE67| INC.b $22
|0CEE69| INC.b $22
|0CEE6B| INC.b $22

|0CEE6D| SEP #$10

|0CEE6F| JSR Attract_SetUpWindowingHDMA

;---------------------------------------------------------------------------------------------------

|0CEE72| STZ.b $96
|0CEE74| STZ.b $97

|0CEE76| LDA.b #$B0
|0CEE78| STA.b $98

|0CEE7A| LDA.b #$03
|0CEE7C| STA.b $1E
|0CEE7E| STZ.b $1F

|0CEE80| LDA.b #$25 ; Fixed color RGB: #282828
|0CEE82| STA.b $9C

|0CEE84| LDA.b #$45
|0CEE86| STA.b $9D

|0CEE88| LDA.b #$85
|0CEE8A| STA.b $9E

|0CEE8C| LDA.b #$10
|0CEE8E| STA.b $99

|0CEE90| LDA.b #$A3
|0CEE92| STA.b $9A

|0CEE94| STZ.w WBGLOG
|0CEE97| STZ.w WOBJLOG

|0CEE9A| LDA.b #$C0
|0CEE9C| STA.b $9B

|0CEE9E| LDA.b #$06 ; SONG 06
|0CEEA0| STA.w $012C

|0CEEA3| INC.b $27

|0CEEA5| RTL

;===================================================================================================

Attract_FadeInStep:
|0CEEA6| LDA.b $13
|0CEEA8| CMP.b #$0F
|0CEEAA| BEQ .step

|0CEEAC| DEC.b $5E
|0CEEAE| BPL .exit

|0CEEB0| INC.b $13

|0CEEB2| LDA.b #$01
|0CEEB4| STA.b $5E

.exit
|0CEEB6| RTS

.step
|0CEEB7| INC.b $5F

|0CEEB9| RTS

;===================================================================================================

Attract_FadeInSequence:
|0CEEBA| LDA.b $13
|0CEEBC| CMP.b #$0F
|0CEEBE| BEQ Attract_FadedSequenceAdvance

|0CEEC0| DEC.b $5E
|0CEEC2| BPL .exit

|0CEEC4| INC.b $13

|0CEEC6| LDA.b #$01
|0CEEC8| STA.b $5E

.exit
|0CEECA| RTL

;===================================================================================================

Attract_FadeOutSequence:
|0CEECB| LDA.b $13
|0CEECD| BEQ .advance

|0CEECF| DEC.b $5E
|0CEED1| BPL .exit

|0CEED3| DEC.b $13

|0CEED5| LDA.b #$01
|0CEED7| STA.b $5E

.exit
|0CEED9| RTL

.advance
|0CEEDA| JSL EnableForceBlank
|0CEEDE| JSL EraseTilemaps_normal

;===================================================================================================

Attract_FadedSequenceAdvance:
|0CEEE2| INC.b $22

|0CEEE4| RTL

;===================================================================================================

Attract_LoadNewScene:
|0CEEE5| LDA.b $23
|0CEEE7| ASL A
|0CEEE8| TAX

|0CEEE9| JMP.w (.vectors,X)

;---------------------------------------------------------------------------------------------------

.vectors
|0CEEEC| dw AttractScene_PolkaDots    ; 0x00
|0CEEEE| dw AttractScene_WorldMap     ; 0x01
|0CEEF0| dw AttractScene_ThroneRoom   ; 0x02
|0CEEF2| dw AttractScene_Prison       ; 0x03
|0CEEF4| dw AttractScene_AgahnimAltar ; 0x04
|0CEEF6| dw AttractScene_EndOfStory   ; 0x05

;===================================================================================================

AttractScene_PolkaDots:
|0CEEF8| STZ.b $26

|0CEEFA| INC.b $22

|0CEEFC| STZ.b $13

|0CEEFE| RTL

;===================================================================================================

AttractScene_WorldMap:
|0CEEFF| LDA.b #$13
|0CEF01| STA.w BG1SC

|0CEF04| LDA.b #$03
|0CEF06| STA.w BG2SC

|0CEF09| LDA.b #$80
|0CEF0B| STA.b $99

|0CEF0D| LDA.b #$21
|0CEF0F| STA.b $9A

|0CEF11| LDA.b #$07
|0CEF13| STA.w BGMODE
|0CEF16| STA.b $94

|0CEF18| LDA.b #$80
|0CEF1A| STA.w M7SEL

|0CEF1D| JSL WorldMap_LoadLightWorldMap

;---------------------------------------------------------------------------------------------------

|0CEF21| REP #$20

|0CEF23| LDA.w #$00ED
|0CEF26| STA.w $063A

|0CEF29| LDA.w #$0100
|0CEF2C| STA.w $0638

|0CEF2F| LDA.w #$0080
|0CEF32| STA.w $0120

|0CEF35| LDA.w #$00C0
|0CEF38| STA.w $0124

|0CEF3B| SEP #$20

|0CEF3D| LDA.b #$FF
|0CEF3F| STA.w $0637

|0CEF42| JSR Attract_ControlMapZoom

|0CEF45| LDA.b #$01
|0CEF47| STA.b $25

|0CEF49| INC.b $22

|0CEF4B| STZ.b $13

|0CEF4D| RTL

;===================================================================================================

AttractScene_ThroneRoom:
|0CEF4E| STZ.w HDMAEN
|0CEF51| STZ.b $9B

|0CEF53| LDA.b #$02
|0CEF55| STA.b $99

|0CEF57| LDA.b #$20
|0CEF59| STA.b $9A

|0CEF5B| LDA.b #$0A
|0CEF5D| STA.w $0AA4

|0CEF60| JSL LoadCommonSprites_long

|0CEF64| REP #$20

|0CEF66| LDA.b $20
|0CEF68| PHA

|0CEF69| LDA.b $22
|0CEF6B| PHA

|0CEF6C| SEP #$20

|0CEF6E| LDA.b #$74
|0CEF70| JSL LoadRoomForAttract

;---------------------------------------------------------------------------------------------------

|0CEF74| REP #$20

|0CEF76| PLA
|0CEF77| STA.b $22

|0CEF79| PLA
|0CEF7A| STA.b $20

|0CEF7C| SEP #$20

|0CEF7E| STZ.w $0AB6
|0CEF81| STZ.w $0AAC

|0CEF84| LDA.b #$0E
|0CEF86| STA.w $0AAD

|0CEF89| LDA.b #$03
|0CEF8B| STA.w $0AAE

|0CEF8E| LDX.b #$7E
|0CEF90| LDA.b #$00
|0CEF92| JSL SaveAndLoadAttractPalettes

|0CEF96| LDA.b #$00 ; RGB: #0008C0
|0CEF98| STA.l $7EC53A

|0CEF9C| LDA.b #$38
|0CEF9E| STA.l $7EC53B

;---------------------------------------------------------------------------------------------------

|0CEFA2| STZ.w $1CD8

|0CEFA5| LDA.b #$13 ; MESSAGE 0113
|0CEFA7| STA.w $1CF0

|0CEFAA| LDA.b #$01
|0CEFAC| STA.w $1CF1

|0CEFAF| LDA.b #$02
|0CEFB1| STA.b $25

|0CEFB3| LDA.b #$E0
|0CEFB5| STA.b $2C

|0CEFB7| REP #$20

|0CEFB9| LDA.w #$0210
|0CEFBC| STA.b $64

|0CEFBE| SEP #$20

;===================================================================================================

AttractScene_AdvanceFromDungeon:
|0CEFC0| INC.b $22

|0CEFC2| STZ.b $13
|0CEFC4| STZ.b $EA

|0CEFC6| LDA.w $011F
|0CEFC9| AND.b #$01
|0CEFCB| STA.w $011F

|0CEFCE| LDA.w $0123
|0CEFD1| AND.b #$01
|0CEFD3| STA.w $0123

|0CEFD6| LDA.b $E3
|0CEFD8| AND.b #$01
|0CEFDA| STA.b $E3

|0CEFDC| LDA.b $E9
|0CEFDE| AND.b #$01
|0CEFE0| STA.b $E9

|0CEFE2| RTL

;===================================================================================================

AttractScene_Prison:
|0CEFE3| STZ.b $99
|0CEFE5| STZ.b $9A

|0CEFE7| REP #$20

|0CEFE9| LDA.b $20
|0CEFEB| PHA

|0CEFEC| LDA.b $22
|0CEFEE| PHA

|0CEFEF| SEP #$20

|0CEFF1| LDA.b #$73
|0CEFF3| JSL LoadRoomForAttract

|0CEFF7| REP #$20

|0CEFF9| PLA
|0CEFFA| STA.b $22

|0CEFFC| PLA
|0CEFFD| STA.b $20

|0CEFFF| SEP #$20

|0CF001| LDA.b #$02
|0CF003| STA.w $0AB6
|0CF006| STZ.w $0AAC

|0CF009| LDA.b #$0E
|0CF00B| STA.w $0AAD

|0CF00E| LDA.b #$03
|0CF010| STA.w $0AAE

|0CF013| LDX.b #$7F
|0CF015| LDA.b #$01

|0CF017| JSL SaveAndLoadAttractPalettes

|0CF01B| LDA.b #$00 ; RGB: #000070
|0CF01D| STA.l $7EC53A

|0CF021| LDA.b #$38
|0CF023| STA.l $7EC53B

;---------------------------------------------------------------------------------------------------

|0CF027| STZ.w $1CD8

|0CF02A| LDA.b #$14 ; MESSAGE 0114
|0CF02C| STA.w $1CF0

|0CF02F| LDA.b #$01
|0CF031| STA.w $1CF1

|0CF034| LDA.b #$94
|0CF036| STA.b $2B

|0CF038| LDA.b #$68
|0CF03A| STA.b $30

|0CF03C| STZ.b $31
|0CF03E| STZ.b $32
|0CF040| STZ.b $33

|0CF042| STZ.b $40
|0CF044| STZ.b $50
|0CF046| STZ.b $5F

|0CF048| LDA.b #$FF
|0CF04A| STA.b $25

|0CF04C| REP #$20

|0CF04E| LDA.w #$0240
|0CF051| STA.b $64

|0CF053| SEP #$20

|0CF055| JMP.w AttractScene_AdvanceFromDungeon

;===================================================================================================

AttractScene_AgahnimAltar:
|0CF058| REP #$20

|0CF05A| LDA.b $20
|0CF05C| PHA

|0CF05D| LDA.b $22
|0CF05F| PHA

|0CF060| SEP #$20

|0CF062| LDA.b #$75
|0CF064| JSL LoadRoomForAttract

|0CF068| REP #$20

|0CF06A| PLA
|0CF06B| STA.b $22

|0CF06D| PLA
|0CF06E| STA.b $20

|0CF070| SEP #$20

|0CF072| STZ.w $0AB6
|0CF075| STZ.w $0AAC

|0CF078| LDA.b #$0E
|0CF07A| STA.w $0AAD

|0CF07D| LDA.b #$03
|0CF07F| STA.w $0AAE
|0CF082| STZ.w $0AA9

|0CF085| JSL LoadAttractAltarPalettes

|0CF089| LDX.b #$7F
|0CF08B| LDA.b #$02
|0CF08D| JSL SaveAndLoadAttractPalettes

|0CF091| LDA.b #$00 ; RGB: #0008C0
|0CF093| STA.l $7EC33A
|0CF097| STA.l $7EC53A

|0CF09B| LDA.b #$38
|0CF09D| STA.l $7EC33B
|0CF0A1| STA.l $7EC53B

;---------------------------------------------------------------------------------------------------

|0CF0A5| STZ.w $1CD8

|0CF0A8| LDA.b #$15 ; MESSAGE 0115
|0CF0AA| STA.w $1CF0

|0CF0AD| LDA.b #$01
|0CF0AF| STA.w $1CF1

|0CF0B2| LDA.b #$FF
|0CF0B4| STA.b $25

|0CF0B6| LDA.b #$70
|0CF0B8| STA.b $30
|0CF0BA| STA.b $62

|0CF0BC| LDA.b #$70
|0CF0BE| STA.b $63

|0CF0C0| LDA.b #$08
|0CF0C2| STA.b $32

|0CF0C4| STZ.b $50
|0CF0C6| STZ.b $51
|0CF0C8| STZ.b $52

|0CF0CA| STZ.b $5F
|0CF0CC| STZ.b $60
|0CF0CE| STZ.b $61

|0CF0D0| REP #$20

|0CF0D2| LDA.w #$00C0
|0CF0D5| STA.b $64

|0CF0D7| SEP #$20

|0CF0D9| JMP.w AttractScene_AdvanceFromDungeon

;===================================================================================================

AttractScene_EndOfStory:
|0CF0DC| REP #$20

|0CF0DE| JSL Attract_SetUpConclusionHDMA

;===================================================================================================

InitializeTriforceIntro:
|0CF0E2| INC.w $0710

|0CF0E5| JSL Intro_InitializeDefaultGFX
|0CF0E9| JSL Intro_LoadAllPalettes_long

|0CF0ED| STZ.b $EA

|0CF0EF| REP #$20

|0CF0F1| STZ.w $063A
|0CF0F4| STZ.w $0638

|0CF0F7| STZ.w $0120
|0CF0FA| STZ.w $0124

|0CF0FD| STZ.w $011E
|0CF100| STZ.w $0122

|0CF103| SEP #$20

|0CF105| LDA.b #$F1 ; SONG F1 - fade
|0CF107| STA.w $012C

|0CF10A| STZ.b $23
|0CF10C| STZ.b $10

|0CF10E| LDA.b #$0A
|0CF110| STA.b $11

|0CF112| STA.b $B0

|0CF114| RTL

;===================================================================================================

Attract_EnactStory:
|0CF115| LDA.b $23
|0CF117| ASL A
|0CF118| TAX

|0CF119| JMP.w (.vectors,X)

;---------------------------------------------------------------------------------------------------

.vectors
|0CF11C| dw AttractDramatize_PolkaDots    ; 0x00
|0CF11E| dw AttractDramatize_WorldMap     ; 0x01
|0CF120| dw AttractDramatize_ThroneRoom   ; 0x02
|0CF122| dw AttractDramatize_Prison       ; 0x03
|0CF124| dw AttractDramatize_AgahnimAltar ; 0x04

;===================================================================================================

AttractDramatize_PolkaDots:
|0CF126| LDA.b $1A
|0CF128| AND.b #$03
|0CF12A| BNE .delay_scroll

|0CF12C| INC.w $0124
|0CF12F| INC.w $0120
|0CF132| INC.w $0122
|0CF135| DEC.w $011E

.delay_scroll
|0CF138| LDA.b $27
|0CF13A| BEQ .delay_map_update

|0CF13C| JSR Attract_BuildNextImageTilemap

|0CF13F| STZ.b $27

|0CF141| INC.b $26
|0CF143| INC.b $26

.delay_map_update
|0CF145| STZ.b $F2
|0CF147| STZ.b $F6
|0CF149| STZ.b $F4

|0CF14B| JSL RenderText

|0CF14F| REP #$20

|0CF151| DEC.w $0200
|0CF154| BNE .delay_sequence

|0CF156| SEP #$20

|0CF158| INC.b $23

|0CF15A| DEC.b $22
|0CF15C| DEC.b $22
|0CF15E| DEC.b $22

|0CF160| BRA .exit

;---------------------------------------------------------------------------------------------------

.delay_sequence
|0CF162| LDA.w $0200
|0CF165| CMP.w #$0018
|0CF168| BCS .exit

|0CF16A| AND.w #$0001
|0CF16D| BEQ .exit

|0CF16F| SEP #$20

|0CF171| DEC.b $13

.exit
|0CF173| SEP #$20

|0CF175| RTL

;===================================================================================================

AttractDramatize_WorldMap:
|0CF176| LDA.w $0637
|0CF179| CMP.b #$00
|0CF17B| BEQ .advance_sequence

|0CF17D| CMP.b #$0F
|0CF17F| BCS .skip_fade

|0CF181| DEC.b $13

.skip_fade
|0CF183| LDY.b #$01

|0CF185| DEC.b $25
|0CF187| BNE .exit

|0CF189| STY.b $25

|0CF18B| LDA.w $0637
|0CF18E| SEC
|0CF18F| SBC.b #$01
|0CF191| STA.w $0637

|0CF194| JSR Attract_ControlMapZoom

.exit
|0CF197| RTL

;---------------------------------------------------------------------------------------------------

.advance_sequence
|0CF198| JSL EnableForceBlank

|0CF19C| LDA.b #$09
|0CF19E| STA.w BGMODE
|0CF1A1| STA.b $94

|0CF1A3| JSL EraseTilemaps_normal

|0CF1A7| INC.b $23

|0CF1A9| DEC.b $22
|0CF1AB| DEC.b $22

|0CF1AD| RTL

;---------------------------------------------------------------------------------------------------

pool AttractDramatize_ThroneRoom

.pointer_size
|0CF1AE| dw AttractOAMData.king_size
|0CF1B0| dw AttractOAMData.mantle_size

.pointer_offset_x
|0CF1B2| dw AttractOAMData.king_offset_x
|0CF1B4| dw AttractOAMData.mantle_offset_x

.pointer_offset_y
|0CF1B6| dw AttractOAMData.king_offset_y
|0CF1B8| dw AttractOAMData.mantle_offset_y

.pointer_char
|0CF1BA| dw AttractOAMData.king_char
|0CF1BC| dw AttractOAMData.mantle_char

.pointer_prop
|0CF1BE| dw AttractOAMData.king_prop
|0CF1C0| dw AttractOAMData.mantle_prop

;---------------------------------------------------------------------------------------------------

.offset_x
|0CF1C2| db $50 ; king
|0CF1C3| db $68 ; mantle

.offset_y
|0CF1C4| db $58 ; king
|0CF1C5| db $20 ; mantle

;---------------------------------------------------------------------------------------------------

.oam_count
|0CF1C6| db $03 ; king
|0CF1C7| db $05 ; mantle

endpool

;===================================================================================================

AttractDramatize_ThroneRoom:
|0CF1C8| STZ.b $2A

|0CF1CA| LDA.b $52
|0CF1CC| BNE .continue

|0CF1CE| LDA.b $13
|0CF1D0| CMP.b #$0F
|0CF1D2| BEQ .max_brightness

|0CF1D4| INC.b $13

|0CF1D6| BRA .continue

.max_brightness
|0CF1D8| INC.b $52

;---------------------------------------------------------------------------------------------------

.continue
|0CF1DA| REP #$20

|0CF1DC| LDA.w $0122
|0CF1DF| BNE .scroll_screen

|0CF1E1| SEP #$20

|0CF1E3| JSR Attract_DoTextInDungeonScene

|0CF1E6| REP #$20

|0CF1E8| LDA.b $64

|0CF1EA| SEP #$20

|0CF1EC| BNE .continue_dramatization

|0CF1EE| LDA.b $2C
|0CF1F0| CMP.b #$1F
|0CF1F2| BCS .dont_fade_out

|0CF1F4| AND.b #$01
|0CF1F6| BNE .dont_fade_out

|0CF1F8| DEC.b $13

.dont_fade_out
|0CF1FA| DEC.b $2C
|0CF1FC| BNE .continue_dramatization

|0CF1FE| INC.b $23
|0CF200| INC.b $22

|0CF202| RTL

;---------------------------------------------------------------------------------------------------

.scroll_screen
|0CF203| DEC.w $0122
|0CF206| DEC.w $0124

;---------------------------------------------------------------------------------------------------

.continue_dramatization
|0CF209| SEP #$20

|0CF20B| LDX.b #$02

.next_entity
|0CF20D| PHX

|0CF20E| REP #$20

|0CF210| LDA.l .pointer_size,X
|0CF214| STA.b $2D

|0CF216| LDA.l .pointer_offset_x,X
|0CF21A| STA.b $02

|0CF21C| LDA.l .pointer_offset_y,X
|0CF220| STA.b $04

|0CF222| LDA.l .pointer_char,X
|0CF226| STA.b $06

|0CF228| LDA.l .pointer_prop,X
|0CF22C| STA.b $08

|0CF22E| TXA
|0CF22F| AND.w #$00FF
|0CF232| LSR A
|0CF233| TAX

|0CF234| LDA.l .offset_y,X
|0CF238| AND.w #$00FF
|0CF23B| SEC
|0CF23C| SBC.w $0122
|0CF23F| STA.b $00

|0CF241| CMP.w #$FFE0

|0CF244| SEP #$20
|0CF246| BMI .off_screen

|0CF248| LDA.l .offset_x,X
|0CF24C| STA.b $28

|0CF24E| LDA.b $00
|0CF250| STA.b $29

|0CF252| LDA.l .oam_count,X
|0CF256| TAY

|0CF257| JSR Attract_DrawPreloadedSprite

.off_screen
|0CF25A| PLX

|0CF25B| DEX
|0CF25C| DEX
|0CF25D| BPL .next_entity

|0CF25F| RTL

;===================================================================================================

pool AttractDramatize_Prison

.soldier_offset_x
|0CF260| dw  32, -12

.soldier_offset_y
|0CF264| db  24,  24

.soldier_direction
|0CF266| db $01, $01

.soldier_palette
|0CF268| db $09, $07

;---------------------------------------------------------------------------------------------------

.maiden_jab_offset_x
|0CF26A| db  0,  1,  2,  3
|0CF26E| db  4,  5,  5,  5
|0CF272| db  4,  4,  3,  3
|0CF276| db  2,  2,  1,  1

endpool

;---------------------------------------------------------------------------------------------------

AttractDramatize_Prison:
|0CF27A| STZ.b $2A

|0CF27C| LDA.b $5F
|0CF27E| BNE .skip_fade

|0CF280| JSR Attract_FadeInStep

.skip_fade
|0CF283| LDA.b #$38
|0CF285| STA.b $28

|0CF287| JSR Attract_DrawZelda

|0CF28A| LDA.b $25
|0CF28C| CMP.b #$C0
|0CF28E| BCS .delay_agahnim

|0CF290| JMP.w AttractDramatize_Agahnim

.delay_agahnim
|0CF293| LDA.b #$70
|0CF295| STA.b $29

|0CF297| DEC.b $50
|0CF299| BPL .dont_reset_jab

|0CF29B| LDA.b #$0F
|0CF29D| STA.b $50

.dont_reset_jab
|0CF29F| LDX.b $50

|0CF2A1| LDA.b $31
|0CF2A3| STA.b $40

|0CF2A5| LDA.b $30
|0CF2A7| CLC
|0CF2A8| ADC.l .maiden_jab_offset_x,X
|0CF2AC| STA.b $28

|0CF2AE| BCC .dont_disable_maiden

|0CF2B0| INC.b $40

.dont_disable_maiden
|0CF2B2| JSR Attract_DrawKidnappedMaiden

;---------------------------------------------------------------------------------------------------

|0CF2B5| LDX.b #$01

.next_soldier
|0CF2B7| STZ.b $03

|0CF2B9| LDA.b $33
|0CF2BB| STA.b $06

|0CF2BD| LDA.b $29
|0CF2BF| CLC
|0CF2C0| ADC.l .soldier_offset_y,X
|0CF2C4| STA.b $02

|0CF2C6| LDA.l .soldier_direction,X
|0CF2CA| STA.b $04

|0CF2CC| LDA.l .soldier_palette,X
|0CF2D0| STA.b $05

|0CF2D2| PHX

|0CF2D3| REP #$20

|0CF2D5| TXA
|0CF2D6| ASL A
|0CF2D7| TAX

|0CF2D8| LDA.b $30
|0CF2DA| CLC
|0CF2DB| ADC.w #$0100

|0CF2DE| CLC
|0CF2DF| ADC.l .soldier_offset_x,X
|0CF2E3| STA.b $00

|0CF2E5| TAY
|0CF2E6| STY.b $34

|0CF2E8| SEP #$20

|0CF2EA| JSL ResetSpriteProperties
|0CF2EE| JSL PuppetSoldier

|0CF2F2| PLX
|0CF2F3| DEX
|0CF2F4| BPL .next_soldier

;---------------------------------------------------------------------------------------------------

|0CF2F6| INC.b $32

|0CF2F8| LDA.b $32
|0CF2FA| AND.b #$07
|0CF2FC| BNE AttractDramatize_Agahnim

|0CF2FE| LDY.b #$FF

|0CF300| LDA.b $33
|0CF302| CMP.b #$02
|0CF304| BNE .delay_sfx

|0CF306| STY.b $33

|0CF308| LDA.b $31
|0CF30A| BNE .delay_sfx

|0CF30C| LDA.b $32
|0CF30E| AND.b #$08
|0CF310| BEQ .delay_sfx

|0CF312| LDA.b #$04 ; SFX3.04
|0CF314| STA.w $012F

.delay_sfx
|0CF317| INC.b $33

;===================================================================================================

AttractDramatize_Agahnim:
|0CF319| LDA.b $60
|0CF31B| ASL A
|0CF31C| TAX

|0CF31D| JMP.w (.vectors,X)

.vectors
|0CF320| dw Dramaghanim_WaitForCue
|0CF322| dw Dramaghanim_MoveAndSpin

;===================================================================================================

Dramaghanim_AdvanceStory:
|0CF324| INC.b $23

|0CF326| DEC.b $22
|0CF328| DEC.b $22

|0CF32A| RTL

;===================================================================================================

Dramaghanim_WaitForCue:
|0CF32B| LDA.b $34
|0CF32D| BNE .delay

|0CF32F| INC.b $60

.delay
|0CF331| REP #$20

|0CF333| LDA.b $1A
|0CF335| AND.w #$0001
|0CF338| BEQ .delay_tick

|0CF33A| DEC.b $30

.delay_tick
|0CF33C| LDA.w #AttractAgahnimOAM.size
|0CF33F| STA.b $2D

|0CF341| LDA.w #AttractAgahnimOAM.offset_x
|0CF344| STA.b $02

|0CF346| LDA.w #AttractAgahnimOAM.offset_y
|0CF349| STA.b $04

|0CF34B| LDA.w #AttractAgahnimOAM.char_step0
|0CF34E| STA.b $06

|0CF350| LDA.w #AttractAgahnimOAM.prop_step0
|0CF353| STA.b $08

|0CF355| SEP #$20

|0CF357| LDA.b #$58
|0CF359| STA.b $28

|0CF35B| LDA.b $2B
|0CF35D| STA.b $29

|0CF35F| LDY.b #$05
|0CF361| JSR Attract_DrawPreloadedSprite

|0CF364| RTL

;===================================================================================================

pool Dramaghanim_MoveAndSpin

.pointers_char
|0CF365| dw AttractAgahnimOAM.char_step0
|0CF367| dw AttractAgahnimOAM.char_step1
|0CF369| dw AttractAgahnimOAM.char_step2
|0CF36B| dw AttractAgahnimOAM.char_step3
|0CF36D| dw AttractAgahnimOAM.char_step4

.pointers_prop
|0CF36F| dw AttractAgahnimOAM.prop_step0
|0CF371| dw AttractAgahnimOAM.prop_step1
|0CF373| dw AttractAgahnimOAM.prop_step2
|0CF375| dw AttractAgahnimOAM.prop_step0
|0CF377| dw AttractAgahnimOAM.prop_step0

endpool

;---------------------------------------------------------------------------------------------------

Dramaghanim_MoveAndSpin:
|0CF379| LDA.b $25
|0CF37B| CMP.b #$80
|0CF37D| BCS .continue

|0CF37F| JSR Attract_DoTextInDungeonScene

|0CF382| REP #$20

|0CF384| LDA.b $64

|0CF386| SEP #$20

|0CF388| BEQ .continue

|0CF38A| LDX.b #$08
|0CF38C| BRA .animate_agahnim

.continue
|0CF38E| LDX.b #$00

|0CF390| LDA.b $2B
|0CF392| CMP.b #$6E
|0CF394| BEQ .timer_maxed

|0CF396| DEC.b $2B
|0CF398| BRA .animate_agahnim

.timer_maxed
|0CF39A| LDA.b $25
|0CF39C| CMP.b #$1F
|0CF39E| BCS .delay_fade

|0CF3A0| AND.b #$01
|0CF3A2| BNE .delay_fade

|0CF3A4| DEC.b $13

.delay_fade
|0CF3A6| DEC.b $25
|0CF3A8| BNE .dont_advance_story

|0CF3AA| JMP.w Dramaghanim_AdvanceStory

;---------------------------------------------------------------------------------------------------

.dont_advance_story
|0CF3AD| LDA.b $25
|0CF3AF| CMP.b #$C0
|0CF3B1| BCS .animate_agahnim

|0CF3B3| INX
|0CF3B4| INX

|0CF3B5| CMP.b #$B8
|0CF3B7| BCS .animate_agahnim

|0CF3B9| INX
|0CF3BA| INX

|0CF3BB| CMP.b #$B0
|0CF3BD| BCS .animate_agahnim

|0CF3BF| INX
|0CF3C0| INX

|0CF3C1| CMP.b #$A0
|0CF3C3| BCS .animate_agahnim

|0CF3C5| INX
|0CF3C6| INX

;---------------------------------------------------------------------------------------------------

.animate_agahnim
|0CF3C7| LDA.b #$A8
|0CF3C9| STA.b $28

|0CF3CB| REP #$20

|0CF3CD| LDA.b $1A
|0CF3CF| AND.w #$0001
|0CF3D2| BEQ .delay_tick

|0CF3D4| DEC.b $30

.delay_tick
|0CF3D6| LDA.w #AttractAgahnimOAM.size
|0CF3D9| STA.b $2D

|0CF3DB| LDA.w #AttractAgahnimOAM.offset_x
|0CF3DE| STA.b $02

|0CF3E0| LDA.w #AttractAgahnimOAM.offset_y
|0CF3E3| STA.b $04

|0CF3E5| LDA.l .pointers_char,X
|0CF3E9| STA.b $06

|0CF3EB| LDA.l .pointers_prop,X
|0CF3EF| STA.b $08

|0CF3F1| SEP #$20

|0CF3F3| LDA.b #$58
|0CF3F5| STA.b $28

|0CF3F7| LDA.b $2B
|0CF3F9| STA.b $29

|0CF3FB| LDY.b #$05
|0CF3FD| JSR Attract_DrawPreloadedSprite

|0CF400| RTL

;===================================================================================================

pool AttractDramatize_AgahnimAltar

.soldier_position_x
|0CF401| db $30, $C0, $30, $C0, $50, $A0

.soldier_position_y
|0CF407| db $70, $70, $98, $98, $C0, $C0

.soldier_direction
|0CF40D| db $00, $01, $00, $01, $03, $03

.soldier_palette
|0CF413| db $09, $09, $09, $09, $07, $09

;---------------------------------------------------------------------------------------------------

.vectors
|0CF419| dw Dramagahnim_RaiseTheRoof
|0CF41B| dw Dramagahnim_ReadySpell
|0CF41D| dw Dramagahnim_CastSpell
|0CF41F| dw Dramagahnim_RealizeWhatJustHappened
|0CF421| dw Dramagahnim_IdleGuiltily

endpool

;---------------------------------------------------------------------------------------------------

AttractDramatize_AgahnimAltar:
|0CF423| LDA.b $5D
|0CF425| BEQ .delay

|0CF427| JMP.w Dramaghanim_AdvanceStory

.delay
|0CF42A| STZ.b $2A

|0CF42C| JSL HandleScreenFlash

|0CF430| LDA.b $5F
|0CF432| BNE .delay_fade

|0CF434| JSR Attract_FadeInStep

.delay_fade
|0CF437| LDA.b $50
|0CF439| CMP.b #$FF
|0CF43B| BEQ .maxed

|0CF43D| INC.b $50

.maxed
|0CF43F| LDA.w $0FF9
|0CF442| BEQ .delay_sfx

|0CF444| AND.b #$04
|0CF446| BEQ .delay_sfx

|0CF448| LDX.b #$2B ; SFX3.2B
|0CF44A| STX.w $012F

;---------------------------------------------------------------------------------------------------

.delay_sfx
|0CF44D| LDA.b $60
|0CF44F| ASL A
|0CF450| TAX

|0CF451| JSR (.vectors,X)

;---------------------------------------------------------------------------------------------------

|0CF454| LDX.b #$05

.next_soldier
|0CF456| STZ.b $01
|0CF458| STZ.b $03
|0CF45A| STZ.b $06

|0CF45C| LDA.l .soldier_position_x,X
|0CF460| STA.b $00

|0CF462| LDA.l .soldier_position_y,X
|0CF466| STA.b $02

|0CF468| LDA.l .soldier_direction,X
|0CF46C| STA.b $04

|0CF46E| LDA.l .soldier_palette,X
|0CF472| STA.b $05

|0CF474| PHX

|0CF475| JSL ResetSpriteProperties
|0CF479| JSL PuppetSoldier

|0CF47D| PLX
|0CF47E| DEX
|0CF47F| BPL .next_soldier

;---------------------------------------------------------------------------------------------------

|0CF481| LDX.b $50
|0CF483| CPX.b #$A0
|0CF485| BCC .continue

|0CF487| LDA.b $30
|0CF489| CMP.b #$60
|0CF48B| BEQ .tick_timer

|0CF48D| DEC.b $32
|0CF48F| BNE .continue

|0CF491| DEC.b $30

|0CF493| LDA.b #$08
|0CF495| STA.b $32

|0CF497| BRA .continue

.tick_timer
|0CF499| INC.b $61

;---------------------------------------------------------------------------------------------------

.continue
|0CF49B| LDA.b $52
|0CF49D| BNE .dont_draw_maiden

|0CF49F| REP #$20

|0CF4A1| LDA.w #AttractAltarMaidenOAM.size
|0CF4A4| STA.b $2D

|0CF4A6| LDA.w #AttractAltarMaidenOAM.offset_x
|0CF4A9| STA.b $02

|0CF4AB| LDA.w #AttractAltarMaidenOAM.offset_y
|0CF4AE| STA.b $04

|0CF4B0| LDX.b #$00

|0CF4B2| LDA.b $30
|0CF4B4| AND.w #$00FF
|0CF4B7| CMP.w #$0070
|0CF4BA| BEQ .not_airborne

|0CF4BC| INX
|0CF4BD| INX

.not_airborne
|0CF4BE| LDA.l .maiden_char_pointer,X
|0CF4C2| STA.b $06

|0CF4C4| LDA.w #AttractAltarMaidenOAM.prop
|0CF4C7| STA.b $08

|0CF4C9| SEP #$20

|0CF4CB| LDA.b #$74
|0CF4CD| STA.b $28

|0CF4CF| LDA.b $30
|0CF4D1| STA.b $29

|0CF4D3| LDY.b #$01
|0CF4D5| JSR Attract_DrawPreloadedSprite

;---------------------------------------------------------------------------------------------------

|0CF4D8| LDX.b #$0E

|0CF4DA| LDA.b $30
|0CF4DC| CMP.b #$68
|0CF4DE| BCS .adjust_shadow_index

|0CF4E0| SEC
|0CF4E1| SBC.b #$68

|0CF4E3| ASL A
|0CF4E4| AND.b #$0E
|0CF4E6| TAX

.adjust_shadow_index
|0CF4E7| REP #$20

|0CF4E9| LDA.w #AttractAltarMaidenShadowOAM.size
|0CF4EC| STA.b $2D

|0CF4EE| LDA.l .shadow_offset_x_pointer,X
|0CF4F2| STA.b $02

|0CF4F4| LDA.w #AttractAltarMaidenShadowOAM.offset_y
|0CF4F7| STA.b $04

|0CF4F9| LDA.w #AttractAltarMaidenShadowOAM.char
|0CF4FC| STA.b $06

|0CF4FE| LDA.w #AttractAltarMaidenShadowOAM.prop
|0CF501| STA.b $08

|0CF503| SEP #$20

|0CF505| TXA
|0CF506| LSR A
|0CF507| TAX

|0CF508| LDA.b #$74
|0CF50A| CLC
|0CF50B| ADC.l .shadow_base_offset_x,X
|0CF50F| STA.b $28

|0CF511| LDA.b #$76
|0CF513| STA.b $29

|0CF515| LDY.b #$01
|0CF517| JSR Attract_DrawPreloadedSprite

;---------------------------------------------------------------------------------------------------

.dont_draw_maiden
|0CF51A| LDA.b $50

|0CF51C| LSR A
|0CF51D| LSR A
|0CF51E| LSR A
|0CF51F| LSR A

|0CF520| AND.b #$0E
|0CF522| TAX

|0CF523| REP #$20

|0CF525| LDA.w #AttractAgahnimOAM.size
|0CF528| STA.b $2D

|0CF52A| LDA.w #AttractAgahnimOAM.offset_x
|0CF52D| STA.b $02

|0CF52F| LDA.w #AttractAgahnimOAM.offset_y
|0CF532| STA.b $04

|0CF534| LDA.l .agahnim_char_pointer,X
|0CF538| STA.b $06

|0CF53A| LDA.w #AttractAgahnimOAM.prop_step0
|0CF53D| STA.b $08

|0CF53F| SEP #$20

|0CF541| LDA.b #$70
|0CF543| STA.b $28

|0CF545| LDA.b #$46
|0CF547| STA.b $29

|0CF549| LDY.b #$05
|0CF54B| JSR Attract_DrawPreloadedSprite

|0CF54E| RTL

;---------------------------------------------------------------------------------------------------

.shadow_offset_x_pointer
|0CF54F| dw AttractAltarMaidenShadowOAM.offset_x_step0
|0CF551| dw AttractAltarMaidenShadowOAM.offset_x_step0
|0CF553| dw AttractAltarMaidenShadowOAM.offset_x_step1
|0CF555| dw AttractAltarMaidenShadowOAM.offset_x_step1
|0CF557| dw AttractAltarMaidenShadowOAM.offset_x_step2
|0CF559| dw AttractAltarMaidenShadowOAM.offset_x_step2
|0CF55B| dw AttractAltarMaidenShadowOAM.offset_x_step3
|0CF55D| dw AttractAltarMaidenShadowOAM.offset_x_step4

;---------------------------------------------------------------------------------------------------

.shadow_base_offset_x
|0CF55F| db  4,  4,  3,  3
|0CF563| db  2,  2,  1,  0

;---------------------------------------------------------------------------------------------------

.maiden_char_pointer
|0CF567| dw AttractAltarMaidenOAM.char_step0
|0CF569| dw AttractAltarMaidenOAM.char_step1

;---------------------------------------------------------------------------------------------------

.agahnim_char_pointer
|0CF56B| dw AttractAgahnimOAM.char_step3
|0CF56D| dw AttractAgahnimOAM.char_step5
|0CF56F| dw AttractAgahnimOAM.char_step3
|0CF571| dw AttractAgahnimOAM.char_step6
|0CF573| dw AttractAgahnimOAM.char_step3
|0CF575| dw AttractAgahnimOAM.char_step5
|0CF577| dw AttractAgahnimOAM.char_step3
|0CF579| dw AttractAgahnimOAM.char_step4

;===================================================================================================

Dramagahnim_RaiseTheRoof:
|0CF57B| LDA.b $61
|0CF57D| BEQ .exit

|0CF57F| INC.b $60

.exit
|0CF581| RTS

;===================================================================================================

DramagahnimSpellCharPointer:
|0CF582| dw DramagahnimSpellOAM.char_step0
|0CF584| dw DramagahnimSpellOAM.char_step1

;---------------------------------------------------------------------------------------------------

DramagahnimSpellPropPointer:
|0CF586| dw DramagahnimSpellOAM.prop_step0
|0CF588| dw DramagahnimSpellOAM.prop_step1

;---------------------------------------------------------------------------------------------------

pool Dramagahnim_ReadySpell

.oam_count
|0CF58A| db  1
|0CF58B| db  1
|0CF58C| db  1
|0CF58D| db  5
|0CF58E| db  5
|0CF58F| db  9
|0CF590| db  9
|0CF591| db 13

endpool

;---------------------------------------------------------------------------------------------------

Dramagahnim_ReadySpell:
|0CF592| LDA.b $1A
|0CF594| LSR A
|0CF595| AND.b #$02
|0CF597| TAX

|0CF598| REP #$20

|0CF59A| LDA.w #DramagahnimSpellOAM.size
|0CF59D| STA.b $2D

|0CF59F| LDA.w #DramagahnimSpellOAM.offset_x
|0CF5A2| STA.b $02

|0CF5A4| LDA.w #DramagahnimSpellOAM.offset_y
|0CF5A7| STA.b $04

|0CF5A9| LDA.l DramagahnimSpellCharPointer,X
|0CF5AD| STA.b $06

|0CF5AF| LDA.l DramagahnimSpellPropPointer,X
|0CF5B3| STA.b $08

;---------------------------------------------------------------------------------------------------

|0CF5B5| SEP #$20

|0CF5B7| LDA.b #$6E
|0CF5B9| STA.b $28

|0CF5BB| LDA.b #$48
|0CF5BD| STA.b $29

|0CF5BF| LDA.b $51
|0CF5C1| LSR A
|0CF5C2| AND.b #$07
|0CF5C4| TAX

|0CF5C5| LDA.l .oam_count,X
|0CF5C9| TAY

|0CF5CA| JSR Attract_DrawPreloadedSprite

;---------------------------------------------------------------------------------------------------

|0CF5CD| LDA.b $51
|0CF5CF| BNE .delay_sfx

|0CF5D1| LDY.b $63
|0CF5D3| CPY.b #$70
|0CF5D5| BNE .delay_sfx

|0CF5D7| LDX.b #$27 ; SFX3.27
|0CF5D9| STX.w $012F

;---------------------------------------------------------------------------------------------------

.delay_sfx
|0CF5DC| CMP.b #$0F
|0CF5DE| BEQ .advance

|0CF5E0| CMP.b #$06
|0CF5E2| BNE .delay_other_sfx

|0CF5E4| LDX.b #$90
|0CF5E6| STX.w $0FF9

|0CF5E9| LDX.b #$2B ; SFX3.2B
|0CF5EB| STX.w $012F

;---------------------------------------------------------------------------------------------------

.delay_other_sfx
|0CF5EE| LDA.b $63
|0CF5F0| BEQ .delay_tick

|0CF5F2| DEC.b $63

|0CF5F4| RTS

;---------------------------------------------------------------------------------------------------

.delay_tick
|0CF5F5| INC.b $51

|0CF5F7| RTS

;---------------------------------------------------------------------------------------------------

.advance
|0CF5F8| INC.b $60

|0CF5FA| RTS

;===================================================================================================

pool Dramagahnim_CastSpell

.oam_count
|0CF5FB| db  3
|0CF5FC| db  3
|0CF5FD| db  7
|0CF5FE| db  7
|0CF5FF| db 11
|0CF600| db 11
|0CF601| db 13
|0CF602| db 13

;---------------------------------------------------------------------------------------------------

.index_offset
|0CF603| dw 10
|0CF605| dw 10
|0CF607| dw  6
|0CF609| dw  6
|0CF60B| dw  2
|0CF60D| dw  2
|0CF60F| dw  0
|0CF611| dw  0

endpool

;---------------------------------------------------------------------------------------------------

Dramagahnim_CastSpell:
|0CF613| PHB
|0CF614| PHK
|0CF615| PLB

|0CF616| LDA.b $1A
|0CF618| LSR A
|0CF619| AND.b #$02
|0CF61B| TAX

|0CF61C| LDA.b $51
|0CF61E| LSR A
|0CF61F| AND.b #$07
|0CF621| STA.b $00

|0CF623| ASL A
|0CF624| TAY

;---------------------------------------------------------------------------------------------------

|0CF625| REP #$20

|0CF627| LDA.w #DramagahnimSpellOAM.size
|0CF62A| CLC
|0CF62B| ADC.w .index_offset,Y
|0CF62E| STA.b $2D

|0CF630| LDA.w #DramagahnimSpellOAM.offset_x
|0CF633| CLC
|0CF634| ADC.w .index_offset,Y
|0CF637| STA.b $02

|0CF639| LDA.w #DramagahnimSpellOAM.offset_y
|0CF63C| CLC
|0CF63D| ADC.w .index_offset,Y
|0CF640| STA.b $04

|0CF642| LDA.w DramagahnimSpellCharPointer,X
|0CF645| CLC
|0CF646| ADC.w .index_offset,Y
|0CF649| STA.b $06

|0CF64B| LDA.w DramagahnimSpellPropPointer,X
|0CF64E| CLC
|0CF64F| ADC.w .index_offset,Y
|0CF652| STA.b $08

;---------------------------------------------------------------------------------------------------

|0CF654| SEP #$20

|0CF656| LDA.b #$6E
|0CF658| STA.b $28

|0CF65A| LDA.b #$48
|0CF65C| STA.b $29

|0CF65E| LDX.b $00

|0CF660| LDA.w .oam_count,X
|0CF663| TAY

|0CF664| JSR Attract_DrawPreloadedSprite

|0CF667| PLB

;---------------------------------------------------------------------------------------------------

|0CF668| LDA.b $51
|0CF66A| BNE .delay_tick

|0CF66C| DEC.b $62
|0CF66E| BEQ Dramagahnim_ReadySpell.advance

|0CF670| BRA .exit

.delay_tick
|0CF672| DEC.b $51

.exit
|0CF674| RTS

;===================================================================================================

pool Dramagahnim_RealizeWhatJustHappened

.pointers_offset_x
|0CF675| dw AttractTelebubbleOAM.step0_offset_x
|0CF677| dw AttractTelebubbleOAM.step1_offset_x

.pointers_offset_y
|0CF679| dw AttractTelebubbleOAM.step0_offset_y
|0CF67B| dw AttractTelebubbleOAM.step1_offset_y

.pointers_char
|0CF67D| dw AttractTelebubbleOAM.step0_char
|0CF67F| dw AttractTelebubbleOAM.step1_char

.pointers_prop
|0CF681| dw AttractTelebubbleOAM.step0_prop
|0CF683| dw AttractTelebubbleOAM.step1_prop

;---------------------------------------------------------------------------------------------------

.position_x
|0CF685| db $78
|0CF686| db $70

.object_count
|0CF687| db $00
|0CF688| db $01

endpool

;---------------------------------------------------------------------------------------------------

Dramagahnim_RealizeWhatJustHappened:
|0CF689| LDA.b $51
|0CF68B| CMP.b #$06
|0CF68D| BNE .delay_sfx

|0CF68F| INC.b $52

|0CF691| LDA.b #$33 ; SFX2.33
|0CF693| STA.w $012E

.delay_sfx
|0CF696| CMP.b #$40
|0CF698| BNE .delay_tick

|0CF69A| LDA.b #$E0
|0CF69C| STA.b $51

|0CF69E| INC.b $60

.delay_tick
|0CF6A0| CMP.b #$0F
|0CF6A2| BCS .skip_draw

|0CF6A4| LSR A
|0CF6A5| LSR A
|0CF6A6| AND.b #$02
|0CF6A8| TAX

|0CF6A9| REP #$20

|0CF6AB| LDA.w #AttractTelebubbleOAM.size
|0CF6AE| STA.b $2D

|0CF6B0| LDA.l .pointers_offset_x,X
|0CF6B4| STA.b $02

|0CF6B6| LDA.l .pointers_offset_y,X
|0CF6BA| STA.b $04

|0CF6BC| LDA.l .pointers_char,X
|0CF6C0| STA.b $06

|0CF6C2| LDA.l .pointers_prop,X
|0CF6C6| STA.b $08

;---------------------------------------------------------------------------------------------------

|0CF6C8| SEP #$20

|0CF6CA| TXA
|0CF6CB| LSR A
|0CF6CC| TAX

|0CF6CD| LDA.l .position_x,X
|0CF6D1| STA.b $28

|0CF6D3| LDA.b #$60
|0CF6D5| STA.b $29

|0CF6D7| LDA.l .object_count,X
|0CF6DB| TAY

|0CF6DC| JSR Attract_DrawPreloadedSprite

.skip_draw
|0CF6DF| INC.b $51

|0CF6E1| RTS

;===================================================================================================

Dramagahnim_IdleGuiltily:
|0CF6E2| JSR Attract_DoTextInDungeonScene

|0CF6E5| REP #$20

|0CF6E7| LDA.b $64

|0CF6E9| SEP #$20

|0CF6EB| BNE .exit

|0CF6ED| LDA.b $51
|0CF6EF| CMP.b #$1F
|0CF6F1| BCS .delay_fade

|0CF6F3| AND.b #$01
|0CF6F5| BNE .delay_fade

|0CF6F7| DEC.b $13

.delay_fade
|0CF6F9| DEC.b $51
|0CF6FB| BNE .exit

|0CF6FD| INC.b $5D

.exit
|0CF6FF| RTS

;===================================================================================================

Attract_SkipToFileSelect:
|0CF700| DEC.b $13
|0CF702| BNE .exit

|0CF704| JSL EnableForceBlank

|0CF708| LDA.b #$13
|0CF70A| STA.w BG1SC

|0CF70D| LDA.b #$03
|0CF70F| STA.w BG2SC

|0CF712| REP #$20

|0CF714| JSL Attract_SetUpConclusionHDMA

|0CF718| REP #$20

|0CF71A| STZ.w $063A
|0CF71D| STZ.w $0638

|0CF720| STZ.w $0120
|0CF723| STZ.w $0124

|0CF726| STZ.b $EA

|0CF728| SEP #$20

|0CF72A| JMP.w FadeMusicAndResetSRAMMirror

.exit
|0CF72D| RTL

;===================================================================================================

pool Attract_BuildNextImageTilemap

.stripes_pointers
|0CF72E| dw AttractImage0Stripes
|0CF730| dw AttractImage1Stripes
|0CF732| dw AttractImage2Stripes
|0CF734| dw AttractImage3Stripes

.stripes_sizes
|0CF736| dw $009C
|0CF738| dw $00EC
|0CF73A| dw $00C6
|0CF73C| dw $0108

endpool

;---------------------------------------------------------------------------------------------------

Attract_BuildNextImageTilemap:
|0CF73E| REP #$20

|0CF740| LDX.b $26

|0CF742| LDA.l .stripes_sizes,X
|0CF746| STA.b $00

|0CF748| LDA.l .stripes_pointers,X
|0CF74C| STA.b $02

|0CF74E| LDX.b #^Attract_BuildNextImageTilemap
|0CF750| STX.b $04

|0CF752| REP #$10

|0CF754| LDY.b $00

.copy_next
|0CF756| LDA.b [$02],Y
|0CF758| STA.w $1002,Y

|0CF75B| DEY
|0CF75C| DEY
|0CF75D| BPL .copy_next

|0CF75F| SEP #$30

|0CF761| LDA.b #$01
|0CF763| STA.b $14

|0CF765| RTS

;===================================================================================================

Attract_DoTextInDungeonScene:
|0CF766| LDA.b $E8
|0CF768| STA.b $20

|0CF76A| LDA.b $E9
|0CF76C| STA.b $21

|0CF76E| STZ.b $F2
|0CF770| STZ.b $F6
|0CF772| STZ.b $F4

|0CF774| JSL RenderText

|0CF778| REP #$20

|0CF77A| LDA.b $64

|0CF77C| BEQ .exit

|0CF77E| DEC.b $64

.exit
|0CF780| SEP #$20

|0CF782| RTS

;===================================================================================================

Attract_ControlMapZoom:
|0CF783| REP #$10

|0CF785| LDA.w $0637
|0CF788| STA.w WRMPYA

|0CF78B| LDX.w #$01BE

.copy_next
|0CF78E| LDA.l WorldMapHDMA_ZoomedOut_Part1+0,X
|0CF792| STA.w WRMPYB

|0CF795| NOP
|0CF796| NOP
|0CF797| NOP
|0CF798| NOP

|0CF799| LDA.w RDMPYH
|0CF79C| STA.b $00

|0CF79E| LDA.l WorldMapHDMA_ZoomedOut_Part1+1,X
|0CF7A2| STA.w WRMPYB

|0CF7A5| NOP

|0CF7A6| LDA.b $00
|0CF7A8| CLC
|0CF7A9| ADC.w RDMPYL
|0CF7AC| STA.w $1B00,X

|0CF7AF| LDA.w RDMPYH
|0CF7B2| ADC.b #$00
|0CF7B4| STA.w $1B01,X

|0CF7B7| DEX
|0CF7B8| DEX
|0CF7B9| BPL .copy_next

|0CF7BB| SEP #$10

|0CF7BD| RTS

;===================================================================================================

AttractBG1Tiles:
|0CF7BE| dw $01A0, $09A6, $89A5, $01A0
|0CF7C6| dw $09A5, $01A0, $01A0, $89A6
|0CF7CE| dw $49A5, $01A0, $01A0, $49A5
|0CF7D6| dw $01A0, $89A5, $C9A5, $01A0

;---------------------------------------------------------------------------------------------------

AttractBG2Tiles:
|0CF7DE| dw $09A1, $09A2, $09A3, $09A4

;---------------------------------------------------------------------------------------------------

Attract_BuildBackgrounds:
|0CF7E6| LDA.b #$09
|0CF7E8| STA.b $94

|0CF7EA| LDA.b #$17
|0CF7EC| STA.b $1C
|0CF7EE| STZ.b $1D

|0CF7F0| LDA.b #$10
|0CF7F2| STA.w BG1SC

|0CF7F5| LDA.b #$00
|0CF7F7| STA.w BG2SC

|0CF7FA| PHB
|0CF7FB| PHK
|0CF7FC| PLB

;---------------------------------------------------------------------------------------------------

|0CF7FD| REP #$30

|0CF7FF| LDX.w #$0000

|0CF802| LDA.w #AttractBG1Tiles
|0CF805| STA.b $30

.next_stripe_bg1
|0CF807| TXA
|0CF808| AND.w #$0007
|0CF80B| TAY

.next_bg1
|0CF80C| LDA.b ($30),Y
|0CF80E| STA.w $1006,X

|0CF811| INY
|0CF812| INY

|0CF813| INX
|0CF814| INX

|0CF815| TYA
|0CF816| AND.w #$0007
|0CF819| BNE .next_bg1

|0CF81B| TXA
|0CF81C| AND.w #$003F
|0CF81F| BNE .next_stripe_bg1

|0CF821| LDA.b $30
|0CF823| CLC
|0CF824| ADC.w #$0008
|0CF827| STA.b $30

|0CF829| CPX.w #$0100
|0CF82C| BNE .next_stripe_bg1

;---------------------------------------------------------------------------------------------------

|0CF82E| LDA.w #$1000
|0CF831| STA.b $30

|0CF833| JSR Attract_TriggerBGDMA

;---------------------------------------------------------------------------------------------------

|0CF836| REP #$30

|0CF838| LDX.w #$0000

|0CF83B| LDA.w #AttractBG2Tiles
|0CF83E| STA.b $30

.next_stripe_bg2
|0CF840| TXA
|0CF841| AND.w #$0003
|0CF844| TAY

.next_bg2
|0CF845| LDA.b ($30),Y
|0CF847| STA.w $1006,X

|0CF84A| INY
|0CF84B| INY

|0CF84C| INX
|0CF84D| INX

|0CF84E| TYA
|0CF84F| AND.w #$0003
|0CF852| BNE .next_bg2

|0CF854| TXA
|0CF855| AND.w #$003F
|0CF858| BNE .next_stripe_bg2

|0CF85A| TXA
|0CF85B| AND.w #$0040

|0CF85E| LSR A
|0CF85F| LSR A
|0CF860| LSR A
|0CF861| LSR A

|0CF862| CLC
|0CF863| ADC.w #AttractBG2Tiles
|0CF866| STA.b $30

|0CF868| CPX.w #$0100
|0CF86B| BNE .next_stripe_bg2

|0CF86D| LDA.w #$0000
|0CF870| STA.b $30

|0CF872| JSR Attract_TriggerBGDMA

|0CF875| SEP #$30

|0CF877| PLB

|0CF878| RTS

;===================================================================================================

Attract_TriggerBGDMA:
|0CF879| SEP #$10

|0CF87B| LDX.b #$07

|0CF87D| LDA.b $30
|0CF87F| STA.w VMADDR

.next
|0CF882| LDY.b #$80
|0CF884| STY.w VMAIN

|0CF887| LDA.w #$1801
|0CF88A| STA.w DMA0MODE

|0CF88D| LDA.w #$1006
|0CF890| STA.w DMA0ADDRL

|0CF893| LDY.b #$00
|0CF895| STY.w DMA0ADDRB

|0CF898| LDA.w #$0100
|0CF89B| STA.w DMA0SIZE

|0CF89E| LDY.b #$01
|0CF8A0| STY.w MDMAEN

|0CF8A3| DEX
|0CF8A4| BPL .next

|0CF8A6| RTS

;===================================================================================================

AttractOAMData:

.king_size
|0CF8A7| db $02, $02, $02, $02

.king_offset_x
|0CF8AB| db  16,   0,  16,   0

.king_offset_y
|0CF8AF| db  16,  16,   0,   0

.king_char
|0CF8B3| db $2A, $2A, $0A, $0A

.king_prop
|0CF8B7| db $7B, $3B, $7B, $3B

;---------------------------------------------------------------------------------------------------

.mantle_size
|0CF8BB| db $02, $02, $02, $02, $02, $02

.mantle_offset_x
|0CF8C1| db   0,  16,  32,   0,  16,  32

.mantle_offset_y
|0CF8C7| db   0,   0,   0,  16,  16,  16

.mantle_char
|0CF8CD| db $0C, $0E, $0C, $2C, $2E, $2C

.mantle_prop
|0CF8D3| db $31, $31, $71, $31, $31, $71

;---------------------------------------------------------------------------------------------------

AttractAgahnimOAM:

.size
|0CF8D9| db $02, $02, $02, $02, $02, $02

.offset_x
|0CF8DF| db   5,  11,   0,  16,   0,  16

.offset_y
|0CF8E5| db  25,  25,   0,   0,  16,  16

;---------------------------------------------------------------------------------------------------

.char_step3
|0CF8EB| db $6C, $6C, $82, $82, $A2, $A2

.char_step5
|0CF8F1| db $6C, $6C, $80, $82, $A0, $A2

.char_step6
|0CF8F7| db $6C, $6C, $82, $80, $A2, $A0

.char_step4
|0CF8FD| db $6C, $6C, $80, $80, $A0, $A0

.char_step0
|0CF903| db $6C, $6C, $84, $84, $A4, $A4

.char_step1
|0CF909| db $6C, $6C, $C4, $C2, $E4, $E6

.char_step2
|0CF90F| db $6C, $6C, $88, $8A, $A8, $AA

;---------------------------------------------------------------------------------------------------

.prop_step0
|0CF915| db $38, $38, $3B, $7B, $3B, $7B

.prop_step1
|0CF91B| db $38, $38, $3B, $3B, $3B, $3B

.prop_step2
|0CF921| db $38, $38, $3B, $3B, $3B, $3B

;---------------------------------------------------------------------------------------------------

AttractAltarMaidenOAM:

.size
|0CF927| db $02, $02

.offset_x
|0CF929| db $00, $08

.offset_y
|0CF92B| db $00, $00

.char_step0
|0CF92D| db $03, $04

.char_step1
|0CF92F| db $00, $01

.prop
|0CF931| db $3D, $3D

;---------------------------------------------------------------------------------------------------

AttractAltarMaidenShadowOAM:

.size
|0CF933| db $02, $02

;---------------------------------------------------------------------------------------------------

.offset_x_step4
|0CF935| db $00, $08

.offset_x_step3
|0CF937| db $00, $06

.offset_x_step2
|0CF939| db $00, $04

.offset_x_step1
|0CF93B| db $00, $02

.offset_x_step0
|0CF93D| db $00, $00

;---------------------------------------------------------------------------------------------------

.offset_y
|0CF93F| db $00, $00

.char
|0CF941| db $6C, $6C

.prop
|0CF943| db $38, $38

;===================================================================================================

DramagahnimSpellOAM:

.size
|0CF945| db $00, $00, $00, $00
|0CF949| db $00, $00, $00, $00
|0CF94D| db $00, $00, $02, $02
|0CF951| db $02, $02

.offset_x
|0CF953| db   0,  28,  -2,  30
|0CF957| db  -2,  30,   0,  28
|0CF95B| db   0,  28,   2,  18
|0CF95F| db   2,  18

.offset_y
|0CF961| db   0,   0,   3,   3
|0CF965| db  11,  11,  16,  16
|0CF969| db  24,  24,  16,  16
|0CF96D| db  32,  32

;---------------------------------------------------------------------------------------------------

.char_step0
|0CF96F| db $CE, $CE, $26, $26
|0CF973| db $36, $36, $26, $26
|0CF977| db $36, $36, $20, $20
|0CF97B| db $20, $20

.char_step1
|0CF97D| db $CE, $CE, $26, $26
|0CF981| db $36, $36, $26, $26
|0CF985| db $36, $36, $22, $22
|0CF989| db $22, $22

;---------------------------------------------------------------------------------------------------

.prop_step0
|0CF98B| db $35, $35, $75, $35
|0CF98F| db $75, $35, $75, $35
|0CF993| db $75, $35, $35, $75
|0CF997| db $B5, $F5

.prop_step1
|0CF999| db $37, $37, $77, $37
|0CF99D| db $77, $37, $77, $37
|0CF9A1| db $77, $37, $37, $77
|0CF9A5| db $B7, $F7

;---------------------------------------------------------------------------------------------------

AttractTelebubbleOAM:

.size
|0CF9A7| db $02, $02

.step0_offset_x
|0CF9A9| db   0

.step0_offset_y
|0CF9AA| db   0

.step0_char
|0CF9AB| db $C6

.step0_prop
|0CF9AC| db $3D

;---------------------------------------------------------------------------------------------------

.step1_offset_x
|0CF9AD| db   0,  16

.step1_offset_y
|0CF9AF| db   0,   0

.step1_char
|0CF9B1| db $24, $24

.step1_prop
|0CF9B3| db $35, $75

;===================================================================================================

Attract_DrawPreloadedSprite:
|0CF9B5| PHB
|0CF9B6| PHK
|0CF9B7| PLB

.next_object
|0CF9B8| LDX.b $2A

|0CF9BA| LDA.b ($2D),Y
|0CF9BC| STA.w $0A60,X

|0CF9BF| TXA
|0CF9C0| ASL A
|0CF9C1| ASL A
|0CF9C2| TAX

|0CF9C3| LDA.b ($02),Y
|0CF9C5| CLC
|0CF9C6| ADC.b $28
|0CF9C8| STA.w $0900,X

|0CF9CB| LDA.b ($04),Y
|0CF9CD| CLC
|0CF9CE| ADC.b $29
|0CF9D0| STA.w $0901,X

|0CF9D3| LDA.b ($06),Y
|0CF9D5| STA.w $0902,X

|0CF9D8| LDA.b ($08),Y
|0CF9DA| STA.w $0903,X

|0CF9DD| INC.b $2A

|0CF9DF| DEY
|0CF9E0| BPL .next_object

|0CF9E2| PLB

|0CF9E3| RTS

;===================================================================================================

pool Attract_DrawZelda

.head_char
|0CF9E4| db $28

.body_char
|0CF9E5| db $2A

.head_prop
|0CF9E6| db $29

.body_prop
|0CF9E7| db $29

endpool

;---------------------------------------------------------------------------------------------------

Attract_DrawZelda:
|0CF9E8| LDX.b $2A

|0CF9EA| LDA.b #$02
|0CF9EC| STA.w $0A60,X

|0CF9EF| TXA
|0CF9F0| ASL A
|0CF9F1| ASL A
|0CF9F2| TAX

|0CF9F3| LDA.b #$60
|0CF9F5| STA.w $0900,X
|0CF9F8| STA.w $0904,X

|0CF9FB| LDA.b $28
|0CF9FD| STA.w $0901,X

|0CFA00| CLC
|0CFA01| ADC.b #$0A
|0CFA03| STA.w $0905,X

|0CFA06| LDA.l .head_char
|0CFA0A| STA.w $0902,X

|0CFA0D| LDA.l .body_char
|0CFA11| STA.w $0906,X

|0CFA14| LDA.l .head_prop
|0CFA18| STA.w $0903,X

|0CFA1B| LDA.l .body_prop
|0CFA1F| STA.w $0907,X

|0CFA22| INC.b $2A
|0CFA24| INC.b $2A

|0CFA26| RTS

;===================================================================================================

pool Attract_DrawKidnappedMaiden

.head_char
|0CFA27| db $06

.body_char
|0CFA28| db $08, $0A

.offset_y
|0CFA2A| db   0,   1

.body_offset_y
|0CFA2C| db  10,   9

.head_prop
|0CFA2E| db $3D

.body_prop
|0CFA2F| db $3D

endpool

;---------------------------------------------------------------------------------------------------

Attract_DrawKidnappedMaiden:
|0CFA30| PHB
|0CFA31| PHK
|0CFA32| PLB

|0CFA33| PHY

|0CFA34| LDX.b $2A

|0CFA36| LDA.b #$02
|0CFA38| LDY.b $40
|0CFA3A| BEQ .step_0

|0CFA3C| ORA.b #$01

.step_0
|0CFA3E| STA.w $0A60,X
|0CFA41| STA.w $0A61,X

|0CFA44| TXA
|0CFA45| ASL A
|0CFA46| ASL A
|0CFA47| TAX

|0CFA48| LDA.b $28
|0CFA4A| STA.w $0900,X
|0CFA4D| STA.w $0904,X

|0CFA50| LDA.b $32

|0CFA52| LSR A
|0CFA53| LSR A
|0CFA54| LSR A

|0CFA55| AND.b #$01
|0CFA57| TAY

|0CFA58| LDA.b $29
|0CFA5A| CLC
|0CFA5B| ADC.w .offset_y,Y
|0CFA5E| STA.w $0901,X

|0CFA61| CLC
|0CFA62| ADC.w .body_offset_y,Y
|0CFA65| STA.w $0905,X

|0CFA68| LDA.w .head_char
|0CFA6B| STA.w $0902,X

|0CFA6E| LDA.w .body_char,Y
|0CFA71| STA.w $0906,X

|0CFA74| LDA.w .head_prop
|0CFA77| STA.w $0903,X

|0CFA7A| LDA.w .body_prop
|0CFA7D| STA.w $0907,X

|0CFA80| INC.b $2A
|0CFA82| INC.b $2A

|0CFA84| PLY
|0CFA85| PLB

|0CFA86| RTS

;===================================================================================================

Attract_WindowingHDMA:

.table_a
|0CFA87| db $20 : db $FF, $00
|0CFA8A| db $50 : db $18, $E0
|0CFA8D| db $50 : db $18, $E0
|0CFA90| db $01 : db $FF, $00
|0CFA93| db $00

.table_b
|0CFA94| db $48 : db $FF, $00
|0CFA97| db $30 : db $30, $D8
|0CFA9A| db $01 : db $FF, $00
|0CFA9D| db $00

;---------------------------------------------------------------------------------------------------

.settings
|0CFA9E| db $01
|0CFA9F| db WH0
|0CFAA0| dl .table_a

;===================================================================================================

Attract_SetUpWindowingHDMA:
|0CFAA3| LDX.b #$04

.next
|0CFAA5| LDA.l Attract_WindowingHDMA.settings,X
|0CFAA9| STA.w DMA6MODE,X
|0CFAAC| STA.w DMA7MODE,X

|0CFAAF| DEX
|0CFAB0| BPL .next

|0CFAB2| REP #$20

|0CFAB4| LDA.w #Attract_WindowingHDMA.table_b
|0CFAB7| STA.w DMA7ADDRL

|0CFABA| SEP #$20

|0CFABC| LDA.b #WH2
|0CFABE| STA.w DMA7PORT

|0CFAC1| RTS

;===================================================================================================

AttractImage0Stripes:
|0CFAC2| dw $6561, $2840 ; VRAM $C2CA | 42 bytes | Fixed horizontal
|0CFAC6| dw $3500

|0CFAC8| dw $8561, $2840 ; VRAM $C30A | 42 bytes | Fixed horizontal
|0CFACC| dw $3510

|0CFACE| dw $A561, $2900 ; VRAM $C34A | 42 bytes | Horizontal
|0CFAD2| dw $3501, $3502, $3501, $3502, $3501, $3502, $3501, $3502
|0CFAE2| dw $3501, $3103, $7103, $3502, $3501, $3502, $3501, $3502
|0CFAF2| dw $3501, $3502, $3501, $3502, $3501

|0CFAFC| dw $C561, $2900 ; VRAM $C38A | 42 bytes | Horizontal
|0CFB00| dw $3511, $3512, $3511, $3512, $3511, $3512, $3511, $3512
|0CFB10| dw $3511, $3513, $7513, $3512, $3511, $3512, $3511, $3512
|0CFB20| dw $3511, $3512, $3511, $3512, $3511

|0CFB2A| dw $E561, $2900 ; VRAM $C3CA | 42 bytes | Horizontal
|0CFB2E| dw $3520, $3521, $3520, $3521, $3520, $3521, $3520, $3521
|0CFB3E| dw $3520, $3521, $3520, $3521, $3520, $3521, $3520, $3521
|0CFB4E| dw $3520, $3521, $3520, $3521, $3520

|0CFB58| dw $0562, $2840 ; VRAM $C40A | 42 bytes | Fixed horizontal
|0CFB5C| dw $B500

|0CFB5E| db $FF ; end of stripes data

;===================================================================================================

AttractImage1Stripes:
|0CFB5F| dw $6561, $2840 ; VRAM $C2CA | 42 bytes | Fixed horizontal
|0CFB63| dw $3500

|0CFB65| dw $8561, $1300 ; VRAM $C30A | 20 bytes | Horizontal
|0CFB69| dw $3510, $754E, $356E, $3510, $354E, $3510, $354C, $3510
|0CFB79| dw $754E, $3549

|0CFB7D| dw $8F61, $0840 ; VRAM $C31E | 10 bytes | Fixed horizontal
|0CFB81| dw $3510

|0CFB83| dw $9461, $0B00 ; VRAM $C328 | 12 bytes | Horizontal
|0CFB87| dw $754E, $356E, $3510, $354E, $3510, $354C

|0CFB93| dw $A561, $2900 ; VRAM $C34A | 42 bytes | Horizontal
|0CFB97| dw $755F, $755E, $357E, $357F, $355E, $355F, $354D, $755F
|0CFBA7| dw $755E, $354A, $354B, $3510, $7549, $3510, $755F, $755E
|0CFBB7| dw $357E, $357F, $355E, $355F, $354D

|0CFBC1| dw $C561, $2900 ; VRAM $C38A | 42 bytes | Horizontal
|0CFBC5| dw $3550, $3551, $3552, $3553, $3554, $3555, $3556, $3557
|0CFBD5| dw $3558, $3559, $355A, $355B, $355C, $355D, $3550, $3551
|0CFBE5| dw $3552, $3553, $3554, $3555, $3556

|0CFBEF| dw $E561, $2900 ; VRAM $C3CA | 42 bytes | Horizontal
|0CFBF3| dw $3560, $3561, $3562, $3563, $3564, $3565, $3566, $3567
|0CFC03| dw $3568, $3569, $356A, $356B, $356C, $356D, $3560, $3561
|0CFC13| dw $3562, $3563, $3564, $3565, $3566

|0CFC1D| dw $0562, $2900 ; VRAM $C40A | 42 bytes | Horizontal
|0CFC21| dw $3570, $3571, $3572, $3573, $3574, $3575, $3576, $3577
|0CFC31| dw $3578, $3579, $357A, $357B, $357C, $357D, $3570, $3571
|0CFC41| dw $3572, $3573, $3574, $3575, $3576

|0CFC4B| db $FF ; end of stripes data

;===================================================================================================

AttractImage2Stripes:
|0CFC4C| dw $6561, $2840 ; VRAM $C2CA | 42 bytes | Fixed horizontal
|0CFC50| dw $3500

|0CFC52| dw $8561, $2840 ; VRAM $C30A | 42 bytes | Fixed horizontal
|0CFC56| dw $3510

|0CFC58| dw $A561, $1D00 ; VRAM $C34A | 30 bytes | Horizontal
|0CFC5C| dw $3522, $3523, $3510, $3522, $3523, $3510, $3522, $3523
|0CFC6C| dw $3510, $3522, $3523, $3510, $7510, $7523, $7522

|0CFC7A| dw $B461, $0640 ; VRAM $C368 | 8 bytes | Fixed horizontal
|0CFC7E| dw $3510

|0CFC80| dw $B861, $0300 ; VRAM $C370 | 4 bytes | Horizontal
|0CFC84| dw $7523, $7522

|0CFC88| dw $C561, $2900 ; VRAM $C38A | 42 bytes | Horizontal
|0CFC8C| dw $3504, $3505, $3506, $3504, $3505, $3506, $3504, $3505
|0CFC9C| dw $3506, $3504, $3505, $3506, $7506, $7505, $7504, $7510
|0CFCAC| dw $7523, $7522, $7506, $7505, $7504

|0CFCB6| dw $E561, $2900 ; VRAM $C3CA | 42 bytes | Horizontal
|0CFCBA| dw $3514, $3515, $3516, $3514, $3515, $3516, $3514, $3515
|0CFCCA| dw $3516, $3514, $3515, $3516, $7516, $7515, $7514, $7506
|0CFCDA| dw $7505, $7504, $7516, $7515, $7514

|0CFCE4| dw $0562, $2900 ; VRAM $C40A | 42 bytes | Horizontal
|0CFCE8| dw $3524, $3525, $3526, $3524, $3525, $3526, $3524, $3525
|0CFCF8| dw $3526, $3524, $3525, $3526, $7526, $7525, $7524, $7526
|0CFD08| dw $7525, $7524, $7526, $7525, $7524

|0CFD12| db $FF ; end of stripes data

;===================================================================================================

AttractImage3Stripes:
|0CFD13| dw $6561, $2900 ; VRAM $C2CA | 42 bytes | Horizontal
|0CFD17| dw $3500, $3500, $351B, $3530, $3531, $3532, $3500, $3500
|0CFD27| dw $3500, $3533, $3541, $7541, $7533, $7500, $7500, $7500
|0CFD37| dw $7532, $7531, $7530, $751B, $7500

|0CFD41| dw $8561, $1E40 ; VRAM $C30A | 32 bytes | Fixed horizontal
|0CFD45| dw $3510

|0CFD47| dw $8661, $0900 ; VRAM $C30C | 10 bytes | Horizontal
|0CFD4B| dw $3534, $350B, $3540, $3541, $3542

|0CFD55| dw $9561, $0900 ; VRAM $C32A | 10 bytes | Horizontal
|0CFD59| dw $7542, $7541, $7540, $750B, $7534

|0CFD63| dw $A561, $2900 ; VRAM $C34A | 42 bytes | Horizontal
|0CFD67| dw $3543, $3544, $3507, $3508, $3509, $350A, $3510, $350C
|0CFD77| dw $350D, $350E, $350F, $750F, $750E, $750D, $750C, $7510
|0CFD87| dw $750A, $7509, $7508, $7507, $7544

|0CFD91| dw $C561, $2900 ; VRAM $C38A | 42 bytes | Horizontal
|0CFD95| dw $3535, $3536, $3517, $3518, $3519, $351A, $3510, $351C
|0CFDA5| dw $351D, $351E, $351F, $751F, $751E, $751D, $751C, $7510
|0CFDB5| dw $751A, $7519, $7518, $7517, $7536

|0CFDBF| dw $E561, $2900 ; VRAM $C3CA | 42 bytes | Horizontal
|0CFDC3| dw $3545, $3546, $3527, $3528, $3529, $352A, $352B, $352C
|0CFDD3| dw $352D, $352E, $352F, $752F, $752E, $752D, $752C, $752B
|0CFDE3| dw $752A, $7529, $7528, $7527, $7546

|0CFDED| dw $0562, $2900 ; VRAM $C40A | 42 bytes | Horizontal
|0CFDF1| dw $3547, $3548, $3537, $3538, $3539, $353A, $353B, $353C
|0CFE01| dw $353D, $353E, $353F, $753F, $753E, $753D, $753C, $753B
|0CFE11| dw $753A, $7539, $7538, $7537, $7548

|0CFE1B| db $FF ; end of stripes data

;===================================================================================================

pool Intro_HandleLogoSword

.char
|0CFE1C| db $00
|0CFE1D| db $02
|0CFE1E| db $20
|0CFE1F| db $22
|0CFE20| db $04
|0CFE21| db $06
|0CFE22| db $08
|0CFE23| db $0A
|0CFE24| db $0C
|0CFE25| db $0E

.position_x
|0CFE26| db $40
|0CFE27| db $40
|0CFE28| db $30
|0CFE29| db $50
|0CFE2A| db $40
|0CFE2B| db $40
|0CFE2C| db $40
|0CFE2D| db $40
|0CFE2E| db $40
|0CFE2F| db $40

.position_y
|0CFE30| dw $0010
|0CFE32| dw $0020
|0CFE34| dw $0028
|0CFE36| dw $0028
|0CFE38| dw $0030
|0CFE3A| dw $0040
|0CFE3C| dw $0050
|0CFE3E| dw $0060
|0CFE40| dw $0070
|0CFE42| dw $0080

|0CFE44| db $00

endpool

;---------------------------------------------------------------------------------------------------

Intro_InitLogoSword:
|0CFE45| LDA.b #$07
|0CFE47| STA.b $CB
|0CFE49| STZ.b $CC
|0CFE4B| STZ.b $CD

|0CFE4D| REP #$20

|0CFE4F| LDA.w #$FF7E
|0CFE52| STA.b $C8

|0CFE54| SEP #$20

;---------------------------------------------------------------------------------------------------

Intro_HandleLogoSword:
|0CFE56| PHB
|0CFE57| PHK
|0CFE58| PLB

|0CFE59| LDA.b $CA
|0CFE5B| BEQ .dont_tick

|0CFE5D| DEC.b $CA

.dont_tick
|0CFE5F| JSL FixedColorBlack

|0CFE63| LDA.w $0FF9
|0CFE66| BEQ .do_sprites

|0CFE68| AND.b #$03
|0CFE6A| BEQ .delay_clear

|0CFE6C| LDX.b $D0

|0CFE6E| LDA.b #$1F
|0CFE70| ORA.b $9C,X
|0CFE72| STA.b $9C,X

|0CFE74| INX
|0CFE75| CPX.b #$03
|0CFE77| BNE .nowrap

|0CFE79| LDX.b #$00

.nowrap
|0CFE7B| STX.b $D0

.delay_clear
|0CFE7D| DEC.w $0FF9

;---------------------------------------------------------------------------------------------------

.do_sprites
|0CFE80| LDY.b #$09

.next_sprite
|0CFE82| TYA
|0CFE83| ASL A
|0CFE84| ASL A
|0CFE85| TAX

|0CFE86| LDA.b #$02
|0CFE88| STA.w $0A72,Y

|0CFE8B| LDA.w .char,Y
|0CFE8E| STA.w $094A,X

|0CFE91| LDA.b #$21
|0CFE93| STA.w $094B,X

|0CFE96| LDA.w .position_x,Y
|0CFE99| STA.w $0948,X

|0CFE9C| PHY
|0CFE9D| TYA
|0CFE9E| ASL A
|0CFE9F| TAY

|0CFEA0| REP #$20

|0CFEA2| LDA.b $C8
|0CFEA4| CLC
|0CFEA5| ADC.w .position_y,Y
|0CFEA8| SEP #$20
|0CFEAA| XBA
|0CFEAB| BEQ .on_screen

|0CFEAD| LDA.b #$F8
|0CFEAF| XBA

.on_screen
|0CFEB0| XBA
|0CFEB1| SEC
|0CFEB2| SBC.b #$08
|0CFEB4| STA.w $0949,X

|0CFEB7| PLY
|0CFEB8| DEY
|0CFEB9| BPL .next_sprite

;---------------------------------------------------------------------------------------------------

|0CFEBB| REP #$20

|0CFEBD| LDA.b $C8
|0CFEBF| CMP.w #$001E
|0CFEC2| BEQ .no_sfx

|0CFEC4| LDY.b #$01 ; SFX2.01

|0CFEC6| CMP.w #$FFBE
|0CFEC9| BEQ .play_sfx

|0CFECB| CMP.w #$000E
|0CFECE| BNE .delay

|0CFED0| STZ.b $D0

|0CFED2| LDX.b #$20
|0CFED4| STX.w $0FF9

|0CFED7| LDY.b #$2C ; SFX2.2C

.play_sfx
|0CFED9| STY.w $012E

.delay
|0CFEDC| CLC
|0CFEDD| ADC.w #$0010
|0CFEE0| STA.b $C8

;---------------------------------------------------------------------------------------------------

.no_sfx
|0CFEE2| SEP #$20

|0CFEE4| LDX.b $CC
|0CFEE6| JMP.w (.vectors,X)

.vectors
|0CFEE9| dw LogoSword_IdleState
|0CFEEB| dw LogoSword_EyeTwinkle
|0CFEED| dw LogoSword_BladeShimmer

;===================================================================================================

LogoSword_IdleState:
|0CFEEF| LDA.w $0FF9
|0CFEF2| BNE .exit

|0CFEF4| REP #$20

|0CFEF6| LDA.b $C8
|0CFEF8| CMP.w #$001E

|0CFEFB| SEP #$20

|0CFEFD| BNE .exit

|0CFEFF| INC.b $CC
|0CFF01| INC.b $CC

.exit
|0CFF03| PLB

|0CFF04| RTS

;===================================================================================================

pool LogoSword_EyeTwinkle

.timer
|0CFF05| db $04, $04, $06, $06, $06, $04, $04

.char
|0CFF0C| db $28, $37, $27, $36, $27, $37, $28

endpool

;---------------------------------------------------------------------------------------------------

LogoSword_EyeTwinkle:
|0CFF13| LDX.b $CB

|0CFF15| LDA.b $CA
|0CFF17| BNE .char_only

|0CFF19| DEX
|0CFF1A| STX.b $CB
|0CFF1C| BPL .delay

|0CFF1E| STZ.b $CB

|0CFF20| LDA.b #$02
|0CFF22| STA.b $CA

|0CFF24| INC.b $CC
|0CFF26| INC.b $CC

|0CFF28| BRA .exit

.delay
|0CFF2A| LDA.w .timer,X
|0CFF2D| STA.b $CA

.char_only
|0CFF2F| STZ.w $0A70

|0CFF32| LDA.b #$44
|0CFF34| STA.w $0940

|0CFF37| LDA.b #$43
|0CFF39| STA.w $0941

|0CFF3C| LDA.b #$25
|0CFF3E| STA.w $0943

|0CFF41| LDA.w .char,X
|0CFF44| STA.w $0942

.exit
|0CFF47| PLB

|0CFF48| RTS

;===================================================================================================

pool LogoSword_BladeShimmer

.char
|0CFF49| db $26, $20
|0CFF4B| db $24, $34
|0CFF4D| db $25, $20
|0CFF4F| db $35, $20

endpool

;---------------------------------------------------------------------------------------------------

LogoSword_BladeShimmer:
|0CFF51| LDX.b $CB
|0CFF53| CPX.b #$07
|0CFF55| BCS .exit

|0CFF57| STZ.w $0A70
|0CFF5A| STZ.w $0A71

|0CFF5D| LDA.b #$42
|0CFF5F| STA.w $0940
|0CFF62| STA.w $0944

|0CFF65| LDA.b $CD
|0CFF67| CMP.b #$50
|0CFF69| BCC .not_maxed

|0CFF6B| LDA.b #$4F

.not_maxed
|0CFF6D| CLC
|0CFF6E| ADC.b $C8
|0CFF70| CLC
|0CFF71| ADC.b #$31
|0CFF73| STA.w $0941

|0CFF76| CLC
|0CFF77| ADC.b #$08
|0CFF79| STA.w $0945

|0CFF7C| LDA.b #$23
|0CFF7E| STA.w $0943
|0CFF81| STA.w $0947

|0CFF84| LDA.w .char+0,X
|0CFF87| STA.w $0942

|0CFF8A| LDA.w .char+1,X
|0CFF8D| STA.w $0946

;---------------------------------------------------------------------------------------------------

|0CFF90| LDA.b $CA
|0CFF92| BNE .exit

|0CFF94| LDA.b $CD
|0CFF96| CLC
|0CFF97| ADC.b #$04
|0CFF99| STA.b $CD

|0CFF9B| CMP.b #$04
|0CFF9D| BEQ .advance

|0CFF9F| CMP.b #$48
|0CFFA1| BEQ .advance

|0CFFA3| CMP.b #$4C
|0CFFA5| BEQ .advance

|0CFFA7| CMP.b #$58
|0CFFA9| BNE .exit

.advance
|0CFFAB| INC.b $CB
|0CFFAD| INC.b $CB

.exit
|0CFFAF| PLB

|0CFFB0| RTS

;===================================================================================================
; FREE ROM: 0x4F
;===================================================================================================
NULL_0CFFB1:
|0CFFB1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0CFFB9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0CFFC1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0CFFC9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0CFFD1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0CFFD9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0CFFE1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0CFFE9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0CFFF1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0CFFF9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================
