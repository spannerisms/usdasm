org $078000

;===================================================================================================

Link_Main:
#_078000: PHB
#_078001: PHK
#_078002: PLB

#_078003: REP #$20

#_078005: LDA.b $22
#_078007: STA.w $0FC2

#_07800A: LDA.b $20
#_07800C: STA.w $0FC4

#_07800F: SEP #$20

#_078011: STZ.w $0FC1

#_078014: LDA.w $02E4
#_078017: BNE .nocontrol

#_078019: JSR Link_ControlHandler

.nocontrol
#_07801C: JSR HandleSomariaAndGraves

#_07801F: PLB

#_078020: RTL

;===================================================================================================

PlaySFX_Set1:
#_078021: JSR PlaySFX_SetPan
#_078024: STA.w $012D

#_078027: RTS

;===================================================================================================

PlaySFX_Set2:
#_078028: JSR PlaySFX_SetPan
#_07802B: STA.w $012E

#_07802E: RTS

;===================================================================================================

PlaySFX_Set3:
#_07802F: JSR PlaySFX_SetPan
#_078032: STA.w $012F

#_078035: RTS

;===================================================================================================

PlaySFX_SetPan:
#_078036: STA.w $0CF8

#_078039: JSL Link_CalculateSFXPan
#_07803D: ORA.w $0CF8

#_078040: RTS

;===================================================================================================

pool Link_ControlHandler

.vectors
#_078041: dw LinkState_Default                  ; 0x00
#_078043: dw LinkState_Pits                     ; 0x01
#_078045: dw LinkState_Recoil                   ; 0x02
#_078047: dw LinkState_SpinAttack               ; 0x03
#_078049: dw LinkState_Swimming                 ; 0x04
#_07804B: dw LinkState_OnIce                    ; 0x05
#_07804D: dw LinkState_Recoil                   ; 0x06
#_07804F: dw LinkState_Zapped                   ; 0x07
#_078051: dw LinkState_UsingEther               ; 0x08
#_078053: dw LinkState_UsingBombos              ; 0x09
#_078055: dw LinkState_UsingQuake               ; 0x0A
#_078057: dw LinkState_HoppingSouthOW           ; 0x0B
#_078059: dw LinkState_HoppingHorizontallyOW    ; 0x0C
#_07805B: dw LinkState_HoppingDiagonallyUpOW    ; 0x0D
#_07805D: dw LinkState_HoppingDiagonallyDownOW  ; 0x0E
#_07805F: dw LinkState_0F                       ; 0x0F
#_078061: dw LinkState_0F                       ; 0x10
#_078063: dw LinkState_Dashing                  ; 0x11
#_078065: dw LinkState_ExitingDash              ; 0x12
#_078067: dw LinkState_Hookshotting             ; 0x13
#_078069: dw LinkState_CrossingWorlds           ; 0x14
#_07806B: dw LinkState_ShowingOffItem           ; 0x15
#_07806D: dw LinkState_Sleeping                 ; 0x16
#_07806F: dw LinkState_Bunny                    ; 0x17
#_078071: dw LinkState_HoldingBigRock           ; 0x18
#_078073: dw LinkState_ReceivingEther           ; 0x19
#_078075: dw LinkState_ReceivingBombos          ; 0x1A
#_078077: dw LinkState_ReadingDesertTablet      ; 0x1B
#_078079: dw LinkState_TemporaryBunny           ; 0x1C
#_07807B: dw LinkState_TreePull                 ; 0x1D
#_07807D: dw LinkState_SpinAttack               ; 0x1E

pool off

;---------------------------------------------------------------------------------------------------

Link_ControlHandler:
#_07807F: LDA.w $0373
#_078082: BEQ .no_damage

#_078084: LDA.b $55
#_078086: BEQ .no_cape

#_078088: STZ.w $0373

#_07808B: STZ.b $4D
#_07808D: STZ.b $46

#_07808F: BRA .no_damage

.no_cape
#_078091: LDA.w $037B
#_078094: BNE .no_damage

#_078096: LDA.w $0373
#_078099: STA.b $00

#_07809B: STZ.w $0373

#_07809E: LDA.w $0C4A
#_0780A1: CMP.b #$05 ; ANCILLA 05
#_0780A3: BNE .dont_delete_boom

#_0780A5: LDA.w $0300
#_0780A8: BNE .dont_delete_boom

#_0780AA: LDA.b $3D
#_0780AC: BEQ .dont_delete_boom

#_0780AE: STZ.w $0C4A
#_0780B1: STZ.w $035F

.dont_delete_boom
#_0780B4: LDA.w $031F
#_0780B7: BNE .dont_mess_with_boom

#_0780B9: LDA.b #$3A
#_0780BB: STA.w $031F

.dont_mess_with_boom
#_0780BE: LDA.b #$26 ; SFX2.26
#_0780C0: JSR PlaySFX_Set2

#_0780C3: INC.w $0CFC

#_0780C6: LDA.l $7EF36D
#_0780CA: SEC
#_0780CB: SBC.b $00

#_0780CD: CMP.b #$00
#_0780CF: BEQ .you_died

#_0780D1: CMP.b #$A8
#_0780D3: BCC .do_not_die

;---------------------------------------------------------------------------------------------------

.you_died
#_0780D5: LDA.b $1C
#_0780D7: STA.l $7EC211

#_0780DB: LDA.b $1D
#_0780DD: STA.l $7EC212

#_0780E1: LDA.b $10
#_0780E3: STA.w $010C

#_0780E6: LDA.b #$12
#_0780E8: STA.b $10

#_0780EA: LDA.b #$01
#_0780EC: STA.b $11

#_0780EE: LDA.b #$00
#_0780F0: STA.w $031F
#_0780F3: STA.l $7EF372

;---------------------------------------------------------------------------------------------------

.do_not_die
#_0780F7: STA.l $7EF36D

.no_damage
#_0780FB: LDA.b $5D
#_0780FD: BEQ .base_state

#_0780FF: JSR Link_HandleCape_passive

.base_state
#_078102: LDA.b $5D
#_078104: ASL A
#_078105: TAX

#_078106: JMP.w (.vectors,X)

;===================================================================================================

LinkState_Default:
#_078109: JSR CacheCameraPropertiesIfOutdoors

#_07810C: LDA.b $F5
#_07810E: AND.b #$80
#_078110: BEQ .stay_in_bounds_forever

#_078112: LDA.w $037F
#_078115: EOR.b #$01
#_078117: STA.w $037F

.stay_in_bounds_forever
#_07811A: JSR Link_HandleBunnyTransformation
#_07811D: BCC .no_bunny

#_07811F: LDA.b $5D
#_078121: CMP.b #$17 ; LINKSTATE 17
#_078123: BNE .already_bunny

#_078125: BRL LinkState_Bunny

.already_bunny
#_078128: RTS

;---------------------------------------------------------------------------------------------------

.no_bunny
#_078129: STZ.w $02CA

#_07812C: LDA.b $4D
#_07812E: BEQ .not_recoiling

;---------------------------------------------------------------------------------------------------

#HandleLink_From1D:
#_078130: STZ.w $0301
#_078133: STZ.w $037A

#_078136: STZ.w $020B
#_078139: STZ.w $0350

#_07813C: STZ.w $030D
#_07813F: STZ.w $030E

#_078142: STZ.w $030A

#_078145: STZ.b $3B

#_078147: LDA.b $3A
#_078149: AND.b #$BF
#_07814B: STA.b $3A

#_07814D: STZ.w $0308
#_078150: STZ.w $0309

#_078153: STZ.w $0376
#_078156: STZ.b $48

#_078158: JSL Link_ResetSwimmingState

#_07815C: LDA.b $50
#_07815E: AND.b #$FE
#_078160: STA.b $50

#_078162: STZ.b $25

#_078164: LDA.w $0360
#_078167: BEQ .no_zapping

#_078169: LDA.b $55
#_07816B: BEQ .cape_is_off

#_07816D: JSR Link_ForceUnequipCape_quietly

;---------------------------------------------------------------------------------------------------

.cape_is_off
#_078170: JSR Link_ResetSwordAndItemUsage

#_078173: LDA.b #$01
#_078175: STA.w $037B

#_078178: STZ.w $0300

#_07817B: LDA.b #$02
#_07817D: STA.b $3D

#_07817F: STZ.b $2E

#_078181: LDA.b $67
#_078183: AND.b #$F0
#_078185: STA.b $67

#_078187: LDA.b #$2B ; SFX3.2B
#_078189: JSR PlaySFX_Set3

#_07818C: LDA.b #$07 ; LINKSTATE 07
#_07818E: STA.b $5D

#_078190: BRL LinkState_Zapped

;---------------------------------------------------------------------------------------------------

.no_zapping
#_078193: LDA.b $1B
#_078195: BNE .pointless_branch

.pointless_branch
#_078197: STZ.b $6B

#_078199: LDA.b #$02 ; LINKSTATE 02
#_07819B: STA.b $5D

#_07819D: BRL LinkState_Recoil

;===================================================================================================

.not_recoiling
#_0781A0: LDA.b #$FF
#_0781A2: STA.b $24
#_0781A4: STA.b $25
#_0781A6: STA.b $29

#_0781A8: STZ.w $02C6

#_0781AB: JSR Link_HandleToss
#_0781AE: BCS .continue_a

#_0781B0: JSR Link_HandleAPress

#_0781B3: LDA.w $0308
#_0781B6: ORA.w $0376
#_0781B9: BNE .continue_a

#_0781BB: LDA.w $0377
#_0781BE: BNE .continue_a

; Spinspeed/item dash fix
#_0781C0: LDA.b $5D
#_0781C2: CMP.b #$11 ; LINKSTATE 11
#_0781C4: BEQ .continue_a

#_0781C6: JSR Link_HandleYItem

#_0781C9: LDA.l $7EF3C5
#_0781CD: BEQ .continue_a

#_0781CF: JSR Link_HandleSwordCooldown

#_0781D2: LDA.b $5D
#_0781D4: CMP.b #$03 ; LINKSTATE 03
#_0781D6: BNE .continue_a

#_0781D8: STZ.b $30
#_0781DA: STZ.b $31

#_0781DC: BRL .dont_halt_link

;---------------------------------------------------------------------------------------------------

.continue_a
#_0781DF: JSR Link_HandleCape_passive_LiftCheck

#_0781E2: LDA.b $46
#_0781E4: BEQ .not_recoil_timering

#_0781E6: LDA.b $6B
#_0781E8: BEQ .dont_reset_slope

#_0781EA: STZ.b $6B

.dont_reset_slope
#_0781EC: STZ.w $030D
#_0781EF: STZ.w $030E
#_0781F2: STZ.w $030A

#_0781F5: STZ.b $3B

#_0781F7: STZ.w $0309
#_0781FA: STZ.w $0308

#_0781FD: STZ.w $0376

#_078200: LDA.b $3A
#_078202: AND.b #$80
#_078204: BNE .dont_allow_turning

#_078206: LDA.b $50
#_078208: AND.b #$FE
#_07820A: STA.b $50

.dont_allow_turning
#_07820C: BRL Link_HandleRecoilAndTimer

;---------------------------------------------------------------------------------------------------

.not_recoil_timering
#_07820F: LDA.w $0377
#_078212: BEQ .no_forced_pull_anim

#_078214: STZ.b $67

#_078216: BRA .proceed_to_finish_up

.no_forced_pull_anim
#_078218: LDA.w $02E1
#_07821B: BNE .proceed_to_finish_up

#_07821D: LDA.w $0376
#_078220: AND.b #$FD
#_078222: BNE .proceed_to_finish_up

#_078224: LDA.w $0308
#_078227: AND.b #$7F
#_078229: BNE .proceed_to_finish_up

#_07822B: LDA.w $0308
#_07822E: AND.b #$80
#_078230: BEQ .not_carrying

#_078232: LDA.w $0309
#_078235: AND.b #$01
#_078237: BNE .proceed_to_finish_up

.not_carrying
#_078239: LDA.w $0301
#_07823C: BNE .proceed_to_finish_up

#_07823E: LDA.w $037A
#_078241: BNE .proceed_to_finish_up

#_078243: LDA.b $3C
#_078245: CMP.b #$09
#_078247: BCS .sword_out

#_078249: LDA.b $3A
#_07824B: AND.b #$20
#_07824D: BNE .sword_out

#_07824F: LDA.b $3A
#_078251: AND.b #$80
#_078253: BEQ .sword_out

;---------------------------------------------------------------------------------------------------

.proceed_to_finish_up
#_078255: BRA .finish_up

;---------------------------------------------------------------------------------------------------

.sword_out
#_078257: LDA.w $034A
#_07825A: BEQ .not_on_any_ice

#_07825C: LDA.b #$01
#_07825E: STA.w $0335
#_078261: STA.w $0337

#_078264: LDA.b #$80
#_078266: STA.w $0334
#_078269: STA.w $0336

#_07826C: BRL Link_HandleSwimMovements

;---------------------------------------------------------------------------------------------------

.not_on_any_ice
#_07826F: JSR ResetAllAcceleration

#_078272: LDA.b $49
#_078274: AND.b #$0F
#_078276: BNE .am_moving

#_078278: LDA.w $0376
#_07827B: AND.b #$02
#_07827D: BNE .finish_up

#_07827F: LDA.b $F0
#_078281: AND.b #$0F
#_078283: BNE .am_moving

#_078285: STA.b $30
#_078287: STA.b $31

#_078289: STA.b $67
#_07828B: STA.b $26

#_07828D: STZ.b $2E

#_07828F: LDA.b $48
#_078291: AND.b #$F0
#_078293: STA.b $48

#_078295: LDX.b #$20
#_078297: STX.w $0371

#_07829A: LDX.b #$13
#_07829C: STX.w $0375

#_07829F: BRA .finish_up

;---------------------------------------------------------------------------------------------------

.am_moving
#_0782A1: STA.b $67

#_0782A3: CMP.b $26
#_0782A5: BEQ .directions_matching

#_0782A7: STZ.b $2A
#_0782A9: STZ.b $2B
#_0782AB: STZ.b $6B
#_0782AD: STZ.b $48

#_0782AF: LDX.b #$20
#_0782B1: STX.w $0371

#_0782B4: LDX.b #$13
#_0782B6: STX.w $0375

.directions_matching
#_0782B9: STA.b $26

;---------------------------------------------------------------------------------------------------

.finish_up
#_0782BB: JSR Link_HandleDiagonalCollision
#_0782BE: JSL Link_HandleVelocity
#_0782C2: JSR Link_HandleCardinalCollision

#_0782C5: JSL Link_HandleMovingAnimation_FullLongEntry

#_0782C9: LDA.w $0377
#_0782CC: BEQ .dont_halt_link

#_0782CE: STZ.b $30
#_0782D0: STZ.b $31

.dont_halt_link
#_0782D2: STZ.w $0302

#_0782D5: JSR HandleIndoorCameraAndDoors

;---------------------------------------------------------------------------------------------------

#EXIT_0782D8:
#_0782D8: CLC

#_0782D9: RTS

;===================================================================================================

Link_HandleBunnyTransformation:
#_0782DA: LDA.w $03F5
#_0782DD: ORA.w $03F6
#_0782E0: BEQ EXIT_0782D8

#_0782E2: LDA.w $03F7
#_0782E5: BNE .tick_timer

#_0782E7: LDA.b $5D
#_0782E9: CMP.b #$17 ; LINKSTATE 17
#_0782EB: BEQ .exit_clear_timer

#_0782ED: CMP.b #$1C ; LINKSTATE 1C
#_0782EF: BEQ .exit_clear_timer

#_0782F1: LDA.w $0309
#_0782F4: AND.b #$02
#_0782F6: BEQ .ignore_carry

#_0782F8: STZ.w $0308

.ignore_carry
#_0782FB: LDA.w $0308
#_0782FE: AND.b #$80
#_078300: PHA

#_078301: JSL Link_ResetProperties_A

#_078305: PLA
#_078306: STA.w $0308

;---------------------------------------------------------------------------------------------------

#_078309: LDX.b #$04

.next_ancilla
#_07830B: LDA.w $0C4A,X
#_07830E: CMP.b #$30 ; ANCILLA 30
#_078310: BEQ .kill_ancilla

#_078312: CMP.b #$31 ; ANCILLA 31
#_078314: BNE .skip_ancilla

.kill_ancilla
#_078316: STZ.w $0C4A,X

.skip_ancilla
#_078319: DEX
#_07831A: BPL .next_ancilla

;---------------------------------------------------------------------------------------------------

#_07831C: JSR Link_CancelDash

#_07831F: LDY.b #$04
#_078321: LDA.b #$23 ; ANCILLA 23
#_078323: JSL AncillaAdd_CapePoof

#_078327: LDA.b #$14 ; SFX2.14
#_078329: JSR PlaySFX_Set2

#_07832C: LDA.b #$14
#_07832E: STA.w $02E2

#_078331: LDA.b #$01
#_078333: STA.w $037B
#_078336: STA.w $03F7

#_078339: LDA.b #$0C
#_07833B: STA.b $4B

;---------------------------------------------------------------------------------------------------

.tick_timer
#_07833D: DEC.w $02E2
#_078340: BPL .dont_revert

#_078342: LDA.b #$1C ; LINKSTATE 1C
#_078344: STA.b $5D

#_078346: LDA.b #$01
#_078348: STA.w $02E0
#_07834B: STA.b $56

#_07834D: JSL RefreshLinkEquipmentPalettes_bunny

#_078351: STZ.b $4B
#_078353: STZ.w $037B
#_078356: STZ.w $03F7

#_078359: BRA .dont_revert

;---------------------------------------------------------------------------------------------------

.exit_clear_timer
#_07835B: STZ.w $03F5
#_07835E: STZ.w $03F6

#_078361: CLC

#_078362: RTS

;---------------------------------------------------------------------------------------------------

.dont_revert
#_078363: SEC

#_078364: RTS

;===================================================================================================

LinkState_TemporaryBunny:
#_078365: LDA.w $03F5
#_078368: ORA.w $03F6
#_07836B: BNE .delay_change_back

#_07836D: LDY.b #$04
#_07836F: LDA.b #$23 ; ANCILLA 23
#_078371: JSL AncillaAdd_CapePoof

#_078375: LDA.b #$15 ; SFX2.15
#_078377: JSR PlaySFX_Set2

#_07837A: LDA.b #$20
#_07837C: STA.w $02E2

#_07837F: LDA.b #$00 ; LINKSTATE 00
#_078381: STA.b $5D

#_078383: JSL Link_ResetProperties_C

#_078387: STZ.w $03F7

#_07838A: STZ.b $56
#_07838C: STZ.w $02E0

#_07838F: JSL RefreshLinkEquipmentPalettes_sword_and_mail

#_078393: STZ.w $03F7

#_078396: BRL LinkState_Default

;---------------------------------------------------------------------------------------------------

#UNREACHABLE_078399:
#_078399: RTS

;---------------------------------------------------------------------------------------------------

.delay_change_back
#_07839A: REP #$20

#_07839C: DEC.w $03F5

#_07839F: SEP #$20

;===================================================================================================

LinkState_Bunny:
#_0783A1: JSR CacheCameraPropertiesIfOutdoors

#_0783A4: LDA.b $F5
#_0783A6: AND.b #$80
#_0783A8: BEQ .dont_toggle_oob

#_0783AA: LDA.w $037F
#_0783AD: EOR.b #$01
#_0783AF: STA.w $037F

.dont_toggle_oob
#_0783B2: STZ.w $02CA

#_0783B5: LDA.w $0345
#_0783B8: BNE LinkState_Bunny_recache

#_0783BA: LDA.b $4D
#_0783BC: BEQ .recoiling

#_0783BE: LDA.l $7EF357
#_0783C2: BEQ LinkState_Bunny_recache

#_0783C4: STZ.w $02E0

;===================================================================================================

#LinkState_Bunny_recache:
#_0783C7: STZ.w $03F7
#_0783CA: STZ.w $03F5
#_0783CD: STZ.w $03F6

#_0783D0: LDA.l $7EF357
#_0783D4: BEQ .no_pearl_a

#_0783D6: STZ.b $56
#_0783D8: STZ.b $4D

;---------------------------------------------------------------------------------------------------

.no_pearl_a
#_0783DA: STZ.b $2E
#_0783DC: STZ.w $02E1
#_0783DF: STZ.b $50

#_0783E1: JSL Link_ResetSwimmingState

#_0783E5: LDA.b #$02 ; LINKSTATE 02
#_0783E7: STA.b $5D

#_0783E9: LDA.l $7EF357
#_0783ED: BEQ .no_pearl_b

#_0783EF: LDA.b #$00 ; LINKSTATE 00
#_0783F1: STA.b $5D

#_0783F3: JSL RefreshLinkEquipmentPalettes_sword_and_mail

.no_pearl_b
#_0783F7: BRL .exit

;---------------------------------------------------------------------------------------------------

.recoiling
#_0783FA: LDA.b $46
#_0783FC: BEQ .wait_maybe_not_recoiling

#_0783FE: BRL Link_HandleRecoilAndTimer

.wait_maybe_not_recoiling
#_078401: LDA.b #$FF
#_078403: STA.b $24
#_078405: STA.b $25
#_078407: STA.b $29

#_078409: STZ.w $02C6

#_07840C: LDA.w $034A
#_07840F: BEQ .not_moving

#_078411: LDA.b #$01
#_078413: STA.w $0335
#_078416: STA.w $0337

#_078419: LDA.b #$80
#_07841B: STA.w $0334
#_07841E: STA.w $0336

#_078421: BRL Link_HandleSwimMovements

;---------------------------------------------------------------------------------------------------

.not_moving
#_078424: JSR ResetAllAcceleration
#_078427: JSR Link_HandleYItem

#_07842A: LDA.b $49
#_07842C: AND.b #$0F
#_07842E: BNE .movement

#_078430: LDA.b $F0
#_078432: AND.b #$0F
#_078434: BNE .movement

#_078436: STA.b $30
#_078438: STA.b $31

#_07843A: STA.b $67
#_07843C: STA.b $26

#_07843E: STZ.b $2E

#_078440: LDA.b $48
#_078442: AND.b #$F6
#_078444: STA.b $48

#_078446: LDX.b #$20
#_078448: STX.w $0371

#_07844B: LDX.b #$13
#_07844D: STX.w $0375
#_078450: BRA .finish_up

;---------------------------------------------------------------------------------------------------

.movement
#_078452: STA.b $67

#_078454: CMP.b $26
#_078456: BEQ .directions_match

#_078458: STZ.b $2A
#_07845A: STZ.b $2B

#_07845C: STZ.b $6B
#_07845E: STZ.b $48

#_078460: LDX.b #$20
#_078462: STX.w $0371

#_078465: LDX.b #$13
#_078467: STX.w $0375

.directions_match
#_07846A: STA.b $26

;---------------------------------------------------------------------------------------------------

.finish_up
#_07846C: JSR Link_HandleDiagonalCollision
#_07846F: JSL Link_HandleVelocity
#_078473: JSR Link_HandleCardinalCollision
#_078476: JSL Link_HandleMovingAnimation_FullLongEntry

#_07847A: STZ.w $0302

#_07847D: JSR HandleIndoorCameraAndDoors

.exit
#_078480: RTS

;===================================================================================================

LinkState_HoldingBigRock:
#_078481: LDA.b $4D
#_078483: BEQ .no_recoil

#_078485: STZ.w $0301
#_078488: STZ.w $037A

#_07848B: STZ.w $020B

#_07848E: STZ.w $0350
#_078491: STZ.w $030D
#_078494: STZ.w $030E
#_078497: STZ.w $030A

#_07849A: STZ.b $3B

#_07849C: STZ.w $0308
#_07849F: STZ.w $0309
#_0784A2: STZ.w $0376

#_0784A5: STZ.b $48

#_0784A7: LDA.b $50
#_0784A9: AND.b #$FE
#_0784AB: STA.b $50

#_0784AD: STZ.b $25

#_0784AF: LDA.w $0360
#_0784B2: BEQ .no_zapping

#_0784B4: JSR Link_ResetSwordAndItemUsage

#_0784B7: LDA.b #$01
#_0784B9: STA.w $037B

#_0784BC: STZ.w $0300

#_0784BF: LDA.b #$02
#_0784C1: STA.b $3D

#_0784C3: STZ.b $2E

#_0784C5: LDA.b $67
#_0784C7: AND.b #$F0
#_0784C9: STA.b $67

#_0784CB: LDA.b #$2B ; SFX3.2B
#_0784CD: JSR PlaySFX_Set3

#_0784D0: LDA.b #$07 ; LINKSTATE 07
#_0784D2: STA.b $5D

#_0784D4: BRL LinkState_Zapped

;---------------------------------------------------------------------------------------------------

.no_zapping
#_0784D7: LDA.b #$02 ; LINKSTATE 02
#_0784D9: STA.b $5D

#_0784DB: BRL LinkState_Recoil

;---------------------------------------------------------------------------------------------------

.no_recoil
#_0784DE: LDA.b #$FF
#_0784E0: STA.b $24
#_0784E2: STA.b $25
#_0784E4: STA.b $29

#_0784E6: STZ.w $02C6

#_0784E9: LDA.b $46
#_0784EB: BEQ .definitely_no_recoil

#_0784ED: STZ.w $030D
#_0784F0: STZ.w $030E
#_0784F3: STZ.w $030A

#_0784F6: STZ.b $3B

#_0784F8: STZ.w $0308
#_0784FB: STZ.w $0309

#_0784FE: STZ.w $0376

#_078501: LDA.b $3A
#_078503: AND.b #$80
#_078505: BNE .dont_allow_turn

#_078507: LDA.b $50
#_078509: AND.b #$FE
#_07850B: STA.b $50

.dont_allow_turn
#_07850D: BRL Link_HandleRecoilAndTimer

;---------------------------------------------------------------------------------------------------

.definitely_no_recoil
#_078510: JSR Link_HandleAPress

#_078513: LDA.b $F0
#_078515: AND.b #$0F
#_078517: BNE .pressing_d_pad

#_078519: STA.b $30
#_07851B: STA.b $31

#_07851D: STA.b $67

#_07851F: STA.b $26
#_078521: STZ.b $2E

#_078523: LDA.b $48
#_078525: AND.b #$F6
#_078527: STA.b $48

#_078529: LDX.b #$20
#_07852B: STX.w $0371

#_07852E: LDX.b #$13
#_078530: STX.w $0375

#_078533: BRA .handle_the_animation

;---------------------------------------------------------------------------------------------------

.pressing_d_pad
#_078535: STA.b $67

#_078537: CMP.b $26
#_078539: BEQ .directions_do_match

#_07853B: STZ.b $2A
#_07853D: STZ.b $2B

#_07853F: STZ.b $6B
#_078541: STZ.b $48

#_078543: LDX.b #$20
#_078545: STX.w $0371

#_078548: LDX.b #$13
#_07854A: STX.w $0375

;---------------------------------------------------------------------------------------------------

.directions_do_match
#_07854D: STA.b $26

.handle_the_animation
#_07854F: JSL Link_HandleMovingAnimation_FullLongEntry

#_078553: STZ.w $0302

#_078556: JSR HandleIndoorCameraAndDoors

#_078559: RTS

;===================================================================================================

EtherTablet_StartCutscene:
#_07855A: REP #$20

#_07855C: LDA.w #$00C0
#_07855F: STA.b $3C

#_078561: SEP #$20

#_078563: LDA.b #$19 ; LINKSTATE 19
#_078565: STA.b $5D

#_078567: LDA.b #$01
#_078569: STA.w $037B
#_07856C: STA.w $0FFC

#_07856F: RTL

;===================================================================================================

LinkState_ReceivingEther:
#_078570: STZ.b $4D
#_078572: STZ.b $46

#_078574: STZ.w $0373

#_078577: REP #$20

#_078579: DEC.b $3C

#_07857B: LDA.b $3C
#_07857D: BMI .spinning
#_07857F: BEQ .spawn_medallion

#_078581: CMP.w #$00A0
#_078584: BEQ .add_lightning

#_078586: CMP.w #$00BF
#_078589: BEQ .sword_up

#_07858B: SEP #$20

#_07858D: RTS

;---------------------------------------------------------------------------------------------------

.spinning
#_07858E: SEP #$20

#_078590: STZ.b $3C
#_078592: STZ.b $3D

#_078594: RTS

;---------------------------------------------------------------------------------------------------

.sword_up
#_078595: SEP #$20

#_078597: LDA.b #$01
#_078599: STA.w $03EF

#_07859C: RTS

;---------------------------------------------------------------------------------------------------

.spawn_medallion
#_07859D: SEP #$20

#_07859F: LDX.b #$00

#_0785A1: LDY.b #$04
#_0785A3: LDA.b #$29 ; ANCILLA 29
#_0785A5: JSL AncillaAdd_FallingPrize

#_0785A9: LDA.b #$01
#_0785AB: STA.w $02E4

#_0785AE: STZ.w $0FFC

#_0785B1: RTS

;---------------------------------------------------------------------------------------------------

.add_lightning
#_0785B2: SEP #$20

#_0785B4: LDA.b $20
#_0785B6: PHA

#_0785B7: LDA.b $21
#_0785B9: PHA

#_0785BA: LDA.b $22
#_0785BC: PHA

#_0785BD: LDA.b $23
#_0785BF: PHA

#_0785C0: LDA.b #$37
#_0785C2: STA.b $20

#_0785C4: LDA.b #$00
#_0785C6: STA.b $21

#_0785C8: LDA.b #$B0
#_0785CA: STA.b $22

#_0785CC: LDA.b #$06
#_0785CE: STA.b $23

#_0785D0: LDY.b #$00
#_0785D2: LDA.b #$18 ; ANCILLA 18
#_0785D4: JSL AncillaAdd_EtherSpell

#_0785D8: PLA
#_0785D9: STA.b $23

#_0785DB: PLA
#_0785DC: STA.b $22

#_0785DE: PLA
#_0785DF: STA.b $21

#_0785E1: PLA
#_0785E2: STA.b $20

#_0785E4: RTS

;===================================================================================================

BombosTablet_StartCutscene:
#_0785E5: REP #$20

#_0785E7: LDA.w #$00E0
#_0785EA: STA.b $3C

#_0785EC: SEP #$20

#_0785EE: LDA.b #$1A ; LINKSTATE 1A
#_0785F0: STA.b $5D

#_0785F2: LDA.b #$01
#_0785F4: STA.w $037B
#_0785F7: STA.w $0112

#_0785FA: RTL

;===================================================================================================

LinkState_ReceivingBombos:
#_0785FB: STZ.b $4D
#_0785FD: STZ.b $46

#_0785FF: STZ.w $0373

#_078602: REP #$20

#_078604: DEC.b $3C

#_078606: LDA.b $3C
#_078608: BMI .spinning
#_07860A: BEQ .spawn_medallion

#_07860C: CMP.w #$00A0
#_07860F: BEQ .EXPLOSION

#_078611: CMP.w #$00DF
#_078614: BEQ .sword_up

#_078616: SEP #$20

#_078618: RTS

.sword_up
#_078619: SEP #$20

#_07861B: LDA.b #$01
#_07861D: STA.w $03EF

#_078620: RTS

;---------------------------------------------------------------------------------------------------

.spinning
#_078621: SEP #$20

#_078623: STZ.b $3C
#_078625: STZ.b $3D

#_078627: RTS

;---------------------------------------------------------------------------------------------------

.spawn_medallion
#_078628: SEP #$20

#_07862A: LDY.b #$04
#_07862C: LDX.b #$05
#_07862E: LDA.b #$29 ; ANCILLA 29
#_078630: JSL AncillaAdd_FallingPrize

#_078634: LDA.b #$01
#_078636: STA.w $02E4

#_078639: RTS

;---------------------------------------------------------------------------------------------------

.EXPLOSION
#_07863A: SEP #$20

#_07863C: LDA.b $20
#_07863E: PHA

#_07863F: LDA.b $21
#_078641: PHA

#_078642: LDA.b $22
#_078644: PHA

#_078645: LDA.b $23
#_078647: PHA

#_078648: LDA.b #$B0
#_07864A: STA.b $20

#_07864C: LDA.b #$0E
#_07864E: STA.b $21

#_078650: LDA.b #$78
#_078652: STA.b $22

#_078654: LDA.b #$03
#_078656: STA.b $23

#_078658: LDY.b #$00
#_07865A: LDA.b #$19 ; ANCILLA 19
#_07865C: JSL AncillaAdd_BombosSpell

#_078660: PLA
#_078661: STA.b $23

#_078663: PLA
#_078664: STA.b $22

#_078666: PLA
#_078667: STA.b $21

#_078669: PLA
#_07866A: STA.b $20

#_07866C: RTS

;===================================================================================================

InitiateDesertCutscene:
#_07866D: REP #$20

#_07866F: LDA.w #$0001
#_078672: STA.b $3C

#_078674: SEP #$20

#_078676: LDA.b #$1B ; LINKSTATE 1B
#_078678: STA.b $5D

#_07867A: RTL

;===================================================================================================

LinkState_ReadingDesertTablet:
#_07867B: DEC.b $3C

#_07867D: LDA.b $3C
#_07867F: BNE .delay

#_078681: LDA.b #$00 ; LINKSTATE 00
#_078683: STA.b $5D

#_078685: JSR Link_PerformDesertPrayer

.delay
#_078688: RTS

;===================================================================================================

HandleSomariaAndGraves:
#_078689: LDA.b $1B
#_07868B: BNE .ignore_graves

#_07868D: LDA.w $03E9
#_078690: BEQ .ignore_graves

;---------------------------------------------------------------------------------------------------

#_078692: LDX.b #$04

.next_slot
#_078694: LDA.w $0C4A,X
#_078697: CMP.b #$24 ; ANCILLA 24
#_078699: BNE .not_grave

#_07869B: JSL Gravestone_Move

.not_grave
#_07869F: DEX
#_0786A0: BPL .next_slot

;---------------------------------------------------------------------------------------------------

.ignore_graves
#_0786A2: LDX.b #$04

.next_slot_again
#_0786A4: LDA.w $0C4A,X
#_0786A7: CMP.b #$2C ; ANCILLA 2C
#_0786A9: BNE .not_somaria

#_0786AB: JSL SomariaBlock_HandlePlayerInteraction

#_0786AF: BRA .done

;---------------------------------------------------------------------------------------------------

.not_somaria
#_0786B1: DEX
#_0786B2: BPL .next_slot_again

.done
#_0786B4: RTS

;===================================================================================================

LinkState_Recoil:
#_0786B5: LDA.b $20
#_0786B7: STA.b $3E

#_0786B9: LDA.b $21
#_0786BB: STA.b $40

#_0786BD: LDA.b $22
#_0786BF: STA.b $3F

#_0786C1: LDA.b $23
#_0786C3: STA.b $41

#_0786C5: JSR Link_HandleChangeInZVelocity

#_0786C8: STZ.b $50

#_0786CA: STZ.w $0351

#_0786CD: LDA.b $24
#_0786CF: BPL Link_HandleRecoilAndTimer

#_0786D1: LDA.b $29
#_0786D3: BPL Link_HandleRecoilAndTimer

#_0786D5: LDY.b #$05
#_0786D7: JSR TileDetect_MainHandler

#_0786DA: LDA.w $0341
#_0786DD: AND.b #$01
#_0786DF: BEQ .no_deep_water_interaction

#_0786E1: LDA.b #$04 ; LINKSTATE 04
#_0786E3: STA.b $5D

#_0786E5: JSR Link_SetToDeepWater

#_0786E8: JSR Link_ResetSwordAndItemUsage

#_0786EB: LDA.b #$15 ; ANCILLA 15
#_0786ED: LDY.b #$00
#_0786EF: JSL AncillaAdd_Splash

#_0786F3: BRL Link_CheckLayerForChange

;---------------------------------------------------------------------------------------------------

.no_deep_water_interaction
#_0786F6: INC.w $02C6

#_0786F9: LDA.w $02C6
#_0786FC: CMP.b #$04
#_0786FE: BEQ .done_bouncing

#_078700: TAX

#_078701: LDA.w $02C7

.shift
#_078704: LSR A

#_078705: DEX
#_078706: BEQ .shift

#_078708: STA.b $29
#_07870A: BNE Link_HandleRecoilAndTimer

.done_bouncing
#_07870C: LDA.b #$03
#_07870E: STA.w $02C6

;===================================================================================================

Link_HandleRecoilAndTimer:
#_078711: STZ.b $68
#_078713: STZ.b $69
#_078715: STZ.b $6A

#_078717: JSR Link_HandleRecoiling

#_07871A: DEC.b $46

#_07871C: LDA.b $46
#_07871E: BEQ .delay

.airborne
#_078720: BRL Link_HandleRecoilVelocity

;---------------------------------------------------------------------------------------------------

.delay
#_078723: INC A
#_078724: STA.b $46

#_078726: LDA.b $24
#_078728: AND.b #$FE
#_07872A: BEQ .no_height
#_07872C: BPL .airborne

.no_height
#_07872E: LDA.b $29
#_078730: BPL .airborne

#_078732: LDA.b $4D
#_078734: BNE .not_special_recoil

#_078736: BRL Link_HandleRecoilVelocity_and_reset

;---------------------------------------------------------------------------------------------------

.not_special_recoil
#_078739: STZ.w $037B

#_07873C: LDA.b $5D
#_07873E: STA.b $72

#_078740: LDA.b $5D
#_078742: CMP.b #$06 ; LINKSTATE 06
#_078744: BEQ .jumping

#_078746: STZ.b $3C
#_078748: STZ.b $3A
#_07874A: STZ.b $3D

#_07874C: STZ.b $79

.jumping
#_07874E: JSR Link_SplashUponLanding

#_078751: LDA.w $02E0
#_078754: BEQ .not_bunny

#_078756: LDA.w $0345
#_078759: BEQ .not_bunny

#_07875B: BRL Link_CheckLayerForChange_preserve_layer

;---------------------------------------------------------------------------------------------------

.not_bunny
#_07875E: LDA.w $02F8
#_078761: BEQ .no_guaranteed_thud

#_078763: STZ.w $02F8

#_078766: BRA .play_thud

;---------------------------------------------------------------------------------------------------

.no_guaranteed_thud
#_078768: LDA.b $72
#_07876A: CMP.b #$02 ; LINKSTATE 02
#_07876C: BEQ .skip_thud_sfx

#_07876E: LDA.b $5D
#_078770: CMP.b #$04 ; LINKSTATE 04
#_078772: BEQ .skip_thud_sfx

.play_thud
#_078774: LDA.b #$21 ; SFX2.21
#_078776: JSR PlaySFX_Set2

.skip_thud_sfx
#_078779: LDY.b $5D
#_07877B: CPY.b #$04 ; LINKSTATE 04
#_07877D: BNE .not_swimming

#_07877F: JSR Link_ForceUnequipCape_quietly

#_078782: LDA.b $1B
#_078784: BEQ .dont_swap_layers

#_078786: LDA.b $72
#_078788: CMP.b #$02 ; LINKSTATE 02
#_07878A: BEQ .dont_swap_layers

#_07878C: LDA.l $7EF356
#_078790: BEQ .dont_swap_layers

#_078792: LDA.b #$01
#_078794: STA.b $EE

.dont_swap_layers
#_078796: LDA.b #$15 ; ANCILLA 15
#_078798: LDY.b #$00
#_07879A: JSL AncillaAdd_Splash

;---------------------------------------------------------------------------------------------------

.not_swimming
#_07879E: LDY.b #$00
#_0787A0: JSR TileDetect_MainHandler

#_0787A3: LDA.w $0357
#_0787A6: AND.b #$01
#_0787A8: BEQ .not_in_thick_grass

#_0787AA: LDA.b #$1A ; SFX2.1A
#_0787AC: JSR PlaySFX_Set2

.not_in_thick_grass
#_0787AF: LDA.w $0359
#_0787B2: AND.b #$01
#_0787B4: BEQ .skip_sploosh_sfx

#_0787B6: LDA.w $012E
#_0787B9: CMP.b #$24 ; SFX2.24
#_0787BB: BEQ .skip_sploosh_sfx

#_0787BD: LDA.b #$1C ; SFX2.1C
#_0787BF: JSR PlaySFX_Set2

;---------------------------------------------------------------------------------------------------

.skip_sploosh_sfx
#_0787C2: LDA.w $0341
#_0787C5: AND.b #$01
#_0787C7: BEQ Link_CheckLayerForChange

#_0787C9: LDA.b #$04 ; LINKSTATE 04
#_0787CB: STA.b $5D

#_0787CD: JSR Link_SetToDeepWater
#_0787D0: JSR Link_ResetSwordAndItemUsage

#_0787D3: LDA.b #$15 ; ANCILLA 15
#_0787D5: LDY.b #$00
#_0787D7: JSL AncillaAdd_Splash

;===================================================================================================

Link_CheckLayerForChange:
#_0787DB: LDA.b $EE
#_0787DD: CMP.b #$02
#_0787DF: BNE .dont_reset_layer

#_0787E1: STZ.b $EE

.dont_reset_layer
#_0787E3: LDA.w $047A
#_0787E6: BEQ .preserve_layer

#_0787E8: JSL Underworld_HandleLayerChange

.preserve_layer
#_0787EC: STZ.b $24
#_0787EE: STZ.b $25

#_0787F0: STZ.b $4D

#_0787F2: STZ.b $5E
#_0787F4: STZ.b $50

#_0787F6: STZ.w $0301
#_0787F9: STZ.w $037A

#_0787FC: STZ.w $0300
#_0787FF: STZ.w $037B
#_078802: STZ.w $0360

#_078805: STZ.b $27
#_078807: STZ.b $28

;===================================================================================================

Link_HandleRecoilVelocity_and_reset:
#_078809: STZ.b $2E
#_07880B: STZ.b $46

;===================================================================================================

Link_HandleRecoilVelocity:
#_07880D: LDA.b $5D
#_07880F: CMP.b #$05 ; LINKSTATE 05
#_078811: BEQ .icy_or_low_timer

#_078813: LDA.b $46
#_078815: CMP.b #$21
#_078817: BCC .icy_or_low_timer

#_078819: DEC.w $02C5
#_07881C: BPL .delay_flagging

#_07881E: LSR A
#_07881F: LSR A
#_078820: LSR A
#_078821: LSR A
#_078822: STA.w $02C5

.icy_or_low_timer
#_078825: JSR Flag67WithDirections

#_078828: LDA.b $5D
#_07882A: CMP.b #$06 ; LINKSTATE 06
#_07882C: BEQ .find_spot

#_07882E: JSR Link_HandleDiagonalCollision

#_078831: LDA.b $67
#_078833: AND.b #$03
#_078835: BNE .going_horizontally

#_078837: STZ.b $28

.going_horizontally
#_078839: LDA.b $67
#_07883B: AND.b #$0C
#_07883D: BNE .find_spot

#_07883F: STZ.b $27

.find_spot
#_078841: JSL LinkHop_FindArbitraryLandingSpot

;---------------------------------------------------------------------------------------------------

.delay_flagging
#_078845: LDA.b $5D
#_078847: CMP.b #$06 ; LINKSTATE 06
#_078849: BEQ .jumping_out_of_water

#_07884B: JSR Link_HandleCardinalCollision

#_07884E: STZ.w $0302

.jumping_out_of_water
#_078851: JSR HandleIndoorCameraAndDoors

#_078854: LDA.b $24
#_078856: BEQ .not_airborne

#_078858: CMP.b #$E0
#_07885A: BCC .skip_pit_detect

.not_airborne
#_07885C: JSR TileDetect_BigArea

#_07885F: LDA.b $59
#_078861: AND.b #$0F
#_078863: CMP.b #$0F
#_078865: BNE .skip_pit_detect

#_078867: LDA.b #$01 ; LINKSTATE 01
#_078869: STA.b $5D

#_07886B: LDA.b #$04
#_07886D: STA.b $5E

.skip_pit_detect
#_07886F: STZ.b $25

#_078871: RTS

;===================================================================================================

LinkState_OnIce:
#_078872: LDA.b $1B
#_078874: BNE .indoors

#_078876: BRL .overworld

;---------------------------------------------------------------------------------------------------

.indoors
#_078879: LDX.b #$00

#_07887B: LDA.b $EE
#_07887D: BEQ .upper_layer_or_staircase

#_07887F: STZ.b $EE

#_078881: JSR TileDetect_UnusedIce

#_078884: LDX.b #$00

#_078886: LDA.b #$01
#_078888: STA.b $EE

#_07888A: LDA.w $034C
#_07888D: AND.b #$03
#_07888F: CMP.b #$03
#_078891: BEQ .upper_layer_or_staircase

#_078893: LDX.b #$01

.upper_layer_or_staircase
#_078895: STX.w $034E

;---------------------------------------------------------------------------------------------------

.continue_from_ow_stuff
#_078898: DEC.b $3D
#_07889A: BPL .delay

#_07889C: LDA.b #$03
#_07889E: STA.b $3D

#_0788A0: LDA.w $0300
#_0788A3: EOR.b #$01
#_0788A5: STA.w $0300

.delay
#_0788A8: LDA.b $F0
#_0788AA: AND.b #$0F
#_0788AC: BNE .no_dpad

#_0788AE: STA.b $30
#_0788B0: STA.b $31

#_0788B2: STA.b $67
#_0788B4: STA.b $26

#_0788B6: STZ.b $2E

#_0788B8: BRA .continue_b

;---------------------------------------------------------------------------------------------------

.no_dpad
#_0788BA: STA.b $67

#_0788BC: CMP.b $26
#_0788BE: BEQ .matches

#_0788C0: STZ.b $2A
#_0788C2: STZ.b $2B
#_0788C4: STZ.b $6B

.matches
#_0788C6: STA.b $26

;---------------------------------------------------------------------------------------------------

.continue_b
#_0788C8: LDX.b #$10

#_0788CA: LDA.b $67
#_0788CC: AND.b #$0F
#_0788CE: BEQ .just_animate

#_0788D0: AND.b #$0C
#_0788D2: BEQ .moving_for_sure

#_0788D4: LDA.b $67
#_0788D6: AND.b #$03
#_0788D8: BEQ .moving_for_sure

#_0788DA: LDX.b #$0A

.moving_for_sure
#_0788DC: STX.b $00

#_0788DE: LDA.b $67
#_0788E0: AND.b #$0C
#_0788E2: BEQ .no_vertical_movement

#_0788E4: AND.b #$08
#_0788E6: BEQ .moving_on_down

#_0788E8: TXA
#_0788E9: EOR.b #$FF
#_0788EB: INC A
#_0788EC: TAX

.moving_on_down
#_0788ED: STX.b $27

;---------------------------------------------------------------------------------------------------

.no_vertical_movement
#_0788EF: LDX.b $00

#_0788F1: LDA.b $67
#_0788F3: AND.b #$03
#_0788F5: BEQ .just_animate

#_0788F7: AND.b #$02
#_0788F9: BEQ .moving_on_right

#_0788FB: TXA
#_0788FC: EOR.b #$FF
#_0788FE: INC A
#_0788FF: TAX

.moving_on_right
#_078900: STX.b $28

;---------------------------------------------------------------------------------------------------

.just_animate
#_078902: JSL Link_HandleMovingAnimation_FullLongEntry

#_078906: BRL LinkState_Recoil

;---------------------------------------------------------------------------------------------------

.overworld
#_078909: LDY.b #$00
#_07890B: JSR TileDetect_MainHandler

#_07890E: LDA.w $035B
#_078911: AND.b #$01
#_078913: BEQ .reset_layer

#_078915: LDA.b #$02
#_078917: STA.b $EE

#_078919: BRA .layer_is_set

;---------------------------------------------------------------------------------------------------

.reset_layer
#_07891B: STZ.w $00EE

.layer_is_set
#_07891E: LDA.b #$01
#_078920: STA.w $034E

#_078923: BRL .continue_from_ow_stuff

;===================================================================================================

Link_HandleChangeInZVelocity:
#_078926: LDX.b #$02

#_078928: LDA.b $5D
#_07892A: CMP.b #$05 ; LINKSTATE 05
#_07892C: BNE .not_somaria_platform

#_07892E: LDX.b #$01

.not_somaria_platform
#_078930: STX.b $00

.preset
#_078932: LDA.b $29
#_078934: BPL .apply_z_speed_change

#_078936: LDA.b $24
#_078938: BEQ .exit
#_07893A: BPL .apply_z_speed_change

#_07893C: LDA.b #$FF
#_07893E: STA.b $24
#_078940: STA.b $25
#_078942: STA.b $29

#_078944: BRA .exit

;===================================================================================================

#Link_HandleChangeInZVelocity_apply_z_speed_change:
#_078946: LDA.b $29
#_078948: SEC
#_078949: SBC.b $00
#_07894B: STA.b $29

.exit
#_07894D: RTS

;===================================================================================================

LinkState_HoppingSouthOW:
#_07894E: LDA.b #$01
#_078950: STA.b $66

#_078952: STZ.b $50

#_078954: STZ.b $27
#_078956: STZ.b $28

#_078958: STZ.w $0351

#_07895B: LDA.b $46
#_07895D: BNE .continue

#_07895F: LDA.w $0362
#_078962: BNE .continue

#_078964: LDA.b #$20 ; SFX2.20
#_078966: JSR PlaySFX_Set2

#_078969: JSR LinkHop_FindTileToLandOnSouth

#_07896C: LDA.b $1B
#_07896E: BNE .continue

#_078970: LDA.b #$02
#_078972: STA.b $EE

;---------------------------------------------------------------------------------------------------

.continue
#_078974: LDA.w $0362
#_078977: STA.b $29

#_078979: LDA.w $0363
#_07897C: STA.w $02C7

#_07897F: LDA.w $0364
#_078982: STA.b $24

#_078984: LDA.w $0365
#_078987: STA.b $25

#_078989: LDA.b #$02
#_07898B: STA.b $00

#_07898D: JSR Link_HandleChangeInZVelocity_apply_z_speed_change
#_078990: JSL LinkHop_FindArbitraryLandingSpot

#_078994: LDA.b $29
#_078996: BPL .adjust_velocity

#_078998: CMP.b #$A0
#_07899A: BCS .not_maxed_out

#_07899C: LDA.b #$A0
#_07899E: STA.b $29

.not_maxed_out
#_0789A0: REP #$20

#_0789A2: LDA.b $24
#_0789A4: CMP.w #$FFF0
#_0789A7: BCC .adjust_velocity

#_0789A9: STZ.b $24

#_0789AB: SEP #$20

#_0789AD: JSR Link_SplashUponLanding

;---------------------------------------------------------------------------------------------------

#_0789B0: LDA.b $5B
#_0789B2: BEQ .not_near_pit

#_0789B4: LDA.b #$01 ; LINKSTATE 01
#_0789B6: STA.b $5D

.not_near_pit
#_0789B8: LDA.b $5D
#_0789BA: CMP.b #$04 ; LINKSTATE 04
#_0789BC: BEQ .skip_sfx

#_0789BE: CMP.b #$01 ; LINKSTATE 01
#_0789C0: BEQ .skip_sfx

#_0789C2: LDA.w $0345
#_0789C5: BNE .skip_sfx

#_0789C7: LDA.b #$21 ; SFX2.21
#_0789C9: JSR PlaySFX_Set2

;---------------------------------------------------------------------------------------------------

.skip_sfx
#_0789CC: STZ.w $037B

#_0789CF: STZ.b $78
#_0789D1: STZ.b $4D

#_0789D3: LDA.b #$FF
#_0789D5: STA.b $29
#_0789D7: STA.b $24
#_0789D9: STA.b $25

#_0789DB: STZ.b $46

#_0789DD: LDA.b $1B
#_0789DF: BNE .no_layer_reset

#_0789E1: STZ.b $EE

.no_layer_reset
#_0789E3: BRA .finisher_up

;===================================================================================================

.adjust_velocity
#_0789E5: SEP #$20

#_0789E7: LDA.w $0364
#_0789EA: SEC
#_0789EB: SBC.b $24
#_0789ED: STA.b $30

;---------------------------------------------------------------------------------------------------

.finisher_up
#_0789EF: LDA.b $29
#_0789F1: STA.w $0362

#_0789F4: LDA.w $02C7
#_0789F7: STA.w $0363

#_0789FA: LDA.b $24
#_0789FC: STA.w $0364

#_0789FF: LDA.b $25
#_078A01: STA.w $0365

#_078A04: RTS

;===================================================================================================

LinkState_HandlingJump:
#_078A05: LDA.w $0362
#_078A08: STA.b $29

#_078A0A: LDA.w $0363
#_078A0D: STA.w $02C7

#_078A10: LDA.w $0364
#_078A13: STA.b $24

#_078A15: LDA.b #$02
#_078A17: STA.b $00

#_078A19: JSR Link_HandleChangeInZVelocity_apply_z_speed_change
#_078A1C: JSL LinkHop_FindArbitraryLandingSpot

#_078A20: LDA.b $29
#_078A22: BMI .negative_speed

#_078A24: BRL .not_at_max_z

;---------------------------------------------------------------------------------------------------

.negative_speed
#_078A27: CMP.b #$A0
#_078A29: BCS .not_at_max_z_speed

#_078A2B: LDA.b #$A0
#_078A2D: STA.b $29

.not_at_max_z_speed
#_078A2F: LDA.b $24
#_078A31: CMP.b #$F0
#_078A33: BCC .not_at_max_z

#_078A35: STZ.b $24
#_078A37: STZ.b $25

#_078A39: LDA.b $5D
#_078A3B: CMP.b #$0C ; LINKSTATE 0C
#_078A3D: BEQ .left_or_right

#_078A3F: CMP.b #$0E ; LINKSTATE 0E
#_078A41: BNE .continue_a

;---------------------------------------------------------------------------------------------------

.left_or_right
#_078A43: LDY.b #$00
#_078A45: JSR TileDetect_MainHandler

#_078A48: LDA.w $0341
#_078A4B: AND.b #$01
#_078A4D: BEQ .dont_become_swimming

#_078A4F: LDA.b #$04 ; LINKSTATE 04
#_078A51: STA.b $5D

#_078A53: JSR Link_SetToDeepWater
#_078A56: JSR Link_ResetSwordAndItemUsage

#_078A59: LDA.b #$15 ; ANCILLA 15
#_078A5B: LDY.b #$00
#_078A5D: JSL AncillaAdd_Splash

#_078A61: BRA .continue_a

;---------------------------------------------------------------------------------------------------

.dont_become_swimming
#_078A63: LDA.b $59
#_078A65: AND.b #$01
#_078A67: BEQ .continue_a

#_078A69: LDA.b #$09
#_078A6B: STA.b $5C

#_078A6D: STZ.b $5A

#_078A6F: LDA.b #$01
#_078A71: STA.b $5B

#_078A73: LDA.b #$01 ; LINKSTATE 01
#_078A75: STA.b $5D

#_078A77: BRA .check_if_swimming

;---------------------------------------------------------------------------------------------------

.continue_a
#_078A79: JSR Link_SplashUponLanding

#_078A7C: LDA.b $5D
#_078A7E: CMP.b #$04 ; LINKSTATE 04
#_078A80: BEQ .check_if_swimming

#_078A82: LDA.w $0345
#_078A85: BNE .check_if_swimming

#_078A87: LDA.b #$21 ; SFX2.21
#_078A89: JSR PlaySFX_Set2

.check_if_swimming
#_078A8C: LDA.b $5D
#_078A8E: CMP.b #$04 ; LINKSTATE 04
#_078A90: BNE .not_swimming

#_078A92: LDA.w $02E0
#_078A95: BNE .am_bunny

.not_swimming
#_078A97: STZ.w $037B

;---------------------------------------------------------------------------------------------------

.am_bunny
#_078A9A: STZ.b $78
#_078A9C: STZ.b $4D

#_078A9E: LDA.b #$FF
#_078AA0: STA.b $29

#_078AA2: STA.b $24
#_078AA4: STA.b $25

#_078AA6: STZ.b $46

#_078AA8: LDA.b $1B
#_078AAA: BNE .dont_reset_layer

#_078AAC: STZ.b $EE

.dont_reset_layer
#_078AAE: BRA .continue_b

;---------------------------------------------------------------------------------------------------

.not_at_max_z
#_078AB0: LDA.w $0364
#_078AB3: SEC
#_078AB4: SBC.b $24
#_078AB6: STA.b $30

.continue_b
#_078AB8: LDA.b $29
#_078ABA: STA.w $0362

#_078ABD: LDA.w $02C7
#_078AC0: STA.w $0363

#_078AC3: LDA.b $24
#_078AC5: STA.w $0364

#_078AC8: RTS

;===================================================================================================

pool LinkHop_FindTileToLandOnSouth Link_HoppingHorizontally_FindTile_Vertical

.offset_x
#_078AC9: dw  -8
#_078ACB: dw   8

.offset_y
#_078ACD: dw -16
#_078ACF: dw  16

pool off

;---------------------------------------------------------------------------------------------------

LinkHop_FindTileToLandOnSouth:
#_078AD1: LDA.b $21
#_078AD3: STA.b $33

#_078AD5: LDA.b $20
#_078AD7: STA.b $32

#_078AD9: SEC
#_078ADA: SBC.b $3E
#_078ADC: STA.b $30

.next_y
#_078ADE: LDA.b $66
#_078AE0: ASL A
#_078AE1: TAY

#_078AE2: REP #$20

#_078AE4: LDA.w .offset_x,Y
#_078AE7: CLC
#_078AE8: ADC.b $20
#_078AEA: STA.b $20

#_078AEC: SEP #$20

#_078AEE: JSR TileDetect_Movement_Vertical

#_078AF1: LDA.w $0343
#_078AF4: ORA.b $59
#_078AF6: ORA.w $035B
#_078AF9: ORA.w $0357
#_078AFC: ORA.w $0341
#_078AFF: AND.b #$07
#_078B01: CMP.b #$07
#_078B03: BNE .next_y

;---------------------------------------------------------------------------------------------------

#_078B05: LDA.w $0341
#_078B08: AND.b #$07
#_078B0A: BEQ .didnt_find_water

#_078B0C: LDA.b #$01
#_078B0E: STA.w $0345

#_078B11: LDA.b $4D
#_078B13: CMP.b #$04
#_078B15: BEQ .leave_recoil_state

#_078B17: LDA.b #$02
#_078B19: STA.b $4D

.leave_recoil_state
#_078B1B: LDA.w $0026
#_078B1E: STA.w $0340

#_078B21: JSL Link_ResetSwimmingState

#_078B25: STZ.w $0376
#_078B28: STZ.b $5E

.didnt_find_water
#_078B2A: LDA.b $59
#_078B2C: AND.b #$07
#_078B2E: BEQ .didnt_find_pit

#_078B30: LDA.b #$09
#_078B32: STA.b $5C

#_078B34: STZ.b $5A

#_078B36: LDA.b #$01
#_078B38: STA.b $5B

.didnt_find_pit
#_078B3A: LDA.b $66
#_078B3C: ASL A
#_078B3D: TAY

#_078B3E: REP #$20

#_078B40: LDA.w .offset_y,Y
#_078B43: CLC
#_078B44: ADC.b $20
#_078B46: STA.b $20

#_078B48: SEP #$20

#_078B4A: LDA.b $20
#_078B4C: STA.b $3E

#_078B4E: LDA.b $21
#_078B50: STA.b $40

#_078B52: LDA.b #$01
#_078B54: STA.b $46

#_078B56: LDA.b $24
#_078B58: CMP.b #$F0
#_078B5A: BCC .z_coord_fine

#_078B5C: LDA.b #$00

.z_coord_fine
#_078B5E: STA.b $00
#_078B60: STZ.b $01

#_078B62: REP #$20

#_078B64: LDA.b $20
#_078B66: SEC
#_078B67: SBC.b $32
#_078B69: CLC
#_078B6A: ADC.b $00
#_078B6C: STA.w $0364
#_078B6F: STA.b $24

#_078B71: SEP #$20

#_078B73: RTS

;===================================================================================================

LinkState_HoppingHorizontallyOW:
#_078B74: LDX.b #$01

#_078B76: LDA.b $28
#_078B78: BPL .moving_right

#_078B7A: LDX.b #$02

.moving_right
#_078B7C: TXA
#_078B7D: ORA.b #$04
#_078B7F: STA.b $67

#_078B81: STZ.b $50
#_078B83: STZ.b $27

#_078B85: STZ.w $0351

#_078B88: BRL LinkState_HandlingJump

;===================================================================================================

pool Link_HoppingHorizontally_FindTile_Vertical

.speed_z
#_078B8B: db $20, $20, $20, $28
#_078B8F: db $30, $38, $40, $48

.speed_x
#_078B93: db $10, $1C, $1C, $1C
#_078B97: db $1C, $1C, $1C, $1C

pool off

;---------------------------------------------------------------------------------------------------

Link_HoppingHorizontally_FindTile_Vertical:
#_078B9B: LDA.b $21
#_078B9D: STA.b $33

#_078B9F: LDA.b $20
#_078BA1: STA.b $32

#_078BA3: SEC
#_078BA4: SBC.b $3E
#_078BA6: STA.b $30

#_078BA8: LDA.b $66
#_078BAA: ASL A
#_078BAB: TAY

#_078BAC: REP #$20

#_078BAE: LDA.w .offset_x,Y
#_078BB1: CLC
#_078BB2: ADC.b $20
#_078BB4: STA.b $20

#_078BB6: SEP #$20

#_078BB8: JSR TileDetect_Movement_Vertical

#_078BBB: LDA.w $0343
#_078BBE: ORA.w $035B
#_078BC1: ORA.w $0357
#_078BC4: ORA.w $0341
#_078BC7: AND.b #$07
#_078BC9: CMP.b #$07
#_078BCB: BEQ .no_tiles_flagged

#_078BCD: LDA.b $33
#_078BCF: STA.b $21

#_078BD1: LDA.b $32
#_078BD3: STA.b $20

#_078BD5: LDY.b #$00

#_078BD7: LDA.b #$01
#_078BD9: STA.b $46

#_078BDB: LDA.b $28
#_078BDD: BPL .x_speed_positive

#_078BDF: LDY.b #$FF

#_078BE1: EOR.b #$FF
#_078BE3: INC A

.x_speed_positive
#_078BE4: LSR A
#_078BE5: LSR A
#_078BE6: LSR A
#_078BE7: LSR A
#_078BE8: TAX

#_078BE9: LDA.w .speed_z,X
#_078BEC: STA.w $0362
#_078BEF: STA.w $0363

#_078BF2: LDA.w .speed_x,X
#_078BF5: CPY.b #$FF
#_078BF7: BNE .dont_invert_x_speed

#_078BF9: EOR.b #$FF
#_078BFB: INC A

.dont_invert_x_speed
#_078BFC: STA.b $28

#_078BFE: BRA .check_for_water

.no_tiles_flagged
#_078C00: LDA.b $66
#_078C02: ASL A
#_078C03: TAY

#_078C04: REP #$20

#_078C06: LDA.w .offset_y,Y
#_078C09: CLC
#_078C0A: ADC.b $20
#_078C0C: STA.b $20

#_078C0E: SEP #$20

#_078C10: LDA.b $20
#_078C12: STA.b $3E

#_078C14: LDA.b $21
#_078C16: STA.b $40

#_078C18: LDA.b #$01
#_078C1A: STA.b $46

#_078C1C: LDA.b $24
#_078C1E: CMP.b #$FF
#_078C20: BNE .dont_zero_z_coord

#_078C22: LDA.b #$00

.dont_zero_z_coord
#_078C24: STA.b $00
#_078C26: STZ.b $01

#_078C28: REP #$20

#_078C2A: LDA.b $20
#_078C2C: SEC
#_078C2D: SBC.b $32
#_078C2F: CLC
#_078C30: ADC.b $00
#_078C32: STA.w $0364
#_078C35: STA.b $24

#_078C37: SEP #$20

.check_for_water
#_078C39: LDA.w $0341
#_078C3C: AND.b #$07
#_078C3E: BEQ .exit

#_078C40: LDA.b #$02
#_078C42: STA.b $4D

;===================================================================================================

#Link_SetToDeepWater:
#_078C44: LDA.b #$01
#_078C46: STA.w $0345

#_078C49: LDA.w $0026
#_078C4C: STA.w $0340

#_078C4F: JSL Link_ResetSwimmingState

#_078C53: STZ.w $0376
#_078C56: STZ.b $5E

.exit
#_078C58: RTS

;===================================================================================================

pool LinkState_0F

.offset_x
#_078C59: dw $FFE8
#_078C5B: dw $0018
#_078C5D: dw $FFE8
#_078C5F: dw $0018

.offset_y
#_078C61: dw $0020
#_078C63: dw $0050

.speed_x
#_078C65: db $10
#_078C66: db $18

.offset_z
#_078C67: db $20
#_078C68: db $50

pool off

;---------------------------------------------------------------------------------------------------

LinkState_0F:
#_078C69: LDY.b #$03

#_078C6B: LDA.b $28
#_078C6D: BPL .x_speed_positive

#_078C6F: LDY.b #$02

.x_speed_positive
#_078C71: STY.b $66

#_078C73: STZ.b $50
#_078C75: STZ.b $27

#_078C77: STZ.w $0351

#_078C7A: LDA.b $46
#_078C7C: BNE .proceed_to_jump

#_078C7E: LDA.w $0362
#_078C81: BNE .proceed_to_jump

#_078C83: LDA.b $5D
#_078C85: SEC
#_078C86: SBC.b #$0F
#_078C88: ASL A
#_078C89: ASL A
#_078C8A: STA.b $00

#_078C8C: TYA
#_078C8D: AND.b #$FD
#_078C8F: ASL A
#_078C90: CLC
#_078C91: ADC.b $00
#_078C93: TAX

#_078C94: LDA.b $22
#_078C96: PHA

#_078C97: LDA.b $23
#_078C99: PHA

#_078C9A: REP #$20

#_078C9C: LDA.b $22
#_078C9E: CLC
#_078C9F: ADC.w .offset_x,X
#_078CA2: STA.b $22

#_078CA4: SEP #$20

#_078CA6: TXA
#_078CA7: LSR A
#_078CA8: LSR A
#_078CA9: TAX

#_078CAA: LDA.w .speed_x,X

#_078CAD: CPY.b #$02
#_078CAF: BNE .keep_speed_positive

#_078CB1: EOR.b #$FF
#_078CB3: INC A

.keep_speed_positive
#_078CB4: STA.b $28

#_078CB6: LDA.b $24
#_078CB8: CMP.b #$FF
#_078CBA: BNE .dont_zero_z

#_078CBC: LDA.b #$00

.dont_zero_z
#_078CBE: CLC
#_078CBF: ADC.w .offset_z,X
#_078CC2: STA.w $0364
#_078CC5: STA.b $24

#_078CC7: TXA
#_078CC8: ASL A
#_078CC9: TAX

#_078CCA: REP #$20

#_078CCC: LDA.w .offset_y,X
#_078CCF: CLC
#_078CD0: ADC.b $20
#_078CD2: STA.b $20

;---------------------------------------------------------------------------------------------------

#_078CD4: SEP #$20

#_078CD6: LDA.b $20
#_078CD8: STA.b $3E

#_078CDA: LDA.b $21
#_078CDC: STA.b $40

#_078CDE: PLA
#_078CDF: STA.b $23

#_078CE1: PLA
#_078CE2: STA.b $22

#_078CE4: LDA.b $1B
#_078CE6: BNE .proceed_to_jump

#_078CE8: LDA.b #$02
#_078CEA: STA.b $EE

.proceed_to_jump
#_078CEC: BRL LinkState_HandlingJump

;===================================================================================================

pool Link_HoppingHorizontally_FindTile_Horizontal

.offset_x_a
#_078CEF: dw  -8
#_078CF1: dw   8

.offset_x_b
#_078CF3: dw -32
#_078CF5: dw  32

.offset_x_c
#_078CF7: dw -16
#_078CF9: dw  16

.speed_x
#_078CFB: db $14, $14, $14, $18, $18, $18, $18, $1C
#_078D03: db $1C, $24, $24, $24, $24, $24, $24, $26
#_078D0B: db $26, $26, $26, $26, $26, $26, $28, $28

.speed_z
#_078D13: db $14, $14, $14, $14, $14, $14, $14, $18
#_078D1B: db $18, $20, $20, $20, $24, $24, $24, $26
#_078D23: db $26, $26, $26, $26, $26, $26, $28, $28

pool off

;---------------------------------------------------------------------------------------------------

Link_HoppingHorizontally_FindTile_Horizontal:
#_078D2B: LDA.b $23
#_078D2D: STA.b $33

#_078D2F: LDA.b $22
#_078D31: STA.b $32

#_078D33: LDX.b #$07

.find_next
#_078D35: PHX
#_078D36: PHY

#_078D37: REP #$20

#_078D39: LDA.w .offset_x_a,Y
#_078D3C: CLC
#_078D3D: ADC.b $22
#_078D3F: STA.b $22

#_078D41: SEP #$20

#_078D43: LDA.b $66
#_078D45: ASL A
#_078D46: TAY

#_078D47: JSR TileDetect_Movement_Horizontal

#_078D4A: PLY
#_078D4B: PLX

#_078D4C: LDA.w $0343
#_078D4F: ORA.w $035B
#_078D52: ORA.w $0357
#_078D55: ORA.w $0341
#_078D58: ORA.b $59
#_078D5A: AND.b #$07
#_078D5C: CMP.b #$07
#_078D5E: BNE .doesnt_work

#_078D60: LDA.w $0341
#_078D63: AND.b #$07
#_078D65: CMP.b #$07
#_078D67: BNE .water_handled

#_078D69: LDA.b #$01
#_078D6B: STA.w $0345

#_078D6E: INC A
#_078D6F: STA.b $4D

#_078D71: LDA.w $0026
#_078D74: STA.w $0340

#_078D77: STZ.w $02CB
#_078D7A: STZ.b $5E
#_078D7C: STZ.w $0376

#_078D7F: JSR ResetAllAcceleration
#_078D82: BRA .water_handled

.doesnt_work
#_078D84: DEX
#_078D85: BPL .find_next

;---------------------------------------------------------------------------------------------------

#_078D87: REP #$20

#_078D89: LDA.w .offset_x_b,Y
#_078D8C: CLC
#_078D8D: ADC.b $32
#_078D8F: STA.b $22

#_078D91: SEP #$20

.water_handled
#_078D93: PHX

#_078D94: REP #$20

#_078D96: LDA.w .offset_x_c,Y
#_078D99: CLC
#_078D9A: ADC.b $22
#_078D9C: STA.b $22

#_078D9E: LDA.b $32
#_078DA0: SEC
#_078DA1: SBC.b $22
#_078DA3: BPL .positive

#_078DA5: EOR.w #$FFFF
#_078DA8: INC A

.positive
#_078DA9: LSR A
#_078DAA: LSR A
#_078DAB: LSR A
#_078DAC: TAX

#_078DAD: SEP #$20

#_078DAF: LDA.w .speed_x,X

#_078DB2: CPY.b #$02
#_078DB4: BEQ .dont_invert

#_078DB6: EOR.b #$FF
#_078DB8: INC A

.dont_invert
#_078DB9: STA.b $28

#_078DBB: LDA.w .speed_z,X
#_078DBE: STA.w $0362
#_078DC1: STA.w $0363

#_078DC4: PLX

#_078DC5: RTS

;===================================================================================================

LinkState_HoppingDiagonallyUpOW:
#_078DC6: STZ.w $0351

#_078DC9: LDA.b #$02
#_078DCB: STA.b $00

#_078DCD: JSR Link_HandleChangeInZVelocity_preset
#_078DD0: JSL LinkHop_FindArbitraryLandingSpot

#_078DD4: LDA.b $24
#_078DD6: BPL .exit

;---------------------------------------------------------------------------------------------------

#_078DD8: JSR Link_SplashUponLanding

#_078DDB: LDA.b $5D
#_078DDD: CMP.b #$04 ; LINKSTATE 04
#_078DDF: BEQ .no_sfx

#_078DE1: LDA.w $0345
#_078DE4: BNE .no_sfx

#_078DE6: LDA.b #$21 ; SFX2.21
#_078DE8: JSR PlaySFX_Set2

;---------------------------------------------------------------------------------------------------

.no_sfx
#_078DEB: STZ.w $037B
#_078DEE: STZ.b $4D

#_078DF0: LDA.b #$FF
#_078DF2: STA.b $29
#_078DF4: STA.b $24
#_078DF6: STA.b $25

#_078DF8: STZ.b $46
#_078DFA: STZ.b $50

.exit
#_078DFC: RTS

;===================================================================================================

pool LinkState_HoppingDiagonallyDownOW

.speed_x
#_078DFD: db $04, $04, $04, $0A, $0A, $0A, $0B, $12
#_078E05: db $12, $12, $14, $14, $14, $14, $16, $16
#_078E0D: db $1A, $1A, $1A, $1A, $1C, $1C, $1C, $1C

pool off

;---------------------------------------------------------------------------------------------------

LinkState_HoppingDiagonallyDownOW:
#_078E15: LDY.b #$03

#_078E17: LDA.b $28
#_078E19: BPL .down_right

#_078E1B: LDY.b #$02

.down_right
#_078E1D: STY.b $66

#_078E1F: STZ.b $50
#_078E21: STZ.b $27

#_078E23: STZ.w $0351

#_078E26: LDA.b $46
#_078E28: BNE .underworld

#_078E2A: LDA.w $0362
#_078E2D: BNE .underworld

#_078E2F: LDA.b #$01
#_078E31: STA.b $66

#_078E33: PHY

#_078E34: LDA.b $22
#_078E36: PHA

#_078E37: LDA.b $23
#_078E39: PHA

#_078E3A: LDA.b #$20 ; SFX2.20
#_078E3C: JSR PlaySFX_Set2

#_078E3F: JSR LinkHop_FindLandingSpotDiagonallyDown

#_078E42: PLA
#_078E43: STA.b $23

#_078E45: PLA
#_078E46: STA.b $22

#_078E48: PLX

#_078E49: REP #$20

#_078E4B: LDA.b $20
#_078E4D: SEC
#_078E4E: SBC.b $32

#_078E50: LSR A
#_078E51: LSR A
#_078E52: LSR A

#_078E53: TAY

#_078E54: SEP #$20

#_078E56: LDA.w .speed_x,Y

#_078E59: CPX.b #$02
#_078E5B: BNE .dont_invert

#_078E5D: EOR.b #$FF
#_078E5F: INC A

.dont_invert
#_078E60: STA.b $28

#_078E62: LDA.b $1B
#_078E64: BNE .underworld

#_078E66: LDA.b #$02
#_078E68: STA.b $EE

.underworld
#_078E6A: BRL LinkState_HandlingJump

;===================================================================================================

pool LinkHop_FindLandingSpotDiagonallyDown

.offset_x
#_078E6D: db $F8, $FF, $08, $00

.offset_y
#_078E71: db $F7, $FF, $09, $00

.offset_y_2
#_078E75: db $E8, $FF, $18, $00

.detection_masks
#_078E79: db $06, $03

pool off

;---------------------------------------------------------------------------------------------------

LinkHop_FindLandingSpotDiagonallyDown:
#_078E7B: LDA.b $21
#_078E7D: STA.b $33

#_078E7F: LDA.b $20
#_078E81: STA.b $32

#_078E83: SEC
#_078E84: SBC.b $3E
#_078E86: STA.b $30

.check_next
#_078E88: LDY.b #$00

#_078E8A: LDA.b $28
#_078E8C: BMI .positive_x_jump

#_078E8E: LDY.b #$02

.positive_x_jump
#_078E90: PHY

#_078E91: REP #$20

#_078E93: LDA.w .offset_x,Y
#_078E96: CLC
#_078E97: ADC.b $22
#_078E99: STA.b $22

#_078E9B: LDA.b $66
#_078E9D: AND.w #$00FF
#_078EA0: ASL A
#_078EA1: TAY

#_078EA2: LDA.w .offset_y,Y
#_078EA5: CLC
#_078EA6: ADC.b $20
#_078EA8: STA.b $20

#_078EAA: SEP #$20

#_078EAC: JSR TileDetect_Movement_Vertical

#_078EAF: PLY

#_078EB0: TYA
#_078EB1: LSR A
#_078EB2: TAY

#_078EB3: LDA.w .detection_masks,Y
#_078EB6: STA.b $72

#_078EB8: LDA.w $0343
#_078EBB: ORA.w $035B
#_078EBE: ORA.w $0357
#_078EC1: ORA.w $0341
#_078EC4: AND.b $72
#_078EC6: CMP.b $72
#_078EC8: BNE .check_next

;---------------------------------------------------------------------------------------------------

#_078ECA: LDA.w $0341
#_078ECD: AND.b $72
#_078ECF: BEQ .didnt_find_water

#_078ED1: LDA.b #$01
#_078ED3: STA.w $0345

#_078ED6: LDA.b #$02
#_078ED8: STA.b $4D

#_078EDA: LDA.w $0026
#_078EDD: STA.w $0340

#_078EE0: JSL Link_ResetSwimmingState

#_078EE4: STZ.b $5E
#_078EE6: STZ.w $0376

.didnt_find_water
#_078EE9: LDA.b $66
#_078EEB: ASL A
#_078EEC: TAY

#_078EED: REP #$20

#_078EEF: LDA.w .offset_y_2,Y
#_078EF2: CLC
#_078EF3: ADC.b $20
#_078EF5: STA.b $20

#_078EF7: SEP #$20

#_078EF9: LDA.b $20
#_078EFB: STA.b $3E

#_078EFD: LDA.b $21
#_078EFF: STA.b $40

#_078F01: LDA.b #$01
#_078F03: STA.b $46

#_078F05: LDA.b $24
#_078F07: STA.b $00
#_078F09: STZ.b $01

#_078F0B: REP #$20

#_078F0D: LDA.b $20
#_078F0F: SEC
#_078F10: SBC.b $32

#_078F12: CLC
#_078F13: ADC.b $00
#_078F15: STA.w $0364
#_078F18: STA.b $24

#_078F1A: SEP #$20

#_078F1C: RTS

;===================================================================================================

Link_SplashUponLanding:
#_078F1D: PHX
#_078F1E: PHY

#_078F1F: LDA.w $02E0
#_078F22: BEQ .not_bunny

#_078F24: LDA.w $0345
#_078F27: BEQ .not_deep_water

#_078F29: LDA.b #$15 ; ANCILLA 15
#_078F2B: LDY.b #$00
#_078F2D: JSL AncillaAdd_Splash

#_078F31: PLY
#_078F32: PLX

#_078F33: BRL LinkState_Bunny_recache

.not_deep_water
#_078F36: LDX.b #$17 ; LINKSTATE 17

#_078F38: LDA.l $7EF357
#_078F3C: BEQ .set_state

#_078F3E: LDX.b #$1C ; LINKSTATE 1C
#_078F40: BRA .set_state

;---------------------------------------------------------------------------------------------------

.not_bunny
#_078F42: LDX.b #$00 ; LINKSTATE 00

#_078F44: LDA.w $0345
#_078F47: BEQ .set_state

#_078F49: LDA.b $5D
#_078F4B: CMP.b #$06 ; LINKSTATE 06
#_078F4D: BEQ .not_recoiling

#_078F4F: LDA.b #$15 ; ANCILLA 15
#_078F51: LDY.b #$00
#_078F53: JSL AncillaAdd_Splash

;---------------------------------------------------------------------------------------------------

.not_recoiling
#_078F57: JSR Link_ForceUnequipCape_quietly

#_078F5A: LDX.b #$04 ; LINKSTATE 04

.set_state
#_078F5C: STX.b $5D

#_078F5E: PLY
#_078F5F: PLX

#_078F60: RTS

;===================================================================================================

LinkDirections26:
#_078F61: db $08
#_078F62: db $04
#_078F63: db $02
#_078F64: db $01

;---------------------------------------------------------------------------------------------------

LinkDashSFXMasks:
#_078F65: db $07, $0F, $0F

;---------------------------------------------------------------------------------------------------

FollowerReactionToDashing:
#_078F68: db $FF ; 0x00 - No follower
#_078F69: db $00 ; 0x01 - Zelda
#_078F6A: db $02 ; 0x02 - Old man that stops following you
#_078F6B: db $00 ; 0x03 - Unused old man
#_078F6C: db $00 ; 0x04 - Normal old man
#_078F6D: db $00 ; 0x05 - Zelda rescue telepathy
#_078F6E: db $00 ; 0x06 - Blind maiden
#_078F6F: db $00 ; 0x07 - Frogsmith
#_078F70: db $00 ; 0x08 - Smithy
#_078F71: db $00 ; 0x09 - Locksmith
#_078F72: db $00 ; 0x0A - Kiki
#_078F73: db $00 ; 0x0B - Unused old man
#_078F74: db $00 ; 0x0C - Purple chest
#_078F75: db $00 ; 0x0D - Super bomb
#_078F76: db $00 ; 0x0E - Master Sword telepathy

;---------------------------------------------------------------------------------------------------

FollowerDashReplacement:
#_078F77: db $FF ; 0x00 - No follower
#_078F78: db $00 ; 0x01 - Zelda
#_078F79: db $03 ; 0x02 - Old man that stops following you ⇒ FOLLOWER 03
#_078F7A: db $00 ; 0x03 - Unused old man
#_078F7B: db $00 ; 0x04 - Normal old man
#_078F7C: db $00 ; 0x05 - Zelda rescue telepathy
#_078F7D: db $00 ; 0x06 - Blind maiden
#_078F7E: db $00 ; 0x07 - Frogsmith
#_078F7F: db $00 ; 0x08 - Smithy
#_078F80: db $00 ; 0x09 - Locksmith
#_078F81: db $00 ; 0x0A - Kiki
#_078F82: db $00 ; 0x0B - Unused old man
#_078F83: db $00 ; 0x0C - Purple chest
#_078F84: db $00 ; 0x0D - Super bomb
#_078F85: db $00 ; 0x0E - Master Sword telepathy

;===================================================================================================

LinkState_Dashing:
#_078F86: JSR CacheCameraPropertiesIfOutdoors

#_078F89: JSR Link_HandleBunnyTransformation
#_078F8C: BCC .not_bunnifying

#_078F8E: LDA.b $5D
#_078F90: CMP.b #$17 ; LINKSTATE 17
#_078F92: BNE .not_bunny

#_078F94: BRL LinkState_Bunny

.not_bunny
#_078F97: RTS

;---------------------------------------------------------------------------------------------------

.not_bunnifying
#_078F98: LDA.w $0372
#_078F9B: BNE .still_dashing

#_078F9D: STZ.w $037B
#_078FA0: STZ.w $0374
#_078FA3: STZ.b $5E

#_078FA5: LDA.b #$00 ; LINKSTATE 00
#_078FA7: STA.b $5D

#_078FA9: STZ.b $50

#_078FAB: BRL .exit

;---------------------------------------------------------------------------------------------------

.still_dashing
#_078FAE: BIT.b $3A
#_078FB0: BPL .no_b_press

#_078FB2: LDA.b $3C
#_078FB4: CMP.b #$09
#_078FB6: BCC .no_b_press

#_078FB8: LDA.b #$09
#_078FBA: STA.b $3C

.no_b_press
#_078FBC: STZ.w $02CA

#_078FBF: LDA.b $4D
#_078FC1: BEQ .not_recoiling

#_078FC3: STZ.w $037B
#_078FC6: STZ.w $0374

#_078FC9: STZ.b $5E
#_078FCB: STZ.b $50

#_078FCD: STZ.w $0372

#_078FD0: STZ.b $48

#_078FD2: LDA.w $0360
#_078FD5: BEQ .bonking

;---------------------------------------------------------------------------------------------------

#_078FD7: LDA.b $55
#_078FD9: BEQ .no_cape

#_078FDB: JSR Link_ForceUnequipCape_quietly

.no_cape
#_078FDE: JSR Link_ResetSwordAndItemUsage

#_078FE1: LDA.b #$01
#_078FE3: STA.w $037B

#_078FE6: STZ.w $0300

#_078FE9: LDA.b #$02
#_078FEB: STA.b $3D

#_078FED: STZ.b $2E

#_078FEF: LDA.b $67
#_078FF1: AND.b #$F0
#_078FF3: STA.b $67

#_078FF5: LDA.b #$2B ; SFX3.2B
#_078FF7: JSR PlaySFX_Set3

#_078FFA: LDA.b #$07 ; LINKSTATE 07
#_078FFC: STA.b $5D

#_078FFE: BRL LinkState_Zapped

;---------------------------------------------------------------------------------------------------

.bonking
#_079001: LDA.b #$02 ; LINKSTATE 02
#_079003: STA.b $5D

#_079005: BRL LinkState_Recoil

;---------------------------------------------------------------------------------------------------

.not_recoiling
#_079008: LDA.w $0374
#_07900B: LSR A
#_07900C: LSR A
#_07900D: LSR A
#_07900E: LSR A
#_07900F: TAX

#_079010: LDA.w $0374
#_079013: BNE .dont_tick_dash_timer

#_079015: LDA.b $4F

#_079017: DEC.b $4F

.dont_tick_dash_timer
#_079019: AND.w LinkDashSFXMasks,X
#_07901C: BNE .no_sfx

#_07901E: LDA.b #$23 ; SFX2.23
#_079020: JSR PlaySFX_Set2

;---------------------------------------------------------------------------------------------------

.no_sfx
#_079023: DEC.w $0374
#_079026: BPL .skip_follower_logic

#_079028: STZ.w $0374

#_07902B: LDA.l $7EF3CC
#_07902F: TAX

#_079030: CMP.w FollowerReactionToDashing,X
#_079033: BNE .dont_replace

#_079035: LDA.w FollowerDashReplacement,X
#_079038: STA.l $7EF3CC

.dont_replace
#_07903C: BRL .continue_from_follower

;---------------------------------------------------------------------------------------------------

.skip_follower_logic
#_07903F: LDA.b #$00
#_079041: STA.b $4F

#_079043: BIT.b $F2
#_079045: BMI .new_a_press

#_079047: STZ.b $2E
#_079049: STZ.w $0374
#_07904C: STZ.b $5E

#_07904E: LDA.b #$00 ; LINKSTATE 00
#_079050: STA.b $5D

#_079052: STZ.w $0372

#_079055: BIT.b $3A
#_079057: BMI .b_held

#_079059: STZ.b $50

.b_held
#_07905B: BRL .exit

;---------------------------------------------------------------------------------------------------

.new_a_press
#_07905E: LDY.b #$00
#_079060: LDA.b #$1E ; ANCILLA 1E
#_079062: JSL AncillaAdd_DashDust_charging

#_079066: STZ.b $30
#_079068: STZ.b $31

#_07906A: LDA.b #$40
#_07906C: STA.w $02F1

#_07906F: LDA.b #$10
#_079071: STA.b $5E

#_079073: LDA.b $3A
#_079075: AND.b #$80
#_079077: BNE .can_turn

#_079079: LDA.b $6C
#_07907B: BNE .can_turn

#_07907D: LDA.b $F0
#_07907F: AND.b #$0F
#_079081: BNE .dpad_held

.can_turn
#_079083: LDA.b $2F
#_079085: LSR A
#_079086: TAX

#_079087: LDA.w LinkDirections26,X

.dpad_held
#_07908A: STA.b $26
#_07908C: STA.b $67
#_07908E: STA.w $0340

#_079091: STZ.b $6B

;---------------------------------------------------------------------------------------------------

#_079093: JSL Link_HandleMovingAnimation_FullLongEntry

#_079097: LDA.b $20
#_079099: STA.b $00
#_07909B: STA.b $3E

#_07909D: LDA.b $22
#_07909F: STA.b $01
#_0790A1: STA.b $3F

#_0790A3: LDA.b $21
#_0790A5: STA.b $02
#_0790A7: STA.b $40

#_0790A9: LDA.b $23
#_0790AB: STA.b $03
#_0790AD: STA.b $41

#_0790AF: JSR Link_HandleMovingFloor
#_0790B2: JSR Link_ApplyConveyor

#_0790B5: LDA.w $02F5
#_0790B8: BEQ .not_on_somaria_platform

#_0790BA: JSL Link_HandleVelocityAndSandDrag_long

.not_on_somaria_platform
#_0790BE: LDA.b $20
#_0790C0: SEC
#_0790C1: SBC.b $3E
#_0790C3: STA.b $30

#_0790C5: LDA.b $22
#_0790C7: SEC
#_0790C8: SBC.b $3F
#_0790CA: STA.b $31

#_0790CC: JSR Link_HandleCardinalCollision
#_0790CF: JSR HandleIndoorCameraAndDoors

#_0790D2: BRL .exit

;---------------------------------------------------------------------------------------------------

.continue_from_follower
#_0790D5: LDA.b $2E
#_0790D7: CMP.b #$06
#_0790D9: BCC .dont_reset_anim_step

#_0790DB: STZ.b $2E

.dont_reset_anim_step
#_0790DD: DEC.w $02F1
#_0790E0: LDA.w $02F1
#_0790E3: CMP.b #$20
#_0790E5: BCS .dont_reset_anim_timer

#_0790E7: LDA.b #$20
#_0790E9: STA.w $02F1

.dont_reset_anim_timer
#_0790EC: LDY.b #$00
#_0790EE: LDA.b #$1E ; ANCILLA 1E
#_0790F0: JSL AncillaAdd_DashDust

#_0790F4: STZ.b $79

#_0790F6: LDA.l $7EF359
#_0790FA: INC A
#_0790FB: AND.b #$FE
#_0790FD: BEQ .no_sword

#_0790FF: LDY.b #$07
#_079101: JSR TileDetect_MainHandler

.no_sword
#_079104: LDA.l $7EF3C5
#_079108: BEQ .game_state_0

#_07910A: LDA.b #$80
#_07910C: TSB.b $3A

#_07910E: LDA.b #$09
#_079110: STA.b $3C

;---------------------------------------------------------------------------------------------------

.game_state_0
#_079112: STZ.b $46

#_079114: LDA.b $2F
#_079116: LSR A
#_079117: TAX

#_079118: LDA.w LinkDirections26,X
#_07911B: STA.b $00

#_07911D: LDA.b $F0
#_07911F: AND.b #$0F
#_079121: BEQ .dpad_relaxed

#_079123: CMP.b $00
#_079125: BEQ .dpad_relaxed

#_079127: LDA.b #$12 ; LINKSTATE 12
#_079129: STA.b $5D

#_07912B: LDA.b $3A
#_07912D: AND.b #$7F
#_07912F: STA.b $3A

#_079131: STZ.b $3C
#_079133: STZ.b $3D

#_079135: BRL LinkState_ExitingDash

;---------------------------------------------------------------------------------------------------

.dpad_relaxed
#_079138: LDA.b $49
#_07913A: AND.b #$0F
#_07913C: BNE .dont_turn

#_07913E: LDA.b $2F
#_079140: LSR A
#_079141: TAX

#_079142: LDA.w LinkDirections26,X

.dont_turn
#_079145: STA.b $67
#_079147: STA.b $26

#_079149: JSR Link_HandleDiagonalCollision
#_07914C: JSL Link_HandleVelocity

#_079150: JSR Link_HandleCardinalCollision
#_079153: JSL Link_HandleMovingAnimation_FullLongEntry

#_079157: STZ.w $0302

#_07915A: JSR HandleIndoorCameraAndDoors

.exit
#_07915D: RTS

;===================================================================================================

LinkState_ExitingDash:
#_07915E: JSR CacheCameraPropertiesIfOutdoors

#_079161: LDA.b $F0
#_079163: AND.b #$0F
#_079165: BNE .dpad_pressed

#_079167: LDA.w $0374
#_07916A: CMP.b #$10
#_07916C: BCC .low_dash_timer

.dpad_pressed
#_07916E: STZ.w $0374
#_079171: STZ.b $5E

#_079173: LDA.b #$00 ; LINKSTATE 00
#_079175: STA.b $5D

#_079177: STZ.w $0372
#_07917A: STZ.w $032B

#_07917D: LDA.b $3C
#_07917F: CMP.b #$09
#_079181: BCS .finish_up

#_079183: STZ.b $50

#_079185: BRA .finish_up

;---------------------------------------------------------------------------------------------------

.low_dash_timer
#_079187: LDA.w $0374
#_07918A: CLC
#_07918B: ADC.b #$01
#_07918D: STA.w $0374

;---------------------------------------------------------------------------------------------------

.finish_up
#_079190: JSL Link_HandleMovingAnimation_FullLongEntry

#_079194: RTS

;===================================================================================================

Link_CancelDash:
#_079195: LDA.w $0372
#_079198: BEQ .exit

#_07919A: PHX

#_07919B: LDX.b #$04

.next_ancilla
#_07919D: LDA.w $0C4A,X
#_0791A0: CMP.b #$1E ; ANCILLA 1E
#_0791A2: BNE .dont_delete

#_0791A4: STZ.w $0C4A,X

.dont_delete
#_0791A7: DEX
#_0791A8: BPL .next_ancilla

#_0791AA: PLX

#_0791AB: STZ.w $0374
#_0791AE: STZ.b $5E
#_0791B0: STZ.w $0372
#_0791B3: STZ.b $50
#_0791B5: STZ.w $032B

.exit
#_0791B8: RTS

;===================================================================================================

Link_CancelDash_long:
#_0791B9: JSR Link_CancelDash

#_0791BC: RTL

;===================================================================================================

RepelBonkSpeedY:
#_0791BD: db $18, $E8, $00, $00

RepelBonkSpeedX:
#_0791C1: db $00, $00, $18, $E8

TileReboundAFlaggingY:
#_0791C5: db $01, $00, $00, $00

TileReboundAFlaggingX:
#_0791C9: db $00, $00, $01, $00

;===================================================================================================

IceRepelAccelY:
#_0791CD: dw $0180, $0180, $0000, $0000
#_0791D5: dw $0100, $0100, $0000, $0000

IceRepelAccelX:
#_0791DD: dw $0000, $0000, $0180, $0180
#_0791E5: dw $0000, $0000, $0100, $0100

;===================================================================================================

RepelDirectionMasks:
#_0791ED: db $08, $04, $02, $01

;---------------------------------------------------------------------------------------------------

RepelDash:
#_0791F1: LDA.w $0372
#_0791F4: BEQ .not_even_dashing

#_0791F6: LDA.w $02F1
#_0791F9: CMP.b #$40
#_0791FB: BNE .continue

.not_even_dashing
#_0791FD: BRL .exit

;---------------------------------------------------------------------------------------------------

.continue
#_079200: JSL Link_ResetSwimmingState

#_079204: LDY.b #$01
#_079206: LDA.b #$1D ; ANCILLA 1D
#_079208: JSL AncillaAdd_DashTremor

#_07920C: JSL Prepare_ApplyRumbleToSprites

#_079210: LDA.w $012F
#_079213: AND.b #$3F
#_079215: CMP.b #$1B ; SFX3.1B
#_079217: BEQ LinkApplyTileRebound

#_079219: CMP.b #$32 ; SFX3.32
#_07921B: BEQ LinkApplyTileRebound

#_07921D: LDA.b #$03 ; SFX3.03
#_07921F: JSR PlaySFX_Set3

;---------------------------------------------------------------------------------------------------

#LinkApplyTileRebound:
#_079222: LDX.b $66

#_079224: LDA.w RepelBonkSpeedY,X
#_079227: STA.b $27

#_079229: LDA.w RepelBonkSpeedX,X
#_07922C: STA.b $28

#_07922E: LDA.b #$18
#_079230: STA.b $46

#_079232: LDA.b #$24
#_079234: STA.b $29
#_079236: STA.w $02C7

#_079239: LDA.w $034A
#_07923C: BEQ .not_on_any_ice

;---------------------------------------------------------------------------------------------------

#_07923E: LDA.w RepelDirectionMasks,X
#_079241: STA.w $0340
#_079244: STA.b $67

#_079246: LDA.w TileReboundAFlaggingY,X
#_079249: STA.w $0338

#_07924C: LDA.w TileReboundAFlaggingX,X
#_07924F: STA.w $033A

#_079252: PHX

#_079253: LDA.w $034A
#_079256: DEC A
#_079257: ASL A
#_079258: ASL A
#_079259: ASL A
#_07925A: STA.b $08

#_07925C: TXA
#_07925D: ASL A
#_07925E: CLC
#_07925F: ADC.b $08
#_079261: TAX

#_079262: REP #$20

#_079264: LDA.w IceRepelAccelY,X
#_079267: STA.w $033C

#_07926A: LDA.w IceRepelAccelX,X
#_07926D: STA.w $033E

#_079270: SEP #$20

#_079272: PLX

;---------------------------------------------------------------------------------------------------

.not_on_any_ice
#_079273: LDA.b #$01
#_079275: STA.b $4D
#_079277: STA.w $02F8

#_07927A: STZ.b $74
#_07927C: STZ.w $0360

#_07927F: STZ.b $5E
#_079281: STZ.b $50
#_079283: STZ.b $6B

#_079285: TXA
#_079286: AND.b #$02
#_079288: BNE .dont_reset_x

#_07928A: STZ.b $31

#_07928C: BRA .exit

.dont_reset_x
#_07928E: STZ.b $30

.exit
#_079290: RTS

;===================================================================================================

Sprite_RepelDash_long:
#_079291: PHB
#_079292: PHK
#_079293: PLB

#_079294: PHX

#_079295: LDA.b $2F
#_079297: LSR A
#_079298: STA.b $66

#_07929A: JSR RepelDash

#_07929D: PLX

#_07929E: PLB

#_07929F: RTL

;===================================================================================================

Flag67WithDirections:
#_0792A0: STZ.b $67

#_0792A2: LDY.b #$00

#_0792A4: LDA.b $27
#_0792A6: BEQ .zero_y
#_0792A8: BMI .negative_y

#_0792AA: LDY.b #$01

.negative_y
#_0792AC: JSR .flag_one

;---------------------------------------------------------------------------------------------------

.zero_y
#_0792AF: LDY.b #$02

#_0792B1: LDA.b $28
#_0792B3: BEQ .exit
#_0792B5: BMI .flag_one

#_0792B7: LDY.b #$03

;---------------------------------------------------------------------------------------------------

.flag_one
#_0792B9: LDA.w RepelDirectionMasks,Y
#_0792BC: TSB.b $67

.exit
#_0792BE: RTS

;===================================================================================================

PitFall_FlagsForAnimation:
#_0792BF: db $0A, $09, $06, $05, $08, $04, $02, $01

PitFall_FlagsForDirection:
#_0792C7: db $05, $06, $09, $0A, $04, $08, $01, $02

PitFall_FlagsForDetection:
#_0792CF: db $0C, $03, $0A, $05

;===================================================================================================

LinkState_Pits:
#_0792D3: STZ.b $67

#_0792D5: LDA.w $0302
#_0792D8: BEQ .no_wall_touch

#_0792DA: INC.w $02CA

#_0792DD: LDA.w $02CA
#_0792E0: CMP.b #$20
#_0792E2: BNE .no_wall_touch

#_0792E4: LDA.b #$1F
#_0792E6: STA.w $02CA

#_0792E9: BRA .check_for_pits

.no_wall_touch
#_0792EB: LDA.w $0372
#_0792EE: BEQ .not_dashing_a

#_0792F0: LDA.w $0374
#_0792F3: BEQ .not_charging_dash

#_0792F5: BRL LinkState_Dashing

.not_charging_dash
#_0792F8: LDA.b $F0
#_0792FA: AND.b #$0F
#_0792FC: BEQ .check_for_pits

#_0792FE: AND.b $67
#_079300: BNE .check_for_pits

#_079302: JSR Link_CancelDash

.not_dashing_a
#_079305: LDA.b $4D
#_079307: CMP.b #$01
#_079309: BEQ .check_for_pits

#_07930B: LDA.b $F0
#_07930D: AND.b #$0F
#_07930F: STA.b $67

;---------------------------------------------------------------------------------------------------

.check_for_pits
#_079311: LDY.b #$04
#_079313: JSR TileDetect_MainHandler

#_079316: LDA.b $59
#_079318: AND.b #$01
#_07931A: BNE Link_HandleFallingInPit

#_07931C: LDA.w $0372
#_07931F: BEQ .not_dashing_b

#_079321: BRL LinkState_Dashing

.not_dashing_b
#_079324: STZ.b $5E

#_079326: JSR Link_CancelDash

#_079329: LDA.b $3A
#_07932B: AND.b #$80
#_07932D: BNE .holding_b

#_07932F: LDA.b $50
#_079331: AND.b #$FE
#_079333: STA.b $50

.holding_b
#_079335: STZ.b $5B

#_079337: LDY.b #$00 ; LINKSTATE 00

#_079339: LDA.w $02E0
#_07933C: BEQ .set_state_and_continue

#_07933E: LDY.b #$17 ; LINKSTATE 17

#_079340: LDA.l $7EF357
#_079344: BEQ .set_state_and_continue

#_079346: LDY.b #$1C ; LINKSTATE 1C

.set_state_and_continue
#_079348: STY.b $5D

#_07934A: CPY.b #$17 ; LINKSTATE 17
#_07934C: BEQ .normal_bunny

#_07934E: CPY.b #$1C ; LINKSTATE 1C
#_079350: BEQ .temp_bunny

#_079352: BRL LinkState_Default

.normal_bunny
#_079355: BRL LinkState_Bunny

.temp_bunny
#_079358: BRL LinkState_TemporaryBunny

;===================================================================================================

Link_HandleFallingInPit:
#_07935B: JSR TileDetect_BigArea

#_07935E: LDA.b #$04
#_079360: STA.b $5E

#_079362: LDA.b $59
#_079364: AND.b #$0F
#_079366: BNE .prepare_to_fall

#_079368: STZ.b $5B
#_07936A: STZ.b $5E

#_07936C: LDY.b #$00

#_07936E: LDA.w $02E0
#_079371: BEQ .set_state

#_079373: LDY.b #$17 ; LINKSTATE 17

#_079375: LDA.l $7EF357
#_079379: BEQ .set_state

#_07937B: LDY.b #$1C ; LINKSTATE 1C

.set_state
#_07937D: STY.b $5D

#_07937F: JSR Link_CancelDash

#_079382: LDA.b $3A
#_079384: AND.b #$80
#_079386: BNE .sword_not_out

#_079388: LDA.b $50
#_07938A: AND.b #$FE
#_07938C: STA.b $50

.sword_not_out
#_07938E: BRL EXIT_079426

;---------------------------------------------------------------------------------------------------

.prepare_to_fall
#_079391: CMP.b #$0F
#_079393: BNE .dont_fall_just_yet

#_079395: LDA.b $5B
#_079397: CMP.b #$02
#_079399: BEQ .already_falling

#_07939B: LDA.l $7EF357
#_07939F: BEQ .no_pearl

#_0793A1: STZ.w $03F7

#_0793A4: STZ.b $56

#_0793A6: STZ.w $02E0

#_0793A9: STZ.w $03F5
#_0793AC: STZ.w $03F6

.no_pearl
#_0793AF: STZ.b $67
#_0793B1: STZ.b $00

#_0793B3: LDA.b #$02
#_0793B5: STA.b $5B

#_0793B7: LDA.b #$01
#_0793B9: STA.w $037B

#_0793BC: STZ.b $3A
#_0793BE: STZ.b $3C

#_0793C0: STZ.w $0301
#_0793C3: STZ.w $037A

#_0793C6: STZ.b $46
#_0793C8: STZ.b $4D

#_0793CA: LDA.b #$1F ; SFX3.1F
#_0793CC: JSR PlaySFX_Set3

.already_falling
#_0793CF: BRA DetermineConsequencesOfFalling

;---------------------------------------------------------------------------------------------------

.dont_fall_just_yet
#_0793D1: LDX.b #$03

.check_next_flag
#_0793D3: LDA.b $59
#_0793D5: AND.b #$0F
#_0793D7: CMP.w PitFall_FlagsForDetection,X
#_0793DA: BNE .skip

#_0793DC: TXA
#_0793DD: CLC
#_0793DE: ADC.b #$04
#_0793E0: TAX

#_0793E1: BRA .set_flag_index

.skip
#_0793E3: DEX
#_0793E4: BPL .check_next_flag

;---------------------------------------------------------------------------------------------------

#_0793E6: LDX.b #$03

#_0793E8: LDA.b $59

.shift
#_0793EA: LSR A
#_0793EB: BCS .set_flag_index

#_0793ED: DEX
#_0793EE: BPL .shift

.set_flag_index
#_0793F0: STX.w $02C9

#_0793F3: LDA.b $67
#_0793F5: AND.w PitFall_FlagsForDirection,X
#_0793F8: BEQ .not_very_slippery

#_0793FA: LDA.b $67
#_0793FC: STA.b $26

#_0793FE: LDA.b #$06
#_079400: STA.b $5E

#_079402: BRA .continue

.not_very_slippery
#_079404: LDA.b $67
#_079406: STA.b $00

#_079408: LDX.w $02C9

#_07940B: LDA.w PitFall_FlagsForAnimation,X
#_07940E: TSB.b $67

#_079410: LDA.b $00
#_079412: BEQ .dont_animate

;---------------------------------------------------------------------------------------------------

.continue
#_079414: JSL Link_HandleMovingAnimation_FullLongEntry

.dont_animate
#_079418: JSR Link_HandleDiagonalCollision
#_07941B: JSL Link_HandleVelocity
#_07941F: JSR Link_HandleCardinalCollision
#_079422: JSL ApplyLinksMovementToCamera

;---------------------------------------------------------------------------------------------------

#EXIT_079426:
#_079426: RTS

;===================================================================================================

DetermineConsequencesOfFalling:
#_079427: STZ.b $50
#_079429: STZ.b $46

#_07942B: STZ.b $24
#_07942D: STZ.b $25
#_07942F: STZ.b $29

#_079431: STZ.b $4D

#_079433: STZ.w $0373
#_079436: STZ.w $02E1

#_079439: JSR Link_ForceUnequipCape_quietly

#_07943C: INC.w $037B

#_07943F: DEC.b $5C
#_079441: BPL EXIT_079426

#_079443: INC.b $5A

#_079445: LDX.b $5A

#_079447: LDA.b #$09
#_079449: STA.b $5C

#_07944B: LDA.l $7EF3CC
#_07944F: CMP.b #$0D ; FOLLOWER 0D
#_079451: BEQ .no_hud_numbers

#_079453: CPX.b #$01
#_079455: BNE .no_hud_numbers

#_079457: STX.w $02F9

;---------------------------------------------------------------------------------------------------

.no_hud_numbers
#_07945A: CPX.b #$06
#_07945C: BNE EXIT_079426

#_07945E: JSR Link_CancelDash

#_079461: LDY.b #$07
#_079463: STY.b $11

#_079465: LDA.b #$06
#_079467: STA.b $5A

#_079469: LDA.b #$03
#_07946B: STA.b $5B

#_07946D: LDA.b #$0C
#_07946F: STA.b $4B

#_079471: LDA.b #$10
#_079473: STA.b $57

#_079475: LDA.b $20
#_079477: SEC
#_079478: SBC.b $E8
#_07947A: STA.b $00

#_07947C: STZ.b $01

#_07947E: STZ.w $0308
#_079481: STZ.w $0309
#_079484: STZ.w $0376
#_079487: STZ.w $030B

;---------------------------------------------------------------------------------------------------

#_07948A: REP #$30

#_07948C: LDA.b $1B
#_07948E: AND.w #$00FF
#_079491: BEQ .overworld_pit

#_079493: LDA.b $00
#_079495: PHA

#_079496: SEP #$30

#_079498: LDA.b $A0
#_07949A: STA.b $A2

#_07949C: JSL Underworld_FlagRoomData_Quadrants

#_0794A0: REP #$30

#_0794A2: PLA
#_0794A3: STA.b $00

#_0794A5: LDX.w #$0070

#_0794A8: LDA.b $A0

.check_next_room
#_0794AA: CMP.l RoomsWithPitDamage,X
#_0794AE: BEQ UnderworldPitDoDamage

#_0794B0: DEX
#_0794B1: DEX
#_0794B2: BPL .check_next_room

;---------------------------------------------------------------------------------------------------

.overworld_pit
#_0794B4: SEP #$20

#_0794B6: LDA.b $A0
#_0794B8: STA.b $A2

#_0794BA: LDA.l $7EC000
#_0794BE: STA.b $A0

#_0794C0: REP #$20

#_0794C2: LDA.w #$0010
#_0794C5: CLC
#_0794C6: ADC.b $00
#_0794C8: STA.b $00

#_0794CA: LDA.b $20
#_0794CC: STA.b $51

#_0794CE: SEC
#_0794CF: SBC.b $00
#_0794D1: STA.b $20

#_0794D3: SEP #$30

#_0794D5: LDA.b $1B
#_0794D7: BNE HandleLayerOfDestination

#_0794D9: LDA.b $8A
#_0794DB: CMP.b #$05 ; OW 05
#_0794DD: BNE .overworld_pit_transition

#_0794DF: JSL TakeDamageFromPit

#_0794E3: RTS

;---------------------------------------------------------------------------------------------------

.overworld_pit_transition
#_0794E4: JSL Overworld_GetPitDestination

#_0794E8: LDA.b #$11
#_0794EA: STA.b $10

#_0794EC: STZ.b $11
#_0794EE: STZ.b $B0

#_0794F0: RTS

;===================================================================================================

HandleLayerOfDestination:
#_0794F1: LDX.w $063C

#_0794F4: LDA.l LayerOfDestination_for_0476,X
#_0794F8: STA.w $0476

#_0794FB: LDA.l LayerOfDestination_for_EE,X
#_0794FF: STA.b $EE

#_079501: RTS

;===================================================================================================

UnderworldPitDoDamage:
#_079502: SEP #$30

#_079504: LDA.b #$14
#_079506: STA.b $11

#_079508: LDA.l $7EF36D
#_07950C: SEC
#_07950D: SBC.b #$08
#_07950F: STA.l $7EF36D

#_079513: CMP.b #$A8
#_079515: BCC .exit

#_079517: LDA.b #$00
#_079519: STA.l $7EF36D

.exit
#_07951D: RTS

;===================================================================================================

UNREACHABLE_07951E:
#_07951E: db $21, $24

;===================================================================================================

HandleUnderworldLandingFromPit:
#_079520: PHB
#_079521: PHK
#_079522: PLB

#_079523: JSL LinkOAM_Main

#_079527: REP #$20

#_079529: LDA.b $22
#_07952B: STA.w $0FC2

#_07952E: LDA.b $20
#_079530: STA.w $0FC4

#_079533: SEP #$20

#_079535: LDA.b $11
#_079537: CMP.b #$07
#_079539: BNE .dont_make_link_visible

#_07953B: STZ.b $4B

.dont_make_link_visible
#_07953D: LDA.b $1A
#_07953F: AND.b #$03
#_079541: BNE .dont_update_pose

#_079543: INC.b $5A

#_079545: LDA.b $5A
#_079547: CMP.b #$0A
#_079549: BNE .dont_update_pose

#_07954B: LDA.b #$06
#_07954D: STA.b $5A

.dont_update_pose
#_07954F: LDA.b #$04
#_079551: STA.b $67

#_079553: JSL Link_HandleVelocity

#_079557: REP #$20

#_079559: LDA.b $20
#_07955B: BPL .compare_target_coord

#_07955D: LDA.b $51
#_07955F: BMI .compare_target_coord

#_079561: LDA.b $20
#_079563: EOR.w #$FFFF
#_079566: INC A
#_079567: CLC
#_079568: ADC.b $51
#_07956A: BMI .the_eagle_has_landed

#_07956C: BRL .exit

.compare_target_coord
#_07956F: LDA.b $51
#_079571: CMP.b $20
#_079573: BCC .the_eagle_has_landed

#_079575: BRL .exit

;---------------------------------------------------------------------------------------------------

.the_eagle_has_landed
#_079578: LDA.b $51
#_07957A: STA.b $20

#_07957C: SEP #$20

#_07957E: STZ.b $2E

#_079580: STZ.b $57

#_079582: STZ.b $5A
#_079584: STZ.b $5B

#_079586: STZ.b $5E

#_079588: STZ.b $B0
#_07958A: STZ.b $11

#_07958C: STZ.w $037B

#_07958F: LDA.l $7EF3CC
#_079593: BEQ .dont_reinitialize_follower

#_079595: CMP.b #$03 ; FOLLOWER 03
#_079597: BEQ .dont_reinitialize_follower

#_079599: STZ.w $02F9

#_07959C: CMP.b #$0D ; FOLLOWER 0D
#_07959E: BNE .dont_delete_follower

#_0795A0: LDA.b #$00
#_0795A2: STA.l $7EF3CC
#_0795A6: STA.w $04B4
#_0795A9: STA.w $04B5
#_0795AC: STA.l $7EF3D3

#_0795B0: BRA .dont_reinitialize_follower

.dont_delete_follower
#_0795B2: JSL Follower_Initialize

;---------------------------------------------------------------------------------------------------

.dont_reinitialize_follower
#_0795B6: LDY.b #$00

#_0795B8: JSR TileDetect_MainHandler

#_0795BB: LDA.w $0359
#_0795BE: AND.b #$01
#_0795C0: BEQ .not_shallow_water

#_0795C2: LDA.b #$24 ; SFX2.24
#_0795C4: JSR PlaySFX_Set2

.not_shallow_water
#_0795C7: JSR TileDetect_BigArea

#_0795CA: LDA.w $012E
#_0795CD: AND.b #$3F
#_0795CF: CMP.b #$24 ; SFX2.24
#_0795D1: BEQ .already_made_a_sound

#_0795D3: LDA.b #$21 ; SFX2.21
#_0795D5: JSR PlaySFX_Set2

.already_made_a_sound
#_0795D8: LDA.b $AD
#_0795DA: CMP.b #$02
#_0795DC: BNE .dont_flag_masks

#_0795DE: LDA.w $034C
#_0795E1: AND.b #$0F
#_0795E3: BEQ .dont_flag_masks

#_0795E5: LDA.b #$03
#_0795E7: STA.w $0322

.dont_flag_masks
#_0795EA: LDA.w $0341
#_0795ED: AND.b #$0F
#_0795EF: CMP.b #$0F
#_0795F1: BNE .didnt_find_water

#_0795F3: LDA.b #$01
#_0795F5: STA.w $0345

#_0795F8: LDA.b $26
#_0795FA: STA.w $0340

#_0795FD: JSL Link_ResetSwimmingState

#_079601: LDA.b #$01
#_079603: STA.b $EE

#_079605: LDA.b #$15 ; ANCILLA 15
#_079607: LDY.b #$00
#_079609: JSL AncillaAdd_Splash

#_07960D: LDA.b #$04 ; LINKSTATE 04
#_07960F: STA.b $5D

#_079611: JSR Link_ForceUnequipCape_quietly

#_079614: STZ.w $0308
#_079617: STZ.w $0309
#_07961A: STZ.w $0376
#_07961D: STZ.b $5E

#_07961F: BRA .exit

.didnt_find_water
#_079621: LDA.b $59
#_079623: AND.b #$0F
#_079625: BNE .pit

#_079627: LDA.b #$00 ; LINKSTATE 00
#_079629: STA.b $5D

#_07962B: BRA .exit

.pit
#_07962D: LDA.b #$01 ; LINKSTATE 01
#_07962F: STA.b $5D

;---------------------------------------------------------------------------------------------------

.exit
#_079631: SEP #$20

#_079633: PLB

#_079634: RTL

;===================================================================================================

LinkSwimming_anim_offset:
#_079635: dw $0002
#_079637: dw $0001

;===================================================================================================

MaxSwimAcceleration:
#_079639: dw $00F0

;===================================================================================================

LinkState_Swimming:
#_07963B: LDA.b $4D
#_07963D: BEQ .not_diving

#_07963F: LDA.b #$02 ; LINKSTATE 02
#_079641: STA.b $5D
#_079643: STZ.b $25

#_079645: JSR ResetAllAcceleration

#_079648: STZ.w $032A
#_07964B: STZ.w $034F

#_07964E: LDA.b $50
#_079650: AND.b #$FE
#_079652: STA.b $50

#_079654: BRL LinkState_Recoil

;---------------------------------------------------------------------------------------------------

.not_diving
#_079657: STZ.b $3A
#_079659: STZ.b $3C
#_07965B: STZ.b $3D
#_07965D: STZ.b $79

#_07965F: STZ.w $0308
#_079662: STZ.w $0309


#_079665: LDA.l $7EF356
#_079669: BNE .have_flippers

#_07966B: RTS

;---------------------------------------------------------------------------------------------------

.have_flippers
#_07966C: LDA.w $033C
#_07966F: ORA.w $033D
#_079672: ORA.w $033E
#_079675: ORA.w $033F
#_079678: BNE .no_accel

#_07967A: LDA.w $032B
#_07967D: CMP.b #$02
#_07967F: BEQ .dont_reset_collision

#_079681: LDA.w $032D
#_079684: CMP.b #$02
#_079686: BEQ .dont_reset_collision

#_079688: JSR ResetAllAcceleration

;---------------------------------------------------------------------------------------------------

.dont_reset_collision
#_07968B: LDA.b $2E
#_07968D: AND.b #$01
#_07968F: STA.b $2E

#_079691: INC.b $2D

#_079693: LDA.b $2D
#_079695: CMP.b #$10
#_079697: BCC .continue

;---------------------------------------------------------------------------------------------------

#_079699: STZ.b $2D
#_07969B: STZ.w $02CC

#_07969E: LDA.b $2E
#_0796A0: AND.b #$01
#_0796A2: EOR.b #$01
#_0796A4: STA.b $2E

#_0796A6: BRA .continue

;---------------------------------------------------------------------------------------------------

.no_accel
#_0796A8: INC.b $2D

#_0796AA: LDA.b $2D
#_0796AC: CMP.b #$08
#_0796AE: BCC .continue

#_0796B0: STZ.b $2D

#_0796B2: LDA.b $2E
#_0796B4: INC A
#_0796B5: AND.b #$03
#_0796B7: STA.b $2E

#_0796B9: TAX

#_0796BA: LDA.w LinkSwimming_anim_offset,X
#_0796BD: STA.w $02CC

;---------------------------------------------------------------------------------------------------

.continue
#_0796C0: LDA.w $034F
#_0796C3: BNE .not_stroking

#_0796C5: LDA.w $033C
#_0796C8: ORA.w $033D
#_0796CB: ORA.w $033E
#_0796CE: ORA.w $033F
#_0796D1: BEQ Link_HandleSwimMovements

#_0796D3: LDA.b $F6
#_0796D5: AND.b #$80
#_0796D7: STA.b $00

#_0796D9: LDA.b $F4
#_0796DB: ORA.b $00
#_0796DD: AND.b #$C0
#_0796DF: BEQ Link_HandleSwimMovements

#_0796E1: STA.w $034F

#_0796E4: LDA.b #$25 ; SFX2.25
#_0796E6: JSR PlaySFX_Set2

#_0796E9: LDA.b #$01
#_0796EB: STA.w $032A

#_0796EE: LDA.b #$07
#_0796F0: STA.w $02CB

#_0796F3: JSR Link_HandleSwimAccels

;---------------------------------------------------------------------------------------------------

.not_stroking
#_0796F6: DEC.w $02CB
#_0796F9: BPL Link_HandleSwimMovements

#_0796FB: LDA.b #$07
#_0796FD: STA.w $02CB

#_079700: INC.w $032A

#_079703: LDA.w $032A
#_079706: CMP.b #$05
#_079708: BNE Link_HandleSwimMovements

#_07970A: STZ.w $032A

#_07970D: LDA.w $034F
#_079710: AND.b #$3F
#_079712: STA.w $034F

;===================================================================================================

Link_HandleSwimMovements:
#_079715: LDA.b $49
#_079717: AND.b #$0F
#_079719: BNE .no_movement_press

#_07971B: LDA.b $F0
#_07971D: AND.b #$0F
#_07971F: BNE .no_movement_press

#_079721: STZ.b $30
#_079723: STZ.b $31

#_079725: JSR Link_FlagMaxAccels

#_079728: LDA.w $034A
#_07972B: BEQ .check_if_swimming

#_07972D: LDA.w $0372
#_079730: BEQ .not_dashing

#_079732: LDA.w $0340
#_079735: BRA .no_movement_press

;---------------------------------------------------------------------------------------------------

.not_dashing
#_079737: LDA.w $033C
#_07973A: ORA.w $033D
#_07973D: ORA.w $033E
#_079740: ORA.w $033F
#_079743: BNE .finish_up

#_079745: STZ.b $48

#_079747: JSL Link_ResetSwimmingState

#_07974B: BRA .finish_up

;---------------------------------------------------------------------------------------------------

.check_if_swimming
#_07974D: LDA.b $5D
#_07974F: CMP.b #$04 ; LINKSTATE 04
#_079751: BEQ .finish_up

#_079753: STZ.b $2E

#_079755: BRA .finish_up

;---------------------------------------------------------------------------------------------------

.no_movement_press
#_079757: CMP.w $0340
#_07975A: BEQ .dont_reset

#_07975C: STZ.b $2A
#_07975E: STZ.b $2B
#_079760: STZ.b $6B
#_079762: STZ.b $48

.dont_reset
#_079764: STA.w $0340

#_079767: JSR Link_SetIceMaxAccel
#_07976A: JSR Link_SetMomentum
#_07976D: JSR Link_SetTheMaxAccel

;---------------------------------------------------------------------------------------------------

.finish_up
#_079770: JSR Link_HandleDiagonalCollision
#_079773: JSL Link_HandleVelocity
#_079777: JSR Link_HandleCardinalCollision
#_07977A: JSL Link_HandleMovingAnimation_FullLongEntry

#_07977E: STZ.w $0302

#_079781: JSR HandleIndoorCameraAndDoors

#_079784: RTS

;===================================================================================================

Link_FlagMaxAccels:
#_079785: REP #$20

#_079787: LDA.w $034A
#_07978A: AND.w #$00FF
#_07978D: BEQ .exit

#_07978F: LDX.b #$02

.next
#_079791: LDA.w $033C,X
#_079794: BEQ .to_next

#_079796: STA.w $0334,X

#_079799: LDA.w #$0001
#_07979C: STA.w $032B,X

.to_next
#_07979F: DEX
#_0797A0: DEX
#_0797A1: BPL .next

.exit
#_0797A3: SEP #$20

#_0797A5: RTS

;===================================================================================================

Link_SetIceMaxAccel:
#_0797A6: REP #$20

#_0797A8: LDA.w $034A
#_0797AB: AND.w #$00FF
#_0797AE: BEQ .exit

#_0797B0: LDX.b #$02

.next
#_0797B2: LDA.w #$0180
#_0797B5: STA.w $0334,X

#_0797B8: DEX
#_0797B9: DEX
#_0797BA: BPL .next

.exit
#_0797BC: SEP #$20

#_0797BE: RTS

;===================================================================================================

pool Link_SetMomentum

.direction ; Unused
#_0797BF: db $08, $04, $02, $01

.momentum
#_0797C3: dw $0020
#_0797C5: dw $0008

pool off

;===================================================================================================

Link_SetMomentum:
#_0797C7: SEP #$20

#_0797C9: LDA.b $F0
#_0797CB: AND.b #$0F
#_0797CD: STA.b $00

#_0797CF: STZ.b $01

#_0797D1: REP #$30

#_0797D3: LDA.w #$0003
#_0797D6: STA.b $02

#_0797D8: LDX.w #$0002
#_0797DB: STX.b $04

;---------------------------------------------------------------------------------------------------

.next
#_0797DD: LDY.w #$0000

#_0797E0: LDA.b $00
#_0797E2: AND.b $02
#_0797E4: BEQ .skip

#_0797E6: AND.b $04
#_0797E8: BNE .pressed_left

#_0797EA: LDY.w #$0001

.pressed_left
#_0797ED: LDA.w #$0020
#_0797F0: STA.w $0326,X

#_0797F3: LDA.w $034A
#_0797F6: AND.w #$00FF
#_0797F9: BEQ .not_on_ice

#_0797FB: PHY

#_0797FC: DEC A
#_0797FD: ASL A
#_0797FE: TAY

#_0797FF: LDA.w .momentum,Y
#_079802: STA.w $0326,X

#_079805: PLY

.not_on_ice
#_079806: LDA.w $0340
#_079809: ORA.b $67
#_07980B: AND.b $02
#_07980D: CMP.b $02
#_07980F: BNE .did_a_left_press

#_079811: LDA.w #$0002
#_079814: STA.w $032B,X

#_079817: BRA .continue

.did_a_left_press
#_079819: TYA
#_07981A: STA.w $0338,X

#_07981D: STZ.w $032B,X

.continue
#_079820: LDA.w $0334,X
#_079823: BNE .skip

#_079825: LDA.w MaxSwimAcceleration
#_079828: STA.w $0334,X

.skip
#_07982B: ASL.b $02
#_07982D: ASL.b $02
#_07982F: ASL.b $04
#_079831: ASL.b $04

#_079833: DEX
#_079834: DEX
#_079835: BPL .next

#_079837: SEP #$30

#_079839: RTS

;===================================================================================================

Link_ResetSwimmingState:
#_07983A: PHB
#_07983B: PHK
#_07983C: PLB

#_07983D: STZ.w $02CB
#_079840: STZ.w $034F
#_079843: STZ.w $032A

#_079846: JSR ResetAllAcceleration

#_079849: PLB

#_07984A: RTL

;===================================================================================================

Link_ResetStateAfterDamagingPit:
#_07984B: PHB
#_07984C: PHK
#_07984D: PLB

#_07984E: JSL Link_ResetSwimmingState

#_079852: LDY.b #$00 ; LINKSTATE 00

#_079854: LDA.b $56
#_079856: BEQ .dont_bunny

#_079858: LDA.l $7EF357
#_07985C: BNE .dont_bunny

#_07985E: LDY.b #$17 ; LINKSTATE 17

.dont_bunny
#_079860: STY.b $5D

#_079862: LDA.w $0340
#_079865: STA.b $26

#_079867: STZ.w $0345
#_07986A: STZ.w $037B

#_07986D: STZ.b $5A
#_07986F: STZ.b $5B

#_079871: PLB

#_079872: RTL

;===================================================================================================

ResetAllAcceleration:
#_079873: REP #$20

#_079875: STZ.w $032F
#_079878: STZ.w $0331

#_07987B: STZ.w $0326
#_07987E: STZ.w $0328

#_079881: STZ.w $032B
#_079884: STZ.w $032D

#_079887: STZ.w $033C
#_07988A: STZ.w $033E

#_07988D: STZ.w $0334
#_079890: STZ.w $0336

#_079893: SEP #$20

#_079895: RTS

;===================================================================================================

pool Link_HandleSwimAccels

.max_speeds
#_079896: dw $0080, $00A0, $00C0, $00E0
#_07989E: dw $0100, $0120, $0140, $0160
#_0798A6: dw $0180

pool off

;---------------------------------------------------------------------------------------------------

Link_HandleSwimAccels:
#_0798A8: REP #$30

#_0798AA: LDX.w #$0002

#_0798AD: LDA.w #$0003
#_0798B0: STA.b $02

;---------------------------------------------------------------------------------------------------

.next
#_0798B2: LDA.b $F0
#_0798B4: AND.b $02
#_0798B6: BEQ .next_axis

#_0798B8: LDA.w $033C,X
#_0798BB: BEQ .check_max

#_0798BD: LDA.w $0334,X
#_0798C0: CMP.w #$0180
#_0798C3: BCC .check_max

#_0798C5: LDY.w #$0000

.check_next
#_0798C8: LDA.w .max_speeds,Y
#_0798CB: CMP.w $033C,X
#_0798CE: BCS .set

#_0798D0: INY
#_0798D1: INY
#_0798D2: CPY.w #$0012
#_0798D5: BNE .check_next

#_0798D7: BRA .set

.check_max
#_0798D9: LDA.w $0334,X
#_0798DC: BEQ .no_max

#_0798DE: CLC
#_0798DF: ADC.w #$00A0
#_0798E2: CMP.w #$0180
#_0798E5: BCC .set

#_0798E7: LDA.w #$0180
#_0798EA: BRA .set

.no_max
#_0798EC: LDA.w #$0001
#_0798EF: STA.w $033C,X

#_0798F2: LDA.w MaxSwimAcceleration

.set
#_0798F5: STA.w $0334,X

.next_axis
#_0798F8: ASL.b $02
#_0798FA: ASL.b $02

#_0798FC: DEX
#_0798FD: DEX
#_0798FE: BPL .next

#_079900: SEP #$30

#_079902: RTS

;===================================================================================================

Link_SetTheMaxAccel:
#_079903: REP #$30

#_079905: LDA.w $034A
#_079908: AND.w #$00FF
#_07990B: BNE .exit

#_07990D: LDA.w $034F
#_079910: AND.w #$00FF
#_079913: BNE .exit

;---------------------------------------------------------------------------------------------------

#_079915: LDX.w #$0002

#_079918: LDA.w #$0003
#_07991B: STA.b $02

.next
#_07991D: LDA.b $F0
#_07991F: AND.b $02
#_079921: BEQ .set

#_079923: LDA.w $032B,X
#_079926: CMP.w #$0002
#_079929: BEQ .set

#_07992B: LDA.w $032F,X
#_07992E: BNE .reset

#_079930: STZ.w $032F,X

#_079933: LDA.w $033C,X
#_079936: CMP.w MaxSwimAcceleration
#_079939: BCC .to_next

#_07993B: CMP.w $0334,X
#_07993E: BEQ .reset
#_079940: BCC .to_next

.reset
#_079942: STZ.w $032B,X

#_079945: LDA.w $033C,X
#_079948: CMP.w MaxSwimAcceleration
#_07994B: BCC .set

#_07994D: LDA.w #$0001
#_079950: STA.w $032B,X
#_079953: STA.w $032F,X

#_079956: BRA .to_next

.set
#_079958: LDA.w MaxSwimAcceleration
#_07995B: STA.w $0334,X
#_07995E: STZ.w $032F,X

.to_next
#_079961: ASL.b $02
#_079963: ASL.b $02

#_079965: DEX
#_079966: DEX
#_079967: BPL .next

.exit
#_079969: SEP #$30

#_07996B: RTS

;===================================================================================================

LinkState_Zapped:
#_07996C: JSR CacheCameraPropertiesIfOutdoors
#_07996F: JSL LinkZap_HandleMosaic

#_079973: DEC.b $3D
#_079975: BPL LinkState_ShowingOffItem

#_079977: LDA.b #$02
#_079979: STA.b $3D

#_07997B: LDA.w $0300
#_07997E: INC A
#_07997F: STA.w $0300

#_079982: AND.b #$01
#_079984: BEQ .normal_palette

#_079986: JSL RefreshLinkEquipmentPalettes_zap
#_07998A: BRA .continue

.normal_palette
#_07998C: JSL RefreshLinkEquipmentPalettes_sword_and_mail

.continue
#_079990: LDA.w $0300
#_079993: CMP.b #$08
#_079995: BNE LinkState_ShowingOffItem

#_079997: STZ.w $0300

#_07999A: LDA.b #$00 ; LINKSTATE 00
#_07999C: STA.b $5D

#_07999E: STZ.w $037B
#_0799A1: STZ.w $0360

#_0799A4: STZ.b $4D

#_0799A6: LDA.b #$00
#_0799A8: JSL LinkZap_ResetMosaic

;===================================================================================================

LinkState_ShowingOffItem:
#_0799AC: RTS

;===================================================================================================

Link_ReceiveItem:
#_0799AD: PHB
#_0799AE: PHK
#_0799AF: PLB

#_0799B0: LDA.b $4D
#_0799B2: BEQ .not_recoiling

#_0799B4: STZ.b $4D
#_0799B6: STZ.b $46

#_0799B8: STZ.w $031F
#_0799BB: STZ.w $0308

.not_recoiling
#_0799BE: STY.w $02D8

#_0799C1: CPY.b #$3E ; ITEMGET 3E
#_0799C3: BNE .not_boss_heart

#_0799C5: LDA.b #$2E ; SFX3.2E
#_0799C7: JSR PlaySFX_Set3

.not_boss_heart
#_0799CA: LDA.b #$60
#_0799CC: STA.w $02D9

#_0799CF: LDA.w $02E9
#_0799D2: BEQ .normal_pose

#_0799D4: CMP.b #$03
#_0799D6: BNE .not_cool_pose

;---------------------------------------------------------------------------------------------------

.normal_pose
#_0799D8: STZ.w $0308

#_0799DB: STZ.b $3A
#_0799DD: STZ.b $3B
#_0799DF: STZ.b $3C

#_0799E1: STZ.b $5E
#_0799E3: STZ.b $50

#_0799E5: STZ.w $0301
#_0799E8: STZ.w $037A

#_0799EB: STZ.w $0300

#_0799EE: LDA.b #$15 ; LINKSTATE 15
#_0799F0: STA.b $5D

#_0799F2: LDA.b #$01
#_0799F4: STA.w $02DA
#_0799F7: STA.w $037B

#_0799FA: CPY.b #$20 ; ITEMGET 20
#_0799FC: BNE .not_cool_pose

#_0799FE: INC A
#_0799FF: STA.w $02DA

;---------------------------------------------------------------------------------------------------

.not_cool_pose
#_079A02: PHX

#_079A03: LDY.b #$04
#_079A05: LDA.b #$22 ; ANCILLA 22
#_079A07: JSL AncillaAdd_ItemReceipt

#_079A0B: LDA.w $02D8

#_079A0E: CMP.b #$20 ; ITEMGET 20
#_079A10: BEQ .skip_hud

#_079A12: CMP.b #$37 ; ITEMGET 37
#_079A14: BEQ .skip_hud

#_079A16: CMP.b #$38 ; ITEMGET 38
#_079A18: BEQ .skip_hud

#_079A1A: CMP.b #$39 ; ITEMGET 39
#_079A1C: BEQ .skip_hud

#_079A1E: JSL RefreshIcon_long

.skip_hud
#_079A22: JSR Link_CancelDash

#_079A25: PLX

#_079A26: CLC

#_079A27: PLB

#_079A28: RTL

;===================================================================================================

UNREACHABLE_079A29:
#_079A29: SEC

#_079A2A: PLB

#_079A2B: RTL

;===================================================================================================

Link_TuckIntoBed:
#_079A2C: PHB
#_079A2D: PHK
#_079A2E: PLB

#_079A2F: REP #$20

#_079A31: LDA.w #$215A
#_079A34: STA.b $20

#_079A36: LDA.w #$0940
#_079A39: STA.b $22

#_079A3B: SEP #$20

#_079A3D: LDA.b #$16 ; LINKSTATE 16
#_079A3F: STA.b $5D

#_079A41: STZ.w $037C
#_079A44: STZ.w $037D

#_079A47: LDA.b #$03
#_079A49: STA.w $0374

#_079A4C: LDA.b #$20 ; ANCILLA 20
#_079A4E: JSL AncillaAdd_Blanket

#_079A52: PLB

#_079A53: RTL

;===================================================================================================

pool LinkState_Sleeping

.vectors
#_079A54: dw Link_SnoringInBed
#_079A56: dw Link_SittingUpInBed
#_079A58: dw Link_JumpingOutOfBed

pool off

;---------------------------------------------------------------------------------------------------

LinkState_Sleeping:
#_079A5A: LDA.w $037C
#_079A5D: ASL A
#_079A5E: TAX

#_079A5F: JMP.w (.vectors,X)

;===================================================================================================

Link_SnoringInBed:
#_079A62: LDA.b $1A
#_079A64: AND.b #$1F
#_079A66: BNE .exit

#_079A68: LDY.b #$01
#_079A6A: LDA.b #$21 ; ANCILLA 21
#_079A6C: JSL AncillaAdd_Snoring

.exit
#_079A70: RTS

;===================================================================================================

Link_SittingUpInBed:
#_079A71: LDA.b $11
#_079A73: BNE .exit

#_079A75: DEC.w $0374
#_079A78: BPL .exit

#_079A7A: STZ.w $0374

#_079A7D: LDA.b $F4
#_079A7F: AND.b #$E0
#_079A81: STA.b $00

#_079A83: LDA.b $F4

#_079A85: ASL A
#_079A86: ASL A
#_079A87: ASL A
#_079A88: ASL A

#_079A89: ORA.b $00
#_079A8B: ORA.b $F6

#_079A8D: AND.b #$F0
#_079A8F: BEQ .exit

#_079A91: INC.w $037D

#_079A94: LDA.b #$06
#_079A96: STA.b $2F

#_079A98: INC.w $037C

#_079A9B: LDA.b #$04
#_079A9D: STA.w $0374

.exit
#_079AA0: RTS

;===================================================================================================

Link_JumpingOutOfBed:
#_079AA1: DEC.w $0374
#_079AA4: BPL .exit

#_079AA6: LDA.b #$04
#_079AA8: STA.b $27

#_079AAA: LDA.b #$15
#_079AAC: STA.b $28

#_079AAE: LDA.b #$18
#_079AB0: STA.b $29
#_079AB2: STA.w $02C7

#_079AB5: LDA.b #$10
#_079AB7: STA.b $46

#_079AB9: LDA.b #$02
#_079ABB: STA.b $4D

#_079ABD: LDA.b #$06 ; LINKSTATE 06
#_079ABF: STA.b $5D

.exit
#_079AC1: RTS

;===================================================================================================

Link_HandleSwordCooldown:
#_079AC2: DEC.w $02E3
#_079AC5: BPL EXIT_079AE5

#_079AC7: STZ.w $02E3

#_079ACA: LDA.w $0301
#_079ACD: ORA.w $037A
#_079AD0: BNE EXIT_079AE5

#_079AD2: LDA.b $3C
#_079AD4: CMP.b #$09
#_079AD6: BCS .spin_attack

#_079AD8: LDA.w $0372
#_079ADB: BNE EXIT_079AE5

#_079ADD: JSR Link_CheckForSwordSwing
#_079AE0: BRA EXIT_079AE5

.spin_attack
#_079AE2: JSR HandleSwordControls

;---------------------------------------------------------------------------------------------------

#EXIT_079AE5:
#_079AE5: RTS

;===================================================================================================

pool Link_HandleYItem

.vectors
#_079AE6: dw LinkItem_Bombs
#_079AE8: dw LinkItem_Boomerang
#_079AEA: dw LinkItem_Bow
#_079AEC: dw LinkItem_Hammer

#_079AEE: dw LinkItem_Rod
#_079AF0: dw LinkItem_Rod
#_079AF2: dw LinkItem_Net
#_079AF4: dw LinkItem_ShovelAndFlute

#_079AF6: dw LinkItem_Lamp
#_079AF8: dw LinkItem_Powder
#_079AFA: dw LinkItem_Bottle
#_079AFC: dw LinkItem_Book

#_079AFE: dw LinkItem_CaneOfByrna
#_079B00: dw LinkItem_Hookshot
#_079B02: dw LinkItem_Bombos
#_079B04: dw LinkItem_Ether

#_079B06: dw LinkItem_Quake
#_079B08: dw LinkItem_CaneOfSomaria
#_079B0A: dw LinkItem_Cape
#_079B0C: dw LinkItem_Mirror

pool off

;---------------------------------------------------------------------------------------------------

Link_HandleYItem:
#_079B0E: LDA.b $3C
#_079B10: BEQ .sword_not_out

#_079B12: CMP.b #$09
#_079B14: BCC EXIT_079AE5

.sword_not_out
#_079B16: LDA.w $02E0
#_079B19: BEQ .not_bunny

#_079B1B: LDA.w $0303
#_079B1E: CMP.b #$0B
#_079B20: BEQ .not_bunny

#_079B22: CMP.b #$14
#_079B24: BEQ .not_bunny

#_079B26: RTS

;---------------------------------------------------------------------------------------------------

.not_bunny
#_079B27: LDY.w $03FC
#_079B2A: BEQ .just_use_item_already

#_079B2C: LDA.w $02E0
#_079B2F: BNE .just_use_item_already

#_079B31: CPY.b #$02
#_079B33: BEQ .force_bow

#_079B35: BRL LinkItem_Shovel

.force_bow
#_079B38: BRL LinkItem_Bow

.just_use_item_already
#_079B3B: LDY.w $0304
#_079B3E: CPY.w $0303
#_079B41: BEQ .dont_remove_cape

#_079B43: LDA.w $0304
#_079B46: CMP.b #$08
#_079B48: BNE .cant_flute

#_079B4A: LDA.l $7EF34C
#_079B4E: AND.b #$02
#_079B50: BEQ .cant_flute

#_079B52: LDA.b $3A
#_079B54: AND.b #$BF
#_079B56: STA.b $3A

;---------------------------------------------------------------------------------------------------

.cant_flute
#_079B58: LDA.w $0304
#_079B5B: CMP.b #$13
#_079B5D: BNE .dont_remove_cape

#_079B5F: LDA.b $55
#_079B61: BEQ .dont_remove_cape

#_079B63: JSR Link_ForceUnequipCape

.dont_remove_cape
#_079B66: LDA.w $0301
#_079B69: ORA.w $037A
#_079B6C: BNE .dont_copy_item

#_079B6E: LDY.w $0303
#_079B71: STY.w $0304

.dont_copy_item
#_079B74: BEQ .exit

;---------------------------------------------------------------------------------------------------

#_079B76: CPY.b #$05
#_079B78: BEQ .rod

#_079B7A: CPY.b #$06
#_079B7C: BNE .not_rod

.rod
#_079B7E: LDA.w $0304
#_079B81: SEC
#_079B82: SBC.b #$05
#_079B84: INC A
#_079B85: STA.w $0307

;---------------------------------------------------------------------------------------------------

.not_rod
#_079B88: DEY
#_079B89: BMI .exit

#_079B8B: TYA
#_079B8C: ASL A
#_079B8D: TAX

#_079B8E: JMP.w (.vectors,X)

.exit
#_079B91: RTS

;===================================================================================================

Link_APress_vectors:
#_079B92: dw Link_APress_NothingA
#_079B94: dw Link_APress_LiftCarryThrow
#_079B96: dw Link_APress_NothingB
#_079B98: dw Link_APress_PullObject
#_079B9A: dw Link_APress_NothingC
#_079B9C: dw EXIT_07B5BF
#_079B9E: dw Link_APress_StatueDrag
#_079BA0: dw Link_APress_RupeePull

;===================================================================================================

Link_AbilityChecks:
#_079BA2: db $E0 ; 11100000 - Lift, read, talk
#_079BA3: db $40 ; 01000000 - Read
#_079BA4: db $04 ; 00000100 - Run
#_079BA5: db $E0 ; 11100000 - Lift, read, talk
#_079BA6: db $E0 ; 11100000 - Lift, read, talk
#_079BA7: db $E0 ; 11100000 - Lift, read, talk
#_079BA8: db $E0 ; 11100000 - Lift, read, talk | used by statue drag
#_079BA9: db $E0 ; 11100000 - Lift, read, talk | used by rupee pull

;===================================================================================================

Link_HandleAPress:
#_079BAA: STZ.w $02F4

#_079BAD: LDA.w $0301
#_079BB0: BNE .exit

#_079BB2: LDA.w $037A
#_079BB5: AND.b #$1F
#_079BB7: BNE .exit

#_079BB9: LDA.w $0379
#_079BBC: BNE .exit

#_079BBE: LDA.b $3C
#_079BC0: CMP.b #$09
#_079BC2: BCS .not_using_sword

#_079BC4: LDA.b $3A
#_079BC6: AND.b #$80
#_079BC8: BEQ .not_using_sword

.exit
#_079BCA: RTS

;---------------------------------------------------------------------------------------------------

.not_using_sword
#_079BCB: LDX.w $036C

#_079BCE: LDA.w $0308
#_079BD1: ORA.w $0376
#_079BD4: BNE .handle_toss_and_grab

;---------------------------------------------------------------------------------------------------

#_079BD6: JSR Link_CheckNewAPress
#_079BD9: BCC .no_a_press

#_079BDB: LDA.w $03F8
#_079BDE: BEQ .no_rupee_pull

#_079BE0: LDA.b $2F
#_079BE2: BNE .no_rupee_pull

#_079BE4: LDX.b #$07
#_079BE6: BRL .use_a_press

.no_rupee_pull
#_079BE9: LDA.w $02FA
#_079BEC: BEQ .not_statue

#_079BEE: LDX.b #$06
#_079BF0: BRL .use_a_press

;---------------------------------------------------------------------------------------------------

.not_statue
#_079BF3: LDA.w $02EC
#_079BF6: BNE .not_lifting

#_079BF8: LDA.w $0314
#_079BFB: BEQ .cant_lift_sprite

#_079BFD: LDA.w $0314
#_079C00: STA.w $02F4

.not_lifting
#_079C03: LDA.b $3C
#_079C05: BEQ .no_sword

#_079C07: JSR Link_ResetSwordAndItemUsage

.no_sword
#_079C0A: LDA.w $0301
#_079C0D: ORA.w $037A
#_079C10: BEQ .no_boom

#_079C12: STZ.w $0301
#_079C15: STZ.w $037A

#_079C18: JSR Link_ResetBoomerangYStuff

#_079C1B: STZ.w $035F

#_079C1E: LDA.w $0C4A
#_079C21: CMP.b #$05 ; ANCILLA 05
#_079C23: BNE .no_boom

#_079C25: STZ.w $0C4A

.no_boom
#_079C28: LDX.b #$01
#_079C2A: BRA .use_a_press

.cant_lift_sprite
#_079C2C: JSR Link_HandleLiftables

;---------------------------------------------------------------------------------------------------

.use_a_press
#_079C2F: LDA.w Link_AbilityChecks,X
#_079C32: AND.l $7EF379
#_079C36: BEQ .no_a_press

#_079C38: STX.w $036C

#_079C3B: TXA
#_079C3C: ASL A
#_079C3D: TAX

#_079C3E: JSR Link_APress_PerformBasic

;---------------------------------------------------------------------------------------------------

.handle_toss_and_grab
#_079C41: LDA.w $036C
#_079C44: STA.w $0306

#_079C47: ASL A
#_079C48: TAX

#_079C49: JMP.w (Link_APress_vectors,X)

.no_a_press
#_079C4C: STZ.b $3B

#_079C4E: RTS

;===================================================================================================

pool Link_APress_PerformBasic

.vectors
#_079C4F: dw Link_PerformDesertPrayer
#_079C51: dw Link_PerformThrow
#_079C53: dw Link_PerformDash
#_079C55: dw Link_PerformGrab
#_079C57: dw Link_PerformRead
#_079C59: dw Link_PerformOpenChest
#_079C5B: dw Link_PerformStatueDrag
#_079C5D: dw Link_PerformRupeePull

pool off

;---------------------------------------------------------------------------------------------------

Link_APress_PerformBasic:
#_079C5F: JMP.w (.vectors,X)

;===================================================================================================

UNREACHABLE_079C62:
#_079C62: RTS

;===================================================================================================

UNREACHABLE_079C63:
#_079C63: db $00, $01, $01

;===================================================================================================

HandleSwordSFXAndBeam:
#_079C66: LDA.b $67
#_079C68: AND.b #$F0
#_079C6A: STA.b $67

#_079C6C: STZ.b $3C
#_079C6E: STZ.b $79

#_079C70: LDA.l $7EF36C
#_079C74: SEC
#_079C75: SBC.b #$04
#_079C77: CMP.l $7EF36D
#_079C7B: BCS .no_make_beam

#_079C7D: LDA.l $7EF359
#_079C81: INC A
#_079C82: AND.b #$FE
#_079C84: BEQ .no_make_beam

#_079C86: LDA.l $7EF359
#_079C8A: CMP.b #$02
#_079C8C: BCC .no_make_beam

;---------------------------------------------------------------------------------------------------

#_079C8E: LDX.b #$04

.next_slot
#_079C90: LDA.w $0C4A,X
#_079C93: CMP.b #$31 ; ANCILLA 31
#_079C95: BEQ .no_make_beam

#_079C97: DEX
#_079C98: BPL .next_slot

;---------------------------------------------------------------------------------------------------

#_079C9A: LDY.b #$00
#_079C9C: JSL AncillaAdd_SwordBeam

.no_make_beam
#_079CA0: JSL Link_CalculateSFXPan
#_079CA4: PHA

#_079CA5: LDA.l $7EF359
#_079CA9: DEC A

#_079CAA: TAX
#_079CAB: PLA

#_079CAC: CPX.b #$FE
#_079CAE: BEQ .no_make_swing_sfx

#_079CB0: CPX.b #$FF
#_079CB2: BEQ .no_make_swing_sfx

#_079CB4: ORA.w SwordSwingSFX,X
#_079CB7: STA.w $012E

.no_make_swing_sfx
#_079CBA: LDX.b #$01
#_079CBC: STX.b $3D

;---------------------------------------------------------------------------------------------------

#EXIT_079CBE:
#_079CBE: RTS

;===================================================================================================

SwordSwingTimers:
#_079CBF: db $01, $00, $00, $00, $00, $03, $00, $00
#_079CC7: db $01, $00, $03, $03, $03, $03, $04, $04
#_079CCF: db $01, $05

;===================================================================================================

SwordSwingSFX:
#_079CD1: db $01 ; SFX2.01
#_079CD2: db $02 ; SFX2.02
#_079CD3: db $03 ; SFX2.03
#_079CD4: db $04 ; SFX2.04
#_079CD5: db $00 ; SFX2.00
#_079CD6: db $09 ; SFX2.09
#_079CD7: db $12 ; SFX2.12
#_079CD8: db $1B ; SFX2.1B

;===================================================================================================

Link_CheckForSwordSwing:
#_079CD9: LDA.b $3B
#_079CDB: AND.b #$10
#_079CDD: BNE EXIT_079CBE

#_079CDF: BIT.b $3A
#_079CE1: BMI .pressing_b

#_079CE3: BIT.b $F4
#_079CE5: BPL EXIT_079CBE

#_079CE7: LDX.b $6C
#_079CE9: BEQ .not_in_door

#_079CEB: JSR TileDetect_SwordSwingDeepInDoor

#_079CEE: LDA.b $0E
#_079CF0: AND.b #$30
#_079CF2: EOR.b #$30
#_079CF4: BEQ EXIT_079CBE

;---------------------------------------------------------------------------------------------------

.not_in_door
#_079CF6: LDA.b #$80
#_079CF8: TSB.b $3A

#_079CFA: JSR HandleSwordSFXAndBeam

#_079CFD: LDA.b #$01
#_079CFF: TSB.b $50

#_079D01: STZ.b $2E

;---------------------------------------------------------------------------------------------------

.pressing_b
#_079D03: BIT.b $F0
#_079D05: BMI .holding_b

#_079D07: LDA.b #$01
#_079D09: TSB.b $3A

.holding_b
#_079D0B: JSR HaltLinkWhenUsingItems

#_079D0E: LDA.b $67
#_079D10: AND.b #$F0
#_079D12: STA.b $67

#_079D14: DEC.b $3D
#_079D16: BPL .finish_up

;---------------------------------------------------------------------------------------------------

#_079D18: INC.b $3C

#_079D1A: LDA.b $3C
#_079D1C: CMP.b #$09
#_079D1E: BCS HandleSwordControls

#_079D20: TAX

#_079D21: LDA.w SwordSwingTimers,X
#_079D24: STA.b $3D

#_079D26: CPX.b #$05
#_079D28: BNE .no_swing_sparkle

#_079D2A: LDA.l $7EF359
#_079D2E: BEQ .weak_or_no_sword

#_079D30: CMP.b #$01
#_079D32: BEQ .weak_or_no_sword

#_079D34: CMP.b #$FF
#_079D36: BEQ .weak_or_no_sword

#_079D38: LDY.b #$04
#_079D3A: LDA.b #$26 ; ANCILLA 26
#_079D3C: JSL AncillaAdd_SwordSwingSparkle

;---------------------------------------------------------------------------------------------------

.weak_or_no_sword
#_079D40: LDY.b #$01

#_079D42: LDA.l $7EF359
#_079D46: BEQ .finish_up

#_079D48: CMP.b #$FF
#_079D4A: BEQ .finish_up

#_079D4C: CMP.b #$01
#_079D4E: BEQ .fighter_swsord

#_079D50: LDY.b #$06

.fighter_swsord
#_079D52: JSR TileDetect_MainHandler

#_079D55: BRA .finish_up

;---------------------------------------------------------------------------------------------------

.no_swing_sparkle
#_079D57: CPX.b #$04
#_079D59: BCC .finish_up

#_079D5B: LDA.b $3A
#_079D5D: AND.b #$01
#_079D5F: BEQ .finish_up

#_079D61: BIT.b $F0
#_079D63: BPL .finish_up

#_079D65: LDA.b $3A
#_079D67: AND.b #$FE
#_079D69: STA.b $3A

#_079D6B: BRL HandleSwordSFXAndBeam

;---------------------------------------------------------------------------------------------------

.finish_up
#_079D6E: JSR CalculateSwordHitbox

#_079D71: RTS

;===================================================================================================

HandleSwordControls:
#_079D72: BIT.b $F0
#_079D74: BMI .holding_b

#_079D76: LDA.b $79
#_079D78: CMP.b #$30
#_079D7A: BCC Link_ResetSwordAndItemUsage

#_079D7C: JSR Link_ResetSwordAndItemUsage

#_079D7F: STZ.b $79

#_079D81: BRL Link_ActivateSpinAttack

;===================================================================================================

#Link_ResetSwordAndItemUsage:
#_079D84: STZ.b $5E

#_079D86: LDA.b $48
#_079D88: AND.b #$F6
#_079D8A: STA.b $48

#_079D8C: STZ.b $3D
#_079D8E: STZ.b $3C

#_079D90: LDA.b $3A
#_079D92: AND.b #$7E
#_079D94: STA.b $3A

#_079D96: LDA.b $50
#_079D98: AND.b #$FE
#_079D9A: STA.b $50

#_079D9C: BRL EXIT_079E62

;---------------------------------------------------------------------------------------------------

.holding_b
#_079D9F: BIT.b $48
#_079DA1: BMI .pushing_statue

#_079DA3: LDA.b $48
#_079DA5: AND.b #$09
#_079DA7: BNE .pushing_possibly_against_a_door

.pushing_statue
#_079DA9: LDA.b $47
#_079DAB: BEQ .no_tink

#_079DAD: CMP.b #$01
#_079DAF: BEQ Link_ResetSwordAndItemUsage

.pushing_possibly_against_a_door
#_079DB1: LDA.b $3C
#_079DB3: CMP.b #$09
#_079DB5: BNE .not_in_strafe

#_079DB7: LDX.b #$0A
#_079DB9: STX.b $3C

#_079DBB: LDA.w SwordSwingTimers,X
#_079DBE: STA.b $3D

.not_in_strafe
#_079DC0: DEC.b $3D
#_079DC2: BPL .timer_running

#_079DC4: LDA.b $3C
#_079DC6: INC A
#_079DC7: CMP.b #$0D
#_079DC9: BNE .dont_tap_wall

#_079DCB: LDA.l $7EF359
#_079DCF: INC A
#_079DD0: AND.b #$FE
#_079DD2: BEQ .reset_poke_index

#_079DD4: LDA.b $48
#_079DD6: AND.b #$09
#_079DD8: BEQ .reset_poke_index

#_079DDA: LDY.b #$01
#_079DDC: LDA.b #$1B ; ANCILLA 1B
#_079DDE: JSL AncillaAdd_WallTapSpark

#_079DE2: LDA.b $48
#_079DE4: AND.b #$08
#_079DE6: BNE .not_poking_door

#_079DE8: LDA.b #$05 ; SFX2.05
#_079DEA: JSR PlaySFX_Set2

#_079DED: BRA .detect_poked_tile

.not_poking_door
#_079DEF: LDA.b #$06 ; SFX2.06
#_079DF1: JSR PlaySFX_Set2

.detect_poked_tile
#_079DF4: LDY.b #$01
#_079DF6: JSR TileDetect_MainHandler

.reset_poke_index
#_079DF9: LDA.b #$0A

.dont_tap_wall
#_079DFB: STA.b $3C

#_079DFD: TAX

#_079DFE: LDA.w SwordSwingTimers,X
#_079E01: STA.b $3D

.timer_running
#_079E03: BRA .do_hitbox

;---------------------------------------------------------------------------------------------------

.no_tink
#_079E05: LDA.b #$09
#_079E07: STA.b $3C

#_079E09: LDA.b #$01
#_079E0B: TSB.b $50

#_079E0D: STZ.b $3D

#_079E0F: LDA.b $5E
#_079E11: CMP.b #$04
#_079E13: BEQ .do_hitbox

#_079E15: CMP.b #$10
#_079E17: BEQ .do_hitbox

#_079E19: LDA.b #$0C
#_079E1B: STA.b $5E

#_079E1D: LDA.l $7EF359
#_079E21: INC A
#_079E22: AND.b #$FE
#_079E24: BEQ EXIT_079E62

;---------------------------------------------------------------------------------------------------

#_079E26: LDX.b #$04

.look_for_byrna_spark
#_079E28: LDA.w $0C4A,X
#_079E2B: CMP.b #$30 ; ANCILLA 30
#_079E2D: BEQ EXIT_079E62

#_079E2F: CMP.b #$31 ; ANCILLA 31
#_079E31: BEQ EXIT_079E62

#_079E33: DEX
#_079E34: BPL .look_for_byrna_spark

;---------------------------------------------------------------------------------------------------

#_079E36: LDA.b $79
#_079E38: CMP.b #$06
#_079E3A: BCC .dont_add_charge_sparkle

#_079E3C: LDA.b $1A
#_079E3E: AND.b #$03
#_079E40: BNE .dont_add_charge_sparkle

#_079E42: JSL AncillaSpawn_SwordChargeSparkle

.dont_add_charge_sparkle
#_079E46: LDA.b $79
#_079E48: CMP.b #$40
#_079E4A: BCS EXIT_079E62

#_079E4C: INC.b $79

#_079E4E: LDA.b $79
#_079E50: CMP.b #$30
#_079E52: BNE EXIT_079E62

#_079E54: LDA.b #$37 ; SFX2.37
#_079E56: JSR PlaySFX_Set2

#_079E59: JSL AncillaAdd_ChargedSpinAttackSparkle

#_079E5D: BRA EXIT_079E62

.do_hitbox
#_079E5F: JSR CalculateSwordHitbox

;---------------------------------------------------------------------------------------------------

#EXIT_079E62:
#_079E62: RTS

;===================================================================================================

CalculateSwordHitbox:
#_079E63: LDA.l $7EF359
#_079E67: BEQ EXIT_079E62

#_079E69: CMP.b #$FF
#_079E6B: BEQ EXIT_079E62

#_079E6D: CMP.b #$02
#_079E6F: BCS .not_fighter_sword

;===================================================================================================

.set_sword_hitbox_offsets
#_079E71: LDY.b #$27

#_079E73: LDA.b $3C
#_079E75: STA.b $02
#_079E77: STZ.b $03

#_079E79: CMP.b #$09
#_079E7B: BEQ EXIT_079E62
#_079E7D: BCC .slashing

#_079E7F: LDA.b $02
#_079E81: SEC
#_079E82: SBC.b #$0A
#_079E84: STA.b $02

#_079E86: LDY.b #$03

;---------------------------------------------------------------------------------------------------

.slashing
#_079E88: REP #$30

#_079E8A: LDA.b $2F
#_079E8C: AND.w #$00FF
#_079E8F: TAX

#_079E90: LDA.l LinkOAM_AnimationDirectionalStepIndexOffset,X
#_079E94: STA.b $04

#_079E96: TYA
#_079E97: AND.w #$00FF
#_079E9A: ASL A
#_079E9B: CLC
#_079E9C: ADC.b $04
#_079E9E: TAX

#_079E9F: LDA.l LinkOAM_AnimationStepDataOffsets,X
#_079EA3: CLC
#_079EA4: ADC.b $02
#_079EA6: TAX

#_079EA7: SEP #$20

#_079EA9: LDA.l AttackHitboxOffset_Y,X
#_079EAD: STA.b $44

#_079EAF: LDA.l AttackHitboxOffset_X,X
#_079EB3: STA.b $45

#_079EB5: SEP #$10

#_079EB7: RTS

;---------------------------------------------------------------------------------------------------

.not_fighter_sword
#_079EB8: LDA.b $3C
#_079EBA: CMP.b #$09
#_079EBC: BCS .set_sword_hitbox_offsets

#_079EBE: ASL A
#_079EBF: STA.b $04

#_079EC1: LDA.b $2F
#_079EC3: LSR A
#_079EC4: STA.b $0E

#_079EC6: ASL A
#_079EC7: ASL A
#_079EC8: ASL A

#_079EC9: CLC
#_079ECA: ADC.b $0E

#_079ECC: ASL A
#_079ECD: CLC
#_079ECE: ADC.b $04
#_079ED0: TAX

#_079ED1: LDA.l LinkOAM_SwordSwingTipTile,X
#_079ED5: CMP.b #$FF
#_079ED7: BEQ .no_hitbox

#_079ED9: TXA
#_079EDA: LSR A
#_079EDB: TAX

#_079EDC: LDA.l LinkOAM_SwordSwingTipOffsetY,X
#_079EE0: STA.b $44

#_079EE2: LDA.l LinkOAM_SwordSwingTipOffsetX,X
#_079EE6: STA.b $45

;---------------------------------------------------------------------------------------------------

#EXIT_079EE8:
#_079EE8: RTS

;---------------------------------------------------------------------------------------------------

.no_hitbox
#_079EE9: BRL .set_sword_hitbox_offsets

;===================================================================================================

RodAndCaneAnimationTimer:
#_079EEC: db $03, $03, $05

;===================================================================================================

LinkItem_Rod:
#_079EEF: BIT.b $3A
#_079EF1: BVS .holding_y

#_079EF3: LDA.b $6C
#_079EF5: BNE EXIT_079EE8

#_079EF7: JSR CheckYButtonPress
#_079EFA: BCC EXIT_079EE8

#_079EFC: LDX.b #$00
#_079EFE: JSR LinkCheckMagicCost
#_079F01: BCC .lacking_magic

#_079F03: LDA.w $020B
#_079F06: BNE .lacking_magic

#_079F08: LDA.b #$01
#_079F0A: STA.w $0350

#_079F0D: JSR RodItem_CreateShot

#_079F10: LDA.w RodAndCaneAnimationTimer
#_079F13: STA.b $3D

#_079F15: STZ.b $2E

#_079F17: STZ.w $0300
#_079F1A: STZ.w $0301

#_079F1D: LDA.b #$01
#_079F1F: TSB.w $0301

;---------------------------------------------------------------------------------------------------

.holding_y
#_079F22: JSR HaltLinkWhenUsingItems

#_079F25: LDA.b $67
#_079F27: AND.b #$F0
#_079F29: STA.b $67

#_079F2B: DEC.b $3D
#_079F2D: BPL EXIT_079F58

#_079F2F: LDA.w $0300
#_079F32: INC A
#_079F33: STA.w $0300

#_079F36: TAX

#_079F37: LDA.w RodAndCaneAnimationTimer,X
#_079F3A: STA.b $3D

#_079F3C: CPX.b #$03
#_079F3E: BNE EXIT_079F58

#_079F40: STZ.b $5E
#_079F42: STZ.w $0300
#_079F45: STZ.b $3D
#_079F47: STZ.w $0350

#_079F4A: LDA.w $0301
#_079F4D: AND.b #$FE
#_079F4F: STA.w $0301

;---------------------------------------------------------------------------------------------------

.lacking_magic
#_079F52: LDA.b $3A
#_079F54: AND.b #$BF
#_079F56: STA.b $3A

;---------------------------------------------------------------------------------------------------

#EXIT_079F58:
#_079F58: RTS

;===================================================================================================

pool RodItem_CreateShot

.vectors
#_079F59: dw RodItem_CreateFireShot
#_079F5B: dw RodItem_CreateIceShot

pool off

;---------------------------------------------------------------------------------------------------

RodItem_CreateShot:
#_079F5D: LDA.w $0307
#_079F60: DEC A
#_079F61: ASL A
#_079F62: TAX

#_079F63: JMP.w (.vectors,X)

;===================================================================================================

RodItem_CreateIceShot:
#_079F66: LDA.b #$0B ; ANCILLA 0B
#_079F68: LDY.b #$01
#_079F6A: JSL AncillaAdd_IceRodShot

#_079F6E: RTS

;===================================================================================================

RodItem_CreateFireShot:
#_079F6F: LDA.b #$02 ; ANCILLA 02
#_079F71: LDY.b #$01
#_079F73: JSL AncillaAdd_FireRodShot

#_079F77: RTS

;===================================================================================================

pool LinkItem_Hammer

.timers
#_079F78: db  3,  3, 16

pool off

;---------------------------------------------------------------------------------------------------

LinkItem_Hammer:
#_079F7B: LDA.w $0301
#_079F7E: AND.b #$10
#_079F80: BNE .bounce_to_exit

#_079F82: BIT.b $3A
#_079F84: BVS .holding_y

#_079F86: LDA.b $6C
#_079F88: BNE .bounce_to_exit

#_079F8A: JSR CheckYButtonPress_unfiltered
#_079F8D: BCS .pressed_y

.bounce_to_exit
#_079F8F: BRL EXIT_079F58

;---------------------------------------------------------------------------------------------------

.pressed_y
#_079F92: LDA.w LinkItem_Hammer_timers
#_079F95: STA.b $3D

#_079F97: LDA.b #$01
#_079F99: TSB.b $50

#_079F9B: STZ.b $2E

#_079F9D: LDA.w $0301
#_079FA0: AND.b #$00
#_079FA2: ORA.b #$02
#_079FA4: STA.w $0301

#_079FA7: STZ.w $0300

.holding_y
#_079FAA: JSR HaltLinkWhenUsingItems

#_079FAD: LDA.b $67
#_079FAF: AND.b #$F0
#_079FB1: STA.b $67

#_079FB3: DEC.b $3D
#_079FB5: BPL EXIT_07A002

#_079FB7: LDA.w $0300
#_079FBA: INC A
#_079FBB: STA.w $0300

#_079FBE: TAX

#_079FBF: LDA.w LinkItem_Hammer_timers,X
#_079FC2: STA.b $3D

#_079FC4: CPX.b #$01
#_079FC6: BNE .no_impact_yet

;---------------------------------------------------------------------------------------------------

#_079FC8: PHX

#_079FC9: LDY.b #$03
#_079FCB: JSR TileDetect_MainHandler

#_079FCE: LDY.b #$00
#_079FD0: LDA.b #$16 ; ANCILLA 16
#_079FD2: JSL Ancilla_AddHitStars

#_079FD6: PLX

#_079FD7: LDA.w $012E
#_079FDA: BNE .no_impact_yet

#_079FDC: LDA.b #$10 ; SFX2.10
#_079FDE: JSR PlaySFX_Set2

#_079FE1: JSL SpawnHammerWaterSplash

;---------------------------------------------------------------------------------------------------

.no_impact_yet
#_079FE5: CPX.b #$03
#_079FE7: BNE EXIT_07A002

#_079FE9: STZ.w $0300
#_079FEC: STZ.b $3D

#_079FEE: LDA.b $3A
#_079FF0: AND.b #$BF
#_079FF2: STA.b $3A

#_079FF4: LDA.b $50
#_079FF6: AND.b #$FE
#_079FF8: STA.b $50

#_079FFA: LDA.w $0301
#_079FFD: AND.b #$FD
#_079FFF: STA.w $0301

;---------------------------------------------------------------------------------------------------

#EXIT_07A002:
#_07A002: RTS

;===================================================================================================

pool LinkItem_Bow

.timer
#_07A003: db $03, $03, $08

pool off

;---------------------------------------------------------------------------------------------------

LinkItem_Bow:
#_07A006: BIT.b $3A
#_07A008: BVS .holding_y

#_07A00A: LDA.b $6C
#_07A00C: BNE EXIT_07A002

#_07A00E: JSR CheckYButtonPress
#_07A011: BCC EXIT_07A002

#_07A013: LDA.b #$01
#_07A015: TSB.b $50

#_07A017: LDA.w LinkItem_Bow_timer
#_07A01A: STA.b $3D

#_07A01C: STZ.b $2E
#_07A01E: STZ.w $0300

#_07A021: LDA.w $0301
#_07A024: AND.b #$00
#_07A026: ORA.b #$10
#_07A028: STA.w $0301

;---------------------------------------------------------------------------------------------------

.holding_y
#_07A02B: JSR HaltLinkWhenUsingItems

#_07A02E: LDA.b $67
#_07A030: AND.b #$F0
#_07A032: STA.b $67

#_07A034: DEC.b $3D
#_07A036: BPL EXIT_07A002

;---------------------------------------------------------------------------------------------------

#_07A038: LDA.w $0300
#_07A03B: INC A
#_07A03C: STA.w $0300

#_07A03F: TAX

#_07A040: LDA.w LinkItem_Bow_timer,X
#_07A043: STA.b $3D

#_07A045: CPX.b #$03
#_07A047: BNE EXIT_07A0BA

#_07A049: LDA.b $20
#_07A04B: STA.b $72

#_07A04D: LDA.b $21
#_07A04F: STA.b $73

#_07A051: LDA.b $22
#_07A053: STA.b $74

#_07A055: LDA.b $23
#_07A057: STA.b $75

#_07A059: LDX.b $2F

#_07A05B: LDY.b #$02
#_07A05D: LDA.b #$09 ; ANCILLA 09
#_07A05F: JSL AncillaAdd_Arrow
#_07A063: BCC .arrow_handled

;---------------------------------------------------------------------------------------------------

#_07A065: LDA.w $0B99
#_07A068: BEQ .not_using_credits

#_07A06A: DEC.w $0B99

#_07A06D: LDA.l $7EF377
#_07A071: INC A
#_07A072: INC A
#_07A073: STA.l $7EF377

.not_using_credits
#_07A077: LDA.w $0B9A
#_07A07A: BNE .delete_arrow

#_07A07C: LDA.l $7EF377
#_07A080: BEQ .delete_arrow

#_07A082: DEC A
#_07A083: STA.l $7EF377
#_07A087: BNE .arrow_handled

#_07A089: JSL RefreshIcon_long

#_07A08D: BRA .arrow_handled

;---------------------------------------------------------------------------------------------------

.delete_arrow
#_07A08F: STZ.w $0C4A,X

#_07A092: LDA.b #$3C ; SFX2.3C
#_07A094: JSR PlaySFX_Set2

;---------------------------------------------------------------------------------------------------

.arrow_handled
#_07A097: STZ.w $0300
#_07A09A: STZ.b $3D

#_07A09C: LDA.b $3A
#_07A09E: AND.b #$BF
#_07A0A0: STA.b $3A

#_07A0A2: LDA.b $50
#_07A0A4: AND.b #$FE
#_07A0A6: STA.b $50

#_07A0A8: LDA.w $0301
#_07A0AB: AND.b #$EF
#_07A0AD: STA.w $0301

#_07A0B0: LDA.b $3C
#_07A0B2: CMP.b #$09
#_07A0B4: BCC EXIT_07A0BA

#_07A0B6: LDA.b #$09
#_07A0B8: STA.b $3C

;---------------------------------------------------------------------------------------------------

#EXIT_07A0BA:
#_07A0BA: RTS

;===================================================================================================

LinkItem_Boomerang:
#_07A0BB: BIT.b $3A
#_07A0BD: BVS .holding_y

#_07A0BF: LDA.b $6C
#_07A0C1: BNE EXIT_07A0BA

#_07A0C3: JSR CheckYButtonPress
#_07A0C6: BCC .exit

#_07A0C8: LDA.w $035F
#_07A0CB: BNE .exit

#_07A0CD: STZ.b $2E

#_07A0CF: LDA.w $0301
#_07A0D2: AND.b #$00
#_07A0D4: ORA.b #$80
#_07A0D6: STA.w $0301

#_07A0D9: STZ.w $0300

#_07A0DC: LDA.b #$07
#_07A0DE: STA.b $3D

#_07A0E0: LDY.b #$00
#_07A0E2: LDA.b #$05 ; ANCILLA 05
#_07A0E4: JSL AncillaAdd_Boomerang

#_07A0E8: LDA.b $3C
#_07A0EA: CMP.b #$09
#_07A0EC: BCS Link_ResetBoomerangYStuff

#_07A0EE: LDA.b $72
#_07A0F0: BNE .holding_y

#_07A0F2: LDA.b $F0
#_07A0F4: AND.b #$0F
#_07A0F6: STA.b $26

#_07A0F8: BRA .continue

;---------------------------------------------------------------------------------------------------

.holding_y
#_07A0FA: LDA.b #$01
#_07A0FC: TSB.b $50

.continue
#_07A0FE: LDA.w $0301
#_07A101: BEQ Link_ResetBoomerangYStuff

#_07A103: JSR HaltLinkWhenUsingItems

#_07A106: LDA.b $67
#_07A108: AND.b #$F0
#_07A10A: STA.b $67

#_07A10C: DEC.b $3D
#_07A10E: BPL .exit

#_07A110: LDA.b #$05
#_07A112: STA.b $3D

#_07A114: LDA.w $0300
#_07A117: INC A
#_07A118: STA.w $0300

#_07A11B: CMP.b #$02
#_07A11D: BNE .exit

;===================================================================================================

#Link_ResetBoomerangYStuff:
#_07A11F: STZ.w $0301
#_07A122: STZ.w $0300

#_07A125: STZ.b $3D

#_07A127: LDA.b $3A
#_07A129: AND.b #$BF
#_07A12B: STA.b $3A

#_07A12D: AND.b #$80
#_07A12F: BNE .exit

#_07A131: LDA.b $50
#_07A133: AND.b #$FE
#_07A135: STA.b $50

.exit
#_07A137: RTS

;===================================================================================================

LinkItem_Bombs:
#_07A138: LDA.b $6C
#_07A13A: BNE EXIT_07A15A

#_07A13C: LDA.l $7EF3CC
#_07A140: CMP.b #$0D ; FOLLOWER 0D
#_07A142: BEQ EXIT_07A15A

#_07A144: JSR CheckYButtonPress
#_07A147: BCC EXIT_07A15A

#_07A149: LDA.b $3A
#_07A14B: AND.b #$BF
#_07A14D: STA.b $3A

#_07A14F: LDY.b #$01
#_07A151: LDA.b #$07 ; ANCILLA 07
#_07A153: JSL AncillaAdd_Bomb

#_07A157: STZ.w $0301

;---------------------------------------------------------------------------------------------------

#EXIT_07A15A:
#_07A15A: RTS

;===================================================================================================

LinkItem_Bottle:
#_07A15B: JSR CheckYButtonPress
#_07A15E: BCC EXIT_07A15A

#_07A160: LDA.b $3A
#_07A162: AND.b #$BF
#_07A164: STA.b $3A

#_07A166: LDA.l $7EF34F
#_07A16A: DEC A
#_07A16B: TAX

#_07A16C: LDA.l $7EF35C,X
#_07A170: BEQ EXIT_07A15A

#_07A172: CMP.b #$03
#_07A174: BCC LinkItem_UselessBottle

#_07A176: CMP.b #$03
#_07A178: BEQ LinkItem_RedPotion

#_07A17A: CMP.b #$04
#_07A17C: BEQ LinkItem_GreenPotion

#_07A17E: CMP.b #$05
#_07A180: BEQ LinkItem_BluePotion

#_07A182: CMP.b #$06
#_07A184: BEQ .fairy

#_07A186: BRL LinkItem_BeeBottle

.fairy
#_07A189: BRL LinkItem_FairyBottle

;===================================================================================================

LinkItem_RedPotion:
#_07A18C: LDA.l $7EF36C
#_07A190: CMP.l $7EF36D
#_07A194: BNE .can_drink

;===================================================================================================

#LinkItem_UselessBottle:
#_07A196: BRL LinkGoBeep

;===================================================================================================

.can_drink
#_07A199: LDA.b #$02
#_07A19B: STA.l $7EF35C,X

#_07A19F: STZ.w $0301

#_07A1A2: LDA.b #$04
#_07A1A4: STA.b $11

#_07A1A6: LDA.b $10
#_07A1A8: STA.w $010C

#_07A1AB: LDA.b #$0E
#_07A1AD: STA.b $10

#_07A1AF: LDA.b #$07
#_07A1B1: STA.w $0208

#_07A1B4: JSL RebuildHUD_long

#_07A1B8: RTS

;===================================================================================================

LinkItem_GreenPotion:
#_07A1B9: LDA.l $7EF36E
#_07A1BD: CMP.b #$80
#_07A1BF: BNE .can_drink

#_07A1C1: BRL LinkGoBeep

.can_drink
#_07A1C4: LDA.b #$02
#_07A1C6: STA.l $7EF35C,X

#_07A1CA: STZ.w $0301

#_07A1CD: LDA.b #$08
#_07A1CF: STA.b $11

#_07A1D1: LDA.b $10
#_07A1D3: STA.w $010C

#_07A1D6: LDA.b #$0E
#_07A1D8: STA.b $10

#_07A1DA: LDA.b #$07
#_07A1DC: STA.w $0208

#_07A1DF: JSL RebuildHUD_long

#_07A1E3: BRA EXIT_07A239

;===================================================================================================

LinkItem_BluePotion:
#_07A1E5: LDA.l $7EF36C
#_07A1E9: CMP.l $7EF36D
#_07A1ED: BNE .can_drink

#_07A1EF: LDA.l $7EF36E
#_07A1F3: CMP.b #$80
#_07A1F5: BNE .can_drink

#_07A1F7: BRL LinkGoBeep

.can_drink
#_07A1FA: LDA.b #$02
#_07A1FC: STA.l $7EF35C,X

#_07A200: STZ.w $0301

#_07A203: LDA.b #$09
#_07A205: STA.b $11

#_07A207: LDA.b $10
#_07A209: STA.w $010C

#_07A20C: LDA.b #$0E
#_07A20E: STA.b $10

#_07A210: LDA.b #$07
#_07A212: STA.w $0208

#_07A215: JSL RebuildHUD_long

#_07A219: BRA EXIT_07A239

;===================================================================================================

LinkItem_FairyBottle:
#_07A21B: STZ.w $0301

#_07A21E: JSL ReleaseFairy
#_07A222: BPL .released

#_07A224: BRL LinkGoBeep

.released
#_07A227: LDA.b #$02
#_07A229: STA.l $7EF35C,X

#_07A22D: JSL RebuildHUD_long

#_07A231: BRA EXIT_07A239

;===================================================================================================

LinkItem_BeeBottle:
#_07A233: STZ.w $0301

#_07A236: JSL ReleaseBeeFromBottle
#_07A23A: BPL .released

#_07A23C: BRL LinkGoBeep

.released
#_07A23F: LDA.b #$02
#_07A241: STA.l $7EF35C,X

#_07A245: JSL RebuildHUD_long

;---------------------------------------------------------------------------------------------------

#EXIT_07A239:
#_07A249: RTS

;===================================================================================================

UNREACHABLE_07A24A:
#_07A24A: CLC
#_07A24B: BPL LinkItem_Lamp

;===================================================================================================

LinkItem_Lamp:
#_07A24D: LDA.b $6C
#_07A24F: BNE EXIT_07A288

#_07A251: JSR CheckYButtonPress
#_07A254: BCC EXIT_07A288

#_07A256: LDA.l $7EF34A
#_07A25A: BEQ .no_magic

#_07A25C: LDX.b #$06
#_07A25E: JSR LinkCheckMagicCost
#_07A261: BCC .no_magic

#_07A263: LDY.b #$00
#_07A265: LDA.b #$1A ; ANCILLA 1A
#_07A267: JSL AncillaAdd_MagicPowder

#_07A26B: JSL Underworld_LightTorch

#_07A26F: LDY.b #$02
#_07A271: LDA.b #$2F ; ANCILLA 2F
#_07A273: JSL AncillaAdd_LampFlame

.no_magic
#_07A277: STZ.w $0301
#_07A27A: STZ.b $3A
#_07A27C: STZ.b $3C
#_07A27E: STZ.b $50

#_07A280: LDA.b $3C
#_07A282: CMP.b #$09
#_07A284: BNE EXIT_07A288

#_07A286: STZ.b $5E

;---------------------------------------------------------------------------------------------------

#EXIT_07A288:
#_07A288: RTS

;===================================================================================================

pool LinkItem_Powder

.timer
#_07A289: db $02, $01, $01, $03
#_07A28D: db $02, $02, $02, $02
#_07A291: db $06, $00

pool off

;---------------------------------------------------------------------------------------------------

LinkItem_Powder:
#_07A293: BIT.b $3A
#_07A295: BVS .in_use

#_07A297: LDA.b $6C
#_07A299: BNE EXIT_07A288

#_07A29B: JSR CheckYButtonPress
#_07A29E: BCC EXIT_07A312

#_07A2A0: LDA.l $7EF344
#_07A2A4: CMP.b #$02
#_07A2A6: BEQ .is_powder

#_07A2A8: LDA.b #$3C ; SFX2.3C
#_07A2AA: JSR PlaySFX_Set2

#_07A2AD: BRA .no_tile_detect

;---------------------------------------------------------------------------------------------------

.is_powder
#_07A2AF: LDX.b #$02
#_07A2B1: JSR LinkCheckMagicCost
#_07A2B4: BCC .no_tile_detect

#_07A2B6: LDA.w LinkItem_Powder_timer
#_07A2B9: STA.b $3D

#_07A2BB: STZ.w $0300
#_07A2BE: STZ.b $2E

#_07A2C0: LDA.b $67
#_07A2C2: AND.b #$F0
#_07A2C4: STA.b $67

#_07A2C6: STZ.w $0301

#_07A2C9: LDA.b #$40
#_07A2CB: TSB.w $0301

;---------------------------------------------------------------------------------------------------

.in_use
#_07A2CE: STZ.b $30
#_07A2D0: STZ.b $31

#_07A2D2: STZ.b $67

#_07A2D4: STZ.b $2A
#_07A2D6: STZ.b $2B

#_07A2D8: STZ.b $6B

#_07A2DA: DEC.b $3D
#_07A2DC: BPL EXIT_07A312

#_07A2DE: LDA.w $0300
#_07A2E1: INC A
#_07A2E2: STA.w $0300

#_07A2E5: TAX
#_07A2E6: LDA.w LinkItem_Powder_timer,X
#_07A2E9: STA.b $3D

#_07A2EB: CPX.b #$04
#_07A2ED: BNE .dont_make_powder

#_07A2EF: LDY.b #$00
#_07A2F1: LDA.b #$1A ; ANCILLA 1A
#_07A2F3: JSL AncillaAdd_MagicPowder

.dont_make_powder
#_07A2F7: CPX.b #$09
#_07A2F9: BNE EXIT_07A312

#_07A2FB: LDA.b $11
#_07A2FD: BNE .no_tile_detect

#_07A2FF: LDY.b #$01
#_07A301: JSR TileDetect_MainHandler
#_07A304: BRA .no_tile_detect

.no_tile_detect
#_07A306: STZ.w $0301
#_07A309: STZ.w $0300

#_07A30C: LDA.b $3A
#_07A30E: AND.b #$BF
#_07A310: STA.b $3A

;---------------------------------------------------------------------------------------------------

#EXIT_07A312:
#_07A312: RTS

;===================================================================================================

LinkItem_ShovelAndFlute:
#_07A313: LDA.l $7EF34C
#_07A317: BEQ EXIT_07A312

#_07A319: CMP.b #$01
#_07A31B: BEQ LinkItem_Shovel

#_07A31D: BRL LinkItem_Flute

;===================================================================================================

pool LinkItem_Shovel

.timer
#_07A320: db   7,  18,  16
#_07A323: db   7,  18,  16

.pose
#_07A326: db $00, $01, $02
#_07A329: db $00, $01, $02

pool off

;---------------------------------------------------------------------------------------------------

LinkItem_Shovel:
#_07A32C: BIT.b $3A
#_07A32E: BVS .in_use

#_07A330: LDA.b $6C
#_07A332: BNE EXIT_07A312

#_07A334: JSR CheckYButtonPress
#_07A337: BCC EXIT_07A312

#_07A339: LDA.w .timer
#_07A33C: STA.b $3D

#_07A33E: STZ.w $030D
#_07A341: STZ.w $0300

#_07A344: LDA.b #$01
#_07A346: STA.w $037A

#_07A349: LDA.b #$01
#_07A34B: TSB.b $50

#_07A34D: STZ.b $2E

;===================================================================================================

.in_use
#_07A34F: JSR HaltLinkWhenUsingItems

#_07A352: LDA.b $67
#_07A354: AND.b #$F0
#_07A356: STA.b $67

#_07A358: DEC.b $3D
#_07A35A: BMI .continue

#_07A35C: RTS

;---------------------------------------------------------------------------------------------------

.continue
#_07A35D: LDX.w $030D
#_07A360: INX
#_07A361: STX.w $030D

#_07A364: LDA.w .timer,X
#_07A367: STA.b $3D

#_07A369: LDA.w .pose,X
#_07A36C: STA.w $0300

#_07A36F: CMP.b #$01
#_07A371: BNE .finish_up

;---------------------------------------------------------------------------------------------------

#_07A373: LDY.b #$02

#_07A375: PHX

#_07A376: JSR TileDetect_MainHandler

#_07A379: PLX

#_07A37A: LDA.w $04B2
#_07A37D: BEQ .not_flute_spot

#_07A37F: LDA.b #$1B ; SFX3.1B
#_07A381: JSR PlaySFX_Set3

#_07A384: PHX

#_07A385: LDY.b #$00
#_07A387: LDA.b #$36 ; ANCILLA 36
#_07A389: JSL AncillaAdd_DugUpFlute

#_07A38D: PLX

;---------------------------------------------------------------------------------------------------

.not_flute_spot
#_07A38E: LDA.w $0357
#_07A391: ORA.w $035B
#_07A394: AND.b #$01
#_07A396: BNE .dont_clink

#_07A398: PHX

#_07A399: LDY.b #$00
#_07A39B: LDA.b #$16 ; ANCILLA 16
#_07A39D: JSL Ancilla_AddHitStars

#_07A3A1: PLX

#_07A3A2: LDA.b #$05 ; SFX2.05
#_07A3A4: JSR PlaySFX_Set2

#_07A3A7: BRA .finish_up

;---------------------------------------------------------------------------------------------------

.dont_clink
#_07A3A9: PHX

#_07A3AA: LDY.b #$00
#_07A3AC: LDA.b #$17 ; ANCILLA 17
#_07A3AE: JSL AncillaAdd_ShovelDirt

#_07A3B2: LDA.w $03FC
#_07A3B5: BEQ .not_dig_game

#_07A3B7: JSL DigGame_SpawnPrize

.not_dig_game
#_07A3BB: PLX

#_07A3BC: LDA.b #$12 ; SFX2.12
#_07A3BE: JSR PlaySFX_Set2

;---------------------------------------------------------------------------------------------------

.finish_up
#_07A3C1: CPX.b #$03
#_07A3C3: BNE EXIT_07A3DA

#_07A3C5: STZ.w $030D
#_07A3C8: STZ.w $0300

#_07A3CB: LDA.b $3A
#_07A3CD: AND.b #$80
#_07A3CF: STA.b $3A

#_07A3D1: STZ.w $037A

#_07A3D4: LDA.b $50
#_07A3D6: AND.b #$FE
#_07A3D8: STA.b $50

;---------------------------------------------------------------------------------------------------

#EXIT_07A3DA:
#_07A3DA: RTS

;===================================================================================================

LinkItem_Flute:
#_07A3DB: BIT.b $3A
#_07A3DD: BVC .can_use

#_07A3DF: DEC.w $03F0

#_07A3E2: LDA.w $03F0
#_07A3E5: BNE EXIT_07A3DA

#_07A3E7: LDA.b $3A
#_07A3E9: AND.b #$BF
#_07A3EB: STA.b $3A

;---------------------------------------------------------------------------------------------------

.can_use
#_07A3ED: JSR CheckYButtonPress
#_07A3F0: BCC EXIT_07A3DA

#_07A3F2: LDA.b #$80
#_07A3F4: STA.w $03F0

#_07A3F7: LDA.b #$13 ; SFX2.13
#_07A3F9: JSR PlaySFX_Set2

#_07A3FC: LDA.b $1B
#_07A3FE: BNE EXIT_07A3DA

#_07A400: LDA.b $8A
#_07A402: AND.b #$40
#_07A404: BNE EXIT_07A3DA

#_07A406: LDA.b $10
#_07A408: CMP.b #$0B
#_07A40A: BEQ EXIT_07A3DA

;---------------------------------------------------------------------------------------------------

#_07A40C: LDX.b #$04

.look_for_duck
#_07A40E: LDA.w $0C4A,X
#_07A411: CMP.b #$27 ; ANCILLA 27
#_07A413: BEQ EXIT_07A3DA

#_07A415: DEX
#_07A416: BPL .look_for_duck

#_07A418: LDA.l $7EF34C
#_07A41C: CMP.b #$02
#_07A41E: BNE .have_activated_flute

;---------------------------------------------------------------------------------------------------

#_07A420: REP #$20

#_07A422: LDA.b $8A
#_07A424: CMP.w #$0018 ; OW 18
#_07A427: BNE .dont_blow_up_weathervane

#_07A429: LDA.b $20
#_07A42B: CMP.w #$0760
#_07A42E: BCC .dont_blow_up_weathervane

#_07A430: CMP.w #$07E0
#_07A433: BCS .dont_blow_up_weathervane

#_07A435: LDA.b $22
#_07A437: CMP.w #$01CF
#_07A43A: BCC .dont_blow_up_weathervane

#_07A43C: CMP.w #$0230
#_07A43F: BCS .dont_blow_up_weathervane

#_07A441: SEP #$20

#_07A443: LDA.b #$2D
#_07A445: STA.b $11

#_07A447: LDY.b #$00
#_07A449: LDA.b #$37 ; ANCILLA 37
#_07A44B: JSL AncillaAdd_ExplodingWeatherVane

.dont_blow_up_weathervane
#_07A44F: SEP #$20

#_07A451: BRA EXIT_07A45E

;---------------------------------------------------------------------------------------------------

.have_activated_flute
#_07A453: LDY.b #$04
#_07A455: LDA.b #$27 ; ANCILLA 27
#_07A457: JSL AncillaAdd_Duck_take_off

#_07A45B: STZ.w $03F8

;---------------------------------------------------------------------------------------------------

#EXIT_07A45E:
#_07A45E: RTS

;===================================================================================================

CallForDuckIndoors:
#_07A45F: PHB
#_07A460: PHK
#_07A461: PLB

#_07A462: LDA.b #$13 ; SFX2.13
#_07A464: JSR PlaySFX_Set2

#_07A467: LDY.b #$04
#_07A469: LDA.b #$27 ; ANCILLA 27
#_07A46B: JSL AncillaAdd_Duck_take_off

#_07A46F: PLB

#_07A470: RTL

;===================================================================================================

LinkItem_Book:
#_07A471: BIT.b $3A
#_07A473: BVS .exit

#_07A475: LDA.b $6C
#_07A477: BNE EXIT_07A45E

#_07A479: JSR CheckYButtonPress
#_07A47C: BCC .exit

#_07A47E: LDA.b $3A
#_07A480: AND.b #$BF
#_07A482: STA.b $3A

#_07A484: LDA.w $02ED
#_07A487: BNE .do_prayer

#_07A489: LDA.b #$3C ; SFX2.3C
#_07A48B: JSR PlaySFX_Set2

#_07A48E: BRA .exit

;---------------------------------------------------------------------------------------------------

.do_prayer
#_07A490: BRL Link_PerformDesertPrayer

.exit
#_07A493: RTS

;===================================================================================================

LinkItem_Ether:
#_07A494: JSR CheckYButtonPress
#_07A497: BCC .exit

#_07A499: LDA.b $3A
#_07A49B: AND.b #$BF
#_07A49D: STA.b $3A

#_07A49F: LDA.b $6C
#_07A4A1: BNE .cannot_ether

#_07A4A3: LDA.w $0FFC
#_07A4A6: BNE .cannot_ether

#_07A4A8: LDA.w $0403
#_07A4AB: AND.b #$80
#_07A4AD: BNE .cannot_ether

#_07A4AF: LDA.l $7EF359
#_07A4B3: INC A
#_07A4B4: AND.b #$FE
#_07A4B6: BEQ .cannot_ether

#_07A4B8: LDA.l $7EF3D3
#_07A4BC: BEQ .allow_ether

#_07A4BE: LDA.l $7EF3CC
#_07A4C2: CMP.b #$0D ; FOLLOWER 0D
#_07A4C4: BNE .allow_ether

.cannot_ether
#_07A4C6: BRL LinkGoBeep

;---------------------------------------------------------------------------------------------------

.allow_ether
#_07A4C9: LDA.w $0C4A
#_07A4CC: ORA.w $0C4B
#_07A4CF: ORA.w $0C4C
#_07A4D2: BNE .exit

#_07A4D4: LDX.b #$01
#_07A4D6: JSR LinkCheckMagicCost
#_07A4D9: BCC .exit

#_07A4DB: LDA.b #$08 ; LINKSTATE 08
#_07A4DD: STA.b $5D

#_07A4DF: LDA.b #$01
#_07A4E1: TSB.b $50

#_07A4E3: LDA.w .anim_timer
#_07A4E6: STA.b $3D

#_07A4E8: STZ.w $031C
#_07A4EB: STZ.w $031D
#_07A4EE: STZ.w $0324

#_07A4F1: LDA.b #$23 ; SFX3.23
#_07A4F3: JSR PlaySFX_Set3

.exit
#_07A4F6: RTS

;===================================================================================================

pool LinkItem_Ether LinkState_UsingEther

.anim_step
#_07A4F7: db $00, $01, $02, $03
#_07A4FB: db $00, $01, $02, $03
#_07A4FF: db $04, $05, $06, $07

.anim_timer
#_07A503: db   5,   5,   5,   5
#_07A507: db   5,   5,   5,   5
#_07A50B: db   7,   7,   3,   3

pool off

;---------------------------------------------------------------------------------------------------

LinkState_UsingEther:
#_07A50F: INC.w $0FC1

#_07A512: DEC.b $3D
#_07A514: BPL .exit

#_07A516: INC.w $031D

#_07A519: LDX.w $031D

#_07A51C: CPX.b #$0B
#_07A51E: BNE .not_last_step

#_07A520: LDX.b #$0B
#_07A522: BRA .continue

;---------------------------------------------------------------------------------------------------

.not_last_step
#_07A524: CPX.b #$04
#_07A526: BNE .skip_swish_sfx

#_07A528: PHX

#_07A529: LDA.b #$23 ; SFX3.23
#_07A52B: JSR PlaySFX_Set3

#_07A52E: PLX

.skip_swish_sfx
#_07A52F: CPX.b #$09
#_07A531: BNE .skip_ding_sfx

#_07A533: LDA.b #$2C ; SFX2.2C
#_07A535: JSR PlaySFX_Set2

.skip_ding_sfx
#_07A538: CPX.b #$0C
#_07A53A: BNE .continue

#_07A53C: LDA.b #$0A
#_07A53E: STA.w $031D

#_07A541: TAX

;---------------------------------------------------------------------------------------------------

.continue
#_07A542: LDA.w .anim_timer,X
#_07A545: STA.b $3D

#_07A547: LDA.w .anim_step,X
#_07A54A: STA.w $031C

#_07A54D: LDA.w $0324
#_07A550: BNE .exit

#_07A552: CPX.b #$0A
#_07A554: BNE .exit

#_07A556: LDA.b #$01
#_07A558: STA.w $0324

#_07A55B: LDY.b #$00
#_07A55D: LDA.b #$18 ; ANCILLA 18
#_07A55F: JSL AncillaAdd_EtherSpell

#_07A563: STZ.b $4D
#_07A565: STZ.w $0046

.exit
#_07A568: RTS

;===================================================================================================

LinkItem_Bombos:
#_07A569: JSR CheckYButtonPress
#_07A56C: BCC .exit

#_07A56E: LDA.b $3A
#_07A570: AND.b #$BF
#_07A572: STA.b $3A

#_07A574: LDA.b $6C
#_07A576: BNE .cannot_bombos

#_07A578: LDA.w $0FFC
#_07A57B: BNE .cannot_bombos

#_07A57D: LDA.w $0403
#_07A580: AND.b #$80
#_07A582: BNE .cannot_bombos

#_07A584: LDA.l $7EF359
#_07A588: INC A
#_07A589: AND.b #$FE
#_07A58B: BEQ .cannot_bombos

#_07A58D: LDA.l $7EF3D3
#_07A591: BEQ .allow_bombos

#_07A593: LDA.l $7EF3CC
#_07A597: CMP.b #$0D ; FOLLOWER 0D
#_07A599: BNE .allow_bombos

.cannot_bombos
#_07A59B: BRL LinkGoBeep

;---------------------------------------------------------------------------------------------------

.allow_bombos
#_07A59E: LDA.w $0C4A
#_07A5A1: ORA.w $0C4B
#_07A5A4: ORA.w $0C4C
#_07A5A7: BNE .exit

#_07A5A9: LDX.b #$01
#_07A5AB: JSR LinkCheckMagicCost
#_07A5AE: BCC .exit

#_07A5B0: LDA.b #$09 ; LINKSTATE 09
#_07A5B2: STA.b $5D

#_07A5B4: LDA.b #$01
#_07A5B6: TSB.b $50

#_07A5B8: LDA.w .anim_timer
#_07A5BB: STA.b $3D

#_07A5BD: LDA.w .anim_step
#_07A5C0: STA.w $031C
#_07A5C3: STZ.w $031D

#_07A5C6: STZ.w $0324

#_07A5C9: LDA.b #$23 ; SFX3.23
#_07A5CB: JSR PlaySFX_Set3

.exit
#_07A5CE: RTS

;===================================================================================================

pool LinkItem_Bombos LinkState_UsingBombos

.anim_step
#_07A5CF: db $00, $01, $02, $03
#_07A5D3: db $00, $01, $02, $03
#_07A5D7: db $08, $09, $0A, $0B
#_07A5DB: db $0C, $0A, $08, $0D
#_07A5DF: db $0E, $0F, $10, $11

.anim_timer
#_07A5E3: db   5,   5,   5,   5
#_07A5E7: db   5,   5,   5,   5
#_07A5EB: db   3,   3,   3,   3
#_07A5EF: db   3,   7,   1,   1
#_07A5F3: db   1,   1,   1,  13

pool off

;---------------------------------------------------------------------------------------------------

LinkState_UsingBombos:
#_07A5F7: INC.w $0FC1

#_07A5FA: DEC.b $3D
#_07A5FC: BPL .exit

#_07A5FE: INC.w $031D

#_07A601: LDX.w $031D
#_07A604: CPX.b #$04
#_07A606: BNE .skip_swish_sfx

#_07A608: PHX

#_07A609: LDA.b #$23 ; SFX3.23
#_07A60B: JSR PlaySFX_Set3

#_07A60E: PLX

.skip_swish_sfx
#_07A60F: CPX.b #$0A
#_07A611: BNE .skip_ping_sfx

#_07A613: PHX

#_07A614: LDA.b #$2C ; SFX2.2C
#_07A616: JSR PlaySFX_Set2

#_07A619: PLX

;---------------------------------------------------------------------------------------------------

.skip_ping_sfx
#_07A61A: CPX.b #$14
#_07A61C: BNE .dont_reset_step

#_07A61E: LDA.b #$13
#_07A620: STA.w $031D

#_07A623: TAX

.dont_reset_step
#_07A624: LDA.w .anim_timer,X
#_07A627: STA.b $3D

#_07A629: LDA.w .anim_step,X
#_07A62C: STA.w $031C

#_07A62F: LDA.w $0324
#_07A632: BNE .exit

#_07A634: CPX.b #$13
#_07A636: BNE .exit

#_07A638: LDA.b #$01
#_07A63A: STA.w $0324

#_07A63D: LDY.b #$00
#_07A63F: LDA.b #$19 ; ANCILLA 19
#_07A641: JSL AncillaAdd_BombosSpell

#_07A645: STZ.b $4D
#_07A647: STZ.w $0046

.exit
#_07A64A: RTS

;===================================================================================================

LinkItem_Quake:
#_07A64B: JSR CheckYButtonPress
#_07A64E: BCC .exit

#_07A650: LDA.b $3A
#_07A652: AND.b #$BF
#_07A654: STA.b $3A

#_07A656: LDA.b $6C
#_07A658: BNE .cannot_quake

#_07A65A: LDA.w $0FFC
#_07A65D: BNE .cannot_quake

#_07A65F: LDA.w $0403
#_07A662: AND.b #$80
#_07A664: BNE .cannot_quake

#_07A666: LDA.l $7EF359
#_07A66A: INC A
#_07A66B: AND.b #$FE
#_07A66D: BEQ .cannot_quake

#_07A66F: LDA.l $7EF3D3
#_07A673: BEQ .allow_quake

#_07A675: LDA.l $7EF3CC
#_07A679: CMP.b #$0D ; FOLLOWER 0D
#_07A67B: BNE .allow_quake

.cannot_quake
#_07A67D: BRL LinkGoBeep

;---------------------------------------------------------------------------------------------------

.allow_quake
#_07A680: LDA.w $0C4A
#_07A683: ORA.w $0C4B
#_07A686: ORA.w $0C4C
#_07A689: BNE .exit

#_07A68B: LDX.b #$01
#_07A68D: JSR LinkCheckMagicCost
#_07A690: BCC .exit

#_07A692: LDA.b #$0A ; LINKSTATE 0A
#_07A694: STA.b $5D

#_07A696: LDA.b #$01
#_07A698: TSB.b $50

#_07A69A: LDA.w .anim_timer
#_07A69D: STA.b $3D

#_07A69F: LDA.w .anim_step
#_07A6A2: STA.w $031C
#_07A6A5: STZ.w $031D

#_07A6A8: STZ.w $0324

#_07A6AB: STZ.b $46

#_07A6AD: LDA.b #$28
#_07A6AF: STA.w $0362
#_07A6B2: STA.w $0363
#_07A6B5: STZ.w $0364

#_07A6B8: LDA.b #$23 ; SFX3.23
#_07A6BA: JSR PlaySFX_Set3

.exit
#_07A6BD: RTS

;===================================================================================================

pool LinkItem_Quake LinkState_UsingQuake

.anim_step
#_07A6BE: db $00, $01, $02, $03
#_07A6C2: db $00, $01, $02, $03
#_07A6C6: db $12, $13, $14, $16

.anim_timer
#_07A6CA: db   5,   5,   5,   5
#_07A6CE: db   5,   5,   5,   5
#_07A6D2: db   5,   5,   5,  19

pool off

;---------------------------------------------------------------------------------------------------

LinkState_UsingQuake:
#_07A6D6: INC.w $0FC1

#_07A6D9: STZ.b $27
#_07A6DB: STZ.b $28

#_07A6DD: LDA.w $031D
#_07A6E0: CMP.b #$0A
#_07A6E2: BNE .not_ascending

#_07A6E4: LDA.w $0362
#_07A6E7: STA.b $29

#_07A6E9: LDA.w $0363
#_07A6EC: STA.w $02C7

#_07A6EF: LDA.w $0364
#_07A6F2: STA.b $24

#_07A6F4: LDA.b #$02
#_07A6F6: STA.b $00
#_07A6F8: STA.b $4D

#_07A6FA: JSR Link_HandleChangeInZVelocity_preset
#_07A6FD: JSL LinkHop_FindArbitraryLandingSpot

#_07A701: LDA.b $29
#_07A703: STA.w $0362

#_07A706: LDA.w $02C7
#_07A709: STA.w $0363

#_07A70C: LDA.b $24
#_07A70E: STA.w $0364
#_07A711: BMI .still_ascending

;---------------------------------------------------------------------------------------------------

#_07A713: LDY.b #$14

#_07A715: LDA.b $29
#_07A717: BPL .done_ascending

#_07A719: LDY.b #$15

.done_ascending
#_07A71B: STY.w $031C

#_07A71E: BRA .exit

.not_ascending
#_07A720: DEC.b $3D
#_07A722: BPL .exit

;---------------------------------------------------------------------------------------------------

.still_ascending
#_07A724: INC.w $031D

#_07A727: LDX.w $031D
#_07A72A: CPX.b #$04
#_07A72C: BNE .skip_swish_sfx

#_07A72E: PHX

#_07A72F: LDA.b #$23 ; SFX3.23
#_07A731: JSR PlaySFX_Set3

#_07A734: PLX

.skip_swish_sfx
#_07A735: CPX.b #$0A
#_07A737: BNE .skip_ping_sfx

#_07A739: PHX

#_07A73A: LDA.b #$2C ; SFX2.2C
#_07A73C: JSR PlaySFX_Set2

#_07A73F: PLX

.skip_ping_sfx
#_07A740: CPX.b #$0B
#_07A742: BNE .skip_boom_sfx

#_07A744: LDA.b #$0C ; SFX2.0C
#_07A746: JSR PlaySFX_Set2

;---------------------------------------------------------------------------------------------------

.skip_boom_sfx
#_07A749: CPX.b #$0C
#_07A74B: BNE .dont_reset_step

#_07A74D: LDA.b #$0B
#_07A74F: STA.w $031D

#_07A752: TAX

.dont_reset_step
#_07A753: LDA.w .anim_timer,X
#_07A756: STA.b $3D

#_07A758: LDA.w .anim_step,X
#_07A75B: STA.w $031C

#_07A75E: LDA.w $0324
#_07A761: BNE .exit

#_07A763: CPX.b #$0B
#_07A765: BNE .exit

#_07A767: LDA.b #$01
#_07A769: STA.w $0324

#_07A76C: LDY.b #$00
#_07A76E: LDA.b #$1C ; ANCILLA 1C
#_07A770: JSL AncillaAdd_QuakeSpell

#_07A774: STZ.b $4D
#_07A776: STZ.w $0046

.exit
#_07A779: RTS

;===================================================================================================

Link_ActivateSpinAttack:
#_07A77A: LDY.b #$00
#_07A77C: TYX

#_07A77D: LDA.b #$2A ; ANCILLA 2A
#_07A77F: JSL AncillaAdd_SpinAttackInitSpark

;===================================================================================================

Link_AnimateVictorySpin:
#_07A783: LDA.b #$03 ; LINKSTATE 03
#_07A785: STA.b $5D

#_07A787: LDA.b $2F
#_07A789: LSR A
#_07A78A: TAX

#_07A78B: LDA.w SpinAttack_data_offset,X
#_07A78E: STA.w $031E

#_07A791: TAX
#_07A792: LDA.w SpinAttack_anim_timer_a
#_07A795: STA.b $3D

#_07A797: LDA.w SpinAttack_anim_step,X
#_07A79A: STA.w $031C
#_07A79D: STZ.w $031D

#_07A7A0: LDA.b #$90
#_07A7A2: STA.b $3C

#_07A7A4: LDA.b #$01
#_07A7A6: TSB.b $50

#_07A7A8: LDA.b #$80
#_07A7AA: STA.b $3A

#_07A7AC: BRL LinkState_SpinAttack

;===================================================================================================

UNREACHABLE_07A7AF:
#_07A7AF: RTS

;===================================================================================================

Link_AnimateVictorySpin_long:
#_07A7B0: PHB
#_07A7B1: PHK
#_07A7B2: PLB

#_07A7B3: JSR Link_AnimateVictorySpin

#_07A7B6: PLB

#_07A7B7: RTL

;===================================================================================================

pool SpinAttack

.anim_step
#_07A7B8: db $0A, $0B, $0A, $06, $07, $08, $09, $02, $03, $04, $05, $0A ; up
#_07A7C4: db $00, $01, $00, $02, $03, $04, $05, $06, $07, $08, $09, $00 ; down
#_07A7D0: db $0C, $0D, $0C, $04, $05, $06, $07, $08, $09, $02, $03, $0C ; left
#_07A7DC: db $0E, $0F, $0E, $08, $09, $02, $03, $04, $05, $06, $07, $0E ; right

.anim_timer_a
#_07A7E8: db $03, $09, $03 ; up
#_07A7EB: db $01, $01, $01 ; down
#_07A7EE: db $01, $01, $01 ; left
#_07A7F1: db $01, $01, $05 ; right

.anim_timer_b
#_07A7F4: db $01, $05, $01 ; up
#_07A7F7: db $01, $01, $01 ; down
#_07A7FA: db $01, $01, $01 ; left
#_07A7FD: db $01, $01, $05 ; right

.data_offset
#_07A800: db $00 ; up
#_07A801: db $0C ; down
#_07A802: db $18 ; left
#_07A803: db $24 ; right

pool off

;===================================================================================================

LinkState_SpinAttack:
#_07A804: JSR CacheCameraPropertiesIfOutdoors

#_07A807: LDA.b $4D
#_07A809: BEQ .not_recoiling

;---------------------------------------------------------------------------------------------------

#_07A80B: LDX.b #$04

.next_ancilla
#_07A80D: LDA.w $0C4A,X
#_07A810: CMP.b #$2A ; ANCILLA 2A
#_07A812: BEQ .delete_ancilla

#_07A814: CMP.b #$2B ; ANCILLA 2B
#_07A816: BNE .skip_ancilla

.delete_ancilla
#_07A818: STZ.w $0C4A,X

.skip_ancilla
#_07A81B: DEX
#_07A81C: BPL .next_ancilla

;---------------------------------------------------------------------------------------------------

#_07A81E: STZ.b $25

#_07A820: LDA.b $50
#_07A822: AND.b #$FE
#_07A824: STA.b $50

#_07A826: STZ.b $3D
#_07A828: STZ.b $3C

#_07A82A: STZ.b $3A
#_07A82C: STZ.b $3B

#_07A82E: STZ.w $031C
#_07A831: STZ.w $031D

#_07A834: STZ.b $5E

#_07A836: LDA.b $1B
#_07A838: BNE .useless_branch

.useless_branch
#_07A83A: LDA.w $0360
#_07A83D: BEQ .not_electrocuted

#_07A83F: LDA.b $55
#_07A841: BEQ .no_cape

#_07A843: JSR Link_ForceUnequipCape_quietly

;---------------------------------------------------------------------------------------------------

.no_cape
#_07A846: JSR Link_ResetSwordAndItemUsage

#_07A849: LDA.b #$01
#_07A84B: STA.w $037B

#_07A84E: STZ.w $0300

#_07A851: LDA.b #$02
#_07A853: STA.b $3D

#_07A855: STZ.b $2E

#_07A857: LDA.b $67
#_07A859: AND.b #$F0
#_07A85B: STA.b $67

#_07A85D: LDA.b #$2B ; SFX3.2B
#_07A85F: JSR PlaySFX_Set3

#_07A862: LDA.b #$07 ; LINKSTATE 07
#_07A864: STA.b $5D

#_07A866: BRL LinkState_Zapped

;---------------------------------------------------------------------------------------------------

.not_electrocuted
#_07A869: LDA.b #$02 ; LINKSTATE 02
#_07A86B: STA.b $5D

#_07A86D: BRL LinkState_Recoil

;---------------------------------------------------------------------------------------------------

.not_recoiling
#_07A870: LDA.b $46
#_07A872: BEQ .not_rebounding

#_07A874: JSR Link_HandleRecoilAndTimer
#_07A877: BRA .done_rebound

.not_rebounding
#_07A879: STZ.b $67

#_07A87B: JSL Link_HandleVelocity

#_07A87F: JSR Link_HandleCardinalCollision

#_07A882: LDA.b #$03 ; LINKSTATE 03
#_07A884: STA.b $5D

#_07A886: STZ.w $0302

#_07A889: JSR HandleIndoorCameraAndDoors

;---------------------------------------------------------------------------------------------------

.done_rebound
#_07A88C: DEC.b $3D
#_07A88E: BPL EXIT_07A8EB

#_07A890: LDA.w $031D
#_07A893: INC A
#_07A894: STA.w $031D

#_07A897: CMP.b #$02
#_07A899: BNE .skip_swoosh_sfx

#_07A89B: LDA.b #$23 ; SFX3.23
#_07A89D: JSR PlaySFX_Set3

;---------------------------------------------------------------------------------------------------

.skip_swoosh_sfx
#_07A8A0: LDA.w $031D
#_07A8A3: CMP.b #$0C
#_07A8A5: BNE .still_spinning

#_07A8A7: LDA.b $50
#_07A8A9: AND.b #$FE
#_07A8AB: STA.b $50

#_07A8AD: STZ.b $3D
#_07A8AF: STZ.b $3C

#_07A8B1: STZ.w $031C
#_07A8B4: STZ.w $031D

#_07A8B7: LDA.b $5D
#_07A8B9: CMP.b #$1E ; LINKSTATE 1E
#_07A8BB: BEQ .victory_spin

#_07A8BD: LDX.b #$00

#_07A8BF: LDA.b $3C
#_07A8C1: BEQ .dont_preserve_b_button

#_07A8C3: LDA.b $F0
#_07A8C5: AND.b #$80
#_07A8C7: TAX

.dont_preserve_b_button
#_07A8C8: STX.b $3A

.victory_spin
#_07A8CA: LDA.b #$00 ; LINKSTATE 00
#_07A8CC: STA.b $5D

#_07A8CE: BRA EXIT_07A8EB

;---------------------------------------------------------------------------------------------------

.still_spinning
#_07A8D0: LDA.w $031D
#_07A8D3: CLC
#_07A8D4: ADC.w $031E
#_07A8D7: TAX

#_07A8D8: LDA.w SpinAttack_anim_step,X
#_07A8DB: STA.w $031C

#_07A8DE: LDX.w $031D

#_07A8E1: LDY.w SpinAttack_anim_timer_b,X
#_07A8E4: STY.b $3D

#_07A8E6: LDY.b #$08
#_07A8E8: JSR TileDetect_MainHandler

;---------------------------------------------------------------------------------------------------

#EXIT_07A8EB:
#_07A8EB: RTS

;===================================================================================================

UNREACHABLE_07A8EC:
#_07A8EC: LDY.b #$00
#_07A8EE: LDX.b #$01
#_07A8F0: LDA.b #$2A ; ANCILLA 2A
#_07A8F2: JSL AncillaAdd_SpinAttackInitSpark

#_07A8F6: LDA.b #$1E ; LINKSTATE 1E
#_07A8F8: STA.b $5D

#_07A8FA: LDA.b $2F
#_07A8FC: LSR A
#_07A8FD: TAX

#_07A8FE: LDA.w SpinAttack_data_offset,X
#_07A901: STA.w $031E

#_07A904: TAX

#_07A905: LDA.w SpinAttack_anim_timer_a
#_07A908: STA.b $3D

#_07A90A: LDA.w SpinAttack_anim_step,X
#_07A90D: STA.w $031C
#_07A910: STZ.w $031D

#_07A913: LDA.b #$01
#_07A915: TSB.b $50

#_07A917: BRL LinkState_SpinAttack

;===================================================================================================

LinkItem_Mirror:
#_07A91A: BIT.b $3A
#_07A91C: BVS .continue

#_07A91E: JSR CheckYButtonPress
#_07A921: BCC EXIT_07A8EB

#_07A923: LDA.l $7EF3CC
#_07A927: CMP.b #$0A ; FOLLOWER 0A
#_07A929: BNE .continue

;---------------------------------------------------------------------------------------------------

#_07A92B: REP #$20

#_07A92D: LDA.w #$0121 ; MESSAGE 0121
#_07A930: STA.w $1CF0

#_07A933: SEP #$20

#_07A935: JSL Interface_PrepAndDisplayMessage
#_07A939: BRL .exit

;---------------------------------------------------------------------------------------------------

.continue
#_07A93C: LDA.b $3A
#_07A93E: AND.b #$BF
#_07A940: STA.b $3A

#_07A942: LDA.b $6C
#_07A944: BNE LinkGoBeep

#_07A946: LDA.w $037F
#_07A949: BNE Mirror_TryToWarp

#_07A94B: LDA.b $1B
#_07A94D: BNE Mirror_TryToWarp

#_07A94F: LDA.b $8A
#_07A951: AND.b #$40
#_07A953: BNE Mirror_TryToWarp

;===================================================================================================

#LinkGoBeep:
#_07A955: LDA.b #$3C ; SFX2.3C
#_07A957: JSR PlaySFX_Set2

#_07A95A: BRA .exit

;===================================================================================================

#Mirror_TryToWarp:
#_07A95C: LDA.b $1B
#_07A95E: BEQ .overworld

#_07A960: LDA.w $0FFC
#_07A963: BNE .exit

#_07A965: JSL Mirror_SaveRoomData

#_07A969: LDA.w $012E
#_07A96C: CMP.b #$3C ; SFX2.3C
#_07A96E: BEQ .exit

#_07A970: STZ.w $05FC
#_07A973: STZ.w $05FD

#_07A976: BRA .exit

;---------------------------------------------------------------------------------------------------

.overworld
#_07A978: LDA.b $10
#_07A97A: CMP.b #$0B
#_07A97C: BEQ .exit

#_07A97E: LDA.b $8A
#_07A980: AND.b #$40
#_07A982: STA.b $7B

#_07A984: BEQ .no_mirror_portal

#_07A986: LDA.b $20
#_07A988: STA.w $1ADF

#_07A98B: LDA.b $21
#_07A98D: STA.w $1AEF

#_07A990: LDA.b $22
#_07A992: STA.w $1ABF

#_07A995: LDA.b $23
#_07A997: STA.w $1ACF

.no_mirror_portal
#_07A99A: LDA.b #$23

;---------------------------------------------------------------------------------------------------

#SetGameModeLikeMirror:
#_07A99C: STA.b $11

#_07A99E: STZ.w $03F8

#_07A9A1: LDA.b #$01
#_07A9A3: STA.w $02DB

#_07A9A6: STZ.b $B0

#_07A9A8: STZ.b $27
#_07A9AA: STZ.b $28

#_07A9AC: LDA.b #$14 ; LINKSTATE 14
#_07A9AE: STA.b $5D

.exit
#_07A9B0: RTS

;===================================================================================================

LinkState_CrossingWorlds:
#_07A9B1: JSL Link_ResetProperties_B

#_07A9B5: JSR TileCheckForMirrorBonk

#_07A9B8: LDA.b $8A
#_07A9BA: AND.b #$40
#_07A9BC: CMP.b $7B
#_07A9BE: BNE .worlds_dont_match

#_07A9C0: BRL .dont_mirror_bonk

;---------------------------------------------------------------------------------------------------

.worlds_dont_match
#_07A9C3: LDA.b $0C
#_07A9C5: ORA.b $0E
#_07A9C7: STA.b $00

#_07A9C9: AND.b #$0C
#_07A9CB: BEQ .dont_mirror_bonk

#_07A9CD: LDA.b $00
#_07A9CF: AND.b #$03
#_07A9D1: BNE .mirror_bonk

#_07A9D3: LDA.b $00
#_07A9D5: AND.b #$0F
#_07A9D7: BEQ .dont_mirror_bonk

;---------------------------------------------------------------------------------------------------

#_07A9D9: LDX.b #$03
#_07A9DB: LDY.b #$00

.next_shift_a
#_07A9DD: LSR A
#_07A9DE: BCC .no_bit_a

#_07A9E0: INY

.no_bit_a
#_07A9E1: DEX
#_07A9E2: BPL .next_shift_a

#_07A9E4: CPY.b #$02
#_07A9E6: BCC .dont_mirror_bonk

.mirror_bonk
#_07A9E8: LDA.b #$2C
#_07A9EA: BRA SetGameModeLikeMirror

.dont_mirror_bonk
#_07A9EC: LDY.b #$00
#_07A9EE: LDX.b #$03

#_07A9F0: LDA.w $0341

.next_shift_b
#_07A9F3: LSR A
#_07A9F4: BCC .no_bit_b

#_07A9F6: INY

.no_bit_b
#_07A9F7: DEX
#_07A9F8: BPL .next_shift_b

#_07A9FA: CPY.b #$02
#_07A9FC: BCC .dont_reset_swim_or_cape

;---------------------------------------------------------------------------------------------------

#_07A9FE: LDA.l $7EF356
#_07AA02: BNE .have_flippers

#_07AA04: LDA.b $8A
#_07AA06: AND.b #$40
#_07AA08: CMP.b $7B
#_07AA0A: BNE .mirror_bonk

#_07AA0C: JSL CheckAbilityToSwim

#_07AA10: BRA .dont_reset_swim_or_cape

;---------------------------------------------------------------------------------------------------

.have_flippers
#_07AA12: LDA.b #$01
#_07AA14: STA.w $0345

#_07AA17: LDA.b $26
#_07AA19: STA.w $0340

#_07AA1C: JSL Link_ResetSwimmingState

#_07AA20: LDA.b #$04 ; LINKSTATE 04
#_07AA22: STA.b $5D

#_07AA24: JSR Link_ForceUnequipCape_quietly

#_07AA27: STZ.b $5E

#_07AA29: BRA .exit

;---------------------------------------------------------------------------------------------------

.dont_reset_swim_or_cape
#_07AA2B: LDA.w $0345
#_07AA2E: BEQ .not_deep_water

#_07AA30: STZ.w $0345

#_07AA33: LDA.w $0340
#_07AA36: STA.b $26

.not_deep_water
#_07AA38: STZ.w $0374
#_07AA3B: STZ.w $0372

#_07AA3E: STZ.b $5E

#_07AA40: STZ.b $3A
#_07AA42: STZ.b $3C

#_07AA44: STZ.b $50

#_07AA46: STZ.w $032B

#_07AA49: STZ.b $27

;---------------------------------------------------------------------------------------------------

#_07AA4B: LDA.b $8A
#_07AA4D: AND.b #$40
#_07AA4F: CMP.b $7B
#_07AA51: BEQ .worlds_match

#_07AA53: STZ.w $04AC
#_07AA56: STZ.w $04AD

.worlds_match
#_07AA59: LDY.b #$00 ; LINKSTATE 00

#_07AA5B: LDA.l $7EF357
#_07AA5F: BNE .not_pearlless_in_darkworld

#_07AA61: LDA.b $8A
#_07AA63: AND.b #$40
#_07AA65: BEQ .not_pearlless_in_darkworld

#_07AA67: LDY.b #$17 ; LINKSTATE 17

.not_pearlless_in_darkworld
#_07AA69: STY.b $5D

.exit
#_07AA6B: RTS

;===================================================================================================

Link_PerformDesertPrayer:
#_07AA6C: LDA.b #$05
#_07AA6E: STA.b $11

#_07AA70: LDA.b $10
#_07AA72: STA.w $010C

#_07AA75: LDA.b #$0E
#_07AA77: STA.b $10

#_07AA79: LDA.b #$01
#_07AA7B: STA.w $0FC1

#_07AA7E: LDA.b #$16
#_07AA80: STA.w $030B

#_07AA83: STZ.w $030A

#_07AA86: LDA.b #$02
#_07AA88: STA.w $0308

#_07AA8B: LDA.b #$01
#_07AA8D: TSB.b $50

#_07AA8F: STZ.b $2E

#_07AA91: LDA.b $67
#_07AA93: AND.b #$F0
#_07AA95: STA.b $67

#_07AA97: LDA.b #$11 ; SFX1.11
#_07AA99: STA.w $012D

#_07AA9C: LDA.b #$F2 ; SONG F2 - half volume
#_07AA9E: STA.w $012C

;===================================================================================================

Link_APress_NothingA:
#_07AAA1: RTS

;===================================================================================================

HandleFollowersAfterMirroring:
#_07AAA2: PHB
#_07AAA3: PHK
#_07AAA4: PLB

#_07AAA5: LDY.b #$00
#_07AAA7: JSR TileDetect_MainHandler

#_07AAAA: STZ.b $2E

#_07AAAC: LDA.l $7EF3CC
#_07AAB0: CMP.b #$0C ; FOLLOWER 0C
#_07AAB2: BEQ .have_purple_chest

#_07AAB4: CMP.b #$0D ; FOLLOWER 0D
#_07AAB6: BNE .dont_have_superbomb

#_07AAB8: LDA.b #$FE
#_07AABA: STA.w $04B4
#_07AABD: STZ.w $04B5

;---------------------------------------------------------------------------------------------------

.have_purple_chest
#_07AAC0: LDA.l $7EF3D3
#_07AAC4: BEQ .check_for_pearl

#_07AAC6: LDA.b #$00
#_07AAC8: STA.l $7EF3D3

#_07AACC: BRA .clear_follower

;---------------------------------------------------------------------------------------------------

.dont_have_superbomb
#_07AACE: LDA.l $7EF3CC

#_07AAD2: CMP.b #$09 ; FOLLOWER 09
#_07AAD4: BEQ .clear_follower

#_07AAD6: CMP.b #$0A ; FOLLOWER 0A
#_07AAD8: BNE .not_kiki

.clear_follower
#_07AADA: LDA.b #$00
#_07AADC: STA.l $7EF3CC

#_07AAE0: BRA .check_for_pearl

;---------------------------------------------------------------------------------------------------

.not_kiki
#_07AAE2: LDY.b #$07 ; FOLLOWER 07

#_07AAE4: LDA.l $7EF3CC
#_07AAE8: CMP.b #$08 ; FOLLOWER 08
#_07AAEA: BEQ .smithy

#_07AAEC: LDY.b #$08 ; FOLLOWER 08

#_07AAEE: CMP.b #$07 ; FOLLOWER 07
#_07AAF0: BNE .check_for_pearl

;---------------------------------------------------------------------------------------------------

.smithy
#_07AAF2: TYA
#_07AAF3: STA.l $7EF3CC
#_07AAF7: JSL LoadFollowerGraphics

#_07AAFB: LDY.b #$04
#_07AAFD: LDA.b #$40 ; ANCILLA 40
#_07AAFF: JSL AncillaAdd_DwarfPoof

;---------------------------------------------------------------------------------------------------

.check_for_pearl
#_07AB03: LDA.l $7EF357
#_07AB07: BNE .have_pearl

#_07AB09: LDY.b #$04
#_07AB0B: LDA.b #$23 ; ANCILLA 23
#_07AB0D: JSL AncillaAdd_BunnyPoof

#_07AB11: JSR Link_ForceUnequipCape_quietly

#_07AB14: STZ.w $02E2

#_07AB17: BRA .exit

.have_pearl
#_07AB19: LDA.b $55
#_07AB1B: BEQ .exit

#_07AB1D: JSR Link_ForceUnequipCape

#_07AB20: STZ.w $02E2

.exit
#_07AB23: PLB

#_07AB24: RTL

;===================================================================================================

LinkItem_Hookshot:
#_07AB25: LDA.b $3A
#_07AB27: AND.b #$40
#_07AB29: BNE EXIT_07AB6B

#_07AB2B: LDA.b $6C
#_07AB2D: BNE EXIT_07AB6B

#_07AB2F: LDA.b $48
#_07AB31: AND.b #$02
#_07AB33: BNE EXIT_07AB6B

#_07AB35: JSR CheckYButtonPress
#_07AB38: BCC EXIT_07AB6B

;---------------------------------------------------------------------------------------------------

#_07AB3A: JSR ResetAllAcceleration

#_07AB3D: STZ.w $0300

#_07AB40: LDA.b #$01
#_07AB42: TSB.b $50

#_07AB44: LDA.b #$07
#_07AB46: STA.b $3D

#_07AB48: STZ.b $2E

#_07AB4A: LDA.b $67
#_07AB4C: AND.b #$F0
#_07AB4E: STA.b $67

#_07AB50: LDA.w $037A
#_07AB53: AND.b #$00
#_07AB55: ORA.b #$04
#_07AB57: STA.w $037A

#_07AB5A: LDA.b #$13 ; LINKSTATE 13
#_07AB5C: STA.b $5D

#_07AB5E: LDA.b #$01
#_07AB60: STA.w $037B

#_07AB63: LDY.b #$03
#_07AB65: LDA.b #$1F ; ANCILLA 1F
#_07AB67: JSL AncillaAdd_Hookshot

;---------------------------------------------------------------------------------------------------

#EXIT_07AB6B:
#_07AB6B: RTS

;===================================================================================================

Hookdrag_OffsetY:
#_07AB6C: db $F8 ; up
#_07AB6D: db $F0 ; down
#_07AB6E: db $00 ; left
#_07AB6F: db $00 ; right

Hookdrag_OffsetX:
#_07AB70: db $00 ; up
#_07AB71: db $00 ; down
#_07AB72: db $04 ; left
#_07AB73: db $F4 ; right

;===================================================================================================

HookdragSpeeds_Vertical:
#_07AB74: db $C0 ; up
#_07AB75: db $40 ; down
#_07AB76: db $00 ; left
#_07AB77: db $00 ; right

HookdragSpeeds_Horizontal:
#_07AB78: db $00 ; up
#_07AB79: db $00 ; down
#_07AB7A: db $C0 ; left
#_07AB7B: db $40 ; right

;===================================================================================================

LinkState_Hookshotting:
#_07AB7C: STZ.w $0373
#_07AB7F: STZ.b $4D
#_07AB81: STZ.b $46

#_07AB83: LDX.b #$04

.next_ancilla_check
#_07AB85: LDA.w $0C4A,X
#_07AB88: CMP.b #$1F ; ANCILLA 1F
#_07AB8A: BEQ .found_hookshot

#_07AB8C: DEX
#_07AB8D: BPL .next_ancilla_check

#_07AB8F: DEC.b $3D

#_07AB91: LDA.b $3D
#_07AB93: BPL EXIT_07AB6B

;---------------------------------------------------------------------------------------------------

#_07AB95: STZ.w $0300
#_07AB98: STZ.w $037B

#_07AB9B: LDA.b $3A
#_07AB9D: AND.b #$BF
#_07AB9F: STA.b $3A

#_07ABA1: LDA.b $50
#_07ABA3: AND.b #$FE
#_07ABA5: STA.b $50

#_07ABA7: LDA.w $037A
#_07ABAA: AND.b #$FB
#_07ABAC: STA.w $037A

#_07ABAF: LDA.b #$00 ; LINKSTATE 00
#_07ABB1: STA.b $5D

#_07ABB3: LDA.b $3C
#_07ABB5: CMP.b #$09
#_07ABB7: BCC .exit

#_07ABB9: LDA.b #$09
#_07ABBB: STA.b $3C

.exit
#_07ABBD: RTS

;---------------------------------------------------------------------------------------------------

.found_hookshot
#_07ABBE: DEC.b $3D
#_07ABC0: BPL .timer_going

#_07ABC2: STZ.b $3D

.timer_going
#_07ABC4: LDA.w $037E
#_07ABC7: BNE .being_dragged

#_07ABC9: LDA.b $20
#_07ABCB: STA.b $3E

#_07ABCD: LDA.b $22
#_07ABCF: STA.b $3F

#_07ABD1: STZ.b $30
#_07ABD3: STZ.b $31

#_07ABD5: BRL Link_HandleCardinalCollision

;---------------------------------------------------------------------------------------------------

.being_dragged
#_07ABD8: STZ.w $02F5

#_07ABDB: LDX.w $039D

#_07ABDE: DEC.w $0C5E,X
#_07ABE1: BPL .keep_hooking

#_07ABE3: STZ.w $0C5E,X

#_07ABE6: BRL LinkHookshot_DeleteHook

;---------------------------------------------------------------------------------------------------

.keep_hooking
#_07ABE9: LDA.w $0BFA,X
#_07ABEC: STA.b $00

#_07ABEE: LDA.w $0C0E,X
#_07ABF1: STA.b $01

#_07ABF3: LDA.w $0C04,X
#_07ABF6: STA.b $02

#_07ABF8: LDA.w $0C18,X
#_07ABFB: STA.b $03

#_07ABFD: LDY.w $0C72,X

#_07AC00: STZ.b $05

#_07AC02: LDA.w Hookdrag_OffsetY,Y
#_07AC05: STA.b $04
#_07AC07: BPL .positive_a

#_07AC09: LDA.b #$FF
#_07AC0B: STA.b $05

.positive_a
#_07AC0D: STZ.b $07

#_07AC0F: LDA.w Hookdrag_OffsetX,Y
#_07AC12: STA.b $06
#_07AC14: BPL .positive_b

#_07AC16: LDA.b #$FF
#_07AC18: STA.b $07

.positive_b
#_07AC1A: STZ.b $27
#_07AC1C: STZ.b $28

#_07AC1E: LDA.w HookdragSpeeds_Vertical,Y
#_07AC21: STA.b $08
#_07AC23: STZ.b $09

#_07AC25: LDA.w HookdragSpeeds_Horizontal,Y
#_07AC28: STA.b $0A
#_07AC2A: STZ.b $0B

;---------------------------------------------------------------------------------------------------

#_07AC2C: REP #$20

#_07AC2E: LDA.b $00
#_07AC30: CLC
#_07AC31: ADC.b $04
#_07AC33: SEC
#_07AC34: SBC.b $20
#_07AC36: BPL .positive_y

#_07AC38: EOR.w #$FFFF
#_07AC3B: INC A

.positive_y
#_07AC3C: CMP.w #$0002
#_07AC3F: BCC .not_limited_y

#_07AC41: LDA.b $27
#_07AC43: AND.w #$FF00
#_07AC46: ORA.b $08
#_07AC48: STA.b $27

.not_limited_y
#_07AC4A: LDA.b $02
#_07AC4C: CLC
#_07AC4D: ADC.b $06
#_07AC4F: SEC
#_07AC50: SBC.b $22
#_07AC52: BPL .positive_x

#_07AC54: EOR.w #$FFFF
#_07AC57: INC A

.positive_x
#_07AC58: CMP.w #$0002
#_07AC5B: BCC .not_limited_x

#_07AC5D: LDA.b $28
#_07AC5F: AND.w #$FF00
#_07AC62: ORA.b $0A
#_07AC64: STA.b $28

.not_limited_x
#_07AC66: SEP #$20

#_07AC68: LDA.b $27
#_07AC6A: ORA.b $28
#_07AC6C: BEQ LinkHookshot_DeleteHook

#_07AC6E: BRL LinkHookshot_GetDragged

;===================================================================================================

LinkHookshot_DeleteHook:
#_07AC71: LDX.w $039D

#_07AC74: STZ.w $0C4A,X

#_07AC77: LDA.w $02D3
#_07AC7A: STA.w $02D1

#_07AC7D: LDA.b #$00 ; LINKSTATE 00
#_07AC7F: STA.b $5D

#_07AC81: STZ.w $0300
#_07AC84: STZ.b $3D
#_07AC86: STZ.w $037E

#_07AC89: LDA.b $3A
#_07AC8B: AND.b #$BF
#_07AC8D: STA.b $3A

#_07AC8F: LDA.b $50
#_07AC91: AND.b #$FE
#_07AC93: STA.b $50

#_07AC95: LDA.w $037A
#_07AC98: AND.b #$FB
#_07AC9A: STA.w $037A

#_07AC9D: STZ.w $037B

#_07ACA0: LDA.w $03A4,X
#_07ACA3: BEQ .no_layer_changing

#_07ACA5: LDA.w $0476
#_07ACA8: EOR.b #$01
#_07ACAA: STA.w $0476

#_07ACAD: DEC.b $A4

#_07ACAF: LDA.w $044A
#_07ACB2: BNE .dont_go_down_1_room

#_07ACB4: LDA.b $A0
#_07ACB6: STA.w $048E

#_07ACB9: CLC
#_07ACBA: ADC.b #$10
#_07ACBC: STA.b $A0

.dont_go_down_1_room
#_07ACBE: LDA.w $044A
#_07ACC1: CMP.b #$02
#_07ACC3: BEQ .dont_swap_layer

#_07ACC5: LDA.b $EE
#_07ACC7: EOR.b #$01
#_07ACC9: STA.b $EE

.dont_swap_layer
#_07ACCB: JSL Underworld_FlagRoomData_Quadrants

;---------------------------------------------------------------------------------------------------

.no_layer_changing
#_07ACCF: JSR TileDetect_BigArea

#_07ACD2: LDA.w $0341
#_07ACD5: AND.b #$0F
#_07ACD7: BEQ .not_on_deep_water

#_07ACD9: LDA.w $0345
#_07ACDC: BNE .not_on_deep_water

;---------------------------------------------------------------------------------------------------

#_07ACDE: LDA.b #$01
#_07ACE0: STA.w $0345

#_07ACE3: LDA.b $26
#_07ACE5: STA.w $0340

#_07ACE8: JSL Link_ResetSwimmingState

#_07ACEC: LDA.b #$15 ; ANCILLA 15
#_07ACEE: LDY.b #$00
#_07ACF0: JSL AncillaAdd_Splash

#_07ACF4: LDA.b #$04 ; LINKSTATE 04
#_07ACF6: STA.b $5D

#_07ACF8: JSR Link_ForceUnequipCape_quietly

#_07ACFB: STZ.w $0308
#_07ACFE: STZ.w $0309
#_07AD01: STZ.w $0376
#_07AD04: STZ.b $5E

#_07AD06: LDA.b $1B
#_07AD08: BEQ .dont_set_to_water_layer

#_07AD0A: LDA.b #$01
#_07AD0C: STA.b $EE

.dont_set_to_water_layer
#_07AD0E: BRA .continue_after_tiles

;---------------------------------------------------------------------------------------------------

.not_on_deep_water
#_07AD10: LDA.b $59
#_07AD12: AND.b #$0F
#_07AD14: BEQ .not_pit

#_07AD16: LDA.b #$09
#_07AD18: STA.b $5C

#_07AD1A: STZ.b $5A

#_07AD1C: LDA.b #$01
#_07AD1E: STA.b $5B

#_07AD20: LDA.b #$01 ; LINKSTATE 01
#_07AD22: STA.b $5D

#_07AD24: BRA .continue_after_tiles

;---------------------------------------------------------------------------------------------------

.not_pit
#_07AD26: LDA.b $20
#_07AD28: STA.b $3E

#_07AD2A: LDA.b $22
#_07AD2C: STA.b $3F

#_07AD2E: LDA.b $21
#_07AD30: STA.b $40

#_07AD32: LDA.b $23
#_07AD34: STA.b $41

#_07AD36: JSR Link_HandleCardinalCollision

#_07AD39: BRL LinkHookshot_GetDragged_go_backwards

;---------------------------------------------------------------------------------------------------

.continue_after_tiles
#_07AD3C: LDA.b $3C
#_07AD3E: CMP.b #$09
#_07AD40: BCC .no_spin_charge

#_07AD42: LDA.b #$09
#_07AD44: STA.b $3C

.no_spin_charge
#_07AD46: BRL EXIT_07ADBD

;===================================================================================================

LinkHookshot_GetDragged:
#_07AD49: JSL LinkHop_FindArbitraryLandingSpot

#_07AD4D: LDY.b #$05
#_07AD4F: JSR TileDetect_MainHandler

#_07AD52: LDA.b $1B
#_07AD54: BEQ .dont_flag_layers

;---------------------------------------------------------------------------------------------------

#_07AD56: LDA.w $036D

#_07AD59: LSR A
#_07AD5A: LSR A
#_07AD5B: LSR A
#_07AD5C: LSR A

#_07AD5D: ORA.w $036D
#_07AD60: ORA.w $036E

#_07AD63: AND.b #$01
#_07AD65: BEQ .dont_flag_layers

#_07AD67: DEC.w $03F9
#_07AD6A: BPL .dont_flag_layers

#_07AD6C: LDA.b #$03
#_07AD6E: STA.w $03F9

#_07AD71: LDA.w $037E
#_07AD74: EOR.b #$02
#_07AD76: STA.w $037E

;---------------------------------------------------------------------------------------------------

.dont_flag_layers
#_07AD79: STZ.w $0351

#_07AD7C: LDA.w $037E
#_07AD7F: AND.b #$02
#_07AD81: BNE .go_backwards

#_07AD83: LDA.w $0357
#_07AD86: AND.b #$01
#_07AD88: BEQ .not_thick_grass

#_07AD8A: LDA.b #$02
#_07AD8C: STA.w $0351

#_07AD8F: JSR Link_PermissionForSloshSounds
#_07AD92: BCS .go_backwards

#_07AD94: LDA.b #$1A ; SFX2.1A
#_07AD96: JSR PlaySFX_Set2

#_07AD99: BRA .go_backwards

.not_thick_grass
#_07AD9B: LDA.w $0359
#_07AD9E: ORA.w $0341
#_07ADA1: AND.b #$01
#_07ADA3: BEQ .go_backwards

#_07ADA5: INC.w $0351

#_07ADA8: LDA.b $8A
#_07ADAA: CMP.b #$70 ; OW 70
#_07ADAC: BNE .not_mire

#_07ADAE: LDA.b #$1B ; SFX2.1B
#_07ADB0: JSR PlaySFX_Set2

#_07ADB3: BRA .go_backwards

.not_mire
#_07ADB5: LDA.b #$1C ; SFX2.1C
#_07ADB7: JSR PlaySFX_Set2

.go_backwards
#_07ADBA: JSR HandleIndoorCameraAndDoors

;---------------------------------------------------------------------------------------------------

#EXIT_07ADBD:
#_07ADBD: RTS

;===================================================================================================

CapeSapTimers:
#_07ADBE: db $04 ; normal
#_07ADBF: db $08 ; 1/2 magic
#_07ADC0: db $08 ; 1/4 magic

;===================================================================================================

LinkItem_Cape:
#_07ADC1: LDA.b $55
#_07ADC3: BNE .cape_active

#_07ADC5: DEC.w $02E2
#_07ADC8: BMI .delay_active

#_07ADCA: LDA.b $67
#_07ADCC: AND.b #$F0
#_07ADCE: STA.b $67

#_07ADD0: BRL HaltLinkWhenUsingItems

.delay_active
#_07ADD3: STZ.w $02E2

#_07ADD6: LDA.b $6C
#_07ADD8: BNE EXIT_07ADBD

#_07ADDA: JSR CheckYButtonPress
#_07ADDD: BCC EXIT_07ADBD

;---------------------------------------------------------------------------------------------------

#_07ADDF: LDA.b $3A
#_07ADE1: AND.b #$BF
#_07ADE3: STA.b $3A

#_07ADE5: LDA.l $7EF36E
#_07ADE9: BEQ CannotEquipCape

#_07ADEB: STZ.w $0300

#_07ADEE: LDA.b #$01
#_07ADF0: STA.b $55

#_07ADF2: LDA.l $7EF37B
#_07ADF6: TAY

#_07ADF7: LDA.w CapeSapTimers,Y
#_07ADFA: STA.b $4C

#_07ADFC: LDA.b #$14
#_07ADFE: STA.w $02E2

#_07AE01: LDY.b #$04
#_07AE03: LDA.b #$23 ; ANCILLA 23
#_07AE05: JSL AncillaAdd_CapePoof

#_07AE09: LDA.b #$14 ; SFX2.14
#_07AE0B: JSR PlaySFX_Set2

#_07AE0E: BRA .exit

;===================================================================================================

.cape_active
#_07AE10: LDA.b #$01
#_07AE12: STA.w $037B

#_07AE15: JSR HaltLinkWhenUsingItems

#_07AE18: LDA.b $67
#_07AE1A: AND.b #$F0
#_07AE1C: STA.b $67

#_07AE1E: DEC.b $4C

#_07AE20: LDA.b $4C
#_07AE22: BNE .dont_sap

#_07AE24: LDA.l $7EF37B
#_07AE28: TAY

#_07AE29: LDA.w CapeSapTimers,Y
#_07AE2C: STA.b $4C

#_07AE2E: LDA.l $7EF36E
#_07AE32: DEC A
#_07AE33: STA.l $7EF36E

#_07AE37: BEQ Link_ForceUnequipCape

.dont_sap
#_07AE39: DEC.w $02E2
#_07AE3C: BPL .exit

#_07AE3E: STZ.w $02E2

#_07AE41: LDA.b $F4
#_07AE43: AND.b #$40
#_07AE45: BEQ .exit

;===================================================================================================

#Link_ForceUnequipCape:
#_07AE47: LDY.b #$04
#_07AE49: LDA.b #$23 ; ANCILLA 23
#_07AE4B: JSL AncillaAdd_CapePoof

#_07AE4F: LDA.b #$15 ; SFX2.15
#_07AE51: JSR PlaySFX_Set2

;===================================================================================================

#Link_ForceUnequipCape_quietly:
#_07AE54: LDA.b #$20
#_07AE56: STA.w $02E2

#_07AE59: STZ.w $037B
#_07AE5C: STZ.b $55
#_07AE5E: STZ.w $0360

.exit
#_07AE61: RTS

;===================================================================================================

CannotEquipCape:
#_07AE62: BRL Link_DisplayNoMagicMessage

;===================================================================================================

HaltLinkWhenUsingItems:
#_07AE65: LDA.b $AD
#_07AE67: CMP.b #$02
#_07AE69: BNE .skip

#_07AE6B: LDA.w $0322
#_07AE6E: AND.b #$03
#_07AE70: CMP.b #$03
#_07AE72: BNE .skip

#_07AE74: STZ.b $30
#_07AE76: STZ.b $31

#_07AE78: STZ.b $67

#_07AE7A: STZ.b $2A
#_07AE7C: STZ.b $2B

#_07AE7E: STZ.b $6B

.skip
#_07AE80: LDA.w $02F5
#_07AE83: BEQ EXIT_07AE87

#_07AE85: STZ.b $67

;---------------------------------------------------------------------------------------------------

#EXIT_07AE87:
#_07AE87: RTS

;===================================================================================================

Link_HandleCape_passive_LiftCheck:
#_07AE88: LDA.w $0308
#_07AE8B: AND.b #$80
#_07AE8D: BEQ EXIT_07AE87

;===================================================================================================

Link_HandleCape_passive:
#_07AE8F: LDA.b $55
#_07AE91: BEQ EXIT_07AE87

#_07AE93: LDA.w $0304
#_07AE96: CMP.b #$13
#_07AE98: BNE EXIT_07AE87

#_07AE9A: CMP.w $0303
#_07AE9D: BNE .unequip

#_07AE9F: DEC.b $4C

#_07AEA1: LDA.b $4C
#_07AEA3: BNE .exit

#_07AEA5: LDA.l $7EF37B
#_07AEA9: TAY

#_07AEAA: LDA.w CapeSapTimers,Y
#_07AEAD: STA.b $4C

#_07AEAF: LDA.l $7EF36E
#_07AEB3: BEQ .exit

#_07AEB5: DEC A
#_07AEB6: STA.l $7EF36E
#_07AEBA: BNE .exit

.unequip
#_07AEBC: JSR Link_ForceUnequipCape

.exit
#_07AEBF: RTS

;===================================================================================================

LinkItem_CaneOfSomaria:
#_07AEC0: BIT.b $3A
#_07AEC2: BVS .pressed_y

#_07AEC4: LDA.w $02F5
#_07AEC7: BNE EXIT_07AE87

#_07AEC9: LDA.b $6C
#_07AECB: BNE EXIT_07AE87

#_07AECD: JSR CheckYButtonPress
#_07AED0: BCC EXIT_07AE87

;---------------------------------------------------------------------------------------------------

#_07AED2: LDX.b #$04

.next_ancilla
#_07AED4: LDA.w $0C4A,X
#_07AED7: CMP.b #$2C ; ANCILLA 2C
#_07AED9: BEQ .found_block

#_07AEDB: DEX
#_07AEDC: BPL .next_ancilla

#_07AEDE: LDX.b #$04
#_07AEE0: JSR LinkCheckMagicCost
#_07AEE3: BCC EXIT_07AE87

;---------------------------------------------------------------------------------------------------

.found_block
#_07AEE5: LDA.b #$01
#_07AEE7: STA.w $0350

#_07AEEA: LDY.b #$01
#_07AEEC: LDA.b #$2C ; ANCILLA 2C
#_07AEEE: JSL AncillaAdd_SomariaBlock

#_07AEF2: LDA.w RodAndCaneAnimationTimer
#_07AEF5: STA.b $3D

#_07AEF7: STZ.b $2E
#_07AEF9: STZ.w $0300
#_07AEFC: STZ.w $0301

#_07AEFF: LDA.b #$08
#_07AF01: TSB.w $037A

;---------------------------------------------------------------------------------------------------

.pressed_y
#_07AF04: JSR HaltLinkWhenUsingItems

#_07AF07: LDA.b $67
#_07AF09: AND.b #$F0
#_07AF0B: STA.b $67

#_07AF0D: DEC.b $3D
#_07AF0F: BPL EXIT_07AF3A

#_07AF11: LDA.w $0300
#_07AF14: INC A
#_07AF15: STA.w $0300

#_07AF18: TAX

#_07AF19: LDA.w RodAndCaneAnimationTimer,X
#_07AF1C: STA.b $3D

#_07AF1E: CPX.b #$03
#_07AF20: BNE EXIT_07AF3A

;---------------------------------------------------------------------------------------------------

#_07AF22: STZ.b $5E
#_07AF24: STZ.w $0300

#_07AF27: STZ.b $3D
#_07AF29: STZ.w $0350

#_07AF2C: LDA.b $3A
#_07AF2E: AND.b #$BF
#_07AF30: STA.b $3A

#_07AF32: LDA.w $037A
#_07AF35: AND.b #$F7
#_07AF37: STA.w $037A

;---------------------------------------------------------------------------------------------------

#EXIT_07AF3A:
#_07AF3A: RTS

;===================================================================================================

ByrnaAnimationTimers:
#_07AF3B: db 19
#_07AF3C: db  7
#_07AF3D: db 13

;===================================================================================================

LinkItem_CaneOfByrna:
#_07AF3E: JSR SearchForByrnaSpark
#_07AF41: BCS EXIT_07AF3A

#_07AF43: BIT.b $3A
#_07AF45: BVS .pressed_y

#_07AF47: LDA.b $6C
#_07AF49: BNE EXIT_07AF3A

#_07AF4B: JSR CheckYButtonPress
#_07AF4E: BCC EXIT_07AF3A

;---------------------------------------------------------------------------------------------------

#_07AF50: LDX.b #$08
#_07AF52: JSR LinkCheckMagicCost
#_07AF55: BCC .lack_magic

#_07AF57: LDY.b #$00
#_07AF59: LDA.b #$30 ; ANCILLA 30
#_07AF5B: JSL AncillaAdd_CaneOfByrnaInitSpark

#_07AF5F: STZ.b $79

#_07AF61: LDA.w ByrnaAnimationTimers
#_07AF64: STA.b $3D

#_07AF66: STZ.w $030D
#_07AF69: STZ.w $0300

#_07AF6C: LDA.b #$08
#_07AF6E: STA.w $037A

#_07AF71: LDA.b #$01
#_07AF73: TSB.b $50

#_07AF75: STZ.b $2E

;---------------------------------------------------------------------------------------------------

.pressed_y
#_07AF77: JSR HaltLinkWhenUsingItems

#_07AF7A: LDA.b $67
#_07AF7C: AND.b #$F0
#_07AF7E: STA.b $67

#_07AF80: DEC.b $3D
#_07AF82: BPL EXIT_07AFB4

#_07AF84: LDX.w $0300
#_07AF87: INX
#_07AF88: STX.w $0300

#_07AF8B: LDA.w ByrnaAnimationTimers,X
#_07AF8E: STA.b $3D

#_07AF90: CPX.b #$01
#_07AF92: BNE .skip_sfx

#_07AF94: PHX

#_07AF95: LDA.b #$2A ; SFX3.2A
#_07AF97: JSR PlaySFX_Set3

#_07AF9A: PLX

.skip_sfx
#_07AF9B: CPX.b #$03
#_07AF9D: BNE EXIT_07AFB4

;---------------------------------------------------------------------------------------------------

.lack_magic
#_07AF9F: STZ.w $030D
#_07AFA2: STZ.w $0300

#_07AFA5: LDA.b $3A
#_07AFA7: AND.b #$80
#_07AFA9: STA.b $3A

#_07AFAB: STZ.w $037A

#_07AFAE: LDA.b $50
#_07AFB0: AND.b #$FE
#_07AFB2: STA.b $50

;---------------------------------------------------------------------------------------------------

#EXIT_07AFB4:
#_07AFB4: RTS

;===================================================================================================

SearchForByrnaSpark:
#_07AFB5: LDA.w $037A
#_07AFB8: AND.b #$08
#_07AFBA: BNE .cane_not_equipped

#_07AFBC: LDX.b #$04

.next
#_07AFBE: LDA.w $0C4A,X
#_07AFC1: CMP.b #$31 ; ANCILLA 31
#_07AFC3: BEQ .found_spark

#_07AFC5: DEX
#_07AFC6: BPL .next

;---------------------------------------------------------------------------------------------------

.cane_not_equipped
#_07AFC8: CLC

#_07AFC9: RTS

.found_spark
#_07AFCA: SEC

#_07AFCB: RTS

;===================================================================================================

pool LinkItem_Net

.pose_id
#_07AFCC: db $0B, $06, $07, $08, $01, $02, $03, $04, $05, $06 ; up
#_07AFD6: db $01, $02, $03, $04, $05, $06, $07, $08, $01, $02 ; down
#_07AFE0: db $09, $04, $05, $06, $07, $08, $01, $02, $03, $04 ; left
#_07AFEA: db $0A, $08, $01, $02, $03, $04, $05, $06, $07, $08 ; right

.pose_offset
#_07AFF4: db $00 ; up
#_07AFF5: db $0A ; down
#_07AFF6: db $14 ; left
#_07AFF7: db $1E ; right

pool off

;===================================================================================================

LinkItem_Net:
#_07AFF8: BIT.b $3A
#_07AFFA: BVS .y_press

#_07AFFC: LDA.b $6C
#_07AFFE: BNE EXIT_07AFB4

#_07B000: JSR CheckYButtonPress
#_07B003: BCC EXIT_07AFB4

;---------------------------------------------------------------------------------------------------

#_07B005: LDA.b $2F
#_07B007: LSR A
#_07B008: TAY

#_07B009: LDX.w .pose_offset,Y
#_07B00C: LDA.w .pose_id,X
#_07B00F: STA.w $0300

#_07B012: LDA.b #$03
#_07B014: STA.b $3D

#_07B016: STZ.w $030D

#_07B019: LDA.b #$10
#_07B01B: STA.w $037A

#_07B01E: LDA.b #$01
#_07B020: TSB.b $50

#_07B022: STZ.b $2E

#_07B024: LDA.b #$32 ; SFX2.32
#_07B026: JSR PlaySFX_Set2

;---------------------------------------------------------------------------------------------------

.y_press
#_07B029: JSR HaltLinkWhenUsingItems

#_07B02C: LDA.b $67
#_07B02E: AND.b #$F0
#_07B030: STA.b $67

#_07B032: DEC.b $3D
#_07B034: BPL .exit

;---------------------------------------------------------------------------------------------------

#_07B036: LDX.w $030D
#_07B039: INX
#_07B03A: STX.w $030D

#_07B03D: LDA.b #$03
#_07B03F: STA.b $3D

#_07B041: LDA.b $2F
#_07B043: LSR A
#_07B044: TAY

#_07B045: LDA.w .pose_offset,Y
#_07B048: CLC
#_07B049: ADC.w $030D
#_07B04C: TAY

#_07B04D: LDA.w .pose_id,Y
#_07B050: STA.w $0300

#_07B053: CPX.b #$0A
#_07B055: BNE .exit

;---------------------------------------------------------------------------------------------------

#_07B057: STZ.w $030D
#_07B05A: STZ.w $0300

#_07B05D: LDA.b $3A
#_07B05F: AND.b #$80
#_07B061: STA.b $3A

#_07B063: STZ.w $037A

#_07B066: LDA.b $50
#_07B068: AND.b #$FE
#_07B06A: STA.b $50

#_07B06C: LDA.b #$80
#_07B06E: STA.b $44
#_07B070: STA.b $45

.exit
#_07B072: RTS

;===================================================================================================

CheckYButtonPress:
#_07B073: BIT.b $3A
#_07B075: BVS .fail

#_07B077: LDA.b $46
#_07B079: BNE .fail

;===================================================================================================

#CheckYButtonPress_unfiltered:
#_07B07B: LDA.b $F4
#_07B07D: AND.b #$40
#_07B07F: BEQ .fail

#_07B081: TSB.b $3A

#_07B083: SEC

#_07B084: RTS

.fail
#_07B085: CLC

#_07B086: RTS

;===================================================================================================

ItemMagicCost:

.cost
#_07B087: db $10, $08, $04 ; rod
#_07B08A: db $20, $10, $08 ; medallion
#_07B08D: db $08, $04, $02 ; powder
#_07B090: db $08, $04, $02
#_07B093: db $08, $04, $02 ; somaria
#_07B096: db $10, $08, $04
#_07B099: db $04, $02, $02 ; lamp
#_07B09C: db $08, $04, $02
#_07B09F: db $10, $08, $04 ; byrna

.cost_offset
#_07B0A2: db $00 ; rod
#_07B0A3: db $03 ; medallion
#_07B0A4: db $06 ; powder
#_07B0A5: db $09
#_07B0A6: db $0C ; somaria
#_07B0A7: db $0F
#_07B0A8: db $12 ; lamp
#_07B0A9: db $15
#_07B0AA: db $18 ; byrna

;===================================================================================================

LinkCheckMagicCost:
#_07B0AB: STX.b $02

#_07B0AD: LDA.w ItemMagicCost_cost_offset,X
#_07B0B0: CLC
#_07B0B1: ADC.l $7EF37B
#_07B0B5: TAX

#_07B0B6: LDA.w ItemMagicCost_cost,X
#_07B0B9: STA.b $00

#_07B0BB: LDA.l $7EF36E
#_07B0BF: BEQ .not_enough_magic

#_07B0C1: SEC
#_07B0C2: SBC.b $00
#_07B0C4: CMP.b #$80
#_07B0C6: BCS .not_enough_magic

#_07B0C8: STA.l $7EF36E

#_07B0CC: SEC

#_07B0CD: RTS

;---------------------------------------------------------------------------------------------------

.not_enough_magic
#_07B0CE: LDA.b $02
#_07B0D0: CMP.b #$03
#_07B0D2: BEQ .fail

;---------------------------------------------------------------------------------------------------

#Link_DisplayNoMagicMessage:
#_07B0D4: LDA.b #$3C ; SFX2.3C
#_07B0D6: JSR PlaySFX_Set2

#_07B0D9: REP #$20

#_07B0DB: LDA.w #$007B ; MESSAGE 007B
#_07B0DE: STA.w $1CF0

#_07B0E1: SEP #$20

#_07B0E3: JSL Interface_PrepAndDisplayMessage

.fail
#_07B0E7: CLC

#_07B0E8: RTS

;===================================================================================================

Refund_Magic:
#_07B0E9: PHB
#_07B0EA: PHK
#_07B0EB: PLB

#_07B0EC: LDA.w ItemMagicCost_cost_offset,X
#_07B0EF: CLC
#_07B0F0: ADC.l $7EF37B
#_07B0F4: TAX

#_07B0F5: LDA.w ItemMagicCost_cost,X
#_07B0F8: STA.b $00

#_07B0FA: LDA.l $7EF36E
#_07B0FE: CLC
#_07B0FF: ADC.b $00
#_07B101: STA.l $7EF36E

#_07B105: PLB

#_07B106: RTL

;===================================================================================================

Link_ItemReset_FromOverworldThings:
#_07B107: STZ.w $030A

#_07B10A: STZ.b $3B

#_07B10C: STZ.w $0308
#_07B10F: STZ.w $0309
#_07B112: STZ.w $0376

#_07B115: LDA.b $50
#_07B117: AND.b #$FE
#_07B119: STA.b $50

#_07B11B: RTL

;===================================================================================================

Link_PerformThrow:
#_07B11C: LDA.w $0314
#_07B11F: ORA.w $02EC
#_07B122: BNE .actually_lifting

#_07B124: JSR Link_ResetSwordAndItemUsage

#_07B127: STZ.b $3B

;---------------------------------------------------------------------------------------------------

#_07B129: LDX.b #$0F

.next_sprite
#_07B12B: LDA.w $0DD0,X
#_07B12E: BEQ .free_spot

#_07B130: DEX
#_07B131: BPL .next_sprite

#_07B133: BRA .bounce_to_exit

;---------------------------------------------------------------------------------------------------

.free_spot
#_07B135: LDA.w $0368
#_07B138: CMP.b #$05
#_07B13A: BEQ .big_rock

#_07B13C: CMP.b #$06
#_07B13E: BNE .not_big_rock

.big_rock
#_07B140: LDA.b #$01
#_07B142: STA.w $0300

#_07B145: BRA .continue_a

;---------------------------------------------------------------------------------------------------

.not_big_rock
#_07B147: LDA.b $1B
#_07B149: BEQ .outdoors

#_07B14B: JSL Underworld_LiftAndReplaceLiftable

#_07B14F: BRA .continue_b

.outdoors
#_07B151: JSL Overworld_HandleLiftableTiles

;---------------------------------------------------------------------------------------------------

.continue_b
#_07B155: LDX.b #$08

.next_a
#_07B157: CMP.w LinkToss_liftable_tiles,X
#_07B15A: BEQ .matched

#_07B15C: DEX
#_07B15D: BPL .next_a

;---------------------------------------------------------------------------------------------------

.bounce_to_exit
#_07B15F: BRL EXIT_07B280

;---------------------------------------------------------------------------------------------------

.matched
#_07B162: LDA.b #$01
#_07B164: STA.w $0314

#_07B167: TXA
#_07B168: JSL Sprite_SpawnThrowableTerrain

#_07B16C: ASL.b $F6
#_07B16E: LSR.b $F6

.actually_lifting
#_07B170: STZ.w $0300

.continue_a
#_07B173: STZ.b $3A

#_07B175: LDA.w LinkToss_timer_a
#_07B178: STA.w $030B

#_07B17B: LDA.b #$01
#_07B17D: STA.w $0309

#_07B180: LDA.b #$80
#_07B182: STA.w $0308

#_07B185: STZ.w $030A

#_07B188: LDA.b #$0C
#_07B18A: STA.b $5E

#_07B18C: STZ.b $2E

#_07B18E: LDA.b $67
#_07B190: AND.b #$F0
#_07B192: STA.b $67

#_07B194: LDA.b #$01
#_07B196: TSB.b $50

;---------------------------------------------------------------------------------------------------

#EXIT_07B198:
#_07B198: RTS

;===================================================================================================

pool LinkToss

.timer_a
#_07B199: db $06, $07, $07

.timer_b
#_07B19C: db $05, $0A, $00, $17, $00, $12, $00, $12
#_07B1A4: db $00, $08, $00, $08, $00, $FE, $FF, $11
#_07B1AC: db $00

.liftable_tiles
#_07B1AD: db $54, $52, $50, $FF
#_07B1B1: db $51, $53, $55, $56
#_07B1B5: db $57

.heavy_lift_animation_timers
#_07B1B6: db   8,  24,   8,  24
#_07B1BA: db   8,  32,   6,   8
#_07B1BE: db  13,  13

.heavy_lift_animation_steps
#_07B1C0: db $00, $01, $00, $01
#_07B1C4: db $00, $01, $00, $01
#_07B1C8: db $02, $03

pool off

;===================================================================================================

Link_APress_LiftCarryThrow:
#_07B1CA: LDA.w $0308
#_07B1CD: BEQ EXIT_07B198

#_07B1CF: LDA.w $0309
#_07B1D2: AND.b #$02
#_07B1D4: BEQ .dont_toss

#_07B1D6: LDA.w $030B
#_07B1D9: CMP.b #$05
#_07B1DB: BCC .dont_toss

#_07B1DD: LDA.w LinkToss_timer_b
#_07B1E0: STA.w $030B

.dont_toss
#_07B1E3: LDA.w $0309
#_07B1E6: BEQ .skip_collision

#_07B1E8: JSR HaltLinkWhenUsingItems

.skip_collision
#_07B1EB: LDA.w $0309
#_07B1EE: AND.b #$01
#_07B1F0: BEQ .dont_reset_anim

#_07B1F2: STZ.b $2E
#_07B1F4: STZ.b $2D

#_07B1F6: LDA.b $67
#_07B1F8: AND.b #$F0
#_07B1FA: STA.b $67

.dont_reset_anim
#_07B1FC: DEC.w $030B

#_07B1FF: LDA.w $030B
#_07B202: BNE EXIT_07B198

#_07B204: LDA.w $0309
#_07B207: AND.b #$02
#_07B209: BEQ .dont_try_to_reset_strafe

#_07B20B: STZ.w $0308
#_07B20E: STZ.b $48
#_07B210: STZ.b $5E

#_07B212: LDA.b $5D
#_07B214: CMP.b #$18 ; LINKSTATE 18
#_07B216: BNE .reset_dirlock

#_07B218: LDA.b #$00 ; LINKSTATE 00
#_07B21A: STA.b $5D

#_07B21C: BRL .reset_dirlock

.dont_try_to_reset_strafe
#_07B21F: LDA.w $0300
#_07B222: BEQ .not_doing_heavy_lift

#_07B224: INC A
#_07B225: CMP.b #$09
#_07B227: BEQ .reset_dirlock

#_07B229: STA.w $0300

#_07B22C: TAX

#_07B22D: LDA.w LinkToss_heavy_lift_animation_timers,X
#_07B230: STA.w $030B

#_07B233: LDA.w LinkToss_heavy_lift_animation_steps,X
#_07B236: STA.w $030A

#_07B239: CPX.b #$06
#_07B23B: BNE EXIT_07B280

#_07B23D: STZ.w $0B9C

#_07B240: LDA.b $1B
#_07B242: BEQ .throwing_out_doors

#_07B244: JSL Underworld_LiftAndReplaceLiftable

#_07B248: BRA .continue_indoors

.throwing_out_doors
#_07B24A: JSL Overworld_HandleLiftableTiles

;---------------------------------------------------------------------------------------------------

.continue_indoors
#_07B24E: AND.b #$0F
#_07B250: INC A
#_07B251: PHA

#_07B252: LDA.b #$18 ; LINKSTATE 18
#_07B254: STA.b $5D

#_07B256: LDA.b #$01
#_07B258: STA.w $0314

#_07B25B: PLA
#_07B25C: JSL Sprite_SpawnThrowableTerrain

#_07B260: ASL.b $F6
#_07B262: LSR.b $F6

#_07B264: BRA EXIT_07B280

;---------------------------------------------------------------------------------------------------

.not_doing_heavy_lift
#_07B266: LDX.w $030A
#_07B269: INX

#_07B26A: LDA.w LinkToss_timer_a,X
#_07B26D: STA.w $030B

#_07B270: STX.w $030A

#_07B273: CPX.b #$03
#_07B275: BNE EXIT_07B280

;---------------------------------------------------------------------------------------------------

.reset_dirlock
#_07B277: STZ.w $0309

#_07B27A: LDA.b $50
#_07B27C: AND.b #$FE
#_07B27E: STA.b $50

;---------------------------------------------------------------------------------------------------

#EXIT_07B280:
#_07B280: RTS

;===================================================================================================

Link_PerformDash:
#_07B281: LDA.w $02F5
#_07B284: BNE EXIT_07B280

#_07B286: LDA.w $0314
#_07B289: ORA.w $02EC
#_07B28C: BNE EXIT_07B280

#_07B28E: BIT.w $0308
#_07B291: BMI EXIT_07B280

#_07B293: LDA.b $1B
#_07B295: BNE .pointless_branch

.pointless_branch
#_07B297: STZ.b $3B

#_07B299: LDA.b #$1D
#_07B29B: STA.w $0374

#_07B29E: LDA.b #$40
#_07B2A0: STA.w $02F1

#_07B2A3: LDA.b #$11 ; LINKSTATE 11
#_07B2A5: STA.b $5D

#_07B2A7: LDA.b #$01
#_07B2A9: STA.w $0372

#_07B2AC: LDA.b $3A
#_07B2AE: AND.b #$80
#_07B2B0: STA.b $3A

#_07B2B2: STZ.w $0308
#_07B2B5: STZ.w $0301

#_07B2B8: STZ.b $48
#_07B2BA: STZ.b $6B

;---------------------------------------------------------------------------------------------------

#_07B2BC: LDA.l $7EF3CC
#_07B2C0: TAX

#_07B2C1: CMP.w FollowerReactionToDashing,X
#_07B2C4: BNE Link_APress_NothingB

#_07B2C6: STZ.b $5E

#_07B2C8: LDX.w $02CF

#_07B2CB: LDA.w $1A00,X
#_07B2CE: STA.w $7EF3CD

#_07B2D1: LDA.w $1A14,X
#_07B2D4: STA.w $7EF3CE

#_07B2D7: LDA.w $1A28,X
#_07B2DA: STA.w $7EF3CF

#_07B2DD: LDA.w $1A3C,X
#_07B2E0: STA.w $7EF3D0

#_07B2E3: LDA.b $EE
#_07B2E5: STA.w $7EF3D2

#_07B2E8: LDA.b #$40
#_07B2EA: STA.w $02D2

;===================================================================================================

Link_APress_NothingB:
#_07B2ED: RTS

;===================================================================================================

Link_PerformGrab:
#_07B2EE: LDA.b $3A
#_07B2F0: AND.b #$80
#_07B2F2: BEQ .no_press

#_07B2F4: LDA.b $3C
#_07B2F6: CMP.b #$09
#_07B2F8: BCS Link_APress_NothingB

.no_press
#_07B2FA: LDA.b #$01
#_07B2FC: STA.w $0376

#_07B2FF: TSB.b $50

#_07B301: STZ.b $2E
#_07B303: STZ.w $030A

#_07B306: LDA.w LinkStrain_timer

#_07B309: STA.w $030B
#_07B30C: STZ.w $030D

#_07B30F: RTS

;===================================================================================================

LinkPull_Directions:
#_07B310: db $04
#_07B311: db $08
#_07B312: db $01
#_07B313: db $02

;===================================================================================================

LinkStrain:
.timer
#_07B314: db   0,   5,   5,  12,   5,   5,  12

.char
#_07B31B: db $00, $01, $02, $03, $01, $02, $03

;===================================================================================================

Link_APress_PullObject:
#_07B322: LDA.b $67
#_07B324: AND.b #$F0
#_07B326: STA.b $67

#_07B328: LDA.b $2F
#_07B32A: LSR A
#_07B32B: TAX

#_07B32C: LDA.b $F0
#_07B32E: AND.b #$0F
#_07B330: BEQ .no_dpad

#_07B332: AND.w LinkPull_Directions,X
#_07B335: BNE .tick_timer

.no_dpad
#_07B337: LDX.b #$00
#_07B339: BRA .set_strain_index

;---------------------------------------------------------------------------------------------------

.tick_timer
#_07B33B: DEC.w $030B
#_07B33E: BPL .timer_running

;---------------------------------------------------------------------------------------------------

#_07B340: LDX.w $030D
#_07B343: INX
#_07B344: CPX.b #$07
#_07B346: BNE .set_strain_index

#_07B348: LDX.b #$01

.set_strain_index
#_07B34A: STX.w $030D

#_07B34D: LDA.w LinkStrain_char,X
#_07B350: STA.w $030A

#_07B353: LDA.w LinkStrain_timer,X
#_07B356: STA.w $030B

;---------------------------------------------------------------------------------------------------

.timer_running
#_07B359: LDA.b $F2
#_07B35B: AND.b #$80
#_07B35D: BNE .exit

#_07B35F: STZ.w $030D
#_07B362: STZ.w $030A

#_07B365: STZ.w $0376

#_07B368: STZ.b $3B

#_07B36A: LDA.b $50
#_07B36C: AND.b #$FE
#_07B36E: STA.b $50

.exit
#_07B370: RTS

;===================================================================================================

Link_PerformStatueDrag:
#_07B371: LDA.b #$02
#_07B373: STA.w $0376

#_07B376: LDA.b #$01
#_07B378: TSB.b $50

#_07B37A: STZ.b $2E
#_07B37C: STZ.w $030A

#_07B37F: LDA.w LinkStrain_timer
#_07B382: STA.w $030B
#_07B385: STZ.w $030D

#_07B388: RTS

;===================================================================================================

Link_APress_StatueDrag:
#_07B389: LDA.b #$14
#_07B38B: STA.b $5E

#_07B38D: LDA.b $2F
#_07B38F: LSR A
#_07B390: TAX

#_07B391: LDA.b $F0
#_07B393: AND.b #$0F
#_07B395: BEQ .halted

#_07B397: AND.w LinkPull_Directions,X
#_07B39A: BNE .dragging

;---------------------------------------------------------------------------------------------------

.halted
#_07B39C: STZ.b $67

#_07B39E: STZ.b $30
#_07B3A0: STZ.b $31
#_07B3A2: STZ.b $2E

#_07B3A4: LDX.b #$00
#_07B3A6: BRA .set_strain_index

;---------------------------------------------------------------------------------------------------

.dragging
#_07B3A8: STA.b $67

#_07B3AA: DEC.w $030B
#_07B3AD: BPL .delay

#_07B3AF: LDX.w $030D
#_07B3B2: INX
#_07B3B3: CPX.b #$07
#_07B3B5: BNE .set_strain_index

#_07B3B7: LDX.b #$01

;---------------------------------------------------------------------------------------------------

.set_strain_index
#_07B3B9: STX.w $030D

#_07B3BC: LDA.w LinkStrain_char,X
#_07B3BF: STA.w $030A

#_07B3C2: LDA.w LinkStrain_timer,X
#_07B3C5: STA.w $030B

;---------------------------------------------------------------------------------------------------

.delay
#_07B3C8: LDA.b $F2
#_07B3CA: AND.b #$80
#_07B3CC: BNE .exit

#_07B3CE: STZ.b $5E

#_07B3D0: STZ.w $02FA

#_07B3D3: STZ.w $030D
#_07B3D6: STZ.w $030A

#_07B3D9: STZ.w $0376

#_07B3DC: STZ.b $3B

#_07B3DE: LDA.b $50
#_07B3E0: AND.b #$FE
#_07B3E2: STA.b $50

.exit
#_07B3E4: RTS

;===================================================================================================

Link_PerformRupeePull:
#_07B3E5: LDA.b $2F
#_07B3E7: BNE Link_APress_RupeePull

#_07B3E9: JSL Link_ResetProperties_A

#_07B3ED: LDA.b #$02
#_07B3EF: STA.w $0376

#_07B3F2: TSB.b $50

#_07B3F4: STZ.b $2E
#_07B3F6: STZ.w $030A

#_07B3F9: LDA.w LinkStrain_timer
#_07B3FC: STA.w $030B

#_07B3FF: STZ.w $030D

#_07B402: LDA.b #$1D ; LINKSTATE 1D
#_07B404: STA.b $5D

#_07B406: STZ.b $27
#_07B408: STZ.b $28
#_07B40A: STZ.b $3A

;===================================================================================================

Link_APress_RupeePull:
#_07B40C: RTS

;===================================================================================================

pool LinkState_TreePull

.step
#_07B40D: db $00, $01, $02, $03
#_07B411: db $04, $00, $01, $02
#_07B415: db $03

pool off

;---------------------------------------------------------------------------------------------------

LinkState_TreePull:
#_07B416: JSR CacheCameraPropertiesIfOutdoors

#_07B419: LDA.b $4D
#_07B41B: BEQ .not_recoiling

#_07B41D: BRL HandleLink_From1D

;---------------------------------------------------------------------------------------------------

.not_recoiling
#_07B420: LDA.w $0376
#_07B423: BEQ .strain_adjusted

#_07B425: LDA.b $3A
#_07B427: BNE .continue

#_07B429: BIT.b $F2
#_07B42B: BPL .no_a_press

#_07B42D: LDA.b $F0
#_07B42F: AND.b #$04
#_07B431: BEQ .dont_adjust_strain

#_07B433: STA.b $3A

#_07B435: LDA.b #$22 ; SFX2.22
#_07B437: JSR PlaySFX_Set2

#_07B43A: BRA .continue

;---------------------------------------------------------------------------------------------------

.no_a_press
#_07B43C: STZ.w $0376
#_07B43F: STZ.w $030D

#_07B442: LDA.b #$02
#_07B444: STA.w $030B
#_07B447: STZ.w $030A

#_07B44A: STZ.b $50

#_07B44C: LDA.b #$00 ; LINKSTATE 00
#_07B44E: STA.b $5D

#_07B450: BRA .reset_state

;---------------------------------------------------------------------------------------------------

.continue
#_07B452: DEC.w $030B
#_07B455: BPL .dont_adjust_strain

#_07B457: INC.w $030D

#_07B45A: LDX.w $030D

#_07B45D: LDA.w LinkStrain_char,X
#_07B460: STA.w $030A

#_07B463: LDA.w LinkStrain_timer,X
#_07B466: STA.w $030B

#_07B469: CPX.b #$07
#_07B46B: BNE .dont_adjust_strain

;---------------------------------------------------------------------------------------------------

#_07B46D: STZ.w $0376
#_07B470: STZ.w $030D

#_07B473: LDA.b #$02
#_07B475: STA.w $030B
#_07B478: STZ.w $030A

#_07B47B: LDA.b #$01
#_07B47D: STA.w $0308
#_07B480: STZ.w $0309

#_07B483: BRA .strain_adjusted

;---------------------------------------------------------------------------------------------------

.dont_adjust_strain
#_07B485: BRA .finish_up

;---------------------------------------------------------------------------------------------------

.strain_adjusted
#_07B487: LDA.b $48
#_07B489: AND.b #$09
#_07B48B: BNE .reset_direction_and_state

#_07B48D: LDA.w $030D
#_07B490: CMP.b #$09
#_07B492: BNE .add_dust

#_07B494: LDA.b $F4
#_07B496: AND.b #$0F
#_07B498: BEQ .no_new_direction_press

;---------------------------------------------------------------------------------------------------

.reset_state
#_07B49A: LDA.b #$00 ; LINKSTATE 00
#_07B49C: STA.b $5D

#_07B49E: BRL LinkState_Default

;---------------------------------------------------------------------------------------------------

.add_dust
#_07B4A1: LDY.b #$00
#_07B4A3: LDA.b #$1E ; ANCILLA 1E
#_07B4A5: JSL AncillaAdd_DashDust_charging

#_07B4A9: DEC.w $030B
#_07B4AC: BPL .delay_reset

#_07B4AE: INC.w $030D

#_07B4B1: LDX.w $030D

#_07B4B4: LDA.b #$02
#_07B4B6: STA.w $030B

#_07B4B9: LDA.w .step,X
#_07B4BC: STA.w $030A

#_07B4BF: LDA.b #$30
#_07B4C1: STA.b $27

#_07B4C3: CPX.b #$09

#_07B4C5: BNE .delay_reset

;---------------------------------------------------------------------------------------------------

.reset_direction_and_state
#_07B4C7: STZ.b $2F
#_07B4C9: STZ.w $0308

#_07B4CC: STZ.b $50

#_07B4CE: LDA.b #$00 ; LINKSTATE 00
#_07B4D0: STA.b $5D

#_07B4D2: BRA .exit

;---------------------------------------------------------------------------------------------------

.delay_reset
#_07B4D4: JSR Flag67WithDirections

#_07B4D7: LDA.b $67
#_07B4D9: AND.b #$03
#_07B4DB: BNE .is_horizontal

#_07B4DD: STZ.b $28

.is_horizontal
#_07B4DF: LDA.b $67
#_07B4E1: AND.b #$0C
#_07B4E3: BNE .finish_up

#_07B4E5: STZ.b $27

;---------------------------------------------------------------------------------------------------

.finish_up
#_07B4E7: JSL LinkHop_FindArbitraryLandingSpot

.no_new_direction_press
#_07B4EB: JSR Link_HandleCardinalCollision
#_07B4EE: JSR HandleIndoorCameraAndDoors

.exit
#_07B4F1: RTS

;===================================================================================================

Link_PerformRead:
#_07B4F2: REP #$30

#_07B4F4: LDA.b $1B
#_07B4F6: AND.w #$00FF
#_07B4F9: BEQ .overworld

.underworld
#_07B4FB: LDA.b $A0
#_07B4FD: ASL A
#_07B4FE: TAY

#_07B4FF: LDA.w SignText_Underworld,Y
#_07B502: BRA .set_message

;---------------------------------------------------------------------------------------------------

.overworld
#_07B504: LDA.l $7EF3C5
#_07B508: AND.w #$00FF
#_07B50B: CMP.w #$0002
#_07B50E: BCS .rain_over

#_07B510: LDA.w #$003A ; MESSAGE 003A
#_07B513: BRA .set_message

;---------------------------------------------------------------------------------------------------

.rain_over
#_07B515: LDA.b $8A
#_07B517: ASL A
#_07B518: TAY

#_07B519: LDA.w SignText_Overworld,Y

.set_message
#_07B51C: STA.w $1CF0

#_07B51F: SEP #$30

#_07B521: JSL Interface_PrepAndDisplayMessage

#_07B525: STZ.b $3B

;===================================================================================================

Link_APress_NothingC:
#_07B527: RTS

;===================================================================================================

pool Link_PerformOpenChest

.overflow_replacement
#_07B528: db $FF ; FIGHTER SWORD
#_07B529: db $FF ; MASTER SWORD
#_07B52A: db $FF ; TEMPERED SWORD
#_07B52B: db $FF ; BUTTER SWORD
#_07B52C: db $FF ; FIGHTER SHIELD
#_07B52D: db $FF ; FIRE SHIELD
#_07B52E: db $FF ; MIRROR SHIELD
#_07B52F: db $FF ; FIRE ROD
#_07B530: db $FF ; ICE ROD
#_07B531: db $FF ; HAMMER
#_07B532: db $FF ; HOOKSHOT
#_07B533: db $FF ; BOW
#_07B534: db $44 ; BOOMERANG => 10 arrows (ITEMGET 44)
#_07B535: db $FF ; POWDER
#_07B536: db $FF ; BOTTLE REFILL (BEE)
#_07B537: db $FF ; BOMBOS
#_07B538: db $FF ; ETHER
#_07B539: db $FF ; QUAKE
#_07B53A: db $35 ; LAMP => Blue rupee (ITEMGET 35)
#_07B53B: db $FF ; SHOVEL
#_07B53C: db $FF ; FLUTE
#_07B53D: db $FF ; SOMARIA
#_07B53E: db $FF ; BOTTLE
#_07B53F: db $FF ; HEART PIECE
#_07B540: db $FF ; BYRNA
#_07B541: db $FF ; CAPE
#_07B542: db $FF ; MIRROR
#_07B543: db $FF ; GLOVE
#_07B544: db $FF ; MITTS
#_07B545: db $FF ; BOOK
#_07B546: db $FF ; FLIPPERS
#_07B547: db $FF ; PEARL
#_07B548: db $FF ; CRYSTAL
#_07B549: db $FF ; NET
#_07B54A: db $FF ; BLUE MAIL
#_07B54B: db $FF ; RED MAIL
#_07B54C: db $FF ; SMALL KEY
#_07B54D: db $FF ; COMPASS
#_07B54E: db $FF ; HEART CONTAINER FROM 4/4
#_07B54F: db $FF ; BOMB
#_07B550: db $FF ; 3 BOMBS
#_07B551: db $FF ; MUSHROOM
#_07B552: db $46 ; RED BOOMERANG => 300 rupees (ITEMGET 46)
#_07B553: db $FF ; FULL BOTTLE (RED)
#_07B554: db $FF ; FULL BOTTLE (GREEN)
#_07B555: db $FF ; FULL BOTTLE (BLUE)
#_07B556: db $FF ; POTION REFILL (RED)
#_07B557: db $FF ; POTION REFILL (GREEN)
#_07B558: db $FF ; POTION REFILL (BLUE)
#_07B559: db $FF ; 10 BOMBS
#_07B55A: db $FF ; BIG KEY
#_07B55B: db $FF ; MAP
#_07B55C: db $FF ; 1 RUPEE
#_07B55D: db $FF ; 5 RUPEES
#_07B55E: db $FF ; 20 RUPEES
#_07B55F: db $FF ; GREEN PENDANT
#_07B560: db $FF ; BLUE PENDANT
#_07B561: db $FF ; RED PENDANT
#_07B562: db $FF ; TOSSED BOW
#_07B563: db $FF ; SILVERS
#_07B564: db $FF ; FULL BOTTLE (BEE)
#_07B565: db $FF ; FULL BOTTLE (FAIRY)
#_07B566: db $FF ; BOSS HC
#_07B567: db $FF ; SANC HC
#_07B568: db $FF ; 100 RUPEES
#_07B569: db $FF ; 50 RUPEES
#_07B56A: db $FF ; HEART
#_07B56B: db $FF ; ARROW
#_07B56C: db $FF ; 10 ARROWS
#_07B56D: db $FF ; SMALL MAGIC
#_07B56E: db $FF ; 300 RUPEES
#_07B56F: db $FF ; 20 RUPEES GREEN
#_07B570: db $FF ; FULL BOTTLE (GOOD BEE)
#_07B571: db $FF ; TOSSED FIGHTER SWORD
#_07B572: db $FF ; FLUTE (ACTIVATED)
#_07B573: db $FF ; BOOTS

pool off

;---------------------------------------------------------------------------------------------------

Link_PerformOpenChest:
#_07B574: LDA.b $2F
#_07B576: BNE EXIT_07B5BF

#_07B578: LDA.w $02E9
#_07B57B: BNE EXIT_07B5BF

#_07B57D: LDA.b $4D
#_07B57F: BNE EXIT_07B5BF

#_07B581: STZ.b $3B

#_07B583: LDA.b $76
#_07B585: JSL OpenChestForItem
#_07B589: BCC .failed_to_open

#_07B58B: LDA.b #$01
#_07B58D: STA.w $02E9

#_07B590: LDY.b $0C
#_07B592: BMI .failed_to_open

#_07B594: LDA.w .overflow_replacement,Y
#_07B597: STA.b $03

#_07B599: CMP.b #$FF
#_07B59B: BEQ .no_replacement

#_07B59D: TYA
#_07B59E: ASL A
#_07B59F: TAX

#_07B5A0: LDA.l AncillaAdd_ItemReceipt_sram_write+0,X
#_07B5A4: STA.b $00

#_07B5A6: LDA.l AncillaAdd_ItemReceipt_sram_write+1,X
#_07B5AA: STA.b $01

#_07B5AC: LDA.b #$7E
#_07B5AE: STA.b $02

#_07B5B0: LDA.b [$00]
#_07B5B2: BEQ .no_replacement

#_07B5B4: LDY.b $03

.no_replacement
#_07B5B6: JSL Link_ReceiveItem

#_07B5BA: BRA EXIT_07B5BF

.failed_to_open
#_07B5BC: STZ.w $02E9

;---------------------------------------------------------------------------------------------------

#EXIT_07B5BF:
#_07B5BF: RTS

;===================================================================================================

Link_CheckNewAPress:
#_07B5C0: LDA.b $3B
#_07B5C2: AND.b #$80
#_07B5C4: BNE .fail

#_07B5C6: LDA.b $46
#_07B5C8: BNE .fail

#_07B5CA: LDA.b $F6
#_07B5CC: AND.b #$80
#_07B5CE: BEQ .fail

#_07B5D0: TSB.b $3B

#_07B5D2: SEC

#_07B5D3: RTS

.fail
#_07B5D4: CLC

#_07B5D5: RTS

;===================================================================================================

Link_HandleToss:
#_07B5D6: LDA.b $3B
#_07B5D8: AND.b #$80
#_07B5DA: BEQ .unpressed

#_07B5DC: LDA.b $F6
#_07B5DE: AND.b #$80
#_07B5E0: BEQ .unpressed

#_07B5E2: LDA.w $0309
#_07B5E5: AND.b #$01
#_07B5E7: BNE .unpressed

#_07B5E9: STZ.w $030D ; reset grab
#_07B5EC: STZ.w $030E
#_07B5EF: STZ.w $030A

#_07B5F2: STZ.b $3B

#_07B5F4: LDA.b $50
#_07B5F6: AND.b #$FE
#_07B5F8: STA.b $50

#_07B5FA: LDA.w $0305
#_07B5FD: CMP.b #$01
#_07B5FF: BNE .leave_windows

#_07B601: STZ.b $1E
#_07B603: STZ.b $1F

.leave_windows
#_07B605: SEC

#_07B606: RTS

.unpressed
#_07B607: CLC

#_07B608: RTS

;===================================================================================================

UNREACHABLE_07B609:
#_07B609: LDA.b $F2
#_07B60B: AND.b #$10
#_07B60D: BNE .r_held

#_07B60F: STZ.b $3B

.r_held
#_07B611: BIT.b $F0
#_07B613: BMI .a_held

#_07B615: LDA.b $3A
#_07B617: AND.b #$DF
#_07B619: STA.b $3A

.a_held
#_07B61B: LDA.b $3B
#_07B61D: AND.b #$10
#_07B61F: STA.b $00

#_07B621: LDA.b $3A
#_07B623: AND.b #$A0
#_07B625: ORA.b $00
#_07B627: AND.b #$B0
#_07B629: CMP.b #$30
#_07B62B: BEQ .fail

#_07B62D: CMP.b #$90
#_07B62F: BEQ .fail

#_07B631: LDA.b $F2
#_07B633: AND.b #$10
#_07B635: BEQ .fail

#_07B637: STA.b $00

#_07B639: LDA.b $F0
#_07B63B: AND.b #$80
#_07B63D: BEQ .fail

#_07B63F: LSR A
#_07B640: LSR A
#_07B641: STA.b $3A

#_07B643: LDA.b $00
#_07B645: TSB.b $3B

#_07B647: SEC

#_07B648: RTS

.fail
#_07B649: CLC

#_07B64A: RTS

;===================================================================================================

StoppedFlags:
#_07B64B: db $07
#_07B64C: db $0B
#_07B64D: db $0D
#_07B64E: db $0E

;---------------------------------------------------------------------------------------------------

Link_HandleDiagonalCollision:
#_07B64F: JSR CheckIfRoomNeedsDoubleLayerCheck
#_07B652: BCC .no_layer_change

#_07B654: JSR FlagObstructions
#_07B657: JSR CreateVelocityFromMovingBackground

.no_layer_change
#_07B65A: LDA.b $67
#_07B65C: AND.b #$0F
#_07B65E: STA.b $67

;===================================================================================================

FlagObstructions:
#_07B660: LDA.b #$0F
#_07B662: STA.b $42
#_07B664: STA.b $43

#_07B666: STZ.b $6A

#_07B668: LDA.b $67
#_07B66A: AND.b #$0C
#_07B66C: BNE FlagObstructions_vertical_component

#_07B66E: BRL Link_UpdateDiagonalMovementFlags

;===================================================================================================

FlagObstructions_vertical_component:
#_07B671: INC.b $6A

#_07B673: LDY.b #$00

#_07B675: AND.b #$08
#_07B677: BNE .walking_up

#_07B679: LDY.b #$02

.walking_up
#_07B67B: TYA
#_07B67C: LSR A
#_07B67D: STA.b $66

#_07B67F: JSR TileDetect_Movement_VerticalSlopes

#_07B682: LDA.b $0E
#_07B684: AND.b #$30
#_07B686: BEQ .no_obstruction

#_07B688: LDA.b $62
#_07B68A: AND.b #$02
#_07B68C: BNE .no_obstruction

#_07B68E: LDA.b $0E
#_07B690: AND.b #$30
#_07B692: LSR A
#_07B693: LSR A
#_07B694: LSR A
#_07B695: LSR A
#_07B696: AND.b $67
#_07B698: BNE .no_obstruction

#_07B69A: LDY.b #$02

#_07B69C: LDA.b $67
#_07B69E: AND.b #$03
#_07B6A0: BEQ .no_obstruction

#_07B6A2: AND.b #$02
#_07B6A4: BNE .going_diagonal

#_07B6A6: LDY.b #$03
#_07B6A8: BRA .going_diagonal

.no_obstruction
#_07B6AA: LDA.w $046C
#_07B6AD: BEQ .no_layer_junk

#_07B6AF: LDA.b $0E
#_07B6B1: AND.b #$03
#_07B6B3: BNE .dont_use_last_direction_yet
#_07B6B5: BRA FlagObstructions_horizontal_component

.no_layer_junk
#_07B6B7: LDA.b $4D
#_07B6B9: BEQ .dont_use_last_direction_yet

#_07B6BB: LDA.b $0C
#_07B6BD: AND.b #$03
#_07B6BF: BEQ .dont_use_last_direction_yet
#_07B6C1: BRA .flag_based_on_last_direction

.dont_use_last_direction_yet
#_07B6C3: LDA.b $0E
#_07B6C5: AND.b #$03
#_07B6C7: BEQ FlagObstructions_horizontal_component

#_07B6C9: STZ.b $6B

#_07B6CB: LDA.w $034A
#_07B6CE: BEQ .flag_based_on_last_direction

#_07B6D0: LDA.w $02E8
#_07B6D3: AND.b #$03
#_07B6D5: BNE .flag_based_on_last_direction

#_07B6D7: LDA.b $67
#_07B6D9: AND.b #$03
#_07B6DB: BEQ .flag_based_on_last_direction

#_07B6DD: STZ.w $033C
#_07B6E0: STZ.w $033D
#_07B6E3: STZ.w $032F
#_07B6E6: STZ.w $0330
#_07B6E9: STZ.w $032B
#_07B6EC: STZ.w $032C
#_07B6EF: STZ.w $0334
#_07B6F2: STZ.w $0335

.flag_based_on_last_direction
#_07B6F5: LDA.b #$01
#_07B6F7: STA.w $0302

#_07B6FA: LDY.b $66

.going_diagonal
#_07B6FC: LDA.w StoppedFlags,Y
#_07B6FF: STA.b $42

;===================================================================================================

FlagObstructions_horizontal_component:
#_07B701: LDA.b $67
#_07B703: AND.b #$03
#_07B705: BNE .moving_horizontally

#_07B707: BRL Link_UpdateDiagonalMovementFlags

.moving_horizontally
#_07B70A: INC.b $6A

#_07B70C: LDY.b #$04
#_07B70E: AND.b #$02
#_07B710: BNE .moving_left

#_07B712: LDY.b #$06

.moving_left
#_07B714: TYA
#_07B715: LSR A
#_07B716: STA.b $66

#_07B718: JSR TileDetect_Movement_HorizontalSlopes

#_07B71B: LDA.b $0E
#_07B71D: AND.b #$30
#_07B71F: BEQ .no_obstruction

#_07B721: LDA.b $62
#_07B723: AND.b #$02
#_07B725: BEQ .no_obstruction

#_07B727: LDA.b $0E
#_07B729: AND.b #$30
#_07B72B: LSR A
#_07B72C: LSR A
#_07B72D: AND.b $67
#_07B72F: BNE .no_obstruction

#_07B731: LDY.b #$00

#_07B733: LDA.b $67
#_07B735: AND.b #$0C
#_07B737: BEQ .no_obstruction

#_07B739: AND.b #$08
#_07B73B: BNE .going_diagonal

#_07B73D: LDY.b #$01
#_07B73F: BRA .going_diagonal

.no_obstruction
#_07B741: LDA.w $046C
#_07B744: BEQ .no_layer_junk

#_07B746: LDA.b $0E
#_07B748: AND.b #$03
#_07B74A: BNE .dont_use_last_direction_yet
#_07B74C: BRA .adjust_move_flags_with_obstruction

.no_layer_junk
#_07B74E: LDA.b $4D
#_07B750: BEQ .dont_use_last_direction_yet

#_07B752: LDA.b $0C
#_07B754: AND.b #$03
#_07B756: BEQ .dont_use_last_direction_yet
#_07B758: BRA .flag_based_on_last_direction

.dont_use_last_direction_yet
#_07B75A: LDA.b $0E
#_07B75C: AND.b #$03
#_07B75E: BEQ .adjust_move_flags_with_obstruction

#_07B760: STZ.b $6B

#_07B762: LDA.w $034A
#_07B765: BEQ .flag_based_on_last_direction

#_07B767: LDA.w $02E8
#_07B76A: AND.b #$03
#_07B76C: BNE .flag_based_on_last_direction

#_07B76E: LDA.b $67
#_07B770: AND.b #$0C
#_07B772: BEQ .flag_based_on_last_direction

#_07B774: STZ.w $033E
#_07B777: STZ.w $033F
#_07B77A: STZ.w $0331
#_07B77D: STZ.w $0332
#_07B780: STZ.w $032D
#_07B783: STZ.w $032E
#_07B786: STZ.w $0336
#_07B789: STZ.w $0337

.flag_based_on_last_direction
#_07B78C: LDA.b #$01
#_07B78E: STA.w $0302

#_07B791: LDY.b $66

.going_diagonal
#_07B793: LDA.w StoppedFlags,Y
#_07B796: STA.b $43

.adjust_move_flags_with_obstruction
#_07B798: LDA.b $67
#_07B79A: AND.b $42
#_07B79C: AND.b $43
#_07B79E: STA.b $67

;===================================================================================================

Link_UpdateDiagonalMovementFlags:
#_07B7A0: LDA.b $67
#_07B7A2: AND.b #$0F
#_07B7A4: BEQ .dont_update_direction

#_07B7A6: LDA.b $6B
#_07B7A8: AND.b #$0F
#_07B7AA: BEQ .dont_update_direction

#_07B7AC: STA.b $67

.dont_update_direction
#_07B7AE: LDA.b $6A

#_07B7B0: STZ.b $6A

#_07B7B2: CMP.b #$02
#_07B7B4: BNE .exit

#_07B7B6: LDY.b #$01

#_07B7B8: LDA.b $2F
#_07B7BA: AND.b #$04
#_07B7BC: BEQ .not_facing_left

#_07B7BE: LDY.b #$02

.not_facing_left
#_07B7C0: STY.b $6A

.exit
#_07B7C2: RTS

;===================================================================================================

AutoMove49Directions:
#_07B7C3: db $08
#_07B7C4: db $04
#_07B7C5: db $02
#_07B7C6: db $01

;===================================================================================================

Link_HandleCardinalCollision:
#_07B7C7: STZ.b $6E
#_07B7C9: STZ.b $38

#_07B7CB: LDA.b $6B
#_07B7CD: AND.b #$30
#_07B7CF: BNE .no_kickback

#_07B7D1: JSR Link_HandleDiagonalKickback

#_07B7D4: LDA.b $6D
#_07B7D6: BEQ .no_kickback

#_07B7D8: BRL CheckCollisionSingleLayerRun

;---------------------------------------------------------------------------------------------------

.no_kickback
#_07B7DB: JSR CheckIfRoomNeedsDoubleLayerCheck
#_07B7DE: BCC CheckCollisionSingleLayerRun

#_07B7E0: LDA.w $046C
#_07B7E3: CMP.b #$02
#_07B7E5: BCC .run_vertical_first

#_07B7E7: LDA.w $046C
#_07B7EA: CMP.b #$03
#_07B7EC: BEQ .run_vertical_first

#_07B7EE: LDA.b #$02
#_07B7F0: STA.w $0315

#_07B7F3: REP #$20

#_07B7F5: JSR TileDetect_BigArea

#_07B7F8: SEP #$20

#_07B7FA: LDA.b $0E
#_07B7FC: STA.w $0316
#_07B7FF: BEQ .run_vertical_first

#_07B801: LDA.b $30
#_07B803: STA.b $00

#_07B805: CLC
#_07B806: ADC.w $0310
#_07B809: STA.b $30

#_07B80B: LDA.b $31
#_07B80D: STA.b $01

#_07B80F: CLC
#_07B810: ADC.w $0312
#_07B813: STA.b $31

#_07B815: LDA.b $0E
#_07B817: CMP.b #$0C
#_07B819: BEQ .run_vertical_first

#_07B81B: CMP.b #$03
#_07B81D: BEQ .run_vertical_first

#_07B81F: CMP.b #$0A
#_07B821: BEQ .run_horizontal_first

#_07B823: CMP.b #$05
#_07B825: BEQ .run_horizontal_first

#_07B827: AND.b #$0C
#_07B829: BNE .detected_on_axis

#_07B82B: LDA.b $0E
#_07B82D: AND.b #$03
#_07B82F: BNE .detected_on_axis

#_07B831: BRA .run_vertical_first

.detected_on_axis
#_07B833: LDA.b $00
#_07B835: BNE .run_horizontal_first

#_07B837: LDA.b $01
#_07B839: BEQ .run_vertical_first

#_07B83B: LDA.w $0310
#_07B83E: BPL .run_horizontal_first

.run_vertical_first
#_07B840: JSR RunSlopeCollisionChecks_VerticalFirst
#_07B843: BRA .continue

.run_horizontal_first
#_07B845: JSR RunSlopeCollisionChecks_HorizontalFirst

.continue
#_07B848: JSR CreateVelocityFromMovingBackground

;===================================================================================================

CheckCollisionSingleLayerRun:
#_07B84B: LDA.w $046C
#_07B84E: CMP.b #$02
#_07B850: BEQ CheckCollisionWithMovingWallLayer

#_07B852: CMP.b #$03
#_07B854: BEQ FlagAndRunSlopeChecks_HorizontalFirst

#_07B856: CMP.b #$04
#_07B858: BEQ FlagAndRunSlopeChecks_VerticalFirst

#_07B85A: LDA.b $30
#_07B85C: ORA.b $31
#_07B85E: BNE FlagAndRunSlopeChecks_VerticalFirst

#_07B860: LDA.b $5D
#_07B862: CMP.b #$13 ; LINKSTATE 13
#_07B864: BEQ .skip_pit_stuff

#_07B866: CMP.b #$08 ; LINKSTATE 08
#_07B868: BEQ .skip_pit_stuff

#_07B86A: CMP.b #$09 ; LINKSTATE 09
#_07B86C: BEQ .skip_pit_stuff

#_07B86E: CMP.b #$0A ; LINKSTATE 0A
#_07B870: BEQ .skip_pit_stuff

#_07B872: CMP.b #$03 ; LINKSTATE 03
#_07B874: BEQ .skip_pit_stuff

#_07B876: JSR TileDetect_BigArea

#_07B879: LDA.b $59
#_07B87B: AND.b #$0F
#_07B87D: BEQ .skip_pit_stuff

#_07B87F: LDA.b #$01 ; LINKSTATE 01
#_07B881: STA.b $5D

#_07B883: LDA.w $0372
#_07B886: BNE .skip_pit_stuff

#_07B888: LDA.b #$04
#_07B88A: STA.b $5E

.skip_pit_stuff
#_07B88C: BRL CalculateSaveFlagVelocity

;===================================================================================================

CheckCollisionWithMovingWallLayer:
#_07B88F: JSR TileDetect_BigArea

#_07B892: LDA.b $0E
#_07B894: ORA.w $0316
#_07B897: CMP.b #$0F
#_07B899: BNE FlagAndRunSlopeChecks_VerticalFirst

#_07B89B: LDA.w $031F
#_07B89E: BNE .actively_blinking

#_07B8A0: LDA.b #$3A
#_07B8A2: STA.w $031F

.actively_blinking
#_07B8A5: LDA.b $67
#_07B8A7: BNE FlagAndRunSlopeChecks_VerticalFirst

#_07B8A9: LDA.w $0310
#_07B8AC: BEQ .no_moving_floor_y

#_07B8AE: LDA.b $30
#_07B8B0: EOR.b #$FF
#_07B8B2: INC A
#_07B8B3: STA.b $30

.no_moving_floor_y
#_07B8B5: LDA.w $0312
#_07B8B8: BEQ FlagAndRunSlopeChecks_VerticalFirst

#_07B8BA: LDA.b $31
#_07B8BC: EOR.b #$FF
#_07B8BE: INC A
#_07B8BF: STA.b $31

;===================================================================================================

FlagAndRunSlopeChecks_VerticalFirst:
#_07B8C1: LDA.b #$01
#_07B8C3: STA.w $0315

#_07B8C6: JSR RunSlopeCollisionChecks_VerticalFirst

#_07B8C9: BRA CalculateSaveFlagVelocity

;===================================================================================================

FlagAndRunSlopeChecks_HorizontalFirst:
#_07B8CB: LDA.b #$01
#_07B8CD: STA.w $0315

#_07B8D0: JSR RunSlopeCollisionChecks_HorizontalFirst

;===================================================================================================

CalculateSaveFlagVelocity:
#_07B8D3: LDY.b #$00
#_07B8D5: JSR TileDetect_MainHandler

#_07B8D8: LDA.b $6A
#_07B8DA: BEQ .not_moving_diagonal

#_07B8DC: STZ.b $6B

.not_moving_diagonal
#_07B8DE: LDA.b $5D
#_07B8E0: CMP.b #$0B ; LINKSTATE 0B
#_07B8E2: BEQ .no_y_movement

#_07B8E4: LDY.b #$08

#_07B8E6: LDA.b $20
#_07B8E8: SEC
#_07B8E9: SBC.b $3E
#_07B8EB: STA.b $30

#_07B8ED: BEQ .no_y_movement
#_07B8EF: BMI .negative_y_movement

#_07B8F1: LDY.b #$04

.negative_y_movement
#_07B8F3: LDA.b $67
#_07B8F5: AND.b #$03
#_07B8F7: STA.b $67

#_07B8F9: TYA
#_07B8FA: TSB.b $67

.no_y_movement
#_07B8FC: LDY.b #$02

#_07B8FE: LDA.b $22
#_07B900: SEC
#_07B901: SBC.b $3F
#_07B903: STA.b $31

#_07B905: BEQ .no_x_movement
#_07B907: BMI .negative_x_movement

#_07B909: LDY.b #$01

.negative_x_movement
#_07B90B: LDA.b $67
#_07B90D: AND.b #$0C
#_07B90F: STA.b $67

#_07B911: TYA
#_07B912: TSB.b $67

.no_x_movement
#_07B914: LDA.b $1B
#_07B916: BEQ .exit

#_07B918: LDA.w $046C
#_07B91B: CMP.b #$04
#_07B91D: BNE .exit

#_07B91F: LDA.b $5D
#_07B921: CMP.b #$04 ; LINKSTATE 04
#_07B923: BNE .exit

#_07B925: LDY.b #$F7

#_07B927: LDA.w $0310
#_07B92A: BEQ .no_floor_y_velocity
#_07B92C: BMI .negative_floor_y_velocity

#_07B92E: LDY.b #$FB

.negative_floor_y_velocity
#_07B930: EOR.b #$FF
#_07B932: INC A
#_07B933: CLC
#_07B934: ADC.b $30
#_07B936: BNE .no_floor_y_velocity

#_07B938: TYA
#_07B939: AND.b $67
#_07B93B: STA.b $67

.no_floor_y_velocity
#_07B93D: LDY.b #$FD

#_07B93F: LDA.w $0312
#_07B942: BEQ .exit
#_07B944: BMI .negative_floor_x_velocity

#_07B946: LDY.b #$FE

.negative_floor_x_velocity
#_07B948: EOR.b #$FF
#_07B94A: INC A
#_07B94B: CLC
#_07B94C: ADC.b $31
#_07B94E: BNE .exit

#_07B950: TYA
#_07B951: AND.b $67
#_07B953: STA.b $67

.exit
#_07B955: RTS

;===================================================================================================

RunSlopeCollisionChecks_VerticalFirst:
#_07B956: LDA.b $6B
#_07B958: AND.b #$20
#_07B95A: BNE .moving_horizontally_into_slope

#_07B95C: JSR StartMovementCollisionChecks_Vertical

.moving_horizontally_into_slope
#_07B95F: LDA.b $6B
#_07B961: AND.b #$10
#_07B963: BNE .exit

#_07B965: JSR StartMovementCollisionChecks_Horizontal

.exit
#_07B968: RTS

;===================================================================================================

RunSlopeCollisionChecks_HorizontalFirst:
#_07B969: LDA.b $6B
#_07B96B: AND.b #$10
#_07B96D: BNE .moving_vertically_into_slope

#_07B96F: JSR StartMovementCollisionChecks_Horizontal

.moving_vertically_into_slope
#_07B972: LDA.b $6B
#_07B974: AND.b #$20
#_07B976: BNE .exit

#_07B978: JSR StartMovementCollisionChecks_Vertical

.exit
#_07B97B: RTS

;===================================================================================================

CheckIfRoomNeedsDoubleLayerCheck:
#_07B97C: LDA.w $046C
#_07B97F: BEQ .no_layer_change

#_07B981: CMP.b #$04
#_07B983: BEQ .no_layer_change

#_07B985: CMP.b #$02
#_07B987: BCC .change_layer

#_07B989: CMP.b #$03
#_07B98B: BNE .useless

.useless
#_07B98D: REP #$20

#_07B98F: LDA.b $E6
#_07B991: SEC
#_07B992: SBC.b $E8

#_07B994: CLC
#_07B995: ADC.b $20
#_07B997: STA.b $20
#_07B999: STA.w $0318

#_07B99C: LDA.b $E0
#_07B99E: SEC
#_07B99F: SBC.b $E2

#_07B9A1: CLC
#_07B9A2: ADC.b $22
#_07B9A4: STA.b $22
#_07B9A6: STA.w $031A

#_07B9A9: SEP #$20

.change_layer
#_07B9AB: LDA.b #$01
#_07B9AD: STA.b $EE

#_07B9AF: SEC

#_07B9B0: RTS

.no_layer_change
#_07B9B1: CLC

#_07B9B2: RTS

;===================================================================================================

CreateVelocityFromMovingBackground:
#_07B9B3: LDA.w $046C
#_07B9B6: CMP.b #$01
#_07B9B8: BEQ .reset_and_exit

#_07B9BA: REP #$20

#_07B9BC: LDA.b $20
#_07B9BE: SEC
#_07B9BF: SBC.w $0318
#_07B9C2: STA.b $00

#_07B9C4: LDA.b $22
#_07B9C6: SEC
#_07B9C7: SBC.w $031A
#_07B9CA: STA.b $02

#_07B9CC: LDA.b $E8
#_07B9CE: SEC
#_07B9CF: SBC.b $E6
#_07B9D1: CLC
#_07B9D2: ADC.b $20
#_07B9D4: STA.b $20

#_07B9D6: LDA.b $E2
#_07B9D8: SEC
#_07B9D9: SBC.b $E0
#_07B9DB: CLC
#_07B9DC: ADC.b $22
#_07B9DE: STA.b $22

#_07B9E0: SEP #$20

#_07B9E2: LDA.b $67
#_07B9E4: BEQ .reset_and_exit

#_07B9E6: LDA.b $30
#_07B9E8: CLC
#_07B9E9: ADC.b $00
#_07B9EB: STA.b $30

#_07B9ED: LDA.b $31
#_07B9EF: CLC
#_07B9F0: ADC.b $02
#_07B9F2: STA.b $31

.reset_and_exit
#_07B9F4: STZ.b $EE

#_07B9F6: RTS

;===================================================================================================

RupeeTileOffset_y:
#_07B9F7: dw $0008, $0018, $0010, $0010

RupeeTileOffset_x:
#_07B9FF: dw $0008, $0008, $0000, $000F

;===================================================================================================

SpikeDamageValues:
#_07BA07: db $08 ; green
#_07BA08: db $08 ; blue
#_07BA09: db $08 ; red

;===================================================================================================

StartMovementCollisionChecks_Vertical:
#_07BA0A: LDA.b $30
#_07BA0C: BNE .moving_on_axis

#_07BA0E: RTS

.moving_on_axis
#_07BA0F: LDA.b $6C
#_07BA11: CMP.b #$01
#_07BA13: BNE .not_in_vertical_door

#_07BA15: LDY.b #$00

#_07BA17: LDA.b $20
#_07BA19: CMP.b #$80
#_07BA1B: BCC .negative_y
#_07BA1D: BRA .continue_y

.not_in_vertical_door
#_07BA1F: LDY.b #$00

#_07BA21: LDA.b $30
#_07BA23: BMI .negative_y

.continue_y
#_07BA25: LDY.b #$02

.negative_y
#_07BA27: TYA
#_07BA28: LSR A
#_07BA29: STA.b $66

#_07BA2B: JSR TileDetect_Movement_Vertical

#_07BA2E: LDA.b $1B
#_07BA30: BNE StartMovementCollisionChecks_Vertical_HandleIndoors

#_07BA32: BRL StartMovementCollisionChecks_Vertical_HandleOutdoors

;===================================================================================================

StartMovementCollisionChecks_Vertical_HandleIndoors:
#_07BA35: LDA.w $0308
#_07BA38: BMI .carrying_something

#_07BA3A: LDA.b $46
#_07BA3C: BEQ .not_taking_damage

.carrying_something
#_07BA3E: LDA.b $0E
#_07BA40: LSR A
#_07BA41: LSR A
#_07BA42: LSR A
#_07BA43: LSR A
#_07BA44: TSB.b $0E

#_07BA46: BRL ResetDoorPropsIfMovingWall_Vertical_door_pre

;---------------------------------------------------------------------------------------------------

.not_taking_damage
#_07BA49: LDA.b $6C
#_07BA4B: CMP.b #$02
#_07BA4D: BNE HandleAutoDoorFlagging_Vertical

#_07BA4F: LDA.b $6A
#_07BA51: BNE .not_moving_diagonally

#_07BA53: LDA.w $046C
#_07BA56: CMP.b #$03
#_07BA58: BNE .no_moving_floor

#_07BA5A: LDA.b $EE
#_07BA5C: BEQ .no_moving_floor

#_07BA5E: BRL CheckForMasksRupeesConveyors_Vertical

.no_moving_floor
#_07BA61: JSR Link_AddInVelocityY
#_07BA64: BRL ChangeAxisOfPerpendicularDoorMovement_Vertical

.not_moving_diagonally
#_07BA67: LDA.b $62
#_07BA69: BEQ HandleAutoDoorFlagging_Vertical

#_07BA6B: JSR Link_AddInVelocityY

#_07BA6E: BRA ResetDoorPropsIfMovingWall_Vertical

;===================================================================================================

HandleAutoDoorFlagging_Vertical:
#_07BA70: LDA.b $0E
#_07BA72: AND.b #$70
#_07BA74: BEQ ResetDoorPropsIfMovingWall_Vertical_door_pre

#_07BA76: STZ.b $05

#_07BA78: LDA.b $0F
#_07BA7A: AND.b #$07
#_07BA7C: BEQ .no_auto_move

#_07BA7E: LDY.b #$00

#_07BA80: LDA.b $30
#_07BA82: BMI .negative_y

#_07BA84: LDY.b #$01

.negative_y
#_07BA86: LDA.w AutoMove49Directions,Y
#_07BA89: STA.b $49

;---------------------------------------------------------------------------------------------------

.no_auto_move
#_07BA8B: LDA.b #$01
#_07BA8D: STA.b $6C

#_07BA8F: STZ.w $03F3

#_07BA92: LDA.b $0E
#_07BA94: AND.b #$70
#_07BA96: CMP.b #$70
#_07BA98: BEQ .dont_snap

#_07BA9A: LDA.b $0E
#_07BA9C: AND.b #$05
#_07BA9E: BNE .handle_falling_too

#_07BAA0: LDA.b $0E
#_07BAA2: AND.b #$20
#_07BAA4: BNE .dont_snap

#_07BAA6: BRA ResetDoorPropsIfMovingWall_Vertical_door_pre

.handle_falling_too
#_07BAA8: STZ.b $6B

#_07BAAA: JSR Link_AddInVelocityYFalling
#_07BAAD: JSR CalculateSnapScratch_Vertical

#_07BAB0: STZ.b $6C

#_07BAB2: LDA.b $0E
#_07BAB4: AND.b #$20
#_07BAB6: BEQ .dont_snap

#_07BAB8: LDA.b $0E
#_07BABA: AND.b #$01
#_07BABC: BNE .dont_snap

#_07BABE: LDA.b $22
#_07BAC0: AND.b #$07
#_07BAC2: CMP.b #$01
#_07BAC4: BNE .dont_snap

#_07BAC6: LDA.b $22
#_07BAC8: AND.b #$F8
#_07BACA: STA.b $22

.dont_snap
#_07BACC: LDA.w $0315
#_07BACF: AND.b #$02
#_07BAD1: BNE .exit

#_07BAD3: LDA.b $50
#_07BAD5: AND.b #$FD
#_07BAD7: STA.b $50

.exit
#_07BAD9: RTS

;===================================================================================================

ResetDoorPropsIfMovingWall_Vertical_door_pre:
#_07BADA: LDA.w $0315
#_07BADD: AND.b #$02
#_07BADF: BNE ResetDoorPropsIfMovingWall_Vertical

#_07BAE1: STZ.b $6C

;===================================================================================================

ResetDoorPropsIfMovingWall_Vertical:
#_07BAE3: LDA.w $0315
#_07BAE6: AND.b #$02
#_07BAE8: BNE CheckForMasksRupeesConveyors_Vertical

#_07BAEA: LDA.b $50
#_07BAEC: AND.b #$FD
#_07BAEE: STA.b $50

#_07BAF0: STZ.b $49
#_07BAF2: STZ.b $EF

;===================================================================================================

CheckForMasksRupeesConveyors_Vertical:
#_07BAF4: LDA.b $0E
#_07BAF6: AND.b #$07
#_07BAF8: BNE HandleMasksRupeesConveyors_Vertical

#_07BAFA: LDA.b $0C
#_07BAFC: AND.b #$05
#_07BAFE: BEQ HandleMasksRupeesConveyors_Vertical

#_07BB00: STZ.w $03F3

#_07BB03: JSR FlagMovingIntoSlopes_Vertical

#_07BB06: LDA.b $6B
#_07BB08: AND.b #$0F
#_07BB0A: BEQ HandleMasksRupeesConveyors_Vertical

#_07BB0C: RTS

;===================================================================================================

HandleMasksRupeesConveyors_Vertical:
#_07BB0D: STZ.b $6B

#_07BB0F: LDA.w $02E7
#_07BB12: AND.b #$20
#_07BB14: BEQ .no_chest_above

#_07BB16: LDA.b $0E
#_07BB18: PHA

#_07BB19: LDA.b $0F
#_07BB1B: PHA

#_07BB1C: LDA.w $02EA
#_07BB1F: JSL OpenChestForItem

#_07BB23: STZ.w $02EA

#_07BB26: PLA
#_07BB27: STA.b $0F

#_07BB29: PLA
#_07BB2A: STA.b $0E

;---------------------------------------------------------------------------------------------------

.no_chest_above
#_07BB2C: LDA.b $EE
#_07BB2E: BNE .lower_layer

#_07BB30: LDA.w $034C
#_07BB33: AND.b #$07
#_07BB35: BEQ .no_mask1C

#_07BB37: LDA.b #$01
#_07BB39: TSB.w $0322

#_07BB3C: BRA .check_for_rupee_tiles

;---------------------------------------------------------------------------------------------------

.no_mask1C
#_07BB3E: LDA.w $02E8
#_07BB41: AND.b #$07
#_07BB43: BNE .check_for_rupee_tiles

#_07BB45: LDA.b $0E
#_07BB47: AND.b #$02
#_07BB49: BNE .check_for_rupee_tiles

#_07BB4B: LDA.w $0322
#_07BB4E: AND.b #$FE
#_07BB50: STA.w $0322

#_07BB53: BRA .check_for_rupee_tiles

.lower_layer
#_07BB55: LDA.w $0320
#_07BB58: AND.b #$07
#_07BB5A: BEQ .no_mask0C

#_07BB5C: LDA.b #$02
#_07BB5E: TSB.w $0322

#_07BB61: BRA .check_for_rupee_tiles

.no_mask0C
#_07BB63: LDA.w $0322
#_07BB66: AND.b #$FD
#_07BB68: STA.w $0322

;---------------------------------------------------------------------------------------------------

.check_for_rupee_tiles
#_07BB6B: LDA.w $02F7
#_07BB6E: AND.b #$22
#_07BB70: BEQ .no_rupee_tiles

#_07BB72: LDX.b #$00

#_07BB74: AND.b #$20
#_07BB76: BEQ .no_rupee_from_this_side

#_07BB78: LDX.b #$08

.no_rupee_from_this_side
#_07BB7A: STX.b $00

#_07BB7C: STZ.b $01

#_07BB7E: LDA.b $66
#_07BB80: ASL A
#_07BB81: TAY

#_07BB82: REP #$20

#_07BB84: LDA.l $7EF360
#_07BB88: CLC
#_07BB89: ADC.w #$0005
#_07BB8C: STA.l $7EF360

#_07BB90: LDA.b $20
#_07BB92: CLC
#_07BB93: ADC.w RupeeTileOffset_y,Y
#_07BB96: SEC
#_07BB97: SBC.b $00
#_07BB99: STA.b $00

#_07BB9B: LDA.b $22
#_07BB9D: CLC
#_07BB9E: ADC.w RupeeTileOffset_x,Y
#_07BBA1: STA.b $02

#_07BBA3: SEP #$20

#_07BBA5: JSL Underworld_DeleteRupeeTile

#_07BBA9: LDA.b #$0A ; SFX3.0A
#_07BBAB: JSR PlaySFX_Set3

;---------------------------------------------------------------------------------------------------

.no_rupee_tiles
#_07BBAE: LDY.b #$01 ; up

#_07BBB0: LDA.w $03F1
#_07BBB3: AND.b #$22
#_07BBB5: BEQ .no_conveyor_ud

#_07BBB7: AND.b #$20
#_07BBB9: BEQ .up_conveyor

#_07BBBB: LDY.b #$02 ; down

.up_conveyor
#_07BBBD: STY.w $03F3

#_07BBC0: BRA Link_CheckForLedgeTile_Vertical

;---------------------------------------------------------------------------------------------------

.no_conveyor_ud
#_07BBC2: LDY.b #$03 ; left

#_07BBC4: LDA.w $03F2
#_07BBC7: AND.b #$22
#_07BBC9: BEQ .no_conveyor_lr

#_07BBCB: AND.b #$20
#_07BBCD: BEQ .left_conveyor

#_07BBCF: LDY.b #$04 ; right

.left_conveyor
#_07BBD1: STY.w $03F3

#_07BBD4: BRA Link_CheckForLedgeTile_Vertical

;---------------------------------------------------------------------------------------------------

.no_conveyor_lr
#_07BBD6: LDA.w $02E8
#_07BBD9: AND.b #$07
#_07BBDB: BNE Link_CheckForLedgeTile_Vertical

#_07BBDD: LDA.b $0E
#_07BBDF: AND.b #$02
#_07BBE1: BNE Link_CheckForLedgeTile_Vertical

#_07BBE3: STZ.w $03F3

;===================================================================================================

Link_CheckForLedgeTile_Vertical:
#_07BBE6: LDA.w $036D
#_07BBE9: AND.b #$07
#_07BBEB: CMP.b #$07
#_07BBED: BNE Link_CheckForWaterTiles_Vertical

#_07BBEF: JSR RunLedgeHopTimer
#_07BBF2: BCC Link_CheckForWaterTiles_Vertical

#_07BBF4: JSR Link_CancelDash

#_07BBF7: INC.w $047A

#_07BBFA: LDA.b #$01
#_07BBFC: STA.w $037B

#_07BBFF: LDA.b #$02
#_07BC01: STA.b $4D

#_07BC03: LDA.b #$20 ; SFX2.20
#_07BC05: JSR PlaySFX_Set2

#_07BC08: BRA HandleUnderworldHopOntoWater_Vertical

;---------------------------------------------------------------------------------------------------

Link_CheckForWaterTiles_Vertical:
#_07BC0A: LDA.w $0341
#_07BC0D: AND.b #$07
#_07BC0F: CMP.b #$07
#_07BC11: BNE .on_deep_water

#_07BC13: LDA.w $0345
#_07BC16: BNE .on_deep_water

#_07BC18: JSR Link_CancelDash

#_07BC1B: LDA.b $1D
#_07BC1D: BNE .no_layer_change

#_07BC1F: JSL Underworld_HandleLayerChange

#_07BC23: BRA HandleUnderworldHopOntoWater_Vertical

;---------------------------------------------------------------------------------------------------

.no_layer_change
#_07BC25: LDA.b #$01
#_07BC27: STA.w $0345

#_07BC2A: LDA.b $26
#_07BC2C: STA.w $0340

#_07BC2F: STZ.w $0308
#_07BC32: STZ.w $0309
#_07BC35: STZ.w $0376

#_07BC38: STZ.b $5E

#_07BC3A: JSL Link_ResetSwimmingState

#_07BC3E: LDA.b #$20 ; SFX2.20
#_07BC40: JSR PlaySFX_Set2

;===================================================================================================

#HandleUnderworldHopOntoWater_Vertical:
#_07BC43: LDA.b #$01
#_07BC45: STA.w $037B

#_07BC48: JSR Link_HopInOrOutOfWater_Vertical

#_07BC4B: BRA .continue

;---------------------------------------------------------------------------------------------------

.on_deep_water
#_07BC4D: LDA.w $0343
#_07BC50: AND.b #$02
#_07BC52: BEQ .continue

#_07BC54: LDA.w $0345
#_07BC57: BEQ .continue

#_07BC59: LDA.b $4D
#_07BC5B: BEQ .not_in_recoil

#_07BC5D: LDA.b #$07
#_07BC5F: STA.b $0E

#_07BC61: BRA .continue

.not_in_recoil
#_07BC63: JSR Link_CancelDash

#_07BC66: STZ.w $0345

#_07BC69: LDA.w $0340
#_07BC6C: STA.b $26

#_07BC6E: LDA.b #$15 ; ANCILLA 15
#_07BC70: LDY.b #$00
#_07BC72: JSL AncillaAdd_Splash
#_07BC76: BCC .no_space_for_splash

#_07BC78: LDA.b #$01
#_07BC7A: STA.w $0345

#_07BC7D: LDA.b #$07
#_07BC7F: STA.b $0E

#_07BC81: BRA .continue

.no_space_for_splash
#_07BC83: LDA.b #$01
#_07BC85: STA.w $037B

#_07BC88: JSR Link_HopInOrOutOfWater_Vertical

;---------------------------------------------------------------------------------------------------

.continue
#_07BC8B: LDA.b $58
#_07BC8D: AND.b #$07
#_07BC8F: CMP.b #$07
#_07BC91: BNE Link_HandleStairDetection

#_07BC93: LDA.b $46
#_07BC95: BEQ .not_taking_damage

#_07BC97: LDA.b $58
#_07BC99: AND.b #$07
#_07BC9B: STA.b $0E

#_07BC9D: BRL HandlePushingBonkingSnaps_Vertical

.not_taking_damage
#_07BCA0: LDA.w $02C0
#_07BCA3: AND.b #$77
#_07BCA5: BEQ .no_stairs

#_07BCA7: LDY.b #$08
#_07BCA9: AND.b #$70
#_07BCAB: BEQ .merged_layer_stairs

#_07BCAD: LDY.b #$10

.merged_layer_stairs
#_07BCAF: STY.b $11

#_07BCB1: LDA.b #$07
#_07BCB3: STA.b $10

#_07BCB5: JSR Link_CancelDash

.no_stairs
#_07BCB8: LDA.b $66
#_07BCBA: AND.b #$02
#_07BCBC: BNE Link_HandleStairDetection

#_07BCBE: LDA.b #$02
#_07BCC0: STA.b $5E

#_07BCC2: LDA.b #$01
#_07BCC4: STA.b $57

#_07BCC6: RTS

;===================================================================================================

Link_HandleStairDetection:
#_07BCC7: LDA.b $5E
#_07BCC9: CMP.b #$02
#_07BCCB: BNE .not_stair_speed

#_07BCCD: LDX.b #$10

#_07BCCF: LDA.w $0372
#_07BCD2: BNE .dashing_speed

#_07BCD4: LDX.b #$00

.dashing_speed
#_07BCD6: STX.b $5E

.not_stair_speed
#_07BCD8: LDA.b $57
#_07BCDA: CMP.b #$01
#_07BCDC: BNE HandleUnderworldPitSlip_Vertical

#_07BCDE: LDX.b #$02
#_07BCE0: STX.b $57

;===================================================================================================

HandleUnderworldPitSlip_Vertical:
#_07BCE2: LDA.b $59
#_07BCE4: AND.b #$05
#_07BCE6: BEQ HandleUnderworldSpikeBlockCollision_Vertical

#_07BCE8: LDA.b $0E
#_07BCEA: AND.b #$02
#_07BCEC: BNE HandleUnderworldSpikeBlockCollision_Vertical

#_07BCEE: LDA.b $5D
#_07BCF0: CMP.b #$05 ; LINKSTATE 05
#_07BCF2: BEQ .exit

#_07BCF4: CMP.b #$02 ; LINKSTATE 02
#_07BCF6: BEQ .exit

#_07BCF8: LDA.b #$09
#_07BCFA: STA.b $5C

#_07BCFC: STZ.b $5A

#_07BCFE: LDA.b #$01
#_07BD00: STA.b $5B

#_07BD02: LDA.b #$01 ; LINKSTATE 01
#_07BD04: STA.b $5D

.exit
#_07BD06: RTS

;===================================================================================================

HandleUnderworldSpikeBlockCollision_Vertical:
#_07BD07: STZ.b $5A

#_07BD09: LDA.w $02E8
#_07BD0C: AND.b #$07
#_07BD0E: BEQ .check_collision_type

#_07BD10: LDA.b $46
#_07BD12: ORA.w $031F
#_07BD15: ORA.b $55
#_07BD17: BNE .no_spike_damage

#_07BD19: LDA.b $20
#_07BD1B: LDY.b $66
#_07BD1D: BNE .didnt_move

#_07BD1F: AND.b #$04
#_07BD21: BEQ .not_on_4px_edge
#_07BD23: BRA .check_collision_type

.didnt_move
#_07BD25: AND.b #$04
#_07BD27: BEQ .check_collision_type

.not_on_4px_edge
#_07BD29: LDA.w $031F
#_07BD2C: BNE .check_collision_type

#_07BD2E: LDA.l $7EF35B
#_07BD32: TAY

#_07BD33: LDA.w SpikeDamageValues,Y
#_07BD36: STA.w $0373

#_07BD39: JSR Link_CancelDash
#_07BD3C: JSR Link_ForceUnequipCape_quietly

#_07BD3F: BRL LinkApplyTileRebound

;---------------------------------------------------------------------------------------------------

.no_spike_damage
#_07BD42: LDA.w $02E8
#_07BD45: AND.b #$07
#_07BD47: STA.b $0E

.check_collision_type
#_07BD49: LDA.w $046C
#_07BD4C: BEQ .ignore_layer

#_07BD4E: CMP.b #$04
#_07BD50: BEQ .ignore_layer

#_07BD52: LDA.b $EE
#_07BD54: BNE HandlePushingBonkingSnaps_Vertical

.ignore_layer
#_07BD56: LDA.b $5F
#_07BD58: ORA.b $60
#_07BD5A: BEQ .not_pushing_block

#_07BD5C: LDA.b $6A
#_07BD5E: BNE .not_pushing_block

#_07BD60: LDA.b $5F
#_07BD62: STA.w $02C2

#_07BD65: DEC.b $61
#_07BD67: BPL HandlePushingBonkingSnaps_Vertical

;---------------------------------------------------------------------------------------------------

#_07BD69: REP #$20

#_07BD6B: LDY.b #$0F

#_07BD6D: LDA.b $5F

.check_next_block
#_07BD6F: ASL A
#_07BD70: BCC .skip_block

#_07BD72: PHA
#_07BD73: PHY

#_07BD74: SEP #$20

#_07BD76: JSR FindFreeMovingBlockSlot
#_07BD79: BCS .no_free_slot

#_07BD7B: STX.b $0E

#_07BD7D: TYA
#_07BD7E: ASL A
#_07BD7F: TAX

#_07BD80: JSR InitializePushBlock
#_07BD83: BCS .no_free_slot

#_07BD85: LDA.b $0E
#_07BD87: ASL A
#_07BD88: TAY

#_07BD89: JSR Underworld_DrawSinglePushBlock

#_07BD8C: TYX

#_07BD8D: LDY.b $66

#_07BD8F: TYA
#_07BD90: ASL A
#_07BD91: STA.w $05F8,X
#_07BD94: STA.w $0474

#_07BD97: LDA.w $05F0,X

#_07BD9A: CPY.b #$01
#_07BD9C: BNE .not_pushing_down

#_07BD9E: DEC A

.not_pushing_down
#_07BD9F: AND.b #$0F
#_07BDA1: STA.w $05E8,X

.no_free_slot
#_07BDA4: REP #$20

#_07BDA6: PLY
#_07BDA7: PLA

.skip_block
#_07BDA8: DEY
#_07BDA9: BPL .check_next_block

;---------------------------------------------------------------------------------------------------

#_07BDAB: SEP #$20

.not_pushing_block
#_07BDAD: LDA.b #$15
#_07BDAF: STA.b $61

;===================================================================================================

HandlePushingBonkingSnaps_Vertical:
#_07BDB1: LDA.b $0E
#_07BDB3: AND.b #$07
#_07BDB5: BNE .check_for_swimming

#_07BDB7: BRL RestartPushingTimer_UnflagDoors_Vertical

.check_for_swimming
#_07BDBA: LDA.b $5D
#_07BDBC: CMP.b #$04 ; LINKSTATE 04
#_07BDBE: BNE .not_swimming_or_moving

#_07BDC0: LDA.w $0310
#_07BDC3: BNE .moving_floor_active

#_07BDC5: JSR ResetAllAcceleration

.moving_floor_active
#_07BDC8: LDA.b $6A
#_07BDCA: BEQ .not_swimming_or_moving

#_07BDCC: JSR Link_AddInVelocityYFalling
#_07BDCF: BRA .check_for_bonk

.not_swimming_or_moving
#_07BDD1: LDA.b $0E
#_07BDD3: AND.b #$02
#_07BDD5: BNE .do_a_bonk

#_07BDD7: LDA.b $0E
#_07BDD9: AND.b #$05
#_07BDDB: CMP.b #$05
#_07BDDD: BNE .no_bonk

.do_a_bonk
#_07BDDF: LDA.b $0E
#_07BDE1: PHA

#_07BDE2: JSR Link_BonkAndSmash
#_07BDE5: JSR RepelDash

#_07BDE8: PLA
#_07BDE9: STA.b $0E

.no_bonk
#_07BDEB: LDA.b #$01
#_07BDED: STA.w $0302

#_07BDF0: LDA.b $0E
#_07BDF2: AND.b #$02
#_07BDF4: CMP.b #$02
#_07BDF6: BNE .check_diagonal_direction

#_07BDF8: JSR Link_AddInVelocityYFalling
#_07BDFB: BRA .check_for_bonk

.check_diagonal_direction
#_07BDFD: LDA.b $6A
#_07BDFF: CMP.b #$01
#_07BE01: BNE .not_diagonal_facing_vetically

.diagonal_facing_horizontally
#_07BE03: BRL RestartPushingTimer_Vertical

.not_diagonal_facing_vetically
#_07BE06: JSR Link_AddInVelocityYFalling

#_07BE09: LDA.b $6A
#_07BE0B: CMP.b #$02
#_07BE0D: BEQ .diagonal_facing_horizontally

;---------------------------------------------------------------------------------------------------

.check_for_bonk
#_07BE0F: LDA.b $0E
#_07BE11: AND.b #$05
#_07BE13: CMP.b #$05
#_07BE15: BEQ .definitely_bonk

#_07BE17: AND.b #$04
#_07BE19: BEQ .no_bonk_this_way

#_07BE1B: LDY.b #$01

#_07BE1D: LDA.b $30
#_07BE1F: BMI .already_negative

#_07BE21: EOR.b #$FF
#_07BE23: INC A

.already_negative
#_07BE24: BPL .extra_positive_check

#_07BE26: LDY.b #$FF

.extra_positive_check
#_07BE28: STY.b $00
#_07BE2A: STZ.b $01

#_07BE2C: LDA.b $0E
#_07BE2E: AND.b #$02
#_07BE30: BNE HandlePushingObstruction_Vertical

#_07BE32: LDA.b $22
#_07BE34: AND.b #$07
#_07BE36: BNE .do_not_bonk

#_07BE38: JSR Link_BonkAndSmash
#_07BE3B: JSR RepelDash

#_07BE3E: BRA HandlePushingObstruction_Vertical

;---------------------------------------------------------------------------------------------------

.no_bonk_this_way
#_07BE40: LDY.b #$01

#_07BE42: LDA.b $30
#_07BE44: BPL .already_positive

#_07BE46: EOR.b #$FF
#_07BE48: INC A

.already_positive
#_07BE49: BPL .make_sure_not_negative

#_07BE4B: LDY.b #$FF

.make_sure_not_negative
#_07BE4D: STY.b $00
#_07BE4F: STZ.b $01

#_07BE51: LDA.b $0E
#_07BE53: AND.b #$02
#_07BE55: BNE HandlePushingObstruction_Vertical

#_07BE57: LDA.b $22
#_07BE59: AND.b #$07
#_07BE5B: BNE .do_not_bonk

.definitely_bonk
#_07BE5D: JSR Link_BonkAndSmash
#_07BE60: JSR RepelDash

#_07BE63: BRA HandlePushingObstruction_Vertical

.do_not_bonk
#_07BE65: JSR AddAbsoluteScratchToXCoord

#_07BE68: JMP.w HandleNudging

;===================================================================================================

HandlePushingObstruction_Vertical:
#_07BE6B: LDA.b $66
#_07BE6D: ASL A
#_07BE6E: CMP.b $2F
#_07BE70: BNE RestartPushingTimer_Vertical

#_07BE72: LDA.w $0315
#_07BE75: AND.b #$01
#_07BE77: ASL A
#_07BE78: TSB.b $48

#_07BE7A: LDA.b $3C
#_07BE7C: BNE .dont_run_push_timer

#_07BE7E: DEC.w $0371
#_07BE81: BPL EXIT_07BEAE

.dont_run_push_timer
#_07BE83: LDY.w $0315

#_07BE86: LDA.w $02F6
#_07BE89: AND.b #$20
#_07BE8B: BEQ .not_a_flaggable_door

#_07BE8D: LDA.w $0315
#_07BE90: ASL A
#_07BE91: ASL A
#_07BE92: ASL A
#_07BE93: TAY

.not_a_flaggable_door
#_07BE94: TYA
#_07BE95: TSB.b $48

#_07BE97: BRA RestartPushingTimer_Vertical

;===================================================================================================

RestartPushingTimer_UnflagDoors_Vertical:
#_07BE99: LDA.b $EE
#_07BE9B: BNE EXIT_07BEAE

#_07BE9D: LDA.b $48
#_07BE9F: AND.b #$F6
#_07BEA1: STA.b $48

;===================================================================================================

RestartPushingTimer_Vertical:
#_07BEA3: LDA.b #$20
#_07BEA5: STA.w $0371

#_07BEA8: LDA.b $48
#_07BEAA: AND.b #$FD
#_07BEAC: STA.b $48

;---------------------------------------------------------------------------------------------------

#EXIT_07BEAE:
#_07BEAE: RTS

;===================================================================================================

StartMovementCollisionChecks_Vertical_HandleOutdoors:
#_07BEAF: LDA.b $5E
#_07BEB1: CMP.b #$02
#_07BEB3: BNE .not_stair_speed

#_07BEB5: LDX.b #$10

#_07BEB7: LDA.w $0372
#_07BEBA: BNE .dashing

#_07BEBC: LDX.b #$00

.dashing
#_07BEBE: STX.b $5E

.not_stair_speed
#_07BEC0: LDA.b $59
#_07BEC2: AND.b #$05
#_07BEC4: BEQ HandleLiftablesBeforeDeepWater_Vertical

#_07BEC6: LDA.b $0E
#_07BEC8: AND.b #$02
#_07BECA: BNE HandleLiftablesBeforeDeepWater_Vertical

#_07BECC: LDA.b $5D
#_07BECE: CMP.b #$05 ; LINKSTATE 05
#_07BED0: BEQ .exit

#_07BED2: CMP.b #$02 ; LINKSTATE 02
#_07BED4: BEQ .exit

#_07BED6: LDA.b #$09
#_07BED8: STA.b $5C

#_07BEDA: STZ.b $5A

#_07BEDC: LDA.b #$01
#_07BEDE: STA.b $5B

#_07BEE0: LDA.b #$01 ; LINKSTATE 01
#_07BEE2: STA.b $5D

.exit
#_07BEE4: RTS

;===================================================================================================

HandleLiftablesBeforeDeepWater_Vertical:
#_07BEE5: LDA.w $0366
#_07BEE8: AND.b #$02
#_07BEEA: BEQ .not_touching_some_liftable

#_07BEEC: LDA.w $036A
#_07BEEF: LSR A
#_07BEF0: STA.w $0368

#_07BEF3: BRA .index_is_set

.not_touching_some_liftable
#_07BEF5: STZ.w $0368

.index_is_set
#_07BEF8: LDA.w $0341
#_07BEFB: AND.b #$02
#_07BEFD: BEQ Link_HandleEnteringWater_Vertical

#_07BEFF: BRA Link_CheckEnteringWaterVertical

;===================================================================================================

UNREACHABLE_07BF01:
#_07BF01: LDA.w $0341
#_07BF04: AND.b #$07
#_07BF06: CMP.b #$07
#_07BF08: BNE Link_HandleEnteringWater_Vertical

;===================================================================================================

Link_CheckEnteringWaterVertical:
#_07BF0A: LDA.w $0345
#_07BF0D: BNE Link_HandleEnteringWater_Vertical

#_07BF0F: LDA.b $4D
#_07BF11: BNE Link_HandleEnteringWater_Vertical

#_07BF13: JSR Link_ResetSwordAndItemUsage
#_07BF16: JSR Link_CancelDash

#_07BF19: LDA.b #$01
#_07BF1B: STA.w $0345

#_07BF1E: LDA.b $26
#_07BF20: STA.w $0340

#_07BF23: STZ.w $0376
#_07BF26: STZ.b $5E

#_07BF28: JSL Link_ResetSwimmingState

#_07BF2C: LDA.w $0351
#_07BF2F: CMP.b #$01
#_07BF31: BNE .jump_into_water

;---------------------------------------------------------------------------------------------------

#_07BF33: JSR Link_ForceUnequipCape_quietly

#_07BF36: LDA.l $7EF356
#_07BF3A: BEQ .jump_into_water

#_07BF3C: LDA.w $02E0
#_07BF3F: BNE Link_HandleEnteringWater_Vertical

#_07BF41: LDA.b #$04 ; LINKSTATE 04
#_07BF43: STA.b $5D

#_07BF45: BRA Link_HandleEnteringWater_Vertical

.jump_into_water
#_07BF47: LDA.b #$20 ; SFX2.20
#_07BF49: JSR PlaySFX_Set2

#_07BF4C: LDA.b $3E
#_07BF4E: STA.b $20

#_07BF50: LDA.b $40
#_07BF52: STA.b $21

#_07BF54: LDA.b $3F
#_07BF56: STA.b $22

#_07BF58: LDA.b $41
#_07BF5A: STA.b $23

#_07BF5C: LDA.b #$01
#_07BF5E: STA.w $037B

#_07BF61: JSR Link_HopInOrOutOfWater_Vertical

;===================================================================================================

Link_HandleEnteringWater_Vertical:
#_07BF64: LDA.w $0345
#_07BF67: BEQ .not_on_deep_water

#_07BF69: LDA.w $036D
#_07BF6C: AND.b #$07
#_07BF6E: BEQ .no_ledge

#_07BF70: STA.b $0E

#_07BF72: BRL HandlePushingBonkingSnaps_Vertical

.no_ledge
#_07BF75: LDA.b $58
#_07BF77: AND.b #$07
#_07BF79: CMP.b #$07
#_07BF7B: BEQ .stairs_detected

#_07BF7D: LDA.w $0343
#_07BF80: AND.b #$07
#_07BF82: CMP.b #$07
#_07BF84: BNE .not_on_deep_water

.stairs_detected
#_07BF86: JSR Link_CancelDash

#_07BF89: STZ.w $0345

#_07BF8C: LDA.b $4D
#_07BF8E: BNE .not_on_deep_water

#_07BF90: LDA.w $0340
#_07BF93: STA.b $26

#_07BF95: LDA.b #$01
#_07BF97: STA.w $037B

#_07BF9A: LDA.b #$15 ; ANCILLA 15
#_07BF9C: LDY.b #$00
#_07BF9E: JSL AncillaAdd_Splash

#_07BFA2: BRL Link_HopInOrOutOfWater_Vertical

;---------------------------------------------------------------------------------------------------

.not_on_deep_water
#_07BFA5: LDA.w $036E
#_07BFA8: AND.b #$02
#_07BFAA: BNE .horizontal_ledge_detected

#_07BFAC: LDA.w $0370
#_07BFAF: AND.b #$22
#_07BFB1: BEQ .no_weird_ledges

.horizontal_ledge_detected
#_07BFB3: LDA.b #$07
#_07BFB5: STA.b $0E

#_07BFB7: BRL HandlePushingBonkingSnaps_Vertical

.no_weird_ledges
#_07BFBA: LDA.w $036D
#_07BFBD: AND.b #$70
#_07BFBF: BEQ Link_CheckForNorthSouthLedges

#_07BFC1: JSR RunLedgeHopTimer
#_07BFC4: BCC Link_CheckForNorthSouthLedges

#_07BFC6: JSR Link_CancelDash

#_07BFC9: LDA.b #$01
#_07BFCB: STA.w $037B
#_07BFCE: STA.b $78

#_07BFD0: LDA.b #$0B ; LINKSTATE 0B
#_07BFD2: STA.b $5D

#_07BFD4: STZ.b $46

#_07BFD6: LDA.b #$FF
#_07BFD8: STA.w $0364
#_07BFDB: STA.w $0365

#_07BFDE: STZ.b $48
#_07BFE0: STZ.b $5E

#_07BFE2: LDY.b #$02
#_07BFE4: LDX.b #$14

#_07BFE6: LDA.w $0345
#_07BFE9: BEQ .jumping_into_water

#_07BFEB: LDY.b #$04
#_07BFED: LDX.b #$0E

.jumping_into_water
#_07BFEF: STX.w $0362
#_07BFF2: STX.w $0363

#_07BFF5: STY.b $4D

#_07BFF7: RTS

;===================================================================================================

Link_CheckForNorthSouthLedges:
#_07BFF8: LDA.w $036D
#_07BFFB: AND.b #$07
#_07BFFD: BEQ .dont_hop

#_07BFFF: JSR RunLedgeHopTimer
#_07C002: BCC .dont_hop

#_07C004: LDA.b #$20 ; SFX2.20
#_07C006: JSR PlaySFX_Set2

#_07C009: LDA.b #$01
#_07C00B: STA.w $037B

#_07C00E: JSR Link_CancelDash

#_07C011: STZ.b $48
#_07C013: STZ.b $5E

#_07C015: BRL Link_FindValidLandingTile_North

.dont_hop
#_07C018: LDA.w $0345
#_07C01B: BEQ .not_in_water

#_07C01D: BRL OverworldRecoverAndDoGraves

.not_in_water
#_07C020: LDA.w $036F
#_07C023: AND.b #$07
#_07C025: BEQ CheckOverworldHopTiles_Vertical

#_07C027: LDA.w $036D
#_07C02A: AND.b #$77
#_07C02C: BNE CheckOverworldHopTiles_Vertical

#_07C02E: LDX.b #$04

#_07C030: LDA.b $76
#_07C032: CMP.b #$2F
#_07C034: BEQ .check_north_east

#_07C036: LDX.b #$01

.check_north_east
#_07C038: TXA
#_07C039: AND.w $036F
#_07C03C: BEQ CheckOverworldHopTiles_Vertical

#_07C03E: JSR RunLedgeHopTimer
#_07C041: BCC CheckOverworldHopTiles_Vertical

#_07C043: JSR Link_CancelDash

#_07C046: LDX.b #$10

#_07C048: LDA.w $036F
#_07C04B: AND.b #$04
#_07C04D: BNE .dont_invert_recoil

#_07C04F: TXA
#_07C050: EOR.b #$FF
#_07C052: INC A
#_07C053: TAX

.dont_invert_recoil
#_07C054: LDA.b #$01
#_07C056: STA.w $037B

#_07C059: STX.b $28

#_07C05B: STZ.b $48
#_07C05D: STZ.b $5E

#_07C05F: LDA.b #$01
#_07C061: STA.w $037B
#_07C064: STA.b $78

#_07C066: LDA.b #$02
#_07C068: STA.b $4D

#_07C06A: LDA.b #$14
#_07C06C: STA.w $0362
#_07C06F: STA.w $0363

#_07C072: LDA.b #$FF
#_07C074: STA.w $0364

#_07C077: STZ.b $46

#_07C079: LDA.b #$0E ; LINKSTATE 0E
#_07C07B: STA.b $5D

#_07C07D: RTS

;===================================================================================================

CheckOverworldHopTiles_Vertical:
#_07C07E: LDA.w $036E
#_07C081: AND.b #$70
#_07C083: BEQ OverworldRecoverAndDoGraves

#_07C085: LDA.w $036D
#_07C088: AND.b #$77
#_07C08A: BNE OverworldRecoverAndDoGraves

#_07C08C: JSR RunLedgeHopTimer
#_07C08F: BCC OverworldRecoverAndDoGraves

#_07C091: JSR Link_CancelDash

#_07C094: LDA.b #$20 ; SFX2.20
#_07C096: JSR PlaySFX_Set2

#_07C099: LDY.b #$03

#_07C09B: LDA.w $036E
#_07C09E: AND.b #$40
#_07C0A0: BNE .diagonal_north_ledge

#_07C0A2: LDY.b #$02

.diagonal_north_ledge
#_07C0A4: STY.b $66

#_07C0A6: LDA.b #$01
#_07C0A8: STA.w $037B

#_07C0AB: STZ.b $48
#_07C0AD: STZ.b $5E

#_07C0AF: BRL Link_FindValidLandingTile_DiagonalNorth

;===================================================================================================

OverworldRecoverAndDoGraves:
#_07C0B2: LDA.b $58
#_07C0B4: AND.b #$07
#_07C0B6: CMP.b #$07
#_07C0B8: BNE OverworldHandleStairsAndPushGraves

#_07C0BA: LDA.b $46
#_07C0BC: BEQ .not_recoiling

#_07C0BE: LDA.b $58
#_07C0C0: AND.b #$07
#_07C0C2: STA.b $0E

#_07C0C4: BRL HandlePushingBonkingSnaps_Vertical

.not_recoiling
#_07C0C7: LDA.b $66
#_07C0C9: AND.b #$02
#_07C0CB: BNE OverworldHandleStairsAndPushGraves

#_07C0CD: LDA.b #$02
#_07C0CF: STA.b $5E

#_07C0D1: LDA.b #$01
#_07C0D3: STA.b $57

#_07C0D5: RTS

;===================================================================================================

OverworldHandleStairsAndPushGraves:
#_07C0D6: LDA.b $5E
#_07C0D8: CMP.b #$02
#_07C0DA: BNE .not_stair_speed

#_07C0DC: LDX.b #$10

#_07C0DE: LDA.w $0372
#_07C0E1: BNE .dashing

#_07C0E3: LDX.b #$00

.dashing
#_07C0E5: STX.b $5E

.not_stair_speed
#_07C0E7: LDA.b $57
#_07C0E9: CMP.b #$01
#_07C0EB: BNE .not_slow_speed

#_07C0ED: LDX.b #$02
#_07C0EF: STX.b $57

.not_slow_speed
#_07C0F1: LDA.b $0C
#_07C0F3: AND.b #$05
#_07C0F5: BEQ CheckForGravePush

#_07C0F7: LDA.b $0E
#_07C0F9: AND.b #$07
#_07C0FB: BNE CheckForGravePush

#_07C0FD: JSR FlagMovingIntoSlopes_Vertical

#_07C100: LDA.b $6B
#_07C102: AND.b #$0F
#_07C104: BEQ CheckForGravePush

#_07C106: RTS

;===================================================================================================

CheckForGravePush:
#_07C107: STZ.b $6B

#_07C109: LDA.w $02E7
#_07C10C: AND.b #$02
#_07C10E: BEQ .reset_push_timer

#_07C110: LDA.b $66
#_07C112: BNE .reset_push_timer

#_07C114: LDA.w $0372
#_07C117: BNE .dashing

#_07C119: DEC.b $61
#_07C11B: BPL CheckForSpikeTouch

.dashing
#_07C11D: LDA.b $0E
#_07C11F: PHA

#_07C120: LDY.b #$04
#_07C122: LDA.b #$24 ; ANCILLA 24
#_07C124: JSL AncillaAdd_GraveStone

#_07C128: PLA
#_07C129: STA.b $0E

.reset_push_timer
#_07C12B: LDA.b #$34
#_07C12D: STA.b $61

;===================================================================================================

CheckForSpikeTouch:
#_07C12F: LDA.w $02E8
#_07C132: AND.b #$07
#_07C134: BEQ .not_touching_spike

#_07C136: LDA.b $46
#_07C138: ORA.w $031F
#_07C13B: ORA.b $55
#_07C13D: BNE .invulnerable

#_07C13F: LDA.b $20

#_07C141: LDY.b $66
#_07C143: BNE .didnt_move

#_07C145: AND.b #$04
#_07C147: BEQ .not_on_4px_edge

#_07C149: BRA .not_touching_spike

.didnt_move
#_07C14B: AND.b #$04
#_07C14D: BEQ .not_touching_spike

.not_on_4px_edge
#_07C14F: LDA.l $7EF35B
#_07C153: TAY

#_07C154: LDA.w SpikeDamageValues,Y
#_07C157: STA.w $0373

#_07C15A: JSR Link_CancelDash
#_07C15D: JSR Link_ForceUnequipCape_quietly

#_07C160: BRL LinkApplyTileRebound

.invulnerable
#_07C163: LDA.w $02E8
#_07C166: AND.b #$07
#_07C168: STA.b $0E

.not_touching_spike
#_07C16A: BRL HandlePushingBonkingSnaps_Vertical

;===================================================================================================

RunLedgeHopTimer:
#_07C16D: LDA.b $4D
#_07C16F: CMP.b #$01
#_07C171: BEQ .restore_coordinates

#_07C173: LDA.w $0372
#_07C176: BNE .dashing

#_07C178: DEC.w $0375
#_07C17B: BPL .restore_coordinates

#_07C17D: LDA.b #$13
#_07C17F: STA.w $0375

#_07C182: BRA .exit_and_set

.dashing
#_07C184: JSR .restore_coordinates

.exit_and_set
#_07C187: SEC

#_07C188: RTS

;---------------------------------------------------------------------------------------------------

.restore_coordinates
#_07C189: REP #$20

#_07C18B: LDA.w $0FC4
#_07C18E: STA.b $20

#_07C190: LDA.w $0FC2
#_07C193: STA.b $22

#_07C195: SEP #$20

#_07C197: STZ.b $2A
#_07C199: STZ.b $2B

#_07C19B: LDA.b $1B
#_07C19D: BNE EXIT_AND_CLC

;---------------------------------------------------------------------------------------------------

#EXIT_AND_CLC:
#_07C19F: CLC

#_07C1A0: RTS

;===================================================================================================

Link_BonkAndSmash:
#_07C1A1: LDA.w $0372
#_07C1A4: BEQ EXIT_AND_CLC

#_07C1A6: LDA.w $02F1
#_07C1A9: CMP.b #$40
#_07C1AB: BEQ EXIT_AND_CLC

#_07C1AD: LDA.w $02EF
#_07C1B0: AND.b #$70
#_07C1B2: BEQ EXIT_AND_CLC

#_07C1B4: JSL Overworld_SmashRockPileFromHere
#_07C1B8: BCC .didnt_break_here

#_07C1BA: JSR .break_pile

.didnt_break_here
#_07C1BD: JSL Overworld_SmashRockPileFromAbove
#_07C1C1: BCC .exit

;---------------------------------------------------------------------------------------------------

.break_pile
#_07C1C3: LDX.b #$08

.check_next
#_07C1C5: CMP.w LinkToss_liftable_tiles,X
#_07C1C8: BEQ .match

#_07C1CA: DEX
#_07C1CB: BPL .check_next

#_07C1CD: BRA .exit

;---------------------------------------------------------------------------------------------------

.match
#_07C1CF: CPX.b #$02
#_07C1D1: BEQ .play_sfx

#_07C1D3: CPX.b #$04
#_07C1D5: BNE .skip_sfx

.play_sfx
#_07C1D7: PHX

#_07C1D8: LDA.b #$32 ; SFX3.32
#_07C1DA: JSR PlaySFX_Set3

#_07C1DD: PLX

.skip_sfx
#_07C1DE: TXA
#_07C1DF: JSL Sprite_SpawnImmediatelySmashedTerrain

.exit
#_07C1E3: RTS

;===================================================================================================

Link_AddInVelocityYFalling:
#_07C1E4: REP #$20

#_07C1E6: LDA.b $51
#_07C1E8: AND.w #$0007

#_07C1EB: LDY.b $30
#_07C1ED: BPL .positive

#_07C1EF: SEC
#_07C1F0: SBC.w #$0008

.positive
#_07C1F3: EOR.w #$FFFF
#_07C1F6: INC A

#_07C1F7: CLC
#_07C1F8: ADC.b $20
#_07C1FA: STA.b $20

#_07C1FC: SEP #$20

#_07C1FE: RTS

;===================================================================================================

CalculateSnapScratch_Vertical:
#_07C1FF: LDA.b $0E
#_07C201: AND.b #$04
#_07C203: BEQ .invert_first

#_07C205: LDY.b #$01
#_07C207: LDA.b $30
#_07C209: BMI .negative_y_a

#_07C20B: EOR.b #$FF
#_07C20D: INC A

.negative_y_a
#_07C20E: BPL .positive_y_a

#_07C210: LDY.b #$FF

.positive_y_a
#_07C212: STY.b $00
#_07C214: STZ.b $01

#_07C216: BRA AddAbsoluteScratchToXCoord

.invert_first
#_07C218: LDY.b #$01

#_07C21A: LDA.b $30
#_07C21C: BPL .positive_y_b

#_07C21E: EOR.b #$FF
#_07C220: INC A

.positive_y_b
#_07C221: BPL .positive_y_c

#_07C223: LDY.b #$FF

.positive_y_c
#_07C225: STY.b $00
#_07C227: STZ.b $01

;===================================================================================================

AddAbsoluteScratchToXCoord:
#_07C229: REP #$20

#_07C22B: LDA.b $00
#_07C22D: CMP.w #$0080
#_07C230: BCC .positive

#_07C232: ORA.w #$FF00

.positive
#_07C235: CLC
#_07C236: ADC.b $22
#_07C238: STA.b $22

#_07C23A: SEP #$20

#_07C23C: RTS

;===================================================================================================

ChangeAxisOfPerpendicularDoorMovement_Vertical:
#_07C23D: LDA.b #$02
#_07C23F: TSB.b $50

#_07C241: LDA.b $0E
#_07C243: LSR A
#_07C244: LSR A
#_07C245: LSR A
#_07C246: LSR A
#_07C247: ORA.b $0E
#_07C249: AND.b #$0F
#_07C24B: STA.b $00

#_07C24D: AND.b #$07
#_07C24F: BNE .dont_clear_doorway

#_07C251: STZ.b $6C

#_07C253: BRA .exit

;---------------------------------------------------------------------------------------------------

.dont_clear_doorway
#_07C255: LDA.b $22
#_07C257: CMP.b #$80
#_07C259: BCC .x_low_positive

#_07C25B: LDY.b #$01

#_07C25D: LDA.b $30
#_07C25F: BMI .keep_negative_x

#_07C261: EOR.b #$FF
#_07C263: INC A

.keep_negative_x
#_07C264: BPL .keep_y1_positive

#_07C266: LDY.b #$FF

.keep_y1_positive
#_07C268: STY.b $00
#_07C26A: STZ.b $01

#_07C26C: LDY.b #$04
#_07C26E: BRA .continue

;---------------------------------------------------------------------------------------------------

.x_low_positive
#_07C270: LDY.b #$01

#_07C272: LDA.b $30
#_07C274: BPL .keep_positive_x

#_07C276: EOR.b #$FF
#_07C278: INC A

.keep_positive_x
#_07C279: BPL .keep_y2_positive

#_07C27B: LDY.b #$FF

.keep_y2_positive
#_07C27D: STY.b $00
#_07C27F: STZ.b $01

#_07C281: LDY.b #$06

.continue
#_07C283: LDA.b $50
#_07C285: AND.b #$01
#_07C287: BNE .cannot_turn

#_07C289: STY.b $2F

.cannot_turn
#_07C28B: REP #$20

#_07C28D: LDA.b $00
#_07C28F: CMP.w #$0080
#_07C292: BCC .positive

#_07C294: ORA.w #$FF00

.positive
#_07C297: CLC
#_07C298: ADC.b $22
#_07C29A: STA.b $22

#_07C29C: SEP #$20

.exit
#_07C29E: RTS

;===================================================================================================

Link_AddInVelocityY:
#_07C29F: REP #$20

#_07C2A1: LDA.b $30
#_07C2A3: AND.w #$00FF
#_07C2A6: CMP.w #$0080
#_07C2A9: BCC .positive

#_07C2AB: ORA.w #$FF00

.positive
#_07C2AE: EOR.w #$FFFF
#_07C2B1: INC A
#_07C2B2: CLC
#_07C2B3: ADC.b $20
#_07C2B5: STA.b $20

#_07C2B7: SEP #$20

#_07C2B9: RTS

;===================================================================================================

pool Link_HopInOrOutOfWater_Vertical

.speed_y
#_07C2BA: db 24, 16, 16

.speed_z
#_07C2BD: db 36, 24, 24

.timer
#_07C2C0: db 16, 16, 16

pool off

;---------------------------------------------------------------------------------------------------

Link_HopInOrOutOfWater_Vertical:
#_07C2C3: LDA.b $1B
#_07C2C5: BNE .indoors

#_07C2C7: LDX.b #$02
#_07C2C9: BRA .continue

.indoors
#_07C2CB: LDX.b $1D

#_07C2CD: LDA.w $047A
#_07C2D0: BEQ .continue

#_07C2D2: LDX.b #$00

.continue
#_07C2D4: STX.b $00

#_07C2D6: LDA.w .speed_y,X
#_07C2D9: TAX

#_07C2DA: LDA.b $66
#_07C2DC: BNE .dont_invert

#_07C2DE: TXA
#_07C2DF: EOR.b #$FF
#_07C2E1: INC A
#_07C2E2: TAX

.dont_invert
#_07C2E3: STX.b $27
#_07C2E5: STZ.b $28

#_07C2E7: LDX.b $00

#_07C2E9: LDA.w .speed_z,X
#_07C2EC: STA.b $29
#_07C2EE: STA.w $02C7

#_07C2F1: STZ.b $24
#_07C2F3: STZ.b $25

#_07C2F5: LDA.w .timer,X
#_07C2F8: STA.b $46

#_07C2FA: LDA.b $4D
#_07C2FC: CMP.b #$02
#_07C2FE: BEQ .already_recoiling

#_07C300: LDA.b #$01
#_07C302: STA.b $4D

#_07C304: STZ.w $0360

.already_recoiling
#_07C307: LDA.b #$06 ; LINKSTATE 06
#_07C309: STA.b $5D

#_07C30B: RTS

;===================================================================================================

pool Link_FindValidLandingTile_North

.recoil_y
#_07C30C: db $10, $10, $14, $14, $18, $18, $1C, $1C
#_07C314: db $20, $20, $24, $24, $28, $28, $2C, $2C
#_07C31C: db $30, $30, $30, $30, $30, $30, $30, $30
#_07C324: db $30, $30, $30, $30, $30, $30, $30, $30

.recoil_z
#_07C32C: db $18, $18, $18, $18, $1C, $1C, $1C, $1C
#_07C334: db $20, $20, $20, $20, $24, $24, $24, $24
#_07C33C: db $28, $28, $28, $28, $2C, $2C, $2C, $2C
#_07C344: db $30, $30, $30, $30, $34, $34, $34, $34

.timer
#_07C34C: db $10, $10, $14, $14, $18, $18, $1C, $1C
#_07C354: db $20, $20, $24, $24, $28, $28, $2C, $2C
#_07C35C: db $30, $30, $30, $30, $30, $30, $30, $30
#_07C364: db $30, $30, $30, $30, $30, $30, $30, $30

pool off

;---------------------------------------------------------------------------------------------------

Link_FindValidLandingTile_North:
#_07C36C: LDA.b $20
#_07C36E: STA.b $32

#_07C370: PHA

#_07C371: LDA.b $21
#_07C373: STA.b $33

#_07C375: PHA

;---------------------------------------------------------------------------------------------------

.next
#_07C376: REP #$20

#_07C378: LDA.b $20
#_07C37A: SEC
#_07C37B: SBC.w #$0010
#_07C37E: STA.b $20

#_07C380: SEP #$20

#_07C382: LDA.b $66
#_07C384: ASL A
#_07C385: TAY

#_07C386: JSR TileDetect_Movement_Vertical

#_07C389: LDA.w $0343
#_07C38C: ORA.w $035B
#_07C38F: ORA.w $0357
#_07C392: ORA.w $0341

#_07C395: AND.b #$07
#_07C397: CMP.b #$07
#_07C399: BNE .next

;---------------------------------------------------------------------------------------------------

#_07C39B: LDA.w $0341
#_07C39E: AND.b #$07
#_07C3A0: BEQ .didnt_find_water

#_07C3A2: LDA.b #$01
#_07C3A4: STA.b $4D

#_07C3A6: STZ.w $0360

#_07C3A9: LDA.b #$01
#_07C3AB: STA.w $0345

#_07C3AE: LDA.b $26
#_07C3B0: STA.w $0340

#_07C3B3: JSL Link_ResetSwimmingState

#_07C3B7: STZ.w $0376
#_07C3BA: STZ.b $5E

;---------------------------------------------------------------------------------------------------

.didnt_find_water
#_07C3BC: REP #$20

#_07C3BE: LDA.b $20
#_07C3C0: SEC
#_07C3C1: SBC.w #$0010
#_07C3C4: STA.b $20

#_07C3C6: LDA.b $32
#_07C3C8: SEC
#_07C3C9: SBC.b $20
#_07C3CB: STA.b $32

;---------------------------------------------------------------------------------------------------

#_07C3CD: SEP #$20

#_07C3CF: PLA
#_07C3D0: STA.b $21

#_07C3D2: PLA
#_07C3D3: STA.b $20

#_07C3D5: LDA.b $32
#_07C3D7: LSR A
#_07C3D8: LSR A
#_07C3D9: LSR A
#_07C3DA: TAY

#_07C3DB: LDA.w .recoil_y,Y
#_07C3DE: TAX

#_07C3DF: LDA.b $66
#_07C3E1: BNE .dont_flip

#_07C3E3: TXA
#_07C3E4: EOR.b #$FF
#_07C3E6: INC A
#_07C3E7: TAX

.dont_flip
#_07C3E8: STX.b $27
#_07C3EA: STZ.b $28

#_07C3EC: LDA.w .recoil_z,Y
#_07C3EF: STA.b $29
#_07C3F1: STA.w $02C7

#_07C3F4: STZ.b $24
#_07C3F6: STZ.b $25

#_07C3F8: LDA.w .timer,Y
#_07C3FB: STA.b $46

#_07C3FD: LDA.b #$02
#_07C3FF: STA.b $4D

#_07C401: STZ.w $0360

#_07C404: LDA.b #$06 ; LINKSTATE 06
#_07C406: STA.b $5D

#_07C408: RTS

;===================================================================================================

pool Link_FindValidLandingTile_DiagonalNorth

.recoil_y
#_07C409: db $08, $08, $08, $08, $10, $10, $14, $14
#_07C411: db $18, $18, $18, $18, $20, $20, $20, $20
#_07C419: db $08, $14, $14, $14, $18, $18, $18, $18
#_07C421: db $1C, $1C, $1C, $1C, $20, $20, $20, $20

.recoil_x
#_07C429: db $08, $08, $08, $08, $10, $10, $10, $10
#_07C431: db $18, $18, $18, $18, $10, $10, $10, $10
#_07C439: db $08, $14, $14, $14, $18, $18, $18, $18
#_07C441: db $1C, $1C, $1C, $1C, $20, $20, $20, $20

.recoil_z
#_07C449: db $20, $20, $20, $20, $20, $20, $20, $20
#_07C451: db $24, $24, $24, $24, $28, $28, $28, $28
#_07C459: db $20, $28, $28, $28, $2C, $2C, $2C, $2C
#_07C461: db $30, $30, $30, $30, $34, $34, $34, $34
#_07C469: db $E0, $FF, $20, $00

pool off

;---------------------------------------------------------------------------------------------------

Link_FindValidLandingTile_DiagonalNorth:
#_07C46D: LDA.b $3E
#_07C46F: PHA

#_07C470: LDA.b $22
#_07C472: PHA

#_07C473: LDA.b $23
#_07C475: PHA

#_07C476: LDX.b $66
#_07C478: PHX

#_07C479: LDY.b #$01
#_07C47B: CPX.b #$02
#_07C47D: BNE .positive

#_07C47F: LDY.b #$FF

.positive
#_07C481: STY.b $28

#_07C483: LDA.b #$00
#_07C485: STA.b $66

#_07C487: JSR LinkHop_FindLandingSpotDiagonallyDown

#_07C48A: PLX

#_07C48B: PLA
#_07C48C: STA.b $23

#_07C48E: PLA
#_07C48F: STA.b $22

#_07C491: PLA
#_07C492: STA.b $3E

;---------------------------------------------------------------------------------------------------

#_07C494: REP #$20

#_07C496: LDA.b $32
#_07C498: SEC
#_07C499: SBC.b $20
#_07C49B: LSR A
#_07C49C: LSR A
#_07C49D: LSR A
#_07C49E: TAY

#_07C49F: LDA.b $32
#_07C4A1: STA.b $20

#_07C4A3: SEP #$20

#_07C4A5: LDA.w .recoil_y,Y
#_07C4A8: EOR.b #$FF
#_07C4AA: INC A
#_07C4AB: STA.b $27

#_07C4AD: LDA.w .recoil_x,Y
#_07C4B0: CPX.b #$02
#_07C4B2: BNE .dont_flip_sign

#_07C4B4: EOR.b #$FF
#_07C4B6: INC A

.dont_flip_sign
#_07C4B7: STA.b $28

#_07C4B9: LDA.w .recoil_z,Y
#_07C4BC: STA.b $29
#_07C4BE: STA.w $02C7

#_07C4C1: STZ.b $24
#_07C4C3: STZ.b $25
#_07C4C5: STZ.w $0364

#_07C4C8: LDA.b #$02
#_07C4CA: STA.b $4D

#_07C4CC: STZ.w $0360

#_07C4CF: LDA.b #$0D ; LINKSTATE 0D
#_07C4D1: STA.b $5D

#_07C4D3: RTS

;===================================================================================================

StartMovementCollisionChecks_Horizontal:
#_07C4D4: LDA.b $31
#_07C4D6: BNE .moving_on_axis

#_07C4D8: RTS

.moving_on_axis
#_07C4D9: LDA.b $6C
#_07C4DB: CMP.b #$02
#_07C4DD: BNE .not_in_horizontal_door

#_07C4DF: LDY.b #$04

#_07C4E1: LDA.b $22
#_07C4E3: CMP.b #$80
#_07C4E5: BCC .negative_x
#_07C4E7: BRA .continue_x

.not_in_horizontal_door
#_07C4E9: LDY.b #$04
#_07C4EB: LDA.b $31
#_07C4ED: BMI .negative_x

.continue_x
#_07C4EF: LDY.b #$06

.negative_x
#_07C4F1: TYA
#_07C4F2: LSR A
#_07C4F3: STA.b $66

#_07C4F5: JSR TileDetect_Movement_Horizontal

#_07C4F8: LDA.b $1B
#_07C4FA: BNE StartMovementCollisionChecks_Horizontal_HandleIndoors

#_07C4FC: BRL StartMovementCollisionChecks_Horizontal_HandleOutdoors

;===================================================================================================

StartMovementCollisionChecks_Horizontal_HandleIndoors:
#_07C4FF: LDA.w $0308
#_07C502: BMI .carrying_something

#_07C504: LDA.b $46
#_07C506: BEQ .not_taking_damage

.carrying_something
#_07C508: LDA.b $0E
#_07C50A: LSR A
#_07C50B: LSR A
#_07C50C: LSR A
#_07C50D: LSR A
#_07C50E: TSB.b $0E

#_07C510: BRL ResetDoorPropsIfMovingWall_Horizontal

;---------------------------------------------------------------------------------------------------

.not_taking_damage
#_07C513: LDA.b $6A
#_07C515: BNE .not_moving_diagonally

#_07C517: STZ.b $57

.not_moving_diagonally
#_07C519: LDA.b $6C
#_07C51B: CMP.b #$01
#_07C51D: BNE HandleAutoDoorFlagging_Horizontal

#_07C51F: LDA.b $6A
#_07C521: BNE HandleAutoDoorFlagging_Horizontal

#_07C523: LDA.w $046C
#_07C526: CMP.b #$03
#_07C528: BNE .no_moving_floor

#_07C52A: LDA.b $EE
#_07C52C: BEQ .no_moving_floor

#_07C52E: BRL CheckForMasksRupeesConveyors_Horizontal

.no_moving_floor
#_07C531: JSR SnapOnX
#_07C534: JSR ChangeAxisOfPerpendicularDoorMovement_Horizontal
#_07C537: BRL HandleNudgingInADoor

;===================================================================================================

HandleAutoDoorFlagging_Horizontal:
#_07C53A: LDA.b $0E
#_07C53C: AND.b #$70
#_07C53E: BEQ ResetDoorPropsIfMovingWall_Horizontal

#_07C540: STZ.b $05

#_07C542: LDA.b $0F
#_07C544: AND.b #$07
#_07C546: BEQ .no_auto_move

#_07C548: LDY.b #$02

#_07C54A: LDA.b $31
#_07C54C: BMI .negative_x

#_07C54E: LDY.b #$03

.negative_x
#_07C550: LDA.w AutoMove49Directions,Y
#_07C553: STA.b $49

;---------------------------------------------------------------------------------------------------

.no_auto_move
#_07C555: LDA.b #$02
#_07C557: STA.b $6C

#_07C559: STZ.w $03F3

#_07C55C: LDA.b $0E
#_07C55E: AND.b #$70
#_07C560: CMP.b #$70
#_07C562: BEQ .dont_snap

#_07C564: LDA.b $0E
#_07C566: AND.b #$07
#_07C568: BNE .go_snap

#_07C56A: LDA.b $0E
#_07C56C: AND.b #$70
#_07C56E: BNE .dont_snap

#_07C570: BRA ResetDoorPropsIfMovingWall_Horizontal

.go_snap
#_07C572: STZ.b $6B
#_07C574: STZ.b $6C

#_07C576: JSR SnapOnX

#_07C579: JML CalculateSnapScratch_Horizontal

.dont_snap
#_07C57D: LDA.w $0315
#_07C580: AND.b #$02
#_07C582: BNE .exit

#_07C584: LDA.b $50
#_07C586: AND.b #$FD
#_07C588: STA.b $50

.exit
#_07C58A: RTS

;===================================================================================================

ResetDoorPropsIfMovingWall_Horizontal:
#_07C58B: LDA.w $0315
#_07C58E: AND.b #$02
#_07C590: BNE CheckForMasksRupeesConveyors_Horizontal

#_07C592: LDA.b $50
#_07C594: AND.b #$FD
#_07C596: STA.b $50

#_07C598: STZ.b $6C
#_07C59A: STZ.b $EF
#_07C59C: STZ.b $49

;===================================================================================================

CheckForMasksRupeesConveyors_Horizontal:
#_07C59E: LDA.b $0E
#_07C5A0: AND.b #$02
#_07C5A2: BNE HandleMasksRupeesConveyors_Horizontal

#_07C5A4: LDA.b $0C
#_07C5A6: AND.b #$05
#_07C5A8: BEQ HandleMasksRupeesConveyors_Horizontal

#_07C5AA: STZ.w $03F3

#_07C5AD: JSR FlagMovingIntoSlopes_Horizontal

#_07C5B0: LDA.b $6B
#_07C5B2: AND.b #$0F
#_07C5B4: BEQ HandleMasksRupeesConveyors_Horizontal

#_07C5B6: RTS

;===================================================================================================

HandleMasksRupeesConveyors_Horizontal:
#_07C5B7: STZ.b $6B

#_07C5B9: LDA.b $EE
#_07C5BB: BNE .lower_layer

#_07C5BD: LDA.w $034C
#_07C5C0: AND.b #$07
#_07C5C2: BEQ .no_mask_1C

#_07C5C4: LDA.b #$01
#_07C5C6: TSB.w $0322

#_07C5C9: BRA .check_for_rupee_tiles

;---------------------------------------------------------------------------------------------------

.no_mask_1C
#_07C5CB: LDA.w $02E8
#_07C5CE: AND.b #$07
#_07C5D0: BNE .check_for_rupee_tiles

#_07C5D2: LDA.b $0E
#_07C5D4: AND.b #$02
#_07C5D6: BNE .check_for_rupee_tiles

#_07C5D8: LDA.w $0322
#_07C5DB: AND.b #$FE
#_07C5DD: STA.w $0322
#_07C5E0: BRA .check_for_rupee_tiles

.lower_layer
#_07C5E2: LDA.w $0320
#_07C5E5: AND.b #$07
#_07C5E7: BEQ .no_mask0C

#_07C5E9: LDA.b #$02
#_07C5EB: TSB.w $0322

#_07C5EE: BRA .check_for_rupee_tiles

.no_mask0C
#_07C5F0: LDA.w $0322
#_07C5F3: AND.b #$FD
#_07C5F5: STA.w $0322

;---------------------------------------------------------------------------------------------------

.check_for_rupee_tiles
#_07C5F8: LDA.w $02F7
#_07C5FB: AND.b #$22
#_07C5FD: BEQ .no_rupee_tiles

#_07C5FF: LDX.b #$00
#_07C601: AND.b #$20
#_07C603: BEQ .no_rupee_from_this_side

#_07C605: LDX.b #$08

.no_rupee_from_this_side
#_07C607: STX.b $00

#_07C609: STZ.b $01

#_07C60B: LDA.b $66
#_07C60D: ASL A
#_07C60E: TAY

#_07C60F: REP #$20

#_07C611: LDA.l $7EF360
#_07C615: CLC
#_07C616: ADC.w #$0005
#_07C619: STA.l $7EF360

#_07C61D: LDA.b $20
#_07C61F: CLC
#_07C620: ADC.w RupeeTileOffset_y,Y
#_07C623: SEC
#_07C624: SBC.b $00
#_07C626: STA.b $00

#_07C628: LDA.b $22
#_07C62A: CLC
#_07C62B: ADC.w RupeeTileOffset_x,Y
#_07C62E: STA.b $02

#_07C630: SEP #$20

#_07C632: JSL Underworld_DeleteRupeeTile

#_07C636: LDA.b #$0A ; SFX3.0A
#_07C638: JSR PlaySFX_Set3

;---------------------------------------------------------------------------------------------------

.no_rupee_tiles
#_07C63B: LDY.b #$01 ; up

#_07C63D: LDA.w $03F1
#_07C640: AND.b #$22
#_07C642: BEQ .no_conveyor_ud

#_07C644: AND.b #$20
#_07C646: BEQ .up_conveyor

#_07C648: LDY.b #$02 ; down

.up_conveyor
#_07C64A: STY.w $03F3

#_07C64D: BRA Link_CheckForLedgeTile_Horizontal

;---------------------------------------------------------------------------------------------------

.no_conveyor_ud
#_07C64F: LDY.b #$03 ; left

#_07C651: LDA.w $03F2
#_07C654: AND.b #$22
#_07C656: BEQ .no_conveyor_lr

#_07C658: AND.b #$20
#_07C65A: BEQ .left_conveyor

#_07C65C: LDY.b #$04 ; right

.left_conveyor
#_07C65E: STY.w $03F3

#_07C661: BRA Link_CheckForLedgeTile_Horizontal

;---------------------------------------------------------------------------------------------------

.no_conveyor_lr
#_07C663: LDA.w $02E8
#_07C666: AND.b #$07
#_07C668: BNE Link_CheckForLedgeTile_Horizontal

#_07C66A: LDA.b $0E
#_07C66C: AND.b #$02
#_07C66E: BNE Link_CheckForLedgeTile_Horizontal

#_07C670: STZ.w $03F3

;===================================================================================================

Link_CheckForLedgeTile_Horizontal:
#_07C673: LDA.w $036E
#_07C676: AND.b #$07
#_07C678: CMP.b #$07
#_07C67A: BNE Link_CheckForWaterTiles_Horizontal

#_07C67C: JSR RunLedgeHopTimer
#_07C67F: BCC Link_CheckForWaterTiles_Horizontal

#_07C681: JSR Link_CancelDash

#_07C684: INC.w $047A

#_07C687: LDA.b #$02
#_07C689: STA.b $4D

#_07C68B: BRA HandleUnderworldHopOntoWater_Horizontal

;===================================================================================================

Link_CheckForWaterTiles_Horizontal:
#_07C68D: LDA.w $0341
#_07C690: AND.b #$07
#_07C692: CMP.b #$07
#_07C694: BNE .not_deep_water

#_07C696: LDA.w $0345
#_07C699: BNE .not_deep_water

#_07C69B: LDA.b $5D
#_07C69D: CMP.b #$06 ; LINKSTATE 06
#_07C69F: BEQ .not_deep_water

#_07C6A1: LDA.b $3E
#_07C6A3: STA.b $20

#_07C6A5: LDA.b $40
#_07C6A7: STA.b $21

#_07C6A9: LDA.b $3F
#_07C6AB: STA.b $22

#_07C6AD: LDA.b $41
#_07C6AF: STA.b $23

#_07C6B1: JSR Link_CancelDash

#_07C6B4: LDA.b $1D
#_07C6B6: BNE .dont_change_layer

#_07C6B8: JSL Underworld_HandleLayerChange
#_07C6BC: BRA HandleUnderworldHopOntoWater_Horizontal

.dont_change_layer
#_07C6BE: LDA.b #$01
#_07C6C0: STA.w $0345

#_07C6C3: LDA.b $26
#_07C6C5: STA.w $0340

#_07C6C8: STZ.w $0308
#_07C6CB: STZ.w $0309

#_07C6CE: STZ.w $0376

#_07C6D1: STZ.b $5E

#_07C6D3: JSL Link_ResetSwimmingState

;===================================================================================================

#HandleUnderworldHopOntoWater_Horizontal:
#_07C6D7: LDA.b #$01
#_07C6D9: STA.w $037B

#_07C6DC: JSR Link_HopInOrOutOfWater_Horizontal

#_07C6DF: LDA.b #$20 ; SFX2.20
#_07C6E1: JSR PlaySFX_Set2

#_07C6E4: BRA HandleUnderworldPitSlip_Horizontal

.not_deep_water
#_07C6E6: LDA.w $0343
#_07C6E9: AND.b #$07
#_07C6EB: CMP.b #$07
#_07C6ED: BNE HandleUnderworldPitSlip_Horizontal

#_07C6EF: LDA.w $0345
#_07C6F2: BEQ HandleUnderworldPitSlip_Horizontal

#_07C6F4: LDA.b $4D
#_07C6F6: BEQ .not_in_recoil

#_07C6F8: LDA.b #$07
#_07C6FA: STA.b $0E
#_07C6FC: BRA HandleUnderworldPitSlip_Horizontal

.not_in_recoil
#_07C6FE: JSR Link_CancelDash

#_07C701: LDA.b $4D
#_07C703: BNE HandleUnderworldPitSlip_Horizontal

#_07C705: LDA.w $0340
#_07C708: STA.b $26

#_07C70A: STZ.w $0345

#_07C70D: LDA.b #$15 ; ANCILLA 15
#_07C70F: LDY.b #$00
#_07C711: JSL AncillaAdd_Splash

#_07C715: LDA.b #$01
#_07C717: STA.w $037B

#_07C71A: JSR Link_HopInOrOutOfWater_Horizontal

;===================================================================================================

HandleUnderworldPitSlip_Horizontal:
#_07C71D: LDA.b $59
#_07C71F: AND.b #$05
#_07C721: BEQ HandleUnderworldSpikeBlockCollision_Horizontal

#_07C723: LDA.b $0E
#_07C725: AND.b #$02
#_07C727: BNE HandleUnderworldSpikeBlockCollision_Horizontal

#_07C729: LDA.b $5D
#_07C72B: CMP.b #$05 ; LINKSTATE 05
#_07C72D: BEQ .exit

#_07C72F: CMP.b #$02 ; LINKSTATE 02
#_07C731: BEQ .exit

#_07C733: LDA.b #$09
#_07C735: STA.b $5C

#_07C737: STZ.b $5A

#_07C739: LDA.b #$01
#_07C73B: STA.b $5B

#_07C73D: LDA.b #$01 ; LINKSTATE 01
#_07C73F: STA.b $5D

.exit
#_07C741: RTS

;===================================================================================================

HandleUnderworldSpikeBlockCollision_Horizontal:
#_07C742: STZ.b $5B

#_07C744: LDA.w $02E8
#_07C747: AND.b #$07
#_07C749: BEQ .check_collision_type

#_07C74B: LDA.b $46
#_07C74D: ORA.w $031F
#_07C750: ORA.b $55
#_07C752: BNE .no_spike_damage

#_07C754: LDA.b $22

#_07C756: LDY.b $66
#_07C758: CPY.b #$02
#_07C75A: BNE .didnt_move

#_07C75C: AND.b #$04
#_07C75E: BEQ .not_on_4px_edge
#_07C760: BRA .check_collision_type

.didnt_move
#_07C762: AND.b #$04
#_07C764: BEQ .check_collision_type

.not_on_4px_edge
#_07C766: LDA.w $031F
#_07C769: BNE .check_collision_type

#_07C76B: LDA.l $7EF35B
#_07C76F: TAY

#_07C770: LDA.w SpikeDamageValues,Y
#_07C773: STA.w $0373

#_07C776: JSR Link_CancelDash
#_07C779: JSR Link_ForceUnequipCape_quietly

#_07C77C: BRL LinkApplyTileRebound

;---------------------------------------------------------------------------------------------------

.no_spike_damage
#_07C77F: LDA.w $02E8
#_07C782: AND.b #$07
#_07C784: STA.b $0E

.check_collision_type
#_07C786: LDA.w $046C
#_07C789: BEQ .ignore_layer

#_07C78B: CMP.b #$04
#_07C78D: BEQ .ignore_layer

#_07C78F: LDA.b $EE
#_07C791: BNE CancelStairDragWithHorizontals

.ignore_layer
#_07C793: LDA.b $5F
#_07C795: ORA.b $60
#_07C797: BEQ .not_pushing_block

#_07C799: LDA.b $6A
#_07C79B: BNE .not_pushing_block

#_07C79D: LDA.b $5F
#_07C79F: STA.w $02C2

#_07C7A2: DEC.b $61
#_07C7A4: BPL CancelStairDragWithHorizontals

;---------------------------------------------------------------------------------------------------

#_07C7A6: REP #$20

#_07C7A8: LDY.b #$0F
#_07C7AA: LDA.b $5F

.check_next_block
#_07C7AC: ASL A
#_07C7AD: BCC .skip_block

#_07C7AF: PHA
#_07C7B0: PHY

#_07C7B1: SEP #$20

#_07C7B3: JSR FindFreeMovingBlockSlot
#_07C7B6: BCS .no_free_slot

#_07C7B8: STX.b $0E

#_07C7BA: TYA
#_07C7BB: ASL A
#_07C7BC: TAX

#_07C7BD: JSR InitializePushBlock
#_07C7C0: BCS .no_free_slot

#_07C7C2: LDA.b $0E
#_07C7C4: ASL A
#_07C7C5: TAY

#_07C7C6: JSR Underworld_DrawSinglePushBlock

#_07C7C9: TYX

#_07C7CA: LDY.b $66

#_07C7CC: TYA
#_07C7CD: ASL A
#_07C7CE: STA.w $05F8,X
#_07C7D1: STA.w $0474

#_07C7D4: LDA.w $05E4,X

#_07C7D7: CPY.b #$02
#_07C7D9: BEQ .not_pushing_left

#_07C7DB: DEC A

.not_pushing_left
#_07C7DC: AND.b #$0F
#_07C7DE: STA.w $05E8,X

.no_free_slot
#_07C7E1: REP #$20

#_07C7E3: PLY
#_07C7E4: PLA

.skip_block
#_07C7E5: DEY
#_07C7E6: BPL .check_next_block

;---------------------------------------------------------------------------------------------------

#_07C7E8: SEP #$20

.not_pushing_block
#_07C7EA: LDA.b #$15
#_07C7EC: STA.b $61

;===================================================================================================

CancelStairDragWithHorizontals:
#_07C7EE: LDA.b $6A
#_07C7F0: BNE HandlePushingBonkingSnaps_Horizontal

#_07C7F2: STZ.b $57

#_07C7F4: LDA.b $5E
#_07C7F6: CMP.b #$02
#_07C7F8: BNE HandlePushingBonkingSnaps_Horizontal

#_07C7FA: STZ.b $5E

;===================================================================================================

HandlePushingBonkingSnaps_Horizontal:
#_07C7FC: LDA.b $0E
#_07C7FE: AND.b #$07
#_07C800: BNE .check_swimming

#_07C802: BRL RestartPushingTimer_UnflagDoors_Horizontal

.check_swimming
#_07C805: LDA.b $5D
#_07C807: CMP.b #$04 ; LINKSTATE 04
#_07C809: BNE .not_swimming_or_moving

#_07C80B: LDA.w $0312
#_07C80E: BNE .not_swimming_or_moving

#_07C810: JSR ResetAllAcceleration

.not_swimming_or_moving
#_07C813: LDA.b $0E
#_07C815: AND.b #$02
#_07C817: BEQ .do_no_bonk

#_07C819: LDA.b $0E
#_07C81B: PHA

#_07C81C: JSR Link_BonkAndSmash
#_07C81F: JSR RepelDash

#_07C822: PLA
#_07C823: STA.b $0E

.do_no_bonk
#_07C825: LDA.b #$01
#_07C827: STA.w $0302

#_07C82A: LDA.b $0E
#_07C82C: AND.b #$07
#_07C82E: CMP.b #$07
#_07C830: BNE .no_x_snap

#_07C832: JSR SnapOnX
#_07C835: BRA .check_for_bonk

.no_x_snap
#_07C837: LDA.b $6A
#_07C839: CMP.b #$02
#_07C83B: BNE .not_horizontally_facing_diagonal

.diagonal_facing_vertically
#_07C83D: BRL RestartPushingTimer_Horizontal

.not_horizontally_facing_diagonal
#_07C840: JSR SnapOnX

#_07C843: LDA.b $6A
#_07C845: CMP.b #$01
#_07C847: BEQ .diagonal_facing_vertically

;---------------------------------------------------------------------------------------------------

.check_for_bonk
#_07C849: LDA.b $0E
#_07C84B: AND.b #$05
#_07C84D: CMP.b #$05
#_07C84F: BEQ .definitely_bonk

#_07C851: AND.b #$04
#_07C853: BEQ .no_bonk_this_way

#_07C855: LDY.b #$01
#_07C857: LDA.b $31
#_07C859: BMI .already_negative

#_07C85B: EOR.b #$FF
#_07C85D: INC A

.already_negative
#_07C85E: BPL .extra_positive_check

#_07C860: LDY.b #$FF

.extra_positive_check
#_07C862: STY.b $00
#_07C864: STZ.b $01

#_07C866: LDA.b $0E
#_07C868: AND.b #$02
#_07C86A: BNE HandlePushingObstruction_Horizontal

#_07C86C: LDA.b $20
#_07C86E: AND.b #$07
#_07C870: BNE .do_not_bonk

#_07C872: JSR Link_BonkAndSmash
#_07C875: JSR RepelDash

#_07C878: BRA HandlePushingObstruction_Horizontal

;---------------------------------------------------------------------------------------------------

.no_bonk_this_way
#_07C87A: LDY.b #$01

#_07C87C: LDA.b $31
#_07C87E: BPL .already_positive

#_07C880: EOR.b #$FF
#_07C882: INC A

.already_positive
#_07C883: BPL .make_sure_not_negative

#_07C885: LDY.b #$FF

.make_sure_not_negative
#_07C887: STY.b $00
#_07C889: STZ.b $01

#_07C88B: LDA.b $0E
#_07C88D: AND.b #$02
#_07C88F: BNE HandlePushingObstruction_Horizontal

#_07C891: LDA.b $20
#_07C893: AND.b #$07
#_07C895: BNE .do_not_bonk

.definitely_bonk
#_07C897: JSR Link_BonkAndSmash
#_07C89A: JSR RepelDash

#_07C89D: BRA HandlePushingObstruction_Horizontal

.do_not_bonk
#_07C89F: JSR AddAbsoluteScratchToYCoord

#_07C8A2: JMP.w HandleNudging

;===================================================================================================

HandlePushingObstruction_Horizontal:
#_07C8A5: LDA.b $66
#_07C8A7: ASL A
#_07C8A8: CMP.b $2F
#_07C8AA: BNE RestartPushingTimer_Horizontal

#_07C8AC: LDA.w $0315
#_07C8AF: AND.b #$01
#_07C8B1: ASL A
#_07C8B2: TSB.b $48

#_07C8B4: LDA.b $3C
#_07C8B6: BNE .dont_run_push_timer

#_07C8B8: DEC.w $0371
#_07C8BB: BPL EXIT_07C8E8

.dont_run_push_timer
#_07C8BD: LDY.w $0315

#_07C8C0: LDA.w $02F6
#_07C8C3: AND.b #$20
#_07C8C5: BEQ .not_a_flaggable_door

#_07C8C7: LDA.w $0315
#_07C8CA: ASL A
#_07C8CB: ASL A
#_07C8CC: ASL A
#_07C8CD: TAY

.not_a_flaggable_door
#_07C8CE: TYA
#_07C8CF: TSB.b $48

#_07C8D1: BRA RestartPushingTimer_Horizontal

;===================================================================================================

RestartPushingTimer_UnflagDoors_Horizontal:
#_07C8D3: LDA.b $EE
#_07C8D5: BNE EXIT_07C8E8

#_07C8D7: LDA.b $48
#_07C8D9: AND.b #$F6
#_07C8DB: STA.b $48

;===================================================================================================

RestartPushingTimer_Horizontal:
#_07C8DD: LDA.b #$20
#_07C8DF: STA.w $0371

#_07C8E2: LDA.b $48
#_07C8E4: AND.b #$FD
#_07C8E6: STA.b $48

;---------------------------------------------------------------------------------------------------

#EXIT_07C8E8:
#_07C8E8: RTS

;===================================================================================================

StartMovementCollisionChecks_Horizontal_HandleOutdoors:
#_07C8E9: LDA.b $6A
#_07C8EB: BNE .no_speed_reset

#_07C8ED: STZ.b $57

#_07C8EF: LDA.b $5E
#_07C8F1: CMP.b #$02
#_07C8F3: BNE .no_speed_reset

#_07C8F5: STZ.b $5E

.no_speed_reset
#_07C8F7: LDA.b $59
#_07C8F9: AND.b #$05
#_07C8FB: BEQ HandleLiftablesBeforeDeepWater_Horizontal

#_07C8FD: LDA.b $0E
#_07C8FF: AND.b #$02
#_07C901: BNE HandleLiftablesBeforeDeepWater_Horizontal

#_07C903: LDA.b $5D
#_07C905: CMP.b #$05 ; LINKSTATE 05
#_07C907: BEQ .exit

#_07C909: CMP.b #$02 ; LINKSTATE 02
#_07C90B: BEQ .exit

#_07C90D: LDA.b #$09
#_07C90F: STA.b $5C

#_07C911: STZ.b $5A

#_07C913: LDA.b #$01
#_07C915: STA.b $5B

#_07C917: LDA.b #$01 ; LINKSTATE 01
#_07C919: STA.b $5D

.exit
#_07C91B: RTS

;---------------------------------------------------------------------------------------------------

HandleLiftablesBeforeDeepWater_Horizontal:
#_07C91C: LDA.w $0366
#_07C91F: AND.b #$02
#_07C921: BEQ .not_touching_some_liftable

#_07C923: LDA.w $036A
#_07C926: LSR A
#_07C927: STA.w $0369

#_07C92A: BRA .index_is_set

.not_touching_some_liftable
#_07C92C: STZ.w $0369

.index_is_set
#_07C92F: LDA.w $0341
#_07C932: AND.b #$04
#_07C934: BEQ Link_HandleEnteringWater_Horizontal

#_07C936: BRA Link_CheckEnteringWater_Horizontal

;===================================================================================================

UNREACHABLE_07C938:
#_07C938: LDA.w $0341
#_07C93B: AND.b #$07
#_07C93D: CMP.b #$07
#_07C93F: BNE Link_HandleEnteringWater_Horizontal

;===================================================================================================

Link_CheckEnteringWater_Horizontal:
#_07C941: LDA.w $0345
#_07C944: BNE Link_HandleEnteringWater_Horizontal

#_07C946: LDA.b $4D
#_07C948: BNE Link_HandleEnteringWater_Horizontal

#_07C94A: JSR Link_CancelDash
#_07C94D: JSR Link_ResetSwordAndItemUsage

#_07C950: LDA.b #$01
#_07C952: STA.w $0345

#_07C955: LDA.b $26
#_07C957: STA.w $0340

#_07C95A: JSL Link_ResetSwimmingState

#_07C95E: STZ.w $0376
#_07C961: STZ.b $5E

#_07C963: LDA.w $0351
#_07C966: CMP.b #$01
#_07C968: BNE .jump_into_water

#_07C96A: JSR Link_ForceUnequipCape_quietly
#_07C96D: LDA.l $7EF356
#_07C971: BEQ .jump_into_water

#_07C973: LDA.w $02E0
#_07C976: BNE Link_HandleEnteringWater_Horizontal

#_07C978: LDA.b #$04 ; LINKSTATE 04
#_07C97A: STA.b $5D

#_07C97C: BRA Link_HandleEnteringWater_Horizontal

;---------------------------------------------------------------------------------------------------

.jump_into_water
#_07C97E: LDA.b $3E
#_07C980: STA.b $20

#_07C982: LDA.b $40
#_07C984: STA.b $21

#_07C986: LDA.b $3F
#_07C988: STA.b $22

#_07C98A: LDA.b $41
#_07C98C: STA.b $23

#_07C98E: LDA.b #$01
#_07C990: STA.w $037B

#_07C993: JSR Link_HopInOrOutOfWater_Horizontal

#_07C996: LDA.b #$20 ; SFX2.20
#_07C998: JSR PlaySFX_Set2

;===================================================================================================

Link_HandleEnteringWater_Horizontal:
#_07C99B: LDA.w $0345
#_07C99E: BEQ .not_on_deep_water

#_07C9A0: LDA.w $036E
#_07C9A3: AND.b #$07
#_07C9A5: CMP.b #$07
#_07C9A7: BEQ .no_horizontal_ledges
#_07C9A9: BRA .no_vertical_ledges

.not_on_deep_water
#_07C9AB: LDA.w $036D
#_07C9AE: AND.b #$42
#_07C9B0: BEQ .no_vertical_ledges

.no_horizontal_ledges
#_07C9B2: LDA.b #$07
#_07C9B4: STA.b $0E

#_07C9B6: BRL HandlePushingBonkingSnaps_Horizontal

.no_vertical_ledges
#_07C9B9: LDA.w $0343
#_07C9BC: AND.b #$07
#_07C9BE: CMP.b #$07
#_07C9C0: BNE Link_HandleLedgeTile_Horizontal

#_07C9C2: LDA.w $0345
#_07C9C5: BEQ Link_HandleLedgeTile_Horizontal

#_07C9C7: JSR Link_CancelDash

#_07C9CA: LDA.b $4D
#_07C9CC: BNE Link_HandleLedgeTile_Horizontal

#_07C9CE: LDA.w $0340
#_07C9D1: STA.b $26

#_07C9D3: STZ.w $0345

#_07C9D6: LDA.b #$15 ; ANCILLA 15
#_07C9D8: LDY.b #$00
#_07C9DA: JSL AncillaAdd_Splash

#_07C9DE: LDA.b #$01
#_07C9E0: STA.w $037B

#_07C9E3: BRL Link_HopInOrOutOfWater_Horizontal

;===================================================================================================

Link_HandleLedgeTile_Horizontal:
#_07C9E6: LDA.w $036E
#_07C9E9: AND.b #$07
#_07C9EB: BEQ Link_CheckForWeirdLedges_Horizontal

#_07C9ED: JSR RunLedgeHopTimer
#_07C9F0: BCC Link_CheckForWeirdLedges_Horizontal

#_07C9F2: LDA.b #$20 ; SFX2.20
#_07C9F4: JSR PlaySFX_Set2

#_07C9F7: LDX.b #$10

#_07C9F9: LDA.b $66
#_07C9FB: AND.b #$01
#_07C9FD: BNE .positive

#_07C9FF: TXA
#_07CA00: EOR.b #$FF
#_07CA02: INC A
#_07CA03: TAX

.positive
#_07CA04: STX.b $28

#_07CA06: JSR Link_CancelDash

#_07CA09: LDA.b #$02
#_07CA0B: STA.b $4D

#_07CA0D: LDA.b #$14
#_07CA0F: STA.w $0362
#_07CA12: STA.w $0363

#_07CA15: LDA.b #$FF
#_07CA17: STA.w $0364

#_07CA1A: LDA.b #$0C ; LINKSTATE 0C
#_07CA1C: STA.b $5D

#_07CA1E: LDA.b #$01
#_07CA20: STA.w $037B
#_07CA23: STA.b $78

#_07CA25: STZ.b $48
#_07CA27: STZ.b $5E

#_07CA29: LDA.b $1B
#_07CA2B: BNE .indoors

#_07CA2D: LDA.b #$02
#_07CA2F: STA.b $EE

.indoors
#_07CA31: LDA.b $66
#_07CA33: AND.b #$FD
#_07CA35: ASL A
#_07CA36: TAY

#_07CA37: LDA.b $22
#_07CA39: PHA

#_07CA3A: LDA.b $23
#_07CA3C: PHA

#_07CA3D: JSR Link_HoppingHorizontally_FindTile_Horizontal

#_07CA40: LDA.b #$01
#_07CA42: STA.b $66

#_07CA44: CPX.b #$FF
#_07CA46: BEQ .find_south

#_07CA48: JSR Link_HoppingHorizontally_FindTile_Vertical
#_07CA4B: BRL .continue

.find_south
#_07CA4E: JSR LinkHop_FindTileToLandOnSouth

.continue
#_07CA51: PLA
#_07CA52: STA.b $23

#_07CA54: PLA
#_07CA55: STA.b $22

#_07CA57: RTS

;===================================================================================================

Link_CheckForWeirdLedges_Horizontal:
#_07CA58: LDA.w $0370
#_07CA5B: AND.b #$77
#_07CA5D: BEQ CheckLedgeTypes_Horizontal

#_07CA5F: JSR RunLedgeHopTimer
#_07CA62: BCC CheckLedgeTypes_Horizontal

#_07CA64: LDA.b #$20 ; SFX2.20
#_07CA66: JSR PlaySFX_Set2

#_07CA69: LDX.b #$0F ; LINKSTATE 0F

#_07CA6B: AND.b #$07
#_07CA6D: BNE .dumb_thing_has_sfx

#_07CA6F: LDX.b #$10 ; LINKSTATE 10

.dumb_thing_has_sfx
#_07CA71: STX.b $5D

#_07CA73: LDX.b #$10

#_07CA75: LDA.b $66
#_07CA77: AND.b #$01
#_07CA79: BNE .positive

#_07CA7B: LDX.b #$F0

.positive
#_07CA7D: STX.b $28

#_07CA7F: JSR Link_CancelDash

#_07CA82: LDA.b #$02
#_07CA84: STA.b $4D

#_07CA86: LDA.b #$14
#_07CA88: STA.w $0362
#_07CA8B: STA.w $0363

#_07CA8E: LDA.b #$FF
#_07CA90: STA.w $0364

#_07CA93: STZ.b $46

#_07CA95: LDA.b #$01
#_07CA97: STA.w $037B
#_07CA9A: STA.b $78

#_07CA9C: STZ.b $48
#_07CA9E: STZ.b $5E

#_07CAA0: RTS

;===================================================================================================

CheckLedgeTypes_Horizontal:
#_07CAA1: LDA.w $036E
#_07CAA4: AND.b #$70
#_07CAA6: BEQ .dont_hop

#_07CAA8: LDA.w $036E
#_07CAAB: AND.b #$07
#_07CAAD: BNE .dont_hop

#_07CAAF: LDA.w $0370
#_07CAB2: AND.b #$77
#_07CAB4: BNE .dont_hop

#_07CAB6: LDA.b $5D
#_07CAB8: CMP.b #$0D ; LINKSTATE 0D
#_07CABA: BEQ .dont_hop

#_07CABC: JSR RunLedgeHopTimer
#_07CABF: BCC .dont_hop

#_07CAC1: LDA.b #$20 ; SFX2.20
#_07CAC3: JSR PlaySFX_Set2
#_07CAC6: JSR Link_CancelDash

#_07CAC9: LDA.b #$01
#_07CACB: STA.w $037B

#_07CACE: STZ.b $48
#_07CAD0: STZ.b $5E

#_07CAD2: BRL Link_FindValidLandingTile_DiagonalNorth

;---------------------------------------------------------------------------------------------------

.dont_hop
#_07CAD5: LDA.w $036F
#_07CAD8: AND.b #$07
#_07CADA: BEQ .dont_quickhop

#_07CADC: LDA.w $036E
#_07CADF: AND.b #$07
#_07CAE1: BNE .dont_quickhop

#_07CAE3: LDA.w $0370
#_07CAE6: AND.b #$77
#_07CAE8: BNE .dont_quickhop

#_07CAEA: JSR RunLedgeHopTimer
#_07CAED: BCC .dont_quickhop

#_07CAEF: LDX.b #$10

#_07CAF1: LDA.b $66
#_07CAF3: AND.b #$01
#_07CAF5: BNE .dont_invert

#_07CAF7: TXA
#_07CAF8: EOR.b #$FF
#_07CAFA: INC A
#_07CAFB: TAX

.dont_invert
#_07CAFC: STX.b $28

#_07CAFE: JSR Link_CancelDash

#_07CB01: LDA.b #$02
#_07CB03: STA.b $4D

#_07CB05: LDA.b #$14
#_07CB07: STA.w $0362
#_07CB0A: STA.w $0363

#_07CB0D: LDA.b #$FF
#_07CB0F: STA.w $0364

#_07CB12: LDA.b #$0E ; LINKSTATE 0E
#_07CB14: STA.b $5D

#_07CB16: STZ.b $46

#_07CB18: LDA.b #$01
#_07CB1A: STA.w $037B
#_07CB1D: STA.b $78

#_07CB1F: STZ.b $48
#_07CB21: STZ.b $5E

#_07CB23: RTS

;---------------------------------------------------------------------------------------------------

.dont_quickhop
#_07CB24: LDA.b $0E
#_07CB26: AND.b #$02
#_07CB28: BNE .slope_reset

#_07CB2A: LDA.b $0C
#_07CB2C: AND.b #$05
#_07CB2E: BEQ .slope_reset

#_07CB30: LDA.w $0372
#_07CB33: BEQ .not_dashing

#_07CB35: LDA.b $2F
#_07CB37: AND.b #$04
#_07CB39: BEQ .slope_reset

.not_dashing
#_07CB3B: JSR FlagMovingIntoSlopes_Horizontal

#_07CB3E: LDA.b $6B
#_07CB40: AND.b #$0F
#_07CB42: BEQ .slope_reset

#_07CB44: RTS

;---------------------------------------------------------------------------------------------------

.slope_reset
#_07CB45: STZ.b $6B

#_07CB47: LDA.w $02E8
#_07CB4A: AND.b #$07
#_07CB4C: BEQ .didnt_hit_spike

#_07CB4E: LDA.b $46
#_07CB50: ORA.w $031F
#_07CB53: ORA.b $55
#_07CB55: BNE .invulnerable

#_07CB57: LDA.b $22

#_07CB59: LDY.b $66
#_07CB5B: CPY.b #$02
#_07CB5D: BNE .invert_logic

#_07CB5F: AND.b #$04
#_07CB61: BEQ .take_damage
#_07CB63: BRA .didnt_hit_spike

.invert_logic
#_07CB65: AND.b #$04
#_07CB67: BEQ .didnt_hit_spike

.take_damage
#_07CB69: LDA.l $7EF35B
#_07CB6D: TAY

#_07CB6E: LDA.w SpikeDamageValues,Y
#_07CB71: STA.w $0373

#_07CB74: JSR Link_CancelDash

#_07CB77: BRL LinkApplyTileRebound

;---------------------------------------------------------------------------------------------------

.invulnerable
#_07CB7A: LDA.w $02E8
#_07CB7D: AND.b #$07
#_07CB7F: STA.b $0E

.didnt_hit_spike
#_07CB81: BRL HandlePushingBonkingSnaps_Horizontal

;===================================================================================================

SnapOnX:
#_07CB84: REP #$20

#_07CB86: LDA.b $22
#_07CB88: AND.w #$0007

#_07CB8B: LDY.b $31
#_07CB8D: BPL .positive_x

#_07CB8F: SEC
#_07CB90: SBC.w #$0008

.positive_x
#_07CB93: EOR.w #$FFFF
#_07CB96: INC A

#_07CB97: CLC
#_07CB98: ADC.b $22
#_07CB9A: STA.b $22

#_07CB9C: SEP #$20

#_07CB9E: RTS

;===================================================================================================

CalculateSnapScratch_Horizontal:
#_07CB9F: LDA.b $0E
#_07CBA1: AND.b #$04
#_07CBA3: BEQ .invert_if_negative

.invert_if_positive
#_07CBA5: LDY.b #$01

#_07CBA7: LDA.b $31
#_07CBA9: BMI .negative_x

#_07CBAB: EOR.b #$FF
#_07CBAD: INC A

.negative_x
#_07CBAE: BPL .was_positive_a

#_07CBB0: LDY.b #$FF

.was_positive_a
#_07CBB2: STY.b $00
#_07CBB4: STZ.b $01

#_07CBB6: BRA AddAbsoluteScratchToYCoord

.invert_if_negative
#_07CBB8: LDY.b #$01

#_07CBBA: LDA.b $31
#_07CBBC: BPL .positive_x

#_07CBBE: EOR.b #$FF
#_07CBC0: INC A

.positive_x
#_07CBC1: BPL .was_positive_b

#_07CBC3: LDY.b #$FF

.was_positive_b
#_07CBC5: STY.b $00
#_07CBC7: STZ.b $01

;===================================================================================================

AddAbsoluteScratchToYCoord:
#_07CBC9: REP #$20

#_07CBCB: LDA.b $00
#_07CBCD: CMP.w #$0080
#_07CBD0: BCC .positive

#_07CBD2: ORA.w #$FF00

.positive
#_07CBD5: CLC
#_07CBD6: ADC.b $20
#_07CBD8: STA.b $20

#_07CBDA: SEP #$20

#_07CBDC: RTS

;===================================================================================================

ChangeAxisOfPerpendicularDoorMovement_Horizontal:
#_07CBDD: LDA.b #$02
#_07CBDF: TSB.b $50

#_07CBE1: LDA.b $0E
#_07CBE3: LSR A
#_07CBE4: LSR A
#_07CBE5: LSR A
#_07CBE6: LSR A
#_07CBE7: ORA.b $0E
#_07CBE9: AND.b #$0F
#_07CBEB: STA.b $00

#_07CBED: AND.b #$07
#_07CBEF: BNE .dont_clear_doorway

#_07CBF1: STZ.b $6C

#_07CBF3: BRA .exit

;---------------------------------------------------------------------------------------------------

.dont_clear_doorway
#_07CBF5: LDA.b $20
#_07CBF7: CMP.b #$80
#_07CBF9: BCC .y_low_positive

#_07CBFB: LDA.b $31
#_07CBFD: BMI .keep_negative_x

#_07CBFF: EOR.b #$FF
#_07CC01: INC A

.keep_negative_x
#_07CC02: STA.b $00
#_07CC04: STZ.b $01

#_07CC06: LDY.b #$00
#_07CC08: BRA .continue

;---------------------------------------------------------------------------------------------------

.y_low_positive
#_07CC0A: LDA.b $31
#_07CC0C: BPL .keep_positive_x

#_07CC0E: EOR.b #$FF
#_07CC10: INC A

.keep_positive_x
#_07CC11: STA.b $00
#_07CC13: STZ.b $01

#_07CC15: LDY.b #$02

;---------------------------------------------------------------------------------------------------

.continue
#_07CC17: LDA.b $50
#_07CC19: AND.b #$01
#_07CC1B: BNE .cannot_turn

#_07CC1D: STY.b $2F

.cannot_turn
#_07CC1F: REP #$20

#_07CC21: LDA.b $00
#_07CC23: CMP.w #$0080
#_07CC26: BCC .positive

#_07CC28: ORA.w #$FF00

.positive
#_07CC2B: CLC
#_07CC2C: ADC.b $20
#_07CC2E: STA.b $20

#_07CC30: SEP #$20

.exit
#_07CC32: RTS

;===================================================================================================

pool Link_HopInOrOutOfWater_Horizontal

.speed_x
#_07CC33: db 28, 24, 16

.speed_z
#_07CC36: db 32, 24, 24

.timer
#_07CC39: db 16, 16, 16

pool off

;---------------------------------------------------------------------------------------------------

Link_HopInOrOutOfWater_Horizontal:
#_07CC3C: LDA.b $1B
#_07CC3E: BNE .indoors

#_07CC40: LDX.b #$02
#_07CC42: BRA .index_decided

.indoors
#_07CC44: LDX.b $1D
#_07CC46: LDA.w $047A
#_07CC49: BEQ .index_decided

#_07CC4B: LDX.b #$00

.index_decided
#_07CC4D: STX.b $00

#_07CC4F: LDA.w .speed_x,X
#_07CC52: TAX

#_07CC53: LDA.b $66
#_07CC55: AND.b #$01
#_07CC57: BNE .dont_invert

#_07CC59: TXA
#_07CC5A: EOR.b #$FF
#_07CC5C: INC A
#_07CC5D: TAX

.dont_invert
#_07CC5E: STX.b $28

#_07CC60: STZ.b $27

#_07CC62: LDX.b $00

#_07CC64: LDA.w .speed_z,X
#_07CC67: STA.b $29
#_07CC69: STA.w $02C7

#_07CC6C: LDA.w .timer,X
#_07CC6F: STA.b $46

#_07CC71: LDA.b $4D
#_07CC73: CMP.b #$02
#_07CC75: BEQ .dont_set_recoil

#_07CC77: LDA.b #$01
#_07CC79: STA.b $4D

#_07CC7B: STZ.w $0360

.dont_set_recoil
#_07CC7E: LDA.b #$06 ; LINKSTATE 06
#_07CC80: STA.b $5D

#_07CC82: RTS

;===================================================================================================

DiagonalKickback:

.right
#_07CC83: db   0,   1,   1,   1
#_07CC87: db   2,   2,   2,   3
#_07CC8B: db   3,   3

.left
#_07CC8D: db   0,  -1,  -1,  -1
#_07CC91: db  -2,  -2,  -2,  -3
#_07CC95: db  -3,  -3

.down
#_07CC97: db   0,   0,   0,   1
#_07CC9B: db   1,   1,   2,   2
#_07CC9F: db   2,   3

.up
#_07CCA1: db   0,   1,   1,   2
#_07CCA5: db   2,   2,   3,   3
#_07CCA9: db   3,   3

;---------------------------------------------------------------------------------------------------

Link_HandleDiagonalKickback:
#_07CCAB: LDA.b $30
#_07CCAD: BEQ .no_y_velocity

#_07CCAF: LDA.b $31
#_07CCB1: BNE .have_x_velocity

.no_y_velocity
#_07CCB3: BRL ResetSlopeIntoFlagAndFailCache

.have_x_velocity
#_07CCB6: LDA.b $20
#_07CCB8: STA.w $02DE

#_07CCBB: LDA.b $21
#_07CCBD: STA.w $02DF

#_07CCC0: LDA.b $22
#_07CCC2: STA.w $02DC

#_07CCC5: LDA.b $23
#_07CCC7: STA.w $02DD

#_07CCCA: LDY.b #$04

#_07CCCC: LDA.b $31
#_07CCCE: BMI .x_velocity_negative_a

#_07CCD0: LDY.b #$06

.x_velocity_negative_a
#_07CCD2: JSR TileDetect_Movement_Horizontal

#_07CCD5: LDA.b $0C
#_07CCD7: AND.b #$05
#_07CCD9: BEQ .nothing_flagged_for_x

#_07CCDB: JSR FlagMovingIntoSlopes_Horizontal

#_07CCDE: LDA.b $6B
#_07CCE0: AND.b #$0F
#_07CCE2: BNE .not_flagged_as_into_slope

.nothing_flagged_for_x
#_07CCE4: BRL ResetSlopeIntoFlagAndFailCache

;---------------------------------------------------------------------------------------------------

.not_flagged_as_into_slope
#_07CCE7: REP #$20

#_07CCE9: LDA.b $22
#_07CCEB: SEC
#_07CCEC: SBC.w $02DC
#_07CCEF: STA.b $00

#_07CCF1: LDA.w $02DC
#_07CCF4: STA.b $22

#_07CCF6: SEP #$20

#_07CCF8: LDA.b $00
#_07CCFA: STA.b $31

;---------------------------------------------------------------------------------------------------

#_07CCFC: LDY.b #$00

#_07CCFE: LDA.b $30
#_07CD00: BMI .y_velocity_negative_a

#_07CD02: LDY.b #$02

.y_velocity_negative_a
#_07CD04: JSR TileDetect_Movement_Vertical

#_07CD07: LDA.b $0C
#_07CD09: AND.b #$05
#_07CD0B: BEQ ResetSlopeIntoFlagAndFailCache

#_07CD0D: JSR FlagMovingIntoSlopes_Vertical

#_07CD10: LDA.b $6B
#_07CD12: AND.b #$0F
#_07CD14: BEQ ResetSlopeIntoFlagAndFailCache

#_07CD16: LDA.b $6B
#_07CD18: STA.b $6D

#_07CD1A: REP #$20

#_07CD1C: LDA.b $20
#_07CD1E: SEC
#_07CD1F: SBC.w $02DE
#_07CD22: STA.b $00

#_07CD24: SEP #$20

#_07CD26: LDA.b $00
#_07CD28: STA.b $30

;---------------------------------------------------------------------------------------------------

#_07CD2A: LDY.b $31
#_07CD2C: BMI .x_velocity_negative_b

#_07CD2E: LDA.w DiagonalKickback_right,Y

#_07CD31: BRA .kickback_x_decided

.x_velocity_negative_b
#_07CD33: TYA
#_07CD34: EOR.b #$FF
#_07CD36: INC A
#_07CD37: TAY

#_07CD38: LDA.w DiagonalKickback_left,Y

.kickback_x_decided
#_07CD3B: REP #$20

#_07CD3D: AND.w #$00FF
#_07CD40: CMP.w #$0080
#_07CD43: BCC .kickback_x_positive

#_07CD45: ORA.w #$FF00

.kickback_x_positive
#_07CD48: CLC
#_07CD49: ADC.b $22
#_07CD4B: STA.b $22

;---------------------------------------------------------------------------------------------------

#_07CD4D: SEP #$20

#_07CD4F: LDY.b $30
#_07CD51: BMI .y_velocity_negative_b

#_07CD53: LDA.w DiagonalKickback_down,Y

#_07CD56: BRA .kickback_y_decided

.y_velocity_negative_b
#_07CD58: TYA
#_07CD59: EOR.b #$FF
#_07CD5B: INC A
#_07CD5C: TAY

#_07CD5D: LDA.w DiagonalKickback_up,Y

.kickback_y_decided
#_07CD60: REP #$20

#_07CD62: AND.w #$00FF
#_07CD65: CMP.w #$0080
#_07CD68: BCC .kickback_y_positive

#_07CD6A: ORA.w #$FF00

.kickback_y_positive
#_07CD6D: CLC
#_07CD6E: ADC.b $20
#_07CD70: STA.b $20

#_07CD72: SEP #$20

#_07CD74: BRA ResetSlopeIntoFlag

;===================================================================================================

ResetSlopeIntoFlagAndFailCache:
#_07CD76: STZ.b $6D

ResetSlopeIntoFlag:
#_07CD78: STZ.b $6B

#_07CD7A: RTS

;===================================================================================================

TileDetect_Movement:

.offset_same_axis
#_07CD7B: dw $0008, $0018, $0000, $000F

.offset_perpendicular_axis_1
#_07CD83: dw $0000, $0000

.offset_pit_y
#_07CD87: dw $0008

.unused_a
#_07CD89: dw $0008

.offset_perpendicular_axis_2
#_07CD8B: dw $0008, $0008, $0010, $0010

.offset_perpendicular_axis_3
#_07CD93: dw $000F, $000F

.offset_pit_x
#_07CD97: dw $0017

.unused_b
#_07CD99: dw $0017, $0000, $0000, $001F, $001F

.offset_slope_same_axis
#_07CDA3: dw $0007, $0018, $FFFF, $0010

.offset_slope_perpendicular_axis_1
#_07CDAB: dw $0000, $0000, $0008, $0008

.offset_slope_perpendicular_axis_2
#_07CDB3: dw $000F, $000F, $0017, $0017
#_07CDBB: dw $0000, $0000, $0000, $000F
#_07CDC3: dw $0000, $0000, $0012, $0012

;===================================================================================================

TileDetect_Movement_Vertical:
#_07CDCB: REP #$20

#_07CDCD: JSR TileDetect_ResetState

#_07CDD0: STZ.b $59

#_07CDD2: LDA.b $20
#_07CDD4: CLC
#_07CDD5: ADC.w TileDetect_Movement_offset_same_axis,Y
#_07CDD8: STA.b $51

#_07CDDA: AND.b $EC
#_07CDDC: STA.b $00

#_07CDDE: LDA.b $22
#_07CDE0: CLC
#_07CDE1: ADC.w TileDetect_Movement_offset_perpendicular_axis_1,Y
#_07CDE4: AND.b $EC

#_07CDE6: LSR A
#_07CDE7: LSR A
#_07CDE8: LSR A
#_07CDE9: STA.b $02

#_07CDEB: LDA.b $22
#_07CDED: CLC
#_07CDEE: ADC.w TileDetect_Movement_offset_perpendicular_axis_2,Y
#_07CDF1: AND.b $EC

#_07CDF3: LSR A
#_07CDF4: LSR A
#_07CDF5: LSR A
#_07CDF6: STA.b $04

#_07CDF8: LDA.b $22
#_07CDFA: CLC
#_07CDFB: ADC.w TileDetect_Movement_offset_perpendicular_axis_3,Y
#_07CDFE: AND.b $EC

#_07CE00: LSR A
#_07CE01: LSR A
#_07CE02: LSR A
#_07CE03: STA.b $74

#_07CE05: REP #$10

#_07CE07: LDA.w #$0001
#_07CE0A: STA.b $0A

#_07CE0C: JSR TileDetection_Execute

#_07CE0F: LDA.b $04
#_07CE11: STA.b $02

#_07CE13: LDA.w #$0002
#_07CE16: STA.b $0A

#_07CE18: JSR TileDetection_Execute

#_07CE1B: LDA.b $74
#_07CE1D: STA.b $02

#_07CE1F: LDA.w #$0004
#_07CE22: STA.b $0A

#_07CE24: JSR TileDetection_Execute

#_07CE27: SEP #$30

#_07CE29: RTS

;===================================================================================================

TileDetect_Movement_Horizontal:
#_07CE2A: REP #$20

#_07CE2C: JSR TileDetect_ResetState

#_07CE2F: STZ.b $59

#_07CE31: LDA.b $22
#_07CE33: CLC
#_07CE34: ADC.w TileDetect_Movement_offset_same_axis,Y
#_07CE37: AND.b $EC

#_07CE39: LSR A
#_07CE3A: LSR A
#_07CE3B: LSR A
#_07CE3C: STA.b $02

#_07CE3E: LDA.b $20
#_07CE40: CLC
#_07CE41: ADC.w TileDetect_Movement_offset_perpendicular_axis_1,Y
#_07CE44: AND.b $EC
#_07CE46: STA.b $00

#_07CE48: LDA.b $20
#_07CE4A: CLC
#_07CE4B: ADC.w TileDetect_Movement_offset_perpendicular_axis_2,Y
#_07CE4E: STA.b $51

#_07CE50: AND.b $EC
#_07CE52: STA.b $04

#_07CE54: LDA.b $20
#_07CE56: CLC
#_07CE57: ADC.w TileDetect_Movement_offset_perpendicular_axis_3,Y
#_07CE5A: STA.b $53

#_07CE5C: AND.b $EC
#_07CE5E: STA.b $08

#_07CE60: REP #$10

#_07CE62: LDA.w #$0001
#_07CE65: STA.b $0A

#_07CE67: JSR TileDetection_Execute

#_07CE6A: LDA.b $04
#_07CE6C: STA.b $00

#_07CE6E: LDA.w #$0002
#_07CE71: STA.b $0A

#_07CE73: JSR TileDetection_Execute

#_07CE76: LDA.b $08
#_07CE78: STA.b $00

#_07CE7A: LDA.w #$0004
#_07CE7D: STA.b $0A

#_07CE7F: JSR TileDetection_Execute

#_07CE82: SEP #$30

#_07CE84: RTS

;===================================================================================================

TileDetect_Movement_VerticalSlopes:
#_07CE85: REP #$20

#_07CE87: JSR TileDetect_ResetState

#_07CE8A: STZ.b $59

#_07CE8C: LDA.b $20
#_07CE8E: CLC
#_07CE8F: ADC.w TileDetect_Movement_offset_slope_same_axis,Y
#_07CE92: AND.b $EC
#_07CE94: STA.b $00

#_07CE96: LDA.b $22
#_07CE98: CLC
#_07CE99: ADC.w TileDetect_Movement_offset_slope_perpendicular_axis_1,Y
#_07CE9C: AND.b $EC

#_07CE9E: LSR A
#_07CE9F: LSR A
#_07CEA0: LSR A
#_07CEA1: STA.b $02

#_07CEA3: LDA.b $22
#_07CEA5: CLC
#_07CEA6: ADC.w TileDetect_Movement_offset_slope_perpendicular_axis_2,Y
#_07CEA9: AND.b $EC

#_07CEAB: LSR A
#_07CEAC: LSR A
#_07CEAD: LSR A
#_07CEAE: STA.b $04

#_07CEB0: REP #$10

#_07CEB2: LDA.w #$0001
#_07CEB5: STA.b $0A

#_07CEB7: JSR TileDetection_Execute

#_07CEBA: LDA.b $04
#_07CEBC: STA.b $02

#_07CEBE: LDA.w #$0002
#_07CEC1: STA.b $0A

#_07CEC3: JSR TileDetection_Execute

#_07CEC6: SEP #$30

#_07CEC8: RTS

;===================================================================================================

TileDetect_Movement_HorizontalSlopes:
#_07CEC9: REP #$20

#_07CECB: JSR TileDetect_ResetState

#_07CECE: STZ.b $59

#_07CED0: LDA.b $22
#_07CED2: CLC
#_07CED3: ADC.w TileDetect_Movement_offset_slope_same_axis,Y
#_07CED6: AND.b $EC

#_07CED8: LSR A
#_07CED9: LSR A
#_07CEDA: LSR A
#_07CEDB: STA.b $02

#_07CEDD: LDA.b $20
#_07CEDF: CLC
#_07CEE0: ADC.w TileDetect_Movement_offset_slope_perpendicular_axis_1,Y
#_07CEE3: AND.b $EC
#_07CEE5: STA.b $00

#_07CEE7: LDA.b $20
#_07CEE9: CLC
#_07CEEA: ADC.w TileDetect_Movement_offset_slope_perpendicular_axis_2,Y
#_07CEED: AND.b $EC
#_07CEEF: STA.b $04

#_07CEF1: REP #$10

#_07CEF3: LDA.w #$0001
#_07CEF6: STA.b $0A

#_07CEF8: JSR TileDetection_Execute

#_07CEFB: LDA.b $04
#_07CEFD: STA.b $00

#_07CEFF: LDA.w #$0002
#_07CF02: STA.b $0A

#_07CF04: JSR TileDetection_Execute

#_07CF07: SEP #$30

#_07CF09: RTS

;===================================================================================================

TileDetect_BigArea_long:
#_07CF0A: PHB
#_07CF0B: PHK
#_07CF0C: PLB

#_07CF0D: JSR TileDetect_BigArea

#_07CF10: PLB

#_07CF11: RTL

;===================================================================================================

TileDetect_BigArea:
#_07CF12: STZ.b $59

#_07CF14: REP #$20

#_07CF16: JSR TileDetect_ResetState

#_07CF19: LDA.b $22
#_07CF1B: CLC
#_07CF1C: ADC.w TileDetect_Movement_offset_perpendicular_axis_1
#_07CF1F: AND.b $EC
#_07CF21: LSR A
#_07CF22: LSR A
#_07CF23: LSR A
#_07CF24: STA.b $02

#_07CF26: LDA.b $22
#_07CF28: CLC
#_07CF29: ADC.w TileDetect_Movement_offset_perpendicular_axis_3
#_07CF2C: AND.b $EC
#_07CF2E: LSR A
#_07CF2F: LSR A
#_07CF30: LSR A
#_07CF31: STA.b $04

#_07CF33: LDA.b $20
#_07CF35: CLC
#_07CF36: ADC.w TileDetect_Movement_offset_pit_y
#_07CF39: AND.b $EC
#_07CF3B: STA.b $00
#_07CF3D: STA.b $74

#_07CF3F: LDA.b $20
#_07CF41: CLC
#_07CF42: ADC.w TileDetect_Movement_offset_pit_x
#_07CF45: AND.b $EC
#_07CF47: STA.b $08

;===================================================================================================

TileDetect_FromMirrorBonk:
#_07CF49: REP #$10

#_07CF4B: LDA.w #$0008
#_07CF4E: STA.b $0A

#_07CF50: JSR TileDetection_Execute

#_07CF53: LDA.b $08
#_07CF55: STA.b $00

#_07CF57: LDA.w #$0002
#_07CF5A: STA.b $0A

#_07CF5C: JSR TileDetection_Execute

#_07CF5F: LDA.b $74
#_07CF61: STA.b $00

#_07CF63: LDA.b $04
#_07CF65: STA.b $02

#_07CF67: LDA.w #$0004
#_07CF6A: STA.b $0A

#_07CF6C: JSR TileDetection_Execute

#_07CF6F: LDA.b $08
#_07CF71: STA.b $00

#_07CF73: LDA.w #$0001
#_07CF76: STA.b $0A

#_07CF78: JSR TileDetection_Execute

#_07CF7B: SEP #$30

#_07CF7D: RTS

;===================================================================================================

TileDetect_UnusedIce:
#_07CF7E: STZ.b $59

#_07CF80: REP #$20

#_07CF82: JSR TileDetect_ResetState

#_07CF85: LDA.b $22
#_07CF87: CLC
#_07CF88: ADC.w #$0000

#_07CF8B: AND.b $EC
#_07CF8D: LSR A
#_07CF8E: LSR A
#_07CF8F: LSR A
#_07CF90: STA.b $02

#_07CF92: LDA.b $22
#_07CF94: CLC
#_07CF95: ADC.w #$0008

#_07CF98: AND.b $EC
#_07CF9A: LSR A
#_07CF9B: LSR A
#_07CF9C: LSR A
#_07CF9D: STA.b $04

;---------------------------------------------------------------------------------------------------

#_07CF9F: LDA.b $24
#_07CFA1: AND.w #$00FF
#_07CFA4: CMP.w #$00FF
#_07CFA7: BNE .not_grounded

#_07CFA9: LDA.w #$0000

.not_grounded
#_07CFAC: CLC
#_07CFAD: ADC.b $20
#_07CFAF: AND.b $EC
#_07CFB1: STA.b $00

;---------------------------------------------------------------------------------------------------

#_07CFB3: REP #$10

#_07CFB5: LDA.w #$0001
#_07CFB8: STA.b $0A

#_07CFBA: JSR TileDetection_Execute

#_07CFBD: LDA.b $04
#_07CFBF: STA.b $02

#_07CFC1: LDA.w #$0002
#_07CFC4: STA.b $0A

#_07CFC6: JSR TileDetection_Execute

#_07CFC9: SEP #$30

#_07CFCB: RTS

;===================================================================================================

pool TileDetect_MainHandler

.offset_y
#_07CFCC: dw  20,  20,  20,  20
#_07CFD4: dw   4,  28,  16,  16
#_07CFDC: dw  22,  22,  22,  22
#_07CFE4: dw   4,  24,  16,  16
#_07CFEC: dw  16,  16,  16,  16
#_07CFF4: dw  20,  20,  23,  23
#_07CFFC: dw  -4,  36,  16,  16
#_07D004: dw   4,  28,  16,  16
#_07D00C: dw   4,  28,  16,  16
#_07D014: dw   4,   4,  28,  28

.offset_x
#_07D01C: dw   8,   8,   8,   8
#_07D024: dw   6,   8,  -1,  22
#_07D02C: dw  19,  19,   0,  19
#_07D034: dw   6,   8,  -1,  22
#_07D03C: dw   8,   8,   8,   8
#_07D044: dw   8,   8,   0,  15
#_07D04C: dw   6,   8, -10,  29
#_07D054: dw   6,   8,  -6,  22
#_07D05C: dw   6,   8,  -4,  22
#_07D064: dw  -4,  22,  -4,  22

;---------------------------------------------------------------------------------------------------

.spike_floor_damage
#_07D06C: db $08 ; green
#_07D06D: db $08 ; blue
#_07D06E: db $08 ; red

;---------------------------------------------------------------------------------------------------

.index_offset
#_07D06F: db $0A, $06, $0E, $02
#_07D073: db $0C, $04, $08, $00

pool off

;---------------------------------------------------------------------------------------------------

TileDetect_MainHandler:
#_07D077: STZ.b $59 ; clear pits

#_07D079: REP #$20

#_07D07B: JSR TileDetect_ResetState

#_07D07E: STY.b $00

#_07D080: CPY.b #$08
#_07D082: BNE .direction_based

#_07D084: LDA.w $031C
#_07D087: AND.w #$00FF
#_07D08A: DEC A
#_07D08B: DEC A
#_07D08C: BMI .dirty_exit

#_07D08E: CMP.w #$0008
#_07D091: BCS .dirty_exit

#_07D093: PHY
#_07D094: TAY

#_07D095: LDA.w .index_offset,Y
#_07D098: AND.w #$00FF
#_07D09B: CLC
#_07D09C: ADC.w #$0040
#_07D09F: TAY

#_07D0A0: BRA .calculate_offset

.direction_based
#_07D0A2: PHY

#_07D0A3: LDA.b $00
#_07D0A5: AND.w #$00FF
#_07D0A8: ASL A
#_07D0A9: ASL A
#_07D0AA: ASL A
#_07D0AB: CLC
#_07D0AC: ADC.b $2F
#_07D0AE: TAY

;---------------------------------------------------------------------------------------------------

.calculate_offset
#_07D0AF: LDA.b $22
#_07D0B1: CLC
#_07D0B2: ADC.w .offset_x,Y

#_07D0B5: AND.b $EC
#_07D0B7: LSR A
#_07D0B8: LSR A
#_07D0B9: LSR A
#_07D0BA: STA.b $02

#_07D0BC: LDA.b $20
#_07D0BE: CLC
#_07D0BF: ADC.w .offset_y,Y
#_07D0C2: AND.b $EC
#_07D0C4: STA.b $00

;---------------------------------------------------------------------------------------------------

#_07D0C6: LDA.w #$0001
#_07D0C9: STA.b $0A

#_07D0CB: PLY

#_07D0CC: REP #$10

#_07D0CE: TYA
#_07D0CF: CMP.w #$0001
#_07D0D2: BEQ .detect_from_item

#_07D0D4: CMP.w #$0002
#_07D0D7: BEQ .detect_from_item

#_07D0D9: CMP.w #$0003
#_07D0DC: BEQ .detect_from_item

#_07D0DE: CMP.w #$0006
#_07D0E1: BEQ .detect_from_item

#_07D0E3: CMP.w #$0007
#_07D0E6: BEQ .detect_from_item

#_07D0E8: CMP.w #$0008
#_07D0EB: BEQ .detect_from_item

#_07D0ED: PHY

#_07D0EE: JSR TileDetection_Execute

#_07D0F1: PLY

#_07D0F2: BRA .continue_from_detection

.detect_from_item
#_07D0F4: SEP #$30

#_07D0F6: JSR TileBehavior_HandleItemAndExecute

;---------------------------------------------------------------------------------------------------

.dirty_exit
#_07D0F9: SEP #$30

.proceed_to_exit
#_07D0FB: BRL .exit

;---------------------------------------------------------------------------------------------------

.continue_from_detection
#_07D0FE: SEP #$30

#_07D100: CPY.b #$05
#_07D102: BEQ .proceed_to_exit

#_07D104: LDA.w $0357
#_07D107: AND.b #$10
#_07D109: BEQ .no_warp_tile

#_07D10B: LDA.b $20
#_07D10D: CLC
#_07D10E: ADC.b #$08
#_07D110: AND.b #$0F
#_07D112: CMP.b #$04
#_07D114: BCC .check_warp_x

#_07D116: CMP.b #$0B
#_07D118: BCC .dont_attempt_to_warp

.check_warp_x
#_07D11A: LDA.b $22
#_07D11C: AND.b #$0F
#_07D11E: CMP.b #$04
#_07D120: BCC .okay_x_position

#_07D122: CMP.b #$0C
#_07D124: BCC .dont_attempt_to_warp

.okay_x_position
#_07D126: LDA.w $031F
#_07D129: BNE .dont_attempt_to_warp

#_07D12B: LDA.b $4D
#_07D12D: BNE .dont_attempt_to_warp

#_07D12F: LDA.b $1B
#_07D131: BEQ .try_overworld_warp

#_07D133: JSL Underworld_FlagRoomData_Quadrants

#_07D137: LDA.b #$33 ; SFX2.33
#_07D139: JSR PlaySFX_Set2

#_07D13C: STZ.b $5E

#_07D13E: LDA.b #$15
#_07D140: STA.b $11

#_07D142: LDA.b $A0
#_07D144: STA.b $A2

#_07D146: LDA.l $7EC000
#_07D14A: STA.b $A0

#_07D14C: JSR HandleLayerOfDestination
#_07D14F: BRA .dont_attempt_to_warp

;---------------------------------------------------------------------------------------------------

.try_overworld_warp
#_07D151: LDA.w $02DB
#_07D154: BNE .dont_attempt_to_warp

#_07D156: JSR Mirror_TryToWarp

.dont_attempt_to_warp
#_07D159: BRL .clear_tall_grass_flag

;---------------------------------------------------------------------------------------------------

.no_warp_tile
#_07D15C: STZ.w $02DB

#_07D15F: LDA.w $0357
#_07D162: AND.b #$01
#_07D164: BEQ .not_in_tall_grass

#_07D166: LDA.b #$02
#_07D168: STA.w $0351

#_07D16B: JSR Link_PermissionForSloshSounds
#_07D16E: BCS .jump_to_exit

#_07D170: LDA.b $4D
#_07D172: BNE .jump_to_exit

#_07D174: LDA.b #$1A ; SFX2.1A
#_07D176: JSR PlaySFX_Set2

.jump_to_exit
#_07D179: BRL .exit

;---------------------------------------------------------------------------------------------------

.not_in_tall_grass
#_07D17C: LDA.w $0359
#_07D17F: AND.b #$01
#_07D181: BEQ .not_in_shallow_water

#_07D183: LDA.b #$01
#_07D185: STA.w $0351

#_07D188: LDA.b $1B
#_07D18A: BNE .try_splash_noise

#_07D18C: LDA.w $0345
#_07D18F: BEQ .try_splash_noise

#_07D191: LDA.w $02E0
#_07D194: BNE .try_splash_noise

#_07D196: LDA.l $7EF356
#_07D19A: BEQ .jump_to_exit

#_07D19C: STZ.w $0345

#_07D19F: LDA.w $0340
#_07D1A2: STA.b $26

#_07D1A4: LDA.b #$00 ; LINKSTATE 00
#_07D1A6: STA.b $5D

#_07D1A8: BRL .exit

;---------------------------------------------------------------------------------------------------

.try_splash_noise
#_07D1AB: JSR Link_PermissionForSloshSounds
#_07D1AE: BCS .no_sound_allowed

#_07D1B0: LDA.b $8A
#_07D1B2: CMP.b #$70 ; OW 70
#_07D1B4: BNE .not_mire_splash

#_07D1B6: LDA.b #$1B ; SFX2.1B
#_07D1B8: JSR PlaySFX_Set2

#_07D1BB: BRA .no_sound_allowed

;---------------------------------------------------------------------------------------------------

.not_mire_splash
#_07D1BD: LDA.b $4D
#_07D1BF: BNE .no_sound_allowed

#_07D1C1: LDA.b #$1C ; SFX2.1C
#_07D1C3: JSR PlaySFX_Set2

.no_sound_allowed
#_07D1C6: BRL .exit

;---------------------------------------------------------------------------------------------------

.not_in_shallow_water
#_07D1C9: LDA.b $1B
#_07D1CB: BNE .clear_tall_grass_flag

#_07D1CD: LDA.w $0345
#_07D1D0: BNE .clear_tall_grass_flag

#_07D1D2: LDA.w $0341
#_07D1D5: AND.b #$01
#_07D1D7: BEQ .clear_tall_grass_flag

#_07D1D9: LDA.b #$01
#_07D1DB: STA.w $0351

#_07D1DE: JSR Link_PermissionForSloshSounds
#_07D1E1: BCS .no_sloshing_sounds

#_07D1E3: LDA.b $8A
#_07D1E5: CMP.b #$70 ; OW 70
#_07D1E7: BNE .not_mire_again

#_07D1E9: LDA.b #$1B ; SFX2.1B
#_07D1EB: JSR PlaySFX_Set2

#_07D1EE: BRA .no_sloshing_sounds

;---------------------------------------------------------------------------------------------------

.not_mire_again
#_07D1F0: LDA.b $4D
#_07D1F2: BNE .no_sloshing_sounds

#_07D1F4: LDA.b #$1C ; SFX2.1C
#_07D1F6: JSR PlaySFX_Set2

.no_sloshing_sounds
#_07D1F9: BRL .exit

;---------------------------------------------------------------------------------------------------

.clear_tall_grass_flag
#_07D1FC: STZ.w $0351

#_07D1FF: LDA.w $02EE
#_07D202: AND.b #$01
#_07D204: BEQ .not_near_desert_trigger

#_07D206: LDA.b #$01
#_07D208: STA.w $02ED

#_07D20B: BRL .exit

;---------------------------------------------------------------------------------------------------

.not_near_desert_trigger
#_07D20E: STZ.w $02ED

#_07D211: LDA.w $02EE
#_07D214: AND.b #$10
#_07D216: BEQ .not_touching_spikes

#_07D218: STZ.w $0373

#_07D21B: LDA.b $55
#_07D21D: BNE .not_touching_spikes

#_07D21F: JSR SearchForByrnaSpark
#_07D222: BCS .not_touching_spikes

#_07D224: LDA.w $031F
#_07D227: BNE .not_touching_spikes

#_07D229: STZ.w $03F7
#_07D22C: STZ.w $03F5
#_07D22F: STZ.w $03F6

#_07D232: LDA.l $7EF357
#_07D236: BEQ .no_moon_pearl

#_07D238: STZ.b $56
#_07D23A: STZ.w $02E0

.no_moon_pearl
#_07D23D: LDA.l $7EF35B
#_07D241: TAY

#_07D242: LDA.w .spike_floor_damage,Y
#_07D245: STA.w $0373

#_07D248: BRL Link_CancelDash

;---------------------------------------------------------------------------------------------------

.not_touching_spikes
#_07D24B: LDA.w $0348
#_07D24E: AND.b #$11
#_07D250: BEQ .not_on_any_ice

#_07D252: LDA.w $034A
#_07D255: BEQ .not_gt_or_ip_ice

#_07D257: LDA.b $6A
#_07D259: BEQ .finish_up

#_07D25B: LDA.w $0340
#_07D25E: STA.b $26

#_07D260: BRL .finish_up

;---------------------------------------------------------------------------------------------------

.not_gt_or_ip_ice
#_07D263: LDA.b $67
#_07D265: AND.b #$0C
#_07D267: BEQ .velocity_not_up_or_down

#_07D269: LDA.b #$01
#_07D26B: STA.w $033D

#_07D26E: LDA.b #$80
#_07D270: STA.w $033C

.velocity_not_up_or_down
#_07D273: LDA.b $67
#_07D275: AND.b #$03
#_07D277: BEQ .velocity_not_left_or_right

#_07D279: LDA.b #$01
#_07D27B: STA.w $033D

#_07D27E: LDA.b #$80
#_07D280: STA.w $033C

.velocity_not_left_or_right
#_07D283: LDY.b #$01

#_07D285: LDA.w $0348
#_07D288: AND.b #$01
#_07D28A: BNE .set_to_gt_ice

#_07D28C: LDY.b #$02

.set_to_gt_ice
#_07D28E: STY.w $034A

#_07D291: LDA.b $26
#_07D293: STA.w $0340

#_07D296: JSL Link_ResetSwimmingState
#_07D29A: BRL .finish_up

;---------------------------------------------------------------------------------------------------

.not_on_any_ice
#_07D29D: LDA.b $5D
#_07D29F: CMP.b #$04 ; LINKSTATE 04
#_07D2A1: BEQ .swimming

#_07D2A3: LDA.w $034A
#_07D2A6: BEQ .not_on_ice_yet

#_07D2A8: LDA.w $0340
#_07D2AB: STA.b $26

.not_on_ice_yet
#_07D2AD: JSL Link_ResetSwimmingState

.swimming
#_07D2B1: STZ.w $034A

;---------------------------------------------------------------------------------------------------

.finish_up
#_07D2B4: LDA.w $02E8
#_07D2B7: AND.b #$10
#_07D2B9: BEQ .exit

#_07D2BB: LDA.w $031F
#_07D2BE: BNE .exit

#_07D2C0: LDA.b #$3A
#_07D2C2: STA.w $031F

.exit
#_07D2C5: RTS

;===================================================================================================

Link_PermissionForSloshSounds:
#_07D2C6: LDA.b $67
#_07D2C8: AND.b #$0F
#_07D2CA: BEQ .fail

#_07D2CC: LDA.b $5D
#_07D2CE: CMP.b #$11 ; LINKSTATE 11
#_07D2D0: BEQ .dashing

#_07D2D2: LDA.b $1A
#_07D2D4: AND.b #$0F
#_07D2D6: BEQ .succeed

#_07D2D8: BRA .fail

.dashing
#_07D2DA: LDA.b $1A
#_07D2DC: AND.b #$07
#_07D2DE: BNE .fail

.succeed
#_07D2E0: CLC

#_07D2E1: RTS

.fail
#_07D2E2: SEC

#_07D2E3: RTS

;===================================================================================================

pool PushBlock_AttemptToPushTheBlock

.target_offset_y_a
#_07D2E4: dw $FFFC ; up
#_07D2E6: dw $0014 ; down
#_07D2E8: dw $0004 ; left
#_07D2EA: dw $0004 ; right

.target_offset_y_b
#_07D2EC: dw $FFFC ; up
#_07D2EE: dw $0014 ; down
#_07D2F0: dw $000C ; left
#_07D2F2: dw $000C ; right

.target_offset_x_a
#_07D2F4: dw $0004 ; up
#_07D2F6: dw $0004 ; down
#_07D2F8: dw $FFFC ; left
#_07D2FA: dw $0014 ; right

.target_offset_x_b
#_07D2FC: dw $000C ; up
#_07D2FE: dw $000C ; down
#_07D300: dw $FFFC ; left
#_07D302: dw $0014 ; right

pool off

;---------------------------------------------------------------------------------------------------

PushBlock_AttemptToPushTheBlock:
#_07D304: REP #$20

#_07D306: TYA
#_07D307: ASL A
#_07D308: ASL A
#_07D309: ASL A
#_07D30A: STA.b $0A

#_07D30C: LDA.b $66
#_07D30E: ASL A
#_07D30F: CLC
#_07D310: ADC.b $0A
#_07D312: TAY

#_07D313: LDA.b $00
#_07D315: STA.b $08

#_07D317: LDA.b $02
#_07D319: STA.b $04

#_07D31B: LDA.b $08
#_07D31D: CLC
#_07D31E: ADC.w .target_offset_x_a,Y
#_07D321: AND.b $EC

#_07D323: LSR A
#_07D324: LSR A
#_07D325: LSR A
#_07D326: STA.b $02

#_07D328: LDA.b $04
#_07D32A: CLC
#_07D32B: ADC.w .target_offset_y_a,Y
#_07D32E: AND.b $EC
#_07D330: STA.b $00

#_07D332: JSR PushBlock_GetGeneralizedTileInteractionOfTarget
#_07D335: BEQ .no_blockage

#_07D337: CPX.w #$0009 ; TILETYPE 09
#_07D33A: BNE .cannot_push

.no_blockage
#_07D33C: LDA.b $08
#_07D33E: CLC
#_07D33F: ADC.w .target_offset_x_b,Y
#_07D342: AND.b $EC
#_07D344: LSR A
#_07D345: LSR A
#_07D346: LSR A
#_07D347: STA.b $02

#_07D349: LDA.b $04
#_07D34B: CLC
#_07D34C: ADC.w .target_offset_y_b,Y
#_07D34F: AND.b $EC
#_07D351: STA.b $00

#_07D353: JSR PushBlock_GetGeneralizedTileInteractionOfTarget
#_07D356: BEQ .can_push

#_07D358: CPX.w #$0009 ; TILETYPE 09
#_07D35B: BNE .cannot_push

;---------------------------------------------------------------------------------------------------

.can_push
#_07D35D: SEP #$30
#_07D35F: CLC

#_07D360: RTS

.cannot_push
#_07D361: SEP #$30
#_07D363: SEC

#_07D364: RTS

;===================================================================================================

LiftableCheckOffset_Y:
#_07D365: dw  6
#_07D367: dw 24
#_07D369: dw 12
#_07D36B: dw 12

LiftableCheckOffset_X:
#_07D36D: dw  7
#_07D36F: dw  7
#_07D371: dw -3
#_07D373: dw 16

;===================================================================================================

LiftableGloveLevels:
#_07D375: db $00 ; sign
#_07D376: db $01 ; small gray rock
#_07D377: db $00 ; bush
#_07D378: db $00 ; dark bush
#_07D379: db $02 ; small black rock
#_07D37A: db $01 ; big gray rock
#_07D37B: db $02 ; big black rock

Liftable0368ID:
#_07D37C: db $02 ; sign
#_07D37D: db $03 ; small gray rock
#_07D37E: db $01 ; bush
#_07D37F: db $04 ; dark bush
#_07D380: db $00 ; small black rock
#_07D381: db $05 ; big gray rock
#_07D382: db $06 ; big black rock

;===================================================================================================

Link_HandleLiftables:
#_07D383: STZ.b $59

#_07D385: REP #$20

#_07D387: JSR TileDetect_ResetState

#_07D38A: LDA.b $2F
#_07D38C: TAY

#_07D38D: LDA.b $20
#_07D38F: CLC
#_07D390: ADC.w LiftableCheckOffset_Y,Y
#_07D393: AND.b $EC
#_07D395: STA.b $00

#_07D397: LDA.b $20
#_07D399: CLC
#_07D39A: ADC.w #$0014
#_07D39D: AND.b $EC
#_07D39F: STA.b $04

#_07D3A1: LDA.b $22
#_07D3A3: CLC
#_07D3A4: ADC.w LiftableCheckOffset_X,Y
#_07D3A7: AND.b $EC

#_07D3A9: LSR A
#_07D3AA: LSR A
#_07D3AB: LSR A

#_07D3AC: STA.b $02

#_07D3AE: LDA.b $22
#_07D3B0: CLC
#_07D3B1: ADC.w #$0008
#_07D3B4: AND.b $EC

#_07D3B6: LSR A
#_07D3B7: LSR A
#_07D3B8: LSR A

#_07D3B9: STA.b $08

;---------------------------------------------------------------------------------------------------

#_07D3BB: LDA.w #$0001
#_07D3BE: STA.b $0A

#_07D3C0: REP #$10

#_07D3C2: JSR TileDetection_Execute

#_07D3C5: LDA.b $04
#_07D3C7: STA.b $00

#_07D3C9: LDA.b $08
#_07D3CB: STA.b $02

#_07D3CD: LDA.w #$0002
#_07D3D0: STA.b $0A

#_07D3D2: JSR TileDetection_Execute

#_07D3D5: SEP #$30

#_07D3D7: LDX.b #$02

#_07D3D9: LDA.b $0E
#_07D3DB: ORA.w $036D
#_07D3DE: AND.b #$01
#_07D3E0: BEQ .no_north_ledge

#_07D3E2: LDX.b #$03

.no_north_ledge
#_07D3E4: LDA.b $1B
#_07D3E6: BEQ .outdoors

#_07D3E8: PHX

#_07D3E9: JSL Underworld_CheckForAndIDLiftableTile
#_07D3ED: BCC .not_liftable

#_07D3EF: PLX

#_07D3F0: AND.b #$0F
#_07D3F2: TAY

#_07D3F3: LDA.w Liftable0368ID,Y
#_07D3F6: STA.w $0368

#_07D3F9: TAY

#_07D3FA: BRA .check_lift_level

;---------------------------------------------------------------------------------------------------

.not_liftable
#_07D3FC: PLX

#_07D3FD: LDA.w $0366
#_07D400: AND.b #$01
#_07D402: BEQ .move_on

#_07D404: LDA.b $2F
#_07D406: BNE .move_on

#_07D408: LDA.w $036A
#_07D40B: BNE .move_on

#_07D40D: LDX.b #$04

.move_on
#_07D40F: BRA .continue

;---------------------------------------------------------------------------------------------------

.outdoors
#_07D411: LDA.w $0366
#_07D414: AND.b #$01
#_07D416: BEQ .continue

#_07D418: LDA.b $2F
#_07D41A: BNE .run_check

#_07D41C: LDA.w $036A
#_07D41F: BNE .run_check

#_07D421: LDX.b #$04

#_07D423: BRA .continue

;---------------------------------------------------------------------------------------------------

.run_check
#_07D425: LDA.w $036A
#_07D428: LSR A
#_07D429: STA.w $0368

#_07D42C: TAY

.check_lift_level
#_07D42D: LDA.w LiftableGloveLevels,Y
#_07D430: SEC
#_07D431: SBC.l $7EF354
#_07D435: BEQ .no_gloves
#_07D437: BPL .continue

.no_gloves
#_07D439: LDX.b #$01

;---------------------------------------------------------------------------------------------------

.continue
#_07D43B: LDA.w $02E5
#_07D43E: AND.b #$01
#_07D440: BEQ .exit

#_07D442: LDX.b #$05

.exit
#_07D444: RTS

;===================================================================================================

pool HandleNudging

.offset_y_top
#_07D445: dw $0008, $0008, $0017, $0017
#_07D44D: dw $0008, $0017, $0008, $0017

.offset_x_top
#_07D455: dw $0000, $000F, $0000, $000F
#_07D45D: dw $0000, $0000, $000F, $000F

.offset_y_bottom
#_07D465: dw $0017, $0017, $0008, $0008
#_07D46D: dw $0008, $0017, $0008, $0017

.offset_x_bottom
#_07D475: dw $0000, $000F, $0000, $000F
#_07D47D: dw $000F, $000F, $0000, $0000

pool off

;---------------------------------------------------------------------------------------------------

HandleNudging:
#_07D485: LDA.b $00
#_07D487: PHA

#_07D488: LDA.b $66
#_07D48A: AND.b #$02
#_07D48C: BNE .horizontal_last

#_07D48E: LDX.b #$00

#_07D490: LDA.b $66
#_07D492: AND.b #$01
#_07D494: BEQ .not_down_last

#_07D496: LDX.b #$04

.not_down_last
#_07D498: LDY.b #$00

#_07D49A: LDA.b $0E
#_07D49C: AND.b #$04
#_07D49E: BNE .not_down

#_07D4A0: LDY.b #$02

.not_down
#_07D4A2: STY.b $00

#_07D4A4: BRA .do_detection

;---------------------------------------------------------------------------------------------------

.horizontal_last
#_07D4A6: LDX.b #$08

#_07D4A8: LDA.b $66
#_07D4AA: AND.b #$01
#_07D4AC: BEQ .was_not_down_last

#_07D4AE: LDX.b #$0C

.was_not_down_last
#_07D4B0: LDY.b #$00

#_07D4B2: LDA.b $0E
#_07D4B4: AND.b #$04
#_07D4B6: BNE .not_right

#_07D4B8: LDY.b #$02

.not_right
#_07D4BA: STY.b $00

;---------------------------------------------------------------------------------------------------

.do_detection
#_07D4BC: TXA
#_07D4BD: CLC
#_07D4BE: ADC.b $00
#_07D4C0: TAY

#_07D4C1: STZ.b $59

#_07D4C3: REP #$20

#_07D4C5: JSR TileDetect_ResetState

#_07D4C8: LDA.b $20
#_07D4CA: CLC
#_07D4CB: ADC.w .offset_y_top,Y
#_07D4CE: AND.b $EC
#_07D4D0: STA.b $00

#_07D4D2: LDA.b $22
#_07D4D4: CLC
#_07D4D5: ADC.w .offset_x_top,Y
#_07D4D8: AND.b $EC
#_07D4DA: LSR A
#_07D4DB: LSR A
#_07D4DC: LSR A
#_07D4DD: STA.b $02

#_07D4DF: LDA.b $20
#_07D4E1: CLC
#_07D4E2: ADC.w .offset_y_bottom,Y
#_07D4E5: AND.b $EC
#_07D4E7: STA.b $04

#_07D4E9: LDA.b $22
#_07D4EB: CLC
#_07D4EC: ADC.w .offset_x_bottom,Y
#_07D4EF: AND.b $EC
#_07D4F1: LSR A
#_07D4F2: LSR A
#_07D4F3: LSR A
#_07D4F4: STA.b $08

#_07D4F6: LDA.w #$0001
#_07D4F9: STA.b $0A

#_07D4FB: REP #$10

#_07D4FD: JSR TileDetection_Execute

#_07D500: LDA.b $04
#_07D502: STA.b $00

#_07D504: LDA.b $08
#_07D506: STA.b $02

#_07D508: LDA.w #$0002
#_07D50B: STA.b $0A

#_07D50D: JSR TileDetection_Execute

#_07D510: SEP #$30

#_07D512: PLA
#_07D513: STA.b $00

#_07D515: LDA.b $0E
#_07D517: ORA.w $036E
#_07D51A: AND.b #$03
#_07D51C: BNE .horizontal_ledges_detected

#_07D51E: LDA.w $036D
#_07D521: ORA.w $0370
#_07D524: AND.b #$33
#_07D526: BEQ .exit

.horizontal_ledges_detected
#_07D528: LDY.b #$00

#_07D52A: LDA.b $00
#_07D52C: EOR.b #$FF
#_07D52E: INC A
#_07D52F: STA.b $00

#_07D531: CMP.b #$80
#_07D533: BCC .positive_velocity

#_07D535: LDY.b #$FF

.positive_velocity
#_07D537: STY.b $01

#_07D539: LDA.b $66
#_07D53B: AND.b #$02
#_07D53D: BEQ .add_on_x

#_07D53F: REP #$20

#_07D541: LDA.b $00
#_07D543: CLC
#_07D544: ADC.b $20
#_07D546: STA.b $20

#_07D548: BRA .exit

;---------------------------------------------------------------------------------------------------

.add_on_x
#_07D54A: REP #$20

#_07D54C: LDA.b $00
#_07D54E: CLC
#_07D54F: ADC.b $22
#_07D551: STA.b $22

.exit
#_07D553: SEP #$20

#_07D555: RTS

;===================================================================================================

pool Hookshot_CheckTileCollision

.offsets_a
#_07D556: dw   0,   0
#_07D55A: dw   7,   7
#_07D55E: dw   0,  15
#_07D562: dw   0,  15

.offsets_b
#_07D566: dw   0,  15
#_07D56A: dw   0,  15
#_07D56E: dw   0,   0
#_07D572: dw   8,   8

pool off

;---------------------------------------------------------------------------------------------------

Hookshot_CheckTileCollision:
#_07D576: PHB
#_07D577: PHK
#_07D578: PLB

#_07D579: LDA.b $A0
#_07D57B: PHA

#_07D57C: LDA.b $EE
#_07D57E: PHA

#_07D57F: LDA.w $03A4,X
#_07D582: BEQ .dont_swap_layers

#_07D584: LDA.w $044A
#_07D587: BNE .not_eg0

#_07D589: LDA.b $A0
#_07D58B: CLC
#_07D58C: ADC.b #$10
#_07D58E: STA.b $A0

.not_eg0
#_07D590: LDA.b $EE
#_07D592: EOR.b #$01
#_07D594: STA.b $EE

;---------------------------------------------------------------------------------------------------

.dont_swap_layers
#_07D596: LDA.w $0BFA,X
#_07D599: STA.b $04

#_07D59B: LDA.w $0C0E,X
#_07D59E: STA.b $05

#_07D5A0: LDA.w $0C04,X
#_07D5A3: STA.b $08

#_07D5A5: LDA.w $0C18,X
#_07D5A8: STA.b $09

#_07D5AA: LDA.w $0C72,X
#_07D5AD: ASL A
#_07D5AE: ASL A
#_07D5AF: STA.b $73

;---------------------------------------------------------------------------------------------------

#_07D5B1: PHX

#_07D5B2: STZ.b $59

#_07D5B4: REP #$20

#_07D5B6: JSR TileDetect_ResetState

#_07D5B9: SEP #$20

#_07D5BB: LDA.w $046C
#_07D5BE: CMP.b #$02
#_07D5C0: BNE .only_1_layer

;---------------------------------------------------------------------------------------------------

#_07D5C2: LDA.b $04
#_07D5C4: PHA

#_07D5C5: LDA.b $05
#_07D5C7: PHA

#_07D5C8: LDA.b $08
#_07D5CA: PHA

#_07D5CB: LDA.b $09
#_07D5CD: PHA

#_07D5CE: LDA.b #$01
#_07D5D0: STA.b $EE

;---------------------------------------------------------------------------------------------------

#_07D5D2: REP #$20

#_07D5D4: LDA.b $E6
#_07D5D6: SEC
#_07D5D7: SBC.b $E8

#_07D5D9: CLC
#_07D5DA: ADC.b $04
#_07D5DC: STA.b $04

#_07D5DE: LDA.b $E0
#_07D5E0: SEC
#_07D5E1: SBC.b $E2

#_07D5E3: CLC
#_07D5E4: ADC.b $08
#_07D5E6: STA.b $08

;---------------------------------------------------------------------------------------------------

#_07D5E8: SEP #$20

#_07D5EA: JSR Hookshot_CheckSingleLayerTileCollision

#_07D5ED: PLA
#_07D5EE: STA.b $09

#_07D5F0: PLA
#_07D5F1: STA.b $08

#_07D5F3: PLA
#_07D5F4: STA.b $05

#_07D5F6: PLA
#_07D5F7: STA.b $04

#_07D5F9: STZ.b $EE

;---------------------------------------------------------------------------------------------------

.only_1_layer
#_07D5FB: JSR Hookshot_CheckSingleLayerTileCollision

#_07D5FE: PLX

#_07D5FF: PLA
#_07D600: STA.b $EE

#_07D602: PLA
#_07D603: STA.b $A0

#_07D605: PLB

#_07D606: RTL

;===================================================================================================

Hookshot_CheckSingleLayerTileCollision:
#_07D607: REP #$20

#_07D609: LDA.b $73
#_07D60B: TAY

;---------------------------------------------------------------------------------------------------

#_07D60C: LDA.b $04
#_07D60E: CLC
#_07D60F: ADC.w Hookshot_CheckTileCollision_offsets_a+0,Y
#_07D612: AND.b $EC
#_07D614: STA.b $00

#_07D616: LDA.b $04
#_07D618: CLC
#_07D619: ADC.w Hookshot_CheckTileCollision_offsets_a+2,Y
#_07D61C: AND.b $EC
#_07D61E: STA.b $04

;---------------------------------------------------------------------------------------------------

#_07D620: LDA.b $08
#_07D622: CLC
#_07D623: ADC.w Hookshot_CheckTileCollision_offsets_b+0,Y
#_07D626: AND.b $EC

#_07D628: LSR A
#_07D629: LSR A
#_07D62A: LSR A
#_07D62B: STA.b $02


#_07D62D: LDA.b $08
#_07D62F: CLC
#_07D630: ADC.w Hookshot_CheckTileCollision_offsets_b+2,Y
#_07D633: AND.b $EC

#_07D635: LSR A
#_07D636: LSR A
#_07D637: LSR A
#_07D638: STA.b $08

;---------------------------------------------------------------------------------------------------

#_07D63A: REP #$10

#_07D63C: LDA.w #$0001
#_07D63F: STA.b $0A

#_07D641: JSR TileDetection_Execute

#_07D644: LDA.b $04
#_07D646: STA.b $00

#_07D648: LDA.b $08
#_07D64A: STA.b $02

#_07D64C: LDA.w #$0002
#_07D64F: STA.b $0A

#_07D651: JSR TileDetection_Execute

#_07D654: SEP #$30

#_07D656: RTS

;===================================================================================================

pool HandleNudgingInADoor

.offset_y
#_07D657: dw $0008, $0017, $0010, $0010

.offset_x
#_07D65F: dw $0008, $0008, $0000, $000F

pool off

;---------------------------------------------------------------------------------------------------

HandleNudgingInADoor:
#_07D667: LDA.b $00
#_07D669: PHA

#_07D66A: LDA.b $66
#_07D66C: AND.b #$02
#_07D66E: BEQ .not_horizontal_last

#_07D670: LDY.b #$02

#_07D672: LDA.b $20
#_07D674: CMP.b #$80
#_07D676: BCC .start_detect

#_07D678: LDY.b #$00
#_07D67A: BRA .start_detect

.not_horizontal_last
#_07D67C: LDY.b #$06

#_07D67E: LDA.b $22
#_07D680: CMP.b #$80
#_07D682: BCC .start_detect

#_07D684: LDY.b #$04

.start_detect
#_07D686: STZ.b $59

#_07D688: REP #$20

#_07D68A: JSR TileDetect_ResetState

#_07D68D: LDA.b $20
#_07D68F: CLC
#_07D690: ADC.w .offset_y,Y
#_07D693: AND.b $EC
#_07D695: STA.b $00

#_07D697: LDA.b $22
#_07D699: CLC
#_07D69A: ADC.w .offset_x,Y
#_07D69D: AND.b $EC
#_07D69F: LSR A
#_07D6A0: LSR A
#_07D6A1: LSR A
#_07D6A2: STA.b $02

#_07D6A4: LDA.w #$0001
#_07D6A7: STA.b $0A

#_07D6A9: REP #$10

#_07D6AB: JSR TileDetection_Execute

#_07D6AE: SEP #$30

#_07D6B0: PLA
#_07D6B1: STA.b $00

#_07D6B3: LDA.b $0E
#_07D6B5: ORA.w $036E
#_07D6B8: AND.b #$03
#_07D6BA: BNE .horizontal_ledge_detected

#_07D6BC: LDA.w $036D
#_07D6BF: ORA.w $0370
#_07D6C2: AND.b #$33
#_07D6C4: BEQ .exit

.horizontal_ledge_detected
#_07D6C6: LDY.b #$00

#_07D6C8: LDA.b $00
#_07D6CA: EOR.b #$FF
#_07D6CC: INC A
#_07D6CD: STA.b $00

#_07D6CF: CMP.b #$80
#_07D6D1: BCC .offset_positive

#_07D6D3: LDY.b #$FF

.offset_positive
#_07D6D5: STY.b $01

#_07D6D7: LDA.b $66
#_07D6D9: AND.b #$02
#_07D6DB: BEQ .add_on_x

#_07D6DD: REP #$20

#_07D6DF: LDA.b $00
#_07D6E1: CLC
#_07D6E2: ADC.b $20
#_07D6E4: STA.b $20

#_07D6E6: BRA .exit

.add_on_x
#_07D6E8: REP #$20

#_07D6EA: LDA.b $00
#_07D6EC: CLC
#_07D6ED: ADC.b $22
#_07D6EF: STA.b $22

.exit
#_07D6F1: SEP #$20

#_07D6F3: RTS

;===================================================================================================

TileCheckForMirrorBonk:
#_07D6F4: STZ.b $59

#_07D6F6: REP #$20

#_07D6F8: JSR TileDetect_ResetState

#_07D6FB: LDA.b $22
#_07D6FD: CLC
#_07D6FE: ADC.w #$0002
#_07D701: AND.b $EC
#_07D703: LSR A
#_07D704: LSR A
#_07D705: LSR A
#_07D706: STA.b $02

#_07D708: LDA.b $22
#_07D70A: CLC
#_07D70B: ADC.w #$000D
#_07D70E: AND.b $EC
#_07D710: LSR A
#_07D711: LSR A
#_07D712: LSR A
#_07D713: STA.b $04

#_07D715: LDA.b $20
#_07D717: CLC
#_07D718: ADC.w #$000A
#_07D71B: AND.b $EC
#_07D71D: STA.b $00
#_07D71F: STA.b $74

#_07D721: LDA.b $20
#_07D723: CLC
#_07D724: ADC.w #$0015
#_07D727: AND.b $EC
#_07D729: STA.b $08

#_07D72B: BRL TileDetect_FromMirrorBonk

;===================================================================================================

pool TileDetect_SwordSwingDeepInDoor

.offset_y
#_07D72E: dw $FFFF, $0018, $0010, $0010

.offset_x
#_07D736: dw $0008, $0008, $FFFF, $0010

pool off

;---------------------------------------------------------------------------------------------------

TileDetect_SwordSwingDeepInDoor:
#_07D73E: STZ.b $59

#_07D740: REP #$20

#_07D742: JSR TileDetect_ResetState

#_07D745: TXA
#_07D746: AND.w #$00FF
#_07D749: DEC A

#_07D74A: ASL A
#_07D74B: ASL A
#_07D74C: TAY

;---------------------------------------------------------------------------------------------------

#_07D74D: LDA.b $22
#_07D74F: CLC
#_07D750: ADC.w .offset_x+0,Y
#_07D753: AND.b $EC

#_07D755: LSR A
#_07D756: LSR A
#_07D757: LSR A
#_07D758: STA.b $02

#_07D75A: LDA.b $22
#_07D75C: CLC
#_07D75D: ADC.w .offset_x+2,Y
#_07D760: AND.b $EC

#_07D762: LSR A
#_07D763: LSR A
#_07D764: LSR A
#_07D765: STA.b $04

#_07D767: LDA.b $20
#_07D769: CLC
#_07D76A: ADC.w .offset_y+0,Y
#_07D76D: AND.b $EC
#_07D76F: STA.b $00

#_07D771: LDA.b $20
#_07D773: CLC
#_07D774: ADC.w .offset_y+2,Y
#_07D777: AND.b $EC
#_07D779: STA.b $08

;---------------------------------------------------------------------------------------------------

#_07D77B: REP #$10

#_07D77D: LDA.w #$0001
#_07D780: STA.b $0A

#_07D782: JSR TileDetection_Execute

#_07D785: LDA.b $04
#_07D787: STA.b $02

#_07D789: LDA.b $08
#_07D78B: STA.b $00

#_07D78D: LDA.w #$0002
#_07D790: STA.b $0A

#_07D792: JSR TileDetection_Execute

#_07D795: SEP #$30

#_07D797: RTS

;===================================================================================================

TileDetect_ResetState:
#_07D798: STZ.b $0C
#_07D79A: STZ.b $0E

#_07D79C: STZ.b $38
#_07D79E: STZ.b $58

#_07D7A0: STZ.w $02C0

#_07D7A3: STZ.b $5F
#_07D7A5: STZ.b $62

#_07D7A7: STZ.w $0320

#_07D7AA: STZ.w $0341
#_07D7AD: STZ.w $0343

#_07D7B0: STZ.w $0348
#_07D7B3: STZ.w $034C

#_07D7B6: STZ.w $0357
#_07D7B9: STZ.w $0359
#_07D7BC: STZ.w $035B

#_07D7BF: STZ.w $0366

#_07D7C2: STZ.w $036D
#_07D7C5: STZ.w $036F

#_07D7C8: STZ.w $02E5
#_07D7CB: STZ.w $02E7
#_07D7CE: STZ.w $02EE

#_07D7D1: STZ.w $02F6

#_07D7D4: STZ.w $03F1

#_07D7D7: RTS

;===================================================================================================

pool TileDetection_Execute_underworld

.vectors
#_07D7D8: dw TileBehavior_Nothing                          ; 0x00 UW
#_07D7DA: dw TileBehavior_StandardCollision                ; 0x01 UW
#_07D7DC: dw TileBehavior_StandardCollision                ; 0x02 UW
#_07D7DE: dw TileBehavior_StandardCollision                ; 0x03 UW
#_07D7E0: dw TileBehavior_StandardCollision                ; 0x04 UW
#_07D7E2: dw TileBehavior_Nothing                          ; 0x05 UW
#_07D7E4: dw TileBehavior_Nothing                          ; 0x06 UW
#_07D7E6: dw TileBehavior_Nothing                          ; 0x07 UW
#_07D7E8: dw TileBehavior_DeepWater                        ; 0x08 UW
#_07D7EA: dw TileBehavior_ShallowWater                     ; 0x09 UW
#_07D7EC: dw TileBehavior_ShortWaterLadder                 ; 0x0A UW
#_07D7EE: dw TileBehavior_StandardCollision                ; 0x0B UW
#_07D7F0: dw TileBehavior_OverlayMask_0C                   ; 0x0C UW
#_07D7F2: dw TileBehavior_SpikeFloor                       ; 0x0D UW
#_07D7F4: dw TileBehavior_GanonIce                         ; 0x0E UW
#_07D7F6: dw TileBehavior_PalaceIce                        ; 0x0F UW
#_07D7F8: dw TileBehavior_Slope                            ; 0x10 UW
#_07D7FA: dw TileBehavior_Slope                            ; 0x11 UW
#_07D7FC: dw TileBehavior_Slope                            ; 0x12 UW
#_07D7FE: dw TileBehavior_Slope                            ; 0x13 UW
#_07D800: dw TileBehavior_Nothing                          ; 0x14 UW
#_07D802: dw TileBehavior_Nothing                          ; 0x15 UW
#_07D804: dw TileBehavior_Nothing                          ; 0x16 UW
#_07D806: dw TileBehavior_Nothing                          ; 0x17 UW
#_07D808: dw TileBehavior_SlopeOuter                       ; 0x18 UW
#_07D80A: dw TileBehavior_SlopeOuter                       ; 0x19 UW
#_07D80C: dw TileBehavior_SlopeOuter                       ; 0x1A UW
#_07D80E: dw TileBehavior_SlopeOuter                       ; 0x1B UW
#_07D810: dw TileBehavior_OverlayMask_1C                   ; 0x1C UW
#_07D812: dw TileBehavior_NorthSingleLayerStairs           ; 0x1D UW
#_07D814: dw TileBehavior_NorthSwapLayerStairs             ; 0x1E UW
#_07D816: dw TileBehavior_NorthSwapLayerStairs             ; 0x1F UW
#_07D818: dw TileBehavior_Pit                              ; 0x20 UW
#_07D81A: dw TileBehavior_Nothing                          ; 0x21 UW
#_07D81C: dw TileBehavior_ManualStairs                     ; 0x22 UW
#_07D81E: dw TileBehavior_Nothing                          ; 0x23 UW
#_07D820: dw TileBehavior_Nothing                          ; 0x24 UW
#_07D822: dw TileBehavior_Nothing                          ; 0x25 UW
#_07D824: dw TileBehavior_StandardCollision                ; 0x26 UW
#_07D826: dw TileBehavior_Hookshottables                   ; 0x27 UW
#_07D828: dw TileBehavior_Ledge_North                      ; 0x28 UW
#_07D82A: dw TileBehavior_Ledge_South                      ; 0x29 UW
#_07D82C: dw TileBehavior_Ledge_EastWest                   ; 0x2A UW
#_07D82E: dw TileBehavior_Ledge_EastWest                   ; 0x2B UW
#_07D830: dw TileBehavior_Ledge_NorthDiagonal              ; 0x2C UW
#_07D832: dw TileBehavior_Ledge_SouthDiagonal              ; 0x2D UW
#_07D834: dw TileBehavior_Ledge_NorthDiagonal              ; 0x2E UW
#_07D836: dw TileBehavior_Ledge_SouthDiagonal              ; 0x2F UW
#_07D838: dw TileBehavior_ManualStairs                     ; 0x30 UW
#_07D83A: dw TileBehavior_ManualStairs                     ; 0x31 UW
#_07D83C: dw TileBehavior_ManualStairs                     ; 0x32 UW
#_07D83E: dw TileBehavior_ManualStairs                     ; 0x33 UW
#_07D840: dw TileBehavior_ManualStairs                     ; 0x34 UW
#_07D842: dw TileBehavior_ManualStairs                     ; 0x35 UW
#_07D844: dw TileBehavior_ManualStairs                     ; 0x36 UW
#_07D846: dw TileBehavior_ManualStairs                     ; 0x37 UW
#_07D848: dw TileBehavior_Nothing                          ; 0x38 UW
#_07D84A: dw TileBehavior_Nothing                          ; 0x39 UW
#_07D84C: dw TileBehavior_Nothing                          ; 0x3A UW
#_07D84E: dw TileBehavior_Nothing                          ; 0x3B UW
#_07D850: dw TileBehavior_Nothing                          ; 0x3C UW
#_07D852: dw TileBehavior_SouthSingleLayerStairs           ; 0x3D UW
#_07D854: dw TileBehavior_SouthSwapLayerStairs             ; 0x3E UW
#_07D856: dw TileBehavior_SouthSwapLayerStairs             ; 0x3F UW
#_07D858: dw TileBehavior_ThickGrass                       ; 0x40 UW
#_07D85A: dw TileBehavior_Nothing                          ; 0x41 UW
#_07D85C: dw TileBehavior_Nothing                          ; 0x42 UW
#_07D85E: dw TileBehavior_StandardCollision                ; 0x43 UW
#_07D860: dw TileBehavior_Spike                            ; 0x44 UW
#_07D862: dw TileBehavior_Nothing                          ; 0x45 UW
#_07D864: dw TileBehavior_HylianPlaque                     ; 0x46 UW
#_07D866: dw TileBehavior_Nothing                          ; 0x47 UW
#_07D868: dw TileBehavior_DiggableGround                   ; 0x48 UW
#_07D86A: dw TileBehavior_Nothing                          ; 0x49 UW
#_07D86C: dw TileBehavior_DiggableGround                   ; 0x4A UW
#_07D86E: dw TileBehavior_Warp                             ; 0x4B UW
#_07D870: dw TileBehavior_Nothing                          ; 0x4C UW
#_07D872: dw TileBehavior_Nothing                          ; 0x4D UW
#_07D874: dw TileBehavior_Nothing                          ; 0x4E UW
#_07D876: dw TileBehavior_Nothing                          ; 0x4F UW
#_07D878: dw TileBehavior_Liftable                         ; 0x50 UW
#_07D87A: dw TileBehavior_Liftable                         ; 0x51 UW
#_07D87C: dw TileBehavior_Liftable                         ; 0x52 UW
#_07D87E: dw TileBehavior_Liftable                         ; 0x53 UW
#_07D880: dw TileBehavior_Liftable                         ; 0x54 UW
#_07D882: dw TileBehavior_Liftable                         ; 0x55 UW
#_07D884: dw TileBehavior_Liftable                         ; 0x56 UW
#_07D886: dw TileBehavior_BonkRocks                        ; 0x57 UW
#_07D888: dw TileBehavior_Chest                            ; 0x58 UW
#_07D88A: dw TileBehavior_Chest                            ; 0x59 UW
#_07D88C: dw TileBehavior_Chest                            ; 0x5A UW
#_07D88E: dw TileBehavior_Chest                            ; 0x5B UW
#_07D890: dw TileBehavior_Chest                            ; 0x5C UW
#_07D892: dw TileBehavior_Chest                            ; 0x5D UW
#_07D894: dw TileBehavior_Nothing                          ; 0x5E UW
#_07D896: dw TileBehavior_Nothing                          ; 0x5F UW
#_07D898: dw TileBehavior_RupeeTile                        ; 0x60 UW
#_07D89A: dw TileBehavior_Nothing                          ; 0x61 UW
#_07D89C: dw TileBehavior_Nothing                          ; 0x62 UW
#_07D89E: dw TileBehavior_MinigameChest                    ; 0x63 UW
#_07D8A0: dw TileBehavior_Nothing                          ; 0x64 UW
#_07D8A2: dw TileBehavior_Nothing                          ; 0x65 UW
#_07D8A4: dw TileBehavior_Nothing                          ; 0x66 UW
#_07D8A6: dw TileBehavior_CrystalPeg_Up                    ; 0x67 UW
#_07D8A8: dw TileBehavior_Conveyor_Upwards                 ; 0x68 UW
#_07D8AA: dw TileBehavior_Conveyor_Downwards               ; 0x69 UW
#_07D8AC: dw TileBehavior_Conveyor_Leftwards               ; 0x6A UW
#_07D8AE: dw TileBehavior_Conveyor_Rightwards              ; 0x6B UW
#_07D8B0: dw TileBehavior_StandardCollision                ; 0x6C UW
#_07D8B2: dw TileBehavior_StandardCollision                ; 0x6D UW
#_07D8B4: dw TileBehavior_StandardCollision                ; 0x6E UW
#_07D8B6: dw TileBehavior_StandardCollision                ; 0x6F UW
#_07D8B8: dw TileBehavior_ManipulablyReplaced              ; 0x70 UW
#_07D8BA: dw TileBehavior_ManipulablyReplaced              ; 0x71 UW
#_07D8BC: dw TileBehavior_ManipulablyReplaced              ; 0x72 UW
#_07D8BE: dw TileBehavior_ManipulablyReplaced              ; 0x73 UW
#_07D8C0: dw TileBehavior_ManipulablyReplaced              ; 0x74 UW
#_07D8C2: dw TileBehavior_ManipulablyReplaced              ; 0x75 UW
#_07D8C4: dw TileBehavior_ManipulablyReplaced              ; 0x76 UW
#_07D8C6: dw TileBehavior_ManipulablyReplaced              ; 0x77 UW
#_07D8C8: dw TileBehavior_ManipulablyReplaced              ; 0x78 UW
#_07D8CA: dw TileBehavior_ManipulablyReplaced              ; 0x79 UW
#_07D8CC: dw TileBehavior_ManipulablyReplaced              ; 0x7A UW
#_07D8CE: dw TileBehavior_ManipulablyReplaced              ; 0x7B UW
#_07D8D0: dw TileBehavior_ManipulablyReplaced              ; 0x7C UW
#_07D8D2: dw TileBehavior_ManipulablyReplaced              ; 0x7D UW
#_07D8D4: dw TileBehavior_ManipulablyReplaced              ; 0x7E UW
#_07D8D6: dw TileBehavior_ManipulablyReplaced              ; 0x7F UW
#_07D8D8: dw TileBehavior_Door                             ; 0x80 UW
#_07D8DA: dw TileBehavior_Door                             ; 0x81 UW
#_07D8DC: dw TileBehavior_ShutterDoor                      ; 0x82 UW
#_07D8DE: dw TileBehavior_ShutterDoor                      ; 0x83 UW
#_07D8E0: dw TileBehavior_Door                             ; 0x84 UW
#_07D8E2: dw TileBehavior_Door                             ; 0x85 UW
#_07D8E4: dw TileBehavior_Door                             ; 0x86 UW
#_07D8E6: dw TileBehavior_Door                             ; 0x87 UW
#_07D8E8: dw TileBehavior_Door                             ; 0x88 UW
#_07D8EA: dw TileBehavior_Door                             ; 0x89 UW
#_07D8EC: dw TileBehavior_Door                             ; 0x8A UW
#_07D8EE: dw TileBehavior_Door                             ; 0x8B UW
#_07D8F0: dw TileBehavior_Door                             ; 0x8C UW
#_07D8F2: dw TileBehavior_Door                             ; 0x8D UW
#_07D8F4: dw TileBehavior_Entrance                         ; 0x8E UW
#_07D8F6: dw TileBehavior_Entrance                         ; 0x8F UW
#_07D8F8: dw TileBehavior_LayerToggleShutterDoor           ; 0x90 UW
#_07D8FA: dw TileBehavior_LayerToggleShutterDoor           ; 0x91 UW
#_07D8FC: dw TileBehavior_LayerToggleShutterDoor           ; 0x92 UW
#_07D8FE: dw TileBehavior_LayerToggleShutterDoor           ; 0x93 UW
#_07D900: dw TileBehavior_LayerToggleShutterDoor           ; 0x94 UW
#_07D902: dw TileBehavior_LayerToggleShutterDoor           ; 0x95 UW
#_07D904: dw TileBehavior_LayerToggleShutterDoor           ; 0x96 UW
#_07D906: dw TileBehavior_LayerToggleShutterDoor           ; 0x97 UW
#_07D908: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x98 UW
#_07D90A: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x99 UW
#_07D90C: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9A UW
#_07D90E: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9B UW
#_07D910: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9C UW
#_07D912: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9D UW
#_07D914: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9E UW
#_07D916: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9F UW
#_07D918: dw TileBehavior_DungeonToggleManualDoor          ; 0xA0 UW
#_07D91A: dw TileBehavior_DungeonToggleManualDoor          ; 0xA1 UW
#_07D91C: dw TileBehavior_DungeonToggleShutterDoor         ; 0xA2 UW
#_07D91E: dw TileBehavior_DungeonToggleShutterDoor         ; 0xA3 UW
#_07D920: dw TileBehavior_DungeonToggleManualDoor          ; 0xA4 UW
#_07D922: dw TileBehavior_DungeonToggleManualDoor          ; 0xA5 UW
#_07D924: dw TileBehavior_Nothing                          ; 0xA6 UW
#_07D926: dw TileBehavior_Nothing                          ; 0xA7 UW
#_07D928: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xA8 UW
#_07D92A: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xA9 UW
#_07D92C: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAA UW
#_07D92E: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAB UW
#_07D930: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAC UW
#_07D932: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAD UW
#_07D934: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAE UW
#_07D936: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAF UW
#_07D938: dw TileBehavior_Pit                              ; 0xB0 UW
#_07D93A: dw TileBehavior_Pit                              ; 0xB1 UW
#_07D93C: dw TileBehavior_Pit                              ; 0xB2 UW
#_07D93E: dw TileBehavior_Pit                              ; 0xB3 UW
#_07D940: dw TileBehavior_Pit                              ; 0xB4 UW
#_07D942: dw TileBehavior_Pit                              ; 0xB5 UW
#_07D944: dw TileBehavior_Pit                              ; 0xB6 UW
#_07D946: dw TileBehavior_Pit                              ; 0xB7 UW
#_07D948: dw TileBehavior_Pit                              ; 0xB8 UW
#_07D94A: dw TileBehavior_Pit                              ; 0xB9 UW
#_07D94C: dw TileBehavior_Pit                              ; 0xBA UW
#_07D94E: dw TileBehavior_Pit                              ; 0xBB UW
#_07D950: dw TileBehavior_Pit                              ; 0xBC UW
#_07D952: dw TileBehavior_Pit                              ; 0xBD UW
#_07D954: dw TileBehavior_Nothing                          ; 0xBE UW
#_07D956: dw TileBehavior_Nothing                          ; 0xBF UW
#_07D958: dw TileBehavior_LightableTorch                   ; 0xC0 UW
#_07D95A: dw TileBehavior_LightableTorch                   ; 0xC1 UW
#_07D95C: dw TileBehavior_LightableTorch                   ; 0xC2 UW
#_07D95E: dw TileBehavior_LightableTorch                   ; 0xC3 UW
#_07D960: dw TileBehavior_LightableTorch                   ; 0xC4 UW
#_07D962: dw TileBehavior_LightableTorch                   ; 0xC5 UW
#_07D964: dw TileBehavior_LightableTorch                   ; 0xC6 UW
#_07D966: dw TileBehavior_LightableTorch                   ; 0xC7 UW
#_07D968: dw TileBehavior_LightableTorch                   ; 0xC8 UW
#_07D96A: dw TileBehavior_LightableTorch                   ; 0xC9 UW
#_07D96C: dw TileBehavior_LightableTorch                   ; 0xCA UW
#_07D96E: dw TileBehavior_LightableTorch                   ; 0xCB UW
#_07D970: dw TileBehavior_LightableTorch                   ; 0xCC UW
#_07D972: dw TileBehavior_LightableTorch                   ; 0xCD UW
#_07D974: dw TileBehavior_LightableTorch                   ; 0xCE UW
#_07D976: dw TileBehavior_LightableTorch                   ; 0xCF UW
#_07D978: dw TileBehavior_Nothing                          ; 0xD0 UW
#_07D97A: dw TileBehavior_Nothing                          ; 0xD1 UW
#_07D97C: dw TileBehavior_Nothing                          ; 0xD2 UW
#_07D97E: dw TileBehavior_Nothing                          ; 0xD3 UW
#_07D980: dw TileBehavior_Nothing                          ; 0xD4 UW
#_07D982: dw TileBehavior_Nothing                          ; 0xD5 UW
#_07D984: dw TileBehavior_Nothing                          ; 0xD6 UW
#_07D986: dw TileBehavior_Nothing                          ; 0xD7 UW
#_07D988: dw TileBehavior_Nothing                          ; 0xD8 UW
#_07D98A: dw TileBehavior_Nothing                          ; 0xD9 UW
#_07D98C: dw TileBehavior_Nothing                          ; 0xDA UW
#_07D98E: dw TileBehavior_Nothing                          ; 0xDB UW
#_07D990: dw TileBehavior_Nothing                          ; 0xDC UW
#_07D992: dw TileBehavior_Nothing                          ; 0xDD UW
#_07D994: dw TileBehavior_Nothing                          ; 0xDE UW
#_07D996: dw TileBehavior_Nothing                          ; 0xDF UW
#_07D998: dw TileBehavior_Nothing                          ; 0xE0 UW
#_07D99A: dw TileBehavior_Nothing                          ; 0xE1 UW
#_07D99C: dw TileBehavior_Nothing                          ; 0xE2 UW
#_07D99E: dw TileBehavior_Nothing                          ; 0xE3 UW
#_07D9A0: dw TileBehavior_Nothing                          ; 0xE4 UW
#_07D9A2: dw TileBehavior_Nothing                          ; 0xE5 UW
#_07D9A4: dw TileBehavior_Nothing                          ; 0xE6 UW
#_07D9A6: dw TileBehavior_Nothing                          ; 0xE7 UW
#_07D9A8: dw TileBehavior_Nothing                          ; 0xE8 UW
#_07D9AA: dw TileBehavior_Nothing                          ; 0xE9 UW
#_07D9AC: dw TileBehavior_Nothing                          ; 0xEA UW
#_07D9AE: dw TileBehavior_Nothing                          ; 0xEB UW
#_07D9B0: dw TileBehavior_Nothing                          ; 0xEC UW
#_07D9B2: dw TileBehavior_Nothing                          ; 0xED UW
#_07D9B4: dw TileBehavior_Nothing                          ; 0xEE UW
#_07D9B6: dw TileBehavior_Nothing                          ; 0xEF UW
#_07D9B8: dw TileBehavior_FlaggableDoor                    ; 0xF0 UW
#_07D9BA: dw TileBehavior_FlaggableDoor                    ; 0xF1 UW
#_07D9BC: dw TileBehavior_FlaggableDoor                    ; 0xF2 UW
#_07D9BE: dw TileBehavior_FlaggableDoor                    ; 0xF3 UW
#_07D9C0: dw TileBehavior_FlaggableDoor                    ; 0xF4 UW
#_07D9C2: dw TileBehavior_FlaggableDoor                    ; 0xF5 UW
#_07D9C4: dw TileBehavior_FlaggableDoor                    ; 0xF6 UW
#_07D9C6: dw TileBehavior_FlaggableDoor                    ; 0xF7 UW
#_07D9C8: dw TileBehavior_FlaggableDoor                    ; 0xF8 UW
#_07D9CA: dw TileBehavior_FlaggableDoor                    ; 0xF9 UW
#_07D9CC: dw TileBehavior_FlaggableDoor                    ; 0xFA UW
#_07D9CE: dw TileBehavior_FlaggableDoor                    ; 0xFB UW
#_07D9D0: dw TileBehavior_FlaggableDoor                    ; 0xFC UW
#_07D9D2: dw TileBehavior_FlaggableDoor                    ; 0xFD UW
#_07D9D4: dw TileBehavior_FlaggableDoor                    ; 0xFE UW
#_07D9D6: dw TileBehavior_FlaggableDoor                    ; 0xFF UW

pool off

;===================================================================================================

TileDetection_Execute:
#_07D9D8: SEP #$30

#_07D9DA: LDA.b $1B
#_07D9DC: BNE TileDetection_Execute_underworld

#_07D9DE: BRL TileDetection_Execute_overworld

;===================================================================================================

TileDetection_Execute_underworld:
#_07D9E1: REP #$20

#_07D9E3: LDA.b $49
#_07D9E5: AND.w #$00FF
#_07D9E8: STA.b $49

#_07D9EA: LDA.b $00
#_07D9EC: AND.w #$FFF8
#_07D9EF: ASL A
#_07D9F0: ASL A
#_07D9F1: ASL A
#_07D9F2: STA.b $06

#_07D9F4: LDA.b $02
#_07D9F6: AND.w #$003F
#_07D9F9: CLC
#_07D9FA: ADC.b $06

#_07D9FC: LDX.b $EE
#_07D9FE: BEQ .lower_layer

#_07DA00: CLC
#_07DA01: ADC.w #$1000

.lower_layer
#_07DA04: REP #$10

#_07DA06: TAX

#_07DA07: LDA.l $7F2000,X
#_07DA0B: PHA

;---------------------------------------------------------------------------------------------------

#_07DA0C: LDA.w $037F
#_07DA0F: AND.w #$00FF
#_07DA12: BEQ .not_oob

#_07DA14: PLA
#_07DA15: LDA.w #$0000
#_07DA18: BRA .oob_mode

.not_oob
#_07DA1A: PLA

.oob_mode
#_07DA1B: AND.w #$00FF
#_07DA1E: STA.b $06
#_07DA20: STA.w $0114

#_07DA23: STX.b $BD

#_07DA25: ASL A
#_07DA26: TAX

#_07DA27: JMP.w (.vectors,X)

;===================================================================================================

pool TileDetection_Execute_overworld

.vectors
#_07DA2A: dw TileBehavior_NothingOW                        ; 0x00 OW
#_07DA2C: dw TileBehavior_StandardCollision                ; 0x01 OW
#_07DA2E: dw TileBehavior_StandardCollision                ; 0x02 OW
#_07DA30: dw TileBehavior_StandardCollision                ; 0x03 OW
#_07DA32: dw TileBehavior_ThickGrass                       ; 0x04 OW
#_07DA34: dw TileBehavior_NothingOW                        ; 0x05 OW
#_07DA36: dw TileBehavior_NothingOW                        ; 0x06 OW
#_07DA38: dw TileBehavior_NothingOW                        ; 0x07 OW
#_07DA3A: dw TileBehavior_DeepWater                        ; 0x08 OW
#_07DA3C: dw TileBehavior_ShallowWater                     ; 0x09 OW
#_07DA3E: dw TileBehavior_ShortWaterLadder                 ; 0x0A OW
#_07DA40: dw TileBehavior_UnusedDeepWater                  ; 0x0B OW
#_07DA42: dw TileBehavior_OverlayMask_0C                   ; 0x0C OW
#_07DA44: dw TileBehavior_SpikeFloor                       ; 0x0D OW
#_07DA46: dw TileBehavior_GanonIce                         ; 0x0E OW
#_07DA48: dw TileBehavior_PalaceIce                        ; 0x0F OW
#_07DA4A: dw TileBehavior_Slope                            ; 0x10 OW
#_07DA4C: dw TileBehavior_Slope                            ; 0x11 OW
#_07DA4E: dw TileBehavior_Slope                            ; 0x12 OW
#_07DA50: dw TileBehavior_Slope                            ; 0x13 OW
#_07DA52: dw TileBehavior_NothingOW                        ; 0x14 OW
#_07DA54: dw TileBehavior_NothingOW                        ; 0x15 OW
#_07DA56: dw TileBehavior_NothingOW                        ; 0x16 OW
#_07DA58: dw TileBehavior_NothingOW                        ; 0x17 OW
#_07DA5A: dw TileBehavior_SlopeOuter                       ; 0x18 OW
#_07DA5C: dw TileBehavior_SlopeOuter                       ; 0x19 OW
#_07DA5E: dw TileBehavior_SlopeOuter                       ; 0x1A OW
#_07DA60: dw TileBehavior_SlopeOuter                       ; 0x1B OW
#_07DA62: dw TileBehavior_OverlayMask_1C                   ; 0x1C OW
#_07DA64: dw TileBehavior_NorthSingleLayerStairs           ; 0x1D OW
#_07DA66: dw TileBehavior_NorthSwapLayerStairs             ; 0x1E OW
#_07DA68: dw TileBehavior_NorthSwapLayerStairs             ; 0x1F OW
#_07DA6A: dw TileBehavior_Pit                              ; 0x20 OW
#_07DA6C: dw TileBehavior_NothingOW                        ; 0x21 OW
#_07DA6E: dw TileBehavior_ManualStairs                     ; 0x22 OW
#_07DA70: dw TileBehavior_NothingOW                        ; 0x23 OW
#_07DA72: dw TileBehavior_NothingOW                        ; 0x24 OW
#_07DA74: dw TileBehavior_NothingOW                        ; 0x25 OW
#_07DA76: dw TileBehavior_StandardCollision                ; 0x26 OW
#_07DA78: dw TileBehavior_Hookshottables                   ; 0x27 OW
#_07DA7A: dw TileBehavior_Ledge_North                      ; 0x28 OW
#_07DA7C: dw TileBehavior_Ledge_South                      ; 0x29 OW
#_07DA7E: dw TileBehavior_Ledge_EastWest                   ; 0x2A OW
#_07DA80: dw TileBehavior_Ledge_EastWest                   ; 0x2B OW
#_07DA82: dw TileBehavior_Ledge_NorthDiagonal              ; 0x2C OW
#_07DA84: dw TileBehavior_Ledge_SouthDiagonal              ; 0x2D OW
#_07DA86: dw TileBehavior_Ledge_NorthDiagonal              ; 0x2E OW
#_07DA88: dw TileBehavior_Ledge_SouthDiagonal              ; 0x2F OW
#_07DA8A: dw TileBehavior_ManualStairs                     ; 0x30 OW
#_07DA8C: dw TileBehavior_ManualStairs                     ; 0x31 OW
#_07DA8E: dw TileBehavior_ManualStairs                     ; 0x32 OW
#_07DA90: dw TileBehavior_ManualStairs                     ; 0x33 OW
#_07DA92: dw TileBehavior_ManualStairs                     ; 0x34 OW
#_07DA94: dw TileBehavior_ManualStairs                     ; 0x35 OW
#_07DA96: dw TileBehavior_ManualStairs                     ; 0x36 OW
#_07DA98: dw TileBehavior_ManualStairs                     ; 0x37 OW
#_07DA9A: dw TileBehavior_NothingOW                        ; 0x38 OW
#_07DA9C: dw TileBehavior_NothingOW                        ; 0x39 OW
#_07DA9E: dw TileBehavior_NothingOW                        ; 0x3A OW
#_07DAA0: dw TileBehavior_NothingOW                        ; 0x3B OW
#_07DAA2: dw TileBehavior_NothingOW                        ; 0x3C OW
#_07DAA4: dw TileBehavior_SouthSingleLayerStairs           ; 0x3D OW
#_07DAA6: dw TileBehavior_SouthSwapLayerStairs             ; 0x3E OW
#_07DAA8: dw TileBehavior_SouthSwapLayerStairs             ; 0x3F OW
#_07DAAA: dw TileBehavior_ThickGrass                       ; 0x40 OW
#_07DAAC: dw TileBehavior_NothingOW                        ; 0x41 OW
#_07DAAE: dw TileBehavior_GraveStone                       ; 0x42 OW
#_07DAB0: dw TileBehavior_StandardCollision                ; 0x43 OW
#_07DAB2: dw TileBehavior_Spike                            ; 0x44 OW
#_07DAB4: dw TileBehavior_NothingOW                        ; 0x45 OW
#_07DAB6: dw TileBehavior_HylianPlaque                     ; 0x46 OW
#_07DAB8: dw TileBehavior_NothingOW                        ; 0x47 OW
#_07DABA: dw TileBehavior_DiggableGround                   ; 0x48 OW
#_07DABC: dw TileBehavior_NothingOW                        ; 0x49 OW
#_07DABE: dw TileBehavior_DiggableGround                   ; 0x4A OW
#_07DAC0: dw TileBehavior_Warp                             ; 0x4B OW
#_07DAC2: dw TileBehavior_UnusedCornerType                 ; 0x4C OW
#_07DAC4: dw TileBehavior_UnusedCornerType                 ; 0x4D OW
#_07DAC6: dw TileBehavior_EasternRuinsCorner               ; 0x4E OW
#_07DAC8: dw TileBehavior_EasternRuinsCorner               ; 0x4F OW
#_07DACA: dw TileBehavior_Liftable                         ; 0x50 OW
#_07DACC: dw TileBehavior_Liftable                         ; 0x51 OW
#_07DACE: dw TileBehavior_Liftable                         ; 0x52 OW
#_07DAD0: dw TileBehavior_Liftable                         ; 0x53 OW
#_07DAD2: dw TileBehavior_Liftable                         ; 0x54 OW
#_07DAD4: dw TileBehavior_Liftable                         ; 0x55 OW
#_07DAD6: dw TileBehavior_Liftable                         ; 0x56 OW
#_07DAD8: dw TileBehavior_BonkRocks                        ; 0x57 OW
#_07DADA: dw TileBehavior_Chest                            ; 0x58 OW
#_07DADC: dw TileBehavior_Chest                            ; 0x59 OW
#_07DADE: dw TileBehavior_Chest                            ; 0x5A OW
#_07DAE0: dw TileBehavior_Chest                            ; 0x5B OW
#_07DAE2: dw TileBehavior_Chest                            ; 0x5C OW
#_07DAE4: dw TileBehavior_Chest                            ; 0x5D OW
#_07DAE6: dw TileBehavior_NothingOW                        ; 0x5E OW
#_07DAE8: dw TileBehavior_NothingOW                        ; 0x5F OW
#_07DAEA: dw TileBehavior_NothingOW                        ; 0x60 OW
#_07DAEC: dw TileBehavior_NothingOW                        ; 0x61 OW
#_07DAEE: dw TileBehavior_NothingOW                        ; 0x62 OW
#_07DAF0: dw TileBehavior_MinigameChest                    ; 0x63 OW
#_07DAF2: dw TileBehavior_NothingOW                        ; 0x64 OW
#_07DAF4: dw TileBehavior_NothingOW                        ; 0x65 OW
#_07DAF6: dw TileBehavior_NothingOW                        ; 0x66 OW
#_07DAF8: dw TileBehavior_CrystalPeg_Up                    ; 0x67 OW
#_07DAFA: dw TileBehavior_Conveyor_Upwards                 ; 0x68 OW
#_07DAFC: dw TileBehavior_Conveyor_Downwards               ; 0x69 OW
#_07DAFE: dw TileBehavior_Conveyor_Leftwards               ; 0x6A OW
#_07DB00: dw TileBehavior_Conveyor_Rightwards              ; 0x6B OW
#_07DB02: dw TileBehavior_NothingOW                        ; 0x6C OW
#_07DB04: dw TileBehavior_NothingOW                        ; 0x6D OW
#_07DB06: dw TileBehavior_NothingOW                        ; 0x6E OW
#_07DB08: dw TileBehavior_NothingOW                        ; 0x6F OW
#_07DB0A: dw TileBehavior_ManipulablyReplaced              ; 0x70 OW
#_07DB0C: dw TileBehavior_ManipulablyReplaced              ; 0x71 OW
#_07DB0E: dw TileBehavior_ManipulablyReplaced              ; 0x72 OW
#_07DB10: dw TileBehavior_ManipulablyReplaced              ; 0x73 OW
#_07DB12: dw TileBehavior_ManipulablyReplaced              ; 0x74 OW
#_07DB14: dw TileBehavior_ManipulablyReplaced              ; 0x75 OW
#_07DB16: dw TileBehavior_ManipulablyReplaced              ; 0x76 OW
#_07DB18: dw TileBehavior_ManipulablyReplaced              ; 0x77 OW
#_07DB1A: dw TileBehavior_ManipulablyReplaced              ; 0x78 OW
#_07DB1C: dw TileBehavior_ManipulablyReplaced              ; 0x79 OW
#_07DB1E: dw TileBehavior_ManipulablyReplaced              ; 0x7A OW
#_07DB20: dw TileBehavior_ManipulablyReplaced              ; 0x7B OW
#_07DB22: dw TileBehavior_ManipulablyReplaced              ; 0x7C OW
#_07DB24: dw TileBehavior_ManipulablyReplaced              ; 0x7D OW
#_07DB26: dw TileBehavior_ManipulablyReplaced              ; 0x7E OW
#_07DB28: dw TileBehavior_ManipulablyReplaced              ; 0x7F OW
#_07DB2A: dw TileBehavior_Door                             ; 0x80 OW
#_07DB2C: dw TileBehavior_Door                             ; 0x81 OW
#_07DB2E: dw TileBehavior_ShutterDoor                      ; 0x82 OW
#_07DB30: dw TileBehavior_ShutterDoor                      ; 0x83 OW
#_07DB32: dw TileBehavior_Door                             ; 0x84 OW
#_07DB34: dw TileBehavior_Door                             ; 0x85 OW
#_07DB36: dw TileBehavior_Door                             ; 0x86 OW
#_07DB38: dw TileBehavior_Door                             ; 0x87 OW
#_07DB3A: dw TileBehavior_Door                             ; 0x88 OW
#_07DB3C: dw TileBehavior_Door                             ; 0x89 OW
#_07DB3E: dw TileBehavior_Door                             ; 0x8A OW
#_07DB40: dw TileBehavior_Door                             ; 0x8B OW
#_07DB42: dw TileBehavior_Door                             ; 0x8C OW
#_07DB44: dw TileBehavior_Door                             ; 0x8D OW
#_07DB46: dw TileBehavior_Entrance                         ; 0x8E OW
#_07DB48: dw TileBehavior_Entrance                         ; 0x8F OW
#_07DB4A: dw TileBehavior_LayerToggleShutterDoor           ; 0x90 OW
#_07DB4C: dw TileBehavior_LayerToggleShutterDoor           ; 0x91 OW
#_07DB4E: dw TileBehavior_LayerToggleShutterDoor           ; 0x92 OW
#_07DB50: dw TileBehavior_LayerToggleShutterDoor           ; 0x93 OW
#_07DB52: dw TileBehavior_LayerToggleShutterDoor           ; 0x94 OW
#_07DB54: dw TileBehavior_LayerToggleShutterDoor           ; 0x95 OW
#_07DB56: dw TileBehavior_LayerToggleShutterDoor           ; 0x96 OW
#_07DB58: dw TileBehavior_LayerToggleShutterDoor           ; 0x97 OW
#_07DB5A: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x98 OW
#_07DB5C: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x99 OW
#_07DB5E: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9A OW
#_07DB60: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9B OW
#_07DB62: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9C OW
#_07DB64: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9D OW
#_07DB66: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9E OW
#_07DB68: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9F OW
#_07DB6A: dw TileBehavior_DungeonToggleManualDoor          ; 0xA0 OW
#_07DB6C: dw TileBehavior_DungeonToggleManualDoor          ; 0xA1 OW
#_07DB6E: dw TileBehavior_DungeonToggleShutterDoor         ; 0xA2 OW
#_07DB70: dw TileBehavior_DungeonToggleShutterDoor         ; 0xA3 OW
#_07DB72: dw TileBehavior_DungeonToggleManualDoor          ; 0xA4 OW
#_07DB74: dw TileBehavior_DungeonToggleManualDoor          ; 0xA5 OW
#_07DB76: dw TileBehavior_NothingOW                        ; 0xA6 OW
#_07DB78: dw TileBehavior_NothingOW                        ; 0xA7 OW
#_07DB7A: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xA8 OW
#_07DB7C: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xA9 OW
#_07DB7E: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAA OW
#_07DB80: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAB OW
#_07DB82: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAC OW
#_07DB84: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAD OW
#_07DB86: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAE OW
#_07DB88: dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAF OW
#_07DB8A: dw TileBehavior_Pit                              ; 0xB0 OW
#_07DB8C: dw TileBehavior_Pit                              ; 0xB1 OW
#_07DB8E: dw TileBehavior_Pit                              ; 0xB2 OW
#_07DB90: dw TileBehavior_Pit                              ; 0xB3 OW
#_07DB92: dw TileBehavior_Pit                              ; 0xB4 OW
#_07DB94: dw TileBehavior_Pit                              ; 0xB5 OW
#_07DB96: dw TileBehavior_Pit                              ; 0xB6 OW
#_07DB98: dw TileBehavior_Pit                              ; 0xB7 OW
#_07DB9A: dw TileBehavior_Pit                              ; 0xB8 OW
#_07DB9C: dw TileBehavior_Pit                              ; 0xB9 OW
#_07DB9E: dw TileBehavior_Pit                              ; 0xBA OW
#_07DBA0: dw TileBehavior_Pit                              ; 0xBB OW
#_07DBA2: dw TileBehavior_Pit                              ; 0xBC OW
#_07DBA4: dw TileBehavior_Pit                              ; 0xBD OW
#_07DBA6: dw TileBehavior_NothingOW                        ; 0xBE OW
#_07DBA8: dw TileBehavior_NothingOW                        ; 0xBF OW
#_07DBAA: dw TileBehavior_LightableTorch                   ; 0xC0 OW
#_07DBAC: dw TileBehavior_LightableTorch                   ; 0xC1 OW
#_07DBAE: dw TileBehavior_LightableTorch                   ; 0xC2 OW
#_07DBB0: dw TileBehavior_LightableTorch                   ; 0xC3 OW
#_07DBB2: dw TileBehavior_LightableTorch                   ; 0xC4 OW
#_07DBB4: dw TileBehavior_LightableTorch                   ; 0xC5 OW
#_07DBB6: dw TileBehavior_LightableTorch                   ; 0xC6 OW
#_07DBB8: dw TileBehavior_LightableTorch                   ; 0xC7 OW
#_07DBBA: dw TileBehavior_LightableTorch                   ; 0xC8 OW
#_07DBBC: dw TileBehavior_LightableTorch                   ; 0xC9 OW
#_07DBBE: dw TileBehavior_LightableTorch                   ; 0xCA OW
#_07DBC0: dw TileBehavior_LightableTorch                   ; 0xCB OW
#_07DBC2: dw TileBehavior_LightableTorch                   ; 0xCC OW
#_07DBC4: dw TileBehavior_LightableTorch                   ; 0xCD OW
#_07DBC6: dw TileBehavior_LightableTorch                   ; 0xCE OW
#_07DBC8: dw TileBehavior_LightableTorch                   ; 0xCF OW
#_07DBCA: dw TileBehavior_NothingOW                        ; 0xD0 OW
#_07DBCC: dw TileBehavior_NothingOW                        ; 0xD1 OW
#_07DBCE: dw TileBehavior_NothingOW                        ; 0xD2 OW
#_07DBD0: dw TileBehavior_NothingOW                        ; 0xD3 OW
#_07DBD2: dw TileBehavior_NothingOW                        ; 0xD4 OW
#_07DBD4: dw TileBehavior_NothingOW                        ; 0xD5 OW
#_07DBD6: dw TileBehavior_NothingOW                        ; 0xD6 OW
#_07DBD8: dw TileBehavior_NothingOW                        ; 0xD7 OW
#_07DBDA: dw TileBehavior_NothingOW                        ; 0xD8 OW
#_07DBDC: dw TileBehavior_NothingOW                        ; 0xD9 OW
#_07DBDE: dw TileBehavior_NothingOW                        ; 0xDA OW
#_07DBE0: dw TileBehavior_NothingOW                        ; 0xDB OW
#_07DBE2: dw TileBehavior_NothingOW                        ; 0xDC OW
#_07DBE4: dw TileBehavior_NothingOW                        ; 0xDD OW
#_07DBE6: dw TileBehavior_NothingOW                        ; 0xDE OW
#_07DBE8: dw TileBehavior_NothingOW                        ; 0xDF OW
#_07DBEA: dw TileBehavior_NothingOW                        ; 0xE0 OW
#_07DBEC: dw TileBehavior_NothingOW                        ; 0xE1 OW
#_07DBEE: dw TileBehavior_NothingOW                        ; 0xE2 OW
#_07DBF0: dw TileBehavior_NothingOW                        ; 0xE3 OW
#_07DBF2: dw TileBehavior_NothingOW                        ; 0xE4 OW
#_07DBF4: dw TileBehavior_NothingOW                        ; 0xE5 OW
#_07DBF6: dw TileBehavior_NothingOW                        ; 0xE6 OW
#_07DBF8: dw TileBehavior_NothingOW                        ; 0xE7 OW
#_07DBFA: dw TileBehavior_NothingOW                        ; 0xE8 OW
#_07DBFC: dw TileBehavior_NothingOW                        ; 0xE9 OW
#_07DBFE: dw TileBehavior_NothingOW                        ; 0xEA OW
#_07DC00: dw TileBehavior_NothingOW                        ; 0xEB OW
#_07DC02: dw TileBehavior_NothingOW                        ; 0xEC OW
#_07DC04: dw TileBehavior_NothingOW                        ; 0xED OW
#_07DC06: dw TileBehavior_NothingOW                        ; 0xEE OW
#_07DC08: dw TileBehavior_NothingOW                        ; 0xEF OW
#_07DC0A: dw TileBehavior_FlaggableDoor                    ; 0xF0 OW
#_07DC0C: dw TileBehavior_FlaggableDoor                    ; 0xF1 OW
#_07DC0E: dw TileBehavior_FlaggableDoor                    ; 0xF2 OW
#_07DC10: dw TileBehavior_FlaggableDoor                    ; 0xF3 OW
#_07DC12: dw TileBehavior_FlaggableDoor                    ; 0xF4 OW
#_07DC14: dw TileBehavior_FlaggableDoor                    ; 0xF5 OW
#_07DC16: dw TileBehavior_FlaggableDoor                    ; 0xF6 OW
#_07DC18: dw TileBehavior_FlaggableDoor                    ; 0xF7 OW
#_07DC1A: dw TileBehavior_FlaggableDoor                    ; 0xF8 OW
#_07DC1C: dw TileBehavior_FlaggableDoor                    ; 0xF9 OW
#_07DC1E: dw TileBehavior_FlaggableDoor                    ; 0xFA OW
#_07DC20: dw TileBehavior_FlaggableDoor                    ; 0xFB OW
#_07DC22: dw TileBehavior_FlaggableDoor                    ; 0xFC OW
#_07DC24: dw TileBehavior_FlaggableDoor                    ; 0xFD OW
#_07DC26: dw TileBehavior_FlaggableDoor                    ; 0xFE OW
#_07DC28: dw TileBehavior_FlaggableDoor                    ; 0xFF OW

pool off

;---------------------------------------------------------------------------------------------------

TileDetection_Execute_overworld:
#_07DC2A: JSL Overworld_GetTileTypeAtLocation

.from_item
#_07DC2E: REP #$30

#_07DC30: PHA

#_07DC31: LDA.w $037F
#_07DC34: AND.w #$00FF
#_07DC37: BEQ .not_oob

#_07DC39: PLA
#_07DC3A: LDA.w #$0000

#_07DC3D: BRA .oob_mode

.not_oob
#_07DC3F: PLA

.oob_mode
#_07DC40: AND.w #$00FF
#_07DC43: STA.b $06

#_07DC45: ASL A
#_07DC46: TAX

#_07DC47: JMP.w (.vectors,X)

;===================================================================================================

#TileBehavior_HandleItemAndExecute:
#_07DC4A: JSL HandleItemTileAction_Overworld

#_07DC4E: BRA .from_item

;===================================================================================================

TileBehavior_StandardCollision:
#_07DC50: LDA.b $0A
#_07DC52: TSB.b $0E

;===================================================================================================

TileBehavior_Nothing:
#_07DC54: RTS

;===================================================================================================

TileBehavior_Slope_masks:
#_07DC55: dw $0004 ; 00000100
#_07DC57: dw $0000 ; 00000000
#_07DC59: dw $0006 ; 00000110
#_07DC5B: dw $0002 ; 00000010

;===================================================================================================

TileBehavior_SlopeOuter:
#_07DC5D: LDA.b $0A
#_07DC5F: TSB.b $38

;===================================================================================================

TileBehavior_Slope:
#_07DC61: LDA.b $0A
#_07DC63: TSB.b $0C

#_07DC65: LDA.b $06
#_07DC67: AND.w #$0003
#_07DC6A: ASL A
#_07DC6B: TAY

#_07DC6C: LDA.w TileBehavior_Slope_masks,Y
#_07DC6F: STA.b $6E

#_07DC71: RTS

;===================================================================================================

TileBehavior_NorthSingleLayerStairs:
#_07DC72: LDA.b $06
#_07DC74: STA.b $76

#_07DC76: LDA.b $0A
#_07DC78: TSB.w $02C0

#_07DC7B: BRA TileBehavior_ManualStairs

;===================================================================================================

TileBehavior_NorthSwapLayerStairs:
#_07DC7D: LDA.b $06
#_07DC7F: STA.b $76

#_07DC81: LDA.b $0A
#_07DC83: TSB.w $02C0

;===================================================================================================

TileBehavior_ManualStairs:
#_07DC86: LDA.b $0A
#_07DC88: TSB.b $58

#_07DC8A: RTS

;===================================================================================================

TileBehavior_Pit:
#_07DC8B: LDA.w $02F5
#_07DC8E: AND.w #$00FF
#_07DC91: BNE .exit

#_07DC93: LDA.b $0A
#_07DC95: TSB.b $59

.exit
#_07DC97: RTS

;===================================================================================================

TileBehavior_OverlayMask_0C:
#_07DC98: LDA.b $0A
#_07DC9A: TSB.w $0320

#_07DC9D: RTS

;===================================================================================================

TileBehavior_GanonIce:
#_07DC9E: LDA.b $0A
#_07DCA0: TSB.w $0348

#_07DCA3: RTS

;===================================================================================================

TileBehavior_PalaceIce:
#_07DCA4: LDA.b $0A

#_07DCA6: ASL A
#_07DCA7: ASL A
#_07DCA8: ASL A
#_07DCA9: ASL A

#_07DCAA: TSB.w $0348

#_07DCAD: RTS

;===================================================================================================

TileBehavior_LightableTorch:
#_07DCAE: LDA.b $0A
#_07DCB0: TSB.b $0E
#_07DCB2: TSB.w $02F6

#_07DCB5: RTS

;===================================================================================================

TileBehavior_DeepWater:
#_07DCB6: LDA.b $0A
#_07DCB8: TSB.w $0341

#_07DCBB: RTS

;===================================================================================================

TileBehavior_ShortWaterLadder:
#_07DCBC: LDA.b $0A
#_07DCBE: TSB.w $0343

#_07DCC1: RTS

;===================================================================================================

TileBehavior_OverlayMask_1C:
#_07DCC2: LDA.b $0A
#_07DCC4: TSB.w $034C

#_07DCC7: RTS

;===================================================================================================

TileBehavior_LayerToggleShutterDoor:
#_07DCC8: LDA.b $EF
#_07DCCA: AND.w #$FF00
#_07DCCD: ORA.w #$0001
#_07DCD0: STA.b $EF

#_07DCD2: BRA TileBehavior_ShutterDoor

;===================================================================================================

TileBehavior_LayerAndDungeonToggleShutterDoor:
#_07DCD4: LDA.b $EF
#_07DCD6: AND.w #$FF00
#_07DCD9: ORA.w #$0003
#_07DCDC: STA.b $EF

#_07DCDE: BRA TileBehavior_ShutterDoor

;===================================================================================================

TileBehavior_DungeonToggleShutterDoor:
#_07DCE0: LDA.b $EF
#_07DCE2: AND.w #$FF00
#_07DCE5: ORA.w #$0002
#_07DCE8: STA.b $EF

;===================================================================================================

TileBehavior_ShutterDoor:
#_07DCEA: LDA.b $0A
#_07DCEC: ASL A
#_07DCED: ASL A
#_07DCEE: ASL A
#_07DCEF: ASL A
#_07DCF0: TSB.b $0E

#_07DCF2: LDA.b $0A
#_07DCF4: XBA
#_07DCF5: TSB.b $0E

#_07DCF7: LDA.b $06
#_07DCF9: AND.w #$0001
#_07DCFC: ASL A
#_07DCFD: STA.b $62

#_07DCFF: RTS

;===================================================================================================

TileBehavior_DungeonToggleManualDoor:
#_07DD00: LDA.b $EF
#_07DD02: AND.w #$FF00
#_07DD05: ORA.w #$0002
#_07DD08: STA.b $EF

;===================================================================================================

TileBehavior_Door:
#_07DD0A: LDA.b $0A
#_07DD0C: ASL A
#_07DD0D: ASL A
#_07DD0E: ASL A
#_07DD0F: ASL A
#_07DD10: TSB.b $0E

#_07DD12: LDA.b $06
#_07DD14: AND.w #$0001
#_07DD17: ASL A
#_07DD18: STA.b $62

#_07DD1A: RTS

;===================================================================================================

TileBehavior_ShallowWater:
#_07DD1B: LDA.b $0A
#_07DD1D: TSB.w $0359

#_07DD20: RTS

;===================================================================================================

pool TileBehavior_ManipulablyReplaced

.bitmask
#_07DD21: dw $0001 ; 0000000000000001
#_07DD23: dw $0002 ; 0000000000000010
#_07DD25: dw $0004 ; 0000000000000100
#_07DD27: dw $0008 ; 0000000000001000
#_07DD29: dw $0010 ; 0000000000010000
#_07DD2B: dw $0020 ; 0000000000100000
#_07DD2D: dw $0040 ; 0000000001000000
#_07DD2F: dw $0080 ; 0000000010000000
#_07DD31: dw $0100 ; 0000000100000000
#_07DD33: dw $0200 ; 0000001000000000
#_07DD35: dw $0400 ; 0000010000000000
#_07DD37: dw $0800 ; 0000100000000000
#_07DD39: dw $1000 ; 0001000000000000
#_07DD3B: dw $2000 ; 0010000000000000
#_07DD3D: dw $4000 ; 0100000000000000
#_07DD3F: dw $8000 ; 1000000000000000

pool off

;---------------------------------------------------------------------------------------------------

TileBehavior_ManipulablyReplaced:
#_07DD41: LDA.b $0A
#_07DD43: AND.w #$0002
#_07DD46: BEQ .no_bitmask

#_07DD48: LDA.b $06
#_07DD4A: AND.w #$000F
#_07DD4D: ASL A
#_07DD4E: TAY

#_07DD4F: LDA.w .bitmask,Y
#_07DD52: TSB.b $5F

.no_bitmask
#_07DD54: LDA.b $0A
#_07DD56: TSB.b $0E

#_07DD58: JSR TileBehavior_FlagManipulable

#_07DD5B: RTS

;===================================================================================================

TileBehavior_UnusedDeepWater:
#_07DD5C: LDA.b $06
#_07DD5E: STA.b $76

#_07DD60: LDA.b $0A
#_07DD62: ASL A
#_07DD63: ASL A
#_07DD64: ASL A
#_07DD65: ASL A
#_07DD66: TSB.w $0341

#_07DD69: RTS

;===================================================================================================

TileBehavior_Chest:
#_07DD6A: JSR TileBehavior_FlagManipulable

#_07DD6D: LDA.b $06
#_07DD6F: STA.b $76

#_07DD71: SEC
#_07DD72: SBC.w #$0058
#_07DD75: ASL A
#_07DD76: TAX

#_07DD77: LDA.w $06E0,X
#_07DD7A: CMP.w #$8000
#_07DD7D: BCC TileBehavior_FinishChest

#_07DD7F: LDA.b $0A
#_07DD81: TSB.b $0E
#_07DD83: ASL A
#_07DD84: ASL A
#_07DD85: ASL A
#_07DD86: ASL A
#_07DD87: TSB.w $02E7
#_07DD8A: AND.w #$0020
#_07DD8D: BEQ .exit

#_07DD8F: LDA.b $06
#_07DD91: STA.w $02EA

.exit
#_07DD94: RTS

;---------------------------------------------------------------------------------------------------

TileBehavior_FinishChest:
#_07DD95: LDA.b $0A
#_07DD97: TSB.w $02E5
#_07DD9A: TSB.b $0E

#_07DD9C: RTS

;===================================================================================================

TileBehavior_SouthSingleLayerStairs:
#_07DD9D: LDA.b $06
#_07DD9F: BRA TileBehavior_SouthAutoStairs

;===================================================================================================

TileBehavior_SouthSwapLayerStairs:
#_07DDA1: LDA.b $06

;---------------------------------------------------------------------------------------------------

TileBehavior_SouthAutoStairs:
#_07DDA3: STA.b $76

#_07DDA5: LDA.b $0A
#_07DDA7: TSB.b $58

#_07DDA9: ASL A
#_07DDAA: ASL A
#_07DDAB: ASL A
#_07DDAC: ASL A
#_07DDAD: TSB.w $02C0

#_07DDB0: RTS

;===================================================================================================

TileBehavior_Spike:
#_07DDB1: LDA.w $0FFC
#_07DDB4: BNE .no_damage

#_07DDB6: LDA.w $0403
#_07DDB9: AND.w #$0080
#_07DDBC: BEQ .damage

.no_damage
#_07DDBE: LDA.b $0A
#_07DDC0: TSB.b $0E

#_07DDC2: RTS

;---------------------------------------------------------------------------------------------------

.damage
#_07DDC3: LDA.b $0A
#_07DDC5: XBA
#_07DDC6: TSB.w $02E7

#_07DDC9: RTS

;===================================================================================================

TileBehavior_SpikeFloor:
#_07DDCA: LDA.w $0FFC
#_07DDCD: BNE .no_damage

#_07DDCF: LDA.w $0403
#_07DDD2: AND.w #$0080
#_07DDD5: BNE .no_damage

#_07DDD7: LDA.b $0A
#_07DDD9: ASL A
#_07DDDA: ASL A
#_07DDDB: ASL A
#_07DDDC: ASL A
#_07DDDD: TSB.w $02EE

.no_damage
#_07DDE0: RTS

;===================================================================================================

TileBehavior_Hookshottables:
#_07DDE1: LDA.b $0A
#_07DDE3: TSB.b $0E

;===================================================================================================

TileBehavior_FlagManipulable:
#_07DDE5: LDA.b $0A
#_07DDE7: TSB.w $02F6

#_07DDEA: RTS

;===================================================================================================

TileBehavior_FlaggableDoor:
#_07DDEB: LDA.b $0A
#_07DDED: TSB.b $0E

#_07DDEF: ASL A
#_07DDF0: ASL A
#_07DDF1: ASL A
#_07DDF2: ASL A
#_07DDF3: TSB.w $02F6

#_07DDF6: RTS

;===================================================================================================

TileBehavior_RupeeTile:
#_07DDF7: LDX.b $BD

#_07DDF9: LDA.l $7F2040,X
#_07DDFD: AND.w #$00FF
#_07DE00: CMP.w #$0060 ; TILETYPE 60
#_07DE03: BNE .no_rupees

#_07DE05: LDA.b $0A
#_07DE07: XBA
#_07DE08: TSB.w $02F6

#_07DE0B: RTS

;---------------------------------------------------------------------------------------------------

.no_rupees
#_07DE0C: LDA.b $0A
#_07DE0E: XBA

#_07DE0F: ASL A
#_07DE10: ASL A
#_07DE11: ASL A
#_07DE12: ASL A
#_07DE13: TSB.w $02F6

#_07DE16: RTS

;===================================================================================================

TileBehavior_CrystalPeg_Up:
#_07DE17: LDA.b $0A
#_07DE19: TSB.b $0E
#_07DE1B: TSB.w $02F6

#_07DE1E: LDA.b $0A
#_07DE20: XBA

#_07DE21: ASL A
#_07DE22: ASL A
#_07DE23: ASL A
#_07DE24: ASL A

#_07DE25: TSB.w $02E7

#_07DE28: RTS

;===================================================================================================

TileBehavior_Conveyor_Upwards:
#_07DE29: LDA.b $0A

#_07DE2B: BRA TileBehavior_Conveyor

;===================================================================================================

TileBehavior_Conveyor_Downwards:
#_07DE2D: LDA.b $0A
#_07DE2F: ASL A
#_07DE30: ASL A
#_07DE31: ASL A
#_07DE32: ASL A

#_07DE33: BRA TileBehavior_Conveyor

;===================================================================================================

TileBehavior_Conveyor_Leftwards:
#_07DE35: LDA.b $0A
#_07DE37: XBA

#_07DE38: BRA TileBehavior_Conveyor

;===================================================================================================

TileBehavior_Conveyor_Rightwards:
#_07DE3A: LDA.b $0A
#_07DE3C: XBA

#_07DE3D: ASL A
#_07DE3E: ASL A
#_07DE3F: ASL A
#_07DE40: ASL A

;===================================================================================================

TileBehavior_Conveyor:
#_07DE41: TSB.w $03F1

#_07DE44: RTS

;===================================================================================================

TileBehavior_MinigameChest:
#_07DE45: JSR TileBehavior_FlagManipulable

#_07DE48: LDA.b $06
#_07DE4A: STA.b $76

#_07DE4C: BRL TileBehavior_FinishChest

;===================================================================================================

TileBehavior_Entrance:
#_07DE4F: JSR TileBehavior_Door

#_07DE52: LDA.b $0A
#_07DE54: XBA
#_07DE55: TSB.w $02EE

#_07DE58: STZ.b $62

#_07DE5A: RTS

;===================================================================================================

TileBehavior_NothingOW:
#_07DE5B: LDA.b $0A
#_07DE5D: TSB.w $0343

#_07DE60: RTS

;===================================================================================================

TileBehavior_ThickGrass:
#_07DE61: LDA.b $0A
#_07DE63: TSB.w $0357

#_07DE66: RTS

;===================================================================================================

TileBehavior_DiggableGround:
#_07DE67: LDA.b $0A
#_07DE69: TSB.w $035B
#_07DE6C: TSB.w $0343

#_07DE6F: RTS

;===================================================================================================

pool TileBehavior_Liftable

.id_matcher
#_07DE70: dw $0054 ; Hint tile/Sign
#_07DE72: dw $0052 ; Gray rock
#_07DE74: dw $0050 ; Green bush
#_07DE76: dw $0051 ; Dark bush
#_07DE78: dw $0053 ; Black rock
#_07DE7A: dw $0055 ; Big gray rock
#_07DE7C: dw $0056 ; Big black rock

pool off

;---------------------------------------------------------------------------------------------------

TileBehavior_Liftable:
#_07DE7E: LDX.w #$000C

.check_next
#_07DE81: LDA.b $06
#_07DE83: CMP.w .id_matcher,X
#_07DE86: BNE .not_match

;---------------------------------------------------------------------------------------------------

#_07DE88: CMP.w #$0050
#_07DE8B: BEQ .is_bush

#_07DE8D: CMP.w #$0051
#_07DE90: BNE .is_not_bush

.is_bush
#_07DE92: LDA.b $0A
#_07DE94: XBA

#_07DE95: ASL A
#_07DE96: ASL A
#_07DE97: ASL A
#_07DE98: ASL A
#_07DE99: TSB.w $02EE

.is_not_bush
#_07DE9C: LDA.b $0A
#_07DE9E: TSB.w $0366

#_07DEA1: STX.w $036A

#_07DEA4: JSR TileBehavior_Hookshottables

#_07DEA7: RTS

;---------------------------------------------------------------------------------------------------

.not_match
#_07DEA8: DEX
#_07DEA9: DEX
#_07DEAA: BPL .check_next

#_07DEAC: RTS

;===================================================================================================

TileBehavior_Ledge_South:
#_07DEAD: LDA.b $06
#_07DEAF: STA.b $76

#_07DEB1: LDA.b $0A
#_07DEB3: ASL A
#_07DEB4: ASL A
#_07DEB5: ASL A
#_07DEB6: ASL A
#_07DEB7: TSB.w $036D

#_07DEBA: RTS

;===================================================================================================

TileBehavior_Ledge_North:
#_07DEBB: LDA.b $06
#_07DEBD: STA.b $76

#_07DEBF: LDA.b $0A
#_07DEC1: TSB.w $036D

#_07DEC4: RTS

;===================================================================================================

TileBehavior_Ledge_EastWest:
#_07DEC5: LDA.b $06
#_07DEC7: STA.b $76

#_07DEC9: LDA.b $0A
#_07DECB: TSB.w $036E

#_07DECE: RTS

;===================================================================================================

TileBehavior_Ledge_NorthDiagonal:
#_07DECF: LDA.b $06
#_07DED1: STA.b $76

#_07DED3: LDA.b $0A
#_07DED5: ASL A
#_07DED6: ASL A
#_07DED7: ASL A
#_07DED8: ASL A
#_07DED9: TSB.w $036E

#_07DEDC: RTS

;===================================================================================================

TileBehavior_Ledge_SouthDiagonal:
#_07DEDD: LDA.b $06
#_07DEDF: STA.b $76

#_07DEE1: LDA.b $0A
#_07DEE3: TSB.w $036F

#_07DEE6: RTS

;===================================================================================================

TileBehavior_UnusedCornerType:
#_07DEE7: LDA.b $06
#_07DEE9: STA.b $76

#_07DEEB: LDA.b $0A
#_07DEED: TSB.w $0370

#_07DEF0: RTS

;===================================================================================================

TileBehavior_EasternRuinsCorner:
#_07DEF1: LDA.b $06
#_07DEF3: STA.b $76

#_07DEF5: LDA.b $0A
#_07DEF7: ASL A
#_07DEF8: ASL A
#_07DEF9: ASL A
#_07DEFA: ASL A
#_07DEFB: TSB.w $0370

#_07DEFE: RTS

;===================================================================================================

TileBehavior_Warp:
#_07DEFF: LDA.b $0A
#_07DF01: ASL A
#_07DF02: ASL A
#_07DF03: ASL A
#_07DF04: ASL A
#_07DF05: TSB.w $0357

#_07DF08: RTS

;===================================================================================================

TileBehavior_GraveStone:
#_07DF09: LDA.b $0A
#_07DF0B: TSB.w $02E7
#_07DF0E: TSB.b $0E

#_07DF10: RTS

;===================================================================================================

TileBehavior_HylianPlaque:
#_07DF11: LDA.b $0A
#_07DF13: TSB.w $02EE
#_07DF16: TSB.b $0E

#_07DF18: RTS

;===================================================================================================

TileBehavior_BonkRocks:
#_07DF19: LDA.b $0A
#_07DF1B: TSB.b $0E

#_07DF1D: XBA
#_07DF1E: ASL A
#_07DF1F: ASL A
#_07DF20: ASL A
#_07DF21: ASL A
#_07DF22: TSB.w $02EE

#_07DF25: RTS

;===================================================================================================

pool PushBlock_GetGeneralizedTileInteractionOfTarget

.generic_type
#_07DF26: db $00, $01, $02, $03, $02, $00, $00, $00
#_07DF2E: db $00, $01, $00, $01, $00, $00, $00, $00
#_07DF36: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DF3E: db $01, $01, $01, $01, $00, $01, $01, $01
#_07DF46: db $00, $01, $01, $00, $00, $00, $01, $01
#_07DF4E: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DF56: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DF5E: db $01, $01, $00, $00, $01, $01, $01, $01
#_07DF66: db $00, $01, $01, $01, $01, $01, $01, $01
#_07DF6E: db $00, $01, $00, $01, $01, $01, $01, $01
#_07DF76: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DF7E: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DF86: db $00, $00, $00, $01, $00, $01, $01, $01
#_07DF8E: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DF96: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DF9E: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DFA6: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DFAE: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DFB6: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DFBE: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DFC6: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DFCE: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DFD6: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DFDE: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DFE6: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DFEE: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DFF6: db $01, $01, $01, $01, $01, $01, $01, $01
#_07DFFE: db $01, $01, $01, $01, $01, $01, $01, $01
#_07E006: db $01, $01, $01, $01, $01, $01, $01, $01
#_07E00E: db $01, $01, $01, $01, $01, $01, $01, $01
#_07E016: db $01, $01, $01, $01, $01, $01, $01, $01
#_07E01E: db $01, $01, $01, $01, $01, $01, $01, $01

pool off

;---------------------------------------------------------------------------------------------------

PushBlock_GetGeneralizedTileInteractionOfTarget:
#_07E026: LDA.b $00
#_07E028: AND.w #$FFF8

#_07E02B: ASL A
#_07E02C: ASL A
#_07E02D: ASL A

#_07E02E: STA.b $06

#_07E030: LDA.b $02
#_07E032: AND.w #$003F
#_07E035: CLC
#_07E036: ADC.b $06

#_07E038: LDX.b $EE
#_07E03A: BEQ .upper_layer

#_07E03C: CLC
#_07E03D: ADC.w #$1000

;---------------------------------------------------------------------------------------------------

.upper_layer
#_07E040: REP #$10

#_07E042: TAX

#_07E043: LDA.l $7F2000,X
#_07E047: AND.w #$00FF
#_07E04A: TAX

#_07E04B: LDA.w .generic_type,X
#_07E04E: AND.w #$00FF

#_07E051: RTS

;===================================================================================================

DifferenceFor6BLowNibble:
#_07E052: db $00, $01, $02, $03, $04, $05, $06, $07 ; ◥
#_07E05A: db $07, $06, $05, $04, $03, $02, $01, $00 ; ◤
#_07E062: db $07, $06, $05, $04, $03, $02, $01, $00 ; ◢
#_07E06A: db $00, $01, $02, $03, $04, $05, $06, $07 ; ◣

FlagFor6BLowNibble:
#_07E072: db $08 ; ◥
#_07E073: db $04 ; ◤
#_07E074: db $02 ; ◢
#_07E075: db $01 ; ◣

;===================================================================================================

FlagMovingIntoSlopes_Vertical:
#_07E076: LDA.b $51
#_07E078: AND.b #$07
#_07E07A: STA.b $00

#_07E07C: LDY.b $22

#_07E07E: LDA.b $0C
#_07E080: AND.b #$04
#_07E082: BEQ .no_detection_on_north_east

#_07E084: DEY

.no_detection_on_north_east
#_07E085: LDA.b $6E
#_07E087: ASL A
#_07E088: ASL A
#_07E089: STA.b $01

#_07E08B: TYA
#_07E08C: AND.b #$07
#_07E08E: CLC
#_07E08F: ADC.b $01
#_07E091: TAX

#_07E092: LDA.b $38
#_07E094: AND.b #$05
#_07E096: BEQ .no_detection_on_east

#_07E098: LDA.b $51
#_07E09A: AND.b #$07
#_07E09C: STA.b $02

#_07E09E: LDA.b $6E
#_07E0A0: AND.b #$02
#_07E0A2: BNE .detection_on_south_west

#_07E0A4: LDA.b #$08
#_07E0A6: SEC
#_07E0A7: SBC.b $02

#_07E0A9: BRA .continue

.detection_on_south_west
#_07E0AB: LDA.b $02
#_07E0AD: CLC
#_07E0AE: ADC.b #$08

.continue
#_07E0B0: STA.b $02

#_07E0B2: LDA.w DifferenceFor6BLowNibble,X
#_07E0B5: SEC
#_07E0B6: SBC.b $02

#_07E0B8: LDY.b $30
#_07E0BA: BEQ .exit
#_07E0BC: BPL .positive_y_velocity_a

#_07E0BE: EOR.b #$FF
#_07E0C0: INC A

.positive_y_velocity_a
#_07E0C1: STA.b $00

#_07E0C3: BRA .continue_from_negative_a

;---------------------------------------------------------------------------------------------------

.no_detection_on_east
#_07E0C5: LDA.w DifferenceFor6BLowNibble,X
#_07E0C8: SEC
#_07E0C9: SBC.b $00
#_07E0CB: STA.b $00

.continue_from_negative_a
#_07E0CD: LDA.b $30
#_07E0CF: BEQ .exit
#_07E0D1: BPL .positive_y_velocity_b

#_07E0D3: LDA.b $00
#_07E0D5: BEQ .exit
#_07E0D7: BMI .exit

#_07E0D9: REP #$20

#_07E0DB: AND.w #$00FF
#_07E0DE: CLC
#_07E0DF: ADC.b $20
#_07E0E1: STA.b $20

#_07E0E3: SEP #$20

#_07E0E5: LDA.b #$08

#_07E0E7: BRA .continue_from_negative_b

;---------------------------------------------------------------------------------------------------

.positive_y_velocity_b
#_07E0E9: LDA.b $00
#_07E0EB: BPL .exit

#_07E0ED: REP #$20

#_07E0EF: AND.w #$00FF
#_07E0F2: ORA.w #$FF00
#_07E0F5: CLC
#_07E0F6: ADC.b $20
#_07E0F8: STA.b $20

#_07E0FA: SEP #$20

#_07E0FC: LDA.b #$04

.continue_from_negative_b
#_07E0FE: STA.b $6B

#_07E100: LDY.b #$02

#_07E102: LDA.b $0C
#_07E104: AND.b #$04
#_07E106: BNE .detection_on_north_east

#_07E108: LDY.b #$03

.detection_on_north_east
#_07E10A: LDA.w FlagFor6BLowNibble,Y
#_07E10D: ORA.b #$10
#_07E10F: TSB.b $6B

.exit
#_07E111: RTS

;===================================================================================================

FlagMovingIntoSlopes_Horizontal:
#_07E112: LDA.b $22

#_07E114: LDY.b $6E
#_07E116: CPY.b #$06
#_07E118: BNE .strictly_ne_sw

#_07E11A: DEC A

.strictly_ne_sw
#_07E11B: AND.b #$07
#_07E11D: STA.b $00

#_07E11F: LDX.b #$00

#_07E121: LDA.b $0C
#_07E123: AND.b #$04
#_07E125: BEQ .no_detection_on_north_east

#_07E127: LDX.b #$02

.no_detection_on_north_east
#_07E129: LDA.b $6E
#_07E12B: ASL A
#_07E12C: ASL A
#_07E12D: STA.b $01

#_07E12F: LDA.b $51,X
#_07E131: AND.b #$07
#_07E133: CLC
#_07E134: ADC.b $01
#_07E136: TAX

#_07E137: LDA.b $38
#_07E139: AND.b #$05
#_07E13B: BEQ .no_detection_on_east

#_07E13D: LDA.b $22
#_07E13F: AND.b #$07

#_07E141: LDY.b $6E
#_07E143: CPY.b #$04
#_07E145: BEQ .dont_adjust_index

#_07E147: CPY.b #$06
#_07E149: BEQ .dont_adjust_index

#_07E14B: XBA
#_07E14C: TXA
#_07E14D: EOR.b #$07
#_07E14F: TAX

#_07E150: XBA
#_07E151: EOR.b #$FF
#_07E153: INC A

#_07E154: BRA .continue

;---------------------------------------------------------------------------------------------------

.dont_adjust_index
#_07E156: SEC
#_07E157: SBC.b #$08
#_07E159: EOR.b #$FF
#_07E15B: INC A
#_07E15C: STA.b $02

#_07E15E: LDA.w DifferenceFor6BLowNibble,X
#_07E161: SEC
#_07E162: SBC.b $02

.continue
#_07E164: LDY.b $31
#_07E166: BEQ .exit
#_07E168: BPL .positive_x_velocity_a

#_07E16A: EOR.b #$FF
#_07E16C: INC A

.positive_x_velocity_a
#_07E16D: STA.b $00

#_07E16F: BRA .continue_from_negative_a

;---------------------------------------------------------------------------------------------------

.no_detection_on_east
#_07E171: LDA.w DifferenceFor6BLowNibble,X
#_07E174: SEC
#_07E175: SBC.b $00
#_07E177: STA.b $00

.continue_from_negative_a
#_07E179: LDA.b $31
#_07E17B: BEQ .exit
#_07E17D: BPL .positive_x_velocity_b

#_07E17F: LDA.b $00
#_07E181: BEQ .exit
#_07E183: BMI .exit

#_07E185: REP #$20

#_07E187: AND.w #$00FF
#_07E18A: CLC
#_07E18B: ADC.b $22
#_07E18D: STA.b $22

#_07E18F: SEP #$20

#_07E191: LDA.b #$02
#_07E193: BRA .continue_from_negative_b

;---------------------------------------------------------------------------------------------------

.positive_x_velocity_b
#_07E195: LDA.b $00
#_07E197: BPL .exit

#_07E199: REP #$20

#_07E19B: AND.w #$00FF
#_07E19E: ORA.w #$FF00
#_07E1A1: CLC
#_07E1A2: ADC.b $22
#_07E1A4: STA.b $22

#_07E1A6: SEP #$20

#_07E1A8: LDA.b #$01

.continue_from_negative_b
#_07E1AA: STA.b $6B

#_07E1AC: LDY.b #$00

#_07E1AE: LDA.b $6E
#_07E1B0: AND.b #$02
#_07E1B2: BNE .detection_on_north_east

#_07E1B4: LDY.b #$01

.detection_on_north_east
#_07E1B6: LDA.w FlagFor6BLowNibble,Y
#_07E1B9: ORA.b #$20
#_07E1BB: TSB.b $6B

.exit
#_07E1BD: RTS

;===================================================================================================

Link_HandleRecoiling:
#_07E1BE: STZ.b $67

#_07E1C0: LDY.b #$08

#_07E1C2: LDA.b $27
#_07E1C4: BEQ .no_vertical_recoil
#_07E1C6: BMI .negative_vertical_recoil

#_07E1C8: LDY.b #$04

.negative_vertical_recoil
#_07E1CA: JSR .handle_axis

;---------------------------------------------------------------------------------------------------

.no_vertical_recoil
#_07E1CD: LDY.b #$02

#_07E1CF: LDA.b $28
#_07E1D1: BEQ .no_horizontal_recoil
#_07E1D3: BMI .handle_axis

#_07E1D5: LDY.b #$01

.handle_axis
#_07E1D7: TYA
#_07E1D8: ORA.b $67
#_07E1DA: STA.b $67
#_07E1DC: STA.b $26

;---------------------------------------------------------------------------------------------------

.no_horizontal_recoil
#_07E1DE: LDA.b $6B
#_07E1E0: AND.b #$0C
#_07E1E2: BEQ .dont_invert

#_07E1E4: LDA.b $6B
#_07E1E6: AND.b #$03
#_07E1E8: BEQ .dont_invert

#_07E1EA: LDA.b $5D
#_07E1EC: CMP.b #$02 ; LINKSTATE 02
#_07E1EE: BNE .dont_invert

#_07E1F0: LDA.b $28
#_07E1F2: EOR.b #$FF
#_07E1F4: INC A
#_07E1F5: STA.b $28

#_07E1F7: LDA.b $27
#_07E1F9: EOR.b #$FF
#_07E1FB: INC A
#_07E1FC: STA.b $27

;---------------------------------------------------------------------------------------------------

.dont_invert
#_07E1FE: LDA.b $6C
#_07E200: CMP.b #$01
#_07E202: BNE .not_in_vertical_door

#_07E204: LDA.b $26
#_07E206: AND.b #$0C
#_07E208: STA.b $26

#_07E20A: LDA.b $67
#_07E20C: AND.b #$0C
#_07E20E: STA.b $67

#_07E210: STZ.b $28

;---------------------------------------------------------------------------------------------------

.not_in_vertical_door
#_07E212: LDA.b $6C
#_07E214: CMP.b #$02
#_07E216: BNE .exit

#_07E218: LDA.b $26
#_07E21A: AND.b #$03
#_07E21C: STA.b $26

#_07E21E: LDA.b $67
#_07E220: AND.b #$03
#_07E222: STA.b $67

#_07E224: STZ.b $27

.exit
#_07E226: RTS

;===================================================================================================

SubVelocityValues:
#_07E227: db $18 ; 0x00 - walking on ground
#_07E228: db $10 ; 0x01 - walking diagonally
#_07E229: db $0A ; 0x02 - walking on stairs
#_07E22A: db $18 ; 0x03 - walking on stairs diagonally, but it's impossible to reach
#_07E22B: db $10 ; 0x04 - soft slipping
#_07E22C: db $08 ; 0x05 - soft slipping diagonally
#_07E22D: db $08 ; 0x06 - entering underworld/hard slipping
#_07E22E: db $04 ; 0x07 - hard slipping diagonally
#_07E22F: db $0C ; 0x08 - pushing statue
#_07E230: db $10 ; 0x09 - pushing statue diagonally
#_07E231: db $09 ; 0x0A - intraroom stairs
#_07E232: db $19 ; 0x0B - 
#_07E233: db $14 ; 0x0C - walking with sword out/carrying/sloshing
#_07E234: db $0D ; 0x0D - walking with sword out/carrying/sloshing diagonally
#_07E235: db $10 ; 0x0E - sword out/carry sloshing
#_07E236: db $08 ; 0x0F - sword out/carry sloshing diagonally
#_07E237: db $40 ; 0x10 - dashing
#_07E238: db $2A ; 0x11 - dashing diagonally
#_07E239: db $10 ; 0x12 - pushing block
#_07E23A: db $08 ; 0x13 - pushing block diagonally
#_07E23B: db $04 ; 0x14 - pulling statue/walking to triforce
#_07E23C: db $02 ; 0x15 - pulling statue diagonally
#_07E23D: db $30 ; 0x16 - slosh dashing
#_07E23E: db $18 ; 0x17 - slosh dashing diagonally
#_07E23F: db $20 ; 0x18 - dashing on ice
#_07E240: db $15 ; 0x19 - dashing on ice diagonally
#_07E241: db $F0 ; 0x1A - 
#_07E242: db $00 ; 0x1B - 
#_07E243: db $F0 ; 0x1C - 
#_07E244: db $01 ; 0x1D - 

;===================================================================================================

Link_HandleVelocity:
#_07E245: PHB
#_07E246: PHK
#_07E247: PLB

#_07E248: LDA.b $11
#_07E24A: CMP.b #$02
#_07E24C: BNE .no_textbox

#_07E24E: LDA.b $10
#_07E250: CMP.b #$0E
#_07E252: BEQ .yes_textbox

.no_textbox
#_07E254: LDA.w $0B7B
#_07E257: BEQ .can_move

.yes_textbox
#_07E259: LDA.b $20
#_07E25B: STA.b $00
#_07E25D: STA.b $3E

#_07E25F: LDA.b $22
#_07E261: STA.b $01
#_07E263: STA.b $3F

#_07E265: LDA.b $21
#_07E267: STA.b $02
#_07E269: STA.b $40

#_07E26B: LDA.b $23
#_07E26D: STA.b $03
#_07E26F: STA.b $41

#_07E271: BRL Link_HandleVelocityAndSandDrag

;---------------------------------------------------------------------------------------------------

.can_move
#_07E274: LDA.b $5D
#_07E276: CMP.b #$04 ; LINKSTATE 04
#_07E278: BEQ .swimming_or_not_dashing

#_07E27A: LDA.w $034A
#_07E27D: BEQ .not_ice

#_07E27F: LDA.w $0372
#_07E282: BEQ .swimming_or_not_dashing

#_07E284: LDA.b #$18
#_07E286: STA.b $00

#_07E288: BRA .reset_recoils

;---------------------------------------------------------------------------------------------------

.swimming_or_not_dashing
#_07E28A: BRL HandleSwimStrokeAndSubpixels

.not_ice
#_07E28D: LDA.w $0372
#_07E290: BEQ .no_dash_stuff

#_07E292: STZ.b $57

#_07E294: LDA.w $02F1
#_07E297: CMP.b #$10
#_07E299: BCS .no_dash_stuff

#_07E29B: BRL Link_DashInPlace

;---------------------------------------------------------------------------------------------------

.no_dash_stuff
#_07E29E: LDA.w $0316
#_07E2A1: ORA.w $0317
#_07E2A4: CMP.b #$0F
#_07E2A6: BNE .continue_check_speed

#_07E2A8: BRL EXIT_07E402

;---------------------------------------------------------------------------------------------------

.continue_check_speed
#_07E2AB: LDA.b $5E
#_07E2AD: STA.b $00

#_07E2AF: LDA.w $0351
#_07E2B2: BEQ .reset_recoils

#_07E2B4: LDA.b $5E
#_07E2B6: CMP.b #$10
#_07E2B8: BNE .not_dash_speed

#_07E2BA: LDX.b #$16
#_07E2BC: BRA .save_final_speed

;---------------------------------------------------------------------------------------------------

.not_dash_speed
#_07E2BE: LDX.b #$0C

#_07E2C0: LDA.b $5E
#_07E2C2: CMP.b #$0C
#_07E2C4: BNE .save_final_speed

#_07E2C6: LDX.b #$0E

.save_final_speed
#_07E2C8: STX.b $00

;---------------------------------------------------------------------------------------------------

.reset_recoils
#_07E2CA: STZ.b $27
#_07E2CC: STZ.b $28
#_07E2CE: STZ.b $68
#_07E2D0: STZ.b $69

#_07E2D2: LDX.b #$00

#_07E2D4: LDA.b $67
#_07E2D6: TAY

#_07E2D7: AND.b #$0C
#_07E2D9: BEQ .add_nothing

#_07E2DB: TYA
#_07E2DC: AND.b #$03
#_07E2DE: BEQ .add_nothing

#_07E2E0: LDX.b #$01

.add_nothing
#_07E2E2: TXA
#_07E2E3: CLC
#_07E2E4: ADC.b $00
#_07E2E6: TAX

#_07E2E7: LDA.b $5B
#_07E2E9: BEQ .not_slipping

#_07E2EB: CMP.b #$03
#_07E2ED: BNE .load_subvel

#_07E2EF: LDA.b $57
#_07E2F1: CMP.b #$30
#_07E2F3: BCS .stair_drag_too_high

#_07E2F5: ADC.b #$08
#_07E2F7: STA.b $57

#_07E2F9: BRA .load_subvel

;---------------------------------------------------------------------------------------------------

.stair_drag_too_high
#_07E2FB: LDA.b #$20
#_07E2FD: STA.b $57

#_07E2FF: BRA .load_subvel

;---------------------------------------------------------------------------------------------------

.not_slipping
#_07E301: LDA.b $57
#_07E303: BEQ .load_subvel

#_07E305: LDX.b #$0A

#_07E307: LDA.b $11
#_07E309: CMP.b #$08
#_07E30B: BEQ .overworld

#_07E30D: CMP.b #$10
#_07E30F: BEQ .overworld

#_07E311: LDX.b #$02

.overworld
#_07E313: LDA.b $67
#_07E315: AND.b #$00
#_07E317: BEQ .never_fails

#_07E319: INX

.never_fails
#_07E31A: LDA.b $57
#_07E31C: CMP.b #$01
#_07E31E: BEQ .load_subvel

#_07E320: CMP.b #$10
#_07E322: BCS .reset_speed

#_07E324: ADC.b #$01
#_07E326: STA.b $57

#_07E328: LDA.b #$00
#_07E32A: BRA .zero_subvelocity

.reset_speed
#_07E32C: STZ.b $57
#_07E32E: STZ.b $5E

;---------------------------------------------------------------------------------------------------

.load_subvel
#_07E330: LDA.w SubVelocityValues,X

.zero_subvelocity
#_07E333: CLC
#_07E334: ADC.b $57
#_07E336: STA.b $0A
#_07E338: STA.b $0B

#_07E33A: LDA.b #$03
#_07E33C: STA.b $0C

#_07E33E: LDA.b #$02
#_07E340: STA.b $0D

;---------------------------------------------------------------------------------------------------

#_07E342: LDX.b #$01

.do_next_axis
#_07E344: LDA.b $67
#_07E346: AND.b $0C
#_07E348: BEQ .skip_because_zero

#_07E34A: AND.b $0D
#_07E34C: BEQ .dont_invert_it

#_07E34E: LDA.b $0A,X
#_07E350: EOR.b #$FF
#_07E352: INC A
#_07E353: STA.b $0A,X

.dont_invert_it
#_07E355: LDA.b $0A,X
#_07E357: STA.b $27,X

.skip_because_zero
#_07E359: ASL.b $0C
#_07E35B: ASL.b $0C
#_07E35D: ASL.b $0D
#_07E35F: ASL.b $0D

#_07E361: DEX
#_07E362: BPL .do_next_axis

;---------------------------------------------------------------------------------------------------

#_07E364: LDA.b #$FF
#_07E366: STA.b $29
#_07E368: STA.b $24
#_07E36A: STA.b $25

#_07E36C: STZ.b $2C

#_07E36E: BRA .cache_full_coords

;===================================================================================================

#LinkHop_FindArbitraryLandingSpot:
#_07E370: PHB
#_07E371: PHK
#_07E372: PLB

;---------------------------------------------------------------------------------------------------

.cache_full_coords
#_07E373: LDA.b $20
#_07E375: STA.b $00
#_07E377: STA.b $3E

#_07E379: LDA.b $22
#_07E37B: STA.b $01
#_07E37D: STA.b $3F

#_07E37F: LDA.b $21
#_07E381: STA.b $02
#_07E383: STA.b $40

#_07E385: LDA.b $23
#_07E387: STA.b $03
#_07E389: STA.b $41

#_07E38B: LDA.b $5D
#_07E38D: CMP.b #$0A ; LINKSTATE 0A
#_07E38F: BEQ .quaking

#_07E391: LDA.w $02F5
#_07E394: CMP.b #$02
#_07E396: BEQ Link_HandleVelocityAndSandDrag

.quaking
#_07E398: LDY.b #$02
#_07E39A: LDX.b #$04

#_07E39C: LDA.b $4D
#_07E39E: BNE .next_direction

#_07E3A0: LDY.b #$01
#_07E3A2: LDX.b #$02

;---------------------------------------------------------------------------------------------------

.next_direction
#_07E3A4: LDA.w $0027,Y

#_07E3A7: ASL A
#_07E3A8: ASL A
#_07E3A9: ASL A
#_07E3AA: ASL A

#_07E3AB: CLC
#_07E3AC: ADC.w $002A,Y
#_07E3AF: STA.w $002A,Y

#_07E3B2: PHY
#_07E3B3: PHP

#_07E3B4: LDA.w $0027,Y

#_07E3B7: LSR A
#_07E3B8: LSR A
#_07E3B9: LSR A
#_07E3BA: LSR A

#_07E3BB: CMP.b #$08

#_07E3BD: LDY.b #$00
#_07E3BF: BCC .positive_velocity

#_07E3C1: ORA.b #$F0
#_07E3C3: LDY.b #$FF

.positive_velocity
#_07E3C5: PLP
#_07E3C6: ADC.b $20,X
#_07E3C8: STA.b $20,X

#_07E3CA: TYA
#_07E3CB: ADC.b $21,X
#_07E3CD: STA.b $21,X

#_07E3CF: PLY
#_07E3D0: DEY

#_07E3D1: DEX
#_07E3D2: DEX
#_07E3D3: BPL .next_direction

;---------------------------------------------------------------------------------------------------

#_07E3D5: JSR Link_HandleMovingFloor
#_07E3D8: JSR Link_ApplyConveyor

#_07E3DB: BRA Link_HandleVelocityAndSandDrag

;===================================================================================================

Link_HandleVelocityAndSandDrag_long:
#_07E3DD: PHB
#_07E3DE: PHK
#_07E3DF: PLB

;===================================================================================================

Link_HandleVelocityAndSandDrag:
#_07E3E0: REP #$20

#_07E3E2: LDA.b $20
#_07E3E4: CLC
#_07E3E5: ADC.w $0B7E
#_07E3E8: STA.b $20

#_07E3EA: LDA.b $22
#_07E3EC: CLC
#_07E3ED: ADC.w $0B7C
#_07E3F0: STA.b $22

#_07E3F2: SEP #$20

#_07E3F4: LDA.b $20
#_07E3F6: SEC
#_07E3F7: SBC.b $00
#_07E3F9: STA.b $30

#_07E3FB: LDA.b $22
#_07E3FD: SEC
#_07E3FE: SBC.b $01
#_07E400: STA.b $31

;---------------------------------------------------------------------------------------------------

#EXIT_07E402:
#_07E402: SEP #$20

#_07E404: PLB

#_07E405: RTL

;===================================================================================================

SwimmingAccelAndThrustChange:
#_07E406: dw   8, -12,  -8, -16
#_07E40E: dw   4,  -6, -12,  -6
#_07E416: dw  10, -16, -12,  -6

SwimmingThrustDirectionMask:
#_07E41E: db $F3
#_07E41F: db $FF
#_07E420: db $FC
#_07E421: db $FF

SwimmingThrustDirectionBit:
#_07E422: dw $0008
#_07E424: dw $0004
#_07E426: dw $0002
#_07E428: dw $0001

;---------------------------------------------------------------------------------------------------

HandleSwimStrokeAndSubpixels:
#_07E42A: STZ.b $27
#_07E42C: STZ.b $28

#_07E42E: REP #$20

#_07E430: LDX.b #$02

.next_direction
#_07E432: STZ.b $08,X

#_07E434: DEC.w $0326,X
#_07E437: BPL .positive_momentum

#_07E439: LDA.w #$0001
#_07E43C: STA.w $032B,X

#_07E43F: STZ.w $0326,X

.positive_momentum
#_07E442: LDA.w $032B,X
#_07E445: ASL A
#_07E446: TAY

#_07E447: LDA.w $034A
#_07E44A: AND.w #$00FF
#_07E44D: BEQ .not_on_ice

#_07E44F: ASL A
#_07E450: ASL A
#_07E451: ASL A
#_07E452: STA.b $00

#_07E454: TYA
#_07E455: CLC
#_07E456: ADC.b $00
#_07E458: TAY

.not_on_ice
#_07E459: LDA.w SwimmingAccelAndThrustChange,Y
#_07E45C: CLC
#_07E45D: ADC.w $033C,X
#_07E460: BEQ .zero_thrust
#_07E462: BPL .positive_thrust

.zero_thrust
#_07E464: LDA.w SwimmingThrustDirectionMask,X
#_07E467: AND.b $67
#_07E469: STA.b $67
#_07E46B: STA.b $26

#_07E46D: LDA.w $032B,X
#_07E470: CMP.w #$0002
#_07E473: BNE .not_maxed

#_07E475: STZ.w $032B,X

#_07E478: LDA.w MaxSwimAcceleration
#_07E47B: STA.w $0334,X

#_07E47E: LDA.w #$0002

#_07E481: BRA .set_accel_and_thrust

;---------------------------------------------------------------------------------------------------

.not_maxed
#_07E483: LDA.w #$0000
#_07E486: STA.w $0334,X
#_07E489: STA.w $032B,X

#_07E48C: BRA .set_accel_and_thrust

;---------------------------------------------------------------------------------------------------

.positive_thrust
#_07E48E: PHA

#_07E48F: TXA
#_07E490: CLC
#_07E491: ADC.w $0338,X
#_07E494: ASL A
#_07E495: TAY

#_07E496: LDA.w SwimmingThrustDirectionBit,Y
#_07E499: ORA.b $67
#_07E49B: STA.b $67

#_07E49D: PLA
#_07E49E: CMP.w $0334,X
#_07E4A1: BCC .set_accel_and_thrust

#_07E4A3: LDA.w $0334,X

.set_accel_and_thrust
#_07E4A6: STA.w $033C,X
#_07E4A9: STA.b $08,X

#_07E4AB: LDA.b $6A
#_07E4AD: BEQ .not_pressing_diagonally

#_07E4AF: LDA.b $08,X
#_07E4B1: LSR A
#_07E4B2: LSR A
#_07E4B3: STA.b $00

#_07E4B5: LDA.b $08,X
#_07E4B7: SEC
#_07E4B8: SBC.b $00
#_07E4BA: STA.b $08,X

.not_pressing_diagonally
#_07E4BC: LDA.w $0338,X
#_07E4BF: AND.w #$00FF
#_07E4C2: BNE .positive_subpixel_adjuster

#_07E4C4: LDA.b $08,X
#_07E4C6: EOR.w #$FFFF
#_07E4C9: INC A
#_07E4CA: STA.b $08,X

.positive_subpixel_adjuster
#_07E4CC: DEX
#_07E4CD: DEX
#_07E4CE: BMI .continue

#_07E4D0: BRL .next_direction

;---------------------------------------------------------------------------------------------------

.continue
#_07E4D3: SEP #$20

#_07E4D5: LDA.b $20
#_07E4D7: STA.b $00
#_07E4D9: STA.b $3E

#_07E4DB: LDA.b $22
#_07E4DD: STA.b $01
#_07E4DF: STA.b $3F

#_07E4E1: LDA.b $21
#_07E4E3: STA.b $02
#_07E4E5: STA.b $40

#_07E4E7: LDA.b $23
#_07E4E9: STA.b $03
#_07E4EB: STA.b $41

;---------------------------------------------------------------------------------------------------

#_07E4ED: LDY.b #$01
#_07E4EF: LDX.b #$02

.next_subpixel
#_07E4F1: LDA.b $08,X
#_07E4F3: CLC
#_07E4F4: ADC.w $002A,Y
#_07E4F7: STA.w $002A,Y

#_07E4FA: PHY
#_07E4FB: PHP

#_07E4FC: LDA.b $09,X
#_07E4FE: CMP.b #$08

#_07E500: LDY.b #$00
#_07E502: BCC .positive_y_subpixeling

#_07E504: ORA.b #$F0
#_07E506: LDY.b #$FF

.positive_y_subpixeling
#_07E508: PLP
#_07E509: ADC.b $20,X
#_07E50B: STA.b $20,X

#_07E50D: TYA
#_07E50E: ADC.b $21,X
#_07E510: STA.b $21,X

#_07E512: PLY

#_07E513: LDA.b $08,X
#_07E515: LSR A
#_07E516: LSR A
#_07E517: LSR A
#_07E518: LSR A
#_07E519: STA.b $08,X

#_07E51B: LDA.b $09,X
#_07E51D: BPL .positive_x_subpixeling

#_07E51F: EOR.b #$FF
#_07E521: INC A

.positive_x_subpixeling
#_07E522: ASL A
#_07E523: ASL A
#_07E524: ASL A
#_07E525: ASL A
#_07E526: ORA.b $08,X
#_07E528: STA.w $0027,Y

#_07E52B: DEY

#_07E52C: DEX
#_07E52D: DEX
#_07E52E: BPL .next_subpixel

;---------------------------------------------------------------------------------------------------

#_07E530: LDA.w $046C
#_07E533: CMP.b #$04
#_07E535: BNE .no_moving_floor

#_07E537: JSR Link_ApplyMovingFloorVelocity

.no_moving_floor
#_07E53A: STZ.b $68
#_07E53C: STZ.b $69

#_07E53E: BRL Link_HandleVelocityAndSandDrag

;===================================================================================================

UNREACHABLE_07E541:
#_07E541: dw $0040, $0010

;===================================================================================================

Link_DashInPlace:
#_07E545: STZ.b $00
#_07E547: STZ.b $01

#_07E549: LDA.b $F0
#_07E54B: AND.b #$0F
#_07E54D: BEQ .not_pressing_dpad

#_07E54F: LDX.b #$80

#_07E551: LDA.w $0351
#_07E554: BEQ .not_sloshing

#_07E556: LDX.b #$50

.not_sloshing
#_07E558: STX.b $00

#_07E55A: LDA.b #$01
#_07E55C: STA.b $01

.not_pressing_dpad
#_07E55E: STZ.b $27
#_07E560: STZ.b $28

#_07E562: STZ.b $08
#_07E564: STZ.b $09

#_07E566: STZ.b $0A
#_07E568: STZ.b $0B

#_07E56A: LDX.b #$03

#_07E56C: LDA.b $67

.shift_more
#_07E56E: LSR A
#_07E56F: BCS .bit_found

#_07E571: DEX
#_07E572: BPL .shift_more

#_07E574: PLB

#_07E575: RTL

;---------------------------------------------------------------------------------------------------

.bit_found
#_07E576: TXY

#_07E577: REP #$20

#_07E579: LDA.b $00
#_07E57B: CPY.b #$00
#_07E57D: BEQ .pressing_up

#_07E57F: CPY.b #$02
#_07E581: BNE .not_pressing_left

.pressing_up
#_07E583: EOR.w #$FFFF
#_07E586: INC A

.not_pressing_left
#_07E587: PHA

#_07E588: TYA
#_07E589: AND.w #$0002
#_07E58C: TAX

#_07E58D: PLA
#_07E58E: STA.b $08,X

#_07E590: SEP #$20

#_07E592: BRL HandleSwimStrokeAndSubpixels_continue

;===================================================================================================

Link_HandleMovingFloor:
#_07E595: LDA.w $046C
#_07E598: BEQ EXIT_07E5E3

#_07E59A: LDA.b $24
#_07E59C: BEQ .grounded

#_07E59E: CMP.b #$FF
#_07E5A0: BNE EXIT_07E5E3

.grounded
#_07E5A2: LDA.w $0322
#_07E5A5: AND.b #$03
#_07E5A7: CMP.b #$03
#_07E5A9: BNE EXIT_07E5E3

#_07E5AB: LDA.b $5D
#_07E5AD: CMP.b #$13 ; LINKSTATE 13
#_07E5AF: BEQ EXIT_07E5E3

#_07E5B1: LDY.b #$08

#_07E5B3: LDA.w $0310
#_07E5B6: BEQ .no_floor_y_velocity
#_07E5B8: BMI .negative_floor_y_velocity

#_07E5BA: LDY.b #$04

.negative_floor_y_velocity
#_07E5BC: TYA
#_07E5BD: TSB.b $67

.no_floor_y_velocity
#_07E5BF: LDY.b #$02

#_07E5C1: LDA.w $0312
#_07E5C4: BEQ Link_ApplyMovingFloorVelocity
#_07E5C6: BMI .negative_floor_x_velocity

#_07E5C8: LDY.b #$01

.negative_floor_x_velocity
#_07E5CA: TYA
#_07E5CB: TSB.b $67

;===================================================================================================

Link_ApplyMovingFloorVelocity:
#_07E5CD: STZ.b $6A

#_07E5CF: REP #$20

#_07E5D1: LDA.b $20
#_07E5D3: CLC
#_07E5D4: ADC.w $0310
#_07E5D7: STA.b $20

#_07E5D9: LDA.b $22
#_07E5DB: CLC
#_07E5DC: ADC.w $0312
#_07E5DF: STA.b $22

#_07E5E1: SEP #$20

;---------------------------------------------------------------------------------------------------

#EXIT_07E5E3:
#_07E5E3: RTS

;===================================================================================================

pool Link_ApplyConveyor

.direction
#_07E5E4: db $08 ; up
#_07E5E5: db $04 ; down
#_07E5E6: db $02 ; left
#_07E5E7: db $01 ; right

.speed_y
#_07E5E8: db  -8 ; up
#_07E5E9: db   8 ; down
#_07E5EA: db   0 ; left
#_07E5EB: db   0 ; right

.speed_x
#_07E5EC: db   0 ; up
#_07E5ED: db   0 ; down
#_07E5EE: db  -8 ; left
#_07E5EF: db   8 ; right

pool off

;---------------------------------------------------------------------------------------------------

Link_ApplyConveyor:
#_07E5F0: LDA.w $03F3
#_07E5F3: BEQ EXIT_07E5E3

#_07E5F5: LDA.b $24
#_07E5F7: BEQ .grounded

#_07E5F9: CMP.b #$FF
#_07E5FB: BNE EXIT_07E5E3

;---------------------------------------------------------------------------------------------------

.grounded
#_07E5FD: LDA.w $0376
#_07E600: AND.b #$01
#_07E602: BNE EXIT_07E5E3

#_07E604: LDA.b $5D
#_07E606: CMP.b #$13 ; LINKSTATE 13
#_07E608: BEQ EXIT_07E5E3

#_07E60A: LDA.b $4D
#_07E60C: BNE EXIT_07E5E3

#_07E60E: LDA.w $0372
#_07E611: BEQ .run_conveyor

#_07E613: LDA.w $02F1
#_07E616: CMP.b #$20
#_07E618: BNE .run_conveyor

#_07E61A: LDY.w $03F3
#_07E61D: DEY
#_07E61E: LDA.w .direction,Y

#_07E621: AND.b $67
#_07E623: BNE EXIT_07E5E3

;---------------------------------------------------------------------------------------------------

.run_conveyor
#_07E625: STZ.b $6A

#_07E627: LDY.w $03F3
#_07E62A: DEY

#_07E62B: LDA.w .direction,Y
#_07E62E: TSB.b $67

#_07E630: LDA.w .speed_y,Y
#_07E633: STA.b $72

#_07E635: LDA.w .speed_x,Y
#_07E638: STA.b $73

;---------------------------------------------------------------------------------------------------

#_07E63A: LDX.b #$01
#_07E63C: LDY.b #$02

.next_direction
#_07E63E: PHX

#_07E63F: LDA.b $72,X
#_07E641: ASL A
#_07E642: ASL A
#_07E643: ASL A
#_07E644: ASL A
#_07E645: CLC
#_07E646: ADC.w $041C,X
#_07E649: STA.w $041C,X

#_07E64C: LDA.b $72,X
#_07E64E: PHP

#_07E64F: LDX.b #$00

#_07E651: LSR A
#_07E652: LSR A
#_07E653: LSR A
#_07E654: LSR A

#_07E655: PLP
#_07E656: BPL .positive_speed

#_07E658: ORA.b #$F0
#_07E65A: DEX

.positive_speed
#_07E65B: ADC.w $0020,Y
#_07E65E: STA.w $0020,Y

#_07E661: TXA
#_07E662: ADC.w $0021,Y
#_07E665: STA.w $0021,Y

#_07E668: PLX

#_07E669: DEY
#_07E66A: DEY

#_07E66B: DEX
#_07E66C: BPL .next_direction

#_07E66E: SEP #$20

#_07E670: RTS

;===================================================================================================

LinkDiagonalDominantDirection:
#_07E671: db $08, $04, $02, $01

;===================================================================================================

LinkWalkAnimationTimer_other:
#_07E675: db $04 ; bunny/carry walk up
#_07E676: db $04 ; bunny/carry walk down
#_07E677: db $04 ; bunny/carry walk left
#_07E678: db $04 ; bunny/carry walk right
#_07E679: db $01 ; slipping with sword/carry up
#_07E67A: db $01 ; slipping with sword/carry down
#_07E67B: db $01 ; slipping with sword/carry left
#_07E67C: db $01 ; slipping with sword/carry right
#_07E67D: db $02
#_07E67E: db $02
#_07E67F: db $02
#_07E680: db $02
#_07E681: db $08 ; straight stair doors/pushing
#_07E682: db $08
#_07E683: db $08
#_07E684: db $08

;===================================================================================================

LinkWalkAnimationTimer:
#_07E685: db $01, $02, $03, $02, $02, $02, $03, $02 ; walk
#_07E68D: db $01 ; used both by walk and on ice, but not for entering underworld
#_07E68E: db $01, $02, $01, $01, $01, $02, $01, $02 ; entering underworld/ice
#_07E696: db $02, $03, $02, $02, $02, $03, $02      ; ice+underworld entrance - impossible?

;===================================================================================================

Link_HandleMovingAnimation_SetFacingDown:
#_07E69D: PHB
#_07E69E: PHK
#_07E69F: PLB

#_07E6A0: LDA.b #$04
#_07E6A2: STA.b $26

#_07E6A4: BRA Link_HandleMovingAnimation_MainEntry

;===================================================================================================

Link_HandleMovingAnimation_FullLongEntry:
#_07E6A6: PHB
#_07E6A7: PHK
#_07E6A8: PLB

;===================================================================================================

Link_HandleMovingAnimation_MainEntry:
#_07E6A9: LDA.b $5D
#_07E6AB: CMP.b #$04 ; LINKSTATE 04
#_07E6AD: BNE .not_swimming

#_07E6AF: BRL Link_HandleMovingAnimationSwimming

;---------------------------------------------------------------------------------------------------

.not_swimming
#_07E6B2: LDA.b $26
#_07E6B4: BNE .not_moving

#_07E6B6: BRL .exit

;---------------------------------------------------------------------------------------------------

.not_moving
#_07E6B9: STA.b $00

#_07E6BB: LDA.w $034A
#_07E6BE: BEQ .not_on_ice_a

#_07E6C0: LDA.w $0340
#_07E6C3: STA.b $00

.not_on_ice_a
#_07E6C5: LDA.b $50
#_07E6C7: BNE .check_dashing

#_07E6C9: LDA.b $6A
#_07E6CB: BEQ .no_diagonal

#_07E6CD: LDA.b $6C
#_07E6CF: BEQ .not_in_door

#_07E6D1: ASL A
#_07E6D2: AND.b #$FC
#_07E6D4: TAY

#_07E6D5: BRA .door_or_not_pressing_vertical

;---------------------------------------------------------------------------------------------------

.not_in_door
#_07E6D7: LDA.b $2F
#_07E6D9: LSR A
#_07E6DA: TAX

#_07E6DB: LDA.b $00
#_07E6DD: AND.w LinkDiagonalDominantDirection,X
#_07E6E0: BNE .check_dashing

.no_diagonal
#_07E6E2: LDY.b #$04

#_07E6E4: LDA.b $00
#_07E6E6: AND.b #$0C
#_07E6E8: BEQ .door_or_not_pressing_vertical

#_07E6EA: LDY.b #$00

.door_or_not_pressing_vertical
#_07E6EC: CPY.b #$04
#_07E6EE: BEQ .was_pressing_a_vertical

#_07E6F0: LDA.b $00
#_07E6F2: AND.b #$04
#_07E6F4: BNE .opposite_on_axis

#_07E6F6: BRA .set_direction

;---------------------------------------------------------------------------------------------------

.was_pressing_a_vertical
#_07E6F8: LDA.b $00
#_07E6FA: AND.b #$01
#_07E6FC: BEQ .set_direction

.opposite_on_axis
#_07E6FE: INY
#_07E6FF: INY

.set_direction
#_07E700: STY.b $2F

#_07E702: BRA .check_dashing

;===================================================================================================

#Link_HandleMovingAnimation_StartWithDash:
#_07E704: PHB
#_07E705: PHK
#_07E706: PLB

;---------------------------------------------------------------------------------------------------

.check_dashing
#_07E707: LDA.w $0372
#_07E70A: BEQ .not_dashing

#_07E70C: BRL Link_HandleMovingAnimation_Dash

;---------------------------------------------------------------------------------------------------

.not_dashing
#_07E70F: LDA.b $2F
#_07E711: LSR A
#_07E712: TAX

#_07E713: LDA.b $5E
#_07E715: CMP.b #$06
#_07E717: BNE .not_transitioning_to_uw_speed

#_07E719: TXA
#_07E71A: CLC
#_07E71B: ADC.b #$04
#_07E71D: TAX

#_07E71E: BRA .continue_b

;---------------------------------------------------------------------------------------------------

.not_transitioning_to_uw_speed
#_07E720: LDA.w $034A
#_07E723: BEQ .continue_b

#_07E725: LDA.b $F0
#_07E727: AND.b #$0F
#_07E729: BEQ .no_dpad_press

#_07E72B: TXA
#_07E72C: CLC
#_07E72D: ADC.b #$04
#_07E72F: TAX

.continue_b
#_07E730: LDA.b $5D
#_07E732: CMP.b #$17 ; LINKSTATE 17
#_07E734: BNE .not_bunny

#_07E736: BRL Link_HandleMovingAnimation_Bunny

;---------------------------------------------------------------------------------------------------

.not_bunny
#_07E739: LDA.b $11

#_07E73B: CMP.b #$0E
#_07E73D: BEQ Link_HandleMovingAnimation_General

#_07E73F: CMP.b #$12
#_07E741: BEQ .straight_interroom_stairs_door

#_07E743: CMP.b #$13
#_07E745: BNE .not_interroom_stairs_door

.straight_interroom_stairs_door
#_07E747: LDX.b #$0C

#_07E749: BRA Link_HandleMovingAnimation_General

;---------------------------------------------------------------------------------------------------

.not_interroom_stairs_door
#_07E74B: LDA.w $0308
#_07E74E: AND.b #$80
#_07E750: BNE Link_HandleMovingAnimation_General

#_07E752: LDA.b $48
#_07E754: AND.b #$8D
#_07E756: BEQ .not_grabbing

#_07E758: LDX.b #$0C
#_07E75A: BRA Link_HandleMovingAnimation_General

;---------------------------------------------------------------------------------------------------

.not_grabbing
#_07E75C: LDA.w $0351
#_07E75F: BNE Link_HandleMovingAnimation_General

#_07E761: LDA.b $3C
#_07E763: BEQ Link_HandleMovingAnimation_SwordPrimed

;===================================================================================================

#Link_HandleMovingAnimation_General:
#_07E765: LDA.b $2E
#_07E767: CMP.b #$06
#_07E769: BCS .no_dpad_press

#_07E76B: LDA.w $02F5
#_07E76E: CMP.b #$02
#_07E770: BEQ .no_dpad_press

#_07E772: LDA.w LinkWalkAnimationTimer_other,X
#_07E775: STA.b $00

#_07E777: LDA.b $2D
#_07E779: CLC
#_07E77A: ADC.b #$01
#_07E77C: STA.b $2D

#_07E77E: CMP.b $00
#_07E780: BCC .exit

#_07E782: STZ.b $2D

#_07E784: LDA.b $2E
#_07E786: INC A
#_07E787: CMP.b #$06
#_07E789: BNE .set_anim_step

.no_dpad_press
#_07E78B: LDA.b #$00

.set_anim_step
#_07E78D: STA.b $2E

.exit
#_07E78F: PLB

#_07E790: RTL

;===================================================================================================

Link_HandleMovingAnimation_SwordPrimed:
#_07E791: LDX.b $2E

#_07E793: LDA.b $5E
#_07E795: CMP.b #$06
#_07E797: BNE .not_walking_into_dungeon

#_07E799: TXA
#_07E79A: CLC
#_07E79B: ADC.b #$08
#_07E79D: TAX

.not_walking_into_dungeon
#_07E79E: LDA.w $034A
#_07E7A1: BEQ .not_on_ice

#_07E7A3: TXA
#_07E7A4: CLC
#_07E7A5: ADC.b #$08
#_07E7A7: TAX

.not_on_ice
#_07E7A8: LDA.w $02F5
#_07E7AB: CMP.b #$02
#_07E7AD: BEQ EXIT_07E7F8

#_07E7AF: LDA.w LinkWalkAnimationTimer,X
#_07E7B2: STA.b $00

#_07E7B4: LDA.b $2D
#_07E7B6: CLC
#_07E7B7: ADC.b #$01
#_07E7B9: STA.b $2D

#_07E7BB: CMP.b $00
#_07E7BD: BCC .exit

#_07E7BF: STZ.b $2D

#_07E7C1: LDA.b $2E
#_07E7C3: INC A
#_07E7C4: CMP.b #$09
#_07E7C6: BNE .dont_reset_step

#_07E7C8: LDA.b #$01

.dont_reset_step
#_07E7CA: STA.b $2E

.exit
#_07E7CC: PLB

#_07E7CD: RTL

;===================================================================================================

Link_HandleMovingAnimation_Bunny:
#_07E7CE: LDA.b $2E
#_07E7D0: CMP.b #$04
#_07E7D2: BCS .reset_step

#_07E7D4: LDA.w $02F5
#_07E7D7: CMP.b #$02
#_07E7D9: BEQ .reset_step

#_07E7DB: LDA.w LinkWalkAnimationTimer_other,X
#_07E7DE: STA.b $00

#_07E7E0: LDA.b $2D
#_07E7E2: CLC
#_07E7E3: ADC.b #$01
#_07E7E5: STA.b $2D

#_07E7E7: CMP.b $00
#_07E7E9: BCC EXIT_07E7F8

#_07E7EB: STZ.b $2D

#_07E7ED: LDA.b $2E
#_07E7EF: INC A
#_07E7F0: CMP.b #$04
#_07E7F2: BNE .dont_reset_step

.reset_step
#_07E7F4: LDA.b #$00

.dont_reset_step
#_07E7F6: STA.b $2E

;---------------------------------------------------------------------------------------------------

#EXIT_07E7F8:
#_07E7F8: PLB

#_07E7F9: RTL

;===================================================================================================

Link_HandleMovingAnimationSwimming:
#_07E7FA: LDA.w $0340
#_07E7FD: BEQ .exit

#_07E7FF: LDA.b $50
#_07E801: BNE .exit

#_07E803: LDA.b $6A
#_07E805: BEQ .not_moving

#_07E807: LDA.b $6C
#_07E809: BEQ .not_in_door

#_07E80B: ASL A
#_07E80C: AND.b #$FC
#_07E80E: TAY

#_07E80F: BRA .continue

;---------------------------------------------------------------------------------------------------

.not_in_door
#_07E811: LDA.b $2F
#_07E813: LSR A
#_07E814: TAX

#_07E815: LDA.w $0340
#_07E818: AND.w LinkDiagonalDominantDirection,X
#_07E81B: BNE .exit

.not_moving
#_07E81D: LDY.b #$04

#_07E81F: LDA.w $0340
#_07E822: AND.b #$0C
#_07E824: BEQ .continue

#_07E826: LDY.b #$00

.continue
#_07E828: CPY.b #$04
#_07E82A: BEQ .going_horizontally

#_07E82C: LDA.w $0340
#_07E82F: AND.b #$04
#_07E831: BNE .advance_direction

#_07E833: BRA .set_direction

.going_horizontally
#_07E835: LDA.w $0340
#_07E838: AND.b #$01
#_07E83A: BEQ .set_direction

.advance_direction
#_07E83C: INY
#_07E83D: INY

.set_direction
#_07E83E: STY.b $2F

.exit
#_07E840: PLB

#_07E841: RTL

;===================================================================================================

pool Link_HandleMovingAnimation_Dash

.timers_a_idk
#_07E842: db $03, $03, $05, $03, $03, $03, $05, $03
#_07E84A: db $02, $02, $04, $02, $02, $02, $04, $02
#_07E852: db $02, $02, $03, $02, $02, $02, $03, $02
#_07E85A: db $01, $01, $02, $01, $01, $01, $02, $01
#_07E862: db $01, $01, $01, $01, $01, $01, $01, $01
#_07E86A: db $00, $00, $01, $00, $00, $00, $01, $00
#_07E872: db $00, $00, $00, $00, $00, $00, $00, $00

.timers_charge
#_07E87A: db $01
#_07E87B: db $02, $02, $02, $02, $02 ; water?
#_07E880: db $02                     ; actual dashing

.thresholds
#_07E881: db $30                               ; unused? is this a default?
#_07E882: db $24, $18, $10, $0C, $08, $04
#_07E888: db $04, $06, $08, $0A, $0C, $0E, $10 ; unused?

pool off

;---------------------------------------------------------------------------------------------------

Link_HandleMovingAnimation_Dash:
#_07E88F: LDX.b #$06

#_07E891: LDA.w $0374
#_07E894: BEQ .use_value

.next_timer_value
#_07E896: LDA.w $0374
#_07E899: CMP.w .thresholds,X
#_07E89C: BCC .use_value

#_07E89E: DEX
#_07E89F: BPL .next_timer_value

#_07E8A1: INX

;---------------------------------------------------------------------------------------------------

.use_value
#_07E8A2: LDA.b $3C
#_07E8A4: CMP.b #$09
#_07E8A6: BCS .get_charge_timer

#_07E8A8: LDA.w $0351
#_07E8AB: BNE .get_charge_timer

#_07E8AD: TXA
#_07E8AE: ASL A
#_07E8AF: ASL A
#_07E8B0: ASL A
#_07E8B1: TAX

#_07E8B2: LDA.w .timers_a_idk,X
#_07E8B5: STA.b $00

#_07E8B7: LDA.b $2D
#_07E8B9: CLC
#_07E8BA: ADC.b #$01
#_07E8BC: STA.b $2D

#_07E8BE: CMP.b $00
#_07E8C0: BCC .proceed_to_exit

#_07E8C2: STZ.b $2D

#_07E8C4: LDA.b $2E
#_07E8C6: INC A
#_07E8C7: CMP.b #$09
#_07E8C9: BNE .dont_reset_step

#_07E8CB: LDA.b #$01

.dont_reset_step
#_07E8CD: BRA .set_anim_step

.proceed_to_exit
#_07E8CF: BRA .exit

;---------------------------------------------------------------------------------------------------

.get_charge_timer
#_07E8D1: LDA.w .timers_charge,X
#_07E8D4: STA.b $00

#_07E8D6: LDA.b $2D
#_07E8D8: CLC
#_07E8D9: ADC.b #$01
#_07E8DB: STA.b $2D

#_07E8DD: CMP.b $00
#_07E8DF: BCC .exit

#_07E8E1: STZ.b $2D

#_07E8E3: LDA.b $2E
#_07E8E5: INC A
#_07E8E6: CMP.b #$06
#_07E8E8: BCC .set_anim_step

#_07E8EA: LDA.b #$00

.set_anim_step
#_07E8EC: STA.b $2E

.exit
#_07E8EE: PLB

#_07E8EF: RTL

;===================================================================================================

HandleIndoorCameraAndDoors:
#_07E8F0: LDA.b $1B
#_07E8F2: BEQ .not_indoors

#_07E8F4: LDA.b $6C
#_07E8F6: BEQ .not_in_a_door

#_07E8F8: JML HandleDoorTransitions

.not_in_a_door
#_07E8FC: JSL ApplyLinksMovementToCamera

.not_indoors
#_07E900: RTS

;===================================================================================================

HandleDoorTransitions:
#_07E901: STZ.b $68
#_07E903: STZ.b $69

#_07E905: LDA.b $26
#_07E907: AND.b #$0C
#_07E909: BEQ .not_vertical

#_07E90B: LDX.b $6C
#_07E90D: CPX.b #$01
#_07E90F: BNE .not_vertical

#_07E911: AND.b #$04
#_07E913: BEQ .going_up

#_07E915: REP #$20

#_07E917: LDA.b $20
#_07E919: CLC
#_07E91A: ADC.w #$001C
#_07E91D: STA.b $00

#_07E91F: AND.w #$00FC
#_07E922: BNE .not_vertical

#_07E924: SEP #$20

#_07E926: LDA.b $01
#_07E928: SEC
#_07E929: SBC.b $40
#_07E92B: STA.b $68

#_07E92D: BRA .not_vertical

.going_up
#_07E92F: REP #$20

#_07E931: LDA.b $20
#_07E933: SEC
#_07E934: SBC.w #$0012
#_07E937: STA.b $00

#_07E939: SEP #$20

#_07E93B: LDA.b $01
#_07E93D: SEC
#_07E93E: SBC.b $40
#_07E940: STA.b $68

;---------------------------------------------------------------------------------------------------

.not_vertical
#_07E942: SEP #$20

#_07E944: LDA.b $26
#_07E946: AND.b #$03
#_07E948: BEQ .not_horizontal

#_07E94A: LDX.b $6C
#_07E94C: CPX.b #$02
#_07E94E: BNE .not_horizontal

#_07E950: AND.b #$01
#_07E952: BEQ .going_left

#_07E954: REP #$20

#_07E956: LDA.b $22
#_07E958: CLC
#_07E959: ADC.w #$0015
#_07E95C: STA.b $00

#_07E95E: AND.w #$00FC
#_07E961: BNE .not_horizontal

#_07E963: SEP #$20

#_07E965: LDA.b $01
#_07E967: SEC
#_07E968: SBC.b $41
#_07E96A: STA.b $69

#_07E96C: BRA .not_horizontal

.going_left
#_07E96E: REP #$20

#_07E970: LDA.b $22
#_07E972: SEC
#_07E973: SBC.w #$0008
#_07E976: STA.b $00

#_07E978: SEP #$20

#_07E97A: LDA.b $01
#_07E97C: SEC
#_07E97D: SBC.b $41
#_07E97F: STA.b $69

;---------------------------------------------------------------------------------------------------

.not_horizontal
#_07E981: SEP #$20

#_07E983: LDA.b $69
#_07E985: BEQ .transitioning_vertically
#_07E987: BMI .transitioning_west

#_07E989: STZ.w $030B
#_07E98C: STZ.w $0308
#_07E98F: STZ.w $0309
#_07E992: STZ.w $0376

#_07E995: JSL HandleEdgeTransitionMovementEast_RightBy8

#_07E999: RTS

;---------------------------------------------------------------------------------------------------

.transitioning_west
#_07E99A: STZ.w $030B
#_07E99D: STZ.w $0308
#_07E9A0: STZ.w $0309
#_07E9A3: STZ.w $0376

#_07E9A6: JSL HandleEdgeTransitionMovementWest_LeftBy8

#_07E9AA: RTS

;---------------------------------------------------------------------------------------------------

.transitioning_vertically
#_07E9AB: LDA.b $68
#_07E9AD: BEQ .exit
#_07E9AF: BPL .transitioning_south

#_07E9B1: STZ.w $030B
#_07E9B4: STZ.w $0308
#_07E9B7: STZ.w $0309
#_07E9BA: STZ.w $0376

#_07E9BD: JSL HandleEdgeTransitionMovementNorth

#_07E9C1: RTS

;---------------------------------------------------------------------------------------------------

.transitioning_south
#_07E9C2: STZ.w $030B
#_07E9C5: STZ.w $0308
#_07E9C8: STZ.w $0309
#_07E9CB: STZ.w $0376

#_07E9CE: JSL HandleEdgeTransitionMovementSouth_DownBy16

.exit
#_07E9D2: RTS

;===================================================================================================

ApplyLinksMovementToCamera:
#_07E9D3: PHB
#_07E9D4: PHK
#_07E9D5: PLB

#_07E9D6: LDA.b $21
#_07E9D8: SEC
#_07E9D9: SBC.b $40
#_07E9DB: STA.b $68

#_07E9DD: LDA.b $23
#_07E9DF: SEC
#_07E9E0: SBC.b $41
#_07E9E2: STA.b $69

#_07E9E4: LDA.b $69
#_07E9E6: BEQ .check_y_movement

#_07E9E8: BMI .moved_left

.moved_right
#_07E9EA: JSL AdjustQuadrantAndCamera_right

#_07E9EE: BRA .check_y_movement

.moved_left
#_07E9F0: JSL AdjustQuadrantAndCamera_left

;---------------------------------------------------------------------------------------------------

.check_y_movement
#_07E9F4: LDA.b $68
#_07E9F6: BEQ .done

#_07E9F8: BPL .moved_down

.moved_up
#_07E9FA: JSL AdjustQuadrantAndCamera_up

#_07E9FE: PLB

#_07E9FF: RTL

.moved_down
#_07EA00: JSL AdjustQuadrantAndCamera_down

.done
#_07EA04: PLB

#_07EA05: RTL

;===================================================================================================

DesertPrayer_InitializeIrisHDMA:
#_07EA06: JSL CleanUpAndPrepDesertPrayerHDMA

#_07EA0A: PHB
#_07EA0B: PHK
#_07EA0C: PLB

#_07EA0D: REP #$20

#_07EA0F: LDA.w #$0026
#_07EA12: STA.w $067C

#_07EA15: SEP #$20

#_07EA17: STZ.w $067E

#_07EA1A: JSL DesertPrayer_BuildIrisHDMATable

#_07EA1E: INC.b $B0

#_07EA20: PLB

#_07EA21: RTL

;===================================================================================================

DesertPrayerAnimationTimer:
#_07EA22: db $16, $16, $16, $40, $01

;---------------------------------------------------------------------------------------------------

DesertPrayer_BuildIrisHDMATable:
#_07EA27: PHB
#_07EA28: PHK
#_07EA29: PLB

#_07EA2A: REP #$30

#_07EA2C: STZ.b $04

#_07EA2E: LDA.b $20
#_07EA30: SEC
#_07EA31: SBC.b $E8
#_07EA33: CLC
#_07EA34: ADC.w #$000C
#_07EA37: STA.b $0E

#_07EA39: SEC
#_07EA3A: SBC.w $067C
#_07EA3D: STA.w $0674

#_07EA40: BPL .link_not_too_high

#_07EA42: STA.b $04

.link_not_too_high
#_07EA44: CLC
#_07EA45: ADC.w $067C

#_07EA48: CLC
#_07EA49: ADC.w $067C
#_07EA4C: STA.w $0676

#_07EA4F: LDA.b $22
#_07EA51: SEC
#_07EA52: SBC.b $E2

#_07EA54: CLC
#_07EA55: ADC.w #$0008
#_07EA58: STA.w $0670

#_07EA5B: LDA.w #$0001
#_07EA5E: STA.w $067A

;===================================================================================================

NextDesertHDMALine:
#_07EA61: LDA.w #$0100
#_07EA64: STA.b $00
#_07EA66: STA.b $02

#_07EA68: LDA.w $0674
#_07EA6B: BMI .link_too_high

#_07EA6D: LDA.b $04
#_07EA6F: CMP.w $0674
#_07EA72: BCC .add_empty_table_entry

#_07EA74: CMP.w $0676
#_07EA77: BCS .add_empty_table_entry

.link_too_high
#_07EA79: LDA.w $067C
#_07EA7C: CMP.w $067A
#_07EA7F: BCS .add_iris_table_entry

#_07EA81: LDA.w #$0001
#_07EA84: STA.w $067A

#_07EA87: STZ.w $0674

#_07EA8A: LDA.w $0676
#_07EA8D: STA.b $04

#_07EA8F: CMP.w #$00E1
#_07EA92: BCC .add_empty_table_entry

#_07EA94: BRL DesertHDMATableFinished

;---------------------------------------------------------------------------------------------------

.add_iris_table_entry
#_07EA97: JSR DesertHDMA_CalculateIrisShapeLine

#_07EA9A: LDA.b $06
#_07EA9C: BNE .dont_turn_into_blank_line

#_07EA9E: STZ.w $0674

#_07EAA1: BRA .calculate_index

.dont_turn_into_blank_line
#_07EAA3: LDA.b $08
#_07EAA5: CLC
#_07EAA6: ADC.w $0670
#_07EAA9: STA.b $02

#_07EAAB: LDA.w $0670
#_07EAAE: SEC
#_07EAAF: SBC.b $08
#_07EAB1: STA.b $00

.calculate_index
#_07EAB3: LDA.w $067A
#_07EAB6: AND.w #$00FF
#_07EAB9: STA.b $0A

#_07EABB: LDA.b $0E
#_07EABD: SEC
#_07EABE: SBC.b $0A
#_07EAC0: DEC A
#_07EAC1: ASL A
#_07EAC2: TAX

#_07EAC3: BRA .add_from_iris

;---------------------------------------------------------------------------------------------------

.add_empty_table_entry
#_07EAC5: LDA.b $04
#_07EAC7: DEC A
#_07EAC8: ASL A
#_07EAC9: TAX

.add_from_iris
#_07EACA: LDA.b $00
#_07EACC: TAY
#_07EACD: BMI .use_zero_a

#_07EACF: AND.w #$FF00
#_07EAD2: BEQ .not_zero_a

#_07EAD4: CMP.w #$0100
#_07EAD7: BNE .use_zero_a

#_07EAD9: LDY.w #$00FF
#_07EADC: BRA .not_zero_a

.use_zero_a
#_07EADE: LDY.w #$0000

.not_zero_a
#_07EAE1: TYA
#_07EAE2: AND.w #$00FF
#_07EAE5: STA.b $06

#_07EAE7: LDA.b $02
#_07EAE9: TAY

#_07EAEA: AND.w #$FF00
#_07EAED: BEQ .not_zero_b

#_07EAEF: AND.w #$FF00
#_07EAF2: BEQ .use_zero_b

#_07EAF4: LDY.w #$00FF
#_07EAF7: BRA .not_zero_b

.use_zero_b
#_07EAF9: LDY.w #$0000

.not_zero_b
#_07EAFC: TYA
#_07EAFD: AND.w #$00FF
#_07EB00: XBA
#_07EB01: ORA.b $06
#_07EB03: STA.b $06

#_07EB05: CPX.w #$01C0
#_07EB08: BCS .dont_add_line_a

#_07EB0A: CMP.w #$FFFF
#_07EB0D: BNE .add_as_is_a

#_07EB0F: LDA.w #$00FF

.add_as_is_a
#_07EB12: STA.w $1B00,X

.dont_add_line_a
#_07EB15: LDA.w $0674
#_07EB18: BMI .fine_to_try_to_draw

#_07EB1A: LDA.b $04
#_07EB1C: CMP.w $0674
#_07EB1F: BCC .to_next

#_07EB21: CMP.w $0676
#_07EB24: BCS .to_next

.fine_to_try_to_draw
#_07EB26: LDA.w $067A
#_07EB29: AND.w #$00FF
#_07EB2C: DEC A
#_07EB2D: CLC
#_07EB2E: ADC.b $0E
#_07EB30: TAX

#_07EB31: DEC A
#_07EB32: ASL A
#_07EB33: CMP.w #$01C0
#_07EB36: BCS .dont_add_line_b

#_07EB38: TAX

#_07EB39: LDA.b $06
#_07EB3B: CMP.w #$FFFF
#_07EB3E: BNE .add_as_is_b

#_07EB40: LDA.w #$00FF

.add_as_is_b
#_07EB43: STA.w $1B00,X

.dont_add_line_b
#_07EB46: INC.w $067A

;---------------------------------------------------------------------------------------------------

.to_next
#_07EB49: INC.b $04

#_07EB4B: LDA.b $04
#_07EB4D: BMI .more_to_go

#_07EB4F: CMP.w #$00E1
#_07EB52: BCS DesertHDMATableFinished

.more_to_go
#_07EB54: BRL NextDesertHDMALine

;===================================================================================================

DesertHDMATableFinished:
#_07EB57: SEP #$30

#_07EB59: LDA.b $B0
#_07EB5B: CMP.b #$04
#_07EB5D: BNE .exit

#_07EB5F: LDA.w $067E
#_07EB62: CMP.b #$01
#_07EB64: BEQ .dont_advance

#_07EB66: LDA.b $F4
#_07EB68: ORA.b $F6
#_07EB6A: AND.b #$C0
#_07EB6C: BEQ .dont_advance

#_07EB6E: LDA.b #$01
#_07EB70: STA.w $067E

#_07EB73: LSR.w $067C

.dont_advance
#_07EB76: LDA.w $067E
#_07EB79: BEQ .still_running_iris

#_07EB7B: LDA.w $067C
#_07EB7E: CLC
#_07EB7F: ADC.b #$08
#_07EB81: STA.w $067C

#_07EB84: CMP.b #$C0
#_07EB86: BCC .still_running_iris

#_07EB88: LDA.w $02F0
#_07EB8B: EOR.b #$01
#_07EB8D: STA.w $02F0

#_07EB90: LDA.b #$F3 ; SONG F3 - max volume
#_07EB92: STA.w $012C

#_07EB95: LDA.b #$00
#_07EB97: STA.w $012D

#_07EB9A: STZ.w $0FC1
#_07EB9D: STZ.w $030A

#_07EBA0: STZ.b $3A
#_07EBA2: STZ.w $0308

#_07EBA5: LDA.b $50
#_07EBA7: AND.b #$FE
#_07EBA9: STA.b $50

#_07EBAB: STZ.b $B0
#_07EBAD: STZ.b $11

#_07EBAF: LDA.w $010C
#_07EBB2: STA.b $10

#_07EBB4: STZ.b $1E
#_07EBB6: STZ.b $1F

#_07EBB8: STZ.b $96
#_07EBBA: STZ.b $97
#_07EBBC: STZ.b $98

#_07EBBE: JSL IrisSpotlight_ResetTable

#_07EBC2: BRA .exit

;---------------------------------------------------------------------------------------------------

.still_running_iris
#_07EBC4: DEC.b $3D
#_07EBC6: BPL .exit

#_07EBC8: LDX.w $030A
#_07EBCB: INX
#_07EBCC: CPX.b #$04
#_07EBCE: BEQ .on_final_step

#_07EBD0: STX.w $030A

.on_final_step
#_07EBD3: LDA.w DesertPrayerAnimationTimer,X
#_07EBD6: STA.b $3D

.exit
#_07EBD8: PLB

#_07EBD9: RTL

;===================================================================================================

pool DesertHDMA_CalculateIrisShapeLine

.multiplier_opening
#_07EBDA: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07EBE2: db $FF, $FF, $FF, $FF, $FE, $FE, $FE, $FE
#_07EBEA: db $FD, $FD, $FD, $FD, $FC, $FC, $FC, $FB
#_07EBF2: db $FB, $FB, $FA, $FA, $F9, $F9, $F8, $F8
#_07EBFA: db $F7, $F7, $F6, $F6, $F5, $F5, $F4, $F3
#_07EC02: db $F3, $F2, $F1, $F1, $F0, $EF, $EE, $EE
#_07EC0A: db $ED, $EC, $EB, $EA, $E9, $E9, $E8, $E7
#_07EC12: db $E6, $E5, $E4, $E3, $E2, $E1, $DF, $DE
#_07EC1A: db $DD, $DC, $DB, $DA, $D8, $D7, $D6, $D5
#_07EC22: db $D3, $D2, $D0, $CF, $CD, $CC, $CA, $C9
#_07EC2A: db $C7, $C6, $C4, $C2, $C1, $BF, $BD, $BB
#_07EC32: db $B9, $B7, $B6, $B4, $B1, $AF, $AD, $AB
#_07EC3A: db $A9, $A7, $A4, $A2, $9F, $9D, $9A, $97
#_07EC42: db $95, $92, $8F, $8C, $89, $86, $82, $7F
#_07EC4A: db $7B, $78, $74, $70, $6C, $67, $63, $5E
#_07EC52: db $59, $53, $4D, $46, $3F, $37, $2D, $1F
#_07EC5A: db $00

.multiplier_closed
#_07EC5B: db $FF, $FF, $FF, $FF, $FF, $FF, $FE, $FE
#_07EC63: db $FD, $FD, $FC, $FC, $FB, $FA, $F9, $F8
#_07EC6B: db $F7, $F6, $F5, $F4, $F3, $F1, $F0, $EE
#_07EC73: db $ED, $EB, $E9, $E8, $E6, $E4, $E2, $DF
#_07EC7B: db $DD, $DB, $D8, $D6, $D3, $D0, $CD, $CA
#_07EC83: db $C7, $C4, $C1, $BD, $B9, $B6, $B1, $AD
#_07EC8B: db $A9, $A4, $9F, $9A, $95, $8F, $89, $82
#_07EC93: db $7B, $74, $6C, $63, $59, $4D, $3F, $2D
#_07EC9B: db $00, $00, $00, $00, $00, $00, $00, $00
#_07ECA3: db $00, $00, $00, $00, $00, $00, $00, $00
#_07ECAB: db $00, $00, $00, $00, $00, $00, $00, $00
#_07ECB3: db $00, $00, $00, $00, $00, $00, $00, $00
#_07ECBB: db $00, $00, $00, $00, $00, $00, $00, $00
#_07ECC3: db $00, $00, $00, $00, $00, $00, $00, $00
#_07ECCB: db $00, $00, $00, $00, $00, $00, $00, $00
#_07ECD3: db $00, $00, $00, $00, $00, $00, $00, $00
#_07ECDB: db $00

pool off

;---------------------------------------------------------------------------------------------------

DesertHDMA_CalculateIrisShapeLine:
#_07ECDC: SEP #$30

#_07ECDE: LDA.w $067A
#_07ECE1: STA.w WRDIVH
#_07ECE4: STZ.w WRDIVL

#_07ECE7: LDA.w $067C
#_07ECEA: STA.w WRDIVB

#_07ECED: NOP
#_07ECEE: NOP
#_07ECEF: NOP
#_07ECF0: NOP
#_07ECF1: NOP
#_07ECF2: NOP

#_07ECF3: REP #$20

#_07ECF5: LDA.w RDDIV
#_07ECF8: LSR A

#_07ECF9: SEP #$20

#_07ECFB: TAX

#_07ECFC: LDY.w .multiplier_closed,X

#_07ECFF: LDA.w $067E
#_07ED02: BEQ .not_opening

#_07ED04: LDY.w .multiplier_opening,X

.not_opening
#_07ED07: STY.b $06
#_07ED09: STY.w WRMPYA

#_07ED0C: LDA.w $067C
#_07ED0F: STA.w WRMPYB

#_07ED12: NOP
#_07ED13: NOP
#_07ED14: NOP
#_07ED15: NOP

#_07ED16: LDA.w RDMPYH
#_07ED19: STA.b $08

#_07ED1B: STZ.b $09
#_07ED1D: STZ.b $07

#_07ED1F: REP #$30

#_07ED21: LDA.w $067E
#_07ED24: AND.w #$00FF
#_07ED27: BEQ .exit

#_07ED29: ASL.b $08

.exit
#_07ED2B: RTS

;===================================================================================================

FindFreeMovingBlockSlot:
#_07ED2C: LDX.b #$01

.next
#_07ED2E: LDA.w $05FC,X
#_07ED31: BNE .taken

#_07ED33: TYA
#_07ED34: INC A
#_07ED35: STA.w $05FC,X

#_07ED38: CLC

#_07ED39: RTS

.taken
#_07ED3A: DEX
#_07ED3B: BPL .next

#_07ED3D: SEC

#_07ED3E: RTS

;===================================================================================================

InitializePushBlock:
#_07ED3F: PHX

#_07ED40: STX.b $72

#_07ED42: LDA.b $0E
#_07ED44: PHA

#_07ED45: REP #$20

#_07ED47: LDA.w $0540,X
#_07ED4A: AND.w #$007E
#_07ED4D: ASL A
#_07ED4E: ASL A
#_07ED4F: STA.b $00

#_07ED51: LDA.w $0540,X
#_07ED54: AND.w #$1F80
#_07ED57: LSR A
#_07ED58: LSR A
#_07ED59: LSR A
#_07ED5A: LSR A
#_07ED5B: STA.b $02

#_07ED5D: SEP #$20

#_07ED5F: LDA.b $0E
#_07ED61: ASL A
#_07ED62: TAX

#_07ED63: LDA.b $00
#_07ED65: STA.w $05E4,X

#_07ED68: LDA.b $01
#_07ED6A: CLC
#_07ED6B: ADC.w $062D
#_07ED6E: STA.w $05E0,X
#_07ED71: STA.b $01

#_07ED73: LDA.b $02
#_07ED75: STA.w $05F0,X

#_07ED78: LDA.b $03
#_07ED7A: CLC
#_07ED7B: ADC.w $062F
#_07ED7E: STA.w $05EC,X
#_07ED81: STA.b $03

#_07ED83: STZ.w $05E8,X
#_07ED86: STZ.w $05F4,X

#_07ED89: LDA.b $AE
#_07ED8B: CMP.b #$26
#_07ED8D: BEQ .dont_push

#_07ED8F: LDX.b $72

#_07ED91: LDA.w $0500,X
#_07ED94: BNE .dont_push

#_07ED96: LDY.b #$00
#_07ED98: JSR PushBlock_AttemptToPushTheBlock
#_07ED9B: BCC .do_the_push

.dont_push
#_07ED9D: PLA
#_07ED9E: TAX

#_07ED9F: STZ.w $05FC,X

#_07EDA2: PLX

#_07EDA3: SEC

#_07EDA4: RTS

;---------------------------------------------------------------------------------------------------

.do_the_push
#_07EDA5: LDA.b #$22 ; SFX2.22
#_07EDA7: JSR PlaySFX_Set2

#_07EDAA: PLA
#_07EDAB: STA.b $0E

#_07EDAD: PLX

#_07EDAE: LDA.b #$01
#_07EDB0: STA.w $0500,X

#_07EDB3: CLC

#_07EDB4: RTS

;===================================================================================================

PushBlock_Slide:
#_07EDB5: SEP #$30

#_07EDB7: PHB
#_07EDB8: PHK
#_07EDB9: PLB

#_07EDBA: LDA.b $11
#_07EDBC: BNE .exit

#_07EDBE: STY.b $00

#_07EDC0: LDX.b #$01

#_07EDC2: LDA.w $05FC,X
#_07EDC5: DEC A
#_07EDC6: ASL A
#_07EDC7: CMP.b $00
#_07EDC9: BEQ .matched

#_07EDCB: LDX.b #$00

.matched
#_07EDCD: TXA
#_07EDCE: ASL A
#_07EDCF: TAY

#_07EDD0: LDA.b #$09
#_07EDD2: STA.w $02C4
#_07EDD5: STZ.w $02C3

#_07EDD8: JSR PushBlock_ApplyVelocity

#_07EDDB: LDA.w $05F0,Y
#_07EDDE: STA.b $72

#_07EDE0: LDA.w $05EC,Y
#_07EDE3: STA.b $73

#_07EDE5: LDA.w $05E4,Y
#_07EDE8: STA.b $74

#_07EDEA: LDA.w $05E0,Y
#_07EDED: STA.b $75

#_07EDEF: JSR PushBlock_HandleCollision

.exit
#_07EDF2: PLB

#_07EDF3: RTL

;===================================================================================================

pool PushBlock_HandleFalling

.fall_timer
#_07EDF4: db $09, $09, $09, $09, $09

pool off

;---------------------------------------------------------------------------------------------------

PushBlock_HandleFalling:
#_07EDF9: SEP #$30

#_07EDFB: PHB
#_07EDFC: PHK
#_07EDFD: PLB

#_07EDFE: PHY

#_07EDFF: STY.b $0E

#_07EE01: DEC.w $02C4
#_07EE04: BPL .exit

#_07EE06: INC.w $02C3

#_07EE09: LDX.w $02C3

#_07EE0C: LDA.w .fall_timer,X
#_07EE0F: STA.w $02C4

#_07EE12: CPX.b #$04
#_07EE14: BNE .exit

#_07EE16: TYX

#_07EE17: STZ.w $0500,X

#_07EE1A: STZ.w $02C3

#_07EE1D: LDX.b #$01

#_07EE1F: LDA.w $05FC,X
#_07EE22: DEC A
#_07EE23: ASL A
#_07EE24: CMP.b $0E
#_07EE26: BEQ .matched

#_07EE28: LDX.b #$00

.matched
#_07EE2A: STZ.w $05FC,X

.exit
#_07EE2D: PLY

#_07EE2E: PLB

#_07EE2F: RTL

;===================================================================================================

pool PushBlock_ApplyVelocity

.block_speed
#_07EE30: db $0C

.direction_mask
#_07EE31: db $08, $04, $02, $01

pool off

;---------------------------------------------------------------------------------------------------

PushBlock_ApplyVelocity:
#_07EE35: STZ.b $27
#_07EE37: STZ.b $28

#_07EE39: LDA.w .block_speed
#_07EE3C: STA.b $0A
#_07EE3E: STA.b $0B

#_07EE40: LDA.b #$03
#_07EE42: STA.b $0C

#_07EE44: LDA.b #$02
#_07EE46: STA.b $0D

#_07EE48: LDA.w $05F8,Y
#_07EE4B: LSR A
#_07EE4C: TAX

#_07EE4D: LDA.w .direction_mask,X
#_07EE50: STA.b $00

;---------------------------------------------------------------------------------------------------

#_07EE52: LDX.b #$01

.next_direction_check
#_07EE54: LDA.b $00
#_07EE56: AND.b $0C
#_07EE58: BEQ .skip_direction

#_07EE5A: AND.b $0D
#_07EE5C: BEQ .direction_positive

#_07EE5E: LDA.b $0A,X
#_07EE60: EOR.b #$FF
#_07EE62: INC A
#_07EE63: STA.b $0A,X

.direction_positive
#_07EE65: LDA.b $0A,X
#_07EE67: STA.b $27,X

#_07EE69: BRA .direction_found

;---------------------------------------------------------------------------------------------------

.skip_direction
#_07EE6B: ASL.b $0C
#_07EE6D: ASL.b $0C

#_07EE6F: ASL.b $0D
#_07EE71: ASL.b $0D

#_07EE73: DEX
#_07EE74: BPL .next_direction_check

;---------------------------------------------------------------------------------------------------

.direction_found
#_07EE76: LDA.b $27,X

#_07EE78: ASL A
#_07EE79: ASL A
#_07EE7A: ASL A
#_07EE7B: ASL A

#_07EE7C: CLC
#_07EE7D: ADC.w $05F4,Y
#_07EE80: STA.w $05F4,Y

#_07EE83: PHP

#_07EE84: CPX.b #$01
#_07EE86: BEQ .push_block_horizontally

#_07EE88: LDX.b #$00

#_07EE8A: LDA.b $27

#_07EE8C: LSR A
#_07EE8D: LSR A
#_07EE8E: LSR A
#_07EE8F: LSR A

#_07EE90: CMP.b #$08
#_07EE92: BCC .pushing_down

#_07EE94: ORA.b #$F0
#_07EE96: LDX.b #$FF

.pushing_down
#_07EE98: PLP
#_07EE99: ADC.w $05F0,Y
#_07EE9C: STA.w $05F0,Y

#_07EE9F: TXA
#_07EEA0: ADC.w $05EC,Y
#_07EEA3: STA.w $05EC,Y

#_07EEA6: LDA.w $05F0,Y
#_07EEA9: AND.b #$0F
#_07EEAB: BRA .compare_to_target

;---------------------------------------------------------------------------------------------------

.push_block_horizontally
#_07EEAD: LDX.b #$00

#_07EEAF: LDA.b $28
#_07EEB1: LSR A
#_07EEB2: LSR A
#_07EEB3: LSR A
#_07EEB4: LSR A
#_07EEB5: CMP.b #$08
#_07EEB7: BCC .pushing_right

#_07EEB9: ORA.b #$F0

#_07EEBB: LDX.b #$FF

.pushing_right
#_07EEBD: PLP
#_07EEBE: ADC.w $05E4,Y
#_07EEC1: STA.w $05E4,Y

#_07EEC4: TXA
#_07EEC5: ADC.w $05E0,Y
#_07EEC8: STA.w $05E0,Y

#_07EECB: LDA.w $05E4,Y
#_07EECE: AND.b #$0F

;---------------------------------------------------------------------------------------------------

.compare_to_target
#_07EED0: TYX

#_07EED1: CMP.w $05E8,X
#_07EED4: BNE .not_at_target

#_07EED6: TXA
#_07EED7: LSR A
#_07EED8: TAX

#_07EED9: LDA.w $05FC,X
#_07EEDC: DEC A
#_07EEDD: ASL A
#_07EEDE: TAX

#_07EEDF: INC.w $0500,X

#_07EEE2: LDA.b $50
#_07EEE4: AND.b #$FB
#_07EEE6: STA.b $50

#_07EEE8: LDA.b $48
#_07EEEA: AND.b #$FB
#_07EEEC: STA.b $48

;---------------------------------------------------------------------------------------------------

.not_at_target
#_07EEEE: SEP #$20

#_07EEF0: LDA.w $05E4,Y
#_07EEF3: STA.b $00

#_07EEF5: LDA.w $05E0,Y
#_07EEF8: STA.b $01

#_07EEFA: LDA.w $05F0,Y
#_07EEFD: STA.b $02

#_07EEFF: LDA.w $05EC,Y
#_07EF02: STA.b $03

;---------------------------------------------------------------------------------------------------

#_07EF04: PHX

#_07EF05: LDX.b #$0F

.next_sprite
#_07EF07: LDA.w $0DD0,X
#_07EF0A: CMP.b #$09
#_07EF0C: BCC .skip_sprite

#_07EF0E: LDA.w $0D10,X
#_07EF11: STA.b $04

#_07EF13: LDA.w $0D30,X
#_07EF16: STA.b $05

#_07EF18: LDA.w $0D00,X
#_07EF1B: STA.b $06

#_07EF1D: LDA.w $0D20,X
#_07EF20: STA.b $07

#_07EF22: REP #$20

#_07EF24: LDA.b $00
#_07EF26: SEC
#_07EF27: SBC.b $04
#_07EF29: CLC
#_07EF2A: ADC.w #$0010
#_07EF2D: CMP.w #$0020
#_07EF30: BCS .skip_sprite

#_07EF32: LDA.b $02
#_07EF34: SEC
#_07EF35: SBC.b $06
#_07EF37: CLC
#_07EF38: ADC.w #$0010
#_07EF3B: CMP.w #$0020
#_07EF3E: BCS .skip_sprite

#_07EF40: SEP #$20

#_07EF42: LDA.b #$08
#_07EF44: STA.w $0EA0,X

#_07EF47: PHY

#_07EF48: LDA.w $05F8,Y
#_07EF4B: LSR A
#_07EF4C: TAY

#_07EF4D: LDA.w .recoil_x,Y
#_07EF50: STA.w $0F40,X

#_07EF53: LDA.w .recoil_y,Y
#_07EF56: STA.w $0F30,X

#_07EF59: PLY

.skip_sprite
#_07EF5A: SEP #$20

#_07EF5C: DEX
#_07EF5D: BPL .next_sprite

#_07EF5F: PLX

#_07EF60: RTS

;---------------------------------------------------------------------------------------------------

.recoil_x
#_07EF61: db   0 ; up
#_07EF62: db   0 ; down
#_07EF63: db -32 ; left
#_07EF64: db  32 ; right

.recoil_y
#_07EF65: db -32 ; up
#_07EF66: db  32 ; down
#_07EF67: db   0 ; left
#_07EF68: db   0 ; right

;===================================================================================================

pool PushBlock_HandleCollision

.link_offset_on_axis
#_07EF69: dw $0008 ; up
#_07EF6B: dw $0018 ; down
#_07EF6D: dw $0000 ; left
#_07EF6F: dw $0010 ; right

.link_offset_perpendicular_bottom
#_07EF71: dw $0000 ; up
#_07EF73: dw $0000 ; down
#_07EF75: dw $0008 ; left
#_07EF77: dw $0008 ; right

.link_offset_perpendicular_top
#_07EF79: dw $000F ; up
#_07EF7B: dw $000F ; down
#_07EF7D: dw $0017 ; left
#_07EF7F: dw $0017 ; right

.block_offset_on_axis
#_07EF81: dw $000F ; up
#_07EF83: dw $0000 ; down
#_07EF85: dw $000F ; left
#_07EF87: dw $0000 ; right

.block_offset_perpendicular_bottom
#_07EF89: dw $0000 ; up
#_07EF8B: dw $0000 ; down
#_07EF8D: dw $0000 ; left
#_07EF8F: dw $0000 ; right

.block_offset_perpendicular_top
#_07EF91: dw $000F ; up
#_07EF93: dw $000F ; down
#_07EF95: dw $000F ; left
#_07EF97: dw $000F ; right

;---------------------------------------------------------------------------------------------------

.link_coord_address_on_axis
#_07EF99: dw $0020 ; up
#_07EF9B: dw $0020 ; down
#_07EF9D: dw $0022 ; left
#_07EF9F: dw $0022 ; right

.link_coord_address_perpendicular
#_07EFA1: dw $0022 ; up
#_07EFA3: dw $0022 ; down
#_07EFA5: dw $0020 ; left
#_07EFA7: dw $0020 ; right

;---------------------------------------------------------------------------------------------------

.block_coords_address_on_axis
#_07EFA9: dw $0072 ; up
#_07EFAB: dw $0072 ; down
#_07EFAD: dw $0074 ; left
#_07EFAF: dw $0074 ; right

.block_coords_address_perpendicular
#_07EFB1: dw $0074 ; up
#_07EFB3: dw $0074 ; down
#_07EFB5: dw $0072 ; left
#_07EFB7: dw $0072 ; right

pool off

;---------------------------------------------------------------------------------------------------

PushBlock_HandleCollision:
#_07EFB9: PHY

#_07EFBA: STY.b $0E
#_07EFBC: STZ.b $0F

#_07EFBE: LDA.b $21
#_07EFC0: STA.b $40

#_07EFC2: LDA.b $23
#_07EFC4: STA.b $41

#_07EFC6: REP #$20

#_07EFC8: LDA.b $67
#_07EFCA: AND.w #$000F

#_07EFCD: LDY.b #$06

.check_next_bit
#_07EFCF: LSR A
#_07EFD0: BCS .direction_match

#_07EFD2: DEY
#_07EFD3: DEY
#_07EFD4: BPL .check_next_bit

#_07EFD6: BRL .no_pushback

;---------------------------------------------------------------------------------------------------

.direction_match
#_07EFD9: LDA.b $0E
#_07EFDB: PHA

#_07EFDC: LDA.w .link_coord_address_perpendicular,Y
#_07EFDF: STA.b $0C

#_07EFE1: LDA.w .block_coords_address_perpendicular,Y
#_07EFE4: STA.b $0E

#_07EFE6: LDA.b ($0C)
#_07EFE8: CLC
#_07EFE9: ADC.w .link_offset_perpendicular_bottom,Y
#_07EFEC: STA.b $00

#_07EFEE: LDA.b ($0C)
#_07EFF0: CLC
#_07EFF1: ADC.w .link_offset_perpendicular_top,Y
#_07EFF4: STA.b $02

#_07EFF6: LDA.b ($0E)
#_07EFF8: CLC
#_07EFF9: ADC.w .block_offset_perpendicular_bottom,Y
#_07EFFC: STA.b $04

#_07EFFE: LDA.b ($0E)
#_07F000: CLC
#_07F001: ADC.w .block_offset_perpendicular_top,Y
#_07F004: STA.b $06

;---------------------------------------------------------------------------------------------------

#_07F006: LDA.w .link_coord_address_on_axis,Y
#_07F009: STA.b $0C

#_07F00B: LDA.w .block_coords_address_on_axis,Y
#_07F00E: STA.b $0E

#_07F010: LDA.b ($0C)
#_07F012: CLC
#_07F013: ADC.w .link_offset_on_axis,Y
#_07F016: STA.b $08

#_07F018: LDA.b ($0E)
#_07F01A: CLC
#_07F01B: ADC.w .block_offset_on_axis,Y
#_07F01E: STA.b $0A

;---------------------------------------------------------------------------------------------------

#_07F020: LDA.b $48
#_07F022: AND.w #$FFFB
#_07F025: STA.b $48

#_07F027: PLA
#_07F028: STA.b $0E

#_07F02A: LDA.b $00
#_07F02C: CMP.b $04
#_07F02E: BCC .not_in_block_on_axis

#_07F030: CMP.b $06
#_07F032: BCC .in_block_on_axis

.not_in_block_on_axis
#_07F034: LDA.b $02
#_07F036: CMP.b $04
#_07F038: BCC .no_pushback

#_07F03A: CMP.b $06
#_07F03C: BCS .no_pushback

;---------------------------------------------------------------------------------------------------

.in_block_on_axis
#_07F03E: PHY
#_07F03F: PHX

#_07F040: LDX.b $0E

#_07F042: LDA.b $2F
#_07F044: AND.w #$00FF
#_07F047: CMP.w $05F8,X
#_07F04A: BNE .direction_mismatch

#_07F04C: LDY.b #$01

#_07F04E: TXA
#_07F04F: LSR A
#_07F050: TAX

#_07F051: LDA.w $05FC,X
#_07F054: BEQ .dont_flag_pushing_block

#_07F056: LDY.b #$04

.dont_flag_pushing_block
#_07F058: TYA
#_07F059: AND.w #$00FF
#_07F05C: TSB.b $48

;---------------------------------------------------------------------------------------------------

.direction_mismatch
#_07F05E: PLX
#_07F05F: PLY

#_07F060: TYA
#_07F061: AND.w #$0002
#_07F064: BEQ .pushing_up_or_left

#_07F066: LDA.b $08
#_07F068: SEC
#_07F069: SBC.b $0A
#_07F06B: BCC .no_pushback

#_07F06D: CMP.w #$0008
#_07F070: BCS .no_pushback

#_07F072: EOR.w #$FFFF
#_07F075: INC A
#_07F076: STA.b $00

#_07F078: CLC
#_07F079: ADC.b ($0C)
#_07F07B: STA.b ($0C)

#_07F07D: BRA .set_axis

;---------------------------------------------------------------------------------------------------

.pushing_up_or_left
#_07F07F: LDA.b $08
#_07F081: SEC
#_07F082: SBC.b $0A
#_07F084: CMP.w #$FFF8
#_07F087: BCC .no_pushback

#_07F089: EOR.w #$FFFF
#_07F08C: INC A
#_07F08D: STA.b $00

#_07F08F: CLC
#_07F090: ADC.b ($0C)
#_07F092: STA.b ($0C)

;---------------------------------------------------------------------------------------------------

.set_axis
#_07F094: SEP #$20

#_07F096: LDX.b #$00

#_07F098: TYA
#_07F099: AND.b #$04
#_07F09B: BEQ .vertical

#_07F09D: INX

.vertical
#_07F09E: LDA.b $30,X
#_07F0A0: CLC
#_07F0A1: ADC.b $00
#_07F0A3: STA.b $30,X

;---------------------------------------------------------------------------------------------------

.no_pushback
#_07F0A5: SEP #$20

#_07F0A7: JSR HandleIndoorCameraAndDoors

#_07F0AA: PLY

#_07F0AB: RTS

;===================================================================================================

Underworld_DrawAllPushBlocks:
#_07F0AC: PHB
#_07F0AD: PHK
#_07F0AE: PLB

#_07F0AF: LDA.w $05FC
#_07F0B2: ORA.w $05FD
#_07F0B5: BEQ .exit

#_07F0B7: LDX.b #$01

.next
#_07F0B9: LDA.w $05FC,X
#_07F0BC: BEQ .skip

#_07F0BE: TXA
#_07F0BF: ASL A
#_07F0C0: TAY

#_07F0C1: PHX

#_07F0C2: JSR Underworld_DrawSinglePushBlock

#_07F0C5: PLX

.skip
#_07F0C6: DEX
#_07F0C7: BPL .next

.exit
#_07F0C9: PLB

#_07F0CA: RTL

;===================================================================================================

pool Underworld_DrawSinglePushBlock

.unreachable
#_07F0CB: db $0C

.step
#_07F0CC: db  12,  12,  12, $FF

.index
#_07F0D0: db   0,   1,   2,   3
#_07F0D4: db   4,   0,   0,   0
#_07F0D8: db   0

pool off

;---------------------------------------------------------------------------------------------------

Underworld_DrawSinglePushBlock:
#_07F0D9: PHY

#_07F0DA: LDA.b #$04
#_07F0DC: JSL SpriteDraw_AllocateOAMFromRegionB

#_07F0E0: PLY

#_07F0E1: LDA.w $05F0,Y
#_07F0E4: STA.b $00

#_07F0E6: LDA.w $05EC,Y
#_07F0E9: STA.b $01

#_07F0EB: LDA.w $05E4,Y
#_07F0EE: STA.b $02

#_07F0F0: LDA.w $05E0,Y
#_07F0F3: STA.b $03

#_07F0F5: REP #$20

#_07F0F7: LDA.b $00
#_07F0F9: SEC
#_07F0FA: SBC.b $E8
#_07F0FC: DEC A
#_07F0FD: STA.b $00

#_07F0FF: LDA.b $02
#_07F101: SEC
#_07F102: SBC.b $E2
#_07F104: STA.b $02

#_07F106: SEP #$20

#_07F108: PHY

#_07F109: LDY.w $02C3

#_07F10C: LDA.w .index,Y
#_07F10F: TAX

#_07F110: LDY.b #$00

#_07F112: LDA.w .step,X
#_07F115: CMP.b #$FF
#_07F117: BNE .draw

#_07F119: BRA .exit

;---------------------------------------------------------------------------------------------------

.draw
#_07F11B: XBA

#_07F11C: LDA.b $02
#_07F11E: STA.b ($90),Y

#_07F120: INY
#_07F121: LDA.b $00
#_07F123: STA.b ($90),Y

#_07F125: INY
#_07F126: XBA
#_07F127: STA.b ($90),Y

#_07F129: INY
#_07F12A: LDA.b #$20
#_07F12C: STA.b ($90),Y

#_07F12E: INY

#_07F12F: TYA

#_07F130: SEC
#_07F131: SBC.b #$04

#_07F133: LSR A
#_07F134: LSR A

#_07F135: TAY

#_07F136: LDA.b #$02
#_07F138: STA.b ($92),Y

;---------------------------------------------------------------------------------------------------

.exit
#_07F13A: PLY

#_07F13B: RTS

;===================================================================================================

Link_Initialize:
#_07F13C: PHB
#_07F13D: PHK
#_07F13E: PLB

#_07F13F: LDA.b #$02
#_07F141: STA.b $2F

#_07F143: STZ.b $26

#_07F145: STZ.w $0301
#_07F148: STZ.w $037A

#_07F14B: STZ.w $020B

#_07F14E: STZ.w $0350

#_07F151: STZ.w $030D
#_07F154: STZ.w $030E

#_07F157: STZ.w $030A
#_07F15A: STZ.w $02E1

#_07F15D: STZ.b $3B

#_07F15F: LDA.b $3A
#_07F161: AND.b #$BF
#_07F163: STA.b $3A

#_07F165: STZ.w $0308
#_07F168: STZ.w $0309
#_07F16B: STZ.w $0376

#_07F16E: JSL Link_ResetSwimmingState

#_07F172: LDA.b $50
#_07F174: AND.b #$FE
#_07F176: STA.b $50

#_07F178: STZ.b $25
#_07F17A: STZ.b $4D
#_07F17C: STZ.b $46

#_07F17E: STZ.w $031F
#_07F181: STZ.w $0360
#_07F184: STZ.w $02DA

#_07F187: STZ.b $55

#_07F189: JSR Link_ForceUnequipCape_quietly
#_07F18C: JSR Link_ResetSwordAndItemUsage

#_07F18F: STZ.w $037B
#_07F192: STZ.w $0300

#_07F195: LDA.b $67
#_07F197: AND.b #$F0
#_07F199: STA.b $67

#_07F19B: STZ.w $02F5
#_07F19E: STZ.w $0079

#_07F1A1: PLB

#_07F1A2: RTL

;===================================================================================================

Link_ResetProperties_A:
#_07F1A3: STZ.b $26
#_07F1A5: STZ.b $67

#_07F1A7: STZ.w $031F
#_07F1AA: STZ.w $034A

#_07F1AD: JSL Link_ResetSwimmingState

#_07F1B1: STZ.w $02E1
#_07F1B4: STZ.w $031F
#_07F1B7: STZ.w $03DB
#_07F1BA: STZ.w $02E0

#_07F1BD: STZ.b $56

#_07F1BF: STZ.w $03F5
#_07F1C2: STZ.w $03F7
#_07F1C5: STZ.w $03FC
#_07F1C8: STZ.w $03F8
#_07F1CB: STZ.w $03FA

#_07F1CE: STZ.w $03E9
#_07F1D1: STZ.w $0373
#_07F1D4: STZ.w $031E

#_07F1D7: STZ.w $02F2
#_07F1DA: STZ.w $02F8

#_07F1DD: STZ.w $02EA
#_07F1E0: STZ.w $02E9

#_07F1E3: STZ.w $02DB

;===================================================================================================

Link_ResetProperties_B:
#_07F1E6: STZ.w $02F5

#_07F1E9: STZ.w $0079
#_07F1EC: STZ.w $0302
#_07F1EF: STZ.w $02F4

#_07F1F2: STZ.b $48

#_07F1F4: STZ.b $5A
#_07F1F6: STZ.b $5B
#_07F1F8: STZ.b $5B

;===================================================================================================

Link_ResetProperties_C:
#_07F1FA: STZ.w $036C

#_07F1FD: STZ.w $031C
#_07F200: STZ.w $031D

#_07F203: STZ.w $0315
#_07F206: STZ.w $03EF

#_07F209: STZ.w $02E3
#_07F20C: STZ.w $02F6

#_07F20F: STZ.w $0301
#_07F212: STZ.w $037A

#_07F215: STZ.w $020B

#_07F218: STZ.w $0350

#_07F21B: STZ.w $030D
#_07F21E: STZ.w $030E
#_07F221: STZ.w $030A

#_07F224: STZ.b $3B
#_07F226: STZ.b $3A
#_07F228: STZ.b $3C

#_07F22A: STZ.w $0308
#_07F22D: STZ.w $0309

#_07F230: STZ.w $0376

#_07F233: STZ.b $50
#_07F235: STZ.b $4D
#_07F237: STZ.b $46

#_07F239: STZ.w $0360
#_07F23C: STZ.w $02DA

#_07F23F: STZ.b $55

#_07F241: JSR Link_ResetSwordAndItemUsage

#_07F244: STZ.w $037B
#_07F247: STZ.w $0300
#_07F24A: STZ.w $037E

#_07F24D: STZ.w $02EC

#_07F250: STZ.w $0314
#_07F253: STZ.w $03F8

#_07F256: STZ.w $02FA

#_07F259: RTL

;===================================================================================================

Link_AnimateIntraStairClimbAndSFX:
#_07F25A: PHB
#_07F25B: PHK
#_07F25C: PLB

#_07F25D: LDX.b #$09

.clear_sparkles
#_07F25F: LDA.w $0C4A,X
#_07F262: CMP.b #$0D ; ANCILLA 0D
#_07F264: BNE .not_a_sparkle

#_07F266: STZ.w $0C4A,X

.not_a_sparkle
#_07F269: DEX
#_07F26A: BPL .clear_sparkles

;---------------------------------------------------------------------------------------------------

#_07F26C: LDA.b $2E
#_07F26E: CMP.b #$05
#_07F270: BCC .dont_reset_anim_step

#_07F272: STZ.b $2E

.dont_reset_anim_step
#_07F274: STZ.b $2A
#_07F276: STZ.b $2B

#_07F278: STZ.w $030A

#_07F27B: LDA.b #$1C
#_07F27D: STA.w $0371

#_07F280: LDA.b #$20
#_07F282: STA.w $0378

#_07F285: LDA.b #$01
#_07F287: STA.w $037B

;---------------------------------------------------------------------------------------------------

#_07F28A: LDA.w $0462
#_07F28D: AND.b #$04
#_07F28F: BEQ .upwards_sfx

#_07F291: LDA.b #$18 ; SFX2.18
#_07F293: JSR PlaySFX_Set2

#_07F296: BRA .sfx_set

.upwards_sfx
#_07F298: LDA.b #$16 ; SFX2.16
#_07F29A: JSR PlaySFX_Set2

;---------------------------------------------------------------------------------------------------

.sfx_set
#_07F29D: STZ.b $01

#_07F29F: LDX.b #$10

#_07F2A1: LDA.w $0462
#_07F2A4: AND.b #$04
#_07F2A6: BEQ .going_up

#_07F2A8: LDX.b #$F1

#_07F2AA: LDA.b #$FF
#_07F2AC: STA.b $01

.going_up
#_07F2AE: STX.b $00

#_07F2B0: REP #$20

#_07F2B2: LDA.b $22
#_07F2B4: CLC
#_07F2B5: ADC.b $00
#_07F2B7: STA.b $53

#_07F2B9: LDA.b $20
#_07F2BB: STA.b $51

#_07F2BD: SEP #$20

#_07F2BF: PLB

#_07F2C0: RTL

;===================================================================================================

HandleLinkOnSpiralStairs:
#_07F2C1: REP #$20

#_07F2C3: LDA.b $22
#_07F2C5: STA.w $0FC2

#_07F2C8: LDA.b $20
#_07F2CA: STA.w $0FC4

#_07F2CD: SEP #$20

#_07F2CF: LDA.w $030A
#_07F2D2: BEQ .please_continue

#_07F2D4: RTL

;---------------------------------------------------------------------------------------------------

.please_continue
#_07F2D5: STZ.w $0373

#_07F2D8: STZ.b $46
#_07F2DA: STZ.b $4D

#_07F2DC: PHB
#_07F2DD: PHK
#_07F2DE: PLB

#_07F2DF: LDA.w $0462
#_07F2E2: AND.b #$04
#_07F2E4: BEQ .going_up_a

;---------------------------------------------------------------------------------------------------

.going_down_a
#_07F2E6: LDA.b #$FE
#_07F2E8: STA.b $27

#_07F2EA: DEC.w $0371
#_07F2ED: BPL .down_dont_reset

#_07F2EF: STZ.w $0371

#_07F2F2: LDA.b #$00
#_07F2F4: STA.b $27

#_07F2F6: LDA.b #$FE
#_07F2F8: STA.b $28

.down_dont_reset
#_07F2FA: BRA .continue_a

;---------------------------------------------------------------------------------------------------

.going_up_a
#_07F2FC: LDA.b #$FE
#_07F2FE: STA.b $27

#_07F300: DEC.w $0371
#_07F303: BPL .continue_a

#_07F305: STZ.w $0371

#_07F308: LDA.b #$FE
#_07F30A: STA.b $27

#_07F30C: LDA.b #$02
#_07F30E: STA.b $28

;---------------------------------------------------------------------------------------------------

.continue_a
#_07F310: JSL LinkHop_FindArbitraryLandingSpot
#_07F314: JSL Link_HandleMovingAnimation_StartWithDash

#_07F318: LDA.w $0371
#_07F31B: BNE .dont_reset_direction

#_07F31D: DEC.w $0378
#_07F320: BPL .dont_reset_direction

#_07F322: STZ.w $0378

#_07F325: LDX.b #$04

#_07F327: LDA.w $0462
#_07F32A: AND.b #$04
#_07F32C: BNE .not_going_down_a

#_07F32E: LDX.b #$06

.not_going_down_a
#_07F330: STX.b $2F

;---------------------------------------------------------------------------------------------------

.dont_reset_direction
#_07F332: LDA.b $22
#_07F334: SEC
#_07F335: SBC.b $53
#_07F337: BPL .positive_x

#_07F339: EOR.b #$FF
#_07F33B: INC A

.positive_x
#_07F33C: BNE .exit

#_07F33E: REP #$20

#_07F340: JSL RepositionLinkAfterSpiralStairs

#_07F344: SEP #$20

#_07F346: LDA.l $7EF3CC
#_07F34A: BEQ .no_follower

#_07F34C: JSL Follower_Initialize

.no_follower
#_07F350: LDA.b #$F8
#_07F352: STA.b $00

#_07F354: LDA.b #$FF
#_07F356: STA.b $01

#_07F358: LDA.w $0462
#_07F35B: AND.b #$04
#_07F35D: BNE .not_going_down_b

#_07F35F: LDA.b #$0C
#_07F361: STA.b $00
#_07F363: STZ.b $01

.not_going_down_b
#_07F365: REP #$20

#_07F367: LDA.b $22
#_07F369: CLC
#_07F36A: ADC.b $00
#_07F36C: STA.b $53

;---------------------------------------------------------------------------------------------------

#_07F36E: SEP #$20

#_07F370: LDA.b #$01
#_07F372: STA.w $030A

#_07F375: LDA.b #$06
#_07F377: STA.w $0378

#_07F37A: LDA.w $0462
#_07F37D: AND.b #$04
#_07F37F: BNE .different_stair_sound

;---------------------------------------------------------------------------------------------------

#_07F381: LDA.b #$17 ; SFX2.17
#_07F383: JSR PlaySFX_Set2

#_07F386: BRA .exit

.different_stair_sound
#_07F388: LDA.b #$19 ; SFX2.19
#_07F38A: JSR PlaySFX_Set2

;---------------------------------------------------------------------------------------------------

.exit
#_07F38D: SEP #$20

#_07F38F: PLB

#_07F390: RTL

;===================================================================================================

SpiralStairs_FindLandingSpot:
#_07F391: PHB
#_07F392: PHK
#_07F393: PLB

#_07F394: STZ.w $0373

#_07F397: STZ.b $46
#_07F399: STZ.b $4D

#_07F39B: STZ.w $037B

#_07F39E: REP #$20

#_07F3A0: LDA.b $22
#_07F3A2: STA.w $0FC2

#_07F3A5: LDA.b $20
#_07F3A7: STA.w $0FC4

#_07F3AA: SEP #$20

#_07F3AC: DEC.w $0378
#_07F3AF: BPL .dont_change_direction

#_07F3B1: STZ.w $0378

#_07F3B4: LDA.b #$02
#_07F3B6: STA.b $2F

.dont_change_direction
#_07F3B8: LDA.b #$00
#_07F3BA: STA.b $27

#_07F3BC: LDA.b #$04
#_07F3BE: STA.b $28

#_07F3C0: LDA.w $0462
#_07F3C3: AND.b #$04
#_07F3C5: BEQ .going_up

#_07F3C7: LDA.b #$02
#_07F3C9: STA.b $27

#_07F3CB: LDA.b #$FC
#_07F3CD: STA.b $28

;---------------------------------------------------------------------------------------------------

.going_up
#_07F3CF: LDA.w $030A
#_07F3D2: CMP.b #$02
#_07F3D4: BNE .dont_recoil

#_07F3D6: LDA.b #$10
#_07F3D8: STA.b $27
#_07F3DA: STZ.b $28

.dont_recoil
#_07F3DC: JSL LinkHop_FindArbitraryLandingSpot
#_07F3E0: JSL Link_HandleMovingAnimation_StartWithDash

#_07F3E4: LDA.b $22
#_07F3E6: CMP.b $53
#_07F3E8: BNE .exit

#_07F3EA: LDA.b #$02
#_07F3EC: STA.w $030A

.exit
#_07F3EF: SEP #$20

#_07F3F1: PLB

#_07F3F2: RTL

;===================================================================================================

LinkResetPushTimer:
#_07F3F3: PHB
#_07F3F4: PHK
#_07F3F5: PLB

#_07F3F6: LDA.b #$07
#_07F3F8: STA.w $0371

#_07F3FB: PLB

#_07F3FC: RTL

;===================================================================================================

UNREACHABLE_07F3FD:
#_07F3FD: PHB
#_07F3FE: PHK
#_07F3FF: PLB

#_07F400: REP #$20

#_07F402: LDA.b $22
#_07F404: STA.w $0FC2

#_07F407: LDA.b $20
#_07F409: STA.w $0FC4

#_07F40C: SEP #$20

#_07F40E: STZ.b $28

;---------------------------------------------------------------------------------------------------

#_07F410: LDY.b #$08

#_07F412: LDA.b $11
#_07F414: CMP.b #$12
#_07F416: BNE .set_recoil

#_07F418: LDY.b #$FE

#_07F41A: LDA.w $0462
#_07F41D: AND.b #$04
#_07F41F: BEQ .set_recoil

#_07F421: LDY.b #$FA

;---------------------------------------------------------------------------------------------------

.set_recoil
#_07F423: STY.b $27

#_07F425: JSL LinkHop_FindArbitraryLandingSpot
#_07F429: JSL Link_HandleMovingAnimation_StartWithDash

#_07F42D: PLB

#_07F42E: RTL

;===================================================================================================

HandleIndoorCameraAndDoors_long:
#_07F42F: PHB
#_07F430: PHK
#_07F431: PLB

#_07F432: PHX
#_07F433: JSR HandleIndoorCameraAndDoors
#_07F436: PLX

#_07F437: PLB

#_07F438: RTL

;===================================================================================================

Link_CheckForEdgeScreenTransition:
#_07F439: PHB
#_07F43A: PHK
#_07F43B: PLB

#_07F43C: LDA.b $5D

#_07F43E: CMP.b #$03 ; LINKSTATE 03
#_07F440: BEQ .prevent_transition

#_07F442: CMP.b #$08 ; LINKSTATE 08
#_07F444: BEQ .prevent_transition

#_07F446: CMP.b #$09 ; LINKSTATE 09
#_07F448: BEQ .prevent_transition

#_07F44A: CMP.b #$0A ; LINKSTATE 0A
#_07F44C: BEQ .prevent_transition

#_07F44E: LDA.b $46
#_07F450: BEQ .allow

;---------------------------------------------------------------------------------------------------

.prevent_transition
#_07F452: STZ.b $27
#_07F454: STZ.b $28

#_07F456: LDA.b #$03
#_07F458: STA.w $02C6

#_07F45B: REP #$20

#_07F45D: LDA.w $0FC2
#_07F460: STA.b $22

#_07F462: LDA.w $0FC4
#_07F465: STA.b $20

#_07F467: SEP #$20
#_07F469: SEC

#_07F46A: PLB

#_07F46B: RTL

;---------------------------------------------------------------------------------------------------

.allow
#_07F46C: CLC

#_07F46D: PLB

#_07F46E: RTL

;===================================================================================================

Follower_ValidateMessageFreedom:
#_07F46F: LDA.b $5D

#_07F471: CMP.b #$00 ; LINKSTATE 00
#_07F473: BEQ .do_check

#_07F475: CMP.b #$04 ; LINKSTATE 04
#_07F477: BEQ .do_check

#_07F479: CMP.b #$11 ; LINKSTATE 11
#_07F47B: BNE .fail

.do_check
#_07F47D: LDA.b $3A
#_07F47F: AND.b #$80
#_07F481: ORA.w $0377
#_07F484: ORA.w $0301
#_07F487: ORA.w $037A
#_07F48A: ORA.w $02EC
#_07F48D: ORA.w $0314
#_07F490: ORA.w $0308
#_07F493: ORA.w $0376
#_07F496: BNE .fail

.succeed
#_07F498: SEC

#_07F499: RTL

.fail
#_07F49A: CLC

#_07F49B: RTL

;===================================================================================================

TriforceRoom_LinkApproachTriforce:
#_07F49C: PHB
#_07F49D: PHK
#_07F49E: PLB

#_07F49F: LDA.b $20
#_07F4A1: CMP.b #$98
#_07F4A3: BCC .still_walking

#_07F4A5: CMP.b #$A9
#_07F4A7: BCS .keep_speed

#_07F4A9: LDA.b #$14
#_07F4AB: STA.b $5E

.keep_speed
#_07F4AD: LDA.b #$08

#_07F4AF: STA.b $67
#_07F4B1: STA.b $26

#_07F4B3: STZ.b $2F

#_07F4B5: LDA.b #$40
#_07F4B7: STA.b $3D

#_07F4B9: BRA .exit

.still_walking
#_07F4BB: STZ.b $2E
#_07F4BD: STZ.b $67
#_07F4BF: STZ.b $26

#_07F4C1: DEC.b $3D

#_07F4C3: LDA.b $3D
#_07F4C5: BNE .exit

#_07F4C7: LDA.b #$02
#_07F4C9: STA.w $02DA

#_07F4CC: INC.b $B0

.exit
#_07F4CE: PLB

#_07F4CF: RTL

;===================================================================================================

CheckIfLinkIsBusy:
#_07F4D0: PHX

#_07F4D1: LDA.b $4D
#_07F4D3: ORA.w $02DA
#_07F4D6: BNE .am_busy

#_07F4D8: LDA.w $0308
#_07F4DB: AND.b #$80
#_07F4DD: BNE .am_busy

;---------------------------------------------------------------------------------------------------

#_07F4DF: LDX.b #$04

.next_ancilla
#_07F4E1: LDA.w $0C4A,X
#_07F4E4: CMP.b #$27 ; ANCILLA 27
#_07F4E6: BEQ .am_busy

#_07F4E8: DEX
#_07F4E9: BPL .next_ancilla

;---------------------------------------------------------------------------------------------------

.am_free
#_07F4EB: PLX

#_07F4EC: CLC

#_07F4ED: RTL

;---------------------------------------------------------------------------------------------------

.am_busy
#_07F4EE: PLX

#_07F4EF: SEC

#_07F4F0: RTL

;===================================================================================================

Pipe_ValidateEntry:
#_07F4F1: LDX.b #$04

.next_ancilla
#_07F4F3: LDA.w $0C4A,X
#_07F4F6: CMP.b #$31 ; ANCILLA 31
#_07F4F8: BNE .skip_ancilla

#_07F4FA: STZ.w $037A
#_07F4FD: STZ.b $50

#_07F4FF: STZ.w $0C4A,X

#_07F502: BRA .continue

.skip_ancilla
#_07F504: DEX
#_07F505: BPL .next_ancilla

;---------------------------------------------------------------------------------------------------

.continue
#_07F507: LDA.w $0308
#_07F50A: AND.b #$80
#_07F50C: ORA.b $4D
#_07F50E: BNE .fail

.succeed
#_07F510: CLC

#_07F511: RTL

.fail
#_07F512: SEC

#_07F513: RTL

;===================================================================================================

CacheCameraPropertiesIfOutdoors:
#_07F514: LDA.b $1B
#_07F516: BNE .indoors

#_07F518: JSL CacheCameraProperties

.indoors
#_07F51C: RTS

;===================================================================================================

SignText_Overworld:
#_07F51D: dw $00A7, $00A7, $0048, $0040, $0040, $00A7, $00A7, $00A7
#_07F52D: dw $00A7, $00A7, $003C, $0040, $0040, $00A7, $00A7, $003E
#_07F53D: dw $003D, $0049, $0042, $0042, $00A7, $00A7, $003F, $00B0
#_07F54D: dw $003B, $003B, $00A7, $003B, $003B, $0044, $00A7, $00A7
#_07F55D: dw $003B, $003B, $00A7, $003B, $003B, $0045, $00A7, $00A7
#_07F56D: dw $00A7, $00A7, $00A7, $00A7, $00A7, $0041, $00A7, $00A7
#_07F57D: dw $00A7, $00A7, $00A7, $0042, $00A7, $0046, $0046, $00A7
#_07F58D: dw $00A7, $00A7, $0047, $0043, $00A7, $0046, $0046, $00A7

#_07F59D: dw $00A7, $00A7, $00A7, $00A7, $00A7, $00A7, $00A7, $00A7
#_07F5AD: dw $00A7, $00A7, $00A8, $00A7, $00A7, $00A7, $00A7, $00A9
#_07F5BD: dw $00A7, $00AA, $00AB, $00A7, $00A7, $00A7, $00A7, $00B1
#_07F5CD: dw $00AF, $00AF, $00A7, $00A7, $00A7, $00A7, $00A7, $00A7
#_07F5DD: dw $00AF, $00AF, $00A7, $00A7, $00A7, $00AC, $00A7, $00A7
#_07F5ED: dw $00A7, $00A7, $00A7, $00A7, $00A7, $00AD, $00A7, $00A7
#_07F5FD: dw $00A7, $00A7, $00A7, $00A7, $00A7, $00A7, $00A7, $00A7
#_07F60D: dw $00A7, $00A7, $00A7, $00AE, $00A7, $00A7, $00A7, $00A7

;===================================================================================================

SignText_Underworld:
#_07F61D: dw $00B4, $00B4, $00B4, $00C7
#_07F625: dw $00B4, $00B4, $00B4, $00B4
#_07F62D: dw $00B4, $00B4, $00B4, $00B4
#_07F635: dw $00B4, $00B4, $00C4, $00B4
#_07F63D: dw $00BE, $00B4, $00B4, $00B4
#_07F645: dw $00B4, $00B4, $00B4, $00B4
#_07F64D: dw $00B4, $00B4, $00B4, $00B4
#_07F655: dw $00B4, $00B4, $00B4, $00B4
#_07F65D: dw $00B4, $00B4, $00B4, $00B4
#_07F665: dw $00B4, $00B4, $00B4, $00B5
#_07F66D: dw $00B9, $00B4, $00B4, $00B4
#_07F675: dw $00B4, $00B4, $00B4, $00B4
#_07F67D: dw $00B4, $00B4, $00B4, $00B4
#_07F685: dw $00B4, $00B4, $00B4, $00B4
#_07F68D: dw $00B4, $00B4, $00B4, $00B4
#_07F695: dw $00B4, $00B4, $00C5, $00B4
#_07F69D: dw $00B4, $00B4, $00B4, $00B4
#_07F6A5: dw $00B4, $00B4, $00B4, $00B4
#_07F6AD: dw $00B4, $00B4, $00B4, $00BF
#_07F6B5: dw $00B4, $00B4, $00B4, $00B4
#_07F6BD: dw $00B4, $00B4, $00B4, $00B4
#_07F6C5: dw $00B4, $00B4, $00B9, $00B4
#_07F6CD: dw $00B4, $00B4, $00B4, $00B4
#_07F6D5: dw $00B4, $00B4, $00B4, $00B4
#_07F6DD: dw $00B4, $00B4, $00B4, $00B4
#_07F6E5: dw $00BA, $00B4, $00B4, $00B4
#_07F6ED: dw $00B4, $00B4, $00BF, $00B4
#_07F6F5: dw $00B4, $00B4, $00B4, $00B4
#_07F6FD: dw $00B4, $00B4, $00B4, $00C0
#_07F705: dw $00B4, $00B4, $00B4, $00C6
#_07F70D: dw $00B4, $00B4, $00B4, $00B4
#_07F715: dw $00C0, $00B4, $00C2, $00B4
#_07F71D: dw $00B4, $00B4, $00B4, $00B4
#_07F725: dw $00B4, $00B4, $00B4, $00B4
#_07F72D: dw $00B4, $00B4, $00B4, $00B4
#_07F735: dw $00B4, $00B4, $00B4, $00B4
#_07F73D: dw $00B4, $00B4, $00B4, $00B4
#_07F745: dw $00B4, $00B4, $00B4, $00BB
#_07F74D: dw $00B4, $00B4, $00B4, $00B4
#_07F755: dw $00B4, $00B4, $00B4, $00B4
#_07F75D: dw $00B4, $00B4, $00B4, $00B4
#_07F765: dw $00B4, $00B4, $00B4, $00B4
#_07F76D: dw $00B4, $00B4, $00B4, $00B4
#_07F775: dw $00B4, $00B4, $00B4, $00B4
#_07F77D: dw $00C1, $00B4, $00B4, $00B4
#_07F785: dw $00B4, $00B4, $00B4, $00B4
#_07F78D: dw $00B4, $00B4, $00B4, $00B4
#_07F795: dw $00B4, $00B4, $00B4, $00B4
#_07F79D: dw $00B4, $00B4, $00B4, $00B4
#_07F7A5: dw $00C3, $00B4, $00B4, $00B4
#_07F7AD: dw $00B4, $00B4, $00B4, $00B4
#_07F7B5: dw $00B4, $00B4, $00B4, $00B4
#_07F7BD: dw $00B4, $00B4, $00B4, $00B4
#_07F7C5: dw $00B4, $00B4, $00C3, $00B4
#_07F7CD: dw $00B4, $00B4, $00B4, $00B4
#_07F7D5: dw $00B4, $00B4, $00B4, $00B4
#_07F7DD: dw $00B4, $00B4, $00B4, $00B4
#_07F7E5: dw $00B4, $00B4, $00B4, $00B4
#_07F7ED: dw $00B4, $00B4, $00B8, $00B4
#_07F7F5: dw $00B4, $00B4, $00B4, $00B4
#_07F7FD: dw $00B4, $00B4, $00B4, $00B4
#_07F805: dw $00B4, $00B4, $00B4, $00B4
#_07F80D: dw $00B4, $00B4, $00B4, $00B4
#_07F815: dw $00B4, $00B4, $00B4, $00B4
#_07F81D: dw $00B4, $00B4, $00B4, $00B4
#_07F825: dw $00B4, $00B4, $00B4, $00B4
#_07F82D: dw $00B4, $00B4, $00B4, $00B4
#_07F835: dw $00B4, $00B5, $00B4, $00B4
#_07F83D: dw $00B4, $00B4, $00B4, $00B4
#_07F845: dw $00B4, $00B4, $00B4, $00B4
#_07F84D: dw $00B4, $00B4, $00B4, $00B4
#_07F855: dw $00B4, $00B4, $00B4, $00B4
#_07F85D: dw $00B4, $00B4, $00B4, $00B4
#_07F865: dw $00B4, $0179, $00B4, $00B4
#_07F86D: dw $00B4, $00B4, $00B4, $00B4
#_07F875: dw $00B4, $00B4, $00B4, $00B4
#_07F87D: dw $00B4, $00B4, $00B4, $00B4
#_07F885: dw $00B4, $00B4, $00B4, $00B4
#_07F88D: dw $00B4, $00B4, $00B4, $00B4
#_07F895: dw $00B4, $00B4, $00B4, $00B4

;===================================================================================================
; FREE ROM: 0x763
;===================================================================================================
NULL_07F89D:
#_07F89D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F8A5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F8AD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F8B5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F8BD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F8C5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F8CD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F8D5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F8DD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F8E5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F8ED: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F8F5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F8FD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F905: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F90D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F915: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F91D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F925: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F92D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F935: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F93D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F945: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F94D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F955: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F95D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F965: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F96D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F975: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F97D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F985: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F98D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F995: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F99D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F9A5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F9AD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F9B5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F9BD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F9C5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F9CD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F9D5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F9DD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F9E5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F9ED: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F9F5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07F9FD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA05: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA0D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA15: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA1D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA25: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA2D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA35: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA3D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA45: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA4D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA55: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA5D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA65: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA6D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA75: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA7D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA85: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA8D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA95: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FA9D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FAA5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FAAD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FAB5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FABD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FAC5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FACD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FAD5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FADD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FAE5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FAED: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FAF5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FAFD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB05: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB0D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB15: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB1D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB25: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB2D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB35: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB3D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB45: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB4D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB55: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB5D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB65: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB6D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB75: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB7D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB85: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB8D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB95: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FB9D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FBA5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FBAD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FBB5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FBBD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FBC5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FBCD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FBD5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FBDD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FBE5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FBED: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FBF5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FBFD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC05: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC0D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC15: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC1D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC25: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC2D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC35: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC3D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC45: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC4D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC55: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC5D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC65: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC6D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC75: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC7D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC85: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC8D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC95: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FC9D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FCA5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FCAD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FCB5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FCBD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FCC5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FCCD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FCD5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FCDD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FCE5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FCED: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FCF5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FCFD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD05: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD0D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD15: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD1D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD25: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD2D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD35: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD3D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD45: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD4D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD55: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD5D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD65: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD6D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD75: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD7D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD85: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD8D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD95: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FD9D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FDA5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FDAD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FDB5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FDBD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FDC5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FDCD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FDD5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FDDD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FDE5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FDED: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FDF5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FDFD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE05: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE0D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE15: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE1D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE25: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE2D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE35: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE3D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE45: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE4D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE55: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE5D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE65: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE6D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE75: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE7D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE85: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE8D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE95: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FE9D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FEA5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FEAD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FEB5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FEBD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FEC5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FECD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FED5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FEDD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FEE5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FEED: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FEF5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FEFD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF05: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF0D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF15: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF1D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF25: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF2D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF35: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF3D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF45: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF4D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF55: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF5D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF65: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF6D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF75: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF7D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF85: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF8D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF95: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FF9D: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FFA5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FFAD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FFB5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FFBD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FFC5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FFCD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FFD5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FFDD: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FFE5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FFED: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FFF5: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_07FFFD: db $FF, $FF, $FF

;===================================================================================================
