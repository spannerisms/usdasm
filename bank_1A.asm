; see «sound.asm»

org $1AF424

;===================================================================================================
; FREE ROM: 0xD9 including garbage
;===================================================================================================
GARBAGE_1AF424:
#_1AF424: db $34, $00, $00, $00, $00, $01, $FF, $00, $00, $00, $00, $00

NULL_1AF430:
#_1AF430: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF438: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF440: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF448: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF450: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF458: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF460: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF468: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF470: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF478: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF480: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF488: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF490: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF498: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF4A0: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF4A8: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF4B0: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF4B8: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF4C0: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF4C8: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF4D0: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF4D8: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF4E0: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF4E8: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF4F0: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1AF4F8: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

pool SpriteDraw_BatCrash

.oam_groups

.oam_group00
#_1AF500: dw   0,   0 : db $4B, $04, $00, $00

.oam_group01
#_1AF508: dw   5,  -4 : db $5B, $04, $00, $00

.oam_group02
#_1AF510: dw  -2,  -4 : db $64, $04, $00, $02

.oam_group03
#_1AF518: dw  -2,  -4 : db $49, $04, $00, $02

.oam_group04
#_1AF520: dw  -8,  -9 : db $6C, $04, $00, $02
#_1AF528: dw   8,  -9 : db $6C, $44, $00, $02

.oam_group05
#_1AF530: dw  -8,  -7 : db $4C, $04, $00, $02
#_1AF538: dw   8,  -7 : db $4C, $44, $00, $02

.oam_group06
#_1AF540: dw  -8,  -9 : db $44, $04, $00, $02
#_1AF548: dw   8,  -9 : db $44, $44, $00, $02

.oam_group07
#_1AF550: dw  -8,  -8 : db $62, $04, $00, $02
#_1AF558: dw   8,  -8 : db $62, $44, $00, $02

.oam_group08
#_1AF560: dw  -8,  -7 : db $60, $04, $00, $02
#_1AF568: dw   8,  -7 : db $60, $44, $00, $02

.oam_group09
#_1AF570: dw   0,   0 : db $4E, $04, $00, $02
#_1AF578: dw  16,   0 : db $4E, $44, $00, $02
#_1AF580: dw   0,  16 : db $6E, $04, $00, $02
#_1AF588: dw  16,  16 : db $6E, $44, $00, $02

pool off

;===================================================================================================

pool BatCrash BatCrash_Approach

.position_x
#_1AF590: dw $07DC, $07F0, $0820, $0818

.position_y
#_1AF598: dw $062E, $0636, $0630, $05E0

.anim_timer
#_1AF5A0: db     4,     3,     4,     6,     0

pool off

;===================================================================================================

Sprite_37_Waterfall:
#_1AF5A5: PHB
#_1AF5A6: PHK
#_1AF5A7: PLB

#_1AF5A8: JSR .main

#_1AF5AB: PLB

#_1AF5AC: RTL

;---------------------------------------------------------------------------------------------------

.main
#_1AF5AD: LDA.w $0E80,X
#_1AF5B0: JSL JumpTableLocal
#_1AF5B4: dw Waterfall
#_1AF5B6: dw BatCrash

;===================================================================================================

Waterfall:
#_1AF5B8: JSR Sprite_CheckIfActive_Bank1A
#_1AF5BB: JSL Sprite_CheckDamageToLink_same_layer_long
#_1AF5BF: BCC .exit

#_1AF5C1: LDA.b $8A
#_1AF5C3: CMP.b #$43 ; OW 43
#_1AF5C5: BEQ .on_gt_screen

#_1AF5C7: PHX

#_1AF5C8: JSL AncillaAdd_WaterfallSplash

#_1AF5CC: PLX

.exit
#_1AF5CD: RTS

;---------------------------------------------------------------------------------------------------

.on_gt_screen
#_1AF5CE: PHX

#_1AF5CF: JSL AncillaAdd_GTCutscene

#_1AF5D3: PLX

#_1AF5D4: RTS

;===================================================================================================

pool BatCrash

.shake_low
#_1AF5D5: db  1, -1

.shake_high
#_1AF5D7: db  0, -1

pool off

;---------------------------------------------------------------------------------------------------

BatCrash:
#_1AF5D9: JSR SpriteDraw_BatCrash
#_1AF5DC: JSR Sprite_CheckIfActive_Bank1A
#_1AF5DF: JSL Sprite_Move_XY_Bank1D_long
#_1AF5E3: JSR BatCrash_DrawHardcodedGarbage

#_1AF5E6: STZ.w $011C
#_1AF5E9: STZ.w $011D

#_1AF5EC: LDA.w $0EE0,X
#_1AF5EF: BEQ .timer1_done

#_1AF5F1: DEC A
#_1AF5F2: BNE .still_nonzero

#_1AF5F4: LDY.b #$05 ; SFX1.05
#_1AF5F6: STY.w $012D

.still_nonzero
#_1AF5F9: AND.b #$01
#_1AF5FB: TAY

#_1AF5FC: LDA.w .shake_low,Y
#_1AF5FF: STA.w $011C

#_1AF602: LDA.w .shake_high,Y
#_1AF605: STA.w $011D

.timer1_done
#_1AF608: LDA.w $0DF0,X
#_1AF60B: BNE .timer_running

#_1AF60D: LDA.w $0DC0,X
#_1AF610: INC A
#_1AF611: AND.b #$03
#_1AF613: STA.w $0DC0,X
#_1AF616: BNE .no_flap_sfx

#_1AF618: LDA.w $0D80,X
#_1AF61B: CMP.b #$02
#_1AF61D: BCS .no_flap_sfx

#_1AF61F: LDA.b #$03 ; SFX2.03
#_1AF621: JSL SpriteSFX_QueueSFX2WithPan

.no_flap_sfx
#_1AF625: LDY.w $0DE0,X

#_1AF628: LDA.w .anim_timer,Y
#_1AF62B: STA.w $0DF0,X

.timer_running
#_1AF62E: LDA.w $0D80,X
#_1AF631: JSL JumpTableLocal
#_1AF635: dw BatCrash_Approach
#_1AF637: dw BatCrash_Ascend
#_1AF639: dw BatCrash_DiveBomb
#_1AF63B: dw BatCrash_StallTheInevitable

;===================================================================================================

BatCrash_Approach:
#_1AF63D: LDA.w $0D90,X
#_1AF640: ASL A
#_1AF641: TAY

#_1AF642: REP #$20

#_1AF644: LDA.w .position_x,Y
#_1AF647: CMP.w $0FD8

#_1AF64A: SEP #$30
#_1AF64C: BCS BatCrash_HandleYMovement

#_1AF64E: CPY.b #$04
#_1AF650: BCC .still_approaching

#_1AF652: INC.w $0D80,X

#_1AF655: LDA.b #$D0
#_1AF657: STA.w $0E00,X

