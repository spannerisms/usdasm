; see «sound.asm»

org $1AF424

;===================================================================================================
; FREE ROM: 0xD9 including garbage
;===================================================================================================
GARBAGE_1AF424:
|1AF424| db $34, $00, $00, $00, $00, $01, $FF, $00, $00, $00, $00, $00

NULL_1AF430:
|1AF430| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF438| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF440| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF448| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF450| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF458| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF460| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF468| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF470| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF478| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF480| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF488| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF490| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF498| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF4A0| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF4A8| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF4B0| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF4B8| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF4C0| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF4C8| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF4D0| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF4D8| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF4E0| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF4E8| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF4F0| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1AF4F8| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

pool SpriteDraw_BatCrash

.oam_groups

.oam_group00
|1AF500| dw   0,   0 : db $4B, $04, $00, $00

.oam_group01
|1AF508| dw   5,  -4 : db $5B, $04, $00, $00

.oam_group02
|1AF510| dw  -2,  -4 : db $64, $04, $00, $02

.oam_group03
|1AF518| dw  -2,  -4 : db $49, $04, $00, $02

.oam_group04
|1AF520| dw  -8,  -9 : db $6C, $04, $00, $02
|1AF528| dw   8,  -9 : db $6C, $44, $00, $02

.oam_group05
|1AF530| dw  -8,  -7 : db $4C, $04, $00, $02
|1AF538| dw   8,  -7 : db $4C, $44, $00, $02

.oam_group06
|1AF540| dw  -8,  -9 : db $44, $04, $00, $02
|1AF548| dw   8,  -9 : db $44, $44, $00, $02

.oam_group07
|1AF550| dw  -8,  -8 : db $62, $04, $00, $02
|1AF558| dw   8,  -8 : db $62, $44, $00, $02

.oam_group08
|1AF560| dw  -8,  -7 : db $60, $04, $00, $02
|1AF568| dw   8,  -7 : db $60, $44, $00, $02

.oam_group09
|1AF570| dw   0,   0 : db $4E, $04, $00, $02
|1AF578| dw  16,   0 : db $4E, $44, $00, $02
|1AF580| dw   0,  16 : db $6E, $04, $00, $02
|1AF588| dw  16,  16 : db $6E, $44, $00, $02

endpool

;===================================================================================================

pool BatCrash BatCrash_Approach

.position_x
|1AF590| dw $07DC, $07F0, $0820, $0818

.position_y
|1AF598| dw $062E, $0636, $0630, $05E0

.anim_timer
|1AF5A0| db     4,     3,     4,     6,     0

endpool

;===================================================================================================

Sprite_37_Waterfall:
|1AF5A5| PHB
|1AF5A6| PHK
|1AF5A7| PLB

|1AF5A8| JSR .main

|1AF5AB| PLB

|1AF5AC| RTL

;---------------------------------------------------------------------------------------------------

.main
|1AF5AD| LDA.w $0E80,X
|1AF5B0| JSL JumpTableLocal
|1AF5B4| dw Waterfall
|1AF5B6| dw BatCrash

;===================================================================================================

Waterfall:
|1AF5B8| JSR CheckIfActive_bank1A
|1AF5BB| JSL CheckDamageToLink_same_layer_long
|1AF5BF| BCC .exit

|1AF5C1| LDA.b $8A
|1AF5C3| CMP.b #$43 ; OW 43
|1AF5C5| BEQ .on_gt_screen

|1AF5C7| PHX

|1AF5C8| JSL AncillaAdd_WaterfallSplash

|1AF5CC| PLX

.exit
|1AF5CD| RTS

;---------------------------------------------------------------------------------------------------

.on_gt_screen
|1AF5CE| PHX

|1AF5CF| JSL AncillaAdd_GTCutscene

|1AF5D3| PLX

|1AF5D4| RTS

;===================================================================================================

pool BatCrash

.shake_low
|1AF5D5| db  1, -1

.shake_high
|1AF5D7| db  0, -1

endpool

;---------------------------------------------------------------------------------------------------

BatCrash:
|1AF5D9| JSR SpriteDraw_BatCrash
|1AF5DC| JSR CheckIfActive_bank1A
|1AF5DF| JSL MoveSpriteXY_bank1D_long
|1AF5E3| JSR BatCrash_DrawHardcodedGarbage

|1AF5E6| STZ.w $011C
|1AF5E9| STZ.w $011D

|1AF5EC| LDA.w $0EE0,X
|1AF5EF| BEQ .timer1_done

|1AF5F1| DEC A
|1AF5F2| BNE .still_nonzero

|1AF5F4| LDY.b #$05 ; SFX1.05
|1AF5F6| STY.w $012D

.still_nonzero
|1AF5F9| AND.b #$01
|1AF5FB| TAY

|1AF5FC| LDA.w .shake_low,Y
|1AF5FF| STA.w $011C

|1AF602| LDA.w .shake_high,Y
|1AF605| STA.w $011D

.timer1_done
|1AF608| LDA.w $0DF0,X
|1AF60B| BNE .timer_running

|1AF60D| LDA.w $0DC0,X
|1AF610| INC A
|1AF611| AND.b #$03
|1AF613| STA.w $0DC0,X
|1AF616| BNE .no_flap_sfx

|1AF618| LDA.w $0D80,X
|1AF61B| CMP.b #$02
|1AF61D| BCS .no_flap_sfx

|1AF61F| LDA.b #$03 ; SFX2.03
|1AF621| JSL QueueSpriteSFX2WithPan

.no_flap_sfx
|1AF625| LDY.w $0DE0,X

|1AF628| LDA.w .anim_timer,Y
|1AF62B| STA.w $0DF0,X

.timer_running
|1AF62E| LDA.w $0D80,X
|1AF631| JSL JumpTableLocal
|1AF635| dw BatCrash_Approach
|1AF637| dw BatCrash_Ascend
|1AF639| dw BatCrash_DiveBomb
|1AF63B| dw BatCrash_StallTheInevitable

;===================================================================================================

BatCrash_Approach:
|1AF63D| LDA.w $0D90,X
|1AF640| ASL A
|1AF641| TAY

|1AF642| REP #$20

|1AF644| LDA.w .position_x,Y
|1AF647| CMP.w $0FD8

|1AF64A| SEP #$30
|1AF64C| BCS BatCrash_HandleYMovement

|1AF64E| CPY.b #$04
|1AF650| BCC .still_approaching

|1AF652| INC.w $0D80,X

