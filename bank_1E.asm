org $1E8000

;===================================================================================================

HelmasaurKing_Initialize:
#_1E8000: LDA.b #$30
#_1E8002: STA.w $0B2F

#_1E8005: LDA.b #$80
#_1E8007: STA.w $0B2D

#_1E800A: STZ.w $0B2E
#_1E800D: STZ.w $0B30
#_1E8010: STZ.w $0B33
#_1E8013: STZ.w $0B31
#_1E8016: STZ.w $0B32

;===================================================================================================

HelmasaurKing_Reinitialize:
#_1E8019: PHB
#_1E801A: PHK
#_1E801B: PLB

#_1E801C: PHX

#_1E801D: LDA.w $0E80,X
#_1E8020: STA.b $00

#_1E8022: LDY.b #$03

.next_leg
#_1E8024: LDA.b $00
#_1E8026: CLC
#_1E8027: ADC.w HelmasaurKingLeg_OffsetYBaseIndex,Y
#_1E802A: AND.b #$1F
#_1E802C: TAX

#_1E802D: LDA.w HelmasaurKingLeg_Offset_Y,X
#_1E8030: STA.w $0B08,Y

#_1E8033: DEY
#_1E8034: BPL .next_leg

#_1E8036: PLX
#_1E8037: PLB

#_1E8038: RTL

;===================================================================================================

Sprite_92_HelmasaurKing:
#_1E8039: LDA.w $0DB0,X
#_1E803C: BPL HelmasaurKing_Main

;===================================================================================================

HelmasaurKing_MaskDebris:
#_1E803E: LDA.w $0DF0,X
#_1E8041: BEQ .stay_around

#_1E8043: DEC A
#_1E8044: BNE .stay_around

#_1E8046: STZ.w $0DD0,X

.stay_around
#_1E8049: JSL SpriteDraw_SingleLarge_long
#_1E804D: JSR Sprite_CheckIfActive_Bank1E

#_1E8050: LDA.b $1A
#_1E8052: AND.b #$07
#_1E8054: ORA.w $0E00,X
#_1E8057: BNE .preserve_flip

#_1E8059: LDA.w $0F50,X
#_1E805C: EOR.b #$40
#_1E805E: STA.w $0F50,X

.preserve_flip
#_1E8061: JSR Sprite_Move_XYZ_Bank1E

#_1E8064: DEC.w $0F80,X
#_1E8067: DEC.w $0F80,X

#_1E806A: LDA.w $0F70,X
#_1E806D: BPL .exit

#_1E806F: STZ.w $0F70,X

#_1E8072: LDA.b #$0C
#_1E8074: STA.w $0DF0,X

#_1E8077: LDA.b #$18
#_1E8079: STA.w $0F80,X

#_1E807C: LDA.b #$06
#_1E807E: STA.w $0DC0,X

.exit
#_1E8081: RTS

;===================================================================================================

HelmasaurKing_Main:
#_1E8082: CMP.b #$03
#_1E8084: BCS .still_masked

#_1E8086: LDA.w $0B89,X
#_1E8089: AND.b #$F1
#_1E808B: STA.w $0B89,X

#_1E808E: LDA.b #$0A
#_1E8090: STA.w $0B6B,X

#_1E8093: BRA .continue

.still_masked
#_1E8095: LDA.b #$1F
#_1E8097: STA.w $0F60,X

#_1E809A: LDA.b #$02
#_1E809C: STA.w $0B6B,X

.continue
#_1E809F: JSR SpriteDraw_KingHelmasaur

#_1E80A2: LDA.w $0DD0,X
#_1E80A5: CMP.b #$06
#_1E80A7: BNE HelmasaurKing_Alive

#_1E80A9: LDA.w $0DF0,X
#_1E80AC: BNE .delay_explosions

#_1E80AE: LDA.b #$04
#_1E80B0: STA.w $0DD0,X

#_1E80B3: STZ.w $0D90,X

#_1E80B6: LDA.b #$E0
#_1E80B8: STA.w $0DF0,X

#_1E80BB: RTS

;---------------------------------------------------------------------------------------------------

.delay_explosions
#_1E80BC: PHA

#_1E80BD: ORA.b #$F0
#_1E80BF: STA.w $0EF0,X

#_1E80C2: PLA
#_1E80C3: CMP.b #$80
#_1E80C5: BCS .exit

#_1E80C7: AND.b #$07
#_1E80C9: BNE .exit

#_1E80CB: LDY.w $0B33
#_1E80CE: CPY.b #$10
#_1E80D0: BEQ .exit

#_1E80D2: INC.w $0B33

#_1E80D5: STZ.b $00

#_1E80D7: LDA.w $0B0D,Y
#_1E80DA: BPL .positive_a

#_1E80DC: DEC.b $00

.positive_a
#_1E80DE: CLC
#_1E80DF: ADC.w $0D10,X
#_1E80E2: STA.w $0FD8

#_1E80E5: LDA.w $0D30,X
#_1E80E8: ADC.b $00
#_1E80EA: STA.w $0FD9

#_1E80ED: STZ.b $00

#_1E80EF: LDA.w $0B1D,Y
#_1E80F2: BPL .positive_b

#_1E80F4: DEC.b $00

.positive_b
#_1E80F6: CLC
#_1E80F7: ADC.w $0D00,X
#_1E80FA: STA.w $0FDA

#_1E80FD: LDA.w $0D20,X
#_1E8100: ADC.b $00
#_1E8102: STA.w $0FDB

#_1E8105: JSL MakeBossExplosion

.exit
#_1E8109: RTS

;===================================================================================================

pool HelmasaurKing_Alive

.phase_hp
#_1E810A: db $03, $03, $03, $03, $03, $03, $03, $03
#_1E8112: db $02, $02, $01, $01, $00

pool off

;---------------------------------------------------------------------------------------------------

HelmasaurKing_Alive:
#_1E8117: JSR Sprite_CheckIfActive_Bank1E

#_1E811A: LDA.w $0E50,X
#_1E811D: LSR A
#_1E811E: LSR A
#_1E811F: TAY

#_1E8120: LDA.w .phase_hp,Y
#_1E8123: STA.w $0DB0,X

#_1E8126: CMP.b #$03
#_1E8128: BNE .not_phase3

#_1E812A: CMP.w $0E90,X
#_1E812D: BEQ .continue

#_1E812F: STZ.w $0EF0,X

#_1E8132: JSR HelmasaurKing_ExplodeMask
#_1E8135: BRA .continue

.not_phase3
#_1E8137: CMP.w $0E90,X
#_1E813A: BEQ .continue

#_1E813C: JSR HelmasaurKing_ChipAwayAtMask

.continue
#_1E813F: LDA.w $0DB0,X
#_1E8142: STA.w $0E90,X

#_1E8145: JSL Sprite_CheckDamageFromLink_long

#_1E8149: JSR HelmasaurKing_SwingTail
#_1E814C: JSR HelmasaurKing_AttemptDamage
#_1E814F: JSR HelmasaurKing_CheckMaskDamageFromHammer

#_1E8152: LDA.w $0E00,X
#_1E8155: BEQ .might_fireball

#_1E8157: CMP.b #$60
#_1E8159: BEQ .no_fireball

#_1E815B: RTS

;---------------------------------------------------------------------------------------------------

.might_fireball
#_1E815C: LDA.w $0E10,X
#_1E815F: BEQ .do_attack

#_1E8161: CMP.b #$40
#_1E8163: BNE .exit

#_1E8165: JSR HelmasaurKing_SpitFireball

#_1E8168: LDA.w $0DB0,X
#_1E816B: CMP.b #$03
#_1E816D: BCC .exit

.no_fireball
#_1E816F: LDA.w $0EC0,X
#_1E8172: BNE .exit

#_1E8174: INC.w $0EC0,X

#_1E8177: LDA.b #$20
#_1E8179: STA.w $0EE0,X

.exit
#_1E817C: RTS

;---------------------------------------------------------------------------------------------------

.do_attack
#_1E817D: LDA.w $0D80,X
#_1E8180: JSL JumpTableLocal
#_1E8184: dw HelmasaurKing_DecisionHome
#_1E8186: dw HelmasaurKing_WalkToLocation
#_1E8188: dw HelmasaurKing_DecisionAway
#_1E818A: dw HelmasaurKing_WalkBackHome

;===================================================================================================

pool HelmasaurKing_DecisionHome

.speed_x
#_1E818C: db -12, -12,  -4,   0,   4,  12,  12,   0

.speed_y
#_1E8194: db   0,   4,  12,  12,  12,   4,   0,  12

pool off

;---------------------------------------------------------------------------------------------------

HelmasaurKing_DecisionHome:
#_1E819C: LDA.w $0EF0,X
#_1E819F: BNE .delay

#_1E81A1: LDA.w $0DF0,X
#_1E81A4: BNE .exit

.delay
#_1E81A6: JSR HelmasaurKing_MaybeFireball

#_1E81A9: JSL GetRandomNumber
#_1E81AD: AND.b #$07
#_1E81AF: TAY

#_1E81B0: LDA.w .speed_x,Y
#_1E81B3: STA.w $0D50,X

#_1E81B6: LDA.w .speed_y,Y
#_1E81B9: STA.w $0D40,X

#_1E81BC: LDA.b #$40
#_1E81BE: STA.w $0DF0,X

#_1E81C1: LDA.w $0DB0,X
#_1E81C4: CMP.b #$03
#_1E81C6: BCC .normal_speed

#_1E81C8: ASL.w $0D50,X
#_1E81CB: ASL.w $0D40,X
#_1E81CE: LSR.w $0DF0,X

.normal_speed
#_1E81D1: INC.w $0D80,X

.exit
#_1E81D4: RTS

;===================================================================================================

HelmasaurKing_WalkToLocation:
#_1E81D5: JSR HelmasaurKing_HandleMovement

#_1E81D8: LDA.w $0DF0,X
#_1E81DB: BNE .exit

#_1E81DD: LDA.b #$20
#_1E81DF: STA.w $0DF0,X

#_1E81E2: INC.w $0D80,X

.exit
#_1E81E5: RTS

;===================================================================================================

HelmasaurKing_HandleMovement:
#_1E81E6: JSR HelmasaurKing_ShuffleLegs

#_1E81E9: LDA.b $1A
#_1E81EB: AND.b #$03
#_1E81ED: BNE .no_extra_shuffle

#_1E81EF: JSR HelmasaurKing_ShuffleLegs

.no_extra_shuffle
#_1E81F2: LDA.w $0DB0,X
#_1E81F5: CMP.b #$03
#_1E81F7: BCC .no_double_extra_shuffle

#_1E81F9: JSR HelmasaurKing_ShuffleLegs

.no_double_extra_shuffle
#_1E81FC: JSR Sprite_Move_XY_Bank1E

#_1E81FF: RTS

;===================================================================================================

HelmasaurKing_ShuffleLegs:
#_1E8200: INC.w $0E80,X

#_1E8203: LDA.w $0E80,X
#_1E8206: AND.b #$0F
#_1E8208: BNE .exit

#_1E820A: LDA.b #$21 ; SFX2.21
#_1E820C: STA.w $012E

.exit
#_1E820F: RTS

;===================================================================================================

HelmasaurKing_DecisionAway:
#_1E8210: LDA.w $0EF0,X
#_1E8213: BNE .delay

#_1E8215: LDA.w $0DF0,X
#_1E8218: BNE .exit

.delay
#_1E821A: JSR HelmasaurKing_MaybeFireball

#_1E821D: LDA.b #$40
#_1E821F: STA.w $0DF0,X

#_1E8222: LDA.w $0E90,X
#_1E8225: CMP.b #$03
#_1E8227: BCC .dont_halve_timer

#_1E8229: LSR.w $0DF0,X

.dont_halve_timer
#_1E822C: LDA.w $0D50,X
#_1E822F: EOR.b #$FF
#_1E8231: INC A
#_1E8232: STA.w $0D50,X

#_1E8235: LDA.w $0D40,X
#_1E8238: EOR.b #$FF
#_1E823A: INC A
#_1E823B: STA.w $0D40,X

#_1E823E: INC.w $0D80,X

.exit
#_1E8241: RTS

;===================================================================================================

HelmasaurKing_WalkBackHome:
#_1E8242: JSR HelmasaurKing_HandleMovement

#_1E8245: LDA.w $0DF0,X
#_1E8248: BNE .exit

#_1E824A: STZ.w $0D80,X

#_1E824D: LDA.b #$40
#_1E824F: STA.w $0DF0,X

.exit
#_1E8252: RTS

;===================================================================================================

HelmasaurKing_MaybeFireball:
#_1E8253: INC.w $0E30,X

#_1E8256: LDA.w $0E30,X
#_1E8259: CMP.b #$04
#_1E825B: BNE .exit

#_1E825D: PLA
#_1E825E: PLA

#_1E825F: STZ.w $0E30,X

#_1E8262: JSL GetRandomNumber
#_1E8266: AND.b #$01
#_1E8268: BEQ .no_sfx

#_1E826A: LDA.b #$7F
#_1E826C: STA.w $0E10,X

#_1E826F: LDA.b #$2A ; SFX3.2A
#_1E8271: JSL SpriteSFX_QueueSFX3WithPan

#_1E8275: RTS

.no_sfx
#_1E8276: LDA.b #$A0
#_1E8278: STA.w $0E00,X

.exit
#_1E827B: RTS

;===================================================================================================

HelmasaurKingLeg_Offset_Y:
#_1E827C: db $00, $01, $02, $03, $04, $05, $06, $07
#_1E8284: db $08, $08, $08, $08, $08, $08, $08, $08
#_1E828C: db $08, $08, $08, $08, $08, $08, $08, $08
#_1E8294: db $08, $07, $06, $05, $04, $03, $02, $01

HelmasaurKingLeg_OffsetYBaseIndex:
#_1E829C: db $00, $08, $10, $18

;===================================================================================================

HelmasaurKing_SwingTail:
#_1E82A0: INC.w $0B0C

#_1E82A3: JSL HelmasaurKing_Reinitialize

#_1E82A7: LDA.b #$01
#_1E82A9: LDY.w $0EC0,X
#_1E82AC: BEQ .allow_success

#_1E82AE: LDA.b #$00

.allow_success
#_1E82B0: AND.b $1A
#_1E82B2: BNE .bad_frame_parity

#_1E82B4: LDA.w $0DE0,X
#_1E82B7: AND.b #$01
#_1E82B9: TAY

#_1E82BA: LDA.w $0B30
#_1E82BD: CLC
#_1E82BE: ADC.w HelmasaurKing_TailSwingRotationDirection,Y
#_1E82C1: STA.w $0B30

#_1E82C4: CMP.w Sixteen_X,Y
#_1E82C7: BNE .x_max

#_1E82C9: INC.w $0DE0,X

.x_max
#_1E82CC: LDY.b #$00

#_1E82CE: LDA.w $0B30
#_1E82D1: BPL .x_pos

#_1E82D3: DEY

.x_pos
#_1E82D4: CLC
#_1E82D5: ADC.w $0B2D
#_1E82D8: STA.w $0B2D

#_1E82DB: TYA
#_1E82DC: ADC.w $0B2E
#_1E82DF: AND.b #$FF
#_1E82E1: STA.w $0B2E

.bad_frame_parity
#_1E82E4: LDA.w $0EC0,X
#_1E82E7: BEQ .exit_a

#_1E82E9: LDA.w $0B30
#_1E82EC: BNE .skip_sfx

#_1E82EE: LDA.b #$06 ; SFX3.06
#_1E82F0: JSL SpriteSFX_QueueSFX3WithPan

;---------------------------------------------------------------------------------------------------

.skip_sfx
#_1E82F4: LDA.w $0EC0,X
#_1E82F7: CMP.b #$02
#_1E82F9: BEQ .do_segment_a

#_1E82FB: CMP.b #$03
#_1E82FD: BEQ .do_segment_b

#_1E82FF: LDA.w $0B30
#_1E8302: ORA.w $0EE0,X
#_1E8305: BNE .exit_b

#_1E8307: LDA.w $0B2E
#_1E830A: AND.b #$01
#_1E830C: STA.w $0EB0,X

#_1E830F: JSR Sprite_IsRightOfLink_Bank1E

#_1E8312: TYA
#_1E8313: EOR.b #$01
#_1E8315: CMP.w $0EB0,X
#_1E8318: BNE .exit_a

#_1E831A: INC.w $0EC0,X

#_1E831D: JSL Sprite_CalculateSFXPan
#_1E8321: ORA.b #$26 ; SFX3.26
#_1E8323: STA.w $012F

.exit_a
#_1E8326: RTS

;===================================================================================================

.offset_low
#_1E8327: db    4,   -4

.offset_high
#_1E8329: db    0,   -1

.limit
#_1E832B: db  124, -124

;---------------------------------------------------------------------------------------------------

.do_segment_a
#_1E832D: LDY.w $0EB0,X

#_1E8330: LDA.w $0B31
#_1E8333: CLC
#_1E8334: ADC.w .offset_low,Y
#_1E8337: STA.w $0B31

#_1E833A: PHA

#_1E833B: LDA.w $0B32
#_1E833E: ADC.w .offset_high,Y
#_1E8341: STA.w $0B32

#_1E8344: PLA
#_1E8345: CMP.w .limit,Y
#_1E8348: BNE .a_fine

#_1E834A: INC.w $0EC0,X

.a_fine
#_1E834D: LDA.w $0B2F
#_1E8350: CLC
#_1E8351: ADC.b #$03
#_1E8353: STA.w $0B2F

#_1E8356: RTS

;---------------------------------------------------------------------------------------------------

.do_segment_b
#_1E8357: LDA.w $0EB0,X
#_1E835A: EOR.b #$01
#_1E835C: TAY

#_1E835D: LDA.w $0B31
#_1E8360: CLC
#_1E8361: ADC.w .offset_low,Y
#_1E8364: STA.w $0B31

#_1E8367: PHA

#_1E8368: LDA.w $0B32
#_1E836B: ADC.w .offset_high,Y
#_1E836E: STA.w $0B32

#_1E8371: PLA
#_1E8372: CMP.b #$00
#_1E8374: BNE .b_fine

#_1E8376: STZ.w $0EC0,X

.b_fine
#_1E8379: LDA.w $0B2F
#_1E837C: SEC
#_1E837D: SBC.b #$03
#_1E837F: STA.w $0B2F

.exit_b
#_1E8382: RTS

;===================================================================================================

HelmasaurKing_TailSwingRotationDirection:
#_1E8383: db  1, -1

;===================================================================================================

HelmasaurKing_CheckMaskDamageFromHammer:
#_1E8385: LDA.w $0DB0,X
#_1E8388: CMP.b #$03
#_1E838A: BCS .exit

#_1E838C: LDA.w $0301
#_1E838F: AND.b #$0A
#_1E8391: BEQ .exit

#_1E8393: LDA.b $44
#_1E8395: CMP.b #$80
#_1E8397: BEQ .exit

#_1E8399: JSL SetupActionHitbox_long

#_1E839D: LDA.w $0D00,X
#_1E83A0: PHA

#_1E83A1: CLC
#_1E83A2: ADC.b #$08
#_1E83A4: STA.w $0D00,X

#_1E83A7: JSL Sprite_SetupHitbox_long

#_1E83AB: PLA
#_1E83AC: STA.w $0D00,X

#_1E83AF: JSL CheckIfHitBoxesOverlap_long
#_1E83B3: BCC .exit

#_1E83B5: DEC.w $0E50,X

#_1E83B8: LDA.b #$21 ; SFX3.21
#_1E83BA: STA.w $012F

#_1E83BD: LDA.b #$30
#_1E83BF: JSL Sprite_ProjectSpeedTowardsLink_long

#_1E83C3: LDA.b $00
#_1E83C5: STA.b $27

#_1E83C7: LDA.b $01
#_1E83C9: STA.b $28

#_1E83CB: LDA.b #$08
#_1E83CD: STA.w $0046

#_1E83D0: LDA.w $0FAC
#_1E83D3: BNE .no_spark

#_1E83D5: LDA.b $00
#_1E83D7: STA.w $0FAD

#_1E83DA: LDA.b $01
#_1E83DC: STA.w $0FAE

#_1E83DF: LDA.b #$05
#_1E83E1: STA.w $0FAC

.no_spark
#_1E83E4: LDA.b #$05 ; SFX2.05
#_1E83E6: JSL SpriteSFX_QueueSFX2WithPan

.exit
#_1E83EA: RTS

;===================================================================================================

HelmasaurKing_AttemptDamage:
#_1E83EB: LDA.b $1A
#_1E83ED: AND.b #$07
#_1E83EF: BNE .no_damage

#_1E83F1: REP #$20

#_1E83F3: LDA.b $22
#_1E83F5: SEC
#_1E83F6: SBC.w $0FD8
#_1E83F9: CLC
#_1E83FA: ADC.w #$0024

#_1E83FD: CMP.w #$0048
#_1E8400: BCS .no_damage

#_1E8402: LDA.b $20
#_1E8404: SEC
#_1E8405: SBC.w $0FDA
#_1E8408: CLC
#_1E8409: ADC.w #$0028

#_1E840C: CMP.w #$0040
#_1E840F: BCS .no_damage

#_1E8411: SEP #$20

#_1E8413: JSL Sprite_AttemptDamageToLinkPlusRecoil_long

.no_damage
#_1E8417: SEP #$20

#_1E8419: RTS

;===================================================================================================

pool HelmasaurKing_SpawnMaskDebris

.offset_y_low
#_1E841A: db  24,  27,  24,  24,  27,  24,  27,  27,  24,  24

.offset_y_high
#_1E8424: db   0,   0,   0,   0,   0,   0,   0,   0,   0,   0

.offset_x_low
#_1E842E: db -16,   0,  16, -16,   0,  16,  -8,   8, -16,  16

.offset_x_high
#_1E8438: db  -1,   0,   0,  -1,   0,   0,  -1,   0,  -1,   0

.initial_z
#_1E8442: db  29,  32,  29,  13,  16,  13,   0,   0,  13,  13

.speed_x
#_1E844C: db -16,  -4,  14, -12,   4,  18,  -2,   2, -12,  18

.speed_y
#_1E8456: db  -8,  -4,  -6,   4,   2,   7,   6,   8,   4,   7

.speed_z
#_1E8460: db  32,  40,  36,  37,  39,  34,  30,  33,  37,  34

.flip
#_1E846A: db $00, $00, $40, $00, $00, $40, $00, $40, $00, $40

.starting_anim
#_1E8474: db $00, $01, $00, $02, $03, $02, $04, $04, $05, $05

pool off

;===================================================================================================

HelmasaurKing_ChipAwayAtMask:
#_1E847E: LDA.w $0DB0,X
#_1E8481: CLC
#_1E8482: ADC.b #$07
#_1E8484: STA.w $0FB5

#_1E8487: JSR HelmasaurKing_SpawnMaskDebris

#_1E848A: BRA .make_sfx

;===================================================================================================

#HelmasaurKing_ExplodeMask:
#_1E848C: LDY.b #$0F
#_1E848E: LDA.b #$00

.next_sprite
#_1E8490: STA.w $0DD0,Y

#_1E8493: DEY
#_1E8494: BNE .next_sprite

#_1E8496: LDA.b #$07
#_1E8498: STA.w $0FB5

.next_debris
#_1E849B: JSR HelmasaurKing_SpawnMaskDebris

#_1E849E: DEC.w $0FB5
#_1E84A1: BPL .next_debris

.make_sfx
#_1E84A3: LDA.b #$1F ; SFX2.1F
#_1E84A5: JSL SpriteSFX_QueueSFX2WithPan

#_1E84A9: RTS

;===================================================================================================

HelmasaurKing_SpawnMaskDebris:
#_1E84AA: LDA.b #$92 ; SPRITE 92
#_1E84AC: JSL Sprite_SpawnDynamically
#_1E84B0: BMI .no_space

#_1E84B2: PHX

#_1E84B3: LDX.w $0FB5

#_1E84B6: LDA.b $00
#_1E84B8: CLC
#_1E84B9: ADC.w .offset_x_low,X
#_1E84BC: STA.w $0D10,Y

#_1E84BF: LDA.b $01
#_1E84C1: ADC.w .offset_x_high,X
#_1E84C4: STA.w $0D30,Y

#_1E84C7: LDA.b $02
#_1E84C9: CLC
#_1E84CA: ADC.w .offset_y_low,X
#_1E84CD: STA.w $0D00,Y

#_1E84D0: LDA.b $03
#_1E84D2: ADC.w .offset_y_high,X
#_1E84D5: STA.w $0D20,Y

#_1E84D8: LDA.w .initial_z,X
#_1E84DB: STA.w $0F70,Y

#_1E84DE: LDA.w .speed_x,X
#_1E84E1: STA.w $0D50,Y

#_1E84E4: LDA.w .speed_y,X
#_1E84E7: STA.w $0D40,Y

#_1E84EA: LDA.w .speed_z,X
#_1E84ED: STA.w $0F80,Y

#_1E84F0: LDA.w .flip,X
#_1E84F3: ORA.b #$0D
#_1E84F5: STA.w $0F50,Y

#_1E84F8: LDA.w .starting_anim,X
#_1E84FB: STA.w $0DC0,Y

#_1E84FE: LDA.b #$80
#_1E8500: STA.w $0DB0,Y

#_1E8503: ASL A
#_1E8504: STA.w $0E40,Y

#_1E8507: LDA.b #$0C
#_1E8509: STA.w $0E00,Y
#_1E850C: STA.w $0BA0,Y

#_1E850F: LDA.w $0FB5
#_1E8512: STA.w $0E30,Y

#_1E8515: PLX

.no_space
#_1E8516: RTS

;===================================================================================================

HelmasaurKing_SpitFireball:
#_1E8517: LDA.b #$70 ; SPRITE 70
#_1E8519: JSL Sprite_SpawnDynamically
#_1E851D: BMI .no_space

#_1E851F: JSL Sprite_SetSpawnedCoordinates

#_1E8523: LDA.b $02
#_1E8525: CLC
#_1E8526: ADC.b #$1C
#_1E8528: STA.w $0D00,Y

#_1E852B: LDA.b $03
#_1E852D: ADC.b #$00
#_1E852F: STA.w $0D20,Y

#_1E8532: LDA.b #$20
#_1E8534: STA.w $0DF0,Y
#_1E8537: STA.w $0BA0,Y

.no_space
#_1E853A: RTS

;===================================================================================================

SpriteDraw_KingHelmasaur:
#_1E853B: REP #$20

#_1E853D: LDA.w #$089C
#_1E8540: STA.b $90

#_1E8542: LDA.w #$0A47
#_1E8545: STA.b $92

#_1E8547: SEP #$20

#_1E8549: JSR Sprite_PrepOAMCoord_Bank1E

#_1E854C: JSR KingHelmasaur_OperateTail
#_1E854F: JSR SpriteDraw_KingHelmasaur_Eyes
#_1E8552: JSR KingHelmasaurMask
#_1E8555: JSR SpriteDraw_KingHelmasaur_Body
#_1E8558: JSR SpriteDraw_KingHelmasaur_Legs
#_1E855B: JSR SpriteDraw_KingHelmasaur_Mouth

#_1E855E: RTS

;===================================================================================================

pool SpriteDraw_KingHelmasaur_Eyes

.offset_x
#_1E855F: db  -3,  11

.char
#_1E8561: db $CE, $CF, $DE, $DE, $DE, $DE, $CF, $CE

.prop
#_1E8569: db $3B, $7B

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_KingHelmasaur_Eyes:
#_1E856B: REP #$20

#_1E856D: LDA.b $90
#_1E856F: CLC
#_1E8570: ADC.w #$0040
#_1E8573: STA.b $90

#_1E8575: LDA.b $92
#_1E8577: CLC
#_1E8578: ADC.w #$0010
#_1E857B: STA.b $92

#_1E857D: SEP #$20

#_1E857F: PHX

#_1E8580: LDY.b #$00
#_1E8582: LDX.b #$01

.next_eye
#_1E8584: PHX

#_1E8585: LDA.b $00
#_1E8587: CLC
#_1E8588: ADC.w .offset_x,X
#_1E858B: STA.b ($90),Y

#_1E858D: LDA.b $02
#_1E858F: CLC
#_1E8590: ADC.b #$14
#_1E8592: INY
#_1E8593: STA.b ($90),Y

#_1E8595: LDA.w $0B0C
#_1E8598: LSR A
#_1E8599: LSR A
#_1E859A: AND.b #$07
#_1E859C: TAX

#_1E859D: LDA.w .char,X
#_1E85A0: INY
#_1E85A1: STA.b ($90),Y

#_1E85A3: PLX

#_1E85A4: LDA.w .prop,X
#_1E85A7: INY
#_1E85A8: STA.b ($90),Y

#_1E85AA: PHY

#_1E85AB: TYA
#_1E85AC: LSR A
#_1E85AD: LSR A
#_1E85AE: TAY

#_1E85AF: LDA.b #$00
#_1E85B1: STA.b ($92),Y

#_1E85B3: PLY
#_1E85B4: INY

#_1E85B5: DEX
#_1E85B6: BPL .next_eye

;---------------------------------------------------------------------------------------------------

#_1E85B8: PLX

#_1E85B9: LDA.b $11
#_1E85BB: BEQ .exit

#_1E85BD: LDY.b #$00
#_1E85BF: LDA.b #$01
#_1E85C1: JSL Sprite_CorrectOAMEntries_long

.exit
#_1E85C5: RTS

;===================================================================================================

pool KingHelmasaurMask

.oam_groups
#_1E85C6: dw -16,  -5 : db $AE, $0D, $00, $02
#_1E85CE: dw   0,  -5 : db $C0, $0D, $00, $02
#_1E85D6: dw  16,  -5 : db $AE, $4D, $00, $02
#_1E85DE: dw -16,  11 : db $C2, $0D, $00, $02
#_1E85E6: dw   0,  11 : db $C4, $0D, $00, $02
#_1E85EE: dw  16,  11 : db $C2, $4D, $00, $02
#_1E85F6: dw  -8,  27 : db $C6, $0D, $00, $02
#_1E85FE: dw   8,  27 : db $C6, $4D, $00, $02

#_1E8606: dw -16,  -5 : db $AE, $0D, $00, $02
#_1E860E: dw   0,  -5 : db $C0, $0D, $00, $02
#_1E8616: dw  16,  -5 : db $AE, $4D, $00, $02
#_1E861E: dw -16,  11 : db $C8, $0D, $00, $02
#_1E8626: dw   0,  11 : db $C4, $0D, $00, $02
#_1E862E: dw  16,  11 : db $C2, $4D, $00, $02
#_1E8636: dw  -8,  27 : db $C6, $0D, $00, $02
#_1E863E: dw   8,  27 : db $C6, $4D, $00, $02

#_1E8646: dw -16,  -5 : db $AE, $0D, $00, $02
#_1E864E: dw   0,  -5 : db $C0, $0D, $00, $02
#_1E8656: dw  16,  -5 : db $AE, $4D, $00, $02
#_1E865E: dw -16,  11 : db $C8, $0D, $00, $02
#_1E8666: dw   0,  11 : db $C4, $0D, $00, $02
#_1E866E: dw  16,  11 : db $C8, $4D, $00, $02
#_1E8676: dw  -8,  27 : db $C6, $0D, $00, $02
#_1E867E: dw   8,  27 : db $C6, $4D, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

KingHelmasaurMask:
#_1E8686: LDA.b #$00
#_1E8688: XBA
#_1E8689: LDA.w $0DB0,X

#_1E868C: REP #$20

#_1E868E: ASL A
#_1E868F: ASL A
#_1E8690: ASL A
#_1E8691: ASL A
#_1E8692: ASL A
#_1E8693: ASL A

#_1E8694: ADC.w #.oam_groups
#_1E8697: STA.b $08

#_1E8699: LDA.b $90
#_1E869B: CLC
#_1E869C: ADC.w #$0008
#_1E869F: STA.b $90

#_1E86A1: INC.b $92
#_1E86A3: INC.b $92

#_1E86A5: SEP #$20

#_1E86A7: LDA.w $0DB0,X
#_1E86AA: CMP.b #$03
#_1E86AC: BCS .exit

#_1E86AE: LDA.b #$08
#_1E86B0: JSR SpriteDraw_Tabulated_Bank1E

#_1E86B3: REP #$20

#_1E86B5: LDA.b $90
#_1E86B7: CLC
#_1E86B8: ADC.w #$0020
#_1E86BB: STA.b $90

#_1E86BD: LDA.b $92
#_1E86BF: CLC
#_1E86C0: ADC.w #$0008
#_1E86C3: STA.b $92

#_1E86C5: SEP #$20

#_1E86C7: LDA.w $0F10,X
#_1E86CA: BEQ .search_for_bomb

.exit
#_1E86CC: RTS

;---------------------------------------------------------------------------------------------------

.search_for_bomb
#_1E86CD: LDY.b #$01

.next_slot
#_1E86CF: LDA.w $0C4A,Y
#_1E86D2: CMP.b #$07 ; ANCILLA 07
#_1E86D4: BNE .to_next

#_1E86D6: LDA.w $0C2C,Y
#_1E86D9: ORA.w $0C22,Y
#_1E86DC: BEQ .to_next

#_1E86DE: JSR KingHelmasaur_CheckBombDamage

.to_next
#_1E86E1: DEY
#_1E86E2: BPL .next_slot

#_1E86E4: RTS

;===================================================================================================

KingHelmasaur_CheckBombDamage:
#_1E86E5: JSL Sprite_SetupHitbox_long

#_1E86E9: LDA.w $0C04,Y
#_1E86EC: CLC
#_1E86ED: ADC.b #$06
#_1E86EF: STA.b $00

#_1E86F1: LDA.w $0C18,Y
#_1E86F4: ADC.b #$00
#_1E86F6: STA.b $08

#_1E86F8: LDA.w $0BFA,Y
#_1E86FB: SEC
#_1E86FC: SBC.w $029E,Y
#_1E86FF: STA.b $01

#_1E8701: LDA.w $0C0E,Y
#_1E8704: SBC.b #$00
#_1E8706: STA.b $09

#_1E8708: LDA.b #$02
#_1E870A: STA.b $02

#_1E870C: LDA.b #$0F
#_1E870E: STA.b $03

#_1E8710: JSL CheckIfHitBoxesOverlap_long
#_1E8714: BCC .not_hit

#_1E8716: LDA.w $0C2C,Y
#_1E8719: EOR.b #$FF
#_1E871B: INC A
#_1E871C: STA.w $0C2C,Y

#_1E871F: LDA.w $0C22,Y
#_1E8722: EOR.b #$FF
#_1E8724: INC A
#_1E8725: STA.b $00

#_1E8727: ASL.b $00
#_1E8729: ROR A
#_1E872A: STA.w $0C22,Y

#_1E872D: LDA.b #$20
#_1E872F: STA.w $0F10,X

#_1E8732: LDA.b #$05
#_1E8734: STA.w $0FAC

#_1E8737: LDA.w $0C04,Y
#_1E873A: STA.w $0FAD

#_1E873D: LDA.w $0BFA,Y
#_1E8740: SEC
#_1E8741: SBC.w $029E,Y
#_1E8744: STA.w $0FAE

#_1E8747: LDA.b #$05 ; SFX2.05
#_1E8749: STA.w $012E

.not_hit
#_1E874C: RTS

;===================================================================================================

pool SpriteDraw_KingHelmasaur_Body

.oam_groups
#_1E874D: dw -24, -32 : db $80, $0B, $00, $02
#_1E8755: dw  -8, -32 : db $82, $0B, $00, $02
#_1E875D: dw   8, -32 : db $82, $4B, $00, $02
#_1E8765: dw  24, -32 : db $80, $4B, $00, $02
#_1E876D: dw -24, -16 : db $84, $0B, $00, $02
#_1E8775: dw  -8, -16 : db $86, $0B, $00, $02
#_1E877D: dw   8, -16 : db $86, $4B, $00, $02
#_1E8785: dw  24, -16 : db $84, $4B, $00, $02
#_1E878D: dw -24,   0 : db $88, $0B, $00, $02
#_1E8795: dw  -8,   0 : db $8A, $0B, $00, $02
#_1E879D: dw   8,   0 : db $8A, $4B, $00, $02
#_1E87A5: dw  24,   0 : db $88, $4B, $00, $02
#_1E87AD: dw -24,  16 : db $8C, $0B, $00, $02
#_1E87B5: dw  -8,  16 : db $8E, $0B, $00, $02
#_1E87BD: dw   8,  16 : db $8E, $4B, $00, $02
#_1E87C5: dw  24,  16 : db $8C, $4B, $00, $02
#_1E87CD: dw  -8,  32 : db $A0, $0B, $00, $02
#_1E87D5: dw   8,  32 : db $A0, $4B, $00, $02
#_1E87DD: dw   0, -40 : db $AC, $0B, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_KingHelmasaur_Body:
#_1E87E5: REP #$20

#_1E87E7: LDA.w #.oam_groups
#_1E87EA: STA.b $08

#_1E87EC: SEP #$20

#_1E87EE: LDA.b #$13

;===================================================================================================

SpriteDraw_Tabulated_Bank1E:
#_1E87F0: JSL SpriteDraw_Tabulated

#_1E87F4: RTS

;===================================================================================================

pool SpriteDraw_KingHelmasaur_Legs

.offset_x
#_1E87F5: db -28, -28,  28,  28

.offset_y
#_1E87F9: db -28,   4, -28,   4

.char
#_1E87FD: db $A2, $A6, $A2, $A6

.prop
#_1E8801: db $0B, $0B, $4B, $4B

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_KingHelmasaur_Legs:
#_1E8805: REP #$20

#_1E8807: LDA.b $90
#_1E8809: CLC
#_1E880A: ADC.w #$004C
#_1E880D: STA.b $90

#_1E880F: LDA.b $92
#_1E8811: CLC
#_1E8812: ADC.w #$0013
#_1E8815: STA.b $92

#_1E8817: SEP #$20

#_1E8819: PHX

#_1E881A: LDY.b #$00
#_1E881C: LDA.b #$03
#_1E881E: STA.w $0FB5

.next_leg
#_1E8821: LDX.w $0FB5

#_1E8824: LDA.b $00
#_1E8826: CLC
#_1E8827: ADC.w .offset_x,X
#_1E882A: STA.b ($90),Y

#_1E882C: LDA.b $02
#_1E882E: CLC
#_1E882F: ADC.w .offset_y,X
#_1E8832: CLC
#_1E8833: ADC.w $0B08,X
#_1E8836: INY
#_1E8837: STA.b ($90),Y

#_1E8839: LDA.w .char,X
#_1E883C: INY
#_1E883D: STA.b ($90),Y

#_1E883F: LDA.w .prop,X
#_1E8842: EOR.b $05
#_1E8844: INY
#_1E8845: STA.b ($90),Y

#_1E8847: PHY

#_1E8848: TYA
#_1E8849: LSR A
#_1E884A: LSR A
#_1E884B: TAY

#_1E884C: LDA.b #$02
#_1E884E: STA.b ($92),Y

#_1E8850: PLY
#_1E8851: INY

#_1E8852: LDA.b $00
#_1E8854: CLC
#_1E8855: ADC.w .offset_x,X
#_1E8858: STA.b ($90),Y

#_1E885A: LDA.b $02
#_1E885C: CLC
#_1E885D: ADC.w .offset_y,X
#_1E8860: CLC
#_1E8861: ADC.b #$10
#_1E8863: CLC
#_1E8864: ADC.w $0B08,X
#_1E8867: INY
#_1E8868: STA.b ($90),Y

#_1E886A: LDA.w .char,X
#_1E886D: CLC
#_1E886E: ADC.b #$02
#_1E8870: INY
#_1E8871: STA.b ($90),Y

#_1E8873: LDA.w .prop,X
#_1E8876: EOR.b $05
#_1E8878: INY
#_1E8879: STA.b ($90),Y

#_1E887B: PHY

#_1E887C: TYA
#_1E887D: LSR A
#_1E887E: LSR A
#_1E887F: TAY

#_1E8880: LDA.b #$02
#_1E8882: STA.b ($92),Y

#_1E8884: PLY
#_1E8885: INY

#_1E8886: DEC.w $0FB5
#_1E8889: BPL .next_leg

#_1E888B: PLX

#_1E888C: LDA.b $11
#_1E888E: BEQ .exit

#_1E8890: LDY.b #$02
#_1E8892: LDA.b #$07
#_1E8894: JSL Sprite_CorrectOAMEntries_long

#_1E8898: JSR Sprite_PrepOAMCoord_Bank1E

.exit
#_1E889B: RTS

;===================================================================================================

pool SpriteDraw_KingHelmasaur_Mouth

.offset_y
#_1E889C: db  1,  2,  3,  4,  5,  6,  7,  8
#_1E88A4: db  9, 10, 10, 10, 10, 10, 10, 10
#_1E88AC: db 10, 10, 10, 10, 10, 10, 10,  9
#_1E88B4: db  8,  7,  6,  5,  4,  3,  2,  1

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_KingHelmasaur_Mouth:
#_1E88BC: LDA.w $0E10,X
#_1E88BF: BEQ .exit

#_1E88C1: LSR A
#_1E88C2: LSR A
#_1E88C3: TAY

#_1E88C4: LDA.w .offset_y,Y
#_1E88C7: STA.b $06

#_1E88C9: LDA.b #$04
#_1E88CB: JSL SpriteDraw_AllocateOAMFromRegionB

#_1E88CF: LDY.b #$00
#_1E88D1: LDA.b $00
#_1E88D3: STA.b ($90),Y

#_1E88D5: LDA.b $02
#_1E88D7: CLC
#_1E88D8: ADC.b #$13

#_1E88DA: ADC.b $06
#_1E88DC: INY
#_1E88DD: STA.b ($90),Y

#_1E88DF: LDA.b #$AA
#_1E88E1: INY
#_1E88E2: STA.b ($90),Y

#_1E88E4: LDA.b $05
#_1E88E6: EOR.b #$0B
#_1E88E8: INY
#_1E88E9: STA.b ($90),Y

#_1E88EB: LDA.b #$02
#_1E88ED: STA.b ($92)

.exit
#_1E88EF: RTS

;===================================================================================================

pool KingHelmasaur_OperateTail

.multiplier_a
#_1E88F0: db $FF, $F0, $E0, $D0, $C0, $B0, $A0, $90
#_1E88F8: db $80, $70, $60, $50, $40, $30, $20, $10

.multiplier_b
#_1E8900: db $FF, $F8, $F0, $E8, $E0, $D8, $D0, $C8
#_1E8908: db $BC, $B0, $A0, $90, $70, $40, $20, $10

.multiplier_c
#_1E8910: db $FF, $F0, $E0, $D0, $C0, $B0, $A0, $90
#_1E8918: db $80, $70, $60, $50, $40, $30, $20, $10

pool off

;---------------------------------------------------------------------------------------------------

KingHelmasaur_OperateTail:
#_1E8920: STZ.w $0FB5

.next_segment
#_1E8923: LDY.w $0FB5
#_1E8926: PHY

#_1E8927: LDA.w $0EC0,X
#_1E892A: BEQ .use_set_a

#_1E892C: TYA
#_1E892D: CLC
#_1E892E: ADC.b #$10
#_1E8930: TAY

.use_set_a
#_1E8931: REP #$20

#_1E8933: LDA.w $0B2D
#_1E8936: CLC
#_1E8937: ADC.w $0B31
#_1E893A: STA.b $0D

#_1E893C: SEP #$20

#_1E893E: LDA.b $0E
#_1E8940: CMP.b #$01

#_1E8942: PHP
#_1E8943: PHP

#_1E8944: LDA.b $0D
#_1E8946: PLP
#_1E8947: BPL .pos_a

#_1E8949: EOR.b #$FF
#_1E894B: INC A

.pos_a
#_1E894C: STA.w WRMPYA

#_1E894F: LDA.w .multiplier_a,Y
#_1E8952: STA.w WRMPYB

#_1E8955: JSR NOP8

#_1E8958: LDA.w RDMPYH

#_1E895B: PLP
#_1E895C: BPL .pos_b

#_1E895E: EOR.b #$FF

.pos_b
#_1E8960: STA.b $06

#_1E8962: LDA.b $0E
#_1E8964: STA.b $07

#_1E8966: PLY

#_1E8967: LDA.w $0B2F
#_1E896A: STA.w WRMPYA

#_1E896D: LDA.w .multiplier_c,Y
#_1E8970: STA.w WRMPYB

#_1E8973: JSR NOP8

#_1E8976: LDA.w RDMPYH
#_1E8979: STA.b $0F

#_1E897B: PHX
#_1E897C: REP #$30

#_1E897E: LDA.b $06
#_1E8980: AND.w #$00FF
#_1E8983: ASL A
#_1E8984: TAX

#_1E8985: LDA.l SmoothCurve,X
#_1E8989: STA.b $0A

#_1E898B: LDA.b $06
#_1E898D: CLC
#_1E898E: ADC.w #$0080
#_1E8991: STA.b $08

#_1E8993: AND.w #$00FF
#_1E8996: ASL A
#_1E8997: TAX

#_1E8998: LDA.l SmoothCurve,X
#_1E899C: STA.b $0C

#_1E899E: SEP #$30

#_1E89A0: PLX

#_1E89A1: LDA.b $0A
#_1E89A3: STA.w WRMPYA

#_1E89A6: LDA.b $0F
#_1E89A8: LDY.b $0B
#_1E89AA: BNE .nonzero_a

#_1E89AC: STA.w WRMPYB

#_1E89AF: JSR NOP8

#_1E89B2: ASL.w RDMPYL
#_1E89B5: LDA.w RDMPYH
#_1E89B8: ADC.b #$00

.nonzero_a
#_1E89BA: LSR.b $07
#_1E89BC: BCC .keep_sign_a

#_1E89BE: EOR.b #$FF
#_1E89C0: INC A

.keep_sign_a
#_1E89C1: LDY.w $0FB5

#_1E89C4: STA.w $0B0D,Y

#_1E89C7: LDA.b $0C
#_1E89C9: STA.w WRMPYA

#_1E89CC: LDA.b $0F

#_1E89CE: LDY.b $0D
#_1E89D0: BNE .nonzero_b

#_1E89D2: STA.w WRMPYB

#_1E89D5: JSR NOP8

#_1E89D8: ASL.w RDMPYL
#_1E89DB: LDA.w RDMPYH
#_1E89DE: ADC.b #$00

.nonzero_b
#_1E89E0: LSR.b $09
#_1E89E2: BCC .keep_sign_b

#_1E89E4: EOR.b #$FF
#_1E89E6: INC A

.keep_sign_b
#_1E89E7: LDY.w $0FB5

#_1E89EA: SEC
#_1E89EB: SBC.b #$28
#_1E89ED: STA.w $0B1D,Y

#_1E89F0: INC.w $0FB5

#_1E89F3: LDA.w $0FB5
#_1E89F6: CMP.b #$10
#_1E89F8: BEQ SpriteDraw_HelmasaurKingTailSegment

#_1E89FA: JMP.w .next_segment

;===================================================================================================

SpriteDraw_HelmasaurKingTailSegment:
#_1E89FD: LDA.w $0EC0,X
#_1E8A00: STA.b $0A

#_1E8A02: STZ.b $0F

#_1E8A04: PHX

#_1E8A05: LDX.w $0B33
#_1E8A08: CPX.b #$10
#_1E8A0A: BEQ .skip

#_1E8A0C: LDY.b #$00

.next_segment
#_1E8A0E: LDA.b $00
#_1E8A10: CLC
#_1E8A11: ADC.w $0B0D,X
#_1E8A14: STA.b ($90),Y
#_1E8A16: STA.b $08

#_1E8A18: LDA.b $02
#_1E8A1A: CLC
#_1E8A1B: ADC.w $0B1D,X

#_1E8A1E: INY

#_1E8A1F: STA.b ($90),Y
#_1E8A21: STA.b $09

#_1E8A23: LDA.b #$AC

#_1E8A25: CPY.b #$01
#_1E8A27: BNE .not_the_tip

#_1E8A29: LDA.b #$E4

.not_the_tip
#_1E8A2B: INY

#_1E8A2C: STA.b ($90),Y

#_1E8A2E: LDA.b $05
#_1E8A30: EOR.b #$1B
#_1E8A32: INY
#_1E8A33: STA.b ($90),Y

#_1E8A35: INY

#_1E8A36: TXA
#_1E8A37: EOR.b $1A
#_1E8A39: AND.b #$00

#_1E8A3B: ORA.w $031F
#_1E8A3E: BNE .no_player_contact

#_1E8A40: LDA.b $0A
#_1E8A42: BEQ .no_player_contact

#_1E8A44: LDA.b $22
#_1E8A46: SBC.b $E2
#_1E8A48: SBC.b $08

#_1E8A4A: ADC.b #$0C
#_1E8A4C: CMP.b #$18
#_1E8A4E: BCS .no_player_contact

#_1E8A50: LDA.b $20
#_1E8A52: SBC.b $E8
#_1E8A54: ADC.b #$08

#_1E8A56: SBC.b $09
#_1E8A58: ADC.b #$08

#_1E8A5A: CMP.b #$10
#_1E8A5C: BCS .no_player_contact

#_1E8A5E: INC.b $0F

#_1E8A60: STZ.b $28

#_1E8A62: LDA.b #$38
#_1E8A64: STA.b $27

.no_player_contact
#_1E8A66: INX
#_1E8A67: CPX.b #$10
#_1E8A69: BNE .next_segment

.skip
#_1E8A6B: PLX

#_1E8A6C: LDA.b $0F
#_1E8A6E: BEQ .no_damage

#_1E8A70: LDA.w $0FFC
#_1E8A73: BNE .no_damage

#_1E8A75: JSL Sprite_AttemptDamageToLinkPlusRecoil_long

.no_damage
#_1E8A79: LDY.b #$02
#_1E8A7B: LDA.b #$0F
#_1E8A7D: JSL Sprite_CorrectOAMEntries_long

#_1E8A81: JSR Sprite_PrepOAMCoord_Bank1E

#_1E8A84: RTS

;===================================================================================================

NOP8:
#_1E8A85: NOP
#_1E8A86: NOP
#_1E8A87: NOP
#_1E8A88: NOP

#_1E8A89: NOP
#_1E8A8A: NOP
#_1E8A8B: NOP
#_1E8A8C: NOP

#_1E8A8D: RTS

;===================================================================================================

Sprite3A_MagicBatLightning:
#_1E8A8E: PHB
#_1E8A8F: PHK
#_1E8A90: PLB

#_1E8A91: JSR .main

#_1E8A94: PLB

#_1E8A95: RTL

;---------------------------------------------------------------------------------------------------

.main
#_1E8A96: LDA.w $0E80,X
#_1E8A99: AND.b #$10
#_1E8A9B: BEQ .in_front

#_1E8A9D: LDA.b #$04
#_1E8A9F: JSL SpriteDraw_AllocateOAMFromRegionB

.in_front
#_1E8AA3: JSL SpriteDraw_SingleSmall_long
#_1E8AA7: JSR Sprite_CheckIfActive_Bank1E

#_1E8AAA: LDA.w $0D80,X
#_1E8AAD: BNE .active

#_1E8AAF: JSR Sprite_Move_XY_Bank1E

#_1E8AB2: LDA.w $0DF0,X
#_1E8AB5: BNE .wait

#_1E8AB7: INC.w $0D80,X

.wait
#_1E8ABA: RTS

;---------------------------------------------------------------------------------------------------

.offset_x
#_1E8ABB: db 0, 4, 8, 12, 12, 4, 8, 0

.offset_y
#_1E8AC3: db 0, 4, 8, 12, 12, 4, 8, 0

;---------------------------------------------------------------------------------------------------

.active
#_1E8ACB: INC.w $0D80,X
#_1E8ACE: BNE .stayalive

#_1E8AD0: STZ.w $0DD0,X

.stayalive
#_1E8AD3: INC.w $0E80,X

#_1E8AD6: LDA.w $0E80,X
#_1E8AD9: PHA

#_1E8ADA: AND.b #$07
#_1E8ADC: BNE .no_sfx

#_1E8ADE: LDA.b #$30 ; SFX3.30
#_1E8AE0: STA.w $012F

.no_sfx
#_1E8AE3: PLA
#_1E8AE4: LSR A
#_1E8AE5: LSR A
#_1E8AE6: PHA

#_1E8AE7: AND.b #$07
#_1E8AE9: TAY

#_1E8AEA: LDA.b $22
#_1E8AEC: CLC
#_1E8AED: ADC.w .offset_x,Y
#_1E8AF0: STA.w $0D10,X

#_1E8AF3: LDA.b $23
#_1E8AF5: ADC.b #$00
#_1E8AF7: STA.w $0D30,X

#_1E8AFA: PLA
#_1E8AFB: LSR A
#_1E8AFC: LSR A
#_1E8AFD: AND.b #$07
#_1E8AFF: TAY

#_1E8B00: LDA.b $20
#_1E8B02: CLC
#_1E8B03: ADC.w .offset_y,Y
#_1E8B06: STA.w $0D00,X

#_1E8B09: LDA.b $21
#_1E8B0B: ADC.b #$00
#_1E8B0D: STA.w $0D20,X

#_1E8B10: RTS

;===================================================================================================

SpriteModule_Active_Bank1E:
#_1E8B11: PHB
#_1E8B12: PHK
#_1E8B13: PLB

#_1E8B14: JSR .main

#_1E8B17: PLB

#_1E8B18: RTL

;---------------------------------------------------------------------------------------------------

.main
#_1E8B19: LDA.w $0E20,X
#_1E8B1C: SEC
#_1E8B1D: SBC.b #$79

#_1E8B1F: REP #$30

#_1E8B21: AND.w #$00FF
#_1E8B24: ASL A
#_1E8B25: TAY

#_1E8B26: LDA.w .vectors,Y
#_1E8B29: DEC A
#_1E8B2A: PHA

#_1E8B2B: SEP #$30

#_1E8B2D: RTS

;===================================================================================================

#Sprite_CheckTileCollision_Bank1E:
#_1E8B2E: JSL Sprite_CheckTileCollision_long

#_1E8B32: RTS

;===================================================================================================

.vectors
#_1E8B33: dw Sprite_79_Bee
#_1E8B35: dw Sprite_7A_Agahnim
#_1E8B37: dw Sprite_7B_AgahnimBalls
#_1E8B39: dw Sprite_7C_GreenStalfos
#_1E8B3B: dw Sprite_7D_BigSpike
#_1E8B3D: dw Sprite_7E_Firebar_Clockwise
#_1E8B3F: dw Sprite_7F_Firebar_Counterclockwise
#_1E8B41: dw Sprite_80_Firesnake
#_1E8B43: dw Sprite_81_Hover
#_1E8B45: dw Sprite_82_AntifairyCircle
#_1E8B47: dw Sprite_83_GreenEyegore
#_1E8B49: dw Sprite_84_RedEyegore
#_1E8B4B: dw Sprite_85_YellowStalfos
#_1E8B4D: dw Sprite_86_Kodongo
#_1E8B4F: dw Sprite_87_KodongoFire
#_1E8B51: dw Sprite_88_Mothula
#_1E8B53: dw Sprite_89_MothulaBeam
#_1E8B55: dw Sprite_8A_SpikeBlock
#_1E8B57: dw Sprite_8B_Gibdo
#_1E8B59: dw Sprite_8C_Arrghus
#_1E8B5B: dw Sprite_8D_Arrghi
#_1E8B5D: dw Sprite_8E_Terrorpin
#_1E8B5F: dw Sprite_8F_Blob
#_1E8B61: dw Sprite_90_Wallmaster
#_1E8B63: dw Sprite_91_StalfosKnight
#_1E8B65: dw Sprite_92_HelmasaurKing
#_1E8B67: dw Sprite_93_Bumper
#_1E8B69: dw Sprite_94_Pirogusu
#_1E8B6B: dw Sprite_95_LaserEyeLeft
#_1E8B6D: dw Sprite_96_LaserEyeRight
#_1E8B6F: dw Sprite_97_LaserEyeTop
#_1E8B71: dw Sprite_98_LaserEyeBottom
#_1E8B73: dw Sprite_99_Pengator
#_1E8B75: dw Sprite_9A_Kyameron
#_1E8B77: dw Sprite_9B_Wizzrobe
#_1E8B79: dw Sprite_9C_Zoro
#_1E8B7B: dw Sprite_9D_Babasu
#_1E8B7D: dw Sprite_9E_HauntedGroveOstritch
#_1E8B7F: dw Sprite_9F_HauntedGroveRabbit
#_1E8B81: dw Sprite_A0_HauntedGroveBird
#_1E8B83: dw Sprite_A1_Freezor
#_1E8B85: dw Sprite_A2_Kholdstare
#_1E8B87: dw Sprite_A3_KholdstareShell
#_1E8B89: dw Sprite_A4_FallingIce
#_1E8B8B: dw Sprite_A5_BlueZazak
#_1E8B8D: dw Sprite_A6_RedZazak
#_1E8B8F: dw Sprite_A7_Stalfos
#_1E8B91: dw Sprite_A8_GreenZirro
#_1E8B93: dw Sprite_A9_BlueZirro
#_1E8B95: dw Sprite_AA_Pikit
#_1E8B97: dw Sprite_AB_CrystalMaiden
#_1E8B99: dw Sprite_AC_Apple
#_1E8B9B: dw Sprite_AD_OldMan
#_1E8B9D: dw Sprite_AE_Pipe_Down
#_1E8B9F: dw Sprite_AF_Pipe_Up
#_1E8BA1: dw Sprite_B0_Pipe_Right
#_1E8BA3: dw Sprite_B1_Pipe_Left
#_1E8BA5: dw Sprite_B2_PlayerBee
#_1E8BA7: dw Sprite_B3_PedestalPlaque
#_1E8BA9: dw Sprite_B4_PurpleChest
#_1E8BAB: dw Sprite_B5_BombShop
#_1E8BAD: dw Sprite_B6_Kiki
#_1E8BAF: dw Sprite_B7_BlindMaiden
#_1E8BB1: dw Sprite_B8_DialogueTester
#_1E8BB3: dw Sprite_B9_BullyAndPinkBall
#_1E8BB5: dw Sprite_BA_Whirlpool
#_1E8BB7: dw Sprite_BB_Shopkeeper
#_1E8BB9: dw Sprite_BC_Drunkard

;===================================================================================================

UNREACHABLE_1E8BBB:
#_1E8BBB: db $00, $00, $00, $00

;===================================================================================================

Sprite_AA_Pikit:
#_1E8BBF: JSR Pikit_PrepDraw
#_1E8BC2: JSR Sprite_CheckIfActive_Bank1E
#_1E8BC5: JSR Sprite_CheckIfRecoiling_Bank1E
#_1E8BC8: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1E8BCB: LDA.w $0D80,X
#_1E8BCE: JSL JumpTableLocal
#_1E8BD2: dw Pikit_PikNextMovement
#_1E8BD4: dw Pikit_LandAndAttack
#_1E8BD6: dw Pikit_Steal

;===================================================================================================

Sixteen_X:
#_1E8BD8: db  16, -16

Sixteen_Y:
#_1E8BDA: db   0,   0,  16, -16

;===================================================================================================

Pikit_PikNextMovement:
#_1E8BDE: LDA.w $0DF0,X
#_1E8BE1: BNE Pikit_Animate

#_1E8BE3: INC.w $0D80,X
#_1E8BE6: INC.w $0DB0,X

#_1E8BE9: LDA.w $0DB0,X
#_1E8BEC: CMP.b #$04
#_1E8BEE: BNE .random_direction

.target_link
#_1E8BF0: STZ.w $0DB0,X

#_1E8BF3: JSR Sprite_DirectionToFaceLink_Bank1E

#_1E8BF6: BRA .direction_continue

.random_direction
#_1E8BF8: JSL GetRandomNumber
#_1E8BFC: AND.b #$03
#_1E8BFE: TAY

.direction_continue
#_1E8BFF: LDA.w Sixteen_X,Y
#_1E8C02: STA.w $0D50,X

#_1E8C05: LDA.w Sixteen_Y,Y
#_1E8C08: STA.w $0D40,X

#_1E8C0B: JSL GetRandomNumber
#_1E8C0F: AND.b #$07
#_1E8C11: ADC.b #$13
#_1E8C13: STA.w $0F80,X

;===================================================================================================

Pikit_Animate:
#_1E8C16: INC.w $0E80,X

#_1E8C19: LDA.w $0E80,X

#_1E8C1C: LSR A
#_1E8C1D: LSR A
#_1E8C1E: LSR A

#_1E8C1F: AND.b #$01
#_1E8C21: STA.w $0DC0,X

#_1E8C24: RTS

;===================================================================================================

Pikit_LandAndAttack:
#_1E8C25: JSR Sprite_Move_XYZ_Bank1E
#_1E8C28: JSR Sprite_CheckTileCollision_Bank1E

#_1E8C2B: DEC.w $0F80,X
#_1E8C2E: DEC.w $0F80,X

#_1E8C31: LDA.w $0F70,X
#_1E8C34: BPL .airborne

#_1E8C36: STZ.w $0F70,X
#_1E8C39: STZ.w $0F80,X

#_1E8C3C: JSR Sprite_DirectionToFaceLink_Bank1E

#_1E8C3F: LDA.b $0E
#_1E8C41: CLC
#_1E8C42: ADC.b #$30
#_1E8C44: CMP.b #$60
#_1E8C46: BCS .dont_tongue_link

#_1E8C48: LDA.b $0F
#_1E8C4A: CLC
#_1E8C4B: ADC.b #$30
#_1E8C4D: CMP.b #$60
#_1E8C4F: BCS .dont_tongue_link

#_1E8C51: INC.w $0D80,X

#_1E8C54: LDA.b #$1F
#_1E8C56: JSL Sprite_ProjectSpeedTowardsLink_long
#_1E8C5A: JSL Sprite_ConvertVelocityToAngle

#_1E8C5E: LSR A
#_1E8C5F: STA.w $0DE0,X

#_1E8C62: LDA.b #$5F
#_1E8C64: STA.w $0DF0,X

#_1E8C67: RTS

;---------------------------------------------------------------------------------------------------

.dont_tongue_link
#_1E8C68: STZ.w $0D80,X

#_1E8C6B: LDA.b #$10
#_1E8C6D: STA.w $0DF0,X

.airborne
#_1E8C70: BRA Pikit_Animate

;===================================================================================================

pool Pikit_Steal

.anim
#_1E8C72: db $02, $02, $02, $02, $03, $03, $03, $03
#_1E8C7A: db $03, $03, $03, $03, $03, $03, $03, $03
#_1E8C82: db $03, $03, $03, $03, $02, $02, $02, $02

.pos
#_1E8C8A: db   0,   0,   0,   0,   0,   0,   0,   0
#_1E8C92: db   0,   0,   0,   0,   0,   0,   0,   0
#_1E8C9A: db   0,   0,   0,   0,   0,   0,   0,   0

#_1E8CA2: db   0,   0,   0,   0,   0,   0,   0,   0
#_1E8CAA: db  12,  16,  24,  32,  32,  24,  16,  12
#_1E8CB2: db   0,   0,   0,   0,   0,   0,   0,   0

#_1E8CBA: db   0,   0,   0,   0,   0,   0,   0,   0
#_1E8CC2: db -12, -16, -24, -32, -32, -24, -16, -12
#_1E8CCA: db   0,   0,   0,   0,   0,   0,   0,   0

.index_offset_x
#_1E8CD2: db $18, $18, $00, $30, $30, $30, $00, $18

.index_offset_y
#_1E8CDA: db $00, $18, $18, $18, $00, $30, $30, $30

pool off

;---------------------------------------------------------------------------------------------------

Pikit_Steal:
#_1E8CE2: LDA.w $0DF0,X
#_1E8CE5: BNE .lickylicky

#_1E8CE7: STZ.w $0D80,X

#_1E8CEA: LDA.b #$10
#_1E8CEC: STA.w $0DF0,X

#_1E8CEF: STZ.w $0D90,X
#_1E8CF2: STZ.w $0DA0,X
#_1E8CF5: STZ.w $0ED0,X

#_1E8CF8: RTS

;---------------------------------------------------------------------------------------------------

.lickylicky
#_1E8CF9: LSR A
#_1E8CFA: LSR A
#_1E8CFB: PHA

#_1E8CFC: TAY

#_1E8CFD: LDA.w .anim,Y
#_1E8D00: STA.w $0DC0,X

#_1E8D03: TYA

#_1E8D04: LDY.w $0DE0,X
#_1E8D07: PHY

#_1E8D08: CLC
#_1E8D09: ADC.w .index_offset_x,Y
#_1E8D0C: TAY

#_1E8D0D: LDA.w .pos,Y
#_1E8D10: STA.w $0D90,X

#_1E8D13: STA.b $04
#_1E8D15: STZ.b $05

#_1E8D17: BPL .positive_x

#_1E8D19: DEC.b $05

.positive_x
#_1E8D1B: PLY

#_1E8D1C: PLA
#_1E8D1D: CLC
#_1E8D1E: ADC.w .index_offset_y,Y

#_1E8D21: TAY
#_1E8D22: LDA.w .pos,Y

#_1E8D25: STA.w $0DA0,X

#_1E8D28: STA.b $06
#_1E8D2A: STZ.b $07
#_1E8D2C: STZ.b $07

#_1E8D2E: BPL .positive_y

#_1E8D30: DEC.b $07

.positive_y
#_1E8D32: LDA.w $0ED0,X
#_1E8D35: BNE .exit

#_1E8D37: REP #$20

#_1E8D39: LDA.w $0FD8
#_1E8D3C: CLC
#_1E8D3D: ADC.b $04

#_1E8D3F: SEC
#_1E8D40: SBC.b $22

#_1E8D42: CLC
#_1E8D43: ADC.w #$000C

#_1E8D46: CMP.w #$0018
#_1E8D49: BCS .exit

#_1E8D4B: LDA.w $0FDA
#_1E8D4E: CLC
#_1E8D4F: ADC.b $06

#_1E8D51: SEC
#_1E8D52: SBC.b $20

#_1E8D54: CLC
#_1E8D55: ADC.w #$000C

#_1E8D58: CMP.w #$0020
#_1E8D5B: BCS .exit

;---------------------------------------------------------------------------------------------------

#_1E8D5D: SEP #$20

#_1E8D5F: LDA.w $0DF0,X
#_1E8D62: CMP.b #$2E
#_1E8D64: BCS .exit

#_1E8D66: JSL Link_CalculateSFXPan
#_1E8D6A: ORA.b #$26 ; SFX2.26
#_1E8D6C: STA.w $012E

#_1E8D6F: JSL GetRandomNumber
#_1E8D73: AND.b #$03
#_1E8D75: INC A
#_1E8D76: STA.w $0ED0,X
#_1E8D79: STA.w $0E90,X

#_1E8D7C: CMP.b #$01
#_1E8D7E: BNE .dont_steal_bomb

#_1E8D80: LDA.l $7EF343
#_1E8D84: BEQ .dont_steal_anything

#_1E8D86: DEC A
#_1E8D87: STA.l $7EF343

#_1E8D8B: RTS

.dont_steal_anything
#_1E8D8C: SEP #$20

#_1E8D8E: STZ.w $0ED0,X

#_1E8D91: RTS

;---------------------------------------------------------------------------------------------------

.dont_steal_bomb
#_1E8D92: CMP.b #$02
#_1E8D94: BNE .dont_steal_arrow

#_1E8D96: LDA.l $7EF377
#_1E8D9A: BEQ .dont_steal_anything

#_1E8D9C: DEC A
#_1E8D9D: STA.l $7EF377

#_1E8DA1: RTS

;---------------------------------------------------------------------------------------------------

.dont_steal_arrow
#_1E8DA2: CMP.b #$03
#_1E8DA4: BNE .dont_steal_rupee

#_1E8DA6: REP #$20

#_1E8DA8: LDA.l $7EF360
#_1E8DAC: BEQ .dont_steal_anything

#_1E8DAE: DEC A
#_1E8DAF: STA.l $7EF360

.exit
#_1E8DB3: SEP #$20

#_1E8DB5: RTS

;---------------------------------------------------------------------------------------------------

.dont_steal_rupee
#_1E8DB6: LDA.l $7EF35A
#_1E8DBA: STA.w $0E30,X
#_1E8DBD: BEQ .dont_steal_anything

#_1E8DBF: CMP.b #$03
#_1E8DC1: BEQ .dont_steal_anything

#_1E8DC3: LDA.b #$00
#_1E8DC5: STA.l $7EF35A

#_1E8DC9: RTS

;===================================================================================================

Pikit_PrepDraw:
#_1E8DCA: JSR Sprite_PrepOAMCoord_Bank1E
#_1E8DCD: JSL SpriteDraw_Pikit

#_1E8DD1: RTS

;===================================================================================================

Sprite_A8_GreenZirro:
Sprite_A9_BlueZirro:
#_1E8DD2: LDA.b #$30
#_1E8DD4: STA.w $0B89,X

#_1E8DD7: LDA.w $0D90,X
#_1E8DDA: BEQ Zirro_Main

;===================================================================================================

Zirro_Bomb:
#_1E8DDC: LDA.w $0D80,X
#_1E8DDF: JSL JumpTableLocal
#_1E8DE3: dw ZirroBomb_Falling
#_1E8DE5: dw ZirroBomb_Exploding

;===================================================================================================

ZirroBomb_Falling:
#_1E8DE7: JSL SpriteDraw_SingleSmall_long
#_1E8DEB: JSR Sprite_CheckIfActive_Bank1E

#_1E8DEE: JSR Sprite_Move_XY_Bank1E
#_1E8DF1: JSR Sprite_Move_Z_Bank1E

#_1E8DF4: DEC.w $0F80,X
#_1E8DF7: DEC.w $0F80,X

#_1E8DFA: LDA.w $0F70,X
#_1E8DFD: BPL .exit

#_1E8DFF: STZ.w $0F70,X

#_1E8E02: INC.w $0D80,X

#_1E8E05: LDA.b #$13
#_1E8E07: STA.w $0DF0,X

#_1E8E0A: INC.w $0E40,X

#_1E8E0D: LDA.b #$0C ; SFX2.0C
#_1E8E0F: JSL SpriteSFX_QueueSFX2WithPan

.exit
#_1E8E13: RTS

;===================================================================================================

ZirroBomb_Exploding:
#_1E8E14: JSL SpriteDraw_ZirroBomb
#_1E8E18: JSR Sprite_CheckIfActive_Bank1E

#_1E8E1B: LDA.b $1A
#_1E8E1D: AND.b #$03
#_1E8E1F: BNE .frame_rule

#_1E8E21: INC.w $0DF0,X

.frame_rule
#_1E8E24: JSL Sprite_CheckDamageToLink_long

#_1E8E28: RTS

;===================================================================================================

pool Zirro_Main

.speed_z
#_1E8E29: db  1, -1

.max_z
#_1E8E2B: db  8, -8

.anim_step
#_1E8E2D: db $09, $0A, $08, $07

pool off

;---------------------------------------------------------------------------------------------------

Zirro_Main:
#_1E8E31: LDA.w $0E00,X
#_1E8E34: BEQ .not_focused

#_1E8E36: LDY.w $0DE0,X

#_1E8E39: LDA.w .anim_step,Y
#_1E8E3C: STA.w $0DC0,X

.not_focused
#_1E8E3F: LDA.w $0B89,X
#_1E8E42: ORA.b #$30
#_1E8E44: STA.w $0B89,X

#_1E8E47: JSL SpriteDraw_Zirro
#_1E8E4B: JSR Sprite_CheckIfActive_Bank1E
#_1E8E4E: JSR Sprite_CheckIfRecoiling_Bank1E

#_1E8E51: LDA.w $0E00,X
#_1E8E54: CMP.b #$08
#_1E8E56: BNE .no_bombing

#_1E8E58: JSR Zirro_DropBomb

.no_bombing
#_1E8E5B: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1E8E5E: LDA.b $1A
#_1E8E60: AND.b #$01
#_1E8E62: BNE .dont_adjust_z_speed

#_1E8E64: LDA.w $0ED0,X
#_1E8E67: AND.b #$01
#_1E8E69: TAY

#_1E8E6A: LDA.w $0F80,X
#_1E8E6D: CLC
#_1E8E6E: ADC.w .speed_z,Y
#_1E8E71: STA.w $0F80,X

#_1E8E74: CMP.w .max_z,Y
#_1E8E77: BNE .dont_adjust_z_speed

#_1E8E79: INC.w $0ED0,X

.dont_adjust_z_speed
#_1E8E7C: JSR Sprite_Move_Z_Bank1E
#_1E8E7F: JSR Sprite_DirectionToFaceLink_Bank1E

#_1E8E82: LDA.b $0E
#_1E8E84: CLC
#_1E8E85: ADC.b #$28
#_1E8E87: CMP.b #$50
#_1E8E89: BCS .dont_dodge

#_1E8E8B: LDA.b $0F
#_1E8E8D: CLC
#_1E8E8E: ADC.b #$28
#_1E8E90: CMP.b #$50
#_1E8E92: BCS .dont_dodge

#_1E8E94: LDA.b $44
#_1E8E96: CMP.b #$80
#_1E8E98: BEQ .dont_dodge

#_1E8E9A: LDA.w $0372
#_1E8E9D: BNE .dashing

#_1E8E9F: LDA.b $3C
#_1E8EA1: CMP.b #$09
#_1E8EA3: BPL .dont_dodge

.dashing
#_1E8EA5: LDA.b #$30
#_1E8EA7: JSL Sprite_ProjectSpeedTowardsLink_long

#_1E8EAB: LDA.b $01
#_1E8EAD: EOR.b #$FF
#_1E8EAF: INC A
#_1E8EB0: STA.w $0D50,X

#_1E8EB3: LDA.b $00
#_1E8EB5: EOR.b #$FF
#_1E8EB7: INC A
#_1E8EB8: STA.w $0D40,X

#_1E8EBB: LDA.b #$08
#_1E8EBD: STA.w $0DF0,X

#_1E8EC0: LDA.b #$02
#_1E8EC2: STA.w $0D80,X

.dont_dodge
#_1E8EC5: LDA.w $0D80,X
#_1E8EC8: JSL JumpTableLocal
#_1E8ECC: dw Zirro_Idle
#_1E8ECE: dw Zirro_Move
#_1E8ED0: dw Zirro_Dodge

;===================================================================================================

Zirro_Dodge:
#_1E8ED2: LDA.w $0DF0,X
#_1E8ED5: BNE .still_dodging

#_1E8ED7: STZ.w $0D80,X

.still_dodging
#_1E8EDA: INC.w $0E80,X
#_1E8EDD: INC.w $0E80,X

#_1E8EE0: JSR Zirro_HandleMovement

#_1E8EE3: RTS

;===================================================================================================

pool Zirro_Idle

.speed_x
#_1E8EE4: db  16,  12,   0, -12, -16, -12,   0,  12

.speed_y
#_1E8EEC: db   0,  12,  16,  12,   0, -12, -16, -12

.direction
#_1E8EF4: db $00, $04, $02, $06

pool off

;---------------------------------------------------------------------------------------------------

Zirro_Idle:
#_1E8EF8: LDA.w $0DF0,X
#_1E8EFB: BNE .delay

#_1E8EFD: INC.w $0D80,X
#_1E8F00: INC.w $0DA0,X

#_1E8F03: LDA.w $0DA0,X
#_1E8F06: CMP.b #$03
#_1E8F08: BNE .random_direction

#_1E8F0A: STZ.w $0DA0,X

#_1E8F0D: LDA.b #$30
#_1E8F0F: STA.w $0DF0,X

#_1E8F12: JSR Sprite_DirectionToFaceLink_Bank1E

#_1E8F15: LDA.w .direction,Y
#_1E8F18: BRA .use_direction

.random_direction
#_1E8F1A: JSL GetRandomNumber
#_1E8F1E: AND.b #$1F
#_1E8F20: ORA.b #$20
#_1E8F22: STA.w $0DF0,X

#_1E8F25: AND.b #$07

.use_direction
#_1E8F27: TAY

#_1E8F28: LDA.w .speed_x,Y
#_1E8F2B: STA.w $0D50,X

#_1E8F2E: LDA.w .speed_y,Y
#_1E8F31: STA.w $0D40,X

.delay
#_1E8F34: BRA Zirro_Animate

;===================================================================================================

Zirro_Move:
#_1E8F36: LDA.w $0DF0,X
#_1E8F39: BNE Zirro_HandleMovement

#_1E8F3B: STZ.w $0D80,X

#_1E8F3E: LDA.b #$0A
#_1E8F40: STA.w $0DF0,X

#_1E8F43: LDY.w $0E20,X
#_1E8F46: CPY.b #$A8 ; SPRITE A8
#_1E8F48: BNE .not_green

#_1E8F4A: LDA.b #$10
#_1E8F4C: STA.w $0E00,X

.not_green
#_1E8F4F: RTS

;===================================================================================================

Zirro_HandleMovement:
#_1E8F50: JSR Sprite_Move_XY_Bank1E

;===================================================================================================

Zirro_Animate:
#_1E8F53: JSR Sprite_DirectionToFaceLink_Bank1E
#_1E8F56: TYA
#_1E8F57: STA.w $0DE0,X

#_1E8F5A: INC.w $0E80,X

#_1E8F5D: LDA.w $0E80,X
#_1E8F60: LSR A
#_1E8F61: LSR A
#_1E8F62: LSR A
#_1E8F63: AND.b #$01
#_1E8F65: STA.b $00

#_1E8F67: LDA.w $0DE0,X
#_1E8F6A: ASL A
#_1E8F6B: ORA.b $00
#_1E8F6D: STA.w $0DC0,X

#_1E8F70: RTS

;===================================================================================================

pool Zirro_DropBomb

.offset_x_low
#_1E8F71: db  14,  -6,   4,   4

.offset_x_high
#_1E8F75: db   0,  -1,   0,   0

.offset_y_low
#_1E8F79: db   7,   7,  12,  -4

.offset_y_high
#_1E8F7D: db   0,   0,   0,  -1

pool off

;---------------------------------------------------------------------------------------------------

Zirro_DropBomb:
#_1E8F81: LDA.b #$A8 ; SPRITE A8
#_1E8F83: JSL Sprite_SpawnDynamically
#_1E8F87: BMI .exit

#_1E8F89: LDA.b #$20 ; SFX2.20
#_1E8F8B: JSL SpriteSFX_QueueSFX2WithPan

#_1E8F8F: LDA.b $04
#_1E8F91: STA.w $0F70,Y

#_1E8F94: PHX

#_1E8F95: LDX.w $0DE0,Y

#_1E8F98: LDA.b $00
#_1E8F9A: CLC
#_1E8F9B: ADC.w .offset_x_low,X
#_1E8F9E: STA.w $0D10,Y

#_1E8FA1: LDA.b $01
#_1E8FA3: ADC.w .offset_x_high,X
#_1E8FA6: STA.w $0D30,Y

#_1E8FA9: LDA.b $02
#_1E8FAB: CLC
#_1E8FAC: ADC.w .offset_y_low,X
#_1E8FAF: STA.w $0D00,Y

#_1E8FB2: LDA.b $03
#_1E8FB4: ADC.w .offset_y_high,X
#_1E8FB7: STA.w $0D20,Y

#_1E8FBA: LDA.w Sixteen_X,X
#_1E8FBD: STA.w $0D50,Y

#_1E8FC0: LDA.w Sixteen_Y,X
#_1E8FC3: STA.w $0D40,Y

#_1E8FC6: PLX

#_1E8FC7: LDA.b #$01
#_1E8FC9: STA.w $0D90,Y
#_1E8FCC: STA.w $0BA0,Y

#_1E8FCF: LDA.b #$09
#_1E8FD1: STA.w $0F60,Y

#_1E8FD4: LDA.b #$33
#_1E8FD6: STA.w $0E60,Y

#_1E8FD9: AND.b #$0F
#_1E8FDB: STA.w $0F50,Y

.exit
#_1E8FDE: RTS

;===================================================================================================

StalfosBone:
#_1E8FDF: JSR SpriteDraw_StalfosBone
#_1E8FE2: JSR Sprite_CheckIfActive_Bank1E
#_1E8FE5: JSR Sprite_CheckDamageToLink_Bank1E

#_1E8FE8: INC.w $0E80,X

#_1E8FEB: JSR Sprite_Move_XY_Bank1E

#_1E8FEE: LDA.w $0DF0,X
#_1E8FF1: BNE .exit

#_1E8FF3: JSR Sprite_CheckTileCollision_Bank1E
#_1E8FF6: BEQ .exit

#_1E8FF8: STZ.w $0DD0,X

#_1E8FFB: JSL Sprite_PlaceWeaponTink

.exit
#_1E8FFF: RTS

;===================================================================================================

pool SpriteDraw_StalfosBone

.oam_groups
#_1E9000: dw  -4,  -2 : db $2F, $80, $00, $00
#_1E9008: dw   4,   2 : db $2F, $40, $00, $00

#_1E9010: dw  -4,   2 : db $2F, $00, $00, $00
#_1E9018: dw   4,  -2 : db $2F, $C0, $00, $00

#_1E9020: dw   2,  -4 : db $3F, $40, $00, $00
#_1E9028: dw  -2,   4 : db $3F, $80, $00, $00

#_1E9030: dw  -2,  -4 : db $3F, $00, $00, $00
#_1E9038: dw   2,   4 : db $3F, $C0, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_StalfosBone:
#_1E9040: LDA.b #$00
#_1E9042: XBA
#_1E9043: LDA.w $0E80,X

#_1E9046: LSR A
#_1E9047: LSR A
#_1E9048: AND.b #$03

#_1E904A: REP #$20

#_1E904C: ASL A
#_1E904D: ASL A
#_1E904E: ASL A
#_1E904F: ASL A

#_1E9050: ADC.w #.oam_groups
#_1E9053: STA.b $08

#_1E9055: SEP #$20

#_1E9057: LDA.b #$02
#_1E9059: JMP.w SpriteDraw_Tabulated_Bank1E

;===================================================================================================

StalfosTimers:
#_1E905C: db 16, 32, 64, 32

StalfosDrawStepsA:
#_1E9060: db $06, $04, $00, $02, $07, $05, $01, $03

StalfosDrawStepsB:
#_1E9068: db $08, $09, $0A, $0B

;===================================================================================================

Sprite_A7_Stalfos:
#_1E906C: LDA.w $0D90,X
#_1E906F: BEQ Stalfos

#_1E9071: JMP.w StalfosBone

;===================================================================================================

Stalfos:
#_1E9074: LDA.w $0E90,X
#_1E9077: BEQ Stalfos_Skellington

;===================================================================================================

Stalfos_Invisible:
#_1E9079: LDA.w $0DF0,X
#_1E907C: BNE .wait_in_closet

#_1E907E: LDA.b #$01
#_1E9080: STA.w $0D50,X
#_1E9083: STA.w $0D40,X

#_1E9086: JSR Sprite_CheckTileCollision_Bank1E
#_1E9089: BEQ .no_collision

#_1E908B: STZ.w $0DD0,X

#_1E908E: RTS

;---------------------------------------------------------------------------------------------------

.no_collision
#_1E908F: STZ.w $0E90,X

#_1E9092: LDA.b #$15 ; SFX2.15
#_1E9094: JSL SpriteSFX_QueueSFX2WithPan

#_1E9098: JSL Sprite_SpawnPoofGarnish

#_1E909C: LDA.b #$08
#_1E909E: STA.w $0E10,X

#_1E90A1: LDA.b #$40
#_1E90A3: STA.w $0DF0,X

#_1E90A6: STZ.w $0D40,X
#_1E90A9: STZ.w $0D50,X

.wait_in_closet
#_1E90AC: JSL Sprite_PrepOAMCoord_long

#_1E90B0: RTS

;===================================================================================================

pool Stalfos_Skellington

.direction
#_1E90B1: db $03, $02, $01, $00

pool off

;---------------------------------------------------------------------------------------------------

Stalfos_Skellington:
#_1E90B5: LDA.w $0DD0,X
#_1E90B8: CMP.b #$09
#_1E90BA: BNE .dont_dodge

#_1E90BC: REP #$20

#_1E90BE: LDA.b $22
#_1E90C0: SEC
#_1E90C1: SBC.w $0FD8
#_1E90C4: CLC
#_1E90C5: ADC.w #$0028

#_1E90C8: CMP.w #$0050
#_1E90CB: BCS .dont_dodge

#_1E90CD: LDA.b $20
#_1E90CF: SEC
#_1E90D0: SBC.w $0FDA
#_1E90D3: CLC
#_1E90D4: ADC.w #$0030

#_1E90D7: CMP.w #$0050
#_1E90DA: BCS .dont_dodge

#_1E90DC: SEP #$20

#_1E90DE: LDA.b $44
#_1E90E0: CMP.b #$80
#_1E90E2: BEQ .dont_dodge

#_1E90E4: LDA.w $0F70,X
#_1E90E7: ORA.w $0F00,X
#_1E90EA: BNE .dont_dodge

#_1E90EC: LDA.b $EE
#_1E90EE: CMP.w $0F20,X
#_1E90F1: BNE .dont_dodge

#_1E90F3: JSR Sprite_DirectionToFaceLink_Bank1E
#_1E90F6: STY.b $00

#_1E90F8: LDA.w $0372
#_1E90FB: BNE .dodge

#_1E90FD: LDA.b $3C
#_1E90FF: CMP.b #$90
#_1E9101: BCS .face_link

#_1E9103: CMP.b #$09
#_1E9105: BPL .dont_dodge

.dodge
#_1E9107: LDA.b $2F
#_1E9109: LSR A
#_1E910A: TAY

#_1E910B: LDA.b $00
#_1E910D: CMP.w .direction,Y
#_1E9110: BEQ .dont_dodge

.face_link
#_1E9112: LDA.b $00
#_1E9114: STA.w $0DE0,X

#_1E9117: LDA.b #$20
#_1E9119: JSL Sprite_ProjectSpeedTowardsLink_long

#_1E911D: LDA.b $01
#_1E911F: EOR.b #$FF
#_1E9121: INC A
#_1E9122: STA.w $0D50,X

#_1E9125: LDA.b $00
#_1E9127: EOR.b #$FF
#_1E9129: INC A
#_1E912A: STA.w $0D40,X

#_1E912D: LDA.b #$20
#_1E912F: STA.w $0F80,X

#_1E9132: LDA.b #$13 ; SFX3.13
#_1E9134: JSL SpriteSFX_QueueSFX3WithPan

#_1E9138: INC.w $0F70,X

;---------------------------------------------------------------------------------------------------

.dont_dodge
#_1E913B: SEP #$20

#_1E913D: LDA.w $0F70,X
#_1E9140: BEQ Zazak_Main

#_1E9142: LDY.w $0DE0,X

#_1E9145: LDA.w StalfosDrawStepsB,Y
#_1E9148: STA.w $0DC0,X

#_1E914B: JSL SpriteDraw_Stalfos
#_1E914F: JSR Sprite_CheckIfActive_Bank1E

#_1E9152: LDA.w $0EA0,X
#_1E9155: BEQ .not_recoiling

#_1E9157: STZ.w $0F80,X

.not_recoiling
#_1E915A: JSR Sprite_CheckIfRecoiling_Bank1E
#_1E915D: JSR Sprite_CheckDamageToAndFromLink_Bank1E
#_1E9160: JSR Sprite_CheckTileCollision_Bank1E

#_1E9163: PHA

#_1E9164: AND.b #$03
#_1E9166: BEQ .no_horizontal_tile_collision

#_1E9168: STZ.w $0D50,X

.no_horizontal_tile_collision
#_1E916B: PLA
#_1E916C: AND.b #$0C
#_1E916E: BEQ .no_vertital_tile_collision

#_1E9170: STZ.w $0D40,X

.no_vertital_tile_collision
#_1E9173: JSR Sprite_Move_XYZ_Bank1E

#_1E9176: LDA.w $0F80,X
#_1E9179: SEC
#_1E917A: SBC.b #$02
#_1E917C: STA.w $0F80,X

#_1E917F: LDA.w $0F70,X
#_1E9182: DEC A
#_1E9183: BPL .exit

#_1E9185: STZ.w $0F70,X

#_1E9188: JSR Sprite_ZeroVelocity_XY_Bank1E

#_1E918B: LDA.b #$21 ; SFX2.21
#_1E918D: JSL SpriteSFX_QueueSFX2WithPan

#_1E9191: LDA.w $0E30,X
#_1E9194: BEQ .exit

#_1E9196: LDA.b #$10
#_1E9198: STA.w $0EE0,X

#_1E919B: STZ.w $0E80,X

.exit
#_1E919E: RTS

;===================================================================================================

Zazak_Main:
Sprite_A5_BlueZazak:
Sprite_A6_RedZazak:
#_1E919F: LDA.w $0DA0,X
#_1E91A2: BEQ TrueZazak

;===================================================================================================

ZazakPhlegm:
#_1E91A4: JSR SpriteDraw_Phlegm
#_1E91A7: JSR Sprite_CheckIfActive_Bank1E

#_1E91AA: LDA.b $1A
#_1E91AC: LSR A
#_1E91AD: AND.b #$01
#_1E91AF: STA.w $0DC0,X

#_1E91B2: JSR Sprite_CheckDamageToLink_Bank1E
#_1E91B5: JSR Sprite_Move_XY_Bank1E

#_1E91B8: JSR Sprite_CheckTileCollision_Bank1E
#_1E91BB: BEQ .exit

#_1E91BD: STZ.w $0DD0,X

#_1E91C0: JSL Sprite_PlaceWeaponTink_forced

.exit
#_1E91C4: RTS

;===================================================================================================

TrueZazak:
#_1E91C5: LDA.w $0EE0,X
#_1E91C8: BEQ .dont_toss_bone

#_1E91CA: PHA

#_1E91CB: STZ.w $0D80,X

#_1E91CE: LDA.b #$20
#_1E91D0: STA.w $0DF0,X

#_1E91D3: JSR Sprite_ZeroVelocity_XY_Bank1E
#_1E91D6: JSR Sprite_DirectionToFaceLink_Bank1E

#_1E91D9: TYA
#_1E91DA: STA.w $0EB0,X

#_1E91DD: PLA

.dont_toss_bone
#_1E91DE: CMP.b #$01
#_1E91E0: BNE .definitely_dont_toss_bone

#_1E91E2: JSR Stalfos_ThrowBone

#_1E91E5: LDA.b #$01
#_1E91E7: STA.w $0E80,X

.definitely_dont_toss_bone
#_1E91EA: LDA.w $0E80,X
#_1E91ED: AND.b #$01
#_1E91EF: ASL A
#_1E91F0: ASL A
#_1E91F1: ADC.w $0DE0,X
#_1E91F4: TAY

#_1E91F5: LDA.w StalfosDrawStepsA,Y
#_1E91F8: STA.w $0DC0,X

#_1E91FB: LDA.w $0E20,X
#_1E91FE: CMP.b #$A7 ; SPRITE A7
#_1E9200: BNE .draw_as_zazak

.draw_as_stalfos
#_1E9202: JSL SpriteDraw_Stalfos
#_1E9206: JSR Sprite_CheckIfActive_Bank1E
#_1E9209: BRA .draw_done

.draw_as_zazak
#_1E920B: JSL SpriteDraw_Zazak
#_1E920F: JSR Sprite_CheckIfActive_Bank1E

.draw_done
#_1E9212: JSR Sprite_CheckIfRecoiling_Bank1E
#_1E9215: JSR Sprite_CheckDamageToAndFromLink_Bank1E
#_1E9218: JSR Sprite_Move_XY_Bank1E
#_1E921B: JSR Sprite_CheckTileCollision_Bank1E

#_1E921E: LDA.w $0D80,X
#_1E9221: JSL JumpTableLocal
#_1E9225: dw StalfosZazak_Walk
#_1E9227: dw StalfosZazak_Wait
#_1E9229: dw StalfosZazak_Shoot

;===================================================================================================

StalfosZazak_Walk:
#_1E922B: LDA.w $0DF0,X
#_1E922E: BNE .exit

#_1E9230: JSL GetRandomNumber
#_1E9234: AND.b #$03
#_1E9236: TAY

#_1E9237: LDA.w StalfosTimers,Y
#_1E923A: STA.w $0DF0,X

#_1E923D: INC.w $0D80,X

#_1E9240: LDA.w $0EB0,X
#_1E9243: STA.w $0DE0,X

#_1E9246: TAY

#_1E9247: LDA.w Sixteen_X,Y
#_1E924A: STA.w $0D50,X

#_1E924D: LDA.w Sixteen_Y,Y
#_1E9250: STA.w $0D40,X

.exit
#_1E9253: RTS

;===================================================================================================

SharedDirections_Nice:
#_1E9254: db $02, $03, $02, $03, $00, $01, $00, $01

;===================================================================================================

StalfosZazak_Wait:
#_1E925C: LDA.b #$10

#_1E925E: LDY.w $0E70,X
#_1E9261: BNE .new_direction

#_1E9263: LDA.w $0DF0,X
#_1E9266: BNE .delay

#_1E9268: LDA.w $0E20,X
#_1E926B: CMP.b #$A6 ; SPRITE A6
#_1E926D: BNE .dont_shoot

#_1E926F: JSR Sprite_DirectionToFaceLink_Bank1E
#_1E9272: TYA
#_1E9273: CMP.w $0DE0,X
#_1E9276: BNE .dont_shoot

#_1E9278: LDA.b $EE
#_1E927A: CMP.w $0F20,X
#_1E927D: BNE .dont_shoot

#_1E927F: INC.w $0D80,X

#_1E9282: LDA.b #$30
#_1E9284: STA.w $0DF0,X
#_1E9287: STA.w $0E00,X

#_1E928A: BRA Sprite_ZeroVelocity_XY_Bank1E

.dont_shoot
#_1E928C: LDA.b #$20

.new_direction
#_1E928E: STA.w $0DF0,X

#_1E9291: JSL GetRandomNumber
#_1E9295: LSR A
#_1E9296: LDA.w $0DE0,X
#_1E9299: ROL A
#_1E929A: TAY

#_1E929B: LDA.w SharedDirections_Nice,Y
#_1E929E: STA.w $0EB0,X

#_1E92A1: STZ.w $0D80,X

#_1E92A4: INC.w $0DB0,X

#_1E92A7: LDA.w $0DB0,X
#_1E92AA: CMP.b #$04
#_1E92AC: BNE Sprite_ZeroVelocity_XY_Bank1E

#_1E92AE: STZ.w $0DB0,X

#_1E92B1: JSR Sprite_DirectionToFaceLink_Bank1E
#_1E92B4: TYA
#_1E92B5: STA.w $0EB0,X

#_1E92B8: LDA.b #$18
#_1E92BA: STA.w $0DF0,X

;---------------------------------------------------------------------------------------------------

#Sprite_ZeroVelocity_XY_Bank1E:
#_1E92BD: STZ.w $0D50,X
#_1E92C0: STZ.w $0D40,X

#_1E92C3: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_1E92C4: DEC.w $0ED0,X
#_1E92C7: BPL .exit

#_1E92C9: LDA.b #$0B
#_1E92CB: STA.w $0ED0,X

#_1E92CE: INC.w $0E80,X

.exit
#_1E92D1: RTS

;===================================================================================================

StalfosZazak_Shoot:
#_1E92D2: LDA.w $0DF0,X
#_1E92D5: BNE .wait

#_1E92D7: STZ.w $0D80,X

#_1E92DA: RTS

.wait
#_1E92DB: CMP.b #$18
#_1E92DD: BNE .wait_some_more

#_1E92DF: JSL Sprite_SpawnFirePhlegm

.wait_some_more
#_1E92E3: RTS

;===================================================================================================

Sprite_SpawnFirePhlegm:
#_1E92E4: PHB
#_1E92E5: PHK
#_1E92E6: PLB

#_1E92E7: LDA.b #$A5 ; SPRITE A5
#_1E92E9: JSL Sprite_SpawnDynamically
#_1E92ED: BMI .no_space

#_1E92EF: LDA.b #$05 ; SFX3.05
#_1E92F1: JSL SpriteSFX_QueueSFX3WithPan
#_1E92F5: JSL Sprite_SetSpawnedCoordinates

#_1E92F9: PHX

#_1E92FA: LDA.w $0DE0,X
#_1E92FD: TAX

#_1E92FE: LDA.b $00
#_1E9300: CLC
#_1E9301: ADC.w .offset_x_low,X
#_1E9304: STA.w $0D10,Y

#_1E9307: LDA.b $01
#_1E9309: ADC.w .offset_x_high,X
#_1E930C: STA.w $0D30,Y

#_1E930F: LDA.b $02
#_1E9311: CLC
#_1E9312: ADC.w .offset_y_low,X
#_1E9315: STA.w $0D00,Y

#_1E9318: LDA.b $03
#_1E931A: ADC.w .offset_y_high,X
#_1E931D: STA.w $0D20,Y

#_1E9320: LDA.w .speed_x,X
#_1E9323: STA.w $0D50,Y

#_1E9326: LDA.w .speed_y,X
#_1E9329: STA.w $0D40,Y

#_1E932C: LDA.w $0E60,Y
#_1E932F: ORA.b #$40
#_1E9331: STA.w $0E60,Y

#_1E9334: LDA.b #$40
#_1E9336: STA.w $0CAA,Y

#_1E9339: LDA.b #$21
#_1E933B: STA.w $0E40,Y
#_1E933E: STA.w $0DA0,Y

#_1E9341: LDA.b #$02
#_1E9343: STA.w $0F50,Y

#_1E9346: LDA.b #$14
#_1E9348: STA.w $0F60,Y
#_1E934B: STA.w $0BA0,Y

#_1E934E: LDA.b #$25
#_1E9350: STA.w $0CD2,Y

#_1E9353: LDA.l $7EF35A
#_1E9357: CMP.b #$03
#_1E9359: BCC .not_blockable

#_1E935B: LDA.b #$20
#_1E935D: STA.w $0BE0,Y

.not_blockable
#_1E9360: PLX

.no_space
#_1E9361: PLB

#_1E9362: RTL

;---------------------------------------------------------------------------------------------------

.speed_x ; bleeds into next
#_1E9363: db  48, -48

.speed_y
#_1E9365: db   0,   0,  48, -48

.offset_x_low
#_1E9369: db  16,  -8,   4,   4

.offset_x_high
#_1E936D: db   0,  -1,   0,   0

.offset_y_low
#_1E9371: db  -2,  -2,   8, -20

.offset_y_high
#_1E9375: db  -1,  -1,   0,  -1

;===================================================================================================

Stalfos_ThrowBone:
#_1E9379: LDA.b #$A7 ; SPRITE A7
#_1E937B: JSL Sprite_SpawnDynamically
#_1E937F: BMI .exit

#_1E9381: LDA.b #$01
#_1E9383: STA.w $0D90,Y

#_1E9386: JSL Sprite_SetSpawnedCoordinates

#_1E938A: PHX
#_1E938B: TYX

#_1E938C: LDA.b #$20
#_1E938E: JSL Sprite_ApplySpeedTowardsLink_long

#_1E9392: LDA.b #$21
#_1E9394: STA.w $0E40,X
#_1E9397: STA.w $0BA0,X

#_1E939A: LDA.w $0E60,X
#_1E939D: ORA.b #$40
#_1E939F: STA.w $0E60,X

#_1E93A2: LDA.b #$48
#_1E93A4: STA.w $0CAA,X

#_1E93A7: LDA.b #$10
#_1E93A9: STA.w $0DF0,X

#_1E93AC: LDA.b #$14
#_1E93AE: STA.w $0F60,X

#_1E93B1: LDA.b #$07
#_1E93B3: STA.w $0F50,X

#_1E93B6: LDA.b #$20
#_1E93B8: STA.w $0CD2,X

#_1E93BB: PLX

#_1E93BC: LDA.b #$02 ; SFX2.02
#_1E93BE: JSL SpriteSFX_QueueSFX2WithPan

.exit
#_1E93C2: RTS

;===================================================================================================

pool SpriteDraw_Phlegm

.oam_groups
#_1E93C3: dw   0,   0 : db $C3, $00, $00, $00
#_1E93CB: dw  -8,   0 : db $C2, $00, $00, $00

#_1E93D3: dw   0,   0 : db $C3, $80, $00, $00
#_1E93DB: dw  -8,   0 : db $C2, $80, $00, $00

#_1E93E3: dw   0,   0 : db $C3, $40, $00, $00
#_1E93EB: dw   8,   0 : db $C2, $40, $00, $00

#_1E93F3: dw   0,   0 : db $C3, $C0, $00, $00
#_1E93FB: dw   8,   0 : db $C2, $C0, $00, $00

#_1E9403: dw   0,   0 : db $D4, $00, $00, $00
#_1E940B: dw   0,  -8 : db $D3, $00, $00, $00

#_1E9413: dw   0,   0 : db $D4, $40, $00, $00
#_1E941B: dw   0,  -8 : db $D3, $40, $00, $00

#_1E9423: dw   0,   0 : db $D4, $80, $00, $00
#_1E942B: dw   0,   8 : db $D3, $80, $00, $00

#_1E9433: dw   0,   0 : db $D4, $C0, $00, $00
#_1E943B: dw   0,   8 : db $D3, $C0, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Phlegm:
#_1E9443: LDA.b #$00
#_1E9445: XBA
#_1E9446: LDA.w $0DE0,X

#_1E9449: ASL A
#_1E944A: CLC
#_1E944B: ADC.w $0DC0,X

#_1E944E: REP #$20

#_1E9450: ASL A
#_1E9451: ASL A
#_1E9452: ASL A
#_1E9453: ASL A
#_1E9454: ADC.w #.oam_groups
#_1E9457: STA.b $08

#_1E9459: SEP #$20

#_1E945B: LDA.b #$02
#_1E945D: JMP.w SpriteDraw_Tabulated_Bank1E

;===================================================================================================

Sprite_A3_KholdstareShell:
#_1E9460: JSR Sprite_CheckIfActivePermissive_Bank1E
#_1E9463: JSR Sprite_DirectionToFaceLink_Bank1E

#_1E9466: LDA.b $0F
#_1E9468: CLC
#_1E9469: ADC.b #$20
#_1E946B: CMP.b #$40
#_1E946D: BCS .link_not_close

#_1E946F: LDA.b $0E
#_1E9471: CLC
#_1E9472: ADC.b #$20
#_1E9474: CMP.b #$40
#_1E9476: BCS .link_not_close

#_1E9478: JSL Sprite_CancelHookshot
#_1E947C: JSL Sprite_RepelDash_long

.link_not_close
#_1E9480: JSL Sprite_CheckDamageFromLink_long

#_1E9484: LDA.w $0D80,X
#_1E9487: BNE .phase_out

#_1E9489: LDA.w $0DD0,X
#_1E948C: CMP.b #$06
#_1E948E: BNE .shake

#_1E9490: LDA.b #$C0
#_1E9492: STA.w $0E60,X

#_1E9495: INC.w $0D80,X

#_1E9498: LDA.b #$09
#_1E949A: STA.w $0DD0,X

#_1E949D: RTS

;---------------------------------------------------------------------------------------------------

.offset_x
#_1E949E: db  1, -1

.offset_y
#_1E94A0: db  0, -1

;---------------------------------------------------------------------------------------------------

.shake
#_1E94A2: LDA.w $0EF0,X
#_1E94A5: BEQ .not_recoiling

#_1E94A7: AND.b #$02
#_1E94A9: LSR A
#_1E94AA: TAY

#_1E94AB: LDA.w .offset_x,Y
#_1E94AE: STA.w $0422

#_1E94B1: LDA.w .offset_y,Y
#_1E94B4: STA.w $0423

#_1E94B7: LDA.b #$01
#_1E94B9: STA.w $0428

#_1E94BC: RTS

.not_recoiling
#_1E94BD: STZ.w $0428

#_1E94C0: RTS

;---------------------------------------------------------------------------------------------------

.phase_out
#_1E94C1: INC.w $0D80,X
#_1E94C4: CMP.b #$12
#_1E94C6: BEQ .activate_khold

#_1E94C8: PHX
#_1E94C9: JSL PaletteFilter_KholdstareShell
#_1E94CD: PLX

#_1E94CE: RTS

.activate_khold
#_1E94CF: STZ.w $0DD0,X

#_1E94D2: LDA.b #$02
#_1E94D4: STA.w $0D82

#_1E94D7: LDA.b #$80
#_1E94D9: STA.w $0DF2

#_1E94DC: RTS

;===================================================================================================

GenerateIceball:
#_1E94DD: INC.w $0E80,X

#_1E94E0: LDA.w $0E80,X
#_1E94E3: AND.b #$7F
#_1E94E5: ORA.w $0E00,X
#_1E94E8: BNE .exit

#_1E94EA: LDA.b #$A4 ; SPRITE A4
#_1E94EC: JSL Sprite_SpawnDynamically
#_1E94F0: BMI .exit

#_1E94F2: LDA.b $22
#_1E94F4: STA.w $0D10,Y

#_1E94F7: LDA.b $23
#_1E94F9: STA.w $0D30,Y

#_1E94FC: LDA.b $20
#_1E94FE: STA.w $0D00,Y

#_1E9501: LDA.b $21
#_1E9503: STA.w $0D20,Y

#_1E9506: LDA.b #$E0
#_1E9508: STA.w $0F70,Y
#_1E950B: STA.w $0DB0,Y

#_1E950E: PHX
#_1E950F: TYX

#_1E9510: LDA.b #$20 ; SFX2.20
#_1E9512: JSL SpriteSFX_QueueSFX2WithPan

#_1E9516: PLX

.exit
#_1E9517: RTS

;===================================================================================================

Sprite_A2_Kholdstare:
#_1E9518: JSL SpriteDraw_Kholdstare
#_1E951C: JSR Sprite_CheckIfActive_Bank1E

#_1E951F: LDA.w $0D80,X
#_1E9522: CMP.b #$02
#_1E9524: BCS .no_garnish

#_1E9526: JSR Kholdstare_SpawnPuffCloudGarnish

#_1E9529: LDA.b $1A
#_1E952B: AND.b #$07
#_1E952D: BNE .no_garnish

#_1E952F: LDA.b #$02 ; SFX2.02
#_1E9531: STA.w $012E

.no_garnish
#_1E9534: JSR Sprite_CheckIfRecoiling_Bank1E

#_1E9537: DEC.w $0E80,X
#_1E953A: BPL .delay_anim

#_1E953C: LDA.b #$0A
#_1E953E: STA.w $0E80,X

#_1E9541: LDA.w $0DC0,X
#_1E9544: INC A
#_1E9545: AND.b #$03
#_1E9547: STA.w $0DC0,X

.delay_anim
#_1E954A: LDA.b $1A
#_1E954C: AND.b #$03
#_1E954E: BNE .dont_turn_eye

#_1E9550: LDA.b #$1F
#_1E9552: JSL Sprite_ProjectSpeedTowardsLink_long
#_1E9556: JSL Sprite_ConvertVelocityToAngle
#_1E955A: STA.w $0D90,X

.dont_turn_eye
#_1E955D: JSR Sprite_Move_XY_Bank1E

#_1E9560: LDA.w $0D80,X
#_1E9563: JSL JumpTableLocal
#_1E9567: dw Kholdstare_Accelerate
#_1E9569: dw Kholdstare_Decelerate
#_1E956B: dw Kholdstare_Split
#_1E956D: dw Kholdstare_DoAbsolutelyNothing

;===================================================================================================

Kholdstare_Accelerate:
#_1E956F: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1E9572: LDA.w $0DF0,X
#_1E9575: BNE .delay

#_1E9577: INC.w $0D80,X

#_1E957A: JSL GetRandomNumber
#_1E957E: AND.b #$3F
#_1E9580: ADC.b #$20
#_1E9582: STA.w $0DF0,X

#_1E9585: RTS

.delay
#_1E9586: LDA.w $0D50,X
#_1E9589: CMP.w $0F80,X
#_1E958C: BEQ .x_done
#_1E958E: BPL .x_too_high

.x_t00_low
#_1E9590: INC.w $0D50,X
#_1E9593: BRA .x_done

.x_too_high
#_1E9595: DEC.w $0D50,X

.x_done
#_1E9598: LDA.w $0D40,X
#_1E959B: CMP.w $0F90,X
#_1E959E: BEQ .y_done
#_1E95A0: BPL .y_too_high

.y_too_low
#_1E95A2: INC.w $0D40,X
#_1E95A5: BRA .y_done

.y_too_high
#_1E95A7: DEC.w $0D40,X

.y_done

;===================================================================================================

Kholdstare_CheckTileCollision:
#_1E95AA: JSR Sprite_CheckTileCollision_Bank1E
#_1E95AD: AND.b #$03
#_1E95AF: BEQ .no_collision

#_1E95B1: LDA.w $0D50,X
#_1E95B4: EOR.b #$FF
#_1E95B6: INC A
#_1E95B7: STA.w $0D50,X

#_1E95BA: LDA.w $0F80,X
#_1E95BD: EOR.b #$FF
#_1E95BF: INC A
#_1E95C0: STA.w $0F80,X

.no_collision
#_1E95C3: LDA.w $0E70,X
#_1E95C6: AND.b #$0C
#_1E95C8: BEQ .exit

#_1E95CA: LDA.w $0D40,X
#_1E95CD: EOR.b #$FF
#_1E95CF: INC A
#_1E95D0: STA.w $0D40,X

#_1E95D3: LDA.w $0F90,X
#_1E95D6: EOR.b #$FF
#_1E95D8: INC A
#_1E95D9: STA.w $0F90,X

.exit
#_1E95DC: RTS

;===================================================================================================

pool Kholdstare_Decelerate

.limit_x
#_1E95DD: db  16,  16, -16, -16

.limit_y
#_1E95E1: db -16,  16,  16, -16

pool off

;---------------------------------------------------------------------------------------------------

Kholdstare_Decelerate:
#_1E95E5: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1E95E8: LDA.w $0DF0,X
#_1E95EB: BNE .delay

#_1E95ED: STZ.w $0D80,X

#_1E95F0: JSL GetRandomNumber
#_1E95F4: AND.b #$3F

#_1E95F6: ADC.b #$60
#_1E95F8: STA.w $0DF0,X

#_1E95FB: JSL GetRandomNumber
#_1E95FF: PHA

#_1E9600: AND.b #$03
#_1E9602: TAY

#_1E9603: LDA.w .limit_x,Y
#_1E9606: STA.w $0F80,X

#_1E9609: LDA.w .limit_y,Y
#_1E960C: STA.w $0F90,X

#_1E960F: PLA
#_1E9610: AND.b #$1C
#_1E9612: BNE .use_random_direction

#_1E9614: LDA.b #$18
#_1E9616: JSL Sprite_ProjectSpeedTowardsLink_long

#_1E961A: LDA.b $00
#_1E961C: STA.w $0F90,X

#_1E961F: LDA.b $01
#_1E9621: STA.w $0F80,X

.use_random_direction
#_1E9624: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_1E9625: LDA.w $0D50,X
#_1E9628: BEQ .x_done
#_1E962A: BPL .x_too_high

#_1E962C: INC.w $0D50,X
#_1E962F: BRA .x_done

.x_too_high
#_1E9631: DEC.w $0D50,X

.x_done
#_1E9634: LDA.w $0D40,X
#_1E9637: BEQ .y_done
#_1E9639: BPL .y_too_high

#_1E963B: INC.w $0D40,X
#_1E963E: BRA .y_done

.y_too_high
#_1E9640: DEC.w $0D40,X

.y_done
#_1E9643: JMP.w Kholdstare_CheckTileCollision

;===================================================================================================

pool Kholdstare_Split

.target_speed_x
#_1E9646: db  32, -32,   0

.target_speed_y
#_1E9649: db -32, -32,  48

pool off

;---------------------------------------------------------------------------------------------------

Kholdstare_Split:
#_1E964C: LDA.w $0DF0,X
#_1E964F: CMP.b #$01
#_1E9651: BNE .exit

#_1E9653: STZ.w $0DD0,X
#_1E9656: STZ.w $0DD1,X
#_1E9659: STZ.w $0DD2,X

#_1E965C: LDA.b #$02
#_1E965E: STA.w $0FB5

.next_scoop
#_1E9661: LDA.b #$A2 ; SPRITE A2
#_1E9663: LDY.b #$04
#_1E9665: JSL Sprite_SpawnDynamically_slot_limited
#_1E9669: BMI .exit

#_1E966B: JSL Sprite_SetSpawnedCoordinates

#_1E966F: PHX

#_1E9670: LDX.w $0FB5

#_1E9673: LDA.w .target_speed_x,X
#_1E9676: STA.w $0F80,Y

#_1E9679: LDA.w .target_speed_y,X
#_1E967C: STA.w $0F90,Y

#_1E967F: LDA.b #$20
#_1E9681: STA.w $0DF0,Y

#_1E9684: PLX

#_1E9685: DEC.w $0FB5
#_1E9688: BPL .next_scoop

#_1E968A: RTS

.exit
#_1E968B: LDA.w $0EF0,X
#_1E968E: ORA.b #$E0
#_1E9690: STA.w $0EF0,X

#_1E9693: RTS

;===================================================================================================

Kholdstare_DoAbsolutelyNothing:
#_1E9694: RTS

;===================================================================================================

pool Kholdstare_SpawnPuffCloudGarnish

.offset_low
#_1E9695: db  -8, -6, -4, -2,  0,  2,  4,  6

.offset_high
#_1E969D: db  -1, -1, -1, -1,  0,  0,  0,  0

pool off

;---------------------------------------------------------------------------------------------------

Kholdstare_SpawnPuffCloudGarnish:
#_1E96A5: TXA
#_1E96A6: EOR.b $1A
#_1E96A8: AND.b #$03
#_1E96AA: BNE .exit

#_1E96AC: PHX

#_1E96AD: LDX.b #$0E

.next
#_1E96AF: LDA.l $7FF800,X
#_1E96B3: BEQ .open_slot

#_1E96B5: DEX
#_1E96B6: BPL .next

#_1E96B8: PLX

#_1E96B9: RTS

;---------------------------------------------------------------------------------------------------

.open_slot
#_1E96BA: LDA.b #$07 ; GARNISH 07
#_1E96BC: STA.l $7FF800,X
#_1E96C0: STA.w $0FB4

#_1E96C3: LDA.b #$1F
#_1E96C5: STA.l $7FF90E,X

#_1E96C9: JSL GetRandomNumber
#_1E96CD: AND.b #$07
#_1E96CF: TAY

#_1E96D0: LDA.w $0FD8
#_1E96D3: CLC
#_1E96D4: ADC.w .offset_low,Y
#_1E96D7: STA.l $7FF83C,X

#_1E96DB: LDA.w $0FD9
#_1E96DE: ADC.w .offset_high,Y
#_1E96E1: STA.l $7FF878,X

#_1E96E5: JSL GetRandomNumber
#_1E96E9: AND.b #$07
#_1E96EB: TAY

#_1E96EC: LDA.w $0FDA
#_1E96EF: CLC
#_1E96F0: ADC.w .offset_low,Y

#_1E96F3: PHP

#_1E96F4: CLC
#_1E96F5: ADC.b #$10
#_1E96F7: STA.l $7FF81E,X

#_1E96FB: LDA.w $0FDB
#_1E96FE: ADC.b #$00

#_1E9700: PLP
#_1E9701: ADC.w .offset_high,Y
#_1E9704: STA.l $7FF85A,X

#_1E9708: LDA.b #$00
#_1E970A: STA.l $7FF968,X

#_1E970E: PLX

.exit
#_1E970F: RTS

;===================================================================================================

Sprite_A4_FallingIce:
#_1E9710: LDA.w $0DB0,X
#_1E9713: BNE FallingIce_IceBall

;===================================================================================================

FallingIce_IceBallGenerator:
#_1E9715: JSR Sprite_CheckIfActive_Bank1E

#_1E9718: LDA.w $0DD2
#_1E971B: CMP.b #$09
#_1E971D: BCS .active_kholdstare

#_1E971F: LDA.w $0DD3
#_1E9722: CMP.b #$09
#_1E9724: BCS .active_kholdstare

#_1E9726: LDA.w $0DD4
#_1E9729: CMP.b #$09
#_1E972B: BCS .active_kholdstare

#_1E972D: STZ.w $0DD0,X

.active_kholdstare
#_1E9730: JMP.w GenerateIceball

;===================================================================================================

FallingIce_IceBall:
#_1E9733: LDA.b #$01
#_1E9735: STA.w $0BA0,X

#_1E9738: LDA.b #$30
#_1E973A: STA.w $0B89,X

#_1E973D: JSL SpriteDraw_SingleLarge_long

#_1E9741: LDA.w $0D80,X
#_1E9744: BNE .ice_ball_piece

#_1E9746: LDA.w $0E60,X
#_1E9749: EOR.b #$10
#_1E974B: STA.w $0E60,X

.ice_ball_piece
#_1E974E: JSR Sprite_CheckIfActive_Bank1E

#_1E9751: LDA.w $0DF0,X
#_1E9754: BEQ .falling_as_ball

#_1E9756: CMP.b #$01
#_1E9758: BNE .stick_around

#_1E975A: STZ.w $0DD0,X

.stick_around
#_1E975D: LSR A
#_1E975E: LSR A
#_1E975F: LSR A

#_1E9760: INC A
#_1E9761: INC A

#_1E9762: STA.w $0DC0,X

#_1E9765: RTS

;---------------------------------------------------------------------------------------------------

.falling_as_ball
#_1E9766: JSR Sprite_Move_XY_Bank1E

#_1E9769: LDA.w $0D80,X
#_1E976C: BEQ .is_also_iceball

#_1E976E: JSR Sprite_CheckDamageToLink_Bank1E
#_1E9771: JSR Sprite_CheckTileCollision_Bank1E
#_1E9774: BNE .tile_collision

.is_also_iceball
#_1E9776: LDA.w $0F70,X
#_1E9779: PHA

#_1E977A: JSR Sprite_Move_Z_Bank1E

#_1E977D: LDA.w $0F80,X
#_1E9780: CMP.b #$C0
#_1E9782: BMI .at_max_speed

#_1E9784: SEC
#_1E9785: SBC.b #$03
#_1E9787: STA.w $0F80,X

.at_max_speed
#_1E978A: PLA
#_1E978B: EOR.w $0F70,X
#_1E978E: BPL .exit

#_1E9790: LDA.w $0F70,X
#_1E9793: BPL .exit

#_1E9795: STZ.w $0F70,X

#_1E9798: LDA.w $0D80,X
#_1E979B: BNE .tile_collision

#_1E979D: STZ.w $0DD0,X

#_1E97A0: JSR IceBall_Split

#_1E97A3: RTS

;---------------------------------------------------------------------------------------------------

.tile_collision
#_1E97A4: LDA.b #$0F
#_1E97A6: STA.w $0DF0,X

#_1E97A9: LDA.b #$04
#_1E97AB: STA.w $0F50,X

#_1E97AE: LDA.w $012E
#_1E97B1: BNE .exit

#_1E97B3: LDA.b #$1E ; SFX2.1E
#_1E97B5: JSL SpriteSFX_QueueSFX2WithPan

#_1E97B9: LDA.b #$03
#_1E97BB: STA.w $0DC0,X

.exit
#_1E97BE: RTS

;===================================================================================================

pool IceBall_Split

.speed_x
#_1E97BF: db   0,  32,   0, -32
#_1E97C3: db  24,  24, -24, -24

.speed_y
#_1E97C7: db -32,   0,  32,   0
#_1E97CB: db -24,  24, -24,  24

pool off

;---------------------------------------------------------------------------------------------------

IceBall_Split:
#_1E97CF: LDA.b #$1F ; SFX2.1F
#_1E97D1: JSL SpriteSFX_QueueSFX2WithPan

#_1E97D5: JSL GetRandomNumber
#_1E97D9: AND.b #$04
#_1E97DB: STA.b $0D

#_1E97DD: LDA.b #$03
#_1E97DF: STA.w $0FB5

.next_shard
#_1E97E2: LDA.b #$A4 ; SPRITE A4
#_1E97E4: JSL Sprite_SpawnDynamically
#_1E97E8: BMI .no_space

#_1E97EA: JSL Sprite_SetSpawnedCoordinates

#_1E97EE: LDA.b #$01
#_1E97F0: STA.w $0D80,Y
#_1E97F3: STA.w $0DC0,Y
#_1E97F6: STA.w $0DB0,Y

#_1E97F9: LDA.b #$20
#_1E97FB: STA.w $0F80,Y

#_1E97FE: PHX

#_1E97FF: LDA.w $0FB5
#_1E9802: ORA.b $0D
#_1E9804: TAX

#_1E9805: LDA.w .speed_x,X
#_1E9808: STA.w $0D50,Y

#_1E980B: LDA.w .speed_y,X
#_1E980E: STA.w $0D40,Y

#_1E9811: PLX

#_1E9812: LDA.b #$1C
#_1E9814: STA.w $0F60,Y

.no_space
#_1E9817: DEC.w $0FB5
#_1E981A: BPL .next_shard

#_1E981C: RTS

;===================================================================================================

Sprite_A1_Freezor:
#_1E981D: JSL SpriteDraw_Freezor

#_1E9821: LDA.w $0DD0,X
#_1E9824: CMP.b #$09
#_1E9826: BEQ .active_state

#_1E9828: LDA.b #$03
#_1E982A: STA.w $0D80,X

#_1E982D: LDA.b #$1F
#_1E982F: STA.w $0DF0,X
#_1E9832: STA.w $0BA0,X

#_1E9835: LDA.b #$09
#_1E9837: STA.w $0DD0,X
#_1E983A: STZ.w $0EF0,X

.active_state
#_1E983D: JSR Sprite_CheckIfActive_Bank1E

#_1E9840: LDA.w $0D80,X
#_1E9843: CMP.b #$03
#_1E9845: BEQ .ignore_recoil

#_1E9847: JSR Sprite_CheckIfRecoiling_Bank1E

.ignore_recoil
#_1E984A: LDA.w $0D80,X
#_1E984D: JSL JumpTableLocal
#_1E9851: dw Freezor_Dormant
#_1E9853: dw Freezor_Waking
#_1E9855: dw Freezor_Flailing
#_1E9857: dw Freezor_ImMelllltiiiinnnnggggg

;===================================================================================================

Freezor_Dormant:
#_1E9859: INC.w $0BA0,X

#_1E985C: JSR Sprite_IsRightOfLink_Bank1E

#_1E985F: LDA.b $0F
#_1E9861: CLC
#_1E9862: ADC.b #$10
#_1E9864: CMP.b #$20
#_1E9866: BCS .stay_asleep

#_1E9868: INC.w $0D80,X

#_1E986B: LDA.b #$20
#_1E986D: STA.w $0DF0,X

.stay_asleep
#_1E9870: RTS

;===================================================================================================

Freezor_Waking:
#_1E9871: LDA.w $0DF0,X
#_1E9874: STA.w $0BA0,X
#_1E9877: BNE .still_shaking

#_1E9879: INC.w $0D80,X

#_1E987C: LDA.w $0D10,X
#_1E987F: SEC
#_1E9880: SBC.b #$05
#_1E9882: STA.b $00

#_1E9884: LDA.w $0D30,X
#_1E9887: SBC.b #$00
#_1E9889: STA.b $01

#_1E988B: LDA.w $0D00,X
#_1E988E: STA.b $02

#_1E9890: LDA.w $0D20,X
#_1E9893: STA.b $03

#_1E9895: LDY.b #$08
#_1E9897: JSL Underworld_UpdateTilemapWithCommonTile

#_1E989B: LDA.b #$60
#_1E989D: STA.w $0E00,X

#_1E98A0: LDA.b #$02
#_1E98A2: STA.w $0DE0,X

#_1E98A5: LDA.b #$50
#_1E98A7: STA.w $0DF0,X

#_1E98AA: RTS

.still_shaking
#_1E98AB: AND.b #$01
#_1E98AD: TAY

#_1E98AE: LDA.w Sixteen_X,Y
#_1E98B1: STA.w $0D50,X

#_1E98B4: JSR Sprite_Move_X_Bank1E

#_1E98B7: RTS

;===================================================================================================

pool Freezor_Flailing

.speed_x
#_1E98B8: db   8,  -8 ; bleeds into next

.speed_y
#_1E98BA: db   0,   0,  18, -18

.anim_step
#_1E98BE: db   1,   2,   1,   3

.sparkle_offset_low
#_1E98C2: db  -4,  -2,   0,   2,   4,   6,   8,  10

.sparkle_offset_high
#_1E98CA: db  -1,  -1,   0,   0,   0,   0,   0,   0

pool off

;---------------------------------------------------------------------------------------------------

Freezor_Flailing:
#_1E98D2: JSR Sprite_CheckDamageToLink_Bank1E

#_1E98D5: JSL Sprite_CheckDamageFromLink_long
#_1E98D9: BCC .no_damage

#_1E98DB: STZ.w $0EF0,X

.no_damage
#_1E98DE: LDA.w $0E00,X
#_1E98E1: BEQ .dont_sparkle

#_1E98E3: TXA
#_1E98E4: EOR.b $1A
#_1E98E6: AND.b #$07
#_1E98E8: BNE .dont_sparkle

#_1E98EA: JSL GetRandomNumber
#_1E98EE: AND.b #$07
#_1E98F0: TAY

#_1E98F1: LDA.w .sparkle_offset_low,Y
#_1E98F4: STA.b $00

#_1E98F6: LDA.w .sparkle_offset_high,Y
#_1E98F9: STA.b $01

#_1E98FB: LDA.b #$FC
#_1E98FD: STA.b $02

#_1E98FF: LDA.b #$FF
#_1E9901: STA.b $03

#_1E9903: JSL GarnishSpawn_Sparkle

.dont_sparkle
#_1E9907: LDA.w $0DF0,X
#_1E990A: BNE .dont_turn

#_1E990C: JSR Sprite_DirectionToFaceLink_Bank1E
#_1E990F: TYA
#_1E9910: STA.w $0DE0,X

.dont_turn
#_1E9913: LDY.w $0DE0,X

#_1E9916: LDA.w .speed_x,Y
#_1E9919: STA.w $0D50,X

#_1E991C: LDA.w .speed_y,Y
#_1E991F: STA.w $0D40,X

#_1E9922: LDA.w $0E70,X
#_1E9925: AND.b #$0F
#_1E9927: BNE .tile_collision

#_1E9929: JSR Sprite_Move_XY_Bank1E

.tile_collision
#_1E992C: JSR Sprite_CheckTileCollision_Bank1E

#_1E992F: TXA
#_1E9930: EOR.b $1A

#_1E9932: LSR A
#_1E9933: LSR A

#_1E9934: AND.b #$03
#_1E9936: TAY

#_1E9937: LDA.w .anim_step,Y
#_1E993A: STA.w $0DC0,X

#_1E993D: RTS

;===================================================================================================

pool Freezor_ImMelllltiiiinnnnggggg

.draw_step
#_1E993E: db $06, $05, $04, $07

pool off

;---------------------------------------------------------------------------------------------------

Freezor_ImMelllltiiiinnnnggggg:
#_1E9942: LDA.w $0DF0,X
#_1E9945: BNE .delay

#_1E9947: PHA

#_1E9948: JSL Sprite_ManuallySetDeathFlagUW

#_1E994C: STZ.w $0DD0,X

#_1E994F: PLA

.delay
#_1E9950: LSR A
#_1E9951: LSR A
#_1E9952: LSR A
#_1E9953: TAY

#_1E9954: LDA.w .draw_step,Y
#_1E9957: STA.w $0DC0,X

#_1E995A: RTS

;===================================================================================================

Sprite_9E_HauntedGroveOstritch:
#_1E995B: JSR SpriteDraw_HauntedGroveOstritch
#_1E995E: JSR Sprite_CheckIfActive_Bank1E

#_1E9961: LDA.w $0D80,X
#_1E9964: JSL JumpTableLocal
#_1E9968: dw HauntedGroveOstritch_Idle
#_1E996A: dw HauntedGroveOstritch_Flee

;===================================================================================================

HauntedGroveOstritch_Idle:
#_1E996C: LDY.b #$00

#_1E996E: LDA.b $1A
#_1E9970: AND.b #$18
#_1E9972: BEQ .default_anim

#_1E9974: LDY.b #$03

.default_anim
#_1E9976: TYA
#_1E9977: STA.w $0DC0,X

#_1E997A: LDA.w $0FDD
#_1E997D: BEQ .dont_run

#_1E997F: INC.w $0D80,X

#_1E9982: LDA.b #$F8
#_1E9984: STA.w $0D40,X

#_1E9987: LDA.b #$F0
#_1E9989: STA.w $0D50,X

.dont_run
#_1E998C: RTS

;===================================================================================================

pool HauntedGroveOstritch_Flee

.anim_step
#_1E998D: db $00, $01, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

HauntedGroveOstritch_Flee:
#_1E9991: JSR Sprite_Move_XYZ_Bank1E

#_1E9994: DEC.w $0F80,X
#_1E9997: DEC.w $0F80,X

#_1E999A: LDA.w $0F70,X
#_1E999D: BPL .no_hop

#_1E999F: LDA.b #$20
#_1E99A1: STA.w $0F80,X

#_1E99A4: STZ.w $0F70,X
#_1E99A7: STZ.w $0E80,X
#_1E99AA: STZ.w $0D90,X

.no_hop
#_1E99AD: INC.w $0E80,X

#_1E99B0: LDA.w $0E80,X
#_1E99B3: AND.b #$07
#_1E99B5: BNE .skip_anim_stepping

#_1E99B7: LDA.w $0D90,X
#_1E99BA: CMP.b #$03
#_1E99BC: BEQ .skip_anim_stepping

#_1E99BE: INC.w $0D90,X

.skip_anim_stepping
#_1E99C1: LDY.w $0D90,X

#_1E99C4: LDA.w .anim_step,Y
#_1E99C7: STA.w $0DC0,X

#_1E99CA: RTS

;===================================================================================================

pool SpriteDraw_HauntedGroveOstritch

.oam_groups
#_1E99CB: dw  -4,  -8 : db $80, $00, $00, $02
#_1E99D3: dw   4,  -8 : db $81, $00, $00, $02
#_1E99DB: dw  -4,   8 : db $A3, $00, $00, $02
#_1E99E3: dw   4,   8 : db $A4, $00, $00, $02

#_1E99EB: dw  -4,  -8 : db $80, $00, $00, $02
#_1E99F3: dw   4,  -8 : db $81, $00, $00, $02
#_1E99FB: dw  -4,   8 : db $A0, $00, $00, $02
#_1E9A03: dw   4,   8 : db $A1, $00, $00, $02

#_1E9A0B: dw  -4,  -8 : db $80, $00, $00, $02
#_1E9A13: dw   4,  -8 : db $81, $00, $00, $02
#_1E9A1B: dw  -4,   8 : db $83, $00, $00, $02
#_1E9A23: dw   4,   8 : db $84, $00, $00, $02

#_1E9A2B: dw  -4,  -7 : db $80, $00, $00, $02
#_1E9A33: dw   4,  -7 : db $81, $00, $00, $02
#_1E9A3B: dw  -4,   9 : db $A3, $00, $00, $02
#_1E9A43: dw   4,   9 : db $A4, $00, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_HauntedGroveOstritch:
#_1E9A4B: LDA.b #$00
#_1E9A4D: XBA
#_1E9A4E: LDA.w $0DC0,X

#_1E9A51: REP #$20

#_1E9A53: ASL A
#_1E9A54: ASL A
#_1E9A55: ASL A
#_1E9A56: ASL A
#_1E9A57: ASL A

#_1E9A58: ADC.w #.oam_groups
#_1E9A5B: STA.b $08

#_1E9A5D: SEP #$20

#_1E9A5F: LDA.b #$04
#_1E9A61: JSR SpriteDraw_Tabulated_Bank1E

#_1E9A64: LDA.b #$12
#_1E9A66: JSL SpriteDraw_Shadow_custom_long

#_1E9A6A: RTS

;===================================================================================================

HauntedGroveFlip:
#_1E9A6B: db $40, $00

;===================================================================================================

Sprite_9F_HauntedGroveRabbit:
#_1E9A6D: LDY.w $0DE0,X

#_1E9A70: LDA.w $0F50,X
#_1E9A73: AND.b #$BF
#_1E9A75: ORA.w HauntedGroveFlip,Y
#_1E9A78: STA.w $0F50,X

#_1E9A7B: JSL SpriteDraw_SingleLarge_long

#_1E9A7F: LDA.w $0D80,X
#_1E9A82: JSL JumpTableLocal
#_1E9A86: dw HauntedGroveRabbit_Idle
#_1E9A88: dw HauntedGroveRabbit_Flee

;===================================================================================================

HauntedGroveRabbit_Idle:
#_1E9A8A: LDA.b #$03
#_1E9A8C: STA.w $0DC0,X

#_1E9A8F: LDA.w $0FDD
#_1E9A92: BEQ .exit

#_1E9A94: INC.w $0D80,X

#_1E9A97: LDA.w $0DE0,X
#_1E9A9A: EOR.b #$01
#_1E9A9C: STA.w $0DE0,X

#_1E9A9F: TAY

#_1E9AA0: LDA.w Sixteen_X,Y
#_1E9AA3: STA.w $0D50,X

#_1E9AA6: LDA.b #$F8
#_1E9AA8: STA.w $0D40,X

.exit
#_1E9AAB: RTS

;===================================================================================================

pool HauntedGroveRabbit_Flee

.anim_step
#_1E9AAC: db $00, $01, $02

pool off

;---------------------------------------------------------------------------------------------------

HauntedGroveRabbit_Flee:
#_1E9AAF: JSR Sprite_Move_XYZ_Bank1E

#_1E9AB2: DEC.w $0F80,X
#_1E9AB5: DEC.w $0F80,X
#_1E9AB8: DEC.w $0F80,X

#_1E9ABB: LDA.w $0F70,X
#_1E9ABE: BPL .hopping

#_1E9AC0: LDA.b #$18
#_1E9AC2: STA.w $0F80,X

#_1E9AC5: STZ.w $0F70,X
#_1E9AC8: STZ.w $0E80,X
#_1E9ACB: STZ.w $0D90,X

.hopping
#_1E9ACE: INC.w $0E80,X

#_1E9AD1: LDA.w $0E80,X
#_1E9AD4: AND.b #$03
#_1E9AD6: BNE .dont_step_anim

#_1E9AD8: LDA.w $0D90,X
#_1E9ADB: CMP.b #$02
#_1E9ADD: BEQ .dont_step_anim

#_1E9ADF: INC.w $0D90,X

.dont_step_anim
#_1E9AE2: LDY.w $0D90,X

#_1E9AE5: LDA.w .anim_step,Y
#_1E9AE8: STA.w $0DC0,X

#_1E9AEB: RTS

;===================================================================================================

Sprite_A0_HauntedGroveBird:
#_1E9AEC: LDA.w $0DC0,X
#_1E9AEF: CMP.b #$03
#_1E9AF1: BNE .eyes_emoji

#_1E9AF3: JSR HauntedGroveBird_Blink

.eyes_emoji
#_1E9AF6: LDY.w $0DE0,X

#_1E9AF9: LDA.w $0F50,X
#_1E9AFC: AND.b #$BF
#_1E9AFE: ORA.w HauntedGroveFlip,Y
#_1E9B01: STA.w $0F50,X

#_1E9B04: REP #$20

#_1E9B06: LDA.b $90
#_1E9B08: CLC
#_1E9B09: ADC.w #$0004
#_1E9B0C: STA.b $90

#_1E9B0E: INC.b $92

#_1E9B10: SEP #$20

#_1E9B12: DEC.w $0E40,X

#_1E9B15: JSL SpriteDraw_SingleLarge_long

#_1E9B19: INC.w $0E40,X

#_1E9B1C: JSR Sprite_Move_XYZ_Bank1E

#_1E9B1F: LDA.w $0D80,X
#_1E9B22: JSL JumpTableLocal
#_1E9B26: dw HauntedGroveBird_Idle
#_1E9B28: dw HauntedGroveBird_Ascending
#_1E9B2A: dw HauntedGroveBird_Descending

;===================================================================================================

HauntedGroveBird_Idle:
#_1E9B2C: LDY.b #$00

#_1E9B2E: LDA.b $1A
#_1E9B30: AND.b #$18
#_1E9B32: BNE .keep_anim_step

#_1E9B34: LDY.b #$03

.keep_anim_step
#_1E9B36: TYA
#_1E9B37: STA.w $0DC0,X

#_1E9B3A: LDA.w $0FDD
#_1E9B3D: BEQ .exit

#_1E9B3F: INC.w $0D80,X

#_1E9B42: LDA.w $0DE0,X
#_1E9B45: EOR.b #$01
#_1E9B47: STA.w $0DE0,X

#_1E9B4A: TAY

#_1E9B4B: LDA.w Sixteen_X,Y
#_1E9B4E: STA.w $0D50,X

#_1E9B51: LDA.b #$20
#_1E9B53: STA.w $0DF0,X

#_1E9B56: LDA.b #$10
#_1E9B58: STA.w $0F80,X

#_1E9B5B: LDA.b #$F8
#_1E9B5D: STA.w $0D40,X

.exit
#_1E9B60: RTS

;===================================================================================================

HauntedGroveBird_Ascending:
#_1E9B61: LDA.w $0DF0,X
#_1E9B64: BNE .dont_accel

#_1E9B66: LDA.w $0F80,X
#_1E9B69: CLC
#_1E9B6A: ADC.b #$02
#_1E9B6C: STA.w $0F80,X

#_1E9B6F: CMP.b #$10
#_1E9B71: BMI .dont_accel

#_1E9B73: INC.w $0D80,X

.dont_accel
#_1E9B76: INC.w $0E80,X

#_1E9B79: LDA.w $0E80,X
#_1E9B7C: LSR A
#_1E9B7D: AND.b #$01

#_1E9B7F: INC A
#_1E9B80: STA.w $0DC0,X

#_1E9B83: RTS

;===================================================================================================

HauntedGroveBird_Descending:
#_1E9B84: LDA.b #$01
#_1E9B86: STA.w $0DC0,X

#_1E9B89: LDA.w $0F80,X
#_1E9B8C: SEC
#_1E9B8D: SBC.b #$01
#_1E9B8F: STA.w $0F80,X

#_1E9B92: CMP.b #$F1
#_1E9B94: BPL .dont_decel

#_1E9B96: DEC.w $0D80,X

.dont_decel
#_1E9B99: RTS

;===================================================================================================

pool HauntedGroveBird_Blink

.offset_x
#_1E9B9A: db  8,  0

pool off

;---------------------------------------------------------------------------------------------------

HauntedGroveBird_Blink:
#_1E9B9C: JSR Sprite_PrepOAMCoord_Bank1E

#_1E9B9F: PHX

#_1E9BA0: LDA.w $0DE0,X
#_1E9BA3: TAX

#_1E9BA4: LDA.b $00
#_1E9BA6: CLC
#_1E9BA7: ADC.w .offset_x,X
#_1E9BAA: STA.b ($90),Y

#_1E9BAC: LDA.b $02
#_1E9BAE: INY
#_1E9BAF: STA.b ($90),Y

#_1E9BB1: LDA.b #$AE
#_1E9BB3: INY
#_1E9BB4: STA.b ($90),Y

#_1E9BB6: LDA.b $05
#_1E9BB8: ORA.w HauntedGroveFlip,X
#_1E9BBB: INY
#_1E9BBC: STA.b ($90),Y

#_1E9BBE: PLX

#_1E9BBF: LDY.b #$00
#_1E9BC1: LDA.b #$00
#_1E9BC3: JSL Sprite_CorrectOAMEntries_long

#_1E9BC7: RTS

;===================================================================================================

Sprite_9C_Zoro:
Sprite_9D_Babasu:
#_1E9BC8: LDA.w $0E90,X
#_1E9BCB: BNE Zoro

#_1E9BCD: JMP.w Babasu

;===================================================================================================

Zoro:
#_1E9BD0: LDA.w $0DB0,X
#_1E9BD3: BNE .continue

#_1E9BD5: INC.w $0DB0,X

#_1E9BD8: JSR Sprite_IsBelowLink_Bank1E

#_1E9BDB: CPY.b #$00
#_1E9BDD: BEQ .continue

#_1E9BDF: STZ.w $0DD0,X

#_1E9BE2: RTS

.continue
#_1E9BE3: JSL SpriteDraw_SingleSmall_long
#_1E9BE7: JSR Sprite_CheckIfActive_Bank1E
#_1E9BEA: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1E9BED: INC.w $0E80,X

#_1E9BF0: LDA.w $0E80,X
#_1E9BF3: LSR A
#_1E9BF4: AND.b #$01
#_1E9BF6: STA.w $0DC0,X

#_1E9BF9: LDA.w $0E80,X
#_1E9BFC: LSR A
#_1E9BFD: LSR A

#_1E9BFE: AND.b #$01
#_1E9C00: TAY

#_1E9C01: LDA.w Sixteen_X,Y
#_1E9C04: STA.w $0D50,X

#_1E9C07: JSR Sprite_Move_XY_Bank1E

#_1E9C0A: LDA.w $0DF0,X
#_1E9C0D: BNE .dont_die

#_1E9C0F: JSR Sprite_CheckTileCollision_Bank1E
#_1E9C12: BEQ .dont_die

#_1E9C14: STZ.w $0DD0,X

.dont_die
#_1E9C17: LDA.w $0E80,X
#_1E9C1A: AND.b #$03
#_1E9C1C: BNE .exit

#_1E9C1E: PHX
#_1E9C1F: TXY

#_1E9C20: LDX.b #$1D

.next_slot
#_1E9C22: LDA.l $7FF800,X
#_1E9C26: BEQ .spawn_garnish

#_1E9C28: DEX
#_1E9C29: BPL .next_slot

#_1E9C2B: PLX

.exit
#_1E9C2C: RTS

;---------------------------------------------------------------------------------------------------

.spawn_garnish
#_1E9C2D: LDA.b #$06 ; GARNISH 06
#_1E9C2F: STA.l $7FF800,X
#_1E9C33: STA.w $0FB4

#_1E9C36: LDA.w $0D10,Y
#_1E9C39: STA.l $7FF83C,X

#_1E9C3D: LDA.w $0D30,Y
#_1E9C40: STA.l $7FF878,X

#_1E9C44: LDA.w $0D00,Y
#_1E9C47: CLC
#_1E9C48: ADC.b #$10
#_1E9C4A: STA.l $7FF81E,X

#_1E9C4E: LDA.w $0D20,Y
#_1E9C51: ADC.b #$00
#_1E9C53: STA.l $7FF85A,X

#_1E9C57: LDA.b #$0A
#_1E9C59: STA.l $7FF90E,X

#_1E9C5D: TYA
#_1E9C5E: STA.l $7FF92C,X

#_1E9C62: LDA.w $0F20,Y
#_1E9C65: STA.l $7FF968,X

#_1E9C69: PLX

#_1E9C6A: RTS

;===================================================================================================

Babasu:
#_1E9C6B: JSL SpriteDraw_Babasu
#_1E9C6F: JSR Sprite_CheckIfActive_Bank1E

#_1E9C72: LDA.w $0D80,X
#_1E9C75: JSL JumpTableLocal
#_1E9C79: dw Babasu_Reset
#_1E9C7B: dw Babasu_Hidden
#_1E9C7D: dw Babasu_Telegraph
#_1E9C7F: dw Babasu_Dart

;===================================================================================================

Babasu_Reset:
#_1E9C81: INC.w $0D80,X

#_1E9C84: LDA.b #$80
#_1E9C86: STA.w $0DF0,X

#_1E9C89: LDA.b #$FF
#_1E9C8B: STA.w $0DC0,X

#_1E9C8E: RTS

;===================================================================================================

Babasu_Hidden:
#_1E9C8F: LDA.w $0DF0,X
#_1E9C92: BNE .exit

#_1E9C94: INC.w $0D80,X

#_1E9C97: LDA.b #$37
#_1E9C99: STA.w $0DF0,X

.exit
#_1E9C9C: RTS

;===================================================================================================

pool Babasu_Telegraph

.anim
#_1E9C9D: db $05, $04, $03, $02, $01, $00

.anim_offset
#_1E9CA3: db $06, $06, $00, $00

.speed_x ; bleeds into next
#_1E9CA7: db  32, -32

.speed_y
#_1E9CA9: db   0,   0,  32, -32

pool off

;---------------------------------------------------------------------------------------------------

Babasu_Telegraph:
#_1E9CAD: LDA.w $0DF0,X
#_1E9CB0: BNE .delay

#_1E9CB2: PHA

#_1E9CB3: INC.w $0D80,X

#_1E9CB6: LDY.w $0DE0,X

#_1E9CB9: LDA.w .speed_x,Y
#_1E9CBC: STA.w $0D50,X

#_1E9CBF: LDA.w .speed_y,Y
#_1E9CC2: STA.w $0D40,X

#_1E9CC5: LDA.b #$20
#_1E9CC7: STA.w $0DF0,X

#_1E9CCA: PLA

;---------------------------------------------------------------------------------------------------

.delay
#_1E9CCB: CMP.b #$20
#_1E9CCD: BCC .hide

#_1E9CCF: SBC.b #$20
#_1E9CD1: LSR A
#_1E9CD2: LSR A
#_1E9CD3: TAY

#_1E9CD4: LDA.w .anim,Y
#_1E9CD7: LDY.w $0DE0,X

#_1E9CDA: CLC
#_1E9CDB: ADC.w .anim_offset,Y
#_1E9CDE: STA.w $0DC0,X

#_1E9CE1: RTS

.hide
#_1E9CE2: LDA.b #$FF
#_1E9CE4: STA.w $0DC0,X

#_1E9CE7: RTS

;===================================================================================================

pool Babasu_Dart

.anim_step
#_1E9CE8: db $12, $0E, $0C, $10

pool off

;---------------------------------------------------------------------------------------------------

Babasu_Dart:
#_1E9CEC: JSR Sprite_CheckDamageToAndFromLink_Bank1E
#_1E9CEF: JSR Sprite_Move_XY_Bank1E

#_1E9CF2: LDA.b $1A
#_1E9CF4: LSR A
#_1E9CF5: AND.b #$01

#_1E9CF7: LDY.w $0DE0,X

#_1E9CFA: CLC
#_1E9CFB: ADC.w .anim_step,Y
#_1E9CFE: STA.w $0DC0,X

#_1E9D01: LDA.w $0DF0,X
#_1E9D04: BNE .exit

#_1E9D06: JSR Sprite_CheckTileCollision_Bank1E
#_1E9D09: BEQ .exit

#_1E9D0B: LDA.w $0DE0,X
#_1E9D0E: EOR.b #$01
#_1E9D10: STA.w $0DE0,X

#_1E9D13: STZ.w $0D80,X

.exit
#_1E9D16: RTS

;===================================================================================================

UNREACHABLE_1E9D17:
#_1E9D17: db $03, $43, $C3, $83

;===================================================================================================

Sprite_9B_Wizzrobe:
#_1E9D1B: LDA.w $0DB0,X
#_1E9D1E: BEQ Wizzrobe

;===================================================================================================

WizzrobeBeam:
#_1E9D20: JSL SpriteDraw_WizzrobeBeam
#_1E9D24: JSR Sprite_CheckIfActive_Bank1E

#_1E9D27: LDA.w $0F50,X
#_1E9D2A: EOR.b #$06
#_1E9D2C: STA.w $0F50,X

#_1E9D2F: INC.w $0E80,X

#_1E9D32: LDA.w $0D80,X
#_1E9D35: BNE .harmless

#_1E9D37: JSR Sprite_CheckDamageToLink_Bank1E

.harmless
#_1E9D3A: JSR Sprite_Move_XY_Bank1E
#_1E9D3D: JSR Sprite_CheckTileCollision_Bank1E
#_1E9D40: BEQ .exit

#_1E9D42: STZ.w $0DD0,X

.exit
#_1E9D45: RTS

;===================================================================================================

Wizzrobe:
#_1E9D46: LDA.w $0D80,X
#_1E9D49: BEQ .no_draw

#_1E9D4B: AND.b #$01
#_1E9D4D: BEQ .do_draw

#_1E9D4F: LDA.w $0DF0,X
#_1E9D52: AND.b #$01
#_1E9D54: BEQ .do_draw

.no_draw
#_1E9D56: JSL Sprite_PrepOAMCoord_long
#_1E9D5A: BRA .continue

.do_draw
#_1E9D5C: JSL SpriteDraw_Wizzrobe

.continue
#_1E9D60: JSR Sprite_CheckIfActive_Bank1E
#_1E9D63: JSR Sprite_CheckIfRecoiling_Bank1E

#_1E9D66: LDA.b #$01
#_1E9D68: STA.w $0BA0,X

#_1E9D6B: LDA.w $0D80,X
#_1E9D6E: JSL JumpTableLocal
#_1E9D72: dw Wizzrobe_Invisible
#_1E9D74: dw Wizzrobe_Appear
#_1E9D76: dw Wizzrobe_Attack
#_1E9D78: dw Wizzrobe_Disappear

;===================================================================================================

pool Wizzrobe_Invisible

.anim_step
#_1E9D7A: db $04, $02, $00, $06

pool off

;---------------------------------------------------------------------------------------------------

Wizzrobe_Invisible:
#_1E9D7E: LDA.w $0DF0,X
#_1E9D81: BNE .exit

#_1E9D83: LDA.b #$01
#_1E9D85: STA.w $0D50,X
#_1E9D88: STA.w $0D40,X

#_1E9D8B: JSR Sprite_CheckTileCollision_Bank1E
#_1E9D8E: BNE .die

#_1E9D90: INC.w $0D80,X

#_1E9D93: LDA.b #$3F
#_1E9D95: STA.w $0DF0,X

#_1E9D98: JSR Sprite_DirectionToFaceLink_Bank1E
#_1E9D9B: TYA
#_1E9D9C: STA.w $0DE0,X

#_1E9D9F: LDA.w .anim_step,Y
#_1E9DA2: STA.w $0DC0,X

#_1E9DA5: RTS

.die
#_1E9DA6: STZ.w $0DD0,X

.exit
#_1E9DA9: RTS

;===================================================================================================

Wizzrobe_Appear:
#_1E9DAA: LDA.w $0DF0,X
#_1E9DAD: BNE .exit

#_1E9DAF: INC.w $0D80,X

#_1E9DB2: LDA.b #$3F
#_1E9DB4: STA.w $0DF0,X

.exit
#_1E9DB7: RTS

;===================================================================================================

pool Wizzrobe_Attack

.anim_step
#_1E9DB8: db $00, $01, $01, $01, $01, $01, $01, $00

.anim_direction_offset
#_1E9DC0: db $04, $02, $00, $06

pool off

;---------------------------------------------------------------------------------------------------

Wizzrobe_Attack:
#_1E9DC4: STZ.w $0BA0,X

#_1E9DC7: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1E9DCA: LDA.w $0DF0,X
#_1E9DCD: BNE .wait

#_1E9DCF: INC.w $0D80,X

#_1E9DD2: LDA.b #$3F
#_1E9DD4: STA.w $0DF0,X

#_1E9DD7: RTS

.wait
#_1E9DD8: CMP.b #$20
#_1E9DDA: BNE .delay_beam

#_1E9DDC: PHA

#_1E9DDD: JSR Wizzrobe_FireBeam

#_1E9DE0: PLA

.delay_beam
#_1E9DE1: LSR A
#_1E9DE2: LSR A
#_1E9DE3: LSR A
#_1E9DE4: TAY

#_1E9DE5: LDA.w .anim_step,Y

#_1E9DE8: LDY.w $0DE0,X

#_1E9DEB: CLC
#_1E9DEC: ADC.w .anim_direction_offset,Y
#_1E9DEF: STA.w $0DC0,X

#_1E9DF2: RTS

;===================================================================================================

Wizzrobe_Disappear:
#_1E9DF3: LDA.w $0DF0,X
#_1E9DF6: BNE .exit

#_1E9DF8: LDA.w $0DA0,X
#_1E9DFB: BEQ .dont_die

#_1E9DFD: STZ.w $0DD0,X

.dont_die
#_1E9E00: STZ.w $0D80,X

#_1E9E03: JSL GetRandomNumber
#_1E9E07: AND.b #$1F
#_1E9E09: ADC.b #$20
#_1E9E0B: STA.w $0DF0,X

.exit
#_1E9E0E: RTS

;===================================================================================================

pool Wizzrobe_FireBeam

.speed_x ; bleeds into next
#_1E9E0F: db  32, -32

.speed_y
#_1E9E11: db   0,   0,  32, -32

pool off

;---------------------------------------------------------------------------------------------------

Wizzrobe_FireBeam:
#_1E9E15: LDA.b #$9B ; SPRITE 9B
#_1E9E17: JSL Sprite_SpawnDynamically
#_1E9E1B: BMI .no_space

#_1E9E1D: LDA.b #$36 ; SFX3.36
#_1E9E1F: JSL SpriteSFX_QueueSFX3WithPan

#_1E9E23: LDA.b #$01
#_1E9E25: STA.w $0DB0,Y
#_1E9E28: STA.w $0BA0,Y

#_1E9E2B: LDA.b $00
#_1E9E2D: CLC
#_1E9E2E: ADC.b #$04
#_1E9E30: STA.w $0D10,Y

#_1E9E33: LDA.b $01
#_1E9E35: ADC.b #$00
#_1E9E37: STA.w $0D30,Y

#_1E9E3A: LDA.b $02
#_1E9E3C: CLC
#_1E9E3D: ADC.b #$00
#_1E9E3F: STA.w $0D00,Y

#_1E9E42: LDA.b $03
#_1E9E44: ADC.b #$00
#_1E9E46: STA.w $0D20,Y

#_1E9E49: PHX

#_1E9E4A: LDA.w $0DE0,X
#_1E9E4D: TAX

#_1E9E4E: LDA.w .speed_x,X
#_1E9E51: STA.w $0D50,Y

#_1E9E54: LDA.w .speed_y,X
#_1E9E57: STA.w $0D40,Y

#_1E9E5A: LDA.b #$48
#_1E9E5C: STA.w $0CAA,Y

#_1E9E5F: LDA.b #$02
#_1E9E61: STA.w $0F50,Y

#_1E9E64: LDA.l $7EF35A
#_1E9E68: TAX

#_1E9E69: LDA.b #$00
#_1E9E6B: CPX.b #$03
#_1E9E6D: BNE .not_blockable

#_1E9E6F: LDA.b #$20

.not_blockable
#_1E9E71: STA.w $0BE0,Y

#_1E9E74: PLX

#_1E9E75: LDA.b #$14
#_1E9E77: STA.w $0F60,Y

.no_space
#_1E9E7A: RTS

;===================================================================================================

Sprite_9A_Kyameron:
#_1E9E7B: LDA.w $0D80,X
#_1E9E7E: BNE .visible

#_1E9E80: JSL Sprite_PrepOAMCoord_long
#_1E9E84: BRA .not_visible

.visible
#_1E9E86: JSR SpriteDraw_Kyameron

.not_visible
#_1E9E89: JSR Sprite_CheckIfActive_Bank1E
#_1E9E8C: JSR Sprite_CheckIfRecoiling_Bank1E

#_1E9E8F: LDA.b #$01
#_1E9E91: STA.w $0BA0,X

#_1E9E94: LDA.w $0D80,X
#_1E9E97: JSL JumpTableLocal
#_1E9E9B: dw Kyameron_Reset
#_1E9E9D: dw Kyameron_Puddle
#_1E9E9F: dw Kyameron_BuildUp
#_1E9EA1: dw Kyameron_Moving
#_1E9EA3: dw Kyameron_Dissipate

;===================================================================================================

Kyameron_Reset:
#_1E9EA5: LDA.w $0DF0,X
#_1E9EA8: BNE .exit

#_1E9EAA: INC.w $0D80,X

#_1E9EAD: JSL GetRandomNumber
#_1E9EB1: AND.b #$3F
#_1E9EB3: ADC.b #$60
#_1E9EB5: STA.w $0DF0,X

#_1E9EB8: LDA.w $0D90,X
#_1E9EBB: STA.w $0D10,X

#_1E9EBE: LDA.w $0DA0,X
#_1E9EC1: STA.w $0D30,X

#_1E9EC4: LDA.w $0DB0,X
#_1E9EC7: STA.w $0D00,X

#_1E9ECA: LDA.w $0EB0,X
#_1E9ECD: STA.w $0D20,X

#_1E9ED0: LDA.b #$05
#_1E9ED2: STA.w $0E80,X

#_1E9ED5: LDA.b #$08
#_1E9ED7: STA.w $0DC0,X

.exit
#_1E9EDA: RTS

;===================================================================================================

Kyameron_Puddle:
#_1E9EDB: LDA.w $0DF0,X
#_1E9EDE: BNE .delay

#_1E9EE0: LDA.b #$1F
#_1E9EE2: STA.w $0DF0,X

#_1E9EE5: INC.w $0D80,X

.delay
#_1E9EE8: DEC.w $0E80,X
#_1E9EEB: BPL .exit

#_1E9EED: LDA.b #$05
#_1E9EEF: STA.w $0E80,X

#_1E9EF2: INC.w $0DC0,X

#_1E9EF5: LDA.w $0DC0,X
#_1E9EF8: AND.b #$03
#_1E9EFA: CLC
#_1E9EFB: ADC.b #$08
#_1E9EFD: STA.w $0DC0,X

.exit
#_1E9F00: RTS

;===================================================================================================

pool Kyameron_BuildUp

.anim_step
#_1E9F01: db $04, $07, $0E, $0D, $0C, $06, $06, $05

.speed_x
#_1E9F09: db  32, -32,  32, -32

.speed_y
#_1E9F0D: db  32,  32, -32, -32

pool off

;---------------------------------------------------------------------------------------------------

Kyameron_BuildUp:
#_1E9F11: LDA.w $0DF0,X
#_1E9F14: BNE .delay

#_1E9F16: INC.w $0D80,X

#_1E9F19: JSR Sprite_IsBelowLink_Bank1E
#_1E9F1C: TYA
#_1E9F1D: ASL A
#_1E9F1E: STA.b $00

#_1E9F20: JSR Sprite_IsRightOfLink_Bank1E
#_1E9F23: TYA
#_1E9F24: ORA.b $00
#_1E9F26: TAY

#_1E9F27: LDA.w .speed_x,Y
#_1E9F2A: STA.w $0D50,X

#_1E9F2D: LDA.w .speed_y,Y
#_1E9F30: STA.w $0D40,X

#_1E9F33: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_1E9F34: CMP.b #$07
#_1E9F36: BNE .dont_move_upwards

#_1E9F38: PHA

#_1E9F39: LDA.w $0D00,X
#_1E9F3C: SEC
#_1E9F3D: SBC.b #$1D
#_1E9F3F: STA.w $0D00,X

#_1E9F42: LDA.w $0D20,X
#_1E9F45: SBC.b #$00
#_1E9F47: STA.w $0D20,X

#_1E9F4A: PLA

.dont_move_upwards
#_1E9F4B: LSR A
#_1E9F4C: LSR A
#_1E9F4D: TAY

#_1E9F4E: LDA.w .anim_step,Y
#_1E9F51: STA.w $0DC0,X

#_1E9F54: RTS

;===================================================================================================

pool Kyameron_Moving

.anim_step
#_1E9F55: db $03, $02, $01, $00

pool off

;---------------------------------------------------------------------------------------------------

Kyameron_Moving:
#_1E9F59: STZ.w $0BA0,X

#_1E9F5C: JSR Sprite_CheckDamageToAndFromLink_Bank1E
#_1E9F5F: BCS .damage

#_1E9F61: JSR Sprite_Move_XY_Bank1E
#_1E9F64: JSR Sprite_CheckTileCollision_Bank1E
#_1E9F67: AND.b #$03
#_1E9F69: BEQ .no_horizontal_collision

#_1E9F6B: LDA.w $0D50,X
#_1E9F6E: EOR.b #$FF
#_1E9F70: INC A
#_1E9F71: STA.w $0D50,X

#_1E9F74: INC.w $0EC0,X
#_1E9F77: BRA .no_horizontal_collision

.no_horizontal_collision
#_1E9F79: LDA.w $0E70,X
#_1E9F7C: AND.b #$0C
#_1E9F7E: BEQ .no_vertital_collision

#_1E9F80: LDA.w $0D40,X
#_1E9F83: EOR.b #$FF
#_1E9F85: INC A
#_1E9F86: STA.w $0D40,X

#_1E9F89: INC.w $0EC0,X

.no_vertital_collision
#_1E9F8C: LDA.w $0EC0,X
#_1E9F8F: CMP.b #$03
#_1E9F91: BCC .can_bounce_more

.damage
#_1E9F93: LDA.b #$04
#_1E9F95: STA.w $0D80,X

#_1E9F98: LDA.b #$0F
#_1E9F9A: STA.w $0DF0,X

#_1E9F9D: LDA.b #$28 ; SFX2.28
#_1E9F9F: JSL SpriteSFX_QueueSFX2WithPan

.can_bounce_more
#_1E9FA3: INC.w $0E80,X

#_1E9FA6: LDA.w $0E80,X
#_1E9FA9: LSR A
#_1E9FAA: LSR A
#_1E9FAB: LSR A

#_1E9FAC: AND.b #$03
#_1E9FAE: TAY

#_1E9FAF: LDA.w .anim_step,Y
#_1E9FB2: STA.w $0DC0,X

#_1E9FB5: TXA
#_1E9FB6: EOR.b $1A
#_1E9FB8: AND.b #$07
#_1E9FBA: BNE .exit

#_1E9FBC: JSL GetRandomNumber

#_1E9FC0: REP #$20

#_1E9FC2: AND.w #$000F
#_1E9FC5: SEC
#_1E9FC6: SBC.w #$0004
#_1E9FC9: STA.b $00

#_1E9FCB: SEP #$20

#_1E9FCD: JSL GetRandomNumber

#_1E9FD1: REP #$20

#_1E9FD3: AND.w #$000F
#_1E9FD6: SEC
#_1E9FD7: SBC.w #$0004
#_1E9FDA: STA.b $02

#_1E9FDC: SEP #$20

#_1E9FDE: JSL GarnishSpawn_Sparkle

.exit
#_1E9FE2: RTS

;===================================================================================================

Kyameron_Dissipate:
#_1E9FE3: LDA.w $0DF0,X
#_1E9FE6: BNE .still_being_dramatic_about_the_ordeal

#_1E9FE8: STZ.w $0EC0,X
#_1E9FEB: STZ.w $0D80,X
#_1E9FEE: STZ.w $0F70,X

#_1E9FF1: LDA.b #$40
#_1E9FF3: STA.w $0DF0,X

#_1E9FF6: RTS

.still_being_dramatic_about_the_ordeal
#_1E9FF7: LSR A
#_1E9FF8: LSR A
#_1E9FF9: TAY

#_1E9FFA: CLC
#_1E9FFB: ADC.b #$0F
#_1E9FFD: STA.w $0DC0,X

#_1EA000: RTS

;===================================================================================================

GarnishSpawn_Sparkle_limited:
#_1EA001: PHX
#_1EA002: TXY

#_1EA003: LDX.b #$0E
#_1EA005: BRA .check_slot

;===================================================================================================

#GarnishSpawn_Sparkle:
#_1EA007: PHX
#_1EA008: TXY

#_1EA009: LDX.b #$1D

.check_slot
#_1EA00B: LDA.l $7FF800,X
#_1EA00F: BEQ .free_slot

#_1EA011: DEX
#_1EA012: BPL .check_slot

#_1EA014: STX.b $0F

#_1EA016: PLX

#_1EA017: RTL

;---------------------------------------------------------------------------------------------------

.free_slot
#_1EA018: STX.b $0F

#_1EA01A: LDA.b #$05 ; GARNISH 05
#_1EA01C: STA.l $7FF800,X
#_1EA020: STA.w $0FB4

#_1EA023: LDA.w $0D10,Y
#_1EA026: CLC
#_1EA027: ADC.b $00
#_1EA029: STA.l $7FF83C,X

#_1EA02D: LDA.w $0D30,Y
#_1EA030: ADC.b $01
#_1EA032: STA.l $7FF878,X

#_1EA036: LDA.w $0D00,Y
#_1EA039: SEC
#_1EA03A: SBC.w $0F70,Y
#_1EA03D: PHP

#_1EA03E: CLC
#_1EA03F: ADC.b #$10
#_1EA041: PHP

#_1EA042: CLC
#_1EA043: ADC.b $02
#_1EA045: STA.l $7FF81E,X

#_1EA049: LDA.w $0D20,Y
#_1EA04C: ADC.b $03

#_1EA04E: PLP
#_1EA04F: ADC.b #$00

#_1EA051: PLP
#_1EA052: SBC.b #$00

#_1EA054: STA.l $7FF85A,X

#_1EA058: LDA.b #$1F
#_1EA05A: STA.l $7FF90E,X

#_1EA05E: TYA
#_1EA05F: STA.l $7FF92C,X

#_1EA063: LDA.w $0F20,Y
#_1EA066: STA.l $7FF968,X

#_1EA06A: PLX

#_1EA06B: RTL

;===================================================================================================

pool SpriteDraw_Kyameron

.oam_groups
#_1EA06C: dw   1,   8 : db $B4, $00, $00, $00
#_1EA074: dw   7,   8 : db $B5, $00, $00, $00
#_1EA07C: dw   4,  -3 : db $86, $00, $00, $00
#_1EA084: dw   0, -13 : db $A2, $80, $00, $02

#_1EA08C: dw   2,   8 : db $B4, $00, $00, $00
#_1EA094: dw   6,   8 : db $B5, $00, $00, $00
#_1EA09C: dw   4,  -6 : db $96, $00, $00, $00
#_1EA0A4: dw   0, -20 : db $A2, $00, $00, $02

#_1EA0AC: dw   4,  -1 : db $96, $00, $00, $00
#_1EA0B4: dw   0, -27 : db $A2, $00, $00, $02
#_1EA0BC: dw   0, -27 : db $A2, $00, $00, $02
#_1EA0C4: dw   0, -27 : db $A2, $00, $00, $02

#_1EA0CC: dw  -6,  -6 : db $DF, $01, $00, $00
#_1EA0D4: dw  14,  -6 : db $DF, $41, $00, $00
#_1EA0DC: dw  -6,  14 : db $DF, $81, $00, $00
#_1EA0E4: dw  14,  14 : db $DF, $C1, $00, $00

#_1EA0EC: dw  -6,  -6 : db $96, $00, $00, $00
#_1EA0F4: dw  14,  -6 : db $96, $40, $00, $00
#_1EA0FC: dw  -6,  14 : db $96, $80, $00, $00
#_1EA104: dw  14,  14 : db $96, $C0, $00, $00

#_1EA10C: dw  -4,  -4 : db $8D, $01, $00, $00
#_1EA114: dw  12,  -4 : db $8D, $41, $00, $00
#_1EA11C: dw  -4,  12 : db $8D, $81, $00, $00
#_1EA124: dw  12,  12 : db $8D, $C1, $00, $00

#_1EA12C: dw   0,   0 : db $8D, $01, $00, $00
#_1EA134: dw   8,   0 : db $8D, $41, $00, $00
#_1EA13C: dw   0,   8 : db $8D, $81, $00, $00
#_1EA144: dw   8,   8 : db $8D, $C1, $00, $00

;---------------------------------------------------------------------------------------------------

.flip
#_1EA14C: db $40, $00
#_1EA14E: db $00, $00
#_1EA150: db $00, $00
#_1EA152: db $00, $00
#_1EA154: db $00, $40
#_1EA156: db $C0, $80

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Kyameron:
#_1EA158: LDA.w $0DC0,X
#_1EA15B: CMP.b #$0C
#_1EA15D: BCS .dispersing

#_1EA15F: LDY.w $0DC0,X

#_1EA162: LDA.w $0F50,X
#_1EA165: PHA

#_1EA166: AND.b #$3F
#_1EA168: ORA.w .flip,Y
#_1EA16B: STA.w $0F50,X

#_1EA16E: JSL SpriteDraw_SingleLarge_long

#_1EA172: PLA
#_1EA173: STA.w $0F50,X

#_1EA176: RTS

.dispersing
#_1EA177: SEC
#_1EA178: SBC.b #$0C
#_1EA17A: TAY

#_1EA17B: LDA.b #$00
#_1EA17D: XBA

#_1EA17E: TYA

#_1EA17F: REP #$20

#_1EA181: ASL A
#_1EA182: ASL A
#_1EA183: ASL A
#_1EA184: ASL A
#_1EA185: ASL A

#_1EA186: ADC.w #.oam_groups
#_1EA189: STA.b $08

#_1EA18B: SEP #$20

#_1EA18D: LDA.b #$04
#_1EA18F: JMP.w SpriteDraw_Tabulated_Bank1E

;===================================================================================================

pool Sprite_99_Pengator

.anim_step
#_1EA192: db $05, $00, $0A, $0F

pool off

;---------------------------------------------------------------------------------------------------

Sprite_99_Pengator:
#_1EA196: LDY.w $0DE0,X

#_1EA199: LDA.w $0D90,X
#_1EA19C: CLC
#_1EA19D: ADC.w .anim_step,Y
#_1EA1A0: STA.w $0DC0,X

#_1EA1A3: JSR SpriteDraw_Pengator

#_1EA1A6: LDA.w $0EA0,X
#_1EA1A9: BNE .recoiling

#_1EA1AB: LDA.w $0E70,X
#_1EA1AE: AND.b #$0F
#_1EA1B0: BEQ .no_tile_collision

.recoiling
#_1EA1B2: STZ.w $0D80,X
#_1EA1B5: STZ.w $0D50,X
#_1EA1B8: STZ.w $0D40,X

.no_tile_collision
#_1EA1BB: JSR Sprite_CheckIfActive_Bank1E
#_1EA1BE: JSR Sprite_CheckIfRecoiling_Bank1E
#_1EA1C1: JSR Sprite_CheckDamageToAndFromLink_Bank1E
#_1EA1C4: JSR Sprite_Move_XYZ_Bank1E

#_1EA1C7: DEC.w $0F80,X
#_1EA1CA: DEC.w $0F80,X

#_1EA1CD: LDA.w $0F70,X
#_1EA1D0: BPL .airborne

#_1EA1D2: STZ.w $0F80,X
#_1EA1D5: STZ.w $0F70,X

.airborne
#_1EA1D8: JSR Sprite_CheckTileCollision_Bank1E

#_1EA1DB: LDA.w $0D80,X
#_1EA1DE: JSL JumpTableLocal
#_1EA1E2: dw Pengator_FaceLink
#_1EA1E4: dw Pengator_Accelerate
#_1EA1E6: dw Pengator_Hop
#_1EA1E8: dw Pengator_Slide

;===================================================================================================

Pengator_FaceLink:
#_1EA1EA: JSR Sprite_DirectionToFaceLink_Bank1E
#_1EA1ED: TYA
#_1EA1EE: STA.w $0DE0,X

#_1EA1F1: INC.w $0D80,X

#_1EA1F4: RTS

;===================================================================================================

pool Pengator_Accelerate

.speed_x ; bleeds into next
#_1EA1F5: db  1, -1

.speed_y
#_1EA1F7: db  0,  0,  1, -1

pool off

;---------------------------------------------------------------------------------------------------

Pengator_Accelerate:
#_1EA1FB: TXA
#_1EA1FC: EOR.b $1A
#_1EA1FE: AND.b #$03
#_1EA200: BNE .continue

#_1EA202: STZ.b $00

#_1EA204: LDY.w $0DE0,X

#_1EA207: LDA.w $0D50,X
#_1EA20A: CMP.w Sixteen_X,Y
#_1EA20D: BEQ .at_max_x

#_1EA20F: CLC
#_1EA210: ADC.w .speed_x,Y
#_1EA213: STA.w $0D50,X

#_1EA216: INC.b $00

.at_max_x
#_1EA218: LDA.w $0D40,X
#_1EA21B: CMP.w Sixteen_Y,Y
#_1EA21E: BEQ .at_max_y

#_1EA220: CLC
#_1EA221: ADC.w .speed_y,Y
#_1EA224: STA.w $0D40,X

#_1EA227: INC.b $00

.at_max_y
#_1EA229: LDA.b $00
#_1EA22B: BNE .continue

#_1EA22D: LDA.b #$0F
#_1EA22F: STA.w $0DF0,X

#_1EA232: INC.w $0D80,X

.continue
#_1EA235: LDA.b $1A
#_1EA237: AND.b #$04
#_1EA239: LSR A
#_1EA23A: LSR A
#_1EA23B: TAY ; useless

#_1EA23C: STA.w $0D90,X

#_1EA23F: RTS

;===================================================================================================

pool Pengator_Hop

.anim_step
#_1EA240: db $04, $04, $03, $02

pool off

;---------------------------------------------------------------------------------------------------

Pengator_Hop:
#_1EA244: LDA.w $0DF0,X
#_1EA247: BNE .delay

#_1EA249: INC.w $0D80,X

.delay
#_1EA24C: CMP.b #$05
#_1EA24E: BNE .no_hop

#_1EA250: PHA

#_1EA251: LDA.b #$18
#_1EA253: STA.w $0F80,X

#_1EA256: PLA

.no_hop
#_1EA257: LSR A
#_1EA258: LSR A
#_1EA259: TAY

#_1EA25A: LDA.w .anim_step,Y
#_1EA25D: STA.w $0D90,X

#_1EA260: RTS

;===================================================================================================

pool Pengator_Slide

.sparkle_offset_x
#_1EA261: db  8, 10, 12, 14, 12, 12, 12, 12

.sparkle_offset_y
#_1EA269: db  4,  4,  4,  4,  0,  4,  8, 12

pool off

;---------------------------------------------------------------------------------------------------

Pengator_Slide:
#_1EA271: TXA
#_1EA272: EOR.b $1A
#_1EA274: AND.b #$07
#_1EA276: ORA.w $0F70,X
#_1EA279: BNE .exit

#_1EA27B: LDA.w $0DE0,X
#_1EA27E: STA.b $06

#_1EA280: JSL GetRandomNumber
#_1EA284: AND.b #$03
#_1EA286: TAY

#_1EA287: LDA.b $06
#_1EA289: CMP.b #$02
#_1EA28B: BCC .facing_vertical

#_1EA28D: INY
#_1EA28E: INY
#_1EA28F: INY
#_1EA290: INY

.facing_vertical
#_1EA291: LDA.w .sparkle_offset_y,Y
#_1EA294: STA.b $00
#_1EA296: STZ.b $01

#_1EA298: JSL GetRandomNumber

#_1EA29C: AND.b #$03
#_1EA29E: TAY

#_1EA29F: LDA.b $06
#_1EA2A1: CMP.b #$02
#_1EA2A3: BCC .facing_vertical_also

#_1EA2A5: INY
#_1EA2A6: INY
#_1EA2A7: INY
#_1EA2A8: INY

.facing_vertical_also
#_1EA2A9: LDA.w .sparkle_offset_x,Y
#_1EA2AC: STA.b $02
#_1EA2AE: STZ.b $03

#_1EA2B0: JSL GarnishSpawn_Sparkle_limited

.exit
#_1EA2B4: RTS

;===================================================================================================

pool SpriteDraw_Pengator

.oam_group_set_1
#_1EA2B5: dw  -1,  -8 : db $82, $00, $00, $02
#_1EA2BD: dw   0,   0 : db $88, $00, $00, $02

#_1EA2C5: dw  -1,  -7 : db $82, $00, $00, $02
#_1EA2CD: dw   0,   0 : db $8A, $00, $00, $02

#_1EA2D5: dw  -3,  -6 : db $82, $00, $00, $02
#_1EA2DD: dw   0,   0 : db $88, $00, $00, $02

#_1EA2E5: dw  -6,  -4 : db $82, $00, $00, $02
#_1EA2ED: dw   0,   0 : db $8A, $00, $00, $02

#_1EA2F5: dw  -4,   0 : db $A2, $00, $00, $02
#_1EA2FD: dw   4,   0 : db $A3, $00, $00, $02

#_1EA305: dw   1,  -8 : db $82, $40, $00, $02
#_1EA30D: dw   0,   0 : db $88, $40, $00, $02

#_1EA315: dw   1,  -7 : db $82, $40, $00, $02
#_1EA31D: dw   0,   0 : db $8A, $40, $00, $02

#_1EA325: dw   3,  -6 : db $82, $40, $00, $02
#_1EA32D: dw   0,   0 : db $88, $40, $00, $02

#_1EA335: dw   6,  -4 : db $82, $40, $00, $02
#_1EA33D: dw   0,   0 : db $8A, $40, $00, $02

#_1EA345: dw   4,   0 : db $A2, $40, $00, $02
#_1EA34D: dw  -4,   0 : db $A3, $40, $00, $02

#_1EA355: dw   0,  -7 : db $80, $00, $00, $02
#_1EA35D: dw   0,   0 : db $86, $00, $00, $02

#_1EA365: dw   0,  -7 : db $80, $40, $00, $02
#_1EA36D: dw   0,   0 : db $86, $40, $00, $02

#_1EA375: dw   0,  -4 : db $80, $00, $00, $02
#_1EA37D: dw   0,   0 : db $86, $00, $00, $02

#_1EA385: dw   0,  -1 : db $80, $00, $00, $02
#_1EA38D: dw   0,   0 : db $86, $00, $00, $02

#_1EA395: dw  -8,   0 : db $8E, $00, $00, $02
#_1EA39D: dw   8,   0 : db $8E, $40, $00, $02

#_1EA3A5: dw   0,  -8 : db $84, $00, $00, $02
#_1EA3AD: dw   0,   0 : db $8C, $00, $00, $02

#_1EA3B5: dw   0,  -8 : db $84, $40, $00, $02
#_1EA3BD: dw   0,   0 : db $8C, $40, $00, $02

#_1EA3C5: dw   0,  -7 : db $84, $00, $00, $02
#_1EA3CD: dw   0,   0 : db $8C, $00, $00, $02

#_1EA3D5: dw   0,   0 : db $8C, $40, $00, $02
#_1EA3DD: dw   0,  -6 : db $84, $40, $00, $02

#_1EA3E5: dw  -8,   0 : db $A0, $00, $00, $02
#_1EA3ED: dw   8,   0 : db $A0, $40, $00, $02

;---------------------------------------------------------------------------------------------------

.oam_group_set_2
#_1EA3F5: dw   0,  16 : db $B5, $00, $00, $00
#_1EA3FD: dw   8,  16 : db $B5, $40, $00, $00

#_1EA405: dw   0,  -8 : db $A5, $00, $00, $00
#_1EA40D: dw   8,  -8 : db $A5, $40, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Pengator:
#_1EA415: LDA.b #$00
#_1EA417: XBA
#_1EA418: LDA.w $0DC0,X

#_1EA41B: REP #$20

#_1EA41D: ASL A
#_1EA41E: ASL A
#_1EA41F: ASL A
#_1EA420: ASL A
#_1EA421: ADC.w #.oam_group_set_1
#_1EA424: STA.b $08

#_1EA426: SEP #$20

#_1EA428: LDA.b #$02
#_1EA42A: JSR SpriteDraw_Tabulated_Bank1E

#_1EA42D: LDY.b #$00

#_1EA42F: LDA.b #$00
#_1EA431: XBA

#_1EA432: LDA.w $0DC0,X
#_1EA435: CMP.b #$0E
#_1EA437: BEQ .draw_more

#_1EA439: INY

#_1EA43A: CMP.b #$13
#_1EA43C: BNE .draw_not_more

;---------------------------------------------------------------------------------------------------

.draw_more
#_1EA43E: TYA

#_1EA43F: REP #$20

#_1EA441: ASL A
#_1EA442: ASL A
#_1EA443: ASL A
#_1EA444: ASL A
#_1EA445: ADC.w #.oam_group_set_2
#_1EA448: STA.b $08

#_1EA44A: LDA.b $90
#_1EA44C: CLC
#_1EA44D: ADC.w #$0008
#_1EA450: STA.b $90

#_1EA452: INC.b $92
#_1EA454: INC.b $92

#_1EA456: SEP #$20

#_1EA458: LDA.b #$02
#_1EA45A: JSR SpriteDraw_Tabulated_Bank1E

;---------------------------------------------------------------------------------------------------

.draw_not_more
#_1EA45D: JSL SpriteDraw_Shadow_long

#_1EA461: RTS

;===================================================================================================

LaserBeam:
#_1EA462: JSL SpriteDraw_SingleSmall_long
#_1EA466: JSR Sprite_CheckIfActive_Bank1E

#_1EA469: JSR LaserBeam_BuildUpGarnish
#_1EA46C: JSR Sprite_Move_XY_Bank1E
#_1EA46F: JSL Sprite_CheckDamageToLink_same_layer_long

#_1EA473: LDA.w $0DF0,X
#_1EA476: BNE .exit

#_1EA478: JSR Sprite_CheckTileCollision_Bank1E
#_1EA47B: BEQ .exit

#_1EA47D: STZ.w $0DD0,X

#_1EA480: LDA.b #$26 ; SFX3.26
#_1EA482: JSL SpriteSFX_QueueSFX3WithPan

#_1EA486: RTS

.exit
#_1EA487: RTS

;===================================================================================================

LaserBeam_BuildUpGarnish:
#_1EA488: PHX
#_1EA489: TXY

#_1EA48A: LDX.b #$1D

.next_slot
#_1EA48C: LDA.l $7FF800,X
#_1EA490: BEQ .free_slot

#_1EA492: DEX
#_1EA493: BPL .next_slot

#_1EA495: DEC.w $0FF8
#_1EA498: BPL .use_indexer

#_1EA49A: LDA.b #$1D
#_1EA49C: STA.w $0FF8

.use_indexer
#_1EA49F: LDX.w $0FF8

;---------------------------------------------------------------------------------------------------

.free_slot
#_1EA4A2: LDA.b #$04 ; GARNISH 04
#_1EA4A4: STA.l $7FF800,X
#_1EA4A8: STA.w $0FB4

#_1EA4AB: LDA.w $0D10,Y
#_1EA4AE: STA.l $7FF83C,X

#_1EA4B2: LDA.w $0D30,Y
#_1EA4B5: STA.l $7FF878,X

#_1EA4B9: LDA.w $0D00,Y
#_1EA4BC: CLC
#_1EA4BD: ADC.b #$10
#_1EA4BF: STA.l $7FF81E,X

#_1EA4C3: LDA.w $0D20,Y
#_1EA4C6: ADC.b #$00
#_1EA4C8: STA.l $7FF85A,X

#_1EA4CC: LDA.b #$10
#_1EA4CE: STA.l $7FF90E,X

#_1EA4D2: LDA.w $0DC0,Y
#_1EA4D5: STA.l $7FF9FE,X

#_1EA4D9: TYA
#_1EA4DA: STA.l $7FF92C,X

#_1EA4DE: LDA.w $0F20,Y
#_1EA4E1: STA.l $7FF968,X

#_1EA4E5: PLX

#_1EA4E6: RTS

;===================================================================================================

SpritePrep_LaserEye:
#_1EA4E7: PHB
#_1EA4E8: PHK
#_1EA4E9: PLB

#_1EA4EA: JSR .main

#_1EA4ED: PLB

#_1EA4EE: RTL

;---------------------------------------------------------------------------------------------------

.offset
#_1EA4EF: db  -8,  8

;---------------------------------------------------------------------------------------------------

.main
#_1EA4F1: LDA.w $0E20,X
#_1EA4F4: CMP.b #$97 ; SPRITE 97
#_1EA4F6: BCC .horizontal

#_1EA4F8: LDA.w $0D10,X
#_1EA4FB: CLC
#_1EA4FC: ADC.b #$08
#_1EA4FE: STA.w $0D10,X

#_1EA501: LDA.w $0E20,X
#_1EA504: SEC
#_1EA505: SBC.b #$95
#_1EA507: STA.w $0DE0,X

#_1EA50A: TAY

#_1EA50B: LDA.w $0D10,X
#_1EA50E: AND.b #$10
#_1EA510: EOR.b #$10
#_1EA512: STA.w $0EB0,X

#_1EA515: BNE .dont_adjust_y

#_1EA517: LDA.w $0D00,X
#_1EA51A: CLC
#_1EA51B: ADC.w .offset-2,Y
#_1EA51E: STA.w $0D00,X

.dont_adjust_y
#_1EA521: RTS

;---------------------------------------------------------------------------------------------------

.horizontal
#_1EA522: LDA.w $0E20,X
#_1EA525: SEC
#_1EA526: SBC.b #$95
#_1EA528: STA.w $0DE0,X

#_1EA52B: TAY

#_1EA52C: LDA.w $0D00,X
#_1EA52F: AND.b #$10
#_1EA531: STA.w $0EB0,X

#_1EA534: BNE .dont_adjust_x

#_1EA536: LDA.w $0D10,X
#_1EA539: CLC
#_1EA53A: ADC.w .offset,Y
#_1EA53D: STA.w $0D10,X

.dont_adjust_x
#_1EA540: RTS

;===================================================================================================

Sprite_95_LaserEyeLeft:
Sprite_96_LaserEyeRight:
Sprite_97_LaserEyeTop:
Sprite_98_LaserEyeBottom:
#_1EA541: LDA.w $0D90,X
#_1EA544: BEQ LaserEye

#_1EA546: JMP.w LaserBeam

;===================================================================================================

LaserEye:
#_1EA549: JSR SpriteDraw_LaserEye
#_1EA54C: JSR Sprite_CheckIfActive_Bank1E

#_1EA54F: LDA.w $0D80,X
#_1EA552: JSL JumpTableLocal
#_1EA556: dw LaserEye_Reconnaissance
#_1EA558: dw LaserEye_TangoLocked

;===================================================================================================

pool LaserEye_Reconnaissance

.direction
#_1EA55A: db $02, $03, $00, $01

pool off

;---------------------------------------------------------------------------------------------------

LaserEye_Reconnaissance:
#_1EA55E: REP #$20

#_1EA560: LDA.b $20
#_1EA562: SEC
#_1EA563: SBC.w $0FDA
#_1EA566: STA.b $0C

#_1EA568: LDA.b $22
#_1EA56A: SEC
#_1EA56B: SBC.w $0FD8
#_1EA56E: STA.b $0E

#_1EA570: SEP #$20

#_1EA572: LDA.b $2F
#_1EA574: LSR A

;---------------------------------------------------------------------------------------------------

#_1EA575: LDY.w $0EB0,X
#_1EA578: CPY.b #$01

#_1EA57A: TAY

#_1EA57B: LDA.w $0DE0,X
#_1EA57E: BCS .ignore_direction

#_1EA580: CMP.w .direction,Y
#_1EA583: BNE .dont_fire

.ignore_direction
#_1EA585: CMP.b #$02

#_1EA587: REP #$20
#_1EA589: BCS .vertical

#_1EA58B: LDA.b $0C
#_1EA58D: BRA .continue

.vertical
#_1EA58F: LDA.b $0E

;---------------------------------------------------------------------------------------------------

.continue
#_1EA591: CLC
#_1EA592: ADC.w #$0010
#_1EA595: CMP.w #$0020

#_1EA598: SEP #$20
#_1EA59A: BCS .dont_fire

#_1EA59C: LDA.b #$20

#_1EA59E: LDY.w $0EB0,X
#_1EA5A1: BEQ .pointless_check

#_1EA5A3: LDA.b #$20

.pointless_check
#_1EA5A5: STA.w $0DF0,X

#_1EA5A8: INC.w $0D80,X

#_1EA5AB: RTS

.dont_fire
#_1EA5AC: STZ.w $0DC0,X

#_1EA5AF: RTS

;===================================================================================================

pool LaserEye_FireBeam

.offset_x_low ; bleeds into next
#_1EA5B0: db   12,   -4

.offset_y_low
#_1EA5B2: db    4,    4,   12,   -4

.offset_x_high ; bleeds into next
#_1EA5B6: db    0,   -1

.offset_y_high
#_1EA5B8: db    0,    0,    0,   -1

.speed_x ; bleeds into next
#_1EA5BC: db  112, -112

.speed_y
#_1EA5BE: db    0,    0,  112, -112

pool off

;---------------------------------------------------------------------------------------------------

LaserEye_TangoLocked:
#_1EA5C2: LDA.b #$01
#_1EA5C4: STA.w $0DC0,X

#_1EA5C7: LDA.w $0DF0,X
#_1EA5CA: BNE .cover_me_im_reloading

#_1EA5CC: STZ.w $0D80,X

#_1EA5CF: JSR LaserEye_FireBeam

#_1EA5D2: LDA.b #$0C
#_1EA5D4: STA.w $0F10,X

.cover_me_im_reloading
#_1EA5D7: RTS

;===================================================================================================

LaserEye_FireBeam:
#_1EA5D8: LDA.b #$95 ; SPRITE 95
#_1EA5DA: JSL Sprite_SpawnDynamically
#_1EA5DE: BMI .no_space

#_1EA5E0: PHX

#_1EA5E1: LDA.w $0DE0,X
#_1EA5E4: TAX

#_1EA5E5: AND.b #$02
#_1EA5E7: LSR A
#_1EA5E8: STA.w $0DC0,Y

#_1EA5EB: LDA.b $00
#_1EA5ED: CLC
#_1EA5EE: ADC.w .offset_x_low,X
#_1EA5F1: STA.w $0D10,Y

#_1EA5F4: LDA.b $01
#_1EA5F6: ADC.w .offset_x_high,X
#_1EA5F9: STA.w $0D30,Y

#_1EA5FC: LDA.b $02
#_1EA5FE: CLC
#_1EA5FF: ADC.w .offset_y_low,X
#_1EA602: STA.w $0D00,Y

#_1EA605: LDA.b $03
#_1EA607: ADC.w .offset_y_high,X
#_1EA60A: STA.w $0D20,Y

#_1EA60D: LDA.w .speed_x,X
#_1EA610: STA.w $0D50,Y

#_1EA613: LDA.w .speed_y,X
#_1EA616: STA.w $0D40,Y

#_1EA619: LDA.b #$20
#_1EA61B: STA.w $0E40,Y
#_1EA61E: STA.w $0D90,Y

#_1EA621: LDA.b #$05
#_1EA623: STA.w $0F50,Y

#_1EA626: LDA.b #$48
#_1EA628: STA.w $0CAA,Y
#_1EA62B: STA.w $0BA0,Y

#_1EA62E: LDA.b #$05
#_1EA630: STA.w $0DF0,Y

#_1EA633: LDA.l $7EF35A
#_1EA637: CMP.b #$03
#_1EA639: BNE .full_photon_jacket

#_1EA63B: LDA.b #$20
#_1EA63D: STA.w $0BE0,Y

.full_photon_jacket
#_1EA640: PLX

#_1EA641: LDA.b #$19 ; SFX3.19
#_1EA643: JSL SpriteSFX_QueueSFX3WithPan

.no_space
#_1EA647: RTS

;===================================================================================================

pool SpriteDraw_LaserEye

.oam_groups
#_1EA648: dw   8,  -4 : db $C8, $40, $00, $00
#_1EA650: dw   8,   4 : db $D8, $40, $00, $00
#_1EA658: dw   8,  12 : db $C8, $C0, $00, $00

#_1EA660: dw   8,  -4 : db $C9, $40, $00, $00
#_1EA668: dw   8,   4 : db $D9, $40, $00, $00
#_1EA670: dw   8,  12 : db $C9, $C0, $00, $00

#_1EA678: dw   0,  -4 : db $C8, $00, $00, $00
#_1EA680: dw   0,   4 : db $D8, $00, $00, $00
#_1EA688: dw   0,  12 : db $C8, $80, $00, $00

#_1EA690: dw   0,  -4 : db $C9, $00, $00, $00
#_1EA698: dw   0,   4 : db $D9, $00, $00, $00
#_1EA6A0: dw   0,  12 : db $C9, $80, $00, $00

#_1EA6A8: dw  -4,   8 : db $D6, $00, $00, $00
#_1EA6B0: dw   4,   8 : db $D7, $00, $00, $00
#_1EA6B8: dw  12,   8 : db $D6, $40, $00, $00

#_1EA6C0: dw  -4,   8 : db $C6, $00, $00, $00
#_1EA6C8: dw   4,   8 : db $C7, $00, $00, $00
#_1EA6D0: dw  12,   8 : db $C6, $40, $00, $00

#_1EA6D8: dw  -4,   0 : db $D6, $80, $00, $00
#_1EA6E0: dw   4,   0 : db $D7, $80, $00, $00
#_1EA6E8: dw  12,   0 : db $D6, $C0, $00, $00

#_1EA6F0: dw  -4,   0 : db $C6, $80, $00, $00
#_1EA6F8: dw   4,   0 : db $C7, $80, $00, $00
#_1EA700: dw  12,   0 : db $C6, $C0, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_LaserEye:
#_1EA708: LDA.w $0EB0,X
#_1EA70B: BEQ .continue

#_1EA70D: LDA.b #$01
#_1EA70F: STA.w $0DC0,X

#_1EA712: LDA.w $0F10,X
#_1EA715: BEQ .continue

#_1EA717: STZ.w $0DC0,X

.continue
#_1EA71A: LDA.b #$30
#_1EA71C: STA.w $0B89,X

#_1EA71F: LDA.b #$00
#_1EA721: XBA
#_1EA722: LDA.w $0DE0,X

#_1EA725: ASL A
#_1EA726: ADC.w $0DC0,X

#_1EA729: REP #$20

#_1EA72B: ASL A
#_1EA72C: ASL A
#_1EA72D: ASL A

#_1EA72E: STA.b $00

#_1EA730: ASL A
#_1EA731: ADC.b $00
#_1EA733: ADC.w #.oam_groups

#_1EA736: STA.b $08

#_1EA738: SEP #$20

#_1EA73A: LDA.b #$03
#_1EA73C: JMP.w SpriteDraw_Tabulated_Bank1E

;===================================================================================================

Sprite_94_Tile_bounce:
#_1EA73F: JMP.w Sprite_94_Tile

;---------------------------------------------------------------------------------------------------

Sprite_94_Pirogusu:
#_1EA742: LDA.w $0E90,X
#_1EA745: BNE Sprite_94_Tile_bounce

#_1EA747: LDA.w $0B89,X
#_1EA74A: ORA.b #$30
#_1EA74C: STA.w $0B89,X

#_1EA74F: JSR SpriteDraw_Pirogusu
#_1EA752: JSR Sprite_CheckIfActive_Bank1E

#_1EA755: LDA.w $0D80,X
#_1EA758: JSL JumpTableLocal
#_1EA75C: dw Pirogusu_InHole
#_1EA75E: dw Pirogusu_Crowning
#_1EA760: dw Pirogusu_Plop
#_1EA762: dw Pirogusu_Active

;===================================================================================================

pool Pirogusu_InHole

.anim_step
#_1EA764: db $02, $03, $00, $01

pool off

;---------------------------------------------------------------------------------------------------

Pirogusu_InHole:
#_1EA768: LDA.w $0DF0,X
#_1EA76B: BNE .wait_for_timer

#_1EA76D: INC.w $0D80,X
#_1EA770: LDA.b #$1F
#_1EA772: STA.w $0DF0,X

.wait_for_timer
#_1EA775: STA.w $0BA0,X

#_1EA778: LDY.w $0DE0,X

#_1EA77B: LDA.w .anim_step,Y
#_1EA77E: STA.w $0D90,X

#_1EA781: RTS

;===================================================================================================

pool Pirogusu_Crowning

.anim
#_1EA782: db $09, $0B, $05, $07, $05, $0B, $07, $09

.speed_y
#_1EA78A: db  0,  0 ; bleeds into next

.speed_x
#_1EA78C: db  4, -4,  0,  0

pool off

;---------------------------------------------------------------------------------------------------

Pirogusu_Crowning:
#_1EA790: LDA.w $0DF0,X
#_1EA793: BNE .push_push

#_1EA795: INC.w $0D80,X

#_1EA798: LDA.b #$20
#_1EA79A: STA.w $0DF0,X

#_1EA79D: STZ.w $0BA0,X

#_1EA7A0: JSR Sprite_ZeroVelocity_XY_Bank1E

#_1EA7A3: RTS

.push_push
#_1EA7A4: LDA.w $0DE0,X
#_1EA7A7: ASL A
#_1EA7A8: STA.b $00

#_1EA7AA: LDA.w $0DF0,X
#_1EA7AD: LSR A
#_1EA7AE: LSR A
#_1EA7AF: LSR A
#_1EA7B0: AND.b #$01
#_1EA7B2: ORA.b $00
#_1EA7B4: TAY

#_1EA7B5: LDA.w .anim,Y
#_1EA7B8: STA.w $0D90,X

#_1EA7BB: LDY.w $0DE0,X

#_1EA7BE: LDA.w .speed_x,Y
#_1EA7C1: STA.w $0D50,X

#_1EA7C4: LDA.w .speed_y,Y
#_1EA7C7: STA.w $0D40,X

#_1EA7CA: JSR Sprite_Move_XY_Bank1E

#_1EA7CD: RTS

;===================================================================================================

pool Pirogusu_Animate

.anim_step
#_1EA7CE: db $10, $11, $12, $13, $0C, $0D, $0E, $0F

pool off

;===================================================================================================

pool Pirogusu_Plop

.acceleration_x
#_1EA7D6: db  2, -2 ; bleeds into next

.acceleration_y
#_1EA7D8: db  0,  0,  2, -2

pool off

;---------------------------------------------------------------------------------------------------

Pirogusu_Plop:
#_1EA7DC: JSR Sprite_CheckDamageToAndFromLink_Bank1E
#_1EA7DF: JSR Sprite_Move_XY_Bank1E

#_1EA7E2: LDY.w $0DE0,X

#_1EA7E5: LDA.w $0D50,X
#_1EA7E8: CLC
#_1EA7E9: ADC.w .acceleration_x,Y
#_1EA7EC: STA.w $0D50,X

#_1EA7EF: LDA.w $0D40,X
#_1EA7F2: CLC
#_1EA7F3: ADC.w .acceleration_y,Y
#_1EA7F6: STA.w $0D40,X

#_1EA7F9: LDA.w $0DF0,X
#_1EA7FC: BNE Pirogusu_Animate

#_1EA7FE: JSL Sprite_SpawnSmallSplash

#_1EA802: LDA.b #$10
#_1EA804: STA.w $0E00,X

#_1EA807: INC.w $0D80,X

;===================================================================================================

Pirogusu_Animate:
#_1EA80A: LDA.w $0DE0,X
#_1EA80D: ASL A
#_1EA80E: STA.b $00

#_1EA810: LDA.b $1A
#_1EA812: AND.b #$04
#_1EA814: LSR A
#_1EA815: LSR A

#_1EA816: ORA.b $00
#_1EA818: TAY

#_1EA819: LDA.w .anim_step,Y
#_1EA81C: STA.w $0D90,X

#_1EA81F: RTS

;===================================================================================================

Sprite_SpawnSmallSplash:
#_1EA820: LDA.b #$EC ; SPRITE EC
#_1EA822: LDY.b #$0E
#_1EA824: JSL Sprite_SpawnDynamically_slot_limited
#_1EA828: BMI .no_space

#_1EA82A: JSL Sprite_SetSpawnedCoordinates

#_1EA82E: STZ.w $012E

#_1EA831: LDA.b #$28 ; SFX2.28
#_1EA833: JSL SpriteSFX_QueueSFX2WithPan

#_1EA837: LDA.b #$03
#_1EA839: STA.w $0DD0,Y

#_1EA83C: LDA.b #$0F
#_1EA83E: STA.w $0DF0,Y

#_1EA841: LDA.b #$00
#_1EA843: STA.w $0D80,Y

#_1EA846: LDA.b #$03
#_1EA848: STA.w $0E40,Y

.no_space
#_1EA84B: RTL

;===================================================================================================

pool Pirogusu_Active

.speed_x ; bleeds into next
#_1EA84C: db  24, -24

.speed_y
#_1EA84E: db   0,   0,  24, -24

pool off

;---------------------------------------------------------------------------------------------------

Pirogusu_Active:
#_1EA852: JSR Sprite_CheckIfRecoiling_Bank1E
#_1EA855: JSR Sprite_CheckDamageToAndFromLink_Bank1E
#_1EA858: JSR Pirogusu_Animate

#_1EA85B: CLC
#_1EA85C: ADC.b #$08
#_1EA85E: STA.w $0D90,X

#_1EA861: LDA.w $0E00,X
#_1EA864: BNE .exit

#_1EA866: JSR Pirogusu_SpawnSplash
#_1EA869: JSR Sprite_Move_XY_Bank1E
#_1EA86C: JSR Sprite_CheckTileCollision_Bank1E

#_1EA86F: AND.b #$0F
#_1EA871: BEQ .no_collision

#_1EA873: JSL GetRandomNumber
#_1EA877: LSR A

#_1EA878: LDA.w $0DE0,X
#_1EA87B: ROL A
#_1EA87C: TAY

#_1EA87D: LDA.w SharedDirections_Nice,Y
#_1EA880: STA.w $0DE0,X

.no_collision
#_1EA883: LDY.w $0DE0,X

#_1EA886: LDA.w .speed_x,Y
#_1EA889: STA.w $0D50,X

#_1EA88C: LDA.w .speed_y,Y
#_1EA88F: STA.w $0D40,X

.exit
#_1EA892: RTS

;===================================================================================================

pool Pirogusu_SpawnSplash

.offset
#_1EA893: db $03, $04, $05, $04

pool off

;---------------------------------------------------------------------------------------------------

Pirogusu_SpawnSplash:
#_1EA897: TXA
#_1EA898: EOR.b $1A
#_1EA89A: AND.b #$03
#_1EA89C: BNE .exit

#_1EA89E: JSL GetRandomNumber
#_1EA8A2: AND.b #$03
#_1EA8A4: TAY

#_1EA8A5: LDA.w .offset,Y
#_1EA8A8: STA.b $00

#_1EA8AA: JSL GetRandomNumber
#_1EA8AE: AND.b #$03
#_1EA8B0: TAY

#_1EA8B1: LDA.w .offset,Y
#_1EA8B4: STA.b $01

#_1EA8B6: PHX
#_1EA8B7: TXY

#_1EA8B8: LDX.b #$0E

.next_slot
#_1EA8BA: LDA.l $7FF800,X
#_1EA8BE: BEQ .free_slot

#_1EA8C0: DEX
#_1EA8C1: BPL .next_slot

#_1EA8C3: PLX

.exit
#_1EA8C4: RTS

;---------------------------------------------------------------------------------------------------

.free_slot
#_1EA8C5: LDA.b #$0B ; GARNISH 0B
#_1EA8C7: STA.l $7FF800,X
#_1EA8CB: STA.w $0FB4

#_1EA8CE: LDA.w $0D10,Y
#_1EA8D1: CLC
#_1EA8D2: ADC.b $00
#_1EA8D4: STA.l $7FF83C,X

#_1EA8D8: LDA.w $0D30,Y
#_1EA8DB: ADC.b #$00
#_1EA8DD: STA.l $7FF878,X

#_1EA8E1: LDA.w $0D00,Y
#_1EA8E4: CLC
#_1EA8E5: ADC.b #$10

#_1EA8E7: PHP

#_1EA8E8: CLC
#_1EA8E9: ADC.b $01
#_1EA8EB: STA.l $7FF81E,X

#_1EA8EF: LDA.w $0D20,Y
#_1EA8F2: ADC.b #$00

#_1EA8F4: PLP

#_1EA8F5: ADC.b #$00
#_1EA8F7: STA.l $7FF85A,X

#_1EA8FB: LDA.b #$0F
#_1EA8FD: STA.l $7FF90E,X

#_1EA901: PLX

#_1EA902: RTS

;===================================================================================================

pool SpriteDraw_Pirogusu

.flip
#_1EA903: db $00, $80, $40, $00, $00, $00, $00
#_1EA90A: db $80, $80, $C0, $40, $40, $00, $40
#_1EA911: db $80, $C0, $40, $C0, $00, $80, $00
#_1EA918: db $40, $80, $C0, $40, $C0, $00, $80

.anim_step
#_1EA91F: db $00, $00, $01, $01, $02, $03, $04
#_1EA926: db $03, $02, $03, $04, $03, $05, $05
#_1EA92D: db $05, $05, $07, $07, $07, $07, $06
#_1EA934: db $06, $06, $06, $08, $08, $08, $08

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Pirogusu:
#_1EA93B: LDY.w $0D90,X

#_1EA93E: LDA.w $0F50,X
#_1EA941: AND.b #$3F
#_1EA943: ORA.w .flip,Y
#_1EA946: STA.w $0F50,X

#_1EA949: LDA.w .anim_step,Y
#_1EA94C: STA.w $0DC0,X

#_1EA94F: CPY.b #$04
#_1EA951: BCS .fully_visible

#_1EA953: LDA.w $0FD8
#_1EA956: CLC
#_1EA957: ADC.b #$04
#_1EA959: STA.w $0FD8

#_1EA95C: LDA.w $0FD9
#_1EA95F: ADC.b #$00
#_1EA961: STA.w $0FD9

#_1EA964: LDA.w $0FDA
#_1EA967: CLC
#_1EA968: ADC.b #$04
#_1EA96A: STA.w $0FDA

#_1EA96D: LDA.w $0FDB
#_1EA970: ADC.b #$00
#_1EA972: STA.w $0FDB

#_1EA975: JSL SpriteDraw_SingleSmall_long

#_1EA979: RTS

.fully_visible
#_1EA97A: JSL SpriteDraw_SingleLarge_long

#_1EA97E: RTS

;===================================================================================================

pool Sprite_93_Bumper

.recoil_speed
#_1EA97F: db 0,  2, -2

pool off

;---------------------------------------------------------------------------------------------------

Sprite_93_Bumper:
#_1EA982: JSR SpriteDraw_Bumper
#_1EA985: JSR Sprite_CheckIfActive_Bank1E
#_1EA988: JSR Sprite_CheckTileCollision_Bank1E

#_1EA98B: LDA.b $55
#_1EA98D: BNE .dont_boing_link

#_1EA98F: JSL Sprite_CheckDamageToLink_same_layer_long
#_1EA993: BCC .dont_boing_link

#_1EA995: JSL Link_CancelDash_long

#_1EA999: LDA.b #$20
#_1EA99B: STA.w $0DF0,X

#_1EA99E: LDA.b #$30
#_1EA9A0: JSL Sprite_ProjectSpeedTowardsLink_long

#_1EA9A4: LDA.b $F0
#_1EA9A6: LSR A
#_1EA9A7: LSR A
#_1EA9A8: AND.b #$03
#_1EA9AA: TAY

#_1EA9AB: LDA.b $00
#_1EA9AD: CLC
#_1EA9AE: ADC.w .recoil_speed,Y
#_1EA9B1: STA.b $27

#_1EA9B3: LDA.b $F0
#_1EA9B5: AND.b #$03
#_1EA9B7: TAY

#_1EA9B8: LDA.b $01
#_1EA9BA: CLC
#_1EA9BB: ADC.w .recoil_speed,Y
#_1EA9BE: STA.b $28

#_1EA9C0: LDA.b #$14
#_1EA9C2: STA.b $46

#_1EA9C4: PHX

#_1EA9C5: JSL Link_ResetSwimmingState

#_1EA9C9: PLX

#_1EA9CA: LDA.b #$32 ; SFX3.32
#_1EA9CC: JSL SpriteSFX_QueueSFX3WithPan

;---------------------------------------------------------------------------------------------------

.dont_boing_link
#_1EA9D0: LDY.b #$0F

.next_sprite
#_1EA9D2: TYA
#_1EA9D3: EOR.b $1A
#_1EA9D5: AND.b #$03
#_1EA9D7: ORA.w $0F70,Y
#_1EA9DA: BNE .dont_boing_sprite

#_1EA9DC: LDA.w $0DD0,Y
#_1EA9DF: CMP.b #$09
#_1EA9E1: BCC .dont_boing_sprite

#_1EA9E3: LDA.w $0E60,Y
#_1EA9E6: ORA.w $0F60,Y
#_1EA9E9: AND.b #$40
#_1EA9EB: BNE .dont_boing_sprite

#_1EA9ED: LDA.w $0D10,Y
#_1EA9F0: STA.b $04

#_1EA9F2: LDA.w $0D30,Y
#_1EA9F5: STA.b $05

#_1EA9F7: LDA.w $0D00,Y
#_1EA9FA: STA.b $06

#_1EA9FC: LDA.w $0D20,Y
#_1EA9FF: STA.b $07

#_1EAA01: REP #$20

#_1EAA03: LDA.w $0FD8
#_1EAA06: SEC
#_1EAA07: SBC.b $04
#_1EAA09: CLC
#_1EAA0A: ADC.w #$0010

#_1EAA0D: CMP.w #$0020
#_1EAA10: BCS .dont_boing_sprite

#_1EAA12: LDA.w $0FDA
#_1EAA15: SEC
#_1EAA16: SBC.b $06
#_1EAA18: CLC
#_1EAA19: ADC.w #$0010

#_1EAA1C: CMP.w #$0020
#_1EAA1F: BCS .dont_boing_sprite

#_1EAA21: SEP #$20

#_1EAA23: LDA.b #$0F
#_1EAA25: STA.w $0EA0,Y

#_1EAA28: PHY

#_1EAA29: LDA.b #$40
#_1EAA2B: JSL Sprite_ProjectSpeedTowardsLocation_long

#_1EAA2F: PLY

#_1EAA30: LDA.b $00
#_1EAA32: STA.w $0F30,Y

#_1EAA35: LDA.b $01
#_1EAA37: STA.w $0F40,Y

#_1EAA3A: LDA.b #$20
#_1EAA3C: STA.w $0DF0,X

#_1EAA3F: LDA.b #$32 ; SFX3.32
#_1EAA41: JSL SpriteSFX_QueueSFX3WithPan

.dont_boing_sprite
#_1EAA45: SEP #$20

#_1EAA47: DEY
#_1EAA48: BPL .next_sprite

#_1EAA4A: RTS

;===================================================================================================

pool SpriteDraw_Bumper

.oam_groups
#_1EAA4B: dw  -8,  -8 : db $EC, $00, $00, $02
#_1EAA53: dw   8,  -8 : db $EC, $40, $00, $02
#_1EAA5B: dw  -8,   8 : db $EC, $80, $00, $02
#_1EAA63: dw   8,   8 : db $EC, $C0, $00, $02

#_1EAA6B: dw  -7,  -7 : db $EC, $00, $00, $02
#_1EAA73: dw   7,  -7 : db $EC, $40, $00, $02
#_1EAA7B: dw  -7,   7 : db $EC, $80, $00, $02
#_1EAA83: dw   7,   7 : db $EC, $C0, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Bumper:
#_1EAA8B: LDA.b #$00
#_1EAA8D: XBA
#_1EAA8E: LDA.w $0DF0,X

#_1EAA91: LSR A
#_1EAA92: AND.b #$01

#_1EAA94: REP #$20

#_1EAA96: ASL A
#_1EAA97: ASL A
#_1EAA98: ASL A
#_1EAA99: ASL A
#_1EAA9A: ASL A

#_1EAA9B: ADC.w #.oam_groups
#_1EAA9E: STA.b $08

#_1EAAA0: SEP #$20

#_1EAAA2: LDA.b #$04
#_1EAAA4: JMP.w SpriteDraw_Tabulated_Bank1E

;===================================================================================================

Sprite_91_StalfosKnight:
#_1EAAA7: LDA.w $0D80,X
#_1EAAAA: BNE .dropped

#_1EAAAC: JSL Sprite_PrepOAMCoord_long
#_1EAAB0: BRA .continue

.dropped
#_1EAAB2: JSR SpriteDraw_StalfosKnight

.continue
#_1EAAB5: JSR Sprite_CheckIfActive_Bank1E

#_1EAAB8: LDA.w $0EF0,X
#_1EAABB: AND.b #$7F
#_1EAABD: CMP.b #$01
#_1EAABF: BNE .not_collapsed

#_1EAAC1: STZ.w $0EF0,X

#_1EAAC4: LDA.b #$06
#_1EAAC6: STA.w $0D80,X

#_1EAAC9: LDA.b #$FF
#_1EAACB: STA.w $0DF0,X

#_1EAACE: STZ.w $0D50,X
#_1EAAD1: STZ.w $0D40,X

#_1EAAD4: LDA.b #$02
#_1EAAD6: STA.l $7F6918

.not_collapsed
#_1EAADA: JSR Sprite_CheckIfRecoiling_Bank1E

#_1EAADD: LDA.w $0D80,X
#_1EAAE0: JSL JumpTableLocal
#_1EAAE4: dw StalfosKnight_Hidden
#_1EAAE6: dw StalfosKnight_EnterBattle
#_1EAAE8: dw StalfosKnight_Idle
#_1EAAEA: dw StalfosKnight_ScanForOpponents
#_1EAAEC: dw StalfosKnight_Squat
#_1EAAEE: dw StalfosKnight_HopAround
#_1EAAF0: dw StalfosKnight_Crumble
#_1EAAF2: dw StalfosKnight_CelebrateStandingUp

;===================================================================================================

StalfosKnight_Hidden:
#_1EAAF4: LDA.b #$09
#_1EAAF6: STA.w $0F60,X
#_1EAAF9: STA.w $0BA0,X

#_1EAAFC: LDA.w $0E40,X
#_1EAAFF: PHA

#_1EAB00: ORA.b #$80
#_1EAB02: STA.w $0E40,X

#_1EAB05: JSR Sprite_CheckDamageToLink_Bank1E

#_1EAB08: PLA
#_1EAB09: STA.w $0E40,X

#_1EAB0C: BCC .exit

#_1EAB0E: LDA.b #$90
#_1EAB10: STA.w $0F70,X

#_1EAB13: INC.w $0D80,X

#_1EAB16: LDA.b #$02
#_1EAB18: STA.w $0EB0,X

#_1EAB1B: LDA.b #$02
#_1EAB1D: STA.w $0DC0,X

#_1EAB20: LDA.b #$20 ; SFX2.20
#_1EAB22: JSL SpriteSFX_QueueSFX2WithPan

.exit
#_1EAB26: RTS

;===================================================================================================

StalfosKnight_EnterBattle:
#_1EAB27: LDA.w $0F70,X
#_1EAB2A: PHA

#_1EAB2B: JSR Sprite_Move_Z_Bank1E

#_1EAB2E: LDA.w $0F80,X
#_1EAB31: CMP.b #$C0
#_1EAB33: BMI .at_max_speed

#_1EAB35: SEC
#_1EAB36: SBC.b #$03
#_1EAB38: STA.w $0F80,X

.at_max_speed
#_1EAB3B: PLA
#_1EAB3C: EOR.w $0F70,X
#_1EAB3F: BPL .exit

#_1EAB41: LDA.w $0F70,X
#_1EAB44: BPL .exit

;===================================================================================================

#StalfosKnight_EnterIdleState:
#_1EAB46: LDA.b #$02
#_1EAB48: STA.w $0D80,X

#_1EAB4B: STZ.w $0BA0,X
#_1EAB4E: STZ.w $0F70,X
#_1EAB51: STZ.w $0F80,X

#_1EAB54: LDA.b #$3F
#_1EAB56: STA.w $0DF0,X

.exit
#_1EAB59: RTS

;===================================================================================================

pool StalfosKnight_Idle

.anim_step
#_1EAB5A: db $00, $01

pool off

;---------------------------------------------------------------------------------------------------

StalfosKnight_Idle:
#_1EAB5C: LDA.b #$00
#_1EAB5E: STA.l $7F6918

#_1EAB62: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1EAB65: LDA.w $0DF0,X
#_1EAB68: BNE .delay

#_1EAB6A: LDA.b #$03
#_1EAB6C: STA.w $0D80,X

#_1EAB6F: JSL GetRandomNumber
#_1EAB73: AND.b #$3F
#_1EAB75: STA.w $0DA0,X

#_1EAB78: LDA.b #$7F
#_1EAB7A: STA.w $0DF0,X

#_1EAB7D: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_1EAB7E: LSR A
#_1EAB7F: LSR A
#_1EAB80: LSR A
#_1EAB81: LSR A
#_1EAB82: LSR A

#_1EAB83: TAY

#_1EAB84: LDA.w .anim_step,Y
#_1EAB87: STA.w $0DC0,X

#_1EAB8A: LDA.w .anim_step,Y
#_1EAB8D: STA.w $0DB0,X

#_1EAB90: LDA.b #$02
#_1EAB92: STA.w $0EB0,X

#_1EAB95: RTS

;===================================================================================================

pool StalfosKnight_ScanForOpponents

.head_direction
#_1EAB96: db $00, $00, $00, $02, $01, $01, $01, $02
#_1EAB9E: db $00, $00, $00, $02, $01, $01, $01, $02

pool off

;---------------------------------------------------------------------------------------------------

StalfosKnight_ScanForOpponents:
#_1EABA6: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1EABA9: LDA.w $0DF0,X
#_1EABAC: CMP.w $0DA0,X
#_1EABAF: BNE .delay

#_1EABB1: JSR Sprite_IsRightOfLink_Bank1E
#_1EABB4: TYA
#_1EABB5: STA.w $0EB0,X

#_1EABB8: INC.w $0D80,X

#_1EABBB: LDA.b #$20
#_1EABBD: STA.w $0DF0,X

#_1EABC0: RTS

.delay
#_1EABC1: LSR A
#_1EABC2: LSR A
#_1EABC3: LSR A
#_1EABC4: TAY

#_1EABC5: LDA.w .head_direction,Y
#_1EABC8: STA.w $0EB0,X

#_1EABCB: LDA.b #$00
#_1EABCD: STA.w $0DB0,X

#_1EABD0: LDA.b #$00
#_1EABD2: STA.w $0DC0,X

#_1EABD5: RTS

;===================================================================================================

StalfosKnight_Squat:
#_1EABD6: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1EABD9: LDA.w $0DF0,X
#_1EABDC: BNE StalfosKnight_PrepJump

#_1EABDE: INC.w $0D80,X

#_1EABE1: LDA.b #$FF
#_1EABE3: STA.w $0DF0,X

#_1EABE6: LDA.b #$20
#_1EABE8: STA.w $0E00,X

;===================================================================================================

StalfosKnight_PrepJump:
#_1EABEB: LDA.b #$01
#_1EABED: STA.w $0DB0,X

#_1EABF0: LDA.b #$01
#_1EABF2: STA.w $0DC0,X

#_1EABF5: RTS

;===================================================================================================

StalfosKnight_HopAround:
#_1EABF6: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1EABF9: LDA.w $0E00,X
#_1EABFC: BEQ .still_jumping

#_1EABFE: DEC A
#_1EABFF: BNE .dont_change_direction

#_1EAC01: LDA.b #$30
#_1EAC03: STA.w $0F80,X

#_1EAC06: LDA.b #$10
#_1EAC08: JSL Sprite_ApplySpeedTowardsLink_long

#_1EAC0C: JSR Sprite_IsRightOfLink_Bank1E
#_1EAC0F: TYA
#_1EAC10: STA.w $0EB0,X

#_1EAC13: LDA.b #$13 ; SFX3.13
#_1EAC15: JSL SpriteSFX_QueueSFX3WithPan

.dont_change_direction
#_1EAC19: BRA StalfosKnight_PrepJump

;---------------------------------------------------------------------------------------------------

.still_jumping
#_1EAC1B: JSR Sprite_Move_XYZ_Bank1E
#_1EAC1E: JSR Sprite_CheckTileCollision_Bank1E

#_1EAC21: LDA.w $0F80,X
#_1EAC24: CMP.b #$C0
#_1EAC26: BMI .at_max_ascending_speed

#_1EAC28: SEC
#_1EAC29: SBC.b #$02
#_1EAC2B: STA.w $0F80,X

.at_max_ascending_speed
#_1EAC2E: LDA.w $0F70,X
#_1EAC31: DEC A
#_1EAC32: BPL .airborne

#_1EAC34: STZ.w $0F70,X
#_1EAC37: STZ.w $0F80,X

#_1EAC3A: LDA.w $0DF0,X
#_1EAC3D: BNE .bounce_again

#_1EAC3F: JMP.w StalfosKnight_EnterIdleState

;---------------------------------------------------------------------------------------------------

.bounce_again
#_1EAC42: LDA.b #$10
#_1EAC44: STA.w $0E00,X

.airborne
#_1EAC47: LDY.b #$02

#_1EAC49: LDA.w $0F80,X
#_1EAC4C: CMP.b #$18
#_1EAC4E: BMI .at_max_descending_speed

#_1EAC50: LDY.b #$00

.at_max_descending_speed
#_1EAC52: TYA
#_1EAC53: STA.w $0DC0,X

#_1EAC56: RTS

;===================================================================================================

pool StalfosKnight_Crumble

.head_anim
#_1EAC57: db $00, $04, $08, $0C, $0E, $0E, $0E, $0E
#_1EAC5F: db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
#_1EAC67: db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
#_1EAC6F: db $0E, $0E, $0F, $0E, $0C, $08, $04, $00

pool off

;---------------------------------------------------------------------------------------------------

StalfosKnight_Crumble:
#_1EAC77: JSR Sprite_Move_XYZ_Bank1E
#_1EAC7A: JSR Sprite_CheckTileCollision_Bank1E

#_1EAC7D: LDA.w $0F80,X
#_1EAC80: CMP.b #$C0
#_1EAC82: BMI .at_max_speed

#_1EAC84: SEC
#_1EAC85: SBC.b #$02
#_1EAC87: STA.w $0F80,X

.at_max_speed
#_1EAC8A: LDA.w $0F70,X
#_1EAC8D: DEC A
#_1EAC8E: BPL .head_aloft

#_1EAC90: STZ.w $0F70,X
#_1EAC93: STZ.w $0F80,X

.head_aloft
#_1EAC96: LDA.w $0DF0,X
#_1EAC99: BNE .still_animating

#_1EAC9B: JSL GetRandomNumber
#_1EAC9F: AND.b #$01
#_1EACA1: BNE .dont_celebrate_its_not_a_big_deal

#_1EACA3: LDA.b #$07
#_1EACA5: STA.w $0D80,X

#_1EACA8: LDA.b #$50
#_1EACAA: STA.w $0DF0,X

#_1EACAD: RTS

.dont_celebrate_its_not_a_big_deal
#_1EACAE: JMP.w StalfosKnight_EnterIdleState

;---------------------------------------------------------------------------------------------------

.still_animating
#_1EACB1: CMP.b #$E0
#_1EACB3: BCC .no_sfx

#_1EACB5: PHA
#_1EACB6: AND.b #$03
#_1EACB8: BNE .dont_do_sfx

#_1EACBA: LDA.b #$14 ; SFX3.14
#_1EACBC: JSL SpriteSFX_QueueSFX3WithPan

.dont_do_sfx
#_1EACC0: PLA

.no_sfx
#_1EACC1: LSR A
#_1EACC2: LSR A
#_1EACC3: LSR A
#_1EACC4: TAY

#_1EACC5: LDA.w .head_anim,Y
#_1EACC8: STA.w $0DB0,X

#_1EACCB: LDA.b #$03
#_1EACCD: STA.w $0DC0,X

#_1EACD0: LDA.b #$02
#_1EACD2: STA.w $0EB0,X

#_1EACD5: RTS

;===================================================================================================

pool StalfosKnight_CelebrateStandingUp

.anim_state
#_1EACD6: db $01, $04

pool off

;---------------------------------------------------------------------------------------------------

StalfosKnight_CelebrateStandingUp:
#_1EACD8: LDA.w $0DF0,X
#_1EACDB: BNE .still_celebrating

#_1EACDD: JMP.w StalfosKnight_EnterIdleState

.still_celebrating
#_1EACE0: LSR A
#_1EACE1: LSR A
#_1EACE2: AND.b #$01
#_1EACE4: TAY

#_1EACE5: LDA.w .anim_state,Y
#_1EACE8: STA.w $0DC0,X

#_1EACEB: RTS

;===================================================================================================

pool SpriteDraw_StalfosKnight

.oam_groups
#_1EACEC: dw  -4,  -8 : db $64, $00, $00, $00
#_1EACF4: dw  -4,   0 : db $61, $00, $00, $02
#_1EACFC: dw   4,   0 : db $62, $00, $00, $02
#_1EAD04: dw  -3,  16 : db $74, $00, $00, $00
#_1EAD0C: dw  11,  16 : db $74, $40, $00, $00

#_1EAD14: dw  -4,  -7 : db $64, $00, $00, $00
#_1EAD1C: dw  -4,   1 : db $61, $00, $00, $02
#_1EAD24: dw   4,   1 : db $62, $00, $00, $02
#_1EAD2C: dw  -3,  16 : db $65, $00, $00, $00
#_1EAD34: dw  11,  16 : db $65, $40, $00, $00

#_1EAD3C: dw  -4,  -8 : db $48, $00, $00, $02
#_1EAD44: dw   4,  -8 : db $49, $00, $00, $02
#_1EAD4C: dw  -4,   8 : db $4B, $00, $00, $02
#_1EAD54: dw   4,   8 : db $4C, $00, $00, $02
#_1EAD5C: dw   4,   8 : db $4C, $00, $00, $02

#_1EAD64: dw  -4,   8 : db $68, $00, $00, $02
#_1EAD6C: dw   4,   8 : db $69, $00, $00, $02
#_1EAD74: dw   4,   8 : db $69, $00, $00, $02
#_1EAD7C: dw   4,   8 : db $69, $00, $00, $02
#_1EAD84: dw   4,   8 : db $69, $00, $00, $02

#_1EAD8C: dw  12,  -7 : db $64, $40, $00, $00
#_1EAD94: dw  -4,   1 : db $62, $40, $00, $02
#_1EAD9C: dw   4,   1 : db $61, $40, $00, $02
#_1EADA4: dw  -3,  16 : db $65, $00, $00, $00
#_1EADAC: dw  11,  16 : db $65, $40, $00, $00

#_1EADB4: dw  12,  -8 : db $64, $40, $00, $00
#_1EADBC: dw  -4,   0 : db $62, $40, $00, $02
#_1EADC4: dw   4,   0 : db $61, $40, $00, $02
#_1EADCC: dw  -3,  16 : db $74, $00, $00, $00
#_1EADD4: dw  11,  16 : db $74, $40, $00, $00

#_1EADDC: dw  -4,  -8 : db $49, $40, $00, $02
#_1EADE4: dw   4,  -8 : db $48, $40, $00, $02
#_1EADEC: dw  -4,   8 : db $4C, $40, $00, $02
#_1EADF4: dw   4,   8 : db $4B, $40, $00, $02
#_1EADFC: dw   4,   8 : db $4B, $40, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_StalfosKnight:
#_1EAE04: JSR Sprite_PrepOAMCoord_Bank1E
#_1EAE07: JSR SpriteDraw_StalfosKnight_Head

#_1EAE0A: LDA.b #$00
#_1EAE0C: XBA
#_1EAE0D: LDA.w $0DC0,X

#_1EAE10: REP #$20

#_1EAE12: ASL A
#_1EAE13: ASL A
#_1EAE14: ASL A
#_1EAE15: STA.b $00

#_1EAE17: ASL A
#_1EAE18: ASL A
#_1EAE19: ADC.b $00

#_1EAE1B: ADC.w #.oam_groups
#_1EAE1E: STA.b $08

#_1EAE20: LDA.b $90
#_1EAE22: CLC
#_1EAE23: ADC.w #$0004
#_1EAE26: STA.b $90

#_1EAE28: INC.b $92

#_1EAE2A: SEP #$20

#_1EAE2C: LDA.b #$05
#_1EAE2E: JSR SpriteDraw_Tabulated_Bank1E

#_1EAE31: REP #$20

#_1EAE33: LDA.b $90
#_1EAE35: SEC
#_1EAE36: SBC.w #$0004
#_1EAE39: STA.b $90

#_1EAE3B: DEC.b $92

#_1EAE3D: SEP #$20

#_1EAE3F: LDA.b #$12
#_1EAE41: JSL SpriteDraw_Shadow_custom_long

#_1EAE45: RTS

;===================================================================================================

pool SpriteDraw_StalfosKnight_Head

.head_char
#_1EAE46: db $66, $66, $46, $46

.head_flip
#_1EAE4A: db $40, $00, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_StalfosKnight_Head:
#_1EAE4E: LDA.w $0DC0,X
#_1EAE51: CMP.b #$02
#_1EAE53: BEQ .head_part_of_body_chars

#_1EAE55: LDA.w $0DB0,X
#_1EAE58: STA.b $06
#_1EAE5A: STZ.b $07

#_1EAE5C: LDY.b #$00

#_1EAE5E: PHX

#_1EAE5F: LDA.w $0EB0,X
#_1EAE62: TAX

#_1EAE63: REP #$20

#_1EAE65: LDA.b $00
#_1EAE67: STA.b ($90),Y

#_1EAE69: AND.w #$0100
#_1EAE6C: STA.b $0E

#_1EAE6E: LDA.b $02
#_1EAE70: CLC
#_1EAE71: ADC.b $06

#_1EAE73: SEC
#_1EAE74: SBC.w #$000C

#_1EAE77: INY
#_1EAE78: STA.b ($90),Y

#_1EAE7A: CLC
#_1EAE7B: ADC.w #$0010

#_1EAE7E: CMP.w #$0100
#_1EAE81: BCC .on_screen

#_1EAE83: LDA.w #$00F0
#_1EAE86: STA.b ($90),Y

.on_screen
#_1EAE88: SEP #$20

#_1EAE8A: LDA.w .head_char,X
#_1EAE8D: INY
#_1EAE8E: STA.b ($90),Y

#_1EAE90: LDA.w .head_flip,X
#_1EAE93: INY
#_1EAE94: ORA.b $05
#_1EAE96: STA.b ($90),Y

#_1EAE98: TYA
#_1EAE99: LSR A
#_1EAE9A: LSR A
#_1EAE9B: TAY

#_1EAE9C: LDA.b #$02
#_1EAE9E: ORA.b $0F
#_1EAEA0: STA.b ($92),Y

#_1EAEA2: PLX

.head_part_of_body_chars
#_1EAEA3: RTS

;===================================================================================================

Sprite_90_Wallmaster:
#_1EAEA4: LDA.w $0B89,X
#_1EAEA7: ORA.b #$30
#_1EAEA9: STA.w $0B89,X

#_1EAEAC: JSR SpriteDraw_WallMaster

#_1EAEAF: LDA.w $0DD0,X
#_1EAEB2: CMP.b #$09
#_1EAEB4: BEQ .continue

#_1EAEB6: STZ.w $02E4
#_1EAEB9: STZ.w $037B

.continue
#_1EAEBC: JSR Sprite_CheckIfActive_Bank1E

#_1EAEBF: LDA.w $0D90,X
#_1EAEC2: BEQ .not_holding_link

#_1EAEC4: LDA.w $0D10,X
#_1EAEC7: STA.b $22

#_1EAEC9: LDA.w $0D30,X
#_1EAECC: STA.b $23

#_1EAECE: LDA.w $0D00,X
#_1EAED1: SEC
#_1EAED2: SBC.w $0F70,X
#_1EAED5: PHP

#_1EAED6: CLC
#_1EAED7: ADC.b #$03
#_1EAED9: STA.b $20

#_1EAEDB: LDA.w $0D20,X
#_1EAEDE: ADC.b #$00

#_1EAEE0: PLP
#_1EAEE1: SBC.b #$00
#_1EAEE3: STA.b $21

#_1EAEE5: LDA.b #$01
#_1EAEE7: STA.w $02E4
#_1EAEEA: STA.w $037B

#_1EAEED: STZ.b $46
#_1EAEEF: STZ.b $28
#_1EAEF1: STZ.b $27
#_1EAEF3: STZ.b $30
#_1EAEF5: STZ.b $31

#_1EAEF7: REP #$20

#_1EAEF9: LDA.b $20
#_1EAEFB: SEC

#_1EAEFC: SBC.b $E8
#_1EAEFE: SEC

#_1EAEFF: SBC.w #$0010
#_1EAF02: CMP.w #$0100

#_1EAF05: SEP #$20
#_1EAF07: BCC .still_rising

#_1EAF09: STZ.w $02E4
#_1EAF0C: STZ.w $037B

#_1EAF0F: PHX

#_1EAF10: JSL WallMaster_SendPlayerToLastEntrance
#_1EAF14: JSL Link_Initialize

#_1EAF18: PLX

#_1EAF19: RTS

;---------------------------------------------------------------------------------------------------

.not_holding_link
#_1EAF1A: JSL Sprite_CheckDamageFromLink_long

.still_rising
#_1EAF1E: LDA.w $0D80,X
#_1EAF21: JSL JumpTableLocal
#_1EAF25: dw Wallmaster_Descend
#_1EAF27: dw Wallmaster_Grab
#_1EAF29: dw Wallmaster_Ascend

;===================================================================================================

Wallmaster_Descend:
#_1EAF2B: LDA.w $0F70,X
#_1EAF2E: PHA

#_1EAF2F: JSR Sprite_Move_Z_Bank1E

#_1EAF32: LDA.w $0F80,X
#_1EAF35: CMP.b #$C0
#_1EAF37: BMI .at_max_z_speed

#_1EAF39: SEC
#_1EAF3A: SBC.b #$03
#_1EAF3C: STA.w $0F80,X

.at_max_z_speed
#_1EAF3F: PLA
#_1EAF40: EOR.w $0F70,X
#_1EAF43: BPL .exit

#_1EAF45: LDA.w $0F70,X
#_1EAF48: BPL .exit

#_1EAF4A: INC.w $0D80,X

#_1EAF4D: STZ.w $0F70,X
#_1EAF50: STZ.w $0F80,X

#_1EAF53: LDA.b #$3F
#_1EAF55: STA.w $0DF0,X

.exit
#_1EAF58: RTS

;===================================================================================================

Wallmaster_Grab:
#_1EAF59: LDA.w $0DF0,X
#_1EAF5C: BNE .still_grabby

#_1EAF5E: INC.w $0D80,X

.still_grabby
#_1EAF61: LDY.b #$00

#_1EAF63: AND.b #$20
#_1EAF65: BNE .anim_step_0

#_1EAF67: INY

.anim_step_0
#_1EAF68: TYA
#_1EAF69: STA.w $0DC0,X

#_1EAF6C: JSR Sprite_CheckDamageToLink_Bank1E
#_1EAF6F: BCC .exit

#_1EAF71: LDA.b #$01
#_1EAF73: STA.w $0D90,X

#_1EAF76: LDA.b #$40
#_1EAF78: STA.w $0E60,X

#_1EAF7B: LDA.b #$2A ; SFX3.2A
#_1EAF7D: JSL SpriteSFX_QueueSFX3WithPan

.exit
#_1EAF81: RTS

;===================================================================================================

Wallmaster_Ascend:
#_1EAF82: LDA.w $0F70,X
#_1EAF85: PHA

#_1EAF86: JSR Sprite_Move_Z_Bank1E

#_1EAF89: LDA.w $0F80,X
#_1EAF8C: CMP.b #$40
#_1EAF8E: BPL .at_max_z_speed

#_1EAF90: INC A
#_1EAF91: INC A
#_1EAF92: STA.w $0F80,X

.at_max_z_speed
#_1EAF95: PLA
#_1EAF96: EOR.w $0F70,X
#_1EAF99: BPL .exit

#_1EAF9B: LDA.w $0F70,X
#_1EAF9E: BMI .exit

#_1EAFA0: STZ.w $0DD0,X

.exit
#_1EAFA3: RTS

;===================================================================================================

pool SpriteDraw_WallMaster

.oam_groups
#_1EAFA4: dw  -4,   0 : db $A6, $01, $00, $02
#_1EAFAC: dw  12,   0 : db $AA, $01, $00, $00
#_1EAFB4: dw  -4,  16 : db $BA, $01, $00, $00
#_1EAFBC: dw   4,   8 : db $A8, $01, $00, $02

#_1EAFC4: dw  -4,   0 : db $AB, $01, $00, $02
#_1EAFCC: dw  12,   0 : db $AF, $01, $00, $00
#_1EAFD4: dw  -4,  16 : db $BF, $01, $00, $00
#_1EAFDC: dw   4,   8 : db $AD, $01, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_WallMaster:
#_1EAFE4: LDA.b #$00
#_1EAFE6: XBA
#_1EAFE7: LDA.w $0DC0,X

#_1EAFEA: REP #$20

#_1EAFEC: ASL A
#_1EAFED: ASL A
#_1EAFEE: ASL A
#_1EAFEF: ASL A
#_1EAFF0: ASL A
#_1EAFF1: ADC.w #.oam_groups
#_1EAFF4: STA.b $08

#_1EAFF6: SEP #$20

#_1EAFF8: LDA.b #$04
#_1EAFFA: JSR SpriteDraw_Tabulated_Bank1E

#_1EAFFD: JSL SpriteDraw_BigShadow_with_altitude

#_1EB001: RTS

;===================================================================================================

Sprite_8F_Blob:
#_1EB002: LDA.w $0DD0,X
#_1EB005: CMP.b #$09
#_1EB007: BNE .skip_tile_collision

#_1EB009: LDA.w $0E90,X
#_1EB00C: BEQ .skip_tile_collision

#_1EB00E: STZ.w $0E90,X

#_1EB011: LDA.b #$01
#_1EB013: STA.w $0D50,X

#_1EB016: JSR Sprite_CheckTileCollision_Bank1E

#_1EB019: STZ.w $0D50,X

#_1EB01C: BEQ .dont_die

#_1EB01E: STZ.w $0DD0,X

#_1EB021: RTS

;---------------------------------------------------------------------------------------------------

.dont_die
#_1EB022: LDA.b #$20 ; SFX2.20
#_1EB024: JSL SpriteSFX_QueueSFX2WithPan

.skip_tile_collision
#_1EB028: LDA.w $0DB0,X
#_1EB02B: BEQ .normal_priority

#_1EB02D: LDA.b #$30
#_1EB02F: STA.w $0B89,X

.normal_priority
#_1EB032: JSR SpriteDraw_Blob
#_1EB035: JSR Sprite_CheckIfActive_Bank1E

#_1EB038: LDA.w $0D80,X
#_1EB03B: CMP.b #$02
#_1EB03D: BCC .hidden

#_1EB03F: JSL Sprite_CheckDamageFromLink_long

.hidden
#_1EB043: JSR Sprite_CheckIfRecoiling_Bank1E

#_1EB046: LDA.w $0D80,X
#_1EB049: JSL JumpTableLocal
#_1EB04D: dw Blob_Hidden
#_1EB04F: dw Blob_Peeking
#_1EB051: dw Blob_Falling
#_1EB053: dw Blob_Active

;===================================================================================================

Blob_Hidden:
#_1EB055: LDA.w $0F60,X
#_1EB058: PHA

#_1EB059: ORA.b #$09
#_1EB05B: STA.w $0F60,X

#_1EB05E: LDA.w $0E40,X
#_1EB061: ORA.b #$80
#_1EB063: STA.w $0E40,X

#_1EB066: JSR Sprite_CheckDamageToLink_Bank1E

#_1EB069: PLA
#_1EB06A: STA.w $0F60,X

#_1EB06D: BCC .exit

#_1EB06F: INC.w $0D80,X

#_1EB072: LDA.b #$7F
#_1EB074: STA.w $0DF0,X

#_1EB077: ASL.w $0E40,X
#_1EB07A: LSR.w $0E40,X

#_1EB07D: LDA.b $22
#_1EB07F: STA.w $0D10,X

#_1EB082: LDA.b $23
#_1EB084: STA.w $0D30,X

#_1EB087: LDA.b $20
#_1EB089: CLC
#_1EB08A: ADC.b #$08
#_1EB08C: STA.w $0D00,X

#_1EB08F: LDA.b $21
#_1EB091: ADC.b #$00
#_1EB093: STA.w $0D20,X

#_1EB096: LDA.b #$30
#_1EB098: STA.w $0F10,X

#_1EB09B: STZ.w $0BA0,X

.exit
#_1EB09E: RTS

;===================================================================================================

pool Blob_Peeking

.anim_step
#_1EB09F: db $00, $01, $07, $07, $06, $06, $05, $05
#_1EB0A7: db $06, $06, $05, $05, $04, $04, $04, $04

pool off

;---------------------------------------------------------------------------------------------------

Blob_Peeking:
#_1EB0AF: LDA.w $0DF0,X
#_1EB0B2: BNE .delay

#_1EB0B4: INC.w $0D80,X

#_1EB0B7: LDA.b #$20
#_1EB0B9: STA.w $0F80,X

#_1EB0BC: LDA.b #$10
#_1EB0BE: JSL Sprite_ApplySpeedTowardsLink_long

#_1EB0C2: LDA.b #$30 ; SFX3.30
#_1EB0C4: JSL SpriteSFX_QueueSFX3WithPan

#_1EB0C8: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_1EB0C9: LSR A
#_1EB0CA: LSR A
#_1EB0CB: LSR A
#_1EB0CC: TAY

#_1EB0CD: LDA.w .anim_step,Y
#_1EB0D0: STA.w $0DC0,X

#_1EB0D3: RTS

;===================================================================================================

pool Blob_Falling

.anim_step
#_1EB0D4: db $00, $01

pool off

;---------------------------------------------------------------------------------------------------

Blob_Falling:
#_1EB0D6: LDA.w $0DF0,X
#_1EB0D9: BEQ .begin_descent

#_1EB0DB: DEC A
#_1EB0DC: BNE .shake_from_fall

#_1EB0DE: LDA.b #$20
#_1EB0E0: STA.w $0DF0,X

#_1EB0E3: INC.w $0D80,X

#_1EB0E6: STZ.w $0DC0,X

#_1EB0E9: RTS

.shake_from_fall
#_1EB0EA: LSR A
#_1EB0EB: LSR A
#_1EB0EC: LSR A
#_1EB0ED: LSR A
#_1EB0EE: TAY

#_1EB0EF: LDA.w .anim_step,Y
#_1EB0F2: STA.w $0DC0,X

#_1EB0F5: LDA.b $1A
#_1EB0F7: LSR A
#_1EB0F8: AND.b #$01
#_1EB0FA: TAY

#_1EB0FB: LDA.w .shake_x,Y
#_1EB0FE: STA.w $0D50,X

#_1EB101: JSR Sprite_Move_X_Bank1E

#_1EB104: RTS

.begin_descent
#_1EB105: JSL Sprite_CheckDamageFromLink_long
#_1EB109: JSR Sprite_Move_XY_Bank1E
#_1EB10C: JSR Sprite_CheckTileCollision_Bank1E

#_1EB10F: LDA.w $0F70,X
#_1EB112: PHA

#_1EB113: JSR Sprite_Move_Z_Bank1E

#_1EB116: LDA.w $0F80,X
#_1EB119: CMP.b #$C0
#_1EB11B: BMI .at_max_z_speed

#_1EB11D: SEC
#_1EB11E: SBC.b #$02
#_1EB120: STA.w $0F80,X

;---------------------------------------------------------------------------------------------------

.at_max_z_speed
#_1EB123: PLA
#_1EB124: EOR.w $0F70,X
#_1EB127: BPL .exit

#_1EB129: LDA.w $0F70,X
#_1EB12C: BPL .exit

#_1EB12E: STZ.w $0F80,X
#_1EB131: STZ.w $0F70,X
#_1EB134: STZ.w $0DB0,X

#_1EB137: LDA.b #$1F
#_1EB139: STA.w $0DF0,X

#_1EB13C: LDA.b #$08
#_1EB13E: STA.w $0EB0,X

.exit
#_1EB141: RTS

;---------------------------------------------------------------------------------------------------

.shake_x
#_1EB142: db -8,  8

;===================================================================================================

Blob_Active:
#_1EB144: JSR Sprite_CheckDamageToLink_Bank1E

#_1EB147: LDA.w $0E00,X
#_1EB14A: BNE .dont_turn

#_1EB14C: LDA.b #$30
#_1EB14E: JSL Sprite_ApplySpeedTowardsLink_long

#_1EB152: JSL GetRandomNumber
#_1EB156: AND.b #$3F
#_1EB158: ORA.b #$60
#_1EB15A: STA.w $0E00,X

#_1EB15D: ASL.w $0F50,X
#_1EB160: ASL.w $0F50,X

#_1EB163: LDA.w $0D50,X
#_1EB166: ASL A
#_1EB167: ROR.w $0F50,X
#_1EB16A: LSR.w $0F50,X

.dont_turn
#_1EB16D: LDA.w $0E10,X
#_1EB170: BNE .not_aggressive

#_1EB172: INC.w $0E80,X

#_1EB175: LDA.w $0E80,X
#_1EB178: AND.b #$0E
#_1EB17A: ORA.w $0E70,X
#_1EB17D: BNE .still_aggressive

#_1EB17F: JSR Sprite_Move_XY_Bank1E

#_1EB182: INC.w $0ED0,X

#_1EB185: LDA.w $0ED0,X
#_1EB188: CMP.w $0EB0,X
#_1EB18B: BNE .still_aggressive

#_1EB18D: STZ.w $0ED0,X

#_1EB190: JSL GetRandomNumber
#_1EB194: AND.b #$1F
#_1EB196: ADC.b #$40
#_1EB198: STA.w $0E10,X

#_1EB19B: JSL GetRandomNumber
#_1EB19F: AND.b #$1F
#_1EB1A1: ORA.b #$10
#_1EB1A3: STA.w $0EB0,X

.still_aggressive
#_1EB1A6: JSR Sprite_CheckTileCollision_Bank1E

#_1EB1A9: LDA.w $0E80,X
#_1EB1AC: AND.b #$08
#_1EB1AE: LSR A
#_1EB1AF: LSR A
#_1EB1B0: LSR A
#_1EB1B1: STA.w $0DC0,X

#_1EB1B4: RTS

.not_aggressive
#_1EB1B5: LDY.b #$00

#_1EB1B7: AND.b #$10
#_1EB1B9: BEQ .anim_step_0

#_1EB1BB: INY

.anim_step_0
#_1EB1BC: TYA
#_1EB1BD: STA.w $0DC0,X

#_1EB1C0: RTS

;===================================================================================================

pool SpriteDraw_Blob

.flip
#_1EB1C1: db $00, $00, $40, $40

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Blob:
#_1EB1C5: LDA.w $0F50,X
#_1EB1C8: LSR A
#_1EB1C9: BCS .not_quake_blob

#_1EB1CB: LDA.w $0FC6
#_1EB1CE: CMP.b #$03
#_1EB1D0: BCS .bad_gfx

.not_quake_blob
#_1EB1D2: LDA.w $0F10,X
#_1EB1D5: BEQ .draw_in_front_of_link

#_1EB1D7: LDA.b #$08
#_1EB1D9: JSL SpriteDraw_AllocateOAMFromRegionB

.draw_in_front_of_link
#_1EB1DD: LDA.w $0D80,X
#_1EB1E0: BEQ .invisible

#_1EB1E2: LDA.w $0DC0,X
#_1EB1E5: CMP.b #$04
#_1EB1E7: BCS .head_popping_out

;---------------------------------------------------------------------------------------------------

#_1EB1E9: PHA

#_1EB1EA: TAY

#_1EB1EB: LDA.w $0F50,X
#_1EB1EE: PHA

#_1EB1EF: EOR.w .flip,Y
#_1EB1F2: STA.w $0F50,X

#_1EB1F5: AND.b #$01
#_1EB1F7: EOR.b #$01

#_1EB1F9: ASL A
#_1EB1FA: ASL A

#_1EB1FB: CLC
#_1EB1FC: ADC.w $0DC0,X
#_1EB1FF: STA.w $0DC0,X

#_1EB202: JSL SpriteDraw_SingleLarge_long

#_1EB206: PLA
#_1EB207: STA.w $0F50,X

#_1EB20A: PLA
#_1EB20B: STA.w $0DC0,X

#_1EB20E: RTS

;---------------------------------------------------------------------------------------------------

.invisible
#_1EB20F: JSL Sprite_PrepOAMCoord_long

.bad_gfx
#_1EB213: RTS

;---------------------------------------------------------------------------------------------------

.oam_groups
#_1EB214: dw   0,   8 : db $6C, $03, $00, $00
#_1EB21C: dw   8,   8 : db $6D, $03, $00, $00

#_1EB224: dw   0,   8 : db $60, $00, $00, $00
#_1EB22C: dw   8,   8 : db $70, $00, $00, $00

#_1EB234: dw   0,   8 : db $70, $40, $00, $00
#_1EB23C: dw   8,   8 : db $60, $40, $00, $00

#_1EB244: dw   0,   0 : db $40, $00, $00, $02
#_1EB24C: dw   0,   0 : db $40, $00, $00, $02

;---------------------------------------------------------------------------------------------------

.head_popping_out
#_1EB254: LDA.b #$00
#_1EB256: XBA

#_1EB257: LDA.w $0DC0,X
#_1EB25A: SEC
#_1EB25B: SBC.b #$04

#_1EB25D: REP #$20

#_1EB25F: ASL A
#_1EB260: ASL A
#_1EB261: ASL A
#_1EB262: ASL A

#_1EB263: ADC.w #.oam_groups
#_1EB266: STA.b $08

#_1EB268: SEP #$20

#_1EB26A: LDA.b #$02
#_1EB26C: JMP.w SpriteDraw_Tabulated_Bank1E

;===================================================================================================

Sprite_8E_Terrorpin:
#_1EB26F: JSL SpriteDraw_SingleLarge_long
#_1EB273: JSR Sprite_CheckTileCollision_Bank1E
#_1EB276: JSR Sprite_CheckIfActive_Bank1E
#_1EB279: JSR Sprite_CheckIfRecoiling_Bank1E

#_1EB27C: LDA.w $0E10,X
#_1EB27F: BNE .invulnerable

#_1EB281: JSL Sprite_CheckDamageFromLink_long

.invulnerable
#_1EB285: JSR Terrorpin_CheckForHammer
#_1EB288: JSR Sprite_Move_XYZ_Bank1E

#_1EB28B: LDA.w $0DA0,X
#_1EB28E: JSL JumpTableLocal
#_1EB292: dw Terrorpin_RightsideUp
#_1EB294: dw Terrorpin_UpsideDown

#_1EB296: RTS

;===================================================================================================

pool Terrorpin_RightsideUp

.speed_x
#_1EB297: db   8,  -8,   0,   0
#_1EB29B: db  12, -12,   0,   0

.speed_y
#_1EB29F: db   0,   0,   8,  -8
#_1EB2A3: db   0,   0,  12, -12

pool off

;---------------------------------------------------------------------------------------------------

Terrorpin_RightsideUp:
#_1EB2A7: LDA.w $0F10,X
#_1EB2AA: BNE .dont_turn

#_1EB2AC: JSL GetRandomNumber
#_1EB2B0: AND.b #$1F
#_1EB2B2: ADC.b #$20
#_1EB2B4: STA.w $0F10,X

#_1EB2B7: AND.b #$03
#_1EB2B9: STA.w $0DE0,X

#_1EB2BC: AND.b #$30
#_1EB2BE: BNE .dont_turn

#_1EB2C0: JSR Sprite_DirectionToFaceLink_Bank1E
#_1EB2C3: TYA
#_1EB2C4: STA.w $0DE0,X

.dont_turn
#_1EB2C7: LDA.w $0DE0,X
#_1EB2CA: CLC
#_1EB2CB: ADC.w $0ED0,X
#_1EB2CE: TAY

#_1EB2CF: LDA.w .speed_x,Y
#_1EB2D2: STA.w $0D50,X

#_1EB2D5: LDA.w .speed_y,Y
#_1EB2D8: STA.w $0D40,X

#_1EB2DB: LDA.w $0F80,X
#_1EB2DE: DEC A
#_1EB2DF: DEC A
#_1EB2E0: STA.w $0F80,X

#_1EB2E3: LDA.w $0F70,X
#_1EB2E6: BPL .airborne

#_1EB2E8: STZ.w $0F70,X
#_1EB2EB: STZ.w $0F80,X

.airborne
#_1EB2EE: LDA.b $1A
#_1EB2F0: LDY.w $0ED0,X
#_1EB2F3: BNE .move_faster

#_1EB2F5: LSR A

.move_faster
#_1EB2F6: LSR A
#_1EB2F7: LSR A
#_1EB2F8: AND.b #$01
#_1EB2FA: STA.w $0DC0,X

#_1EB2FD: LDA.w $0E60,X
#_1EB300: ORA.b #$40
#_1EB302: STA.w $0E60,X

#_1EB305: LDA.b #$04
#_1EB307: STA.w $0CAA,X

#_1EB30A: JSR Sprite_CheckDamageToLink_Bank1E

#_1EB30D: RTS

;===================================================================================================

Terrorpin_UpsideDown:
#_1EB30E: LDA.w $0E60,X
#_1EB311: AND.b #$BF
#_1EB313: STA.w $0E60,X

#_1EB316: STZ.w $0CAA,X

#_1EB319: LDA.w $0F10,X
#_1EB31C: BNE .delay

#_1EB31E: STZ.w $0DA0,X

#_1EB321: LDA.b #$20
#_1EB323: STA.w $0F80,X

#_1EB326: LDA.b #$40
#_1EB328: STA.w $0F10,X

#_1EB32B: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_1EB32C: LDA.w $0F80,X
#_1EB32F: DEC A
#_1EB330: DEC A
#_1EB331: STA.w $0F80,X

#_1EB334: LDA.w $0F70,X
#_1EB337: BPL .dont_reset_y_speed

#_1EB339: STZ.w $0F70,X

#_1EB33C: LDA.w $0F80,X
#_1EB33F: EOR.b #$FF
#_1EB341: INC A
#_1EB342: LSR A

#_1EB343: CMP.b #$09
#_1EB345: BCS .airborne

#_1EB347: LDA.b #$00

;---------------------------------------------------------------------------------------------------

.airborne
#_1EB349: STA.w $0F80,X

#_1EB34C: LDA.w $0D50,X
#_1EB34F: ASL A
#_1EB350: ROR.w $0D50,X

#_1EB353: LDA.w $0D50,X
#_1EB356: CMP.b #$FF
#_1EB358: BNE .dont_reset_x_speed

#_1EB35A: STZ.w $0D50,X

;---------------------------------------------------------------------------------------------------

.dont_reset_x_speed
#_1EB35D: LDA.w $0D40,X
#_1EB360: ASL A
#_1EB361: ROR.w $0D40,X

#_1EB364: LDA.w $0D40,X
#_1EB367: CMP.b #$FF
#_1EB369: BNE .dont_reset_y_speed

#_1EB36B: STZ.w $0D40,X

;---------------------------------------------------------------------------------------------------

.dont_reset_y_speed
#_1EB36E: LDA.w $0F10,X
#_1EB371: CMP.b #$40
#_1EB373: BCS .not_struggling

#_1EB375: LSR A
#_1EB376: AND.b #$01
#_1EB378: TAY

#_1EB379: LDA.w .shake,Y
#_1EB37C: STA.w $0D50,X

#_1EB37F: INC.w $0E80,X

;---------------------------------------------------------------------------------------------------

.not_struggling
#_1EB382: INC.w $0E80,X

#_1EB385: LDA.w $0E80,X
#_1EB388: LSR A
#_1EB389: LSR A
#_1EB38A: LSR A

#_1EB38B: AND.b #$01
#_1EB38D: TAY

#_1EB38E: LDA.b #$02
#_1EB390: STA.w $0DC0,X

#_1EB393: LDA.w $0F50,X
#_1EB396: AND.b #$BF
#_1EB398: ORA.w .flip,Y
#_1EB39B: STA.w $0F50,X

#_1EB39E: RTS

;---------------------------------------------------------------------------------------------------

.flip
#_1EB39F: db $00, $40

.shake
#_1EB3A1: db   8,  -8

;===================================================================================================

Terrorpin_CheckForHammer:
#_1EB3A3: LDA.w $0F70,X
#_1EB3A6: ORA.w $0E10,X
#_1EB3A9: BNE .nohit

#_1EB3AB: LDA.b $EE
#_1EB3AD: CMP.w $0F20,X
#_1EB3B0: BNE .nohit

#_1EB3B2: LDA.w $0044
#_1EB3B5: CMP.b #$80
#_1EB3B7: BEQ .nohit

#_1EB3B9: LDA.w $0301
#_1EB3BC: AND.b #$0A
#_1EB3BE: BEQ .nohit

#_1EB3C0: JSL SetupActionHitbox_long
#_1EB3C4: JSR Terrorpin_SetUpHammerHitbox
#_1EB3C7: JSL CheckIfHitBoxesOverlap_long
#_1EB3CB: BCC .nohit

#_1EB3CD: LDA.w $0D50,X
#_1EB3D0: EOR.b #$FF
#_1EB3D2: INC A
#_1EB3D3: STA.w $0D50,X

#_1EB3D6: LDA.w $0D40,X
#_1EB3D9: EOR.b #$FF
#_1EB3DB: INC A
#_1EB3DC: STA.w $0D40,X

#_1EB3DF: LDA.b #$20
#_1EB3E1: STA.w $0E10,X

#_1EB3E4: LDA.b #$20
#_1EB3E6: STA.w $0F80,X

#_1EB3E9: LDA.b #$04
#_1EB3EB: STA.w $0ED0,X
#_1EB3EE: LDA.w $0DA0,X

#_1EB3F1: EOR.b #$01
#_1EB3F3: STA.w $0DA0,X

#_1EB3F6: CMP.b #$01
#_1EB3F8: LDA.b #$FF
#_1EB3FA: BCS .nonzerodao

#_1EB3FC: LDA.b #$40

.nonzerodao
#_1EB3FE: STA.w $0F10,X

.nohit
#_1EB401: STZ.w $0EB0,X

#_1EB404: RTS

;===================================================================================================

Terrorpin_SetUpHammerHitbox:
#_1EB405: LDA.w $0D10,X
#_1EB408: SEC
#_1EB409: SBC.b #$10
#_1EB40B: STA.b $04

#_1EB40D: LDA.w $0D30,X
#_1EB410: SBC.b #$00
#_1EB412: STA.b $0A

#_1EB414: LDA.w $0D00,X
#_1EB417: SEC
#_1EB418: SBC.b #$10
#_1EB41A: STA.b $05

#_1EB41C: LDA.w $0D20,X
#_1EB41F: SBC.b #$00
#_1EB421: STA.b $0B

#_1EB423: LDA.b #$30
#_1EB425: STA.b $06
#_1EB427: STA.b $07

#_1EB429: RTS

;===================================================================================================

pool Sprite_8C_Arrghus

.anim_step
#_1EB42A: db $01, $01, $01, $02, $02, $01, $01, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

Sprite_8C_Arrghus:
#_1EB433: LDA.w $0B89,X
#_1EB436: ORA.b #$30
#_1EB438: STA.w $0B89,X

#_1EB43B: JSR SpriteDraw_Arrghus

#_1EB43E: LDA.w $0DD0,X
#_1EB441: CMP.b #$09
#_1EB443: BNE .dying

#_1EB445: LDA.w $0F70,X
#_1EB448: CMP.b #$60
#_1EB44A: BCS .airborne

.dying
#_1EB44C: JSR Sprite_CheckIfActive_Bank1E

;---------------------------------------------------------------------------------------------------

.airborne
#_1EB44F: JSR Arrghus_HandlePuffs

#_1EB452: LDA.b #$01
#_1EB454: STA.w $0B0C

#_1EB457: LDA.w $0EF0,X
#_1EB45A: AND.b #$7F
#_1EB45C: CMP.b #$02
#_1EB45E: BNE .dont_jump

#_1EB460: JSR Arrghus_BOING

#_1EB463: LDA.b #$40
#_1EB465: STA.w $0E60,X

.dont_jump
#_1EB468: JSR Sprite_CheckIfRecoiling_Bank1E
#_1EB46B: JSR Sprite_CheckDamageToLink_Bank1E

#_1EB46E: LDA.w $0E80,X
#_1EB471: INC.w $0E80,X
#_1EB474: AND.b #$03
#_1EB476: BNE .dont_tick_step

#_1EB478: INC.w $0ED0,X

#_1EB47B: LDA.w $0ED0,X
#_1EB47E: CMP.b #$09
#_1EB480: BNE .dont_reset_step

#_1EB482: STZ.w $0ED0,X

.dont_reset_step
#_1EB485: LDY.w $0ED0,X

#_1EB488: LDA.w .anim_step,Y
#_1EB48B: STA.w $0DC0,X

;---------------------------------------------------------------------------------------------------

.dont_tick_step
#_1EB48E: JSR Sprite_CheckTileCollision_Bank1E
#_1EB491: BEQ .handle_ai

#_1EB493: LDY.w $0D80,X
#_1EB496: CPY.b #$05
#_1EB498: BNE .stop_moving

#_1EB49A: AND.b #$03
#_1EB49C: BEQ .invert_y_speed

.invert_x_speed
#_1EB49E: LDA.w $0D50,X
#_1EB4A1: EOR.b #$FF
#_1EB4A3: INC A
#_1EB4A4: STA.w $0D50,X

#_1EB4A7: BRA .handle_ai

.invert_y_speed
#_1EB4A9: LDA.w $0D40,X
#_1EB4AC: EOR.b #$FF
#_1EB4AE: INC A
#_1EB4AF: STA.w $0D40,X

#_1EB4B2: BRA .handle_ai

;---------------------------------------------------------------------------------------------------

.stop_moving
#_1EB4B4: JSR Sprite_ZeroVelocity_XY_Bank1E

.handle_ai
#_1EB4B7: LDA.w $0D80,X
#_1EB4BA: JSL JumpTableLocal
#_1EB4BE: dw Arrghus_Move
#_1EB4C0: dw Arrghus_MakeDecision
#_1EB4C2: dw Arrghus_PuffAttack
#_1EB4C4: dw Arrghus_JumpUp
#_1EB4C6: dw Arrghus_SmashDown
#_1EB4C8: dw Arrghus_PingPong

;===================================================================================================

Arrghus_JumpUp:
#_1EB4CA: LDA.b #$78
#_1EB4CC: STA.w $0F80,X

#_1EB4CF: JSR Sprite_Move_Z_Bank1E

#_1EB4D2: LDA.w $0F70,X
#_1EB4D5: CMP.b #$E0
#_1EB4D7: BCC .at_max_z_speed

#_1EB4D9: LDA.b #$40
#_1EB4DB: STA.w $0DF0,X

#_1EB4DE: INC.w $0D80,X

#_1EB4E1: STZ.w $0F80,X

#_1EB4E4: LDA.b $22
#_1EB4E6: STA.w $0D10,X

#_1EB4E9: LDA.b $20
#_1EB4EB: STA.w $0D00,X

.at_max_z_speed
#_1EB4EE: RTS

;===================================================================================================

Arrghus_SmashDown:
#_1EB4EF: LDA.w $0DF0,X
#_1EB4F2: BNE .descending

#_1EB4F4: LDA.b #$90
#_1EB4F6: STA.w $0F80,X

#_1EB4F9: LDA.w $0F70,X
#_1EB4FC: PHA

#_1EB4FD: JSR Sprite_Move_Z_Bank1E

#_1EB500: PLA
#_1EB501: EOR.w $0F70,X
#_1EB504: BPL .descending

#_1EB506: LDA.w $0F70,X
#_1EB509: BPL .descending

#_1EB50B: STZ.w $0F70,X

#_1EB50E: JSL Arrghus_SpawnSplash

#_1EB512: INC.w $0D80,X

#_1EB515: LDA.b #$20
#_1EB517: STA.w $0DF0,X

#_1EB51A: LDA.b #$03 ; SFX3.03
#_1EB51C: JSL SpriteSFX_QueueSFX3WithPan

#_1EB520: LDA.b #$20
#_1EB522: STA.w $0D50,X
#_1EB525: STA.w $0D40,X

.descending
#_1EB528: DEC A
#_1EB529: BNE .exit

#_1EB52B: LDA.b #$20 ; SFX2.20
#_1EB52D: JSL SpriteSFX_QueueSFX2WithPan

.exit
#_1EB531: RTS

;===================================================================================================

Arrghus_PingPong:
#_1EB532: LDA.w $0DF0,X
#_1EB535: BNE .exit

#_1EB537: STZ.w $0E60,X

#_1EB53A: JSR Sprite_Move_XY_Bank1E
#_1EB53D: JSL Sprite_CheckDamageFromLink_long

#_1EB541: LDA.b $1A
#_1EB543: AND.b #$07
#_1EB545: BNE .exit

#_1EB547: LDA.b #$28 ; SFX2.28
#_1EB549: JSL SpriteSFX_QueueSFX2WithPan

#_1EB54D: PHX

#_1EB54E: TXY
#_1EB54F: LDX.b #$1D

#_1EB551: LDA.w $0D40,Y
#_1EB554: BMI .next_slot

#_1EB556: LDX.b #$0E

.next_slot
#_1EB558: LDA.l $7FF800,X
#_1EB55C: BNE .slot_occupied

#_1EB55E: LDA.b #$15 ; GARNISH 15
#_1EB560: STA.l $7FF800,X
#_1EB564: STA.w $0FB4

#_1EB567: LDA.w $0D10,Y
#_1EB56A: STA.l $7FF83C,X

#_1EB56E: LDA.w $0D30,Y
#_1EB571: STA.l $7FF878,X

#_1EB575: LDA.w $0D00,Y
#_1EB578: CLC
#_1EB579: ADC.b #$18
#_1EB57B: STA.l $7FF81E,X

#_1EB57F: LDA.w $0D20,Y
#_1EB582: STA.l $7FF85A,X

#_1EB586: LDA.b #$0F
#_1EB588: STA.l $7FF90E,X

#_1EB58C: PLX

#_1EB58D: RTS

;---------------------------------------------------------------------------------------------------

.slot_occupied
#_1EB58E: DEX
#_1EB58F: BPL .next_slot

#_1EB591: PLX

.exit
#_1EB592: RTS

;===================================================================================================

Arrghus_Move:
#_1EB593: LDA.w $0DF0,X
#_1EB596: BNE .delay

#_1EB598: INC.w $0D80,X

#_1EB59B: LDA.b #$30
#_1EB59D: STA.w $0DF0,X

.delay
#_1EB5A0: JSR Sprite_Move_XY_Bank1E

#_1EB5A3: LDA.w $0D50,X
#_1EB5A6: CMP.w $0EB0,X
#_1EB5A9: BEQ .check_y_speed
#_1EB5AB: BPL .x_too_high

#_1EB5AD: INC.w $0D50,X
#_1EB5B0: BRA .check_y_speed

.x_too_high
#_1EB5B2: DEC.w $0D50,X

.check_y_speed
#_1EB5B5: LDA.w $0D40,X
#_1EB5B8: CMP.w $0DE0,X
#_1EB5BB: BEQ .exit
#_1EB5BD: BPL .y_too_high

#_1EB5BF: INC.w $0D40,X
#_1EB5C2: BRA .exit

.y_too_high
#_1EB5C4: DEC.w $0D40,X

.exit
#_1EB5C7: RTS

;===================================================================================================

Arrghus_MakeDecision:
#_1EB5C8: LDA.w $0DF0,X
#_1EB5CB: BNE Arrghus_Decelerate

#_1EB5CD: STZ.w $0D80,X

#_1EB5D0: JSL CheckIfScreenIsClear
#_1EB5D4: BCS Arrghus_BOING

#_1EB5D6: INC.w $0B0B

#_1EB5D9: LDA.w $0B0B
#_1EB5DC: CMP.b #$04
#_1EB5DE: BNE Arrghus_TargetLink

#_1EB5E0: STZ.w $0B0B

#_1EB5E3: LDA.b #$02
#_1EB5E5: STA.w $0D80,X

#_1EB5E8: LDA.b #$B0
#_1EB5EA: STA.w $0DF0,X

#_1EB5ED: RTS

;===================================================================================================

Arrghus_BOING:
#_1EB5EE: LDA.b #$03
#_1EB5F0: STA.w $0D80,X

#_1EB5F3: LDA.b #$32 ; SFX3.32
#_1EB5F5: JSL SpriteSFX_QueueSFX3WithPan

#_1EB5F9: STZ.w $0E80,X

#_1EB5FC: RTS

;===================================================================================================

Arrghus_TargetLink:
#_1EB5FD: JSL GetRandomNumber
#_1EB601: AND.b #$3F
#_1EB603: ADC.b #$30
#_1EB605: STA.w $0DF0,X

#_1EB608: AND.b #$03
#_1EB60A: ADC.b #$08
#_1EB60C: JSL Sprite_ProjectSpeedTowardsLink_long

#_1EB610: LDA.b $00
#_1EB612: STA.w $0DE0,X

#_1EB615: LDA.b $01
#_1EB617: STA.w $0EB0,X

#_1EB61A: RTS

;===================================================================================================

Arrghus_Decelerate:
#_1EB61B: JSR Sprite_Move_XY_Bank1E

#_1EB61E: LDA.w $0D50,X
#_1EB621: BEQ .check_y_speed
#_1EB623: BPL .x_too_high

#_1EB625: INC.w $0D50,X
#_1EB628: BRA .check_y_speed

.x_too_high
#_1EB62A: DEC.w $0D50,X

.check_y_speed
#_1EB62D: LDA.w $0D40,X
#_1EB630: BEQ .exit
#_1EB632: BPL .y_too_high

#_1EB634: INC.w $0D40,X
#_1EB637: BRA .exit

.y_too_high
#_1EB639: DEC.w $0D40,X

.exit
#_1EB63C: RTS

;===================================================================================================

Arrghus_PuffAttack:
#_1EB63D: LDA.b #$08
#_1EB63F: STA.w $0B0C

#_1EB642: LDA.w $0DF0,X
#_1EB645: CMP.b #$20
#_1EB647: BCC .shrink

#_1EB649: CMP.b #$60
#_1EB64B: BCS .hold

.grow
#_1EB64D: INC.w $0B0A

#_1EB650: RTS

.shrink
#_1EB651: DEC.w $0B0A
#_1EB654: BMI .attack_over

#_1EB656: RTS

;---------------------------------------------------------------------------------------------------

.hold
#_1EB657: BNE .not_about_to_shrink

#_1EB659: LDA.b #$26 ; SFX3.26
#_1EB65B: BRA .play_sfx

.not_about_to_shrink
#_1EB65D: AND.b #$0F
#_1EB65F: BNE .no_sfx

#_1EB661: LDA.b #$06 ; SFX3.06

.play_sfx
#_1EB663: JSL SpriteSFX_QueueSFX3WithPan

.no_sfx
#_1EB667: RTS

;---------------------------------------------------------------------------------------------------

.attack_over
#_1EB668: STZ.w $0B0A

#_1EB66B: DEC.w $0D80,X

#_1EB66E: LDA.b #$70
#_1EB670: STA.w $0DF0,X

#_1EB673: RTS

;===================================================================================================

pool Arrghus_HandlePuffs

.angle_offset
#_1EB674: dw $0000, $0040, $0080, $00C0, $0100, $0140, $0180, $01C0
#_1EB684: dw $0000, $0066, $00CC, $0132, $0198

.angle_mask
#_1EB68E: dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
#_1EB69E: dw $01FF, $01FF, $01FF, $01FF, $01FF

.pinch
#_1EB6A8: db $14, $14, $14, $14, $14, $14, $14, $14
#_1EB6B0: db $0C, $0C, $0C, $0C, $0C

.some_offset
#_1EB6B5: db $00, $FF, $FE, $FD, $FC, $FB, $FA, $FA
#_1EB6BD: db $FB, $FC, $FD, $FE, $FF, $00, $FF, $FE
#_1EB6C5: db $FD, $FC, $FB, $FA, $FA, $FB, $FC, $FD
#_1EB6CD: db $FE, $FF, $00, $FF, $FE, $FD, $FC, $FB
#_1EB6D5: db $FA, $FA, $FB, $FC, $FD, $FE, $FF, $00
#_1EB6DD: db $FF, $FE, $FD, $FC, $FB, $FA, $FA, $FB
#_1EB6E5: db $FC, $FD, $FE, $FF

pool off

;---------------------------------------------------------------------------------------------------

Arrghus_HandlePuffs:
#_1EB6E9: LDA.w $0B08
#_1EB6EC: CLC
#_1EB6ED: ADC.w $0B0C
#_1EB6F0: STA.w $0B08

#_1EB6F3: LDA.w $0B09
#_1EB6F6: ADC.b #$00
#_1EB6F8: STA.w $0B09

#_1EB6FB: LDA.b $1A
#_1EB6FD: AND.b #$03
#_1EB6FF: BNE .check_offset_y

#_1EB701: INC.w $0D90,X

#_1EB704: LDA.w $0D90,X
#_1EB707: CMP.b #$0D
#_1EB709: BNE .check_offset_y

#_1EB70B: STZ.w $0D90,X

.check_offset_y
#_1EB70E: LDA.b $1A
#_1EB710: AND.b #$07
#_1EB712: BNE .start_puffs

#_1EB714: INC.w $0DA0,X

#_1EB717: LDA.w $0DA0,X
#_1EB71A: CMP.b #$0D
#_1EB71C: BNE .start_puffs

#_1EB71E: STZ.w $0DA0,X

;---------------------------------------------------------------------------------------------------

.start_puffs
#_1EB721: STZ.w $0FB5

.next_puff
#_1EB724: LDA.w $0FB5
#_1EB727: PHA

#_1EB728: ASL A
#_1EB729: TAY

#_1EB72A: REP #$20

#_1EB72C: LDA.w $0B08
#_1EB72F: CLC
#_1EB730: ADC.w .angle_offset,Y
#_1EB733: EOR.w .angle_mask,Y
#_1EB736: STA.b $00

#_1EB738: SEP #$20

#_1EB73A: PLY

#_1EB73B: LDA.w $0B0A
#_1EB73E: CLC
#_1EB73F: ADC.w .pinch,Y
#_1EB742: STA.b $0E
#_1EB744: STA.b $0F

#_1EB746: LDA.w $0FB5
#_1EB749: STA.b $02

#_1EB74B: LDA.w $0D90,X
#_1EB74E: CLC
#_1EB74F: ADC.b $02
#_1EB751: TAY

#_1EB752: LDA.b $0F
#_1EB754: CLC
#_1EB755: ADC.w .some_offset,Y
#_1EB758: STA.b $0F

#_1EB75A: LDA.w $0DA0,X
#_1EB75D: CLC
#_1EB75E: ADC.b $02
#_1EB760: TAY

#_1EB761: LDA.b $0E
#_1EB763: CLC
#_1EB764: ADC.w .some_offset,Y
#_1EB767: STA.b $0E

#_1EB769: PHX
#_1EB76A: REP #$30

#_1EB76C: LDA.b $00
#_1EB76E: AND.w #$00FF
#_1EB771: ASL A
#_1EB772: TAX

#_1EB773: LDA.l SmoothCurve,X
#_1EB777: STA.b $04

#_1EB779: LDA.b $00
#_1EB77B: CLC
#_1EB77C: ADC.w #$0080
#_1EB77F: STA.b $02

#_1EB781: AND.w #$00FF
#_1EB784: ASL A
#_1EB785: TAX

#_1EB786: LDA.l SmoothCurve,X
#_1EB78A: STA.b $06

#_1EB78C: SEP #$30

#_1EB78E: PLX

#_1EB78F: LDA.b $04
#_1EB791: STA.w WRMPYA

#_1EB794: LDA.b $0F

#_1EB796: LDY.b $05
#_1EB798: BNE .nonzero_a

#_1EB79A: STA.w WRMPYB

#_1EB79D: JSR NOP8

#_1EB7A0: ASL.w RDMPYL
#_1EB7A3: LDA.w RDMPYH
#_1EB7A6: ADC.b #$00

.nonzero_a
#_1EB7A8: LSR.b $01
#_1EB7AA: BCC .dont_invert_a

#_1EB7AC: EOR.b #$FF
#_1EB7AE: INC A

.dont_invert_a
#_1EB7AF: STZ.b $0A

#_1EB7B1: CMP.b #$00
#_1EB7B3: BPL .positive_a

#_1EB7B5: DEC.b $0A

.positive_a
#_1EB7B7: CLC
#_1EB7B8: ADC.w $0D10,X

#_1EB7BB: LDY.w $0FB5
#_1EB7BE: STA.w $0B10,Y

#_1EB7C1: LDA.w $0D30,X
#_1EB7C4: ADC.b $0A
#_1EB7C6: STA.w $0B20,Y

#_1EB7C9: LDA.b $06
#_1EB7CB: STA.w WRMPYA

#_1EB7CE: LDA.b $0E

#_1EB7D0: LDY.b $07
#_1EB7D2: BNE .nonzero_b

#_1EB7D4: STA.w WRMPYB

#_1EB7D7: JSR NOP8

#_1EB7DA: ASL.w RDMPYL
#_1EB7DD: LDA.w RDMPYH
#_1EB7E0: ADC.b #$00

.nonzero_b
#_1EB7E2: LSR.b $03
#_1EB7E4: BCC .dont_invert_b

#_1EB7E6: EOR.b #$FF
#_1EB7E8: INC A

.dont_invert_b
#_1EB7E9: STZ.b $0A

#_1EB7EB: CMP.b #$00
#_1EB7ED: BPL .positive_b

#_1EB7EF: DEC.b $0A

.positive_b
#_1EB7F1: CLC
#_1EB7F2: ADC.w $0D00,X
#_1EB7F5: PHP

#_1EB7F6: SEC
#_1EB7F7: SBC.b #$10

#_1EB7F9: LDY.w $0FB5
#_1EB7FC: STA.w $0B30,Y

#_1EB7FF: LDA.w $0D20,X
#_1EB802: SBC.b #$00

#_1EB804: PLP
#_1EB805: ADC.b $0A
#_1EB807: STA.w $0B40,Y

#_1EB80A: INC.w $0FB5

#_1EB80D: LDA.w $0FB5
#_1EB810: CMP.b #$0D
#_1EB812: BEQ .exit

#_1EB814: JMP.w .next_puff

.exit
#_1EB817: RTS

;===================================================================================================

pool SpriteDraw_Arrghus

.oam_groups
#_1EB818: dw  -8,  -4 : db $80, $00, $00, $02
#_1EB820: dw   8,  -4 : db $80, $40, $00, $02
#_1EB828: dw  -8,  12 : db $A0, $00, $00, $02
#_1EB830: dw   8,  12 : db $A0, $40, $00, $02
#_1EB838: dw   0,  24 : db $A8, $00, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Arrghus:
#_1EB840: REP #$20

#_1EB842: LDA.w #.oam_groups
#_1EB845: STA.b $08

#_1EB847: SEP #$20

#_1EB849: LDA.b #$05
#_1EB84B: JSR SpriteDraw_Tabulated_Bank1E

#_1EB84E: LDA.w $0DC0,X
#_1EB851: ASL A
#_1EB852: STA.b $00

;---------------------------------------------------------------------------------------------------

#_1EB854: LDY.b #$02

.adjust_next_object
#_1EB856: LDA.b ($90),Y
#_1EB858: CLC
#_1EB859: ADC.b $00
#_1EB85B: STA.b ($90),Y

#_1EB85D: INY
#_1EB85E: INY
#_1EB85F: INY
#_1EB860: INY

#_1EB861: CPY.b #$12
#_1EB863: BCC .adjust_next_object

#_1EB865: LDA.w $0D80,X
#_1EB868: CMP.b #$05
#_1EB86A: BNE .not_pingponging

#_1EB86C: LDY.b #$11
#_1EB86E: LDA.b #$F0
#_1EB870: STA.b ($90),Y

;---------------------------------------------------------------------------------------------------

.not_pingponging
#_1EB872: LDA.w $0E80,X
#_1EB875: AND.b #$08
#_1EB877: BEQ .dont_flip_tentacles

#_1EB879: LDY.b #$13

#_1EB87B: LDA.b ($90),Y
#_1EB87D: ORA.b #$40
#_1EB87F: STA.b ($90),Y

.dont_flip_tentacles
#_1EB881: LDA.w $0D80,X
#_1EB884: CMP.b #$05
#_1EB886: BEQ .draw_wake

#_1EB888: REP #$20

#_1EB88A: LDA.b $90
#_1EB88C: CLC
#_1EB88D: ADC.w #$0004
#_1EB890: STA.b $90

;---------------------------------------------------------------------------------------------------

#_1EB892: INC.b $92

#_1EB894: SEP #$20

#_1EB896: LDA.w $0F70,X

#_1EB899: CMP.b #$A0
#_1EB89B: BCS .exit

#_1EB89D: LDA.w $0F50,X
#_1EB8A0: PHA

#_1EB8A1: AND.b #$FE
#_1EB8A3: STA.w $0F50,X

#_1EB8A6: JSL SpriteDraw_BigShadow

#_1EB8AA: PLA
#_1EB8AB: STA.w $0F50,X

.exit
#_1EB8AE: RTS

;---------------------------------------------------------------------------------------------------

.draw_wake
#_1EB8AF: JSL SpriteDraw_ArrghusWake

#_1EB8B3: RTS

;===================================================================================================

Arrghus_HandlePuffs_long:
#_1EB8B4: PHB
#_1EB8B5: PHK
#_1EB8B6: PLB

#_1EB8B7: JSR Arrghus_HandlePuffs

#_1EB8BA: PLB

#_1EB8BB: RTL

;===================================================================================================

pool Sprite_8D_Arrghi

.anim_step
#_1EB8BC: db $00, $01, $02, $02, $02, $02, $02, $01

pool off

;---------------------------------------------------------------------------------------------------

Sprite_8D_Arrghi:
#_1EB8C4: LDA.w $0B89,X
#_1EB8C7: ORA.b #$30
#_1EB8C9: STA.w $0B89,X

#_1EB8CC: JSL SpriteDraw_SingleLarge_long
#_1EB8D0: JSR Sprite_CheckIfActive_Bank1E

#_1EB8D3: INC.w $0E80,X

#_1EB8D6: LDA.w $0E80,X
#_1EB8D9: LSR A
#_1EB8DA: LSR A
#_1EB8DB: LSR A
#_1EB8DC: AND.b #$07
#_1EB8DE: TAY

#_1EB8DF: LDA.w .anim_step,Y
#_1EB8E2: STA.w $0DC0,X

#_1EB8E5: LDA.w $0DA0,X
#_1EB8E8: BEQ .not_dragged

#_1EB8EA: TAY
#_1EB8EB: DEY

#_1EB8EC: LDA.w $0C4A,Y
#_1EB8EF: BEQ .stop_drag

#_1EB8F1: LDA.w $0C04,Y
#_1EB8F4: STA.w $0D10,X

#_1EB8F7: LDA.w $0C18,Y
#_1EB8FA: STA.w $0D30,X

#_1EB8FD: LDA.w $0BFA,Y
#_1EB900: STA.w $0D00,X

#_1EB903: LDA.w $0C0E,Y
#_1EB906: STA.w $0D20,X

#_1EB909: LDA.b #$05
#_1EB90B: STA.w $0F50,X

#_1EB90E: LDA.w $0E60,X
#_1EB911: AND.b #$BF
#_1EB913: STA.w $0E60,X

#_1EB916: RTS

.stop_drag
#_1EB917: LDA.b #$01
#_1EB919: STA.w $0D80,X

#_1EB91C: STZ.w $0DA0,X

#_1EB91F: LDA.b #$20
#_1EB921: STA.w $0DF0,X

.not_dragged
#_1EB924: LDA.w $0DF0,X
#_1EB927: BNE .harmless

#_1EB929: JSR Sprite_CheckDamageToLink_Bank1E

;---------------------------------------------------------------------------------------------------

.harmless
#_1EB92C: LDA.w $0D80,X
#_1EB92F: BNE .vulnerable

#_1EB931: LDA.w $0B0F,X
#_1EB934: STA.w $0D10,X

#_1EB937: LDA.w $0B1F,X
#_1EB93A: STA.w $0D30,X

#_1EB93D: LDA.w $0B2F,X
#_1EB940: STA.w $0D00,X

#_1EB943: LDA.w $0B3F,X
#_1EB946: STA.w $0D20,X

#_1EB949: RTS

;---------------------------------------------------------------------------------------------------

.vulnerable
#_1EB94A: JSL Sprite_CheckDamageFromLink_long

#_1EB94E: TXA
#_1EB94F: EOR.b $1A
#_1EB951: AND.b #$03
#_1EB953: BNE .cant_hug_arrghus

#_1EB955: LDA.w $0B0F,X
#_1EB958: STA.b $04

#_1EB95A: LDA.w $0B1F,X
#_1EB95D: STA.b $05

#_1EB95F: LDA.w $0B2F,X
#_1EB962: STA.b $06

#_1EB964: LDA.w $0B3F,X
#_1EB967: STA.b $07

#_1EB969: LDA.b #$04
#_1EB96B: JSL Sprite_ProjectSpeedTowardsLocation_long

#_1EB96F: LDA.b $00
#_1EB971: STA.w $0D40,X

#_1EB974: LDA.b $01
#_1EB976: STA.w $0D50,X

#_1EB979: LDA.w $0D10,X
#_1EB97C: SEC
#_1EB97D: SBC.w $0B0F,X
#_1EB980: CLC
#_1EB981: ADC.b #$08

#_1EB983: CMP.b #$10
#_1EB985: BCS .cant_hug_arrghus

#_1EB987: LDA.w $0D00,X
#_1EB98A: SEC
#_1EB98B: SBC.w $0B2F,X
#_1EB98E: CLC
#_1EB98F: ADC.b #$08

#_1EB991: CMP.b #$10
#_1EB993: BCS .cant_hug_arrghus

#_1EB995: STZ.w $0D80,X

#_1EB998: LDA.b #$0D
#_1EB99A: STA.w $0F50,X

#_1EB99D: LDA.w $0E60,X
#_1EB9A0: ORA.b #$40
#_1EB9A2: STA.w $0E60,X

.cant_hug_arrghus
#_1EB9A5: JSR Sprite_Move_XY_Bank1E

#_1EB9A8: RTS

;===================================================================================================

Sprite_8B_Gibdo:
#_1EB9A9: JSR SpriteDraw_Gibdo
#_1EB9AC: JSR Sprite_CheckIfActive_Bank1E
#_1EB9AF: JSR Sprite_CheckIfRecoiling_Bank1E
#_1EB9B2: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1EB9B5: LDA.w $0D80,X
#_1EB9B8: JSL JumpTableLocal
#_1EB9BC: dw Gibdo_Turn
#_1EB9BE: dw Gibdo_Walk

;===================================================================================================

pool Gibdo_Turn

.target_direction
#_1EB9C0: db $02, $06, $04, $00

.anim_step
#_1EB9C4: db $04, $08, $0B, $0A, $00, $06, $03, $07

pool off

;---------------------------------------------------------------------------------------------------

Gibdo_Turn:
#_1EB9CC: LDY.w $0DE0,X

#_1EB9CF: LDA.w .anim_step,Y
#_1EB9D2: STA.w $0DC0,X

#_1EB9D5: LDA.b $1A
#_1EB9D7: AND.b #$07
#_1EB9D9: BNE .exit

#_1EB9DB: LDY.w $0D90,X

#_1EB9DE: LDA.w $0DE0,X
#_1EB9E1: CMP.w .target_direction,Y
#_1EB9E4: BEQ .begin_movement
#_1EB9E6: BPL .turn_left

.turn_right
#_1EB9E8: INC.w $0DE0,X
#_1EB9EB: BRA .exit

.turn_left
#_1EB9ED: DEC.w $0DE0,X

.exit
#_1EB9F0: RTS

.begin_movement
#_1EB9F1: JSL GetRandomNumber
#_1EB9F5: AND.b #$1F
#_1EB9F7: ADC.b #$30
#_1EB9F9: STA.w $0DF0,X

#_1EB9FC: INC.w $0D80,X

#_1EB9FF: RTS

;===================================================================================================

pool Gibdo_Walk

.speed_y ; bleeds into next
#_1EBA00: db -16,   0

.speed_x
#_1EBA02: db   0,   0,  16,   0,   0,   0, -16,   0

.anim_step
#_1EBA0A: db $09, $02, $00, $04, $0B, $03, $01, $05

pool off

;---------------------------------------------------------------------------------------------------

Gibdo_Walk:
#_1EBA12: LDY.w $0DE0,X

#_1EBA15: LDA.w .speed_x,Y
#_1EBA18: STA.w $0D50,X

#_1EBA1B: LDA.w .speed_y,Y
#_1EBA1E: STA.w $0D40,X

#_1EBA21: JSR Sprite_Move_XY_Bank1E
#_1EBA24: JSR Sprite_CheckTileCollision_Bank1E

#_1EBA27: LDA.w $0DF0,X
#_1EBA2A: BEQ .face_link

#_1EBA2C: LDA.w $0E70,X
#_1EBA2F: BEQ .continue

.face_link
#_1EBA31: JSR Sprite_DirectionToFaceLink_Bank1E
#_1EBA34: TYA
#_1EBA35: CMP.w $0D90,X
#_1EBA38: BEQ .continue

#_1EBA3A: STA.w $0D90,X

#_1EBA3D: STZ.w $0D80,X

#_1EBA40: RTS

.continue
#_1EBA41: DEC.w $0DA0,X
#_1EBA44: BPL .dont_step_animation

#_1EBA46: LDA.b #$0E
#_1EBA48: STA.w $0DA0,X

#_1EBA4B: INC.w $0E80,X

.dont_step_animation
#_1EBA4E: LDA.w $0E80,X
#_1EBA51: ASL A
#_1EBA52: ASL A

#_1EBA53: AND.b #$04
#_1EBA55: ORA.w $0D90,X
#_1EBA58: TAY

#_1EBA59: LDA.w .anim_step,Y
#_1EBA5C: STA.w $0DC0,X

#_1EBA5F: RTS

;===================================================================================================

pool SpriteDraw_Gibdo

.oam_groups
#_1EBA60: dw   0,  -9 : db $80, $00, $00, $02
#_1EBA68: dw   0,   0 : db $8A, $00, $00, $02

#_1EBA70: dw   0,  -8 : db $80, $00, $00, $02
#_1EBA78: dw   0,   1 : db $8A, $40, $00, $02

#_1EBA80: dw   0,  -9 : db $82, $00, $00, $02
#_1EBA88: dw   0,   0 : db $8C, $00, $00, $02

#_1EBA90: dw   0,  -8 : db $82, $00, $00, $02
#_1EBA98: dw   0,   0 : db $8E, $00, $00, $02

#_1EBAA0: dw   0,  -9 : db $84, $00, $00, $02
#_1EBAA8: dw   0,   0 : db $A0, $00, $00, $02

#_1EBAB0: dw   0,  -8 : db $84, $00, $00, $02
#_1EBAB8: dw   0,   1 : db $A0, $40, $00, $02

#_1EBAC0: dw   0,  -9 : db $86, $00, $00, $02
#_1EBAC8: dw   0,   0 : db $A2, $00, $00, $02

#_1EBAD0: dw   0,  -9 : db $88, $00, $00, $02
#_1EBAD8: dw   0,   0 : db $A4, $00, $00, $02

#_1EBAE0: dw   0,  -9 : db $88, $40, $00, $02
#_1EBAE8: dw   0,   0 : db $A4, $40, $00, $02

#_1EBAF0: dw   0,  -9 : db $82, $40, $00, $02
#_1EBAF8: dw   0,   0 : db $8C, $40, $00, $02

#_1EBB00: dw   0,  -9 : db $86, $40, $00, $02
#_1EBB08: dw   0,   0 : db $A2, $40, $00, $02

#_1EBB10: dw   0,  -8 : db $82, $40, $00, $02
#_1EBB18: dw   0,   1 : db $8E, $40, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Gibdo:
#_1EBB20: LDA.b #$00
#_1EBB22: XBA
#_1EBB23: LDA.w $0DC0,X

#_1EBB26: REP #$20

#_1EBB28: ASL A
#_1EBB29: ASL A
#_1EBB2A: ASL A
#_1EBB2B: ASL A

#_1EBB2C: ADC.w #.oam_groups
#_1EBB2F: STA.b $08

#_1EBB31: SEP #$20

#_1EBB33: LDA.b #$02
#_1EBB35: JSR SpriteDraw_Tabulated_Bank1E

#_1EBB38: LDA.w $0F00,X
#_1EBB3B: BNE .no_shadow

#_1EBB3D: JSL SpriteDraw_Shadow_long

.no_shadow
#_1EBB41: RTS

;===================================================================================================

Sprite_89_MothulaBeam:
#_1EBB42: JSL SpriteDraw_SingleLarge_long
#_1EBB46: JSR Sprite_CheckIfActive_Bank1E
#_1EBB49: JSR Sprite_CheckDamageToLink_Bank1E

#_1EBB4C: LDA.b $1A
#_1EBB4E: AND.b #$01
#_1EBB50: BNE .frame_parity

#_1EBB52: LDA.w $0F50,X
#_1EBB55: EOR.b #$80
#_1EBB57: STA.w $0F50,X

.frame_parity
#_1EBB5A: JSR Sprite_Move_XY_Bank1E
#_1EBB5D: LDA.w $0DF0,X
#_1EBB60: BNE .stick_around

#_1EBB62: JSR Sprite_CheckTileCollision_Bank1E
#_1EBB65: BEQ .stick_around

#_1EBB67: STZ.w $0DD0,X

.stick_around
#_1EBB6A: TXA
#_1EBB6B: EOR.b $1A
#_1EBB6D: AND.b #$03
#_1EBB6F: BNE .exit

#_1EBB71: PHX
#_1EBB72: TXY

;---------------------------------------------------------------------------------------------------

#_1EBB73: LDX.b #$0E

.next_slot
#_1EBB75: LDA.l $7FF800,X
#_1EBB79: BEQ .free_garnish_slot

#_1EBB7B: DEX
#_1EBB7C: BPL .next_slot

#_1EBB7E: PLX

.exit
#_1EBB7F: RTS

;---------------------------------------------------------------------------------------------------

.free_garnish_slot
#_1EBB80: LDA.b #$02 ; GARNISH 02
#_1EBB82: STA.l $7FF800,X
#_1EBB86: STA.w $0FB4

#_1EBB89: LDA.w $0D10,Y
#_1EBB8C: STA.l $7FF83C,X

#_1EBB90: LDA.w $0D30,Y
#_1EBB93: STA.l $7FF878,X

#_1EBB97: LDA.w $0D00,Y
#_1EBB9A: STA.l $7FF81E,X

#_1EBB9E: LDA.w $0D20,Y
#_1EBBA1: STA.l $7FF85A,X

#_1EBBA5: LDA.b #$10
#_1EBBA7: STA.l $7FF90E,X

#_1EBBAB: TYA
#_1EBBAC: STA.l $7FF92C,X

#_1EBBB0: LDA.w $0F20,Y
#_1EBBB3: STA.l $7FF968,X

#_1EBBB7: PLX

#_1EBBB8: RTS

;===================================================================================================

Sprite_94_Tile:
#_1EBBB9: LDA.b #$30
#_1EBBBB: STA.w $0B89,X

#_1EBBBE: JSR SpriteDraw_Tile
#_1EBBC1: JSR Sprite_CheckIfActivePermissive_Bank1E

#_1EBBC4: LDA.w $0EF0,X
#_1EBBC7: BNE Tile_Shatter

#_1EBBC9: LDA.b #$01
#_1EBBCB: STA.w $0BA0,X

#_1EBBCE: LDA.w $0D80,X
#_1EBBD1: JSL JumpTableLocal
#_1EBBD5: dw Tile_DeleteFloor
#_1EBBD7: dw Tile_Ascend
#_1EBBD9: dw Tile_Launched

;===================================================================================================

Tile_DeleteFloor:
#_1EBBDB: LDA.w $0D10,X
#_1EBBDE: STA.b $00

#_1EBBE0: LDA.w $0D30,X
#_1EBBE3: STA.b $01

#_1EBBE5: LDA.w $0D00,X
#_1EBBE8: CLC
#_1EBBE9: ADC.b #$08
#_1EBBEB: STA.b $02

#_1EBBED: LDA.w $0D20,X
#_1EBBF0: STA.b $03

#_1EBBF2: LDY.b #$06
#_1EBBF4: JSL Underworld_UpdateTilemapWithCommonTile

#_1EBBF8: INC.w $0D80,X

#_1EBBFB: LDA.b #$80
#_1EBBFD: STA.w $0DF0,X

#_1EBC00: RTS

;===================================================================================================

Tile_Launched:
#_1EBC01: STZ.w $0BA0,X

#_1EBC04: LDA.w $0DF0,X
#_1EBC07: BEQ .dont_turn

#_1EBC09: AND.b #$03
#_1EBC0B: BNE .dont_turn

#_1EBC0D: JSR Tile_SpeedTowardsLink

.dont_turn
#_1EBC10: JSR Sprite_CheckDamageToAndFromLink_Bank1E
#_1EBC13: BCS Tile_Shatter

#_1EBC15: JSR Sprite_Move_XY_Bank1E

#_1EBC18: LDA.w $0FDA
#_1EBC1B: SEC
#_1EBC1C: SBC.w $0F70,X
#_1EBC1F: STA.w $0FDA

#_1EBC22: LDA.w $0FDB
#_1EBC25: SBC.b #$00
#_1EBC27: STA.w $0FDB

#_1EBC2A: JSR Sprite_CheckTileCollision_Bank1E
#_1EBC2D: BEQ .no_tile_collision

;---------------------------------------------------------------------------------------------------

#Tile_Shatter:
#_1EBC2F: LDA.b #$1F ; SFX2.1F
#_1EBC31: JSL SpriteSFX_QueueSFX2WithPan

#_1EBC35: LDA.b #$06
#_1EBC37: STA.w $0DD0,X

#_1EBC3A: LDA.b #$1F
#_1EBC3C: STA.w $0DF0,X

#_1EBC3F: LDA.b #$EC ; SPRITE EC
#_1EBC41: STA.w $0E20,X

#_1EBC44: STZ.w $0EF0,X

#_1EBC47: LDA.b #$80
#_1EBC49: STA.w $0DB0,X

#_1EBC4C: RTS

.no_tile_collision
#_1EBC4D: BRA Tile_Whirr

;===================================================================================================

Tile_Ascend:
#_1EBC4F: LDA.w $0DF0,X
#_1EBC52: BNE .ascending

#_1EBC54: INC.w $0D80,X

#_1EBC57: LDA.b #$10
#_1EBC59: STA.w $0DF0,X

;---------------------------------------------------------------------------------------------------

#Tile_SpeedTowardsLink:
#_1EBC5C: LDA.b #$20
#_1EBC5E: JSL Sprite_ApplySpeedTowardsLink_long

#_1EBC62: RTS

;---------------------------------------------------------------------------------------------------

.ascending
#_1EBC63: CMP.b #$40
#_1EBC65: BCC Tile_Whirr

#_1EBC67: LDA.b #$04
#_1EBC69: STA.w $0F80,X

#_1EBC6C: JSR Sprite_Move_Z_Bank1E

;---------------------------------------------------------------------------------------------------

Tile_Whirr:
#_1EBC6F: INC.w $0E80,X

#_1EBC72: LDA.w $0E80,X
#_1EBC75: LSR A
#_1EBC76: LSR A
#_1EBC77: AND.b #$01
#_1EBC79: STA.w $0DC0,X

#_1EBC7C: TXA
#_1EBC7D: EOR.b $1A
#_1EBC7F: AND.b #$07
#_1EBC81: BNE .exit

#_1EBC83: LDA.b #$07 ; SFX2.07
#_1EBC85: JSL SpriteSFX_QueueSFX2WithPan

.exit
#_1EBC89: RTS

;===================================================================================================

pool SpriteDraw_Tile

.oam_groups
#_1EBC8A: dw   0,   0 : db $D3, $00, $00, $00
#_1EBC92: dw   8,   0 : db $D3, $40, $00, $00
#_1EBC9A: dw   0,   8 : db $D3, $80, $00, $00
#_1EBCA2: dw   8,   8 : db $D3, $C0, $00, $00

#_1EBCAA: dw   0,   0 : db $C3, $00, $00, $00
#_1EBCB2: dw   8,   0 : db $C3, $40, $00, $00
#_1EBCBA: dw   0,   8 : db $C3, $80, $00, $00
#_1EBCC2: dw   8,   8 : db $C3, $C0, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Tile:
#_1EBCCA: LDA.b #$00
#_1EBCCC: XBA
#_1EBCCD: LDA.w $0DC0,X

#_1EBCD0: REP #$20

#_1EBCD2: ASL A
#_1EBCD3: ASL A
#_1EBCD4: ASL A
#_1EBCD5: ASL A
#_1EBCD6: ASL A
#_1EBCD7: ADC.w #.oam_groups
#_1EBCDA: STA.b $08

#_1EBCDC: SEP #$20

#_1EBCDE: LDA.b #$04
#_1EBCE0: JSR SpriteDraw_Tabulated_Bank1E

#_1EBCE3: JSL SpriteDraw_Shadow_long

#_1EBCE7: RTS

;===================================================================================================

Sprite_8A_SpikeBlock:
#_1EBCE8: LDA.w $0E90,X
#_1EBCEB: BNE SpikeBlock_ByMothula

#_1EBCED: JSL SpriteDraw_SingleLarge_long
#_1EBCF1: JSR Sprite_CheckIfActive_Bank1E
#_1EBCF4: JSR Sprite_CheckDamageToAndFromLink_Bank1E
#_1EBCF7: JSR Sprite_Move_XY_Bank1E
#_1EBCFA: JSR Sprite_CheckTileCollision_Bank1E

#_1EBCFD: LDA.w $0DF0,X
#_1EBD00: BNE .exit

#_1EBD02: JSR SpikeBlock_CheckStatueCollision
#_1EBD05: BCC .no_collision

#_1EBD07: LDA.w $0E70,X
#_1EBD0A: AND.b #$0F
#_1EBD0C: BEQ .exit

.no_collision
#_1EBD0E: LDA.b #$04
#_1EBD10: STA.w $0DF0,X

#_1EBD13: LDA.w $0D50,X
#_1EBD16: EOR.b #$FF
#_1EBD18: INC A
#_1EBD19: STA.w $0D50,X

#_1EBD1C: LDA.b #$05 ; SFX2.05
#_1EBD1E: JSL SpriteSFX_QueueSFX2WithPan

.exit
#_1EBD22: RTS

;===================================================================================================

SpikeBlock_ByMothula:
#_1EBD23: LDA.b #$04
#_1EBD25: JSL SpriteDraw_AllocateOAMFromRegionB

#_1EBD29: JSL SpriteDraw_SingleLarge_long
#_1EBD2D: JSR Sprite_CheckIfActive_Bank1E
#_1EBD30: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1EBD33: LDA.w $0D80,X
#_1EBD36: BNE .active

#_1EBD38: LDY.b #$00
#_1EBD3A: JSR SpikeBlock_UpdateTilemap

#_1EBD3D: INC.w $0D80,X

#_1EBD40: LDA.b #$40
#_1EBD42: STA.w $0DF0,X

#_1EBD45: LDA.b #$69
#_1EBD47: STA.w $0E00,X

#_1EBD4A: RTS

;---------------------------------------------------------------------------------------------------

.shake
#_1EBD4B: db  8, -8

;---------------------------------------------------------------------------------------------------

.active
#_1EBD4D: LDA.w $0DF0,X
#_1EBD50: BEQ .moving

#_1EBD52: CMP.b #$01
#_1EBD54: BNE .jiggle

#_1EBD56: LDA.w $0D90,X
#_1EBD59: STA.w $0D10,X

#_1EBD5C: LDA.w $0DA0,X
#_1EBD5F: STA.w $0D00,X

#_1EBD62: RTS

.jiggle
#_1EBD63: LSR A
#_1EBD64: AND.b #$01
#_1EBD66: TAY

#_1EBD67: LDA.w .shake,Y
#_1EBD6A: STA.w $0D50,X

#_1EBD6D: JSR Sprite_Move_X_Bank1E

#_1EBD70: STZ.w $0D50,X

#_1EBD73: RTS

;---------------------------------------------------------------------------------------------------

.max_speed_x ; bleeds into next
#_1EBD74: db  32, -32

.max_speed_y
#_1EBD76: db   0,   0,  32, -32

.accel_x ; bleeds into next
#_1EBD7A: db   1,  -1

.accel_y
#_1EBD7C: db   0,   0,   1,  -1

;---------------------------------------------------------------------------------------------------

.moving
#_1EBD80: LDA.w $0D80,X
#_1EBD83: CMP.b #$01
#_1EBD85: BNE .returning

#_1EBD87: LDA.b $1A
#_1EBD89: AND.b #$00
#_1EBD8B: BNE .delay

#_1EBD8D: LDY.w $0DE0,X

#_1EBD90: LDA.w $0D50,X
#_1EBD93: CMP.w .max_speed_x,Y
#_1EBD96: BEQ .up_to_speed_x

#_1EBD98: CLC
#_1EBD99: ADC.w .accel_x,Y
#_1EBD9C: STA.w $0D50,X

.up_to_speed_x
#_1EBD9F: LDA.w $0D40,X
#_1EBDA2: CMP.w .max_speed_y,Y
#_1EBDA5: BEQ .delay

#_1EBDA7: CLC
#_1EBDA8: ADC.w .accel_y,Y
#_1EBDAB: STA.w $0D40,X

.delay
#_1EBDAE: JSR Sprite_Move_XY_Bank1E
#_1EBDB1: LDA.w $0E00,X
#_1EBDB4: BNE .exit_a

#_1EBDB6: JSL Sprite_Get16BitCoords_long
#_1EBDBA: JSR Sprite_CheckTileCollision_Bank1E
#_1EBDBD: BEQ .exit_a

#_1EBDBF: INC.w $0D80,X
#_1EBDC2: LDA.b #$40
#_1EBDC4: STA.w $0E00,X

.exit_a
#_1EBDC7: RTS

;---------------------------------------------------------------------------------------------------

.return_speed_x
#_1EBDC8: db $F0, $10, $00, $00

.return_speed_y
#_1EBDCC: db $00, $00, $F0, $10

;---------------------------------------------------------------------------------------------------

.returning
#_1EBDD0: LDA.w $0E00,X
#_1EBDD3: BNE .exit_b

#_1EBDD5: LDY.w $0DE0,X

#_1EBDD8: LDA.w .return_speed_x,Y
#_1EBDDB: STA.w $0D50,X

#_1EBDDE: LDA.w .return_speed_y,Y
#_1EBDE1: STA.w $0D40,X

#_1EBDE4: JSR Sprite_Move_XY_Bank1E

#_1EBDE7: LDA.w $0D10,X
#_1EBDEA: CMP.w $0D90,X
#_1EBDED: BNE .exit_b

#_1EBDEF: LDA.w $0D00,X
#_1EBDF2: CMP.w $0DA0,X
#_1EBDF5: BNE .exit_b

#_1EBDF7: STZ.w $0DD0,X

#_1EBDFA: LDY.b #$02
#_1EBDFC: JSR SpikeBlock_UpdateTilemap

.exit_b
#_1EBDFF: RTS

;===================================================================================================

SpikeBlock_UpdateTilemap:
#_1EBE00: LDA.w $0D10,X
#_1EBE03: STA.b $00

#_1EBE05: LDA.w $0D30,X
#_1EBE08: STA.b $01

#_1EBE0A: LDA.w $0D00,X
#_1EBE0D: STA.b $02

#_1EBE0F: LDA.w $0D20,X
#_1EBE12: STA.b $03

#_1EBE14: JSL Underworld_UpdateTilemapWithCommonTile

#_1EBE18: RTS

;===================================================================================================

SpikeBlock_CheckStatueCollision:
#_1EBE19: LDY.b #$0F

.next_sprite
#_1EBE1B: TYA
#_1EBE1C: EOR.b $1A
#_1EBE1E: AND.b #$01
#_1EBE20: BNE .skip

#_1EBE22: LDA.w $0DD0,Y
#_1EBE25: BEQ .skip

#_1EBE27: LDA.w $0E20,Y
#_1EBE2A: CMP.b #$1C ; SPRITE 1C
#_1EBE2C: BNE .skip

#_1EBE2E: LDA.w $0D10,X
#_1EBE31: STA.b $00

#_1EBE33: LDA.w $0D30,X
#_1EBE36: STA.b $01

#_1EBE38: LDA.w $0D00,X
#_1EBE3B: STA.b $02

#_1EBE3D: LDA.w $0D20,X
#_1EBE40: STA.b $03

#_1EBE42: LDA.w $0D10,Y
#_1EBE45: STA.b $04

#_1EBE47: LDA.w $0D30,Y
#_1EBE4A: STA.b $05

#_1EBE4C: LDA.w $0D00,Y
#_1EBE4F: STA.b $06

#_1EBE51: LDA.w $0D20,Y
#_1EBE54: STA.b $07

#_1EBE56: REP #$20

#_1EBE58: LDA.b $00
#_1EBE5A: SEC
#_1EBE5B: SBC.b $04
#_1EBE5D: CLC
#_1EBE5E: ADC.w #$0010

#_1EBE61: CMP.w #$0020
#_1EBE64: BCS .no_collision

#_1EBE66: LDA.b $02
#_1EBE68: SEC
#_1EBE69: SBC.b $06
#_1EBE6B: CLC
#_1EBE6C: ADC.w #$0008

#_1EBE6F: CMP.w #$0010
#_1EBE72: BCS .no_collision

#_1EBE74: SEP #$20

#_1EBE76: RTS

.no_collision
#_1EBE77: SEP #$20

.skip
#_1EBE79: DEY
#_1EBE7A: BPL .next_sprite

#_1EBE7C: SEC

#_1EBE7D: RTS

;===================================================================================================

Sprite_88_Mothula:
#_1EBE7E: JSR Mothula_Main

#_1EBE81: JSR Sprite_CheckIfActive_Bank1E

#_1EBE84: JSR Mothula_HandleSpikes

#_1EBE87: RTS

;===================================================================================================

Mothula_Main:
#_1EBE88: JSL SpriteDraw_Mothula

#_1EBE8C: LDA.w $0DD0,X
#_1EBE8F: CMP.b #$0B
#_1EBE91: BNE .not_stunned

#_1EBE93: STZ.w $0D80,X

.not_stunned
#_1EBE96: JSR Sprite_CheckIfActive_Bank1E

#_1EBE99: STZ.w $0E60,X

#_1EBE9C: LDA.w $0EE0,X
#_1EBE9F: BEQ .vulnerable

#_1EBEA1: LDA.b #$40
#_1EBEA3: STA.w $0E60,X

;---------------------------------------------------------------------------------------------------

.vulnerable
#_1EBEA6: LDA.w $0EA0,X
#_1EBEA9: BEQ .continue

#_1EBEAB: AND.b #$7F
#_1EBEAD: CMP.b #$06
#_1EBEAF: BNE .continue

#_1EBEB1: STZ.w $0EA0,X

#_1EBEB4: LDA.b #$20
#_1EBEB6: STA.w $0EE0,X

#_1EBEB9: LDA.b #$02
#_1EBEBB: STA.w $0D80,X

#_1EBEBE: STZ.w $0DF0,X

#_1EBEC1: LDA.b #$40
#_1EBEC3: STA.w $0ED0,X

;---------------------------------------------------------------------------------------------------

.continue
#_1EBEC6: JSR Sprite_CheckIfRecoiling_Bank1E

#_1EBEC9: LDA.w $0D80,X
#_1EBECC: JSL JumpTableLocal
#_1EBED0: dw Modula_Dormant
#_1EBED2: dw Modula_WakeUp
#_1EBED4: dw Modula_ActLikeAMoth
#_1EBED6: dw Modula_FireBeams

;===================================================================================================

Modula_Dormant:
#_1EBED8: LDA.w $0DF0,X
#_1EBEDB: BNE .exit

#_1EBEDD: INC.w $0D80,X

.exit
#_1EBEE0: RTS

;===================================================================================================

Modula_WakeUp:
#_1EBEE1: LDA.b #$08
#_1EBEE3: STA.w $0F80,X

#_1EBEE6: JSR Sprite_Move_Z_Bank1E

#_1EBEE9: STZ.w $0F80,X

#_1EBEEC: LDA.w $0F70,X
#_1EBEEF: CMP.b #$18
#_1EBEF1: BCC .still_rising

#_1EBEF3: LDA.b #$80
#_1EBEF5: STA.w $0ED0,X

#_1EBEF8: INC.w $0D80,X

#_1EBEFB: STZ.w $0BA0,X

#_1EBEFE: LDA.b #$40
#_1EBF00: STA.w $0DF0,X

.still_rising
#_1EBF03: JSR Mothula_FlapWings

#_1EBF06: RTS

;===================================================================================================

pool Modula_ActLikeAMoth

.speed_z
#_1EBF07: db   1,  -1

.speed_y ; bleeds into next
#_1EBF09: db -16, -12

.speed_x
#_1EBF0B: db   0,  12,  16,  12,   0, -12, -16, -12

pool off

;---------------------------------------------------------------------------------------------------

Modula_ActLikeAMoth:
#_1EBF13: LDA.w $0ED0,X
#_1EBF16: BNE .dont_shoot

#_1EBF18: LDA.b #$3F
#_1EBF1A: STA.w $0DF0,X

#_1EBF1D: INC.w $0D80,X

#_1EBF20: RTS

;---------------------------------------------------------------------------------------------------

.dont_shoot
#_1EBF21: DEC.w $0ED0,X

#_1EBF24: JSR Mothula_FlapWings

#_1EBF27: LDA.w $0D90,X
#_1EBF2A: AND.b #$01
#_1EBF2C: TAY

#_1EBF2D: LDA.w $0F80,X
#_1EBF30: CLC
#_1EBF31: ADC.w .speed_z,Y
#_1EBF34: STA.w $0F80,X

#_1EBF37: CMP.w Sixteen_X,Y
#_1EBF3A: BNE .dont_change_z_speed

#_1EBF3C: INC.w $0D90,X

.dont_change_z_speed
#_1EBF3F: LDA.w $0DF0,X
#_1EBF42: BNE .direction_fine

#_1EBF44: INC.w $0DB0,X

#_1EBF47: LDA.w $0DB0,X
#_1EBF4A: CMP.b #$07
#_1EBF4C: BNE .pick_random_direction

#_1EBF4E: STZ.w $0DB0,X

#_1EBF51: BRA .target_link

.pick_random_direction
#_1EBF53: JSL GetRandomNumber
#_1EBF57: AND.b #$07
#_1EBF59: TAY

#_1EBF5A: LDA.w .speed_x,Y
#_1EBF5D: STA.w $0D50,X

#_1EBF60: LDA.w .speed_y,Y
#_1EBF63: STA.w $0D40,X

#_1EBF66: JSL GetRandomNumber
#_1EBF6A: AND.b #$1F
#_1EBF6C: ADC.b #$40
#_1EBF6E: STA.w $0DF0,X

#_1EBF71: BRA .direction_fine

;---------------------------------------------------------------------------------------------------

.target_link
#_1EBF73: LDA.b #$20
#_1EBF75: JSL Sprite_ApplySpeedTowardsLink_long
#_1EBF79: LDA.b #$80
#_1EBF7B: STA.w $0DF0,X

.direction_fine
#_1EBF7E: LDA.w $0E70,X
#_1EBF81: BNE .skip_movement

#_1EBF83: JSR Sprite_Move_XY_Bank1E

.skip_movement
#_1EBF86: JSR Sprite_Move_Z_Bank1E
#_1EBF89: JSR Sprite_CheckTileCollision_Bank1E
#_1EBF8C: BEQ .no_tile_collision

#_1EBF8E: STZ.w $0DF0,X

.no_tile_collision
#_1EBF91: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1EBF94: INC.w $0E80,X
#_1EBF97: INC.w $0E80,X

#_1EBF9A: RTS

;===================================================================================================

pool Mothula_FlapWings

.anim_step
#_1EBF9B: db $00, $01, $02, $01

pool off

;---------------------------------------------------------------------------------------------------

Mothula_FlapWings:
#_1EBF9F: INC.w $0E80,X

#_1EBFA2: LDA.w $0E80,X
#_1EBFA5: LSR A
#_1EBFA6: LSR A
#_1EBFA7: AND.b #$03
#_1EBFA9: TAY

#_1EBFAA: BNE .no_sfx

#_1EBFAC: LDA.b #$02 ; SFX3.02
#_1EBFAE: JSL SpriteSFX_QueueSFX3WithPan

.no_sfx
#_1EBFB2: LDA.w .anim_step,Y
#_1EBFB5: STA.w $0DC0,X

#_1EBFB8: RTS

;===================================================================================================

Modula_FireBeams:
#_1EBFB9: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1EBFBC: LDA.w $0DF0,X
#_1EBFBF: BNE .delay

#_1EBFC1: DEC.w $0D80,X

#_1EBFC4: JSL GetRandomNumber
#_1EBFC8: AND.b #$1F
#_1EBFCA: ORA.b #$40
#_1EBFCC: STA.w $0ED0,X

#_1EBFCF: RTS

.delay
#_1EBFD0: CMP.b #$20
#_1EBFD2: BNE .not_yet

#_1EBFD4: JSR Mothula_SpawnBeams

.not_yet
#_1EBFD7: BRA Mothula_FlapWings

;===================================================================================================

pool Mothula_SpawnBeams

.speed_and_offset_x
#_1EBFD9: db -16,   0,  16

.speed_y
#_1EBFDC: db  24,  32,  24

pool off

;---------------------------------------------------------------------------------------------------

Mothula_SpawnBeams:
#_1EBFDF: LDA.b #$36 ; SFX3.36
#_1EBFE1: JSL SpriteSFX_QueueSFX3WithPan

#_1EBFE5: LDA.b #$02
#_1EBFE7: STA.w $0FB5

.next_spawn
#_1EBFEA: LDA.b #$89 ; SPRITE 89
#_1EBFEC: JSL Sprite_SpawnDynamically
#_1EBFF0: BMI .no_space

#_1EBFF2: JSL Sprite_SetSpawnedCoordinates

#_1EBFF6: LDA.b $02
#_1EBFF8: SEC
#_1EBFF9: SBC.b $04

#_1EBFFB: CLC
#_1EBFFC: ADC.b #$03
#_1EBFFE: STA.w $0D00,Y

#_1EC001: LDA.b #$10
#_1EC003: STA.w $0DF0,Y
#_1EC006: STA.w $0BA0,Y

#_1EC009: PHX

#_1EC00A: LDX.w $0FB5

#_1EC00D: LDA.b $00
#_1EC00F: CLC
#_1EC010: ADC.w .speed_and_offset_x,X
#_1EC013: STA.w $0D10,Y

#_1EC016: LDA.w .speed_and_offset_x,X
#_1EC019: STA.w $0D50,Y

#_1EC01C: LDA.w .speed_y,X
#_1EC01F: STA.w $0D40,Y

#_1EC022: LDA.b #$00
#_1EC024: STA.w $0F70,Y

#_1EC027: PLX

.no_space
#_1EC028: DEC.w $0FB5
#_1EC02B: BPL .next_spawn

#_1EC02D: RTS

;===================================================================================================

pool Mothula_HandleSpikes

.position_x
#_1EC02E: db $38, $48, $58, $68, $88, $98, $A8, $B8
#_1EC036: db $C8, $C8, $C8, $C8, $C8, $C8, $C8, $B8
#_1EC03E: db $A8, $98, $78, $68, $58, $48, $38, $28
#_1EC046: db $28, $28, $28, $28, $28, $28

.position_y
#_1EC04C: db $38, $38, $38, $38, $38, $38, $38, $38
#_1EC054: db $48, $58, $68, $78, $98, $A8, $B8, $C8
#_1EC05C: db $C8, $C8, $C8, $C8, $C8, $C8, $C8, $B8
#_1EC064: db $A8, $98, $78, $68, $58, $48

.direction
#_1EC06A: db $02, $02, $02, $02, $02, $02, $02, $02
#_1EC072: db $01, $01, $01, $01, $01, $01, $01, $03
#_1EC07A: db $03, $03, $03, $03, $03, $03, $03, $00
#_1EC082: db $00, $00, $00, $00, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

Mothula_HandleSpikes:
#_1EC088: DEC.w $0EB0,X
#_1EC08B: BNE .exit

#_1EC08D: LDA.b #$40
#_1EC08F: STA.w $0EB0,X

#_1EC092: LDA.b #$8A ; SPRITE 8A
#_1EC094: JSL Sprite_SpawnDynamically
#_1EC098: BMI .exit

#_1EC09A: PHX

#_1EC09B: JSL GetRandomNumber
#_1EC09F: AND.b #$1F
#_1EC0A1: CMP.b #$1E
#_1EC0A3: BCC .rng_roll_in_range

#_1EC0A5: SBC.b #$1E

.rng_roll_in_range
#_1EC0A7: TAX

#_1EC0A8: LDA.w .position_x,X
#_1EC0AB: STA.w $0D10,Y
#_1EC0AE: STA.w $0D90,Y

#_1EC0B1: LDA.w .position_y,X
#_1EC0B4: DEC A
#_1EC0B5: STA.w $0D00,Y
#_1EC0B8: STA.w $0DA0,Y

#_1EC0BB: LDA.w .direction,X
#_1EC0BE: STA.w $0DE0,Y

#_1EC0C1: LDA.b #$01
#_1EC0C3: STA.w $0E90,Y

#_1EC0C6: CLC
#_1EC0C7: ADC.w $0FB0
#_1EC0CA: STA.w $0D30,Y

#_1EC0CD: LDA.b #$01
#_1EC0CF: CLC
#_1EC0D0: ADC.w $0FB1
#_1EC0D3: STA.w $0D20,Y

#_1EC0D6: TYX

#_1EC0D7: LDA.b #$01
#_1EC0D9: STA.w $0D50,X

#_1EC0DC: JSL Sprite_Get16BitCoords_long
#_1EC0E0: JSR Sprite_CheckTileCollision_Bank1E

#_1EC0E3: STZ.w $0D50,X

#_1EC0E6: LDA.w $0D90,X
#_1EC0E9: STA.w $0D10,X

#_1EC0EC: LDA.w $0DA0,X
#_1EC0EF: STA.w $0D00,X

#_1EC0F2: LDA.w $0E70,X
#_1EC0F5: BNE .keep_spawn

#_1EC0F7: STZ.w $0DD0,X

#_1EC0FA: PLX

#_1EC0FB: LDA.b #$01
#_1EC0FD: STA.w $0EB0,X

#_1EC100: RTS

.keep_spawn
#_1EC101: PLX

.exit
#_1EC102: RTS

;===================================================================================================

Sprite_86_Kodongo:
#_1EC103: JSL SpriteDraw_SingleLarge_long
#_1EC107: JSR Sprite_CheckIfActive_Bank1E
#_1EC10A: JSR Sprite_CheckIfRecoiling_Bank1E
#_1EC10D: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1EC110: STZ.w $0B6B,X

#_1EC113: LDA.w $0D80,X
#_1EC116: JSL JumpTableLocal
#_1EC11A: dw Kodongo_MakeDecision
#_1EC11C: dw Kodongo_Move
#_1EC11E: dw Kodongo_ShootFire

;===================================================================================================

pool Kodongo_MakeDecision

.speed_x
#_1EC120: db  1, -1,  0,  0

.speed_y
#_1EC124: db  0,  0,  1, -1

pool off

;---------------------------------------------------------------------------------------------------

Kodongo_MakeDecision:
#_1EC128: INC.w $0D80,X

#_1EC12B: JSL GetRandomNumber
#_1EC12F: AND.b #$03
#_1EC131: STA.w $0DE0,X

#_1EC134: LDA.b #$B0
#_1EC136: STA.w $0B6B,X

.try_new_direction
#_1EC139: LDY.w $0DE0,X

#_1EC13C: LDA.w .speed_x,Y
#_1EC13F: STA.w $0D50,X

#_1EC142: LDA.w .speed_y,Y
#_1EC145: STA.w $0D40,X

#_1EC148: JSR Sprite_CheckTileCollision_Bank1E
#_1EC14B: BEQ Kodongo_SetDirection

#_1EC14D: LDA.w $0DE0,X
#_1EC150: INC A
#_1EC151: AND.b #$03
#_1EC153: STA.w $0DE0,X

#_1EC156: BRA .try_new_direction

;===================================================================================================

Kodongo_SetDirection:
#_1EC158: LDY.w $0DE0,X

#_1EC15B: LDA.w Sixteen_X,Y
#_1EC15E: STA.w $0D50,X

#_1EC161: LDA.w Sixteen_Y,Y
#_1EC164: STA.w $0D40,X

#_1EC167: RTS

;===================================================================================================

pool Kodongo_Move

.anim_step
#_1EC168: db $02, $02, $00, $05, $03, $03, $00, $05

.flip
#_1EC170: db $40, $00, $00, $00, $40, $00, $40, $40

pool off

;---------------------------------------------------------------------------------------------------

Kodongo_Move:
#_1EC178: JSR Sprite_Move_XY_Bank1E
#_1EC17B: JSR Sprite_CheckTileCollision_Bank1E
#_1EC17E: BEQ .no_tile_collision

#_1EC180: LDA.w $0DE0,X
#_1EC183: EOR.b #$01
#_1EC185: STA.w $0DE0,X

#_1EC188: JSR Kodongo_SetDirection

.no_tile_collision
#_1EC18B: LDA.w $0D10,X
#_1EC18E: AND.b #$1F
#_1EC190: CMP.b #$04
#_1EC192: BNE .dont_breathe_fire

#_1EC194: LDA.w $0D00,X
#_1EC197: AND.b #$1F
#_1EC199: CMP.b #$1B
#_1EC19B: BNE .dont_breathe_fire

#_1EC19D: JSL GetRandomNumber
#_1EC1A1: AND.b #$03
#_1EC1A3: BNE .dont_breathe_fire

#_1EC1A5: LDA.b #$6F
#_1EC1A7: STA.w $0DF0,X

#_1EC1AA: INC.w $0D80,X

#_1EC1AD: STZ.w $0D90,X

.dont_breathe_fire
#_1EC1B0: INC.w $0E80,X

#_1EC1B3: LDA.w $0E80,X
#_1EC1B6: AND.b #$04
#_1EC1B8: ORA.w $0DE0,X
#_1EC1BB: TAY

#_1EC1BC: LDA.w .anim_step,Y
#_1EC1BF: STA.w $0DC0,X

#_1EC1C2: LDA.w $0F50,X
#_1EC1C5: AND.b #$BF
#_1EC1C7: ORA.w .flip,Y
#_1EC1CA: STA.w $0F50,X

#_1EC1CD: RTS

;===================================================================================================

pool Kodongo_ShootFire

.anim_step
#_1EC1CE: db $02, $02, $00, $05, $04, $04, $01, $06

pool off

;---------------------------------------------------------------------------------------------------

Kodongo_ShootFire:
#_1EC1D6: LDA.w $0DF0,X
#_1EC1D9: BNE .wait

#_1EC1DB: STZ.w $0D80,X

.wait
#_1EC1DE: LDY.b #$00

#_1EC1E0: SEC
#_1EC1E1: SBC.b #$20

#_1EC1E3: CMP.b #$30
#_1EC1E5: BCS .wait_more

#_1EC1E7: LDY.b #$04

.wait_more
#_1EC1E9: CPY.b #$04
#_1EC1EB: BNE .dont_fire

#_1EC1ED: LDA.w $0DF0,X
#_1EC1F0: AND.b #$0F
#_1EC1F2: BNE .dont_fire

#_1EC1F4: PHY

#_1EC1F5: JSR Kodongo_SpawnFire

#_1EC1F8: PLY

.dont_fire
#_1EC1F9: TYA
#_1EC1FA: ORA.w $0DE0,X
#_1EC1FD: TAY

#_1EC1FE: LDA.w .anim_step,Y
#_1EC201: STA.w $0DC0,X

#_1EC204: RTS

;===================================================================================================

pool Kodongo_SpawnFire

.offset_x_low
#_1EC205: db   8,  -8,   0,   0

.offset_x_high
#_1EC209: db   0,  -1,   0,   0

.offset_y_low
#_1EC20D: db   0,   0,   8,  -8

.offset_y_high
#_1EC211: db   0,   0,   0,  -1

.speed_x
#_1EC215: db  24, -24,   0,   0

.speed_y
#_1EC219: db   0,   0,  24, -24

#_1EC21D: db  64,  56,  48,  40, 32,  24

pool off

;---------------------------------------------------------------------------------------------------

Kodongo_SpawnFire:
#_1EC223: LDA.b #$87 ; SPRITE 87
#_1EC225: LDY.b #$0D
#_1EC227: JSL Sprite_SpawnDynamically_slot_limited
#_1EC22B: BMI .no_space

#_1EC22D: PHX

#_1EC22E: LDA.w $0DE0,X
#_1EC231: TAX

#_1EC232: LDA.b $00
#_1EC234: CLC
#_1EC235: ADC.w .offset_x_low,X
#_1EC238: STA.w $0D10,Y

#_1EC23B: LDA.b $01
#_1EC23D: ADC.w .offset_x_high,X
#_1EC240: STA.w $0D30,Y

#_1EC243: LDA.b $02
#_1EC245: CLC
#_1EC246: ADC.w .offset_y_low,X
#_1EC249: STA.w $0D00,Y

#_1EC24C: LDA.b $03
#_1EC24E: ADC.w .offset_y_high,X
#_1EC251: STA.w $0D20,Y

#_1EC254: LDA.w .speed_x,X
#_1EC257: STA.w $0D50,Y

#_1EC25A: LDA.w .speed_y,X
#_1EC25D: STA.w $0D40,Y

#_1EC260: LDA.b #$01
#_1EC262: STA.w $0BA0,Y

#_1EC265: PLX

.no_space
#_1EC266: RTS

;===================================================================================================

Sprite_CheckDamageToAndFromLink_Bank1E:
#_1EC267: JSL Sprite_CheckDamageFromLink_long

;===================================================================================================

Sprite_CheckDamageToLink_Bank1E:
#_1EC26B: JSL Sprite_CheckDamageToLink_long

#_1EC26F: RTS

;===================================================================================================

pool Sprite_87_KodongoFire

.flip
#_1EC270: db $00, $40, $C0, $80

pool off

;---------------------------------------------------------------------------------------------------

Sprite_87_KodongoFire:
#_1EC274: LDA.w $0DF0,X
#_1EC277: BNE LingeringFlame

#_1EC279: JSL SpriteDraw_SingleLarge_long
#_1EC27D: JSR Sprite_CheckIfActive_Bank1E

#_1EC280: LDA.b $1A
#_1EC282: LSR A
#_1EC283: LSR A
#_1EC284: AND.b #$03
#_1EC286: TAY

#_1EC287: LDA.w $0F50,X
#_1EC28A: AND.b #$3F
#_1EC28C: ORA.w .flip,Y
#_1EC28F: STA.w $0F50,X

#_1EC292: JSR Sprite_CheckDamageToLink_Bank1E
#_1EC295: BCS .collided

#_1EC297: JSR Sprite_Move_XY_Bank1E
#_1EC29A: JSR Sprite_CheckTileCollision_Bank1E
#_1EC29D: BNE .collided

#_1EC29F: RTS

.collided
#_1EC2A0: LDA.b #$7F
#_1EC2A2: STA.w $0DF0,X

#_1EC2A5: LDA.w $0F50,X
#_1EC2A8: AND.b #$3F
#_1EC2AA: STA.w $0F50,X

#_1EC2AD: LDA.b #$2A ; SFX2.2A
#_1EC2AF: JSL SpriteSFX_QueueSFX2WithPan

#_1EC2B3: RTS

;===================================================================================================

LingeringFlameDrawStep:
#_1EC2B4: db $05, $04, $03, $01, $02, $00, $03, $00
#_1EC2BC: db $01, $02, $03, $00, $01, $02, $03, $00
#_1EC2C4: db $01, $02, $03, $00, $01, $02, $03, $00
#_1EC2CC: db $01, $02, $03, $00, $01, $02, $03, $00

;===================================================================================================

LingeringFlame:
#_1EC2D4: JSL Sprite_CheckDamageFromLink_long
#_1EC2D8: BCC .nohit

#_1EC2DA: DEC.w $0DF0,X
#_1EC2DD: BEQ .extinguish

.nohit
#_1EC2DF: LDA.w $0DF0,X
#_1EC2E2: DEC A
#_1EC2E3: BNE .continue_burning

.extinguish
#_1EC2E5: STZ.w $0DD0,X

.continue_burning
#_1EC2E8: LDA.w $0DF0,X
#_1EC2EB: LSR A
#_1EC2EC: LSR A
#_1EC2ED: LSR A
#_1EC2EE: TAY

#_1EC2EF: LDA.w LingeringFlameDrawStep,Y
#_1EC2F2: STA.w $0DC0,X

#_1EC2F5: JSL SpriteDraw_Flame
#_1EC2F9: JMP.w Sprite_CheckDamageToLink_Bank1E

;===================================================================================================

pool SpriteDraw_Flame

.oam_groups
#_1EC2FC: dw   0,   0 : db $8E, $01, $00, $02
#_1EC304: dw   0,   0 : db $8E, $01, $00, $02

#_1EC30C: dw   0,   0 : db $A0, $01, $00, $02
#_1EC314: dw   0,   0 : db $A0, $01, $00, $02

#_1EC31C: dw   0,   0 : db $8E, $41, $00, $02
#_1EC324: dw   0,   0 : db $8E, $41, $00, $02

#_1EC32C: dw   0,   0 : db $A0, $41, $00, $02
#_1EC334: dw   0,   0 : db $A0, $41, $00, $02

#_1EC33C: dw   0,   0 : db $A2, $01, $00, $02
#_1EC344: dw   0,   0 : db $A2, $01, $00, $02

#_1EC34C: dw   0,  -6 : db $A4, $01, $00, $00
#_1EC354: dw   8,  -6 : db $A5, $01, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Flame:
#_1EC35C: PHB
#_1EC35D: PHK
#_1EC35E: PLB

#_1EC35F: LDA.b #$00
#_1EC361: XBA
#_1EC362: LDA.w $0DC0,X

#_1EC365: REP #$20

#_1EC367: ASL A
#_1EC368: ASL A
#_1EC369: ASL A
#_1EC36A: ASL A

#_1EC36B: ADC.w #.oam_groups
#_1EC36E: STA.b $08

#_1EC370: SEP #$20

#_1EC372: LDA.b #$02
#_1EC374: JSR SpriteDraw_Tabulated_Bank1E

#_1EC377: PLB

#_1EC378: RTL

;===================================================================================================

pool Sprite_85_YellowStalfos

.priority
#_1EC379: db $30, $00, $00, $00, $30, $00

pool off

;---------------------------------------------------------------------------------------------------

Sprite_85_YellowStalfos:
#_1EC37F: LDA.w $0D90,X
#_1EC382: BNE .tile_already_checked

#_1EC384: LDA.b #$01
#_1EC386: STA.w $0D50,X
#_1EC389: STA.w $0D40,X

#_1EC38C: JSR Sprite_CheckTileCollision_Bank1E
#_1EC38F: BEQ .can_spawn

#_1EC391: STZ.w $0DD0,X

#_1EC394: RTS

;---------------------------------------------------------------------------------------------------

.can_spawn
#_1EC395: INC.w $0D90,X

#_1EC398: LDA.b #$0A
#_1EC39A: STA.w $0DB0,X

#_1EC39D: LDA.w $0E60,X
#_1EC3A0: ORA.b #$40
#_1EC3A2: STA.w $0E60,X

#_1EC3A5: LDA.b #$20 ; SFX2.20
#_1EC3A7: JSL SpriteSFX_QueueSFX2WithPan

.tile_already_checked
#_1EC3AB: LDY.w $0D80,X

#_1EC3AE: LDA.w $0B89,X
#_1EC3B1: ORA.w .priority,Y
#_1EC3B4: STA.w $0B89,X

#_1EC3B7: JSR SpriteDraw_YellowStalfos
#_1EC3BA: JSR Sprite_CheckIfActive_Bank1E

#_1EC3BD: LDA.l $7EF359
#_1EC3C1: CMP.b #$03
#_1EC3C3: BCC .dont_recoil_from_sword

#_1EC3C5: JSR Sprite_CheckIfRecoiling_Bank1E

#_1EC3C8: BRA .continue

.dont_recoil_from_sword
#_1EC3CA: LDA.w $0D80,X
#_1EC3CD: CMP.b #$05
#_1EC3CF: BEQ .continue

#_1EC3D1: LDA.w $0EF0,X
#_1EC3D4: BEQ .continue

#_1EC3D6: STZ.w $0EF0,X

#_1EC3D9: LDA.b #$05
#_1EC3DB: STA.w $0D80,X

#_1EC3DE: LDA.b #$FF
#_1EC3E0: STA.w $0DF0,X

;---------------------------------------------------------------------------------------------------

.continue
#_1EC3E3: LDA.b #$01
#_1EC3E5: STA.w $0BA0,X

#_1EC3E8: LDA.w $0D80,X
#_1EC3EB: JSL JumpTableLocal
#_1EC3EF: dw YellowStalfos_Descend
#_1EC3F1: dw YellowStalfos_TrackLink
#_1EC3F3: dw YellowStalfos_DecapitateSelf
#_1EC3F5: dw YellowStalfos_RegretDecapitatingSelf
#_1EC3F7: dw YellowStalfos_Ascend
#_1EC3F9: dw YellowStalfos_Collapsed

;===================================================================================================

YellowStalfos_Descend:
#_1EC3FB: LDA.b #$02
#_1EC3FD: STA.w $0EB0,X

#_1EC400: LDA.w $0F70,X
#_1EC403: PHA

#_1EC404: JSR Sprite_Move_Z_Bank1E

#_1EC407: LDA.w $0F80,X
#_1EC40A: CMP.b #$C0
#_1EC40C: BMI .at_max_z_speed

#_1EC40E: SEC
#_1EC40F: SBC.b #$03
#_1EC411: STA.w $0F80,X

.at_max_z_speed
#_1EC414: PLA
#_1EC415: EOR.w $0F70,X
#_1EC418: BPL .exit

#_1EC41A: LDA.w $0F70,X
#_1EC41D: BPL .exit

#_1EC41F: INC.w $0D80,X

#_1EC422: STZ.w $0F70,X
#_1EC425: STZ.w $0F80,X

#_1EC428: LDA.b #$40
#_1EC42A: STA.w $0DF0,X

#_1EC42D: JSR YellowStalfos_Animate

.exit
#_1EC430: RTS

;===================================================================================================

YellowStalfos_TrackLink:
#_1EC431: STZ.w $0BA0,X

#_1EC434: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1EC437: JSR Sprite_DirectionToFaceLink_Bank1E
#_1EC43A: TYA
#_1EC43B: STA.w $0DE0,X
#_1EC43E: STA.w $0EB0,X

#_1EC441: LDA.w $0DF0,X
#_1EC444: BNE YellowStalfos_MakeVulnerable

#_1EC446: INC.w $0D80,X

#_1EC449: LDA.b #$7F
#_1EC44B: STA.w $0DF0,X

;===================================================================================================

YellowStalfos_MakeVulnerable:
#_1EC44E: LDA.w $0E60,X
#_1EC451: AND.b #$BF
#_1EC453: STA.w $0E60,X

#_1EC456: RTS

;===================================================================================================

pool YellowStalfos_DecapitateSelf

.anim_step
#_1EC457: db $08, $05, $01, $01, $08, $05, $01, $01
#_1EC45F: db $08, $05, $01, $01, $07, $04, $02, $02
#_1EC467: db $07, $04, $02, $02, $07, $04, $02, $02
#_1EC46F: db $07, $04, $02, $02, $07, $04, $02, $02

.head_offset_x
#_1EC477: db $80, $80, $80, $80, $80, $80, $80, $80
#_1EC47F: db $80, $80, $80, $80, $00, $00, $00, $00
#_1EC487: db $00, $00, $00, $00, $FF, $00, $01, $00
#_1EC48F: db $FF, $00, $01, $00, $00, $00, $00, $00

.head_offset_y
#_1EC497: db $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D
#_1EC49F: db $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D
#_1EC4A7: db $0D, $0C, $0B, $0A, $0A, $0A, $0A, $0A
#_1EC4AF: db $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A

pool off

;---------------------------------------------------------------------------------------------------

YellowStalfos_DecapitateSelf:
#_1EC4B7: STZ.w $0BA0,X

#_1EC4BA: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1EC4BD: LDA.w $0DF0,X
#_1EC4C0: BNE .delay

#_1EC4C2: INC.w $0D80,X

#_1EC4C5: LDA.b #$40
#_1EC4C7: STA.w $0DF0,X

#_1EC4CA: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_1EC4CB: CMP.b #$30
#_1EC4CD: BNE .cold_feet

#_1EC4CF: PHA

#_1EC4D0: JSR YellowStalfos_EmancipateHead

#_1EC4D3: PLA

.cold_feet
#_1EC4D4: LSR A
#_1EC4D5: LSR A
#_1EC4D6: AND.b #$FC

#_1EC4D8: ORA.w $0DE0,X
#_1EC4DB: TAY

#_1EC4DC: LDA.w .anim_step,Y
#_1EC4DF: STA.w $0DC0,X

#_1EC4E2: LDA.w $0DF0,X
#_1EC4E5: LSR A
#_1EC4E6: LSR A
#_1EC4E7: TAY

#_1EC4E8: LDA.w .head_offset_x,Y
#_1EC4EB: STA.w $0DA0,X

#_1EC4EE: LDA.w .head_offset_y,Y
#_1EC4F1: STA.w $0DB0,X

#_1EC4F4: JMP.w YellowStalfos_MakeVulnerable

;===================================================================================================

pool YellowStalfos_Animate

.step
#_1EC4F7: db $06, $03, $01, $01

pool off

;===================================================================================================

YellowStalfos_RegretDecapitatingSelf:
#_1EC4FB: STZ.w $0BA0,X

#_1EC4FE: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1EC501: LDA.w $0DF0,X
#_1EC504: BNE YellowStalfos_Animate

#_1EC506: INC.w $0D80,X

;===================================================================================================

YellowStalfos_Animate:
#_1EC509: LDY.w $0DE0,X

#_1EC50C: LDA.w .step,Y
#_1EC50F: STA.w $0DC0,X

#_1EC512: JMP.w YellowStalfos_MakeVulnerable

;===================================================================================================

YellowStalfos_Ascend:
#_1EC515: STZ.w $0DC0,X

#_1EC518: LDA.b #$02
#_1EC51A: STA.w $0EB0,X

#_1EC51D: LDA.w $0F70,X
#_1EC520: PHA

#_1EC521: JSR Sprite_Move_Z_Bank1E

#_1EC524: LDA.w $0F80,X
#_1EC527: CMP.b #$40
#_1EC529: BPL .at_max_z_speed

#_1EC52B: INC A
#_1EC52C: INC A
#_1EC52D: STA.w $0F80,X

.at_max_z_speed
#_1EC530: PLA
#_1EC531: EOR.w $0F70,X
#_1EC534: BPL .exit

#_1EC536: LDA.w $0F70,X
#_1EC539: BMI .exit

#_1EC53B: STZ.w $0DD0,X

.exit
#_1EC53E: RTS

;===================================================================================================

pool YellowStalfos_Collapsed

.anim_step
#_1EC53F: db $01, $01, $01, $09, $0A, $0A, $0A, $0A
#_1EC547: db $0A, $0A, $0A, $0A, $0A, $0A, $0A, $09

.head_offset
#_1EC54F: db $0A, $0A, $0A, $07, $00, $00, $00, $00
#_1EC557: db $00, $00, $00, $00, $00, $00, $00, $07

pool off

;---------------------------------------------------------------------------------------------------

YellowStalfos_Collapsed:
#_1EC55F: STZ.w $0BA0,X

#_1EC562: JSL Sprite_CheckDamageFromLink_long

#_1EC566: LDA.w $0DF0,X
#_1EC569: BNE .delay

#_1EC56B: DEC.w $0D80,X

.delay
#_1EC56E: LSR A
#_1EC56F: LSR A
#_1EC570: LSR A
#_1EC571: LSR A
#_1EC572: TAY

#_1EC573: LDA.w .anim_step,Y
#_1EC576: STA.w $0DC0,X

#_1EC579: LDA.w .head_offset,Y
#_1EC57C: STA.w $0DB0,X

#_1EC57F: RTS

;===================================================================================================

YellowStalfos_EmancipateHead:
#_1EC580: LDA.b #$02 ; SPRITE 02
#_1EC582: JSL Sprite_SpawnDynamically
#_1EC586: BMI .no_space

#_1EC588: JSL Sprite_SetSpawnedCoordinates

#_1EC58C: LDA.b #$0D
#_1EC58E: STA.w $0F70,Y

#_1EC591: PHX
#_1EC592: TYX

#_1EC593: LDA.b #$10
#_1EC595: JSL Sprite_ApplySpeedTowardsLink_long

#_1EC599: PLX

#_1EC59A: LDA.b #$FF
#_1EC59C: STA.w $0DF0,Y

#_1EC59F: LDA.b #$20
#_1EC5A1: STA.w $0E00,Y

.no_space
#_1EC5A4: RTS

;===================================================================================================

pool SpriteDraw_YellowStalfos

.oam_groups
#_1EC5A5: dw   0,   0 : db $0A, $00, $00, $02
#_1EC5AD: dw   0,   0 : db $0A, $00, $00, $02

#_1EC5B5: dw   0,   0 : db $0C, $00, $00, $02
#_1EC5BD: dw   0,   0 : db $0C, $00, $00, $02

#_1EC5C5: dw   0,   0 : db $2C, $00, $00, $02
#_1EC5CD: dw   0,   0 : db $2C, $00, $00, $02

#_1EC5D5: dw   5,   5 : db $2E, $00, $00, $00
#_1EC5DD: dw   0,   0 : db $24, $00, $00, $02

#_1EC5E5: dw   4,   1 : db $3E, $00, $00, $00
#_1EC5ED: dw   0,   0 : db $24, $00, $00, $02

#_1EC5F5: dw   0,   0 : db $0E, $00, $00, $02
#_1EC5FD: dw   0,   0 : db $0E, $00, $00, $02

#_1EC605: dw   3,   5 : db $2E, $40, $00, $00
#_1EC60D: dw   0,   0 : db $24, $40, $00, $02

#_1EC615: dw   4,   1 : db $3E, $40, $00, $00
#_1EC61D: dw   0,   0 : db $24, $40, $00, $02

#_1EC625: dw   0,   0 : db $0E, $40, $00, $02
#_1EC62D: dw   0,   0 : db $0E, $40, $00, $02

#_1EC635: dw   0,   0 : db $2A, $00, $00, $02
#_1EC63D: dw   0,   0 : db $2A, $00, $00, $02

#_1EC645: dw   0,   0 : db $2A, $00, $00, $02
#_1EC64D: dw   0,   0 : db $2A, $00, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_YellowStalfos:
#_1EC655: LDA.b #$00
#_1EC657: XBA
#_1EC658: LDA.w $0DC0,X

#_1EC65B: REP #$20

#_1EC65D: ASL A
#_1EC65E: ASL A
#_1EC65F: ASL A
#_1EC660: ASL A
#_1EC661: ADC.w #.oam_groups
#_1EC664: STA.b $08

#_1EC666: LDA.b $90
#_1EC668: CLC
#_1EC669: ADC.w #$0004
#_1EC66C: STA.b $90

#_1EC66E: INC.b $92

#_1EC670: SEP #$20

#_1EC672: LDA.b #$02
#_1EC674: JSR SpriteDraw_Tabulated_Bank1E

;---------------------------------------------------------------------------------------------------

#_1EC677: REP #$20

#_1EC679: LDA.b $90
#_1EC67B: SEC
#_1EC67C: SBC.w #$0004
#_1EC67F: STA.b $90

#_1EC681: DEC.b $92

#_1EC683: SEP #$20

#_1EC685: LDA.w $0F00,X
#_1EC688: BNE .no_head

#_1EC68A: JSR .draw_head
#_1EC68D: JSL SpriteDraw_Shadow_long

.no_head
#_1EC691: RTS

;---------------------------------------------------------------------------------------------------

.char
#_1EC692: db $02, $02, $00, $04

.flip
#_1EC696: db $40, $00, $00, $00

;---------------------------------------------------------------------------------------------------

.draw_head
#_1EC69A: LDA.w $0DC0,X
#_1EC69D: CMP.b #$0A
#_1EC69F: BEQ .exit

#_1EC6A1: LDA.w $0DA0,X

#_1EC6A4: STZ.b $0D

#_1EC6A6: CMP.b #$80
#_1EC6A8: BEQ .exit

#_1EC6AA: STA.b $0C

#_1EC6AC: CMP.b #$00
#_1EC6AE: BPL .positive

#_1EC6B0: DEC.b $0D

.positive
#_1EC6B2: LDA.w $0DB0,X
#_1EC6B5: STA.b $0A
#_1EC6B7: STZ.b $0B

#_1EC6B9: LDY.b #$00

#_1EC6BB: PHX

#_1EC6BC: LDA.w $0EB0,X
#_1EC6BF: TAX

;---------------------------------------------------------------------------------------------------

#_1EC6C0: REP #$20

#_1EC6C2: LDA.b $00
#_1EC6C4: CLC
#_1EC6C5: ADC.b $0C
#_1EC6C7: STA.b ($90),Y

#_1EC6C9: AND.w #$0100
#_1EC6CC: STA.b $0E

#_1EC6CE: LDA.b $02
#_1EC6D0: SEC
#_1EC6D1: SBC.b $0A

#_1EC6D3: INY
#_1EC6D4: STA.b ($90),Y

#_1EC6D6: CLC
#_1EC6D7: ADC.w #$0010

#_1EC6DA: CMP.w #$0100
#_1EC6DD: BCC .on_screen

#_1EC6DF: LDA.w #$00F0
#_1EC6E2: STA.b ($90),Y

.on_screen
#_1EC6E4: SEP #$20

#_1EC6E6: LDA.w .char,X
#_1EC6E9: INY
#_1EC6EA: STA.b ($90),Y

#_1EC6EC: LDA.w .flip,X
#_1EC6EF: INY
#_1EC6F0: ORA.b $05
#_1EC6F2: STA.b ($90),Y

#_1EC6F4: TYA
#_1EC6F5: LSR A
#_1EC6F6: LSR A
#_1EC6F7: TAY

#_1EC6F8: LDA.b #$02
#_1EC6FA: ORA.b $0F
#_1EC6FC: STA.b ($92),Y

#_1EC6FE: PLX

.exit
#_1EC6FF: RTS

;===================================================================================================

SpritePrep_Eyegore:
#_1EC700: LDA.w $048E

#_1EC703: CMP.b #$0C ; ROOM 010C
#_1EC705: BEQ .become_mimic

#_1EC707: CMP.b #$1B ; ROOM 001B
#_1EC709: BEQ .become_mimic

#_1EC70B: CMP.b #$4B ; ROOM 004B
#_1EC70D: BEQ .become_mimic

#_1EC70F: CMP.b #$6B ; ROOM 006B
#_1EC711: BNE .exit

.become_mimic
#_1EC713: INC.w $0DA0,X

#_1EC716: LDA.w $0E20,X
#_1EC719: CMP.b #$83 ; SPRITE 83
#_1EC71B: BNE .exit

#_1EC71D: STZ.w $0CAA,X

.exit
#_1EC720: RTL

;===================================================================================================

Mimic:

.speed_x
#_1EC721: db   0,  16, -16,   0,   0,  13, -13,   0
#_1EC729: db   0,  13, -13,   0,   0,   0,   0,   0

#_1EC731: db   0, -24,  24,   0,   0, -16,  16,   0
#_1EC739: db   0, -16,  16,   0,   0,   0,   0,   0

.speed_y
#_1EC741: db   0,   0,   0,   0, -16,  -5,  -5,   0
#_1EC749: db  16,  13,  13,   0,   0,   0,   0,   0

#_1EC751: db   0,   0,   0,   0, -24, -16, -16,   0
#_1EC759: db  24,  16,  16,   0,   0,   0,   0,   0

.direction
#_1EC761: db $00, $00, $01, $00, $03, $03, $03, $00
#_1EC769: db $02, $02, $02, $00, $00, $00, $00, $00

#_1EC771: db $00, $01, $00, $00, $03, $03, $03, $00
#_1EC779: db $02, $02, $02, $00, $00, $00, $00, $00

.anim_step
#_1EC781: db $08, $06, $00, $03, $09, $07, $01, $04

#_1EC789: db $08, $06, $00, $03, $09, $07, $02, $05

;===================================================================================================

Mimic_Stationary:
#_1EC791: STZ.w $0D90,X

#_1EC794: JSR Sprite_CheckDamageToAndFromLink_Bank1E
#_1EC797: JSR Sprite_CheckTileCollision_Bank1E

#_1EC79A: RTS

;===================================================================================================

Sprite_83_GreenEyegore:
Sprite_84_RedEyegore:
#_1EC79B: LDA.w $0DA0,X
#_1EC79E: BNE Mimic_Main

#_1EC7A0: JMP.w Eyegore_Main

;===================================================================================================

Mimic_Main:
#_1EC7A3: JSL SpriteDraw_Mimic
#_1EC7A7: JSR Sprite_CheckIfActive_Bank1E
#_1EC7AA: JSR Sprite_CheckIfRecoiling_Bank1E

#_1EC7AD: LDA.w $0E00,X
#_1EC7B0: BEQ .dont_shoot

#_1EC7B2: CMP.b #$08
#_1EC7B4: BNE .dont_shoot

#_1EC7B6: JSL Sprite_SpawnFirePhlegm

;---------------------------------------------------------------------------------------------------

.dont_shoot
#_1EC7BA: LDA.w $0048
#_1EC7BD: CMP.b #$00
#_1EC7BF: BNE Mimic_Stationary

#_1EC7C1: LDY.w $0E20,X

#_1EC7C4: LDA.b $F0
#_1EC7C6: AND.b #$0F
#_1EC7C8: BEQ Mimic_Stationary

#_1EC7CA: CPY.b #$84 ; SPRITE 84
#_1EC7CC: BNE .not_red_mimic

#_1EC7CE: ORA.b #$10

;---------------------------------------------------------------------------------------------------

.not_red_mimic
#_1EC7D0: TAY

#_1EC7D1: LDA.w Mimic_direction,Y
#_1EC7D4: STA.w $0DE0,X

#_1EC7D7: LDA.w Mimic_speed_x,Y
#_1EC7DA: STA.w $0D50,X

#_1EC7DD: LDA.w Mimic_speed_y,Y
#_1EC7E0: STA.w $0D40,X

#_1EC7E3: LDA.w $0E70,X
#_1EC7E6: BNE .tile_collision

#_1EC7E8: JSR Sprite_Move_XY_Bank1E

.tile_collision
#_1EC7EB: JSR Sprite_CheckDamageToAndFromLink_Bank1E
#_1EC7EE: JSR Sprite_CheckTileCollision_Bank1E

#_1EC7F1: INC.w $0E80,X

#_1EC7F4: LDA.w $0E80,X
#_1EC7F7: AND.b #$0C
#_1EC7F9: ORA.w $0DE0,X
#_1EC7FC: TAY

#_1EC7FD: LDA.w Mimic_anim_step,Y
#_1EC800: STA.w $0DC0,X

#_1EC803: LDA.w $0E20,X
#_1EC806: CMP.b #$84 ; SPRITE 84
#_1EC808: BNE .dont_prep_shot

#_1EC80A: JSR Sprite_DirectionToFaceLink_Bank1E

#_1EC80D: LDA.b $0F
#_1EC80F: CLC
#_1EC810: ADC.b #$08

#_1EC812: CMP.b #$10
#_1EC814: BCC .link_in_sight

#_1EC816: LDA.b $0E
#_1EC818: CLC
#_1EC819: ADC.b #$08

#_1EC81B: CMP.b #$10
#_1EC81D: BCS .dont_prep_shot

;---------------------------------------------------------------------------------------------------

.link_in_sight
#_1EC81F: TYA
#_1EC820: CMP.w $0DE0,X
#_1EC823: BNE .dont_prep_shot

#_1EC825: LDA.w $0D90,X
#_1EC828: AND.b #$1F
#_1EC82A: BNE .need_to_charge

#_1EC82C: LDA.b #$10
#_1EC82E: STA.w $0E00,X

.need_to_charge
#_1EC831: INC.w $0D90,X

#_1EC834: RTS

.dont_prep_shot
#_1EC835: STZ.w $0D90,X

#_1EC838: RTS

;===================================================================================================

Eyegore_Main:
#_1EC839: JSR SpriteDraw_Eyegore
#_1EC83C: JSR Sprite_CheckIfActive_Bank1E
#_1EC83F: JSR Sprite_CheckIfRecoiling_Bank1E
#_1EC842: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1EC845: LDA.w $0E60,X
#_1EC848: ORA.b #$40
#_1EC84A: STA.w $0E60,X

#_1EC84D: LDA.w $0CAA,X
#_1EC850: ORA.b #$04
#_1EC852: STA.w $0CAA,X

#_1EC855: LDA.w $0D80,X
#_1EC858: JSL JumpTableLocal
#_1EC85C: dw Eyegore_Dormant
#_1EC85E: dw Eyegore_WakingUp
#_1EC860: dw Eyegore_Chase
#_1EC862: dw Eyegore_GoToSleep

;===================================================================================================

EyegoreMovementTimer:
#_1EC864: db  96, 128, 160, 128

;---------------------------------------------------------------------------------------------------

Eyegore_Dormant:
#_1EC868: LDA.w $0DF0,X
#_1EC86B: BNE .exit

#_1EC86D: JSR Sprite_DirectionToFaceLink_Bank1E

#_1EC870: LDA.b $0E
#_1EC872: CLC
#_1EC873: ADC.b #$30

#_1EC875: CMP.b #$60
#_1EC877: BCS .exit

#_1EC879: LDA.b $0F
#_1EC87B: CLC
#_1EC87C: ADC.b #$30

#_1EC87E: CMP.b #$60
#_1EC880: BCS .exit

#_1EC882: INC.w $0D80,X

#_1EC885: LDA.b #$3F
#_1EC887: STA.w $0DF0,X

.exit
#_1EC88A: RTS

;===================================================================================================

pool Eyegore_WakingUp

.anim_step
#_1EC88B: db $02, $02, $02, $02
#_1EC88F: db $01, $01, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

Eyegore_WakingUp:
#_1EC893: LDA.w $0DF0,X
#_1EC896: BNE .waking_up

#_1EC898: JSR Sprite_DirectionToFaceLink_Bank1E
#_1EC89B: TYA
#_1EC89C: STA.w $0DE0,X

#_1EC89F: INC.w $0D80,X

#_1EC8A2: JSL GetRandomNumber
#_1EC8A6: AND.b #$03
#_1EC8A8: TAY

#_1EC8A9: LDA.w EyegoreMovementTimer,Y
#_1EC8AC: STA.w $0DF0,X

#_1EC8AF: RTS

;---------------------------------------------------------------------------------------------------

.waking_up
#_1EC8B0: LSR A
#_1EC8B1: LSR A
#_1EC8B2: LSR A
#_1EC8B3: TAY

#_1EC8B4: LDA.w .anim_step,Y
#_1EC8B7: STA.w $0DC0,X

#_1EC8BA: RTS

;===================================================================================================

pool Eyegore_Chase

.anim_step
#_1EC8BB: db $07, $05, $02, $09, $08, $06, $03, $0A
#_1EC8C3: db $07, $05, $02, $09, $08, $06, $04, $0B

pool off

;---------------------------------------------------------------------------------------------------

Eyegore_Chase:
#_1EC8CB: LDA.w $0E60,X
#_1EC8CE: AND.b #$BF
#_1EC8D0: STA.w $0E60,X

#_1EC8D3: LDA.w $0E20,X
#_1EC8D6: CMP.b #$84 ; SPRITE 84
#_1EC8D8: BEQ .not_red

#_1EC8DA: LDA.w $0CAA,X
#_1EC8DD: AND.b #$FB
#_1EC8DF: STA.w $0CAA,X

.not_red
#_1EC8E2: LDA.w $0DF0,X
#_1EC8E5: BNE .continue_chase

#_1EC8E7: LDA.b #$3F
#_1EC8E9: STA.w $0DF0,X

#_1EC8EC: INC.w $0D80,X

#_1EC8EF: STZ.w $0DC0,X

#_1EC8F2: RTS

;---------------------------------------------------------------------------------------------------

.continue_chase
#_1EC8F3: TXA
#_1EC8F4: EOR.b $1A
#_1EC8F6: AND.b #$1F
#_1EC8F8: BNE .dont_turn

#_1EC8FA: JSR Sprite_DirectionToFaceLink_Bank1E
#_1EC8FD: TYA
#_1EC8FE: STA.w $0DE0,X

.dont_turn
#_1EC901: LDY.w $0DE0,X

#_1EC904: LDA.w Sixteen_X,Y
#_1EC907: STA.w $0D50,X

#_1EC90A: LDA.w Sixteen_Y,Y
#_1EC90D: STA.w $0D40,X

#_1EC910: LDA.w $0E70,X
#_1EC913: BNE .tile_collision

#_1EC915: JSR Sprite_Move_XY_Bank1E

;---------------------------------------------------------------------------------------------------

.tile_collision
#_1EC918: JSR Sprite_CheckTileCollision_Bank1E

#_1EC91B: INC.w $0E80,X

#_1EC91E: LDA.w $0E80,X
#_1EC921: AND.b #$0C
#_1EC923: ORA.w $0DE0,X
#_1EC926: TAY

#_1EC927: LDA.w .anim_step,Y
#_1EC92A: STA.w $0DC0,X

#_1EC92D: RTS

;===================================================================================================

pool Eyegore_GoToSleep

.anim_step
#_1EC92E: db $00, $00, $01, $01, $02, $02, $02, $02

pool off

;---------------------------------------------------------------------------------------------------

Eyegore_GoToSleep:
#_1EC936: LDA.w $0DF0,X
#_1EC939: BNE .closing_eye

#_1EC93B: STZ.w $0D80,X

#_1EC93E: LDA.b #$60
#_1EC940: STA.w $0DF0,X

#_1EC943: RTS

.closing_eye
#_1EC944: LSR A
#_1EC945: LSR A
#_1EC946: LSR A
#_1EC947: TAY

#_1EC948: LDA.w .anim_step,Y
#_1EC94B: STA.w $0DC0,X

#_1EC94E: RTS

;===================================================================================================

pool SpriteDraw_Eyegore

.oam_groups
#_1EC94F: dw  -4,  -4 : db $A2, $00, $00, $02
#_1EC957: dw   4,  -4 : db $A2, $40, $00, $02
#_1EC95F: dw  -4,   4 : db $9C, $00, $00, $02
#_1EC967: dw   4,   4 : db $9C, $40, $00, $02

#_1EC96F: dw  -4,  -4 : db $A4, $00, $00, $02
#_1EC977: dw   4,  -4 : db $A4, $40, $00, $02
#_1EC97F: dw  -4,   4 : db $9C, $00, $00, $02
#_1EC987: dw   4,   4 : db $9C, $40, $00, $02

#_1EC98F: dw  -4,  -4 : db $8C, $00, $00, $02
#_1EC997: dw   4,  -4 : db $8C, $40, $00, $02
#_1EC99F: dw  -4,   4 : db $9C, $00, $00, $02
#_1EC9A7: dw   4,   4 : db $9C, $40, $00, $02

#_1EC9AF: dw  -4,  -3 : db $8C, $00, $00, $02
#_1EC9B7: dw  12,  -3 : db $8C, $40, $00, $00
#_1EC9BF: dw  -4,  13 : db $BC, $00, $00, $00
#_1EC9C7: dw   4,   5 : db $8A, $40, $00, $02

#_1EC9CF: dw  -4,  -3 : db $8C, $00, $00, $00
#_1EC9D7: dw   4,  -3 : db $8C, $40, $00, $02
#_1EC9DF: dw  -4,   5 : db $8A, $00, $00, $02
#_1EC9E7: dw  12,  13 : db $BC, $40, $00, $00

#_1EC9EF: dw   0,  -4 : db $AA, $00, $00, $02
#_1EC9F7: dw   0,   4 : db $A6, $00, $00, $02
#_1EC9FF: dw   0,  -4 : db $AA, $00, $00, $02
#_1ECA07: dw   0,   4 : db $A6, $00, $00, $02

#_1ECA0F: dw   0,  -3 : db $AA, $00, $00, $02
#_1ECA17: dw   0,   4 : db $A8, $00, $00, $02
#_1ECA1F: dw   0,  -3 : db $AA, $00, $00, $02
#_1ECA27: dw   0,   4 : db $A8, $00, $00, $02

#_1ECA2F: dw   0,  -4 : db $AA, $40, $00, $02
#_1ECA37: dw   0,   4 : db $A6, $40, $00, $02
#_1ECA3F: dw   0,  -4 : db $AA, $40, $00, $02
#_1ECA47: dw   0,   4 : db $A6, $40, $00, $02

#_1ECA4F: dw   0,  -3 : db $AA, $40, $00, $02
#_1ECA57: dw   0,   4 : db $A8, $40, $00, $02
#_1ECA5F: dw   0,  -3 : db $AA, $40, $00, $02
#_1ECA67: dw   0,   4 : db $A8, $40, $00, $02

#_1ECA6F: dw  -4,  -4 : db $8E, $00, $00, $02
#_1ECA77: dw   4,  -4 : db $8E, $40, $00, $02
#_1ECA7F: dw  -4,   4 : db $9E, $00, $00, $02
#_1ECA87: dw   4,   4 : db $9E, $40, $00, $02

#_1ECA8F: dw  -4,  -3 : db $8E, $00, $00, $02
#_1ECA97: dw  12,  -3 : db $8E, $40, $00, $00
#_1ECA9F: dw  -4,  13 : db $BD, $00, $00, $00
#_1ECAA7: dw   4,   5 : db $A0, $40, $00, $02

#_1ECAAF: dw  -4,  -3 : db $8E, $00, $00, $00
#_1ECAB7: dw   4,  -3 : db $8E, $40, $00, $02
#_1ECABF: dw  -4,   5 : db $A0, $00, $00, $02
#_1ECAC7: dw  12,  13 : db $BD, $40, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Eyegore:
#_1ECACF: LDA.b #$00
#_1ECAD1: XBA
#_1ECAD2: LDA.w $0DC0,X

#_1ECAD5: REP #$20

#_1ECAD7: ASL A
#_1ECAD8: ASL A
#_1ECAD9: ASL A
#_1ECADA: ASL A
#_1ECADB: ASL A

#_1ECADC: ADC.w #.oam_groups
#_1ECADF: STA.b $08

#_1ECAE1: SEP #$20

#_1ECAE3: LDA.b #$04
#_1ECAE5: JSR SpriteDraw_Tabulated_Bank1E

#_1ECAE8: LDA.w $0F00,X
#_1ECAEB: BNE .exit

#_1ECAED: LDA.b #$0E
#_1ECAEF: JSL SpriteDraw_Shadow_custom_long

.exit
#_1ECAF3: RTS

;===================================================================================================

pool SpritePrep_AntifairyCircle

.offset_x_low
#_1ECAF4: db  10,  20,  10

.offset_x_high
#_1ECAF7: db   0,   0,   0

.offset_y_low
#_1ECAFA: db -10,   0,  10

.offset_y_high
#_1ECAFD: db  -1,   0,   0

;---------------------------------------------------------------------------------------------------

.speed_x
#_1ECB00: db  18,   0, -18

.polarity_x
#_1ECB03: db $01, $01, $00

.speed_y
#_1ECB06: db   0,  18,   0

.polarity_y
#_1ECB09: db $00, $01, $01

pool off

;---------------------------------------------------------------------------------------------------

SpritePrep_AntifairyCircle:
#_1ECB0C: LDA.w $0D10,X
#_1ECB0F: SEC
#_1ECB10: SBC.b #$0A
#_1ECB12: STA.w $0D10,X

#_1ECB15: LDA.w $0D30,X
#_1ECB18: SBC.b #$00
#_1ECB1A: STA.w $0D30,X

#_1ECB1D: LDA.b #$EE
#_1ECB1F: STA.w $0D40,X

#_1ECB22: LDA.b #$00
#_1ECB24: STA.w $0D50,X

#_1ECB27: LDA.b #$00
#_1ECB29: STA.w $0D90,X

#_1ECB2C: LDA.b #$00
#_1ECB2E: STA.w $0DA0,X

#_1ECB31: LDA.b #$02
#_1ECB33: STA.w $0FB5

;---------------------------------------------------------------------------------------------------

.next_bubble
#_1ECB36: LDA.b #$82 ; SPRITE 82
#_1ECB38: JSL Sprite_SpawnDynamically
#_1ECB3C: BMI .no_space

#_1ECB3E: PHX

#_1ECB3F: LDX.w $0FB5

#_1ECB42: LDA.b $00
#_1ECB44: CLC
#_1ECB45: ADC.l .offset_x_low,X
#_1ECB49: STA.w $0D10,Y

#_1ECB4C: LDA.b $01
#_1ECB4E: ADC.l .offset_x_high,X
#_1ECB52: STA.w $0D30,Y

#_1ECB55: LDA.b $02
#_1ECB57: CLC
#_1ECB58: ADC.l .offset_y_low,X
#_1ECB5C: STA.w $0D00,Y

#_1ECB5F: LDA.b $03
#_1ECB61: ADC.l .offset_y_high,X
#_1ECB65: STA.w $0D20,Y

#_1ECB68: LDA.l .speed_x,X
#_1ECB6C: STA.w $0D50,Y

#_1ECB6F: LDA.l .speed_y,X
#_1ECB73: STA.w $0D40,Y

#_1ECB76: LDA.l .polarity_x,X
#_1ECB7A: STA.w $0D90,Y

#_1ECB7D: LDA.l .polarity_y,X
#_1ECB81: STA.w $0DA0,Y

#_1ECB84: PLX

.no_space
#_1ECB85: DEC.w $0FB5
#_1ECB88: BPL .next_bubble

#_1ECB8A: RTL

;===================================================================================================

UNREACHABLE_1ECB8B:
#_1ECB8B: db $00, $01, $00, $01, $00, $00, $40, $40

;===================================================================================================

pool Sprite_82_AntifairyCircle

.speed
#_1ECB93: db   1,   -1

.speed_max
#_1ECB95: db  18,  -18

pool off

;---------------------------------------------------------------------------------------------------

Sprite_82_AntifairyCircle:
#_1ECB97: JSL SpriteDraw_Antfairy
#_1ECB9B: JSR Sprite_CheckIfActive_Bank1E

#_1ECB9E: LDA.w $0D90,X
#_1ECBA1: AND.b #$01
#_1ECBA3: TAY

#_1ECBA4: LDA.w $0D50,X
#_1ECBA7: CLC
#_1ECBA8: ADC.w .speed,Y
#_1ECBAB: STA.w $0D50,X

#_1ECBAE: CMP.w .speed_max,Y
#_1ECBB1: BNE .not_at_max_x

#_1ECBB3: INC.w $0D90,X

.not_at_max_x
#_1ECBB6: LDA.w $0DA0,X
#_1ECBB9: AND.b #$01
#_1ECBBB: TAY

#_1ECBBC: LDA.w $0D40,X
#_1ECBBF: CLC
#_1ECBC0: ADC.w .speed,Y
#_1ECBC3: STA.w $0D40,X

#_1ECBC6: CMP.w .speed_max,Y
#_1ECBC9: BNE .not_at_max_y

#_1ECBCB: INC.w $0DA0,X

.not_at_max_y
#_1ECBCE: JSR Sprite_Move_XY_Bank1E

#_1ECBD1: LDA.w $0D50,X
#_1ECBD4: BEQ .keep_circling

#_1ECBD6: LDA.w $0D40,X
#_1ECBD9: BEQ .keep_circling

#_1ECBDB: JSL CheckIfRoomIsClear
#_1ECBDF: BCC .keep_circling

#_1ECBE1: LDA.b #$15 ; SPRITE 15
#_1ECBE3: STA.w $0E20,X

#_1ECBE6: LDA.b #$10
#_1ECBE8: LDY.w $0D50,X
#_1ECBEB: BPL .use_positive_x

#_1ECBED: LDA.b #$F0

.use_positive_x
#_1ECBEF: STA.w $0D50,X

#_1ECBF2: LDA.b #$10

#_1ECBF4: LDY.w $0D40,X
#_1ECBF7: BPL .use_positive_y

#_1ECBF9: LDA.b #$F0

.use_positive_y
#_1ECBFB: STA.w $0D40,X

.keep_circling
#_1ECBFE: JSR Sprite_CheckDamageToLink_Bank1E

#_1ECC01: RTS

;===================================================================================================

Sprite_81_Hover:
#_1ECC02: LDA.w $0B89,X
#_1ECC05: ORA.b #$30
#_1ECC07: STA.w $0B89,X

#_1ECC0A: JSL SpriteDraw_SingleLarge_long
#_1ECC0E: JSR Sprite_CheckIfActive_Bank1E

#_1ECC11: LDA.w $0EA0,X
#_1ECC14: BEQ .not_recoiling

#_1ECC16: STZ.w $0D80,X

.not_recoiling
#_1ECC19: JSR Sprite_CheckIfRecoiling_Bank1E
#_1ECC1C: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1ECC1F: LDA.w $0E70,X
#_1ECC22: BNE .tile_collision

#_1ECC24: JSR Sprite_Move_XY_Bank1E

.tile_collision
#_1ECC27: JSR Sprite_CheckTileCollision_Bank1E

#_1ECC2A: INC.w $0E80,X

#_1ECC2D: LDA.w $0E80,X
#_1ECC30: LSR A
#_1ECC31: LSR A
#_1ECC32: LSR A
#_1ECC33: AND.b #$02
#_1ECC35: STA.w $0DC0,X

#_1ECC38: LDA.w $0D80,X
#_1ECC3B: JSL JumpTableLocal
#_1ECC3F: dw Hover_Idle
#_1ECC41: dw Hover_Move

;===================================================================================================

pool Hover_Idle

.flip
#_1ECC43: db $40, $00, $40, $00

pool off

;---------------------------------------------------------------------------------------------------

Hover_Idle:
#_1ECC47: LDA.w $0DF0,X
#_1ECC4A: BNE .exit

#_1ECC4C: INC.w $0D80,X

#_1ECC4F: JSR Sprite_IsRightOfLink_Bank1E
#_1ECC52: STY.b $0C

#_1ECC54: JSR Sprite_IsBelowLink_Bank1E

#_1ECC57: TYA
#_1ECC58: ASL A
#_1ECC59: ORA.b $0C
#_1ECC5B: STA.w $0DE0,X

#_1ECC5E: TAY

#_1ECC5F: LDA.w $0F50,X
#_1ECC62: AND.b #$BF
#_1ECC64: ORA.w .flip,Y
#_1ECC67: STA.w $0F50,X

#_1ECC6A: JSL GetRandomNumber
#_1ECC6E: AND.b #$0F
#_1ECC70: ADC.b #$0C
#_1ECC72: STA.w $0DF0,X

#_1ECC75: JSR Sprite_ZeroVelocity_XY_Bank1E

.exit
#_1ECC78: RTS

;===================================================================================================

pool Hover_Move

.accel_x
#_1ECC79: db  1, -1,  1, -1

.accel_y
#_1ECC7D: db  1,  1, -1, -1

.decel_x
#_1ECC81: db -1,  1, -1,  1

.decel_y
#_1ECC85: db -1, -1,  1,  1

pool off

;---------------------------------------------------------------------------------------------------

Hover_Move:
#_1ECC89: LDA.w $0DF0,X
#_1ECC8C: BEQ .decelerate

#_1ECC8E: LDY.w $0DE0,X

#_1ECC91: LDA.w $0D50,X
#_1ECC94: CLC
#_1ECC95: ADC.w .accel_x,Y
#_1ECC98: STA.w $0D50,X

#_1ECC9B: LDA.w $0D40,X
#_1ECC9E: CLC
#_1ECC9F: ADC.w .accel_y,Y
#_1ECCA2: STA.w $0D40,X

#_1ECCA5: LDA.w $0E80,X
#_1ECCA8: LSR A
#_1ECCA9: LSR A
#_1ECCAA: LSR A
#_1ECCAB: AND.b #$01
#_1ECCAD: STA.w $0DC0,X

#_1ECCB0: RTS

;---------------------------------------------------------------------------------------------------

.decelerate
#_1ECCB1: LDY.w $0DE0,X

#_1ECCB4: LDA.w $0D50,X
#_1ECCB7: CLC
#_1ECCB8: ADC.w .decel_x,Y
#_1ECCBB: STA.w $0D50,X

#_1ECCBE: LDA.w $0D40,X
#_1ECCC1: CLC
#_1ECCC2: ADC.w .decel_y,Y
#_1ECCC5: STA.w $0D40,X

#_1ECCC8: BNE .exit

#_1ECCCA: STZ.w $0D80,X

#_1ECCCD: LDA.b #$40
#_1ECCCF: STA.w $0DF0,X

.exit
#_1ECCD2: RTS

;===================================================================================================

Palettes_Crystal:
#_1ECCD3: dw  $0000,  $3821,  $4463,  $54A5,  $5CE7,  $6D29,  $79AD,  $7E10

;---------------------------------------------------------------------------------------------------

CrystalCutscene_Initialize:
#_1ECCE3: LDA.b #$33
#_1ECCE5: STA.b $9A

#_1ECCE7: LDA.b #$00
#_1ECCE9: STA.l $7EC007
#_1ECCED: STA.l $7EC009

#_1ECCF1: PHX

#_1ECCF2: JSL Palette_AssertTranslucencySwap
#_1ECCF6: JSL PaletteFilter_Crystal

#_1ECCFA: PLX

#_1ECCFB: REP #$20

#_1ECCFD: LDA.l Palettes_Crystal+0
#_1ECD01: STA.l $7EC5E0

#_1ECD05: LDA.l Palettes_Crystal+2
#_1ECD09: STA.l $7EC5E2

#_1ECD0D: LDA.l Palettes_Crystal+4
#_1ECD11: STA.l $7EC5E4

#_1ECD15: LDA.l Palettes_Crystal+6
#_1ECD19: STA.l $7EC5E6

#_1ECD1D: LDA.l Palettes_Crystal+8
#_1ECD21: STA.l $7EC5E8

#_1ECD25: LDA.l Palettes_Crystal+10
#_1ECD29: STA.l $7EC5EA

#_1ECD2D: LDA.l Palettes_Crystal+12
#_1ECD31: STA.l $7EC5EC

#_1ECD35: LDA.l Palettes_Crystal+14
#_1ECD39: STA.l $7EC5EE

#_1ECD3D: SEP #$30

#_1ECD3F: INC.b $15

#_1ECD41: JSR CrystalCutscene_SpawnMaiden
#_1ECD44: JSR CrystalCutscene_InitializePolyhedral

#_1ECD47: RTL

;===================================================================================================

CrystalCutscene_SpawnMaiden:
#_1ECD48: LDY.b #$0F

#_1ECD4A: LDA.b #$00

.next_sprite
#_1ECD4C: STA.w $0DD0,Y

#_1ECD4F: DEY
#_1ECD50: BPL .next_sprite

;---------------------------------------------------------------------------------------------------

#_1ECD52: LDA.b #$AB ; SPRITE AB
#_1ECD54: JSL Sprite_SpawnDynamically

#_1ECD58: LDA.b $23
#_1ECD5A: STA.w $0D30,Y

#_1ECD5D: LDA.b $21
#_1ECD5F: STA.w $0D20,Y

#_1ECD62: LDA.b #$78
#_1ECD64: STA.w $0D10,Y

#_1ECD67: LDA.b #$7C
#_1ECD69: STA.w $0D00,Y

#_1ECD6C: LDA.b #$01
#_1ECD6E: STA.w $0DE0,Y

#_1ECD71: LDA.b #$0B
#_1ECD73: STA.w $0F50,Y

#_1ECD76: LDA.b #$00
#_1ECD78: STA.w $0E80,Y
#_1ECD7B: STA.w $0F20,Y

#_1ECD7E: PHY

#_1ECD7F: JSL Ancilla_TerminateSelectInteractives

#_1ECD83: STZ.w $02E9

#_1ECD86: TYA

#_1ECD87: PLY

#_1ECD88: STA.w $0D90,Y

;---------------------------------------------------------------------------------------------------

#_1ECD8B: LDA.w $040C
#_1ECD8E: CMP.b #$18 ; DUNGEON 18
#_1ECD90: BNE .not_zelda

#_1ECD92: LDA.b #$09
#_1ECD94: STA.w $0F50,Y

#_1ECD97: LDA.b #$01 ; FOLLOWER 01

#_1ECD99: BRA .load_gfx

.not_zelda
#_1ECD9B: LDA.b #$06 ; FOLLOWER 06

.load_gfx
#_1ECD9D: STA.l $7EF3CC

#_1ECDA1: PHX

#_1ECDA2: JSL LoadFollowerGraphics

#_1ECDA6: PLX

#_1ECDA7: LDA.b #$00
#_1ECDA9: STA.l $7EF3CC

#_1ECDAD: STZ.w $0428

#_1ECDB0: REP #$20

#_1ECDB2: LDA.b $22
#_1ECDB4: SEC
#_1ECDB5: SBC.b $E2
#_1ECDB7: EOR.w #$FFFF
#_1ECDBA: SEC
#_1ECDBB: ADC.w #$0079
#_1ECDBE: STA.w $0422

#_1ECDC1: LDA.b $E6
#_1ECDC3: AND.w #$00FF
#_1ECDC6: STA.b $00

#_1ECDC8: LDA.w #$0030
#_1ECDCB: SEC
#_1ECDCC: SBC.b $00
#_1ECDCE: STA.w $0424

#_1ECDD1: SEP #$30

#_1ECDD3: LDA.b #$01
#_1ECDD5: STA.w $0428

#_1ECDD8: RTS

;===================================================================================================

CrystalCutscene_InitializePolyhedral:
#_1ECDD9: LDA.b #$9C
#_1ECDDB: STA.w $1F02

#_1ECDDE: LDA.b #$01
#_1ECDE0: STA.w $1F01
#_1ECDE3: STA.w $012A
#_1ECDE6: STA.w $1F00

#_1ECDE9: LDA.b #$20
#_1ECDEB: STA.w $1F06
#_1ECDEE: STA.w $1F07
#_1ECDF1: STA.w $1F08

#_1ECDF4: STZ.w $1F03

#_1ECDF7: LDA.b #$10
#_1ECDF9: STA.w $1F04

#_1ECDFC: STZ.b $1D
#_1ECDFE: LDA.b #$16

#_1ECE00: STA.b $1C

#_1ECE02: RTS

;===================================================================================================

Sprite_AB_CrystalMaiden:
#_1ECE03: REP #$20

#_1ECE05: LDA.w $0FD8
#_1ECE08: SEC
#_1ECE09: SBC.w $0422
#_1ECE0C: STA.w $0FD8

#_1ECE0F: LDA.w $0FDA
#_1ECE12: SEC
#_1ECE13: SBC.w $0424
#_1ECE16: STA.w $0FDA

#_1ECE19: SEP #$30

#_1ECE1B: LDA.w $0D80,X
#_1ECE1E: CMP.b #$03
#_1ECE20: BCC .invisible

#_1ECE22: JSL SpriteDraw_Maiden

.invisible
#_1ECE26: LDA.b #$01
#_1ECE28: STA.w $012A

#_1ECE2B: LDA.w $1F00
#_1ECE2E: BNE .exit

#_1ECE30: JSR CrystalMaiden_RunCutscene

#_1ECE33: LDA.b #$01
#_1ECE35: STA.w $1F00

.exit
#_1ECE38: RTS

;===================================================================================================

CrystalMaiden_RunCutscene:
#_1ECE39: INC.w $0E90,X

#_1ECE3C: LDA.w $1F05
#_1ECE3F: CLC
#_1ECE40: ADC.b #$06
#_1ECE42: STA.w $1F05

#_1ECE45: LDA.b $11
#_1ECE47: BEQ .continue

#_1ECE49: RTS

.continue
#_1ECE4A: LDA.w $0D80,X
#_1ECE4D: JSL JumpTableLocal
#_1ECE51: dw CrystalMaiden_DisableSubscreen
#_1ECE53: dw CrystalMaiden_EnableSubscreen
#_1ECE55: dw CrystalMaiden_WaitForCrystalGrowth
#_1ECE57: dw CrystalMaiden_Emerge
#_1ECE59: dw CrystalMaiden_DelaySpeech
#_1ECE5B: dw CrystalMaiden_GiveSpeech
#_1ECE5D: dw CrystalMaiden_DoYouUnderstand
#_1ECE5F: dw CrystalMaiden_GoodLuckKid
#_1ECE61: dw CrystalMaiden_KickOutOfDungeon

;===================================================================================================

CrystalMaiden_DisableSubscreen:
#_1ECE63: STZ.b $1D

#_1ECE65: INC.w $0D80,X

#_1ECE68: RTS

;===================================================================================================

CrystalMaiden_EnableSubscreen:
#_1ECE69: LDA.b #$01
#_1ECE6B: STA.b $1D

#_1ECE6D: INC.w $0D80,X

#_1ECE70: RTS

;===================================================================================================

CrystalMaiden_WaitForCrystalGrowth:
#_1ECE71: LDA.w $1F02
#_1ECE74: CMP.b #$06
#_1ECE76: BCS .wait

#_1ECE78: STZ.w $1F02

#_1ECE7B: INC.w $0D80,X

#_1ECE7E: RTS

.wait
#_1ECE7F: SBC.b #$03
#_1ECE81: STA.w $1F02

#_1ECE84: CMP.b #$40
#_1ECE86: BCC .exit

#_1ECE88: PHX

#_1ECE89: LDA.w $0D90,X
#_1ECE8C: TAX

#_1ECE8D: JSL AncillaAdd_SwordChargeSparkle_preserveX

#_1ECE91: PLX

.exit
#_1ECE92: RTS

;===================================================================================================

CrystalMaiden_Emerge:
#_1ECE93: INC.w $0D80,X

;===================================================================================================

CrystalMaiden_DelaySpeech:
#_1ECE96: LDA.w $0E90,X
#_1ECE99: AND.b #$01
#_1ECE9B: BNE .exit

#_1ECE9D: PHX

#_1ECE9E: JSL PaletteFilter_SP5F

#_1ECEA2: PLX

#_1ECEA3: LDA.l $7EC007
#_1ECEA7: BNE .exit

#_1ECEA9: INC.w $0D80,X

#_1ECEAC: LDA.b #$01
#_1ECEAE: STA.w $02E4

#_1ECEB1: STZ.w $02D8
#_1ECEB4: STZ.w $02DA

#_1ECEB7: STZ.b $2E
#_1ECEB9: STZ.b $2F

.exit
#_1ECEBB: RTS

;===================================================================================================

CrystalMaiden_Messages:
#_1ECEBC: dw $0133 ; MESSAGE 0133 - Swamp
#_1ECEBE: dw $0132 ; MESSAGE 0132 - PoD
#_1ECEC0: dw $0137 ; MESSAGE 0137 - Mire
#_1ECEC2: dw $0134 ; MESSAGE 0134 - Skull
#_1ECEC4: dw $0136 ; MESSAGE 0136 - Ice
#_1ECEC6: dw $0132 ; MESSAGE 0132 - Hera
#_1ECEC8: dw $0135 ; MESSAGE 0135 - Thieves
#_1ECECA: dw $0138 ; MESSAGE 0138 - Turtle Rock
#_1ECECC: dw $013C ; MESSAGE 013C - Turtle Rock every crystal

;---------------------------------------------------------------------------------------------------

CrystalMaiden_GiveSpeech:
#_1ECECE: LDA.w $040C
#_1ECED1: SEC
#_1ECED2: SBC.b #$0A
#_1ECED4: TAY

#_1ECED5: CPY.b #$02
#_1ECED7: BNE .dont_update_map

#_1ECED9: LDA.l $7EF3C7

#_1ECEDD: CMP.b #$07
#_1ECEDF: BCS .dont_update_map

#_1ECEE1: LDA.b #$07
#_1ECEE3: STA.l $7EF3C7

.dont_update_map
#_1ECEE7: CPY.b #$0E
#_1ECEE9: BNE .not_special_zelda_message

#_1ECEEB: LDA.l $7EF37A
#_1ECEEF: AND.b #$7F
#_1ECEF1: CMP.b #$7F
#_1ECEF3: BEQ .not_special_zelda_message

#_1ECEF5: LDY.b #$10

.not_special_zelda_message
#_1ECEF7: LDA.w CrystalMaiden_Messages+0,Y
#_1ECEFA: XBA

#_1ECEFB: LDA.w CrystalMaiden_Messages+1,Y
#_1ECEFE: TAY

#_1ECEFF: XBA

#_1ECF00: JSL Sprite_ShowMessageUnconditional

#_1ECF04: INC.w $0D80,X

#_1ECF07: LDA.l $7EF37A
#_1ECF0B: AND.b #$7F
#_1ECF0D: CMP.b #$7F
#_1ECF0F: BNE .exit

#_1ECF11: LDA.b #$08
#_1ECF13: STA.l $7EF3C7

.exit
#_1ECF17: RTS

;===================================================================================================

CrystalMaiden_DoYouUnderstand:
#_1ECF18: LDA.b #$3A ; MESSAGE 013A
#_1ECF1A: LDY.b #$01
#_1ECF1C: JSL Sprite_ShowMessageUnconditional

#_1ECF20: INC.w $0D80,X

#_1ECF23: RTS

;===================================================================================================

CrystalMaiden_GoodLuckKid:
#_1ECF24: LDA.w $1CE8
#_1ECF27: BEQ .speech_was_CRYSTAL_clear

#_1ECF29: LDA.b #$05
#_1ECF2B: STA.w $0D80,X

#_1ECF2E: RTS

.speech_was_CRYSTAL_clear
#_1ECF2F: LDA.b #$39 ; MESSAGE 0139
#_1ECF31: LDY.b #$01
#_1ECF33: JSL Sprite_ShowMessageUnconditional

#_1ECF37: INC.w $0D80,X

#_1ECF3A: RTS

;===================================================================================================

CrystalMaiden_KickOutOfDungeon:
#_1ECF3B: STZ.b $1D

#_1ECF3D: PHX

#_1ECF3E: JSL PrepareDungeonExitFromBossFight

#_1ECF42: PLX

#_1ECF43: STZ.w $0DD0,X

#_1ECF46: RTS

;===================================================================================================

Sprite_7D_BigSpike:
#_1ECF47: JSR SpriteDraw_BigSpike
#_1ECF4A: JSR Sprite_CheckIfActive_Bank1E
#_1ECF4D: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1ECF50: LDA.w $0D80,X
#_1ECF53: BNE .in_motion

#_1ECF55: JSR Sprite_DirectionToFaceLink_Bank1E
#_1ECF58: TYA
#_1ECF59: STA.w $0DE0,X

#_1ECF5C: LDA.b $0F
#_1ECF5E: CLC
#_1ECF5F: ADC.b #$10

#_1ECF61: CMP.b #$20
#_1ECF63: BCS .not_close
#_1ECF65: BRA .start_movement

.not_close
#_1ECF67: LDA.b $0E
#_1ECF69: CLC
#_1ECF6A: ADC.b #$10

#_1ECF6C: CMP.b #$20
#_1ECF6E: BCS .also_not_close

.start_movement
#_1ECF70: LDA.w .timer,Y
#_1ECF73: STA.w $0DF0,X

#_1ECF76: INC.w $0D80,X

#_1ECF79: LDA.w .forward_speed_x,Y
#_1ECF7C: STA.w $0D50,X

#_1ECF7F: LDA.w .forward_speed_y,Y
#_1ECF82: STA.w $0D40,X

.also_not_close
#_1ECF85: RTS

;---------------------------------------------------------------------------------------------------

.forward_speed_x
#_1ECF86: db  32, -32,   0,   0

.backward_speed_x
#_1ECF8A: db -16,  16,   0,   0

.forward_speed_y
#_1ECF8E: db   0,   0,  32, -32

.backward_speed_y
#_1ECF92: db   0,   0, -16,  16

.timer
#_1ECF96: db  64,  64,  56,  56

;===================================================================================================

.in_motion
#_1ECF9A: CMP.b #$01
#_1ECF9C: BNE .retracting

#_1ECF9E: JSR Sprite_CheckTileCollision_Bank1E
#_1ECFA1: BNE .tile_collision

#_1ECFA3: LDA.w $0DF0,X
#_1ECFA6: BNE .still_moving

.tile_collision
#_1ECFA8: INC.w $0D80,X

#_1ECFAB: LDA.b #$60
#_1ECFAD: STA.w $0DF0,X

.still_moving
#_1ECFB0: JSR Sprite_Move_XY_Bank1E

#_1ECFB3: RTS

;---------------------------------------------------------------------------------------------------

.retracting
#_1ECFB4: LDA.w $0DF0,X
#_1ECFB7: BNE .exit

#_1ECFB9: LDY.w $0DE0,X

#_1ECFBC: LDA.w .backward_speed_x,Y
#_1ECFBF: STA.w $0D50,X

#_1ECFC2: LDA.w .backward_speed_y,Y
#_1ECFC5: STA.w $0D40,X

#_1ECFC8: JSR Sprite_Move_XY_Bank1E

#_1ECFCB: LDA.w $0D10,X
#_1ECFCE: CMP.w $0D90,X
#_1ECFD1: BNE .exit

#_1ECFD3: LDA.w $0D00,X
#_1ECFD6: CMP.w $0DB0,X
#_1ECFD9: BNE .exit

#_1ECFDB: STZ.w $0D80,X

.exit
#_1ECFDE: RTS

;===================================================================================================

pool SpriteDraw_BigSpike

.oam_groups
#_1ECFDF: dw  -8,  -8 : db $C4, $00, $00, $02
#_1ECFE7: dw   8,  -8 : db $C4, $40, $00, $02
#_1ECFEF: dw  -8,   8 : db $C4, $80, $00, $02
#_1ECFF7: dw   8,   8 : db $C4, $C0, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_BigSpike:
#_1ECFFF: REP #$20

#_1ED001: LDA.w #.oam_groups
#_1ED004: STA.b $08

#_1ED006: LDA.w #$0004
#_1ED009: STA.b $06

#_1ED00B: SEP #$30

#_1ED00D: JSL SpriteDraw_Tabulated_preset_quantity

#_1ED011: RTS

;===================================================================================================

pool Firebar

.offset_low
#_1ED012: db -2,  2
#_1ED014: db -1,  1

.offset_high
#_1ED016: db -1,  0
#_1ED018: db -1,  0

pool off

;---------------------------------------------------------------------------------------------------

Sprite_7E_Firebar_Clockwise:
Sprite_7F_Firebar_Counterclockwise:
#_1ED01A: JSR Firebar_Main
#_1ED01D: JSR Sprite_CheckIfActive_Bank1E

#_1ED020: INC.w $0E80,X

#_1ED023: LDA.w $0E20,X
#_1ED026: SEC
#_1ED027: SBC.b #$7E
#_1ED029: TAY

#_1ED02A: LDA.w $040C
#_1ED02D: CMP.b #$12 ; DUNGEON 12
#_1ED02F: BNE .not_ice_palace

#_1ED031: INY
#_1ED032: INY

.not_ice_palace
#_1ED033: LDA.w $0D90,X
#_1ED036: CLC
#_1ED037: ADC.w Firebar_offset_low,Y
#_1ED03A: STA.w $0D90,X

#_1ED03D: LDA.w $0DA0,X
#_1ED040: ADC.w Firebar_offset_high,Y
#_1ED043: AND.b #$01
#_1ED045: STA.w $0DA0,X

#_1ED048: RTS

;===================================================================================================

Firebar_Main:
#_1ED049: JSR Sprite_PrepOAMCoord_Bank1E

#_1ED04C: LDA.b $05
#_1ED04E: STA.w $0FB6

#_1ED051: LDA.b $00
#_1ED053: STA.w $0FA8

#_1ED056: LDA.b $02
#_1ED058: STA.w $0FA9

#_1ED05B: LDA.w $0D90,X
#_1ED05E: STA.b $00

#_1ED060: LDA.w $0DA0,X
#_1ED063: STA.b $01

#_1ED065: LDA.b #$40
#_1ED067: STA.b $0F

#_1ED069: PHX

;---------------------------------------------------------------------------------------------------

#_1ED06A: REP #$30

#_1ED06C: LDA.b $00
#_1ED06E: AND.w #$01FF

#_1ED071: LSR A
#_1ED072: LSR A
#_1ED073: LSR A
#_1ED074: LSR A
#_1ED075: LSR A
#_1ED076: LSR A

#_1ED077: STA.b $0A

#_1ED079: LDA.b $00
#_1ED07B: CLC
#_1ED07C: ADC.w #$0080
#_1ED07F: AND.w #$01FF
#_1ED082: STA.b $02

#_1ED084: LDA.b $00
#_1ED086: AND.w #$00FF
#_1ED089: ASL A
#_1ED08A: TAX

#_1ED08B: LDA.l SmoothCurve,X
#_1ED08F: STA.b $04

#_1ED091: LDA.b $02
#_1ED093: AND.w #$00FF
#_1ED096: ASL A
#_1ED097: TAX

#_1ED098: LDA.l SmoothCurve,X
#_1ED09C: STA.b $06

;---------------------------------------------------------------------------------------------------

#_1ED09E: SEP #$30

#_1ED0A0: PLX

#_1ED0A1: LDA.b $04
#_1ED0A3: STA.w WRMPYA

#_1ED0A6: LDA.b $0F

#_1ED0A8: LDY.b $05
#_1ED0AA: BNE .nonzero_a

#_1ED0AC: STA.w WRMPYB

#_1ED0AF: JSR NOP8

#_1ED0B2: ASL.w RDMPYL
#_1ED0B5: LDA.w RDMPYH
#_1ED0B8: ADC.b #$00

.nonzero_a
#_1ED0BA: STA.b $0E

#_1ED0BC: LSR.b $01
#_1ED0BE: BCC .dont_invert_a

#_1ED0C0: EOR.b #$FF
#_1ED0C2: INC A

.dont_invert_a
#_1ED0C3: STA.b $04

;---------------------------------------------------------------------------------------------------

#_1ED0C5: LDA.b $06
#_1ED0C7: STA.w WRMPYA

#_1ED0CA: LDA.b $0F

#_1ED0CC: LDY.b $07
#_1ED0CE: BNE .nonzero_b

#_1ED0D0: STA.w WRMPYB

#_1ED0D3: JSR NOP8

#_1ED0D6: ASL.w RDMPYL
#_1ED0D9: LDA.w RDMPYH
#_1ED0DC: ADC.b #$00

.nonzero_b
#_1ED0DE: STA.b $0F

#_1ED0E0: LSR.b $03
#_1ED0E2: BCC .dont_invert_b

#_1ED0E4: EOR.b #$FF
#_1ED0E6: INC A

.dont_invert_b
#_1ED0E7: STA.b $06

;---------------------------------------------------------------------------------------------------

#_1ED0E9: LDA.w $0E80,X

#_1ED0EC: ASL A
#_1ED0ED: ASL A
#_1ED0EE: ASL A
#_1ED0EF: ASL A

#_1ED0F0: AND.b #$C0
#_1ED0F2: ORA.w $0FB6
#_1ED0F5: STA.b $0D

#_1ED0F7: LDY.b #$00

#_1ED0F9: LDA.b $04
#_1ED0FB: CLC
#_1ED0FC: ADC.w $0FA8
#_1ED0FF: STA.b ($90),Y

#_1ED101: LDA.b $06
#_1ED103: CLC
#_1ED104: ADC.w $0FA9

#_1ED107: INY
#_1ED108: STA.b ($90),Y

#_1ED10A: LDA.b #$28
#_1ED10C: INY
#_1ED10D: STA.b ($90),Y

#_1ED10F: LDA.b $0D
#_1ED111: INY
#_1ED112: STA.b ($90),Y

#_1ED114: LDA.b #$02
#_1ED116: STA.b ($92)

;---------------------------------------------------------------------------------------------------

#_1ED118: LDY.b #$04

#_1ED11A: PHX

#_1ED11B: LDX.b #$02

.next_object_a
#_1ED11D: LDA.b $0E
#_1ED11F: STA.w WRMPYA

#_1ED122: LDA.w .mutliplier,X
#_1ED125: STA.w WRMPYB

#_1ED128: JSR NOP8

#_1ED12B: LDA.b $04
#_1ED12D: ASL A
#_1ED12E: LDA.w RDMPYH
#_1ED131: BCC .dont_invert_c

#_1ED133: EOR.b #$FF
#_1ED135: INC A

.dont_invert_c
#_1ED136: CLC
#_1ED137: ADC.w $0FA8
#_1ED13A: STA.b ($90),Y

#_1ED13C: LDA.b $0F
#_1ED13E: STA.w WRMPYA

#_1ED141: LDA.w .mutliplier,X
#_1ED144: STA.w WRMPYB

#_1ED147: JSR NOP8

#_1ED14A: LDA.b $06
#_1ED14C: ASL A
#_1ED14D: LDA.w RDMPYH
#_1ED150: BCC .dont_invert_d

#_1ED152: EOR.b #$FF
#_1ED154: INC A

.dont_invert_d
#_1ED155: CLC
#_1ED156: ADC.w $0FA9

#_1ED159: INY
#_1ED15A: STA.b ($90),Y

#_1ED15C: LDA.b #$28
#_1ED15E: INY
#_1ED15F: STA.b ($90),Y

#_1ED161: LDA.b $0D
#_1ED163: INY
#_1ED164: STA.b ($90),Y

#_1ED166: PHY

#_1ED167: TYA
#_1ED168: LSR A
#_1ED169: LSR A
#_1ED16A: TAY

#_1ED16B: LDA.b #$02
#_1ED16D: STA.b ($92),Y

#_1ED16F: PLY
#_1ED170: INY

#_1ED171: DEX
#_1ED172: BPL .next_object_a

;---------------------------------------------------------------------------------------------------

#_1ED174: PLX

#_1ED175: LDY.b #$FF
#_1ED177: LDA.b #$03
#_1ED179: JSL Sprite_CorrectOAMEntries_long

#_1ED17D: TXA
#_1ED17E: EOR.b $1A
#_1ED180: AND.b #$03

#_1ED182: ORA.b $11
#_1ED184: ORA.w $0FC1
#_1ED187: BNE .exit

#_1ED189: LDY.b #$00

;---------------------------------------------------------------------------------------------------

.next_segment
#_1ED18B: PHY

#_1ED18C: TYA
#_1ED18D: LSR A
#_1ED18E: LSR A
#_1ED18F: TAY

#_1ED190: LDA.b ($92),Y
#_1ED192: PLY
#_1ED193: AND.b #$01
#_1ED195: BNE .no_damage

#_1ED197: LDA.b ($90),Y
#_1ED199: CLC
#_1ED19A: ADC.b $E2

#_1ED19C: SEC
#_1ED19D: SBC.b $22

#_1ED19F: CLC
#_1ED1A0: ADC.b #$0C

#_1ED1A2: CMP.b #$18
#_1ED1A4: BCS .no_damage

#_1ED1A6: INY
#_1ED1A7: LDA.b ($90),Y

#_1ED1A9: DEY

#_1ED1AA: CMP.b #$F0
#_1ED1AC: BCS .no_damage

#_1ED1AE: CLC
#_1ED1AF: ADC.b $E8

#_1ED1B1: SEC
#_1ED1B2: SBC.b $20

#_1ED1B4: CLC
#_1ED1B5: ADC.b #$04

#_1ED1B7: CMP.b #$10
#_1ED1B9: BCS .no_damage

#_1ED1BB: PHY
#_1ED1BC: JSL Sprite_AttemptDamageToLinkPlusRecoil_long
#_1ED1C0: PLY

.no_damage
#_1ED1C1: INY
#_1ED1C2: INY
#_1ED1C3: INY
#_1ED1C4: INY

#_1ED1C5: CPY.b #$10
#_1ED1C7: BCC .next_segment

.exit
#_1ED1C9: RTS

;---------------------------------------------------------------------------------------------------

.mutliplier
#_1ED1CA: db $40, $80, $C0

;===================================================================================================

pool Sprite_80_Firesnake

.flip
#_1ED1CD: db $00, $40, $80, $C0

pool off

;---------------------------------------------------------------------------------------------------

Sprite_80_Firesnake:
#_1ED1D1: JSL SpriteDraw_SingleLarge_long
#_1ED1D5: JSR Sprite_CheckIfActive_Bank1E
#_1ED1D8: JSR Sprite_CheckIfRecoiling_Bank1E

#_1ED1DB: LDA.b $1A
#_1ED1DD: LSR A
#_1ED1DE: LSR A
#_1ED1DF: AND.b #$03
#_1ED1E1: TAY

#_1ED1E2: LDA.w $0F50,X
#_1ED1E5: AND.b #$3F
#_1ED1E7: ORA.w .flip,Y
#_1ED1EA: STA.w $0F50,X

#_1ED1ED: LDA.w $0D90,X
#_1ED1F0: BEQ .main

#_1ED1F2: LDA.w $0DF0,X
#_1ED1F5: STA.w $0BA0,X
#_1ED1F8: BNE .exit

#_1ED1FA: STZ.w $0DD0,X

.exit
#_1ED1FD: RTS

;---------------------------------------------------------------------------------------------------

.speed_x
#_1ED1FE: db  24, -24,   0,   0

.speed_y
#_1ED202: db   0,   0,  24, -24

;---------------------------------------------------------------------------------------------------

.main
#_1ED206: JSR Sprite_CheckDamageToAndFromLink_Bank1E
#_1ED209: JSR Firesnake_SpawnFireball

#_1ED20C: LDA.w $0E70,X
#_1ED20F: BNE .tile_collision

#_1ED211: JSR Sprite_Move_XY_Bank1E

.tile_collision
#_1ED214: JSR Sprite_CheckTileCollision_Bank1E
#_1ED217: BEQ .no_tile_collision

#_1ED219: JSL GetRandomNumber
#_1ED21D: LSR A
#_1ED21E: LDA.w $0DE0,X

#_1ED221: ROL A
#_1ED222: TAY

#_1ED223: LDA.w SharedDirections_Nice,Y
#_1ED226: STA.w $0DE0,X

.no_tile_collision
#_1ED229: LDY.w $0DE0,X

#_1ED22C: LDA.w .speed_x,Y
#_1ED22F: STA.w $0D50,X

#_1ED232: LDA.w .speed_y,Y
#_1ED235: STA.w $0D40,X

#_1ED238: RTS

;===================================================================================================

Firesnake_SpawnFireball:
#_1ED239: TXA
#_1ED23A: EOR.b $1A
#_1ED23C: AND.b #$07
#_1ED23E: BNE .exit

#_1ED240: PHX
#_1ED241: TXY

#_1ED242: LDX.b #$1D

.next_slot
#_1ED244: LDA.l $7FF800,X
#_1ED248: BEQ .free_slot

#_1ED24A: DEX
#_1ED24B: BPL .next_slot

#_1ED24D: PLX

#_1ED24E: RTS

;---------------------------------------------------------------------------------------------------

.free_slot
#_1ED24F: LDA.b #$01 ; GARNISH 01
#_1ED251: STA.l $7FF800,X
#_1ED255: STA.w $0FB4

#_1ED258: LDA.w $0D10,Y
#_1ED25B: STA.l $7FF83C,X

#_1ED25F: LDA.w $0D30,Y
#_1ED262: STA.l $7FF878,X

#_1ED266: LDA.w $0D00,Y
#_1ED269: CLC
#_1ED26A: ADC.b #$10
#_1ED26C: STA.l $7FF81E,X

#_1ED270: LDA.w $0D20,Y
#_1ED273: ADC.b #$00
#_1ED275: STA.l $7FF85A,X

#_1ED279: LDA.b #$20
#_1ED27B: STA.l $7FF90E,X

#_1ED27F: TYA
#_1ED280: STA.l $7FF92C,X

#_1ED284: LDA.w $0F20,Y
#_1ED287: STA.l $7FF968,X

#_1ED28B: PLX

.exit
#_1ED28C: RTS

;===================================================================================================

pool Sprite_7C_GreenStalfos

.direction
#_1ED28D: db $04, $06, $00, $02

.flip
#_1ED291: db $40, $00, $00, $00

.anim_step
#_1ED295: db $00, $00, $01, $02

pool off

;---------------------------------------------------------------------------------------------------

Sprite_7C_GreenStalfos:
#_1ED299: LDY.w $0DE0,X

#_1ED29C: LDA.w $0F50,X
#_1ED29F: AND.b #$BF
#_1ED2A1: ORA.w .flip,Y
#_1ED2A4: STA.w $0F50,X

#_1ED2A7: LDA.w .anim_step,Y
#_1ED2AA: STA.w $0DC0,X

#_1ED2AD: JSL SpriteDraw_SingleLarge_long
#_1ED2B1: JSR Sprite_CheckIfActive_Bank1E
#_1ED2B4: JSR Sprite_CheckIfRecoiling_Bank1E
#_1ED2B7: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1ED2BA: STZ.w $0D90,X

#_1ED2BD: JSR Sprite_DirectionToFaceLink_Bank1E

#_1ED2C0: LDA.w .direction,Y
#_1ED2C3: CMP.w $002F
#_1ED2C6: BEQ .link_facing_me

#_1ED2C8: TXA
#_1ED2C9: EOR.b $1A
#_1ED2CB: AND.b #$07
#_1ED2CD: BNE .dont_turn

#_1ED2CF: JSR Sprite_DirectionToFaceLink_Bank1E
#_1ED2D2: TYA
#_1ED2D3: STA.w $0DE0,X

#_1ED2D6: LDA.w $0DA0,X
#_1ED2D9: CMP.b #$04
#_1ED2DB: BEQ .at_max

#_1ED2DD: INC.w $0DA0,X

.at_max
#_1ED2E0: JSL Sprite_ApplySpeedTowardsLink_long

#_1ED2E4: JSR Sprite_IsRightOfLink_Bank1E
#_1ED2E7: TYA
#_1ED2E8: STA.w $0DE0,X

;---------------------------------------------------------------------------------------------------

.dont_turn
#_1ED2EB: JSR Sprite_Move_XY_Bank1E

#_1ED2EE: RTS

.link_facing_me
#_1ED2EF: INC.w $0D90,X

#_1ED2F2: TXA
#_1ED2F3: EOR.b $1A
#_1ED2F5: AND.b #$0F
#_1ED2F7: BNE .dont_turn_b

#_1ED2F9: LDA.w $0DA0,X
#_1ED2FC: BEQ .at_min

#_1ED2FE: DEC.w $0DA0,X

.at_min
#_1ED301: JSL Sprite_ApplySpeedTowardsLink_long

#_1ED305: JSR Sprite_IsRightOfLink_Bank1E
#_1ED308: TYA
#_1ED309: STA.w $0DE0,X

.dont_turn_b
#_1ED30C: JSR Sprite_Move_XY_Bank1E

#_1ED30F: RTS

;===================================================================================================

Agahnim_Direction:
#_1ED310: db $00, $00, $00, $00, $00, $00, $00, $00
#_1ED318: db $00, $00, $05, $05, $00, $01, $01, $04
#_1ED320: db $04, $00, $02, $02, $04, $04, $03, $02
#_1ED328: db $02

;---------------------------------------------------------------------------------------------------

Agahnim_DirectionStepOffset:
#_1ED329: db $02, $0A, $08, $00, $04, $06, $FA

;===================================================================================================

Sprite_7A_Agahnim:
#_1ED330: JSR SpriteDraw_Agahnim

#_1ED333: LDA.w $0F00,X
#_1ED336: BEQ .active

#_1ED338: LDA.b #$20
#_1ED33A: STA.w $0DF0,X

#_1ED33D: LDA.b #$00
#_1ED33F: STA.w $0DC0,X

#_1ED342: LDA.b #$03
#_1ED344: STA.w $0DE0,X

.active
#_1ED347: JSR Sprite_CheckIfActive_Bank1E
#_1ED34A: JSR Sprite_CheckIfRecoiling_Bank1E

#_1ED34D: LDA.b #$01
#_1ED34F: STA.w $0BA0,X

#_1ED352: LDA.w $0D80,X
#_1ED355: JSL JumpTableLocal
#_1ED359: dw Agahnim_ChooseFirstMove

#_1ED35B: dw Agahnim_HelloLightWorld
#_1ED35D: dw Agahnim_EmergeFromShadow
#_1ED35F: dw Agahnim_Attack
#_1ED361: dw Agahnim_ChooseWarpSpot
#_1ED363: dw Agahnim_MoveTowardsWarp

#_1ED365: dw Agahnim_HelloDarkWorld
#_1ED367: dw Agahnim_CreateClones
#_1ED369: dw Agahnim_ExorciseGanon
#_1ED36B: dw Agahnim_UncloneSelf

#_1ED36D: dw Agahnim_SpinToPyramid

;===================================================================================================

pool Agahnim_SpinToPyramid

.anim_step
#_1ED36F: db $00, $08, $0A, $02, $02, $06, $04

pool off

;---------------------------------------------------------------------------------------------------

Agahnim_SpinToPyramid:
#_1ED376: LDA.w $0DF0,X
#_1ED379: BNE .delay

#_1ED37B: PHX

#_1ED37C: STZ.w $0DD0,X

#_1ED37F: JSL PrepareDungeonExitFromBossFight

#_1ED383: PLX

.delay
#_1ED384: LDA.w $0DF0,X
#_1ED387: CMP.b #$10
#_1ED389: BCS .spinning

#_1ED38B: LDA.b #$7F
#_1ED38D: STA.b $9A

#_1ED38F: LDA.b #$06
#_1ED391: STA.b $1C

#_1ED393: LDA.b #$10
#_1ED395: STA.b $1D

#_1ED397: PHX

#_1ED398: JSL PaletteFilter_SP5F

#_1ED39C: PLX

.spinning
#_1ED39D: LDA.w $0DF0,X
#_1ED3A0: AND.b #$00
#_1ED3A2: BNE .dont_increase_rotation_speed

#_1ED3A4: LDA.w $0F80,X
#_1ED3A7: CMP.b #$FF
#_1ED3A9: BEQ .dont_increase_rotation_speed

#_1ED3AB: CLC
#_1ED3AC: ADC.b #$01
#_1ED3AE: STA.w $0F80,X

.dont_increase_rotation_speed
#_1ED3B1: LDA.w $0F90,X
#_1ED3B4: CLC
#_1ED3B5: ADC.w $0F80,X
#_1ED3B8: STA.w $0F90,X

#_1ED3BB: BCC .no_sfx

#_1ED3BD: INC.w $0E80,X

#_1ED3C0: LDA.w $0E80,X
#_1ED3C3: CMP.b #$07
#_1ED3C5: BNE .no_sfx

#_1ED3C7: STZ.w $0E80,X

#_1ED3CA: LDA.b #$04 ; SFX2.04
#_1ED3CC: JSL SpriteSFX_QueueSFX2WithPan

.no_sfx
#_1ED3D0: LDY.w $0E80,X

#_1ED3D3: LDA.w .anim_step,Y
#_1ED3D6: STA.w $0DC0,X

#_1ED3D9: RTS

;===================================================================================================

Agahnim_ExorciseGanon:
#_1ED3DA: LDA.b #$02
#_1ED3DC: STA.w $0FFC

#_1ED3DF: STZ.w $0EB0,X

#_1ED3E2: LDA.w $0DF0,X
#_1ED3E5: CMP.b #$40
#_1ED3E7: BCC .delay

#_1ED3E9: LDA.w $0EF0,X
#_1ED3EC: ORA.b #$E0
#_1ED3EE: STA.w $0EF0,X

#_1ED3F1: RTS

.delay
#_1ED3F2: CMP.b #$01
#_1ED3F4: BNE .no_bat_yet

#_1ED3F6: JSL SpawnPhantomGanon

#_1ED3FA: LDA.b #$1D ; SONG 1D
#_1ED3FC: STA.w $012C

.no_bat_yet
#_1ED3FF: STZ.w $0EF0,X

#_1ED402: LDA.b #$11
#_1ED404: STA.w $0DC0,X

#_1ED407: RTS

;===================================================================================================

Agahnim_UncloneSelf:
#_1ED408: STZ.w $0EB0,X

#_1ED40B: LDA.w $0D10
#_1ED40E: STA.b $04

#_1ED410: LDA.w $0D30
#_1ED413: STA.b $05

#_1ED415: LDA.w $0D00
#_1ED418: STA.b $06

#_1ED41A: LDA.w $0D20
#_1ED41D: STA.b $07

#_1ED41F: REP #$20

#_1ED421: LDA.w $0FD8
#_1ED424: SEC
#_1ED425: SBC.b $04
#_1ED427: CLC
#_1ED428: ADC.w #$0004

#_1ED42B: CMP.w #$0008
#_1ED42E: BCS .not_merged_yet

#_1ED430: LDA.w $0FDA
#_1ED433: SEC
#_1ED434: SBC.b $06
#_1ED436: CLC
#_1ED437: ADC.w #$0004

#_1ED43A: CMP.w #$0008
#_1ED43D: BCS .not_merged_yet

#_1ED43F: SEP #$20

#_1ED441: STZ.w $0DD0,X

.not_merged_yet
#_1ED444: SEP #$20

#_1ED446: LDA.b #$20
#_1ED448: JSL Sprite_ProjectSpeedTowardsLocation_long

#_1ED44C: LDA.b $00
#_1ED44E: STA.w $0D40,X

#_1ED451: LDA.b $01
#_1ED453: STA.w $0D50,X

#_1ED456: JSR Sprite_Move_XY_Bank1E
#_1ED459: JSL Agahnim_ApplyMotionBlur

#_1ED45D: RTS

;===================================================================================================

Agahnim_HelloDarkWorld:
#_1ED45E: LDA.w $0DF0,X
#_1ED461: BNE .exit

#_1ED463: LDA.b #$41 ; MESSAGE 0141
#_1ED465: STA.w $1CF0

#_1ED468: LDA.b #$01
#_1ED46A: STA.w $1CF1

#_1ED46D: JSL Sprite_ShowMessageMinimal

#_1ED471: INC.w $0D80,X

#_1ED474: LDA.b #$50
#_1ED476: STA.w $0DF0,X

.exit
#_1ED479: RTS

;===================================================================================================

pool Agahnim_CreateClones

.speed
#_1ED47A: db  32, -32

pool off

;---------------------------------------------------------------------------------------------------

Agahnim_CreateClones:
#_1ED47C: LDA.w $0EC0,X
#_1ED47F: BEQ .spawn_clones

#_1ED481: LDA.w $0DF0,X
#_1ED484: BNE .delay

#_1ED486: JMP.w Agahnim_PrepareToAttack

;---------------------------------------------------------------------------------------------------

.delay
#_1ED489: LDA.w .speed-1,X
#_1ED48C: STA.w $0D50,X

#_1ED48F: LDA.w $0D40,X
#_1ED492: CLC
#_1ED493: ADC.b #$02
#_1ED495: STA.w $0D40,X

#_1ED498: JSR Sprite_Move_XY_Bank1E

#_1ED49B: JSL Agahnim_ApplyMotionBlur
#_1ED49F: BMI .exit_a

#_1ED4A1: LDA.b #$04
#_1ED4A3: STA.w $0F50,Y

.exit_a
#_1ED4A6: RTS

;---------------------------------------------------------------------------------------------------

.palette
#_1ED4A7: db $09, $0B

;---------------------------------------------------------------------------------------------------

.spawn_clones
#_1ED4A9: LDA.w $0DF0,X
#_1ED4AC: BNE .wait_for_clones

#_1ED4AE: JMP.w Agahnim_PrepareToAttack

;---------------------------------------------------------------------------------------------------

.wait_for_clones
#_1ED4B1: CMP.b #$40
#_1ED4B3: BNE .exit_b

#_1ED4B5: LDA.b #$28 ; SFX3.28
#_1ED4B7: STA.w $012F

#_1ED4BA: LDA.b #$01
#_1ED4BC: STA.w $0FB5

.next_clone
#_1ED4BF: LDA.b #$7A ; SPRITE 7A
#_1ED4C1: LDY.b #$02
#_1ED4C3: JSL Sprite_SpawnDynamically_slot_limited

#_1ED4C7: JSL Sprite_SetSpawnedCoordinates


#_1ED4CB: LDA.w .palette-1,Y
#_1ED4CE: STA.w $0E60,Y

#_1ED4D1: AND.b #$0F
#_1ED4D3: STA.w $0F50,Y
#_1ED4D6: STA.w $0EC0,Y

#_1ED4D9: LDA.w $0D80,X
#_1ED4DC: STA.w $0D80,Y

#_1ED4DF: LDA.b #$20
#_1ED4E1: STA.w $0DF0,Y

#_1ED4E4: DEC.w $0FB5
#_1ED4E7: BPL .next_clone

.exit_b
#_1ED4E9: RTS

;===================================================================================================

pool Agahnim_ChooseFirstMove

.next_ai
#_1ED4EA: db $01 ; LW: Aga 1
#_1ED4EB: db $06 ; DW: Aga 2

pool off

;---------------------------------------------------------------------------------------------------

Agahnim_ChooseFirstMove:
#_1ED4EC: LDY.w $0FFF

#_1ED4EF: LDA.w .next_ai,Y
#_1ED4F2: STA.w $0D80,X

#_1ED4F5: RTS

;===================================================================================================

Agahnim_HelloLightWorld:
#_1ED4F6: LDA.w $0DF0,X
#_1ED4F9: BNE EXIT_1ED51E

#_1ED4FB: LDA.b #$3F ; MESSAGE 013F
#_1ED4FD: STA.w $1CF0

#_1ED500: LDA.b #$01
#_1ED502: STA.w $1CF1

#_1ED505: JSL Sprite_ShowMessageMinimal

;===================================================================================================

Agahnim_PrepareToAttack:
#_1ED509: LDA.b #$03
#_1ED50B: STA.w $0D80,X

#_1ED50E: LDA.b #$20
#_1ED510: STA.w $0DF0,X

#_1ED513: RTS

;===================================================================================================

Agahnim_PrepareToEmerge:
#_1ED514: LDA.b #$02
#_1ED516: STA.w $0D80,X

#_1ED519: LDA.b #$27
#_1ED51B: STA.w $0DF0,X

;---------------------------------------------------------------------------------------------------

#EXIT_1ED51E:
#_1ED51E: RTS

;===================================================================================================

pool Agahnim_EmergeFromShadow

.anim_step
#_1ED51F: db $0C, $0D, $0E, $0F, $10

pool off

;---------------------------------------------------------------------------------------------------

Agahnim_EmergeFromShadow:
#_1ED524: STZ.w $0FF8

#_1ED527: LDA.w $0DF0,X
#_1ED52A: BNE .delay

#_1ED52C: INC.w $0D80,X

#_1ED52F: LDA.b #$FF
#_1ED531: STA.w $0DF0,X

#_1ED534: RTS

.delay
#_1ED535: LSR A
#_1ED536: LSR A
#_1ED537: LSR A
#_1ED538: TAY

#_1ED539: LDA.w .anim_step,Y
#_1ED53C: STA.w $0DC0,X

#_1ED53F: RTS

;===================================================================================================

pool Agahnim_Attack

.attack_anim_offset
#_1ED540: db $00, $00, $00, $00, $00, $00, $00, $01
#_1ED548: db $01, $01, $01, $01, $01, $01, $00, $00

.attack_anim_ball_step
#_1ED550: db $00, $00, $00, $00, $00, $00, $00, $06
#_1ED558: db $05, $04, $03, $02, $01, $00, $00, $00

.attack_anim_ball_step_offset
#_1ED560: db $1E, $18, $0C, $00, $06, $12

pool off

;---------------------------------------------------------------------------------------------------

Agahnim_Attack:
#_1ED566: LDA.w $0DF0,X
#_1ED569: CMP.b #$C0
#_1ED56B: BNE .no_charge_sfx

#_1ED56D: PHA

#_1ED56E: LDA.b #$27 ; SFX3.27
#_1ED570: JSL SpriteSFX_QueueSFX3WithPan

#_1ED574: PLA

;---------------------------------------------------------------------------------------------------

.no_charge_sfx
#_1ED575: CMP.b #$EF
#_1ED577: BCS .apply_unfade_filter

.apply_fade_filter
#_1ED579: CMP.b #$10
#_1ED57B: BCS .skip_filter

.apply_unfade_filter
#_1ED57D: PHX

#_1ED57E: LDA.w $0FFF
#_1ED581: BNE .aga2_filtering

#_1ED583: LDX.b #$02

.aga2_filtering
#_1ED585: JSL AgahnimWarpShadowFilter

#_1ED589: PLX

#_1ED58A: BRA .immune

;---------------------------------------------------------------------------------------------------

.skip_filter
#_1ED58C: TXA
#_1ED58D: BNE .immune

#_1ED58F: JSR Sprite_CheckDamageToAndFromLink_Bank1E

#_1ED592: STZ.w $0BA0,X

.immune
#_1ED595: LDA.w $0DF0,X
#_1ED598: BNE .delay_warp

#_1ED59A: INC.w $0D80,X

#_1ED59D: LDA.b #$27
#_1ED59F: STA.w $0DF0,X

#_1ED5A2: RTS

;---------------------------------------------------------------------------------------------------

.delay_warp
#_1ED5A3: CMP.b #$80
#_1ED5A5: BCC .direction_locked

#_1ED5A7: PHA

#_1ED5A8: LDA.b #$02
#_1ED5AA: JSL Sprite_ApplySpeedTowardsLink_long

#_1ED5AE: LDY.b $01

#_1ED5B0: LDA.b $00
#_1ED5B2: CLC
#_1ED5B3: ADC.b #$02
#_1ED5B5: STA.b $02

#_1ED5B7: ASL A
#_1ED5B8: ASL A
#_1ED5B9: ADC.b $02
#_1ED5BB: ADC.b #$02

#_1ED5BD: CLC
#_1ED5BE: ADC.b $01
#_1ED5C0: TAY

#_1ED5C1: LDA.w Agahnim_Direction,Y
#_1ED5C4: STA.w $0DE0,X

#_1ED5C7: LDA.b #$20
#_1ED5C9: JSL Sprite_ApplySpeedTowardsLink_long

#_1ED5CD: LDA.w $0E30,X
#_1ED5D0: CMP.b #$04
#_1ED5D2: BNE .not_lightning

#_1ED5D4: LDA.b #$03
#_1ED5D6: STA.w $0DE0,X

.not_lightning
#_1ED5D9: PLA

.direction_locked
#_1ED5DA: CMP.b #$70
#_1ED5DC: BNE .dont_fire

#_1ED5DE: PHA

#_1ED5DF: JSR Agahnim_PerformAttack

#_1ED5E2: PLA

.dont_fire
#_1ED5E3: LSR A
#_1ED5E4: LSR A
#_1ED5E5: LSR A
#_1ED5E6: LSR A
#_1ED5E7: TAY

#_1ED5E8: LDA.w .attack_anim_offset,Y
#_1ED5EB: STA.w $0D90,X

#_1ED5EE: LDA.w .attack_anim_ball_step,Y
#_1ED5F1: BEQ .no_offset_needed

#_1ED5F3: CLC
#_1ED5F4: LDY.w $0DE0,X
#_1ED5F7: ADC.w .attack_anim_ball_step_offset,Y

.no_offset_needed
#_1ED5FA: STA.w $0EB0,X

#_1ED5FD: LDY.w $0DE0,X

#_1ED600: LDA.w Agahnim_DirectionStepOffset,Y
#_1ED603: CLC
#_1ED604: ADC.w $0D90,X
#_1ED607: STA.w $0DC0,X

#_1ED60A: RTS

;===================================================================================================

pool Agahnim_ChooseWarpSpot

.anim_step
#_1ED60B: db $10, $0F, $0E, $0D, $0C

.pos_x
#_1ED610: db $38, $38, $38, $58, $78, $98, $B8, $B8
#_1ED618: db $B8, $98, $58, $58, $60, $90, $98, $78

.pos_y
#_1ED620: db $B8, $78, $58, $48, $48, $48, $58, $78
#_1ED628: db $B8, $B8, $B8, $90, $70, $70, $90, $A0

pool off

;---------------------------------------------------------------------------------------------------

Agahnim_ChooseWarpSpot:
#_1ED630: LDA.w $0DF0,X
#_1ED633: STA.w $0BA0,X
#_1ED636: BNE .delay

#_1ED638: INC.w $0D80,X

#_1ED63B: LDY.b #$04

#_1ED63D: LDA.w $0E30,X
#_1ED640: CMP.b #$04
#_1ED642: BEQ .use_middle_for_lightning

#_1ED644: JSL GetRandomNumber
#_1ED648: AND.b #$0F
#_1ED64A: TAY

.use_middle_for_lightning
#_1ED64B: LDA.w .pos_x,Y
#_1ED64E: STA.w $0DB0,X

#_1ED651: LDA.w .pos_y,Y
#_1ED654: STA.w $0E90,X

#_1ED657: LDA.b #$08
#_1ED659: STA.w $0ED0,X

#_1ED65C: RTS

.delay
#_1ED65D: LSR A
#_1ED65E: LSR A
#_1ED65F: LSR A
#_1ED660: TAY

#_1ED661: LDA.w .anim_step,Y
#_1ED664: STA.w $0DC0,X

#_1ED667: RTS

;===================================================================================================

pool Agahnim_PerformAttack

.offset_x_low
#_1ED668: db   0,  10,   8,   0, -10, -10

.offset_x_high
#_1ED66E: db   0,   0,   0,   0,  -1,  -1

.offset_y_low
#_1ED674: db  -9,  -2,  -2,  -9,  -2,  -2

pool off

;---------------------------------------------------------------------------------------------------

Agahnim_PerformAttack:
#_1ED67A: CPX.b #$00
#_1ED67C: BNE .can_use_lightning

#_1ED67E: INC.w $0E30,X

#_1ED681: LDA.w $0FFF
#_1ED684: BEQ .can_use_lightning

#_1ED686: LDA.w $0E30,X
#_1ED689: AND.b #$03
#_1ED68B: STA.w $0E30,X

.can_use_lightning
#_1ED68E: LDA.w $0E30,X
#_1ED691: CMP.b #$05
#_1ED693: BNE .balls

#_1ED695: STZ.w $0E30,X

#_1ED698: LDA.b #$26 ; SFX3.26
#_1ED69A: JSL SpriteSFX_QueueSFX3WithPan

#_1ED69E: JSR .spawn_2

.spawn_2
#_1ED6A1: JSL Sprite_SpawnLightning
#_1ED6A5: JSL Sprite_SpawnLightning

#_1ED6A9: RTS

;---------------------------------------------------------------------------------------------------

.balls
#_1ED6AA: LDA.b #$7B ; SPRITE 7B
#_1ED6AC: JSL Sprite_SpawnDynamically
#_1ED6B0: BMI .exit

#_1ED6B2: LDA.b #$29 ; SFX3.29
#_1ED6B4: JSL SpriteSFX_QueueSFX3WithPan

#_1ED6B8: PHX

#_1ED6B9: LDA.w $0DE0,X
#_1ED6BC: TAX

#_1ED6BD: LDA.b $00
#_1ED6BF: CLC
#_1ED6C0: ADC.w .offset_x_low,X
#_1ED6C3: STA.w $0D10,Y

#_1ED6C6: LDA.b $01
#_1ED6C8: ADC.w .offset_x_high,X
#_1ED6CB: STA.w $0D30,Y

#_1ED6CE: LDA.b $02
#_1ED6D0: CLC
#_1ED6D1: ADC.w .offset_y_low,X
#_1ED6D4: STA.w $0D00,Y

#_1ED6D7: LDA.b $03
#_1ED6D9: ADC.b #$FF
#_1ED6DB: STA.w $0D20,Y
#_1ED6DE: STA.w $0BA0,Y

#_1ED6E1: PLX

#_1ED6E2: LDA.w $0D50,X
#_1ED6E5: STA.w $0D50,Y

#_1ED6E8: LDA.w $0D40,X
#_1ED6EB: STA.w $0D40,Y

#_1ED6EE: LDA.w $0E30,X
#_1ED6F1: CMP.b #$02
#_1ED6F3: BCC .exit

#_1ED6F5: JSL GetRandomNumber
#_1ED6F9: AND.b #$01
#_1ED6FB: BNE .exit

#_1ED6FD: LDA.b #$01
#_1ED6FF: STA.w $0DA0,Y

#_1ED702: LDA.b #$20
#_1ED704: STA.w $0DF0,Y

.exit
#_1ED707: RTS

;===================================================================================================

Agahnim_MoveTowardsWarp:
#_1ED708: LDA.b #$01
#_1ED70A: STA.w $0BA0,X

#_1ED70D: LDA.w $0D10,X
#_1ED710: STA.b $00

#_1ED712: LDA.w $0D30,X
#_1ED715: STA.b $01
#_1ED717: STA.b $05

#_1ED719: LDA.w $0D00,X
#_1ED71C: STA.b $02

#_1ED71E: LDA.w $0D20,X
#_1ED721: STA.b $03
#_1ED723: STA.b $07

#_1ED725: LDA.w $0DB0,X
#_1ED728: STA.b $04

#_1ED72A: LDA.w $0E90,X
#_1ED72D: STA.b $06

;---------------------------------------------------------------------------------------------------

#_1ED72F: REP #$20

#_1ED731: LDA.b $00
#_1ED733: SEC
#_1ED734: SBC.b $04

#_1ED736: CLC
#_1ED737: ADC.w #$0007

#_1ED73A: CMP.w #$000E
#_1ED73D: BCS .not_close

#_1ED73F: LDA.b $02
#_1ED741: SEC
#_1ED742: SBC.b $06

#_1ED744: CLC
#_1ED745: ADC.w #$0007

#_1ED748: CMP.w #$000E
#_1ED74B: BCS .not_close

#_1ED74D: SEP #$20

#_1ED74F: LDA.w $0DB0,X
#_1ED752: STA.w $0D10,X

#_1ED755: LDA.w $0E90,X
#_1ED758: STA.w $0D00,X

#_1ED75B: JMP.w Agahnim_PrepareToEmerge

;---------------------------------------------------------------------------------------------------

.not_close
#_1ED75E: SEP #$20

#_1ED760: LDA.w $0ED0,X
#_1ED763: JSL Sprite_ProjectSpeedTowardsLocation_long

#_1ED767: LDA.b $00
#_1ED769: STA.w $0D40,X

#_1ED76C: LDA.b $01
#_1ED76E: STA.w $0D50,X

#_1ED771: LDA.w $0ED0,X
#_1ED774: CMP.b #$40
#_1ED776: BCS .skip

#_1ED778: INC.w $0ED0,X

.skip
#_1ED77B: JSR Sprite_Move_XY_Bank1E

#_1ED77E: RTS

;===================================================================================================

pool SpriteDraw_Agahnim

.agahnim_offset_x
#_1ED77F: db  -8,   8,  -8,   8
#_1ED783: db  -8,   8,  -8,   8
#_1ED787: db  -8,   8,  -8,   8
#_1ED78B: db  -8,   8,  -8,   8
#_1ED78F: db  -8,   8,  -8,   8
#_1ED793: db  -8,   8,  -8,   8
#_1ED797: db  -8,   8,  -8,   8
#_1ED79B: db  -8,   8,  -8,   8
#_1ED79F: db  -8,   8,  -8,   8
#_1ED7A3: db  -8,   8,  -8,   8
#_1ED7A7: db  -8,   8,  -8,   8
#_1ED7AB: db  -8,   8,  -8,   8
#_1ED7AF: db  -8,   8,  -8,   8
#_1ED7B3: db  -6,   6,  -6,   6
#_1ED7B7: db  -8,   8,  -8,   8
#_1ED7BB: db  -6,   6,  -6,   6
#_1ED7BF: db   0,   8,   0,   8
#_1ED7C3: db  -8,   8,  -8,   8

.agahnim_offset_y
#_1ED7C7: db  -8,  -8,   8,   8
#_1ED7CB: db  -8,  -8,   8,   8
#_1ED7CF: db  -8,  -8,   8,   8
#_1ED7D3: db  -8,  -8,   8,   8
#_1ED7D7: db  -8,  -8,   8,   8
#_1ED7DB: db  -8,  -8,   8,   8
#_1ED7DF: db  -8,  -8,   8,   8
#_1ED7E3: db  -8,  -8,   8,   8
#_1ED7E7: db  -8,  -8,   8,   8
#_1ED7EB: db  -8,  -8,   8,   8
#_1ED7EF: db  -8,  -8,   8,   8
#_1ED7F3: db  -8,  -8,   8,   8
#_1ED7F7: db  -8,  -8,   8,   8
#_1ED7FB: db  -6,  -6,   6,   6
#_1ED7FF: db  -8,  -8,   8,   8
#_1ED803: db  -6,  -6,   6,   6
#_1ED807: db   0,   0,   8,   8
#_1ED80B: db   8,   8,   8,   8

.agahnim_char
#_1ED80F: db $82, $82, $A2, $A2
#_1ED813: db $80, $80, $A0, $A0
#_1ED817: db $84, $84, $A4, $A4
#_1ED81B: db $86, $86, $A6, $A6
#_1ED81F: db $88, $8A, $A8, $AA
#_1ED823: db $8C, $8E, $AC, $AE
#_1ED827: db $C4, $C2, $E4, $E6
#_1ED82B: db $C0, $C2, $E0, $E2
#_1ED82F: db $8A, $88, $AA, $A8
#_1ED833: db $8E, $8C, $AE, $AC
#_1ED837: db $C2, $C4, $E6, $E4
#_1ED83B: db $C2, $C0, $E2, $E0
#_1ED83F: db $EC, $EC, $EC, $EC
#_1ED843: db $EC, $EC, $EC, $EC
#_1ED847: db $EE, $EE, $EE, $EE
#_1ED84B: db $EE, $EE, $EE, $EE
#_1ED84F: db $DF, $DF, $DF, $DF
#_1ED853: db $40, $42, $40, $42

.agahnim_flip
#_1ED857: db $00, $40, $00, $40
#_1ED85B: db $00, $40, $00, $40
#_1ED85F: db $00, $40, $00, $40
#_1ED863: db $00, $40, $00, $40
#_1ED867: db $00, $00, $00, $00
#_1ED86B: db $00, $00, $00, $00
#_1ED86F: db $00, $00, $00, $00
#_1ED873: db $00, $00, $00, $00
#_1ED877: db $40, $40, $40, $40
#_1ED87B: db $40, $40, $40, $40
#_1ED87F: db $40, $40, $40, $40
#_1ED883: db $40, $40, $40, $40
#_1ED887: db $00, $40, $80, $C0
#_1ED88B: db $00, $40, $80, $C0
#_1ED88F: db $00, $40, $80, $C0
#_1ED893: db $00, $40, $80, $C0
#_1ED897: db $00, $40, $80, $C0
#_1ED89B: db $00, $00, $00, $00

;---------------------------------------------------------------------------------------------------

.ball_offset_x
#_1ED89F: db  -7,  15, -11,  11
#_1ED8A3: db -11,  11,  -8,   8
#_1ED8A7: db  -4,   4,   0,   0
#_1ED8AB: db -10,  -1, -14,  -5
#_1ED8AF: db -14,  -5, -12,  -7
#_1ED8B3: db -10,  -7, -10, -10
#_1ED8B7: db  16,   8,  12,   4
#_1ED8BB: db  12,   4,  10,   6
#_1ED8BF: db   9,   7,   8,   8

#_1ED8C3: db  -6,  -6, -10, -10
#_1ED8C7: db -10, -10, -10, -10
#_1ED8CB: db -10, -10, -10, -10
#_1ED8CF: db  14,  14,  10,  10
#_1ED8D3: db  10,  10,  10,  10
#_1ED8D7: db  10,  10,  10,  10
#_1ED8DB: db  -7,  15, -11,  11
#_1ED8DF: db -11,  11,  -8,   8
#_1ED8E3: db  -4,   4,   0,   0

.ball_offset_y
#_1ED8E7: db  -5,  -5,  -9,  -9
#_1ED8EB: db  -9,  -9,  -9,  -9
#_1ED8EF: db  -9,  -9,  -9,  -9
#_1ED8F3: db  -3,   9,  -7,   5
#_1ED8F7: db  -7,   5,  -5,   3
#_1ED8FB: db  -3,   3,  -2,  -2
#_1ED8FF: db  -3,   9,  -7,   5
#_1ED903: db  -7,   5,  -5,   3
#_1ED907: db  -3,   3,  -2,  -2

#_1ED90B: db  -3,   9,  -7,   5
#_1ED90F: db  -7,   5,  -5,   3
#_1ED913: db  -3,   3,  -2,  -2
#_1ED917: db  -3,   9,  -7,   5
#_1ED91B: db  -7,   5,  -5,   3
#_1ED91F: db  -3,   3,  -2,  -2
#_1ED923: db  -5,  -5,  -9,  -9
#_1ED927: db  -9,  -9,  -9,  -9
#_1ED92B: db  -9,  -9,  -9,  -9

.ball_char
#_1ED92F: db $CE, $CC, $C6, $C6
#_1ED933: db $C6, $C6, $CE, $CC
#_1ED937: db $C6, $C6, $C6, $C6
#_1ED93B: db $CE, $CC, $C6, $C6
#_1ED93F: db $C6, $C6, $CE, $CC
#_1ED943: db $C6, $C6, $C6, $C6
#_1ED947: db $CE, $CC, $C6, $C6
#_1ED94B: db $C6, $C6, $CE, $CC
#_1ED94F: db $C6, $C6, $C6, $C6

.ball_palette
#_1ED953: db $00, $02, $02, $02
#_1ED957: db $02, $02, $00, $02
#_1ED95B: db $02, $02, $02, $02
#_1ED95F: db $00, $02, $02, $02
#_1ED963: db $02, $02, $00, $02
#_1ED967: db $02, $02, $02, $02
#_1ED96B: db $00, $02, $02, $02
#_1ED96F: db $02, $02, $00, $02
#_1ED973: db $02, $02, $02, $02

pool off

;===================================================================================================

UNREACHABLE_1ED977:
#_1ED977: RTS

;===================================================================================================

SpriteDraw_Agahnim:
#_1ED978: JSR Sprite_PrepOAMCoord_Bank1E

#_1ED97B: LDA.w $0DC0,X
#_1ED97E: ASL A
#_1ED97F: ASL A
#_1ED980: STA.b $06

;---------------------------------------------------------------------------------------------------

#_1ED982: PHX

#_1ED983: LDX.b #$03

.next_aga_obj
#_1ED985: PHX

#_1ED986: TXA
#_1ED987: CLC
#_1ED988: ADC.b $06
#_1ED98A: TAX

#_1ED98B: LDA.b $00
#_1ED98D: CLC
#_1ED98E: ADC.w .agahnim_offset_x,X
#_1ED991: STA.b ($90),Y

#_1ED993: LDA.b $02
#_1ED995: CLC
#_1ED996: ADC.w .agahnim_offset_y,X
#_1ED999: INY
#_1ED99A: STA.b ($90),Y

#_1ED99C: LDA.w .agahnim_char,X
#_1ED99F: INY
#_1ED9A0: STA.b ($90),Y

#_1ED9A2: LDA.w .agahnim_flip,X
#_1ED9A5: ORA.b $05
#_1ED9A7: INY
#_1ED9A8: STA.b ($90),Y

#_1ED9AA: PHY

#_1ED9AB: TYA
#_1ED9AC: LSR A
#_1ED9AD: LSR A
#_1ED9AE: TAY

#_1ED9AF: LDA.b #$02

#_1ED9B1: CPX.b #$44
#_1ED9B3: BCS .draw_big

#_1ED9B5: CPX.b #$40
#_1ED9B7: BCC .draw_big

#_1ED9B9: LDA.b #$00

.draw_big
#_1ED9BB: STA.b ($92),Y

#_1ED9BD: PLY

#_1ED9BE: INY

#_1ED9BF: PLX
#_1ED9C0: DEX
#_1ED9C1: BPL .next_aga_obj

#_1ED9C3: PLX

;---------------------------------------------------------------------------------------------------

#_1ED9C4: LDA.w $0DC0,X
#_1ED9C7: CMP.b #$0C
#_1ED9C9: BCS .no_shadow

#_1ED9CB: LDA.b #$12
#_1ED9CD: JSL SpriteDraw_Shadow_custom_long

.no_shadow
#_1ED9D1: LDA.b $11
#_1ED9D3: BEQ .skip_correction

#_1ED9D5: LDY.b #$FF
#_1ED9D7: LDA.b #$03
#_1ED9D9: JSL Sprite_CorrectOAMEntries_long

.skip_correction
#_1ED9DD: JSR Sprite_PrepOAMCoord_Bank1E

#_1ED9E0: LDA.b #$08
#_1ED9E2: LDY.w $0DE0,X
#_1ED9E5: BEQ .use_region_b

.use_region_c
#_1ED9E7: JSL SpriteDraw_AllocateOAMFromRegionC

#_1ED9EB: BRA .continue

.use_region_b
#_1ED9ED: JSL SpriteDraw_AllocateOAMFromRegionB

;---------------------------------------------------------------------------------------------------

.continue
#_1ED9F1: LDY.b #$00
#_1ED9F3: LDA.w $0EB0,X
#_1ED9F6: BEQ .exit

#_1ED9F8: DEC A
#_1ED9F9: STA.b $0C

#_1ED9FB: ASL A
#_1ED9FC: STA.b $06

#_1ED9FE: LDA.b $1A
#_1EDA00: LSR A
#_1EDA01: AND.b #$02

#_1EDA03: INC A
#_1EDA04: INC A

#_1EDA05: ORA.b #$31
#_1EDA07: STA.b $0D

;---------------------------------------------------------------------------------------------------

#_1EDA09: PHX

#_1EDA0A: LDX.b #$01

.next_ball_obj
#_1EDA0C: PHX

#_1EDA0D: TXA
#_1EDA0E: CLC
#_1EDA0F: ADC.b $06
#_1EDA11: TAX

#_1EDA12: LDA.b $00
#_1EDA14: CLC
#_1EDA15: ADC.w .ball_offset_x,X
#_1EDA18: STA.b ($90),Y

#_1EDA1A: LDA.b $02
#_1EDA1C: CLC
#_1EDA1D: ADC.w .ball_offset_y,X
#_1EDA20: INY
#_1EDA21: STA.b ($90),Y

#_1EDA23: LDX.b $0C

#_1EDA25: LDA.w .ball_char,X
#_1EDA28: INY
#_1EDA29: STA.b ($90),Y

#_1EDA2B: INY

#_1EDA2C: LDA.b $0D
#_1EDA2E: STA.b ($90),Y

#_1EDA30: PHY

#_1EDA31: TYA
#_1EDA32: LSR A
#_1EDA33: LSR A
#_1EDA34: TAY

#_1EDA35: LDA.w .ball_palette,X
#_1EDA38: STA.b ($92),Y

#_1EDA3A: PLY
#_1EDA3B: INY

#_1EDA3C: PLX
#_1EDA3D: DEX
#_1EDA3E: BPL .next_ball_obj

#_1EDA40: PLX

.exit
#_1EDA41: RTS

;===================================================================================================

Sprite_7B_AgahnimBalls:
#_1EDA42: LDA.w $0DA0,X
#_1EDA45: BEQ YellowBall

;===================================================================================================

BlueBall:
#_1EDA47: LDA.w $0DF0,X
#_1EDA4A: BEQ .done_homing

#_1EDA4C: LDA.b #$20
#_1EDA4E: JSL Sprite_ApplySpeedTowardsLink_long

.done_homing
#_1EDA52: LDA.b #$05
#_1EDA54: BRA AgahnimBalls_Main

;===================================================================================================

YellowBall:
#_1EDA56: LDA.b $1A
#_1EDA58: LSR A
#_1EDA59: AND.b #$02

#_1EDA5B: INC A
#_1EDA5C: INC A
#_1EDA5D: ORA.b #$01

;===================================================================================================

AgahnimBalls_Main:
#_1EDA5F: STA.w $0F50,X

#_1EDA62: LDA.w $0D80,X
#_1EDA65: BEQ .continue

#_1EDA67: JMP.w AgahnimBalls_DrawTrail

.continue
#_1EDA6A: LDA.w $0DA0,X
#_1EDA6D: BEQ .draw_yellow

#_1EDA6F: JSR SpriteDraw_BlueBalls
#_1EDA72: BRA .drawing_done

.draw_yellow
#_1EDA74: JSL SpriteDraw_SingleLarge_long

;---------------------------------------------------------------------------------------------------

.drawing_done
#_1EDA78: JSR Sprite_CheckIfActive_Bank1E

#_1EDA7B: INC.w $0E80,X

#_1EDA7E: JSR Sprite_Move_XY_Bank1E

#_1EDA81: JSR Sprite_CheckTileCollision_Bank1E
#_1EDA84: BEQ .no_tile_collision

#_1EDA86: STZ.w $0DD0,X

#_1EDA89: LDA.w $0DA0,X
#_1EDA8C: BNE .blue_ball_explode

.no_tile_collision
#_1EDA8E: LDA.w $0D90,X
#_1EDA91: BEQ .reflected

#_1EDA93: LDA.w $0BA0
#_1EDA96: BNE .reflected

#_1EDA98: LDA.w $0D10,X
#_1EDA9B: STA.b $00

#_1EDA9D: LDA.w $0D30,X
#_1EDAA0: STA.b $08

#_1EDAA2: LDA.b #$0F
#_1EDAA4: STA.b $02
#_1EDAA6: STA.b $03

#_1EDAA8: LDA.w $0D00,X
#_1EDAAB: STA.b $01

#_1EDAAD: LDA.w $0D20,X
#_1EDAB0: STA.b $09

#_1EDAB2: PHX

#_1EDAB3: LDX.b #$00
#_1EDAB5: JSL Sprite_SetupHitbox_long

#_1EDAB9: PLX

#_1EDABA: JSL CheckIfHitBoxesOverlap_long
#_1EDABE: BCC .didnt_hit_aga

#_1EDAC0: PHX

#_1EDAC1: LDA.b #$A0
#_1EDAC3: STA.b $00

#_1EDAC5: LDA.b #$10
#_1EDAC7: LDX.b #$00
#_1EDAC9: JSL AgahnimBalls_DamageAgahnim

#_1EDACD: PLX

#_1EDACE: STZ.w $0DD0,X

#_1EDAD1: LDA.w $0D50,X
#_1EDAD4: STA.w $0F40

#_1EDAD7: LDA.w $0D40,X
#_1EDADA: STA.w $0F30

.didnt_hit_aga
#_1EDADD: BRA .finish_up

;---------------------------------------------------------------------------------------------------

.reflected
#_1EDADF: JSR Sprite_CheckDamageToLink_Bank1E
#_1EDAE2: JSL Sprite_CheckDamageFromLink_long
#_1EDAE6: BCC .finish_up

#_1EDAE8: LDA.w $0DA0,X
#_1EDAEB: BEQ .reflected_yellow_ball

#_1EDAED: STZ.w $0DD0,X

.blue_ball_explode
#_1EDAF0: LDA.b #$36 ; SFX3.36
#_1EDAF2: JSL SpriteSFX_QueueSFX3WithPan

#_1EDAF6: JSR CreateSixBlueBalls

#_1EDAF9: RTS

;---------------------------------------------------------------------------------------------------

.reflected_yellow_ball
#_1EDAFA: LDA.b #$05 ; SFX2.05
#_1EDAFC: JSL SpriteSFX_QueueSFX2WithPan

#_1EDB00: LDA.b #$29 ; SFX3.29
#_1EDB02: JSL SpriteSFX_QueueSFX3WithPan

#_1EDB06: LDA.b #$30
#_1EDB08: JSL Sprite_ApplySpeedTowardsLink_long

#_1EDB0C: LDA.b $01
#_1EDB0E: EOR.b #$FF
#_1EDB10: INC A
#_1EDB11: STA.w $0D50,X

#_1EDB14: LDA.b $00
#_1EDB16: EOR.b #$FF
#_1EDB18: INC A
#_1EDB19: STA.w $0D40,X

#_1EDB1C: INC.w $0D90,X

;---------------------------------------------------------------------------------------------------

.finish_up
#_1EDB1F: TXA
#_1EDB20: EOR.b $1A
#_1EDB22: AND.b #$03
#_1EDB24: ORA.w $0DA0,X
#_1EDB27: BNE .exit

#_1EDB29: LDA.b #$7B ; SPRITE 7B
#_1EDB2B: JSL Sprite_SpawnDynamically
#_1EDB2F: BMI .exit

#_1EDB31: JSL Sprite_SetSpawnedCoordinates

#_1EDB35: LDA.b #$0F
#_1EDB37: STA.w $0DF0,Y
#_1EDB3A: STA.w $0D80,Y

#_1EDB3D: LDA.w $0DA0,X
#_1EDB40: STA.w $0DA0,Y

.exit
#_1EDB43: RTS

;===================================================================================================

pool AgahnimBalls_DrawTrail

.anim_step
#_1EDB44: db $02, $02, $02, $02, $02, $02, $02, $01
#_1EDB4C: db $01, $01, $01, $01, $00, $00, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

AgahnimBalls_DrawTrail:
#_1EDB54: LDA.w $0DC0,X
#_1EDB57: CMP.b #$02
#_1EDB59: BEQ .small

#_1EDB5B: JSL SpriteDraw_SingleLarge_long
#_1EDB5F: BRA .continue

.small
#_1EDB61: JSL SpriteDraw_SingleSmall_long

.continue
#_1EDB65: JSR Sprite_CheckIfActive_Bank1E

#_1EDB68: LDA.w $0DF0,X
#_1EDB6B: STA.w $0BA0,X
#_1EDB6E: BNE .stay_around

#_1EDB70: STZ.w $0DD0,X

.stay_around
#_1EDB73: TAY
#_1EDB74: CMP.b #$06
#_1EDB76: BNE .dont_move

#_1EDB78: LDA.b #$40
#_1EDB7A: STA.w $0D50,X
#_1EDB7D: STA.w $0D40,X

#_1EDB80: JSR Sprite_Move_XY_Bank1E

.dont_move
#_1EDB83: LDA.w .anim_step,Y
#_1EDB86: STA.w $0DC0,X

#_1EDB89: RTS

;===================================================================================================

pool CreateSixBlueBalls

.speed_x
#_1EDB8A: db   0,  24,  24,   0, -24, -24

.speed_y
#_1EDB90: db -32, -16,  16,  32,  16, -16

pool off

;---------------------------------------------------------------------------------------------------

CreateSixBlueBalls:
#_1EDB96: LDA.b #$36 ; SFX3.36
#_1EDB98: JSL SpriteSFX_QueueSFX3WithPan

#_1EDB9C: LDA.b #$05
#_1EDB9E: STA.w $0FB5

.spawn_next
#_1EDBA1: JSR .spawn_one

#_1EDBA4: DEC.w $0FB5
#_1EDBA7: BNE .spawn_next

;---------------------------------------------------------------------------------------------------

.spawn_one
#_1EDBA9: LDA.b #$55 ; SPRITE 55
#_1EDBAB: JSL Sprite_SpawnDynamically
#_1EDBAF: BMI .no_space

#_1EDBB1: LDA.b $00
#_1EDBB3: CLC
#_1EDBB4: ADC.b #$04
#_1EDBB6: STA.w $0D10,Y

#_1EDBB9: LDA.b $01
#_1EDBBB: ADC.b #$00
#_1EDBBD: STA.w $0D30,Y

#_1EDBC0: LDA.b $02
#_1EDBC2: CLC
#_1EDBC3: ADC.b #$04
#_1EDBC5: STA.w $0D00,Y

#_1EDBC8: LDA.b $03
#_1EDBCA: ADC.b #$00
#_1EDBCC: STA.w $0D20,Y

#_1EDBCF: LDA.w $0E60,Y
#_1EDBD2: AND.b #$FE
#_1EDBD4: ORA.b #$40
#_1EDBD6: STA.w $0E60,Y

#_1EDBD9: LDA.b #$04
#_1EDBDB: STA.w $0F50,Y
#_1EDBDE: STA.w $0E00,Y

#_1EDBE1: LDA.b #$14
#_1EDBE3: STA.w $0F60,Y
#_1EDBE6: STA.w $0DB0,Y
#_1EDBE9: STA.w $0E90,Y

#_1EDBEC: PHX

#_1EDBED: LDX.w $0FB5

#_1EDBF0: LDA.w .speed_x,X
#_1EDBF3: STA.w $0D50,Y

#_1EDBF6: LDA.w .speed_y,X
#_1EDBF9: STA.w $0D40,Y

#_1EDBFC: PLX

.no_space
#_1EDBFD: RTS

;===================================================================================================

pool SpriteDraw_BlueBalls

.oam_groups
#_1EDBFE: dw   4,  -3 : db $CE, $00, $00, $00
#_1EDC06: dw  11,   4 : db $CE, $00, $00, $00
#_1EDC0E: dw   4,  11 : db $CE, $00, $00, $00
#_1EDC16: dw  -3,   4 : db $CE, $00, $00, $00

#_1EDC1E: dw  -1,  -1 : db $CE, $00, $00, $00
#_1EDC26: dw   9,  -1 : db $CE, $00, $00, $00
#_1EDC2E: dw  -1,   9 : db $CE, $00, $00, $00
#_1EDC36: dw   9,   9 : db $CE, $00, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_BlueBalls:
#_1EDC3E: LDA.b #$00
#_1EDC40: XBA
#_1EDC41: LDA.w $0E80,X

#_1EDC44: LSR A
#_1EDC45: LSR A
#_1EDC46: AND.b #$01

#_1EDC48: REP #$20

#_1EDC4A: ASL A
#_1EDC4B: ASL A
#_1EDC4C: ASL A
#_1EDC4D: ASL A
#_1EDC4E: ASL A
#_1EDC4F: ADC.w #.oam_groups
#_1EDC52: STA.b $08

#_1EDC54: SEP #$20

#_1EDC56: LDA.b #$04
#_1EDC58: JMP.w SpriteDraw_Tabulated_Bank1E

;===================================================================================================

Sprite_79_Bee:
#_1EDC5B: LDA.w $0D80,X
#_1EDC5E: JSL JumpTableLocal
#_1EDC62: dw Bee_DormantHive
#_1EDC64: dw Bee_Main
#_1EDC66: dw Bee_Captured

;===================================================================================================

Bee_DormantHive:
#_1EDC68: LDA.w $0E90,X
#_1EDC6B: BNE .exit

#_1EDC6D: STZ.w $0DD0,X

#_1EDC70: LDY.b #$0B

.more_bees
#_1EDC72: PHY

#_1EDC73: JSR SpawnBeeFromHive

#_1EDC76: PLY
#_1EDC77: DEY
#_1EDC78: BPL .more_bees

.exit
#_1EDC7A: RTS

;===================================================================================================

BeeSpeedSlow:
#_1EDC7B: db  15,   5,  -5, -15,  20,  10, -10, -20

BeeSpeedFast:
#_1EDC83: db   8,   2,  -2,  -8,  10,   5,  -5, -10

BeeTimer:
#_1EDC8B: db  64,  64, 255, 255

;===================================================================================================

SpawnBeeFromHive:
#_1EDC8F: LDA.b #$79 ; SPRITE 79
#_1EDC91: JSL Sprite_SpawnDynamically
#_1EDC95: BMI .no_space

#_1EDC97: JSL Sprite_SetSpawnedCoordinates

;===================================================================================================

#InitializeSpawnedBee:
#_1EDC9B: PHX

#_1EDC9C: LDA.b #$01
#_1EDC9E: STA.w $0D80,Y

#_1EDCA1: TYA
#_1EDCA2: AND.b #$03
#_1EDCA4: TAX

#_1EDCA5: LDA.w BeeTimer,X
#_1EDCA8: STA.w $0DF0,Y
#_1EDCAB: STA.w $0D90,Y

#_1EDCAE: LDA.b #$60
#_1EDCB0: STA.w $0F10,Y

#_1EDCB3: JSL GetRandomNumber
#_1EDCB7: AND.b #$07
#_1EDCB9: TAX

#_1EDCBA: LDA.w BeeSpeedSlow,X
#_1EDCBD: STA.w $0D50,Y

#_1EDCC0: JSL GetRandomNumber
#_1EDCC4: AND.b #$07
#_1EDCC6: TAX

#_1EDCC7: LDA.w BeeSpeedSlow,X
#_1EDCCA: STA.w $0D40,Y

#_1EDCCD: PLX

.no_space
#_1EDCCE: RTS

;===================================================================================================

ReleaseBeeFromBottle:
#_1EDCCF: PHB
#_1EDCD0: PHK
#_1EDCD1: PLB

#_1EDCD2: LDA.b #$B2 ; SPRITE B2
#_1EDCD4: JSL Sprite_SpawnDynamically
#_1EDCD8: BMI .no_space

#_1EDCDA: LDA.b $EE
#_1EDCDC: STA.w $0F20,Y

#_1EDCDF: LDA.b $22
#_1EDCE1: CLC
#_1EDCE2: ADC.b #$08
#_1EDCE4: STA.w $0D10,Y

#_1EDCE7: LDA.b $23
#_1EDCE9: ADC.b #$00
#_1EDCEB: STA.w $0D30,Y

#_1EDCEE: LDA.b $20
#_1EDCF0: CLC
#_1EDCF1: ADC.b #$10
#_1EDCF3: STA.w $0D00,Y

#_1EDCF6: LDA.b $21
#_1EDCF8: ADC.b #$00
#_1EDCFA: STA.w $0D20,Y

#_1EDCFD: PHX

#_1EDCFE: LDX.w $0202
#_1EDD01: LDA.l $7EF33F,X

#_1EDD05: TAX

#_1EDD06: LDA.l $7EF35B,X
#_1EDD0A: CMP.b #$08
#_1EDD0C: BNE .regular_bee

#_1EDD0E: LDA.b #$01
#_1EDD10: STA.w $0EB0,Y

.regular_bee
#_1EDD13: JSR InitializeSpawnedBee

#_1EDD16: JSL GetRandomNumber
#_1EDD1A: AND.b #$07
#_1EDD1C: TAX

#_1EDD1D: LDA.w BeeSpeedFast,X
#_1EDD20: STA.w $0D50,Y

#_1EDD23: JSL GetRandomNumber
#_1EDD27: AND.b #$07
#_1EDD29: TAX

#_1EDD2A: LDA.w BeeSpeedFast,X
#_1EDD2D: STA.w $0D40,Y

#_1EDD30: LDA.b #$40
#_1EDD32: STA.w $0DF0,Y
#_1EDD35: STA.w $0D90,Y

#_1EDD38: PLX
#_1EDD39: PLB

#_1EDD3A: LDA.b #$00

#_1EDD3C: RTL

.no_space
#_1EDD3D: PLB

#_1EDD3E: LDA.b #$FF

#_1EDD40: RTL

;===================================================================================================

Bee_BounceBoundaries:
#_1EDD41: db  0,  5, 10, 15

;===================================================================================================

Bee_Main:
#_1EDD45: JSR Bee_HandleZ

#_1EDD48: JSL SpriteDraw_SingleSmall_long

#_1EDD4C: JSR Bee_HandleInteractions

#_1EDD4F: JSR Sprite_CheckIfActive_Bank1E
#_1EDD52: JSR Sprite_CheckIfRecoiling_Bank1E

#_1EDD55: LDA.w $0EB0,X
#_1EDD58: BEQ .regular_bee

#_1EDD5A: JSL Sprite_SpawnSparkleGarnish

.regular_bee
#_1EDD5E: JSR Bee_Bzzt
#_1EDD61: JSR Sprite_Move_XY_Bank1E

#_1EDD64: TXA
#_1EDD65: EOR.b $1A
#_1EDD67: LSR A
#_1EDD68: AND.b #$01
#_1EDD6A: STA.w $0DC0,X

#_1EDD6D: LDA.w $0F10,X
#_1EDD70: BNE .not_caught

#_1EDD72: JSR Sprite_CheckDamageToLink_Bank1E

#_1EDD75: JSL Sprite_CheckDamageFromLink_long
#_1EDD79: BEQ .not_caught

#_1EDD7B: LDA.b #$C8 ; MESSAGE 00C8
#_1EDD7D: LDY.b #$00
#_1EDD7F: JSL Sprite_ShowMessageUnconditional

#_1EDD83: INC.w $0D80,X

#_1EDD86: RTS

;---------------------------------------------------------------------------------------------------

.not_caught
#_1EDD87: LDA.b $1A
#_1EDD89: BNE .skip_timer

#_1EDD8B: LDA.w $0D90,X
#_1EDD8E: CMP.b #$10
#_1EDD90: BEQ .skip_timer

#_1EDD92: SEC
#_1EDD93: SBC.b #$08
#_1EDD95: STA.w $0D90,X

.skip_timer
#_1EDD98: LDA.w $0DF0,X
#_1EDD9B: BNE .exit

#_1EDD9D: JSL GetRandomNumber
#_1EDDA1: AND.b #$03
#_1EDDA3: TAY

#_1EDDA4: LDA.b $22
#_1EDDA6: CLC
#_1EDDA7: ADC.w Bee_BounceBoundaries,Y
#_1EDDAA: STA.b $04

#_1EDDAC: LDA.b $23
#_1EDDAE: ADC.b #$00
#_1EDDB0: STA.b $05

#_1EDDB2: JSL GetRandomNumber
#_1EDDB6: AND.b #$03
#_1EDDB8: TAY

#_1EDDB9: LDA.b $20
#_1EDDBB: CLC
#_1EDDBC: ADC.w Bee_BounceBoundaries,Y
#_1EDDBF: STA.b $06

#_1EDDC1: LDA.b $21
#_1EDDC3: ADC.b #$00
#_1EDDC5: STA.b $07

#_1EDDC7: LDA.b #$14
#_1EDDC9: JSL Sprite_ProjectSpeedTowardsLocation_long

#_1EDDCD: LDA.b $00
#_1EDDCF: STA.w $0D40,X

#_1EDDD2: LDA.b $01
#_1EDDD4: STA.w $0D50,X
#_1EDDD7: BPL .flip_horizontally

#_1EDDD9: LDA.w $0F50,X
#_1EDDDC: AND.b #$BF
#_1EDDDE: BRA .save_h_flip

.flip_horizontally
#_1EDDE0: LDA.w $0F50,X
#_1EDDE3: ORA.b #$40

.save_h_flip
#_1EDDE5: STA.w $0F50,X

#_1EDDE8: TXA
#_1EDDE9: CLC
#_1EDDEA: ADC.w $0D90,X
#_1EDDED: STA.w $0DF0,X

.exit
#_1EDDF0: RTS

;===================================================================================================

Bee_Captured:
#_1EDDF1: JSR Bee_HandleInteractions

#_1EDDF4: JSR Sprite_CheckIfActive_Bank1E

#_1EDDF7: LDA.w $1CE8
#_1EDDFA: BNE .freed

#_1EDDFC: JSL FindEmptyBottle
#_1EDE00: BMI .no_bottles

#_1EDE02: LDA.w $0EB0,X
#_1EDE05: STA.b $00

#_1EDE07: PHX

#_1EDE08: TYX

#_1EDE09: LDA.b #$07
#_1EDE0B: CLC
#_1EDE0C: ADC.b $00
#_1EDE0E: STA.l $7EF35C,X

#_1EDE12: JSL RefreshIcon_long

#_1EDE16: PLX

#_1EDE17: STZ.w $0DD0,X

#_1EDE1A: RTS

;---------------------------------------------------------------------------------------------------

.no_bottles
#_1EDE1B: LDA.b #$CA ; MESSAGE 00CA
#_1EDE1D: LDY.b #$00
#_1EDE1F: JSL Sprite_ShowMessageUnconditional

.freed
#_1EDE23: LDA.b #$40
#_1EDE25: STA.w $0F10,X

#_1EDE28: LDA.b #$01
#_1EDE2A: STA.w $0D80,X

#_1EDE2D: RTS

;===================================================================================================

FindEmptyBottle:
#_1EDE2E: PHX

#_1EDE2F: LDX.b #$00

.next_bottle
#_1EDE31: LDA.l $7EF35C,X
#_1EDE35: CMP.b #$02
#_1EDE37: BEQ .empty

#_1EDE39: INX
#_1EDE3A: CPX.b #$04
#_1EDE3C: BCC .next_bottle

#_1EDE3E: LDX.b #$FF

.empty
#_1EDE40: TXY
#_1EDE41: PLX
#_1EDE42: TYA

#_1EDE43: RTL

;===================================================================================================

Bee_HandleInteractions:
#_1EDE44: LDA.b $11
#_1EDE46: CMP.b #$02
#_1EDE48: BNE .exit

#_1EDE4A: REP #$20

#_1EDE4C: LDA.w $1CF0

#_1EDE4F: CMP.w #$00C8 ; MESSAGE 00C8
#_1EDE52: BEQ .not_caught

#_1EDE54: CMP.w #$00CA ; MESSAGE 00CA
#_1EDE57: BNE .exit

.not_caught
#_1EDE59: SEP #$30

#_1EDE5B: LDA.b #$28
#_1EDE5D: STA.w $0F10,X

.exit
#_1EDE60: SEP #$30

#_1EDE62: RTS

;===================================================================================================

Sprite_B2_PlayerBee:
#_1EDE63: LDA.w $0D80,X
#_1EDE66: JSL JumpTableLocal
#_1EDE6A: dw GoldBee_Dormant
#_1EDE6C: dw PlayerBee_Main
#_1EDE6E: dw Bee_Captured

;===================================================================================================

GoldBee_Dormant:
#_1EDE70: LDA.w $0E90,X
#_1EDE73: BNE .exit

#_1EDE75: STZ.w $0DD0,X

#_1EDE78: LDA.l $7EF35C
#_1EDE7C: ORA.l $7EF35D
#_1EDE80: ORA.l $7EF35E
#_1EDE84: ORA.l $7EF35F
#_1EDE88: AND.b #$08
#_1EDE8A: BNE .exit

#_1EDE8C: JSR GoldBee_SpawnSelf

.exit
#_1EDE8F: RTS

;===================================================================================================

GoldBee_SpawnSelf:
#_1EDE90: LDA.b #$79 ; SPRITE 79
#_1EDE92: JSL Sprite_SpawnDynamically
#_1EDE96: BMI .no_space

#_1EDE98: JSL Sprite_SetSpawnedCoordinates

#_1EDE9C: LDA.b #$01
#_1EDE9E: STA.w $0D80,Y

#_1EDEA1: LDA.b #$40
#_1EDEA3: STA.w $0DF0,Y
#_1EDEA6: STA.w $0D90,Y

#_1EDEA9: LDA.b #$60
#_1EDEAB: STA.w $0F10,Y

#_1EDEAE: LDA.b #$01
#_1EDEB0: STA.w $0EB0,Y

#_1EDEB3: PHX

#_1EDEB4: JSL GetRandomNumber
#_1EDEB8: AND.b #$07
#_1EDEBA: TAX

#_1EDEBB: LDA.w BeeSpeedSlow,X
#_1EDEBE: STA.w $0D50,Y

#_1EDEC1: JSL GetRandomNumber
#_1EDEC5: AND.b #$07
#_1EDEC7: TAX

#_1EDEC8: LDA.w BeeSpeedSlow,X
#_1EDECB: STA.w $0D40,Y

#_1EDECE: PLX

.no_space
#_1EDECF: RTS

;===================================================================================================

PlayerBee_Useless:
#_1EDED0: db $0A, $14

;===================================================================================================

PlayerBee_Main:
#_1EDED2: LDA.b #$01
#_1EDED4: STA.w $0BA0,X

#_1EDED7: JSR Bee_HandleZ

#_1EDEDA: JSL SpriteDraw_SingleSmall_long

#_1EDEDE: JSR Bee_HandleInteractions
#_1EDEE1: JSR Sprite_CheckIfActive_Bank1E

#_1EDEE4: JSR Bee_Bzzt

#_1EDEE7: JSR Sprite_Move_XY_Bank1E

#_1EDEEA: TXA
#_1EDEEB: EOR.b $1A
#_1EDEED: LSR A
#_1EDEEE: AND.b #$01
#_1EDEF0: STA.w $0DC0,X

#_1EDEF3: LDA.w $0EB0,X
#_1EDEF6: BEQ .regular_bee

#_1EDEF8: JSL Sprite_SpawnSparkleGarnish

.regular_bee
#_1EDEFC: LDA.w $0DA0,X

#_1EDEFF: LDY.w $0EB0,X

#_1EDF02: CMP.w PlayerBee_Useless,Y
#_1EDF05: BCC .what

#_1EDF07: LDA.b #$40
#_1EDF09: STA.w $0CAA,X

#_1EDF0C: RTS

.what
#_1EDF0D: LDA.w $0F10,X
#_1EDF10: BNE .exit

#_1EDF12: JSL Sprite_CheckDamageFromLink_long
#_1EDF16: BEQ .not_caught

#_1EDF18: LDA.b #$C8 ; MESSAGE 00C8
#_1EDF1A: LDY.b #$00
#_1EDF1C: JSL Sprite_ShowMessageUnconditional

#_1EDF20: INC.w $0D80,X

#_1EDF23: RTS

;---------------------------------------------------------------------------------------------------

.not_caught
#_1EDF24: TXA
#_1EDF25: EOR.b $1A
#_1EDF27: AND.b #$03
#_1EDF29: BNE .exit

#_1EDF2B: JSR PlayerBee_FindTarget
#_1EDF2E: BCS .target_locked

#_1EDF30: TXA
#_1EDF31: EOR.b $1A
#_1EDF33: AND.b #$03
#_1EDF35: BNE .exit

#_1EDF37: JSL GetRandomNumber
#_1EDF3B: AND.b #$03
#_1EDF3D: TAY

#_1EDF3E: LDA.b $22
#_1EDF40: CLC
#_1EDF41: ADC.w Bee_BounceBoundaries,Y
#_1EDF44: STA.b $04

#_1EDF46: LDA.b $23
#_1EDF48: ADC.b #$00
#_1EDF4A: STA.b $05

#_1EDF4C: JSL GetRandomNumber
#_1EDF50: AND.b #$03
#_1EDF52: TAY

#_1EDF53: LDA.b $20
#_1EDF55: CLC
#_1EDF56: ADC.w Bee_BounceBoundaries,Y
#_1EDF59: STA.b $06

#_1EDF5B: LDA.b $21
#_1EDF5D: ADC.b #$00
#_1EDF5F: STA.b $07

;---------------------------------------------------------------------------------------------------

.target_locked
#_1EDF61: TXA
#_1EDF62: EOR.b $1A
#_1EDF64: AND.b #$07
#_1EDF66: BNE .exit

#_1EDF68: LDA.b #$20
#_1EDF6A: JSL Sprite_ProjectSpeedTowardsLocation_long

#_1EDF6E: LDA.b $00
#_1EDF70: STA.w $0D40,X

#_1EDF73: LDA.b $01
#_1EDF75: STA.w $0D50,X
#_1EDF78: BPL .enable_h_flip

#_1EDF7A: LDA.w $0F50,X
#_1EDF7D: AND.b #$BF
#_1EDF7F: BRA .set_h_flip

.enable_h_flip
#_1EDF81: LDA.w $0F50,X
#_1EDF84: ORA.b #$40

.set_h_flip
#_1EDF86: STA.w $0F50,X

.exit
#_1EDF89: RTS

;===================================================================================================

Bee_HandleZ:
#_1EDF8A: LDA.b #$10
#_1EDF8C: STA.w $0F70,X

#_1EDF8F: LDA.w $0EB0,X
#_1EDF92: BEQ .exit

#_1EDF94: LDA.w $0F50,X
#_1EDF97: AND.b #$F1
#_1EDF99: STA.b $00

#_1EDF9B: LDA.b $1A
#_1EDF9D: LSR A
#_1EDF9E: LSR A
#_1EDF9F: LSR A
#_1EDFA0: LSR A

#_1EDFA1: AND.b #$03
#_1EDFA3: INC A
#_1EDFA4: ASL A

#_1EDFA5: ORA.b $00
#_1EDFA7: STA.w $0F50,X

.exit
#_1EDFAA: RTS

;===================================================================================================

PlayerBee_FindTarget:
#_1EDFAB: LDA.b #$0F
#_1EDFAD: STA.b $00

#_1EDFAF: TXA
#_1EDFB0: ASL A
#_1EDFB1: ASL A
#_1EDFB2: AND.b #$0F
#_1EDFB4: TAY

;---------------------------------------------------------------------------------------------------

.next_sprite
#_1EDFB5: CPY.w $0FA0
#_1EDFB8: BEQ .unsuitable_target

#_1EDFBA: LDA.w $0DD0,Y
#_1EDFBD: CMP.b #$09
#_1EDFBF: BCC .unsuitable_target

#_1EDFC1: LDA.w $0F00,Y
#_1EDFC4: BNE .unsuitable_target

#_1EDFC6: LDA.w $0E40,Y
#_1EDFC9: BMI .potential_target

#_1EDFCB: LDA.w $0F20,Y
#_1EDFCE: CMP.w $0F20,X
#_1EDFD1: BNE .unsuitable_target

#_1EDFD3: LDA.w $0F60,Y
#_1EDFD6: AND.b #$40
#_1EDFD8: BNE .unsuitable_target

#_1EDFDA: LDA.w $0BA0,Y
#_1EDFDD: BEQ .valid_target
#_1EDFDF: BRA .unsuitable_target

.potential_target
#_1EDFE1: LDA.w $0EB0,X
#_1EDFE4: BEQ .unsuitable_target

#_1EDFE6: LDA.w $0CD2,Y
#_1EDFE9: AND.b #$40
#_1EDFEB: BNE .valid_target

;---------------------------------------------------------------------------------------------------

.unsuitable_target
#_1EDFED: DEY

#_1EDFEE: TYA
#_1EDFEF: AND.b #$0F
#_1EDFF1: TAY

#_1EDFF2: DEC.b $00
#_1EDFF4: BPL .next_sprite

#_1EDFF6: CLC

#_1EDFF7: RTS

;---------------------------------------------------------------------------------------------------

.valid_target
#_1EDFF8: JSL PlayerBee_HoneInOnTarget

#_1EDFFC: PHX

#_1EDFFD: JSL GetRandomNumber
#_1EE001: AND.b #$03
#_1EE003: TAX

#_1EE004: LDA.w $0D10,Y
#_1EE007: CLC
#_1EE008: ADC.w Bee_BounceBoundaries,X
#_1EE00B: STA.b $04

#_1EE00D: LDA.w $0D30,Y
#_1EE010: ADC.b #$00
#_1EE012: STA.b $05

#_1EE014: JSL GetRandomNumber
#_1EE018: AND.b #$03
#_1EE01A: TAX

#_1EE01B: LDA.w $0D00,Y
#_1EE01E: CLC
#_1EE01F: ADC.w Bee_BounceBoundaries,X
#_1EE022: STA.b $06

#_1EE024: LDA.w $0D20,Y
#_1EE027: ADC.b #$00
#_1EE029: STA.b $07

#_1EE02B: PLX

#_1EE02C: SEC

#_1EE02D: RTS

;===================================================================================================

Bee_Bzzt:
#_1EE02E: TXA
#_1EE02F: EOR.b $1A
#_1EE031: AND.b #$1F
#_1EE033: BNE .exit

#_1EE035: LDA.b #$2C ; SFX3.2C
#_1EE037: JSL SpriteSFX_QueueSFX3WithPan

.exit
#_1EE03B: RTS

;===================================================================================================

PlaqueMessages:
.pedestal_low
#_1EE03C: db $B6 ; MESSAGE 00B6
#_1EE03D: db $B7 ; MESSAGE 00B7

.pedestal_high
#_1EE03E: db $00
#_1EE03F: db $00

;---------------------------------------------------------------------------------------------------

.desert_low
#_1EE040: db $BC ; MESSAGE 00BC
#_1EE041: db $BD ; MESSAGE 00BD

.desert_high
#_1EE042: db $00
#_1EE043: db $00

;---------------------------------------------------------------------------------------------------

Sprite_B3_PedestalPlaque:
#_1EE044: JSL Sprite_PrepOAMCoord_long
#_1EE048: JSR Sprite_CheckIfActive_Bank1E

#_1EE04B: LDA.w $02E4
#_1EE04E: BNE .cutscene

#_1EE050: JSL CheckIfLinkIsBusy
#_1EE054: BCC .continue

.cutscene
#_1EE056: RTS

.continue
#_1EE057: LDA.w $037A
#_1EE05A: AND.b #$DF
#_1EE05C: STA.w $037A

#_1EE05F: LDA.b $8A
#_1EE061: CMP.b #$30 ; OW 30
#_1EE063: BEQ DesertTablet

;===================================================================================================

MasterSwordPedestal:
#_1EE065: LDA.b $2F
#_1EE067: BNE .exit

#_1EE069: JSL Sprite_CheckDamageToLink_same_layer_long
#_1EE06D: BCC .exit

#_1EE06F: LDA.w $0202
#_1EE072: CMP.b #$0F
#_1EE074: BNE .not_holding_book

#_1EE076: LDY.b #$01
#_1EE078: BIT.b $F4
#_1EE07A: BVS .not_pressing_y

.not_holding_book
#_1EE07C: LDA.b $F6
#_1EE07E: BPL .exit

#_1EE080: LDY.b #$00

.not_pressing_y
#_1EE082: CPY.b #$01
#_1EE084: BNE .no_book_pose

#_1EE086: STZ.w $0300

#_1EE089: LDA.b #$20
#_1EE08B: STA.w $037A

#_1EE08E: STZ.w $012E

.no_book_pose
#_1EE091: LDA.w PlaqueMessages_pedestal_low,Y
#_1EE094: XBA

#_1EE095: LDA.w PlaqueMessages_pedestal_high,Y
#_1EE098: TAY

#_1EE099: XBA

#_1EE09A: JSL Sprite_ShowMessageUnconditional

.exit
#_1EE09E: RTS

;===================================================================================================

DesertTablet:
#_1EE09F: LDA.b $2F
#_1EE0A1: BNE .exit

#_1EE0A3: JSL Sprite_CheckDamageToLink_same_layer_long
#_1EE0A7: BCC .exit

#_1EE0A9: LDA.w $0202
#_1EE0AC: CMP.b #$0F
#_1EE0AE: BNE .not_holding_book

#_1EE0B0: LDY.b #$01
#_1EE0B2: BIT.b $F4
#_1EE0B4: BVS .not_pressing_y

.not_holding_book
#_1EE0B6: LDA.b $F6
#_1EE0B8: BPL .exit

#_1EE0BA: LDY.b #$00

.not_pressing_y
#_1EE0BC: CPY.b #$01
#_1EE0BE: BNE .no_book_pose

#_1EE0C0: STZ.w $0300

#_1EE0C3: LDA.b #$20
#_1EE0C5: STA.w $037A

#_1EE0C8: STZ.w $012E

#_1EE0CB: JSL InitiateDesertCutscene

.no_book_pose
#_1EE0CF: LDA.w PlaqueMessages_desert_low,Y
#_1EE0D2: XBA

#_1EE0D3: LDA.w PlaqueMessages_desert_high,Y
#_1EE0D6: TAY

#_1EE0D7: XBA

#_1EE0D8: JSL Sprite_ShowMessageUnconditional

.exit
#_1EE0DC: RTS

;===================================================================================================

Sprite_B4_PurpleChest:
#_1EE0DD: JSL SpriteDraw_SingleLarge_long
#_1EE0E1: JSR Sprite_CheckIfActive_Bank1E

#_1EE0E4: LDA.w $0D80,X
#_1EE0E7: BNE .follow_link

#_1EE0E9: LDA.b #$16 ; MESSAGE 0116
#_1EE0EB: LDY.b #$01
#_1EE0ED: JSL Sprite_ShowMessageOnContact
#_1EE0F1: BCC .exit

#_1EE0F3: LDA.l $7EF3CC
#_1EE0F7: BNE .exit

#_1EE0F9: INC.w $0D80,X

.exit
#_1EE0FC: RTS

;---------------------------------------------------------------------------------------------------

.follow_link
#_1EE0FD: STZ.w $0DD0,X

#_1EE100: LDA.b #$0C ; FOLLOWER 0C
#_1EE102: STA.l $7EF3CC

#_1EE106: PHX
#_1EE107: JSL LoadFollowerGraphics
#_1EE10B: PLX

#_1EE10C: JSL Sprite_BecomeFollower

#_1EE110: RTS

;===================================================================================================

Sprite_B5_BombShop:
#_1EE111: LDA.w $0E80,X
#_1EE114: JSL JumpTableLocal
#_1EE118: dw BombShop_Clerk
#_1EE11A: dw BombShop_Bomb
#_1EE11C: dw BombShop_SuperBomb
#_1EE11E: dw BombShop_Huff

;===================================================================================================

pool BombShop_Clerk

.message_low
#_1EE120: db $17 ; MESSAGE 0117
#_1EE121: db $18 ; MESSAGE 0118

.message_high
#_1EE122: db $01
#_1EE123: db $01

.anim_step
#_1EE124: db $00, $01, $00, $01, $00, $01, $00, $01

.timer
#_1EE12C: db 255,  32, 255,  24,  15,  24, 255,  15

pool off

;---------------------------------------------------------------------------------------------------

BombShop_Clerk:
#_1EE134: JSR SpriteDraw_BombShop
#_1EE137: JSR Sprite_CheckIfActive_Bank1E

#_1EE13A: LDA.w $0DF0,X
#_1EE13D: BNE .continue

#_1EE13F: LDA.w $0E90,X
#_1EE142: TAY

#_1EE143: INC A
#_1EE144: AND.b #$07
#_1EE146: STA.w $0E90,X

#_1EE149: LDA.w .timer,Y
#_1EE14C: STA.w $0DF0,X

#_1EE14F: LDA.w .anim_step,Y
#_1EE152: STA.w $0DC0,X
#_1EE155: BNE .inhale

#_1EE157: LDA.b #$11 ; SFX3.11
#_1EE159: JSL SpriteSFX_QueueSFX3WithPan

#_1EE15D: JSR BombShop_ClerkExhalation

#_1EE160: BRA .continue

.inhale
#_1EE162: LDA.b #$12 ; SFX3.12
#_1EE164: JSL SpriteSFX_QueueSFX3WithPan

;---------------------------------------------------------------------------------------------------

.continue
#_1EE168: LDY.b #$00

#_1EE16A: LDA.l $7EF37A
#_1EE16E: AND.b #$05
#_1EE170: CMP.b #$05
#_1EE172: BNE .no_super_bomb_message

#_1EE174: LDA.l $7EF3C9
#_1EE178: AND.b #$20
#_1EE17A: BEQ .no_super_bomb_message

#_1EE17C: LDY.b #$01

.no_super_bomb_message
#_1EE17E: LDA.w .message_low,Y
#_1EE181: XBA

#_1EE182: LDA.w .message_high,Y
#_1EE185: TAY

#_1EE186: XBA

#_1EE187: JSL Sprite_ShowSolicitedMessage
#_1EE18B: JSL Sprite_BehaveAsBarrier

#_1EE18F: RTS

;===================================================================================================

BombShop_Bomb:
#_1EE190: JSR SpriteDraw_BombShop
#_1EE193: JSR Sprite_CheckIfActive_Bank1E
#_1EE196: JSL Sprite_BehaveAsBarrier

#_1EE19A: JSR ShopItem_CheckForAPress
#_1EE19D: BCC .exit

#_1EE19F: LDA.l $7EF370
#_1EE1A3: PHX

#_1EE1A4: TAX
#_1EE1A5: LDA.l CapacityUpgrades_bombs_hex,X

#_1EE1A9: PLX

#_1EE1AA: CMP.l $7EF343
#_1EE1AE: BEQ .no_space

#_1EE1B0: LDA.b #$64
#_1EE1B2: LDY.b #$00
#_1EE1B4: JSR ShopItem_HandleCost
#_1EE1B7: BCC .too_poor

#_1EE1B9: LDA.b #$1B
#_1EE1BB: STA.l $7EF375

#_1EE1BF: STZ.w $0DD0,X

#_1EE1C2: LDA.b #$19 ; MESSAGE 0119
#_1EE1C4: LDY.b #$01
#_1EE1C6: JSL Sprite_ShowMessageUnconditional

#_1EE1CA: LDY.b #$28 ; ITEMGET 28
#_1EE1CC: JSR ShopItem_HandleReceipt

.exit
#_1EE1CF: RTS

;---------------------------------------------------------------------------------------------------

.no_space
#_1EE1D0: LDA.b #$6E ; MESSAGE 016E
#_1EE1D2: LDY.b #$01
#_1EE1D4: JSL Sprite_ShowMessageUnconditional

#_1EE1D8: JSR ShopItem_PlayBeep

#_1EE1DB: RTS

.too_poor
#_1EE1DC: JMP.w ShopItem_GiveFailureMessage

;===================================================================================================

BombShop_SuperBomb:
#_1EE1DF: JSR SpriteDraw_BombShop
#_1EE1E2: JSR Sprite_CheckIfActive_Bank1E
#_1EE1E5: JSL Sprite_BehaveAsBarrier
#_1EE1E9: JSR ShopItem_CheckForAPress
#_1EE1EC: BCC .exit

#_1EE1EE: LDA.b #$64
#_1EE1F0: LDY.b #$00
#_1EE1F2: JSR ShopItem_HandleCost
#_1EE1F5: BCC .too_poor

#_1EE1F7: LDA.b #$0D ; FOLLOWER 0D
#_1EE1F9: STA.l $7EF3CC

#_1EE1FD: PHX
#_1EE1FE: JSL LoadFollowerGraphics
#_1EE202: PLX

#_1EE203: JSL Sprite_BecomeFollower

#_1EE207: STZ.w $0DD0,X

#_1EE20A: LDA.b #$1A ; MESSAGE 011A
#_1EE20C: LDY.b #$01
#_1EE20E: JSL Sprite_ShowMessageUnconditional

.exit
#_1EE212: RTS

;---------------------------------------------------------------------------------------------------

.too_poor
#_1EE213: JMP.w ShopItem_GiveFailureMessage

;===================================================================================================

pool BombShop_Huff

.prop
#_1EE216: db $04, $44, $C4, $84

pool off

;---------------------------------------------------------------------------------------------------

BombShop_Huff:
#_1EE21A: LDA.b #$04
#_1EE21C: JSL SpriteDraw_AllocateOAMFromRegionC

#_1EE220: JSL SpriteDraw_SingleSmall_long

#_1EE224: JSR Sprite_CheckIfActive_Bank1E

#_1EE227: LDA.w $0F50,X
#_1EE22A: AND.b #$30
#_1EE22C: STA.w $0F50,X

#_1EE22F: LDA.b $1A
#_1EE231: LSR A
#_1EE232: LSR A
#_1EE233: AND.b #$03
#_1EE235: TAY

#_1EE236: LDA.w $0F50,X
#_1EE239: ORA.w .prop,Y
#_1EE23C: STA.w $0F50,X

#_1EE23F: INC.w $0F80,X

#_1EE242: JSR Sprite_Move_Z_Bank1E

#_1EE245: LDA.w $0DF0,X
#_1EE248: BNE .stick_around_for_now

#_1EE24A: STZ.w $0DD0,X

.stick_around_for_now
#_1EE24D: LSR A
#_1EE24E: LSR A
#_1EE24F: LSR A
#_1EE250: AND.b #$03
#_1EE252: STA.w $0DC0,X

#_1EE255: RTS

;===================================================================================================

BombShop_ClerkExhalation:
#_1EE256: LDA.b #$B5 ; SPRITE B5
#_1EE258: JSL Sprite_SpawnDynamically

#_1EE25C: LDA.b #$03
#_1EE25E: STA.w $0E80,Y
#_1EE261: STA.w $0BA0,Y

#_1EE264: LDA.b $00
#_1EE266: CLC
#_1EE267: ADC.b #$04
#_1EE269: STA.w $0D10,Y

#_1EE26C: LDA.b $01
#_1EE26E: STA.w $0D30,Y

#_1EE271: LDA.b $02
#_1EE273: CLC
#_1EE274: ADC.b #$10
#_1EE276: STA.w $0D00,Y

#_1EE279: LDA.b $03
#_1EE27B: STA.w $0D20,Y

#_1EE27E: LDA.b #$04
#_1EE280: STA.w $0F70,Y

#_1EE283: LDA.b #$F4
#_1EE285: STA.w $0F80,Y

#_1EE288: LDA.b #$17
#_1EE28A: STA.w $0DF0,Y

#_1EE28D: LDA.w $0E60,Y
#_1EE290: AND.b #$EE
#_1EE292: STA.w $0E60,Y

#_1EE295: RTS

;===================================================================================================

pool SpriteDraw_BombShop

.oam_groups
#_1EE296: dw   0,   0 : db $48, $0A, $00, $02
#_1EE29E: dw   0,   0 : db $4C, $0A, $00, $02

#_1EE2A6: dw   0,   0 : db $C2, $04, $00, $02
#_1EE2AE: dw   0,   0 : db $C2, $04, $00, $02

#_1EE2B6: dw   0,   0 : db $4E, $08, $00, $02
#_1EE2BE: dw   0,   0 : db $4E, $08, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_BombShop:
#_1EE2C6: LDA.b #$01
#_1EE2C8: STA.b $06
#_1EE2CA: STZ.b $07

#_1EE2CC: LDA.w $0E80,X
#_1EE2CF: ASL A

#_1EE2D0: ADC.w $0DC0,X
#_1EE2D3: ASL A
#_1EE2D4: ASL A
#_1EE2D5: ASL A

#_1EE2D6: ADC.b #.oam_groups>>0
#_1EE2D8: STA.b $08

#_1EE2DA: LDA.b #.oam_groups>>8
#_1EE2DC: ADC.b #$00
#_1EE2DE: STA.b $09

#_1EE2E0: JSL SpriteDraw_Tabulated_player_deferred
#_1EE2E4: JSL SpriteDraw_Shadow_long

#_1EE2E8: RTS

;===================================================================================================

pool Kiki_WalkOnRoof

.speed_x ; bleeds into next
#_1EE2E9: db   0,   0

.speed_y
#_1EE2EB: db  -9,   9,   0,   0

pool off

;===================================================================================================

Sprite_B6_Kiki:
#_1EE2EF: LDA.w $0E80,X
#_1EE2F2: JSL JumpTableLocal
#_1EE2F6: dw Kiki_Dormant
#_1EE2F8: dw Kiki_OfferEntranceService
#_1EE2FA: dw Kiki_OfferInitialService
#_1EE2FC: dw Kiki_Flee

;===================================================================================================

Kiki_Flee:
#_1EE2FE: JSR SpriteDraw_Kiki
#_1EE301: JSR Sprite_CheckIfActive_Bank1E

#_1EE304: LDA.w $0F70,X
#_1EE307: BNE .dont_flag

#_1EE309: REP #$20

#_1EE30B: LDA.w $0FD8
#_1EE30E: SEC
#_1EE30F: SBC.w #$0C98

#_1EE312: CMP.w #$00D0
#_1EE315: BCS .dont_flag

#_1EE317: LDA.w $0FDA
#_1EE31A: SEC
#_1EE31B: SBC.w #$06A5

#_1EE31E: CMP.w #$00D0
#_1EE321: BCS .dont_flag

#_1EE323: LDA.w #$FFFF
#_1EE326: STA.b $01

.dont_flag
#_1EE328: SEP #$30

#_1EE32A: LDA.b $01
#_1EE32C: ORA.b $03
#_1EE32E: BEQ .stay

#_1EE330: STZ.w $0DD0,X

.stay
#_1EE333: DEC.w $0F80,X
#_1EE336: DEC.w $0F80,X

#_1EE339: JSR Sprite_Move_XYZ_Bank1E

#_1EE33C: LDA.w $0F70,X
#_1EE33F: BPL .no_bounce

#_1EE341: STZ.w $0F70,X

#_1EE344: JSL GetRandomNumber
#_1EE348: AND.b #$0F
#_1EE34A: ORA.b #$10
#_1EE34C: STA.w $0F80,X

.no_bounce
#_1EE34F: LDA.b #$F5
#_1EE351: STA.b $04

#_1EE353: LDA.b #$0C
#_1EE355: STA.b $05

#_1EE357: LDA.b #$FE
#_1EE359: STA.b $06

#_1EE35B: LDA.b #$06
#_1EE35D: STA.b $07

#_1EE35F: LDA.b #$10
#_1EE361: JSL Sprite_ProjectSpeedTowardsLocation_long

#_1EE365: LDA.b $00
#_1EE367: ASL A
#_1EE368: STA.w $0D40,X

#_1EE36B: LDA.b $01
#_1EE36D: ASL A
#_1EE36E: STA.w $0D50,X

#_1EE371: LDA.w $02F2
#_1EE374: AND.b #$FC
#_1EE376: STA.w $02F2

#_1EE379: LDA.b $00
#_1EE37B: BPL .positive_x

#_1EE37D: EOR.b #$FF
#_1EE37F: INC A
#_1EE380: STA.b $00

.positive_x
#_1EE382: LDA.b $01
#_1EE384: BPL .positive_y

#_1EE386: EOR.b #$FF
#_1EE388: INC A

.positive_y
#_1EE389: CMP.b $00
#_1EE38B: BCC .at_max_x

#_1EE38D: LDA.w $0D50,X
#_1EE390: ROL A
#_1EE391: ROL A
#_1EE392: AND.b #$01
#_1EE394: EOR.b #$03
#_1EE396: BRA .continue

.at_max_x
#_1EE398: LDA.w $0D40,X
#_1EE39B: ROL A
#_1EE39C: ROL A
#_1EE39D: AND.b #$01
#_1EE39F: EOR.b #$01

.continue
#_1EE3A1: STA.w $0DE0,X

#_1EE3A4: LDA.b $1A
#_1EE3A6: LSR A
#_1EE3A7: LSR A
#_1EE3A8: LSR A
#_1EE3A9: AND.b #$01
#_1EE3AB: STA.w $0DC0,X

#_1EE3AE: RTS

;===================================================================================================

Kiki_OfferInitialService:
#_1EE3AF: LDA.w $0D80,X
#_1EE3B2: DEC A
#_1EE3B3: DEC A
#_1EE3B4: BMI .invisible

#_1EE3B6: JSR SpriteDraw_Kiki

.invisible
#_1EE3B9: JSR Sprite_CheckIfActive_Bank1E
#_1EE3BC: JSR Sprite_Move_XYZ_Bank1E

#_1EE3BF: DEC.w $0F80,X

#_1EE3C2: LDA.w $0F70,X
#_1EE3C5: BPL .airborne

#_1EE3C7: STZ.w $0F80,X
#_1EE3CA: STZ.w $0F70,X

.airborne
#_1EE3CD: LDA.b $1A
#_1EE3CF: LSR A
#_1EE3D0: LSR A
#_1EE3D1: LSR A
#_1EE3D2: AND.b #$01
#_1EE3D4: STA.w $0DC0,X

#_1EE3D7: LDA.w $0D80,X
#_1EE3DA: JSL JumpTableLocal
#_1EE3DE: dw Kiki_OfferToFollow
#_1EE3E0: dw Kiki_OfferToFollowTransaction
#_1EE3E2: dw Kiki_MoveTowardsLink
#_1EE3E4: dw Kiki_WaitABit
#_1EE3E6: dw Kiki_EndIntroductionCutscene

;===================================================================================================

Kiki_OfferToFollow:
#_1EE3E8: LDA.b #$1E ; MESSAGE 011E
#_1EE3EA: LDY.b #$01
#_1EE3EC: JSL Sprite_ShowMessageUnconditional

#_1EE3F0: INC.w $0D80,X

#_1EE3F3: RTS

;===================================================================================================

Kiki_OfferToFollowTransaction:
#_1EE3F4: LDA.w $1CE8
#_1EE3F7: BNE .offer_rejected

#_1EE3F9: LDA.b #$0A
#_1EE3FB: LDY.b #$00
#_1EE3FD: JSR ShopItem_HandleCost
#_1EE400: BCC .offer_rejected

#_1EE402: LDA.b #$1F ; MESSAGE 011F
#_1EE404: LDY.b #$01
#_1EE406: JSL Sprite_ShowMessageUnconditional

#_1EE40A: LDA.w $02F2
#_1EE40D: ORA.b #$03
#_1EE40F: STA.w $02F2

#_1EE412: STZ.w $0DD0,X

#_1EE415: RTS

;---------------------------------------------------------------------------------------------------

.offer_rejected
#_1EE416: LDA.b #$20 ; MESSAGE 0120
#_1EE418: LDY.b #$01
#_1EE41A: JSL Sprite_ShowMessageUnconditional

#_1EE41E: LDA.w $02F2
#_1EE421: AND.b #$FC
#_1EE423: STA.w $02F2

#_1EE426: LDA.b #$00
#_1EE428: STA.l $7EF3CC

#_1EE42C: INC.w $0D80,X
#_1EE42F: INC.w $02E4

#_1EE432: RTS

;===================================================================================================

Kiki_MoveTowardsLink:
#_1EE433: INC.w $0D80,X

#_1EE436: LDA.b #$F5
#_1EE438: STA.b $04

#_1EE43A: LDA.b #$0C
#_1EE43C: STA.b $05

#_1EE43E: LDA.b #$FE
#_1EE440: STA.b $06

#_1EE442: LDA.b #$06
#_1EE444: STA.b $07

#_1EE446: LDA.b #$09
#_1EE448: JSL Sprite_ProjectSpeedTowardsLocation_long

#_1EE44C: LDA.b $00
#_1EE44E: STA.w $0D40,X

#_1EE451: LDA.b $01
#_1EE453: STA.w $0D50,X

#_1EE456: ASL A
#_1EE457: ROL A
#_1EE458: AND.b #$01
#_1EE45A: EOR.b #$03
#_1EE45C: STA.w $0DE0,X

#_1EE45F: LDA.b #$20
#_1EE461: STA.w $0DF0,X

#_1EE464: RTS

;===================================================================================================

Kiki_WaitABit:
#_1EE465: LDA.w $0DF0,X
#_1EE468: BNE .exit

#_1EE46A: INC.w $0D80,X

#_1EE46D: LDA.b #$10
#_1EE46F: STA.w $0F80,X
#_1EE472: STA.w $0DF0,X

.exit
#_1EE475: RTS

;===================================================================================================

Kiki_EndIntroductionCutscene:
#_1EE476: LDA.w $0DF0,X
#_1EE479: BNE .exit

#_1EE47B: LDA.w $0F70,X
#_1EE47E: BNE .exit

#_1EE480: STZ.w $0DD0,X
#_1EE483: STZ.w $02E4

.exit
#_1EE486: RTS

;===================================================================================================

Kiki_Dormant:
#_1EE487: JSL Sprite_PrepOAMCoord_long
#_1EE48B: JSR Sprite_CheckIfActive_Bank1E

#_1EE48E: LDA.w $02E0
#_1EE491: BNE .exit

#_1EE493: LDA.w $037B
#_1EE496: ORA.w $031F
#_1EE499: BNE .exit

#_1EE49B: LDA.l $7EF3CC
#_1EE49F: CMP.b #$0A ; FOLLOWER 0A
#_1EE4A1: BEQ .exit

#_1EE4A3: PHX

#_1EE4A4: LDX.b $8A
#_1EE4A6: LDA.l $7EF280,X

#_1EE4AA: PLX

#_1EE4AB: AND.b #$20
#_1EE4AD: BNE .exit

#_1EE4AF: JSL Sprite_CheckDamageToLink_same_layer_long
#_1EE4B3: BCC .exit

#_1EE4B5: LDA.b #$0A ; FOLLOWER 0A
#_1EE4B7: STA.l $7EF3CC

#_1EE4BB: PHX

#_1EE4BC: STZ.w $02F9

#_1EE4BF: JSL LoadFollowerGraphics
#_1EE4C3: JSL Follower_Initialize

#_1EE4C7: PLX

.exit
#_1EE4C8: RTS

;===================================================================================================

Kiki_OfferEntranceService:
#_1EE4C9: JSR SpriteDraw_Kiki
#_1EE4CC: JSR Sprite_CheckIfActive_Bank1E
#_1EE4CF: JSR Sprite_Move_XYZ_Bank1E

#_1EE4D2: DEC.w $0F80,X

#_1EE4D5: LDA.w $0F70,X
#_1EE4D8: BPL .airborne

#_1EE4DA: STZ.w $0F80,X
#_1EE4DD: STZ.w $0F70,X

.airborne
#_1EE4E0: LDA.w $0D80,X
#_1EE4E3: JSL JumpTableLocal
#_1EE4E7: dw Kiki_OfferToOpenPOD
#_1EE4E9: dw Kiki_VerifyPurchase
#_1EE4EB: dw Kiki_HopToSpot
#_1EE4ED: dw Kiki_DartHead

#_1EE4EF: dw Kiki_HopToSpot
#_1EE4F1: dw Kiki_DartHead
#_1EE4F3: dw Kiki_HopToSpot
#_1EE4F5: dw Kiki_WalkOnRoof

#_1EE4F7: dw Kiki_ReadyButtonPress
#_1EE4F9: dw Kiki_SlamButton
#_1EE4FB: dw Kiki_IdleOnRoof

;===================================================================================================

Kiki_OfferToOpenPOD:
#_1EE4FD: LDA.b #$1B ; MESSAGE 011B
#_1EE4FF: LDY.b #$01
#_1EE501: JSL Sprite_ShowMessageUnconditional

#_1EE505: INC.w $0D80,X

#_1EE508: RTS

;===================================================================================================

Kiki_VerifyPurchase:
#_1EE509: LDA.w $1CE8
#_1EE50C: BEQ .offer_rejected

.too_poor
#_1EE50E: LDA.b #$1C ; MESSAGE 011C
#_1EE510: LDY.b #$01
#_1EE512: JSL Sprite_ShowMessageUnconditional

#_1EE516: LDA.b #$03
#_1EE518: STA.w $0E80,X

#_1EE51B: RTS

.offer_rejected
#_1EE51C: LDA.b #$64
#_1EE51E: LDY.b #$00
#_1EE520: JSR ShopItem_HandleCost
#_1EE523: BCC .too_poor

#_1EE525: LDA.b #$1D ; MESSAGE 011D
#_1EE527: LDY.b #$01
#_1EE529: JSL Sprite_ShowMessageUnconditional

#_1EE52D: INC.w $02E4

#_1EE530: INC.w $0D80,X

#_1EE533: STZ.w $0DE0,X

#_1EE536: RTS

;===================================================================================================

pool Kiki_DartHead

.next_jump_speed
#_1EE537: db  32,  28

pool off

;---------------------------------------------------------------------------------------------------

Kiki_DartHead:
#_1EE539: LDA.w $0E00,X
#_1EE53C: BNE .delay

#_1EE53E: LDA.w $0D80,X
#_1EE541: INC.w $0D80,X

#_1EE544: LSR A
#_1EE545: AND.b #$01
#_1EE547: TAY

#_1EE548: LDA.w .next_jump_speed,Y
#_1EE54B: STA.w $0F80,X

#_1EE54E: LDA.b #$20 ; SFX2.20
#_1EE550: JSL SpriteSFX_QueueSFX2WithPan

#_1EE554: LDA.w $0D80,X
#_1EE557: LSR A
#_1EE558: AND.b #$01
#_1EE55A: ORA.b #$04
#_1EE55C: STA.w $0DE0,X

#_1EE55F: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_1EE560: LDA.w $0D80,X
#_1EE563: LSR A
#_1EE564: AND.b #$01
#_1EE566: ORA.b #$06
#_1EE568: STA.w $0DE0,X

#_1EE56B: LDA.b $1A
#_1EE56D: LSR A
#_1EE56E: LSR A
#_1EE56F: LSR A
#_1EE570: AND.b #$01
#_1EE572: STA.w $0DC0,X

#_1EE575: RTS

;===================================================================================================

pool Kiki_HopToSpot

.target_y
#_1EE576: dw $0661
#_1EE578: dw $064C
#_1EE57A: dw $0624

.target_x
#_1EE57C: dw $0F4F
#_1EE57E: dw $0F70
#_1EE580: dw $0F5D

pool off

;---------------------------------------------------------------------------------------------------

Kiki_HopToSpot:
#_1EE582: LDA.b $1A
#_1EE584: LSR A
#_1EE585: LSR A
#_1EE586: LSR A
#_1EE587: AND.b #$01
#_1EE589: STA.w $0DC0,X

#_1EE58C: LDA.w $0D80,X
#_1EE58F: SEC
#_1EE590: SBC.b #$02
#_1EE592: TAY

#_1EE593: LDA.w .target_x+0,Y
#_1EE596: SEC
#_1EE597: SBC.w $0D10,X
#_1EE59A: CLC
#_1EE59B: ADC.b #$02

#_1EE59D: CMP.b #$04
#_1EE59F: BCS .not_at_target

#_1EE5A1: LDA.w .target_y+0,Y
#_1EE5A4: SEC
#_1EE5A5: SBC.w $0D00,X
#_1EE5A8: CLC
#_1EE5A9: ADC.b #$02

#_1EE5AB: CMP.b #$04
#_1EE5AD: BCS .not_at_target

#_1EE5AF: INC.w $0D80,X

#_1EE5B2: STZ.w $0D40,X
#_1EE5B5: STZ.w $0D50,X

#_1EE5B8: LDA.b #$20
#_1EE5BA: STA.w $0E00,X

#_1EE5BD: LDA.b #$21 ; SFX2.21
#_1EE5BF: JSL SpriteSFX_QueueSFX2WithPan

#_1EE5C3: RTS

;---------------------------------------------------------------------------------------------------

.not_at_target
#_1EE5C4: LDA.w .target_x+0,Y
#_1EE5C7: STA.b $04

#_1EE5C9: LDA.w .target_x+1,Y
#_1EE5CC: STA.b $05

#_1EE5CE: LDA.w .target_y+0,Y
#_1EE5D1: STA.b $06

#_1EE5D3: LDA.w .target_y+1,Y
#_1EE5D6: STA.b $07

#_1EE5D8: LDA.b #$09
#_1EE5DA: JSL Sprite_ProjectSpeedTowardsLocation_long

#_1EE5DE: LDA.b $00
#_1EE5E0: STA.w $0D40,X

#_1EE5E3: LDA.b $01
#_1EE5E5: STA.w $0D50,X

#_1EE5E8: RTS

;===================================================================================================

pool Kiki_WalkOnRoof

.step
#_1EE5E9: db $02, $01, $FF

.timer
#_1EE5EC: db  82,   0

pool off

;---------------------------------------------------------------------------------------------------

Kiki_WalkOnRoof:
#_1EE5EE: LDA.b $1A
#_1EE5F0: LSR A
#_1EE5F1: LSR A
#_1EE5F2: LSR A
#_1EE5F3: AND.b #$01
#_1EE5F5: STA.w $0DC0,X

#_1EE5F8: LDA.w $0F70,X
#_1EE5FB: BNE .exit

#_1EE5FD: LDA.w $0DF0,X
#_1EE600: BNE .exit

#_1EE602: LDA.w $0D90,X
#_1EE605: TAY

#_1EE606: INC.w $0D90,X

#_1EE609: LDA.w .step,Y
#_1EE60C: BMI .on_roof

#_1EE60E: PHA

#_1EE60F: STA.w $0DE0,X

#_1EE612: LDA.w .timer,Y
#_1EE615: STA.w $0DF0,X

#_1EE618: PLA
#_1EE619: TAY

#_1EE61A: LDA.w .speed_x,Y
#_1EE61D: STA.w $0D50,X

#_1EE620: LDA.w .speed_y,Y
#_1EE623: STA.w $0D40,X

.exit
#_1EE626: RTS

;---------------------------------------------------------------------------------------------------

.on_roof
#_1EE627: INC.w $0D80,X

#_1EE62A: STZ.w $0D50,X
#_1EE62D: STZ.w $0D40,X

#_1EE630: LDA.b #$01
#_1EE632: STA.w $04C6

#_1EE635: STZ.b $B0
#_1EE637: STZ.b $C8

#_1EE639: STZ.w $0DE0,X

#_1EE63C: STZ.w $02E4

#_1EE63F: RTS

;===================================================================================================

Kiki_ReadyButtonPress:
#_1EE640: LDA.b #$08
#_1EE642: STA.w $0DE0,X

#_1EE645: STZ.w $0DC0,X

#_1EE648: JSL GetRandomNumber
#_1EE64C: AND.b #$0F
#_1EE64E: ADC.b #$10
#_1EE650: STA.w $0F80,X

#_1EE653: INC.w $0D80,X

#_1EE656: RTS

;===================================================================================================

Kiki_SlamButton:
#_1EE657: LDA.w $0F80,X
#_1EE65A: BPL Kiki_IdleOnRoof

#_1EE65C: LDA.w $0F70,X
#_1EE65F: BNE Kiki_IdleOnRoof

#_1EE661: INC.w $0D80,X

#_1EE664: LDA.b #$25 ; SFX3.25
#_1EE666: JSL SpriteSFX_QueueSFX3WithPan

;===================================================================================================

Kiki_IdleOnRoof:
#_1EE66A: RTS

;===================================================================================================

Kiki_RevertToSprite:
#_1EE66B: JSR Kiki_SpawnHandlerMonke

#_1EE66E: LDA.b #$01
#_1EE670: STA.w $0E80,Y

#_1EE673: LDA.b #$00
#_1EE675: STA.l $7EF3CC

#_1EE679: RTL

;===================================================================================================

Kiki_SpawnHandlerMonke:
#_1EE67A: PHA

#_1EE67B: LDA.b #$B6 ; SPRITE B6
#_1EE67D: JSL Sprite_SpawnDynamically
#_1EE681: BMI .no_space

#_1EE683: PLA
#_1EE684: PHX
#_1EE685: TAX

#_1EE686: LDA.w $1A64,X
#_1EE689: AND.b #$03
#_1EE68B: STA.w $0EB0,Y
#_1EE68E: STA.w $0DE0,Y

#_1EE691: LDA.w $1A00,X
#_1EE694: CLC
#_1EE695: ADC.b #$02
#_1EE697: STA.w $0D00,Y

#_1EE69A: LDA.w $1A14,X
#_1EE69D: ADC.b #$00
#_1EE69F: STA.w $0D20,Y

#_1EE6A2: LDA.w $1A28,X
#_1EE6A5: CLC
#_1EE6A6: ADC.b #$02
#_1EE6A8: STA.w $0D10,Y

#_1EE6AB: LDA.w $1A3C,X
#_1EE6AE: ADC.b #$00
#_1EE6B0: STA.w $0D30,Y

#_1EE6B3: LDA.b $EE
#_1EE6B5: STA.w $0F20,Y

#_1EE6B8: LDA.b #$01
#_1EE6BA: STA.w $0BA0,Y

#_1EE6BD: INC A
#_1EE6BE: STA.w $0F20,Y

#_1EE6C1: STZ.b $5E

#_1EE6C3: PLX

#_1EE6C4: RTS

.no_space
#_1EE6C5: PLA

#_1EE6C6: RTS

;===================================================================================================

Kiki_SpawnHandler_A:
#_1EE6C7: JSR Kiki_SpawnHandlerMonke

#_1EE6CA: LDA.b #$02
#_1EE6CC: STA.w $0E80,Y

#_1EE6CF: RTL

;===================================================================================================

Kiki_SpawnHandler_B:
#_1EE6D0: JSR Kiki_SpawnHandlerMonke

#_1EE6D3: LDA.b #$01
#_1EE6D5: STA.w $0F70,Y

#_1EE6D8: LDA.b #$10
#_1EE6DA: STA.w $0F80,Y

#_1EE6DD: LDA.b #$03
#_1EE6DF: STA.w $0E80,Y

#_1EE6E2: LDA.b #$00
#_1EE6E4: STA.l $7EF3CC

#_1EE6E8: RTL

;===================================================================================================

pool SpriteDraw_Kiki

.gfx_offset
#_1EE6E9: db $20, $C0
#_1EE6EB: db $20, $C0
#_1EE6ED: db $00, $A0
#_1EE6EF: db $00, $A0
#_1EE6F1: db $40, $80
#_1EE6F3: db $40, $60
#_1EE6F5: db $40, $80
#_1EE6F7: db $40, $60

;---------------------------------------------------------------------------------------------------

.oam_groups_a
#_1EE6F9: dw   0,  -6 : db $20, $00, $00, $02
#_1EE701: dw   0,   0 : db $22, $00, $00, $02

#_1EE709: dw   0,  -6 : db $20, $00, $00, $02
#_1EE711: dw   0,   0 : db $22, $40, $00, $02

#_1EE719: dw   0,  -6 : db $20, $00, $00, $02
#_1EE721: dw   0,   0 : db $22, $00, $00, $02

#_1EE729: dw   0,  -6 : db $20, $00, $00, $02
#_1EE731: dw   0,   0 : db $22, $40, $00, $02

#_1EE739: dw  -1,  -6 : db $20, $00, $00, $02
#_1EE741: dw   0,   0 : db $22, $00, $00, $02

#_1EE749: dw  -1,  -6 : db $20, $00, $00, $02
#_1EE751: dw   0,   0 : db $22, $00, $00, $02

#_1EE759: dw   1,  -6 : db $20, $40, $00, $02
#_1EE761: dw   0,   0 : db $22, $40, $00, $02

#_1EE769: dw   1,  -6 : db $20, $40, $00, $02
#_1EE771: dw   0,   0 : db $22, $40, $00, $02

#_1EE779: dw   0,  -6 : db $CE, $01, $00, $02
#_1EE781: dw   0,   0 : db $EE, $01, $00, $02

#_1EE789: dw   0,  -6 : db $CE, $01, $00, $02
#_1EE791: dw   0,   0 : db $EE, $01, $00, $02

#_1EE799: dw   0,  -6 : db $CE, $41, $00, $02
#_1EE7A1: dw   0,   0 : db $EE, $41, $00, $02

#_1EE7A9: dw   0,  -6 : db $CE, $41, $00, $02
#_1EE7B1: dw   0,   0 : db $EE, $41, $00, $02

#_1EE7B9: dw  -1,  -6 : db $CE, $01, $00, $02
#_1EE7C1: dw   0,   0 : db $EC, $01, $00, $02

#_1EE7C9: dw  -1,  -6 : db $CE, $41, $00, $02
#_1EE7D1: dw   0,   0 : db $EC, $01, $00, $02

#_1EE7D9: dw   1,  -6 : db $CE, $41, $00, $02
#_1EE7E1: dw   0,   0 : db $EC, $41, $00, $02

#_1EE7E9: dw   1,  -6 : db $CE, $01, $00, $02
#_1EE7F1: dw   0,   0 : db $EC, $41, $00, $02

;---------------------------------------------------------------------------------------------------

.oam_groups_b
#_1EE7F9: dw   0,  -6 : db $CA, $01, $00, $00
#_1EE801: dw   8,  -6 : db $CA, $41, $00, $00

#_1EE809: dw   0,   2 : db $DA, $01, $00, $00
#_1EE811: dw   8,   2 : db $DA, $41, $00, $00

#_1EE819: dw   0,  10 : db $CB, $01, $00, $00
#_1EE821: dw   8,  10 : db $CB, $41, $00, $00

#_1EE829: dw   0,  -6 : db $DB, $01, $00, $00
#_1EE831: dw   8,  -6 : db $DB, $41, $00, $00

#_1EE839: dw   0,   2 : db $CC, $01, $00, $00
#_1EE841: dw   8,   2 : db $CC, $41, $00, $00

#_1EE849: dw   0,  10 : db $DC, $01, $00, $00
#_1EE851: dw   8,  10 : db $DD, $41, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Kiki:
#_1EE859: LDA.w $0DE0,X
#_1EE85C: CMP.b #$08
#_1EE85E: BCS .use_set_2

#_1EE860: LDA.w $0DE0,X
#_1EE863: ASL A
#_1EE864: ADC.w $0DC0,X
#_1EE867: ASL A
#_1EE868: TAY

#_1EE869: LDA.w .gfx_offset+0,Y
#_1EE86C: STA.w $0AE8

#_1EE86F: LDA.w .gfx_offset+1,Y
#_1EE872: STA.w $0AEA

#_1EE875: TYA
#_1EE876: ASL A
#_1EE877: ASL A
#_1EE878: ASL A
#_1EE879: ADC.b #.oam_groups_a>>0
#_1EE87B: STA.b $08

#_1EE87D: LDA.b #.oam_groups_a>>8
#_1EE87F: ADC.b #$00
#_1EE881: STA.b $09

#_1EE883: LDA.b #$02
#_1EE885: JSR SpriteDraw_Tabulated_Bank1E

#_1EE888: LDA.w $0F00,X
#_1EE88B: BNE .exit_a

#_1EE88D: JSL SpriteDraw_Shadow_long

.exit_a
#_1EE891: RTS

;---------------------------------------------------------------------------------------------------

.use_set_2
#_1EE892: LDA.w $0DC0,X
#_1EE895: ASL A

#_1EE896: ADC.w $0DC0,X
#_1EE899: ASL A
#_1EE89A: ASL A
#_1EE89B: ASL A
#_1EE89C: ASL A

#_1EE89D: ADC.b #.oam_groups_b>>0
#_1EE89F: STA.b $08

#_1EE8A1: LDA.b #.oam_groups_b>>8
#_1EE8A3: ADC.b #$00
#_1EE8A5: STA.b $09

#_1EE8A7: LDA.b #$06
#_1EE8A9: JSR SpriteDraw_Tabulated_Bank1E

#_1EE8AC: LDA.w $0F00,X
#_1EE8AF: BNE .exit_b

#_1EE8B1: JSL SpriteDraw_Shadow_long

.exit_b
#_1EE8B5: RTS

;===================================================================================================

Sprite_B7_BlindMaiden:
#_1EE8B6: JSL SpriteDraw_Maiden
#_1EE8BA: JSR Sprite_CheckIfActive_Bank1E
#_1EE8BD: JSL Sprite_TrackBodyToHead

#_1EE8C1: JSR Sprite_DirectionToFaceLink_Bank1E
#_1EE8C4: TYA
#_1EE8C5: EOR.b #$03
#_1EE8C7: STA.w $0EB0,X

#_1EE8CA: LDA.w $0D80,X
#_1EE8CD: BNE .become_follower

#_1EE8CF: LDA.b #$22 ; MESSAGE 0122
#_1EE8D1: LDY.b #$01
#_1EE8D3: JSL Sprite_ShowMessageOnContact
#_1EE8D7: BCC .exit

#_1EE8D9: INC.w $0D80,X

.exit
#_1EE8DC: RTS

;---------------------------------------------------------------------------------------------------

.become_follower
#_1EE8DD: STZ.w $0DD0,X

#_1EE8E0: LDA.b #$06 ; FOLLOWER 06
#_1EE8E2: STA.l $7EF3CC

#_1EE8E6: PHX
#_1EE8E7: JSL LoadFollowerGraphics
#_1EE8EB: PLX

#_1EE8EC: JSL Sprite_BecomeFollower

#_1EE8F0: RTS

;===================================================================================================

SpritePrep_OldMan:
#_1EE8F1: PHB
#_1EE8F2: PHK
#_1EE8F3: PLB

#_1EE8F4: JSR .main

#_1EE8F7: PLB

#_1EE8F8: RTL

;---------------------------------------------------------------------------------------------------

.main
#_1EE8F9: INC.w $0BA0,X

#_1EE8FC: LDA.b $A0
#_1EE8FE: CMP.b #$E4 ; ROOM 00E4
#_1EE900: BNE .not_home

#_1EE902: LDA.b #$02
#_1EE904: STA.w $0E80,X

#_1EE907: RTS

.not_home
#_1EE908: LDA.l $7EF3CC
#_1EE90C: CMP.b #$00
#_1EE90E: BNE .dont_spawn

#_1EE910: LDA.l $7EF353
#_1EE914: CMP.b #$02
#_1EE916: BNE .spawn

#_1EE918: STZ.w $0DD0,X

.spawn
#_1EE91B: LDA.b #$04 ; FOLLOWER 04
#_1EE91D: STA.l $7EF3CC

#_1EE921: PHX
#_1EE922: JSL LoadFollowerGraphics
#_1EE926: PLX

#_1EE927: LDA.b #$00
#_1EE929: STA.l $7EF3CC

#_1EE92D: RTS

;---------------------------------------------------------------------------------------------------

.dont_spawn
#_1EE92E: STZ.w $0DD0,X

#_1EE931: PHX
#_1EE932: JSL LoadFollowerGraphics
#_1EE936: PLX

#_1EE937: RTS

;===================================================================================================

OldMan_RevertToSprite:
#_1EE938: PHA

#_1EE939: LDA.b #$AD ; SPRITE AD
#_1EE93B: JSL Sprite_SpawnDynamically

#_1EE93F: PLA

#_1EE940: PHX

#_1EE941: TAX

#_1EE942: LDA.w $1A64,X
#_1EE945: AND.b #$03
#_1EE947: STA.w $0EB0,Y
#_1EE94A: STA.w $0DE0,Y

#_1EE94D: LDA.w $1A00,X
#_1EE950: CLC
#_1EE951: ADC.b #$02
#_1EE953: STA.w $0D00,Y

#_1EE956: LDA.w $1A14,X
#_1EE959: ADC.b #$00
#_1EE95B: STA.w $0D20,Y

#_1EE95E: LDA.w $1A28,X
#_1EE961: CLC
#_1EE962: ADC.b #$02
#_1EE964: STA.w $0D10,Y

#_1EE967: LDA.w $1A3C,X
#_1EE96A: ADC.b #$00
#_1EE96C: STA.w $0D30,Y

#_1EE96F: LDA.b $EE
#_1EE971: STA.w $0F20,Y

#_1EE974: LDA.b #$01
#_1EE976: STA.w $0BA0,Y
#_1EE979: STA.w $0E80,Y

#_1EE97C: JSR OldMan_EnableCutscene

#_1EE97F: PLX

#_1EE980: LDA.b #$00
#_1EE982: STA.l $7EF3CC

#_1EE986: STZ.b $5E

#_1EE988: RTL

;===================================================================================================

OldMan_EnableCutscene:
#_1EE989: LDA.b #$01
#_1EE98B: STA.w $02E4
#_1EE98E: STA.w $037B

#_1EE991: RTS

;===================================================================================================

Sprite_AD_OldMan:
#_1EE992: JSL SpriteDraw_OldMan
#_1EE996: JSR Sprite_CheckIfActive_Bank1E

#_1EE999: LDA.w $0E80,X
#_1EE99C: JSL JumpTableLocal
#_1EE9A0: dw OldMan_Lost
#_1EE9A2: dw OldMan_Returning
#_1EE9A4: dw OldMan_Home

;===================================================================================================

OldMan_Lost:
#_1EE9A6: LDA.w $0D80,X
#_1EE9A9: JSL JumpTableLocal
#_1EE9AD: dw OldMan_Lost_Wait
#_1EE9AF: dw OldMan_Lost_BecomeFollower

;===================================================================================================

OldMan_Lost_Wait:
#_1EE9B1: JSL Sprite_TrackBodyToHead

#_1EE9B5: JSR Sprite_DirectionToFaceLink_Bank1E
#_1EE9B8: TYA
#_1EE9B9: EOR.b #$03
#_1EE9BB: STA.w $0EB0,X

#_1EE9BE: LDA.b #$9C ; MESSAGE 009C
#_1EE9C0: LDY.b #$00
#_1EE9C2: JSL Sprite_ShowMessageOnContact
#_1EE9C6: BCC .exit

#_1EE9C8: STA.w $0DE0,X
#_1EE9CB: STA.w $0EB0,X

#_1EE9CE: INC.w $0D80,X

.exit
#_1EE9D1: RTS

;===================================================================================================

OldMan_Lost_BecomeFollower:
#_1EE9D2: LDA.b #$04 ; FOLLOWER 04
#_1EE9D4: STA.l $7EF3CC

#_1EE9D8: JSL Sprite_BecomeFollower

#_1EE9DC: LDA.b #$05
#_1EE9DE: STA.l $7EF3C8

#_1EE9E2: STZ.w $0DD0,X

#_1EE9E5: JSL CacheRoomEntryProperties_long

#_1EE9E9: RTS

;===================================================================================================

OldMan_Returning:
#_1EE9EA: JSR Sprite_Move_XY_Bank1E

#_1EE9ED: LDA.w $0D80,X
#_1EE9F0: JSL JumpTableLocal
#_1EE9F4: dw OldMan_Returning_GiveMirror
#_1EE9F6: dw OldMan_Returning_Move
#_1EE9F8: dw OldMan_Returning_EnterDoor
#_1EE9FA: dw OldMan_Returning_FinishUp

;===================================================================================================

OldMan_Returning_GiveMirror:
#_1EE9FC: INC.w $0D80,X

#_1EE9FF: LDY.b #$1A ; ITEMGET 1A
#_1EEA01: STZ.w $02E9
#_1EEA04: JSL Link_ReceiveItem

#_1EEA08: LDA.b #$01
#_1EEA0A: STA.l $7EF3C8

#_1EEA0E: JSR OldMan_EnableCutscene

#_1EEA11: LDA.b #$30
#_1EEA13: STA.w $0DF0,X

#_1EEA16: LDA.b #$08
#_1EEA18: STA.w $0D50,X

#_1EEA1B: LSR A
#_1EEA1C: STA.w $0D40,X

#_1EEA1F: LDA.b #$03
#_1EEA21: STA.w $0EB0,X
#_1EEA24: STA.w $0DE0,X

#_1EEA27: RTS

;===================================================================================================

OldMan_Returning_Move:
#_1EEA28: JSR OldMan_EnableCutscene

#_1EEA2B: LDA.w $0DF0,X
#_1EEA2E: BNE .delay

#_1EEA30: INC.w $0D80,X

.delay
#_1EEA33: TXA
#_1EEA34: EOR.b $1A
#_1EEA36: LSR A
#_1EEA37: LSR A
#_1EEA38: LSR A
#_1EEA39: AND.b #$01
#_1EEA3B: STA.w $0DC0,X

#_1EEA3E: RTS

;===================================================================================================

OldMan_Returning_EnterDoor:
#_1EEA3F: STZ.w $0EB0,X

#_1EEA42: STZ.w $0DE0,X

#_1EEA45: LDY.w $0FDE

#_1EEA48: LDA.w $0B18,Y
#_1EEA4B: STA.b $00

#_1EEA4D: LDA.w $0B20,Y
#_1EEA50: STA.b $01

#_1EEA52: LDA.w $0D00,X
#_1EEA55: STA.b $02

#_1EEA57: LDA.w $0D20,X
#_1EEA5A: STA.b $03

#_1EEA5C: REP #$20

#_1EEA5E: LDA.b $00
#_1EEA60: CMP.b $02

#_1EEA62: SEP #$30
#_1EEA64: BCC .not_north_enough

#_1EEA66: INC.w $0D80,X

#_1EEA69: STZ.w $0D50,X
#_1EEA6C: STZ.w $0D40,X

#_1EEA6F: RTS

.not_north_enough
#_1EEA70: LDA.w $0B08,Y
#_1EEA73: STA.b $04

#_1EEA75: LDA.w $0B10,Y
#_1EEA78: STA.b $05

#_1EEA7A: LDA.w $0B18,Y
#_1EEA7D: STA.b $06

#_1EEA7F: LDA.w $0B20,Y
#_1EEA82: STA.b $07

#_1EEA84: LDA.b #$08
#_1EEA86: JSL Sprite_ProjectSpeedTowardsLocation_long

#_1EEA8A: LDA.b $00
#_1EEA8C: STA.w $0D40,X

#_1EEA8F: LDA.b $01
#_1EEA91: STA.w $0D50,X

#_1EEA94: TXA
#_1EEA95: EOR.b $1A
#_1EEA97: LSR A
#_1EEA98: LSR A
#_1EEA99: LSR A
#_1EEA9A: AND.b #$01
#_1EEA9C: STA.w $0DC0,X

#_1EEA9F: JSR OldMan_EnableCutscene

#_1EEAA2: RTS

;===================================================================================================

OldMan_Returning_FinishUp:
#_1EEAA3: STZ.w $0DD0,X
#_1EEAA6: STZ.w $02E4
#_1EEAA9: STZ.w $037B

#_1EEAAC: RTS

;===================================================================================================

pool OldMan_Home

.message_low
#_1EEAAD: db $9E ; MESSAGE 009E
#_1EEAAE: db $9F ; MESSAGE 009F
#_1EEAAF: db $A0 ; MESSAGE 00A0

.message_high
#_1EEAB0: db $00
#_1EEAB1: db $00
#_1EEAB2: db $00

pool off

;---------------------------------------------------------------------------------------------------

OldMan_Home:
#_1EEAB3: JSL Sprite_BehaveAsBarrier

#_1EEAB7: LDA.w $0D80,X
#_1EEABA: BEQ .no_kiss

#_1EEABC: LDA.b #$A0
#_1EEABE: STA.l $7EF372

#_1EEAC2: STZ.w $0D80,X

.no_kiss
#_1EEAC5: LDY.b #$02

#_1EEAC7: LDA.l $7EF3C5
#_1EEACB: CMP.b #$03
#_1EEACD: BCS .agahnim_defeated

#_1EEACF: LDA.l $7EF357
#_1EEAD3: TAY

.agahnim_defeated
#_1EEAD4: LDA.w .message_low,Y
#_1EEAD7: XBA

#_1EEAD8: LDA.w .message_high,Y
#_1EEADB: TAY

#_1EEADC: XBA
#_1EEADD: JSL Sprite_ShowSolicitedMessage
#_1EEAE1: BCC .exit

#_1EEAE3: INC.w $0D80,X

.exit
#_1EEAE6: RTS

;===================================================================================================

Sprite_B8_DialogueTester:
#_1EEAE7: JSL SpriteDraw_Priest

#_1EEAEB: JSR Sprite_CheckIfActive_Bank1E

#_1EEAEE: LDA.w $0D90,X
#_1EEAF1: AND.b #$03
#_1EEAF3: STA.w $0DE0,X

#_1EEAF6: LDA.w $0D80,X
#_1EEAF9: JSL JumpTableLocal
#_1EEAFD: dw DialogueTester_Initialize
#_1EEAFF: dw DialogueTester_TestMessage
#_1EEB01: dw DialogueTester_NextMessage

;===================================================================================================

DialogueTester_Initialize:
#_1EEB03: STZ.w $0D90,X

#_1EEB06: STZ.w $0DA0,X

#_1EEB09: INC.w $0D80,X

;===================================================================================================

DialogueTester_TestMessage:
#_1EEB0C: LDA.w $0D90,X
#_1EEB0F: LDY.w $0DA0,X

#_1EEB12: JSL Sprite_ShowMessageOnContact
#_1EEB16: BCC .exit

#_1EEB18: INC.w $0D80,X

.exit
#_1EEB1B: RTS

;===================================================================================================

DialogueTester_NextMessage:
#_1EEB1C: LDA.w $0D90,X
#_1EEB1F: CLC
#_1EEB20: ADC.b #$01
#_1EEB22: STA.w $0D90,X

#_1EEB25: LDA.w $0DA0,X
#_1EEB28: ADC.b #$00
#_1EEB2A: STA.w $0DA0,X

#_1EEB2D: LDA.b #$01
#_1EEB2F: STA.w $0D80,X

#_1EEB32: RTS

;===================================================================================================

Sprite_B9_BullyAndPinkBall:
#_1EEB33: LDA.w $0E80,X
#_1EEB36: JSL JumpTableLocal
#_1EEB3A: dw PinkBall
#_1EEB3C: dw PinkBall_Distress
#_1EEB3E: dw Bully

;===================================================================================================

PinkBall:
#_1EEB40: JSL SpriteDraw_AllocateOAMDeferToPlayer_long
#_1EEB44: JSL SpriteDraw_SingleLarge_long

#_1EEB48: JSR Sprite_CheckIfActive_Bank1E
#_1EEB4B: JSR PinkBall_HandleMessage

#_1EEB4E: LDA.w $0F50,X
#_1EEB51: AND.b #$7F
#_1EEB53: ORA.w $0EB0,X
#_1EEB56: STA.w $0F50,X

#_1EEB59: JSR Sprite_Move_XYZ_Bank1E
#_1EEB5C: JSR Sprite_CheckTileCollision_Bank1E
#_1EEB5F: BEQ .no_tile_collision

#_1EEB61: AND.b #$03
#_1EEB63: BNE .bounce

#_1EEB65: LDA.w $0D40,X
#_1EEB68: EOR.b #$FF
#_1EEB6A: INC A
#_1EEB6B: STA.w $0D40,X

#_1EEB6E: LDA.w $0E90,X
#_1EEB71: BEQ .bounce

#_1EEB73: JSR BOI_OI_OI_OI_OING
#_1EEB76: BRA .no_tile_collision

.bounce
#_1EEB78: LDA.w $0D50,X
#_1EEB7B: EOR.b #$FF
#_1EEB7D: INC A
#_1EEB7E: STA.w $0D50,X

#_1EEB81: LDA.w $0E90,X
#_1EEB84: BEQ .no_tile_collision

#_1EEB86: JSR BOI_OI_OI_OI_OING

.no_tile_collision
#_1EEB89: DEC.w $0F80,X

#_1EEB8C: LDA.w $0F70,X
#_1EEB8F: BPL .airborne

#_1EEB91: STZ.w $0F70,X

#_1EEB94: LDA.w $0F80,X
#_1EEB97: EOR.b #$FF
#_1EEB99: INC A

#_1EEB9A: LSR A
#_1EEB9B: LSR A
#_1EEB9C: STA.w $0F80,X

#_1EEB9F: AND.b #$FC
#_1EEBA1: BEQ .no_sfx

#_1EEBA3: JSR BOI_OI_OI_OI_OING

.no_sfx
#_1EEBA6: JSR PinkBall_HandleDeceleration

.airborne
#_1EEBA9: LDA.w $0E90,X
#_1EEBAC: BNE PinkBall_Kicked

#_1EEBAE: LDA.w $0EB0,X
#_1EEBB1: BEQ PinkBall_RightSideUp
#_1EEBB3: JMP.w PinkBall_UpsideDown

;===================================================================================================

PinkBall_RightSideUp:
#_1EEBB6: JSR PinkBall_Distress

#_1EEBB9: TXA
#_1EEBBA: EOR.b $1A
#_1EEBBC: PHA

#_1EEBBD: LSR A
#_1EEBBE: LSR A
#_1EEBBF: LSR A
#_1EEBC0: AND.b #$01
#_1EEBC2: STA.w $0DC0,X

#_1EEBC5: PLA
#_1EEBC6: AND.b #$3F
#_1EEBC8: BNE .continue

#_1EEBCA: JSL GetRandomNumber
#_1EEBCE: STA.b $04

#_1EEBD0: LDA.b $23
#_1EEBD2: STA.b $05

#_1EEBD4: JSL GetRandomNumber
#_1EEBD8: STA.b $06

#_1EEBDA: LDA.b $21
#_1EEBDC: STA.b $07

#_1EEBDE: LDA.b #$08
#_1EEBE0: JSL Sprite_ProjectSpeedTowardsLocation_long

#_1EEBE4: LDA.b $01
#_1EEBE6: STA.w $0DA0,X

#_1EEBE9: LDA.b $00
#_1EEBEB: STA.w $0D90,X

#_1EEBEE: BEQ .continue

#_1EEBF0: LDA.w $0F50,X
#_1EEBF3: ORA.b #$40
#_1EEBF5: STA.w $0F50,X

#_1EEBF8: LDA.w $0D50,X
#_1EEBFB: LSR A
#_1EEBFC: AND.b #$40
#_1EEBFE: EOR.w $0F50,X
#_1EEC01: STA.w $0F50,X

.continue
#_1EEC04: LDA.w $0DA0,X
#_1EEC07: STA.w $0D50,X

#_1EEC0A: LDA.w $0D90,X
#_1EEC0D: STA.w $0D40,X

#_1EEC10: RTS

;===================================================================================================

PinkBall_Kicked:
#_1EEC11: LDA.w $0D50,X
#_1EEC14: ORA.w $0D40,X
#_1EEC17: BNE .have_momentum

#_1EEC19: STZ.w $0E90,X

#_1EEC1C: RTS

.have_momentum
#_1EEC1D: TXA
#_1EEC1E: EOR.b $1A
#_1EEC20: PHA

#_1EEC21: LSR A
#_1EEC22: LSR A
#_1EEC23: AND.b #$01
#_1EEC25: STA.w $0DC0,X

#_1EEC28: PLA
#_1EEC29: ASL A
#_1EEC2A: ASL A
#_1EEC2B: AND.b #$80
#_1EEC2D: STA.w $0EB0,X

#_1EEC30: RTS

;===================================================================================================

PinkBall_UpsideDown:
#_1EEC31: JSR PinkBall_Distress

#_1EEC34: TXA
#_1EEC35: EOR.b $1A
#_1EEC37: BEQ .flip_upright

#_1EEC39: LSR A
#_1EEC3A: LSR A
#_1EEC3B: AND.b #$01
#_1EEC3D: STA.w $0DC0,X

#_1EEC40: STZ.w $0D50,X
#_1EEC43: STZ.w $0D40,X

#_1EEC46: RTS

.flip_upright
#_1EEC47: STZ.w $0EB0,X

#_1EEC4A: RTS

;===================================================================================================

pool PinkBall_HandleDeceleration

.decel
#_1EEC4B: db -2,  2

pool off

;---------------------------------------------------------------------------------------------------

PinkBall_HandleDeceleration:
#_1EEC4D: LDA.w $0D50,X
#_1EEC50: BEQ .handle_y

#_1EEC52: PHA

#_1EEC53: ASL A
#_1EEC54: ROL A
#_1EEC55: AND.b #$01
#_1EEC57: TAY

#_1EEC58: PLA
#_1EEC59: CLC
#_1EEC5A: ADC.w .decel,Y
#_1EEC5D: STA.w $0D50,X

.handle_y
#_1EEC60: LDA.w $0D40,X
#_1EEC63: BEQ .exit

#_1EEC65: PHA

#_1EEC66: ASL A
#_1EEC67: ROL A
#_1EEC68: AND.b #$01
#_1EEC6A: TAY

#_1EEC6B: PLA
#_1EEC6C: CLC
#_1EEC6D: ADC.w .decel,Y
#_1EEC70: STA.w $0D40,X

.exit
#_1EEC73: RTS

;===================================================================================================

PinkBall_Distress:
#_1EEC74: JSR Sprite_PrepOAMCoord_Bank1E
#_1EEC77: JSL Sprite_DrawDistressSweat

#_1EEC7B: RTS

;===================================================================================================

Bully:
#_1EEC7C: JSR SpriteDraw_Bully
#_1EEC7F: JSR Sprite_CheckIfActive_Bank1E
#_1EEC82: JSR Bully_HandleMessage

#_1EEC85: JSR Sprite_Move_XYZ_Bank1E
#_1EEC88: JSR Sprite_CheckTileCollision_Bank1E
#_1EEC8B: BEQ .no_tile_collision

#_1EEC8D: AND.b #$03
#_1EEC8F: BNE .horizontal_collision

#_1EEC91: LDA.w $0D40,X
#_1EEC94: EOR.b #$FF
#_1EEC96: INC A
#_1EEC97: STA.w $0D40,X
#_1EEC9A: BRA .no_tile_collision

.horizontal_collision
#_1EEC9C: LDA.w $0D50,X
#_1EEC9F: EOR.b #$FF
#_1EECA1: INC A
#_1EECA2: STA.w $0D50,X

.no_tile_collision
#_1EECA5: LDA.w $0D80,X
#_1EECA8: JSL JumpTableLocal
#_1EECAC: dw Bully_ChaseVictim
#_1EECAE: dw Bully_PuntVictim
#_1EECB0: dw Bully_Idle

;===================================================================================================

Bully_ChaseVictim:
#_1EECB2: TXA
#_1EECB3: EOR.b $1A
#_1EECB5: PHA

#_1EECB6: LSR A
#_1EECB7: LSR A
#_1EECB8: LSR A
#_1EECB9: AND.b #$01
#_1EECBB: STA.w $0DC0,X

#_1EECBE: PLA
#_1EECBF: AND.b #$1F
#_1EECC1: BNE .dont_turn

#_1EECC3: LDA.w $0EB0,X
#_1EECC6: TAY

#_1EECC7: LDA.w $0D10,Y
#_1EECCA: STA.b $04

#_1EECCC: LDA.w $0D30,Y
#_1EECCF: STA.b $05

#_1EECD1: LDA.w $0D00,Y
#_1EECD4: STA.b $06

#_1EECD6: LDA.w $0D20,Y
#_1EECD9: STA.b $07

#_1EECDB: LDA.b #$0E
#_1EECDD: JSL Sprite_ProjectSpeedTowardsLocation_long

#_1EECE1: LDA.b $00
#_1EECE3: STA.w $0D40,X

#_1EECE6: LDA.b $01
#_1EECE8: STA.w $0D50,X
#_1EECEB: BEQ .dont_turn

#_1EECED: LDA.w $0D50,X
#_1EECF0: ASL A
#_1EECF1: ROL A
#_1EECF2: AND.b #$01
#_1EECF4: STA.w $0DE0,X

.dont_turn
#_1EECF7: LDA.w $0EB0,X
#_1EECFA: TAY

#_1EECFB: LDA.w $0F70,Y
#_1EECFE: BNE .exit

#_1EED00: LDA.w $0D10,X
#_1EED03: SEC
#_1EED04: SBC.w $0D10,Y
#_1EED07: CLC
#_1EED08: ADC.b #$08

#_1EED0A: CMP.b #$10
#_1EED0C: BCS .exit

#_1EED0E: LDA.w $0D00,X
#_1EED11: SEC
#_1EED12: SBC.w $0D00,Y
#_1EED15: CLC
#_1EED16: ADC.b #$08

#_1EED18: CMP.b #$10
#_1EED1A: BCS .exit

#_1EED1C: INC.w $0D80,X

#_1EED1F: JSR BOI_OI_OI_OI_OING

.exit
#_1EED22: RTS

;===================================================================================================

Bully_PuntVictim:
#_1EED23: INC.w $0D80,X

#_1EED26: LDA.w $0EB0,X
#_1EED29: TAY

#_1EED2A: LDA.w $0D50,X
#_1EED2D: ASL A
#_1EED2E: STA.w $0D50,Y

#_1EED31: LDA.w $0D40,X
#_1EED34: ASL A
#_1EED35: STA.w $0D40,Y

#_1EED38: STZ.w $0D50,X
#_1EED3B: STZ.w $0D40,X

#_1EED3E: JSL GetRandomNumber
#_1EED42: AND.b #$1F
#_1EED44: STA.w $0F80,Y

#_1EED47: LDA.b #$60
#_1EED49: STA.w $0DF0,X

#_1EED4C: LDA.b #$01
#_1EED4E: STA.w $0DC0,X
#_1EED51: STA.w $0E90,Y

#_1EED54: RTS

;===================================================================================================

Bully_Idle:
#_1EED55: LDA.w $0DF0,X
#_1EED58: BNE .exit

#_1EED5A: STZ.w $0D80,X

.exit
#_1EED5D: RTS

;===================================================================================================

pool SpriteDraw_Bully

.oam_groups
#_1EED5E: dw   0,  -7 : db $E0, $46, $00, $02
#_1EED66: dw   0,   0 : db $E2, $46, $00, $02

#_1EED6E: dw   0,  -7 : db $E0, $46, $00, $02
#_1EED76: dw   0,   0 : db $C4, $46, $00, $02

#_1EED7E: dw   0,  -7 : db $E0, $06, $00, $02
#_1EED86: dw   0,   0 : db $E2, $06, $00, $02

#_1EED8E: dw   0,  -7 : db $E0, $06, $00, $02
#_1EED96: dw   0,   0 : db $C4, $06, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Bully:
#_1EED9E: LDA.b #$02
#_1EEDA0: STA.b $06
#_1EEDA2: STZ.b $07

#_1EEDA4: LDA.w $0DE0,X
#_1EEDA7: ASL A

#_1EEDA8: ADC.w $0DC0,X

#_1EEDAB: ASL A
#_1EEDAC: ASL A
#_1EEDAD: ASL A
#_1EEDAE: ASL A

#_1EEDAF: ADC.b #.oam_groups>>0
#_1EEDB1: STA.b $08

#_1EEDB3: LDA.b #.oam_groups>>8
#_1EEDB5: ADC.b #$00
#_1EEDB7: STA.b $09

#_1EEDB9: JSL SpriteDraw_Tabulated_player_deferred
#_1EEDBD: JSL SpriteDraw_Shadow_long

#_1EEDC1: RTS

;===================================================================================================

BOI_OI_OI_OI_OING:
#_1EEDC2: LDA.b #$32 ; SFX3.32
#_1EEDC4: JSL SpriteSFX_QueueSFX3WithPan

#_1EEDC8: RTS

;===================================================================================================

SpawnBully:
#_1EEDC9: LDA.b #$B9 ; SPRITE B9
#_1EEDCB: JSL Sprite_SpawnDynamically
#_1EEDCF: BMI .no_space

#_1EEDD1: JSL Sprite_SetSpawnedCoordinates

#_1EEDD5: LDA.b #$02
#_1EEDD7: STA.w $0E80,Y

#_1EEDDA: TXA
#_1EEDDB: STA.w $0EB0,Y

#_1EEDDE: LDA.b #$01
#_1EEDE0: STA.w $0BA0,Y

.no_space
#_1EEDE3: RTL

;===================================================================================================

pool PinkBall_HandleMessage

.message_low
#_1EEDE4: db $5B ; MESSAGE 015B
#_1EEDE5: db $5C ; MESSAGE 015C

.message_high
#_1EEDE6: db $01
#_1EEDE7: db $01

pool off

;---------------------------------------------------------------------------------------------------

PinkBall_HandleMessage:
#_1EEDE8: LDA.w $0F10,X
#_1EEDEB: BNE .exit

#_1EEDED: LDA.l $7EF357
#_1EEDF1: AND.b #$01
#_1EEDF3: TAY

#_1EEDF4: LDA.w .message_low,Y
#_1EEDF7: XBA

#_1EEDF8: LDA.w .message_high,Y
#_1EEDFB: TAY

#_1EEDFC: XBA

#_1EEDFD: JSL Sprite_ShowMessageOnContact
#_1EEE01: BCC .exit

#_1EEE03: LDA.w $0D50,X
#_1EEE06: EOR.b #$FF
#_1EEE08: STA.w $0D50,X

#_1EEE0B: LDA.w $0D40,X
#_1EEE0E: EOR.b #$FF
#_1EEE10: STA.w $0D40,X

#_1EEE13: LDA.w $0E90,X
#_1EEE16: BEQ .no_sfx

#_1EEE18: JSR BOI_OI_OI_OI_OING

.no_sfx
#_1EEE1B: LDA.b #$40
#_1EEE1D: STA.w $0F10,X

.exit
#_1EEE20: RTS

;===================================================================================================

pool Bully_HandleMessage

.message_low
#_1EEE21: db $5D ; MESSAGE 015D
#_1EEE22: db $5E ; MESSAGE 015E

.message_high
#_1EEE23: db $01
#_1EEE24: db $01

pool off

;---------------------------------------------------------------------------------------------------

Bully_HandleMessage:
#_1EEE25: LDA.w $0F10,X
#_1EEE28: BNE .exit

#_1EEE2A: LDA.l $7EF357
#_1EEE2E: AND.b #$01
#_1EEE30: TAY

#_1EEE31: LDA.w .message_low,Y
#_1EEE34: XBA

#_1EEE35: LDA.w .message_high,Y
#_1EEE38: TAY

#_1EEE39: XBA

#_1EEE3A: JSL Sprite_ShowMessageOnContact
#_1EEE3E: BCC .exit

#_1EEE40: LDA.w $0D50,X
#_1EEE43: EOR.b #$FF
#_1EEE45: STA.w $0D50,X

#_1EEE48: LDA.w $0D40,X
#_1EEE4B: EOR.b #$FF
#_1EEE4D: STA.w $0D40,X

#_1EEE50: LDA.b #$40
#_1EEE52: STA.w $0F10,X

.exit
#_1EEE55: RTS

;===================================================================================================

WhirlpoolFlip:
#_1EEE56: db $00, $40, $C0, $80

;---------------------------------------------------------------------------------------------------

Sprite_BA_Whirlpool:
#_1EEE5A: LDA.b $8A
#_1EEE5C: CMP.b #$1B ; OW 1B
#_1EEE5E: BNE Whirlpool

;===================================================================================================

CastleWarp:
#_1EEE60: JSL Sprite_PrepOAMCoord_long
#_1EEE64: JSR Sprite_CheckIfActive_Bank1E

#_1EEE67: REP #$20

#_1EEE69: LDA.w $0FD8
#_1EEE6C: SEC
#_1EEE6D: SBC.b $22
#_1EEE6F: CLC
#_1EEE70: ADC.w #$0040
#_1EEE73: CMP.w #$0051
#_1EEE76: BCS .no_warp

#_1EEE78: LDA.w $0FDA
#_1EEE7B: SEC
#_1EEE7C: SBC.b $20
#_1EEE7E: CLC
#_1EEE7F: ADC.w #$000F
#_1EEE82: CMP.w #$0012
#_1EEE85: BCS .no_warp

#_1EEE87: SEP #$30

#_1EEE89: LDA.b #$23
#_1EEE8B: STA.b $11

#_1EEE8D: LDA.b #$01
#_1EEE8F: STA.w $02DB

#_1EEE92: STZ.b $B0
#_1EEE94: STZ.b $27
#_1EEE96: STZ.b $28

#_1EEE98: LDA.b #$14 ; LINKSTATE 14
#_1EEE9A: STA.b $5D

#_1EEE9C: LDA.b $8A
#_1EEE9E: AND.b #$40
#_1EEEA0: STA.b $7B

.no_warp
#_1EEEA2: SEP #$30

#_1EEEA4: RTS

;===================================================================================================

Whirlpool:
#_1EEEA5: LDA.w $0F50,X
#_1EEEA8: AND.b #$3F
#_1EEEAA: STA.w $0F50,X

#_1EEEAD: LDA.b $1A
#_1EEEAF: LSR A
#_1EEEB0: LSR A
#_1EEEB1: LSR A
#_1EEEB2: AND.b #$03
#_1EEEB4: TAY

#_1EEEB5: LDA.w WhirlpoolFlip,Y
#_1EEEB8: ORA.w $0F50,X
#_1EEEBB: STA.w $0F50,X

#_1EEEBE: LDA.b #$04
#_1EEEC0: JSL SpriteDraw_AllocateOAMFromRegionB

#_1EEEC4: REP #$20

#_1EEEC6: LDA.w $0FD8
#_1EEEC9: SEC
#_1EEECA: SBC.w #$0005
#_1EEECD: STA.w $0FD8

#_1EEED0: SEP #$30

#_1EEED2: JSL SpriteDraw_SingleLarge_long
#_1EEED6: JSR Sprite_CheckIfActive_Bank1E

#_1EEED9: JSL Sprite_CheckDamageToLink_same_layer_long
#_1EEEDD: BCC .no_contact

#_1EEEDF: LDA.w $0D90,X
#_1EEEE2: BNE .exit

#_1EEEE4: LDA.b #$2E
#_1EEEE6: STA.b $11
#_1EEEE8: STZ.b $B0

.exit
#_1EEEEA: RTS

.no_contact
#_1EEEEB: STZ.w $0D90,X

#_1EEEEE: RTS

;===================================================================================================

Sprite_BB_Shopkeeper:
#_1EEEEF: LDA.w $0E80,X
#_1EEEF2: JSL JumpTableLocal
#_1EEEF6: dw Shopkeeper_StandardClerk
#_1EEEF8: dw ChestGameGuy
#_1EEEFA: dw NiceThiefWithGift
#_1EEEFC: dw MiniChestGameGuy
#_1EEEFE: dw LostWoodsChestGameGuy
#_1EEF00: dw NiceThiefUnderRock
#_1EEF02: dw NiceThiefUnderRock

#_1EEF04: dw ShopItem_RedPotion150
#_1EEF06: dw ShopItem_FighterShield
#_1EEF08: dw ShopItem_FireShield
#_1EEF0A: dw ShopItem_Heart
#_1EEF0C: dw ShopItem_Arrows
#_1EEF0E: dw ShopItem_Bombs
#_1EEF10: dw ShopItem_Bee

;===================================================================================================

Shopkeeper_StandardClerk:
#_1EEF12: LDA.w $0FFF
#_1EEF15: BEQ .light_world

#_1EEF17: JSL SpriteDraw_AllocateOAMDeferToPlayer_long
#_1EEF1B: JSL SpriteDraw_SingleLarge_long
#_1EEF1F: JSR Sprite_CheckIfActive_Bank1E

#_1EEF22: LDA.w $0F50,X
#_1EEF25: AND.b #$3F
#_1EEF27: STA.b $00

#_1EEF29: LDA.b $1A
#_1EEF2B: ASL A
#_1EEF2C: ASL A
#_1EEF2D: ASL A

#_1EEF2E: AND.b #$40
#_1EEF30: ORA.b $00
#_1EEF32: STA.w $0F50,X

;---------------------------------------------------------------------------------------------------

.handle_interaction
#_1EEF35: JSL Sprite_BehaveAsBarrier
#_1EEF39: LDY.w $0FFF

#_1EEF3C: LDA.w .message_low,Y
#_1EEF3F: XBA

#_1EEF40: LDA.w .message_high,Y
#_1EEF43: TAY

#_1EEF44: XBA

#_1EEF45: JSL Sprite_ShowSolicitedMessage

#_1EEF49: LDA.w $0D80,X

#_1EEF4C: BEQ .not_welcomed_yet
#_1EEF4E: BRA .exit

;---------------------------------------------------------------------------------------------------

.light_world
#_1EEF50: LDA.b #$07
#_1EEF52: STA.w $0F50,X

#_1EEF55: JSL SpriteDraw_Shopkeeper
#_1EEF59: JSR Sprite_CheckIfActive_Bank1E

#_1EEF5C: LDA.b $1A
#_1EEF5E: LSR A
#_1EEF5F: LSR A
#_1EEF60: LSR A
#_1EEF61: LSR A

#_1EEF62: AND.b #$01
#_1EEF64: STA.w $0DC0,X

#_1EEF67: BRA .handle_interaction

;---------------------------------------------------------------------------------------------------

.message_low
#_1EEF69: db $65 ; MESSAGE 0165
#_1EEF6A: db $5F ; MESSAGE 015F

.message_high
#_1EEF6B: db $01
#_1EEF6C: db $01

;---------------------------------------------------------------------------------------------------

.not_welcomed_yet
#_1EEF6D: REP #$20

#_1EEF6F: LDA.w $0FDA
#_1EEF72: CLC
#_1EEF73: ADC.w #$0060
#_1EEF76: CMP.b $20

#_1EEF78: SEP #$30
#_1EEF7A: BCC .exit

#_1EEF7C: LDY.w $0FFF

#_1EEF7F: LDA.w .message_low,Y
#_1EEF82: XBA

#_1EEF83: LDA.w .message_high,Y
#_1EEF86: TAY

#_1EEF87: XBA

#_1EEF88: JSL Sprite_ShowMessageUnconditional

#_1EEF8C: INC.w $0D80,X

.exit
#_1EEF8F: RTS

;===================================================================================================

ChestGameGuy:
#_1EEF90: JSL SpriteDraw_AllocateOAMDeferToPlayer_long
#_1EEF94: JSL SpriteDraw_SingleLarge_long

#_1EEF98: JSR Sprite_CheckIfActive_Bank1E
#_1EEF9B: JSL Sprite_BehaveAsBarrier

#_1EEF9F: LDA.w $0F50,X
#_1EEFA2: AND.b #$3F
#_1EEFA4: STA.b $00

#_1EEFA6: LDA.b $1A
#_1EEFA8: ASL A
#_1EEFA9: ASL A
#_1EEFAA: ASL A

#_1EEFAB: AND.b #$40
#_1EEFAD: ORA.b $00
#_1EEFAF: STA.w $0F50,X

#_1EEFB2: LDA.w $0D80,X
#_1EEFB5: JSL JumpTableLocal
#_1EEFB9: dw ChestGameGuy_OfferGame
#_1EEFBB: dw ChestGameGuy_HandlePayment
#_1EEFBD: dw ChestGameGuy_ProctorGame

;===================================================================================================

ChestGameGuy_OfferGame:
#_1EEFBF: LDA.w $04C4
#_1EEFC2: DEC A
#_1EEFC3: CMP.b #$02
#_1EEFC5: BCC .exit

#_1EEFC7: LDA.b #$60 ; MESSAGE 0160
#_1EEFC9: LDY.b #$01
#_1EEFCB: JSL Sprite_ShowSolicitedMessage
#_1EEFCF: BCC .exit

#_1EEFD1: INC.w $0D80,X

.exit
#_1EEFD4: RTS

;===================================================================================================

ChestGameGuy_HandlePayment:
#_1EEFD5: LDA.w $1CE8
#_1EEFD8: BNE .rejected

#_1EEFDA: LDA.b #$1E
#_1EEFDC: LDY.b #$00
#_1EEFDE: JSR ShopItem_HandleCost
#_1EEFE1: BCC .rejected

#_1EEFE3: LDA.b #$02
#_1EEFE5: STA.w $04C4

#_1EEFE8: LDA.b #$64 ; MESSAGE 0164
#_1EEFEA: LDY.b #$01
#_1EEFEC: JSL Sprite_ShowMessageUnconditional

#_1EEFF0: INC.w $0D80,X

#_1EEFF3: RTS

.rejected
#_1EEFF4: LDA.b #$61 ; MESSAGE 0161
#_1EEFF6: LDY.b #$01
#_1EEFF8: JSL Sprite_ShowMessageUnconditional

#_1EEFFC: STZ.w $0D80,X

#_1EEFFF: RTS

;===================================================================================================

ChestGameGuy_ProctorGame:
#_1EF000: LDA.w $04C4
#_1EF003: BNE .credits_remaining

#_1EF005: LDA.b #$63 ; MESSAGE 0163
#_1EF007: LDY.b #$01
#_1EF009: JSL Sprite_ShowSolicitedMessage

#_1EF00D: RTS

.credits_remaining
#_1EF00E: LDA.b #$7F ; MESSAGE 017F
#_1EF010: LDY.b #$01
#_1EF012: JSL Sprite_ShowSolicitedMessage

#_1EF016: RTS

;===================================================================================================

NiceThief_Animate:
#_1EF017: LDA.b $1A
#_1EF019: AND.b #$03
#_1EF01B: BNE .dont_turn_head

#_1EF01D: LDA.b #$02
#_1EF01F: STA.w $0DC0,X

#_1EF022: JSR Sprite_DirectionToFaceLink_Bank1E

#_1EF025: CPY.b #$03
#_1EF027: BNE .dont_face_up

#_1EF029: LDY.b #$02

.dont_face_up
#_1EF02B: TYA
#_1EF02C: STA.w $0EB0,X

.dont_turn_head
#_1EF02F: JSL SpriteDraw_AllocateOAMDeferToPlayer_long
#_1EF033: JSL SpriteDraw_Thief

#_1EF037: RTS

;===================================================================================================

NiceThiefWithGift:
#_1EF038: JSR NiceThief_Animate
#_1EF03B: JSR Sprite_CheckIfActive_Bank1E
#_1EF03E: JSL Sprite_BehaveAsBarrier

#_1EF042: LDA.w $0D80,X
#_1EF045: JSL JumpTableLocal
#_1EF049: dw NiceThiefWithGift_WaitForInteraction
#_1EF04B: dw NiceThiefWithGift_GiveRupees
#_1EF04D: dw NiceThiefWithGift_ResetAI

NiceThiefWithGift_WaitForInteraction:
#_1EF04F: LDA.b #$76 ; MESSAGE 0176
#_1EF051: LDY.b #$01
#_1EF053: JSL Sprite_ShowSolicitedMessage
#_1EF057: BCC .exit

#_1EF059: INC.w $0D80,X

.exit
#_1EF05C: RTS

;===================================================================================================

NiceThiefWithGift_GiveRupees:
#_1EF05D: LDA.w $0403
#_1EF060: AND.b #$40
#_1EF062: BNE NiceThiefWithGift_ResetAI

#_1EF064: LDA.w $0403
#_1EF067: ORA.b #$40
#_1EF069: STA.w $0403

#_1EF06C: INC.w $0D80,X

#_1EF06F: LDY.b #$46 ; ITEMGET 46
#_1EF071: JMP.w ShopItem_HandleReceipt

;===================================================================================================

NiceThiefWithGift_ResetAI:
#_1EF074: STZ.w $0D80,X

#_1EF077: RTS

;===================================================================================================

MiniChestGameGuy:
#_1EF078: JSR Sprite_DirectionToFaceLink_Bank1E
#_1EF07B: TYA
#_1EF07C: EOR.b #$03
#_1EF07E: STA.w $0DE0,X

#_1EF081: STZ.w $0DC0,X

#_1EF084: JSL SpriteDraw_YoungGameGuy
#_1EF088: JSR Sprite_CheckIfActive_Bank1E
#_1EF08B: JSL Sprite_BehaveAsBarrier

#_1EF08F: LDA.w $0D80,X
#_1EF092: JSL JumpTableLocal
#_1EF096: dw MiniChestGameGuy_OfferGame
#_1EF098: dw MiniChestGameGuy_VerifyPurchase
#_1EF09A: dw LesserChestGameGuy_AfterGameStart

;===================================================================================================

MiniChestGameGuy_OfferGame:
#_1EF09C: LDA.w $04C4
#_1EF09F: DEC A
#_1EF0A0: CMP.b #$02
#_1EF0A2: BCC EXIT_1EF0B1

#_1EF0A4: LDA.b #$7E ; MESSAGE 017E
#_1EF0A6: LDY.b #$01
#_1EF0A8: JSL Sprite_ShowSolicitedMessage
#_1EF0AC: BCC EXIT_1EF0B1

#_1EF0AE: INC.w $0D80,X

;---------------------------------------------------------------------------------------------------

#EXIT_1EF0B1:
#_1EF0B1: RTS

;===================================================================================================

MiniChestGameGuy_VerifyPurchase:
#_1EF0B2: LDA.w $1CE8
#_1EF0B5: BNE .rejected

#_1EF0B7: LDA.b #$14
#_1EF0B9: LDY.b #$00
#_1EF0BB: JSR ShopItem_HandleCost
#_1EF0BE: BCC .rejected

#_1EF0C0: LDA.b #$01
#_1EF0C2: STA.w $04C4

#_1EF0C5: LDA.b #$7F ; MESSAGE 017F
#_1EF0C7: LDY.b #$01
#_1EF0C9: JSL Sprite_ShowMessageUnconditional

#_1EF0CD: INC.w $0D80,X

#_1EF0D0: RTS

.rejected
#_1EF0D1: LDA.b #$80 ; MESSAGE 0180
#_1EF0D3: LDY.b #$01
#_1EF0D5: JSL Sprite_ShowMessageUnconditional

#_1EF0D9: STZ.w $0D80,X

#_1EF0DC: RTS

;===================================================================================================

pool LesserChestGameGuy_AfterGameStart

.message_low
#_1EF0DD: db $63 ; MESSAGE 0163
#_1EF0DE: db $7F ; MESSAGE 017F

.message_high
#_1EF0DF: db $01
#_1EF0E0: db $01

pool off

;---------------------------------------------------------------------------------------------------

LesserChestGameGuy_AfterGameStart:
#_1EF0E1: LDA.w $04C4
#_1EF0E4: TAY

#_1EF0E5: LDA.w .message_low,Y
#_1EF0E8: XBA

#_1EF0E9: LDA.w .message_high,Y
#_1EF0EC: TAY

#_1EF0ED: XBA

#_1EF0EE: JSL Sprite_ShowSolicitedMessage

#_1EF0F2: RTS

;===================================================================================================

LostWoodsChestGameGuy:
#_1EF0F3: JSR NiceThief_Animate
#_1EF0F6: JSR Sprite_CheckIfActive_Bank1E
#_1EF0F9: JSL Sprite_BehaveAsBarrier

#_1EF0FD: LDA.w $0D80,X
#_1EF100: JSL JumpTableLocal
#_1EF104: dw LostWoodsChestGameGuy_OfferGame
#_1EF106: dw LostWoodsChestGameGuy_VerifyPurchase
#_1EF108: dw LesserChestGameGuy_AfterGameStart

;===================================================================================================

LostWoodsChestGameGuy_OfferGame:
#_1EF10A: LDA.w $04C4
#_1EF10D: DEC A
#_1EF10E: CMP.b #$02
#_1EF110: BCC EXIT_1EF0B1

#_1EF112: LDA.b #$81 ; MESSAGE 0181
#_1EF114: LDY.b #$01
#_1EF116: JSL Sprite_ShowSolicitedMessage
#_1EF11A: BCC .exit

#_1EF11C: INC.w $0D80,X

.exit
#_1EF11F: RTS

;===================================================================================================

LostWoodsChestGameGuy_VerifyPurchase:
#_1EF120: LDA.w $1CE8
#_1EF123: BNE .rejected

#_1EF125: LDA.b #$64
#_1EF127: LDY.b #$00
#_1EF129: JSR ShopItem_HandleCost
#_1EF12C: BCC .rejected

#_1EF12E: LDA.b #$01
#_1EF130: STA.w $04C4

#_1EF133: LDA.b #$7F ; MESSAGE 017F
#_1EF135: LDY.b #$01
#_1EF137: JSL Sprite_ShowMessageUnconditional

#_1EF13B: INC.w $0D80,X

#_1EF13E: RTS

.rejected
#_1EF13F: LDA.b #$80 ; MESSAGE 0180
#_1EF141: LDY.b #$01
#_1EF143: JSL Sprite_ShowMessageUnconditional

#_1EF147: STZ.w $0D80,X

#_1EF14A: RTS

;===================================================================================================

pool NiceThiefUnderRock

.message_low
#_1EF14B: db $77 ; MESSAGE 0177
#_1EF14C: db $78 ; MESSAGE 0178

.message_high
#_1EF14D: db $01
#_1EF14E: db $01

pool off

;---------------------------------------------------------------------------------------------------

NiceThiefUnderRock:
#_1EF14F: JSR NiceThief_Animate
#_1EF152: JSR Sprite_CheckIfActive_Bank1E
#_1EF155: JSL Sprite_BehaveAsBarrier

#_1EF159: LDA.w $0E80,X
#_1EF15C: SEC
#_1EF15D: SBC.b #$05
#_1EF15F: TAY

#_1EF160: LDA.w .message_low,Y
#_1EF163: XBA

#_1EF164: LDA.w .message_high,Y
#_1EF167: TAY

#_1EF168: XBA

#_1EF169: JSL Sprite_ShowSolicitedMessage

#_1EF16D: RTS

;===================================================================================================

ShopItem_RedPotion150:
#_1EF16E: JSR SpriteDraw_ShopItem
#_1EF171: JSR Sprite_CheckIfActive_Bank1E
#_1EF174: JSL Sprite_BehaveAsBarrier
#_1EF178: JSR ShopItem_CheckForAPress
#_1EF17B: BCC .exit

#_1EF17D: JSL FindEmptyBottle
#_1EF181: BMI .no_empty_bottle

#_1EF183: LDA.b #$96
#_1EF185: LDY.b #$00
#_1EF187: JSR ShopItem_HandleCost
#_1EF18A: BCC ShopItem_GiveFailureMessage

#_1EF18C: STZ.w $0DD0,X

#_1EF18F: LDY.b #$2E ; ITEMGET 2E
#_1EF191: JSR ShopItem_HandleReceipt

.exit
#_1EF194: RTS

.no_empty_bottle
#_1EF195: LDA.b #$6D ; MESSAGE 016D
#_1EF197: LDY.b #$01
#_1EF199: JSL Sprite_ShowMessageUnconditional

#_1EF19D: JSR ShopItem_PlayBeep

#_1EF1A0: RTS

;===================================================================================================

ShopItem_GiveFailureMessage:
#_1EF1A1: LDA.b #$7C ; MESSAGE 017C
#_1EF1A3: LDY.b #$01
#_1EF1A5: JSL Sprite_ShowMessageUnconditional

#_1EF1A9: JSR ShopItem_PlayBeep

#_1EF1AC: RTS

;===================================================================================================

pool ShopKeeper_SpawnShopItem

.offset_x
#_1EF1AD: dw -44,   8,  60

pool off

;---------------------------------------------------------------------------------------------------

ShopKeeper_SpawnShopItem:
#_1EF1B3: PHA
#_1EF1B4: PHY

#_1EF1B5: LDA.b #$BB ; SPRITE BB
#_1EF1B7: LDY.b #$0C
#_1EF1B9: JSL Sprite_SpawnDynamically_slot_limited

#_1EF1BD: PLA
#_1EF1BE: STA.w $0E80,Y
#_1EF1C1: STA.w $0BA0,Y

#_1EF1C4: PLA
#_1EF1C5: PHX

#_1EF1C6: ASL A
#_1EF1C7: TAX

#_1EF1C8: LDA.b $00
#_1EF1CA: CLC
#_1EF1CB: ADC.l .offset_x+0,X
#_1EF1CF: STA.w $0D10,Y

#_1EF1D2: LDA.b $01
#_1EF1D4: ADC.l .offset_x+1,X
#_1EF1D8: STA.w $0D30,Y

#_1EF1DB: LDA.b $02
#_1EF1DD: CLC
#_1EF1DE: ADC.b #$27
#_1EF1E0: STA.w $0D00,Y

#_1EF1E3: LDA.b $03
#_1EF1E5: STA.w $0D20,Y

#_1EF1E8: LDA.w $0E40,Y
#_1EF1EB: ORA.b #$04
#_1EF1ED: STA.w $0E40,Y

#_1EF1F0: PLX

#_1EF1F1: RTL

;===================================================================================================

ShopItem_FighterShield:
#_1EF1F2: JSR SpriteDraw_ShopItem

#_1EF1F5: JSR Sprite_CheckIfActive_Bank1E
#_1EF1F8: JSL Sprite_BehaveAsBarrier

#_1EF1FC: JSR ShopItem_MakeShieldsDeflect
#_1EF1FF: JSR ShopItem_CheckForAPress
#_1EF202: BCC .set_hitbox

#_1EF204: LDA.l $7EF35A
#_1EF208: BNE RejectShieldPurchase

#_1EF20A: LDA.b #$32
#_1EF20C: LDY.b #$00
#_1EF20E: JSR ShopItem_HandleCost
#_1EF211: BCC TooPoorForAShield

#_1EF213: STZ.w $0DD0,X

#_1EF216: LDY.b #$04 ; ITEMGET 04
#_1EF218: JSR ShopItem_HandleReceipt

.set_hitbox
#_1EF21B: LDA.b #$1C
#_1EF21D: STA.w $0F60,X

#_1EF220: RTS

;===================================================================================================

RejectShieldPurchase:
#_1EF221: LDA.b #$66 ; MESSAGE 0166
#_1EF223: LDY.b #$01
#_1EF225: JSL Sprite_ShowMessageUnconditional

#_1EF229: JSR ShopItem_PlayBeep

#_1EF22C: RTS

;===================================================================================================

TooPoorForAShield:
#_1EF22D: JMP.w ShopItem_GiveFailureMessage

;===================================================================================================

ShopItem_FireShield:
#_1EF230: JSR SpriteDraw_ShopItem
#_1EF233: JSR Sprite_CheckIfActive_Bank1E
#_1EF236: JSL Sprite_BehaveAsBarrier

#_1EF23A: JSR ShopItem_MakeShieldsDeflect
#_1EF23D: JSR ShopItem_CheckForAPress
#_1EF240: BCC .set_hitbox

#_1EF242: LDA.l $7EF35A
#_1EF246: CMP.b #$02
#_1EF248: BCS RejectShieldPurchase

#_1EF24A: LDA.b #$F4
#_1EF24C: LDY.b #$01
#_1EF24E: JSR ShopItem_HandleCost
#_1EF251: BCC TooPoorForAShield

#_1EF253: STZ.w $0DD0,X

#_1EF256: LDY.b #$05 ; ITEMGET 05
#_1EF258: JSR ShopItem_HandleReceipt

.set_hitbox
#_1EF25B: LDA.b #$1C
#_1EF25D: STA.w $0F60,X

#_1EF260: RTS

;===================================================================================================

ShopItem_MakeShieldsDeflect:
#_1EF261: STZ.w $0BA0,X

#_1EF264: LDA.b #$08
#_1EF266: STA.w $0B6B,X

#_1EF269: LDA.b #$04
#_1EF26B: STA.w $0CAA,X

#_1EF26E: LDA.b #$1C
#_1EF270: STA.w $0F60,X

#_1EF273: JSL Sprite_CheckDamageFromLink_long

#_1EF277: LDA.b #$0A
#_1EF279: STA.w $0F60,X

#_1EF27C: RTS

;===================================================================================================

ShopItem_Heart:
#_1EF27D: JSR SpriteDraw_ShopItem

#_1EF280: JSR Sprite_CheckIfActive_Bank1E
#_1EF283: JSL Sprite_BehaveAsBarrier

#_1EF287: JSR ShopItem_CheckForAPress
#_1EF28A: BCC .exit

#_1EF28C: LDA.l $7EF36C
#_1EF290: CMP.l $7EF36D
#_1EF294: BEQ .too_much_health

#_1EF296: LDA.b #$0A
#_1EF298: LDY.b #$00
#_1EF29A: JSR ShopItem_HandleCost
#_1EF29D: BCC .too_poor

#_1EF29F: STZ.w $0DD0,X

#_1EF2A2: LDY.b #$42 ; ITEMGET 42
#_1EF2A4: JSR ShopItem_HandleReceipt

.exit
#_1EF2A7: RTS

.too_much_health
#_1EF2A8: JSR ShopItem_PlayBeep

#_1EF2AB: RTS

.too_poor
#_1EF2AC: JMP.w ShopItem_GiveFailureMessage

;===================================================================================================

ShopItem_Arrows:
#_1EF2AF: JSR SpriteDraw_ShopItem
#_1EF2B2: JSR Sprite_CheckIfActive_Bank1E
#_1EF2B5: JSL Sprite_BehaveAsBarrier

#_1EF2B9: JSR ShopItem_CheckForAPress
#_1EF2BC: BCC .exit

#_1EF2BE: LDA.l $7EF371

#_1EF2C2: PHX

#_1EF2C3: TAX

#_1EF2C4: LDA.l CapacityUpgrades_arrows_hex,X

#_1EF2C8: PLX

#_1EF2C9: CMP.l $7EF377
#_1EF2CD: BEQ TooMuchAmmo

#_1EF2CF: LDA.b #$1E
#_1EF2D1: LDY.b #$00
#_1EF2D3: JSR ShopItem_HandleCost
#_1EF2D6: BCC RejectMunitionsPurchase

#_1EF2D8: STZ.w $0DD0,X

#_1EF2DB: LDY.b #$44 ; ITEMGET 44
#_1EF2DD: JSR ShopItem_HandleReceipt

.exit
#_1EF2E0: RTS

;===================================================================================================

TooMuchAmmo:
#_1EF2E1: LDA.b #$6E ; MESSAGE 016E
#_1EF2E3: LDY.b #$01
#_1EF2E5: JSL Sprite_ShowSolicitedMessage

#_1EF2E9: JSR ShopItem_PlayBeep

#_1EF2EC: RTS

;===================================================================================================

RejectMunitionsPurchase:
#_1EF2ED: JMP.w ShopItem_GiveFailureMessage

;===================================================================================================

ShopItem_Bombs:
#_1EF2F0: JSR SpriteDraw_ShopItem
#_1EF2F3: JSR Sprite_CheckIfActive_Bank1E
#_1EF2F6: JSL Sprite_BehaveAsBarrier

#_1EF2FA: JSR ShopItem_CheckForAPress
#_1EF2FD: BCC .exit

#_1EF2FF: LDA.l $7EF370
#_1EF303: PHX
#_1EF304: TAX

#_1EF305: LDA.l CapacityUpgrades_bombs_hex,X

#_1EF309: PLX

#_1EF30A: CMP.l $7EF343
#_1EF30E: BEQ TooMuchAmmo

#_1EF310: LDA.b #$32
#_1EF312: LDY.b #$00
#_1EF314: JSR ShopItem_HandleCost
#_1EF317: BCC RejectMunitionsPurchase

#_1EF319: STZ.w $0DD0,X

#_1EF31C: LDY.b #$31 ; ITEMGET 31
#_1EF31E: JSR ShopItem_HandleReceipt

.exit
#_1EF321: RTS

;===================================================================================================

ShopItem_Bee:
#_1EF322: JSR SpriteDraw_ShopItem
#_1EF325: JSR Sprite_CheckIfActive_Bank1E
#_1EF328: JSL Sprite_BehaveAsBarrier

#_1EF32C: JSR ShopItem_CheckForAPress
#_1EF32F: BCC .exit

#_1EF331: JSL FindEmptyBottle
#_1EF335: BMI .no_empty_bottle

#_1EF337: LDA.b #$0A
#_1EF339: LDY.b #$00
#_1EF33B: JSR ShopItem_HandleCost
#_1EF33E: BCC .too_poor

#_1EF340: STZ.w $0DD0,X

#_1EF343: LDY.b #$0E ; ITEMGET 0E
#_1EF345: JSR ShopItem_HandleReceipt

.exit
#_1EF348: RTS

.no_empty_bottle
#_1EF349: LDA.b #$6D ; MESSAGE 016D
#_1EF34B: LDY.b #$01
#_1EF34D: JSL Sprite_ShowMessageUnconditional

#_1EF351: JSR ShopItem_PlayBeep

#_1EF354: RTS

.too_poor
#_1EF355: JMP.w ShopItem_GiveFailureMessage

;===================================================================================================

pool ShopItem_HandleReceipt

.message_low
#_1EF358: db $68 ; MESSAGE 0168
#_1EF359: db $67 ; MESSAGE 0167
#_1EF35A: db $67 ; MESSAGE 0167
#_1EF35B: db $6C ; MESSAGE 016C
#_1EF35C: db $69 ; MESSAGE 0169
#_1EF35D: db $6A ; MESSAGE 016A
#_1EF35E: db $6B ; MESSAGE 016B

.message_high
#_1EF35F: db $01
#_1EF360: db $01
#_1EF361: db $01
#_1EF362: db $01
#_1EF363: db $01
#_1EF364: db $01
#_1EF365: db $01

pool off

;---------------------------------------------------------------------------------------------------

ShopItem_HandleReceipt:
#_1EF366: STZ.w $02E9

#_1EF369: PHX

#_1EF36A: JSL Link_ReceiveItem

#_1EF36E: PLX

#_1EF36F: LDA.w $0E80,X
#_1EF372: SEC
#_1EF373: SBC.b #$07
#_1EF375: BMI .exit

#_1EF377: TAY

#_1EF378: LDA.w .message_low,Y
#_1EF37B: XBA

#_1EF37C: LDA.w .message_high,Y
#_1EF37F: TAY

#_1EF380: XBA

#_1EF381: JSL Sprite_ShowMessageUnconditional
#_1EF385: JSL RushToTerminateReceiveItem

.exit
#_1EF389: RTS

;===================================================================================================

ShopItem_PlayBeep:
#_1EF38A: LDA.b #$3C ; SFX2.3C
#_1EF38C: JSL SpriteSFX_QueueSFX2WithPan

#_1EF390: RTS

;===================================================================================================

ShopItem_CheckForAPress:
#_1EF391: LDA.b $F6
#_1EF393: BPL .no_interaction

#_1EF395: JSL Sprite_CheckDamageToLink_same_layer_long

#_1EF399: BCC .no_interaction

#_1EF39B: RTS

.no_interaction
#_1EF39C: CLC

#_1EF39D: RTS

;===================================================================================================

ShopItem_HandleCost:
#_1EF39E: STA.b $00
#_1EF3A0: STY.b $01

#_1EF3A2: REP #$20

#_1EF3A4: LDA.l $7EF360
#_1EF3A8: CMP.b $00
#_1EF3AA: BCC .too_poor

#_1EF3AC: SBC.b $00
#_1EF3AE: STA.l $7EF360

#_1EF3B2: SEC

.too_poor
#_1EF3B3: SEP #$30

#_1EF3B5: RTS

;===================================================================================================

pool SpriteDraw_ShopItem

.oam_groups
#_1EF3B6: dw  -4,  16 : db $31, $02, $00, $00 ; 1
#_1EF3BE: dw   4,  16 : db $13, $02, $00, $00 ; 5
#_1EF3C6: dw  12,  16 : db $30, $02, $00, $00 ; 0
#_1EF3CE: dw   0,   0 : db $C0, $02, $00, $02 ; item
#_1EF3D6: dw   0,  11 : db $6C, $03, $00, $02 ; shadow

#_1EF3DE: dw   0,  16 : db $13, $02, $00, $00 ; 5
#_1EF3E6: dw   0,  16 : db $13, $02, $00, $00 ; 5
#_1EF3EE: dw   8,  16 : db $30, $02, $00, $00 ; 0
#_1EF3F6: dw   0,   0 : db $CE, $04, $00, $02 ; item
#_1EF3FE: dw   4,  12 : db $38, $03, $00, $00 ; shadow

#_1EF406: dw  -4,  16 : db $13, $02, $00, $00 ; 5
#_1EF40E: dw   4,  16 : db $30, $02, $00, $00 ; 0
#_1EF416: dw  12,  16 : db $30, $02, $00, $00 ; 0
#_1EF41E: dw   0,   0 : db $CC, $08, $00, $02 ; item
#_1EF426: dw   4,  12 : db $38, $03, $00, $00 ; shadow

#_1EF42E: dw   0,  16 : db $31, $02, $00, $00 ; 1
#_1EF436: dw   0,  16 : db $31, $02, $00, $00 ; 1
#_1EF43E: dw   8,  16 : db $30, $02, $00, $00 ; 0
#_1EF446: dw   4,   8 : db $29, $03, $00, $00 ; item
#_1EF44E: dw   4,  11 : db $38, $03, $00, $00 ; shadow

#_1EF456: dw  -4,  16 : db $03, $02, $00, $00 ; 3
#_1EF45E: dw  -4,  16 : db $03, $02, $00, $00 ; 3
#_1EF466: dw   4,  16 : db $30, $02, $00, $00 ; 0
#_1EF46E: dw   0,   0 : db $C4, $04, $00, $02 ; item
#_1EF476: dw   0,  11 : db $38, $03, $00, $00 ; shadow

#_1EF47E: dw   0,  16 : db $13, $02, $00, $00 ; 5
#_1EF486: dw   0,  16 : db $13, $02, $00, $00 ; 5
#_1EF48E: dw   8,  16 : db $30, $02, $00, $00 ; 0
#_1EF496: dw   0,   0 : db $E8, $04, $00, $02 ; item
#_1EF49E: dw   0,  11 : db $6C, $03, $00, $02 ; shadow

#_1EF4A6: dw   0,  16 : db $31, $02, $00, $00 ; 1
#_1EF4AE: dw   0,  16 : db $31, $02, $00, $00 ; 1
#_1EF4B6: dw   8,  16 : db $30, $02, $00, $00 ; 0
#_1EF4BE: dw   4,   8 : db $F4, $0F, $00, $00 ; item
#_1EF4C6: dw   4,  11 : db $38, $03, $00, $00 ; shadow

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_ShopItem:
#_1EF4CE: LDA.w $0E80,X
#_1EF4D1: SEC
#_1EF4D2: SBC.b #$07

#_1EF4D4: REP #$20

#_1EF4D6: AND.w #$00FF
#_1EF4D9: STA.b $00

#_1EF4DB: ASL A
#_1EF4DC: ASL A
#_1EF4DD: ADC.b $00

#_1EF4DF: ASL A
#_1EF4E0: ASL A
#_1EF4E1: ASL A
#_1EF4E2: ADC.w #.oam_groups
#_1EF4E5: STA.b $08

#_1EF4E7: LDA.w #$0005
#_1EF4EA: STA.b $06

#_1EF4EC: SEP #$30

#_1EF4EE: JSL SpriteDraw_Tabulated_player_deferred

#_1EF4F2: RTS

;===================================================================================================

Sprite_BehaveAsBarrier:
#_1EF4F3: LDA.w $0F60,X
#_1EF4F6: PHA

#_1EF4F7: STZ.w $0F60,X

#_1EF4FA: JSL Sprite_CheckDamageToLink_same_layer_long
#_1EF4FE: BCC .no_collision

#_1EF500: JSR Sprite_HaltAllMovement

.no_collision
#_1EF503: PLA
#_1EF504: STA.w $0F60,X

#_1EF507: RTL

;===================================================================================================

Sprite_HaltAllMovement:
#_1EF508: PHX

#_1EF509: JSL Sprite_CancelHookshot

#_1EF50D: STZ.b $5E

#_1EF50F: JSL Link_CancelDash_long

#_1EF513: PLX

#_1EF514: RTS

;===================================================================================================

Sprite_AC_Apple:
#_1EF515: LDA.w $0D80,X
#_1EF518: BNE Apple

;===================================================================================================

ApplesInTree:
#_1EF51A: LDA.w $0E90,X
#_1EF51D: BNE .exit

#_1EF51F: STZ.w $0DD0,X

#_1EF522: JSL GetRandomNumber
#_1EF526: AND.b #$03
#_1EF528: CLC

#_1EF529: ADC.b #$02
#_1EF52B: TAY

.next_apple
#_1EF52C: PHY

#_1EF52D: JSR SpawnApple

#_1EF530: PLY
#_1EF531: DEY
#_1EF532: BPL .next_apple

.exit
#_1EF534: RTS

;===================================================================================================

SpawnApple:
#_1EF535: LDA.b #$AC ; SPRITE AC
#_1EF537: JSL Sprite_SpawnDynamically
#_1EF53B: BMI .exit

#_1EF53D: JSL Sprite_SetSpawnedCoordinates

#_1EF541: LDA.b #$01
#_1EF543: STA.w $0D80,Y

#_1EF546: LDA.b #$FF
#_1EF548: STA.w $0D90,Y

#_1EF54B: LDA.b #$08
#_1EF54D: STA.w $0F70,Y

#_1EF550: LDA.b #$16
#_1EF552: STA.w $0F80,Y

#_1EF555: JSL GetRandomNumber
#_1EF559: STA.b $04

#_1EF55B: LDA.b $01
#_1EF55D: STA.b $05

#_1EF55F: JSL GetRandomNumber
#_1EF563: STA.b $06

#_1EF565: LDA.b $03
#_1EF567: STA.b $07

#_1EF569: LDA.b #$0A
#_1EF56B: JSL Sprite_ProjectSpeedTowardsLocation_long

#_1EF56F: LDA.b $00
#_1EF571: STA.w $0D40,Y

#_1EF574: LDA.b $01
#_1EF576: STA.w $0D50,Y

.exit
#_1EF579: RTS

;===================================================================================================

pool Apple

.speed
#_1EF57A: db -1,  1

pool off

;---------------------------------------------------------------------------------------------------

Apple:
#_1EF57C: LDA.w $0D90,X
#_1EF57F: CMP.b #$10
#_1EF581: BCS .no_flicker

#_1EF583: LDA.b $1A
#_1EF585: AND.b #$02
#_1EF587: BEQ .flicker_off

.no_flicker
#_1EF589: JSL SpriteDraw_SingleLarge_long

.flicker_off
#_1EF58D: JSR Sprite_CheckIfActive_Bank1E

#_1EF590: LDA.w $0D90,X
#_1EF593: BEQ .rot

#_1EF595: JSR Sprite_Move_XYZ_Bank1E
#_1EF598: JSR Sprite_CheckDamageToLink_Bank1E
#_1EF59B: BCC .not_collected

#_1EF59D: LDA.b #$0B ; SFX3.0B
#_1EF59F: JSL SpriteSFX_QueueSFX3WithPan

#_1EF5A3: LDA.l $7EF372
#_1EF5A7: CLC
#_1EF5A8: ADC.b #$08
#_1EF5AA: STA.l $7EF372

.rot
#_1EF5AE: STZ.w $0DD0,X

#_1EF5B1: RTS

;---------------------------------------------------------------------------------------------------

.not_collected
#_1EF5B2: LDA.b $1A
#_1EF5B4: AND.b #$01
#_1EF5B6: BNE .dont_tick_timer

#_1EF5B8: DEC.w $0D90,X

.dont_tick_timer
#_1EF5BB: LDA.w $0F70,X
#_1EF5BE: DEC A
#_1EF5BF: BPL .airborne

#_1EF5C1: STZ.w $0F70,X

#_1EF5C4: LDA.w $0F80,X
#_1EF5C7: BMI .hit_ground

#_1EF5C9: LDA.b #$00

;---------------------------------------------------------------------------------------------------

.hit_ground
#_1EF5CB: EOR.b #$FF
#_1EF5CD: INC A
#_1EF5CE: LSR A
#_1EF5CF: STA.w $0F80,X

#_1EF5D2: LDA.w $0D50,X
#_1EF5D5: BEQ .x_speed_at_0

#_1EF5D7: PHA

#_1EF5D8: ASL A
#_1EF5D9: LDA.b #$00
#_1EF5DB: ROL A
#_1EF5DC: TAY

#_1EF5DD: PLA
#_1EF5DE: CLC
#_1EF5DF: ADC.w .speed,Y
#_1EF5E2: STA.w $0D50,X

.x_speed_at_0
#_1EF5E5: LDA.w $0D40,X
#_1EF5E8: BEQ .exit

#_1EF5EA: PHA

#_1EF5EB: ASL A
#_1EF5EC: LDA.b #$00
#_1EF5EE: ROL A
#_1EF5EF: TAY

#_1EF5F0: PLA
#_1EF5F1: CLC
#_1EF5F2: ADC.w .speed,Y
#_1EF5F5: STA.w $0D40,X

.exit
#_1EF5F8: RTS

;---------------------------------------------------------------------------------------------------

.airborne
#_1EF5F9: LDA.w $0F80,X
#_1EF5FC: SEC
#_1EF5FD: SBC.b #$01
#_1EF5FF: STA.w $0F80,X

#_1EF602: RTS

;===================================================================================================

Sprite_BC_Drunkard:
#_1EF603: JSL SpriteDraw_Drunkard
#_1EF607: JSR Sprite_CheckIfActive_Bank1E
#_1EF60A: JSL Sprite_BehaveAsBarrier
#_1EF60E: JSL GetRandomNumber
#_1EF612: BNE .skip_timer

#_1EF614: LDA.b #$20
#_1EF616: STA.w $0DF0,X

.skip_timer
#_1EF619: STZ.w $0DC0,X

#_1EF61C: LDA.w $0DF0,X
#_1EF61F: BEQ .animating

#_1EF621: INC.w $0DC0,X

.animating
#_1EF624: LDA.b #$75 ; MESSAGE 0175
#_1EF626: LDY.b #$01
#_1EF628: JSL Sprite_ShowSolicitedMessage
#_1EF62C: BCC .exit

#_1EF62E: STZ.w $0DC0,X

.exit
#_1EF631: RTS

;===================================================================================================

Pipe_LocatePath:
#_1EF632: LDA.b #$FF
#_1EF634: STA.w $1DE0

#_1EF637: LDA.w $0E20,X
#_1EF63A: SEC
#_1EF63B: SBC.b #$AE
#_1EF63D: STA.w $0DE0,X

;===================================================================================================

SomariaPlatform_LocatePath:

.next
#_1EF640: JSR SomariaPlatformAndPipe_CheckTile

#_1EF643: STA.w $0E90,X

#_1EF646: SEC
#_1EF647: SBC.b #$B0 ; TILETYPE B0
#_1EF649: BCS .upper_tile

.not_pipe
#_1EF64B: LDA.w $0D10,X
#_1EF64E: CLC
#_1EF64F: ADC.b #$08
#_1EF651: STA.w $0D10,X

#_1EF654: LDA.w $0D30,X
#_1EF657: ADC.b #$00
#_1EF659: STA.w $0D30,X

#_1EF65C: LDA.w $0D00,X
#_1EF65F: CLC
#_1EF660: ADC.b #$08
#_1EF662: STA.w $0D00,X

#_1EF665: LDA.w $0D20,X
#_1EF668: ADC.b #$00
#_1EF66A: STA.w $0D20,X

#_1EF66D: BRA .next

;---------------------------------------------------------------------------------------------------

.upper_tile
#_1EF66F: CMP.b #$0F ; TILETYPE BF
#_1EF671: BCS .not_pipe

#_1EF673: LDA.w $0D10,X
#_1EF676: AND.b #$F8
#_1EF678: CLC
#_1EF679: ADC.b #$04
#_1EF67B: STA.w $0D10,X

#_1EF67E: LDA.w $0D00,X
#_1EF681: AND.b #$F8
#_1EF683: CLC
#_1EF684: ADC.b #$04
#_1EF686: STA.w $0D00,X

#_1EF689: LDA.w $0DE0,X
#_1EF68C: STA.w $0EB0,X

#_1EF68F: JSR SomariaPlatformAndPipe_HandleMovement

#_1EF692: INC.w $0BA0,X

#_1EF695: STZ.w $02F5

#_1EF698: LDA.b #$0E
#_1EF69A: STA.w $0F10,X

#_1EF69D: INC.w $0DC0,X

#_1EF6A0: RTS

;===================================================================================================

SomariaPlatformAndPipe:
#_1EF6A1: PHB
#_1EF6A2: PHK
#_1EF6A3: PLB

#_1EF6A4: JSR .main

#_1EF6A7: PLB

#_1EF6A8: RTL

;---------------------------------------------------------------------------------------------------

.speed_x
#_1EF6A9: db   0,   0, -16,  16
#_1EF6AD: db -16,  16,  16

.speed_y
#_1EF6B0: db -16,  16,   0,   0
#_1EF6B4: db -16,  16, -16,  16

;---------------------------------------------------------------------------------------------------

.drag_x_high
#_1EF6B8: db   0,   0,  -1,   0,  -1

.drag_x_low
#_1EF6BD: db   0,   0,  -1,   1,  -1,   1,   1

.drag_y_low
#_1EF6C4: db  -1,   1,   0,   0,  -1,   1,  -1,   1

.drag_y_high
#_1EF6CC: db  -1,   0,   0,   0,  -1,   0,  -1,   0

;---------------------------------------------------------------------------------------------------

.main
#_1EF6D4: LDA.w $0DC0,X
#_1EF6D7: JSL JumpTableLocal
#_1EF6DB: dw SomariaPlatform_Spawn
#_1EF6DD: dw SomariaPlatformAndPipe_Main

;===================================================================================================

SomariaPlatform_Spawn:
#_1EF6DF: JSR SomariaPlatform_LocatePath
#_1EF6E2: JSL Sprite_SpawnSuperficialBombBlast

#_1EF6E6: LDA.w $0D10,Y
#_1EF6E9: SEC
#_1EF6EA: SBC.b #$08
#_1EF6EC: STA.w $0D10,Y

#_1EF6EF: LDA.w $0D30,Y
#_1EF6F2: SBC.b #$00
#_1EF6F4: STA.w $0D30,Y

#_1EF6F7: LDA.w $0D00,Y
#_1EF6FA: SEC
#_1EF6FB: SBC.b #$08
#_1EF6FD: STA.w $0D00,Y

#_1EF700: LDA.w $0D20,Y
#_1EF703: SBC.b #$00
#_1EF705: STA.w $0D20,Y

#_1EF708: RTS

;===================================================================================================

SomariaPlatformAndPipe_Main:
#_1EF709: JSR SpriteDraw_SomariaPlatform
#_1EF70C: JSR Sprite_CheckIfActive_Bank1E

#_1EF70F: LDA.w $0B7C
#_1EF712: ORA.w $0B7D
#_1EF715: ORA.w $0B7E
#_1EF718: ORA.w $0B7F
#_1EF71B: BEQ .not_dragging

.is_inactive
#_1EF71D: JMP.w SomariaPlatform_Inactive

.not_dragging
#_1EF720: LDA.b $5B
#_1EF722: DEC A
#_1EF723: DEC A
#_1EF724: BPL .is_inactive

#_1EF726: JSL Sprite_CheckDamageToLink_ignore_layer_long
#_1EF72A: BCC SomariaPlatform_Inactive

#_1EF72C: LDA.b #$01
#_1EF72E: STA.w $0DB0,X
#_1EF731: JSL Link_CancelDash_long

#_1EF735: LDA.b $5D
#_1EF737: CMP.b #$13 ; LINKSTATE 13
#_1EF739: BEQ SomariaPlatform_Inactive

#_1EF73B: CMP.b #$03 ; LINKSTATE 03
#_1EF73D: BEQ SomariaPlatform_Inactive

#_1EF73F: LDA.w $0D80,X
#_1EF742: BNE SomariaPlatformAndPipe_HandleMovement

#_1EF744: INC.w $0D90,X

#_1EF747: LDA.b #$02
#_1EF749: STA.w $02F5

#_1EF74C: LDA.w $0D90,X
#_1EF74F: AND.b #$07
#_1EF751: BNE .skip_movement

#_1EF753: JSR SomariaPlatformAndPipe_CheckTile

#_1EF756: CMP.w $0E90,X
#_1EF759: BEQ .skip_movement

#_1EF75B: STA.w $0E90,X

#_1EF75E: LDA.w $0DE0,X
#_1EF761: STA.w $0EB0,X

#_1EF764: JSR SomariaPlatformAndPipe_HandleMovement
#_1EF767: JSR SomariaPlatform_HandleDrag

.skip_movement
#_1EF76A: LDA.b $A0
#_1EF76C: CMP.b #$24 ; ROOM 0024
#_1EF76E: BEQ .not_big_chest

#_1EF770: LDY.w $0DE0,X

#_1EF773: LDA.w SomariaPlatformAndPipe_drag_x_low,Y
#_1EF776: CLC
#_1EF777: ADC.w $0B7C
#_1EF77A: STA.w $0B7C

#_1EF77D: LDA.w SomariaPlatformAndPipe_drag_x_high,Y
#_1EF780: ADC.w $0B7D
#_1EF783: STA.w $0B7D

#_1EF786: LDA.w SomariaPlatformAndPipe_drag_y_low,Y
#_1EF789: CLC
#_1EF78A: ADC.w $0B7E
#_1EF78D: STA.w $0B7E

#_1EF790: LDA.w SomariaPlatformAndPipe_drag_y_high,Y
#_1EF793: ADC.w $0B7F
#_1EF796: STA.w $0B7F

#_1EF799: JSR Sprite_Move_XY_Bank1E
#_1EF79C: JSR SomariaPlatform_DragLink

#_1EF79F: RTS

.not_big_chest
#_1EF7A0: JMP.w SomariaPlatform_EnableDragging

;===================================================================================================

SomariaPlatform_Inactive:
#_1EF7A3: LDA.w $0DB0,X
#_1EF7A6: BEQ .exit

#_1EF7A8: STZ.w $02F5
#_1EF7AB: STZ.w $0DB0,X

.exit
#_1EF7AE: RTS

;===================================================================================================

SomariaPlatformAndPipe_HandleMovement:
#_1EF7AF: JSR SomariaPlatform_HandleTile

#_1EF7B2: LDY.w $0DE0,X

#_1EF7B5: LDA.w SomariaPlatformAndPipe_speed_x,Y
#_1EF7B8: STA.w $0D50,X

#_1EF7BB: LDA.w SomariaPlatformAndPipe_speed_y,Y
#_1EF7BE: STA.w $0D40,X

#_1EF7C1: RTS

;===================================================================================================

SomariaPlatformAndPipe_CheckTile:
#_1EF7C2: LDA.w $0D00,X
#_1EF7C5: STA.b $00

#_1EF7C7: LDA.w $0D20,X
#_1EF7CA: STA.b $01

#_1EF7CC: LDA.w $0D10,X
#_1EF7CF: STA.b $02

#_1EF7D1: LDA.w $0D30,X
#_1EF7D4: STA.b $03

#_1EF7D6: LDA.b #$00
#_1EF7D8: JSL GetTileType_long

#_1EF7DC: LDA.w $0FA5

#_1EF7DF: RTS

;===================================================================================================

pool SpriteDraw_SomariaPlatform

.oam_groups
#_1EF7E0: dw -16, -16 : db $AC, $00, $00, $02
#_1EF7E8: dw   0, -16 : db $AC, $40, $00, $02
#_1EF7F0: dw -16,   0 : db $AC, $80, $00, $02
#_1EF7F8: dw   0,   0 : db $AC, $C0, $00, $02

#_1EF800: dw -13, -13 : db $AC, $00, $00, $02
#_1EF808: dw  -3, -13 : db $AC, $40, $00, $02
#_1EF810: dw -13,  -3 : db $AC, $80, $00, $02
#_1EF818: dw  -3,  -3 : db $AC, $C0, $00, $02

#_1EF820: dw -10, -10 : db $AC, $00, $00, $02
#_1EF828: dw  -6, -10 : db $AC, $40, $00, $02
#_1EF830: dw -10,  -6 : db $AC, $80, $00, $02
#_1EF838: dw  -6,  -6 : db $AC, $C0, $00, $02

#_1EF840: dw  -8,  -8 : db $AC, $00, $00, $02
#_1EF848: dw  -8,  -8 : db $AC, $40, $00, $02
#_1EF850: dw  -8,  -8 : db $AC, $80, $00, $02
#_1EF858: dw  -8,  -8 : db $AC, $C0, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_SomariaPlatform:
#_1EF860: LDA.b #$10
#_1EF862: JSL SpriteDraw_AllocateOAMFromRegionB

#_1EF866: LDA.w $0F10,X
#_1EF869: AND.b #$0C
#_1EF86B: ASL A
#_1EF86C: ASL A
#_1EF86D: ASL A

#_1EF86E: ADC.b #.oam_groups>>0
#_1EF870: STA.b $08

#_1EF872: LDA.b #.oam_groups>>8
#_1EF874: ADC.b #$00
#_1EF876: STA.b $09

#_1EF878: LDA.b #$04
#_1EF87A: JMP.w SpriteDraw_Tabulated_Bank1E

;===================================================================================================

SomariaPlatform_HandleTile:
#_1EF87D: LDA.w $0E90,X
#_1EF880: SEC
#_1EF881: SBC.b #$B0
#_1EF883: BCS .possibly_valid_tile

#_1EF885: RTS

.possibly_valid_tile
#_1EF886: CMP.b #$0F
#_1EF888: BCC .valid_tile

#_1EF88A: RTS

;---------------------------------------------------------------------------------------------------

.valid_tile
#_1EF88B: JSL JumpTableLocal
#_1EF88F: dw SomariaPlatform_HandleTile_DoNothing
#_1EF891: dw SomariaPlatform_HandleTile_DoNothing
#_1EF893: dw SomariaPlatform_HandleTile_RisingSlope
#_1EF895: dw SomariaPlatform_HandleTile_FallingSlope
#_1EF897: dw SomariaPlatform_HandleTile_FallingSlope
#_1EF899: dw SomariaPlatform_HandleTile_RisingSlope
#_1EF89B: dw SomariaPlatform_HandleTile_TJunctionDLR
#_1EF89D: dw SomariaPlatform_HandleTile_TJunctionULR
#_1EF89F: dw SomariaPlatform_HandleTile_TJunctionUDR
#_1EF8A1: dw SomariaPlatform_HandleTile_TJunctionUDL
#_1EF8A3: dw SomariaPlatform_HandleTile_4WayJunction
#_1EF8A5: dw SomariaPlatform_HandleTile_CrossOver
#_1EF8A7: dw SomariaPlatform_HandleTile_Unknown
#_1EF8A9: dw SomariaPlatform_HandleTile_DoNothing
#_1EF8AB: dw SomariaPlatform_HandleTile_Station

;===================================================================================================

SomariaPlatform_HandleDragX:
#_1EF8AD: LDA.w $0DE0,X
#_1EF8B0: EOR.w $0EB0,X
#_1EF8B3: AND.b #$02
#_1EF8B5: BEQ .exit

#_1EF8B7: LDA.w $0D10,X
#_1EF8BA: AND.b #$F8

#_1EF8BC: CLC
#_1EF8BD: ADC.b #$04
#_1EF8BF: STA.b $00

#_1EF8C1: SEC
#_1EF8C2: SBC.w $0D10,X
#_1EF8C5: BEQ .exit

#_1EF8C7: STA.w $0B7C
#_1EF8CA: BPL .positive

#_1EF8CC: LDA.b #$FF
#_1EF8CE: STA.w $0B7D

.positive
#_1EF8D1: LDA.b $00
#_1EF8D3: STA.w $0D10,X

.exit
#_1EF8D6: RTS

;===================================================================================================

SomariaPlatform_HandleDragY:
#_1EF8D7: LDA.w $0DE0,X
#_1EF8DA: EOR.w $0EB0,X
#_1EF8DD: AND.b #$02
#_1EF8DF: BEQ .exit

#_1EF8E1: LDA.w $0D00,X
#_1EF8E4: AND.b #$F8

#_1EF8E6: CLC
#_1EF8E7: ADC.b #$04
#_1EF8E9: STA.b $00

#_1EF8EB: SEC
#_1EF8EC: SBC.w $0D00,X
#_1EF8EF: BEQ .exit

#_1EF8F1: STA.w $0B7E
#_1EF8F4: BPL .positive

#_1EF8F6: LDA.b #$FF
#_1EF8F8: STA.w $0B7F

.positive
#_1EF8FB: LDA.b $00
#_1EF8FD: STA.w $0D00,X

.exit
#_1EF900: RTS

;===================================================================================================

SomariaPlatform_HandleDrag:
#_1EF901: JSR SomariaPlatform_HandleDragX
#_1EF904: JSR SomariaPlatform_HandleDragY

#_1EF907: RTS

;===================================================================================================

SomariaPlatform_HandleTile_DoNothing:
#_1EF908: RTS

;===================================================================================================

SomariaPlatform_HandleTile_RisingSlope:
#_1EF909: LDA.w $0DE0,X
#_1EF90C: EOR.b #$03
#_1EF90E: STA.w $0DE0,X

#_1EF911: RTS

;===================================================================================================

SomariaPlatform_HandleTile_FallingSlope:
#_1EF912: LDA.w $0DE0,X
#_1EF915: EOR.b #$02
#_1EF917: STA.w $0DE0,X

#_1EF91A: RTS

;===================================================================================================

pool SomariaPlatform_HandleTile_TJunctionDLR

.dpad_press
#_1EF91B: db $04, $08, $01, $02

pool off

;---------------------------------------------------------------------------------------------------

SomariaPlatform_HandleTile_TJunctionDLR:
#_1EF91F: LDA.b #$01
#_1EF921: STA.w $0D80,X

#_1EF924: LDA.b $4D
#_1EF926: BNE .continue

#_1EF928: LDY.w $0DE0,X

#_1EF92B: LDA.b $F0
#_1EF92D: AND.w .dpad_press,Y
#_1EF930: BEQ .continue

#_1EF932: STZ.w $0D80,X

#_1EF935: LDA.w $0DE0,X
#_1EF938: EOR.b #$01
#_1EF93A: STA.w $0DE0,X

.continue
#_1EF93D: STZ.b $4B

#_1EF93F: JMP.w SomariaPlatform_EnableDragging

;===================================================================================================

pool SomariaPlatform_HandleTile_TJunctionULR

.dpad_press
#_1EF942: db $03, $07, $06, $05

pool off

;---------------------------------------------------------------------------------------------------

SomariaPlatform_HandleTile_TJunctionULR:
#_1EF946: LDA.b #$01
#_1EF948: STA.w $0D80,X

#_1EF94B: LDY.w $0DE0,X

#_1EF94E: LDA.b $F0
#_1EF950: AND.w .dpad_press,Y
#_1EF953: STA.b $00

#_1EF955: AND.b #$08
#_1EF957: BEQ .continue

#_1EF959: LDA.b #$00
#_1EF95B: STA.w $0DE0,X

#_1EF95E: STZ.w $0D80,X
#_1EF961: BRA .exit

.continue
#_1EF963: LDA.b $00
#_1EF965: AND.b #$04
#_1EF967: BEQ .not_down_press

#_1EF969: LDA.b #$01
#_1EF96B: STA.w $0DE0,X

#_1EF96E: STZ.w $0D80,X
#_1EF971: BRA .exit

.not_down_press
#_1EF973: LDA.b $00
#_1EF975: AND.b #$02
#_1EF977: BEQ .not_left_press

#_1EF979: LDA.b #$02
#_1EF97B: STA.w $0DE0,X

#_1EF97E: STZ.w $0D80,X
#_1EF981: BRA .exit

.not_left_press
#_1EF983: LDA.b $00
#_1EF985: AND.b #$01
#_1EF987: BEQ .not_right_press

#_1EF989: LDA.b #$03
#_1EF98B: STA.w $0DE0,X

#_1EF98E: STZ.w $0D80,X

.not_right_press
#_1EF991: LDA.w $0DE0,X
#_1EF994: BNE .set_direction

#_1EF996: LDA.b #$02
#_1EF998: STA.w $0DE0,X

.set_direction
#_1EF99B: STZ.w $0D80,X

.exit
#_1EF99E: RTS

;===================================================================================================

pool SomariaPlatform_HandleTile_TJunctionUDR

.dpad_press
#_1EF99F: db $0B, $03, $0A, $09

pool off

;---------------------------------------------------------------------------------------------------

SomariaPlatform_HandleTile_TJunctionUDR:
#_1EF9A3: LDA.b #$01
#_1EF9A5: STA.w $0D80,X

#_1EF9A8: LDY.w $0DE0,X

#_1EF9AB: LDA.b $F0
#_1EF9AD: AND.w .dpad_press,Y
#_1EF9B0: STA.b $00

#_1EF9B2: AND.b #$08
#_1EF9B4: BEQ .not_up_press

#_1EF9B6: LDA.b #$00
#_1EF9B8: STA.w $0DE0,X

#_1EF9BB: STZ.w $0D80,X
#_1EF9BE: BRA .exit

.not_up_press
#_1EF9C0: LDA.b $00
#_1EF9C2: AND.b #$04
#_1EF9C4: BEQ .not_down_press

#_1EF9C6: LDA.b #$01
#_1EF9C8: STA.w $0DE0,X

#_1EF9CB: STZ.w $0D80,X
#_1EF9CE: BRA .exit

.not_down_press
#_1EF9D0: LDA.b $00
#_1EF9D2: AND.b #$02
#_1EF9D4: BEQ .not_left_press

#_1EF9D6: LDA.b #$02
#_1EF9D8: STA.w $0DE0,X

#_1EF9DB: STZ.w $0D80,X
#_1EF9DE: BRA .exit

.not_left_press
#_1EF9E0: LDA.b $00
#_1EF9E2: AND.b #$01
#_1EF9E4: BEQ .not_right_press

#_1EF9E6: LDA.b #$03
#_1EF9E8: STA.w $0DE0,X

#_1EF9EB: STZ.w $0D80,X

.not_right_press
#_1EF9EE: LDA.w $0DE0,X
#_1EF9F1: CMP.b #$01
#_1EF9F3: BNE .set_direction

#_1EF9F5: LDA.b #$02
#_1EF9F7: STA.w $0DE0,X

.set_direction
#_1EF9FA: STZ.w $0D80,X

.exit
#_1EF9FD: RTS

;===================================================================================================

pool SomariaPlatform_HandleTile_TJunctionUDL

.dpad_press
#_1EF9FE: db $09, $05, $0C, $0D

pool off

;---------------------------------------------------------------------------------------------------

SomariaPlatform_HandleTile_TJunctionUDL:
#_1EFA02: LDA.b #$01
#_1EFA04: STA.w $0D80,X

#_1EFA07: LDY.w $0DE0,X

#_1EFA0A: LDA.b $F0
#_1EFA0C: AND.w .dpad_press,Y
#_1EFA0F: STA.b $00

#_1EFA11: AND.b #$08
#_1EFA13: BEQ .not_up_press

#_1EFA15: LDA.b #$00
#_1EFA17: STA.w $0DE0,X

#_1EFA1A: STZ.w $0D80,X
#_1EFA1D: BRA .exit

.not_up_press
#_1EFA1F: LDA.b $00
#_1EFA21: AND.b #$04
#_1EFA23: BEQ .not_down_press

#_1EFA25: LDA.b #$01
#_1EFA27: STA.w $0DE0,X

#_1EFA2A: STZ.w $0D80,X
#_1EFA2D: BRA .exit

.not_down_press
#_1EFA2F: LDA.b $00
#_1EFA31: AND.b #$02
#_1EFA33: BEQ .not_left_press

#_1EFA35: LDA.b #$02
#_1EFA37: STA.w $0DE0,X

#_1EFA3A: STZ.w $0D80,X
#_1EFA3D: BRA .exit

.not_left_press
#_1EFA3F: LDA.b $00
#_1EFA41: AND.b #$01
#_1EFA43: BEQ .not_right_press

#_1EFA45: LDA.b #$03
#_1EFA47: STA.w $0DE0,X

#_1EFA4A: STZ.w $0D80,X

.not_right_press
#_1EFA4D: LDA.w $0DE0,X
#_1EFA50: CMP.b #$02
#_1EFA52: BNE .set_direction

#_1EFA54: LDA.b #$00
#_1EFA56: STA.w $0DE0,X

.set_direction
#_1EFA59: STZ.w $0D80,X

.exit
#_1EFA5C: RTS

;===================================================================================================

pool SomariaPlatform_HandleTile_4WayJunction

.dpad_press
#_1EFA5D: db $0A, $06, $0E, $0C

pool off

;---------------------------------------------------------------------------------------------------

SomariaPlatform_HandleTile_4WayJunction:
#_1EFA61: LDA.b #$01
#_1EFA63: STA.w $0D80,X

#_1EFA66: LDY.w $0DE0,X

#_1EFA69: LDA.b $F0
#_1EFA6B: AND.w .dpad_press,Y
#_1EFA6E: STA.b $00

#_1EFA70: AND.b #$08
#_1EFA72: BEQ .not_up_press

#_1EFA74: LDA.b #$00
#_1EFA76: STA.w $0DE0,X

#_1EFA79: STZ.w $0D80,X
#_1EFA7C: BRA .exit

.not_up_press
#_1EFA7E: LDA.b $00
#_1EFA80: AND.b #$04
#_1EFA82: BEQ .not_down_press

#_1EFA84: LDA.b #$01
#_1EFA86: STA.w $0DE0,X

#_1EFA89: STZ.w $0D80,X
#_1EFA8C: BRA .exit

.not_down_press
#_1EFA8E: LDA.b $00
#_1EFA90: AND.b #$02
#_1EFA92: BEQ .not_left_press

#_1EFA94: LDA.b #$02
#_1EFA96: STA.w $0DE0,X

#_1EFA99: STZ.w $0D80,X
#_1EFA9C: BRA .exit

.not_left_press
#_1EFA9E: LDA.b $00
#_1EFAA0: AND.b #$01
#_1EFAA2: BEQ .not_right_press

#_1EFAA4: LDA.b #$03
#_1EFAA6: STA.w $0DE0,X

#_1EFAA9: STZ.w $0D80,X

.not_right_press
#_1EFAAC: LDA.w $0DE0,X
#_1EFAAF: CMP.b #$03
#_1EFAB1: BNE .set_direction

#_1EFAB3: LDA.b #$00
#_1EFAB5: STA.w $0DE0,X

.set_direction
#_1EFAB8: STZ.w $0D80,X

.exit
#_1EFABB: RTS

;===================================================================================================

pool SomariaPlatform_HandleTile_CrossOver

.dpad_press
#_1EFABC: db $0B, $07, $0E, $0D

pool off

;---------------------------------------------------------------------------------------------------

SomariaPlatform_HandleTile_CrossOver:
#_1EFAC0: LDY.w $0DE0,X

#_1EFAC3: LDA.b $F0
#_1EFAC5: AND.w .dpad_press,Y
#_1EFAC8: STA.b $00

#_1EFACA: AND.b #$08
#_1EFACC: BEQ .not_up_press

#_1EFACE: LDA.b #$00
#_1EFAD0: STA.w $0DE0,X
#_1EFAD3: BRA .exit

.not_up_press
#_1EFAD5: LDA.b $00
#_1EFAD7: AND.b #$04
#_1EFAD9: BEQ .not_down_press

#_1EFADB: LDA.b #$01
#_1EFADD: STA.w $0DE0,X
#_1EFAE0: BRA .exit

.not_down_press
#_1EFAE2: LDA.b $00
#_1EFAE4: AND.b #$02
#_1EFAE6: BEQ .not_left_press

#_1EFAE8: LDA.b #$02
#_1EFAEA: STA.w $0DE0,X
#_1EFAED: BRA .exit

.not_left_press
#_1EFAEF: LDA.b $00
#_1EFAF1: AND.b #$01
#_1EFAF3: BEQ .exit

#_1EFAF5: LDA.b #$03
#_1EFAF7: STA.w $0DE0,X

.exit
#_1EFAFA: RTS

;===================================================================================================

pool SomariaPlatform_HandleTile_Unknown

.dpad_press
#_1EFAFB: db $0C, $0C, $03, $03

pool off

;---------------------------------------------------------------------------------------------------

SomariaPlatform_HandleTile_Unknown:
#_1EFAFF: LDA.b #$01
#_1EFB01: STA.w $0D80,X

#_1EFB04: LDY.w $0DE0,X

#_1EFB07: LDA.b $F0
#_1EFB09: AND.w .dpad_press,Y
#_1EFB0C: BEQ SomariaPlatform_EnableDragging

#_1EFB0E: STA.b $00

#_1EFB10: AND.b #$08
#_1EFB12: BEQ .not_up_press

#_1EFB14: LDA.b #$00
#_1EFB16: BRA .set_direction

.not_up_press
#_1EFB18: LDA.b $00
#_1EFB1A: AND.b #$04
#_1EFB1C: BEQ .not_down_press

#_1EFB1E: LDA.b #$01
#_1EFB20: BRA .set_direction

.not_down_press
#_1EFB22: LDA.b $00
#_1EFB24: AND.b #$02
#_1EFB26: BEQ .not_left_press

#_1EFB28: LDA.b #$02
#_1EFB2A: BRA .set_direction

.not_left_press
#_1EFB2C: LDA.b #$03

.set_direction
#_1EFB2E: STA.w $0DE0,X

#_1EFB31: STZ.w $0D80,X

;===================================================================================================

SomariaPlatform_EnableDragging:
#_1EFB34: LDA.b #$01
#_1EFB36: STA.w $02F5

#_1EFB39: RTS

;===================================================================================================

SomariaPlatform_HandleTile_Station:
#_1EFB3A: STZ.w $0D80,X

#_1EFB3D: LDA.w $0DE0,X
#_1EFB40: EOR.b #$01
#_1EFB42: STA.w $0DE0,X

#_1EFB45: STZ.b $4B
#_1EFB47: BRA SomariaPlatform_EnableDragging

;===================================================================================================

SomariaPlatform_DragLink:
#_1EFB49: REP #$20

#_1EFB4B: LDA.w $0FD8
#_1EFB4E: SEC
#_1EFB4F: SBC.w #$0008

#_1EFB52: CMP.b $22
#_1EFB54: BEQ .x_done
#_1EFB56: BPL .x_too_low

.x_too_high
#_1EFB58: DEC.w $0B7C
#_1EFB5B: BRA .x_done

.x_too_low
#_1EFB5D: INC.w $0B7C

.x_done
#_1EFB60: LDA.w $0FDA
#_1EFB63: SEC
#_1EFB64: SBC.w #$0010

#_1EFB67: CMP.b $20
#_1EFB69: BEQ .y_done
#_1EFB6B: BPL .y_too_low

.y_too_high
#_1EFB6D: DEC.w $0B7E
#_1EFB70: BRA .y_done

.y_too_low
#_1EFB72: INC.w $0B7E

.y_done
#_1EFB75: SEP #$30

#_1EFB77: RTS

;===================================================================================================

UNREACHABLE_1EFB78:
#_1EFB78: db $00, $00, $01, $FF, $00, $00

;===================================================================================================

Sprite_AE_Pipe_Down:
Sprite_AF_Pipe_Up:
Sprite_B0_Pipe_Right:
Sprite_B1_Pipe_Left:
#_1EFB7E: JSR Sprite_CheckIfActive_Bank1E

#_1EFB81: LDA.w $0DC0,X
#_1EFB84: JSL JumpTableLocal
#_1EFB88: dw Pipe_LocatePath
#_1EFB8A: dw Pipe_FindEndPoint
#_1EFB8C: dw Pipe_Idle
#_1EFB8E: dw Pipe_DragLink
#_1EFB90: dw Pipe_MoveLink
#_1EFB92: dw Pipe_Reset

;===================================================================================================

Pipe_FindEndPoint:
#_1EFB94: JSR SomariaPlatformAndPipe_CheckTile
#_1EFB97: CMP.b #$BE ; TILETYPE BE
#_1EFB99: BNE .invalid_tile

#_1EFB9B: STA.w $0E90,X

#_1EFB9E: INC.w $0DC0,X

#_1EFBA1: LDA.w $0DE0,X
#_1EFBA4: EOR.b #$01
#_1EFBA6: STA.w $0DE0,X

.invalid_tile
#_1EFBA9: CMP.w $0E90,X
#_1EFBAC: BEQ .same_as_last

#_1EFBAE: STA.w $0E90,X

.same_as_last
#_1EFBB1: LDA.w $0DE0,X
#_1EFBB4: STA.w $0EB0,X

#_1EFBB7: JSR SomariaPlatformAndPipe_HandleMovement
#_1EFBBA: JSR Sprite_Move_XY_Bank1E

#_1EFBBD: RTS

;===================================================================================================

Pipe_Idle:
#_1EFBBE: LDA.w $1DE0
#_1EFBC1: CMP.b #$FF
#_1EFBC3: BNE .exit

#_1EFBC5: JSL Sprite_CheckDamageToLink_ignore_layer_long
#_1EFBC9: BCC .exit

#_1EFBCB: PHX
#_1EFBCC: JSL Pipe_ValidateEntry
#_1EFBD0: PLX

#_1EFBD1: BCS .cant_use

#_1EFBD3: INC.w $0DC0,X

#_1EFBD6: LDA.b #$04
#_1EFBD8: STA.w $0E00,X

#_1EFBDB: JSL Link_ResetProperties_A

#_1EFBDF: LDA.b #$01
#_1EFBE1: STA.w $02E4
#_1EFBE4: STA.w $037B

#_1EFBE7: TXA
#_1EFBE8: STA.w $1DE0

.exit
#_1EFBEB: RTS

.cant_use
#_1EFBEC: JSR Sprite_HaltAllMovement

#_1EFBEF: RTS

;===================================================================================================

PipeTileTypeMasks:
#_1EFBF0: db $08, $04, $02, $01

;===================================================================================================

Pipe_DragLink:
#_1EFBF4: LDA.w $0E00,X
#_1EFBF7: BNE .delay

#_1EFBF9: INC.w $0DC0,X

#_1EFBFC: LDA.b #$0C
#_1EFBFE: STA.b $4B

#_1EFC00: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_1EFC01: LDA.b #$01
#_1EFC03: STA.w $02E4
#_1EFC06: STA.w $037B

#_1EFC09: LDY.w $0DE0,X

#_1EFC0C: LDA.w PipeTileTypeMasks,Y
#_1EFC0F: JSR Pipe_HandlePlayerMovement

#_1EFC12: RTS

;===================================================================================================

Pipe_MoveLink:
#_1EFC13: LDA.b #$03
#_1EFC15: STA.w $0E80,X

#_1EFC18: LDA.b $22
#_1EFC1A: STA.b $3F

#_1EFC1C: LDA.b $23
#_1EFC1E: STA.b $41

#_1EFC20: LDA.b $20
#_1EFC22: STA.b $3E

#_1EFC24: LDA.b $21
#_1EFC26: STA.b $40

;---------------------------------------------------------------------------------------------------

.next
#_1EFC28: INC.w $0D90,X

#_1EFC2B: LDA.w $0D90,X
#_1EFC2E: AND.b #$07
#_1EFC30: BNE .do_movement

#_1EFC32: JSR SomariaPlatformAndPipe_CheckTile

#_1EFC35: PHA

#_1EFC36: CMP.b #$B2 ; TILETYPE B2
#_1EFC38: BCC .no_thud

#_1EFC3A: CMP.b #$B6 ; TILETYPE B6
#_1EFC3C: BCS .no_thud

#_1EFC3E: LDA.b #$0B ; SFX2.0B
#_1EFC40: JSL SpriteSFX_QueueSFX2WithPan

.no_thud
#_1EFC44: PLA
#_1EFC45: CMP.w $0E90,X
#_1EFC48: BEQ .do_movement

#_1EFC4A: STA.w $0E90,X

#_1EFC4D: CMP.b #$BE ; TILETYPE BE
#_1EFC4F: BNE .check_new_tile

#_1EFC51: INC.w $0DC0,X

#_1EFC54: LDA.b #$18
#_1EFC56: STA.w $0E00,X

.check_new_tile
#_1EFC59: LDA.w $0DE0,X
#_1EFC5C: STA.w $0EB0,X

#_1EFC5F: JSR SomariaPlatformAndPipe_HandleMovement
#_1EFC62: JSR SomariaPlatform_HandleDrag

;---------------------------------------------------------------------------------------------------

.do_movement
#_1EFC65: JSR Sprite_Move_XY_Bank1E

#_1EFC68: LDA.w $0D10,X
#_1EFC6B: SEC
#_1EFC6C: SBC.b #$08
#_1EFC6E: STA.b $00

#_1EFC70: LDA.w $0D30,X
#_1EFC73: SBC.b #$00
#_1EFC75: STA.b $01

#_1EFC77: LDA.w $0D00,X
#_1EFC7A: SEC
#_1EFC7B: SBC.b #$0E
#_1EFC7D: STA.b $02

#_1EFC7F: LDA.w $0D20,X
#_1EFC82: SBC.b #$00
#_1EFC84: STA.b $03

#_1EFC86: REP #$20

#_1EFC88: LDA.b $00
#_1EFC8A: CMP.b $22
#_1EFC8C: BEQ .x_done
#_1EFC8E: BCS .move_right

.move_left
#_1EFC90: DEC.b $22
#_1EFC92: BRA .x_done

.move_right
#_1EFC94: INC.b $22

.x_done
#_1EFC96: LDA.b $02
#_1EFC98: CMP.b $20
#_1EFC9A: BEQ .y_done
#_1EFC9C: BCS .move_down

.move_up
#_1EFC9E: DEC.b $20
#_1EFCA0: BRA .y_done

.move_down
#_1EFCA2: INC.b $20

.y_done
#_1EFCA4: SEP #$30

#_1EFCA6: DEC.w $0E80,X
#_1EFCA9: BEQ .finish_up

#_1EFCAB: JMP.w .next

;---------------------------------------------------------------------------------------------------

.finish_up
#_1EFCAE: LDA.b $22
#_1EFCB0: SEC
#_1EFCB1: SBC.b $3F
#_1EFCB3: STA.b $31

#_1EFCB5: LDA.b $20
#_1EFCB7: SEC
#_1EFCB8: SBC.b $3E
#_1EFCBA: STA.b $30

#_1EFCBC: LDY.w $0DE0,X

#_1EFCBF: LDA.w PipeTileTypeMasks,Y
#_1EFCC2: STA.b $26

#_1EFCC4: PHX

#_1EFCC5: JSL Link_HandleMovingAnimation_FullLongEntry
#_1EFCC9: JSL HandleIndoorCameraAndDoors_long
#_1EFCCD: JSL Link_CancelDash_long

#_1EFCD1: PLX

#_1EFCD2: RTS

;===================================================================================================

Pipe_Reset:
#_1EFCD3: LDA.w $0E00,X
#_1EFCD6: BNE .delay

#_1EFCD8: STZ.w $02E4
#_1EFCDB: STZ.w $02F5
#_1EFCDE: STZ.w $037B

#_1EFCE1: STZ.b $4B
#_1EFCE3: STZ.b $31
#_1EFCE5: STZ.b $30

#_1EFCE7: LDA.b #$FF
#_1EFCE9: STA.w $1DE0

#_1EFCEC: LDA.b #$02
#_1EFCEE: STA.w $0DC0,X

#_1EFCF1: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_1EFCF2: LDA.w $0DE0,X
#_1EFCF5: EOR.b #$01
#_1EFCF7: TAY

#_1EFCF8: LDA.w PipeTileTypeMasks,Y
#_1EFCFB: JSR Pipe_HandlePlayerMovement

#_1EFCFE: RTS

;===================================================================================================

Pipe_HandlePlayerMovement:
#_1EFCFF: PHX

#_1EFD00: STA.b $67
#_1EFD02: STA.b $26

#_1EFD04: JSL Link_HandleVelocity
#_1EFD08: JSL Link_HandleMovingAnimation_FullLongEntry
#_1EFD0C: JSL HandleIndoorCameraAndDoors_long

#_1EFD10: PLX

#_1EFD11: RTS

;===================================================================================================

pool Fairy_HandleMovement

.z_accel
#_1EFD12: db  1, -1

pool off

;---------------------------------------------------------------------------------------------------

Fairy_HandleMovement:
#_1EFD14: PHB
#_1EFD15: PHK
#_1EFD16: PLB

#_1EFD17: JSR .main

#_1EFD1A: PLB

#_1EFD1B: RTL

;---------------------------------------------------------------------------------------------------

.main
#_1EFD1C: LDA.b $1A
#_1EFD1E: LSR A
#_1EFD1F: LSR A
#_1EFD20: LSR A
#_1EFD21: AND.b #$01
#_1EFD23: STA.w $0DC0,X

#_1EFD26: LDA.b $1B
#_1EFD28: BEQ .ignore_tile_collision

#_1EFD2A: LDA.w $0E00,X
#_1EFD2D: BNE .ignore_tile_collision

#_1EFD2F: JSR Sprite_CheckTileCollision_Bank1E
#_1EFD32: AND.b #$03
#_1EFD34: BEQ .no_horizontal_collision

#_1EFD36: LDA.w $0D50,X
#_1EFD39: EOR.b #$FF
#_1EFD3B: INC A
#_1EFD3C: STA.w $0D50,X

#_1EFD3F: LDA.w $0DE0,X
#_1EFD42: EOR.b #$FF
#_1EFD44: INC A
#_1EFD45: STA.w $0DE0,X

#_1EFD48: LDA.b #$20
#_1EFD4A: STA.w $0E00,X

.no_horizontal_collision
#_1EFD4D: LDA.w $0E70,X
#_1EFD50: AND.b #$0C
#_1EFD52: BEQ .ignore_tile_collision

#_1EFD54: LDA.w $0D40,X
#_1EFD57: EOR.b #$FF
#_1EFD59: INC A
#_1EFD5A: STA.w $0D40,X

#_1EFD5D: LDA.w $0D90,X
#_1EFD60: EOR.b #$FF
#_1EFD62: INC A
#_1EFD63: STA.w $0D90,X

#_1EFD66: LDA.b #$20
#_1EFD68: STA.w $0E00,X

;---------------------------------------------------------------------------------------------------

.ignore_tile_collision
#_1EFD6B: LDA.w $0D50,X
#_1EFD6E: BEQ .not_moving_horizontally
#_1EFD70: BPL .moving_right

.moving_left
#_1EFD72: LDA.w $0F50,X
#_1EFD75: AND.b #$BF
#_1EFD77: BRA .flip_done

.moving_right
#_1EFD79: LDA.w $0F50,X
#_1EFD7C: ORA.b #$40

.flip_done
#_1EFD7E: STA.w $0F50,X

;---------------------------------------------------------------------------------------------------

.not_moving_horizontally
#_1EFD81: JSR Sprite_Move_XY_Bank1E

#_1EFD84: LDA.b $1A
#_1EFD86: AND.b #$3F
#_1EFD88: BNE .dont_turn

#_1EFD8A: JSL GetRandomNumber
#_1EFD8E: STA.b $04

#_1EFD90: LDA.b $23
#_1EFD92: STA.b $05

#_1EFD94: JSL GetRandomNumber
#_1EFD98: STA.b $06

#_1EFD9A: LDA.b $21
#_1EFD9C: STA.b $07

#_1EFD9E: LDA.b #$10
#_1EFDA0: JSL Sprite_ProjectSpeedTowardsLocation_long

#_1EFDA4: LDA.b $00
#_1EFDA6: STA.w $0D90,X

#_1EFDA9: LDA.b $01
#_1EFDAB: STA.w $0DE0,X

.dont_turn
#_1EFDAE: LDA.b $1A
#_1EFDB0: AND.b #$0F
#_1EFDB2: BNE .done_with_speed

#_1EFDB4: LDA.b #$FF
#_1EFDB6: STA.b $01
#_1EFDB8: STA.b $03

#_1EFDBA: LDA.w $0D90,X
#_1EFDBD: STA.b $00
#_1EFDBF: BMI .negative_y_target

#_1EFDC1: STZ.b $01

.negative_y_target
#_1EFDC3: LDA.w $0D40,X
#_1EFDC6: STA.b $02
#_1EFDC8: BMI .negative_y_speed

#_1EFDCA: STZ.b $03

.negative_y_speed
#_1EFDCC: REP #$21

#_1EFDCE: LDA.b $00
#_1EFDD0: ADC.b $02
#_1EFDD2: LSR A

#_1EFDD3: SEP #$30

#_1EFDD5: STA.w $0D40,X

#_1EFDD8: LDA.b #$FF
#_1EFDDA: STA.b $01
#_1EFDDC: STA.b $03

#_1EFDDE: LDA.w $0DE0,X
#_1EFDE1: STA.b $00
#_1EFDE3: BMI .negative_x_target

#_1EFDE5: STZ.b $01

.negative_x_target
#_1EFDE7: LDA.w $0D50,X
#_1EFDEA: STA.b $02
#_1EFDEC: BMI .negative_x_speed

#_1EFDEE: STZ.b $03

.negative_x_speed
#_1EFDF0: REP #$21

#_1EFDF2: LDA.b $00
#_1EFDF4: ADC.b $02
#_1EFDF6: LSR A

#_1EFDF7: SEP #$30

#_1EFDF9: STA.w $0D50,X

;---------------------------------------------------------------------------------------------------

.done_with_speed
#_1EFDFC: JSR Sprite_Move_Z_Bank1E

#_1EFDFF: JSL GetRandomNumber
#_1EFE03: AND.b #$01
#_1EFE05: TAY

#_1EFE06: LDA.w .z_accel,Y
#_1EFE09: CLC
#_1EFE0A: ADC.w $0F80,X
#_1EFE0D: STA.w $0F80,X

#_1EFE10: LDA.w $0F70,X

#_1EFE13: LDY.b #$08
#_1EFE15: CMP.b #$08
#_1EFE17: BCC .float_up

;---------------------------------------------------------------------------------------------------

.float_down
#_1EFE19: LDY.b #$18
#_1EFE1B: CMP.b #$18
#_1EFE1D: BCC .exit

#_1EFE1F: TYA
#_1EFE20: STA.w $0F70,X

#_1EFE23: LDA.b #$FB
#_1EFE25: STA.w $0F80,X

.exit
#_1EFE28: RTS

;---------------------------------------------------------------------------------------------------

.float_up
#_1EFE29: TYA
#_1EFE2A: STA.w $0F70,X

#_1EFE2D: LDA.b #$05
#_1EFE2F: STA.w $0F80,X

#_1EFE32: RTS

;===================================================================================================

ReleaseFairy:
#_1EFE33: LDA.b #$E3 ; SPRITE E3
#_1EFE35: JSL Sprite_SpawnDynamically
#_1EFE39: BMI .no_space

#_1EFE3B: LDA.b $EE
#_1EFE3D: STA.w $0F20,Y

#_1EFE40: LDA.b $22
#_1EFE42: CLC
#_1EFE43: ADC.b #$08
#_1EFE45: STA.w $0D10,Y

#_1EFE48: LDA.b $23
#_1EFE4A: ADC.b #$00
#_1EFE4C: STA.w $0D30,Y

#_1EFE4F: LDA.b $20
#_1EFE51: CLC
#_1EFE52: ADC.b #$10
#_1EFE54: STA.w $0D00,Y

#_1EFE57: LDA.b $21
#_1EFE59: ADC.b #$00
#_1EFE5B: STA.w $0D20,Y

#_1EFE5E: LDA.b #$00
#_1EFE60: STA.w $0DE0,Y

#_1EFE63: LDA.b #$60
#_1EFE65: STA.w $0F10,Y

.no_space
#_1EFE68: RTL

;===================================================================================================

Sprite_DirectionToFaceLink_Bank1E:
#_1EFE69: JSL Sprite_DirectionToFaceLink_long

#_1EFE6D: RTS

;===================================================================================================

Sprite_IsRightOfLink_Bank1E:
#_1EFE6E: JSL Sprite_IsRightOfLink_long

#_1EFE72: RTS

;===================================================================================================

Sprite_IsBelowLink_Bank1E:
#_1EFE73: JSL Sprite_IsBelowLink_long

#_1EFE77: RTS

;===================================================================================================

Sprite_CheckIfActive_Bank1E:
#_1EFE78: LDA.w $0DD0,X
#_1EFE7B: CMP.b #$09
#_1EFE7D: BNE .inactive

#Sprite_CheckIfActivePermissive_Bank1E:
#_1EFE7F: LDA.w $0FC1
#_1EFE82: BNE .inactive

#_1EFE84: LDA.b $11
#_1EFE86: BNE .inactive

#_1EFE88: LDA.w $0CAA,X
#_1EFE8B: BMI .active

#_1EFE8D: LDA.w $0F00,X
#_1EFE90: BEQ .active

.inactive
#_1EFE92: PLA
#_1EFE93: PLA

.active
#_1EFE94: RTS

;===================================================================================================

pool Sprite_CheckIfRecoiling_Bank1E

.masks
#_1EFE95: db $03, $01, $00, $00, $0C, $03

pool off

;---------------------------------------------------------------------------------------------------

Sprite_CheckIfRecoiling_Bank1E:
#_1EFE9B: LDA.w $0EA0,X
#_1EFE9E: BEQ .exit

#_1EFEA0: AND.b #$7F
#_1EFEA2: BEQ .recoil_over

#_1EFEA4: LDA.w $0D40,X
#_1EFEA7: PHA

#_1EFEA8: LDA.w $0D50,X
#_1EFEAB: PHA

#_1EFEAC: DEC.w $0EA0,X
#_1EFEAF: BNE .still_recoiling

#_1EFEB1: LDA.w $0F40,X
#_1EFEB4: CLC
#_1EFEB5: ADC.b #$20
#_1EFEB7: CMP.b #$40
#_1EFEB9: BCS .no_adjust

#_1EFEBB: LDA.w $0F30,X
#_1EFEBE: CLC
#_1EFEBF: ADC.b #$20
#_1EFEC1: CMP.b #$40
#_1EFEC3: BCC .still_recoiling

.no_adjust
#_1EFEC5: LDA.b #$90
#_1EFEC7: STA.w $0EA0,X

.still_recoiling
#_1EFECA: LDA.w $0EA0,X
#_1EFECD: BMI .no_movement

#_1EFECF: LSR A
#_1EFED0: LSR A
#_1EFED1: TAY

#_1EFED2: LDA.b $1A
#_1EFED4: AND.w .masks,Y
#_1EFED7: BNE .no_movement

#_1EFED9: LDA.w $0F30,X
#_1EFEDC: STA.w $0D40,X

#_1EFEDF: LDA.w $0F40,X
#_1EFEE2: STA.w $0D50,X

#_1EFEE5: LDA.w $0CD2,X
#_1EFEE8: BMI .handle_movement

#_1EFEEA: JSR Sprite_CheckTileCollision_Bank1E
#_1EFEED: AND.b #$0F
#_1EFEEF: BEQ .handle_movement

#_1EFEF1: CMP.b #$04
#_1EFEF3: BCS .stop_vertical_movement

.stop_horizontal_movement
#_1EFEF5: STZ.w $0F40,X
#_1EFEF8: STZ.w $0D50,X

#_1EFEFB: BRA .movement_stopped

.stop_vertical_movement
#_1EFEFD: STZ.w $0F30,X
#_1EFF00: STZ.w $0D40,X

.movement_stopped
#_1EFF03: BRA .no_movement

.handle_movement
#_1EFF05: JSR Sprite_Move_XY_Bank1E

.no_movement
#_1EFF08: PLA
#_1EFF09: STA.w $0D50,X

#_1EFF0C: PLA
#_1EFF0D: STA.w $0D40,X

#_1EFF10: LDA.w $0E20,X
#_1EFF13: CMP.b #$7A ; SPRITE 7A
#_1EFF15: BEQ .exit

#_1EFF17: PLA
#_1EFF18: PLA

.exit
#_1EFF19: RTS

.recoil_over
#_1EFF1A: STZ.w $0EA0,X

#_1EFF1D: RTS

;===================================================================================================

Sprite_Move_XYZ_Bank1E:
#_1EFF1E: JSR Sprite_Move_Z_Bank1E

;===================================================================================================

Sprite_Move_XY_Bank1E:
#_1EFF21: JSR Sprite_Move_X_Bank1E
#_1EFF24: JSR Sprite_Move_Y_Bank1E

#_1EFF27: RTS

;===================================================================================================

Sprite_Move_X_Bank1E:
#_1EFF28: TXA
#_1EFF29: CLC
#_1EFF2A: ADC.b #$10
#_1EFF2C: TAX

#_1EFF2D: JSR Sprite_Move_Y_Bank1E

#_1EFF30: LDX.w $0FA0

#_1EFF33: RTS

;===================================================================================================

Sprite_Move_Y_Bank1E:
#_1EFF34: LDA.w $0D40,X
#_1EFF37: BEQ .exit

#_1EFF39: ASL A
#_1EFF3A: ASL A
#_1EFF3B: ASL A
#_1EFF3C: ASL A

#_1EFF3D: CLC
#_1EFF3E: ADC.w $0D60,X
#_1EFF41: STA.w $0D60,X

#_1EFF44: LDA.w $0D40,X
#_1EFF47: PHP

#_1EFF48: LSR A
#_1EFF49: LSR A
#_1EFF4A: LSR A
#_1EFF4B: LSR A

#_1EFF4C: LDY.b #$00

#_1EFF4E: PLP
#_1EFF4F: BPL .positive_velocity

#_1EFF51: ORA.b #$F0
#_1EFF53: DEY

.positive_velocity
#_1EFF54: ADC.w $0D00,X
#_1EFF57: STA.w $0D00,X

#_1EFF5A: TYA
#_1EFF5B: ADC.w $0D20,X
#_1EFF5E: STA.w $0D20,X

.exit
#_1EFF61: RTS

;===================================================================================================

Sprite_Move_Z_Bank1E:
#_1EFF62: LDA.w $0F80,X
#_1EFF65: ASL A
#_1EFF66: ASL A
#_1EFF67: ASL A
#_1EFF68: ASL A
#_1EFF69: CLC
#_1EFF6A: ADC.w $0F90,X
#_1EFF6D: STA.w $0F90,X

#_1EFF70: LDA.w $0F80,X
#_1EFF73: PHP

#_1EFF74: LSR A
#_1EFF75: LSR A
#_1EFF76: LSR A
#_1EFF77: LSR A

#_1EFF78: PLP
#_1EFF79: BPL .positive_velocity

#_1EFF7B: ORA.b #$F0

.positive_velocity
#_1EFF7D: ADC.w $0F70,X
#_1EFF80: STA.w $0F70,X

#_1EFF83: RTS

;===================================================================================================

Sprite_PrepOAMCoord_Bank1E:
#_1EFF84: JSL Sprite_PrepOAMCoord_long
#_1EFF88: BCC .draw

#_1EFF8A: PLA
#_1EFF8B: PLA

.draw
#_1EFF8C: RTS

;===================================================================================================

Sprite_DrawRippleIfInWater:
#_1EFF8D: LDA.l $7FF9C2,X
#_1EFF91: CMP.b #$08 ; TILETYPE 08
#_1EFF93: BEQ .water_tile

#_1EFF95: CMP.b #$09 ; TILETYPE 09
#_1EFF97: BNE .not_water_tile

.water_tile
#_1EFF99: LDA.w $0E60,X
#_1EFF9C: AND.b #$20
#_1EFF9E: BEQ .no_offset

#_1EFFA0: LDA.w $0FD8
#_1EFFA3: SEC
#_1EFFA4: SBC.b #$04
#_1EFFA6: STA.w $0FD8

#_1EFFA9: LDA.w $0FD9
#_1EFFAC: SBC.b #$00
#_1EFFAE: STA.w $0FD9

#_1EFFB1: LDA.w $0E20,X
#_1EFFB4: CMP.b #$DF ; !HARDCODED thing for small magic (SPRITE DF)
#_1EFFB6: BNE .no_offset

#_1EFFB8: LDA.w $0FDA
#_1EFFBB: SEC
#_1EFFBC: SBC.b #$07
#_1EFFBE: STA.w $0FDA

#_1EFFC1: LDA.w $0FDB
#_1EFFC4: SBC.b #$00
#_1EFFC6: STA.w $0FDB

.no_offset
#_1EFFC9: JSL SpriteDraw_WaterRipple
#_1EFFCD: JSL Sprite_Get16BitCoords_long

#_1EFFD1: LDA.w $0E40,X
#_1EFFD4: AND.b #$1F
#_1EFFD6: INC A
#_1EFFD7: ASL A
#_1EFFD8: ASL A

#_1EFFD9: JSL SpriteDraw_AllocateOAMFromRegionA

.not_water_tile
#_1EFFDD: RTL

;===================================================================================================
; FREE ROM: 0x22
;===================================================================================================
NULL_1EFFDE:
#_1EFFDE: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1EFFE6: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1EFFEE: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1EFFF6: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1EFFFE: db $FF, $FF

;===================================================================================================