.still_approaching
#_1AF65A: INC.w $0D90,X

#_1AF65D: INC.w $0DE0,X

;===================================================================================================

#BatCrash_HandleYMovement:
#_1AF660: LDA.b $1A
#_1AF662: AND.b #$07
#_1AF664: BNE .done_Y

#_1AF666: REP #$20

#_1AF668: LDA.w .position_y,Y
#_1AF66B: CMP.w $0FDA

#_1AF66E: SEP #$30
#_1AF670: BCC .ypos_not_reached

#_1AF672: INC.w $0D40,X
#_1AF675: BRA .done_Y

.ypos_not_reached
#_1AF677: DEC.w $0D40,X

.done_Y
#_1AF67A: LDA.b $1A
#_1AF67C: AND.b #$0F
#_1AF67E: BNE .exit

#_1AF680: INC.w $0D50,X

.exit
#_1AF683: RTS

;===================================================================================================

BatCrash_Ascend:
#_1AF684: LDA.w $0E00,X
#_1AF687: BNE .ascending

#_1AF689: INC.w $0D80,X

#_1AF68C: LDA.b #$26 ; SFX3.26
#_1AF68E: JSL SpriteSFX_QueueSFX3WithPan

#_1AF692: INC.w $0DE0,X

#_1AF695: LDA.b #$E8
#_1AF697: STA.w $0D10,X

#_1AF69A: LDA.b #$07
#_1AF69C: STA.w $0D30,X

#_1AF69F: LDA.b #$E0
#_1AF6A1: STA.w $0D00,X

#_1AF6A4: LDA.b #$05
#_1AF6A6: STA.w $0D20,X
#_1AF6A9: STZ.w $0D50,X

#_1AF6AC: LDA.b #$40
#_1AF6AE: STA.w $0D40,X

#_1AF6B1: LDA.b #$2D
#_1AF6B3: STA.w $0E00,X

#_1AF6B6: RTS

.ascending
#_1AF6B7: LDA.b $1A
#_1AF6B9: AND.b #$03
#_1AF6BB: BNE .dont_tick

#_1AF6BD: DEC.w $0D50,X

.dont_tick
#_1AF6C0: LDA.w $0D90,X
#_1AF6C3: ASL A
#_1AF6C4: TAY

#_1AF6C5: JMP.w BatCrash_HandleYMovement

;===================================================================================================

BatCrash_DiveBomb:
#_1AF6C8: LDA.w $0E00,X
#_1AF6CB: BNE .descending

#_1AF6CD: STZ.w $0D40,X

#_1AF6D0: LDA.b #$60
#_1AF6D2: STA.w $0E00,X

#_1AF6D5: INC.w $0D80,X

.descending
#_1AF6D8: LDA.w $0E00,X
#_1AF6DB: CMP.b #$09
#_1AF6DD: BNE .exit

#_1AF6DF: JSR BatCrash_SpawnDebris

#_1AF6E2: PHX

#_1AF6E3: JSL CreatePyramidHole

#_1AF6E7: PLX

.exit
#_1AF6E8: RTS

;===================================================================================================

BatCrash_StallTheInevitable:
#_1AF6E9: LDA.w $0E00,X
#_1AF6EC: BNE .stayin_alive

#_1AF6EE: STZ.w $0DD0,X

#_1AF6F1: INC.w $0200

.stayin_alive
#_1AF6F4: RTS

;===================================================================================================

Sprite_SpawnBatCrashCutscene:
#_1AF6F5: LDA.b #$37 ; SPRITE 37
#_1AF6F7: JSL Sprite_SpawnDynamically

#_1AF6FB: LDA.b #$00
#_1AF6FD: STA.w $0D40,Y
#_1AF700: STA.w $0DA0,Y
#_1AF703: STA.w $0DE0,Y
#_1AF706: STA.w $0F20,Y

#_1AF709: INC A
#_1AF70A: STA.w $0E80,Y
#_1AF70D: STA.w $0E40,Y
#_1AF710: STA.w $0E60,Y
#_1AF713: STA.w $0F50,Y

#_1AF716: LDA.b #$CC
#_1AF718: STA.w $0D10,Y

#_1AF71B: LDA.b #$07
#_1AF71D: STA.w $0D30,Y

#_1AF720: LDA.b #$32
#_1AF722: STA.w $0D00,Y

#_1AF725: LDA.b #$06
#_1AF727: STA.w $0D20,Y

#_1AF72A: LDA.b #$80
#_1AF72C: STA.w $0CAA,Y

#_1AF72F: RTL

;===================================================================================================

pool BatCrash_DrawHardcodedGarbage

.data
#_1AF730: db $68, $97, $57, $01
#_1AF734: db $78, $97, $57, $01
#_1AF738: db $88, $97, $57, $01
#_1AF73C: db $68, $A7, $57, $01
#_1AF740: db $78, $A7, $57, $01
#_1AF744: db $88, $A7, $57, $01
#_1AF748: db $65, $90, $57, $01
#_1AF74C: db $8B, $90, $57, $01

pool off

;---------------------------------------------------------------------------------------------------

BatCrash_DrawHardcodedGarbage:
#_1AF750: REP #$20

#_1AF752: LDY.b #$20

.next_object
#_1AF754: LDA.w .data-2,Y
#_1AF757: STA.w $092E,Y

#_1AF75A: DEY
#_1AF75B: DEY
#_1AF75C: BNE .next_object

;---------------------------------------------------------------------------------------------------

#_1AF75E: LDY.b #$08

#_1AF760: LDA.w #$0202

.next_prop
#_1AF763: STA.w $0A6C,Y

#_1AF766: DEY
#_1AF767: DEY
#_1AF768: BPL .next_prop

#_1AF76A: SEP #$30

#_1AF76C: RTS

;===================================================================================================

pool BatCrash_SpawnDebris

.offset_x
#_1AF76D: db  -8,   0,   8,  16,  24,  32
#_1AF773: db  -8,   0,   8,  16,  24,  32
#_1AF779: db  -8,   0,   8,  16,  24,  32
#_1AF77F: db  -8,   0,   8,  16,  24,  32
#_1AF785: db  -8,   0,   8,  16,  24,  32

.offset_y
#_1AF78B: db  48,  48,  48,  48,  48,  48
#_1AF791: db  40,  40,  40,  40,  40,  40
#_1AF797: db  32,  32,  32,  32,  32,  32
#_1AF79D: db  24,  24,  24,  24,  24,  24
#_1AF7A3: db  16,  16,  16,  16,  16,  16

.speed_x
#_1AF7A9: db $E2, $E7, $F8, $08, $19, $1E
#_1AF7AF: db $CE, $D3, $EC, $14, $2D, $32
#_1AF7B5: db $CE, $DD, $E7, $19, $23, $32
#_1AF7BB: db $D3, $CE, $C4, $3C, $32, $2D
#_1AF7C1: db $E2, $DD, $D8, $28, $23, $1E