|1AF655| LDA.b #$D0
|1AF657| STA.w $0E00,X

.still_approaching
|1AF65A| INC.w $0D90,X

|1AF65D| INC.w $0DE0,X

;===================================================================================================

#BatCrash_HandleYMovement:
|1AF660| LDA.b $1A
|1AF662| AND.b #$07
|1AF664| BNE .done_Y

|1AF666| REP #$20

|1AF668| LDA.w .position_y,Y
|1AF66B| CMP.w $0FDA

|1AF66E| SEP #$30
|1AF670| BCC .ypos_not_reached

|1AF672| INC.w $0D40,X
|1AF675| BRA .done_Y

.ypos_not_reached
|1AF677| DEC.w $0D40,X

.done_Y
|1AF67A| LDA.b $1A
|1AF67C| AND.b #$0F
|1AF67E| BNE .exit

|1AF680| INC.w $0D50,X

.exit
|1AF683| RTS

;===================================================================================================

BatCrash_Ascend:
|1AF684| LDA.w $0E00,X
|1AF687| BNE .ascending

|1AF689| INC.w $0D80,X

|1AF68C| LDA.b #$26 ; SFX3.26
|1AF68E| JSL QueueSpriteSFX3WithPan

|1AF692| INC.w $0DE0,X

|1AF695| LDA.b #$E8
|1AF697| STA.w $0D10,X

|1AF69A| LDA.b #$07
|1AF69C| STA.w $0D30,X

|1AF69F| LDA.b #$E0
|1AF6A1| STA.w $0D00,X

|1AF6A4| LDA.b #$05
|1AF6A6| STA.w $0D20,X
|1AF6A9| STZ.w $0D50,X

|1AF6AC| LDA.b #$40
|1AF6AE| STA.w $0D40,X

|1AF6B1| LDA.b #$2D
|1AF6B3| STA.w $0E00,X

|1AF6B6| RTS

.ascending
|1AF6B7| LDA.b $1A
|1AF6B9| AND.b #$03
|1AF6BB| BNE .dont_tick

|1AF6BD| DEC.w $0D50,X

.dont_tick
|1AF6C0| LDA.w $0D90,X
|1AF6C3| ASL A
|1AF6C4| TAY

|1AF6C5| JMP.w BatCrash_HandleYMovement

;===================================================================================================

BatCrash_DiveBomb:
|1AF6C8| LDA.w $0E00,X
|1AF6CB| BNE .descending

|1AF6CD| STZ.w $0D40,X

|1AF6D0| LDA.b #$60
|1AF6D2| STA.w $0E00,X

|1AF6D5| INC.w $0D80,X

.descending
|1AF6D8| LDA.w $0E00,X
|1AF6DB| CMP.b #$09
|1AF6DD| BNE .exit

|1AF6DF| JSR BatCrash_SpawnDebris

|1AF6E2| PHX

|1AF6E3| JSL CreatePyramidHole

|1AF6E7| PLX

.exit
|1AF6E8| RTS

;===================================================================================================

BatCrash_StallTheInevitable:
|1AF6E9| LDA.w $0E00,X
|1AF6EC| BNE .stayin_alive

|1AF6EE| STZ.w $0DD0,X

|1AF6F1| INC.w $0200

.stayin_alive
|1AF6F4| RTS

;===================================================================================================

SpawnBatCrashCutscene:
|1AF6F5| LDA.b #$37 ; SPRITE 37
|1AF6F7| JSL SpawnSpriteDynamically

|1AF6FB| LDA.b #$00
|1AF6FD| STA.w $0D40,Y
|1AF700| STA.w $0DA0,Y
|1AF703| STA.w $0DE0,Y
|1AF706| STA.w $0F20,Y

|1AF709| INC A
|1AF70A| STA.w $0E80,Y
|1AF70D| STA.w $0E40,Y
|1AF710| STA.w $0E60,Y
|1AF713| STA.w $0F50,Y

|1AF716| LDA.b #$CC
|1AF718| STA.w $0D10,Y

|1AF71B| LDA.b #$07
|1AF71D| STA.w $0D30,Y

|1AF720| LDA.b #$32
|1AF722| STA.w $0D00,Y

|1AF725| LDA.b #$06
|1AF727| STA.w $0D20,Y

|1AF72A| LDA.b #$80
|1AF72C| STA.w $0CAA,Y

|1AF72F| RTL

;===================================================================================================

pool BatCrash_DrawHardcodedGarbage

.data
|1AF730| db $68, $97, $57, $01
|1AF734| db $78, $97, $57, $01
|1AF738| db $88, $97, $57, $01
|1AF73C| db $68, $A7, $57, $01
|1AF740| db $78, $A7, $57, $01
|1AF744| db $88, $A7, $57, $01
|1AF748| db $65, $90, $57, $01
|1AF74C| db $8B, $90, $57, $01

endpool

;---------------------------------------------------------------------------------------------------

BatCrash_DrawHardcodedGarbage:
|1AF750| REP #$20

|1AF752| LDY.b #$20

.next_object
|1AF754| LDA.w .data-2,Y
|1AF757| STA.w $092E,Y

|1AF75A| DEY
|1AF75B| DEY
|1AF75C| BNE .next_object

;---------------------------------------------------------------------------------------------------

|1AF75E| LDY.b #$08

|1AF760| LDA.w #$0202

.next_prop
|1AF763| STA.w $0A6C,Y

|1AF766| DEY
|1AF767| DEY
|1AF768| BPL .next_prop

|1AF76A| SEP #$30

|1AF76C| RTS

;===================================================================================================

pool BatCrash_SpawnDebris

.offset_x
|1AF76D| db  -8,   0,   8,  16,  24,  32
|1AF773| db  -8,   0,   8,  16,  24,  32
|1AF779| db  -8,   0,   8,  16,  24,  32
|1AF77F| db  -8,   0,   8,  16,  24,  32
|1AF785| db  -8,   0,   8,  16,  24,  32

.offset_y
|1AF78B| db  48,  48,  48,  48,  48,  48
|1AF791| db  40,  40,  40,  40,  40,  40
|1AF797| db  32,  32,  32,  32,  32,  32
|1AF79D| db  24,  24,  24,  24,  24,  24
|1AF7A3| db  16,  16,  16,  16,  16,  16

