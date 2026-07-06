; see «rooms.asm»

org $0AB72A

;===================================================================================================
; FREE ROM: 0x06
;===================================================================================================
NULL_0AB72A:
|0AB72A| db $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

Module0E_0A_FluteMenu:
|0AB730| LDA.w $0200
|0AB733| JSL JumpTableLocal
|0AB737| dw WorldMap_FadeOut
|0AB739| dw FluteMenu_LoadMap
|0AB73B| dw WorldMap_LoadSpriteGFX
|0AB73D| dw WorldMap_Brighten
|0AB73F| dw FluteMenu_AdvanceMode
|0AB741| dw FluteMenu_HandleSelection
|0AB743| dw WorldMap_RestoreGraphics
|0AB745| dw FluteMenu_LoadSelectedScreen
|0AB747| dw Overworld_LoadOverlayAndMap
|0AB749| dw FluteMenu_FadeInAndQuack

;===================================================================================================

FluteMenu_LoadMap:
|0AB74B| STZ.w $1AF0

|0AB74E| JSL WorldMap_LoadLightWorldMap

|0AB752| RTL

;===================================================================================================

FluteMenu_AdvanceMode:
|0AB753| LDA.b #$10
|0AB755| STA.b $C8

|0AB757| INC.w $0200

|0AB75A| RTL

;===================================================================================================

FluteMenuNumbers:
.char
|0AB75B| db $7F
|0AB75C| db $79
|0AB75D| db $6C
|0AB75E| db $6D
|0AB75F| db $6E
|0AB760| db $6F
|0AB761| db $7C
|0AB762| db $7D

.pos_x_low
|0AB763| db $80
|0AB764| db $CF
|0AB765| db $10
|0AB766| db $B8
|0AB767| db $30
|0AB768| db $70
|0AB769| db $70
|0AB76A| db $F0

.pos_x_high
|0AB76B| db $06
|0AB76C| db $0C
|0AB76D| db $02
|0AB76E| db $08
|0AB76F| db $0F
|0AB770| db $00
|0AB771| db $07
|0AB772| db $0E

.pos_y_low
|0AB773| db $5B
|0AB774| db $98
|0AB775| db $C0
|0AB776| db $20
|0AB777| db $50
|0AB778| db $B0
|0AB779| db $30
|0AB77A| db $80

.pos_y_high
|0AB77B| db $03
|0AB77C| db $05
|0AB77D| db $07
|0AB77E| db $0B
|0AB77F| db $0B
|0AB780| db $0F
|0AB781| db $0F
|0AB782| db $0F

.bits
|0AB783| db $80
|0AB784| db $40
|0AB785| db $20
|0AB786| db $10
|0AB787| db $08
|0AB788| db $04
|0AB789| db $02
|0AB78A| db $01

;---------------------------------------------------------------------------------------------------

FluteMenu_HandleSelection:
|0AB78B| LDA.b $C8
|0AB78D| BNE .delay

|0AB78F| LDA.b $F2
|0AB791| ORA.b $F0
|0AB793| AND.b #$C0
|0AB795| BEQ .no_selection_made

|0AB797| INC.w $0200

|0AB79A| RTL

;---------------------------------------------------------------------------------------------------

.delay
|0AB79B| DEC.b $C8

.no_selection_made
|0AB79D| LDY.b #$07
|0AB79F| LDX.w $1AF0

.continue_from_unreachable
|0AB7A2| BRA .continue

;---------------------------------------------------------------------------------------------------

.unreachable
|0AB7A4| TXA
|0AB7A5| INC A
|0AB7A6| AND.b #$07
|0AB7A8| TAX

|0AB7A9| DEY
|0AB7AA| BPL .continue_from_unreachable

;---------------------------------------------------------------------------------------------------

.continue
|0AB7AC| STX.w $1AF0

|0AB7AF| LDA.b $F4
|0AB7B1| AND.b #$0A
|0AB7B3| BEQ .pressed_up_or_left

|0AB7B5| DEC.w $1AF0

|0AB7B8| LDA.b #$20 ; SFX3.20
|0AB7BA| STA.w $012F

.pressed_up_or_left
|0AB7BD| LDA.b $F4
|0AB7BF| AND.b #$05
|0AB7C1| BEQ .pressed_down_or_right

|0AB7C3| INC.w $1AF0

|0AB7C6| LDA.b #$20 ; SFX3.20
|0AB7C8| STA.w $012F

.pressed_down_or_right
|0AB7CB| LDA.w $1AF0
|0AB7CE| AND.b #$07
|0AB7D0| STA.w $1AF0

|0AB7D3| LDA.b $1A
|0AB7D5| AND.b #$10
|0AB7D7| BEQ .dont_draw_link

;---------------------------------------------------------------------------------------------------

|0AB7D9| JSR WorldMap_CalculateOAMCoordinates
|0AB7DC| BCC .dont_draw_link

|0AB7DE| LDA.b $0E
|0AB7E0| SEC
|0AB7E1| SBC.b #$04
|0AB7E3| STA.b $0E

|0AB7E5| LDA.b $0F
|0AB7E7| SEC
|0AB7E8| SBC.b #$04
|0AB7EA| STA.b $0F

|0AB7EC| LDA.b #$00
|0AB7EE| STA.b $0D

|0AB7F0| LDA.b #$3E
|0AB7F2| STA.b $0C

|0AB7F4| LDA.b #$02
|0AB7F6| STA.b $0B

|0AB7F8| LDX.b #$10
|0AB7FA| JSR WorldMap_HandleSpriteBlink

;---------------------------------------------------------------------------------------------------

.dont_draw_link
|0AB7FD| LDA.l $7EC108
|0AB801| PHA

|0AB802| LDA.l $7EC109
|0AB806| PHA

|0AB807| LDA.l $7EC10A
|0AB80B| PHA

|0AB80C| LDA.l $7EC10B
|0AB810| PHA

|0AB811| LDX.b #$07

;---------------------------------------------------------------------------------------------------

.next_numeral
|0AB813| CPX.w $1AF0
|0AB816| BNE .not_selected

.selected
|0AB818| LDA.l FluteMenuNumbers.pos_x_low,X
|0AB81C| STA.w $1AB0,X
|0AB81F| STA.l $7EC10A

|0AB823| LDA.l FluteMenuNumbers.pos_x_high,X
|0AB827| STA.w $1AC0,X
|0AB82A| STA.l $7EC10B

|0AB82E| LDA.l FluteMenuNumbers.pos_y_low,X
|0AB832| STA.w $1AD0,X
|0AB835| STA.l $7EC108

|0AB839| LDA.l FluteMenuNumbers.pos_y_high,X
|0AB83D| STA.w $1AE0,X
|0AB840| STA.l $7EC109

|0AB844| PHX
|0AB845| JSR WorldMap_CalculateOAMCoordinates
|0AB848| PLX

|0AB849| BCC .to_next_numeral

|0AB84B| LDA.l FluteMenuNumbers.char,X
|0AB84F| STA.b $0D

|0AB851| LDA.b $1A
|0AB853| AND.b #$06
|0AB855| ORA.b #$30
|0AB857| STA.b $0C

|0AB859| LDA.b #$00
|0AB85B| STA.b $0B

|0AB85D| PHX
|0AB85E| JSR WorldMap_HandleSpriteBlink
|0AB861| PLX

|0AB862| BRA .to_next_numeral

;---------------------------------------------------------------------------------------------------

.not_selected
|0AB864| LDA.l FluteMenuNumbers.pos_x_low,X
|0AB868| STA.w $1AB0,X
|0AB86B| STA.l $7EC10A

|0AB86F| LDA.l FluteMenuNumbers.pos_x_high,X
|0AB873| STA.w $1AC0,X
|0AB876| STA.l $7EC10B

|0AB87A| LDA.l FluteMenuNumbers.pos_y_low,X
|0AB87E| STA.w $1AD0,X
|0AB881| STA.l $7EC108

|0AB885| LDA.l FluteMenuNumbers.pos_y_high,X
|0AB889| STA.w $1AE0,X
|0AB88C| STA.l $7EC109

|0AB890| PHX

|0AB891| JSR WorldMap_CalculateOAMCoordinates

|0AB894| PLX

|0AB895| BCC .to_next_numeral

|0AB897| LDA.l FluteMenuNumbers.char,X
|0AB89B| STA.b $0D

|0AB89D| LDA.b #$32
|0AB89F| STA.b $0C

|0AB8A1| LDA.b #$00
|0AB8A3| STA.b $0B

|0AB8A5| PHX

|0AB8A6| JSR WorldMap_HandleSpriteBlink

|0AB8A9| PLX

;---------------------------------------------------------------------------------------------------

.to_next_numeral
|0AB8AA| DEX
|0AB8AB| BMI .done

|0AB8AD| JMP.w .next_numeral

;---------------------------------------------------------------------------------------------------

.done
|0AB8B0| PLA
|0AB8B1| STA.l $7EC10B

|0AB8B5| PLA
|0AB8B6| STA.l $7EC10A

|0AB8BA| PLA
|0AB8BB| STA.l $7EC109

|0AB8BF| PLA
|0AB8C0| STA.l $7EC108

|0AB8C4| RTL

;===================================================================================================

FluteMenu_LoadSelectedScreen:
|0AB8C5| LDA.l $7EF2BB
|0AB8C9| AND.b #$DF
|0AB8CB| STA.l $7EF2BB

|0AB8CF| LDA.l $7EF2FB
|0AB8D3| AND.b #$DF
|0AB8D5| STA.l $7EF2FB

|0AB8D9| LDA.l $7EF216
|0AB8DD| AND.b #$7F
|0AB8DF| STA.l $7EF216

|0AB8E3| LDA.l $7EF051
|0AB8E7| AND.b #$FE
|0AB8E9| STA.l $7EF051

|0AB8ED| JSL LoadFluteSpot
|0AB8F1| JSL LoadLandingScreenPalettes

;---------------------------------------------------------------------------------------------------

|0AB8F5| LDY.b #$58

|0AB8F7| LDA.b $8A
|0AB8F9| AND.b #$BF
|0AB8FB| CMP.b #$03 ; OW 03, OW 43
|0AB8FD| BEQ .death_mountain

|0AB8FF| CMP.b #$05 ; OW 05, OW 45
|0AB901| BEQ .death_mountain

|0AB903| CMP.b #$07 ; OW 07, OW 47
|0AB905| BEQ .death_mountain

|0AB907| LDY.b #$5A

.death_mountain
|0AB909| JSL DecompressAnimatedOverworldTiles
|0AB90D| JSL Overworld_SetFixedColAndScroll

|0AB911| STZ.w $0AA9
|0AB914| STZ.w $0AB2

|0AB917| JSL InitializeTilesets

|0AB91B| INC.w $0200

|0AB91E| STZ.b $B2

|0AB920| JSL ReloadSubscreenOverlayAndAdvance_long

;---------------------------------------------------------------------------------------------------

|0AB924| LDA.b #$10 ; SFX3.10
|0AB926| STA.w $012F

|0AB929| LDX.b $8A

|0AB92B| LDA.l $7F5B00,X
|0AB92F| LSR A
|0AB930| LSR A
|0AB931| LSR A
|0AB932| LSR A
|0AB933| STA.w $012D

|0AB936| LDA.l $7F5B00,X
|0AB93A| AND.b #$0F
|0AB93C| TAX

|0AB93D| CPX.w $0130
|0AB940| BNE .songs_differ

|0AB942| LDX.b #$F3 ; SONG F3 - max volume

.songs_differ
|0AB944| STX.w $012C

|0AB947| RTL

;===================================================================================================

Overworld_LoadOverlayAndMap:
|0AB948| REP #$20

|0AB94A| LDA.b $10
|0AB94C| PHA

|0AB94D| LDA.w $0200
|0AB950| PHA

|0AB951| SEP #$20

|0AB953| JSL LoadAndBuildOverworldScreen_long

|0AB957| REP #$20

|0AB959| PLA
|0AB95A| INC A
|0AB95B| STA.w $0200

|0AB95E| PLA
|0AB95F| STA.b $10

|0AB961| SEP #$20

|0AB963| RTL

;===================================================================================================

FluteMenu_FadeInAndQuack:
|0AB964| INC.b $13

|0AB966| LDA.b $13
|0AB968| CMP.b #$0F
|0AB96A| BNE .delay

;===================================================================================================

#SpawnLandingDuck:
|0AB96C| STZ.w $0200
|0AB96F| STZ.b $B0

|0AB971| LDA.w $010C
|0AB974| STA.b $10
|0AB976| STZ.b $11

|0AB978| LDA.l $7EC229
|0AB97C| STA.b $9B

|0AB97E| LDY.b #$04
|0AB980| LDA.b #$27 ; ANCILLA 27
|0AB982| JSL AncillaAdd_Duck_drop_off

.delay
|0AB986| JSL HandleAllSprites

|0AB98A| RTL

;===================================================================================================

Module0E_07_OverworldMap:
|0AB98B| LDA.w $0200
|0AB98E| JSL JumpTableLocal
|0AB992| dw WorldMap_FadeOut
|0AB994| dw WorldMap_LoadLightWorldMap
|0AB996| dw WorldMap_LoadDarkWorldMap
|0AB998| dw WorldMap_LoadSpriteGFX
|0AB99A| dw WorldMap_Brighten
|0AB99C| dw WorldMap_PlayerControl
|0AB99E| dw WorldMap_RestoreGraphics
|0AB9A0| dw WorldMap_ExitMap

;===================================================================================================

#EXIT_0AB9A2:
|0AB9A2| RTL

;---------------------------------------------------------------------------------------------------

WorldMap_FadeOut:
|0AB9A3| DEC.b $13
|0AB9A5| BNE EXIT_0AB9A2

|0AB9A7| LDA.b $9B
|0AB9A9| STA.l $7EC229

|0AB9AD| JSL EnableForceBlank

|0AB9B1| LDA.b #$03
|0AB9B3| STA.b $95

|0AB9B5| INC.w $0200

|0AB9B8| REP #$20

|0AB9BA| LDA.b $1C
|0AB9BC| STA.l $7EC211

|0AB9C0| LDA.b $E0
|0AB9C2| STA.l $7EC200

|0AB9C6| LDA.b $E2
|0AB9C8| STA.l $7EC202

|0AB9CC| LDA.b $E6
|0AB9CE| STA.l $7EC204

|0AB9D2| LDA.b $E8
|0AB9D4| STA.l $7EC206

|0AB9D8| STZ.b $E0
|0AB9DA| STZ.b $E2

|0AB9DC| STZ.b $E4
|0AB9DE| STZ.b $E6

|0AB9E0| STZ.b $E8
|0AB9E2| STZ.b $EA

|0AB9E4| LDA.b $99
|0AB9E6| STA.l $7EC225

|0AB9EA| LDA.w #$01FC
|0AB9ED| STA.w $0100

;---------------------------------------------------------------------------------------------------

|0AB9F0| LDX.b $8A
|0AB9F2| CPX.b #$80 ; SPOW
|0AB9F4| BCS .special_overworld

|0AB9F6| LDA.b $20
|0AB9F8| STA.l $7EC108

|0AB9FC| LDA.b $22
|0AB9FE| STA.l $7EC10A

.special_overworld
|0ABA02| SEP #$20

|0ABA04| LDA.l $7EF3C5
|0ABA08| CMP.b #$02
|0ABA0A| BCS .zelda_rescured

|0ABA0C| LDA.b #$80
|0ABA0E| STA.b $99

|0ABA10| LDA.b #$61
|0ABA12| STA.b $9A

.zelda_rescured
|0ABA14| LDA.b #$10 ; SFX3.10
|0ABA16| STA.w $012F

|0ABA19| LDA.b #$05 ; SFX1.05
|0ABA1B| STA.w $012D

|0ABA1E| LDA.b #$F2 ; SONG F2 - half volume
|0ABA20| STA.w $012C

|0ABA23| LDA.b #$07
|0ABA25| STA.w BGMODE
|0ABA28| STA.b $94

|0ABA2A| LDA.b #$80
|0ABA2C| STA.w M7SEL

|0ABA2F| RTL

;===================================================================================================

WorldMap_LoadLightWorldMap:
|0ABA30| JSR WorldMap_FillTilemapWithEF

|0ABA33| LDA.b #$11
|0ABA35| STA.b $1C
|0ABA37| STZ.b $1D

|0ABA39| JSL TransferMode7Characters
|0ABA3D| JSR WorldMap_SetUpHDMA

|0ABA40| PHB

|0ABA41| LDA.b #^Palettes_OWMAP
|0ABA43| PHA
|0ABA44| PLB

|0ABA45| REP #$30

|0ABA47| LDX.w #$00FE
|0ABA4A| LDY.w #$00FE

|0ABA4D| LDA.b $8A
|0ABA4F| AND.w #$0040
|0ABA52| BEQ .next_color

|0ABA54| LDY.w #$01FE

.next_color
|0ABA57| LDA.w Palettes_OWMAP,Y
|0ABA5A| STA.l $7EC500,X

|0ABA5E| DEY
|0ABA5F| DEY

|0ABA60| DEX
|0ABA61| DEX
|0ABA62| BPL .next_color

|0ABA64| SEP #$30

|0ABA66| PLB

|0ABA67| JSL RefreshEquipmentPalettes_sword_and_mail

|0ABA6B| INC.b $15

|0ABA6D| LDA.b #$07
|0ABA6F| STA.b $17

|0ABA71| STZ.b $13

|0ABA73| INC.w $0710
|0ABA76| INC.w $0200

|0ABA79| RTL

;===================================================================================================

WorldMap_LoadDarkWorldMap:
|0ABA7A| LDA.b $8A
|0ABA7C| AND.b #$40
|0ABA7E| BEQ .light_world

|0ABA80| REP #$30

|0ABA82| LDX.w #$03FE

.copy_next
|0ABA85| LDA.l WorldMap_DarkWorldTilemap,X
|0ABA89| STA.w $1000,X

|0ABA8C| DEX
|0ABA8D| DEX
|0ABA8E| BPL .copy_next

|0ABA90| SEP #$30

|0ABA92| LDA.b #$15
|0ABA94| STA.b $17

.light_world
|0ABA96| INC.w $0200

|0ABA99| RTL

;===================================================================================================

WorldMap_LoadSpriteGFX:
|0ABA9A| LDA.b #$10
|0ABA9C| STA.w $0AAA

|0ABA9F| JSL LoadChrHalfSlot

|0ABAA3| STZ.w $0AAA

|0ABAA6| INC.w $0200

|0ABAA9| RTL

;===================================================================================================

WorldMap_Brighten:
|0ABAAA| INC.b $13

|0ABAAC| LDA.b $13
|0ABAAE| CMP.b #$0F
|0ABAB0| BNE .exit

|0ABAB2| INC.w $0200

.exit
|0ABAB5| RTL

;===================================================================================================

UNREACHABLE_0ABAB6:
|0ABAB6| db $1E, $00, $1E, $02, $FE, $02, $00, $80
|0ABABE| db $02, $80, $00, $01, $FF, $01

;===================================================================================================

WorldMap_BaseZoom:
|0ABAC4| db $21 ; zoomed out
|0ABAC5| db $0C ; zoomed in

;===================================================================================================

WorldMap_PanMovements:
|0ABAC6| dw $0000 ; none
|0ABAC8| dw $0000 ; none
|0ABACA| dw $0001 ; down
|0ABACC| dw $0002 ; right
|0ABACE| dw $FFFF ; up
|0ABAD0| dw $FFFE ; left
|0ABAD2| dw $0001 ; never used, but handles UD
|0ABAD4| dw $0002 ; never used, but handles LR

;===================================================================================================

WorldMap_PanBoundaries:
|0ABAD6| db $00, $00 ; none
|0ABAD8| db $00, $00 ; none
|0ABADA| db $E0, $00 ; down
|0ABADC| db $E0, $01 ; right
|0ABADE| db $B8, $FF ; up
|0ABAE0| db $20, $FF ; left

;===================================================================================================

WorldMapHDMA_ZoomPointers:
|0ABAE2| dw WorldMapHDMA_ZoomedOut
|0ABAE4| dw WorldMapHDMA_ZoomedIn

;===================================================================================================

WorldMap_PlayerControl:
|0ABAE6| LDA.w $0636
|0ABAE9| ASL A
|0ABAEA| BCC .no_zoom_change

|0ABAEC| TAX

|0ABAED| LSR A
|0ABAEE| STA.w $0636

|0ABAF1| LDA.l WorldMapHDMA_ZoomPointers,X
|0ABAF5| STA.w DMA6ADDRL
|0ABAF8| STA.w DMA7ADDRL

.no_zoom_change
|0ABAFB| LDA.w $0636
|0ABAFE| BNE .ignore_change

|0ABB00| LDA.b $F6
|0ABB02| AND.b #$40
|0ABB04| BEQ .ignore_change

|0ABB06| INC.w $0200

|0ABB09| RTL

;---------------------------------------------------------------------------------------------------

.ignore_change
|0ABB0A| LDA.b $B2
|0ABB0C| BEQ .not_switching

|0ABB0E| DEC.b $B2
|0ABB10| JMP.w .continue

;---------------------------------------------------------------------------------------------------

.not_switching
|0ABB13| LDA.b $F6
|0ABB15| AND.b #$70
|0ABB17| BEQ .continue

|0ABB19| LDA.b #$24 ; SFX3.24
|0ABB1B| STA.w $012F

|0ABB1E| LDA.b #$08
|0ABB20| STA.b $B2

|0ABB22| LDA.w $0636
|0ABB25| EOR.b #$01
|0ABB27| TAX

|0ABB28| ORA.b #$80
|0ABB2A| STA.w $0636

|0ABB2D| LDA.l WorldMap_BaseZoom,X
|0ABB31| STA.w $0637

|0ABB34| CMP.b #$0C
|0ABB36| BNE .not_zoomed_in

;---------------------------------------------------------------------------------------------------

.zoomed_in
|0ABB38| REP #$20

|0ABB3A| LDA.l $7EC108

|0ABB3E| LSR A
|0ABB3F| LSR A
|0ABB40| LSR A
|0ABB41| LSR A

|0ABB42| SEC
|0ABB43| SBC.w #$0048
|0ABB46| AND.w #$FFFE
|0ABB49| STA.b $E6

|0ABB4B| CLC
|0ABB4C| ADC.w #$0100
|0ABB4F| STA.w $063A

|0ABB52| LDA.l $7EC10A

|0ABB56| LSR A
|0ABB57| LSR A
|0ABB58| LSR A
|0ABB59| LSR A

|0ABB5A| SEC
|0ABB5B| SBC.w #$0080
|0ABB5E| STA.b $02
|0ABB60| BPL .x_positive_a

|0ABB62| EOR.w #$FFFF
|0ABB65| INC A

.x_positive_a
|0ABB66| STA.b $00

|0ABB68| ASL A
|0ABB69| ASL A

|0ABB6A| CLC
|0ABB6B| ADC.b $00

|0ABB6D| LSR A

|0ABB6E| LDX.b $03
|0ABB70| BPL .x_positive_b

|0ABB72| EOR.w #$FFFF
|0ABB75| INC A

.x_positive_b
|0ABB76| CLC
|0ABB77| ADC.w #$0080
|0ABB7A| BRA .set_scroll

;---------------------------------------------------------------------------------------------------

.not_zoomed_in
|0ABB7C| REP #$21

|0ABB7E| LDA.w #$00C8
|0ABB81| STA.b $E6

|0ABB83| ADC.w #$0100
|0ABB86| STA.w $063A

|0ABB89| LDA.w #$0080

;---------------------------------------------------------------------------------------------------

.set_scroll
|0ABB8C| AND.w #$FFFE
|0ABB8F| STA.b $E0

;---------------------------------------------------------------------------------------------------

.continue
|0ABB91| SEP #$20

|0ABB93| LDA.w $0636
|0ABB96| BEQ .map_zoomed_out

|0ABB98| LDA.b $F0
|0ABB9A| AND.b #$0C
|0ABB9C| TAX

|0ABB9D| REP #$20

|0ABB9F| LDA.b $E6
|0ABBA1| CMP.l WorldMap_PanBoundaries,X
|0ABBA5| BEQ .at_vertical_boundary

|0ABBA7| CLC
|0ABBA8| ADC.l WorldMap_PanMovements,X
|0ABBAC| STA.b $E6

|0ABBAE| CLC
|0ABBAF| ADC.w #$0100
|0ABBB2| STA.w $063A

.at_vertical_boundary
|0ABBB5| SEP #$20

;---------------------------------------------------------------------------------------------------

|0ABBB7| LDA.b $F0
|0ABBB9| AND.b #$03
|0ABBBB| ASL A

|0ABBBC| INC A
|0ABBBD| ASL A
|0ABBBE| TAX

|0ABBBF| REP #$20

|0ABBC1| LDA.b $E0
|0ABBC3| CMP.l WorldMap_PanBoundaries,X
|0ABBC7| BEQ .at_horizontal_boundary

|0ABBC9| CLC
|0ABBCA| ADC.l WorldMap_PanMovements,X
|0ABBCE| STA.b $E0

.at_horizontal_boundary
|0ABBD0| SEP #$20

.map_zoomed_out
|0ABBD2| JSR WorldMap_HandleSprites

;---------------------------------------------------------------------------------------------------

#EXIT_0ABBD5:
|0ABBD5| RTL

;===================================================================================================

WorldMap_RestoreGraphics:
|0ABBD6| DEC.b $13
|0ABBD8| BNE EXIT_0ABBD5

|0ABBDA| JSL EnableForceBlank

|0ABBDE| INC.w $0200

;---------------------------------------------------------------------------------------------------

|0ABBE1| REP #$20

|0ABBE3| LDX.b #$00

.next_color
|0ABBE5| LDA.l $7EC300,X
|0ABBE9| STA.l $7EC500,X

|0ABBED| LDA.l $7EC380,X
|0ABBF1| STA.l $7EC580,X

|0ABBF5| LDA.l $7EC400,X
|0ABBF9| STA.l $7EC600,X

|0ABBFD| LDA.l $7EC480,X
|0ABC01| STA.l $7EC680,X

|0ABC05| INX
|0ABC06| INX
|0ABC07| CPX.b #$80
|0ABC09| BNE .next_color

;---------------------------------------------------------------------------------------------------

|0ABC0B| LDA.l $7EC225
|0ABC0F| STA.b $99

|0ABC11| STZ.b $E4
|0ABC13| STZ.b $EA

|0ABC15| LDA.l $7EC200
|0ABC19| STA.b $E0

|0ABC1B| LDA.l $7EC202
|0ABC1F| STA.b $E2

|0ABC21| LDA.l $7EC204
|0ABC25| STA.b $E6

|0ABC27| LDA.l $7EC206
|0ABC2B| STA.b $E8

|0ABC2D| LDA.l $7EC211
|0ABC31| STA.b $1C

;===================================================================================================

Attract_SetUpConclusionHDMA:
|0ABC33| LDA.w #WorldMapHDMA_AttractMode
|0ABC36| STA.w DMA7ADDRL

|0ABC39| LDX.b #^WorldMapHDMA_AttractMode
|0ABC3B| STX.w DMA7ADDRB

|0ABC3E| LDX.b #$00
|0ABC40| STX.w HDMA7ITBLB

|0ABC43| SEP #$30

|0ABC45| LDA.b #$80
|0ABC47| STA.b $9B

|0ABC49| LDA.b #$09
|0ABC4B| STA.w BGMODE
|0ABC4E| STA.b $94

|0ABC50| STZ.w $0710

|0ABC53| RTL

;===================================================================================================

WorldMap_ExitMap:
|0ABC54| STZ.w $0AA9
|0ABC57| STZ.w $0AB2

|0ABC5A| JSL InitializeTilesets

|0ABC5E| INC.b $15

|0ABC60| STZ.b $B2
|0ABC62| STZ.w $0200
|0ABC65| STZ.b $B0

|0ABC67| LDA.w $010C
|0ABC6A| STA.b $10

|0ABC6C| LDA.b #$20
|0ABC6E| STA.b $11

|0ABC70| STZ.w $1000
|0ABC73| STZ.w $1001

|0ABC76| LDA.l $7EC229
|0ABC7A| STA.b $9B

|0ABC7C| SEP #$20

|0ABC7E| LDX.b $8A

|0ABC80| LDA.l $7F5B00,X
|0ABC84| LSR A
|0ABC85| LSR A
|0ABC86| LSR A
|0ABC87| LSR A
|0ABC88| STA.w $012D

|0ABC8B| LDA.b #$10 ; SFX3.10
|0ABC8D| STA.w $012F

|0ABC90| LDA.b #$F3 ; SONG F3 - max volume
|0ABC92| STA.w $012C

|0ABC95| RTL

;===================================================================================================

WorldMap_SetUpHDMA:
|0ABC96| REP #$20

|0ABC98| LDA.w #$0080
|0ABC9B| STA.b $E0

|0ABC9D| LDA.w #$00C8
|0ABCA0| STA.b $E6

|0ABCA2| ADC.w #$0100
|0ABCA5| STA.w $063A

|0ABCA8| LDA.w #$0100
|0ABCAB| STA.w $0638

|0ABCAE| LDA.w #$1B42
|0ABCB1| STA.w DMA6MODE

|0ABCB4| LDA.w #$1E42
|0ABCB7| STA.w DMA7MODE

;---------------------------------------------------------------------------------------------------

|0ABCBA| SEP #$20

|0ABCBC| STZ.b $96
|0ABCBE| STZ.b $97
|0ABCC0| STZ.b $98
|0ABCC2| STZ.b $1E
|0ABCC4| STZ.b $1F

|0ABCC6| STZ.w M7B
|0ABCC9| STZ.w M7B
|0ABCCC| STZ.w M7C
|0ABCCF| STZ.w M7C

|0ABCD2| STZ.w M7X
|0ABCD5| LDA.b #$01
|0ABCD7| STA.w M7X

|0ABCDA| STZ.w M7Y
|0ABCDD| STA.w M7Y

;---------------------------------------------------------------------------------------------------

|0ABCE0| LDA.b $10
|0ABCE2| CMP.b #$14
|0ABCE4| BEQ .attract_mode

|0ABCE6| LDA.b $11
|0ABCE8| CMP.b #$0A
|0ABCEA| BNE .not_flute_map

|0ABCEC| JMP.w .flute_map

;---------------------------------------------------------------------------------------------------

.not_flute_map
|0ABCEF| LDA.b #$04
|0ABCF1| STA.w $0635

|0ABCF4| LDA.b #$0C
|0ABCF6| STA.w $0637

|0ABCF9| LDA.b #$01
|0ABCFB| STA.w $0636

|0ABCFE| REP #$21

|0ABD00| LDA.l $7EC108

|0ABD04| LSR A
|0ABD05| LSR A
|0ABD06| LSR A
|0ABD07| LSR A

|0ABD08| SEC
|0ABD09| SBC.w #$0048

|0ABD0C| AND.w #$FFFE
|0ABD0F| CLC
|0ABD10| ADC.l WorldMap_PanMovements
|0ABD14| STA.b $E6

|0ABD16| CLC
|0ABD17| ADC.w #$0100
|0ABD1A| STA.w $063A

;---------------------------------------------------------------------------------------------------

|0ABD1D| LDA.l $7EC10A

|0ABD21| LSR A
|0ABD22| LSR A
|0ABD23| LSR A
|0ABD24| LSR A

|0ABD25| SEC
|0ABD26| SBC.w #$0080
|0ABD29| STA.b $02
|0ABD2B| BPL .x_positive_a

|0ABD2D| EOR.w #$FFFF
|0ABD30| INC A

.x_positive_a
|0ABD31| STA.b $00

|0ABD33| ASL A
|0ABD34| ASL A
|0ABD35| CLC
|0ABD36| ADC.b $00

|0ABD38| LSR A
|0ABD39| LDX.b $03
|0ABD3B| BPL .x_positive_b

|0ABD3D| EOR.w #$FFFF
|0ABD40| INC A

.x_positive_b
|0ABD41| CLC
|0ABD42| ADC.w #$0080
|0ABD45| AND.w #$FFFE
|0ABD48| STA.b $E0

;---------------------------------------------------------------------------------------------------

.normal_map
|0ABD4A| LDA.w #WorldMapHDMA_ZoomedIn
|0ABD4D| STA.w DMA6ADDRL
|0ABD50| STA.w DMA7ADDRL

|0ABD53| LDX.b #^WorldMapHDMA_ZoomedIn
|0ABD55| STX.w DMA6ADDRB
|0ABD58| STX.w DMA7ADDRB

|0ABD5B| LDX.b #^WorldMapHDMA_ZoomedIn
|0ABD5D| BRA .continue

;---------------------------------------------------------------------------------------------------

.attract_mode
|0ABD5F| REP #$21

|0ABD61| LDA.w #WorldMapHDMA_AttractMode
|0ABD64| STA.w DMA6ADDRL
|0ABD67| STA.w DMA7ADDRL

|0ABD6A| LDX.b #^WorldMapHDMA_AttractMode
|0ABD6C| STX.w DMA6ADDRB
|0ABD6F| STX.w DMA7ADDRB

|0ABD72| LDX.b #$00
|0ABD74| BRA .continue

;---------------------------------------------------------------------------------------------------

.flute_map
|0ABD76| LDA.b #$04
|0ABD78| STA.w $0635

|0ABD7B| LDA.b #$21
|0ABD7D| STA.w $0637
|0ABD80| STZ.w $0636

|0ABD83| REP #$21

|0ABD85| LDA.w #WorldMapHDMA_ZoomedOut
|0ABD88| STA.w DMA6ADDRL
|0ABD8B| STA.w DMA7ADDRL

|0ABD8E| LDX.b #^WorldMapHDMA_ZoomedOut
|0ABD90| STX.w DMA6ADDRB
|0ABD93| STX.w DMA7ADDRB

|0ABD96| LDX.b #^WorldMapHDMA_ZoomedOut

;---------------------------------------------------------------------------------------------------

.continue
|0ABD98| STX.w HDMA6ITBLB
|0ABD9B| STX.w HDMA7ITBLB

|0ABD9E| SEP #$20

|0ABDA0| LDA.b #$C0
|0ABDA2| STA.b $9B

|0ABDA4| RTS

;===================================================================================================

WorldMap_FillTilemapWithEF:
|0ABDA5| REP #$20

|0ABDA7| LDA.w #$00EF
|0ABDAA| STA.b $00

|0ABDAC| STZ.w VMAIN
|0ABDAF| STZ.w VMADDR ; VRAM $0000

|0ABDB2| LDA.w #$1808
|0ABDB5| STA.w DMA1MODE
|0ABDB8| STZ.w DMA1ADDRB

|0ABDBB| LDA.w #$0000
|0ABDBE| STA.w DMA1ADDRL

|0ABDC1| LDA.w #$4000
|0ABDC4| STA.w DMA1SIZE

|0ABDC7| LDY.b #$02
|0ABDC9| STY.w MDMAEN

|0ABDCC| SEP #$20

|0ABDCE| RTS

;===================================================================================================

WorldMapHDMA_ZoomedOut:
|0ABDCF| db $F0 : dw WorldMapHDMA_ZoomedOut_Part1 ; 112 lines, continuous
|0ABDD2| db $F0 : dw WorldMapHDMA_ZoomedOut_Part2 ; 112 lines, continuous
|0ABDD5| db $00 ; end

;===================================================================================================

WorldMapHDMA_ZoomedIn:
|0ABDD6| db $F0 : dw WorldMapHDMA_ZoomedIn_Part1 ; 112 lines, continuous
|0ABDD9| db $F0 : dw WorldMapHDMA_ZoomedIn_Part2 ; 112 lines, continuous
|0ABDDC| db $00 ; end

;===================================================================================================

WorldMapHDMA_AttractMode:
|0ABDDD| db $F0 : dw $1B00 ; 112 lines, continuous
|0ABDE0| db $F0 : dw $1BE0 ; 112 lines, continuous
|0ABDE3| db $00 ; end

;===================================================================================================

WorldMapIcon_posx_spr0:
|0ABDE4| dw $07FF ; 0x00
|0ABDE6| dw $02C0 ; 0x01
|0ABDE8| dw $0D00 ; 0x02
|0ABDEA| dw $0F31 ; 0x03
|0ABDEC| dw $006D ; 0x04
|0ABDEE| dw $07E0 ; 0x05
|0ABDF0| dw $0F40 ; 0x06
|0ABDF2| dw $0F40 ; 0x07
|0ABDF4| dw $08DC ; 0x08

WorldMapIcon_posy_spr0:
|0ABDF6| dw $0730 ; 0x00
|0ABDF8| dw $06A0 ; 0x01
|0ABDFA| dw $0710 ; 0x02
|0ABDFC| dw $0620 ; 0x03
|0ABDFE| dw $0070 ; 0x04
|0ABE00| dw $0640 ; 0x05
|0ABE02| dw $0620 ; 0x06
|0ABE04| dw $0620 ; 0x07
|0ABE06| dw $0030 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_posx_spr1:
|0ABE08| dw $FF00 ; 0x00
|0ABE0A| dw $FF00 ; 0x01
|0ABE0C| dw $FF00 ; 0x02
|0ABE0E| dw $08D0 ; 0x03
|0ABE10| dw $FF00 ; 0x04
|0ABE12| dw $FF00 ; 0x05
|0ABE14| dw $FF00 ; 0x06
|0ABE16| dw $0082 ; 0x07
|0ABE18| dw $FF00 ; 0x08

WorldMapIcon_posy_spr1:
|0ABE1A| dw $FF00 ; 0x00
|0ABE1C| dw $FF00 ; 0x01
|0ABE1E| dw $FF00 ; 0x02
|0ABE20| dw $0080 ; 0x03
|0ABE22| dw $FF00 ; 0x04
|0ABE24| dw $FF00 ; 0x05
|0ABE26| dw $FF00 ; 0x06
|0ABE28| dw $00B0 ; 0x07
|0ABE2A| dw $FF00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_posx_spr2:
|0ABE2C| dw $FF00 ; 0x00
|0ABE2E| dw $FF00 ; 0x01
|0ABE30| dw $FF00 ; 0x02
|0ABE32| dw $0108 ; 0x03
|0ABE34| dw $FF00 ; 0x04
|0ABE36| dw $FF00 ; 0x05
|0ABE38| dw $FF00 ; 0x06
|0ABE3A| dw $0F11 ; 0x07
|0ABE3C| dw $FF00 ; 0x08

WorldMapIcon_posy_spr2:
|0ABE3E| dw $FF00 ; 0x00
|0ABE40| dw $FF00 ; 0x01
|0ABE42| dw $FF00 ; 0x02
|0ABE44| dw $0D70 ; 0x03
|0ABE46| dw $FF00 ; 0x04
|0ABE48| dw $FF00 ; 0x05
|0ABE4A| dw $FF00 ; 0x06
|0ABE4C| dw $0103 ; 0x07
|0ABE4E| dw $FF00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_posx_spr3:
|0ABE50| dw $FF00 ; 0x00
|0ABE52| dw $FF00 ; 0x01
|0ABE54| dw $FF00 ; 0x02
|0ABE56| dw $006D ; 0x03
|0ABE58| dw $FF00 ; 0x04
|0ABE5A| dw $FF00 ; 0x05
|0ABE5C| dw $FF00 ; 0x06
|0ABE5E| dw $01D0 ; 0x07
|0ABE60| dw $FF00 ; 0x08

WorldMapIcon_posy_spr3:
|0ABE62| dw $FF00 ; 0x00
|0ABE64| dw $FF00 ; 0x01
|0ABE66| dw $FF00 ; 0x02
|0ABE68| dw $0070 ; 0x03
|0ABE6A| dw $FF00 ; 0x04
|0ABE6C| dw $FF00 ; 0x05
|0ABE6E| dw $FF00 ; 0x06
|0ABE70| dw $0780 ; 0x07
|0ABE72| dw $FF00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_posx_spr4:
|0ABE74| dw $FF00 ; 0x00
|0ABE76| dw $FF00 ; 0x01
|0ABE78| dw $FF00 ; 0x02
|0ABE7A| dw $FF00 ; 0x03
|0ABE7C| dw $FF00 ; 0x04
|0ABE7E| dw $FF00 ; 0x05
|0ABE80| dw $FF00 ; 0x06
|0ABE82| dw $0100 ; 0x07
|0ABE84| dw $FF00 ; 0x08

WorldMapIcon_posy_spr4:
|0ABE86| dw $FF00 ; 0x00
|0ABE88| dw $FF00 ; 0x01
|0ABE8A| dw $FF00 ; 0x02
|0ABE8C| dw $FF00 ; 0x03
|0ABE8E| dw $FF00 ; 0x04
|0ABE90| dw $FF00 ; 0x05
|0ABE92| dw $FF00 ; 0x06
|0ABE94| dw $0CA0 ; 0x07
|0ABE96| dw $FF00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_posx_spr5:
|0ABE98| dw $FF00 ; 0x00
|0ABE9A| dw $FF00 ; 0x01
|0ABE9C| dw $FF00 ; 0x02
|0ABE9E| dw $FF00 ; 0x03
|0ABEA0| dw $FF00 ; 0x04
|0ABEA2| dw $FF00 ; 0x05
|0ABEA4| dw $FF00 ; 0x06
|0ABEA6| dw $0CA0 ; 0x07
|0ABEA8| dw $FF00 ; 0x08

WorldMapIcon_posy_spr5:
|0ABEAA| dw $FF00 ; 0x00
|0ABEAC| dw $FF00 ; 0x01
|0ABEAE| dw $FF00 ; 0x02
|0ABEB0| dw $FF00 ; 0x03
|0ABEB2| dw $FF00 ; 0x04
|0ABEB4| dw $FF00 ; 0x05
|0ABEB6| dw $FF00 ; 0x06
|0ABEB8| dw $0DA0 ; 0x07
|0ABEBA| dw $FF00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_posx_spr6:
|0ABEBC| dw $FF00 ; 0x00
|0ABEBE| dw $FF00 ; 0x01
|0ABEC0| dw $FF00 ; 0x02
|0ABEC2| dw $FF00 ; 0x03
|0ABEC4| dw $FF00 ; 0x04
|0ABEC6| dw $FF00 ; 0x05
|0ABEC8| dw $FF00 ; 0x06
|0ABECA| dw $0759 ; 0x07
|0ABECC| dw $FF00 ; 0x08

WorldMapIcon_posy_spr6:
|0ABECE| dw $FF00 ; 0x00
|0ABED0| dw $FF00 ; 0x01
|0ABED2| dw $FF00 ; 0x02
|0ABED4| dw $FF00 ; 0x03
|0ABED6| dw $FF00 ; 0x04
|0ABED8| dw $FF00 ; 0x05
|0ABEDA| dw $FF00 ; 0x06
|0ABEDC| dw $0ED0 ; 0x07
|0ABEDE| dw $FF00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_tile_spr0:
|0ABEE0| db $00, $00 ; 0x00
|0ABEE2| db $00, $00 ; 0x01
|0ABEE4| db $00, $00 ; 0x02
|0ABEE6| db $38, $60 ; 0x03
|0ABEE8| db $34, $62 ; 0x04
|0ABEEA| db $32, $66 ; 0x05
|0ABEEC| db $34, $64 ; 0x06
|0ABEEE| db $34, $64 ; 0x07
|0ABEF0| db $32, $66 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_tile_spr1:
|0ABEF2| db $00, $00 ; 0x00
|0ABEF4| db $00, $00 ; 0x01
|0ABEF6| db $00, $00 ; 0x02
|0ABEF8| db $32, $60 ; 0x03
|0ABEFA| db $00, $00 ; 0x04
|0ABEFC| db $00, $00 ; 0x05
|0ABEFE| db $00, $00 ; 0x06
|0ABF00| db $34, $64 ; 0x07
|0ABF02| db $00, $00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_tile_spr2:
|0ABF04| db $00, $00 ; 0x00
|0ABF06| db $00, $00 ; 0x01
|0ABF08| db $00, $00 ; 0x02
|0ABF0A| db $34, $60 ; 0x03
|0ABF0C| db $00, $00 ; 0x04
|0ABF0E| db $00, $00 ; 0x05
|0ABF10| db $00, $00 ; 0x06
|0ABF12| db $34, $64 ; 0x07
|0ABF14| db $00, $00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_tile_spr3:
|0ABF16| db $00, $00 ; 0x00
|0ABF18| db $00, $00 ; 0x01
|0ABF1A| db $00, $00 ; 0x02
|0ABF1C| db $34, $62 ; 0x03
|0ABF1E| db $00, $00 ; 0x04
|0ABF20| db $00, $00 ; 0x05
|0ABF22| db $00, $00 ; 0x06
|0ABF24| db $34, $64 ; 0x07
|0ABF26| db $00, $00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_tile_spr4:
|0ABF28| db $00, $00 ; 0x00
|0ABF2A| db $00, $00 ; 0x01
|0ABF2C| db $00, $00 ; 0x02
|0ABF2E| db $00, $00 ; 0x03
|0ABF30| db $00, $00 ; 0x04
|0ABF32| db $00, $00 ; 0x05
|0ABF34| db $00, $00 ; 0x06
|0ABF36| db $34, $64 ; 0x07
|0ABF38| db $00, $00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_tile_spr5:
|0ABF3A| db $00, $00 ; 0x00
|0ABF3C| db $00, $00 ; 0x01
|0ABF3E| db $00, $00 ; 0x02
|0ABF40| db $00, $00 ; 0x03
|0ABF42| db $00, $00 ; 0x04
|0ABF44| db $00, $00 ; 0x05
|0ABF46| db $00, $00 ; 0x06
|0ABF48| db $34, $64 ; 0x07
|0ABF4A| db $00, $00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_tile_spr6:
|0ABF4C| db $00, $00 ; 0x00
|0ABF4E| db $00, $00 ; 0x01
|0ABF50| db $00, $00 ; 0x02
|0ABF52| db $00, $00 ; 0x03
|0ABF54| db $00, $00 ; 0x04
|0ABF56| db $00, $00 ; 0x05
|0ABF58| db $00, $00 ; 0x06
|0ABF5A| db $34, $64 ; 0x07
|0ABF5C| db $00, $00 ; 0x08

;===================================================================================================

WorldMap_RedXChars:
|0ABF5E| db $68, $69, $78, $69

;===================================================================================================

WorldMap_PortalProps:
|0ABF62| db $34, $74, $F4, $B4

;===================================================================================================

WorldMap_HandleSprites:
|0ABF66| LDA.b $1A
|0ABF68| AND.b #$10
|0ABF6A| BEQ .dont_draw_link

|0ABF6C| JSR WorldMap_CalculateOAMCoordinates
|0ABF6F| BCC .dont_draw_link

;---------------------------------------------------------------------------------------------------

|0ABF71| LDA.b $0E
|0ABF73| SEC
|0ABF74| SBC.b #$04
|0ABF76| STA.b $0E

|0ABF78| LDA.b $0F
|0ABF7A| SEC
|0ABF7B| SBC.b #$04
|0ABF7D| STA.b $0F

|0ABF7F| LDA.b #$00
|0ABF81| STA.b $0D

|0ABF83| LDA.b #$3E
|0ABF85| STA.b $0C

|0ABF87| LDA.b #$02
|0ABF89| STA.b $0B

|0ABF8B| LDX.b #$00
|0ABF8D| JSR WorldMap_HandleSpriteBlink

;---------------------------------------------------------------------------------------------------

.dont_draw_link
|0ABF90| LDA.l $7EC108
|0ABF94| PHA

|0ABF95| LDA.l $7EC109
|0ABF99| PHA

|0ABF9A| LDA.l $7EC10A
|0ABF9E| PHA

|0ABF9F| LDA.l $7EC10B
|0ABFA3| PHA

;---------------------------------------------------------------------------------------------------

|0ABFA4| LDA.w $008A
|0ABFA7| CMP.b #$40
|0ABFA9| BCS .dont_draw_mirror_portal

|0ABFAB| LDX.b #$0F

|0ABFAD| LDA.w $1AB0,X
|0ABFB0| ORA.w $1AC0,X
|0ABFB3| ORA.w $1AD0,X
|0ABFB6| ORA.w $1AE0,X
|0ABFB9| BEQ .dont_draw_mirror_portal

|0ABFBB| LDA.b $1A
|0ABFBD| BNE .dont_swap_portal_char

|0ABFBF| LDA.w $1AF0,X
|0ABFC2| INC A
|0ABFC3| STA.w $1AF0,X

.dont_swap_portal_char
|0ABFC6| LDA.w $1AB0,X
|0ABFC9| STA.l $7EC10A

|0ABFCD| LDA.w $1AC0,X
|0ABFD0| STA.l $7EC10B

|0ABFD4| LDA.w $1AD0,X
|0ABFD7| STA.l $7EC108

|0ABFDB| LDA.w $1AE0,X
|0ABFDE| STA.l $7EC109

|0ABFE2| JSR WorldMap_CalculateOAMCoordinates
|0ABFE5| BCC .dont_draw_mirror_portal

|0ABFE7| LDA.b #$6A
|0ABFE9| STA.b $0D

|0ABFEB| LDA.b $1A
|0ABFED| LSR A
|0ABFEE| AND.b #$03
|0ABFF0| TAX

|0ABFF1| LDA.l WorldMap_PortalProps,X
|0ABFF5| STA.b $0C

|0ABFF7| LDA.b #$02
|0ABFF9| STA.b $0B

|0ABFFB| LDX.b #$0F
|0ABFFD| JSR WorldMap_HandleSpriteBlink

;---------------------------------------------------------------------------------------------------

.dont_draw_mirror_portal
|0AC000| LDA.l $7EF2DB
|0AC004| AND.b #$20
|0AC006| BNE .pyramid_open

|0AC008| LDA.l $7EF3C7
|0AC00C| CMP.b #$06

|0AC00E| ROL A
|0AC00F| EOR.w $0FFF
|0AC012| AND.b #$01
|0AC014| BEQ .draw_prizes

.pyramid_open
|0AC016| JMP.w .restore_coords_and_exit

;---------------------------------------------------------------------------------------------------

.draw_prizes
|0AC019| LDX.b #$00
|0AC01B| JSR OverworldMap_CheckForPendant
|0AC01E| BCS .skip_draw_0

|0AC020| JSR OverworldMap_CheckForCrystal
|0AC023| BCS .skip_draw_0

|0AC025| LDA.l $7EF3C7
|0AC029| ASL A
|0AC02A| TAX

|0AC02B| LDA.l WorldMapIcon_posx_spr0+1,X
|0AC02F| BMI .skip_draw_0

|0AC031| STA.l $7EC10B

|0AC035| LDA.l WorldMapIcon_posx_spr0+0,X
|0AC039| STA.l $7EC10A

|0AC03D| LDA.l WorldMapIcon_posy_spr0+1,X
|0AC041| STA.l $7EC109

|0AC045| LDA.l WorldMapIcon_posy_spr0+0,X
|0AC049| STA.l $7EC108

;---------------------------------------------------------------------------------------------------

|0AC04D| LDA.l WorldMapIcon_tile_spr0+1,X
|0AC051| BEQ .dont_adjust_0

|0AC053| CMP.b #$64
|0AC055| BEQ .is_crystal_1

|0AC057| LDA.b $1A
|0AC059| AND.b #$10
|0AC05B| BNE .skip_draw_0

.is_crystal_1
|0AC05D| JSR WorldMapIcon_AdjustCoordinate

;---------------------------------------------------------------------------------------------------

.dont_adjust_0
|0AC060| LDX.b #$0E
|0AC062| JSR WorldMap_CalculateOAMCoordinates
|0AC065| BCC .skip_draw_0

|0AC067| LDA.l $7EF3C7
|0AC06B| ASL A
|0AC06C| TAX

|0AC06D| LDA.l WorldMapIcon_tile_spr0+1,X
|0AC071| BEQ .is_red_x_0

|0AC073| STA.b $0D

|0AC075| LDA.l WorldMapIcon_tile_spr0+0,X
|0AC079| STA.b $0C

|0AC07B| LDA.b #$02
|0AC07D| BRA .continue_0

;---------------------------------------------------------------------------------------------------

.is_red_x_0
|0AC07F| LDA.b $1A

|0AC081| LSR A
|0AC082| LSR A
|0AC083| LSR A

|0AC084| AND.b #$03
|0AC086| TAX

|0AC087| LDA.l WorldMap_RedXChars,X
|0AC08B| STA.b $0D

|0AC08D| LDA.b #$32
|0AC08F| STA.b $0C

|0AC091| LDA.b #$00

;---------------------------------------------------------------------------------------------------

.continue_0
|0AC093| STA.b $0B

|0AC095| LDX.b #$0E
|0AC097| JSR WorldMap_HandleSpriteBlink

;===================================================================================================

.skip_draw_0
|0AC09A| LDX.b #$01
|0AC09C| JSR OverworldMap_CheckForPendant
|0AC09F| BCS .skip_draw_1

|0AC0A1| JSR OverworldMap_CheckForCrystal
|0AC0A4| BCS .skip_draw_1

|0AC0A6| LDA.l $7EF3C7
|0AC0AA| ASL A
|0AC0AB| TAX

|0AC0AC| LDA.l WorldMapIcon_posx_spr1+1,X
|0AC0B0| BMI .skip_draw_1

|0AC0B2| STA.l $7EC10B

|0AC0B6| LDA.l WorldMapIcon_posx_spr1+0,X
|0AC0BA| STA.l $7EC10A

|0AC0BE| LDA.l WorldMapIcon_posy_spr1+1,X
|0AC0C2| STA.l $7EC109

|0AC0C6| LDA.l WorldMapIcon_posy_spr1+0,X
|0AC0CA| STA.l $7EC108

;---------------------------------------------------------------------------------------------------

|0AC0CE| LDA.l WorldMapIcon_tile_spr1+1,X
|0AC0D2| BEQ .dont_adjust_1

|0AC0D4| CMP.b #$64
|0AC0D6| BEQ .is_crystal_3

|0AC0D8| LDA.b $1A
|0AC0DA| AND.b #$10
|0AC0DC| BNE .skip_draw_1

.is_crystal_3
|0AC0DE| JSR WorldMapIcon_AdjustCoordinate

;---------------------------------------------------------------------------------------------------

.dont_adjust_1
|0AC0E1| JSR WorldMap_CalculateOAMCoordinates
|0AC0E4| BCC .skip_draw_1

|0AC0E6| LDA.l $7EF3C7
|0AC0EA| ASL A
|0AC0EB| TAX

|0AC0EC| LDA.l WorldMapIcon_tile_spr1+1,X
|0AC0F0| BEQ .is_red_x_1

|0AC0F2| STA.b $0D

|0AC0F4| LDA.l WorldMapIcon_tile_spr1+0,X
|0AC0F8| STA.b $0C

|0AC0FA| LDA.b #$02
|0AC0FC| BRA .continue_1

;---------------------------------------------------------------------------------------------------

.is_red_x_1
|0AC0FE| LDA.b $1A

|0AC100| LSR A
|0AC101| LSR A
|0AC102| LSR A

|0AC103| AND.b #$03
|0AC105| TAX

|0AC106| LDA.l WorldMap_RedXChars,X
|0AC10A| STA.b $0D

|0AC10C| LDA.b #$32
|0AC10E| STA.b $0C

|0AC110| LDA.b #$00

;---------------------------------------------------------------------------------------------------

.continue_1
|0AC112| STA.b $0B

|0AC114| LDX.b #$0D
|0AC116| JSR WorldMap_HandleSpriteBlink

;===================================================================================================

.skip_draw_1
|0AC119| LDX.b #$02
|0AC11B| JSR OverworldMap_CheckForPendant
|0AC11E| BCS .skip_draw_2

|0AC120| JSR OverworldMap_CheckForCrystal
|0AC123| BCS .skip_draw_2

|0AC125| LDA.l $7EF3C7
|0AC129| ASL A
|0AC12A| TAX

|0AC12B| LDA.l WorldMapIcon_posx_spr2+1,X
|0AC12F| BMI .skip_draw_2

|0AC131| STA.l $7EC10B

|0AC135| LDA.l WorldMapIcon_posx_spr2+0,X
|0AC139| STA.l $7EC10A

|0AC13D| LDA.l WorldMapIcon_posy_spr2+1,X
|0AC141| STA.l $7EC109

|0AC145| LDA.l WorldMapIcon_posy_spr2+0,X
|0AC149| STA.l $7EC108

;---------------------------------------------------------------------------------------------------

|0AC14D| LDA.l WorldMapIcon_tile_spr2+1,X
|0AC151| BEQ .dont_adjust_2

|0AC153| CMP.b #$64
|0AC155| BEQ .is_crystal_7

|0AC157| LDA.b $1A
|0AC159| AND.b #$10
|0AC15B| BNE .skip_draw_2

.is_crystal_7
|0AC15D| JSR WorldMapIcon_AdjustCoordinate

;---------------------------------------------------------------------------------------------------

.dont_adjust_2
|0AC160| LDX.b #$0C
|0AC162| JSR WorldMap_CalculateOAMCoordinates
|0AC165| BCC .skip_draw_2

|0AC167| LDA.l $7EF3C7
|0AC16B| ASL A
|0AC16C| TAX

|0AC16D| LDA.l WorldMapIcon_tile_spr2+1,X
|0AC171| BEQ .is_red_x_2

|0AC173| STA.b $0D

|0AC175| LDA.l WorldMapIcon_tile_spr2+0,X
|0AC179| STA.b $0C

|0AC17B| LDA.b #$02
|0AC17D| BRA .continue_2

;---------------------------------------------------------------------------------------------------

.is_red_x_2
|0AC17F| LDA.b $1A

|0AC181| LSR A
|0AC182| LSR A
|0AC183| LSR A

|0AC184| AND.b #$03
|0AC186| TAX

|0AC187| LDA.l WorldMap_RedXChars,X
|0AC18B| STA.b $0D

|0AC18D| LDA.b #$32
|0AC18F| STA.b $0C

|0AC191| LDA.b #$00

;---------------------------------------------------------------------------------------------------

.continue_2
|0AC193| STA.b $0B

|0AC195| LDX.b #$0C
|0AC197| JSR WorldMap_HandleSpriteBlink

;===================================================================================================

.skip_draw_2
|0AC19A| LDX.b #$03
|0AC19C| JSR OverworldMap_CheckForCrystal
|0AC19F| BCS .skip_draw_3

|0AC1A1| LDA.l $7EF3C7
|0AC1A5| ASL A
|0AC1A6| TAX

|0AC1A7| LDA.l WorldMapIcon_posx_spr3+1,X
|0AC1AB| BMI .skip_draw_3

|0AC1AD| STA.l $7EC10B

|0AC1B1| LDA.l WorldMapIcon_posx_spr3+0,X
|0AC1B5| STA.l $7EC10A

|0AC1B9| LDA.l WorldMapIcon_posy_spr3+1,X
|0AC1BD| STA.l $7EC109

|0AC1C1| LDA.l WorldMapIcon_posy_spr3+0,X
|0AC1C5| STA.l $7EC108

;---------------------------------------------------------------------------------------------------

|0AC1C9| LDA.l WorldMapIcon_tile_spr3+1,X
|0AC1CD| BEQ .dont_adjust_3

|0AC1CF| CMP.b #$64
|0AC1D1| BEQ .is_crystal_4

|0AC1D3| LDA.b $1A
|0AC1D5| AND.b #$10
|0AC1D7| BNE .skip_draw_3

.is_crystal_4
|0AC1D9| JSR WorldMapIcon_AdjustCoordinate

;---------------------------------------------------------------------------------------------------

.dont_adjust_3
|0AC1DC| LDX.b #$0B
|0AC1DE| JSR WorldMap_CalculateOAMCoordinates
|0AC1E1| BCC .skip_draw_3

|0AC1E3| LDA.l $7EF3C7
|0AC1E7| ASL A
|0AC1E8| TAX

|0AC1E9| LDA.l WorldMapIcon_tile_spr3+1,X
|0AC1ED| BEQ .is_red_x_3

|0AC1EF| STA.b $0D

|0AC1F1| LDA.l WorldMapIcon_tile_spr3+0,X
|0AC1F5| STA.b $0C

|0AC1F7| LDA.b #$02
|0AC1F9| BRA .continue_3

;---------------------------------------------------------------------------------------------------

.is_red_x_3
|0AC1FB| LDA.b $1A

|0AC1FD| LSR A
|0AC1FE| LSR A
|0AC1FF| LSR A

|0AC200| AND.b #$03
|0AC202| TAX

|0AC203| LDA.l WorldMap_RedXChars,X
|0AC207| STA.b $0D

|0AC209| LDA.b #$32
|0AC20B| STA.b $0C

|0AC20D| LDA.b #$00

;---------------------------------------------------------------------------------------------------

.continue_3
|0AC20F| STA.b $0B

|0AC211| LDX.b #$0B
|0AC213| JSR WorldMap_HandleSpriteBlink

;---------------------------------------------------------------------------------------------------

.skip_draw_3
|0AC216| LDX.b #$04
|0AC218| JSR OverworldMap_CheckForCrystal
|0AC21B| BCS .skip_draw_4

|0AC21D| LDA.l $7EF3C7
|0AC221| ASL A
|0AC222| TAX

|0AC223| LDA.l WorldMapIcon_posx_spr4+1,X
|0AC227| BMI .skip_draw_4

|0AC229| STA.l $7EC10B

|0AC22D| LDA.l WorldMapIcon_posx_spr4+0,X
|0AC231| STA.l $7EC10A

|0AC235| LDA.l WorldMapIcon_posy_spr4+1,X
|0AC239| STA.l $7EC109

|0AC23D| LDA.l WorldMapIcon_posy_spr4+0,X
|0AC241| STA.l $7EC108

;---------------------------------------------------------------------------------------------------

|0AC245| LDA.l WorldMapIcon_tile_spr4+1,X
|0AC249| BEQ .dont_adjust_4

|0AC24B| CMP.b #$64
|0AC24D| BEQ .is_crystal_6

|0AC24F| LDA.b $1A
|0AC251| AND.b #$10
|0AC253| BNE .skip_draw_4

.is_crystal_6
|0AC255| JSR WorldMapIcon_AdjustCoordinate

;---------------------------------------------------------------------------------------------------

.dont_adjust_4
|0AC258| LDX.b #$0A
|0AC25A| JSR WorldMap_CalculateOAMCoordinates
|0AC25D| BCC .skip_draw_4

|0AC25F| LDA.l $7EF3C7
|0AC263| ASL A
|0AC264| TAX

|0AC265| LDA.l WorldMapIcon_tile_spr4+1,X
|0AC269| BEQ .is_red_x_4

|0AC26B| STA.b $0D

|0AC26D| LDA.l WorldMapIcon_tile_spr4+0,X
|0AC271| STA.b $0C

|0AC273| LDA.b #$02
|0AC275| BRA .continue_4

.is_red_x_4
|0AC277| LDA.b $1A

|0AC279| LSR A
|0AC27A| LSR A
|0AC27B| LSR A

|0AC27C| AND.b #$03
|0AC27E| TAX

|0AC27F| LDA.l WorldMap_RedXChars,X
|0AC283| STA.b $0D

|0AC285| LDA.b #$32
|0AC287| STA.b $0C

|0AC289| LDA.b #$00

;---------------------------------------------------------------------------------------------------

.continue_4
|0AC28B| STA.b $0B

|0AC28D| LDX.b #$0A
|0AC28F| JSR WorldMap_HandleSpriteBlink

;---------------------------------------------------------------------------------------------------

.skip_draw_4
|0AC292| LDX.b #$05
|0AC294| JSR OverworldMap_CheckForCrystal
|0AC297| BCS .skip_draw_5

|0AC299| LDA.l $7EF3C7
|0AC29D| ASL A
|0AC29E| TAX

|0AC29F| LDA.l WorldMapIcon_posx_spr5+1,X
|0AC2A3| BMI .skip_draw_5

|0AC2A5| STA.l $7EC10B

|0AC2A9| LDA.l WorldMapIcon_posx_spr5+0,X
|0AC2AD| STA.l $7EC10A

|0AC2B1| LDA.l WorldMapIcon_posy_spr5+1,X
|0AC2B5| STA.l $7EC109

|0AC2B9| LDA.l WorldMapIcon_posy_spr5+0,X
|0AC2BD| STA.l $7EC108

;---------------------------------------------------------------------------------------------------

|0AC2C1| LDA.l WorldMapIcon_tile_spr5+1,X
|0AC2C5| BEQ .dont_adjust_5

|0AC2C7| CMP.b #$64
|0AC2C9| BEQ .is_crystal_5

|0AC2CB| LDA.b $1A
|0AC2CD| AND.b #$10
|0AC2CF| BNE .skip_draw_5

.is_crystal_5
|0AC2D1| JSR WorldMapIcon_AdjustCoordinate

;---------------------------------------------------------------------------------------------------

.dont_adjust_5
|0AC2D4| LDX.b #$09

|0AC2D6| JSR WorldMap_CalculateOAMCoordinates
|0AC2D9| BCC .skip_draw_5

|0AC2DB| LDA.l $7EF3C7
|0AC2DF| ASL A
|0AC2E0| TAX

|0AC2E1| LDA.l WorldMapIcon_tile_spr5+1,X
|0AC2E5| BEQ .is_red_x_5

|0AC2E7| STA.b $0D

|0AC2E9| LDA.l WorldMapIcon_tile_spr5+0,X
|0AC2ED| STA.b $0C

|0AC2EF| LDA.b #$02
|0AC2F1| BRA .continue_5

;---------------------------------------------------------------------------------------------------

.is_red_x_5
|0AC2F3| LDA.b $1A
|0AC2F5| LSR A
|0AC2F6| LSR A
|0AC2F7| LSR A

|0AC2F8| AND.b #$03
|0AC2FA| TAX

|0AC2FB| LDA.l WorldMap_RedXChars,X
|0AC2FF| STA.b $0D

|0AC301| LDA.b #$32
|0AC303| STA.b $0C

|0AC305| LDA.b #$00

;---------------------------------------------------------------------------------------------------

.continue_5
|0AC307| STA.b $0B

|0AC309| LDX.b #$09
|0AC30B| JSR WorldMap_HandleSpriteBlink

;---------------------------------------------------------------------------------------------------

.skip_draw_5
|0AC30E| LDX.b #$06
|0AC310| JSR OverworldMap_CheckForCrystal
|0AC313| BCS .restore_coords_and_exit

|0AC315| LDA.l $7EF3C7
|0AC319| ASL A
|0AC31A| TAX

|0AC31B| LDA.l WorldMapIcon_posx_spr6+1,X
|0AC31F| BMI .restore_coords_and_exit

|0AC321| STA.l $7EC10B

|0AC325| LDA.l WorldMapIcon_posx_spr6+0,X
|0AC329| STA.l $7EC10A

|0AC32D| LDA.l WorldMapIcon_posy_spr6+1,X
|0AC331| STA.l $7EC109

|0AC335| LDA.l WorldMapIcon_posy_spr6+0,X
|0AC339| STA.l $7EC108

;---------------------------------------------------------------------------------------------------

|0AC33D| LDA.l WorldMapIcon_tile_spr6+1,X
|0AC341| BEQ .dont_adjust_6

|0AC343| CMP.b #$64
|0AC345| BEQ .is_crystal_2

|0AC347| LDA.b $1A
|0AC349| AND.b #$10
|0AC34B| BNE .restore_coords_and_exit

.is_crystal_2
|0AC34D| JSR WorldMapIcon_AdjustCoordinate

;---------------------------------------------------------------------------------------------------

.dont_adjust_6
|0AC350| LDX.b #$08
|0AC352| JSR WorldMap_CalculateOAMCoordinates
|0AC355| BCC .restore_coords_and_exit

|0AC357| LDA.l $7EF3C7
|0AC35B| ASL A
|0AC35C| TAX

|0AC35D| LDA.l WorldMapIcon_tile_spr6+1,X
|0AC361| BEQ .is_red_x_6

|0AC363| STA.b $0D

|0AC365| LDA.l WorldMapIcon_tile_spr6+0,X
|0AC369| STA.b $0C

|0AC36B| LDA.b #$02
|0AC36D| BRA .continue_6

;---------------------------------------------------------------------------------------------------

.is_red_x_6
|0AC36F| LDA.b $1A

|0AC371| LSR A
|0AC372| LSR A
|0AC373| LSR A

|0AC374| AND.b #$03
|0AC376| TAX

|0AC377| LDA.l WorldMap_RedXChars,X
|0AC37B| STA.b $0D

|0AC37D| LDA.b #$32
|0AC37F| STA.b $0C

|0AC381| LDA.b #$00

;---------------------------------------------------------------------------------------------------

.continue_6
|0AC383| STA.b $0B

|0AC385| LDX.b #$08
|0AC387| JSR WorldMap_HandleSpriteBlink

;---------------------------------------------------------------------------------------------------

.restore_coords_and_exit
|0AC38A| PLA
|0AC38B| STA.l $7EC10B

|0AC38F| PLA
|0AC390| STA.l $7EC10A

|0AC394| PLA
|0AC395| STA.l $7EC109

|0AC399| PLA
|0AC39A| STA.l $7EC108

|0AC39E| RTS

;===================================================================================================

WorldMap_CalculateOAMCoordinates:
|0AC39F| LDA.w $0636
|0AC3A2| BNE .zoomed_in

;---------------------------------------------------------------------------------------------------

.zoomed_out
|0AC3A4| REP #$30

|0AC3A6| LDA.l $7EC108

|0AC3AA| LSR A
|0AC3AB| LSR A
|0AC3AC| LSR A
|0AC3AD| LSR A

|0AC3AE| EOR.w #$FFFF
|0AC3B1| INC A

|0AC3B2| ADC.w $063A
|0AC3B5| SEC
|0AC3B6| SBC.w #$00C0
|0AC3B9| TAX

|0AC3BA| SEP #$20

|0AC3BC| LDA.l WorldMap_SpritePositions,X
|0AC3C0| STA.b $0F

|0AC3C2| SEP #$30

|0AC3C4| XBA

|0AC3C5| LDA.b #$0D
|0AC3C7| JSR WorldMap_MultiplyAxB
|0AC3CA| JSR WorldMap_ShiftNibblesRight

|0AC3CD| STA.b $0F

;---------------------------------------------------------------------------------------------------

|0AC3CF| REP #$30

|0AC3D1| LDA.l $7EC10A

|0AC3D5| LSR A
|0AC3D6| LSR A
|0AC3D7| LSR A
|0AC3D8| LSR A

|0AC3D9| SEP #$30

|0AC3DB| SEC
|0AC3DC| SBC.b #$80
|0AC3DE| PHP

|0AC3DF| BPL .x_positive_a

|0AC3E1| EOR.b #$FF

.x_positive_a
|0AC3E3| PHA

;---------------------------------------------------------------------------------------------------

|0AC3E4| LDA.b $0F
|0AC3E6| CMP.b #$E0
|0AC3E8| BCC .in_range_a

|0AC3EA| LDA.b #$00

.in_range_a
|0AC3EC| XBA

|0AC3ED| LDA.b #$54
|0AC3EF| JSR WorldMap_MultiplyAxB

|0AC3F2| XBA
|0AC3F3| CLC
|0AC3F4| ADC.b #$B2
|0AC3F6| XBA

|0AC3F7| PLA
|0AC3F8| JSR WorldMap_MultiplyAxB

|0AC3FB| XBA

|0AC3FC| PLP
|0AC3FD| BCS .in_range_b

|0AC3FF| STA.b $00

|0AC401| LDA.b #$80
|0AC403| SEC
|0AC404| SBC.b $00
|0AC406| BRA .continue_a

.in_range_b
|0AC408| CLC
|0AC409| ADC.b #$80

;---------------------------------------------------------------------------------------------------

.continue_a
|0AC40B| SEC
|0AC40C| SBC.b $E0
|0AC40E| STA.b $0E

|0AC410| LDA.b $0E
|0AC412| CLC
|0AC413| ADC.b #$80
|0AC415| STA.b $0E

|0AC417| LDA.b $0F
|0AC419| CLC
|0AC41A| ADC.b #$0C
|0AC41C| STA.b $0F

|0AC41E| JMP.w .exit_successfully

;---------------------------------------------------------------------------------------------------

.zoomed_in
|0AC421| REP #$30

|0AC423| LDA.l $7EC108

|0AC427| LSR A
|0AC428| LSR A
|0AC429| LSR A
|0AC42A| LSR A

|0AC42B| EOR.w #$FFFF
|0AC42E| INC A

|0AC42F| CLC
|0AC430| ADC.w $063A

|0AC433| SEC
|0AC434| SBC.w #$0080
|0AC437| CMP.w #$0100

|0AC43A| BCC .y_in_bounds

|0AC43C| JMP.w .exit_fail

;---------------------------------------------------------------------------------------------------

.y_in_bounds
|0AC43F| SEP #$30

|0AC441| XBA

|0AC442| LDA.b #$25
|0AC444| JSR WorldMap_MultiplyAxB
|0AC447| JSR WorldMap_ShiftNibblesRight

|0AC44A| REP #$10

|0AC44C| TAX
|0AC44D| CPX.w #$014D
|0AC450| BCC .x_in_bounds

|0AC452| JMP.w .exit_fail

.x_in_bounds
|0AC455| LDA.l WorldMap_SpritePositions,X
|0AC459| STA.b $0F

|0AC45B| REP #$20

|0AC45D| LDA.l $7EC10A
|0AC461| SEC
|0AC462| SBC.w #$07F8
|0AC465| PHP

|0AC466| BPL .x_positive_b

|0AC468| EOR.w #$FFFF
|0AC46B| INC A

.x_positive_b
|0AC46C| PHA

;---------------------------------------------------------------------------------------------------

|0AC46D| SEP #$20

|0AC46F| LDA.b $0F
|0AC471| CMP.b #$E2
|0AC473| BCC .in_range_c

|0AC475| LDA.b #$00

.in_range_c
|0AC477| XBA

|0AC478| LDA.b #$54
|0AC47A| JSR WorldMap_MultiplyAxB

|0AC47D| XBA
|0AC47E| CLC
|0AC47F| ADC.b #$B2
|0AC481| STA.b $00

|0AC483| XBA

|0AC484| PLA
|0AC485| JSR WorldMap_MultiplyAxB

|0AC488| XBA
|0AC489| STA.b $01

|0AC48B| PLA
|0AC48C| XBA

|0AC48D| LDA.b $00
|0AC48F| JSR WorldMap_MultiplyAxB

|0AC492| CLC
|0AC493| ADC.b $01

|0AC495| XBA
|0AC496| ADC.b #$00
|0AC498| XBA

|0AC499| PLP
|0AC49A| BCS .do_addition

.do_subtraction
|0AC49C| STA.b $00

|0AC49E| LDA.w #$0800
|0AC4A1| SEC
|0AC4A2| SBC.b $00

|0AC4A4| BRA .continue_b

.do_addition
|0AC4A6| CLC
|0AC4A7| ADC.w #$0800

;---------------------------------------------------------------------------------------------------

.continue_b
|0AC4AA| SEC
|0AC4AB| SBC.w #$0800
|0AC4AE| BCS .positive_a

|0AC4B0| EOR.w #$FFFF
|0AC4B3| INC A

.positive_a
|0AC4B4| SEP #$20

|0AC4B6| PHP

|0AC4B7| XBA
|0AC4B8| PHA

|0AC4B9| LDA.b #$2D
|0AC4BB| JSR WorldMap_MultiplyAxB

|0AC4BE| XBA
|0AC4BF| STA.b $00

|0AC4C1| PLA
|0AC4C2| XBA

|0AC4C3| LDA.b #$2D
|0AC4C5| JSR WorldMap_MultiplyAxB

|0AC4C8| CLC
|0AC4C9| ADC.b $00

|0AC4CB| XBA
|0AC4CC| ADC.b #$00
|0AC4CE| XBA

;---------------------------------------------------------------------------------------------------

|0AC4CF| PLP
|0AC4D0| BCS .in_range_d

|0AC4D2| STA.b $00

|0AC4D4| LDA.b #$80
|0AC4D6| SEC
|0AC4D7| SBC.b $00

|0AC4D9| XBA
|0AC4DA| STA.b $00

|0AC4DC| LDA.b #$00
|0AC4DE| SBC.b $00
|0AC4E0| XBA

|0AC4E1| BRA .continue_c

.in_range_d
|0AC4E3| CLC
|0AC4E4| ADC.b #$80

|0AC4E6| XBA
|0AC4E7| ADC.b #$00

|0AC4E9| XBA

;---------------------------------------------------------------------------------------------------

.continue_c
|0AC4EA| PHA

|0AC4EB| SEC
|0AC4EC| SBC.b $E0
|0AC4EE| STA.b $0E

|0AC4F0| PLA

;---------------------------------------------------------------------------------------------------

|0AC4F1| REP #$30

|0AC4F3| SEC
|0AC4F4| SBC.w #$FF80

|0AC4F7| SEC
|0AC4F8| SBC.b $E0

|0AC4FA| SEP #$30

|0AC4FC| XBA
|0AC4FD| BNE .exit_fail

|0AC4FF| LDA.b $0E
|0AC501| CLC
|0AC502| ADC.b #$81
|0AC504| STA.b $0E

|0AC506| LDA.b $0F
|0AC508| CLC
|0AC509| ADC.b #$10
|0AC50B| STA.b $0F

;---------------------------------------------------------------------------------------------------

.exit_successfully
|0AC50D| SEP #$30
|0AC50F| SEC

|0AC510| RTS

.exit_fail
|0AC511| SEP #$30
|0AC513| CLC

|0AC514| RTS

;===================================================================================================

pool WorldMap_HandleSpriteBlink

.crystal_numbers
|0AC515| db $79 ; 2
|0AC516| db $6E ; 5
|0AC517| db $6F ; 6
|0AC518| db $6D ; 4
|0AC519| db $7C ; 7
|0AC51A| db $6C ; 3
|0AC51B| db $7F ; 1

endpool

;---------------------------------------------------------------------------------------------------

WorldMap_HandleSpriteBlink:
|0AC51C| LDA.b $1A
|0AC51E| LSR A
|0AC51F| LSR A
|0AC520| LSR A
|0AC521| LSR A
|0AC522| AND.b #$01
|0AC524| BNE .dont_show_number

|0AC526| LDA.b $0D
|0AC528| CMP.b #$64
|0AC52A| BNE .dont_show_number

;---------------------------------------------------------------------------------------------------

|0AC52C| LDA.l .crystal_numbers-8,X
|0AC530| STA.b $0D

|0AC532| LDA.b #$32
|0AC534| STA.b $0C

|0AC536| STZ.w $0A20,X

|0AC539| TXA
|0AC53A| ASL A
|0AC53B| ASL A
|0AC53C| TAX

|0AC53D| LDA.b $0E
|0AC53F| STA.w $0800,X

|0AC542| LDA.b $0F
|0AC544| STA.w $0801,X

|0AC547| BRA .continue

;---------------------------------------------------------------------------------------------------

.dont_show_number
|0AC549| LDA.b $0B
|0AC54B| STA.w $0A20,X

|0AC54E| TXA
|0AC54F| ASL A
|0AC550| ASL A
|0AC551| TAX

|0AC552| LDA.b $0E
|0AC554| SEC
|0AC555| SBC.b #$04
|0AC557| STA.w $0800,X

|0AC55A| LDA.b $0F
|0AC55C| SEC
|0AC55D| SBC.b #$04
|0AC55F| STA.w $0801,X

;---------------------------------------------------------------------------------------------------

.continue
|0AC562| LDA.b $0D
|0AC564| STA.w $0802,X

|0AC567| LDA.b $0C
|0AC569| STA.w $0803,X

|0AC56C| RTS

;===================================================================================================

WorldMap_MultiplyAxB:
|0AC56D| STA.w WRMPYA
|0AC570| XBA
|0AC571| STA.w WRMPYB

|0AC574| NOP
|0AC575| NOP
|0AC576| NOP
|0AC577| NOP

|0AC578| LDA.w RDMPYH
|0AC57B| XBA
|0AC57C| LDA.w RDMPYL

|0AC57F| RTS

;===================================================================================================

WorldMap_ShiftNibblesRight:
|0AC580| REP #$30

|0AC582| LSR A
|0AC583| LSR A
|0AC584| LSR A
|0AC585| LSR A

|0AC586| SEP #$30

|0AC588| RTS

;===================================================================================================

WorldMapIcon_AdjustCoordinate:
|0AC589| REP #$20

|0AC58B| LDA.l $7EC10A
|0AC58F| SEC
|0AC590| SBC.w #$0004
|0AC593| STA.l $7EC10A

|0AC597| LDA.l $7EC108
|0AC59B| SEC
|0AC59C| SBC.w #$0004
|0AC59F| STA.l $7EC108

|0AC5A3| SEP #$20

|0AC5A5| RTS

;===================================================================================================

pool OverworldMap_CheckForPendant

.bit
|0AC5A6| db $04 ; green
|0AC5A7| db $01 ; red
|0AC5A8| db $02 ; blue

endpool

;---------------------------------------------------------------------------------------------------

OverworldMap_CheckForPendant:
|0AC5A9| LDA.l $7EF3C7
|0AC5AD| CMP.b #$03
|0AC5AF| BNE OverworldMap_PrizeCheckFail

|0AC5B1| LDA.l $7EF374
|0AC5B5| AND.l .bit,X
|0AC5B9| BEQ OverworldMap_PrizeCheckFail

|0AC5BB| SEC

|0AC5BC| RTS

;===================================================================================================

OverworldMap_PrizeCheckFail:
|0AC5BD| CLC

|0AC5BE| RTS

;===================================================================================================

pool OverworldMap_CheckForCrystal

.bit
|0AC5BF| db $02 ; Palace of Darkness
|0AC5C0| db $40 ; Skull Woods
|0AC5C1| db $08 ; Turtle Rock
|0AC5C2| db $20 ; Thieves' Town
|0AC5C3| db $01 ; Misery Mire
|0AC5C4| db $04 ; Ice palace
|0AC5C5| db $10 ; Swamp Palace

endpool

;---------------------------------------------------------------------------------------------------

OverworldMap_CheckForCrystal:
|0AC5C6| LDA.l $7EF3C7
|0AC5CA| CMP.b #$07
|0AC5CC| BNE OverworldMap_PrizeCheckFail

|0AC5CE| LDA.l $7EF37A
|0AC5D2| AND.l .bit,X
|0AC5D6| BEQ OverworldMap_PrizeCheckFail

|0AC5D8| SEC

|0AC5D9| RTS

;===================================================================================================

WorldMap_SpritePositions:
|0AC5DA| db $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0
|0AC5E2| db $E0, $E0, $E0, $E0, $E0, $E0, $E0, $DF
|0AC5EA| db $DE, $DD, $DC, $DB, $DA, $D8, $D7, $D6
|0AC5F2| db $D5, $D4, $D3, $D2, $D1, $D0, $CF, $CE
|0AC5FA| db $CD, $CC, $CB, $CA, $C9, $C7, $C6, $C5
|0AC602| db $C4, $C3, $C2, $C1, $C0, $BF, $BE, $BD
|0AC60A| db $BC, $BB, $BA, $B9, $B8, $B7, $B6, $B5
|0AC612| db $B4, $B3, $B2, $B1, $B0, $AF, $AE, $AD
|0AC61A| db $AC, $AB, $AA, $A9, $A8, $A7, $A6, $A5
|0AC622| db $A4, $A3, $A2, $A1, $A0, $9F, $9E, $9D
|0AC62A| db $9C, $9B, $9B, $9A, $99, $98, $97, $96
|0AC632| db $95, $94, $93, $92, $91, $90, $8F, $8E
|0AC63A| db $8D, $8C, $8B, $8B, $8A, $89, $88, $87
|0AC642| db $86, $85, $84, $83, $82, $81, $81, $80
|0AC64A| db $7F, $7E, $7D, $7C, $7B, $7A, $79, $79
|0AC652| db $78, $77, $76, $75, $74, $73, $72, $72
|0AC65A| db $71, $70, $6F, $6E, $6D, $6C, $6C, $6B
|0AC662| db $6A, $69, $68, $67, $67, $66, $65, $64
|0AC66A| db $63, $62, $62, $61, $60, $5F, $5E, $5D
|0AC672| db $5D, $5C, $5B, $5A, $59, $59, $58, $57
|0AC67A| db $56, $55, $55, $54, $53, $52, $51, $51
|0AC682| db $50, $4F, $4E, $4E, $4D, $4C, $4B, $4A
|0AC68A| db $4A, $49, $48, $47, $47, $46, $45, $44
|0AC692| db $44, $43, $42, $41, $41, $40, $3F, $3E
|0AC69A| db $3E, $3D, $3C, $3C, $3B, $3A, $39, $39
|0AC6A2| db $38, $37, $36, $36, $35, $34, $34, $33
|0AC6AA| db $32, $32, $31, $30, $2F, $2F, $2E, $2D
|0AC6B2| db $2D, $2C, $2B, $2B, $2A, $29, $29, $28
|0AC6BA| db $27, $27, $26, $25, $25, $24, $23, $23
|0AC6C2| db $22, $21, $21, $20, $1F, $1F, $1E, $1D
|0AC6CA| db $1D, $1C, $1C, $1B, $1A, $1A, $19, $18
|0AC6D2| db $18, $17, $17, $16, $15, $15, $14, $14
|0AC6DA| db $13, $12, $12, $11, $10, $10, $0F, $0F
|0AC6E2| db $0E, $0E, $0D, $0C, $0C, $0B, $0B, $0A
|0AC6EA| db $09, $09, $08, $08, $07, $07, $06, $05
|0AC6F2| db $05, $04, $04, $03, $03, $02, $01, $01
|0AC6FA| db $00, $00, $00, $00, $FF, $FE, $FE, $FD
|0AC702| db $FC, $FC, $FB, $FB, $FA, $F9, $F9, $F8
|0AC70A| db $F7, $F7, $F6, $F5, $F4, $F4, $F3, $F2
|0AC712| db $F2, $F1, $F0, $EF, $EE, $EE, $ED, $EC
|0AC71A| db $EB, $EA, $E9, $E8, $E8, $E7, $E6, $E5
|0AC722| db $E4, $E3, $E2, $E1, $E0

;===================================================================================================

WorldMap_LightWorldTilemap:
|0AC727| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 00, Strip 0
|0AC72F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 00, Strip 1
|0AC737| db $28, $28, $28, $28, $28, $2C, $09, $08 ; Quadrant 0, Row 00, Strip 2
|0AC73F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 00, Strip 3
|0AC747| db $28, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 0, Row 01, Strip 0
|0AC74F| db $29, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 01, Strip 1
|0AC757| db $28, $28, $28, $28, $28, $28, $2A, $28 ; Quadrant 0, Row 01, Strip 2
|0AC75F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 01, Strip 3
|0AC767| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 02, Strip 0
|0AC76F| db $2C, $09, $08, $09, $28, $28, $28, $28 ; Quadrant 0, Row 02, Strip 1
|0AC777| db $28, $28, $28, $28, $28, $08, $29, $28 ; Quadrant 0, Row 02, Strip 2
|0AC77F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 02, Strip 3
|0AC787| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 03, Strip 0
|0AC78F| db $28, $2C, $2D, $2C, $09, $28, $28, $28 ; Quadrant 0, Row 03, Strip 1
|0AC797| db $28, $28, $28, $28, $08, $28, $2C, $09 ; Quadrant 0, Row 03, Strip 2
|0AC79F| db $08, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 0, Row 03, Strip 3
|0AC7A7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 04, Strip 0
|0AC7AF| db $28, $28, $2C, $28, $2B, $09, $28, $28 ; Quadrant 0, Row 04, Strip 1
|0AC7B7| db $28, $28, $28, $08, $28, $28, $28, $2A ; Quadrant 0, Row 04, Strip 2
|0AC7BF| db $28, $28, $28, $28, $28, $28, $08, $28 ; Quadrant 0, Row 04, Strip 3
|0AC7C7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 05, Strip 0
|0AC7CF| db $28, $28, $28, $28, $2B, $2A, $28, $28 ; Quadrant 0, Row 05, Strip 1
|0AC7D7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 05, Strip 2
|0AC7DF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 05, Strip 3
|0AC7E7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 06, Strip 0
|0AC7EF| db $28, $29, $28, $28, $2A, $28, $28, $28 ; Quadrant 0, Row 06, Strip 1
|0AC7F7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 06, Strip 2
|0AC7FF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 06, Strip 3
|0AC807| db $28, $28, $08, $29, $28, $28, $28, $28 ; Quadrant 0, Row 07, Strip 0
|0AC80F| db $28, $2C, $29, $28, $28, $28, $28, $28 ; Quadrant 0, Row 07, Strip 1
|0AC817| db $28, $08, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 07, Strip 2
|0AC81F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 07, Strip 3
|0AC827| db $28, $08, $28, $2C, $09, $08, $28, $28 ; Quadrant 0, Row 08, Strip 0
|0AC82F| db $28, $28, $2B, $09, $08, $29, $08, $29 ; Quadrant 0, Row 08, Strip 1
|0AC837| db $08, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 08, Strip 2
|0AC83F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 08, Strip 3
|0AC847| db $08, $28, $28, $28, $2A, $28, $28, $28 ; Quadrant 0, Row 09, Strip 0
|0AC84F| db $28, $28, $2B, $2E, $2D, $2C, $2D, $2C ; Quadrant 0, Row 09, Strip 1
|0AC857| db $2D, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 09, Strip 2
|0AC85F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 09, Strip 3
|0AC867| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0A, Strip 0
|0AC86F| db $28, $28, $2C, $2C, $2C, $28, $2C, $28 ; Quadrant 0, Row 0A, Strip 1
|0AC877| db $2C, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0A, Strip 2
|0AC87F| db $28, $28, $28, $28, $08, $29, $28, $2F ; Quadrant 0, Row 0A, Strip 3
|0AC887| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0B, Strip 0
|0AC88F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0B, Strip 1
|0AC897| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0B, Strip 2
|0AC89F| db $28, $08, $09, $08, $28, $2C, $09, $1B ; Quadrant 0, Row 0B, Strip 3
|0AC8A7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0C, Strip 0
|0AC8AF| db $28, $28, $28, $29, $28, $28, $28, $28 ; Quadrant 0, Row 0C, Strip 1
|0AC8B7| db $28, $2F, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0C, Strip 2
|0AC8BF| db $08, $28, $2C, $2D, $28, $28, $2B, $19 ; Quadrant 0, Row 0C, Strip 3
|0AC8C7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0D, Strip 0
|0AC8CF| db $28, $28, $28, $2C, $29, $28, $2F, $28 ; Quadrant 0, Row 0D, Strip 1
|0AC8D7| db $2F, $1B, $1A, $28, $2F, $28, $2F, $08 ; Quadrant 0, Row 0D, Strip 2
|0AC8DF| db $28, $28, $28, $2C, $28, $28, $2C, $2E ; Quadrant 0, Row 0D, Strip 3
|0AC8E7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0E, Strip 0
|0AC8EF| db $28, $28, $28, $28, $2C, $38, $1B, $1C ; Quadrant 0, Row 0E, Strip 1
|0AC8F7| db $1D, $1F, $1E, $1A, $1B, $1C, $1D, $1A ; Quadrant 0, Row 0E, Strip 2
|0AC8FF| db $28, $2F, $28, $2F, $28, $28, $28, $2B ; Quadrant 0, Row 0E, Strip 3
|0AC907| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0F, Strip 0
|0AC90F| db $28, $28, $28, $28, $28, $2E, $19, $1E ; Quadrant 0, Row 0F, Strip 1
|0AC917| db $1F, $14, $14, $1E, $1F, $1E, $1F, $1E ; Quadrant 0, Row 0F, Strip 2
|0AC91F| db $1A, $1B, $3B, $3C, $3B, $28, $28, $28 ; Quadrant 0, Row 0F, Strip 3
|0AC927| db $28, $28, $28, $28, $08, $29, $08, $29 ; Quadrant 0, Row 10, Strip 0
|0AC92F| db $28, $28, $28, $28, $28, $2B, $2E, $0B ; Quadrant 0, Row 10, Strip 1
|0AC937| db $26, $27, $14, $14, $14, $A5, $14, $26 ; Quadrant 0, Row 10, Strip 2
|0AC93F| db $24, $25, $56, $35, $5B, $73, $74, $28 ; Quadrant 0, Row 10, Strip 3
|0AC947| db $28, $28, $28, $08, $28, $2C, $28, $2B ; Quadrant 0, Row 11, Strip 0
|0AC94F| db $09, $08, $29, $28, $28, $2C, $2E, $1B ; Quadrant 0, Row 11, Strip 1
|0AC957| db $36, $37, $14, $14, $14, $14, $14, $15 ; Quadrant 0, Row 11, Strip 2
|0AC95F| db $34, $A7, $64, $5B, $90, $73, $73, $52 ; Quadrant 0, Row 11, Strip 3
|0AC967| db $28, $28, $28, $28, $28, $28, $28, $2C ; Quadrant 0, Row 12, Strip 0
|0AC96F| db $2E, $2D, $2C, $09, $28, $2F, $1B, $1F ; Quadrant 0, Row 12, Strip 1
|0AC977| db $14, $14, $14, $14, $14, $14, $14, $15 ; Quadrant 0, Row 12, Strip 2
|0AC97F| db $A7, $34, $E4, $90, $82, $83, $83, $83 ; Quadrant 0, Row 12, Strip 3
|0AC987| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 13, Strip 0
|0AC98F| db $2C, $2E, $2D, $2A, $29, $2C, $19, $14 ; Quadrant 0, Row 13, Strip 1
|0AC997| db $A5, $14, $14, $14, $A5, $14, $14, $15 ; Quadrant 0, Row 13, Strip 2
|0AC99F| db $A7, $B6, $DF, $82, $B2, $93, $D6, $D6 ; Quadrant 0, Row 13, Strip 3
|0AC9A7| db $09, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 14, Strip 0
|0AC9AF| db $28, $2C, $2A, $28, $2C, $09, $1B, $14 ; Quadrant 0, Row 14, Strip 1
|0AC9B7| db $14, $A5, $14, $14, $14, $14, $14, $15 ; Quadrant 0, Row 14, Strip 2
|0AC9BF| db $34, $A7, $82, $B2, $D6, $93, $93, $93 ; Quadrant 0, Row 14, Strip 3
|0AC9C7| db $2B, $09, $08, $29, $28, $28, $28, $28 ; Quadrant 0, Row 15, Strip 0
|0AC9CF| db $28, $28, $28, $28, $28, $2B, $19, $14 ; Quadrant 0, Row 15, Strip 1
|0AC9D7| db $14, $14, $14, $14, $A5, $14, $A5, $36 ; Quadrant 0, Row 15, Strip 2
|0AC9DF| db $05, $34, $B0, $D6, $D6, $82, $83, $83 ; Quadrant 0, Row 15, Strip 3
|0AC9E7| db $2C, $2A, $28, $2B, $2D, $28, $28, $28 ; Quadrant 0, Row 16, Strip 0
|0AC9EF| db $28, $28, $28, $28, $28, $2C, $2B, $0B ; Quadrant 0, Row 16, Strip 1
|0AC9F7| db $A5, $14, $14, $A5, $14, $A5, $14, $14 ; Quadrant 0, Row 16, Strip 2
|0AC9FF| db $15, $33, $33, $33, $90, $B2, $D6, $93 ; Quadrant 0, Row 16, Strip 3
|0ACA07| db $28, $28, $28, $2C, $2E, $2D, $08, $28 ; Quadrant 0, Row 17, Strip 0
|0ACA0F| db $28, $28, $28, $28, $28, $28, $2F, $1B ; Quadrant 0, Row 17, Strip 1
|0ACA17| db $14, $14, $A5, $A5, $14, $14, $14, $A5 ; Quadrant 0, Row 17, Strip 2
|0ACA1F| db $15, $A6, $FB, $34, $82, $83, $83, $83 ; Quadrant 0, Row 17, Strip 3
|0ACA27| db $28, $28, $28, $28, $2C, $2A, $28, $28 ; Quadrant 0, Row 18, Strip 0
|0ACA2F| db $28, $28, $08, $29, $08, $29, $1B, $1F ; Quadrant 0, Row 18, Strip 1
|0ACA37| db $26, $27, $26, $27, $26, $24, $24, $D5 ; Quadrant 0, Row 18, Strip 2
|0ACA3F| db $25, $34, $34, $34, $B0, $93, $71, $93 ; Quadrant 0, Row 18, Strip 3
|0ACA47| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 19, Strip 0
|0ACA4F| db $28, $2F, $28, $2C, $28, $2C, $19, $14 ; Quadrant 0, Row 19, Strip 1
|0ACA57| db $15, $13, $15, $13, $15, $33, $40, $41 ; Quadrant 0, Row 19, Strip 2
|0ACA5F| db $33, $BF, $34, $34, $30, $23, $81, $23 ; Quadrant 0, Row 19, Strip 3
|0ACA67| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 1A, Strip 0
|0ACA6F| db $2F, $1B, $1A, $28, $28, $2F, $1B, $14 ; Quadrant 0, Row 1A, Strip 1
|0ACA77| db $15, $13, $15, $13, $15, $BC, $BD, $A6 ; Quadrant 0, Row 1A, Strip 2
|0ACA7F| db $A7, $34, $41, $33, $40, $34, $C0, $34 ; Quadrant 0, Row 1A, Strip 3
|0ACA87| db $29, $28, $28, $28, $28, $08, $2D, $28 ; Quadrant 0, Row 1B, Strip 0
|0ACA8F| db $28, $19, $0A, $28, $2F, $1B, $1F, $14 ; Quadrant 0, Row 1B, Strip 1
|0ACA97| db $15, $13, $15, $13, $36, $05, $D0, $D0 ; Quadrant 0, Row 1B, Strip 2
|0ACA9F| db $D0, $D0, $D0, $D0, $D0, $D0, $C3, $D0 ; Quadrant 0, Row 1B, Strip 3
|0ACAA7| db $2C, $09, $28, $28, $08, $28, $2B, $2D ; Quadrant 0, Row 1C, Strip 0
|0ACAAF| db $28, $2C, $28, $2F, $1B, $1F, $14, $14 ; Quadrant 0, Row 1C, Strip 1
|0ACAB7| db $15, $23, $25, $23, $24, $25, $C0, $A6 ; Quadrant 0, Row 1C, Strip 2
|0ACABF| db $FB, $A7, $A6, $00, $6A, $3D, $6E, $8B ; Quadrant 0, Row 1C, Strip 3
|0ACAC7| db $28, $2C, $09, $08, $28, $28, $2C, $2E ; Quadrant 0, Row 1D, Strip 0
|0ACACF| db $2D, $08, $29, $1B, $1F, $A5, $14, $26 ; Quadrant 0, Row 1D, Strip 1
|0ACAD7| db $25, $31, $B6, $E4, $FD, $FE, $C0, $10 ; Quadrant 0, Row 1D, Strip 2
|0ACADF| db $12, $A6, $FB, $10, $12, $4D, $7E, $9B ; Quadrant 0, Row 1D, Strip 3
|0ACAE7| db $28, $28, $2A, $29, $28, $28, $28, $2C ; Quadrant 0, Row 1E, Strip 0
|0ACAEF| db $2A, $28, $2C, $19, $14, $14, $A5, $15 ; Quadrant 0, Row 1E, Strip 1
|0ACAF7| db $34, $41, $33, $33, $33, $33, $C0, $10 ; Quadrant 0, Row 1E, Strip 2
|0ACAFF| db $12, $A7, $FB, $20, $22, $CD, $A7, $3E ; Quadrant 0, Row 1E, Strip 3
|0ACB07| db $28, $28, $28, $2C, $2D, $28, $28, $28 ; Quadrant 0, Row 1F, Strip 0
|0ACB0F| db $28, $28, $28, $2B, $0B, $A5, $14, $15 ; Quadrant 0, Row 1F, Strip 1
|0ACB17| db $34, $F6, $89, $6B, $6C, $89, $F6, $10 ; Quadrant 0, Row 1F, Strip 2
|0ACB1F| db $12, $FB, $FB, $00, $02, $CD, $34, $3E ; Quadrant 0, Row 1F, Strip 3

;---------------------------------------------------------------------------------------------------

|0ACB27| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 00, Strip 0
|0ACB2F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 00, Strip 1
|0ACB37| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 00, Strip 2
|0ACB3F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 00, Strip 3
|0ACB47| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 01, Strip 0
|0ACB4F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 01, Strip 1
|0ACB57| db $28, $28, $28, $28, $08, $29, $28, $28 ; Quadrant 1, Row 01, Strip 2
|0ACB5F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 01, Strip 3
|0ACB67| db $28, $28, $08, $28, $08, $29, $28, $28 ; Quadrant 1, Row 02, Strip 0
|0ACB6F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 02, Strip 1
|0ACB77| db $28, $28, $28, $08, $28, $2C, $09, $28 ; Quadrant 1, Row 02, Strip 2
|0ACB7F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 02, Strip 3
|0ACB87| db $09, $08, $28, $08, $28, $2C, $09, $28 ; Quadrant 1, Row 03, Strip 0
|0ACB8F| db $28, $28, $28, $28, $28, $29, $08, $29 ; Quadrant 1, Row 03, Strip 1
|0ACB97| db $08, $29, $08, $28, $28, $28, $2B, $09 ; Quadrant 1, Row 03, Strip 2
|0ACB9F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 03, Strip 3
|0ACBA7| db $2C, $2D, $28, $28, $28, $28, $2B, $09 ; Quadrant 1, Row 04, Strip 0
|0ACBAF| db $28, $28, $08, $28, $28, $2C, $2D, $2C ; Quadrant 1, Row 04, Strip 1
|0ACBB7| db $2D, $2C, $2D, $28, $28, $28, $2C, $2E ; Quadrant 1, Row 04, Strip 2
|0ACBBF| db $09, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 04, Strip 3
|0ACBC7| db $28, $2C, $28, $28, $28, $28, $2C, $2E ; Quadrant 1, Row 05, Strip 0
|0ACBCF| db $09, $08, $28, $28, $28, $28, $2C, $28 ; Quadrant 1, Row 05, Strip 1
|0ACBD7| db $2C, $28, $2C, $28, $28, $28, $28, $2B ; Quadrant 1, Row 05, Strip 2
|0ACBDF| db $2A, $29, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 05, Strip 3
|0ACBE7| db $28, $28, $28, $28, $28, $28, $28, $2B ; Quadrant 1, Row 06, Strip 0
|0ACBEF| db $2A, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 06, Strip 1
|0ACBF7| db $28, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 1, Row 06, Strip 2
|0ACBFF| db $09, $2C, $09, $28, $28, $28, $28, $28 ; Quadrant 1, Row 06, Strip 3
|0ACC07| db $28, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 1, Row 07, Strip 0
|0ACC0F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 07, Strip 1
|0ACC17| db $28, $28, $28, $28, $28, $28, $08, $28 ; Quadrant 1, Row 07, Strip 2
|0ACC1F| db $2C, $28, $2B, $09, $28, $28, $28, $28 ; Quadrant 1, Row 07, Strip 3
|0ACC27| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 08, Strip 0
|0ACC2F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 08, Strip 1
|0ACC37| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 08, Strip 2
|0ACC3F| db $28, $28, $2C, $2E, $2D, $28, $28, $28 ; Quadrant 1, Row 08, Strip 3
|0ACC47| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 09, Strip 0
|0ACC4F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 09, Strip 1
|0ACC57| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 09, Strip 2
|0ACC5F| db $28, $28, $28, $2B, $2A, $2D, $28, $28 ; Quadrant 1, Row 09, Strip 3
|0ACC67| db $28, $28, $28, $28, $28, $28, $2F, $28 ; Quadrant 1, Row 0A, Strip 0
|0ACC6F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0A, Strip 1
|0ACC77| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0A, Strip 2
|0ACC7F| db $28, $28, $28, $2A, $28, $2C, $28, $28 ; Quadrant 1, Row 0A, Strip 3
|0ACC87| db $1A, $28, $08, $29, $08, $29, $1B, $1A ; Quadrant 1, Row 0B, Strip 0
|0ACC8F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0B, Strip 1
|0ACC97| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0B, Strip 2
|0ACC9F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0B, Strip 3
|0ACCA7| db $0A, $08, $2D, $2C, $2D, $1B, $1F, $0A ; Quadrant 1, Row 0C, Strip 0
|0ACCAF| db $28, $28, $28, $2F, $28, $28, $28, $28 ; Quadrant 1, Row 0C, Strip 1
|0ACCB7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0C, Strip 2
|0ACCBF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0C, Strip 3
|0ACCC7| db $2D, $28, $2C, $28, $2C, $19, $0A, $28 ; Quadrant 1, Row 0D, Strip 0
|0ACCCF| db $28, $28, $2F, $1B, $1A, $28, $28, $28 ; Quadrant 1, Row 0D, Strip 1
|0ACCD7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0D, Strip 2
|0ACCDF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0D, Strip 3
|0ACCE7| db $2E, $28, $08, $29, $28, $2C, $2D, $28 ; Quadrant 1, Row 0E, Strip 0
|0ACCEF| db $28, $28, $2C, $19, $0A, $28, $28, $28 ; Quadrant 1, Row 0E, Strip 1
|0ACCF7| db $28, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 1, Row 0E, Strip 2
|0ACCFF| db $29, $08, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0E, Strip 3
|0ACD07| db $2C, $98, $42, $2C, $09, $28, $2C, $28 ; Quadrant 1, Row 0F, Strip 0
|0ACD0F| db $28, $08, $29, $2C, $28, $28, $28, $28 ; Quadrant 1, Row 0F, Strip 1
|0ACD17| db $28, $28, $28, $28, $28, $28, $08, $28 ; Quadrant 1, Row 0F, Strip 2
|0ACD1F| db $2C, $2D, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0F, Strip 3
|0ACD27| db $72, $99, $63, $73, $73, $74, $2C, $72 ; Quadrant 1, Row 10, Strip 0
|0ACD2F| db $73, $73, $73, $A1, $A0, $73, $73, $74 ; Quadrant 1, Row 10, Strip 1
|0ACD37| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 10, Strip 2
|0ACD3F| db $28, $2C, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 10, Strip 3
|0ACD47| db $52, $9A, $70, $A0, $73, $91, $09, $90 ; Quadrant 1, Row 11, Strip 0
|0ACD4F| db $73, $73, $A1, $84, $90, $73, $73, $91 ; Quadrant 1, Row 11, Strip 1
|0ACD57| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 11, Strip 2
|0ACD5F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 11, Strip 3
|0ACD67| db $83, $83, $84, $82, $83, $52, $52, $83 ; Quadrant 1, Row 12, Strip 0
|0ACD6F| db $83, $83, $84, $B3, $90, $A1, $83, $84 ; Quadrant 1, Row 12, Strip 1
|0ACD77| db $3B, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 12, Strip 2
|0ACD7F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 12, Strip 3
|0ACD87| db $93, $93, $94, $92, $93, $94, $72, $93 ; Quadrant 1, Row 13, Strip 0
|0ACD8F| db $93, $93, $B3, $A1, $82, $84, $93, $A2 ; Quadrant 1, Row 13, Strip 1
|0ACD97| db $4A, $3B, $08, $28, $28, $28, $28, $28 ; Quadrant 1, Row 13, Strip 2
|0ACD9F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 13, Strip 3
|0ACDA7| db $D6, $93, $94, $92, $93, $94, $82, $93 ; Quadrant 1, Row 14, Strip 0
|0ACDAF| db $82, $83, $83, $84, $B4, $94, $06, $54 ; Quadrant 1, Row 14, Strip 1
|0ACDB7| db $35, $4C, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 14, Strip 2
|0ACDBF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 14, Strip 3
|0ACDC7| db $83, $84, $B3, $B2, $93, $94, $B4, $90 ; Quadrant 1, Row 15, Strip 0
|0ACDCF| db $B2, $93, $93, $B3, $CA, $B7, $95, $54 ; Quadrant 1, Row 15, Strip 1
|0ACDD7| db $48, $3B, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 15, Strip 2
|0ACDDF| db $28, $28, $28, $28, $08, $29, $28, $28 ; Quadrant 1, Row 15, Strip 3
|0ACDE7| db $93, $B3, $73, $A1, $83, $52, $62, $90 ; Quadrant 1, Row 16, Strip 0
|0ACDEF| db $73, $73, $73, $91, $9F, $06, $22, $54 ; Quadrant 1, Row 16, Strip 1
|0ACDF7| db $5C, $4A, $3B, $28, $28, $28, $28, $28 ; Quadrant 1, Row 16, Strip 2
|0ACDFF| db $28, $28, $28, $08, $28, $2C, $09, $08 ; Quadrant 1, Row 16, Strip 3
|0ACE07| db $83, $83, $83, $84, $93, $94, $CA, $82 ; Quadrant 1, Row 17, Strip 0
|0ACE0F| db $83, $83, $83, $84, $A9, $16, $02, $54 ; Quadrant 1, Row 17, Strip 1
|0ACE17| db $58, $56, $4A, $3B, $08, $28, $28, $28 ; Quadrant 1, Row 17, Strip 2
|0ACE1F| db $28, $28, $08, $28, $28, $28, $2B, $2D ; Quadrant 1, Row 17, Strip 3
|0ACE27| db $93, $93, $93, $A4, $93, $A4, $CA, $B4 ; Quadrant 1, Row 18, Strip 0
|0ACE2F| db $93, $93, $93, $B7, $11, $11, $12, $54 ; Quadrant 1, Row 18, Strip 1
|0ACE37| db $35, $58, $56, $4C, $29, $28, $28, $28 ; Quadrant 1, Row 18, Strip 2
|0ACE3F| db $28, $28, $28, $28, $28, $28, $2C, $2E ; Quadrant 1, Row 18, Strip 3
|0ACE47| db $24, $24, $24, $25, $00, $85, $06, $21 ; Quadrant 1, Row 19, Strip 0
|0ACE4F| db $21, $21, $21, $21, $21, $21, $22, $54 ; Quadrant 1, Row 19, Strip 1
|0ACE57| db $39, $3A, $39, $28, $2C, $2D, $28, $28 ; Quadrant 1, Row 19, Strip 2
|0ACE5F| db $28, $28, $28, $28, $28, $28, $28, $2C ; Quadrant 1, Row 19, Strip 3
|0ACE67| db $B6, $80, $80, $B6, $20, $07, $95, $A6 ; Quadrant 1, Row 1A, Strip 0
|0ACE6F| db $A6, $F6, $A7, $44, $45, $41, $31, $54 ; Quadrant 1, Row 1A, Strip 1
|0ACE77| db $3B, $28, $28, $28, $28, $2C, $28, $28 ; Quadrant 1, Row 1A, Strip 2
|0ACE7F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 1A, Strip 3
|0ACE87| db $D0, $D0, $D0, $D0, $D0, $10, $06, $77 ; Quadrant 1, Row 1B, Strip 0
|0ACE8F| db $7B, $7B, $7B, $43, $7A, $7B, $8D, $8E ; Quadrant 1, Row 1B, Strip 1
|0ACE97| db $4A, $3B, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 1B, Strip 2
|0ACE9F| db $28, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 1, Row 1B, Strip 3
|0ACEA7| db $8C, $6E, $3F, $8A, $02, $10, $12, $54 ; Quadrant 1, Row 1C, Strip 0
|0ACEAF| db $57, $9D, $9D, $9D, $9D, $9D, $C8, $C9 ; Quadrant 1, Row 1C, Strip 1
|0ACEB7| db $35, $4C, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 1C, Strip 2
|0ACEBF| db $28, $28, $28, $28, $28, $28, $08, $28 ; Quadrant 1, Row 1C, Strip 3
|0ACEC7| db $9C, $7E, $4F, $10, $12, $10, $12, $54 ; Quadrant 1, Row 1D, Strip 0
|0ACECF| db $C7, $57, $56, $48, $35, $89, $89, $5C ; Quadrant 1, Row 1D, Strip 1
|0ACED7| db $35, $3B, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 1D, Strip 2
|0ACEDF| db $28, $28, $28, $28, $28, $08, $28, $28 ; Quadrant 1, Row 1D, Strip 3
|0ACEE7| db $5E, $A7, $CE, $10, $12, $52, $52, $54 ; Quadrant 1, Row 1E, Strip 0
|0ACEEF| db $C7, $EE, $EF, $58, $9D, $9D, $9D, $5C ; Quadrant 1, Row 1E, Strip 1
|0ACEF7| db $48, $4A, $3B, $28, $28, $28, $28, $28 ; Quadrant 1, Row 1E, Strip 2
|0ACEFF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 1E, Strip 3
|0ACF07| db $5E, $34, $CE, $10, $F3, $F4, $22, $54 ; Quadrant 1, Row 1F, Strip 0
|0ACF0F| db $C7, $89, $49, $56, $57, $9D, $56, $5C ; Quadrant 1, Row 1F, Strip 1
|0ACF17| db $5C, $35, $4C, $28, $29, $28, $28, $28 ; Quadrant 1, Row 1F, Strip 2
|0ACF1F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 1F, Strip 3

;---------------------------------------------------------------------------------------------------

|0ACF27| db $28, $28, $28, $28, $2B, $2D, $28, $28 ; Quadrant 2, Row 00, Strip 0
|0ACF2F| db $28, $28, $28, $2C, $2A, $0B, $14, $15 ; Quadrant 2, Row 00, Strip 1
|0ACF37| db $34, $B6, $34, $3E, $5E, $88, $88, $10 ; Quadrant 2, Row 00, Strip 2
|0ACF3F| db $12, $FB, $A6, $10, $12, $CD, $34, $3E ; Quadrant 2, Row 00, Strip 3
|0ACF47| db $28, $28, $28, $28, $2C, $2E, $2D, $08 ; Quadrant 2, Row 01, Strip 0
|0ACF4F| db $09, $28, $28, $28, $2F, $2A, $0B, $15 ; Quadrant 2, Row 01, Strip 1
|0ACF57| db $88, $88, $BC, $BD, $BC, $BD, $F6, $10 ; Quadrant 2, Row 01, Strip 2
|0ACF5F| db $12, $BC, $BD, $10, $12, $5D, $4E, $7D ; Quadrant 2, Row 01, Strip 3
|0ACF67| db $28, $28, $28, $28, $28, $2C, $2A, $28 ; Quadrant 2, Row 02, Strip 0
|0ACF6F| db $2B, $09, $28, $28, $28, $2F, $1B, $25 ; Quadrant 2, Row 02, Strip 1
|0ACF77| db $34, $A7, $34, $34, $34, $34, $A7, $20 ; Quadrant 2, Row 02, Strip 2
|0ACF7F| db $22, $33, $33, $10, $16, $01, $01, $50 ; Quadrant 2, Row 02, Strip 3
|0ACF87| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 03, Strip 0
|0ACF8F| db $2C, $2A, $28, $28, $2F, $3C, $4B, $66 ; Quadrant 2, Row 03, Strip 1
|0ACF97| db $CF, $04, $04, $CB, $04, $BB, $C0, $03 ; Quadrant 2, Row 03, Strip 2
|0ACF9F| db $04, $04, $04, $DB, $E6, $21, $21, $60 ; Quadrant 2, Row 03, Strip 3
|0ACFA7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 04, Strip 0
|0ACFAF| db $28, $28, $08, $09, $08, $5A, $35, $35 ; Quadrant 2, Row 04, Strip 1
|0ACFB7| db $69, $24, $24, $27, $26, $25, $C0, $13 ; Quadrant 2, Row 04, Strip 2
|0ACFBF| db $26, $24, $24, $27, $15, $A7, $FB, $FB ; Quadrant 2, Row 04, Strip 3
|0ACFC7| db $09, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 05, Strip 0
|0ACFCF| db $28, $28, $28, $2C, $2D, $2B, $3A, $35 ; Quadrant 2, Row 05, Strip 1
|0ACFD7| db $55, $34, $34, $13, $15, $E4, $33, $13 ; Quadrant 2, Row 05, Strip 2
|0ACFDF| db $15, $FB, $A7, $13, $15, $A7, $FB, $FB ; Quadrant 2, Row 05, Strip 3
|0ACFE7| db $2B, $09, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 06, Strip 0
|0ACFEF| db $28, $28, $28, $28, $2C, $2F, $3C, $35 ; Quadrant 2, Row 06, Strip 1
|0ACFF7| db $55, $33, $31, $23, $25, $33, $F6, $13 ; Quadrant 2, Row 06, Strip 2
|0ACFFF| db $15, $A7, $FB, $13, $15, $A7, $A6, $34 ; Quadrant 2, Row 06, Strip 3
|0AD007| db $2C, $2E, $09, $08, $29, $28, $28, $28 ; Quadrant 2, Row 07, Strip 0
|0AD00F| db $28, $2C, $09, $28, $2F, $3C, $4B, $35 ; Quadrant 2, Row 07, Strip 1
|0AD017| db $7A, $7B, $7B, $A3, $D2, $7B, $7C, $23 ; Quadrant 2, Row 07, Strip 2
|0AD01F| db $36, $05, $03, $37, $15, $A7, $41, $33 ; Quadrant 2, Row 07, Strip 3
|0AD027| db $28, $2C, $2A, $28, $2C, $09, $28, $28 ; Quadrant 2, Row 08, Strip 0
|0AD02F| db $28, $28, $2C, $09, $3C, $4B, $35, $57 ; Quadrant 2, Row 08, Strip 1
|0AD037| db $9D, $9D, $C5, $9D, $9D, $56, $55, $A6 ; Quadrant 2, Row 08, Strip 2
|0AD03F| db $23, $25, $23, $24, $25, $34, $44, $66 ; Quadrant 2, Row 08, Strip 3
|0AD047| db $28, $28, $28, $28, $28, $2B, $2D, $28 ; Quadrant 2, Row 09, Strip 0
|0AD04F| db $28, $28, $28, $2C, $5A, $35, $35, $C7 ; Quadrant 2, Row 09, Strip 1
|0AD057| db $35, $DE, $CC, $DE, $57, $5C, $47, $66 ; Quadrant 2, Row 09, Strip 2
|0AD05F| db $45, $D0, $D0, $D0, $C3, $34, $AF, $67 ; Quadrant 2, Row 09, Strip 3
|0AD067| db $28, $28, $28, $28, $28, $2B, $2A, $28 ; Quadrant 2, Row 0A, Strip 0
|0AD06F| db $28, $28, $28, $28, $2C, $3A, $35, $C7 ; Quadrant 2, Row 0A, Strip 1
|0AD077| db $57, $9D, $78, $9D, $59, $58, $56, $35 ; Quadrant 2, Row 0A, Strip 2
|0AD07F| db $7A, $7B, $7C, $A7, $34, $B1, $AD, $B6 ; Quadrant 2, Row 0A, Strip 3
|0AD087| db $28, $28, $28, $28, $2F, $2A, $28, $28 ; Quadrant 2, Row 0B, Strip 0
|0AD08F| db $28, $28, $28, $28, $28, $2C, $3A, $C7 ; Quadrant 2, Row 0B, Strip 1
|0AD097| db $C7, $86, $DC, $57, $59, $86, $58, $56 ; Quadrant 2, Row 0B, Strip 2
|0AD09F| db $35, $35, $7A, $7B, $7B, $D3, $AC, $BF ; Quadrant 2, Row 0B, Strip 3
|0AD0A7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 0C, Strip 0
|0AD0AF| db $28, $28, $08, $09, $08, $29, $3C, $C7 ; Quadrant 2, Row 0C, Strip 1
|0AD0B7| db $C7, $86, $58, $59, $86, $86, $86, $5C ; Quadrant 2, Row 0C, Strip 2
|0AD0BF| db $57, $56, $57, $56, $57, $65, $B6, $B6 ; Quadrant 2, Row 0C, Strip 3
|0AD0C7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 0D, Strip 0
|0AD0CF| db $28, $28, $28, $2C, $2D, $3C, $4B, $C7 ; Quadrant 2, Row 0D, Strip 1
|0AD0D7| db $59, $86, $86, $86, $86, $86, $86, $5C ; Quadrant 2, Row 0D, Strip 2
|0AD0DF| db $C7, $64, $65, $54, $55, $B6, $B6, $B6 ; Quadrant 2, Row 0D, Strip 3
|0AD0E7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 0E, Strip 0
|0AD0EF| db $28, $28, $28, $28, $2C, $5A, $35, $C7 ; Quadrant 2, Row 0E, Strip 1
|0AD0F7| db $86, $86, $86, $86, $86, $86, $86, $58 ; Quadrant 2, Row 0E, Strip 2
|0AD0FF| db $C2, $7F, $6F, $C1, $65, $B6, $79, $F5 ; Quadrant 2, Row 0E, Strip 3
|0AD107| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 0F, Strip 0
|0AD10F| db $28, $28, $28, $08, $29, $2C, $3A, $C7 ; Quadrant 2, Row 0F, Strip 1
|0AD117| db $66, $49, $86, $86, $86, $86, $86, $86 ; Quadrant 2, Row 0F, Strip 2
|0AD11F| db $5C, $47, $46, $55, $B6, $B6, $B6, $B6 ; Quadrant 2, Row 0F, Strip 3
|0AD127| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 10, Strip 0
|0AD12F| db $08, $29, $08, $28, $2C, $09, $3C, $47 ; Quadrant 2, Row 10, Strip 1
|0AD137| db $66, $66, $66, $66, $66, $66, $66, $66 ; Quadrant 2, Row 10, Strip 2
|0AD13F| db $46, $35, $35, $47, $66, $66, $66, $66 ; Quadrant 2, Row 10, Strip 3
|0AD147| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 11, Strip 0
|0AD14F| db $28, $2C, $09, $28, $28, $2B, $5A, $39 ; Quadrant 2, Row 11, Strip 1
|0AD157| db $3A, $39, $3A, $35, $35, $39, $3A, $48 ; Quadrant 2, Row 11, Strip 2
|0AD15F| db $66, $66, $49, $39, $3A, $35, $35, $39 ; Quadrant 2, Row 11, Strip 3
|0AD167| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 12, Strip 0
|0AD16F| db $28, $28, $2C, $28, $28, $2C, $2C, $2D ; Quadrant 2, Row 12, Strip 1
|0AD177| db $2C, $28, $2C, $3A, $39, $2F, $3C, $5C ; Quadrant 2, Row 12, Strip 2
|0AD17F| db $39, $3A, $39, $28, $2C, $3A, $39, $28 ; Quadrant 2, Row 12, Strip 3
|0AD187| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 13, Strip 0
|0AD18F| db $28, $28, $28, $28, $28, $28, $28, $2C ; Quadrant 2, Row 13, Strip 1
|0AD197| db $28, $28, $28, $2C, $28, $2C, $5A, $46 ; Quadrant 2, Row 13, Strip 2
|0AD19F| db $3B, $2C, $2D, $28, $28, $2C, $2D, $28 ; Quadrant 2, Row 13, Strip 3
|0AD1A7| db $28, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 2, Row 14, Strip 0
|0AD1AF| db $29, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 14, Strip 1
|0AD1B7| db $28, $28, $28, $28, $28, $28, $3C, $35 ; Quadrant 2, Row 14, Strip 2
|0AD1BF| db $4A, $3B, $2C, $2D, $28, $28, $2C, $28 ; Quadrant 2, Row 14, Strip 3
|0AD1C7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 15, Strip 0
|0AD1CF| db $2C, $09, $08, $29, $28, $28, $28, $28 ; Quadrant 2, Row 15, Strip 1
|0AD1D7| db $28, $28, $28, $28, $28, $08, $5A, $35 ; Quadrant 2, Row 15, Strip 2
|0AD1DF| db $35, $4A, $3B, $3C, $3B, $08, $29, $28 ; Quadrant 2, Row 15, Strip 3
|0AD1E7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 16, Strip 0
|0AD1EF| db $28, $2C, $2D, $2C, $09, $28, $28, $28 ; Quadrant 2, Row 16, Strip 1
|0AD1F7| db $28, $28, $28, $28, $08, $28, $2C, $3A ; Quadrant 2, Row 16, Strip 2
|0AD1FF| db $39, $3A, $4A, $4B, $4C, $28, $2C, $09 ; Quadrant 2, Row 16, Strip 3
|0AD207| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 17, Strip 0
|0AD20F| db $28, $28, $2C, $28, $2B, $09, $08, $29 ; Quadrant 2, Row 17, Strip 1
|0AD217| db $28, $28, $28, $08, $28, $28, $28, $2A ; Quadrant 2, Row 17, Strip 2
|0AD21F| db $28, $2C, $3A, $39, $28, $28, $28, $08 ; Quadrant 2, Row 17, Strip 3
|0AD227| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 18, Strip 0
|0AD22F| db $28, $28, $28, $28, $2B, $2A, $28, $2C ; Quadrant 2, Row 18, Strip 1
|0AD237| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 18, Strip 2
|0AD23F| db $28, $28, $2B, $2D, $28, $28, $28, $28 ; Quadrant 2, Row 18, Strip 3
|0AD247| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 19, Strip 0
|0AD24F| db $28, $28, $28, $28, $2A, $28, $28, $28 ; Quadrant 2, Row 19, Strip 1
|0AD257| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 19, Strip 2
|0AD25F| db $28, $28, $2C, $2E, $2D, $28, $28, $28 ; Quadrant 2, Row 19, Strip 3
|0AD267| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1A, Strip 0
|0AD26F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1A, Strip 1
|0AD277| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1A, Strip 2
|0AD27F| db $28, $28, $28, $2C, $2E, $28, $28, $28 ; Quadrant 2, Row 1A, Strip 3
|0AD287| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1B, Strip 0
|0AD28F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1B, Strip 1
|0AD297| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1B, Strip 2
|0AD29F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1B, Strip 3
|0AD2A7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1C, Strip 0
|0AD2AF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1C, Strip 1
|0AD2B7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1C, Strip 2
|0AD2BF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1C, Strip 3
|0AD2C7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1D, Strip 0
|0AD2CF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1D, Strip 1
|0AD2D7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1D, Strip 2
|0AD2DF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1D, Strip 3
|0AD2E7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1E, Strip 0
|0AD2EF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1E, Strip 1
|0AD2F7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1E, Strip 2
|0AD2FF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1E, Strip 3
|0AD307| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1F, Strip 0
|0AD30F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1F, Strip 1
|0AD317| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1F, Strip 2
|0AD31F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1F, Strip 3

;---------------------------------------------------------------------------------------------------

|0AD327| db $5E, $34, $CE, $10, $12, $FC, $FC, $5C ; Quadrant 3, Row 00, Strip 0
|0AD32F| db $C7, $9D, $59, $58, $59, $89, $58, $5C ; Quadrant 3, Row 00, Strip 1
|0AD337| db $58, $39, $28, $28, $2C, $2D, $28, $28 ; Quadrant 3, Row 00, Strip 2
|0AD33F| db $08, $29, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 00, Strip 3
|0AD347| db $6D, $4E, $5F, $20, $22, $FC, $FC, $5C ; Quadrant 3, Row 01, Strip 0
|0AD34F| db $C7, $67, $56, $89, $57, $67, $67, $5C ; Quadrant 3, Row 01, Strip 1
|0AD357| db $39, $28, $28, $28, $28, $2B, $2D, $08 ; Quadrant 3, Row 01, Strip 2
|0AD35F| db $28, $2C, $2D, $28, $28, $28, $28, $28 ; Quadrant 3, Row 01, Strip 3
|0AD367| db $51, $01, $01, $01, $02, $FC, $FC, $5C ; Quadrant 3, Row 02, Strip 0
|0AD36F| db $55, $9E, $64, $67, $65, $FB, $A7, $54 ; Quadrant 3, Row 02, Strip 1
|0AD377| db $3B, $28, $28, $08, $28, $28, $2C, $28 ; Quadrant 3, Row 02, Strip 2
|0AD37F| db $28, $28, $2C, $28, $28, $28, $28, $28 ; Quadrant 3, Row 02, Strip 3
|0AD387| db $61, $21, $21, $07, $12, $FC, $FC, $5C ; Quadrant 3, Row 03, Strip 0
|0AD38F| db $55, $77, $7B, $7B, $7B, $7B, $7C, $54 ; Quadrant 3, Row 03, Strip 1
|0AD397| db $4A, $3B, $08, $28, $28, $28, $28, $28 ; Quadrant 3, Row 03, Strip 2
|0AD39F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 03, Strip 3
|0AD3A7| db $FB, $A7, $C0, $10, $12, $FC, $FC, $5C ; Quadrant 3, Row 04, Strip 0
|0AD3AF| db $55, $64, $67, $56, $57, $67, $65, $54 ; Quadrant 3, Row 04, Strip 1
|0AD3B7| db $48, $4C, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 04, Strip 2
|0AD3BF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 04, Strip 3
|0AD3C7| db $FB, $B6, $C0, $10, $12, $34, $34, $64 ; Quadrant 3, Row 05, Strip 0
|0AD3CF| db $65, $A6, $A6, $54, $55, $31, $44, $46 ; Quadrant 3, Row 05, Strip 1
|0AD3D7| db $58, $3B, $28, $2F, $28, $28, $28, $28 ; Quadrant 3, Row 05, Strip 2
|0AD3DF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 05, Strip 3
|0AD3E7| db $B6, $F6, $C0, $10, $16, $50, $51, $01 ; Quadrant 3, Row 06, Strip 0
|0AD3EF| db $01, $01, $01, $68, $55, $41, $64, $56 ; Quadrant 3, Row 06, Strip 1
|0AD3F7| db $48, $4A, $3B, $3C, $3B, $28, $28, $28 ; Quadrant 3, Row 06, Strip 2
|0AD3FF| db $2F, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 06, Strip 3
|0AD407| db $33, $33, $C3, $20, $21, $60, $61, $AB ; Quadrant 3, Row 07, Strip 0
|0AD40F| db $97, $97, $BE, $68, $7A, $7B, $7B, $43 ; Quadrant 3, Row 07, Strip 1
|0AD417| db $5C, $35, $4A, $4B, $4A, $3B, $08, $29 ; Quadrant 3, Row 07, Strip 2
|0AD41F| db $3C, $3B, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 07, Strip 3
|0AD427| db $66, $45, $44, $66, $45, $34, $34, $64 ; Quadrant 3, Row 08, Strip 0
|0AD42F| db $AE, $AE, $A9, $68, $57, $C6, $67, $56 ; Quadrant 3, Row 08, Strip 1
|0AD437| db $58, $56, $35, $35, $35, $4C, $2F, $3C ; Quadrant 3, Row 08, Strip 2
|0AD43F| db $4B, $4C, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 08, Strip 3
|0AD447| db $67, $65, $64, $56, $75, $76, $96, $01 ; Quadrant 3, Row 09, Strip 0
|0AD44F| db $17, $11, $11, $B8, $53, $01, $02, $54 ; Quadrant 3, Row 09, Strip 1
|0AD457| db $35, $58, $39, $3A, $39, $28, $28, $5A ; Quadrant 3, Row 09, Strip 2
|0AD45F| db $39, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 09, Strip 3
|0AD467| db $B6, $B6, $B6, $54, $55, $10, $06, $07 ; Quadrant 3, Row 0A, Strip 0
|0AD46F| db $87, $97, $BE, $8F, $9F, $06, $12, $54 ; Quadrant 3, Row 0A, Strip 1
|0AD477| db $35, $39, $28, $2C, $2D, $28, $28, $2C ; Quadrant 3, Row 0A, Strip 2
|0AD47F| db $2D, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 3, Row 0A, Strip 3
|0AD487| db $BF, $B6, $B6, $54, $55, $10, $16, $17 ; Quadrant 3, Row 0B, Strip 0
|0AD48F| db $B9, $C6, $BA, $8F, $9F, $12, $12, $54 ; Quadrant 3, Row 0B, Strip 1
|0AD497| db $35, $3B, $08, $28, $2C, $28, $28, $28 ; Quadrant 3, Row 0B, Strip 2
|0AD49F| db $2C, $28, $28, $28, $28, $28, $08, $28 ; Quadrant 3, Row 0B, Strip 3
|0AD4A7| db $B6, $B6, $B6, $54, $47, $AA, $11, $11 ; Quadrant 3, Row 0C, Strip 0
|0AD4AF| db $16, $96, $17, $8F, $9F, $12, $22, $54 ; Quadrant 3, Row 0C, Strip 1
|0AD4B7| db $35, $4C, $2D, $28, $28, $28, $28, $28 ; Quadrant 3, Row 0C, Strip 2
|0AD4BF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 0C, Strip 3
|0AD4C7| db $B6, $30, $33, $54, $57, $F2, $11, $11 ; Quadrant 3, Row 0D, Strip 0
|0AD4CF| db $11, $11, $11, $A8, $A9, $95, $02, $54 ; Quadrant 3, Row 0D, Strip 1
|0AD4D7| db $39, $28, $2C, $2D, $28, $28, $08, $29 ; Quadrant 3, Row 0D, Strip 2
|0AD4DF| db $08, $29, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 0D, Strip 3
|0AD4E7| db $B6, $32, $34, $64, $65, $10, $11, $11 ; Quadrant 3, Row 0E, Strip 0
|0AD4EF| db $06, $21, $07, $11, $11, $06, $22, $54 ; Quadrant 3, Row 0E, Strip 1
|0AD4F7| db $3B, $28, $28, $2C, $28, $28, $28, $2C ; Quadrant 3, Row 0E, Strip 2
|0AD4FF| db $28, $2C, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 0E, Strip 3
|0AD507| db $30, $40, $34, $B6, $34, $20, $21, $21 ; Quadrant 3, Row 0F, Strip 0
|0AD50F| db $22, $34, $B6, $34, $34, $34, $B6, $54 ; Quadrant 3, Row 0F, Strip 1
|0AD517| db $39, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 0F, Strip 2
|0AD51F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 0F, Strip 3
|0AD527| db $66, $66, $66, $66, $66, $66, $66, $66 ; Quadrant 3, Row 10, Strip 0
|0AD52F| db $66, $66, $66, $66, $66, $66, $66, $46 ; Quadrant 3, Row 10, Strip 1
|0AD537| db $3B, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 10, Strip 2
|0AD53F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 10, Strip 3
|0AD547| db $3A, $48, $66, $66, $66, $49, $48, $49 ; Quadrant 3, Row 11, Strip 0
|0AD54F| db $39, $3A, $35, $35, $39, $3A, $35, $35 ; Quadrant 3, Row 11, Strip 1
|0AD557| db $39, $2D, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 11, Strip 2
|0AD55F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 11, Strip 3
|0AD567| db $2C, $3A, $39, $3A, $35, $47, $46, $39 ; Quadrant 3, Row 12, Strip 0
|0AD56F| db $28, $2C, $3A, $39, $28, $2C, $3A, $39 ; Quadrant 3, Row 12, Strip 1
|0AD577| db $28, $2C, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 12, Strip 2
|0AD57F| db $28, $28, $28, $28, $28, $08, $29, $08 ; Quadrant 3, Row 12, Strip 3
|0AD587| db $28, $2C, $2D, $2C, $3A, $35, $39, $28 ; Quadrant 3, Row 13, Strip 0
|0AD58F| db $28, $28, $2C, $08, $29, $28, $2C, $28 ; Quadrant 3, Row 13, Strip 1
|0AD597| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 13, Strip 2
|0AD59F| db $28, $28, $28, $28, $08, $28, $2C, $2D ; Quadrant 3, Row 13, Strip 3
|0AD5A7| db $28, $28, $2C, $28, $2C, $39, $28, $28 ; Quadrant 3, Row 14, Strip 0
|0AD5AF| db $28, $28, $28, $28, $2B, $09, $08, $29 ; Quadrant 3, Row 14, Strip 1
|0AD5B7| db $28, $28, $28, $28, $08, $29, $28, $28 ; Quadrant 3, Row 14, Strip 2
|0AD5BF| db $28, $28, $28, $28, $28, $28, $28, $2C ; Quadrant 3, Row 14, Strip 3
|0AD5C7| db $28, $28, $28, $28, $08, $29, $28, $28 ; Quadrant 3, Row 15, Strip 0
|0AD5CF| db $28, $28, $28, $28, $2C, $2A, $28, $2C ; Quadrant 3, Row 15, Strip 1
|0AD5D7| db $09, $28, $28, $08, $28, $2C, $09, $28 ; Quadrant 3, Row 15, Strip 2
|0AD5DF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 15, Strip 3
|0AD5E7| db $28, $28, $28, $08, $28, $2C, $2D, $28 ; Quadrant 3, Row 16, Strip 0
|0AD5EF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 16, Strip 1
|0AD5F7| db $08, $29, $08, $28, $28, $28, $2B, $09 ; Quadrant 3, Row 16, Strip 2
|0AD5FF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 16, Strip 3
|0AD607| db $29, $28, $08, $28, $28, $28, $2C, $28 ; Quadrant 3, Row 17, Strip 0
|0AD60F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 17, Strip 1
|0AD617| db $28, $2C, $2D, $28, $28, $28, $2C, $2E ; Quadrant 3, Row 17, Strip 2
|0AD61F| db $09, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 17, Strip 3
|0AD627| db $2C, $2D, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 18, Strip 0
|0AD62F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 18, Strip 1
|0AD637| db $28, $28, $2C, $28, $28, $28, $28, $2B ; Quadrant 3, Row 18, Strip 2
|0AD63F| db $2A, $29, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 18, Strip 3
|0AD647| db $28, $2C, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 19, Strip 0
|0AD64F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 19, Strip 1
|0AD657| db $28, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 3, Row 19, Strip 2
|0AD65F| db $09, $2C, $09, $28, $28, $28, $28, $28 ; Quadrant 3, Row 19, Strip 3
|0AD667| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1A, Strip 0
|0AD66F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1A, Strip 1
|0AD677| db $28, $28, $28, $28, $28, $28, $08, $28 ; Quadrant 3, Row 1A, Strip 2
|0AD67F| db $28, $28, $2B, $09, $28, $28, $28, $28 ; Quadrant 3, Row 1A, Strip 3
|0AD687| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1B, Strip 0
|0AD68F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1B, Strip 1
|0AD697| db $28, $28, $28, $28, $28, $08, $28, $28 ; Quadrant 3, Row 1B, Strip 2
|0AD69F| db $28, $28, $2C, $2E, $2D, $28, $28, $28 ; Quadrant 3, Row 1B, Strip 3
|0AD6A7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1C, Strip 0
|0AD6AF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1C, Strip 1
|0AD6B7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1C, Strip 2
|0AD6BF| db $28, $28, $28, $2B, $2A, $28, $28, $28 ; Quadrant 3, Row 1C, Strip 3
|0AD6C7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1D, Strip 0
|0AD6CF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1D, Strip 1
|0AD6D7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1D, Strip 2
|0AD6DF| db $28, $28, $28, $2A, $28, $28, $28, $28 ; Quadrant 3, Row 1D, Strip 3
|0AD6E7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1E, Strip 0
|0AD6EF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1E, Strip 1
|0AD6F7| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1E, Strip 2
|0AD6FF| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1E, Strip 3
|0AD707| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1F, Strip 0
|0AD70F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1F, Strip 1
|0AD717| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1F, Strip 2
|0AD71F| db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1F, Strip 3

;===================================================================================================

WorldMap_DarkWorldTilemap:
|0AD727| db $26, $27, $14, $14, $14, $A5, $14, $26 ; Row 00, Strip 0
|0AD72F| db $24, $25, $56, $35, $5B, $73, $74, $28 ; Row 00, Strip 1
|0AD737| db $72, $99, $63, $73, $73, $74, $2C, $72 ; Row 00, Strip 2
|0AD73F| db $73, $73, $73, $A1, $A0, $73, $73, $74 ; Row 00, Strip 3
|0AD747| db $36, $37, $14, $14, $14, $14, $14, $15 ; Row 01, Strip 0
|0AD74F| db $34, $A7, $64, $5B, $90, $73, $73, $73 ; Row 01, Strip 1
|0AD757| db $73, $9A, $70, $A0, $73, $91, $09, $90 ; Row 01, Strip 2
|0AD75F| db $73, $73, $A1, $84, $90, $73, $FF, $91 ; Row 01, Strip 3
|0AD767| db $14, $14, $14, $14, $14, $14, $14, $15 ; Row 02, Strip 0
|0AD76F| db $A7, $34, $E4, $90, $82, $83, $83, $83 ; Row 02, Strip 1
|0AD777| db $83, $83, $84, $82, $83, $83, $83, $83 ; Row 02, Strip 2
|0AD77F| db $83, $83, $84, $B3, $82, $83, $83, $84 ; Row 02, Strip 3
|0AD787| db $A5, $14, $14, $14, $A5, $14, $14, $15 ; Row 03, Strip 0
|0AD78F| db $A7, $B6, $DF, $82, $B2, $93, $93, $93 ; Row 03, Strip 1
|0AD797| db $93, $93, $94, $92, $93, $94, $72, $93 ; Row 03, Strip 2
|0AD79F| db $93, $93, $B3, $91, $B4, $93, $93, $A2 ; Row 03, Strip 3
|0AD7A7| db $14, $A5, $14, $14, $14, $14, $14, $15 ; Row 04, Strip 0
|0AD7AF| db $34, $A7, $82, $B2, $93, $93, $93, $93 ; Row 04, Strip 1
|0AD7B7| db $93, $93, $94, $92, $93, $94, $82, $93 ; Row 04, Strip 2
|0AD7BF| db $82, $83, $83, $84, $CA, $CA, $CA, $8F ; Row 04, Strip 3
|0AD7C7| db $14, $14, $14, $14, $A5, $14, $A5, $36 ; Row 05, Strip 0
|0AD7CF| db $05, $34, $B0, $D6, $93, $82, $83, $83 ; Row 05, Strip 1
|0AD7D7| db $83, $84, $B3, $B2, $93, $B3, $B4, $90 ; Row 05, Strip 2
|0AD7DF| db $B2, $93, $93, $B3, $BE, $11, $95, $54 ; Row 05, Strip 3
|0AD7E7| db $A5, $14, $14, $A5, $14, $A5, $14, $14 ; Row 06, Strip 0
|0AD7EF| db $15, $33, $33, $33, $90, $B2, $93, $93 ; Row 06, Strip 1
|0AD7F7| db $93, $B3, $73, $A1, $83, $84, $11, $90 ; Row 06, Strip 2
|0AD7FF| db $73, $73, $73, $91, $9F, $06, $22, $54 ; Row 06, Strip 3
|0AD807| db $14, $14, $A5, $A5, $14, $14, $14, $A5 ; Row 07, Strip 0
|0AD80F| db $15, $A6, $FB, $34, $82, $83, $83, $83 ; Row 07, Strip 1
|0AD817| db $83, $83, $83, $84, $93, $94, $CA, $82 ; Row 07, Strip 2
|0AD81F| db $83, $83, $83, $84, $A9, $16, $02, $54 ; Row 07, Strip 3
|0AD827| db $26, $27, $26, $27, $26, $24, $24, $D5 ; Row 08, Strip 0
|0AD82F| db $25, $34, $34, $34, $B0, $93, $D6, $93 ; Row 08, Strip 1
|0AD837| db $93, $93, $93, $A4, $93, $A4, $CA, $B4 ; Row 08, Strip 2
|0AD83F| db $93, $93, $93, $B7, $11, $11, $12, $54 ; Row 08, Strip 3
|0AD847| db $15, $13, $15, $13, $15, $33, $40, $41 ; Row 09, Strip 0
|0AD84F| db $33, $BF, $34, $34, $30, $FB, $C0, $23 ; Row 09, Strip 1
|0AD857| db $24, $24, $24, $25, $00, $17, $06, $21 ; Row 09, Strip 2
|0AD85F| db $21, $21, $21, $21, $21, $21, $22, $54 ; Row 09, Strip 3
|0AD867| db $15, $13, $15, $13, $15, $BC, $BD, $A6 ; Row 0A, Strip 0
|0AD86F| db $A7, $34, $41, $33, $40, $34, $C0, $34 ; Row 0A, Strip 1
|0AD877| db $B6, $80, $80, $B6, $20, $07, $95, $A6 ; Row 0A, Strip 2
|0AD87F| db $A6, $F6, $A7, $44, $45, $34, $41, $54 ; Row 0A, Strip 3
|0AD887| db $15, $13, $15, $13, $36, $05, $D0, $D0 ; Row 0B, Strip 0
|0AD88F| db $D0, $D0, $D0, $D0, $D0, $D0, $C3, $D0 ; Row 0B, Strip 1
|0AD897| db $D0, $D0, $D0, $D0, $D0, $10, $06, $77 ; Row 0B, Strip 2
|0AD89F| db $7B, $7B, $7B, $43, $7A, $7B, $8D, $8E ; Row 0B, Strip 3
|0AD8A7| db $15, $23, $25, $23, $24, $25, $C0, $A6 ; Row 0C, Strip 0
|0AD8AF| db $FB, $A7, $A6, $00, $EA, $E8, $E8, $E8 ; Row 0C, Strip 1
|0AD8B7| db $E9, $E9, $E9, $EB, $02, $10, $12, $54 ; Row 0C, Strip 2
|0AD8BF| db $57, $9D, $9D, $9D, $9D, $9D, $C8, $C9 ; Row 0C, Strip 3
|0AD8C7| db $25, $31, $B6, $34, $6E, $6E, $C0, $10 ; Row 0D, Strip 0
|0AD8CF| db $12, $A7, $A6, $10, $C4, $D9, $D9, $D7 ; Row 0D, Strip 1
|0AD8D7| db $E7, $DA, $DA, $D4, $12, $10, $12, $54 ; Row 0D, Strip 2
|0AD8DF| db $C7, $E2, $E2, $E2, $E2, $F1, $89, $54 ; Row 0D, Strip 3
|0AD8E7| db $34, $41, $33, $33, $33, $33, $C0, $10 ; Row 0E, Strip 0
|0AD8EF| db $12, $A6, $F6, $10, $C4, $D9, $D7, $D8 ; Row 0E, Strip 1
|0AD8F7| db $EC, $E7, $DA, $D4, $12, $10, $12, $54 ; Row 0E, Strip 2
|0AD8FF| db $C7, $E2, $E2, $E2, $E2, $E1, $F1, $54 ; Row 0E, Strip 3
|0AD907| db $34, $F6, $89, $6B, $6C, $89, $F6, $10 ; Row 0F, Strip 0
|0AD90F| db $12, $FB, $FB, $10, $C4, $D7, $EC, $D8 ; Row 0F, Strip 1
|0AD917| db $D8, $D8, $E7, $D4, $F3, $F4, $22, $54 ; Row 0F, Strip 2
|0AD91F| db $C7, $E2, $E1, $E1, $E2, $E1, $F1, $54 ; Row 0F, Strip 3
|0AD927| db $34, $B6, $34, $3E, $5E, $88, $88, $10 ; Row 10, Strip 0
|0AD92F| db $12, $A6, $A6, $10, $D1, $D8, $D8, $EC ; Row 10, Strip 1
|0AD937| db $EC, $D8, $D8, $E5, $12, $FC, $FC, $5C ; Row 10, Strip 2
|0AD93F| db $C7, $E0, $6D, $7D, $E0, $E1, $F1, $54 ; Row 10, Strip 3
|0AD947| db $88, $88, $E3, $BD, $E3, $BD, $F6, $10 ; Row 11, Strip 0
|0AD94F| db $12, $E3, $BD, $10, $12, $34, $A7, $89 ; Row 11, Strip 1
|0AD957| db $89, $A7, $34, $20, $22, $FC, $FC, $5C ; Row 11, Strip 2
|0AD95F| db $C7, $E2, $E1, $E2, $E2, $F1, $89, $54 ; Row 11, Strip 3
|0AD967| db $34, $A7, $34, $34, $34, $34, $A7, $20 ; Row 12, Strip 0
|0AD96F| db $22, $33, $33, $10, $16, $01, $01, $01 ; Row 12, Strip 1
|0AD977| db $01, $01, $01, $01, $02, $FC, $FC, $5C ; Row 12, Strip 2
|0AD97F| db $55, $F0, $89, $F0, $F0, $FB, $A7, $54 ; Row 12, Strip 3
|0AD987| db $CF, $04, $04, $CB, $04, $BB, $C0, $03 ; Row 13, Strip 0
|0AD98F| db $04, $04, $04, $DB, $E6, $21, $21, $21 ; Row 13, Strip 1
|0AD997| db $21, $21, $21, $07, $12, $FC, $FC, $5C ; Row 13, Strip 2
|0AD99F| db $55, $77, $7B, $7B, $7B, $7B, $7C, $54 ; Row 13, Strip 3
|0AD9A7| db $69, $24, $24, $27, $26, $25, $C0, $13 ; Row 14, Strip 0
|0AD9AF| db $26, $24, $24, $27, $15, $A7, $FB, $FB ; Row 14, Strip 1
|0AD9B7| db $FB, $A7, $C0, $10, $12, $FC, $FC, $5C ; Row 14, Strip 2
|0AD9BF| db $55, $64, $67, $56, $57, $67, $65, $54 ; Row 14, Strip 3
|0AD9C7| db $55, $34, $34, $13, $15, $33, $33, $13 ; Row 15, Strip 0
|0AD9CF| db $15, $FB, $A7, $13, $15, $A7, $FB, $FB ; Row 15, Strip 1
|0AD9D7| db $FB, $B6, $C0, $10, $12, $34, $34, $64 ; Row 15, Strip 2
|0AD9DF| db $65, $A6, $A6, $54, $55, $31, $44, $46 ; Row 15, Strip 3
|0AD9E7| db $55, $33, $31, $23, $25, $33, $F6, $13 ; Row 16, Strip 0
|0AD9EF| db $15, $A7, $FB, $13, $15, $A7, $A6, $34 ; Row 16, Strip 1
|0AD9F7| db $B6, $F6, $C0, $10, $16, $02, $00, $96 ; Row 16, Strip 2
|0AD9FF| db $01, $01, $01, $68, $55, $41, $64, $56 ; Row 16, Strip 3
|0ADA07| db $7A, $7B, $7B, $7B, $7B, $7B, $7C, $23 ; Row 17, Strip 0
|0ADA0F| db $36, $05, $03, $37, $15, $A7, $41, $33 ; Row 17, Strip 1
|0ADA17| db $33, $33, $C3, $20, $21, $22, $20, $AB ; Row 17, Strip 2
|0ADA1F| db $97, $97, $BE, $68, $7A, $7B, $7B, $43 ; Row 17, Strip 3
|0ADA27| db $9D, $9D, $9D, $9D, $9D, $56, $55, $A6 ; Row 18, Strip 0
|0ADA2F| db $23, $25, $23, $24, $25, $34, $44, $66 ; Row 18, Strip 1
|0ADA37| db $66, $45, $44, $66, $45, $34, $34, $64 ; Row 18, Strip 2
|0ADA3F| db $AE, $AE, $A9, $68, $57, $C6, $67, $56 ; Row 18, Strip 3
|0ADA47| db $9F, $DD, $DD, $DD, $11, $8F, $47, $66 ; Row 19, Strip 0
|0ADA4F| db $45, $D0, $D0, $D0, $C3, $34, $AF, $67 ; Row 19, Strip 1
|0ADA57| db $67, $65, $64, $56, $75, $76, $01, $01 ; Row 19, Strip 2
|0ADA5F| db $17, $11, $11, $B8, $53, $96, $02, $54 ; Row 19, Strip 3
|0ADA67| db $9F, $11, $11, $11, $11, $A8, $56, $35 ; Row 1A, Strip 0
|0ADA6F| db $55, $77, $7C, $A7, $34, $B1, $AD, $B6 ; Row 1A, Strip 1
|0ADA77| db $B6, $B6, $B6, $54, $55, $10, $11, $11 ; Row 1A, Strip 2
|0ADA7F| db $11, $11, $11, $8F, $9F, $06, $12, $54 ; Row 1A, Strip 3
|0ADA87| db $9F, $ED, $ED, $11, $ED, $11, $A8, $56 ; Row 1B, Strip 0
|0ADA8F| db $7A, $43, $7A, $7B, $7B, $D3, $AC, $BF ; Row 1B, Strip 1
|0ADA97| db $BF, $B6, $B6, $54, $55, $10, $11, $11 ; Row 1B, Strip 2
|0ADA9F| db $F7, $F8, $11, $8F, $9F, $12, $22, $54 ; Row 1B, Strip 3
|0ADAA7| db $9F, $ED, $11, $11, $11, $ED, $11, $54 ; Row 1C, Strip 0
|0ADAAF| db $57, $56, $57, $56, $57, $65, $B6, $B6 ; Row 1C, Strip 1
|0ADAB7| db $B6, $B6, $B6, $54, $47, $AA, $11, $11 ; Row 1C, Strip 2
|0ADABF| db $F9, $FA, $11, $8F, $9F, $12, $34, $54 ; Row 1C, Strip 3
|0ADAC7| db $A9, $11, $11, $ED, $11, $11, $11, $54 ; Row 1D, Strip 0
|0ADACF| db $55, $64, $65, $54, $55, $B6, $B6, $B6 ; Row 1D, Strip 1
|0ADAD7| db $B6, $30, $33, $54, $57, $F2, $11, $11 ; Row 1D, Strip 2
|0ADADF| db $11, $11, $11, $A8, $A9, $95, $02, $54 ; Row 1D, Strip 3
|0ADAE7| db $11, $11, $ED, $11, $11, $ED, $11, $54 ; Row 1E, Strip 0
|0ADAEF| db $7A, $7F, $6F, $C1, $65, $B6, $79, $F5 ; Row 1E, Strip 1
|0ADAF7| db $B6, $32, $34, $64, $65, $20, $07, $11 ; Row 1E, Strip 2
|0ADAFF| db $11, $11, $11, $11, $06, $21, $22, $54 ; Row 1E, Strip 3
|0ADB07| db $21, $07, $11, $ED, $11, $ED, $06, $54 ; Row 1F, Strip 0
|0ADB0F| db $35, $47, $46, $55, $B6, $B6, $B6, $B6 ; Row 1F, Strip 1
|0ADB17| db $30, $40, $34, $B6, $34, $34, $10, $11 ; Row 1F, Strip 2
|0ADB1F| db $11, $11, $06, $21, $22, $34, $B6, $54 ; Row 1F, Strip 3

;===================================================================================================

Palettes_OWMAP:

Palettes_LWMAP:
|0ADB27| dw  $0000,  $094B,  $1563,  $1203,  $2995,  $5BDF,  $2191,  $2E37
|0ADB37| dw  $7C1F,  $6F37,  $7359,  $777A,  $7B9B,  $7FBD,  $0000,  $0000
|0ADB47| dw  $0000,  $0100,  $0000,  $0000,  $7B9B,  $11B6,  $1A9B,  $5FFF
|0ADB57| dw  $2995,  $6E94,  $76D6,  $7F39,  $7F7B,  $7FBD,  $0000,  $0000
|0ADB67| dw  $0000,  $0100,  $1D74,  $67F9,  $1EE9,  $338E,  $6144,  $7E6A
|0ADB77| dw  $0A44,  $7C1F,  $6144,  $22EB,  $3DCA,  $5ED2,  $7FDA,  $316A
|0ADB87| dw  $0000,  $0100,  $14CC,  $1910,  $2995,  $3E3A,  $1963,  $15E3
|0ADB97| dw  $25F5,  $2E37,  $15E3,  $22EB,  $6144,  $7E33,  $5D99,  $771D
|0ADBA7| dw  $0000,  $0CEC,  $22EB,  $2FB1,  $1D70,  $2E37,  $25F5,  $3E77
|0ADBB7| dw  $473A,  $6144,  $7E6A,  $15E3,  $2E0B,  $5354,  $7FFF,  $16A6
|0ADBC7| dw  $0000,  $0100,  $15C5,  $16A6,  $1EE9,  $2F4D,  $25F5,  $3E77
|0ADBD7| dw  $473A,  $5354,  $15E3,  $22EB,  $2918,  $4A1F,  $3F7F,  $7C1F
|0ADBE7| dw  $0000,  $0100,  $1563,  $1203,  $1EE9,  $2FB0,  $1D70,  $2E37
|0ADBF7| dw  $473A,  $6144,  $15E3,  $22EB,  $1D70,  $2E37,  $4F3F,  $7FBD
|0ADC07| dw  $0000,  $0000,  $0000,  $0000,  $0000,  $0000,  $0000,  $25F5
|0ADC17| dw  $316A,  $5ED2,  $7FFF,  $15E3,  $473A,  $2918,  $771D,  $0000

;===================================================================================================

Palettes_DWMAP:
|0ADC27| dw  $0000,  $18C6,  $0948,  $118A,  $25CF,  $57BF,  $1971,  $2A18
|0ADC37| dw  $7C1F,  $52D8,  $5AF9,  $5F1A,  $633B,  $6B5C,  $0000,  $0000
|0ADC47| dw  $0000,  $18C6,  $0005,  $45FC,  $633B,  $1DCE,  $3694,  $4718
|0ADC57| dw  $25CF,  $1D40,  $34EA,  $616F,  $771B,  $26D6,  $2B18,  $2F5A
|0ADC67| dw  $0000,  $18C6,  $2571,  $63DA,  $2A32,  $3A94,  $1D40,  $2580
|0ADC77| dw  $7C1F,  $7C1F,  $0CC0,  $1ECC,  $3135,  $1DCE,  $4718,  $3694
|0ADC87| dw  $0000,  $18C6,  $14E7,  $216C,  $25D0,  $3A75,  $2169,  $2E0E
|0ADC97| dw  $21D6,  $2A18,  $1971,  $2A32,  $1D40,  $2580,  $597A,  $72FE
|0ADCA7| dw  $0000,  $18C6,  $2A32,  $3A94,  $2171,  $3238,  $29F6,  $4278
|0ADCB7| dw  $4EDB,  $1D40,  $35CD,  $15AB,  $198E,  $3254,  $731F,  $1ED4
|0ADCC7| dw  $0000,  $18C6,  $016A,  $21CE,  $2A32,  $3A94,  $29F6,  $4278
|0ADCD7| dw  $4EDB,  $1D40,  $1971,  $2A32,  $496C,  $5A10,  $3B5F,  $7C1F
|0ADCE7| dw  $0000,  $18C6,  $0948,  $118A,  $222E,  $32F2,  $1951,  $2A18
|0ADCF7| dw  $431B,  $1D40,  $1971,  $2A32,  $21D4,  $2A18,  $4B1F,  $7B9D
|0ADD07| dw  $0000,  $7C1F,  $7C1F,  $7C1F,  $7C1F,  $2E31,  $00E4,  $2169
|0ADD17| dw  $2E0E,  $42F1,  $7C1F,  $7C1F,  $7C1F,  $4A1D,  $4E3F,  $5A5F

;===================================================================================================

WorldMapHDMA_ZoomedOut_Part1:
|0ADD27| dw $0177 ; scanline   0
|0ADD29| dw $0176 ; scanline   1
|0ADD2B| dw $0175 ; scanline   2
|0ADD2D| dw $0175 ; scanline   3
|0ADD2F| dw $0174 ; scanline   4
|0ADD31| dw $0173 ; scanline   5
|0ADD33| dw $0173 ; scanline   6
|0ADD35| dw $0172 ; scanline   7
|0ADD37| dw $0171 ; scanline   8
|0ADD39| dw $0171 ; scanline   9
|0ADD3B| dw $0170 ; scanline  10
|0ADD3D| dw $016F ; scanline  11
|0ADD3F| dw $016F ; scanline  12
|0ADD41| dw $016E ; scanline  13
|0ADD43| dw $016D ; scanline  14
|0ADD45| dw $016D ; scanline  15
|0ADD47| dw $016C ; scanline  16
|0ADD49| dw $016B ; scanline  17
|0ADD4B| dw $016B ; scanline  18
|0ADD4D| dw $0169 ; scanline  19
|0ADD4F| dw $0169 ; scanline  20
|0ADD51| dw $0168 ; scanline  21
|0ADD53| dw $0167 ; scanline  22
|0ADD55| dw $0167 ; scanline  23
|0ADD57| dw $0166 ; scanline  24
|0ADD59| dw $0165 ; scanline  25
|0ADD5B| dw $0165 ; scanline  26
|0ADD5D| dw $0164 ; scanline  27
|0ADD5F| dw $0163 ; scanline  28
|0ADD61| dw $0163 ; scanline  29
|0ADD63| dw $0162 ; scanline  30
|0ADD65| dw $0162 ; scanline  31
|0ADD67| dw $0161 ; scanline  32
|0ADD69| dw $0160 ; scanline  33
|0ADD6B| dw $0160 ; scanline  34
|0ADD6D| dw $015F ; scanline  35
|0ADD6F| dw $015F ; scanline  36
|0ADD71| dw $015E ; scanline  37
|0ADD73| dw $015D ; scanline  38
|0ADD75| dw $015D ; scanline  39
|0ADD77| dw $015C ; scanline  40
|0ADD79| dw $015C ; scanline  41
|0ADD7B| dw $015B ; scanline  42
|0ADD7D| dw $015A ; scanline  43
|0ADD7F| dw $015A ; scanline  44
|0ADD81| dw $0159 ; scanline  45
|0ADD83| dw $0159 ; scanline  46
|0ADD85| dw $0158 ; scanline  47
|0ADD87| dw $0157 ; scanline  48
|0ADD89| dw $0157 ; scanline  49
|0ADD8B| dw $0156 ; scanline  50
|0ADD8D| dw $0156 ; scanline  51
|0ADD8F| dw $0155 ; scanline  52
|0ADD91| dw $0155 ; scanline  53
|0ADD93| dw $0154 ; scanline  54
|0ADD95| dw $0153 ; scanline  55
|0ADD97| dw $0153 ; scanline  56
|0ADD99| dw $0152 ; scanline  57
|0ADD9B| dw $0152 ; scanline  58
|0ADD9D| dw $0151 ; scanline  59
|0ADD9F| dw $0151 ; scanline  60
|0ADDA1| dw $0150 ; scanline  61
|0ADDA3| dw $014F ; scanline  62
|0ADDA5| dw $014F ; scanline  63
|0ADDA7| dw $014E ; scanline  64
|0ADDA9| dw $014E ; scanline  65
|0ADDAB| dw $014D ; scanline  66
|0ADDAD| dw $014D ; scanline  67
|0ADDAF| dw $014C ; scanline  68
|0ADDB1| dw $014C ; scanline  69
|0ADDB3| dw $014B ; scanline  70
|0ADDB5| dw $014B ; scanline  71
|0ADDB7| dw $014A ; scanline  72
|0ADDB9| dw $014A ; scanline  73
|0ADDBB| dw $0148 ; scanline  74
|0ADDBD| dw $0147 ; scanline  75
|0ADDBF| dw $0147 ; scanline  76
|0ADDC1| dw $0146 ; scanline  77
|0ADDC3| dw $0146 ; scanline  78
|0ADDC5| dw $0145 ; scanline  79
|0ADDC7| dw $0145 ; scanline  80
|0ADDC9| dw $0144 ; scanline  81
|0ADDCB| dw $0144 ; scanline  82
|0ADDCD| dw $0143 ; scanline  83
|0ADDCF| dw $0143 ; scanline  84
|0ADDD1| dw $0142 ; scanline  85
|0ADDD3| dw $0142 ; scanline  86
|0ADDD5| dw $0141 ; scanline  87
|0ADDD7| dw $0141 ; scanline  88
|0ADDD9| dw $0140 ; scanline  89
|0ADDDB| dw $0140 ; scanline  90
|0ADDDD| dw $013F ; scanline  91
|0ADDDF| dw $013F ; scanline  92
|0ADDE1| dw $013E ; scanline  93
|0ADDE3| dw $013E ; scanline  94
|0ADDE5| dw $013D ; scanline  95
|0ADDE7| dw $013D ; scanline  96
|0ADDE9| dw $013C ; scanline  97
|0ADDEB| dw $013C ; scanline  98
|0ADDED| dw $013B ; scanline  99
|0ADDEF| dw $013B ; scanline 100
|0ADDF1| dw $013A ; scanline 101
|0ADDF3| dw $013A ; scanline 102
|0ADDF5| dw $0139 ; scanline 103
|0ADDF7| dw $0139 ; scanline 104
|0ADDF9| dw $0138 ; scanline 105
|0ADDFB| dw $0138 ; scanline 106
|0ADDFD| dw $0137 ; scanline 107
|0ADDFF| dw $0137 ; scanline 108
|0ADE01| dw $0136 ; scanline 109
|0ADE03| dw $0136 ; scanline 110
|0ADE05| dw $0135 ; scanline 111

;---------------------------------------------------------------------------------------------------

WorldMapHDMA_ZoomedOut_Part2:
|0ADE07| dw $0135 ; scanline 112
|0ADE09| dw $0135 ; scanline 113
|0ADE0B| dw $0134 ; scanline 114
|0ADE0D| dw $0134 ; scanline 115
|0ADE0F| dw $0133 ; scanline 116
|0ADE11| dw $0133 ; scanline 117
|0ADE13| dw $0132 ; scanline 118
|0ADE15| dw $0132 ; scanline 119
|0ADE17| dw $0131 ; scanline 120
|0ADE19| dw $0131 ; scanline 121
|0ADE1B| dw $0130 ; scanline 122
|0ADE1D| dw $0130 ; scanline 123
|0ADE1F| dw $012F ; scanline 124
|0ADE21| dw $012F ; scanline 125
|0ADE23| dw $012F ; scanline 126
|0ADE25| dw $012E ; scanline 127
|0ADE27| dw $012E ; scanline 128
|0ADE29| dw $012D ; scanline 129
|0ADE2B| dw $012D ; scanline 130
|0ADE2D| dw $012C ; scanline 131
|0ADE2F| dw $012C ; scanline 132
|0ADE31| dw $012B ; scanline 133
|0ADE33| dw $012B ; scanline 134
|0ADE35| dw $012B ; scanline 135
|0ADE37| dw $012A ; scanline 136
|0ADE39| dw $012A ; scanline 137
|0ADE3B| dw $0129 ; scanline 138
|0ADE3D| dw $0129 ; scanline 139
|0ADE3F| dw $0127 ; scanline 140
|0ADE41| dw $0127 ; scanline 141
|0ADE43| dw $0126 ; scanline 142
|0ADE45| dw $0126 ; scanline 143
|0ADE47| dw $0126 ; scanline 144
|0ADE49| dw $0125 ; scanline 145
|0ADE4B| dw $0125 ; scanline 146
|0ADE4D| dw $0124 ; scanline 147
|0ADE4F| dw $0124 ; scanline 148
|0ADE51| dw $0124 ; scanline 149
|0ADE53| dw $0123 ; scanline 150
|0ADE55| dw $0123 ; scanline 151
|0ADE57| dw $0122 ; scanline 152
|0ADE59| dw $0122 ; scanline 153
|0ADE5B| dw $0121 ; scanline 154
|0ADE5D| dw $0121 ; scanline 155
|0ADE5F| dw $0121 ; scanline 156
|0ADE61| dw $0120 ; scanline 157
|0ADE63| dw $0120 ; scanline 158
|0ADE65| dw $011F ; scanline 159
|0ADE67| dw $011F ; scanline 160
|0ADE69| dw $011F ; scanline 161
|0ADE6B| dw $011E ; scanline 162
|0ADE6D| dw $011E ; scanline 163
|0ADE6F| dw $011D ; scanline 164
|0ADE71| dw $011D ; scanline 165
|0ADE73| dw $011D ; scanline 166
|0ADE75| dw $011C ; scanline 167
|0ADE77| dw $011C ; scanline 168
|0ADE79| dw $011B ; scanline 169
|0ADE7B| dw $011B ; scanline 170
|0ADE7D| dw $011B ; scanline 171
|0ADE7F| dw $011A ; scanline 172
|0ADE81| dw $011A ; scanline 173
|0ADE83| dw $0119 ; scanline 174
|0ADE85| dw $0119 ; scanline 175
|0ADE87| dw $0119 ; scanline 176
|0ADE89| dw $0118 ; scanline 177
|0ADE8B| dw $0118 ; scanline 178
|0ADE8D| dw $0117 ; scanline 179
|0ADE8F| dw $0117 ; scanline 180
|0ADE91| dw $0117 ; scanline 181
|0ADE93| dw $0116 ; scanline 182
|0ADE95| dw $0116 ; scanline 183
|0ADE97| dw $0116 ; scanline 184
|0ADE99| dw $0115 ; scanline 185
|0ADE9B| dw $0115 ; scanline 186
|0ADE9D| dw $0114 ; scanline 187
|0ADE9F| dw $0114 ; scanline 188
|0ADEA1| dw $0114 ; scanline 189
|0ADEA3| dw $0113 ; scanline 190
|0ADEA5| dw $0113 ; scanline 191
|0ADEA7| dw $0113 ; scanline 192
|0ADEA9| dw $0112 ; scanline 193
|0ADEAB| dw $0112 ; scanline 194
|0ADEAD| dw $0111 ; scanline 195
|0ADEAF| dw $0111 ; scanline 196
|0ADEB1| dw $0111 ; scanline 197
|0ADEB3| dw $0110 ; scanline 198
|0ADEB5| dw $0110 ; scanline 199
|0ADEB7| dw $0110 ; scanline 200
|0ADEB9| dw $010F ; scanline 201
|0ADEBB| dw $010F ; scanline 202
|0ADEBD| dw $010F ; scanline 203
|0ADEBF| dw $010E ; scanline 204
|0ADEC1| dw $010E ; scanline 205
|0ADEC3| dw $010D ; scanline 206
|0ADEC5| dw $010D ; scanline 207
|0ADEC7| dw $010D ; scanline 208
|0ADEC9| dw $010C ; scanline 209
|0ADECB| dw $010C ; scanline 210
|0ADECD| dw $010C ; scanline 211
|0ADECF| dw $010B ; scanline 212
|0ADED1| dw $010B ; scanline 213
|0ADED3| dw $010B ; scanline 214
|0ADED5| dw $010A ; scanline 215
|0ADED7| dw $010A ; scanline 216
|0ADED9| dw $010A ; scanline 217
|0ADEDB| dw $0109 ; scanline 218
|0ADEDD| dw $0109 ; scanline 219
|0ADEDF| dw $0109 ; scanline 220
|0ADEE1| dw $0108 ; scanline 221
|0ADEE3| dw $0108 ; scanline 222
|0ADEE5| dw $0108 ; scanline 223

;===================================================================================================

WorldMapHDMA_ZoomedIn_Part1:
|0ADEE7| dw $0088 ; scanline   0
|0ADEE9| dw $0088 ; scanline   1
|0ADEEB| dw $0087 ; scanline   2
|0ADEED| dw $0087 ; scanline   3
|0ADEEF| dw $0087 ; scanline   4
|0ADEF1| dw $0087 ; scanline   5
|0ADEF3| dw $0087 ; scanline   6
|0ADEF5| dw $0086 ; scanline   7
|0ADEF7| dw $0086 ; scanline   8
|0ADEF9| dw $0086 ; scanline   9
|0ADEFB| dw $0085 ; scanline  10
|0ADEFD| dw $0085 ; scanline  11
|0ADEFF| dw $0085 ; scanline  12
|0ADF01| dw $0085 ; scanline  13
|0ADF03| dw $0084 ; scanline  14
|0ADF05| dw $0084 ; scanline  15
|0ADF07| dw $0084 ; scanline  16
|0ADF09| dw $0084 ; scanline  17
|0ADF0B| dw $0084 ; scanline  18
|0ADF0D| dw $0083 ; scanline  19
|0ADF0F| dw $0083 ; scanline  20
|0ADF11| dw $0083 ; scanline  21
|0ADF13| dw $0082 ; scanline  22
|0ADF15| dw $0082 ; scanline  23
|0ADF17| dw $0082 ; scanline  24
|0ADF19| dw $0082 ; scanline  25
|0ADF1B| dw $0082 ; scanline  26
|0ADF1D| dw $0081 ; scanline  27
|0ADF1F| dw $0081 ; scanline  28
|0ADF21| dw $0081 ; scanline  29
|0ADF23| dw $0081 ; scanline  30
|0ADF25| dw $0081 ; scanline  31
|0ADF27| dw $0080 ; scanline  32
|0ADF29| dw $0080 ; scanline  33
|0ADF2B| dw $0080 ; scanline  34
|0ADF2D| dw $007F ; scanline  35
|0ADF2F| dw $007F ; scanline  36
|0ADF31| dw $007F ; scanline  37
|0ADF33| dw $007F ; scanline  38
|0ADF35| dw $007F ; scanline  39
|0ADF37| dw $007E ; scanline  40
|0ADF39| dw $007E ; scanline  41
|0ADF3B| dw $007E ; scanline  42
|0ADF3D| dw $007E ; scanline  43
|0ADF3F| dw $007E ; scanline  44
|0ADF41| dw $007D ; scanline  45
|0ADF43| dw $007D ; scanline  46
|0ADF45| dw $007D ; scanline  47
|0ADF47| dw $007C ; scanline  48
|0ADF49| dw $007C ; scanline  49
|0ADF4B| dw $007C ; scanline  50
|0ADF4D| dw $007C ; scanline  51
|0ADF4F| dw $007C ; scanline  52
|0ADF51| dw $007C ; scanline  53
|0ADF53| dw $007B ; scanline  54
|0ADF55| dw $007B ; scanline  55
|0ADF57| dw $007B ; scanline  56
|0ADF59| dw $007B ; scanline  57
|0ADF5B| dw $007B ; scanline  58
|0ADF5D| dw $007A ; scanline  59
|0ADF5F| dw $007A ; scanline  60
|0ADF61| dw $007A ; scanline  61
|0ADF63| dw $0079 ; scanline  62
|0ADF65| dw $0079 ; scanline  63
|0ADF67| dw $0079 ; scanline  64
|0ADF69| dw $0079 ; scanline  65
|0ADF6B| dw $0079 ; scanline  66
|0ADF6D| dw $0079 ; scanline  67
|0ADF6F| dw $0078 ; scanline  68
|0ADF71| dw $0078 ; scanline  69
|0ADF73| dw $0078 ; scanline  70
|0ADF75| dw $0078 ; scanline  71
|0ADF77| dw $0078 ; scanline  72
|0ADF79| dw $0078 ; scanline  73
|0ADF7B| dw $0077 ; scanline  74
|0ADF7D| dw $0077 ; scanline  75
|0ADF7F| dw $0077 ; scanline  76
|0ADF81| dw $0076 ; scanline  77
|0ADF83| dw $0076 ; scanline  78
|0ADF85| dw $0076 ; scanline  79
|0ADF87| dw $0076 ; scanline  80
|0ADF89| dw $0076 ; scanline  81
|0ADF8B| dw $0076 ; scanline  82
|0ADF8D| dw $0075 ; scanline  83
|0ADF8F| dw $0075 ; scanline  84
|0ADF91| dw $0075 ; scanline  85
|0ADF93| dw $0075 ; scanline  86
|0ADF95| dw $0075 ; scanline  87
|0ADF97| dw $0075 ; scanline  88
|0ADF99| dw $0074 ; scanline  89
|0ADF9B| dw $0074 ; scanline  90
|0ADF9D| dw $0074 ; scanline  91
|0ADF9F| dw $0074 ; scanline  92
|0ADFA1| dw $0073 ; scanline  93
|0ADFA3| dw $0073 ; scanline  94
|0ADFA5| dw $0073 ; scanline  95
|0ADFA7| dw $0073 ; scanline  96
|0ADFA9| dw $0073 ; scanline  97
|0ADFAB| dw $0073 ; scanline  98
|0ADFAD| dw $0072 ; scanline  99
|0ADFAF| dw $0072 ; scanline 100
|0ADFB1| dw $0072 ; scanline 101
|0ADFB3| dw $0072 ; scanline 102
|0ADFB5| dw $0072 ; scanline 103
|0ADFB7| dw $0072 ; scanline 104
|0ADFB9| dw $0071 ; scanline 105
|0ADFBB| dw $0071 ; scanline 106
|0ADFBD| dw $0071 ; scanline 107
|0ADFBF| dw $0071 ; scanline 108
|0ADFC1| dw $0070 ; scanline 109
|0ADFC3| dw $0070 ; scanline 110
|0ADFC5| dw $0070 ; scanline 111

;---------------------------------------------------------------------------------------------------

WorldMapHDMA_ZoomedIn_Part2:
|0ADFC7| dw $0070 ; scanline 112
|0ADFC9| dw $0070 ; scanline 113
|0ADFCB| dw $0070 ; scanline 114
|0ADFCD| dw $0070 ; scanline 115
|0ADFCF| dw $006F ; scanline 116
|0ADFD1| dw $006F ; scanline 117
|0ADFD3| dw $006F ; scanline 118
|0ADFD5| dw $006F ; scanline 119
|0ADFD7| dw $006F ; scanline 120
|0ADFD9| dw $006F ; scanline 121
|0ADFDB| dw $006E ; scanline 122
|0ADFDD| dw $006E ; scanline 123
|0ADFDF| dw $006E ; scanline 124
|0ADFE1| dw $006E ; scanline 125
|0ADFE3| dw $006E ; scanline 126
|0ADFE5| dw $006D ; scanline 127
|0ADFE7| dw $006D ; scanline 128
|0ADFE9| dw $006D ; scanline 129
|0ADFEB| dw $006D ; scanline 130
|0ADFED| dw $006D ; scanline 131
|0ADFEF| dw $006D ; scanline 132
|0ADFF1| dw $006C ; scanline 133
|0ADFF3| dw $006C ; scanline 134
|0ADFF5| dw $006C ; scanline 135
|0ADFF7| dw $006C ; scanline 136
|0ADFF9| dw $006C ; scanline 137
|0ADFFB| dw $006C ; scanline 138
|0ADFFD| dw $006C ; scanline 139
|0ADFFF| dw $006B ; scanline 140
|0AE001| dw $006B ; scanline 141
|0AE003| dw $006B ; scanline 142
|0AE005| dw $006B ; scanline 143
|0AE007| dw $006B ; scanline 144
|0AE009| dw $006A ; scanline 145
|0AE00B| dw $006A ; scanline 146
|0AE00D| dw $006A ; scanline 147
|0AE00F| dw $006A ; scanline 148
|0AE011| dw $006A ; scanline 149
|0AE013| dw $006A ; scanline 150
|0AE015| dw $006A ; scanline 151
|0AE017| dw $0069 ; scanline 152
|0AE019| dw $0069 ; scanline 153
|0AE01B| dw $0069 ; scanline 154
|0AE01D| dw $0069 ; scanline 155
|0AE01F| dw $0069 ; scanline 156
|0AE021| dw $0069 ; scanline 157
|0AE023| dw $0069 ; scanline 158
|0AE025| dw $0068 ; scanline 159
|0AE027| dw $0068 ; scanline 160
|0AE029| dw $0068 ; scanline 161
|0AE02B| dw $0068 ; scanline 162
|0AE02D| dw $0068 ; scanline 163
|0AE02F| dw $0067 ; scanline 164
|0AE031| dw $0067 ; scanline 165
|0AE033| dw $0067 ; scanline 166
|0AE035| dw $0067 ; scanline 167
|0AE037| dw $0067 ; scanline 168
|0AE039| dw $0067 ; scanline 169
|0AE03B| dw $0067 ; scanline 170
|0AE03D| dw $0067 ; scanline 171
|0AE03F| dw $0066 ; scanline 172
|0AE041| dw $0066 ; scanline 173
|0AE043| dw $0066 ; scanline 174
|0AE045| dw $0066 ; scanline 175
|0AE047| dw $0066 ; scanline 176
|0AE049| dw $0066 ; scanline 177
|0AE04B| dw $0066 ; scanline 178
|0AE04D| dw $0065 ; scanline 179
|0AE04F| dw $0065 ; scanline 180
|0AE051| dw $0065 ; scanline 181
|0AE053| dw $0065 ; scanline 182
|0AE055| dw $0065 ; scanline 183
|0AE057| dw $0065 ; scanline 184
|0AE059| dw $0064 ; scanline 185
|0AE05B| dw $0064 ; scanline 186
|0AE05D| dw $0064 ; scanline 187
|0AE05F| dw $0064 ; scanline 188
|0AE061| dw $0064 ; scanline 189
|0AE063| dw $0064 ; scanline 190
|0AE065| dw $0064 ; scanline 191
|0AE067| dw $0064 ; scanline 192
|0AE069| dw $0063 ; scanline 193
|0AE06B| dw $0063 ; scanline 194
|0AE06D| dw $0063 ; scanline 195
|0AE06F| dw $0063 ; scanline 196
|0AE071| dw $0063 ; scanline 197
|0AE073| dw $0063 ; scanline 198
|0AE075| dw $0063 ; scanline 199
|0AE077| dw $0063 ; scanline 200
|0AE079| dw $0062 ; scanline 201
|0AE07B| dw $0062 ; scanline 202
|0AE07D| dw $0062 ; scanline 203
|0AE07F| dw $0062 ; scanline 204
|0AE081| dw $0062 ; scanline 205
|0AE083| dw $0061 ; scanline 206
|0AE085| dw $0061 ; scanline 207
|0AE087| dw $0061 ; scanline 208
|0AE089| dw $0061 ; scanline 209
|0AE08B| dw $0061 ; scanline 210
|0AE08D| dw $0061 ; scanline 211
|0AE08F| dw $0061 ; scanline 212
|0AE091| dw $0061 ; scanline 213
|0AE093| dw $0061 ; scanline 214
|0AE095| dw $0060 ; scanline 215
|0AE097| dw $0060 ; scanline 216
|0AE099| dw $0060 ; scanline 217
|0AE09B| dw $0060 ; scanline 218
|0AE09D| dw $0060 ; scanline 219
|0AE09F| dw $0060 ; scanline 220
|0AE0A1| dw $0060 ; scanline 221
|0AE0A3| dw $0060 ; scanline 222
|0AE0A5| dw $0060 ; scanline 223

;===================================================================================================
; FREE ROM: 0x09
;===================================================================================================
NULL_0AE0A7:
|0AE0A7| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0AE0AF| db $FF

;===================================================================================================

Module0E_03_UnderworldMap:
|0AE0B0| LDA.w $0200
|0AE0B3| JSL JumpTableLong
|0AE0B7| dl Module0E_03_00_DarkenAndPrep     ; 0x00
|0AE0BA| dl Module0E_03_01_DrawMap           ; 0x01
|0AE0BD| dl Module0E_03_02_BrightenMap       ; 0x02
|0AE0C0| dl DungeonMap_HandleInputAndSprites ; 0x03
|0AE0C3| dl Module0E_03_04_UnusedCrazyScroll ; 0x04
|0AE0C6| dl UnderworldMap_RecoverRegisters   ; 0x05
|0AE0C9| dl UnderworldMap_RecoverGFX         ; 0x06
|0AE0CC| dl ToggleStarTilesAndAdvance        ; 0x07
|0AE0CF| dl UnderworldMap_RecoverLightCone   ; 0x08

;===================================================================================================

pool Module0E_03_01_DrawMap

.vectors
|0AE0D2| dw Module0E_03_01_00_PrepMapGraphics
|0AE0D4| dw Module0E_03_01_01_DrawLEVEL
|0AE0D6| dw Module0E_03_01_02_DrawFloorsBackdrop
|0AE0D8| dw Module0E_03_01_03_DrawRooms
|0AE0DA| dw DungeonMap_DrawRoomMarkers

endpool

;---------------------------------------------------------------------------------------------------

Module0E_03_01_DrawMap:
|0AE0DC| LDA.w $020D
|0AE0DF| ASL A
|0AE0E0| TAX

|0AE0E1| JMP.w (.vectors,X)

;===================================================================================================

Module0E_03_01_00_PrepMapGraphics:
|0AE0E4| LDA.b $9B
|0AE0E6| PHA

|0AE0E7| STZ.w HDMAEN
|0AE0EA| STZ.b $9B

|0AE0EC| LDA.w $0AA1
|0AE0EF| STA.l $7EC20E

|0AE0F3| LDA.w $0AA3
|0AE0F6| STA.l $7EC20F

|0AE0FA| LDA.w $0AA2
|0AE0FD| STA.l $7EC210

;---------------------------------------------------------------------------------------------------

|0AE101| LDA.b $1C
|0AE103| STA.l $7EC211

|0AE107| LDA.b $1D
|0AE109| STA.l $7EC212

;---------------------------------------------------------------------------------------------------

|0AE10D| LDA.b #$20
|0AE10F| STA.w $0AA1

|0AE112| LDA.w $040C
|0AE115| LSR A
|0AE116| ORA.b #$80
|0AE118| STA.w $0AA3

|0AE11B| LDA.b #$40
|0AE11D| STA.w $0AA2

|0AE120| LDA.b #$16
|0AE122| STA.b $1C

|0AE124| LDA.b #$01
|0AE126| STA.b $1D

|0AE128| JSL EraseTilemaps_dungeonmap
|0AE12C| JSL InitializeTilesets

|0AE130| LDA.b #$02
|0AE132| STA.w $0AA9
|0AE135| JSL PaletteLoad_DungeonMapBG
|0AE139| JSL PaletteLoad_DungeonMapSprite

|0AE13D| LDA.b #$01
|0AE13F| STA.w $0AB2
|0AE142| JSL PaletteLoad_HUD
|0AE146| JSL RefreshEquipmentPalettes_sword_and_mail

|0AE14A| INC.b $15

|0AE14C| INC.w $020D

|0AE14F| PLA
|0AE150| STA.b $9B

|0AE152| LDA.b #$09
|0AE154| STA.b $14
|0AE156| STA.w $0710

|0AE159| RTL

;===================================================================================================

pool Module0E_03_01_01_DrawLEVEL

.LEVEL_top
|0AE15A| dw $8460, $0B00 ; VRAM $C108 | 12 bytes | Horizontal
|0AE15E| dw $2132, $2133, $2138, $213A, $207F

.LEVEL_bottom
|0AE168| dw $A460, $0B00 ; VRAM $C148 | 12 bytes | Horizontal
|0AE16C| dw $2142, $2143, $2149, $214A, $207F

.numerals_top
|0AE176| dw $2108, $2109, $2109, $210A
|0AE17E| dw $210B, $210C, $210D, $211D

.numerals_bottom
|0AE186| dw $2118, $2119, $A109, $211A
|0AE18E| dw $211B, $211C, $2118, $A11D

.dungeon_level
|0AE196| db $FF ; Sewers
|0AE197| db $FF ; Hyrule Castle
|0AE198| db $FF ; Eastern Palace
|0AE199| db $FF ; Desert Palace
|0AE19A| db $FF ; Agahnim's Tower
|0AE19B| db $02 ; Swamp Palace
|0AE19C| db $00 ; Palace of Darkness
|0AE19D| db $0A ; Misery Mire
|0AE19E| db $04 ; Skull Woods
|0AE19F| db $08 ; Ice Palace
|0AE1A0| db $FF ; Tower of Hera
|0AE1A1| db $06 ; Thieves' Town
|0AE1A2| db $0C ; Turtle Rock
|0AE1A3| db $0E ; Ganon's Tower

endpool

;---------------------------------------------------------------------------------------------------

Module0E_03_01_01_DrawLEVEL:
|0AE1A4| PHB
|0AE1A5| PHK
|0AE1A6| PLB

|0AE1A7| LDA.w $040C
|0AE1AA| LSR A
|0AE1AB| TAX

|0AE1AC| LDY.w .dungeon_level,X
|0AE1AF| BMI .not_darkworld_dungeon

|0AE1B1| LDA.b #$FF
|0AE1B3| STA.w $1022

|0AE1B6| LDX.b #$0E

|0AE1B8| REP #$20

|0AE1BA| LDA.w .numerals_top,Y
|0AE1BD| STA.w $1002,X

|0AE1C0| LDA.w .numerals_bottom,Y
|0AE1C3| STA.w $1012,X

;---------------------------------------------------------------------------------------------------

|0AE1C6| SEP #$20

|0AE1C8| DEX

.next_letter
|0AE1C9| LDA.w .LEVEL_top,X
|0AE1CC| STA.w $1002,X

|0AE1CF| LDA.w .LEVEL_bottom,X
|0AE1D2| STA.w $1012,X

|0AE1D5| DEX
|0AE1D6| BPL .next_letter

|0AE1D8| LDA.b #$01
|0AE1DA| STA.b $14

;---------------------------------------------------------------------------------------------------

.not_darkworld_dungeon
|0AE1DC| INC.w $020D

|0AE1DF| PLB

|0AE1E0| RTL

;===================================================================================================

DungeonMap_BackdropFloorPosition:
|0AE1E1| dw $1223 ; 4B-4F | VRAM $2446
|0AE1E3| dw $1263 ; 5F    | VRAM $24C6
|0AE1E5| dw $12A3 ; 6F    | VRAM $2546
|0AE1E7| dw $12E3 ; 7F    | VRAM $25C6
|0AE1E9| dw $1323 ; 8F    | VRAM $2646

|0AE1EB| dw $11E3 ; 5B    | VRAM $23C6
|0AE1ED| dw $11A3 ; 6B    | VRAM $2346
|0AE1EF| dw $1163 ; 7B    | VRAM $22C6
|0AE1F1| dw $1123 ; 8B    | VRAM $2246

;===================================================================================================

Module0E_03_01_02_DrawFloorsBackdrop:
|0AE1F3| PHB
|0AE1F4| PHK
|0AE1F5| PLB

|0AE1F6| REP #$30

|0AE1F8| STZ.w $1000

|0AE1FB| LDX.w $040C
|0AE1FE| PHX

|0AE1FF| LDA.w DungeonMapFloorCountData,X

|0AE202| AND.w #$0300
|0AE205| BEQ .no_mountain

|0AE207| AND.w #$0100
|0AE20A| BEQ .no_mountain

|0AE20C| LDX.w #$002A
|0AE20F| PHX

.next_copy
|0AE210| LDA.w DungeonMap_MountainStripes-2,X
|0AE213| STA.w $1000,X

|0AE216| DEX
|0AE217| DEX
|0AE218| BNE .next_copy

;---------------------------------------------------------------------------------------------------

|0AE21A| PLX

|0AE21B| LDA.w #$1123 ; VRAM $2246
|0AE21E| STA.b $00

|0AE220| LDY.w #$0010

.next_mountain_fill_stripe
|0AE223| LDA.b $00

|0AE225| XBA
|0AE226| STA.w $1002,X
|0AE229| XBA

|0AE22A| CLC
|0AE22B| ADC.w #$0020
|0AE22E| STA.b $00

|0AE230| LDA.w #$0E40
|0AE233| STA.w $1004,X

|0AE236| LDA.w #$1B2E
|0AE239| STA.w $1006,X

|0AE23C| INX
|0AE23D| INX
|0AE23E| INX
|0AE23F| INX
|0AE240| INX
|0AE241| INX

|0AE242| DEY
|0AE243| BNE .next_mountain_fill_stripe

|0AE245| STX.w $1000

.no_mountain
|0AE248| STZ.b $00
|0AE24A| STZ.b $02

|0AE24C| LDX.w $040C

|0AE24F| LDA.w DungeonMapFloorCountData,X
|0AE252| AND.w #$00FF
|0AE255| CMP.w #$0050
|0AE258| BCC .fewer_than_5_above

|0AE25A| LSR A
|0AE25B| LSR A
|0AE25C| LSR A
|0AE25D| LSR A

|0AE25E| SEC
|0AE25F| SBC.w #$0004

|0AE262| ASL A
|0AE263| STA.b $00

|0AE265| BRA .done_floor_counting

.fewer_than_5_above
|0AE267| AND.w #$000F
|0AE26A| CMP.w #$0005
|0AE26D| BCC .done_floor_counting

|0AE26F| ASL A
|0AE270| STA.b $00

;---------------------------------------------------------------------------------------------------

.done_floor_counting
|0AE272| LDX.b $00
|0AE274| LDY.w $1000

|0AE277| LDA.w DungeonMap_BackdropFloorPosition,X
|0AE27A| STA.b $00
|0AE27C| STA.b $0E

.next_floor_stripe
|0AE27E| LDA.b $00
|0AE280| XBA

|0AE281| STA.w $1002,Y

|0AE284| INY
|0AE285| INY

|0AE286| LDA.w #$0E40
|0AE289| STA.w $1002,Y

|0AE28C| INY
|0AE28D| INY

|0AE28E| LDX.b $02

|0AE290| LDA.w DungeonMap_BackdropFloorGradientTiles,X
|0AE293| STA.b $04

|0AE295| LDX.w $040C

|0AE298| LDA.w DungeonMapFloorCountData,X
|0AE29B| AND.w #$0200
|0AE29E| BEQ .not_ocean

|0AE2A0| LDA.b $04
|0AE2A2| CLC
|0AE2A3| ADC.w #$0400
|0AE2A6| STA.b $04

.not_ocean
|0AE2A8| LDA.b $04
|0AE2AA| STA.w $1002,Y

|0AE2AD| INY
|0AE2AE| INY

|0AE2AF| LDA.b $02
|0AE2B1| CMP.w #$000C
|0AE2B4| BEQ .gradient_finished

|0AE2B6| INC.b $02
|0AE2B8| INC.b $02

.gradient_finished
|0AE2BA| LDA.b $00
|0AE2BC| CLC
|0AE2BD| ADC.w #$0020
|0AE2C0| STA.b $00

|0AE2C2| CMP.w #$1360 ; VRAM $26C0
|0AE2C5| BCC .next_floor_stripe

;---------------------------------------------------------------------------------------------------

|0AE2C7| STY.w $1000

|0AE2CA| SEP #$20

|0AE2CC| PLX
|0AE2CD| JSR DungeonMap_BuildFloorListBoxes

|0AE2D0| REP #$10

|0AE2D2| LDY.w $1000

|0AE2D5| LDA.b #$FF
|0AE2D7| STA.w $1002,Y

|0AE2DA| SEP #$10

|0AE2DC| INC.w $020D

|0AE2DF| LDA.b #$01
|0AE2E1| STA.b $14

|0AE2E3| PLB

|0AE2E4| RTL

;===================================================================================================

pool DungeonMap_BuildFloorListBoxes

.tiles
|0AE2E5| dw $0F26, $0F27, $4F27, $4F26
|0AE2ED| dw $8F26, $8F27, $CF27, $CF26

endpool

;---------------------------------------------------------------------------------------------------

DungeonMap_BuildFloorListBoxes:
|0AE2F5| REP #$20

|0AE2F7| LDA.w DungeonMapFloorCountData,X
|0AE2FA| AND.w #$00FF
|0AE2FD| STA.b $02

|0AE2FF| AND.w #$000F
|0AE302| STA.b $00

|0AE304| LDA.b $02

|0AE306| LSR A
|0AE307| LSR A
|0AE308| LSR A
|0AE309| LSR A

|0AE30A| CLC
|0AE30B| ADC.b $00
|0AE30D| STA.b $02

|0AE30F| LDA.b $A4
|0AE311| CLC
|0AE312| ADC.b $00
|0AE314| AND.w #$00FF
|0AE317| STA.b $0C

|0AE319| STZ.b $0A

|0AE31B| LDA.b $0E
|0AE31D| SEC
|0AE31E| SBC.w #$0040
|0AE321| CLC
|0AE322| ADC.w #$0002
|0AE325| STA.b $0E

|0AE327| LDX.b $00
|0AE329| BEQ .no_basement

|0AE32B| LDA.b $0E

.scroll_floors
|0AE32D| CLC
|0AE32E| ADC.w #$0040

|0AE331| DEX
|0AE332| BNE .scroll_floors

|0AE334| STA.b $0E

.no_basement
|0AE336| REP #$10

|0AE338| LDY.w $1000

.next_box
|0AE33B| LDX.w #$0000

|0AE33E| LDA.b $0E

.do_next_row
|0AE340| XBA
|0AE341| STA.w $1002,Y

|0AE344| INY
|0AE345| INY

|0AE346| LDA.w #$0700
|0AE349| STA.w $1002,Y

|0AE34C| INY
|0AE34D| INY

.next_tile_to_stripe
|0AE34E| LDA.w .tiles,X
|0AE351| STA.w $1002,Y

|0AE354| INY
|0AE355| INY

|0AE356| INX
|0AE357| INX
|0AE358| CPX.w #$0008
|0AE35B| BCC .next_tile_to_stripe
|0AE35D| BEQ .set_up_box_bottom

|0AE35F| CPX.w #$0010
|0AE362| BNE .next_tile_to_stripe

|0AE364| BRA .box_done

.set_up_box_bottom
|0AE366| LDA.b $0E
|0AE368| CLC
|0AE369| ADC.w #$0020

|0AE36C| BRA .do_next_row

.box_done
|0AE36E| LDA.b $0E
|0AE370| SEC
|0AE371| SBC.w #$0040
|0AE374| STA.b $0E

|0AE376| INC.b $0A

|0AE378| LDA.b $0A
|0AE37A| CMP.b $02
|0AE37C| BMI .next_box

|0AE37E| STY.w $1000

|0AE381| SEP #$30

|0AE383| RTS

;===================================================================================================

Module0E_03_01_03_DrawRooms:
|0AE384| PHB
|0AE385| PHK
|0AE386| PLB

|0AE387| STZ.w $0210

|0AE38A| REP #$30

|0AE38C| STZ.b $00
|0AE38E| STZ.b $02
|0AE390| STZ.b $04
|0AE392| STZ.b $06
|0AE394| STZ.b $08
|0AE396| STZ.b $0A
|0AE398| STZ.b $0C

|0AE39A| STZ.w $0211

|0AE39D| LDX.w $040C

|0AE3A0| LDA.w DungeonMapFloorCountData,X
|0AE3A3| AND.w #$000F

|0AE3A6| EOR.w #$00FF
|0AE3A9| INC A

|0AE3AA| AND.w #$00FF

|0AE3AD| CMP.b $A4
|0AE3AF| BEQ .on_this_floor

|0AE3B1| LDA.b $A4
|0AE3B3| AND.w #$00FF
|0AE3B6| STA.w $020E

|0AE3B9| BRA .continue

.on_this_floor
|0AE3BB| LDA.b $A4
|0AE3BD| INC A
|0AE3BE| STA.w $020E

|0AE3C1| INC.w $0211
|0AE3C4| INC.w $0211

;---------------------------------------------------------------------------------------------------

.continue
|0AE3C7| LDA.w $020E
|0AE3CA| AND.w #$0050
|0AE3CD| BNE .pointless_check

|0AE3CF| LDA.w #$EFFF
|0AE3D2| STA.b $08
|0AE3D4| BRA .that_was_pointless

.pointless_check
|0AE3D6| LDA.w #$EFFF
|0AE3D9| STA.b $08

.that_was_pointless
|0AE3DB| JSR DungeonMap_DrawFloorNumbersByRoom
|0AE3DE| JSR DungeonMap_DrawBorderForRooms
|0AE3E1| JSR DungeonMap_DrawDungeonLayout

;---------------------------------------------------------------------------------------------------

|0AE3E4| DEC.w $020E

|0AE3E7| REP #$30

|0AE3E9| LDA.w #$0300
|0AE3EC| STA.b $06

|0AE3EE| LDA.w $0211
|0AE3F1| BNE .very_useless
|0AE3F3| BRA .very_useless

.very_useless
|0AE3F5| LDA.w $020E
|0AE3F8| AND.w #$0050
|0AE3FB| BNE .more_pointlessness

|0AE3FD| LDA.w #$EFFF
|0AE400| STA.b $08
|0AE402| BRA .wow_really_pointless

.more_pointlessness
|0AE404| LDA.w #$EFFF
|0AE407| STA.b $08

.wow_really_pointless
|0AE409| JSR DungeonMap_DrawFloorNumbersByRoom
|0AE40C| JSR DungeonMap_DrawBorderForRooms
|0AE40F| JSR DungeonMap_DrawDungeonLayout

;---------------------------------------------------------------------------------------------------

|0AE412| REP #$30

|0AE414| INC.w $020E

|0AE417| STZ.b $06

|0AE419| SEP #$30

|0AE41B| LDA.b #$08
|0AE41D| STA.b $17

|0AE41F| LDA.b #$22
|0AE421| STA.w $0116

|0AE424| INC.w $020D

|0AE427| PLB

|0AE428| RTL

;===================================================================================================

pool DungeonMap_DrawBorderForRooms

.corner_tiles
|0AE429| dw $1F19, $5F19, $9F19, $DF19

.corner_address
|0AE431| dw $00E2, $00F8, $03A2, $03B8

.horizontal_tiles
|0AE439| dw $1F1A, $9F1A

.horizontal_border_address
|0AE43D| dw $00E4, $03A4

.vertical_tiles
|0AE441| dw $1F1B, $5F1B

.vertical_border_address
|0AE445| dw $0122, $0138

endpool

;---------------------------------------------------------------------------------------------------

DungeonMap_DrawBorderForRooms:
|0AE449| REP #$30

|0AE44B| STZ.b $02

.next_corner
|0AE44D| LDY.b $02

|0AE44F| LDA.w .corner_address,Y
|0AE452| CLC
|0AE453| ADC.b $06
|0AE455| AND.w #$0FFF
|0AE458| TAX

|0AE459| LDA.w #$0F00
|0AE45C| STA.l $7F0000,X

|0AE460| LDA.w .corner_tiles,Y
|0AE463| AND.b $08
|0AE465| STA.l $7F0000,X

|0AE469| INC.b $02
|0AE46B| INC.b $02

|0AE46D| LDA.b $02
|0AE46F| CMP.w #$0008
|0AE472| BNE .next_corner

;---------------------------------------------------------------------------------------------------

|0AE474| LDY.w #$0000

.next_horizontal_segment
|0AE477| STZ.b $02

|0AE479| LDA.w .horizontal_border_address,Y
|0AE47C| CLC
|0AE47D| ADC.b $06
|0AE47F| STA.b $04

.next_horizontal_tile
|0AE481| LDA.b $04
|0AE483| CLC
|0AE484| ADC.b $02
|0AE486| AND.w #$0FFF
|0AE489| TAX

|0AE48A| LDA.w #$0F00
|0AE48D| STA.l $7F0000,X

|0AE491| LDA.w .horizontal_tiles,Y
|0AE494| AND.b $08
|0AE496| STA.l $7F0000,X

|0AE49A| INC.b $02
|0AE49C| INC.b $02

|0AE49E| LDA.b $02
|0AE4A0| CMP.w #$0014
|0AE4A3| BNE .next_horizontal_tile

|0AE4A5| INY
|0AE4A6| INY
|0AE4A7| CPY.w #$0004
|0AE4AA| BNE .next_horizontal_segment

;---------------------------------------------------------------------------------------------------

|0AE4AC| LDY.w #$0000

.next_vertical_segment
|0AE4AF| STZ.b $02

|0AE4B1| LDA.w .vertical_border_address,Y
|0AE4B4| CLC
|0AE4B5| ADC.b $06
|0AE4B7| STA.b $04

.next_vertical_tile
|0AE4B9| LDA.b $04
|0AE4BB| CLC
|0AE4BC| ADC.b $02
|0AE4BE| AND.w #$0FFF
|0AE4C1| TAX

|0AE4C2| LDA.w #$0F00
|0AE4C5| STA.l $7F0000,X

|0AE4C9| LDA.w .vertical_tiles,Y
|0AE4CC| AND.b $08
|0AE4CE| STA.l $7F0000,X

|0AE4D2| LDA.b $02
|0AE4D4| CLC
|0AE4D5| ADC.w #$0040
|0AE4D8| STA.b $02

|0AE4DA| CMP.w #$0280
|0AE4DD| BNE .next_vertical_tile

|0AE4DF| INY
|0AE4E0| INY
|0AE4E1| CPY.w #$0004
|0AE4E4| BNE .next_vertical_segment

;---------------------------------------------------------------------------------------------------

|0AE4E6| SEP #$30

|0AE4E8| RTS

;===================================================================================================

pool DungeonMap_DrawFloorNumbersByRoom

.floor_numbers
|0AE4E9| dw $1F1E ; 1
|0AE4EB| dw $1F1F ; 2
|0AE4ED| dw $1F20 ; 3
|0AE4EF| dw $1F21 ; 4
|0AE4F1| dw $1F22 ; 5
|0AE4F3| dw $1F23 ; 6
|0AE4F5| dw $1F24 ; 7
|0AE4F7| dw $1F25 ; 8

endpool

;---------------------------------------------------------------------------------------------------

DungeonMap_DrawFloorNumbersByRoom:
|0AE4F9| REP #$30

|0AE4FB| LDA.w #$00DE
|0AE4FE| STA.b $00

.delete_next_letter
|0AE500| LDA.b $00
|0AE502| CLC
|0AE503| ADC.b $06
|0AE505| AND.w #$0FFF
|0AE508| TAX

|0AE509| LDA.w #$0F00
|0AE50C| STA.l $7F0000,X
|0AE510| STA.l $7F0002,X

|0AE514| LDA.b $00
|0AE516| CLC
|0AE517| ADC.w #$0040
|0AE51A| STA.b $00

|0AE51C| CMP.w #$039E
|0AE51F| BNE .delete_next_letter

;---------------------------------------------------------------------------------------------------

|0AE521| LDA.w $020E
|0AE524| AND.w #$0080
|0AE527| BEQ .above_ground_floor

|0AE529| LDA.w #$1F1C ; letter B
|0AE52C| BRA .write_char

.above_ground_floor
|0AE52E| LDA.w $020E
|0AE531| AND.w #$000F
|0AE534| ASL A
|0AE535| TAY

|0AE536| LDA.w .floor_numbers,Y

.write_char
|0AE539| PHA

|0AE53A| LDA.w #$035E
|0AE53D| CLC
|0AE53E| ADC.b $06

|0AE540| AND.w #$0FFF
|0AE543| TAX

|0AE544| PLA
|0AE545| AND.b $08
|0AE547| STA.l $7F0000,X

;---------------------------------------------------------------------------------------------------

|0AE54B| LDA.w $020E
|0AE54E| AND.w #$0080
|0AE551| BEQ .above_ground_again

|0AE553| LDA.w $020E
|0AE556| AND.w #$00FF
|0AE559| EOR.w #$00FF
|0AE55C| ASL A
|0AE55D| TAY

|0AE55E| LDA.w .floor_numbers,Y
|0AE561| BRA .write_second_character

.above_ground_again
|0AE563| LDA.w #$1F1D ; letter F

.write_second_character
|0AE566| AND.b $08
|0AE568| STA.l $7F0002,X

|0AE56C| SEP #$30

|0AE56E| RTS

;===================================================================================================

pool DungeonMap_DrawDungeonLayout

.row_offset
|0AE56F| dw $0124
|0AE571| dw $01A4
|0AE573| dw $0224
|0AE575| dw $02A4
|0AE577| dw $0324

endpool

;---------------------------------------------------------------------------------------------------

DungeonMap_DrawDungeonLayout:
|0AE579| REP #$30

|0AE57B| STZ.b $00

.next_row_of_rooms
|0AE57D| LDA.b $00
|0AE57F| ASL A
|0AE580| TAX

|0AE581| LDA.w .row_offset,X
|0AE584| CLC
|0AE585| ADC.b $06
|0AE587| AND.w #$0FFF
|0AE58A| TAX

|0AE58B| JSR DungeonMap_DrawSingleRowOfRooms

|0AE58E| INC.b $00

|0AE590| LDA.b $00
|0AE592| CMP.w #$0005
|0AE595| BNE .next_row_of_rooms

|0AE597| SEP #$30

|0AE599| RTS

;===================================================================================================

pool DungeonMap_DrawSingleRowOfRooms

.row_draw_offset
|0AE59A| dw $0000
|0AE59C| dw $0005
|0AE59E| dw $000A
|0AE5A0| dw $000F
|0AE5A2| dw $0014

.unused
|0AE5A4| dw $0000, $0032, $0064, $0096
|0AE5AC| dw $00C8, $00FA, $012C, $015E
|0AE5B4| dw $0190, $0300, $0B00, $0F00

endpool

;---------------------------------------------------------------------------------------------------

DungeonMap_DrawSingleRowOfRooms:
|0AE5BC| REP #$30

|0AE5BE| STZ.b $02

.next_room
|0AE5C0| STZ.b $0E

|0AE5C2| PHX

|0AE5C3| LDA.b $00
|0AE5C5| ASL A
|0AE5C6| TAX

|0AE5C7| LDA.b $02
|0AE5C9| ADC.w .row_draw_offset,X
|0AE5CC| STA.b $04

|0AE5CE| SEP #$20

|0AE5D0| LDX.w $040C

|0AE5D3| LDA.w DungeonMapFloorCountData,X
|0AE5D6| AND.b #$0F

|0AE5D8| CLC
|0AE5D9| ADC.w $020E

|0AE5DC| ASL A
|0AE5DD| STA.b $0E

|0AE5DF| TAY

|0AE5E0| REP #$20

|0AE5E2| LDA.w DungeonMapRoomPointers,X
|0AE5E5| STA.b $0C

|0AE5E7| LDA.w DungeonMapFloorToDataOffset,Y
|0AE5EA| CLC
|0AE5EB| ADC.b $04
|0AE5ED| TAY

|0AE5EE| SEP #$20

|0AE5F0| LDA.b ($0C),Y
|0AE5F2| CMP.b #$0F
|0AE5F4| BNE .valid_room

|0AE5F6| REP #$20

|0AE5F8| LDA.w #$0051
|0AE5FB| BRA .shift_empty_room

.valid_room
|0AE5FD| REP #$20

|0AE5FF| AND.w #$00FF
|0AE602| STA.b $CA

|0AE604| ASL A
|0AE605| PHA

|0AE606| LDA.b $CA
|0AE608| ASL A
|0AE609| TAX

|0AE60A| LDA.l $7EF000,X
|0AE60E| AND.w #$000F

|0AE611| STA.b $0E

|0AE613| PLA
|0AE614| BRA .is_valid

.shift_empty_room
|0AE616| ASL A
|0AE617| ASL A
|0AE618| ASL A
|0AE619| TAY

|0AE61A| BRA .continue_with_empty_room

;---------------------------------------------------------------------------------------------------

.is_valid
|0AE61C| STZ.b $C8

|0AE61E| LDY.w #$0000
|0AE621| LDX.w $040C

|0AE624| LDA.w DungeonMapRoomPointers,X
|0AE627| STA.b $0C

.check_next_room
|0AE629| SEP #$20

|0AE62B| LDA.b ($0C),Y
|0AE62D| CMP.b #$0F
|0AE62F| BNE .draw_this_room

|0AE631| INY
|0AE632| BRA .check_next_room

.draw_this_room
|0AE634| CMP.b $CA
|0AE636| BEQ .room_matches

|0AE638| INC.b $C8

|0AE63A| INY

|0AE63B| BRA .check_next_room

.room_matches
|0AE63D| REP #$20

|0AE63F| LDA.w DungeonMapRoomOrderPointers,X
|0AE642| STA.b $0C

|0AE644| LDA.b $C8
|0AE646| TAY

|0AE647| SEP #$20

|0AE649| LDA.b ($0C),Y

|0AE64B| REP #$20

|0AE64D| ASL A
|0AE64E| ASL A
|0AE64F| ASL A
|0AE650| TAY

.continue_with_empty_room
|0AE651| PLX

|0AE652| LDA.w DungeonMap_RoomTemplates+0,Y
|0AE655| STA.b $0C

|0AE657| PHA

;---------------------------------------------------------------------------------------------------

|0AE658| CMP.w #$0B00
|0AE65B| BEQ .empty_quad_nw

|0AE65D| LDA.b $0E
|0AE65F| AND.w #$0008
|0AE662| BNE .empty_quad_nw

|0AE664| LDA.b $0C
|0AE666| AND.w #$1000
|0AE669| BNE .visited_pal_nw

|0AE66B| LDA.w #$0400
|0AE66E| STA.b $0C
|0AE670| BRA .check_visit_nw

.visited_pal_nw
|0AE672| PHX

|0AE673| LDX.w $040C

|0AE676| LDA.l $7EF368
|0AE67A| AND.l BitMasks,X
|0AE67E| BEQ .missing_map_nw

|0AE680| PLX
|0AE681| PLA

|0AE682| LDA.b $0C
|0AE684| AND.w #$E3FF
|0AE687| ORA.w #$0C00
|0AE68A| BRA .write_char_nw

.missing_map_nw
|0AE68C| PLX

.empty_quad_nw
|0AE68D| STZ.b $0C

.check_visit_nw
|0AE68F| PLA
|0AE690| CLC
|0AE691| ADC.b $0C

|0AE693| PHX

|0AE694| STA.b $0C

|0AE696| LDX.w $040C

|0AE699| LDA.l $7EF368
|0AE69D| AND.l BitMasks,X
|0AE6A1| BNE .quadrant_visited_nw

|0AE6A3| LDA.b $0E
|0AE6A5| AND.w #$0008
|0AE6A8| BNE .quadrant_visited_nw

|0AE6AA| LDA.w #$0B00
|0AE6AD| BRA .quadrant_unvisited_nw

.quadrant_visited_nw
|0AE6AF| LDA.b $0C

.quadrant_unvisited_nw
|0AE6B1| PLX

.write_char_nw
|0AE6B2| STA.l $7F0000,X

;---------------------------------------------------------------------------------------------------

|0AE6B6| LDA.w DungeonMap_RoomTemplates+2,Y
|0AE6B9| STA.b $0C

|0AE6BB| PHA

|0AE6BC| CMP.w #$0B00
|0AE6BF| BEQ .empty_quad_ne

|0AE6C1| LDA.b $0E
|0AE6C3| AND.w #$0004
|0AE6C6| BNE .empty_quad_ne

|0AE6C8| LDA.b $0C
|0AE6CA| AND.w #$1000
|0AE6CD| BNE .visited_pal_ne

|0AE6CF| LDA.w #$0400
|0AE6D2| STA.b $0C

|0AE6D4| BRA .check_visit_ne

.visited_pal_ne
|0AE6D6| PHX

|0AE6D7| LDX.w $040C

|0AE6DA| LDA.l $7EF368
|0AE6DE| AND.l BitMasks,X
|0AE6E2| BEQ .missing_map_ne

|0AE6E4| PLX
|0AE6E5| PLA

|0AE6E6| LDA.b $0C
|0AE6E8| AND.w #$E3FF
|0AE6EB| ORA.w #$0C00
|0AE6EE| BRA .write_char_ne

.missing_map_ne
|0AE6F0| PLX

.empty_quad_ne
|0AE6F1| STZ.b $0C

.check_visit_ne
|0AE6F3| PLA
|0AE6F4| CLC
|0AE6F5| ADC.b $0C

|0AE6F7| PHX

|0AE6F8| STA.b $0C

|0AE6FA| LDX.w $040C

|0AE6FD| LDA.l $7EF368
|0AE701| AND.l BitMasks,X
|0AE705| BNE .quadrant_visited_ne

|0AE707| LDA.b $0E
|0AE709| AND.w #$0004
|0AE70C| BNE .quadrant_visited_ne

|0AE70E| LDA.w #$0B00

|0AE711| BRA .quadrant_unvisited_ne

.quadrant_visited_ne
|0AE713| LDA.b $0C

.quadrant_unvisited_ne
|0AE715| PLX

.write_char_ne
|0AE716| STA.l $7F0002,X

;---------------------------------------------------------------------------------------------------

|0AE71A| LDA.w DungeonMap_RoomTemplates+4,Y
|0AE71D| STA.b $0C

|0AE71F| PHA

|0AE720| CMP.w #$0B00
|0AE723| BEQ .empty_quad_sw

|0AE725| LDA.b $0E
|0AE727| AND.w #$0002
|0AE72A| BNE .empty_quad_sw

|0AE72C| LDA.b $0C
|0AE72E| AND.w #$1000
|0AE731| BNE .visited_pal_sw

|0AE733| LDA.w #$0400
|0AE736| STA.b $0C

|0AE738| BRA .check_visit_sw

.visited_pal_sw
|0AE73A| PHX

|0AE73B| LDX.w $040C

|0AE73E| LDA.l $7EF368
|0AE742| AND.l BitMasks,X
|0AE746| BEQ .missing_map_sw

|0AE748| PLX
|0AE749| PLA

|0AE74A| LDA.b $0C
|0AE74C| AND.w #$E3FF
|0AE74F| ORA.w #$0C00
|0AE752| BRA .write_char_sw

.missing_map_sw
|0AE754| PLX

.empty_quad_sw
|0AE755| STZ.b $0C

.check_visit_sw
|0AE757| PLA
|0AE758| CLC
|0AE759| ADC.b $0C

|0AE75B| PHX

|0AE75C| STA.b $0C

|0AE75E| LDX.w $040C

|0AE761| LDA.l $7EF368
|0AE765| AND.l BitMasks,X
|0AE769| BNE .quadrant_visited_sw

|0AE76B| LDA.b $0E
|0AE76D| AND.w #$0002
|0AE770| BNE .quadrant_visited_sw

|0AE772| LDA.w #$0B00

|0AE775| BRA .quadrant_unvisited_sw

.quadrant_visited_sw
|0AE777| LDA.b $0C

.quadrant_unvisited_sw
|0AE779| PLX

.write_char_sw
|0AE77A| STA.l $7F0040,X

;---------------------------------------------------------------------------------------------------

|0AE77E| LDA.w DungeonMap_RoomTemplates+6,Y
|0AE781| STA.b $0C

|0AE783| PHA

|0AE784| CMP.w #$0B00
|0AE787| BEQ .empty_quad_se

|0AE789| LDA.b $0E
|0AE78B| AND.w #$0001
|0AE78E| BNE .empty_quad_se

|0AE790| LDA.b $0C
|0AE792| AND.w #$1000
|0AE795| BNE .visited_pal_se

|0AE797| LDA.w #$0400
|0AE79A| STA.b $0C

|0AE79C| BRA .check_visit_se

.visited_pal_se
|0AE79E| PHX

|0AE79F| LDX.w $040C

|0AE7A2| LDA.l $7EF368
|0AE7A6| AND.l BitMasks,X
|0AE7AA| BEQ .missing_map_se

|0AE7AC| PLX
|0AE7AD| PLA

|0AE7AE| LDA.b $0C
|0AE7B0| AND.w #$E3FF
|0AE7B3| ORA.w #$0C00

|0AE7B6| BRA .write_char_se

.missing_map_se
|0AE7B8| PLX

.empty_quad_se
|0AE7B9| STZ.b $0C

.check_visit_se
|0AE7BB| PLA
|0AE7BC| CLC
|0AE7BD| ADC.b $0C

|0AE7BF| PHX

|0AE7C0| STA.b $0C

|0AE7C2| LDX.w $040C

|0AE7C5| LDA.l $7EF368
|0AE7C9| AND.l BitMasks,X
|0AE7CD| BNE .quadrant_visited_se

|0AE7CF| LDA.b $0E
|0AE7D1| AND.w #$0001
|0AE7D4| BNE .quadrant_visited_se

|0AE7D6| LDA.w #$0B00

|0AE7D9| BRA .quadrant_unvisited_se

.quadrant_visited_se
|0AE7DB| LDA.b $0C

.quadrant_unvisited_se
|0AE7DD| PLX

.write_char_se
|0AE7DE| STA.l $7F0042,X

;---------------------------------------------------------------------------------------------------

|0AE7E2| INX
|0AE7E3| INX
|0AE7E4| INX
|0AE7E5| INX

|0AE7E6| INC.b $02

|0AE7E8| LDA.b $02
|0AE7EA| CMP.w #$0005
|0AE7ED| BEQ .exit

|0AE7EF| JMP.w .next_room

.exit
|0AE7F2| RTS

;===================================================================================================

DungeonMapRoomMarkerYBase:
|0AE7F3| dw $001F, $007F

;---------------------------------------------------------------------------------------------------

pool DungeonMap_DrawRoomMarkers

.offset_x_base
|0AE7F7| dw $0090

.fairy_rooms
|0AE7F9| dw $0089 ; ROOM 0089 - Eastern fairy room
|0AE7FB| dw $00A7 ; ROOM 00A7 - Hera fairy room
|0AE7FD| dw $004F ; ROOM 004F - Ice Palace fairy room

.fairy_room_replacements
|0AE7FF| dw $00A9 ; ROOM 00A9 - Eastern big chest room
|0AE801| dw $0077 ; ROOM 0077 - Hera lobby
|0AE803| dw $00BE ; ROOM 00BE - Ice Palace block switch room

.fairy_room_count
|0AE805| dw $0004

endpool

;---------------------------------------------------------------------------------------------------

DungeonMapBossRooms:
|0AE807| dw $000F ; ROOM 000F - Sewers: none
|0AE809| dw $000F ; ROOM 000F - Castle: none
|0AE80B| dw $00C8 ; ROOM 00C8 - Eastern
|0AE80D| dw $0033 ; ROOM 0033 - Desert
|0AE80F| dw $0020 ; ROOM 0020 - Agahnim's tower
|0AE811| dw $0006 ; ROOM 0006 - Swamp palace
|0AE813| dw $005A ; ROOM 005A - Palace of Darkness
|0AE815| dw $0090 ; ROOM 0090 - Misery Mire
|0AE817| dw $0029 ; ROOM 0029 - Skull Woods
|0AE819| dw $00DE ; ROOM 00DE - Ice Palace
|0AE81B| dw $0007 ; ROOM 0007 - Tower of Hera
|0AE81D| dw $00AC ; ROOM 00AC - Thieves' Town
|0AE81F| dw $00A4 ; ROOM 00A4 - Turtle Rock
|0AE821| dw $000D ; ROOM 000D - Ganon's tower

;---------------------------------------------------------------------------------------------------

DungeonMap_DrawRoomMarkers:
|0AE823| PHB
|0AE824| PHK
|0AE825| PLB

|0AE826| REP #$10

|0AE828| LDA.b #$00
|0AE82A| XBA

|0AE82B| LDX.w $040C

|0AE82E| LDA.w DungeonMapFloorCountData,X
|0AE831| AND.b #$0F
|0AE833| CLC
|0AE834| ADC.b $A4
|0AE836| ASL A
|0AE837| TAY

|0AE838| STY.b $0C

|0AE83A| REP #$20

|0AE83C| STZ.b $00
|0AE83E| STZ.b $02

;---------------------------------------------------------------------------------------------------

|0AE840| PHY

|0AE841| LDY.w .fairy_room_count

|0AE844| LDA.b $A0

.check_next
|0AE846| CMP.w .fairy_rooms,Y
|0AE849| BEQ .replace_this_room

|0AE84B| DEY
|0AE84C| DEY
|0AE84D| BPL .check_next

|0AE84F| BRA .no_replacements

.replace_this_room
|0AE851| LDA.w .fairy_room_replacements,Y

.no_replacements
|0AE854| STA.b $0E

;---------------------------------------------------------------------------------------------------

|0AE856| PLY

|0AE857| LDA.w DungeonMapRoomPointers,X
|0AE85A| STA.b $04

|0AE85C| LDA.w DungeonMapFloorToDataOffset,Y
|0AE85F| TAY

|0AE860| SEP #$20

.next_room_check
|0AE862| LDA.b ($04),Y

|0AE864| INY

|0AE865| CMP.b $0E
|0AE867| BEQ .is_this_room

|0AE869| LDA.b $00
|0AE86B| CMP.b #$40
|0AE86D| BCC .dont_reset_row

|0AE86F| STZ.b $00

|0AE871| LDA.b $02
|0AE873| CLC
|0AE874| ADC.b #$10
|0AE876| STA.b $02

|0AE878| BRA .next_room_check

.dont_reset_row
|0AE87A| CLC
|0AE87B| ADC.b #$10
|0AE87D| STA.b $00

|0AE87F| BRA .next_room_check

;---------------------------------------------------------------------------------------------------

.is_this_room
|0AE881| REP #$20

|0AE883| LDA.b $00
|0AE885| CLC
|0AE886| ADC.w .offset_x_base
|0AE889| STA.w $0215

|0AE88C| LDA.b $22
|0AE88E| AND.w #$01E0

|0AE891| ASL A
|0AE892| ASL A
|0AE893| ASL A

|0AE894| XBA
|0AE895| CLC
|0AE896| ADC.w $0215
|0AE899| STA.w $0215

|0AE89C| LDY.w $0211

|0AE89F| LDA.b $02
|0AE8A1| STA.w $0CF5

|0AE8A4| CLC
|0AE8A5| ADC.w DungeonMapRoomMarkerYBase,Y
|0AE8A8| STA.w $0217

|0AE8AB| LDA.b $20
|0AE8AD| AND.w #$01E0

|0AE8B0| ASL A
|0AE8B1| ASL A
|0AE8B2| ASL A

|0AE8B3| XBA
|0AE8B4| CLC
|0AE8B5| ADC.w $0217
|0AE8B8| STA.w $0217

;---------------------------------------------------------------------------------------------------

|0AE8BB| SEP #$20

|0AE8BD| LDA.b #$00
|0AE8BF| XBA

|0AE8C0| LDA.w DungeonMapFloorCountData,X
|0AE8C3| AND.b #$0F
|0AE8C5| CLC
|0AE8C6| ADC.w DungeonMap_BossRoomFloor+0,X

|0AE8C9| REP #$20

|0AE8CB| ASL A
|0AE8CC| TAY

|0AE8CD| LDA.w DungeonMapRoomPointers,X
|0AE8D0| CLC
|0AE8D1| ADC.w DungeonMapFloorToDataOffset,Y
|0AE8D4| STA.b $0E

;---------------------------------------------------------------------------------------------------

|0AE8D6| SEP #$20

|0AE8D8| LDA.b #$40
|0AE8DA| STA.w $0FA8
|0AE8DD| STZ.w $0FA9

|0AE8E0| STA.w $0FAA
|0AE8E3| STZ.w $0FAB

|0AE8E6| LDY.w #$0018

.next_boss_room_check
|0AE8E9| LDA.b ($0E),Y
|0AE8EB| CMP.b #$0F
|0AE8ED| BEQ .invalid_room

|0AE8EF| CMP.w DungeonMapBossRooms,X
|0AE8F2| BEQ .is_boss_room

.invalid_room
|0AE8F4| LDA.w $0FA8
|0AE8F7| SEC
|0AE8F8| SBC.b #$10
|0AE8FA| STA.w $0FA8
|0AE8FD| BPL .dont_reset_row_b

|0AE8FF| LDA.b #$40
|0AE901| STA.w $0FA8

|0AE904| LDA.w $0FAA
|0AE907| SEC
|0AE908| SBC.b #$10
|0AE90A| STA.w $0FAA

.dont_reset_row_b
|0AE90D| DEY
|0AE90E| BPL .next_boss_room_check

;---------------------------------------------------------------------------------------------------

.is_boss_room
|0AE910| STZ.b $02
|0AE912| STZ.b $0F

|0AE914| LDA.w $020E
|0AE917| SEC
|0AE918| SBC.w DungeonMap_BossRoomFloor+0,X
|0AE91B| STA.b $0E

|0AE91D| BPL .dont_invert

|0AE91F| EOR.b #$FF
|0AE921| INC A
|0AE922| STA.b $0E

|0AE924| INC.b $02
|0AE926| INC.b $02

;---------------------------------------------------------------------------------------------------

.dont_invert
|0AE928| SEP #$10

|0AE92A| LDY.b $02

|0AE92C| REP #$20

.adjust_next
|0AE92E| DEC.b $0E
|0AE930| BMI .done

|0AE932| LDA.w $0FAA
|0AE935| CLC
|0AE936| ADC.w DungeonMap_PanValues,Y
|0AE939| STA.w $0FAA

|0AE93C| BRA .adjust_next

;---------------------------------------------------------------------------------------------------

.done
|0AE93E| LDA.w $0FAA
|0AE941| CLC
|0AE942| ADC.w DungeonMapRoomMarkerYBase
|0AE945| STA.w $0FAA

|0AE948| SEP #$20

|0AE94A| INC.w $0200

|0AE94D| STZ.b $13
|0AE94F| STZ.w $020D

|0AE952| PLB

|0AE953| RTL

;---------------------------------------------------------------------------------------------------

DungeonMap_HandleInputAndSprites:
|0AE954| JSL DungeonMap_HandleInput

|0AE958| JMP.w DungeonMap_DrawSprites

;===================================================================================================

DungeonMap_HandleInput:
|0AE95B| PHB
|0AE95C| PHK
|0AE95D| PLB

|0AE95E| LDA.b $F6
|0AE960| AND.b #$40

|0AE962| BNE .close_map

|0AE964| JSL DungeonMap_HandleMovementInput

|0AE968| PLB

|0AE969| RTL

;---------------------------------------------------------------------------------------------------

.close_map
|0AE96A| INC.w $0200
|0AE96D| INC.w $0200
|0AE970| STZ.w $020D

|0AE973| PLB

|0AE974| RTL

;===================================================================================================

DungeonMap_PanValues:
|0AE975| dw  96
|0AE977| dw -96

;===================================================================================================

DungeonMap_HandleMovementInput:
|0AE979| JSL DungeonMap_HandleFloorSelect

|0AE97D| LDA.w $0210
|0AE980| BEQ .exit

|0AE982| JMP.w DungeonMap_ScrollFloors

.exit
|0AE985| RTL

;===================================================================================================

DungeonMap_HandleFloorSelect:
|0AE986| REP #$30

|0AE988| LDX.w $040C

|0AE98B| LDA.w DungeonMapFloorCountData,X
|0AE98E| AND.w #$00F0
|0AE991| LSR A
|0AE992| LSR A
|0AE993| LSR A
|0AE994| LSR A
|0AE995| STA.b $00

|0AE997| LDA.w DungeonMapFloorCountData,X
|0AE99A| AND.w #$000F
|0AE99D| CLC
|0AE99E| ADC.b $00

|0AE9A0| CMP.w #$0003
|0AE9A3| BMI .ignore_input

;---------------------------------------------------------------------------------------------------

|0AE9A5| SEP #$30

|0AE9A7| LDA.w $0210
|0AE9AA| BNE .ignore_input

|0AE9AC| LDA.b $F0
|0AE9AE| AND.b #$0C
|0AE9B0| BNE .pressed_up_or_down

;---------------------------------------------------------------------------------------------------

.ignore_input
|0AE9B2| JMP.w .proceed_to_exit

;---------------------------------------------------------------------------------------------------

.pressed_up_or_down
|0AE9B5| STA.b $0A

|0AE9B7| STZ.w $020F

|0AE9BA| AND.b #$08
|0AE9BC| BEQ .didnt_press_up

;---------------------------------------------------------------------------------------------------

|0AE9BE| REP #$30

|0AE9C0| LDX.w $040C

|0AE9C3| LDA.w DungeonMapFloorCountData,X
|0AE9C6| AND.w #$00F0

|0AE9C9| LSR A
|0AE9CA| LSR A
|0AE9CB| LSR A
|0AE9CC| LSR A

|0AE9CD| DEC A
|0AE9CE| CMP.w $020E
|0AE9D1| BNE .continue_a

|0AE9D3| JMP.w .proceed_to_exit

;---------------------------------------------------------------------------------------------------

.continue_a
|0AE9D6| INC.w $020E

|0AE9D9| LDA.b $06
|0AE9DB| SEC
|0AE9DC| SBC.w #$0300
|0AE9DF| AND.w #$0FFF
|0AE9E2| STA.b $06

|0AE9E4| BRA .continue_b

;---------------------------------------------------------------------------------------------------

.didnt_press_up
|0AE9E6| REP #$30

|0AE9E8| LDX.w $040C

|0AE9EB| LDA.w DungeonMapFloorCountData,X
|0AE9EE| AND.w #$000F
|0AE9F1| EOR.w #$00FF

|0AE9F4| INC A
|0AE9F5| INC A
|0AE9F6| AND.w #$00FF

|0AE9F9| CMP.w $020E
|0AE9FC| BEQ .proceed_to_exit

|0AE9FE| DEC.w $020E
|0AEA01| DEC.w $020E

|0AEA04| LDA.b $06
|0AEA06| CLC
|0AEA07| ADC.w #$0600
|0AEA0A| AND.w #$0FFF
|0AEA0D| STA.b $06

;---------------------------------------------------------------------------------------------------

.continue_b
|0AEA0F| SEP #$20

|0AEA11| LDA.w $020E
|0AEA14| CMP.b $A4
|0AEA16| BNE .useless_floor_level_check

|0AEA18| REP #$20

|0AEA1A| BRA .check_useless_property

.useless_floor_level_check
|0AEA1C| BMI .useless_bitmode_branch

|0AEA1E| REP #$20

|0AEA20| BRA .check_useless_property

;---------------------------------------------------------------------------------------------------

.useless_bitmode_branch
|0AEA22| REP #$20

.check_useless_property
|0AEA24| LDA.w $020E
|0AEA27| AND.w #$0080
|0AEA2A| BNE .useless_property_change

|0AEA2C| LDA.w #$EFFF
|0AEA2F| STA.b $08

|0AEA31| BRA .ignore_useless_property_change

.useless_property_change
|0AEA33| LDA.w #$EFFF
|0AEA36| STA.b $08

.ignore_useless_property_change
|0AEA38| SEP #$20

|0AEA3A| JSR DungeonMap_DrawFloorNumbersByRoom
|0AEA3D| JSR DungeonMap_DrawBorderForRooms
|0AEA40| JSR DungeonMap_DrawDungeonLayout

|0AEA43| SEP #$20

|0AEA45| INC.w $0210

|0AEA48| LDA.b $0A
|0AEA4A| AND.b #$08
|0AEA4C| LSR A
|0AEA4D| LSR A
|0AEA4E| TAX

|0AEA4F| REP #$30

|0AEA51| LDA.b $E8
|0AEA53| CLC
|0AEA54| ADC.w DungeonMap_PanValues,X
|0AEA57| STA.w $0213

|0AEA5A| LDA.b $0A
|0AEA5C| AND.w #$0008
|0AEA5F| BNE .pressed_up

|0AEA61| LDA.b $06
|0AEA63| SEC
|0AEA64| SBC.w #$0300
|0AEA67| AND.w #$0FFF
|0AEA6A| STA.b $06

|0AEA6C| INC.w $020E

;---------------------------------------------------------------------------------------------------

.pressed_up
|0AEA6F| SEP #$20

|0AEA71| LDA.b #$08
|0AEA73| STA.b $17

.proceed_to_exit
|0AEA75| BRA EXIT_0AEAAF

;===================================================================================================

pool DungeonMap_ScrollFloors

.speed_bg
|0AEA77| dw   4 ; down
|0AEA79| dw  -4 ; up

.speed_sprites
|0AEA7B| dw  -4 ; down
|0AEA7D| dw   4 ; up

endpool

;---------------------------------------------------------------------------------------------------

DungeonMap_ScrollFloors:
|0AEA7F| REP #$30

|0AEA81| LDA.b $0A
|0AEA83| AND.w #$0008
|0AEA86| LSR A
|0AEA87| LSR A
|0AEA88| TAX

|0AEA89| LDA.w $0217
|0AEA8C| CLC
|0AEA8D| ADC.w .speed_sprites,X
|0AEA90| STA.w $0217

|0AEA93| LDA.w $0FAA
|0AEA96| CLC
|0AEA97| ADC.w .speed_sprites,X
|0AEA9A| STA.w $0FAA

|0AEA9D| LDA.b $E8
|0AEA9F| CLC
|0AEAA0| ADC.w .speed_bg,X
|0AEAA3| STA.b $E8

|0AEAA5| CMP.w $0213
|0AEAA8| BNE EXIT_0AEAAF

|0AEAAA| SEP #$20

|0AEAAC| STZ.w $0210

;---------------------------------------------------------------------------------------------------

#EXIT_0AEAAF:
|0AEAAF| SEP #$30

|0AEAB1| RTL

;===================================================================================================

DungeonMap_DrawSprites:
|0AEAB2| PHB
|0AEAB3| PHK
|0AEAB4| PLB

|0AEAB5| REP #$10

|0AEAB7| LDX.w $040C

|0AEABA| LDA.w DungeonMapFloorCountData,X

|0AEABD| AND.b #$0F
|0AEABF| STA.b $02

|0AEAC1| CLC
|0AEAC2| ADC.b $A4
|0AEAC4| STA.b $01
|0AEAC6| STA.b $03

;---------------------------------------------------------------------------------------------------

|0AEAC8| SEP #$10

|0AEACA| STZ.b $00
|0AEACC| STZ.b $0E

|0AEACE| JSR DungeonMap_DrawLinkPointing

|0AEAD1| INC.b $00

.next_marker
|0AEAD3| JSR DungeonMap_DrawLocationMarker

|0AEAD6| INC.b $0E

|0AEAD8| LDA.b $00
|0AEADA| CMP.b #$09
|0AEADC| BNE .next_marker

|0AEADE| JSR DungeonMap_DrawBlinkingIndicator

|0AEAE1| INC.b $00

|0AEAE3| JSR DungeonMap_DrawBossIcon
|0AEAE6| JSR DungeonMap_DrawFloorNumberObjects
|0AEAE9| JSR DungeonMap_DrawFloorBlinker

|0AEAEC| PLB

|0AEAED| RTL

;===================================================================================================

LinkPointingPositionX:
|0AEAEE| db $19

BossIconPositionY:
|0AEAEF| db $4C

;===================================================================================================

DungeonMap_DrawLinkPointing:
|0AEAF0| REP #$10

|0AEAF2| LDA.b #$04
|0AEAF4| SEC
|0AEAF5| SBC.b $02
|0AEAF7| BMI .y_offset_done

|0AEAF9| CLC
|0AEAFA| ADC.b $03
|0AEAFC| STA.b $03

|0AEAFE| LDA.w DungeonMapFloorCountData,X

|0AEB01| LSR A
|0AEB02| LSR A
|0AEB03| LSR A
|0AEB04| LSR A

|0AEB05| SEC
|0AEB06| SBC.b #$04
|0AEB08| BMI .y_offset_done

|0AEB0A| SEC
|0AEB0B| SBC.b $03

|0AEB0D| EOR.b #$FF
|0AEB0F| INC A
|0AEB10| STA.b $03

;---------------------------------------------------------------------------------------------------

.y_offset_done
|0AEB12| SEP #$10

|0AEB14| LDX.b $00

|0AEB16| LDA.b #$02
|0AEB18| STA.w $0A20,X

|0AEB1B| TXA
|0AEB1C| ASL A
|0AEB1D| ASL A
|0AEB1E| TAX

|0AEB1F| LDA.w LinkPointingPositionX
|0AEB22| STA.w $0800,X

|0AEB25| LDY.b $03

|0AEB27| LDA.w FloorIconOffsetY,Y
|0AEB2A| SEC
|0AEB2B| SBC.b #$04

|0AEB2D| STA.w $0801,X
|0AEB30| STZ.w $0802,X

|0AEB33| LDA.b #$3E

|0AEB35| LDY.w $0ABD
|0AEB38| BEQ .set_priority

|0AEB3A| LDA.b #$30

.set_priority
|0AEB3C| STA.w $0803,X

|0AEB3F| RTS

;===================================================================================================

pool DungeonMap_DrawBlinkingIndicator

.tile
|0AEB40| db $34, $35, $36, $34
|0AEB44| db $31, $32, $33, $32

.prop
|0AEB48| db $39, $3B, $3D, $3B
|0AEB4C| db $3B, $3B, $3B, $3B

endpool

;---------------------------------------------------------------------------------------------------

DungeonMap_DrawBlinkingIndicator:
|0AEB50| LDX.b $00

|0AEB52| LDA.b #$00
|0AEB54| STA.w $0A20,X

|0AEB57| TXA
|0AEB58| ASL A
|0AEB59| ASL A
|0AEB5A| TAX

|0AEB5B| LDA.w $0215
|0AEB5E| SEC
|0AEB5F| SBC.b #$03
|0AEB61| STA.w $0800,X

;---------------------------------------------------------------------------------------------------

|0AEB64| LDA.w $0218
|0AEB67| BEQ .on_screen

|0AEB69| LDA.b #$F0
|0AEB6B| BRA .continue

.on_screen
|0AEB6D| LDA.w $0217

;---------------------------------------------------------------------------------------------------

.continue
|0AEB70| SEC
|0AEB71| SBC.b #$03
|0AEB73| STA.w $0801,X

|0AEB76| LDA.b $1A
|0AEB78| AND.b #$0C
|0AEB7A| LSR A
|0AEB7B| LSR A
|0AEB7C| TAY

|0AEB7D| LDA.w .tile
|0AEB80| STA.w $0802,X

|0AEB83| LDA.w .prop,Y
|0AEB86| STA.w $0803,X

|0AEB89| RTS

;===================================================================================================

pool DungeonMap_DrawLocationMarker

.offset_x
|0AEB8A| db  -9 ; top left
|0AEB8B| db   8 ; top right
|0AEB8C| db  -9 ; bottom left
|0AEB8D| db   8 ; bottom right

.offset_y
|0AEB8E| db  -8 ; top left
|0AEB8F| db  -8 ; top right
|0AEB90| db   9 ; bottom left
|0AEB91| db   9 ; bottom right

.props
|0AEB92| db $F1 ; top left
|0AEB93| db $B1 ; top right
|0AEB94| db $71 ; bottom left
|0AEB95| db $31 ; bottom right

.palette_flash
|0AEB96| db $0C, $0C
|0AEB98| db $08, $0A

.unsued
|0AEB9A| dw $0000, $0060, $00C0, $0120
|0AEBA2| dw $0180, $01E0, $0240

endpool

;---------------------------------------------------------------------------------------------------

DungeonMap_DrawLocationMarker:
|0AEBA8| LDY.b #$03

.next_object
|0AEBAA| LDA.b $00
|0AEBAC| TAX

|0AEBAD| LDA.b #$02
|0AEBAF| STA.w $0A20,X

|0AEBB2| TXA
|0AEBB3| ASL A
|0AEBB4| ASL A
|0AEBB5| TAX

|0AEBB6| LDA.w $0215
|0AEBB9| AND.b #$F0
|0AEBBB| CLC
|0AEBBC| ADC.w .offset_x,Y
|0AEBBF| STA.w $0800,X

|0AEBC2| PHY

|0AEBC3| LDA.b $0E
|0AEBC5| ASL A
|0AEBC6| TAY

|0AEBC7| LDA.w $0CF5
|0AEBCA| CLC
|0AEBCB| ADC.w DungeonMapRoomMarkerYBase,Y
|0AEBCE| STA.b $0F

|0AEBD0| PLY

|0AEBD1| CLC
|0AEBD2| ADC.w .offset_y,Y
|0AEBD5| STA.w $0801,X

|0AEBD8| STZ.w $0802,X

|0AEBDB| LDA.w .props,Y
|0AEBDE| STA.b $0C

|0AEBE0| PHY

|0AEBE1| LDA.b $1A
|0AEBE3| LSR A
|0AEBE4| LSR A
|0AEBE5| AND.b #$01
|0AEBE7| TAY

|0AEBE8| INC.b $0F

|0AEBEA| LDA.w $0217
|0AEBED| INC A
|0AEBEE| AND.b #$F0
|0AEBF0| CMP.b $0F
|0AEBF2| BNE .use_set_a

|0AEBF4| LDA.w $0218
|0AEBF7| BNE .use_set_a

|0AEBF9| INY
|0AEBFA| INY

.use_set_a
|0AEBFB| LDA.b $0C
|0AEBFD| ORA.w .palette_flash,Y
|0AEC00| STA.w $0803,X

|0AEC03| PLY

|0AEC04| INC.b $00

|0AEC06| DEY
|0AEC07| BPL .next_object

|0AEC09| RTS

;===================================================================================================

DungeonMap_DrawFloorNumberObjects:
|0AEC0A| REP #$10

|0AEC0C| LDX.w $040C

|0AEC0F| LDA.w DungeonMapFloorCountData,X
|0AEC12| PHA

|0AEC13| LSR A
|0AEC14| LSR A
|0AEC15| LSR A
|0AEC16| LSR A
|0AEC17| STA.b $02

|0AEC19| PLA
|0AEC1A| AND.b #$0F
|0AEC1C| STA.b $03

|0AEC1E| SEP #$10

|0AEC20| LDY.b #$07

|0AEC22| LDA.b $02
|0AEC24| CLC
|0AEC25| ADC.b $03
|0AEC27| CMP.b #$08
|0AEC29| BEQ .start_draw

|0AEC2B| LDA.b $02
|0AEC2D| CMP.b #$04
|0AEC2F| BPL .start_draw

|0AEC31| DEY

|0AEC32| LDX.b #$03
|0AEC34| STX.b $04

.count_floors_above
|0AEC36| CMP.b $04
|0AEC38| BEQ .done_floors_above

|0AEC3A| DEY
|0AEC3B| DEC.b $04
|0AEC3D| BNE .count_floors_above

.done_floors_above
|0AEC3F| LDA.b $03
|0AEC41| CMP.b #$05
|0AEC43| BMI .start_draw

|0AEC45| LDX.b #$05
|0AEC47| STX.b $04

.count_floors_below
|0AEC49| CMP.b $04
|0AEC4B| BEQ .start_draw

|0AEC4D| INY

|0AEC4E| INC.b $04
|0AEC50| CMP.b #$08
|0AEC52| BNE .count_floors_below

;---------------------------------------------------------------------------------------------------

.start_draw
|0AEC54| LDA.w FloorIconOffsetY,Y
|0AEC57| INC A
|0AEC58| STA.b $04

|0AEC5A| DEC.b $02

|0AEC5C| LDA.b $03
|0AEC5E| EOR.b #$FF
|0AEC60| INC A
|0AEC61| STA.b $03

;---------------------------------------------------------------------------------------------------

.next
|0AEC63| LDX.b $00

|0AEC65| LDA.b #$00
|0AEC67| STA.w $0A20,X
|0AEC6A| STA.w $0A21,X

|0AEC6D| TXA
|0AEC6E| ASL A
|0AEC6F| ASL A
|0AEC70| TAX

|0AEC71| LDA.b #$30
|0AEC73| STA.w $0800,X

|0AEC76| LDA.b #$38
|0AEC78| STA.w $0804,X

|0AEC7B| LDA.b $04
|0AEC7D| STA.w $0801,X
|0AEC80| STA.w $0805,X

|0AEC83| CLC
|0AEC84| ADC.b #$10
|0AEC86| STA.b $04

|0AEC88| LDA.b #$3D
|0AEC8A| STA.w $0803,X
|0AEC8D| STA.w $0807,X

|0AEC90| LDA.b #$1C
|0AEC92| STA.w $0802,X

|0AEC95| LDA.b #$1D
|0AEC97| STA.w $0806,X

|0AEC9A| LDY.b $02
|0AEC9C| BMI .negative

|0AEC9E| LDA.w FloorNumberOAMChar,Y
|0AECA1| STA.w $0802,X

|0AECA4| BRA .to_next

.negative
|0AECA6| TYA
|0AECA7| EOR.b #$FF
|0AECA9| TAY

|0AECAA| LDA.w FloorNumberOAMChar,Y
|0AECAD| STA.w $0806,X

.to_next
|0AECB0| INC.b $00
|0AECB2| INC.b $00

|0AECB4| DEC.b $02

|0AECB6| LDA.b $02
|0AECB8| INC A
|0AECB9| CMP.b $03
|0AECBB| BNE .next

|0AECBD| RTS

;===================================================================================================

FloorIconOffsetY:
|0AECBE| db $BB
|0AECBF| db $AB
|0AECC0| db $9B
|0AECC1| db $8B
|0AECC2| db $7B
|0AECC3| db $6B
|0AECC4| db $5B
|0AECC5| db $4B

;---------------------------------------------------------------------------------------------------

FloorNumberOAMChar:
|0AECC6| db $1E ; 1
|0AECC7| db $1F ; 2
|0AECC8| db $20 ; 3
|0AECC9| db $21 ; 4
|0AECCA| db $22 ; 5
|0AECCB| db $23 ; 6
|0AECCC| db $24 ; 7
|0AECCD| db $25 ; 8

;---------------------------------------------------------------------------------------------------

FloorNumberBlinkProps:
|0AECCE| db $3D

;===================================================================================================

DungeonMap_DrawFloorBlinker:
|0AECCF| LDA.b $00
|0AECD1| STA.b $05

|0AECD3| LDA.w $020E
|0AECD6| STA.b $03

|0AECD8| LDY.b #$00

|0AECDA| REP #$10

|0AECDC| LDX.w $040C

|0AECDF| LDA.w DungeonMapFloorCountData,X
|0AECE2| LSR A
|0AECE3| LSR A
|0AECE4| LSR A
|0AECE5| LSR A
|0AECE6| STA.b $02

|0AECE8| LDA.w DungeonMapFloorCountData,X
|0AECEB| AND.b #$0F

|0AECED| SEP #$10

|0AECEF| CLC
|0AECF0| ADC.b $02
|0AECF2| CMP.b #$01
|0AECF4| BEQ .has_floors

|0AECF6| INC.b $05
|0AECF8| INC.b $05

|0AECFA| DEC.b $03

|0AECFC| LDY.b #$01

.has_floors
|0AECFE| STY.b $02

;---------------------------------------------------------------------------------------------------

.next_check
|0AED00| LDX.b $02

|0AED02| LDA.w FloorNumberBlinkProps
|0AED05| STA.b $0E,X

|0AED07| REP #$10

|0AED09| LDX.w $040C

|0AED0C| LDA.w DungeonMapFloorCountData,X
|0AED0F| AND.b #$0F
|0AED11| STA.b $01

|0AED13| CLC
|0AED14| ADC.b $03
|0AED16| STA.b $00

|0AED18| LDA.b #$04
|0AED1A| SEC
|0AED1B| SBC.b $01
|0AED1D| BMI .to_next

|0AED1F| CLC
|0AED20| ADC.b $00
|0AED22| STA.b $00

|0AED24| LDA.w DungeonMapFloorCountData,X
|0AED27| LSR A
|0AED28| LSR A
|0AED29| LSR A
|0AED2A| LSR A
|0AED2B| SEC
|0AED2C| SBC.b #$04
|0AED2E| BMI .to_next

|0AED30| SEC
|0AED31| SBC.b $00
|0AED33| EOR.b #$FF
|0AED35| INC A
|0AED36| STA.b $00

.to_next
|0AED38| SEP #$10

|0AED3A| DEC.b $05
|0AED3C| DEC.b $05

|0AED3E| INC.b $03

|0AED40| DEC.b $02
|0AED42| BMI .check_for_blinking

|0AED44| BRL .next_check

;---------------------------------------------------------------------------------------------------

.check_for_blinking
|0AED47| LDA.b $1A
|0AED49| AND.b #$10
|0AED4B| BNE .blink_on

|0AED4D| RTS

;---------------------------------------------------------------------------------------------------

.oam_data_offset
|0AED4E| db $00, $08

.char
|0AED50| db $37, $38, $38, $37

;---------------------------------------------------------------------------------------------------

.blink_on
|0AED54| LDY.b $00

|0AED56| LDA.w FloorIconOffsetY,Y
|0AED59| SEC
|0AED5A| SBC.b #$04
|0AED5C| STA.b $02

|0AED5E| CLC
|0AED5F| ADC.b #$10
|0AED61| STA.b $03

|0AED63| LDY.b #$00

|0AED65| REP #$10

|0AED67| LDX.w $040C

|0AED6A| LDA.w DungeonMapFloorCountData,X
|0AED6D| LSR A
|0AED6E| LSR A
|0AED6F| LSR A
|0AED70| LSR A
|0AED71| STA.b $0D

|0AED73| LDA.w DungeonMapFloorCountData,X
|0AED76| AND.b #$0F

|0AED78| SEP #$10

|0AED7A| CLC
|0AED7B| ADC.b $0D
|0AED7D| CMP.b #$01
|0AED7F| BEQ .only_one_floor

|0AED81| LDY.b #$01

.only_one_floor
|0AED83| STY.b $0D

;---------------------------------------------------------------------------------------------------

.next_floor_box
|0AED85| LDA.b #$28
|0AED87| STA.b $01

|0AED89| LDA.b #$03
|0AED8B| STA.b $0C

|0AED8D| LDX.b $0D

|0AED8F| LDA.w .oam_data_offset,X
|0AED92| TAY

.next_highlight
|0AED93| LDA.b #$00
|0AED95| STA.w $0A60,Y
|0AED98| STA.w $0A64,Y

|0AED9B| PHY

|0AED9C| TYA
|0AED9D| ASL A
|0AED9E| ASL A
|0AED9F| TAY

|0AEDA0| LDA.b $01
|0AEDA2| STA.w $0900,Y
|0AEDA5| STA.w $0910,Y

|0AEDA8| LDA.b $02,X
|0AEDAA| STA.w $0901,Y

|0AEDAD| CLC
|0AEDAE| ADC.b #$08
|0AEDB0| STA.w $0911,Y

|0AEDB3| PHX

|0AEDB4| LDX.b $0C

|0AEDB6| LDA.w .char,X
|0AEDB9| STA.w $0902,Y
|0AEDBC| STA.w $0912,Y

|0AEDBF| PLX

|0AEDC0| PHY

|0AEDC1| LDA.b $0E,X

|0AEDC3| LDY.b $0C
|0AEDC5| BNE .no_hflip

|0AEDC7| ORA.b #$40

.no_hflip
|0AEDC9| PLY
|0AEDCA| STA.w $0903,Y

|0AEDCD| ORA.b #$80
|0AEDCF| STA.w $0913,Y

|0AEDD2| PLY
|0AEDD3| INY

|0AEDD4| LDA.b $01
|0AEDD6| CLC
|0AEDD7| ADC.b #$08
|0AEDD9| STA.b $01

|0AEDDB| DEC.b $0C
|0AEDDD| BPL .next_highlight

|0AEDDF| DEC.b $0D
|0AEDE1| BPL .next_floor_box

|0AEDE3| RTS

;===================================================================================================

DungeonMap_DrawBossIcon:
|0AEDE4| REP #$10

|0AEDE6| LDX.w $040C

|0AEDE9| REP #$20

|0AEDEB| PHX

|0AEDEC| LDA.w DungeonMapBossRooms,X
|0AEDEF| ASL A
|0AEDF0| TAX

|0AEDF1| SEP #$20

|0AEDF3| LDA.l $7EF001,X
|0AEDF7| PLX

|0AEDF8| AND.b #$08
|0AEDFA| BNE .exit_a

|0AEDFC| REP #$20

|0AEDFE| LDA.l $7EF364
|0AEE02| AND.l BitMasks,X

|0AEE06| SEP #$20

|0AEE08| BEQ .exit_a

|0AEE0A| LDA.w DungeonMap_BossRoomFloor+1,X
|0AEE0D| BPL .draw_a_skull

.exit_a
|0AEE0F| SEP #$10

|0AEE11| RTS

;---------------------------------------------------------------------------------------------------

.draw_a_skull
|0AEE12| PHX

|0AEE13| JSR DungeonMap_DrawBossIconByFloor

|0AEE16| PLX

|0AEE17| SEP #$10

|0AEE19| LDA.b $1A
|0AEE1B| AND.b #$0F
|0AEE1D| CMP.b #$0A
|0AEE1F| BCS .exit_b

;---------------------------------------------------------------------------------------------------

|0AEE21| LDY.b $00

|0AEE23| LDA.b #$00
|0AEE25| STA.w $0A20,Y

|0AEE28| TYA
|0AEE29| ASL A
|0AEE2A| ASL A
|0AEE2B| TAY

|0AEE2C| LDA.w .offsets+1,X
|0AEE2F| CLC
|0AEE30| ADC.w $0FA8

|0AEE33| CLC
|0AEE34| ADC.b #$90
|0AEE36| STA.w $0800,Y

|0AEE39| LDA.w $0FAB
|0AEE3C| BEQ .on_screen

|0AEE3E| LDA.b #$F0
|0AEE40| BRA .continue

;---------------------------------------------------------------------------------------------------

.on_screen
|0AEE42| LDA.w .offsets+0,X
|0AEE45| CLC
|0AEE46| ADC.w $0FAA

.continue
|0AEE49| STA.w $0801,Y

|0AEE4C| LDA.w DungeonMap_BossSkull_char
|0AEE4F| STA.w $0802,Y

|0AEE52| LDA.w DungeonMap_BossSkull_prop
|0AEE55| STA.w $0803,Y

|0AEE58| INC.b $00

.exit_b
|0AEE5A| RTS

;===================================================================================================

#DungeonMap_BossSkull_char:
|0AEE5B| db $31

#DungeonMap_BossSkull_prop:
|0AEE5C| db $33

;===================================================================================================

.offsets
|0AEE5D| db $FF, $FF, $FF, $FF
|0AEE61| db $08, $08, $08, $00
|0AEE65| db $00, $00, $08, $00
|0AEE69| db $08, $08, $08, $00
|0AEE6D| db $08, $08, $00, $08
|0AEE71| db $04, $04, $08, $08
|0AEE75| db $08, $00, $08, $00

;===================================================================================================

DungeonMap_BossRoomFloor:
|0AEE79| dw $FFFF ; // - Sewers
|0AEE7B| dw $FFFF ; // - Hyrule Castle
|0AEE7D| dw $0001 ; 2F - Eastern Palace
|0AEE7F| dw $0001 ; 2F - Desert Palace
|0AEE81| dw $0006 ; 7F - Agahnim's Tower
|0AEE83| dw $00FF ; B1 - Swamp Palace
|0AEE85| dw $00FF ; B1 - Palace of Darkness
|0AEE87| dw $00FF ; B1 - Misery Mire
|0AEE89| dw $00FE ; B2 - Skull Woods
|0AEE8B| dw $00F9 ; B7 - Ice Palace
|0AEE8D| dw $0005 ; 6F - Tower of Hera
|0AEE8F| dw $00FF ; B1 - Thieves' Town
|0AEE91| dw $00FD ; B3 - Turtle Rock
|0AEE93| dw $0006 ; 7F - Ganon's Tower

;===================================================================================================

DungeonMap_DrawBossIconByFloor:
|0AEE95| LDA.w DungeonMapFloorCountData,X
|0AEE98| AND.b #$0F
|0AEE9A| STA.b $02

|0AEE9C| CLC
|0AEE9D| ADC.w DungeonMap_BossRoomFloor+0,X
|0AEEA0| STA.b $03

|0AEEA2| LDA.b #$04
|0AEEA4| SEC
|0AEEA5| SBC.b $02
|0AEEA7| BMI .floor_is_fine

|0AEEA9| CLC
|0AEEAA| ADC.b $03
|0AEEAC| STA.b $03

|0AEEAE| LDA.w DungeonMapFloorCountData,X

|0AEEB1| LSR A
|0AEEB2| LSR A
|0AEEB3| LSR A
|0AEEB4| LSR A

|0AEEB5| SEC
|0AEEB6| SBC.b #$04
|0AEEB8| BMI .floor_is_fine

|0AEEBA| SEC
|0AEEBB| SBC.b $03

|0AEEBD| EOR.b #$FF
|0AEEBF| INC A
|0AEEC0| STA.b $03

;---------------------------------------------------------------------------------------------------

.floor_is_fine
|0AEEC2| SEP #$10

|0AEEC4| LDA.b $1A
|0AEEC6| AND.b #$0F
|0AEEC8| CMP.b #$0A
|0AEECA| BCS .exit

|0AEECC| LDX.b $00

|0AEECE| LDA.b #$00
|0AEED0| STA.w $0A20,X

|0AEED3| TXA
|0AEED4| ASL A
|0AEED5| ASL A
|0AEED6| TAX

|0AEED7| LDA.w BossIconPositionY
|0AEEDA| STA.w $0800,X

|0AEEDD| LDY.b $03

|0AEEDF| LDA.w FloorIconOffsetY,Y
|0AEEE2| STA.w $0801,X

|0AEEE5| LDA.w DungeonMap_BossSkull_char
|0AEEE8| STA.w $0802,X

|0AEEEB| LDA.w DungeonMap_BossSkull_prop
|0AEEEE| STA.w $0803,X

|0AEEF1| INC.b $00

.exit
|0AEEF3| REP #$10

|0AEEF5| RTS

;===================================================================================================

Module0E_03_04_UnusedCrazyScroll:
|0AEEF6| REP #$30

|0AEEF8| LDA.w $0213
|0AEEFB| CLC
|0AEEFC| ADC.b $E8
|0AEEFE| STA.b $E8

|0AEF00| LDA.w $0213
|0AEF03| EOR.w #$FFFF
|0AEF06| INC A

|0AEF07| CLC
|0AEF08| ADC.w $0217
|0AEF0B| STA.w $0217

|0AEF0E| SEP #$30

|0AEF10| DEC.w $0205
|0AEF13| BNE .exit

|0AEF15| DEC.w $0200

.exit
|0AEF18| RTL

;===================================================================================================

UnderworldMap_RecoverGFX:
|0AEF19| LDA.b $9B
|0AEF1B| PHA

|0AEF1C| STZ.w HDMAEN
|0AEF1F| STZ.b $9B

|0AEF21| JSL EraseTilemaps_normal

;---------------------------------------------------------------------------------------------------

|0AEF25| LDA.l $7EC211
|0AEF29| STA.b $1C

|0AEF2B| LDA.l $7EC212
|0AEF2F| STA.l $00001D

|0AEF33| LDA.l $7EC20E
|0AEF37| STA.w $0AA1

|0AEF3A| LDA.l $7EC20F
|0AEF3E| STA.w $0AA3

|0AEF41| LDA.l $7EC210
|0AEF45| STA.w $0AA2

|0AEF48| JSL InitializeTilesets

|0AEF4C| STZ.w $0AA9
|0AEF4F| STZ.w $0AB2

|0AEF52| JSL RebuildHUD_long2

|0AEF56| STZ.w $0418
|0AEF59| STZ.w $045C

.next_quadrant
|0AEF5C| JSL BuildBG1QuadrantForUpload
|0AEF60| JSL NMI_UploadTilemap_long

|0AEF64| JSL BuildBG2QuadrantForUpload
|0AEF68| JSL NMI_UploadTilemap_long

|0AEF6C| LDA.w $045C
|0AEF6F| CMP.b #$10
|0AEF71| BNE .next_quadrant

|0AEF73| STZ.b $17
|0AEF75| STZ.b $B0

|0AEF77| PLA
|0AEF78| STA.b $9B

;---------------------------------------------------------------------------------------------------

|0AEF7A| REP #$20

|0AEF7C| LDX.b #$00

.copy_next_color
|0AEF7E| LDA.l $7FDD80,X
|0AEF82| STA.l $7EC500,X

|0AEF86| LDA.l $7FDE00,X
|0AEF8A| STA.l $7EC580,X

|0AEF8E| LDA.l $7FDE80,X
|0AEF92| STA.l $7EC600,X

|0AEF96| LDA.l $7FDF00,X
|0AEF9A| STA.l $7EC680,X

|0AEF9E| INX
|0AEF9F| INX
|0AEFA0| CPX.b #$80
|0AEFA2| BNE .copy_next_color

;---------------------------------------------------------------------------------------------------

|0AEFA4| SEP #$20

|0AEFA6| LDA.l $7EC017
|0AEFAA| TSB.b $9C
|0AEFAC| TSB.b $9D
|0AEFAE| TSB.b $9E

|0AEFB0| LDA.b #$10 ; SFX3.10
|0AEFB2| STA.w $012F

|0AEFB5| LDA.b #$F3 ; SONG F3 - max volume
|0AEFB7| STA.w $012C

|0AEFBA| JSL RecoverPegGFXFromMapping

|0AEFBE| INC.b $15
|0AEFC0| INC.w $0200

|0AEFC3| STZ.b $13
|0AEFC5| STZ.w $0710

|0AEFC8| RTL

;===================================================================================================

ToggleStarTilesAndAdvance:
|0AEFC9| JSL ToggleStarTileGraphics

|0AEFCD| INC.w $0200

|0AEFD0| RTL

;===================================================================================================

DungeonMap_BackdropFloorGradientTiles:
|0AEFD1| dw $1B28, $1B29, $1B2A, $1B2B, $1B2C, $1B2D, $1B2E

;===================================================================================================

DungeonMap_MountainStripes:
|0AEFDF| dw $AA10, $0100 ; VRAM $2154 | 2 bytes | Horizontal
|0AEFE3| dw $1B2F

|0AEFE5| dw $C910, $0300 ; VRAM $2192 | 4 bytes | Horizontal
|0AEFE9| dw $1B2F, $1B2E

|0AEFED| dw $E510, $0B00 ; VRAM $21CA | 12 bytes | Horizontal
|0AEFF1| dw $1B2F, $1B2E, $5B2F, $1B2F, $1B2E, $1B2E

|0AEFFD| dw $0311, $0100 ; VRAM $2206 | 2 bytes | Horizontal
|0AF001| dw $1B2F

|0AF003| dw $0411, $0C40 ; VRAM $2208 | 14 bytes | Fixed horizontal
|0AF007| dw $1B2E

;===================================================================================================

DungeonMap_RoomTemplates:

;---------------------------------------------------------------------------------------------------

|0AF009| dw $0B61, $5361, $8B61, $8B62 ; 0x00 - ROOM 0011
|0AF011| dw $0B60, $0B63, $8B60, $0B64 ; 0x01 - ROOM 0021
|0AF019| dw $0B00, $0B00, $0B65, $0B66 ; 0x02 - ROOM 0022
|0AF021| dw $0B67, $4B67, $9367, $D367 ; 0x03 - ROOM 0032
|0AF029| dw $0B60, $5360, $8B60, $CB60 ; 0x04 - ROOM 0002
|0AF031| dw $0B6A, $4B6A, $4B6D, $0B6D ; 0x05 - ROOM 0012
|0AF039| dw $1368, $1369, $0B00, $0B00 ; 0x06 - ROOM 0042
|0AF041| dw $0B6A, $136B, $0B6C, $0B6D ; 0x07 - ROOM 0041

;---------------------------------------------------------------------------------------------------

|0AF049| dw $136E, $4B6E, $0B00, $0B00 ; 0x08 - ROOM 0080
|0AF051| dw $136F, $0B00, $0B00, $0B00 ; 0x09 - ROOM 0070
|0AF059| dw $1340, $0B00, $0B78, $1744 ; 0x0A - ROOM 0071
|0AF061| dw $536D, $136D, $4B76, $0B76 ; 0x0B - ROOM 0072
|0AF069| dw $0B70, $0B71, $0B72, $8B71 ; 0x0C - ROOM 0081
|0AF071| dw $0B75, $0B76, $8B75, $8B76 ; 0x0D - ROOM 0082
|0AF079| dw $0B00, $0B53, $0B00, $0B55 ; 0x0E - ROOM 0050
|0AF081| dw $1354, $5354, $0B00, $0B00 ; 0x0F - ROOM 0001
|0AF089| dw $4B53, $0B00, $0B56, $0B57 ; 0x10 - ROOM 0052
|0AF091| dw $0B00, $0B59, $0B00, $135E ; 0x11 - ROOM 0060
|0AF099| dw $135A, $135B, $135F, $535F ; 0x12 - ROOM 0061
|0AF0A1| dw $0B5C, $0B5D, $535E, $CB58 ; 0x13 - ROOM 0062
|0AF0A9| dw $0B50, $4B50, $1352, $5352 ; 0x14 - ROOM 0051

;---------------------------------------------------------------------------------------------------

|0AF0B1| dw $0B00, $0B40, $1345, $0B46 ; 0x15 - ROOM 0099
|0AF0B9| dw $8B42, $0B47, $0B42, $0B49 ; 0x16 - ROOM 00A8
|0AF0C1| dw $1348, $5348, $174A, $574A ; 0x17 - ROOM 00A9
|0AF0C9| dw $4B47, $CB42, $4B49, $4B42 ; 0x18 - ROOM 00AA
|0AF0D1| dw $0B00, $0B4B, $0B00, $0B4D ; 0x19 - ROOM 00B8
|0AF0D9| dw $0B4C, $4B4C, $0B4E, $4B4E ; 0x1A - ROOM 00B9
|0AF0E1| dw $0B51, $0B44, $0B00, $0B00 ; 0x1B - ROOM 00BA
|0AF0E9| dw $0B4F, $4B4F, $934F, $D34F ; 0x1C - ROOM 00C9
|0AF0F1| dw $0B00, $0B00, $0B00, $0B40 ; 0x1D - ROOM 00C8
|0AF0F9| dw $0B00, $0B41, $0B00, $0B42 ; 0x1E - ROOM 00D8
|0AF101| dw $0B00, $0B00, $0B43, $0B43 ; 0x1F - ROOM 00D9
|0AF109| dw $0B00, $0B00, $9344, $0B00 ; 0x20 - ROOM 00DA

;---------------------------------------------------------------------------------------------------

|0AF111| dw $1340, $0B00, $1341, $0B00 ; 0x21 - ROOM 0063
|0AF119| dw $1740, $0B40, $0B42, $0B7D ; 0x22 - ROOM 0073
|0AF121| dw $4B7A, $0B7A, $0B7E, $4B7E ; 0x23 - ROOM 0074
|0AF129| dw $0B40, $8B4D, $4BBA, $0B55 ; 0x24 - ROOM 0076
|0AF131| dw $0B40, $8B55, $1378, $CB53 ; 0x25 - ROOM 0083
|0AF139| dw $4B76, $4B75, $13BB, $53BB ; 0x26 - ROOM 0084
|0AF141| dw $4B7F, $4B42, $0B83, $13BC ; 0x27 - ROOM 0086
|0AF149| dw $0B00, $0B00, $0B79, $0B00 ; 0x28 - ROOM 0033
|0AF151| dw $0B6E, $4B7C, $0B00, $0B41 ; 0x29 - ROOM 0042
|0AF159| dw $1340, $8B55, $0B42, $0B7B ; 0x2A - ROOM 0053

;---------------------------------------------------------------------------------------------------

|0AF161| dw $8B42, $9344, $1341, $0B00 ; 0x2B - ROOM 00E0
|0AF169| dw $0B53, $9344, $8B53, $9344 ; 0x2C - ROOM 00C0/ROOM 00D0
|0AF171| dw $8B42, $9344, $0B42, $9344 ; 0x2D - ROOM 00B0
|0AF179| dw $934D, $0B00, $8B53, $9344 ; 0x2E - ROOM 0040
|0AF181| dw $0B00, $0B00, $0B40, $0B00 ; 0x2F - ROOM 0020
|0AF189| dw $0B41, $0B00, $1384, $0B00 ; 0x30 - ROOM 0030

;---------------------------------------------------------------------------------------------------

|0AF191| dw $0BB8, $13B9, $4B85, $CB7C ; 0x31 - ROOM 0066
|0AF199| dw $0B87, $13B0, $4B7B, $9344 ; 0x32 - ROOM 0076
|0AF1A1| dw $0B00, $0B00, $0B40, $0B00 ; 0x33 - ROOM 0006
|0AF1A9| dw $0B91, $5391, $0B9C, $4B9C ; 0x34 - ROOM 0016
|0AF1B1| dw $8B42, $1392, $0B93, $1394 ; 0x35 - ROOM 0026
|0AF1B9| dw $0B95, $0B96, $9395, $8B96 ; 0x36 - ROOM 0034
|0AF1C1| dw $0B97, $0B98, $8B97, $8B98 ; 0x37 - ROOM 0035
|0AF1C9| dw $1799, $5799, $9799, $D799 ; 0x38 - ROOM 0036
|0AF1D1| dw $4B98, $4B97, $CB98, $CB97 ; 0x39 - ROOM 0037
|0AF1D9| dw $937B, $0B00, $0B7B, $0B00 ; 0x3A - ROOM 0038
|0AF1E1| dw $0BA6, $4BA6, $CB7A, $8B7A ; 0x3B - ROOM 0046
|0AF1E9| dw $0B8E, $4B8E, $938E, $CB8E ; 0x3C - ROOM 0054
|0AF1F1| dw $934D, $0B8F, $1390, $5390 ; 0x3D - ROOM 0028

;---------------------------------------------------------------------------------------------------

|0AF1F9| dw $0B00, $0B00, $0B00, $8B48 ; 0x3E - ROOM 005A
|0AF201| dw $0B00, $934E, $0B00, $8B4D ; 0x3F - ROOM 006A
|0AF209| dw $8B72, $1346, $0B45, $0B46 ; 0x40 - ROOM 000B
|0AF211| dw $5744, $1744, $0B00, $0B00 ; 0x41 - ROOM 000A
|0AF219| dw $134D, $0B00, $8B54, $0B00 ; 0x42 - ROOM 003B
|0AF221| dw $1349, $1349, $0B00, $0B00 ; 0x43 - ROOM 0009
|0AF229| dw $0B4B, $8B48, $0B72, $4B72 ; 0x44 - ROOM 004B
|0AF231| dw $0B00, $0B74, $0B00, $0BB0 ; 0x45 - ROOM 0019
|0AF239| dw $0B71, $1747, $17AF, $0B4B ; 0x46 - ROOM 001A
|0AF241| dw $0B6F, $1370, $0B4B, $0B00 ; 0x47 - ROOM 001B
|0AF249| dw $0B6B, $8B6C, $8B6B, $0BAD ; 0x48 - ROOM 002A
|0AF251| dw $0B73, $0B00, $13AE, $0B46 ; 0x49 - ROOM 002B
|0AF259| dw $176B, $576B, $0B6A, $4B6A ; 0x4A - ROOM 003A
|0AF261| dw $1368, $5368, $1369, $5369 ; 0x4B - ROOM 004A

;---------------------------------------------------------------------------------------------------

|0AF269| dw $8B4E, $0B00, $9354, $0B00 ; 0x4C - ROOM 00D5
|0AF271| dw $0B00, $0B00, $0B00, $5377 ; 0x4D - ROOM 0023

;---------------------------------------------------------------------------------------------------

|0AF279| dw $0B00, $974D, $0B00, $4B7B ; 0x4E - ROOM 0091
|0AF281| dw $0B40, $8B4D, $0B51, $0B8D ; 0x4F - ROOM 0092
|0AF289| dw $537A, $137A, $4B42, $8B40 ; 0x50 - ROOM 0093
|0AF291| dw $0B00, $0B00, $0B00, $0B00 ; 0x51 - UNUSED
|0AF299| dw $0B00, $0B00, $0B40, $0B00 ; 0x52 - ROOM 0090
|0AF2A1| dw $CB7A, $576E, $0B00, $0B00 ; 0x53 - ROOM 00A0
|0AF2A9| dw $0B6E, $0B9F, $0B00, $4BA5 ; 0x54 - ROOM 00A1
|0AF2B1| dw $13A0, $13A1, $0BA2, $0BA3 ; 0x55 - ROOM 00A2
|0AF2B9| dw $0BA4, $0B00, $0BA5, $0B00 ; 0x56 - ROOM 00A3
|0AF2C1| dw $0B40, $8B55, $0B42, $CB87 ; 0x57 - ROOM 00B1
|0AF2C9| dw $8B95, $0BA7, $8B42, $0BAF ; 0x58 - ROOM 00B2
|0AF2D1| dw $4B78, $0B00, $4B78, $0B00 ; 0x59 - ROOM 00B3
|0AF2D9| dw $8B42, $0B51, $0B78, $8B51 ; 0x5A - ROOM 00C1
|0AF2E1| dw $0BA8, $0BA9, $0BAC, $8BA9 ; 0x5B - ROOM 00C2
|0AF2E9| dw $0BAA, $17AB, $13B4, $8BAB ; 0x5C - ROOM 00C3
|0AF2F1| dw $17B1, $0B41, $4B44, $4B42 ; 0x5D - ROOM 00D1
|0AF2F9| dw $0B00, $0BAD, $0B00, $13AE ; 0x5E - ROOM 00D2
|0AF301| dw $1340, $0BB7, $0B42, $0BB6 ; 0x5F - ROOM 0097
|0AF309| dw $0B00, $0B00, $139D, $139E ; 0x60 - ROOM 0098

;---------------------------------------------------------------------------------------------------

|0AF311| dw $0B00, $0B00, $0B00, $0B79 ; 0x61 - ROOM 0029
|0AF319| dw $0B00, $0B00, $8B42, $0B86 ; 0x62 - ROOM 0039
|0AF321| dw $0B42, $8B7B, $8B42, $0B7B ; 0x63 - ROOM 0049
|0AF329| dw $0B87, $8B7B, $9387, $0B7B ; 0x64 - ROOM 0059
|0AF331| dw $0B40, $13B3, $1378, $0B8D ; 0x65 - ROOM 0056
|0AF339| dw $8B42, $0B88, $5378, $0B40 ; 0x66 - ROOM 0057
|0AF341| dw $4B44, $D342, $97B5, $4B78 ; 0x67 - ROOM 0058
|0AF349| dw $13B3, $8B55, $4B7B, $0B8D ; 0x68 - ROOM 0067
|0AF351| dw $0B89, $138A, $0B8B, $0B8C ; 0x69 - ROOM 0068

;---------------------------------------------------------------------------------------------------

|0AF359| dw $0B00, $0B7C, $0B00, $0B00 ; 0x6A - ROOM 00DE
|0AF361| dw $0B00, $9348, $0B00, $0B56 ; 0x6B - ROOM 00BE
|0AF369| dw $0B00, $0B00, $0B88, $0B00 ; 0x6C - ROOM 00BF
|0AF371| dw $0B00, $0B48, $0B00, $0B00 ; 0x6D - ROOM 00CE
|0AF379| dw $0B00, $9348, $1786, $0B65 ; 0x6E - ROOM 009E
|0AF381| dw $0B00, $0B00, $CB5A, $0B00 ; 0x6F - ROOM 009F
|0AF389| dw $0B00, $5388, $0B00, $0B00 ; 0x70 - ROOM 00AE
|0AF391| dw $4B5A, $0B00, $0B00, $0B00 ; 0x71 - ROOM 00AF
|0AF399| dw $0B00, $CB5B, $13AB, $0BAC ; 0x72 - ROOM 007E
|0AF3A1| dw $CB5A, $0B00, $137E, $0B00 ; 0x73 - ROOM 007F
|0AF3A9| dw $0B00, $137E, $0B00, $0B00 ; 0x74 - ROOM 008E
|0AF3B1| dw $0B00, $8B48, $1783, $1384 ; 0x75 - ROOM 005E
|0AF3B9| dw $0B00, $0B00, $1385, $0B00 ; 0x76 - ROOM 005F
|0AF3C1| dw $0B00, $537E, $0B00, $0B00 ; 0x77 - ROOM 006E
|0AF3C9| dw $0B00, $8B48, $0B43, $CB43 ; 0x78 - ROOM 003E
|0AF3D1| dw $0B00, $0B00, $1379, $137A ; 0x79 - ROOM 003F
|0AF3D9| dw $0B5A, $137B, $0B00, $0B00 ; 0x7A - ROOM 004E
|0AF3E1| dw $0B00, $8B48, $137F, $1380 ; 0x7B - ROOM 001E
|0AF3E9| dw $0B00, $0B00, $1381, $1382 ; 0x7C - ROOM 001F
|0AF3F1| dw $0B00, $0B48, $0B00, $0B00 ; 0x7D - ROOM 002E
|0AF3F9| dw $0B00, $0B00, $1387, $1377 ; 0x7E - ROOM 000E

;---------------------------------------------------------------------------------------------------

|0AF401| dw $5746, $0B47, $1349, $0B48 ; 0x7F - ROOM 0087
|0AF409| dw $1375, $4B42, $174A, $574A ; 0x80 - ROOM 0077
|0AF411| dw $0B43, $1344, $0B45, $1746 ; 0x81 - ROOM 0031
|0AF419| dw $1742, $5742, $8B42, $CB42 ; 0x82 - ROOM 0027
|0AF421| dw $1375, $5375, $8B42, $CB42 ; 0x83 - ROOM 0017
|0AF429| dw $4B40, $1340, $0B41, $4B41 ; 0x84 - ROOM 0007

;---------------------------------------------------------------------------------------------------

|0AF431| dw $4B46, $0B71, $1786, $8B71 ; 0x85 - ROOM 0044
|0AF439| dw $1347, $0B4D, $0B65, $0B5B ; 0x86 - ROOM 0045
|0AF441| dw $0B00, $0B00, $9348, $0B00 ; 0x87 - ROOM 00AB
|0AF449| dw $0B00, $0B00, $0B00, $8B48 ; 0x88 - ROOM 00AC
|0AF451| dw $4B66, $8B65, $4B5B, $0B65 ; 0x89 - ROOM 00BB
|0AF459| dw $9365, $0B66, $0B63, $8B66 ; 0x8A - ROOM 00BC
|0AF461| dw $4B51, $0B5F, $CB76, $0B60 ; 0x8B - ROOM 00CB
|0AF469| dw $0B64, $4B4F, $4B60, $8B76 ; 0x8C - ROOM 00CC
|0AF471| dw $4B76, $0B61, $D376, $1362 ; 0x8D - ROOM 00DB
|0AF479| dw $4B61, $0B76, $CB58, $8B51 ; 0x8E - ROOM 00DC
|0AF481| dw $0B00, $0B00, $5746, $0B5E ; 0x8F - ROOM 0064
|0AF489| dw $0B00, $0B00, $0B5E, $0B46 ; 0x90 - ROOM 0065

;---------------------------------------------------------------------------------------------------

|0AF491| dw $0B00, $0B00, $8B48, $0B00 ; 0x91 - ROOM 00A4
|0AF499| dw $0B4F, $0B51, $CB76, $8B76 ; 0x92 - ROOM 00B4
|0AF4A1| dw $5351, $0B51, $8B4F, $8B51 ; 0x93 - ROOM 00B5
|0AF4A9| dw $4B76, $0B76, $CB51, $8B58 ; 0x94 - ROOM 00C4
|0AF4B1| dw $0B54, $0B00, $8B66, $0B00 ; 0x95 - ROOM 00C5
|0AF4B9| dw $9348, $8B48, $0B56, $4B45 ; 0x96 - ROOM 0004
|0AF4C1| dw $0B00, $0B57, $0B00, $0B59 ; 0x97 - ROOM 0013
|0AF4C9| dw $4B50, $0B58, $CB50, $8B50 ; 0x98 - ROOM 0014
|0AF4D1| dw $5758, $1751, $CB58, $8B51 ; 0x99 - ROOM 0015
|0AF4D9| dw $0B56, $4B56, $0B65, $5756 ; 0x9A - ROOM 0024
|0AF4E1| dw $9348, $8B48, $0B4C, $0B4B ; 0x9B - ROOM 00B6
|0AF4E9| dw $0B4D, $0B00, $8B54, $0B00 ; 0x9C - ROOM 00B7
|0AF4F1| dw $0B4F, $0B50, $8B4F, $8B50 ; 0x9D - ROOM 00C6
|0AF4F9| dw $4B50, $0B51, $CB58, $8B51 ; 0x9E - ROOM 00C7
|0AF501| dw $0B52, $0B54, $0B53, $9354 ; 0x9F - ROOM 00D6

;---------------------------------------------------------------------------------------------------

|0AF509| dw $9748, $9748, $138D, $138E ; 0xA0 - ROOM 001C
|0AF511| dw $1391, $1392, $138C, $138F ; 0xA1 - ROOM 007B
|0AF519| dw $1393, $1390, $9393, $138F ; 0xA2 - ROOM 007C
|0AF521| dw $1394, $1395, $138E, $138C ; 0xA3 - ROOM 007D
|0AF529| dw $175D, $1399, $975D, $538F ; 0xA4 - ROOM 008B
|0AF531| dw $1397, $1398, $179A, $138C ; 0xA5 - ROOM 008C
|0AF539| dw $1399, $1766, $138F, $D75D ; 0xA6 - ROOM 008D
|0AF541| dw $538E, $538F, $1391, $1392 ; 0xA7 - ROOM 009B
|0AF549| dw $139B, $539B, $139C, $539C ; 0xA8 - ROOM 009C
|0AF551| dw $138F, $138E, $5392, $5391 ; 0xA9 - ROOM 009D
|0AF559| dw $138A, $538A, $138B, $538B ; 0xAA - ROOM 000C
|0AF561| dw $0B00, $CB5B, $0B00, $8B54 ; 0xAB - ROOM 005B
|0AF569| dw $4B74, $13A6, $0B00, $4B48 ; 0xAC - ROOM 005C
|0AF571| dw $13A0, $13A1, $538E, $138E ; 0xAD - ROOM 006B
|0AF579| dw $D38E, $53A3, $13A4, $0B00 ; 0xAE - ROOM 005D
|0AF581| dw $97AA, $0B00, $538E, $1399 ; 0xAF - ROOM 006C
|0AF589| dw $13A4, $0B00, $138E, $0B00 ; 0xB0 - ROOM 006D
|0AF591| dw $0B00, $5393, $0B00, $574E ; 0xB1 - ROOM 0095
|0AF599| dw $4B7D, $0B00, $8B7D, $139F ; 0xB2 - ROOM 0096
|0AF5A1| dw $97AA, $13A4, $13A9, $53A9 ; 0xB3 - ROOM 00A5
|0AF5A9| dw $13A5, $13A6, $93A5, $D3A5 ; 0xB4 - ROOM 00A6
|0AF5B1| dw $D38E, $938E, $13A4, $13AA ; 0xB5 - ROOM 0034
|0AF5B9| dw $0B00, $13A6, $0B00, $8B5F ; 0xB6 - ROOM 004C
|0AF5C1| dw $139B, $13A6, $139C, $53A2 ; 0xB7 - ROOM 004D
|0AF5C9| dw $0B00, $0B00, $138C, $0B00 ; 0xB8 - ROOM 000D
|0AF5D1| dw $9394, $139E, $0B00, $0B00 ; 0xB9 - ROOM 001D

;===================================================================================================

DungeonMapFloorCountData:
|0AF5D9| db $21, $00 ; Sewers
|0AF5DB| db $23, $00 ; Hyrule Castle
|0AF5DD| db $20, $00 ; Eastern Palace
|0AF5DF| db $21, $00 ; Desert Palace
|0AF5E1| db $70, $00 ; Agahnim's Tower
|0AF5E3| db $12, $00 ; Swamp Palace
|0AF5E5| db $11, $00 ; Palace of Darkness
|0AF5E7| db $12, $02 ; Misery Mire
|0AF5E9| db $02, $00 ; Skull Woods
|0AF5EB| db $17, $02 ; Ice Palace
|0AF5ED| db $60, $01 ; Tower of Hera
|0AF5EF| db $12, $00 ; Thieves' Town
|0AF5F1| db $13, $01 ; Turtle Rock
|0AF5F3| db $71, $01 ; Ganon's Tower

;===================================================================================================

DungeonMapFloorToDataOffset:
|0AF5F5| dw $0000
|0AF5F7| dw $0019
|0AF5F9| dw $0032
|0AF5FB| dw $004B
|0AF5FD| dw $0064
|0AF5FF| dw $007D
|0AF601| dw $0096
|0AF603| dw $00AF

;===================================================================================================

DungeonMapRoomPointers:
|0AF605| dw DungeonMapRoomData_Sewers
|0AF607| dw DungeonMapRoomData_HyruleCastle
|0AF609| dw DungeonMapRoomData_EasternPalace
|0AF60B| dw DungeonMapRoomData_DesertPalace
|0AF60D| dw DungeonMapRoomData_AgahnimsTower
|0AF60F| dw DungeonMapRoomData_SwampPalace
|0AF611| dw DungeonMapRoomData_PalaceofDarkness
|0AF613| dw DungeonMapRoomData_MiseryMire
|0AF615| dw DungeonMapRoomData_SkullWoods
|0AF617| dw DungeonMapRoomData_IcePalace
|0AF619| dw DungeonMapRoomData_TowerofHera
|0AF61B| dw DungeonMapRoomData_ThievesTown
|0AF61D| dw DungeonMapRoomData_TurtleRock
|0AF61F| dw DungeonMapRoomData_GanonsTower

;===================================================================================================

DungeonMapRoomData_Sewers:
|0AF621| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF626| db $0F, $0F, $11, $0F, $0F ; row 1
|0AF62B| db $0F, $0F, $21, $22, $0F ; row 2
|0AF630| db $0F, $0F, $0F, $32, $0F ; row 3
|0AF635| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF63A| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF63F| db $0F, $0F, $02, $0F, $0F ; row 1
|0AF644| db $0F, $0F, $12, $0F, $0F ; row 2
|0AF649| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF64E| db $0F, $0F, $0F, $42, $0F ; row 4

|0AF653| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF658| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF65D| db $0F, $0F, $0F, $0F, $0F ; row 2
|0AF662| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF667| db $0F, $0F, $0F, $41, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_HyruleCastle:
|0AF66C| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF671| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF676| db $0F, $80, $0F, $0F, $0F ; row 2
|0AF67B| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF680| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF685| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF68A| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF68F| db $0F, $70, $0F, $0F, $0F ; row 2
|0AF694| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF699| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF69E| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF6A3| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF6A8| db $0F, $71, $72, $0F, $0F ; row 2
|0AF6AD| db $0F, $81, $82, $0F, $0F ; row 3
|0AF6B2| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF6B7| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF6BC| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF6C1| db $0F, $50, $01, $52, $0F ; row 2
|0AF6C6| db $0F, $60, $61, $62, $0F ; row 3
|0AF6CB| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF6D0| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF6D5| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF6DA| db $0F, $0F, $51, $0F, $0F ; row 2
|0AF6DF| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF6E4| db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_EasternPalace:
|0AF6E9| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF6EE| db $0F, $0F, $99, $0F, $0F ; row 1
|0AF6F3| db $0F, $A8, $A9, $AA, $0F ; row 2
|0AF6F8| db $0F, $B8, $B9, $BA, $0F ; row 3
|0AF6FD| db $0F, $0F, $C9, $0F, $0F ; row 4

|0AF702| db $C8, $0F, $0F, $0F, $0F ; row 0
|0AF707| db $D8, $D9, $DA, $0F, $0F ; row 1
|0AF70C| db $0F, $0F, $0F, $0F, $0F ; row 2
|0AF711| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF716| db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_DesertPalace:
|0AF71B| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF720| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF725| db $0F, $0F, $0F, $0F, $0F ; row 2
|0AF72A| db $0F, $73, $74, $75, $0F ; row 3
|0AF72F| db $0F, $83, $84, $85, $0F ; row 4

|0AF734| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF739| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF73E| db $0F, $0F, $63, $0F, $0F ; row 2
|0AF743| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF748| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF74D| db $0F, $0F, $33, $0F, $0F ; row 0
|0AF752| db $0F, $0F, $43, $0F, $0F ; row 1
|0AF757| db $0F, $0F, $53, $0F, $0F ; row 2
|0AF75C| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF761| db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_AgahnimsTower:
|0AF766| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF76B| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF770| db $0F, $0F, $0F, $0F, $0F ; row 2
|0AF775| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF77A| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF77F| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF784| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF789| db $0F, $0F, $E0, $0F, $0F ; row 2
|0AF78E| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF793| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF798| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF79D| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF7A2| db $0F, $0F, $D0, $0F, $0F ; row 2
|0AF7A7| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF7AC| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF7B1| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF7B6| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF7BB| db $0F, $0F, $C0, $0F, $0F ; row 2
|0AF7C0| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF7C5| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF7CA| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF7CF| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF7D4| db $0F, $0F, $B0, $0F, $0F ; row 2
|0AF7D9| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF7DE| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF7E3| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF7E8| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF7ED| db $0F, $0F, $40, $0F, $0F ; row 2
|0AF7F2| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF7F7| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF7FC| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF801| db $0F, $0F, $20, $0F, $0F ; row 1
|0AF806| db $0F, $0F, $30, $0F, $0F ; row 2
|0AF80B| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF810| db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_SwampPalace:
|0AF815| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF81A| db $0F, $0F, $66, $0F, $0F ; row 1
|0AF81F| db $0F, $0F, $76, $0F, $0F ; row 2
|0AF824| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF829| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF82E| db $0F, $0F, $06, $0F, $0F ; row 0
|0AF833| db $0F, $0F, $16, $0F, $0F ; row 1
|0AF838| db $0F, $0F, $26, $0F, $0F ; row 2
|0AF83D| db $34, $35, $36, $37, $38 ; row 3
|0AF842| db $0F, $0F, $46, $0F, $0F ; row 4

|0AF847| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF84C| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF851| db $0F, $0F, $0F, $0F, $0F ; row 2
|0AF856| db $54, $0F, $0F, $0F, $28 ; row 3
|0AF85B| db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_PalaceofDarkness:
|0AF860| db $0F, $0F, $5A, $0F, $0F ; row 0
|0AF865| db $0F, $0F, $6A, $0B, $0F ; row 1
|0AF86A| db $0F, $0F, $0F, $0F, $0F ; row 2
|0AF86F| db $0F, $0F, $0A, $3B, $0F ; row 3
|0AF874| db $0F, $0F, $09, $4B, $0F ; row 4

|0AF879| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF87E| db $0F, $19, $1A, $1B, $0F ; row 1
|0AF883| db $0F, $0F, $2A, $2B, $0F ; row 2
|0AF888| db $0F, $0F, $3A, $0F, $0F ; row 3
|0AF88D| db $0F, $0F, $4A, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_MiseryMire:
|0AF892| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF897| db $0F, $91, $92, $93, $0F ; row 1
|0AF89C| db $0F, $0F, $0F, $0F, $0F ; row 2
|0AF8A1| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF8A6| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF8AB| db $0F, $90, $0F, $0F, $0F ; row 0
|0AF8B0| db $0F, $A0, $A1, $A2, $A3 ; row 1
|0AF8B5| db $0F, $0F, $B1, $B2, $B3 ; row 2
|0AF8BA| db $0F, $0F, $C1, $C2, $C3 ; row 3
|0AF8BF| db $0F, $0F, $D1, $D2, $0F ; row 4

|0AF8C4| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF8C9| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF8CE| db $0F, $0F, $0F, $0F, $0F ; row 2
|0AF8D3| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF8D8| db $0F, $0F, $97, $98, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_SkullWoods:
|0AF8DD| db $29, $0F, $0F, $0F, $0F ; row 0
|0AF8E2| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF8E7| db $0F, $0F, $0F, $0F, $0F ; row 2
|0AF8EC| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF8F1| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF8F6| db $39, $0F, $0F, $0F, $0F ; row 0
|0AF8FB| db $49, $0F, $0F, $0F, $0F ; row 1
|0AF900| db $59, $0F, $0F, $0F, $0F ; row 2
|0AF905| db $0F, $56, $57, $58, $0F ; row 3
|0AF90A| db $0F, $0F, $67, $68, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_IcePalace:
|0AF90F| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF914| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF919| db $0F, $0F, $0F, $0F, $0F ; row 2
|0AF91E| db $0F, $0F, $DE, $0F, $0F ; row 3
|0AF923| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF928| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF92D| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF932| db $0F, $0F, $BE, $BF, $0F ; row 2
|0AF937| db $0F, $0F, $CE, $0F, $0F ; row 3
|0AF93C| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF941| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF946| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF94B| db $0F, $0F, $9E, $9F, $0F ; row 2
|0AF950| db $0F, $0F, $AE, $AF, $0F ; row 3
|0AF955| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF95A| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF95F| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF964| db $0F, $0F, $7E, $7F, $0F ; row 2
|0AF969| db $0F, $0F, $8E, $0F, $0F ; row 3
|0AF96E| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF973| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF978| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF97D| db $0F, $0F, $5E, $5F, $0F ; row 2
|0AF982| db $0F, $0F, $6E, $0F, $0F ; row 3
|0AF987| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF98C| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF991| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF996| db $0F, $0F, $3E, $3F, $0F ; row 2
|0AF99B| db $0F, $0F, $4E, $0F, $0F ; row 3
|0AF9A0| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF9A5| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF9AA| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF9AF| db $0F, $0F, $1E, $1F, $0F ; row 2
|0AF9B4| db $0F, $0F, $2E, $0F, $0F ; row 3
|0AF9B9| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF9BE| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF9C3| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF9C8| db $0F, $0F, $0E, $0F, $0F ; row 2
|0AF9CD| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF9D2| db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_TowerofHera:
|0AF9D7| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF9DC| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF9E1| db $0F, $0F, $87, $0F, $0F ; row 2
|0AF9E6| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AF9EB| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AF9F0| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AF9F5| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AF9FA| db $0F, $0F, $77, $0F, $0F ; row 2
|0AF9FF| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AFA04| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AFA09| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFA0E| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AFA13| db $0F, $0F, $31, $0F, $0F ; row 2
|0AFA18| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AFA1D| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AFA22| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFA27| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AFA2C| db $0F, $0F, $27, $0F, $0F ; row 2
|0AFA31| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AFA36| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AFA3B| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFA40| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AFA45| db $0F, $0F, $17, $0F, $0F ; row 2
|0AFA4A| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AFA4F| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AFA54| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFA59| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AFA5E| db $0F, $0F, $07, $0F, $0F ; row 2
|0AFA63| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AFA68| db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_ThievesTown:
|0AFA6D| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFA72| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AFA77| db $0F, $44, $45, $0F, $0F ; row 2
|0AFA7C| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AFA81| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AFA86| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFA8B| db $0F, $AB, $AC, $0F, $0F ; row 1
|0AFA90| db $0F, $BB, $BC, $0F, $0F ; row 2
|0AFA95| db $0F, $CB, $CC, $0F, $0F ; row 3
|0AFA9A| db $0F, $DB, $DC, $0F, $0F ; row 4

|0AFA9F| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFAA4| db $0F, $64, $65, $0F, $0F ; row 1
|0AFAA9| db $0F, $0F, $0F, $0F, $0F ; row 2
|0AFAAE| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AFAB3| db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_TurtleRock:
|0AFAB8| db $0F, $A4, $0F, $0F, $0F ; row 0
|0AFABD| db $0F, $B4, $0F, $0F, $0F ; row 1
|0AFAC2| db $0F, $0F, $0F, $0F, $0F ; row 2
|0AFAC7| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AFACC| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AFAD1| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFAD6| db $0F, $0F, $B5, $0F, $0F ; row 1
|0AFADB| db $0F, $C4, $C5, $0F, $0F ; row 2
|0AFAE0| db $0F, $0F, $D5, $0F, $0F ; row 3
|0AFAE5| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AFAEA| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFAEF| db $0F, $0F, $04, $0F, $0F ; row 1
|0AFAF4| db $0F, $13, $14, $15, $0F ; row 2
|0AFAF9| db $0F, $23, $24, $0F, $0F ; row 3
|0AFAFE| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AFB03| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFB08| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AFB0D| db $0F, $0F, $0F, $B6, $B7 ; row 2
|0AFB12| db $0F, $0F, $0F, $C6, $C7 ; row 3
|0AFB17| db $0F, $0F, $0F, $D6, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_GanonsTower:
|0AFB1C| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFB21| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AFB26| db $0F, $0F, $1C, $0F, $0F ; row 2
|0AFB2B| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AFB30| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AFB35| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFB3A| db $0F, $7B, $7C, $7D, $0F ; row 1
|0AFB3F| db $0F, $8B, $8C, $8D, $0F ; row 2
|0AFB44| db $0F, $9B, $9C, $9D, $0F ; row 3
|0AFB49| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AFB4E| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFB53| db $0F, $0F, $0F, $0F, $0F ; row 1
|0AFB58| db $0F, $0F, $0C, $0F, $0F ; row 2
|0AFB5D| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AFB62| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AFB67| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFB6C| db $0F, $0F, $5B, $5C, $0F ; row 1
|0AFB71| db $0F, $0F, $6B, $0F, $0F ; row 2
|0AFB76| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AFB7B| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AFB80| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFB85| db $0F, $0F, $0F, $5D, $0F ; row 1
|0AFB8A| db $0F, $0F, $6C, $6D, $0F ; row 2
|0AFB8F| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AFB94| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AFB99| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFB9E| db $0F, $0F, $95, $96, $0F ; row 1
|0AFBA3| db $0F, $0F, $A5, $A6, $0F ; row 2
|0AFBA8| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AFBAD| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AFBB2| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFBB7| db $0F, $0F, $0F, $3D, $0F ; row 1
|0AFBBC| db $0F, $0F, $4C, $4D, $0F ; row 2
|0AFBC1| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AFBC6| db $0F, $0F, $0F, $0F, $0F ; row 4

|0AFBCB| db $0F, $0F, $0F, $0F, $0F ; row 0
|0AFBD0| db $0F, $0F, $0D, $0F, $0F ; row 1
|0AFBD5| db $0F, $0F, $1D, $0F, $0F ; row 2
|0AFBDA| db $0F, $0F, $0F, $0F, $0F ; row 3
|0AFBDF| db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomOrderPointers:
|0AFBE4| dw DungeonMapRoomOrder_Sewers
|0AFBE6| dw DungeonMapRoomOrder_HyruleCastle
|0AFBE8| dw DungeonMapRoomOrder_EasternPalace
|0AFBEA| dw DungeonMapRoomOrder_DesertPalace
|0AFBEC| dw DungeonMapRoomOrder_AgahnimsTower
|0AFBEE| dw DungeonMapRoomOrder_SwampPalace
|0AFBF0| dw DungeonMapRoomOrder_PalaceOfDarkness
|0AFBF2| dw DungeonMapRoomOrder_MiseryMire
|0AFBF4| dw DungeonMapRoomOrder_SkullWoods
|0AFBF6| dw DungeonMapRoomOrder_IcePalace
|0AFBF8| dw DungeonMapRoomOrder_TowerOfHera
|0AFBFA| dw DungeonMapRoomOrder_ThievesTown
|0AFBFC| dw DungeonMapRoomOrder_TurtleRock
|0AFBFE| dw DungeonMapRoomOrder_GanonsTower

;===================================================================================================

DungeonMapRoomOrder_Sewers:
|0AFC00| db $00 ; Room 0011
|0AFC01| db $01 ; Room 0021
|0AFC02| db $02 ; Room 0022
|0AFC03| db $03 ; Room 0032
|0AFC04| db $04 ; Room 0002
|0AFC05| db $05 ; Room 0012
|0AFC06| db $06 ; Room 0042
|0AFC07| db $07 ; Room 0041

;===================================================================================================

DungeonMapRoomOrder_HyruleCastle:
|0AFC08| db $08 ; Room 0080
|0AFC09| db $09 ; Room 0070
|0AFC0A| db $0A ; Room 0071
|0AFC0B| db $0B ; Room 0072
|0AFC0C| db $0C ; Room 0081
|0AFC0D| db $0D ; Room 0082
|0AFC0E| db $0E ; Room 0050
|0AFC0F| db $0F ; Room 0001
|0AFC10| db $10 ; Room 0052
|0AFC11| db $11 ; Room 0060
|0AFC12| db $12 ; Room 0061
|0AFC13| db $13 ; Room 0062
|0AFC14| db $14 ; Room 0051

;===================================================================================================

DungeonMapRoomOrder_EasternPalace:
|0AFC15| db $15 ; Room 0099
|0AFC16| db $16 ; Room 00A8
|0AFC17| db $17 ; Room 00A9
|0AFC18| db $18 ; Room 00AA
|0AFC19| db $19 ; Room 00B8
|0AFC1A| db $1A ; Room 00B9
|0AFC1B| db $1B ; Room 00BA
|0AFC1C| db $1C ; Room 00C9
|0AFC1D| db $1D ; Room 00C8
|0AFC1E| db $1E ; Room 00D8
|0AFC1F| db $1F ; Room 00D9
|0AFC20| db $20 ; Room 00DA

;===================================================================================================

DungeonMapRoomOrder_DesertPalace:
|0AFC21| db $22 ; Room 0073
|0AFC22| db $23 ; Room 0074
|0AFC23| db $24 ; Room 0076
|0AFC24| db $25 ; Room 0083
|0AFC25| db $26 ; Room 0084
|0AFC26| db $27 ; Room 0086
|0AFC27| db $21 ; Room 0063
|0AFC28| db $28 ; Room 0033
|0AFC29| db $29 ; Room 0042
|0AFC2A| db $2A ; Room 0053

;===================================================================================================

DungeonMapRoomOrder_AgahnimsTower:
|0AFC2B| db $2B ; Room 00E0
|0AFC2C| db $2C ; Room 00D0
|0AFC2D| db $2C ; Room 00C0
|0AFC2E| db $2D ; Room 00B0
|0AFC2F| db $2E ; Room 0040
|0AFC30| db $2F ; Room 0020
|0AFC31| db $30 ; Room 0030

;===================================================================================================

DungeonMapRoomOrder_SwampPalace:
|0AFC32| db $31 ; Room 0066
|0AFC33| db $32 ; Room 0076
|0AFC34| db $33 ; Room 0006
|0AFC35| db $34 ; Room 0016
|0AFC36| db $35 ; Room 0026
|0AFC37| db $36 ; Room 0034
|0AFC38| db $37 ; Room 0035
|0AFC39| db $38 ; Room 0036
|0AFC3A| db $39 ; Room 0037
|0AFC3B| db $3A ; Room 0038
|0AFC3C| db $3B ; Room 0046
|0AFC3D| db $3C ; Room 0054
|0AFC3E| db $3D ; Room 0028

;===================================================================================================

DungeonMapRoomOrder_PalaceOfDarkness:
|0AFC3F| db $3E ; Room 005A
|0AFC40| db $3F ; Room 006A
|0AFC41| db $40 ; Room 000B
|0AFC42| db $41 ; Room 000A
|0AFC43| db $42 ; Room 003B
|0AFC44| db $43 ; Room 0009
|0AFC45| db $44 ; Room 004B
|0AFC46| db $45 ; Room 0019
|0AFC47| db $46 ; Room 001A
|0AFC48| db $47 ; Room 001B
|0AFC49| db $48 ; Room 002A
|0AFC4A| db $49 ; Room 002B
|0AFC4B| db $4A ; Room 003A
|0AFC4C| db $4B ; Room 004A

;===================================================================================================

DungeonMapRoomOrder_MiseryMire:
|0AFC4D| db $4E ; Room 0091
|0AFC4E| db $4F ; Room 0092
|0AFC4F| db $50 ; Room 0093
|0AFC50| db $52 ; Room 0090
|0AFC51| db $53 ; Room 00A0
|0AFC52| db $54 ; Room 00A1
|0AFC53| db $55 ; Room 00A2
|0AFC54| db $56 ; Room 00A3
|0AFC55| db $57 ; Room 00B1
|0AFC56| db $58 ; Room 00B2
|0AFC57| db $59 ; Room 00B3
|0AFC58| db $5A ; Room 00C1
|0AFC59| db $5B ; Room 00C2
|0AFC5A| db $5C ; Room 00C3
|0AFC5B| db $5D ; Room 00D1
|0AFC5C| db $5E ; Room 00D2
|0AFC5D| db $5F ; Room 0097
|0AFC5E| db $60 ; Room 0098

;===================================================================================================

DungeonMapRoomOrder_SkullWoods:
|0AFC5F| db $61 ; Room 0029
|0AFC60| db $62 ; Room 0039
|0AFC61| db $63 ; Room 0049
|0AFC62| db $64 ; Room 0059
|0AFC63| db $65 ; Room 0056
|0AFC64| db $66 ; Room 0057
|0AFC65| db $67 ; Room 0058
|0AFC66| db $68 ; Room 0067
|0AFC67| db $69 ; Room 0068

;===================================================================================================

DungeonMapRoomOrder_IcePalace:
|0AFC68| db $6A ; Room 00DE
|0AFC69| db $6B ; Room 00BE
|0AFC6A| db $6C ; Room 00BF
|0AFC6B| db $6D ; Room 00CE
|0AFC6C| db $6E ; Room 009E
|0AFC6D| db $6F ; Room 009F
|0AFC6E| db $70 ; Room 00AE
|0AFC6F| db $71 ; Room 00AF
|0AFC70| db $72 ; Room 007E
|0AFC71| db $73 ; Room 007F
|0AFC72| db $74 ; Room 008E
|0AFC73| db $75 ; Room 005E
|0AFC74| db $76 ; Room 005F
|0AFC75| db $77 ; Room 006E
|0AFC76| db $78 ; Room 003E
|0AFC77| db $79 ; Room 003F
|0AFC78| db $7A ; Room 004E
|0AFC79| db $7B ; Room 001E
|0AFC7A| db $7C ; Room 001F
|0AFC7B| db $7D ; Room 002E
|0AFC7C| db $7E ; Room 000E

;===================================================================================================

DungeonMapRoomOrder_TowerOfHera:
|0AFC7D| db $7F ; Room 0087
|0AFC7E| db $80 ; Room 0077
|0AFC7F| db $81 ; Room 0031
|0AFC80| db $82 ; Room 0027
|0AFC81| db $83 ; Room 0017
|0AFC82| db $84 ; Room 0007

;===================================================================================================

DungeonMapRoomOrder_ThievesTown:
|0AFC83| db $85 ; Room 0044
|0AFC84| db $86 ; Room 0045
|0AFC85| db $87 ; Room 00AB
|0AFC86| db $88 ; Room 00AC
|0AFC87| db $89 ; Room 00BB
|0AFC88| db $8A ; Room 00BC
|0AFC89| db $8B ; Room 00CB
|0AFC8A| db $8C ; Room 00CC
|0AFC8B| db $8D ; Room 00DB
|0AFC8C| db $8E ; Room 00DC
|0AFC8D| db $8F ; Room 0064
|0AFC8E| db $90 ; Room 0065

;===================================================================================================

DungeonMapRoomOrder_TurtleRock:
|0AFC8F| db $91 ; Room 00A4
|0AFC90| db $92 ; Room 00B4
|0AFC91| db $93 ; Room 00B5
|0AFC92| db $94 ; Room 00C4
|0AFC93| db $95 ; Room 00C5
|0AFC94| db $4C ; Room 00D5
|0AFC95| db $96 ; Room 0004
|0AFC96| db $97 ; Room 0013
|0AFC97| db $98 ; Room 0014
|0AFC98| db $99 ; Room 0015
|0AFC99| db $4D ; Room 0023
|0AFC9A| db $9A ; Room 0024
|0AFC9B| db $9B ; Room 00B6
|0AFC9C| db $9C ; Room 00B7
|0AFC9D| db $9D ; Room 00C6
|0AFC9E| db $9E ; Room 00C7
|0AFC9F| db $9F ; Room 00D6

;===================================================================================================

DungeonMapRoomOrder_GanonsTower:
|0AFCA0| db $A0 ; Room 001C
|0AFCA1| db $A1 ; Room 007B
|0AFCA2| db $A2 ; Room 007C
|0AFCA3| db $A3 ; Room 007D
|0AFCA4| db $A4 ; Room 008B
|0AFCA5| db $A5 ; Room 008C
|0AFCA6| db $A6 ; Room 008D
|0AFCA7| db $A7 ; Room 009B
|0AFCA8| db $A8 ; Room 009C
|0AFCA9| db $A9 ; Room 009D
|0AFCAA| db $AA ; Room 000C
|0AFCAB| db $AB ; Room 005B
|0AFCAC| db $AC ; Room 005C
|0AFCAD| db $AD ; Room 006B
|0AFCAE| db $AE ; Room 005D
|0AFCAF| db $AF ; Room 006C
|0AFCB0| db $B0 ; Room 006D
|0AFCB1| db $B1 ; Room 0095
|0AFCB2| db $B2 ; Room 0096
|0AFCB3| db $B3 ; Room 00A5
|0AFCB4| db $B4 ; Room 00A6
|0AFCB5| db $B5 ; Room 0034
|0AFCB6| db $B6 ; Room 004C
|0AFCB7| db $B7 ; Room 004D
|0AFCB8| db $B8 ; Room 000D
|0AFCB9| db $B9 ; Room 001D

;===================================================================================================
; FREE ROM: 0x26
;===================================================================================================
NULL_0AFCBA:
|0AFCBA| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0AFCC2| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0AFCCA| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0AFCD2| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0AFCDA| db $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

HUDBigNumbersTop:
|0AFCE0| dw $2508 ; 1
|0AFCE2| dw $2509 ; 2
|0AFCE4| dw $2509 ; 3
|0AFCE6| dw $250A ; 4
|0AFCE8| dw $250B ; 5
|0AFCEA| dw $250C ; 6
|0AFCEC| dw $250D ; 7
|0AFCEE| dw $251D ; 8
|0AFCF0| dw $E51C ; 9
|0AFCF2| dw $250E ; 0
|0AFCF4| dw $007F ; -

;---------------------------------------------------------------------------------------------------

HUDBigNumbersBottom:
|0AFCF6| dw $2518 ; 1
|0AFCF8| dw $2519 ; 2
|0AFCFA| dw $A509 ; 3
|0AFCFC| dw $251A ; 4
|0AFCFE| dw $251B ; 5
|0AFD00| dw $251C ; 6
|0AFD02| dw $2518 ; 7
|0AFD04| dw $A51D ; 8
|0AFD06| dw $E50C ; 9
|0AFD08| dw $A50E ; 0
|0AFD0A| dw $007F ; -

;===================================================================================================

HandleFloorIndicator:
|0AFD0C| REP #$30

|0AFD0E| LDA.w $04A0
|0AFD11| AND.w #$00FF
|0AFD14| BEQ HideHUDTimer

|0AFD16| INC A
|0AFD17| CMP.w #$00C0
|0AFD1A| BNE .dont_clear

|0AFD1C| LDA.w #$0000

.dont_clear
|0AFD1F| STA.w $04A0

;---------------------------------------------------------------------------------------------------

|0AFD22| PHB
|0AFD23| PHK
|0AFD24| PLB

|0AFD25| LDA.w #$251E
|0AFD28| STA.l $7EC7F2

|0AFD2C| INC A
|0AFD2D| STA.l $7EC834

|0AFD31| INC A
|0AFD32| STA.l $7EC832

|0AFD36| LDA.w #$250F
|0AFD39| STA.l $7EC7F4

|0AFD3D| LDX.w #$0000

|0AFD40| LDA.b $A3
|0AFD42| BMI .basement_floors

|0AFD44| LDA.b $A4
|0AFD46| BNE .no_rain_noise

|0AFD48| LDA.b $A0
|0AFD4A| CMP.w #$0002 ; ROOM 0002
|0AFD4D| BEQ .no_rain_noise

|0AFD4F| SEP #$20

|0AFD51| LDA.l $7EF3C5
|0AFD55| CMP.b #$02
|0AFD57| BCS .too_late_for_rain

|0AFD59| LDA.b #$03 ; SFX1.03
|0AFD5B| STA.w $012D

;---------------------------------------------------------------------------------------------------

.too_late_for_rain
|0AFD5E| REP #$20

.no_rain_noise
|0AFD60| LDA.b $A4
|0AFD62| AND.w #$00FF
|0AFD65| BRA .continue

.basement_floors
|0AFD67| SEP #$20

|0AFD69| LDA.b #$05 ; SFX1.05
|0AFD6B| STA.w $012D

|0AFD6E| REP #$20

|0AFD70| INX
|0AFD71| INX

|0AFD72| LDA.b $A4
|0AFD74| ORA.w #$FF00
|0AFD77| EOR.w #$FFFF

;---------------------------------------------------------------------------------------------------

.continue
|0AFD7A| ASL A
|0AFD7B| TAY

|0AFD7C| LDA.w HUDBigNumbersTop,Y
|0AFD7F| STA.l $7EC7F2,X

|0AFD83| LDA.w HUDBigNumbersBottom,Y
|0AFD86| STA.l $7EC832,X

|0AFD8A| SEP #$30

|0AFD8C| PLB

|0AFD8D| INC.b $16

|0AFD8F| RTL

;===================================================================================================

HideHUDTimer:
|0AFD90| REP #$20

|0AFD92| LDA.w #$007F
|0AFD95| STA.l $7EC7F2
|0AFD99| STA.l $7EC832
|0AFD9D| STA.l $7EC7F4
|0AFDA1| STA.l $7EC834

|0AFDA5| SEP #$30

|0AFDA7| RTL

;===================================================================================================

HandleHUDTimer:
|0AFDA8| LDA.w $04B5
|0AFDAB| BNE .dont_tick

|0AFDAD| LDA.w $04B4
|0AFDB0| BMI .timer_ended

|0AFDB2| DEC.w $04B4

|0AFDB5| LDA.b #$3E
|0AFDB7| STA.w $04B5

.dont_tick
|0AFDBA| DEC.w $04B5

|0AFDBD| LDA.w $04B4
|0AFDC0| BPL .draw_numbers

.timer_ended
|0AFDC2| LDA.b #$FF
|0AFDC4| STA.w $04B4

|0AFDC7| REP #$30

|0AFDC9| BRA HideHUDTimer

;---------------------------------------------------------------------------------------------------

.draw_numbers
|0AFDCB| LDA.w $04B4
|0AFDCE| STA.w WRDIVL

|0AFDD1| STZ.w WRDIVH

|0AFDD4| LDA.b #10
|0AFDD6| STA.w WRDIVB

|0AFDD9| NOP ; 8 NOP
|0AFDDA| NOP
|0AFDDB| NOP
|0AFDDC| NOP
|0AFDDD| NOP
|0AFDDE| NOP
|0AFDDF| NOP
|0AFDE0| NOP

|0AFDE1| LDA.w RDDIV
|0AFDE4| ASL A
|0AFDE5| STA.b $00

|0AFDE7| LDA.w RDMPY
|0AFDEA| ASL A
|0AFDEB| STA.b $02

;---------------------------------------------------------------------------------------------------

|0AFDED| PHB
|0AFDEE| PHK
|0AFDEF| PLB

|0AFDF0| REP #$20

|0AFDF2| LDX.b #$02

.next_number
|0AFDF4| LDY.b $00,X

|0AFDF6| DEY
|0AFDF7| DEY
|0AFDF8| BPL .draw_digit

|0AFDFA| LDY.b #$12
|0AFDFC| CPX.b #$00
|0AFDFE| BNE .draw_digit

|0AFE00| LDY.b #$14

.draw_digit
|0AFE02| LDA.w HUDBigNumbersTop,Y
|0AFE05| STA.l $7EC7F2,X

|0AFE09| LDA.w HUDBigNumbersBottom,Y
|0AFE0C| STA.l $7EC832,X

|0AFE10| DEX
|0AFE11| DEX
|0AFE12| BPL .next_number

|0AFE14| SEP #$20

|0AFE16| PLB

|0AFE17| RTL

;===================================================================================================
; FREE ROM: 0x08
;===================================================================================================
NULL_0AFE18:
|0AFE18| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

InitializeGAMEOVERLetters:
|0AFE20| PHB
|0AFE21| PHK
|0AFE22| PLB

|0AFE23| STZ.w $035F

|0AFE26| LDA.b #$B0
|0AFE28| STA.w $0C04
|0AFE2B| STA.w $0C05
|0AFE2E| STA.w $0C06
|0AFE31| STA.w $0C07

|0AFE34| STA.w $0C08
|0AFE37| STA.w $0C09
|0AFE3A| STA.w $0C0A
|0AFE3D| STA.w $0C0B

;---------------------------------------------------------------------------------------------------

|0AFE40| LDA.b #$00
|0AFE42| STA.w $0C18
|0AFE45| STA.w $0C19
|0AFE48| STA.w $0C1A
|0AFE4B| STA.w $0C1B

|0AFE4E| STA.w $0C1C
|0AFE51| STA.w $0C1D
|0AFE54| STA.w $0C1E
|0AFE57| STA.w $0C1F

;---------------------------------------------------------------------------------------------------

|0AFE5A| INC A
|0AFE5B| STA.w $0C4A

|0AFE5E| LDA.b #$06
|0AFE60| STA.w $039D

|0AFE63| PLB
|0AFE64| RTL

;===================================================================================================
; FREE ROM: 0x0B
;===================================================================================================
NULL_0AFE65:
|0AFE65| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0AFE6D| db $FF, $FF, $FF

;===================================================================================================

pool HandleRoomLayerEffect

.vectors
|0AFE70| dw LayerEffect_Nothing           ; 00
|0AFE72| dw LayerEffect_Nothing           ; 01
|0AFE74| dw LayerEffect_Scroll            ; 02
|0AFE76| dw LayerEffect_WaterRapids       ; 03
|0AFE78| dw LayerEffect_Trinexx           ; 04
|0AFE7A| dw LayerEffect_Agahnim2          ; 05
|0AFE7C| dw LayerEffect_InvisibleFloor    ; 06
|0AFE7E| dw LayerEffect_Ganon             ; 07

endpool

;---------------------------------------------------------------------------------------------------

HandleRoomLayerEffect:
|0AFE80| LDA.b $AD
|0AFE82| ASL A
|0AFE83| TAX

|0AFE84| JMP.w (.vectors,X)

;===================================================================================================

LayerEffect_Nothing:
|0AFE87| RTL

;===================================================================================================

LayerEffect_Scroll:
|0AFE88| LDA.w $0403
|0AFE8B| AND.b #$80
|0AFE8D| BEQ .continue

|0AFE8F| STZ.b $AD

|0AFE91| RTL

;---------------------------------------------------------------------------------------------------

.continue
|0AFE92| REP #$30

|0AFE94| STZ.w $0312
|0AFE97| STZ.w $0310

|0AFE9A| LDA.w $041A
|0AFE9D| LSR A
|0AFE9E| BCS .exit

|0AFEA0| ASL A
|0AFEA1| AND.w #$0002
|0AFEA4| TAX

|0AFEA5| LDA.w $041C
|0AFEA8| CLC
|0AFEA9| ADC.w #$8000
|0AFEAC| STA.w $041C

|0AFEAF| ROL A
|0AFEB0| AND.w #$0001

|0AFEB3| CPX.w #$0002
|0AFEB6| BNE .dont_invert

|0AFEB8| EOR.w #$FFFF
|0AFEBB| INC A

.dont_invert
|0AFEBC| LDX.w $041A
|0AFEBF| CPX.w #$0004
|0AFEC2| BCS .scroll_vertically

|0AFEC4| STA.w $0312

|0AFEC7| LDA.w $0422
|0AFECA| SEC
|0AFECB| SBC.w $0312
|0AFECE| STA.w $0422

|0AFED1| CLC
|0AFED2| ADC.b $E2
|0AFED4| STA.b $E0

|0AFED6| SEP #$30

|0AFED8| RTL

;---------------------------------------------------------------------------------------------------

.scroll_vertically
|0AFED9| STA.w $0310

|0AFEDC| LDA.w $0424
|0AFEDF| SEC
|0AFEE0| SBC.w $0310
|0AFEE3| STA.w $0424

|0AFEE6| CLC
|0AFEE7| ADC.b $E8
|0AFEE9| STA.b $E6

.exit
|0AFEEB| SEP #$30

|0AFEED| RTL

;===================================================================================================

LayerEffect_Trinexx:
|0AFEEE| REP #$20

|0AFEF0| LDA.w $0422
|0AFEF3| CLC
|0AFEF4| ADC.w $0312
|0AFEF7| STA.w $0422

|0AFEFA| LDA.w $0424
|0AFEFD| CLC
|0AFEFE| ADC.w $0310
|0AFF01| STA.w $0424

|0AFF04| STZ.w $0312
|0AFF07| STZ.w $0310

|0AFF0A| SEP #$20

|0AFF0C| RTL

;===================================================================================================

LayerEffect_Agahnim2:
|0AFF0D| LDA.b $1A
|0AFF0F| AND.b #$7F
|0AFF11| CMP.b #$03
|0AFF13| BEQ .flash

|0AFF15| CMP.b #$05
|0AFF17| BEQ .restore

|0AFF19| CMP.b #$24
|0AFF1B| BEQ .flash

|0AFF1D| CMP.b #$26
|0AFF1F| BNE .disable

;---------------------------------------------------------------------------------------------------

.restore
|0AFF21| REP #$20

|0AFF23| LDA.l $7EC3DA
|0AFF27| STA.l $7EC5DA

|0AFF2B| LDA.l $7EC3DC
|0AFF2F| STA.l $7EC5DC

|0AFF33| LDA.l $7EC3DE

;---------------------------------------------------------------------------------------------------

.set_color
|0AFF37| STA.l $7EC5DE
|0AFF3B| STA.l $7EC5EE

|0AFF3F| SEP #$20

|0AFF41| INC.b $15

;---------------------------------------------------------------------------------------------------

.disable
|0AFF43| LDA.b #$02
|0AFF45| STA.b $1D

|0AFF47| RTL

;---------------------------------------------------------------------------------------------------

.flash
|0AFF48| REP #$20

|0AFF4A| LDA.w #$1D59 ; RGB: #C85038
|0AFF4D| STA.l $7EC5DA

|0AFF51| LDA.w #$25FF ; RGB: #F87848
|0AFF54| STA.l $7EC5DC

|0AFF58| LDA.w #$001A ; RGB: #D00000
|0AFF5B| BRA .set_color

;===================================================================================================

LayerEffect_InvisibleFloor:
|0AFF5D| REP #$30

|0AFF5F| LDX.w #$0000
|0AFF62| STX.b $00

.next
|0AFF64| LDA.w $0540,X
|0AFF67| ASL A
|0AFF68| BCC .skip

|0AFF6A| INC.b $00

.skip
|0AFF6C| INX
|0AFF6D| INX
|0AFF6E| CPX.w #$0020
|0AFF71| BNE .next

;---------------------------------------------------------------------------------------------------

|0AFF73| LDX.w #$2940 ; RGB: #005050
|0AFF76| LDY.w #$4E60 ; RGB: #009898

|0AFF79| LDA.b $00
|0AFF7B| BNE .dont_use_black

|0AFF7D| LDX.w #$0000 ; RGB: #000000
|0AFF80| LDY.w #$0000 ; RGB: #000000

.dont_use_black
|0AFF83| TXA

|0AFF84| CMP.l $7EC3F6
|0AFF88| BEQ .already_matches

|0AFF8A| STA.l $7EC3F6
|0AFF8E| STA.l $7EC5F6

|0AFF92| TYA
|0AFF93| STA.l $7EC3F8
|0AFF97| STA.l $7EC5F8

|0AFF9B| INC.b $15

.already_matches
|0AFF9D| SEP #$30

|0AFF9F| LDA.b #$02
|0AFFA1| STA.b $1D

|0AFFA3| RTL

;===================================================================================================

LayerEffect_Ganon:
|0AFFA4| STZ.w $04C5

|0AFFA7| REP #$30

|0AFFA9| LDX.w #$0000

.next_torch_check
|0AFFAC| LDA.w $0540,X
|0AFFAF| ASL A
|0AFFB0| BCC .torch_off

|0AFFB2| INC.w $04C5

.torch_off
|0AFFB5| INX
|0AFFB6| INX
|0AFFB7| CPX.w #$0006
|0AFFBA| BNE .next_torch_check

;---------------------------------------------------------------------------------------------------

|0AFFBC| SEP #$30

|0AFFBE| LDA.w $04C5
|0AFFC1| BNE .not_dark

|0AFFC3| STZ.b $1D

|0AFFC5| LDA.b #$B3
|0AFFC7| STA.b $9A

|0AFFC9| RTL

.not_dark
|0AFFCA| CMP.b #$01
|0AFFCC| BNE .opaque

|0AFFCE| LDA.b #$02
|0AFFD0| STA.b $1D

|0AFFD2| LDA.b #$70
|0AFFD4| STA.b $9A

|0AFFD6| RTL

;---------------------------------------------------------------------------------------------------

.opaque
|0AFFD7| STZ.b $1D

|0AFFD9| LDA.b #$70
|0AFFDB| STA.b $9A

|0AFFDD| RTL

;===================================================================================================

LayerEffect_WaterRapids:
|0AFFDE| REP #$21

|0AFFE0| LDA.w #$8000
|0AFFE3| ADC.w $041C
|0AFFE6| STA.w $041C

|0AFFE9| ROL A
|0AFFEA| AND.w #$0001
|0AFFED| STA.b $00

|0AFFEF| LDA.w #$0000
|0AFFF2| SEC
|0AFFF3| SBC.b $00
|0AFFF5| STA.w $0312

|0AFFF8| SEP #$20

|0AFFFA| RTL

;===================================================================================================
; FREE ROM: 0x05
;===================================================================================================
NULL_0AFFFB:
|0AFFFB| db $FF, $FF, $FF, $FF, $FF

;===================================================================================================