.speed_y
#_1AF7C7: db $02, $05, $0A, $0A, $05, $02
#_1AF7CD: db $05, $14, $1E, $1E, $14, $05
#_1AF7D3: db $0A, $1E, $28, $28, $1E, $0A
#_1AF7D9: db $EC, $D8, $C4, $C4, $D8, $EC
#_1AF7DF: db $F6, $EC, $D8, $D8, $EC, $F6

pool off

;---------------------------------------------------------------------------------------------------

BatCrash_SpawnDebris:
#_1AF7E5: LDY.b #$1D

.next_particle
#_1AF7E7: LDA.w .offset_x,Y
#_1AF7EA: STA.b $00

#_1AF7EC: LDA.w .offset_y,Y
#_1AF7EF: STA.b $01

#_1AF7F1: LDA.w .speed_x,Y
#_1AF7F4: STA.b $02

#_1AF7F6: LDA.w .speed_y,Y
#_1AF7F9: STA.b $03

#_1AF7FB: PHY
#_1AF7FC: JSL GarnishSpawn_PyramidDebris
#_1AF800: PLY

#_1AF801: DEY
#_1AF802: BPL .next_particle

#_1AF804: LDA.b #$20
#_1AF806: STA.w $0EE0,X

#_1AF809: RTS

;===================================================================================================

pool SpriteDraw_BatCrash

.pointer_low
#_1AF80A: db SpriteDraw_BatCrash_oam_group00
#_1AF80B: db SpriteDraw_BatCrash_oam_group00
#_1AF80C: db SpriteDraw_BatCrash_oam_group01
#_1AF80D: db SpriteDraw_BatCrash_oam_group01
#_1AF80E: db SpriteDraw_BatCrash_oam_group02
#_1AF80F: db SpriteDraw_BatCrash_oam_group02
#_1AF810: db SpriteDraw_BatCrash_oam_group03
#_1AF811: db SpriteDraw_BatCrash_oam_group03
#_1AF812: db SpriteDraw_BatCrash_oam_group04
#_1AF813: db SpriteDraw_BatCrash_oam_group04
#_1AF814: db SpriteDraw_BatCrash_oam_group05
#_1AF815: db SpriteDraw_BatCrash_oam_group05
#_1AF816: db SpriteDraw_BatCrash_oam_group06
#_1AF817: db SpriteDraw_BatCrash_oam_group07
#_1AF818: db SpriteDraw_BatCrash_oam_group08
#_1AF819: db SpriteDraw_BatCrash_oam_group07
#_1AF81A: db SpriteDraw_BatCrash_oam_group09
#_1AF81B: db SpriteDraw_BatCrash_oam_group09
#_1AF81C: db SpriteDraw_BatCrash_oam_group09
#_1AF81D: db SpriteDraw_BatCrash_oam_group09

;---------------------------------------------------------------------------------------------------

.pointer_high
#_1AF81E: db SpriteDraw_BatCrash_oam_groups>>8

;---------------------------------------------------------------------------------------------------

.obj_count
#_1AF81F: db $01
#_1AF820: db $01
#_1AF821: db $01
#_1AF822: db $01
#_1AF823: db $01
#_1AF824: db $01
#_1AF825: db $01
#_1AF826: db $01
#_1AF827: db $02
#_1AF828: db $02
#_1AF829: db $02
#_1AF82A: db $02
#_1AF82B: db $02
#_1AF82C: db $02
#_1AF82D: db $02
#_1AF82E: db $02
#_1AF82F: db $04
#_1AF830: db $04
#_1AF831: db $04
#_1AF832: db $04

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_BatCrash:
#_1AF833: REP #$20

#_1AF835: LDA.w #$0960
#_1AF838: STA.b $90

#_1AF83A: LDA.w #$0A78
#_1AF83D: STA.b $92

#_1AF83F: SEP #$20

#_1AF841: LDA.w $0DE0,X
#_1AF844: ASL A
#_1AF845: ASL A
#_1AF846: ADC.w $0DC0,X
#_1AF849: TAY

#_1AF84A: LDA.w .pointer_low,Y
#_1AF84D: STA.b $08

#_1AF84F: LDA.w .pointer_high
#_1AF852: STA.b $09

#_1AF854: LDA.w .obj_count,Y
#_1AF857: JSL SpriteDraw_Tabulated

#_1AF85B: RTS

;===================================================================================================

pool SpriteDraw_Drunkard

.oam_groups
#_1AF85C: dw   8,   2 : db $AE, $00, $00, $00
#_1AF864: dw   0,  -9 : db $22, $08, $00, $02
#_1AF86C: dw   0,   0 : db $06, $00, $00, $02

#_1AF874: dw   7,   0 : db $AF, $00, $00, $00
#_1AF87C: dw   0,  -9 : db $22, $08, $00, $02
#_1AF884: dw   0,   0 : db $06, $00, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Drunkard:
#_1AF88C: PHB
#_1AF88D: PHK
#_1AF88E: PLB

#_1AF88F: LDA.w $0DC0,X
#_1AF892: ASL A
#_1AF893: ADC.w $0DC0,X
#_1AF896: ASL A
#_1AF897: ASL A
#_1AF898: ASL A
#_1AF899: ADC.b #.oam_groups>>0
#_1AF89B: STA.b $08

#_1AF89D: LDA.b #.oam_groups>>8
#_1AF89F: ADC.b #$00

#_1AF8A1: STA.b $09

#_1AF8A3: LDA.b #$03
#_1AF8A5: STA.b $06
#_1AF8A7: STZ.b $07

#_1AF8A9: JMP.w SpriteDraw_Drunkard_continue

;===================================================================================================

pool SpriteDraw_RaceGameLady

.oam_groups
#_1AF8AC: dw   0,  -8 : db $E0, $00, $00, $02
#_1AF8B4: dw   0,   0 : db $E8, $00, $00, $02
#_1AF8BC: dw   0,  -7 : db $E0, $00, $00, $02
#_1AF8C4: dw   0,   1 : db $E8, $40, $00, $02

#_1AF8CC: dw   0,  -8 : db $C0, $00, $00, $02
#_1AF8D4: dw   0,   0 : db $C2, $00, $00, $02
#_1AF8DC: dw   0,  -7 : db $C0, $00, $00, $02
#_1AF8E4: dw   0,   1 : db $C2, $40, $00, $02

#_1AF8EC: dw   0,  -8 : db $E2, $00, $00, $02
#_1AF8F4: dw   0,   0 : db $E4, $00, $00, $02
#_1AF8FC: dw   0,  -7 : db $E2, $00, $00, $02
#_1AF904: dw   0,   1 : db $E6, $00, $00, $02

#_1AF90C: dw   0,  -8 : db $E2, $40, $00, $02
#_1AF914: dw   0,   0 : db $E4, $40, $00, $02
#_1AF91C: dw   0,  -7 : db $E2, $40, $00, $02
#_1AF924: dw   0,   1 : db $E6, $40, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_RaceGameLady:
#_1AF92C: PHB
#_1AF92D: PHK
#_1AF92E: PLB