.speed_x
|1AF7A9| db $E2, $E7, $F8, $08, $19, $1E
|1AF7AF| db $CE, $D3, $EC, $14, $2D, $32
|1AF7B5| db $CE, $DD, $E7, $19, $23, $32
|1AF7BB| db $D3, $CE, $C4, $3C, $32, $2D
|1AF7C1| db $E2, $DD, $D8, $28, $23, $1E

.speed_y
|1AF7C7| db $02, $05, $0A, $0A, $05, $02
|1AF7CD| db $05, $14, $1E, $1E, $14, $05
|1AF7D3| db $0A, $1E, $28, $28, $1E, $0A
|1AF7D9| db $EC, $D8, $C4, $C4, $D8, $EC
|1AF7DF| db $F6, $EC, $D8, $D8, $EC, $F6

endpool

;---------------------------------------------------------------------------------------------------

BatCrash_SpawnDebris:
|1AF7E5| LDY.b #$1D

.next_particle
|1AF7E7| LDA.w .offset_x,Y
|1AF7EA| STA.b $00

|1AF7EC| LDA.w .offset_y,Y
|1AF7EF| STA.b $01

|1AF7F1| LDA.w .speed_x,Y
|1AF7F4| STA.b $02

|1AF7F6| LDA.w .speed_y,Y
|1AF7F9| STA.b $03

|1AF7FB| PHY
|1AF7FC| JSL GarnishSpawn_PyramidDebris
|1AF800| PLY

|1AF801| DEY
|1AF802| BPL .next_particle

|1AF804| LDA.b #$20
|1AF806| STA.w $0EE0,X

|1AF809| RTS

;===================================================================================================

pool SpriteDraw_BatCrash

.pointer_low
|1AF80A| db .oam_group00
|1AF80B| db .oam_group00
|1AF80C| db .oam_group01
|1AF80D| db .oam_group01
|1AF80E| db .oam_group02
|1AF80F| db .oam_group02
|1AF810| db .oam_group03
|1AF811| db .oam_group03
|1AF812| db .oam_group04
|1AF813| db .oam_group04
|1AF814| db .oam_group05
|1AF815| db .oam_group05
|1AF816| db .oam_group06
|1AF817| db .oam_group07
|1AF818| db .oam_group08
|1AF819| db .oam_group07
|1AF81A| db .oam_group09
|1AF81B| db .oam_group09
|1AF81C| db .oam_group09
|1AF81D| db .oam_group09

;---------------------------------------------------------------------------------------------------

.pointer_high
|1AF81E| db >.oam_groups

;---------------------------------------------------------------------------------------------------

.obj_count
|1AF81F| db $01
|1AF820| db $01
|1AF821| db $01
|1AF822| db $01
|1AF823| db $01
|1AF824| db $01
|1AF825| db $01
|1AF826| db $01
|1AF827| db $02
|1AF828| db $02
|1AF829| db $02
|1AF82A| db $02
|1AF82B| db $02
|1AF82C| db $02
|1AF82D| db $02
|1AF82E| db $02
|1AF82F| db $04
|1AF830| db $04
|1AF831| db $04
|1AF832| db $04

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_BatCrash:
|1AF833| REP #$20

|1AF835| LDA.w #$0960
|1AF838| STA.b $90

|1AF83A| LDA.w #$0A78
|1AF83D| STA.b $92

|1AF83F| SEP #$20

|1AF841| LDA.w $0DE0,X
|1AF844| ASL A
|1AF845| ASL A
|1AF846| ADC.w $0DC0,X
|1AF849| TAY

|1AF84A| LDA.w .pointer_low,Y
|1AF84D| STA.b $08

|1AF84F| LDA.w .pointer_high
|1AF852| STA.b $09

|1AF854| LDA.w .obj_count,Y
|1AF857| JSL TabulatedSpriteDraw

|1AF85B| RTS

;===================================================================================================

pool SpriteDraw_Drunkard

.oam_groups
|1AF85C| dw   8,   2 : db $AE, $00, $00, $00
|1AF864| dw   0,  -9 : db $22, $08, $00, $02
|1AF86C| dw   0,   0 : db $06, $00, $00, $02

|1AF874| dw   7,   0 : db $AF, $00, $00, $00
|1AF87C| dw   0,  -9 : db $22, $08, $00, $02
|1AF884| dw   0,   0 : db $06, $00, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Drunkard:
|1AF88C| PHB
|1AF88D| PHK
|1AF88E| PLB

|1AF88F| LDA.w $0DC0,X
|1AF892| ASL A
|1AF893| ADC.w $0DC0,X
|1AF896| ASL A
|1AF897| ASL A
|1AF898| ASL A
|1AF899| ADC.b #<.oam_groups
|1AF89B| STA.b $08

|1AF89D| LDA.b #>.oam_groups
|1AF89F| ADC.b #$00

|1AF8A1| STA.b $09

|1AF8A3| LDA.b #$03
|1AF8A5| STA.b $06
|1AF8A7| STZ.b $07

|1AF8A9| JMP.w SpriteDraw_Drunkard_continue

;===================================================================================================

pool SpriteDraw_RaceGameLady

.oam_groups
|1AF8AC| dw   0,  -8 : db $E0, $00, $00, $02
|1AF8B4| dw   0,   0 : db $E8, $00, $00, $02
|1AF8BC| dw   0,  -7 : db $E0, $00, $00, $02
|1AF8C4| dw   0,   1 : db $E8, $40, $00, $02

|1AF8CC| dw   0,  -8 : db $C0, $00, $00, $02
|1AF8D4| dw   0,   0 : db $C2, $00, $00, $02
|1AF8DC| dw   0,  -7 : db $C0, $00, $00, $02
|1AF8E4| dw   0,   1 : db $C2, $40, $00, $02

|1AF8EC| dw   0,  -8 : db $E2, $00, $00, $02
|1AF8F4| dw   0,   0 : db $E4, $00, $00, $02
|1AF8FC| dw   0,  -7 : db $E2, $00, $00, $02
|1AF904| dw   0,   1 : db $E6, $00, $00, $02

|1AF90C| dw   0,  -8 : db $E2, $40, $00, $02
|1AF914| dw   0,   0 : db $E4, $40, $00, $02
|1AF91C| dw   0,  -7 : db $E2, $40, $00, $02
|1AF924| dw   0,   1 : db $E6, $40, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_RaceGameLady:
|1AF92C| PHB
|1AF92D| PHK
|1AF92E| PLB

|1AF92F| LDA.b #$02
|1AF931| STA.b $06
|1AF933| STZ.b $07

