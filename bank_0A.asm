; see «rooms.asm»

org $0AB72A

;===================================================================================================
; FREE ROM: 0x06
;===================================================================================================
NULL_0AB72A:
#_0AB72A: db $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

Module0E_0A_FluteMenu:
#_0AB730: LDA.w $0200
#_0AB733: JSL JumpTableLocal
#_0AB737: dw WorldMap_FadeOut
#_0AB739: dw FluteMenu_LoadMap
#_0AB73B: dw WorldMap_LoadSpriteGFX
#_0AB73D: dw WorldMap_Brighten
#_0AB73F: dw FluteMenu_AdvanceMode
#_0AB741: dw FluteMenu_HandleSelection
#_0AB743: dw WorldMap_RestoreGraphics
#_0AB745: dw FluteMenu_LoadSelectedScreen
#_0AB747: dw Overworld_LoadOverlayAndMap
#_0AB749: dw FluteMenu_FadeInAndQuack

;===================================================================================================

FluteMenu_LoadMap:
#_0AB74B: STZ.w $1AF0

#_0AB74E: JSL WorldMap_LoadLightWorldMap

#_0AB752: RTL

;===================================================================================================

FluteMenu_AdvanceMode:
#_0AB753: LDA.b #$10
#_0AB755: STA.b $C8

#_0AB757: INC.w $0200

#_0AB75A: RTL

;===================================================================================================

FluteMenuNumbers:
.char
#_0AB75B: db $7F
#_0AB75C: db $79
#_0AB75D: db $6C
#_0AB75E: db $6D
#_0AB75F: db $6E
#_0AB760: db $6F
#_0AB761: db $7C
#_0AB762: db $7D

.pos_x_low
#_0AB763: db $80
#_0AB764: db $CF
#_0AB765: db $10
#_0AB766: db $B8
#_0AB767: db $30
#_0AB768: db $70
#_0AB769: db $70
#_0AB76A: db $F0

.pos_x_high
#_0AB76B: db $06
#_0AB76C: db $0C
#_0AB76D: db $02
#_0AB76E: db $08
#_0AB76F: db $0F
#_0AB770: db $00
#_0AB771: db $07
#_0AB772: db $0E

.pos_y_low
#_0AB773: db $5B
#_0AB774: db $98
#_0AB775: db $C0
#_0AB776: db $20
#_0AB777: db $50
#_0AB778: db $B0
#_0AB779: db $30
#_0AB77A: db $80

.pos_y_high
#_0AB77B: db $03
#_0AB77C: db $05
#_0AB77D: db $07
#_0AB77E: db $0B
#_0AB77F: db $0B
#_0AB780: db $0F
#_0AB781: db $0F
#_0AB782: db $0F

.bits
#_0AB783: db $80
#_0AB784: db $40
#_0AB785: db $20
#_0AB786: db $10
#_0AB787: db $08
#_0AB788: db $04
#_0AB789: db $02
#_0AB78A: db $01

;---------------------------------------------------------------------------------------------------

FluteMenu_HandleSelection:
#_0AB78B: LDA.b $C8
#_0AB78D: BNE .delay

#_0AB78F: LDA.b $F2
#_0AB791: ORA.b $F0
#_0AB793: AND.b #$C0
#_0AB795: BEQ .no_selection_made

#_0AB797: INC.w $0200

#_0AB79A: RTL

;---------------------------------------------------------------------------------------------------

.delay
#_0AB79B: DEC.b $C8

.no_selection_made
#_0AB79D: LDY.b #$07
#_0AB79F: LDX.w $1AF0

.continue_from_unreachable
#_0AB7A2: BRA .continue

;---------------------------------------------------------------------------------------------------

.unreachable
#_0AB7A4: TXA
#_0AB7A5: INC A
#_0AB7A6: AND.b #$07
#_0AB7A8: TAX

#_0AB7A9: DEY
#_0AB7AA: BPL .continue_from_unreachable

;---------------------------------------------------------------------------------------------------

.continue
#_0AB7AC: STX.w $1AF0

#_0AB7AF: LDA.b $F4
#_0AB7B1: AND.b #$0A
#_0AB7B3: BEQ .pressed_up_or_left

#_0AB7B5: DEC.w $1AF0

#_0AB7B8: LDA.b #$20 ; SFX3.20
#_0AB7BA: STA.w $012F

.pressed_up_or_left
#_0AB7BD: LDA.b $F4
#_0AB7BF: AND.b #$05
#_0AB7C1: BEQ .pressed_down_or_right

#_0AB7C3: INC.w $1AF0

#_0AB7C6: LDA.b #$20 ; SFX3.20
#_0AB7C8: STA.w $012F

.pressed_down_or_right
#_0AB7CB: LDA.w $1AF0
#_0AB7CE: AND.b #$07
#_0AB7D0: STA.w $1AF0

#_0AB7D3: LDA.b $1A
#_0AB7D5: AND.b #$10
#_0AB7D7: BEQ .dont_draw_link

;---------------------------------------------------------------------------------------------------

#_0AB7D9: JSR WorldMap_CalculateOAMCoordinates
#_0AB7DC: BCC .dont_draw_link

#_0AB7DE: LDA.b $0E
#_0AB7E0: SEC
#_0AB7E1: SBC.b #$04
#_0AB7E3: STA.b $0E

#_0AB7E5: LDA.b $0F
#_0AB7E7: SEC
#_0AB7E8: SBC.b #$04
#_0AB7EA: STA.b $0F

#_0AB7EC: LDA.b #$00
#_0AB7EE: STA.b $0D

#_0AB7F0: LDA.b #$3E
#_0AB7F2: STA.b $0C

#_0AB7F4: LDA.b #$02
#_0AB7F6: STA.b $0B

#_0AB7F8: LDX.b #$10
#_0AB7FA: JSR WorldMap_HandleSpriteBlink

;---------------------------------------------------------------------------------------------------

.dont_draw_link
#_0AB7FD: LDA.l $7EC108
#_0AB801: PHA

#_0AB802: LDA.l $7EC109
#_0AB806: PHA

#_0AB807: LDA.l $7EC10A
#_0AB80B: PHA

#_0AB80C: LDA.l $7EC10B
#_0AB810: PHA

#_0AB811: LDX.b #$07

;---------------------------------------------------------------------------------------------------

.next_numeral
#_0AB813: CPX.w $1AF0
#_0AB816: BNE .not_selected

.selected
#_0AB818: LDA.l FluteMenuNumbers_pos_x_low,X
#_0AB81C: STA.w $1AB0,X
#_0AB81F: STA.l $7EC10A

#_0AB823: LDA.l FluteMenuNumbers_pos_x_high,X
#_0AB827: STA.w $1AC0,X
#_0AB82A: STA.l $7EC10B

#_0AB82E: LDA.l FluteMenuNumbers_pos_y_low,X
#_0AB832: STA.w $1AD0,X
#_0AB835: STA.l $7EC108

#_0AB839: LDA.l FluteMenuNumbers_pos_y_high,X
#_0AB83D: STA.w $1AE0,X
#_0AB840: STA.l $7EC109

#_0AB844: PHX
#_0AB845: JSR WorldMap_CalculateOAMCoordinates
#_0AB848: PLX

#_0AB849: BCC .to_next_numeral

#_0AB84B: LDA.l FluteMenuNumbers_char,X
#_0AB84F: STA.b $0D

#_0AB851: LDA.b $1A
#_0AB853: AND.b #$06
#_0AB855: ORA.b #$30
#_0AB857: STA.b $0C

#_0AB859: LDA.b #$00
#_0AB85B: STA.b $0B

#_0AB85D: PHX
#_0AB85E: JSR WorldMap_HandleSpriteBlink
#_0AB861: PLX

#_0AB862: BRA .to_next_numeral

;---------------------------------------------------------------------------------------------------

.not_selected
#_0AB864: LDA.l FluteMenuNumbers_pos_x_low,X
#_0AB868: STA.w $1AB0,X
#_0AB86B: STA.l $7EC10A

#_0AB86F: LDA.l FluteMenuNumbers_pos_x_high,X
#_0AB873: STA.w $1AC0,X
#_0AB876: STA.l $7EC10B

#_0AB87A: LDA.l FluteMenuNumbers_pos_y_low,X
#_0AB87E: STA.w $1AD0,X
#_0AB881: STA.l $7EC108

#_0AB885: LDA.l FluteMenuNumbers_pos_y_high,X
#_0AB889: STA.w $1AE0,X
#_0AB88C: STA.l $7EC109

#_0AB890: PHX

#_0AB891: JSR WorldMap_CalculateOAMCoordinates

#_0AB894: PLX

#_0AB895: BCC .to_next_numeral

#_0AB897: LDA.l FluteMenuNumbers_char,X
#_0AB89B: STA.b $0D

#_0AB89D: LDA.b #$32
#_0AB89F: STA.b $0C

#_0AB8A1: LDA.b #$00
#_0AB8A3: STA.b $0B

#_0AB8A5: PHX

#_0AB8A6: JSR WorldMap_HandleSpriteBlink

#_0AB8A9: PLX

;---------------------------------------------------------------------------------------------------

.to_next_numeral
#_0AB8AA: DEX
#_0AB8AB: BMI .done

#_0AB8AD: JMP.w .next_numeral

;---------------------------------------------------------------------------------------------------

.done
#_0AB8B0: PLA
#_0AB8B1: STA.l $7EC10B

#_0AB8B5: PLA
#_0AB8B6: STA.l $7EC10A

#_0AB8BA: PLA
#_0AB8BB: STA.l $7EC109

#_0AB8BF: PLA
#_0AB8C0: STA.l $7EC108

#_0AB8C4: RTL

;===================================================================================================

FluteMenu_LoadSelectedScreen:
#_0AB8C5: LDA.l $7EF2BB
#_0AB8C9: AND.b #$DF
#_0AB8CB: STA.l $7EF2BB

#_0AB8CF: LDA.l $7EF2FB
#_0AB8D3: AND.b #$DF
#_0AB8D5: STA.l $7EF2FB

#_0AB8D9: LDA.l $7EF216
#_0AB8DD: AND.b #$7F
#_0AB8DF: STA.l $7EF216

#_0AB8E3: LDA.l $7EF051
#_0AB8E7: AND.b #$FE
#_0AB8E9: STA.l $7EF051

#_0AB8ED: JSL FluteMenu_LoadTransport
#_0AB8F1: JSL FluteMenu_LoadSelectedScreenPalettes

;---------------------------------------------------------------------------------------------------

#_0AB8F5: LDY.b #$58

#_0AB8F7: LDA.b $8A
#_0AB8F9: AND.b #$BF
#_0AB8FB: CMP.b #$03 ; OW 03, OW 43
#_0AB8FD: BEQ .death_mountain

#_0AB8FF: CMP.b #$05 ; OW 05, OW 45
#_0AB901: BEQ .death_mountain

#_0AB903: CMP.b #$07 ; OW 07, OW 47
#_0AB905: BEQ .death_mountain

#_0AB907: LDY.b #$5A

.death_mountain
#_0AB909: JSL DecompressAnimatedOverworldTiles
#_0AB90D: JSL Overworld_SetFixedColAndScroll

#_0AB911: STZ.w $0AA9
#_0AB914: STZ.w $0AB2

#_0AB917: JSL InitializeTilesets

#_0AB91B: INC.w $0200

#_0AB91E: STZ.b $B2

#_0AB920: JSL Overworld_ReloadSubscreenOverlayAndAdvance_long

;---------------------------------------------------------------------------------------------------

#_0AB924: LDA.b #$10 ; SFX3.10
#_0AB926: STA.w $012F

#_0AB929: LDX.b $8A

#_0AB92B: LDA.l $7F5B00,X
#_0AB92F: LSR A
#_0AB930: LSR A
#_0AB931: LSR A
#_0AB932: LSR A
#_0AB933: STA.w $012D

#_0AB936: LDA.l $7F5B00,X
#_0AB93A: AND.b #$0F
#_0AB93C: TAX

#_0AB93D: CPX.w $0130
#_0AB940: BNE .songs_differ

#_0AB942: LDX.b #$F3 ; SONG F3 - max volume

.songs_differ
#_0AB944: STX.w $012C

#_0AB947: RTL

;===================================================================================================

Overworld_LoadOverlayAndMap:
#_0AB948: REP #$20

#_0AB94A: LDA.b $10
#_0AB94C: PHA

#_0AB94D: LDA.w $0200
#_0AB950: PHA

#_0AB951: SEP #$20

#_0AB953: JSL Overworld_LoadAndBuildScreen_long

#_0AB957: REP #$20

#_0AB959: PLA
#_0AB95A: INC A
#_0AB95B: STA.w $0200

#_0AB95E: PLA
#_0AB95F: STA.b $10

#_0AB961: SEP #$20

#_0AB963: RTL

;===================================================================================================

FluteMenu_FadeInAndQuack:
#_0AB964: INC.b $13

#_0AB966: LDA.b $13
#_0AB968: CMP.b #$0F
#_0AB96A: BNE .delay

;===================================================================================================

#SpawnLandingDuck:
#_0AB96C: STZ.w $0200
#_0AB96F: STZ.b $B0

#_0AB971: LDA.w $010C
#_0AB974: STA.b $10
#_0AB976: STZ.b $11

#_0AB978: LDA.l $7EC229
#_0AB97C: STA.b $9B

#_0AB97E: LDY.b #$04
#_0AB980: LDA.b #$27 ; ANCILLA 27
#_0AB982: JSL AncillaAdd_Duck_drop_off

.delay
#_0AB986: JSL Sprite_Main

#_0AB98A: RTL

;===================================================================================================

Module0E_07_OverworldMap:
#_0AB98B: LDA.w $0200
#_0AB98E: JSL JumpTableLocal
#_0AB992: dw WorldMap_FadeOut
#_0AB994: dw WorldMap_LoadLightWorldMap
#_0AB996: dw WorldMap_LoadDarkWorldMap
#_0AB998: dw WorldMap_LoadSpriteGFX
#_0AB99A: dw WorldMap_Brighten
#_0AB99C: dw WorldMap_PlayerControl
#_0AB99E: dw WorldMap_RestoreGraphics
#_0AB9A0: dw WorldMap_ExitMap

;===================================================================================================

#EXIT_0AB9A2:
#_0AB9A2: RTL

;---------------------------------------------------------------------------------------------------

WorldMap_FadeOut:
#_0AB9A3: DEC.b $13
#_0AB9A5: BNE EXIT_0AB9A2

#_0AB9A7: LDA.b $9B
#_0AB9A9: STA.l $7EC229

#_0AB9AD: JSL EnableForceBlank

#_0AB9B1: LDA.b #$03
#_0AB9B3: STA.b $95

#_0AB9B5: INC.w $0200

#_0AB9B8: REP #$20

#_0AB9BA: LDA.b $1C
#_0AB9BC: STA.l $7EC211

#_0AB9C0: LDA.b $E0
#_0AB9C2: STA.l $7EC200

#_0AB9C6: LDA.b $E2
#_0AB9C8: STA.l $7EC202

#_0AB9CC: LDA.b $E6
#_0AB9CE: STA.l $7EC204

#_0AB9D2: LDA.b $E8
#_0AB9D4: STA.l $7EC206

#_0AB9D8: STZ.b $E0
#_0AB9DA: STZ.b $E2

#_0AB9DC: STZ.b $E4
#_0AB9DE: STZ.b $E6

#_0AB9E0: STZ.b $E8
#_0AB9E2: STZ.b $EA

#_0AB9E4: LDA.b $99
#_0AB9E6: STA.l $7EC225

#_0AB9EA: LDA.w #$01FC
#_0AB9ED: STA.w $0100

;---------------------------------------------------------------------------------------------------

#_0AB9F0: LDX.b $8A
#_0AB9F2: CPX.b #$80 ; SPOW
#_0AB9F4: BCS .special_overworld

#_0AB9F6: LDA.b $20
#_0AB9F8: STA.l $7EC108

#_0AB9FC: LDA.b $22
#_0AB9FE: STA.l $7EC10A

.special_overworld
#_0ABA02: SEP #$20

#_0ABA04: LDA.l $7EF3C5
#_0ABA08: CMP.b #$02
#_0ABA0A: BCS .zelda_rescured

#_0ABA0C: LDA.b #$80
#_0ABA0E: STA.b $99

#_0ABA10: LDA.b #$61
#_0ABA12: STA.b $9A

.zelda_rescured
#_0ABA14: LDA.b #$10 ; SFX3.10
#_0ABA16: STA.w $012F

#_0ABA19: LDA.b #$05 ; SFX1.05
#_0ABA1B: STA.w $012D

#_0ABA1E: LDA.b #$F2 ; SONG F2 - half volume
#_0ABA20: STA.w $012C

#_0ABA23: LDA.b #$07
#_0ABA25: STA.w BGMODE
#_0ABA28: STA.b $94

#_0ABA2A: LDA.b #$80
#_0ABA2C: STA.w M7SEL

#_0ABA2F: RTL

;===================================================================================================

WorldMap_LoadLightWorldMap:
#_0ABA30: JSR WorldMap_FillTilemapWithEF

#_0ABA33: LDA.b #$11
#_0ABA35: STA.b $1C
#_0ABA37: STZ.b $1D

#_0ABA39: JSL TransferMode7Characters
#_0ABA3D: JSR WorldMap_SetUpHDMA

#_0ABA40: PHB

#_0ABA41: LDA.b #Palettes_OWMAP>>16
#_0ABA43: PHA
#_0ABA44: PLB

#_0ABA45: REP #$30

#_0ABA47: LDX.w #$00FE
#_0ABA4A: LDY.w #$00FE

#_0ABA4D: LDA.b $8A
#_0ABA4F: AND.w #$0040
#_0ABA52: BEQ .light_world

#_0ABA54: LDY.w #$01FE

.light_world
.next_color
#_0ABA57: LDA.w Palettes_OWMAP,Y
#_0ABA5A: STA.l $7EC500,X

#_0ABA5E: DEY
#_0ABA5F: DEY

#_0ABA60: DEX
#_0ABA61: DEX
#_0ABA62: BPL .next_color

#_0ABA64: SEP #$30

#_0ABA66: PLB

#_0ABA67: JSL RefreshLinkEquipmentPalettes_sword_and_mail

#_0ABA6B: INC.b $15

#_0ABA6D: LDA.b #$07
#_0ABA6F: STA.b $17

#_0ABA71: STZ.b $13

#_0ABA73: INC.w $0710
#_0ABA76: INC.w $0200

#_0ABA79: RTL

;===================================================================================================

WorldMap_LoadDarkWorldMap:
#_0ABA7A: LDA.b $8A
#_0ABA7C: AND.b #$40
#_0ABA7E: BEQ .light_world

#_0ABA80: REP #$30

#_0ABA82: LDX.w #$03FE

.copy_next
#_0ABA85: LDA.l WorldMap_DarkWorldTilemap,X
#_0ABA89: STA.w $1000,X

#_0ABA8C: DEX
#_0ABA8D: DEX
#_0ABA8E: BPL .copy_next

#_0ABA90: SEP #$30

#_0ABA92: LDA.b #$15
#_0ABA94: STA.b $17

.light_world
#_0ABA96: INC.w $0200

#_0ABA99: RTL

;===================================================================================================

WorldMap_LoadSpriteGFX:
#_0ABA9A: LDA.b #$10
#_0ABA9C: STA.w $0AAA

#_0ABA9F: JSL Graphics_LoadChrHalfSlot

#_0ABAA3: STZ.w $0AAA

#_0ABAA6: INC.w $0200

#_0ABAA9: RTL

;===================================================================================================

WorldMap_Brighten:
#_0ABAAA: INC.b $13

#_0ABAAC: LDA.b $13
#_0ABAAE: CMP.b #$0F
#_0ABAB0: BNE .exit

#_0ABAB2: INC.w $0200

.exit
#_0ABAB5: RTL

;===================================================================================================

UNREACHABLE_0ABAB6:
#_0ABAB6: db $1E, $00, $1E, $02, $FE, $02, $00, $80
#_0ABABE: db $02, $80, $00, $01, $FF, $01

;===================================================================================================

WorldMap_BaseZoom:
#_0ABAC4: db $21 ; zoomed out
#_0ABAC5: db $0C ; zoomed in

;===================================================================================================

WorldMap_PanMovements:
#_0ABAC6: dw $0000 ; none
#_0ABAC8: dw $0000 ; none
#_0ABACA: dw $0001 ; down
#_0ABACC: dw $0002 ; right
#_0ABACE: dw $FFFF ; up
#_0ABAD0: dw $FFFE ; left
#_0ABAD2: dw $0001 ; never used, but handles UD
#_0ABAD4: dw $0002 ; never used, but handles LR

;===================================================================================================

WorldMap_PanBoundaries:
#_0ABAD6: db $00, $00 ; none
#_0ABAD8: db $00, $00 ; none
#_0ABADA: db $E0, $00 ; down
#_0ABADC: db $E0, $01 ; right
#_0ABADE: db $B8, $FF ; up
#_0ABAE0: db $20, $FF ; left

;===================================================================================================

WorldMapHDMA_ZoomPointers:
#_0ABAE2: dw WorldMapHDMA_ZoomedOut
#_0ABAE4: dw WorldMapHDMA_ZoomedIn

;===================================================================================================

WorldMap_PlayerControl:
#_0ABAE6: LDA.w $0636
#_0ABAE9: ASL A
#_0ABAEA: BCC .no_zoom_change

#_0ABAEC: TAX

#_0ABAED: LSR A
#_0ABAEE: STA.w $0636

#_0ABAF1: LDA.l WorldMapHDMA_ZoomPointers,X
#_0ABAF5: STA.w DMA6ADDRL
#_0ABAF8: STA.w DMA7ADDRL

.no_zoom_change
#_0ABAFB: LDA.w $0636
#_0ABAFE: BNE .ignore_change

#_0ABB00: LDA.b $F6
#_0ABB02: AND.b #$40
#_0ABB04: BEQ .ignore_change

#_0ABB06: INC.w $0200

#_0ABB09: RTL

;---------------------------------------------------------------------------------------------------

.ignore_change
#_0ABB0A: LDA.b $B2
#_0ABB0C: BEQ .not_switching

#_0ABB0E: DEC.b $B2
#_0ABB10: JMP.w .continue

;---------------------------------------------------------------------------------------------------

.not_switching
#_0ABB13: LDA.b $F6
#_0ABB15: AND.b #$70
#_0ABB17: BEQ .continue

#_0ABB19: LDA.b #$24 ; SFX3.24
#_0ABB1B: STA.w $012F

#_0ABB1E: LDA.b #$08
#_0ABB20: STA.b $B2

#_0ABB22: LDA.w $0636
#_0ABB25: EOR.b #$01
#_0ABB27: TAX

#_0ABB28: ORA.b #$80
#_0ABB2A: STA.w $0636

#_0ABB2D: LDA.l WorldMap_BaseZoom,X
#_0ABB31: STA.w $0637

#_0ABB34: CMP.b #$0C
#_0ABB36: BNE .not_zoomed_in

;---------------------------------------------------------------------------------------------------

.zoomed_in
#_0ABB38: REP #$20

#_0ABB3A: LDA.l $7EC108

#_0ABB3E: LSR A
#_0ABB3F: LSR A
#_0ABB40: LSR A
#_0ABB41: LSR A

#_0ABB42: SEC
#_0ABB43: SBC.w #$0048
#_0ABB46: AND.w #$FFFE
#_0ABB49: STA.b $E6

#_0ABB4B: CLC
#_0ABB4C: ADC.w #$0100
#_0ABB4F: STA.w $063A

#_0ABB52: LDA.l $7EC10A

#_0ABB56: LSR A
#_0ABB57: LSR A
#_0ABB58: LSR A
#_0ABB59: LSR A

#_0ABB5A: SEC
#_0ABB5B: SBC.w #$0080
#_0ABB5E: STA.b $02
#_0ABB60: BPL .x_positive_a

#_0ABB62: EOR.w #$FFFF
#_0ABB65: INC A

.x_positive_a
#_0ABB66: STA.b $00

#_0ABB68: ASL A
#_0ABB69: ASL A

#_0ABB6A: CLC
#_0ABB6B: ADC.b $00

#_0ABB6D: LSR A

#_0ABB6E: LDX.b $03
#_0ABB70: BPL .x_positive_b

#_0ABB72: EOR.w #$FFFF
#_0ABB75: INC A

.x_positive_b
#_0ABB76: CLC
#_0ABB77: ADC.w #$0080
#_0ABB7A: BRA .set_scroll

;---------------------------------------------------------------------------------------------------

.not_zoomed_in
#_0ABB7C: REP #$21

#_0ABB7E: LDA.w #$00C8
#_0ABB81: STA.b $E6

#_0ABB83: ADC.w #$0100
#_0ABB86: STA.w $063A

#_0ABB89: LDA.w #$0080

;---------------------------------------------------------------------------------------------------

.set_scroll
#_0ABB8C: AND.w #$FFFE
#_0ABB8F: STA.b $E0

;---------------------------------------------------------------------------------------------------

.continue
#_0ABB91: SEP #$20

#_0ABB93: LDA.w $0636
#_0ABB96: BEQ .map_zoomed_out

#_0ABB98: LDA.b $F0
#_0ABB9A: AND.b #$0C
#_0ABB9C: TAX

#_0ABB9D: REP #$20

#_0ABB9F: LDA.b $E6
#_0ABBA1: CMP.l WorldMap_PanBoundaries,X
#_0ABBA5: BEQ .at_vertical_boundary

#_0ABBA7: CLC
#_0ABBA8: ADC.l WorldMap_PanMovements,X
#_0ABBAC: STA.b $E6

#_0ABBAE: CLC
#_0ABBAF: ADC.w #$0100
#_0ABBB2: STA.w $063A

.at_vertical_boundary
#_0ABBB5: SEP #$20

;---------------------------------------------------------------------------------------------------

#_0ABBB7: LDA.b $F0
#_0ABBB9: AND.b #$03
#_0ABBBB: ASL A

#_0ABBBC: INC A
#_0ABBBD: ASL A
#_0ABBBE: TAX

#_0ABBBF: REP #$20

#_0ABBC1: LDA.b $E0
#_0ABBC3: CMP.l WorldMap_PanBoundaries,X
#_0ABBC7: BEQ .at_horizontal_boundary

#_0ABBC9: CLC
#_0ABBCA: ADC.l WorldMap_PanMovements,X
#_0ABBCE: STA.b $E0

.at_horizontal_boundary
#_0ABBD0: SEP #$20

.map_zoomed_out
#_0ABBD2: JSR WorldMap_HandleSprites

;---------------------------------------------------------------------------------------------------

#EXIT_0ABBD5:
#_0ABBD5: RTL

;===================================================================================================

WorldMap_RestoreGraphics:
#_0ABBD6: DEC.b $13
#_0ABBD8: BNE EXIT_0ABBD5

#_0ABBDA: JSL EnableForceBlank

#_0ABBDE: INC.w $0200

;---------------------------------------------------------------------------------------------------

#_0ABBE1: REP #$20

#_0ABBE3: LDX.b #$00

.next_color
#_0ABBE5: LDA.l $7EC300,X
#_0ABBE9: STA.l $7EC500,X

#_0ABBED: LDA.l $7EC380,X
#_0ABBF1: STA.l $7EC580,X

#_0ABBF5: LDA.l $7EC400,X
#_0ABBF9: STA.l $7EC600,X

#_0ABBFD: LDA.l $7EC480,X
#_0ABC01: STA.l $7EC680,X

#_0ABC05: INX
#_0ABC06: INX
#_0ABC07: CPX.b #$80
#_0ABC09: BNE .next_color

;---------------------------------------------------------------------------------------------------

#_0ABC0B: LDA.l $7EC225
#_0ABC0F: STA.b $99

#_0ABC11: STZ.b $E4
#_0ABC13: STZ.b $EA

#_0ABC15: LDA.l $7EC200
#_0ABC19: STA.b $E0

#_0ABC1B: LDA.l $7EC202
#_0ABC1F: STA.b $E2

#_0ABC21: LDA.l $7EC204
#_0ABC25: STA.b $E6

#_0ABC27: LDA.l $7EC206
#_0ABC2B: STA.b $E8

#_0ABC2D: LDA.l $7EC211
#_0ABC31: STA.b $1C

;===================================================================================================

Attract_SetUpConclusionHDMA:
#_0ABC33: LDA.w #WorldMapHDMA_AttractMode>>0
#_0ABC36: STA.w DMA7ADDRL

#_0ABC39: LDX.b #WorldMapHDMA_AttractMode>>16
#_0ABC3B: STX.w DMA7ADDRB

#_0ABC3E: LDX.b #$00
#_0ABC40: STX.w HDMA7INDIRECTB

#_0ABC43: SEP #$30

#_0ABC45: LDA.b #$80
#_0ABC47: STA.b $9B

#_0ABC49: LDA.b #$09
#_0ABC4B: STA.w BGMODE
#_0ABC4E: STA.b $94

#_0ABC50: STZ.w $0710

#_0ABC53: RTL

;===================================================================================================

WorldMap_ExitMap:
#_0ABC54: STZ.w $0AA9
#_0ABC57: STZ.w $0AB2

#_0ABC5A: JSL InitializeTilesets

#_0ABC5E: INC.b $15

#_0ABC60: STZ.b $B2
#_0ABC62: STZ.w $0200
#_0ABC65: STZ.b $B0

#_0ABC67: LDA.w $010C
#_0ABC6A: STA.b $10

#_0ABC6C: LDA.b #$20
#_0ABC6E: STA.b $11

#_0ABC70: STZ.w $1000
#_0ABC73: STZ.w $1001

#_0ABC76: LDA.l $7EC229
#_0ABC7A: STA.b $9B

#_0ABC7C: SEP #$20

#_0ABC7E: LDX.b $8A

#_0ABC80: LDA.l $7F5B00,X
#_0ABC84: LSR A
#_0ABC85: LSR A
#_0ABC86: LSR A
#_0ABC87: LSR A
#_0ABC88: STA.w $012D

#_0ABC8B: LDA.b #$10 ; SFX3.10
#_0ABC8D: STA.w $012F

#_0ABC90: LDA.b #$F3 ; SONG F3 - max volume
#_0ABC92: STA.w $012C

#_0ABC95: RTL

;===================================================================================================

WorldMap_SetUpHDMA:
#_0ABC96: REP #$20

#_0ABC98: LDA.w #$0080
#_0ABC9B: STA.b $E0

#_0ABC9D: LDA.w #$00C8
#_0ABCA0: STA.b $E6

#_0ABCA2: ADC.w #$0100
#_0ABCA5: STA.w $063A

#_0ABCA8: LDA.w #$0100
#_0ABCAB: STA.w $0638

#_0ABCAE: LDA.w #$1B42
#_0ABCB1: STA.w DMA6MODE

#_0ABCB4: LDA.w #$1E42
#_0ABCB7: STA.w DMA7MODE

;---------------------------------------------------------------------------------------------------

#_0ABCBA: SEP #$20

#_0ABCBC: STZ.b $96
#_0ABCBE: STZ.b $97
#_0ABCC0: STZ.b $98
#_0ABCC2: STZ.b $1E
#_0ABCC4: STZ.b $1F

#_0ABCC6: STZ.w M7B
#_0ABCC9: STZ.w M7B
#_0ABCCC: STZ.w M7C
#_0ABCCF: STZ.w M7C

#_0ABCD2: STZ.w M7X
#_0ABCD5: LDA.b #$01
#_0ABCD7: STA.w M7X

#_0ABCDA: STZ.w M7Y
#_0ABCDD: STA.w M7Y

;---------------------------------------------------------------------------------------------------

#_0ABCE0: LDA.b $10
#_0ABCE2: CMP.b #$14
#_0ABCE4: BEQ .attract_mode

#_0ABCE6: LDA.b $11
#_0ABCE8: CMP.b #$0A
#_0ABCEA: BNE .not_flute_map

#_0ABCEC: JMP.w .flute_map

;---------------------------------------------------------------------------------------------------

.not_flute_map
#_0ABCEF: LDA.b #$04
#_0ABCF1: STA.w $0635

#_0ABCF4: LDA.b #$0C
#_0ABCF6: STA.w $0637

#_0ABCF9: LDA.b #$01
#_0ABCFB: STA.w $0636

#_0ABCFE: REP #$21

#_0ABD00: LDA.l $7EC108

#_0ABD04: LSR A
#_0ABD05: LSR A
#_0ABD06: LSR A
#_0ABD07: LSR A

#_0ABD08: SEC
#_0ABD09: SBC.w #$0048

#_0ABD0C: AND.w #$FFFE
#_0ABD0F: CLC
#_0ABD10: ADC.l WorldMap_PanMovements
#_0ABD14: STA.b $E6

#_0ABD16: CLC
#_0ABD17: ADC.w #$0100
#_0ABD1A: STA.w $063A

;---------------------------------------------------------------------------------------------------

#_0ABD1D: LDA.l $7EC10A

#_0ABD21: LSR A
#_0ABD22: LSR A
#_0ABD23: LSR A
#_0ABD24: LSR A

#_0ABD25: SEC
#_0ABD26: SBC.w #$0080
#_0ABD29: STA.b $02
#_0ABD2B: BPL .x_positive_a

#_0ABD2D: EOR.w #$FFFF
#_0ABD30: INC A

.x_positive_a
#_0ABD31: STA.b $00

#_0ABD33: ASL A
#_0ABD34: ASL A
#_0ABD35: CLC
#_0ABD36: ADC.b $00

#_0ABD38: LSR A
#_0ABD39: LDX.b $03
#_0ABD3B: BPL .x_positive_b

#_0ABD3D: EOR.w #$FFFF
#_0ABD40: INC A

.x_positive_b
#_0ABD41: CLC
#_0ABD42: ADC.w #$0080
#_0ABD45: AND.w #$FFFE
#_0ABD48: STA.b $E0

;---------------------------------------------------------------------------------------------------

.normal_map
#_0ABD4A: LDA.w #WorldMapHDMA_ZoomedIn>>0
#_0ABD4D: STA.w DMA6ADDRL
#_0ABD50: STA.w DMA7ADDRL

#_0ABD53: LDX.b #WorldMapHDMA_ZoomedIn>>16
#_0ABD55: STX.w DMA6ADDRB
#_0ABD58: STX.w DMA7ADDRB

#_0ABD5B: LDX.b #WorldMapHDMA_ZoomedIn>>16
#_0ABD5D: BRA .continue

;---------------------------------------------------------------------------------------------------

.attract_mode
#_0ABD5F: REP #$21

#_0ABD61: LDA.w #WorldMapHDMA_AttractMode>>0
#_0ABD64: STA.w DMA6ADDRL
#_0ABD67: STA.w DMA7ADDRL

#_0ABD6A: LDX.b #WorldMapHDMA_AttractMode>>16
#_0ABD6C: STX.w DMA6ADDRB
#_0ABD6F: STX.w DMA7ADDRB

#_0ABD72: LDX.b #$00
#_0ABD74: BRA .continue

;---------------------------------------------------------------------------------------------------

.flute_map
#_0ABD76: LDA.b #$04
#_0ABD78: STA.w $0635

#_0ABD7B: LDA.b #$21
#_0ABD7D: STA.w $0637
#_0ABD80: STZ.w $0636

#_0ABD83: REP #$21

#_0ABD85: LDA.w #WorldMapHDMA_ZoomedOut>>0
#_0ABD88: STA.w DMA6ADDRL
#_0ABD8B: STA.w DMA7ADDRL

#_0ABD8E: LDX.b #WorldMapHDMA_ZoomedOut>>16
#_0ABD90: STX.w DMA6ADDRB
#_0ABD93: STX.w DMA7ADDRB

#_0ABD96: LDX.b #WorldMapHDMA_ZoomedOut>>16

;---------------------------------------------------------------------------------------------------

.continue
#_0ABD98: STX.w HDMA6INDIRECTB
#_0ABD9B: STX.w HDMA7INDIRECTB

#_0ABD9E: SEP #$20

#_0ABDA0: LDA.b #$C0
#_0ABDA2: STA.b $9B

#_0ABDA4: RTS

;===================================================================================================

WorldMap_FillTilemapWithEF:
#_0ABDA5: REP #$20

#_0ABDA7: LDA.w #$00EF
#_0ABDAA: STA.b $00

#_0ABDAC: STZ.w VMAIN
#_0ABDAF: STZ.w VMADDR ; VRAM $0000

#_0ABDB2: LDA.w #$1808
#_0ABDB5: STA.w DMA1MODE
#_0ABDB8: STZ.w DMA1ADDRB

#_0ABDBB: LDA.w #$0000
#_0ABDBE: STA.w DMA1ADDRL

#_0ABDC1: LDA.w #$4000
#_0ABDC4: STA.w DMA1SIZE

#_0ABDC7: LDY.b #$02
#_0ABDC9: STY.w MDMAEN

#_0ABDCC: SEP #$20

#_0ABDCE: RTS

;===================================================================================================

WorldMapHDMA_ZoomedOut:
#_0ABDCF: db $F0 : dw WorldMapHDMA_ZoomedOut_Part1 ; 112 lines, continuous
#_0ABDD2: db $F0 : dw WorldMapHDMA_ZoomedOut_Part2 ; 112 lines, continuous
#_0ABDD5: db $00 ; end

;===================================================================================================

WorldMapHDMA_ZoomedIn:
#_0ABDD6: db $F0 : dw WorldMapHDMA_ZoomedIn_Part1 ; 112 lines, continuous
#_0ABDD9: db $F0 : dw WorldMapHDMA_ZoomedIn_Part2 ; 112 lines, continuous
#_0ABDDC: db $00 ; end

;===================================================================================================

WorldMapHDMA_AttractMode:
#_0ABDDD: db $F0 : dw $1B00 ; 112 lines, continuous
#_0ABDE0: db $F0 : dw $1BE0 ; 112 lines, continuous
#_0ABDE3: db $00 ; end

;===================================================================================================

WorldMapIcon_posx_spr0:
#_0ABDE4: dw $07FF ; 0x00
#_0ABDE6: dw $02C0 ; 0x01
#_0ABDE8: dw $0D00 ; 0x02
#_0ABDEA: dw $0F31 ; 0x03
#_0ABDEC: dw $006D ; 0x04
#_0ABDEE: dw $07E0 ; 0x05
#_0ABDF0: dw $0F40 ; 0x06
#_0ABDF2: dw $0F40 ; 0x07
#_0ABDF4: dw $08DC ; 0x08

WorldMapIcon_posy_spr0:
#_0ABDF6: dw $0730 ; 0x00
#_0ABDF8: dw $06A0 ; 0x01
#_0ABDFA: dw $0710 ; 0x02
#_0ABDFC: dw $0620 ; 0x03
#_0ABDFE: dw $0070 ; 0x04
#_0ABE00: dw $0640 ; 0x05
#_0ABE02: dw $0620 ; 0x06
#_0ABE04: dw $0620 ; 0x07
#_0ABE06: dw $0030 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_posx_spr1:
#_0ABE08: dw $FF00 ; 0x00
#_0ABE0A: dw $FF00 ; 0x01
#_0ABE0C: dw $FF00 ; 0x02
#_0ABE0E: dw $08D0 ; 0x03
#_0ABE10: dw $FF00 ; 0x04
#_0ABE12: dw $FF00 ; 0x05
#_0ABE14: dw $FF00 ; 0x06
#_0ABE16: dw $0082 ; 0x07
#_0ABE18: dw $FF00 ; 0x08

WorldMapIcon_posy_spr1:
#_0ABE1A: dw $FF00 ; 0x00
#_0ABE1C: dw $FF00 ; 0x01
#_0ABE1E: dw $FF00 ; 0x02
#_0ABE20: dw $0080 ; 0x03
#_0ABE22: dw $FF00 ; 0x04
#_0ABE24: dw $FF00 ; 0x05
#_0ABE26: dw $FF00 ; 0x06
#_0ABE28: dw $00B0 ; 0x07
#_0ABE2A: dw $FF00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_posx_spr2:
#_0ABE2C: dw $FF00 ; 0x00
#_0ABE2E: dw $FF00 ; 0x01
#_0ABE30: dw $FF00 ; 0x02
#_0ABE32: dw $0108 ; 0x03
#_0ABE34: dw $FF00 ; 0x04
#_0ABE36: dw $FF00 ; 0x05
#_0ABE38: dw $FF00 ; 0x06
#_0ABE3A: dw $0F11 ; 0x07
#_0ABE3C: dw $FF00 ; 0x08

WorldMapIcon_posy_spr2:
#_0ABE3E: dw $FF00 ; 0x00
#_0ABE40: dw $FF00 ; 0x01
#_0ABE42: dw $FF00 ; 0x02
#_0ABE44: dw $0D70 ; 0x03
#_0ABE46: dw $FF00 ; 0x04
#_0ABE48: dw $FF00 ; 0x05
#_0ABE4A: dw $FF00 ; 0x06
#_0ABE4C: dw $0103 ; 0x07
#_0ABE4E: dw $FF00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_posx_spr3:
#_0ABE50: dw $FF00 ; 0x00
#_0ABE52: dw $FF00 ; 0x01
#_0ABE54: dw $FF00 ; 0x02
#_0ABE56: dw $006D ; 0x03
#_0ABE58: dw $FF00 ; 0x04
#_0ABE5A: dw $FF00 ; 0x05
#_0ABE5C: dw $FF00 ; 0x06
#_0ABE5E: dw $01D0 ; 0x07
#_0ABE60: dw $FF00 ; 0x08

WorldMapIcon_posy_spr3:
#_0ABE62: dw $FF00 ; 0x00
#_0ABE64: dw $FF00 ; 0x01
#_0ABE66: dw $FF00 ; 0x02
#_0ABE68: dw $0070 ; 0x03
#_0ABE6A: dw $FF00 ; 0x04
#_0ABE6C: dw $FF00 ; 0x05
#_0ABE6E: dw $FF00 ; 0x06
#_0ABE70: dw $0780 ; 0x07
#_0ABE72: dw $FF00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_posx_spr4:
#_0ABE74: dw $FF00 ; 0x00
#_0ABE76: dw $FF00 ; 0x01
#_0ABE78: dw $FF00 ; 0x02
#_0ABE7A: dw $FF00 ; 0x03
#_0ABE7C: dw $FF00 ; 0x04
#_0ABE7E: dw $FF00 ; 0x05
#_0ABE80: dw $FF00 ; 0x06
#_0ABE82: dw $0100 ; 0x07
#_0ABE84: dw $FF00 ; 0x08

WorldMapIcon_posy_spr4:
#_0ABE86: dw $FF00 ; 0x00
#_0ABE88: dw $FF00 ; 0x01
#_0ABE8A: dw $FF00 ; 0x02
#_0ABE8C: dw $FF00 ; 0x03
#_0ABE8E: dw $FF00 ; 0x04
#_0ABE90: dw $FF00 ; 0x05
#_0ABE92: dw $FF00 ; 0x06
#_0ABE94: dw $0CA0 ; 0x07
#_0ABE96: dw $FF00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_posx_spr5:
#_0ABE98: dw $FF00 ; 0x00
#_0ABE9A: dw $FF00 ; 0x01
#_0ABE9C: dw $FF00 ; 0x02
#_0ABE9E: dw $FF00 ; 0x03
#_0ABEA0: dw $FF00 ; 0x04
#_0ABEA2: dw $FF00 ; 0x05
#_0ABEA4: dw $FF00 ; 0x06
#_0ABEA6: dw $0CA0 ; 0x07
#_0ABEA8: dw $FF00 ; 0x08

WorldMapIcon_posy_spr5:
#_0ABEAA: dw $FF00 ; 0x00
#_0ABEAC: dw $FF00 ; 0x01
#_0ABEAE: dw $FF00 ; 0x02
#_0ABEB0: dw $FF00 ; 0x03
#_0ABEB2: dw $FF00 ; 0x04
#_0ABEB4: dw $FF00 ; 0x05
#_0ABEB6: dw $FF00 ; 0x06
#_0ABEB8: dw $0DA0 ; 0x07
#_0ABEBA: dw $FF00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_posx_spr6:
#_0ABEBC: dw $FF00 ; 0x00
#_0ABEBE: dw $FF00 ; 0x01
#_0ABEC0: dw $FF00 ; 0x02
#_0ABEC2: dw $FF00 ; 0x03
#_0ABEC4: dw $FF00 ; 0x04
#_0ABEC6: dw $FF00 ; 0x05
#_0ABEC8: dw $FF00 ; 0x06
#_0ABECA: dw $0759 ; 0x07
#_0ABECC: dw $FF00 ; 0x08

WorldMapIcon_posy_spr6:
#_0ABECE: dw $FF00 ; 0x00
#_0ABED0: dw $FF00 ; 0x01
#_0ABED2: dw $FF00 ; 0x02
#_0ABED4: dw $FF00 ; 0x03
#_0ABED6: dw $FF00 ; 0x04
#_0ABED8: dw $FF00 ; 0x05
#_0ABEDA: dw $FF00 ; 0x06
#_0ABEDC: dw $0ED0 ; 0x07
#_0ABEDE: dw $FF00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_tile_spr0:
#_0ABEE0: db $00, $00 ; 0x00
#_0ABEE2: db $00, $00 ; 0x01
#_0ABEE4: db $00, $00 ; 0x02
#_0ABEE6: db $38, $60 ; 0x03
#_0ABEE8: db $34, $62 ; 0x04
#_0ABEEA: db $32, $66 ; 0x05
#_0ABEEC: db $34, $64 ; 0x06
#_0ABEEE: db $34, $64 ; 0x07
#_0ABEF0: db $32, $66 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_tile_spr1:
#_0ABEF2: db $00, $00 ; 0x00
#_0ABEF4: db $00, $00 ; 0x01
#_0ABEF6: db $00, $00 ; 0x02
#_0ABEF8: db $32, $60 ; 0x03
#_0ABEFA: db $00, $00 ; 0x04
#_0ABEFC: db $00, $00 ; 0x05
#_0ABEFE: db $00, $00 ; 0x06
#_0ABF00: db $34, $64 ; 0x07
#_0ABF02: db $00, $00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_tile_spr2:
#_0ABF04: db $00, $00 ; 0x00
#_0ABF06: db $00, $00 ; 0x01
#_0ABF08: db $00, $00 ; 0x02
#_0ABF0A: db $34, $60 ; 0x03
#_0ABF0C: db $00, $00 ; 0x04
#_0ABF0E: db $00, $00 ; 0x05
#_0ABF10: db $00, $00 ; 0x06
#_0ABF12: db $34, $64 ; 0x07
#_0ABF14: db $00, $00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_tile_spr3:
#_0ABF16: db $00, $00 ; 0x00
#_0ABF18: db $00, $00 ; 0x01
#_0ABF1A: db $00, $00 ; 0x02
#_0ABF1C: db $34, $62 ; 0x03
#_0ABF1E: db $00, $00 ; 0x04
#_0ABF20: db $00, $00 ; 0x05
#_0ABF22: db $00, $00 ; 0x06
#_0ABF24: db $34, $64 ; 0x07
#_0ABF26: db $00, $00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_tile_spr4:
#_0ABF28: db $00, $00 ; 0x00
#_0ABF2A: db $00, $00 ; 0x01
#_0ABF2C: db $00, $00 ; 0x02
#_0ABF2E: db $00, $00 ; 0x03
#_0ABF30: db $00, $00 ; 0x04
#_0ABF32: db $00, $00 ; 0x05
#_0ABF34: db $00, $00 ; 0x06
#_0ABF36: db $34, $64 ; 0x07
#_0ABF38: db $00, $00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_tile_spr5:
#_0ABF3A: db $00, $00 ; 0x00
#_0ABF3C: db $00, $00 ; 0x01
#_0ABF3E: db $00, $00 ; 0x02
#_0ABF40: db $00, $00 ; 0x03
#_0ABF42: db $00, $00 ; 0x04
#_0ABF44: db $00, $00 ; 0x05
#_0ABF46: db $00, $00 ; 0x06
#_0ABF48: db $34, $64 ; 0x07
#_0ABF4A: db $00, $00 ; 0x08

;---------------------------------------------------------------------------------------------------

WorldMapIcon_tile_spr6:
#_0ABF4C: db $00, $00 ; 0x00
#_0ABF4E: db $00, $00 ; 0x01
#_0ABF50: db $00, $00 ; 0x02
#_0ABF52: db $00, $00 ; 0x03
#_0ABF54: db $00, $00 ; 0x04
#_0ABF56: db $00, $00 ; 0x05
#_0ABF58: db $00, $00 ; 0x06
#_0ABF5A: db $34, $64 ; 0x07
#_0ABF5C: db $00, $00 ; 0x08

;===================================================================================================

WorldMap_RedXChars:
#_0ABF5E: db $68, $69, $78, $69

;===================================================================================================

WorldMap_PortalProps:
#_0ABF62: db $34, $74, $F4, $B4

;===================================================================================================

WorldMap_HandleSprites:
#_0ABF66: LDA.b $1A
#_0ABF68: AND.b #$10
#_0ABF6A: BEQ .dont_draw_link

#_0ABF6C: JSR WorldMap_CalculateOAMCoordinates
#_0ABF6F: BCC .dont_draw_link

;---------------------------------------------------------------------------------------------------

#_0ABF71: LDA.b $0E
#_0ABF73: SEC
#_0ABF74: SBC.b #$04
#_0ABF76: STA.b $0E

#_0ABF78: LDA.b $0F
#_0ABF7A: SEC
#_0ABF7B: SBC.b #$04
#_0ABF7D: STA.b $0F

#_0ABF7F: LDA.b #$00
#_0ABF81: STA.b $0D

#_0ABF83: LDA.b #$3E
#_0ABF85: STA.b $0C

#_0ABF87: LDA.b #$02
#_0ABF89: STA.b $0B

#_0ABF8B: LDX.b #$00
#_0ABF8D: JSR WorldMap_HandleSpriteBlink

;---------------------------------------------------------------------------------------------------

.dont_draw_link
#_0ABF90: LDA.l $7EC108
#_0ABF94: PHA

#_0ABF95: LDA.l $7EC109
#_0ABF99: PHA

#_0ABF9A: LDA.l $7EC10A
#_0ABF9E: PHA

#_0ABF9F: LDA.l $7EC10B
#_0ABFA3: PHA

;---------------------------------------------------------------------------------------------------

#_0ABFA4: LDA.w $008A
#_0ABFA7: CMP.b #$40
#_0ABFA9: BCS .dont_draw_mirror_portal

#_0ABFAB: LDX.b #$0F

#_0ABFAD: LDA.w $1AB0,X
#_0ABFB0: ORA.w $1AC0,X
#_0ABFB3: ORA.w $1AD0,X
#_0ABFB6: ORA.w $1AE0,X
#_0ABFB9: BEQ .dont_draw_mirror_portal

#_0ABFBB: LDA.b $1A
#_0ABFBD: BNE .dont_swap_portal_char

#_0ABFBF: LDA.w $1AF0,X
#_0ABFC2: INC A
#_0ABFC3: STA.w $1AF0,X

.dont_swap_portal_char
#_0ABFC6: LDA.w $1AB0,X
#_0ABFC9: STA.l $7EC10A

#_0ABFCD: LDA.w $1AC0,X
#_0ABFD0: STA.l $7EC10B

#_0ABFD4: LDA.w $1AD0,X
#_0ABFD7: STA.l $7EC108

#_0ABFDB: LDA.w $1AE0,X
#_0ABFDE: STA.l $7EC109

#_0ABFE2: JSR WorldMap_CalculateOAMCoordinates
#_0ABFE5: BCC .dont_draw_mirror_portal

#_0ABFE7: LDA.b #$6A
#_0ABFE9: STA.b $0D

#_0ABFEB: LDA.b $1A
#_0ABFED: LSR A
#_0ABFEE: AND.b #$03
#_0ABFF0: TAX

#_0ABFF1: LDA.l WorldMap_PortalProps,X
#_0ABFF5: STA.b $0C

#_0ABFF7: LDA.b #$02
#_0ABFF9: STA.b $0B

#_0ABFFB: LDX.b #$0F
#_0ABFFD: JSR WorldMap_HandleSpriteBlink

;---------------------------------------------------------------------------------------------------

.dont_draw_mirror_portal
#_0AC000: LDA.l $7EF2DB
#_0AC004: AND.b #$20
#_0AC006: BNE .pyramid_open

#_0AC008: LDA.l $7EF3C7
#_0AC00C: CMP.b #$06

#_0AC00E: ROL A
#_0AC00F: EOR.w $0FFF
#_0AC012: AND.b #$01
#_0AC014: BEQ .draw_prizes

.pyramid_open
#_0AC016: JMP.w .restore_coords_and_exit

;---------------------------------------------------------------------------------------------------

.draw_prizes
#_0AC019: LDX.b #$00
#_0AC01B: JSR OverworldMap_CheckForPendant
#_0AC01E: BCS .skip_draw_0

#_0AC020: JSR OverworldMap_CheckForCrystal
#_0AC023: BCS .skip_draw_0

#_0AC025: LDA.l $7EF3C7
#_0AC029: ASL A
#_0AC02A: TAX

#_0AC02B: LDA.l WorldMapIcon_posx_spr0+1,X
#_0AC02F: BMI .skip_draw_0

#_0AC031: STA.l $7EC10B

#_0AC035: LDA.l WorldMapIcon_posx_spr0+0,X
#_0AC039: STA.l $7EC10A

#_0AC03D: LDA.l WorldMapIcon_posy_spr0+1,X
#_0AC041: STA.l $7EC109

#_0AC045: LDA.l WorldMapIcon_posy_spr0+0,X
#_0AC049: STA.l $7EC108

;---------------------------------------------------------------------------------------------------

#_0AC04D: LDA.l WorldMapIcon_tile_spr0+1,X
#_0AC051: BEQ .dont_adjust_0

#_0AC053: CMP.b #$64
#_0AC055: BEQ .is_crystal_1

#_0AC057: LDA.b $1A
#_0AC059: AND.b #$10
#_0AC05B: BNE .skip_draw_0

.is_crystal_1
#_0AC05D: JSR WorldMapIcon_AdjustCoordinate

;---------------------------------------------------------------------------------------------------

.dont_adjust_0
#_0AC060: LDX.b #$0E
#_0AC062: JSR WorldMap_CalculateOAMCoordinates
#_0AC065: BCC .skip_draw_0

#_0AC067: LDA.l $7EF3C7
#_0AC06B: ASL A
#_0AC06C: TAX

#_0AC06D: LDA.l WorldMapIcon_tile_spr0+1,X
#_0AC071: BEQ .is_red_x_0

#_0AC073: STA.b $0D

#_0AC075: LDA.l WorldMapIcon_tile_spr0+0,X
#_0AC079: STA.b $0C

#_0AC07B: LDA.b #$02
#_0AC07D: BRA .continue_0

;---------------------------------------------------------------------------------------------------

.is_red_x_0
#_0AC07F: LDA.b $1A

#_0AC081: LSR A
#_0AC082: LSR A
#_0AC083: LSR A

#_0AC084: AND.b #$03
#_0AC086: TAX

#_0AC087: LDA.l WorldMap_RedXChars,X
#_0AC08B: STA.b $0D

#_0AC08D: LDA.b #$32
#_0AC08F: STA.b $0C

#_0AC091: LDA.b #$00

;---------------------------------------------------------------------------------------------------

.continue_0
#_0AC093: STA.b $0B

#_0AC095: LDX.b #$0E
#_0AC097: JSR WorldMap_HandleSpriteBlink

;===================================================================================================

.skip_draw_0
#_0AC09A: LDX.b #$01
#_0AC09C: JSR OverworldMap_CheckForPendant
#_0AC09F: BCS .skip_draw_1

#_0AC0A1: JSR OverworldMap_CheckForCrystal
#_0AC0A4: BCS .skip_draw_1

#_0AC0A6: LDA.l $7EF3C7
#_0AC0AA: ASL A
#_0AC0AB: TAX

#_0AC0AC: LDA.l WorldMapIcon_posx_spr1+1,X
#_0AC0B0: BMI .skip_draw_1

#_0AC0B2: STA.l $7EC10B

#_0AC0B6: LDA.l WorldMapIcon_posx_spr1+0,X
#_0AC0BA: STA.l $7EC10A

#_0AC0BE: LDA.l WorldMapIcon_posy_spr1+1,X
#_0AC0C2: STA.l $7EC109

#_0AC0C6: LDA.l WorldMapIcon_posy_spr1+0,X
#_0AC0CA: STA.l $7EC108

;---------------------------------------------------------------------------------------------------

#_0AC0CE: LDA.l WorldMapIcon_tile_spr1+1,X
#_0AC0D2: BEQ .dont_adjust_1

#_0AC0D4: CMP.b #$64
#_0AC0D6: BEQ .is_crystal_3

#_0AC0D8: LDA.b $1A
#_0AC0DA: AND.b #$10
#_0AC0DC: BNE .skip_draw_1

.is_crystal_3
#_0AC0DE: JSR WorldMapIcon_AdjustCoordinate

;---------------------------------------------------------------------------------------------------

.dont_adjust_1
#_0AC0E1: JSR WorldMap_CalculateOAMCoordinates
#_0AC0E4: BCC .skip_draw_1

#_0AC0E6: LDA.l $7EF3C7
#_0AC0EA: ASL A
#_0AC0EB: TAX

#_0AC0EC: LDA.l WorldMapIcon_tile_spr1+1,X
#_0AC0F0: BEQ .is_red_x_1

#_0AC0F2: STA.b $0D

#_0AC0F4: LDA.l WorldMapIcon_tile_spr1+0,X
#_0AC0F8: STA.b $0C

#_0AC0FA: LDA.b #$02
#_0AC0FC: BRA .continue_1

;---------------------------------------------------------------------------------------------------

.is_red_x_1
#_0AC0FE: LDA.b $1A

#_0AC100: LSR A
#_0AC101: LSR A
#_0AC102: LSR A

#_0AC103: AND.b #$03
#_0AC105: TAX

#_0AC106: LDA.l WorldMap_RedXChars,X
#_0AC10A: STA.b $0D

#_0AC10C: LDA.b #$32
#_0AC10E: STA.b $0C

#_0AC110: LDA.b #$00

;---------------------------------------------------------------------------------------------------

.continue_1
#_0AC112: STA.b $0B

#_0AC114: LDX.b #$0D
#_0AC116: JSR WorldMap_HandleSpriteBlink

;===================================================================================================

.skip_draw_1
#_0AC119: LDX.b #$02
#_0AC11B: JSR OverworldMap_CheckForPendant
#_0AC11E: BCS .skip_draw_2

#_0AC120: JSR OverworldMap_CheckForCrystal
#_0AC123: BCS .skip_draw_2

#_0AC125: LDA.l $7EF3C7
#_0AC129: ASL A
#_0AC12A: TAX

#_0AC12B: LDA.l WorldMapIcon_posx_spr2+1,X
#_0AC12F: BMI .skip_draw_2

#_0AC131: STA.l $7EC10B

#_0AC135: LDA.l WorldMapIcon_posx_spr2+0,X
#_0AC139: STA.l $7EC10A

#_0AC13D: LDA.l WorldMapIcon_posy_spr2+1,X
#_0AC141: STA.l $7EC109

#_0AC145: LDA.l WorldMapIcon_posy_spr2+0,X
#_0AC149: STA.l $7EC108

;---------------------------------------------------------------------------------------------------

#_0AC14D: LDA.l WorldMapIcon_tile_spr2+1,X
#_0AC151: BEQ .dont_adjust_2

#_0AC153: CMP.b #$64
#_0AC155: BEQ .is_crystal_7

#_0AC157: LDA.b $1A
#_0AC159: AND.b #$10
#_0AC15B: BNE .skip_draw_2

.is_crystal_7
#_0AC15D: JSR WorldMapIcon_AdjustCoordinate

;---------------------------------------------------------------------------------------------------

.dont_adjust_2
#_0AC160: LDX.b #$0C
#_0AC162: JSR WorldMap_CalculateOAMCoordinates
#_0AC165: BCC .skip_draw_2

#_0AC167: LDA.l $7EF3C7
#_0AC16B: ASL A
#_0AC16C: TAX

#_0AC16D: LDA.l WorldMapIcon_tile_spr2+1,X
#_0AC171: BEQ .is_red_x_2

#_0AC173: STA.b $0D

#_0AC175: LDA.l WorldMapIcon_tile_spr2+0,X
#_0AC179: STA.b $0C

#_0AC17B: LDA.b #$02
#_0AC17D: BRA .continue_2

;---------------------------------------------------------------------------------------------------

.is_red_x_2
#_0AC17F: LDA.b $1A

#_0AC181: LSR A
#_0AC182: LSR A
#_0AC183: LSR A

#_0AC184: AND.b #$03
#_0AC186: TAX

#_0AC187: LDA.l WorldMap_RedXChars,X
#_0AC18B: STA.b $0D

#_0AC18D: LDA.b #$32
#_0AC18F: STA.b $0C

#_0AC191: LDA.b #$00

;---------------------------------------------------------------------------------------------------

.continue_2
#_0AC193: STA.b $0B

#_0AC195: LDX.b #$0C
#_0AC197: JSR WorldMap_HandleSpriteBlink

;===================================================================================================

.skip_draw_2
#_0AC19A: LDX.b #$03
#_0AC19C: JSR OverworldMap_CheckForCrystal
#_0AC19F: BCS .skip_draw_3

#_0AC1A1: LDA.l $7EF3C7
#_0AC1A5: ASL A
#_0AC1A6: TAX

#_0AC1A7: LDA.l WorldMapIcon_posx_spr3+1,X
#_0AC1AB: BMI .skip_draw_3

#_0AC1AD: STA.l $7EC10B

#_0AC1B1: LDA.l WorldMapIcon_posx_spr3+0,X
#_0AC1B5: STA.l $7EC10A

#_0AC1B9: LDA.l WorldMapIcon_posy_spr3+1,X
#_0AC1BD: STA.l $7EC109

#_0AC1C1: LDA.l WorldMapIcon_posy_spr3+0,X
#_0AC1C5: STA.l $7EC108

;---------------------------------------------------------------------------------------------------

#_0AC1C9: LDA.l WorldMapIcon_tile_spr3+1,X
#_0AC1CD: BEQ .dont_adjust_3

#_0AC1CF: CMP.b #$64
#_0AC1D1: BEQ .is_crystal_4

#_0AC1D3: LDA.b $1A
#_0AC1D5: AND.b #$10
#_0AC1D7: BNE .skip_draw_3

.is_crystal_4
#_0AC1D9: JSR WorldMapIcon_AdjustCoordinate

;---------------------------------------------------------------------------------------------------

.dont_adjust_3
#_0AC1DC: LDX.b #$0B
#_0AC1DE: JSR WorldMap_CalculateOAMCoordinates
#_0AC1E1: BCC .skip_draw_3

#_0AC1E3: LDA.l $7EF3C7
#_0AC1E7: ASL A
#_0AC1E8: TAX

#_0AC1E9: LDA.l WorldMapIcon_tile_spr3+1,X
#_0AC1ED: BEQ .is_red_x_3

#_0AC1EF: STA.b $0D

#_0AC1F1: LDA.l WorldMapIcon_tile_spr3+0,X
#_0AC1F5: STA.b $0C

#_0AC1F7: LDA.b #$02
#_0AC1F9: BRA .continue_3

;---------------------------------------------------------------------------------------------------

.is_red_x_3
#_0AC1FB: LDA.b $1A

#_0AC1FD: LSR A
#_0AC1FE: LSR A
#_0AC1FF: LSR A

#_0AC200: AND.b #$03
#_0AC202: TAX

#_0AC203: LDA.l WorldMap_RedXChars,X
#_0AC207: STA.b $0D

#_0AC209: LDA.b #$32
#_0AC20B: STA.b $0C

#_0AC20D: LDA.b #$00

;---------------------------------------------------------------------------------------------------

.continue_3
#_0AC20F: STA.b $0B

#_0AC211: LDX.b #$0B
#_0AC213: JSR WorldMap_HandleSpriteBlink

;---------------------------------------------------------------------------------------------------

.skip_draw_3
#_0AC216: LDX.b #$04
#_0AC218: JSR OverworldMap_CheckForCrystal
#_0AC21B: BCS .skip_draw_4

#_0AC21D: LDA.l $7EF3C7
#_0AC221: ASL A
#_0AC222: TAX

#_0AC223: LDA.l WorldMapIcon_posx_spr4+1,X
#_0AC227: BMI .skip_draw_4

#_0AC229: STA.l $7EC10B

#_0AC22D: LDA.l WorldMapIcon_posx_spr4+0,X
#_0AC231: STA.l $7EC10A

#_0AC235: LDA.l WorldMapIcon_posy_spr4+1,X
#_0AC239: STA.l $7EC109

#_0AC23D: LDA.l WorldMapIcon_posy_spr4+0,X
#_0AC241: STA.l $7EC108

;---------------------------------------------------------------------------------------------------

#_0AC245: LDA.l WorldMapIcon_tile_spr4+1,X
#_0AC249: BEQ .dont_adjust_4

#_0AC24B: CMP.b #$64
#_0AC24D: BEQ .is_crystal_6

#_0AC24F: LDA.b $1A
#_0AC251: AND.b #$10
#_0AC253: BNE .skip_draw_4

.is_crystal_6
#_0AC255: JSR WorldMapIcon_AdjustCoordinate

;---------------------------------------------------------------------------------------------------

.dont_adjust_4
#_0AC258: LDX.b #$0A
#_0AC25A: JSR WorldMap_CalculateOAMCoordinates
#_0AC25D: BCC .skip_draw_4

#_0AC25F: LDA.l $7EF3C7
#_0AC263: ASL A
#_0AC264: TAX

#_0AC265: LDA.l WorldMapIcon_tile_spr4+1,X
#_0AC269: BEQ .is_red_x_4

#_0AC26B: STA.b $0D

#_0AC26D: LDA.l WorldMapIcon_tile_spr4+0,X
#_0AC271: STA.b $0C

#_0AC273: LDA.b #$02
#_0AC275: BRA .continue_4

.is_red_x_4
#_0AC277: LDA.b $1A

#_0AC279: LSR A
#_0AC27A: LSR A
#_0AC27B: LSR A

#_0AC27C: AND.b #$03
#_0AC27E: TAX

#_0AC27F: LDA.l WorldMap_RedXChars,X
#_0AC283: STA.b $0D

#_0AC285: LDA.b #$32
#_0AC287: STA.b $0C

#_0AC289: LDA.b #$00

;---------------------------------------------------------------------------------------------------

.continue_4
#_0AC28B: STA.b $0B

#_0AC28D: LDX.b #$0A
#_0AC28F: JSR WorldMap_HandleSpriteBlink

;---------------------------------------------------------------------------------------------------

.skip_draw_4
#_0AC292: LDX.b #$05
#_0AC294: JSR OverworldMap_CheckForCrystal
#_0AC297: BCS .skip_draw_5

#_0AC299: LDA.l $7EF3C7
#_0AC29D: ASL A
#_0AC29E: TAX

#_0AC29F: LDA.l WorldMapIcon_posx_spr5+1,X
#_0AC2A3: BMI .skip_draw_5

#_0AC2A5: STA.l $7EC10B

#_0AC2A9: LDA.l WorldMapIcon_posx_spr5+0,X
#_0AC2AD: STA.l $7EC10A

#_0AC2B1: LDA.l WorldMapIcon_posy_spr5+1,X
#_0AC2B5: STA.l $7EC109

#_0AC2B9: LDA.l WorldMapIcon_posy_spr5+0,X
#_0AC2BD: STA.l $7EC108

;---------------------------------------------------------------------------------------------------

#_0AC2C1: LDA.l WorldMapIcon_tile_spr5+1,X
#_0AC2C5: BEQ .dont_adjust_5

#_0AC2C7: CMP.b #$64
#_0AC2C9: BEQ .is_crystal_5

#_0AC2CB: LDA.b $1A
#_0AC2CD: AND.b #$10
#_0AC2CF: BNE .skip_draw_5

.is_crystal_5
#_0AC2D1: JSR WorldMapIcon_AdjustCoordinate

;---------------------------------------------------------------------------------------------------

.dont_adjust_5
#_0AC2D4: LDX.b #$09

#_0AC2D6: JSR WorldMap_CalculateOAMCoordinates
#_0AC2D9: BCC .skip_draw_5

#_0AC2DB: LDA.l $7EF3C7
#_0AC2DF: ASL A
#_0AC2E0: TAX

#_0AC2E1: LDA.l WorldMapIcon_tile_spr5+1,X
#_0AC2E5: BEQ .is_red_x_5

#_0AC2E7: STA.b $0D

#_0AC2E9: LDA.l WorldMapIcon_tile_spr5+0,X
#_0AC2ED: STA.b $0C

#_0AC2EF: LDA.b #$02
#_0AC2F1: BRA .continue_5

;---------------------------------------------------------------------------------------------------

.is_red_x_5
#_0AC2F3: LDA.b $1A
#_0AC2F5: LSR A
#_0AC2F6: LSR A
#_0AC2F7: LSR A

#_0AC2F8: AND.b #$03
#_0AC2FA: TAX

#_0AC2FB: LDA.l WorldMap_RedXChars,X
#_0AC2FF: STA.b $0D

#_0AC301: LDA.b #$32
#_0AC303: STA.b $0C

#_0AC305: LDA.b #$00

;---------------------------------------------------------------------------------------------------

.continue_5
#_0AC307: STA.b $0B

#_0AC309: LDX.b #$09
#_0AC30B: JSR WorldMap_HandleSpriteBlink

;---------------------------------------------------------------------------------------------------

.skip_draw_5
#_0AC30E: LDX.b #$06
#_0AC310: JSR OverworldMap_CheckForCrystal
#_0AC313: BCS .restore_coords_and_exit

#_0AC315: LDA.l $7EF3C7
#_0AC319: ASL A
#_0AC31A: TAX

#_0AC31B: LDA.l WorldMapIcon_posx_spr6+1,X
#_0AC31F: BMI .restore_coords_and_exit

#_0AC321: STA.l $7EC10B

#_0AC325: LDA.l WorldMapIcon_posx_spr6+0,X
#_0AC329: STA.l $7EC10A

#_0AC32D: LDA.l WorldMapIcon_posy_spr6+1,X
#_0AC331: STA.l $7EC109

#_0AC335: LDA.l WorldMapIcon_posy_spr6+0,X
#_0AC339: STA.l $7EC108

;---------------------------------------------------------------------------------------------------

#_0AC33D: LDA.l WorldMapIcon_tile_spr6+1,X
#_0AC341: BEQ .dont_adjust_6

#_0AC343: CMP.b #$64
#_0AC345: BEQ .is_crystal_2

#_0AC347: LDA.b $1A
#_0AC349: AND.b #$10
#_0AC34B: BNE .restore_coords_and_exit

.is_crystal_2
#_0AC34D: JSR WorldMapIcon_AdjustCoordinate

;---------------------------------------------------------------------------------------------------

.dont_adjust_6
#_0AC350: LDX.b #$08
#_0AC352: JSR WorldMap_CalculateOAMCoordinates
#_0AC355: BCC .restore_coords_and_exit

#_0AC357: LDA.l $7EF3C7
#_0AC35B: ASL A
#_0AC35C: TAX

#_0AC35D: LDA.l WorldMapIcon_tile_spr6+1,X
#_0AC361: BEQ .is_red_x_6

#_0AC363: STA.b $0D

#_0AC365: LDA.l WorldMapIcon_tile_spr6+0,X
#_0AC369: STA.b $0C

#_0AC36B: LDA.b #$02
#_0AC36D: BRA .continue_6

;---------------------------------------------------------------------------------------------------

.is_red_x_6
#_0AC36F: LDA.b $1A

#_0AC371: LSR A
#_0AC372: LSR A
#_0AC373: LSR A

#_0AC374: AND.b #$03
#_0AC376: TAX

#_0AC377: LDA.l WorldMap_RedXChars,X
#_0AC37B: STA.b $0D

#_0AC37D: LDA.b #$32
#_0AC37F: STA.b $0C

#_0AC381: LDA.b #$00

;---------------------------------------------------------------------------------------------------

.continue_6
#_0AC383: STA.b $0B

#_0AC385: LDX.b #$08
#_0AC387: JSR WorldMap_HandleSpriteBlink

;---------------------------------------------------------------------------------------------------

.restore_coords_and_exit
#_0AC38A: PLA
#_0AC38B: STA.l $7EC10B

#_0AC38F: PLA
#_0AC390: STA.l $7EC10A

#_0AC394: PLA
#_0AC395: STA.l $7EC109

#_0AC399: PLA
#_0AC39A: STA.l $7EC108

#_0AC39E: RTS

;===================================================================================================

WorldMap_CalculateOAMCoordinates:
#_0AC39F: LDA.w $0636
#_0AC3A2: BNE .zoomed_in

;---------------------------------------------------------------------------------------------------

.zoomed_out
#_0AC3A4: REP #$30

#_0AC3A6: LDA.l $7EC108

#_0AC3AA: LSR A
#_0AC3AB: LSR A
#_0AC3AC: LSR A
#_0AC3AD: LSR A

#_0AC3AE: EOR.w #$FFFF
#_0AC3B1: INC A

#_0AC3B2: ADC.w $063A
#_0AC3B5: SEC
#_0AC3B6: SBC.w #$00C0
#_0AC3B9: TAX

#_0AC3BA: SEP #$20

#_0AC3BC: LDA.l WorldMap_SpritePositions,X
#_0AC3C0: STA.b $0F

#_0AC3C2: SEP #$30

#_0AC3C4: XBA

#_0AC3C5: LDA.b #$0D
#_0AC3C7: JSR WorldMap_MultiplyAxB
#_0AC3CA: JSR WorldMap_ShiftNibblesRight

#_0AC3CD: STA.b $0F

;---------------------------------------------------------------------------------------------------

#_0AC3CF: REP #$30

#_0AC3D1: LDA.l $7EC10A

#_0AC3D5: LSR A
#_0AC3D6: LSR A
#_0AC3D7: LSR A
#_0AC3D8: LSR A

#_0AC3D9: SEP #$30

#_0AC3DB: SEC
#_0AC3DC: SBC.b #$80
#_0AC3DE: PHP

#_0AC3DF: BPL .x_positive_a

#_0AC3E1: EOR.b #$FF

.x_positive_a
#_0AC3E3: PHA

;---------------------------------------------------------------------------------------------------

#_0AC3E4: LDA.b $0F
#_0AC3E6: CMP.b #$E0
#_0AC3E8: BCC .in_range_a

#_0AC3EA: LDA.b #$00

.in_range_a
#_0AC3EC: XBA

#_0AC3ED: LDA.b #$54
#_0AC3EF: JSR WorldMap_MultiplyAxB

#_0AC3F2: XBA
#_0AC3F3: CLC
#_0AC3F4: ADC.b #$B2
#_0AC3F6: XBA

#_0AC3F7: PLA
#_0AC3F8: JSR WorldMap_MultiplyAxB

#_0AC3FB: XBA

#_0AC3FC: PLP
#_0AC3FD: BCS .in_range_b

#_0AC3FF: STA.b $00

#_0AC401: LDA.b #$80
#_0AC403: SEC
#_0AC404: SBC.b $00
#_0AC406: BRA .continue_a

.in_range_b
#_0AC408: CLC
#_0AC409: ADC.b #$80

;---------------------------------------------------------------------------------------------------

.continue_a
#_0AC40B: SEC
#_0AC40C: SBC.b $E0
#_0AC40E: STA.b $0E

#_0AC410: LDA.b $0E
#_0AC412: CLC
#_0AC413: ADC.b #$80
#_0AC415: STA.b $0E

#_0AC417: LDA.b $0F
#_0AC419: CLC
#_0AC41A: ADC.b #$0C
#_0AC41C: STA.b $0F

#_0AC41E: JMP.w .exit_successfully

;---------------------------------------------------------------------------------------------------

.zoomed_in
#_0AC421: REP #$30

#_0AC423: LDA.l $7EC108

#_0AC427: LSR A
#_0AC428: LSR A
#_0AC429: LSR A
#_0AC42A: LSR A

#_0AC42B: EOR.w #$FFFF
#_0AC42E: INC A

#_0AC42F: CLC
#_0AC430: ADC.w $063A

#_0AC433: SEC
#_0AC434: SBC.w #$0080
#_0AC437: CMP.w #$0100

#_0AC43A: BCC .y_in_bounds

#_0AC43C: JMP.w .exit_fail

;---------------------------------------------------------------------------------------------------

.y_in_bounds
#_0AC43F: SEP #$30

#_0AC441: XBA

#_0AC442: LDA.b #$25
#_0AC444: JSR WorldMap_MultiplyAxB
#_0AC447: JSR WorldMap_ShiftNibblesRight

#_0AC44A: REP #$10

#_0AC44C: TAX
#_0AC44D: CPX.w #$014D
#_0AC450: BCC .x_in_bounds

#_0AC452: JMP.w .exit_fail

.x_in_bounds
#_0AC455: LDA.l WorldMap_SpritePositions,X
#_0AC459: STA.b $0F

#_0AC45B: REP #$20

#_0AC45D: LDA.l $7EC10A
#_0AC461: SEC
#_0AC462: SBC.w #$07F8
#_0AC465: PHP

#_0AC466: BPL .x_positive_b

#_0AC468: EOR.w #$FFFF
#_0AC46B: INC A

.x_positive_b
#_0AC46C: PHA

;---------------------------------------------------------------------------------------------------

#_0AC46D: SEP #$20

#_0AC46F: LDA.b $0F
#_0AC471: CMP.b #$E2
#_0AC473: BCC .in_range_c

#_0AC475: LDA.b #$00

.in_range_c
#_0AC477: XBA

#_0AC478: LDA.b #$54
#_0AC47A: JSR WorldMap_MultiplyAxB

#_0AC47D: XBA
#_0AC47E: CLC
#_0AC47F: ADC.b #$B2
#_0AC481: STA.b $00

#_0AC483: XBA

#_0AC484: PLA
#_0AC485: JSR WorldMap_MultiplyAxB

#_0AC488: XBA
#_0AC489: STA.b $01

#_0AC48B: PLA
#_0AC48C: XBA

#_0AC48D: LDA.b $00
#_0AC48F: JSR WorldMap_MultiplyAxB

#_0AC492: CLC
#_0AC493: ADC.b $01

#_0AC495: XBA
#_0AC496: ADC.b #$00
#_0AC498: XBA

#_0AC499: PLP
#_0AC49A: BCS .do_addition

.do_subtraction
#_0AC49C: STA.b $00

#_0AC49E: LDA.w #$0800
#_0AC4A1: SEC
#_0AC4A2: SBC.b $00

#_0AC4A4: BRA .continue_b

.do_addition
#_0AC4A6: CLC
#_0AC4A7: ADC.w #$0800

;---------------------------------------------------------------------------------------------------

.continue_b
#_0AC4AA: SEC
#_0AC4AB: SBC.w #$0800
#_0AC4AE: BCS .positive_a

#_0AC4B0: EOR.w #$FFFF
#_0AC4B3: INC A

.positive_a
#_0AC4B4: SEP #$20

#_0AC4B6: PHP

#_0AC4B7: XBA
#_0AC4B8: PHA

#_0AC4B9: LDA.b #$2D
#_0AC4BB: JSR WorldMap_MultiplyAxB

#_0AC4BE: XBA
#_0AC4BF: STA.b $00

#_0AC4C1: PLA
#_0AC4C2: XBA

#_0AC4C3: LDA.b #$2D
#_0AC4C5: JSR WorldMap_MultiplyAxB

#_0AC4C8: CLC
#_0AC4C9: ADC.b $00

#_0AC4CB: XBA
#_0AC4CC: ADC.b #$00
#_0AC4CE: XBA

;---------------------------------------------------------------------------------------------------

#_0AC4CF: PLP
#_0AC4D0: BCS .in_range_d

#_0AC4D2: STA.b $00

#_0AC4D4: LDA.b #$80
#_0AC4D6: SEC
#_0AC4D7: SBC.b $00

#_0AC4D9: XBA
#_0AC4DA: STA.b $00

#_0AC4DC: LDA.b #$00
#_0AC4DE: SBC.b $00
#_0AC4E0: XBA

#_0AC4E1: BRA .continue_c

.in_range_d
#_0AC4E3: CLC
#_0AC4E4: ADC.b #$80

#_0AC4E6: XBA
#_0AC4E7: ADC.b #$00

#_0AC4E9: XBA

;---------------------------------------------------------------------------------------------------

.continue_c
#_0AC4EA: PHA

#_0AC4EB: SEC
#_0AC4EC: SBC.b $E0
#_0AC4EE: STA.b $0E

#_0AC4F0: PLA

;---------------------------------------------------------------------------------------------------

#_0AC4F1: REP #$30

#_0AC4F3: SEC
#_0AC4F4: SBC.w #$FF80

#_0AC4F7: SEC
#_0AC4F8: SBC.b $E0

#_0AC4FA: SEP #$30

#_0AC4FC: XBA
#_0AC4FD: BNE .exit_fail

#_0AC4FF: LDA.b $0E
#_0AC501: CLC
#_0AC502: ADC.b #$81
#_0AC504: STA.b $0E

#_0AC506: LDA.b $0F
#_0AC508: CLC
#_0AC509: ADC.b #$10
#_0AC50B: STA.b $0F

;---------------------------------------------------------------------------------------------------

.exit_successfully
#_0AC50D: SEP #$30
#_0AC50F: SEC

#_0AC510: RTS

.exit_fail
#_0AC511: SEP #$30
#_0AC513: CLC

#_0AC514: RTS

;===================================================================================================

pool WorldMap_HandleSpriteBlink

.crystal_numbers
#_0AC515: db $79 ; 2
#_0AC516: db $6E ; 5
#_0AC517: db $6F ; 6
#_0AC518: db $6D ; 4
#_0AC519: db $7C ; 7
#_0AC51A: db $6C ; 3
#_0AC51B: db $7F ; 1

pool off

;---------------------------------------------------------------------------------------------------

WorldMap_HandleSpriteBlink:
#_0AC51C: LDA.b $1A

#_0AC51E: LSR A
#_0AC51F: LSR A
#_0AC520: LSR A
#_0AC521: LSR A

#_0AC522: AND.b #$01
#_0AC524: BNE .dont_show_number

#_0AC526: LDA.b $0D
#_0AC528: CMP.b #$64
#_0AC52A: BNE .dont_show_number

;---------------------------------------------------------------------------------------------------

#_0AC52C: LDA.l .crystal_numbers-8,X
#_0AC530: STA.b $0D

#_0AC532: LDA.b #$32
#_0AC534: STA.b $0C

#_0AC536: STZ.w $0A20,X

#_0AC539: TXA
#_0AC53A: ASL A
#_0AC53B: ASL A
#_0AC53C: TAX

#_0AC53D: LDA.b $0E
#_0AC53F: STA.w $0800,X

#_0AC542: LDA.b $0F
#_0AC544: STA.w $0801,X

#_0AC547: BRA .continue

;---------------------------------------------------------------------------------------------------

.dont_show_number
#_0AC549: LDA.b $0B
#_0AC54B: STA.w $0A20,X

#_0AC54E: TXA
#_0AC54F: ASL A
#_0AC550: ASL A
#_0AC551: TAX

#_0AC552: LDA.b $0E
#_0AC554: SEC
#_0AC555: SBC.b #$04
#_0AC557: STA.w $0800,X

#_0AC55A: LDA.b $0F
#_0AC55C: SEC
#_0AC55D: SBC.b #$04
#_0AC55F: STA.w $0801,X

;---------------------------------------------------------------------------------------------------

.continue
#_0AC562: LDA.b $0D
#_0AC564: STA.w $0802,X

#_0AC567: LDA.b $0C
#_0AC569: STA.w $0803,X

#_0AC56C: RTS

;===================================================================================================

WorldMap_MultiplyAxB:
#_0AC56D: STA.w WRMPYA
#_0AC570: XBA
#_0AC571: STA.w WRMPYB

#_0AC574: NOP
#_0AC575: NOP
#_0AC576: NOP
#_0AC577: NOP

#_0AC578: LDA.w RDMPYH
#_0AC57B: XBA
#_0AC57C: LDA.w RDMPYL

#_0AC57F: RTS

;===================================================================================================

WorldMap_ShiftNibblesRight:
#_0AC580: REP #$30

#_0AC582: LSR A
#_0AC583: LSR A
#_0AC584: LSR A
#_0AC585: LSR A

#_0AC586: SEP #$30

#_0AC588: RTS

;===================================================================================================

WorldMapIcon_AdjustCoordinate:
#_0AC589: REP #$20

#_0AC58B: LDA.l $7EC10A
#_0AC58F: SEC
#_0AC590: SBC.w #$0004
#_0AC593: STA.l $7EC10A

#_0AC597: LDA.l $7EC108
#_0AC59B: SEC
#_0AC59C: SBC.w #$0004
#_0AC59F: STA.l $7EC108

#_0AC5A3: SEP #$20

#_0AC5A5: RTS

;===================================================================================================

pool OverworldMap_CheckForPendant

.bit
#_0AC5A6: db $04 ; green
#_0AC5A7: db $01 ; red
#_0AC5A8: db $02 ; blue

pool off

;---------------------------------------------------------------------------------------------------

OverworldMap_CheckForPendant:
#_0AC5A9: LDA.l $7EF3C7
#_0AC5AD: CMP.b #$03
#_0AC5AF: BNE OverworldMap_PrizeCheckFail

#_0AC5B1: LDA.l $7EF374
#_0AC5B5: AND.l .bit,X
#_0AC5B9: BEQ OverworldMap_PrizeCheckFail

#_0AC5BB: SEC

#_0AC5BC: RTS

;===================================================================================================

OverworldMap_PrizeCheckFail:
#_0AC5BD: CLC

#_0AC5BE: RTS

;===================================================================================================

pool OverworldMap_CheckForCrystal

.bit
#_0AC5BF: db $02 ; Palace of Darkness
#_0AC5C0: db $40 ; Skull Woods
#_0AC5C1: db $08 ; Turtle Rock
#_0AC5C2: db $20 ; Thieves' Town
#_0AC5C3: db $01 ; Misery Mire
#_0AC5C4: db $04 ; Ice palace
#_0AC5C5: db $10 ; Swamp Palace

pool off

;---------------------------------------------------------------------------------------------------

OverworldMap_CheckForCrystal:
#_0AC5C6: LDA.l $7EF3C7
#_0AC5CA: CMP.b #$07
#_0AC5CC: BNE OverworldMap_PrizeCheckFail

#_0AC5CE: LDA.l $7EF37A
#_0AC5D2: AND.l .bit,X
#_0AC5D6: BEQ OverworldMap_PrizeCheckFail

#_0AC5D8: SEC

#_0AC5D9: RTS

;===================================================================================================

WorldMap_SpritePositions:
#_0AC5DA: db $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0
#_0AC5E2: db $E0, $E0, $E0, $E0, $E0, $E0, $E0, $DF
#_0AC5EA: db $DE, $DD, $DC, $DB, $DA, $D8, $D7, $D6
#_0AC5F2: db $D5, $D4, $D3, $D2, $D1, $D0, $CF, $CE
#_0AC5FA: db $CD, $CC, $CB, $CA, $C9, $C7, $C6, $C5
#_0AC602: db $C4, $C3, $C2, $C1, $C0, $BF, $BE, $BD
#_0AC60A: db $BC, $BB, $BA, $B9, $B8, $B7, $B6, $B5
#_0AC612: db $B4, $B3, $B2, $B1, $B0, $AF, $AE, $AD
#_0AC61A: db $AC, $AB, $AA, $A9, $A8, $A7, $A6, $A5
#_0AC622: db $A4, $A3, $A2, $A1, $A0, $9F, $9E, $9D
#_0AC62A: db $9C, $9B, $9B, $9A, $99, $98, $97, $96
#_0AC632: db $95, $94, $93, $92, $91, $90, $8F, $8E
#_0AC63A: db $8D, $8C, $8B, $8B, $8A, $89, $88, $87
#_0AC642: db $86, $85, $84, $83, $82, $81, $81, $80
#_0AC64A: db $7F, $7E, $7D, $7C, $7B, $7A, $79, $79
#_0AC652: db $78, $77, $76, $75, $74, $73, $72, $72
#_0AC65A: db $71, $70, $6F, $6E, $6D, $6C, $6C, $6B
#_0AC662: db $6A, $69, $68, $67, $67, $66, $65, $64
#_0AC66A: db $63, $62, $62, $61, $60, $5F, $5E, $5D
#_0AC672: db $5D, $5C, $5B, $5A, $59, $59, $58, $57
#_0AC67A: db $56, $55, $55, $54, $53, $52, $51, $51
#_0AC682: db $50, $4F, $4E, $4E, $4D, $4C, $4B, $4A
#_0AC68A: db $4A, $49, $48, $47, $47, $46, $45, $44
#_0AC692: db $44, $43, $42, $41, $41, $40, $3F, $3E
#_0AC69A: db $3E, $3D, $3C, $3C, $3B, $3A, $39, $39
#_0AC6A2: db $38, $37, $36, $36, $35, $34, $34, $33
#_0AC6AA: db $32, $32, $31, $30, $2F, $2F, $2E, $2D
#_0AC6B2: db $2D, $2C, $2B, $2B, $2A, $29, $29, $28
#_0AC6BA: db $27, $27, $26, $25, $25, $24, $23, $23
#_0AC6C2: db $22, $21, $21, $20, $1F, $1F, $1E, $1D
#_0AC6CA: db $1D, $1C, $1C, $1B, $1A, $1A, $19, $18
#_0AC6D2: db $18, $17, $17, $16, $15, $15, $14, $14
#_0AC6DA: db $13, $12, $12, $11, $10, $10, $0F, $0F
#_0AC6E2: db $0E, $0E, $0D, $0C, $0C, $0B, $0B, $0A
#_0AC6EA: db $09, $09, $08, $08, $07, $07, $06, $05
#_0AC6F2: db $05, $04, $04, $03, $03, $02, $01, $01
#_0AC6FA: db $00, $00, $00, $00, $FF, $FE, $FE, $FD
#_0AC702: db $FC, $FC, $FB, $FB, $FA, $F9, $F9, $F8
#_0AC70A: db $F7, $F7, $F6, $F5, $F4, $F4, $F3, $F2
#_0AC712: db $F2, $F1, $F0, $EF, $EE, $EE, $ED, $EC
#_0AC71A: db $EB, $EA, $E9, $E8, $E8, $E7, $E6, $E5
#_0AC722: db $E4, $E3, $E2, $E1, $E0

;===================================================================================================

WorldMap_LightWorldTilemap:
#_0AC727: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 00, Strip 0
#_0AC72F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 00, Strip 1
#_0AC737: db $28, $28, $28, $28, $28, $2C, $09, $08 ; Quadrant 0, Row 00, Strip 2
#_0AC73F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 00, Strip 3
#_0AC747: db $28, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 0, Row 01, Strip 0
#_0AC74F: db $29, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 01, Strip 1
#_0AC757: db $28, $28, $28, $28, $28, $28, $2A, $28 ; Quadrant 0, Row 01, Strip 2
#_0AC75F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 01, Strip 3
#_0AC767: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 02, Strip 0
#_0AC76F: db $2C, $09, $08, $09, $28, $28, $28, $28 ; Quadrant 0, Row 02, Strip 1
#_0AC777: db $28, $28, $28, $28, $28, $08, $29, $28 ; Quadrant 0, Row 02, Strip 2
#_0AC77F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 02, Strip 3
#_0AC787: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 03, Strip 0
#_0AC78F: db $28, $2C, $2D, $2C, $09, $28, $28, $28 ; Quadrant 0, Row 03, Strip 1
#_0AC797: db $28, $28, $28, $28, $08, $28, $2C, $09 ; Quadrant 0, Row 03, Strip 2
#_0AC79F: db $08, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 0, Row 03, Strip 3
#_0AC7A7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 04, Strip 0
#_0AC7AF: db $28, $28, $2C, $28, $2B, $09, $28, $28 ; Quadrant 0, Row 04, Strip 1
#_0AC7B7: db $28, $28, $28, $08, $28, $28, $28, $2A ; Quadrant 0, Row 04, Strip 2
#_0AC7BF: db $28, $28, $28, $28, $28, $28, $08, $28 ; Quadrant 0, Row 04, Strip 3
#_0AC7C7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 05, Strip 0
#_0AC7CF: db $28, $28, $28, $28, $2B, $2A, $28, $28 ; Quadrant 0, Row 05, Strip 1
#_0AC7D7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 05, Strip 2
#_0AC7DF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 05, Strip 3
#_0AC7E7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 06, Strip 0
#_0AC7EF: db $28, $29, $28, $28, $2A, $28, $28, $28 ; Quadrant 0, Row 06, Strip 1
#_0AC7F7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 06, Strip 2
#_0AC7FF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 06, Strip 3
#_0AC807: db $28, $28, $08, $29, $28, $28, $28, $28 ; Quadrant 0, Row 07, Strip 0
#_0AC80F: db $28, $2C, $29, $28, $28, $28, $28, $28 ; Quadrant 0, Row 07, Strip 1
#_0AC817: db $28, $08, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 07, Strip 2
#_0AC81F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 07, Strip 3
#_0AC827: db $28, $08, $28, $2C, $09, $08, $28, $28 ; Quadrant 0, Row 08, Strip 0
#_0AC82F: db $28, $28, $2B, $09, $08, $29, $08, $29 ; Quadrant 0, Row 08, Strip 1
#_0AC837: db $08, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 08, Strip 2
#_0AC83F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 08, Strip 3
#_0AC847: db $08, $28, $28, $28, $2A, $28, $28, $28 ; Quadrant 0, Row 09, Strip 0
#_0AC84F: db $28, $28, $2B, $2E, $2D, $2C, $2D, $2C ; Quadrant 0, Row 09, Strip 1
#_0AC857: db $2D, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 09, Strip 2
#_0AC85F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 09, Strip 3
#_0AC867: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0A, Strip 0
#_0AC86F: db $28, $28, $2C, $2C, $2C, $28, $2C, $28 ; Quadrant 0, Row 0A, Strip 1
#_0AC877: db $2C, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0A, Strip 2
#_0AC87F: db $28, $28, $28, $28, $08, $29, $28, $2F ; Quadrant 0, Row 0A, Strip 3
#_0AC887: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0B, Strip 0
#_0AC88F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0B, Strip 1
#_0AC897: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0B, Strip 2
#_0AC89F: db $28, $08, $09, $08, $28, $2C, $09, $1B ; Quadrant 0, Row 0B, Strip 3
#_0AC8A7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0C, Strip 0
#_0AC8AF: db $28, $28, $28, $29, $28, $28, $28, $28 ; Quadrant 0, Row 0C, Strip 1
#_0AC8B7: db $28, $2F, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0C, Strip 2
#_0AC8BF: db $08, $28, $2C, $2D, $28, $28, $2B, $19 ; Quadrant 0, Row 0C, Strip 3
#_0AC8C7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0D, Strip 0
#_0AC8CF: db $28, $28, $28, $2C, $29, $28, $2F, $28 ; Quadrant 0, Row 0D, Strip 1
#_0AC8D7: db $2F, $1B, $1A, $28, $2F, $28, $2F, $08 ; Quadrant 0, Row 0D, Strip 2
#_0AC8DF: db $28, $28, $28, $2C, $28, $28, $2C, $2E ; Quadrant 0, Row 0D, Strip 3
#_0AC8E7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0E, Strip 0
#_0AC8EF: db $28, $28, $28, $28, $2C, $38, $1B, $1C ; Quadrant 0, Row 0E, Strip 1
#_0AC8F7: db $1D, $1F, $1E, $1A, $1B, $1C, $1D, $1A ; Quadrant 0, Row 0E, Strip 2
#_0AC8FF: db $28, $2F, $28, $2F, $28, $28, $28, $2B ; Quadrant 0, Row 0E, Strip 3
#_0AC907: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 0F, Strip 0
#_0AC90F: db $28, $28, $28, $28, $28, $2E, $19, $1E ; Quadrant 0, Row 0F, Strip 1
#_0AC917: db $1F, $14, $14, $1E, $1F, $1E, $1F, $1E ; Quadrant 0, Row 0F, Strip 2
#_0AC91F: db $1A, $1B, $3B, $3C, $3B, $28, $28, $28 ; Quadrant 0, Row 0F, Strip 3
#_0AC927: db $28, $28, $28, $28, $08, $29, $08, $29 ; Quadrant 0, Row 10, Strip 0
#_0AC92F: db $28, $28, $28, $28, $28, $2B, $2E, $0B ; Quadrant 0, Row 10, Strip 1
#_0AC937: db $26, $27, $14, $14, $14, $A5, $14, $26 ; Quadrant 0, Row 10, Strip 2
#_0AC93F: db $24, $25, $56, $35, $5B, $73, $74, $28 ; Quadrant 0, Row 10, Strip 3
#_0AC947: db $28, $28, $28, $08, $28, $2C, $28, $2B ; Quadrant 0, Row 11, Strip 0
#_0AC94F: db $09, $08, $29, $28, $28, $2C, $2E, $1B ; Quadrant 0, Row 11, Strip 1
#_0AC957: db $36, $37, $14, $14, $14, $14, $14, $15 ; Quadrant 0, Row 11, Strip 2
#_0AC95F: db $34, $A7, $64, $5B, $90, $73, $73, $52 ; Quadrant 0, Row 11, Strip 3
#_0AC967: db $28, $28, $28, $28, $28, $28, $28, $2C ; Quadrant 0, Row 12, Strip 0
#_0AC96F: db $2E, $2D, $2C, $09, $28, $2F, $1B, $1F ; Quadrant 0, Row 12, Strip 1
#_0AC977: db $14, $14, $14, $14, $14, $14, $14, $15 ; Quadrant 0, Row 12, Strip 2
#_0AC97F: db $A7, $34, $E4, $90, $82, $83, $83, $83 ; Quadrant 0, Row 12, Strip 3
#_0AC987: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 13, Strip 0
#_0AC98F: db $2C, $2E, $2D, $2A, $29, $2C, $19, $14 ; Quadrant 0, Row 13, Strip 1
#_0AC997: db $A5, $14, $14, $14, $A5, $14, $14, $15 ; Quadrant 0, Row 13, Strip 2
#_0AC99F: db $A7, $B6, $DF, $82, $B2, $93, $D6, $D6 ; Quadrant 0, Row 13, Strip 3
#_0AC9A7: db $09, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 14, Strip 0
#_0AC9AF: db $28, $2C, $2A, $28, $2C, $09, $1B, $14 ; Quadrant 0, Row 14, Strip 1
#_0AC9B7: db $14, $A5, $14, $14, $14, $14, $14, $15 ; Quadrant 0, Row 14, Strip 2
#_0AC9BF: db $34, $A7, $82, $B2, $D6, $93, $93, $93 ; Quadrant 0, Row 14, Strip 3
#_0AC9C7: db $2B, $09, $08, $29, $28, $28, $28, $28 ; Quadrant 0, Row 15, Strip 0
#_0AC9CF: db $28, $28, $28, $28, $28, $2B, $19, $14 ; Quadrant 0, Row 15, Strip 1
#_0AC9D7: db $14, $14, $14, $14, $A5, $14, $A5, $36 ; Quadrant 0, Row 15, Strip 2
#_0AC9DF: db $05, $34, $B0, $D6, $D6, $82, $83, $83 ; Quadrant 0, Row 15, Strip 3
#_0AC9E7: db $2C, $2A, $28, $2B, $2D, $28, $28, $28 ; Quadrant 0, Row 16, Strip 0
#_0AC9EF: db $28, $28, $28, $28, $28, $2C, $2B, $0B ; Quadrant 0, Row 16, Strip 1
#_0AC9F7: db $A5, $14, $14, $A5, $14, $A5, $14, $14 ; Quadrant 0, Row 16, Strip 2
#_0AC9FF: db $15, $33, $33, $33, $90, $B2, $D6, $93 ; Quadrant 0, Row 16, Strip 3
#_0ACA07: db $28, $28, $28, $2C, $2E, $2D, $08, $28 ; Quadrant 0, Row 17, Strip 0
#_0ACA0F: db $28, $28, $28, $28, $28, $28, $2F, $1B ; Quadrant 0, Row 17, Strip 1
#_0ACA17: db $14, $14, $A5, $A5, $14, $14, $14, $A5 ; Quadrant 0, Row 17, Strip 2
#_0ACA1F: db $15, $A6, $FB, $34, $82, $83, $83, $83 ; Quadrant 0, Row 17, Strip 3
#_0ACA27: db $28, $28, $28, $28, $2C, $2A, $28, $28 ; Quadrant 0, Row 18, Strip 0
#_0ACA2F: db $28, $28, $08, $29, $08, $29, $1B, $1F ; Quadrant 0, Row 18, Strip 1
#_0ACA37: db $26, $27, $26, $27, $26, $24, $24, $D5 ; Quadrant 0, Row 18, Strip 2
#_0ACA3F: db $25, $34, $34, $34, $B0, $93, $71, $93 ; Quadrant 0, Row 18, Strip 3
#_0ACA47: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 19, Strip 0
#_0ACA4F: db $28, $2F, $28, $2C, $28, $2C, $19, $14 ; Quadrant 0, Row 19, Strip 1
#_0ACA57: db $15, $13, $15, $13, $15, $33, $40, $41 ; Quadrant 0, Row 19, Strip 2
#_0ACA5F: db $33, $BF, $34, $34, $30, $23, $81, $23 ; Quadrant 0, Row 19, Strip 3
#_0ACA67: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 0, Row 1A, Strip 0
#_0ACA6F: db $2F, $1B, $1A, $28, $28, $2F, $1B, $14 ; Quadrant 0, Row 1A, Strip 1
#_0ACA77: db $15, $13, $15, $13, $15, $BC, $BD, $A6 ; Quadrant 0, Row 1A, Strip 2
#_0ACA7F: db $A7, $34, $41, $33, $40, $34, $C0, $34 ; Quadrant 0, Row 1A, Strip 3
#_0ACA87: db $29, $28, $28, $28, $28, $08, $2D, $28 ; Quadrant 0, Row 1B, Strip 0
#_0ACA8F: db $28, $19, $0A, $28, $2F, $1B, $1F, $14 ; Quadrant 0, Row 1B, Strip 1
#_0ACA97: db $15, $13, $15, $13, $36, $05, $D0, $D0 ; Quadrant 0, Row 1B, Strip 2
#_0ACA9F: db $D0, $D0, $D0, $D0, $D0, $D0, $C3, $D0 ; Quadrant 0, Row 1B, Strip 3
#_0ACAA7: db $2C, $09, $28, $28, $08, $28, $2B, $2D ; Quadrant 0, Row 1C, Strip 0
#_0ACAAF: db $28, $2C, $28, $2F, $1B, $1F, $14, $14 ; Quadrant 0, Row 1C, Strip 1
#_0ACAB7: db $15, $23, $25, $23, $24, $25, $C0, $A6 ; Quadrant 0, Row 1C, Strip 2
#_0ACABF: db $FB, $A7, $A6, $00, $6A, $3D, $6E, $8B ; Quadrant 0, Row 1C, Strip 3
#_0ACAC7: db $28, $2C, $09, $08, $28, $28, $2C, $2E ; Quadrant 0, Row 1D, Strip 0
#_0ACACF: db $2D, $08, $29, $1B, $1F, $A5, $14, $26 ; Quadrant 0, Row 1D, Strip 1
#_0ACAD7: db $25, $31, $B6, $E4, $FD, $FE, $C0, $10 ; Quadrant 0, Row 1D, Strip 2
#_0ACADF: db $12, $A6, $FB, $10, $12, $4D, $7E, $9B ; Quadrant 0, Row 1D, Strip 3
#_0ACAE7: db $28, $28, $2A, $29, $28, $28, $28, $2C ; Quadrant 0, Row 1E, Strip 0
#_0ACAEF: db $2A, $28, $2C, $19, $14, $14, $A5, $15 ; Quadrant 0, Row 1E, Strip 1
#_0ACAF7: db $34, $41, $33, $33, $33, $33, $C0, $10 ; Quadrant 0, Row 1E, Strip 2
#_0ACAFF: db $12, $A7, $FB, $20, $22, $CD, $A7, $3E ; Quadrant 0, Row 1E, Strip 3
#_0ACB07: db $28, $28, $28, $2C, $2D, $28, $28, $28 ; Quadrant 0, Row 1F, Strip 0
#_0ACB0F: db $28, $28, $28, $2B, $0B, $A5, $14, $15 ; Quadrant 0, Row 1F, Strip 1
#_0ACB17: db $34, $F6, $89, $6B, $6C, $89, $F6, $10 ; Quadrant 0, Row 1F, Strip 2
#_0ACB1F: db $12, $FB, $FB, $00, $02, $CD, $34, $3E ; Quadrant 0, Row 1F, Strip 3

;---------------------------------------------------------------------------------------------------

#_0ACB27: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 00, Strip 0
#_0ACB2F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 00, Strip 1
#_0ACB37: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 00, Strip 2
#_0ACB3F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 00, Strip 3
#_0ACB47: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 01, Strip 0
#_0ACB4F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 01, Strip 1
#_0ACB57: db $28, $28, $28, $28, $08, $29, $28, $28 ; Quadrant 1, Row 01, Strip 2
#_0ACB5F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 01, Strip 3
#_0ACB67: db $28, $28, $08, $28, $08, $29, $28, $28 ; Quadrant 1, Row 02, Strip 0
#_0ACB6F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 02, Strip 1
#_0ACB77: db $28, $28, $28, $08, $28, $2C, $09, $28 ; Quadrant 1, Row 02, Strip 2
#_0ACB7F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 02, Strip 3
#_0ACB87: db $09, $08, $28, $08, $28, $2C, $09, $28 ; Quadrant 1, Row 03, Strip 0
#_0ACB8F: db $28, $28, $28, $28, $28, $29, $08, $29 ; Quadrant 1, Row 03, Strip 1
#_0ACB97: db $08, $29, $08, $28, $28, $28, $2B, $09 ; Quadrant 1, Row 03, Strip 2
#_0ACB9F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 03, Strip 3
#_0ACBA7: db $2C, $2D, $28, $28, $28, $28, $2B, $09 ; Quadrant 1, Row 04, Strip 0
#_0ACBAF: db $28, $28, $08, $28, $28, $2C, $2D, $2C ; Quadrant 1, Row 04, Strip 1
#_0ACBB7: db $2D, $2C, $2D, $28, $28, $28, $2C, $2E ; Quadrant 1, Row 04, Strip 2
#_0ACBBF: db $09, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 04, Strip 3
#_0ACBC7: db $28, $2C, $28, $28, $28, $28, $2C, $2E ; Quadrant 1, Row 05, Strip 0
#_0ACBCF: db $09, $08, $28, $28, $28, $28, $2C, $28 ; Quadrant 1, Row 05, Strip 1
#_0ACBD7: db $2C, $28, $2C, $28, $28, $28, $28, $2B ; Quadrant 1, Row 05, Strip 2
#_0ACBDF: db $2A, $29, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 05, Strip 3
#_0ACBE7: db $28, $28, $28, $28, $28, $28, $28, $2B ; Quadrant 1, Row 06, Strip 0
#_0ACBEF: db $2A, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 06, Strip 1
#_0ACBF7: db $28, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 1, Row 06, Strip 2
#_0ACBFF: db $09, $2C, $09, $28, $28, $28, $28, $28 ; Quadrant 1, Row 06, Strip 3
#_0ACC07: db $28, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 1, Row 07, Strip 0
#_0ACC0F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 07, Strip 1
#_0ACC17: db $28, $28, $28, $28, $28, $28, $08, $28 ; Quadrant 1, Row 07, Strip 2
#_0ACC1F: db $2C, $28, $2B, $09, $28, $28, $28, $28 ; Quadrant 1, Row 07, Strip 3
#_0ACC27: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 08, Strip 0
#_0ACC2F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 08, Strip 1
#_0ACC37: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 08, Strip 2
#_0ACC3F: db $28, $28, $2C, $2E, $2D, $28, $28, $28 ; Quadrant 1, Row 08, Strip 3
#_0ACC47: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 09, Strip 0
#_0ACC4F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 09, Strip 1
#_0ACC57: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 09, Strip 2
#_0ACC5F: db $28, $28, $28, $2B, $2A, $2D, $28, $28 ; Quadrant 1, Row 09, Strip 3
#_0ACC67: db $28, $28, $28, $28, $28, $28, $2F, $28 ; Quadrant 1, Row 0A, Strip 0
#_0ACC6F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0A, Strip 1
#_0ACC77: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0A, Strip 2
#_0ACC7F: db $28, $28, $28, $2A, $28, $2C, $28, $28 ; Quadrant 1, Row 0A, Strip 3
#_0ACC87: db $1A, $28, $08, $29, $08, $29, $1B, $1A ; Quadrant 1, Row 0B, Strip 0
#_0ACC8F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0B, Strip 1
#_0ACC97: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0B, Strip 2
#_0ACC9F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0B, Strip 3
#_0ACCA7: db $0A, $08, $2D, $2C, $2D, $1B, $1F, $0A ; Quadrant 1, Row 0C, Strip 0
#_0ACCAF: db $28, $28, $28, $2F, $28, $28, $28, $28 ; Quadrant 1, Row 0C, Strip 1
#_0ACCB7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0C, Strip 2
#_0ACCBF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0C, Strip 3
#_0ACCC7: db $2D, $28, $2C, $28, $2C, $19, $0A, $28 ; Quadrant 1, Row 0D, Strip 0
#_0ACCCF: db $28, $28, $2F, $1B, $1A, $28, $28, $28 ; Quadrant 1, Row 0D, Strip 1
#_0ACCD7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0D, Strip 2
#_0ACCDF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0D, Strip 3
#_0ACCE7: db $2E, $28, $08, $29, $28, $2C, $2D, $28 ; Quadrant 1, Row 0E, Strip 0
#_0ACCEF: db $28, $28, $2C, $19, $0A, $28, $28, $28 ; Quadrant 1, Row 0E, Strip 1
#_0ACCF7: db $28, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 1, Row 0E, Strip 2
#_0ACCFF: db $29, $08, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0E, Strip 3
#_0ACD07: db $2C, $98, $42, $2C, $09, $28, $2C, $28 ; Quadrant 1, Row 0F, Strip 0
#_0ACD0F: db $28, $08, $29, $2C, $28, $28, $28, $28 ; Quadrant 1, Row 0F, Strip 1
#_0ACD17: db $28, $28, $28, $28, $28, $28, $08, $28 ; Quadrant 1, Row 0F, Strip 2
#_0ACD1F: db $2C, $2D, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 0F, Strip 3
#_0ACD27: db $72, $99, $63, $73, $73, $74, $2C, $72 ; Quadrant 1, Row 10, Strip 0
#_0ACD2F: db $73, $73, $73, $A1, $A0, $73, $73, $74 ; Quadrant 1, Row 10, Strip 1
#_0ACD37: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 10, Strip 2
#_0ACD3F: db $28, $2C, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 10, Strip 3
#_0ACD47: db $52, $9A, $70, $A0, $73, $91, $09, $90 ; Quadrant 1, Row 11, Strip 0
#_0ACD4F: db $73, $73, $A1, $84, $90, $73, $73, $91 ; Quadrant 1, Row 11, Strip 1
#_0ACD57: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 11, Strip 2
#_0ACD5F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 11, Strip 3
#_0ACD67: db $83, $83, $84, $82, $83, $52, $52, $83 ; Quadrant 1, Row 12, Strip 0
#_0ACD6F: db $83, $83, $84, $B3, $90, $A1, $83, $84 ; Quadrant 1, Row 12, Strip 1
#_0ACD77: db $3B, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 12, Strip 2
#_0ACD7F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 12, Strip 3
#_0ACD87: db $93, $93, $94, $92, $93, $94, $72, $93 ; Quadrant 1, Row 13, Strip 0
#_0ACD8F: db $93, $93, $B3, $A1, $82, $84, $93, $A2 ; Quadrant 1, Row 13, Strip 1
#_0ACD97: db $4A, $3B, $08, $28, $28, $28, $28, $28 ; Quadrant 1, Row 13, Strip 2
#_0ACD9F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 13, Strip 3
#_0ACDA7: db $D6, $93, $94, $92, $93, $94, $82, $93 ; Quadrant 1, Row 14, Strip 0
#_0ACDAF: db $82, $83, $83, $84, $B4, $94, $06, $54 ; Quadrant 1, Row 14, Strip 1
#_0ACDB7: db $35, $4C, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 14, Strip 2
#_0ACDBF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 14, Strip 3
#_0ACDC7: db $83, $84, $B3, $B2, $93, $94, $B4, $90 ; Quadrant 1, Row 15, Strip 0
#_0ACDCF: db $B2, $93, $93, $B3, $CA, $B7, $95, $54 ; Quadrant 1, Row 15, Strip 1
#_0ACDD7: db $48, $3B, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 15, Strip 2
#_0ACDDF: db $28, $28, $28, $28, $08, $29, $28, $28 ; Quadrant 1, Row 15, Strip 3
#_0ACDE7: db $93, $B3, $73, $A1, $83, $52, $62, $90 ; Quadrant 1, Row 16, Strip 0
#_0ACDEF: db $73, $73, $73, $91, $9F, $06, $22, $54 ; Quadrant 1, Row 16, Strip 1
#_0ACDF7: db $5C, $4A, $3B, $28, $28, $28, $28, $28 ; Quadrant 1, Row 16, Strip 2
#_0ACDFF: db $28, $28, $28, $08, $28, $2C, $09, $08 ; Quadrant 1, Row 16, Strip 3
#_0ACE07: db $83, $83, $83, $84, $93, $94, $CA, $82 ; Quadrant 1, Row 17, Strip 0
#_0ACE0F: db $83, $83, $83, $84, $A9, $16, $02, $54 ; Quadrant 1, Row 17, Strip 1
#_0ACE17: db $58, $56, $4A, $3B, $08, $28, $28, $28 ; Quadrant 1, Row 17, Strip 2
#_0ACE1F: db $28, $28, $08, $28, $28, $28, $2B, $2D ; Quadrant 1, Row 17, Strip 3
#_0ACE27: db $93, $93, $93, $A4, $93, $A4, $CA, $B4 ; Quadrant 1, Row 18, Strip 0
#_0ACE2F: db $93, $93, $93, $B7, $11, $11, $12, $54 ; Quadrant 1, Row 18, Strip 1
#_0ACE37: db $35, $58, $56, $4C, $29, $28, $28, $28 ; Quadrant 1, Row 18, Strip 2
#_0ACE3F: db $28, $28, $28, $28, $28, $28, $2C, $2E ; Quadrant 1, Row 18, Strip 3
#_0ACE47: db $24, $24, $24, $25, $00, $85, $06, $21 ; Quadrant 1, Row 19, Strip 0
#_0ACE4F: db $21, $21, $21, $21, $21, $21, $22, $54 ; Quadrant 1, Row 19, Strip 1
#_0ACE57: db $39, $3A, $39, $28, $2C, $2D, $28, $28 ; Quadrant 1, Row 19, Strip 2
#_0ACE5F: db $28, $28, $28, $28, $28, $28, $28, $2C ; Quadrant 1, Row 19, Strip 3
#_0ACE67: db $B6, $80, $80, $B6, $20, $07, $95, $A6 ; Quadrant 1, Row 1A, Strip 0
#_0ACE6F: db $A6, $F6, $A7, $44, $45, $41, $31, $54 ; Quadrant 1, Row 1A, Strip 1
#_0ACE77: db $3B, $28, $28, $28, $28, $2C, $28, $28 ; Quadrant 1, Row 1A, Strip 2
#_0ACE7F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 1A, Strip 3
#_0ACE87: db $D0, $D0, $D0, $D0, $D0, $10, $06, $77 ; Quadrant 1, Row 1B, Strip 0
#_0ACE8F: db $7B, $7B, $7B, $43, $7A, $7B, $8D, $8E ; Quadrant 1, Row 1B, Strip 1
#_0ACE97: db $4A, $3B, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 1B, Strip 2
#_0ACE9F: db $28, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 1, Row 1B, Strip 3
#_0ACEA7: db $8C, $6E, $3F, $8A, $02, $10, $12, $54 ; Quadrant 1, Row 1C, Strip 0
#_0ACEAF: db $57, $9D, $9D, $9D, $9D, $9D, $C8, $C9 ; Quadrant 1, Row 1C, Strip 1
#_0ACEB7: db $35, $4C, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 1C, Strip 2
#_0ACEBF: db $28, $28, $28, $28, $28, $28, $08, $28 ; Quadrant 1, Row 1C, Strip 3
#_0ACEC7: db $9C, $7E, $4F, $10, $12, $10, $12, $54 ; Quadrant 1, Row 1D, Strip 0
#_0ACECF: db $C7, $57, $56, $48, $35, $89, $89, $5C ; Quadrant 1, Row 1D, Strip 1
#_0ACED7: db $35, $3B, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 1D, Strip 2
#_0ACEDF: db $28, $28, $28, $28, $28, $08, $28, $28 ; Quadrant 1, Row 1D, Strip 3
#_0ACEE7: db $5E, $A7, $CE, $10, $12, $52, $52, $54 ; Quadrant 1, Row 1E, Strip 0
#_0ACEEF: db $C7, $EE, $EF, $58, $9D, $9D, $9D, $5C ; Quadrant 1, Row 1E, Strip 1
#_0ACEF7: db $48, $4A, $3B, $28, $28, $28, $28, $28 ; Quadrant 1, Row 1E, Strip 2
#_0ACEFF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 1E, Strip 3
#_0ACF07: db $5E, $34, $CE, $10, $F3, $F4, $22, $54 ; Quadrant 1, Row 1F, Strip 0
#_0ACF0F: db $C7, $89, $49, $56, $57, $9D, $56, $5C ; Quadrant 1, Row 1F, Strip 1
#_0ACF17: db $5C, $35, $4C, $28, $29, $28, $28, $28 ; Quadrant 1, Row 1F, Strip 2
#_0ACF1F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 1, Row 1F, Strip 3

;---------------------------------------------------------------------------------------------------

#_0ACF27: db $28, $28, $28, $28, $2B, $2D, $28, $28 ; Quadrant 2, Row 00, Strip 0
#_0ACF2F: db $28, $28, $28, $2C, $2A, $0B, $14, $15 ; Quadrant 2, Row 00, Strip 1
#_0ACF37: db $34, $B6, $34, $3E, $5E, $88, $88, $10 ; Quadrant 2, Row 00, Strip 2
#_0ACF3F: db $12, $FB, $A6, $10, $12, $CD, $34, $3E ; Quadrant 2, Row 00, Strip 3
#_0ACF47: db $28, $28, $28, $28, $2C, $2E, $2D, $08 ; Quadrant 2, Row 01, Strip 0
#_0ACF4F: db $09, $28, $28, $28, $2F, $2A, $0B, $15 ; Quadrant 2, Row 01, Strip 1
#_0ACF57: db $88, $88, $BC, $BD, $BC, $BD, $F6, $10 ; Quadrant 2, Row 01, Strip 2
#_0ACF5F: db $12, $BC, $BD, $10, $12, $5D, $4E, $7D ; Quadrant 2, Row 01, Strip 3
#_0ACF67: db $28, $28, $28, $28, $28, $2C, $2A, $28 ; Quadrant 2, Row 02, Strip 0
#_0ACF6F: db $2B, $09, $28, $28, $28, $2F, $1B, $25 ; Quadrant 2, Row 02, Strip 1
#_0ACF77: db $34, $A7, $34, $34, $34, $34, $A7, $20 ; Quadrant 2, Row 02, Strip 2
#_0ACF7F: db $22, $33, $33, $10, $16, $01, $01, $50 ; Quadrant 2, Row 02, Strip 3
#_0ACF87: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 03, Strip 0
#_0ACF8F: db $2C, $2A, $28, $28, $2F, $3C, $4B, $66 ; Quadrant 2, Row 03, Strip 1
#_0ACF97: db $CF, $04, $04, $CB, $04, $BB, $C0, $03 ; Quadrant 2, Row 03, Strip 2
#_0ACF9F: db $04, $04, $04, $DB, $E6, $21, $21, $60 ; Quadrant 2, Row 03, Strip 3
#_0ACFA7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 04, Strip 0
#_0ACFAF: db $28, $28, $08, $09, $08, $5A, $35, $35 ; Quadrant 2, Row 04, Strip 1
#_0ACFB7: db $69, $24, $24, $27, $26, $25, $C0, $13 ; Quadrant 2, Row 04, Strip 2
#_0ACFBF: db $26, $24, $24, $27, $15, $A7, $FB, $FB ; Quadrant 2, Row 04, Strip 3
#_0ACFC7: db $09, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 05, Strip 0
#_0ACFCF: db $28, $28, $28, $2C, $2D, $2B, $3A, $35 ; Quadrant 2, Row 05, Strip 1
#_0ACFD7: db $55, $34, $34, $13, $15, $E4, $33, $13 ; Quadrant 2, Row 05, Strip 2
#_0ACFDF: db $15, $FB, $A7, $13, $15, $A7, $FB, $FB ; Quadrant 2, Row 05, Strip 3
#_0ACFE7: db $2B, $09, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 06, Strip 0
#_0ACFEF: db $28, $28, $28, $28, $2C, $2F, $3C, $35 ; Quadrant 2, Row 06, Strip 1
#_0ACFF7: db $55, $33, $31, $23, $25, $33, $F6, $13 ; Quadrant 2, Row 06, Strip 2
#_0ACFFF: db $15, $A7, $FB, $13, $15, $A7, $A6, $34 ; Quadrant 2, Row 06, Strip 3
#_0AD007: db $2C, $2E, $09, $08, $29, $28, $28, $28 ; Quadrant 2, Row 07, Strip 0
#_0AD00F: db $28, $2C, $09, $28, $2F, $3C, $4B, $35 ; Quadrant 2, Row 07, Strip 1
#_0AD017: db $7A, $7B, $7B, $A3, $D2, $7B, $7C, $23 ; Quadrant 2, Row 07, Strip 2
#_0AD01F: db $36, $05, $03, $37, $15, $A7, $41, $33 ; Quadrant 2, Row 07, Strip 3
#_0AD027: db $28, $2C, $2A, $28, $2C, $09, $28, $28 ; Quadrant 2, Row 08, Strip 0
#_0AD02F: db $28, $28, $2C, $09, $3C, $4B, $35, $57 ; Quadrant 2, Row 08, Strip 1
#_0AD037: db $9D, $9D, $C5, $9D, $9D, $56, $55, $A6 ; Quadrant 2, Row 08, Strip 2
#_0AD03F: db $23, $25, $23, $24, $25, $34, $44, $66 ; Quadrant 2, Row 08, Strip 3
#_0AD047: db $28, $28, $28, $28, $28, $2B, $2D, $28 ; Quadrant 2, Row 09, Strip 0
#_0AD04F: db $28, $28, $28, $2C, $5A, $35, $35, $C7 ; Quadrant 2, Row 09, Strip 1
#_0AD057: db $35, $DE, $CC, $DE, $57, $5C, $47, $66 ; Quadrant 2, Row 09, Strip 2
#_0AD05F: db $45, $D0, $D0, $D0, $C3, $34, $AF, $67 ; Quadrant 2, Row 09, Strip 3
#_0AD067: db $28, $28, $28, $28, $28, $2B, $2A, $28 ; Quadrant 2, Row 0A, Strip 0
#_0AD06F: db $28, $28, $28, $28, $2C, $3A, $35, $C7 ; Quadrant 2, Row 0A, Strip 1
#_0AD077: db $57, $9D, $78, $9D, $59, $58, $56, $35 ; Quadrant 2, Row 0A, Strip 2
#_0AD07F: db $7A, $7B, $7C, $A7, $34, $B1, $AD, $B6 ; Quadrant 2, Row 0A, Strip 3
#_0AD087: db $28, $28, $28, $28, $2F, $2A, $28, $28 ; Quadrant 2, Row 0B, Strip 0
#_0AD08F: db $28, $28, $28, $28, $28, $2C, $3A, $C7 ; Quadrant 2, Row 0B, Strip 1
#_0AD097: db $C7, $86, $DC, $57, $59, $86, $58, $56 ; Quadrant 2, Row 0B, Strip 2
#_0AD09F: db $35, $35, $7A, $7B, $7B, $D3, $AC, $BF ; Quadrant 2, Row 0B, Strip 3
#_0AD0A7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 0C, Strip 0
#_0AD0AF: db $28, $28, $08, $09, $08, $29, $3C, $C7 ; Quadrant 2, Row 0C, Strip 1
#_0AD0B7: db $C7, $86, $58, $59, $86, $86, $86, $5C ; Quadrant 2, Row 0C, Strip 2
#_0AD0BF: db $57, $56, $57, $56, $57, $65, $B6, $B6 ; Quadrant 2, Row 0C, Strip 3
#_0AD0C7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 0D, Strip 0
#_0AD0CF: db $28, $28, $28, $2C, $2D, $3C, $4B, $C7 ; Quadrant 2, Row 0D, Strip 1
#_0AD0D7: db $59, $86, $86, $86, $86, $86, $86, $5C ; Quadrant 2, Row 0D, Strip 2
#_0AD0DF: db $C7, $64, $65, $54, $55, $B6, $B6, $B6 ; Quadrant 2, Row 0D, Strip 3
#_0AD0E7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 0E, Strip 0
#_0AD0EF: db $28, $28, $28, $28, $2C, $5A, $35, $C7 ; Quadrant 2, Row 0E, Strip 1
#_0AD0F7: db $86, $86, $86, $86, $86, $86, $86, $58 ; Quadrant 2, Row 0E, Strip 2
#_0AD0FF: db $C2, $7F, $6F, $C1, $65, $B6, $79, $F5 ; Quadrant 2, Row 0E, Strip 3
#_0AD107: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 0F, Strip 0
#_0AD10F: db $28, $28, $28, $08, $29, $2C, $3A, $C7 ; Quadrant 2, Row 0F, Strip 1
#_0AD117: db $66, $49, $86, $86, $86, $86, $86, $86 ; Quadrant 2, Row 0F, Strip 2
#_0AD11F: db $5C, $47, $46, $55, $B6, $B6, $B6, $B6 ; Quadrant 2, Row 0F, Strip 3
#_0AD127: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 10, Strip 0
#_0AD12F: db $08, $29, $08, $28, $2C, $09, $3C, $47 ; Quadrant 2, Row 10, Strip 1
#_0AD137: db $66, $66, $66, $66, $66, $66, $66, $66 ; Quadrant 2, Row 10, Strip 2
#_0AD13F: db $46, $35, $35, $47, $66, $66, $66, $66 ; Quadrant 2, Row 10, Strip 3
#_0AD147: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 11, Strip 0
#_0AD14F: db $28, $2C, $09, $28, $28, $2B, $5A, $39 ; Quadrant 2, Row 11, Strip 1
#_0AD157: db $3A, $39, $3A, $35, $35, $39, $3A, $48 ; Quadrant 2, Row 11, Strip 2
#_0AD15F: db $66, $66, $49, $39, $3A, $35, $35, $39 ; Quadrant 2, Row 11, Strip 3
#_0AD167: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 12, Strip 0
#_0AD16F: db $28, $28, $2C, $28, $28, $2C, $2C, $2D ; Quadrant 2, Row 12, Strip 1
#_0AD177: db $2C, $28, $2C, $3A, $39, $2F, $3C, $5C ; Quadrant 2, Row 12, Strip 2
#_0AD17F: db $39, $3A, $39, $28, $2C, $3A, $39, $28 ; Quadrant 2, Row 12, Strip 3
#_0AD187: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 13, Strip 0
#_0AD18F: db $28, $28, $28, $28, $28, $28, $28, $2C ; Quadrant 2, Row 13, Strip 1
#_0AD197: db $28, $28, $28, $2C, $28, $2C, $5A, $46 ; Quadrant 2, Row 13, Strip 2
#_0AD19F: db $3B, $2C, $2D, $28, $28, $2C, $2D, $28 ; Quadrant 2, Row 13, Strip 3
#_0AD1A7: db $28, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 2, Row 14, Strip 0
#_0AD1AF: db $29, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 14, Strip 1
#_0AD1B7: db $28, $28, $28, $28, $28, $28, $3C, $35 ; Quadrant 2, Row 14, Strip 2
#_0AD1BF: db $4A, $3B, $2C, $2D, $28, $28, $2C, $28 ; Quadrant 2, Row 14, Strip 3
#_0AD1C7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 15, Strip 0
#_0AD1CF: db $2C, $09, $08, $29, $28, $28, $28, $28 ; Quadrant 2, Row 15, Strip 1
#_0AD1D7: db $28, $28, $28, $28, $28, $08, $5A, $35 ; Quadrant 2, Row 15, Strip 2
#_0AD1DF: db $35, $4A, $3B, $3C, $3B, $08, $29, $28 ; Quadrant 2, Row 15, Strip 3
#_0AD1E7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 16, Strip 0
#_0AD1EF: db $28, $2C, $2D, $2C, $09, $28, $28, $28 ; Quadrant 2, Row 16, Strip 1
#_0AD1F7: db $28, $28, $28, $28, $08, $28, $2C, $3A ; Quadrant 2, Row 16, Strip 2
#_0AD1FF: db $39, $3A, $4A, $4B, $4C, $28, $2C, $09 ; Quadrant 2, Row 16, Strip 3
#_0AD207: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 17, Strip 0
#_0AD20F: db $28, $28, $2C, $28, $2B, $09, $08, $29 ; Quadrant 2, Row 17, Strip 1
#_0AD217: db $28, $28, $28, $08, $28, $28, $28, $2A ; Quadrant 2, Row 17, Strip 2
#_0AD21F: db $28, $2C, $3A, $39, $28, $28, $28, $08 ; Quadrant 2, Row 17, Strip 3
#_0AD227: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 18, Strip 0
#_0AD22F: db $28, $28, $28, $28, $2B, $2A, $28, $2C ; Quadrant 2, Row 18, Strip 1
#_0AD237: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 18, Strip 2
#_0AD23F: db $28, $28, $2B, $2D, $28, $28, $28, $28 ; Quadrant 2, Row 18, Strip 3
#_0AD247: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 19, Strip 0
#_0AD24F: db $28, $28, $28, $28, $2A, $28, $28, $28 ; Quadrant 2, Row 19, Strip 1
#_0AD257: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 19, Strip 2
#_0AD25F: db $28, $28, $2C, $2E, $2D, $28, $28, $28 ; Quadrant 2, Row 19, Strip 3
#_0AD267: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1A, Strip 0
#_0AD26F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1A, Strip 1
#_0AD277: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1A, Strip 2
#_0AD27F: db $28, $28, $28, $2C, $2E, $28, $28, $28 ; Quadrant 2, Row 1A, Strip 3
#_0AD287: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1B, Strip 0
#_0AD28F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1B, Strip 1
#_0AD297: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1B, Strip 2
#_0AD29F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1B, Strip 3
#_0AD2A7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1C, Strip 0
#_0AD2AF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1C, Strip 1
#_0AD2B7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1C, Strip 2
#_0AD2BF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1C, Strip 3
#_0AD2C7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1D, Strip 0
#_0AD2CF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1D, Strip 1
#_0AD2D7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1D, Strip 2
#_0AD2DF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1D, Strip 3
#_0AD2E7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1E, Strip 0
#_0AD2EF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1E, Strip 1
#_0AD2F7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1E, Strip 2
#_0AD2FF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1E, Strip 3
#_0AD307: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1F, Strip 0
#_0AD30F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1F, Strip 1
#_0AD317: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1F, Strip 2
#_0AD31F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 2, Row 1F, Strip 3

;---------------------------------------------------------------------------------------------------

#_0AD327: db $5E, $34, $CE, $10, $12, $FC, $FC, $5C ; Quadrant 3, Row 00, Strip 0
#_0AD32F: db $C7, $9D, $59, $58, $59, $89, $58, $5C ; Quadrant 3, Row 00, Strip 1
#_0AD337: db $58, $39, $28, $28, $2C, $2D, $28, $28 ; Quadrant 3, Row 00, Strip 2
#_0AD33F: db $08, $29, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 00, Strip 3
#_0AD347: db $6D, $4E, $5F, $20, $22, $FC, $FC, $5C ; Quadrant 3, Row 01, Strip 0
#_0AD34F: db $C7, $67, $56, $89, $57, $67, $67, $5C ; Quadrant 3, Row 01, Strip 1
#_0AD357: db $39, $28, $28, $28, $28, $2B, $2D, $08 ; Quadrant 3, Row 01, Strip 2
#_0AD35F: db $28, $2C, $2D, $28, $28, $28, $28, $28 ; Quadrant 3, Row 01, Strip 3
#_0AD367: db $51, $01, $01, $01, $02, $FC, $FC, $5C ; Quadrant 3, Row 02, Strip 0
#_0AD36F: db $55, $9E, $64, $67, $65, $FB, $A7, $54 ; Quadrant 3, Row 02, Strip 1
#_0AD377: db $3B, $28, $28, $08, $28, $28, $2C, $28 ; Quadrant 3, Row 02, Strip 2
#_0AD37F: db $28, $28, $2C, $28, $28, $28, $28, $28 ; Quadrant 3, Row 02, Strip 3
#_0AD387: db $61, $21, $21, $07, $12, $FC, $FC, $5C ; Quadrant 3, Row 03, Strip 0
#_0AD38F: db $55, $77, $7B, $7B, $7B, $7B, $7C, $54 ; Quadrant 3, Row 03, Strip 1
#_0AD397: db $4A, $3B, $08, $28, $28, $28, $28, $28 ; Quadrant 3, Row 03, Strip 2
#_0AD39F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 03, Strip 3
#_0AD3A7: db $FB, $A7, $C0, $10, $12, $FC, $FC, $5C ; Quadrant 3, Row 04, Strip 0
#_0AD3AF: db $55, $64, $67, $56, $57, $67, $65, $54 ; Quadrant 3, Row 04, Strip 1
#_0AD3B7: db $48, $4C, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 04, Strip 2
#_0AD3BF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 04, Strip 3
#_0AD3C7: db $FB, $B6, $C0, $10, $12, $34, $34, $64 ; Quadrant 3, Row 05, Strip 0
#_0AD3CF: db $65, $A6, $A6, $54, $55, $31, $44, $46 ; Quadrant 3, Row 05, Strip 1
#_0AD3D7: db $58, $3B, $28, $2F, $28, $28, $28, $28 ; Quadrant 3, Row 05, Strip 2
#_0AD3DF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 05, Strip 3
#_0AD3E7: db $B6, $F6, $C0, $10, $16, $50, $51, $01 ; Quadrant 3, Row 06, Strip 0
#_0AD3EF: db $01, $01, $01, $68, $55, $41, $64, $56 ; Quadrant 3, Row 06, Strip 1
#_0AD3F7: db $48, $4A, $3B, $3C, $3B, $28, $28, $28 ; Quadrant 3, Row 06, Strip 2
#_0AD3FF: db $2F, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 06, Strip 3
#_0AD407: db $33, $33, $C3, $20, $21, $60, $61, $AB ; Quadrant 3, Row 07, Strip 0
#_0AD40F: db $97, $97, $BE, $68, $7A, $7B, $7B, $43 ; Quadrant 3, Row 07, Strip 1
#_0AD417: db $5C, $35, $4A, $4B, $4A, $3B, $08, $29 ; Quadrant 3, Row 07, Strip 2
#_0AD41F: db $3C, $3B, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 07, Strip 3
#_0AD427: db $66, $45, $44, $66, $45, $34, $34, $64 ; Quadrant 3, Row 08, Strip 0
#_0AD42F: db $AE, $AE, $A9, $68, $57, $C6, $67, $56 ; Quadrant 3, Row 08, Strip 1
#_0AD437: db $58, $56, $35, $35, $35, $4C, $2F, $3C ; Quadrant 3, Row 08, Strip 2
#_0AD43F: db $4B, $4C, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 08, Strip 3
#_0AD447: db $67, $65, $64, $56, $75, $76, $96, $01 ; Quadrant 3, Row 09, Strip 0
#_0AD44F: db $17, $11, $11, $B8, $53, $01, $02, $54 ; Quadrant 3, Row 09, Strip 1
#_0AD457: db $35, $58, $39, $3A, $39, $28, $28, $5A ; Quadrant 3, Row 09, Strip 2
#_0AD45F: db $39, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 09, Strip 3
#_0AD467: db $B6, $B6, $B6, $54, $55, $10, $06, $07 ; Quadrant 3, Row 0A, Strip 0
#_0AD46F: db $87, $97, $BE, $8F, $9F, $06, $12, $54 ; Quadrant 3, Row 0A, Strip 1
#_0AD477: db $35, $39, $28, $2C, $2D, $28, $28, $2C ; Quadrant 3, Row 0A, Strip 2
#_0AD47F: db $2D, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 3, Row 0A, Strip 3
#_0AD487: db $BF, $B6, $B6, $54, $55, $10, $16, $17 ; Quadrant 3, Row 0B, Strip 0
#_0AD48F: db $B9, $C6, $BA, $8F, $9F, $12, $12, $54 ; Quadrant 3, Row 0B, Strip 1
#_0AD497: db $35, $3B, $08, $28, $2C, $28, $28, $28 ; Quadrant 3, Row 0B, Strip 2
#_0AD49F: db $2C, $28, $28, $28, $28, $28, $08, $28 ; Quadrant 3, Row 0B, Strip 3
#_0AD4A7: db $B6, $B6, $B6, $54, $47, $AA, $11, $11 ; Quadrant 3, Row 0C, Strip 0
#_0AD4AF: db $16, $96, $17, $8F, $9F, $12, $22, $54 ; Quadrant 3, Row 0C, Strip 1
#_0AD4B7: db $35, $4C, $2D, $28, $28, $28, $28, $28 ; Quadrant 3, Row 0C, Strip 2
#_0AD4BF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 0C, Strip 3
#_0AD4C7: db $B6, $30, $33, $54, $57, $F2, $11, $11 ; Quadrant 3, Row 0D, Strip 0
#_0AD4CF: db $11, $11, $11, $A8, $A9, $95, $02, $54 ; Quadrant 3, Row 0D, Strip 1
#_0AD4D7: db $39, $28, $2C, $2D, $28, $28, $08, $29 ; Quadrant 3, Row 0D, Strip 2
#_0AD4DF: db $08, $29, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 0D, Strip 3
#_0AD4E7: db $B6, $32, $34, $64, $65, $10, $11, $11 ; Quadrant 3, Row 0E, Strip 0
#_0AD4EF: db $06, $21, $07, $11, $11, $06, $22, $54 ; Quadrant 3, Row 0E, Strip 1
#_0AD4F7: db $3B, $28, $28, $2C, $28, $28, $28, $2C ; Quadrant 3, Row 0E, Strip 2
#_0AD4FF: db $28, $2C, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 0E, Strip 3
#_0AD507: db $30, $40, $34, $B6, $34, $20, $21, $21 ; Quadrant 3, Row 0F, Strip 0
#_0AD50F: db $22, $34, $B6, $34, $34, $34, $B6, $54 ; Quadrant 3, Row 0F, Strip 1
#_0AD517: db $39, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 0F, Strip 2
#_0AD51F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 0F, Strip 3
#_0AD527: db $66, $66, $66, $66, $66, $66, $66, $66 ; Quadrant 3, Row 10, Strip 0
#_0AD52F: db $66, $66, $66, $66, $66, $66, $66, $46 ; Quadrant 3, Row 10, Strip 1
#_0AD537: db $3B, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 10, Strip 2
#_0AD53F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 10, Strip 3
#_0AD547: db $3A, $48, $66, $66, $66, $49, $48, $49 ; Quadrant 3, Row 11, Strip 0
#_0AD54F: db $39, $3A, $35, $35, $39, $3A, $35, $35 ; Quadrant 3, Row 11, Strip 1
#_0AD557: db $39, $2D, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 11, Strip 2
#_0AD55F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 11, Strip 3
#_0AD567: db $2C, $3A, $39, $3A, $35, $47, $46, $39 ; Quadrant 3, Row 12, Strip 0
#_0AD56F: db $28, $2C, $3A, $39, $28, $2C, $3A, $39 ; Quadrant 3, Row 12, Strip 1
#_0AD577: db $28, $2C, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 12, Strip 2
#_0AD57F: db $28, $28, $28, $28, $28, $08, $29, $08 ; Quadrant 3, Row 12, Strip 3
#_0AD587: db $28, $2C, $2D, $2C, $3A, $35, $39, $28 ; Quadrant 3, Row 13, Strip 0
#_0AD58F: db $28, $28, $2C, $08, $29, $28, $2C, $28 ; Quadrant 3, Row 13, Strip 1
#_0AD597: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 13, Strip 2
#_0AD59F: db $28, $28, $28, $28, $08, $28, $2C, $2D ; Quadrant 3, Row 13, Strip 3
#_0AD5A7: db $28, $28, $2C, $28, $2C, $39, $28, $28 ; Quadrant 3, Row 14, Strip 0
#_0AD5AF: db $28, $28, $28, $28, $2B, $09, $08, $29 ; Quadrant 3, Row 14, Strip 1
#_0AD5B7: db $28, $28, $28, $28, $08, $29, $28, $28 ; Quadrant 3, Row 14, Strip 2
#_0AD5BF: db $28, $28, $28, $28, $28, $28, $28, $2C ; Quadrant 3, Row 14, Strip 3
#_0AD5C7: db $28, $28, $28, $28, $08, $29, $28, $28 ; Quadrant 3, Row 15, Strip 0
#_0AD5CF: db $28, $28, $28, $28, $2C, $2A, $28, $2C ; Quadrant 3, Row 15, Strip 1
#_0AD5D7: db $09, $28, $28, $08, $28, $2C, $09, $28 ; Quadrant 3, Row 15, Strip 2
#_0AD5DF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 15, Strip 3
#_0AD5E7: db $28, $28, $28, $08, $28, $2C, $2D, $28 ; Quadrant 3, Row 16, Strip 0
#_0AD5EF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 16, Strip 1
#_0AD5F7: db $08, $29, $08, $28, $28, $28, $2B, $09 ; Quadrant 3, Row 16, Strip 2
#_0AD5FF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 16, Strip 3
#_0AD607: db $29, $28, $08, $28, $28, $28, $2C, $28 ; Quadrant 3, Row 17, Strip 0
#_0AD60F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 17, Strip 1
#_0AD617: db $28, $2C, $2D, $28, $28, $28, $2C, $2E ; Quadrant 3, Row 17, Strip 2
#_0AD61F: db $09, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 17, Strip 3
#_0AD627: db $2C, $2D, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 18, Strip 0
#_0AD62F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 18, Strip 1
#_0AD637: db $28, $28, $2C, $28, $28, $28, $28, $2B ; Quadrant 3, Row 18, Strip 2
#_0AD63F: db $2A, $29, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 18, Strip 3
#_0AD647: db $28, $2C, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 19, Strip 0
#_0AD64F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 19, Strip 1
#_0AD657: db $28, $28, $28, $28, $28, $28, $28, $08 ; Quadrant 3, Row 19, Strip 2
#_0AD65F: db $09, $2C, $09, $28, $28, $28, $28, $28 ; Quadrant 3, Row 19, Strip 3
#_0AD667: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1A, Strip 0
#_0AD66F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1A, Strip 1
#_0AD677: db $28, $28, $28, $28, $28, $28, $08, $28 ; Quadrant 3, Row 1A, Strip 2
#_0AD67F: db $28, $28, $2B, $09, $28, $28, $28, $28 ; Quadrant 3, Row 1A, Strip 3
#_0AD687: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1B, Strip 0
#_0AD68F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1B, Strip 1
#_0AD697: db $28, $28, $28, $28, $28, $08, $28, $28 ; Quadrant 3, Row 1B, Strip 2
#_0AD69F: db $28, $28, $2C, $2E, $2D, $28, $28, $28 ; Quadrant 3, Row 1B, Strip 3
#_0AD6A7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1C, Strip 0
#_0AD6AF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1C, Strip 1
#_0AD6B7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1C, Strip 2
#_0AD6BF: db $28, $28, $28, $2B, $2A, $28, $28, $28 ; Quadrant 3, Row 1C, Strip 3
#_0AD6C7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1D, Strip 0
#_0AD6CF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1D, Strip 1
#_0AD6D7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1D, Strip 2
#_0AD6DF: db $28, $28, $28, $2A, $28, $28, $28, $28 ; Quadrant 3, Row 1D, Strip 3
#_0AD6E7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1E, Strip 0
#_0AD6EF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1E, Strip 1
#_0AD6F7: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1E, Strip 2
#_0AD6FF: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1E, Strip 3
#_0AD707: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1F, Strip 0
#_0AD70F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1F, Strip 1
#_0AD717: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1F, Strip 2
#_0AD71F: db $28, $28, $28, $28, $28, $28, $28, $28 ; Quadrant 3, Row 1F, Strip 3

;===================================================================================================

WorldMap_DarkWorldTilemap:
#_0AD727: db $26, $27, $14, $14, $14, $A5, $14, $26 ; Row 00, Strip 0
#_0AD72F: db $24, $25, $56, $35, $5B, $73, $74, $28 ; Row 00, Strip 1
#_0AD737: db $72, $99, $63, $73, $73, $74, $2C, $72 ; Row 00, Strip 2
#_0AD73F: db $73, $73, $73, $A1, $A0, $73, $73, $74 ; Row 00, Strip 3
#_0AD747: db $36, $37, $14, $14, $14, $14, $14, $15 ; Row 01, Strip 0
#_0AD74F: db $34, $A7, $64, $5B, $90, $73, $73, $73 ; Row 01, Strip 1
#_0AD757: db $73, $9A, $70, $A0, $73, $91, $09, $90 ; Row 01, Strip 2
#_0AD75F: db $73, $73, $A1, $84, $90, $73, $FF, $91 ; Row 01, Strip 3
#_0AD767: db $14, $14, $14, $14, $14, $14, $14, $15 ; Row 02, Strip 0
#_0AD76F: db $A7, $34, $E4, $90, $82, $83, $83, $83 ; Row 02, Strip 1
#_0AD777: db $83, $83, $84, $82, $83, $83, $83, $83 ; Row 02, Strip 2
#_0AD77F: db $83, $83, $84, $B3, $82, $83, $83, $84 ; Row 02, Strip 3
#_0AD787: db $A5, $14, $14, $14, $A5, $14, $14, $15 ; Row 03, Strip 0
#_0AD78F: db $A7, $B6, $DF, $82, $B2, $93, $93, $93 ; Row 03, Strip 1
#_0AD797: db $93, $93, $94, $92, $93, $94, $72, $93 ; Row 03, Strip 2
#_0AD79F: db $93, $93, $B3, $91, $B4, $93, $93, $A2 ; Row 03, Strip 3
#_0AD7A7: db $14, $A5, $14, $14, $14, $14, $14, $15 ; Row 04, Strip 0
#_0AD7AF: db $34, $A7, $82, $B2, $93, $93, $93, $93 ; Row 04, Strip 1
#_0AD7B7: db $93, $93, $94, $92, $93, $94, $82, $93 ; Row 04, Strip 2
#_0AD7BF: db $82, $83, $83, $84, $CA, $CA, $CA, $8F ; Row 04, Strip 3
#_0AD7C7: db $14, $14, $14, $14, $A5, $14, $A5, $36 ; Row 05, Strip 0
#_0AD7CF: db $05, $34, $B0, $D6, $93, $82, $83, $83 ; Row 05, Strip 1
#_0AD7D7: db $83, $84, $B3, $B2, $93, $B3, $B4, $90 ; Row 05, Strip 2
#_0AD7DF: db $B2, $93, $93, $B3, $BE, $11, $95, $54 ; Row 05, Strip 3
#_0AD7E7: db $A5, $14, $14, $A5, $14, $A5, $14, $14 ; Row 06, Strip 0
#_0AD7EF: db $15, $33, $33, $33, $90, $B2, $93, $93 ; Row 06, Strip 1
#_0AD7F7: db $93, $B3, $73, $A1, $83, $84, $11, $90 ; Row 06, Strip 2
#_0AD7FF: db $73, $73, $73, $91, $9F, $06, $22, $54 ; Row 06, Strip 3
#_0AD807: db $14, $14, $A5, $A5, $14, $14, $14, $A5 ; Row 07, Strip 0
#_0AD80F: db $15, $A6, $FB, $34, $82, $83, $83, $83 ; Row 07, Strip 1
#_0AD817: db $83, $83, $83, $84, $93, $94, $CA, $82 ; Row 07, Strip 2
#_0AD81F: db $83, $83, $83, $84, $A9, $16, $02, $54 ; Row 07, Strip 3
#_0AD827: db $26, $27, $26, $27, $26, $24, $24, $D5 ; Row 08, Strip 0
#_0AD82F: db $25, $34, $34, $34, $B0, $93, $D6, $93 ; Row 08, Strip 1
#_0AD837: db $93, $93, $93, $A4, $93, $A4, $CA, $B4 ; Row 08, Strip 2
#_0AD83F: db $93, $93, $93, $B7, $11, $11, $12, $54 ; Row 08, Strip 3
#_0AD847: db $15, $13, $15, $13, $15, $33, $40, $41 ; Row 09, Strip 0
#_0AD84F: db $33, $BF, $34, $34, $30, $FB, $C0, $23 ; Row 09, Strip 1
#_0AD857: db $24, $24, $24, $25, $00, $17, $06, $21 ; Row 09, Strip 2
#_0AD85F: db $21, $21, $21, $21, $21, $21, $22, $54 ; Row 09, Strip 3
#_0AD867: db $15, $13, $15, $13, $15, $BC, $BD, $A6 ; Row 0A, Strip 0
#_0AD86F: db $A7, $34, $41, $33, $40, $34, $C0, $34 ; Row 0A, Strip 1
#_0AD877: db $B6, $80, $80, $B6, $20, $07, $95, $A6 ; Row 0A, Strip 2
#_0AD87F: db $A6, $F6, $A7, $44, $45, $34, $41, $54 ; Row 0A, Strip 3
#_0AD887: db $15, $13, $15, $13, $36, $05, $D0, $D0 ; Row 0B, Strip 0
#_0AD88F: db $D0, $D0, $D0, $D0, $D0, $D0, $C3, $D0 ; Row 0B, Strip 1
#_0AD897: db $D0, $D0, $D0, $D0, $D0, $10, $06, $77 ; Row 0B, Strip 2
#_0AD89F: db $7B, $7B, $7B, $43, $7A, $7B, $8D, $8E ; Row 0B, Strip 3
#_0AD8A7: db $15, $23, $25, $23, $24, $25, $C0, $A6 ; Row 0C, Strip 0
#_0AD8AF: db $FB, $A7, $A6, $00, $EA, $E8, $E8, $E8 ; Row 0C, Strip 1
#_0AD8B7: db $E9, $E9, $E9, $EB, $02, $10, $12, $54 ; Row 0C, Strip 2
#_0AD8BF: db $57, $9D, $9D, $9D, $9D, $9D, $C8, $C9 ; Row 0C, Strip 3
#_0AD8C7: db $25, $31, $B6, $34, $6E, $6E, $C0, $10 ; Row 0D, Strip 0
#_0AD8CF: db $12, $A7, $A6, $10, $C4, $D9, $D9, $D7 ; Row 0D, Strip 1
#_0AD8D7: db $E7, $DA, $DA, $D4, $12, $10, $12, $54 ; Row 0D, Strip 2
#_0AD8DF: db $C7, $E2, $E2, $E2, $E2, $F1, $89, $54 ; Row 0D, Strip 3
#_0AD8E7: db $34, $41, $33, $33, $33, $33, $C0, $10 ; Row 0E, Strip 0
#_0AD8EF: db $12, $A6, $F6, $10, $C4, $D9, $D7, $D8 ; Row 0E, Strip 1
#_0AD8F7: db $EC, $E7, $DA, $D4, $12, $10, $12, $54 ; Row 0E, Strip 2
#_0AD8FF: db $C7, $E2, $E2, $E2, $E2, $E1, $F1, $54 ; Row 0E, Strip 3
#_0AD907: db $34, $F6, $89, $6B, $6C, $89, $F6, $10 ; Row 0F, Strip 0
#_0AD90F: db $12, $FB, $FB, $10, $C4, $D7, $EC, $D8 ; Row 0F, Strip 1
#_0AD917: db $D8, $D8, $E7, $D4, $F3, $F4, $22, $54 ; Row 0F, Strip 2
#_0AD91F: db $C7, $E2, $E1, $E1, $E2, $E1, $F1, $54 ; Row 0F, Strip 3
#_0AD927: db $34, $B6, $34, $3E, $5E, $88, $88, $10 ; Row 10, Strip 0
#_0AD92F: db $12, $A6, $A6, $10, $D1, $D8, $D8, $EC ; Row 10, Strip 1
#_0AD937: db $EC, $D8, $D8, $E5, $12, $FC, $FC, $5C ; Row 10, Strip 2
#_0AD93F: db $C7, $E0, $6D, $7D, $E0, $E1, $F1, $54 ; Row 10, Strip 3
#_0AD947: db $88, $88, $E3, $BD, $E3, $BD, $F6, $10 ; Row 11, Strip 0
#_0AD94F: db $12, $E3, $BD, $10, $12, $34, $A7, $89 ; Row 11, Strip 1
#_0AD957: db $89, $A7, $34, $20, $22, $FC, $FC, $5C ; Row 11, Strip 2
#_0AD95F: db $C7, $E2, $E1, $E2, $E2, $F1, $89, $54 ; Row 11, Strip 3
#_0AD967: db $34, $A7, $34, $34, $34, $34, $A7, $20 ; Row 12, Strip 0
#_0AD96F: db $22, $33, $33, $10, $16, $01, $01, $01 ; Row 12, Strip 1
#_0AD977: db $01, $01, $01, $01, $02, $FC, $FC, $5C ; Row 12, Strip 2
#_0AD97F: db $55, $F0, $89, $F0, $F0, $FB, $A7, $54 ; Row 12, Strip 3
#_0AD987: db $CF, $04, $04, $CB, $04, $BB, $C0, $03 ; Row 13, Strip 0
#_0AD98F: db $04, $04, $04, $DB, $E6, $21, $21, $21 ; Row 13, Strip 1
#_0AD997: db $21, $21, $21, $07, $12, $FC, $FC, $5C ; Row 13, Strip 2
#_0AD99F: db $55, $77, $7B, $7B, $7B, $7B, $7C, $54 ; Row 13, Strip 3
#_0AD9A7: db $69, $24, $24, $27, $26, $25, $C0, $13 ; Row 14, Strip 0
#_0AD9AF: db $26, $24, $24, $27, $15, $A7, $FB, $FB ; Row 14, Strip 1
#_0AD9B7: db $FB, $A7, $C0, $10, $12, $FC, $FC, $5C ; Row 14, Strip 2
#_0AD9BF: db $55, $64, $67, $56, $57, $67, $65, $54 ; Row 14, Strip 3
#_0AD9C7: db $55, $34, $34, $13, $15, $33, $33, $13 ; Row 15, Strip 0
#_0AD9CF: db $15, $FB, $A7, $13, $15, $A7, $FB, $FB ; Row 15, Strip 1
#_0AD9D7: db $FB, $B6, $C0, $10, $12, $34, $34, $64 ; Row 15, Strip 2
#_0AD9DF: db $65, $A6, $A6, $54, $55, $31, $44, $46 ; Row 15, Strip 3
#_0AD9E7: db $55, $33, $31, $23, $25, $33, $F6, $13 ; Row 16, Strip 0
#_0AD9EF: db $15, $A7, $FB, $13, $15, $A7, $A6, $34 ; Row 16, Strip 1
#_0AD9F7: db $B6, $F6, $C0, $10, $16, $02, $00, $96 ; Row 16, Strip 2
#_0AD9FF: db $01, $01, $01, $68, $55, $41, $64, $56 ; Row 16, Strip 3
#_0ADA07: db $7A, $7B, $7B, $7B, $7B, $7B, $7C, $23 ; Row 17, Strip 0
#_0ADA0F: db $36, $05, $03, $37, $15, $A7, $41, $33 ; Row 17, Strip 1
#_0ADA17: db $33, $33, $C3, $20, $21, $22, $20, $AB ; Row 17, Strip 2
#_0ADA1F: db $97, $97, $BE, $68, $7A, $7B, $7B, $43 ; Row 17, Strip 3
#_0ADA27: db $9D, $9D, $9D, $9D, $9D, $56, $55, $A6 ; Row 18, Strip 0
#_0ADA2F: db $23, $25, $23, $24, $25, $34, $44, $66 ; Row 18, Strip 1
#_0ADA37: db $66, $45, $44, $66, $45, $34, $34, $64 ; Row 18, Strip 2
#_0ADA3F: db $AE, $AE, $A9, $68, $57, $C6, $67, $56 ; Row 18, Strip 3
#_0ADA47: db $9F, $DD, $DD, $DD, $11, $8F, $47, $66 ; Row 19, Strip 0
#_0ADA4F: db $45, $D0, $D0, $D0, $C3, $34, $AF, $67 ; Row 19, Strip 1
#_0ADA57: db $67, $65, $64, $56, $75, $76, $01, $01 ; Row 19, Strip 2
#_0ADA5F: db $17, $11, $11, $B8, $53, $96, $02, $54 ; Row 19, Strip 3
#_0ADA67: db $9F, $11, $11, $11, $11, $A8, $56, $35 ; Row 1A, Strip 0
#_0ADA6F: db $55, $77, $7C, $A7, $34, $B1, $AD, $B6 ; Row 1A, Strip 1
#_0ADA77: db $B6, $B6, $B6, $54, $55, $10, $11, $11 ; Row 1A, Strip 2
#_0ADA7F: db $11, $11, $11, $8F, $9F, $06, $12, $54 ; Row 1A, Strip 3
#_0ADA87: db $9F, $ED, $ED, $11, $ED, $11, $A8, $56 ; Row 1B, Strip 0
#_0ADA8F: db $7A, $43, $7A, $7B, $7B, $D3, $AC, $BF ; Row 1B, Strip 1
#_0ADA97: db $BF, $B6, $B6, $54, $55, $10, $11, $11 ; Row 1B, Strip 2
#_0ADA9F: db $F7, $F8, $11, $8F, $9F, $12, $22, $54 ; Row 1B, Strip 3
#_0ADAA7: db $9F, $ED, $11, $11, $11, $ED, $11, $54 ; Row 1C, Strip 0
#_0ADAAF: db $57, $56, $57, $56, $57, $65, $B6, $B6 ; Row 1C, Strip 1
#_0ADAB7: db $B6, $B6, $B6, $54, $47, $AA, $11, $11 ; Row 1C, Strip 2
#_0ADABF: db $F9, $FA, $11, $8F, $9F, $12, $34, $54 ; Row 1C, Strip 3
#_0ADAC7: db $A9, $11, $11, $ED, $11, $11, $11, $54 ; Row 1D, Strip 0
#_0ADACF: db $55, $64, $65, $54, $55, $B6, $B6, $B6 ; Row 1D, Strip 1
#_0ADAD7: db $B6, $30, $33, $54, $57, $F2, $11, $11 ; Row 1D, Strip 2
#_0ADADF: db $11, $11, $11, $A8, $A9, $95, $02, $54 ; Row 1D, Strip 3
#_0ADAE7: db $11, $11, $ED, $11, $11, $ED, $11, $54 ; Row 1E, Strip 0
#_0ADAEF: db $7A, $7F, $6F, $C1, $65, $B6, $79, $F5 ; Row 1E, Strip 1
#_0ADAF7: db $B6, $32, $34, $64, $65, $20, $07, $11 ; Row 1E, Strip 2
#_0ADAFF: db $11, $11, $11, $11, $06, $21, $22, $54 ; Row 1E, Strip 3
#_0ADB07: db $21, $07, $11, $ED, $11, $ED, $06, $54 ; Row 1F, Strip 0
#_0ADB0F: db $35, $47, $46, $55, $B6, $B6, $B6, $B6 ; Row 1F, Strip 1
#_0ADB17: db $30, $40, $34, $B6, $34, $34, $10, $11 ; Row 1F, Strip 2
#_0ADB1F: db $11, $11, $06, $21, $22, $34, $B6, $54 ; Row 1F, Strip 3

;===================================================================================================

Palettes_OWMAP:

Palettes_LWMAP:
#_0ADB27: dw  $0000,  $094B,  $1563,  $1203,  $2995,  $5BDF,  $2191,  $2E37
#_0ADB37: dw  $7C1F,  $6F37,  $7359,  $777A,  $7B9B,  $7FBD,  $0000,  $0000
#_0ADB47: dw  $0000,  $0100,  $0000,  $0000,  $7B9B,  $11B6,  $1A9B,  $5FFF
#_0ADB57: dw  $2995,  $6E94,  $76D6,  $7F39,  $7F7B,  $7FBD,  $0000,  $0000
#_0ADB67: dw  $0000,  $0100,  $1D74,  $67F9,  $1EE9,  $338E,  $6144,  $7E6A
#_0ADB77: dw  $0A44,  $7C1F,  $6144,  $22EB,  $3DCA,  $5ED2,  $7FDA,  $316A
#_0ADB87: dw  $0000,  $0100,  $14CC,  $1910,  $2995,  $3E3A,  $1963,  $15E3
#_0ADB97: dw  $25F5,  $2E37,  $15E3,  $22EB,  $6144,  $7E33,  $5D99,  $771D
#_0ADBA7: dw  $0000,  $0CEC,  $22EB,  $2FB1,  $1D70,  $2E37,  $25F5,  $3E77
#_0ADBB7: dw  $473A,  $6144,  $7E6A,  $15E3,  $2E0B,  $5354,  $7FFF,  $16A6
#_0ADBC7: dw  $0000,  $0100,  $15C5,  $16A6,  $1EE9,  $2F4D,  $25F5,  $3E77
#_0ADBD7: dw  $473A,  $5354,  $15E3,  $22EB,  $2918,  $4A1F,  $3F7F,  $7C1F
#_0ADBE7: dw  $0000,  $0100,  $1563,  $1203,  $1EE9,  $2FB0,  $1D70,  $2E37
#_0ADBF7: dw  $473A,  $6144,  $15E3,  $22EB,  $1D70,  $2E37,  $4F3F,  $7FBD
#_0ADC07: dw  $0000,  $0000,  $0000,  $0000,  $0000,  $0000,  $0000,  $25F5
#_0ADC17: dw  $316A,  $5ED2,  $7FFF,  $15E3,  $473A,  $2918,  $771D,  $0000

;===================================================================================================

Palettes_DWMAP:
#_0ADC27: dw  $0000,  $18C6,  $0948,  $118A,  $25CF,  $57BF,  $1971,  $2A18
#_0ADC37: dw  $7C1F,  $52D8,  $5AF9,  $5F1A,  $633B,  $6B5C,  $0000,  $0000
#_0ADC47: dw  $0000,  $18C6,  $0005,  $45FC,  $633B,  $1DCE,  $3694,  $4718
#_0ADC57: dw  $25CF,  $1D40,  $34EA,  $616F,  $771B,  $26D6,  $2B18,  $2F5A
#_0ADC67: dw  $0000,  $18C6,  $2571,  $63DA,  $2A32,  $3A94,  $1D40,  $2580
#_0ADC77: dw  $7C1F,  $7C1F,  $0CC0,  $1ECC,  $3135,  $1DCE,  $4718,  $3694
#_0ADC87: dw  $0000,  $18C6,  $14E7,  $216C,  $25D0,  $3A75,  $2169,  $2E0E
#_0ADC97: dw  $21D6,  $2A18,  $1971,  $2A32,  $1D40,  $2580,  $597A,  $72FE
#_0ADCA7: dw  $0000,  $18C6,  $2A32,  $3A94,  $2171,  $3238,  $29F6,  $4278
#_0ADCB7: dw  $4EDB,  $1D40,  $35CD,  $15AB,  $198E,  $3254,  $731F,  $1ED4
#_0ADCC7: dw  $0000,  $18C6,  $016A,  $21CE,  $2A32,  $3A94,  $29F6,  $4278
#_0ADCD7: dw  $4EDB,  $1D40,  $1971,  $2A32,  $496C,  $5A10,  $3B5F,  $7C1F
#_0ADCE7: dw  $0000,  $18C6,  $0948,  $118A,  $222E,  $32F2,  $1951,  $2A18
#_0ADCF7: dw  $431B,  $1D40,  $1971,  $2A32,  $21D4,  $2A18,  $4B1F,  $7B9D
#_0ADD07: dw  $0000,  $7C1F,  $7C1F,  $7C1F,  $7C1F,  $2E31,  $00E4,  $2169
#_0ADD17: dw  $2E0E,  $42F1,  $7C1F,  $7C1F,  $7C1F,  $4A1D,  $4E3F,  $5A5F

;===================================================================================================

WorldMapHDMA_ZoomedOut_Part1:
#_0ADD27: dw $0177 ; scanline   0
#_0ADD29: dw $0176 ; scanline   1
#_0ADD2B: dw $0175 ; scanline   2
#_0ADD2D: dw $0175 ; scanline   3
#_0ADD2F: dw $0174 ; scanline   4
#_0ADD31: dw $0173 ; scanline   5
#_0ADD33: dw $0173 ; scanline   6
#_0ADD35: dw $0172 ; scanline   7
#_0ADD37: dw $0171 ; scanline   8
#_0ADD39: dw $0171 ; scanline   9
#_0ADD3B: dw $0170 ; scanline  10
#_0ADD3D: dw $016F ; scanline  11
#_0ADD3F: dw $016F ; scanline  12
#_0ADD41: dw $016E ; scanline  13
#_0ADD43: dw $016D ; scanline  14
#_0ADD45: dw $016D ; scanline  15
#_0ADD47: dw $016C ; scanline  16
#_0ADD49: dw $016B ; scanline  17
#_0ADD4B: dw $016B ; scanline  18
#_0ADD4D: dw $0169 ; scanline  19
#_0ADD4F: dw $0169 ; scanline  20
#_0ADD51: dw $0168 ; scanline  21
#_0ADD53: dw $0167 ; scanline  22
#_0ADD55: dw $0167 ; scanline  23
#_0ADD57: dw $0166 ; scanline  24
#_0ADD59: dw $0165 ; scanline  25
#_0ADD5B: dw $0165 ; scanline  26
#_0ADD5D: dw $0164 ; scanline  27
#_0ADD5F: dw $0163 ; scanline  28
#_0ADD61: dw $0163 ; scanline  29
#_0ADD63: dw $0162 ; scanline  30
#_0ADD65: dw $0162 ; scanline  31
#_0ADD67: dw $0161 ; scanline  32
#_0ADD69: dw $0160 ; scanline  33
#_0ADD6B: dw $0160 ; scanline  34
#_0ADD6D: dw $015F ; scanline  35
#_0ADD6F: dw $015F ; scanline  36
#_0ADD71: dw $015E ; scanline  37
#_0ADD73: dw $015D ; scanline  38
#_0ADD75: dw $015D ; scanline  39
#_0ADD77: dw $015C ; scanline  40
#_0ADD79: dw $015C ; scanline  41
#_0ADD7B: dw $015B ; scanline  42
#_0ADD7D: dw $015A ; scanline  43
#_0ADD7F: dw $015A ; scanline  44
#_0ADD81: dw $0159 ; scanline  45
#_0ADD83: dw $0159 ; scanline  46
#_0ADD85: dw $0158 ; scanline  47
#_0ADD87: dw $0157 ; scanline  48
#_0ADD89: dw $0157 ; scanline  49
#_0ADD8B: dw $0156 ; scanline  50
#_0ADD8D: dw $0156 ; scanline  51
#_0ADD8F: dw $0155 ; scanline  52
#_0ADD91: dw $0155 ; scanline  53
#_0ADD93: dw $0154 ; scanline  54
#_0ADD95: dw $0153 ; scanline  55
#_0ADD97: dw $0153 ; scanline  56
#_0ADD99: dw $0152 ; scanline  57
#_0ADD9B: dw $0152 ; scanline  58
#_0ADD9D: dw $0151 ; scanline  59
#_0ADD9F: dw $0151 ; scanline  60
#_0ADDA1: dw $0150 ; scanline  61
#_0ADDA3: dw $014F ; scanline  62
#_0ADDA5: dw $014F ; scanline  63
#_0ADDA7: dw $014E ; scanline  64
#_0ADDA9: dw $014E ; scanline  65
#_0ADDAB: dw $014D ; scanline  66
#_0ADDAD: dw $014D ; scanline  67
#_0ADDAF: dw $014C ; scanline  68
#_0ADDB1: dw $014C ; scanline  69
#_0ADDB3: dw $014B ; scanline  70
#_0ADDB5: dw $014B ; scanline  71
#_0ADDB7: dw $014A ; scanline  72
#_0ADDB9: dw $014A ; scanline  73
#_0ADDBB: dw $0148 ; scanline  74
#_0ADDBD: dw $0147 ; scanline  75
#_0ADDBF: dw $0147 ; scanline  76
#_0ADDC1: dw $0146 ; scanline  77
#_0ADDC3: dw $0146 ; scanline  78
#_0ADDC5: dw $0145 ; scanline  79
#_0ADDC7: dw $0145 ; scanline  80
#_0ADDC9: dw $0144 ; scanline  81
#_0ADDCB: dw $0144 ; scanline  82
#_0ADDCD: dw $0143 ; scanline  83
#_0ADDCF: dw $0143 ; scanline  84
#_0ADDD1: dw $0142 ; scanline  85
#_0ADDD3: dw $0142 ; scanline  86
#_0ADDD5: dw $0141 ; scanline  87
#_0ADDD7: dw $0141 ; scanline  88
#_0ADDD9: dw $0140 ; scanline  89
#_0ADDDB: dw $0140 ; scanline  90
#_0ADDDD: dw $013F ; scanline  91
#_0ADDDF: dw $013F ; scanline  92
#_0ADDE1: dw $013E ; scanline  93
#_0ADDE3: dw $013E ; scanline  94
#_0ADDE5: dw $013D ; scanline  95
#_0ADDE7: dw $013D ; scanline  96
#_0ADDE9: dw $013C ; scanline  97
#_0ADDEB: dw $013C ; scanline  98
#_0ADDED: dw $013B ; scanline  99
#_0ADDEF: dw $013B ; scanline 100
#_0ADDF1: dw $013A ; scanline 101
#_0ADDF3: dw $013A ; scanline 102
#_0ADDF5: dw $0139 ; scanline 103
#_0ADDF7: dw $0139 ; scanline 104
#_0ADDF9: dw $0138 ; scanline 105
#_0ADDFB: dw $0138 ; scanline 106
#_0ADDFD: dw $0137 ; scanline 107
#_0ADDFF: dw $0137 ; scanline 108
#_0ADE01: dw $0136 ; scanline 109
#_0ADE03: dw $0136 ; scanline 110
#_0ADE05: dw $0135 ; scanline 111

;---------------------------------------------------------------------------------------------------

WorldMapHDMA_ZoomedOut_Part2:
#_0ADE07: dw $0135 ; scanline 112
#_0ADE09: dw $0135 ; scanline 113
#_0ADE0B: dw $0134 ; scanline 114
#_0ADE0D: dw $0134 ; scanline 115
#_0ADE0F: dw $0133 ; scanline 116
#_0ADE11: dw $0133 ; scanline 117
#_0ADE13: dw $0132 ; scanline 118
#_0ADE15: dw $0132 ; scanline 119
#_0ADE17: dw $0131 ; scanline 120
#_0ADE19: dw $0131 ; scanline 121
#_0ADE1B: dw $0130 ; scanline 122
#_0ADE1D: dw $0130 ; scanline 123
#_0ADE1F: dw $012F ; scanline 124
#_0ADE21: dw $012F ; scanline 125
#_0ADE23: dw $012F ; scanline 126
#_0ADE25: dw $012E ; scanline 127
#_0ADE27: dw $012E ; scanline 128
#_0ADE29: dw $012D ; scanline 129
#_0ADE2B: dw $012D ; scanline 130
#_0ADE2D: dw $012C ; scanline 131
#_0ADE2F: dw $012C ; scanline 132
#_0ADE31: dw $012B ; scanline 133
#_0ADE33: dw $012B ; scanline 134
#_0ADE35: dw $012B ; scanline 135
#_0ADE37: dw $012A ; scanline 136
#_0ADE39: dw $012A ; scanline 137
#_0ADE3B: dw $0129 ; scanline 138
#_0ADE3D: dw $0129 ; scanline 139
#_0ADE3F: dw $0127 ; scanline 140
#_0ADE41: dw $0127 ; scanline 141
#_0ADE43: dw $0126 ; scanline 142
#_0ADE45: dw $0126 ; scanline 143
#_0ADE47: dw $0126 ; scanline 144
#_0ADE49: dw $0125 ; scanline 145
#_0ADE4B: dw $0125 ; scanline 146
#_0ADE4D: dw $0124 ; scanline 147
#_0ADE4F: dw $0124 ; scanline 148
#_0ADE51: dw $0124 ; scanline 149
#_0ADE53: dw $0123 ; scanline 150
#_0ADE55: dw $0123 ; scanline 151
#_0ADE57: dw $0122 ; scanline 152
#_0ADE59: dw $0122 ; scanline 153
#_0ADE5B: dw $0121 ; scanline 154
#_0ADE5D: dw $0121 ; scanline 155
#_0ADE5F: dw $0121 ; scanline 156
#_0ADE61: dw $0120 ; scanline 157
#_0ADE63: dw $0120 ; scanline 158
#_0ADE65: dw $011F ; scanline 159
#_0ADE67: dw $011F ; scanline 160
#_0ADE69: dw $011F ; scanline 161
#_0ADE6B: dw $011E ; scanline 162
#_0ADE6D: dw $011E ; scanline 163
#_0ADE6F: dw $011D ; scanline 164
#_0ADE71: dw $011D ; scanline 165
#_0ADE73: dw $011D ; scanline 166
#_0ADE75: dw $011C ; scanline 167
#_0ADE77: dw $011C ; scanline 168
#_0ADE79: dw $011B ; scanline 169
#_0ADE7B: dw $011B ; scanline 170
#_0ADE7D: dw $011B ; scanline 171
#_0ADE7F: dw $011A ; scanline 172
#_0ADE81: dw $011A ; scanline 173
#_0ADE83: dw $0119 ; scanline 174
#_0ADE85: dw $0119 ; scanline 175
#_0ADE87: dw $0119 ; scanline 176
#_0ADE89: dw $0118 ; scanline 177
#_0ADE8B: dw $0118 ; scanline 178
#_0ADE8D: dw $0117 ; scanline 179
#_0ADE8F: dw $0117 ; scanline 180
#_0ADE91: dw $0117 ; scanline 181
#_0ADE93: dw $0116 ; scanline 182
#_0ADE95: dw $0116 ; scanline 183
#_0ADE97: dw $0116 ; scanline 184
#_0ADE99: dw $0115 ; scanline 185
#_0ADE9B: dw $0115 ; scanline 186
#_0ADE9D: dw $0114 ; scanline 187
#_0ADE9F: dw $0114 ; scanline 188
#_0ADEA1: dw $0114 ; scanline 189
#_0ADEA3: dw $0113 ; scanline 190
#_0ADEA5: dw $0113 ; scanline 191
#_0ADEA7: dw $0113 ; scanline 192
#_0ADEA9: dw $0112 ; scanline 193
#_0ADEAB: dw $0112 ; scanline 194
#_0ADEAD: dw $0111 ; scanline 195
#_0ADEAF: dw $0111 ; scanline 196
#_0ADEB1: dw $0111 ; scanline 197
#_0ADEB3: dw $0110 ; scanline 198
#_0ADEB5: dw $0110 ; scanline 199
#_0ADEB7: dw $0110 ; scanline 200
#_0ADEB9: dw $010F ; scanline 201
#_0ADEBB: dw $010F ; scanline 202
#_0ADEBD: dw $010F ; scanline 203
#_0ADEBF: dw $010E ; scanline 204
#_0ADEC1: dw $010E ; scanline 205
#_0ADEC3: dw $010D ; scanline 206
#_0ADEC5: dw $010D ; scanline 207
#_0ADEC7: dw $010D ; scanline 208
#_0ADEC9: dw $010C ; scanline 209
#_0ADECB: dw $010C ; scanline 210
#_0ADECD: dw $010C ; scanline 211
#_0ADECF: dw $010B ; scanline 212
#_0ADED1: dw $010B ; scanline 213
#_0ADED3: dw $010B ; scanline 214
#_0ADED5: dw $010A ; scanline 215
#_0ADED7: dw $010A ; scanline 216
#_0ADED9: dw $010A ; scanline 217
#_0ADEDB: dw $0109 ; scanline 218
#_0ADEDD: dw $0109 ; scanline 219
#_0ADEDF: dw $0109 ; scanline 220
#_0ADEE1: dw $0108 ; scanline 221
#_0ADEE3: dw $0108 ; scanline 222
#_0ADEE5: dw $0108 ; scanline 223

;===================================================================================================

WorldMapHDMA_ZoomedIn_Part1:
#_0ADEE7: dw $0088 ; scanline   0
#_0ADEE9: dw $0088 ; scanline   1
#_0ADEEB: dw $0087 ; scanline   2
#_0ADEED: dw $0087 ; scanline   3
#_0ADEEF: dw $0087 ; scanline   4
#_0ADEF1: dw $0087 ; scanline   5
#_0ADEF3: dw $0087 ; scanline   6
#_0ADEF5: dw $0086 ; scanline   7
#_0ADEF7: dw $0086 ; scanline   8
#_0ADEF9: dw $0086 ; scanline   9
#_0ADEFB: dw $0085 ; scanline  10
#_0ADEFD: dw $0085 ; scanline  11
#_0ADEFF: dw $0085 ; scanline  12
#_0ADF01: dw $0085 ; scanline  13
#_0ADF03: dw $0084 ; scanline  14
#_0ADF05: dw $0084 ; scanline  15
#_0ADF07: dw $0084 ; scanline  16
#_0ADF09: dw $0084 ; scanline  17
#_0ADF0B: dw $0084 ; scanline  18
#_0ADF0D: dw $0083 ; scanline  19
#_0ADF0F: dw $0083 ; scanline  20
#_0ADF11: dw $0083 ; scanline  21
#_0ADF13: dw $0082 ; scanline  22
#_0ADF15: dw $0082 ; scanline  23
#_0ADF17: dw $0082 ; scanline  24
#_0ADF19: dw $0082 ; scanline  25
#_0ADF1B: dw $0082 ; scanline  26
#_0ADF1D: dw $0081 ; scanline  27
#_0ADF1F: dw $0081 ; scanline  28
#_0ADF21: dw $0081 ; scanline  29
#_0ADF23: dw $0081 ; scanline  30
#_0ADF25: dw $0081 ; scanline  31
#_0ADF27: dw $0080 ; scanline  32
#_0ADF29: dw $0080 ; scanline  33
#_0ADF2B: dw $0080 ; scanline  34
#_0ADF2D: dw $007F ; scanline  35
#_0ADF2F: dw $007F ; scanline  36
#_0ADF31: dw $007F ; scanline  37
#_0ADF33: dw $007F ; scanline  38
#_0ADF35: dw $007F ; scanline  39
#_0ADF37: dw $007E ; scanline  40
#_0ADF39: dw $007E ; scanline  41
#_0ADF3B: dw $007E ; scanline  42
#_0ADF3D: dw $007E ; scanline  43
#_0ADF3F: dw $007E ; scanline  44
#_0ADF41: dw $007D ; scanline  45
#_0ADF43: dw $007D ; scanline  46
#_0ADF45: dw $007D ; scanline  47
#_0ADF47: dw $007C ; scanline  48
#_0ADF49: dw $007C ; scanline  49
#_0ADF4B: dw $007C ; scanline  50
#_0ADF4D: dw $007C ; scanline  51
#_0ADF4F: dw $007C ; scanline  52
#_0ADF51: dw $007C ; scanline  53
#_0ADF53: dw $007B ; scanline  54
#_0ADF55: dw $007B ; scanline  55
#_0ADF57: dw $007B ; scanline  56
#_0ADF59: dw $007B ; scanline  57
#_0ADF5B: dw $007B ; scanline  58
#_0ADF5D: dw $007A ; scanline  59
#_0ADF5F: dw $007A ; scanline  60
#_0ADF61: dw $007A ; scanline  61
#_0ADF63: dw $0079 ; scanline  62
#_0ADF65: dw $0079 ; scanline  63
#_0ADF67: dw $0079 ; scanline  64
#_0ADF69: dw $0079 ; scanline  65
#_0ADF6B: dw $0079 ; scanline  66
#_0ADF6D: dw $0079 ; scanline  67
#_0ADF6F: dw $0078 ; scanline  68
#_0ADF71: dw $0078 ; scanline  69
#_0ADF73: dw $0078 ; scanline  70
#_0ADF75: dw $0078 ; scanline  71
#_0ADF77: dw $0078 ; scanline  72
#_0ADF79: dw $0078 ; scanline  73
#_0ADF7B: dw $0077 ; scanline  74
#_0ADF7D: dw $0077 ; scanline  75
#_0ADF7F: dw $0077 ; scanline  76
#_0ADF81: dw $0076 ; scanline  77
#_0ADF83: dw $0076 ; scanline  78
#_0ADF85: dw $0076 ; scanline  79
#_0ADF87: dw $0076 ; scanline  80
#_0ADF89: dw $0076 ; scanline  81
#_0ADF8B: dw $0076 ; scanline  82
#_0ADF8D: dw $0075 ; scanline  83
#_0ADF8F: dw $0075 ; scanline  84
#_0ADF91: dw $0075 ; scanline  85
#_0ADF93: dw $0075 ; scanline  86
#_0ADF95: dw $0075 ; scanline  87
#_0ADF97: dw $0075 ; scanline  88
#_0ADF99: dw $0074 ; scanline  89
#_0ADF9B: dw $0074 ; scanline  90
#_0ADF9D: dw $0074 ; scanline  91
#_0ADF9F: dw $0074 ; scanline  92
#_0ADFA1: dw $0073 ; scanline  93
#_0ADFA3: dw $0073 ; scanline  94
#_0ADFA5: dw $0073 ; scanline  95
#_0ADFA7: dw $0073 ; scanline  96
#_0ADFA9: dw $0073 ; scanline  97
#_0ADFAB: dw $0073 ; scanline  98
#_0ADFAD: dw $0072 ; scanline  99
#_0ADFAF: dw $0072 ; scanline 100
#_0ADFB1: dw $0072 ; scanline 101
#_0ADFB3: dw $0072 ; scanline 102
#_0ADFB5: dw $0072 ; scanline 103
#_0ADFB7: dw $0072 ; scanline 104
#_0ADFB9: dw $0071 ; scanline 105
#_0ADFBB: dw $0071 ; scanline 106
#_0ADFBD: dw $0071 ; scanline 107
#_0ADFBF: dw $0071 ; scanline 108
#_0ADFC1: dw $0070 ; scanline 109
#_0ADFC3: dw $0070 ; scanline 110
#_0ADFC5: dw $0070 ; scanline 111

;---------------------------------------------------------------------------------------------------

WorldMapHDMA_ZoomedIn_Part2:
#_0ADFC7: dw $0070 ; scanline 112
#_0ADFC9: dw $0070 ; scanline 113
#_0ADFCB: dw $0070 ; scanline 114
#_0ADFCD: dw $0070 ; scanline 115
#_0ADFCF: dw $006F ; scanline 116
#_0ADFD1: dw $006F ; scanline 117
#_0ADFD3: dw $006F ; scanline 118
#_0ADFD5: dw $006F ; scanline 119
#_0ADFD7: dw $006F ; scanline 120
#_0ADFD9: dw $006F ; scanline 121
#_0ADFDB: dw $006E ; scanline 122
#_0ADFDD: dw $006E ; scanline 123
#_0ADFDF: dw $006E ; scanline 124
#_0ADFE1: dw $006E ; scanline 125
#_0ADFE3: dw $006E ; scanline 126
#_0ADFE5: dw $006D ; scanline 127
#_0ADFE7: dw $006D ; scanline 128
#_0ADFE9: dw $006D ; scanline 129
#_0ADFEB: dw $006D ; scanline 130
#_0ADFED: dw $006D ; scanline 131
#_0ADFEF: dw $006D ; scanline 132
#_0ADFF1: dw $006C ; scanline 133
#_0ADFF3: dw $006C ; scanline 134
#_0ADFF5: dw $006C ; scanline 135
#_0ADFF7: dw $006C ; scanline 136
#_0ADFF9: dw $006C ; scanline 137
#_0ADFFB: dw $006C ; scanline 138
#_0ADFFD: dw $006C ; scanline 139
#_0ADFFF: dw $006B ; scanline 140
#_0AE001: dw $006B ; scanline 141
#_0AE003: dw $006B ; scanline 142
#_0AE005: dw $006B ; scanline 143
#_0AE007: dw $006B ; scanline 144
#_0AE009: dw $006A ; scanline 145
#_0AE00B: dw $006A ; scanline 146
#_0AE00D: dw $006A ; scanline 147
#_0AE00F: dw $006A ; scanline 148
#_0AE011: dw $006A ; scanline 149
#_0AE013: dw $006A ; scanline 150
#_0AE015: dw $006A ; scanline 151
#_0AE017: dw $0069 ; scanline 152
#_0AE019: dw $0069 ; scanline 153
#_0AE01B: dw $0069 ; scanline 154
#_0AE01D: dw $0069 ; scanline 155
#_0AE01F: dw $0069 ; scanline 156
#_0AE021: dw $0069 ; scanline 157
#_0AE023: dw $0069 ; scanline 158
#_0AE025: dw $0068 ; scanline 159
#_0AE027: dw $0068 ; scanline 160
#_0AE029: dw $0068 ; scanline 161
#_0AE02B: dw $0068 ; scanline 162
#_0AE02D: dw $0068 ; scanline 163
#_0AE02F: dw $0067 ; scanline 164
#_0AE031: dw $0067 ; scanline 165
#_0AE033: dw $0067 ; scanline 166
#_0AE035: dw $0067 ; scanline 167
#_0AE037: dw $0067 ; scanline 168
#_0AE039: dw $0067 ; scanline 169
#_0AE03B: dw $0067 ; scanline 170
#_0AE03D: dw $0067 ; scanline 171
#_0AE03F: dw $0066 ; scanline 172
#_0AE041: dw $0066 ; scanline 173
#_0AE043: dw $0066 ; scanline 174
#_0AE045: dw $0066 ; scanline 175
#_0AE047: dw $0066 ; scanline 176
#_0AE049: dw $0066 ; scanline 177
#_0AE04B: dw $0066 ; scanline 178
#_0AE04D: dw $0065 ; scanline 179
#_0AE04F: dw $0065 ; scanline 180
#_0AE051: dw $0065 ; scanline 181
#_0AE053: dw $0065 ; scanline 182
#_0AE055: dw $0065 ; scanline 183
#_0AE057: dw $0065 ; scanline 184
#_0AE059: dw $0064 ; scanline 185
#_0AE05B: dw $0064 ; scanline 186
#_0AE05D: dw $0064 ; scanline 187
#_0AE05F: dw $0064 ; scanline 188
#_0AE061: dw $0064 ; scanline 189
#_0AE063: dw $0064 ; scanline 190
#_0AE065: dw $0064 ; scanline 191
#_0AE067: dw $0064 ; scanline 192
#_0AE069: dw $0063 ; scanline 193
#_0AE06B: dw $0063 ; scanline 194
#_0AE06D: dw $0063 ; scanline 195
#_0AE06F: dw $0063 ; scanline 196
#_0AE071: dw $0063 ; scanline 197
#_0AE073: dw $0063 ; scanline 198
#_0AE075: dw $0063 ; scanline 199
#_0AE077: dw $0063 ; scanline 200
#_0AE079: dw $0062 ; scanline 201
#_0AE07B: dw $0062 ; scanline 202
#_0AE07D: dw $0062 ; scanline 203
#_0AE07F: dw $0062 ; scanline 204
#_0AE081: dw $0062 ; scanline 205
#_0AE083: dw $0061 ; scanline 206
#_0AE085: dw $0061 ; scanline 207
#_0AE087: dw $0061 ; scanline 208
#_0AE089: dw $0061 ; scanline 209
#_0AE08B: dw $0061 ; scanline 210
#_0AE08D: dw $0061 ; scanline 211
#_0AE08F: dw $0061 ; scanline 212
#_0AE091: dw $0061 ; scanline 213
#_0AE093: dw $0061 ; scanline 214
#_0AE095: dw $0060 ; scanline 215
#_0AE097: dw $0060 ; scanline 216
#_0AE099: dw $0060 ; scanline 217
#_0AE09B: dw $0060 ; scanline 218
#_0AE09D: dw $0060 ; scanline 219
#_0AE09F: dw $0060 ; scanline 220
#_0AE0A1: dw $0060 ; scanline 221
#_0AE0A3: dw $0060 ; scanline 222
#_0AE0A5: dw $0060 ; scanline 223

;===================================================================================================
; FREE ROM: 0x09
;===================================================================================================
NULL_0AE0A7:
#_0AE0A7: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0AE0AF: db $FF

;===================================================================================================

Module0E_03_UnderworldMap:
#_0AE0B0: LDA.w $0200
#_0AE0B3: JSL JumpTableLong
#_0AE0B7: dl Module0E_03_00_DarkenAndPrep     ; 0x00
#_0AE0BA: dl Module0E_03_01_DrawMap           ; 0x01
#_0AE0BD: dl Module0E_03_02_BrightenMap       ; 0x02
#_0AE0C0: dl DungeonMap_HandleInputAndSprites ; 0x03
#_0AE0C3: dl Module0E_03_04_UnusedCrazyScroll ; 0x04
#_0AE0C6: dl UnderworldMap_RecoverRegisters   ; 0x05
#_0AE0C9: dl UnderworldMap_RecoverGFX         ; 0x06
#_0AE0CC: dl ToggleStarTilesAndAdvance        ; 0x07
#_0AE0CF: dl UnderworldMap_RecoverLightCone   ; 0x08

;===================================================================================================

pool Module0E_03_01_DrawMap

.vectors
#_0AE0D2: dw Module0E_03_01_00_PrepMapGraphics
#_0AE0D4: dw Module0E_03_01_01_DrawLEVEL
#_0AE0D6: dw Module0E_03_01_02_DrawFloorsBackdrop
#_0AE0D8: dw Module0E_03_01_03_DrawRooms
#_0AE0DA: dw DungeonMap_DrawRoomMarkers

pool off

;---------------------------------------------------------------------------------------------------

Module0E_03_01_DrawMap:
#_0AE0DC: LDA.w $020D
#_0AE0DF: ASL A
#_0AE0E0: TAX

#_0AE0E1: JMP.w (.vectors,X)

;===================================================================================================

Module0E_03_01_00_PrepMapGraphics:
#_0AE0E4: LDA.b $9B
#_0AE0E6: PHA

#_0AE0E7: STZ.w HDMAEN
#_0AE0EA: STZ.b $9B

#_0AE0EC: LDA.w $0AA1
#_0AE0EF: STA.l $7EC20E

#_0AE0F3: LDA.w $0AA3
#_0AE0F6: STA.l $7EC20F

#_0AE0FA: LDA.w $0AA2
#_0AE0FD: STA.l $7EC210

;---------------------------------------------------------------------------------------------------

#_0AE101: LDA.b $1C
#_0AE103: STA.l $7EC211

#_0AE107: LDA.b $1D
#_0AE109: STA.l $7EC212

;---------------------------------------------------------------------------------------------------

#_0AE10D: LDA.b #$20
#_0AE10F: STA.w $0AA1

#_0AE112: LDA.w $040C
#_0AE115: LSR A
#_0AE116: ORA.b #$80
#_0AE118: STA.w $0AA3

#_0AE11B: LDA.b #$40
#_0AE11D: STA.w $0AA2

#_0AE120: LDA.b #$16
#_0AE122: STA.b $1C

#_0AE124: LDA.b #$01
#_0AE126: STA.b $1D

#_0AE128: JSL EraseTilemaps_dungeonmap
#_0AE12C: JSL InitializeTilesets

#_0AE130: LDA.b #$02
#_0AE132: STA.w $0AA9
#_0AE135: JSL Palettes_Load_DungeonMapBG
#_0AE139: JSL Palettes_Load_DungeonMapSprite

#_0AE13D: LDA.b #$01
#_0AE13F: STA.w $0AB2
#_0AE142: JSL Palettes_Load_HUD
#_0AE146: JSL RefreshLinkEquipmentPalettes_sword_and_mail

#_0AE14A: INC.b $15

#_0AE14C: INC.w $020D

#_0AE14F: PLA
#_0AE150: STA.b $9B

#_0AE152: LDA.b #$09
#_0AE154: STA.b $14
#_0AE156: STA.w $0710

#_0AE159: RTL

;===================================================================================================

pool Module0E_03_01_01_DrawLEVEL

.LEVEL_top
#_0AE15A: dw $8460, $0B00 ; VRAM $C108 | 12 bytes | Horizontal
#_0AE15E: dw $2132, $2133, $2138, $213A, $207F

.LEVEL_bottom
#_0AE168: dw $A460, $0B00 ; VRAM $C148 | 12 bytes | Horizontal
#_0AE16C: dw $2142, $2143, $2149, $214A, $207F

.numerals_top
#_0AE176: dw $2108, $2109, $2109, $210A
#_0AE17E: dw $210B, $210C, $210D, $211D

.numerals_bottom
#_0AE186: dw $2118, $2119, $A109, $211A
#_0AE18E: dw $211B, $211C, $2118, $A11D

.dungeon_level
#_0AE196: db $FF ; Sewers
#_0AE197: db $FF ; Hyrule Castle
#_0AE198: db $FF ; Eastern Palace
#_0AE199: db $FF ; Desert Palace
#_0AE19A: db $FF ; Agahnim's Tower
#_0AE19B: db $02 ; Swamp Palace
#_0AE19C: db $00 ; Palace of Darkness
#_0AE19D: db $0A ; Misery Mire
#_0AE19E: db $04 ; Skull Woods
#_0AE19F: db $08 ; Ice Palace
#_0AE1A0: db $FF ; Tower of Hera
#_0AE1A1: db $06 ; Thieves' Town
#_0AE1A2: db $0C ; Turtle Rock
#_0AE1A3: db $0E ; Ganon's Tower

pool off

;---------------------------------------------------------------------------------------------------

Module0E_03_01_01_DrawLEVEL:
#_0AE1A4: PHB
#_0AE1A5: PHK
#_0AE1A6: PLB

#_0AE1A7: LDA.w $040C
#_0AE1AA: LSR A
#_0AE1AB: TAX

#_0AE1AC: LDY.w .dungeon_level,X
#_0AE1AF: BMI .not_darkworld_dungeon

#_0AE1B1: LDA.b #$FF
#_0AE1B3: STA.w $1022

#_0AE1B6: LDX.b #$0E

#_0AE1B8: REP #$20

#_0AE1BA: LDA.w .numerals_top,Y
#_0AE1BD: STA.w $1002,X

#_0AE1C0: LDA.w .numerals_bottom,Y
#_0AE1C3: STA.w $1012,X

;---------------------------------------------------------------------------------------------------

#_0AE1C6: SEP #$20

#_0AE1C8: DEX

.next_letter
#_0AE1C9: LDA.w .LEVEL_top,X
#_0AE1CC: STA.w $1002,X

#_0AE1CF: LDA.w .LEVEL_bottom,X
#_0AE1D2: STA.w $1012,X

#_0AE1D5: DEX
#_0AE1D6: BPL .next_letter

#_0AE1D8: LDA.b #$01
#_0AE1DA: STA.b $14

;---------------------------------------------------------------------------------------------------

.not_darkworld_dungeon
#_0AE1DC: INC.w $020D

#_0AE1DF: PLB

#_0AE1E0: RTL

;===================================================================================================

DungeonMap_BackdropFloorPosition:
#_0AE1E1: dw $1223 ; 4B-4F | VRAM $2446
#_0AE1E3: dw $1263 ; 5F    | VRAM $24C6
#_0AE1E5: dw $12A3 ; 6F    | VRAM $2546
#_0AE1E7: dw $12E3 ; 7F    | VRAM $25C6
#_0AE1E9: dw $1323 ; 8F    | VRAM $2646

#_0AE1EB: dw $11E3 ; 5B    | VRAM $23C6
#_0AE1ED: dw $11A3 ; 6B    | VRAM $2346
#_0AE1EF: dw $1163 ; 7B    | VRAM $22C6
#_0AE1F1: dw $1123 ; 8B    | VRAM $2246

;===================================================================================================

Module0E_03_01_02_DrawFloorsBackdrop:
#_0AE1F3: PHB
#_0AE1F4: PHK
#_0AE1F5: PLB

#_0AE1F6: REP #$30

#_0AE1F8: STZ.w $1000

#_0AE1FB: LDX.w $040C
#_0AE1FE: PHX

#_0AE1FF: LDA.w DungeonMapFloorCountData,X

#_0AE202: AND.w #$0300
#_0AE205: BEQ .no_mountain

#_0AE207: AND.w #$0100
#_0AE20A: BEQ .no_mountain

#_0AE20C: LDX.w #$002A
#_0AE20F: PHX

.next_copy
#_0AE210: LDA.w DungeonMap_MountainStripes-2,X
#_0AE213: STA.w $1000,X

#_0AE216: DEX
#_0AE217: DEX
#_0AE218: BNE .next_copy

;---------------------------------------------------------------------------------------------------

#_0AE21A: PLX

#_0AE21B: LDA.w #$1123 ; VRAM $2246
#_0AE21E: STA.b $00

#_0AE220: LDY.w #$0010

.next_mountain_fill_stripe
#_0AE223: LDA.b $00

#_0AE225: XBA
#_0AE226: STA.w $1002,X
#_0AE229: XBA

#_0AE22A: CLC
#_0AE22B: ADC.w #$0020
#_0AE22E: STA.b $00

#_0AE230: LDA.w #$0E40
#_0AE233: STA.w $1004,X

#_0AE236: LDA.w #$1B2E
#_0AE239: STA.w $1006,X

#_0AE23C: INX
#_0AE23D: INX
#_0AE23E: INX
#_0AE23F: INX
#_0AE240: INX
#_0AE241: INX

#_0AE242: DEY
#_0AE243: BNE .next_mountain_fill_stripe

#_0AE245: STX.w $1000

.no_mountain
#_0AE248: STZ.b $00
#_0AE24A: STZ.b $02

#_0AE24C: LDX.w $040C

#_0AE24F: LDA.w DungeonMapFloorCountData,X
#_0AE252: AND.w #$00FF
#_0AE255: CMP.w #$0050
#_0AE258: BCC .fewer_than_5_above

#_0AE25A: LSR A
#_0AE25B: LSR A
#_0AE25C: LSR A
#_0AE25D: LSR A

#_0AE25E: SEC
#_0AE25F: SBC.w #$0004

#_0AE262: ASL A
#_0AE263: STA.b $00

#_0AE265: BRA .done_floor_counting

.fewer_than_5_above
#_0AE267: AND.w #$000F
#_0AE26A: CMP.w #$0005
#_0AE26D: BCC .done_floor_counting

#_0AE26F: ASL A
#_0AE270: STA.b $00

;---------------------------------------------------------------------------------------------------

.done_floor_counting
#_0AE272: LDX.b $00
#_0AE274: LDY.w $1000

#_0AE277: LDA.w DungeonMap_BackdropFloorPosition,X
#_0AE27A: STA.b $00
#_0AE27C: STA.b $0E

.next_floor_stripe
#_0AE27E: LDA.b $00
#_0AE280: XBA

#_0AE281: STA.w $1002,Y

#_0AE284: INY
#_0AE285: INY

#_0AE286: LDA.w #$0E40
#_0AE289: STA.w $1002,Y

#_0AE28C: INY
#_0AE28D: INY

#_0AE28E: LDX.b $02

#_0AE290: LDA.w DungeonMap_BackdropFloorGradientTiles,X
#_0AE293: STA.b $04

#_0AE295: LDX.w $040C

#_0AE298: LDA.w DungeonMapFloorCountData,X
#_0AE29B: AND.w #$0200
#_0AE29E: BEQ .not_ocean

#_0AE2A0: LDA.b $04
#_0AE2A2: CLC
#_0AE2A3: ADC.w #$0400
#_0AE2A6: STA.b $04

.not_ocean
#_0AE2A8: LDA.b $04
#_0AE2AA: STA.w $1002,Y

#_0AE2AD: INY
#_0AE2AE: INY

#_0AE2AF: LDA.b $02
#_0AE2B1: CMP.w #$000C
#_0AE2B4: BEQ .gradient_finished

#_0AE2B6: INC.b $02
#_0AE2B8: INC.b $02

.gradient_finished
#_0AE2BA: LDA.b $00
#_0AE2BC: CLC
#_0AE2BD: ADC.w #$0020
#_0AE2C0: STA.b $00

#_0AE2C2: CMP.w #$1360 ; VRAM $26C0
#_0AE2C5: BCC .next_floor_stripe

;---------------------------------------------------------------------------------------------------

#_0AE2C7: STY.w $1000

#_0AE2CA: SEP #$20

#_0AE2CC: PLX
#_0AE2CD: JSR DungeonMap_BuildFloorListBoxes

#_0AE2D0: REP #$10

#_0AE2D2: LDY.w $1000

#_0AE2D5: LDA.b #$FF
#_0AE2D7: STA.w $1002,Y

#_0AE2DA: SEP #$10

#_0AE2DC: INC.w $020D

#_0AE2DF: LDA.b #$01
#_0AE2E1: STA.b $14

#_0AE2E3: PLB

#_0AE2E4: RTL

;===================================================================================================

pool DungeonMap_BuildFloorListBoxes

.tiles
#_0AE2E5: dw $0F26, $0F27, $4F27, $4F26
#_0AE2ED: dw $8F26, $8F27, $CF27, $CF26

pool off

;---------------------------------------------------------------------------------------------------

DungeonMap_BuildFloorListBoxes:
#_0AE2F5: REP #$20

#_0AE2F7: LDA.w DungeonMapFloorCountData,X
#_0AE2FA: AND.w #$00FF
#_0AE2FD: STA.b $02

#_0AE2FF: AND.w #$000F
#_0AE302: STA.b $00

#_0AE304: LDA.b $02

#_0AE306: LSR A
#_0AE307: LSR A
#_0AE308: LSR A
#_0AE309: LSR A

#_0AE30A: CLC
#_0AE30B: ADC.b $00
#_0AE30D: STA.b $02

#_0AE30F: LDA.b $A4
#_0AE311: CLC
#_0AE312: ADC.b $00
#_0AE314: AND.w #$00FF
#_0AE317: STA.b $0C

#_0AE319: STZ.b $0A

#_0AE31B: LDA.b $0E
#_0AE31D: SEC
#_0AE31E: SBC.w #$0040
#_0AE321: CLC
#_0AE322: ADC.w #$0002
#_0AE325: STA.b $0E

#_0AE327: LDX.b $00
#_0AE329: BEQ .no_basement

#_0AE32B: LDA.b $0E

.scroll_floors
#_0AE32D: CLC
#_0AE32E: ADC.w #$0040

#_0AE331: DEX
#_0AE332: BNE .scroll_floors

#_0AE334: STA.b $0E

.no_basement
#_0AE336: REP #$10

#_0AE338: LDY.w $1000

.next_box
#_0AE33B: LDX.w #$0000

#_0AE33E: LDA.b $0E

.do_next_row
#_0AE340: XBA
#_0AE341: STA.w $1002,Y

#_0AE344: INY
#_0AE345: INY

#_0AE346: LDA.w #$0700
#_0AE349: STA.w $1002,Y

#_0AE34C: INY
#_0AE34D: INY

.next_tile_to_stripe
#_0AE34E: LDA.w .tiles,X
#_0AE351: STA.w $1002,Y

#_0AE354: INY
#_0AE355: INY

#_0AE356: INX
#_0AE357: INX
#_0AE358: CPX.w #$0008
#_0AE35B: BCC .next_tile_to_stripe
#_0AE35D: BEQ .set_up_box_bottom

#_0AE35F: CPX.w #$0010
#_0AE362: BNE .next_tile_to_stripe

#_0AE364: BRA .box_done

.set_up_box_bottom
#_0AE366: LDA.b $0E
#_0AE368: CLC
#_0AE369: ADC.w #$0020

#_0AE36C: BRA .do_next_row

.box_done
#_0AE36E: LDA.b $0E
#_0AE370: SEC
#_0AE371: SBC.w #$0040
#_0AE374: STA.b $0E

#_0AE376: INC.b $0A

#_0AE378: LDA.b $0A
#_0AE37A: CMP.b $02
#_0AE37C: BMI .next_box

#_0AE37E: STY.w $1000

#_0AE381: SEP #$30

#_0AE383: RTS

;===================================================================================================

Module0E_03_01_03_DrawRooms:
#_0AE384: PHB
#_0AE385: PHK
#_0AE386: PLB

#_0AE387: STZ.w $0210

#_0AE38A: REP #$30

#_0AE38C: STZ.b $00
#_0AE38E: STZ.b $02
#_0AE390: STZ.b $04
#_0AE392: STZ.b $06
#_0AE394: STZ.b $08
#_0AE396: STZ.b $0A
#_0AE398: STZ.b $0C

#_0AE39A: STZ.w $0211

#_0AE39D: LDX.w $040C

#_0AE3A0: LDA.w DungeonMapFloorCountData,X
#_0AE3A3: AND.w #$000F

#_0AE3A6: EOR.w #$00FF
#_0AE3A9: INC A

#_0AE3AA: AND.w #$00FF

#_0AE3AD: CMP.b $A4
#_0AE3AF: BEQ .on_this_floor

#_0AE3B1: LDA.b $A4
#_0AE3B3: AND.w #$00FF
#_0AE3B6: STA.w $020E

#_0AE3B9: BRA .continue

.on_this_floor
#_0AE3BB: LDA.b $A4
#_0AE3BD: INC A
#_0AE3BE: STA.w $020E

#_0AE3C1: INC.w $0211
#_0AE3C4: INC.w $0211

;---------------------------------------------------------------------------------------------------

.continue
#_0AE3C7: LDA.w $020E
#_0AE3CA: AND.w #$0050
#_0AE3CD: BNE .pointless_check

#_0AE3CF: LDA.w #$EFFF
#_0AE3D2: STA.b $08
#_0AE3D4: BRA .that_was_pointless

.pointless_check
#_0AE3D6: LDA.w #$EFFF
#_0AE3D9: STA.b $08

.that_was_pointless
#_0AE3DB: JSR DungeonMap_DrawFloorNumbersByRoom
#_0AE3DE: JSR DungeonMap_DrawBorderForRooms
#_0AE3E1: JSR DungeonMap_DrawDungeonLayout

;---------------------------------------------------------------------------------------------------

#_0AE3E4: DEC.w $020E

#_0AE3E7: REP #$30

#_0AE3E9: LDA.w #$0300
#_0AE3EC: STA.b $06

#_0AE3EE: LDA.w $0211
#_0AE3F1: BNE .very_useless
#_0AE3F3: BRA .very_useless

.very_useless
#_0AE3F5: LDA.w $020E
#_0AE3F8: AND.w #$0050
#_0AE3FB: BNE .more_pointlessness

#_0AE3FD: LDA.w #$EFFF
#_0AE400: STA.b $08
#_0AE402: BRA .wow_really_pointless

.more_pointlessness
#_0AE404: LDA.w #$EFFF
#_0AE407: STA.b $08

.wow_really_pointless
#_0AE409: JSR DungeonMap_DrawFloorNumbersByRoom
#_0AE40C: JSR DungeonMap_DrawBorderForRooms
#_0AE40F: JSR DungeonMap_DrawDungeonLayout

;---------------------------------------------------------------------------------------------------

#_0AE412: REP #$30

#_0AE414: INC.w $020E

#_0AE417: STZ.b $06

#_0AE419: SEP #$30

#_0AE41B: LDA.b #$08
#_0AE41D: STA.b $17

#_0AE41F: LDA.b #$22
#_0AE421: STA.w $0116

#_0AE424: INC.w $020D

#_0AE427: PLB

#_0AE428: RTL

;===================================================================================================

pool DungeonMap_DrawBorderForRooms

.tiles_corner
#_0AE429: dw $1F19, $5F19, $9F19, $DF19

.tiles_corner_address
#_0AE431: dw $00E2, $00F8, $03A2, $03B8

.tiles_vertical_border
#_0AE439: dw $1F1A, $9F1A

.tiles_vertical_border_address
#_0AE43D: dw $00E4, $03A4

.tiles_horizontal_border
#_0AE441: dw $1F1B, $5F1B

.tiles_horizontal_border_address
#_0AE445: dw $0122, $0138

pool off

;---------------------------------------------------------------------------------------------------

DungeonMap_DrawBorderForRooms:
#_0AE449: REP #$30

#_0AE44B: STZ.b $02

.next_corner
#_0AE44D: LDY.b $02

#_0AE44F: LDA.w .tiles_corner_address,Y
#_0AE452: CLC
#_0AE453: ADC.b $06
#_0AE455: AND.w #$0FFF
#_0AE458: TAX

#_0AE459: LDA.w #$0F00
#_0AE45C: STA.l $7F0000,X

#_0AE460: LDA.w .tiles_corner,Y
#_0AE463: AND.b $08
#_0AE465: STA.l $7F0000,X

#_0AE469: INC.b $02
#_0AE46B: INC.b $02

#_0AE46D: LDA.b $02
#_0AE46F: CMP.w #$0008
#_0AE472: BNE .next_corner

;---------------------------------------------------------------------------------------------------

#_0AE474: LDY.w #$0000

.next_vertical_segment
#_0AE477: STZ.b $02

#_0AE479: LDA.w .tiles_vertical_border_address,Y
#_0AE47C: CLC
#_0AE47D: ADC.b $06
#_0AE47F: STA.b $04

.next_vertical_tile
#_0AE481: LDA.b $04
#_0AE483: CLC
#_0AE484: ADC.b $02
#_0AE486: AND.w #$0FFF
#_0AE489: TAX

#_0AE48A: LDA.w #$0F00
#_0AE48D: STA.l $7F0000,X

#_0AE491: LDA.w .tiles_vertical_border,Y
#_0AE494: AND.b $08
#_0AE496: STA.l $7F0000,X

#_0AE49A: INC.b $02
#_0AE49C: INC.b $02

#_0AE49E: LDA.b $02
#_0AE4A0: CMP.w #$0014
#_0AE4A3: BNE .next_vertical_tile

#_0AE4A5: INY
#_0AE4A6: INY
#_0AE4A7: CPY.w #$0004
#_0AE4AA: BNE .next_vertical_segment

;---------------------------------------------------------------------------------------------------

#_0AE4AC: LDY.w #$0000

.next_horizontal_segment
#_0AE4AF: STZ.b $02

#_0AE4B1: LDA.w .tiles_horizontal_border_address,Y
#_0AE4B4: CLC
#_0AE4B5: ADC.b $06
#_0AE4B7: STA.b $04

.next_horizontal_tile
#_0AE4B9: LDA.b $04
#_0AE4BB: CLC
#_0AE4BC: ADC.b $02
#_0AE4BE: AND.w #$0FFF
#_0AE4C1: TAX

#_0AE4C2: LDA.w #$0F00
#_0AE4C5: STA.l $7F0000,X

#_0AE4C9: LDA.w .tiles_horizontal_border,Y
#_0AE4CC: AND.b $08
#_0AE4CE: STA.l $7F0000,X

#_0AE4D2: LDA.b $02
#_0AE4D4: CLC
#_0AE4D5: ADC.w #$0040
#_0AE4D8: STA.b $02

#_0AE4DA: CMP.w #$0280
#_0AE4DD: BNE .next_horizontal_tile

#_0AE4DF: INY
#_0AE4E0: INY
#_0AE4E1: CPY.w #$0004
#_0AE4E4: BNE .next_horizontal_segment

;---------------------------------------------------------------------------------------------------

#_0AE4E6: SEP #$30

#_0AE4E8: RTS

;===================================================================================================

pool DungeonMap_DrawFloorNumbersByRoom

.floor_numbers
#_0AE4E9: dw $1F1E ; 1
#_0AE4EB: dw $1F1F ; 2
#_0AE4ED: dw $1F20 ; 3
#_0AE4EF: dw $1F21 ; 4
#_0AE4F1: dw $1F22 ; 5
#_0AE4F3: dw $1F23 ; 6
#_0AE4F5: dw $1F24 ; 7
#_0AE4F7: dw $1F25 ; 8

pool off

;---------------------------------------------------------------------------------------------------

DungeonMap_DrawFloorNumbersByRoom:
#_0AE4F9: REP #$30

#_0AE4FB: LDA.w #$00DE
#_0AE4FE: STA.b $00

.delete_next_letter
#_0AE500: LDA.b $00
#_0AE502: CLC
#_0AE503: ADC.b $06
#_0AE505: AND.w #$0FFF
#_0AE508: TAX

#_0AE509: LDA.w #$0F00
#_0AE50C: STA.l $7F0000,X
#_0AE510: STA.l $7F0002,X

#_0AE514: LDA.b $00
#_0AE516: CLC
#_0AE517: ADC.w #$0040
#_0AE51A: STA.b $00

#_0AE51C: CMP.w #$039E
#_0AE51F: BNE .delete_next_letter

;---------------------------------------------------------------------------------------------------

#_0AE521: LDA.w $020E
#_0AE524: AND.w #$0080
#_0AE527: BEQ .above_ground_floor

#_0AE529: LDA.w #$1F1C ; letter B
#_0AE52C: BRA .write_char

.above_ground_floor
#_0AE52E: LDA.w $020E
#_0AE531: AND.w #$000F
#_0AE534: ASL A
#_0AE535: TAY

#_0AE536: LDA.w .floor_numbers,Y

.write_char
#_0AE539: PHA

#_0AE53A: LDA.w #$035E
#_0AE53D: CLC
#_0AE53E: ADC.b $06

#_0AE540: AND.w #$0FFF
#_0AE543: TAX

#_0AE544: PLA
#_0AE545: AND.b $08
#_0AE547: STA.l $7F0000,X

;---------------------------------------------------------------------------------------------------

#_0AE54B: LDA.w $020E
#_0AE54E: AND.w #$0080
#_0AE551: BEQ .above_ground_again

#_0AE553: LDA.w $020E
#_0AE556: AND.w #$00FF
#_0AE559: EOR.w #$00FF
#_0AE55C: ASL A
#_0AE55D: TAY

#_0AE55E: LDA.w .floor_numbers,Y
#_0AE561: BRA .write_second_character

.above_ground_again
#_0AE563: LDA.w #$1F1D ; letter F

.write_second_character
#_0AE566: AND.b $08
#_0AE568: STA.l $7F0002,X

#_0AE56C: SEP #$30

#_0AE56E: RTS

;===================================================================================================

pool DungeonMap_DrawDungeonLayout

.row_offset
#_0AE56F: dw $0124
#_0AE571: dw $01A4
#_0AE573: dw $0224
#_0AE575: dw $02A4
#_0AE577: dw $0324

pool off

;---------------------------------------------------------------------------------------------------

DungeonMap_DrawDungeonLayout:
#_0AE579: REP #$30

#_0AE57B: STZ.b $00

.next_row_of_rooms
#_0AE57D: LDA.b $00
#_0AE57F: ASL A
#_0AE580: TAX

#_0AE581: LDA.w .row_offset,X
#_0AE584: CLC
#_0AE585: ADC.b $06
#_0AE587: AND.w #$0FFF
#_0AE58A: TAX

#_0AE58B: JSR DungeonMap_DrawSingleRowOfRooms

#_0AE58E: INC.b $00

#_0AE590: LDA.b $00
#_0AE592: CMP.w #$0005
#_0AE595: BNE .next_row_of_rooms

#_0AE597: SEP #$30

#_0AE599: RTS

;===================================================================================================

pool DungeonMap_DrawSingleRowOfRooms

.row_draw_offset
#_0AE59A: dw $0000
#_0AE59C: dw $0005
#_0AE59E: dw $000A
#_0AE5A0: dw $000F
#_0AE5A2: dw $0014

.unused
#_0AE5A4: dw $0000, $0032, $0064, $0096
#_0AE5AC: dw $00C8, $00FA, $012C, $015E
#_0AE5B4: dw $0190, $0300, $0B00, $0F00

pool off

;---------------------------------------------------------------------------------------------------

DungeonMap_DrawSingleRowOfRooms:
#_0AE5BC: REP #$30

#_0AE5BE: STZ.b $02

.next_room
#_0AE5C0: STZ.b $0E

#_0AE5C2: PHX

#_0AE5C3: LDA.b $00
#_0AE5C5: ASL A
#_0AE5C6: TAX

#_0AE5C7: LDA.b $02
#_0AE5C9: ADC.w .row_draw_offset,X
#_0AE5CC: STA.b $04

#_0AE5CE: SEP #$20

#_0AE5D0: LDX.w $040C

#_0AE5D3: LDA.w DungeonMapFloorCountData,X
#_0AE5D6: AND.b #$0F

#_0AE5D8: CLC
#_0AE5D9: ADC.w $020E

#_0AE5DC: ASL A
#_0AE5DD: STA.b $0E

#_0AE5DF: TAY

#_0AE5E0: REP #$20

#_0AE5E2: LDA.w DungeonMapRoomPointers,X
#_0AE5E5: STA.b $0C

#_0AE5E7: LDA.w DungeonMapFloorToDataOffset,Y
#_0AE5EA: CLC
#_0AE5EB: ADC.b $04
#_0AE5ED: TAY

#_0AE5EE: SEP #$20

#_0AE5F0: LDA.b ($0C),Y
#_0AE5F2: CMP.b #$0F
#_0AE5F4: BNE .valid_room

#_0AE5F6: REP #$20

#_0AE5F8: LDA.w #$0051
#_0AE5FB: BRA .shift_empty_room

.valid_room
#_0AE5FD: REP #$20

#_0AE5FF: AND.w #$00FF
#_0AE602: STA.b $CA

#_0AE604: ASL A
#_0AE605: PHA

#_0AE606: LDA.b $CA
#_0AE608: ASL A
#_0AE609: TAX

#_0AE60A: LDA.l $7EF000,X
#_0AE60E: AND.w #$000F

#_0AE611: STA.b $0E

#_0AE613: PLA
#_0AE614: BRA .is_valid

.shift_empty_room
#_0AE616: ASL A
#_0AE617: ASL A
#_0AE618: ASL A
#_0AE619: TAY

#_0AE61A: BRA .continue_with_empty_room

;---------------------------------------------------------------------------------------------------

.is_valid
#_0AE61C: STZ.b $C8

#_0AE61E: LDY.w #$0000
#_0AE621: LDX.w $040C

#_0AE624: LDA.w DungeonMapRoomPointers,X
#_0AE627: STA.b $0C

.check_next_room
#_0AE629: SEP #$20

#_0AE62B: LDA.b ($0C),Y
#_0AE62D: CMP.b #$0F
#_0AE62F: BNE .draw_this_room

#_0AE631: INY
#_0AE632: BRA .check_next_room

.draw_this_room
#_0AE634: CMP.b $CA
#_0AE636: BEQ .room_matches

#_0AE638: INC.b $C8

#_0AE63A: INY

#_0AE63B: BRA .check_next_room

.room_matches
#_0AE63D: REP #$20

#_0AE63F: LDA.w DungeonMapRoomLayoutPointers,X
#_0AE642: STA.b $0C

#_0AE644: LDA.b $C8
#_0AE646: TAY

#_0AE647: SEP #$20

#_0AE649: LDA.b ($0C),Y

#_0AE64B: REP #$20

#_0AE64D: ASL A
#_0AE64E: ASL A
#_0AE64F: ASL A
#_0AE650: TAY

.continue_with_empty_room
#_0AE651: PLX

#_0AE652: LDA.w DungeonMap_RoomTemplates+0,Y
#_0AE655: STA.b $0C

#_0AE657: PHA

;---------------------------------------------------------------------------------------------------

#_0AE658: CMP.w #$0B00
#_0AE65B: BEQ .empty_quad_nw

#_0AE65D: LDA.b $0E
#_0AE65F: AND.w #$0008
#_0AE662: BNE .empty_quad_nw

#_0AE664: LDA.b $0C
#_0AE666: AND.w #$1000
#_0AE669: BNE .visited_pal_nw

#_0AE66B: LDA.w #$0400
#_0AE66E: STA.b $0C
#_0AE670: BRA .check_visit_nw

.visited_pal_nw
#_0AE672: PHX

#_0AE673: LDX.w $040C

#_0AE676: LDA.l $7EF368
#_0AE67A: AND.l DungeonMask,X
#_0AE67E: BEQ .missing_map_nw

#_0AE680: PLX
#_0AE681: PLA

#_0AE682: LDA.b $0C
#_0AE684: AND.w #$E3FF
#_0AE687: ORA.w #$0C00
#_0AE68A: BRA .write_char_nw

.missing_map_nw
#_0AE68C: PLX

.empty_quad_nw
#_0AE68D: STZ.b $0C

.check_visit_nw
#_0AE68F: PLA
#_0AE690: CLC
#_0AE691: ADC.b $0C

#_0AE693: PHX

#_0AE694: STA.b $0C

#_0AE696: LDX.w $040C

#_0AE699: LDA.l $7EF368
#_0AE69D: AND.l DungeonMask,X
#_0AE6A1: BNE .quadrant_visited_nw

#_0AE6A3: LDA.b $0E
#_0AE6A5: AND.w #$0008
#_0AE6A8: BNE .quadrant_visited_nw

#_0AE6AA: LDA.w #$0B00
#_0AE6AD: BRA .quadrant_unvisited_nw

.quadrant_visited_nw
#_0AE6AF: LDA.b $0C

.quadrant_unvisited_nw
#_0AE6B1: PLX

.write_char_nw
#_0AE6B2: STA.l $7F0000,X

;---------------------------------------------------------------------------------------------------

#_0AE6B6: LDA.w DungeonMap_RoomTemplates+2,Y
#_0AE6B9: STA.b $0C

#_0AE6BB: PHA

#_0AE6BC: CMP.w #$0B00
#_0AE6BF: BEQ .empty_quad_ne

#_0AE6C1: LDA.b $0E
#_0AE6C3: AND.w #$0004
#_0AE6C6: BNE .empty_quad_ne

#_0AE6C8: LDA.b $0C
#_0AE6CA: AND.w #$1000
#_0AE6CD: BNE .visited_pal_ne

#_0AE6CF: LDA.w #$0400
#_0AE6D2: STA.b $0C

#_0AE6D4: BRA .check_visit_ne

.visited_pal_ne
#_0AE6D6: PHX

#_0AE6D7: LDX.w $040C

#_0AE6DA: LDA.l $7EF368
#_0AE6DE: AND.l DungeonMask,X
#_0AE6E2: BEQ .missing_map_ne

#_0AE6E4: PLX
#_0AE6E5: PLA

#_0AE6E6: LDA.b $0C
#_0AE6E8: AND.w #$E3FF
#_0AE6EB: ORA.w #$0C00
#_0AE6EE: BRA .write_char_ne

.missing_map_ne
#_0AE6F0: PLX

.empty_quad_ne
#_0AE6F1: STZ.b $0C

.check_visit_ne
#_0AE6F3: PLA
#_0AE6F4: CLC
#_0AE6F5: ADC.b $0C

#_0AE6F7: PHX

#_0AE6F8: STA.b $0C

#_0AE6FA: LDX.w $040C

#_0AE6FD: LDA.l $7EF368
#_0AE701: AND.l DungeonMask,X
#_0AE705: BNE .quadrant_visited_ne

#_0AE707: LDA.b $0E
#_0AE709: AND.w #$0004
#_0AE70C: BNE .quadrant_visited_ne

#_0AE70E: LDA.w #$0B00

#_0AE711: BRA .quadrant_unvisited_ne

.quadrant_visited_ne
#_0AE713: LDA.b $0C

.quadrant_unvisited_ne
#_0AE715: PLX

.write_char_ne
#_0AE716: STA.l $7F0002,X

;---------------------------------------------------------------------------------------------------

#_0AE71A: LDA.w DungeonMap_RoomTemplates+4,Y
#_0AE71D: STA.b $0C

#_0AE71F: PHA

#_0AE720: CMP.w #$0B00
#_0AE723: BEQ .empty_quad_sw

#_0AE725: LDA.b $0E
#_0AE727: AND.w #$0002
#_0AE72A: BNE .empty_quad_sw

#_0AE72C: LDA.b $0C
#_0AE72E: AND.w #$1000
#_0AE731: BNE .visited_pal_sw

#_0AE733: LDA.w #$0400
#_0AE736: STA.b $0C

#_0AE738: BRA .check_visit_sw

.visited_pal_sw
#_0AE73A: PHX

#_0AE73B: LDX.w $040C

#_0AE73E: LDA.l $7EF368
#_0AE742: AND.l DungeonMask,X
#_0AE746: BEQ .missing_map_sw

#_0AE748: PLX
#_0AE749: PLA

#_0AE74A: LDA.b $0C
#_0AE74C: AND.w #$E3FF
#_0AE74F: ORA.w #$0C00
#_0AE752: BRA .write_char_sw

.missing_map_sw
#_0AE754: PLX

.empty_quad_sw
#_0AE755: STZ.b $0C

.check_visit_sw
#_0AE757: PLA
#_0AE758: CLC
#_0AE759: ADC.b $0C

#_0AE75B: PHX

#_0AE75C: STA.b $0C

#_0AE75E: LDX.w $040C

#_0AE761: LDA.l $7EF368
#_0AE765: AND.l DungeonMask,X
#_0AE769: BNE .quadrant_visited_sw

#_0AE76B: LDA.b $0E
#_0AE76D: AND.w #$0002
#_0AE770: BNE .quadrant_visited_sw

#_0AE772: LDA.w #$0B00

#_0AE775: BRA .quadrant_unvisited_sw

.quadrant_visited_sw
#_0AE777: LDA.b $0C

.quadrant_unvisited_sw
#_0AE779: PLX

.write_char_sw
#_0AE77A: STA.l $7F0040,X

;---------------------------------------------------------------------------------------------------

#_0AE77E: LDA.w DungeonMap_RoomTemplates+6,Y
#_0AE781: STA.b $0C

#_0AE783: PHA

#_0AE784: CMP.w #$0B00
#_0AE787: BEQ .empty_quad_se

#_0AE789: LDA.b $0E
#_0AE78B: AND.w #$0001
#_0AE78E: BNE .empty_quad_se

#_0AE790: LDA.b $0C
#_0AE792: AND.w #$1000
#_0AE795: BNE .visited_pal_se

#_0AE797: LDA.w #$0400
#_0AE79A: STA.b $0C

#_0AE79C: BRA .check_visit_se

.visited_pal_se
#_0AE79E: PHX

#_0AE79F: LDX.w $040C

#_0AE7A2: LDA.l $7EF368
#_0AE7A6: AND.l DungeonMask,X
#_0AE7AA: BEQ .missing_map_se

#_0AE7AC: PLX
#_0AE7AD: PLA

#_0AE7AE: LDA.b $0C
#_0AE7B0: AND.w #$E3FF
#_0AE7B3: ORA.w #$0C00

#_0AE7B6: BRA .write_char_se

.missing_map_se
#_0AE7B8: PLX

.empty_quad_se
#_0AE7B9: STZ.b $0C

.check_visit_se
#_0AE7BB: PLA
#_0AE7BC: CLC
#_0AE7BD: ADC.b $0C

#_0AE7BF: PHX

#_0AE7C0: STA.b $0C

#_0AE7C2: LDX.w $040C

#_0AE7C5: LDA.l $7EF368
#_0AE7C9: AND.l DungeonMask,X
#_0AE7CD: BNE .quadrant_visited_se

#_0AE7CF: LDA.b $0E
#_0AE7D1: AND.w #$0001
#_0AE7D4: BNE .quadrant_visited_se

#_0AE7D6: LDA.w #$0B00

#_0AE7D9: BRA .quadrant_unvisited_se

.quadrant_visited_se
#_0AE7DB: LDA.b $0C

.quadrant_unvisited_se
#_0AE7DD: PLX

.write_char_se
#_0AE7DE: STA.l $7F0042,X

;---------------------------------------------------------------------------------------------------

#_0AE7E2: INX
#_0AE7E3: INX
#_0AE7E4: INX
#_0AE7E5: INX

#_0AE7E6: INC.b $02

#_0AE7E8: LDA.b $02
#_0AE7EA: CMP.w #$0005
#_0AE7ED: BEQ .exit

#_0AE7EF: JMP.w .next_room

.exit
#_0AE7F2: RTS

;===================================================================================================

DungeonMapRoomMarkerYBase:
#_0AE7F3: dw $001F, $007F

;---------------------------------------------------------------------------------------------------

pool DungeonMap_DrawRoomMarkers

.offset_x_base
#_0AE7F7: dw $0090

.fairy_rooms
#_0AE7F9: dw $0089 ; ROOM 0089 - Eastern fairy room
#_0AE7FB: dw $00A7 ; ROOM 00A7 - Hera fairy room
#_0AE7FD: dw $004F ; ROOM 004F - Ice Palace fairy room

.fairy_room_replacements
#_0AE7FF: dw $00A9 ; ROOM 00A9 - Eastern big chest room
#_0AE801: dw $0077 ; ROOM 0077 - Hera lobby
#_0AE803: dw $00BE ; ROOM 00BE - Ice Palace block switch room

.floor_threshold
#_0AE805: dw $0004

pool off

;---------------------------------------------------------------------------------------------------

DungeonMapBossRooms:
#_0AE807: dw $000F ; ROOM 000F - Sewers: none
#_0AE809: dw $000F ; ROOM 000F - Castle: none
#_0AE80B: dw $00C8 ; ROOM 00C8 - Eastern
#_0AE80D: dw $0033 ; ROOM 0033 - Desert
#_0AE80F: dw $0020 ; ROOM 0020 - Agahnim's tower
#_0AE811: dw $0006 ; ROOM 0006 - Swamp palace
#_0AE813: dw $005A ; ROOM 005A - Palace of Darkness
#_0AE815: dw $0090 ; ROOM 0090 - Misery Mire
#_0AE817: dw $0029 ; ROOM 0029 - Skull Woods
#_0AE819: dw $00DE ; ROOM 00DE - Ice Palace
#_0AE81B: dw $0007 ; ROOM 0007 - Tower of Hera
#_0AE81D: dw $00AC ; ROOM 00AC - Thieves' Town
#_0AE81F: dw $00A4 ; ROOM 00A4 - Turtle Rock
#_0AE821: dw $000D ; ROOM 000D - Ganon's tower

;---------------------------------------------------------------------------------------------------

DungeonMap_DrawRoomMarkers:
#_0AE823: PHB
#_0AE824: PHK
#_0AE825: PLB

#_0AE826: REP #$10

#_0AE828: LDA.b #$00
#_0AE82A: XBA

#_0AE82B: LDX.w $040C

#_0AE82E: LDA.w DungeonMapFloorCountData,X
#_0AE831: AND.b #$0F
#_0AE833: CLC
#_0AE834: ADC.b $A4
#_0AE836: ASL A
#_0AE837: TAY

#_0AE838: STY.b $0C

#_0AE83A: REP #$20

#_0AE83C: STZ.b $00
#_0AE83E: STZ.b $02

;---------------------------------------------------------------------------------------------------

#_0AE840: PHY

#_0AE841: LDY.w .floor_threshold

#_0AE844: LDA.b $A0

.check_next
#_0AE846: CMP.w .fairy_rooms,Y
#_0AE849: BEQ .replace_this_room

#_0AE84B: DEY
#_0AE84C: DEY
#_0AE84D: BPL .check_next

#_0AE84F: BRA .no_replacements

.replace_this_room
#_0AE851: LDA.w .fairy_room_replacements,Y

.no_replacements
#_0AE854: STA.b $0E

;---------------------------------------------------------------------------------------------------

#_0AE856: PLY

#_0AE857: LDA.w DungeonMapRoomPointers,X
#_0AE85A: STA.b $04

#_0AE85C: LDA.w DungeonMapFloorToDataOffset,Y
#_0AE85F: TAY

#_0AE860: SEP #$20

.next_room_check
#_0AE862: LDA.b ($04),Y

#_0AE864: INY

#_0AE865: CMP.b $0E
#_0AE867: BEQ .is_this_room

#_0AE869: LDA.b $00
#_0AE86B: CMP.b #$40
#_0AE86D: BCC .dont_reset_row

#_0AE86F: STZ.b $00

#_0AE871: LDA.b $02
#_0AE873: CLC
#_0AE874: ADC.b #$10
#_0AE876: STA.b $02

#_0AE878: BRA .next_room_check

.dont_reset_row
#_0AE87A: CLC
#_0AE87B: ADC.b #$10
#_0AE87D: STA.b $00

#_0AE87F: BRA .next_room_check

;---------------------------------------------------------------------------------------------------

.is_this_room
#_0AE881: REP #$20

#_0AE883: LDA.b $00
#_0AE885: CLC
#_0AE886: ADC.w .offset_x_base
#_0AE889: STA.w $0215

#_0AE88C: LDA.b $22
#_0AE88E: AND.w #$01E0

#_0AE891: ASL A
#_0AE892: ASL A
#_0AE893: ASL A

#_0AE894: XBA
#_0AE895: CLC
#_0AE896: ADC.w $0215
#_0AE899: STA.w $0215

#_0AE89C: LDY.w $0211

#_0AE89F: LDA.b $02
#_0AE8A1: STA.w $0CF5

#_0AE8A4: CLC
#_0AE8A5: ADC.w DungeonMapRoomMarkerYBase,Y
#_0AE8A8: STA.w $0217

#_0AE8AB: LDA.b $20
#_0AE8AD: AND.w #$01E0

#_0AE8B0: ASL A
#_0AE8B1: ASL A
#_0AE8B2: ASL A

#_0AE8B3: XBA
#_0AE8B4: CLC
#_0AE8B5: ADC.w $0217
#_0AE8B8: STA.w $0217

;---------------------------------------------------------------------------------------------------

#_0AE8BB: SEP #$20

#_0AE8BD: LDA.b #$00
#_0AE8BF: XBA

#_0AE8C0: LDA.w DungeonMapFloorCountData,X
#_0AE8C3: AND.b #$0F
#_0AE8C5: CLC
#_0AE8C6: ADC.w DungeonMap_BossRoomFloor+0,X

#_0AE8C9: REP #$20

#_0AE8CB: ASL A
#_0AE8CC: TAY

#_0AE8CD: LDA.w DungeonMapRoomPointers,X
#_0AE8D0: CLC
#_0AE8D1: ADC.w DungeonMapFloorToDataOffset,Y
#_0AE8D4: STA.b $0E

;---------------------------------------------------------------------------------------------------

#_0AE8D6: SEP #$20

#_0AE8D8: LDA.b #$40
#_0AE8DA: STA.w $0FA8
#_0AE8DD: STZ.w $0FA9

#_0AE8E0: STA.w $0FAA
#_0AE8E3: STZ.w $0FAB

#_0AE8E6: LDY.w #$0018

.next_boss_room_check
#_0AE8E9: LDA.b ($0E),Y
#_0AE8EB: CMP.b #$0F
#_0AE8ED: BEQ .invalid_room

#_0AE8EF: CMP.w DungeonMapBossRooms,X
#_0AE8F2: BEQ .is_boss_room

.invalid_room
#_0AE8F4: LDA.w $0FA8
#_0AE8F7: SEC
#_0AE8F8: SBC.b #$10
#_0AE8FA: STA.w $0FA8
#_0AE8FD: BPL .dont_reset_row_b

#_0AE8FF: LDA.b #$40
#_0AE901: STA.w $0FA8

#_0AE904: LDA.w $0FAA
#_0AE907: SEC
#_0AE908: SBC.b #$10
#_0AE90A: STA.w $0FAA

.dont_reset_row_b
#_0AE90D: DEY
#_0AE90E: BPL .next_boss_room_check

;---------------------------------------------------------------------------------------------------

.is_boss_room
#_0AE910: STZ.b $02
#_0AE912: STZ.b $0F

#_0AE914: LDA.w $020E
#_0AE917: SEC
#_0AE918: SBC.w DungeonMap_BossRoomFloor+0,X
#_0AE91B: STA.b $0E

#_0AE91D: BPL .dont_invert

#_0AE91F: EOR.b #$FF
#_0AE921: INC A
#_0AE922: STA.b $0E

#_0AE924: INC.b $02
#_0AE926: INC.b $02

;---------------------------------------------------------------------------------------------------

.dont_invert
#_0AE928: SEP #$10

#_0AE92A: LDY.b $02

#_0AE92C: REP #$20

.adjust_next
#_0AE92E: DEC.b $0E
#_0AE930: BMI .done

#_0AE932: LDA.w $0FAA
#_0AE935: CLC
#_0AE936: ADC.w DungeonMap_PanValues,Y
#_0AE939: STA.w $0FAA

#_0AE93C: BRA .adjust_next

;---------------------------------------------------------------------------------------------------

.done
#_0AE93E: LDA.w $0FAA
#_0AE941: CLC
#_0AE942: ADC.w DungeonMapRoomMarkerYBase
#_0AE945: STA.w $0FAA

#_0AE948: SEP #$20

#_0AE94A: INC.w $0200

#_0AE94D: STZ.b $13
#_0AE94F: STZ.w $020D

#_0AE952: PLB

#_0AE953: RTL

;---------------------------------------------------------------------------------------------------

DungeonMap_HandleInputAndSprites:
#_0AE954: JSL DungeonMap_HandleInput

#_0AE958: JMP.w DungeonMap_DrawSprites

;===================================================================================================

DungeonMap_HandleInput:
#_0AE95B: PHB
#_0AE95C: PHK
#_0AE95D: PLB

#_0AE95E: LDA.b $F6
#_0AE960: AND.b #$40

#_0AE962: BNE .close_map

#_0AE964: JSL DungeonMap_HandleMovementInput

#_0AE968: PLB

#_0AE969: RTL

;---------------------------------------------------------------------------------------------------

.close_map
#_0AE96A: INC.w $0200
#_0AE96D: INC.w $0200
#_0AE970: STZ.w $020D

#_0AE973: PLB

#_0AE974: RTL

;===================================================================================================

DungeonMap_PanValues:
#_0AE975: dw  96
#_0AE977: dw -96

;===================================================================================================

DungeonMap_HandleMovementInput:
#_0AE979: JSL DungeonMap_HandleFloorSelect

#_0AE97D: LDA.w $0210
#_0AE980: BEQ .exit

#_0AE982: JMP.w DungeonMap_ScrollFloors

.exit
#_0AE985: RTL

;===================================================================================================

DungeonMap_HandleFloorSelect:
#_0AE986: REP #$30

#_0AE988: LDX.w $040C

#_0AE98B: LDA.w DungeonMapFloorCountData,X
#_0AE98E: AND.w #$00F0
#_0AE991: LSR A
#_0AE992: LSR A
#_0AE993: LSR A
#_0AE994: LSR A
#_0AE995: STA.b $00

#_0AE997: LDA.w DungeonMapFloorCountData,X
#_0AE99A: AND.w #$000F
#_0AE99D: CLC
#_0AE99E: ADC.b $00

#_0AE9A0: CMP.w #$0003
#_0AE9A3: BMI .ignore_input

;---------------------------------------------------------------------------------------------------

#_0AE9A5: SEP #$30

#_0AE9A7: LDA.w $0210
#_0AE9AA: BNE .ignore_input

#_0AE9AC: LDA.b $F0
#_0AE9AE: AND.b #$0C
#_0AE9B0: BNE .pressed_up_or_down

;---------------------------------------------------------------------------------------------------

.ignore_input
#_0AE9B2: JMP.w .proceed_to_exit

;---------------------------------------------------------------------------------------------------

.pressed_up_or_down
#_0AE9B5: STA.b $0A

#_0AE9B7: STZ.w $020F

#_0AE9BA: AND.b #$08
#_0AE9BC: BEQ .didnt_press_up

;---------------------------------------------------------------------------------------------------

#_0AE9BE: REP #$30

#_0AE9C0: LDX.w $040C

#_0AE9C3: LDA.w DungeonMapFloorCountData,X
#_0AE9C6: AND.w #$00F0

#_0AE9C9: LSR A
#_0AE9CA: LSR A
#_0AE9CB: LSR A
#_0AE9CC: LSR A

#_0AE9CD: DEC A
#_0AE9CE: CMP.w $020E
#_0AE9D1: BNE .continue_a

#_0AE9D3: JMP.w .proceed_to_exit

;---------------------------------------------------------------------------------------------------

.continue_a
#_0AE9D6: INC.w $020E

#_0AE9D9: LDA.b $06
#_0AE9DB: SEC
#_0AE9DC: SBC.w #$0300
#_0AE9DF: AND.w #$0FFF
#_0AE9E2: STA.b $06

#_0AE9E4: BRA .continue_b

;---------------------------------------------------------------------------------------------------

.didnt_press_up
#_0AE9E6: REP #$30

#_0AE9E8: LDX.w $040C

#_0AE9EB: LDA.w DungeonMapFloorCountData,X
#_0AE9EE: AND.w #$000F
#_0AE9F1: EOR.w #$00FF

#_0AE9F4: INC A
#_0AE9F5: INC A
#_0AE9F6: AND.w #$00FF

#_0AE9F9: CMP.w $020E
#_0AE9FC: BEQ .proceed_to_exit

#_0AE9FE: DEC.w $020E
#_0AEA01: DEC.w $020E

#_0AEA04: LDA.b $06
#_0AEA06: CLC
#_0AEA07: ADC.w #$0600
#_0AEA0A: AND.w #$0FFF
#_0AEA0D: STA.b $06

;---------------------------------------------------------------------------------------------------

.continue_b
#_0AEA0F: SEP #$20

#_0AEA11: LDA.w $020E
#_0AEA14: CMP.b $A4
#_0AEA16: BNE .useless_floor_level_check

#_0AEA18: REP #$20

#_0AEA1A: BRA .check_useless_property

.useless_floor_level_check
#_0AEA1C: BMI .useless_bitmode_branch

#_0AEA1E: REP #$20

#_0AEA20: BRA .check_useless_property

;---------------------------------------------------------------------------------------------------

.useless_bitmode_branch
#_0AEA22: REP #$20

.check_useless_property
#_0AEA24: LDA.w $020E
#_0AEA27: AND.w #$0080
#_0AEA2A: BNE .useless_property_change

#_0AEA2C: LDA.w #$EFFF
#_0AEA2F: STA.b $08

#_0AEA31: BRA .ignore_useless_property_change

.useless_property_change
#_0AEA33: LDA.w #$EFFF
#_0AEA36: STA.b $08

.ignore_useless_property_change
#_0AEA38: SEP #$20

#_0AEA3A: JSR DungeonMap_DrawFloorNumbersByRoom
#_0AEA3D: JSR DungeonMap_DrawBorderForRooms
#_0AEA40: JSR DungeonMap_DrawDungeonLayout

#_0AEA43: SEP #$20

#_0AEA45: INC.w $0210

#_0AEA48: LDA.b $0A
#_0AEA4A: AND.b #$08
#_0AEA4C: LSR A
#_0AEA4D: LSR A
#_0AEA4E: TAX

#_0AEA4F: REP #$30

#_0AEA51: LDA.b $E8
#_0AEA53: CLC
#_0AEA54: ADC.w DungeonMap_PanValues,X
#_0AEA57: STA.w $0213

#_0AEA5A: LDA.b $0A
#_0AEA5C: AND.w #$0008
#_0AEA5F: BNE .pressed_up

#_0AEA61: LDA.b $06
#_0AEA63: SEC
#_0AEA64: SBC.w #$0300
#_0AEA67: AND.w #$0FFF
#_0AEA6A: STA.b $06

#_0AEA6C: INC.w $020E

;---------------------------------------------------------------------------------------------------

.pressed_up
#_0AEA6F: SEP #$20

#_0AEA71: LDA.b #$08
#_0AEA73: STA.b $17

.proceed_to_exit
#_0AEA75: BRA EXIT_0AEAAF

;===================================================================================================

pool DungeonMap_ScrollFloors

.speed_bg
#_0AEA77: dw   4 ; down
#_0AEA79: dw  -4 ; up

.speed_sprites
#_0AEA7B: dw  -4 ; down
#_0AEA7D: dw   4 ; up

pool off

;---------------------------------------------------------------------------------------------------

DungeonMap_ScrollFloors:
#_0AEA7F: REP #$30

#_0AEA81: LDA.b $0A
#_0AEA83: AND.w #$0008
#_0AEA86: LSR A
#_0AEA87: LSR A
#_0AEA88: TAX

#_0AEA89: LDA.w $0217
#_0AEA8C: CLC
#_0AEA8D: ADC.w .speed_sprites,X
#_0AEA90: STA.w $0217

#_0AEA93: LDA.w $0FAA
#_0AEA96: CLC
#_0AEA97: ADC.w .speed_sprites,X
#_0AEA9A: STA.w $0FAA

#_0AEA9D: LDA.b $E8
#_0AEA9F: CLC
#_0AEAA0: ADC.w .speed_bg,X
#_0AEAA3: STA.b $E8

#_0AEAA5: CMP.w $0213
#_0AEAA8: BNE EXIT_0AEAAF

#_0AEAAA: SEP #$20

#_0AEAAC: STZ.w $0210

;---------------------------------------------------------------------------------------------------

#EXIT_0AEAAF:
#_0AEAAF: SEP #$30

#_0AEAB1: RTL

;===================================================================================================

DungeonMap_DrawSprites:
#_0AEAB2: PHB
#_0AEAB3: PHK
#_0AEAB4: PLB

#_0AEAB5: REP #$10

#_0AEAB7: LDX.w $040C

#_0AEABA: LDA.w DungeonMapFloorCountData,X

#_0AEABD: AND.b #$0F
#_0AEABF: STA.b $02

#_0AEAC1: CLC
#_0AEAC2: ADC.b $A4
#_0AEAC4: STA.b $01
#_0AEAC6: STA.b $03

;---------------------------------------------------------------------------------------------------

#_0AEAC8: SEP #$10

#_0AEACA: STZ.b $00
#_0AEACC: STZ.b $0E

#_0AEACE: JSR DungeonMap_DrawLinkPointing

#_0AEAD1: INC.b $00

.next_marker
#_0AEAD3: JSR DungeonMap_DrawLocationMarker

#_0AEAD6: INC.b $0E

#_0AEAD8: LDA.b $00
#_0AEADA: CMP.b #$09
#_0AEADC: BNE .next_marker

#_0AEADE: JSR DungeonMap_DrawBlinkingIndicator

#_0AEAE1: INC.b $00

#_0AEAE3: JSR DungeonMap_DrawBossIcon
#_0AEAE6: JSR DungeonMap_DrawFloorNumberObjects
#_0AEAE9: JSR DungeonMap_DrawFloorBlinker

#_0AEAEC: PLB

#_0AEAED: RTL

;===================================================================================================

LinkPointingPositionX:
#_0AEAEE: db $19

DrawBossIconByFloor_position_x:
#_0AEAEF: db $4C

;===================================================================================================

DungeonMap_DrawLinkPointing:
#_0AEAF0: REP #$10

#_0AEAF2: LDA.b #$04
#_0AEAF4: SEC
#_0AEAF5: SBC.b $02
#_0AEAF7: BMI .y_offset_done

#_0AEAF9: CLC
#_0AEAFA: ADC.b $03
#_0AEAFC: STA.b $03

#_0AEAFE: LDA.w DungeonMapFloorCountData,X

#_0AEB01: LSR A
#_0AEB02: LSR A
#_0AEB03: LSR A
#_0AEB04: LSR A

#_0AEB05: SEC
#_0AEB06: SBC.b #$04
#_0AEB08: BMI .y_offset_done

#_0AEB0A: SEC
#_0AEB0B: SBC.b $03

#_0AEB0D: EOR.b #$FF
#_0AEB0F: INC A
#_0AEB10: STA.b $03

;---------------------------------------------------------------------------------------------------

.y_offset_done
#_0AEB12: SEP #$10

#_0AEB14: LDX.b $00

#_0AEB16: LDA.b #$02
#_0AEB18: STA.w $0A20,X

#_0AEB1B: TXA
#_0AEB1C: ASL A
#_0AEB1D: ASL A
#_0AEB1E: TAX

#_0AEB1F: LDA.w LinkPointingPositionX
#_0AEB22: STA.w $0800,X

#_0AEB25: LDY.b $03

#_0AEB27: LDA.w FloorIconOffsetY,Y
#_0AEB2A: SEC
#_0AEB2B: SBC.b #$04

#_0AEB2D: STA.w $0801,X
#_0AEB30: STZ.w $0802,X

#_0AEB33: LDA.b #$3E

#_0AEB35: LDY.w $0ABD
#_0AEB38: BEQ .set_priority

#_0AEB3A: LDA.b #$30

.set_priority
#_0AEB3C: STA.w $0803,X

#_0AEB3F: RTS

;===================================================================================================

pool DungeonMap_DrawBlinkingIndicator

.tile
#_0AEB40: db $34, $35, $36, $34
#_0AEB44: db $31, $32, $33, $32

.prop
#_0AEB48: db $39, $3B, $3D, $3B
#_0AEB4C: db $3B, $3B, $3B, $3B

pool off

;---------------------------------------------------------------------------------------------------

DungeonMap_DrawBlinkingIndicator:
#_0AEB50: LDX.b $00

#_0AEB52: LDA.b #$00
#_0AEB54: STA.w $0A20,X

#_0AEB57: TXA
#_0AEB58: ASL A
#_0AEB59: ASL A
#_0AEB5A: TAX

#_0AEB5B: LDA.w $0215
#_0AEB5E: SEC
#_0AEB5F: SBC.b #$03
#_0AEB61: STA.w $0800,X

;---------------------------------------------------------------------------------------------------

#_0AEB64: LDA.w $0218
#_0AEB67: BEQ .on_screen

#_0AEB69: LDA.b #$F0
#_0AEB6B: BRA .continue

.on_screen
#_0AEB6D: LDA.w $0217

;---------------------------------------------------------------------------------------------------

.continue
#_0AEB70: SEC
#_0AEB71: SBC.b #$03
#_0AEB73: STA.w $0801,X

#_0AEB76: LDA.b $1A
#_0AEB78: AND.b #$0C
#_0AEB7A: LSR A
#_0AEB7B: LSR A
#_0AEB7C: TAY

#_0AEB7D: LDA.w .tile
#_0AEB80: STA.w $0802,X

#_0AEB83: LDA.w .prop,Y
#_0AEB86: STA.w $0803,X

#_0AEB89: RTS

;===================================================================================================

pool DungeonMap_DrawLocationMarker

.offset_x
#_0AEB8A: db  -9 ; top left
#_0AEB8B: db   8 ; top right
#_0AEB8C: db  -9 ; bottom left
#_0AEB8D: db   8 ; bottom right

.offset_y
#_0AEB8E: db  -8 ; top left
#_0AEB8F: db  -8 ; top right
#_0AEB90: db   9 ; bottom left
#_0AEB91: db   9 ; bottom right

.props
#_0AEB92: db $F1 ; top left
#_0AEB93: db $B1 ; top right
#_0AEB94: db $71 ; bottom left
#_0AEB95: db $31 ; bottom right

.palette_flash
#_0AEB96: db $0C, $0C
#_0AEB98: db $08, $0A

.unsued
#_0AEB9A: dw $0000, $0060, $00C0, $0120
#_0AEBA2: dw $0180, $01E0, $0240

pool off

;---------------------------------------------------------------------------------------------------

DungeonMap_DrawLocationMarker:
#_0AEBA8: LDY.b #$03

.next_object
#_0AEBAA: LDA.b $00
#_0AEBAC: TAX

#_0AEBAD: LDA.b #$02
#_0AEBAF: STA.w $0A20,X

#_0AEBB2: TXA
#_0AEBB3: ASL A
#_0AEBB4: ASL A
#_0AEBB5: TAX

#_0AEBB6: LDA.w $0215
#_0AEBB9: AND.b #$F0
#_0AEBBB: CLC
#_0AEBBC: ADC.w .offset_x,Y
#_0AEBBF: STA.w $0800,X

#_0AEBC2: PHY

#_0AEBC3: LDA.b $0E
#_0AEBC5: ASL A
#_0AEBC6: TAY

#_0AEBC7: LDA.w $0CF5
#_0AEBCA: CLC
#_0AEBCB: ADC.w DungeonMapRoomMarkerYBase,Y
#_0AEBCE: STA.b $0F

#_0AEBD0: PLY

#_0AEBD1: CLC
#_0AEBD2: ADC.w .offset_y,Y
#_0AEBD5: STA.w $0801,X

#_0AEBD8: STZ.w $0802,X

#_0AEBDB: LDA.w .props,Y
#_0AEBDE: STA.b $0C

#_0AEBE0: PHY

#_0AEBE1: LDA.b $1A
#_0AEBE3: LSR A
#_0AEBE4: LSR A
#_0AEBE5: AND.b #$01
#_0AEBE7: TAY

#_0AEBE8: INC.b $0F

#_0AEBEA: LDA.w $0217
#_0AEBED: INC A
#_0AEBEE: AND.b #$F0
#_0AEBF0: CMP.b $0F
#_0AEBF2: BNE .use_set_a

#_0AEBF4: LDA.w $0218
#_0AEBF7: BNE .use_set_a

#_0AEBF9: INY
#_0AEBFA: INY

.use_set_a
#_0AEBFB: LDA.b $0C
#_0AEBFD: ORA.w .palette_flash,Y
#_0AEC00: STA.w $0803,X

#_0AEC03: PLY

#_0AEC04: INC.b $00

#_0AEC06: DEY
#_0AEC07: BPL .next_object

#_0AEC09: RTS

;===================================================================================================

DungeonMap_DrawFloorNumberObjects:
#_0AEC0A: REP #$10

#_0AEC0C: LDX.w $040C

#_0AEC0F: LDA.w DungeonMapFloorCountData,X
#_0AEC12: PHA

#_0AEC13: LSR A
#_0AEC14: LSR A
#_0AEC15: LSR A
#_0AEC16: LSR A
#_0AEC17: STA.b $02

#_0AEC19: PLA
#_0AEC1A: AND.b #$0F
#_0AEC1C: STA.b $03

#_0AEC1E: SEP #$10

#_0AEC20: LDY.b #$07

#_0AEC22: LDA.b $02
#_0AEC24: CLC
#_0AEC25: ADC.b $03
#_0AEC27: CMP.b #$08
#_0AEC29: BEQ .start_draw

#_0AEC2B: LDA.b $02
#_0AEC2D: CMP.b #$04
#_0AEC2F: BPL .start_draw

#_0AEC31: DEY

#_0AEC32: LDX.b #$03
#_0AEC34: STX.b $04

.count_floors_above
#_0AEC36: CMP.b $04
#_0AEC38: BEQ .done_floors_above

#_0AEC3A: DEY
#_0AEC3B: DEC.b $04
#_0AEC3D: BNE .count_floors_above

.done_floors_above
#_0AEC3F: LDA.b $03
#_0AEC41: CMP.b #$05
#_0AEC43: BMI .start_draw

#_0AEC45: LDX.b #$05
#_0AEC47: STX.b $04

.count_floors_below
#_0AEC49: CMP.b $04
#_0AEC4B: BEQ .start_draw

#_0AEC4D: INY

#_0AEC4E: INC.b $04
#_0AEC50: CMP.b #$08
#_0AEC52: BNE .count_floors_below

;---------------------------------------------------------------------------------------------------

.start_draw
#_0AEC54: LDA.w FloorIconOffsetY,Y
#_0AEC57: INC A
#_0AEC58: STA.b $04

#_0AEC5A: DEC.b $02

#_0AEC5C: LDA.b $03
#_0AEC5E: EOR.b #$FF
#_0AEC60: INC A
#_0AEC61: STA.b $03

;---------------------------------------------------------------------------------------------------

.next
#_0AEC63: LDX.b $00

#_0AEC65: LDA.b #$00
#_0AEC67: STA.w $0A20,X
#_0AEC6A: STA.w $0A21,X

#_0AEC6D: TXA
#_0AEC6E: ASL A
#_0AEC6F: ASL A
#_0AEC70: TAX

#_0AEC71: LDA.b #$30
#_0AEC73: STA.w $0800,X

#_0AEC76: LDA.b #$38
#_0AEC78: STA.w $0804,X

#_0AEC7B: LDA.b $04
#_0AEC7D: STA.w $0801,X
#_0AEC80: STA.w $0805,X

#_0AEC83: CLC
#_0AEC84: ADC.b #$10
#_0AEC86: STA.b $04

#_0AEC88: LDA.b #$3D
#_0AEC8A: STA.w $0803,X
#_0AEC8D: STA.w $0807,X

#_0AEC90: LDA.b #$1C
#_0AEC92: STA.w $0802,X

#_0AEC95: LDA.b #$1D
#_0AEC97: STA.w $0806,X

#_0AEC9A: LDY.b $02
#_0AEC9C: BMI .negative

#_0AEC9E: LDA.w FloorNumberOAMChar,Y
#_0AECA1: STA.w $0802,X

#_0AECA4: BRA .to_next

.negative
#_0AECA6: TYA
#_0AECA7: EOR.b #$FF
#_0AECA9: TAY

#_0AECAA: LDA.w FloorNumberOAMChar,Y
#_0AECAD: STA.w $0806,X

.to_next
#_0AECB0: INC.b $00
#_0AECB2: INC.b $00

#_0AECB4: DEC.b $02

#_0AECB6: LDA.b $02
#_0AECB8: INC A
#_0AECB9: CMP.b $03
#_0AECBB: BNE .next

#_0AECBD: RTS

;===================================================================================================

FloorIconOffsetY:
#_0AECBE: db $BB
#_0AECBF: db $AB
#_0AECC0: db $9B
#_0AECC1: db $8B
#_0AECC2: db $7B
#_0AECC3: db $6B
#_0AECC4: db $5B
#_0AECC5: db $4B

;---------------------------------------------------------------------------------------------------

FloorNumberOAMChar:
#_0AECC6: db $1E ; 1
#_0AECC7: db $1F ; 2
#_0AECC8: db $20 ; 3
#_0AECC9: db $21 ; 4
#_0AECCA: db $22 ; 5
#_0AECCB: db $23 ; 6
#_0AECCC: db $24 ; 7
#_0AECCD: db $25 ; 8

;---------------------------------------------------------------------------------------------------

FloorNumberBlinkProps:
#_0AECCE: db $3D

;===================================================================================================

DungeonMap_DrawFloorBlinker:
#_0AECCF: LDA.b $00
#_0AECD1: STA.b $05

#_0AECD3: LDA.w $020E
#_0AECD6: STA.b $03

#_0AECD8: LDY.b #$00

#_0AECDA: REP #$10

#_0AECDC: LDX.w $040C

#_0AECDF: LDA.w DungeonMapFloorCountData,X
#_0AECE2: LSR A
#_0AECE3: LSR A
#_0AECE4: LSR A
#_0AECE5: LSR A
#_0AECE6: STA.b $02

#_0AECE8: LDA.w DungeonMapFloorCountData,X
#_0AECEB: AND.b #$0F

#_0AECED: SEP #$10

#_0AECEF: CLC
#_0AECF0: ADC.b $02
#_0AECF2: CMP.b #$01
#_0AECF4: BEQ .has_floors

#_0AECF6: INC.b $05
#_0AECF8: INC.b $05

#_0AECFA: DEC.b $03

#_0AECFC: LDY.b #$01

.has_floors
#_0AECFE: STY.b $02

;---------------------------------------------------------------------------------------------------

.next_check
#_0AED00: LDX.b $02

#_0AED02: LDA.w FloorNumberBlinkProps
#_0AED05: STA.b $0E,X

#_0AED07: REP #$10

#_0AED09: LDX.w $040C

#_0AED0C: LDA.w DungeonMapFloorCountData,X
#_0AED0F: AND.b #$0F
#_0AED11: STA.b $01

#_0AED13: CLC
#_0AED14: ADC.b $03
#_0AED16: STA.b $00

#_0AED18: LDA.b #$04
#_0AED1A: SEC
#_0AED1B: SBC.b $01
#_0AED1D: BMI .to_next

#_0AED1F: CLC
#_0AED20: ADC.b $00
#_0AED22: STA.b $00

#_0AED24: LDA.w DungeonMapFloorCountData,X
#_0AED27: LSR A
#_0AED28: LSR A
#_0AED29: LSR A
#_0AED2A: LSR A
#_0AED2B: SEC
#_0AED2C: SBC.b #$04
#_0AED2E: BMI .to_next

#_0AED30: SEC
#_0AED31: SBC.b $00
#_0AED33: EOR.b #$FF
#_0AED35: INC A
#_0AED36: STA.b $00

.to_next
#_0AED38: SEP #$10

#_0AED3A: DEC.b $05
#_0AED3C: DEC.b $05

#_0AED3E: INC.b $03

#_0AED40: DEC.b $02
#_0AED42: BMI .check_for_blinking

#_0AED44: BRL .next_check

;---------------------------------------------------------------------------------------------------

.check_for_blinking
#_0AED47: LDA.b $1A
#_0AED49: AND.b #$10
#_0AED4B: BNE .blink_on

#_0AED4D: RTS

;---------------------------------------------------------------------------------------------------

.oam_data_offset
#_0AED4E: db $00, $08

.char
#_0AED50: db $37, $38, $38, $37

;---------------------------------------------------------------------------------------------------

.blink_on
#_0AED54: LDY.b $00

#_0AED56: LDA.w FloorIconOffsetY,Y
#_0AED59: SEC
#_0AED5A: SBC.b #$04
#_0AED5C: STA.b $02

#_0AED5E: CLC
#_0AED5F: ADC.b #$10
#_0AED61: STA.b $03

#_0AED63: LDY.b #$00

#_0AED65: REP #$10

#_0AED67: LDX.w $040C

#_0AED6A: LDA.w DungeonMapFloorCountData,X
#_0AED6D: LSR A
#_0AED6E: LSR A
#_0AED6F: LSR A
#_0AED70: LSR A
#_0AED71: STA.b $0D

#_0AED73: LDA.w DungeonMapFloorCountData,X
#_0AED76: AND.b #$0F

#_0AED78: SEP #$10

#_0AED7A: CLC
#_0AED7B: ADC.b $0D
#_0AED7D: CMP.b #$01
#_0AED7F: BEQ .only_one_floor

#_0AED81: LDY.b #$01

.only_one_floor
#_0AED83: STY.b $0D

;---------------------------------------------------------------------------------------------------

.next_floor_box
#_0AED85: LDA.b #$28
#_0AED87: STA.b $01

#_0AED89: LDA.b #$03
#_0AED8B: STA.b $0C

#_0AED8D: LDX.b $0D

#_0AED8F: LDA.w .oam_data_offset,X
#_0AED92: TAY

.next_highlight
#_0AED93: LDA.b #$00
#_0AED95: STA.w $0A60,Y
#_0AED98: STA.w $0A64,Y

#_0AED9B: PHY

#_0AED9C: TYA
#_0AED9D: ASL A
#_0AED9E: ASL A
#_0AED9F: TAY

#_0AEDA0: LDA.b $01
#_0AEDA2: STA.w $0900,Y
#_0AEDA5: STA.w $0910,Y

#_0AEDA8: LDA.b $02,X
#_0AEDAA: STA.w $0901,Y

#_0AEDAD: CLC
#_0AEDAE: ADC.b #$08
#_0AEDB0: STA.w $0911,Y

#_0AEDB3: PHX

#_0AEDB4: LDX.b $0C

#_0AEDB6: LDA.w .char,X
#_0AEDB9: STA.w $0902,Y
#_0AEDBC: STA.w $0912,Y

#_0AEDBF: PLX

#_0AEDC0: PHY

#_0AEDC1: LDA.b $0E,X

#_0AEDC3: LDY.b $0C
#_0AEDC5: BNE .no_hflip

#_0AEDC7: ORA.b #$40

.no_hflip
#_0AEDC9: PLY
#_0AEDCA: STA.w $0903,Y

#_0AEDCD: ORA.b #$80
#_0AEDCF: STA.w $0913,Y

#_0AEDD2: PLY
#_0AEDD3: INY

#_0AEDD4: LDA.b $01
#_0AEDD6: CLC
#_0AEDD7: ADC.b #$08
#_0AEDD9: STA.b $01

#_0AEDDB: DEC.b $0C
#_0AEDDD: BPL .next_highlight

#_0AEDDF: DEC.b $0D
#_0AEDE1: BPL .next_floor_box

#_0AEDE3: RTS

;===================================================================================================

DungeonMap_DrawBossIcon:
#_0AEDE4: REP #$10

#_0AEDE6: LDX.w $040C

#_0AEDE9: REP #$20

#_0AEDEB: PHX

#_0AEDEC: LDA.w DungeonMapBossRooms,X
#_0AEDEF: ASL A
#_0AEDF0: TAX

#_0AEDF1: SEP #$20

#_0AEDF3: LDA.l $7EF001,X
#_0AEDF7: PLX

#_0AEDF8: AND.b #$08
#_0AEDFA: BNE .exit_a

#_0AEDFC: REP #$20

#_0AEDFE: LDA.l $7EF364
#_0AEE02: AND.l DungeonMask,X

#_0AEE06: SEP #$20

#_0AEE08: BEQ .exit_a

#_0AEE0A: LDA.w DungeonMap_BossRoomFloor+1,X
#_0AEE0D: BPL .draw_a_skull

.exit_a
#_0AEE0F: SEP #$10

#_0AEE11: RTS

;---------------------------------------------------------------------------------------------------

.draw_a_skull
#_0AEE12: PHX

#_0AEE13: JSR DungeonMap_DrawBossIconByFloor

#_0AEE16: PLX

#_0AEE17: SEP #$10

#_0AEE19: LDA.b $1A
#_0AEE1B: AND.b #$0F
#_0AEE1D: CMP.b #$0A
#_0AEE1F: BCS .exit_b

;---------------------------------------------------------------------------------------------------

#_0AEE21: LDY.b $00

#_0AEE23: LDA.b #$00
#_0AEE25: STA.w $0A20,Y

#_0AEE28: TYA
#_0AEE29: ASL A
#_0AEE2A: ASL A
#_0AEE2B: TAY

#_0AEE2C: LDA.w .offsets+1,X
#_0AEE2F: CLC
#_0AEE30: ADC.w $0FA8

#_0AEE33: CLC
#_0AEE34: ADC.b #$90
#_0AEE36: STA.w $0800,Y

#_0AEE39: LDA.w $0FAB
#_0AEE3C: BEQ .on_screen

#_0AEE3E: LDA.b #$F0
#_0AEE40: BRA .continue

;---------------------------------------------------------------------------------------------------

.on_screen
#_0AEE42: LDA.w .offsets+0,X
#_0AEE45: CLC
#_0AEE46: ADC.w $0FAA

.continue
#_0AEE49: STA.w $0801,Y

#_0AEE4C: LDA.w DungeonMap_BossSkull_char
#_0AEE4F: STA.w $0802,Y

#_0AEE52: LDA.w DungeonMap_BossSkull_prop
#_0AEE55: STA.w $0803,Y

#_0AEE58: INC.b $00

.exit_b
#_0AEE5A: RTS

;===================================================================================================

#DungeonMap_BossSkull_char:
#_0AEE5B: db $31

#DungeonMap_BossSkull_prop:
#_0AEE5C: db $33

;===================================================================================================

.offsets
#_0AEE5D: db $FF, $FF, $FF, $FF
#_0AEE61: db $08, $08, $08, $00
#_0AEE65: db $00, $00, $08, $00
#_0AEE69: db $08, $08, $08, $00
#_0AEE6D: db $08, $08, $00, $08
#_0AEE71: db $04, $04, $08, $08
#_0AEE75: db $08, $00, $08, $00

;===================================================================================================

DungeonMap_BossRoomFloor:
#_0AEE79: dw $FFFF ; // - Sewers
#_0AEE7B: dw $FFFF ; // - Hyrule Castle
#_0AEE7D: dw $0001 ; 2F - Eastern Palace
#_0AEE7F: dw $0001 ; 2F - Desert Palace
#_0AEE81: dw $0006 ; 7F - Agahnim's Tower
#_0AEE83: dw $00FF ; B1 - Swamp Palace
#_0AEE85: dw $00FF ; B1 - Palace of Darkness
#_0AEE87: dw $00FF ; B1 - Misery Mire
#_0AEE89: dw $00FE ; B2 - Skull Woods
#_0AEE8B: dw $00F9 ; B7 - Ice Palace
#_0AEE8D: dw $0005 ; 6F - Tower of Hera
#_0AEE8F: dw $00FF ; B1 - Thieves' Town
#_0AEE91: dw $00FD ; B3 - Turtle Rock
#_0AEE93: dw $0006 ; 7F - Ganon's Tower

;===================================================================================================

DungeonMap_DrawBossIconByFloor:
#_0AEE95: LDA.w DungeonMapFloorCountData,X
#_0AEE98: AND.b #$0F
#_0AEE9A: STA.b $02

#_0AEE9C: CLC
#_0AEE9D: ADC.w DungeonMap_BossRoomFloor+0,X
#_0AEEA0: STA.b $03

#_0AEEA2: LDA.b #$04
#_0AEEA4: SEC
#_0AEEA5: SBC.b $02
#_0AEEA7: BMI .floor_is_fine

#_0AEEA9: CLC
#_0AEEAA: ADC.b $03
#_0AEEAC: STA.b $03

#_0AEEAE: LDA.w DungeonMapFloorCountData,X

#_0AEEB1: LSR A
#_0AEEB2: LSR A
#_0AEEB3: LSR A
#_0AEEB4: LSR A

#_0AEEB5: SEC
#_0AEEB6: SBC.b #$04
#_0AEEB8: BMI .floor_is_fine

#_0AEEBA: SEC
#_0AEEBB: SBC.b $03

#_0AEEBD: EOR.b #$FF
#_0AEEBF: INC A
#_0AEEC0: STA.b $03

;---------------------------------------------------------------------------------------------------

.floor_is_fine
#_0AEEC2: SEP #$10

#_0AEEC4: LDA.b $1A
#_0AEEC6: AND.b #$0F
#_0AEEC8: CMP.b #$0A
#_0AEECA: BCS .exit

#_0AEECC: LDX.b $00

#_0AEECE: LDA.b #$00
#_0AEED0: STA.w $0A20,X

#_0AEED3: TXA
#_0AEED4: ASL A
#_0AEED5: ASL A
#_0AEED6: TAX

#_0AEED7: LDA.w DrawBossIconByFloor_position_x
#_0AEEDA: STA.w $0800,X

#_0AEEDD: LDY.b $03

#_0AEEDF: LDA.w FloorIconOffsetY,Y
#_0AEEE2: STA.w $0801,X

#_0AEEE5: LDA.w DungeonMap_BossSkull_char
#_0AEEE8: STA.w $0802,X

#_0AEEEB: LDA.w DungeonMap_BossSkull_prop
#_0AEEEE: STA.w $0803,X

#_0AEEF1: INC.b $00

.exit
#_0AEEF3: REP #$10

#_0AEEF5: RTS

;===================================================================================================

Module0E_03_04_UnusedCrazyScroll:
#_0AEEF6: REP #$30

#_0AEEF8: LDA.w $0213
#_0AEEFB: CLC
#_0AEEFC: ADC.b $E8
#_0AEEFE: STA.b $E8

#_0AEF00: LDA.w $0213
#_0AEF03: EOR.w #$FFFF
#_0AEF06: INC A

#_0AEF07: CLC
#_0AEF08: ADC.w $0217
#_0AEF0B: STA.w $0217

#_0AEF0E: SEP #$30

#_0AEF10: DEC.w $0205
#_0AEF13: BNE .exit

#_0AEF15: DEC.w $0200

.exit
#_0AEF18: RTL

;===================================================================================================

UnderworldMap_RecoverGFX:
#_0AEF19: LDA.b $9B
#_0AEF1B: PHA

#_0AEF1C: STZ.w HDMAEN
#_0AEF1F: STZ.b $9B

#_0AEF21: JSL EraseTilemaps_normal

;---------------------------------------------------------------------------------------------------

#_0AEF25: LDA.l $7EC211
#_0AEF29: STA.b $1C

#_0AEF2B: LDA.l $7EC212
#_0AEF2F: STA.l $00001D

#_0AEF33: LDA.l $7EC20E
#_0AEF37: STA.w $0AA1

#_0AEF3A: LDA.l $7EC20F
#_0AEF3E: STA.w $0AA3

#_0AEF41: LDA.l $7EC210
#_0AEF45: STA.w $0AA2

#_0AEF48: JSL InitializeTilesets

#_0AEF4C: STZ.w $0AA9
#_0AEF4F: STZ.w $0AB2

#_0AEF52: JSL RebuildHUD_long2

#_0AEF56: STZ.w $0418
#_0AEF59: STZ.w $045C

.next_quadrant
#_0AEF5C: JSL WaterFlood_BuildOneQuadrantForVRAM
#_0AEF60: JSL NMI_UploadTilemap_long

#_0AEF64: JSL Underworld_PrepareNextRoomQuadrantUpload
#_0AEF68: JSL NMI_UploadTilemap_long

#_0AEF6C: LDA.w $045C
#_0AEF6F: CMP.b #$10
#_0AEF71: BNE .next_quadrant

#_0AEF73: STZ.b $17
#_0AEF75: STZ.b $B0

#_0AEF77: PLA
#_0AEF78: STA.b $9B

;---------------------------------------------------------------------------------------------------

#_0AEF7A: REP #$20

#_0AEF7C: LDX.b #$00

.copy_next_color
#_0AEF7E: LDA.l $7FDD80,X
#_0AEF82: STA.l $7EC500,X

#_0AEF86: LDA.l $7FDE00,X
#_0AEF8A: STA.l $7EC580,X

#_0AEF8E: LDA.l $7FDE80,X
#_0AEF92: STA.l $7EC600,X

#_0AEF96: LDA.l $7FDF00,X
#_0AEF9A: STA.l $7EC680,X

#_0AEF9E: INX
#_0AEF9F: INX
#_0AEFA0: CPX.b #$80
#_0AEFA2: BNE .copy_next_color

;---------------------------------------------------------------------------------------------------

#_0AEFA4: SEP #$20

#_0AEFA6: LDA.l $7EC017
#_0AEFAA: TSB.b $9C
#_0AEFAC: TSB.b $9D
#_0AEFAE: TSB.b $9E

#_0AEFB0: LDA.b #$10 ; SFX3.10
#_0AEFB2: STA.w $012F

#_0AEFB5: LDA.b #$F3 ; SONG F3 - max volume
#_0AEFB7: STA.w $012C

#_0AEFBA: JSL RecoverPegGFXFromMapping

#_0AEFBE: INC.b $15
#_0AEFC0: INC.w $0200

#_0AEFC3: STZ.b $13
#_0AEFC5: STZ.w $0710

#_0AEFC8: RTL

;===================================================================================================

ToggleStarTilesAndAdvance:
#_0AEFC9: JSL ToggleStarTileGraphics

#_0AEFCD: INC.w $0200

#_0AEFD0: RTL

;===================================================================================================

DungeonMap_BackdropFloorGradientTiles:
#_0AEFD1: dw $1B28, $1B29, $1B2A, $1B2B, $1B2C, $1B2D, $1B2E

;===================================================================================================

DungeonMap_MountainStripes:
#_0AEFDF: dw $AA10, $0100 ; VRAM $2154 | 2 bytes | Horizontal
#_0AEFE3: dw $1B2F

#_0AEFE5: dw $C910, $0300 ; VRAM $2192 | 4 bytes | Horizontal
#_0AEFE9: dw $1B2F, $1B2E

#_0AEFED: dw $E510, $0B00 ; VRAM $21CA | 12 bytes | Horizontal
#_0AEFF1: dw $1B2F, $1B2E, $5B2F, $1B2F, $1B2E, $1B2E

#_0AEFFD: dw $0311, $0100 ; VRAM $2206 | 2 bytes | Horizontal
#_0AF001: dw $1B2F

#_0AF003: dw $0411, $0C40 ; VRAM $2208 | 14 bytes | Fixed horizontal
#_0AF007: dw $1B2E

;===================================================================================================

DungeonMap_RoomTemplates:

;---------------------------------------------------------------------------------------------------

#_0AF009: dw $0B61, $5361, $8B61, $8B62 ; 0x00 - ROOM 0011
#_0AF011: dw $0B60, $0B63, $8B60, $0B64 ; 0x01 - ROOM 0021
#_0AF019: dw $0B00, $0B00, $0B65, $0B66 ; 0x02 - ROOM 0022
#_0AF021: dw $0B67, $4B67, $9367, $D367 ; 0x03 - ROOM 0032
#_0AF029: dw $0B60, $5360, $8B60, $CB60 ; 0x04 - ROOM 0002
#_0AF031: dw $0B6A, $4B6A, $4B6D, $0B6D ; 0x05 - ROOM 0012
#_0AF039: dw $1368, $1369, $0B00, $0B00 ; 0x06 - ROOM 0042
#_0AF041: dw $0B6A, $136B, $0B6C, $0B6D ; 0x07 - ROOM 0041

;---------------------------------------------------------------------------------------------------

#_0AF049: dw $136E, $4B6E, $0B00, $0B00 ; 0x08 - ROOM 0080
#_0AF051: dw $136F, $0B00, $0B00, $0B00 ; 0x09 - ROOM 0070
#_0AF059: dw $1340, $0B00, $0B78, $1744 ; 0x0A - ROOM 0071
#_0AF061: dw $536D, $136D, $4B76, $0B76 ; 0x0B - ROOM 0072
#_0AF069: dw $0B70, $0B71, $0B72, $8B71 ; 0x0C - ROOM 0081
#_0AF071: dw $0B75, $0B76, $8B75, $8B76 ; 0x0D - ROOM 0082
#_0AF079: dw $0B00, $0B53, $0B00, $0B55 ; 0x0E - ROOM 0050
#_0AF081: dw $1354, $5354, $0B00, $0B00 ; 0x0F - ROOM 0001
#_0AF089: dw $4B53, $0B00, $0B56, $0B57 ; 0x10 - ROOM 0052
#_0AF091: dw $0B00, $0B59, $0B00, $135E ; 0x11 - ROOM 0060
#_0AF099: dw $135A, $135B, $135F, $535F ; 0x12 - ROOM 0061
#_0AF0A1: dw $0B5C, $0B5D, $535E, $CB58 ; 0x13 - ROOM 0062
#_0AF0A9: dw $0B50, $4B50, $1352, $5352 ; 0x14 - ROOM 0051

;---------------------------------------------------------------------------------------------------

#_0AF0B1: dw $0B00, $0B40, $1345, $0B46 ; 0x15 - ROOM 0099
#_0AF0B9: dw $8B42, $0B47, $0B42, $0B49 ; 0x16 - ROOM 00A8
#_0AF0C1: dw $1348, $5348, $174A, $574A ; 0x17 - ROOM 00A9
#_0AF0C9: dw $4B47, $CB42, $4B49, $4B42 ; 0x18 - ROOM 00AA
#_0AF0D1: dw $0B00, $0B4B, $0B00, $0B4D ; 0x19 - ROOM 00B8
#_0AF0D9: dw $0B4C, $4B4C, $0B4E, $4B4E ; 0x1A - ROOM 00B9
#_0AF0E1: dw $0B51, $0B44, $0B00, $0B00 ; 0x1B - ROOM 00BA
#_0AF0E9: dw $0B4F, $4B4F, $934F, $D34F ; 0x1C - ROOM 00C9
#_0AF0F1: dw $0B00, $0B00, $0B00, $0B40 ; 0x1D - ROOM 00C8
#_0AF0F9: dw $0B00, $0B41, $0B00, $0B42 ; 0x1E - ROOM 00D8
#_0AF101: dw $0B00, $0B00, $0B43, $0B43 ; 0x1F - ROOM 00D9
#_0AF109: dw $0B00, $0B00, $9344, $0B00 ; 0x20 - ROOM 00DA

;---------------------------------------------------------------------------------------------------

#_0AF111: dw $1340, $0B00, $1341, $0B00 ; 0x21 - ROOM 0063
#_0AF119: dw $1740, $0B40, $0B42, $0B7D ; 0x22 - ROOM 0073
#_0AF121: dw $4B7A, $0B7A, $0B7E, $4B7E ; 0x23 - ROOM 0074
#_0AF129: dw $0B40, $8B4D, $4BBA, $0B55 ; 0x24 - ROOM 0076
#_0AF131: dw $0B40, $8B55, $1378, $CB53 ; 0x25 - ROOM 0083
#_0AF139: dw $4B76, $4B75, $13BB, $53BB ; 0x26 - ROOM 0084
#_0AF141: dw $4B7F, $4B42, $0B83, $13BC ; 0x27 - ROOM 0086
#_0AF149: dw $0B00, $0B00, $0B79, $0B00 ; 0x28 - ROOM 0033
#_0AF151: dw $0B6E, $4B7C, $0B00, $0B41 ; 0x29 - ROOM 0042
#_0AF159: dw $1340, $8B55, $0B42, $0B7B ; 0x2A - ROOM 0053

;---------------------------------------------------------------------------------------------------

#_0AF161: dw $8B42, $9344, $1341, $0B00 ; 0x2B - ROOM 00E0
#_0AF169: dw $0B53, $9344, $8B53, $9344 ; 0x2C - ROOM 00C0/ROOM 00D0
#_0AF171: dw $8B42, $9344, $0B42, $9344 ; 0x2D - ROOM 00B0
#_0AF179: dw $934D, $0B00, $8B53, $9344 ; 0x2E - ROOM 0040
#_0AF181: dw $0B00, $0B00, $0B40, $0B00 ; 0x2F - ROOM 0020
#_0AF189: dw $0B41, $0B00, $1384, $0B00 ; 0x30 - ROOM 0030

;---------------------------------------------------------------------------------------------------

#_0AF191: dw $0BB8, $13B9, $4B85, $CB7C ; 0x31 - ROOM 0066
#_0AF199: dw $0B87, $13B0, $4B7B, $9344 ; 0x32 - ROOM 0076
#_0AF1A1: dw $0B00, $0B00, $0B40, $0B00 ; 0x33 - ROOM 0006
#_0AF1A9: dw $0B91, $5391, $0B9C, $4B9C ; 0x34 - ROOM 0016
#_0AF1B1: dw $8B42, $1392, $0B93, $1394 ; 0x35 - ROOM 0026
#_0AF1B9: dw $0B95, $0B96, $9395, $8B96 ; 0x36 - ROOM 0034
#_0AF1C1: dw $0B97, $0B98, $8B97, $8B98 ; 0x37 - ROOM 0035
#_0AF1C9: dw $1799, $5799, $9799, $D799 ; 0x38 - ROOM 0036
#_0AF1D1: dw $4B98, $4B97, $CB98, $CB97 ; 0x39 - ROOM 0037
#_0AF1D9: dw $937B, $0B00, $0B7B, $0B00 ; 0x3A - ROOM 0038
#_0AF1E1: dw $0BA6, $4BA6, $CB7A, $8B7A ; 0x3B - ROOM 0046
#_0AF1E9: dw $0B8E, $4B8E, $938E, $CB8E ; 0x3C - ROOM 0054
#_0AF1F1: dw $934D, $0B8F, $1390, $5390 ; 0x3D - ROOM 0028

;---------------------------------------------------------------------------------------------------

#_0AF1F9: dw $0B00, $0B00, $0B00, $8B48 ; 0x3E - ROOM 005A
#_0AF201: dw $0B00, $934E, $0B00, $8B4D ; 0x3F - ROOM 006A
#_0AF209: dw $8B72, $1346, $0B45, $0B46 ; 0x40 - ROOM 000B
#_0AF211: dw $5744, $1744, $0B00, $0B00 ; 0x41 - ROOM 000A
#_0AF219: dw $134D, $0B00, $8B54, $0B00 ; 0x42 - ROOM 003B
#_0AF221: dw $1349, $1349, $0B00, $0B00 ; 0x43 - ROOM 0009
#_0AF229: dw $0B4B, $8B48, $0B72, $4B72 ; 0x44 - ROOM 004B
#_0AF231: dw $0B00, $0B74, $0B00, $0BB0 ; 0x45 - ROOM 0019
#_0AF239: dw $0B71, $1747, $17AF, $0B4B ; 0x46 - ROOM 001A
#_0AF241: dw $0B6F, $1370, $0B4B, $0B00 ; 0x47 - ROOM 001B
#_0AF249: dw $0B6B, $8B6C, $8B6B, $0BAD ; 0x48 - ROOM 002A
#_0AF251: dw $0B73, $0B00, $13AE, $0B46 ; 0x49 - ROOM 002B
#_0AF259: dw $176B, $576B, $0B6A, $4B6A ; 0x4A - ROOM 003A
#_0AF261: dw $1368, $5368, $1369, $5369 ; 0x4B - ROOM 004A

;---------------------------------------------------------------------------------------------------

#_0AF269: dw $8B4E, $0B00, $9354, $0B00 ; 0x4C - ROOM 00D5
#_0AF271: dw $0B00, $0B00, $0B00, $5377 ; 0x4D - ROOM 0023

;---------------------------------------------------------------------------------------------------

#_0AF279: dw $0B00, $974D, $0B00, $4B7B ; 0x4E - ROOM 0091
#_0AF281: dw $0B40, $8B4D, $0B51, $0B8D ; 0x4F - ROOM 0092
#_0AF289: dw $537A, $137A, $4B42, $8B40 ; 0x50 - ROOM 0093
#_0AF291: dw $0B00, $0B00, $0B00, $0B00 ; 0x51 - UNUSED
#_0AF299: dw $0B00, $0B00, $0B40, $0B00 ; 0x52 - ROOM 0090
#_0AF2A1: dw $CB7A, $576E, $0B00, $0B00 ; 0x53 - ROOM 00A0
#_0AF2A9: dw $0B6E, $0B9F, $0B00, $4BA5 ; 0x54 - ROOM 00A1
#_0AF2B1: dw $13A0, $13A1, $0BA2, $0BA3 ; 0x55 - ROOM 00A2
#_0AF2B9: dw $0BA4, $0B00, $0BA5, $0B00 ; 0x56 - ROOM 00A3
#_0AF2C1: dw $0B40, $8B55, $0B42, $CB87 ; 0x57 - ROOM 00B1
#_0AF2C9: dw $8B95, $0BA7, $8B42, $0BAF ; 0x58 - ROOM 00B2
#_0AF2D1: dw $4B78, $0B00, $4B78, $0B00 ; 0x59 - ROOM 00B3
#_0AF2D9: dw $8B42, $0B51, $0B78, $8B51 ; 0x5A - ROOM 00C1
#_0AF2E1: dw $0BA8, $0BA9, $0BAC, $8BA9 ; 0x5B - ROOM 00C2
#_0AF2E9: dw $0BAA, $17AB, $13B4, $8BAB ; 0x5C - ROOM 00C3
#_0AF2F1: dw $17B1, $0B41, $4B44, $4B42 ; 0x5D - ROOM 00D1
#_0AF2F9: dw $0B00, $0BAD, $0B00, $13AE ; 0x5E - ROOM 00D2
#_0AF301: dw $1340, $0BB7, $0B42, $0BB6 ; 0x5F - ROOM 0097
#_0AF309: dw $0B00, $0B00, $139D, $139E ; 0x60 - ROOM 0098

;---------------------------------------------------------------------------------------------------

#_0AF311: dw $0B00, $0B00, $0B00, $0B79 ; 0x61 - ROOM 0029
#_0AF319: dw $0B00, $0B00, $8B42, $0B86 ; 0x62 - ROOM 0039
#_0AF321: dw $0B42, $8B7B, $8B42, $0B7B ; 0x63 - ROOM 0049
#_0AF329: dw $0B87, $8B7B, $9387, $0B7B ; 0x64 - ROOM 0059
#_0AF331: dw $0B40, $13B3, $1378, $0B8D ; 0x65 - ROOM 0056
#_0AF339: dw $8B42, $0B88, $5378, $0B40 ; 0x66 - ROOM 0057
#_0AF341: dw $4B44, $D342, $97B5, $4B78 ; 0x67 - ROOM 0058
#_0AF349: dw $13B3, $8B55, $4B7B, $0B8D ; 0x68 - ROOM 0067
#_0AF351: dw $0B89, $138A, $0B8B, $0B8C ; 0x69 - ROOM 0068

;---------------------------------------------------------------------------------------------------

#_0AF359: dw $0B00, $0B7C, $0B00, $0B00 ; 0x6A - ROOM 00DE
#_0AF361: dw $0B00, $9348, $0B00, $0B56 ; 0x6B - ROOM 00BE
#_0AF369: dw $0B00, $0B00, $0B88, $0B00 ; 0x6C - ROOM 00BF
#_0AF371: dw $0B00, $0B48, $0B00, $0B00 ; 0x6D - ROOM 00CE
#_0AF379: dw $0B00, $9348, $1786, $0B65 ; 0x6E - ROOM 009E
#_0AF381: dw $0B00, $0B00, $CB5A, $0B00 ; 0x6F - ROOM 009F
#_0AF389: dw $0B00, $5388, $0B00, $0B00 ; 0x70 - ROOM 00AE
#_0AF391: dw $4B5A, $0B00, $0B00, $0B00 ; 0x71 - ROOM 00AF
#_0AF399: dw $0B00, $CB5B, $13AB, $0BAC ; 0x72 - ROOM 007E
#_0AF3A1: dw $CB5A, $0B00, $137E, $0B00 ; 0x73 - ROOM 007F
#_0AF3A9: dw $0B00, $137E, $0B00, $0B00 ; 0x74 - ROOM 008E
#_0AF3B1: dw $0B00, $8B48, $1783, $1384 ; 0x75 - ROOM 005E
#_0AF3B9: dw $0B00, $0B00, $1385, $0B00 ; 0x76 - ROOM 005F
#_0AF3C1: dw $0B00, $537E, $0B00, $0B00 ; 0x77 - ROOM 006E
#_0AF3C9: dw $0B00, $8B48, $0B43, $CB43 ; 0x78 - ROOM 003E
#_0AF3D1: dw $0B00, $0B00, $1379, $137A ; 0x79 - ROOM 003F
#_0AF3D9: dw $0B5A, $137B, $0B00, $0B00 ; 0x7A - ROOM 004E
#_0AF3E1: dw $0B00, $8B48, $137F, $1380 ; 0x7B - ROOM 001E
#_0AF3E9: dw $0B00, $0B00, $1381, $1382 ; 0x7C - ROOM 001F
#_0AF3F1: dw $0B00, $0B48, $0B00, $0B00 ; 0x7D - ROOM 002E
#_0AF3F9: dw $0B00, $0B00, $1387, $1377 ; 0x7E - ROOM 000E

;---------------------------------------------------------------------------------------------------

#_0AF401: dw $5746, $0B47, $1349, $0B48 ; 0x7F - ROOM 0087
#_0AF409: dw $1375, $4B42, $174A, $574A ; 0x80 - ROOM 0077
#_0AF411: dw $0B43, $1344, $0B45, $1746 ; 0x81 - ROOM 0031
#_0AF419: dw $1742, $5742, $8B42, $CB42 ; 0x82 - ROOM 0027
#_0AF421: dw $1375, $5375, $8B42, $CB42 ; 0x83 - ROOM 0017
#_0AF429: dw $4B40, $1340, $0B41, $4B41 ; 0x84 - ROOM 0007

;---------------------------------------------------------------------------------------------------

#_0AF431: dw $4B46, $0B71, $1786, $8B71 ; 0x85 - ROOM 0044
#_0AF439: dw $1347, $0B4D, $0B65, $0B5B ; 0x86 - ROOM 0045
#_0AF441: dw $0B00, $0B00, $9348, $0B00 ; 0x87 - ROOM 00AB
#_0AF449: dw $0B00, $0B00, $0B00, $8B48 ; 0x88 - ROOM 00AC
#_0AF451: dw $4B66, $8B65, $4B5B, $0B65 ; 0x89 - ROOM 00BB
#_0AF459: dw $9365, $0B66, $0B63, $8B66 ; 0x8A - ROOM 00BC
#_0AF461: dw $4B51, $0B5F, $CB76, $0B60 ; 0x8B - ROOM 00CB
#_0AF469: dw $0B64, $4B4F, $4B60, $8B76 ; 0x8C - ROOM 00CC
#_0AF471: dw $4B76, $0B61, $D376, $1362 ; 0x8D - ROOM 00DB
#_0AF479: dw $4B61, $0B76, $CB58, $8B51 ; 0x8E - ROOM 00DC
#_0AF481: dw $0B00, $0B00, $5746, $0B5E ; 0x8F - ROOM 0064
#_0AF489: dw $0B00, $0B00, $0B5E, $0B46 ; 0x90 - ROOM 0065

;---------------------------------------------------------------------------------------------------

#_0AF491: dw $0B00, $0B00, $8B48, $0B00 ; 0x91 - ROOM 00A4
#_0AF499: dw $0B4F, $0B51, $CB76, $8B76 ; 0x92 - ROOM 00B4
#_0AF4A1: dw $5351, $0B51, $8B4F, $8B51 ; 0x93 - ROOM 00B5
#_0AF4A9: dw $4B76, $0B76, $CB51, $8B58 ; 0x94 - ROOM 00C4
#_0AF4B1: dw $0B54, $0B00, $8B66, $0B00 ; 0x95 - ROOM 00C5
#_0AF4B9: dw $9348, $8B48, $0B56, $4B45 ; 0x96 - ROOM 0004
#_0AF4C1: dw $0B00, $0B57, $0B00, $0B59 ; 0x97 - ROOM 0013
#_0AF4C9: dw $4B50, $0B58, $CB50, $8B50 ; 0x98 - ROOM 0014
#_0AF4D1: dw $5758, $1751, $CB58, $8B51 ; 0x99 - ROOM 0015
#_0AF4D9: dw $0B56, $4B56, $0B65, $5756 ; 0x9A - ROOM 0024
#_0AF4E1: dw $9348, $8B48, $0B4C, $0B4B ; 0x9B - ROOM 00B6
#_0AF4E9: dw $0B4D, $0B00, $8B54, $0B00 ; 0x9C - ROOM 00B7
#_0AF4F1: dw $0B4F, $0B50, $8B4F, $8B50 ; 0x9D - ROOM 00C6
#_0AF4F9: dw $4B50, $0B51, $CB58, $8B51 ; 0x9E - ROOM 00C7
#_0AF501: dw $0B52, $0B54, $0B53, $9354 ; 0x9F - ROOM 00D6

;---------------------------------------------------------------------------------------------------

#_0AF509: dw $9748, $9748, $138D, $138E ; 0xA0 - ROOM 001C
#_0AF511: dw $1391, $1392, $138C, $138F ; 0xA1 - ROOM 007B
#_0AF519: dw $1393, $1390, $9393, $138F ; 0xA2 - ROOM 007C
#_0AF521: dw $1394, $1395, $138E, $138C ; 0xA3 - ROOM 007D
#_0AF529: dw $175D, $1399, $975D, $538F ; 0xA4 - ROOM 008B
#_0AF531: dw $1397, $1398, $179A, $138C ; 0xA5 - ROOM 008C
#_0AF539: dw $1399, $1766, $138F, $D75D ; 0xA6 - ROOM 008D
#_0AF541: dw $538E, $538F, $1391, $1392 ; 0xA7 - ROOM 009B
#_0AF549: dw $139B, $539B, $139C, $539C ; 0xA8 - ROOM 009C
#_0AF551: dw $138F, $138E, $5392, $5391 ; 0xA9 - ROOM 009D
#_0AF559: dw $138A, $538A, $138B, $538B ; 0xAA - ROOM 000C
#_0AF561: dw $0B00, $CB5B, $0B00, $8B54 ; 0xAB - ROOM 005B
#_0AF569: dw $4B74, $13A6, $0B00, $4B48 ; 0xAC - ROOM 005C
#_0AF571: dw $13A0, $13A1, $538E, $138E ; 0xAD - ROOM 006B
#_0AF579: dw $D38E, $53A3, $13A4, $0B00 ; 0xAE - ROOM 005D
#_0AF581: dw $97AA, $0B00, $538E, $1399 ; 0xAF - ROOM 006C
#_0AF589: dw $13A4, $0B00, $138E, $0B00 ; 0xB0 - ROOM 006D
#_0AF591: dw $0B00, $5393, $0B00, $574E ; 0xB1 - ROOM 0095
#_0AF599: dw $4B7D, $0B00, $8B7D, $139F ; 0xB2 - ROOM 0096
#_0AF5A1: dw $97AA, $13A4, $13A9, $53A9 ; 0xB3 - ROOM 00A5
#_0AF5A9: dw $13A5, $13A6, $93A5, $D3A5 ; 0xB4 - ROOM 00A6
#_0AF5B1: dw $D38E, $938E, $13A4, $13AA ; 0xB5 - ROOM 0034
#_0AF5B9: dw $0B00, $13A6, $0B00, $8B5F ; 0xB6 - ROOM 004C
#_0AF5C1: dw $139B, $13A6, $139C, $53A2 ; 0xB7 - ROOM 004D
#_0AF5C9: dw $0B00, $0B00, $138C, $0B00 ; 0xB8 - ROOM 000D
#_0AF5D1: dw $9394, $139E, $0B00, $0B00 ; 0xB9 - ROOM 001D

;===================================================================================================

DungeonMapFloorCountData:
#_0AF5D9: db $21, $00 ; Sewers
#_0AF5DB: db $23, $00 ; Hyrule Castle
#_0AF5DD: db $20, $00 ; Eastern Palace
#_0AF5DF: db $21, $00 ; Desert Palace
#_0AF5E1: db $70, $00 ; Agahnim's Tower
#_0AF5E3: db $12, $00 ; Swamp Palace
#_0AF5E5: db $11, $00 ; Palace of Darkness
#_0AF5E7: db $12, $02 ; Misery Mire
#_0AF5E9: db $02, $00 ; Skull Woods
#_0AF5EB: db $17, $02 ; Ice Palace
#_0AF5ED: db $60, $01 ; Tower of Hera
#_0AF5EF: db $12, $00 ; Thieves' Town
#_0AF5F1: db $13, $01 ; Turtle Rock
#_0AF5F3: db $71, $01 ; Ganon's Tower

;===================================================================================================

DungeonMapFloorToDataOffset:
#_0AF5F5: dw $0000
#_0AF5F7: dw $0019
#_0AF5F9: dw $0032
#_0AF5FB: dw $004B
#_0AF5FD: dw $0064
#_0AF5FF: dw $007D
#_0AF601: dw $0096
#_0AF603: dw $00AF

;===================================================================================================

DungeonMapRoomPointers:
#_0AF605: dw DungeonMapRoomData_Sewers
#_0AF607: dw DungeonMapRoomData_HyruleCastle
#_0AF609: dw DungeonMapRoomData_EasternPalace
#_0AF60B: dw DungeonMapRoomData_DesertPalace
#_0AF60D: dw DungeonMapRoomData_AgahnimsTower
#_0AF60F: dw DungeonMapRoomData_SwampPalace
#_0AF611: dw DungeonMapRoomData_PalaceofDarkness
#_0AF613: dw DungeonMapRoomData_MiseryMire
#_0AF615: dw DungeonMapRoomData_SkullWoods
#_0AF617: dw DungeonMapRoomData_IcePalace
#_0AF619: dw DungeonMapRoomData_TowerofHera
#_0AF61B: dw DungeonMapRoomData_ThievesTown
#_0AF61D: dw DungeonMapRoomData_TurtleRock
#_0AF61F: dw DungeonMapRoomData_GanonsTower

;===================================================================================================

DungeonMapRoomData_Sewers:
#_0AF621: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF626: db $0F, $0F, $11, $0F, $0F ; row 1
#_0AF62B: db $0F, $0F, $21, $22, $0F ; row 2
#_0AF630: db $0F, $0F, $0F, $32, $0F ; row 3
#_0AF635: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF63A: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF63F: db $0F, $0F, $02, $0F, $0F ; row 1
#_0AF644: db $0F, $0F, $12, $0F, $0F ; row 2
#_0AF649: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF64E: db $0F, $0F, $0F, $42, $0F ; row 4

#_0AF653: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF658: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF65D: db $0F, $0F, $0F, $0F, $0F ; row 2
#_0AF662: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF667: db $0F, $0F, $0F, $41, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_HyruleCastle:
#_0AF66C: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF671: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF676: db $0F, $80, $0F, $0F, $0F ; row 2
#_0AF67B: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF680: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF685: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF68A: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF68F: db $0F, $70, $0F, $0F, $0F ; row 2
#_0AF694: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF699: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF69E: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF6A3: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF6A8: db $0F, $71, $72, $0F, $0F ; row 2
#_0AF6AD: db $0F, $81, $82, $0F, $0F ; row 3
#_0AF6B2: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF6B7: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF6BC: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF6C1: db $0F, $50, $01, $52, $0F ; row 2
#_0AF6C6: db $0F, $60, $61, $62, $0F ; row 3
#_0AF6CB: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF6D0: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF6D5: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF6DA: db $0F, $0F, $51, $0F, $0F ; row 2
#_0AF6DF: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF6E4: db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_EasternPalace:
#_0AF6E9: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF6EE: db $0F, $0F, $99, $0F, $0F ; row 1
#_0AF6F3: db $0F, $A8, $A9, $AA, $0F ; row 2
#_0AF6F8: db $0F, $B8, $B9, $BA, $0F ; row 3
#_0AF6FD: db $0F, $0F, $C9, $0F, $0F ; row 4

#_0AF702: db $C8, $0F, $0F, $0F, $0F ; row 0
#_0AF707: db $D8, $D9, $DA, $0F, $0F ; row 1
#_0AF70C: db $0F, $0F, $0F, $0F, $0F ; row 2
#_0AF711: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF716: db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_DesertPalace:
#_0AF71B: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF720: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF725: db $0F, $0F, $0F, $0F, $0F ; row 2
#_0AF72A: db $0F, $73, $74, $75, $0F ; row 3
#_0AF72F: db $0F, $83, $84, $85, $0F ; row 4

#_0AF734: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF739: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF73E: db $0F, $0F, $63, $0F, $0F ; row 2
#_0AF743: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF748: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF74D: db $0F, $0F, $33, $0F, $0F ; row 0
#_0AF752: db $0F, $0F, $43, $0F, $0F ; row 1
#_0AF757: db $0F, $0F, $53, $0F, $0F ; row 2
#_0AF75C: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF761: db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_AgahnimsTower:
#_0AF766: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF76B: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF770: db $0F, $0F, $0F, $0F, $0F ; row 2
#_0AF775: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF77A: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF77F: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF784: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF789: db $0F, $0F, $E0, $0F, $0F ; row 2
#_0AF78E: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF793: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF798: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF79D: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF7A2: db $0F, $0F, $D0, $0F, $0F ; row 2
#_0AF7A7: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF7AC: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF7B1: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF7B6: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF7BB: db $0F, $0F, $C0, $0F, $0F ; row 2
#_0AF7C0: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF7C5: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF7CA: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF7CF: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF7D4: db $0F, $0F, $B0, $0F, $0F ; row 2
#_0AF7D9: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF7DE: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF7E3: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF7E8: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF7ED: db $0F, $0F, $40, $0F, $0F ; row 2
#_0AF7F2: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF7F7: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF7FC: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF801: db $0F, $0F, $20, $0F, $0F ; row 1
#_0AF806: db $0F, $0F, $30, $0F, $0F ; row 2
#_0AF80B: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF810: db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_SwampPalace:
#_0AF815: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF81A: db $0F, $0F, $66, $0F, $0F ; row 1
#_0AF81F: db $0F, $0F, $76, $0F, $0F ; row 2
#_0AF824: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF829: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF82E: db $0F, $0F, $06, $0F, $0F ; row 0
#_0AF833: db $0F, $0F, $16, $0F, $0F ; row 1
#_0AF838: db $0F, $0F, $26, $0F, $0F ; row 2
#_0AF83D: db $34, $35, $36, $37, $38 ; row 3
#_0AF842: db $0F, $0F, $46, $0F, $0F ; row 4

#_0AF847: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF84C: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF851: db $0F, $0F, $0F, $0F, $0F ; row 2
#_0AF856: db $54, $0F, $0F, $0F, $28 ; row 3
#_0AF85B: db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_PalaceofDarkness:
#_0AF860: db $0F, $0F, $5A, $0F, $0F ; row 0
#_0AF865: db $0F, $0F, $6A, $0B, $0F ; row 1
#_0AF86A: db $0F, $0F, $0F, $0F, $0F ; row 2
#_0AF86F: db $0F, $0F, $0A, $3B, $0F ; row 3
#_0AF874: db $0F, $0F, $09, $4B, $0F ; row 4

#_0AF879: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF87E: db $0F, $19, $1A, $1B, $0F ; row 1
#_0AF883: db $0F, $0F, $2A, $2B, $0F ; row 2
#_0AF888: db $0F, $0F, $3A, $0F, $0F ; row 3
#_0AF88D: db $0F, $0F, $4A, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_MiseryMire:
#_0AF892: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF897: db $0F, $91, $92, $93, $0F ; row 1
#_0AF89C: db $0F, $0F, $0F, $0F, $0F ; row 2
#_0AF8A1: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF8A6: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF8AB: db $0F, $90, $0F, $0F, $0F ; row 0
#_0AF8B0: db $0F, $A0, $A1, $A2, $A3 ; row 1
#_0AF8B5: db $0F, $0F, $B1, $B2, $B3 ; row 2
#_0AF8BA: db $0F, $0F, $C1, $C2, $C3 ; row 3
#_0AF8BF: db $0F, $0F, $D1, $D2, $0F ; row 4

#_0AF8C4: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF8C9: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF8CE: db $0F, $0F, $0F, $0F, $0F ; row 2
#_0AF8D3: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF8D8: db $0F, $0F, $97, $98, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_SkullWoods:
#_0AF8DD: db $29, $0F, $0F, $0F, $0F ; row 0
#_0AF8E2: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF8E7: db $0F, $0F, $0F, $0F, $0F ; row 2
#_0AF8EC: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF8F1: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF8F6: db $39, $0F, $0F, $0F, $0F ; row 0
#_0AF8FB: db $49, $0F, $0F, $0F, $0F ; row 1
#_0AF900: db $59, $0F, $0F, $0F, $0F ; row 2
#_0AF905: db $0F, $56, $57, $58, $0F ; row 3
#_0AF90A: db $0F, $0F, $67, $68, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_IcePalace:
#_0AF90F: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF914: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF919: db $0F, $0F, $0F, $0F, $0F ; row 2
#_0AF91E: db $0F, $0F, $DE, $0F, $0F ; row 3
#_0AF923: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF928: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF92D: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF932: db $0F, $0F, $BE, $BF, $0F ; row 2
#_0AF937: db $0F, $0F, $CE, $0F, $0F ; row 3
#_0AF93C: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF941: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF946: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF94B: db $0F, $0F, $9E, $9F, $0F ; row 2
#_0AF950: db $0F, $0F, $AE, $AF, $0F ; row 3
#_0AF955: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF95A: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF95F: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF964: db $0F, $0F, $7E, $7F, $0F ; row 2
#_0AF969: db $0F, $0F, $8E, $0F, $0F ; row 3
#_0AF96E: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF973: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF978: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF97D: db $0F, $0F, $5E, $5F, $0F ; row 2
#_0AF982: db $0F, $0F, $6E, $0F, $0F ; row 3
#_0AF987: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF98C: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF991: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF996: db $0F, $0F, $3E, $3F, $0F ; row 2
#_0AF99B: db $0F, $0F, $4E, $0F, $0F ; row 3
#_0AF9A0: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF9A5: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF9AA: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF9AF: db $0F, $0F, $1E, $1F, $0F ; row 2
#_0AF9B4: db $0F, $0F, $2E, $0F, $0F ; row 3
#_0AF9B9: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF9BE: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF9C3: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF9C8: db $0F, $0F, $0E, $0F, $0F ; row 2
#_0AF9CD: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF9D2: db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_TowerofHera:
#_0AF9D7: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF9DC: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF9E1: db $0F, $0F, $87, $0F, $0F ; row 2
#_0AF9E6: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AF9EB: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AF9F0: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AF9F5: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AF9FA: db $0F, $0F, $77, $0F, $0F ; row 2
#_0AF9FF: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AFA04: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AFA09: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFA0E: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AFA13: db $0F, $0F, $31, $0F, $0F ; row 2
#_0AFA18: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AFA1D: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AFA22: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFA27: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AFA2C: db $0F, $0F, $27, $0F, $0F ; row 2
#_0AFA31: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AFA36: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AFA3B: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFA40: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AFA45: db $0F, $0F, $17, $0F, $0F ; row 2
#_0AFA4A: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AFA4F: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AFA54: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFA59: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AFA5E: db $0F, $0F, $07, $0F, $0F ; row 2
#_0AFA63: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AFA68: db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_ThievesTown:
#_0AFA6D: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFA72: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AFA77: db $0F, $44, $45, $0F, $0F ; row 2
#_0AFA7C: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AFA81: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AFA86: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFA8B: db $0F, $AB, $AC, $0F, $0F ; row 1
#_0AFA90: db $0F, $BB, $BC, $0F, $0F ; row 2
#_0AFA95: db $0F, $CB, $CC, $0F, $0F ; row 3
#_0AFA9A: db $0F, $DB, $DC, $0F, $0F ; row 4

#_0AFA9F: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFAA4: db $0F, $64, $65, $0F, $0F ; row 1
#_0AFAA9: db $0F, $0F, $0F, $0F, $0F ; row 2
#_0AFAAE: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AFAB3: db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_TurtleRock:
#_0AFAB8: db $0F, $A4, $0F, $0F, $0F ; row 0
#_0AFABD: db $0F, $B4, $0F, $0F, $0F ; row 1
#_0AFAC2: db $0F, $0F, $0F, $0F, $0F ; row 2
#_0AFAC7: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AFACC: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AFAD1: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFAD6: db $0F, $0F, $B5, $0F, $0F ; row 1
#_0AFADB: db $0F, $C4, $C5, $0F, $0F ; row 2
#_0AFAE0: db $0F, $0F, $D5, $0F, $0F ; row 3
#_0AFAE5: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AFAEA: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFAEF: db $0F, $0F, $04, $0F, $0F ; row 1
#_0AFAF4: db $0F, $13, $14, $15, $0F ; row 2
#_0AFAF9: db $0F, $23, $24, $0F, $0F ; row 3
#_0AFAFE: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AFB03: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFB08: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AFB0D: db $0F, $0F, $0F, $B6, $B7 ; row 2
#_0AFB12: db $0F, $0F, $0F, $C6, $C7 ; row 3
#_0AFB17: db $0F, $0F, $0F, $D6, $0F ; row 4

;===================================================================================================

DungeonMapRoomData_GanonsTower:
#_0AFB1C: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFB21: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AFB26: db $0F, $0F, $1C, $0F, $0F ; row 2
#_0AFB2B: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AFB30: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AFB35: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFB3A: db $0F, $7B, $7C, $7D, $0F ; row 1
#_0AFB3F: db $0F, $8B, $8C, $8D, $0F ; row 2
#_0AFB44: db $0F, $9B, $9C, $9D, $0F ; row 3
#_0AFB49: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AFB4E: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFB53: db $0F, $0F, $0F, $0F, $0F ; row 1
#_0AFB58: db $0F, $0F, $0C, $0F, $0F ; row 2
#_0AFB5D: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AFB62: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AFB67: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFB6C: db $0F, $0F, $5B, $5C, $0F ; row 1
#_0AFB71: db $0F, $0F, $6B, $0F, $0F ; row 2
#_0AFB76: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AFB7B: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AFB80: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFB85: db $0F, $0F, $0F, $5D, $0F ; row 1
#_0AFB8A: db $0F, $0F, $6C, $6D, $0F ; row 2
#_0AFB8F: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AFB94: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AFB99: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFB9E: db $0F, $0F, $95, $96, $0F ; row 1
#_0AFBA3: db $0F, $0F, $A5, $A6, $0F ; row 2
#_0AFBA8: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AFBAD: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AFBB2: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFBB7: db $0F, $0F, $0F, $3D, $0F ; row 1
#_0AFBBC: db $0F, $0F, $4C, $4D, $0F ; row 2
#_0AFBC1: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AFBC6: db $0F, $0F, $0F, $0F, $0F ; row 4

#_0AFBCB: db $0F, $0F, $0F, $0F, $0F ; row 0
#_0AFBD0: db $0F, $0F, $0D, $0F, $0F ; row 1
#_0AFBD5: db $0F, $0F, $1D, $0F, $0F ; row 2
#_0AFBDA: db $0F, $0F, $0F, $0F, $0F ; row 3
#_0AFBDF: db $0F, $0F, $0F, $0F, $0F ; row 4

;===================================================================================================

DungeonMapRoomLayoutPointers:
#_0AFBE4: dw DungeonMapLayoutData_Sewers
#_0AFBE6: dw DungeonMapLayoutData_HyruleCastle
#_0AFBE8: dw DungeonMapLayoutData_EasternPalace
#_0AFBEA: dw DungeonMapLayoutData_DesertPalace
#_0AFBEC: dw DungeonMapLayoutData_AgahnimsTower
#_0AFBEE: dw DungeonMapLayoutData_SwampPalace
#_0AFBF0: dw DungeonMapLayoutData_PalaceOfDarkness
#_0AFBF2: dw DungeonMapLayoutData_MiseryMire
#_0AFBF4: dw DungeonMapLayoutData_SkullWoods
#_0AFBF6: dw DungeonMapLayoutData_IcePalace
#_0AFBF8: dw DungeonMapLayoutData_TowerOfHera
#_0AFBFA: dw DungeonMapLayoutData_ThievesTown
#_0AFBFC: dw DungeonMapLayoutData_TurtleRock
#_0AFBFE: dw DungeonMapLayoutData_GanonsTower

;===================================================================================================

DungeonMapLayoutData_Sewers:
#_0AFC00: db $00 ; Room 0011
#_0AFC01: db $01 ; Room 0021
#_0AFC02: db $02 ; Room 0022
#_0AFC03: db $03 ; Room 0032
#_0AFC04: db $04 ; Room 0002
#_0AFC05: db $05 ; Room 0012
#_0AFC06: db $06 ; Room 0042
#_0AFC07: db $07 ; Room 0041

;===================================================================================================

DungeonMapLayoutData_HyruleCastle:
#_0AFC08: db $08 ; Room 0080
#_0AFC09: db $09 ; Room 0070
#_0AFC0A: db $0A ; Room 0071
#_0AFC0B: db $0B ; Room 0072
#_0AFC0C: db $0C ; Room 0081
#_0AFC0D: db $0D ; Room 0082
#_0AFC0E: db $0E ; Room 0050
#_0AFC0F: db $0F ; Room 0001
#_0AFC10: db $10 ; Room 0052
#_0AFC11: db $11 ; Room 0060
#_0AFC12: db $12 ; Room 0061
#_0AFC13: db $13 ; Room 0062
#_0AFC14: db $14 ; Room 0051

;===================================================================================================

DungeonMapLayoutData_EasternPalace:
#_0AFC15: db $15 ; Room 0099
#_0AFC16: db $16 ; Room 00A8
#_0AFC17: db $17 ; Room 00A9
#_0AFC18: db $18 ; Room 00AA
#_0AFC19: db $19 ; Room 00B8
#_0AFC1A: db $1A ; Room 00B9
#_0AFC1B: db $1B ; Room 00BA
#_0AFC1C: db $1C ; Room 00C9
#_0AFC1D: db $1D ; Room 00C8
#_0AFC1E: db $1E ; Room 00D8
#_0AFC1F: db $1F ; Room 00D9
#_0AFC20: db $20 ; Room 00DA

;===================================================================================================

DungeonMapLayoutData_DesertPalace:
#_0AFC21: db $22 ; Room 0073
#_0AFC22: db $23 ; Room 0074
#_0AFC23: db $24 ; Room 0076
#_0AFC24: db $25 ; Room 0083
#_0AFC25: db $26 ; Room 0084
#_0AFC26: db $27 ; Room 0086
#_0AFC27: db $21 ; Room 0063
#_0AFC28: db $28 ; Room 0033
#_0AFC29: db $29 ; Room 0042
#_0AFC2A: db $2A ; Room 0053

;===================================================================================================

DungeonMapLayoutData_AgahnimsTower:
#_0AFC2B: db $2B ; Room 00E0
#_0AFC2C: db $2C ; Room 00D0
#_0AFC2D: db $2C ; Room 00C0
#_0AFC2E: db $2D ; Room 00B0
#_0AFC2F: db $2E ; Room 0040
#_0AFC30: db $2F ; Room 0020
#_0AFC31: db $30 ; Room 0030

;===================================================================================================

DungeonMapLayoutData_SwampPalace:
#_0AFC32: db $31 ; Room 0066
#_0AFC33: db $32 ; Room 0076
#_0AFC34: db $33 ; Room 0006
#_0AFC35: db $34 ; Room 0016
#_0AFC36: db $35 ; Room 0026
#_0AFC37: db $36 ; Room 0034
#_0AFC38: db $37 ; Room 0035
#_0AFC39: db $38 ; Room 0036
#_0AFC3A: db $39 ; Room 0037
#_0AFC3B: db $3A ; Room 0038
#_0AFC3C: db $3B ; Room 0046
#_0AFC3D: db $3C ; Room 0054
#_0AFC3E: db $3D ; Room 0028

;===================================================================================================

DungeonMapLayoutData_PalaceOfDarkness:
#_0AFC3F: db $3E ; Room 005A
#_0AFC40: db $3F ; Room 006A
#_0AFC41: db $40 ; Room 000B
#_0AFC42: db $41 ; Room 000A
#_0AFC43: db $42 ; Room 003B
#_0AFC44: db $43 ; Room 0009
#_0AFC45: db $44 ; Room 004B
#_0AFC46: db $45 ; Room 0019
#_0AFC47: db $46 ; Room 001A
#_0AFC48: db $47 ; Room 001B
#_0AFC49: db $48 ; Room 002A
#_0AFC4A: db $49 ; Room 002B
#_0AFC4B: db $4A ; Room 003A
#_0AFC4C: db $4B ; Room 004A

;===================================================================================================

DungeonMapLayoutData_MiseryMire:
#_0AFC4D: db $4E ; Room 0091
#_0AFC4E: db $4F ; Room 0092
#_0AFC4F: db $50 ; Room 0093
#_0AFC50: db $52 ; Room 0090
#_0AFC51: db $53 ; Room 00A0
#_0AFC52: db $54 ; Room 00A1
#_0AFC53: db $55 ; Room 00A2
#_0AFC54: db $56 ; Room 00A3
#_0AFC55: db $57 ; Room 00B1
#_0AFC56: db $58 ; Room 00B2
#_0AFC57: db $59 ; Room 00B3
#_0AFC58: db $5A ; Room 00C1
#_0AFC59: db $5B ; Room 00C2
#_0AFC5A: db $5C ; Room 00C3
#_0AFC5B: db $5D ; Room 00D1
#_0AFC5C: db $5E ; Room 00D2
#_0AFC5D: db $5F ; Room 0097
#_0AFC5E: db $60 ; Room 0098

;===================================================================================================

DungeonMapLayoutData_SkullWoods:
#_0AFC5F: db $61 ; Room 0029
#_0AFC60: db $62 ; Room 0039
#_0AFC61: db $63 ; Room 0049
#_0AFC62: db $64 ; Room 0059
#_0AFC63: db $65 ; Room 0056
#_0AFC64: db $66 ; Room 0057
#_0AFC65: db $67 ; Room 0058
#_0AFC66: db $68 ; Room 0067
#_0AFC67: db $69 ; Room 0068

;===================================================================================================

DungeonMapLayoutData_IcePalace:
#_0AFC68: db $6A ; Room 00DE
#_0AFC69: db $6B ; Room 00BE
#_0AFC6A: db $6C ; Room 00BF
#_0AFC6B: db $6D ; Room 00CE
#_0AFC6C: db $6E ; Room 009E
#_0AFC6D: db $6F ; Room 009F
#_0AFC6E: db $70 ; Room 00AE
#_0AFC6F: db $71 ; Room 00AF
#_0AFC70: db $72 ; Room 007E
#_0AFC71: db $73 ; Room 007F
#_0AFC72: db $74 ; Room 008E
#_0AFC73: db $75 ; Room 005E
#_0AFC74: db $76 ; Room 005F
#_0AFC75: db $77 ; Room 006E
#_0AFC76: db $78 ; Room 003E
#_0AFC77: db $79 ; Room 003F
#_0AFC78: db $7A ; Room 004E
#_0AFC79: db $7B ; Room 001E
#_0AFC7A: db $7C ; Room 001F
#_0AFC7B: db $7D ; Room 002E
#_0AFC7C: db $7E ; Room 000E

;===================================================================================================

DungeonMapLayoutData_TowerOfHera:
#_0AFC7D: db $7F ; Room 0087
#_0AFC7E: db $80 ; Room 0077
#_0AFC7F: db $81 ; Room 0031
#_0AFC80: db $82 ; Room 0027
#_0AFC81: db $83 ; Room 0017
#_0AFC82: db $84 ; Room 0007

;===================================================================================================

DungeonMapLayoutData_ThievesTown:
#_0AFC83: db $85 ; Room 0044
#_0AFC84: db $86 ; Room 0045
#_0AFC85: db $87 ; Room 00AB
#_0AFC86: db $88 ; Room 00AC
#_0AFC87: db $89 ; Room 00BB
#_0AFC88: db $8A ; Room 00BC
#_0AFC89: db $8B ; Room 00CB
#_0AFC8A: db $8C ; Room 00CC
#_0AFC8B: db $8D ; Room 00DB
#_0AFC8C: db $8E ; Room 00DC
#_0AFC8D: db $8F ; Room 0064
#_0AFC8E: db $90 ; Room 0065

;===================================================================================================

DungeonMapLayoutData_TurtleRock:
#_0AFC8F: db $91 ; Room 00A4
#_0AFC90: db $92 ; Room 00B4
#_0AFC91: db $93 ; Room 00B5
#_0AFC92: db $94 ; Room 00C4
#_0AFC93: db $95 ; Room 00C5
#_0AFC94: db $4C ; Room 00D5
#_0AFC95: db $96 ; Room 0004
#_0AFC96: db $97 ; Room 0013
#_0AFC97: db $98 ; Room 0014
#_0AFC98: db $99 ; Room 0015
#_0AFC99: db $4D ; Room 0023
#_0AFC9A: db $9A ; Room 0024
#_0AFC9B: db $9B ; Room 00B6
#_0AFC9C: db $9C ; Room 00B7
#_0AFC9D: db $9D ; Room 00C6
#_0AFC9E: db $9E ; Room 00C7
#_0AFC9F: db $9F ; Room 00D6

;===================================================================================================

DungeonMapLayoutData_GanonsTower:
#_0AFCA0: db $A0 ; Room 001C
#_0AFCA1: db $A1 ; Room 007B
#_0AFCA2: db $A2 ; Room 007C
#_0AFCA3: db $A3 ; Room 007D
#_0AFCA4: db $A4 ; Room 008B
#_0AFCA5: db $A5 ; Room 008C
#_0AFCA6: db $A6 ; Room 008D
#_0AFCA7: db $A7 ; Room 009B
#_0AFCA8: db $A8 ; Room 009C
#_0AFCA9: db $A9 ; Room 009D
#_0AFCAA: db $AA ; Room 000C
#_0AFCAB: db $AB ; Room 005B
#_0AFCAC: db $AC ; Room 005C
#_0AFCAD: db $AD ; Room 006B
#_0AFCAE: db $AE ; Room 005D
#_0AFCAF: db $AF ; Room 006C
#_0AFCB0: db $B0 ; Room 006D
#_0AFCB1: db $B1 ; Room 0095
#_0AFCB2: db $B2 ; Room 0096
#_0AFCB3: db $B3 ; Room 00A5
#_0AFCB4: db $B4 ; Room 00A6
#_0AFCB5: db $B5 ; Room 0034
#_0AFCB6: db $B6 ; Room 004C
#_0AFCB7: db $B7 ; Room 004D
#_0AFCB8: db $B8 ; Room 000D
#_0AFCB9: db $B9 ; Room 001D

;===================================================================================================
; FREE ROM: 0x26
;===================================================================================================
NULL_0AFCBA:
#_0AFCBA: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0AFCC2: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0AFCCA: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0AFCD2: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0AFCDA: db $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

HUDBigNumbersTop:
#_0AFCE0: dw $2508 ; 1
#_0AFCE2: dw $2509 ; 2
#_0AFCE4: dw $2509 ; 3
#_0AFCE6: dw $250A ; 4
#_0AFCE8: dw $250B ; 5
#_0AFCEA: dw $250C ; 6
#_0AFCEC: dw $250D ; 7
#_0AFCEE: dw $251D ; 8
#_0AFCF0: dw $E51C ; 9
#_0AFCF2: dw $250E ; 0
#_0AFCF4: dw $007F ; -

;---------------------------------------------------------------------------------------------------

HUDBigNumbersBottom:
#_0AFCF6: dw $2518 ; 1
#_0AFCF8: dw $2519 ; 2
#_0AFCFA: dw $A509 ; 3
#_0AFCFC: dw $251A ; 4
#_0AFCFE: dw $251B ; 5
#_0AFD00: dw $251C ; 6
#_0AFD02: dw $2518 ; 7
#_0AFD04: dw $A51D ; 8
#_0AFD06: dw $E50C ; 9
#_0AFD08: dw $A50E ; 0
#_0AFD0A: dw $007F ; -

;===================================================================================================

HUD_HandleFloorIndicator:
#_0AFD0C: REP #$30

#_0AFD0E: LDA.w $04A0
#_0AFD11: AND.w #$00FF
#_0AFD14: BEQ HUD_HideBigNumbers

#_0AFD16: INC A
#_0AFD17: CMP.w #$00C0
#_0AFD1A: BNE .dont_clear

#_0AFD1C: LDA.w #$0000

.dont_clear
#_0AFD1F: STA.w $04A0

;---------------------------------------------------------------------------------------------------

#_0AFD22: PHB
#_0AFD23: PHK
#_0AFD24: PLB

#_0AFD25: LDA.w #$251E
#_0AFD28: STA.l $7EC7F2

#_0AFD2C: INC A
#_0AFD2D: STA.l $7EC834

#_0AFD31: INC A
#_0AFD32: STA.l $7EC832

#_0AFD36: LDA.w #$250F
#_0AFD39: STA.l $7EC7F4

#_0AFD3D: LDX.w #$0000

#_0AFD40: LDA.b $A3
#_0AFD42: BMI .basement_floors

#_0AFD44: LDA.b $A4
#_0AFD46: BNE .no_rain_noise

#_0AFD48: LDA.b $A0
#_0AFD4A: CMP.w #$0002 ; ROOM 0002
#_0AFD4D: BEQ .no_rain_noise

#_0AFD4F: SEP #$20

#_0AFD51: LDA.l $7EF3C5
#_0AFD55: CMP.b #$02
#_0AFD57: BCS .too_late_for_rain

#_0AFD59: LDA.b #$03 ; SFX1.03
#_0AFD5B: STA.w $012D

;---------------------------------------------------------------------------------------------------

.too_late_for_rain
#_0AFD5E: REP #$20

.no_rain_noise
#_0AFD60: LDA.b $A4
#_0AFD62: AND.w #$00FF
#_0AFD65: BRA .continue

.basement_floors
#_0AFD67: SEP #$20

#_0AFD69: LDA.b #$05 ; SFX1.05
#_0AFD6B: STA.w $012D

#_0AFD6E: REP #$20

#_0AFD70: INX
#_0AFD71: INX

#_0AFD72: LDA.b $A4
#_0AFD74: ORA.w #$FF00
#_0AFD77: EOR.w #$FFFF

;---------------------------------------------------------------------------------------------------

.continue
#_0AFD7A: ASL A
#_0AFD7B: TAY

#_0AFD7C: LDA.w HUDBigNumbersTop,Y
#_0AFD7F: STA.l $7EC7F2,X

#_0AFD83: LDA.w HUDBigNumbersBottom,Y
#_0AFD86: STA.l $7EC832,X

#_0AFD8A: SEP #$30

#_0AFD8C: PLB

#_0AFD8D: INC.b $16

#_0AFD8F: RTL

;===================================================================================================

HUD_HideBigNumbers:
#_0AFD90: REP #$20

#_0AFD92: LDA.w #$007F
#_0AFD95: STA.l $7EC7F2
#_0AFD99: STA.l $7EC832
#_0AFD9D: STA.l $7EC7F4
#_0AFDA1: STA.l $7EC834

#_0AFDA5: SEP #$30

#_0AFDA7: RTL

;===================================================================================================

HUD_HandleBigTimer:
#_0AFDA8: LDA.w $04B5
#_0AFDAB: BNE .dont_tick

#_0AFDAD: LDA.w $04B4
#_0AFDB0: BMI .timer_ended

#_0AFDB2: DEC.w $04B4

#_0AFDB5: LDA.b #$3E
#_0AFDB7: STA.w $04B5

.dont_tick
#_0AFDBA: DEC.w $04B5

#_0AFDBD: LDA.w $04B4
#_0AFDC0: BPL .draw_numbers

.timer_ended
#_0AFDC2: LDA.b #$FF
#_0AFDC4: STA.w $04B4

#_0AFDC7: REP #$30

#_0AFDC9: BRA HUD_HideBigNumbers

;---------------------------------------------------------------------------------------------------

.draw_numbers
#_0AFDCB: LDA.w $04B4
#_0AFDCE: STA.w WRDIVL

#_0AFDD1: STZ.w WRDIVH

#_0AFDD4: LDA.b #10
#_0AFDD6: STA.w $4206

#_0AFDD9: NOP ; 8 NOP
#_0AFDDA: NOP
#_0AFDDB: NOP
#_0AFDDC: NOP
#_0AFDDD: NOP
#_0AFDDE: NOP
#_0AFDDF: NOP
#_0AFDE0: NOP

#_0AFDE1: LDA.w RDDIV
#_0AFDE4: ASL A
#_0AFDE5: STA.b $00

#_0AFDE7: LDA.w RDMPY
#_0AFDEA: ASL A
#_0AFDEB: STA.b $02

;---------------------------------------------------------------------------------------------------

#_0AFDED: PHB
#_0AFDEE: PHK
#_0AFDEF: PLB

#_0AFDF0: REP #$20

#_0AFDF2: LDX.b #$02

.next_number
#_0AFDF4: LDY.b $00,X

#_0AFDF6: DEY
#_0AFDF7: DEY
#_0AFDF8: BPL .draw_digit

#_0AFDFA: LDY.b #$12
#_0AFDFC: CPX.b #$00
#_0AFDFE: BNE .draw_digit

#_0AFE00: LDY.b #$14

.draw_digit
#_0AFE02: LDA.w HUDBigNumbersTop,Y
#_0AFE05: STA.l $7EC7F2,X

#_0AFE09: LDA.w HUDBigNumbersBottom,Y
#_0AFE0C: STA.l $7EC832,X

#_0AFE10: DEX
#_0AFE11: DEX
#_0AFE12: BPL .next_number

#_0AFE14: SEP #$20

#_0AFE16: PLB

#_0AFE17: RTL

;===================================================================================================
; FREE ROM: 0x08
;===================================================================================================
NULL_0AFE18:
#_0AFE18: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

GameOver_InitializeLetters:
#_0AFE20: PHB
#_0AFE21: PHK
#_0AFE22: PLB

#_0AFE23: STZ.w $035F

#_0AFE26: LDA.b #$B0
#_0AFE28: STA.w $0C04
#_0AFE2B: STA.w $0C05
#_0AFE2E: STA.w $0C06
#_0AFE31: STA.w $0C07

#_0AFE34: STA.w $0C08
#_0AFE37: STA.w $0C09
#_0AFE3A: STA.w $0C0A
#_0AFE3D: STA.w $0C0B

;---------------------------------------------------------------------------------------------------

#_0AFE40: LDA.b #$00
#_0AFE42: STA.w $0C18
#_0AFE45: STA.w $0C19
#_0AFE48: STA.w $0C1A
#_0AFE4B: STA.w $0C1B

#_0AFE4E: STA.w $0C1C
#_0AFE51: STA.w $0C1D
#_0AFE54: STA.w $0C1E
#_0AFE57: STA.w $0C1F

;---------------------------------------------------------------------------------------------------

#_0AFE5A: INC A
#_0AFE5B: STA.w $0C4A

#_0AFE5E: LDA.b #$06
#_0AFE60: STA.w $039D

#_0AFE63: PLB
#_0AFE64: RTL

;===================================================================================================
; FREE ROM: 0x0B
;===================================================================================================
NULL_0AFE65:
#_0AFE65: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0AFE6D: db $FF, $FF, $FF

;===================================================================================================

pool Underworld_HandleLayerEffect

.vectors
#_0AFE70: dw LayerEffect_Nothing           ; 00
#_0AFE72: dw LayerEffect_Nothing           ; 01
#_0AFE74: dw LayerEffect_Scroll            ; 02
#_0AFE76: dw LayerEffect_WaterRapids       ; 03
#_0AFE78: dw LayerEffect_Trinexx           ; 04
#_0AFE7A: dw LayerEffect_Agahnim2          ; 05
#_0AFE7C: dw LayerEffect_InvisibleFloor    ; 06
#_0AFE7E: dw LayerEffect_Ganon             ; 07

pool off

;---------------------------------------------------------------------------------------------------

Underworld_HandleLayerEffect:
#_0AFE80: LDA.b $AD
#_0AFE82: ASL A
#_0AFE83: TAX

#_0AFE84: JMP.w (.vectors,X)

;===================================================================================================

LayerEffect_Nothing:
#_0AFE87: RTL

;===================================================================================================

LayerEffect_Scroll:
#_0AFE88: LDA.w $0403
#_0AFE8B: AND.b #$80
#_0AFE8D: BEQ .continue

#_0AFE8F: STZ.b $AD

#_0AFE91: RTL

;---------------------------------------------------------------------------------------------------

.continue
#_0AFE92: REP #$30

#_0AFE94: STZ.w $0312
#_0AFE97: STZ.w $0310

#_0AFE9A: LDA.w $041A
#_0AFE9D: LSR A
#_0AFE9E: BCS .exit

#_0AFEA0: ASL A
#_0AFEA1: AND.w #$0002
#_0AFEA4: TAX

#_0AFEA5: LDA.w $041C
#_0AFEA8: CLC
#_0AFEA9: ADC.w #$8000
#_0AFEAC: STA.w $041C

#_0AFEAF: ROL A
#_0AFEB0: AND.w #$0001

#_0AFEB3: CPX.w #$0002
#_0AFEB6: BNE .dont_invert

#_0AFEB8: EOR.w #$FFFF
#_0AFEBB: INC A

.dont_invert
#_0AFEBC: LDX.w $041A
#_0AFEBF: CPX.w #$0004
#_0AFEC2: BCS .scroll_vertically

#_0AFEC4: STA.w $0312

#_0AFEC7: LDA.w $0422
#_0AFECA: SEC
#_0AFECB: SBC.w $0312
#_0AFECE: STA.w $0422

#_0AFED1: CLC
#_0AFED2: ADC.b $E2
#_0AFED4: STA.b $E0

#_0AFED6: SEP #$30

#_0AFED8: RTL

;---------------------------------------------------------------------------------------------------

.scroll_vertically
#_0AFED9: STA.w $0310

#_0AFEDC: LDA.w $0424
#_0AFEDF: SEC
#_0AFEE0: SBC.w $0310
#_0AFEE3: STA.w $0424

#_0AFEE6: CLC
#_0AFEE7: ADC.b $E8
#_0AFEE9: STA.b $E6

.exit
#_0AFEEB: SEP #$30

#_0AFEED: RTL

;===================================================================================================

LayerEffect_Trinexx:
#_0AFEEE: REP #$20

#_0AFEF0: LDA.w $0422
#_0AFEF3: CLC
#_0AFEF4: ADC.w $0312
#_0AFEF7: STA.w $0422

#_0AFEFA: LDA.w $0424
#_0AFEFD: CLC
#_0AFEFE: ADC.w $0310
#_0AFF01: STA.w $0424

#_0AFF04: STZ.w $0312
#_0AFF07: STZ.w $0310

#_0AFF0A: SEP #$20

#_0AFF0C: RTL

;===================================================================================================

LayerEffect_Agahnim2:
#_0AFF0D: LDA.b $1A
#_0AFF0F: AND.b #$7F
#_0AFF11: CMP.b #$03
#_0AFF13: BEQ .flash

#_0AFF15: CMP.b #$05
#_0AFF17: BEQ .restore

#_0AFF19: CMP.b #$24
#_0AFF1B: BEQ .flash

#_0AFF1D: CMP.b #$26
#_0AFF1F: BNE .disable

;---------------------------------------------------------------------------------------------------

.restore
#_0AFF21: REP #$20

#_0AFF23: LDA.l $7EC3DA
#_0AFF27: STA.l $7EC5DA

#_0AFF2B: LDA.l $7EC3DC
#_0AFF2F: STA.l $7EC5DC

#_0AFF33: LDA.l $7EC3DE

;---------------------------------------------------------------------------------------------------

.set_color
#_0AFF37: STA.l $7EC5DE
#_0AFF3B: STA.l $7EC5EE

#_0AFF3F: SEP #$20

#_0AFF41: INC.b $15

;---------------------------------------------------------------------------------------------------

.disable
#_0AFF43: LDA.b #$02
#_0AFF45: STA.b $1D

#_0AFF47: RTL

;---------------------------------------------------------------------------------------------------

.flash
#_0AFF48: REP #$20

#_0AFF4A: LDA.w #$1D59 ; RGB: #C85038
#_0AFF4D: STA.l $7EC5DA

#_0AFF51: LDA.w #$25FF ; RGB: #F87848
#_0AFF54: STA.l $7EC5DC

#_0AFF58: LDA.w #$001A ; RGB: #D00000
#_0AFF5B: BRA .set_color

;===================================================================================================

LayerEffect_InvisibleFloor:
#_0AFF5D: REP #$30

#_0AFF5F: LDX.w #$0000
#_0AFF62: STX.b $00

.next
#_0AFF64: LDA.w $0540,X
#_0AFF67: ASL A
#_0AFF68: BCC .skip

#_0AFF6A: INC.b $00

.skip
#_0AFF6C: INX
#_0AFF6D: INX
#_0AFF6E: CPX.w #$0020
#_0AFF71: BNE .next

;---------------------------------------------------------------------------------------------------

#_0AFF73: LDX.w #$2940 ; RGB: #005050
#_0AFF76: LDY.w #$4E60 ; RGB: #009898

#_0AFF79: LDA.b $00
#_0AFF7B: BNE .dont_use_black

#_0AFF7D: LDX.w #$0000 ; RGB: #000000
#_0AFF80: LDY.w #$0000 ; RGB: #000000

.dont_use_black
#_0AFF83: TXA

#_0AFF84: CMP.l $7EC3F6
#_0AFF88: BEQ .already_matches

#_0AFF8A: STA.l $7EC3F6
#_0AFF8E: STA.l $7EC5F6

#_0AFF92: TYA
#_0AFF93: STA.l $7EC3F8
#_0AFF97: STA.l $7EC5F8

#_0AFF9B: INC.b $15

.already_matches
#_0AFF9D: SEP #$30

#_0AFF9F: LDA.b #$02
#_0AFFA1: STA.b $1D

#_0AFFA3: RTL

;===================================================================================================

LayerEffect_Ganon:
#_0AFFA4: STZ.w $04C5

#_0AFFA7: REP #$30

#_0AFFA9: LDX.w #$0000

.next_torch_check
#_0AFFAC: LDA.w $0540,X
#_0AFFAF: ASL A
#_0AFFB0: BCC .torch_off

#_0AFFB2: INC.w $04C5

.torch_off
#_0AFFB5: INX
#_0AFFB6: INX
#_0AFFB7: CPX.w #$0006
#_0AFFBA: BNE .next_torch_check

;---------------------------------------------------------------------------------------------------

#_0AFFBC: SEP #$30

#_0AFFBE: LDA.w $04C5
#_0AFFC1: BNE .not_dark

#_0AFFC3: STZ.b $1D

#_0AFFC5: LDA.b #$B3
#_0AFFC7: STA.b $9A

#_0AFFC9: RTL

.not_dark
#_0AFFCA: CMP.b #$01
#_0AFFCC: BNE .opaque

#_0AFFCE: LDA.b #$02
#_0AFFD0: STA.b $1D

#_0AFFD2: LDA.b #$70
#_0AFFD4: STA.b $9A

#_0AFFD6: RTL

;---------------------------------------------------------------------------------------------------

.opaque
#_0AFFD7: STZ.b $1D

#_0AFFD9: LDA.b #$70
#_0AFFDB: STA.b $9A

#_0AFFDD: RTL

;===================================================================================================

LayerEffect_WaterRapids:
#_0AFFDE: REP #$21

#_0AFFE0: LDA.w #$8000
#_0AFFE3: ADC.w $041C
#_0AFFE6: STA.w $041C

#_0AFFE9: ROL A
#_0AFFEA: AND.w #$0001
#_0AFFED: STA.b $00

#_0AFFEF: LDA.w #$0000
#_0AFFF2: SEC
#_0AFFF3: SBC.b $00
#_0AFFF5: STA.w $0312

#_0AFFF8: SEP #$20

#_0AFFFA: RTL

;===================================================================================================
; FREE ROM: 0x05
;===================================================================================================
NULL_0AFFFB:
#_0AFFFB: db $FF, $FF, $FF, $FF, $FF

;===================================================================================================