#_1AF92F: LDA.b #$02
#_1AF931: STA.b $06
#_1AF933: STZ.b $07

#_1AF935: LDA.w $0DE0,X
#_1AF938: ASL A
#_1AF939: ADC.w $0DC0,X
#_1AF93C: ASL A
#_1AF93D: ASL A
#_1AF93E: ASL A
#_1AF93F: ASL A
#_1AF940: ADC.b #.oam_groups>>0
#_1AF942: STA.b $08

#_1AF944: LDA.b #.oam_groups>>8
#_1AF946: ADC.b #$00
#_1AF948: STA.b $09

;---------------------------------------------------------------------------------------------------

#SpriteDraw_Drunkard_continue:
#_1AF94A: JSL SpriteDraw_Tabulated_player_deferred
#_1AF94E: JSL SpriteDraw_Shadow_long

#_1AF952: PLB

#_1AF953: RTL

;===================================================================================================

Sprite_CheckIfActive_Bank1A:
#_1AF954: LDA.w $0DD0,X
#_1AF957: CMP.b #$09
#_1AF959: BNE .inactive

#_1AF95B: LDA.w $0FC1
#_1AF95E: BNE .inactive

#_1AF960: LDA.b $11
#_1AF962: BNE .inactive

#_1AF964: LDA.w $0CAA,X
#_1AF967: BMI .active

#_1AF969: LDA.w $0F00,X
#_1AF96C: BEQ .active

.inactive
#_1AF96E: PLA
#_1AF96F: PLA

.active
#_1AF970: RTS

;===================================================================================================

pool Lanmola_SpawnShrapnel

.speed_y
#_1AF971: db  28, -28,  28, -28,   0,  36,   0, -36

.speed_x
#_1AF979: db -28, -28,  28,  28, -36,   0,  36,   0

pool off

;---------------------------------------------------------------------------------------------------

Lanmola_SpawnShrapnel:
#_1AF981: LDY.b #$03

#_1AF983: LDA.w $0DD0
#_1AF986: CLC
#_1AF987: ADC.w $0DD1
#_1AF98A: ADC.w $0DD2
#_1AF98D: CMP.b #$0A
#_1AF98F: BCS .too_much_stuff

#_1AF991: LDY.b #$07

.too_much_stuff
#_1AF993: STY.w $0FB5

.next_spawn
#_1AF996: LDA.b #$C2 ; SPRITE C2
#_1AF998: JSL Sprite_SpawnDynamically
#_1AF99C: BMI .no_space

#_1AF99E: JSL Sprite_SetSpawnedCoordinates

#_1AF9A2: LDA.b $00
#_1AF9A4: ADC.b #$04
#_1AF9A6: STA.w $0D10,Y

#_1AF9A9: LDA.b $02
#_1AF9AB: ADC.b #$04
#_1AF9AD: STA.w $0D00,Y

#_1AF9B0: LDA.b #$01
#_1AF9B2: STA.w $0BA0,Y
#_1AF9B5: STA.w $0CD2,Y
#_1AF9B8: STA.w $0F60,Y

#_1AF9BB: DEC A
#_1AF9BC: STA.w $0F70,Y

#_1AF9BF: LDA.b #$20
#_1AF9C1: STA.w $0E40,Y

#_1AF9C4: PHX
#_1AF9C5: LDX.w $0FB5

#_1AF9C8: LDA.l .speed_x,X
#_1AF9CC: STA.w $0D50,Y

#_1AF9CF: LDA.l .speed_y,X
#_1AF9D3: STA.w $0D40,Y

#_1AF9D6: JSL GetRandomNumber

#_1AF9DA: AND.b #$01
#_1AF9DC: STA.w $0DC0,Y

#_1AF9DF: PLX

.no_space
#_1AF9E0: DEC.w $0FB5
#_1AF9E3: BPL .next_spawn

#_1AF9E5: RTL

;===================================================================================================

UNREACHABLE_1AF9E6:
#_1AF9E6: LDY.b #$00
#_1AF9E8: CMP.b #$00
#_1AF9EA: BPL .positive

#_1AF9EC: DEY

.positive
#_1AF9ED: CLC
#_1AF9EE: ADC.w $0FDA
#_1AF9F1: STA.w $0FDA

#_1AF9F4: TYA
#_1AF9F5: ADC.w $0FDB
#_1AF9F8: STA.w $0FDB

#_1AF9FB: LDA.w $0F50,X
#_1AF9FE: PHA

#_1AF9FF: JSL Sprite_Cukeman

#_1AFA03: PLA
#_1AFA04: STA.w $0F50,X

#_1AFA07: JSL Sprite_Get16BitCoords_long

#_1AFA0B: RTL

;===================================================================================================

Sprite_Cukeman:
#_1AFA0C: LDA.w $0EB0,X
#_1AFA0F: BEQ .exit

#_1AFA11: LDA.w $0DD0,X
#_1AFA14: CMP.b #$09
#_1AFA16: BNE .dont_speak

#_1AFA18: LDA.b $11
#_1AFA1A: ORA.w $0FC1
#_1AFA1D: BNE .dont_speak

#_1AFA1F: REP #$20

#_1AFA21: LDA.w $0FD8
#_1AFA24: SEC
#_1AFA25: SBC.b $22
#_1AFA27: CLC
#_1AFA28: ADC.w #$0018
#_1AFA2B: CMP.w #$0030
#_1AFA2E: BCS .dont_speak

#_1AFA30: LDA.b $20
#_1AFA32: SEC
#_1AFA33: SBC.w $0FDA
#_1AFA36: CLC
#_1AFA37: ADC.w #$0020
#_1AFA3A: CMP.w #$0030
#_1AFA3D: BCS .dont_speak

#_1AFA3F: SEP #$20

#_1AFA41: LDA.b $F6
#_1AFA43: BPL .dont_speak

#_1AFA45: LDA.w $0E30,X
#_1AFA48: INC.w $0E30,X
#_1AFA4B: AND.b #$01

#_1AFA4D: CLC
#_1AFA4E: ADC.b #$7A ; MESSAGE 017A or MESSAGE 017B
#_1AFA50: STA.w $1CF0

#_1AFA53: LDA.b #$01
#_1AFA55: STA.w $1CF1
#_1AFA58: JSL Sprite_ShowMessageMinimal

.dont_speak
#_1AFA5C: SEP #$20

;---------------------------------------------------------------------------------------------------

#_1AFA5E: PHB
#_1AFA5F: PHK
#_1AFA60: PLB

#_1AFA61: LDA.w $0F50,X
#_1AFA64: AND.b #$F0
#_1AFA66: PHA

#_1AFA67: ORA.b #$08
#_1AFA69: STA.w $0F50,X