|1AF935| LDA.w $0DE0,X
|1AF938| ASL A
|1AF939| ADC.w $0DC0,X
|1AF93C| ASL A
|1AF93D| ASL A
|1AF93E| ASL A
|1AF93F| ASL A
|1AF940| ADC.b #<.oam_groups
|1AF942| STA.b $08

|1AF944| LDA.b #>.oam_groups
|1AF946| ADC.b #$00
|1AF948| STA.b $09

;---------------------------------------------------------------------------------------------------

#SpriteDraw_Drunkard_continue:
|1AF94A| JSL TabulatedSpriteDraw.player_deferred
|1AF94E| JSL DrawSpriteShadow_long

|1AF952| PLB

|1AF953| RTL

;===================================================================================================

CheckIfActive_bank1A:
|1AF954| LDA.w $0DD0,X
|1AF957| CMP.b #$09
|1AF959| BNE .inactive

|1AF95B| LDA.w $0FC1
|1AF95E| BNE .inactive

|1AF960| LDA.b $11
|1AF962| BNE .inactive

|1AF964| LDA.w $0CAA,X
|1AF967| BMI .active

|1AF969| LDA.w $0F00,X
|1AF96C| BEQ .active

.inactive
|1AF96E| PLA
|1AF96F| PLA

.active
|1AF970| RTS

;===================================================================================================

pool Lanmola_SpawnShrapnel

.speed_y
|1AF971| db  28, -28,  28, -28,   0,  36,   0, -36

.speed_x
|1AF979| db -28, -28,  28,  28, -36,   0,  36,   0

endpool

;---------------------------------------------------------------------------------------------------

Lanmola_SpawnShrapnel:
|1AF981| LDY.b #$03

|1AF983| LDA.w $0DD0
|1AF986| CLC
|1AF987| ADC.w $0DD1
|1AF98A| ADC.w $0DD2
|1AF98D| CMP.b #$0A
|1AF98F| BCS .too_much_stuff

|1AF991| LDY.b #$07

.too_much_stuff
|1AF993| STY.w $0FB5

.next_spawn
|1AF996| LDA.b #$C2 ; SPRITE C2
|1AF998| JSL SpawnSpriteDynamically
|1AF99C| BMI .no_space

|1AF99E| JSL SetSpawnedSpriteCoordinates

|1AF9A2| LDA.b $00
|1AF9A4| ADC.b #$04
|1AF9A6| STA.w $0D10,Y

|1AF9A9| LDA.b $02
|1AF9AB| ADC.b #$04
|1AF9AD| STA.w $0D00,Y

|1AF9B0| LDA.b #$01
|1AF9B2| STA.w $0BA0,Y
|1AF9B5| STA.w $0CD2,Y
|1AF9B8| STA.w $0F60,Y

|1AF9BB| DEC A
|1AF9BC| STA.w $0F70,Y

|1AF9BF| LDA.b #$20
|1AF9C1| STA.w $0E40,Y

|1AF9C4| PHX
|1AF9C5| LDX.w $0FB5

|1AF9C8| LDA.l .speed_x,X
|1AF9CC| STA.w $0D50,Y

|1AF9CF| LDA.l .speed_y,X
|1AF9D3| STA.w $0D40,Y

|1AF9D6| JSL GetRandomNumber

|1AF9DA| AND.b #$01
|1AF9DC| STA.w $0DC0,Y

|1AF9DF| PLX

.no_space
|1AF9E0| DEC.w $0FB5
|1AF9E3| BPL .next_spawn

|1AF9E5| RTL

;===================================================================================================

UNREACHABLE_1AF9E6:
|1AF9E6| LDY.b #$00
|1AF9E8| CMP.b #$00
|1AF9EA| BPL .positive

|1AF9EC| DEY

.positive
|1AF9ED| CLC
|1AF9EE| ADC.w $0FDA
|1AF9F1| STA.w $0FDA

|1AF9F4| TYA
|1AF9F5| ADC.w $0FDB
|1AF9F8| STA.w $0FDB

|1AF9FB| LDA.w $0F50,X
|1AF9FE| PHA

|1AF9FF| JSL Cukeman

|1AFA03| PLA
|1AFA04| STA.w $0F50,X

|1AFA07| JSL Get16BitSpriteCoords_long

|1AFA0B| RTL

;===================================================================================================

Cukeman:
|1AFA0C| LDA.w $0EB0,X
|1AFA0F| BEQ .exit

|1AFA11| LDA.w $0DD0,X
|1AFA14| CMP.b #$09
|1AFA16| BNE .dont_speak

|1AFA18| LDA.b $11
|1AFA1A| ORA.w $0FC1
|1AFA1D| BNE .dont_speak

|1AFA1F| REP #$20

|1AFA21| LDA.w $0FD8
|1AFA24| SEC
|1AFA25| SBC.b $22
|1AFA27| CLC
|1AFA28| ADC.w #$0018
|1AFA2B| CMP.w #$0030
|1AFA2E| BCS .dont_speak

|1AFA30| LDA.b $20
|1AFA32| SEC
|1AFA33| SBC.w $0FDA
|1AFA36| CLC
|1AFA37| ADC.w #$0020
|1AFA3A| CMP.w #$0030
|1AFA3D| BCS .dont_speak

|1AFA3F| SEP #$20

|1AFA41| LDA.b $F6
|1AFA43| BPL .dont_speak

|1AFA45| LDA.w $0E30,X
|1AFA48| INC.w $0E30,X
|1AFA4B| AND.b #$01

|1AFA4D| CLC
|1AFA4E| ADC.b #$7A ; MESSAGE 017A or MESSAGE 017B
|1AFA50| STA.w $1CF0

|1AFA53| LDA.b #$01
|1AFA55| STA.w $1CF1
|1AFA58| JSL ShowMessageMinimal

.dont_speak
|1AFA5C| SEP #$20

;---------------------------------------------------------------------------------------------------

|1AFA5E| PHB
|1AFA5F| PHK
|1AFA60| PLB

|1AFA61| LDA.w $0F50,X
|1AFA64| AND.b #$F0
|1AFA66| PHA

|1AFA67| ORA.b #$08
|1AFA69| STA.w $0F50,X

|1AFA6C| JSR SpriteDraw_Cukeman

|1AFA6F| PLA
|1AFA70| ORA.b #$0D
|1AFA72| STA.w $0F50,X

|1AFA75| LDA.b #$10
|1AFA77| JSL AllocateOAMInRegionA

|1AFA7B| PLB

|1AFA7C| RTL