#_1AFA6C: JSR SpriteDraw_Cukeman

#_1AFA6F: PLA
#_1AFA70: ORA.b #$0D
#_1AFA72: STA.w $0F50,X

#_1AFA75: LDA.b #$10
#_1AFA77: JSL SpriteDraw_AllocateOAMFromRegionA

#_1AFA7B: PLB

#_1AFA7C: RTL

;---------------------------------------------------------------------------------------------------

.exit
#_1AFA7D: RTL

;===================================================================================================

pool SpriteDraw_Cukeman

.oam_groups
#_1AFA7E: dw   0,   0 : db $F3, $01, $00, $00
#_1AFA86: dw   7,   0 : db $F3, $41, $00, $00
#_1AFA8E: dw   4,   7 : db $E0, $07, $00, $00

#_1AFA96: dw  -1,   2 : db $F3, $01, $00, $00
#_1AFA9E: dw   6,   1 : db $F3, $41, $00, $00
#_1AFAA6: dw   4,   8 : db $E0, $07, $00, $00

#_1AFAAE: dw   1,   1 : db $F3, $01, $00, $00
#_1AFAB6: dw   8,   2 : db $F3, $41, $00, $00
#_1AFABE: dw   4,   8 : db $E0, $07, $00, $00

#_1AFAC6: dw  -2,   0 : db $F3, $01, $00, $00
#_1AFACE: dw  10,   0 : db $F3, $41, $00, $00
#_1AFAD6: dw   4,   7 : db $E0, $07, $00, $00

#_1AFADE: dw   0,   0 : db $F3, $01, $00, $00
#_1AFAE6: dw   8,   0 : db $F3, $41, $00, $00
#_1AFAEE: dw   4,   6 : db $E0, $07, $00, $00

#_1AFAF6: dw  -5,   0 : db $F3, $01, $00, $00
#_1AFAFE: dw  16,   0 : db $F3, $41, $00, $00
#_1AFB06: dw   4,   8 : db $E0, $07, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Cukeman:
#_1AFB0E: LDA.b #$00
#_1AFB10: XBA
#_1AFB11: LDA.w $0DC0,X

#_1AFB14: REP #$20

#_1AFB16: ASL A
#_1AFB17: ASL A
#_1AFB18: ASL A
#_1AFB19: STA.b $00

#_1AFB1B: ASL A
#_1AFB1C: ADC.b $00
#_1AFB1E: ADC.w #.oam_groups
#_1AFB21: STA.b $08

#_1AFB23: SEP #$20

#_1AFB25: LDA.b #$03
#_1AFB27: JSL SpriteDraw_Tabulated

#_1AFB2B: RTS

;===================================================================================================

RunningBoy_SpawnDustGarnish:
#_1AFB2C: INC.w $0CBA,X

#_1AFB2F: LDA.w $0CBA,X
#_1AFB32: AND.b #$0F
#_1AFB34: BNE .exit

#_1AFB36: PHX
#_1AFB37: TXY

#_1AFB38: LDX.b #$1D

.next_slot
#_1AFB3A: LDA.l $7FF800,X
#_1AFB3E: BEQ .free_slot

#_1AFB40: DEX
#_1AFB41: BPL .next_slot

#_1AFB43: INX

.free_slot
#_1AFB44: LDA.b #$14 ; GARNISH 14
#_1AFB46: STA.l $7FF800,X
#_1AFB4A: STA.w $0FB4

#_1AFB4D: LDA.w $0D10,Y
#_1AFB50: CLC
#_1AFB51: ADC.b #$04
#_1AFB53: STA.l $7FF83C,X

#_1AFB57: LDA.w $0D30,Y
#_1AFB5A: ADC.b #$00
#_1AFB5C: STA.l $7FF878,X

#_1AFB60: LDA.w $0D00,Y
#_1AFB63: CLC
#_1AFB64: ADC.b #$1C
#_1AFB66: STA.l $7FF81E,X

#_1AFB6A: LDA.w $0D20,Y
#_1AFB6D: ADC.b #$00
#_1AFB6F: STA.l $7FF85A,X

#_1AFB73: LDA.b #$0A
#_1AFB75: STA.l $7FF90E,X

#_1AFB79: PLX

.exit
#_1AFB7A: RTL

;===================================================================================================

pool Overworld_SubstituteAlternateSecret

.screen_mask
#_1AFB7B: db $00, $00, $00, $00, $00, $00, $00, $04
#_1AFB83: db $00, $00, $00, $00, $00, $00, $00, $00
#_1AFB8B: db $04, $04, $06, $04, $04, $06, $00, $00
#_1AFB93: db $0F, $0F, $04, $05, $05, $04, $06, $06
#_1AFB9B: db $0F, $0F, $04, $05, $05, $07, $06, $06
#_1AFBA3: db $1F, $1F, $04, $07, $07, $04, $06, $06
#_1AFBAB: db $06, $07, $02, $00, $00, $00, $00, $00
#_1AFBB3: db $06, $06, $02, $00, $00, $00, $00, $00

;---------------------------------------------------------------------------------------------------

.secret_index
#_1AFBBB: db $01 ; Green rupee
#_1AFBBC: db $01 ; Green rupee
#_1AFBBD: db $01 ; Green rupee
#_1AFBBE: db $01 ; Green rupee
#_1AFBBF: db $0F ; Green guard
#_1AFBC0: db $01 ; Green rupee
#_1AFBC1: db $01 ; Green rupee
#_1AFBC2: db $12 ; Landmine

#_1AFBC3: db $10 ; Bush stal
#_1AFBC4: db $01 ; Green rupee
#_1AFBC5: db $01 ; Green rupee
#_1AFBC6: db $01 ; Green rupee
#_1AFBC7: db $11 ; Blue guard
#_1AFBC8: db $01 ; Green rupee
#_1AFBC9: db $01 ; Green rupee
#_1AFBCA: db $03 ; Bee

;---------------------------------------------------------------------------------------------------

.prize_mask
#_1AFBCB: db $00 ; Green rupee
#_1AFBCC: db $00 ; Green rupee
#_1AFBCD: db $00 ; Green rupee
#_1AFBCE: db $00 ; Green rupee
#_1AFBCF: db $02 ; Green guard
#_1AFBD0: db $00 ; Green rupee
#_1AFBD1: db $00 ; Green rupee
#_1AFBD2: db $08 ; Landmine

#_1AFBD3: db $10 ; Bush stal
#_1AFBD4: db $00 ; Green rupee
#_1AFBD5: db $00 ; Green rupee
#_1AFBD6: db $00 ; Green rupee
#_1AFBD7: db $01 ; Blue guard
#_1AFBD8: db $00 ; Green rupee
#_1AFBD9: db $00 ; Green rupee
#_1AFBDA: db $00 ; Bee

pool off

;---------------------------------------------------------------------------------------------------

Overworld_SubstituteAlternateSecret:
#_1AFBDB: PHB
#_1AFBDC: PHK
#_1AFBDD: PLB

#_1AFBDE: JSL GetRandomNumber
#_1AFBE2: AND.b #$01
#_1AFBE4: BNE .exit

#_1AFBE6: STZ.b $0D

#_1AFBE8: LDY.b #$0F

.next_slot
#_1AFBEA: LDA.w $0DD0,Y
#_1AFBED: BEQ .skip_slot

#_1AFBEF: LDA.w $0E20,Y
#_1AFBF2: CMP.b #$6C ; SPRITE 6C
#_1AFBF4: BEQ .skip_slot

#_1AFBF6: INC.b $0D

.skip_slot
#_1AFBF8: DEY
#_1AFBF9: BPL .next_slot

;---------------------------------------------------------------------------------------------------

#_1AFBFB: LDA.b $0D
#_1AFBFD: CMP.b #$04
#_1AFBFF: BCS .exit

#_1AFC01: LDA.l $7EF3C5
#_1AFC05: CMP.b #$02
#_1AFC07: BCC .exit

#_1AFC09: LDA.w $0CF7

#_1AFC0C: INC.w $0CF7
#_1AFC0F: AND.b #$07

#_1AFC11: LDY.w $0FFF
#_1AFC14: BEQ .light_world

#_1AFC16: ORA.b #$08

.light_world
#_1AFC18: TAY

#_1AFC19: PHX

#_1AFC1A: LDA.w $040A
#_1AFC1D: AND.b #$3F
#_1AFC1F: TAX

#_1AFC20: LDA.w .screen_mask,X
#_1AFC23: AND.w .prize_mask,Y
#_1AFC26: BNE .no_sub

#_1AFC28: LDA.w .secret_index,Y
#_1AFC2B: STA.w $0B9C

.no_sub
#_1AFC2E: PLX

.exit
#_1AFC2F: PLB

#_1AFC30: RTL

;===================================================================================================

Sprite_EE_CastleMantle:
#_1AFC31: PHB
#_1AFC32: PHK
#_1AFC33: PLB

#_1AFC34: JSR .main

#_1AFC37: PLB

#_1AFC38: RTL

;---------------------------------------------------------------------------------------------------

.main
#_1AFC39: JSR SpriteDraw_CastleMantle
#_1AFC3C: JSR Sprite_CheckIfActive_Bank1A

#_1AFC3F: JSL Sprite_CheckDamageToLink_same_layer_long
#_1AFC43: BCC .exit

#_1AFC45: JSL Sprite_CancelHookshot
#_1AFC49: JSL Sprite_RepelDash_long

#_1AFC4D: LDA.l $7EF3CC
#_1AFC51: CMP.b #$01 ; FOLLOWER 01
#_1AFC53: BNE .exit

#_1AFC55: LDA.l $7EF34A
#_1AFC59: BEQ .exit

#_1AFC5B: LDA.w $0372
#_1AFC5E: BNE .exit

#_1AFC60: LDA.w $0ED0,X
#_1AFC63: CMP.b #$90
#_1AFC65: BEQ .exit

#_1AFC67: LDA.b $28
#_1AFC69: CMP.b #$18
#_1AFC6B: BMI .exit

#_1AFC6D: LDA.b #$04
#_1AFC6F: STA.l $7EF3C8

#_1AFC73: INC.w $0E80,X

#_1AFC76: LDA.w $0E80,X
#_1AFC79: AND.b #$01
#_1AFC7B: BNE .swap_parity

#_1AFC7D: INC.w $0ED0,X

.swap_parity
#_1AFC80: LDA.w $0ED0,X
#_1AFC83: CMP.b #$08
#_1AFC85: BCC .exit

#_1AFC87: LDA.w $012E
#_1AFC8A: BNE .skip_sfx

#_1AFC8C: LDA.b #$22 ; SFX2.22
#_1AFC8E: STA.w $012E

.skip_sfx
#_1AFC91: LDA.b #$02
#_1AFC93: STA.w $0D50,X

#_1AFC96: JSL Sprite_Move_XY_Bank1D_long

.exit
#_1AFC9A: RTS

;===================================================================================================

pool SpriteDraw_CastleMantle

.offset_x
#_1AFC9B: db   0,  16,  32,   0,  16,  32

.offset_y
#_1AFCA1: db   0,   0,   0,  16,  16,  16

.char
#_1AFCA7: db $0C, $0E, $0C, $2C, $2E, $2C

.prop
#_1AFCAD: db $31, $31, $71, $31, $31, $71

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_CastleMantle:
#_1AFCB3: LDA.b #$20
#_1AFCB5: JSL SpriteDraw_AllocateOAMFromRegionB

#_1AFCB9: JSL Sprite_PrepOAMCoord_long
#_1AFCBD: BCS .exit

#_1AFCBF: PHX

#_1AFCC0: LDX.b #$05

.next_object
#_1AFCC2: LDA.b $00
#_1AFCC4: CLC
#_1AFCC5: ADC.w .offset_x,X
#_1AFCC8: STA.b ($90),Y

#_1AFCCA: LDA.b $02
#_1AFCCC: CLC
#_1AFCCD: ADC.w .offset_y,X
#_1AFCD0: INY
#_1AFCD1: STA.b ($90),Y

#_1AFCD3: LDA.w .char,X
#_1AFCD6: INY
#_1AFCD7: STA.b ($90),Y

#_1AFCD9: LDA.w .prop,X
#_1AFCDC: INY
#_1AFCDD: STA.b ($90),Y

#_1AFCDF: INY

#_1AFCE0: DEX
#_1AFCE1: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_1AFCE3: PLX

#_1AFCE4: LDY.b #$02
#_1AFCE6: LDA.b #$05
#_1AFCE8: JSL Sprite_CorrectOAMEntries_long

.exit
#_1AFCEC: RTS

;===================================================================================================

pool SpriteDraw_Mothula

.oam_groups
#_1AFCED: dw -24,  -8 : db $80, $00, $00, $02
#_1AFCF5: dw  -8,  -8 : db $82, $00, $00, $02
#_1AFCFD: dw   8,  -8 : db $82, $40, $00, $02
#_1AFD05: dw  24,  -8 : db $80, $40, $00, $02
#_1AFD0D: dw -24,   8 : db $A0, $00, $00, $02
#_1AFD15: dw  -8,   8 : db $A2, $00, $00, $02
#_1AFD1D: dw   8,   8 : db $A2, $40, $00, $02
#_1AFD25: dw  24,   8 : db $A0, $40, $00, $02

#_1AFD2D: dw -24,  -8 : db $84, $00, $00, $02
#_1AFD35: dw  -8,  -8 : db $86, $00, $00, $02
#_1AFD3D: dw   8,  -8 : db $86, $40, $00, $02
#_1AFD45: dw  24,  -8 : db $84, $40, $00, $02
#_1AFD4D: dw -24,   8 : db $A4, $00, $00, $02
#_1AFD55: dw  -8,   8 : db $A6, $00, $00, $02
#_1AFD5D: dw   8,   8 : db $A6, $40, $00, $02
#_1AFD65: dw  24,   8 : db $A4, $40, $00, $02