;---------------------------------------------------------------------------------------------------

.exit
|1AFA7D| RTL

;===================================================================================================

pool SpriteDraw_Cukeman

.oam_groups
|1AFA7E| dw   0,   0 : db $F3, $01, $00, $00
|1AFA86| dw   7,   0 : db $F3, $41, $00, $00
|1AFA8E| dw   4,   7 : db $E0, $07, $00, $00

|1AFA96| dw  -1,   2 : db $F3, $01, $00, $00
|1AFA9E| dw   6,   1 : db $F3, $41, $00, $00
|1AFAA6| dw   4,   8 : db $E0, $07, $00, $00

|1AFAAE| dw   1,   1 : db $F3, $01, $00, $00
|1AFAB6| dw   8,   2 : db $F3, $41, $00, $00
|1AFABE| dw   4,   8 : db $E0, $07, $00, $00

|1AFAC6| dw  -2,   0 : db $F3, $01, $00, $00
|1AFACE| dw  10,   0 : db $F3, $41, $00, $00
|1AFAD6| dw   4,   7 : db $E0, $07, $00, $00

|1AFADE| dw   0,   0 : db $F3, $01, $00, $00
|1AFAE6| dw   8,   0 : db $F3, $41, $00, $00
|1AFAEE| dw   4,   6 : db $E0, $07, $00, $00

|1AFAF6| dw  -5,   0 : db $F3, $01, $00, $00
|1AFAFE| dw  16,   0 : db $F3, $41, $00, $00
|1AFB06| dw   4,   8 : db $E0, $07, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Cukeman:
|1AFB0E| LDA.b #$00
|1AFB10| XBA
|1AFB11| LDA.w $0DC0,X

|1AFB14| REP #$20

|1AFB16| ASL A
|1AFB17| ASL A
|1AFB18| ASL A
|1AFB19| STA.b $00

|1AFB1B| ASL A
|1AFB1C| ADC.b $00
|1AFB1E| ADC.w #.oam_groups
|1AFB21| STA.b $08

|1AFB23| SEP #$20

|1AFB25| LDA.b #$03
|1AFB27| JSL TabulatedSpriteDraw

|1AFB2B| RTS

;===================================================================================================

RunningBoy_SpawnDustGarnish:
|1AFB2C| INC.w $0CBA,X

|1AFB2F| LDA.w $0CBA,X
|1AFB32| AND.b #$0F
|1AFB34| BNE .exit

|1AFB36| PHX
|1AFB37| TXY

|1AFB38| LDX.b #$1D

.next_slot
|1AFB3A| LDA.l $7FF800,X
|1AFB3E| BEQ .free_slot

|1AFB40| DEX
|1AFB41| BPL .next_slot

|1AFB43| INX

.free_slot
|1AFB44| LDA.b #$14 ; GARNISH 14
|1AFB46| STA.l $7FF800,X
|1AFB4A| STA.w $0FB4

|1AFB4D| LDA.w $0D10,Y
|1AFB50| CLC
|1AFB51| ADC.b #$04
|1AFB53| STA.l $7FF83C,X

|1AFB57| LDA.w $0D30,Y
|1AFB5A| ADC.b #$00
|1AFB5C| STA.l $7FF878,X

|1AFB60| LDA.w $0D00,Y
|1AFB63| CLC
|1AFB64| ADC.b #$1C
|1AFB66| STA.l $7FF81E,X

|1AFB6A| LDA.w $0D20,Y
|1AFB6D| ADC.b #$00
|1AFB6F| STA.l $7FF85A,X

|1AFB73| LDA.b #$0A
|1AFB75| STA.l $7FF90E,X

|1AFB79| PLX

.exit
|1AFB7A| RTL

;===================================================================================================

pool SubstituteAlternateSecret

.screen_mask
|1AFB7B| db $00, $00, $00, $00, $00, $00, $00, $04
|1AFB83| db $00, $00, $00, $00, $00, $00, $00, $00
|1AFB8B| db $04, $04, $06, $04, $04, $06, $00, $00
|1AFB93| db $0F, $0F, $04, $05, $05, $04, $06, $06
|1AFB9B| db $0F, $0F, $04, $05, $05, $07, $06, $06
|1AFBA3| db $1F, $1F, $04, $07, $07, $04, $06, $06
|1AFBAB| db $06, $07, $02, $00, $00, $00, $00, $00
|1AFBB3| db $06, $06, $02, $00, $00, $00, $00, $00

;---------------------------------------------------------------------------------------------------

.secret_index
|1AFBBB| db $01 ; Green rupee
|1AFBBC| db $01 ; Green rupee
|1AFBBD| db $01 ; Green rupee
|1AFBBE| db $01 ; Green rupee
|1AFBBF| db $0F ; Green guard
|1AFBC0| db $01 ; Green rupee
|1AFBC1| db $01 ; Green rupee
|1AFBC2| db $12 ; Landmine

|1AFBC3| db $10 ; Bush stal
|1AFBC4| db $01 ; Green rupee
|1AFBC5| db $01 ; Green rupee
|1AFBC6| db $01 ; Green rupee
|1AFBC7| db $11 ; Blue guard
|1AFBC8| db $01 ; Green rupee
|1AFBC9| db $01 ; Green rupee
|1AFBCA| db $03 ; Bee

;---------------------------------------------------------------------------------------------------

.prize_mask
|1AFBCB| db $00 ; Green rupee
|1AFBCC| db $00 ; Green rupee
|1AFBCD| db $00 ; Green rupee
|1AFBCE| db $00 ; Green rupee
|1AFBCF| db $02 ; Green guard
|1AFBD0| db $00 ; Green rupee
|1AFBD1| db $00 ; Green rupee
|1AFBD2| db $08 ; Landmine

|1AFBD3| db $10 ; Bush stal
|1AFBD4| db $00 ; Green rupee
|1AFBD5| db $00 ; Green rupee
|1AFBD6| db $00 ; Green rupee
|1AFBD7| db $01 ; Blue guard
|1AFBD8| db $00 ; Green rupee
|1AFBD9| db $00 ; Green rupee
|1AFBDA| db $00 ; Bee

endpool

;---------------------------------------------------------------------------------------------------

SubstituteAlternateSecret:
|1AFBDB| PHB
|1AFBDC| PHK
|1AFBDD| PLB

|1AFBDE| JSL GetRandomNumber
|1AFBE2| AND.b #$01
|1AFBE4| BNE .exit

|1AFBE6| STZ.b $0D