#_1AFD6D: dw  -8,  -8 : db $88, $00, $00, $02
#_1AFD75: dw  -8,  -8 : db $88, $00, $00, $02
#_1AFD7D: dw   8,  -8 : db $88, $40, $00, $02
#_1AFD85: dw   8,  -8 : db $88, $40, $00, $02
#_1AFD8D: dw  -8,   8 : db $A8, $00, $00, $02
#_1AFD95: dw  -8,   8 : db $A8, $00, $00, $02
#_1AFD9D: dw   8,   8 : db $A8, $40, $00, $02
#_1AFDA5: dw   8,   8 : db $A8, $40, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Mothula:
#_1AFDAD: PHB
#_1AFDAE: PHK
#_1AFDAF: PLB

#_1AFDB0: JSR .draw_her

#_1AFDB3: PLB

#_1AFDB4: RTL

;---------------------------------------------------------------------------------------------------

.draw_her
#_1AFDB5: LDA.b #$00
#_1AFDB7: XBA
#_1AFDB8: LDA.w $0DC0,X

#_1AFDBB: REP #$20

#_1AFDBD: ASL A
#_1AFDBE: ASL A
#_1AFDBF: ASL A
#_1AFDC0: ASL A
#_1AFDC1: ASL A
#_1AFDC2: ASL A

#_1AFDC3: ADC.w #.oam_groups
#_1AFDC6: STA.b $08

#_1AFDC8: LDA.w #$0920
#_1AFDCB: STA.b $90

#_1AFDCD: LDA.w #$0A68
#_1AFDD0: STA.b $92

#_1AFDD2: SEP #$20

#_1AFDD4: LDA.b #$08
#_1AFDD6: JSL SpriteDraw_Tabulated

#_1AFDDA: LDA.w $0F00,X
#_1AFDDD: BNE .exit

;---------------------------------------------------------------------------------------------------

#_1AFDDF: PHX

#_1AFDE0: LDA.w $0DC0,X
#_1AFDE3: ASL A
#_1AFDE4: ASL A
#_1AFDE5: ASL A
#_1AFDE6: ADC.w $0DC0,X
#_1AFDE9: STA.b $06

#_1AFDEB: LDA.b $02
#_1AFDED: CLC
#_1AFDEE: ADC.w $0F70,X
#_1AFDF1: STA.b $02

#_1AFDF3: LDA.b $03
#_1AFDF5: ADC.b #$00
#_1AFDF7: STA.b $03

#_1AFDF9: LDY.b #$28
#_1AFDFB: LDX.b #$08

;---------------------------------------------------------------------------------------------------

.next_object
#_1AFDFD: PHX

#_1AFDFE: TXA
#_1AFDFF: CLC
#_1AFE00: ADC.b $06
#_1AFE02: ASL A
#_1AFE03: TAX

#_1AFE04: REP #$20

#_1AFE06: LDA.b $00
#_1AFE08: CLC
#_1AFE09: ADC.w .offset_x,X
#_1AFE0C: STA.b ($90),Y

#_1AFE0E: AND.w #$0100
#_1AFE11: STA.b $0E

#_1AFE13: INY
#_1AFE14: LDA.b $02

#_1AFE16: CLC
#_1AFE17: ADC.w #$0010
#_1AFE1A: STA.b ($90),Y

#_1AFE1C: CLC
#_1AFE1D: ADC.w #$0010
#_1AFE20: CMP.w #$0100

#_1AFE23: SEP #$20
#_1AFE25: BCC .off_screeen

#_1AFE27: LDA.b #$F0
#_1AFE29: STA.b ($90),Y

.off_screeen
#_1AFE2B: INY
#_1AFE2C: LDA.b #$6C
#_1AFE2E: STA.b ($90),Y

#_1AFE30: INY
#_1AFE31: LDA.b #$24
#_1AFE33: STA.b ($90),Y

#_1AFE35: PHY

#_1AFE36: TYA
#_1AFE37: LSR A
#_1AFE38: LSR A
#_1AFE39: TAY

#_1AFE3A: LDA.b #$02
#_1AFE3C: ORA.b $0F
#_1AFE3E: STA.b ($92),Y

#_1AFE40: PLY
#_1AFE41: INY

#_1AFE42: PLX
#_1AFE43: DEX
#_1AFE44: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_1AFE46: PLX

.exit
#_1AFE47: RTS

;---------------------------------------------------------------------------------------------------

.offset_x
#_1AFE48: dw   0,   3,   6,   9,  12,  -3,  -6,   -9, -12
#_1AFE5A: dw   0,   2,   4,   6,   8,  -2,  -4,   -6,  -8
#_1AFE6C: dw   0,   1,   2,   3,   4,  -1,  -2,   -3,  -4

;===================================================================================================

pool BottleMerchant_BuyBee

.speed_x
#_1AFE7E: db  -6,  -3,   0,   4,   7

.speed_y
#_1AFE83: db  11,  14,  16,  14,  11

pool off

;---------------------------------------------------------------------------------------------------

BottleMerchant_BuyBee:
#_1AFE88: PHB
#_1AFE89: PHK
#_1AFE8A: PLB

#_1AFE8B: LDA.b #$13 ; SFX3.13
#_1AFE8D: JSL SpriteSFX_QueueSFX3WithPan

#_1AFE91: LDA.b #$04
#_1AFE93: STA.w $0FB5

.next_spawn
#_1AFE96: LDA.b #$DB ; SPRITE DB
#_1AFE98: JSL Sprite_SpawnDynamically
#_1AFE9C: BMI .no_space

#_1AFE9E: JSL Sprite_SetSpawnedCoordinates

#_1AFEA2: LDA.b $00
#_1AFEA4: CLC
#_1AFEA5: ADC.b #$04
#_1AFEA7: STA.w $0D10,Y

#_1AFEAA: LDA.b #$FF
#_1AFEAC: STA.w $0B58,Y

#_1AFEAF: PHX

#_1AFEB0: LDX.w $0FB5

#_1AFEB3: LDA.w .speed_x,X
#_1AFEB6: STA.w $0D50,Y

#_1AFEB9: LDA.w .speed_y,X
#_1AFEBC: STA.w $0D40,Y

#_1AFEBF: LDA.b #$20
#_1AFEC1: STA.w $0F80,Y
#_1AFEC4: STA.w $0F10,Y

#_1AFEC7: PLX

.no_space
#_1AFEC8: DEC.w $0FB5
#_1AFECB: BPL .next_spawn

#_1AFECD: PLB

#_1AFECE: RTL

;===================================================================================================

ChickenLady:
#_1AFECF: JSR .main

#_1AFED2: RTL

;---------------------------------------------------------------------------------------------------

.main
#_1AFED3: LDA.b #$01
#_1AFED5: STA.w $0DE0,X

#_1AFED8: JSL SpriteDraw_RaceGameLady
#_1AFEDC: JSR Sprite_CheckIfActive_Bank1A

#_1AFEDF: LDA.w $0DF0,X
#_1AFEE2: CMP.b #$01
#_1AFEE4: BNE .no_message

#_1AFEE6: LDA.b #$7D ; MESSAGE 017D
#_1AFEE8: STA.w $1CF0

#_1AFEEB: LDA.b #$01
#_1AFEED: STA.w $1CF1

#_1AFEF0: JSL Sprite_ShowMessageMinimal

.no_message
#_1AFEF4: LDA.b $1A
#_1AFEF6: LSR A
#_1AFEF7: LSR A
#_1AFEF8: LSR A
#_1AFEF9: LSR A
#_1AFEFA: AND.b #$01
#_1AFEFC: STA.w $0DC0,X

#_1AFEFF: RTS

;===================================================================================================

SpritePrep_DiggingGameGuy:
#_1AFF00: LDA.w $0D00,X
#_1AFF03: STA.b $00

#_1AFF05: LDA.w $0D20,X
#_1AFF08: STA.b $01

#_1AFF0A: REP #$20

#_1AFF0C: LDA.b $20
#_1AFF0E: CMP.b $00

#_1AFF10: SEP #$30
#_1AFF12: BCS .link_is_below

#_1AFF14: LDA.b #$05
#_1AFF16: STA.w $0D80,X

#_1AFF19: LDA.w $0D10,X
#_1AFF1C: SEC
#_1AFF1D: SBC.b #$09
#_1AFF1F: STA.w $0D10,X

#_1AFF22: LDA.b #$01
#_1AFF24: STA.w $0DC0,X

.link_is_below
#_1AFF27: INC.w $0BA0,X

#_1AFF2A: RTL

;===================================================================================================

pool SpawnHammerWaterSplash

.offset_x
#_1AFF2B: dw   0,  12,  -8,  24

.offset_y
#_1AFF33: dw   8,  32,  24,  24

pool off

;---------------------------------------------------------------------------------------------------

#EXIT_1AFF3B:
#_1AFF3B: RTL

;---------------------------------------------------------------------------------------------------

SpawnHammerWaterSplash:
#_1AFF3C: LDA.b $11
#_1AFF3E: ORA.w $02E4
#_1AFF41: ORA.w $0FC1
#_1AFF44: BNE EXIT_1AFF3B

#_1AFF46: PHX
#_1AFF47: PHY

#_1AFF48: LDX.b $2F

#_1AFF4A: REP #$20

#_1AFF4C: LDA.b $22
#_1AFF4E: CLC
#_1AFF4F: ADC.l .offset_x,X
#_1AFF53: STA.b $00

#_1AFF55: LDA.b $20
#_1AFF57: CLC
#_1AFF58: ADC.l .offset_y,X
#_1AFF5C: STA.b $02

#_1AFF5E: SEP #$20

#_1AFF60: LDA.b $EE
#_1AFF62: CMP.b #$01

#_1AFF64: REP #$30

#_1AFF66: STZ.b $05
#_1AFF68: BCC .lower_layer

#_1AFF6A: LDA.w #$1000
#_1AFF6D: STA.b $05

.lower_layer
#_1AFF6F: SEP #$20

#_1AFF71: LDA.b $1B

#_1AFF73: REP #$20
#_1AFF75: BEQ .outdoors

;---------------------------------------------------------------------------------------------------


#_1AFF77: LDA.b $00
#_1AFF79: AND.w #$01FF
#_1AFF7C: LSR A
#_1AFF7D: LSR A
#_1AFF7E: LSR A
#_1AFF7F: STA.b $04

#_1AFF81: LDA.b $02
#_1AFF83: AND.w #$01F8
#_1AFF86: ASL A
#_1AFF87: ASL A
#_1AFF88: ASL A
#_1AFF89: CLC
#_1AFF8A: ADC.b $04

#_1AFF8C: CLC
#_1AFF8D: ADC.b $05

#_1AFF8F: TAX

#_1AFF90: LDA.l $7F2000,X
#_1AFF94: BRA .verify_water

;---------------------------------------------------------------------------------------------------

.outdoors

#_1AFF96: LDA.b $02
#_1AFF98: PHA

#_1AFF99: LDA.b $00
#_1AFF9B: LSR A
#_1AFF9C: LSR A
#_1AFF9D: LSR A
#_1AFF9E: STA.b $02

#_1AFFA0: PLA
#_1AFFA1: STA.b $00

#_1AFFA3: SEP #$30

#_1AFFA5: JSL Overworld_ReadTileType

#_1AFFA9: REP #$10

;---------------------------------------------------------------------------------------------------

.verify_water
#_1AFFAB: SEP #$30

#_1AFFAD: CMP.b #$08 ; TILETYPE 08
#_1AFFAF: BEQ .is_water

#_1AFFB1: CMP.b #$09 ; TILETYPE 09
#_1AFFB3: BNE .no_splash

.is_water
#_1AFFB5: JSL Sprite_SpawnSmallSplash
#_1AFFB9: BMI .no_splash

#_1AFFBB: LDX.b $2F

#_1AFFBD: LDA.b $20
#_1AFFBF: CLC
#_1AFFC0: ADC.l .offset_y+0,X
#_1AFFC4: PHP

#_1AFFC5: SEC
#_1AFFC6: SBC.b #$10
#_1AFFC8: STA.w $0D00,Y

#_1AFFCB: LDA.b $21
#_1AFFCD: SBC.b #$00

#_1AFFCF: PLP
#_1AFFD0: ADC.l .offset_y+1,X
#_1AFFD4: STA.w $0D20,Y

#_1AFFD7: LDA.b $22
#_1AFFD9: CLC
#_1AFFDA: ADC.l .offset_x+0,X
#_1AFFDE: PHP

#_1AFFDF: SEC
#_1AFFE0: SBC.b #$08
#_1AFFE2: STA.w $0D10,Y

#_1AFFE5: LDA.b $23
#_1AFFE7: SBC.b #$00

#_1AFFE9: PLP
#_1AFFEA: ADC.l .offset_x+1,X
#_1AFFEE: STA.w $0D30,Y

#_1AFFF1: LDA.b $EE
#_1AFFF3: STA.w $0F20,Y

#_1AFFF6: LDA.b #$00
#_1AFFF8: STA.w $0F70,Y

.no_splash
#_1AFFFB: PLX
#_1AFFFC: PLY

#_1AFFFD: RTL

;===================================================================================================
; FREE ROM: 0x02
;===================================================================================================
NULL_1AFFFE:
#_1AFFFE: db $FF, $FF

;===================================================================================================