|1AFBE8| LDY.b #$0F

.next_slot
|1AFBEA| LDA.w $0DD0,Y
|1AFBED| BEQ .skip_slot

|1AFBEF| LDA.w $0E20,Y
|1AFBF2| CMP.b #$6C ; SPRITE 6C
|1AFBF4| BEQ .skip_slot

|1AFBF6| INC.b $0D

.skip_slot
|1AFBF8| DEY
|1AFBF9| BPL .next_slot

;---------------------------------------------------------------------------------------------------

|1AFBFB| LDA.b $0D
|1AFBFD| CMP.b #$04
|1AFBFF| BCS .exit

|1AFC01| LDA.l $7EF3C5
|1AFC05| CMP.b #$02
|1AFC07| BCC .exit

|1AFC09| LDA.w $0CF7

|1AFC0C| INC.w $0CF7
|1AFC0F| AND.b #$07

|1AFC11| LDY.w $0FFF
|1AFC14| BEQ .light_world

|1AFC16| ORA.b #$08

.light_world
|1AFC18| TAY

|1AFC19| PHX

|1AFC1A| LDA.w $040A
|1AFC1D| AND.b #$3F
|1AFC1F| TAX

|1AFC20| LDA.w .screen_mask,X
|1AFC23| AND.w .prize_mask,Y
|1AFC26| BNE .no_sub

|1AFC28| LDA.w .secret_index,Y
|1AFC2B| STA.w $0B9C

.no_sub
|1AFC2E| PLX

.exit
|1AFC2F| PLB

|1AFC30| RTL

;===================================================================================================

Sprite_EE_CastleMantle:
|1AFC31| PHB
|1AFC32| PHK
|1AFC33| PLB

|1AFC34| JSR .main

|1AFC37| PLB

|1AFC38| RTL

;---------------------------------------------------------------------------------------------------

.main
|1AFC39| JSR SpriteDraw_CastleMantle
|1AFC3C| JSR CheckIfActive_bank1A

|1AFC3F| JSL CheckDamageToLink_same_layer_long
|1AFC43| BCC .exit

|1AFC45| JSL AbortMovement
|1AFC49| JSL RepelDash_long

|1AFC4D| LDA.l $7EF3CC
|1AFC51| CMP.b #$01 ; FOLLOWER 01
|1AFC53| BNE .exit

|1AFC55| LDA.l $7EF34A
|1AFC59| BEQ .exit

|1AFC5B| LDA.w $0372
|1AFC5E| BNE .exit

|1AFC60| LDA.w $0ED0,X
|1AFC63| CMP.b #$90
|1AFC65| BEQ .exit

|1AFC67| LDA.b $28
|1AFC69| CMP.b #$18
|1AFC6B| BMI .exit

|1AFC6D| LDA.b #$04
|1AFC6F| STA.l $7EF3C8

|1AFC73| INC.w $0E80,X

|1AFC76| LDA.w $0E80,X
|1AFC79| AND.b #$01
|1AFC7B| BNE .swap_parity

|1AFC7D| INC.w $0ED0,X

.swap_parity
|1AFC80| LDA.w $0ED0,X
|1AFC83| CMP.b #$08
|1AFC85| BCC .exit

|1AFC87| LDA.w $012E
|1AFC8A| BNE .skip_sfx

|1AFC8C| LDA.b #$22 ; SFX2.22
|1AFC8E| STA.w $012E

.skip_sfx
|1AFC91| LDA.b #$02
|1AFC93| STA.w $0D50,X

|1AFC96| JSL MoveSpriteXY_bank1D_long

.exit
|1AFC9A| RTS

;===================================================================================================

pool SpriteDraw_CastleMantle

.offset_x
|1AFC9B| db   0,  16,  32,   0,  16,  32

.offset_y
|1AFCA1| db   0,   0,   0,  16,  16,  16

.char
|1AFCA7| db $0C, $0E, $0C, $2C, $2E, $2C

.prop
|1AFCAD| db $31, $31, $71, $31, $31, $71

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_CastleMantle:
|1AFCB3| LDA.b #$20
|1AFCB5| JSL AllocateOAMInRegionB

|1AFCB9| JSL GetScreenCoordinates_long
|1AFCBD| BCS .exit

|1AFCBF| PHX

|1AFCC0| LDX.b #$05

.next_object
|1AFCC2| LDA.b $00
|1AFCC4| CLC
|1AFCC5| ADC.w .offset_x,X
|1AFCC8| STA.b ($90),Y

|1AFCCA| LDA.b $02
|1AFCCC| CLC
|1AFCCD| ADC.w .offset_y,X
|1AFCD0| INY
|1AFCD1| STA.b ($90),Y

|1AFCD3| LDA.w .char,X
|1AFCD6| INY
|1AFCD7| STA.b ($90),Y

|1AFCD9| LDA.w .prop,X
|1AFCDC| INY
|1AFCDD| STA.b ($90),Y

|1AFCDF| INY

|1AFCE0| DEX
|1AFCE1| BPL .next_object

;---------------------------------------------------------------------------------------------------

|1AFCE3| PLX

|1AFCE4| LDY.b #$02
|1AFCE6| LDA.b #$05
|1AFCE8| JSL CorrectOAMEntries_long

.exit
|1AFCEC| RTS

;===================================================================================================

pool SpriteDraw_Mothula

.oam_groups
|1AFCED| dw -24,  -8 : db $80, $00, $00, $02
|1AFCF5| dw  -8,  -8 : db $82, $00, $00, $02
|1AFCFD| dw   8,  -8 : db $82, $40, $00, $02
|1AFD05| dw  24,  -8 : db $80, $40, $00, $02
|1AFD0D| dw -24,   8 : db $A0, $00, $00, $02
|1AFD15| dw  -8,   8 : db $A2, $00, $00, $02
|1AFD1D| dw   8,   8 : db $A2, $40, $00, $02
|1AFD25| dw  24,   8 : db $A0, $40, $00, $02

|1AFD2D| dw -24,  -8 : db $84, $00, $00, $02
|1AFD35| dw  -8,  -8 : db $86, $00, $00, $02
|1AFD3D| dw   8,  -8 : db $86, $40, $00, $02
|1AFD45| dw  24,  -8 : db $84, $40, $00, $02
|1AFD4D| dw -24,   8 : db $A4, $00, $00, $02
|1AFD55| dw  -8,   8 : db $A6, $00, $00, $02
|1AFD5D| dw   8,   8 : db $A6, $40, $00, $02
|1AFD65| dw  24,   8 : db $A4, $40, $00, $02

|1AFD6D| dw  -8,  -8 : db $88, $00, $00, $02
|1AFD75| dw  -8,  -8 : db $88, $00, $00, $02
|1AFD7D| dw   8,  -8 : db $88, $40, $00, $02
|1AFD85| dw   8,  -8 : db $88, $40, $00, $02
|1AFD8D| dw  -8,   8 : db $A8, $00, $00, $02
|1AFD95| dw  -8,   8 : db $A8, $00, $00, $02
|1AFD9D| dw   8,   8 : db $A8, $40, $00, $02
|1AFDA5| dw   8,   8 : db $A8, $40, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Mothula:
|1AFDAD| PHB
|1AFDAE| PHK
|1AFDAF| PLB

|1AFDB0| JSR .draw_her

|1AFDB3| PLB

|1AFDB4| RTL

;---------------------------------------------------------------------------------------------------

.draw_her
|1AFDB5| LDA.b #$00
|1AFDB7| XBA
|1AFDB8| LDA.w $0DC0,X

|1AFDBB| REP #$20

|1AFDBD| ASL A
|1AFDBE| ASL A
|1AFDBF| ASL A
|1AFDC0| ASL A
|1AFDC1| ASL A
|1AFDC2| ASL A

|1AFDC3| ADC.w #.oam_groups
|1AFDC6| STA.b $08

|1AFDC8| LDA.w #$0920
|1AFDCB| STA.b $90

|1AFDCD| LDA.w #$0A68
|1AFDD0| STA.b $92

|1AFDD2| SEP #$20

|1AFDD4| LDA.b #$08
|1AFDD6| JSL TabulatedSpriteDraw

|1AFDDA| LDA.w $0F00,X
|1AFDDD| BNE .exit

;---------------------------------------------------------------------------------------------------

|1AFDDF| PHX

|1AFDE0| LDA.w $0DC0,X
|1AFDE3| ASL A
|1AFDE4| ASL A
|1AFDE5| ASL A
|1AFDE6| ADC.w $0DC0,X
|1AFDE9| STA.b $06

|1AFDEB| LDA.b $02
|1AFDED| CLC
|1AFDEE| ADC.w $0F70,X
|1AFDF1| STA.b $02

|1AFDF3| LDA.b $03
|1AFDF5| ADC.b #$00
|1AFDF7| STA.b $03

|1AFDF9| LDY.b #$28
|1AFDFB| LDX.b #$08

;---------------------------------------------------------------------------------------------------

.next_object
|1AFDFD| PHX

|1AFDFE| TXA
|1AFDFF| CLC
|1AFE00| ADC.b $06
|1AFE02| ASL A
|1AFE03| TAX

|1AFE04| REP #$20

|1AFE06| LDA.b $00
|1AFE08| CLC
|1AFE09| ADC.w .offset_x,X
|1AFE0C| STA.b ($90),Y

|1AFE0E| AND.w #$0100
|1AFE11| STA.b $0E

|1AFE13| INY
|1AFE14| LDA.b $02

|1AFE16| CLC
|1AFE17| ADC.w #$0010
|1AFE1A| STA.b ($90),Y

|1AFE1C| CLC
|1AFE1D| ADC.w #$0010
|1AFE20| CMP.w #$0100

|1AFE23| SEP #$20
|1AFE25| BCC .off_screeen

|1AFE27| LDA.b #$F0
|1AFE29| STA.b ($90),Y

.off_screeen
|1AFE2B| INY
|1AFE2C| LDA.b #$6C
|1AFE2E| STA.b ($90),Y

|1AFE30| INY
|1AFE31| LDA.b #$24
|1AFE33| STA.b ($90),Y

|1AFE35| PHY

|1AFE36| TYA
|1AFE37| LSR A
|1AFE38| LSR A
|1AFE39| TAY

|1AFE3A| LDA.b #$02
|1AFE3C| ORA.b $0F
|1AFE3E| STA.b ($92),Y

|1AFE40| PLY
|1AFE41| INY

|1AFE42| PLX
|1AFE43| DEX
|1AFE44| BPL .next_object

;---------------------------------------------------------------------------------------------------

|1AFE46| PLX

.exit
|1AFE47| RTS

;---------------------------------------------------------------------------------------------------

.offset_x
|1AFE48| dw   0,   3,   6,   9,  12,  -3,  -6,   -9, -12
|1AFE5A| dw   0,   2,   4,   6,   8,  -2,  -4,   -6,  -8
|1AFE6C| dw   0,   1,   2,   3,   4,  -1,  -2,   -3,  -4

;===================================================================================================

pool PurchaseGoldenBee

.speed_x
|1AFE7E| db  -6,  -3,   0,   4,   7

.speed_y
|1AFE83| db  11,  14,  16,  14,  11

endpool

;---------------------------------------------------------------------------------------------------

PurchaseGoldenBee:
|1AFE88| PHB
|1AFE89| PHK
|1AFE8A| PLB

|1AFE8B| LDA.b #$13 ; SFX3.13
|1AFE8D| JSL QueueSpriteSFX3WithPan

|1AFE91| LDA.b #$04
|1AFE93| STA.w $0FB5

.next_spawn
|1AFE96| LDA.b #$DB ; SPRITE DB
|1AFE98| JSL SpawnSpriteDynamically
|1AFE9C| BMI .no_space

|1AFE9E| JSL SetSpawnedSpriteCoordinates

|1AFEA2| LDA.b $00
|1AFEA4| CLC
|1AFEA5| ADC.b #$04
|1AFEA7| STA.w $0D10,Y

|1AFEAA| LDA.b #$FF
|1AFEAC| STA.w $0B58,Y

|1AFEAF| PHX

|1AFEB0| LDX.w $0FB5

|1AFEB3| LDA.w .speed_x,X
|1AFEB6| STA.w $0D50,Y

|1AFEB9| LDA.w .speed_y,X
|1AFEBC| STA.w $0D40,Y

|1AFEBF| LDA.b #$20
|1AFEC1| STA.w $0F80,Y
|1AFEC4| STA.w $0F10,Y

|1AFEC7| PLX

.no_space
|1AFEC8| DEC.w $0FB5
|1AFECB| BPL .next_spawn

|1AFECD| PLB

|1AFECE| RTL

;===================================================================================================

ChickenLady:
|1AFECF| JSR .main

|1AFED2| RTL

;---------------------------------------------------------------------------------------------------

.main
|1AFED3| LDA.b #$01
|1AFED5| STA.w $0DE0,X

|1AFED8| JSL SpriteDraw_RaceGameLady
|1AFEDC| JSR CheckIfActive_bank1A

|1AFEDF| LDA.w $0DF0,X
|1AFEE2| CMP.b #$01
|1AFEE4| BNE .no_message

|1AFEE6| LDA.b #$7D ; MESSAGE 017D
|1AFEE8| STA.w $1CF0

|1AFEEB| LDA.b #$01
|1AFEED| STA.w $1CF1

|1AFEF0| JSL ShowMessageMinimal

.no_message
|1AFEF4| LDA.b $1A
|1AFEF6| LSR A
|1AFEF7| LSR A
|1AFEF8| LSR A
|1AFEF9| LSR A
|1AFEFA| AND.b #$01
|1AFEFC| STA.w $0DC0,X

|1AFEFF| RTS

;===================================================================================================

SpritePrep_DiggingGameGuy:
|1AFF00| LDA.w $0D00,X
|1AFF03| STA.b $00

|1AFF05| LDA.w $0D20,X
|1AFF08| STA.b $01

|1AFF0A| REP #$20

|1AFF0C| LDA.b $20
|1AFF0E| CMP.b $00

|1AFF10| SEP #$30
|1AFF12| BCS .link_is_below

|1AFF14| LDA.b #$05
|1AFF16| STA.w $0D80,X

|1AFF19| LDA.w $0D10,X
|1AFF1C| SEC
|1AFF1D| SBC.b #$09
|1AFF1F| STA.w $0D10,X

|1AFF22| LDA.b #$01
|1AFF24| STA.w $0DC0,X

.link_is_below
|1AFF27| INC.w $0BA0,X

|1AFF2A| RTL

;===================================================================================================

pool SpawnHammeredSplash

.offset_x
|1AFF2B| dw   0,  12,  -8,  24

.offset_y
|1AFF33| dw   8,  32,  24,  24

endpool

;---------------------------------------------------------------------------------------------------

#EXIT_1AFF3B:
|1AFF3B| RTL

;---------------------------------------------------------------------------------------------------

SpawnHammeredSplash:
|1AFF3C| LDA.b $11
|1AFF3E| ORA.w $02E4
|1AFF41| ORA.w $0FC1
|1AFF44| BNE EXIT_1AFF3B

|1AFF46| PHX
|1AFF47| PHY

|1AFF48| LDX.b $2F

|1AFF4A| REP #$20

|1AFF4C| LDA.b $22
|1AFF4E| CLC
|1AFF4F| ADC.l .offset_x,X
|1AFF53| STA.b $00

|1AFF55| LDA.b $20
|1AFF57| CLC
|1AFF58| ADC.l .offset_y,X
|1AFF5C| STA.b $02

|1AFF5E| SEP #$20

|1AFF60| LDA.b $EE
|1AFF62| CMP.b #$01

|1AFF64| REP #$30

|1AFF66| STZ.b $05
|1AFF68| BCC .lower_layer

|1AFF6A| LDA.w #$1000
|1AFF6D| STA.b $05

.lower_layer
|1AFF6F| SEP #$20

|1AFF71| LDA.b $1B

|1AFF73| REP #$20
|1AFF75| BEQ .outdoors

;---------------------------------------------------------------------------------------------------


|1AFF77| LDA.b $00
|1AFF79| AND.w #$01FF
|1AFF7C| LSR A
|1AFF7D| LSR A
|1AFF7E| LSR A
|1AFF7F| STA.b $04

|1AFF81| LDA.b $02
|1AFF83| AND.w #$01F8
|1AFF86| ASL A
|1AFF87| ASL A
|1AFF88| ASL A
|1AFF89| CLC
|1AFF8A| ADC.b $04

|1AFF8C| CLC
|1AFF8D| ADC.b $05

|1AFF8F| TAX

|1AFF90| LDA.l $7F2000,X
|1AFF94| BRA .verify_water

;---------------------------------------------------------------------------------------------------

.outdoors

|1AFF96| LDA.b $02
|1AFF98| PHA

|1AFF99| LDA.b $00
|1AFF9B| LSR A
|1AFF9C| LSR A
|1AFF9D| LSR A
|1AFF9E| STA.b $02

|1AFFA0| PLA
|1AFFA1| STA.b $00

|1AFFA3| SEP #$30

|1AFFA5| JSL ReadOverworldTileType

|1AFFA9| REP #$10

;---------------------------------------------------------------------------------------------------

.verify_water
|1AFFAB| SEP #$30

|1AFFAD| CMP.b #$08 ; TILETYPE 08
|1AFFAF| BEQ .is_water

|1AFFB1| CMP.b #$09 ; TILETYPE 09
|1AFFB3| BNE .no_splash

.is_water
|1AFFB5| JSL Sprite_SpawnSmallSplash
|1AFFB9| BMI .no_splash

|1AFFBB| LDX.b $2F

|1AFFBD| LDA.b $20
|1AFFBF| CLC
|1AFFC0| ADC.l .offset_y+0,X
|1AFFC4| PHP

|1AFFC5| SEC
|1AFFC6| SBC.b #$10
|1AFFC8| STA.w $0D00,Y

|1AFFCB| LDA.b $21
|1AFFCD| SBC.b #$00

|1AFFCF| PLP
|1AFFD0| ADC.l .offset_y+1,X
|1AFFD4| STA.w $0D20,Y

|1AFFD7| LDA.b $22
|1AFFD9| CLC
|1AFFDA| ADC.l .offset_x+0,X
|1AFFDE| PHP

|1AFFDF| SEC
|1AFFE0| SBC.b #$08
|1AFFE2| STA.w $0D10,Y

|1AFFE5| LDA.b $23
|1AFFE7| SBC.b #$00

|1AFFE9| PLP
|1AFFEA| ADC.l .offset_x+1,X
|1AFFEE| STA.w $0D30,Y

|1AFFF1| LDA.b $EE
|1AFFF3| STA.w $0F20,Y

|1AFFF6| LDA.b #$00
|1AFFF8| STA.w $0F70,Y

.no_splash
|1AFFFB| PLX
|1AFFFC| PLY

|1AFFFD| RTL

;===================================================================================================
; FREE ROM: 0x02
;===================================================================================================
NULL_1AFFFE:
|1AFFFE| db $FF, $FF

;===================================================================================================
